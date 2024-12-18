package vn.edu.hcmuaf.fit.bookstore.db;

public class JDBIConnector {
    public Jdbi jdbi;

    public static void connect(){
        MysqlDataSource dataSource = new MysqlDataSource();
    }
}
