<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15/01/2025
  Time: 5:23 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lí đơn hàng</title>

    <!--  all css files-->
    <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">
    <link rel="stylesheet" href="../css/dataTable/datatables.min.css">
    <link rel="stylesheet" href="../css/Style.css">
    <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/Dashboard.css">

</head>
<body>
<jsp:include page="Curtain-Menu.jsp"/>

<jsp:include page="Header-Dashboard.jsp"/>

<!--main content-->
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
                            <a href="order-management" class="text-dec" style="color: #f07c29">Quản lí đơn hàng</a>
                        </li>
                    </ol>
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <div class="container-fluid">
            <div class="card-stats">
                <div class="card-title mt-5 mb-4">
                    <h3>Tất cả danh sách đặt hàng</h3>
                </div>
            </div>
            <div class="card-body mx-2">
                <table class="table" id="orderTable">
                    <thead>
                    <tr>
                        <th scope="col">Order ID</th>
                        <th>Ngày đặt</th>
                        <th>Khách hàng</th>
                        <th>SDT</th>
                        <th>Tổng tiền</th>
                        <th>Trạng thái thanh toán</th>
                        <th>Trạng thái đơn hàng</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody style="font-weight: lighter">
                    <c:forEach var="order" items="${orders}">
                        <tr>
                            <th scope="row">${order.invoiceId}</th>
                            <td>${order.orderDate}</td>
                            <td>${order.recipientName}</td>
                            <td>${order.recipientPhone}</td>
                            <td>${order.getPayment().getAmount()}đ</td>
                            <td>${order.getPayment().getPaymentStatus()}</td>
                            <td>${order.status}</td>
                            <td>
                                <button class="show-button col-6 btn px-0" style="color: #236844;"
                                        onclick="window.location.href='show-order?id=${order.invoiceId}';"
                                        title="Xem">
                                    <i class="fa-regular fa-eye fa-lg mx-2" style="color: #f07c29;"></i>
                                </button>
                                <button class="edit-button col-6 btn px-0" style="color: #236844;"
                                        onclick="window.location.href='edit-order?id=${order.invoiceId}';"
                                        title="Chỉnh sửa">
                                    <i class="fa-regular fa-pen-to-square fa-lg mx-2"
                                       style="color: #236844"></i>
                                </button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
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
                info: "Bài viết từ _START_ đến _END_ trong _TOTAL_ đơn hàng",
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

</body>
</html>
