package com.coursedesign.controller;

import com.coursedesign.dao.userDao;
import com.coursedesign.model.UserBean;
import com.coursedesign.utils.dbUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println(System.getProperty("java.class.path"));
        req.setCharacterEncoding("utf-8");
        userDao userDao = new userDao();
        UserBean user = new UserBean();
        String name = req.getParameter("name");
        String telephone = req.getParameter("telephone");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        user.setName(name);
        user.setTelephone(telephone);
        user.setEmail(email);
        user.setPassword(password);
        userDao.insert(user);
        if (user!=null){
            resp.getWriter().write("<center>register success!</center>");
            resp.getWriter().write("<center> 3 sec to redirect!</center>");
            resp.setHeader("refresh","3,url=index.jsp");
        }else{
            resp.getWriter().write("<center>error!</center>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doGet(req, resp);
    }
}
