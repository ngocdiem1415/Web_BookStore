<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15/01/2025
  Time: 5:37 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Quản lí nhà xuất bản</title>

  <!--  all css files-->
  <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">
  <link rel="stylesheet" href="../css/dataTable/datatables.min.css">
  <link rel="stylesheet" href="../css/Style.css">
  <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">
  <link rel="stylesheet" href="css/Dashboard.css">

</head>
<body>

<!--curtain menu-->
<!--curtain menu-->
<jsp:include page="Curtain-Menu.jsp"/>

<jsp:include page="Header-Dashboard.jsp"/>
<!--header end-->

<section class="section">
  <div class="container-fluid mb-5">
    <div class="title-wrapper pt-3">
      <div class="d-flex align-items-center">
        <!-- end col -->
        <div class="breadcrumb-wrapper">
          <ol class="breadcrumb mx-4">
            <li class="breadcrumb-item">
              <a href="dashboard" class="text-dec" style="color: gray">Dashboard</a>
              <a href="#" class="text-dec" style="color: gray"> / </a>
              <a href="#" class="text-dec" style="color: #f07c29">Quản lí nhà xuất bản</a>
            </li>
          </ol>
        </div>
        <!-- end col -->
      </div>
      <!-- end row -->

      <div id="performance-stats">
        <div class="container-fluid">
          <div class="row ">
            <div class="content-main d-flex justify-content-center">
              <table class="main-listUser-table table table-bordered">
                <thead>
                <tr>
                  <th>
                    <div class=" d-flex justify-content-between">
                      <div class=" main-card-title my-3">
                        <h3>Quản lí nhà xuất bản</h3>
                      </div>
                      <a href="add-publisher">
                        <button type="button" class="btn btn-green my-4 border rounded"
                                data-bs-toggle="modal"
                                data-bs-target="#addSupplier">
                          <i class="fa-solid fa-plus"></i>
                          Thêm nhà xuất bản
                        </button>
                      </a>
                    </div>
                  </th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <th scope="row">
                    <table class="table" id="supplierTable">
                      <thead>
                      <tr>
                        <th scope="col">ID</th>
                        <th>Tên NXB</th>
                        <th>Địa chỉ</th>
                        <th>SDT</th>
                        <th>Hoạt động</th>
                      </tr>
                      </thead>
                      <tbody style="font-weight: lighter">
                      <c:forEach var="publisher" items="${publishers}">
                        <tr>
                          <th scope="row">${publisher.p_id}</th>
                          <td>${publisher.p_name}</td>
                          <td>${publisher.p_address}</td>
                          <td> ${publisher.p_phone}</td>
                          <td>
                            <a href="edit-publisher?id=${publisher.p_id}">
                              <button type="button" class="btn btn-edit m-0 p-0">
                                <i class="fa-regular fa-pen-to-square fa-lg mx-2"
                                   style="color: #236844"></i>
                              </button>
                            </a>

                            <button type="button" class="btn btn-delete m-0 p-0" data-id="${publisher.p_id}" data-bs-toggle="modal"
                                    data-bs-target="#confirmDeleteModal">
                              <i class="fa-regular fa-trash-can fa-lg mx-2 " style="color: #ef5f5f"></i>
                            </button>
                          </td>
                        </tr>
                      </c:forEach>
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
  </div>
  <!-- Modal -->
  <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel"
       aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="confirmDeleteModalLabel">Xóa nhà xuất bản </h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          Bạn có chắc chắn muốn xóa không? Thao tác này không thể hoàn tác.
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
          <button type="button" class="btn btn-danger" id="confirmDeleteBtn" data-bs-dismiss="modal">Xóa</button>
        </div>
      </div>
    </div>
  </div>
</section>


<!--all script files-->
<script src="../fonts/fontawesome-free-6.6.0-web/js/all.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/datatables.min.js"></script>

<!--script-->
<script>
  var myModalEl = document.getElementById('addSupplier');
  $(document).ready(function () {
    var table = $('#supplierTable').DataTable({
      language: {
        processing: "đang tải",
        search: "Tìm kiếm",
        lengthMenu: "Số dòng hiển thị _MENU_ ",
        info: "Bài viết từ _START_ đến _END_ trong _TOTAL_ NXB",
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

    myModalEl.addEventListener('hidden.bs.modal', function (event) {
      $('#labelSupp').html("Thêm nhà xuất bản")
      $('#idSupp').val("")
      $('#tenSupp').val("");
      $('#phoneSupp').val("");
      $('#addressSupp').val("");

    });

    $('#supplierTable tbody').on('click', '.btn-edit', function () {
      var data = table.row($(this).parents('tr')).data();

      // Đặt tiêu đề modal và điền dữ liệu vào các trường trong modal
      $('#labelSupp').html("Sửa nhà xuất bản");
      $('#idSupp').val(data[0]);
      $('#tenSupp').val(data[1]);
      $('#phoneSupp').val(data[3]);
      $('#addressSupp').val(data[2]);

      // Mở modal cho phép chỉnh sửa
      $('#addSupplier').modal('show');
    });
  });
</script>

<script>
  let selectedPublisher = null;

  // Khi nhấn nút xóa danh mục
  $(document).on('click', '.btn-delete', function () {
    selectedPublisher = $(this).data('id');
  });

  // Khi xác nhận xóa trong modal
  $('#confirmDeleteBtn').on('click', function () {
    if (selectedPublisher) {
      $.ajax({
        url: '${pageContext.request.contextPath}/admin/delete-publisher',
        method: 'POST',
        data: { publisherId: selectedPublisher },
        success: function () {
          // Ẩn modal sau khi xóa thành công
          $('#confirmDeleteModal').modal('hide');

          // Xóa dòng tương ứng khỏi bảng
          const row = $('[data-id="' + selectedPublisher + '"]').closest('tr');
          $('#orderTable').DataTable().row(row).remove().draw();

          // Hiển thị toast thông báo thành công
          $('#toastMessage').text('Xóa nhà xuất bản thành công!');
          $('#deleteToast').removeClass('bg-danger').addClass('bg-success');

          const toast = new bootstrap.Toast(document.getElementById('deleteToast'));
          toast.show();

          selectedPublisher = null;
        },
        error: function (xhr) {
          const msg = xhr.responseText || 'Xóa thất bại. Vui lòng thử lại!';
          $('#toastMessage').text(msg);
          $('#deleteToast').removeClass('bg-success').addClass('bg-danger');

          const toast = new bootstrap.Toast(document.getElementById('deleteToast'));
          toast.show();
        }
      });
    }
  });
</script>
</body>
</html>
