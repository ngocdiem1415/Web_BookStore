package vn.edu.hcmuaf.fit.bookstore.json;

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

@WebServlet(name = "ListProductJson", value = "/ListProductJson")
public class ListProductsJson extends HttpServlet {
    private BookDetailService bookService;
    private CategoryService categoryService;
    private PublisherService publisherService;
    List<Book> listBook;
    int pageIndexNum = 1;
    int totalPage;
    int countNum = 0;
    int from = 0;
    int to = 1000000;
    int maxPageItem = 20;
    String category = null;
    String find;

    public ListProductsJson() {
        this.bookService = BookDetailService.getInstance();
        this.categoryService = CategoryService.getInstance();
        this.publisherService = PublisherService.getInstance();

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        List<Category> categories= categoryService.listCategory();
        List<Publisher> publishers = publisherService.listPublisher();
        request.setAttribute("categories", categories);
        request.setAttribute("publishers", publishers);

        totalPage = bookService.totalBooks();
        request.setAttribute("totalPage", totalPage);
        int limit = (int) Math.ceil((double) totalPage / maxPageItem);

        // Lấy giá trị từ header
        String find = request.getParameter("find");
        request.setAttribute("find", find);


        // Xử lý giá trị mặc định và chuyển đổi tham số
        int pageIndex = getIntParameter(request, "page-index", 1);
        int perPage = getIntParameter(request, "per-page", 10);
        int category = getIntParameter(request, "category", 0);
        int publisher = getIntParameter(request, "publisher", 0);
        String orderBy = request.getParameter("orderBy");
        double ratingValue = getDoubleParameter(request, "ratingValue", 0.0);
        int firstPrice = getIntParameter(request, "firstPrice", 0);
        int secondPrice = getIntParameter(request, "secondPrice", Integer.MAX_VALUE);
        // Tính toán offset cho phân trang
        int offset = (pageIndex - 1) * limit;

        listBook = bookService.getBooks(category, publisher,find, limit, offset, orderBy, ratingValue, firstPrice, secondPrice);

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

        RequestDispatcher rd = request.getRequestDispatcher("listBook.jsp");
        rd.forward(request, response);
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