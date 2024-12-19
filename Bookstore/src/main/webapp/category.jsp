<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:15 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "f" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Category</title>

  <!--    all css files-->
  <link rel="stylesheet" href="css/category.css">
  <link rel="stylesheet" href="css/Style.css">
  <link rel="stylesheet" href="css/footer.css">
  <link rel="stylesheet" href="css/Header.css">
  <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">
  <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">
  <script src="js/bootstrap.bundle.min.js"></script>

</head>
<body>

<!--header-->
<!--<div id="header"></div>-->
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
        <a href="Home.jsp">
          <div class="header-logo">
            <img src="img/logo/logo-header.png" height="80" width="100"/></div>
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

<!--content-->
<div class="app__container">
  <!--    head -->
  <div class="grid__head">
    <div class="head">
      <h2 class="head__title">Tất cả sách</h2>
      <div class="head-filter">
        <p>Ưu tiên xem:</p>
        <ul class="head-filter__list">
          <li class="head-filter__item">
            <a href="" class="head-filter__link" title="Hàng mới nhất">Hàng mới nhất</a>
          </li>
          <li class="head-filter__item">
            <a href="" class="head-filter__link" title="Hàng cũ nhất">Hàng cũ nhất</a>
          </li>
          <li class="head-filter__item">
            <a href="" class="head-filter__link" title="Giá tăng dần">Giá tăng dần</a>
          </li>
          <li class="head-filter__item">
            <a href="" class="head-filter__link" title="Giá giảm dần">Giá giảm dần</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
  <!--        category and product-->
  <div class="grid">
    <div class="grid__row-left">
      <div class="col-md-2">
        <nav class="category">
          <div class="category-form">
            <h4 class="category__heading">Tác Giả</h4>
            <div class="category-scroll">
              <div class="category-inform">
                <input type="checkbox" id="ho-anh-thai">
                <label class="checkbox-label" for="ho-anh-thai">Hồ Anh Thái</label>
              </div>
              <div class="category-inform">
                <input type="checkbox" id="nguyen-vinh-nguyen">
                <label class="checkbox-label" for="nguyen-vinh-nguyen">Nguyễn Vĩnh Nguyên</label>
              </div>
              <div class="category-inform">
                <input type="checkbox" id="bach-to">
                <label class="checkbox-label" for="bach-to">Bạch Tô</label>
              </div>
              <div class="category-inform">
                <input type="checkbox" id="nguyen-an-dung">
                <label class="checkbox-label" for="nguyen-an-dung">Nguyễn Anh Dũng</label>
              </div>
              <div class="category-inform">
                <input type="checkbox" id="lily-truong">
                <label class="checkbox-label" for="lily-truong">Lily Trương</label>
              </div>
              <div class="category-inform">
                <input type="checkbox" id="ha-mer">
                <label class="checkbox-label" for="ha-mer">Hạ Mer</label>
              </div>
              <div class="category-inform">
                <input type="checkbox" id="that-thien">
                <label class="checkbox-label" for="that-thien">Thất Thiên</label>
              </div>
              <div class="category-inform">
                <input type="checkbox" id="mieu-cong-tu">
                <label class="checkbox-label" for="mieu-cong-tu">Miêu Công Tử</label>
              </div>
            </div>
          </div>
          <div class="category-form">
            <h4 class="category__heading">Nhà xuất bản</h4>
            <div class="category-scroll">
              <div class="category-inform">
                <input type="checkbox" id="kim-dong">
                <label class="checkbox-label" for="kim-dong">NXB Kim Đồng</label>
              </div>
              <div class="category-inform">
                <input type="checkbox" id="tre">
                <label class="checkbox-label" for="tre">NXB Trẻ</label>
              </div>
              <div class="category-inform">
                <input type="checkbox" id="phu-nu">
                <label class="checkbox-label" for="phu-nu">NXB Phụ Nữ</label>
              </div>
              <div class="category-inform">
                <input type="checkbox" id="lao-dong">
                <label class="checkbox-label" for="lao-dong">NXB Lao Động</label>
              </div>
              <div class="category-inform">
                <input type="checkbox" id="nha-nam">
                <label class="checkbox-label" for="nha-nam">NXB Nhã Nam</label>
              </div>
              <div class="category-inform">
                <input type="checkbox" id="van-hoa">
                <label class="checkbox-label" for="van-hoc">NXB Văn Học</label>
              </div>
            </div>
          </div>
          <div class="category-form">
            <h4 class="category__heading">Loại sách</h4>
            <div class="category-inform">
              <input type="checkbox" id="kinh-te">
              <label class="checkbox-label" for="kinh-te">Sách kinh tế</label>
            </div>

            <div class="category-inform">
              <input type="checkbox" id="ky-nang">
              <label class="checkbox-label" for="ky-nang">Sách kỹ năng</label>
            </div>

            <div class="category-inform">
              <input type="checkbox" id="thieu-nhi">
              <label class="checkbox-label" for="thieu-nhi">Sách thiếu nhi</label>
            </div>

            <div class="category-inform">
              <input type="checkbox" id="thuong-thuc">
              <label class="checkbox-label" for="thuong-thuc">Sách thường thức</label>
            </div>

            <div class="category-inform">
              <input type="checkbox" id="tuoi-teen">
              <label class="checkbox-label" for="tuoi-teen">Sách tuổi teen</label>
            </div>

            <div class="category-inform">
              <input type="checkbox" id="van-hoc">
              <label class="checkbox-label" for="van-hoc">Sách văn học</label>
            </div>
          </div>
          <div class="category-form">
            <h4 class="category__heading">Giá cả</h4>
            <div class="category-inform">
              <input type="checkbox" id="100k">
              <label class="checkbox-label" for="100k">Giá dưới 100.000đ</label>
            </div>

            <div class="category-inform">
              <input type="checkbox" id="200k">
              <label class="checkbox-label" for="200k">100.000đ - 200.000đ</label>
            </div>

            <div class="category-inform">
              <input type="checkbox" id="300k">
              <label class="checkbox-label" for="300k">200.000đ - 300.000đ</label>
            </div>

            <div class="category-inform">
              <input type="checkbox" id="500k">
              <label class="checkbox-label" for="500k">300.000đ - 500.000đ</label>
            </div>

            <div class="category-inform">
              <input type="checkbox" id="1000k">
              <label class="checkbox-label" for="1000k">500.000đ - 1.000.000đ</label>
            </div>

            <div class="category-inform">
              <input type="checkbox" id="hon1tr">
              <label class="checkbox-label" for="hon1tr">Giá trên 1.000.000đ</label>
            </div>
          </div>
          <div class="category-form">
            <h4 class="category__heading">Đánh Giá Sao</h4>
            <div class="category-inform">
              <input type="radio" id="star-1" name="rating" value="1" hidden>
              <label class="checkbox-label" for="star-1">
                <i class="fa-regular fa-star"></i>
              </label>
            </div>

            <div class="category-inform">
              <input type="radio" id="star-2" name="rating" value="2" hidden>
              <label class="checkbox-label" for="star-2">
                <i class="fa-regular fa-star"></i>
                <i class="fa-regular fa-star"></i>
              </label>
            </div>

            <div class="category-inform">
              <input type="radio" id="star-3" name="rating" value="3" hidden>
              <label class="checkbox-label" for="star-3">
                <i class="fa-regular fa-star"></i>
                <i class="fa-regular fa-star"></i>
                <i class="fa-regular fa-star"></i>
              </label>
            </div>

            <div class="category-inform">
              <input type="radio" id="star-4" name="rating" value="4" hidden>
              <label class="checkbox-label" for="star-4">
                <i class="fa-regular fa-star"></i>
                <i class="fa-regular fa-star"></i>
                <i class="fa-regular fa-star"></i>
                <i class="fa-regular fa-star"></i>
              </label>
            </div>

            <div class="category-inform">
              <input type="radio" id="star-5" name="rating" value="5" hidden>
              <label class="checkbox-label" for="star-5">
                <i class="fa-regular fa-star"></i>
                <i class="fa-regular fa-star"></i>
                <i class="fa-regular fa-star"></i>
                <i class="fa-regular fa-star"></i>
                <i class="fa-regular fa-star"></i>
              </label>
            </div>
          </div>
        </nav>
      </div>
    </div>
    <div class="grid__row--content">
      <div class="col-md-10">
        <div class="home-product">
          <!-- Sản phẩm hiển thị bên phải -->
          <div id="product-container" class="grid__row">
            <!--0-->
            <c:forEach var="p" items="${data}">
              <div class="grid-md-2-4">
                <a href="views/ProductDetail.html">
                  <div class="home-product-item">
                    <div class="home-product-item__img"
                         style="background-image: url('img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_1.webp')"></div>
                    <h4 class="home-product-item__name">Bí Mật Giao Tiếp Từ Cái Vẫy Đuôi Đến Tiếng Grừ
                      </h4>
                    <div class="home-product-item__price">
                      <span class="home-product-item__price-current">86.000đ</span>
                      <span class="home-product-item__price-old">115.000đ</span>
                    </div>
                    <div class="home-product-item__action">
                      <span class="home-product-item__like home-product-item__like--liked">
                        <i class="home-product-item__action-icon-empty fa-regular fa-heart"></i>
                        <i class="home-product-item__action-icon-fill fa-solid fa-heart"></i>
                      </span>
                      <div class="home-product-item__rating">
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                        <i class="fa-solid fa-star"></i>
                      </div>
                    </div>
                  </div>
                </a>
              </div>
            </c:forEach>

          </div>

          <div style="text-align: center; margin-top: 36px;">
            <button id="load-more" class="home-product-btn btn-primary">Xem thêm</button>
          </div>
        </div>
      </div>

      <!-- Phân trang -->
      <div class="grid__row--footer">
        <div class="col-md-10">
          <div class="home-filter__paginate" style="text-align: right;">
            <ul class="home-filter__paginate-list">
              <li class="home-filter__paginate-item home-filter__paginate-item--active"><a href="">1</a>
              </li>
              <li class="home-filter__paginate-item"><a href="">2</a></li>
              <li class="home-filter__paginate-item"><a href="">3</a></li>
              <li class="home-filter__paginate-item"><a href="">4</a></li>
              <li class="home-filter__paginate-item"><a href="">5</a></li>
              <li class="home-filter__paginate-item"><a href=""><i class="fa-solid fa-chevron-right"></i></a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!--footer-->
<!--<div id="footer"></div>-->
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
<!-- /FOOTER -->


<script>
  document.addEventListener("DOMContentLoaded", function () {
    const starInputs = document.querySelectorAll("input[name='rating']");
    const starLabels = document.querySelectorAll(".category-inform label");

    // Gắn sự kiện click cho từng label
    starLabels.forEach((label, index) => {
      label.addEventListener("click", () => {
        updateStars(index);
      });
    });

    // Hàm cập nhật màu của các ngôi sao dựa trên chỉ số được chọn
    function updateStars(selectedIndex) {
      starLabels.forEach((label, i) => {
        if (i <= selectedIndex) {
          label.querySelector("i").style.color = "#ffc107"; // Vàng
        } else {
          label.querySelector("i").style.color = "#ddd"; // Xám
        }
      });

      // Đánh dấu radio button tương ứng là được chọn
      starInputs[selectedIndex].checked = true;
    }

    // Kiểm tra trạng thái khi tải lại trang
    const checkedInputIndex = Array.from(starInputs).findIndex((input) => input.checked);
    if (checkedInputIndex !== -1) {
      updateStars(checkedInputIndex); // Cập nhật màu nếu đã chọn trước đó
    }
  });


</script>


</body>
</html>
