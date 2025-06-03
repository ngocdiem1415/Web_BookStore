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
    public Image insertImage(Image image){
        connect.withExtension(ImageBookDao.class, handle -> handle.insertImage(image));
        return findBySourceImg(image.getSourceImg());
    }

    public List<Image> listImageThumbnail(){
        return connect.withExtension(ImageBookDao.class, handle -> handle.listImageThumbnail());
    }

    public boolean deleteImageOther(int bId){
        return connect.withExtension(ImageBookDao.class, handle -> handle.deleteImageOther(bId));
    }

    public boolean deleteImageThumbnail(int bId){
        return connect.withExtension(ImageBookDao.class, handle -> handle.deleteImaneThumbnail(bId));
    }

    public Image findByProductId(int id) {
        return connect.withExtension(ImageBookDao.class, handle -> handle.findImageThumbnailByBookId(id));
    }

    public Image findBySourceImg(String source) {
        return connect.withExtension(ImageBookDao.class, handle -> handle.findBySourceImg(source));
    }

    public List<Image> finbyBookId(int id){
        return connect.withExtension(ImageBookDao.class, handle -> handle.findImageBookId(id));
    }

    public List<Image> list20ImageThumbnail(){
        return connect.withExtension(ImageBookDao.class, handle -> handle.list20ImageThumbnail());
    }

}
