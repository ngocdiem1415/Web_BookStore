package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

@WebServlet(name = "SignUp", value = "/signup")
public class SignUpController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Chuyển hướng tới trang đăng ký
        request.getRequestDispatcher("Signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy dữ liệu từ form đăng ký
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String birthdate = request.getParameter("birthdate");
        String phone = request.getParameter("phone");

        // Kiểm tra dữ liệu đầu vào
        if (username == null || username.isEmpty() ||
                password == null || password.isEmpty() ||
                email == null || email.isEmpty()) {
            request.setAttribute("error", "Vui lòng điền đầy đủ thông tin bắt buộc.");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
            return;
        }

        // Chuyển đổi ngày sinh từ String sang java.sql.Date
        Date sqlDob = null;
        try {
            if (birthdate != null && !birthdate.isEmpty()) {
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
                LocalDate dob = LocalDate.parse(birthdate, formatter);
                sqlDob = Date.valueOf(dob);
            }
        } catch (Exception e) {
            request.setAttribute("error", "Ngày sinh không hợp lệ.");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
            return;
        }

        // Tạo đối tượng User
        User user = new User();


        user.setUsername(username);
        user.setPassword(password);
        user.setRole("user"); // Vai trò mặc định là "user"
        user.setStatus(1); // Trạng thái mặc định là kích hoạt
        user.setEmail(email);
        user.setGender(gender);
        user.setDob(sqlDob != null ? sqlDob : null); // Chuyển sqlDob về LocalDate
        user.setPhone(phone);
        user.setAvatar("default.png"); // Ảnh đại diện mặc định
        user.setCreateAt(LocalDateTime.now());
        user.setUpdateAt(LocalDateTime.now());

        // Lưu thông tin người dùng vào cơ sở dữ liệu
        UserServices userServices = new UserServices();
        int result;
        try {
            result = userServices.signUp(user);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Lỗi xảy ra khi lưu dữ liệu vào cơ sở dữ liệu: " + e.getMessage());
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
            return;
        }

        // Kiểm tra kết quả và điều hướng
        if (result > 0) {
            response.sendRedirect("Home.jsp"); // Đăng ký thành công
        } else {
            request.setAttribute("error", "Đăng ký không thành công. Vui lòng thử lại.");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
        }
    }
}
