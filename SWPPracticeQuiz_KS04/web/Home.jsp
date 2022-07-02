<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from tk-themes.net/html-megacourse/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 26 May 2022 16:34:16 GMT -->
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
        <style>
            .search-button{
                margin-left: 20px;
                border-radius: 20px;
                background-color: #0a6bff;
                color: white;
            }
            .search-button:hover{
                background-color: #065dd8;
            }
        </style>
    </head>
    <body id="page-top" class="home">

        <!-- PAGE WRAP -->
        <div id="page-wrap">

            <!-- PRELOADER -->
            <div id="preloader">
                <div class="pre-icon">
                    <div class="pre-item pre-item-1"></div>
                    <div class="pre-item pre-item-2"></div>
                    <div class="pre-item pre-item-3"></div>
                    <div class="pre-item pre-item-4"></div>
                </div>
            </div>
            <!-- END / PRELOADER -->

            <!-- HEADER -->
            <jsp:include page="Header.jsp"></jsp:include>
                <!-- END / HEADER -->


                <!-- HOME SLIDER -->
                <!--                <section class="page-control">
                                    <div class="container">
                                        <div class="page-info">
                                            <form action="SearchHomeController" method="POST">
                                                <span style="font-size: 30px;font-weight: bold;font-family: serif">Recent</span>
                                                <input style="margin-left: 30px;border:2px solid black;
                                                       border-bottom-left-radius: 20px;
                                                       border-bottom-right-radius: 20px;
                                                       border-top-left-radius: 20px;
                                                       border-top-right-radius: 20px;" 
                                                       type="Text" name="txtSearch" placeholder="Enter title...">
                                                <button style="margin-left: 20px;" type="submit" name="btn-search" class="">Search</button>
                                            </form>
                
                
                                        </div>
                                    </div>
                                </section>-->

                <section id="course-concern" class="course-concern">
                    <div class="container">

                        <div class="row">
                            <div class="col-md-3 col-md-push-7">
                                <!--                                <div class="search-box" style="margin-bottom: 0;" >
                                                                    <i style="color: black;"class="icon md-search"></i>
                                                                    <div class="search-inner">
                                                                        <form action="SearchHomeController" method="POST">
                                                                            <input style="color: black;" name="txtSearch" type="text" placeholder="Search...">
                                                                        </form>
                                                                    </div>
                                                                </div>-->
                                <form action="SearchHomeController" method="POST">
                                    <span><input style="margin-left: 30px;border:2px solid black;
                                           border-radius: 20px;padding-left: 5px; font-size: 15px; font-weight: bold; " 
                                           type="Text" name="txtSearch" value="${txtSearch}" placeholder="Search..."></span>
                                    <span><button class= "search-button" type="submit" name="btn-search" class="">Search</button></span>
                                   
                                </form>
                            </div>
                        </div>
                        <div class="row"">
                            <div class="col-md-2 col-md-push-1">
                                <h5 style="color: black; font-weight: bolder;margin-top: 0">Recommend</h5>
                            </div>
                            
                        </div>
                        <div class="row">
                            <div class="col-md-9 col-md-push-1">
                                <div class="content grid" >
                                    <div class="row" >
                                        <c:if test="${listQuiz==null}">
                                            <p style="color: green;">${message}</p>
                                        </c:if>
                                        <!-- ITEM -->
                                        <c:if test="${listQuiz!=null}">
                                    <c:forEach items = "${listQuiz}" var = "o">
                                        <div class="col-sm-6 col-md-4">
                                            <div class="mc-item mc-item-2" style="">
                                                <div  class="meta-categories"><a style=" width: 100%; background-color: white; color: black; font-weight:bolder" href="#">${o.title}</a></div>
                                                <div class="content-item " style="padding-top: 40px;">
                                                    <h4><a href="course-intro.html">${o.description}</a></h4>
                                                    <div class="name-author">
                                                        By <a href="ViewOtherQuizController?userid=${o.userid}">${o.username}</a>
                                                    </div>
                                                </div>
                                                <div class="ft-item">
                                                    <div class="rating">
                                                        <a href="#" class="active"></a>
                                                        <a href="#" class="active"></a>
                                                        <a href="#" class="active"></a>
                                                        <a href="#"></a>
                                                        <a href="#"></a>
                                                    </div>
                                                    <div class="view-info">
                                                        <i class="icon md-users"></i>
                                                        2568
                                                    </div>
                                                    <div class="comment-info">
                                                        <i class="icon md-comment"></i>
                                                        25
                                                    </div>
                                                    <div>
                                                        <a href="ViewQuizDetailController?quizid=${o.quizid}"><button class="button-66" role="button">View Quiz</button></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END / ITEM -->
                                    </c:forEach>
</c:if>
                                </div>


                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END / HOME SLIDER -->
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

    <!-- Mirrored from tk-themes.net/html-megacourse/ by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 26 May 2022 16:34:38 GMT -->
</html>