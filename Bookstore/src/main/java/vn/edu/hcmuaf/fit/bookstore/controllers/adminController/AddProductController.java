package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.*;
import vn.edu.hcmuaf.fit.bookstore.beans.*;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "AddProductController", value = "/admin/add-product")
public class AddProductController extends HttpServlet {
    CategoryService categoryService;
    PublisherService publisherService;
    PromotionService promotionService;
    LogService logService;

    public AddProductController() {
        this.logService = LogService.getInstance();
        this.publisherService = PublisherService.getInstance();
        this.categoryService = CategoryService.getInstance();
        this.promotionService = PromotionService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categorys = categoryService.listCategory();
        List<Publisher> publishers = publisherService.listPublisher();
        List<Promotion> promotions = promotionService.listPromotion();

        request.setAttribute("listCategory", categorys);
        request.setAttribute("listPublisher", publishers);
        request.setAttribute("listPromotion", promotions);
        request.getRequestDispatcher("Add-Edit-Product.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}