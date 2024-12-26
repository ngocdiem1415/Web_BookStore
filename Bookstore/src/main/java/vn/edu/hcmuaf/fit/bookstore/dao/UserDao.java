package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

import java.util.List;

@RegisterBeanMapper(User.class)
public interface UserDao {

    @SqlQuery(QUERIES.USER.SELECT_ALL_USER)
    List<User> list();

    @SqlQuery(QUERIES.USER.FIND_BY_USERNAME_AND_PASSWORD)
    User findById(@Bind("id") int id);


}
