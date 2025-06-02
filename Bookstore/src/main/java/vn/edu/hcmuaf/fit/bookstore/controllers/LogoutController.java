package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.LoginStracked.LoginAttemptTracker;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "Logout", value = "/logout")
public class LogoutController extends HttpServlet {
    private LogService logService;

    public LogoutController() {
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String sessionId = session.getId();
        String ip = request.getRemoteAddr();
        User user = (User) session.getAttribute("userSession");
        if (user != null) {
            Log log = new Log(user.getUid(), sessionId, ip, LogLevel.INFO, "logout", "LOGOUT_SUCCESS",
                    false, "{}", "{\"username\": \"" + user.getUsername() + "\"}");
            logService.insert(log);
        }
        // Huy bao session
        session.invalidate();
        response.sendRedirect(request.getContextPath() + "/home");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}