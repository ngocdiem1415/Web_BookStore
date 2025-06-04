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
    private static ReviewService reviewService = new ReviewService();
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

    public List<Book> listProductsTest(int limit, int offset, String publisher, String category, String firstPrice, String secondPrice,
                                       String rating, String sort, String findWord) {

        System.out.println(
                "limit: " + limit +
                        "; offset: " + offset +
                        "; publisher: " + publisher +
                        "; category: " + category +
                        "; firstPrice: " + firstPrice +
                        "; secondPrice: " + secondPrice +
                        "; rating: " + rating +
                        "; sort: " + sort +
                        "; findWord: " + findWord
        );
        List<Book> books = new ArrayList<>();
        try {
            Integer publisherId = (!"".equals(publisher)) ? Integer.parseInt(publisher) : null;
            Integer categoryId = (!"".equals(category)) ? Integer.parseInt(category) : null;
            Integer minPrice = (!"".equals(firstPrice)) ? Integer.parseInt(firstPrice) : null;
            Integer maxPrice = (!"".equals(secondPrice)) ? Integer.parseInt(secondPrice) : null;
            Integer totalRating = (!"".equals(rating)) ? Integer.parseInt(rating) : null;

            switch (sort) {
                case "0":
                    System.out.println("Hàng mới nhất");
                    books = connect.withExtension(BookDao.class, handle -> handle.findByBookUpdateDESC(limit, offset, publisherId, categoryId
                            , minPrice, maxPrice, totalRating, findWord));
                    break;
                case "1":
                    //Hàng cũ nhất
                    System.out.println("Hàng cũ nhất");
                    books = connect.withExtension(BookDao.class, handle -> handle.findByBookUpdateASC(limit, offset, publisherId, categoryId
                            , minPrice, maxPrice, totalRating, findWord));
                    break;
                case "2":
                    //Giá tăng dần
                    System.out.println("Giá tăng dần");
                    books = connect.withExtension(BookDao.class, handle -> handle.findByPriceASC(limit, offset, publisherId, categoryId
                            , minPrice, maxPrice, totalRating, findWord));
                    break;
                case "3":
                    //Giá giảm dần
                    System.out.println("Giá giảm dần");
                    books = connect.withExtension(BookDao.class, handle -> handle.findByPriceDESC(limit, offset, publisherId, categoryId
                            , minPrice, maxPrice, totalRating, findWord));
                    break;

                case "4":
                    //Hàng gỉam giá
                    System.out.println("Hàng gỉam giá");
                    books = connect.withExtension(BookDao.class, handle -> handle.listProductDiscount(limit, offset, publisherId, categoryId
                            , minPrice, maxPrice, totalRating, findWord));
                    break;

                default:
                    // Không sort
                    try {
                        books = connect.withExtension(BookDao.class, handle -> handle.listProductFilter(limit, offset, publisherId, categoryId
                                , minPrice, maxPrice, totalRating, findWord));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    break;

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
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
        List<Image> images = connect.withExtension(ImageBookDao.class, handle -> handle.findImageBookId(id));
        book.setImageList(images);

        List<Review> reviews = reviewService.getReviewsByBookId(id);
        book.setReviewList(reviews);
//        System.out.println(reviews);
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
        double rating = connect.withExtension(ReviewDao.class, handle -> {
            Double ratingFromDb = handle.getRatingOfBook(book.getbId());
            return (ratingFromDb != null) ? ratingFromDb : 0.0;
        });
        Integer promoId = book.getPromotionId();
        if (promoId != null) {
            int pid = promoId;
            Promotion promotion = connect.withExtension(PromotionDao.class, handle -> handle.findById(pid));
            book.setPromotion(promotion);
        } else {
            book.setPromotionId(0);
        }
        book.setRating(rating);
        book.setCategory(category);
        book.setPublisher(publisher);
        book.setImage(image);

        BookStockView stockView = connect.withExtension(BookDao.class, handle -> handle.getBookStockById(book.getbId()));
        if (stockView != null) {
            book.setSoldQuantity(stockView.getTotalSold());
            book.setStockQuantity(stockView.getStockRemaining());
//            System.out.println("Book ID: " + book.getbId()
//                    + ", Daban: " + book.getSoldQuantity()
//                    + ", Tonkho: " + book.getStockQuantity());
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
            boolean updateBook = connect.withExtension(BookDao.class, handle -> handle.updateBook(product));
            return findByName(product.getTitle()).get(0);
        } catch (Exception e) {
            System.err.println("Lỗi khi cập nhật sản phẩm: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }


    public Book insertProduct(Book product) {
        List<Book> exsit = connect.withExtension(BookDao.class, handle -> handle.findByName(product.getTitle()));
        if (exsit.isEmpty()) {
            try {
                boolean success = connect.withExtension(BookDao.class, handle -> handle.insertBook(product));
                return success ? findByName(product.getTitle()).get(0) : null;
            } catch (RuntimeException e) {
                e.printStackTrace();
                throw new RuntimeException("Lỗi khi chèn sản phẩm vào CSDL", e);
            }
        } else {
            return null;
        }
    }

    public List<Book> listByCategory(String category_name, int limit, int offset) {
        List<Book> books = connect.withExtension(BookDao.class, handle -> handle.listByCategory(category_name, limit, offset));
        return books.stream().map(book -> mapOtherBean(book)).collect(Collectors.toList());
    }

}
