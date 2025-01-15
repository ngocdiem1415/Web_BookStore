package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.Payment;

@RegisterBeanMapper(Payment.class)
public interface PaymentDao {

    // Tìm payment thông qua invoiceId
    @SqlQuery("SELECT * FROM payments WHERE invoice_id = :invoiceId")
    Payment findByInvoiceId(@Bind("invoiceId") int invoiceId);

    // Thêm payment
    @SqlUpdate("INSERT INTO payments (invoice_id, amount, payment_date, payment_method, payment_status) " +
            "VALUES (:invoiceId, :amount, :paymentDate, :paymentMethod, :paymentStatus)")
    int insert(@BindBean Payment payment);

    // Cập nhật payment
    @SqlUpdate("UPDATE payments SET amount = :amount, payment_date = :paymentDate, " +
            "payment_method = :paymentMethod, payment_status = :paymentStatus " +
            "WHERE invoice_id = :invoiceId")
    int update(@BindBean Payment payment);
}
