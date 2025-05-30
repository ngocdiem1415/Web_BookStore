<%--
Created by IntelliJ IDEA.
User: Admin
Date: 15/01/2025
Time: 5:35 CH
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
    <title>Đơn hàng</title>

    <!--  all css files-->
    <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">
    <link rel="stylesheet" href="../css/dataTable/datatables.min.css">
    <link rel="stylesheet" href="../css/Style.css">
    <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/Dashboard.css">
    <link rel="stylesheet" href="css/Edit-Admin.css">

</head>
<body>
<jsp:include page="Curtain-Menu.jsp"/>

<jsp:include page="Header-Dashboard.jsp"/>

<!--header end-->
<!--main content-->
<section class="section">
    <div class="container-fluid mb-5">
        <div class="title-wrapper pt-3">
            <div class="d-flex align-items-center">
                <div class="breadcrumb-wrapper">
                    <ol class="breadcrumb mx-4">
                        <li class="breadcrumb-item">
                            <a href="dashboard" class="text-dec" style="color: gray">Dashboard</a>
                            <a href="#" class="text-dec" style="color: gray"> / </a>
                            <a href="log-management" class="text-dec" style="color: gray">Quản lí log</a>
                            <a href="#" class="text-dec" style="color: gray"> / </a>
                            <a href="#" class="text-dec" style="color: #f07c29">Thông tin log</a>
                        </li>
                    </ol>
                </div>
            </div>
        </div>

        <div class="edit-admin-container">
            <div class="edit-admin-container-content">
                <div style="display: contents">
                    <div class="edit-admin-container-content-inner">
                        <div class="edit-admin-container-content-inner-header">
                            <h2 class="edit-user-container-content-inner-header-title">Chi Tiết Log</h2>
                        </div>

                        <div class="edit-admin-container-content-inner-body">
                            <form>
                                <div class="form-edit-admin-group">
                                    <label for="logId">Log ID</label>
                                    <input type="text" class="form-control" id="logId" value="${log.logId}" readonly>
                                </div>

                                <div class="form-edit-admin-group">
                                    <label for="userId">User ID</label>
                                    <input type="text" class="form-control" id="userId" value="${log.userId}" readonly>
                                </div>

                                <div class="form-edit-admin-group">
                                    <label for="sessionId">Session ID</label>
                                    <input type="text" class="form-control" id="sessionId" value="${log.sessionId}"
                                           readonly>
                                </div>

                                <div class="form-edit-admin-group">
                                    <label for="ipAddress">IP Address</label>
                                    <input type="text" class="form-control" id="ipAddress" value="${log.ipAddress}"
                                           readonly>
                                </div>

                                <div class="form-edit-admin-group">
                                    <label for="level">Mức độ Log</label>
                                    <input type="text" class="form-control" id="level" value="${log.level}" readonly>
                                </div>

                                <div class="form-edit-admin-group">
                                    <label for="resource">Tài nguyên</label>
                                    <input type="text" class="form-control" id="resource" value="${log.resource}"
                                           readonly>
                                </div>

                                <div class="form-edit-admin-group">
                                    <label for="action">Hành động</label>
                                    <input type="text" class="form-control" id="action" value="${log.action}" readonly>
                                </div>

                                <div class="form-edit-admin-group">
                                    <label for="created_at">Thời gian</label>
                                    <input type="text" class="form-control" id="created_at" value="${log.created_at}"
                                           readonly>
                                </div>

                                <div class="form-edit-admin-group">
                                    <label for="locked">Đã khóa</label>
                                    <input type="text" class="form-control" id="locked"
                                           value="${log.locked ? 'Có' : 'Không'}" readonly>
                                </div>

                                <div class="form-edit-admin-group align-items-center row ">
                                    <label for="dataBefore" class="col-2 col-form-label" style="white-space: nowrap;">Dữ liệu Trước</label>
                                    <div class="col-8">
                                        <textarea class="form-control" id="dataBefore" rows="4"
                                                  readonly>${log.dataBefore}</textarea>
                                    </div>
                                </div>

                                <div class="form-edit-admin-group align-items-center row">
                                    <label for="dataAfter" class="col-2 col-form-label" style="white-space: nowrap;">Dữ liệu Sau</label>
                                    <div class="col-8">
                                    <textarea class="form-control" id="dataAfter" rows="4"
                                              readonly>${log.dataAfter}</textarea>
                                    </div>
                                </div>

                            </form>
                        </div>
                        <div class="log-detail-actions d-flex justify-content-center">
                            <button type="button" class="btn btn-danger my-4"
                                    onclick="window.location.href='log-management';">
                                <i class="fa-solid fa-times"></i> Quay lại
                            </button>
                        </div>
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

<script>
    $('#updateOrder').on('click', function (e) {
        e.preventDefault();

        var invoiceId = ${order.invoiceId};
        var paymentMethod = $('#payment-method').val();
        var paymentStatus = $('#payment-status').val();
        var invoiceStatus = $('#invoice-status').val();
        ajax(invoiceId, paymentMethod, paymentStatus, invoiceStatus);
    });

    function ajax(id, paymentMethod, paymentStatus, invoiceStatus) {
        $.ajax({
            type: "POST",
            url: "orderapi",
            data: {
                "invoiceId": id,
                "payment-method": paymentMethod,
                "payment-status": paymentStatus,
                "invoice-status": invoiceStatus
            },
            success: function (data) {
                console.log("SUCCESS : ", data);
                alert("Cập nhật thành công");
                window.location.href = "order-management";
            },
            error: function (e) {
                console.log("ERROR : ", e);
                alert("Thêm thất bại! ");
            }
        });
    }
</script>
</body>
</html>
