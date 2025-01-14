package vn.edu.hcmuaf.fit.bookstore.util;

import com.sun.tools.javac.Main;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Properties;
import java.util.UUID;


public class MailVerify {
    // email: shadow05.rx@gmail.com
    //sajy blen qiil oxoz: password
    private final static String fromEmail = "shadow05.rx@gmail.com"; //requires valid gmail id
    private final static String username = "shadow05.rx@gmail.com";
    private final static String password = "sajyblenqiiloxoz"; // correct password for gmail id

    public void sendVerificationCode(String toEmail, String code) {
        String subject = "Xác minh tài khoản";
        String content = "Mã xác minh là: " + code;

        sendEmail(toEmail, subject, content);
    }

//    public void sendVerificationMail(String domain, String to, String token) {
//        // Xay dung lien ket xac minh
//        String vertificationLink = domain + "/verify?token=" + token;
//
//        // Chinh chu de va noi dung email xac minh
//        String subject = "Xác minh tài khoản";
//        String content = "Nhấn vào đường dẫn sau để xác minh tài khoản của bạn: " + vertificationLink;
//
//        // suwr dungj phuong thuc gui mail
//        sendEmail(to, subject, content);
//    }

    private void sendEmail(String to, String subject, String content) {
        // properties : khai bao cac thuoc tinh
        Properties pros = new Properties();
        pros.put("mail.smtp.host", "smtp.gmail.com"); // SMTP HOST
        pros.put("mail.smtp.port", "587"); // TLS 587 SSL 465
        pros.put("mail.smtp.auth", "true");
        pros.put("mail.smtp.starttls.enable", "true");

        // create Authentication
        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(fromEmail, password);
            }
        };

        Session session = Session.getInstance(pros, auth);

        // Tao 1 tin nhan
        Message msg = new MimeMessage(session);

        try {
            // kieu noi dung
            msg.setFrom(new InternetAddress(fromEmail, "BookStore"));
            msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
            msg.setSubject(subject);
            msg.setText(content);

            // gui mail
            Transport.send(msg);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        MailVerify mailVerify = new MailVerify();

        // Test sending verification code
        String testEmail = "vtrann102@gmail.com"; // Replace with a valid email
        String testCode = RandomCode.randomCode();
        mailVerify.sendVerificationCode(testEmail, testCode);
    }
}