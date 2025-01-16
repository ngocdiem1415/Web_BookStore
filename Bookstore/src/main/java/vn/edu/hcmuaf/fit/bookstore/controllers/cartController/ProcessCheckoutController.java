package vn.edu.hcmuaf.fit.bookstore.controllers.cartController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ProcessCheckoutController", value = "/process-checkout")
public class ProcessCheckoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectedProductsJson = request.getParameter("selectedProducts");

        if (selectedProductsJson != null && !selectedProductsJson.isEmpty()) {
            // Lưu danh sách sản phẩm vào session
            HttpSession session = request.getSession();
            session.setAttribute("selectedProducts", selectedProductsJson);

            // Chuyển hướng tới trang thanh toán (checkout.jsp)
            response.sendRedirect("checkout.jsp");
        } else {
            // Nếu không có sản phẩm nào được chọn, trả về thông báo lỗi
            response.setContentType("text/plain");
            response.getWriter().write("Không có sản phẩm nào được chọn để thanh toán.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}