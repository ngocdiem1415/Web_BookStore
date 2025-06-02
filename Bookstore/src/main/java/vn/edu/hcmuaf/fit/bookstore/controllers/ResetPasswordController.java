package vn.edu.hcmuaf.fit.bookstore.controllers;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.Services.VerifyEmailService;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.VerifyEmail;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "ResetPasswordController", value = "/reset-password")
public class ResetPasswordController extends HttpServlet {
    private UserServices userServices;
    private VerifyEmailService verifyEmailService;
    private LogService logService;

    public ResetPasswordController() {
        this.userServices = UserServices.getInstance();
        this.verifyEmailService = new VerifyEmailService();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        HttpSession session = request.getSession();
        String sessionId = session.getId();
        String ip = request.getRemoteAddr();

        if (code == null || code.isEmpty()) {
            request.setAttribute("error", "Mã xác minh không hợp lệ.");
            logService.insert(new Log(0, sessionId, ip, LogLevel.WARNING,
                    "reset-password", "RESET_CODE_NULL", false,
                    "code=null", null));
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        VerifyEmail verifyEmail = verifyEmailService.selectVerifyEmailByCode(code);
        if (verifyEmail == null) {
            request.setAttribute("error", "Mã xác minh đã hết hạn hoặc không hợp lệ.");
            logService.insert(new Log(0, sessionId, ip, LogLevel.WARNING,
                    "reset-password", "RESET_CODE_EXPIRED", false,
                    "code=" + code, null));
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            request.setAttribute("code", code); // Lưu mã để xác nhận khi submit form
            logService.insert(new Log(0, sessionId, ip, LogLevel.INFO,
                    "reset-password", "RESET_CODE_VALID", true,
                    "code=" + code, null));
            request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String newPassword = request.getParameter("new-password");
        String confirmPassword = request.getParameter("confirm-password");
        HttpSession session = request.getSession();
        String sessionId = session.getId();
        String ip = request.getRemoteAddr();

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
            session.setAttribute("baoloi", "Đặt lại mật khẩu thành công. Vui lòng đăng nhập lại.");
            logService.insert(new Log(userId, sessionId, ip, LogLevel.INFO,
                    "reset-password", "RESET_PASSWORD_SUCCESS", true,
                    "code=" + code, "email=" + email));
            response.sendRedirect(request.getContextPath() + "/login");

        } else {
            request.setAttribute("baoloi", "Đặt lại mật khẩu thất bại. Mã xác minh không hợp lệ.");
            Gson gson = new Gson();
            Map<String,String> dataBefore = new HashMap<>();
            dataBefore.put("code", code);
            dataBefore.put("match", String.valueOf(newPassword.equals(confirmPassword)));
            logService.insert(new Log(0, sessionId, ip, LogLevel.WARNING,
                    "reset-password", "RESET_PASSWORD_FAIL", false,
                    gson.toJson(dataBefore),null));
            request.getRequestDispatcher("ResetPassword.jsp").forward(request, response);
        }
    }


}
