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
<jsp:include page="Curtain-Menu.jsp"/>

<jsp:include page="Header-Dashboard.jsp"/>

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
