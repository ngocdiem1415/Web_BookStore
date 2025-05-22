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
    @SqlUpdate("INSERT INTO Stocks (b_id, quantity, stock_date) VALUES (:bId, :quantity, :stock_date)")
    int insertStock(@BindBean Stock stock);

    // Cập nhật số lượng nhập kho theo stock_id
    @SqlUpdate("""
                UPDATE Stocks
                SET quantity = :quantity,
                    stock_date = :create_at
                WHERE b_id = :bId
            """)
    int updateStock(@BindBean Stock stock);


}
