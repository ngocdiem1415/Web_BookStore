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
    List<User> list(@Bind("role") String role);

    @SqlQuery(QUERIES.USER.TOTALUSER)
    int totalUser();

    @SqlQuery(QUERIES.USER.TOTAL_USER_BY_DAY)
    int totalUserByDay();

    @SqlQuery(QUERIES.USER.FIND_BY_ID)
    User findById(@Bind("id") int id);

    @SqlQuery(QUERIES.USER.FIND_BY_USERNAME)
    User findByName(@Bind("username") String username);

    @SqlUpdate(QUERIES.USER.REGISTER)
    void register(@Bind("username") String username, @Bind("gender") String gender, @Bind("dob") String dob, @Bind("phone") String phone, @Bind("email") String email, @Bind("password") String password, @Bind("role") String role);

    @SqlQuery(QUERIES.USER.FIND_BY_USERNAME_AND_PASSWORD)
    List<User> findByUserByIdAndPassword(@Bind("username") String username, @Bind("password") String password);

    @SqlQuery(QUERIES.USER.FIND_BY_EMAIL)
    User findByEmail(@Bind("email") String email);

    @SqlUpdate(QUERIES.USER.CHANGE_PASSWORD)
    void updatePassword(@Bind("uid") int uid, @Bind("password") String password);

    @SqlUpdate(QUERIES.USER.UPDATE_EMAIL_VERIFIED_BYID)
    void updateEmailVerifiedByID(@Bind("uid") int uid);

    @SqlUpdate(QUERIES.USER.UPDATE_USER_ROLE)
    void updateUserRole(@Bind("username") String username, @Bind("gender") String gender, @Bind("dob") String dob, @Bind("phone") String phone, @Bind("email") String email, @Bind("id") int id);

    @SqlUpdate(QUERIES.USER.INSERT_BY_GOOGLE)
    void insertByGoogle(@Bind("username") String username, @Bind("gender") String gender, @Bind("phone") String phone, @Bind("email") String email, @Bind("password") String password, @Bind("role") String role);

    @SqlQuery(QUERIES.USER.FIND_ALL)
    List<User> findAll();

    @SqlUpdate(QUERIES.USER.UPDATE_EMAIL_VERIFIED_BY_EMAIL)
    void updateEmailVerifiedByEmail(@Bind("email") String email);

    @SqlUpdate(QUERIES.USER.UPDATE_IMAGE_BY_ID)
    void updateImageByID(@Bind("username") String username, @Bind("gender") String gender, @Bind("dob") String dob, @Bind("phone") String phone, @Bind("email") String email, @Bind("avatar") String avatar, @Bind("id") int id);

    @SqlUpdate(QUERIES.USER.UPDATE_ROLE)
    void updateRole(@Bind("role") String role, @Bind("uid") int uid);

    @SqlUpdate(QUERIES.USER.CHANGE_STATUS)
    void disabled(@Bind("uid") int uid);

    @SqlQuery(QUERIES.USER.CHECK_PASSWORD)
    Boolean checkPwd(@Bind("uid") int uid, @Bind("password") String password);
}