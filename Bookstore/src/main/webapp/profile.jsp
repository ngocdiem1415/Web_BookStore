<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:18 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="vn.edu.hcmuaf.fit.bookstore.beans.User" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile</title>
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">
    <link rel="stylesheet" href="css/Header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/Style.css">
    <script src="js/bootstrap.bundle.min.js"></script>


</head>
<body>
<!--Header-->
<jsp:include page="Header.jsp"></jsp:include>


<!--Content-->
<div class="content-profile" class="container-profile">
    <div class="container-profile-content">
        <div class="container-profile container-profile-content-inner">
            <!--content left-->
            <%@ include file="content-left-profile.jsp" %>

            <!--            right: thong tin chi tiet-->
            <div id="profile-section" class="container-profile-content-inner__right">
                <div class="container-profile-content-inner__right-main" role="main">
                    <div style="display: contents">
                        <div class="container-profile-content-inner__right-main-inner">
                            <!--  Hồ sơ của tôi chi tiết phần header-->
                            <div class="container-profile-content-inner__right-main-header">
                                <h1 class="container-profile-content-inner__right-main-header__title">Hồ Sơ Của Tôi</h1>
                                <div class="container-profile-content-inner__right-main-header__description">Quản lý
                                    thông tin hồ sơ để bảo mật tài khoản
                                </div>
                            </div>
                            <form action="profile" method="post" enctype="multipart/form-data">
                                <!-- Phần content của phía bên phải-->
                                <div class="container-profile-content-inner__right-main-content">
                                    <div class="container-profile-content-inner__right-main-content-center">
                                        <!--form thông tin account-->
                                        <!--Dùng table để phân chia các thông tin-->
                                        <table class="container-profile-content-inner__right-main-content-center__table">
                                            <!--Các hang lưu trữ thông tin-->
                                            <!--Ten Dang Nhap-->
                                            <tr>
                                                <td class="table__row-label">
                                                    <label>Tên đăng nhập</label>
                                                </td>
                                                <td class="table__row-input">
                                                    <div class="table__row-input__text">
                                                        <input class="table__row-input__text-name" name="username"
                                                               value="${userSession.getUsername()}">
                                                    </div>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="table__row-label">
                                                    <label>Email</label>
                                                </td>
                                                <td class="table__row-input">
                                                    <div class="table__row-input__text">
                                                        <input class="table__row-input__text-name" name="email"
                                                               value="${userSession.getEmail()}">
                                                    </div>
                                                </td>
                                            </tr>

                                            <!-- phone-->
                                            <tr>
                                                <td class="table__row-label">
                                                    <label>Số điện thoại</label>
                                                </td>
                                                <td class="table__row-input">
                                                    <div class="table__row-input__text">
                                                        <input class="table__row-input__text-name" name="phone"
                                                               value="${userSession.getPhone()}">
                                                    </div>
                                                </td>
                                            </tr>

                                            <!--Gioi Tinh-->
                                            <tr>
                                                <td class="table__row-label">
                                                    <label>Giới tính</label>
                                                </td>
                                                <td class="table__row-input">
                                                    <div class="table__row-input__text">
                                                        <!-- div chứa các radioBox -->
                                                        <div class="table__row-input-stardust-radio-group">
                                                            <select class="form-select" id="gender" name="gender"
                                                                    required>
                                                                <option value="male" ${userSession.gender == male ? 'selected' : ''}>
                                                                    Nam
                                                                </option>
                                                                <option value="female" ${userSession.gender == female ? 'selected' : ''}>
                                                                    Nữ
                                                                </option>
                                                                <option value="other" ${userSession.gender == other ? 'selected' : ''}>
                                                                    Khác
                                                                </option>
                                                            </select>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                            <!--Ngay Sinh-->
                                            <tr>
                                                <td class="table__row-label">
                                                    <label>Ngày sinh</label>
                                                </td>
                                                <td class="table__row-input">
                                                    <div class="table__row-input__text">
                                                        <input class="table__row-input__text-name" name="birthdate"
                                                               value="${userSession.getDob()}">
                                                    </div>
                                                </td>
                                            </tr>

                                            <!--Button-->
                                            <tr>
                                                <td class="table__row-label">
                                                    <label></label>
                                                </td>
                                                <td class="table__row-input" id="upload-image">
                                                    <button id="save--btn" type="submit"
                                                            class="btn btn-solid-primary btn--m btn--inline">Lưu
                                                    </button>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>

                                    <!--upload ảnh-->
                                    <div class="container-profile-content-inner__right-main-content-upload">
                                        <div class="right-main-content-upload-header">
                                            <div class="right-main-content-upload-header-focus">
                                                <div class="right-main-content-upload-header-focus-image">
                                                    <img src="${userSession.avatar}" id="previewImage" style="opacity: 1"/>
                                                </div>
                                            </div>
                                            <!-- Nút upload -->
                                            <input type="file" name="imageFile" accept=".jpg,.jpeg,.png"
                                                   class="right-main-content-upload-header-focus-input" id="fileInput">
                                            <label for="fileInput" class="btn btn-light btn--m btn--inline">Chọn
                                                ảnh</label>
                                            <!-- Hướng dẫn upload -->
                                            <div class="right-main-content-upload-header-text">
                                                <div class="right-main-content-upload-header-text-same">Dung lượng file
                                                    tối
                                                    đa 1 MB
                                                </div>
                                                <div class="right-main-content-upload-header-text-same">Định
                                                    dạng:.JPPEG,
                                                    .PNG
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!--footer-->
<!--<div id="footer"></div>-->
<!--    footer start -->
<jsp:include page="footer.jsp"></jsp:include>
<!--footer end-->

<%--DUng ajax de load anh--%>
<script>
    $('form').on('submit', function (e) {
        e.preventDefault();

        let formData = new FormData(this);

        // Gửi ảnh cùng các thông tin người dùng lên luôn nếu muốn
        $.ajax({
            url: 'upload-image',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (imageUrl) {
                alert('Upload thành công: ' + imageUrl);
                location.reload();

                // Optionally: cập nhật preview
                $('#previewImage').attr('src', imageUrl);
            },
            error: function () {
                alert('Upload thất bại');
            }
        });
    });
</script>

<script>
    document.getElementById("fileInput").addEventListener("change", function (event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();

            // Đọc file và gán vào phần hiển thị
            reader.onload = function (e) {
                const previewImage = document.getElementById("previewImage");
                previewImage.src = e.target.result;
            };

            reader.readAsDataURL(file);
        }
    });
</script>

<!--script when click 'thay doi'-->
<script>
    document.addEventListener("DOMContentLoaded", () => {
        const editButtons = document.querySelectorAll('.table__row-input__text-button');
        const saveButton = document.getElementById('save--btn');

        // Xử lý khi nhấn nút "Thay Đổi"
        editButtons.forEach(button => {
            button.addEventListener('click', function () {
                const parent = this.closest('.table__row-input__text');
                const textName = parent.querySelector('.table__row-input__text-name');

                if (textName) {
                    const currentValue = textName.textContent.trim();
                    const inputField = document.createElement('input');
                    inputField.className = 'table__row-input__field-text';

                    // Đặt loại input dựa vào ID của nút
                    if (this.id === 'edit-email') {
                        inputField.type = 'email';
                        inputField.placeholder = 'Nhập email mới';
                    } else if (this.id === 'edit-phone') {
                        inputField.type = 'tel';
                        inputField.placeholder = 'Nhập số điện thoại mới';
                        inputField.pattern = '[0-9]{10,12}';
                    } else if (this.id === 'edit-birthday') {
                        inputField.type = 'date';
                        inputField.placeholder = 'Chọn ngày sinh';
                    } else {
                        inputField.type = 'text'; // Mặc định cho các trường khác
                        inputField.placeholder = 'Nhập thông tin mới';
                    }

                    inputField.value = currentValue;
                    parent.replaceChild(inputField, textName);

                    // Đổi nút từ "Thay Đổi" thành "Lưu"
                    this.textContent = 'Lưu';
                    this.classList.add('save-mode'); // Thêm class để phân biệt
                    this.addEventListener('click', saveEdit, {once: true});
                }
            });
        });

        // Hàm xử lý lưu thông tin
        function saveEdit(event) {
            const button = event.target;
            const parent = button.closest('.table__row-input__text');
            const inputField = parent.querySelector('.table__row-input__field-text');

            if (inputField) {
                // Kiểm tra tính hợp lệ
                if (!inputField.checkValidity()) {
                    alert(`Vui lòng nhập thông tin hợp lệ cho trường: ${inputField.placeholder}`);
                    return; // Ngừng lưu nếu không hợp lệ
                }

                const newValue = inputField.value.trim();
                const textName = document.createElement('div');
                textName.textContent = newValue || 'Chưa nhập'; // Giá trị mặc định nếu bỏ trống
                textName.className = 'table__row-input__text-name';
                parent.replaceChild(textName, inputField);

                // Đổi nút về "Thay Đổi"
                button.textContent = 'Thay Đổi';
                button.classList.remove('save-mode');
            }
        }

        // Xử lý khi nhấn nút "Lưu" tổng thể
        saveButton.addEventListener('click', function () {
            const inputFields = document.querySelectorAll('.table__row-input__field-text');
            let isValid = true;

            inputFields.forEach(input => {
                if (!input.checkValidity()) {
                    alert(`Vui lòng nhập thông tin hợp lệ cho trường: ${input.placeholder}`);
                    isValid = false;
                }
            });

            if (!isValid) return; // Ngừng lưu nếu có lỗi

            inputFields.forEach(input => {
                const newValue = input.value.trim();
                const textName = document.createElement('div');
                textName.textContent = newValue || 'Chưa nhập';
                textName.className = 'table__row-input__text-name';
                const parent = input.closest('.table__row-input__text');
                parent.replaceChild(textName, input);
            });

            alert("Thông tin đã được lưu!");
        });
    });
</script>

<script>
    document.getElementById('profile-link').addEventListener('click', function (event) {
        event.preventDefault();

        // Show profile section and hide others
        document.getElementById('profile-section').style.display = 'block';
        document.getElementById('bank-section').style.display = 'none';
        document.getElementById('address-section').style.display = 'none';
        document.getElementById('password-change-section').style.display = 'none';
        document.getElementById('privacy-section').style.display = 'none';

        // Set active class on profile link
        this.classList.add('stardust-dropdown__item-body__content-item-active');
        document.getElementById('bank-link').classList.remove('stardust-dropdown__item-body__content-item-active');
        document.getElementById('address-link').classList.remove('stardust-dropdown__item-body__content-item-active');
        document.getElementById('password-change-link').classList.remove('stardust-dropdown__item-body__content-item-active');
        document.getElementById('privacy-link').classList.remove('stardust-dropdown__item-body__content-item-active');
    });

    document.getElementById('bank-link').addEventListener('click', function (event) {
        event.preventDefault();

        // Show bank section and hide others
        document.getElementById('profile-section').style.display = 'none';
        document.getElementById('bank-section').style.display = 'block';
        document.getElementById('address-section').style.display = 'none';
        document.getElementById('password-change-section').style.display = 'none';
        document.getElementById('privacy-section').style.display = 'none';


        // Set active class on bank link
        this.classList.add('stardust-dropdown__item-body__content-item-active');
        document.getElementById('profile-link').classList.remove('stardust-dropdown__item-body__content-item-active');
        document.getElementById('address-link').classList.remove('stardust-dropdown__item-body__content-item-active');
        document.getElementById('password-change-link').classList.remove('stardust-dropdown__item-body__content-item-active');
        document.getElementById('privacy-link').classList.remove('stardust-dropdown__item-body__content-item-active');
    });

    document.getElementById('address-link').addEventListener('click', function (event) {
        event.preventDefault();

        // Show address section and hide others
        document.getElementById('profile-section').style.display = 'none';
        document.getElementById('bank-section').style.display = 'none';
        document.getElementById('address-section').style.display = 'block';
        document.getElementById('password-change-section').style.display = 'none';
        document.getElementById('privacy-section').style.display = 'none';


        // Set active class on address link
        this.classList.add('stardust-dropdown__item-body__content-item-active');
        document.getElementById('profile-link').classList.remove('stardust-dropdown__item-body__content-item-active');
        document.getElementById('bank-link').classList.remove('stardust-dropdown__item-body__content-item-active');
        document.getElementById('password-change-link').classList.remove('stardust-dropdown__item-body__content-item-active');
        document.getElementById('privacy-link').classList.remove('stardust-dropdown__item-body__content-item-active');
    });

    document.getElementById('password-change-link').addEventListener('click', function (event) {
        event.preventDefault();

        // Show password change section and hide others
        document.getElementById('profile-section').style.display = 'none';
        document.getElementById('bank-section').style.display = 'none';
        document.getElementById('address-section').style.display = 'none';
        document.getElementById('password-change-section').style.display = 'block';
        document.getElementById('privacy-section').style.display = 'none';

        // Set active class on password change link
        this.classList.add('stardust-dropdown__item-body__content-item-active');
        document.getElementById('profile-link').classList.remove('stardust-dropdown__item-body__content-item-active');
        document.getElementById('bank-link').classList.remove('stardust-dropdown__item-body__content-item-active');
        document.getElementById('address-link').classList.remove('stardust-dropdown__item-body__content-item-active');
        document.getElementById('privacy-link').classList.remove('stardust-dropdown__item-body__content-item-active');
    });


    document.getElementById('privacy-link').addEventListener('click', function (event) {
        event.preventDefault();

        // Show privacy change section and hide others
        document.getElementById('profile-section').style.display = 'none';
        document.getElementById('bank-section').style.display = 'none';
        document.getElementById('address-section').style.display = 'none';
        document.getElementById('password-change-section').style.display = 'none';
        document.getElementById('privacy-section').style.display = 'block';

        // Set privacy class on password change link
        this.classList.add('stardust-dropdown__item-body__content-item-active');
        document.getElementById('profile-link').classList.remove('stardust-dropdown__item-body__content-item-active');
        document.getElementById('bank-link').classList.remove('stardust-dropdown__item-body__content-item-active');
        document.getElementById('password-change-section').classList.remove('stardust-dropdown__item-body__content-item-active');
        document.getElementById('address-section').classList.remove('stardust-dropdown__item-body__content-item-active');
    });
</script>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const accountDropdownHeader = document.querySelector('.stardust-dropdown__item-header-menu');
        const dropdownBody = document.querySelector('.stardust-dropdown__item-body');
        const icon = document.querySelector('.stardust-dropdown__item-header-account-name i');

        accountDropdownHeader.addEventListener('click', function (event) {
            event.preventDefault(); // Ngăn chặn load lại trang
            dropdownBody.classList.toggle('stardust-dropdown__item-body--open');
            icon.classList.toggle('rotate-icon');
        });
    });
</script>

</body>
</html>
