<%--
  Created by IntelliJ IDEA.
  User: ngocd
  Date: 1/14/2025
  Time: 3:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--header start-->
<header id="header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-5 col-md-5 col-6 d-flex align-items-center">
                <div class="header-left">
                    <div class="menu-toggle-btn ">
                        <button class="btn" type="button" style="background-color: #4B908E; color: white"
                                data-bs-toggle="offcanvas"
                                data-bs-target="#offcanvasExample" aria-controls="offcanvasExample"><i
                                class="fas fa-bars" style="color:white"></i> Menu
                        </button>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-7 col-6 ">
                <div class="header-right">
                    <!-- profile start -->
                    <div class="profile-box">
                        <button class="dropdown-toggle bg-transparent border-0  d-flex align-items-center" type="button"
                                id="profile"
                                data-bs-toggle="dropdown" aria-expanded="false">
                            <div class="profile-info">
                                <div class="info ">
                                    <h5 class="pt-3">${userSession.username}</h5>
                                    <div class="image">
                                        <img src="img/Sample_User_Icon.png" style="width: 40px; height: 40px">
                                        <span class="status"></span>
                                    </div>
                                </div>
                            </div>
                        </button>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="http://localhost:8080/Bookstore/home">Trang bán hàng</a></li>
                            <li><a class="dropdown-item" href="http://localhost:8080/Bookstore/logout">Đăng xuất</a></li>
                        </ul>
                    </div>
                    <!-- profile end -->
                </div>
            </div>
        </div>
    </div>
</header>
<!--header end-->
