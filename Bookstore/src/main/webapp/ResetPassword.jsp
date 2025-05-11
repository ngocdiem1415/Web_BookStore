<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt lại mật khẩu</title>
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">
    <link rel="stylesheet" href="css/Header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/ForgetPassword.css">
    <script src="js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-color: #f4f4f4;
            font-family: 'Open Sans', sans-serif;
        }

        .reset-container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .reset-container h2 {
            text-align: center;
            color: #fff;
        }

        .btn-reset {
            width: 100%;
            background-color: #4B908E;
            border: none;
        }

        .btn-reset:hover {
            background-color: #316064;
        }

        .form-label {
            font-weight: bold;
        }

        .text-center {
            margin-top: 10px;
        }

        .text-danger {
            font-size: 14px;
        }
    </style>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>

<div class="container">
    <div class="reset-container">
        <h2>Đặt lại mật khẩu</h2>
        <form action="reset-password" method="post">
            <input type="hidden" name="code" value="<%= request.getAttribute("code") %>">
            <div class="mb-3">
                <label for="new-password" class="form-label">Mật khẩu mới <span class="required">*</span></label>
                <input type="password" id="new-password" name="new-password" class="form-control" required>
            </div>
            <div class="mb-3">
                <label for="confirm-password" class="form-label">Xác nhận mật khẩu <span
                        class="required">*</span></label>
                <input type="password" id="confirm-password" name="confirm-password" class="form-control" required>
            </div>
            <div class="text-center">
                <span class="text-success">${baoloi}</span>
            </div>
            <button type="submit" class="btn btn-reset btn-primary">Xác nhận</button>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
