package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.Invoice;
import vn.edu.hcmuaf.fit.bookstore.beans.Payment;


import vn.edu.hcmuaf.fit.bookstore.dao.InvoiceDao;
import vn.edu.hcmuaf.fit.bookstore.dao.InvoiceDetailDao;
import vn.edu.hcmuaf.fit.bookstore.dao.PaymentDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.time.LocalDateTime;

public class PaymentService {
    private static PaymentService instance = null;
    Jdbi connect = JDBIConnector.getJdbi();
    public static PaymentService getInstance() {
        if (instance == null) instance = new PaymentService();
        return instance;
    }

    // Tính tổng số tiền hàng từ InvoiceDetail
    private double calculateTotalAmount(int invoiceId) {
        return connect.withExtension(InvoiceDetailDao.class, dao -> dao.findByInvoiceId(invoiceId))
                .stream()
                .mapToDouble(detail -> detail.getUnitPrice() * detail.getQuantity()).sum();
    }

    // Thêm Payment với tính toán amount
    public int createPayment(int invoiceId, int paymentMethod, String paymentStatus) {
        // Lấy thông tin Invoice
        Invoice invoice = connect.withExtension(InvoiceDao.class, dao -> dao.findById(invoiceId));
        if (invoice == null) {
            throw new IllegalArgumentException("Invoice not found with id: " + invoiceId);
        }

        // Tính tổng tiền hàng
        double totalAmount = calculateTotalAmount(invoiceId);

        // Tính amount (shippingFee + totalAmount)
        double amount = invoice.getShippingFee() + totalAmount;
        // Tạo Payment
        Payment payment = new Payment();
        payment.setInvoiceId(invoiceId);
        payment.setAmount(amount);
        payment.setPaymentDate(LocalDateTime.now());
        payment.setPaymentMethod(paymentMethod);
        payment.setPaymentStatus(paymentStatus);

        return connect.withExtension(PaymentDao.class, dao -> dao.insert(payment));
    }

    public int update(Payment payment) {
        if (payment == null) {
            throw new IllegalArgumentException("Payment cannot be null.");
        }
        return connect.withExtension(PaymentDao.class, dao -> dao.update(payment));
    }
}
