package com.coursedesign.controller;

import com.coursedesign.dao.ApplyDao;
import com.coursedesign.dao.userDao;
import com.coursedesign.model.Apply;
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

@WebServlet("/AcceptApply")
public class AcceptApply extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        int applyid = Integer.parseInt(req.getParameter("applyid")); //唯一标识一个apply
        int clubid  = 0;
        String socialclub = null;
        String email = null;
        try {
            /**
             * 根据申请id 获得 申请人申请的俱乐部id   根据申请的俱乐部id  获取俱乐部名 将俱乐部名更新到 users表中
             */
            conn  = dbUtils.getConnection() ;
            String sql  = "select * from apply where `applyid` = ?";
            statement = conn.prepareStatement(sql);
            statement.setInt(1, applyid);
            rs=statement.executeQuery();
            while (rs.next()){
                PreparedStatement statement1=null;
                ResultSet rs1 = null;
                email = rs.getString("applyemail");
                clubid = rs.getInt("applyclub");
                String sql2  = "select * from club where club_id = ?";
                statement1 = conn.prepareStatement(sql2);
                statement1.setInt(1, clubid);
                rs1 = statement1.executeQuery();
                while (rs1.next()){
                    socialclub=rs1.getString("club_name");
                    userDao userDao = new userDao();
                    userDao.updateClub(email, socialclub);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }finally {
            dbUtils.release(rs, statement, conn);
        }
        ApplyDao applyDao= new ApplyDao();
        Apply apply = new Apply();
        apply.setApplyid(applyid);
        applyDao.delete(apply);

        String referer = req.getHeader("referer"); //获取参数url
        // 重定向回原页面，并保留参数
        resp.sendRedirect(referer);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
