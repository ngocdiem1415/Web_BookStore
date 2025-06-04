package vn.edu.hcmuaf.fit.bookstore.dao;

import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import vn.edu.hcmuaf.fit.bookstore.beans.Permission;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

import java.util.List;

@RegisterBeanMapper(Permission.class)
public interface PermissionDao {
    @SqlQuery(QUERIES.PERMISSION.GET_ALL_ROLES)
    List<Permission> getAllRoles();

    @SqlQuery(QUERIES.PERMISSION.GET_RESOURCE_NAME_BY_ID)
    List<String> resourceNames(int uid);

    @SqlQuery(QUERIES.PERMISSION.GET_RESOURCE_NAME)
    List<String> resourceNames();

    @SqlQuery(QUERIES.PERMISSION.GET_RESOURCE)
    Integer getResourceById(@Bind("resourceCode") String resourceCode);
}
