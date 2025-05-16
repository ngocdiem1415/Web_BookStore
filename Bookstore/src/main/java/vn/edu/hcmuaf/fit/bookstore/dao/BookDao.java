package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.beans.BookStockView;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

import java.util.List;

@RegisterBeanMapper(Book.class)
@RegisterBeanMapper(BookStockView.class)
public interface BookDao {

    @SqlQuery(QUERIES.BOOK.SELECT_ALL_BOOK_LIMIT)
    List<Book> listProduct(@Bind("limit") int limit, @Bind("offset") int offset);

    @SqlQuery(QUERIES.BOOK.SELECT_ALL_BOOK_FILTER)
    List<Book> listProductFilter(@Bind("limit") int limit,
                                 @Bind("offset") int offset,
                                 @Bind("p_id") Integer publisherId,
                                 @Bind("category_id") Integer categoryId,
                                 @Bind("firstPrice") Integer minPrice,
                                 @Bind("secondPrice") Integer maxPrice
                               , @Bind("rating") Integer totalRating,
                                 @Bind("find") String findWord);

    @SqlQuery(QUERIES.BOOK.SELECT_LIST_NEW_BOOK)
    List<Book> newBooks(@Bind("limit") int limit);

    @SqlQuery(QUERIES.BOOK.FIND_BY_BID)
    Book findById(@Bind("id") int id);

    @SqlQuery(QUERIES.BOOK.FIND_BY_TITLE)
    List<Book> findByName(@Bind("title") String title);

    //Hàng cũ nhất
    @SqlQuery(QUERIES.BOOK.SELECT_BOOK_UPDATE_DESC)
    List<Book> findByBookUpdateDESC(@Bind("limit") int limit,
                                    @Bind("offset") int offset,
                                    @Bind("p_id") Integer publisherId,
                                    @Bind("category_id") Integer categoryId,
                                    @Bind("firstPrice") Integer minPrice,
                                    @Bind("secondPrice") Integer maxPrice,
                                    @Bind("rating") Integer totalRating,
                                    @Bind("find") String findWord);

    //Hàng mới nhất
    @SqlQuery(QUERIES.BOOK.SELECT_BOOK_UPDATE_ASC)
    List<Book> findByBookUpdateASC(@Bind("limit") int limit,
                                   @Bind("offset") int offset,
                                   @Bind("p_id") Integer publisherId,
                                   @Bind("category_id") Integer categoryId,
                                   @Bind("firstPrice") Integer minPrice,
                                   @Bind("secondPrice") Integer maxPrice,
                                   @Bind("rating") Integer totalRating,
                                   @Bind("find") String findWord);
    //Giá giảm dần
    @SqlQuery(QUERIES.BOOK.SELECT_BOOK_PRICE_DESC)
    List<Book> findByPriceDESC(@Bind("limit") int limit,
                               @Bind("offset") int offset,
                               @Bind("p_id") Integer publisherId,
                               @Bind("category_id") Integer categoryId,
                               @Bind("firstPrice") Integer minPrice,
                               @Bind("secondPrice") Integer maxPrice,
                               @Bind("rating") Integer totalRating,
                               @Bind("find") String findWord);
    //Giá thấp nhất
    @SqlQuery(QUERIES.BOOK.SELECT_BOOK_PRICE_ASC)
    List<Book> findByPriceASC(@Bind("limit") int limit,
                              @Bind("offset") int offset,
                              @Bind("p_id") Integer publisherId,
                              @Bind("category_id") Integer categoryId,
                              @Bind("firstPrice") Integer minPrice,
                              @Bind("secondPrice") Integer maxPrice,
                              @Bind("rating") Integer totalRating,
                              @Bind("find") String findWord);

    @SqlQuery(QUERIES.BOOK.SELECT_ALL_BOOK_DISCOUNT)
    List<Book> listProductDiscount(@Bind("limit") int limit,
                                 @Bind("offset") int offset,
                                 @Bind("p_id") Integer publisherId,
                                 @Bind("category_id") Integer categoryId,
                                 @Bind("firstPrice") Integer minPrice,
                                 @Bind("secondPrice") Integer maxPrice,
                                 @Bind("rating") Integer totalRating,
                                 @Bind("find") String findWord);

    @SqlUpdate(QUERIES.BOOK.DELETE)
    boolean delete(@Bind("id") int id);
//     void delete(@BindBean Book book);

    @SqlUpdate(QUERIES.BOOK.UPDATE)
    void update(@BindBean Book book);
  


    @SqlQuery(QUERIES.BOOK.TOTALBOOK)
    int totalBooks();

    @SqlQuery(QUERIES.BOOK.SELECT_ALL_BOOK)
    List<Book> listAllProduct();

    @SqlQuery(QUERIES.BOOK.SELECT_RELATED_BOOKS)
    List<Book> findRelatedBooks(@Bind("categoryId") int categoryId, @Bind("bookId") int bookId);

    @SqlQuery(QUERIES.BOOK.SELECT_BOOK_BY_LIST_PROMOTION)
    List<Book>  getBookByListPromotion();

    @SqlQuery(QUERIES.BOOK.SELECT_BOOK_BY_CATEGORY)
    List<Book> listByCategory(@Bind("category_name") String category_name, @Bind("limit") int limit, @Bind("offset") int offset);
    
    @SqlUpdate(QUERIES.BOOK.UPDATE)
    boolean updateBook(@BindBean Book product);

    @SqlUpdate(QUERIES.BOOK.INSERT)
    boolean insertBook(@BindBean Book product);

    @SqlQuery(QUERIES.BOOK.GET_ALL_BOOKS_STOCK)
    List<BookStockView> getAllBookStocks();

    @SqlQuery(QUERIES.BOOK.GET_BOOK_STOCK_BY_ID)
    BookStockView getBookStockById(@Bind("id") int id);
}
