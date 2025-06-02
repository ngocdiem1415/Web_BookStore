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
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AddPromotionController", value = "/admin/add-promotion")
public class AddPromotionController extends HttpServlet {
    PromotionService promotionService ;
    LogService logService;

    public AddPromotionController() {
        this.promotionService = new PromotionService();
        this.logService = LogService.getInstance();
    }

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

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        boolean success = promotionService.insertpromotion(promotionName, discount, startDate, endDate);

        Map<String, String> dataAfter = new HashMap<>();
        dataAfter.put("admin", admin.getUsername());
        dataAfter.put("promotionName", promotionName);
        dataAfter.put("discount", String.valueOf(discount));
        dataAfter.put("startDate", startDate);
        dataAfter.put("endDate", endDate);

        Log log = new Log(admin.getUid(), session.getId(), ip, success ? LogLevel.ALERT : LogLevel.ALERT, "promotion-management",
                success ?"ADD_PROMOTION_SUCCESS" : "ADD_PROMOTION_FAIL" ,
                false, "{}", new GsonUtil().toJSon(dataAfter));
        logService.insert(log);


        response.sendRedirect("promotion");
    }
}