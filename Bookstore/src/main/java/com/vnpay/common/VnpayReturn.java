/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package com.vnpay.common;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.bookstore.Services.InvoiceService;
import vn.edu.hcmuaf.fit.bookstore.Services.PaymentService;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author HP
 */
@WebServlet(name = "VnpayReturn", urlPatterns = {"/vnpay_return"})
public class VnpayReturn extends HttpServlet {
    InvoiceService invoiceService = new InvoiceService();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
//    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");
//        try ( PrintWriter out = response.getWriter()) {
//            Map fields = new HashMap();
//            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
//                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
//                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
//                if ((fieldValue != null) && (fieldValue.length() > 0)) {
//                    fields.put(fieldName, fieldValue);
//                }
//            }
//
//            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
//            if (fields.containsKey("vnp_SecureHashType")) {
//                fields.remove("vnp_SecureHashType");
//            }
//            if (fields.containsKey("vnp_SecureHash")) {
//                fields.remove("vnp_SecureHash");
//            }
//            String signValue = Config.hashAllFields(fields);
//            if (signValue.equals(vnp_SecureHash)) {
//                String paymentCode = request.getParameter("vnp_TransactionNo");
//
//                String orderId = request.getParameter("vnp_TxnRef");
//
//                boolean transSuccess = "00".equals(request.getParameter("vnp_TransactionStatus"));
//                request.setAttribute("transResult", transSuccess);
//
//
//                request.getRequestDispatcher("paymentResult.jsp").forward(request, response);
//            } else {
//                //RETURN PAGE ERROR
//                System.out.println("GD KO HOP LE (invalid signature)");
//            }
//        }
//    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        Map fields = new HashMap();
        for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                fields.put(fieldName, fieldValue);
            }
        }

        PaymentService paymentService = new PaymentService();

        String vnp_SecureHash = request.getParameter("vnp_SecureHash");
        fields.remove("vnp_SecureHashType");
        fields.remove("vnp_SecureHash");

        // Lấy mã giao dịch từ request
        int orderId = Integer.parseInt(request.getParameter("vnp_TxnRef"));

        String signValue = Config.hashAllFields(fields);
        if (signValue.equals(vnp_SecureHash)) {
            // ✔ Giao dịch hợp lệ
            boolean success = "00".equals(request.getParameter("vnp_TransactionStatus"));
            if (success) {
                paymentService.updatePaymentStatus(orderId, "Completed");
            }

            // Truyền dữ liệu qua JSP
            request.setAttribute("success", success);
            request.setAttribute("amount", request.getParameter("vnp_Amount"));
            request.setAttribute("orderId", request.getParameter("vnp_TxnRef"));
            request.setAttribute("bankCode", request.getParameter("vnp_BankCode"));
            request.setAttribute("transactionNo", request.getParameter("vnp_TransactionNo"));
            request.setAttribute("payDate", request.getParameter("vnp_PayDate"));

            request.getRequestDispatcher("vnpay_return.jsp").forward(request, response);
        } else {
            response.getWriter().println("Giao dịch không hợp lệ (invalid signature)");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
