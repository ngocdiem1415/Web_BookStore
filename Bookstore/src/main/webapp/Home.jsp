<%--
  Created by IntelliJ IDEA.
  User: ngocd
  Date: 12/16/2024
  Time: 2:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<!--SECTION-->

<!--Header-->
<header id="header"></header>
<!-- /HEADER -->

<!-- NAVIGATION-->
<nav id="navigation"></nav>
<!--/Header-->


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
    <!--     slider-area-end -->


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
            <div class="item cloned" style="width: 205px; margin-right: 20px">
                <div class="tab-total">
                    <!-- single-product-start -->
                    <div class="product-wrapper">
                        <div class="product-img">
                            <img src="img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_1.webp"
                                 alt="book" class="primary" style="width: 220px;height: 240px"/>
                            <div class="overlay"></div>
                            <div class="quick-view">
                                <a class="action-view" href="ProductDetail.html"
                                   title="Quick View">
                                    <i class="fa fa-search-plus"></i>
                                </a>
                            </div>
                            <div class="product-flag">
                                <ul>
                                    <li><span class="sale">new</span> <br></li>
                                    <li><span class="discount-percentage">-23%</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="product-details text-center pt-2">
                            <div class="limited-lines">
                                <h4><a href="ProductDetail.html">Mèo Méo Meo Bí mật ...</a></h4>
                            </div>
                            <div class="product-price">
                                <ul>
                                    <li>
                                        99.330
                                        <i class="fa-solid fa-dong-sign fa-xs pt-2" style="color: #f07c29;"></i>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- single-product-end -->
                </div>
            </div>
            <div class="item" style="width: 205px; margin-right: 20px">
                <div class="tab-total">
                    <!-- single-product-start -->
                    <div class="product-wrapper">
                        <div class="product-img">
                            <img src="img/product/Haivanduoidaybien.png"
                                 alt="book" class="primary" style="width: 220px;height: 240px"/>
                            <div class="overlay"></div>
                            <div class="quick-view">
                                <a class="action-view" href="ProductDetail.html"
                                   title="Quick View">
                                    <i class="fa fa-search-plus"></i>
                                </a>
                            </div>
                            <div class="product-flag">
                                <ul>
                                    <li><span class="sale">new</span> <br></li>
                                    <li><span class="discount-percentage">-5%</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="product-details text-center pt-2">
                            <div class="limited-lines">
                                <h4><a href="ProductDetail.html">Hai vạn dặm dưới biển</a></h4>
                            </div>
                            <div class="product-price">
                                <ul>
                                    <li>
                                        99.000
                                        <i class="fa-solid fa-dong-sign fa-xs pt-2" style="color: #f07c29;"></i>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- single-product-end -->
                </div>
            </div>
            <div class="item" style="width: 205px; margin-right: 20px">
                <div class="tab-total">
                    <!-- single-product-start -->
                    <div class="product-wrapper">
                        <div class="product-img">
                            <img src="img/product/Luyhoa.png"
                                 alt="book" class="primary" style="width: 220px;height: 240px"/>
                            <div class="overlay"></div>
                            <div class="quick-view">
                                <a class="action-view" href="ProductDetail.html"
                                   title="Quick View">
                                    <i class="fa fa-search-plus"></i>
                                </a>
                            </div>
                            <div class="product-flag">
                                <ul>
                                    <li><span class="sale">new</span> <br></li>
                                    <li><span class="discount-percentage">-5%</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="product-details text-center pt-2">
                            <div class="limited-lines">
                                <h4><a href="ProductDetail.html">Lũy hoa</a></h4>
                            </div>
                            <div class="product-price">
                                <ul>
                                    <li>
                                        119.000
                                        <i class="fa-solid fa-dong-sign fa-xs pt-2" style="color: #f07c29;"></i>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- single-product-end -->
                </div>
            </div>
            <div class="item" style="width: 205px; margin-right: 20px">
                <div class="tab-total">
                    <!-- single-product-start -->
                    <div class="product-wrapper">
                        <div class="product-img">
                            <img src="img/product/Laudaithanbi.png"
                                 alt="book" class="primary" style="width: 220px;height: 240px"/>
                            <div class="overlay"></div>
                            <div class="quick-view">
                                <a class="action-view" href="ProductDetail.html"
                                   title="Quick View">
                                    <i class="fa fa-search-plus"></i>
                                </a>
                            </div>
                            <div class="product-flag">
                                <ul>
                                    <li><span class="sale">new</span> <br></li>
                                    <li><span class="discount-percentage">-5%</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="product-details text-center pt-2">
                            <div class="limited-lines">
                                <h4><a href="ProductDetail.html">Lâu đài thần bí</a></h4>
                            </div>
                            <div class="product-price">
                                <ul>
                                    <li>
                                        119.000
                                        <i class="fa-solid fa-dong-sign fa-xs pt-2" style="color: #f07c29;"></i>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- single-product-end -->
                </div>
            </div>
            <div class="item" style="width: 205px; margin-right: 20px">
                <div class="tab-total">
                    <!-- single-product-start -->
                    <div class="product-wrapper">
                        <div class="product-img">
                            <img src="img/product/Lehoitrencanhdong.png"
                                 alt="book" class="primary" style="width: 220px;height: 240px"/>
                            <div class="overlay"></div>
                            <div class="quick-view">
                                <a class="action-view" href="ProductDetail.html"
                                   title="Quick View">
                                    <i class="fa fa-search-plus"></i>
                                </a>
                            </div>
                            <div class="product-flag">
                                <ul>
                                    <li><span class="sale">new</span> <br></li>
                                    <li><span class="discount-percentage">-5%</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="product-details text-center pt-2">
                            <div class="limited-lines">
                                <h4><a href="ProductDetail.html">Lễ hội trên cánh đồng</a></h4>
                            </div>
                            <div class="product-price">
                                <ul>
                                    <li>
                                        52.000
                                        <i class="fa-solid fa-dong-sign fa-xs pt-2" style="color: #f07c29;"></i>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- single-product-end -->
                </div>
            </div>
        </div>
    </div>
    <!-- featured-area-end -->

    <!-- bestseller-area-start -->
    <div class="bestseller-area mb-30">
        <div class="container">
            <div class="row">
                <!-- Cột chính cho ưu đãi -->
                <div class="col-lg-9 col-md-12 col-12">
                    <div class="single-deal pt-100 d-flex flex-wrap justify-content-between">
                        <div class="deal-off-day">
                            <div class="deal-off-day-title mb-30">
                                <h1>CÁC ƯU ĐÃI TRONG NGÀY</h1>
                            </div>
                            <h2><a href="#">Harry Potter</a></h2>
                            <div class="sale-area">
                                <div class="price-box">
                                <span class="old-sale">150.000
                                    <i class="fa-solid fa-dong-sign fa-xs" style="color: #000;"></i> </span>
                                    <span class="new-sale"> 100.000
                                    <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                </div>
                            </div>
                            <p>Harry Potter là tên của bộ truyện (gồm bảy phần) của nữ nhà văn nước Anh J. K.
                                Rowling.
                                Bộ truyện viết về những cuộc phiêu lưu phù thủy của cậu bé Harry Potter và những
                                người
                                bạn </p>
                            <div class="timer">
                                <div data-countdown="2023/5/15">
                                    <div class="cdown days">
                                        <span class="counting counting-2">0</span> Ngày
                                    </div>
                                    <div class="cdown hours">
                                        <span class="counting counting-2">0</span> Giờ
                                    </div>
                                    <div class="cdown minutes">
                                        <span class="counting counting-2">00</span> Phút
                                    </div>
                                    <div class="cdown seconds">
                                        <span class="counting counting-2">00</span> Giây
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Hình ảnh -->
                        <div class="banner-img-3">
                            <a href="ProductDetail.html"><img src="img/product/HarryPotter.png" alt="banner"
                                                              class="img-fluid"/></a>
                        </div>
                    </div>
                </div>
                <!-- Cột bestseller -->
                <div class="col-lg-3 col-md-12 col-12">
                    <div class="bestseller pt-100 mt-30">
                        <div class="bestseller-total d-flex flex-wrap">
                            <div class="item col-6 col-sm-4 col-lg-6 max-width-150">
                                <div class="tab-total">
                                    <div class="bestseller-wrapper mb-30">
                                        <div class="product-img">
                                            <a href="ProductDetail.html"><img src="img/product/Ngaytroivephiacu.png"
                                                                              alt="book"
                                                                              class="img-fluid"/></a>
                                        </div>
                                        <div class="bestseller-details text-center mt-2">
                                            <h4><a href="#">Ngày trôi về phía cũ</a></h4>
                                            <div class="sale-area">
                                                <div class="price-box">
                                                <span class="new-sale cl-o">197.000
                                                    <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
                                                </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item col-6 col-sm-4 col-lg-6 max-width-150">
                                <div class="tab-total">
                                    <div class="bestseller-wrapper mb-30">
                                        <div class="product-img">
                                            <a href="ProductDetail.html"><img src="img/product/Nguoitrongrung.png"
                                                                              alt="book"
                                                                              class="img-fluid"/></a>
                                        </div>
                                        <div class="bestseller-details text-center mt-2">
                                            <h4><a href="#">Người trồng rừng</a></h4>
                                            <div class="sale-area">
                                                <div class="price-box">
                                                <span class="new-sale cl-o">127.000
                                                    <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
                                                </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item col-6 col-sm-4 col-lg-6 mb-30 max-width-150">
                                <div class="tab-total">
                                    <div class="bestseller-wrapper mb-30">
                                        <div class="product-img">
                                            <a href="ProductDetail.html"><img src="img/product/Heidi.png"
                                                                              alt="book"
                                                                              class="img-fluid"/></a>
                                        </div>
                                        <div class="bestseller-details text-center mt-2">
                                            <h4><a href="#">Heidi</a></h4>
                                            <div class="sale-area">
                                                <div class="price-box">
                                                <span class="new-sale cl-o">127.000
                                                    <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
                                                </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="item col-6 col-sm-4 col-lg-6 mb-30 max-width-150">
                                <div class="tab-total">
                                    <div class="bestseller-wrapper mb-30">
                                        <div class="product-img">
                                            <a href="ProductDetail.html"><img src="img/product/Nguoitv.png"
                                                                              alt="book"
                                                                              class="img-fluid"/></a>
                                        </div>
                                        <div class="bestseller-details text-center mt-2">
                                            <h4><a href="#">Người TV</a></h4>
                                            <div class="sale-area">
                                                <div class="price-box">
                                                <span class="new-sale cl-o">77.000
                                                    <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
                                                </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
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
                            <h2 class="title-head bl-10"><a href="#" class="text-dec">Sách văn học</a></h2>
                        </div>
                        <div class="d-md-block d-none col-12 col-md-2">
                            <a class="see-more text-dec" href="category.html" title="Xem thêm">Xem thêm</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="d-flex flex-wrap">
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="novels mb-30">
            <div class="container">
                <div class="row row-noGutter-2">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 title_top_menu_index row mb-30">
                        <div class="heading1 col-10 ">
                            <h2 class="title-head bl-10"><a href="#" class="text-dec">Tiểu thuyết</a></h2>
                        </div>
                        <div class="d-md-block d-none col-12 col-md-2">
                            <a class="see-more text-dec" href="category.html" title="Xem thêm">Xem thêm</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="d-flex flex-wrap">
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="stories mb-30">
            <div class="container">
                <div class="row row-noGutter-2">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 title_top_menu_index row mb-30">
                        <div class="heading1 col-10 ">
                            <h2 class="title-head bl-10"><a href="#" class="text-dec">Truyện</a></h2>
                        </div>
                        <div class="d-md-block d-none col-12 col-md-2">
                            <a class="see-more text-dec" href="category.html" title="Xem thêm">Xem thêm</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="d-flex flex-wrap">
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <div class="other-books mb-30">
            <div class="container">
                <div class="row row-noGutter-2">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 title_top_menu_index row mb-30">
                        <div class="heading1 col-10 ">
                            <h2 class="title-head bl-10"><a href="#" class="text-dec">Sách khác</a></h2>
                        </div>
                        <div class="d-md-block d-none col-12 col-md-2">
                            <a class="see-more text-dec" href="category.html" title="Xem thêm">Xem thêm</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="d-flex flex-wrap">
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>
                        <div class="most-product mb-30" style="width: 205px">
                            <div class="tab-total">
                                <!-- single-product-start -->
                                <div class="product-wrapper ">
                                    <div class="product-img">
                                        <a href="#">
                                            <img src="img/product/1.jpg" alt="book" class="primary"/>
                                        </a>
                                        <div class="overlay"></div>
                                        <div class="quick-view">
                                            <a class="action-view" href="ProductDetail.html"
                                               title="Quick View">
                                                <i class="fa fa-search-plus"></i>
                                            </a>
                                            <a class="action-view" href="Cart.html"
                                               title="Add Product">
                                                <i class="fa-solid fa-cart-shopping fa-xs"></i> </a>
                                        </div>
                                    </div>
                                    <div class="price-most-product text-center">
                                        <h5><a href="#" class="text-dec">Joust Duffle Bag</a></h5>
                                        <div class="price-box clearfix d-flex justify-content-center">
                                            <div class="special-price">
                                            <span class="price product-price cl-o">
                                                71 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i></span>
                                            </div>
                                            <div class="old-price">
						                <span class="price product-price-old">
							                95 000
                                            <i class="fa-solid fa-dong-sign fa-xs" style="color: #f07c29;"></i>
						                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- single-product-end -->
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--     most-product-area-end -->
</div>

<!--/SECTION-->
<!--    footer start -->
<section class="footer">
    <div class="footer-row">
        <div class="footer-col">
            <a href="" class="mb-4"><img src="img/logo/new_logo.png"/></a>
            <p class="detail mb-4">Nơi cung cấp trí thức cho bạn.</p>
            <div class="detail-icons ">
                <p><i class="fa-solid fa-location-dot"></i>VQCR+GP6, khu pho 6, Thu Đuc, Ho Chi Minh</p>
                <p><i class="fa-solid fa-phone"></i>0123456789</p>
                <p><i class="fa-solid fa-envelope"></i>@st.hcmuaf.edu.vn</p>
            </div>
        </div>
        <div class="footer-col">
            <h4>Về chúng tôi</h4>
            <ul class="links">
                <li><a href="#">Nguyễn Thị Ngọc Diễm</a></li>
                <li><a href="#">Võ Nguyễn Thanh Diệu</a></li>
                <li><a href="#">Nguyễn Hữu Thịnh</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h4>Chính sách</h4>
            <ul class="links">
                <li><a href="#">Trang chủ</a></li>
                <li><a href="#">Chính sách bảo mật</a></li>
                <li><a href="#">Sản phẩm</a></li>
                <li><a href="#">Tin tức</a></li>
                <li><a href="#">Liên hệ</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h4>Gửi Email</h4>
            <p>
                Đăng ký nhận thông tin mới nhất từ chúng tôi.
            </p>
            <form action="#">
                <input type="text" placeholder="Email" required>
                <button type="submit"><i class="fa-solid fa-paper-plane"></i></button>
            </form>
            <div class="icons">
                <i class="fa-brands fa-facebook-f"></i>
                <i class="fa-brands fa-twitter"></i>
                <i class="fa-brands fa-linkedin"></i>
                <i class="fa-brands fa-github"></i>
            </div>
        </div>
    </div>


    <div class="footer-copyright d-flex justify-content-center">
        <p>&copy; 2024 BookStore | Designed by <span>Team TDD</span></p>
    </div>
</section>
<!--footer end-->

<!--jquery-->
<script src="js/jquery.min.js"></script>

<!--     OwlCarousel-->
<!--<script src="../js/OwlCarousel.js"></script>-->
<script src="js/owl.carousel.min.js"></script>
<!--    bootstrap-->
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>

<script>
    fetch('Header.html')
        .then(response => {
            if (!response.ok) throw new Error('Network response was not ok');
            return response.text();
        })
        .then(data => document.getElementById('header').innerHTML = data)
        .catch(error => console.error('Error:', error));

    // Tải nội dung của footer từ tệp Footer.html
    fetch('footer.html')
        .then(response => response.text())
        .then(data => {
            document.getElementById('footer').innerHTML = data;
        });
</script>
<script>
    $('.owl-carousel').owlCarousel({
        loop: true,
        margin: 100,
        nav: false,
        responsive: {
            0: {
                items: 1
            },
            600: {
                items: 3
            },
            1000: {
                items: 5
            }
        }
    })
</script>

</body>
</html>
