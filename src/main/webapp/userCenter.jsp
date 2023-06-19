<%@ page import="java.sql.*" %>
<%@ page import="com.coursedesign.utils.dbUtils" %><%--
  Created by IntelliJ IDEA.
  User: 25499
  Date: 2023/6/11 011
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
            height:80%;
            width: 80%;
            margin-left: 10%;
            border-radius: 15px;
            border: 0px solid red;
            display: flex;
            flex-direction: row;
        }
        .baseInfo{
            width: 26%;
            border: 0px solid red;
        }

        .text{
            font-size: 20px;
            font-weight: bold;

        }
        .content-info{
            border: 0px solid red;
            width: 83%;
            height: 83%;
            margin: 10% 10%;
            border-radius: 15px;
            background-color: #e6e6e6;
            overflow: auto;
        }
        .content-info div{
            margin-top: 50px;
            margin-left: 20px;
            border: 0px solid red;
            width: 80px;
        }
        .applyInfo{
            width: 30%;
            border: 0px solid red;
        }
        .applyTitle{
            background-color: #e6e6e6;
            width: 50%;
            height: 60px;
            border-radius: 15px;
            text-align: center;
            margin-top:15px ;
            margin-left: 85px;
        }
        #111{
            margin-top: 10px;
        }
        #clubApplyInfo{
            background-color: #e6e6e6;
            margin-top: 10px;
            width: 83%;
            height: 75%;
            margin-left: 10%;
            border-radius: 15px;
            overflow: auto;
            /*display: flex;*/
        }
        table{
            margin-right: 10px;
            margin-top: 15px;
            border-collapse: collapse;
            width: 100%;
        }
        table tr td{
            border: 1px solid black;
            text-align: center;
            overflow: auto;
        }
        #clubInfo{
            width: 50%;
            border: 0px solid red;
        }
        #clubtitle{
            background-color: #e6e6e6;
            width: 50%;
            height: 60px;
            border-radius: 15px;
            text-align: center;
            margin-top:15px ;
            margin-left: 85px;
        }
        #myclub{
            margin-left: 50px;
            margin-top: 25px;
            display: flex;
            flex-direction: row;
        }
        #myclub_son{
            background-color: rgb(165, 236, 212);
            margin-left: 50px;
            width: 250px;
            text-align: center;
            border-radius: 15px;
        }
        #clubchef{
            margin-left: 50px;
            display: flex;
            flex-direction: row;
        }
        #clubchef_son{
            background-color: rgb(165, 236, 212);
            margin-left: 50px;
            width: 250px;
            text-align: center;
            border-radius: 15px;
        }
        #clubbbb{
            margin-left: 50px;
        }
        .infocontent{
            margin-right: 50px;
            border-radius: 15px;
            height: 350px;
            background-color: rgb(165, 236, 212);
        }
    </style>
</head>
<body>
    <section class="top">
        <div>个人中心</div>
    </section>
    <section class="content">
        <div class="baseInfo text">
            <div class="content-info">
                <%
                    Connection conn = dbUtils.getConnection();
                    String email = (String) request.getSession().getAttribute("email");
                    String sql5 = "select * from users where email = ?";
                    PreparedStatement statement5 = conn.prepareStatement(sql5);
                    statement5.setString(1, email);
                    ResultSet rs5 = statement5.executeQuery();
                    while (rs5.next()){
                %>
                    <div>姓名: <%=rs5.getString("name")%></div>
                    <div>手机号:<%=rs5.getString("telephone")%></div>
                    <div>邮箱:<%=email%></div>
                    <a href="UpdateInfo.jsp">修改个人信息</a>
                <%
                    }
                %>


            </div>
        </div>
        <div class="applyInfo">
            <div class="applyTitle text">
                <div id="111">我的留言</div>
            </div>
            <div id="clubApplyInfo">
                <table>
                    <tr>
                        <td>留言内容</td>
                        <td>留言时间</td>
                        <td>社团</td>
                    </tr>
                    <%
                        //在comments表中根据用户名查找俱乐部id 根据俱乐部id 获取俱乐部名
                        int clubid= 0;
                        String name= (String) request.getSession().getAttribute("name");
                        String sql = "SELECT * FROM comments where userName=?";
                        PreparedStatement statement = conn.prepareStatement(sql);
                        statement.setString(1, name);
                        ResultSet rs = statement.executeQuery();
                        while(rs.next()){
                            clubid = rs.getInt("club_id");
                            String sql2 = "select * from club where club_id =?";
                            PreparedStatement statement2 = conn.prepareStatement(sql2);
                            statement2.setInt(1, clubid);
                            ResultSet rs2 = statement2.executeQuery();
                            while (rs2.next()){
                    %>
                    <tr>
                        <td><%=rs.getString("comment")%></td>
                        <td><%=rs.getTime("time")%></td>
                        <td><%=rs2.getString("club_name")%></td>
                    </tr>
                    <%
                        }
                    }
                    %>
                </table>
            </div>
        </div>
        <div id="clubInfo">
            <div id="clubtitle" class="text">社团信息</div>
            <%
                String socialClub = null;
                String sql3 = "SELECT * FROM users where email=?";
                PreparedStatement statement3 = conn.prepareStatement(sql3);
                statement3.setString(1, email);
                ResultSet rs3 = statement3.executeQuery();
                while (rs3.next()){
                    socialClub = rs3.getString("socialClub");
                    String sql4 = "select * from club where club_name = ?";
                    PreparedStatement statement4 = conn.prepareStatement(sql4);
                    statement4.setString(1, socialClub);
                    ResultSet rs4 = statement4.executeQuery();
                    while (rs4.next()){
            %>
                <div class="text" id="myclub">加入的社团:
                    <div id="myclub_son">
                        <%=socialClub%>
                    </div>
                </div>
                <div class="text" id="clubchef" >社团主席:
                    <div id="clubchef_son">
                        <%=rs4.getString("club_manager")%>
                    </div>
                </div>
                <div class="text" id="clubbbb">社团简介:
                    <div class="infocontent">
                        <%=rs4.getString("club_note")%>
                    </div>
                </div>
            <%
                    }
                }
            %>

        </div>
    </section>
</body>
</html>
