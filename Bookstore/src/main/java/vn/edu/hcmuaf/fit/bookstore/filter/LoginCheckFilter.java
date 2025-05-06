//package vn.edu.hcmuaf.fit.bookstore.filter;
//
//import jakarta.servlet.*;
//import jakarta.servlet.annotation.*;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//import vn.edu.hcmuaf.fit.bookstore.beans.User;
//
//import java.io.IOException;
//import java.util.Arrays;
//import java.util.List;
//
//@WebFilter(filterName = "LoginCheckFilter", urlPatterns = {"/*"})
//public class LoginCheckFilter implements Filter {
//
//    private ServletContext context;
//    private static final List<String> EXCLUDED_PAGES = Arrays.asList(
//            "/",
//            "/login",  // Trang đăng nhập
//            "/signup", // Trang đăng ký
//            "/home",
//            "/Bookstore",
//            "/aboutUs",
//            "/contact",
//            "/policy",
//            "/login-google",
//            "/login-facebook",
//            "/listBook",
//            "/BookDetail"
//    );
//
//    public void init(FilterConfig config) throws ServletException {
//        this.context = config.getServletContext();
//    }
//
//    public void destroy() {
//    }
//
//    @Override
//
//    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws ServletException, IOException {
//        HttpServletRequest rq = (HttpServletRequest) request;
//        HttpServletResponse rp = (HttpServletResponse) response;
//
//        // Kiểm tra URL yêu cầu có nằm trong danh sách ngoại lệ không
//        String servletPath = rq.getServletPath();
////        String requestUri = rq.getRequestURI();
//        if (isExcludedPage(servletPath)) {
//            // Nếu là trang ngoại lệ, tiếp tục chuỗi filter mà không kiểm tra đăng nhập
//            chain.doFilter(request, response);
//            return;
//        }
//
//        // Kiểm tra session xem người dùng đã đăng nhập hay chưa
//        HttpSession session = rq.getSession(false);
//        User user = (session != null) ? (User) session.getAttribute("userSession") : null;
//
//        // Nếu chưa đăng nhập, chuyển hướng đến trang đăng nhập
//        if (user == null) {
//            rp.sendRedirect(rq.getContextPath() + "/login");
//            return;
//        }
//
//        // Nếu đã đăng nhập, tiếp tục chuỗi lọc và xử lý tiếp
//        chain.doFilter(request, response);
//    }
//
//    // Kiểm tra xem URL có nằm trong danh sách ngoại lệ hay không
//    private boolean isExcludedPage(String servletPath) {
////        for (String excludedPage : EXCLUDED_PAGES) {
////            if (requestUri.startsWith(excludedPage)) {
////                return true;
////            }
////        }
////        return false;
////        return EXCLUDED_PAGES.contains(servletPath);
//        if (EXCLUDED_PAGES.contains(servletPath)) {
//            return true;
//        }
//        // Bỏ qua luôn các file .jsp trong folder gốc (như login.jsp)
//        if (servletPath.endsWith(".jsp")) {
//            return true;
//        }
//
//        // Bỏ qua các file tĩnh (static resources)
//        return servletPath.endsWith(".css") ||
//                servletPath.endsWith(".js") ||
//                servletPath.endsWith(".png") ||
//                servletPath.endsWith(".jpg") ||
//                servletPath.endsWith(".jpeg") ||
//                servletPath.endsWith(".gif") ||
//                servletPath.endsWith(".woff") ||
//                servletPath.endsWith(".woff2") ||
//                servletPath.endsWith(".ttf") ||
//                servletPath.endsWith(".eot") ||
//                servletPath.endsWith(".svg");
//    }
//}