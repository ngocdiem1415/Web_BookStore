package vn.edu.hcmuaf.fit.bookstore.db;

public class QUERIES {
    public class USER {
        public static final String SELECT_ALL_USER = "select * from users";
        public static final String FIND_BY_USERNAME_AND_PASSWORD = "select * from users where username = :username and password = :password";
        public static final String FIND_BY_ID = "select * from users where uid = :id";
        public static final String FIND_BY_USERNAME = "select * from users where username = :username";
        public static final String REGISTER = "insert into users (username, gender, dob, phone, email, password, status, role) values (:username, :gender, :dob, :phone, :email, :password, 1 , 'user')";
        public static final String FIND_BY_EMAIL = "select * from users where email = :email";
        public static final String CHANGE_PASSWORD = "update users set password = :password where uid = :uid";
//        public static final String updateVerifiedById = "update users set password_reset_token.token = 1 join password_reset_token on users.uid = password_reset_token.id where users.uid = :uid";
    }


    public class VERIFY_EMAIL {
        public static final String INSERT_VERIFY_EMAIL = "insert into reset_password_token (id ,email, token, created_at, expires_at) values (:id ,:email, :token, :createdAt, :expiresAt)";
        public static final String SELECT_VERIFY_EMAIL_BY_CODE = "select * from reset_password_token where token = :token";

    }
}
