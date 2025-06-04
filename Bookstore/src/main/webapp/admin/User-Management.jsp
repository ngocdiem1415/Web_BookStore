<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15/01/2025
  Time: 5:21 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lí tài khoản</title>

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
<!--header end-->

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
                            <a href="user-management" class="text-dec" style="color: #f07c29">Quản lí tài khoản</a>
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
                                            <h3>Quản lí tài khoản</h3>
                                        </div>
                                        <a href="add-user" class="btn btn-green my-4 border rounded addSlider">
                                            <i class="fa-solid fa-plus"></i>
                                            Thêm tài khoản
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
                                            <%--                                            <th>Role</th>--%>
                                            <th>Danh sách quyền</th>
                                </th>
                                <th>Trạng thái</th>
                                <th>Hành động</th>
                            </tr>
                            </thead>
                            <tbody style="font-weight: lighter">
                            <c:forEach var="user" items="${users}">
                                <tr data-id="${user.uid}">
                                    <th scope="row">${user.uid}</th>
                                    <td><img
                                            src="${user.avatar != null ? user.avatar : 'https://res.cloudinary.com/dh90ponfw/image/upload/v1736864014/defaultavatar.jpg'}"
                                            alt="avatar" height="50px" width="50px"/></td>
                                    <td>${user.username}</td>
                                    <td>${user.phone}</td>
                                    <td>${user.email}</td>
                                        <%--                                    <td>--%>
                                        <%--                                        <form action="${pageContext.request.contextPath}/admin/upload-role"--%>
                                        <%--                                              method="POST" class="d-inline">--%>
                                        <%--                                            <input type="hidden" name="uid" value="${user.uid}"/>--%>
                                        <%--                                            <select name="role" class="form-select form-select-sm"--%>
                                        <%--                                                    onchange="this.form.submit()">--%>
                                        <%--                                                <option value="3" ${user.role >= 2 ? 'selected' : ''}>Admin</option>--%>
                                        <%--                                                <option value="1" ${user.role < 2 ? 'selected' : ''}>User</option>--%>
                                        <%--                                            </select>--%>
                                        <%--                                        </form>--%>
                                        <%--                                    </td>--%>

                                    <td>
                                        <button href="assign-resources?id=${user.uid}"
                                           class="btn btn-sm btn-outline-primary btn-view-role"
                                           data-uid="${user.uid}"
                                           data-username="${user.username}"
                                           data-bs-toggle="modal"
                                           data-bs-target="#viewRoleModal">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </td>


                                    <td class="status-text">
                                        <c:choose>
                                            <c:when test="${user.status == 1}">
                                                <span class="text-success">Hoạt động</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-danger">Vô hiệu hóa</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="edit-actions">
                                        <c:if test="${user.status == 1}">
                                            <a href="edit-user?id=${user.uid}" class="text-dec">
                                                <i class="fa-regular fa-pen-to-square fa-lg" style="color: #236844"></i>
                                            </a>
                                            <c:if test="${user.role != 2}">
                                                <button type="button" class="btn btn-delete" data-id="${user.uid}"
                                                        data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">
                                                    <i class="fa-regular fa-trash-can fa-lg" style="color: #ef5f5f"></i>
                                                </button>
                                            </c:if>
                                        </c:if>
                                    </td>
                                </tr>
                                <!-- Modal for assigning roles -->
                                <div class="modal fade" id="viewRoleModal" data-user-id="${user.uid}" tabindex="-1"
                                     aria-labelledby="viewRoleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog modal-lg">
                                        <div class="modal-content">
                                            <form action="assign-resources" method="post" id="assignRoleForm">
                                                <input type="hidden" name="uid" value="${user.uid}" id="modalUserId"/>

                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="viewRoleModalLabel">Phân quyền cho người
                                                        dùng: <span
                                                                id="modalUsername"></span></h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    <ul class="list-group" id="roleList">
                                                        <c:forEach var="res" items="${allRoles}" varStatus="loop">
                                                            <li class="list-group-item">
                                                                <div class="d-flex justify-content-between align-items-center">
                                                                    <div>
                                                                        <input class="form-check-input me-1"
                                                                               type="checkbox" name="resources"
                                                                               value="${res}" id="res-${loop.index}">
                                                                        <label class="form-check-label"
                                                                               for="res-${loop.index}">${res}</label>
                                                                    </div>
                                                                    <select name="permission"
                                                                            class="form-select form-select-sm"
                                                                            style="width: auto;">
                                                                        <option value="1">Xem</option>
                                                                        <option value="2">Sửa</option>
                                                                        <option value="3">Xóa</option>
                                                                    </select>
                                                                </div>
                                                            </li>
                                                        </c:forEach>

                                                    </ul>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-primary">Lưu quyền</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
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
                    <h5 class="modal-title" id="confirmDeleteModalLabel">Xóa tài khoản</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Bạn có chắc chắn muốn xóa không? Thao tác này không thể hoàn tác.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-danger" id="confirmDeleteBtn">Xóa</button>
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
                paginate: {
                    next: "2",
                },
            },
            columnDefs: [
                {"className": "text-center", "targets": "_all"},  // Căn giữa văn bản ở cột thứ 5
            ],
        });
    });

</script>
<%--ajax đẻ load lại không reload trang--%>
<script>
    let deleteUserId = null;

    // Khi nhấn nút xóa (lưu id vào biến)
    $(document).on('click', '.btn-delete', function () {
        deleteUserId = $(this).data('id');
    });

    // Khi xác nhận xóa trong modal
    $('#confirmDeleteBtn').on('click', function () {
        if (deleteUserId) {
            $.ajax({
                url: '${pageContext.request.contextPath}/admin/disable',
                method: 'POST',
                data: {uid: deleteUserId},
                success: function (response) {
                    $('#confirmDeleteModal').modal('hide');

                    const row = $('[data-id="' + deleteUserId + '"]').closest('tr');

                    // Cập nhật trạng thái sang "Vô hiệu hóa"
                    row.find('td.status-text').html('<span class="text-danger">Vô hiệu hóa</span>');

                    // Ẩn nút sửa và xóa
                    row.find('.edit-actions').remove();

                    deleteUserId = null;
                },
                error: function (error) {
                    console.error('Xóa thất bại. Vui lòng thử lại.', error);
                }
            });
        }
    });
</script>


</body>
</html>
