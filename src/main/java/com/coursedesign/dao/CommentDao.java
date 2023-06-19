package com.coursedesign.dao;

import com.coursedesign.model.Comments;
import com.coursedesign.utils.dbUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDao {
    public boolean insert(Comments comments) {
        Connection conn = null;
        PreparedStatement statement =null;
        ResultSet rs = null;
        try {
            // 获得数据的连接
            conn = dbUtils.getConnection();
            // 发送SQL语句
            String sql = "insert into comments(comment,time,userName,club_id) values(?,?,?,?);";
//           获取 PreparedStatement对象
            statement=conn.prepareStatement(sql);
            statement.setString(1, comments.getComment());
            statement.setObject(2, comments.getTime());
            statement.setString(3, comments.getUserName());
            statement.setInt(4, comments.getClub_id());
            int num = statement.executeUpdate();
            if (num > 0) {
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtils.release(rs, statement, conn);
        }
        return false;
    }

    //删除评论
    public boolean delete(Comments comments){
        Connection conn = null;
        PreparedStatement statement =null;
        ResultSet rs = null;

        try {
            conn=dbUtils.getConnection();
            String sql = "delete from comments where comment_id =?  ";
            statement = conn.prepareStatement(sql);
            statement.setInt(1, comments.getComment_id());
            int num = statement.executeUpdate();
            if (num > 0) {
                return true;
            }
            return false;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }finally {
            dbUtils.release(rs, statement, conn);
        }
        return false;
    }

    public void getCommentsByClubIds(int clubIds) {
//        "SELECT * FROM `comments` where club_id = ?"
        // 使用 clubIds 查询对应社团的留言数据的逻辑
        // 这可能涉及与数据库的交互或其他数据源的查询操作
        Connection conn = null;
        PreparedStatement statement =null;
        ResultSet rs = null;
        try {
            // 获得数据的连接
            conn = dbUtils.getConnection();
            // 发送SQL语句
            String sql = "SELECT * FROM `comments` where club_id = ?";
//           获取 PreparedStatement对象
            statement=conn.prepareStatement(sql);
            statement.setInt(1, clubIds);
            statement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtils.release(rs, statement, conn);
        }
    }
}
