package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;

import java.util.List;

@RegisterBeanMapper(Log.class)
public interface LogDao {
    @SqlQuery("SELECT * FROM LOG")
    List<Log> listLog();
}
