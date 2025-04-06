package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.Services.VerifyEmailService;
import vn.edu.hcmuaf.fit.bookstore.beans.VerifyEmail;

import java.io.IOException;

@WebServlet(name = "ResetPasswordController", value = "/reset-password")
public class ResetPasswordController extends HttpServlet {
    private UserServices userServices;
    private VerifyEmailService verifyEmailService;

    public ResetPasswordController() {
        this.userServices = new UserServices();
        this.verifyEmailService = new VerifyEmailService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");

        if (code == null || code.isEmpty()) {
            request.setAttribute("error", "Mã xác minh không hợp lệ.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        VerifyEmail verifyEmail = verifyEmailService.selectVerifyEmailByCode(code);
        if (verifyEmail == null) {
            request.setAttribute("error", "Mã xác minh đã hết hạn hoặc không hợp lệ.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("code", code); // Lưu mã để xác nhận khi submit form
            request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String newPassword = request.getParameter("new-password");
        String confirmPassword = request.getParameter("confirm-password");

        if (code == null || code.isEmpty()) {
            request.setAttribute("error", "Mã xác minh không hợp lệ.");
            request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
            return;
        }

        VerifyEmail verifyEmail = verifyEmailService.selectVerifyEmailByCode(code);
        if (verifyEmail != null && newPassword.equals(confirmPassword)) {
            String email = verifyEmail.getEmail();
            int userId = userServices.findByEmail(email).getUid();

            // Mã hóa mật khẩu trước khi lưu
            userServices.updatePassword(userId, newPassword);

            // Xóa mã xác minh
            verifyEmailService.deleteVerifyEmailByEmail(email);

            // Kiểm tra session
            HttpSession session = request.getSession();
            session.setAttribute("baoloi", "Đặt lại mật khẩu thành công. Vui lòng đăng nhập lại.");

            response.sendRedirect(request.getContextPath() + "/login");

        } else {
            request.setAttribute("baoloi", "Đặt lại mật khẩu thất bại. Mã xác minh không hợp lệ.");
            request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
        }
    }


}
