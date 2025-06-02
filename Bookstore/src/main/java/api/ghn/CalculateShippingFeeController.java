package api.ghn;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.cloudinary.json.JSONArray;
import org.cloudinary.json.JSONObject;
import vn.edu.hcmuaf.fit.bookstore.apighn.APIGHNConfig;
import vn.edu.hcmuaf.fit.bookstore.beans.Order.ShippingInfo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet(name = "CalculateShippingFeeController", value = "/api/ghn/calculate-shipping")
public class CalculateShippingFeeController extends HttpServlet {
    private static final String GHN_TOKEN = APIGHNConfig.getToken();
    private static final int SHOP_ID = APIGHNConfig.getShopId();
    private static final int FROM_DISTRICT_ID = APIGHNConfig.getShopDistrictId();
    private static final String FROM_WARD_CODE = APIGHNConfig.getShopWardCode();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(">>>> BAT DAU doPost");
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        String requestBody = sb.toString();

        JSONObject json = new JSONObject(requestBody);
        int toDistrictId = json.getInt("toDistrictId");
        String toWardCode = json.getString("toWardCode");
        System.out.println("TU: "+ FROM_DISTRICT_ID +" " + FROM_WARD_CODE + "DEN: " + toDistrictId + " " + toWardCode);

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("shippingInfo") == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thông tin vận chuyển không tồn tại trong session");
            System.out.println("Không tồn tại ShippingInfo trong session");
            return;
        }

        ShippingInfo info = (ShippingInfo) session.getAttribute("shippingInfo");
        if (info == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "shippingInfo không tồn tại trong session");
            System.err.println("shippingInfo is null in session.");
            return;
        }

        int weight = info.getTotalWeight();
        int length = info.getLength();
        int width = info.getWidth();
        int height = info.getHeight();
        int insuranceValue = info.getTotalPrice();

        System.out.println("Trong tinh phi ship: "+ FROM_DISTRICT_ID + " "+ FROM_WARD_CODE +" " +toDistrictId + " " + toWardCode
                + " " +info);

        // Gọi API GHN để lấy service_id từ available-services
        int serviceId = getAvailableServiceId(toDistrictId);
        if (serviceId == -1) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Không lấy được gói dịch vụ GHN");
            System.out.println("Không lấy được gói dịch vụ");
            return;
        }

        // Gọi API GHN để tính phí
        int shippingFee = calculateFee(serviceId, toDistrictId, toWardCode, weight, length, width, height, insuranceValue);
        if (shippingFee == -1) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Không tính được phí vận chuyển");
            System.out.println("Không tính được phí vận chuyển");
            return;
        }

        // Trả kết quả JSON
        JSONObject result = new JSONObject();
        result.put("fee", shippingFee);
        response.setContentType("application/json");
        response.getWriter().write(result.toString());
        session.setAttribute("latestShippingFee", shippingFee);
    }

    private int getAvailableServiceId(int toDistrictId) {
        try {
            URL url = new URL("https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/available-services");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("token", GHN_TOKEN);
            conn.setDoOutput(true);

            JSONObject payload = new JSONObject();
            payload.put("shop_id", SHOP_ID);
            payload.put("from_district", FROM_DISTRICT_ID);
            payload.put("to_district", toDistrictId);

            try (OutputStream os = conn.getOutputStream()) {
                os.write(payload.toString().getBytes());
            }

            System.out.println("Payload gui toi GHN (available-services): " + payload.toString());

            BufferedReader in = new BufferedReader(new java.io.InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            JSONObject jsonResponse = new JSONObject(response.toString());
            System.out.println("GHN response: " + response.toString());

//            JSONArray services = jsonResponse.getJSONArray("data");

            // Chọn gói dịch vụ đường bộ hàng nhẹ (tuỳ thuộc GHN response)
            if (jsonResponse.has("data") && jsonResponse.get("data") instanceof JSONArray) {
                JSONArray services = jsonResponse.getJSONArray("data");
                for (int i = 0; i < services.length(); i++) {
                    JSONObject service = services.getJSONObject(i);
                    int serviceTypeId = service.getInt("service_type_id");
                    if (serviceTypeId == 2) {
                        return service.getInt("service_id");
                    }
                }
            } else {
                System.err.println("❌ GHN API trả về data KHÔNG phải JSONArray:");
                System.err.println(jsonResponse.toString());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    private int calculateFee(int serviceId, int toDistrictId, String toWardCode,
                             int weight, int length, int width, int height, int insuranceValue) {
        try {
            URL url = new URL("https://online-gateway.ghn.vn/shiip/public-api/v2/shipping-order/fee");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("Token", GHN_TOKEN);
            conn.setRequestProperty("ShopId", String.valueOf(SHOP_ID));
            conn.setDoOutput(true);

            JSONObject payload = new JSONObject();
            payload.put("service_id", serviceId);
            payload.put("insurance_value", insuranceValue);
            payload.put("coupon", JSONObject.NULL);
            payload.put("from_district_id", FROM_DISTRICT_ID);
            payload.put("from_ward_code", FROM_WARD_CODE);
            payload.put("to_district_id", toDistrictId);
            payload.put("to_ward_code", toWardCode);
            payload.put("height", height);
            payload.put("length", length);
            payload.put("weight", weight);
            payload.put("width", width);

            System.out.println("Payload gui toi GHN (available-services): " + payload.toString());

            try (OutputStream os = conn.getOutputStream()) {
                os.write(payload.toString().getBytes());
            }


            BufferedReader in = new BufferedReader(new java.io.InputStreamReader(conn.getInputStream()));
            String inputLine;
            StringBuilder response = new StringBuilder();
            while ((inputLine = in.readLine()) != null) {
                response.append(inputLine);
            }
            in.close();

            JSONObject jsonResponse = new JSONObject(response.toString());
            System.out.println("GHN fee response: " + response.toString());
            if (jsonResponse.getInt("code") == 200) {
                return jsonResponse.getJSONObject("data").getInt("total");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }
}
