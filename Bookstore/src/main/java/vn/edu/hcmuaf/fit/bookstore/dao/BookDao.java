package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

import java.util.List;

@RegisterBeanMapper(Book.class)
public interface BookDao {

    @SqlQuery(QUERIES.BOOK.SELECT_ALL_BOOK_LIMIT)
    List<Book> listProduct(@Bind("limit") int limit, @Bind("offset") int offset);

    @SqlQuery(QUERIES.BOOK.FIND_BY_BID)
    Book findById(@Bind("id") int id);

    @SqlUpdate(QUERIES.BOOK.DELETE)
    void delete(@Bind("id") int id);

    @SqlUpdate(QUERIES.BOOK.UPDATE)
    void update(@Bind("id") int id);
}
