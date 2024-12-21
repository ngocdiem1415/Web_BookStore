package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;

import java.util.List;

@RegisterBeanMapper(Book.class)
public interface BookDao {

    @SqlQuery("select * from books")
    List<Book> listProduct();

    @SqlQuery("select * from books where b_id = :id")
    Book findById(@Bind("id") int id);

    @SqlQuery("select * from books where status = 1")
    List<Book> listClient();

    @SqlUpdate("delete from books where b_id = :id")
    void delete(@Bind("id") int id);


}
