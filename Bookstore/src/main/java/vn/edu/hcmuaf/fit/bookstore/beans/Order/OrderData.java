package vn.edu.hcmuaf.fit.bookstore.beans.Order;

import vn.edu.hcmuaf.fit.bookstore.beans.InvoiceDetail;

import java.util.List;

public class OrderData {
    private String recipientName;
    private String recipientPhone;
    private String address;
    private String paymentMethod;

    public OrderData(String recipientName, String recipientPhone,String address, String paymentMethod) {
        this.recipientName = recipientName;
        this.recipientPhone = recipientPhone;
        this.address = address;
        this.paymentMethod = paymentMethod;
    }

    public OrderData() {
    }

    public String getRecipientName() {
        return recipientName;
    }

    public String getRecipientPhone() {
        return recipientPhone;
    }

    public String getAddress() {
        return address;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public void setRecipientPhone(String recipientPhone) {
        this.recipientPhone = recipientPhone;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    @Override
    public String toString() {
        return "OrderData{" +
                "recipientName='" + recipientName + '\'' +
                ", recipientPhone='" + recipientPhone + '\'' +
                ", address='" + address + '\'' +
                ", paymentMethod='" + paymentMethod + '\'' +
                '}';
    }
}
