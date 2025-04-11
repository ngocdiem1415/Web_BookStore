<%--
  Created by IntelliJ IDEA.
  User: ngocd
  Date: 1/15/2025
  Time: 3:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thêm sản phẩm</title>

    <!--  all css files-->
    <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap5.css">
    <link rel="stylesheet" href="../css/Style.css">
    <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/Dashboard.css">
</head>
<body>

<jsp:include page="Curtain-Menu.jsp"/>

<jsp:include page="Header-Dashboard.jsp"/>

<div class="container-add-product mt-5 p-4 bg-light">
    <div class="breadcrumb-wrapper py-1">
        <ol class="breadcrumb mx-3">
            <li class="breadcrumb-item">
                <a href="dashboard" class="text-dec" style="color: gray">Dashboard</a>
                <a href="#" class="text-dec" style="color: gray"> / </a>
                <a href="product-management" class="text-dec" style="color: gray">Quản lý sản phẩm</a>
                <a href="#" class="text-dec" style="color: gray"> / </a>
                <a href="#" class="text-dec" style="color: #f07c29">Thông tin sản phẩm</a>
            </li>
        </ol>
    </div>
    <div class="row d-flex align-items-center justify-content-center">
        <h2 class="col-9 text-center my-4">Thông tin sản phẩm</h2>
        <div class="col-3 d-flex justify-content-center">
            <div class="col-3 d-flex justify-content-center">
                <button type="button" class="btn btn-success me-2 my-4" style="background: #4B908E" id="addOrUpdate">
                    <c:if test="${book.bId != null}">
                        <i class="fa-solid fa-check"></i> Cập nhật
                    </c:if>
                    <c:if test="${book.bId == null}">
                        <i class="fa-solid fa-check"></i> Thêm sản phẩm
                    </c:if>
                </button>
                <button type="button" class="btn btn-danger my-4"
                        onclick="window.location.href='product-management';">
                    <i class="fa-solid fa-times"></i> Hủy
                </button>
            </div>
        </div>
    </div>
    <form id="formSubmit" method="post" enctype="multipart/form-data">
        <div class="row d-flex flex-nowrap m-0 p-0">
            <!-- Left Column -->
            <div class="col-7 bg-white rounded-2 shadow mx-4">
                <!-- Product Details -->
                <div class="row mb-3">
                    <div class="col-md-12 pt-3">
                        <label for="tenSanPham" class="form-label">Tên sản phẩm</label>
                        <input type="text" class="form-control" id="tenSanPham" name="tenSanPham"
                               value="${empty book ? '' :book.title}"
                               placeholder="Nhập tên sản phẩm">
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-5">
                        <label for="Tacgia" class="form-label">Tác giả</label>
                        <input type="text" class="form-control" id="Tacgia" name="Tacgia"
                               value="${empty book ? '' :book.author}"
                               placeholder="">
                    </div>
                    <div class="col-md-2">
                        <label for="NamXB" class="form-label">Năm XB</label>
                        <input type="text" class="form-control" id="NamXB" name="NamXB"
                               value="${empty book ? '' :book.publishYear}"
                               placeholder="">
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4">
                        <label class="form-label">Kích thước (a x b x c cm)</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="dimensions" name="dimensions"
                                   value="${empty book ? '' :book.dimensions.split('cm')[0]}"
                                   placeholder="">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="khoiLuong" class="form-label">Khối lượng</label>
                        <input type="text" class="form-control" id="khoiLuong" name="khoiLuong" placeholder="gram">
                    </div>
                    <div class="col-md-4">
                        <label for="pageCount" class="form-label">Số trang</label>
                        <input type="text" class="form-control" id="pageCount" name="pageCount" placeholder="Trang">
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col">
                        <label for="format" class="form-label">Hình thức</label>
                        <input type="text" class="form-control" id="format" name="format"
                               value="${empty book ? '' :book.format}"
                               placeholder="Bìa cứng">
                    </div>

                </div>

                <!-- Description -->
                <div class="mb-3">
                    <label for="description" class="form-label">Mô tả sản phẩm</label>
                    <textarea class="form-control" id="description" name="description" rows="3"
                              placeholder="">${empty book ? '' :book.description}</textarea></div>

                <!-- Ảnh trưng bày -->
                <div class="mb-3">
                    <label for="anhTrungBay" class="form-label">Ảnh trưng bày (chọn 1)</label>
                    <input type="file" class="form-control" id="anhTrungBay" name="anhTrungBay">
                    <div id="anhTrungBayPreview" class="image-container mt-2">
                    </div>
                </div>

                <!-- Thêm ảnh khác -->
                <div class="mb-3">
                    <label for="themAnhKhac" class="form-label">Thêm ảnh khác</label>
                    <input type="file" class="form-control" id="themAnhKhac" name="themAnhKhac" multiple>
                    <div id="themAnhKhacPreview" class="image-container mt-2">
                    </div>
                </div>
            </div>

            <!-- Right Column -->
            <div class="col-4 bg-white rounded-2 shadow mx-4">
                <div class="row mb-3">
                    <div class="col-md-12 pt-3">
                        <label for="price" class="form-label">Giá</label>
                        <input type="text" class="form-control" id="price" name="price"
                               value="${empty book ? '' :book.salePrice}"
                               placeholder="">
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-12">
                        <label for="quantity" class="form-label">Số lượng</label>
                        <input type="text" class="form-control" id="quantity" name="quantity"
                               value="${empty book ? '' :book.stockQuantity}"
                               placeholder="">
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-12">
                        <label for="status" class="form-label">Trạng thái</label>
                        <select class="form-select" id="status" name="status">
                            <c:if test="${book.bId != null}">
                                <option value="1" ${book.status == 1 ? 'selected' : ''}>Hoạt động</option>
                                <option value="0" ${book.status == 0 ? 'selected' : ''}>Ngừng bán</option>
                            </c:if>
                            <c:if test="${book.bId == null}">
                                <option value="1">Hoạt động</option>
                                <option value="0">Ngừng bán</option>
                            </c:if>
                        </select>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-12">
                        <label for="category" class="form-label">Danh mục</label>
                        <select class="form-select" id="category" name="category">
                            <c:choose>
                                <c:when test="${not empty book}">
                                    <option value="1" ${book.categoryId == 1 ? 'selected' : ''}>Văn học</option>
                                    <option value="2" ${book.categoryId == 2 ? 'selected' : ''}>Kinh tế</option>
                                    <option value="3" ${book.categoryId == 3 ? 'selected' : ''}>Tâm lí học</option>
                                    <option value="4" ${book.categoryId == 4 ? 'selected' : ''}>Sách thiếu nhi</option>
                                    <option value="5" ${book.categoryId == 5 ? 'selected' : ''}>Tiểu sử - hồi kí
                                    </option>
                                    <option value="6" ${book.categoryId == 6 ? 'selected' : ''}>Sách giáo khoa</option>
                                    <option value="7" ${book.categoryId == 7 ? 'selected' : ''}>Sách Hướng Nghiệp & Phát
                                        Triển Bản Thân
                                    </option>
                                    <option value="8" ${book.categoryId == 8 ? 'selected' : ''}>Truyện ngắn</option>
                                    <option value="9" ${book.categoryId == 9 ? 'selected' : ''}>Tiểu thuyết</option>
                                    <option value="10" ${book.categoryId == 10 ? 'selected' : ''}>Tâm lí - Giáo dục
                                    </option>
                                    <option value="11" ${book.categoryId == 11 ? 'selected' : ''}>Tâm lí - Kỹ năng
                                        sống
                                    </option>
                                    <option value="12" ${book.categoryId == 12 ? 'selected' : ''}>Sách Tiếng Việt
                                    </option>
                                    <option value="13" ${book.categoryId == 13 ? 'selected' : ''}>Sách Kiến Thức - Hội
                                        Họa - Điện Ảnh
                                    </option>
                                    <option value="14" ${book.categoryId == 14 ? 'selected' : ''}>Truyện Tranh</option>
                                    <option value="15" ${book.categoryId == 15 ? 'selected' : ''}>Sách Chuyên Ngành
                                    </option>
                                    <option value="16" ${book.categoryId == 16 ? 'selected' : ''}>Nuôi dạy con</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="1" selected>Văn học</option>
                                    <option value="2">Kinh tế</option>
                                    <option value="3">Tâm lí học</option>
                                    <option value="4">Sách thiếu nhi</option>
                                    <option value="5">Tiểu sử - hồi kí</option>
                                    <option value="6">Sách giáo khoa</option>
                                    <option value="7">Sách Hướng Nghiệp & Phát Triển Bản Thân</option>
                                    <option value="8">Truyện ngắn</option>
                                    <option value="9">Tiểu thuyết</option>
                                    <option value="10">Tâm lí - Giáo dục</option>
                                    <option value="11">Tâm lí - Kỹ năng sống</option>
                                    <option value="12">Sách Tiếng Việt</option>
                                    <option value="13">Sách Kiến Thức - Hội Họa - Điện Ảnh</option>
                                    <option value="14">Truyện Tranh</option>
                                    <option value="15">Sách Chuyên Ngành</option>
                                    <option value="16">Nuôi dạy con</option>
                                </c:otherwise>
                            </c:choose>
                        </select>

                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-12">
                        <label for="publisher" class="form-label">Nhà xuất bản</label>
                        <select class="form-select" id="publisher" name="publisher">
                            <c:choose>
                                <c:when test="${not empty book}">
                                    <option value="1" ${book.publisherId == 1 ? 'selected' : ''}>NXB Trẻ</option>
                                    <option value="2" ${book.publisherId == 2 ? 'selected' : ''}>NXB Giáo dục Việt Nam
                                    </option>
                                    <option value="3" ${book.publisherId == 3 ? 'selected' : ''}>NXB Kim Đồng</option>
                                    <option value="4" ${book.publisherId == 4 ? 'selected' : ''}>NXB Hội Nhà văn
                                    </option>
                                    <option value="5" ${book.publisherId == 5 ? 'selected' : ''}>NXB Phương Nam</option>
                                    <option value="6" ${book.publisherId == 6 ? 'selected' : ''}>NXB Thế Giới</option>
                                    <option value="7" ${book.publisherId == 7 ? 'selected' : ''}>NXB Phụ Nữ</option>
                                    <option value="8" ${book.publisherId == 8 ? 'selected' : ''}>NXB Dân Trí</option>
                                    <option value="9" ${book.publisherId == 9 ? 'selected' : ''}>NXB Khoa Học - Xã Hội
                                    </option>
                                    <option value="10" ${book.publisherId == 10 ? 'selected' : ''}>NXB Tổng Hợp TP.
                                        HCM
                                    </option>
                                    <option value="11" ${book.publisherId == 11 ? 'selected' : ''}>NXB Thanh Niên
                                    </option>
                                    <option value="12" ${book.publisherId == 12 ? 'selected' : ''}>NXB Công Thương
                                    </option>
                                    <option value="13" ${book.publisherId == 13 ? 'selected' : ''}>NXB Hà Nội</option>
                                    <option value="14" ${book.publisherId == 14 ? 'selected' : ''}>NXB Văn Học</option>
                                </c:when>

                                <c:otherwise>
                                    <option value="1">NXB Trẻ</option>
                                    <option value="2">NXB Giáo dục Việt Nam</option>
                                    <option value="3">NXB Kim Đồng</option>
                                    <option value="4">NXB Hội Nhà văn</option>
                                    <option value="5">NXB Phương Nam</option>
                                    <option value="6">NXB Thế Giới</option>
                                    <option value="7">NXB Phụ Nữ</option>
                                    <option value="8">NXB Dân Trí</option>
                                    <option value="9">NXB Khoa Học - Xã Hội</option>
                                    <option value="10">NXB Tổng Hợp TP. HCM</option>
                                    <option value="11">NXB Thanh Niên</option>
                                    <option value="12">NXB Công Thương</option>
                                    <option value="13">NXB Hà Nội</option>
                                    <option value="14">NXB Văn Học</option>
                                </c:otherwise>
                            </c:choose>
                        </select>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-12">
                        <label for="promotion" class="form-label">Khuyến mãi</label>
                        <select class="form-select" id="promotion" name="promotion">
                            <c:choose>
                                <c:when test="${not empty book}">
                                    <option value="0" ${empty book.promotion}>Không giảm giá</option>
                                    <option value="1" ${book.promotionId == 1 ? 'selected' : ''}>Giảm 10%</option>
                                    <option value="2" ${book.promotionId == 2 ? 'selected' : ''}>Giảm 20%</option>
                                    <option value="3" ${book.promotionId == 3 ? 'selected' : ''}>Giảm 25%</option>
                                    <option value="4" ${book.promotionId == 4 ? 'selected' : ''}>Giảm 50%</option>
                                </c:when>

                                <c:otherwise>
                                    <option value="1" selected>Không giảm giá</option>
                                    <option value="2">Giảm 10%</option>
                                    <option value="3">Giảm 20%</option>
                                    <option value="4">Giảm 25%</option>
                                    <option value="5">Giảm 50%</option>
                                </c:otherwise>
                            </c:choose>
                        </select>
                    </div>
                </div>
            </div>
        </div>


    </form>
</div>

<!--all script files-->
<script src="../fonts/fontawesome-free-6.6.0-web/js/all.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.bundle.min.js"></script>
<script src="../js/datatables.min.js"></script>

<script>
    $('#addOrUpdate').click(function (e) {
        e.preventDefault();
        console.log("Thêm hoặc sửa sản phẩm đã được bấm");

        var productId = "${book.bId}";
        var formElement = document.getElementById('formSubmit');
        var formData = new FormData(formElement); // dùng FormData để chứa cả file

        // In thử thông tin để debug
        for (let [key, value] of formData.entries()) {
            console.log(key, value);
        }

        if (productId === "") {
            addProduct(formData);
        } else {
            updateProduct(formData, productId);
        }
    });


    function addProduct(data) {
        $.ajax({
            type: "POST",
            url: "product",
            data: data,
            processData: false,       // Phải là false
            contentType: false,
            dataType: 'json',
            success: function (data) {
                console.log("SUCCESS : ", data);
                alert("Thêm thành công");
                window.location.href = "product-management"; // Điều hướng về trang quản lý sản phẩm
            },
            error: function (e) {
                console.log("ERROR : ", e);
                alert("Thêm thất bại");
            }
        });
    }

    function updateProduct(data, id) {
        $.ajax({
            type: "PUT",
            url: "product?id=" + id,
            data: data,
            processData: false,
            contentType: false,
            dataType: 'json',
            success: function (data) {
                alert("Cập nhật thành công: ", data);
                window.location.href = "product-management"; // Điều hướng về trang quản lý sản phẩm
            },
            error: function (e) {
                console.log("ERROR : ", e);
                alert("Cập nhật thất bại");
            }
        });
    }

</script>
</body>
</html>
