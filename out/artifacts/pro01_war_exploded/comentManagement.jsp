<%@ page import="java.sql.*" %>
<%@ page import="com.coursedesign.dao.CommentDao" %><%--
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
<%--    <link rel="stylesheet" href="css/comentManagement.css">--%>
    <style>
        body{
            background-color: #e6e6e6;
        }
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
            width: 80%;
            table-layout: fixed;
        }
        table,
        table tr ,
        table td{
            border: 1px solid black;
        }

        a:link{
            color: red;
            text-decoration: none;
        }
        a:hover{
            color: white;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title-text">留言管理</div>
        <table class="table">
            <tr>
                <td>留言内容</td>
                <td>留言时间</td>
                <td>留言者</td>
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
                        /**
                         * 从留言表获取到的club_id  这个id要与登录用户管理的club_id比较 只展示相同的
                         */
                    CommentDao commentDao = new CommentDao();
                    commentDao.getCommentsByClubIds(clubid);
                    PreparedStatement statement2 = conn.prepareStatement("SELECT * FROM `comments` where club_id = ?");
                    statement2.setInt(1, clubid);
                    ResultSet rs2 = statement2.executeQuery();
                    while (rs2.next()){
            %>
            <tr>
                <td><%=rs2.getString("comment")%></td>
                <td><%=rs2.getTime("time")%></td>
                <td><%=rs2.getString("userName")%></td>
                <td><a href="DeleteCommentServlet?comment_id=<%=rs2.getInt("comment_id")%>">删除</a></td>
            </tr>
       <%
                }
               }
           %>


        </table>
    </div>
</body>
</html>
