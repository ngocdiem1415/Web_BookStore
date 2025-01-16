<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20/12/2024
  Time: 9:28 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Admin</title>
    <!--  all css files-->
    <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">
    <link rel="stylesheet" href="../css/dataTable/datatables.min.css">
    <link rel="stylesheet" href="../css/Style.css">
    <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/Dashboard.css">
    <link rel="stylesheet" href="css/Add-Admin.css">


</head>
<body>
<!--curtain menu-->
<jsp:include page="Curtain-Menu.jsp"/>

<jsp:include page="Header-Dashboard.jsp"/>


<section class="section">
    <div class="container-fluid mb-5">
        <div class="title-wrapper pt-3">
            <div class="d-flex align-items-center">
                <!-- end col -->
                <div class="breadcrumb-wrapper">
                    <ol class="breadcrumb mx-4">
                        <li class="breadcrumb-item">
                            <a href="dashboard" class="text-dec" style="color: gray">Dashboard</a>
                            <a href="#" class="text-dec" style="color: gray"> / </a>
                            <a href="#" class="text-dec" style="color: #f07c29">Add admin</a>
                        </li>
                    </ol>
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <div class="add-admin-container">
            <div class="add-admin-container-content">
                <div style="display: contents">
                    <div class="add-admin-container-content-inner">
                        <div class="add-admin-container-content-inner-header">
                            <h2 class="add-admin-container-content-inner-header-title">Thêm admin</h2>
                        </div>
                        <div class="add-admin-container-content-inner-body">
                            <form action="add-admin" method="post">
                                <div class="form-add-admin-group">

                                    <label for="username">Tên người dùng<span class="require">*</span></label>
                                    <input type="text" class="form-control" id="username" name="username" required>
                                </div>
                                <div class="form-add-admin-group">
                                    <label for="email">Email<span class="require">*</span></label>
                                    <input type="email" class="form-control" id="email" name="email" required>

                                </div>

                                <div class="form-add-admin-group">
                                    <label for="phone">Số điện thoại<span class="require">*</span></label>
                                    <input type="text" class="form-control" id="phone" name="phone" required>
                                </div>

                                <div class="form-add-admin-group">
                                    <label for="password">Mật khẩu<span class="require">*</span></label>
                                    <input type="password" class="form-control" id="password" name="password" required>
                                </div>

                                <div class="form-add-admin-group">
                                    <label for="birthdate">Ngày sinh<span class="required">*</span></label>
                                    <input type="date" id="birthdate" name="birthdate" class="form-control inform" required>
                                </div>

                                <div class="form-add-admin-group">
                                    <label for="gender">Giới tính<span class="require">*</span></label>
                                    <select class="form-select" id="gender" name="gender" required>
                                        <option value="">--Hãy chọn giới tính--</option>
                                        <option value="male">Nam</option>
                                        <option value="female">Nữ</option>
                                        <option value="other">Khác</option>
                                    </select>
                                </div>
                                <div class="add-admin-container-content-inner-button">
                                    <button type="submit" class="add-admin-container-content-inner-button-save">
                                        Lưu
                                    </button>
                                    <button class="add-admin-container-content-inner-button-cancel">
                                        Hủy
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<!--header end-->
<!--all script files-->
<script src="../fonts/fontawesome-free-6.6.0-web/js/all.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/datatables.min.js"></script>


</body>
</html>
