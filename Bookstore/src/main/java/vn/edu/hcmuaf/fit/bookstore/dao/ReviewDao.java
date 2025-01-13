package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.beans.Review;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

import java.util.List;

@RegisterBeanMapper(Review.class)
public interface ReviewDao {

    @SqlQuery(QUERIES.REVIEW.FIND_BY_REVIEWID)
    Review findByReviewId(@Bind("bookId") int bookId);

    @SqlQuery(QUERIES.REVIEW.SELECT_ALL_REVIEW)
    List<Review> listReview(@Bind("bookId") int bookId);

}
