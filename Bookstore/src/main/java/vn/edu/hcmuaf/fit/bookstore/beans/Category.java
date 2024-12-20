package vn.edu.hcmuaf.fit.bookstore.beans;

import java.time.LocalDateTime;
import java.util.Date;

public class Category {
    private int categoryId;
    private String name;
    private LocalDateTime update_at;

    public Category() {}

    public Category(int categoryId, String name, LocalDateTime update_at) {
        this.categoryId = categoryId;
        this.name = name;
        this.update_at = update_at;
    }

    @Override
    public String toString() {
        return "Category{" +
                "categoryId=" + categoryId +
                ", name='" + name + '\'' +
                ", update_at=" + update_at +
                '}';
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDateTime getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(LocalDateTime update_at) {
        this.update_at = update_at;
    }
}

