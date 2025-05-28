package vn.edu.hcmuaf.fit.bookstore.beans;

import java.io.Serializable;
import java.time.LocalDateTime;

public class Log implements Serializable {
    private int logId;
    private Integer userId;
    private String sessionId;
    private String ipAddress;
    private LogLevel level;
    private String resource;
    private String action;
    private LocalDateTime createAt;
    private boolean locked;
    private String dataBefore;
    private String dataAfter;

    public Log( Integer userId, String sessionId, String ipAddress, LogLevel level, String resource, String action, boolean locked, String dataBefore, String dataAfter) {
        this.userId = userId;
        this.sessionId = sessionId;
        this.ipAddress = ipAddress;
        this.level = level;
        this.resource = resource;
        this.action = action;
        this.locked = locked;
        this.dataBefore = dataBefore;
        this.dataAfter = dataAfter;
    }

    public Log() {
    }

    public int getLogId() {
        return logId;
    }

    public void setLogId(int logId) {
        this.logId = logId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getSessionId() {
        return sessionId;
    }

    public void setSessionId(String sessionId) {
        this.sessionId = sessionId;
    }

    public String getIpAddress() {
        return ipAddress;
    }

    public void setIpAddress(String ipAddress) {
        this.ipAddress = ipAddress;
    }

    public LogLevel getLevel() {
        return level;
    }

    public void setLevel(LogLevel level) {
        this.level = level;
    }

    public String getResource() {
        return resource;
    }

    public void setResource(String resource) {
        this.resource = resource;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }

    public LocalDateTime getCreateAt() {
        return createAt;
    }

    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }

    public boolean isLocked() {
        return locked;
    }

    public void setLocked(boolean locked) {
        this.locked = locked;
    }

    public String getDataBefore() {
        return dataBefore;
    }

    public void setDataBefore(String dataBefore) {
        this.dataBefore = dataBefore;
    }

    public String getDataAfter() {
        return dataAfter;
    }

    public void setDataAfter(String dataAfter) {
        this.dataAfter = dataAfter;
    }
}
