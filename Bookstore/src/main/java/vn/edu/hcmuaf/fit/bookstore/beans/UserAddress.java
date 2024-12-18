package vn.edu.hcmuaf.fit.bookstore.beans;
public class UserAddress {
    private int uid;
    private int shippingId;
    private boolean isDefault;

    public UserAddress() {}

    public UserAddress(int uid, int shippingId, boolean isDefault) {
        this.uid = uid;
        this.shippingId = shippingId;
        this.isDefault = isDefault;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getShippingId() {
        return shippingId;
    }

    public void setShippingId(int shippingId) {
        this.shippingId = shippingId;
    }

    public boolean isDefault() {
        return isDefault;
    }

    public void setDefault(boolean isDefault) {
        this.isDefault = isDefault;
    }

    @Override
    public String toString() {
        return "UserAddress{" +
                "uid=" + uid +
                ", shippingId=" + shippingId +
                ", isDefault=" + isDefault +
                '}';
    }
}
