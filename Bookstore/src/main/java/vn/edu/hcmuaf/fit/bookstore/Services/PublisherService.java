package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.Category;
import vn.edu.hcmuaf.fit.bookstore.beans.Publisher;
import vn.edu.hcmuaf.fit.bookstore.dao.CategoryDao;
import vn.edu.hcmuaf.fit.bookstore.dao.PublisherDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.util.List;

public class PublisherService {
    private static PublisherService instance = null;
    Jdbi connect = JDBIConnector.getJdbi();

    public static PublisherService getInstance() {
        if (instance == null) instance = new PublisherService();
        return instance;
    }

    public List<Publisher> listPublisher() {
        return connect.withExtension(PublisherDao.class, handle -> handle.list());
    }

    public Publisher getPublisherById(int id) {
        return connect.withExtension(PublisherDao.class, handle -> handle.findById(id));
    }

    public Publisher getPublisherByName(String name) {
        return connect.withExtension(PublisherDao.class, handle -> handle.findByName(name));
    }

    public void insertPublisher(String publisherName, String address, String phone) {
        connect.useExtension(PublisherDao.class, handle -> handle.insert(publisherName, address, phone));
    }

    public Publisher finPublisherById(int id) {
        return connect.withExtension(PublisherDao.class, handle -> handle.findById(id));
    }

    public void updatePublisher(int id, String publisherName, String address, String phone) {
        connect.useExtension(PublisherDao.class, handle -> handle.update(id, publisherName, address, phone));
    }

    public void deletePublisher(int id) {
        connect.useExtension(PublisherDao.class, handle -> handle.delete(id));
    }


}
