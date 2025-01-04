package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import vn.edu.hcmuaf.fit.bookstore.beans.VerifyEmail;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

import java.util.Date;
import java.util.List;


@RegisterBeanMapper(VerifyEmail.class)
public interface VerifyEmailDao {

    @SqlQuery(QUERIES.VERIFY_EMAIL.INSERT_VERIFY_EMAIL)
    void insertVerifyEmail(@Bind("id") int id, @Bind("email") String email, @Bind("token") String token, @Bind("createdAt") Date createdAt, @Bind("expiresAt") Date expiresAt);

    @SqlQuery(QUERIES.VERIFY_EMAIL.SELECT_VERIFY_EMAIL_BY_CODE)
    List<VerifyEmail> selectVerifyEmailByCode(@Bind("token") String token);
}
