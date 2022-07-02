
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<header id="header" class="header">
        <div class="container">

            <!-- LOGO -->
            <div class="logo"><a href="HomeController"><img src="images/logo3.png" alt=""></a></div>
            <!-- END / LOGO -->

            <!-- NAVIGATION -->
            <nav class="navigation">

                <div class="open-menu">
                    <span class="item item-1"></span>
                    <span class="item item-2"></span>
                    <span class="item item-3"></span>
                </div>

                <!-- MENU -->
                <ul class="menu">
                    <li class="current-menu-item"><a href="HomeController">Home</a></li>
                    <li class="menu-item-has-children megamenu col-4">
                        <a href="CategoryController">Category</a>
                        <ul class="sub-menu">
                            <c:forEach items = "${sessionScope.listC}" var = "o">
                                <li><a href="CategoryController?categoryId=${o.categoryId}">${o.categoryName}</a></li>
                            </c:forEach>
                        </ul>
                    <c:if test="${sessionScope.user==null}">
                    <li>
                        <a href="Login.jsp">Sign In</a>
                    </li>
                    <li>
                        <a href="register.jsp">Sign Up</a>
                    </li>
                    </c:if>
                    <c:if test="${sessionScope.user.roleId==0}">
                    <li class="menu-item-has-children">
                        <a href="CreateQuizController">Create Quiz</a>
                    </li>
                    </c:if>
                </ul>
                <!-- END / MENU -->

                <!-- SEARCH BOX -->
                
                <!-- END / SEARCH BOX -->

                <!-- LIST ACCOUNT INFO -->
                <c:if test="${sessionScope.user.roleId==0}">
                <ul class="list-account-info">

                    <li class="list-item account">
                        <c:if test="${sessionScope.user.avatar == null}">
                        <div class="account-info item-click">
                            <img src="imageUpload/default-avatar.png" alt="">
                        </div>
                        </c:if>
                        <c:if test="${sessionScope.user.avatar!=null}">
                        <div class="account-info item-click">
                            <img src="imageUpload/${sessionScope.user.avatar}" alt="">
                        </div>
                        </c:if>
                        <div class="toggle-account toggle-list">
                            <ul class="list-account">
                                <li><a href="ViewOwnQuizController"><i class="icon md-book-1"></i>Library</a></li>
                                <li><a href="ManageProfileController"><i class="icon md-config"></i>Profile</a></li>
                                <li><a href="LogoutController"><i class="icon md-arrow-right"></i>Sign Out</a></li>
                                
                            </ul>
                        </div>
                    </li>
                    </c:if>

                </ul>
                <!-- END / LIST ACCOUNT INFO -->

            </nav>
            <!-- END / NAVIGATION -->
        </div>
    
    </header>