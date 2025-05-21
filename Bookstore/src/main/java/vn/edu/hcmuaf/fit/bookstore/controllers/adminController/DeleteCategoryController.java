package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.CategoryService;

import java.io.IOException;

@WebServlet(name = "deleteCategoryController", value = "/admin/delete-category")
public class DeleteCategoryController extends HttpServlet {
    CategoryService categoryService = new CategoryService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("category_id"));
            categoryService.deleteCategory(id);

            response.setStatus(HttpServletResponse.SC_OK); // Trả về 200
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR); // Trả về 500
            response.getWriter().write("Lỗi khi xóa danh mục: " + e.getMessage());
            e.printStackTrace(); // Log lỗi ra console server
        }
    }
}