package vn.edu.hcmuaf.fit.bookstore.controllers;

import com.google.gson.Gson;
import java.lang.reflect.Type;

import io.leangen.geantyref.TypeToken;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.InvoiceService;
import vn.edu.hcmuaf.fit.bookstore.Services.ReviewService;
import vn.edu.hcmuaf.fit.bookstore.beans.Invoice;
import vn.edu.hcmuaf.fit.bookstore.beans.Review;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

@WebServlet(name = "InvoiceController", value = "/invoice")
public class InvoiceController extends HttpServlet {
    HttpSession session; // Lấy session hiện tại, không tạo mới
    int userId;
    private final InvoiceService invoiceService = InvoiceService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        session = request.getSession(false);  // Lấy session hiện tại, không tạo mới

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
        int userId = Integer.parseInt(request.getParameter("userId"));
        String status = request.getParameter("status");
        List<Invoice> invoices = invoiceService.findByStatus(userId, status);
        request.setAttribute("invoices", invoices);
        RequestDispatcher dispatcher = request.getRequestDispatcher("purchaseOrder.jsp");
        dispatcher.forward(request, response);
    }

    private void detailInvoice(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Invoice invoices = invoiceService.findById(id);
        if (invoices == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        request.setAttribute("invoices", invoices);
        RequestDispatcher dispatcher = request.getRequestDispatcher("purchaseOrderDetail.jsp");
        dispatcher.forward(request, response);
    }

    private void listInvoices(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Invoice> invoices = invoiceService.findByUser(userId);
        request.setAttribute("invoices", invoices);
        RequestDispatcher dispatcher = request.getRequestDispatcher("purchaseOrder.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
//            case "create":
//                createInvoiceFromCart(request, response);
//                break;
//            case "review":
//                saveReviews(request, response);
//                break;
            case "cancel":
                int id = Integer.parseInt(request.getParameter("id"));
                Invoice invoice = invoiceService.findById(id);
                if (invoice == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }
                invoiceService.cancelInvoice(invoice);
                response.sendRedirect("/invoice?action=list");
                break;
            default:
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }

    }

//    private void saveReviews(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        // Lấy thông tin đơn hàng và danh sách đánh giá từ request
//        int invoiceId = Integer.parseInt(request.getParameter("invoiceId"));
//        String reviewsJson = request.getParameter("reviews");
//
//        System.out.println("Reviews...............");
//        //console
//        System.out.println(invoiceId);
//        System.out.println(reviewsJson);
//
//        // Chuyển đổi chuỗi JSON thành đối tượng
//        Gson gson = new Gson();
//        Type reviewListType = new TypeToken<List<Review>>(){}.getType();
//        List<Review> reviews = gson.fromJson(reviewsJson, reviewListType);
//
//        // Lưu đánh giá cho các sản phẩm
//        boolean allReviewsSuccess = true;
//        for (Review review : reviews) {
//            boolean reviewSaved = ReviewService.getInstance().addReview(review); // Lưu từng đánh giá
//            if (!reviewSaved) {
//                allReviewsSuccess = false; // Nếu có lỗi trong việc lưu đánh giá, đánh dấu không thành công
//            }
//        }
//
//        // Trả về phản hồi cho client
//        response.setContentType("application/json");
//        response.setCharacterEncoding("UTF-8");
//
//        PrintWriter out = response.getWriter();
//        if (allReviewsSuccess) {
//            out.print("{\"status\": \"success\"}");
//        } else {
//            out.print("{\"status\": \"error\"}");
//        }
//        out.flush();
//    }


//    private void createInvoiceFromCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession session = request.getSession();
//        List<InvoiceDetail> cart = (List<InvoiceDetail>) session.getAttribute("cart");
//
//        if (cart == null || cart.isEmpty()) {
//            request.setAttribute("error", "Your cart is empty. Cannot create an invoice.");
//            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/cart.jsp");
//            dispatcher.forward(request, response);
//            return;
//        }
//
//        try {
//            Invoice newInvoice = new Invoice();
//            newInvoice.setListInvoiceDetails(cart);
//            // Set other properties of Invoice as needed, e.g., userId, totalAmount, etc.
//
//            int result = invoiceService.insert(newInvoice);
//
//            if (result > 0) {
//                session.removeAttribute("cart"); // Clear the cart after creating the invoice
//                response.sendRedirect("/Invoice?action=list");
//            } else {
//                request.setAttribute("error", "Failed to create invoice.");
//                RequestDispatcher dispatcher = request.getRequestDispatcher("/views/cart.jsp");
//                dispatcher.forward(request, response);
//            }
//        } catch (Exception e) {
//            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
//        }
//    }

}