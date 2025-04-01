<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 04/01/2025
  Time: 1:11 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác Nhận Thành Công</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/js/all.min.js"></script>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f8f9fa;
        }
        .success-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="success-container">
    <h3 class="mb-3 text-success"><i class="fas fa-check-circle"></i> Xác Nhận Thành Công</h3>
    <p class="text-muted">Tài khoản của bạn đã được xác minh thành công.</p>

    <% if (request.getAttribute("baoloi") != null) { %>
    <div class="alert alert-success mt-3" role="alert">
        <i class="fas fa-info-circle"></i> <%= request.getAttribute("baoloi") %>
    </div>
    <% } %>

    <a href="login" class="btn btn-primary w-100 mt-3">Đăng nhập</a>
</div>
</body>
</html>


