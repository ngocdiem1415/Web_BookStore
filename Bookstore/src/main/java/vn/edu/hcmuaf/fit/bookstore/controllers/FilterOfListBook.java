package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ListProductJson", value = "/filter")
public class FilterOfListBook extends HttpServlet {
    private BookDetailService bookDetailService;


    public FilterOfListBook() {
        this.bookDetailService = BookDetailService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String publisher = request.getParameter("publisher");
        String category = request.getParameter("category");
        String firstPrice = request.getParameter("firstPrice");
        String secondPrice = request.getParameter("secondPrice");
        String rating = request.getParameter("rating");
        String sort = request.getParameter("sort");
        String pageStr = request.getParameter("page");
        String findWord = request.getParameter("find");
//        System.out.println(publisher+";"+category+";"+firstPrice+";"+secondPrice+";"+rating+";"+sort+";"+findWord+";"+pageStr);

        // Lấy số trang và số lượng sản phẩm mỗi trang từ tham số request
        int page = Integer.parseInt(request.getParameter("page"));
        int maxItems = Integer.parseInt(request.getParameter("maxItems"));

        // Tính toán offset
        int offset = (page - 1) * maxItems;

        List<Book> productList = bookDetailService.listProductsTest(maxItems, offset,
                publisher,category,firstPrice,secondPrice,rating,sort,findWord);
        int totalItems = bookDetailService.totalBooks();  // Tổng số sản phẩm trong cơ sở dữ liệu
        System.out.println(offset + maxItems);

        // Chuyển đổi danh sách sản phẩm thành JSON
        Map<String, Object> result = new HashMap<>();
        result.put("products", productList);
        result.put("totalItems", totalItems);
        System.out.println(request.toString());

        PrintWriter printWriter = response.getWriter();
        printWriter.println(new GsonUtil().toJSon(result));
        printWriter.flush();
        printWriter.close();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}