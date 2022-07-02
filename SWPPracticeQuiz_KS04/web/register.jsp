<%-- 
    Document   : Register
    Created on : Mar 5, 2022, 11:49:10 AM
    Author     : dangm
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<!--        <link rel="stylesheet" href="css/Register.css">
        <link rel="stylesheet" href="../css/Register.css">-->
    </head>
    
<!--    <body>
        <div class="formm">
        <form >
            <div class="register">
            <h1>Register</h1>
                        <input type="text" name="userName" placeholder="Enter user name" required>
                        <br>
                        <input type="text" name="password" placeholder="Enter password" required>
                        <br>
                        <input type="text" name="rePassword" placeholder="Enter rePassword" required>
                        <br>
                        <input type="text" name="email" placeholder="Enter email" required>
                        <br>
                        <input type="text" name="phone" placeholder="Enter phone" required>
                        <br>
                        <div style="color: red">${requestScope.message1}</div>
                        <div style="color: red">${requestScope.message2}</div>
                        <button type="submit" value="submit" name="submit" style="color: blue;">
                            Register
                        </button>
                        <button type="reset" style="color: red;">
                            reset
                        </button>
        </div>
        </form>
    </div>
    </body>-->
<!-- Mirrored from tk-themes.net/html-megacourse/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 26 May 2022 16:35:12 GMT -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta name="format-detection" content="telephone=no">
    <!-- Google font -->
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:300,400,700,900' rel='stylesheet' type='text/css'>
    <!-- Css -->
    <link rel="stylesheet" type="text/css" href="css/library/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="css/library/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/library/owl.carousel.css">
    <link rel="stylesheet" type="text/css" href="css/md-font.css">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!--[if lt IE 9]>
        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
    <![endif]-->
    <title>Mega Course - Learning and Courses HTML5 Template</title>
</head>
<body id="page-top" class="home">
<%--<jsp:include page="Header.jsp"></jsp:include>--%>
<!-- PAGE WRAP -->
<div id="page-wrap">
    
    <!-- HEADER -->
    <jsp:include page="Header.jsp"></jsp:include>
    <!-- END / HEADER -->
    <section class="slide" style="background-image: url('images/homeslider/bg.jpg')">
    <!-- LOGIN -->
    <section id="login-content" class="login-content">
        <div class="awe-parallax bg-login-content"></div>
        <div class="awe-overlay"></div>
        <div class="container">
            <div class="row">                
                <!-- FORM -->
                <div class="col-lg-6 pull-right">
                    <div class="form-login">
                        <form action="RegiterController" method="post">
                            <h2 class="text-uppercase">sign up</h2>
                            <p style="color: green">${message}</p>
                            <div class="form-datebirth">
                                <input type="text" name="userName" placeholder="User name">
                            </div>
                            <div class="form-email">
                                <input type="text" name="email" placeholder="Email">
                            </div>
                            <div class="form-password">
                                <input type="password" name="password" placeholder="Password"  required minlength="6" maxlength="32">
                            </div>
                            <div class="form-password">
                                <input type="password" name="rePassword" placeholder="Re-Password"  required minlength="6" maxlength="32">
                            </div>
                            <br>
                            <div style="color: red">${requestScope.message1}</div>
                        <div style="color: red">${requestScope.message2}</div>
                            <div class="form-submit-1">
                                <input type="submit" name="submit" value="Become a member" class="mc-btn btn-style-1">
                            </div>
                            <div class="link">
                                <a href="Login.jsp">
                                    <i class="icon md-arrow-right"></i>Already have account ? Sign in
                                </a>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- END / FORM -->
    
                <div class="image">
                    <img src="images/homeslider/img-thumb.png" alt="">
                </div>
    
            </div>
        </div>
    </section>
    <!-- END / LOGIN -->
    </section>
      
    <!-- FOOTER -->
    <jsp:include page="Footer.jsp"></jsp:include>
    <!-- END / FOOTER -->


    


</div>
<!-- END / PAGE WRAP -->

<!-- Load jQuery -->
<script type="text/javascript" src="js/library/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="js/library/bootstrap.min.js"></script>
<script type="text/javascript" src="js/library/jquery.owl.carousel.js"></script>
<script type="text/javascript" src="js/library/jquery.appear.min.js"></script>
<script type="text/javascript" src="js/library/perfect-scrollbar.min.js"></script>
<script type="text/javascript" src="js/library/jquery.easing.min.js"></script>
<script type="text/javascript" src="js/scripts.js"></script>
</body>

</html>
