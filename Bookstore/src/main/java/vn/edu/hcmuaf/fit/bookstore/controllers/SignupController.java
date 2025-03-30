package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.Services.VerifyEmailService;
import vn.edu.hcmuaf.fit.bookstore.dao.UserDao;
import vn.edu.hcmuaf.fit.bookstore.util.MailVerify;

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

            // Luu thongg tin tam vao session
            HttpSession session = request.getSession();
            session.setAttribute("tempUsername", username);
            session.setAttribute("tempPassword", password);
            session.setAttribute("tempEmail", email);
            session.setAttribute("tempGender", gender);
            session.setAttribute("tempPhone", phone);
            session.setAttribute("tempDob", dob);
            session.setAttribute("tempVerifyCode", verifyCode);

            // luu token
            VerifyEmailService verifyEmailService = new VerifyEmailService();
            if (verifyEmailService.saveVerifyEmail(email, verifyCode)) {
                new MailVerify().sendVerificationCode(email, verifyCode);
                request.setAttribute("baoloi", "Đăng ký thành công! Vui lòng kiểm tra email để xác nhận tài khoản");
                request.getRequestDispatcher("email_verify.jsp").forward(request, response);
            } else {
                request.setAttribute("baoloi", "Gửi email xác nhận thất bại, vui lòng thử lại");
                request.getRequestDispatcher("Signup.jsp").forward(request, response);
            }
        } else if (result == 1) { //username da ton tai
            request.setAttribute("baoloi", "Username đã tồn tại");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
        } else if (result == 2) {// email da ton tai
            request.setAttribute("baoloi", "Email đã tồn tại");
            request.getRequestDispatcher("Signup.jsp").forward(request, response);
        } else {
            response.sendRedirect("login");
        }
    }
}