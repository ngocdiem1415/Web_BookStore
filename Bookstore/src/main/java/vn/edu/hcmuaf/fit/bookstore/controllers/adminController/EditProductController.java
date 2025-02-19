package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;

import java.io.IOException;

@WebServlet(name = "EditProductController", value = "/admin/EditProductController")
public class EditProductController extends HttpServlet {
    BookDetailService bookDetailService;

    public EditProductController() {
        this.bookDetailService = BookDetailService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");
        if (productId != null && !productId.isEmpty()) {
            int id = Integer.parseInt(productId);
            Book book = bookDetailService.findById(id);

            if (book != null) {
                request.setAttribute("book", book);
                request.getRequestDispatcher("Edit-product.jsp").forward(request,response);
            }
        }

        request.getRequestDispatcher("Edit-product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}