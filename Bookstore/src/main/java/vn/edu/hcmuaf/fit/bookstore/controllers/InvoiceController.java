package vn.edu.hcmuaf.fit.bookstore.controllers;

import com.google.gson.Gson;

import java.lang.reflect.Type;

import io.leangen.geantyref.TypeToken;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.InvoiceService;
import vn.edu.hcmuaf.fit.bookstore.Services.PaymentService;
import vn.edu.hcmuaf.fit.bookstore.Services.ReviewService;
import vn.edu.hcmuaf.fit.bookstore.beans.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "InvoiceController", value = "/invoice")
public class InvoiceController extends HttpServlet {
    HttpSession session; // Lấy session hiện tại, không tạo mới
    int userId;
    private final InvoiceService invoiceService = InvoiceService.getInstance();
    private final ReviewService reviewService = ReviewService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            session = request.getSession(false);  // Lấy session hiện tại, không tạo mới
            request.setAttribute("today", java.time.LocalDate.now());
            // Kiểm tra session và user login
            if (session == null || session.getAttribute("userSession") == null) {
                // Nếu chưa đăng nhập, chuyển hướng đến trang login
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            } else {
                userId = ((User) session.getAttribute("userSession")).getUid();
                String action = request.getParameter("action");
                if (action == null) action = "list";

                switch (action) {
                    case "list":
                        listInvoices(request, response);
                        break;
                    case "detail":
                        detailInvoice(request, response);
                        break;
                    case "filterByStatus":
                        filterInvoicesByStatus(request, response);
                        break;
                    case "search":
                        searchInvoicesByBookTitle(request, response);
                        break;
                    default:
                        response.sendError(HttpServletResponse.SC_NOT_FOUND);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Có lỗi xảy ra trong quá trình xử lý yêu cầu.");
        }
    }

    private void searchInvoicesByBookTitle(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String searchKeyword = request.getParameter("searchKeyword");
        if (searchKeyword == null || searchKeyword.trim().isEmpty()) {
            response.sendRedirect("/invoice");
            return;
        }

        List<Invoice> invoices = invoiceService.findByBookTitle(userId, searchKeyword);
        request.setAttribute("invoices", invoices);
        request.setAttribute("searchKeyword", searchKeyword);
        RequestDispatcher dispatcher = request.getRequestDispatcher("purchaseOrder.jsp");
        dispatcher.forward(request, response);
    }

    private void filterInvoicesByStatus(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String status = request.getParameter("status");
        List<Invoice> invoices = invoiceService.findByStatus(userId, status);
        request.setAttribute("invoices", invoices);
        RequestDispatcher dispatcher = request.getRequestDispatcher("purchaseOrder.jsp");
        dispatcher.forward(request, response);
    }

    private void detailInvoice(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Invoice invoice = invoiceService.findById(id);
        System.out.println(invoice);
        if (invoice == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        request.setAttribute("invoice", invoice);
        RequestDispatcher dispatcher = request.getRequestDispatcher("purchaseOrderDetail.jsp");
        dispatcher.forward(request, response);
    }

    private void listInvoices(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Invoice> invoices = invoiceService.findByUser(userId);
        for (Invoice invoice : invoices) {
            boolean hasReviews = reviewService.hasReviewedInvoice(invoice.getUid(), invoice.getInvoiceId());
            invoice.setHasReviews(hasReviews);
        }
        request.setAttribute("invoices", invoices);
//        response.sendRedirect("/invoice");
        RequestDispatcher dispatcher = request.getRequestDispatcher("purchaseOrder.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        userId = ((User) session.getAttribute("userSession")).getUid();
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "cancel":
                cancelInvoice(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }

    }

    private void cancelInvoice(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Invoice invoice = invoiceService.findById(id);
        Payment payment = invoice.getPayment();
        PaymentService paymentService = PaymentService.getInstance();
        System.out.println("Hủy đơn hàng có phương thức thanh toán là: " + payment.getPaymentMethod());

        System.out.println(invoice);
        if (invoice == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        try {
            // Thực hiện hủy đơn hàng và hủy thanh toán
            System.out.println("Hủy đơn hàng có phương thức thanh toán là: " + payment.getPaymentMethod());
//            if (payment.getPaymentMethod() == 1)
//                payment.setPaymentStatus("Failed");
//            else
            payment.setPaymentStatus("Refunded");
            int reCancelPayment = paymentService.update(payment);
            int result = invoiceService.cancelInvoice(invoice);

            if (result > 0 && reCancelPayment > 0) {
                // Chuyển hướng sau khi hủy thành công
                response.sendRedirect("invoice?action=filterByStatus&status=cancelled");
            } else {
                throw new RuntimeException("Hủy đơn hàng thất bại.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Đã xảy ra lỗi khi hủy đơn hàng.");
        }
    }
}