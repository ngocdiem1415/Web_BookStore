package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.RoleServices;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.LoginStracked.LoginAttemptTracker;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    RoleServices roleServices = RoleServices.getInstance();
    private LogService logService;

    public LoginController() {
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        HttpSession session = request.getSession(true);
        String sessionId = session.getId();
        String ip = request.getRemoteAddr();

        UserServices userServices = new UserServices();
        User user = userServices.findByUsernameAndPassword(username, password);
        String baoloi = "";

        if (user == null) {
            // Đăng nhập thất bại
            if (LoginAttemptTracker.shouldLogLoginFail(sessionId)) {
                Log log = new Log(null, sessionId, ip, LogLevel.WARNING, "login", "LOGIN_FAIL",
                        false, "{}", "{\"username\": \"" + username + "\"}");
                logService.insert(log);
            }
            LoginAttemptTracker.getAttempts(sessionId); // tăng số lần
            baoloi = "Sai tên đăng nhập hoặc mật khẩu";
            request.setAttribute("baoloi", baoloi);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        if (user.getStatus() == 0) {
            // Tài khoản chưa kích hoạt
            if (LoginAttemptTracker.shouldLogLoginFail(sessionId)) {
                Log log = new Log(null, sessionId, ip, LogLevel.ALERT, "login", "LOGIN_INACTIVE",
                        false, "{}", "{\"username\": \"" + username + "\"}");
                logService.insert(log);
            }
            LoginAttemptTracker.getAttempts(sessionId);
            baoloi = "Tài khoản chưa được kích hoạt";
            request.setAttribute("baoloi", baoloi);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
            return;
        }

        // Đăng nhập thành công
        session.setAttribute("userSession", user);

        // Danh sách resource user được phân quyền (ví dụ: "USER_MGMT", "PRODUCT_MGMT",...)
        List<String> userResources = roleServices.getAdminsResources(user.getUid());
        session.setAttribute("userResources", userResources);

        int permissions = roleServices.getPermissionByUserId(user.getUid());
        session.setAttribute("permissions", permissions);

        Log log = new Log(user.getUid(), sessionId, ip, LogLevel.INFO, "login", "LOGIN_SUCCESS",
                false, "{}", "{\"username\": \"" + username + "\"}");
        logService.insert(log);
        LoginAttemptTracker.reset(sessionId);

        if (!userResources.isEmpty()) {
            // Nếu user có quyền admin → vào dashboard admin
            response.sendRedirect(request.getContextPath() + "/admin/dashboard");
        } else {
            // Nếu không có quyền gì đặc biệt → vào home người dùng
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }

}