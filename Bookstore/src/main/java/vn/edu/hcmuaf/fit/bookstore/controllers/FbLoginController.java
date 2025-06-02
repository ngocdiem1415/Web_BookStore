package vn.edu.hcmuaf.fit.bookstore.controllers;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.http.client.fluent.Request;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.API.FbLogin;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.filter.IconstantFB;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "FbLoginController", value = "/login-facebook")
public class FbLoginController extends HttpServlet {

    public static String getToken(String code) throws IOException {
        String link = IconstantFB.FACEBOOK_LINK_GET_TOKEN
                + "?client_id=" + IconstantFB.FACEBOOK_CLIENT_ID
                + "&redirect_uri=" + IconstantFB.FACEBOOK_REDIRECT_URI
                + "&scope=email" // Thêm quyền email vào đây
                + "&client_secret=" + IconstantFB.FACEBOOK_CLIENT_SECRET
                + "&code=" + code;

        String response = Request.Get(link).execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        return jobj.get("access_token").getAsString();
    }

    public static FbLogin getUserInfo(final String accessToken) throws IOException {
        String link = IconstantFB.FACEBOOK_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        return new Gson().fromJson(response, FbLogin.class);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        if (code == null || code.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return;
        }

        try {
            String accessToken = getToken(code);
            FbLogin fbLogin = getUserInfo(accessToken);
            User user = fbLogin.mapToUserFB();

            // Xử lý trường hợp Facebook không trả về email
            if (user.getEmail() == null || user.getEmail().isEmpty()) {
                user.setEmail(user.getUsername() + "@gmail.com");
            }

            UserServices userService = new UserServices();

            if (!userService.exists(user)) {
//                user.setRole("user");  // Hoặc default là "user"
                user.setStatus(1);      // Kích hoạt tài khoản
                user.setPassword(UUID.randomUUID().toString()); // Password ngẫu nhiên, vì dùng OAuth
                userService.insertByGoogle(user); // Đổi tên cho đúng nghĩa
            }

            user = userService.findByUserName(user.getUsername());

            // Tạo session
            HttpSession session = request.getSession();
            session.setAttribute("userSession", user);

            response.sendRedirect(request.getContextPath() + "/home");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Đăng nhập Facebook thất bại. Vui lòng thử lại.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Không xử lý POST cho Facebook login
    }
}
