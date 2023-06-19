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

@WebServlet("/UsersManagementServlet")
public class UsersManagementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String sql = "update users set socialClub = null where email=? ";
        try {
            conn=dbUtils.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            dbUtils.release(rs, statement, conn);
        }
        resp.setContentType("text/html;charset=utf-8");
        resp.setHeader("Refresh", "3;url=ManagementCenter.jsp");
        resp.getWriter().write("<center>操作成功! <br> 3秒后返回... </center>");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
