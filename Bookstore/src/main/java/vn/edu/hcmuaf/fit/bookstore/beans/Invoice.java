package vn.edu.hcmuaf.fit.bookstore.beans;

import java.math.BigDecimal;
import java.util.Date;

public class Invoice {
    private int invoiceId;
    private int uid;
    private Date orderDate;
    private String status;
    private BigDecimal shippingFee;
    private int shippingId;
    private Date completionDate;

    public Invoice() {}

    public Invoice(int invoiceId, int uid, Date orderDate, String status, BigDecimal shippingFee, int shippingId, Date completionDate) {
        this.invoiceId = invoiceId;
        this.uid = uid;
        this.orderDate = orderDate;
        this.status = status;
        this.shippingFee = shippingFee;
        this.shippingId = shippingId;
        this.completionDate = completionDate;
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

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public BigDecimal getShippingFee() {
        return shippingFee;
    }

    public void setShippingFee(BigDecimal shippingFee) {
        this.shippingFee = shippingFee;
    }

    public int getShippingId() {
        return shippingId;
    }

    public void setShippingId(int shippingId) {
        this.shippingId = shippingId;
    }

    public Date getCompletionDate() {
        return completionDate;
    }

    public void setCompletionDate(Date completionDate) {
        this.completionDate = completionDate;
    }

    @Override
    public String toString() {
        return "Invoice{" +
                "invoiceId=" + invoiceId +
                ", uid=" + uid +
                ", orderDate=" + orderDate +
                ", status='" + status + '\'' +
                ", shippingFee=" + shippingFee +
                ", shippingId=" + shippingId +
                ", completionDate=" + completionDate +
                '}';
    }
}
