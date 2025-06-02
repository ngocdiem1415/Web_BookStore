package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.RoleServices;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "LoginController", value = "/login")
public class LoginController extends HttpServlet {
    RoleServices roleServices = RoleServices.getInstance();

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
        int resourceId = roleServices.selectResourceByUserId(user.getUid());
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



            // Lay danh sach cac resource_code ma user co permission = 3
            List<String> userResources = roleServices.getAdminsResources(user.getUid());
            session.setAttribute("userResources", userResources);

            int permissions = roleServices.getPermissionByUserId(user.getUid());
            session.setAttribute("permissions", permissions);


            if (!userResources.isEmpty()) {
                response.sendRedirect(request.getContextPath() + "/admin/dashboard");
            } else {
                response.sendRedirect(request.getContextPath() + "/home");
            }
        }
    }
}