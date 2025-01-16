package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.PromotionService;
import vn.edu.hcmuaf.fit.bookstore.beans.Promotion;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "promotionManageController", value = "/admin/promotion")
public class promotionManageController extends HttpServlet {
    PromotionService promotionService = new PromotionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Promotion> promotions = promotionService.listCategory();

        request.setAttribute("promotions", promotions);

        request.getRequestDispatcher("Discount-Management.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}