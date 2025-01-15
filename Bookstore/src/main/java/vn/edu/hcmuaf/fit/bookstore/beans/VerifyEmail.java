package vn.edu.hcmuaf.fit.bookstore.beans;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

public class VerifyEmail {
    private int id;                 // ID của token
    private String email;
    private String token;           // Token dùng để reset password
    private LocalDateTime createdAt;         // Thời gian tạo token
    private LocalDateTime expiresAt;         // Thời gian hết hạn của token

    public VerifyEmail() {
    }

    public VerifyEmail(int id, String email, String token, LocalDateTime createdAt, LocalDateTime expiresAt) {
        this.id = id;
        this.email = email;
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

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getExpiresAt() {
        return expiresAt;
    }

    public void setExpiresAt(LocalDateTime expiresAt) {
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
                ", verificationCode='" + '\'' +
                '}';
    }

    public boolean isValid() {
        return expiresAt != null; // Kiểm tra mã có hết hạn hay không
    }
}

