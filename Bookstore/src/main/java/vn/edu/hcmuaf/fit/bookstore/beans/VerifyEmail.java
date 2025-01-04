package vn.edu.hcmuaf.fit.bookstore.beans;

import java.io.Serializable;
import java.util.Date;

public class VerifyEmail {
    private int id;                 // ID của token
    private String email;
    private String verificationCode; // Email của người dùng
    private String token;           // Token dùng để reset password
    private Date createdAt;         // Thời gian tạo token
    private Date expiresAt;         // Thời gian hết hạn của token

    public VerifyEmail() {
    }

    public VerifyEmail(int id, String email, String verificationCode, String token, Date createdAt, Date expiresAt) {
        this.id = id;
        this.email = email;
        this.verificationCode = verificationCode;
        this.token = token;
        this.createdAt = createdAt;
        this.expiresAt = expiresAt;
    }

    // Getter and Setter methods
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getExpiresAt() {
        return expiresAt;
    }

    public void setExpiresAt(Date expiresAt) {
        this.expiresAt = expiresAt;
    }

    // Phương thức toString (tùy chọn)
    @Override
    public String toString() {
        return "PasswordResetToken{" +
                "id=" + id +
                ", email='" + email + '\'' +
                ", token='" + token + '\'' +
                ", createdAt=" + createdAt +
                ", expiresAt=" + expiresAt +
                ", verificationCode='" + verificationCode + '\'' +
                '}';
    }
}

