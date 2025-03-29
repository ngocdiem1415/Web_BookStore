package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Handle;
import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.beans.VerifyEmail;
import vn.edu.hcmuaf.fit.bookstore.dao.UserDao;
import vn.edu.hcmuaf.fit.bookstore.dao.VerifyEmailDao;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;
import vn.edu.hcmuaf.fit.bookstore.db.QUERIES;
import vn.edu.hcmuaf.fit.bookstore.util.MailVerify;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;
import java.util.UUID;

public class VerifyEmailService {
    Jdbi conn = JDBIConnector.getJdbi();

    public void insertVerifyEmail(String email, String token, Timestamp createdAt, Timestamp expiresAt) {
        try {
            conn.useExtension(VerifyEmailDao.class, handle -> {
                handle.insertVerifyEmail(email, token, createdAt, expiresAt);
            });
        } catch (RuntimeException e) {
            throw new RuntimeException(e);
        }
    }

    public VerifyEmail selectVerifyEmailByCode(String code) {
        return conn.withExtension(VerifyEmailDao.class, handle -> {
            List<VerifyEmail> verifyEmails = handle.selectVerifyEmailByCode(code);
            if (verifyEmails.isEmpty()) {
                return null;
            }
            return verifyEmails.get(0);
        });
    }

    // Lu mã token vào database và gửi email xác minh
    public boolean saveVerifyEmail(String email, String token) {
//        String token = UUID.randomUUID().toString();
        try {
            LocalDateTime createdAt = LocalDateTime.now();
            LocalDateTime expiresAt = createdAt.plusMinutes(2);

            Timestamp createdTimestamp = Timestamp.valueOf(createdAt);
            Timestamp expiresTimestamp = Timestamp.valueOf(expiresAt);
            conn.useExtension(VerifyEmailDao.class, dao -> {
                dao.insertVerifyEmail(email, token, createdTimestamp, expiresTimestamp);
            });

            // Gui email xac minh
            MailVerify mailVerify = new MailVerify();
            mailVerify.sendVerificationCode(email, token);
            return true;
        } catch (RuntimeException e) {
            e.printStackTrace();
            return false;
        }
    }

    public void deleteVerifyEmailByUserId(int uid) {
        conn.useExtension(VerifyEmailDao.class, handle -> {
            handle.deleteVerifyEmailByUserId(uid);
        });
    }

    public void delete(String token) {
        conn.useExtension(VerifyEmailDao.class, handle -> {
            handle.delete(token);
        });
    }

    public boolean verifyToken(String token) {
        return conn.withExtension(VerifyEmailDao.class, handle-> {
            List<VerifyEmail> verifyEmails = handle.findValidToken(token, 0);
            if (verifyEmails.isEmpty()) {
                return false;
            }
            VerifyEmail verifyEmail = verifyEmails.get(0);
            // Kiem tra thoi han
            if (LocalDateTime.now().isAfter(verifyEmail.getExpiresAt().toLocalDate().atStartOfDay())) {
                return false;
            }

            // dannh dau token da duoc su dung
            handle.updateTokenStatus(token, 1);
            return true;
        });
    }
}
