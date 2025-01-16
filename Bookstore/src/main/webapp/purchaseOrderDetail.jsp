<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:18 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết đơn hàng</title>
    <%--Font Awesome--%>
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">

    <%--CSS--%>
    <link rel="stylesheet" href="css/purchaseOrder.css">
    <link rel="stylesheet" href="css/purchaseOrderDetail.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/Header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/Style.css">

    <!-- SweetAlert2 CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

    <!-- SweetAlert2 JS -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.js"></script>
    <%--Boostrap--%>
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">

</head>

<body>
<%--<jsp:include page="Header.jsp"></jsp:include>--%>
<%--<jsp:include page="Header.jsp"></jsp:include>--%>
<jsp:include page="Header.jsp"></jsp:include>
<!-- /HEADER -->

<div class="content-profile">
    <div class="container-profile-content">
        <div class="container-profile container-profile-content-inner">
            <!--content left-->
            <%--PROFILE BAR--%>
            <%@ include file="content-left-profile.jsp" %>
            <%--PROFILE BAR--%>

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
                                        <span class="right-inner-container__header__title-complete">${invoice.getStatus()}</span>
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
                                                ${invoice.getOrderDate()}
                                            </div>
                                        </div>
                                        <div class="right-inner-container--process__step-finish"
                                             aria-label="Thanh toán đơn hàng" tabindex="0">
                                            <div class="right-inner-container--process__step-finish-icon">
                                                <i class="fa-regular fa-money-bill-1"></i>
                                            </div>
                                            <div class="right-inner-container--process__step-finish-text">
                                                <c:choose>
                                                    <c:when test='${invoice.getPayment().getPaymentStatus().equals("Pending")}'>Đơn hàng chưa thanh toán</c:when>
                                                    <c:when test='${invoice.getPayment().getPaymentStatus().equals("Completed")}'>Đơn hàng đã thanh toán</c:when>
                                                    <c:when test='${invoice.getPayment().getPaymentStatus().equals("Failed")}'>Thanh toán thất bại</c:when>
                                                    <c:when test='${invoice.getPayment().getPaymentStatus().equals("Refunded")}'>Đã hoàn</c:when>
                                                </c:choose>
                                                <span>
                                                    <f:formatNumber value="${invoice.payment.amount}"/>
<%--                                                    <i class="fa-solid fa-dong-sign fa-xs"></i>--%>
                                                </span>

                                            </div>
                                            <div class="right-inner-container--process__step-finish-date">
                                                <c:choose>
                                                    <c:when test="${!invoice.getPayment().getPaymentStatus().equals('Pending')}">
                                                        ${invoice.getPayment().getPaymentDate}
                                                    </c:when>
                                                    <c:otherwise>

                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="right-inner-container--process__step-finish"
                                             aria-label="Đã giao cho ĐVVC" tabindex="0">
                                            <div class="right-inner-container--process__step-finish-icon">
                                                <i class="fa-solid fa-truck-fast"></i>
                                            </div>
                                            <div class="right-inner-container--process__step-finish-text">
                                                <c:choose>
                                                    <c:when test="${invoice.status.equals('Shipping')}">
                                                        Đơn hàng đang được vận chuyển
                                                    </c:when>
                                                    <c:when test="${invoice.status.equals('Completed')}">
                                                        Đã giao hàng thành công
                                                    </c:when>
                                                    <c:otherwise>
                                                        Đơn hàng chưa được vận chuyển
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="right-inner-container--process__step-finish"
                                             aria-label="Đã nhận được hàng" tabindex="0">
                                            <div class="right-inner-container--process__step-finish-icon">
                                                <i class="fa-solid fa-list-check"></i>
                                            </div>
                                            <div class="right-inner-container--process__step-finish-text">
                                                <c:choose>
                                                    <c:when test="${invoice.getStatus().equals('Completed')}">
                                                        Đơn hàng đã hoàn thành
                                                    </c:when>
                                                    <c:when test="${invoice.getStatus().equals('Cancelled')}">
                                                        Đơn hàng đã hủy
                                                    </c:when>
                                                    <c:otherwise>
                                                        Đơn hàng chưa hoàn thành
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="right-inner-container--process__step-finish-date">
                                                <c:choose>
                                                    <c:when test="${invoice.getStatus().equals('Completed')}">
                                                        ${invoice.completionDate}
                                                    </c:when>
                                                    <c:otherwise>

                                                    </c:otherwise>
                                                </c:choose>

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
                                                ${invoice.getRecipientName()}
                                            </div>
                                            <div class="right-inner-container--content-address__address">
                                                <span tabindex="0">${invoice.getRecipientPhone()}</span>
                                                <br>
                                                <span tabindex="0">${invoice.getAddress()}</span>
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
                                                <c:forEach var="detail"
                                                           items="${invoice.getListInvoiceDetails()}">
                                                    <div class="container-product-content-inner__right-inner-center-product__header__link">
                                                        <div class="content-inner__right-inner-infor">
                                                            <img src="${detail.getBook().getImage().getSourceImg()}"
                                                                 alt="${detail.getBook().getTitle()}"
                                                                 class="content-inner__right-inner-infor-img">
                                                            <div class="content-inner__right-inner-infor__text">
                                                                <div>
                                                                    <div class="content-inner__right-inner-infor__text-content">
                                                                <span class="content-inner__right-inner-infor__text-content-name">
                                                                        ${detail.getBook().getTitle()}
                                                                </span>
                                                                    </div>
                                                                </div>
                                                                <div>
                                                                    <div class="content-inner__right-inner-infor__text-content">
                                                                        <div class="content-inner__right-inner-infor__text-content-quanlity"
                                                                             tabindex="0">
                                                                            Số lượng: ${detail.getQuantity()}
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="content-inner__right-inner-infor__price"
                                                             tabindex="0">
                                                            <span class="right-inner-detail-link-content-price-text-old">
                                                                <f:formatNumber value="${detail.book.originalPrice}"/>
                                                                <i class="fa-solid fa-dong-sign fa-xs"></i>
                                                            </span>
                                                            <span class="content-inner__right-inner-infor__price-text">
                                                                <f:formatNumber value="${detail.unitPrice}"/>
                                                                <i class="fa-solid fa-dong-sign fa-xs"></i>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </c:forEach>
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
                                                <div>
                                                    <f:formatNumber value="${invoice.payment.amount - invoice.shippingFee}"/>
                                                    <i class="fa-solid fa-dong-sign fa-xs"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="container-profile-content-inner__right-inner-cost">
                                            <div class="container-profile-content-inner__right-inner-cost__title">
                                                <span>Phí vận chuyển</span>
                                            </div>
                                            <div class="container-profile-content-inner__right-inner-cost__price">
                                                <div>
                                                    <f:formatNumber value="${invoice.shippingFee}"/>
                                                    <i class="fa-solid fa-dong-sign fa-xs"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="container-profile-content-inner__right-inner-cost">
                                            <div class="container-profile-content-inner__right-inner-cost__title">
                                                <span>Thành tiền</span>
                                            </div>
                                            <div class="container-profile-content-inner__right-inner-cost__price">
                                                <div>
                                                    <f:formatNumber value="${invoice.payment.amount}"/>
                                                    <i class="fa-solid fa-dong-sign fa-xs"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="container-profile-content-inner__right-inner-cost">
                                            <div class="container-profile-content-inner__right-inner-cost__title">
                                                <span>Hình thức thanh toán</span>
                                            </div>
                                            <div class="container-profile-content-inner__right-inner-cost__price">
                                                <div>
                                                    <c:choose>
                                                        <c:when test="${invoice.getPayment().getPaymentMethod() == 1}">
                                                            Thanh toán khi nhận hàng
                                                        </c:when>
                                                        <c:when test="${invoice.getPayment().getPaymentMethod() == 2}">
                                                            Chuyển khoản ngân hàng
                                                        </c:when>
                                                        <c:otherwise>

                                                        </c:otherwise>
                                                    </c:choose>

                                                </div>
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

<!--FOOTER-->
<jsp:include page="footer.jsp"></jsp:include>
<!--FOOTER-->


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

</body>
</html>

