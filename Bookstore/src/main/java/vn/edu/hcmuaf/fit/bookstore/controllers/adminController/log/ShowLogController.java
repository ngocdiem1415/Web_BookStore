package vn.edu.hcmuaf.fit.bookstore.controllers.adminController.log;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.LogService;
import vn.edu.hcmuaf.fit.bookstore.beans.Log;

import java.io.IOException;

@WebServlet(name = "ShowLogController", value = "/admin/show-log")
public class ShowLogController extends HttpServlet {
    private LogService logService;

    public ShowLogController() {
        this.logService = LogService.getInstance();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String logId = request.getParameter("id");

        if ( "".equals(logId) || logId.isEmpty()){
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missing log ID");
        }

        int id = Integer.parseInt(logId);
        Log log = logService.findById(id);
        System.out.println(log.toString());
        request.setAttribute("log", log);
        request.getRequestDispatcher("Show-Log.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }
}