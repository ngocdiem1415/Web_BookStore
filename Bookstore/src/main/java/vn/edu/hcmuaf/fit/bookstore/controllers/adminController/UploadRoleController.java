package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.RoleServices;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "UploadRole", value = "/admin/upload-role")
public class UploadRoleController extends HttpServlet {
    private UserServices userServices = new UserServices();
    private RoleServices roleServices = RoleServices.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("User-Management.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int uid = Integer.parseInt(request.getParameter("uid"));
            int resourceId = roleServices.selectResourceByUserId(uid);
            int permission = roleServices.selectPermissionByUserId(uid, resourceId);

            if (permission == 0) {
                roleServices.updateRole(uid, 1, 3); // USER_MGMT
            } else {
                permission = (permission == 1) ? 3 : 1; // Toggle between USER_MGMT and ADMIN_MGMT
                roleServices.updateRole(uid, 1, permission); // USER_MGMT
            }

            HttpSession session = request.getSession(false);
            User currentUser = (User) session.getAttribute("userSession");

            if (currentUser != null && currentUser.getUid() == uid && permission == 1) {
                session.invalidate();
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                response.sendRedirect(request.getContextPath() + "/admin/user-management");
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid input");
        }
    }
}