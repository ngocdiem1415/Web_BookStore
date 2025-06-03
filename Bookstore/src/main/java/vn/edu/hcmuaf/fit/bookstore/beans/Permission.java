package vn.edu.hcmuaf.fit.bookstore.beans;

public class Permission {
    private int resourceId;
    private String resourceCode;
    private String resourceName;
    private String description;

    public Permission() {
    }

    public Permission(int resourceId, String resourceCode, String resourceName, String description) {
        this.resourceId = resourceId;
        this.resourceCode = resourceCode;
        this.resourceName = resourceName;
        this.description = description;
    }


    public int getResourceId() {
        return resourceId;
    }

    public void setResourceId(int resourceId) {
        this.resourceId = resourceId;
    }

    public String getResourceCode() {
        return resourceCode;
    }

    public void setResourceCode(String resourceCode) {
        this.resourceCode = resourceCode;
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}

