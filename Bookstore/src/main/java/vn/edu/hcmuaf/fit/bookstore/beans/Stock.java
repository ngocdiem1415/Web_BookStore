package vn.edu.hcmuaf.fit.bookstore.beans;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Stock implements Serializable {
    private int stockId;
    private int bId;
    private Book book;
    private int quantity;
    private LocalDateTime stock_date;

    public Stock(int stockId, int bId, int quantity, LocalDateTime create_at) {
        this.stockId = stockId;
        this.bId = bId;
        this.quantity = quantity;
        this.stock_date = create_at;
    }

    public Stock(int stockId, int bId, int quantity) {
        this.stockId = stockId;
        this.bId = bId;
        this.quantity = quantity;
    }

    public Stock(int bId, int quantity, LocalDateTime stock_date) {
        this.bId = bId;
        this.quantity = quantity;
        this.stock_date = stock_date;
    }

    public Stock(int quantity, LocalDateTime stock_date) {
        this.quantity = quantity;
        this.stock_date = stock_date;
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

    public LocalDateTime getStock_date() {
        return stock_date;
    }

    public void setStock_date(LocalDateTime stock_date) {
        this.stock_date = stock_date;
    }

    @Override
    public String toString() {
        return "Stock{" +
                "stockId=" + stockId +
                ", bId=" + bId +
                ", quantity=" + quantity +
                ", create_at=" + stock_date +
                '}';
    }
}
