package vn.edu.hcmuaf.fit.bookstore.controllers;

import com.google.gson.Gson;
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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ListBookController", value = "/listBook")
public class ListBookController extends HttpServlet {
    private BookDetailService bookDetailService;
    private CategoryService categoryService;
    private PublisherService publisherService;
    private int page = 1;
    private int maxPageItem = 9;
    private int totalItem = -1;

    public ListBookController() {
        this.bookDetailService = BookDetailService.getInstance();
        this.categoryService = CategoryService.getInstance();
        this.publisherService = PublisherService.getInstance();

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = categoryService.listCategory();
        List<Publisher> publishers = publisherService.listPublisher();
        request.setAttribute("categories", categories);
        request.setAttribute("publishers", publishers);
        request.getRequestDispatcher("listBook.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}