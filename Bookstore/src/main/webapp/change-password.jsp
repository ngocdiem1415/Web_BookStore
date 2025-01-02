<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reset Password</title>

    <!-- Google font -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

    <!--    bootstrap-->
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">

    <!--     OwlCarousel-->
    <link rel="stylesheet" href="css/OwlCarousel/owl.carousel.min.css">
    <link rel="stylesheet" href="css/OwlCarousel/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/OwlCarousel/owl.theme.green.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/Header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/Style.css">
</head>

<body>
<!-- Header -->
<jsp:include page="Header.jsp"></jsp:include>
<!-- Main Content -->
<div class="container py-5">
    <div class="card mx-auto shadow-lg" style="max-width: 400px;">
        <div class="card-body">
            <h4 class="text-center">Reset Password</h4>
            <c:if test='${mess!=null && mess!=""}'>
                <div class="alert alert-danger mt-3" role="alert">${mess}</div>
            </c:if>
            <form action="change_password" method="post" onsubmit="return validatePasswords();">
                <!-- Hidden ID Field -->
                <input type="hidden" name="id" value="${param["id"]}">

                <!-- New Password -->
                <div class="mb-3">
                    <label for="inputNewPassword" class="form-label">New Password</label>
                    <input type="password" name="password" id="inputNewPassword" class="form-control" required>
                </div>

                <!-- Confirm Password -->
                <div class="mb-3">
                    <label for="inputNewPassword2" class="form-label">Confirm New Password</label>
                    <input type="password" name="repassword" id="inputNewPassword2" class="form-control" required>
                </div>

                <!-- Submit Button -->
                <button type="submit" class="btn btn-primary w-100">Submit</button>
            </form>
        </div>
    </div>
</div>

<!-- Footer -->
<jsp:include page="footer.jsp"></jsp:include>

<!-- JavaScript -->
<script>
    // Kiểm tra mật khẩu trùng khớp
    function validatePasswords() {
        const password = document.getElementById("inputNewPassword").value;
        const confirmPassword = document.getElementById("inputNewPassword2").value;

        if (password !== confirmPassword) {
            alert("Passwords do not match. Please try again.");
            return false;
        }
        return true;
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
