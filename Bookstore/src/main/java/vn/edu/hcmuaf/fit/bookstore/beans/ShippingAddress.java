package vn.edu.hcmuaf.fit.bookstore.beans;

public class ShippingAddress {
    private int shippingId;
    private String recipientName;
    private String phone;
    private int provinceName;
    private int districtName;
    private int wardName;
    private String streetAddress;

    public ShippingAddress() {}

    public ShippingAddress(int shippingId, String recipientName, String phone, int provinceName, int districtName, int wardName, String streetAddress) {
        this.shippingId = shippingId;
        this.recipientName = recipientName;
        this.phone = phone;
        this.provinceName = provinceName;
        this.districtName = districtName;
        this.wardName = wardName;
        this.streetAddress = streetAddress;
    }

    public int getShippingId() {
        return shippingId;
    }

    public void setShippingId(int shippingId) {
        this.shippingId = shippingId;
    }

    public String getRecipientName() {
        return recipientName;
    }

    public void setRecipientName(String recipientName) {
        this.recipientName = recipientName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public int getProvinceName() {
        return provinceName;
    }

    public void setProvinceName(int provinceName) {
        this.provinceName = provinceName;
    }

    public int getDistrictName() {
        return districtName;
    }

    public void setDistrictName(int districtName) {
        this.districtName = districtName;
    }

    public int getWardName() {
        return wardName;
    }

    public void setWardName(int wardName) {
        this.wardName = wardName;
    }

    public String getStreetAddress() {
        return streetAddress;
    }

    public void setStreetAddress(String streetAddress) {
        this.streetAddress = streetAddress;
    }

    @Override
    public String toString() {
        return "ShippingAddress{" +
                "shippingId=" + shippingId +
                ", recipientName='" + recipientName + '\'' +
                ", phone='" + phone + '\'' +
                ", provinceName=" + provinceName +
                ", districtName=" + districtName +
                ", wardName=" + wardName +
                ", streetAddress='" + streetAddress + '\'' +
                '}';
    }
}

