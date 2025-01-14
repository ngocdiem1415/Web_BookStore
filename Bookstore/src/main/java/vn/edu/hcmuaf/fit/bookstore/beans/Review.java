package vn.edu.hcmuaf.fit.bookstore.beans;

import java.time.LocalDateTime;
import java.util.Date;

public class Review {
    private int reviewId;
    private int invoiceId;
    private int bookId;
    private int userId;
    private LocalDateTime reviewDate;
    private int rating;
    private String comment;

    public Review() {}

    public Review(int invoiceId, int bookId, int userId, int rating, String comment) {
        this.invoiceId = invoiceId;
        this.bookId = bookId;
        this.userId = userId;
        this.rating = rating;
        this.comment = comment;
        this.reviewDate = LocalDateTime.now();
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public LocalDateTime getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(LocalDateTime reviewDate) {
        this.reviewDate = reviewDate;
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
        return "Review{" +
                "reviewId=" + reviewId +
                ", invoiceId=" + invoiceId +
                ", bookId=" + bookId +
                ", userId=" + userId +
                ", reviewDate=" + reviewDate +
                ", rating=" + rating +
                ", comment='" + comment + '\'' +
                '}';
    }
}
