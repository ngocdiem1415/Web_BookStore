<%@ page import="vn.edu.hcmuaf.fit.bookstore.beans.User" %><%--
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
            <div class="row align-items-center my-3">
                <div class="col-11 d-flex align-items-center">
                    <i class="fa-solid fa-location-dot fa-lg" style="color: #dc3545;"></i>
                    <span class="ps-3 text-danger h5 mb-0">Địa Chỉ Nhận Hàng</span>
                </div>
                <div class="col-1">
                    <button id="save" class="btn btn-success w-100" style="background: #4B908E;">Lưu</button>
                </div>
            </div>
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
        <div id="product-list">
            <c:choose>
                <c:when test="${empty selectedProducts}">
                    <p>Không có sản phẩm nào được chọn để thanh toán</p>
                </c:when>
                <c:otherwise>
                    <c:forEach var="product" items="${selectedProducts}">
                        <div class="product row m-2 py-3 border-bottom" data-product-id="${product.id}">
                            <div class="col-6 d-flex align-items-center">
                                <div class="d-flex align-items-center">
                                    <img src="${product.book.image.sourceImg}" style="min-width: 80px; height: 80px;"
                                         class="img-md img-thumbnail"/>
                                    <div class="info">
                                            ${product.book.title}
                                    </div>
                                </div>
                            </div>

                            <!-- Đơn giá-->
                            <div class="col-2 d-flex align-items-center justify-content-center text-center">
                                <div class="d-flex align-items-center justify-content-center text-center ms-2">
                                    <c:if test="${product.book.promotionId == 0}">
                                    <span class="unit-price">
                                        <f:formatNumber value="${product.book.originalPrice}"/>
                                    </span>
                                        <i class="fa-solid fa-dong-sign fa-xs"></i>
                                    </c:if>
                                    <c:if test="${product.book.promotionId != 0}">
                                    <span class="unit-price">
                                        <f:formatNumber value="${product.book.salePrice}"/>
                                    </span>
                                        <i class="fa-solid fa-dong-sign fa-xs"></i>
                                    </c:if>
                                </div>
                            </div>

                            <!-- Số lượng-->
                            <div class="col-2 d-flex align-items-center justify-content-center text-center">
                                <span class="quantity">${product.quantity}</span>
                            </div>

                            <!-- Tổng cộng-->
                            <div class="col-2 d-flex align-items-center justify-content-center text-center text-danger">
                            <span class="total-price">
                                <f:formatNumber value="${product.book.salePrice * product.quantity}"/>
                            </span>
                                <i class="fa-solid fa-dong-sign fa-xs"></i>
                            </div>
                        </div>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
        </div>

        <div class="shipping row m-0">
            <div class="col-10 d-flex justify-content-end align-items-center p-0">
                <i class="fa-solid fa-truck" style="color: #4b908e;"></i>
                <span class="ms-2">Vận chuyển</span>
            </div>

            <div class="col-2 d-flex justify-content-center align-items-center p-0 my-2 text-danger">
                <div class="ship-price">0</div>
                <i class="fa-solid fa-dong-sign fa-xs"></i>
            </div>
        </div>
    </section>

    <!--Tổng cộng-->
    <section class="row m-2 py-3">
        <div class="col-10 d-flex justify-content-end align-items-center">
            <span class="count fw-bold">Tổng số tiền (${shippingInfo.totalQuantity}):</span>
        </div>
        <div class="col-2 d-flex justify-content-center align-items-center text-danger">
            <span class="total-with-shipping">
                <f:formatNumber value="${shippingInfo.totalPrice}"/>
            </span>
            <i class="fa-solid fa-dong-sign fa-xs"></i>
        </div>
    </section>
</div>

<div class="payment-method bg-white border-top border rounded-2 mb-3">
    <div class="row d-flex align-items-center my-2 mx-0 p-3">
        <div class="col-4 h5">Phương thức thanh toán</div>
        <div class="col-8 d-flex justify-content-center">
            <select class="form-select w-50" id="payment-method-select">
                <option value="1">Thanh toán khi nhận hàng (COD)</option>
                <option value="2">Chuyển khoản ngân hàng (VNPay)</option>
            </select>
        </div>
    </div>


    <div class="summary row border-top border-bottom m-0 p-3">
        <div class="col-7"></div>
        <div class="col-5">
            <!-- Tổng tiền hàng -->
            <div class="d-flex justify-content-between p-2">
                <span class="text-start">Tổng tiền hàng</span>
                <div class="text-end d-flex align-items-center">
                    <span class="total-price-all">
                        <f:formatNumber value="${shippingInfo.totalPrice}"/>
                    </span>
                    <i class="fa-solid fa-dong-sign fa-xs"></i>
                </div>
            </div>

            <!-- Tổng tiền phí vận chuyển -->
            <div class="d-flex justify-content-between p-2">
                <span class="text-start">Tổng tiền phí vận chuyển</span>
                <div class="text-end d-flex align-items-center">
                    <div class="ship-price">0</div>
                    <i class="fa-solid fa-dong-sign fa-xs"></i>
                </div>

            </div>

            <!-- Tổng thanh toán -->
            <div class="d-flex justify-content-between fw-bold p-2">
                <span class="text-start">Tổng thanh toán</span>
                <div class="text-end d-flex align-items-center text-danger h5">
                    <strong class="total-with-shipping">
                        <f:formatNumber value="${shippingInfo.totalPrice}"/>
                    </strong>
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
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

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

<%-- Thu thập data để chuyển dữ liệu qua backend--%>
<script>
    const citySelect = document.getElementById("city");
    const districtSelect = document.getElementById("district");
    const wardSelect = document.getElementById("ward");
    const specificAddressInput = document.getElementById("specific_address");
    let isShippingSaved = false;

    const ghnData = {
        cities: [],
        districts: {},
        wards: {}
    };

    //Load data địa lí hành chính VN từ api GHN
    // Load danh sách tỉnh (provinces) từ BE
    axios.get("/api/ghn/provinces")
        .then(response => {
            // Giả định API BE trả về JSON có thuộc tính 'data' chứa danh sách tỉnh
            ghnData.cities = response.data.data;
            ghnData.cities.forEach(city => {
                const option = new Option(city.ProvinceName, city.ProvinceID);
                citySelect.appendChild(option);
            });
        })
        .catch(err => console.error("Lỗi load tỉnh:", err));

    // Khi chọn tỉnh, load danh sách quận (districts)
    citySelect.onchange = function () {
        // Reset district và ward
        districtSelect.length = 1;
        wardSelect.length = 1;
        const provinceId = parseInt(this.value);
        if (!provinceId) return;

        axios.post("/api/ghn/districts", new URLSearchParams({province_id: provinceId}))
            .then(response => {
                ghnData.districts[provinceId] = response.data.data;
                response.data.data.forEach(d => {
                    const option = new Option(d.DistrictName, d.DistrictID);
                    districtSelect.appendChild(option);
                });
            })
            .catch(err => console.error("Lỗi load quận:", err));
    };

    // Khi chọn quận, load danh sách phường (wards)
    districtSelect.onchange = function () {
        // Reset ward
        wardSelect.length = 1;
        const districtId = parseInt(this.value);
        if (!districtId) return;

        axios.post("/api/ghn/wards", new URLSearchParams({district_id: districtId}))
            .then(response => {
                ghnData.wards[districtId] = response.data.data;
                response.data.data.forEach(w => {
                    const option = new Option(w.WardName, w.WardCode);
                    wardSelect.appendChild(option);
                });
            })
            .catch(err => console.error("Lỗi load phường:", err));
    };

    //Tính phí vận chuyển khi bấm vào nút lưu
    document.getElementById("save").addEventListener("click", function () {
        const recipientName = document.querySelector("input[name='shipping_full_name']").value;
        const recipientPhone = document.querySelector("input[name='shipping_phone']").value;
        const specificAddress = specificAddressInput.value;
        const shippingCity = citySelect.value;
        const shippingDistrict = districtSelect.value;
        const shippingWard = wardSelect.value;

        if (!recipientName || !recipientPhone || !specificAddress || !shippingCity || !shippingDistrict || !shippingWard) {
            alert("Vui lòng điền đầy đủ thông tin giao hàng.");
            return;
        }
        const requestData = {
            toDistrictId: parseInt(shippingDistrict),
            toWardCode: shippingWard
        };

        $.ajax({
            url: "/api/ghn/calculate-shipping",
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify(requestData),
            success: function (response) {
                isShippingSaved = true; //Đánh dấu là đã lưu địa chỉ và tính phí
                const fee = response.fee;
                const totalWithShipping = ${shippingInfo.totalPrice} +fee;
                $(".ship-price").text(fee.toLocaleString());
                $(".total-with-shipping").text(totalWithShipping.toLocaleString());
                alert("Cập nhật địa chỉ và phí giao hàng thành công!");
            },
            error: function (xhr, status, error) {
                console.error("Lỗi khi tính phí vận chuyển:", error);
                alert("Không thể tính phí vận chuyển. Vui lòng thử lại.");
            }
        });
    });

    // Tạo địa chỉ đầy đủ
    function getFullAddress_GHN(provinceId, districtId, wardCode, specificAddress) {
        const city = ghnData.cities.find(c => c.ProvinceID == provinceId);
        const districtList = ghnData.districts[provinceId] || [];
        const district = districtList.find(d => d.DistrictID == districtId);
        const wardList = ghnData.wards[districtId] || [];
        const ward = wardList.find(w => w.WardCode == wardCode);

        return specificAddress + ', ' +
            (ward ? ward.WardName : '') + ', ' +
            (district ? district.DistrictName : '') + ', ' +
            (city ? city.ProvinceName : '');
    }

    //Tìm ra districtId và wardCode dựa vào địa chỉ có sẵn
    function findLocationIdsFromAddress(address, ghnData) {
        const normalize = (str) =>
            str.toLowerCase().normalize("NFD").replace(/[\u0300-\u036f]/g, "").trim();

        const normalizedAddress = normalize(address);

        let foundCity = null;
        for (const city of ghnData.cities) {
            if (normalizedAddress.includes(normalize(city.ProvinceName))) {
                foundCity = city;
                break;
            }
        }

        if (!foundCity) {
            console.warn("Không tìm thấy tỉnh/thành trong địa chỉ.");
            return null;
        }

        const districts = ghnData.districts[foundCity.ProvinceID] || [];
        let foundDistrict = null;
        for (const district of districts) {
            if (normalizedAddress.includes(normalize(district.DistrictName))) {
                foundDistrict = district;
                break;
            }
        }

        if (!foundDistrict) {
            console.warn("Không tìm thấy quận/huyện trong địa chỉ.");
            return null;
        }

        const wards = ghnData.wards[foundDistrict.DistrictID] || [];
        let foundWard = null;
        for (const ward of wards) {
            if (normalizedAddress.includes(normalize(ward.WardName))) {
                foundWard = ward;
                break;
            }
        }

        return {
            provinceId: foundCity.ProvinceID,
            districtId: foundDistrict?.DistrictID,
            wardCode: foundWard?.WardCode
        };
    }

    //Xóa item trong cart khi đặt hàng thành công
    function removeProduct(productKey, callback) {
        // let id = productKey;
        $.ajax({
            url: "remove-book-in-cart",
            type: "GET",
            data: {
                productKey: productKey,
            },
            success: function (data) {
                console.log("delete book" + productKey + "is success!");
                if (callback) callback();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.error("Error during delete book:", textStatus, errorThrown);
            }
        });
    }

    const buyNowButton = document.getElementById("buy-now");
    buyNowButton.addEventListener("click", function () {
        const recipientName = document.querySelector("input[name='shipping_full_name']").value;
        const recipientPhone = document.querySelector("input[name='shipping_phone']").value;
        const specificAddress = specificAddressInput.value;
        const shippingCity = citySelect.value;
        const shippingDistrict = districtSelect.value;
        const shippingWard = wardSelect.value;

        if (!isShippingSaved) {
            alert("Vui lòng bấm nút Lưu để cập nhật địa chỉ và tính phí giao hàng trước khi đặt hàng.");
            return;
        }

        const paymentMethodValue = document.getElementById("payment-method-select").value;
        const paymentMethod = (paymentMethodValue === "2") ? "BANK_TRANSFER" : "COD";

        const fullAddress = getFullAddress_GHN(shippingCity, shippingDistrict, shippingWard, specificAddress);

        const orderData = {
            recipientName: recipientName,
            recipientPhone: recipientPhone,
            address: fullAddress,
            paymentMethod: paymentMethod
        };

        $.ajax({
            url: '/checkout',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(orderData),
            success: function (response) {
                const invoiceId = response.invoiceId;
                let removeCount = 0;
                const selectedIds = <%= request.getAttribute("selectedIds") %>;

                for (let i = 0; i < selectedIds.length; i++) {
                    removeProduct(selectedIds[i], () => {
                        removeCount++;
                        if (removeCount === selectedIds.length) {
                            if (paymentMethod === 'COD') {
                                window.location.href = '/invoice';
                            } else {
                                window.location.href = '/payment-vnpay?invoiceId=' + invoiceId;
                            }
                        }
                    });
                }
            },
            error: function (xhr) {
                if (xhr.status === 400) {
                    const res = JSON.parse(xhr.responseText);
                    alert(res.error);
                    window.location.href = '/cart';
                } else {
                    alert('Đã xảy ra lỗi khi tạo đơn hàng!');
                }
            }
        });
    });
</script>

</body>
</html>