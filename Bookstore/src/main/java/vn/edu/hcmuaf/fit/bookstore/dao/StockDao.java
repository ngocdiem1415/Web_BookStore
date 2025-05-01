package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.Stock;

import java.util.List;

@RegisterBeanMapper(Stock.class)
public interface StockDao {

    //Lấy tất cả các lần nhập kho
    @SqlQuery("select * from Stocks order by stock_date desc")
    List<Stock> listAll();

    //Tìm các lần nhập kho theo id của sách
    @SqlQuery("select * from Stocks where b_id = :bId order by stock_date desc")
    List<Stock> findByBookId(@Bind("bId") int bId);

    // Thêm bản ghi nhập kho mới
    @SqlUpdate("INSERT INTO Stocks (b_id, quantity, stock_date) VALUES (:bId, :quantity, :create_at)")
    int insertStock(@BindBean Stock stock);

    // Cập nhật số lượng nhập kho theo stock_id
    @SqlUpdate("""
        UPDATE Stocks
        SET quantity = :quantity,
            stock_date = :create_at
        WHERE stock_id = :stockId
    """)
    void updateStock(@BindBean Stock stock);

    //Hiển thị số lượng tồn kho của sách
    @SqlQuery("""
        SELECT 
            b.b_id,
            b.title,
            IFNULL(s.total_imported, 0) AS total_imported,
            IFNULL(idet.total_sold, 0) AS total_sold,
            (IFNULL(s.total_imported, 0) - IFNULL(idet.total_sold, 0)) AS stock_remaining
        FROM books b
        LEFT JOIN (
            SELECT b_id, SUM(quantity) AS total_imported
            FROM Stocks
            GROUP BY b_id
        ) s ON b.b_id = s.b_id
        LEFT JOIN (
            SELECT b_id, SUM(quantity) AS total_sold
            FROM invoice_details
            GROUP BY b_id
        ) idet ON b.b_id = idet.b_id
    """)
    List<Stock> getAllBookStocks();

    //tìm và hiển thị số lượng tồn kho của loại sách cố định
    @SqlQuery("""
        SELECT 
            b.b_id,
            b.title,
            IFNULL(s.total_imported, 0) AS total_imported,
            IFNULL(idet.total_sold, 0) AS total_sold,
            (IFNULL(s.total_imported, 0) - IFNULL(idet.total_sold, 0)) AS stock_remaining
        FROM books b
        LEFT JOIN (
            SELECT b_id, SUM(quantity) AS total_imported
            FROM Stocks
            GROUP BY b_id
        ) s ON b.b_id = s.b_id
        LEFT JOIN (
            SELECT b_id, SUM(quantity) AS total_sold
            FROM invoice_details
            GROUP BY b_id
        ) idet ON b.b_id = idet.b_id
            WHERE b_id = :id
    """)
    Stock getBookStockById(@Bind("id") int id);
}
