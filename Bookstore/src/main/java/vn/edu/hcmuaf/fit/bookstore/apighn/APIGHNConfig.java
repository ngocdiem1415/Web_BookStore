package vn.edu.hcmuaf.fit.bookstore.apighn;

import org.cloudinary.json.JSONArray;
import org.cloudinary.json.JSONObject;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

public class APIGHNConfig {

    private static Properties properties = new Properties();

    static {
        try {
            properties.load(APIGHNConfig.class.getClassLoader().getResourceAsStream("apighn.Properties"));
        } catch (IOException e) {
            throw new RuntimeException("Failed to load apighn.Properties file", e);
        }
    }

    public static String getToken() {
        return properties.getProperty("my_ghn_token");
    }

    public static int getShopId() {
        return Integer.parseInt(properties.getProperty("shop_id"));
    }

    public static String getShopAddress() {
        return properties.getProperty("shop_address");
    }

    public static int getShopProvinceId(){
//        Map<String, Object> result = resolveAddress(getShopAddress());
//        return (int) result.get("province_id");
        return 202;
    }

    public static int getShopDistrictId() {
//        Map<String, Object> result = resolveAddress(getShopAddress());
//        return (int) result.get("district_id");
        return 3695;
    }

    public static String getShopWardCode() {
//        Map<String, Object> result = resolveAddress(getShopAddress());
//        return (String) result.get("ward_code");
        return "90737";
    }

    //Tra cứu địa chỉ shop
    private static Map<String, Object> resolveAddress(String rawAddress) {
        rawAddress = rawAddress.toLowerCase();

        try {
            JSONArray provinces = GHNUtils.getJSONArrayFromGHN("https://online-gateway.ghn.vn/shiip/public-api/master-data/province");

            int provinceId = -1;
            for (int i = 0; i < provinces.length(); i++) {
                JSONObject p = provinces.getJSONObject(i);
                if (rawAddress.contains(p.getString("ProvinceName").toLowerCase())) {
                    provinceId = p.getInt("ProvinceID");
                    break;
                }
            }

            if (provinceId == -1) throw new RuntimeException("Không tìm thấy tỉnh trong địa chỉ");

            JSONArray districts = GHNUtils.getJSONArrayFromGHNWithBody(
                    "https://online-gateway.ghn.vn/shiip/public-api/master-data/district",
                    new JSONObject().put("province_id", provinceId));

            int districtId = -1;
            for (int i = 0; i < districts.length(); i++) {
                JSONObject d = districts.getJSONObject(i);
                if (rawAddress.contains(d.getString("DistrictName").toLowerCase())) {
                    districtId = d.getInt("DistrictID");
                    break;
                }
            }

            if (districtId == -1) throw new RuntimeException("Không tìm thấy quận trong địa chỉ");

            JSONArray wards = GHNUtils.getJSONArrayFromGHNWithBody(
                    "https://online-gateway.ghn.vn/shiip/public-api/master-data/ward",
                    new JSONObject().put("district_id", districtId));

            String wardCode = null;
            for (int i = 0; i < wards.length(); i++) {
                JSONObject w = wards.getJSONObject(i);
                if (rawAddress.contains(w.getString("WardName").toLowerCase())) {
                    wardCode = w.getString("WardCode");
                    break;
                }
            }

            if (wardCode == null) throw new RuntimeException("Không tìm thấy phường trong địa chỉ");

            Map<String, Object> result = new HashMap<>();
            result.put("district_id", districtId);
            result.put("ward_code", wardCode);
            return result;

        } catch (Exception e) {
            throw new RuntimeException("Lỗi khi tra cứu địa chỉ GHN: " + e.getMessage(), e);
        }
    }
}
