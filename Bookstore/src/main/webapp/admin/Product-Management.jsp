<%--
  Created by IntelliJ IDEA.
  User: ngocd
  Date: 1/14/2025
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %><!DOCTYPE html>
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
                            <a href="dashboard" class="text-dec" style="color: gray">Dashboard</a>
                            <a href="#" class="text-dec" style="color: gray"> / </a>
                            <a href="product-management" class="text-dec" style="color: #f07c29">Quản lí sản
                                phẩm</a>
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
                                        <button id="addProductBtn" class="btn btn-green my-4 border rounded"
                                                onclick="window.location.href='EditProductController';">
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
        let mess = $('#mess');
        var table = $('#orderTable').DataTable({
            info: false,
            scrollX: true,
            ajax: {
                url: 'ProductAjaxController?action=all',
                dataSrc: '',
            },
            columns: [
                {
                    title: 'ID',
                    data: 'bId',
                    render: function (data) {
                        return '<th scope="row">' + data + '</th>';
                    }
                },
                {
                    title: 'Tên sản phẩm',
                    data: 'title',
                    render: function (data) {
                        return '<td>' + (data ? data : '') + '</td>';
                    }
                },
                {
                    title: 'Thể loại',
                    data: 'categoryId',
                    render: function (data) {
                        return '<td>' + data + '</td>';
                    }
                },
                {
                    title: 'Tác giả',
                    data: 'author',
                    render: function (data) {
                        return '<td>' + (data ? data : '') + '</td>';
                    }
                },
                {
                    title: 'Năm xuất bản',
                    data: 'publishYear',
                    render: function (data) {
                        return '<td>' + (data ? data : '') + '</td>';
                    }
                },
                {
                    title: 'Số lượng',
                    data: 'stockQuantity',
                    render: function (data) {
                        return '<td>' + (data ? data : '') + '</td>';
                    }
                },
                {
                    title: 'Giá',
                    data: 'originalPrice',
                    render: function (data) {
                        return '<td>' + (data ? data.toLocaleString() : '') + '</td>';
                    }
                },
                {
                    title: 'Khuyến mãi',
                    data: 'promotionId',
                    render: function (data) {
                        return '<td>' + (data ? data : '') + '</td>';
                    }
                },
                {
                    title: 'Ngày cập nhật',
                    data: 'update_at',
                    render: function (data) {
                        if (!data) return '<td></td>'; // Xử lý nếu data null hoặc undefined
                        // Sử dụng Date để trích xuất ngày
                        const date = new Date(data);
                        const formattedDate = date.toLocaleDateString('vi-VN', {
                            year: 'numeric',
                            month: '2-digit',
                            day: '2-digit'
                        });
                        return '<td>' + formattedDate + '</td>';
                    }
                },
                {
                    title: 'Hoạt động',
                    render: function () {
                        return `
                        <button class="edit-button col-6 btn px-0" style="color: #236844;" title="Chỉnh sửa">
                            <i class="fa-regular fa-pen-to-square fa-lg"></i>
                        </button>
                        <button type="button" class="delete-button col-6 btn px-0" style="color: #ef5f5f;" title="Xóa">
                            <i class="fa-regular fa-trash-can fa-lg"></i>
                        </button>
                    `;
                    }
                }
            ],
        });

        // Sự kiện click vào nút "Chỉnh sửa"
        $('#orderTable').on('click', '.edit-button', function () {
            let row = table.row($(this).closest('tr')); // Lấy dòng dữ liệu từ row
            let data = row.data(); // Lấy dữ liệu của dòng đó
            let productId = data.bId; // Lấy ID sản phẩm từ dữ liệu

            // Chuyển hướng đến trang chỉnh sửa với ID sản phẩm
            window.location.href = 'EditProductController?id=' + productId; // Thay đổi URL trang chỉnh sửa
        });

        // Xử lý sự kiện click nút xóa
        $('#orderTable').on('click', '.delete-button', function () {
            let row = table.row($(this).closest('tr'))
            let data = row.data();
            let productId = data.bId;

            if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')) {
                $.ajax({
                    url: 'ProductAjaxController?id=' + productId,
                    method: 'DELETE',
                    success: function (response) {
                        row.remove().draw();
                        mess.html('<div class="alert alert-success" role="alert">Sản phẩm đã được xóa!</div>');
                    },
                    error: function (error) {
                        mess.html('<div class="alert alert-danger" role="alert">Xóa thất bại!</div>');
                    }
                });
            }
        });
    });
</script>


</body>
</html>