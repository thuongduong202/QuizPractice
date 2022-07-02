<!--<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login Page</title>
  </head>
  <body>
    <h2>Login information</h2>
    <form action="LoginController" method="post">
       <table border="0">
         <tr>
            <td> Username: </td> <td> <input type="text" name="name" value="" /> </td> 
         </tr>
         <tr>
            <td> Password: </td> <td> <input type="password" name="pass" value="" /> </td> 
         </tr>
         <tr>
             <td> </td> <td> <input type="checkbox" name="remMe" value="remember" checked="checked" /> Remember me </td> 
         </tr>
         <tr>
            <td> </td> <td> <input type="Submit" value="Login"> </td> 
         </tr>
        </table>  
    </form>  
  </body>
</html>-->





<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from tk-themes.net/html-megacourse/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 26 May 2022 16:35:12 GMT -->
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
                            <div class="col-xs-12 col-lg-6 pull-right">
                                <div class="form-login">
                                    <form action="LoginController" method="post">
                                        <h2 class="text-uppercase">log in</h2>
                                        <p style="margin-bottom: 3px; margin-top: 20px; font-weight: 900" class="text-danger">
                                        ${notice}
                                        
                                    </p>
                                    <p style="margin-bottom: 3px; margin-top: 20px; font-weight: 900;color: lawngreen;" >
                                        ${message}
                                    </p>
                                    <div class="form-email">
                                        <input type="text" name="name" value="" placeholder="Email">
                                    </div>
                                    <div class="form-password">
                                        <input type="password" name="pass" placeholder="Password" required minlength="6" maxlength="32"> 
                                    </div>
                                    <div class="form-check">
                                        <input type="checkbox" name="remMe" value="remember" id="check">
                                        <label for="check">
                                            <i class="icon md-check-2"></i>
                                            Remember me</label>
                                        <a href="resetPassword.jsp">Forget password?</a>
                                    </div>
                                    <div class="form-submit-1">
                                        <input type="submit" value="Log In" class="mc-btn btn-style-1">
                                    </div>
                                    <div class="link">
                                        <a href="register.jsp">
                                            <i class="icon md-arrow-right"></i>Don't have account yet ? Join Us
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

    <!-- Mirrored from tk-themes.net/html-megacourse/login.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 26 May 2022 16:35:12 GMT -->
</html>