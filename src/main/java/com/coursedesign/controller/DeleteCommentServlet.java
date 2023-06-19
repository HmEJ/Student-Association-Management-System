package com.coursedesign.controller;

import com.coursedesign.dao.CommentDao;
import com.coursedesign.model.Comments;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/DeleteCommentServlet")
public class DeleteCommentServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CommentDao commentDao = new CommentDao();
        Comments comment = new Comments();
        int comment_id = Integer.parseInt(req.getParameter("comment_id"));
        comment.setComment_id(comment_id);
        commentDao.delete(comment);
        String referer = req.getHeader("referer"); //获取参数url
        // 重定向回原页面，并保留参数
        resp.sendRedirect(referer);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
