
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác Nhận Email</title>
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

        .verification-container {
            background: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        .form-control:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 5px rgba(13, 110, 253, 0.5);
        }
    </style>
</head>
<body>
<div class="verification-container text-center">
    <h3 class="mb-3 text-primary"><i class="fas fa-envelope"></i> Xác nhận Email</h3>
    <p class="text-muted">Nhập mã xác nhận đã gửi đến email của bạn.</p>

    <form method="post" action="verify">
        <input type="hidden" name="action" value="validateCode">

        <div class="mb-3">
            <label for="code" class="form-label">Mã xác nhận</label>
            <input type="text" name="code" id="code" class="form-control text-center"
                   placeholder="Nhập mã 6 chữ số" required autofocus>
        </div>

        <button type="submit" class="btn btn-primary w-100">Xác Nhận</button>

        <% if (request.getAttribute("baoloi") != null) { %>
        <div class="alert alert-danger mt-3" role="alert">
            <i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("baoloi") %>
        </div>
        <% } %>
    </form>

    <div class="mt-3">
        <p class="text-muted">Không nhận được mã? <a href="#" class="text-primary">Gửi lại</a></p>
    </div>
</div>
</body>
</html>
