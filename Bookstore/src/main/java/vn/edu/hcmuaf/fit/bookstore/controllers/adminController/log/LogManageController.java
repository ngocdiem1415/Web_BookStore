package vn.edu.hcmuaf.fit.bookstore.controllers.adminController.log;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "LogManagementController", value = "/admin/log-management")
public class LogManageController extends HttpServlet {
    private LogService logService;

    public LogManageController() {
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Log> listLog = logService.getListLog();
        request.setAttribute("logs", listLog);
        request.getRequestDispatcher("Log-Management.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}