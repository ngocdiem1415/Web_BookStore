package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.InvoiceDetail;

import java.util.List;

@RegisterBeanMapper(InvoiceDetail.class)
public interface InvoiceDetailDao {

    //Lấy danh sách chi tiết đơn hàng theo invoiceId
    @SqlQuery("SELECT * FROM invoice_details WHERE invoice_id = :invoiceId")
    List<InvoiceDetail> findByInvoiceId(@Bind("invoiceId") int invoiceId);

    //Thêm chi tiết đơn hàng
    @SqlUpdate(" INSERT INTO invoice_details ( invoice_id, b_id, quantity, unit_price) " +
            "VALUES ( :invoiceId, :bookId, :quantity, :unitPrice) ")
    int insert(@BindBean InvoiceDetail invoiceDetail);

    //Cập nhật chi tiết đơn hàng
    @SqlUpdate(" UPDATE invoice_details SET quantity = :quantity, unit_price = :unitPrice " +
            "WHERE invoice_id = :invoiceId AND b_id = :bookId ")
    int update(@BindBean InvoiceDetail invoiceDetail);
}
