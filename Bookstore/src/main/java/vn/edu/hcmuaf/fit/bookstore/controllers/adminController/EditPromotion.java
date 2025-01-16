package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.PromotionService;
import vn.edu.hcmuaf.fit.bookstore.beans.Promotion;

import java.io.IOException;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "EditPromotion", value = "/admin/edit-promotion")
public class EditPromotion extends HttpServlet {
    PromotionService promotionService = new PromotionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        Promotion promotion = promotionService.getPromotionById(id);

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String startDate = promotion.getStartDate().format(formatter);
        String endDate = promotion.getEndDate().format(formatter);


        request.setAttribute("promotion", promotion);
        request.setAttribute("startDate", startDate);
        request.setAttribute("endDate", endDate);

        request.getRequestDispatcher("Edit-promotion.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String promotionName = request.getParameter("promotionName");
        double discount = Double.parseDouble(request.getParameter("discount"));
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        int id = Integer.parseInt(request.getParameter("id"));

        promotionService.updatePromotion(id, promotionName, discount, startDate, endDate);

        response.sendRedirect("promotion");
    }
}