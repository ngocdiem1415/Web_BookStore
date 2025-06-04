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
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminManageController", value = "/admin/admin-management")
public class AdminManageController extends HttpServlet {
    UserServices userServices;
    LogService logService;
    RoleServices roleServices = RoleServices.getInstance();

    public AdminManageController() {
        this.userServices = UserServices.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> admins = userServices.listAdmins(2, 1);
        request.setAttribute("admins", admins);

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        // Danh sách resource của các admins
        Map<Integer, List<String>> userRoles = new HashMap<>();
        for (User user : admins) {
            List<String> resources = roleServices.getAdminsResources(user.getUid());
            userRoles.put(user.getUid(), resources);
        }
        request.setAttribute("userRoles", userRoles);

        // Danh sách resource user được phân quyền (ví dụ: "USER_MGMT", "PRODUCT_MGMT",...)
//        List<String> userResources = roleServices.getAdminsResources(admin.getUid());
//        session.setAttribute("userResources", userResources);

        Log log = new Log(
                admin.getUid(),
                session.getId(),
                ip,
                LogLevel.INFO,
                "admin-management",
                "VIEW_ADMIN_LIST",
                false,
                "{}",
                "{\"admin\": \"" + admin.getUsername() + "\"}"
        );

        logService.insert(log);
        request.getRequestDispatcher("Admin-Management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}