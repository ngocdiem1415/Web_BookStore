<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:17 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chi tiết sản phẩm</title>

    <!--    font awesome-->
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">

    <!--    bootstrap-->
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">
    <!--jquery-->
    <script src="js/jquery.min.js"></script>

    <!--    CSS-->
    <link rel="stylesheet" href="css/ProductDetail.css">
    <link rel="stylesheet" href="css/Header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/Style.css">
    <script src="js/bootstrap.bundle.min.js"></script>

</head>
<body>
<!--Header-->
<jsp:include page="Header.jsp"></jsp:include>


<!--Product detail content-->
<div class="container_productDetail mx-4">
    <!--Thanh điều hướng-->
    <div class="breadcrumbNAV ">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb bg-white shadow p-3">
                <li class="breadcrumb item">
                    <!-- Liên kết đến trang chủ -->
                    <a href="home" class="itemNAV btn btn-link p-0 m-0 " style="border: none; background: none;">Trang
                        chủ</a>
                    <span class="fas fa-chevron-right text-muted mx-3" style="font-size: inherit"></span>
                </li>
                <li class="breadcrumb item">
                    <!-- Liên kết đến trang danh mục sách -->
                    <a href="/listBook" class="itemNAV btn btn-link p-0 m-0"
                       style="border: none; background: none;">Sách</a>
                    <span class="fas fa-chevron-right text-muted mx-3"></span>
                </li>
                <li class="breadcrumb item active" aria-current="page">
                    <!-- Tên danh mục sách -->
                    <c:if test="${not empty book}">
                        ${book.title}
                    </c:if>
                </li>
            </ol>
        </nav>
    </div>
    <section class="product py-5">
        <div class="row m-0">
            <!-- Ảnh sản phẩm -->
            <aside class="col-md-5 col-12">
                <!-- Thumbnail (Ảnh lớn) -->
                <div class="rounded-4 d-flex justify-content-center">
                    <img id="mainImage" style="width: 100%; height: 100vh; margin: auto;" class="rounded-4 fit"
                         src="${book.image.sourceImg}" alt="${book.title}"/>
                </div>

                <!-- Ảnh chi tiết -->
                <div class="border rounded-4 d-flex justify-content-center m-3 p-2" style="border: 1px solid #ddd;">
                    <c:forEach var="image" items="${book.imageList}">
                        <div class="item-thumb mx-2">
                            <img width="60" height="60" class="rounded-2" style="object-fit: cover; cursor: pointer"
                                 src="${image.sourceImg}" alt="${book.title}"
                                 onclick="updateMainImage('${image.sourceImg}')"/>
                        </div>
                    </c:forEach>
                </div>
            </aside>

            <!-- Product's information -->
            <main class="col-md-7 col-12">
                <div>
                    <!-- Title -->
                    <h4 class="title text-dark">
                        ${book.getTitle()}
                    </h4>
                    <div class="d-flex flex-row my-3">

                        <!-- Xếp hạng -->
                        <div id="average-rating" class="text-warning mb-1 me-2">
                            <span id="average-rating-value" class="ms-1">
                                <f:formatNumber value="${book.rating}" type="number" maxFractionDigits="1"/>
                            </span>
                            <span class="star" data-value="1"><i class="fa fa-star"></i></span>
                            <span class="star" data-value="2"><i class="fa fa-star"></i></span>
                            <span class="star" data-value="3"><i class="fa fa-star"></i></span>
                            <span class="star" data-value="4"><i class="fa fa-star"></i></span>
                            <span class="star" data-value="5"><i class="fa fa-star"></i></span>
                        </div>

                        <!-- Lượt mua -->
                        <span class="text-muted"><i
                                class="fas fa-shopping-basket fa-sm mx-1"></i>Đã bán ${book.soldQuantity}</span>
                        <!-- Tình trạng -->
                        <span class="text-success ms-2">${book.stockQuantity > 0 ? "Còn hàng" : "Hết hàng"}</span>
                    </div>

                    <!-- Giá tiền -->
                    <div class="mb-3 text-danger ps-3 d-flex align-items-center">

                        <!-- Nếu có khuyến mãi -->
                        <c:if test="${not empty book.promotion}">
                            <!-- Giá đã giảm -->
                            <div class="h4 d-flex align-items-center justify-content-center text-center">
                                <span class="unit-price"><f:formatNumber value="${book.salePrice}"/></span>
                                <i class="fa-solid fa-dong-sign fa-xs"></i>
                            </div>

                            <!-- Giá gốc gạch ngang -->
                            <div class="d-flex align-items-center justify-content-center text-center h4 small text-muted text-decoration-line-through ms-2">
                                <span class="original-price"><f:formatNumber value="${book.originalPrice}"/></span>
                                <i class="fa-solid fa-dong-sign fa-xs"></i>
                            </div>

                            <!-- Thông tin khuyến mãi -->
                            <span class="h5 small bg-danger text-white me-2 px-2 py-1 rounded ms-2">
                                    ${book.promotion.promotionName}
                            </span>
                        </c:if>

                        <!-- Nếu không có khuyến mãi: chỉ hiện giá gốc -->
                        <c:if test="${empty book.promotion}">
                            <div class="h4 d-flex align-items-center justify-content-center text-center">
                                <span class="original-price"><f:formatNumber value="${book.originalPrice}"/></span>
                                <i class="fa-solid fa-dong-sign fa-xs"></i>
                            </div>
                        </c:if>
                    </div>

                    <p style="display: -webkit-box; -webkit-line-clamp: 3; -webkit-box-orient: vertical; overflow: hidden; text-overflow: ellipsis">
                        ${book.description}
                    </p>
                    <hr/>

                    <!-- Số lượng, Mua ngay, Thêm vào giỏ hàng -->
                    <div class="row mb-1 text-muted">
                        <label class="pt-1 d-block col-2">Số lượng</label>
                        <%--                        <div class="input-group mb-3 col-6" style="width: 170px;">--%>
                        <%--                            <button class="btn btn-white border border-secondary px-3" type="button" id="decrease"--%>
                        <%--                                    data-mdb-ripple-color="dark">--%>
                        <%--                                <i class="fas fa-minus"></i>--%>
                        <%--                            </button>--%>
                        <%--                            <input type="text" id="quantity" class="form-control text-center border border-secondary"--%>
                        <%--                                   placeholder="1" value="1" aria-label="Example text with button addon"--%>
                        <%--                                   aria-describedby="button-addon1"/>--%>
                        <%--                            <button class="btn btn-white border border-secondary px-3" type="button" id="increase"--%>
                        <%--                                    data-mdb-ripple-color="dark">--%>
                        <%--                                <i class="fas fa-plus"></i>--%>
                        <%--                            </button>--%>
                        <%--                        </div>--%>
                        <!-- Nếu hết hàng -->
                        <div class="input-group mb-3 col-6" style="width: 170px;">
                            <button class="btn btn-white border border-secondary px-3 ${book.stockQuantity == 0 ? 'disabled-btn' : ''}"
                                    type="button" id="decrease"
                            ${book.stockQuantity == 0 ? 'disabled' : ''}
                                    data-mdb-ripple-color="dark">
                                <i class="fas fa-minus"></i>
                            </button>

                            <input type="text" id="quantity" class="form-control text-center border border-secondary"
                                   value="${book.stockQuantity == 0 ? 0 : 1}"
                            ${book.stockQuantity == 0 ? 'readonly' : ''}
                                   aria-label="Example text with button addon"
                                   aria-describedby="button-addon1"/>

                            <button class="btn btn-white border border-secondary px-3 ${book.stockQuantity == 0 ? 'disabled-btn' : ''}"
                                    type="button" id="increase"
                            ${book.stockQuantity == 0 ? 'disabled' : ''}
                                    data-mdb-ripple-color="dark">
                                <i class="fas fa-plus"></i>
                            </button>
                        </div>


                        <!-- Số lượng hàng tồn kho -->
                        <label class="pt-1 d-block col-3">
                            <span id="stock-quantity"> ${book.stockQuantity}</span>
                            sản phẩm có sẵn
                        </label>
                    </div>

                    <!-- Mua ngay -->
                    <c:if test="${not empty userSession and book.stockQuantity > 0}">
                        <a href="cart" id="buy-now" class="btn btn-danger border border-secondary py-2 "
                           style="background-color: red" onclick="addToCart()">
                            Mua ngay </a>
                    </c:if>

                    <c:if test="${empty userSession or book.stockQuantity == 0}">
                        <a href="cart" id="buy-now" class="btn btn-danger border border-secondary py-2 "
                           style="background-color: #b02a37; pointer-events: none;" onclick="addToCart(${book.bId})">
                            Mua ngay </a>
                    </c:if>

                    <!-- Thêm vào giỏ hàng -->
                    <c:if test="${empty userSession and book.stockQuantity > 0}">
                        <button id="add-to-cart" class="btn btn-success border border-secondary py-2 disabled-btn"
                                disabled>
                            <i class="me-1 fa fa-shopping-basket"></i> Thêm vào giỏ hàng
                        </button>
                    </c:if>

                    <c:if test="${not empty userSession or book.stockQuantity == 0}">
                        <button id="add-to-cart" class="btn btn-success border border-secondary py-2"
                                onclick="addToCart(${book.bId})">
                            <i class="me-1 fa fa-shopping-basket"></i> Thêm vào giỏ hàng
                        </button>
                    </c:if>

                    <div id="cart-notification-success" style="display: none; z-index: 1050; opacity: 0.9;"
                         class="alert alert-success text-center position-fixed start-50 top-50 translate-middle">
                        Sản phẩm đã được thêm vào giỏ hàng!
                    </div>
                    <div id="cart-notification-error" style="display: none; z-index: 1050; opacity: 0.9;"
                         class="alert alert-success text-center position-fixed start-50 top-50 translate-middle">
                        Không thể thêm sản phẩm vào giỏ hàng!
                    </div>

                    <!-- Yêu thích -->
                    <c:if test="${empty userSession}">
                        <button id="favourite" class="btn btn-success border border-secondary py-2 disabled-btn"
                                disabled>
                            <i class="fa-regular fa-heart fa-beat-fade"></i>
                        </button>
                    </c:if>

                    <c:if test="${not empty userSession}">
                        <button id="favourite" class="btn btn-light border border-secondary py-2 px-3">
                            <i class="fa-regular fa-heart fa-beat-fade"></i>
                        </button>
                    </c:if>
                </div>
            </main>
        </div>
    </section>


</div>

<!--Thông tin chi tiết-->
<section class="product-detail bg-light border-top">
    <div class="row m-0 my-4">
        <div class="col-8">
            <div class="border rounded-2 px-3 py-2 bg-white">
                <!-- Pills navs -->
                <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
                    <li class="nav-item d-flex" role="presentation">
                        <a class="nav-link d-flex align-items-center justify-content-start w-100"
                           id="ex1-tab-1" data-mdb-toggle="pill" href="#ex1-pills-1" role="tab"
                           aria-controls="ex1-pills-1" aria-selected="true"
                           style="font-weight: 500; font-size: 1.2rem; padding: 0; color: black">
                            CHI TIẾT SẢN PHẨM
                        </a>
                    </li>
                </ul>

                <!-- Pills content -->
                <div class="tab-content" id="ex1-content">
                    <div class="tab-pane fade show active" id="ex1-pills-1" role="tabpanel"
                         aria-labelledby="ex1-tab-1">
                        <table class="table border mt-3 mb-2">
                            <tr>
                                <th class="py-2">Tác giả:</th>
                                <td class="py-2">${book.author}</td>
                            </tr>
                            <tr>
                                <th class="py-2">NXB:</th>
                                <td class="py-2">${book.publisher.p_name}</td>
                            </tr>
                            <tr>
                                <th class="py-2">Năm XB:</th>
                                <td class="py-2">${book.publishYear}</td>
                            </tr>
                            <tr>
                                <th class="py-2">Kích thước:</th>
                                <td class="py-2">${book.dimensions}</td>
                            </tr>
                            <tr>
                                <th class="py-2">Trong lượng (gr):</th>
                                <td class="py-2">${book.weight}</td>
                            </tr>
                            <tr>
                                <th class="py-2">Số trang:</th>
                                <td class="py-2">${book.pageCount}</td>
                            </tr>
                            <tr>
                                <th class="py-2">Hình thức:</th>
                                <td class="py-2">${book.format}</td>
                            </tr>
                        </table>

                    </div>
                </div>
                <!-- Pills content -->
                <a class="nav-link d-flex align-items-center justify-content-start w-100"
                   id="ex1-tab-2" data-mdb-toggle="pill" href="#ex1-pills-1" role="tab"
                   aria-controls="ex1-pills-1" aria-selected="true"
                   style="font-weight: 500; font-size: 1.2rem; padding: 0; color: black">
                    MÔ TẢ SẢN PHẨM
                </a>

                <div id="content" class="content-limited mt-2">
                    <c:forEach var="paragraph" items="${paragraphs}">
                        <p>${paragraph}</p>
                    </c:forEach>
                </div>
                <!--nút xem thêm-->
                <button id="toggleContent">Xem thêm</button>
            </div>
        </div>
        <!--Các sản phẩm khác-->
        <div class="col-4">
            <div class="px-0 border rounded-2 shadow-0">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title mb-3">Sản phẩm liên quan</h5>
                        <c:forEach var="relatedBook" items="${relatedBooks}">
                            <div class="d-flex mb-3">
                                <a href="book-detail?id=${relatedBook.bId}" class="me-3">
                                    <img src="${relatedBook.image != null ? relatedBook.image.sourceImg : 'default-image.jpg'}"
                                         style="min-width: 96px; height: 96px;" class="img-md img-thumbnail"/>
                                </a>
                                <div class="info">
                                    <a href="book-detail?id=${relatedBook.bId}" class="nav-link mb-1">
                                            ${relatedBook.title}
                                    </a>

                                    <div class="mb-3 text-danger d-flex align-items-center">

                                        <!-- Nếu có khuyến mãi -->
                                        <c:if test="${not empty relatedBook.promotion}">
                                            <!-- Giá đã giảm -->
                                            <div class="d-flex align-items-center justify-content-center text-center">
                                                <strong class="unit-price fw-semibold">
                                                    <f:formatNumber value="${relatedBook.salePrice}"/>
                                                </strong>
                                                <i class="fa-solid fa-dong-sign fa-xs"></i>
                                            </div>

                                            <!-- Giá gốc gạch ngang -->
                                            <div class="d-flex align-items-center justify-content-center text-center small text-muted text-decoration-line-through ms-2">
                                                <span class="original-price">
                                                    <f:formatNumber value="${relatedBook.originalPrice}"/>
                                                </span>
                                                <i class="fa-solid fa-dong-sign fa-xs"></i>
                                            </div>

                                            <!-- Tên chương trình khuyến mãi -->
                                            <span class="small bg-danger text-white me-2 px-2 py-1 rounded ms-2">
                                                    ${relatedBook.promotion.promotionName}
                                            </span>
                                        </c:if>

                                        <!-- Nếu không có khuyến mãi -->
                                        <c:if test="${empty relatedBook.promotion}">
                                            <div class="d-flex align-items-center justify-content-center text-center">
                                                <strong class="unit-price fw-semibold">
                                                    <f:formatNumber value="${relatedBook.originalPrice}"/>
                                                </strong>
                                                <i class="fa-solid fa-dong-sign fa-xs"></i>
                                            </div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!--Đánh giá sản phẩm-->
<section class="bg-light border-top py-4">
    <div class="container-fluid">
        <div class="row gx-4">
            <div class="border rounded-2 px-3 py-2 bg-white">
                <div class="comment_content">
                    <a class="nav-link d-flex align-items-center justify-content-start w-100 mt-2"
                       id="ex1-tab-3" data-mdb-toggle="pill" href="#ex1-pills-1" role="tab"
                       aria-controls="ex1-pills-1" aria-selected="true"
                       style="font-weight: 500; font-size: 1.2rem; padding: 0; color: black">
                        ĐÁNH GIÁ SẢN PHẨM
                    </a>
                    <c:choose>
                        <c:when test="${not empty book.getReviewList()}">
                            <ul class="comment-list">
                                <c:forEach var="review" items="${book.getReviewList()}">
                                    <li class="my-4 row">
                                        <!-- Khách hàng -->
                                        <div class="comment-header col-2 d-flex align-items-start">
                                            <div style="width: 50px; height: 50px; border-radius: 50%; overflow: hidden; flex-shrink: 0; box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2);"
                                                 class="me-3">
                                                <img src="${review.getUser().getAvatar()}" alt="avatar"
                                                     style="width: 100%; height: 100%; object-fit: cover; display: block;">
                                            </div>
                                            <div>
                                                <div class="comment-date">${review.getReviewDate()}</div>
                                            </div>
                                        </div>

                                        <!-- Rating và Comment -->
                                        <div class="comment-content col-10">
                                            <div class="user-name text-info">
                                                    ${review.getUser().getUsername()}
                                            </div>
                                            <div class="rating-box">
                                                <div class="review-rating text-warning me-2">
                                                    <span class="review-rating-value">${review.getRating()}</span>
                                                    <span class="review-star" data-value="1"><i class="fa fa-star"></i></span>
                                                    <span class="review-star" data-value="2"><i class="fa fa-star"></i></span>
                                                    <span class="review-star" data-value="3"><i class="fa fa-star"></i></span>
                                                    <span class="review-star" data-value="4"><i class="fa fa-star"></i></span>
                                                    <span class="review-star" data-value="5"><i class="fa fa-star"></i></span>
                                                </div>
                                            </div>
                                            <div>
                                                    ${review.getComment()}
                                            </div>
                                        </div>
                                    </li>
                                </c:forEach>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <p>Không có đánh giá nào cho sách này.</p>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</section>
<!--Footer-->
<jsp:include page="footer.jsp"></jsp:include>
<!-- /FOOTER -->


<script>
    function updateMainImage(src) {
        const main = document.getElementById('mainImage');
        main.src = src;
    }
</script>

<!--Script chọn ảnh thumbnail-->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Kiểm tra xem các phần tử item-thumb có tồn tại không
        const itemThumbs = document.querySelectorAll('.item-thumb');

        // Lắng nghe sự kiện click trên mỗi ảnh chi tiết
        itemThumbs.forEach(item => {
            item.addEventListener('click', function (e) {
                e.preventDefault();  // Ngừng hành động mặc định của thẻ <a>

                // Lấy đường dẫn ảnh mới từ thuộc tính data-image-src
                const newImageSrc = this.getAttribute('data-image-src');

                // Kiểm tra xem thuộc tính data-image-src có tồn tại không
                if (newImageSrc) {
                    // Thay đổi ảnh chính trong phần thumbnail
                    const mainImage = document.getElementById('mainImage');

                    // Kiểm tra nếu phần tử mainImage tồn tại
                    if (mainImage) {
                        mainImage.src = newImageSrc;
                    } else {
                        console.error("Không tìm thấy phần tử ảnh chính (id: mainImage).");
                    }
                } else {
                    console.error("Không tìm thấy thuộc tính 'data-image-src' trên ảnh chi tiết.");
                }
            });
        });
    });
</script>
<!--Script xếp hạng-->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        const ratingText = document.getElementById("average-rating-value").textContent.trim();
        const ratingValue = Math.round(parseFloat(ratingText)); // Làm tròn giá trị rating
        const stars = document.querySelectorAll("#average-rating .star");
        highlightStars(stars, ratingValue);

        const ratingBoxes = document.querySelectorAll(".review-rating");
        ratingBoxes.forEach(box => {
            const reviewRatingValue = parseFloat(box.querySelector(".review-rating-value").innerText.trim());
            const reviewStars = box.querySelectorAll(".review-star");
            highlightStars(reviewStars, reviewRatingValue);
        });
    });

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
</script>
<!--format tiền tệ-->
<script src="js/FormatMoney.js"></script>

<!--Script tăng giảm số lượng-->
<script>
    const decreaseButton = document.getElementById("decrease");
    const increaseButton = document.getElementById("increase");
    const quantityInput = document.getElementById("quantity");
    const stockQuantity = parseInt(document.getElementById("stock-quantity").textContent);

    decreaseButton.addEventListener("click", function () {
        let currentValue = parseInt(quantityInput.value);
        if (currentValue > 1) {
            quantityInput.value = currentValue - 1;
        }
    });

    increaseButton.addEventListener("click", function () {
        let currentValue = parseInt(quantityInput.value);
        if (currentValue < stockQuantity)
            quantityInput.value = currentValue + 1;
    });

    // Giới hạn số lượng nhập trực tiếp
    quantityInput.addEventListener('input', () => {
        let currentQuantity = parseInt(quantityInput.value);

        // Kiểm tra giá trị nhập vào
        if (isNaN(currentQuantity) || currentQuantity < 1) {
            quantityInput.value = 1; // Nếu giá trị nhỏ hơn 1, đặt về 1
        } else if (currentQuantity > stockQuantity) {
            quantityInput.value = stockQuantity; // Nếu vượt quá hàng tồn kho, đặt về số hàng tồn
        }
    });
</script>
<!--Script thêm vào giỏ hàng-->
<script>
    function addToCart() {
        let id = '${book.bId}';
        let quantity = $('#quantity').val();
        const cartNotifications = document.getElementById('cart-notification-success');
        const cartNotificatione = document.getElementById('cart-notification-error');
        $.ajax({
            url: 'add-cart?id=' + id + '&quantity=' + quantity,
            type: 'GET',
            success: function (data) {
                cartNotifications.style.display = 'block';
                // Ẩn thông báo sau 2 giây
                setTimeout(() => {
                    cartNotifications.style.display = 'none';
                }, 2000);
            },
            error: function (data) {
                cartNotifications.style.display = 'block';

                // Ẩn thông báo sau 2 giây
                setTimeout(() => {
                    cartNotifications.style.display = 'none';
                }, 2000);
            }
        });
    }
</script>

<!--Script yêu thích-->
<script>
    const favouriteButton = document.getElementById('favourite');

    // Xử lý sự kiện khi nhấn nút
    favouriteButton.addEventListener('click', () => {
        const icon = favouriteButton.querySelector('i');

        // Kiểm tra xem nút đã được yêu thích chưa
        if (icon.classList.contains('fa-regular')) {
            // Chuyển sang trạng thái đã yêu thích
            icon.classList.remove('fa-regular', 'fa-heart');
            icon.classList.add('fa-solid', 'fa-heart');

            // Thay đổi màu sắc và nền của nút
            favouriteButton.style.backgroundColor = '#B8D7D5'; // Màu xanh nhạt
            icon.style.color = 'red'; // Màu đỏ cho trái tim
        } else {
            // Chuyển lại về trạng thái chưa yêu thích
            icon.classList.remove('fa-solid', 'fa-heart');
            icon.classList.add('fa-regular', 'fa-heart');

            // Trở lại màu nền và màu biểu tượng ban đầu
            favouriteButton.style.backgroundColor = ''; // Trở về màu nền ban đầu
            icon.style.color = ''; // Trở về màu ban đầu
        }
    });
</script>
<!--Script xem thêm-->
<script>
    document.getElementById('toggleContent').addEventListener('click', function () {
        const content = document.getElementById('content');
        const isLimited = content.classList.toggle('content-limited');

        if (isLimited) {
            this.textContent = 'Xem thêm';
        } else {
            this.textContent = 'Thu gọn';
        }
    });
</script>
</body>
</html>
