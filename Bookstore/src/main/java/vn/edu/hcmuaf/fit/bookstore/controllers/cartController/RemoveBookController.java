package vn.edu.hcmuaf.fit.bookstore.controllers.cartController;

import com.google.gson.Gson;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.beans.Cart.Cart;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "RemoveBookController", value = "/remove-book-in-cart")
public class RemoveBookController extends HttpServlet {
    private LogService logService;

    public RemoveBookController() {
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String productKey = request.getParameter("productKey");

        HttpSession session = request.getSession();
        String sessionID = session.getId();
        String ip = request.getRemoteAddr();
        User user = (User) session.getAttribute("userSession");

        Cart cart = (Cart) session.getAttribute("cart");
        if (cart != null) {
//            Map<String, String> dataBefore = new HashMap<>();
//            dataBefore.put("username", user.getUsername());
            String dataBefore = new GsonUtil().toJSon(cart);
            cart.removeProduct(productKey);
            session.setAttribute("cart", cart);
            Gson gson = new Gson();

//            Map<String, String> dataAfter = new HashMap<>();
//            dataAfter.put("username", user.getUsername());
            String dataAfter= new GsonUtil().toJSon(cart);

            Log log = new Log(
                    user.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.INFO,
                    "cart",
                    "REMOVE_BOOK_IN_CART",
                    false,
                    dataBefore,
                    dataAfter
            );
            logService.insert(log);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}