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

    @SqlQuery(QUERIES.BOOK.SELECT_RELATED_BOOKS)
    List<Book> findRelatedBooks(@Bind("categoryId") int categoryId, @Bind("bookId") int bookId);

    @SqlQuery(QUERIES.BOOK.SELECT_BOOK_PROMOTION_IN_DAY)
    Book getBookByPromotionId(@Bind("id") int promotionId);

    @SqlQuery(QUERIES.BOOK.SELECT_BOOK_SOLDS)
    List<Book> listBestSeller(@Bind("limit") int limit, @Bind("offset") int offset);

    @SqlQuery(QUERIES.BOOK.SELECT_BOOK_BY_CATEGORY)
    List<Book> listByCategory(@Bind("category_name") String category_name, @Bind("limit") int limit, @Bind("offset") int offset);
}
