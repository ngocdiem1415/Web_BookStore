package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.PromotionService;

import java.io.IOException;

@WebServlet(name = "DeletePromotionController", value = "/admin/delete-promotion")
public class DeletePromotionController extends HttpServlet {
    PromotionService promotionService = PromotionService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int promotionId = Integer.parseInt(request.getParameter("promotionId")); // Lấy promotionId từ request
        // Kiểm tra xem promotionId có hợp lệ không
        if (promotionId <= 0) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Trả về 400 Bad Request
            return;
        }
        try {
            // Gọi phương thức xóa danh mục từ dịch vụ
            promotionService.deletePromotion(promotionId);
            response.setStatus(HttpServletResponse.SC_OK); // Trả về 200 OK
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            e.printStackTrace();
        }
    }
}