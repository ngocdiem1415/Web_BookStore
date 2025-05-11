<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15/01/2025
  Time: 5:23 CH
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Admin</title>
    <!--  all css files-->
    <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="../css/Style.css">
    <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/Dashboard.css">
    <link rel="stylesheet" href="css/Edit-Admin.css">
</head>
<body>
<!--curtain menu-->
<!--curtain menu-->
<jsp:include page="Curtain-Menu.jsp"/>

<jsp:include page="Header-Dashboard.jsp"/>
<!-- Container -->
<!-- Container -->

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
                            <a href="#" class="text-dec" style="color: #f07c29">Edit Admin</a>
                        </li>
                    </ol>
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <div class="edit-admin-container">
            <div class="edit-admin-container-content">
                <div style="display: contents">
                    <div class="edit-admin-container-content-inner">
                        <div class="edit-admin-container-content-inner-header">
                            <h2 class="edit-user-container-content-inner-header-title">Sua Thong Tin Admin</h2>
                        </div>
                        <div class="edit-admin-container-content-inner-body">
                            <form action="edit-admin?id=${admin.uid}" method="post">
                                <div class="edit-admin--container-content-inner-button">
                                    <button type="submit" class="edit-admin-container-content-inner-button-save">
                                        Luu
                                    </button>
                                    <button class="edit-admin-container-content-inner-button-cancel">
                                        Huy
                                    </button>
                                </div>
                                <div class="form-edit-admin-group">
                                    <label for="id">ID</label>
                                    <input type="text" class="form-control form-control-fit" id="id" name="id"
                                           value="${admin.uid}"
                                           readonly required>
                                </div>
                                <div class="form-edit-admin-group">
                                    <label for="username">Ten Dang Nhap</label>
                                    <input type="text" class="form-control" id="username" name="username"
                                           value="${admin.username}" required>
                                </div>
                                <div class="form-edit-admin-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" name="email"
                                           value="${admin.email}"
                                           required>
                                </div>

                                <div class="form-edit-admin-group">
                                    <label for="phone">So Dien Thoai</label>
                                    <input type="text" class="form-control" id="phone" name="phone"
                                           value="${admin.phone}" required>
                                </div>

                                <div class="form-edit-admin-group">
                                    <label for="birthdate">Ngay Sinh</label>
                                    <input type="date" class="form-control" id="birthdate" name="birthdate"
                                           value="${admin.dob}" required>
                                </div>


                                <div class="form-edit-admin-group">
                                    <label for="gender">Gioi Tinh</label>
                                    <select class="form-select" id="gender" name="gender" required>
                                        <option value="male" ${admin.gender == male ? 'selected' : ''}>Nam</option>
                                        <option value="female" ${admin.gender == female ? 'selected' : ''}>Nu</option>
                                        <option value="other" ${admin.gender == other ? 'selected' : ''}>Khac</option>
                                    </select>
                                </div>

                                <div class="form-edit-admin-group">
                                    <label for="role">Vai Tro</label>
                                    <select class="form-select" id="role" name="role" required>
                                        <option value="admin" ${admin.role == 'admin' ? 'selected' : ''}>Admin</option>
                                        <option value="user" ${admin.role == 'user' ? 'selected' : ''}>User</option>
                                    </select>
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
