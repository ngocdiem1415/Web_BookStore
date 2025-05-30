package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.dao.LogDao;
import vn.edu.hcmuaf.fit.bookstore.dao.UserDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.util.List;

public class LogService {
    private static LogService instance = null;
    Jdbi connect = JDBIConnector.getJdbi();

    public static LogService getInstance() {
        if (instance == null) instance = new LogService();
        return instance;
    }
    public boolean insert(Log log){
        return connect.withExtension(LogDao.class, handle -> handle.insert(log));
    }

    public List<Log> getListLog() {
        return  connect.withExtension(LogDao.class, LogDao::listLog);
    }

    public Log findById(int id) {
        return connect.withExtension(LogDao.class, handle -> handle.findById(id));
    }
}
