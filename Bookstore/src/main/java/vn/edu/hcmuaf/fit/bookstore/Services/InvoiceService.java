package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import sun.misc.Signal;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.beans.Invoice;
import vn.edu.hcmuaf.fit.bookstore.beans.InvoiceDetail;
import vn.edu.hcmuaf.fit.bookstore.dao.BookDao;
import vn.edu.hcmuaf.fit.bookstore.dao.InvoiceDao;
import vn.edu.hcmuaf.fit.bookstore.dao.InvoiceDetailDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

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

    public List<Invoice> findByBookTitle(String title, int userId) {
        return connect.withExtension(InvoiceDao.class, handle -> handle.findByBookTitle(title, userId).stream()
                .map(this::mapInvoice).collect(Collectors.toList()));
    }

    private InvoiceDetail mapInvoiceDetail(InvoiceDetail invoiceDetail){
        Book book = connect.withExtension(BookDao.class, handle -> handle.findById(invoiceDetail.getBookId()));
        invoiceDetail.setBook(book);
        return invoiceDetail;
    }

    private Invoice mapInvoice(Invoice invoice){
        List<InvoiceDetail> invoiceDetails = connect.withExtension(InvoiceDetailDao.class,
                handle -> handle.findByInvoiceId(invoice.getInvoiceId()).stream()
                        .map(this::mapInvoiceDetail).collect(Collectors.toList()));
        invoice.setListInvoiceDetails(invoiceDetails);
        return invoice;
    }
}

    
