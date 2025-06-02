package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.Services.PublisherService;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;
import vn.edu.hcmuaf.fit.bookstore.beans.LogLevel;
import vn.edu.hcmuaf.fit.bookstore.beans.User;
import vn.edu.hcmuaf.fit.bookstore.util.GsonUtil;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "AddPublisherController", value = "/admin/add-publisher")
public class AddPublisherController extends HttpServlet {

    PublisherService publisherService;
    LogService logService;

    public AddPublisherController() {
        this.publisherService = PublisherService.getInstance();
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("Add-publisher.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("ten");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        boolean success = publisherService.insertPublisher(name, address, phone);

        Map<String, String> dataAfter = new HashMap<>();
        dataAfter.put("admin", admin.getUsername());
        dataAfter.put("publisher", name);
        dataAfter.put("address", address);
        dataAfter.put("phone", phone);

        Log log = new Log(
                admin.getUid(),
                session.getId(),
                ip,
                success ? LogLevel.ALERT : LogLevel.WARNING,
                "publisher",
                success ? "ADD_PUBLISHER_SUCCESS" : "ADD_PUBLISHER_FAIL",
                false,
                "{}",
                new GsonUtil().toJSon(dataAfter)
        );
        logService.insert(log);

        response.sendRedirect("publisher");
    }
}