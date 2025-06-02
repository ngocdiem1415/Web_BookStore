package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.PublisherService;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.Publisher;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebServlet(name = "EditPublisherController", value = "/admin/edit-publisher")
public class EditPublisherController extends HttpServlet {
    PublisherService publisherService;
    LogService logService;

    public EditPublisherController() {
        this.publisherService = PublisherService.getInstance();
        this.logService = LogService.getInstance();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Publisher publisher = publisherService.finPublisherById(id);
        request.setAttribute("publisher", publisher);
        request.getRequestDispatcher("Edit-publisher.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String publisherName = request.getParameter("ten");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");
        int id =0;
        try {
            id = Integer.parseInt(request.getParameter("id"));
            publisherService.updatePublisher(id, publisherName, address, phone);

            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.ALERT,
                    "admin-management",
                    "UPDATE_ADMIN_SUCCESS",
                    false,
                    "{\"publisher_id\": " + id + "}",
                    "{\"publisher_id\": \"" + id + "\", \"updatedBy\": \"" + admin.getUsername() + "\"}"
            );
            logService.insert(log);
            response.sendRedirect("publisher");
        } catch (Exception e) {
            Log log = new Log(
                    admin.getUid(),
                    session.getId(),
                    ip,
                    LogLevel.DANGER,
                    "publisher-management",
                    "UPDATE_PUBLISHER_FAILED",
                    true,
                    "{\"publisher_id\": " + id + "}",
                    "{\"error\": \"" + e.getMessage().replace("\"", "\\\"") + "\"}"
            );
            logService.insert(log);
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Lỗi khi cập nhật thông tin publisher: " + e.getMessage());
            e.printStackTrace();
        }
    }
}