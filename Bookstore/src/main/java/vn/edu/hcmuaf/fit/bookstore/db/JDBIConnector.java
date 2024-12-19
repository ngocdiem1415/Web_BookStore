package vn.edu.hcmuaf.fit.bookstore.db;

import com.mysql.cj.jdbc.MysqlDataSource;
import org.jdbi.v3.core.Jdbi;

public class JDBIConnector {
    public Jdbi jdbi;

    public static void connect(){
        MysqlDataSource dataSource = new MysqlDataSource();
    }
}
