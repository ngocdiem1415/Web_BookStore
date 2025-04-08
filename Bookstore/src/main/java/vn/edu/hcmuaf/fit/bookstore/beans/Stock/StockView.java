package vn.edu.hcmuaf.fit.bookstore.beans.Stock;

public class StockView {
    private int bId;
    private String title;
    private int totalImported;
    private int totalSold;
    private int stockRemaining;

    public StockView(int bId, String title, int totalImported, int totalSold, int stockRemaining) {
        this.bId = bId;
        this.title = title;
        this.totalImported = totalImported;
        this.totalSold = totalSold;
        this.stockRemaining = stockRemaining;
    }

    public StockView(){}

    public int getbId() {
        return bId;
    }

    public void setbId(int bId) {
        this.bId = bId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getTotalImported() {
        return totalImported;
    }

    public void setTotalImported(int totalImported) {
        this.totalImported = totalImported;
    }

    public int getTotalSold() {
        return totalSold;
    }

    public void setTotalSold(int totalSold) {
        this.totalSold = totalSold;
    }

    public int getStockRemaining() {
        return stockRemaining;
    }

    public void setStockRemaining(int stockRemaining) {
        this.stockRemaining = stockRemaining;
    }

    @Override
    public String toString() {
        return "StockView{" +
                "bId=" + bId +
                ", title='" + title + '\'' +
                ", totalImported=" + totalImported +
                ", totalSold=" + totalSold +
                ", stockRemaining=" + stockRemaining +
                '}';
    }
}
