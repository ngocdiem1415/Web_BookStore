package vn.edu.hcmuaf.fit.bookstore.controllers.Admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "OrderAPI", value = "/orderapi")
public class OrderAPI extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        System.out.println("da nhan duoc data");
        String idOrder = request.getParameter("id");
        String paymentMethod = request.getParameter("payment-method");
        String paymentStatus = request.getParameter("payment-status");
    }
}