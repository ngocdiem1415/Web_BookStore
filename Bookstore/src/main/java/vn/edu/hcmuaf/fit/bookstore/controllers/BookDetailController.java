package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;

import java.io.IOException;

@WebServlet(name = "BookDetailController", value = "/BookDetail")
public class BookDetailController extends HttpServlet {
    private BookDetailService bookService;

    public BookDetailController() {
        this.bookService = BookDetailService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = String.valueOf(request.getParameter("id"));
        Book book = bookService.findById(Integer.parseInt(productId));
        request.setAttribute("productDetail", book);
        request.getRequestDispatcher("bookDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}