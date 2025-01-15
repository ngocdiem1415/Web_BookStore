package vn.edu.hcmuaf.fit.bookstore.controllers;

import com.google.gson.*;
import io.leangen.geantyref.TypeToken;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.ReviewService;
import vn.edu.hcmuaf.fit.bookstore.beans.Invoice;
import vn.edu.hcmuaf.fit.bookstore.beans.Review;

import java.io.*;
import java.lang.reflect.Type;
import java.util.List;

@WebServlet(name = "ReviewController", value = "/submitReview")
public class ReviewController extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;
    private final ReviewService reviewService = ReviewService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        } else {
//            switch (action) {
//                case "review":
//                    saveReviews(request, response);
//                    break;
//                default:
//                    response.sendError(HttpServletResponse.SC_NOT_FOUND);
//            }
            if ("review".equals(action)) {
                saveReviews(request, response);
                System.out.println(action);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        }
    }

    private void saveReviews(HttpServletRequest request, HttpServletResponse response) throws IOException {

        // Lấy dữ liệu từ yêu cầu POST
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        StringBuilder stringBuilder = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            stringBuilder.append(line);
        }
        String json = stringBuilder.toString();

        // Cấu hình Gson để chỉ bao gồm các trường có annotation @Expose
        Gson gson = new GsonBuilder()
                .excludeFieldsWithoutExposeAnnotation()  // Chỉ bao gồm các trường có annotation @Expose
                .create();

        // Parse JSON thành đối tượng cần thiết
        JsonObject jsonObject = gson.fromJson(json, JsonObject.class);
        int userId = Integer.parseInt(jsonObject.get("userId").getAsString());
        int invoiceId = Integer.parseInt(jsonObject.get("invoiceId").getAsString());
        JsonArray reviewsArray = jsonObject.getAsJsonArray("reviews");

        boolean allSuccess = true; // Biến để kiểm tra nếu tất cả đánh giá đều thành công
        for (JsonElement reviewElement : reviewsArray) {
            Review review = gson.fromJson(reviewElement, Review.class);
            review.setUserId(userId);
            review.setInvoiceId(invoiceId);

            // Thực hiện lưu đánh giá cho mỗi sản phẩm
            boolean success = reviewService.addReview(review);
            if (!success) {
                allSuccess = false; // Nếu có ít nhất một đánh giá thất bại
                break;
            }
        }

        // Tạo phản hồi trả về cho client
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        PrintWriter out = response.getWriter();
        if (allSuccess) {
            out.print("{\"success\": true}");
        } else {
            out.print("{\"success\": false}");
        }
        out.flush();
    }

}