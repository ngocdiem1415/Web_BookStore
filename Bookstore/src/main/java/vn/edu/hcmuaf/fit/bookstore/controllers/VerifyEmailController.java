package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.Services.VerifyEmailService;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.beans.VerifyEmail;
import vn.edu.hcmuaf.fit.bookstore.util.MailVerify;
import vn.edu.hcmuaf.fit.bookstore.util.RandomCode;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "VerifyEmailController", value = "/verify")
public class VerifyEmailController extends HttpServlet {
    private LogService logService;
    private VerifyEmailService verifyEmailService;
    private UserServices userService;

    public VerifyEmailController() {
        this.logService = LogService.getInstance();
        this.userService = UserServices.getInstance();
        this.verifyEmailService = new VerifyEmailService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("email_verify.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String email = request.getParameter("email");

        // Lấy ID người dùng từ session
        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId");

        if ("sendcode".equals(action)) {
            // Lấy email người dùng gửi

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
                request.setAttribute("baoloi", "Xác nhận thành công! Bạn có thể đăng nhập.");
                Log log = new Log(
                        userId,
                        session.getId(),
                        request.getRemoteAddr(),
                        LogLevel.INFO,
                        "email",
                        "SEND_VERIFY_CODE",
                        true,
                        "Email: " + email,
                        null
                );
                logService.insert(log);
                request.getRequestDispatcher("email_verify.jsp").forward(request, response);
            } else {
                // Người dùng chưa đăng nhập, chuyển hướng đến trang login
                Log log = new Log(
                        0,
                        session.getId(),
                        request.getRemoteAddr(),
                        LogLevel.ALERT,
                        "email",
                        "SEND_VERIFY_CODE_FAIL_NO_SESSION",
                        false,
                        "Email: " + email,
                        null
                );
                logService.insert(log);
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
                Log log = new Log(
                        0,
                        session.getId(),
                        request.getRemoteAddr(),
                        LogLevel.INFO,
                        "email",
                        "EMAIL_VERIFIED",
                        true,
                        "Email: " + mail,
                        null
                );
                logService.insert(log);
                request.getRequestDispatcher("success.jsp").forward(request, response);
            } else {
                request.setAttribute("baoloi", "Mã xác nhận không đúng hoặc đã hết hạn. Vui lòng thử lại.");
                Log log = new Log(
                        0,
                        session.getId(),
                        request.getRemoteAddr(),
                        LogLevel.WARNING,
                        "email",
                        "VERIFY_CODE_INVALID",
                        false,
                        "InputCode: " + inputCode,
                        null
                );
                logService.insert(log);
                request.getRequestDispatcher("email_verify.jsp").forward(request, response);
            }
        }
    }
}

