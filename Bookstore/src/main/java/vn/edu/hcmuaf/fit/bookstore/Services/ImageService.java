package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.Image;
import vn.edu.hcmuaf.fit.bookstore.dao.ImageBookDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.util.List;

public class ImageService {
    private static ImageService instance = null;
    Jdbi connect = JDBIConnector.getJdbi();

    public static ImageService getInstance() {
        if (instance == null) instance = new ImageService();
        return instance;
    }

    public List<Image> listImageThumbnail(){
        return connect.withExtension(ImageBookDao.class, handle -> handle.listImageThumbnail());
    }

    public Image findByProductId(int id) {
        return connect.withExtension(ImageBookDao.class, handle -> handle.findImageThumbnailByBookId(id));
    }

    public List<Image> finbyBookId(int id){
        return connect.withExtension(ImageBookDao.class, handle -> handle.findImageBookId(id));
    }

    public List<Image> list20ImageThumbnail(){
        return connect.withExtension(ImageBookDao.class, handle -> handle.list20ImageThumbnail());
    }

}
