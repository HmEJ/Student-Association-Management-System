package com.coursedesign.controller;

import com.coursedesign.dao.ApplyDao;
import com.coursedesign.model.Apply;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RejectApply")
public class RejectApply extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int applyid = Integer.parseInt(req.getParameter("applyid"));
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
