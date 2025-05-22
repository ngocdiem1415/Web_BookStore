
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20/12/2024
  Time: 9:30 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Quản lí danh mục</title>

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
              <a href="category" class="text-dec" style="color: #f07c29">Quản lí danh mục</a>
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
                      <h3>Quản lí danh mục</h3>
                    </div>
                    <a href="add-category">
                      <button type="button" class="btn btn-green my-4 border rounded"
                              data-bs-toggle="modal"
                              data-bs-target="#addCategory">
                        <i class="fa-solid fa-plus"></i>
                        Thêm danh mục
                      </button>
                    </a>

                    <!-- Modal -->
                    <div class="modal fade" id="addCategory" tabindex="-1"
                         aria-labelledby="staticBackdropLabel"
                         aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="catLabel">Thêm danh mục</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                            <div class="mb-3">
                              <label for="idCat" class="labels">ID Danh mục</label>
                              <fieldset disabled>
                                <input id="idCat" type="text"
                                       class="form-control disabled" placeholder="ID"
                                       value="">
                              </fieldset>
                            </div>
                            <div class="mb-3">
                              <label for="nameCat" class="labels">Tên danh mục</label>
                              <input id="nameCat" type="text" class="form-control"
                                     placeholder="Danh Mục" value="">
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-green border">Lưu</button>
                          </div>
                        </div>
                      </div>
                    </div>
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
                      <th>Tên danh mục</th>
                      <th>Ngày cập nhật</th>
                      <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody style="font-weight: lighter">
                    <c:forEach var="category" items="${categories}">
                      <tr>
                        <th scope="row">${category.categoryId}</th>
                        <td>${category.category_name}</td>
                        <td>${category.update_at}
                        </td>
                        <td>
                          <a href="edit-category?id=${category.categoryId}">
                            <button type="button" class="btn btn-edit m-0 p-0">
                              <i class="fa-regular fa-pen-to-square fa-lg mx-2"
                                 style="color: #236844"></i>
                            </button>
                          </a>
                            <button type="button"
                                    class="btn btn-delete m-0 p-0"
                                    data-id="${category.categoryId}"
                                    data-bs-toggle="modal"
                                    data-bs-target="#confirmDeleteModal">
                                <i class="fa-regular fa-trash-can fa-lg mx-2" style="color: #ef5f5f"></i>
                            </button>

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
  <!-- Modal -->
    <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmDeleteModalLabel">Xóa danh mục</h5>
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

<!-- Toast -->
<div class="position-fixed bottom-0 end-0 p-3" style="z-index: 9999">
  <div id="deleteToast" class="toast align-items-center text-white bg-success border-0" role="alert"
       aria-live="assertive" aria-atomic="true">
    <div class="d-flex">
      <div class="toast-body" id="toastMessage">
        Xóa thành công!
      </div>
      <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"
              aria-label="Close"></button>
    </div>
  </div>
</div>


<!--all script files-->
<script src="../fonts/fontawesome-free-6.6.0-web/js/all.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/datatables.min.js"></script>
<!--script-->
<script>
  var myModalEl = document.getElementById('addCategory');
  $(document).ready(function () {
    // Khởi tạo DataTable cho bảng với id 'orderTable'
    var table = $('#orderTable').DataTable({
      language: {
        processing: "đang tải",
        search: "Tìm kiếm",
        lengthMenu: "Số dòng hiển thị _MENU_ ",
        info: "Bài viết từ _START_ đến _END_ trong _TOTAL_ danh mục",
        infoEmpty: "",
        loadingRecords: "",
        infoFiltered: "",
        zeroRecords: "Không tìm thấy",
        emptyTable: "Không có dữ liệu",
        paginate: {
          next: "2",
        },
      },
      columnDefs: [
        {"className": "text-center", "targets": "_all"},  // Căn giữa văn bản ở cột thứ 5
      ],
    });


    $('#orderTable tbody').on('click', '.btn-view', function () {
      var data = table.row($(this).parents('tr')).data();

      // Đặt tiêu đề modal và điền dữ liệu vào các trường trong modal
      $('#catLabel').html("Xem danh mục");
      $('#idCat').val(data[0]);
      $('#nameCat').val(data[1]).prop('disabled', true);
      $('#despCat').val(data[5]).prop('disabled', true);
      $('#idGenre').val('01').prop('disabled', true);
      $('#nameGenre').val('truyện tranh').prop('disabled', true);

      // Mở modal chỉ để xem
      $('#addCategory').modal('show');
    });
  });
</script>

<script>
    $(document).ready(function () {
        let deletedCategoryId = null;

        // Khi nhấn nút xóa, lưu lại categoryId
        $(document).on('click', '.btn-delete', function () {
            deletedCategoryId = $(this).data('id');
        });

        // Khi nhấn xác nhận xóa trong modal
        $('#confirmDeleteBtn').on('click', function () {
            if (deletedCategoryId) {
                $.ajax({
                    url: '${pageContext.request.contextPath}/admin/delete-category', // Đường dẫn đúng Servlet
                    method: 'POST',
                    data: {category_id: deletedCategoryId},
                    success: function () {
                        // Đóng modal (data-bs-dismiss="modal" đã có)

                        // Xóa dòng khỏi DataTable
                        let table = $('#orderTable').DataTable();
                        let row = $('button.btn-delete[data-id="' + deletedCategoryId + '"]').closest('tr');
                        table.row(row).remove().draw();

                        // Hiện toast thông báo thành công
                        $('#toastMessage').text('Xóa danh mục thành công!');
                        $('#deleteToast').removeClass('bg-danger').addClass('bg-success');
                        let toast = new bootstrap.Toast(document.getElementById('deleteToast'));
                        toast.show();

                        deletedCategoryId = null;
                    },
                  error: function (xhr) {
                    let msg = 'Xóa thất bại. Danh mục đang được sử dụng và không thể xóa!';
                    if (xhr.status === 500 && xhr.responseText.includes('SQLIntegrityConstraintViolationException')) {
                      msg = 'Không thể xóa danh mục vì đang được sử dụng ở các bản ghi khác!';
                    }

                    $('#toastMessage').text(msg);
                    $('#deleteToast').removeClass('bg-success').addClass('bg-danger');
                    let toast = new bootstrap.Toast(document.getElementById('deleteToast'));
                    toast.show();
                  }

                });
            }
        });
    });
</script>

</body>
</html>
