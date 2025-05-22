<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 17/01/2025
  Time: 12:33 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Nhập kho</title>
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


<div id="stockIn" class="centered-box">
    <div class="box-content">
        <form action="stock-in" method="post">
            <div class="box-header">
                <h5 class="box-title">Nhập kho</h5>
            </div>
            <div class="box-body">
                <div class="mb-3">
                    <label class="nameBook text-normal me-2" for="bookSelect">Tên sách</label>
                    <select id="bookSelect" class="form-select me-2" style="width: 200px">
                        <option value="">-- Chọn sách --</option>
                        <c:forEach var="book" items="${stocks}">
                            <option value="${book.bId}">${book.getBook().getTitle()}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="box-body">
                <div class="mb-3">
                    <label class="quantityAdd text-normal me-2" for="quantity">Số lượng nhập</label>
                    <input id="quantity" type="text" class="form-control me-2"
                           style="width: 200px">
                </div>
            </div>
            <div class="box-footer text-center">
                <button type="submit" class="btn btn-success me-3">Lưu</button>
                <button type="button" class="btn btn-danger"
                        onclick="window.location.href='category';">Hủy
                </button>
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
