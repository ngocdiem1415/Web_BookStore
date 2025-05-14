package vn.edu.hcmuaf.fit.bookstore.commons;

import java.io.IOException;
import java.util.Properties;

public class VnpayConfig {
    private static Properties prop = new Properties();

    static {
        try {
            prop.load(VnpayConfig.class.getClassLoader().getResourceAsStream("vnpay.properties"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getTmnCode() {
        return prop.get("vnp_TmnCode").toString();
    }

    public static String getHashSecret() {
        return prop.get("vnp_HashSecret").toString();
    }

    public static void main(String[] args) {
        System.out.println("TMN Code: " + getTmnCode());
        System.out.println("Hash Secret: " + getHashSecret());
    }
}
