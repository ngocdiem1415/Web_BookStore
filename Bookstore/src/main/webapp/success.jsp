<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 04/01/2025
  Time: 1:11 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác Nhận Thành Công</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Xác Nhận Thành Công</h2>
    <div class="alert alert-success mt-3">
        <%= request.getAttribute("baoloi") %>
    </div>
    <a href="login" class="btn btn-primary">Đăng nhập</a>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>


