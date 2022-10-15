package org.example.ssm.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginInterceptor implements HandlerInterceptor {
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        if (!(uri.contains("Login") || uri.contains("login") || uri.contains("register"))) {
            if (request.getSession().getAttribute("user") != null) {
                return true;
            } else {
                if (uri.contains("css") || uri.contains("js") || uri.contains("images")) {
                    return true;
                } else {
                    response.sendRedirect(request.getContextPath() +
                            "/user/toLogin.action");
                }
            }
        } else {
            return true;
        }

        return false;
    }
}