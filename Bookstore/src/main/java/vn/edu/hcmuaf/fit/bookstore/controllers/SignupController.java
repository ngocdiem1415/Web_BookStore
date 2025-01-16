package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.Services.VerifyEmailService;
import vn.edu.hcmuaf.fit.bookstore.dao.UserDao;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@WebServlet(name = "SignupController", value = "/signup")
public class SignupController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String dob = request.getParameter("birthdate");
        String baoloi = "";
        String type = "signup";
        String verifyCode = UUID.randomUUID().toString();

        // Kiểm tra giới tính hợp lệ
        if (gender == null || (!gender.equals("male") && !gender.equals("female") && !gender.equals("other"))) {
            request.setAttribute("baoloi", "Giới tính không hợp lệ");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
            return;
        }

        UserServices userServices = new UserServices();
        int result = userServices.register(username, gender, dob, phone, email, password, "user");
        if (result == 0) {
            int id = userServices.findByUserName(username).getUid();

            // luu token
            VerifyEmailService verifyEmailService = new VerifyEmailService();
            verifyEmailService.saveVerifyEmail(id, email);

            // hien thi thong bao
            request.setAttribute("baoloi", "Đăng ký thành công! Vui lòng kiểm tra email để xác nhận tài khoản");
            request.getRequestDispatcher("email_verify.jsp").forward(request, response);

        } else if (result == 1) {
            request.setAttribute("baoloi", "Username đã tồn tại");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
        } else if (result == 2) {
            request.setAttribute("baoloi", "Email đã tồn tại");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }
}