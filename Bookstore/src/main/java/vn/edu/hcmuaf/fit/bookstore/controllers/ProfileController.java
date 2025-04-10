package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.cloundinary.CloundinaryConfig;

import java.io.IOException;
import java.util.Date;

@WebServlet(name = "ProfileController", value = "/profile")
@MultipartConfig
public class ProfileController extends HttpServlet {
    UserServices userServices = new UserServices();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng tới trang thông tin cá nhân
        request.getRequestDispatcher("profile.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userSession");

        if (user == null) {
            response.sendRedirect("login");
            return;
        }

        int id = user.getUid(); // Lấy UID từ đối tượng user
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("birthdate");

        if (username == null || email == null || username.trim().isEmpty() || email.trim().isEmpty()) {
            request.setAttribute("baoloi", "Tên đăng nhập và Email không được để trống");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
            return;
        }

        // xu lý ảnh
        Part filePart = request.getPart("imageFile");
        String imageUrl = user.getAvatar(); // mặc định là ảnh cũ

        if (filePart != null && filePart.getSize() > 0 && filePart.getSubmittedFileName() != null) {
            try {
                imageUrl = CloundinaryConfig.getUrl(filePart);
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("baoloi", "Lỗi khi tải ảnh lên");
                request.getRequestDispatcher("profile.jsp").forward(request, response);
                return;
            }
        }
        try {
            Date dobDate = java.sql.Date.valueOf(dob);
            // Cập nhật thông tin người dùng
            userServices.updateImageByID(username, gender, dob, phone, email, imageUrl, id);

            // Cap nhat lai thong tin user trong session
            user.setUsername(username);
            user.setEmail(email);
            user.setUsername(username);
            user.setEmail(email);
            user.setPhone(phone);
            user.setGender(gender);
            user.setDob(dobDate);
            user.setAvatar(imageUrl);
            session.setAttribute("userSession", user);

            response.sendRedirect("profile");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("baoloi", "Lỗi khi cập nhật thông tin");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }


//        // Lấy các tham số từ form
//        User user = (User) request.getSession().getAttribute("userSession");
//        int id = user.getUid(); // Lấy UID từ đối tượng user
//
//
//        String username = request.getParameter("username");  // Kiểm tra giá trị của username
//        String email = request.getParameter("email");  // Kiểm tra giá trị của email
//        String phone = request.getParameter("phone");
//        String gender = request.getParameter("gender");
//        String dob = request.getParameter("birthdate");
//
//        // Cập nhật thông tin người dùng
//        userServices.updateUserRole(username, gender, dob, phone, email, id);
//        response.sendRedirect("profile");
    }
}