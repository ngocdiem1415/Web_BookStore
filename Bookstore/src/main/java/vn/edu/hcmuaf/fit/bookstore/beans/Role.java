package vn.edu.hcmuaf.fit.bookstore.beans;

import java.util.List;

public class Role {
    private int uid;
    private int resourcesId;
    private int permissions;

    public Role(int uid, int resourcesId, int permissions) {
        this.uid = uid;
        this.resourcesId = resourcesId;
        this.permissions = permissions;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getResourcesId() {
        return resourcesId;
    }

    public void setResourcesId(int resourcesId) {
        this.resourcesId = resourcesId;
    }

    public int getPermissions() {
        return permissions;
    }

    public void setPermissions(int permissions) {
        this.permissions = permissions;
    }

    @Override
    public String toString() {
        return "Role{" +
                "uid=" + uid +
                ", resourcesId=" + resourcesId +
                ", permissions=" + permissions +
                '}';
    }
}
