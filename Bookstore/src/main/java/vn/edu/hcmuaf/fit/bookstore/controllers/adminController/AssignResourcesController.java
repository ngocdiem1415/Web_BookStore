    package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

    import jakarta.servlet.*;
    import jakarta.servlet.http.*;
    import jakarta.servlet.annotation.*;
    import vn.edu.hcmuaf.fit.bookstore.Services.RoleServices;
    import vn.edu.hcmuaf.fit.bookstore.beans.User;

    import java.io.IOException;

    @WebServlet(name = "AssignResourcesController", value = "/admin/assign-resources")
    public class AssignResourcesController extends HttpServlet {
        RoleServices roleServices = RoleServices.getInstance();

        @Override
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.getRequestDispatcher("ChangeRole.jsp").forward(request, response);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
            int uid = Integer.parseInt(request.getParameter("uid"));
            String[] resources = request.getParameterValues("resources");
            String[] permissions = request.getParameterValues("permission");

            HttpSession session = request.getSession(false);
            if (session == null) {
                response.sendRedirect(request.getContextPath() + "/login");
                return;
            }

            if (resources != null && permissions != null && resources.length == permissions.length) {
                for (int i = 0; i < resources.length; i++) {
                    String resource = resources[i];
                    int permission = Integer.parseInt(permissions[i]);
                    Integer resourceId = roleServices.getAccessibleResourcesByUid(resource);

                    if (resourceId != null) {
                        roleServices.updateRole(uid, resourceId, permission);
                    } else {
                        System.out.println("Không tìm thấy resourceId cho: " + resource);
                    }
                }
            }

            // Cập nhật lại quyền cho phiên làm việc
            roleServices.resetUserPermissionAndRefreshSession(uid, ""); // bạn có thể truyền null hoặc "" nếu không dùng
            response.sendRedirect("user-management");
        }
    }