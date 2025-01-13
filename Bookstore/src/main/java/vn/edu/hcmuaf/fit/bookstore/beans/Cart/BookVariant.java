package vn.edu.hcmuaf.fit.bookstore.beans.Cart;

import vn.edu.hcmuaf.fit.bookstore.beans.Book;

public class BookVariant {
    private int id;
    private int quantity;
    private Book book;

    public BookVariant(int id, int quantity, Book book) {
        this.id = id;
        this.quantity = quantity;
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
