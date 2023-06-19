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

@WebServlet("/UpdateClubNoteServlet")
public class UpdateClubNoteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String note = req.getParameter("note");
        String club = req.getParameter("club");
        Connection conn = null;
        PreparedStatement statement = null;
        String sql = "update club set club_note=? where club_name=? ";
        try {
            conn = dbUtils.getConnection();
            statement = conn.prepareStatement(sql);
            statement.setString(1,note);
            statement.setString(2, club);
            statement.executeUpdate();
            resp.setHeader("Refresh", "3;url=/UserCenterServlet");
            resp.getWriter().write("<center>消息发布成功!! 3秒后自动返回...</center>");
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }finally {
            dbUtils.release(statement, conn);
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
