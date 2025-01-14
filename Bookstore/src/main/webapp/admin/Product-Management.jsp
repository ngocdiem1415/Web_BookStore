<%--
  Created by IntelliJ IDEA.
  User: ngocd
  Date: 1/14/2025
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Quản lí sản phẩm</title>
  <!--  all css files-->
  <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">
  <link rel="stylesheet" href="../css/dataTable/datatables.min.css">
  <link rel="stylesheet" href="../css/Style.css">
  <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">
  <link rel="stylesheet" href="css/Dashboard.css">
  <link rel="stylesheet" href="css/Product-Management.css">

</head>
<body>
<jsp:include page="Curtain-Menu.jsp"/>

<jsp:include page="Header-Dashboard.jsp"/>

<section class="section">
  <div class="container-fluid mb-5">
    <div class="title-wrapper pt-3">
      <div class="d-flex align-items-center">
        <!-- end col -->
        <div class="breadcrumb-wrapper">
          <ol class="breadcrumb mx-4">
            <li class="breadcrumb-item">
              <a href="/admin/dashboard" class="text-dec" style="color: gray">Dashboard</a>
              <a href="#" class="text-dec" style="color: gray"> / </a>
              <a href="/admin/product-management" class="text-dec" style="color: #f07c29">Quản lí sản phẩm</a>
            </li>
          </ol>
        </div>
        <!-- end col -->
      </div>
      <!-- end row -->
    </div>
    <div id="performance-stats">
      <div class="container-fluid">
        <div class="row ">
          <div class="content-main d-flex justify-content-center">
            <table class="main-listUser-table table table-bordered">
              <thead>
              <tr>
                <th>
                  <div class="d-flex justify-content-between">
                    <div class=" main-card-title my-3">
                      <h3>Quản lí sản phẩm</h3>
                    </div>
                    <button id="addProductBtn" class="btn btn-green my-4 border rounded">
                      <i class="fa-solid fa-plus"></i>
                      Thêm sản phẩm
                    </button>
                  </div>
                </th>
              </tr>
              </thead>
              <tbody>
              <tr>
                <th scope="row">
                  <table class="table" id="orderTable">
                    <thead>
                    <tr>
                      <th scope="col">ID</th>
                      <th>Tên sản phẩm</th>
                      <th>Thể loại</th>
                      <th>Tác giả</th>
                      <th>Năm xuất bản</th>
                      <th>Số lượng</th>
                      <th>Giá</th>
                      <th>Khuyến mãi</th>
                      <th>Ngày cập nhật</th>
                      <th>Hoạt động</th>
                    </tr>
                    </thead>
                    <tbody style="font-weight: lighter">
                    <tr>
                      <th scope="row">1</th>
                      <td>Mèo méo meo - Bí mật giao tiếp từ cái vẫy đuôi đến tiếng grừ grừ</td>
                      <td>Kĩ năng sống</td>
                      <td>Lili Chin</td>
                      <td>2024</td>
                      <td>1000</td>
                      <td>129.000 đ</td>
                      <td>1</td>
                      <td>15/11/2024</td>
                      <td>
                        <div class="row px-3">
                          <!-- Nút Chỉnh Sửa -->
                          <button class="edit-button col-6 btn px-0" style="color: #236844;"
                                  title="Chỉnh sửa">
                            <i class="fa-regular fa-pen-to-square fa-lg"></i>
                          </button>

                          <!-- Nút Xóa -->
                          <button type="button" class="delete-button col-6 btn px-0"
                                  style="color: #ef5f5f;" title="Xóa">
                            <i class="fa-regular fa-trash-can fa-lg"></i>
                          </button>
                        </div>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                </th>
              </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>

  <!--confirm-->
  <div id="confirm-modal" class="modal hidden">
    <div class="modal-content">
      <p id="modal-message">Bạn có chắc chắn muốn xóa sản phẩm này?</p>
      <div class="modal-buttons">
        <button id="confirm-delete" class="btn btn-danger">Xóa</button>
        <button id="cancel-delete" class="btn btn-secondary">Hủy</button>
      </div>
    </div>
  </div>

  <!-- Thông báo -->
  <div id="notification"
       class="alert alert-success text-center position-fixed top-50 start-50 translate-middle hidden"
       role="alert">
    Đây là thông báo mặc định.
  </div>

</section>

<!--all script files-->
<script src="../fonts/fontawesome-free-6.6.0-web/js/all.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/datatables.min.js"></script>

<!--script-->

<script>
  $(document).ready(function () {
    // Khởi tạo DataTable cho bảng với id 'orderTable'
    var table = $('#orderTable').DataTable({
      language: {
        processing: "đang tải",
        search: "Tìm kiếm",
        lengthMenu: "Số dòng hiển thị _MENU_ ",
        info: "Bài viết từ _START_ đến _END_ trong _TOTAL_ sản phẩm",
        infoEmpty: "",
        loadingRecords: "",
        infoFiltered: "",
        zeroRecords: "Không tìm thấy",
        emptyTable: "Không có dữ liệu",

      },
      columnDefs: [
        {"className": "text-center", "targets": "_all"},  // Căn giữa văn bản ở cột thứ 5
      ],
    });
  });
</script>

<script>
  // Thêm sự kiện click cho nút
  document.getElementById('addProductBtn').addEventListener('click', function () {
    window.location.href = 'Add-Product.html'; // Chuyển hướng đến Add-Product.html
  });
</script>

<script>
  document.addEventListener('DOMContentLoaded', function () {

    // Hiển thị thông báo
    function showNotification(message, type) {
      const notification = document.getElementById('notification');
      notification.textContent = message;
      notification.className = `alert alert-${type} text-center position-fixed top-50 start-50 translate-middle show`;

      setTimeout(() => {
        notification.classList.remove('show');
        notification.classList.add('hidden');
      }, 3000);
    }

    // Lấy tất cả các nút xóa
    const deleteButtons = document.querySelectorAll('.delete-button');
    deleteButtons.forEach(function (button) {
      button.addEventListener('click', function () {
        // Hiển thị modal xác nhận
        const modal = document.getElementById('confirm-modal');
        modal.classList.remove('hidden');
        modal.style.display = 'flex';

        // Xử lý khi người dùng xác nhận xóa
        const confirmButton = document.getElementById('confirm-delete');
        const cancelButton = document.getElementById('cancel-delete');

        // xử lý sự kiện xóa
        const onConfirm = () => {
          const row = this.closest('tr');
          if (row) {
            row.remove();
          }
          showNotification('Đã xóa sản phẩm khỏi giỏ hàng!', 'success');
          closeModal();
        };

        // Xử lý sự kiện Hủy
        const onCancel = () => {
          closeModal();
        };

        // Thêm sự kiện cho nút Xóa và Hủy
        confirmButton.addEventListener('click', onConfirm, {once: true});
        cancelButton.addEventListener('click', onCancel, {once: true});

        // Hàm đóng modal
        function closeModal() {
          modal.classList.add('hidden');
          modal.style.display = 'none';
        }
      });
    });
  });

  document.addEventListener('DOMContentLoaded', function () {
    const editButtons = document.querySelectorAll('.edit-button');
    editButtons.forEach(function (button) {
      button.addEventListener('click', function () {
        window.location.href = 'Edit-product.html';
      });
    });
  });
</script>

</body>
</html>