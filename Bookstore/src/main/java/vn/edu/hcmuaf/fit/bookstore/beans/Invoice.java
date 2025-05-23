package vn.edu.hcmuaf.fit.bookstore.beans;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

public class Invoice {
    private int invoiceId;
    private int uid;
    private String recipientName;
    private String recipientPhone;
    private String address;
    private LocalDateTime orderDate;
    private String status;
    private double shippingFee;
    private LocalDateTime completionDate;
    private List<InvoiceDetail> listInvoiceDetails;
    private Payment payment;
    private boolean hasReviews;
    private double totalAmount;

    public Invoice() {
    }

    public Invoice(int invoiceId, int uid, String recipientName, String recipientPhone, String address, LocalDateTime orderDate, String status, double shippingFee, LocalDateTime completionDate, List<InvoiceDetail> listInvoiceDetails, Payment payment, boolean hasReviews) {
        this.invoiceId = invoiceId;
        this.uid = uid;
        this.recipientName = recipientName;
        this.recipientPhone = recipientPhone;
        this.address = address;
        this.orderDate = orderDate;
        this.status = status;
        this.shippingFee = shippingFee;
        this.completionDate = completionDate;
        this.listInvoiceDetails = listInvoiceDetails;
        this.payment = payment;
        this.hasReviews = hasReviews;
    }

    public LocalDate getReviewDeadline() {
        return this.completionDate.toLocalDate().plusDays(7);  // Nếu completionDate là LocalDateTime
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public boolean isHasReviews() {
        return hasReviews;
    }

    public void setHasReviews(boolean hasReviews) {
        this.hasReviews = hasReviews;
    }

    public int getInvoiceId() {
        return invoiceId;
    }

    public void setInvoiceId(int invoiceId) {
        this.invoiceId = invoiceId;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getRecipientPhone() {
        return recipientPhone;
    }

    public void setRecipientPhone(String recipientPhone) {
        this.recipientPhone = recipientPhone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public LocalDateTime getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(LocalDateTime orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(double shippingFee) {
        this.shippingFee = shippingFee;
    }

    public LocalDateTime getCompletionDate() {
        return completionDate;
    }

    public void setCompletionDate(LocalDateTime completionDate) {
        this.completionDate = completionDate;
    }

    public List<InvoiceDetail> getListInvoiceDetails() {
        return listInvoiceDetails;
    }

    public void setListInvoiceDetails(List<InvoiceDetail> listInvoiceDetails) {
        this.listInvoiceDetails = listInvoiceDetails;
    }

    public Payment getPayment() {
        return payment;
    }

    public void setPayment(Payment payment) {
        this.payment = payment;
    }

    @Override
    public String toString() {
        return "Invoice{" +
                "invoiceId=" + invoiceId +
                ", uid=" + uid +
                ", recipientName='" + recipientName + '\'' +
                ", recipientPhone='" + recipientPhone + '\'' +
                ", address='" + address + '\'' +
                ", orderDate=" + orderDate +
                ", status='" + status + '\'' +
                ", shippingFee=" + shippingFee +
                ", completionDate=" + completionDate +
                ", listInvoiceDetails=" + listInvoiceDetails +
                ", payment=" + payment +
                ", hasReviews=" + hasReviews +
                ", totalAmount=" + totalAmount +
                '}';
    }
}
