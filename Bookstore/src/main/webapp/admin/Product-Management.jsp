<%--
  Created by IntelliJ IDEA.
  User: ngocd
  Date: 1/14/2025
  Time: 4:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
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
                                        <a href="EditProductController"
                                           class="btn btn-green my-4 border rounded addSlider">
                                            <i class="fa-solid fa-plus"></i>
                                            Thêm sản phẩm
                                        </a>
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
                                        <c:forEach var="p" items="${products}">
                                            <tr>
                                                <th scope="row">${p.bId}</th>
                                                <td>${p.title}</td>
                                                <td>${p.categoryId}</td>
                                                <td>${p.author}</td>
                                                <td>${p.publishYear}</td>
                                                <td>${p.stockQuantity}</td>
                                                <td><fmt:formatNumber value="${p.originalPrice}" type="number"/></td>
                                                <td>${p.promotionId}</td>
                                                <td>
                                                        ${p.update_at}
                                                </td>
                                                <td>
                                                    <button class="edit-button col-6 btn px-0" style="color: #236844;"
                                                            onclick="window.location.href='EditProductController?id=${p.bId}';"
                                                            title="Chỉnh sửa">
                                                        <i class="fa-regular fa-pen-to-square fa-lg"></i>
                                                    </button>
                                                    <button type="button" class="delete-button col-6 btn px-0"
                                                            style="color: #ef5f5f;"
                                                            onclick="deleteProduct(${p.bId},this)"
                                                            title="Xóa">
                                                        <i class="fa-regular fa-trash-can fa-lg"></i>
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
                paginate: {
                    next: "2",
                },
            },
            columnDefs: [
                {"className": "text-center", "targets": "_all"},  // Căn giữa văn bản ở cột thứ 5
            ],
        });
    });

    // Xử lý sự kiện click nút xóa
    function deleteProduct(id,btn) {
        if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')) {
            $.ajax({
                url: 'product?id=' + id,
                method: 'DELETE',
                success: function (response) {
                    let table = $('#orderTable').DataTable();
                    let row = table.row($(btn).parents('tr'));
                    row.remove().draw();
                    $('#mess').html('<div class="alert alert-success" role="alert">Sản phẩm đã được xóa!</div>');
                },
                error: function (error) {
                    $('#mess').html('<div class="alert alert-danger" role="alert">Xóa thất bại!</div>');
                }
            });
        }
    };
</script>


</body>
</html>
