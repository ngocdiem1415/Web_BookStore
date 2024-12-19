package vn.edu.hcmuaf.fit.bookstore.Services;

import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.dao.ProductDao;

import java.util.ArrayList;
import java.util.List;

public class ProductService {
    static ProductDao productDao = new ProductDao();

    public List<Book> getAllBooks() {
        return productDao.getAllBooks();
    }

    public Book getDetail(String in) {
        try {
            int id = Integer.parseInt(in);
            return productDao.getById(id);
        } catch (NumberFormatException e) {
            return null;
        }
    }
}
