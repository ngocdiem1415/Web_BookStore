package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "ProfileController", value = "/profile")
public class ProfileController extends HttpServlet {
    UserServices userServices = new UserServices();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng tới trang thông tin cá nhân
        request.getRequestDispatcher("profile.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy các tham số từ form
        User user = (User) request.getSession().getAttribute("userSession");
        int id = user.getUid(); // Lấy UID từ đối tượng user


        String username = request.getParameter("username");  // Kiểm tra giá trị của username
        String email = request.getParameter("email");  // Kiểm tra giá trị của email
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("birthdate");

        // Cập nhật thông tin người dùng
        userServices.updateUserRole(username, gender, dob, phone, email, id);
        response.sendRedirect("profile");
    }
}