package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.Category;
import vn.edu.hcmuaf.fit.bookstore.dao.BookDao;
import vn.edu.hcmuaf.fit.bookstore.dao.CategoryDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class CategoryService {
    private static CategoryService instance = null;
    Jdbi connect = JDBIConnector.getJdbi();

    public static CategoryService getInstance() {
        if(instance == null) instance = new CategoryService();
        return instance;
    }

    public List<Category> listCategory(){
        return connect.withExtension(CategoryDao.class, handle -> handle.list());
    }

    public Category getCategoryById(int id){
        return connect.withExtension(CategoryDao.class, handle -> handle.findById(id));
    }

    public void insertCategory(String categoryName){
        connect.useExtension(CategoryDao.class, dao -> dao.insert(categoryName));
    }

    public void updateCategory(int categoryid, String categoryName){
        connect.useExtension(CategoryDao.class, dao -> dao.update(categoryid, categoryName));
    }
}
