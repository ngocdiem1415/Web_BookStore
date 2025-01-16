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
    <title>Đơn hàng</title>

    <%--Font Awesome--%>
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">

    <%--CSS--%>
    <link rel="stylesheet" href="css/purchaseOrder.css">
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
<!--Header-->
<jsp:include page="Header.jsp"></jsp:include>
<!-- /HEADER -->

<div class="content-profile">
    <div class="container-profile-content">
        <div class="container-profile container-profile-content-inner">
            <!--content left-->
            <%--PROFILE BAR--%>
            <jsp:include page="content-left-profile.jsp"></jsp:include>
            <%--PROFILE BAR--%>

            <!--content right-->
            <div class="container-product-content-inner__right">
                <div style="display: contents">
                    <%--Danh sách các trạng thái của đơn hàng--%>
                    <div class="container-product-content-inner__right-inner">
                        <section class="container-product-content-inner__right-inner-list" aria-label="tablist">
                            <a href="<c:url value="/invoice?action=list&userId=${userSession.getUid()}"/>"
                               class="container-product-content-inner__right-inner-item"
                               title="Tất cả">
                                <span class="right-inner-item-text">Tất cả</span>
                            </a>

                            <a href="<c:url value="/invoice?action=filterByStatus&status=pending&userId=${userSession.getUid()}"/>"
                               class="container-product-content-inner__right-inner-item"
                               title="Chờ thanh toán">
                                <span class="right-inner-item-text">Chờ thanh toán</span>
                            </a>

                            <a href="<c:url value="/invoice?action=filterByStatus&status=shipping&userId=${userSession.getUid()}"/>"
                               class="container-product-content-inner__right-inner-item"
                               title="Chờ giao hàng">
                                <span class="right-inner-item-text">Chờ giao hàng</span>
                            </a>

                            <a href="<c:url value="/invoice?action=filterByStatus&status=completed&userId=${userSession.getUid()}"/>"
                               class="container-product-content-inner__right-inner-item"
                               title="Hoàn thành">
                                <span class="right-inner-item-text">Hoàn thành</span>
                            </a>

                            <a href="<c:url value="/invoice?action=filterByStatus&status=Cancelled&userId=${userSession.getUid()}"/>"
                               class="container-product-content-inner__right-inner-item"
                               title="Đã hủy">
                                <span class="right-inner-item-text">Đã hủy</span>
                            </a>
                        </section>
                    </div>

                    <section>
                        <div class="container mt-3">
                            <!-- Form -->
                            <form action="<c:url value='/invoice' />" method="get" class="d-flex">
                                <!-- Input Group -->
                                <div class="input-group bg-dark-subtle border rounded align-items-center">
                                    <!-- Icon Tìm kiếm -->
                                    <span class="input-group-text bg-transparent border-0">
                                        <i class="fa-solid fa-magnifying-glass"></i>
                                    </span>

                                    <!-- Ô nhập liệu -->
                                    <input
                                            type="text"
                                            class="form-control bg-transparent border-0"
                                            autocomplete="off"
                                            placeholder="Bạn có thể tìm kiếm tên Sản phẩm"
                                            value="${searchKeyword != null ? searchKeyword : ''}"
                                            name="searchKeyword"
                                    />

                                    <!-- Input ẩn khác -->
                                    <input type="hidden" name="action" value="search">
                                    <input type="hidden" name="userId" value="${userSession.getUid()}">
                                </div>
                            </form>
                        </div>
                    </section>
                    <!-- Kết thúc thanh tìm kiếm -->
                    <%--Kết thúc thanh tìm kiếm--%>

                    <c:if test="${empty invoices}">
                        <div class="m-5 text-center">
                            <p>Không có hóa đơn nào để hiển thị.</p>
                        </div>

                    </c:if>


                    <%--Danh sách đơn hàng --%>
                    <%--                    <jsp:useBean id="invoices" scope="request" type="java.util.List"/>--%>
                    <c:forEach var="invoice" items="${invoices}">
                        <!-- Thông tin hóa đơn -->
                        <div class="container-product-content-inner__right-inner-center-product">
                            <div>
                                <div class="container-product-content-inner__right-inner-center-product__header">
                                    <h3 class="container-product-content-inner__right-inner-center-product__header-title">
                                            ${invoice.getStatus()}
                                    </h3>

                                </div>
                                <!-- Lặp qua danh sách chi tiết hóa đơn -->
                                <section id="details-${invoice.invoiceId}">
                                    <c:forEach var="detail" items="${invoice.getListInvoiceDetails()}">
                                        <a href="<c:url value="/invoice?action=detail&id=${invoice.getInvoiceId()}"/>">
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
                                                <div class="content-inner__right-inner-infor__price" tabindex="0">
                                                    <span class="content-inner__right-inner-infor__price-text">
                                                        <f:formatNumber value="${detail.getUnitPrice()}"/>
                                                        <i class="fa-solid fa-dong-sign fa-xs"></i>
                                                    </span>
                                                </div>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </section>
                            </div>
                            <div class="container-product-content-inner__right-inner-center-product__header__empty"></div>

                            <!-- Hiển thị tổng giá tiền -->
                            <div class="right-inner-center-product__header__total-price">
                                <div class="right-inner-center-product__header__total-price-contain">
                                    <label class="right-inner-center-product__header__total-price-contain">
                                        Thành tiền:
                                    </label>
                                    <div class="right-inner-center-product__header__total-price-contain-cost"
                                         tabindex="0">
                                        <f:formatNumber value="${invoice.payment.amount}"/>
                                        <i class="fa-solid fa-dong-sign fa-xs"></i>
                                    </div>
                                </div>
                            </div>

                            <!-- Ngày và nút hành động -->
                            <div class="right-inner-center-product__header__date-and-rating d-flex justify-content-between align-items-center">
                                <div class="right-inner-center-product__header__date-contain">
                                    <c:choose>
                                        <c:when test="${invoice.status == 'Completed'}">
                                            <span class="date__text"
                                                  aria-label="Đánh giá sản phẩm trước ngày ${invoice.completionDate.plusDays(7)}"
                                                  tabindex="0">
                                                Đánh giá sản phẩm trước ngày: &nbsp;
                                                <div class="date-buy__text-date">
                                                    <u>${invoice.completionDate.plusDays(7)}</u>
                                                </div>
                                            </span>
                                        </c:when>

                                        <c:when test="${invoice.status == 'Pending'}">
                                            <span class="date__text">
                                                Trạng thái: Chờ xử lý
                                            </span>
                                        </c:when>
                                    </c:choose>
                                </div>


                                <section class="right-inner-center-product__header__rating">
                                    <c:choose>
                                        <c:when test="${invoice.status == 'Completed'}">
                                            <div class="right-inner-center-product__header__rating-vote">
                                                <div>
                                                    <button class="stardust-button stardust-button--primary"
                                                            style="background: #4B908E"
                                                            data-invoice-id="${invoice.getInvoiceId()}">
                                                        Đánh giá
                                                    </button>
                                                </div>
                                            </div>
                                            <%--ĐÁNH GIÁ SẢN PHẨM--%>
                                            <div id="overlay" class="overlay hidden"
                                                 data-invoice-id="${invoice.getInvoiceId()}">
                                                <form method="POST">
                                                    <input type="hidden" name="action" value="review">
                                                    <input type="hidden" name="invoiceId"
                                                           value="${invoice.getInvoiceId()}">
                                                    <input type="hidden" name="userId" value="${userSession.getUid()}">
                                                    <div class="rating-container">
                                                        <div style="display: contents">
                                                            <div>
                                                                <div class="rating-container-form">
                                                                    <div class="rating-container-form__header">
                                                                        <div class="rating-container-form-header-title">
                                                                            Đánh Giá Sản Phẩm
                                                                        </div>
                                                                    </div>


                                                                    <div class="rating-container-form__main">
                                                                        <c:forEach var="detail"
                                                                                   items="${invoice.getListInvoiceDetails()}">
                                                                            <div class="rating-container-form__main-container"
                                                                                 data-product-id="${detail.getbId()}">

                                                                                <div class="rating-infor rating-proc">
                                                                                    <div class="rating-infor__product">
                                                                                        <div class="rating-infor__product--img">
                                                                                            <img src="${detail.getBook().getImage().getSourceImg()}"
                                                                                                 alt="${detail.getBook().getTitle()}"
                                                                                                 class="img-product lazyload"
                                                                                                 width="60px"
                                                                                                 height="80px">
                                                                                        </div>
                                                                                        <div class="rating-infor__product--name">
                                                                                            <span class="rating-infor__product--name-text">
                                                                                                    ${detail.getBook().getTitle()}
                                                                                            </span>
                                                                                            <span class="rating-infor__product--quantity">x${detail.getQuantity()}</span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div style="margin: 20px 0px">
                                                                                    <div class="rating-infor__star">
                                                                                        <div class="rating-infor__star--text">
                                                                                            <span>Chất lượng sản phẩm</span>
                                                                                        </div>
                                                                                        <div class="rating-infor__star--container">
                                                                                            <span class="star"
                                                                                                  data-value="1"
                                                                                                  aria-label="1 star">
                                                                                                <i class="fas fa-star"
                                                                                                   style="color: #ccc"></i>
                                                                                            </span>
                                                                                            <span class="star"
                                                                                                  data-value="2"
                                                                                                  aria-label="2 stars">
                                                                                                <i class="fas fa-star"
                                                                                                   style="color: #ccc"></i>
                                                                                            </span>
                                                                                            <span class="star"
                                                                                                  data-value="3"
                                                                                                  aria-label="3 stars">
                                                                                                <i class="fas fa-star"
                                                                                                   style="color: #ccc"></i>
                                                                                            </span>
                                                                                            <span class="star"
                                                                                                  data-value="4"
                                                                                                  aria-label="4 stars">
                                                                                                <i class="fas fa-star"
                                                                                                   style="color: #ccc"></i>
                                                                                            </span>
                                                                                            <span class="star"
                                                                                                  data-value="5"
                                                                                                  aria-label="5 stars">
                                                                                                <i class="fas fa-star"
                                                                                                   style="color: #ccc"></i>
                                                                                            </span>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="rating-infor-cmt">
                                                                                    <div class="rating-infor-cmt-inner">
                                                                                        <div class="rating-infor-cmt-inner__wrap--description">
                                                                                            <textarea rows="3"
                                                                                                      placeholder="Hãy chia sẻ những điều bạn thích về sản phẩm này với những người mua khác nhé."
                                                                                                      class="rating-infor-cmt-inner--textarea"
                                                                                                      style="min-height: 100px"></textarea>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </c:forEach>
                                                                            <%--KẾT THÚC LẶP--%>
                                                                    </div>


                                                                    <div class="rating-container-form__footer">
                                                                        <button id="cancel-overlay"
                                                                                class="rating-cancel-btn">Trở lại
                                                                        </button>
                                                                        <button id="submit-overlay" type="submit"
                                                                                class="btn btn-solid-primary btn--s btn--inline rating-submit-btn ">
                                                                            Hoàn thành
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <%--KẾT THÚC ĐÁNH GIÁ SẢN PHẨM--%>
                                        </c:when>

                                        <c:when test="${invoice.status == 'Pending'}">
                                            <div class="right-inner-center-product__header__rating-cancel">
                                                <div>
                                                    <form action="<c:url value="/invoice?action=cancel"/>"
                                                          method="post" onsubmit="return confirm('Bạn có chắc muốn hủy đơn hàng này?');">
                                                        <input type="hidden" name="id"
                                                               value="${invoice.getInvoiceId()}">
                                                        <button type="submit"
                                                                class="stardust-button stardust-button--danger">
                                                            Hủy đơn hàng
                                                        </button>
                                                    </form>
                                                </div>
                                            </div>
                                        </c:when>
                                    </c:choose>
                                </section>
                            </div>
                        </div>


                    </c:forEach>
                    <%--KẾT THÚC LẶP--%>
                </div>
            </div>
        </div>
    </div>
</div>


<!--FOOTER-->
<jsp:include page="footer.jsp"></jsp:include>
<!--FOOTER-->
<!--jquery-->
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>

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
    document.addEventListener('DOMContentLoaded', function () {
        const hash = window.location.hash;
        if (hash) {
            const targetSection = document.querySelector(hash);
            if (targetSection) {
                targetSection.scrollIntoView({behavior: 'smooth'});
            }
        }
    });
</script>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        // Lấy tất cả các nút "Đánh giá"
        const reviewButtons = document.querySelectorAll(".stardust-button--primary");

        // Lấy tất cả các overlay
        const overlays = document.querySelectorAll(".overlay");

        // Hiển thị overlay khi bấm nút "Đánh giá"
        reviewButtons.forEach((button) => {
            button.addEventListener("click", () => {
                const invoiceId = button.getAttribute("data-invoice-id");
                console.log("invoiceId:", invoiceId);  // Kiểm tra giá trị invoiceId
                const overlay = document.querySelector('.overlay[data-invoice-id="' + invoiceId + '"]');
                console.log('.overlay[data-invoice-id=' + invoiceId + ']');
                if (overlay) {
                    overlay.classList.remove("hidden");
                } else {
                    console.log("Overlay không tìm thấy!");
                }
            });
        });

        // Đóng overlay khi bấm nút "Trở lại"
        overlays.forEach((overlay) => {
            const cancelButton = overlay.querySelector("#cancel-overlay");
            if (cancelButton) {
                cancelButton.addEventListener("click", (event) => {
                    event.preventDefault();
                    overlay.classList.add("hidden");
                });
            }
        });

        overlays.forEach((overlay) => {
            overlay.addEventListener("click", (event) => {
                if (event.target === overlay) {
                    overlay.classList.add("hidden");
                }
            });
        });

        // Xử lý logic chọn sao
        const ratingContainers = document.querySelectorAll(".rating-container-form__main-container");
        ratingContainers.forEach((container) => {
            const stars = container.querySelectorAll(".rating-infor__star--container .star");
            let selectedRating = 0;

            stars.forEach((star) => {
                // Xử lý hover để highlight sao
                star.addEventListener("mouseover", () => {
                    const value = parseInt(star.getAttribute("data-value"), 10);
                    highlightStars(stars, value);
                });

                // Xử lý hover out
                star.addEventListener("mouseout", () => {
                    highlightStars(stars, selectedRating); // Trả về trạng thái đã chọn
                });

                // Xử lý click để chọn sao
                star.addEventListener("click", () => {
                    selectedRating = parseInt(star.getAttribute("data-value"));
                    highlightStars(stars, selectedRating);
                    console.log("User selected rating:", selectedRating);
                });
            });
        });

        // Hàm highlight sao
        function highlightStars(stars, value) {
            stars.forEach((star) => {
                const starValue = parseInt(star.getAttribute("data-value"), 10);
                const icon = star.querySelector("i");
                if (starValue <= value) {
                    icon.style.color = "#ffcc00"; // Màu vàng khi được chọn
                    star.classList.add("selected");
                } else {
                    icon.style.color = "#ccc"; // Màu xám khi không được chọn
                    star.classList.remove("selected");
                }
            });
        }

        // Gửi đánh giá khi bấm nút "Hoàn thành"
        overlays.forEach((overlay) => {
            const submitButton = overlay.querySelector("#submit-overlay");
            if (submitButton) {
                submitButton.addEventListener("click", (event) => {
                    event.preventDefault();

                    const form = overlay.querySelector("form");
                    let invoiceId = form.querySelector("input[name='invoiceId']").value;
                    let userId = form.querySelector("input[name='userId']").value;

                    const reviews = [];
                    const reviewContainers = form.querySelectorAll(".rating-container-form__main-container");
                    reviewContainers.forEach((container) => {
                        let productId = container.getAttribute("data-product-id");
                        let selectedStars = container.querySelectorAll(".rating-infor__star--container .star.selected");
                        let comment = container.querySelector("textarea").value;

                        // Kiểm tra nếu có sao nào được chọn
                        if (selectedStars.length > 0) {
                            // Lấy giá trị "data-value" lớn nhất từ các sao đã chọn
                            const maxRating = Math.max(...Array.from(selectedStars).map(star => parseInt(star.getAttribute("data-value"), 10)));

                            // Thêm vào mảng reviews
                            reviews.push({
                                productId: parseInt(productId, 10),
                                rating: maxRating, // Sử dụng sao lớn nhất
                                comment: comment.trim(),
                            });
                        }
                    });

                    console.log(reviews);
                    const reviewsString = JSON.stringify(reviews);

                    if (reviews.length > 0) {
                        // Gửi yêu cầu AJAX để lưu đánh giá
                        $.ajax({
                            // fix thêm chỗ truyền tham số invoiceId và userId
                            url: '/Bookstore/submitReview?&action=' +'review' + '&invoiceId=' + invoiceId + '&userId=' + userId, // URL backend để xử lý việc lưu đánh giá
                            type: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify({
                                userId: userId,
                                invoiceId: invoiceId,
                                reviews: reviews // Mảng reviews đã được stringify
                            }),
                            success: function (data) {
                                Swal.fire({
                                    position: "center",
                                    icon: "success",
                                    title: "Đánh giá thành công!",
                                    fontsize: 20,
                                    showConfirmButton: false,
                                    width: 300,
                                    height: 50,
                                    timer: 1000
                                });
                                overlay.classList.add("hidden"); // Đóng overlay sau khi gửi đánh giá thành công
                            },
                            error: function (data) {
                                Swal.fire({
                                    position: "center",
                                    icon: "success",
                                    title: "Đánh giá thành công!",
                                    fontsize: 20,
                                    showConfirmButton: false,
                                    width: 300,
                                    height: 50,
                                    timer: 1000
                                });
                                const reviewButton = document.querySelector('button.stardust-button--primary[data-invoice-id="' + invoiceId + '"]');
                                reviewButton.classList.add("hidden");
                            }
                        });
                    } else if (!Array.isArray(reviews) || reviews.length === 0) {
                        Swal.fire({
                            position: "center",
                            icon: "warning",
                            title: "Vui lòng đánh giá ít nhất một sản phẩm!",
                            fontsize: 20,
                            showConfirmButton: false,
                            width: 300,
                            height: 50,
                            timer: 1000
                        });
                    }
                });
            }
        });
    });
</script>

</body>
</html>
