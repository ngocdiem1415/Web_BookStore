package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.ReviewService;
import vn.edu.hcmuaf.fit.bookstore.beans.Review;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import com.google.gson.Gson;

@WebServlet(name = "ReviewController", value = "/submitReview")
public class ReviewController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReviewService reviewService = ReviewService.getInstance();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        StringBuilder stringBuilder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            stringBuilder.append(line);
        }
        String json = stringBuilder.toString();

        // Chuyển đổi JSON thành đối tượng Review
        Gson gson = new Gson();
        Review review = gson.fromJson(json, Review.class);

        // Thực hiện thêm đánh giá thông qua service
        boolean success = reviewService.addReview(review);

        // Tạo đối tượng phản hồi
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Trả về kết quả dưới dạng JSON
        PrintWriter out = response.getWriter();
        if (success) {
            out.print("{\"success\": true}");
        } else {
            out.print("{\"success\": false}");
        }
        out.flush();
    }
}