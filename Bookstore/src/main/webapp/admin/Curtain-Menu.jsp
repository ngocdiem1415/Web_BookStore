<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ngocd
  Date: 1/14/2025
  Time: 3:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<String> userResources = (List<String>) session.getAttribute("userResources");
%>

<!--curtain menu-->
<div class="offcanvas offcanvas-start" tabindex="-1" id="offcanvasExample" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
        <a href="dashboard">
            <img src="../img/logo/new_logo.png" height="200px" width="200px"/>
        </a>
        <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <nav class="offcanvas-body">
        <ul class="links">
            <li class="nav-item">
                <a href="dashboard" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-tachometer-alt"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Dashboard</span>
                </a>
            </li>
            <% if (userResources != null && userResources.contains("USER_MGMT")) { %>
            <li class="nav-item">
                <a href="user-management" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-users"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Quản lí tài khoản</span>
                </a>
            </li>
            <% } %>
            <% if (userResources != null && userResources.contains("PUBLISHER_MGMT")) { %>
            <li class="nav-item">
                <a href="publisher" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-users"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Quản lí nhà sản xuất</span>
                </a>
            </li>
            <% } %>
            <% if (userResources.contains("ORDER_MGMT")) { %>
            <li class="nav-item">
                <a href="order-management" class="text-dec">
            <span class="icon" style="font-size: 25px">
                <i class="fas fa-shopping-cart"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Quản lí đơn hàng</span>
                </a>
            </li>
            <% } %>
            <% if (userResources.contains("CATEGORY_MGMT")) { %>
            <li class="nav-item">
                <a href="category" class="text-dec">
            <span class="icon" style="font-size: 25px">
                <i class="fas fa-tags"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Quản lí danh mục</span>
                </a>
            </li>
            <% } %>
            <% if (userResources.contains("PRODUCT_MGMT")) { %>
            <li class="nav-item">
                <a href="product-management" class="text-dec">
            <span class="icon" style="font-size: 25px">
                <i class="fas fa-archive"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Quản lí sản phẩm</span>
                </a>
            </li>
            <% } %>
            <% if (userResources.contains("PROMOTION_MGMT")) { %>
            <li class="nav-item">
                <a href="promotion" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-percent"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Quản lí khuyến mãi</span>
                </a>
            </li>
            <% } %>
            <% if (userResources != null && userResources.contains("STOCK_MGMT")) { %>
            <li class="nav-item">
                <a href="stock-management" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-clipboard-list"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Quản lí kho</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="log-management" class="text-dec">
            <span class="icon" style="font-size: 25px">
                <i class="fa-solid fa-note-sticky"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Quản lí log</span>
                </a>
            </li>
            <% } %>
            <% if (userResources != null && userResources.contains("USER_MGMT")) { %>
            <li class="nav-item">
                <a href="admin-management" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-users-cog"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Admin</span>
                </a>
            </li>
            <% } %>
            <% if (userResources != null && userResources.contains("ROLE_MGMT")) { %>
            <li class="nav-item">
                <a href="role-management" class="text-dec">
            <span class="icon" style="font-size: 25px">
              <i class="fas fa-users-cog"></i>
            </span>
                    <span class="text" style="color: black; font-weight: bold">Role</span>
                </a>
            </li>
            <% } %>

        </ul>
    </nav>
</div>
<div class="overlay"></div>
