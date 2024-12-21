package vn.edu.hcmuaf.fit.bookstore.beans;

public class Publisher {
    private int p_id;
    private String p_name;
    private String p_address;
    private String p_phone;

    public Publisher() {}

    public Publisher(int publisherId, String name, String address, String phone) {
        this.p_id = publisherId;
        this.p_name = name;
        this.p_address = address;
        this.p_phone = phone;
    }

    @Override
    public String toString() {
        return "Publisher{" +
                "publisherId=" + p_id +
                ", name='" + p_name + '\'' +
                ", address='" + p_address + '\'' +
                ", phone='" + p_phone + '\'' +
                '}';
    }

    public int getP_id() {
        return p_id;
    }

    public void setP_id(int p_id) {
        this.p_id = p_id;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getP_address() {
        return p_address;
    }

    public void setP_address(String p_address) {
        this.p_address = p_address;
    }

    public String getP_phone() {
        return p_phone;
    }

    public void setP_phone(String p_phone) {
        this.p_phone = p_phone;
    }
}

