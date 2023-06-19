package com.coursedesign.dao;

import com.coursedesign.model.UserBean;
import com.coursedesign.utils.dbUtils;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class userDao {
//    增加
    public boolean insert(UserBean user) {
        Connection conn = null;
        PreparedStatement statement =null;
        ResultSet rs = null;
        try {
            // 获得数据的连接
            conn = dbUtils.getConnection();
            // 发送SQL语句
            String sql = "insert into users(name,telephone,email,password) values(?,?,?,?);";
//           获取 PreparedStatement对象
            statement=conn.prepareStatement(sql);
            statement.setString(1, user.getName());
            statement.setString(2, user.getTelephone());
            statement.setString(3, user.getEmail());
            statement.setString(4, user.getPassword());
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


//    查询
    public ArrayList<UserBean> findAll() {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ArrayList<UserBean> list = new ArrayList<UserBean>();
        try {
            // 获得数据的连接
            conn = dbUtils.getConnection();
            // 获得Statement对象
            stmt = conn.createStatement();
            // 发送SQL语句
            String sql = "SELECT * FROM users;";
            rs = stmt.executeQuery(sql);
            // 处理结果集
            while (rs.next()) {
                UserBean user = new UserBean();
                user.setName(rs.getString("name"));
                user.setTelephone(rs.getString("telephone"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                list.add(user);
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtils.release(rs, stmt, conn);
        }
        return null;
    }

//    邮箱唯一识别查找
    public UserBean selectByEmail(String email){
        ResultSet rs = null;
        Connection conn = null;
        PreparedStatement statement = null;
        UserBean user = new UserBean();

        try {
            conn = dbUtils.getConnection();
            statement=conn.prepareStatement("select * from users where email=?");
            statement.setString(1, email);
            rs=statement.executeQuery();
            while(rs.next()){
                user.setName(rs.getString(1));
                user.setTelephone(rs.getString(2));
                user.setEmail(rs.getString(3));
                user.setPassword(rs.getString(4));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }finally {
            dbUtils.release(rs, statement, conn);
        }
        return user;
    }
    public void updateClub(String email,String club){
        ResultSet rs = null;
        Connection conn = null;
        PreparedStatement statement = null;

        try {
            conn = dbUtils.getConnection();
            String sql = "update users set socialClub=? where email=?";
            statement= conn.prepareStatement(sql);
            statement.setString(1, club);
            statement.setString(2, email);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

