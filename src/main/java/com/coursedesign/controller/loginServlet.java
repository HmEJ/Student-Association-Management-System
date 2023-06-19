package com.coursedesign.controller;

import com.coursedesign.model.UserBean;
import com.coursedesign.service.userService;
import com.mysql.cj.Session;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
    userService userService = new userService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserBean user = null;
        user = userService.selectByEmail(email);
        response.setContentType("text/html;charset=utf-8");

        if (password.equals(user.getPassword())){
            response.setCharacterEncoding("utf-8");
            response.sendRedirect("/home.jsp");             //密码正确重定向到home
            HttpSession session = request.getSession();            //获取客户端session
            session.setAttribute("name", user.getName());   //将姓名存入session
            session.setAttribute("email", user.getEmail());
            Cookie cookie=new Cookie("JESSIONID", session.getId());
            cookie.setMaxAge(60*30);   //可存活30分钟  单位s   60 s = 1 min   1min*30 = 30 min
            cookie.setPath("/pro01");  //设置路径，可在同一服务器内共享cookie
            response.addCookie(cookie);
        }else {
            response.setCharacterEncoding("utf-8");
            response.getWriter().write("    <div style=\"font-size: 30px;text-align: center;color: red;\">\n" +
                    "密码错误!5秒后将跳转到首页...\n" +
                    "    </div>");
            response.setHeader("Refresh", "5;url=index.jsp");
            response.getWriter().write("    <div style=\"font-size: 20px;text-align: center;color: black;\">\n" +
                    "无法跳转?<a href='/index.jsp'>点我强制跳转</a>  \n" +
                    "    </div>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
