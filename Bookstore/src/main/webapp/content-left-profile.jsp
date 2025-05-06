<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 25/12/2024
  Time: 12:42 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>content left</title>
    <link rel="stylesheet" href="fonts/fontawesome-free-6.6.0-web/css/all.css">
    <link rel="stylesheet" href="css/profile.css">
    <link rel="stylesheet" href="css/boostrap/bootstrap.min.css">
    <link rel="stylesheet" href="css/Header.css">
    <link rel="stylesheet" href="css/footer.css">
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="css/Like.css">
    <script src="js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="container-profile-content-inner__left">

    <div class="profile-info">
        <a href="" class="profile-info-logo">
            <div class="profile-info-avatar-img" style="border: none">
                <div class="profile-info-avatar_img__placeholder">
                    <img class="icon-user w-100 h-100" style="opacity: 1 "
                         src="${userSession.avatar != null ? userSession.avatar : 'https://res.cloudinary.com/dh90ponfw/image/upload/v1736864014/defaultavatar.jpg'}"/>
                </div>
            </div>
        </a>
        <div class="profile-info-username">
            <div class="profile-info-username__text">
                            <span class="profile-info-username__text-name">
                                ${userSession.getUsername()}
                            </span>
            </div>
            <div>
                <a href="profile" class="profile-info-username__edit">
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
                    <a href="#" id="profile-link"
                       class="stardust-dropdown__item-body__content-item stardust-dropdown__item-body__content-item-active"><span
                            class="stardust-dropdown__item-body__content-item--text">Hồ sơ</span></a>
                    <a href="change-password" id="password-change-link"
                       class="stardust-dropdown__item-body__content-item "><span
                            class="stardust-dropdown__item-body__content-item--text">Đổi Lại Mật Khẩu</span></a>
                    <a href="" id="privacy-link" class="stardust-dropdown__item-body__content-item"><span
                            class="stardust-dropdown__item-body__content-item--text">Những Thiết Lập Riêng Tư</span></a>
                </div>
            </div>
        </div>
        <div class="stardust-dropdown">
            <div class="stardust-dropdown__item-header">
                <a href="<c:url value="/invoice"/>" class="stardust-dropdown__item-header-menu">
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
                <a href="logout" class="stardust-dropdown__item-header-menu">
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
        <c:if test="${userSession.getRole() == 'admin'}">
            <div class="stardust-dropdown">
                <div class="stardust-dropdown__item-header">
                    <a href="admin/dashboard" class="stardust-dropdown__item-header-menu">
                        <div class="stardust-dropdown__item-header-account-img">
                            <i class="fa-solid fa-users"></i>
                        </div>
                        <div class="stardust-dropdown__item-header-account-name">
                            <span class="stardust-dropdown__item-header-account-name-text">Admin</span>
                        </div>
                    </a>
                </div>
            </div>
        </c:if>
    </div>
</div>
</body>
</html>
