package vn.edu.hcmuaf.fit.bookstore.controllers.userController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "ChangePassword", value = "/change-password")
public class ChangePassword extends HttpServlet {
    private UserServices userServices;
    private LogService logService;

    public ChangePassword() {
        this.userServices = UserServices.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("change-password.jsp");
        rd.forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String password = request.getParameter("password");
        String newpassword = request.getParameter("new-password");
        String repassword = request.getParameter("re-password");

        if (password == null || password.isEmpty() ||
                newpassword == null || newpassword.isEmpty() ||
                repassword == null || repassword.isEmpty()) {
            request.setAttribute("baoloi", "Vui lòng điền đầy đủ các trường!");
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
            return;
        }

        if (!newpassword.equals(repassword)) {
            request.setAttribute("baoloi", "Mật khẩu mới và xác nhận mật khẩu không khớp!");
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
            return;
        }
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("userSession");

        if (user == null) {
            request.setAttribute("baoloi", "Phiên làm việc của bạn đã hết hạn hoặc bạn chưa đăng nhập. Vui lòng đăng nhập lại.");
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
            return;
        }

        int uid = user.getUid(); // Lấy UID từ đối tượng user
        if (!userServices.checkPassword(uid, password)) {
            request.setAttribute("baoloi", "Mật khẩu hiện tại không đúng!");
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
            return;
        }

        // Thay đổi mật khẩu
        userServices.changePassword(uid, newpassword);
        Log log = new Log(
                uid,
                session.getId(),
                request.getRemoteAddr(),
                LogLevel.INFO,
                "account",
                "CHANGE_PASSWORD_SUCCESS",
                true,
                user.getEmail(),
                null
        );
        logService.insert(log);
        request.setAttribute("baoloi", "Đổi mật khẩu thành công!");
        request.getRequestDispatcher("change-password.jsp").forward(request, response);

    }
}