package vn.edu.hcmuaf.fit.bookstore.util;

import jakarta.servlet.http.HttpServletRequest;
import vn.edu.hcmuaf.fit.bookstore.commons.VnpayConfig;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.text.SimpleDateFormat;
import java.util.*;

public class VnpayUtil {

    public static String createPaymentUrl(HttpServletRequest request, double amount, String orderInfo) {
        long vnp_Amount = Math.round(amount * 100);  // VNPay yêu cầu nhân 100

        String vnp_Version = "2.1.0";
        String vnp_Command = "pay";
        String vnp_TmnCode = VnpayConfig.TMNCODE;
        String vnp_CurrCode = "VND";
        String vnp_Locale = "vn";
        String vnp_OrderType = "other"; // hoặc tùy vào loại sản phẩm
        String vnp_ReturnUrl = VnpayConfig.RETURN_URL;
        String vnp_IpAddr = request.getRemoteAddr();
        String vnp_TxnRef = generateRandomNumberString(8, 10);  // Mã đơn hàng ngắn gọn

        // Format ngày giờ theo GMT+7
        TimeZone tz = TimeZone.getTimeZone("Asia/Ho_Chi_Minh");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        sdf.setTimeZone(tz);

        Date now = new Date();
        String vnp_CreateDate = sdf.format(now);

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(now);
        calendar.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = sdf.format(calendar.getTime());

        // Tạo tham số
        Map<String, String> vnp_Params = new TreeMap<>();
        vnp_Params.put("vnp_Version", vnp_Version);
        vnp_Params.put("vnp_Command", vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(vnp_Amount));
        vnp_Params.put("vnp_CurrCode", vnp_CurrCode);
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", orderInfo);
        vnp_Params.put("vnp_OrderType", vnp_OrderType);
        vnp_Params.put("vnp_ReturnUrl", vnp_ReturnUrl);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);
        vnp_Params.put("vnp_Locale", vnp_Locale);

        // Tạo chuỗi query và hash
        StringBuilder query = new StringBuilder();
        StringBuilder hashData = new StringBuilder();
        for (Map.Entry<String, String> entry : vnp_Params.entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();

            String encodedValue = urlEncode(value);
            query.append(urlEncode(key)).append('=').append(encodedValue).append('&');
            hashData.append(key).append('=').append(encodedValue).append('&');
        }

        // Bỏ dấu & cuối cùng
        query.setLength(query.length() - 1);
        hashData.setLength(hashData.length() - 1);

        String secureHash = hmacSHA512(VnpayConfig.HASH_SECRET, hashData.toString());
        return VnpayConfig.VNP_URL + "?" + query + "&vnp_SecureHash=" + secureHash;
    }

    public static String hmacSHA512(String key, String data) {
        try {
            Mac hmacSHA512 = Mac.getInstance("HmacSHA512");
            SecretKeySpec secretKey = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
            hmacSHA512.init(secretKey);
            byte[] hash = hmacSHA512.doFinal(data.getBytes(StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException | InvalidKeyException e) {
            throw new RuntimeException("Error while generating HMAC SHA512", e);
        }
    }

    private static String urlEncode(String input) {
        try {
            return URLEncoder.encode(input, StandardCharsets.US_ASCII.toString());
        } catch (Exception e) {
            throw new RuntimeException("Error while URL encoding", e);
        }
    }

    public static String generateRandomNumberString(int minLength, int maxLength) {
        if (minLength < 1 || maxLength > 100 || minLength > maxLength) {
            throw new IllegalArgumentException("Invalid input length");
        }

        SecureRandom random = new SecureRandom();
        int length = minLength + random.nextInt(maxLength - minLength + 1);
        StringBuilder result = new StringBuilder();
        while (result.length() < length) {
            int digit = random.nextInt(10);
            if (result.indexOf(String.valueOf(digit)) == -1) {
                result.append(digit);
            }
        }
        return result.toString();
    }
}
