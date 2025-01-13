package vn.edu.hcmuaf.fit.bookstore.beans;

public class InvoiceDetail {
    private int invoiceId;
    private int bookId;
    private int quantity;
    private double unitPrice;
    private Book book;

    public InvoiceDetail() {}

    public InvoiceDetail(int invoiceId, int bookId, Book book, int quantity, double unitPrice) {
        this.invoiceId = invoiceId;
        this.bookId = bookId;
        this.quantity = quantity;
        this.unitPrice = unitPrice;
        this.book = book;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
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
                ", bookId=" + bookId +
                ", quantity=" + quantity +
                ", unitPrice=" + unitPrice +
                '}';
    }
}

