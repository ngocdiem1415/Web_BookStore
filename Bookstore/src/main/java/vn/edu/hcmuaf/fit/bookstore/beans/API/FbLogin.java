package vn.edu.hcmuaf.fit.bookstore.beans.API;

import vn.edu.hcmuaf.fit.bookstore.beans.Pictures;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

public class FbLogin {
    private String id;
    private String email;
    private boolean verified_email;
    private String name;
    private String given_name;
    private String family_name;
    private Pictures pictureObject;

    public FbLogin() {
    }
    public FbLogin(String id, String email, boolean verified_email, String name, String given_name, String family_name, Pictures pictureObject) {
        this.id = id;
        this.email = email;
        this.verified_email = verified_email;
        this.name = name;
        this.given_name = given_name;
        this.family_name = family_name;
        this.pictureObject = pictureObject;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public boolean isVerified_email() {
        return verified_email;
    }

    public void setVerified_email(boolean verified_email) {
        this.verified_email = verified_email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGiven_name() {
        return given_name;
    }

    public void setGiven_name(String given_name) {
        this.given_name = given_name;
    }

    public String getFamily_name() {
        return family_name;
    }

    public void setFamily_name(String family_name) {
        this.family_name = family_name;
    }

    public Pictures getPictureObject() {
        return pictureObject;
    }

    public void setPictureObject(Pictures pictureObject) {
        this.pictureObject = pictureObject;
    }
    @Override
    public String toString() {
        return "FbLogin{" +
                "id='" + id + '\'' +
                ", email='" + email + '\'' +
                ", verified_email=" + verified_email +
                ", name='" + name + '\'' +
                ", given_name='" + given_name + '\'' +
                ", family_name='" + family_name + '\'' +
                ", pictureObject=" + pictureObject +
                '}';
    }

    public User mapToUserFB() {
        User user = new User();
        user.setEmail(this.email);
        user.setUsername(this.name);
        user.setGender("other");
        if (this.pictureObject != null && this.pictureObject.getData() != null) {
            user.setAvatar(this.pictureObject.getData().getUrl());
        }
        user.setEmailVerified(this.verified_email ? 1 : 0);
        return user;
    }
}