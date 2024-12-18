package vn.edu.hcmuaf.fit.bookstore.beans;

import java.util.Date;

public class Order {
    private int orderId;
    private int userId;
    private int storeId;
    private double totalAmount;
    private String status; // Ví dụ: "pending", "completed", "canceled"
    private Date createAt;
    private Date updateAt;

    public Order() {}

    public Order(int orderId, int userId, int storeId, double totalAmount, String status, Date createAt, Date updateAt) {
        this.orderId = orderId;
        this.userId = userId;
        this.storeId = storeId;
        this.totalAmount = totalAmount;
        this.status = status;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", userId=" + userId +
                ", storeId=" + storeId +
                ", totalAmount=" + totalAmount +
                ", status='" + status + '\'' +
                ", createAt=" + createAt +
                ", updateAt=" + updateAt +
                '}';
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getStoreId() {
        return storeId;
    }

    public void setStoreId(int storeId) {
        this.storeId = storeId;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    public Date getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(Date updateAt) {
        this.updateAt = updateAt;
    }
}

