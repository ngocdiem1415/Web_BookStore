package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.beans.Category;
import vn.edu.hcmuaf.fit.bookstore.beans.Promotion;
import vn.edu.hcmuaf.fit.bookstore.beans.Publisher;
import vn.edu.hcmuaf.fit.bookstore.dao.CategoryDao;
import vn.edu.hcmuaf.fit.bookstore.dao.BookDao;
import vn.edu.hcmuaf.fit.bookstore.dao.PromotionDao;
import vn.edu.hcmuaf.fit.bookstore.dao.PublisherDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.util.List;
import java.util.stream.Collectors;

public class BookDetailService {
    private static BookDetailService instance = null;
    Jdbi connect = JDBIConnector.getJdbi();

    public static BookDetailService getInstance() {
        if (instance == null) instance = new BookDetailService();
        return instance;
    }

    public List<Book> listProduct() {
        List<Book> books = connect.withExtension(BookDao.class, handle -> handle.listProduct());
        return books.stream().map(product -> mapOtherBean(product)).collect(Collectors.toList());
    }

    public Book findById(int id){
        return connect.withExtension(BookDao.class, handle -> mapOtherBean(findById(id)));
    }

    private Book mapOtherBean(Book book) {
        if (book == null) {
            System.out.println("Book is null");
            return new Book();
        }
        System.out.println("Book: " + book.getTitle());
        Category category = connect.withExtension(CategoryDao.class, handle -> handle.findById(book.getCategoryId()));
        Publisher publisher = connect.withExtension(PublisherDao.class, handle -> handle.findById(book.getPublisherId()));
        Promotion promotion = connect.withExtension(PromotionDao.class, handle -> handle.findById(book.getPromotionId()));
//    System.out.println("Category: " + category.getName());
//    System.out.println("Publisher: " + publisher.getName());
        book.setCategory(category);
        book.setPublisher(publisher);
        book.setPromotion(promotion);
        return book;
    }


}
