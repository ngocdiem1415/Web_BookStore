package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.beans.Image;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "BookDetailController", value = "/book-detail")
public class BookDetailController extends HttpServlet {
    private BookDetailService bookService;

    public BookDetailController() {
        this.bookService = BookDetailService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");
//        List<Image> images = bookService.findImageByBookId(Integer.parseInt(productId));
        Book book = bookService.findById(Integer.parseInt(productId));
        List<String> paragraphs = Arrays.asList(book.getDescription().split("\n"));
        request.setAttribute("book", bookService.findById(Integer.parseInt(productId)));
        request.setAttribute("paragraphs", paragraphs);
        request.getRequestDispatcher("bookDetail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();

        User userSession = (User) session.getAttribute("userSession");
        if (userSession == null) {
            request.setAttribute("baoloi", "Bạn cần đăng nhập để thực hiện chức năng này");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        } else {
            String productId = request.getParameter("id");
            int userId = userSession.getUid();
            response.sendRedirect(request.getContextPath() + "/book-detail?id=" + productId);
        }
    }
}