package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.Services.CategoryService;
import vn.edu.hcmuaf.fit.bookstore.Services.PublisherService;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.beans.Category;
import vn.edu.hcmuaf.fit.bookstore.beans.Publisher;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ListBookController", value = "/listBook")
public class ListBookController extends HttpServlet {
    private BookDetailService bookDetailService;
    private CategoryService categoryService;
    private PublisherService publisherService;

    public ListBookController() {
        this.bookDetailService = BookDetailService.getInstance();
        this.categoryService = CategoryService.getInstance();
        this.publisherService = PublisherService.getInstance();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> books = bookDetailService.listProducts(20);// biến  limit
        List<Category> categoryServices = categoryService.listCategory();
        List<Publisher> publisherServices = publisherService.listPublisher();
        request.setAttribute("books", books);
        request.getRequestDispatcher("listBook.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}