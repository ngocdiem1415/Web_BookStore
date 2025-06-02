package vn.edu.hcmuaf.fit.bookstore.controllers.Admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.InvoiceService;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.PaymentService;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "OrderAPI", value = "/admin/orderapi")
public class OrderAPI extends HttpServlet {
    private PaymentService paymentService;
    private InvoiceService invoiceService;
    private LogService logService;

    public OrderAPI() {
        this.paymentService = PaymentService.getInstance();
        this.invoiceService = InvoiceService.getInstance();
        this.logService = LogService.getInstance();
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

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        PrintWriter out = response.getWriter();
        try {
            int id = Integer.parseInt(idOrder);

            Map<String, String> dataAfter = new HashMap<>();
            dataAfter.put("paymentMethod", paymentMethod);
            dataAfter.put("paymentStatus", paymentStatus);
            dataAfter.put("invoiceStatus", invoiceStatus);

            int updatePayment = paymentService.updateMethodAndStatus(id, paymentMethod, paymentStatus);
            int updateInvoice = invoiceService.updateStatus(id, invoiceStatus);

            if (updatePayment == 1 && updateInvoice == 1) {
                Log log = new Log(
                        admin.getUid(),
                        session.getId(),
                        ip,
                        LogLevel.ALERT,
                        "order-management",
                        "UPDATE_ORDER_SUCCESS",
                        false,
                        "{\"orderId\": " + id + "}",
                        new GsonUtil().toJSon(dataAfter)
                );
                logService.insert(log);

                out.write("{\"message\":\"Cập nhật thành công\"}");
                response.setStatus(HttpServletResponse.SC_OK);
            } else {
                Log log = new Log(
                        admin.getUid(),
                        session.getId(),
                        ip,
                        LogLevel.DANGER,
                        "order-management",
                        "UPDATE_ORDER_FAILED",
                        true,
                        "{\"orderId\": " + id + "}",
                        new GsonUtil().toJSon(dataAfter)
                );
                logService.insert(log);

                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.write("{\"message\":\"Cập nhật thất bại\"}");
            }
        } catch (NumberFormatException e) {
            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.WARNING,
                    "order-management",
                    "INVALID_ORDER_ID_FORMAT",
                    true,
                    "{\"order_id\": \"" + idOrder + "\"}",
                    "{\"error\": \"" + e.getMessage().replace("\"", "\\\"") + "\"}"
            );
            logService.insert(log);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Lỗi định dạng dữ liệu số: " + e.getMessage());
        } finally {
            out.flush();
            out.close();
        }
    }
}