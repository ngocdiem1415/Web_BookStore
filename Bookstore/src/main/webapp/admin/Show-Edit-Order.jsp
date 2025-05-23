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
                <!-- end col -->
                <div class="breadcrumb-wrapper">
                    <ol class="breadcrumb mx-4">
                        <li class="breadcrumb-item">
                            <a href="dashboard" class="text-dec" style="color: gray">Dashboard</a>
                            <a href="#" class="text-dec" style="color: gray"> / </a>
                            <a href="order-management" class="text-dec" style="color: gray">Quản lí đơn hàng</a>
                            <a href="#" class="text-dec" style="color: gray"> / </a>
                            <c:choose>
                                <c:when test="${mode == 'show'}">
                                    <a href="#" class="text-dec" style="color: #f07c29">Thông tin đơn hàng</a>
                                </c:when>
                                <c:when test="${mode == 'edit'}">
                                    <a href="#" class="text-dec" style="color: #f07c29">Chỉnh sửa đơn hàng</a>
                                </c:when>
                            </c:choose>
                        </li>
                    </ol>
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <div class="container-fluid main-content br-gray rounded">
            <div class="row ">
                <div class="mt-4 ">
                    <div class="ID-Order">
                        <h5> MÃ ĐƠN HÀNG: ${order.invoiceId}</h5>
                        <span
                                class="mx-2">|</span><span class="f4gWe1" aria-role="region" aria-live="polite"
                                                           tabindex="0">${order.status}</span>
                    </div>
                </div>
                <div class="card-body mt-4">
                    <div class="row">
                        <div class="col-6">
                            <div class="col-lg-12">
                                <form>
                                    <div class="mb-4 ml-4">
                                        <label for="store-name" class="form-label mx-2 ">ID khách hàng:</label>
                                        <input type="text" id="store-name" class="form-control" value="${order.uid}"
                                               readonly=""
                                               fdprocessedid="z9i7i9">
                                    </div>
                                </form>
                            </div>
                            <div class="col-12">
                                <form>
                                    <div class="mb-4 ml-4">
                                        <label for="owner-name" class="form-label mx-2"> Tên người mua:</label>
                                        <input type="text" id="owner-name" class="form-control"
                                               value="${order.recipientName}">
                                    </div>
                                </form>
                            </div>
                            <div class="col-lg-12">
                                <div class="mb-4 ml-4">
                                    <label for="schedule-number" class="form-label mx-2">Số điện thoại:</label>
                                    <input type="number" id="schedule-number" name="schedule-number"
                                           class="form-control"
                                           value="${order.recipientPhone}">
                                </div>
                            </div>
                            <div class="col-lg-12">
                                <form>
                                    <div class="mb-4 ml-4">
                                        <label for="schedule-email" class="form-label mx-2">Địa chỉ:</label>
                                        <input type="email" id="schedule-email" name="schedule-email"
                                               class="form-control"
                                               value="${order.address}">
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-1"></div>
                        <div class="col-5 ">
                            <form class="payment mr-4" id="payment-form">
                                <div class="mb-3">
                                    <label for="payment-method" class="form-label mx-2">Hình thức thanh toán:</label>
                                    <c:choose>
                                        <c:when test="${mode == 'show'}">
                                            <<!-- Hình thức thanh toán -->
                                            <select id="payment-method" name="paymentMethod" class="form-select" disabled>
                                                <option value="1" ${order.payment.paymentMethod == 1 ? 'selected' : ''}>
                                                    Tiền
                                                    mặt
                                                </option>
                                                <option value="2" ${order.payment.paymentMethod == 2 ? 'selected' : ''}>
                                                    Chuyển
                                                    khoản
                                                </option>
                                            </select>
                                        </c:when>
                                        <c:when test="${mode == 'edit'}">
                                            <!-- Hình thức thanh toán -->
                                            <select id="payment-method" name="paymentMethod" class="form-select">
                                                <option value="1" ${order.payment.paymentMethod == 1 ? 'selected' : ''}>
                                                    Tiền mặt
                                                </option>
                                                <option value="2" ${order.payment.paymentMethod == 2 ? 'selected' : ''}>
                                                    Chuyển khoản
                                                </option>
                                            </select>
                                        </c:when>
                                    </c:choose>
                                </div>
                                <div class="mb-3 mr-4">
                                    <label for="owner-name" class="form-label"> Trạng thái thanh toán:</label>
                                    <c:choose>
                                        <c:when test="${mode == 'show'}">
                                            <!-- Trạng thái thanh toán -->
                                            <select id="payment-status" name="paymentStatus" class="form-select" disabled>
                                                <c:choose>
                                                    <c:when test="${order.payment.paymentStatus == 'Pending'}">
                                                        <option value="Pending" selected>Đang chờ xử lý</option>
                                                        <option value="Completed">Đã thanh toán thành công</option>
                                                        <option value="Failed">Thanh toán thất bại</option>
                                                        <option value="Refunded">Đã hoàn tiền</option>
                                                    </c:when>
                                                    <c:when test="${order.payment.paymentStatus == 'Completed'}">
                                                        <option value="Pending" >Đang chờ xử lý</option>
                                                        <option value="Completed" selected>Đã thanh toán thành công</option>
                                                        <option value="Failed">Thanh toán thất bại</option>
                                                        <option value="Refunded">Đã hoàn tiền</option>
                                                    </c:when>
                                                    <c:when test="${order.payment.paymentStatus == 'Failed'}">
                                                        <option value="Pending" >Đang chờ xử lý</option>
                                                        <option value="Completed">Đã thanh toán thành công</option>
                                                        <option value="Failed" selected>Thanh toán thất bại</option>
                                                        <option value="Refunded">Đã hoàn tiền</option>
                                                    </c:when>
                                                    <c:when test="${order.payment.paymentStatus == 'Refunded'}">
                                                        <option value="Pending" >Đang chờ xử lý</option>
                                                        <option value="Completed">Đã thanh toán thành công</option>
                                                        <option value="Failed">Thanh toán thất bại</option>
                                                        <option value="Refunded" selected>Đã hoàn tiền</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="Pending" selected>Đang chờ xử lý</option>
                                                        <option value="Completed">Đã thanh toán thành công</option>
                                                        <option value="Failed">Thanh toán thất bại</option>
                                                        <option value="Refunded">Đã hoàn tiền</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </c:when>
                                        <c:when test="${mode == 'edit'}">
                                            <!-- Trạng thái thanh toán -->
                                            <select id="payment-status" name="paymentStatus" class="form-select">
                                                <c:choose>
                                                    <c:when test="${order.payment.paymentStatus == 'Pending'}">
                                                        <option value="Pending" selected>Đang chờ xử lý</option>
                                                        <option value="Completed">Đã thanh toán thành công</option>
                                                        <option value="Failed">Thanh toán thất bại</option>
                                                        <option value="Refunded">Đã hoàn tiền</option>
                                                    </c:when>
                                                    <c:when test="${order.payment.paymentStatus == 'Completed'}">
                                                        <option value="Pending" >Đang chờ xử lý</option>
                                                        <option value="Completed" selected>Đã thanh toán thành công</option>
                                                        <option value="Failed">Thanh toán thất bại</option>
                                                        <option value="Refunded">Đã hoàn tiền</option>
                                                    </c:when>
                                                    <c:when test="${order.payment.paymentStatus == 'Failed'}">
                                                        <option value="Pending" >Đang chờ xử lý</option>
                                                        <option value="Completed">Đã thanh toán thành công</option>
                                                        <option value="Failed" selected>Thanh toán thất bại</option>
                                                        <option value="Refunded">Đã hoàn tiền</option>
                                                    </c:when>
                                                    <c:when test="${order.payment.paymentStatus == 'Refunded'}">
                                                        <option value="Pending" >Đang chờ xử lý</option>
                                                        <option value="Completed">Đã thanh toán thành công</option>
                                                        <option value="Failed">Thanh toán thất bại</option>
                                                        <option value="Refunded" selected>Đã hoàn tiền</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="Pending" selected>Đang chờ xử lý</option>
                                                        <option value="Completed">Đã thanh toán thành công</option>
                                                        <option value="Failed">Thanh toán thất bại</option>
                                                        <option value="Refunded">Đã hoàn tiền</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </c:when>
                                    </c:choose>
                                </div>
                                <div class="mb-3 mr-4">
                                    <label for="owner-name" class="form-label"> Trạng thái đơn hàng:</label>
                                    <c:choose>
                                        <c:when test="${mode == 'show'}">
                                            <select id="payment-status" class="form-select" disabled>
                                                <c:choose>
                                                    <c:when test="${order.payment.paymentStatus == 'Pending'}">
                                                        <option value="Pending" selected>Đang vận chuyển</option>
                                                        <option value="Completed">Đã giao hàng</option>
                                                        <option value="Failed">Hủy đơn hàng</option>
                                                        <option value="Refunded">Hoàn tiền</option>
                                                    </c:when>
                                                    <c:when test="${order.payment.paymentStatus == 'Completed'}">
                                                        <option value="Pending">Đang vận chuyển</option>
                                                        <option value="Completed" selected>Đã giao hàng</option>
                                                        <option value="Failed">Hủy đơn hàng</option>
                                                        <option value="Refunded">Hoàn tiền</option>
                                                    </c:when>
                                                    <c:when test="${order.payment.paymentStatus == 'Failed'}">
                                                        <option value="Pending" selected>Đang vận chuyển</option>
                                                        <option value="Completed">Đã giao hàng</option>
                                                        <option value="Failed">Hủy đơn hàng</option>
                                                        <option value="Refunded">Hoàn tiền</option>
                                                    </c:when>
                                                    <c:when test="${order.payment.paymentStatus == 'Refunded'}">
                                                        <option value="Pending" selected>Đang vận chuyển</option>
                                                        <option value="Completed">Đã giao hàng</option>
                                                        <option value="Failed">Hủy đơn hàng</option>
                                                        <option value="Refunded">Hoàn tiền</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="Pending" selected>Đang xử lý</option>
                                                        <option value="Shipping">Đang vận chuyển</option>
                                                        <option value="Received">Đã nhận được hàng</option>
                                                        <option value="Cancelled">Hủy đơn hàng</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </c:when>
                                        <c:when test="${mode == 'edit'}">
                                            <select id="invoice-status" class="form-select">
                                                <c:choose>
                                                    <c:when test="${order.payment.paymentStatus == 'Pending'}">
                                                        <option value="Pending" selected>Đang vận chuyển</option>
                                                        <option value="Completed">Đã giao hàng</option>
                                                        <option value="Failed">Hủy đơn hàng</option>
                                                        <option value="Refunded">Hoàn tiền</option>
                                                    </c:when>
                                                    <c:when test="${order.payment.paymentStatus == 'Completed'}">
                                                        <option value="Pending">Đang vận chuyển</option>
                                                        <option value="Completed" selected>Đã giao hàng</option>
                                                        <option value="Failed">Hủy đơn hàng</option>
                                                        <option value="Refunded">Hoàn tiền</option>
                                                    </c:when>
                                                    <c:when test="${order.payment.paymentStatus == 'Failed'}">
                                                        <option value="Pending" selected>Đang vận chuyển</option>
                                                        <option value="Completed">Đã giao hàng</option>
                                                        <option value="Failed">Hủy đơn hàng</option>
                                                        <option value="Refunded">Hoàn tiền</option>
                                                    </c:when>
                                                    <c:when test="${order.payment.paymentStatus == 'Refunded'}">
                                                        <option value="Pending" selected>Đang vận chuyển</option>
                                                        <option value="Completed">Đã giao hàng</option>
                                                        <option value="Failed">Hủy đơn hàng</option>
                                                        <option value="Refunded">Hoàn tiền</option>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <option value="Pending" selected>Đang xử lý</option>
                                                        <option value="Shipping">Đang vận chuyển</option>
                                                        <option value="Received">Đã nhận được hàng</option>
                                                        <option value="Cancelled">Hủy đơn hàng</option>
                                                    </c:otherwise>
                                                </c:choose>
                                            </select>
                                        </c:when>
                                    </c:choose>
                                </div>
                            </form>

                            <div class="row pb-3">
                                <div class="col-6 fw-bold">Tổng tiền</div>
                                <div class="col-6"><fmt:formatNumber
                                        value="${not empty order.getPayment().getAmount() ? order.getPayment().getAmount() : 0}"
                                        type="number"/></div>
                            </div>
                            <div class="row pb-3">
                                <div class="col-6 fw-bold">Phí vận chuyển</div>
                                <div class="col-6"><fmt:formatNumber
                                        value="${not empty order.shippingFee ? order.shippingFee :0}"
                                        type="number"/></div>
                            </div>
                            <div class="row pb-3">
                                <div class="col-6 fw-bold">Thành tiền</div>
                                <div class="col-6 "><fmt:formatNumber
                                        value="${not empty order.totalAmount ? order.totalAmount: 0}"
                                        type="number"/></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="list-detail mt-4">
                <div class="container-fluid">
                    <table class="table" id="orderTable">
                        <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th>Ảnh</th>
                            <th>Tên sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Giá</th>
                        </tr>
                        <thead>
                        <tbody>
                        <c:forEach var="listOrder" items="${order.listInvoiceDetails}">
                            <tr>
                                <td>${listOrder.invoiceId}</td>
                                <td>
                                    <img src="${listOrder.book.getImage().getSourceImg()}"
                                         alt="${listOrder.book.getTitle()}"
                                         height="80px" width="70px"/>
                                </td>
                                <td>${listOrder.book.getTitle()}</td>
                                <td><fmt:formatNumber
                                        value="${not empty listOrder.book.getsalePrice() ? listOrder.book.getsalePrice() : listOrder.book.getOriginalPrice()}"
                                        type="number"/> đ
                                </td>
                                <td>${listOrder.quantity}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="box-footer text-center">
            <c:choose>
                <c:when test="${mode == 'show'}">
                    <button type="button" class="btn btn-danger"
                            onclick="window.location.href='order-management';">Hủy
                    </button>
                </c:when>
                <c:when test="${mode == 'edit'}">
                    <button id="updateOrder" class="btn btn-success me-3">Lưu</button>
                    <button type="button" class="btn btn-danger"
                            onclick="window.location.href='order-management';">Hủy
                    </button>
                </c:when>
            </c:choose>
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
