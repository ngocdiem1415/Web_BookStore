package vn.edu.hcmuaf.fit.bookstore.beans;

import java.io.Serializable;

public class Image implements Serializable {
    private int imgId;
    private int bookId;
    private String sourceImg;
    private boolean isThumbnail;

    public Image() {
    }

    public Image(int imgId, int bookId, String sourceImg, boolean isThumbnail) {
        this.imgId = imgId;
        this.bookId = bookId;
        this.sourceImg = sourceImg;
        this.isThumbnail = isThumbnail;
    }

    public Image(int bookId, String sourceImg, boolean isThumbnail) {
        this.bookId = bookId;
        this.sourceImg = sourceImg;
        this.isThumbnail = isThumbnail;
    }

    @Override
    public String toString() {
        return "Image{" +
                "imgId=" + imgId +
                ", bookId=" + bookId +
                ", sourceImg='" + sourceImg + '\'' +
                ", isThumbnail=" + isThumbnail +
                '}';
    }

    public int getImgId() {
        return imgId;
    }

    public void setImgId(int imgId) {
        this.imgId = imgId;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getSourceImg() {
        return sourceImg;
    }

    public void setSourceImg(String sourceImg) {
        this.sourceImg = sourceImg;
    }

    public boolean getIsThumbnail() {
        return isThumbnail;
    }

    public void setIsThumbnail(boolean thumbnail) {
        isThumbnail = thumbnail;
    }
}
