package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.Promotion;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

import java.util.List;

@RegisterBeanMapper(Promotion.class)
public interface PromotionDao {

    @SqlQuery(QUERIES.PROMOTION.SELECT_ALL_PROMOTION)
    List<Promotion> list();

    @SqlQuery(QUERIES.PROMOTION.FIND_BY_PROMOTIONID)
    Promotion findById(@Bind("id") int id);

    @SqlUpdate(QUERIES.PROMOTION.DELETE)
    void delete(@Bind("id") int id);

}
