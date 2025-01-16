<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 16/01/2025
  Time: 11:47 CH
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Them CTKM</title>
  <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap5.css">
  <link rel="stylesheet" href="../css/Style.css">
  <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">
  <link rel="stylesheet" href="css/Dashboard.css">
  <link rel="stylesheet" href="css/Edit-Admin.css">
</head>
<body>
<!--curtain menu-->
<jsp:include page="Curtain-Menu.jsp"/>

<jsp:include page="Header-Dashboard.jsp"/>


<div class="container d-flex justify-content-center align-items-center" style="height: 100vh;">
  <div class="form-container p-4 border rounded shadow" style="max-width: 600px; width: 100%;">
    <div class="modal-header">
      <h5 class="modal-title mb-3 border-bottom" id="discountLabel">Sửa CTKM</h5>
    </div>
    <div class="modal-body">
      <form action="add-promotion" method="post">
        <div class="mb-3">
          <label for="idDis" class="labels">ID CTKM</label>
          <fieldset disabled>
            <input id="idDis" type="text" class="form-control disabled" value="">
          </fieldset>
        </div>
        <div class="mb-3">
          <label for="nameDis" class="labels">Tên khuyến mãi</label>
          <input id="nameDis" name="promotionName" type="text" class="form-control" value="">
        </div>
        <div class="mb-3">
          <label for="discount">Giá trị khuyến mãi</label>
          <input type="text" class="form-control" id="discount" name="discount" value="" required>
        </div>
        <div class="mb-3">
          <label for="fromDate">Ngày bắt đầu</label>
          <input type="date" class="form-control" id="fromDate" name="startDate" value="" required>
        </div>
        <div class="mb-3">
          <label for="toDate">Ngày kết thúc</label>
          <input type="date" class="form-control" id="toDate" name="endDate" value="" required>
        </div>
        <div class="d-flex justify-content-center mb-3">
          <button type="submit" class="btn btn-success mx-2">Lưu</button>
          <button type="button" class="btn btn-danger mx-2">Hủy</button>
        </div>
      </form>
    </div>
  </div>
</div>

</body>

<script src="../fonts/fontawesome-free-6.6.0-web/js/all.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/datatables.min.js"></script>
</html>
