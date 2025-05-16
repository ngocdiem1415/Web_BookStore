<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>Kết quả thanh toán</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="text-center mb-4">
        <h2 class="text-primary">🎉 KẾT QUẢ THANH TOÁN</h2>
    </div>

    <%
        Boolean success = (Boolean) request.getAttribute("success");
        Boolean invalidSignature = (Boolean) request.getAttribute("invalidSignature");
    %>

    <div class="card shadow-sm">
        <div class="card-body">
            <% if (invalidSignature != null && invalidSignature) { %>
            <div class="alert alert-danger text-center">
                 Chữ ký không hợp lệ. Vui lòng không can thiệp vào dữ liệu.
            </div>
            <% } else if (success != null) { %>

            <ul class="list-group list-group-flush mb-3">
                <li class="list-group-item"><strong>Mã giao dịch thanh toán:</strong> <%= request.getAttribute("orderId") %></li>
                <li class="list-group-item"><strong>Số tiền:</strong> <%= request.getAttribute("amount") %></li>
                <li class="list-group-item"><strong>Mã giao dịch tại VNPAY:</strong> <%= request.getAttribute("transactionNo") %></li>
                <li class="list-group-item"><strong>Mã ngân hàng thanh toán:</strong> <%= request.getAttribute("bankCode") %></li>
                <li class="list-group-item"><strong>Thời gian thanh toán:</strong> <%= request.getAttribute("payDate") %></li>
                <li class="list-group-item">
                    <strong>Tình trạng giao dịch:</strong>
                    <span class="fw-bold text-<%= success ? "success" : "danger" %>">
                        <%= success ? "Thành công" : "Không thành công" %>
                    </span>
                </li>
            </ul>

            <div class="text-center">
                <a href="<%= request.getContextPath() %>/" class="btn btn-primary">Về trang chủ</a>
            </div>

            <% } else { %>
            <div class="alert alert-warning text-center">Không có dữ liệu để hiển thị.</div>
            <% } %>
        </div>
    </div>

    <footer class="text-center mt-5">
        <p class="text-muted">&copy; VNPAY 2020</p>
    </footer>
</div>
</body>
</html>
