package vn.edu.hcmuaf.fit.bookstore.beans;

import com.google.gson.JsonObject;

import java.time.LocalDateTime;

public class Log {
    private int logId;
    private byte level;
    private LocalDateTime timestamp;
    private String location;
    private String resource;
    private int userId;
    private String email;
    private JsonObject dataBefore;
    private JsonObject dataAfter;

    public Log(int logId, byte level, LocalDateTime timestamp, String location, String resource, int userId, String email, JsonObject dataBefore, JsonObject dataAfter) {
        this.logId = logId;
        this.level = level;
        this.timestamp = timestamp;
        this.location = location;
        this.resource = resource;
        this.userId = userId;
        this.email = email;
        this.dataBefore = dataBefore;
        this.dataAfter = dataAfter;
    }
}
