package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.dao.UserDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

public class UserServices {

    Jdbi conn = JDBIConnector.getJdbi();


    public int signUp(User user) {
        return conn.withExtension(UserDao.class, handle -> handle.signUp(user));
    }

    public User findByUsernameAndPassword(String username, String password) {
        return conn.withExtension(UserDao.class, handle -> {
            //String hashedPassword = hashPassword(password);
            List<User> users = handle.findByUserByIdAndPassword(username, password);
            if (users.size() != 1)
                return null;
            return users.get(0);
        });
    }

    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(password.getBytes());
            byte[] bytes = md.digest();

            StringBuilder sb = new StringBuilder();
            for (byte aByte : bytes) {
                sb.append(Integer.toString((aByte & 0xff) + 0x100, 16).substring(1));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
        UserServices userServices = new UserServices();
        System.out.println(userServices.hashPassword("123"));
    }


}
