package vn.edu.hcmuaf.fit.bookstore.db;

public class QUERIES {

    public class USER {
        public static final String SELECT_ALL_USER = "select * from users where role = :role";
        public static final String FIND_BY_USERNAME_AND_PASSWORD = "select * from users where username = :username and password = :password";
        public static final String FIND_BY_ID = "select * from users where uid = :id";
        public static final String FIND_BY_USERNAME = "select * from users where username = :username";
        public static final String REGISTER = "insert into users (username, gender, dob, phone, email, password, status, role) values (:username, :gender, :dob, :phone, :email, :password, 1 , :role)";
        public static final String FIND_BY_EMAIL = "select * from users where email = :email";
        public static final String CHANGE_PASSWORD = "update users set password = :password where uid = :uid";
        public static final String DELETE = "delete from users where uid = :id";
        public static final String UPDATE_EMAIL_VERIFIED_BYID = "UPDATE users SET status = 1 WHERE uid = :uid";
        public static final String UPDATE_USER_ROLE = "UPDATE users SET username = :username, gender = :gender, dob = :dob, phone = :phone, email = :email WHERE uid = :id";
    }


    public class VERIFY_EMAIL {
        public static final String INSERT_VERIFY_EMAIL = "insert into password_reset_tokens (id ,email, token, created_at, expires_at) values (:id ,:email, :token, NOW(), :expiresAt)";
        public static final String SELECT_VERIFY_EMAIL_BY_CODE = "select * from password_reset_tokens where token = :token";
        public static final String DELETE_VERIFY_BY_USER_ID = "delete from password_reset_tokens where uid = :uid";
        public static final String DELETE = "delete from password_reset_tokens where id = :id";
    }

    public class BOOK {
        public static final String INSERT = "INSERT INTO books (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, status) " +
                "VALUES (:title, :author, :categoryId, :pId, :publishYear, :dimensions, :weight, :pageCount, :format, :originalPrice, :description, :promotionId, :soldQuantity, :stockQuantity, CURRENT_TIMESTAMP, :status)";
        public static final String SELECT_ALL_BOOK = "select * from books";
        public static final String SELECT_ALL_BOOK_LIMIT = "select * from books limit :limit OFFSET :offset";
        public static final String FIND_BY_BID = "select * from books where b_id = :id";
        public static final String UPDATE = "UPDATE books SET title = :title, author = :author, category_id = :categoryId, p_id = :pId, publish_year = :publishYear, weight = :weight, page_count = :pageCount, original_price = :originalPrice, description = :description, promotion_id = :promotionId, stock_quantity = :stockQuantity, create_at = :createAt, update_at = CURRENT_TIMESTAMP WHERE b_id = :bookId";
        public static final String DELETE = "delete from books where b_id = :id";
        public static final String TOTALBOOK = "select count(*) from books ";

        public static final String SELECT_PRODUCT_PAGE = "SELECT * FROM books " +
                "WHERE (category_id = :category_id OR category_id IS NULL) " +
                "AND (p_id = :p_id OR p_id IS NULL) " +
                "AND LOWER(title) LIKE CONCAT('%', LOWER(:find), '%') " +
                "AND original_price >= :firstPrice " +
                "AND original_price <= :secondPrice " +
                "LIMIT :limit OFFSET :offset";

        public static final String SELECT_BOOK_UPDATE_DESC = "SELECT * FROM books " +
                "WHERE (category_id = :category_id OR category_id IS NULL) " +
                "AND (p_id = :p_id OR p_id IS NULL) " +
                "AND LOWER(title) LIKE CONCAT('%', LOWER(:find), '%') " +
                "AND original_price >= :firstPrice " +
                "AND original_price <= :secondPrice " +
                "ORDER BY update_at DESC " +
                "LIMIT :limit OFFSET :offset";

        public static final String SELECT_BOOK_UPDATE_ASC = "SELECT * FROM books " +
                "WHERE (category_id = :category_id OR category_id IS NULL) " +
                "AND (p_id = :p_id OR p_id IS NULL) " +
                "AND LOWER(title) LIKE CONCAT('%', LOWER(:find), '%') " +
                "AND original_price >= :firstPrice " +
                "AND original_price <= :secondPrice " +
                "ORDER BY update_at ASC " +
                "LIMIT :limit OFFSET :offset";

        public static final String SELECT_BOOK_PRICE_DESC = "SELECT * FROM books " +
                "WHERE (category_id = :category_id OR category_id IS NULL) " +
                "AND (p_id = :p_id OR p_id IS NULL) " +
                "AND LOWER(title) LIKE CONCAT('%', LOWER(:find), '%') " +
                "AND original_price >= :firstPrice " +
                "AND original_price <= :secondPrice " +
                "ORDER BY original_price DESC " +
                "LIMIT :limit OFFSET :offset";

        public static final String SELECT_BOOK_PRICE_ASC = "SELECT * FROM books " +
                "WHERE (category_id = :category_id OR category_id IS NULL) " +
                "AND (p_id = :p_id OR p_id IS NULL) " +
                "AND LOWER(title) LIKE CONCAT('%', LOWER(:find), '%') " +
                "AND original_price >= :firstPrice " +
                "AND original_price <= :secondPrice " +
                "ORDER BY original_price ASC " +
                "LIMIT :limit OFFSET :offset";

        public static final String SELECT_RELATED_BOOKS = "select * from books where category_id = :categoryId and b_id != :bookId limit 4";
        public static final String SELECT_BOOK_PROMOTION_IN_DAY =
                "SELECT books.* FROM books JOIN promotions ON books.promotion_id = promotions.promotion_id WHERE NOW() >= promotions.start_date and NOW() <= promotions.end_date and promotions.promotion_id = :id";
        public static final String SELECT_BOOK_SOLDS = "select * from books order by sold_quantity desc limit :limit offset :offset";
        public static final String SELECT_BOOK_BY_CATEGORY = "SELECT books.* FROM books JOIN categories on books.category_id = categories.category_id WHERE categories.category_name = :category_name limit :limit offset :offset";
    }



    public class CATEGORY {
        public static final String SELECT_ALL_CATEGORY = "select * from categories";
        public static final String FIND_BY_CATEGORYID = "select * from categories where category_id = :id";
        public static final String UPDATE = "UPDATE books SET  category_name = :categoryName,update_at = CURRENT_TIMESTAMP WHERE category_id = :Id";
        public static final String DELETE = "delete from categories where category_id = :id";
        public static final String SELECT_BY_CATEGORY = "select * from categories where categoryId = :categoryId limit :limit";
    }

    public class IMAGE {
        public static final String SELECT_ALL_IMAGE_THUMBNAIL = "select * from images where is_thumbnail = 1";
        public static final String SELECT_ALL_IMAGE_THUMBNAIL_LIMIT = "select * from images where is_thumbnail = 1  limit :limit";
        public static final String FIND_IMAGE_THUMBNAIL_BY_ID = "select * from images where b_id = :id and is_thumbnail = 1";
        public static final String DELETE = "delete from images where b_id = :id";
        public static final String SELECT_ALL_IMAGE_BY_BOOKID = "select * from images where b_id = :id";

    }

    public class PROMOTION {
        public static final String SELECT_ALL_PROMOTION = "select * from promotions";
        public static final String FIND_BY_PROMOTIONID = "select * from promotions where promotion_id = :id";
        public static final String DELETE = "delete from promotions where promotion_id = :id";
        public static final String INSERT_PROMOTION =
                "INSERT INTO promotions (promotion_name, discount, start_date, end_date, is_Active) " +
                        "VALUES (:promotionName, :discount, :startDate, :endDate, " +
                        "CASE WHEN :startDate <= NOW() AND :endDate >= NOW() THEN 1 ELSE 0 END)";

    }

    public class PUBLISHER {
        public static final String SELECT_ALL_PUBLISHER = "select * from publishers";
        public static final String FIND_BY_PUBLISHERID = "select * from publishers where p_id = :id";
        public static final String DELETE = "delete from promotions where promotion_id = :id";
    }


    public class REVIEW {
        public static final String SELECT_ALL_REVIEW = "select * from reviews";
        public static final String FIND_BY_REVIEWID = "select * from reviews where bookId = :bookId";
        public static final String DELETE = "delete from reviews where review_id = :id";
        public static final String INSERT = "INSERT INTO reviews (invoice_id, book_id, user_id, review_date, rating, comment) " +
                "VALUES (:invoiceId, :bookId, :userId, :reviewDate, :rating, :comment";

        public static final String HASREVIEWED = "SELECT COUNT(*) > 0 FROM reviews " +
                "WHERE user_id = :userId AND book_id = :bookId AND invoice_id = :invoiceId";

        public static final String SELECT_LISTBOOK = "SELECT * FROM reviews WHERE book_id = :bookId ORDER BY review_date DESC";

        public static final String BOOK_RATING = "select COALESCE(AVG(rating), 0.0) from reviews " +
                "WHERE b_id = :b_id GROUP BY b_id";

    }
}

