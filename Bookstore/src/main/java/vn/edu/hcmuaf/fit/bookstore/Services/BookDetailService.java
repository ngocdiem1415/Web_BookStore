package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.*;
import vn.edu.hcmuaf.fit.bookstore.dao.*;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

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
//        return books.stream().map(product -> mapOtherBean(product)).collect(Collectors.toList());
        return books.stream()
                .map(book -> mapOtherBean(book))
                .collect(Collectors.toList());
    }

    public List<Book> listProductsTest(int limit, int offset, String keywword) {
        List<Book> books = connect.withExtension(BookDao.class, handle -> handle.listProductTest(limit, offset, keywword));
//        return books.stream().map(product -> mapOtherBean(product)).collect(Collectors.toList());
        return books.stream()
                .map(book -> mapOtherBean(book))
                .collect(Collectors.toList());
    }


    public List<Book> newBooks(int limit) {
        List<Book> books = connect.withExtension(BookDao.class, handle -> handle.newBooks(limit));
        return books.stream()
                .map(book -> mapOtherBean(book))
                .collect(Collectors.toList());
//        return books.stream().map(product -> mapOtherBean(product)).collect(Collectors.toList());
    }

    public List<Book> listAllProduct() {
        List<Book> books = connect.withExtension(BookDao.class, handle -> handle.listAllProduct());
        return books.stream()
                .map(book -> mapOtherBean(book))
                .collect(Collectors.toList());
//        return books.stream().map(product -> mapOtherBean(product)).collect(Collectors.toList());
    }

    public Book findById(int id) {
        Book book = connect.withExtension(BookDao.class, handle -> handle.findById(id));

        if (book == null) {
            System.err.println("Không tìm thấy Book với ID: " + id);
            return null;
        }

//        Image image = connect.withExtension(ImageBookDao.class, handle -> handle.findImageThumbnailByBookId(id));
//        List<Image> images = connect.withExtension(ImageBookDao.class, handle -> handle.findImageBookId(id));
//        Publisher publisher = connect.withExtension(PublisherDao.class, handle -> handle.findById(book.getPublisherId()));
//        Integer promoId = book.getPromotionId();
//        if (promoId != null) {
//            int pid = promoId;
//            Promotion promotion = connect.withExtension(PromotionDao.class, handle -> handle.findById(pid));
//            book.setPromotion(promotion);
//        } else {
//            book.setPromotionId(0);
//        }
//        book.setImage(image);
//        book.setPublisher(publisher);
//        book.setImageList(images);
//        return book;
        List<Image> images = connect.withExtension(ImageBookDao.class, handle -> handle.findImageBookId(id));
        book.setImageList(images);

        return mapOtherBean(book);
    }


    public List<Book> findByName(String title) {
        try {
            List<Book> books = connect.withExtension(BookDao.class, handle -> handle.findByName(title));

            if (books == null) {
                System.out.println("Không tìm thấy book với title: " + title);
                return null;
            }

            for (Book book : books) {
                int bookId = book.getbId();

                Image image = connect.withExtension(ImageBookDao.class, handle -> handle.findImageThumbnailByBookId(bookId));
                List<Image> images = connect.withExtension(ImageBookDao.class, handle -> handle.findImageBookId(bookId));
                Publisher publisher = connect.withExtension(PublisherDao.class, handle -> handle.findById(book.getPublisherId()));
                if (book.getPromotionId() != null) {
                    Promotion promotion = connect.withExtension(PromotionDao.class, handle -> handle.findById(book.getPromotionId()));
                    book.setPromotion(promotion);
                }
                book.setImage(image);
                book.setImageList(images);
                book.setPublisher(publisher);
            }
            return books;

        } catch (Exception e) {
            System.err.println("Lỗi khi tìm Book theo title: " + title);
            e.printStackTrace();
            return null;
        }
    }


    public List<Book> getRelatedBooks(int categoryId, int bookId) {
        List<Book> books = connect.withExtension(BookDao.class, handle -> handle.findRelatedBooks(categoryId, bookId));
        for (Book book : books) {
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
        Image image = connect.withExtension(ImageBookDao.class, handle -> handle.findImageThumbnailByBookId(book.getbId()));
        Integer promoId = book.getPromotionId();
        if (promoId != null) {
            int pid = promoId;
            Promotion promotion = connect.withExtension(PromotionDao.class, handle -> handle.findById(pid));
            book.setPromotion(promotion);
        } else {
            book.setPromotionId(0);
        }
        book.setCategory(category);
        book.setPublisher(publisher);
        book.setImage(image);

        BookStockView stockView = connect.withExtension(BookDao.class, handle -> handle.getBookStockById(book.getbId()));
        if (stockView != null) {
            book.setSoldQuantity(stockView.getTotalSold());
            book.setStockQuantity(stockView.getStockRemaining());
            System.out.println("Book ID: " + book.getbId()
                    + ", Daban: " + book.getSoldQuantity()
                    + ", Tonkho: " + book.getStockQuantity());
        } else {
            book.setSoldQuantity(0);
            book.setStockQuantity(0);
        }
        return book;
    }

    public List<Book> getBookByListPromotion() {
        List<Book> books = connect.withExtension(BookDao.class, handle -> handle.getBookByListPromotion());
        return books.stream().map(book -> mapOtherBean(book)).collect(Collectors.toList());
    }

    public void delete(int id) {
        try {
            connect.withExtension(BookDao.class, handle -> handle.delete(id));
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    public int totalBooks() {
        try {
            return connect.withExtension(BookDao.class, handle -> handle.totalBooks());
        } catch (Exception e) {
            e.printStackTrace();
            return 0; // Trả về 0 nếu có lỗi
        }
    }

    public List<Book> getBooks(int categoryId, int publisherId, String find, int limit, int offset, String orderBy,
                               double ratingValue, int from, int to) {
        List<Book> products = new ArrayList<Book>();
        List<Book> temp;
        return products;
    }

    public Book updateProduct(Book product) {
        try {
            connect.withExtension(BookDao.class, handle -> handle.updateBook(product));
            return findByName(product.getTitle()).get(0);
        } catch (Exception e) {
            System.err.println("Lỗi khi cập nhật sản phẩm: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }


    public Book insertProduct(Book product) {
        try {
            connect.withExtension(BookDao.class, handle -> handle.insertBook(product));
            return findByName(product.getTitle()).get(0);
        } catch (RuntimeException e) {
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi chèn sản phẩm vào CSDL", e);
        }
    }

    public List<Book> listByCategory(String category_name, int limit, int offset) {
        List<Book> books = connect.withExtension(BookDao.class, handle -> handle.listByCategory(category_name, limit, offset));
        return books.stream().map(book -> mapOtherBean(book)).collect(Collectors.toList());
    }

}
