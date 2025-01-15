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

    @SqlQuery(QUERIES.BOOK.SELECT_PRODUCT_PAGE)
    List<Book> getProductsOnPage(@Bind("category_id") int category_id, @Bind("p_id") int p_id,
                          @Bind("find") String find,@Bind("firstPrice") int firstPrice, @Bind("secondPrice") int secondPrice ,
                          @Bind("limit") int limit, @Bind("offset") int offset);

    @SqlQuery(QUERIES.BOOK.SELECT_BOOK_UPDATE_DESC)
    List<Book> findByBookUpdateDESC(@Bind("category_id") int category_id, @Bind("p_id") int p_id,
                              @Bind("find") String find,@Bind("firstPrice") int firstPrice, @Bind("secondPrice") int secondPrice ,
                                    @Bind("limit") int limit, @Bind("offset") int offset);
    @SqlQuery(QUERIES.BOOK.SELECT_BOOK_UPDATE_ASC)
    List<Book> findByBookUpdateASC(@Bind("category_id") int category_id, @Bind("p_id") int p_id,
                             @Bind("find") String find,@Bind("firstPrice") int firstPrice, @Bind("secondPrice") int secondPrice ,
                                   @Bind("limit") int limit, @Bind("offset") int offset);
    @SqlQuery(QUERIES.BOOK.SELECT_BOOK_PRICE_DESC)
    List<Book> findByPriceDESC(@Bind("category_id") int category_id, @Bind("p_id") int p_id,
                         @Bind("find") String find,@Bind("firstPrice") int firstPrice, @Bind("secondPrice") int secondPrice ,
                               @Bind("limit") int limit, @Bind("offset") int offset);
    @SqlQuery(QUERIES.BOOK.SELECT_BOOK_PRICE_ASC)
    List<Book> findByPriceASC(@Bind("category_id") int category_id, @Bind("p_id") int p_id,
                        @Bind("find") String find,@Bind("firstPrice") int firstPrice, @Bind("secondPrice") int secondPrice ,
                              @Bind("limit") int limit, @Bind("offset") int offset);
    @SqlUpdate(QUERIES.BOOK.DELETE)
    void delete(@Bind("id") int id);

    @SqlUpdate(QUERIES.BOOK.UPDATE)
    void update(@Bind("id") int id);

    @SqlQuery(QUERIES.BOOK.TOTALBOOK)
    int totalBooks();

}
