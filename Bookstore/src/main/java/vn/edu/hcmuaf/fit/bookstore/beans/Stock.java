package vn.edu.hcmuaf.fit.bookstore.beans;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Stock implements Serializable {
    private int stockId;
    private int bId;
    private Book book;
    private int quantity;
    private LocalDateTime create_at;

    public Stock(int stockId, int bId, int quantity, LocalDateTime create_at) {
        this.stockId = stockId;
        this.bId = bId;
        this.quantity = quantity;
        this.create_at = create_at;
    }

    public Stock(){}

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getStockId() {
        return stockId;
    }

    public void setStockId(int stockId) {
        this.stockId = stockId;
    }

    public int getbId() {
        return bId;
    }

    public void setbId(int bId) {
        this.bId = bId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public LocalDateTime getCreate_at() {
        return create_at;
    }

    public void setCreate_at(LocalDateTime create_at) {
        this.create_at = create_at;
    }

    @Override
    public String toString() {
        return "Stock{" +
                "stockId=" + stockId +
                ", bId=" + bId +
                ", quantity=" + quantity +
                ", create_at=" + create_at +
                '}';
    }
}
