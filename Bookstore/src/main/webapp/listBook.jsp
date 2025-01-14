<%--
  Created by IntelliJ IDEA.
  User: ngocd
  Date: 12/21/2024
  Time: 10:28 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Category</title>

    <!--    all css files-->
    <link rel="stylesheet" href="css/category.css">
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/Header.css">
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">

</head>
<body>
<!--Header-->
<jsp:include page="Header.jsp"></jsp:include>
<!-- /HEADER -->

<!--content-->
<div class="app__container">
    <!--    head -->
    <div class="grid__head">
        <div class="head">
            <h2 class="head__title">Tất cả sách</h2>
            <div class="head-filter">
                <p>Ưu tiên xem:</p>
                <ul class="head-filter__list">
                    <li class="head-filter__item">
                        <a href="" class="head-filter__link" title="Hàng mới nhất">Hàng mới nhất</a>
                    </li>
                    <li class="head-filter__item">
                        <a href="" class="head-filter__link" title="Hàng cũ nhất">Hàng cũ nhất</a>
                    </li>
                    <li class="head-filter__item">
                        <a href="" class="head-filter__link" title="Giá tăng dần">Giá tăng dần</a>
                    </li>
                    <li class="head-filter__item">
                        <a href="" class="head-filter__link" title="Giá giảm dần">Giá giảm dần</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--        category and product-->
    <div class="grid">
        <div class="grid__row-left">
            <div class="col-md-2">
                <nav class="category">
                    <div class="category-form">
                        <h4 class="category__heading">Nhà xuất bản</h4>
                        <div class="category-scroll">
                            <div class="category-inform">
                                <c:forEach var="publisher" items="${publishers}">
                                    <div class="category-item">
                                        <input type="checkbox" id="${publisher.p_id}" name="publisher"
                                               value="${publisher.p_id}">
                                        <label class="checkbox-label"
                                               for="${publisher.p_id}">${publisher.p_name}</label>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="category-form">
                        <h4 class="category__heading">Loại sách</h4>
                        <div class="category-inform">
                            <c:forEach var="category" items="${categories}">
                                <div class="category-item">
                                    <input type="checkbox" id="${category.categoryId}" name="category"
                                           value="${category.categoryId}">
                                    <label class="checkbox-label"
                                           for="${category.categoryId}">${category.category_name}</label>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    <div class="category-form">
                        <h4 class="category__heading">Giá cả</h4>
                        <div class="category-inform">
                            <input type="checkbox" id="100k">
                            <label class="checkbox-label" for="100k">Giá dưới 100.000đ</label>
                        </div>

                        <div class="category-inform">
                            <input type="checkbox" id="200k">
                            <label class="checkbox-label" for="200k">100.000đ - 200.000đ</label>
                        </div>

                        <div class="category-inform">
                            <input type="checkbox" id="300k">
                            <label class="checkbox-label" for="300k">200.000đ - 300.000đ</label>
                        </div>

                        <div class="category-inform">
                            <input type="checkbox" id="500k">
                            <label class="checkbox-label" for="500k">300.000đ - 500.000đ</label>
                        </div>

                        <div class="category-inform">
                            <input type="checkbox" id="1000k">
                            <label class="checkbox-label" for="1000k">500.000đ - 1.000.000đ</label>
                        </div>

                        <div class="category-inform">
                            <input type="checkbox" id="hon1tr">
                            <label class="checkbox-label" for="hon1tr">Giá trên 1.000.000đ</label>
                        </div>
                    </div>
                    <div class="category-form">
                        <h4 class="category__heading">Đánh Giá Sao</h4>
                        <div class="category-inform">
                            <input type="radio" id="star-1" name="rating" value="1" hidden>
                            <label class="checkbox-label" for="star-1">
                                <i class="fa-regular fa-star"></i>
                            </label>
                        </div>

                        <div class="category-inform">
                            <input type="radio" id="star-2" name="rating" value="2" hidden>
                            <label class="checkbox-label" for="star-2">
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                            </label>
                        </div>

                        <div class="category-inform">
                            <input type="radio" id="star-3" name="rating" value="3" hidden>
                            <label class="checkbox-label" for="star-3">
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                            </label>
                        </div>

                        <div class="category-inform">
                            <input type="radio" id="star-4" name="rating" value="4" hidden>
                            <label class="checkbox-label" for="star-4">
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                            </label>
                        </div>

                        <div class="category-inform">
                            <input type="radio" id="star-5" name="rating" value="5" hidden>
                            <label class="checkbox-label" for="star-5">
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                                <i class="fa-regular fa-star"></i>
                            </label>
                        </div>
                    </div>

                </nav>
            </div>
        </div>
        <div class="grid__row--content">
            <div class="col-md-10">
                <div class="home-product">
                    <!-- Sản phẩm hiển thị bên phải -->
                    <div id="product-container" class="grid__row">
                        <!--0-->
                        <c:forEach var="book" items="${books}">
                            <div class="grid-md-2-4">
                                <a href="book-detail?id=${book.bId}">
                                    <div class="home-product-item">
                                        <div class="home-product-item__img"
                                             style="background-image: url('${not empty book.image.sourceImg ? book.image.sourceImg : '../img/path_to_default_image.png'}');">
                                        </div>
                                        <h4 class="home-product-item__name">${book.title}</h4>
                                        <div class="home-product-item__price">
                                            <c:if test="${book.promotionId == 0}">
                                                <span class="home-product-item__price-current original-price"><f:formatNumber
                                                        value="${book.originalPrice}"/>
                                                    <i class="fa-solid fa-dong-sign fa-xs"></i>
                                                </span>
                                            </c:if>
                                            <!-- Hiển thị giá sau khi giảm giá nếu có promotion -->
                                            <c:if test="${book.promotionId != 0}">
                                                <span class="home-product-item__price-current unit-price"><f:formatNumber
                                                        value="${book.salePrice}"/>
                                                       <i class="fa-solid fa-dong-sign fa-xs"></i>
                                                </span>

                                                <span class="home-product-item__price-old original-price"><f:formatNumber
                                                        value="${book.originalPrice}"/></span>
                                                <i class="fa-solid fa-dong-sign fa-xs"></i>
                                            </c:if>
                                        </div>
                                        <div class="home-product-item__action">
                                        <span class="home-product-item__like home-product-item__like--liked">
                                            <i class="home-product-item__action-icon-empty fa-regular fa-heart"></i>
                                            <i class="home-product-item__action-icon-fill fa-solid fa-heart"></i>
                                        </span>
                                            <div class="home-product-item__rating">
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                                <i class="fa-solid fa-star"></i>
                                            </div>

                                        </div>
                                    </div>
                                </a>
                            </div>
                        </c:forEach>
                    </div>

                    <div style="text-align: center; margin-top: 36px;">
                        <button id="load-more" onclick="loadMore()" class="home-product-btn btn-primary">Xem thêm
                        </button>
                    </div>
                </div>
                <div id="pagination"></div>

                <!-- Phân trang -->
                <%--                <div class="grid__row--footer">--%>
                <%--                    <div class="col-md-10">--%>
                <%--                        <div class="home-filter__paginate" style="text-align: right;">--%>
                <%--                            <ul class="home-filter__paginate-list">--%>
                <%--                                <li class="home-filter__paginate-item home-filter__paginate-item--active"><a--%>
                <%--                                        href="">1</a>--%>
                <%--                                </li>--%>
                <%--                                <li class="home-filter__paginate-item"><a href="">2</a></li>--%>
                <%--                                <li class="home-filter__paginate-item"><a href="">3</a></li>--%>
                <%--                                <li class="home-filter__paginate-item"><a href="">4</a></li>--%>
                <%--                                <li class="home-filter__paginate-item"><a href="">5</a></li>--%>
                <%--                                <li class="home-filter__paginate-item"><a href=""><i--%>
                <%--                                        class="fa-solid fa-chevron-right"></i></a>--%>
                <%--                                </li>--%>
                <%--                            </ul>--%>
                <%--                        </div>--%>
                <%--                    </div>--%>
                <%--                </div>--%>
            </div>
        </div>
    </div>
</div>
<!--footer-->
<!--<div id="footer"></div>-->
<jsp:include page="footer.jsp"></jsp:include>
<!-- /FOOTER -->


<!--jquery-->
<script src="js/jquery.min.js"></script>

<!--     OwlCarousel-->
<!--<script src="../js/OwlCarousel.js"></script>-->
<script src="js/owl.carousel.min.js"></script>
<!--    bootstrap-->
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.twbspagination/1.4.1/jquery.twbsPagination.min.js"></script>

<!--format tiền tệ-->
<script type="text/javascript">
    $(document).ready(function () {
        let curentPage = 1;
        let totalPages = $(totalPages);
        const limit = 20;


        $('#pagination').twbsPagination({
            totalPages: ${totalPages},
            visiblePages: 5,
            startPage: ${currentPage},
            first: 'Đầu',
            prev: 'Trước',
            next: 'Sau',
            last: 'Cuối',
            onPageClick: function (event, page) {
                window.location.href = "/category?page=" + page;
            }
        });
    });
</script>
<script>
    function loadMore() {
        var amount = document.querySelectorAll(".home-product-item").length;
        console.log(amount);
        $.ajax({
            url: "/load",
            type: "GET",
            data: {
                exitsBook: amount
            },
            success: function (data) {
                var row = document.getElementById("product-container")
                row.innerHTML += data;
            },
            error: function () {
                alert("error");
            }
        })
    }

</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const starInputs = document.querySelectorAll("input[name='rating']");
        const starLabels = document.querySelectorAll(".category-inform label");

        // Gắn sự kiện click cho từng label
        starLabels.forEach((label, index) => {
            label.addEventListener("click", () => {
                updateStars(index);
            });
        });

        // Hàm cập nhật màu của các ngôi sao dựa trên chỉ số được chọn
        function updateStars(selectedIndex) {
            starLabels.forEach((label, i) => {
                if (i <= selectedIndex) {
                    label.querySelector("i").style.color = "#ffc107"; // Vàng
                } else {
                    label.querySelector("i").style.color = "#ddd"; // Xám
                }
            });

            // Đánh dấu radio button tương ứng là được chọn
            starInputs[selectedIndex].checked = true;
        }

        // Kiểm tra trạng thái khi tải lại trang
        const checkedInputIndex = Array.from(starInputs).findIndex((input) => input.checked);
        if (checkedInputIndex !== -1) {
            updateStars(checkedInputIndex); // Cập nhật màu nếu đã chọn trước đó
        }
    });


</script>

</body>
</html>