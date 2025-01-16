package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "EditAdminController", value = "/admin/edit-admin")
public class EditAdminController extends HttpServlet {
    UserServices userServices = new UserServices();

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

        // Cập nhật thông tin người dùng
        userServices.updateUserRole(username, gender, dob, phone, email, userId);

        // Chuyển hướng sau khi cập nhật
        response.sendRedirect("admin-management");

    }
}