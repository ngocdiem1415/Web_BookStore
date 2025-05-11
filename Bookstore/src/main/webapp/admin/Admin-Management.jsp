<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 20/12/2024
  Time: 9:29 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin</title>

    <!--  all css files-->
    <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">
    <link rel="stylesheet" href="../css/dataTable/datatables.min.css">
    <link rel="stylesheet" href="../css/Style.css">
    <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/Dashboard.css">

</head>
<body>

<!--curtain menu-->
<jsp:include page="Curtain-Menu.jsp"/>

<jsp:include page="Header-Dashboard.jsp"/>

<!--main content-->
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
                            <a href="#" class="text-dec" style="color: #f07c29">Quản lí admin</a>
                        </li>
                    </ol>
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->
        </div>
        <div id="performance-stats">
            <div class="container-fluid">
                <div class="row ">
                    <div class="content-main d-flex justify-content-center">
                        <table class="main-listUser-table table table-bordered">
                            <thead>
                            <tr>
                                <th>
                                    <div class="d-flex justify-content-between">
                                        <div class=" main-card-title my-3">
                                            <h3>Quản lí admin</h3>
                                        </div>
                                        <a href="add-admin" class="btn btn-green my-4 border rounded addSlider">
                                            <i class="fa-solid fa-plus"></i>
                                            Thêm admin
                                        </a>
                                    </div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">
                                    <table class="table" id="orderTable">
                                        <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th>Avatar</th>
                                            <th>Tên người dùng</th>
                                            <th>SDT</th>
                                            <th>Email</th>
                                            <th>Role</th>
                                            <th>Trạng thái</th>
                                            <th>Hành động</th>
                                        </tr>
                                        </thead>
                                        <tbody style="font-weight: lighter">
                                        <c:forEach var="admin" items="${admins}">
                                            <tr>
                                                <th scope="row">${admin.uid}</th>
                                                <td><img src="../img/Sample_User_Icon.png" height="50px" width="50px"/>
                                                </td>
                                                <td>${admin.username}</td>
                                                <td>${admin.phone}</td>
                                                <td>${admin.email}</td>
                                                <td>
                                                    <form action="${pageContext.request.contextPath}/admin/upload-role" method="post" class="d-inline">
                                                        <input type="hidden" name="uid" value="${admin.uid}"/>
                                                        <select name="role" class="form-select form-select-sm"
                                                                onchange="this.form.submit()">
                                                            <option value="admin" ${admin.role == 'admin' ? 'selected' : ''}>
                                                                Admin
                                                            </option>
                                                            <option value="user" ${admin.role == 'user' ? 'selected' : ''}>
                                                                User
                                                            </option>
                                                        </select>
                                                    </form>
                                                </td>

                                                <td>hoạt động</td>
                                                <td>
                                                    <a href="edit-admin?id=${admin.uid}" class="text-dec">
                                                        <i class="fa-regular fa-pen-to-square fa-lg"
                                                           style="color: #236844"></i>
                                                    </a>
                                                    <button type="button" class="btn" data-bs-toggle="modal"
                                                            data-bs-target="#confirmDeleteModal">
                                                        <i class="fa-regular fa-trash-can fa-lg "
                                                           style="color: #ef5f5f"></i>
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </th>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="confirmDeleteModal" tabindex="-1" aria-labelledby="confirmDeleteModalLabel"
         aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmDeleteModalLabel">Xóa admin</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn xóa không? Thao tác này không thể hoàn tác.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-danger" data-bs-dismiss="modal">Xóa</button>
                </div>
            </div>
        </div>
    </div>

</section>

<!--all script files-->
<script src="../fonts/fontawesome-free-6.6.0-web/js/all.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/datatables.min.js"></script>

<!--script-->
<script>
    $(document).ready(function () {
        // Khởi tạo DataTable cho bảng với id 'orderTable'
        var table = $('#orderTable').DataTable({
            language: {
                processing: "đang tải",
                search: "Tìm kiếm",
                lengthMenu: "Số dòng hiển thị _MENU_ ",
                info: "Bài viết từ _START_ đến _END_ trong _TOTAL_ tài khoản",
                infoEmpty: "",
                loadingRecords: "",
                infoFiltered: "",
                zeroRecords: "Không tìm thấy",
                emptyTable: "Không có dữ liệu",

            },
            columnDefs: [
                {"className": "text-center", "targets": "_all"},  // Căn giữa văn bản ở cột thứ 5
            ],
        });
    });
</script>
</body>
</html>
