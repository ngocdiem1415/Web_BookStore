package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.*;
import vn.edu.hcmuaf.fit.bookstore.beans.Invoice;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "Dashboard", value = "/admin/dashboard")
public class DashboardController extends HttpServlet {
    InvoiceService invoiceService;
    BookDetailService bookDetailService;
    UserServices userServices = new UserServices();
    PaymentService paymentService;
    LogService logService;

    public DashboardController() {
        this.invoiceService = InvoiceService.getInstance();
        this.bookDetailService = BookDetailService.getInstance();
        this.paymentService = PaymentService.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Invoice> orders = invoiceService.listOrderByDate();
        int totalBook = bookDetailService.totalBooks();
        int totalNewOrderInDay = orders.size();
        int totalUInDay = userServices.getTotalUserInDay();
        int totalPaymentInDay = paymentService.getTotalAcountInDay();

        request.setAttribute("orders", orders);
        request.setAttribute("totalBook", totalBook);
        request.setAttribute("totalNewOrder", totalNewOrderInDay);
        request.setAttribute("totalU", totalUInDay);
        request.setAttribute("totalPayment", totalPaymentInDay);

        List<Integer> listYear = invoiceService.getListYear();
        request.setAttribute("listYear", listYear);
        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        Log log = new Log(admin.getUid(), session.getId(), ip, LogLevel.INFO, "dashboard", "VIEW_DASHBOARD",
                false, "{}", "{\"admin\": \"" + admin.getUsername() + "\"}");
        logService.insert(log);
        request.getRequestDispatcher("Dashboard.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}