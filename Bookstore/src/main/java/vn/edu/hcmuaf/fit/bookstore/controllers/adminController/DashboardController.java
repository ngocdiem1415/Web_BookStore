package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.Services.InvoiceService;
import vn.edu.hcmuaf.fit.bookstore.Services.PaymentService;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.Invoice;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Dashboard", value = "/admin/dashboard")
public class DashboardController extends HttpServlet {
    InvoiceService invoiceService;
    BookDetailService bookDetailService;
    UserServices userServices = new UserServices();
    PaymentService paymentService;

    public DashboardController() {
        this.invoiceService = InvoiceService.getInstance();
        this.bookDetailService = BookDetailService.getInstance();
        this.paymentService = PaymentService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Invoice> orders = invoiceService.listOrderByDate();
        int totalBook = bookDetailService.totalBooks();
        int totalNewOrder = orders.size();
        int totalU = userServices.getTotalUser();
        int totalPayment = paymentService.getTotalAcountInDay();

        request.setAttribute("orders", orders);
        request.setAttribute("totalBook", totalBook);
        request.setAttribute("totalNewOrder", totalNewOrder);
        request.setAttribute("totalU", totalU);
        request.setAttribute("totalPayment", totalPayment);
        request.getRequestDispatcher("Dashboard.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}