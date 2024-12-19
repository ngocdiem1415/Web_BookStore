package vn.edu.hcmuaf.fit.bookstore.Services;

import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.dao.UserDao;

public class UserServices {
    public boolean login(String username, String password) {
        UserDao userDao = new UserDao();
        User loginUser = userDao.getUser(username);
        if (loginUser == null) return false;
        if (loginUser.getPassword().equals(password)) return true;
        return false;
    }
}
