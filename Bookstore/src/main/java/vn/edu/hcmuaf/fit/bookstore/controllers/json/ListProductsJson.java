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
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ListProductJson", value = "/listBooks")
public class ListProductsJson extends HttpServlet {
    private BookDetailService bookDetailService;


    public ListProductsJson() {
        this.bookDetailService = BookDetailService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        // Lấy số trang và số lượng sản phẩm mỗi trang từ tham số request
        int page = Integer.parseInt(request.getParameter("page"));
        int maxItems = Integer.parseInt(request.getParameter("maxItems"));

        // Tính toán offset
        int offset = (page - 1) * maxItems;

        // Lấy danh sách sản phẩm từ cơ sở dữ liệu
        List<Book> productList = bookDetailService.listProducts(maxItems, offset);
        int totalItems = bookDetailService.totalBooks();  // Tổng số sản phẩm trong cơ sở dữ liệu
        System.out.println(offset + maxItems);

        // Chuyển đổi danh sách sản phẩm thành JSON
        Map<String, Object> result = new HashMap<>();
        result.put("products", productList);
        result.put("totalItems", totalItems);
        System.out.println(result.toString());

        Gson gson = GsonUtil.createGsonWithAdapters();
        String json = gson.toJson(result);
        try (PrintWriter writer = response.getWriter()) {
            response.getWriter().write(json);
        } catch (Exception e) {
            System.err.println("Lỗi khi ghi JSON: " + e.getMessage());
        }
        System.out.println("da chay xong");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}