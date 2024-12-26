package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.InvoiceService;
import vn.edu.hcmuaf.fit.bookstore.beans.Invoice;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "InvoiceController", value = "/Invoice")
public class InvoiceController extends HttpServlet {

    private final InvoiceService invoiceService = InvoiceService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action){
            case "list":
                listInvoices(request, response);
                break;
            case "detail":
                detailInvoice(request, response);
                break;
            default: response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
    }

    private void detailInvoice(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        Invoice invoice = invoiceService.findById(id);
        if (invoice == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        request.setAttribute("invoice", invoice);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/webapp/purchaseOrder.jsp");
        dispatcher.forward(request, response);
    }

    private void listInvoices(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Invoice> invoices = invoiceService.listAll();
        request.setAttribute("invoices", invoices);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/webapp/purchaseOrderDetail.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action ="";

        switch (action){
//            case "create":
//                createInvoiceFromCart(request, response);
//                break;
            case "cancel":
                int id = Integer.parseInt(request.getParameter("id"));
                Invoice invoice = invoiceService.findById(id);
                if (invoice == null) {
                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
                    return;
                }
                invoiceService.cancelInvoice(invoice);
                response.sendRedirect("/Invoice?action=list");
                break;
            default: response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }

    }

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