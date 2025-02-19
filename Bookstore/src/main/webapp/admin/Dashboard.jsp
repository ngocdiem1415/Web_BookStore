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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>

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

<!-- Dashboard Stats -->
<section class="section">
    <div class="container-fluid mb-5">
        <div class="title-wrapper pt-3">
            <div class="d-flex align-items-center">
                <!-- end col -->
                <div class="breadcrumb-wrapper">
                    <ol class="breadcrumb mx-4">
                        <li class="breadcrumb-item">
                            <a href="#" class="text-dec" style="color: gray">Dashboard</a>
                        </li>
                    </ol>
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <div id="performance-stats">
            <div class="container-fluid ">
                <div class="row mt-3 mb-3">
<%--                    <div class="col-md-3">--%>
<%--                        <div class="card border-left-primary shadow h-100 py-2 rounded-3 ">--%>
<%--                            <div class="card-body">--%>
<%--                                <h6 class="text-primary">TỔNG SỐ SẢN PHẨM</h6>--%>
<%--                                <h3><i class="fa-solid fa-arrow-up fa-rotate-180" style="color: #d70f0f;"></i> ${totalBook}--%>
<%--                                </h3>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
                    <div class="col-md-3">
                        <div class="card border-left-success shadow h-100 py-2 rounded-3 ">
                            <div class="card-body">
                                <h6 class="text-success">ĐƠN HÀNG TRONG NGÀY</h6>
                                <h3><i class="fa-solid fa-arrow-up fa-rotate-180" style="color: #d70f0f;"></i> ${totalNewOrder}
                                </h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card border-left-info shadow h-100 py-2 rounded-3 ">
                            <div class="card-body">
                                <h6 class="text-info">KHÁCH HÀNG MỚI TRONG NGÀY</h6>
                                <h3><i class="fa-solid fa-arrow-up" style="color: #63E6BE;"></i> ${totalU}</h3>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card border-left-warning shadow h-100 py-2 rounded-3 ">
                            <div class="card-body">
                                <h6 class="text-warning">DOANH THU TRONG NGÀY</h6>
                                <h3><i class="fa-solid fa-arrow-up" style="color: #63E6BE;"></i>${totalPayment}</h3>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="revenue-card" class="mt-5">
                    <div class="revenue-card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <h4 class="revenue-card-title mx-3 my-3">Thống kê đơn hàng</h4>
                            <div class="mx-3">
                                <button type="button" class="btn btn-sm ">ALL</button>
                                <button type="button" class="btn btn-sm ">1M</button>
                                <button type="button" class="btn btn-sm ">6M</button>
                                <button type="button" class="btn btn-sm">1Y</button>
                            </div>
                        </div> <!-- end card-title-->

<%--                        <div dir="ltr">--%>
<%--                            <div id="dash-revenue-chart" class="d-flex justify-content-center mt-3">--%>
<%--                                <div class="mb-3">--%>
<%--                                    <div class="toolbar apex-toolbar">--%>
<%--                                        <button id="one_month" class="btn btn-sm btn-light">1M</button>--%>
<%--                                        <button id="six_months" class="btn btn-sm btn-light">6M</button>--%>
<%--                                        <button id="one_year" class="btn btn-sm btn-light active">1Y</button>--%>
<%--                                        <button id="ytd" class="btn btn-sm btn-light">YTD</button>--%>
<%--                                        <button id="all" class="btn btn-sm btn-light">ALL</button>--%>
<%--                                    </div>--%>
<%--                                    <div dir="ltr">--%>
<%--                                        <div id="area-chart-datetime" class="apex-charts"></div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
                    </div> <!-- end card body -->
                </div> <!-- end card -->
                <div class="container-fluid">
                    <div class="card-stats">
                        <div class="card-title mt-5">
                            <h3>Đơn hàng mới</h3>
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
                                        <a href="Edit-Order.html" class="text-dec">
                                            <i class="fa-regular fa-pen-to-square fa-lg"
                                               style="color: #236844"></i>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <!--    <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel"-->
    <!--         aria-hidden="true">-->
    <!--        <div class="modal-dialog">-->
    <!--            <div class="modal-content">-->
    <!--                <div class="modal-header">-->
    <!--                    <h5 class="modal-title" id="confirmDeleteModalLabel">Xóa đơn hàng</h5>-->
    <!--                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>-->
    <!--                </div>-->
    <!--                <div class="modal-body">-->
    <!--                    Bạn có chắc chắn muốn xóa không? Thao tác này không thể hoàn tác.-->
    <!--                </div>-->
    <!--                <div class="modal-footer">-->
    <!--                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>-->
    <!--                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Xóa</button>-->
    <!--                </div>-->
    <!--            </div>-->
    <!--        </div>-->
    <!--    </div>-->

</section>


<!--all script files-->
<script src="../fonts/fontawesome-free-6.6.0-web/js/all.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/datatables.min.js"></script>

<!--script-->
<script>
    $(document).ready(function () {
        $('#newOrder').DataTable({
            paging: false,
            searching: false,
            info: false,
            columnDefs: [
                {"className": "text-center", "targets": "_all"}
            ],
        });
    });
</script>
</body>
</html>
