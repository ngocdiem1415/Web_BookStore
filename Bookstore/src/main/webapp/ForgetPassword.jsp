<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:16 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>forgetPassword</title>
  <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">
  <link rel="stylesheet" href="css/profile.css">
  <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">
  <link rel="stylesheet" href="css/Header.css">
  <link rel="stylesheet" href="css/footer.css">
  <link rel="stylesheet" href="css/Style.css">
  <link rel="stylesheet" href="css/ForgetPassword.css">
  <script src="js/bootstrap.bundle.min.js"></script>

</head>
<body>
<!--Header-->
<!--Header-->
<jsp:include page="Header.jsp"></jsp:include>

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
<div class="forget-password-contain">
  <div id="content" class="forget-password-content">
    <div class="forget-password-content-inner">
      <form action="post" class="forget-password-content-inner-form">
        <p>Bạn bị mất mật khẩu? Vui lòng nhập tên người dùng hoặc địa chỉ email của bạn. Bạn sẽ nhận được liên
          kết để tạo mật khẩu mới qua email.</p>
        <div class="forget-password-content-inner-form-group">
          <label for="User-login">Email <span class="required">*</span></label>
          <input type="email" class="forget-password-content-inner-form-group-input" id="User-login"
                 autocomplete="username" required>
        </div>
        <div class="forget-password-content-inner-form-group-btn">
          <button type="submit" class="forget-password-content-inner-form-group-btn-submit">Gửi lại mật khẩu
          </button>
        </div>
      </form>
    </div>
  </div>
</div>

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
<!-- /FOOTER -->
</body>
</html>
