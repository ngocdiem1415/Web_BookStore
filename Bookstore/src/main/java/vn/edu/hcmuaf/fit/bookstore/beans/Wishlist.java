package vn.edu.hcmuaf.fit.bookstore.beans;

import java.util.Date;

public class Wishlist {
    private int wishlistId;
    private int userId;
    private int bookId;
    private Date create_at;
    private Date update_at;

    public Wishlist() {}

    public Wishlist(int wishlistId, int userId, int bookId, Date create_at, Date update_at) {
        this.wishlistId = wishlistId;
        this.userId = userId;
        this.bookId = bookId;
        this.create_at = create_at;
        this.update_at = update_at;
    }

    @Override
    public String toString() {
        return "Wishlist{" +
                "wishlistId=" + wishlistId +
                ", userId=" + userId +
                ", bookId=" + bookId +
                ", create_at=" + create_at +
                ", update_at=" + update_at +
                '}';
    }

    public int getWishlistId() {
        return wishlistId;
    }

    public void setWishlistId(int wishlistId) {
        this.wishlistId = wishlistId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    public Date getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(Date update_at) {
        this.update_at = update_at;
    }
}

