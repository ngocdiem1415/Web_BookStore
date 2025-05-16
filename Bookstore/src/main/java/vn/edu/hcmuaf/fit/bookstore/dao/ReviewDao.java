package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.Review;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

import java.util.List;

@RegisterBeanMapper(Review.class)
public interface ReviewDao {
    // Thêm mới một đánh giá
    @SqlUpdate("INSERT INTO reviews (invoice_id, b_id, uid, review_date, rating, comment) " +
            "VALUES (:invoiceId, :bookId, :userId, :reviewDate, :rating, :comment)")
    int addReview(@BindBean Review review);

    // Kiểm tra người dùng đã đánh giá sách trong hóa đơn chưa
    @SqlQuery("SELECT COUNT(*) > 0 FROM reviews " +
            "WHERE uid = :userId AND b_id = :bookId AND invoice_id = :invoiceId")
    boolean hasReviewed(@Bind("userId") int userId, @Bind("bookId") int bookId, @Bind("invoiceId") int invoiceId);

    // Kiểm tra đơn hàng đó đã được đánh giá chưa
    @SqlQuery("SELECT COUNT(*) > 0 FROM reviews " +
            "WHERE uid = :userId AND invoice_id = :invoiceId")
    boolean hasReviewedInvoice(@Bind("userId") int userId, @Bind("invoiceId") int invoiceId);

    // Xóa tất cả đánh giá liên quan đến sách
    @SqlUpdate("DELETE FROM reviews WHERE b_id = :bookId")
    int deleteReviewByBookId(@Bind("bookId") int bookId);

    // Lấy danh sách đánh giá của một sản phẩm
    @SqlQuery("SELECT * FROM reviews WHERE b_id = :bookId ORDER BY review_date DESC")
    List<Review> getReviewsByBookId(@Bind("bookId") int bookId);

    @SqlQuery(QUERIES.REVIEW.BOOK_RATING)
    Double getRatingOfBook(@Bind("b_id") int b_id);

    @SqlQuery(QUERIES.REVIEW.BOOK_REVIEW)
    List<Review> getReviewOfBook(@Bind("b_id") int b_id);

    @SqlQuery("SELECT * FROM reviews WHERE b_id = :b_id ORDER BY review_date DESC")
    Review getReviewsByBookIdCurrent(@Bind("b_id") int b_id);

    @SqlQuery("SELECT * FROM reviews WHERE review_id = :reviewId")
    Review getReviewById(@Bind("reviewId") int reviewId);
}
