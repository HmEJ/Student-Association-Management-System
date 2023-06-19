package com.coursedesign.controller;

import com.coursedesign.dao.ApplyDao;
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
import java.time.LocalDateTime;

@WebServlet("/ApplyProcessServlet")
public class ApplyProcessServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String email =  req.getParameter("email");
        int club_id = Integer.parseInt(req.getParameter("club_id"));
        Apply apply = new Apply();
        ApplyDao applyDao = new ApplyDao();
        LocalDateTime currentTime = LocalDateTime.now();
//        String name = null;
//        Connection conn = null;
//        PreparedStatement statement = null;
//        ResultSet rs = null;
//        try {
//            conn= dbUtils.getConnection();
//            String sql ="select name from users where email =?";
//            statement= conn.prepareStatement(sql);
//            statement.setString(1, email);
//            statement.executeQuery();
//            while (rs.next()){
//                name=rs.getString("name");
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }

        apply.setApplyemail(email);
        apply.setApplytime(currentTime);
        apply.setApplyclub(club_id);
//        String name = applyDao.getNameByEmail(email);
//        apply.setApplyname(name);
        applyDao.insert(apply);
        String referer = req.getHeader("referer"); //获取参数url
        // 重定向回原页面，并保留参数
        resp.sendRedirect(referer);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
