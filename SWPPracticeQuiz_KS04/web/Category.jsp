<%-- 
    Document   : viewOwnQuiz
    Created on : Jun 12, 2022, 4:23:50 PM
    Author     : fptshop
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from tk-themes.net/html-megacourse/categories.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 26 May 2022 16:35:08 GMT -->
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
        <title>Category</title>
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
            <!-- HEADER -->
            <jsp:include page="Header.jsp"></jsp:include>
                <!-- END / HEADER -->


                <!-- SUB BANNER -->
                <section class="sub-banner section">
                    <div class="awe-parallax bg-profile-feature"></div>
                    <div class="awe-overlay overlay-color-3"></div>
                    <div class="container">
                        <div class="sub-banner-content">
                            <h2 class="big">Making every student unstoppable</h2>
                            <p>At Quizlet, we believe that anyone can learn anything.
                                All it takes is a tenacious spirit, the right guidance, and the tools to see it through. 
                                We know that students are under more pressure than ever.</p>
                            <a href="#" class="mc-btn btn-style-3">See course</a>
                        </div>
                    </div>
                </section>
                <!-- END / SUB BANNER -->


                <!-- PAGE CONTROL -->
                <section class="page-control">
                    <div class="container">
                        <div class="page-info">
                            <a href="HomeController"><i class="icon md-arrow-left"></i>Back to home</a>
                        </div>
                        <div class="page-view">
                            View
                            <span class="page-view-info view-grid active" title="View grid"><i class="icon md-ico-2"></i></span>
                            <span class="page-view-info view-list" title="View list"><i class="icon md-ico-1"></i></span>
                            <div class="mc-select">
                                <select class="select" name="" id="all-categories">
                                    <option value="">All level</option>
                                    <option value="">2</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- END / PAGE CONTROL -->

                <!-- CATEGORIES CONTENT -->
                <section id="categories-content" class="categories-content">
                    <div class="container">
                        <div class="row" >
                            <div class="col-md-9 col-md-push-3">
                                <div class="row" style="margin-top: 30px;">
                                        <div class="col-md-6">
                                            <nav aria-label="...">
                                            <c:if test="${endPage>=2}">
                                                <ul class="pagination">
                                                    <c:if test="${index != 1}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="CategoryController?index=${index-1}&categoryId=${requestScope.categoryId}&txtSearch=${txtSearch}">Previous</a>
                                                        </li>
                                                    </c:if>
                                                    <c:forEach begin="1" end ="${endPage}" var="i">
                                                        <li class="page-item  ${index==i?"active":""}" aria-current="page">
                                                            <a class="page-link" href="CategoryController?index=${i}&categoryId=${requestScope.categoryId}&txtSearch=${txtSearch}">${i}</a>
                                                        </li>
                                                    </c:forEach>
                                                    <c:if test="${index != endPage}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="CategoryController?index=${index+1}&categoryId=${requestScope.categoryId}&txtSearch=${txtSearch}">Next</a>
                                                        </li>
                                                    </c:if>
                                                </ul>
                                            </c:if>



                                        </nav>
                                    </div>
                                    <div class="col-md-6" style="margin-top: 18px;" >
                                        
                                        <form style="margin-left: 0;" action="CategoryController" method="post">
                                            <input style="margin-left: 0;"type="text" name="index" value="1" hidden="" >
                                            <input style="margin-left: 0;"type="text" name="categoryId" value="${requestScope.categoryId}" hidden="" >
                                            <input style="margin-left: 30px;border:2px solid black;
                                                   border-radius: 20px;padding-left: 5px; font-size: 15px; font-weight: bold; padding-left: 5px;" 
                                                   type="Text" name="txtSearch" value="${txtSearch}" placeholder="">
                                            <span><button class= "search-button" type="submit" name="btn-search" class="">Search</button></span>
                                        </form> 
                                    </div>
                                </div>
                                <div class="content grid">
                                    <div class="row" >
                                        <!-- ITEM -->
                                    <c:forEach items = "${listQuiz}" var = "o">
                                        <div class="col-sm-6 col-md-4">
                                            <div class="mc-item mc-item-2" style="">
                                                <div class="meta-categories" ><a href="#" style=" width: 100%; background-color: white; color: black; font-weight:bolder ">${o.title}</a></div>
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
                                                        <!-- HTML !-->
                                                        <a href="ViewQuizDetailController?quizid=${o.quizid}"><button class="button-66" role="button">View Quiz</button></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END / ITEM -->
                                    </c:forEach>

                                </div>


                            </div>
                        </div>

                        <!-- SIDEBAR CATEGORIES -->
                        <div class="col-md-3 col-md-pull-9">
                            <aside class="sidebar-categories">
                                <div class="inner">

                                    <!-- WIDGET TOP -->
                                    <div class="widget">
                                        <ul class="list-style-block">
                                            <li><a href="CategoryController" <c:if test="${requestScope.categoryId == null || requestScope.categoryId eq ''}"> style="color: blue;" </c:if> 
                                                   >All Quiz</a></li>
                                            <c:forEach items = "${listC}" var = "o">
                                                <li><a href="CategoryController?categoryId=${o.categoryId}"
                                                       <c:if test="${requestScope.categoryId eq o.categoryId}">
                                                           style="color: blue;"</c:if>
                                                       >${o.categoryName}</a></li>
                                                </c:forEach>
                                        </ul>
                                    </div>

                                    <!-- END / WIDGET CATEGORIES -->
                                </div>
                                <!-- BANNER ADS -->
                                <div class="mc-banner">
                                    <a href="#"><img src="images/banner-ads-1.jpg" alt=""></a>
                                </div>
                                <!-- END / BANNER ADS -->

                                <!-- BANNER ADS -->
                                <div class="mc-banner">
                                    <a href="#"><img src="images/banner-ads-2.jpg" alt=""></a>
                                </div>
                                <!-- END / BANNER ADS -->
                            </aside>
                        </div>
                        <!-- END / SIDEBAR CATEGORIES -->

                    </div>
                </div>

            </section>
            <!-- END / CATEGORIES CONTENT -->


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
        <script type="text/javascript" src="js/scripts.js"></script>
    </body>

    <!-- Mirrored from tk-themes.net/html-megacourse/categories.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 26 May 2022 16:35:09 GMT -->
</html>
