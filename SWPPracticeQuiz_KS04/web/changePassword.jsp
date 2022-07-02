<%-- 
    Document   : changePassword
    Created on : May 25, 2022, 10:05:32 PM
    Author     : dangm
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <!--    <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>JSP Page</title>
            <link rel="stylesheet" href="css/Register.css">
            <link rel="stylesheet" href="../css/Register.css">
        </head>
        
        <body>
            <div class="formm">
            <form >
                <div class="register">
                <h1>changePassword</h1>
                            <input type="text" name="userName" placeholder="Enter user name" required>
                            <br>
                            <input type="text" name="OldPassword" placeholder="Enter Old-password" required>
                            <br>
                            <input type="text" name="NewPassword" placeholder="Enter New-password" required>
                            <br>
                            <div style="color: green">${requestScope.message1}</div>
                            <div style="color: red">${requestScope.message2}</div>
                            <button type="submit" value="submit" name="submit" style="color: blue;">
                                Change
                            </button>
                            <button type="reset" style="color: red;">
                                reset
                            </button>
            </div>
            </form>
        </div>
        </body>-->
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
        <title>QuizPractice ManageProfile</title>
        <style>
            .avatar{
                width: 120px;
                height: 120px;
                margin-bottom: 10px;
            }
            .text{
                color: #000000;
                font-weight: bold;
                font-size: 1.5em;
            }
            .username{
                font-weight: bolder;
            }
            .btn-style-1{
                width: 30px;
                background-color: gray;
            }
            .button{
                margin-top: 10px;
                height: 30px;
                width: 70px;
                border-radius: 7px;
                background-color: rgb(218, 216, 216);
            }
            .bt{
                margin-left: 120px;
                padding-bottom: 20px;
                padding-top: 15px;
            }
        </style>
    </head>
    <body id="page-top">

        <!-- HEADER -->
        <jsp:include page="Header.jsp"></jsp:include>
            <!-- CONTENT BAR -->
            <section class="content-bar">
                <div class="container">
                    <ul>
                        <li >
                            <a href="ManageProfileController">
                                <i class="icon md-user-minus"></i>
                                Profile
                            </a>
                        </li>
                        <li></li>
                        <li></li>
                        <li class="current">
                            <a href="changePassword.jsp">
                                <i class="icon md-book-1"></i>
                                Change Password
                            </a>
                        </li>
                    </ul>
                </div>
            </section>
            <!-- END / CONTENT BAR -->

            <!-- PROFILE -->

            <section class="profile">
                <div class="container">
                    <h3 class="md black">Change Password</h3>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="avatar-acount">
                                <div class="changes-avatar">
                                    <div class="img-acount">
                                    <c:if test = "${sessionScope.user.avatar == null}" >
                                        <img class="avatar" src="imageUpload/default-avatar.png"  id="image">                        
                                    </c:if>
                                    <c:if test = "${sessionScope.user.avatar != null}" >
                                        <img class="avatar" src="imageUpload/${sessionScope.user.avatar}" id="image">                                                                       
                                    </c:if>
                                </div>
                                <div class="form-group">
                                    <p style="font-size: 25px">About me</p>  
                                    <p style="font-size: 17px; font-weight: bold">${sessionScope.user.aboutMe}</p>
                                </div>
                                <div class="form-group">
                                    <p style="font-size: 25px">Phone</p>
                                    <p style="font-size: 17px; font-weight: bold">${sessionScope.user.phone}</p>
                                </div>
                            </div>   
                            <div class="info-acount">
                                <h3 class="username md black">${sessionScope.user.userName}</h3>
                                <form action="ChangePasswordController" method="post">
                                    <div class="security">
                                        <div class="tittle-security">
                                            <h5>Old Password</h5>
                                            <input class="text" type="Password" name="OldPassword" value="" required="">
                                            <h5>New Password</h5>
                                            <input class="text" type="Password" name="NewPassword" id="NewPassword" minlength="5" maxlength="32" value="" required>
                                            <h5>Re-New Password</h5>
                                            <input class="text" type="Password" id="" name="ReNewPassword" minlength="5" maxlength="32" value="" required="">
                                            <div style="color: green">${requestScope.messageDone}</div>
                                            <div style="color: red">${requestScope.messageFalse}</div>
                                            <!--                                                <div class="bt">
                                                                                            <button type="submit" value="submit" name="submit" style="color: back;">
                                                                                                Change
                                                                                            </button>
                                                                                            <button type="reset" style="color: back;">
                                                                                                reset
                                                                                            </button>
                                                                                        </div>-->
                                            <input type="submit" value="Save changes" class="button btn-style-1" name="submit">
                                        </div>
                                    </div>
                                </form>
                            </div>    
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- END / PROFILE -->
        <!--FOOTER-->
        <jsp:include page="Footer.jsp"></jsp:include>
        <!--END / FOOTER-->

    </div>
    <!--            <script>
                    function check() {
                        var phone = document.getElementById('phone').value;
                        if (phone!="" && !phone.match('^[0-9\-\+]{10,11}$')) {
                            document.getElementById('phone').style.color='red';
                            document.getElementById('phone').placeholder='red';
                            return false;
                        }
                    }
                </script>-->
    <!-- END / PAGE WRAP -->

    <!-- Load jQuery -->
    <script type="text/javascript" src="js/library/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="js/library/bootstrap.min.js"></script>
    <script type="text/javascript" src="js/library/jquery.owl.carousel.js"></script>
    <script type="text/javascript" src="js/library/jquery.appear.min.js"></script>
    <script type="text/javascript" src="js/library/perfect-scrollbar.min.js"></script>
    <script type="text/javascript" src="js/scripts.js"></script>
</body>
</html>
