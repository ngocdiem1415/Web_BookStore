package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.Review;
import vn.edu.hcmuaf.fit.bookstore.dao.ReviewDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.util.List;

public class ReviewService {
    private static ReviewService instance = null;
    Jdbi connect = JDBIConnector.getJdbi();

    public static ReviewService getInstance() {
        if (instance == null) instance = new ReviewService();
        return instance;
    }

    /**
     * Thêm một đánh giá mới.
     *
     * @param review Đối tượng Review.
     * @return true nếu thành công, false nếu vi phạm ràng buộc.
     */
    public boolean addReview(Review review) {
        //Kiểm tra người dùng đã đánh giá sách trong đơn hàng đó chưa
        boolean alreadyReviewed = connect.withExtension(ReviewDao.class, handle ->
                handle.hasReviewed(review.getUserId(), review.getBookId(), review.getInvoiceId()));

        if (alreadyReviewed) {
            return false; // Vi phạm ràng buộc
        }

        // Thực hiện thêm đánh giá
        int rowsAffected = connect.withExtension(ReviewDao.class,  handle->
                handle.addReview(review)
        );
        return rowsAffected > 0;
    }

    /**
     * Xóa tất cả đánh giá liên quan đến một sản phẩm.
     *
     * @param bookId ID sản phẩm.
     * @return Số lượng đánh giá đã xóa.
     */
    public int deleteReviewsByBookId(int bookId) {
        return connect.withExtension(ReviewDao.class, dao -> dao.deleteReviewByBookId(bookId));
    }

    /**
     * Lấy danh sách đánh giá của một sản phẩm.
     *
     * @param bookId ID sản phẩm.
     * @return Danh sách các đánh giá.
     */
    public List<Review> getReviewsForBook(int bookId) {
        return connect.withExtension(ReviewDao.class, dao ->
                dao.getReviewsByBookId(bookId)
        );
    }


    public double getRatingOfBook(int bookId) {
        Double rating = connect.withExtension(ReviewDao.class, handle -> handle.getRatingOfBook(bookId));
        return rating != null ? rating : 0.0;
    }

    public Review getReviewsForBookCurrent(int bookId) {
        return connect.withExtension(ReviewDao.class, dao ->
                dao.getReviewsByBookIdCurrent(bookId)
        );
    }
}
