package vn.edu.hcmuaf.fit.bookstore.controllers.userController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.CategoryService;
import vn.edu.hcmuaf.fit.bookstore.beans.Category;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "HeaderController", value = "/header")
public class HeaderController extends HttpServlet {
    public CategoryService categoryService;

    public HeaderController() {
        this.categoryService = CategoryService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        List<Category> categoryList = categoryService.listCategory();
        request.setAttribute("categoryList", categoryList);
        request.getRequestDispatcher("Header.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}