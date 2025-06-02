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

@WebServlet(name = "EditAdminController", value = "/admin/edit-admin")
public class EditAdminController extends HttpServlet {
    UserServices userServices;
    LogService logService;

    public EditAdminController() {
        this.userServices = UserServices.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : 0;
        User admin = userServices.findById(id);
        request.setAttribute("admin", admin);
        request.getRequestDispatcher("Edit-Admin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy các tham số từ form
        int userId = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");  // Kiểm tra giá trị của username
        String email = request.getParameter("email");  // Kiểm tra giá trị của email
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("birthdate");

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        try {
            userServices.updateUserRole(username, gender, dob, phone, email, userId);
            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.ALERT,
                    "admin-management",
                    "UPDATE_ADMIN_SUCCESS",
                    false,
                    "{\"userId\": " + userId + "}",
                    "{\"username\": \"" + username + "\", \"updatedBy\": \"" + admin.getUsername() + "\"}"
            );
            logService.insert(log);
            // Chuyển hướng sau khi cập nhật
            response.sendRedirect("admin-management");
        }catch (Exception e) {
            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.DANGER,
                    "admin-management",
                    "UPDATE_ADMIN_FAILED",
                    true,
                    "{\"userId\": " + userId + "}",
                    "{\"username\": \"" + username + "\", \"updatedBy\": \"" + admin.getUsername() + "\"}"
            );
            logService.insert(log);

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Lỗi khi cập nhật thông tin admin: " + e.getMessage());
            e.printStackTrace();
        }

    }
}