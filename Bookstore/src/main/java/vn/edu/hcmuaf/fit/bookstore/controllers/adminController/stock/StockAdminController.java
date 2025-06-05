package vn.edu.hcmuaf.fit.bookstore.controllers.adminController.stock;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.StockService;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.Stock;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "StockAdminController", value = "/admin/stock-management")
public class StockAdminController extends HttpServlet {
    private StockService stockService;
    private LogService logService;

    public StockAdminController() {
        this.stockService = StockService.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Stock> stocks = stockService.getStock();
        request.setAttribute("stocks", stocks);
        for (Stock stock : stocks) {
            System.out.println(stock.getBook().toString());
        }

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        Log log = new Log(admin.getUid(), session.getId(), ip, LogLevel.INFO, "stock-management", "VIEW_STOCK",
                false, "{}", "{\"admin\": \"" + admin.getUsername() + "\"}");
        logService.insert(log);

        request.getRequestDispatcher("Stock-Management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}