package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.Services.VerifyEmailService;
import vn.edu.hcmuaf.fit.bookstore.beans.VerifyEmail;
import vn.edu.hcmuaf.fit.bookstore.util.MailVerify;
import vn.edu.hcmuaf.fit.bookstore.util.RandomCode;

import java.io.IOException;

@WebServlet(name = "SignupController", value = "/signup")
public class SignupController extends HttpServlet {
    private MailVerify mailVerify;

    public SignupController() {
        this.mailVerify = new MailVerify();
    }

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
        String verifyCode = RandomCode.randomCode();
        String baoloi = "";

        // Kiểm tra giới tính hợp lệ
        if (gender == null || (!gender.equals("male") && !gender.equals("female") && !gender.equals("other"))) {
            request.setAttribute("baoloi", "Giới tính không hợp lệ");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
            return;
        }
        // Kiểm tra định dạng email
        if (!email.matches("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$")) {
            request.setAttribute("baoloi", "Email không hợp lệ");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
            return;
        }

        // Kiểm tra định dạng số điện thoại (10 số, bắt đầu bằng 0)
        if (!phone.matches("0\\d{9}")) {
            request.setAttribute("baoloi", "Số điện thoại không hợp lệ (phải có 10 số và bắt đầu bằng 0)");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
            return;
        }

        UserServices userServices = new UserServices();
        int result = userServices.register(username, gender, dob, phone, email, password);
        if (result == 0) {
            int id = userServices.findByUserName(username).getUid();

            // luu token
            VerifyEmailService verifyEmailService = new VerifyEmailService();
            mailVerify.sendVerificationCode(email, verifyCode);
            verifyEmailService.saveVerifyEmail(email, verifyCode);

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