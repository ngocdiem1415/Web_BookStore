package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.*;
import vn.edu.hcmuaf.fit.bookstore.dao.*;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.util.ArrayList;
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
        return books.stream().map(book -> mapOtherBean(book)).collect(Collectors.toList());
    }

    public List<Book> listAllProduct() {
        List<Book> books = connect.withExtension(BookDao.class, handle -> handle.listAllProduct());
        return books.stream().map(product -> mapOtherBean(product)).collect(Collectors.toList());
    }

    public Book findById(int id) {
        Book book = connect.withExtension(BookDao.class, handle -> handle.findById(id));
        Image image  = connect.withExtension(ImageBookDao.class, handle -> handle.findImageThumbnailByBookId(id));
        List<Image> images = connect.withExtension(ImageBookDao.class, handle -> handle.findImageBookId(id));
        Publisher publisher = connect.withExtension(PublisherDao.class, handle -> handle.findById(id));
        Promotion promotion = connect.withExtension(PromotionDao.class, handle -> handle.findById(id));
        book.setImage(image);
        book.setPublisher(publisher);
        book.setPromotion(promotion);
        book.setImageList(images);
        return book;
    }

    public List<Book> getRelatedBooks(int categoryId, int bookId) {
        List<Book> books = connect.withExtension(BookDao.class, handle -> handle.findRelatedBooks(categoryId, bookId));
        for(Book book : books) {
            Image image = connect.withExtension(ImageBookDao.class, handle -> handle.findImageThumbnailByBookId(book.getbId()));
            book.setImage(image);
        }
        return books;
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
        Double rating = connect.withExtension(ReviewDao.class, handle -> handle.getRatingOfBook(book.getbId()));
        book.setRating(rating != null ? rating : 0.0);
//    System.out.println("Category: " + category.getName());
//    System.out.println("Publisher: " + publisher.getName());
        book.setCategory(category);
        book.setPublisher(publisher);
        book.setPromotion(promotion);
        book.setImage(image);
        System.out.println(book.toString());
        return book;
    }

    public Book getBookByPromotionId(int promotionId) {
        Book book = connect.withExtension(BookDao.class, handle -> handle.getBookByPromotionId(promotionId));
        Image image = connect.withExtension(ImageBookDao.class, handle -> handle.findImageThumbnailByBookId(book.getbId()));
        book.setImage(image);
        return book;
    }

    public List<Book> getBestSellers(int limit, int offset) {
        List<Book> books = connect.withExtension(BookDao.class, handle -> handle.listBestSeller(limit, offset));
        for(Book book: books) {
            Image image = connect.withExtension(ImageBookDao.class, handle -> handle.findImageThumbnailByBookId(book.getbId()));
            book.setImage(image);
        }
        return books;
    }


    public List<Book> getBooks(int categoryId, int publisherId, String find, int limit, int offset, String orderBy, double ratingValue, int from, int to) {
        List<Book> products = new ArrayList<Book>();
        List<Book> temp;

        if ("book_update_DESC".equals(orderBy)) {
            temp = connect.withExtension(BookDao.class, handle -> handle.findByBookUpdateDESC(categoryId, publisherId, find, from, to, limit, offset));
        } else if ("book_update_ASC".equals(orderBy)) {
            temp = connect.withExtension(BookDao.class, handle -> handle.findByBookUpdateASC(categoryId, publisherId, find, from, to, limit, offset));
        } else if ("book_price_DESC".equals(orderBy)) {
            temp = connect.withExtension(BookDao.class, handle -> handle.findByPriceDESC(categoryId, publisherId, find, from, to, limit, offset));
        } else if ("book_price_ASC".equals(orderBy)) {
            temp = connect.withExtension(BookDao.class, handle -> handle.findByPriceASC(categoryId, publisherId, find, from, to, limit, offset));
        } else {
            temp = connect.withExtension(BookDao.class, handle -> handle.getProductsOnPage(categoryId, publisherId, find, from, to, limit, offset));
        }

        // Lọc theo ratingValue
        if (ratingValue > 0) {
            temp = temp.stream()
                    .filter(bookDao -> bookDao.getRating() >= ratingValue)
                    .collect(Collectors.toList());
        }

        products = temp.stream()
                .map(product -> mapOtherBean(product))
                .collect(Collectors.toList());

        return products;
    }

    public List<Book> listByCategory(String category_name, int limit, int offset) {
        List<Book> books = connect.withExtension(BookDao.class, handle -> handle.listByCategory(category_name, limit, offset));
        for(Book book: books) {
            Image image = connect.withExtension(ImageBookDao.class, handle -> handle.findImageThumbnailByBookId(book.getbId()));
            book.setImage(image);
        }
        return books;
    }

    public int totalBooks() {
        try {
            return connect.withExtension(BookDao.class, handle -> handle.totalBooks());
        } catch (Exception e) {
            e.printStackTrace();
            return 0; // Trả về 0 nếu có lỗi
        }
    }

    public void delete(int id) {
        try {
            connect.withExtension(BookDao.class, handle -> handle.delete(id));
        }catch (Exception e) {
            e.printStackTrace();
        }
    }

//    public int getCurrentPromotionId() {
//        List<Promotion> promotions = connect.withExtension(PromotionDao.class, handle -> handle.list());
//
//        for(Promotion promotion: promotions) {
//            if (promotion.isActive()) {
//                return promotion.getPromotionId();
//            }
//        }
//        // Nếu không có khuyến mãi nào đang active, trả về khuyến mãi đầu tiên hoặc giá trị mặc định
//        return promotions.isEmpty() ? -1 : promotions.get(0).getPromotionId();
//    }

}
