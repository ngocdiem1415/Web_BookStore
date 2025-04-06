package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/admin/product-management")
public class ProductController extends HttpServlet {
    BookDetailService bookDetailService;

    public ProductController() {
        this.bookDetailService = BookDetailService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> products = bookDetailService.listAllProduct();
        request.setAttribute("products", products);
        request.getRequestDispatcher("Product-Management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}