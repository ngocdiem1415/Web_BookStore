package vn.edu.hcmuaf.fit.bookstore.db;

public class QUERIES {
    public class BOOK{
        public static final String SELECT_ALL_BOOK =  "select * from books";
        public static final String SELECT_ALL_BOOK_LIMIT =  "select * from books limit = :limit";
        public static final String FIND_BY_BID =  "select * from books where b_id = :id";
        public static final String FIND_BY_CATEGORYID =  "select * from books where b_id = :id";
        public static final String FIND_BY_BOOKNAME =  "select * from books where b_id = :id";
        public static final String UPDATE = "UPDATE books SET title = :title, author = :author, category_id = :categoryId, p_id = :pId, publish_year = :publishYear, weight = :weight, page_count = :pageCount, original_price = :originalPrice, description = :description, promotion_id = :promotionId, sold_quantity = :soldQuantity, stock_quantity = :stockQuantity, create_at = :createAt, update_at = CURRENT_TIMESTAMP WHERE b_id = :bookId";
        public static final String DELETE =  "delete from books where b_id = :id";

    }

    public class CATEGORY{
        public static final String SELECT_ALL_CATEGORY =  "select * from categories";
        public static final String FIND_BY_CATEGORYID =  "select * from categories where category_id = :id";
        public static final String UPDATE = "UPDATE books SET  category_name = :categoryName,update_at = CURRENT_TIMESTAMP WHERE category_id = :Id";
        public static final String DELETE =  "delete from categories where category_id = :id";

    }

    public class IMAGE{
        public static final String SELECT_ALL_IMAGE_THUMBNAIL =  "select * from images where is_thumbnail = 1";
        public static final String SELECT_ALL_IMAGE_THUMBNAIL_LIMIT =  "select * from images where is_thumbnail = 1  limit = :limit";
        public static final String FIND_IMAGE_THUMBNAIL_BY_ID = "select * from images where b_id = :id and is_thumbnail = 1";
        public static final String DELETE =  "delete from images where b_id = :id";

    }

    public class PROMOTION{
        public static final String SELECT_ALL_PROMOTION =  "select * from promotions";
        public static final String FIND_BY_PROMOTIONID = "select * from promotions where promotion_id = :id";
        public static final String DELETE =  "delete from promotions where promotion_id = :id";

    }

    public class PUBLISHER{
        public static final String SELECT_ALL_PUBLISHER =  "select * from publishers";
        public static final String FIND_BY_PUBLISHERID = "select * from publishers where p_id = :id";
        public static final String DELETE =  "delete from promotions where promotion_id = :id";

    }

    public class USER{
        public static final String SELECT_ALL_USER =  "select * from users";
        public static final String FIND_BY_USERNAME_AND_PASSWORD = "select * from users where username = :id and password = :pd";

    }



}
