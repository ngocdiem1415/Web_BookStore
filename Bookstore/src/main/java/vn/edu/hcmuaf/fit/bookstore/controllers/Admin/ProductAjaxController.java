package vn.edu.hcmuaf.fit.bookstore.controllers.Admin;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ProductAjaxController", value = "/admin/ProductAjaxController")
public class ProductAjaxController extends HttpServlet {
    BookDetailService bookDetailService ;

    public ProductAjaxController() {
        this.bookDetailService = BookDetailService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {String action = req.getParameter("action");
        if (action.equalsIgnoreCase("all")) {
            List<Book> producer = bookDetailService.;
            PrintWriter printWriter = resp.getWriter();
            printWriter.println(new JsonUtil().toJSon(producer));
            printWriter.flush();
            printWriter.close();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}