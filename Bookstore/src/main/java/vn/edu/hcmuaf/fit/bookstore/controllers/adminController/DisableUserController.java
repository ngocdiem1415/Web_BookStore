package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "DeleteUser", value = "/admin/disable")
public class DisableUserController extends HttpServlet {
    UserServices userServices;
    LogService logService;

    public DisableUserController() {
        this.userServices = UserServices.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("uid"));

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        try {
            userServices.disabled(id);

            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.ALERT,
                    "user-management",
                    "DISABLE_USER_SUCCESS",
                    false,
                    "{\"user_id\": " + id + "}",
                    "{\"update_by\": \"" + admin.getUsername() + "\", {\"user_id\": \"" + id + "\"}"
            );
            logService.insert(log);

            response.setStatus(HttpServletResponse.SC_OK); // Trả về 200 OK
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.DANGER,
                    "user-management",
                    "DISABLE_USER_FAILED",
                    true,
                    "{\"user_id\": " + id + "}",
                    "{\"update_by\": \"" + admin.getUsername() + "\", {\"user_id\": \"" + id + "\"}"
            );
            logService.insert(log);
            e.printStackTrace();
        }
    }
}