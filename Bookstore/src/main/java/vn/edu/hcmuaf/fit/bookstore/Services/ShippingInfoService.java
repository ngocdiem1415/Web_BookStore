package vn.edu.hcmuaf.fit.bookstore.Services;

import vn.edu.hcmuaf.fit.bookstore.beans.Cart.BookVariant;
import vn.edu.hcmuaf.fit.bookstore.beans.Order.ShippingInfo;

import java.util.List;

public class ShippingInfoService {
    public static ShippingInfo calculateShippingInfo(List<BookVariant> variants) {
        int totalWeight = 600; //trọng lượng trung bình của bao bì thùng đựng
        int totalPrice = 0;
        int totalQuantity = 0;

        for (BookVariant bv : variants) {
            int quantity = bv.getQuantity();
            double weightPerItem = bv.getBook().getWeight(); // gram
            double pricePerItem = bv.getBook().getsalePrice();

            totalQuantity += quantity;
            totalWeight += (int) (weightPerItem * quantity);
            totalPrice += (int) (pricePerItem * quantity);
        }

        // Ví dụ: hộp có kích thước cố định theo từng nấc số lượng
        int length = 30, width = 20, height = 10; // mặc định nhỏ
        if (totalQuantity > 4) {
            length = 40; width = 30; height = 20;
        }
        if (totalQuantity > 8) {
            length = 50; width = 40; height = 30;
        }

        ShippingInfo info = new ShippingInfo();
        info.setTotalPrice(totalPrice);
        info.setTotalWeight(totalWeight);
        info.setTotalQuantity(totalQuantity);
        info.setLength(length);
        info.setWidth(width);
        info.setHeight(height);
        return info;
    }
}
