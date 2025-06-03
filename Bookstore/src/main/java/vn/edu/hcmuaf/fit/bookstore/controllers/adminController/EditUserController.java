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

@WebServlet(name = "Edit", value = "/admin/edit-user")
public class EditUserController extends HttpServlet {
    UserServices userServices;
    LogService logService;

    public EditUserController() {
        this.userServices = UserServices.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userServices.findById(id);
        request.setAttribute("user", user);
        request.getRequestDispatcher("Edit-User.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy các tham số từ form
        String username = request.getParameter("username");  // Kiểm tra giá trị của username
        String email = request.getParameter("email");  // Kiểm tra giá trị của email
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("birthdate");

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        int userId = 0;
        try {
            userId = Integer.parseInt(request.getParameter("id"));

            // Cập nhật thông tin người dùng
            userServices.updateUserRole(username, gender, dob, phone, email, userId);
            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.ALERT,
                    "user-management",
                    "UPDATE_USER_SUCCESS",
                    false,
                    "{\"userId\": " + userId + "}",
                    "{\"username\": \"" + username + "\", \"updatedBy\": \"" + admin.getUsername() + "\"}"
            );
            logService.insert(log);
            response.sendRedirect("user-management");
        } catch (Exception e) {
            // Ghi log nếu có lỗi
            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.DANGER,
                    "user-management",
                    "UPDATE_user_FAILED",
                    true,
                    "{\"user_id\": " + userId + "}",
                    "{\"error\": \"" + e.getMessage().replace("\"", "\\\"") + "\"}"
            );
            logService.insert(log);

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Lỗi khi cập nhật thông tin user: " + e.getMessage());
            e.printStackTrace();
        }
    }


}