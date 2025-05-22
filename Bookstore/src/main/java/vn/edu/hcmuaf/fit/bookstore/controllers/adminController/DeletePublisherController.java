package vn.edu.hcmuaf.fit.bookstore.controllers.adminController;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import vn.edu.hcmuaf.fit.bookstore.Services.PublisherService;

import java.io.IOException;

@WebServlet(name = "DeletePublisherController", value = "/delete-publisher")
public class DeletePublisherController extends HttpServlet {
    PublisherService publisherService = PublisherService.getInstance();

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
        try {
            // Gọi phương thức xóa danh mục từ dịch vụ
            // publisherService.deletePublisher(publisherId);
            response.setStatus(HttpServletResponse.SC_OK); // Trả về 200 OK
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            e.printStackTrace();
        }
    }
}