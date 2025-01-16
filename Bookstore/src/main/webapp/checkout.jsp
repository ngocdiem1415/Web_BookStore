<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:15 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thanh toán</title>

    <!--    font awesome-->
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">

    <!--    bootstrap-->
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <!--    CSS-->
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/Cart.css">
    <link rel="stylesheet" href="css/checkout.css">
</head>
<body>
<!--    header-->
<header>
    <div class="checkout-header">

        <div class="row">
            <div class="col bg-white d-flex justify-content-start align-items-center ps-5 py-3">
                <div class="logo">
                    <a href="Home.jsp">
                        <img src="img/logo/new_logo.png" height="90" width="100" alt="logo" class="logo"/>
                    </a>
                </div>
                <div class="title ps-3">
                    <h5>Thanh toán</h5>
                </div>
            </div>
        </div>
    </div>
</header>
<!--Checkout container-->
<div class="container mt-3">
    <div class="address-box pb-4 px-4">
        <div class="title-address py-3">
            <span class="header-text text-danger d-flex justify-content-start align-items-center">
                <i class="fa-solid fa-location-dot"></i> <h5 class="ps-3 mb-0">Địa Chỉ Nhận Hàng</h5>
            </span>
            <div class="row d-flex align-items-center my-3">
                <div class="col-6 d-flex align-items-center">
                    <label for="customer_name"></label>
                    <input type="text" name="shipping_full_name" class="form-control" id="customer_name"
                           placeholder="Họ và tên" required>
                </div>
                <div class="col-6 d-flex align-items-center">
                    <label for="customer_phone"></label>
                    <input type="text" name="shipping_phone" class="form-control" id="customer_phone"
                           placeholder="Số điện thoại" required>
                </div>
            </div>
            <select name="shipping_city" class="form-select form-select-sm mb-3" id="city" aria-label=".form-select-sm"
                    required>
                <option value="" selected>Chọn tỉnh thành</option>
            </select>

            <select name="shipping_district" class="form-select form-select-sm mb-3" id="district"
                    aria-label=".form-select-sm" required>
                <option value="" selected>Chọn quận huyện</option>
            </select>

            <select name="shipping_ward" class="form-select form-select-sm" id="ward" aria-label=".form-select-sm"
                    required>
                <option value="" selected>Chọn phường xã</option>
            </select>

            <div class="d-flex align-items-center mt-3">
                <label for="specific_address"></label>
                <input type="text" name="specific_address" class="form-control" id="specific_address"
                       placeholder="Địa chỉ cụ thể" disabled required>
            </div>
        </div>
    </div>
</div>

<div class="product bg-white rounded-2">
    <section class="product-header row border-bottom mt-2 mx-0 py-3 px-2">
        <div class="col-6 text-dark fw-bold">
            Sản phẩm
        </div>
        <div class="col-2 text-center text-muted">Đơn giá</div>
        <div class="col-2 text-center text-muted">Số lượng</div>
        <div class="col-2 text-center text-muted">Thành tiền</div>
    </section>

    <!--Product items-->
    <section class="cart-items bg-white border-top border">
<%--        Lặp danh sách các sản phẩm được check box ở cart.jsp--%>
        <div class="product row m-2 py-3 border-bottom">
            <div class="col-6 d-flex align-items-center">
                <div class="d-flex align-items-center">
                    <a href="ProductDetail.jsp" class="me-3">
                        <img src="img/product/BiAnVungNuocSauLanRanhThienTaiVaKeDien_1.webp"
                             style="min-width: 80px; height: 80px;" class="img-md img-thumbnail"/>
                    </a>
                    <div class="info">
                        <a href="ProductDetail.jsp" class="nav-link mb-1 text-wrap">
                            Bí Ẩn Vùng Nước Sâu - Lằn Ranh Thiên Tài Và Kẻ Điên
                        </a>
                    </div>
                </div>
            </div>

            <!-- Đơn giá-->
            <div class="col-2 d-flex align-items-center justify-content-center text-center">
                <!--giá đã giảm-->
                <div class="d-flex align-items-center justify-content-center text-center ms-2">
                    <span class="unit-price">147600</span>
                    <i class="fa-solid fa-dong-sign fa-xs"></i>
                </div>
            </div>

            <!--số lượng-->
            <div class="col-2 d-flex align-items-center justify-content-center text-center">
                <span class="quantity">1</span>
            </div>

            <!--tổng cộng-->
            <div class="col-2 d-flex align-items-center justify-content-center text-center text-danger">
                <span class="total-price">147600</span>
                <i class="fa-solid fa-dong-sign fa-xs"></i>
            </div>

        </div>
<%--    Kết thúc lặp--%>

        <div class="shipping row m-0">
            <div class="col-10 d-flex justify-content-end align-items-center p-0">
                <i class="fa-solid fa-truck" style="color: #4b908e;"></i>
                <span class="ms-2">Vận chuyển</span>
            </div>

            <div class="col-2 d-flex justify-content-center align-items-center p-0 my-2 text-danger">
                <div class="ship-price">15000</div>
                <i class="fa-solid fa-dong-sign fa-xs"></i>
            </div>
        </div>
    </section>

    <!--Tổng cộng-->
    <section class="row m-2 py-3">
        <div class="col-10 d-flex justify-content-end align-items-center">
            <span class="count fw-bold">Tổng số tiền (0 sản phẩm):</span>
        </div>
        <div class="col-2 d-flex justify-content-center align-items-center text-danger">
            <span class="total-with-shipping"></span>
            <i class="fa-solid fa-dong-sign fa-xs"></i>
        </div>
    </section>
</div>

<div class="payment-method bg-white border-top border rounded-2 mb-3">
    <div class="row d-flex align-items-center my-2 mx-0 p-3">
        <div class="col-4 h5"> Phương thức thanh toán</div>
        <div class="col-8 d-flex justify-content-center">
            <button type="button" class="btn payment-btn btn-outline-success me-2" id="cash-on-delivery">
                Thanh toán khi nhận hàng
            </button>

<%--            <!-- Nút Chuyển khoản ngân hàng -->--%>
<%--            <button type="button" class="btn payment-btn btn-outline-success" id="bank-transfer">--%>
<%--                Chuyển khoản ngân hàng--%>
<%--            </button>--%>
        </div>
    </div>

    <div class="summary row border-top border-bottom m-0 p-3">
        <div class="col-7"></div>
        <div class="col-5">
            <!-- Tổng tiền hàng -->
            <div class="d-flex justify-content-between p-2">
                <span class="text-start">Tổng tiền hàng</span>
                <div class="text-end d-flex align-items-center">
                    <span class="total-price-all"></span>
                    <i class="fa-solid fa-dong-sign fa-xs"></i>
                </div>
            </div>

            <!-- Tổng tiền phí vận chuyển -->
            <div class="d-flex justify-content-between p-2">
                <span class="text-start">Tổng tiền phí vận chuyển</span>
                <div class="text-end d-flex align-items-center">
                    <div class="ship-price"></div>
                    <i class="fa-solid fa-dong-sign fa-xs"></i>
                </div>

            </div>

            <!-- Tổng thanh toán -->
            <div class="d-flex justify-content-between fw-bold p-2">
                <span class="text-start">Tổng thanh toán</span>
                <div class="text-end d-flex align-items-center text-danger h5">
                    <strong class="total-with-shipping"></strong>
                    <i class="fa-solid fa-dong-sign fa-xs"></i>
                </div>
            </div>
        </div>
    </div>

    <div class="buy-now mx-5 my-3">
        <button id="buy-now" class="btn btn-success w-100" style="background: #4B908E">Đặt hàng</button>
    </div>
</div>

<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>



<%--<script>--%>
<%--    function applyCurrencyFormat() {--%>
<%--        document.querySelectorAll('.unit-price, .total-price, .ship-price, .total-price-all, .total-with-shipping').forEach(element => {--%>
<%--            const amount = parseInt(element.textContent.replace(/\./g, '')); // Bỏ dấu chấm cũ--%>
<%--            if (!isNaN(amount)) {--%>
<%--                element.textContent = formatCurrencyVN(amount);--%>
<%--            }--%>
<%--        });--%>
<%--    }--%>

<%--    document.addEventListener("DOMContentLoaded", function () {--%>
<%--        // Lấy tất cả các sản phẩm--%>
<%--        const products = document.querySelectorAll(".product");--%>

<%--        // Mảng lưu trữ các sản phẩm đã được tính--%>
<%--        let processedProducts = new Set();--%>

<%--        // Tổng số tiền và số lượng sản phẩm--%>
<%--        let totalAmount = 0;--%>
<%--        let totalQuantity = 0;--%>

<%--        // Duyệt qua từng sản phẩm để tính toán--%>
<%--        products.forEach(product => {--%>
<%--            const productId = product.querySelector(".info a").textContent.trim(); // Lấy tên sản phẩm làm ID duy nhất--%>

<%--            // Kiểm tra xem sản phẩm này đã được tính chưa--%>
<%--            if (!processedProducts.has(productId)) {--%>
<%--                const unitPrice = parseFloat(product.querySelector(".unit-price").textContent.trim()) || 0;--%>
<%--                const quantity = parseInt(product.querySelector(".quantity").textContent.trim()) || 0;--%>

<%--                // Nếu số lượng và đơn giá hợp lệ, tiến hành tính toán--%>
<%--                if (quantity > 0 && unitPrice > 0) {--%>
<%--                    const productTotal = unitPrice * quantity;--%>

<%--                    // Cập nhật tổng tiền cho từng sản phẩm--%>
<%--                    product.querySelector(".total-price").textContent = productTotal;--%>

<%--                    // Cộng dồn vào tổng số tiền và số lượng sản phẩm--%>
<%--                    totalAmount += productTotal;--%>
<%--                    totalQuantity += quantity;--%>
<%--                }--%>

<%--                // Đánh dấu sản phẩm đã được tính--%>
<%--                processedProducts.add(productId);--%>
<%--            }--%>
<%--        });--%>

<%--        // Lấy phí ship--%>
<%--        const shippingPrice = parseFloat(document.querySelector(".ship-price").textContent.trim()) || 0;--%>

<%--        // Tính tổng số tiền bao gồm phí ship--%>
<%--        const totalWithShipping = totalAmount + shippingPrice;--%>

<%--        // Cập nhật tổng số tiền và số lượng sản phẩm vào giao diện--%>
<%--        document.querySelectorAll(".ship-price").forEach(element => element.textContent = shippingPrice);--%>
<%--        document.querySelectorAll(".total-with-shipping").forEach(element => element.textContent = totalWithShipping);--%>
<%--        document.querySelector(".total-price-all").textContent = totalAmount;--%>
<%--        document.querySelector(".total-with-shipping").textContent = totalWithShipping;--%>
<%--        document.querySelector(".count").textContent = `Tổng số tiền (${totalQuantity} sản phẩm):`;--%>

<%--        // Áp dụng định dạng tiền tệ--%>
<%--        applyCurrencyFormat();--%>
<%--    });--%>

<%--</script>--%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script>
    var citis = document.getElementById("city");
    var districts = document.getElementById("district");
    var wards = document.getElementById("ward");
    var Parameter = {
        url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
        method: "GET",
        responseType: "application/json",
    };
    var promise = axios(Parameter);
    promise.then(function (result) {
        renderCity(result.data);
    });

    function renderCity(data) {
        for (const x of data) {
            citis.options[citis.options.length] = new Option(x.Name, x.Id);
        }
        citis.onchange = function () {
            district.length = 1;
            ward.length = 1;
            if(this.value != ""){
                const result = data.filter(n => n.Id === this.value);

                for (const k of result[0].Districts) {
                    district.options[district.options.length] = new Option(k.Name, k.Id);
                }
            }
        };
        district.onchange = function () {
            ward.length = 1;
            const dataCity = data.filter((n) => n.Id === citis.value);
            if (this.value != "") {
                const dataWards = dataCity[0].Districts.filter(n => n.Id === this.value)[0].Wards;

                for (const w of dataWards) {
                    wards.options[wards.options.length] = new Option(w.Name, w.Id);
                }
            }
        };
    }
</script>

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const paymentButtons = document.querySelectorAll(".payment-btn");

        paymentButtons.forEach(button => {
            button.addEventListener("click", function () {
                // Loại bỏ lớp 'active' khỏi tất cả các nút
                paymentButtons.forEach(btn => btn.classList.remove("active"));

                // Thêm lớp 'active' vào nút được bấm
                this.classList.add("active");
            });
        });
    });
</script>

<!--Chuyển sang trang đơn hàng khi nhấn nút mua ngay-->
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // Lấy nút đặt hàng
        const orderButton = document.getElementById("buy-now");

        // Thêm sự kiện click để chuyển trang
        orderButton.addEventListener("click", function () {
            // Chuyển hướng sang trang BuyProduct.jsp
            window.location.href = "purchaseOrder.jsp";
        });
    });
</script>

</body>
</html>
