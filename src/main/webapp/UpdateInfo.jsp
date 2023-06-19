<%@ page import="java.sql.Connection" %>
<%@ page import="com.coursedesign.utils.dbUtils" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 25499
  Date: 2023/6/19 019
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        form{
            margin-top: 10%;
            background-color: #d2d2d2;
            margin-left: 40%;
            width: 20%;
        }
        form div{
            margin-left: 20%;
        }
    </style>
</head>
<body>
    <form action="/UpdateInfo" method="post">
        <%
            Connection conn = dbUtils.getConnection();
            PreparedStatement statement =  null;
            ResultSet rs = null;
            String email = (String) request.getSession().getAttribute("email");
            String sql = "select * from users where email = ?";
            statement = conn.prepareStatement(sql);
            statement.setString(1,email);
            rs = statement.executeQuery();
            while (rs.next()){
        %>
            <div>
                姓名: <input type="text" name="name" value="<%=rs.getString("name")%>"><br>
                邮箱: <input type="text" name="email" value="<%=rs.getString("email")%>"> <br>
                电话: <input type="text" name="phone" value="<%=rs.getString("telephone")%>"> <br>
                <input type="submit" value="提交">
                <a href="UpdatePassword.jsp">修改密码</a>
            </div>
        <%
            }
        %>

    </form>

</body>
</html>
