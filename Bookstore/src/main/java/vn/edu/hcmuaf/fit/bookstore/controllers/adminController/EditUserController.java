package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "Edit", value = "/admin/edit-user")
public class EditUserController extends HttpServlet {
    UserServices userServices = new UserServices();

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
        int userId = Integer.parseInt(request.getParameter("id"));
        String username = request.getParameter("username");  // Kiểm tra giá trị của username
        String email = request.getParameter("email");  // Kiểm tra giá trị của email
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("birthdate");

        // Cập nhật thông tin người dùng
        userServices.updateUserRole(username, gender, dob, phone, email, userId);

        // Chuyển hướng sau khi cập nhật
        response.sendRedirect("user-management");
    }


}