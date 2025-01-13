<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:17 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
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

<!-- NAVIGATION-->
<nav id="navigation">
  <!-- container -->
  <div class="container ">
    <!-- NAV -->
    <ul class="main-nav nav ">
      <li class="nav-item "><a href="Home.jsp">Trang chủ</a></li>
      <li class="nav-item "><a href="AboutUs.jsp">Giới thiệu</a></li>
      <li class="nav-item dropdown ">
        <a class="nav-link dropdown-toggle pt-0 pl-15 pr-10" href="category.jsp" id="productDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          Sản phẩm
        </a>
        <ul class="dropdown-menu" aria-labelledby="productDropdown">
          <li><a class="dropdown-item" href="category.jsp">Sách văn học</a></li>
          <li><a class="dropdown-item" href="category.jsp">Kinh tế</a></li>
          <li><a class="dropdown-item" href="category.jsp">Sách thiếu nhi</a></li>
          <li><a class="dropdown-item" href="category.jsp">Tiểu sử - Hồi ký</a></li>
          <li><a class="dropdown-item" href="category.jsp">Tâm lí - Kĩ năng sống</a></li>
          <li><a class="dropdown-item" href="category.jsp">Nuôi dạy con</a></li>
          <li><a class="dropdown-item" href="category.jsp">Sách giáo khoa</a></li>
        </ul>
      </li>
      <li class="nav-item "><a href="policy.jsp">Chính sách</a></li>
      <li class="nav-item "><a href="contact.jsp">Liên hệ</a></li>
    </ul>
    <!-- /NAV -->
  </div>
</nav>
<!--/nav end-->

<!--Content-->
<div class="content-profile" class="container-profile">
  <div class="container-profile-content">
    <div class="container-profile container-profile-content-inner">
      <!--content left-->
      <div class="container-profile-content-inner__left">

        <div class="profile-info">
          <a href="" class="profile-info-logo">
            <div class="profile-info-avatar-img">
              <div class="profile-info-avatar_img__placeholder">
                <img src="admin/img/Sample_User_Icon.png" class="icon-user"/>
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
                  <img src="admin/img/Sample_user_icon_profile.png" height="48" width="48"/></div>
                <div class="stardust-dropdown__item-header-account-name">
                  <span class="stardust-dropdown__item-header-account-name-text">Tài Khoản Của Tôi</span>
                  <i class="fa-solid fa-chevron-down"></i>
                </div>
              </a>
            </div>
            <!--dropdown menu detail-->
            <div class="stardust-dropdown__item-body stardust-dropdown__item-body--open">
              <div class="stardust-dropdown__item-body__content">
                <a href="views/profile.jsp" id="profile-link"
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
              <a href="purchaseOrder.jsp" class="stardust-dropdown__item-header-menu">
                <div class="stardust-dropdown__item-header-account-img">
                  <img src="admin/img/sample_Menu_Icon.png"/>
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
              <a href="views/Like.jsp" class="stardust-dropdown__item-header-menu">
                <div class="stardust-dropdown__item-header-account-img">
                  <img src="admin/img/Heart-icon.png"/></div>
                <div class="stardust-dropdown__item-header-account-name">
                  <span class="stardust-dropdown__item-header-account-name-text">Yêu Thích</span>
                </div>
              </a>
            </div>
          </div>

          <!--Dang Xuat-->
          <div class="stardust-dropdown">
            <div class="stardust-dropdown__item-header">
              <a href="views/Home.jsp" class="stardust-dropdown__item-header-menu">
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
              <a href="admin/views/Dashboard.jsp" class="stardust-dropdown__item-header-menu">
                <div class="stardust-dropdown__item-header-account-img">
                  <img src="admin/img/Sample_User_Icon.png"/></div>
                <div class="stardust-dropdown__item-header-account-name">
                  <span class="stardust-dropdown__item-header-account-name-text">Admin</span>
                </div>
              </a>
            </div>
          </div>
        </div>
      </div>

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
<section class="footer">
  <div class="footer-row">
    <div class="footer-col">
      <a href="" class="mb-4"><img src="img/logo/logo1.png"/></a>
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
</body>
</html>