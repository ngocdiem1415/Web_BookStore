package vn.edu.hcmuaf.fit.bookstore.beans.Cart;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

public class Cart implements Serializable {
    private  static final long serialVersionID = 1L;
    private static Cart instance;
    private int id;
    private Map<String, BookVariant> listBook;

    public Cart() {
        listBook = new HashMap<>();
    }

    public static Cart getInstance(){
        if ( instance == null){
            instance = new Cart();
        }
        return instance;
    }
}
