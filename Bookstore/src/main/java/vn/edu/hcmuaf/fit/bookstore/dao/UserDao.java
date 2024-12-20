package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.sql.Connection;
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
