package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;

import java.io.IOException;

@WebServlet(name = "User", value = "/admin/add-user")
public class AddUserController extends HttpServlet {
    UserServices userServices = new UserServices();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Add-User.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String dob = request.getParameter("birthdate");
        String gender = request.getParameter("gender");

        int result = userServices.register(username, gender, dob, phone, email, password, "user");
        if (result == 0) {
            request.setAttribute("baoloi", "Thêm người dùng thành công");
            request.getRequestDispatcher("Add-User.jsp").forward(request, response);
        } else if (result == 1) {
            request.setAttribute("baoloi", "Username đã tồn tại");
            request.getRequestDispatcher("Add-User.jsp").forward(request, response);
        } else if (result == 2) {
            request.setAttribute("baoloi", "Email đã tồn tại");
            request.getRequestDispatcher("Add-User.jsp").forward(request, response);
        } else {
            response.sendRedirect("add-user");
        }
    }
}