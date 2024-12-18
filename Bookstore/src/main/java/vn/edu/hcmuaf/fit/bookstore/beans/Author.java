package vn.edu.hcmuaf.fit.bookstore.beans;

import java.util.Date;

public class Author {
    private int authorId;
    private String authorName;
    private Date authorDob;
    private String gender;

    public Author() {}

    public Author(int authorId, String authorName, Date authorDob, String gender) {
        this.authorId = authorId;
        this.authorName = authorName;
        this.authorDob = authorDob;
        this.gender = gender;
    }

    public int getAuthorId() {
        return authorId;
    }

    public void setAuthorId(int authorId) {
        this.authorId = authorId;
    }

    public String getAuthorName() {
        return authorName;
    }

    public void setAuthorName(String authorName) {
        this.authorName = authorName;
    }

    public Date getAuthorDob() {
        return authorDob;
    }

    public void setAuthorDob(Date authorDob) {
        this.authorDob = authorDob;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Override
    public String toString() {
        return "Author{" +
                "authorId=" + authorId +
                ", authorName='" + authorName + '\'' +
                ", authorDob=" + authorDob +
                ", gender='" + gender + '\'' +
                '}';
    }
}


