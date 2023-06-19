package com.coursedesign.controller;

import com.coursedesign.model.UserBean;
import com.coursedesign.utils.dbUtils;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebFilter("/*")
public class isLogFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;
        String uri = request.getRequestURI();
        if (uri.endsWith("index.jsp")||uri.endsWith(".css")||uri.endsWith(".js")||uri.contains("Servlet")||uri.contains("Apply")){
            filterChain.doFilter(request, response);
            return;
        }
        response.setContentType("text/html;charset=utf-8");
        String userName= (String) request.getSession().getAttribute("name");
        if (userName==null||userName==""){
            response.getWriter().write("<div style='font-size: 30px;text-align: center;color: red;'>您还未登录,请先<a href='index.jsp'>登录</a> </div>");
            return;
        }
        filterChain.doFilter(request, response);
//        Object user = request.getSession().getAttribute("name");
//        if (user!=null){
//            filterChain.doFilter(request, response);
//        }else{
//            response.getWriter().write("<div style='font-size: 30px;text-align: center;color: red;'>请先<a href='index.jsp'>登录</a>!</div>");
//        }
    }
    @Override
    public void destroy() {

    }
}
