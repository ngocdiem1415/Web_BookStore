package vn.edu.hcmuaf.fit.bookstore.beans;
import java.util.Date;

public class BookView {
    private int bookId;
    private Date viewDate;
    private int viewCount;

    public BookView() {}

    public BookView(int bookId, Date viewDate, int viewCount) {
        this.bookId = bookId;
        this.viewDate = viewDate;
        this.viewCount = viewCount;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public Date getViewDate() {
        return viewDate;
    }

    public void setViewDate(Date viewDate) {
        this.viewDate = viewDate;
    }

    public int getViewCount() {
        return viewCount;
    }

    public void setViewCount(int viewCount) {
        this.viewCount = viewCount;
    }

    @Override
    public String toString() {
        return "BookView{" +
                "bookId=" + bookId +
                ", viewDate=" + viewDate +
                ", viewCount=" + viewCount +
                '}';
    }
}

