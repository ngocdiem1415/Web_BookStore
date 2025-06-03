<%--
  Created by IntelliJ IDEA.
  User: 84384
  Date: 1/17/2025
  Time: 8:37 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Thêm nhà sản xuất</title>
    <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="../css/Style.css">
    <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/Dashboard.css">
    <style>
        .modal-content {
            padding: 20px;
            border-radius: 8px;
        }

        .modal-header {
            background-color: #f8f9fa;
            border-bottom: 1px solid #dee2e6;
        }

        .btn-green {
            background-color: #28a745;
            color: #fff;
        }

        .btn-green:hover {
            background-color: #218838;
        }

        .modal {
            z-index: 2000 !important;
        }

        /* Làm mờ nền khi modal hiển thị */
        .modal-backdrop {
            z-index: 1999 !important;
        }

        /* Nếu header/menu có z-index cao, giảm nó */
        header, .menu {
            z-index: 1000;
            position: relative; /* Giữ header/menu ổn định */
        }
    </style>
</head>
<body>
<jsp:include page="Curtain-Menu.jsp"/>

<jsp:include page="Header-Dashboard.jsp"/>

<div class="modal show d-block" id="addSupplier" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true"
     style="background-color: rgba(0, 0, 0, 0.5); z-index: 2000;">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="labelSupp">Thêm nhà xuất bản</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="supplierForm" method="post" action="add-publisher" class="text-center">
                    <div class="mb-3">
                        <label for="idSupp" class="form-label">ID Nhà xuất bản</label>
                        <fieldset disabled>
                            <input id="idSupp" type="text"
                                   class="form-control text-center" placeholder="ID"
                                   value="">
                        </fieldset>
                    </div>
                    <div class="mb-3">
                        <label for="tenSupp" class="form-label">Tên nhà xuất bản <span
                                class="text-danger">*</span></label>
                        <input type="text" class="form-control" id="tenSupp"
                               name="ten" required>
                    </div>

                    <div class="mb-3">
                        <label for="phoneSupp" class="form-label">Số điện thoại <span
                                class="text-danger">*</span></label>
                        <input type="text" class="form-control"
                               id="phoneSupp" name="phone" required>
                    </div>
                    <div class="mb-3">
                        <label for="addressSupp" class="form-label">Địa chỉ <span
                                class="text-danger">*</span></label>
                        <input type="text" class="form-control"
                               id="addressSupp" name="address" required>
                    </div>

                    <div class="d-flex justify-content-center">
                        <button type="submit"
                                class="btn btn-success mx-3 save-supplier">
                            Lưu
                        </button>
                        <button type="button"
                                class="btn btn-danger cancel-supplier"
                                data-bs-dismiss="modal"
                                onclick="window.location.href='publisher';">>
                            Hủy
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
<script src="../fonts/fontawesome-free-6.6.0-web/js/all.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/datatables.min.js"></script>
</html>
