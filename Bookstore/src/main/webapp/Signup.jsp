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
                            <p class="error">${baoloi}</p>
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

</script>

</body>
</html>

