package vn.edu.hcmuaf.fit.bookstore.util;

import java.util.Random;

public class RandomCode {
    public static String randomCode() {
        Random rd = new Random();
        String s1 = rd.nextInt(10) + "";
        String s2 = rd.nextInt(10) + "";
        String s3 = rd.nextInt(10) + "";
        String s4 = rd.nextInt(10) + "";
        String s5 = rd.nextInt(10) + "";
        String s6 = rd.nextInt(10) + "";

        return s1 + s2 + s3 + s4 + s5 + s6;
    }

    public static void main(String[] args) {
        System.out.println(randomCode());
    }
}
