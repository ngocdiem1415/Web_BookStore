package vn.edu.hcmuaf.fit.bookstore.beans;

import java.util.Date;

public class Book {
    private int bId;
    private String title;
    private int authorId;
    private int categoryId;
    private int publisherId;
    private int publishYear;
    private String dimensions;
    private double weight;
    private int pageCount;
    private String format;
    private double originalPrice;
    private String description;
    private int promotionId;
    private int soldQuantity;
    private int stockQuantity;
    private Date create_at;
    private Date update_at;
    private int status;

    public Book() {}

    public Book(int bId, String title, int authorId, int categoryId, int publisherId, int publishYear, String dimensions, double weight, int pageCount, String format, double originalPrice, String description, int promotionId, int soldQuantity, int stockQuantity, Date create_at, Date update_at, int status) {
        this.bId = bId;
        this.title = title;
        this.authorId = authorId;
        this.categoryId = categoryId;
        this.publisherId = publisherId;
        this.publishYear = publishYear;
        this.dimensions = dimensions;
        this.weight = weight;
        this.pageCount = pageCount;
        this.format = format;
        this.originalPrice = originalPrice;
        this.description = description;
        this.promotionId = promotionId;
        this.soldQuantity = soldQuantity;
        this.stockQuantity = stockQuantity;
        this.create_at = create_at;
        this.update_at = update_at;
        this.status = status;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bId=" + bId +
                ", title='" + title + '\'' +
                ", authorId=" + authorId +
                ", categoryId=" + categoryId +
                ", publisherId=" + publisherId +
                ", publishYear=" + publishYear +
                ", dimensions='" + dimensions + '\'' +
                ", weight=" + weight +
                ", pageCount=" + pageCount +
                ", format='" + format + '\'' +
                ", originalPrice=" + originalPrice +
                ", description='" + description + '\'' +
                ", promotionId=" + promotionId +
                ", soldQuantity=" + soldQuantity +
                ", stockQuantity=" + stockQuantity +
                ", create_at=" + create_at +
                ", update_at=" + update_at +
                ", status=" + status +
                '}';
    }

    public int getbId() {
        return bId;
    }

    public void setbId(int bId) {
        this.bId = bId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getPublisherId() {
        return publisherId;
    }

    public void setPublisherId(int publisherId) {
        this.publisherId = publisherId;
    }

    public int getPublishYear() {
        return publishYear;
    }

    public void setPublishYear(int publishYear) {
        this.publishYear = publishYear;
    }

    public String getDimensions() {
        return dimensions;
    }

    public void setDimensions(String dimensions) {
        this.dimensions = dimensions;
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
        this.weight = weight;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public String getFormat() {
        return format;
    }

    public void setFormat(String format) {
        this.format = format;
    }

    public double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPromotionId() {
        return promotionId;
    }

    public void setPromotionId(int promotionId) {
        this.promotionId = promotionId;
    }

    public int getSoldQuantity() {
        return soldQuantity;
    }

    public void setSoldQuantity(int soldQuantity) {
        this.soldQuantity = soldQuantity;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCreate_at() {
        return create_at;
    }

    public void setCreate_at(Date create_at) {
        this.create_at = create_at;
    }

    public Date getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(Date update_at) {
        this.update_at = update_at;
    }
}

