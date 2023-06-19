<%@ page import="com.coursedesign.dao.userDao" %>
<%@ page import="com.coursedesign.model.clubBean" %>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: 25499
  Date: 2023/6/9 009
  Time: 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>社团详情</title>
<%--    <link rel="stylesheet" href="css/clubDetails.css">--%>
    <script src="js/clubDetails.js"></script>
    <style>
        body{
            background-color: rgb(255, 255, 255);
        }
        .container{
            background-color:rgba(244, 244, 244) ;
            height: 300px;
            width: 520px;
            margin-left: 80px;
            overflow: hidden;
            border: 0px solid red;
        }
        .son1{
            background-color: rgb(165, 236, 212);
            margin:0 30%;
            height: 20%;
            text-align: center;
            overflow: hidden;
            border: 0px solid red;
        }
        .son1-text1{
            margin: 5%;
            font-weight: bolder;
            font-size: 30px;
        }
        .son2{
            background-color: rgb(221, 221, 221);
            margin: 10px 10%;
            height: 60%;
            text-align: center;
            overflow: hidden;
        }
        .son2-text{
            margin: 10%;
            font-weight: bold;
            font-size: 25px;
            border: 0px solid red;
            overflow:auto;
        }
        .flex-container{
            display: flex;
            flex-direction: row;
            border: 0px solid red;
        }
        .flex-column{
            display: flex;
            flex-direction: column;
        }
        .right-container{
            background-color:rgba(244, 244, 244) ;
            margin-left: 50px;
            width: 750px;
            overflow: hidden;
            border: 0px solid red;
        }
        .right-son1{
            text-align: center;
            margin-top: 0px;
            margin-left: 35%;
            margin-right: 35%;
            background-color: rgb(165, 236, 212);
            border: 0px solid red;
        }
        .right-son2{
            background-color: rgb(221, 221, 221);
            margin-top: 5%;
            margin-left:10% ;
            margin-right: 10%;
            margin-bottom: 20px;
            height: 73%;
            overflow: hidden;
            border: 0px solid red;
        }
        .rightson2-text{
            /*margin: 0;*/
            font-weight: bold;
            height: 100%;
            font-size: 25px;
            border: 0px solid red;
            overflow:auto;
            word-wrap:break-word;
            word-break:break-all;
        }
        .footer{
            background-color:rgba(244, 244, 244) ;
            margin-top: 20px;
            margin-left: 5.2%;
            margin-right: 6.8%;
            height: 70px;
            text-align: center;
            display: flex;
            flex-direction: row;
            overflow: hidden;
        }
        .footer-text{
            margin-left: 30%;
            font-weight: bold;
            font-size: 25px;
            margin-top: 20px;
            border: 0px solid red;
        }
        .footer-form{
            margin-top: 28px;
            margin-left: 30px;
            border: 0px solid red;
            margin-right: 100px;
        }
        #commenttitle_container{
            background-color: rgb(165, 236, 212);
            margin-left: 5.2%;
            margin-right: 6.8%;
        }
        #commenttitle{
            font-weight: bold;
            font-size: 25px;
            margin-top: 20px;
            border: 0px solid red;
            margin-left: 45%;
        }
        .bottom{
            background-color:rgba(244, 244, 244) ;
            margin-top: 20px;
            margin-left: 5.2%;
            margin-right: 6.8%;
            height: 300px;
            text-align: center;
            overflow: auto;
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
            margin: 10px auto;
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
        textarea{
            resize: none;
            height: 100px;
            width: 270px;
        }
    </style>
</head>
<body>
<div class="flex-container">
    <div class="flex-column">
        <div class="container">
            <div class="son1">
                <%
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb-pro01","root","root");
                    PreparedStatement statement = conn.prepareStatement("select club_name from club where club_id=?;");
                    String club_id = request.getParameter("club_id");
                    HttpSession session1 = request.getSession();
                    session1.setAttribute("club_id", club_id);
                    statement.setString(1,club_id);
                    ResultSet rs = statement.executeQuery();
                %>
                <div class="son1-text1">
                    社团名称
                </div>
            </div>
            <div class="son2">
                <div class="son2-text">
                    <%while(rs.next()){
                        out.print(rs.getString(1));
                    }%>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="son1">
                <%
                    PreparedStatement st2 = conn.prepareStatement("select club_manager from club where  club_id=?;");
                    st2.setString(1, club_id);
                    ResultSet rs2 = st2.executeQuery();
                %>
                <div class="son1-text1">
                    社团主席
                </div>
            </div>
            <div class="son2">
                <div class="son2-text">
                    <%while(rs2.next()){
                        out.print(rs2.getString(1));
                    }%>
                </div>
            </div>
        </div>
    </div>

    <div class="right-container">
        <div class="right-son1">
            <%
                PreparedStatement st3 = conn.prepareStatement("select club_note from club where club_id=?;");
                st3.setString(1, club_id);
                ResultSet rs3 = st3.executeQuery();
            %>
            <div class="son1-text1">
                社团介绍
            </div>
        </div>
        <div class="right-son2">
            <div class="rightson2-text">
                <% while(rs3.next()){
                    out.print(rs3.getString(1));
                }%>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <%
        PreparedStatement st4 = conn.prepareStatement("select email from management,club where club_id=? and club.club_manager=management.name ;");
        st4.setString(1, club_id);
        ResultSet rs4 = st4.executeQuery();
    %>
    <div class="footer-text">
        联系人方式：<% while(rs4.next()){
        out.print(rs4.getString(1));
    }%>
    </div>
    <div class="footer-form">
        <form action="ApplyProcessServlet" method="post">
            <input type="hidden" name="email" value="<%=request.getSession().getAttribute("email") %>">
            <input type="hidden" name="club_id" value="<%=request.getSession().getAttribute("club_id") %>">
            <input type="submit" value="申请加入">
        </form>
    </div>
</div>

<div id="commenttitle_container">
    <div id="commenttitle">
        留言区
    </div>
</div>


<div class="bottom">
    <form action="commentServlet" method="post" >
        <% String clubid = request.getParameter("club_id") ;%>
        <textarea name="comments" placeholder="在此留言(不超过70字)" maxlength="70" id="txtarea"></textarea>
        <input type="submit">
        <input type="hidden" name="club_id" value="<%= request.getParameter("club_id") %>">
    </form>
    <%
        String errorMessage = (String) request.getSession().getAttribute("errorMessage");
        if (errorMessage != null) {
            out.println("<script>alert('" + errorMessage + "');</script>");
            request.getSession().removeAttribute("errorMessage");
        }
    %>

    <div class="table_container">
        <div class="table">
            <table>
                <tr id="tr1">
                    <td>留言内容</td>
                    <td>留言时间</td>
                    <td>留言者</td>
                </tr>
                <%
                    String sql = "SELECT * FROM `comments`";
                    ResultSet rsss = statement.executeQuery(sql);
                    while(rsss.next()){
                        String comment = rsss.getString("comment");
                        String time=rsss.getString("time");
                        String userName=rsss.getString("userName");
                        String club_idd = rsss.getString("club_id");
                        if (club_idd.equals(club_id)){
                %>
                <tr>
                    <td><%=comment%></td>
                    <td><%=time%></td>
                    <td><%=userName%></td>
                </tr>
                <%
                        }
                    }
                %>

            </table>
        </div>
    </div>

</div>
</body>
</html>
