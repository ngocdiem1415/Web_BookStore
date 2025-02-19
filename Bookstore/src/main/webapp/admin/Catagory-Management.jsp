
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
                          <button type="button" class="btn btn-view m-0 p-0">
                            <i class="fa-regular fa-eye fa-lg mx-2" style="color: #f07c29;"></i>
                          </button>
                          <a href="edit-category?id=${category.categoryId}">
                            <button type="button" class="btn btn-edit m-0 p-0">
                              <i class="fa-regular fa-pen-to-square fa-lg mx-2"
                                 style="color: #236844"></i>
                            </button>
                          </a>
                          <button type="button" class="btn  m-0 p-0" data-bs-toggle="modal"
                                  data-bs-target="#confirmDeleteModal">
                            <i class="fa-regular fa-trash-can fa-lg mx-2 "
                               style="color: #ef5f5f"></i>
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
          <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Xóa</button>
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

</body>
</html>
