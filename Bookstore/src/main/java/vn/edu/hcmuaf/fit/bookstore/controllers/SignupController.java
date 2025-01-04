package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.dao.UserDao;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

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

        // Định dạng ngày sinh
        SimpleDateFormat inputFormat = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");

        String formattedDob = null;
        try {
            Date dateOfBirth = inputFormat.parse(dob);
            formattedDob = outputFormat.format(dateOfBirth);
        } catch (Exception e) {
            request.setAttribute("baoloi", "Ngày sinh không hợp lệ");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
            return;
        }

        // Kiểm tra giới tính hợp lệ
        if (gender == null || (!gender.equals("male") && !gender.equals("female") && !gender.equals("other"))) {
            request.setAttribute("baoloi", "Giới tính không hợp lệ");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
            return;
        }

        UserServices userServices = new UserServices();
        int result = userServices.register(username, gender, formattedDob, phone, email, password);

        if (result == 1) {
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