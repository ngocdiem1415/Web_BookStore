package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.Services.VerifyEmailService;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.util.MailVerify;
import vn.edu.hcmuaf.fit.bookstore.util.RandomCode;

import java.io.IOException;

@WebServlet(name = "ForgetPassword", value = "/forget-password")
public class ForgetPasswordController extends HttpServlet {
    private UserServices userServices;
    private VerifyEmailService verifyEmailService;
    private MailVerify mailVerify;

    public ForgetPasswordController() {
        this.userServices = new UserServices();
        this.verifyEmailService = new VerifyEmailService();
        this.mailVerify = new MailVerify();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("ForgetPassword.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        User user = userServices.findByEmail(email);
        String baoloi = null;
        if (user == null) {
            baoloi = "Email không tồn tại";
            request.setAttribute("baoloi", baoloi);
            request.getRequestDispatcher("ForgetPassword.jsp").forward(request, response);
        } else {
            String subject = "BookStore - Reset mật khẩu";
            String newPassword = Integer.toString((int) (Math.random() * 10000000));
            String hashPassword = userServices.hashPassword(newPassword);
            userServices.updatePassword(user.getUid(), newPassword);
            String code = RandomCode.randomCode();
            verifyEmailService.saveVerifyEmail(email, code);
            String url = "http://localhost:8080/Bookstore/reset-password?code=" + code;
            String content = "<!DOCTYPE html>" +
                    "<html lang='vi'>" +
                    "<head>" +
                    "<meta charset='UTF-8'>" +
                    "<meta name='viewport' content='width=device-width, initial-scale=1.0'>" +
                    "<title>Đặt lại mật khẩu</title>" +
                    "<style>" +
                    "body {  font-family: 'Open Sans', sans-serif; line-height: 1.6; color: #333; text-align: center; }" +
                    ".container { max-width: 600px; margin: 0 auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); }" +
                    "h2 { color: #d35400; }" +
                    "p { font-size: 16px; }" +
                    ".code { font-size: 20px; font-weight: bold; color: #4B908E; background: #f8f9fa; padding: 10px; display: inline-block; border-radius: 5px; }" +
                    ".button { display: inline-block; padding: 10px 20px; margin-top: 20px; color: #fff; background: #4B908E; text-decoration: none; border-radius: 5px; font-size: 16px; }" +
                    ".button:hover { background-color: #5bafc4; }" + // Optional: hover effect
                    ".footer { margin-top: 20px; font-size: 14px; color: #888; }" +
                    "</style>" +
                    "</head>" +
                    "<body>" +
                    "<div class='container'>" +
                    "<h2> Đặt lại mật khẩu</h2>" +
                    "<p>Xin chào <strong>" + user.getUsername() + "</strong>,</p>" +
                    "<p>Chúng tôi đã nhận được yêu cầu đặt lại mật khẩu của bạn tại <strong>BookStore</strong>.</p>" +
                    "<p>Mã xác minh của bạn là:</p>" +
                    "<p class='code'>" + code + "</p>" +
                    "<p>Mật khẩu mới của bạn là: <strong>" + newPassword + "</strong></p>" +
                    "<p>Hoặc bạn có thể nhấn vào nút bên dưới để đặt lại mật khẩu:</p>" +
                    "<a class='button' href='" + url + "'>Đặt lại mật khẩu</a>" +
                    "<p>Nếu bạn không yêu cầu đặt lại mật khẩu, vui lòng bỏ qua email này.</p>" +
                    "<p class='footer'>Trân trọng,<br><strong> BookStore Team</strong></p>" +
                    "</div>" +
                    "</body>" +
                    "</html>";
            mailVerify.sendEmail(email, subject, content);
            response.sendRedirect(request.getContextPath() + "/login");
        }
    }
}