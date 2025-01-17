package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.PublisherService;

import java.io.IOException;

@WebServlet(name = "AddPublisherController", value = "/admin/add-publisher")
public class AddPublisherController extends HttpServlet {

    PublisherService publisherService = PublisherService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Add-publisher.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("ten");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        publisherService.insertPublisher(name, address, phone);


        response.sendRedirect("publisher");
    }
}