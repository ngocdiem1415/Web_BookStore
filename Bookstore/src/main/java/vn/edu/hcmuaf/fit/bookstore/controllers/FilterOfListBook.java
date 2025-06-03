package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ListProductJson", value = "/filter")
public class FilterOfListBook extends HttpServlet {
    private BookDetailService bookDetailService;
    private LogService logService;


    public FilterOfListBook() {
        this.bookDetailService = BookDetailService.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User user = (User) session.getAttribute("userSession");

        String publisher = request.getParameter("publisher");
        String category = request.getParameter("category");
        String firstPrice = request.getParameter("firstPrice");
        String secondPrice = request.getParameter("secondPrice");
        String rating = request.getParameter("rating");
        String sort = request.getParameter("sort");
        String pageStr = request.getParameter("page");
        String findWord = request.getParameter("find");
//        System.out.println(publisher+";"+category+";"+firstPrice+";"+secondPrice+";"+rating+";"+sort+";"+findWord+";"+pageStr);
        try {
            // Lấy số trang và số lượng sản phẩm mỗi trang từ tham số request
            int page = Integer.parseInt(request.getParameter("page"));
            int maxItems = Integer.parseInt(request.getParameter("maxItems"));

            // Tính toán offset
            int offset = (page - 1) * maxItems;
            System.out.println("page " + page + "maxItem " + maxItems);
            List<Book> productList = bookDetailService.listProductsTest(maxItems, offset,
                    publisher, category, firstPrice, secondPrice, rating, sort, findWord);
            int totalItems = bookDetailService.totalBooks();  // Tổng số sản phẩm trong cơ sở dữ liệu
            int totalItemsOnPage = productList.size();
            System.out.println(offset + maxItems);
            if (findWord != null && !findWord.trim().isEmpty()) {
                Map<String, String> dataBefore = new HashMap<>();
                dataBefore.put("publisher", publisher);
                dataBefore.put("category", category);
                dataBefore.put("firstPrice", firstPrice);
                dataBefore.put("secondPrice", secondPrice);
                dataBefore.put("rating", rating);
                dataBefore.put("sort", sort);
                dataBefore.put("keyword", findWord);
                dataBefore.put("page", pageStr);
                dataBefore.put("maxItems", String.valueOf(maxItems));
                Log log = new Log(
                        user != null ? user.getUid() : null,
                        session != null ? session.getId() : "unknown",
                        ip,
                        LogLevel.INFO,
                        "book",
                        "FILTER_BOOKS",
                        false,
                        new GsonUtil().toJSon(dataBefore),
                        "Returned: " + totalItemsOnPage + " / " + totalItems + " books"
                );
                logService.insert(log);
            }
            // Chuyển đổi danh sách sản phẩm thành JSON
            Map<String, Object> result = new HashMap<>();
            result.put("products", productList);
            result.put("totalItems", totalItems);
            result.put("totalItemsOnPage", totalItemsOnPage);
            System.out.println(request.toString());

            PrintWriter printWriter = response.getWriter();
            printWriter.println(new GsonUtil().toJSon(result));
            printWriter.flush();
            printWriter.close();
        } catch (Exception e) {
            Log errorLog = new Log(
                    user != null ? user.getUid() : null,
                    session != null ? session.getId() : "unknown",
                    ip, LogLevel.WARNING,
                    "book", "FILTER_BOOKS_FAIL", false,
                    "Request error: " + request.getQueryString(),
                    e.getMessage()
            );
            logService.insert(errorLog);
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Lỗi xử lý filter.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        doGet(request, response);
    }
}