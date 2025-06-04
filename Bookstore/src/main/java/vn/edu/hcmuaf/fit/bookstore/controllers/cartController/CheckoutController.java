package vn.edu.hcmuaf.fit.bookstore.controllers.cartController;

import com.google.gson.Gson;
import io.leangen.geantyref.TypeToken;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.InvoiceService;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.PaymentService;
import vn.edu.hcmuaf.fit.bookstore.Services.ShippingInfoService;
import vn.edu.hcmuaf.fit.bookstore.beans.*;
import vn.edu.hcmuaf.fit.bookstore.beans.Cart.BookVariant;
import vn.edu.hcmuaf.fit.bookstore.beans.Cart.Cart;
import vn.edu.hcmuaf.fit.bookstore.beans.Order.OrderData;
import vn.edu.hcmuaf.fit.bookstore.beans.Order.ShippingInfo;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.util.*;

@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {
    List<BookVariant> selectedProducts;
    ShippingInfo info;
    private LogService logService = LogService.getInstance();

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
        Cart cart = (Cart) session.getAttribute("cart");
        String selected = (String) session.getAttribute("selectedVariants");

        if (selected != null && cart != null) {
            String[] selectedIds = selected.split(",");
            selectedProducts = new ArrayList<>();

            for (String idStr : selectedIds) {
                // Lặp map để tìm BookVariant có id tương ứng
                for (BookVariant bv : cart.getListBook().values()) {
                    if (String.valueOf(bv.getId()).equals(idStr.trim())) {
                        selectedProducts.add(bv);
                        break;
                    }
                }
            }

            // Sau khi dùng selected, xóa khỏi session để reset
            session.removeAttribute("selectedVariants");

            int userId = ((User) session.getAttribute("userSession")).getUid();
            request.setAttribute("userId", userId);
            //Tính toán các giá trị của đơn hàng
            info = ShippingInfoService.calculateShippingInfo(selectedProducts);
            System.out.println("trong checkout controller: " + info);
            request.setAttribute("shippingInfo", info);
            session.setAttribute("shippingInfo", info);
            // Gửi danh sách qua checkout.jsp
            request.setAttribute("selectedProducts", selectedProducts);

            //Truyền danh sách id của sản phẩm được chọn để tiến hành xóa sp trong cart
            String jsonArray = new Gson().toJson(selectedIds);
            request.setAttribute("selectedIds", jsonArray);
            request.getRequestDispatcher("/checkout.jsp").forward(request, response);
        } else {
            response.sendRedirect("/Bookstore/cart");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("CheckoutController: doPost() triggered");
        PrintWriter out = response.getWriter();

        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("userSession");
        int userId = user.getUid();
        String ip = request.getRemoteAddr();

        try {
            //Đọc JSON từ request
            BufferedReader reader = request.getReader();
            GsonUtil gsonUtil = new GsonUtil();
            OrderData orderData = gsonUtil.getGson().fromJson(reader, OrderData.class);

            // Kiểm tra orderData không có sản phẩm
            if (selectedProducts == null || selectedProducts.isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("{\"error\": \"Không có sản phẩm nào để mua. Vui lòng kiểm tra lại giỏ hàng.\"}");
                return;
            }

            //Tạo đối tượng Invoice
            Invoice invoice = new Invoice();
            invoice.setUid(userId);
            invoice.setRecipientName(orderData.getRecipientName());
            invoice.setRecipientPhone(orderData.getRecipientPhone());
            invoice.setAddress(orderData.getAddress());
            invoice.setOrderDate(LocalDateTime.now());

            int shippingFee = (Integer) session.getAttribute("latestShippingFee");
            invoice.setShippingFee(shippingFee);
            //Tạo list invoiceDetail
            List<InvoiceDetail> listInvoiceDetails = new ArrayList<>();
            for (BookVariant bv : selectedProducts) {
                InvoiceDetail invoiceDetail = new InvoiceDetail(bv.getBook().getbId(), bv.getQuantity(), bv.getBook().getsalePrice());
                listInvoiceDetails.add(invoiceDetail);
            }
            invoice.setListInvoiceDetails(listInvoiceDetails);
            System.out.println("List book in checkout: " + invoice.getListInvoiceDetails());

            //Tạo thông tin thanh toán của đơn hàng
            Payment payment = new Payment();
            payment.setAmount(shippingFee + info.getTotalPrice()); //Shipping fee lát nữa sẽ được thây thế bằng api giao hàng
            payment.setPaymentDate(LocalDateTime.now());
            payment.setPaymentStatus("Pending");
            invoice.setStatus("Pending");

            if (orderData.getPaymentMethod().equals("COD")){
                payment.setPaymentMethod(1); //Thanh toán khi nhận hàng
            }
            else {
                payment.setPaymentMethod(2); //Thanh toán bằng chuyển khoản ngân hàng (VNPay)
            }

            invoice.setPayment(payment);
            System.out.println("payment in checkout" + invoice.getPayment());
            //Tạo hóa đơn
            InvoiceService invoiceService = new InvoiceService();
            int invoiceId = invoiceService.insert(invoice);

            // Theem log
                        Log log = new Log(user.getUid(), session.getId(), ip, LogLevel.INFO, "invoice", "CREATE_INVOICE",
                    false, "", new GsonUtil().toJSon(invoice));
            logService.insert(log);


            // Trả về phản hồi JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.write("{\"message\": \"Invoice created successfully!\", \"invoiceId\": " + invoiceId + "}");
            out.close();
            out.flush();
        } catch (IllegalStateException e) {
            // Lỗi vượt số lượng sản phẩm trong kho
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            Gson gson = new Gson();
            String jsonError = gson.toJson(Collections.singletonMap("error", e.getMessage()));
            out.write(jsonError);
            out.close();
            out.flush();
            System.out.println("Loi vuot qua ton kho: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // 500
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            out.write("{\"error\": \"Có lỗi xảy ra khi xử lý đơn hàng.\"}");
            out.close();
            out.flush();
        }

    }

}
