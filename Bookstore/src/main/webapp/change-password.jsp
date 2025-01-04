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
    <title>Change password</title>
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">
    <link rel="stylesheet" href="css/Header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/Style.css">
    <script src="js/bootstrap.bundle.min.js"></script>


</head>
<body>
<!--header-->
<%@ include file="Header.jsp" %>

    <!-- container -->
 <div class="container ">
        <!-- NAV -->
        <ul class="main-nav nav ">
            <li class="nav-item "><a href="Home.jsp">Trang chủ</a></li>
            <li class="nav-item "><a href="AboutUs.jsp">Giới thiệu</a></li>
            <li class="nav-item dropdown ">
                <a class="nav-link dropdown-toggle pt-0 pl-15 pr-10" href="category.jsp" id="productDropdown"
                   role="button" data-bs-toggle="dropdown" aria-expanded="false">
                    Sản phẩm
                </a>
                <ul class="dropdown-menu" aria-labelledby="productDropdown">
                    <li><a class="dropdown-item" href="category.jsp">Sách văn học</a></li>
                    <li><a class="dropdown-item" href="category.jsp">Kinh tế</a></li>
                    <li><a class="dropdown-item" href="category.jsp">Sách thiếu nhi</a></li>
                    <li><a class="dropdown-item" href="category.jsp">Tiểu sử - Hồi ký</a></li>
                    <li><a class="dropdown-item" href="category.jsp">Tâm lí - Kĩ năng sống</a></li>
                    <li><a class="dropdown-item" href="category.jsp">Nuôi dạy con</a></li>
                    <li><a class="dropdown-item" href="category.jsp">Sách giáo khoa</a></li>
                </ul>
            </li>
            <li class="nav-item "><a href="policy.jsp">Chính sách</a></li>
            <li class="nav-item "><a href="contact.jsp">Liên hệ</a></li>
        </ul>
        <!-- /NAV -->
    </div>
<!--/nav end-->


<!--Content-->
<div class="content-profile" class="container-profile">
    <div class="container-profile-content">
        <div class="container-profile container-profile-content-inner">
            <!--content left-->
            <div class="container-profile-content-inner__left">

                <div class="profile-info">
                    <a href="" class="profile-info-logo">
                        <div class="profile-info-avatar-img">
                            <div class="profile-info-avatar_img__placeholder">

                            </div>
                        </div>
                    </a>
                    <div class="profile-info-username">
                        <div class="profile-info-username__text">${userSession.getUsername()}</div>
                        <div>
                            <a href="" class="profile-info-username__edit">
                                <i class="fa-solid fa-pencil"></i>
                                <span>Sửa Hồ Sơ</span>
                            </a>
                        </div>
                    </div>
                </div>
                <!--Drop down account -->
                <div class="profile-stardust-dropdown">
                    <div class="stardust-dropdown stardust-dropdown--open ">
                        <!--img + name-->
                        <div class="stardust-dropdown__item-header">
                            <a href="" class="stardust-dropdown__item-header-menu">
                                <div class="stardust-dropdown__item-header-account-img">
                                    <img src="admin/img/Sample_user_icon_profile.png" height="48" width="48"/></div>
                                <div class="stardust-dropdown__item-header-account-name">
                                    <span class="stardust-dropdown__item-header-account-name-text">Tài Khoản Của Tôi</span>
                                    <i class="fa-solid fa-chevron-down"></i>
                                </div>
                            </a>
                        </div>
                        <!--dropdown menu detail-->
                        <div class="stardust-dropdown__item-body stardust-dropdown__item-body--open">
                            <div class="stardust-dropdown__item-body__content">
                                <a href="profile" id="profile-link"
                                   class="stardust-dropdown__item-body__content-item"><span
                                        class="stardust-dropdown__item-body__content-item--text">Hồ sơ</span></a>
                                <a href="change-password" id="password-change-link"
                                   class="stardust-dropdown__item-body__content-item stardust-dropdown__item-body__content-item-active"><span
                                        class="stardust-dropdown__item-body__content-item--text">Đổi Lại Mật Khẩu</span></a>
                                <a href="" id="privacy-link" class="stardust-dropdown__item-body__content-item"><span
                                        class="stardust-dropdown__item-body__content-item--text">Những Thiết Lập Riêng Tư</span>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="stardust-dropdown">
                        <div class="stardust-dropdown__item-header">
                            <a href="purchase-order" class="stardust-dropdown__item-header-menu">
                                <div class="stardust-dropdown__item-header-account-img">
                                    <img src="admin/img/sample_Menu_Icon.png"/>
                                </div>
                                <div class="stardust-dropdown__item-header-account-name">
                                    <span class="stardust-dropdown__item-header-account-name-text">Đơn Mua</span>
                                </div>
                            </a>
                        </div>
                    </div>

                    <!--yeu thich-->
                    <div class="stardust-dropdown">
                        <div class="stardust-dropdown__item-header">
                            <a href="Like.jsp" class="stardust-dropdown__item-header-menu">
                                <div class="stardust-dropdown__item-header-account-img">
                                    <img src="admin/img/Heart-icon.png"/></div>
                                <div class="stardust-dropdown__item-header-account-name">
                                    <span class="stardust-dropdown__item-header-account-name-text">Yêu Thích</span>
                                </div>
                            </a>
                        </div>
                    </div>

                    <!--Dang Xuat-->
                    <div class="stardust-dropdown">
                        <div class="stardust-dropdown__item-header">
                            <a href="Home.jsp" class="stardust-dropdown__item-header-menu">
                                <div class="stardust-dropdown__item-header-account-img">
                                    <i class="fa-solid fa-circle-xmark"></i>
                                </div>
                                <div class="stardust-dropdown__item-header-account-name">
                                    <span class="stardust-dropdown__item-header-account-name-text">Đăng Xuất</span>
                                </div>
                            </a>
                        </div>
                    </div>

                    <!--Ve admin-->
                    <div class="stardust-dropdown">
                        <div class="stardust-dropdown__item-header">
                            <a href="admin/Dashboard.jsp" class="stardust-dropdown__item-header-menu">
                                <div class="stardust-dropdown__item-header-account-img">
                                    <img src="admin/img/Sample_User_Icon.png"/></div>
                                <div class="stardust-dropdown__item-header-account-name">
                                    <span class="stardust-dropdown__item-header-account-name-text">Admin</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!--Right: Change password-->
            <div id="password-change-section" class="container-profile-content-inner__right">
                <div class="container-profile-content-inner__right-main" role="main">
                    <div style="display: contents">
                        <div class="container-profile-content-inner__right-main-inner">
                            <!-- Header của trang thay đổi mật khẩu -->
                            <div class="container-profile-content-inner__right-main-header">
                                <h1 class="container-profile-content-inner__right-main-header__title">Thay Đổi Mật
                                    Khẩu</h1>
                                <div class="container-profile-content-inner__right-main-header__description">
                                    Để bảo vệ tài khoản của bạn, vui lòng thay đổi mật khẩu định kỳ.
                                </div>
                            </div>

                            <!-- Nội dung của trang thay đổi mật khẩu -->
                            <div class="container-profile-content-inner__right-main-content">
                                <div class="container-profile-content-inner__right-main-content-center">
                                    <!-- Form thay đổi mật khẩu -->
                                    <form action="">
                                        <table class="container-profile-content-inner__right-main-content-center__table">
                                            <!-- Mật khẩu hiện tại -->
                                            <tr>
                                                <td class="table__row-label">
                                                    <label>Mật khẩu hiện tại</label>
                                                </td>
                                                <td class="table__row-input">
                                                    <div class="table__row-input__field">
                                                        <input type="password" placeholder="Nhập mật khẩu hiện tại"
                                                               class="table__row-input__field-text">
                                                    </div>
                                                </td>
                                            </tr>

                                            <!-- Mật khẩu mới -->
                                            <tr>
                                                <td class="table__row-label">
                                                    <label>Mật khẩu mới</label>
                                                </td>
                                                <td class="table__row-input">
                                                    <div class="table__row-input__field">
                                                        <input type="password" placeholder="Nhập mật khẩu mới"
                                                               class="table__row-input__field-text">
                                                    </div>
                                                </td>
                                            </tr>

                                            <!-- Xác nhận mật khẩu mới -->
                                            <tr>
                                                <td class="table__row-label">
                                                    <label>Xác nhận mật khẩu mới</label>
                                                </td>
                                                <td class="table__row-input">
                                                    <div class="table__row-input__field">
                                                        <input type="password" placeholder="Nhập lại mật khẩu mới"
                                                               class="table__row-input__field-text">
                                                    </div>
                                                </td>
                                            </tr>

                                            <!-- Nút lưu thay đổi -->
                                            <tr>
                                                <td class="table__row-label">
                                                    <label></label>
                                                </td>
                                                <td class="table__row-input">
                                                    <button type="submit"
                                                            class="btn btn-solid-primary btn--m btn--inline"
                                                            type="button" aria-disabled="false">
                                                        Lưu Thay Đổi
                                                    </button>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>
                                </div>
                            </div>
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
<section class="footer">
    <div class="footer-row">
        <div class="footer-col">
            <a href="" class="mb-4"><img src="img/logo/logo1.png"/></a>
            <p class="detail mb-4">Nơi cung cấp trí thức cho bạn.</p>
            <div class="detail-icons ">
                <p><i class="fa-solid fa-location-dot"></i>VQCR+GP6, khu pho 6, Thu Đuc, Ho Chi Minh</p>
                <p><i class="fa-solid fa-phone"></i>0123456789</p>
                <p><i class="fa-solid fa-envelope"></i>@st.hcmuaf.edu.vn</p>
            </div>
        </div>
        <div class="footer-col">
            <h4>Về chúng tôi</h4>
            <ul class="links">
                <li><a href="#">Nguyễn Thị Ngọc Diễm</a></li>
                <li><a href="#">Võ Nguyễn Thanh Diệu</a></li>
                <li><a href="#">Nguyễn Hữu Thịnh</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h4>Chính sách</h4>
            <ul class="links">
                <li><a href="#">Trang chủ</a></li>
                <li><a href="#">Chính sách bảo mật</a></li>
                <li><a href="#">Sản phẩm</a></li>
                <li><a href="#">Tin tức</a></li>
                <li><a href="#">Liên hệ</a></li>
            </ul>
        </div>
        <div class="footer-col">
            <h4>Gửi Email</h4>
            <p>
                Đăng ký nhận thông tin mới nhất từ chúng tôi.
            </p>
            <form action="#">
                <input type="text" placeholder="Email" required>
                <button type="submit"><i class="fa-solid fa-paper-plane"></i></button>
            </form>
            <div class="icons">
                <i class="fa-brands fa-facebook-f"></i>
                <i class="fa-brands fa-twitter"></i>
                <i class="fa-brands fa-linkedin"></i>
                <i class="fa-brands fa-github"></i>
            </div>
        </div>
    </div>


    <div class="footer-copyright d-flex justify-content-center">
        <p>&copy; 2024 BookStore | Designed by <span>Team TDD</span></p>
    </div>
</section>
<!--footer end-->

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

<%--<script>--%>
<%--    document.getElementById('profile-link').addEventListener('click', function (event) {--%>
<%--        event.preventDefault();--%>

<%--        // Show profile section and hide others--%>
<%--        document.getElementById('profile-section').style.display = 'block';--%>
<%--        document.getElementById('bank-section').style.display = 'none';--%>
<%--        document.getElementById('address-section').style.display = 'none';--%>
<%--        document.getElementById('password-change-section').style.display = 'none';--%>
<%--        document.getElementById('privacy-section').style.display = 'none';--%>

<%--        // Set active class on profile link--%>
<%--        this.classList.add('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('bank-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('address-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('password-change-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('privacy-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--    });--%>

<%--    document.getElementById('bank-link').addEventListener('click', function (event) {--%>
<%--        event.preventDefault();--%>

<%--        // Show bank section and hide others--%>
<%--        document.getElementById('profile-section').style.display = 'none';--%>
<%--        document.getElementById('bank-section').style.display = 'block';--%>
<%--        document.getElementById('address-section').style.display = 'none';--%>
<%--        document.getElementById('password-change-section').style.display = 'none';--%>
<%--        document.getElementById('privacy-section').style.display = 'none';--%>


<%--        // Set active class on bank link--%>
<%--        this.classList.add('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('profile-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('address-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('password-change-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('privacy-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--    });--%>

<%--    document.getElementById('address-link').addEventListener('click', function (event) {--%>
<%--        event.preventDefault();--%>

<%--        // Show address section and hide others--%>
<%--        document.getElementById('profile-section').style.display = 'none';--%>
<%--        document.getElementById('bank-section').style.display = 'none';--%>
<%--        document.getElementById('address-section').style.display = 'block';--%>
<%--        document.getElementById('password-change-section').style.display = 'none';--%>
<%--        document.getElementById('privacy-section').style.display = 'none';--%>


<%--        // Set active class on address link--%>
<%--        this.classList.add('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('profile-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('bank-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('password-change-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('privacy-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--    });--%>

<%--    document.getElementById('password-change-link').addEventListener('click', function (event) {--%>
<%--        event.preventDefault();--%>

<%--        // Show password change section and hide others--%>
<%--        document.getElementById('profile-section').style.display = 'none';--%>
<%--        document.getElementById('password-change-section').style.display = 'block';--%>
<%--        document.getElementById('privacy-section').style.display = 'none';--%>

<%--        // Set active class on password change link--%>
<%--        this.classList.add('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('profile-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('privacy-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--    });--%>


<%--    document.getElementById('privacy-link').addEventListener('click', function (event) {--%>
<%--        event.preventDefault();--%>

<%--        // Show privacy change section and hide others--%>
<%--        document.getElementById('profile-section').style.display = 'none';--%>
<%--        document.getElementById('password-change-section').style.display = 'none';--%>
<%--        document.getElementById('privacy-section').style.display = 'block';--%>

<%--        // Set privacy class on password change link--%>
<%--        this.classList.add('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('profile-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('bank-link').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('password-change-section').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--        document.getElementById('address-section').classList.remove('stardust-dropdown__item-body__content-item-active');--%>
<%--    });--%>
<%--</script>--%>

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
