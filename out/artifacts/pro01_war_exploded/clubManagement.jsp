<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 25499
  Date: 2023/6/11 011
  Time: 16:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社团管理</title>
<%--    <link rel="stylesheet" href="css/clubManagement.css">--%>
    <script>
        window.onload = function(){
            var applyProcess = document.getElementById("applyProcess")
            var myframe = document.getElementById("myIframe");
            var comentManagement = document.getElementById("comentManagement");
            comentManagement.onclick = function(){
                myframe.src="comentManagement.jsp";
            }
            applyProcess.onclick = function(){
                myframe.src="applyProcess.jsp";
            }
        }
    </script>
    <style>
        body{
            margin: auto;
        }
        .head{
            background-color: rgb(74, 74, 74);
            height: 60px;
            width: 100%;
            border: 0px solid red;
            overflow: hidden;
            display: flex;
            flex-direction: row;
        }
        .logo{
            background-color: rgb(36, 55, 55);
            margin: 0;
            width: 20%;
            height: 100%;
            overflow: hidden;
        }
        .logotxt{
            margin-top: 5px;
            text-align: center;
            font-size: 30px;
            font-weight: bolder;
            color: white;
        }
        .user-info{
            margin-left: auto;
            width: 25%;
            /* background-color: aqua; */
            border: 0px solid red;
            display: flex;
            flex-direction: row;
        }
        .users{
            margin-top: 15px;
            text-align: center;
            font-size: 20px;
            color: white;
            border: 0px solid red;
        }
        .exit{
            border: 0px solid red;
            font-size: 10px;
            margin-top: 20px;
            margin-right: 10px;
            margin-left: auto;
        }
        a:link{
            color: white;
            text-decoration: none;
        }
        .container{
            display: flex;
            flex-direction: row;
            background-color: rgb(165, 236, 212);

            height: 90vh;
        }
        .left{
            background-color: rgb(36, 194, 205);
            width: 20%;
        }
        .comment{
            border: 0px solid red;
            text-align: center;
            /* margin-top: 30px; */
            padding: 5%;
        }
        .comment:hover{
            background-color:rgb(23, 160, 168);
            cursor: pointer;
        }

        .comment_text{
            color: white;
            font-size: 20px;
        }
        .right{
            background-color: rgb(230, 230, 230);
            width: 80%;
        }
        iframe{
            border: 1px solid red;
            width: 100%;
            height: 100%;
        }
    </style>
</head>
<body>
    <div class="head">
        <div class="logo">
            <div class="logotxt">
                社团管理系统
            </div>
        </div>
        <div class="user-info">
            <div class="users">
                <span>用户</span>
                <span><%=request.getSession().getAttribute("name")%></span>
                <%
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb-pro01","root","root");
                    PreparedStatement statement1 = conn.prepareStatement("select club_name from club,management where email=? and club.club_manager=management.`name`;");
                    String email = (String) request.getSession().getAttribute("email");
                    statement1.setString(1, email);
                    ResultSet rs = statement1.executeQuery();
                    while (rs.next()){
                        //有点问题
                %>
                <span>管理社团:<%=rs.getString("club_name")%></span>
                <%
                    }
                %>
            </div>
            <div class="exit">
                <a href="www.baidu.com">退出登录</a>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="left">
            <div class="comment" id="comentManagement">
                <div class="comment_text">留言管理</div>
            </div>
            <div class="comment" id="applyProcess">
                <div class="comment_text">申请受理</div>
            </div>
        </div>
        <div class="right">
            <iframe src="comentManagement.jsp" id="myIframe"></iframe>
        </div>
    </div>
</body>
</html>
