package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import vn.edu.hcmuaf.fit.bookstore.beans.Image;

import java.util.List;

@RegisterBeanMapper(Image.class)
public interface ImageBookDao {

    @SqlQuery("select * from images where is_thumbnail = 1")
    List<Image> listImageThumbnail();

    @SqlQuery("select * from images where is_thumbnail = 1  limit 20")
    List<Image> list20ImageThumbnail();

    @SqlQuery("select * from images where b_id = :id and is_thumbnail = 1")
    Image findImageThumbnailByBookId(@Bind("id") int id);

}
