package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import org.jdbi.v3.core.mapper.reflect.BeanMapper;
import vn.edu.hcmuaf.fit.bookstore.beans.*;
import vn.edu.hcmuaf.fit.bookstore.dao.*;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

public class InvoiceService {
    private static InvoiceService instance = null;
    Jdbi connect = JDBIConnector.getJdbi();

    public static InvoiceService getInstance() {
        if (instance == null) instance = new InvoiceService();
        return instance;
    }

    public List<Invoice> listAll() {
        return connect.withExtension(InvoiceDao.class, InvoiceDao::listAll);
    }

    public Invoice findById(int id) {
        return connect.withExtension(InvoiceDao.class, handle -> mapInvoice(handle.findById(id)));
    }

    public List<Invoice> findByUser(int id) {
        return connect.withExtension(InvoiceDao.class, handle -> handle.findByUser(id).stream()
                .map(this::mapInvoice).collect(Collectors.toList()));
    }

    public List<Invoice> listOrderByDate() {
        return connect.withExtension(InvoiceDao.class, handle -> handle.findByDate().stream()
                .map(this::mapInvoice).collect(Collectors.toList()));
    }

    public List<Invoice> findByBookTitle(int userId, String title) {
        return connect.withExtension(InvoiceDao.class, handle -> handle.findByBookTitle(userId, title).stream()
                .map(this::mapInvoice).collect(Collectors.toList()));
    }

    public List<Invoice> findByStatus(int userId, String status) {
        return connect.withExtension(InvoiceDao.class, handle -> handle.findByStatus(userId, status).stream()
                .map(this::mapInvoice).collect(Collectors.toList()));
    }

    synchronized public int insert(Invoice invoice) {
        try {
            if (invoice == null) {
                throw new IllegalArgumentException("Invoice không được null.");
            }

            return connect.inTransaction(handle -> {
                InvoiceDao invoiceDao = handle.attach(InvoiceDao.class);
                InvoiceDetailDao invoiceDetailDao = handle.attach(InvoiceDetailDao.class);
                PaymentDao paymentDao = handle.attach(PaymentDao.class);
                BookDetailService bookService = new BookDetailService();

                // Thêm hóa đơn
                invoiceDao.insert(invoice);

                // Lấy invoiceId sau khi insert
                int invoiceId = handle.createQuery("SELECT LAST_INSERT_ID()")
                        .mapTo(Integer.class).one();
                invoice.setInvoiceId(invoiceId);

                // Thêm chi tiết hóa đơn
                if (invoice.getListInvoiceDetails() != null) {
                    for (InvoiceDetail detail : invoice.getListInvoiceDetails()) {
                        Book book = bookService.findById(detail.getbId());
                        int remaining = book.getStockQuantity();

                        if (detail.getQuantity() > remaining) {
                            throw new IllegalStateException(
                                    "Sach \"" + book.getTitle() + "\" chi con " + remaining + " cuon, khong the dat " + detail.getQuantity()
                            );
                        }

                        detail.setInvoiceId(invoiceId); // ✅ PHẢI đặt bên ngoài khối if
                        invoiceDetailDao.insert(detail); // ✅ PHẢI đặt bên ngoài khối if
                    }
                }

                // Thêm thông tin thanh toán
                if (invoice.getPayment() != null) {
                    invoice.getPayment().setInvoiceId(invoiceId);
                    paymentDao.insert(invoice.getPayment());
                }

                return invoiceId;
            });
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Lỗi không thêm được hóa đơn (Trong invoiceService): " + e.getMessage(), e);
        }
    }


    synchronized public int cancelInvoice(Invoice invoice) {
        try {
            if (invoice == null) {
                throw new IllegalArgumentException("Invoice không được null.");
            }

            if (!"Pending".equalsIgnoreCase(invoice.getStatus())) {
                throw new IllegalStateException("Chỉ có thể hủy đơn hàng khi trạng thái là Pending.");
            }

            return connect.inTransaction(handle -> {
                // Cập nhật trạng thái hóa đơn
                invoice.setStatus("Cancelled");
                handle.attach(InvoiceDao.class).update(invoice);

                // Hoàn trả số lượng sách trong kho
//                if (invoice.getListInvoiceDetails() != null) {
//                    for (InvoiceDetail detail : invoice.getListInvoiceDetails()) {
//                        Book book = detail.getBook();
//                        if (book != null) {
//                            book.setStockQuantity(book.getStockQuantity() + detail.getQuantity());
//                            book.setSoldQuantity(book.getSoldQuantity() - detail.getQuantity());
//                            handle.attach(BookDao.class).update(book);
//                        }
//                    }
//                }

                return 1; // Thành công
            });
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi hủy hóa đơn: " + e.getMessage(), e);
        }
    }

    public int update(Invoice invoice) {
        try {
            if (invoice == null) {
                throw new IllegalArgumentException("Invoice không được null.");
            }

            return connect.inTransaction(handle -> {
                // Cập nhật thông tin hóa đơn
                handle.attach(InvoiceDao.class).update(invoice);

                // Cập nhật thông tin các chi tiết hóa đơn
                if (invoice.getListInvoiceDetails() != null) {
                    for (InvoiceDetail detail : invoice.getListInvoiceDetails()) {
                        handle.attach(InvoiceDetailDao.class).update(detail);
                    }
                }

                // Cập nhật Payment
                updatePaymentForInvoice(invoice);

                return 1; // Thành công
            });
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException("Lỗi khi cập nhật hóa đơn: " + e.getMessage(), e);
        }
    }


    public void updatePaymentForInvoice(Invoice invoice) {
        PaymentService paymentService = PaymentService.getInstance();
        // Tính tổng tiền hàng từ InvoiceDetail
        double totalAmount = connect.withExtension(InvoiceDetailDao.class, dao -> dao.findByInvoiceId(invoice.getInvoiceId()))
                .stream()
                .mapToDouble(detail -> detail.getUnitPrice() * detail.getQuantity())
                .sum();

        // Tính tổng tiền thanh toán (bao gồm phí vận chuyển)
        double amount = totalAmount + invoice.getShippingFee();

        // Tìm Payment hiện có
        Payment existingPayment = connect.withExtension(PaymentDao.class, dao -> dao.findByInvoiceId(invoice.getInvoiceId()));

        if (existingPayment != null) {
            // Nếu Payment đã tồn tại, cập nhật thông tin
            existingPayment.setAmount(amount);
            existingPayment.setPaymentDate(LocalDateTime.now());
            paymentService.update(existingPayment);
        } else {
            // Nếu Payment chưa tồn tại, tạo mới
            paymentService.createPayment(invoice.getInvoiceId(), 1, "Pending"); // Cài đặt phương thức và trạng thái mặc định
        }
    }

    private Book mapImage(Book book) {
        if (book == null) {
            System.out.println("Warning: Attempted to map image for a null book.");
            return null;
        }
        System.out.println("Mapping image for BookId: " + book.getbId());
        Image image = connect.withExtension(ImageBookDao.class, handle -> handle.findImageThumbnailByBookId(book.getbId()));
        if (image == null) {
            System.out.println("Warning: No thumbnail image found for bookId: " + book.getbId());
        }
        book.setImage(image); // Gán Image vào Book
        return book;
    }

    private InvoiceDetail mapInvoiceDetail(InvoiceDetail invoiceDetail) {
        if (invoiceDetail == null) {
            System.out.println("Warning: Attempted to map book for a null InvoiceDetail.");
            return null;
        }
        System.out.println("Fetching book with bookId: " + invoiceDetail.getbId());
        Book book = connect.withExtension(BookDao.class, handle -> handle.findById(invoiceDetail.getbId()));
        if (book == null) {
            System.out.println("Error: Book not found for bookId invoicedetail: " + invoiceDetail.getbId());
        } else {
            book = mapImage(book); // Map image vào Book
        }

        invoiceDetail.setBook(book);
        return invoiceDetail;
    }

    private Invoice mapInvoice(Invoice invoice) {
        if (invoice == null) {
            System.out.println("Warning: Attempted to map invoice details and payment for a null Invoice.");
            return null;
        }
        System.out.println("Fetching invoice with invoiceId: " + invoice.getInvoiceId());
        List<InvoiceDetail> invoiceDetails = connect.withExtension(InvoiceDetailDao.class,
                handle -> handle.findByInvoiceId(invoice.getInvoiceId()).stream()
                        .map(this::mapInvoiceDetail).collect(Collectors.toList()));
        if (invoiceDetails.isEmpty()) {
            System.out.println("Warning: No InvoiceDetails found for invoiceId: " + invoice.getInvoiceId());
        }
        invoice.setListInvoiceDetails(invoiceDetails);

        Payment payment = connect.withExtension(PaymentDao.class, handle -> handle.findByInvoiceId(invoice.getInvoiceId()));
        if (payment == null) {
            System.out.println("Warning: Payment not found for invoiceId: " + invoice.getInvoiceId());
        }
        invoice.setPayment(payment);
        return invoice;
    }

}

    
