<%-- 
    Document   : verify
    Created on : May 24, 2022, 11:32:01 AM
    Author     : dangm
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ConfirmVerify" method="post">
            <p>
                We just need to verify your email address before you can access to QuizPractice.<br><br>
                Verify your email address by enter verification code<br><br>
                Best Regard! The QuizPractice team</p>
            <div style="color: red">${requestScope.messVerify1}</div>
            <div style="color: green">${requestScope.messVerify2}</div>
            <input type="text" name="authcode" required="" placeholder="enter yout verify code" >
            <button type="submit">Verify</button>
        </form>
    </body>
</html>-->
<html lang="en">

    <!-- Mirrored from tk-themes.net/html-megacourse/account-profile-owner-view.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 26 May 2022 16:35:08 GMT -->
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
        <title>QuizPractice verify code</title>
        <style>
            .form{
                background-color: white;
                margin-top: 50px;
                margin-bottom: 50px;
                padding-left: 15%;
            }
            .title{
                color: black;
                font-weight: bolder;
            }
            .input{
                width: 400px;
                font-size: 1.5em;
            }
        </style>
    </head>
    <body>

        <!-- PAGE WRAP -->
        <div class="container">
            <div class="form col-md-12">
                <div class="form">
                    <h3 class="title">Confirm Register</h3>
                    <p>We just need to verify your email address before you can access to QuizPractice.<br>
                        Verify your email address by enter verification code<br>
                        Best Regard! The QuizPractice team</p>
                    <div>
                        <form name="myForm" action="ConfirmVerify" method="post">
                            <!--                        <label for="email">Email address</label><br>
                                                    <input name="correct_code" type="text" value="${code}" hidden>
                                                    <input name="email" type="text" value="${email}" hidden>
                                                    <input name="code" type="text" required class="input"><br>-->
                            <input type="text" name="time" value="${time}" hidden>
                            <input class="input" type="text" name="authcode" required="" placeholder="Enter your verify code" ><br>
                            <input type="submit" value="Submit" class="mc-btn btn-style-2">
                            <p style="color: red;">${message1}.${messVerify1}
                            <%--<c:if test="${message1!= null}"><span><a href="register.jsp">Sign up with another email.</a></span></c:if>--%>
                            </p>
                        <p style="color: red;">${message2}</p>
                            <p class="no-spam"><p>Did not receive the code? 
                                <span><a href="Login.jsp">Sign in with another email.</a></span></p>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="Footer.jsp"></jsp:include>

        <!-- Load jQuery -->
        <script type="text/javascript" src="js/library/jquery-1.11.0.min.js"></script>
        <script type="text/javascript" src="js/library/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/library/jquery.owl.carousel.js"></script>
        <script type="text/javascript" src="js/library/jquery.appear.min.js"></script>
        <script type="text/javascript" src="js/library/perfect-scrollbar.min.js"></script>
        <script type="text/javascript" src="js/scripts.js"></script>
    </body>
</html>
