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

@WebServlet(name = "EditCategoryController", value = "/admin/edit-category")
public class EditCategoryController extends HttpServlet {
    CategoryService categoryService;
    LogService logService;

    public EditCategoryController() {
        this.categoryService = CategoryService.getInstance();
        this.logService = LogService.getInstance();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = request.getParameter("id") != null ? Integer.parseInt(request.getParameter("id")) : 0;
        Category category = categoryService.getCategoryById(id);
        request.setAttribute("category", category);
        request.getRequestDispatcher("Edit-Category.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Lấy các tham số từ form
        int categoryId = Integer.parseInt(request.getParameter("id"));
        String categoryName = request.getParameter("category");

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");
        try {
            categoryService.updateCategory(categoryId, categoryName);
            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.ALERT,
                    "admin-management",
                    "UPDATE_ADMIN_SUCCESS",
                    false,
                    "{\"category_id\": " + categoryId + "}",
                    "{\"category\": \"" + categoryName + "\", \"updatedBy\": \"" + admin.getUsername() + "\"}"
            );
            logService.insert(log);
            response.sendRedirect("category");
        }catch (Exception e) {
            // Ghi log nếu có lỗi
            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.DANGER,
                    "category-management",
                    "UPDATE_CATEGORY_FAILED",
                    true,
                    "{\"category_id\": " + categoryId + "}",
                    "{\"error\": \"" + e.getMessage().replace("\"", "\\\"") + "\"}"
            );
            logService.insert(log);

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Lỗi khi cập nhật thông tin category: " + e.getMessage());
            e.printStackTrace();
        }

    }
}