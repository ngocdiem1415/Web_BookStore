<%@ page import="vn.edu.hcmuaf.fit.bookstore.beans.User" %><%--
  Created by IntelliJ IDEA.
  User: ngocd
  Date: 12/16/2024
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                    <a href="home" class="form-header-back-button"><i class="fas fa-arrow-left"></i></a>
                </div>
                <div class="form-header-inner">
                    <a href="signup" class="form-link" id="sign-up-form-link">Đăng ký</a>
                    <a href="login" class="form-link active" id="login-form-link">Đăng nhập</a>
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
                    <%
                        String baoloi = request.getAttribute("baoloi") == null ? "" : (String) request.getAttribute("baoloi");
                    %>
                    <div class="text-center">
                        <span class="text-danger bg-danger" style="color: red"><%=baoloi%></span>
                    </div>

                    <div class="form-group form-check">
                        <input type="checkbox" name="remember" id="remember">
                        <label for="remember">Ghi nhớ mật khẩu</label>
                    </div>
                    <div class="form-group-button-login">
                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:8080/Bookstore/login-google&response_type=code&client_id=260850348977-8hune82mhlpi3odt53r7satqq9fo4plk.apps.googleusercontent.com&approval_prompt=force"
                           class="form-submit form-submit-gg"><i class="fa-brands fa-google"></i>
                        </a>
                        <a href="https://www.facebook.com/v22.0/dialog/oauth?client_id=1746451382884277&redirect_uri=http://localhost:8080/Bookstore/login-facebook" type="submit" class="form-submit form-submit-email"><i
                                class="fa-brands fa-facebook"></i></i>
                        </a>
                    </div>

                    <div class="form-group-button-login">
                        <button type="submit" class="form-submit-sign-in">Đăng nhập</button>
                    </div>

                    <div class="form-footer">
                        <a href="forget-password" id="forgot-password-link" class="forgot-password">Quên
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

