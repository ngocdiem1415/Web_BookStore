package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.InvoiceService;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.beans.Invoice;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "EditOrderController", value = "/admin/edit-order")
public class EditOrderController extends HttpServlet {
    private InvoiceService invoiceService;
    LogService logService;

    public EditOrderController() {
        this.invoiceService = InvoiceService.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderID = request.getParameter("id");
        System.out.println(orderID);

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");
        try {
            int id = Integer.parseInt(orderID);
            Invoice order = invoiceService.findById(id);
            request.setAttribute("order", order);
            request.setAttribute("mode", "edit");
            request.getRequestDispatcher("Show-Edit-Order.jsp").forward(request, response);
        }catch (Exception e) {
            // Ghi log nếu có lỗi
            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.DANGER,
                    "order-management",
                    "FIND_ORDER_UPDATE_FAILED",
                    true,
                    "{\"order_id\": " + orderID + "}",
                    "{\"error\": \"" + e.getMessage().replace("\"", "\\\"") + "\"}"
            );
            logService.insert(log);

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Lỗi khi cập nhật thông tin order: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}