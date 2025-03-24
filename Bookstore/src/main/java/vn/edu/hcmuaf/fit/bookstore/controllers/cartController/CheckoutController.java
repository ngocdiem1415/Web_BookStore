package vn.edu.hcmuaf.fit.bookstore.controllers.cartController;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.InvoiceService;
import vn.edu.hcmuaf.fit.bookstore.Services.PaymentService;
import vn.edu.hcmuaf.fit.bookstore.beans.Invoice;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.BufferedReader;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;

@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("/checkout.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Đọc JSON từ request
        BufferedReader reader = request.getReader();
        Gson gson = new Gson();
        Invoice invoice = gson.fromJson(reader, Invoice.class);

        //Kiểm tra session của User
        HttpSession session = request.getSession(false);
        // Kiểm tra session và user login
        if (session == null || session.getAttribute("userSession") == null) {
            // Nếu chưa đăng nhập, chuyển hướng đến trang login
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        int userId = ((User) session.getAttribute("userSession")).getUid();
        //Cập nhật thông tin cho Invoice
        invoice.setInvoiceId(0);
        invoice.setUid(userId);
        invoice.setOrderDate(LocalDateTime.now());
        invoice.setStatus("Pending"); // Mặc định trạng thái đơn hàng
        invoice.setListInvoiceDetails(new ArrayList<>());
        invoice.setPayment(null);
        //Tạo hóa đơn
        InvoiceService invoiceService = new InvoiceService();

    }
}
