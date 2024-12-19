package vn.edu.hcmuaf.fit.bookstore.dao;

import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.util.Map;

public class UserDao {
    static Map<String, User> data = Map.of("thinh", new User("thinh", "123"));

    public User getUser(String username) {
        if (!data.containsKey(username)) {
            return null;
        }
        return data.get(username);
    }

}
