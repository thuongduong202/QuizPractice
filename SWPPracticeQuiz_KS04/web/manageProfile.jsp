
<%-- 
    Document   : manageProfile
    Created on : May 26, 2022, 3:30:51 PM
    Author     : HP
--%>
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
                font-weight: bolder;
                color: white;
                width: 60%;
                padding-top: 10em;
                padding-bottom: 2em;
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
                            <li class="current">
                                <a href="ManageProfileController">
                                    <i class="icon md-user-minus"></i>
                                    Profile
                                </a>
                            </li>
                            <li></li>
                            <li></li>
                            <li>
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
                        <h3 class="md black">Profile</h3>
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

                                    <form action="ChangeAvatarController?id=${sessionScope.user.id}" method="post" enctype="multipart/form-data">
                                        <div class="choses-file up-file">
                                            <input class="custom-file-input" type="file" name="avatar" id="avatar" placeholder="image" >
                                            <a href="#" class="mc-btn btn-style-6">Changes image</a><br>
                                            <div style="color: green">${requestScope.messageAvatar}</div>
                                            <button type="submit" value="Save" class="mc-btn btn-style-6">Save</button>
                                        </div>
                                    </form>
                                    <script>
                                        document.getElementById("avatar").onchange = function () {
                                            var reader = new FileReader();

                                            reader.onload = function (e) {
                                                // get loaded data and render thumbnail.
                                                document.getElementById("image").src = e.target.result;
                                            };

                                            // read the image file as a data URL.
                                            reader.readAsDataURL(this.files[0]);
                                        };
                                    </script>

                                </div>   
                                <div class="info-acount">
                                    <h3 class="username md black">${sessionScope.user.userName}</h3>
                                    <form action="ManageProfileController" method="post">
                                        <div class="security">
                                            <div class="tittle-security">
                                                <h5>Email</h5>
                                                <input class="text" type="text" name="email" value="${sessionScope.user.email}" readonly>
                                                <!--<p><a href="changeEmail.jsp">Change email</p>-->
                                                <h5>UserName</h5>
                                                <input class="text" type="text" name="username" id="name" minlength="3" maxlength="32" value="${sessionScope.user.userName}" required>
                                                <h5>About me</h5>
                                                <div class="form-group">
                                                    <textarea style="height: 100px; font-size: 1em;font-weight: bold;" rows="4" name="aboutme" maxlength="1000">${sessionScope.user.aboutMe}</textarea>
                                                </div>
                                                
                                                <!--<input class="text" type="text" name="aboutme" value="${sessionScope.user.aboutMe}">-->
                                                <h5>Phone</h5>
                                                <input class="text" type="text" id="phone" name="phone" value="${sessionScope.user.phone}" minlength="10" maxlength="11">
                                                <c:if test="${message!=null}">
                                                    <p style="color: green">${message}</p>
                                                </c:if>
                                                    <input type="submit" name="submit" value="Save changes" class="button btn-style-1">
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
    
    

