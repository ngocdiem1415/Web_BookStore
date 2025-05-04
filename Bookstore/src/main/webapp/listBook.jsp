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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.0/mdb.min.css" rel="stylesheet" />
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
                            <option value="3">Giá tăng dần</option>
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
                            <input type="radio" id="100k" name="priceRange" value="under100k">
                            <label class="checkbox-label" for="100k">Giá dưới 100.000đ</label>
                        </div>

                        <div class="category-inform">
                            <input type="radio" id="200k" name="priceRange" value="100k-200k">
                            <label class="checkbox-label" for="200k">100.000đ - 200.000đ</label>
                        </div>

                        <div class="category-inform">
                            <input type="radio" id="300k" name="priceRange" value="200k-300k">
                            <label class="checkbox-label" for="300k">200.000đ - 300.000đ</label>
                        </div>

                        <div class="category-inform">
                            <input type="radio" id="500k" name="priceRange" value="300k-500k">
                            <label class="checkbox-label" for="500k">300.000đ - 500.000đ</label>
                        </div>

                        <div class="category-inform">
                            <input type="radio" id="1000k" name="priceRange" value="500k-1000k">
                            <label class="checkbox-label" for="1000k">500.000đ - 1.000.000đ</label>
                        </div>

                        <div class="category-inform">
                            <input type="radio" id="hon1tr" name="priceRange" value="above1mil">
                            <label class="checkbox-label" for="hon1tr">Giá trên 1.000.000đ</label>
                        </div>
                    </div>

                    <div class="category-form">
                        <h4 class="category__heading">Đánh Giá Sao</h4>
                        <div id="rating-options"></div>
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
    document.addEventListener("DOMContentLoaded", function () {
        const keyword = "<%= findWord %>";
        document.getElementById("searchInput").value = keyword;
        fetchProducts(1, 20, keyword);
    });

    function fetchProducts(page, maxItems, keyword) {
        $.ajax({
            url: '/Bookstore/listBooks?page=' + page + '&maxItems=' + maxItems + '&find=' + keyword,
            method: 'GET',
            dataType: 'json',
            success: function (json) {
                let data = "";
                let obj = json.products; // Dữ liệu trả về có key 'products'
                let totalItems = json.totalItems; // Tổng số sản phẩm (để tính số trang)
                let maxItems = 20; // Số sản phẩm hiển thị mỗi trang
                let maxPage = Math.ceil(totalItems / maxItems); // Tính tổng số trang
                console.log(obj)

                // Tạo danh sách sản phẩm
                obj.forEach(function (val) {
                    console.log("HTML sinh ra:", data);
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
                        '</span>' +
                        // Đánh giá sản phẩm
                        '<div class="home-product-item__rating">' +
                        '<ul class="rating" data-mdb-toggle="rating" data-mdb-readonly="true" data-mdb-value="' + val.rating + '">' +
                        '<li><i class="far fa-star fa-sm" style="color: gold;"></i></li>' +
                        '<li><i class="far fa-star fa-sm" style="color: gold;"></i></li>' +
                        '<li><i class="far fa-star fa-sm" style="color: gold;"></i></li>' +
                        '<li><i class="far fa-star fa-sm" style="color: gold;"></i></li>' +
                        '<li><i class="far fa-star fa-sm" style="color: gold;"></i></li>' +
                        '</ul>' +
                        '</a>' +
                        '</div>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
                });

                // Thêm các sản phẩm vào DOM
                $('#product-container').html(data);

                // Cập nhật phân trang
                if (totalItems < 10) {
                    $('#pagination').hide(); // Ẩn phân trang khi chỉ có một trang
                } else {
                    $('#pagination').twbsPagination({
                        totalPages: maxPage,
                        visiblePages: 5,
                        onPageClick: function (event, page) {
                            fetchProducts(page, maxItems, keyword); // Tải lại sản phẩm khi click vào trang
                            $('#page').val(page); // Cập nhật trang hiện tại
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

    $(document).ready(function() {
        // Khởi tạo rating cho từng phần tử
        $('.rating').each(function() {
            const ratingValue = $(this).data('data-mdb-value');
            mdb.Rating.init(this);  // Khởi tạo rating
            $(this).find('li').each(function(index) {
                if (index < ratingValue) {
                    $(this).css('color', 'gold'); // Đổi màu sao thành vàng
                }
            });
        });
    });

</script>


<%--<script>--%>
<%--    document.addEventListener("DOMContentLoaded", function () {--%>
<%--        const container = document.getElementById("rating-options");--%>

<%--        // Hàm tạo HTML sao--%>
<%--        function generateStars(rating) {--%>
<%--            let stars = '';--%>
<%--            for (let i = 1; i <= 5; i++) {--%>
<%--                if (i <= rating) {--%>
<%--                    stars += '<li><i class="fa fa-star fa-sm text-warning"></i></li>';--%>
<%--                } else {--%>
<%--                    stars += '<li><i class="fa fa-star-o fa-sm text-warning"></i></li>';--%>
<%--                }--%>
<%--            }--%>
<%--            return '<ul class="rating">' + stars + '</ul>';--%>
<%--        }--%>

<%--        // Tạo từng mức đánh giá từ 1 đến 5--%>
<%--        for (let i = 1; i <= 5; i++) {--%>
<%--            const option = document.createElement('div');--%>
<%--            option.classList.add('category-inform');--%>
<%--            option.innerHTML = `--%>
<%--                <input type="radio" id="rating${i}" name="rating" value="${i}">--%>
<%--                <label for="rating${i}">--%>
<%--                    ${generateStars(i)}--%>
<%--                </label>--%>
<%--            `;--%>
<%--            container.appendChild(option);--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>


<%--<script type="text/javascript">--%>
<%--    let currentPage = ${page};--%>
<%--    let totalPages = ${totalPage};--%>
<%--    const limit = 20;--%>
<%--    let category = "";--%>
<%--    let find = "";--%>
<%--    let publisher = "";--%>
<%--    let orderBy = "";--%>
<%--    var firstPrice = 0;--%>
<%--    var secondPrice = 1000000;--%>
<%--    let ratingValue = 0;--%>

<%--    $(document).ready(function () {--%>
<%--        window.pagObj = $('#pagination').twbsPagination({--%>
<%--            totalPages: totalPages,--%>
<%--            visiblePages: 5,--%>
<%--            startPage: currentPage,--%>
<%--            first: 'Đầu',--%>
<%--            last: 'Cuối',--%>
<%--            onPageClick: function (event, page) {--%>
<%--                console.log("Page clicked:", page); // Thêm log để kiểm tra--%>
<%--                if (currentPage != page) {--%>
<%--                    currentPage = page;--%>
<%--                    console.log(currentPage)--%>
<%--                    // ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--                    ajaxLoad(currentPage)--%>
<%--                }--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>

<%--    // Đặt sự kiện click cho danh sách tác giả--%>
<%--    var publishers = document.querySelectorAll(".publisher-item");--%>
<%--    publishers.forEach(function (radioButton) {--%>
<%--        radioButton.addEventListener("change", function (event) {--%>
<%--            // Nếu radio button được chọn, lấy giá trị của nó--%>
<%--            if (radioButton.checked) {--%>
<%--                publisher = radioButton.value;--%>
<%--                console.log("Selected publisher ID: " + publisher);--%>

<%--                // Tiến hành gọi AJAX hoặc xử lý theo yêu cầu--%>
<%--                ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>

<%--    // Đặt sự kiện click cho danh sách tác giả--%>
<%--    var categories = document.querySelectorAll(".categories-item");--%>
<%--    categories.forEach(function (radioButton) {--%>
<%--        radioButton.addEventListener("change", function (event) {--%>
<%--            // Nếu radio button được chọn, lấy giá trị của nó--%>
<%--            if (radioButton.checked) {--%>
<%--                category = radioButton.value;--%>
<%--                console.log("Selected category ID: " + publisher);--%>

<%--                // Tiến hành gọi AJAX hoặc xử lý theo yêu cầu--%>
<%--                ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>

<%--    //dat su kien cho rating--%>
<%--    $(document).ready(function () {--%>
<%--        // Attach click event to each star--%>
<%--        $('.rating li').on('click', function () {--%>
<%--            ratingValue = $(this).closest('ul').data('data-mdb-value');--%>

<%--            // Log or use the rating value as needed--%>
<%--            console.log(ratingValue);--%>
<%--            ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--        });--%>
<%--    });--%>

<%--    $(document).ready(function () {--%>
<%--        // Attach change event to radio buttons--%>
<%--        $('input[name="radioForm"]').on('change', function () {--%>
<%--            var selectedValue = $('input[name="priceRange"]:checked').next('label').text().trim();--%>
<%--            // Tách các số từ giá trị đã chọn bằng regex--%>
<%--            var priceRange = selectedValue.match(/\d+/g);--%>
<%--            console.log('Prices:', priceRange);--%>

<%--            // xử lí giá tị đã tìm được--%>
<%--            if (priceRange && priceRange.length >= 2) {--%>
<%--                var result = priceRange[0];--%>


<%--                if (priceRange[1] == null) {--%>
<%--                    priceRange[1] = result;--%>
<%--                    priceRange[0] = 0;--%>
<%--                    secondPrice = parseInt(priceRange[1] + "000");--%>
<%--                }--%>
<%--                firstPrice = parseInt(priceRange[0] + "000"); // Chuyển thành số cho giá trị thấp nhất--%>
<%--                secondPrice = parseInt(priceRange[1] + "000"); // Chuyển thành số cho giá trị cao nhất--%>

<%--                console.log('First Price:', firstPrice);--%>
<%--                console.log('Second Price:', secondPrice);--%>
<%--                ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--            }--%>
<%--        });--%>
<%--    });--%>

<%--    $('#sort-by').change(function () {--%>
<%--        // Lấy giá trị được chọn--%>
<%--        var selectedValue = $(this).val();--%>
<%--        console.log(selectedValue)--%>

<%--        // Gọi hàm xử lý hoặc thực hiện các công việc khác tùy thuộc vào giá trị được chọn--%>
<%--        handleSortSelection(selectedValue);--%>
<%--    });--%>

<%--    // Hàm xử lý với giá trị được chọn--%>
<%--    function handleSortSelection(selectedValue) {--%>

<%--        switch (selectedValue) {--%>

<%--            case '0':--%>
<%--                // Xử lý khi chọn "Mặc định"--%>
<%--                currentPage = 1--%>
<%--                console.log('Chọn mặc định');--%>
<%--                orderBy = ""--%>
<%--                window.pagObj.twbsPagination('destroy'); // Hủy bỏ phân trang hiện tại--%>
<%--                window.pagObj = $('#pagination').twbsPagination({--%>
<%--                    totalPages: totalPages,--%>
<%--                    visiblePages: 5,--%>
<%--                    startPage: currentPage,--%>
<%--                    onPageClick: function (event, page) {--%>
<%--                        if (currentPage != page) {--%>
<%--                            currentPage = page;--%>
<%--                            ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--                        }--%>
<%--                    }--%>
<%--                });--%>
<%--                ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--                break;--%>
<%--            case '1':--%>
<%--                // Xử lý khi chọn "hàng mới nhất"--%>
<%--                currentPage = 1--%>
<%--                console.log('Chọn theo tên');--%>
<%--                orderBy = "book_update_DESC"--%>
<%--                window.pagObj.twbsPagination('destroy'); // Hủy bỏ phân trang hiện tại--%>
<%--                window.pagObj = $('#pagination').twbsPagination({--%>
<%--                    totalPages: totalPages,--%>
<%--                    visiblePages: 5,--%>
<%--                    startPage: currentPage,--%>
<%--                    onPageClick: function (event, page) {--%>
<%--                        if (currentPage != page) {--%>
<%--                            currentPage = page;--%>
<%--                            ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--                        }--%>
<%--                    }--%>
<%--                });--%>
<%--                ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--                break;--%>
<%--            case '2':--%>
<%--                // Xử lý khi chọn "hàng cũ nhất"--%>
<%--                currentPage = 1;--%>
<%--                console.log('Chọn theo sách cũ nhất');--%>
<%--                orderBy = "book_update_ASC"--%>
<%--                window.pagObj.twbsPagination('destroy'); // Hủy bỏ phân trang hiện tại--%>
<%--                window.pagObj = $('#pagination').twbsPagination({--%>
<%--                    totalPages: totalPages,--%>
<%--                    visiblePages: 5,--%>
<%--                    startPage: currentPage,--%>
<%--                    onPageClick: function (event, page) {--%>
<%--                        if (currentPage != page) {--%>
<%--                            currentPage = page;--%>
<%--                            ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--                        }--%>
<%--                    }--%>
<%--                });--%>
<%--                ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--                break;--%>
<%--            case '3':--%>
<%--                // Xử lý khi chọn "Giá tăng dần"--%>
<%--                currentPage = 1;--%>
<%--                console.log('Chọn theo giá tăng dần');--%>
<%--                orderBy = "book_price_ASC"--%>
<%--                window.pagObj.twbsPagination('destroy'); // Hủy bỏ phân trang hiện tại--%>
<%--                window.pagObj = $('#pagination').twbsPagination({--%>
<%--                    totalPages: totalPages,--%>
<%--                    visiblePages: 5,--%>
<%--                    startPage: currentPage,--%>
<%--                    onPageClick: function (event, page) {--%>
<%--                        if (currentPage != page) {--%>
<%--                            currentPage = page;--%>
<%--                            ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--                        }--%>
<%--                    }--%>
<%--                });--%>
<%--                ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--                break;--%>
<%--            case '4':--%>
<%--                // Xử lý khi chọn "Giá giảm dần"--%>
<%--                currentPage = 1;--%>
<%--                console.log('Chọn theo giá giảm dần');--%>
<%--                orderBy = "book_price_DESC"--%>
<%--                window.pagObj.twbsPagination('destroy'); // Hủy bỏ phân trang hiện tại--%>
<%--                window.pagObj = $('#pagination').twbsPagination({--%>
<%--                    totalPages: totalPages,--%>
<%--                    visiblePages: 5,--%>
<%--                    startPage: currentPage,--%>
<%--                    onPageClick: function (event, page) {--%>
<%--                        if (currentPage != page) {--%>
<%--                            currentPage = page;--%>
<%--                            ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--                        }--%>
<%--                    }--%>
<%--                });--%>
<%--                ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--                break;--%>
<%--            default:--%>
<%--                // Xử lý mặc định hoặc các giá trị khác nếu cần--%>
<%--                break;--%>
<%--        }--%>
<%--    }--%>


<%--    // $("#search-text").on('keyup', function () {--%>
<%--    //     currentPage = 1; // Đặt lại currentPage về 1 khi có sự kiện tìm kiếm--%>
<%--    //     find = $(this).val();--%>
<%--    //     console.log(find);--%>
<%--    //--%>
<%--    //     // Gọi hàm update của twbsPagination để cập nhật giá trị currentPage--%>
<%--    //     window.pagObj.twbsPagination('destroy'); // Hủy bỏ phân trang hiện tại--%>
<%--    //     window.pagObj = $('#pagination').twbsPagination({--%>
<%--    //         totalPages: totalPages,--%>
<%--    //         visiblePages: 5,--%>
<%--    //         startPage: currentPage,--%>
<%--    //         onPageClick: function (event, page) {--%>
<%--    //             if (currentPage !== page) {--%>
<%--    //                 currentPage = page;--%>
<%--    //                 // Chỉ gọi ajaxRun khi thay đổi trang--%>
<%--    //                 ajaxRun(categoryValue, find, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--    //             }--%>
<%--    //         }--%>
<%--    //     });--%>
<%--    //--%>
<%--    //     // Gọi ajaxRun ngay khi có sự kiện tìm kiếm, chỉ khi người dùng thay đổi từ khóa tìm kiếm--%>
<%--    //     // Điều này giúp hiển thị kết quả tìm kiếm ngay lập tức.--%>
<%--    //     ajaxRun(categoryValue, find, orderBy, ratingValue, firstPrice, secondPrice);--%>
<%--    // });--%>

<%--    // Hàm gọi AJAX--%>
<%--    function ajaxCall(categoryValue, orderBy, ratingValue, firstPrice, secondPrice) {--%>
<%--        console.log("ajax da chay")--%>
<%--        $.ajax({--%>
<%--            type: "POST",--%>
<%--            url: "/listBooks?page-index=" + currentPage + "&per-page=" + limit + "&category=" + category + "&publisher=" + publisher + "&find=" + find + "&orderBy=" + orderBy + "&ratingValue=" + ratingValue + "&firstPrice=" + firstPrice + "&secondPrice=" + secondPrice,--%>
<%--            dataType: 'json',--%>
<%--            contentType: "application/json; charset=utf-8",--%>
<%--            success: function (json) {--%>
<%--                let data = "";--%>
<%--                let obj = json;--%>
<%--                for (let i = 0; i < obj.length; i++) {--%>
<%--                    let val = obj[i];--%>
<%--                    // onclick="return theFunction();"--%>
<%--                    data += '<div class="grid-md-2-4">' +--%>
<%--                        '<a href="/product-detail?id=' + val.bId + '" class="home-product-item">' +--%>
<%--                        // hinh anh san pham--%>
<%--                        '<a href="/product-detail?id="' + (val.image && val.image.sourceImg ? val.image.sourceImg : '../img/path_to_default_image.png') + ');"></div>' +--%>
<%--                        // Tên sản phẩm--%>
<%--                        '<h4 class="home-product-item__name">' + val.title + '</h4>' +--%>
<%--                        // Giá sản phẩm--%>
<%--                        '<div class="home-product-item__price">';--%>
<%--                    // Hiển thị giá gốc và giá khuyến mãi--%>
<%--                    if (val.promotionId == 0) {--%>
<%--                        data += '<span class="home-product-item__price-current original-price">' + val.originalPrice + ' đ</span>';--%>
<%--                    } else {--%>
<%--                        let discountedPrice = val.originalPrice - (val.originalPrice * val.promotion.discount);--%>
<%--                        data += '<span class="home-product-item__price-current unit-price">' + discountedPrice + ' đ</span>' +--%>
<%--                            '<span class="home-product-item__price-old original-price">' + val.originalPrice + ' đ</span>';--%>
<%--                    }--%>
<%--                    data += '</div>' +--%>
<%--                        // Hành động yêu thích--%>
<%--                        '<div class="home-product-item__action">' +--%>
<%--                        '<span class="home-product-item__like home-product-item__like--liked">' +--%>
<%--                        '<i class="home-product-item__action-icon-empty fa-regular fa-heart"></i>' +--%>
<%--                        '<i class="home-product-item__action-icon-fill fa-solid fa-heart"></i>' +--%>
<%--                        '</span>' +--%>

<%--                        // Đánh giá--%>
<%--                        '<div class="home-product-item__rating">' +--%>
<%--                        '<ul class="rating" data-mdb-toggle="rating" data-mdb-readonly="true" data-mdb-value="' + val.averageRating + '">' +--%>
<%--                        '<li><i class="far fa-star fa-sm" style="color: gold;"></i></li>' +--%>
<%--                        '<li><i class="far fa-star fa-sm" style="color: gold;"></i></li>' +--%>
<%--                        '<li><i class="far fa-star fa-sm" style="color: gold;"></i></li>' +--%>
<%--                        '<li><i class="far fa-star fa-sm" style="color: gold;"></i></li>' +--%>
<%--                        '<li><i class="far fa-star fa-sm" style="color: gold;"></i></li>' +--%>
<%--                        '</ul>' +--%>
<%--                        '</div>' +--%>
<%--                        '</div>' +--%>
<%--                        '</a>' +--%>
<%--                        '</div>';--%>
<%--                }--%>
<%--                $(".listBook").html(data);--%>
<%--                reloadJsFile("${pageContext.request.contextPath}/css/mdb/js/mdb.min.js");--%>
<%--            },--%>
<%--            error: function (xhr, status, error) {--%>
<%--                console.log(status, error);--%>
<%--            }--%>
<%--        });--%>
<%--    };--%>
<%--    // ajaxCall(category, publisher, orderBy, ratingValue, firstPrice, secondPrice);--%>

<%--    function reloadJsFile(src) {--%>
<%--        // Remove the existing script tag--%>
<%--        $('script[src="' + src + '"]').remove();--%>

<%--        // Create a new script element--%>
<%--        var script = document.createElement('script');--%>
<%--        script.type = 'text/javascript';--%>
<%--        script.src = src;--%>

<%--        // Append the new script element to the document head--%>
<%--        document.head.appendChild(script);--%>
<%--    }--%>
<%--</script>--%>

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
<!--Script xếp hạng-->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Lấy danh sách các phần tử nhận xét
        const comments = document.querySelectorAll(".comment-list .rating-box .text-warning");

        // Nếu không có nhận xét, giữ nguyên giá trị mặc định
        if (comments.length === 0) return;

        let totalRating = 0;

        // Tính tổng điểm xếp hạng
        comments.forEach(comment => {
            const stars = comment.querySelectorAll(".fa-star");
            totalRating += stars.length; // Mỗi ngôi sao trong `.text-warning` là một điểm
        });

        // Tính trung bình
        const averageRating = totalRating / comments.length;

        // Cập nhật số sao và giá trị trung bình hiển thị
        const averageRatingElement = document.getElementById("average-rating");
        const averageRatingValueElement = document.getElementById("average-rating-value");

        // Làm tròn đến 1 chữ số thập phân
        averageRatingValueElement.textContent = averageRating.toFixed(1);

        // Cập nhật số sao hiển thị
        averageRatingElement.innerHTML = '';
        for (let i = 0; i < 5; i++) {
            const star = document.createElement("i");
            star.classList.add("fa", i < Math.round(averageRating) ? "fa-star" : "fa-star-o", "text-warning");
            averageRatingElement.appendChild(star);
        }

        // Thêm lại phần điểm trung bình
        averageRatingElement.appendChild(averageRatingValueElement);
    });
</script>
</body>
</html>