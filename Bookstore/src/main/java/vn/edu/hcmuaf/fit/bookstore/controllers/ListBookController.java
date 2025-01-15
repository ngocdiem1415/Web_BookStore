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
        List<Category> categories= categoryService.listCategory();
        List<Publisher> publishers = publisherService.listPublisher();
        request.setAttribute("categories", categories);
        request.setAttribute("publishers", publishers);
        List<Book> listbooks = bookDetailService.listProducts(20,0);
        request.setAttribute("books", listbooks);
        // Lấy giá trị từ header
        String find = request.getParameter("find");
        request.setAttribute("find", find);
        totalItem = bookDetailService.totalBooks();
        if (totalItem != -1) {
            // paging attribute setup
            request.setAttribute("page", page);
            request.setAttribute("totalPage", (int) Math.ceil((double) totalItem / maxPageItem));
            RequestDispatcher rd = request.getRequestDispatcher("listBook.jsp");

            try {
                rd.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}