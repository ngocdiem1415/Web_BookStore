package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.Publisher;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

import java.util.List;

@RegisterBeanMapper(Publisher.class)
public interface PublisherDao {

    @SqlQuery(QUERIES.PUBLISHER.SELECT_ALL_PUBLISHER)
    List<Publisher> list();

    @SqlQuery(QUERIES.PUBLISHER.FIND_BY_PUBLISHERID)
    Publisher findById(@Bind("id") int id);

    @SqlUpdate(QUERIES.PUBLISHER.DELETE)
    void delete(@Bind("id") int id);

}
