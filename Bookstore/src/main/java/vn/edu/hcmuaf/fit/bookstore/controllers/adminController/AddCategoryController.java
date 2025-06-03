package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.CategoryService;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AddCategoryController", value = "/admin/add-category")
public class AddCategoryController extends HttpServlet {
    CategoryService categoryService;
    LogService logService;

    public AddCategoryController() {
        this.categoryService = CategoryService.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Add-category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryName = request.getParameter("category");
        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        boolean success = categoryService.insertCategory(categoryName);

        Map<String, String> dataAfter = new HashMap<>();
        dataAfter.put("admin", admin.getUsername());
        dataAfter.put("category", categoryName);
        Log log = new Log(admin.getUid(), session.getId(), ip, success ? LogLevel.ALERT: LogLevel.ALERT, "category-management", success ? "ADD_CATEGORY_SUCCESS": "ADD_CATEGORY_FAIL",
                false, "{}", new GsonUtil().toJSon(dataAfter));
        logService.insert(log);
        response.sendRedirect("category");
    }
}