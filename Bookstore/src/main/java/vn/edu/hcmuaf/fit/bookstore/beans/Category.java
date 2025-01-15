package vn.edu.hcmuaf.fit.bookstore.beans;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Category  implements Serializable {
    private int categoryId;
    private String category_name;
    private LocalDateTime update_at;

    public Category() {}

    public Category(int categoryId, String name, LocalDateTime update_at) {
        this.categoryId = categoryId;
        this.category_name = name;
        this.update_at = update_at;
    }

    @Override
    public String toString() {
        return "Category{" +
                "categoryId=" + categoryId +
                ", name='" + category_name + '\'' +
                ", update_at=" + update_at +
                '}';
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }

    public LocalDateTime getUpdate_at() {
        return update_at;
    }

    public void setUpdate_at(LocalDateTime update_at) {
        this.update_at = update_at;
    }
}

