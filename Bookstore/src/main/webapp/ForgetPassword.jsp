<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:16 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>forgetPassword</title>
  <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">
  <link rel="stylesheet" href="css/profile.css">
  <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">
  <link rel="stylesheet" href="css/Header.css">
  <link rel="stylesheet" href="css/footer.css">
  <link rel="stylesheet" href="css/Style.css">
  <link rel="stylesheet" href="css/ForgetPassword.css">
  <script src="js/bootstrap.bundle.min.js"></script>

</head>
<body>
<!--Header-->
<jsp:include page="Header.jsp"></jsp:include>

<!--Content-->
<div class="forget-password-contain">
  <div id="content" class="forget-password-content">
    <div class="forget-password-content-inner">
      <form action="forget-password" method="post" class="forget-password-content-inner-form">
        <p>Bạn bị mất mật khẩu? Vui lòng nhập tên người dùng hoặc địa chỉ email của bạn. Bạn sẽ nhận được liên
          kết để tạo mật khẩu mới qua email.</p>
        <div class="forget-password-content-inner-form-group">
          <label for="User-login">Email <span class="required">*</span></label>
          <input type="email" class="forget-password-content-inner-form-group-input" id="User-login"
                 name="email" autocomplete="username" required>
          <p class="text-danger">${baoloi}</p>

        </div>
        <div class="forget-password-content-inner-form-group-btn">
          <button type="submit" class="forget-password-content-inner-form-group-btn-submit">Gửi lại mật khẩu
          </button>
        </div>
      </form>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
