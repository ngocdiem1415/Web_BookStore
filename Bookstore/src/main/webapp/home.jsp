<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 14/01/2025
  Time: 12:29 CH
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">

    <!--    bootstrap-->
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">
    <!--     OwlCarousel-->
    <link rel="stylesheet" href="css/OwlCarousel/owl.carousel.min.css">
    <link rel="stylesheet" href="css/OwlCarousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/OwlCarousel/owl.theme.green.min.css">

    <!--    css-->
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/Home.css">
    <link rel="stylesheet" href="css/Header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">
    <title>Home</title>

</head>
<body>
<!--Header-->
<jsp:include page="Header.jsp"></jsp:include>
<!-- /HEADER -->

<div class="section">
    <!-- slider-area-start -->
    <div id="carouselExampleIndicators" class="carousel slide">
        <div class="container mt-30  d-flex justify-content-center" style="width: 990px; height:496px">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="img/slider/Banner-Sách-hay-tặng-thầy-cô-ngày-20.11-890x396.jpg" class="d-block w-100"
                         alt="...">
                </div>
                <div class="carousel-item ">
                    <img src="img/slider/Banner-TBPH-2-Sách-Anh-Khang-v2-890x396.jpg" class="d-block w-100"
                         alt="...">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                    data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>

    <!-- featured-area-start -->
    <div class="container pt-50">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title section-title-res text-center mb-30">
                    <h2>ĐẶC BIỆT</h2>
                </div>
            </div>
        </div>
        <div class="owl-carousel owl-theme">
            <c:forEach var="book" items="${newBooks}">
                <div class="item" style="width: 205px; margin-right: 20px">
                    <div class="tab-total">
                        <!-- single-product-start -->
                        <div class="product-wrapper">
                            <div class="product-img">
                                <img src="${book.image.sourceImg}"
                                     alt="${book.title}" class="primary" style="width: 220px;height: 240px"/>
                                <div class="overlay"></div>
                                <div class="quick-view"
                                     style="display: flex;justify-content: space-around">
                                    <a class="action-view" href="book-detail?id=${book.bId}" title="Quick View">
                                        <i class="fa fa-search-plus"
                                           style="position: absolute"></i>
                                    </a>
                                </div>
                                <div class="product-flag">
                                    <ul>
                                        <li><span class="sale">new</span> <br></li>
                                        <c:if test="${book.promotionId != 0}">
                                            <li>
                                                <span class="discount-percentage">${book.promotion.promotionName}</span>
                                            </li>
                                        </c:if>
                                    </ul>
                                </div>
                            </div>
                            <div class="product-details text-center pt-2">
                                <div class="limited-lines"
                                     style="text-decoration-line: none; text-decoration-color: black">
                                    <h4><a href="book-detail?id=${book.bId}">${book.title}</a></h4>
                                </div>
                                <div class="product-price">
                                    <ul>
                                        <li>
                                            <c:if test="${book.promotionId != 0}">
                                                <span class="old-sale"><f:formatNumber value="${book.originalPrice}"/>
                                                    <i class="fa-solid fa-dong-sign fa-xs"
                                                       style="color: #000;"></i> </span>
                                                <span class="new-sale"> <f:formatNumber value="${book.salePrice}"/>
                                                    <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </c:if>
                                            <c:if test="${book.promotionId == 0}">
                                            <span class="new-sale"> <f:formatNumber value="${book.originalPrice}"/>
                                                    <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </c:if>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- single-product-end -->
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- featured-area-end -->

    <!-- bestseller-area-start -->
    <div class="bestseller-area mb-30">
        <div class="container">
            <div class="row">
                <!-- Cột chính cho ưu đãi -->

                <c:set var="firstBook" value="${bookByPromotion[0]}"/>

                <div class="col-lg-9 col-md-12 col-12">
                    <div class="single-deal pt-100 d-flex flex-wrap justify-content-between">
                        <div class="deal-off-day">
                            <div class="deal-off-day-title mb-30">
                                <h1>CÁC ƯU ĐÃI HẤP DẪN NHẤT</h1>
                            </div>
                            <h4><a href="book-detail?id=${firstBook.bId}">${firstBook.title}</a></h4>
                            <div class="sale-area">
                                <div class="price-box">
                                <span class="old-sale"><f:formatNumber value="${firstBook.originalPrice}"/>
                                    <i class="fa-solid fa-dong-sign fa-xs" style="color: #999;"></i> </span>
                                    <span class="new-sale"> <f:formatNumber value="${firstBook.salePrice}"/>
                                    <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                </div>
                            </div>
                            <p style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis; line-height: 24px">${firstBook.description}</p>
                            <div class="timer" id="countdown">
                                <div class="cdown days">
                                    <span class="counting" id="days">0</span> Ngày
                                </div>
                                <div class="cdown hours">
                                    <span class="counting" id="hours">0</span> Giờ
                                </div>
                                <div class="cdown minutes">
                                    <span class="counting" id="minutes">00</span> Phút
                                </div>
                                <div class="cdown seconds">
                                    <span class="counting" id="seconds">00</span> Giây
                                </div>
                            </div>
                        </div>
                        <!-- Hình ảnh -->
                        <div class="banner-img-3" style="width:410px; border: none">
                            <a href="book-detail?id=${firstBook.bId}"><img
                                    src="${firstBook.image.sourceImg}" alt="banner" class="img-fluid"/></a>
                        </div>
                    </div>
                </div>
                <!-- Cột bestseller -->
                <div class="col-lg-3 col-md-12 col-12">
                    <div class="bestseller pt-100 mt-30">
                        <div class="bestseller-total d-flex flex-wrap">
                            <c:forEach var="book" items="${bookByPromotion}" begin="1" end="4">
                                <div class="item col-6 col-sm-4 col-lg-6 max-width-150">
                                    <div class="tab-total">
                                        <div class="bestseller-wrapper mb-30">
                                            <div class="product-img">
                                                <a href="book-detail?id=${book.bId}"><img src="${book.image.sourceImg}"
                                                                                          alt="book"
                                                                                          class="img-fluid"
                                                                                          style="height:143px; width: 143px"/></a>
                                            </div>
                                            <div class="bestseller-details text-center mt-2">
                                                <h5>
                                                    <a href="book-detail?id=${book.bId}">${book.title}</a>
                                                </h5>
                                                <div class="sale-area">
                                                    <div class="price-box">
                                                         <span class="old-sale"><f:formatNumber
                                                                 value="${book.originalPrice}"/>
                                                        <i class="fa-solid fa-dong-sign fa-xs" style="color: #999;"></i> </span>
                                                        <span class="new-sale" style="font-size: 1rem"> <f:formatNumber
                                                                value="${book.salePrice}"/>
                                                        <i class="fa-solid fa-dong-sign fa-xs"
                                                           style="color: #f07c29;"></i></span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- bestseller-area-end -->

    <!-- most-product-area-start -->
    <div class="most-product ">
        <div class="literary-books mb-30">
            <div class="container">
                <div class="row row-noGutter-2">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 title_top_menu_index row mb-30">
                        <div class="heading1 col-10 ">
                            <h2 class="title-head bl-10"><a href="listBook" class="text-dec">Sách văn học</a></h2>
                        </div>
                        <div class="d-md-block d-none col-12 col-md-2">
                            <a class="see-more text-dec" href="listBook" title="Xem thêm">Xem thêm</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="d-flex flex-wrap">
                        <c:forEach var="literatureBooks" items="${literatureBooks}">
                            <div class="most-product mb-30" style="width: 205px">
                                <div class="tab-total">
                                    <!-- single-product-start -->
                                    <div class="product-wrapper ">
                                        <div class="product-img">
                                            <a href="book-detail?id=${literatureBooks.bId}">
                                                <img src="${literatureBooks.image.sourceImg}"
                                                     alt="${literatureBooks.title}" class="primary"
                                                     style="height:220px; width: 240px"/>
                                            </a>
                                            <div class="overlay"></div>
                                            <div class="quick-view" style="display: flex;gap: 10px;">
                                                <a class="action-view" href="book-detail?id=${literatureBooks.bId}"
                                                   title="Quick View">
                                                    <i class="fa fa-search-plus" style="top: 10px;left: 12px;"></i>
                                                </a>
                                                <c:if test="${not empty userSession}">
                                                    <a class="action-view" title="Add Product"
                                                       onclick="addToCart(${literatureBooks.bId})">
                                                        <i class="fa-solid fa-cart-shopping fa-xs"
                                                           style="top: 20px;left: 8px;"></i> </a>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="price-most-product text-center">
                                            <p><a href="book-detail?id=${literatureBooks.bId}"
                                                  class="text-dec">${literatureBooks.title}</a>
                                            </p>
                                            <div class="price-box clearfix d-flex justify-content-center">
                                                <c:if test="${literatureBooks.promotionId != 0}">
                                                    <div class="special-price">
                                                        <span class="price product-price cl-o"><f:formatNumber
                                                                value="${literatureBooks.salePrice}"/>
                                                        <i class="fa-solid fa-dong-sign fa-xs"
                                                           style="color: #f07c29;"></i></span>
                                                    </div>
                                                    <div class="old-price">
                                                        <span class="price product-price-old"
                                                              style="font-size: 1rem"><f:formatNumber
                                                                value="${literatureBooks.originalPrice}"/>
                                                         <i class="fa-solid fa-dong-sign fa-xs"
                                                            style="color: #999;"></i></span>
                                                    </div>
                                                </c:if>
                                                <c:if test="${literatureBooks.promotionId == 0}">
                                                    <div class="special-price">
                                                        <span class="price product-price cl-o"><f:formatNumber
                                                                value="${literatureBooks.originalPrice}"/>
                                                        <i class="fa-solid fa-dong-sign fa-xs"
                                                           style="color: #f07c29;"></i></span>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- single-product-end -->
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <div class="novels mb-30">
            <div class="container">
                <div class="row row-noGutter-2">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 title_top_menu_index row mb-30">
                        <div class="heading1 col-10 ">
                            <h2 class="title-head bl-10"><a href="listBook" class="text-dec">Tiểu thuyết</a></h2>
                        </div>
                        <div class="d-md-block d-none col-12 col-md-2">
                            <a class="see-more text-dec" href="listBook" title="Xem thêm">Xem thêm</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="d-flex flex-wrap">
                        <c:forEach var="novelsBooks" items="${novelsBooks}">
                            <div class="most-product mb-30" style="width: 205px">
                                <div class="tab-total">
                                    <!-- single-product-start -->
                                    <div class="product-wrapper ">
                                        <div class="product-img">
                                            <a href="book-detail?id=${novelsBooks.bId}">
                                                <img src="${novelsBooks.image.sourceImg}" alt="${novelsBooks.title}"
                                                     class="primary"
                                                     style="height:220px; width: 240px"/>
                                            </a>
                                            <div class="overlay"></div>
                                            <div class="quick-view" style="display: flex; gap: 10px;">
                                                <a class="action-view" href="book-detail?id=${novelsBooks.bId}"
                                                   title="Quick View">
                                                    <i class="fa fa-search-plus" style="top: 10px;left: 12px;"></i>
                                                </a>
                                                <c:if test="${not empty userSession}">
                                                    <a class="action-view" title="Add Product"
                                                       onclick="addToCart(${novelsBooks.bId})">
                                                        <i class="fa-solid fa-cart-shopping fa-xs"
                                                           style="top: 20px;left: 8px;"></i> </a>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="price-most-product text-center">
                                            <h5><a href="book-detail?id=${novelsBooks.bId}"
                                                   class="text-dec">${novelsBooks.title}</a>
                                            </h5>
                                            <div class="price-box clearfix d-flex justify-content-center">
                                                <c:if test="${novelsBooks.promotionId != 0}">
                                                    <div class="special-price">
                                                        <span class="price product-price cl-o"><f:formatNumber
                                                                value="${novelsBooks.salePrice}"/>
                                                        <i class="fa-solid fa-dong-sign fa-xs"
                                                           style="color: #f07c29;"></i></span>
                                                    </div>
                                                    <div class="old-price">
                                                        <span class="price product-price-old"
                                                              style="font-size: 1rem"><f:formatNumber
                                                                value="${novelsBooks.originalPrice}"/>
                                                         <i class="fa-solid fa-dong-sign fa-xs"
                                                            style="color: #999;"></i></span>
                                                    </div>
                                                </c:if>
                                                <c:if test="${novelsBooks.promotionId == 0}">
                                                    <div class="special-price">
                                                        <span class="price product-price cl-o"><f:formatNumber
                                                                value="${novelsBooks.salePrice}"/>
                                                        <i class="fa-solid fa-dong-sign fa-xs"
                                                           style="color: #f07c29;"></i></span>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- single-product-end -->
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <div class="stories mb-30">
            <div class="container">
                <div class="row row-noGutter-2">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 title_top_menu_index row mb-30">
                        <div class="heading1 col-10 ">
                            <h2 class="title-head bl-10"><a href="listBook" class="text-dec">Truyện</a></h2>
                        </div>
                        <div class="d-md-block d-none col-12 col-md-2">
                            <a href="listBook" class="see-more text-dec" title="Xem thêm">Xem thêm</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="d-flex flex-wrap">
                        <c:forEach var="comicBooks" items="${comicBooks}">
                            <div class="most-product mb-30" style="width: 205px">
                                <div class="tab-total">
                                    <!-- single-product-start -->
                                    <div class="product-wrapper ">
                                        <div class="product-img">
                                            <a href="book-detail?id=${comicBooks.bId}">
                                                <img src="${comicBooks.image.sourceImg}" alt="${comicBooks.title}"
                                                     class="primary"
                                                     style="height:220px; width: 240px"/>
                                            </a>
                                            <div class="overlay"></div>
                                            <div class="quick-view" style="display: flex; gap: 10px;">
                                                <a class="action-view" href="${comicBooks.image.sourceImg}"
                                                   title="Quick View">
                                                    <i class="fa fa-search-plus" style="top: 10px;left: 12px;"></i>
                                                </a>
                                                <c:if test="${not empty userSession}">
                                                    <a class="action-view" title="Add Product"
                                                       onclick="addToCart(${comicBooks.bId})">
                                                        <i class="fa-solid fa-cart-shopping fa-xs"
                                                           style="top: 20px;left: 8px;"></i> </a>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="price-most-product text-center">
                                            <h5><a href="book-detail?id=${comicBooks.bId}"
                                                   class="text-dec">${comicBooks.title}</a>
                                            </h5>
                                            <div class="price-box clearfix d-flex justify-content-center">
                                                <c:if test="${comicBooks.promotionId != 0}">
                                                    <div class="special-price">
                                                        <span class="price product-price cl-o"><f:formatNumber
                                                                value="${comicBooks.salePrice}"/>
                                                        <i class="fa-solid fa-dong-sign fa-xs"
                                                           style="color: #f07c29;"></i></span>
                                                    </div>
                                                    <div class="old-price">
                                                        <span class="price product-price-old"><f:formatNumber
                                                                value="${comicBooks.originalPrice}"/>
                                                         <i class="fa-solid fa-dong-sign fa-xs"
                                                            style="color: #999;"></i></span>
                                                    </div>
                                                </c:if>
                                                <c:if test="${comicBooks.promotionId == 0}">
                                                    <div class="special-price">
                                                        <span class="price product-price cl-o"><f:formatNumber
                                                                value="${comicBooks.salePrice}"/>
                                                        <i class="fa-solid fa-dong-sign fa-xs"
                                                           style="color: #f07c29;"></i></span>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- single-product-end -->
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>

        <%--        <div class="other-books mb-30">--%>
        <%--            <div class="container">--%>
        <%--                <div class="row row-noGutter-2">--%>
        <%--                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 title_top_menu_index row mb-30">--%>
        <%--                        <div class="heading1 col-10 ">--%>
        <%--                            <h2 class="title-head bl-10"><a href="listBook" class="text-dec">Sách khác</a></h2>--%>
        <%--                        </div>--%>
        <%--                        <div class="d-md-block d-none col-12 col-md-2">--%>
        <%--                            <a class="see-more text-dec" href="listBook" title="Xem thêm">Xem thêm</a>--%>
        <%--                        </div>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
        <%--                    <div class="d-flex flex-wrap">--%>
        <%--                        <c:forEach var="book" items="${otherBooks}">--%>
        <%--                            <div class="most-product mb-30" style="width: 205px">--%>
        <%--                                <div class="tab-total">--%>
        <%--                                    <!-- single-product-start -->--%>
        <%--                                    <div class="product-wrapper ">--%>
        <%--                                        <div class="product-img">--%>
        <%--                                            <a href="book-detail?id=${book.bId}">--%>
        <%--                                                <img src="${book.image.sourceImg}" alt="${book.title}" class="primary"--%>
        <%--                                                     style="height:220px; width: 240px"/>--%>
        <%--                                            </a>--%>
        <%--                                            <div class="overlay"></div>--%>
        <%--                                            <div class="quick-view" style="display: flex; gap: 10px;">--%>
        <%--                                                <a class="action-view" href="book-detail?id=${book.bId}"--%>
        <%--                                                   title="Quick View">--%>
        <%--                                                    <i class="fa fa-search-plus" style="top: 10px;left: 12px;"></i>--%>
        <%--                                                </a>--%>
        <%--                                                <a class="action-view" href="Cart.jsp"--%>
        <%--                                                   title="Add Product">--%>
        <%--                                                    <i class="fa-solid fa-cart-shopping fa-xs"--%>
        <%--                                                       style="top: 20px;left: 8px;"></i> </a>--%>
        <%--                                            </div>--%>
        <%--                                        </div>--%>
        <%--                                        <div class="price-most-product text-center">--%>
        <%--                                            <h5><a href="book-detail?id=${book.bId}" class="text-dec">${book.title}</a>--%>
        <%--                                            </h5>--%>
        <%--                                            <div class="price-box clearfix d-flex justify-content-center">--%>
        <%--                                                <div class="special-price">--%>
        <%--                                            <span class="price product-price cl-o">--%>
        <%--                                                <f:formatNumber value="${book.originalPrice}"/>--%>
        <%--                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>--%>
        <%--                                                </div>--%>
        <%--                                                <div class="old-price">--%>
        <%--						                <span class="price product-price-old">--%>
        <%--                                                <f:formatNumber value="${book.originalPrice}"/>--%>
        <%--                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>--%>
        <%--						                </span>--%>
        <%--                                                </div>--%>
        <%--                                            </div>--%>
        <%--                                        </div>--%>
        <%--                                    </div>--%>
        <%--                                    <!-- single-product-end -->--%>
        <%--                                </div>--%>
        <%--                            </div>--%>
        <%--                        </c:forEach>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </div>--%>
        <%--        </div>--%>
        <%--    </div>--%>
        <!--     most-product-area-end -->

        <div id="cart-notification-success" style="display: none; z-index: 1050; opacity: 0.9;"
             class="alert alert-success text-center position-fixed start-50 top-50 translate-middle">
            Sản phẩm đã được thêm vào giỏ hàng!
        </div>
        <div id="cart-notification-error" style="display: none; z-index: 1050; opacity: 0.9;"
             class="alert alert-success text-center position-fixed start-50 top-50 translate-middle">
            Không thể thêm sản phẩm vào giỏ hàng!
        </div>

    </div>
</div>
<!--/SECTION-->
<jsp:include page="footer.jsp"></jsp:include>

<script src="js/jquery.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>

<script>
    $('.owl-carousel').owlCarousel({
        loop: true,
        margin: 20,
        nav: false,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 3
            },
            1000: {
                items: 4
            }
        }
    })
</script>

<script>
    // Hàm đếm ngược đến cuối ngày
    function countdownToEndOfDay() {
        const now = new Date();
        const endOfDay = new Date(now.getFullYear(), now.getMonth(), now.getDate() + 1, 0, 0, 0); // Cuối ngày

        const diff = endOfDay - now;

        if (diff > 0) {
            const days = Math.floor(diff / (1000 * 60 * 60 * 24));
            const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((diff % (1000 * 60)) / 1000);

            // Cập nhật các phần tử HTML
            document.getElementById("days").textContent = days;
            document.getElementById("hours").textContent = hours;
            document.getElementById("minutes").textContent = minutes < 10 ? `0${minutes}` : minutes;
            document.getElementById("seconds").textContent = seconds < 10 ? `0${seconds}` : seconds;
        } else {
            // Nếu hết thời gian, hiển thị thông báo
            document.getElementById("countdown").textContent = "Hết thời gian!";
        }
    }

    // Gọi hàm mỗi giây
    setInterval(countdownToEndOfDay, 1000);

</script>

<!--Script thêm vào giỏ hàng-->
<script>
    function addToCart(Bid) {
        let id = Bid;
        let quantity = 1;
        const cartNotifications = document.getElementById('cart-notification-success');
        const cartNotificatione = document.getElementById('cart-notification-error');
        $.ajax({
            url: 'add-cart?id=' + id + '&quantity=' + quantity,
            type: 'GET',
            success: function (data) {
                cartNotifications.style.display = 'block';
                // Ẩn thông báo sau 2 giây
                setTimeout(() => {
                    cartNotifications.style.display = 'none';
                }, 2000);
            },
            error: function (data) {
                cartNotifications.style.display = 'block';

                // Ẩn thông báo sau 2 giây
                setTimeout(() => {
                    cartNotifications.style.display = 'none';
                }, 2000);
            }
        });
    }
</script>
</body>
</html>
