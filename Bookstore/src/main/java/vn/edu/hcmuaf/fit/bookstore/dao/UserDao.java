package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.core.statement.Update;
import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.util.List;

@RegisterBeanMapper(User.class)
public interface UserDao {

    @SqlQuery("select * from users")
    List<User> list();

    @SqlQuery("select * from users where uid = :id")
    User findById(@Bind("id") int id);

    @SqlQuery("select * from users where username = :username")
    User findByName(@Bind("username") String username);

    @SqlUpdate("insert into `users` (`uid` ,`username` ,`avatar` ,`gender` ,`dob` ,`phone` ,`email` ,`password`, `status`, now(), now()) values (:uid, :username, :avatar, :gender, :dob, :phone, :email, :password, :status, :admin, now(), now())")
    int signUp(@Bind User user);

    @SqlQuery("select * from users where username = :username and password = :password")
    User loginUser(@Bind("username") String username, @Bind("password") String password);

    @SqlQuery("select * from users where username = :username and password = :password and role = 'admin'")
    User loginAdmin(@Bind("username") String username, @Bind("password") String password);

    @SqlQuery("select * from users where username = :username and password = :password")
    List<User> findByUserByIdAndPassword(@Bind("username") String username, @Bind("password")String password);


}
