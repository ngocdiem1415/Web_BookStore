<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 15/01/2025
  Time: 5:35 CH
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Quản lí khuyến mãi</title>

    <!--  all css files-->
    <link rel="stylesheet" href="../../css/boostrap/bootstrap.min.css">
    <link rel="stylesheet" href="../../css/dataTable/datatables.min.css">
    <link rel="stylesheet" href="../../css/Style.css">
    <link rel="stylesheet" href="../../fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="../css/Dashboard.css">


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
                            <a href="Dashboard.html" class="text-dec" style="color: gray">Dashboard</a>
                            <a href="#" class="text-dec" style="color: gray"> / </a>
                            <a href="#" class="text-dec" style="color: #f07c29">Quản lí khuyến mãi</a>
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
                                    <div class=" d-flex justify-content-between">
                                        <div class="main-card-title my-3">
                                            <h3>Quản lí khuyến mãi</h3>
                                        </div>
                                        <button type="button" class="btn btn-green my-4 border rounded"
                                                data-bs-toggle="modal"
                                                data-bs-target="#addDiscount">
                                            <i class="fa-solid fa-plus"></i>
                                            Thêm khuyến mãi
                                        </button>
                                    </div>
                                    <!-- Modal -->
                                    <div class="modal fade" id="addDiscount" tabindex="-1"
                                         aria-labelledby="staticBackdropLabel"
                                         aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="discountLabel">Thêm CTKM</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body row">
                                                    <div>
                                                        <div class="mb-3">
                                                            <label for="idDis" class="labels">ID CTKM</label>
                                                            <fieldset disabled>
                                                                <input id="idDis" type="text"
                                                                       class="form-control disabled" placeholder="ID"
                                                                       value="">
                                                            </fieldset>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="nameDis" class="labels">Tên khuyến mãi</label>
                                                            <input id="nameDis" type="text" class="form-control">
                                                        </div>
                                                        <div class=" mb-2">
                                                            <label for="discount">Giá trị khuyến mãi </label>
                                                            <input type="text" class="form-control"
                                                                   id="discount" name="phone" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="fromDate">Ngày bắt đầu </label>
                                                            <input type="date" class="form-control"
                                                                   id="fromDate" name="phone" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label for="toDate">Ngày bắt đầu </label>
                                                            <input type="date" class="form-control"
                                                                   id="toDate" name="phone" required>
                                                        </div>
                                                        <div class="d-flex justify-content-center mb-2">
                                                            <button type="button"
                                                                    class="btn btn-green save-supplier mx-4">
                                                                Lưu
                                                            </button>
                                                            <button type="button"
                                                                    class="btn btn-danger cancel-supplier">
                                                                Hủy
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <th scope="row">
                                    <table class="table" id="discountTable">
                                        <thead>
                                        <tr>
                                            <th scope="col">ID</th>
                                            <th>Tên CTKM</th>
                                            <th>Giảm giá</th>
                                            <th>Ngày bắt đầu</th>
                                            <th>Ngày kết thúc</th>
                                            <th>Trạng thái kích hoạt</th>
                                            <th>Hoạt động</th>
                                        </tr>
                                        </thead>
                                        <tbody style="font-weight: lighter">
                                        <tr>
                                            <th scope="row">1</th>
                                            <td>Khuyến mãi mua 1 tặng 1</td>
                                            <td></td>
                                            <td>10/10/2024</td>
                                            <td>11/11/2024</td>
                                            <td>hết hạn</td>
                                            <td>
                                                <button type="button" class="btn btn-edit m-0 p-0">
                                                    <i class="fa-regular fa-pen-to-square fa-lg mx-2"
                                                       style="color: #236844"></i>
                                                </button>
                                                <button type="button" class="btn  m-0 p-0" data-bs-toggle="modal"
                                                        data-bs-target="#confirmDeleteModal">
                                                    <i class="fa-regular fa-trash-can fa-lg mx-2 "
                                                       style="color: #ef5f5f"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">2</th>
                                            <td>Khuyến mãi 30%</td>
                                            <td>30%</td>
                                            <td>10/10/2024</td>
                                            <td>11/12/2024</td>
                                            <td>hoạt động</td>
                                            <td>
                                                <button type="button" class="btn btn-edit m-0 p-0">
                                                    <i class="fa-regular fa-pen-to-square fa-lg mx-2"
                                                       style="color: #236844"></i>
                                                </button>
                                                <button type="button" class="btn  m-0 p-0" data-bs-toggle="modal"
                                                        data-bs-target="#confirmDeleteModal">
                                                    <i class="fa-regular fa-trash-can fa-lg mx-2 "
                                                       style="color: #ef5f5f"></i>
                                                </button>
                                            </td>
                                        </tr>
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
                    <h5 class="modal-title" id="confirmDeleteModalLabel">Xóa chương trình khuyến mãi</h5>
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
<script src="../../fonts/fontawesome-free-6.6.0-web/js/all.js"></script>
<script src="../../js/jquery.min.js"></script>
<script src="../../js/bootstrap.bundle.min.js"></script>
<script src="../../js/datatables.min.js"></script>

<!--script-->
<script>
    var myModalEl = document.getElementById('addDiscount');
    $(document).ready(function () {
        // Khởi tạo DataTable cho bảng với id 'orderTable'
        var table = $('#discountTable').DataTable({
            language: {
                processing: "đang tải",
                search: "Tìm kiếm",
                lengthMenu: "Số dòng hiển thị _MENU_ ",
                info: "Bài viết từ _START_ đến _END_ trong _TOTAL_ khuyến mãi",
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

        myModalEl.addEventListener('hidden.bs.modal', function (event) {
            $('#discountLabel').html("Thêm CTKM")
            $('#idDis').val("")
            $('#nameDis').val("");
            $('#discount').val("");
            $('#fromDate').val("");
            $('#toDate').val("");

        });

        $('#discountTable tbody').on('click', '.btn-edit', function () {
            var data = table.row($(this).parents('tr')).data();

            // Đặt tiêu đề modal và điền dữ liệu vào các trường trong modal
            $('#discountLabel').html("Sửa CTKM");
            $('#idDis').val(data[0]);
            $('#nameDis').val(data[1]);
            $('#discount').val(data[2]);

            let fromDate = new Date(data[3]);
            let toDate = new Date(data[4]);

            // Format lại dữ liệu về đúng dạng YYYY-MM-DD trước khi gán vào input
            $('#fromDate').val(fromDate.toISOString().split('T')[0]);
            $('#toDate').val(toDate.toISOString().split('T')[0]);


            // Mở modal cho phép chỉnh sửa
            $('#addDiscount').modal('show');
        });
    });
</script>
</body>
</html>
