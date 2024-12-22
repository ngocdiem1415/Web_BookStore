package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "AdminController", value = "/admin/welcome")
public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        User user = (User) session.getAttribute("currentUser");
        if (user == null || user.getRole() != "admin") {
            response.sendRedirect("/login");
            return;
        }
        PrintWriter out = response.getWriter();
        out.println("Welcome to Admin Page");
        out.println(request.getRequestURI());
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}