package vn.edu.hcmuaf.fit.bookstore.util;

import sun.net.smtp.SmtpClient;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.UnsupportedEncodingException;
import java.util.Properties;


public class MailVerify {
    private SmtpClient MailProperties;

    public MailVerify(SmtpClient mailProperties) {
        MailProperties = mailProperties;
    }
    // email: shadow05.rx@gmail.com
    //sajy blen qiil oxoz: password
//    private final static String fromEmail = "shadow05.rx@gmail.com"; //requires valid gmail id
//    private final static String username = "shadow05.rx@gmail.com";
//    private final static String password = "sajyblenqiiloxoz"; // correct password for gmail id
//
//    //private final static String toEmail = "zsaomu1@gmail.com"; // email nguoi nhan
//
//    public static String sendEmail(String toEmail, String subject, String body) throws MessagingException, UnsupportedEncodingException {
//
//        String status = null;
//
//        // properties : khai bao cac thuoc tinh
//        Properties props = new Properties(); // nhieu cai bien == dictionary
//        props.put("mail.transport.protocol", "smtps");
//        props.put("mail.smtps.host", "smtp.gmail.com"); // SMTP Host
//        props.put("mail.smtps.port", 465);
//        props.put("mail.smtps.auth", "true"); // enable authentication
//        props.put("mail.smtps.quitwait", "false");
//        Session session = Session.getInstance(props);
//        session.setDebug(true);
//
//        //Wrap a messsage in session
//        Message message = new MimeMessage(session);
//        message.setSubject(subject);
//
//        if (content) {
//            message.setContent(body, "text/html");
//        } else {
//            message.setText(body);
//        }
//
//        //Set the from address
//        // specify E-mail address of the sender and Receiver
//        Address sender = new InternetAddress(fromEmail, id);
//        Address receiver = new InternetAddress(toEmail);
//        message.setFrom(sender);
//        message.setRecipient(Message.RecipientType.TO, receiver);
//
//        // sending an E-mail
//        try (Transport tt = session.getTransport()) {
//            // acquiring the connection to remote server
//            tt.connect(fromEmail, password);
//            tt.sendMessage(message, message.getAllRecipients());
//            status = "E-mail sent successfully";
//        }
//        return status;
//    }

    public void sendVerificationMail(String domain, String to, String token) {
        // Xay dung lien ket xac minh
        String vertificationLink = domain + "/verify?token=" + token;

        // Chinh chu de va noi dung email xac minh
        String subject = "Xác minh tài khoản";
        String content = "Nhấn vào đường dẫn sau để xác minh tài khoản của bạn: " + vertificationLink;

        // suwr dungj phuong thuc gui mail
        sendEmail(to, subject, content);
    }

    private void sendEmail(String to, String subject, String content) {
        // Cau hinh mail server
        Properties props = new Properties();
        props.setProperty("mail.smtp.host", MailProperties.getMailHost());

        // Thong tin dang nhap mail server


    }


    public static void main(String[] args) {

    }
}

