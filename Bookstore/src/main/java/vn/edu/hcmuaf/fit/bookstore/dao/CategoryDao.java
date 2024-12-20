package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import vn.edu.hcmuaf.fit.bookstore.beans.Category;

import java.util.List;

@RegisterBeanMapper(Category.class)
public interface CategoryDao {

    @SqlQuery("select * from categories")
    List<Category> list();

    @SqlQuery("select * from categories where category_id = :id")
    Category findById(@Bind("id") int id);
}
