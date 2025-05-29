package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.customizer.BindBean;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

import java.util.List;

@RegisterBeanMapper(Log.class)
public interface LogDao {
    @SqlQuery(QUERIES.LOG.LISTLOG)
    List<Log> listLog();

    @SqlUpdate(QUERIES.LOG.INSERT)
    boolean insert(@BindBean Log log);

    @SqlQuery(QUERIES.LOG.FIND_BY_ID)
    Log findById(@Bind("logId") int id);
}
