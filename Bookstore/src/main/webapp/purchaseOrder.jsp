<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:18 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Product</title>
  <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">
  <link rel="stylesheet" href="../css/profile.css">
  <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">
  <link rel="stylesheet" href="../css/Header.css">
  <link rel="stylesheet" href="../css/footer.css">
  <link rel="stylesheet" href="../css/Style.css">
  <link rel="stylesheet" href="../css/purchaseOrder.css">
  <script src="../js/bootstrap.bundle.min.js"></script>

</head>
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
        <a href="Home.html">
          <div class="header-logo">
            <img src="../img/logo/logo-header.png" height="80" width="100"/></div>
        </a>
      </div>
      <!-- /LOGO -->

      <!-- SEARCH BAR -->
      <div class="col-md-7">
        <div class="header-search">
          <form class="d-flex mt-2">
            <input class="input flex-grow-1" placeholder="Search product">
            <button class="search-btn">Search</button>
          </form>
        </div>
      </div>
      <!-- /SEARCH BAR -->

      <!-- ACCOUNT -->
      <div class="col-md-3 clearfix d-flex">
        <ul class="account-menu mr-1">
          <li class="account box mt-4">
            <a href="profile.html">Tài khoản</a>
            <i class="fa-solid fa-angle-down"></i>
            <ul class="subnav">
              <li class="border-bottom border-gray"><a href="login.html">Đăng nhập</a></li>
              <li><a href="login.html">Đăng kí</a></li>
            </ul>
          </li>
        </ul>
        <div class="shopping-cart mt-4 ">
          <a href="Cart.html" style="color: black">
            <!--                    <i class="fa-solid fa-cart-shopping" style="color: #0e2b1e;"></i>-->
            <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor"
                 class="bi bi-bag-check" viewBox="0 0 16 16">
              <path fill-rule="evenodd"
                    d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0"/>
              <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1m3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"/>
            </svg>
          </a>
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
      <li class="nav-item "><a href="Home.html">Trang chủ</a></li>
      <li class="nav-item "><a href="AboutUs.html">Giới thiệu</a></li>
      <li class="nav-item dropdown ">
        <a class="nav-link dropdown-toggle pt-0 pl-15 pr-10" href="category.html" id="productDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          Sản phẩm
        </a>
        <ul class="dropdown-menu" aria-labelledby="productDropdown">
          <li><a class="dropdown-item" href="category.html">Sách văn học</a></li>
          <li><a class="dropdown-item" href="category.html">Kinh tế</a></li>
          <li><a class="dropdown-item" href="category.html">Sách thiếu nhi</a></li>
          <li><a class="dropdown-item" href="category.html">Tiểu sử - Hồi ký</a></li>
          <li><a class="dropdown-item" href="category.html">Tâm lí - Kĩ năng sống</a></li>
          <li><a class="dropdown-item" href="category.html">Nuôi dạy con</a></li>
          <li><a class="dropdown-item" href="category.html">Sách giáo khoa</a></li>
        </ul>
      </li>
      <li class="nav-item "><a href="policy.html">Chính sách</a></li>
      <li class="nav-item "><a href="contact.html">Liên hệ</a></li>
    </ul>
    <!-- /NAV -->
  </div>
</nav>
<!--/nav end-->

<div class="content-profile">
  <div class="container-profile-content">
    <div class="container-profile container-profile-content-inner">
      <!--content left-->
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

            <section>
              <div class="container-product-content-inner__right-inner__header">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input autocomplete="false" placeholder="Bạn có thể tìm kiếm tên Sản phẩm" type="text"
                       class="container-product-content-inner__right-inner__header-search">
              </div>
            </section>
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
          </div>
        </div>
      </div>
    </div>
  </div>
  <div id="overlay" class="overlay hidden">
    <div class="rating-container">
      <div style="display: contents">
        <div>
          <div class="rating-container-form">
            <div class="rating-container-form__header">
              <div class="rating-container-form-header-title">Đánh Giá Sản Phẩm</div>
            </div>
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



<!--footer-->
<div id="footer"></div>
<!--    footer start -->
<section class="footer">
  <div class="footer-row">
    <div class="footer-col">
      <a href="" class="mb-4"><img src="../img/logo/logo1.png"/></a>
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
