<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 04/01/2025
  Time: 12:26 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Xác Nhận Mã</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center">Xác nhận email</h2>

    <form method="post" action="verify">
        <input type="hidden" name="action" value="validateCode">

        <div class="mb-3">
            <label for="code" class="form-label">Nhập mã xác nhận</label>
            <input type="text" name="code" id="code" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-primary">Xác Nhận</button>

        <% if (request.getAttribute("baoloi") != null) { %>
        <div class="alert alert-danger mt-3">
            <%= request.getAttribute("baoloi") %>
        </div>
        <% } %>
    </form>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

