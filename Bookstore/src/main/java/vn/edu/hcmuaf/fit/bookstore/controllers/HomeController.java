package vn.edu.hcmuaf.fit.bookstore.controllers; import jakarta.servlet.*; 
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException; 
@WebServlet(name = "HomeController", value = "/home")
public class HomeController extends HttpServlet {

@Override protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Chuyển hướng tới trang chủ
    request.getRequestDispatcher("Home.jsp").forward(request, response);
}
@Override protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { } 
}