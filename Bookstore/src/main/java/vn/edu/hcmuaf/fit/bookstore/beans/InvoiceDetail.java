package vn.edu.hcmuaf.fit.bookstore.beans;

import org.jdbi.v3.core.mapper.reflect.ColumnName;

public class InvoiceDetail {
    private int invoiceId;
    private int bId;
    private int quantity;
    private double unitPrice;
    private Book book;

    public InvoiceDetail() {
    }

    public InvoiceDetail(int bId, int quantity, double unitPrice) {
        this.bId = bId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
    }

    // Constructor
    public InvoiceDetail(int invoiceId, int bId, int quantity, double unitPrice, Book book) {
        this.invoiceId = invoiceId;
        this.bId = bId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.book = book;
    }

    // Getters and setters
    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
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

    public double getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(double unitPrice) {
        this.unitPrice = unitPrice;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    @Override
    public String toString() {
        return "InvoiceDetail{" +
                "invoiceId=" + invoiceId +
                ", bookId=" + bId +
                ", quantity=" + quantity +
                ", unitPrice=" + unitPrice +
                '}';
    }
}

