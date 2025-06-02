package vn.edu.hcmuaf.fit.bookstore.beans.Cart;

import vn.edu.hcmuaf.fit.bookstore.beans.Book;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class Cart implements Serializable {
    private  static final long serialVersionID = 1L;
    private Map<String, BookVariant> listBook;
    private double totalPrice;


    public Cart() {
        listBook = new HashMap<>();
        this.totalPrice = 0;
    }

    //put book
    public void addBook (Book book , int quantity){
        System.out.println("add sach");
        String productKey = generateProductKey(book.getbId());
        if ( listBook.containsKey(productKey)){
            updateProductQuantity(productKey, quantity);
        }else{
            BookVariant bookVariant = new BookVariant(Integer.parseInt(productKey),book);
            bookVariant.setQuantity(quantity);
            listBook.put(productKey,bookVariant);
            this.getTotalPrice();
            System.out.println("add product: " + productKey);
        }
    }

    private String generateProductKey(int id) {
        return String.valueOf(id) ;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "listBook=" + listBook +
                ", totalPrice=" + totalPrice +
                '}';
    }

    public Map<String, BookVariant> getListBook() {
        return listBook;
    }

    public void setListBook(Map<String, BookVariant> listBook) {
        this.listBook = listBook;
    }

    public double getTotalPrice() {
        double totalPrice =0;
        for (BookVariant book: listBook.values()) {
            totalPrice += book.getBook().getsalePrice();
        }
        setTotalPrice(totalPrice);
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public void updateProductQuantity(String productKey, int i) {
        BookVariant product = listBook.get(productKey);
        System.out.println("update product: " + i);
        if (product != null) {
            if ( product.getQuantity() + i > 0){
            product.setQuantity(product.getQuantity()+ i);
            System.out.println("update product: " + product.getQuantity());
            getTotalPrice();}
        } else {
            // Xử lý trường hợp product là null (nếu cần)
            System.out.println("Không tìm thấy sản phẩm có key: " + productKey);
        }
    }

    public void removeProduct(String productKey) {
        if (listBook.containsKey(productKey)) {
            listBook.remove(productKey);
            getTotalPrice();
        }
    }
}
