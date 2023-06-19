<%--
  Created by IntelliJ IDEA.
  User: 25499
  Date: 2023/6/7 007
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>学社</title>
    <link rel="stylesheet" href="css/home.css">
</head>
<body>
<div>
    <link rel="stylesheet" href="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/css/magnific-popup.css"/>
    <link rel="stylesheet" href="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/css/font-awesome.min.css"/>
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/css/templatemo-style.css"/>
    <!-- MENU -->
    <section role="navigation" class="navbar custom-navbar navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button data-toggle="collapse" data-target=".navbar-collapse" class="navbar-toggle"><span class="icon icon-bar"></span><span class="icon icon-bar"></span><span class="icon icon-bar"></span></button>
                <!-- lOGO TEXT HERE -->
                <a href="home.jsp" class="navbar-brand">学社</a>
            </div>
            <!-- MENU LINKS -->
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav navbar-nav-first">
                    <li>
                        <a href="#home" class="smoothScroll">主页</a>
                    </li>
                    <li>
                        <a href="clubs.jsp" class="smoothScroll" target="_blank">社团列表</a>
                    </li>
                    <li>
                        <a href="/ClubManagementServlet" class="smoothScroll" target="_blank">社团管理</a>
                    </li>
                    <li>
                        <a href="/UserCenterServlet" class="smoothScroll" target="_blank">个人中心</a>
                    </li>
                    <li>
                        <a href="#contact" class="smoothScroll">联系我们</a>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li id="welcome_container">
                        <div id="welcome">欢迎你,${ sessionScope.name}!</div>
                    </li>
                    <li>
                        <a href="/logoutServlet">退出登录</a>
                    </li>
                </ul>

<%--                <ul class="nav navbar-nav navbar-right" >--%>
<%--                    <li class="section-btn">--%>
<%--                        <a href="#" data-toggle="modal" data-target="#modal-form" >登录/注册</a>--%>
<%--                    </li>--%>
<%--                </ul>--%>
            </div>
        </div>
    </section>
    <!-- HOME -->
    <section id="home" data-stellar-background-ratio="0.5">
        <div class="overlay">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-sm-12">
                    <div class="home-info">
                        <h1>想让您的社团入驻我们的网站？
                        </h1>
                        <a href="#contact" class="btn section-btn smoothScroll">申请加入</a>
                        <span>
                  联系我们  19338025490
                  <small>随时待命</small></span>
                    </div>
                </div>
                <div class="col-md-6 col-sm-12">
                    <div class="home-video">
                        <div class="embed-responsive embed-responsive-16by9">
                            <div class="home-video__img">
                                <img src="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/2022/05/20220505154307881.png?imageMogr2/format/png/interlace/1"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ABOUT -->
    <%--    <section id="about" data-stellar-background-ratio="0.5">--%>
    <%--        <div class="container">--%>
    <%--            <div class="row">--%>
    <%--                <div class="col-md-5 col-sm-6">--%>
    <%--                    <div class="about-info">--%>
    <%--                        <div class="section-title">--%>
    <%--                            <h2>Let us introduce--%>
    <%--                            </h2>--%>
    <%--                            <span class="line-bar">...</span>--%>
    <%--                        </div>--%>
    <%--                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim.--%>
    <%--                        </p>--%>
    <%--                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor.--%>
    <%--                        </p>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--                <div class="col-md-3 col-sm-6">--%>
    <%--                    <div class="about-info skill-thumb">--%>
    <%--                        <strong>Web Design</strong>--%>
    <%--                        <span class="pull-right">85%</span>--%>
    <%--                        <div class="progress">--%>
    <%--                            <div role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" id="i4bgg" class="progress-bar progress-bar-primary c30865">--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <strong>Photography</strong>--%>
    <%--                        <span class="pull-right">90%</span>--%>
    <%--                        <div class="progress">--%>
    <%--                            <div role="progressbar" aria-valuenow="90" aria-valuemin="0" aria-valuemax="100" id="id41z" class="progress-bar progress-bar-primary c30934">--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <strong>Content Marketing</strong>--%>
    <%--                        <span class="pull-right">75%</span>--%>
    <%--                        <div class="progress">--%>
    <%--                            <div role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" id="ivx9rl" class="progress-bar progress-bar-primary c31001">--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                        <strong>CMS Admin</strong>--%>
    <%--                        <span class="pull-right">70%</span>--%>
    <%--                        <div class="progress">--%>
    <%--                            <div role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" id="ii77me" class="progress-bar progress-bar-primary c31068">--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--                <div class="col-md-4 col-sm-12">--%>
    <%--                    <div class="about-image">--%>
    <%--                        <img src="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/images/about-image.jpg?imageMogr2/format/jpg/interlace/1" alt="" class="img-responsive"/>--%>
    <%--                    </div>--%>
    <%--                </div>--%>
    <%--            </div>--%>
    <%--        </div>--%>
    <%--    </section>--%>
    <!-- BLOG -->
    <section id="blog" data-stellar-background-ratio="0.5">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="section-title">
                        <h2>人气社团
                        </h2>
                        <span class="line-bar">...</span>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <%--                    <!-- BLOG THUMB -->    239*359 px--%>
                    <div class="media blog-thumb">
                        <div class="media-object media-left">
                            <a href="blog-detail.html"><img src="img/img01.png" alt="" class="img-responsive"/></a>
                        </div>
                        <div class="media-body blog-info">
                            <h3>
                                <a href="clubDetails.jsp?club_id=3">滑板社</a>
                            </h3>
                            <p>我们欢迎所有对滑板感兴趣的学生，不论是初学者还是经验丰富的滑手，加入我们的社团。
                            </p>
                            <a href="clubDetails.jsp?club_id=3" class="btn section-btn" target="_blank">了解更多</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <!-- BLOG THUMB -->
                    <div class="media blog-thumb">
                        <div class="media-object media-left">
                            <a href="clubDetails.jsp?club_id=1"><img src="img/img02.png" class="img-responsive"/></a>
                        </div>
                        <div class="media-body blog-info">
                            <h3>
                                <a href="clubDetails.jsp?club_id=1">电竞社</a>
                            </h3>
                            <p>热衷于电子竞技的学生社团，致力于推动和发展电竞文化，并为学生提供一个参与电竞比赛、交流经验和提升游戏水平的平台。
                            </p>
                            <a href="clubDetails.jsp?club_id=1" class="btn section-btn" target="_blank">了解更多</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <!-- BLOG THUMB -->
                    <div class="media blog-thumb">
                        <div class="media-object media-left">
                            <a href="clubDetails.jsp?club_id=4"><img src="img/img03.png" alt="" class="img-responsive"/></a>
                        </div>
                        <div class="media-body blog-info">
                            <h3>
                                <a href="clubDetails.jsp?club_id=4">街舞社</a>
                            </h3>
                            <p>热血激情，舞动青春!
                            </p>
                            <a href="clubDetails.jsp?club_id=4" class="btn section-btn" target="_blank">了解更多</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6">
                    <!-- BLOG THUMB -->
                    <div class="media blog-thumb">
                        <div class="media-object media-left">
                            <a href="clubDetails.jsp?club_id=2"><img src="img/img04.png" alt="" class="img-responsive"/></a>
                        </div>
                        <div class="media-body blog-info">
                            <h3>
                                <a href="clubDetails.jsp?club_id=2">棋牌社</a>
                            </h3>
                            <p>智慧对决，策马千里!
                            </p>
                            <a href="clubDetails.jsp?club_id=2" class="btn section-btn" target="_blank">了解更多</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- WORK -->
    <section id="work" data-stellar-background-ratio="0.5">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="section-title">
                        <h2>我们的作用
                        </h2>
                        <span class="line-bar">...</span>
                    </div>
                    <%--                    280*250--%>
                </div>
                <div class="col-md-3 col-sm-6">
                    <!-- WORK THUMB -->
                    <div class="work-thumb">
                        <a href="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/images/work-image1.jpg?imageMogr2/format/jpg/interlace/1" class="image-popup"><img src="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/images/work-image1.jpg?imageMogr2/format/jpg/interlace/1" alt="Work" class="img-responsive"/><div class="work-info">
                            <h3>帮您管理您的社团
                            </h3>
                            <small>高效便捷</small>
                        </div></a>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <!-- WORK THUMB -->
                    <div class="work-thumb">
                        <a href="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/images/work-image2.jpg?imageMogr2/format/jpg/interlace/1" class="image-popup"><img src="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/images/work-image2.jpg?imageMogr2/format/jpg/interlace/1" alt="Work" class="img-responsive"/><div class="work-info">
                            <h3>帮您挑选您中意的社团
                            </h3>
                            <small>个性定制</small>
                        </div></a>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <!-- WORK THUMB -->
                    <div class="work-thumb">
                        <a href="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/images/work-image3.jpg?imageMogr2/format/jpg/interlace/1" class="image-popup"><img src="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/images/work-image3.jpg?imageMogr2/format/jpg/interlace/1" alt="Work" class="img-responsive"/><div class="work-info">
                            <h3>社交于此
                            </h3>
                            <small>丰富生活</small>
                        </div></a>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <!-- WORK THUMB -->
                    <div class="work-thumb">
                        <a href="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/images/work-image4.jpg?imageMogr2/format/jpg/interlace/1" class="image-popup"><img src="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/images/work-image4.jpg?imageMogr2/format/jpg/interlace/1" alt="Work" class="img-responsive"/><div class="work-info">
                            <h3>举行活动
                            </h3>
                            <small>快乐不止</small>
                        </div></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- CONTACT -->
    <section id="contact" data-stellar-background-ratio="0.5">
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <div class="section-title">
                        <h2>联系我们
                        </h2>
                        <span class="line-bar">...</span>
                    </div>
                </div>
                <div class="col-md-8 col-sm-8">
                    <!-- CONTACT FORM HERE -->
                    <form id="contact-form" role="form" action="#" method="post">
                        <div class="col-md-6 col-sm-6">
                            <input type="text" placeholder="您的名字" id="cf-name" name="cf-name" required class="form-control"/>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <input type="email" placeholder="您的邮箱" id="cf-email" name="cf-email" required class="form-control"/>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <input type="tel" placeholder="您的手机号" id="cf-number" name="cf-number" required class="form-control"/>
                        </div>
                        <div class="col-md-12 col-sm-12">
                            <textarea rows="6" placeholder="您的诉求" id="cf-message" name="cf-message" required class="form-control"></textarea>
                        </div>
                        <div class="col-md-4 col-sm-12">
                            <input type="submit" name="submit" value="提交" class="form-control"/>
                        </div>
                    </form>
                </div>
                <div class="col-md-4 col-sm-4">
                    <div class="google-map">
                        <div>
                            <img src="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/2022/05/20220505154307881.png?imageMogr2/format/png/interlace/1"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- FOOTER -->
    <footer data-stellar-background-ratio="0.5">
        <div class="container">
            <div class="row">
                <div class="col-md-5 col-sm-12">
                    <div class="footer-thumb footer-info">
                        <h2>学社股份有限公司
                        </h2>
                        <p>
                            我们致力于为您提供高效、便捷的社团管理解决方案。作为一个专业的社团管理平台，我们的目标是帮助您轻松管理和组织您的社团活动，让您的社团运作更加顺畅。
                        </p>
                    </div>
                </div>
                <div class="col-md-2 col-sm-4">
                    <div class="footer-thumb">
                        <h2>创始人
                        </h2>
                        <ul class="footer-link">
                            <li>
                                <a href="#">莫航</a>
                            </li>
                            <li>
                                <a href="#">雷恩熙</a>
                            </li>
                            <li>
                                <a href="#">陈英杰</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2 col-sm-4">
                    <div class="footer-thumb">
                        <h2>服务
                        </h2>
                        <ul class="footer-link">
                            <li>
                                <a href="clubManagement.jsp">社团管理</a>
                            </li>
                            <li>
                                <a href="clubs.jsp">百团大战</a>
                            </li>
                            <li>
                                <a href="userCenter.jsp">个人中心</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-3 col-sm-4">
                    <div class="footer-thumb">
                        <h2>找到我们
                        </h2>
                        <p>计算机科学与技术一班
                            <br/>吉林农业大学，信息技术学院
                        </p>
                    </div>
                </div>
                <div class="col-md-12 col-sm-12">
                    <div class="footer-bottom">
                        <div class="col-md-6 col-sm-5">
                            <div class="copyright-text">
                                <p>Copyright © 2023 莫航|雷恩熙|陈英杰
                                </p>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-7">
                            <div class="phone-contact">
                                <p>联系我们
                                    <span>(+86) 19338025490</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- MODAL -->
    <section id="modal-form" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" class="modal fade">
        <div class="modal-dialog modal-lg">
            <div class="modal-content modal-popup">
                <div class="modal-header">
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true">×</span></button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-md-12 col-sm-12">
                                <div class="modal-title">
                                    <h2>学社
                                    </h2>
                                </div>
                                <!-- NAV TABS -->
                                <ul role="tablist" class="nav nav-tabs">
                                    <li class="active">
                                        <a href="#sign_up" aria-controls="sign_up" role="tab" data-toggle="tab">注册账号</a>
                                    </li>
                                    <li>
                                        <a href="#sign_in" aria-controls="sign_in" role="tab" data-toggle="tab">登录</a>
                                    </li>
                                </ul>
                                <!-- TAB PANES -->
                                <div class="tab-content">
                                    <div role="tabpanel" id="sign_up" class="tab-pane fade in active">
                                        <%--                                        注册--%>
                                        <form action="registerServlet" method="post">
                                            <input type="text" name="name" placeholder="姓名" required class="form-control"/>
                                            <input type="telephone" name="telephone" placeholder="电话" required class="form-control"/>
                                            <input type="email" name="email" placeholder="邮箱" required class="form-control"/>
                                            <input type="password" name="password" placeholder="密码" required class="form-control"/>
                                            <input type="submit" name="submit" value="提交" class="form-control"/>
                                        </form>
                                    </div>
                                    <div role="tabpanel" id="sign_in" class="tab-pane fade in">
                                        <%--                                        登录--%>
                                        <form action="loginServlet" method="post">
                                            <input type="email" name="email" placeholder="邮箱" required class="form-control"/>
                                            <input type="password" name="password" placeholder="密码" required class="form-control"/>
                                            <input type="submit" name="submit" value="提交" class="form-control"/>
                                            <a href="#">忘记密码?</a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- SCRIPTS -->
    <script src="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/js/jquery.js"></script>
    <script src="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/js/bootstrap.min.js"></script>
    <script src="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/js/jquery.stellar.min.js"></script>
    <script src="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/js/jquery.magnific-popup.min.js"></script>
    <script src="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/js/smoothscroll.js"></script>
    <script src="https://template-1253409072.cos.ap-guangzhou.myqcloud.com/html-template/template-company-00002/js/custom.js"></script>
</div>
</body>
</html>
