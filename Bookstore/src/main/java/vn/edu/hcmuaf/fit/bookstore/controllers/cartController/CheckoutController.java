package vn.edu.hcmuaf.fit.bookstore.controllers.cartController;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.InvoiceService;
import vn.edu.hcmuaf.fit.bookstore.Services.PaymentService;
import vn.edu.hcmuaf.fit.bookstore.beans.Invoice;
import vn.edu.hcmuaf.fit.bookstore.beans.InvoiceDetail;
import vn.edu.hcmuaf.fit.bookstore.beans.Payment;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.BufferedReader;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Kiểm tra session của User
        HttpSession session = request.getSession(false);
        // Kiểm tra session và user login
        if (session == null || session.getAttribute("userSession") == null) {
            // Nếu chưa đăng nhập, chuyển hướng đến trang login
            response.sendRedirect(request.getContextPath() + "/login");
            System.out.println("CheckoutController: redirect to login");
            return;
        }
        int userId = ((User) session.getAttribute("userSession")).getUid();
        request.setAttribute("userId", userId);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/checkout.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("CheckoutController: doPost() triggered");

        HttpSession session = request.getSession(false);
        int userId = ((User) session.getAttribute("userSession")).getUid();

        try {
            //Đọc JSON từ request
            BufferedReader reader = request.getReader();
            GsonUtil gsonUtil = new GsonUtil();
            OrderData orderData = gsonUtil.getGson().fromJson(reader, OrderData.class);
            System.out.println("orderData: " + orderData);

            // Kiểm tra orderData không có sản phẩm
            if (orderData == null || orderData.getProducts() == null || orderData.getProducts().isEmpty()) {
                // Trả JSON thông báo lỗi:
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"error\": \"Không có sản phẩm nào để mua. Vui lòng kiểm tra lại giỏ hàng.\"}");
                System.out.println("❗ Không có sản phẩm trong orderData.");
                response.sendRedirect(request.getContextPath() + "/cart");
                return;
            }

            //Tạo đối tượng Invoice
            Invoice invoice = new Invoice();
            invoice.setUid(userId);
            invoice.setRecipientName(orderData.getRecipientName());
            invoice.setRecipientPhone(orderData.getRecipientPhone());
            invoice.setAddress(orderData.getAddress());
            invoice.setOrderDate(LocalDateTime.now());
            invoice.setStatus("Pending");
            invoice.setShippingFee(orderData.getShippingFee());
            //Tạo list invoiceDetail
            invoice.setListInvoiceDetails(orderData.getProducts());
            System.out.println("List book in checkout: " + invoice.getListInvoiceDetails());

            //Tạo thông tin thanh toán của đơn hàng
            Payment payment = new Payment();
            payment.setAmount(orderData.getTotalAmount());
            payment.setPaymentDate(LocalDateTime.now());
            payment.setPaymentStatus("Pending");
            if (orderData.getPaymentMethod().equals("COD"))
                payment.setPaymentMethod(1); //Thanh toán khi nhận hàng
            else payment.setPaymentMethod(2); //Thanh toán bằng chuyển khoản ngân hàng (VNPay)

            invoice.setPayment(payment);
            System.out.println("payment in checkout" + invoice.getPayment());
            //Tạo hóa đơn
            InvoiceService invoiceService = new InvoiceService();
            int invoiceId = invoiceService.insert(invoice);

            // Trả về phản hồi JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"message\": \"Invoice created successfully!\", \"invoiceId\": " + invoiceId + "}");
            System.out.println("✅ orderData received: " + orderData);
        } catch (IllegalStateException e) {
            // Lỗi vượt số lượng sản phẩm trong kho
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            Gson gson = new Gson();
            String jsonError = gson.toJson(Collections.singletonMap("error", e.getMessage()));
            response.getWriter().write(jsonError);
            System.out.println("❌ Loi vuot qua ton kho: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("{\"error\": \"Có lỗi xảy ra khi xử lý đơn hàng.\"}");
        }
    }

    class OrderData {
        private String recipientName;
        private String recipientPhone;
        private String address;
        private List<InvoiceDetail> products;
        private double shippingFee;
        private double totalAmount;
        private String paymentMethod;

        public OrderData(String recipientName, String recipientPhone, String address, List<InvoiceDetail> products, double shippingFee, double totalAmount, String paymentMethod) {
            this.recipientName = recipientName;
            this.recipientPhone = recipientPhone;
            this.address = address;
            this.products = products;
            this.shippingFee = shippingFee;
            this.totalAmount = totalAmount;
            this.paymentMethod = paymentMethod;
        }

        public OrderData() {
        }

        public String getRecipientName() {
            return recipientName;
        }

        public String getRecipientPhone() {
            return recipientPhone;
        }

        public String getAddress() {
            return address;
        }

        public List<InvoiceDetail> getProducts() {
            return products;
        }

        public double getShippingFee() {
            return shippingFee;
        }

        public double getTotalAmount() {
            return totalAmount;
        }

        public String getPaymentMethod() {
            return paymentMethod;
        }

        public void setRecipientName(String recipientName) {
            this.recipientName = recipientName;
        }

        public void setRecipientPhone(String recipientPhone) {
            this.recipientPhone = recipientPhone;
        }

        public void setAddress(String address) {
            this.address = address;
        }

        public void setProducts(List<InvoiceDetail> products) {
            this.products = products;
        }

        public void setShippingFee(double shippingFee) {
            this.shippingFee = shippingFee;
        }

        public void setTotalAmount(double totalAmount) {
            this.totalAmount = totalAmount;
        }

        public void setPaymentMethod(String paymentMethod) {
            this.paymentMethod = paymentMethod;
        }

        @Override
        public String toString() {
            return "OrderData{" +
                    "recipientName='" + recipientName + '\'' +
                    ", recipientPhone='" + recipientPhone + '\'' +
                    ", address='" + address + '\'' +
                    ", products=" + products +
                    ", shippingFee=" + shippingFee +
                    ", totalAmount=" + totalAmount +
                    ", paymentMethod='" + paymentMethod + '\'' +
                    '}';
        }
    }
}
