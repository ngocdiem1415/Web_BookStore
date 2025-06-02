package vn.edu.hcmuaf.fit.bookstore.controllers;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.LoginStracked.LoginAttemptTracker;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.beans.API.GGLogin;
import vn.edu.hcmuaf.fit.bookstore.filter.IconstantGG;

import java.io.IOException;
import java.util.UUID;

@WebServlet(name = "LoginGoogleController", value = "/login-google")
public class LoginGoogleController extends HttpServlet {
    private UserServices userService ;
    private LogService logService;

    public LoginGoogleController() {
        this.logService = LogService.getInstance();
        this.userService = UserServices.getInstance();
    }

    public static String getToken(String code) throws IOException, ClientProtocolException {
        // call api to get Token
        String response = Request.Post(IconstantGG.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(
                        Form.form()
                                .add("client_id", IconstantGG.GOOGLE_CLIENT_ID)
                                .add("client_secret", IconstantGG.GOOGLE_CLIENT_SECRET)
                                .add("redirect_uri", IconstantGG.GOOGLE_REDIRECT_URI)
                                .add("code", code)
                                .add("grant_type", IconstantGG.GOOGLE_GRANT_TYPE)
                                .build()
                )
                .execute().returnContent().asString();
        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static GGLogin getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = IconstantGG.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        GGLogin googlePeople = new Gson().fromJson(response, GGLogin.class);
        return googlePeople;

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        String accessToken = getToken(code);
        GGLogin GGLogin = getUserInfo(accessToken);

        HttpSession session = request.getSession();
        String sessionId = session.getId();
        String ip = request.getRemoteAddr();

        User user = GGLogin.mapToUserGG();
        if (!userService.exists(user)) {
//            user.setRole("user");
            user.setStatus(1);
            user.setPassword(UUID.randomUUID().toString());
            userService.insertByGoogle(user);
            Log log = new Log(user.getUid(), sessionId, ip, LogLevel.INFO, "login", "LOGIN_SUCCESS",
                    false, "{}", "{\"username\": \"" + user.getUsername() + "\"}");
            logService.insert(log);
            // Reset đếm thất bại
            LoginAttemptTracker.reset(sessionId);
        }
        user = userService.findByUserName(user.getUsername());
        session.setAttribute("userSession", user);
        response.sendRedirect(request.getContextPath() + "/home");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}