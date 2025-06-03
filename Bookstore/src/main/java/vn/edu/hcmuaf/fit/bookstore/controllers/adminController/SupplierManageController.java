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
import java.util.List;

@WebServlet(name = "SupplierManageController", value = "/admin/publisher")
public class SupplierManageController extends HttpServlet {
    PublisherService publisherService;
    LogService logService;

    public SupplierManageController() {
      this.publisherService = PublisherService.getInstance();
      this.logService = LogService.getInstance();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Publisher>publishers = publisherService.listPublisher();
        request.setAttribute("publishers", publishers);

        HttpSession session = request.getSession(false);
        String ip = request.getRemoteAddr();
        User admin = (User) session.getAttribute("userSession");

        Log log = new Log(admin.getUid(), session.getId(), ip, LogLevel.INFO, "supplier-management", "VIEW_SUPPLIER",
                false, "{}", "{\"admin\": \"" + admin.getUsername() + "\"}");
        logService.insert(log);

        request.getRequestDispatcher("Supplier-Management.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}