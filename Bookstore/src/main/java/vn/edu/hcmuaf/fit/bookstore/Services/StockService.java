package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.beans.Stock;
import vn.edu.hcmuaf.fit.bookstore.dao.BookDao;
import vn.edu.hcmuaf.fit.bookstore.dao.StockDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

public class StockService {
    private static StockService instance = null;
    Jdbi connect = JDBIConnector.getJdbi();

    public static StockService getInstance() {
        if (instance == null) instance = new StockService();
        return instance;
    }

    public List<Stock> getAllStockEntries() {
        List<Stock> listStock = connect.withExtension(StockDao.class, StockDao::listAll);
        return listStock.stream().map(stock -> mapOtherBean(stock)).collect(Collectors.toList());
    }

    public List<Stock> getStockEntriesByBookId(int bId) {
        List<Stock> listStock = connect.withExtension(StockDao.class, dao -> dao.findByBookId(bId));
        return listStock.stream().map(stock -> mapOtherBean(stock)).collect(Collectors.toList());
    }

    public int insertStock(Stock stock) {
        return connect.withExtension(StockDao.class, dao -> dao.insertStock(stock));
    }

    public void updateStock(Stock stock) {
        connect.useExtension(StockDao.class, dao -> dao.updateStock(stock));
    }

    private Stock mapOtherBean(Stock stock) {
        if (stock == null) {
            System.out.println("Stock is null");
            return new Stock();
        }
        if (stock.getbId() == 0 ) {
            System.out.println("Stock has no book ID");
            return stock;
        }
        Book book = connect.withExtension(BookDao.class, dao -> dao.findById(stock.getbId()));
        stock.setBook(book);
        return stock;
    }
}
