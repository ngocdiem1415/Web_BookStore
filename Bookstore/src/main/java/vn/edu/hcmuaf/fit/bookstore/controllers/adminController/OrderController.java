package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.InvoiceService;
import vn.edu.hcmuaf.fit.bookstore.beans.Invoice;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "OrderController", value = "/admin/order-management")
public class OrderController extends HttpServlet {
    InvoiceService invoiceService;

    public OrderController() {
        this.invoiceService = InvoiceService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Invoice> orders = invoiceService.listAll();

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("Order-Management.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}