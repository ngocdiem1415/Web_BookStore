package vn.edu.hcmuaf.fit.bookstore.controllers;

import com.google.gson.*;
import io.leangen.geantyref.TypeToken;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.ReviewService;
import vn.edu.hcmuaf.fit.bookstore.beans.Invoice;
import vn.edu.hcmuaf.fit.bookstore.beans.Review;
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.*;
import java.lang.reflect.Type;
import java.time.LocalDateTime;
import java.util.Arrays;
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
            if ("review".equals(action)) {
                saveReviews(request, response);
                System.out.println(action);
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
            }
        }
    }

    private void saveReviews(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            int userId = Integer.parseInt(request.getParameter("userId"));
            int invoiceId = Integer.parseInt(request.getParameter("invoiceId"));

            BufferedReader reader = request.getReader();
            GsonUtil gsonUtil = new GsonUtil();

            ReviewData[] reviews = gsonUtil.getGson().fromJson(reader, ReviewData[].class);
            System.out.println("Review data:" + Arrays.toString(reviews));

//        Tạo đối tượng review
            boolean allSuccess = true;
            for (ReviewData reviewData : reviews) {
                Review review = new Review();
                review.setInvoiceId(invoiceId);
                review.setBId(reviewData.getBookId());
                review.setUId(userId);
                review.setReviewDate(LocalDateTime.now());
                review.setRating(reviewData.getRating());
                review.setComment(reviewData.getComment());

                ReviewService reviewService = new ReviewService();
                boolean success = reviewService.addReview(review);
                if (!success) {
                    allSuccess = false;
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                    System.out.println("❌ Không thể thêm review cho bookId: " + reviewData.getBookId());
                    break;
                }

            }

            // Gửi phản hồi JSON
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            PrintWriter out = response.getWriter();
            out.print("{\"success\": " + allSuccess + "}");
            out.flush();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("❌ Lỗi khi đọc JSON từ request: " + e.getMessage());
        }

    }

    class ReviewData {
        private int bookId;
        private int rating;
        private String comment;

        public ReviewData(int bookId, int rating, String comment) {
            this.bookId = bookId;
            this.rating = rating;
            this.comment = comment;
        }

        public int getBookId() {
            return bookId;
        }

        public void setBookId(int bookId) {
            this.bookId = bookId;
        }

        public int getRating() {
            return rating;
        }

        public void setRating(int rating) {
            this.rating = rating;
        }

        public String getComment() {
            return comment;
        }

        public void setComment(String comment) {
            this.comment = comment;
        }

        @Override
        public String toString() {
            return "ReviewData{" +
                    "bookId=" + bookId +
                    ", rating=" + rating +
                    ", comment='" + comment + '\'' +
                    '}';
        }
    }

}