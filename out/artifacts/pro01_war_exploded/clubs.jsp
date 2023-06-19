<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  User: 25499
  Date: 2023/6/9 009
  Time: 20:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<%--    <link rel="stylesheet" type="text/css" href="css/clubs.css">--%>
    <title>社团列表</title>
    <style>
        body{
            background-color: rgba(211, 211, 211);
        }
        .table_container{
            border: 0px solid red;
            text-align: center;
            margin:0 10% ;
            height: 100%;
        }
        table{
            border: 1px solid black;
            border-collapse: collapse;
            background-color: #eacaf1;
            margin: 0px auto;
            width: 100%;
            table-layout: fixed;

        }
        table tr td{
            border: 1px solid black;
            padding: 3px;
            text-align: center;

            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;

        }
        table tr:nth-child(even){
            background: #ccc;
        }
        #tr1{
            background-color: rgb(165, 236, 212);
            font-weight: bold;
        }
        #td1{
            width: 10%;
        }
        #td2{
            width: 70%;
        }
        #td3{
            width: 10%;
        }
        #td4{
            width: 10%;
        }
    </style>
</head>
<body>

    <div class="table_container">
        <table>
            <tr id="tr1">
                <td id="td1">社团名</td>
                <td id="td2">社团信息</td>
                <td id="td3">社团主席</td>
                <td id="td4">操作</td>
            </tr>
            <%
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb-pro01","root","root");
                Statement statement = conn.createStatement();
                String sql = "SELECT * FROM `club`";
                ResultSet rs = statement.executeQuery(sql);
                while(rs.next()){
            %>
                <tr>
                <td><%=rs.getString("club_name")%></td>
                <td><%=rs.getString("club_note")%></td>
                <td><%=rs.getString("club_manager")%></td>
                <td> <a  href="clubDetails.jsp?club_id=<%=rs.getString("club_id")%>" target="_blank">了解详情</a> </td>
                </tr>
            <%
                }
            %>
        </table>
    </div>
</body>
</html>
