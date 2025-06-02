package api.ghn;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.apighn.APIGHNConfig;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet(name = "GHNWardsController", value = "/api/ghn/wards")
public class GHNWardsController extends HttpServlet {
    private static final String GHN_TOKEN = APIGHNConfig.getToken();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String districtId = request.getParameter("district_id");
        if (districtId == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Thiếu district_id");
            return;
        }

        String apiUrl = "https://online-gateway.ghn.vn/shiip/public-api/master-data/ward";
        HttpURLConnection conn = (HttpURLConnection) new URL(apiUrl).openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("token", GHN_TOKEN);
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setDoOutput(true);

        String jsonInput = "{\"district_id\": " + districtId + "}";
        try (OutputStream os = conn.getOutputStream()) {
            os.write(jsonInput.getBytes());
        }

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        try (InputStream in = conn.getInputStream();
             OutputStream out = response.getOutputStream()) {
            in.transferTo(out);
        }
    }
}
