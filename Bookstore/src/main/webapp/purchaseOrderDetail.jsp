<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: Admin--%>
<%--  Date: 18/12/2024--%>
<%--  Time: 10:18 SA--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>--%>
<%--<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Chi tiết đơn hàng</title>--%>
<%--    &lt;%&ndash;Font Awesome&ndash;%&gt;--%>
<%--    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">--%>

<%--    &lt;%&ndash;CSS&ndash;%&gt;--%>
<%--    <link rel="stylesheet" href="css/purchaseOrder.css">--%>
<%--    <link rel="stylesheet" href="css/purchaseOrderDetail.css">--%>
<%--    <link rel="stylesheet" href="css/profile.css">--%>
<%--    <link rel="stylesheet" href="css/Header.css">--%>
<%--    <link rel="stylesheet" href="css/footer.css">--%>
<%--    <link rel="stylesheet" href="css/Style.css">--%>

<%--    <!-- SweetAlert2 CSS -->--%>
<%--    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">--%>

<%--    <!-- SweetAlert2 JS -->--%>
<%--    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>--%>
<%--    &lt;%&ndash;Boostrap&ndash;%&gt;--%>
<%--    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">--%>

<%--</head>--%>

<%--<body>--%>
<%--&lt;%&ndash;<jsp:include page="Header.jsp"></jsp:include>&ndash;%&gt;--%>
<%--&lt;%&ndash;<jsp:include page="Header.jsp"></jsp:include>&ndash;%&gt;--%>
<%--<jsp:include page="Header.jsp"></jsp:include>--%>
<%--<!-- /HEADER -->--%>

<%--<div class="content-profile">--%>
<%--    <div class="container-profile-content">--%>
<%--        <div class="container-profile container-profile-content-inner">--%>
<%--            <!--content left-->--%>
<%--            &lt;%&ndash;PROFILE BAR&ndash;%&gt;--%>
<%--            <%@ include file="content-left-profile.jsp" %>--%>
<%--&lt;%&ndash;            <jsp:include page="content-left-profile.jsp"></jsp:include>&ndash;%&gt;--%>
<%--            &lt;%&ndash;PROFILE BAR&ndash;%&gt;--%>

<%--            <!--content right-->--%>
<%--            <div class="container-profile-content-inner__right">--%>
<%--                <div style="display: contents">--%>
<%--                    <div class="container-product-content-inner__right-inner">--%>
<%--                        <main class="container-product-content-inner__right-inner-container">--%>
<%--                            <section>--%>
<%--                                <div class="container-product-content-inner__right-inner-container__header">--%>
<%--                                    <a href="<c:url value="/invoice"/>" class="right-inner-container__header__back">--%>
<%--                                        <i class="fa-solid fa-chevron-left"></i>--%>
<%--                                        <span>Trở lại</span>--%>
<%--                                    </a>--%>
<%--                                    <div class="right-inner-container__header__title">--%>
<%--                                        <span class="right-inner-container__header__title-complete">${invoice.getStatus()}</span>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </section>--%>

<%--                            <section>--%>
<%--                                <div class="container-product-content-inner__right-inner-container--process">--%>
<%--                                    <div class="right-inner-container--process__step">--%>
<%--                                        <div class="right-inner-container--process__step-finish"--%>
<%--                                             aria-label="Đơn hàng đã đặt" tabindex="0">--%>
<%--                                            <div class="right-inner-container--process__step-finish-icon">--%>
<%--                                                <i class="fa-solid fa-list"></i>--%>
<%--                                            </div>--%>
<%--                                            <div class="right-inner-container--process__step-finish-text">--%>
<%--                                                Đơn hàng đã đặt--%>
<%--                                            </div>--%>
<%--                                            <div class="right-inner-container--process__step-finish-date">--%>
<%--                                                <fmt:formatDate value="${invoice.getOrderDate()}"--%>
<%--                                                                pattern="HH:mm dd/MM/yyyy"/>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="right-inner-container--process__step-finish"--%>
<%--                                             aria-label=" <c:choose>--%>
<%--                                                 <c:when test='${invoice.getPayment().getPaymentStatus().equals("Pending")}'>Đơn hàng chưa thanh toán</c:when>--%>
<%--                                                 <c:when test='${invoice.getPayment().getPaymentStatus().equals("Completed")}'>Đơn hàng đã thanh toán</c:when>--%>
<%--                                                 <c:when test='${invoice.getPayment().getPaymentStatus().equals("Failed")}'>Thanh toán thất bại</c:when>--%>
<%--                                                 <c:when test='${invoice.getPayment().getPaymentStatus().equals("Refunded")}'>Đã hoàn</c:when>--%>
<%--                                             </c:choose>" tabindex="0">--%>
<%--                                            <div class="right-inner-container--process__step-finish-icon">--%>
<%--                                                <i class="fa-regular fa-money-bill-1"></i>--%>
<%--                                            </div>--%>
<%--                                            <div class="right-inner-container--process__step-finish-text">--%>
<%--                                                <fmt:formatNumber--%>
<%--                                                        value="${invoice.getPayment().getAmount()}"/>--%>
<%--                                            </div>--%>
<%--                                            <div class="right-inner-container--process__step-finish-date">--%>
<%--                                                <c:choose>--%>
<%--                                                    <c:when test="${!invoice.getPayment().getPaymentStatus().equals('Pending')}">--%>

<%--                                                        <fmt:formatDate--%>
<%--                                                                value="${invoice.getPayment().getPaymentDate}"--%>
<%--                                                                pattern="HH:mm dd/MM/yyyy"/>--%>
<%--                                                    </c:when>--%>
<%--                                                    <c:otherwise>--%>

<%--                                                    </c:otherwise>--%>
<%--                                                </c:choose>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="right-inner-container--process__step-finish"--%>
<%--                                             aria-label="Đã giao cho ĐVVC" tabindex="0">--%>
<%--                                            <div class="right-inner-container--process__step-finish-icon">--%>
<%--                                                <i class="fa-solid fa-truck-fast"></i>--%>
<%--                                            </div>--%>
<%--                                            <div class="right-inner-container--process__step-finish-text">--%>
<%--                                                Đơn hàng đang vận chuyển--%>
<%--                                            </div>--%>

<%--                                        </div>--%>
<%--                                        <div class="right-inner-container--process__step-finish"--%>
<%--                                             aria-label="Đã nhận được hàng" tabindex="0">--%>
<%--                                            <div class="right-inner-container--process__step-finish-icon">--%>
<%--                                                <i class="fa-solid fa-list-check"></i>--%>
<%--                                            </div>--%>
<%--                                            <div class="right-inner-container--process__step-finish-text">--%>
<%--                                                <c:choose>--%>
<%--                                                    <c:when test="${invoice.getStatus().equals('Completed')}">--%>
<%--                                                        Đơn hàng đã hoàn thành--%>
<%--                                                    </c:when>--%>
<%--                                                    <c:otherwise>--%>
<%--                                                        Đơn hàng chưa hoàn thành--%>
<%--                                                    </c:otherwise>--%>
<%--                                                </c:choose>--%>
<%--                                            </div>--%>
<%--                                            <div class="right-inner-container--process__step-finish-date">--%>
<%--                                                <c:choose>--%>
<%--                                                    <c:when test="${invoice.getStatus().equals('Completed')}">--%>
<%--                                                        <fmt:formatDate value="${invoice.completionDate}"--%>
<%--                                                                        pattern="HH:mm dd/MM/yyyy"/>--%>
<%--                                                    </c:when>--%>
<%--                                                    <c:otherwise>--%>

<%--                                                    </c:otherwise>--%>
<%--                                                </c:choose>--%>

<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="right-inner-container--process__step-line">--%>
<%--                                            <div class="right-inner-container--process__step-line-background"--%>
<%--                                                 style="background: rgb(224,224,224)"></div>--%>
<%--                                            <div class="right-inner-container--process__step-line-foreground"--%>
<%--                                                 style="width: calc(100% - 140px); background: rgb(45, 194, 88)"></div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </section>--%>
<%--                            <section>--%>
<%--                                <div>--%>
<%--                                    <div class="right-inner-container--content">--%>
<%--                                        <div class="right-inner-container--content-address" tabindex="0">--%>
<%--                                            <div class="right-inner-container--content-address__title">Địa chỉ nhận--%>
<%--                                                hàng--%>
<%--                                            </div>--%>
<%--                                            <div class="right-inner-container--content-address__name" tabindex="0">--%>
<%--                                                ${invoice.getRecipientName()}--%>
<%--                                            </div>--%>
<%--                                            <div class="right-inner-container--content-address__address">--%>
<%--                                                <span tabindex="0">${invoice.getRecipientPhone()}</span>--%>
<%--                                                <br>--%>
<%--                                                <span tabindex="0">${invoice.getAddress()}</span>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div>--%>
<%--                                    <div class="right-effect">--%>
<%--                                        <div class="right-effect-straight"></div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </section>--%>
<%--                            <section>--%>
<%--                                <div>--%>
<%--                                    <div class="container-product-content-inner__right-inner-detail">--%>
<%--                                        <div>--%>
<%--                                            &lt;%&ndash;                                            Lặp danh sách chi tiết đơn hàng trong đơn hàng&ndash;%&gt;--%>
<%--                                            <section>--%>
<%--                                                <c:forEach var="detail"--%>
<%--                                                           items="${invoice.getListInvoiceDetails()}">--%>
<%--                                                    <div class="container-product-content-inner__right-inner-center-product__header__link">--%>
<%--                                                        <div class="content-inner__right-inner-infor">--%>
<%--                                                            <img src="${detail.getBook().getImage().getSourceImg()}"--%>
<%--                                                                 alt="${detail.getBook().getTitle()}"--%>
<%--                                                                 class="content-inner__right-inner-infor-img">--%>
<%--                                                            <div class="content-inner__right-inner-infor__text">--%>
<%--                                                                <div>--%>
<%--                                                                    <div class="content-inner__right-inner-infor__text-content">--%>
<%--                                                                <span class="content-inner__right-inner-infor__text-content-name">--%>
<%--                                                                        ${detail.getBook().getTitle()}--%>
<%--                                                                </span>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                                <div>--%>
<%--                                                                    <div class="content-inner__right-inner-infor__text-content">--%>
<%--                                                                        <div class="content-inner__right-inner-infor__text-content-quanlity"--%>
<%--                                                                             tabindex="0">--%>
<%--                                                                            Số lượng: ${detail.getQuantity()}--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                        <div class="content-inner__right-inner-infor__price"--%>
<%--                                                             tabindex="0">--%>
<%--                                                            <span class="right-inner-detail-link-content-price-text-old">--%>
<%--                                                                <fmt:formatNumber--%>
<%--                                                                        value="${detail.getBook().getPrice()}"/>--%>
<%--                                                                <i class="fa-solid fa-dong-sign fa-xs"></i>--%>
<%--                                                            </span>--%>
<%--                                                            <span class="content-inner__right-inner-infor__price-text">--%>
<%--                                                                <fmt:formatNumber value="${detail.getUnitPrice()}"/>--%>
<%--                                                                <i class="fa-solid fa-dong-sign fa-xs"></i>--%>
<%--                                                            </span>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                </c:forEach>--%>
<%--                                            </section>--%>
<%--                                            &lt;%&ndash;                                        Kết thúc lặp&ndash;%&gt;--%>

<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <!--Tinh tong tien hang va phi van chuyen-->--%>
<%--                                    <div class="container-profile-content-inner__right-inner-total">--%>
<%--                                        <div class="container-profile-content-inner__right-inner-cost">--%>
<%--                                            <div class="container-profile-content-inner__right-inner-cost__title">--%>
<%--                                                <span>Tổng tiền hàng</span>--%>
<%--                                            </div>--%>
<%--                                            <div class="container-profile-content-inner__right-inner-cost__price">--%>
<%--                                                <div>--%>
<%--                                                    <fmt:formatNumber--%>
<%--                                                            value="${invoice.getPayment().getAmount() - invoice.getShippingFee()}"/>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="container-profile-content-inner__right-inner-cost">--%>
<%--                                            <div class="container-profile-content-inner__right-inner-cost__title">--%>
<%--                                                <span>Phí vận chuyển</span>--%>
<%--                                            </div>--%>
<%--                                            <div class="container-profile-content-inner__right-inner-cost__price">--%>
<%--                                                <div>--%>
<%--                                                    <fmt:formatNumber--%>
<%--                                                            value="${invoice.getShippingFee()}"/>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="container-profile-content-inner__right-inner-cost">--%>
<%--                                            <div class="container-profile-content-inner__right-inner-cost__title">--%>
<%--                                                <span>Thành tiền</span>--%>
<%--                                            </div>--%>
<%--                                            <div class="container-profile-content-inner__right-inner-cost__price">--%>
<%--                                                <div>--%>
<%--                                                    <fmt:formatNumber--%>
<%--                                                            value="${invoice.getPayment().getAmount()}"/>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                        <div class="container-profile-content-inner__right-inner-cost">--%>
<%--                                            <div class="container-profile-content-inner__right-inner-cost__title">--%>
<%--                                                <span>Hình thức thanh toán</span>--%>
<%--                                            </div>--%>
<%--                                            <div class="container-profile-content-inner__right-inner-cost__price">--%>
<%--                                                <div>--%>
<%--                                                    ${invoice.getPayment().getPaymentMethod()}--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </section>--%>
<%--                        </main>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<%--<!--FOOTER-->--%>
<%--<%@include file="footer.jsp" %>--%>
<%--<!--FOOTER-->--%>


<%--<script>--%>
<%--    document.addEventListener('DOMContentLoaded', function () {--%>
<%--        const accountDropdownHeader = document.querySelector('.stardust-dropdown__item-header-menu');--%>
<%--        const dropdownBody = document.querySelector('.stardust-dropdown__item-body');--%>
<%--        const icon = document.querySelector('.stardust-dropdown__item-header-account-name i');--%>

<%--        accountDropdownHeader.addEventListener('click', function (event) {--%>
<%--            event.preventDefault(); // Ngăn chặn load lại trang--%>
<%--            dropdownBody.classList.toggle('stardust-dropdown__item-body--open');--%>
<%--            icon.classList.toggle('rotate-icon');--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>
<%--<script>--%>
<%--    document.addEventListener("DOMContentLoaded", function () {--%>
<%--        const reviewButton = document.querySelector(".stardust-button--primary"); // Nút "Đánh giá"--%>
<%--        const overlay = document.getElementById("overlay"); // Overlay--%>
<%--        const cancelButton = document.getElementById("cancel-overlay"); // Nút "Trở lại"--%>
<%--        const submitButton = document.getElementById("submit-overlay"); // Nút "Hoàn thành"--%>

<%--        // Hiển thị overlay khi nhấn "Đánh giá"--%>
<%--        reviewButton.addEventListener("click", () => {--%>
<%--            overlay.classList.remove("hidden"); // Hiện overlay--%>
<%--        });--%>

<%--        // Ẩn overlay khi nhấn "Trở lại"--%>
<%--        cancelButton.addEventListener("click", () => {--%>
<%--            overlay.classList.add("hidden"); // Ẩn overlay--%>
<%--        });--%>

<%--        // Xử lý khi nhấn "Hoàn thành"--%>
<%--        submitButton.addEventListener("click", () => {--%>
<%--            console.log("Đánh giá đã gửi thành công!"); // Thêm logic gửi đánh giá ở đây nếu cần--%>
<%--            overlay.classList.add("hidden"); // Ẩn overlay--%>
<%--        });--%>

<%--        // Ẩn overlay khi nhấn ra ngoài overlay--%>
<%--        overlay.addEventListener("click", (event) => {--%>
<%--            if (event.target === overlay) {--%>
<%--                overlay.classList.add("hidden");--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>


<%--</script>--%>
<%--<script>--%>
<%--    document.getElementById("fileInput").addEventListener("change", function (event) {--%>
<%--        const file = event.target.files[0];--%>
<%--        if (file) {--%>
<%--            const reader = new FileReader();--%>

<%--            // Đọc file và gán vào phần hiển thị--%>
<%--            reader.onload = function (e) {--%>
<%--                const previewImage = document.getElementById("previewImage");--%>
<%--                previewImage.src = e.target.result;--%>
<%--            };--%>

<%--            reader.readAsDataURL(file);--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>

<%--</body>--%>
<%--</html>--%>

<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:18 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Purchase Order Detail</title>
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">
    <link rel="stylesheet" href="css/Header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/purchaseOrder.css">
    <link rel="stylesheet" href="css/purchaseOrderDetail.css">
    <script src="js/bootstrap.bundle.min.js"></script>

</head>
<body>
<!--header-->
<!--<div id="header"></div>-->
<!--Header-->
<jsp:include page="Header.jsp"></jsp:include>
<!--/nav end-->


<!--Content-->
<div class="content-profile">
    <div class="container-profile-content">
        <div class="container-profile container-profile-content-inner">
            <!--content left-->
            <%@ include file="content-left-profile.jsp"%>
            <!--content right-->
            <div class="container-profile-content-inner__right">
                <div style="display: contents">
                    <div class="container-product-content-inner__right-inner">
                        <main class="container-product-content-inner__right-inner-container">
                            <section>
                                <div class="container-product-content-inner__right-inner-container__header">
                                    <a href="<c:url value="/invoice"/>" class="right-inner-container__header__back">
                                        <i class="fa-solid fa-chevron-left"></i>
                                        <span>Trở lại</span>
                                    </a>
                                    <div class="right-inner-container__header__title">
                                        <span class="right-inner-container__header__title-complete">${invoice.status}</span>
                                    </div>
                                </div>

                            </section>
                            <section>
                                <div class="container-product-content-inner__right-inner-container--process">
                                    <div class="right-inner-container--process__step">
                                        <div class="right-inner-container--process__step-finish"
                                             aria-label="Đơn hàng đã đặt" tabindex="0">
                                            <div class="right-inner-container--process__step-finish-icon">
                                                <i class="fa-solid fa-list"></i>
                                            </div>
                                            <div class="right-inner-container--process__step-finish-text">
                                                Đơn hàng đã đặt
                                            </div>
                                            <div class="right-inner-container--process__step-finish-date">
                                                ${invoice.orderDate}
                                                    <fmt:formatDate value="${invoice.getOrderDate()}"--%>
                                                               pattern="HH:mm dd/MM/yyyy"/>
                                            </div>
                                        </div>
                                        <div class="right-inner-container--process__step-finish"
                                             aria-label="Đơn hàng đã thanh toán" tabindex="0">
                                            <div class="right-inner-container--process__step-finish-icon">
                                                <i class="fa-regular fa-money-bill-1"></i>
                                            </div>
                                            <div class="right-inner-container--process__step-finish-text">
                                                Đơn hàng đã thanh toán (₫129.000)
                                            </div>
                                            <div class="right-inner-container--process__step-finish-date">
                                                16:35 14/11/2024
                                            </div>
                                        </div>
                                        <div class="right-inner-container--process__step-finish"
                                             aria-label="Đã giao cho ĐVVC" tabindex="0">
                                            <div class="right-inner-container--process__step-finish-icon">
                                                <i class="fa-solid fa-truck-fast"></i>
                                            </div>
                                            <div class="right-inner-container--process__step-finish-text">
                                                Đã Giao Cho ĐVVC
                                            </div>
                                            <div class="right-inner-container--process__step-finish-date">
                                                11:01 15/11/2024
                                            </div>

                                        </div>
                                        <div class="right-inner-container--process__step-finish"
                                             aria-label="Đã nhận được hàng" tabindex="0">
                                            <div class="right-inner-container--process__step-finish-icon">
                                                <i class="fa-solid fa-list-check"></i>
                                            </div>
                                            <div class="right-inner-container--process__step-finish-text">
                                                Đã Nhận Được Hàng
                                            </div>
                                            <div class="right-inner-container--process__step-finish-date">
                                                08:24 16/11/2024
                                            </div>
                                        </div>
                                        <div class="right-inner-container--process__step-line">
                                            <div class="right-inner-container--process__step-line-background"
                                                 style="background: rgb(224,224,224)"></div>
                                            <div class="right-inner-container--process__step-line-foreground"
                                                 style="width: calc(100% - 140px); background: rgb(45, 194, 88)"></div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                            <section>
                                <div>
                                    <div class="right-inner-container--content">
                                        <div class="right-inner-container--content-address" tabindex="0">
                                            <div class="right-inner-container--content-address__title">Địa chỉ nhận
                                                hàng
                                            </div>
                                            <div class="right-inner-container--content-address__name" tabindex="0">
                                                Nguyễn Hữu Thịnh
                                            </div>
                                            <div class="right-inner-container--content-address__address">
                                                <span tabindex="0">(+84) 347163899</span>
                                                <br>
                                                <span tabindex="0">22 Đường Số 22, Phường Phước Long B, Thành Phố Thủ Đức, TP. Hồ Chí Minh</span>
                                            </div>
                                        </div>
                                        <div class="right-inner-container--content-vote">
                                            <div>
                                                <button class="stardust-button--primary stardust-button">
                                                    Đánh giá
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <div class="right-effect">
                                        <div class="right-effect-straight"></div>
                                    </div>
                                </div>
                            </section>
                            <section>
                                <div>
                                    <div class="container-product-content-inner__right-inner-detail">
                                        <div>
                                            <section>
                                                <a href=""
                                                   class="container-product-content-inner__right-inner-detail-link">
                                                    <div class="right-inner-detail-link-content">
                                                        <img src="img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_1.webp"
                                                             alt=""
                                                             class="right-inner-detail-link-content-img" tabindex="0">
                                                        <div class="right-inner-detail-link-content-title-and-quanlity">
                                                            <div>
                                                                <div class="right-inner-detail-link-content-title">
                                                                    <span class="right-inner-detail-link-content-title-text">
                                                                        Méo Mèo Meo - Bí Mật Giao Tiếp Từ Cái Vẫy Đuôi Đến Tiếng Grừ Grừ
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div>
                                                                <div class="right-inner-detail-link-content-quanlity"
                                                                     tabindex="0">
                                                                    x1
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="right-inner-detail-link-content-price">
                                                        <div class="right-inner-detail-link-content-price-text">
                                                            <span class="right-inner-detail-link-content-price-text-old">
                                                                159.000đ
                                                            </span>
                                                            <span class="right-inner-detail-link-content-price-text-new">
                                                                129.000đ
                                                            </span>
                                                        </div>
                                                    </div>
                                                </a>
                                            </section>
                                        </div>
                                    </div>
                                    <!--Tinh tong tien hang va phi van chuyen-->
                                    <div class="container-profile-content-inner__right-inner-total">
                                        <div class="container-profile-content-inner__right-inner-cost">
                                            <div class="container-profile-content-inner__right-inner-cost__title">
                                                <span>Tổng tiền hàng</span>
                                            </div>
                                            <div class="container-profile-content-inner__right-inner-cost__price">
                                                <div>129.000đ</div>
                                            </div>
                                        </div>
                                        <div class="container-profile-content-inner__right-inner-cost">
                                            <div class="container-profile-content-inner__right-inner-cost__title">
                                                <span>Phí vận chuyển</span>
                                            </div>
                                            <div class="container-profile-content-inner__right-inner-cost__price">
                                                <div>20.000đ</div>
                                            </div>
                                        </div>
                                        <div class="container-profile-content-inner__right-inner-cost">
                                            <div class="container-profile-content-inner__right-inner-cost__title">
                                                <span>Thành tiền</span>
                                            </div>
                                            <div class="container-profile-content-inner__right-inner-cost__price">
                                                <div>129.000đ</div>
                                            </div>
                                        </div>
                                        <div class="container-profile-content-inner__right-inner-cost">
                                            <div class="container-profile-content-inner__right-inner-cost__title">
                                                <span>Hình thức thanh toán</span>
                                            </div>
                                            <div class="container-profile-content-inner__right-inner-cost__price">
                                                <div>Tiền mặt</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </section>
                        </main>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div id="overlay" class="overlay hidden">
    <div class="rating-container">
        <div style="display: contents">
            <div>
                <div class="rating-container-form">
                    <div class="rating-container-form__header">
                        <div class="rating-container-form-header-title">Đánh Giá Sản Phẩm</div>
                    </div>
                    <div class="rating-container-form__main">
                        <div class="rating-container-form__main-container">
                            <div class="rating-infor rating-proc">
                                <div class="rating-infor__product">
                                    <div class="rating-infor__product--img">
                                        <img src="img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_1.webp"
                                             alt="" class="img-product lazyload" width="60px" height="80px">
                                    </div>
                                    <div class="rating-infor__product--name">
                                            <span class="rating-infor__product--name-text">
                                                Mèo Mèo Mèo Bí Mật Giao Tiếp Từ Cái Vây Dưới Đen Tiếng Gru Gru
                                            </span>
                                        <span class="rating-infor__product--quantity">x1</span>
                                    </div>
                                </div>
                            </div>

                            <div style="margin: 20px 0px">
                                <div class="rating-infor__star">
                                    <div class="rating-infor__star--text">
                                        <span>Chất lượng sản phẩm</span>
                                    </div>
                                    <div class="rating-infor__star--star" style="padding-left: 5px">
                                        <i class="fa-solid fa-star"></i>
                                    </div>
                                    <div class="rating-infor__star--star" style="padding-left: 5px">
                                        <i class="fa-solid fa-star"></i>
                                    </div>
                                    <div class="rating-infor__star--star" style="padding-left: 5px">
                                        <i class="fa-solid fa-star"></i>
                                    </div>
                                    <div class="rating-infor__star--star" style="padding-left: 5px">
                                        <i class="fa-solid fa-star"></i>
                                    </div>
                                    <div class="rating-infor__star--star" style="padding-left: 5px">
                                        <i class="fa-solid fa-star"></i>
                                    </div>
                                    <span class="rating-infor__star--text"
                                          style="color: rgba(0,0,0,.69); margin-left: 5px">Tuyệt Vời</span>
                                </div>
                            </div>

                            <div class="rating-infor-cmt">
                                <div class="rating-infor-cmt-inner">
                                    <div class="rating-infor-cmt-inner__wrap">
                                        <div class="rating-infor-cmt-inner__wrap--text"
                                             style="font-weight: normal">
                                            Đóng gói sản phẩm:
                                        </div>
                                        <textarea name="" rows="1" placeholder="để lại đánh giá."
                                                  class="rating-infor-cmt-inner--textarea"></textarea>
                                    </div>
                                    <div class="rating-infor-cmt-inner__line"></div>
                                    <div class="rating-infor-cmt-inner__wrap--description"
                                         style="position: relative">
                                                <textarea rows="3" placeholder="để lại đánh giá."
                                                          class="rating-infor-cmt-inner--textarea"
                                                          style="min-height: 100px; color: rgba(0,0,0,0.87)">
                                                </textarea>
                                    </div>
                                </div>
                            </div>

                            <div class="rating-vote-img">
                                <label class="rating-vote-img--infor">
                                    <i class="fa-solid fa-camera"></i>
                                    <span class="rating-vote-img-add">Thêm hình ảnh</span>
                                    <input type="file" class="rating-file__input" accept="image/*">
                                </label>
                            </div>

                            <div class="rating-vote-anonymous-wrapper">
                                <label class="stardust-checkbox">
                                    <input type="checkbox" aria-checked="true" tabindex="0" role="checkbox"
                                           class="stardust-checkbox__input">
                                </label>
                                <div style="margin-left: 22px; margin-top: -10px">
                                    <div class="rating-vote-anonymous-hint">
                                        Hiển thị tên đăng nhập trên đánh giá này
                                    </div>
                                    <div class="rating-vote-anonymous-username">
                                        Tên tài khoản sẽ được hiển thị như ....
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="rating-container-form__footer">
                        <button id="cancel-overlay" class="rating-cancel-btn">Trở lại</button>
                        <button id="submit-overlay" type="button"
                                class="btn btn-solid-primary btn--s btn--inline rating-submit-btn ">
                            Hoàn thành
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!--footer-->
<jsp:include page="footer.jsp"></jsp:include>


<script>
    document.addEventListener('DOMContentLoaded', function () {
        const accountDropdownHeader = document.querySelector('.stardust-dropdown__item-header-menu');
        const dropdownBody = document.querySelector('.stardust-dropdown__item-body');
        const icon = document.querySelector('.stardust-dropdown__item-header-account-name i');

        accountDropdownHeader.addEventListener('click', function (event) {
            event.preventDefault(); // Ngăn chặn load lại trang
            dropdownBody.classList.toggle('stardust-dropdown__item-body--open');
            icon.classList.toggle('rotate-icon');
        });
    });
</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const reviewButton = document.querySelector(".stardust-button--primary"); // Nút "Đánh giá"
        const overlay = document.getElementById("overlay"); // Overlay
        const cancelButton = document.getElementById("cancel-overlay"); // Nút "Trở lại"
        const submitButton = document.getElementById("submit-overlay"); // Nút "Hoàn thành"

        // Hiển thị overlay khi nhấn "Đánh giá"
        reviewButton.addEventListener("click", () => {
            overlay.classList.remove("hidden"); // Hiện overlay
        });

        // Ẩn overlay khi nhấn "Trở lại"
        cancelButton.addEventListener("click", () => {
            overlay.classList.add("hidden"); // Ẩn overlay
        });

        // Xử lý khi nhấn "Hoàn thành"
        submitButton.addEventListener("click", () => {
            console.log("Đánh giá đã gửi thành công!"); // Thêm logic gửi đánh giá ở đây nếu cần
            overlay.classList.add("hidden"); // Ẩn overlay
        });

        // Ẩn overlay khi nhấn ra ngoài overlay
        overlay.addEventListener("click", (event) => {
            if (event.target === overlay) {
                overlay.classList.add("hidden");
            }
        });
    });


</script>
<script>
    document.getElementById("fileInput").addEventListener("change", function (event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();

            // Đọc file và gán vào phần hiển thị
            reader.onload = function (e) {
                const previewImage = document.getElementById("previewImage");
                previewImage.src = e.target.result;
            };

            reader.readAsDataURL(file);
        }
    });
</script>

</body>
</html>