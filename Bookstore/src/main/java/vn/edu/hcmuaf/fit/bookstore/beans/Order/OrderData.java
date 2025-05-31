package vn.edu.hcmuaf.fit.bookstore.beans.Order;

import vn.edu.hcmuaf.fit.bookstore.beans.InvoiceDetail;

import java.util.List;

public class OrderData {
    private String recipientName;
    private String recipientPhone;
    private String address;
    private List<InvoiceDetail> products;
    private double shippingFee;
//    private double totalAmount;
    private String paymentMethod;

    public OrderData(String recipientName, String recipientPhone, String address, List<InvoiceDetail> products, double shippingFee, String paymentMethod) {
        this.recipientName = recipientName;
        this.recipientPhone = recipientPhone;
        this.address = address;
        this.products = products;
        this.shippingFee = shippingFee;
//        this.totalAmount = totalAmount;
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

    public List<InvoiceDetail> getProducts() {
        return products;
    }

    public double getShippingFee() {
        return shippingFee;
    }

//    public double getTotalAmount() {
//        return totalAmount;
//    }

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

    public void setProducts(List<InvoiceDetail> products) {
        this.products = products;
    }

    public void setShippingFee(double shippingFee) {
        this.shippingFee = shippingFee;
    }

//    public void setTotalAmount(double totalAmount) {
//        this.totalAmount = totalAmount;
//    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    @Override
    public String toString() {
        return "OrderData{" +
                "recipientName='" + recipientName + '\'' +
                ", recipientPhone='" + recipientPhone + '\'' +
                ", address='" + address + '\'' +
                ", products=" + products +
                ", shippingFee=" + shippingFee +
//                ", totalAmount=" + totalAmount +
                ", paymentMethod='" + paymentMethod + '\'' +
                '}';
    }
}
