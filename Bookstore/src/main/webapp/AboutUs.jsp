<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:14 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Về chúng tôi - Rimberio</title>
  <!--    Boostrap-->
  <script src="../js/bootstrap.bundle.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/bootstrap.bundle.min.js"></script>

  <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">

  <!-- Font awesome-->
  <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">

  <!--    CSS-->
  <link rel="stylesheet" href="../css/AboutUs.css">
  <link rel="stylesheet" href="../css/Header.css">
  <link rel="stylesheet" href="../css/footer.css">
  <link rel="stylesheet" href="../css/Style.css">

  <!--    Font-->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Playwrite+GB+S:ital,wght@0,100..400;1,100..400&display=swap"
        rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,opsz,wght@0,14..32,100..900;1,14..32,100..900&family=Lobster&family=Open+Sans:ital,wght@0,300..800;1,300..800&family=Playfair+Display:ital,wght@0,400..900;1,400..900&family=Playwrite+GB+S:wght@100..400&family=Quicksand:wght@300..700&display=swap"
        rel="stylesheet">
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
        <a class="nav-link dropdown-toggle p-0 " href="category.html" id="productDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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

<!-- Container -->
<div class="section d-flex justify-content-center">
  <div class="container m-5">
    <div class="introduction row gx-5">
      <div class="image col-6 d-flex flex-column justify-content-center align-items-center">
        <img src="../img/introduction.jpg" class="card-img"
             style="box-shadow: -25px -25px 0px 0px rgba(184,215,213,1);
                        -webkit-box-shadow: -25px -25px 0px 0px rgba(184,215,213,1);
                        -moz-box-shadow: -25px -25px 0px 0px rgba(184,215,213,1);"
        />
      </div>
      <div class="subIntro col-6">
        <h1 class="boldGreen">Rất vui được gặp bạn,<br> Chúng tôi là Rimberio!</h1>
        <p>
          Chúng tôi là một hiệu sách trực tuyến có trụ sở tại Đại học Nông Lâm.
        </p>
        <p>
          Chúng tôi cung cấp sách thuộc nhiều thể loại khác nhau, từ tiểu thuyết, phi tiểu thuyết, đến nhiều
          thể loại truyện tranh, cũng như sách về nhiếp ảnh và nghệ thuật.
        </p>
        <p>
          Nếu bạn không tìm thấy cuốn sách mình đang tìm, chúng tôi cũng cung cấp dịch vụ Đặt hàng theo yêu
          cầu!
        </p>
        <p>
          Cảm ơn bạn đã dành thời gian và như thường lệ, hãy đọc nhiều hơn, thường xuyên hơn!
        </p>
      </div>
    </div>
    <div class="welcome">
      <h1 class="boldGreen">Giá sách của chúng tôi luôn đầy ắp<br>
        và chào đón bạn ghé thăm!</h1>
    </div>
    <div class="address row d-flex justify-content-center">
      <div class="subAddress col-5 d-flex flex-column justify-content-center">
        <p class="bold">
          RIMBERIO Bookstore - Đại học Nông Lâm
        </p>
        <p><span class="bold">Địa chỉ:</span> VQCR+GP6, khu phố 6, Thủ Đức, Hồ Chí Minh</p>
        <p><span class="bold">Điện thoại:</span> 123456789</p>
        <p><span class="bold">Email:</span> @st.hcmuaf.edu.vn</p>
        <p><span class="bold">Giờ làm việc:</span> T2-T6, 07:00 – 17:00</p>
      </div>
      <iframe class="map col-7"
              src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d15672.858378257437!2d106.7917617!3d10.8712764!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3175276398969f7b%3A0x9672b7efd0893fc4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBOw7RuZyBMw6JtIFRQLiBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1729962747336!5m2!1svi!2s"
              style="border:0;" allowfullscreen="" loading="lazy"
              referrerpolicy="no-referrer-when-downgrade"></iframe>

    </div>

  </div>
</div>
<!-- Footer -->
<!--<div id="footer"></div>-->
<section class="footer">
  <div class="footer-row">
    <div class="footer-col">
      <a href="" class="mb-4"><img src="../img/logo/new_logo.png"/></a>
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

<!--Script-->
<!--<script>-->
<!--    fetch('Header.html')-->
<!--        .then(response => {-->
<!--            if (!response.ok) throw new Error('Network response was not ok');-->
<!--            return response.text();-->
<!--        })-->
<!--        .then(data => document.getElementById('header').innerHTML = data)-->
<!--        .catch(error => console.error('Error:', error));-->

<!--    // Tải nội dung của footer từ tệp Footer.html-->
<!--    fetch('footer.html')-->
<!--        .then(response => response.text())-->
<!--        .then(data => {-->
<!--            document.getElementById('footer').innerHTML = data;-->
<!--        });-->
<!--</script>-->

</body>
</html>

