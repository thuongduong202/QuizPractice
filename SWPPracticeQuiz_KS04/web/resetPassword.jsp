
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        <title>QuizPractice reset password</title>
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
                    <h3 class="title">Forgot your password?</h3>
                    <p>Enter the email associated with your account and we’ll send an email with your new password.</p>
                    <div>
                        <form name="myForm" action="ResetPasswordController" method="get">
                            <label for="email">Email address</label><br>
                            <input class="input" type="email" name="email"  value="${email}" required><br>
                            <input type="submit" value="Send me" class="mc-btn btn-style-2">
                            <p style="color: red;">${message1}.
                                <c:if test="${message1!= null}"><span><a href="regiter.jsp">Sign up with another email.</a></span></c:if></p>
                            <p style="color: red;">${message2}</p>
                            <p class="no-spam">Did not receive the email? Check your spam filter
                                or <span><a href="Login.jsp">Login by another email address.</a></span></p>
                        </form>
                    </div>
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

