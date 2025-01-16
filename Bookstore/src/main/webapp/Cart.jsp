<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:14 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Giỏ hàng</title>

    <!--    font awesome-->
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">

    <!--    bootstrap-->
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!--jquery-->
    <script src="js/jquery.min.js"></script>

    <!--    CSS-->
    <link rel="stylesheet" href="css/Header.css">
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/Cart.css">

</head>
<body>
<!--Header-->
<jsp:include page="Header.jsp"></jsp:include>
<!-- /HEADER -->


<!-- Cart Content-->
<div class="container-cart container">
    <div class="cart-title my-4">
        <h3 class="boldGreen">Giỏ hàng</h3>
    </div>
    <div class="cart">
        <!--header of cart-->
        <section class="cart-header row text-muted bg-white border-bottom rounded-2 my-2 mx-0 py-3 px-2">
            <div class="col-5">
                Sản phẩm
            </div>
            <div class="col-2 text-center">Đơn giá</div>
            <div class="col-2 text-center">Số lượng</div>
            <div class="col-2 text-center">Tổng cộng</div>
            <div class="col-1 text-center">Thao tác</div>
        </section>

        <!--cart items-->
        <section class="cart-items bg-white border-top border rounded-2">
            <c:if test="${empty cart.listBook}">
                <p>Chưa có sản phẩm nào trong giỏ hàng</p>
            </c:if>
            <c:forEach var="entry" items="${cart.listBook}">
                <div class="product row m-2 py-3 border-bottom" data-product-id="${entry.value.book.bId}">
                    <div class="col-5 d-flex align-items-center">
                        <label class="me-4">
                            <input type="checkbox" name="item" class="item-checkbox"/>
                        </label>

                        <div class="d-flex align-items-center">
                            <a href="#" class="me-3">
                                <img src="${entry.value.book.image.sourceImg}" alt="product"
                                     style="min-width: 80px; height: 80px;" class="img-md img-thumbnail"/>
                            </a>
                            <div class="info">
                                <a href="book-detail?id=${entry.value.book.bId}"
                                   class="nav-link mb-1 text-wrap product-name">
                                        ${entry.value.book.title}
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Đơn giá-->
                    <div class="col-2 d-flex align-items-center justify-content-center text-center">

                        <!--giá gốc-->
                        <c:if test="${entry.value.book.promotionId == 0}">
                            <div class="d-flex align-items-center justify-content-center text-center small">
                                <span class="original-price"><f:formatNumber value="${entry.value.book.originalPrice}"/>
                                <i class="fa-solid fa-dong-sign fa-xs"></i></span>
                            </div>
                        </c:if>

                        <c:if test="${entry.value.book.promotionId != 0}">
                            <div class="d-flex align-items-center justify-content-center text-center small text-muted text-decoration-line-through">
                                <span class="original-price"><f:formatNumber value="${entry.value.book.originalPrice}"/>
                                <i class="fa-solid fa-dong-sign fa-xs"></i></span>
                            </div>
                            <!--giá đã giảm-->
                            <div class="d-flex align-items-center justify-content-center text-center ms-2">
                                <span class="unit-price"><f:formatNumber value="${entry.value.book.salePrice}"/>
                                <i class="fa-solid fa-dong-sign fa-xs"></i></span>
                            </div>
                        </c:if>
                    </div>

                    <!--số lượng-->
                    <div class="col-2 d-flex align-items-center justify-content-center text-center">
                        <button class="decrease btn btn-white border border-secondary px-3" type="button"
                                data-mdb-ripple-color="dark" onclick="updateQuantity(${entry.key}, -1)">
                            <i class="fas fa-minus"></i>
                        </button>
                        <input type="text"
                               class="quantity form-control text-center border border-secondary mx-1"
                               placeholder="1"
                               value="<f:formatNumber value="${entry.value.quantity}"/>"
                               disabled
                               aria-label="Example text with button addon"
                               aria-describedby="button-addon1"/>
                        <button class="increase btn btn-white border border-secondary px-3" type="button"
                                data-mdb-ripple-color="dark" onclick="updateQuantity(${entry.key}, 1)">
                            <i class="fas fa-plus"></i>
                        </button>
                    </div>

                    <!--tổng cộng-->
                    <div class="col-2 d-flex align-items-center justify-content-center text-center text-danger">
                        <span class="total-price"><f:formatNumber
                                value="${entry.value.book.salePrice * entry.value.quantity}"/>
                        <i class="fa-solid fa-dong-sign fa-xs"></i></span>
                    </div>

                    <!--thao tác-->
                    <div class="col-1 d-flex align-items-center justify-content-center text-center">
                        <button class="delete btn btn-white border border-secondary px-3" type="button"
                                data-mdb-ripple-color="dark" onclick="removeProduct(${entry.key})">
                            <i class="fas fa-trash-alt"></i>
                        </button>
                    </div>
                </div>
            </c:forEach>
        </section>
    </div>

    <!--footer of cart-->
    <div class="cart-footer row py-3 m-0 border-top justify-content-lg-end">
        <%--        <div class="col-2 text-muted">--%>
        <%--            <label class="mx-3">--%>
        <%--                <input type="checkbox" class="select-all" onclick="toggleSelectAll(this)">--%>
        <%--            </label>--%>
        <%--            Chọn tất cả--%>
        <%--        </div>--%>
        <%--        <div class="col-3 text-muted d-flex justify-content-start">--%>
        <%--            <button class="delete-check btn px-3 me-3" type="button" onclick="removeProduct(${entry.key})">--%>
        <%--                Xóa--%>
        <%--            </button>--%>

        <%--            <!--confirm-->--%>
        <%--            <div id="confirm-modal" class="modal hidden">--%>
        <%--                <div class="modal-content">--%>
        <%--                    <p id="modal-message">Bạn có chắc chắn muốn xóa sản phẩm này?</p>--%>
        <%--                    <div class="modal-buttons">--%>
        <%--                        <button id="confirm-delete" class="btn btn-danger">Xóa</button>--%>
        <%--                        <button id="cancel-delete" class="btn btn-secondary">Hủy</button>--%>
        <%--                    </div>--%>
        <%--                </div>--%>
        <%--            </div>--%>

        <%--            <button class="love-check btn px-3 text-danger" type="button">--%>
        <%--                Yêu thích--%>
        <%--            </button>--%>

        <%--            <!-- Thông báo -->--%>
        <%--            <div id="notification"--%>
        <%--                 class="alert alert-success text-center position-fixed top-50 start-50 translate-middle hidden"--%>
        <%--                 role="alert">--%>
        <%--                Đây là thông báo mặc định.--%>
        <%--            </div>--%>


        <%--        </div>--%>
        <div class="col-5 d-flex justify-content-end">
            <span class="count">Tổng thanh toán (0 sản phẩm):</span>
            <strong class="text-danger h5">
                <span class="total-price-check ms-2">0</span>
                <i class="fa-solid fa-dong-sign fa-xs"></i>
            </strong>
        </div>
        <div class="col-2 d-flex justify-content-center">
            <button id="buy-button" class="MUA btn px-3" type="button">
                Mua hàng
            </button>
        </div>
    </div>
</div>


<!--format tiền tệ-->
<script src="js/bootstrap.bundle.min.js"></script>


<!--footer cart-->
<script>
    // Hàm tính lại tổng giá trị của các sản phẩm được chọn
    function updateSelectedTotal() {
        // Lấy tất cả các checkbox và các thẻ chứa giá trị tổng tiền tương ứng
        const checkboxes = document.querySelectorAll('.item-checkbox');
        let totalSelectedPrice = 0;

        // Duyệt qua từng checkbox
        checkboxes.forEach((checkbox, index) => {
            if (checkbox.checked) {
                // Nếu checkbox được chọn, lấy giá trị trong thẻ .total-price tương ứng
                const productRow = checkbox.closest('.product'); // Tìm dòng sản phẩm tương ứng
                if (productRow) {
                    const totalPriceElement = productRow.querySelector('.total-price');
                    if (totalPriceElement) {
                        const priceText = totalPriceElement.textContent.trim();
                        // Loại bỏ dấu phẩy hoặc ký tự không phải số và chuyển sang dạng số
                        const price = parseFloat(priceText.replace(/,/g, '').replace(/\s/g, ''));
                        if (!isNaN(price)) {
                            totalSelectedPrice += price;
                        }
                    }
                }
            }
        });

        // Cập nhật tổng giá trị vào giao diện
        const totalPriceCheckElement = document.querySelector('.total-price-check');
        if (totalPriceCheckElement) {
            totalPriceCheckElement.textContent = new Intl.NumberFormat('vi-VN', {
                style: 'currency',
                currency: 'VND',
                minimumFractionDigits: 0
            }).format(totalSelectedPrice).replace('₫', ''); // Loại bỏ ký hiệu ₫ nếu không cần
        }

        // Cập nhật số lượng sản phẩm được chọn
        const countElement = document.querySelector('.count');
        if (countElement) {
            const selectedCount = Array.from(checkboxes).filter(checkbox => checkbox.checked).length;
            countElement.textContent = 'Tổng thanh toán ('+selectedCount+' sản phẩm):';
        }
    }

    // Gọi hàm khi checkbox thay đổi
    document.querySelectorAll('.item-checkbox').forEach(checkbox => {
        checkbox.addEventListener('change', updateSelectedTotal);
    });
</script>

<script>
    function updateQuantity(productKey, value) {
        let id = productKey;
        var newQuantity = value;
        $.ajax({
            url: "update-quantity",
            type: "GET",
            data: {
                productKey: id,
                quantity: newQuantity
            },
            success: function (data) {
                window.location.reload();
                console.log("Update quantity is success!");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.error("Error during update quantity:", textStatus, errorThrown);
            }
        });
    }

    function removeProduct(productKey) {
        let id = productKey;
        $.ajax({
            url: "remove-book-in-cart",
            type: "GET",
            data: {
                productKey: id,
            },
            success: function (data) {
                window.location.reload();
                console.log("delete book is success!");
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.error("Error during delete book:", textStatus, errorThrown);
            }
        });
    }
</script>

<%--Chuyển các sản phẩm được checkbox từ cart sang checkout khi nhấn nút buy-now--%>
<script>
    $(document).ready(function () {
        $("#buy-button").click(function () {
            // Lấy tất cả các checkbox
            const checkboxes = $('.item-checkbox');
            const selectedProducts = [];

            // Lấy danh sách sản phẩm được chọn
            checkboxes.each(function () {
                if ($(this).is(":checked")) {
                    const productRow = $(this).closest('.product');
                    if (productRow.length > 0) {
                        const productId = productRow.data('product-id'); // Lấy productId
                        const productImg = productRow.find('.img-thumbnail').attr('src');
                        const productName = productRow.find('.product-name').text().trim();
                        const quantity = parseInt(productRow.find('.quantity').val().trim());
                        const unitPriceText = productRow.find('.unit-price').text().trim();
                        const totalPriceText = productRow.find('.total-price').text().trim();
                        const unitPrice = parseFloat(unitPriceText.replace(/,/g, '').replace(/\s/g, ''));
                        const totalPrice = parseFloat(totalPriceText.replace(/,/g, '').replace(/\s/g, ''));

                        if (!isNaN(unitPrice) && !isNaN(totalPrice) && productId && quantity > 0) {
                            selectedProducts.push({
                                productId: productId,
                                productImg: productImg,
                                productName: productName,
                                unitPrice: unitPrice,
                                quantity: quantity,
                                totalPrice: totalPrice
                            });
                        }
                    }
                }
            });

            if (selectedProducts.length > 0) {
                // Mã hóa danh sách sản phẩm thành JSON
                const encodedData = encodeURIComponent(JSON.stringify(selectedProducts));

                // Gửi yêu cầu GET tới Servlet với dữ liệu JSON
                window.location.href = '/process-checkout?selectedProducts=' + encodedData;
                // $.ajax({
                //     url: "/process-checkout", // Đường dẫn tới Servlet
                //     method: "POST",
                //     contentType: "application/json",
                //     data: JSON.stringify({action: "checkout", selectedProducts: selectedProducts}),
                //     success: function () {
                //         // Chuyển hướng tới trang thanh toán sau khi xử lý thành công
                //         window.location.href = "/checkout.jsp";
                //     },
                //     error: function (xhr, status, error) {
                //         console.error("Đã xảy ra lỗi:", error);
                //         alert("Đã xảy ra lỗi khi chuyển sản phẩm sang trang thanh toán.");
                //     }
                // });
            } else {
                alert("Vui lòng chọn ít nhất một sản phẩm để thanh toán.");
            }
        });
    });
</script>
</body>
</html>
