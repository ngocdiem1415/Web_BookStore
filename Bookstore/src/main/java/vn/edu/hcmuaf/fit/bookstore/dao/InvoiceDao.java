package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.Invoice;

import java.util.List;

@RegisterBeanMapper(Invoice.class)
public interface InvoiceDao {

    //Lấy tất cả các đơn hàng (admin)
    @SqlQuery("select * from invoices order by order_date desc")
    List<Invoice> listAll();

    //Lấy tất cả các đơn hàng của 1 user // Tìm đơn hàng theo user
    @SqlQuery("select * from invoices where uid = :id order by order_date desc")
    List<Invoice> findByUser(@Bind("id") int id);

    //Lấy đơn hàng theo ID
    @SqlQuery("select * from invoices where invoice_id = :id")
    Invoice findById(@Bind("id") int id);

    //Tìm đơn hàng theo tên sách đã mua
    @SqlQuery("select * from invoices i where i.invoice_id in " +
            "(select id.invoice_id from invoice_details id join books b on id.b_id = b.b_id" +
            " where b.title LIKE Concat('%', :title, '%'))" +
            " AND i.uid = :id")
    List<Invoice> findByBookTitle(@Bind("id") int id, @Bind("title") String title);

    //Tìm đơn hàng theo status
    @SqlQuery("select * from invoices where uid = :id and status = :status order by order_date desc")
    List<Invoice> findByStatus(@Bind("id") int id, @Bind("status") String status);

    //Tìm đơn hàng theo date
    @SqlQuery("select * from invoices WHERE DATE(order_date) = CURDATE()")
    List<Invoice> findByDate();

    @SqlQuery("SELECT * FROM invoices WHERE YEAR(order_date) = :year ")
    List<Invoice> findInvoicesInMonth(@Bind("year") int year);

    @SqlQuery("select distinct YEAR(order_date) from invoices")
    List<Integer> getListYear();

    //Thêm đơn hàng
    @SqlUpdate(" INSERT INTO invoices ( uid, recipient_name, recipient_phone, address, order_date, status, shipping_fee, completion_date) " +
            "VALUES ( :uid, :recipientName, :recipientPhone, :address, :orderDate, :status, :shippingFee, :completionDate)")
    int insert(@BindBean Invoice invoice); //Trả về id của đơn hàng

    //Cập nhật đơn hàng
    @SqlUpdate(" UPDATE invoices SET recipient_name = :recipientName, " +
            "recipient_phone = :recipientPhone, address = :address, order_date = :orderDate, " +
            "status = :status, shipping_fee = :shippingFee, completion_date = :completionDate " +
            "WHERE invoice_id = :invoiceId ")
    int update(@BindBean Invoice invoice); //Trả về trạng thái có update được hay không

}
