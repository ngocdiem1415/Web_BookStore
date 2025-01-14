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
        response.sendRedirect(request.getContextPath() + "/cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}