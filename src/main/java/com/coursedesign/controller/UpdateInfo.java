package com.coursedesign.controller;

import com.coursedesign.utils.dbUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/UpdateInfo")
public class UpdateInfo extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String email = req.getParameter("email");
        String telephone = req.getParameter("phone");
        String name = req.getParameter("name");
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs= null;
        String sql = "update users set email=?,telephone=?,name=? where email=?";
        try {
            conn = dbUtils.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, telephone);
            statement.setString(3, name);
            statement.setString(4, (String) req.getSession().getAttribute("email"));
            statement.executeUpdate();
            req.getSession().setAttribute("email", email);
            req.getSession().setAttribute("name", name);
            resp.setHeader("Refresh", "3;url=/UserCenterServlet");
            resp.getWriter().write("<center>修改成功!! 3秒后自动返回...</center>");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
