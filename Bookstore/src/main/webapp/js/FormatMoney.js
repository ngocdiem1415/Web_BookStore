// Hàm định dạng tiền Việt Nam với dấu chấm giữa các cụm nghìn
function formatCurrencyVN(amount) {
    const formattedAmount = amount.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    return formattedAmount + " đ";

}

