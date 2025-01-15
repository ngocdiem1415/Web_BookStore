package vn.edu.hcmuaf.fit.bookstore.beans;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

public class Book implements Serializable {
    private int bId;
    private String title;
    private String author;
    private int categoryId;
    private int publisherId;
    private int promotionId;
    private Category category;
    private Publisher publisher;
    private Promotion promotion;
    private int publishYear;
    private String dimensions;
    private double weight;
    private int pageCount;
    private String format;
    private double originalPrice;
    private String description;
    private int soldQuantity;
    private int stockQuantity;
    public LocalDateTime create_at;
    public LocalDateTime update_at;
    private int status;
    private Image image;
    private double salePrice;
    private double rating;
    private List<Image> imageList;

    public Book() {}

    public Book(int bId, String title, String author, int categoryId, int publisherId, int promotionId, Category category, Publisher publisher, Promotion promotion, int publishYear, String dimensions, double weight, int pageCount, String format, double originalPrice, String description, int soldQuantity, int stockQuantity, LocalDateTime create_at, LocalDateTime update_at, int status,Image image, double rating) {
        this.bId = bId;
        this.title = title;
        this.author = author;
        this.categoryId = categoryId;
        this.publisherId = publisherId;
        this.promotionId = promotionId;
        this.category = category;
        this.publisher = publisher;
        this.promotion = promotion;
        this.publishYear = publishYear;
        this.dimensions = dimensions;
        this.weight = weight;
        this.pageCount = pageCount;
        this.format = format;
        this.originalPrice = originalPrice;
        this.description = description;
        this.soldQuantity = soldQuantity;
        this.stockQuantity = stockQuantity;
        this.create_at = create_at;
        this.update_at = update_at;
        this.status = status;
        this.image = image;
        this.rating = rating;
    }

    public Book(int bId, String title, String author, int categoryId, int publisherId, int promotionId, Category category, Publisher publisher, Promotion promotion, int publishYear, String dimensions, double weight, int pageCount, String format, double originalPrice, String description, int soldQuantity, int stockQuantity, LocalDateTime create_at, LocalDateTime update_at, int status, Image image, List<Image> imageList) {
        this.bId = bId;
        this.title = title;
        this.author = author;
        this.categoryId = categoryId;
        this.publisherId = publisherId;
        this.promotionId = promotionId;
        this.category = category;
        this.publisher = publisher;
        this.promotion = promotion;
        this.publishYear = publishYear;
        this.dimensions = dimensions;
        this.weight = weight;
        this.pageCount = pageCount;
        this.format = format;
        this.originalPrice = originalPrice;
        this.description = description;
        this.soldQuantity = soldQuantity;
        this.stockQuantity = stockQuantity;
        this.create_at = create_at;
        this.update_at = update_at;
        this.status = status;
        this.image = image;
        this.imageList = imageList;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bId=" + bId +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", categoryId=" + categoryId +
                ", publisherId=" + publisherId +
                ", promotionId=" + promotionId +
                ", category=" + category +
                ", publisher=" + publisher +
                ", promotion=" + promotion +
                ", publishYear=" + publishYear +
                ", dimensions='" + dimensions + '\'' +
                ", weight=" + weight +
                ", pageCount=" + pageCount +
                ", format='" + format + '\'' +
                ", originalPrice=" + originalPrice +
                ", soldQuantity=" + soldQuantity +
                ", stockQuantity=" + stockQuantity +
                ", create_at=" + create_at +
                ", update_at=" + update_at +
                ", status=" + status +
                ", image=" + image +
                ", rating=" + rating+
                '}';
    }
    public double getsalePrice(){
        return (promotion == null) ? originalPrice : (originalPrice - (originalPrice * promotion.getDiscount()));
    }
    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public Publisher getPublisher() {
        return publisher;
    }

    public void setPublisher(Publisher publisher) {
        this.publisher = publisher;
    }

    public Promotion getPromotion() {
        return promotion;
    }

    public void setPromotion(Promotion promotion) {
        this.promotion = promotion;
    }

    public LocalDateTime getCreate_at() {
        return create_at;
    }

    public void setCreate_at(LocalDateTime create_at) {
        this.create_at = create_at;
    }

    public LocalDateTime getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(LocalDateTime update_at) {
        this.update_at = update_at;
    }
    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public List<Image> getImageList() {
        return imageList;
    }

    public void setImageList(List<Image> imageList) {
        this.imageList = imageList;
    }
}

