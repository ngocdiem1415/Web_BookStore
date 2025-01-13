package vn.edu.hcmuaf.fit.bookstore.beans.Cart;

import vn.edu.hcmuaf.fit.bookstore.beans.Book;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class Cart implements Serializable {
    private  static final long serialVersionID = 1L;
    private static Cart instance;
    private Map<String, Book> listBook;
    private double totalPrice;


    public Cart() {
        listBook = new HashMap<>();
    }

    public static Cart getInstance() {
        if (instance == null) {
            instance = new Cart();
        }
        return instance;
    }

    //put book
    public void addBook (Book book , int quantity){
        int productKey = generateProductKey(book.getbId(),quantity);
        if ( listBook.containsKey(productKey)){
            updateBookQuantity(productKey, listBook.get(productKey).getQuantity() + quantity);

        }
    }

    private void updateBookQuantity(int productKey, int i) {
        Book book = listBook.get(productKey);
        System.out.println("update" + productKey);
        if ( book != null){
            book.set
        }
    }

    private int generateProductKey(int i, int quantity) {
        return i + quantity;
    }

    public static void setInstance(Cart instance) {
        Cart.instance = instance;
    }

    public Map<String, Book> getListBook() {
        return listBook;
    }

    public void setListBook(Map<String, Book> listBook) {
        this.listBook = listBook;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }
}
