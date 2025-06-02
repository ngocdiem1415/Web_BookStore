package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.CategoryService;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.beans.Category;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryAdminController", value = "/admin/category")
public class CategoryAdminController extends HttpServlet {
    CategoryService categoryService;
    LogService logService;

    public CategoryAdminController() {
        this.categoryService = CategoryService.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = categoryService.listCategory();
        request.setAttribute("categories", categories);

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");
        Log log = new Log(
                admin.getUid(),
                session.getId(),
                ip,
                LogLevel.INFO,
                "category-management",
                "VIEW_CATEGORY_LIST",
                false,
                "{}",
                "{\"admin\": \"" + admin.getUsername() + "\"}"
        );

        request.getRequestDispatcher("Category-Management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}