package vn.edu.hcmuaf.fit.bookstore.beans.Cart;

import vn.edu.hcmuaf.fit.bookstore.beans.Book;

import java.io.Serializable;

public class BookVariant implements Serializable {
    private int id;
    private int quantity;
    private Book book;

    public BookVariant(int id, Book book) {
        this.id = id;
        this.book = book;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }
}
