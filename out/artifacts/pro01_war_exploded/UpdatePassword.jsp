<%@ page import="java.sql.Connection" %>
<%@ page import="com.coursedesign.utils.dbUtils" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: 25499
  Date: 2023/6/19 019
  Time: 16:50
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
            margin-left: 35%;
            width: 30%;
        }
        form div{
            margin-left: 10%;
        }
    </style>
    <script>
        function validateForm(){
            var oldPasswordInput = document.getElementById("oldpassword");
            var newPasswordInput = document.getElementById("newpassword");
            var confirmPasswordInput = document.getElementById("confirmpassword");
            var dbPasswordInput = document.getElementById("dbPassword");

            var oldPassword = oldPasswordInput.value;
            var newPassword = newPasswordInput.value;
            var confirmPassword = confirmPasswordInput.value;
            var dbPassword = dbPasswordInput.value;
            if (oldPassword !== dbPassword){
                alert("旧密码不正确!");
                oldPasswordInput.focus();
                return false; // 阻止表单提交
            }
            if (newPassword !== confirmPassword) {
                alert("新密码和确认新密码不匹配");
                confirmPasswordInput.focus();
                return false; // 阻止表单提交
            }
        }
        function togglePasswordVisibility(passwordFieldId) {
            var passwordField = document.getElementById(passwordFieldId);
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
            } else {
                passwordField.type = 'password';
            }
        }

    </script>
</head>
<body>
<form action="/UpdatePasswordServlet" method="post" onsubmit="return validateForm()">
    <%
        Connection conn = dbUtils.getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        String sql = "select * from users where email = ?";
        statement = conn.prepareStatement(sql);
        statement.setString(1, (String) request.getSession().getAttribute("email"));
        rs = statement.executeQuery();
        while (rs.next()){
            String dbPassword = rs.getString("password");
    %>
        <input type="hidden" name="dbPassword" id="dbPassword" value="<%= dbPassword %>">
    <%
        }
    %>
    <div>
        原密码: <input type="password" name="oldpassword" id="oldpassword">   <input type="checkbox" onclick="togglePasswordVisibility('oldpassword')">显示密码<br>
        新密码: <input type="password" name="newpassword" id="newpassword">  <input type="checkbox" onclick="togglePasswordVisibility('newpassword')">显示密码<br>
        确认新密码: <input type="password" name="confirmpassword" id="confirmpassword">  <input type="checkbox" onclick="togglePasswordVisibility('confirmpassword')">显示密码<br>
        <input type="submit" value="提交">
    </div>
</form>

</body>
</html>
