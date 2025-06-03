package vn.edu.hcmuaf.fit.bookstore.db;

public class QUERIES {

    public class LOG {
        public static final String INSERT =
                "INSERT INTO Logs (user_id, session_id, ip_address, level, resource, action, data_before, data_after, locked) " +
                        "VALUES (:userId, :sessionId, :ipAddress, :level, :resource, :action, :dataBefore, :dataAfter, :locked)";


        public static final String LISTLOG = "SELECT * FROM Logs ORDER BY created_at DESC";
        public static final String FIND_BY_ID = "SELECT * FROM Logs WHERE log_id = :logId";
    }

    public class USER {
        public static final String TOTALUSER = "SELECT COUNT(*) FROM users";
        public static final String SELECT_ALL_USER = "select u.uid, u.username, u.avatar, u.gender, u.dob, u.phone, u.email, u.password, u.status, r.permission as role, u.create_at, u.update_at from users u left join role r on r.uid = u.uid where r.resource_id = :resource_id and r.permission >= :permission";
        public static final String TOTAL_USER_BY_DAY = "SELECT COUNT(*) FROM users where DATE(create_at) = CURRENT_DATE";
        public static final String FIND_BY_USERNAME_AND_PASSWORD = "select * from users where username = :username and password = :password";
        public static final String FIND_BY_ID = "select * from users where uid = :id";
        public static final String FIND_BY_USERNAME = "select * from users where username = :username";
        public static final String REGISTER = "insert into users (username, gender, dob, phone, email, password, status) values (:username, :gender, :dob, :phone, :email, :password, 0)";
        public static final String FIND_BY_EMAIL = "select * from users where email = :email";
        public static final String CHANGE_PASSWORD = "update users set password = :password where uid = :uid";
        public static final String UPDATE_EMAIL_VERIFIED_BYID = "UPDATE users SET status = 1 WHERE uid = :uid";
        public static final String UPDATE_USER_ROLE = "UPDATE users SET username = :username, gender = :gender, dob = :dob, phone = :phone, email = :email WHERE uid = :id";
        public static final String INSERT_BY_GOOGLE = "insert into users (username, gender, phone, email, password, status) values (:username, :gender, :phone, :email, :password, 1 )";
        public static final String FIND_ALL = "select * from users";
        public static final String UPDATE_EMAIL_VERIFIED_BY_EMAIL = "UPDATE users SET status = 1 WHERE email = :email";
        public static final String UPDATE_IMAGE_BY_ID = "UPDATE users SET username = :username, gender = :gender, dob = :dob, phone = :phone, email = :email, avatar = :avatar WHERE uid = :id";
        public static final String CHANGE_STATUS = "UPDATE users SET status = 0 WHERE uid = :uid";
        public static final String CHECK_PASSWORD = "SELECT * from users where uid = :uid AND password = :password";
    }

    public class ROLE {
        public static final String INSERT_ROLE = "INSERT INTO role (uid ,resource_id, permission) VALUES (:uid, :resource_id, :permission)";
        public static final String GET_PERMISSION = "SELECT permission FROM role WHERE uid = :uid AND resource_id =:resource_id";
        public static final String GET_PERMISSION_BY_USER_ID = "SELECT permission FROM role WHERE uid = :uid";
        public static final String UPDATE_ROLE = "UPDATE role SET permission = :permission WHERE uid = :uid AND resource_id = :resource_id";
        public static final String SELECT_RESOURCE_BY_USER_ID = "SELECT resource_id FROM role WHERE uid = :uid";
        public static final String SELECT_PERMISSION_BY_USER_ID = "SELECT permission FROM role WHERE uid = :uid AND resource_id = :resource_id";
        public static final String SELECT_ROLE_ADMINS = "SELECT resource_code FROM role join resource on role.resource_id = resource.resource_id WHERE uid = :uid AND role.permission >=2";
    }

    public class PERMISSION {
        public static final String GET_ALL_ROLES = "SELECT * FROM resource";
    }

    public class VERIFY_EMAIL {
        public static final String INSERT_VERIFY_EMAIL = "insert into password_reset_tokens (email, token, created_at, expires_at) values (:email, :token, NOW(), :expiresAt)";
        public static final String SELECT_VERIFY_EMAIL_BY_CODE = "select * from password_reset_tokens where token = :token";
        public static final String DELETE_VERIFY_BY_USER_ID = "delete from password_reset_tokens where email = :email";
        public static final String DELETE = "delete from password_reset_tokens where token = :token";
        public static final String DELETE_VERIFY_BY_EMAIL = "delete from password_reset_tokens where email = :email";
    }

    public class BOOK {
        public static final String INSERT =
                "INSERT INTO books (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id,create_at, status) " +
                        "VALUES (:title, :author, :categoryId, :publisherId, :publishYear, :dimensions, :weight, :pageCount, :format, :originalPrice, :description, :promotionId,CURRENT_TIMESTAMP, :status)";
        public static final String SELECT_ALL_BOOK = "select * from books";
        public static final String SELECT_ALL_BOOK_LIMIT =
                "SELECT * FROM books ORDER BY created_at DESC LIMIT :limit OFFSET :offset";
        //        public static final String SELECT_ALL_BOOK_LIMIT_TEST =
//                "SELECT * FROM books WHERE title LIKE CONCAT('%', :title, '%') LIMIT :limit OFFSET :offset";
        public static final String SELECT_ALL_BOOK_FILTER =
                "SELECT b.* ,COALESCE(AVG(rating), 0.0) as avg_rating" +
                        " FROM books b" +
                        " LEFT JOIN reviews r on  r.b_id = b.b_id" +
                        " WHERE (:find IS NULL OR b.title LIKE CONCAT('%', :find, '%'))" +
                        " AND (:p_id IS NULL OR b.p_id = :p_id)" +
                        " AND (:category_id IS NULL OR b.category_id = :category_id)" +
                        " AND (:firstPrice IS NULL OR b.original_price >= :firstPrice)" +
                        " AND (:secondPrice IS NULL OR b.original_price <= :secondPrice)" +
                        " GROUP BY b.b_id" +
                        " HAVING (:rating IS NULL OR avg_rating >= :rating)" +
                        " LIMIT :limit OFFSET :offset";

        public static final String SELECT_LIST_NEW_BOOK = "select * from books where update_at < NOW()- INTERVAL 1 MONTH limit :limit ";
        public static final String FIND_BY_BID = "select * from books where b_id = :id";
        public static final String FIND_BY_TITLE = "select * from books where title LIKE CONCAT('%', :title, '%')";
        public static final String UPDATE =
                "UPDATE books SET title = :title, author = :author, category_id = :categoryId, p_id = :publisherId, publish_year = :publishYear, " +
                        "weight = :weight, page_count = :pageCount, original_price = :originalPrice, description = :description, promotion_id = :promotionId,update_at = CURRENT_TIMESTAMP,status = :status WHERE b_id = :bId";
        public static final String DELETE = "delete from books where b_id = :id";
        public static final String TOTALBOOK = "select count(*) from books ";

        public static final String SELECT_BOOK_UPDATE_DESC =
                "SELECT b.* ,COALESCE(AVG(rating), 0.0) as avg_rating" +
                        " FROM books b" +
                        " LEFT JOIN reviews r on  r.b_id = b.b_id" +
                        " WHERE (:find IS NULL OR b.title LIKE CONCAT('%', :find, '%'))" +
                        " AND (:p_id IS NULL OR b.p_id = :p_id)" +
                        " AND (:category_id IS NULL OR b.category_id = :category_id)" +
                        " AND (:firstPrice IS NULL OR b.original_price >= :firstPrice)" +
                        " AND (:secondPrice IS NULL OR b.original_price <= :secondPrice)" +
                        " GROUP BY b.b_id" +
                        " HAVING (:rating IS NULL OR avg_rating >= :rating)" +
                        " ORDER BY update_at DESC " +
                        " LIMIT :limit OFFSET :offset";

        public static final String SELECT_BOOK_UPDATE_ASC = "SELECT b.* ,COALESCE(AVG(rating), 0.0) as avg_rating" +
                " FROM books b" +
                " LEFT JOIN reviews r on  r.b_id = b.b_id" +
                " WHERE (:find IS NULL OR b.title LIKE CONCAT('%', :find, '%'))" +
                " AND (:p_id IS NULL OR b.p_id = :p_id)" +
                " AND (:category_id IS NULL OR b.category_id = :category_id)" +
                " AND (:firstPrice IS NULL OR b.original_price >= :firstPrice)" +
                " AND (:secondPrice IS NULL OR b.original_price <= :secondPrice)" +
                " GROUP BY b.b_id" +
                " HAVING (:rating IS NULL OR avg_rating >= :rating)" +
                " ORDER BY update_at ASC " +
                " LIMIT :limit OFFSET :offset";

        public static final String SELECT_BOOK_PRICE_DESC =
                "SELECT b.* ,COALESCE(AVG(rating), 0.0) as avg_rating" +
                        " FROM books b" +
                        " LEFT JOIN reviews r on  r.b_id = b.b_id" +
                        " WHERE (:find IS NULL OR b.title LIKE CONCAT('%', :find, '%'))" +
                        " AND (:p_id IS NULL OR b.p_id = :p_id)" +
                        " AND (:category_id IS NULL OR b.category_id = :category_id)" +
                        " AND (:firstPrice IS NULL OR b.original_price >= :firstPrice)" +
                        " AND (:secondPrice IS NULL OR b.original_price <= :secondPrice)" +
                        " GROUP BY b.b_id" +
                        " HAVING (:rating IS NULL OR avg_rating >= :rating)" +
                        " ORDER BY original_price DESC " +
                        " LIMIT :limit OFFSET :offset";

        public static final String SELECT_BOOK_PRICE_ASC =
                "SELECT b.* ,COALESCE(AVG(rating), 0.0) as avg_rating" +
                        " FROM books b" +
                        " LEFT JOIN reviews r on  r.b_id = b.b_id" +
                        " WHERE (:find IS NULL OR b.title LIKE CONCAT('%', :find, '%'))" +
                        " AND (:p_id IS NULL OR b.p_id = :p_id)" +
                        " AND (:category_id IS NULL OR b.category_id = :category_id)" +
                        " AND (:firstPrice IS NULL OR b.original_price >= :firstPrice)" +
                        " AND (:secondPrice IS NULL OR b.original_price <= :secondPrice)" +
                        " GROUP BY b.b_id" +
                        " HAVING (:rating IS NULL OR avg_rating >= :rating)" +
                        " ORDER BY original_price ASC " +
                        " LIMIT :limit OFFSET :offset";

        public static final String SELECT_ALL_BOOK_DISCOUNT =
                "SELECT b.* ,COALESCE(AVG(rating), 0.0) as avg_rating" +
                        " FROM books b" +
                        " LEFT JOIN reviews r on  r.b_id = b.b_id" +
                        " WHERE (:find IS NULL OR b.title LIKE CONCAT('%', :find, '%'))" +
                        " AND (:p_id IS NULL OR b.p_id = :p_id)" +
                        " AND (:category_id IS NULL OR b.category_id = :category_id)" +
                        " AND (:firstPrice IS NULL OR b.original_price >= :firstPrice)" +
                        " AND (:secondPrice IS NULL OR b.original_price <= :secondPrice)" +
                        " AND b.promotion_id IS NOT NULL" +
                        " GROUP BY b.b_id" +
                        " HAVING (:rating IS NULL OR avg_rating >= :rating)" +
                        " ORDER BY original_price ASC " +
                        " LIMIT :limit OFFSET :offset";

        public static final String SELECT_RELATED_BOOKS = "select * from books where category_id = :categoryId and b_id != :bookId limit 4";
        public static final String SELECT_BOOK_BY_LIST_PROMOTION =
                "SELECT b.* FROM books b JOIN promotions p ON b.promotion_id = p.promotion_id WHERE p.is_active = 1 ORDER BY p.discount DESC LIMIT 5";

        public static final String SELECT_BOOK_BY_CATEGORY = "SELECT books.* FROM books JOIN categories on books.category_id = categories.category_id WHERE categories.category_name = :category_name limit :limit offset :offset";

        public static final String GET_ALL_BOOKS_STOCK = """
                    SELECT 
                        b.b_id,
                        IFNULL(s.total_imported, 0) AS totalImported,
                        IFNULL(idet.total_sold, 0) AS totalSold
                    FROM books b
                    LEFT JOIN (
                        SELECT b_id, SUM(quantity) AS total_imported
                        FROM Stocks
                        GROUP BY b_id
                    ) s ON b.b_id = s.b_id
                    LEFT JOIN (
                        SELECT b_id, SUM(quantity) AS total_sold
                        FROM invoice_details idet
                        INNER JOIN invoices i ON idet.invoice_id = i.invoice_id
                        WHERE i.status != 'Cancelled'
                        GROUP BY b_id
                    ) idet ON b.b_id = idet.b_id
                """;
        public static final String GET_BOOK_STOCK_BY_ID = """
                    SELECT 
                        b.b_id,
                        IFNULL(s.total_imported, 0) AS totalImported,
                        IFNULL(idet.total_sold, 0) AS totalSold
                    FROM books b
                    LEFT JOIN (
                        SELECT b_id, SUM(quantity) AS total_imported
                        FROM Stocks
                        GROUP BY b_id
                    ) s ON b.b_id = s.b_id
                    LEFT JOIN (
                        SELECT b_id, SUM(quantity) AS total_sold
                        FROM invoice_details idet
                        INNER JOIN invoices i ON idet.invoice_id = i.invoice_id
                        WHERE i.status != 'Cancelled'
                        GROUP BY b_id
                    ) idet ON b.b_id = idet.b_id
                    WHERE b.b_id = :id
                """;
    }


    public class CATEGORY {
        public static final String SELECT_ALL_CATEGORY = "select * from categories ORDER BY update_at DESC";
        public static final String FIND_BY_CATEGORYID = "select * from categories where category_id = :id";
        public static final String UPDATE = "UPDATE books SET  category_name = :categoryName,update_at = CURRENT_TIMESTAMP WHERE category_id = :Id";
        public static final String DELETE = "delete from categories where category_id = :id";
        public static final String SELECT_BY_CATEGORY = "select * from categories where categoryId = :categoryId limit :limit";
        public static final String INSERT_CATEGORY = "INSERT INTO categories (category_name, update_at) VALUES (:categoryName, NOW())";
        public static final String UPDATE_CATEGORY = "UPDATE categories SET category_name = :categoryName, update_at = NOW() WHERE category_id = :categoryid";
    }

    public class IMAGE {
        public static final String SELECT_ALL_IMAGE_THUMBNAIL = "select * from images where is_thumbnail = 1";
        public static final String SELECT_ALL_IMAGE_THUMBNAIL_LIMIT = "select * from images where is_thumbnail = 1  limit :limit";
        public static final String FIND_IMAGE_THUMBNAIL_BY_ID = "select * from images where b_id = :id and is_thumbnail = 1";
        public static final String FIND_IMAGE_BY_SOURCE = "select * from images where source_img = :source";
        public static final String DELETE_IMAGE_OTHER = "delete from images where b_id = :id AND is_thumbnail = 0";
        public static final String DELETE_IMAGE_THUMBNAIL = "delete from images where b_id = :id AND is_thumbnail = 1";
        public static final String INSERT = "INSERT INTO images (b_id, source_img, is_thumbnail) VALUES (:bookId, :sourceImg, :isThumbnail)";
        public static final String SELECT_ALL_IMAGE_BY_BOOKID = "select * from images where b_id = :id";
    }

    public class PROMOTION {
        public static final String SELECT_ALL_PROMOTION = "select * from promotions ";
        public static final String FIND_BY_PROMOTIONID = "select * from promotions where promotion_id = :id";
        public static final String DELETE = "delete from promotions where promotion_id = :id";
        public static final String INSERT_PROMOTION =
                "INSERT INTO promotions (promotion_name, discount, start_date, end_date, is_Active) " +
                        "VALUES (:promotionName, :discount, :startDate, :endDate, " +
                        "CASE WHEN :startDate <= NOW() AND :endDate >= NOW() THEN 1 ELSE 0 END)";

        public static final String UPDATE_PROMOTIOn = "UPDATE promotions SET promotion_name = :promotionName, discount = :discount, start_date = :startDate, end_date = :endDate, is_Active = " +
                "CASE WHEN :startDate <= NOW() AND :endDate >= NOW() THEN 1 ELSE 0 END WHERE promotion_id = :promotionId";

        public static final String DELETE_PROMOTION = "DELETE FROM promotions WHERE promotion_id = :promotionId";
    }

    public class PUBLISHER {
        public static final String SELECT_ALL_PUBLISHER = "select * from publishers ";
        public static final String FIND_BY_PUBLISHERID = "select * from publishers where p_id = :id";
        public static final String FIND_BY_PUBLISHERNAME = "select * from publishers where p_name = :name";
        public static final String DELETE = "delete from promotions where promotion_id = :id";
        public static final String INSERT_PUBLISHER = "INSERT INTO publishers (p_name, p_address, p_phone) VALUES (:publisherName, :address, :phone)";
        public static final String UPDATE_PUBLISHER = "UPDATE publishers SET p_name = :publisherName, p_address = :address, p_phone = :phone WHERE p_id = :p_id";
        public static final String DELETE_PUBLISHER = "DELETE FROM publishers WHERE p_id = :p_id";
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

        public static final String BOOK_REVIEW = "select COALESCE(AVG(rating), 0.0) from reviews " +
                "WHERE b_id = :b_id GROUP BY b_id";
    }
}

