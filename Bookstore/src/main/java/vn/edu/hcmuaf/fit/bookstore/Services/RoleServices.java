package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.Permission;
import vn.edu.hcmuaf.fit.bookstore.beans.Role;
import vn.edu.hcmuaf.fit.bookstore.dao.PermissionDao;
import vn.edu.hcmuaf.fit.bookstore.dao.RoleDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

import java.util.List;

public class RoleServices {

    private static RoleServices instance = null;
    Jdbi conn = JDBIConnector.getJdbi();

    public static RoleServices getInstance() {
        if (instance == null) instance = new RoleServices();
        return instance;
    }

    public void insertRole(int uid, int resource_id, int permission) {
        conn.withExtension(RoleDao.class, dao -> {
            dao.insertRole(uid, resource_id, permission);
            return null;
        });
    }

    public boolean isAdmin(int uid, int resource_id) {
        return conn.withExtension(RoleDao.class, handle -> {
            Integer permission = handle.getPermission(uid, resource_id);
            System.out.println("Debug: UID = " + uid + ", Permission = " + permission);
            return permission != null && permission >= 2;
        });
    }

    public int getPermissionByUserId(int uid) {
        return conn.withExtension(RoleDao.class, handle -> {
            Integer permission = handle.getPermissionByUserId(uid);
            return permission != null ? permission : 0;
        });
    }

    public void updateRole(int uid, int resource_id, int permission) {
        conn.withExtension(RoleDao.class, dao -> {
            Integer existing = dao.getPermission(uid, resource_id);
            if (existing != null) {
                if (!existing.equals(permission)) {
                    dao.updateRole(uid, resource_id, permission);
                } else {
                    System.out.println("Permission đã đúng, không cần update.");
                }
            } else {
                dao.insertRole(uid, resource_id, permission);
            }
            return null;
        });
    }

    public int selectResourceByUserId(int uid) {
        return conn.withExtension(RoleDao.class, dao -> dao.selectResourceByUserId(uid));
    }

    public int selectPermissionByUserId(int uid, int resource_id) {
        return conn.withExtension(RoleDao.class, dao -> dao.selectPermissionByUserId(uid, resource_id));
    }

    public List<String> getAdminsResources(int uid) {
        return conn.withExtension(RoleDao.class, dao -> dao.getAdminsResources(uid));

    }

    public List<Permission> findAll() {
        return conn.withExtension(PermissionDao.class, handle -> handle.getAllRoles());
    }

}
