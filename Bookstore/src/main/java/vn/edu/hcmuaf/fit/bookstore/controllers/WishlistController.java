package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.RoleServices;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "Like", value = "/wishlist")
public class WishlistController extends HttpServlet {
    RoleServices roleServices = RoleServices.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        int resourceId = roleServices.selectResourceByUserId(((User) session.getAttribute("userSession")).getUid());
        if (session == null || session.getAttribute("userSession") == null) {
            response.sendRedirect("login");
            return;
        }
        User user = (User) session.getAttribute("userSession");
        boolean isAdmin = roleServices.isAdmin(user.getUid(), resourceId);
        request.setAttribute("isAdmin", isAdmin);
        request.getRequestDispatcher("Like.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}