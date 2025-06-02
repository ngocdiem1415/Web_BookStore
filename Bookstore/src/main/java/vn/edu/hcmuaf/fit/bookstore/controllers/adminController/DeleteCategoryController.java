package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.CategoryService;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "deleteCategoryController", value = "/admin/delete-category")
public class DeleteCategoryController extends HttpServlet {
    CategoryService categoryService;
    LogService logService;

    public DeleteCategoryController() {
        this.categoryService = CategoryService.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");
        try {
            int id = Integer.parseInt(request.getParameter("category_id"));
            categoryService.deleteCategory(id);
            response.setStatus(HttpServletResponse.SC_OK); // Trả về 200

            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.ALERT,
                    "category-management",
                    "DELETE_CATEGORY_SUCCESS",
                    false,
                    "{\"category_id\": " + id + "}",
                    "{\"deleted_by\": \"" + admin.getUsername() + "\", \"category_id\": \"" + id + "\"}"
            );
            logService.insert(log);
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Trả về 500
            response.getWriter().write("Lỗi khi xóa danh mục: " + e.getMessage());

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
            e.printStackTrace(); // Log lỗi ra console server
        }
    }
}