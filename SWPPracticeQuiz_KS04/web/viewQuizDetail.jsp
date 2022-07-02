<%-- 
    Document   : viewQuizDetail
    Created on : Jun 14, 2022, 1:20:23 PM
    Author     : fptshop
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from tk-themes.net/html-megacourse/course-intro.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 26 May 2022 16:35:09 GMT -->

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
        <title>view quiz details</title>
        <style>
            .instruction{
                display: none;
                color: green;
                font-weight: bold;
            }
            .back{
                margin-left: 55%;
                color: white;
                font-weight: bold;
                background: inherit;
                border: none;
            }
            .back:hover{
                color: greenyellow;
            }
        </style>
    </head>

    <body id="page-top">

        <!-- PAGE WRAP -->
        <div id="page-wrap">

            <!-- PRELOADER -->
            <div id="preloader">

            </div>
            <!-- END / PRELOADER -->

            <!-- HEADER -->
            <jsp:include page="Header.jsp"></jsp:include>
                <!-- END / HEADER -->


                <!-- SUB BANNER -->
                <section class="sub-banner sub-banner-course">
                    <div class="awe-static bg-sub-banner-course"></div>
                    <div class="container">
                        <div class="sub-banner-content">
                            <button class="back" onclick="history.back()"><i class="icon md-back"></i><span><h2 class="text-center">Back</h2></span></button>
                            <!--<a href=><h2 class="text-center">Home Fitness Training</h2></a>-->
                        </div>
                    </div>
                </section>
                <!-- END / SUB BANNER -->


                <!-- COURSE -->
                <section class="course-top">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="sidebar-course-intro " style="margin-top: 120px; margin-left: 170px">
                                    <div class="study">
                                        <img width="35px" src="https://cdn-icons-png.flaticon.com/128/5484/5484329.png" alt=""
                                             srcset="">
                                        <span style="margin-left:10px; font-weight: 900; font-size: 18px;"><a href="#" style="color: black;">Rate</a></span>
                                    </div>
                                    <div style="margin-top: 20px;" class="study">
                                        <img width="35px" src="https://cdn-icons-png.flaticon.com/128/3068/3068380.png" alt=""
                                             srcset="">
                                        <span style="margin-left:10px; font-weight: 900; font-size: 18px; "><a href="#" style="color: black;">Learn</a></span>
                                    </div>
                                    <div style="margin-top: 20px;" class="study">
                                        <img width="35px" src="https://cdn-icons-png.flaticon.com/512/1436/1436722.png" alt=""
                                             srcset="">
                                        <span style="margin-left:10px; font-weight: 900; font-size: 18px;"><a href="#" style="color: black;">Take Test</a></span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6" style="margin-left: 60px">
                                <div class="sidebar-course-intro">
                                    <b class="breadcrumb">
                                        Quiz name - ${requestScope.quiz.getTitle()}
                                </b>  
                                <div style="text-align: center;" class="video-course-intro">
                                    <div class="flip-card">
                                        <div class="flip-card-inner">
                                            <div class="flip-card-front">
                                                <div class="Xcontainer">
                                                    ${requestScope.question.getTitle()}
                                                </div>
                                            </div>
                                            <div class="flip-card-back">
                                                <div class="Xcontainer">
                                                    ${requestScope.question.getRightAnswer()}
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <a style="margin-left: 250px; " href="ViewQuizDetailController?quizid=${quizid}&currentIndex=${currentIndex-1}"><img
                                        width="30px" src="https://cdn-icons-png.flaticon.com/128/2879/2879564.png"
                                        alt=""></a>
                                <span style="color: black; font-size: 18px;"> ${currentIndex}/${requestScope.quiz.getListQuestions().size()} </span>
                                <a href="ViewQuizDetailController?quizid=${quizid}&currentIndex=${currentIndex+1}"><img
                                        width="30px" src="https://cdn-icons-png.flaticon.com/128/2879/2879593.png"
                                        alt=""></a>

                            </div>

                        </div>
                    </div>
                </div>
            </section>
            <!-- END / COURSE TOP -->
            <div style="margin-left: 125px;" class="tabs-page col-md-10">
                <ul class="nav-tabs" role="tablist">
                    
                    <li class="active"><a href="#quizdetail" role="tab" data-toggle="tab">Quiz Details</a></li>
                    <li><a href="#introduction" role="tab" data-toggle="tab">Introduction</a></li>
                    <li><a href="#review" role="tab" data-toggle="tab">Review</a></li>
                    <li><a href="#conment" role="tab" data-toggle="tab">Conment</a></li>
                </ul>
                <!-- Tab panes -->
                <div class="tab-content">
                     <!--INTRODUCTION--> 
                    <div class="tab-pane fade" id="introduction">
                        <h4 class="sm black bold">Introduction</h4>
                        <p>${requestScope.quiz.description}</p>
                    
                    </div>
                     <!--END / INTRODUCTION--> 

                    <!-- Term -->
                    <div class="tab-pane fade in active" id="quizdetail">
                        <!-- SECTION Quizdetails -->
                        <div class="section-outline">
                            <h4 class="tit-section xsm">Questions in this Quiz (${requestScope.quiz.getListQuestions().size()})</h4>
                            <c:forEach begin = "0" end = "${requestScope.quiz.getListQuestions().size()-1}" var = "i">
                                <ul class="section-list">
                                    <li>
                                        <div style="width: 200px;" class="count"><span>${requestScope.quiz.getListQuestions().get(i).getRightAnswer()}</span></div>
                                        <div class="list-body">
                                            <p>
                                                <a href="#" style="font-size: 18px; font-weight: bold;">
                                                    ${requestScope.quiz.getListQuestions().get(i).getTitle()}</br>
                                                </a>
                                            </p>
                                            <c:forEach begin = "0" end = "${requestScope.quiz.getListQuestions().get(i).getListOptions().size()-1}" var = "x">
                                                <br>${requestScope.quiz.getListQuestions().get(i).getListOptions().get(x).getContent()}
                                            </c:forEach>
                                                <br><span class = "instruction" id="${i}">Instruction: ${requestScope.quiz.getListQuestions().get(i).intruction}</span>
                                        </div>
                                        <a id="showanswer${i}" onclick="showInstruction('${i}')" class="mc-btn-2 btn-style-2">Instruction</a>
                                        <a id="hideanswer${i}" style="display: none;" onclick="hideInstruction('${i}')" class="mc-btn-2 btn-style-2">Close Instruction</a>
                                    </li>
                                </ul>
                            </c:forEach>
                        </div>
                        <!-- END / SECTION OUTLINE -->
                    </div>
                    <!-- END / OUTLINE -->

                    <!-- REVIEW -->
                    <div class="tab-pane fade" id="review">
                        <div class="total-review">
                            <h3 class="md black">4 Reviews</h3>
                            <div class="rating">
                                <a href="#" class="active"></a>
                                <a href="#" class="active"></a>
                                <a href="#" class="active"></a>
                                <a href="#"></a>
                                <a href="#"></a>
                            </div>
                        </div>
                        <ul class="list-review">
                            <li class="review">
                                <div class="body-review">
                                    <div class="review-author">
                                        <a href="#">
                                            <img src="images/team-13.jpg" alt="">
                                            <i class="icon md-email"></i>
                                            <i class="icon md-user-plus"></i>
                                        </a>
                                    </div>
                                    <div class="content-review">
                                        <h4 class="sm black">
                                            <a href="#">John Doe</a>
                                        </h4>
                                        <div class="rating">
                                            <a href="#" class="active"></a>
                                            <a href="#" class="active"></a>
                                            <a href="#" class="active"></a>
                                            <a href="#"></a>
                                            <a href="#"></a>
                                        </div>

                                        <em>5 days ago</em>
                                        <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et,
                                            interdum semper quam. Fusce in interdum tortor. Ut sollicitudin
                                            lectus dolor eget imperdiet libero pulvinar sit amet</p>
                                    </div>
                                </div>
                            </li>
                            <li class="review">
                                <div class="body-review">
                                    <div class="review-author">
                                        <a href="#">
                                            <img src="images/team-13.jpg" alt="">
                                            <i class="icon md-email"></i>
                                            <i class="icon md-user-plus"></i>
                                        </a>
                                        <i class="icon"></i>
                                        <i class="icon"></i>
                                    </div>
                                    <div class="content-review">
                                        <h4 class="sm black">
                                            <a href="#">John Doe</a>
                                        </h4>
                                        <div class="rating">
                                            <a href="#" class="active"></a>
                                            <a href="#" class="active"></a>
                                            <a href="#" class="active"></a>
                                            <a href="#"></a>
                                            <a href="#"></a>
                                        </div>
                                        <em>5 days ago</em>
                                        <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et,
                                            interdum semper quam. Fusce in interdum tortor. Ut sollicitudin
                                            lectus dolor eget imperdiet libero pulvinar sit amet</p>
                                    </div>
                                </div>
                            </li>
                            <li class="review">
                                <div class="body-review">
                                    <div class="review-author">
                                        <a href="#">
                                            <img src="images/team-13.jpg" alt="">
                                            <i class="icon md-email"></i>
                                            <i class="icon md-user-plus"></i>
                                        </a>
                                        <i class="icon"></i>
                                        <i class="icon"></i>
                                    </div>
                                    <div class="content-review">
                                        <h4 class="sm black">
                                            <a href="#">John Doe</a>
                                        </h4>
                                        <div class="rating">
                                            <a href="#" class="active"></a>
                                            <a href="#" class="active"></a>
                                            <a href="#" class="active"></a>
                                            <a href="#"></a>
                                            <a href="#"></a>
                                        </div>
                                        <em>5 days ago</em>
                                        <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et,
                                            interdum semper quam. Fusce in interdum tortor. Ut sollicitudin
                                            lectus dolor eget imperdiet libero pulvinar sit amet</p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                        <div class="load-more">
                            <a href="#">
                                <i class="icon md-time"></i>
                                Load more previous update</a>
                        </div>
                    </div>
                    <!-- END / REVIEW -->


                    <!-- COMMENT -->
                    <div class="tab-pane fade" id="conment">
                        <div id="respond">
                            <h3 class="md black">100 Comments</h3>
                            <form>
                                <div class="comment-form-comment">
                                    <textarea placeholder="You have comment or question, write it here"></textarea>
                                </div>
                                <div class="form-submit">
                                    <input type="submit" value="Post" class="mc-btn-2 btn-style-2">
                                </div>
                            </form>
                        </div>
                        <ul class="commentlist">
                            <li class="comment">
                                <div class="comment-body">
                                    <div class="comment-author">
                                        <a href="#">
                                            <img src="images/team-13.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="comment-content">
                                        <cite class="fn sm black bold"><a href="#">John Doe</a></cite>
                                        <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et,
                                            interdum semper quam. Fusce in interdum tortor. Ut sollicitudin
                                            lectus dolor eget imperdiet libero pulvinar sit amet</p>

                                        <div class="comment-meta">
                                            <a href="#">5 days ago</a>
                                            <a href="#">Hide 2 replies</a>
                                            <a href="#"><i class="icon md-arrow-up"></i>13</a>
                                            <a href="#"><i class="icon md-arrow-down"></i>25</a>
                                        </div>

                                    </div>
                                </div>
                                <ul class="children">
                                    <li class="comment">
                                        <div class="comment-body">
                                            <div class="comment-author">
                                                <a href="#">
                                                    <img src="images/team-13.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="comment-content">
                                                <cite class="fn sm black bold"><a href="#">John
                                                        Doe</a></cite>
                                                <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in
                                                    elit et, interdum semper quam. Fusce in interdum tortor.
                                                    Ut sollicitudin lectus dolor eget imperdiet libero
                                                    pulvinar sit amet</p>

                                                <div class="comment-meta">
                                                    <a href="#">5 days ago</a>
                                                    <a href="#"><i class="icon md-arrow-up"></i>13</a>
                                                    <a href="#"><i class="icon md-arrow-down"></i>25</a>
                                                </div>

                                            </div>
                                        </div>
                                    </li>
                                    <li class="comment">
                                        <div class="comment-body">
                                            <div class="comment-author">
                                                <a href="#">
                                                    <img src="images/team-13.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="comment-content">
                                                <cite class="fn sm black bold"><a href="#">John
                                                        Doe</a></cite>
                                                <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in
                                                    elit et, interdum semper quam. Fusce in interdum tortor.
                                                    Ut sollicitudin lectus dolor eget imperdiet libero
                                                    pulvinar sit amet</p>

                                                <div class="comment-meta">
                                                    <a href="#">5 days ago</a>
                                                    <a href="#"><i class="icon md-arrow-up"></i>13</a>
                                                    <a href="#"><i class="icon md-arrow-down"></i>25</a>
                                                </div>

                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                            <li class="comment">
                                <div class="comment-body">
                                    <div class="comment-author">
                                        <a href="#">
                                            <img src="images/team-13.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="comment-content">
                                        <cite class="fn sm black bold"><a href="#">John Doe</a></cite>
                                        <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et,
                                            interdum semper quam. Fusce in interdum tortor. Ut sollicitudin
                                            lectus dolor eget imperdiet libero pulvinar sit amet</p>

                                        <div class="comment-meta">
                                            <a href="#">5 days ago</a>
                                            <a href="#">Hide 2 replies</a>
                                            <a href="#"><i class="icon md-arrow-up"></i>13</a>
                                            <a href="#"><i class="icon md-arrow-down"></i>25</a>
                                        </div>

                                    </div>
                                </div>
                            </li>
                            <li class="comment">
                                <div class="comment-body">
                                    <div class="comment-author">
                                        <a href="#">
                                            <img src="images/team-13.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="comment-content">
                                        <cite class="fn sm black bold"><a href="#">John Doe</a></cite>
                                        <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et,
                                            interdum semper quam. Fusce in interdum tortor. Ut sollicitudin
                                            lectus dolor eget imperdiet libero pulvinar sit amet</p>

                                        <div class="comment-meta">
                                            <a href="#">5 days ago</a>
                                            <a href="#">Hide 2 replies</a>
                                            <a href="#"><i class="icon md-arrow-up"></i>13</a>
                                            <a href="#"><i class="icon md-arrow-down"></i>25</a>
                                        </div>

                                    </div>
                                </div>
                            </li>
                            <li class="comment">
                                <div class="comment-body">
                                    <div class="comment-author">
                                        <a href="#">
                                            <img src="images/team-13.jpg" alt="">
                                        </a>
                                    </div>
                                    <div class="comment-content">
                                        <cite class="fn sm black bold"><a href="#">John Doe</a></cite>
                                        <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et,
                                            interdum semper quam. Fusce in interdum tortor. Ut sollicitudin
                                            lectus dolor eget imperdiet libero pulvinar sit amet</p>

                                        <div class="comment-meta">
                                            <a href="#">5 days ago</a>
                                            <a href="#">Hide 2 replies</a>
                                            <a href="#"><i class="icon md-arrow-up"></i>13</a>
                                            <a href="#"><i class="icon md-arrow-down"></i>25</a>
                                        </div>

                                    </div>
                                </div>
                            </li>
                        </ul>
                        <div class="load-more">
                            <a href="#">
                                <i class="icon md-time"></i>
                                Load more previous update</a>
                        </div>
                    </div>
                    <!-- END / COMMENT -->
                </div>
            </div>

            <!-- COURSE CONCERN -->
            <section id="course-concern" class="course-concern">
                <div class="container">
                    <h3 class="md black">Courses you may concern</h3>
                    <div class="row">
                        <div class="col-xs-6 col-sm-4 col-md-3">
                            <!-- MC ITEM -->
                            <div class="mc-item mc-item-2">
                                <div class="image-heading">
                                    <img src="images/feature/img-1.jpg" alt="">
                                </div>
                                <div class="meta-categories"><a href="#">Web design</a></div>
                                <div class="content-item">
                                    <div class="image-author">
                                        <img src="images/avatar-1.jpg" alt="">
                                    </div>
                                    <h4><a href="course-intro.html">The Complete Digital Photography Course Amazon Top
                                            Seller</a></h4>
                                    <div class="name-author">
                                        By <a href="#">Name of Mr or Mrs</a>
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
                                    <div class="price">
                                        $190
                                        <span class="price-old">$134</span>
                                    </div>
                                </div>
                            </div>
                            <!-- END / MC ITEM -->
                        </div>

                        <div class="col-xs-6 col-sm-4 col-md-3">
                            <!-- MC ITEM -->
                            <div class="mc-item mc-item-2">
                                <div class="image-heading">
                                    <img src="images/feature/img-1.jpg" alt="">
                                </div>
                                <div class="meta-categories"><a href="#">Web design</a></div>
                                <div class="content-item">
                                    <div class="image-author">
                                        <img src="images/avatar-1.jpg" alt="">
                                    </div>
                                    <h4><a href="course-intro.html">The Complete Digital Photography Course Amazon Top
                                            Seller</a></h4>
                                    <div class="name-author">
                                        By <a href="#">Name of Mr or Mrs</a>
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
                                    <div class="price">
                                        $190
                                        <span class="price-old">$134</span>
                                    </div>
                                </div>
                            </div>
                            <!-- END / MC ITEM -->
                        </div>

                        <div class="col-xs-6 col-sm-4 col-md-3">
                            <!-- MC ITEM -->
                            <div class="mc-item mc-item-2">
                                <div class="image-heading">
                                    <img src="images/feature/img-1.jpg" alt="">
                                </div>
                                <div class="meta-categories"><a href="#">Web design</a></div>
                                <div class="content-item">
                                    <div class="image-author">
                                        <img src="images/avatar-1.jpg" alt="">
                                    </div>
                                    <h4><a href="course-intro.html">The Complete Digital Photography Course Amazon Top
                                            Seller</a></h4>
                                    <div class="name-author">
                                        By <a href="#">Name of Mr or Mrs</a>
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
                                    <div class="price">
                                        $190
                                        <span class="price-old">$134</span>
                                    </div>
                                </div>
                            </div>
                            <!-- END / MC ITEM -->
                        </div>

                        <div class="col-xs-6 col-sm-4 col-md-3">
                            <!-- MC ITEM -->
                            <div class="mc-item mc-item-2">
                                <div class="image-heading">
                                    <img src="images/feature/img-1.jpg" alt="">
                                </div>
                                <div class="meta-categories"><a href="#">Web design</a></div>
                                <div class="content-item">
                                    <div class="image-author">
                                        <img src="images/avatar-1.jpg" alt="">
                                    </div>
                                    <h4><a href="course-intro.html">The Complete Digital Photography Course Amazon Top
                                            Seller</a></h4>
                                    <div class="name-author">
                                        By <a href="#">Name of Mr or Mrs</a>
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
                                    <div class="price">
                                        $190
                                        <span class="price-old">$134</span>
                                    </div>
                                </div>
                            </div>
                            <!-- END / MC ITEM -->
                        </div>
                    </div>
                </div>
            </section>
            <!-- END / COURSE CONCERN -->


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
        <script>
            function showInstruction(s) {
                var showanswer = "showanswer"+s;
                var hideanswer = "hideanswer"+s;
                document.getElementById(s).style.display = 'inherit';
                document.getElementById(showanswer).style.display = 'none';
                document.getElementById(hideanswer).style.display = 'inherit';
                }
                function hideInstruction(s) {
                var showanswer = "showanswer"+s;
                var hideanswer = "hideanswer"+s;
                console.log(s);
                document.getElementById(s).style.display = 'none';
                document.getElementById(showanswer).style.display = 'inherit';
                document.getElementById(hideanswer).style.display = 'none';
                }
        </script>
    </body>


</html>