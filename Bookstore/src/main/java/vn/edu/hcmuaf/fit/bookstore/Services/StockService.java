package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.Stock;
import vn.edu.hcmuaf.fit.bookstore.dao.StockDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.util.List;

public class StockService {
    private static StockService instance = null;
    Jdbi connect = JDBIConnector.getJdbi();

    public static StockService getInstance() {
        if (instance == null) instance = new StockService();
        return instance;
    }

    public List<Stock> getAllStockEntries() {
        return connect.withExtension(StockDao.class, StockDao::listAll);
    }

    public List<Stock> getStockEntriesByBookId(int bId) {
        return connect.withExtension(StockDao.class, dao -> dao.findByBookId(bId));
    }

    public int insertStock(Stock stock) {
        return connect.withExtension(StockDao.class, dao -> dao.insertStock(stock));
    }

    public void updateStock(Stock stock) {
        connect.useExtension(StockDao.class, dao -> dao.updateStock(stock));
    }

    public List<Stock> getAllBookStocks() {
        return connect.withExtension(StockDao.class, StockDao::getAllBookStocks);
    }

    public Stock getBookStockById(int bId) {
        return connect.withExtension(StockDao.class, dao -> dao.getBookStockById(bId));
    }
}
