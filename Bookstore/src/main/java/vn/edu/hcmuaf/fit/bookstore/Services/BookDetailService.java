package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.*;
import vn.edu.hcmuaf.fit.bookstore.dao.*;
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

    public List<Book> listProducts(int limit, int offset) {
        List<Book> books = connect.withExtension(BookDao.class, handle -> handle.listProduct(limit, offset));
        return books.stream().map(product -> mapOtherBean(product)).collect(Collectors.toList());
    }

//    public Book findById(int id){
//        return connect.withExtension(BookDao.class, handle -> handle.findById(id));
//    }


    public Book findById(int id) {
        Book book = connect.withExtension(BookDao.class, handle -> handle.findById(id));
        Image image  = connect.withExtension(ImageBookDao.class, handle -> handle.findImageThumbnailByBookId(id));
        Publisher publisher = connect.withExtension(PublisherDao.class, handle -> handle.findById(id));
        book.setImage(image);
        book.setPublisher(publisher);
        return book;
    }

    private Book mapOtherBean(Book book) {
        if (book == null) {
            System.out.println("Book is null");
            return new Book();
        }
        Category category = connect.withExtension(CategoryDao.class, handle -> handle.findById(book.getCategoryId()));
        Publisher publisher = connect.withExtension(PublisherDao.class, handle -> handle.findById(book.getPublisherId()));
        Promotion promotion = connect.withExtension(PromotionDao.class, handle -> handle.findById(book.getPromotionId()));
        Image image = connect.withExtension(ImageBookDao.class, handle -> handle.findImageThumbnailByBookId(book.getbId()));
//    System.out.println("Category: " + category.getName());
//    System.out.println("Publisher: " + publisher.getName());
        book.setCategory(category);
        book.setPublisher(publisher);
        book.setPromotion(promotion);
        book.setImage(image);
        System.out.println(book.toString());
        return book;
    }




}
