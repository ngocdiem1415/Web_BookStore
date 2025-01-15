<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:17 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en" xmlns="http://www.w3.org/1999/html">
<head>
    <meta charset="UTF-8">
    <title>Yeu thich</title>
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">
    <link rel="stylesheet" href="css/Header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/Like.css">
    <script src="js/bootstrap.bundle.min.js"></script>

</head>
<body>

<!--Header-->
<!--Header-->
<jsp:include page="Header.jsp"></jsp:include>
<!-- /HEADER -->

<!--Content-->
<div class="content-profile" class="container-profile">
    <div class="container-profile-content">
        <div class="container-profile container-profile-content-inner">
            <!--content left-->
            <%@ include file="content-left-profile.jsp" %>

            <!--content right-->
            <div class="container-profile-content-inner__right">
                <div style="display: contents">
                    <div class="container-product-content-inner__right-inner">
                        <!-- Phần sản phẩm yêu thích -->
                        <section>
                            <a href="views/ProductDetail.jsp"
                               class="container-product-content-inner__right-inner-link">
                                <div class="container-product-content-inner">
                                    <div class="container-product-content-inner-infor">
                                        <img src="img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_1.webp"
                                             alt=""
                                             class="container-product-content-inner-infor-img">
                                        <div class="container-product-content-inner-infor__text">
                                            <div>
                                                <div class="content-inner__right-inner-infor__text-content">
                                                    <span class="content-inner__right-inner-infor__text-content-name">
                                                        Mèo Mèo Mèo: Bí Mật Giao Tiếp Từ Cái Vây Dưới Đen Tiếng Gru Gru
                                                    </span>
                                                </div>
                                                <div class="container-product-content-inner-infor__price"
                                                     tabindex="0">
                                                    <span class="container-product-content-inner-infor__price-text">
                                                            129.000đ
                                                    </span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-product-content-inner-infor__text">
                                        <div>
                                            <div class="container-product-content-inner-infor__text-content">
                                                <div class="container-product-content-inner-infor__text-content-quanlity"
                                                     tabindex="0">
                                                        <span class="container-product-content-inner-infor__text-content-quanlity-available">
                                                                        Số lượng: 48
                                                        </span>
                                                    <span class="container-product-content-inner-infor__text-content-quanlity-sold">
                                                                        Đã bán: 21
                                                        </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-product-content-inner-infor__vote"
                                         tabindex="0">
                                        <div class="container-product-content-inner-infor__vote-star">
                                            <i class="fa-solid fa-star"></i>
                                            <span class="container-product-content-inner-infor__vote-star-text">5</span>
                                        </div>
                                        <span class="container-product-content-inner-infor__vote-review">21 lượt đánh giá</span>
                                    </div>
                                </div>
                            </a>
                            <a href="#" class="container-product-content-inner__right-inner-link">
                                <div class="container-product-content-inner">
                                    <div class="container-product-content-inner-infor">
                                        <img src="img/product/BiAnVungNuocSauLanRanhThienTaiVaKeDien_1.webp" alt=""
                                             class="container-product-content-inner-infor-img">
                                        <div class="container-product-content-inner-infor__text">
                                            <div>
                                                <div class="content-inner__right-inner-infor__text-content">
                                                    <span class="content-inner__right-inner-infor__text-content-name">
                                                        Bí Ẩn Vùng Nước Sâu: Làn Ranh Thiên Tài Và Kẻ Điên
                                                    </span>
                                                </div>
                                                <div class="container-product-content-inner-infor__price"
                                                     tabindex="0">
                                                    <span class="container-product-content-inner-infor__price-text">
                                                            89.000đ
                                                    </span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-product-content-inner-infor__text">
                                        <div>
                                            <div class="container-product-content-inner-infor__text-content">
                                                <div class="container-product-content-inner-infor__text-content-quanlity"
                                                     tabindex="0">
                                                        <span class="container-product-content-inner-infor__text-content-quanlity-available">
                                                                        Số lượng: 23
                                                        </span>
                                                    <span class="container-product-content-inner-infor__text-content-quanlity-sold">
                                                                        Đã bán: 20
                                                        </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-product-content-inner-infor__vote"
                                         tabindex="0">
                                        <div class="container-product-content-inner-infor__vote-star">
                                            <i class="fa-solid fa-star"></i>
                                            <span class="container-product-content-inner-infor__vote-star-text">4</span>
                                        </div>
                                        <span class="container-product-content-inner-infor__vote-review">19 lượt đánh giá</span>
                                    </div>
                                </div>
                            </a>
                            <a href="#" class="container-product-content-inner__right-inner-link">
                                <div class="container-product-content-inner">
                                    <div class="container-product-content-inner-infor">
                                        <img src="img/Chicanbantothon1%25.webp" alt=""
                                             class="container-product-content-inner-infor-img">
                                        <div class="container-product-content-inner-infor__text">
                                            <div>
                                                <div class="content-inner__right-inner-infor__text-content">
                                                    <span class="content-inner__right-inner-infor__text-content-name">
                                                        Chỉ cần bạn tốt hơn mỗi ngày 1%
                                                    </span>
                                                </div>
                                                <div class="container-product-content-inner-infor__price"
                                                     tabindex="0">
                                                    <span class="container-product-content-inner-infor__price-text">
                                                            100.000đ
                                                    </span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-product-content-inner-infor__text">
                                        <div>
                                            <div class="container-product-content-inner-infor__text-content">
                                                <div class="container-product-content-inner-infor__text-content-quanlity"
                                                     tabindex="0">
                                                        <span class="container-product-content-inner-infor__text-content-quanlity-available">
                                                                        Số lượng: 97
                                                        </span>
                                                    <span class="container-product-content-inner-infor__text-content-quanlity-sold">
                                                                        Đã bán: 60
                                                        </span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-product-content-inner-infor__vote"
                                         tabindex="0">
                                        <div class="container-product-content-inner-infor__vote-star">
                                            <i class="fa-solid fa-star"></i>
                                            <span class="container-product-content-inner-infor__vote-star-text">4.8</span>
                                        </div>
                                        <span class="container-product-content-inner-infor__vote-review">59 lượt đánh giá</span>
                                    </div>
                                </div>
                            </a>
                        </section>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>


<!--footer-->
<!--<div id="footer"></div>-->
<!--    footer start -->
<jsp:include page="footer.jsp"></jsp:include>
<!--    footer end -->
</body>
</html>