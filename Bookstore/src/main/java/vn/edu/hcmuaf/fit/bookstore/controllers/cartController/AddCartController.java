package vn.edu.hcmuaf.fit.bookstore.controllers.cartController;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.BookDetailService;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.LoginStracked.LoginAttemptTracker;
import vn.edu.hcmuaf.fit.bookstore.beans.Book;
import vn.edu.hcmuaf.fit.bookstore.beans.Cart.Cart;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AddCartController", value = "/add-cart")
public class AddCartController extends HttpServlet {
    HttpSession session;
    BookDetailService bookDetailService;
    private LogService logService;

    public AddCartController() {
        this.bookDetailService = BookDetailService.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        session = request.getSession(false);
        String ip = request.getRemoteAddr();
        if (session == null || session.getAttribute("userSession") == null) {
            response.sendRedirect(request.getContextPath() + "/login"); // Chuyển hướng đến trang đăng nhập
            return;
        }
        User user = (User) session.getAttribute("userSession");
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            System.out.println("da chay toi day");
            Book book = bookDetailService.findById(id);
            if (book != null) {
                Cart cart = (Cart) session.getAttribute("cart");
                if (cart == null) {
                    cart = new Cart();
                    session.setAttribute("cart", cart);
                    System.out.println("da tao cart");
                }
                System.out.println("dataBefore");
//                Map<String, String> dataBefore = new HashMap<>();
//                dataBefore.put("username", user.getUsername());
                String dataBefore ="";
                try {
                    dataBefore = new GsonUtil().toJSon(cart);
                }catch (Exception e){
                    e.printStackTrace();
                }

                //them book moi
                cart.addBook(book, quantity);
                System.out.println("da add duoc book");
//                Map<String, String> dataAfter = new HashMap<>();
//                dataAfter.put("username", user.getUsername());
                String dataAfter = new GsonUtil().toJSon(cart);

                Log log = new Log(user.getUid(), session.getId(), ip, LogLevel.INFO, "cart", "ADD_BOOK_IN_CART",
                        false, dataBefore, dataAfter);
                logService.insert(log);

                session.setAttribute("cart", cart);
                // Sử dụng Gson với TypeAdapter
                PrintWriter printWriter = response.getWriter();
                printWriter.println(new GsonUtil().toJSon(cart));
                printWriter.flush();
                printWriter.close();
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID hoặc quantity không hợp lệ");
            return;
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
    }
}