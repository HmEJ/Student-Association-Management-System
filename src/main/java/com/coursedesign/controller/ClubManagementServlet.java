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

@WebServlet("/ClubManagementServlet")
public class ClubManagementServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = (String) req.getSession().getAttribute("name");
        ResultSet rs = null;
        PreparedStatement statement = null;
        Connection conn = null;
        try {
            conn = dbUtils.getConnection();
            String sql = "select * from management where name = ?";
            statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            rs = statement.executeQuery();
            if (rs.next()){
                resp.sendRedirect("/clubManagement.jsp");
            }else{
                resp.setContentType("text/html;charset=utf-8");
                resp.getWriter().write("<center>对不起,您不是社团管理员,无法使用此模块!!</center>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            dbUtils.release(rs, statement, conn);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
