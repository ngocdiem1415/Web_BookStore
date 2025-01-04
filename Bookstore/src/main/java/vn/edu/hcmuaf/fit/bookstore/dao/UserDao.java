package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

import java.util.List;

@RegisterBeanMapper(User.class)
public interface UserDao {

    @SqlQuery(QUERIES.USER.SELECT_ALL_USER)
    List<User> list();

    @SqlQuery(QUERIES.USER.FIND_BY_ID)
    User findById(@Bind("id") int id);

    @SqlQuery(QUERIES.USER.FIND_BY_USERNAME)
    User findByName(@Bind("username") String username);

    @SqlUpdate(QUERIES.USER.REGISTER)
    void register(@Bind("username") String username, @Bind("gender") String gender, @Bind("dob") String dob, @Bind("phone") String phone, @Bind("email") String email, @Bind("password") String password);

    @SqlQuery(QUERIES.USER.FIND_BY_USERNAME_AND_PASSWORD)
    List<User> findByUserByIdAndPassword(@Bind("username") String username, @Bind("password") String password);

    @SqlQuery(QUERIES.USER.FIND_BY_EMAIL)
    User findByEmail(@Bind("email") String email);

    @SqlUpdate(QUERIES.USER.CHANGE_PASSWORD)
    void updatePassword(@Bind("uid") int uid, @Bind("password") String password);

}