<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20/12/2024
  Time: 9:29 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Thêm nhà xuất </title>

  <!--  all css files-->
  <link rel="stylesheet" href="../../css/boostrap/bootstrap.min.css">
  <link rel="stylesheet" href="../../css/dataTable/datatables.min.css">
  <link rel="stylesheet" href="../../css/Style.css">
  <link rel="stylesheet" href="../../fonts/fontawesome-free-6.6.0-web/css/all.css">
  <link rel="stylesheet" href="../css/Dashboard.css">

</head>
<body>
<!--curtain menu-->
<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
  <div class="offcanvas-header">
    <a href="Dashboard.html">
      <img src="../../img/logo/new_logo.png" height="200px" width="200px"/>
    </a>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <nav class="offcanvas-body">
    <ul class="links">
      <li class="nav-item">
        <a href="Dashboard.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-tachometer-alt"></i>
            </span>
          <span class="text" style="color: black; font-weight: bold">Dashboard</span>
        </a>
      </li>
      <li class="nav-item">
        <a href="User-Management.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-users"></i>
            </span>
          <span class="text" style="color: black; font-weight: bold">Quản lí tài khoản</span>
        </a>
      </li>
      <li class="nav-item">
        <a href="Order-Management.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-shopping-cart"></i>
            </span>
          <span class="text" style="color: black; font-weight: bold">Quản lí đơn hàng</span>
        </a>
      </li>
      <li class="nav-item">
        <a href="Category-Management.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-tags"></i>
            </span>
          <span class="text" style="color: black; font-weight: bold">Quản lí danh mục</span>
        </a>
      </li>
      <li class="nav-item">
        <a href="Product-Management.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-archive"></i>
            </span>
          <span class="text" style="color: black; font-weight: bold">Quản lí sản phẩm</span>
        </a>
      </li>
      <li class="nav-item">
        <a href="Supplier-Management.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="far fa-newspaper"></i>
            </span>
          <span class="text" style="color: black; font-weight: bold">Quản lí nhà xuất bản</span>
        </a>
      </li>
      <li class="nav-item">
        <a href="Slider-Management.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-store"></i>
            </span>
          <span class="text" style="color: black; font-weight: bold">Quản lí slider</span>
        </a>
      </li>
      <li class="nav-item">
        <a href="Discount-Management.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-percent"></i>
            </span>
          <span class="text" style="color: black; font-weight: bold">Quản lí khuyến mãi</span>
        </a>
      </li>
      <li class="nav-item">
        <a href="Admin-Management.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-users-cog"></i>
            </span>
          <span class="text" style="color: black; font-weight: bold">Admin</span>
        </a>
      </li>
      <li class="nav-item">
        <a href="Settings.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
                    <i class="fa-solid fa-gear"></i>
            </span>
          <span class="text" style="color: black; font-weight: bold">Cài đặt chung</span>
        </a>
      </li>
    </ul>
  </nav>
</div>
<div class="overlay"></div>

<!--header start-->
<header id="header">
  <div class="container-fluid">
    <div class="row">
      <div class="col-lg-5 col-md-5 col-6 d-flex align-items-center">
        <div class="header-left">
          <div class="menu-toggle-btn ">
            <button class="btn" type="button" style="background-color: #4B908E; color: white"
                    data-bs-toggle="offcanvas"
                    data-bs-target="#offcanvasExample" aria-controls="offcanvasExample"><i
                    class="fas fa-bars" style="color:white"></i> Menu
            </button>
          </div>
        </div>
      </div>
      <div class="col-lg-6 col-md-7 col-6 ">
        <div class="header-right">
          <!-- profile start -->
          <div class="profile-box">
            <button class="dropdown-toggle bg-transparent border-0  d-flex align-items-center" type="button"
                    id="profile"
                    data-bs-toggle="dropdown" aria-expanded="false">
              <div class="profile-info">
                <div class="info ">
                  <h5 class="pt-3">Ngọc Diễm</h5>
                  <div class="image">
                    <img src="../img/Sample_User_Icon.png" style="width: 40px; height: 40px">
                    <span class="status"></span>
                  </div>
                </div>
              </div>
            </button>
            <ul class="dropdown-menu">
              <li><a class="dropdown-item" href="../../views/Home.html">Trang bán hàng</a></li>
              <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
            </ul>
          </div>
          <!-- profile end -->
        </div>
      </div>
    </div>
  </div>
</header>
<!--header end-->

<!-- Container -->
<section class="section">
  <div class="container-fluid ">
    <div class="title-wrapper pt-3">
      <div class="d-flex align-items-center">
        <!-- end col -->
        <div class="breadcrumb-wrapper">
          <ol class="breadcrumb mx-4">
            <li class="breadcrumb-item">
              <a href="Dashboard.html" class="text-dec" style="color: gray">Dashboard</a>
              <a href="#" class="text-dec" style="color: gray"> / </a>
              <a href="Slider-Management.html" class="text-dec" style="color: gray">Quản lí slider</a>
              <a href="#" class="text-dec" style="color: gray"> / </a>
              <a href="#" class="text-dec" id="currentPage" style="color: #f07c29">Thêm slider</a>
            </li>
          </ol>
        </div>
        <!-- end col -->
      </div>
      <!-- end row -->
    </div>
  </div>
  <section class="content-main ">
    <div class="card-slider w-50 m-auto  p-4 b-1 rounded-1">
      <div class="card-header pb-2 bb-1">
        <h3 id="modalTitle">Thêm slider</h3>
      </div>
      <div class="card-body mt-3">
        <form action="">
          <div class="mb-3">
            <label for="nameSlider" class="form-label">Tên slider</label>
            <input type="text" class="form-control" id="nameSlider">
          </div>
          <div class="mb-3">
            <label for="codeDiscount" class="form-label">Thuộc chương trình khuyến mãi</label>
            <input type="email" class="form-control" id="codeDiscount">
          </div>
          <div class="mb-3">
            <label for="link" class="form-label">Link</label>
            <input type="text" class="form-control" id="link">
          </div>
          <div class="mb-3">
            <label for="imageSlider" class="form-label">Ảnh</label>
            <input type="file" class="form-control" id="imageSlider">
          </div>

          <div class="d-flex justify-content-center mb-2">
            <button type="button"
                    class="btn btn-green save-slider mx-4">
              Lưu
            </button>
            <button type="button"
                    class="btn btn-danger cancel-slider" onclick="goToSliderManagement()">
              Hủy
            </button>
          </div>
        </form>
      </div>
    </div>
  </section>
</section>

<!--all script files-->
<script src="../../fonts/fontawesome-free-6.6.0-web/js/all.js"></script>
<script src="../../js/jquery.min.js"></script>
<script src="../../js/bootstrap.bundle.min.js"></script>
<script src="../../js/datatables.min.js"></script>

<script>
  window.onload = function () {
    // Lấy giá trị tham số "edit" từ URL
    let urlParams = new URLSearchParams(window.location.search);
    let isEditMode = urlParams.get('edit') === 'true';

    // Thay đổi nội dung của modalTitle tùy vào chế độ
    if (isEditMode) {
      document.getElementById('modalTitle').textContent = 'Sửa slider';
      document.getElementById('currentPage').textContent = 'Sửa slider';// Nếu là chỉnh sửa
    } else {
      document.getElementById('modalTitle').textContent = 'Thêm slider';  // Nếu là thêm mới
      document.getElementById('currentPage').textContent = 'Thêm slider';// Nếu là chỉnh sửa

    }
  };

</script>

</body>
</html>
