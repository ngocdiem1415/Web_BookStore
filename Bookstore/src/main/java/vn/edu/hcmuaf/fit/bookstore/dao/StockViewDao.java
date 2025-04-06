package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import vn.edu.hcmuaf.fit.bookstore.beans.Stock.StockView;

import java.util.List;

@RegisterBeanMapper(StockView.class)
public interface StockViewDao {

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
    List<StockView> getAllBookStocks();

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
    StockView getBookStockById(@Bind("id") int id);
}
