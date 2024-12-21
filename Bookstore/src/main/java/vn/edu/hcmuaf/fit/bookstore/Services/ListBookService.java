package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.*;
import vn.edu.hcmuaf.fit.bookstore.dao.*;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.util.List;

public class ListBookService {
    private static ListBookService instance = null;
    Jdbi connect = JDBIConnector.getJdbi();

    public static ListBookService getInstance() {
        if(instance == null) instance = new ListBookService();
        return instance;
    }

    public List<Book> listProduct(){
        return connect.withExtension(BookDao.class, handle -> handle.listProduct());
//            return books.stream().map(product -> mapOtherBean(product)).collect(Collectors.toList());
        }

//    private Book mapOtherBean(Book book) {
//        if(book == null)return new Book();
//        Category category = connect.withExtension(CategoryDao.class, handle -> handle.findById(book.getCategoryId()));
//        Publisher publisher = connect.withExtension(PublisherDao.class, handle -> handle.findById(book.getPublisherId()));
//        Promotion promotion = connect.withExtension(PromotionDao.class, handle -> handle.findById(book.getPromotionId()));
//        book.setCategory(category);
//        book.setPublisher(publisher);
//        book.setPromotion(promotion);
//        return book;
//    }
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
//    book.setCategory(category);
//    book.setPublisher(publisher);
//    book.setPromotion(promotion);

    return book;
}


}
