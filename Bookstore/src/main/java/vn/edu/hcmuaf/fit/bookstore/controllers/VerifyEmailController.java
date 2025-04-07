package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.Services.VerifyEmailService;
import vn.edu.hcmuaf.fit.bookstore.beans.VerifyEmail;
import vn.edu.hcmuaf.fit.bookstore.util.MailVerify;
import vn.edu.hcmuaf.fit.bookstore.util.RandomCode;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "VerifyEmailController", value = "/verify")
public class VerifyEmailController extends HttpServlet {

    private VerifyEmailService verifyEmailService = new VerifyEmailService();
    private UserServices userService = new UserServices();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("email_verify.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("sendcode".equals(action)) {
            // Lấy email người dùng gửi
            String email = request.getParameter("email");

            // Lấy ID người dùng từ session
            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("userId");

            if (userId != null) {
                // Tạo mã xác nhận
                String verifyCode = RandomCode.randomCode();

                // Lưu mã xác nhận vào cơ sở dữ liệu và gửi email
                verifyEmailService.saveVerifyEmail(email, verifyCode);

                // Gửi mã qua email (giả sử bạn có hàm gửi email)
                MailVerify mailVerify = new MailVerify();
                mailVerify.sendVerificationCode(email, verifyCode);

                // Chuyển đến trang nhập mã
                request.setAttribute("email", email);
                request.getRequestDispatcher("email_verify.jsp").forward(request, response);
            } else {
                // Người dùng chưa đăng nhập, chuyển hướng đến trang login
                response.sendRedirect("login.jsp");
            }

        } else if ("validateCode".equalsIgnoreCase(action)) {
            // Kiểm tra mã xác nhận từ cơ sở dữ liệu
            String inputCode = request.getParameter("code");

            // Kiểm tra tính hợp lệ và thời gian hết hạn của mã
            VerifyEmail verifyEmail = verifyEmailService.selectVerifyEmailByCode(inputCode);
            if (verifyEmail != null && verifyEmail.isValid()) {  // isValid() kiểm tra hết hạn
                // Cập nhật trạng thái email đã xác minh
                String mail = verifyEmail.getEmail();
                userService.updateEmailVerifiedByEmail(mail);

                // Xóa mã xác nhận sau khi sử dụng
                verifyEmailService.selectVerifyEmailByCode(inputCode);

                request.setAttribute("baoloi", "Xác nhận thành công! Bạn có thể đăng nhập.");
                request.getRequestDispatcher("success.jsp").forward(request, response);
            } else {
                request.setAttribute("baoloi", "Mã xác nhận không đúng hoặc đã hết hạn. Vui lòng thử lại.");
                request.getRequestDispatcher("email_verify.jsp").forward(request, response);
            }
        }
    }
}

