package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.CategoryService;
import vn.edu.hcmuaf.fit.bookstore.beans.Category;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "CategoryAdminController", value = "/admin/category")
public class CategoryAdminController extends HttpServlet {
    CategoryService categoryService = CategoryService.getInstance();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Category> categories = categoryService.listCategory();
        request.setAttribute("categories", categories);
        request.getRequestDispatcher("Catagory-Management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}