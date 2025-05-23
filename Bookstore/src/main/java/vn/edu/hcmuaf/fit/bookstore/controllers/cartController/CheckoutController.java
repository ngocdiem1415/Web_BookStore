package vn.edu.hcmuaf.fit.bookstore.controllers.cartController;

import com.google.gson.Gson;
import io.leangen.geantyref.TypeToken;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.InvoiceService;
import vn.edu.hcmuaf.fit.bookstore.Services.PaymentService;
import vn.edu.hcmuaf.fit.bookstore.beans.*;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.BufferedReader;
import java.io.IOException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

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

        //Lấy ra các sản phẩm đã được chọn trong cart để tiến hành tính toán tổng tiền
        Gson gson = new Gson();
        Object selectedProductsObj = session.getAttribute("selectedProducts");
        List<Map<String, Object>> selectedProducts;

        if (selectedProductsObj instanceof String) {
            String selectedProductsJson = (String) selectedProductsObj;
            selectedProducts = gson.fromJson(selectedProductsJson, new TypeToken<List<Map<String, Object>>>() {}.getType());
        } else if (selectedProductsObj instanceof List) {
            selectedProducts = (List<Map<String, Object>>) selectedProductsObj;
        } else {
            selectedProducts = new ArrayList<>();
        }

        if (selectedProducts == null || selectedProducts.isEmpty()) {
            // Nếu không có sản phẩm nào, quay về trang cart
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }
        // Tính tổng tiền hàng
        double totalProductPrice = 0;
        int countProduct =0;
        for (Map<String, Object> product : selectedProducts) {
            // Tính tổng tiền hàng
            double totalPrice = 0;
            Object rawTotal = product.get("totalPrice");
            if (rawTotal instanceof Number) {
                totalPrice = ((Number) rawTotal).doubleValue();
            } else if (rawTotal instanceof String) {
                totalPrice = Double.parseDouble((String) rawTotal);
            }
            totalProductPrice += totalPrice;

            // tính tổng số sản phẩm
            int quantity = 0;
            Object rawQuantity = product.get("quantity");
            if (rawQuantity instanceof Number) {
                quantity = ((Number) rawQuantity).intValue();
            } else if (rawQuantity instanceof String) {
                quantity = Integer.parseInt((String) rawQuantity);
            }
            countProduct += quantity;
        }

        // Phí ship sẽ được lấy từ api giao hàng sau
        double shippingFee = 15000;

        // Tổng cộng
        double totalAmount = totalProductPrice + shippingFee;

        // Đưa vào request để truyền sang JSP
        request.setAttribute("totalProductPrice", totalProductPrice);
        request.setAttribute("shippingFee", shippingFee);
        request.setAttribute("totalAmount", totalAmount);
        request.setAttribute("countProduct", countProduct);

        int userId = ((User) session.getAttribute("userSession")).getUid();
        request.setAttribute("userId", userId);

        //Token GHN
        String token_ghn = QUERIES.MY_GHN_TOKEN;
        request.setAttribute("token_ghn", token_ghn);
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
            payment.setAmount(caculateTotalAmount(orderData.getProducts()) + orderData.getShippingFee()); //Shipping fee lát nữa sẽ được thây thế bằng api giao hàng
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

    //Tính toán tổng tiền hàng (không bao gồm phí vận chuyển)
    private double caculateTotalAmount(List<InvoiceDetail> products) {
        double totalAmount = 0;
        for (InvoiceDetail product : products) {
            totalAmount += product.getQuantity() * product.getUnitPrice();
        }
        return totalAmount;
    }

}
