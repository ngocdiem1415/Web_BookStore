package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
        rd.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        UserServices userServices = new UserServices();
        User user = userServices.findByUsernameAndPassword(username, password);
        System.out.println(user);
        String baoloi = "";
        if (user == null) {
            baoloi = "Sai tên đăng nhập hoặc mật khẩu";
            request.setAttribute("baoloi", baoloi);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else if (user.getStatus() == 0) {
            baoloi = "Tài khoản chưa được kích hoạt";
            request.setAttribute("baoloi", baoloi);
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            HttpSession session = request.getSession(true);
            session.setAttribute("userSession", user);
            session.setAttribute("role", user.getRole());

            if ("user".equals(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/home");
            } else if ("admin".equals(user.getRole())) {
                response.sendRedirect(request.getContextPath() + "/home");
            }
        }
    }
}