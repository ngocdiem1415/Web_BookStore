package vn.edu.hcmuaf.fit.bookstore.beans;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class Invoice {
    private int invoiceId;
    private int uid;
    private String recipientName;
    private String recipientPhone;
    private String address;
    private Date orderDate;
    private String status;
    private BigDecimal shippingFee;
    private Date completionDate;
    private List<InvoiceDetail> listInvoiceDetails;

    public Invoice() {
    }

    public Invoice(int invoiceId, int uid, String recipientName, String recipientPhone, String address, Date orderDate, String status, BigDecimal shippingFee, Date completionDate, List<InvoiceDetail> listInvoiceDetails) {
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

    public Date getCompletionDate() {
        return completionDate;
    }

    public void setCompletionDate(Date completionDate) {
        this.completionDate = completionDate;
    }

    public List<InvoiceDetail> getListInvoiceDetails() {
        return listInvoiceDetails;
    }

    public void setListInvoiceDetails(List<InvoiceDetail> listInvoiceDetails) {
        this.listInvoiceDetails = listInvoiceDetails;
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
                '}';
    }
}
