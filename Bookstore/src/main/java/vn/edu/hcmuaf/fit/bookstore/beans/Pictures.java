package vn.edu.hcmuaf.fit.bookstore.beans;

public class Pictures {
    private Data data; // đại diện cho field "data"

    public Data getData() {
        return data;
    }

    public void setData(Data data) {
        this.data = data;
    }

    // class Data lồng bên trong
    public static class Data {
        private String url; // chỉ cần lấy url thôi, các field khác (height, width, is_silhouette) có thể bỏ

        public String getUrl() {
            return url;
        }

        public void setUrl(String url) {
            this.url = url;
        }
    }
}
