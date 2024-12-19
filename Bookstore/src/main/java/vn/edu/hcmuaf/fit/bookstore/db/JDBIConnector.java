package vn.edu.hcmuaf.fit.bookstore.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.sql.SQLException;
import java.util.List;

public class JDBIConnector {
    public static Jdbi jdbi;
    public static Jdbi getJdbi(){
        if(jdbi == null){
            connect();
        }
        return jdbi;
    }

    public static void connect() {
        MysqlDataSource dataSource = new MysqlDataSource();
        dataSource.setURL("jdbc:mysql://" + DbProperties.getDbHost() + ":" + DbProperties.getDbPort() + "/" + DbProperties.getDbName());
        dataSource.setUser(DbProperties.getUsername());
        dataSource.setPassword(DbProperties.getPassword());

        try {
            dataSource.setUseCompression(true);
            dataSource.setAutoReconnect(true);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        jdbi = Jdbi.create(dataSource);
    }

    public static void main(String[] args) {
        List<User> users = JDBIConnector.getJdbi().withHandle(handle -> {
            return handle.createQuery("SELECT * from users").mapToBean(User.class).list();
        });
        System.out.println(users);
    }
}
