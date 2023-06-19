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
import java.sql.SQLException;

@WebServlet("/clubapplyservlet")
public class ClubApplyServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PreparedStatement statement = null;
        Connection conn = null;
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=UTF-8");
        String name = req.getParameter("name");
        String phone = req.getParameter("phone");
        String clubname = req.getParameter("clubname");
        String email = req.getParameter("email");
        String applyReason = req.getParameter("applyreason");
        try {
            conn = dbUtils.getConnection();
            String sql = "insert into clubapply(name,phone,clubname,email,applyreason) values (?,?,?,?,?)";
            statement = conn.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, phone);
            statement.setString(3, clubname);
            statement.setString(4, email);
            statement.setString(5, applyReason);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } finally {
            dbUtils.release(statement, conn);
        }
        resp.getWriter().write("我们已经收到了您的请求,会尽快审核,请关注您的邮箱或电话! <br>");
        resp.getWriter().write("<a href='home.jsp'>点此跳转到首页</a>");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
