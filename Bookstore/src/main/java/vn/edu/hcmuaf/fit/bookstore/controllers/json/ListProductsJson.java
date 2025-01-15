package vn.edu.hcmuaf.fit.bookstore.controllers.json;

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
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ListProductJson", value = "/listBooks")
public class ListProductsJson extends HttpServlet {
    private BookDetailService bookService;
    List<Book> listBook;

    int pageIndexNum = 1;
    int perPageNum = 9;

    int from = 0;
    int to = 1000000;

    String category = null;
    String find;

    public ListProductsJson() {
        this.bookService = BookDetailService.getInstance();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        // Lấy giá trị từ header
        String find = request.getParameter("find");
        request.setAttribute("find", find);

        // Xử lý giá trị mặc định và chuyển đổi tham số
        pageIndexNum = getIntParameter(request, "page-index", 1);
        perPageNum = getIntParameter(request, "per-page", 10);
        int category = getIntParameter(request, "category", 0);
        int publisher = getIntParameter(request, "publisher", 0);
        String orderBy = request.getParameter("orderBy");
        double ratingValue = getDoubleParameter(request, "ratingValue", 0.0);
        int firstPrice = getIntParameter(request, "firstPrice", 0);
        int secondPrice = getIntParameter(request, "secondPrice", Integer.MAX_VALUE);
        // Tính toán offset cho phân trang
        int offset = (pageIndexNum - 1) * perPageNum;
        int limit = perPageNum;
        System.out.println("category " + category +" publisher "+ publisher+" find " +find +" limit " +limit+ " offset "+ offset + " orderBy " +orderBy+
                " rating " +ratingValue+ "firstPrice " +firstPrice+ "second " +secondPrice);
        listBook = bookService.getBooks(category, publisher,find, limit, offset, orderBy, ratingValue, firstPrice, secondPrice);
        System.out.println(listBook.toString());
        // Chuyển đổi danh sách sách thành JSON
        if (listBook != null) {
            String json = new Gson().toJson(listBook);
            PrintWriter out = response.getWriter();
            try {
                out.println(json);
            } finally {
                out.close();
            }
        }
        System.out.println("da chay toi day");
    }

    private int getIntParameter(HttpServletRequest request, String param, int defaultValue) {
        String value = request.getParameter(param);
        try {
            return value != null && !value.isEmpty() ? Integer.parseInt(value) : defaultValue;
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    // Hàm tiện ích để lấy tham số double với giá trị mặc định
    private double getDoubleParameter(HttpServletRequest request, String param, double defaultValue) {
        String value = request.getParameter(param);
        try {
            return value != null && !value.isEmpty() ? Double.parseDouble(value) : defaultValue;
        } catch (NumberFormatException e) {
            return defaultValue;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}