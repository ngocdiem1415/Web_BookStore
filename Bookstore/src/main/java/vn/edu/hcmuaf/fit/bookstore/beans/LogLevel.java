package vn.edu.hcmuaf.fit.bookstore.beans;

public enum LogLevel {
    INFO,
    ALERT,
    WARNING,
    DANGER;

    @Override
    public String toString() {
        return name();
    }
}
