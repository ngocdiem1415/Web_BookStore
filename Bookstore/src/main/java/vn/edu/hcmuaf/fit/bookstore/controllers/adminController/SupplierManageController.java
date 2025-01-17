package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.PublisherService;
import vn.edu.hcmuaf.fit.bookstore.beans.Publisher;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "SupplierManageController", value = "/admin/publisher")
public class SupplierManageController extends HttpServlet {
    PublisherService publisherService = PublisherService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Publisher>publishers = publisherService.listPublisher();
        request.setAttribute("publishers", publishers);

        request.getRequestDispatcher("Supplier-Management.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}