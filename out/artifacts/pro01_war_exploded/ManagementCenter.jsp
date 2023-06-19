<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.coursedesign.utils.dbUtils" %><%--
  Created by IntelliJ IDEA.
  User: 25499
  Date: 2023/6/19 019
  Time: 12:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户中心</title>
    <style>
        body{
            background-color: #d2d2d2;
            margin: auto;
        }
        .top{
            border: 0px solid red;
            text-align: center;
            margin-left: 40%;
            margin-right: 40%;
            padding: 5px;
            height: 50px;
            background-color: rgb(165, 236, 212);
            border-radius: 15px;
        }
        .top div{
            font-size: 30px;
            font-weight: bolder;
            color: #3d3d3b;
        }
        .content{
            background-color: #f4f4f4;
            height: 85%;
            width: 95%;
            margin-left: 45px;
            display: flex;
            flex-direction: column;
            border-radius: 15px;
        }
        .content-top{
            text-align: center;
            border:0px solid red;
            background-color: #e6e6e6;
            border-radius: 15px 15px 0 0;
        }
        .content-2{
            background-color: white;
            display: flex;
            flex-direction: row;
            height: 100%;
            border: 0px solid red;
            border-radius: 15px;
        }
        .content-2-member{
            border: 0px solid red;
            width: 30%;
            background-color: #81d1dc;
            border-radius: 0 0 0 15px;
            overflow: auto;
        }
        table{
            border-collapse: collapse;
            width: 100%;
        }
        table tr td{
            border: 1px solid black;
        }
        table th{
            text-align: center;
        }
        .nmtd{
            width: 15%;
        }
        .emtd{
            width: 30%
        }
        .teltd{
           width:  30%
        }
        .optd{
            width: 15%;
        }
        .content-2-info{
            text-align: center;
            background-color: #a4de9d;
            width: 20%;
        }
        .content-2-clubinfo{
            width: 50%;
            background-color: #dae077;
            border-radius: 0 0 15px 0;
        }
        textarea{
            margin-left: 40%;
            resize: none;
            width: 300px;
            height: 200px;

        }
        input{
            margin-left: 40%;
        }
        #club-info{
            text-align: center;
        }
    </style>
</head>
<body>
    <section class="top">
        <div>个人中心</div>
    </section>
    <section class="content">
        <%
            Connection conn = dbUtils.getConnection();
            String sql1 = "select * from management where email=?";
            PreparedStatement statement1 = conn.prepareStatement(sql1);
            statement1.setString(1, (String) request.getSession().getAttribute("email"));
            ResultSet rs1 = statement1.executeQuery();
            while (rs1.next()){
                String name = rs1.getString("name");
                String socialClub = rs1.getString("management");
                String sql2 = "SELECT COUNT(*) AS member_count FROM users WHERE socialClub = ?; ";
                PreparedStatement statement2 = conn.prepareStatement(sql2);
                statement2.setString(1, socialClub);
                ResultSet rs2 = statement2.executeQuery();
                while (rs2.next()){
                    String count = rs2.getString(1);
        %>
            <div class="content-top">
                欢迎: <%=name%>
                您管理的社团是: <%=socialClub%>
                社团人数: <%=count%> (包括您自己)
            </div>
        <%
                }
            }
        %>

        <div class="content-2">
            <div class="content-2-member">
                <table>
                    <th>成员表</th>
                    <tr>
                        <td class="nmtd">姓名</td>
                        <td class="emtd">邮箱</td>
                        <td class="teltd">电话</td>
                        <td class="optd">操作</td>
                    </tr>
                    <%
                        String sql3 = "select * from users where email=?";
                        PreparedStatement statement3 = conn.prepareStatement(sql3);
                        statement3.setString(1, (String) request.getSession().getAttribute("email"));
                        ResultSet rs3 = statement3.executeQuery();
                        while (rs3.next()){
                            String club = rs3.getString("socialClub");
                            String sql4 = "select * from users where socialClub=?";
                            PreparedStatement statement4 = conn.prepareStatement(sql4);
                            statement4.setString(1, club);
                            ResultSet rs4 = statement4.executeQuery();
                            while (rs4.next()){
                                String memberEmail = rs4.getString("email");
                                if (request.getSession().getAttribute("email").equals(memberEmail)){
                                    continue;
                                }
                    %>
                        <tr>
                            <td><%=rs4.getString("name")%></td>
                            <td><%=rs4.getString("email")%></td>
                            <td><%=rs4.getString("telephone")%></td>
                            <td><a href="/UsersManagementServlet?email=<%=rs4.getString("email")%>">踢出</a></td>
                        </tr>
                    <%
                            }
                        }

                    %>
                </table>
            </div>
            <div class="content-2-info">
                <%
                    String sql5 = "select * from users where email=?";
                    PreparedStatement statement5 = conn.prepareStatement(sql5);
                    statement5.setString(1, (String) request.getSession().getAttribute("email"));
                    ResultSet rs5 = statement5.executeQuery();
                    while (rs5.next()){
                %>
                    个人信息 <br>
                    姓名:<%=rs5.getString("name")%><br>
                    邮箱:<%=rs5.getString("email")%> <br>
                    电话:<%=rs5.getString("telephone")%> <br>
                <%
                    }
                %>

                <a href="UpdateInfo.jsp">修改个人信息</a>
            </div>
            <div class="content-2-clubinfo">
                <table>
                    <th>发布社团信息:</th>
                </table>
                <%
                    String sql8 = "select * from users where email=?";
                    PreparedStatement statement8 = conn.prepareStatement(sql8);
                    statement8.setString(1, (String) request.getSession().getAttribute("email"));
                    ResultSet rs8 = statement8.executeQuery();
                    while (rs8.next()){
                        String socialClub = rs8.getString("socialClub");
                %>
                <form action="/UpdateClubNoteServlet?club=<%=socialClub%>" class="textarea-container" method="post" accept-charset="UTF-8">
                    <textarea placeholder="请输入不超过70字" name="note"></textarea> <br>
                    <input type="submit" value="发布">
                </form>
                <%
                    }
                %>
                <table>
                    <th>社团信息:</th>
                </table>
                <%
                    String sql6 = "select * from management where email=?";
                    PreparedStatement statement6 = conn.prepareStatement(sql6);
                    statement6.setString(1, (String) request.getSession().getAttribute("email"));
                    ResultSet rs6 = statement6.executeQuery();
                    while (rs6.next()){
                        String club = rs6.getString("management");
                        String sql7 ="select * from club where club_name=?";
                        PreparedStatement statement7 = conn.prepareStatement(sql7);
                        statement7.setString(1,club);
                        ResultSet rs7 = statement7.executeQuery();
                        while (rs7.next()){
                %>
                    <div id="club-info">
                        <%=rs7.getString("club_note")%>
                    </div>
                <%
                        }
                    }
                %>

            </div>
        </div>
    </section>
</body>
</html>
