package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import vn.edu.hcmuaf.fit.bookstore.beans.Order;

import java.util.List;

@RegisterBeanMapper(Order.class)
public interface OrderDAO {

    //Lấy tất cả các đơn hàng (admin)
    @SqlQuery("select  from orders")
    List<Order> list();
}
