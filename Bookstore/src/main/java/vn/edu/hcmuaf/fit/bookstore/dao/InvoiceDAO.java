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
    @SqlQuery("select * from invoices order by i.order_date desc")
    List<Invoice> listAll();

    //Lấy tất cả các đơn hàng của 1 user // Tìm đơn hàng theo user
    @SqlQuery("select * from invoices where i.uid = :id order by i.order_date desc")
    List<Invoice> findByUser(@Bind("id") int id);

    //Lấy đơn hàng theo ID
    @SqlQuery("select * from invoices where i.invoice_id = :id")
    Invoice findById(@Bind("id") int id);

    //Tìm đơn hàng theo tên sách đã mua
    @SqlQuery("select * from invoices i where i.invoice_id in " +
            "(select id.invoice_id from invoice_details id join books b on id.b_id = b.b_id" +
            " where b.title LIKE Concat('%', :title, '%'))" +
            " AND i.uid = :id")
    List<Invoice> findByBookTitle(@Bind("title") String title, @Bind("id") int id);

    //Thêm đơn hàng
    @SqlUpdate(" INSERT INTO invoices ( uid, recipient_name, recipient_phone, address, order_date, status, shipping_fee, completion_date) " +
            "VALUES ( :uid, :recipientName, :recipientPhone, :address, :orderDate, :status, :shippingFee, :completionDate)")
    void insert(@BindBean Invoice invoice);

    //Cập nhật đơn hàng
    @SqlUpdate(" UPDATE invoices SET recipient_name = :recipientName, " +
            "recipient_phone = :recipientPhone, address = :address, order_date = :orderDate, " +
            "status = :status, shipping_fee = :shippingFee, completion_date = :completionDate " +
            "WHERE invoice_id = :invoiceId ")
    void update(@BindBean Invoice invoice);

    //Hủy đơn hàng
    @SqlUpdate("update invoices set status = 'Cancelled' where invoice_id = :id")
    void cancelInvoice(@Bind("id") int id);
}
