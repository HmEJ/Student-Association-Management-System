<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.coursedesign.dao.ApplyDao" %><%--
  Created by IntelliJ IDEA.
  User: 25499
  Date: 2023/6/13 013
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        .container{
            background-color: white;
            margin-top: 4%;
            margin-left: 8%;
            margin-right: 8%;
            height: 80vh;
            overflow: auto;
            border-radius: 20px;
            box-shadow: 5px 5px #737272;
        }
        .title-text{
            margin-top: 10px;
            margin-left:10px ;
            font-weight: bold;
            font-size: 20px;
            border: 0px solid red;
        }
        table{
            border: 1px solid black;
            border-collapse: collapse;
            background-color: rgb(165, 236, 212);
            margin-top: 10px;
            margin-left: 40px;
            text-align: center ;
            width: 90%;
            table-layout: fixed;
        }
        table,
        table tr ,
        table td{
            border: 1px solid black;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="title-text">申请受理</div>
    <table class="table">
        <tr>
            <td>申请人</td>
            <td>申请时间</td>
            <td>申请人邮箱</td>
            <td>操作</td>
        </tr>
        <%
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb-pro01","root","root");
            PreparedStatement statement1 = conn.prepareStatement("select club_id from club,management where email=? and club.club_manager=management.`name`;");
            String email = (String) request.getSession().getAttribute("email");
            statement1.setString(1, email);
            ResultSet rs = statement1.executeQuery();
            while (rs.next()){
                int clubid= rs.getInt(1);  //用户所管理的俱乐部的id 和 留言中的俱乐部id

                ApplyDao applyDao = new ApplyDao();
                applyDao.getApplyByClubIds(clubid);
                PreparedStatement statement2 = conn.prepareStatement("SELECT * FROM `apply` where applyclub = ?");
                statement2.setInt(1, clubid);
                ResultSet rs2 = statement2.executeQuery();
                while (rs2.next()){
        %>
        <tr>
            <td><%=rs2.getString("applyname")%></td>
            <td><%=rs2.getTime("applytime")%></td>
            <td><%=rs2.getString("applyemail")%></td>
            <td><a href="AcceptApply?applyid=<%=rs2.getInt("applyid")%>">同意</a>
                <a href="RejectApply?applyid=<%=rs2.getInt("applyid")%>">忽略</a>
            </td>
        </tr>
        <%
                }
            }
        %>


    </table>
</div>
</body>
</html>
