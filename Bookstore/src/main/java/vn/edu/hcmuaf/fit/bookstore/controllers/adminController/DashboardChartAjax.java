package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import com.fasterxml.jackson.databind.ObjectMapper;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.Services.InvoiceService;
import vn.edu.hcmuaf.fit.bookstore.Services.PaymentService;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "DashboardChartAjax", value = "/admin/dashboardChartAjax")
public class DashboardChartAjax extends HttpServlet {
    InvoiceService invoiceService;
    BookDetailService bookDetailService;
    PaymentService paymentService;

    public DashboardChartAjax() {
        this.invoiceService = InvoiceService.getInstance();
        this.bookDetailService = BookDetailService.getInstance();
        this.paymentService = PaymentService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int year = Integer.parseInt(request.getParameter("year"));
        List<String> months = List.of("Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4","Tháng 5","Tháng 6","Tháng 7","Tháng 8","Tháng 9","Tháng 10","Tháng 11","Tháng 12");
        List<Integer> orderCounts = invoiceService.listTotalInvoicesInMonth(year);
        List<Double> revenues = paymentService.listPaymentInYear(year);

        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> result = new HashMap<>();
        result.put("months", months);
        result.put("orderCounts", orderCounts);
        result.put("revenues", revenues);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(mapper.writeValueAsString(result));

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}