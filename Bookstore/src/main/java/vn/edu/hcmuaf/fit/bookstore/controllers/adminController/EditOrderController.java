package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.InvoiceService;
import vn.edu.hcmuaf.fit.bookstore.beans.Invoice;

import java.io.IOException;

@WebServlet(name = "EditOrderController", value = "/admin/edit-order")
public class EditOrderController extends HttpServlet {
    private InvoiceService invoiceService;

    public EditOrderController() {
        this.invoiceService = InvoiceService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String orderID = request.getParameter("id");
        System.out.println(orderID);

        if (orderID == null || orderID.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing order ID");
            return;
        }

        int id = Integer.parseInt(orderID);
        Invoice order = invoiceService.findById(id);
        System.out.println(order.toString());
        request.setAttribute("order", order);
        request.setAttribute("mode", "edit");
        request.getRequestDispatcher("Show-Edit-Order.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}