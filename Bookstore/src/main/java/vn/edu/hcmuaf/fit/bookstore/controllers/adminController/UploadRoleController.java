package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.RoleServices;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "UploadRole", value = "/admin/upload-role")
public class UploadRoleController extends HttpServlet {
    private UserServices userServices = new UserServices();
    private RoleServices roleServices = RoleServices.getInstance();
    private LogService logService;

    public UploadRoleController() {
        this.userServices = UserServices.getInstance();
        this.logService = LogService.getInstance();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("User-Management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int uid = Integer.parseInt(request.getParameter("uid"));
            int newRole = Integer.parseInt(request.getParameter("role")); // role gửi từ form

            HttpSession session = request.getSession(false);
            User currentUser = (User) session.getAttribute("userSession");
            String ip = request.getRemoteAddr();

            // Cập nhật quyền
            roleServices.updateRole(uid, 1, newRole); // 1 là resourceId: USER_MGMT

            // Ghi log thành công
            Log log = new Log(
                    currentUser.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.ALERT,
                    "admin-management",
                    "UPDATE_ROLE_SUCCESS",
                    false,
                    "{\"targetUid\": " + uid + "}",
                    "{\"newRole\": \"" + newRole + "\", \"by\": \"" + currentUser.getUsername() + "\"}"
            );
            logService.insert(log);

            // Nếu tự hạ quyền mình thì logout
            if (currentUser.getUid() == uid && newRole == 1) {
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/user-management");
            }

        } catch (Exception e) {
            // Ghi log lỗi
            HttpSession session = request.getSession(false);
            User currentUser = (User) session != null ? (User) session.getAttribute("userSession") : null;
            String ip = request.getRemoteAddr();

            Log log = new Log(
                    currentUser != null ? currentUser.getUid() : -1,
                    session != null ? session.getId() : "N/A",
                    ip,
                    LogLevel.DANGER,
                    "admin-management",
                    "UPDATE_ROLE_FAILED",
                    true,
                    "{\"targetUid\": \"" + request.getParameter("uid") + "\"}",
                    "{\"error\": \"" + e.getMessage().replace("\"", "\\\"") + "\"}"
            );
            logService.insert(log);

            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Lỗi khi cập nhật quyền: " + e.getMessage());
            e.printStackTrace();
        }
    }
}