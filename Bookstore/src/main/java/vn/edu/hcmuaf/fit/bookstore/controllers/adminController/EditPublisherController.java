package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.PublisherService;
import vn.edu.hcmuaf.fit.bookstore.beans.Publisher;

import java.io.IOException;

@WebServlet(name = "EditPublisherController", value = "/admin/edit-publisher")
public class EditPublisherController extends HttpServlet {
    PublisherService publisherService = PublisherService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Publisher publisher = publisherService.finPublisherById(id);
        request.setAttribute("publisher", publisher);
        request.getRequestDispatcher("Edit-publisher.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String publisherName = request.getParameter("ten");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        publisherService.updatePublisher(id, publisherName, address, phone);
        response.sendRedirect("publisher");

    }
}