package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.RoleServices;
import vn.edu.hcmuaf.fit.bookstore.beans.Permission;
import vn.edu.hcmuaf.fit.bookstore.beans.Role;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "RoleManagement", value = "/admin/role-management")
public class RoleManagement extends HttpServlet {
    RoleServices roleServices = RoleServices.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Permission> roles = roleServices.findAll();
        request.setAttribute("roles", roles);
        request.getRequestDispatcher("Role-Management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}