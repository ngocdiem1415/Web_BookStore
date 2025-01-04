package vn.edu.hcmuaf.fit.bookstore.controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "LoadMoreBookController", value = "/load")
public class LoadMoreBookController extends HttpServlet {
    private BookDetailService bookDetailService;

    public LoadMoreBookController() {
        this.bookDetailService = BookDetailService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String amount = request.getParameter("exitsBook");
        int iamount = Integer.parseInt(amount);
        List<Book> books = bookDetailService.listProducts(10,iamount);// biến  limit
        PrintWriter out = response.getWriter();

        for (Book b : books) {
            out.println("<div class=\"product grid-md-2-4\">\n" +
                    "                                <a href=\"/BookDetail?id=" + b.getbId() + "\">\n" +
                    "                                    <div class=\"home-product-item\">\n");
            String imageUrl = (b.getImage() != null && b.getImage().getSourceImg() != null && !b.getImage().getSourceImg().isEmpty())
                    ? b.getImage().getSourceImg() : "../img/default_image.png";
            out.println("<div class=\"home-product-item__img\" style=\"background-image: url('" + imageUrl + "');\"></div>\n" +
                    "                                        <h4 class=\"home-product-item__name\">" + b.getTitle() + "</h4>\n" +
                    "                                        <div class=\"home-product-item__price\">\n");
            if (b.getPromotionId() == 0) {
                out.println("<span class=\"home-product-item__price-current original-price\">" + b.getOriginalPrice() + " đ</span>\n");
            } else {
                out.println("<span class=\"home-product-item__price-current unit-price\">" + (b.getOriginalPrice() - (b.getOriginalPrice() * b.getPromotion().getDiscount())) + " đ</span>\n" +
                        "<span class=\"home-product-item__price-old original-price\">" + b.getOriginalPrice() + " đ</span>\n");
            }
            out.println("            </div>\n" +
                    "            <div class=\"home-product-item__action\">\n" +
                    "                <span class=\"home-product-item__like home-product-item__like--liked\">\n" +
                    "                    <i class=\"home-product-item__action-icon-empty fa-regular fa-heart\"></i>\n" +
                    "                    <i class=\"home-product-item__action-icon-fill fa-solid fa-heart\"></i>\n" +
                    "                </span>\n" +
                    "                <div class=\"home-product-item__rating\">\n" +
                    "                    <i class=\"fa-solid fa-star\"></i>\n" +
                    "                    <i class=\"fa-solid fa-star\"></i>\n" +
                    "                    <i class=\"fa-solid fa-star\"></i>\n" +
                    "                    <i class=\"fa-solid fa-star\"></i>\n" +
                    "                    <i class=\"fa-solid fa-star\"></i>\n" +
                    "                </div>\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "    </a>\n" +
                    "</div>");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}