package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.*;
import vn.edu.hcmuaf.fit.bookstore.beans.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "EditProductController", value = "/admin/edit-product")
public class EditProductController extends HttpServlet {
    BookDetailService bookDetailService;
    CategoryService categoryService;
    PublisherService publisherService;
    PromotionService promotionService;
    LogService logService;

    public EditProductController() {
        this.bookDetailService = BookDetailService.getInstance();
        this.logService = LogService.getInstance();
        this.publisherService = PublisherService.getInstance();
        this.categoryService = CategoryService.getInstance();
        this.promotionService = PromotionService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productId = request.getParameter("id");

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        List<Category> categorys = categoryService.listCategory();
        List<Publisher> publishers = publisherService.listPublisher();
        List<Promotion> promotions = promotionService.listPromotion();
        try{
            int id = Integer.parseInt(productId);
            Book book = bookDetailService.findById(id);
            if (book != null) {
                request.setAttribute("book", book);
                request.setAttribute("listCategory",categorys);
                request.setAttribute("listPublisher",publishers);
                request.setAttribute("listPromotion",promotions);
            }
            request.getRequestDispatcher("Add-Edit-Product.jsp").forward(request,response);
        }catch (Exception e) {
            // Ghi log nếu có lỗi
            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.DANGER,
                    "admin-management",
                    "FIND_PRODUCT_UPDATE_FAILED",
                    true,
                    "{\"product_id\": " + productId + "}",
                    "{\"error\": \"" + e.getMessage().replace("\"", "\\\"") + "\"}"
            );
            logService.insert(log);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Lỗi khi cập nhật thông tin admin: " + e.getMessage());
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}