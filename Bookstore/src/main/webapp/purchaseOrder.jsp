<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:18 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Đơn hàng</title>

    <-- Font Awesome-->
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">

    <-- CSS-->
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/Header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/purchaseOrder.css">

    <-- Bootstrap-->
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">
    <script src="js/bootstrap.bundle.min.js"></script>

</head>
<body>
<!--Header-->
<jsp:include page="Header.jsp"></jsp:include>
<!-- /HEADER -->

<div class="content-profile">
    <div class="container-profile-content">
        <div class="container-profile container-profile-content-inner">
            <!--content left-->
            <%--PROFILE BAR--%>
            <div class="container-profile-content-inner__left">

                <div class="profile-info">
                    <a href="" class="profile-info-logo">
                        <div class="profile-info-avatar-img">
                            <div class="profile-info-avatar_img__placeholder">
                                <img src="../admin/img/Sample_User_Icon.png" class="icon-user"/>
                            </div>
                        </div>
                    </a>
                    <div class="profile-info-username">
                        <div class="profile-info-username__text">NguyenVanA</div>
                        <div>
                            <a href="" class="profile-info-username__edit">
                                <i class="fa-solid fa-pencil"></i>
                                <span>Sửa Hồ Sơ</span>
                            </a>
                        </div>
                    </div>
                </div>
                <!--Drop down account -->
                <div class="profile-stardust-dropdown">
                    <div class="stardust-dropdown stardust-dropdown--open ">
                        <!--img + name-->
                        <div class="stardust-dropdown__item-header">
                            <a href="" class="stardust-dropdown__item-header-menu">
                                <div class="stardust-dropdown__item-header-account-img">
                                    <img src="../admin/img/Sample_user_icon_profile.png" height="48" width="48"/></div>
                                <div class="stardust-dropdown__item-header-account-name">
                                    <span class="stardust-dropdown__item-header-account-name-text">Tài Khoản Của Tôi</span>
                                    <i class="fa-solid fa-chevron-down"></i>
                                </div>
                            </a>
                        </div>
                        <!--dropdown menu detail-->
                        <div class="stardust-dropdown__item-body stardust-dropdown__item-body--open">
                            <div class="stardust-dropdown__item-body__content">
                                <a href="../views/profile.html" id="profile-link"
                                   class="stardust-dropdown__item-body__content-item stardust-dropdown__item-body__content-item-active"><span
                                        class="stardust-dropdown__item-body__content-item--text">Hồ sơ</span></a>
                                <a href="#" id="bank-link" class="stardust-dropdown__item-body__content-item"><span
                                        class="stardust-dropdown__item-body__content-item--text">Ngân Hàng</span></a>
                                <a href="" id="address-link" class="stardust-dropdown__item-body__content-item"><span
                                        class="stardust-dropdown__item-body__content-item--text">Địa chỉ</span></a>
                                <a href="" id="password-change-link" class="stardust-dropdown__item-body__content-item"><span
                                        class="stardust-dropdown__item-body__content-item--text">Đổi Lại Mật Khẩu</span></a>
                                <a href="" id="privacy-link" class="stardust-dropdown__item-body__content-item"><span
                                        class="stardust-dropdown__item-body__content-item--text">Những Thiết Lập Riêng Tư</span></a>
                            </div>
                        </div>
                    </div>
                    <div class="stardust-dropdown">
                        <div class="stardust-dropdown__item-header">
                            <a href="purchaseOrder.html" class="stardust-dropdown__item-header-menu">
                                <div class="stardust-dropdown__item-header-account-img">
                                    <img src="../admin/img/sample_Menu_Icon.png"/>
                                </div>
                                <div class="stardust-dropdown__item-header-account-name">
                                    <span class="stardust-dropdown__item-header-account-name-text">Đơn Mua</span>
                                </div>
                            </a>
                        </div>
                    </div>

                    <!--yeu thich-->
                    <div class="stardust-dropdown">
                        <div class="stardust-dropdown__item-header">
                            <a href="../views/Like.html" class="stardust-dropdown__item-header-menu">
                                <div class="stardust-dropdown__item-header-account-img">
                                    <img src="../admin/img/Heart-icon.png"/></div>
                                <div class="stardust-dropdown__item-header-account-name">
                                    <span class="stardust-dropdown__item-header-account-name-text">Yêu Thích</span>
                                </div>
                            </a>
                        </div>
                    </div>

                    <!--Dang Xuat-->
                    <div class="stardust-dropdown">
                        <div class="stardust-dropdown__item-header">
                            <a href="../views/Home.html" class="stardust-dropdown__item-header-menu">
                                <div class="stardust-dropdown__item-header-account-img">
                                    <i class="fa-solid fa-circle-xmark"></i>
                                </div>
                                <div class="stardust-dropdown__item-header-account-name">
                                    <span class="stardust-dropdown__item-header-account-name-text">Đăng Xuất</span>
                                </div>
                            </a>
                        </div>
                    </div>

                    <!--Ve admin-->
                    <div class="stardust-dropdown">
                        <div class="stardust-dropdown__item-header">
                            <a href="../admin/views/Dashboard.html" class="stardust-dropdown__item-header-menu">
                                <div class="stardust-dropdown__item-header-account-img">
                                    <img src="../admin/img/Sample_User_Icon.png"/></div>
                                <div class="stardust-dropdown__item-header-account-name">
                                    <span class="stardust-dropdown__item-header-account-name-text">Admin</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <%--PROFILE BAR--%>

            <!--content right-->
            <div class="container-product-content-inner__right">
                <div style="display: contents">
                    <div class="container-product-content-inner__right-inner">
                        <!--Phần tìm kiếm sản phẩm đã mua-->
                        <section class="container-product-content-inner__right-inner-list" aria-label="tablist">
                            <a href=""
                               class="container-product-content-inner__right-inner-item container-product-content-inner__right-inner-item--active"
                               title="Tất cả"
                               aria-selected="true" id="right-inner-item-all">
                                <span class="right-inner-item-text">Tất cả</span>
                            </a>

                            <a href="" class="container-product-content-inner__right-inner-item" title="Chờ thanh toán"
                               id="right-inner-item-pay">
                                <span class="right-inner-item-text">Chờ thanh toán</span>
                            </a>

                            <a href="" class="container-product-content-inner__right-inner-item" title="Chờ giao hàng"
                               aria-selected="false" id="right-inner-item-delivery">
                                <span class="right-inner-item-text">Chờ giao hàng</span>
                            </a>

                            <a href="" class="container-product-content-inner__right-inner-item" title="Hoàn thành"
                               aria-selected="false" id="right-inner-item-complete">
                                <span class="right-inner-item-text">Hoàn thành</span>
                            </a>

                            <a href="" class="container-product-content-inner__right-inner-item" title="Đã hủy"
                               aria-selected="false" id="right-inner-item-cancel">
                                <span class="right-inner-item-text">Đã hủy</span>
                            </a>

                        </section>
                        <!--THANH TÌM KIẾM THEO TÊN SÁCH-->
                        <section>
                            <div class="container-product-content-inner__right-inner__header">
                                <i class="fa-solid fa-magnifying-glass"></i>
                                <input autocomplete="false" placeholder="Bạn có thể tìm kiếm tên Sản phẩm" type="text"
                                       class="container-product-content-inner__right-inner__header-search">
                            </div>
                        </section>

                        <%--LẶP LẠI CÁC ĐƠN HÀNG--%>
                        <!--Nội dung của đơn mua bên dưới-->
                        <main id="container-product-content-inner__right-inner-center">
                            <!--Cac noi dung khac-->
                            <div class="container-product-content-inner__right-inner-center-product">
                                <div>
                                    <div class="container-product-content-inner__right-inner-center-product__header">
                                        <h3 class="container-product-content-inner__right-inner-center-product__header-title">
                                            HOÀN THÀNH
                                        </h3>
                                        <div class="container-product-content-inner__right-inner-center-product__header__empty"></div>
                                        <!--Header phần link của sản phẩm số lượng hình ảnh và giá cả-->
                                        <section>
                                            <a href="../views/purchaseOrderDetail.html">
                                                <div class="container-product-content-inner__right-inner-center-product__header__link">
                                                    <div class="content-inner__right-inner-infor">
                                                        <img src="../img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_1.webp"
                                                             alt=""
                                                             class="content-inner__right-inner-infor-img">
                                                        <div class="content-inner__right-inner-infor__text">
                                                            <div>
                                                                <div class="content-inner__right-inner-infor__text-content">
                                                                    <span class="content-inner__right-inner-infor__text-content-name">
                                                                        Mèo Mèo Mèo Bí Mật Giao Tiếp Từ Cái Vây Dưới Đen Tiếng Gru Gru
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <div class="content-inner__right-inner-infor__text-content">
                                                                    <div class="content-inner__right-inner-infor__text-content-quanlity"
                                                                         tabindex="0">
                                                                        x1
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="content-inner__right-inner-infor__price"
                                                         tabindex="0">
                                                            <span class="content-inner__right-inner-infor__price-text">
                                                                129.000đ
                                                            </span>
                                                    </div>
                                                </div>
                                            </a>
                                        </section>
                                    </div>
                                </div>
                                <div class="container-product-content-inner__right-inner-center-product__header__empty"></div>
                                <!--Phần thông tin của sản phẩm hiện tổng giá tiền-->
                                <div class="right-inner-center-product__header__total-price">
                                    <div class="right-inner-center-product__header__total-price-contain">
                                        <label class="right-inner-center-product__header__total-price-contain">
                                            Thành tiền:
                                        </label>
                                        <div class="right-inner-center-product__header__total-price-contain-cost"
                                             tabindex="0" aria-label="Thành tiền: 129.000đ">129.000đ

                                        </div>
                                    </div>
                                </div>
                                <div class="right-inner-center-product__header__date-and-rating">
                                    <div class="right-inner-center-product__header__date-contain">
                                        <div>
                                                <span class="date__text"
                                                      aria-label="Đánh giá sản phẩm trước ngày 10-11-2024" tabindex="0">
                                                    Đánh giá sản phẩm trước ngày
                                                    <div class="date-buy__text-date" id="rating-date-index-1">
                                                        <u class="date-buy__text-date-previous">10-11-2024</u>
                                                    </div>
                                                </span>
                                        </div>
                                    </div>
                                    <section class="right-inner-center-product__header__rating">
                                        <div class="right-inner-center-product__header__rating-vote">
                                            <div>
                                                <button class="stardust-button stardust-button--primary">
                                                    Đánh giá
                                                </button>
                                            </div>
                                        </div>
                                        <div class="right-inner-center-product__header__rating-buy-again">
                                            <div>
                                                <button class="stardust-button stardust-button--secondary">
                                                    Mua lại
                                                </button>

                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                            <div class="container-product-content-inner__right-inner-center-product">
                                <div>
                                    <div class="container-product-content-inner__right-inner-center-product__header">
                                        <h3 class="container-product-content-inner__right-inner-center-product__header-title">
                                            HOÀN THÀNH
                                        </h3>
                                        <div class="container-product-content-inner__right-inner-center-product__header__empty"></div>
                                        <!--Header phần link của sản phẩm số lượng hình ảnh và giá cả-->
                                        <section>
                                            <a href="">
                                                <div class="container-product-content-inner__right-inner-center-product__header__link">
                                                    <div class="content-inner__right-inner-infor">
                                                        <img src="../img/Chicanbantothon1%25.webp" alt=""
                                                             class="content-inner__right-inner-infor-img">
                                                        <div class="content-inner__right-inner-infor__text">
                                                            <div>
                                                                <div class="content-inner__right-inner-infor__text-content">
                                                                    <span class="content-inner__right-inner-infor__text-content-name">
                                                                        Chỉ cần bạn tốt hơn 1%
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <div class="content-inner__right-inner-infor__text-content">
                                                                    <div class="content-inner__right-inner-infor__text-content-quanlity"
                                                                         tabindex="0">
                                                                        x1
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="content-inner__right-inner-infor__price"
                                                         tabindex="0">
                                                            <span class="content-inner__right-inner-infor__price-text">
                                                                80.100đ
                                                            </span>
                                                    </div>
                                                </div>
                                            </a>
                                        </section>
                                    </div>
                                </div>
                                <div class="container-product-content-inner__right-inner-center-product__header__empty"></div>
                                <!--Phần thông tin của sản phẩm hiện tổng giá tiền-->
                                <div class="right-inner-center-product__header__total-price">
                                    <div class="right-inner-center-product__header__total-price-contain">
                                        <label class="right-inner-center-product__header__total-price-contain">
                                            Thành tiền:
                                        </label>
                                        <div class="right-inner-center-product__header__total-price-contain-cost"
                                             tabindex="0" aria-label="Thành tiền: 80.100đ">80.100đ

                                        </div>
                                    </div>
                                </div>
                                <div class="right-inner-center-product__header__date-and-rating">
                                    <div class="right-inner-center-product__header__date-contain">
                                        <div>
                                                <span class="date__text"
                                                      aria-label="Đánh giá sản phẩm trước ngày 10-11-2024" tabindex="0">
                                                    Đánh giá sản phẩm trước ngày
                                                    <div class="date-buy__text-date" id="rating-date-index-2">
                                                        <u class="date-buy__text-date-previous">10-11-2024</u>
                                                    </div>
                                                </span>
                                        </div>
                                    </div>
                                    <section class="right-inner-center-product__header__rating">
                                        <div class="right-inner-center-product__header__rating-vote">
                                            <div>
                                                <button class="stardust-button stardust-button--primary">
                                                    Đánh giá
                                                </button>
                                            </div>
                                        </div>
                                        <div class="right-inner-center-product__header__rating-buy-again">
                                            <div>
                                                <button class="stardust-button stardust-button--secondary">
                                                    Mua lại
                                                </button>

                                            </div>
                                        </div>
                                    </section>
                                </div>
                            </div>
                        </main>
                        <%--KẾT THÚC LẶP--%>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%--ĐÁNH GIÁ SẢN PHẨM--%>
    <div id="overlay" class="overlay hidden">
        <div class="rating-container">
            <div style="display: contents">
                <div>
                    <div class="rating-container-form">
                        <div class="rating-container-form__header">
                            <div class="rating-container-form-header-title">Đánh Giá Sản Phẩm</div>
                        </div>

                        <%--LẶP CÁC SÁCH CÓ TRONG ĐƠN HÀNG--%>
                        <div class="rating-container-form__main">
                            <div class="rating-container-form__main-container">
                                <div class="rating-infor rating-proc">
                                    <div class="rating-infor__product">
                                        <div class="rating-infor__product--img">
                                            <img src="../img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_1.webp"
                                                 alt="" class="img-product lazyload" width="60px" height="80px">
                                        </div>
                                        <div class="rating-infor__product--name">
                                            <span class="rating-infor__product--name-text">
                                                Mèo Mèo Mèo Bí Mật Giao Tiếp Từ Cái Vây Dưới Đen Tiếng Gru Gru
                                            </span>
                                            <span class="rating-infor__product--quantity">x1</span>
                                        </div>
                                    </div>
                                </div>

                                <div style="margin: 20px 0px">
                                    <div class="rating-infor__star">
                                        <div class="rating-infor__star--text">
                                            <span>Chất lượng sản phẩm</span>
                                        </div>
                                        <div class="rating-infor__star--star" style="padding-left: 5px">
                                            <i class="fa-solid fa-star"></i>
                                        </div>
                                        <div class="rating-infor__star--star" style="padding-left: 5px">
                                            <i class="fa-solid fa-star"></i>
                                        </div>
                                        <div class="rating-infor__star--star" style="padding-left: 5px">
                                            <i class="fa-solid fa-star"></i>
                                        </div>
                                        <div class="rating-infor__star--star" style="padding-left: 5px">
                                            <i class="fa-solid fa-star"></i>
                                        </div>
                                        <div class="rating-infor__star--star" style="padding-left: 5px">
                                            <i class="fa-solid fa-star"></i>
                                        </div>
                                        <span class="rating-infor__star--text"
                                              style="color: rgba(0,0,0,.69); margin-left: 5px">Tuyệt Vời</span>
                                    </div>
                                </div>

                                <div class="rating-infor-cmt">
                                    <div class="rating-infor-cmt-inner">
                                        <div class="rating-infor-cmt-inner__wrap">
                                            <div class="rating-infor-cmt-inner__wrap--text"
                                                 style="font-weight: normal">
                                                Đóng gói sản phẩm:
                                            </div>
                                            <textarea name="" rows="1" placeholder="để lại đánh giá."
                                                      class="rating-infor-cmt-inner--textarea"></textarea>
                                        </div>
                                        <div class="rating-infor-cmt-inner__line"></div>
                                        <div class="rating-infor-cmt-inner__wrap--description"
                                        >
                                                <textarea rows="3"
                                                          placeholder="Hãy chia sẻ những điều bạn thích về sản phẩm này với những người mua khác nhé."
                                                          class="rating-infor-cmt-inner--textarea"
                                                          style="min-height: 100px; color: rgba(0,0,0,0.87)">
                                                </textarea>
                                        </div>
                                    </div>
                                </div>

                                <div class="rating-vote-img">
                                    <label class="rating-vote-img--infor">
                                        <i class="fa-solid fa-camera"></i>
                                        <span class="rating-vote-img-add">Thêm hình ảnh</span>
                                        <input type="file" class="rating-file__input" accept="image/*">
                                    </label>
                                </div>

                                <div class="rating-vote-anonymous-wrapper">
                                    <label class="stardust-checkbox">
                                        <input type="checkbox" aria-checked="true" tabindex="0" role="checkbox"
                                               class="stardust-checkbox__input">
                                    </label>
                                    <div style="margin-left: 22px; margin-top: -10px">
                                        <div class="rating-vote-anonymous-hint">
                                            Hiển thị tên đăng nhập trên đánh giá này
                                        </div>
                                        <div class="rating-vote-anonymous-username">
                                            Tên tài khoản sẽ được hiển thị như ....
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <%--KẾT THÚC LẶP--%>
                        <div class="rating-container-form__footer">
                            <button id="cancel-overlay" class="rating-cancel-btn">Trở lại</button>
                            <button id="submit-overlay" type="button"
                                    class="btn btn-solid-primary btn--s btn--inline rating-submit-btn ">
                                Hoàn thành
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!--FOOTER-->
<<jsp:include page="footer.jsp"></jsp:include>
<!--FOOTER-->


<script>
    document.addEventListener('DOMContentLoaded', function () {
        const accountDropdownHeader = document.querySelector('.stardust-dropdown__item-header-menu');
        const dropdownBody = document.querySelector('.stardust-dropdown__item-body');
        const icon = document.querySelector('.stardust-dropdown__item-header-account-name i');

        accountDropdownHeader.addEventListener('click', function (event) {
            event.preventDefault(); // Ngăn chặn load lại trang
            dropdownBody.classList.toggle('stardust-dropdown__item-body--open');
            icon.classList.toggle('rotate-icon');
        });
    });
</script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const hash = window.location.hash;
        if (hash) {
            const targetSection = document.querySelector(hash);
            if (targetSection) {
                targetSection.scrollIntoView({behavior: 'smooth'});
            }
        }
    });
</script>

<!--js hidden-->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const reviewButton = document.querySelector(".stardust-button--primary"); // Nút "Đánh giá"
        const overlay = document.getElementById("overlay"); // Overlay
        const cancelButton = document.getElementById("cancel-overlay"); // Nút "Trở lại"
        const submitButton = document.getElementById("submit-overlay"); // Nút "Hoàn thành"

        // Hiển thị overlay khi nhấn "Đánh giá"
        reviewButton.addEventListener("click", () => {
            overlay.classList.remove("hidden"); // Hiện overlay
        });

        // Ẩn overlay khi nhấn "Trở lại"
        cancelButton.addEventListener("click", () => {
            overlay.classList.add("hidden"); // Ẩn overlay
        });

        // Xử lý khi nhấn "Hoàn thành"
        submitButton.addEventListener("click", () => {
            console.log("Đánh giá đã gửi thành công!"); // Thêm logic gửi đánh giá ở đây nếu cần
            overlay.classList.add("hidden"); // Ẩn overlay
        });

        // Ẩn overlay khi nhấn ra ngoài overlay
        overlay.addEventListener("click", (event) => {
            if (event.target === overlay) {
                overlay.classList.add("hidden");
            }
        });
    });


</script>


</body>
</html>
