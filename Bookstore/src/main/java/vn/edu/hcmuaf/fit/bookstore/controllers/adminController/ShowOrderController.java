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

@WebServlet(name = "ShowOrderController", value = "/admin/show-order")
public class ShowOrderController extends HttpServlet {
    private InvoiceService invoiceService;
    private LogService logService;

    public ShowOrderController() {
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
            request.setAttribute("mode", "show");
            request.setAttribute("order", order);

            Log log = new Log(admin.getUid(), session.getId(), ip, LogLevel.INFO, "order-management", "VIEW_ORDER_DETAIL",
                    false, "{}", "{\"admin\": \"" + admin.getUsername() + "\"}");
            logService.insert(log);

            request.getRequestDispatcher("Show-Edit-Order.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

}