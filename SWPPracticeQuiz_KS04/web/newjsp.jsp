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
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
            <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
        <![endif]-->
        <title>QuizPractice Details Quiz</title>
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
                <!--            <section class="sub-banner sub-banner-course">
                                <div class="awe-static bg-sub-banner-course"></div>
                                <div class="container">
                                    <div class="sub-banner-content">
                                        <h2 class="text-center">Home Fitness Training</h2>
                                    </div>
                                </div>
                            </section>-->
                <!-- END / SUB BANNER -->


                <!-- COURSE -->
                <section class="course-top">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-5">
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
                                    <a href="ViewQuizDetailController?quizid=${quizid}&currentIndex=${currentIndex-1}" ><img width="30px" src="https://cdn-icons-png.flaticon.com/128/2879/2879564.png" alt=""></a>
                                    <span style="color: black; font-size: 18px;"> ${currentIndex}/${requestScope.quiz.getListQuestions().size()} </span>
                                    <a href="ViewQuizDetailController?quizid=${quizid}&currentIndex=${currentIndex+1}"><img width="30px" src="https://cdn-icons-png.flaticon.com/128/2879/2879593.png" alt=""></a>
                                </div>

                                <div class="new-course">
                                    <div class="item course-code">
                                        <i class="icon md-barcode"></i>
                                        <h4><a href="#">Course Code</a></h4>
                                        <p class="detail-course"># A 15273</p>
                                    </div>
                                    <div class="item course-code">
                                        <i class="icon md-time"></i>
                                        <h4><a href="#">Duration</a></h4>
                                        <p class="detail-course">3 weeks</p>
                                    </div>
                                    <div class="item course-code">
                                        <i class="icon md-img-check"></i>
                                        <h4><a href="#">Open Date</a></h4>
                                        <p class="detail-course">25 May 2014</p>
                                    </div>
                                </div>
                                <hr class="line">
                                <div class="about-instructor">
                                    <h4 class="xsm black bold">About Instructor</h4>
                                    <ul>
                                        <li>
                                            <div class="image-instructor text-center">
                                                <img src="images/team-13.jpg" alt="">
                                            </div>
                                            <div class="info-instructor">
                                                <cite class="sm black"><a href="#">John Doe</a></cite>
                                                <a href="#"><i class="fa fa-star"></i></a>
                                                <a href="#"><i class="fa fa-envelope"></i></a>
                                                <a href="#"><i class="fa fa-check-square"></i></a>
                                                <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et, interdum semper quam. Fusce in interdum tortor. Ut sollicitudin lectus dolor eget imperdiet libero</p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="image-instructor">
                                                <img src="images/team-13.jpg" alt="">
                                            </div>
                                            <div class="info-instructor">
                                                <cite class="sm black"><a href="#">John Doe</a></cite>
                                                <a href="#"><i class="fa fa-envelope"></i></a>
                                                <a href="#"><i class="icon md-user-plus"></i></a>
                                                <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et, interdum semper quam. Fusce in interdum tortor. Ut sollicitudin lectus dolor eget imperdiet libero</p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <hr class="line">
                                <div class="widget widget_equipment">
                                    <i class="icon md-config"></i>
                                    <h4 class="xsm black bold">Equipment</h4>
                                    <div class="equipment-body">
                                        <a href="#">Photoshop CC</a>,
                                        <a href="#">Illustrator CC</a>
                                    </div>
                                </div>
                                <div class="widget widget_tags">
                                    <i class="icon md-download-2"></i>
                                    <h4 class="xsm black bold">Tag</h4>
                                    <div class="tagCould">
                                        <a href="#">Design</a>, 
                                        <a href="#">Photoshop</a>, 
                                        <a href="#">Illustrator</a>, 
                                        <a href="#">Art</a>, 
                                        <a href="#">Graphic Design</a>
                                    </div>
                                </div>
                                <div class="widget widget_share">
                                    <i class="icon md-forward"></i>
                                    <h4 class="xsm black bold">Share course</h4>
                                    <div class="share-body">
                                        <a href="#" class="twitter" title="twitter">
                                            <i class="icon md-twitter"></i>
                                        </a>
                                        <a href="#" class="pinterest" title="pinterest">
                                            <i class="icon md-pinterest-1"></i>
                                        </a>
                                        <a href="#" class="facebook" title="facebook">
                                            <i class="icon md-facebook-1"></i>
                                        </a>
                                        <a href="#" class="google-plus" title="google plus">
                                            <i class="icon md-google-plus"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>    
                        <div class="col-md-7">
                            <div class="tabs-page">
                                <ul class="nav-tabs" role="tablist">
                                    <li class="active"><a href="#introduction" role="tab" data-toggle="tab">Introduction</a></li>
                                    <li><a href="#outline" role="tab" data-toggle="tab">Terms</a></li>
                                    <li><a href="#review" role="tab" data-toggle="tab">Review</a></li>
                                    <li><a href="#student" role="tab" data-toggle="tab">Student</a></li>
                                    <li><a href="#conment" role="tab" data-toggle="tab">Conment</a></li>
                                </ul>
                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <!-- INTRODUCTION -->
                                    <div class="tab-pane fade in active" id="introduction">
                                        <h4 class="sm black bold">Introduction</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</p>
                                        <h4 class="sm black bold">Goal of Course</h4>
                                        <ul class="list-disc">
                                            <li><p>sed diam nonummy nibh euismod tincidunt ut laoreet</p></li>
                                            <li><p>sed diam nonummy nibh euismod tincidunt utrlaoreet</p></li>
                                        </ul>

                                        <h4 class="sm black bold">About Judgement</h4>
                                        <p>Nunc quis vulputate metus, ac dapibus ligula. Etiam interdum ornare rutrum. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam elementum felis diam, non pellentesque est iaculis ac. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed ultricies hendrerit diam, eget molestie ipsum gravida vel. Mauris aliquam ante scelerisque odio tincidunt porttitor. Nulla vitae tellus dictum, vehicula elit eu, elementum arcu. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nam sodales lacinia ligula sed egestas. Suspendisse purus metus, pharetra non convallis eget, aliquet ut nisi. Etiam malesuada porta posuere. Integer eget erat enim. Maecenas rhoncus tincidunt dui id tincidunt. Pellentesque quis dapibus erat.<br><br>Etiam dignissim tellus quis nulla accumsan, eget elementum ipsum blandit. Morbi sodales tellus id nisl porta cursus. Nam nisl mauris, convallis non accumsan ac, auctor sed lacus. Maecenas laoreet, nibh a facilisis sagittis, sem ante facilisis lectus, non porta mi odio sit amet ligula. Phasellus ac dolor nec odio dictum tristique. Donec convallis libero eros, nec imperdiet sem vulputate non. Vestibulum in lacus id nisi pulvinar elementum. Fusce lorem libero, tempus id elit vitae, ultrices tincidunt sapien. Nunc vestibulum libero vel ligula gravida, a convallis massa ultricies. Donec tristique ligula ut turpis auctor, ut ornare elit porta. Morbi sit amet velit laoreet, feugiat purus non, lobortis tellus. Maecenas eu eros sit amet erat condimentum auctor eu at diam. Phasellus id sem nis</p>
                                    </div>
                                    <!-- END / INTRODUCTION -->

                                    <!-- Term -->
                                    <!--                                    <div class="tab-pane fade" id="outline">
                                                                             SECTION TERMS 
                                                                            <div class="section-outline">
                                    <%--<c:forEach begin = "0" end = "${requestScope.quiz.getListQuestions().size()}" var = "i">--%>
                                    <h4 class="tit-section xsm">Question ${i+1}</h4>
                                    <ul class="section-list">
                                            <li>
                                                <div style="width: 200px;" class="count" ><span>${x.getRightAnswer()}</span></div>
                                                <div class="list-body">
                                                    <p><a href="#">${i.getTitle()}</a></p>
                                    <%--<c:forEach items = "${requestScope.quiz.getListQuestions().get(i).getListOptions().size()}" var = "x">--%>
                                    <p>${x.getContent()}</p>
                                    <%--</c:forEach>--%>
                                </div>
                                <a href="#" class="mc-btn-2 btn-style-2">Preview</a>
                            </li>
                    </ul>
                                    <%--</c:forEach>--%>            
                                </div>
                            </div>-->

                                    <!-- Term -->
                                    <div class="tab-pane fade" id="outline">

                                        <!-- SECTION TERMS -->
                                        <div class="section-outline">
                                            <h4 class="tit-section xsm">Questions in this Quiz (${requestScope.quiz.getListQuestions().size()})</h4>
                                            <c:forEach begin = "0" end = "${requestScope.quiz.getListQuestions().size()-1}" var = "i">
                                                <ul class="section-list">
                                                    <li>
                                                        <div style="width: 200px;" class="count"><span>${requestScope.quiz.getListQuestions().get(i).getRightAnswer()}</span></div>
                                                        <div class="list-body">
                                                            <p>
                                                                <a href="#">
                                                                    ${requestScope.quiz.getListQuestions().get(i).getTitle()}</br>
                                                                </a>
                                                            </p>
                                                            <c:forEach begin = "0" end = "${requestScope.quiz.getListQuestions().get(i).getListOptions().size()-1}" var = "x">
                                                                </br>${requestScope.quiz.getListQuestions().get(i).getListOptions().get(x).getContent()}
                                                            </c:forEach>
                                                        </div>
                                                        <a href="#" class="mc-btn-2 btn-style-2">Preview</a>
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
                                                        <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et, interdum semper quam. Fusce in interdum tortor. Ut sollicitudin lectus dolor eget imperdiet libero pulvinar sit amet</p>
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
                                                        <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et, interdum semper quam. Fusce in interdum tortor. Ut sollicitudin lectus dolor eget imperdiet libero pulvinar sit amet</p>
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
                                                        <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et, interdum semper quam. Fusce in interdum tortor. Ut sollicitudin lectus dolor eget imperdiet libero pulvinar sit amet</p>
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

                                    <!-- STUDENT -->
                                    <div class="tab-pane fade" id="student">
                                        <h3 class="md black">53618 Students applied</h3>
                                        <div class="tab-list-student">
                                            <ul class="list-student">
                                                <!-- LIST STUDENT -->
                                                <li>
                                                    <div class="image">
                                                        <img src="images/team-13.jpg" alt="">
                                                    </div>
                                                    <div class="list-body">
                                                        <cite class="xsm"><a href="#">Neo Khuat</a></cite>
                                                        <span class="address">Hanoi, Vietnam</span>
                                                        <div class="icon-wrap">
                                                            <a href="#"><i class="icon md-email"></i></a>
                                                            <a href="#"><i class="icon md-user-plus"></i></a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <!-- END / LIST STUDENT -->

                                                <!-- LIST STUDENT -->
                                                <li>
                                                    <div class="image">
                                                        <img src="images/team-13.jpg" alt="">
                                                    </div>
                                                    <div class="list-body">
                                                        <cite class="xsm"><a href="#">Neo Khuat</a></cite>
                                                        <span class="address">Hanoi, Vietnam</span>
                                                        <div class="icon-wrap">
                                                            <a href="#"><i class="icon md-email"></i></a>
                                                            <a href="#"><i class="icon md-user-plus"></i></a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <!-- END / LIST STUDENT -->

                                                <!-- LIST STUDENT -->
                                                <li>
                                                    <div class="image">
                                                        <img src="images/team-13.jpg" alt="">
                                                    </div>
                                                    <div class="list-body">
                                                        <cite class="xsm"><a href="#">Neo Khuat</a></cite>
                                                        <span class="address">Hanoi, Vietnam</span>
                                                        <div class="icon-wrap">
                                                            <a href="#"><i class="icon md-email"></i></a>
                                                            <a href="#"><i class="icon md-user-plus"></i></a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <!-- END / LIST STUDENT -->

                                                <!-- LIST STUDENT -->
                                                <li>
                                                    <div class="image">
                                                        <img src="images/team-13.jpg" alt="">
                                                    </div>
                                                    <div class="list-body">
                                                        <cite class="xsm"><a href="#">Neo Khuat</a></cite>
                                                        <span class="address">Hanoi, Vietnam</span>
                                                        <div class="icon-wrap">
                                                            <a href="#"><i class="icon md-email"></i></a>
                                                            <a href="#"><i class="icon md-user-plus"></i></a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <!-- END / LIST STUDENT -->

                                                <!-- LIST STUDENT -->
                                                <li>
                                                    <div class="image">
                                                        <img src="images/team-13.jpg" alt="">
                                                    </div>
                                                    <div class="list-body">
                                                        <cite class="xsm"><a href="#">Neo Khuat</a></cite>
                                                        <span class="address">Hanoi, Vietnam</span>
                                                        <div class="icon-wrap">
                                                            <a href="#"><i class="icon md-email"></i></a>
                                                            <a href="#"><i class="icon md-user-plus"></i></a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <!-- END / LIST STUDENT -->

                                                <!-- LIST STUDENT -->
                                                <li>
                                                    <div class="image">
                                                        <img src="images/team-13.jpg" alt="">
                                                    </div>
                                                    <div class="list-body">
                                                        <cite class="xsm"><a href="#">Neo Khuat</a></cite>
                                                        <span class="address">Hanoi, Vietnam</span>
                                                        <div class="icon-wrap">
                                                            <a href="#"><i class="icon md-email"></i></a>
                                                            <a href="#"><i class="icon md-user-plus"></i></a>
                                                        </div>
                                                    </div>
                                                </li>
                                                <!-- END / LIST STUDENT -->

                                            </ul>
                                        </div>
                                        <div class="load-more">
                                            <a href="#">
                                                <i class="icon md-time"></i>
                                                Load more previous update</a>
                                        </div>
                                    </div>
                                    <!-- END / STUDENT -->

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
                                                        <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et, interdum semper quam. Fusce in interdum tortor. Ut sollicitudin lectus dolor eget imperdiet libero pulvinar sit amet</p>

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
                                                                <cite class="fn sm black bold"><a href="#">John Doe</a></cite>
                                                                <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et, interdum semper quam. Fusce in interdum tortor. Ut sollicitudin lectus dolor eget imperdiet libero pulvinar sit amet</p>

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
                                                                <cite class="fn sm black bold"><a href="#">John Doe</a></cite>
                                                                <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et, interdum semper quam. Fusce in interdum tortor. Ut sollicitudin lectus dolor eget imperdiet libero pulvinar sit amet</p>

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
                                                        <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et, interdum semper quam. Fusce in interdum tortor. Ut sollicitudin lectus dolor eget imperdiet libero pulvinar sit amet</p>

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
                                                        <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et, interdum semper quam. Fusce in interdum tortor. Ut sollicitudin lectus dolor eget imperdiet libero pulvinar sit amet</p>

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
                                                        <p>Morbi nec nisi ante. Quisque lacus ligula, iaculis in elit et, interdum semper quam. Fusce in interdum tortor. Ut sollicitudin lectus dolor eget imperdiet libero pulvinar sit amet</p>

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
                        </div>
                    </div>
                </div>
            </section>
            <!-- END / COURSE TOP -->

            <!-- FORM CHECKOUT -->
            <div class="form-checkout">
                <div class="container">
                    <div class="row">
                        <div class="col-md-10 col-md-offset-1">
                            <form>
                                <ul id="bar">
                                    <li class="active"><span class="count">1</span>Register</li>
                                    <li><span class="count">2</span>Order and payment</li>
                                    <li><span class="count">3</span>Finish checkout</li>
                                </ul>
                                <span class="closeForm"><i class="icon md-close-1"></i></span>
                                <div class="form-body">
                                    <!-- fieldsets -->
                                    <fieldset>
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="form-1">
                                                    <h3 class="fs-title text-capitalize">sign in</h3>
                                                    <div class="form-email">
                                                        <input type="text" placeholder="Email">
                                                    </div>
                                                    <div class="form-password">
                                                        <input type="password" placeholder="Password">
                                                    </div>
                                                    <div class="form-check">
                                                        <input type="checkbox" id="check">
                                                        <label for="check">
                                                            <i class="icon md-check-2"></i>
                                                            Remember me</label>
                                                        <a href="#">Forget password?</a>
                                                    </div>
                                                    <div class="form-submit-1">
                                                        <input type="button" value="Sign In and Continue" class="next mc-btn btn-style-1">
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-2">
                                                    <h3 class="fs-title text-capitalize">New Member</h3>
                                                    <div class="form-firstname">
                                                        <input type="text" placeholder="First name" />
                                                    </div>
                                                    <div class="form-lastname">
                                                        <input type="text" placeholder="Last name" />
                                                    </div>
                                                    <div class="form-datebirth">
                                                        <input type="text" placeholder="Date of Birth">
                                                    </div>
                                                    <div class="form-email">
                                                        <input type="text" name="pass" placeholder="Annamolly@outlook.com" class="error">
                                                        <span class="text-error">this email has been already taken</span>
                                                    </div>
                                                    <div class="form-password">
                                                        <input type="password" name="pass" placeholder="Password" class="valid">
                                                    </div>
                                                    <div class="form-submit-1">
                                                        <input type="button" value="Sign Up and Continue" class="next mc-btn btn-style-1">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset>
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="form-1">
                                                    <div class="mc-item mc-item-2">
                                                        <div class="image-heading">
                                                            <img src="images/feature/img-1.jpg" alt="">
                                                        </div>
                                                        <div class="meta-categories"><a href="#">Web design</a></div>
                                                        <div class="content-item">
                                                            <div class="image-author">
                                                                <img src="images/avatar-1.jpg" alt="">
                                                            </div>
                                                            <h4><a href="course-intro.html">The Complete Digital Photography Course Amazon Top Seller</a></h4>
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
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-2">
                                                    <h3 class="fs-title">Choose your payment method</h3>
                                                    <ul class="pay">
                                                        <li>
                                                            <input type="radio" name="pay" id="visa">
                                                            <label for="visa">
                                                                <i class="icon-radio"></i>
                                                                Visa / Master Card
                                                            </label>
                                                        </li>
                                                        <li>
                                                            <input type="radio" name="pay" id="paypal">
                                                            <label for="paypal">
                                                                <i class="icon-radio"></i>
                                                                Paypal
                                                            </label>
                                                        </li>
                                                        <li>
                                                            <input type="radio" name="pay" id="cash">
                                                            <label for="cash">
                                                                <i class="icon-radio"></i>
                                                                Cash
                                                            </label>
                                                        </li>
                                                    </ul>

                                                    <div class="form-cardnumber">
                                                        <label for="cardnumber">Card number</label>
                                                        <input type="text" id="cardnumber">
                                                    </div>

                                                    <div class="form-expirydate">
                                                        <label for="expirydate">Expiry date</label>
                                                        <input type="text" id="expirydate">
                                                        <input type="text">
                                                    </div>

                                                    <div class="form-code">
                                                        <label for="code">Code</label>
                                                        <input type="text" id="code">
                                                    </div>

                                                    <div class="clearfix"></div>

                                                    <div class="form-couponcode">
                                                        <label for="couponcode">Coupon code</label>
                                                        <input type="text" id="couponcode">
                                                    </div>

                                                    <div class="form-total">
                                                        <h4>Total Payment</h4>
                                                        <span class="price">$89</span>
                                                    </div>

                                                    <div class="clearfix"></div>

                                                    <div class="form-submit-1">
                                                        <input type="button" value="Confirm and Finish" class="next mc-btn btn-style-1">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>

                                    <fieldset>
                                        <div class="row">
                                            <div class="col-md-5">
                                                <div class="form-1">
                                                    <div class="mc-item mc-item-2">
                                                        <div class="image-heading">
                                                            <img src="images/feature/img-1.jpg" alt="">
                                                        </div>
                                                        <div class="meta-categories"><a href="#">Web design</a></div>
                                                        <div class="content-item">
                                                            <div class="image-author">
                                                                <img src="images/avatar-1.jpg" alt="">
                                                            </div>
                                                            <h4><a href="course-intro.html">The Complete Digital Photography Course Amazon Top Seller</a></h4>
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
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-2">
                                                    <h3 class="fs-title">Thank You For Your Purchase</3>
                                                        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci.</p>

                                                        <div class="widget widget_share">
                                                            <h4>Share</h4>
                                                            <div class="share-body">
                                                                <a href="#" class="twitter" title="twitter">
                                                                    <i class="icon md-twitter"></i>
                                                                </a>
                                                                <a href="#" class="pinterest" title="pinterest">
                                                                    <i class="icon md-pinterest-1"></i>
                                                                </a>
                                                                <a href="#" class="facebook" title="facebook">
                                                                    <i class="icon md-facebook-1"></i>
                                                                </a>
                                                                <a href="#" class="google-plus" title="google plus">
                                                                    <i class="icon md-google-plus"></i>
                                                                </a>
                                                            </div>
                                                        </div>

                                                        <div class="form-submit-1">
                                                            <input type="submit" value="Start Learning" class="next mc-btn btn-style-1">
                                                        </div>
                                                </div>
                                            </div>
                                        </div>
                                    </fieldset>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END / FORM CHECKOUT -->

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
                                    <h4><a href="course-intro.html">The Complete Digital Photography Course Amazon Top Seller</a></h4>
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
                                    <h4><a href="course-intro.html">The Complete Digital Photography Course Amazon Top Seller</a></h4>
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
                                    <h4><a href="course-intro.html">The Complete Digital Photography Course Amazon Top Seller</a></h4>
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
                                    <h4><a href="course-intro.html">The Complete Digital Photography Course Amazon Top Seller</a></h4>
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

    </body>

    <!-- Mirrored from tk-themes.net/html-megacourse/course-intro.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 26 May 2022 16:35:09 GMT -->
</html>