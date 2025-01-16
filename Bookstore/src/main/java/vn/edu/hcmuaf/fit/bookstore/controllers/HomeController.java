package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.beans.Category;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {
    private BookDetailService bookDetailService;

    public HomeController() {
        this.bookDetailService = BookDetailService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookId = request.getParameter("id");
        try {
            if (bookId != null && !bookId.isEmpty()) {
                int parsedBookId = Integer.parseInt(bookId); // Chuyển đổi bookId thành int
                Book bookByPromotion = bookDetailService.getBookByPromotionId(parsedBookId);
                request.setAttribute("bookByPromotion", bookByPromotion);
            }
            // Luôn luôn lấy danh sách sách mới
            List<Book> bookList = bookDetailService.listProducts(10, 0);
            request.setAttribute("newBooks", bookList);

            // Lấy sản phẩm theo promotionId trong ngày

            int promotionId = 25;  // Giả sử bạn đã xác định promotionId

            Book bookByPromotion = bookDetailService.getBookByPromotionId(promotionId);
            System.out.println("Book by promotion: " + bookByPromotion);
            request.setAttribute("bookByPromotion", bookByPromotion);


            // Lay san pham ban chay nhat
            List<Book> bestSellerBooks = bookDetailService.getBestSellers(4, 0);
            request.setAttribute("bestSellerBooks", bestSellerBooks);

            // Lấy danh sách thể loại van hoc
            List<Book> literatureBooks = bookDetailService.listByCategory("Văn học", 5, 0);
            request.setAttribute("literatureBooks", literatureBooks);

            // Lấy danh sách thể loại tieu thuyet
            List<Book> novelsBooks = bookDetailService.listByCategory("Tiểu thuyết", 5, 0);
            request.setAttribute("novelsBooks", novelsBooks);

            // Lấy danh sách thể loại Truyen tranh
            List<Book> comicBooks = bookDetailService.listByCategory("Truyện Tranh", 5, 0);
            request.setAttribute("comicBooks", comicBooks);

            // Lấy danh sách thể loại Khac
            List<Book> otherBooks = bookDetailService.listByCategory("Khác", 5, 0);
            request.setAttribute("otherBooks", otherBooks);




        } catch (NumberFormatException e) {
            request.setAttribute("errorMessage", "Invalid book ID format.");
        }
        // Chuyển hướng tới JSP
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookId = request.getParameter("id");

        // Nếu bookId hợp lệ, chuyển hướng tới trang chi tiết sách
        if (bookId != null && !bookId.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/book-detail?id=" + bookId);
        } else {
            // Nếu bookId không hợp lệ, chuyển hướng về trang chủ
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }
}
