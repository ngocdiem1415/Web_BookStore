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

    <%--    mdb css--%>
    <link rel="stylesheet" href="css/mdb/css/mdb.min.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.js"></script>

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
                <div><p>Ưu tiên xem:</p></div>
                <!--Section: Sorting-->
                <div class="head-filter__list">
                    <div class="col-8 col-lg-6 d-flex justify-content-end mt-2">
                        <select data-mdb-select-init id="sort-by">
                            <option value="0">Hàng mới nhất</option>
                            <option value="1">Hàng cũ nhất</option>
                            <option value="2">Giá tăng dần</option>
                            <option value="3">Giá giảm dần</option>
                            <option value="4">Hàng giảm giá</option>
                        </select>
                        <label class="form-label select-label" id="apply">Sắp xếp</label>
                    </div>
                </div>
                <!--Section: Sorting-->
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
                                    <div class="publisher-item">
                                        <input type="radio" id="${publisher.p_id}" name="publisher"
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
                                <div class="categories-item">
                                    <input type="radio" id="${category.categoryId}" name="category"
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
                            <input type="radio" id="100" name="priceRange" value="<100k">
                            <label class="checkbox-label" for="100">Giá dưới 100.000đ</label>
                        </div>

                        <div class="category-inform">
                            <input type="radio" id="200" name="priceRange" value="100k-200k">
                            <label class="checkbox-label" for="200">100.000đ - 200.000đ</label>
                        </div>

                        <div class="category-inform">
                            <input type="radio" id="300" name="priceRange" value="200k-300k">
                            <label class="checkbox-label" for="300">200.000đ - 300.000đ</label>
                        </div>

                        <div class="category-inform">
                            <input type="radio" id="500" name="priceRange" value="300k-500k">
                            <label class="checkbox-label" for="500">300.000đ - 500.000đ</label>
                        </div>

                        <div class="category-inform">
                            <input type="radio" id="1000" name="priceRange" value="500k-1000k">
                            <label class="checkbox-label" for="1000">500.000đ - 1.000.000đ</label>
                        </div>

                        <div class="category-inform">
                            <input type="radio" id=">1000" name="priceRange" value=">1000k">
                            <label class="checkbox-label" for=">1000">Giá trên 1.000.000đ</label>
                        </div>
                    </div>
                    <div class="category-form">
                        <h4 class="category__heading">Đánh Giá Sao</h4>
                        <div class="category-inform">
                            <label><input type="radio" name="rating" value="4"> ⭐⭐⭐⭐ trở lên</label><br>
                            <label><input type="radio" name="rating" value="3"> ⭐⭐⭐ trở lên</label><br>
                            <label><input type="radio" name="rating" value="2"> ⭐⭐ trở lên</label><br>
                            <label><input type="radio" name="rating" value="1"> ⭐ trở lên</label>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <div class="grid__row--content">
            <div class="col-md-10">
                <div class="home-product">
                    <div id="product-container" class="grid__row listBook"></div>
                </div>

                <!-- Phân trang -->
                <div class="p-4 d-flex justify-content-end">
                    <ul class="pagination" id="pagination"></ul>
                    <input type="hidden" value="" id="page" name="page">
                    <input type="hidden" value="" id="maxPageItem" name="maxPageItem">
                </div>
            </div>
        </div>
        <form id="filter-form">
            <input type="hidden" name="publisher" id="publisherFilter">
            <input type="hidden" name="category" id="categoryFilter">
            <input type="hidden" name="firstPrice" id="firstPriceFilter">
            <input type="hidden" name="secondPrice" id="secondPriceFilter">
            <input type="hidden" name="rating" id="ratingFilter">
            <input type="hidden" name="sort" id="sortFilter">
        </form>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/twbs-pagination/1.4.2/jquery.twbsPagination.min.js"></script>

<!--    mdb js-->
<script src="css/mdb/js/mdb.min.js"></script>

<!--format tiền tệ-->
<script src="js/FormatMoney.js"></script>

<%
    String findWord = request.getParameter("find");
    if (findWord == null) findWord = "";
%>

<script>
    let page=1;
    let keyword = "";
    document.addEventListener("DOMContentLoaded", function () {
        keyword = "<%= findWord %>";
        document.getElementById("searchInput").value = keyword;
        fetchProducts(page, 20, keyword)
    });

    $("input[name='publisher'], input[name='category'], input[name='priceRange'], input[name='rating']").change(function () {
        $("#page").val("1");
        page = 1;
        console.log(page);
        $("#publisherFilter").val($("input[name='publisher']:checked").val());
        $("#categoryFilter").val($("input[name='category']:checked").val());
        $("#ratingFilter").val($("input[name='rating']:checked").val());
        var selectedValue = $("input[name='priceRange']:checked").val();
        // console.log('Selected Price Range:', selectedValue);
        // Tách các số từ giá trị đã chọn bằng regex
        if (selectedValue == null) {
            firstPrice = "";
            secondPrice = "";
        } else {
            var priceRange = selectedValue.match(/\d+/g);
            if (priceRange && priceRange.length >= 2) {
                var result = priceRange[0];

                if (priceRange[1] == null) {
                    priceRange[1] = result;
                    priceRange[0] = 0;
                    secondPrice = parseInt(priceRange[1] + "000");
                }
                firstPrice = parseInt(priceRange[0] + "000"); // Chuyển thành số cho giá trị thấp nhất
                secondPrice = parseInt(priceRange[1] + "000"); // Chuyển thành số cho giá trị cao nhất
                $("#firstPriceFilter").val(firstPrice);
                $("#secondPriceFilter").val(secondPrice);

                console.log('First Price:', firstPrice);
                console.log('Second Price:', secondPrice);
            }
        }
        $("#pageFilter").val("1"); // reset về trang đầu
        fetchProducts(page, 20, keyword);
    });

    //Sắp xếp
    $("#sort-by").change(function () {
        $("#sortFilter").val($(this).val());
        fetchProducts(page, 20, keyword);
    });

    function fetchProducts(page, maxItems, findWord) {
        $.ajax({
            url: '/filter',
            method: 'GET',
            dataType: 'json',
            data: $("#filter-form").serialize() + "&page=" + page + "&maxItems=" + maxItems + "&find=" + findWord,
            success: function (json) {
                let data = "";
                let obj = json.products; // Dữ liệu trả về có key 'products'
                let totalItems = json.totalItems; // Tổng số sản phẩm (để tính số trang)
                let totalItemsOnPage = json.totalItemsOnPage; // Tổng số sản phẩm trên trang hiện tại
                maxItems = 20; // Số sản phẩm hiển thị mỗi trang
                let maxPage = Math.ceil(totalItems / maxItems); // Tính tổng số trang
                // console.log(obj)

                // Tạo danh sách sản phẩm
                obj.forEach(function (val) {
                    data += '<div class="grid-md-2-4">' +
                        '<a href="book-detail?id=' + val.bId + '">' +
                        '<div class="home-product-item">' +
                        // Hình ảnh sản phẩm
                        '<div class="home-product-item__img" ';
                    const imageUrl = val.image?.sourceImg || '/img/logo/default_image.png';
                    data += 'style="background-image: url(' + imageUrl + ' )"></div>';

                    data +=
                        // Tên sản phẩm
                        '<h4 class="home-product-item__name">' + val.title + '</h4>' +
                        // Giá sản phẩm
                        '<div class="home-product-item__price">';

                    // Hiển thị giá gốc và giá khuyến mãi
                    if (val.promotionId == 0) {
                        price = formatCurrencyVN(val.originalPrice);
                        data += '<span class="home-product-item__price-current original-price">' + price +
                            '<i class="fa-solid fa-dong-sign fa-xs"></i> </span>' +
                            '</div>';
                    } else {
                        discountedPrice = formatCurrencyVN(val.originalPrice - (val.originalPrice * val.promotion.discount));
                        data += '<span class="home-product-item__price-current unit-price">' + discountedPrice + ' đ</span>' +
                            '<span class="home-product-item__price-old original-price">' + price + ' đ</span>' + '</div>';
                    }

                    data +=
                        // Hành động yêu thích
                        '<div class="home-product-item__action">' +
                        '<span class="home-product-item__like home-product-item__like--liked">' +
                        '<i class="home-product-item__action-icon-empty fa-regular fa-heart"></i>' +
                        '<i class="home-product-item__action-icon-fill fa-solid fa-heart"></i>' +
                        '</span>';

                    // Đánh giá
                    data += '<div class="home-product-item__rating">' +
                        '<ul class="rating" data-mdb-value="' + val.rating + '">';
                    for (let i = 1; i <= 5; i++) {
                        if (i <= Math.round(val.rating)) {
                            data += '<li><i class="fas fa-star fa-sm" style="color: gold;"></i></li>';
                        } else {
                            data += '<li><i class="far fa-star fa-sm" style="color: gold;"></i></li>';
                        }
                    }
                    data += '</ul>';
                    data += '</a>';
                    data += '</div>';
                    data += '</div>';
                    data += '</div>';
                    data += '</div>';
                });

                // Thêm các sản phẩm vào DOM
                $('#product-container').html(data);

                // Cập nhật phân trang
                if (totalItemsOnPage < 10) {
                    $('#pagination').hide(); // Ẩn phân trang khi chỉ có một trang
                } else {
                    $('#pagination').twbsPagination({
                        totalPages: maxPage,
                        visiblePages: 5,
                        onPageClick: function (event, page) {
                            $('#page').val(page); // Cập nhật trang hiện tại
                            console.log("Trang hiện tại: " + page);
                            fetchProducts(page, maxItems, keyword); // Tải lại sản phẩm khi click vào trang
                        }
                    });
                }

            }
            ,
            error: function (xhr, status, error) {
                console.log("Có lỗi xảy ra khi lấy dữ liệu: " + error);
            }
        });
    }

    // Hàm định dạng tiền tệ (nếu chưa có)
    function formatCurrencyVN(number) {
        return new Intl.NumberFormat('vi-VN').format(number);
    }

</script>
</body>
</html>