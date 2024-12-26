package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import vn.edu.hcmuaf.fit.bookstore.beans.Image;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

import java.util.List;

@RegisterBeanMapper(Image.class)
public interface ImageBookDao {

    @SqlQuery(QUERIES.IMAGE.SELECT_ALL_IMAGE_THUMBNAIL)
    List<Image> listImageThumbnail();

    @SqlQuery(QUERIES.IMAGE.SELECT_ALL_IMAGE_THUMBNAIL_LIMIT)
    List<Image> list20ImageThumbnail();

    @SqlQuery(QUERIES.IMAGE.FIND_IMAGE_THUMBNAIL_BY_ID)
    Image findImageThumbnailByBookId(@Bind("id") int id);

    @SqlQuery(QUERIES.IMAGE.DELETE)
    void delete(@Bind("id") int id);
}
