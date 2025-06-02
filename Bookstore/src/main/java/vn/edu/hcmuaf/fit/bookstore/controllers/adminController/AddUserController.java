package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "User", value = "/admin/add-user")
public class AddUserController extends HttpServlet {
    UserServices userServices ;
    LogService logService;

    public AddUserController() {
        this.userServices = UserServices.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Add-User.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String dob = request.getParameter("birthdate");
        String gender = request.getParameter("gender");

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");
        Log log;

        Map<String, String> dataAfter = new HashMap<>();
        dataAfter.put("admin", admin.getUsername());
        dataAfter.put("username", username);
        dataAfter.put("email", email);
        dataAfter.put("phone", phone);
        dataAfter.put("password", password);
        dataAfter.put("dob", dob);
        dataAfter.put("gender", gender);

        int result = userServices.register(username, gender, dob, phone, email, password, "user");
        if (result == 0) {
            request.setAttribute("baoloi", "Thêm người dùng thành công");
            log = new Log(admin.getUid(), session.getId(), ip, LogLevel.ALERT, "user-management", "ADD_USER_SUCCESS",
                    false, "{}", new GsonUtil().toJSon(dataAfter));
            logService.insert(log);
            request.getRequestDispatcher("Add-User.jsp").forward(request, response);
        } else if (result == 1) {
            request.setAttribute("baoloi", "Username đã tồn tại");
            log = new Log(admin.getUid(), session.getId(), ip, LogLevel.ALERT, "user-management", "ADD_USER_FAIL_USERNAME_EXISTS",
                    false, "{}", new GsonUtil().toJSon(dataAfter));
            logService.insert(log);
            request.getRequestDispatcher("Add-User.jsp").forward(request, response);
        } else if (result == 2) {
            request.setAttribute("baoloi", "Email đã tồn tại");
            log = new Log(admin.getUid(), session.getId(), ip, LogLevel.ALERT, "user-management", "ADD_USER_FAIL_EMAIL_EXISTS",
                    false, "{}", new GsonUtil().toJSon(dataAfter));
            logService.insert(log);
            request.getRequestDispatcher("Add-User.jsp").forward(request, response);
        } else {
            response.sendRedirect("add-user");
        }
    }
}