<%--
  Created by IntelliJ IDEA.
  User: ngocd
  Date: 1/14/2025
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--curtain menu-->
<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
        <a href="admin/dashboard">
            <img src="../img/logo/new_logo.png" height="200px" width="200px"/>
        </a>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <nav class="offcanvas-body">
        <ul class="links">
            <li class="nav-item">
                <a href="admin/dashboard" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-tachometer-alt"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Dashboard</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="User-Management.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-users"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Quản lí tài khoản</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="Order-Management.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-shopping-cart"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Quản lí đơn hàng</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="Category-Management.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-tags"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Quản lí danh mục</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="/admin/product-management" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-archive"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Quản lí sản phẩm</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="Supplier-Management.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="far fa-newspaper"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Quản lí nhà xuất bản</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="Slider-Management.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-store"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Quản lí slider</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="Discount-Management.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-percent"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Quản lí khuyến mãi</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="Admin-Management.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-users-cog"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Admin</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="Settings.html" class="text-dec">
            <span class="icon" style="font-size: 25px">
                    <i class="fa-solid fa-gear"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Cài đặt chung</span>
                </a>
            </li>
        </ul>
    </nav>
</div>
<div class="overlay"></div>
