package vn.edu.hcmuaf.fit.bookstore.beans;

public class BookStockView {
    private int bId;
    private int totalImported;
    private int totalSold;

    public BookStockView(int bId, int totalImported, int totalSold) {
        this.bId = bId;
        this.totalImported = totalImported;
        this.totalSold = totalSold;
    }

    public int getBId() { return bId; }
    public int getTotalImported() { return totalImported; }
    public int getTotalSold() { return totalSold; }
    public int getStockRemaining() { return totalImported - totalSold; }
}
