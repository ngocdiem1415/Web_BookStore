package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import vn.edu.hcmuaf.fit.bookstore.beans.Promotion;

import java.util.List;

@RegisterBeanMapper(Promotion.class)
public interface PromotionDao {

    @SqlQuery("select * from promotions")
    List<Promotion> list();

    @SqlQuery("select * from promotions where promotion_id = :id")
    Promotion findById(@Bind("id") int id);

}
