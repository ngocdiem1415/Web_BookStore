// Hàm định dạng tiền Việt Nam với dấu chấm giữa các cụm nghìn
function formatCurrencyVN(amount) {
    return amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
}

// Áp dụng định dạng cho các phần tử có class unit-price và total-price
function applyCurrencyFormat() {
    document.querySelectorAll('.unit-price, .total-price').forEach(element => {
        const amount = parseInt(element.textContent.replace(/\./g, '')); // Bỏ dấu chấm cũ
        if (!isNaN(amount)) {
            element.textContent = formatCurrencyVN(amount);
        }
    });
}

// Cập nhật định dạng sau khi thay đổi tổng giá
document.addEventListener('DOMContentLoaded', function () {
    // Gọi hàm applyCurrencyFormat để định dạng ban đầu
    applyCurrencyFormat();

    // Hàm cập nhật tổng giá và định dạng lại
    function updateTotalPrice(productElement) {
        const unitPrice = parseInt(productElement.querySelector('.unit-price').textContent.replace(/\./g, ''));
        const quantity = parseInt(productElement.querySelector('.quantity').value);
        const totalPriceElement = productElement.querySelector('.total-price');
        if (!isNaN(unitPrice) && !isNaN(quantity)) {
            const totalPrice = unitPrice * quantity;
            totalPriceElement.textContent = formatCurrencyVN(totalPrice);
        }
    }

    // Tăng số lượng và cập nhật tổng giá
    document.querySelectorAll('.increase').forEach(button => {
        button.addEventListener('click', function () {
            const product = button.closest('.product');
            const quantityInput = product.querySelector('.quantity');
            let quantity = parseInt(quantityInput.value);
            if (!isNaN(quantity) && quantity < 12) {
                quantity++;
                quantityInput.value = quantity;
                updateTotalPrice(product);
            }
        });
    });

    // Giảm số lượng và cập nhật tổng giá
    document.querySelectorAll('.decrease').forEach(button => {
        button.addEventListener('click', function () {
            const product = button.closest('.product');
            const quantityInput = product.querySelector('.quantity');
            let quantity = parseInt(quantityInput.value);
            if (!isNaN(quantity) && quantity > 1) {
                quantity--;
                quantityInput.value = quantity;
                updateTotalPrice(product);
            }
        });
    });

    // Nhập số lượng và cập nhật tổng giá
    document.querySelectorAll('.quantity').forEach(input => {
        input.addEventListener('input', function () {
            const product = input.closest('.product');
            let quantity = parseInt(input.value);
            if (isNaN(quantity) || quantity < 1) {
                input.value = 1;
            } else if (quantity > 12) {
                input.value = 12;
            } else {
                input.value = quantity;
            }
            updateTotalPrice(product);
        });
    });
});