package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.Services.VerifyEmailService;
import vn.edu.hcmuaf.fit.bookstore.beans.VerifyEmail;
import vn.edu.hcmuaf.fit.bookstore.util.MailVerify;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "VerifyEmailController", value = "/verify")
public class VerifyEmailController extends HttpServlet {
    private final VerifyEmailService verifyEmailService = new VerifyEmailService();
    private final UserServices userService = new UserServices();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();

//        if ("sendcode".equals(action)) {
//            handleSendCode(request, response, session);
//        } else
            if ("validateCode".equalsIgnoreCase(action)) {
            handleValidateCode(request, response, session);
        }
    }

    private void handleSendCode(HttpServletRequest request, HttpServletResponse response,
                                HttpSession session) throws ServletException, IOException {
        String email = request.getParameter("email");

        if (email == null || email.isEmpty()) {
            sendError(request, response, "Email không hợp lệ");
            return;
        }

        String verifyCode = UUID.randomUUID().toString();
        session.setAttribute("verifyEmail", email);
        session.setAttribute("verifyCode", verifyCode);

        if (!verifyEmailService.saveVerifyEmail(email, verifyCode)) {
            sendError(request, response, "Lỗi hệ thống, vui lòng thử lại sau");
            return;
        }

        boolean sent = new MailVerify().sendVerificationCode(email, verifyCode);
        if (sent) {
            request.setAttribute("success", "Mã xác nhận đã được gửi đến " + email);
        } else {
            sendError(request, response, "Gửi email xác nhận thất bại, vui lòng thử lại");
            return;
        }
        request.getRequestDispatcher("email_verify.jsp").forward(request, response);
    }

    private void handleValidateCode(HttpServletRequest request, HttpServletResponse response,
                                    HttpSession session) throws ServletException, IOException {
        String inputCode = request.getParameter("code");
        String sessionEmail = (String) session.getAttribute("tempEmail");

        if (inputCode == null || inputCode.isEmpty()) {
            sendError(request, response, "Vui lòng nhập mã xác nhận");
            return;
        }

        VerifyEmail verifyEmail = verifyEmailService.selectVerifyEmailByCode(inputCode);

        // Kiểm tra 3 điều kiện: mã tồn tại, chưa hết hạn, và khớp với email trong session
        if (verifyEmail == null || !verifyEmail.isValid() ||
                !verifyEmail.getEmail().equals(sessionEmail)) {
            sendError(request, response, "Mã xác nhận không đúng hoặc đã hết hạn");
            return;
        }

        // Lay thong tin tu session



        // Chỉ cập nhật trạng thái xác nhận email, không tạo user mới
        boolean updated = userService.updateEmailVerifiedByID(verifyEmail.getId());
        if (updated) {
            verifyEmailService.delete(verifyEmail.getToken());
            clearTempSessionData(session);
            request.setAttribute("baoloi", "Xác nhận thành công! Bạn có thể đăng nhập.");
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } else {
            sendError(request, response, "Đã có lỗi xảy ra, vui lòng thử lại sau");
        }
    }

    private void processSuccessfulVerification(HttpServletRequest request,
                                               HttpServletResponse response, HttpSession session, VerifyEmail verifyEmail)
            throws ServletException, IOException {
        // Lấy thông tin từ session
        String username = (String) session.getAttribute("tempUsername");
        String password = (String) session.getAttribute("tempPassword");
        String email = (String) session.getAttribute("tempEmail");
        String gender = (String) session.getAttribute("tempGender");
        String phone = (String) session.getAttribute("tempPhone");
        String dob = (String) session.getAttribute("tempDob");

        // Tạo tài khoản người dùng
        int result = userService.register(username, gender, dob, phone, email, password, "user");

        if (result == 0) {
            verifyEmailService.updateTokenStatus(verifyEmail.getToken(), 1);
            userService.updateEmailVerifiedByEmail(email);
//            // Đánh dấu email đã xác minh
//            userService.updateEmailVerifiedByID(verifyEmail.getId());
//
//            // Xóa mã xác nhận đã dùng
//            verifyEmailService.delete(verifyEmail.getToken());

            // Xóa thông tin tạm
            clearTempSessionData(session);

            request.setAttribute("success", "Xác nhận thành công! Bạn có thể đăng nhập.");
            request.getRequestDispatcher("success.jsp").forward(request, response);
        } else {
            sendError(request, response, "Đã có lỗi xảy ra, vui lòng thử lại sau");
        }
    }

    private void clearTempSessionData(HttpSession session) {
        session.removeAttribute("tempUsername");
        session.removeAttribute("tempPassword");
        session.removeAttribute("tempEmail");
        session.removeAttribute("tempGender");
        session.removeAttribute("tempPhone");
        session.removeAttribute("tempDob");
        session.removeAttribute("verifyEmail");
        session.removeAttribute("verifyCode");
    }

    private void sendError(HttpServletRequest request, HttpServletResponse response,
                           String message) throws ServletException, IOException {
        request.setAttribute("baoloi", message);
        request.getRequestDispatcher("email_verify.jsp").forward(request, response);
    }
}

