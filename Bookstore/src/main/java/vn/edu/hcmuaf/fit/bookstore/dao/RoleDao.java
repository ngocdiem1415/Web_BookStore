package vn.edu.hcmuaf.fit.bookstore.dao;


import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.customizer.Bind;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import vn.edu.hcmuaf.fit.bookstore.beans.Permission;
import vn.edu.hcmuaf.fit.bookstore.beans.Role;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;

import java.util.List;

@RegisterBeanMapper(Role.class)
public interface RoleDao {

    @SqlUpdate(QUERIES.ROLE.INSERT_ROLE)
    void insertRole(@Bind("uid") int uid, @Bind("resource_id") int resource_id, @Bind("permission") int permission);

    @SqlUpdate(QUERIES.ROLE.INSERT_ROLE)
    void insertRoleResourceName(@Bind("uid") int uid, @Bind("resource_code") String resource_code, @Bind("permission") int permission);

    @SqlQuery(QUERIES.ROLE.GET_PERMISSION)
    Integer getPermission(@Bind("uid") int uid, @Bind("resource_id") int resource_id);

    @SqlQuery(QUERIES.ROLE.GET_PERMISSION_BY_USER_ID)
    Integer getPermissionByUserId(@Bind("uid") int uid);

    @SqlUpdate(QUERIES.ROLE.UPDATE_ROLE)
    int updateRole(@Bind("uid") int uid, @Bind("resource_id") int resource_id, @Bind("permission") int permission);

    @SqlQuery(QUERIES.ROLE.SELECT_RESOURCE_BY_USER_ID)
    int selectResourceByUserId(@Bind("uid") int uid);

    @SqlQuery(QUERIES.ROLE.SELECT_PERMISSION_BY_USER_ID)
    int selectPermissionByUserId(@Bind("uid") int uid, @Bind("resource_id") int resource_id);

    @SqlQuery(QUERIES.ROLE.SELECT_ROLE_ADMINS)
    List<String> getAdminsResources(@Bind("uid") int uid);

    @SqlUpdate(QUERIES.ROLE.DELETE_RESOURCE)
    void removeUserResource(@Bind("uid") int uid, @Bind("resource") String resourceCode);

    @SqlUpdate(QUERIES.ROLE.RESET_USER_ROLE)
    void resetUserRole(@Bind("uid") int uid, @Bind("resource") String resourceCode);

    @SqlQuery(QUERIES.ROLE.SELECT_ROLE_ADMINS)
    List<String> getAccessibleResourcesByUid(@Bind("uid") int uid);

    @SqlQuery(QUERIES.ROLE.SELECT_ROLE_ADMINS)
    List<String> getRolesOfUser(@Bind("uid") int uid);

    @SqlUpdate(QUERIES.ROLE.DELETE_ALL_RESOURCES_BY_UID)
    void deleteAllResourcesByUid(@Bind("uid") int uid);

}
