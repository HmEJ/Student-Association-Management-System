package com.coursedesign.controller;

import com.coursedesign.dao.CommentDao;
import com.coursedesign.model.Comments;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

@WebServlet("/commentServlet")
public class commentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        String name = req.getSession().getAttribute("name").toString();
        String comments = req.getParameter("comments");
        String club_id = req.getParameter("club_id");
        LocalDateTime currentTime = LocalDateTime.now();


        if (comments == null || comments.trim().isEmpty()){
            String errorMessage = "留言不能为空！";
            req.getSession().setAttribute("errorMessage", errorMessage);
            resp.sendRedirect("clubDetails.jsp?club_id=" + club_id);
        }else{
            Comments comment = new Comments();
            CommentDao commentDao = new CommentDao();
            comment.setComment(comments);
            comment.setClub_id(Integer.parseInt((club_id)));
            comment.setTime(currentTime);
            comment.setUserName(name);
            commentDao.insert(comment);
            if(comment!=null){
                String referer = req.getHeader("referer"); //获取参数url
                // 重定向回原页面，并保留参数
                resp.sendRedirect(referer);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
