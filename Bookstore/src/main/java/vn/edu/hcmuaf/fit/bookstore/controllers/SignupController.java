package vn.edu.hcmuaf.fit.bookstore.controllers;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.LoginStracked.LoginAttemptTracker;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.Services.VerifyEmailService;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.VerifyEmail;
import vn.edu.hcmuaf.fit.bookstore.util.MailVerify;
import vn.edu.hcmuaf.fit.bookstore.util.RandomCode;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "SignupController", value = "/signup")
public class SignupController extends HttpServlet {
    private MailVerify mailVerify;
    private UserServices userServices;
    private LogService logService;

    public SignupController() {
        this.mailVerify = new MailVerify();
        this.userServices = UserServices.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("birthdate");
        String baoloi = "";
        String type = "signup";
        String verifyCode = RandomCode.randomCode();

        HttpSession session = request.getSession(true);
        String sessionId = session.getId();
        String ip = request.getRemoteAddr();

        // Kiểm tra giới tính hợp lệ
        if (gender == null || (!gender.equals("male") && !gender.equals("female") && !gender.equals("other"))) {
            request.setAttribute("baoloi", "Giới tính không hợp lệ");
            logSignupFail(sessionId,ip,email);
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
            return;
        }

        int result = userServices.register(username, gender, dob, phone, email, password, "user");
        if (result == 0) {
            int id = userServices.findByUserName(username).getUid();
            Gson gson = new Gson();
            Map<String, String> data = new HashMap<>();
            data.put("username", username);
            data.put("email", email);
            Log log = new Log(id, sessionId, ip, LogLevel.INFO, "signup", "SIGNUP_SUCCESS",
                    false, "{}", data.toString());
            logService.insert(log);
            LoginAttemptTracker.reset(sessionId);

            // luu token
            VerifyEmailService verifyEmailService = new VerifyEmailService();
            mailVerify.sendVerificationCode(email, verifyCode);
            verifyEmailService.saveVerifyEmail(email, verifyCode);

            // hien thi thong bao
            request.setAttribute("baoloi", "Đăng ký thành công! Vui lòng kiểm tra email để xác nhận tài khoản");
            request.getRequestDispatcher("email_verify.jsp").forward(request, response);

        } else if (result == 1) {
            logSignupFail(sessionId,ip,email);
            request.setAttribute("baoloi", "Username đã tồn tại");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
        } else if (result == 2) {
            logSignupFail(sessionId,ip,email);
            request.setAttribute("baoloi", "Email đã tồn tại");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
        } else {
            logSignupFail(sessionId,ip,email);
            response.sendRedirect("login");
        }
    }

    private void logSignupFail(String sessionId, String ip, String email) {
        if (LoginAttemptTracker.shouldLogLoginFail(sessionId)) {
            Gson gson = new Gson();
            Map<String, String> data = new HashMap<>();
            data.put("email", email);

            Log log = new Log(null, sessionId, ip, LogLevel.WARNING, "signup", "SIGNUP_FAIL",
                    false, "{}", gson.toJson(data));
            logService.insert(log);
        }
        LoginAttemptTracker.getAttempts(sessionId);
    }

}