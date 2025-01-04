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


    // Dang ki
    public int register(String username, String gender, String dob, String phone, String email, String password) {
        return conn.withExtension(UserDao.class, handle -> {
            User user = null;
            if (handle.findByName(username) != null) {
                return 1;
            }
            if (handle.findByEmail(email) != null) {
                return 2;
            }
            String hashedPassword = hashPassword(password);
            handle.register(username, gender, dob, phone, email, hashedPassword);
            return 0;
        });
    }

    // Tim kiem nguoi dung theo ten
    public User findByUserName(String username) {
        return conn.withExtension(UserDao.class, handle -> {
            User user = handle.findByName(username);
            if (user == null) return null;
            return user;
        });
    }

    // Tim kiem nguoi dung theo email
    public User findByEmail(String email) {
        return conn.withExtension(UserDao.class, handle -> {
            User user = handle.findByEmail(email);
            if (user == null) return null;
            return user;

        });
    }

    // Tim kiem nguoi dung theo ten va mat khau
    public User findByUsernameAndPassword(String username, String hashedPassword) {
        return conn.withExtension(UserDao.class, handle -> {
            String originPass = hashPassword(hashedPassword);
            List<User> users = handle.findByUserByIdAndPassword(username, originPass);
            if (users.size() != 1)
                return null;
            return users.get(0);
        });
    }

    public void updatePassword(int uid, String password) {
        conn.useExtension(UserDao.class, handle -> {
            handle.updatePassword(uid, hashPassword(password));
        });
    }


    // ma hoa mat khau
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

    // Giai ma mat khau
    public String decodePassword(String password) {
        return password;
    }


    public static void main(String[] args) {
        UserServices userServices = new UserServices();
        System.out.println(userServices.hashPassword("123"));
    }


}
