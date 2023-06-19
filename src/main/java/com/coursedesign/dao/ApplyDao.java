package com.coursedesign.dao;

import com.coursedesign.model.Apply;
import com.coursedesign.model.Comments;
import com.coursedesign.utils.dbUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ApplyDao {
    public boolean insert(Apply apply) {
        Connection conn = null;
        PreparedStatement statement =null;
        ResultSet rs = null;
        try {
            // 获得数据的连接
            conn = dbUtils.getConnection();
            // 发送SQL语句
            String sql = "insert into apply(applytime,applyemail,applyclub) values(?,?,?);";
//           获取 PreparedStatement对象
            statement=conn.prepareStatement(sql);
//            statement.setString(1, apply.getApplyname());
            statement.setObject(1, apply.getApplytime());
            statement.setString(2, apply.getApplyemail());
            statement.setInt(3, apply.getApplyclub());
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
    public boolean delete(Apply apply){
        Connection conn = null;
        PreparedStatement statement =null;
        ResultSet rs = null;

        try {
            conn=dbUtils.getConnection();
            String sql = "delete from apply where applyid =?  ";
            statement = conn.prepareStatement(sql);
            statement.setInt(1, apply.getApplyid());
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

    //根据email获取姓名
    public String getNameByEmail(String email){
        Connection conn = null;
        PreparedStatement statement =null;
        ResultSet rs = null;
        String name = null;
        try {
            conn  = dbUtils.getConnection();
            String sql = "SELECT * from users where email = ?;";
            statement= conn.prepareStatement(sql);
            statement.setString(1, email);
            rs=statement.executeQuery();
            if (rs != null) {
                while (rs.next()){
                    name = rs.getString("name");
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }finally {
            dbUtils.release(rs, statement, conn);
        }
        return name;
    }
//    根据俱乐部id获取申请
    public void getApplyByClubIds(int club_id){
        Connection conn = null;
        PreparedStatement statement =null;
        ResultSet rs = null;
        try {
            // 获得数据的连接
            conn = dbUtils.getConnection();
            // 发送SQL语句
            String sql = "SELECT * FROM `apply` where applyclub = ?";
//           获取 PreparedStatement对象
            statement=conn.prepareStatement(sql);
            statement.setInt(1, club_id);
            statement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            dbUtils.release(rs, statement, conn);
        }
    }
}
