<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:15 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ page import="org.apache.commons.text.StringEscapeUtils" %>--%>
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
                    <a href="home">
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
                       placeholder="Địa chỉ cụ thể" required>
            </div>
        </div>
    </div>
</div>

<div class="productContent bg-white rounded-2">
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
        <div id="product-list"></div>

        <div class="shipping row m-0">
            <div class="col-10 d-flex justify-content-end align-items-center p-0">
                <i class="fa-solid fa-truck" style="color: #4b908e;"></i>
                <span class="ms-2">Vận chuyển</span>
            </div>

            <div class="col-2 d-flex justify-content-center align-items-center p-0 my-2 text-danger">
                <div class="ship-price">
                    <f:formatNumber value="15000"/>
                </div>
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
                    <div class="ship-price">
                        <f:formatNumber value="15000"/>
                    </div>
                    <i class="fa-solid fa-dong-sign fa-xs"></i>
                </div>

            </div>

            <!-- Tổng thanh toán -->
            <div class="d-flex justify-content-between fw-bold p-2">
                <span class="text-start">Tổng thanh toán</span>
                <div class="text-end d-flex align-items-center text-danger h5">
                    <strong class="total-with-shipping2"></strong>
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

<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.21.1/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
    var citis = document.getElementById("city");
    var districts = document.getElementById("district");
    var wards = document.getElementById("ward");
    var Parameter = {
        url: "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json",
        method: "GET",
        responseType: "json",
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
            if (this.value != "") {
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

<%--//Chuyển từ file Json qua các đối tượng để đổ dữ liệu vô JSP--%>
<script>

    const products = <%= (String) session.getAttribute("selectedProducts")%>;
    console.log(products);
    let selectProducts = Array.isArray(products) ? products : JSON.parse(products);
    // let selectProducts = JSON.parse(products);

    console.log(selectProducts);

    //Render ra HTML
    const productContainer = document.getElementById("product-list");
    if (selectProducts && selectProducts.length > 0) {
        selectProducts.forEach((product, index) => {
            console.log(product);
            const tempContainer = document.createElement("div");
            tempContainer.innerHTML = `
                <div class="product row m-2 py-3 border-bottom" data-product-id="">
                    <div class="col-6 d-flex align-items-center">
                        <div class="d-flex align-items-center">
                                <img src="" style="min-width: 80px; height: 80px;" class="img-md img-thumbnail"/>
                            <div class="info">
                                    Tên sản phẩm không có
                            </div>
                        </div>
                    </div>

                    <!-- Đơn giá-->
                    <div class="col-2 d-flex align-items-center justify-content-center text-center">
                        <div class="d-flex align-items-center justify-content-center text-center ms-2">
                            <span class="unit-price">N/A</span>
                            <i class="fa-solid fa-dong-sign fa-xs"></i>
                        </div>
                    </div>

                    <!-- Số lượng-->
                    <div class="col-2 d-flex align-items-center justify-content-center text-center">
                        <span class="quantity">0</span>
                    </div>

                    <!-- Tổng cộng-->
                    <div class="col-2 d-flex align-items-center justify-content-center text-center text-danger">
                        <span class="total-price">N/A</span>
                        <i class="fa-solid fa-dong-sign fa-xs"></i>
                    </div>
                </div>
            `;

            // Lấy phần tử vừa tạo
            const productElement = tempContainer.firstElementChild;

            // Gán giá trị động vào các phần tử con
            productElement.setAttribute("data-product-id", product.productId);
            productElement.querySelector(".img-thumbnail").src = product.productImg;
            productElement.querySelector(".info").textContent = product.productName;

            const formattedUnitPrice = product.unitPrice.toLocaleString('vi-VN');
            const formattedTotalPrice = product.totalPrice.toLocaleString('vi-VN');

            productElement.querySelector(".unit-price").textContent = formattedUnitPrice;
            productElement.querySelector(".quantity").textContent = product.quantity;
            productElement.querySelector(".total-price").textContent = formattedTotalPrice;

            // Thêm vào DOM
            productContainer.appendChild(productElement);

        });
    } else {
        productContainer.innerHTML = "<p>Không có sản phẩm nào trong danh sách thanh toán.</p>";
    }
</script>

<script>
    function calculateTotals() {
        const productRows = document.querySelectorAll('.product'); // Lấy danh sách các sản phẩm
        let totalQuantity = 0;
        let totalPrice = 0;

        productRows.forEach((row) => {
            const quantityElement = row.querySelector('.quantity');
            const totalPriceElement = row.querySelector('.total-price');

            // Lấy giá trị số lượng
            const quantity = parseInt(quantityElement.textContent.trim(), 10);
            if (!isNaN(quantity)) {
                totalQuantity += quantity;
            }

            // Lấy giá trị tổng giá
            const priceText = totalPriceElement.textContent.trim().replace(/[.,\s]/g, ''); // Loại bỏ dấu định dạng
            const price = parseInt(priceText, 10);
            if (!isNaN(price)) {
                totalPrice += price;
                console.log(totalPrice);
            }
        });

        // Hiển thị tổng số lượng sản phẩm
        const countElement = document.querySelector('.count');
        if (countElement) {
            countElement.textContent = "Tổng thanh toán (" + totalQuantity + " sản phẩm):";
        }

        // Hiển thị tổng giá trị tiền bao gồm shipping
        const totalWithShippingElement = document.querySelector('.total-with-shipping');
        if (totalWithShippingElement) {
            const shippingFee = 15000; // Giá vận chuyển cố định
            const totalWithShipping = totalPrice + shippingFee;
            console.log(totalPrice);
            totalWithShippingElement.textContent = totalWithShipping.toLocaleString('vi-VN');
        }

        //Hiển thị tổng giá sản phẩm
        const totalProductPrice = document.querySelector('.total-price-all');
        if (totalProductPrice) {
            totalProductPrice.textContent = totalPrice.toLocaleString('vi-VN');
        }

        const totalWithShippingElement2 = document.querySelector('.total-with-shipping2');
        if (totalWithShippingElement2) {
            const shippingFee = 15000; // Giá vận chuyển cố định
            const totalWithShipping = totalPrice + shippingFee;
            console.log(totalPrice);
            totalWithShippingElement2.textContent = totalWithShipping.toLocaleString('vi-VN');
        }
    }

    // Gọi hàm tính toán sau khi render danh sách sản phẩm
    if (selectProducts && selectProducts.length > 0) {
        calculateTotals();
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
            window.location.href = "invoice";
        });
    });
</script>

<%-- Thu thập data để chuyển dữ liệu qua backend--%>
<script>
    const citySelect = document.getElementById("city");
    const districtSelect = document.getElementById("district");
    const wardSelect = document.getElementById("ward");
    const specificAddressInput = document.getElementById("specific_address");

    const url = "https://raw.githubusercontent.com/kenzouno1/DiaGioiHanhChinhVN/master/data.json";

    // Fetch data
    axios.get(url)
        .then(response => {
            renderCity(response.data);
        })
        .catch(error => {
            console.error('Error fetching data:', error);
            alert("Đã có lỗi khi tải dữ liệu địa lý hành chính.");
        });

    // Render cities to the city select dropdown
    function renderCity(data) {
        // Populate cities
        data.forEach(city => {
            const option = new Option(city.Name, city.Id);
            citySelect.appendChild(option);
        });

        // Event handler for city selection
        citySelect.onchange = function() {
            districtSelect.length = 1; // Reset districts
            wardSelect.length = 1; // Reset wards
            if (this.value) {
                const city = data.find(c => c.Id === this.value);
                city.Districts.forEach(district => {
                    const option = new Option(district.Name, district.Id);
                    districtSelect.appendChild(option);
                });
            }
        };

        // Event handler for district selection
        districtSelect.onchange = function() {
            wardSelect.length = 1; // Reset wards
            if (this.value) {
                const city = data.find(c => c.Id === citySelect.value);
                const district = city.Districts.find(d => d.Id === this.value);
                district.Wards.forEach(ward => {
                    const option = new Option(ward.Name, ward.Id);
                    wardSelect.appendChild(option);
                });
            }
        };
    }

    // Function to build full address from selected data
    function getFullAddress(cityId, districtId, wardId, specificAddress) {
        const city = getCityById(cityId);
        const district = city ? getDistrictById(city, districtId) : null;
        const ward = district ? getWardById(district, wardId) : null;

        const cityName = city ? city.Name : '';
        const districtName = district ? district.Name : '';
        const wardName = ward ? ward.Name : '';

        return specificAddress + ', ' + wardName + ', ' + districtName + ', ' + cityName;
    }

    // Helper functions to find city, district, and ward by ID
    function getCityById(cityId) {
        function getCityById(cityId) {
            var option = citySelect.querySelector('option[value="' + cityId + '"]');
            return option ? { Name: option.textContent } : null;
        }
    }

    function getDistrictById(city, districtId) {
        return city.Districts.find(district => district.Id === districtId);
    }

    function getWardById(district, wardId) {
        return district.Wards.find(ward => ward.Id === wardId);
    }

    const buyNowButton = document.getElementById("buy-now");
    buyNowButton.addEventListener("click", function() {
        // Thu thập dữ liệu người dùng từ form
        const recipientName = document.querySelector("input[name='shipping_full_name']").value;
        const recipientPhone = document.querySelector("input[name='shipping_phone']").value;
        const specificAddress = specificAddressInput.value;

        const shippingCity = citySelect.value;
        const shippingDistrict = districtSelect.value;
        const shippingWard = wardSelect.value;

        // Thu thập danh sách sản phẩm từ giỏ hàng
        const products = selectProducts.map(product => ({
            productId: product.productId,
            quantity: product.quantity,
            unitPrice: product.unitPrice
        }));

        // Phí vận chuyển cố định
        const shippingFee = 15000;

        // Tính tổng tiền
        const totalPrice = selectProducts.reduce((sum, product) => sum + (product.unitPrice * product.quantity), 0);
        const totalAmount = totalPrice + shippingFee;

        // Thu thập phương thức thanh toán
        let paymentMethod = 'COD'; // Phương thức mặc định (Thanh toán khi nhận hàng)
        // if (document.getElementById("bank-transfer").classList.contains("active")) {
        //     paymentMethod = 'BANK_TRANSFER'; // Chuyển khoản ngân hàng
        // }

        // Tạo đối tượng gửi dữ liệu
        const orderData = {
            recipientName: recipientName,
            recipientPhone: recipientPhone,
            shippingAddress: getFullAddress(shippingCity, shippingDistrict, shippingWard, specificAddress),
            products: products,
            shippingFee: shippingFee,
            totalAmount: totalAmount,
            paymentMethod: paymentMethod
        };

        console.log(orderData);

        // Gửi yêu cầu AJAX để tạo đơn hàng mới
        $.ajax({
            url: 'invoice?action=create', // URL endpoint của backend
            type: 'POST',
            contentType: 'application/json', // Loại nội dung là JSON
            data: JSON.stringify(orderData), // Chuyển đổi đối tượng thành JSON
            success: function(response) {
                // Nếu yêu cầu thành công, chuyển hướng đến trang đơn hàng
                window.location.href = '/invoice?action=list&userId=' + userSession.getUid(); // Chuyển hướng đến trang đơn hàng chờ xử lý
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                alert('Đã xảy ra lỗi khi tạo đơn hàng!');
            }
        });
    });
</script>

</body>
</html>
