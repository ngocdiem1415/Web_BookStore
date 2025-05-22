package vn.edu.hcmuaf.fit.bookstore.controllers.Admin;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.cloudinary.json.JSONObject;
import vn.edu.hcmuaf.fit.bookstore.Services.StockService;
import vn.edu.hcmuaf.fit.bookstore.beans.Stock;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.stream.Collectors;

@WebServlet(name = "StockAPI", value = "/admin/stock")
public class StockAPI extends HttpServlet {
    private StockService stockServicestock;

    public StockAPI() {
        this.stockServicestock = StockService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        String idBook = request.getParameter("bookId");
        String quantityStr = request.getParameter("quantity");
        String dateStr = request.getParameter("stockDate");

        int bId = 0;
        int quantity = 0;
        LocalDateTime updateDate = null;
        try {
            bId = Integer.parseInt(idBook);
            quantity = Integer.parseInt(quantityStr);
            System.out.println("da chay toi day");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            updateDate = LocalDateTime.parse(dateStr, formatter);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Lỗi dữ liệu: " + e.getMessage());
            return;
        }
        Stock stock = new Stock(bId, quantity, updateDate);
        System.out.println(stock.toString());

        int insert = stockServicestock.insertStock(stock);
        PrintWriter out = response.getWriter();
        if (insert == 1) {
            out.write("{\"message\":\"Cập nhật thành công\"}");
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.write("{\"message\":\"Cập nhật thất bại\"}");
        }
        out.flush();
        out.close();
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        BufferedReader reader = request.getReader();
        String body = reader.lines().collect(Collectors.joining(System.lineSeparator()));
        JSONObject json = new JSONObject(body);

        String id = json.getString("stockId");
        String idBook = json.getString("bookId");
        String quantityStr = json.getString("quantity");
        String dateStr = json.getString("stockDate");
        System.out.println(id + " " + idBook + " " + quantityStr + " " + dateStr);

        int stockId = 0;
        int quantity = 0;
        int bId = 0;
        LocalDateTime updateDate = null;
        try {
            bId = Integer.parseInt(idBook);
            stockId = Integer.parseInt(id);
            quantity = Integer.parseInt(quantityStr);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
            updateDate = LocalDateTime.parse(dateStr, formatter);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Lỗi dữ liệu: " + e.getMessage());
            return;
        }
        Stock stock = new Stock(stockId, bId, quantity, updateDate);
        System.out.println(stock.toString());

        int update = stockServicestock.updateStock(stock);
        PrintWriter out = response.getWriter();
        if (update == 1) {
            out.write("{\"message\":\"Cập nhật thành công\"}");
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.write("{\"message\":\"Cập nhật thất bại\"}");
        }
        out.flush();
        out.close();
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");

        BufferedReader reader = req.getReader();
        String body = reader.lines().collect(Collectors.joining(System.lineSeparator()));
        JSONObject json = new JSONObject(body);
        String id = json.getString("stockId");

        int stockId = 0;
        try {
            stockId = Integer.parseInt(id);
        } catch (Exception e) {
            resp.sendError(HttpServletResponse.SC_BAD_REQUEST, "Lỗi dữ liệu: " + e.getMessage());
            return;
        }
        System.out.println(stockId);

        int delete = stockServicestock.delete(stockId);
        PrintWriter out = resp.getWriter();
        if (delete == 1) {
            out.write("{\"message\":\"Cập nhật thành công\"}");
            resp.setStatus(HttpServletResponse.SC_OK);
        } else {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            out.write("{\"message\":\"Cập nhật thất bại\"}");
        }
        out.flush();
        out.close();
    }

}