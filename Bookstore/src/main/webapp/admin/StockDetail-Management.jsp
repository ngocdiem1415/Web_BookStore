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
    <title>Quản lí kho</title>

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
                            <a href="stock-management" class="text-dec" style="color: #f07c29">Quản lí kho</a>
                            <a href="#" class="text-dec" style="color: gray"> / </a>
                            <a href="stock-detail" class="text-dec" style="color: #f07c29">Chi tiết nhập xuất kho</a>
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
                                            <h3>Quản lí nhập xuất kho</h3>
                                        </div>
                                        <button type="button" class="btn btn-green my-4 border rounded"
                                                id="btnOpenStockInModal">
                                            <i class="fa-solid fa-plus"></i>
                                            Nhập kho
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
                                            <th scope="col">Mã kho</th>
                                            <th>Tên sách</th>
                                            <th>Số lượng</th>
                                            <th>Ngày nhập/xuất</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </thead>
                                        <tbody style="font-weight: lighter">
                                        <c:forEach var="stock" items="${stocks}">
                                            <tr>
                                                <th scope="row">${stock.stockId}</th>
                                                <td>${stock.getBook().getTitle()}</td>
                                                <td>${stock.quantity}</td>
                                                <td>${stock.stock_date}</td>
                                                <td>
                                                    <button type="button"
                                                            class="btn btn-edit m-0 p-0 openEditModal"
                                                            data-id="${stock.stockId}"
                                                            data-bookid="${stock.bId}"
                                                            data-bookTitle="${stock.getBook().getTitle()}"
                                                            data-quantity="${stock.quantity}"
                                                            data-date="${stock.stock_date}">
                                                        <i class="fa-regular fa-pen-to-square fa-lg mx-2" style="color: #236844"></i>
                                                    </button>
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
    <!-- Modal stock in -->
    <div class="modal fade" id="stockIn" tabindex="-1"
         aria-labelledby="staticBackdropLabel"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="catLabel">Nhập kho</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label for="bookSelect" class="labels">Tên sách</label>
                        <select id="bookSelect" name="bookId" class="form-select">
                            <c:forEach var="book" items="${stocks}">
                                <option value="${book.bId}">${book.getBook().getTitle()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="quantity" class="labels">Số lượng</label>
                        <input id="quantity" name="quantity" type="number" class="form-control" min="1" value="1">
                    </div>
                    <div class="mb-3">
                        <label for="stockDate" class="labels">Ngày nhập</label>
                        <input id="stockDate" name="stockDate" type="datetime-local" class="form-control"
                               value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(new java.util.Date()) %>">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-green border" onclick="stockIn()">Lưu</button>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal edit stock -->
    <div class="modal fade" id="editStockModal" tabindex="-1" aria-labelledby="editStockLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="editStockLabel">Chỉnh sửa nhập kho</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                            aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Hidden input để lưu stockId -->
                    <input type="hidden" id="editStockId" name="stockId">

                    <div class="mb-3" disabled="">
                        <label for="editBookSelect" class="labels">Tên sách</label>
                        <input type="text" id="editBookSelect" name="bookTitle" class="form-control" readonly>
                        <input type="hidden" id="editBookId" name="bookId">
                    </div>
                    <div class="mb-3">
                        <label for="editQuantity" class="labels">Số lượng</label>
                        <input id="editQuantity" name="quantity" type="number" class="form-control" min="1" value="1">
                    </div>
                    <div class="mb-3">
                        <label for="editStockDate" class="labels">Ngày nhập</label>
                        <input id="editStockDate" name="stockDate" type="datetime-local" class="form-control"
                               value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm").format(new java.util.Date()) %>">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" onclick="updateStock()">Lưu</button>
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
                    <h5 class="modal-title" id="confirmDeleteModalLabel">Xóa sản phẩm</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn xóa sản phẩm khỏi kho không? Thao tác này không thể hoàn tác.
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
    var myModalEl = document.getElementById('addStock');
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

        });
    });

    $('#btnOpenStockInModal').click(function () {
        $('#stockIn').modal('show');
    });

    $(document).on('click', '.openEditModal', function () {
        var stockId = $(this).data('id');
        var bookId = $(this).data('bookid');
        var bookTitle = $(this).data('booktitle');
        var quantity = $(this).data('quantity');
        var stockDate = new Date($(this).data('date'));

        $('#editStockId').val(stockId);
        $('#editBookId').val(bookId);
        $('#editBookSelect').val(bookTitle);
        $('#editQuantity').val(quantity);

        var formattedDate = stockDate.toISOString().slice(0, 16);
        $('#editStockDate').val(formattedDate);

        // Hiển thị modal
        $('#editStockModal').modal('show');
    });

    function stockIn() {
        $.ajax({
            url: 'stock',
            type: 'POST',
            data: {
                bookId: $('#bookSelect').val(),
                quantity: $('#quantity').val(),
                stockDate: $('#stockDate').val()
            },
            success: function (response) {
                console.log(response);
                $('#stockIn').modal('hide');
                $('#mess').html('<div class="alert alert-success" role="alert">Sản phẩm đã được thêm!</div>');
                location.reload();
            },
            error: function (error) {
                $('#mess').html('<div class="alert alert-danger" role="alert">Thêm thất bại!</div>');
                console.error(error);
            }
        });
    }

    function updateStock() {
        $.ajax({
            url: 'stock',
            type: 'PUT',
            contentType: 'application/json',
            data: JSON.stringify({
                stockId: $('#editStockId').val(),
                bookId: $('#editBookId').val(),
                quantity: $('#editQuantity').val(),
                stockDate: $('#editStockDate').val()
            }),
            success: function (response) {
                console.log(response);
                $('#stockIn').modal('hide');
                $('#mess').html('<div class="alert alert-success" role="alert">Sản phẩm đã được chỉnh sửa!</div>');
                location.reload();
            },
            error: function (error) {
                $('#mess').html('<div class="alert alert-danger" role="alert">Chỉnh sửa thất bại!</div>');
                console.error(error);
            }
        });
    }
</script>

</body>
</html>
