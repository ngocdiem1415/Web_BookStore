package vn.edu.hcmuaf.fit.bookstore.filter;

import jakarta.servlet.ServletContext;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import vn.edu.hcmuaf.fit.bookstore.beans.User;

import java.io.IOException;

public class AuthorizationFilter implements Filter {
    private ServletContext context;


    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
    }

        @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletResponse rp = (HttpServletResponse) servletResponse;
        HttpServletRequest rq = (HttpServletRequest) servletRequest;
        String uri = rq.getRequestURI();
        User user = (User) rq.getSession().getAttribute("userSession");
        if (uri.startsWith("/admin")) {
            User user1 = (User) rq.getSession().getAttribute("userSession");
            if (user != null) {
                if (user.getRole().equals("admin")){
                    filterChain.doFilter(servletRequest, servletResponse);
                } else if (user.getRole().equals("user")) {
                    rp.sendRedirect(rq.getContextPath() + "/login");
                }
            } else {
                rp.sendRedirect(rq.getContextPath() + "/login");
            }
        } else {
            filterChain.doFilter(servletRequest, servletResponse);
        }
    }

}
