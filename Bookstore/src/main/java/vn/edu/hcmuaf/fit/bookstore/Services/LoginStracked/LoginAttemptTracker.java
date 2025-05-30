package vn.edu.hcmuaf.fit.bookstore.Services.LoginStracked;

import java.util.HashMap;
import java.util.Map;

public class LoginAttemptTracker {
    private static final Map<String, Integer> failedLoginAttempts = new HashMap<>();

    public static boolean shouldLogLoginFail(String sessionId) {
        int attempts = failedLoginAttempts.getOrDefault(sessionId, 0) + 1;
        failedLoginAttempts.put(sessionId, attempts);
        return attempts == 1 || attempts % 5 == 0;
    }

    public static void reset(String sessionId) {
        failedLoginAttempts.remove(sessionId);
    }

    public static int getAttempts(String sessionId) {
        return failedLoginAttempts.getOrDefault(sessionId, 0);
    }
}

