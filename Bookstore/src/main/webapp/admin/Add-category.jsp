<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 17/01/2025
  Time: 12:33 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm Danh Mục </title>
    <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">
    <link rel="stylesheet" href="../css/dataTable/datatables.min.css">
    <link rel="stylesheet" href="../css/Style.css">
    <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/Dashboard.css">
    <link rel="stylesheet" href="css/add-category.css">

</head>
<body>

<jsp:include page="Curtain-Menu.jsp"/>

<jsp:include page="Header-Dashboard.jsp"/>


<div id="addCategory" class="centered-box">
    <div class="box-content">
        <form action="add-category" method="post">
            <div class="box-header">
                <h5 class="box-title">Thêm Danh Mục</h5>
            </div>
            <div class="box-body">
                <div class="mb-3">
                    <label for="idCat" class="labels">ID Danh Mục</label>
                    <fieldset disabled>
                        <input id="idCat" type="text" class="form-control disabled" placeholder="ID" value="">
                    </fieldset>
                </div>
                <div class="mb-3">
                    <label class="form-label">Danh Sách Thể Loại</label>
                    <div class="form-group d-flex align-items-center">
                        <fieldset disabled>
                            <input id="idGenre" class="form-control me-2" placeholder="ID" style="width: 60px">
                        </fieldset>
                        <label class="nameGenre text-normal me-2" for="nameGenre">Tên thể loại</label>
                        <input id="nameGenre" name="category" type="text" class="form-control me-2"
                               style="width: 200px">
                        <button class="btn btn-outline-primary">
                            <i class="fa-solid fa-plus"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="box-footer text-center">
                <button type="submit" class="btn btn-success me-3">Lưu</button>
                <button type="button" class="btn btn-danger">Hủy</button>
            </div>
        </form>
    </div>
</div>


</body>
<!--all script files-->
<script src="../fonts/fontawesome-free-6.6.0-web/js/all.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/datatables.min.js"></script>

</html>
