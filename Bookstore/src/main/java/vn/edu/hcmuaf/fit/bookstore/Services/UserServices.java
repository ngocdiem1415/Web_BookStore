package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.Role;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.dao.RoleDao;
import vn.edu.hcmuaf.fit.bookstore.dao.UserDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

public class UserServices {
    private static UserServices instance = null;
    Jdbi conn = JDBIConnector.getJdbi();

    public static UserServices getInstance() {
        if (instance == null) instance = new UserServices();
        return instance;
    }

    public int getTotalUser() {
        return conn.withExtension(UserDao.class, dao -> dao.totaluser());
    }

    // Dang ki
    public int register(String username, String gender, String dob, String phone, String email, String password) {
        return conn.withExtension(UserDao.class, handle -> {
            if (handle.findByName(username) != null) {
                return 1;
            }
            if (handle.findByEmail(email) != null) {
                return 2;
            }
            String hashedPassword = hashPassword(password);
            handle.register(username, gender, dob, phone, email, hashedPassword);

            User user = handle.findByName(username);
            int uid = user.getUid();
            conn.withExtension(RoleDao.class, roleDao -> {
                roleDao.insertRole(uid, 2, 1);
                roleDao.insertRole(uid, 3, 1);
                roleDao.insertRole(uid, 1, 0);
                roleDao.insertRole(uid, 4, 0);
                roleDao.insertRole(uid, 5, 0);
                roleDao.insertRole(uid, 6, 0);
                roleDao.insertRole(uid, 7, 0);
                return null;
            });
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
            if (users.size() != 1) return null;
            return users.get(0);
        });
    }

    public void updateEmailVerifiedByID(int id) {
        conn.useExtension(UserDao.class, handle -> {
            handle.updateEmailVerifiedByID(id);
        });
    }

    public void updatePassword(int uid, String password) {
        try {
            conn.useExtension(UserDao.class, handle -> {
                handle.updatePassword(uid, hashPassword(password));
            });
        } catch (RuntimeException e) {
            e.printStackTrace();
        }
    }

    public User findById(int id) {
        return conn.withExtension(UserDao.class, handle -> handle.findById(id));
    }


    // ma hoa mat khau
    public String hashPassword(String password) {
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

    public List<User> list(int permission, int resource_id) {
        List<User> users = conn.withExtension(UserDao.class, handle -> handle.list(permission, resource_id));
        System.out.println("UserServices: Đã lấy " + users.size() + " người dùng với permission=" + permission);
        return users;
    }


    public void updateUserRole(String username, String gender, String dob, String phone, String email, int id) {
        try {
            conn.useExtension(UserDao.class, handle -> {
                handle.updateUserRole(username, gender, dob, phone, email, id);
            });
        } catch (RuntimeException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public void changePassword(int uid, String password) {
        try {
            conn.useExtension(UserDao.class, handle -> {
                handle.updatePassword(uid, hashPassword(password));
            });
        } catch (RuntimeException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public void insertByGoogle(User user) {
        try {
            conn.useExtension(UserDao.class, handle -> {
                handle.insertByGoogle(user.getUsername(), user.getGender(), user.getPhone(), user.getEmail(), user.getPassword());
            });
        } catch (RuntimeException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public boolean exists(User user) {
        List<User> users = conn.withExtension(UserDao.class, handle -> handle.findAll());
        for (User u : users) {
            if (u.getUsername().equals(user.getUsername())) {
                return true;
            }
        }
        return false;
    }

    public void updateEmailVerifiedByEmail(String email) {
        try {
            conn.useExtension(UserDao.class, handle -> {
                handle.updateEmailVerifiedByEmail(email);
            });
        } catch (RuntimeException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public void updateImageByID(String username, String gender, String dob, String phone, String email, String avatar, int id) {
        try {
            conn.useExtension(UserDao.class, handle -> {
                handle.updateImageByID(username, gender, dob, phone, email, avatar, id);
            });
        } catch (RuntimeException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

//    public void updateRole(int permission, int uid) {
//        try {
//            conn.useExtension(UserDao.class, handle -> {
//                handle.updateRole(role, uid);
//            });
//        } catch (RuntimeException e) {
//            e.printStackTrace();
//            throw new RuntimeException(e);
//        }
//    }
//
    public void disabled(int id) {
        try {
            conn.useExtension(UserDao.class, handle -> {
                handle.disabled(id);
            });
        } catch (RuntimeException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public boolean checkPassword(int uid, String password) {
        return conn.withExtension(UserDao.class, handle -> handle.checkPwd(uid,password));
    }
}
