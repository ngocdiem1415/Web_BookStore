package vn.edu.hcmuaf.fit.bookstore.controllers.Admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.InvoiceService;
import vn.edu.hcmuaf.fit.bookstore.Services.PaymentService;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "OrderAPI", value = "/admin/orderapi")
public class OrderAPI extends HttpServlet {
    private PaymentService paymentService;
    private InvoiceService invoiceService;

    public OrderAPI() {
        this.paymentService = PaymentService.getInstance();
        this.invoiceService = InvoiceService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String idOrder = request.getParameter("invoiceId");
        String paymentMethod = request.getParameter("payment-method");
        String paymentStatus = request.getParameter("payment-status");
        String invoiceStatus = request.getParameter("invoice-status");
//        System.out.println(idOrder + " " + paymentMethod + " " + paymentStatus);

        int id = 0;
        try {
            id = Integer.parseInt(idOrder);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Lỗi định dạng dữ liệu số: " + e.getMessage());
            return;
        }
        int updatePayment = paymentService.updateMethodAndStatus(id, paymentMethod, paymentStatus);
        int updateInvoice = invoiceService.updateStatus(id, invoiceStatus);
        PrintWriter out = response.getWriter();
        if (updatePayment == 1 && updateInvoice == 1) {
            out.write("{\"message\":\"Cập nhật thành công\"}");
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.write("{\"message\":\"Cập nhật thất bại\"}");
        }
        out.flush();
        out.close();
    }
}