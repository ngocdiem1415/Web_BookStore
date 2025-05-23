package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.Invoice;
import vn.edu.hcmuaf.fit.bookstore.beans.Payment;


import vn.edu.hcmuaf.fit.bookstore.dao.InvoiceDao;
import vn.edu.hcmuaf.fit.bookstore.dao.InvoiceDetailDao;
import vn.edu.hcmuaf.fit.bookstore.dao.PaymentDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.time.LocalDateTime;
import java.util.*;

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

    // Tính tổng số tiền thanh toán trong ngày từ bảng payments
    public int getTotalAcountInDay() {
        // Truy vấn tất cả các thanh toán trong ngày hiện tại
        double totalAmount = connect.withExtension(PaymentDao.class, dao -> dao.findPaymentsInDay())
                .stream()
                .mapToDouble(Payment::getAmount)  // Lấy giá trị amount từ đối tượng Payment
                .sum();  // Tính tổng

        return (int) Math.round(totalAmount);  // Làm tròn và ép kiểu về int
    }

    // Tính tổng số tiền thanh toán theo tháng từ bảng payments
    public List<Double> listPaymentInYear(int year) {
        List<Payment> listTotalAccount = connect.withExtension(PaymentDao.class, dao -> dao.listAccountInYear(year));
        Map<Integer, Double> temp = new TreeMap<>(new Comparator<Integer>() {
            @Override
            public int compare(Integer o1, Integer o2) {
                return o1 - o2;
            }
        });
        for (Payment p : listTotalAccount) {
            int month = p.getPaymentDate().getMonthValue();
            if (!temp.containsKey(month)) {
                temp.put(month, p.getAmount());
            }
            temp.put(month, temp.get(month) + p.getAmount());
        }
        for (int i = 1; i <= 12; i++) {
            if (!temp.containsKey(i)) temp.put(i, 0.0);
        }
        System.out.println(temp.toString());
        Collection<Double> values = temp.values();
        return new ArrayList<>(values);
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

    public int updateStatus(int invoiceId, String paymentStatus) {
        try {
            return connect.withExtension(PaymentDao.class, dao -> dao.updateStatus(invoiceId,paymentStatus));
        } catch (RuntimeException e) {
            throw new RuntimeException(e);
        }
    }

    public int updateMethodAndStatus(int invoiceId, String paymentMethod, String paymentStatus) {
        try {
            return connect.withExtension(PaymentDao.class, dao -> dao.updateMethodAndStatus(invoiceId, paymentMethod, paymentStatus));
        } catch (RuntimeException e) {
            throw new RuntimeException(e);
        }
    }
}
