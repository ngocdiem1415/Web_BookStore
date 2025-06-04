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
import java.util.List;

@WebServlet(name = "RemoveRoleController", value = "/admin/remove-role")
public class RemoveRoleController extends HttpServlet {
    private RoleServices roleServices = RoleServices.getInstance();
    private LogService logService = LogService.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int uid = Integer.parseInt(request.getParameter("uid"));
            String resource = request.getParameter("resource");

            HttpSession session = request.getSession(false);
            if (session == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            User currentUser = (User) session.getAttribute("userSession");
            String ip = request.getRemoteAddr();

            // Lây danh sach quyen hien tai
            List<String> currentResources = roleServices.getAdminsResources(uid);
            // Kiểm tra xem đây có phải là quyền cuối cùng của người dùng không
            boolean isLastRole = currentResources.size() == 1 && currentResources.contains(resource);

            // Xóa quyền
            roleServices.resetUserRole(uid, resource);
            roleServices.resetUserPermissionAndRefreshSession(uid, resource);

            // Ghi log thành công
            logService.insert(new Log(
                    currentUser.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.ALERT,
                    "admin-management",
                    "REMOVE_ROLE_SUCCESS",
                    false,
                    "{\"targetUid\": " + uid + ", \"resource\": \"" + resource + "\"}",
                    "{\"by\": \"" + currentUser.getUsername() + "\"}"
            ));

            if (currentUser.getUid() == uid && "USER_MGMT".equalsIgnoreCase(resource) || currentUser.getUid() == uid && "PRODUCT_MGMT".equalsIgnoreCase(resource) || currentUser.getUid() == uid && "ORDER_MGMT".equalsIgnoreCase(resource) || currentUser.getUid() == uid && "CATEGORY_MGMT".equalsIgnoreCase(resource) || currentUser.getUid() == uid && "STOCK_MGMT".equalsIgnoreCase(resource) || currentUser.getUid() == uid && "PROMOTION_MGMT".equalsIgnoreCase(resource) || currentUser.getUid() == uid && "PUBLISHER_MGMT".equalsIgnoreCase(resource) || currentUser.getUid() == uid && "ROLE_MGMT".equalsIgnoreCase(resource)) {
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/admin-management");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}