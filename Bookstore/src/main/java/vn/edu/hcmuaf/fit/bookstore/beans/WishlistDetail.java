package vn.edu.hcmuaf.fit.bookstore.beans;

import java.util.Date;

public class WishlistDetail {
    private int wid;
    private int bId;
    private Date addedDate;

    // Constructor mặc định
    public WishlistDetail() {}

    // Constructor có tham số
    public WishlistDetail(int wid, int bId, Date addedDate) {
        this.wid = wid;
        this.bId = bId;
        this.addedDate = addedDate;
    }

    // Getter và Setter
    public int getWid() {
        return wid;
    }

    public void setWid(int wid) {
        this.wid = wid;
    }

    public int getbId() {
        return bId;
    }

    public void setbId(int bId) {
        this.bId = bId;
    }

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }

    @Override
    public String toString() {
        return "WishlistDetail{" +
                "wid=" + wid +
                ", bId=" + bId +
                ", addedDate=" + addedDate +
                '}';
    }
}

