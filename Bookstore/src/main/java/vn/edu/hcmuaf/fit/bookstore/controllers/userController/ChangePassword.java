package vn.edu.hcmuaf.fit.bookstore.controllers.userController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "ChangePassword", value = "/change-password")
public class ChangePassword extends HttpServlet {

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

        User user = (User) request.getSession().getAttribute("userSession");
        if (user == null) {
            request.setAttribute("baoloi", "Phiên làm việc của bạn đã hết hạn hoặc bạn chưa đăng nhập. Vui lòng đăng nhập lại.");
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
            return;
        }

        int uid = user.getUid(); // Lấy UID từ đối tượng user

        // Thay đổi mật khẩu
        UserServices userServices = new UserServices();
        userServices.changePassword(uid, newpassword);

        request.setAttribute("baoloi", "Đổi mật khẩu thành công!");
        request.getRequestDispatcher("change-password.jsp").forward(request, response);

    }
}