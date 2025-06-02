package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = "/admin/product-management")
public class ProductManageController extends HttpServlet {
    BookDetailService bookDetailService;
    LogService logService;

    public ProductManageController() {
        this.bookDetailService = BookDetailService.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Book> products = bookDetailService.listAllProduct();
        request.setAttribute("products", products);

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        Log log = new Log(admin.getUid(), session.getId(), ip, LogLevel.INFO, "product-management",
                "VIEW_PRODUCT",false, "{}", "{\"admin\": \"" + admin.getUsername() + "\"}");
        logService.insert(log);
        request.getRequestDispatcher("Product-Management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}