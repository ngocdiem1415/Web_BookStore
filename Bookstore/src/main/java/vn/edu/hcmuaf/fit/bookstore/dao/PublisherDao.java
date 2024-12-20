package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import vn.edu.hcmuaf.fit.bookstore.beans.Publisher;

import java.util.List;

@RegisterBeanMapper(Publisher.class)
public interface PublisherDao {

    @SqlQuery("select * from publishers")
    List<Publisher> list();

    @SqlQuery("select p_id, p_name, p_address, p_phone from publishers where p_id = :id")
    Publisher findById(@Bind("id") int id);

}
