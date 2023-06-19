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

@WebServlet("/UpdatePasswordServlet")
public class UpdatePasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=utf-8");
        req.setCharacterEncoding("utf-8");
        String newPassword = req.getParameter("newpassword");
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String sql = "update users set password =? where email = ?";
        try {
            conn = dbUtils.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, newPassword);
            statement.setString(2, (String) req.getSession().getAttribute("email"));
            statement.executeUpdate();
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
