package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "UploadRole", value = "/admin/upload-role")
public class UploadRoleController extends HttpServlet {
    private UserServices userServices = new UserServices();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("User-Management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uid = request.getParameter("uid");
        String newRole = request.getParameter("role");

        HttpSession session = request.getSession(false);
        User currentUser = (User) session.getAttribute("userSession");

        userServices.updateRole(newRole, Integer.parseInt(uid));

        if (currentUser != null && currentUser.getUid() == Integer.parseInt(uid) && newRole.equals("user")) {
            session.invalidate(); // Logout
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            response.sendRedirect(request.getContextPath() + "/admin/admin-management"); // Hoặc trang hiện tại
        }

    }
}