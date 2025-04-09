package vn.edu.hcmuaf.fit.bookstore.controllers.Admin;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.Services.CategoryService;
import vn.edu.hcmuaf.fit.bookstore.Services.PromotionService;
import vn.edu.hcmuaf.fit.bookstore.Services.PublisherService;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.beans.Category;
import vn.edu.hcmuaf.fit.bookstore.beans.Promotion;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ProductAPI", value = "/admin/product")
public class ProductAPI extends HttpServlet {
    private BookDetailService bookService;
    private CategoryService categoryService;
    private PublisherService publisherService;
    private PromotionService promotionService;
    private BookDetailService bookDetailService;

    public ProductAPI() {
        this.bookService = BookDetailService.getInstance();
        this.categoryService = CategoryService.getInstance();
        this.publisherService = PublisherService.getInstance();
        this.promotionService = PromotionService.getInstance();
        this.bookDetailService = BookDetailService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        int publisher = Integer.parseInt(request.getParameter("publisher"));
        int publishYear = Integer.parseInt(request.getParameter("publishYear"));
        String dimensions = request.getParameter("dimensions");
        int weight = Integer.parseInt(request.getParameter("weight"));
        int pageCount = Integer.parseInt(request.getParameter("pageCount"));
        String format = request.getParameter("format");
        String description = request.getParameter("description");

        // Lấy dữ liệu từ các input trong Right Column
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String status = request.getParameter("status");
        String category = request.getParameter("category");
        String promotion = request.getParameter("promotion");
        Category categoryObj = categoryService.getCategoryById(Integer.parseInt(category));
        Promotion promotionObj = promotionService.getPromotionById(Integer.parseInt(promotion));

        // Tạo đối tượng Book và gán các giá trị
        Book book = new Book();
        book.setTitle(title);
        book.setAuthor(author);
        book.setPublishYear(publishYear);
        book.setDimensions(dimensions);
        book.setWeight(weight);
        book.setPageCount(pageCount);
        book.setFormat(format);
        book.setDescription(description);
        book.setOriginalPrice(Double.parseDouble(price));
        book.setStockQuantity(Integer.parseInt(quantity));
        book.setStatus(Integer.parseInt(status));
        book.setCategory(categoryObj);
        book.setPromotion(promotionObj);

        book = bookService.insertProduct(book);
        gson.toJson(book, response.getWriter());
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Gson gson = new Gson();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        int publisher = Integer.parseInt(request.getParameter("publisher"));
        int publishYear = Integer.parseInt(request.getParameter("publishYear"));
        String dimensions = request.getParameter("dimensions");
        int weight = Integer.parseInt(request.getParameter("weight"));
        int pageCount = Integer.parseInt(request.getParameter("pageCount"));
        String format = request.getParameter("format");
        String description = request.getParameter("description");

        // Lấy dữ liệu từ các input trong Right Column
        String price = request.getParameter("price");
        String quantity = request.getParameter("quantity");
        String status = request.getParameter("status");
        String category = request.getParameter("category");
        String promotion = request.getParameter("promotion");
        Category categoryObj = categoryService.getCategoryById(Integer.parseInt(category));
        Promotion promotionObj = promotionService.getPromotionById(Integer.parseInt(promotion));

        // Tạo đối tượng Book và gán các giá trị
        Book book = new Book();
        book.setTitle(title);
        book.setAuthor(author);
        book.setPublishYear(publishYear);
        book.setDimensions(dimensions);
        book.setWeight(weight);
        book.setPageCount(pageCount);
        book.setFormat(format);
        book.setDescription(description);
        book.setOriginalPrice(Double.parseDouble(price));
        book.setStockQuantity(Integer.parseInt(quantity));
        book.setStatus(Integer.parseInt(status));
        book.setCategory(categoryObj);
        book.setPromotion(promotionObj);

        book = bookService.updateProduct(book);
        gson.toJson(book, response.getWriter());
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        PrintWriter printWriter = resp.getWriter();
        try {
            bookDetailService.delete(id);
            printWriter.println("Delete Done");
            printWriter.close();
        } catch (Exception e) {
            resp.setStatus(400);
            printWriter.println("Error");
            printWriter.close();
        }
    }
}