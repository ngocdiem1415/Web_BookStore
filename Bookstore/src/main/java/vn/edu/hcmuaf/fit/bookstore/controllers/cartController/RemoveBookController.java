package vn.edu.hcmuaf.fit.bookstore.controllers.cartController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.beans.Cart.Cart;

import java.io.IOException;

@WebServlet(name = "RemoveBookController", value = "/remove-book-in-cart")
public class RemoveBookController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productKey = request.getParameter("productKey");

        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            cart.removeProduct(productKey);
            session.setAttribute("cart", cart);
        }

        // Kiểm tra xem đây có phải là AJAX request không
        String requestedWith = request.getHeader("X-Requested-With");

        // Nếu là AJAX, chỉ trả về một status OK
        if ("XMLHttpRequest".equals(requestedWith)) {
            response.setStatus(HttpServletResponse.SC_OK);  // Trả về HTTP status OK
            response.getWriter().write("OK");  // Có thể trả về thông báo để client biết đã xóa thành công
        } else {
            response.sendRedirect(request.getContextPath() + "/cart");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}