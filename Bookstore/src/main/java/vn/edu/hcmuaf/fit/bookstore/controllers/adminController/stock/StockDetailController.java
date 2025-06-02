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

@WebServlet(name = "StockDetailController", value = "/admin/stock-detail")
public class StockDetailController extends HttpServlet {
    private StockService stockService;
    private LogService logService;

    public StockDetailController() {
        this.stockService = StockService.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Stock> stocks = stockService.getAllStockEntries();
        request.setAttribute("stocks", stocks);

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        Log log = new Log(admin.getUid(), session.getId(), ip, LogLevel.INFO, "stock-management", "VIEW_STOCK_DETAIL",
                false, "{}", "{\"admin\": \"" + admin.getUsername() + "\"}");
        logService.insert(log);

        request.getRequestDispatcher("StockDetail-Management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}