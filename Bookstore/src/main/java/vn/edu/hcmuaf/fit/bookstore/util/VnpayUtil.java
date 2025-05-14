package vn.edu.hcmuaf.fit.bookstore.util;

import javax.crypto.Mac;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.SecretKeySpec;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.*;

public class VnpayUtil {
    public static String hashAllFields(Map fields, String secretKey) {
        List fieldNames = new ArrayList(fields.keySet());
        Collections.sort(fieldNames);
        StringBuilder sb = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) fields.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                sb.append(fieldName);
                sb.append("=");
                sb.append(fieldValue);
            }
            if (itr.hasNext()) {
                sb.append("&");
            }
        }
        return hmacSHA512(secretKey, sb.toString());
    }

    public static String hmacSHA512(String key, String data) {
        try {
            Mac hmac512 = Mac.getInstance("HmacSHA512");
            SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA512");
            hmac512.init(keySpec);

            byte[] byteHash = hmac512.doFinal(data.getBytes(StandardCharsets.UTF_8));

            StringBuilder sb = new StringBuilder();
            for (byte b : byteHash) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException | InvalidKeyException e) {
            throw new RuntimeException("Lỗi tạo chữ ký", e);
        }
    }

    public static String generateRandomNumberString(int minLength, int maxLength) {
        if (minLength < 1 || maxLength > 100 || minLength > maxLength) {
            throw new IllegalArgumentException("Invalid input parameters");
        }

        SecureRandom secureRandom = new SecureRandom();
        int length = minLength + secureRandom.nextInt(maxLength - minLength + 1);

        StringBuilder randomString = new StringBuilder();
        while (randomString.length() < length) {
            int randomNumber = secureRandom.nextInt(10); // Generate a random digit (0-9)
            if (randomString.indexOf(Integer.toString(randomNumber)) == -1) {
                randomString.append(randomNumber);
            }
        }

        return randomString.toString();
    }
}
