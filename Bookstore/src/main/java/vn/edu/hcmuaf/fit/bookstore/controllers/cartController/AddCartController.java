package vn.edu.hcmuaf.fit.bookstore.controllers.cartController;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.beans.Cart.Cart;
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.IOException;

@WebServlet(name = "AddCartController", value = "/add-cart")
public class AddCartController extends HttpServlet {
    HttpSession session;
    BookDetailService bookDetailService;

    public AddCartController() {
        this.bookDetailService = BookDetailService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        session = request.getSession(false);

        if (session == null || session.getAttribute("userSession") == null) {
            response.sendRedirect(request.getContextPath() + "/login"); // Chuyển hướng đến trang đăng nhập
        } else {
            int id = Integer.parseInt(request.getParameter("id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            Book book = bookDetailService.findById(id);
            if (book != null) {
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart == null) {
                    cart = Cart.getInstance();
                }
                cart.addBook(book, quantity);
                session.setAttribute("cart", cart);
                // Sử dụng Gson với TypeAdapter
                Gson gson = GsonUtil.createGsonWithAdapters();
                String json = gson.toJson(cart);
                response.getWriter().write(json);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
    }
}