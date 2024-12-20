package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.util.List;

@RegisterBeanMapper(User.class)
public interface UserDao {

    @SqlQuery("select * from users")
    List<User> list();

    @SqlQuery("select * from users where uid = :id")
    User findById(@Bind("id") int id);


}
