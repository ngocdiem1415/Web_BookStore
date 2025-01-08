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
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <title>Đơn hàng</title>

    <%--Font Awesome--%>
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">

    <%--CSS--%>
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/Header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/purchaseOrder.css">

    <%--Boostrap--%>
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">
    <script src="js/bootstrap.bundle.min.js"></script>

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

                            <a href="<c:url value="/invoice?action=filterByStatus&status=canceled&userId=${userSession.getUid()}"/>"
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
                                                        <fmt:formatNumber value="${detail.getUnitPrice()}"
                                                                          type="currency" currencySymbol="đ"/>
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
                                        <fmt:formatNumber value="${invoice.payment.amount}" type="currency"
                                                          currencySymbol="đ"/>
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
                                                            style="background: #4B908E">
                                                        Đánh giá
                                                    </button>
                                                </div>
                                            </div>
                                        </c:when>

                                        <c:when test="${invoice.status == 'Pending'}">
                                            <div class="right-inner-center-product__header__rating-cancel">
                                                <div>
                                                    <form action="<c:url value="/invoice?action=cancel"/>"
                                                          method="post">
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

                        <%--ĐÁNH GIÁ SẢN PHẨM--%>
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
                                                    <c:forEach var="detail" items="${invoice.getListInvoiceDetails()}">
                                                        <div class="rating-infor rating-proc">
                                                            <div class="rating-infor__product">
                                                                <div class="rating-infor__product--img">
                                                                    <img src="${detail.getBook().getImage().getSourceImg()}"
                                                                         alt="${detail.getBook().getTitle()}"
                                                                         class="img-product lazyload"
                                                                         width="60px" height="80px">
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
                                                                    <button class="btn star" data-value="1" aria-label="1 star">
                                                                        <i class="fas fa-star"></i>
                                                                    </button>
                                                                    <button class="btn star" data-value="2" aria-label="2 stars">
                                                                        <i class="fas fa-star"></i>
                                                                    </button>
                                                                    <button class="btn star" data-value="3" aria-label="3 stars">
                                                                        <i class="fas fa-star"></i>
                                                                    </button>
                                                                    <button class="btn star" data-value="4" aria-label="4 stars">
                                                                        <i class="fas fa-star"></i>
                                                                    </button>
                                                                    <button class="btn star" data-value="5" aria-label="5 stars">
                                                                        <i class="fas fa-star"></i>
                                                                    </button>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="rating-infor-cmt">
                                                            <div class="rating-infor-cmt-inner">
                                                                <div class="rating-infor-cmt-inner__wrap--description">
                                                                    <textarea rows="3"
                                                                              placeholder="Hãy chia sẻ những điều bạn thích về sản phẩm này với những người mua khác nhé."
                                                                              class="rating-infor-cmt-inner--textarea"
                                                                              style="min-height: 100px; color: rgba(0,0,0,0.87)"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                    <%--KẾT THÚC LẶP--%>
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
                        <%--KẾT THÚC ĐÁNH GIÁ SẢN PHẨM--%>
                    </c:forEach>
                    <%--KẾT THÚC LẶP--%>
                </div>
            </div>
        </div>
    </div>
</div>


<!--FOOTER-->
<
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

<%--<!--js hidden-->--%>
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

<%--Rating star--%>
<script>
    document.addEventListener("DOMContentLoaded", () => {
        const stars = document.querySelectorAll(".rating-infor__star--container .star");
        let selectedRating = 0;

        stars.forEach((star) => {
            // Xử lý hover
            star.addEventListener("mouseover", () => {
                const value = parseInt(star.getAttribute("data-value"));
                highlightStars(value);
            });

            // Xử lý hover out
            star.addEventListener("mouseout", () => {
                highlightStars(selectedRating); // Trả về trạng thái đã chọn
            });

            // Xử lý click để chọn sao
            star.addEventListener("click", () => {
                selectedRating = parseInt(star.getAttribute("data-value"));
                highlightStars(selectedRating);
                console.log("User selected rating:", selectedRating);
            });
        });

        function highlightStars(value) {
            stars.forEach((star) => {
                const starValue = parseInt(star.getAttribute("data-value"));
                if (starValue <= value) {
                    star.classList.add("selected");
                } else {
                    star.classList.remove("selected");
                }
            });
        }
    });

</script>
<%--<script>--%>
<%--    document.addEventListener("DOMContentLoaded", function () {--%>
<%--        const reviewButton = document.querySelector(".stardust-button--primary"); // Nút "Đánh giá"--%>
<%--        const overlay = document.getElementById("overlay"); // Overlay--%>
<%--        const cancelButton = document.getElementById("cancel-overlay"); // Nút "Trở lại"--%>
<%--        const submitButton = document.getElementById("submit-overlay"); // Nút "Hoàn thành"--%>

<%--        const ratingStars = document.querySelectorAll('.rating-infor__star--star'); // Đánh giá sao--%>
<%--        const commentTextarea = document.querySelector('textarea[placeholder="Hãy chia sẻ những điều bạn thích về sản phẩm này với những người mua khác nhé."]'); // Nội dung bình luận--%>
<%--        const productId = 1; // ID sách, ví dụ: bạn cần lấy ID sách từ DOM hoặc JavaScript--%>
<%--        const userId = 123; // ID người dùng, ví dụ: lấy từ session--%>

<%--        let rating = 0; // Lưu điểm sao đánh giá--%>

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
<%--            // Lấy thông tin đánh giá--%>
<%--            const comment = commentTextarea.value.trim();--%>

<%--            if (rating > 0 && comment.length > 0) {--%>
<%--                // Tạo đối tượng review--%>
<%--                const review = {--%>
<%--                    userId: userId,--%>
<%--                    bookId: productId,--%>
<%--                    invoiceId: 12345, // ID hóa đơn, cần lấy từ session hoặc từ cơ sở dữ liệu--%>
<%--                    rating: rating,--%>
<%--                    comment: comment--%>
<%--                };--%>

<%--                // Gửi yêu cầu AJAX tới ReviewController--%>
<%--                fetch('/submitReview', {--%>
<%--                    method: 'POST',--%>
<%--                    headers: {--%>
<%--                        'Content-Type': 'application/json'--%>
<%--                    },--%>
<%--                    body: JSON.stringify(review)--%>
<%--                })--%>
<%--                    .then(response => response.json())--%>
<%--                    .then(data => {--%>
<%--                        if (data.success) {--%>
<%--                            console.log("Đánh giá đã gửi thành công!");--%>
<%--                            overlay.classList.add("hidden"); // Ẩn overlay--%>
<%--                        } else {--%>
<%--                            console.log("Có lỗi xảy ra khi gửi đánh giá.");--%>
<%--                        }--%>
<%--                    })--%>
<%--                    .catch(error => {--%>
<%--                        console.error("Lỗi khi gửi yêu cầu:", error);--%>
<%--                    });--%>
<%--            } else {--%>
<%--                alert("Vui lòng chọn sao và nhập bình luận.");--%>
<%--            }--%>
<%--        });--%>

<%--        // Ẩn overlay khi nhấn ra ngoài overlay--%>
<%--        overlay.addEventListener("click", (event) => {--%>
<%--            if (event.target === overlay) {--%>
<%--                overlay.classList.add("hidden");--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>
<%--</script>--%>


</body>
</html>
