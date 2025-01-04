package vn.edu.hcmuaf.fit.bookstore.Services;

import org.jdbi.v3.core.Jdbi;
import vn.edu.hcmuaf.fit.bookstore.db.JDBIConnector;

public class VerifyEmailService {
    Jdbi conn = JDBIConnector.getJdbi();

    public void insertVerifyEmail(int id,String email, String token, String createdAt, String expiresAt) {
        conn.useExtension();
    }


}
