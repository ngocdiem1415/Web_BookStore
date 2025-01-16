package vn.edu.hcmuaf.fit.bookstore.controllers.cartController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.beans.Cart.Cart;

import java.io.IOException;

@WebServlet(name = "UpdateQuantityController", value = "/update-quantity")
public class UpdateQuantityController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productKey = request.getParameter("productKey");
        System.out.println(productKey);
        String quantity = request.getParameter("quantity");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
            cart.updateProductQuantity(productKey, Integer.parseInt(quantity));
            session.setAttribute("cart", cart);
        }

        response.sendRedirect("/Bookstore/cart");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}