package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.Category;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

import java.util.List;

@RegisterBeanMapper(Category.class)
public interface CategoryDao {

    @SqlQuery(QUERIES.CATEGORY.SELECT_ALL_CATEGORY)
    List<Category> list();

    @SqlQuery(QUERIES.CATEGORY.FIND_BY_CATEGORYID)
    Category findById(@Bind("id") int id);

    @SqlUpdate(QUERIES.CATEGORY.UPDATE)
    void update(@Bind("id") int id);

    @SqlUpdate(QUERIES.CATEGORY.DELETE)
    void delete(@Bind("id") int id);
}
