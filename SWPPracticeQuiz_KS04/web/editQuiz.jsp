<%-- 
    Document   : createQuiz
    Created on : Jun 7, 2022, 4:13:55 PM
    Author     : HP
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
        <link rel="stylesheet" type="text/css" href="css/library/magnific-popup.css">
        <link rel="stylesheet" type="text/css" href="css/md-font.css">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <!--[if lt IE 9]>
            <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
            <script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script>
        <![endif]-->
        <title>QuizPractice Create Quiz </title>

        <style>
            body{
                font-size: 1.5em;
                font-weight: bold;

            }
            input{
                color: black;
                font-family: Arial,sans-serif;
            }
            textarea{
                color: black;
                font-family: Arial,sans-serif;
                font-weight: initial;
            }
            h5,label{
                font-weight: bold;
                color: black;
            }

        </style>
    </head>
    <body id="page-top">

        <!-- PAGE WRAP -->
        <div id="page-wrap">
            <!--HEADER-->
            <jsp:include page="Header.jsp"></jsp:include>
                <!--END HEADER-->
                <!-- CREATE QUIZ CONTENT -->
                <section id="create-course-section" class="create-course-section">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="create-course-content">
                                    <!-- BAR CONTENT -->
                                    <ul class="design-course-tabs" role="tablist">
                                        <li>
                                            <a href="ViewOwnQuizController" class="home"> Back </a>
                                        </li>
                                        <li class="active">
                                            <a href="#" role="tab" data-toggle="tab"><i class="icon md-pencil"></i>Edit Quiz</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <!-- DESIGN OUTLINE -->
                                        <div class="tab-pane fade in active" id="design-outline">
                                            <!-- SECTIONS -->
                                            <form action="EditQuizController" method="post">
                                                <div class="dc-sections">
                                                    <!-- DC SECTION INFO -->

                                                    <div class="dc-section-info">
                                                        <!-- DC SECTION BODY -->
                                                        <div class="dc-section-body">
                                                            <!-- DC UNIT -->
                                                            <div class="dc-unit-info dc-course-item">
                                                                <div class="unit-body dc-item-body">
                                                                    <div class="tb-course">
                                                                        <div>
                                                                            <div class="tb-unit-title">
                                                                                <div>
                                                                                    <label for="">Title</label>
                                                                                </div>
                                                                                <div class="td-form-item">
                                                                                    <div class="form-textarea-wrapper">
                                                                                        <textarea style="height: 40px;" rows="1" name="titleQuiz" required id="titleQuiz">${quiz.title}</textarea>
                                                                                </div>
<!--                                                                                    <div class="form-item">
                                                                                        <input style="width: 100%;color: black;" type="text" name="titleQuiz" required="" id="titleQuiz" value="${quiz.title}">
                                                                                </div>-->
                                                                            </div>
                                                                        </div>

                                                                        <div class="tb-desc">
                                                                            <div>
                                                                                <label for="">Description</label>
                                                                            </div>
                                                                            <div class="td-form-item">
                                                                                <div class="form-textarea-wrapper">
                                                                                    <textarea name="description">${quiz.description}</textarea>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <!-- END / DC UNIT -->



                                                        <!-- DC CATEGORY -->
                                                        <div class="dc-quizz-info dc-course-item">
                                                            <div class="dc-content-title">
                                                                <h5 class="xsm black">CATEGORY</h5>
                                                            </div>
                                                            <div class="quizz-body dc-item-body">
                                                                <div class="form-item form-checkbox checkbox-style">
                                                                    <c:forEach items="${listCategory}" var='o'>
                                                                        <input type="checkbox" id='${o.categoryId}' name="category" value="${o.categoryId}"
                                                                               <c:if test="${o.cateOfQuiz==true}">checked</c:if>
                                                                               >
                                                                        <label for="${o.categoryId}">
                                                                            <i style="width: 18px; height: 18px; font-size: 16px;"class="icon-checkbox icon md-check-1"></i>
                                                                            ${o.categoryName}
                                                                        </label>
                                                                    </c:forEach>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- END / DC CATEGORY -->

                                                        
                                                            <!-- DC QUESTION -->
                                                            <div id='createQuestion'>
                                                                <c:if test="${requestScope.quiz.getListQuestions().size()>0}">
                                                                <c:forEach begin="0" end="${requestScope.quiz.getListQuestions().size()-1}"var="i">
                                                                <div class="dc-assignment-info dc-course-item" id='currentQuestion${i}'>
                                                                    <div class="dc-content-title">
                                                                        <h5 class="xsm black">Question <span class='questionnumber'> ${i+1}</span></h5>
                                                                        <div class="course-region-tool">
                                                                            <button onclick="removeQuestion('currentQuestion${i}')" id='removeCurrentQuestion${i}' class="delete" title="delete"><i class="icon md-recycle"></i></button>
                                                                        </div>
                                                                    </div>

                                                                    <div class="assignment-body dc-item-body">
                                                                        <div class="tb-course">
                                                                            <div>
                                                                                <div class="tb-unit-title">
                                                                                    <div>
                                                                                        <label for="">Title</label>
                                                                                    </div>
                                                                                    
                                                                                    <div class="td-form-item">
                                                                                        <div class="form-textarea-wrapper">
                                                                                        <textarea style="height: 40px;" rows="1" required name='questionTitle'  id='questionTitle${i}'>${requestScope.quiz.getListQuestions().get(i).title}</textarea>
                                                                                    </div>
<!--                                                                                        <div class="form-item"  >
                                                                                            <input style="width: 100%;color: black;" type="text" required="" name='questionTitle' 
                                                                                                   value="${requestScope.quiz.getListQuestions().get(i).title}" id='questionTitle${i}' >
                                                                                        </div>-->
                                                                                    </div>
                                                                                </div>

                                                                                <div class="tb-desc">
                                                                                    <div>
                                                                                        <label for="">Instruction</label>
                                                                                    </div>
                                                                                    <div class="td-form-item">
                                                                                        <div class="form-textarea-wrapper" >
                                                                                            <textarea name="instruction" id='ques-instruc${i}'>${requestScope.quiz.getListQuestions().get(i).intruction.trim()}</textarea>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                
                                                                                    <div id='createOption${i}'>
                                                                                        <c:forEach items="${requestScope.quiz.getListQuestions().get(i).getListOptions()}" var="o">
                                                                                        <div class="${requestScope.quiz.getListQuestions().get(i).classQuestion}" id="question${i}_${o.optionid}">
                                                                                            <div>
                                                                                                <div>
                                                                                                    <label for="option">Option <span><p class="optionnumber${i}"> ${o.optionid}</p></span></label>
                                                                                                </div>
                                                                                            </div>
                                                                                            <div class="td-form-item" >
                                                                                                <div class="form-item-wrap" >
                                                                                                    <div class="form-textarea-wrapper form-item">
                                                                                                <textarea style="height: 60px; padding-top: 5px;" required name="option" id="answer" class="option-content${i}">${o.content}</textarea>
                                                                                            </div>
<!--                                                                                                    <div class="form-item" >
                                                                                                        <input name="option" id="answer" class="option-content${i}" type="text"
                                                                                                               value="${o.content}" placeholder="">
                                                                                                    </div>-->
                                                                                                    <div class="form-item form-checkbox checkbox-style">
                                                                                                        <input type="checkbox" id="${o.que_Option}" name="right_option${i}" class="right_option${i}" value="ON"
                                                                                                               <c:if test="${o.right_option==true}">checked</c:if>
                                                                                                                   >
                                                                                                               <label for="${o.que_Option}">
                                                                                                            <i style="width:30px;height: 30px; margin-top: 15px;" class="icon-checkbox icon md-check-1"></i>
                                                                                                        </label>
                                                                                                    </div>
                                                                                                    <div class="course-region-tool">
                                                                                                        <button style="width:30px;height: 30px;font-size: 30px; margin-top: 12px;" class="delete" type="button" onclick="removeOption('question${i}_${o.optionid}')" id='removeinnerQuestion1' title="delete"><i class="icon md-recycle"></i></button>
                                                                                                    </div>
                                                                                                </div>

                                                                                            </div>
                                                                                        </div>
                                                                                    </c:forEach>
                                                                                </div>
                                                                                <div>
                                                                                    <div>

                                                                                    </div>
                                                                                    <div>
                                                                                        <div class="btn-add">
                                                                                            <button type="button" onclick="addOption('createOption${i}')" >
                                                                                                <i class="icon md-plus"></i>
                                                                                                Add Option
                                                                                            </button>
                                                                                        </div> 
                                                                                    </div>

                                                                                </div>
                                                                                <div class="form-item form-checkbox checkbox-style" style="margin-top: 10px;">
                                                                                                <input type="checkbox" id='randomOption${i}' name="randomOption${i}" 
                                                                                                       <c:if test="${requestScope.quiz.getListQuestions().get(i).randomQuestion==true}" >checked</c:if> value="on">
                                                                                                <label for="randomOption${i}">
                                                                                                    <i style="width: 18px; height: 18px; font-size: 16px;" class="icon-checkbox icon md-check-1"></i>Random Option Position?
                                                                                                </label>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                               </c:forEach>
                                                               </c:if>
                                                            </div>
                                                        
                                                        <!-- END / DC QUESTION -->
                                                        <div class="dc-btn">
                                                            <div>
                                                                <div style="margin-top: 10px;">
                                                                    <button style="color: black; border: black; font-size: 18px;"type='button' 
                                                                            onclick="addQuestion()" class="mc-btn-3 btn-style-7">
                                                                        <i class="icon md-plus"></i>Add Question</button>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>
                                                    <!-- END / DC SECTION BODY -->

                                                </div>
                                                <!-- END / DC SECTION INFO -->
                                                <div>
                                                    <input type="text" value="${quizid}" name="quizid" hidden>
                                                    <input id="NumberOfQuestion" name="numberOfQuestion" value="${requestScope.quiz.getListQuestions().size()}" type="number" hidden>
                                                    <input id="HiddenInput" name="ListQuestion" value="" type="hidden">
                                                    <input id="HiddenInputOption" name="ListOption" value="" type="hidden">
                                                </div>
                                                <!-- BUTTON ADD -->
                                                <div class="add-section">
                                                    <input type="submit" style="font-size: 30px;" id="getAll" class="mc-btn-3 btn-style-1" value="Save Quiz">
                                                </div>
                                                <!-- END / BUTTON ADD-->
                                            </div>

                                            <!-- END / SECTIONS -->
                                        </form>
                                    </div>
                                    <!-- END / DESIGN OUTLINE -->



                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- END / CREATE COURSE CONTENT -->

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
        <script src="js/editQuiz.js" type="text/javascript"></script>
        <script src="new.js" type="text/javascript"></script>


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


        </script> 
    </body>

</html>
