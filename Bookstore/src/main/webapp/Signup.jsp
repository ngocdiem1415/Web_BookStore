<%--
  Created by IntelliJ IDEA.
  User: ngocd
  Date: 12/16/2024
  Time: 3:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login/Register</title>
    <link rel="stylesheet" href="css/signUp.css">
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">

</head>
<body>
<div id="content-login" class="container-login">
    <div class="row">
        <div class="form-panel">
            <div class="form-header">
                <div class="form-header-back">
                    <a href="home" class="form-header-back-button"><i class="fas fa-arrow-left"></i></a>
                </div>
                <div class="form-header-inner">
                    <a href="signup" class="form-link active" id="sign-up-form-link">Đăng ký</a>
                    <a href="login" class="form-link js-only" id="login-form-link">Đăng nhập</a>
                </div>
                <div class="form-header-inner-empty"></div>
            </div>
            <div class="form-body">
                <form id="register-form" style="display: block" action="signup" method="post">
                    <div class="form-group">
                        <label for="username">Tên người dùng<span class="required">*</span></label>
                        <input type="text" name="username" id="username" class="form-control" required>
                        <c:if test="${not empty baoloi}">
                            <p class="error text-danger">${baoloi}</p>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <label for="password">Mật khẩu<span class="required">*</span></label>
                        <input type="password" name="password" id="password" class="form-control" onkeyup="checkPass()"
                               required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email<span class="required">*</span></label>
                        <input type="email" name="email" id="email" class="form-control" required>
                    </div>

                    <div class="form-group form-group-container-inform ">
                        <div class="form-group-left">
                            <label for="gender">Giới Tính<span class="required">*</span></label>
                            <select class="form-select infor" id="gender" name="gender" required>
                                <option value="">--Hãy chọn--</option>
                                <option value="male">Nam</option>
                                <option value="female">Nữ</option>
                                <option value="other">Khác</option>
                            </select>
                        </div>
                        <div class="form-group-right">
                            <label for="birthdate">Ngày sinh<span class="required">*</span></label>
                            <input type="date" id="birthdate" name="birthdate" class="form-control inform" required>
                        </div>

                    </div>
                    <div class="form-group">
                        <label for="tel">Số Điện Thoại<span class="required">*</span></label>
                        <input type="tel" name="phone" id="tel" class="form-control"
                               required>
                    </div>
                    <div class="form-group-button-login" style="text-align: center">
                        <button type="submit" class="form-submit-sign-in">Đăng ký</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="footer-login">
        <div class="footer-login-panel">
            <div class="footer-copyright">
                <p>&copy; 2024 BookStore | Designed by <span>Team TDD</span></p>
            </div>
        </div>
    </div>
</div>

<script>
    document.getElementById("register-form").addEventListener("submit", function(event) {
        let birthdateInput = document.getElementById("birthdate").value;
        let birthdate = new Date(birthdateInput);
        let today = new Date();

        // Tính tuổi
        let age = today.getFullYear() - birthdate.getFullYear();
        let monthDiff = today.getMonth() - birthdate.getMonth();
        if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthdate.getDate())) {
            age--;
        }

        if (birthdate >= today) {
            alert("Ngày sinh không được là ngày trong tương lai!");
            event.preventDefault(); // Ngăn form gửi đi
            return;
        }

        if (age < 18) {
            alert("Bạn phải ít nhất 18 tuổi để đăng ký!");
            event.preventDefault();
        }
    });
</script>

<script>
    document.getElementById("register-form").addEventListener("submit", function(event) {
        let password = document.getElementById("password").value;
        let phone = document.getElementById("tel").value;

        let phoneRegex = /^[0-9]{10}$/;
        let passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,}$/; // Ít nhất 6 ký tự, gồm chữ và số

        if (!phoneRegex.test(phone)) {
            alert("Số điện thoại phải có đúng 10 chữ số!");
            event.preventDefault();
            return;
        }
        if (!passwordRegex.test(password)) {
            alert("Mật khẩu phải có ít nhất 6 ký tự, bao gồm cả chữ cái và số!");
            event.preventDefault();
        }
    });
</script>



</body>
</html>

