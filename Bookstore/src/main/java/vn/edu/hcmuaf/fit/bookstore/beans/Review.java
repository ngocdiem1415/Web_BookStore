package vn.edu.hcmuaf.fit.bookstore.beans;

import com.google.gson.annotations.Expose;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

public class Review implements Serializable {
    private int reviewId;
    @Expose
    private int invoiceId;
    @Expose
    private int bookId;
    @Expose
    private int userId;
    public LocalDateTime reviewDate;
    @Expose
    private int rating;
    @Expose
    private String comment;
    private User user;

    public Review() {}

    public Review(int userId, int invoiceId, int bookId, int rating, String comment, User user) {
        this.userId = userId;
        this.invoiceId = invoiceId;
        this.bookId = bookId;
        this.rating = rating;
        this.comment = comment;
        this.reviewDate = LocalDateTime.now();
        this.user = user;
    }

    public User getUser(){
        return user;
    }

    public void setUser(User user){
        this.user = user;
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
