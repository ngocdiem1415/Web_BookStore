package vn.edu.hcmuaf.fit.bookstore.beans.Order;

public class ShippingInfo {
    private int totalPrice;
    private int totalQuantity;
    private int totalWeight;
    private int length;
    private int width;
    private int height;

    public ShippingInfo(){};

    public ShippingInfo(int totalPrice, int totalQuantity, int totalWeight, int length, int width, int height) {
        this.totalPrice = totalPrice;
        this.totalQuantity = totalQuantity;
        this.totalWeight = totalWeight;
        this.length = length;
        this.width = width;
        this.height = height;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
    }

    public int getTotalWeight() {
        return totalWeight;
    }

    public void setTotalWeight(int totalWeight) {
        this.totalWeight = totalWeight;
    }

    public int getLength() {
        return length;
    }

    public void setLength(int length) {
        this.length = length;
    }

    public int getWidth() {
        return width;
    }

    public void setWidth(int width) {
        this.width = width;
    }

    public int getHeight() {
        return height;
    }

    public void setHeight(int height) {
        this.height = height;
    }

    @Override
    public String toString() {
        return "ShippingInfo{" +
                "totalPrice=" + totalPrice +
                ", totalQuantity=" + totalQuantity +
                ", totalWeight=" + totalWeight +
                ", length=" + length +
                ", width=" + width +
                ", height=" + height +
                '}';
    }
}
