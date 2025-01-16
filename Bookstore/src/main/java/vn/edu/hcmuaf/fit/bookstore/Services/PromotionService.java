package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.Promotion;
import vn.edu.hcmuaf.fit.bookstore.dao.PromotionDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.util.List;

public class PromotionService {
    private static PromotionService instance = null;
    Jdbi connect = JDBIConnector.getJdbi();

    public static PromotionService getInstance() {
        if(instance == null) instance = new PromotionService();
        return instance;
    }

    public List<Promotion> listCategory(){
        return connect.withExtension(PromotionDao.class, handle -> handle.list());
    }

    public Promotion getPromotionById(int id){
        return connect.withExtension(PromotionDao.class, handle -> handle.findById(id));
    }
}
