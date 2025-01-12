<%@ page import="vn.edu.hcmuaf.fit.bookstore.beans.User" %><%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:16 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<!-- HEADER -->
<body>
<!--Header-->
<header id="header">
    <!-- MAIN HEADER -->
    <!--    <div class="banner d-flex justify-content-center pt-1 pb-1 ">-->
    <!--        <a href="#" class="content">Freeship đơn từ 45k, giảm nhiều hơn cùng FREESHIP XTRA</a>-->
    <!--    </div>-->
    <div class="container">
        <!-- row -->
        <div class="row">
            <!-- LOGO -->
            <div class="col-md-2 d-flex justify-content-center align-items-end">
                <a href="home">
                    <div class="header-logo">
                        <img src="img/logo/logo-header.png" height="80" width="100"/></div>
                </a>
            </div>
            <!-- /LOGO -->

            <!-- SEARCH BAR -->
            <div class="col-md-7">
                <div class="header-search">
                    <form class="d-flex mt-2" id="searchForm" action="listBook" method="GET">
                        <input class="input flex-grow-1"  type="text" name="find" id="searchInput" placeholder="Tìm sách">
                        <button class="search-btn">Search</button>
                    </form>
                </div>
            </div>
            <!-- /SEARCH BAR -->

            <!-- ACCOUNT -->
            <div class="col-md-3 clearfix d-flex">
                <ul class="account-menu mr-1">
                    <c:if test="${not empty userSession}">
                        <li class="account box mt-4">
                            <a href="">${userSession.username}</a>
                            <i class="fa-solid fa-angle-down"></i>
                            <ul class="subnav">
                                <li class="border-bottom border-gray"><a href="profile">Hồ sơ</a></li>
                                <li class="border-bottom border-gray"><a href="logout">Đăng xuất</a></li>
                            </ul>
                        </li>
                    </c:if>
                    <c:if test="${empty userSession}">
                        <li class="account box mt-4">
                            <a href="#">Tài khoản</a>
                            <i class="fa-solid fa-angle-down"></i>
                            <ul class="subnav">
                                <li class="border-bottom border-gray"><a href="login">Đăng nhập</a></li>
                                <li><a href="signup">Đăng kí</a></li>
                            </ul>
                        </li>
                    </c:if>

                </ul>
                <div class="shopping-cart mt-4 ">
                    <c:if test="${not empty userSession}">
                        <a href="Cart.jsp" style="color: black">
                            <!--                    <i class="fa-solid fa-cart-shopping" style="color: #0e2b1e;"></i>-->
                            <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor"
                                 class="bi bi-bag-check" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                      d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0"/>
                                <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1m3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"/>
                            </svg>
                        </a>
                    </c:if>

                    <c:if test="${empty userSession}">
                        <!-- Nếu người dùng chưa đăng nhập, giỏ hàng sẽ không thể nhấp -->
                        <a href="login" style="color: gray; pointer-events: none;">
                            <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor"
                                 class="bi bi-bag-check" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                      d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0"/>
                                <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1m3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"/>
                            </svg>
                        </a>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</header>
<!-- /HEADER -->

<!-- NAVIGATION-->
<nav id="navigation">
    <!-- container -->
    <div class="container ">
        <!-- NAV -->
        <ul class="main-nav nav ">
            <li class="nav-item "><a href="/home">Trang chủ</a></li>
            <li class="nav-item "><a href="AboutUs.jsp">Giới thiệu</a></li>
            <li class="nav-item dropdown ">
                <a class="nav-link dropdown-toggle pt-0 pl-15 pr-10" href="category.jsp" id="productDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Sản phẩm
                </a>
                <ul class="dropdown-menu" aria-labelledby="productDropdown">
                    <c:forEach var="c" items="${categoryList}">
                    <li><a class="dropdown-item" href="/listBook?categoryId=${c.categoryId}">c.category_name</a></li>
                    </c:forEach>
                </ul>
            </li>
            <li class="nav-item "><a href="policy.jsp">Chính sách</a></li>
            <li class="nav-item "><a href="contact.jsp">Liên hệ</a></li>
        </ul>
        <!-- /NAV -->
    </div>
</nav>
<!--/nav end-->

</body>
<!--/nav end-->

