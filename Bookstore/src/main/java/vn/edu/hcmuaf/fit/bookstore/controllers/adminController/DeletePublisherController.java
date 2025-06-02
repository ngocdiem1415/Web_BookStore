package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.PublisherService;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "DeletePublisherController", value = "/delete-publisher")
public class DeletePublisherController extends HttpServlet {
    PublisherService publisherService;
    LogService logService;

    public DeletePublisherController() {
        this.publisherService = PublisherService.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int publisherId = Integer.parseInt(request.getParameter("publisherId")); // Lấy publisherId từ request
        // Kiểm tra xem publisherId có hợp lệ không
        if (publisherId <= 0) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // Trả về 400 Bad Request
            return;
        }
        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        try {
            // Gọi phương thức xóa danh mục từ dịch vụ
            // publisherService.deletePublisher(publisherId);
            response.setStatus(HttpServletResponse.SC_OK); // Trả về 200 OK

            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.ALERT,
                    "publisher-management",
                    "DELETE_PUBLISHER_SUCCESS",
                    false,
                    "{\"publisher_id\": " + publisherId + "}",
                    "{\"deleted_by\": \"" + admin.getUsername() + "\", \"publisher_id\": \"" + publisherId + "\"}"
            );
            logService.insert(log);
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);

            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.DANGER,
                    "publisher-management",
                    "DELETE_PUBLISHER_FAILED",
                    true,
                    "{\"publisher_id\": " + publisherId + "}",
                    "{\"deleted_by\": \"" + admin.getUsername() + "\", \"publisher_id\": \"" + publisherId + "\"}"
            );
            logService.insert(log);

            e.printStackTrace();
        }
    }
}