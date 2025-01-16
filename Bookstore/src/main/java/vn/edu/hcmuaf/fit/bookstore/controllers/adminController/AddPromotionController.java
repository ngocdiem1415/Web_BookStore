package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.PromotionService;

import java.io.IOException;

@WebServlet(name = "AddPromotionController", value = "/admin/add-promotion")
public class AddPromotionController extends HttpServlet {
    PromotionService promotionService = new PromotionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Add-promotion.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String promotionName = request.getParameter("promotionName");
        double discount = Double.parseDouble(request.getParameter("discount"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        promotionService.insertpromotion(promotionName, discount, startDate, endDate);

        response.sendRedirect("promotion");
    }
}