package vn.edu.hcmuaf.fit.bookstore.beans;

import com.google.gson.annotations.Expose;
import org.jdbi.v3.core.mapper.reflect.ColumnName;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

public class Review implements Serializable {
    private int reviewId;
    private int invoiceId;
//    @ColumnName("b_id")
    private int bId;
//    @ColumnName("uid")
    private int uId;
    public LocalDateTime reviewDate;
    private int rating;
    private String comment;
    private User user;

    public Review() {}

    public Review(int reviewId, int invoiceId, int bId, int uId, LocalDateTime reviewDate, int rating, String comment, User user) {
        this.reviewId = reviewId;
        this.invoiceId = invoiceId;
        this.bId = bId;
        this.uId = uId;
        this.reviewDate = reviewDate;
        this.rating = rating;
        this.comment = comment;
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

    public int getBId() {
        return bId;
    }

    public void setBId(int bId) {
        this.bId = bId;
    }

    public int getUId() {
        return uId;
    }

    public void setUId(int uId) {
        this.uId = uId;
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
                ", bId=" + bId +
                ", uId=" + uId +
                ", reviewDate=" + reviewDate +
                ", rating=" + rating +
                ", comment='" + comment +
                ", user=" + user + '\'' +
                '}';
    }
}
