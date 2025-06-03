package vn.edu.hcmuaf.fit.bookstore.beans;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.Objects;

public class User {
    private int uid;
    private String username;
    private String avatar;
    private String gender; // Có thể là "male", "female", hoặc "other"
    private Date dob;
    private String phone;
    private String email;
    private String password;
    private int status; // 1 là kích hoạt, 0 là không kích hoạt
    private int role; // 0: no access, 1: read, 2: write, 3: delete
    private LocalDateTime createAt;
    private LocalDateTime updateAt;
    private int emailVerified;

    public User(int id, String name, String picture, String gender, Object dob, String phone, String email, String password, int status, String user, Object createAt, Object updateAt) {
    }

    public User(int uid, String username, String avatar, String gender, Date dob, String phone, String email, String password, int status, int role, LocalDateTime createAt, LocalDateTime updateAt, int emailVerified) {
        this.uid = uid;
        this.username = username;
        this.avatar = avatar;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.status = status;
        this.role = role;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.emailVerified = emailVerified;
    }

    public User() {
    }

    public User(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public User(int uid, String username, String avatar, String gender, Date dob, String phone, String email, String password, int status,int role ,LocalDateTime createAt, LocalDateTime updateAt) {
        this.uid = uid;
        this.username = username;
        this.avatar = avatar;
        this.gender = gender;
        this.dob = dob;
        this.phone = phone;
        this.email = email;
        this.password = password;
        this.status = status;
        this.role = role;
        this.createAt = createAt;
        this.updateAt = updateAt;
    }

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", username='" + username + '\'' +
                ", avatar='" + avatar + '\'' +
                ", gender='" + gender + '\'' +
                ", dob=" + dob +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", password='" + password + '\'' +
                ", status=" + status +
                ", role=" + role +
                ", createAt=" + createAt +
                ", updateAt=" + updateAt +
                '}';
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    public LocalDateTime getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(LocalDateTime updateAt) {
        this.updateAt = updateAt;
    }

    public int getEmailVerified() {
        return emailVerified;
    }

    public void setEmailVerified(int emailVerified) {
        this.emailVerified = emailVerified;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        User user = (User) o;
        return uid == user.uid && Objects.equals(username, user.username) && Objects.equals(avatar, user.avatar) && Objects.equals(gender, user.gender) && Objects.equals(dob, user.dob) && Objects.equals(phone, user.phone) && Objects.equals(email, user.email) && Objects.equals(password, user.password) && Objects.equals(createAt, user.createAt) && Objects.equals(updateAt, user.updateAt);
    }

    @Override
    public int hashCode() {
        return Objects.hash(uid, username, avatar, gender, dob, phone, email, password, status, createAt, updateAt);
    }
}

