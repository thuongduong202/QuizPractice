
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
            .notice{
                font-size: 1.5em;
            }
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
                margin-top: 10px;
                margin-bottom: 10px;
            }
            td{
                padding-left: 3px;
                padding-right: 5px;
                font-size: 1.2em;
            }
            tr{
                padding-bottom: 5px;
            }
            
        </style>
    </head>
    <body>

        <!-- PAGE WRAP -->
        <div class="container">
        <div class="form col-md-12">
            <div class="form">
                <h2 class="title">New password</h2>
                <p class="notice">Verify email successful. Please enter your new password.</p>
                <div>
                    <form name="myForm" action="NewPasswordController" method="post">
                        <table>
                            <tr>
                            <input name="email" type="password" value="${email}" hidden>
                            <!--<input name="email" type="password" value="thuongdthe150682@fpt.edu.vn" hidden>-->
                            <td><label for="newpass">New Password</label></td>
                            <td><input class="input" name="newpass" type="password" required minlength="6" maxlength="32" value="${newpass}"><br></td>
                            </tr>
                            <tr>
                                <td><label for="repass">Re-password</label></td>
                                <td><input class="input" name="repass" type="password" required minlength="6" maxlength="32" value="${repass}"><br></td>
                            </tr>
                        </table>
                        <p id="message" style="color: red;">${message}</p>
                        <!--<button type="submit" onclick="check()">Submit</button>-->
                        <input type="submit" onclick="check();" value="Submit" class="mc-btn btn-style-2"/>
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

