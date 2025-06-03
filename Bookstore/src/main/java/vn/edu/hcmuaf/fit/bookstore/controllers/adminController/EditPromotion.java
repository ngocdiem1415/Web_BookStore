package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.PromotionService;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.Promotion;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "EditPromotion", value = "/admin/edit-promotion")
public class EditPromotion extends HttpServlet {
    PromotionService promotionService;
    LogService logService;

    public EditPromotion() {
        this.promotionService = PromotionService.getInstance();
        this.logService = LogService.getInstance();
    }

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

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        try {
            promotionService.updatePromotion(id, promotionName, discount, startDate, endDate);
            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.ALERT,
                    "promotion-management",
                    "UPDATE_PROMOTION_SUCCESS",
                    false,
                    "{\"promotion_id\": " + id + "}",
                    "{\"updatedBy\": \"" + admin.getUsername() + "\"}"
            );
            logService.insert(log);
            response.sendRedirect("promotion");
        } catch (Exception e) {
            // Ghi log nếu có lỗi
            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.DANGER,
                    "promotion-management",
                    "UPDATE_PROMOTION_FAILED",
                    true,
                    "{\"promotion_id\": " + id + "}",
                    "{\"error\": \"" + e.getMessage().replace("\"", "\\\"") + "\"}"
            );
            logService.insert(log);

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Lỗi khi cập nhật thông tin promotion: " + e.getMessage());
            e.printStackTrace();
        }
    }

}