package vn.edu.hcmuaf.fit.bookstore.filter;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.edu.hcmuaf.fit.bookstore.Services.RoleServices;
import vn.edu.hcmuaf.fit.bookstore.Services.UserServices;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

@WebFilter(filterName = "AuthorizationFilter", urlPatterns = {"/admin/*", "/profile"})
public class AuthorizationFilter implements Filter {
    private ServletContext context;
    RoleServices roleServices = RoleServices.getInstance();

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String uri = request.getRequestURI();
        HttpSession session = request.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("userSession") : null;
        int resourceId = roleServices.selectResourceByUserId(user.getUid());
        // Kiểm tra đăng nhập cho các trang yêu cầu
        if (user == null && (uri.startsWith("/admin"))) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Kiểm tra quyền admin cho các URI /admin/*
        if (uri.startsWith("/admin")) {
            if (!roleServices.isAdmin(user.getUid(), resourceId)) {
                response.sendRedirect(request.getContextPath() + "/home");
                return;
            }
        }
        filterChain.doFilter(servletRequest, servletResponse);
    }

    @Override
    public void destroy() {
    }
}