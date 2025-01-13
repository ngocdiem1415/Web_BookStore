package vn.edu.hcmuaf.fit.bookstore.controllers.cartController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.beans.Cart.Cart;

import java.io.IOException;

@WebServlet(name = "AddCartController", value = "/add-cart")
public class AddCartController extends HttpServlet {
    BookDetailService bookDetailService ;

    public AddCartController() {
        this.bookDetailService = BookDetailService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Book book = bookDetailService.findById(Integer.parseInt(id));
        if ( book != null){
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if (cart == null){
                cart = Cart.getInstance();
            }
            cart.addBook(book,);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}