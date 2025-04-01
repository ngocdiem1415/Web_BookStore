package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.VerifyEmail;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;


@RegisterBeanMapper(VerifyEmail.class)
public interface VerifyEmailDao {

    @SqlUpdate(QUERIES.VERIFY_EMAIL.INSERT_VERIFY_EMAIL)
    void insertVerifyEmail(@Bind("email") String email, @Bind("token") String token, @Bind("createdAt") Timestamp createdAt, @Bind("expiresAt") Timestamp expiresAt);

    @SqlQuery(QUERIES.VERIFY_EMAIL.SELECT_VERIFY_EMAIL_BY_CODE)
    List<VerifyEmail> selectVerifyEmailByCode(@Bind("token") String token);

    @SqlUpdate(QUERIES.VERIFY_EMAIL.DELETE_VERIFY_BY_USER_ID)
    void deleteVerifyEmailByUserId(@Bind("uid") int uid);

    @SqlUpdate(QUERIES.VERIFY_EMAIL.DELETE)
    void delete(@Bind("id") int id);

}
