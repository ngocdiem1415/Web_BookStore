<%--
  Created by IntelliJ IDEA.
  User: ngocd
  Date: 12/16/2024
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login/Register</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">


</head>
<body>
<div id="content-login" class="container-login">
    <div class="row">
        <div class="form-panel">
            <div class="form-header">
                <div class="form-header-back">
                    <a href="Home.jsp" class="form-header-back-button"><i class="fas fa-arrow-left"></i></a>
                </div>
                <div class="form-header-inner">
                    <a href="Signup.jsp" class="form-link" id="sign-up-form-link">Đăng ký</a>
                    <a href="Login.jsp" class="form-link active" id="login-form-link">Đăng nhập</a>
                </div>
                <div class="form-header-inner-empty"></div>
            </div>
            <div class="form-body">
                <!-- Login Form -->
                <form id="login-form" style="opacity: 1; visibility: visible" action="login" method="post">
                    <div class="form-group">
                        <label for="username">Tên đăng nhập <span class="required">*</span></label>
                        <input type="text" name="username" id="username" class="form-control" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu<span class="required">*</span></label>
                        <input type="password" name="password" id="password" class="form-control" required>
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" name="remember" id="remember">
                        <label for="remember">Ghi nhớ mật khẩu</label>
                    </div>
                    <div class="form-group-button-login">
                        <button type="submit" class="form-submit form-submit-gg"><i class="fa-brands fa-google"></i>
                        </button>
                        <button type="submit" class="form-submit form-submit-email"><i class="fa-solid fa-envelope"></i>
                        </button>
                    </div>
                    <div class="form-group-button-login">
                        <button type="submit" class="form-submit-sign-in">Đăng nhập</button>
                    </div>


                    <div class="form-footer">
                        <a href="ForgetPassword.jsp" id="forgot-password-link" class="forgot-password">Quên
                            mật khẩu?</a>
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


</body>
</html>

