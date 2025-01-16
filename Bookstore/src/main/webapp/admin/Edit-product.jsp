<%--
  Created by IntelliJ IDEA.
  User: ngocd
  Date: 1/15/2025
  Time: 1:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Chỉnh sửa sản phẩm</title>

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
                <a href="#" class="text-dec" style="color: #f07c29">Chỉnh sửa sản phẩm</a>
            </li>
        </ol>
    </div>
    <div class="row d-flex align-items-center justify-content-center">
        <h2 class="col-9 text-center my-4">Chỉnh sửa sản phẩm</h2>
        <div class="col-3 d-flex justify-content-center">
            <button type="button" class="btn btn-success me-2 my-4" style="background: #4B908E" id="update" onclick="window.location.href='product-management';">
                <i class="fa-solid fa-check"></i> Xong
            </button>
            <button type="button" class="btn btn-danger my-4"
                    onclick="window.location.href='product-management';">
                <i class="fa-solid fa-times"></i> Hủy
            </button>
        </div>
    </div>
    <form id="formSubmit" enctype="multipart/form-data">
        <div class="row d-flex flex-nowrap m-0 p-0">
            <!-- Left Column -->
            <div class="col-7 bg-white rounded-2 shadow mx-4">
                <!-- Product Details -->
                <div class="row mb-3">
                    <div class="col-md-12 pt-3">
                        <label for="tenSanPham" class="form-label">Tên sản phẩm</label>
                        <input type="text" class="form-control" id="tenSanPham" value="${book.title}"
                               placeholder="Nhập tên sản phẩm">
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-5">
                        <label for="Tacgia" class="form-label">Tác giả</label>
                        <input type="text" class="form-control" id="Tacgia" value="${book.author}" placeholder="">
                    </div>
                    <div class="col-md-2">
                        <label for="NamXB" class="form-label">Năm XB</label>
                        <input type="text" class="form-control" id="NamXB" value="${book.publishYear}" placeholder="">
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-4">
                        <label class="form-label">Kích thước (cm)</label>
                        <div class="input-group">
                            <input type="text" class="form-control" id="height" value="${book.dimensions.split('x')[0]}"
                                   placeholder="">
                            <input type="text" class="form-control" id="width" value="${book.dimensions.split('x')[1]}"
                                   placeholder="">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <label for="khoiLuong" class="form-label">Khối lượng</label>
                        <input type="text" class="form-control" id="khoiLuong" value="${book.weight}" placeholder="">
                    </div>
                    <div class="col-md-4">
                        <label for="chatLieu" class="form-label">Số trang</label>
                        <input type="text" class="form-control" id="chatLieu" value="${book.pageCount}" placeholder="">
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col">
                        <label for="HinhThuc" class="form-label">Hình thức</label>
                        <input type="text" class="form-control" id="HinhThuc" value="${book.format}" placeholder="">
                    </div>
                </div>

                <!-- Description -->
                <div class="mb-3">
                    <label for="moTaSanPham" class="form-label">Mô tả sản phẩm</label>
                    <textarea class="form-control" id="moTaSanPham" rows="3"
                              placeholder="">${book.description}</textarea>
                </div>

                <!-- Image Upload -->
                <div class="mb-3">
                    <label for="anhTrungBay" class="form-label">Ảnh trưng bày (chọn 1)</label>
                    <input type="file" class="form-control" id="anhTrungBay">
                    <div id="anhTrungBayPreview" class="image-container">
                    </div>
                </div>

                <div class="mb-3">
                    <label for="themAnhKhac" class="form-label">Thêm ảnh khác</label>
                    <input type="file" class="form-control" id="themAnhKhac" multiple>
                    <div id="themAnhKhacPreview" class="image-container"></div>
                </div>
            </div>

            <!-- Right Column -->
            <div class="col-4 bg-white rounded-2 shadow mx-4">
                <div class="row mb-3">
                    <div class="col-md-12 pt-3">
                        <label for="giaSanPham" class="form-label">Giá</label>
                        <input type="text" class="form-control" id="giaSanPham" value="${book.salePrice}"
                               placeholder="">
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-12">
                        <label for="soLuongSanPham" class="form-label">Số lượng</label>
                        <input type="text" class="form-control" id="soLuongSanPham" value="${book.stockQuantity}"
                               placeholder="">
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-12">
                        <label for="trangThai" class="form-label">Trạng thái</label>
                        <select class="form-select" id="trangThai">
                            <option value="1" ${book.status == 1 ? 'selected' : ''}>Hoạt động</option>
                            <option value="0" ${book.status == 0 ? 'selected' : ''}>Ngừng bán</option>
                        </select>
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-12">
                        <label for="danhMuc" class="form-label">Danh mục</label>
                        <select class="form-select" id="danhMuc">
                            <option value="1" ${book.categoryId == 1 ? 'selected' : ''}>Văn học</option>
                            <option value="2" ${book.categoryId == 2 ? 'selected' : ''}>Kinh tế</option>
                            <option value="3" ${book.categoryId == 3 ? 'selected' : ''}>Tâm lí học</option>
                            <option value="4" ${book.categoryId == 4 ? 'selected' : ''}>Sách thiếu nhi</option>
                            <option value="5" ${book.categoryId == 5 ? 'selected' : ''}>Tiểu sử - hồi kí</option>
                            <option value="6" ${book.categoryId == 6 ? 'selected' : ''}>Sách giáo khoa</option>
                            <option value="7" ${book.categoryId == 7 ? 'selected' : ''}>Sách Hướng Nghiệp & Phát Triển
                                Bản Thân
                            </option>
                            <option value="8" ${book.categoryId == 8 ? 'selected' : ''}>Truyện ngắn</option>
                            <option value="9" ${book.categoryId == 9 ? 'selected' : ''}>Tiểu thuyết</option>
                            <option value="10" ${book.categoryId == 10 ? 'selected' : ''}>Tâm lí - Giáo dục</option>
                            <option value="11" ${book.categoryId == 11 ? 'selected' : ''}>Tâm lí - Kỹ năng sống</option>
                            <option value="12" ${book.categoryId == 12 ? 'selected' : ''}>Sách Tiếng Việt</option>
                            <option value="13" ${book.categoryId == 13 ? 'selected' : ''}>Sách Kiến Thức - Hội Họa -
                                Điện Ảnh
                            </option>
                            <option value="14" ${book.categoryId == 14 ? 'selected' : ''}>Truyện Tranh</option>
                            <option value="15" ${book.categoryId == 15 ? 'selected' : ''}>Sách Chuyên Ngành</option>
                            <option value="16" ${book.categoryId == 16 ? 'selected' : ''}>Nuôi dạy con</option>
                        </select>

                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-12">
                        <label for="nhaCungCap" class="form-label">Nhà cung cấp</label>
                        <input type="text" class="form-control" id="nhaCungCap" value="${book.publisher.p_name}"
                               placeholder="">
                    </div>
                </div>

                <div class="row mb-3">
                    <div class="col-md-12">
                        <label for="khuyenMai" class="form-label">Khuyến mãi</label>
                        <select class="form-select" id="khuyenMai" name="khuyenMai">
                            <option value="1" ${book.promotionId == 1 ? 'selected' : ''}>Giảm 10%</option>
                            <option value="2" ${book.promotionId == 2 ? 'selected' : ''}>Giảm 20%</option>
                            <option value="3" ${book.promotionId == 3 ? 'selected' : ''}>Giảm 25%</option>
                            <option value="4" ${book.promotionId == 4 ? 'selected' : ''}>Giảm 50%</option>
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
    $('#update').click(function (e) {
        var formData = new FormData($("#formSubmit")[0]);

        $.ajax({
            type: "PUT",
            url: "EditProduct",
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                alert("Cập nhật thành công");
                window.location.href = "/admin/product-management"; // Điều hướng về trang quản lý sản phẩm
            },
            error: function (e) {
                console.log("ERROR : ", e);
                alert("Cập nhật thất bại");
            }
        });
    });
</script>

</body>
</html>