package vn.edu.hcmuaf.fit.bookstore.controllers.userController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

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
//        String uid = request.getParameter("uid");
//        String newPassword = request.getParameter("password");
//        String rePassword = request.getParameter("repassword");
//
//        if (uid == null || uid.isEmpty()) {
//            request.setAttribute("baoloi", "Không tìm thấy UID hợp lệ");
//            RequestDispatcher rd = request.getRequestDispatcher("change-password.jsp");
//            rd.forward(request, response);
//            return;
//        }
//
//        if (!newPassword.equals(rePassword)) {
//            request.setAttribute("baoloi", "Mật khẩu không khớp");
//            RequestDispatcher rd = request.getRequestDispatcher("change-password.jsp");
//            rd.forward(request, response);
//            return;
//        }
//
//        int userId;
//        try {
//            userId = Integer.parseInt(uid);
//        } catch (NumberFormatException e) {
//            request.setAttribute("baoloi", "UID không hợp lệ");
//            RequestDispatcher rd = request.getRequestDispatcher("change-password.jsp");
//            rd.forward(request, response);
//            return;
//        }
//
//        UserServices userServices = new UserServices();
//        String hashedPassword = PasswordHash.hashPassword(newPassword);
//        userServices.changePassword(userId, hashedPassword);
//        request.setAttribute("thanhcong", "Đổi mật khẩu thành công");
//        RequestDispatcher rd = request.getRequestDispatcher("change-password.jsp");
//        rd.forward(request, response);
//    }
    }
}