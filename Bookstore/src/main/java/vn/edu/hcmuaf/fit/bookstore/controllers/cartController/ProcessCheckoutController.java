package vn.edu.hcmuaf.fit.bookstore.controllers.cartController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "ProcessCheckoutController", value = "/process-checkout")
public class ProcessCheckoutController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selected = request.getParameter("selectedVariants");

        if (selected != null && !selected.equals("")) {
            HttpSession session = request.getSession();
            session.setAttribute("selectedVariants", selected);

            response.sendRedirect(request.getContextPath() + "/checkout"); // Chuyển sang xử lý trang thanh toán
        } else {
            // Nếu không có sản phẩm nào được chọn, trả về thông báo lỗi
            response.setContentType("text/plain");
            response.getWriter().write("Không có sản phẩm nào được chọn để thanh toán.");
        }

    }
}