package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

public class StockService {
    private static StockService instance = null;
    Jdbi connect = JDBIConnector.getJdbi();

    public static StockService getInstance() {
        if (instance == null) instance = new StockService();
        return instance;
    }
}
