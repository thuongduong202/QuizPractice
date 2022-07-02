<%-- 
    Document   : viewOwnQuiz
    Created on : Jun 12, 2022, 4:23:50 PM
    Author     : fptshop
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <!-- Google font -->
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:300,400,700,900' rel='stylesheet' type='text/css'>
        <!-- Css -->
        <link rel="stylesheet" type="text/css" href="css/library/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="css/library/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="css/library/owl.carousel.css">
        <link rel="stylesheet" type="text/css" href="css/library/magnific-popup.css">
        <link rel="stylesheet" type="text/css" href="css/md-font.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title>QuizPractice View Own Quiz</title>
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
                        <div class="info-author">
                            <div class="image">
                            <c:if test="${user.avatar==null}">
                                <img src="imageUpload/default-avatar.png" alt="avatar">
                            </c:if>
                            <c:if test="${user.avatar!=null}">
                                <img src="imageUpload/${user.avatar}" alt="avatar">
                            </c:if>
                        </div>    
                        <div class="name-author">
                            <h2 class="big">${user.userName}</h2>
                        </div>     
                        <div class="address-author">
                            <i style="color: white;"class="icon md-email"></i>
                            <h3>${user.email}</h3>
                        </div>
                        <div class="address-author" style="margin-left: 80px;">
                            <i style="color: white;" class="icon md-user-minus"></i>
                            <h3>${user.aboutMe}</h3>
                        </div>

                    </div>
                    <div class="info-follow">
                        <div class="trophies">
                            <span>${numberOfQuiz}</span>
                            <p>Created</p>
                        </div>
                        <div class="trophies">
                            <span>${user.phone}</span>
                            <p>Phone</p>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END / SUB BANNER -->
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
                        </div>
                    </div>
                </section>
                <!-- END / PAGE CONTROL -->

                <!-- CATEGORIES CONTENT -->
                <section id="categories-content" class="categories-content">
                    <div class="container">
                        <div class="row" >

                            <div class="col-md-9 col-md-push-3">
                                <div class="content grid">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <nav aria-label="...">
                                            <c:if test="${endPage>=2}">
                                                <ul class="pagination">
                                                    <c:if test="${index != 1}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="ViewOwnQuizController?index=${index-1}&categoryId=${requestScope.categoryId}&txtSearch=${txtSearch}">Previous</a>
                                                        </li>
                                                    </c:if>
                                                    <c:forEach begin="1" end ="${endPage}" var="i">
                                                        <li class="page-item  ${index==i?"active":""}" aria-current="page">
                                                            <a class="page-link" href="ViewOwnQuizController?index=${i}&categoryId=${requestScope.categoryId}&txtSearch=${txtSearch}">${i}</a>
                                                        </li>
                                                    </c:forEach>
                                                    <c:if test="${index != endPage}">
                                                        <li class="page-item">
                                                            <a class="page-link" href="ViewOwnQuizController?index=${index+1}&categoryId=${requestScope.categoryId}&txtSearch=${txtSearch}">Next</a>
                                                        </li>
                                                    </c:if>
                                                </ul>
                                            </c:if>



                                        </nav>
                                    </div>
                                    <div class="col-md-6" style="margin-top: 16px;" >
                                        <form style="margin-left: 0;" action="ViewOwnQuizController" method="POST">
                                            <input style="margin-left: 0;"type="text" name="categoryId" value="${requestScope.categoryId}" hidden>
                                            <input style="margin-left: 30px;border:2px solid black;
                                                   border-radius: 20px;padding-left: 5px; font-size: 15px; font-weight: bold; padding-left: 5px;" 
                                                   type="Text" name="txtSearch" value="${txtSearch}" placeholder="">
                                            <span><button class= "search-button" type="submit" name="btn-search" class="">Search</button></span>
                                        </form> 
                                    </div>
                                </div>
                                <p id="message" style="color: blue; font-weight: bold">${message}</p>     
                                <div class="row" id="content" style="padding-top: 18px ;" >

                                    <!-- ITEM -->
                                    <c:if test="${requestScope.listQuiz==null}">
                                        <p style="font-size: 30px; color: black; font-weight: bold;">No Quiz found.</p>
                                    </c:if>
                                    <c:if test="${requestScope.listQuiz!=null}">
                                        <c:if test="${requestScope.listQuiz.size()==0}">
                                            <p style="font-size: 30px; color: black; font-weight: bold;">No Quiz found.</p>
                                        </c:if>
                                        <c:forEach items = "${requestScope.listQuiz}" var = "x">
                                            <div class="col-sm-6 col-md-4">
                                                <div class="mc-item mc-item-2" style="">
                                                    <div class="Box">
                                                        <div  class="meta-categories"><a href="#">${x.title}</a></div>
                                                    </div>                                                    
                                                    <div  class="meta-categories">
                                                        <a href="#" style=" width: 100%; background-color: white; color: black; font-weight:bolder ">${x.title}</a> 
                                                    </div>
                                                    <div class="content-item " style="padding-top: 40px;">
                                                        <h4><a href="#">${x.description}</a></h4>
                                                        <div class="name-author">
                                                            By <a href="#">${sessionScope.user.userName}</a>
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
                                                    </div>
                                                    <div style="align-content: center;">
                                                        <!-- HTML !-->
                                                        <a href="ViewQuizDetailController?quizid=${x.quizid}"><button class="button-66" role="button">View Quiz</button></a>

                                                        <span><a href="EditQuizController?quizid=${x.quizid}"><button class="button-55"><i style="color: black;" class="icon md-pencil"></i></button></a></span>
                                                        <span><a href="DeleteQuizController?quizid=${x.quizid}" onclick="return confirm('Are you sure you want to Delete Quiz?');"
                                                                 ><button class="button-55"><i style="color: black;"class="icon md-recycle"></i></button></a></span>
                                                        
                                                    </div>
                                                </div>
                                            </div>

                                            <!-- END / ITEM -->
                                        </c:forEach>
                                    </c:if>
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
                                            <li><a href="ViewOwnQuizController" <c:if test="${requestScope.categoryId == null || requestScope.categoryId eq ''}"> style="color: blue;" </c:if> 
                                                   >All Quiz</a></li>
                                                <c:forEach items = "${listC}" var = "o">
                                                <li><a href="ViewOwnQuizController?categoryId=${o.categoryId}"
                                                       <c:if test="${requestScope.categoryId eq o.categoryId}">
                                                           style="color: blue;"
                                                       </c:if>
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
            <script type="text/javascript" src="js/library/jquery.easing.min.js"></script>
            <script type="text/javascript" src="js/library/jquery.magnific-popup.min.js"></script>
            <script type="text/javascript" src="js/scripts.js"></script>
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="js/deleteQuiz.js" type="text/javascript"></script>
        <script>
            if ($('.popup-with-zoom-anim').length) {
            $('.popup-with-zoom-anim').magnificPopup({
            type: 'inline',
                    fixedContentPos: false,
                    fixedBgPos: true,
                    overflowY: 'auto',
                    closeBtnInside: true,
                    preloader: false,
                    midClick: true,
                    removalDelay: 300,
                    mainClass: 'my-mfp-zoom-in'
            });
            $('.design-course-popup').delegate('.cancel', 'click', function (evt) {
            evt.preventDefault();
            $('.mfp-close').trigger('click');
            });
            }
            $()
            function searchbyTitle(param){
            var txtSearch = param.value; // get values from input
            $.ajax({
            url:"/SWPPracticeQuiz_KS04/SerachByAjax",
                    type: "get" // send it through method
                    data:{
                    inputWords: txtSearch
                    }
            success: fuction(data){
            var row = document.getElementById("content");
            row.innerHTML = data;
            },
                    error: function(xhr){

                    }
            });
            };
            
        </script>
    </body>

</html>
