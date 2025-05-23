package vn.edu.hcmuaf.fit.bookstore.controllers.adminController.stock;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.StockService;
import vn.edu.hcmuaf.fit.bookstore.beans.Stock;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "StockDetailController", value = "/admin/stock-detail")
public class StockDetailController extends HttpServlet {
    private StockService stockService;


    public StockDetailController() {
        this.stockService = StockService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Stock> stocks = stockService.getAllStockEntries();
        request.setAttribute("stocks", stocks);
        request.getRequestDispatcher("StockDetail-Management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}