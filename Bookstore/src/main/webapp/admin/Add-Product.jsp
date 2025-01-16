<%--
  Created by IntelliJ IDEA.
  User: ngocd
  Date: 1/15/2025
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Thêm sản phẩm</title>

  <!--  all css files-->
  <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap5.css">
  <link rel="stylesheet" href="../css/Style.css">
  <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">
  <link rel="stylesheet" href="css/Dashboard.css">
</head>
<body>

<jsp:include page="Curtain-Menu.jsp"/>

<jsp:include page="Header-Dashboard.jsp"/>

<div class="container-add-product mt-5 p-4 bg-light">
  <div class="breadcrumb-wrapper py-1">
    <ol class="breadcrumb mx-3">
      <li class="breadcrumb-item">
        <a href="/admin/dashboard" class="text-dec" style="color: gray">Dashboard</a>
        <a href="#" class="text-dec" style="color: gray"> / </a>
        <a href="/admin/product-management" class="text-dec" style="color: gray">Quản lý sản phẩm</a>
        <a href="#" class="text-dec" style="color: gray"> / </a>
        <a href="#" class="text-dec" style="color: #f07c29">Thêm sản phẩm</a>
      </li>
    </ol>
  </div>
  <div class="row d-flex align-items-center justify-content-center">
    <h2 class="col-9 text-center my-4">Thêm sản phẩm</h2>
    <div class="col-3 d-flex justify-content-center">
      <div class="col-3 d-flex justify-content-center">
        <button type="button" class="btn btn-success me-2 my-4" style="background: #4B908E" id="update" >
          <i class="fa-solid fa-check"></i> Xong
        </button>
        <button type="button" class="btn btn-danger my-4"
                onclick="window.location.href='/admin/product-management';">
          <i class="fa-solid fa-times"></i> Hủy
        </button>
      </div>
    </div>
  </div>
  <form>
    <div class="row d-flex flex-nowrap m-0 p-0">
      <!-- Left Column -->
      <div class="col-7 bg-white rounded-2 shadow mx-4">
        <!-- Product Details -->
        <div class="row mb-3">
          <div class="col-md-12 pt-3">
            <label for="tenSanPham" class="form-label">Tên sản phẩm</label>
            <input type="text" class="form-control" id="tenSanPham" placeholder="Nhập tên sản phẩm">
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-md-5">
            <label for="Tacgia" class="form-label">Tác giả</label>
            <input type="text" class="form-control" id="Tacgia" placeholder="">
          </div>
          <div class="col-md-5">
            <label for="NXB" class="form-label">Nhà xuất bản</label>
            <input type="text" class="form-control" id="NXB" placeholder="">
          </div>
          <div class="col-md-2">
            <label for="NamXB" class="form-label">Năm XB</label>
            <input type="text" class="form-control" id="NamXB" placeholder="">
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-md-4">
            <label class="form-label">Kích thước (cm)</label>
            <div class="input-group">
              <input type="text" class="form-control" placeholder="Chiều dài">
              <input type="text" class="form-control" placeholder="Chiều rộng">
            </div>
          </div>
          <div class="col-md-4">
            <label for="khoiLuong" class="form-label">Khối lượng</label>
            <input type="text" class="form-control" id="khoiLuong" placeholder="gram">
          </div>
          <div class="col-md-4">
            <label for="chatLieu" class="form-label">Số trang</label>
            <input type="text" class="form-control" id="chatLieu" placeholder="Trang">
          </div>
        </div>

        <div class="row mb-3">
          <div class="col">
            <label for="HinhThuc" class="form-label">Hình thức</label>
            <input type="text" class="form-control" id="HinhThuc" placeholder="Bìa cứng">
          </div>

        </div>

        <!-- Description -->
        <div class="mb-3">
          <label for="moTaSanPham" class="form-label">Mô tả sản phẩm</label>
          <textarea class="form-control" id="moTaSanPham" rows="3" placeholder="Type here"></textarea>
        </div>

        <div class="mb-3">
          <label for="anhTrungBay" class="form-label">Ảnh trưng bày (chọn 1)</label>
          <input type="file" class="form-control" id="anhTrungBay">
          <div id="anhTrungBayPreview" class="image-container"></div>
        </div>

        <div class="mb-3">
          <label for="themAnhKhac" class="form-label">Thêm ảnh khác</label>
          <input type="file" class="form-control" id="themAnhKhac" multiple>
          <div id="themAnhKhacPreview" class="image-container"></div>
        </div>
      </div>

      <!-- Right Column -->
      <div class="col-4 bg-white rounded-2 shadow mx-4">
        <div class="row mb-3">
          <div class="col-md-12 pt-3">
            <label for="giaSanPham" class="form-label">Giá</label>
            <input type="text" class="form-control" id="giaSanPham" placeholder="">
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-md-12">
            <label for="soLuongSanPham" class="form-label">Số lượng</label>
            <input type="text" class="form-control" id="soLuongSanPham" placeholder="">
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-md-12">
            <label for="trangThai" class="form-label">Trạng thái</label>
            <select class="form-select" id="trangThai">
              <option>Hoạt động</option>
              <option>Ngừng bán</option>
            </select>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-md-12">
            <label for="danhMuc" class="form-label">Danh mục</label>
            <select class="form-select" id="danhMuc">
              <option value="1">Văn học</option>
              <option value="2">Kinh tế</option>
              <option value="3">Tâm lí học</option>
              <option value="4">Sách thiếu nhi</option>
              <option value="5">Tiểu sử - hồi kí</option>
              <option value="6">Sách giáo khoa</option>
              <option value="7">Sách Hướng Nghiệp & Phát Triển
                Bản Thân
              </option>
              <option value="8">Truyện ngắn</option>
              <option value="9">Tiểu thuyết</option>
              <option value="10">Tâm lí - Giáo dục</option>
              <option value="11">Tâm lí - Kỹ năng sống</option>
              <option value="12">Sách Tiếng Việt</option>
              <option value="13">Sách Kiến Thức - Hội Họa -
                Điện Ảnh
              </option>
              <option value="14">Truyện Tranh</option>
              <option value="15">Sách Chuyên Ngành</option>
              <option value="16">Nuôi dạy con</option>
            </select>
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-md-12">
            <label for="nhaCungCap" class="form-label">Nhà cung cấp</label>
            <input type="text" class="form-control" id="nhaCungCap" placeholder="">
          </div>
        </div>

        <div class="row mb-3">
          <div class="col-md-12">
            <label for="khuyenMai" class="form-label">Khuyến mãi</label>
            <select class="form-select" id="khuyenMai" name="khuyenMai">
              <option value="1">Giảm 10%</option>
              <option value="2">Giảm 20%</option>
              <option value="3">Giảm 25%</option>
              <option value="4">Giảm 50%</option>
              <option value="5">Không giảm giá</option>
            </select>
          </div>
        </div>
      </div>
    </div>

  </form>
</div>

<!--all script files-->
<script src="../fonts/fontawesome-free-6.6.0-web/js/all.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/datatables.min.js"></script>

<script>
  $('#update').click(function (e) {
    var formData = new FormData($("#formSubmit")[0]);

    $.ajax({
      type: "PUT",
      url: "/admin/EditProduct",
      data: formData,
      processData: false,
      contentType: false,
      success: function (data) {
        alert("Thêm thành công");
        window.location.href = "/admin/product-management"; // Điều hướng về trang quản lý sản phẩm
      },
      error: function (e) {
        console.log("ERROR : ", e);
        alert("Thêm thất bại");
      }
    });
  });

</script>
</body>
</html>
