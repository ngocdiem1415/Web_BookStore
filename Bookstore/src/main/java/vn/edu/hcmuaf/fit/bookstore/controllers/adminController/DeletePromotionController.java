package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.PromotionService;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "DeletePromotionController", value = "/admin/delete-promotion")
public class DeletePromotionController extends HttpServlet {
    PromotionService promotionService;
    LogService logService;

    public DeletePromotionController() {
        this.promotionService = PromotionService.getInstance();
        this.logService = LogService.getInstance();
    }

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
        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");
        try {
            // Gọi phương thức xóa danh mục từ dịch vụ
            promotionService.deletePromotion(promotionId);
            response.setStatus(HttpServletResponse.SC_OK); // Trả về 200 OK

            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.ALERT,
                    "promotion-management",
                    "DELETE_PROMOTION_SUCCESS",
                    false,
                    "{\"promotion_id\": " + promotionId + "}",
                    "{\"deleted_by\": \"" + admin.getUsername() + "\", \"promotion_id\": \"" + promotionId + "\"}"
            );
            logService.insert(log);
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.DANGER,
                    "category-management",
                    "DELETE_CATEGORY_FAILED",
                    true,
                    "{}",
                    "{\"error\": \"" + e.getMessage().replace("\"", "\\\"") + "\"}"
            );
            logService.insert(log);
            e.printStackTrace();
        }
    }
}