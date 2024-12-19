<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 18/12/2024
  Time: 10:17 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Chi tiết sản phẩm</title>

  <!--    font awesome-->
  <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">

  <!--    bootstrap-->
  <script src="../js/bootstrap.bundle.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">


  <!--    CSS-->
  <link rel="stylesheet" href="../css/ProductDetail.css">
  <link rel="stylesheet" href="../css/Header.css">
  <link rel="stylesheet" href="../css/footer.css">
  <link rel="stylesheet" href="../css/Style.css">
  <script src="../js/bootstrap.bundle.min.js"></script>

</head>
<body>
<!--Header-->
<!--<div id="header"></div>-->
<!--Header-->
<header id="header">
  <!-- MAIN HEADER -->
  <!--    <div class="banner d-flex justify-content-center pt-1 pb-1 ">-->
  <!--        <a href="#" class="content">Freeship đơn từ 45k, giảm nhiều hơn cùng FREESHIP XTRA</a>-->
  <!--    </div>-->
  <div class="container">
    <!-- row -->
    <div class="row">
      <!-- LOGO -->
      <div class="col-md-2 d-flex justify-content-center align-items-end">
        <a href="Home.html">
          <div class="header-logo">
            <img src="../img/logo/logo-header.png" height="80" width="100"/></div>
        </a>
      </div>
      <!-- /LOGO -->

      <!-- SEARCH BAR -->
      <div class="col-md-7">
        <div class="header-search">
          <form class="d-flex mt-2">
            <input class="input flex-grow-1" placeholder="Search product">
            <button class="search-btn">Search</button>
          </form>
        </div>
      </div>
      <!-- /SEARCH BAR -->

      <!-- ACCOUNT -->
      <div class="col-md-3 clearfix d-flex">
        <ul class="account-menu mr-1">
          <li class="account box mt-4">
            <a href="profile.html">Tài khoản</a>
            <i class="fa-solid fa-angle-down"></i>
            <ul class="subnav">
              <li class="border-bottom border-gray"><a href="login.html">Đăng nhập</a></li>
              <li><a href="login.html">Đăng kí</a></li>
            </ul>
          </li>
        </ul>
        <div class="shopping-cart mt-4 ">
          <a href="Cart.html" style="color: black">
            <!--                    <i class="fa-solid fa-cart-shopping" style="color: #0e2b1e;"></i>-->
            <svg xmlns="http://www.w3.org/2000/svg" width="27" height="27" fill="currentColor"
                 class="bi bi-bag-check" viewBox="0 0 16 16">
              <path fill-rule="evenodd"
                    d="M10.854 8.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L7.5 10.793l2.646-2.647a.5.5 0 0 1 .708 0"/>
              <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1m3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"/>
            </svg>
          </a>
        </div>
      </div>
    </div>
  </div>
</header>
<!-- /HEADER -->

<!-- NAVIGATION-->
<nav id="navigation">
  <!-- container -->
  <div class="container ">
    <!-- NAV -->
    <ul class="main-nav nav ">
      <li class="nav-item "><a href="Home.html">Trang chủ</a></li>
      <li class="nav-item "><a href="AboutUs.html">Giới thiệu</a></li>
      <li class="nav-item dropdown ">
        <a class="nav-link dropdown-toggle p-0 m-0" href="category.html" id="productDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
          Sản phẩm
        </a>
        <ul class="dropdown-menu" aria-labelledby="productDropdown">
          <li><a class="dropdown-item" href="category.html">Sách văn học</a></li>
          <li><a class="dropdown-item" href="category.html">Kinh tế</a></li>
          <li><a class="dropdown-item" href="category.html">Sách thiếu nhi</a></li>
          <li><a class="dropdown-item" href="category.html">Tiểu sử - Hồi ký</a></li>
          <li><a class="dropdown-item" href="category.html">Tâm lí - Kĩ năng sống</a></li>
          <li><a class="dropdown-item" href="category.html">Nuôi dạy con</a></li>
          <li><a class="dropdown-item" href="category.html">Sách giáo khoa</a></li>
        </ul>
      </li>
      <li class="nav-item "><a href="policy.html">Chính sách</a></li>
      <li class="nav-item "><a href="contact.html">Liên hệ</a></li>
    </ul>
    <!-- /NAV -->
  </div>
</nav>
<!--/nav end-->

<!--Product detail content-->
<div class="container_productDetail mx-4">
  <!--Thanh điều hướng-->
  <div class="breadcrumbNAV ">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb bg-white shadow p-3">
        <li class="breadcrumb item">
          <!-- Liên kết đến trang chủ -->
          <a href="Home.html" class="itemNAV btn btn-link p-0 m-0 " style="border: none; background: none;">Trang chủ</a>
          <span class="fas fa-chevron-right text-muted mx-3" style="font-size: inherit"></span>
        </li>
        <li class="breadcrumb item">
          <!-- Liên kết đến trang danh mục sách -->
          <a href="category.html" class="itemNAV btn btn-link p-0 m-0" style="border: none; background: none;">Sách</a>
          <span class="fas fa-chevron-right text-muted mx-3"></span>
        </li>
        <li class="breadcrumb item active" aria-current="page">
          Mèo Mèo Meo - Bí Mật Giao Tiếp Từ Cái Vẫy Đuôi Đến Tiếng Grừ Grừ
        </li>
      </ol>
    </nav>
  </div>
  <!--    <div class="breadcrumbNAV">-->
  <!--        <nav aria-label="breadcrumb">-->
  <!--            <ol class="breadcrumb bg-white shadow p-3">-->
  <!--                <li class="breadcrumb item">-->
  <!--                    <a href="Home.html">Trang chủ</a>-->
  <!--                    <span class="fas fa-chevron-right text-muted mx-3" style="font-size: inherit"></span>-->
  <!--                </li>-->
  <!--                <li class="breadcrumb item">-->
  <!--                    <a href="category.html">Sách</a>-->
  <!--                    <span class="fas fa-chevron-right text-muted mx-3"></span>-->
  <!--                </li>-->
  <!--                <li class="breadcrumb item active" aria-current="page">Mèo Mèo Meo - Bí Mật Giao Tiếp Từ Cái Vẫy Đuôi-->
  <!--                    Đến-->
  <!--                    Tiếng Grừ Grừ-->
  <!--                </li>-->
  <!--            </ol>-->
  <!--        </nav>-->
  <!--    </div>-->

  <section class="product py-5">
    <div class="row m-0">
      <!--Ảnh sản phẩm-->
      <aside class="col-5">
        <!-- Thumbnail (Ảnh lớn) -->
        <div class="rounded-4 d-flex justify-content-center">
          <img id="mainImage" style="width: 100%; height: 100vh; margin: auto;" class="rounded-4 fit"
               src="../img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_1.webp"/>
        </div>

        <!-- Ảnh chi tiết -->
        <div class="border rounded-4 d-flex justify-content-center m-3 p-2" style="border: 1px solid #ddd;">
          <div class="item-thumb"
               data-image-src="../img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_1.webp">
            <img width="60" height="60" class="rounded-2" style="object-fit: cover;"
                 src="../img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_1.webp"/>
          </div>
          <div class="item-thumb"
               data-image-src="../img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_2.webp">
            <img width="60" height="60" class="rounded-2" style="object-fit: cover;"
                 src="../img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_2.webp"/>
          </div>
          <div class="item-thumb"
               data-image-src="../img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_3.webp">
            <img width="60" height="60" class="rounded-2" style="object-fit: cover;"
                 src="../img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_3.webp"/>
          </div>
          <div class="item-thumb"
               data-image-src="../img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_4.webp">
            <img width="60" height="60" class="rounded-2" style="object-fit: cover;"
                 src="../img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_4.webp"/>
          </div>
          <div class="item-thumb"
               data-image-src="../img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_5.webp">
            <img width="60" height="60" class="rounded-2" style="object-fit: cover;"
                 src="../img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_5.webp"/>
          </div>
          <div class="item-thumb"
               data-image-src="../img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_6.webp">
            <img width="60" height="60" class="rounded-2" style="object-fit: cover;"
                 src="../img/product/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru/MeoMeoMeoBiMatGiaoTiepTuCaiVayDuoiDenTiengGruGru_6.webp"/>
          </div>
        </div>
      </aside>

      <!--Product's information-->
      <main class="col-7">

        <div>
          <!--Title-->
          <h4 class="title text-dark">
            Méo Mèo Meo - Bí Mật Giao Tiếp Từ Cái Vẫy Đuôi Đến Tiếng Grừ Grừ - Tặng Kèm Thẻ Đeo Mica Cá
            Nhân
            Hóa + Bộ Sticker Mèo Dễ Thương
          </h4>
          <div class="d-flex flex-row my-3">

            <!-- Xếp hạng -->
            <div id="average-rating" class="text-warning mb-1 me-2">
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <i class="fa fa-star"></i>
              <span id="average-rating-value" class="ms-1"> 5.0 </span>
            </div>

            <!-- Lượt mua -->
            <span class="text-muted"><i class="fas fa-shopping-basket fa-sm mx-1"></i>Đã bán 145</span>

            <!-- Tình trạng -->
            <span class="text-success ms-2">Còn Hàng</span>
          </div>

          <!-- Giá tiền -->
          <div class="mb-3 text-danger ps-3 d-flex align-items-center">
            <!--giá đã giảm-->
            <div class="h4 d-flex align-items-center justify-content-center text-center">
              <span class="unit-price">99330</span>
              <i class="fa-solid fa-dong-sign fa-xs"></i>
            </div>

            <!--giá gốc-->
            <div class="d-flex align-items-center justify-content-center text-center h4 small text-muted text-decoration-line-through ms-2">
              <span class="original-price">120000</span>
              <i class="fa-solid fa-dong-sign fa-xs"></i>
            </div>

            <!--Số % được giảm-->
            <span class="h5 small bg-danger text-white me-2 px-2 py-1 rounded ms-2">-23%</span>
          </div>

          <p>
            Quyển sách “Kitty Language: An Illustrated Guide to Understanding Your Cat” - quyển sách
            “đọc
            vị” loài mèo đình đám trong hội con sen toàn thế giới nay đã chính thức có phiên bản Việt
            hóa
            với tên: “Mèo méo meo - Bí mật giao tiếp từ cái vẫy đuôi đến tiếng grừ grừ”. Những hình minh
            họa
            đáng yêu từ tác giả Lili
            Chin sẽ giúp bạn thấu hiểu “ngôn ngữ” của boss yêu qua mọi bộ phận cơ thể: mặt, mắt, tai,
            râu và
            đuôi; và cả cách thay đổi tư thế hay hướng và tốc độ di chuyển.
          </p>
          <hr/>

          <!--Số lượng, Mua ngay, Thêm vào giỏ hàng-->
          <div class="row mb-1 text-muted">
            <label class="pt-1 d-block col-2">Số lượng</label>
            <div class="input-group mb-3 col-6" style="width: 170px;">
              <button class="btn btn-white border border-secondary px-3" type="button"
                      id="decrease" data-mdb-ripple-color="dark">
                <i class="fas fa-minus"></i>
              </button>
              <input type="text" id="quantity" class="form-control text-center border border-secondary"
                     placeholder="1" value="1" aria-label="Example text with button addon"
                     aria-describedby="button-addon1"/>
              <button class="btn btn-white border border-secondary px-3" type="button"
                      id="increase" data-mdb-ripple-color="dark">
                <i class="fas fa-plus"></i>
              </button>
            </div>

            <!--Số lượng hàng tồn kho-->
            <label class=" pt-1 d-block col-3">
              <span>12</span>
              sản phẩm có sẵn
            </label>
          </div>

          <!--mua ngay-->
          <a href="Cart.html" id="buy-now" class="btn btn-danger border border-secondary py-2 "
             style="background-color: red">
            Mua ngay </a>

          <!--Thêm vào giỏ hàng-->
          <button id="add-to-cart" class="btn btn-success border border-secondary py-2">
            <i class="me-1 fa fa-shopping-basket"> </i> Thêm vào giỏ hàng
          </button>
          <div id="cart-notification" style="display: none; z-index: 1050; opacity: 0.9;"
               class="alert alert-success text-center position-fixed start-50 top-50 translate-middle">
            Sản phẩm đã được thêm vào giỏ hàng!
          </div>

          <!--Yêu thích-->
          <button id="favourite" class="btn btn-light border border-secondary py-2 px-3">
            <i class="fa-regular fa-heart fa-beat-fade"></i>
          </button>
        </div>
      </main>

    </div>
  </section>

  <!--Thông tin chi tiết-->
  <section class="product-detail bg-light border-top">
    <div class="row m-0 my-4">
      <div class="col-8">
        <div class="border rounded-2 px-3 py-2 bg-white">
          <!-- Pills navs -->
          <ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
            <li class="nav-item d-flex" role="presentation">
              <a class="nav-link d-flex align-items-center justify-content-start w-100"
                 id="ex1-tab-1" data-mdb-toggle="pill" href="#ex1-pills-1" role="tab"
                 aria-controls="ex1-pills-1" aria-selected="true"
                 style="font-weight: 500; font-size: 1.2rem; padding: 0; color: black">
                CHI TIẾT SẢN PHẨM
              </a>
            </li>

          </ul>
          <!-- Pills navs -->

          <!-- Pills content -->
          <div class="tab-content" id="ex1-content">
            <div class="tab-pane fade show active" id="ex1-pills-1" role="tabpanel"
                 aria-labelledby="ex1-tab-1">
              <table class="table border mt-3 mb-2">
                <tr>
                  <th class="py-2">Nhà cung cấp:</th>
                  <td class="py-2">Sài Gòn Books</td>
                </tr>
                <tr>
                  <th class="py-2">Tác giả:</th>
                  <td class="py-2">LiLi Chin</td>
                </tr>
                <tr>
                  <th class="py-2">NXB:</th>
                  <td class="py-2">NXB Thế Giới</td>
                </tr>
                <tr>
                  <th class="py-2">Năm XB:</th>
                  <td class="py-2">2024</td>
                </tr>
                <tr>
                  <th class="py-2">Kích thước:</th>
                  <td class="py-2">14cm x 17.8cm</td>
                </tr>
                <tr>
                  <th class="py-2">Trong lượng (gr):</th>
                  <td class="py-2">180</td>
                </tr>
                <tr>
                  <th class="py-2">Số trang:</th>
                  <td class="py-2">160 trang</td>
                </tr>
                <tr>
                  <th class="py-2">Hình thức:</th>
                  <td class="py-2">Bìa mềm</td>
                </tr>
              </table>

            </div>
          </div>
          <!-- Pills content -->
          <a class="nav-link d-flex align-items-center justify-content-start w-100"
             id="ex1-tab-2" data-mdb-toggle="pill" href="#ex1-pills-1" role="tab"
             aria-controls="ex1-pills-1" aria-selected="true"
             style="font-weight: 500; font-size: 1.2rem; padding: 0; color: black">
            MÔ TẢ SẢN PHẨM
          </a>
          <div id="content" class="content-limited mt-2">
            <p>
              Quyển sách “Kitty Language: An Illustrated Guide to Understanding Your Cat” - quyển sách
              “đọc vị” loài mèo đình đám trong hội con sen toàn thế giới nay đã chính thức có phiên
              bản
              Việt hóa với tên: “Mèo méo meo - Bí mật giao tiếp từ cái vẫy đuôi đến tiếng grừ grừ”.
              Quyển
              sách nhận được 4.6 sao trên sàn Amazon và trở thành quyển cẩm nang đặc biệt giúp “sen”
              kết
              nối với “quàng thượng” theo một cách vừa khoa học, vừa gần gũi. Những hình minh họa đáng
              yêu
              từ tác giả Lili Chin sẽ giúp bạn thấu hiểu “ngôn ngữ” của boss yêu qua mọi bộ phận cơ
              thể:
              mặt, mắt, tai, râu và đuôi; và cả cách thay đổi tư thế hay hướng và tốc độ di chuyển.
            </p>
            <p>
              Quyển sách được chắp bút và minh họa bởi Lili Chin - nghệ sĩ minh họa nổi tiếng và là
              “con
              sen” chính hiệu. Cô đã hợp tác với nhiều tổ chức uy tín như Fear Free Pets, RSPCA, Hiệp
              hội
              tư vấn hành vi động vật quốc tế và International Cat Care. Cô cũng là tác giả của quyển
              sách
              “Doggie Language” đình đám.
            </p>
            <p>
              Ở các cộng đồng người yêu động vật trên mạng xã hội, nhiều “con sen” thường xuyên đem
              hội
              “meo meo” và hội “gâu gâu” lên bàn cân so sánh về độ thân thiện. Và kết quả chẳng mấy
              bất
              ngờ khi những chú mèo luôn đăng quang ở ngôi vị “hoa hậu khó gần”.
            </p>
            <p>
              Quyển sách Mèo méo meo và tác giả Lily Chin sẽ lấy lại sự công bằng cho loài mèo khi
              giúp ta
              hiểu “tất tần tật” cách những chú mèo biểu đạt cảm xúc qua ngôn ngữ cơ thể và thấu hiểu
              sở
              thích, thói quen của mèo cưng. Bạn sẽ vô cùng bất ngờ khi biết rằng từ trước đến nay ta
              luôn
              hiểu lầm về những cử chỉ của “boss” và nhận ra rằng: loài mèo cũng giàu cảm xúc và vô
              cùng
              tình cảm chẳng thua gì những chú cún cưng.
            </p>
            <p>
              Với những tài liệu khoa học đầy thú vị cùng kinh nghiệm thực tiễn khi gắn bó với hai chú
              mèo
              cưng Mambo & Shimmy, tác giả Lili Chin khẳng định rằng: Mèo là loài sinh vật cực kỳ linh
              hoạt về mặt xã hội, gắn bó với chủ nhân (giống y như cách mèo con gắn kết với mèo mẹ) và
              có
              những cách riêng để bày tỏ sự cảm mến, tin cậy, hoặc nhu cầu cần “khoảng riêng tư một
              mình.”
            </p>
            <p>
              Chúng ta thể hiện những xúc cảm: buồn, vui, tức giận, hân hoan,... qua cử chỉ, thay đổi
              trên
              gương mặt và cả trong những hành động vô thức nữa. Vậy còn loài mèo thì sao? Loài mèo ra
              dấu
              hiệu về tâm trạng và cảm xúc bằng mọi bộ phận cơ thể: mặt, mắt, tai, râu và đuôi; bằng
              cách
              thay đổi tư thế hay hướng và tốc độ di chuyển. Tuy nhiên, chúng ta còn cần kết hợp quan
              sát
              nhiều bộ phận cơ thể và tư thế để thực sự hiểu được mèo đang nói gì.
            </p>
            <p>
              Mèo méo meo gồm 10 phần, tương ứng với cách mèo cách mèo bày tỏ cảm xúc qua từng bộ phận
              và
              thậm chí cả những khoảnh khắc chúng muốn “cách ly xã hội”: Mùi hương, Tai, Mắt, Râu mép,
              Đuôi, Tư thế, Âm thanh, Cử chỉ thân thiện, Trạng thái căng thẳng, Chơi đùa. Quyển sách
              đáng
              yêu này không chỉ giúp bạn nhận ra những “dấu hiệu” thể hiện sự tin tưởng, yêu thương
              của
              mèo mà còn cung cấp kiến thức về cách chúng trò chuyện với chúng ta, bày tỏ nhu cầu hay
              đòi
              hỏi không gian riêng tư. Đặc biệt, với những hình minh họa dễ thương và nội dung khoa
              học
              được đơn giản hóa, bạn sẽ có cảm giác như đang bước vào một cuộc đối thoại thật sự với
              người
              bạn nhỏ của mình.
            </p>
          </div>
          <!--nút xem thêm-->
          <button id="toggleContent">Xem thêm</button>
        </div>
      </div>
      <!--Các sản phẩm khác-->
      <div class="col-4">
        <div class="px-0 border rounded-2 shadow-0">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title mb-3">Sản phẩm liên quan</h5>
              <div class="d-flex mb-3">
                <a href="ProductDetail.html" class="me-3">
                  <img src="../img/product/BiAnVungNuocSauLanRanhThienTaiVaKeDien_1.webp"
                       style="min-width: 96px; height: 96px;" class="img-md img-thumbnail"/>
                </a>
                <div class="info">
                  <a href="ProductDetail.html" class="nav-link mb-1">
                    Bí Ẩn Vùng Nước Sâu - Lằn Ranh Thiên Tài Và Kẻ Điên
                  </a>
                  <div class="mb-3 text-danger d-flex align-items-center">
                    <!--giá đã giảm-->
                    <div class="d-flex align-items-center justify-content-center text-center">
                      <strong class="unit-price fw-semibold">147600</strong>
                      <i class="fa-solid fa-dong-sign fa-xs"></i>
                    </div>

                    <!--giá gốc-->
                    <div class="d-flex align-items-center justify-content-center text-center small text-muted text-decoration-line-through ms-2">
                      <span class="original-price">180000</span>
                      <i class="fa-solid fa-dong-sign fa-xs"></i>
                    </div>

                    <!--Số % được giảm-->
                    <span class="small bg-danger text-white me-2 px-2 py-1 rounded ms-2">-18%</span>
                  </div>
                </div>
              </div>

              <div class="d-flex mb-3">
                <a href="ProductDetail.html" class="me-3">
                  <img src="../img/product/GieoDiuDangAtHaiDuocNiemVui_1.webp"
                       style="min-width: 96px; height: 96px;" class="img-md img-thumbnail"/>
                </a>
                <div class="info">
                  <a href="ProductDetail.html" class="nav-link mb-1">
                    Gieo Dịu Dàng Ắt Hái Được Niềm Vui - 200 Trích Dẫn Song Ngữ Trung-Việt
                  </a>
                  <div class="mb-3 text-danger d-flex align-items-center">
                    <!--giá đã giảm-->
                    <div class="d-flex align-items-center justify-content-center text-center">
                      <strong class="unit-price fw-semibold">105780</strong>
                      <i class="fa-solid fa-dong-sign fa-xs"></i>
                    </div>

                    <!--giá gốc-->
                    <div class="d-flex align-items-center justify-content-center text-center small text-muted text-decoration-line-through ms-2">
                      <span class="original-price">129000</span>
                      <i class="fa-solid fa-dong-sign fa-xs"></i>
                    </div>

                    <!--Số % được giảm-->
                    <span class="small bg-danger text-white me-2 px-2 py-1 rounded ms-2">-18%</span>
                  </div>
                </div>
              </div>

              <div class="d-flex mb-3">
                <a href="ProductDetail.html" class="me-3">
                  <img src="../img/product/NhacNhoAnCan_1.webp"
                       style="min-width: 96px; height: 96px;" class="img-md img-thumbnail"/>
                </a>
                <div class="info">
                  <a href="ProductDetail.html" class="nav-link mb-1"> Nhắc Nhở Ân Cần – Nâng Niu Từng
                    Khoảnh Khắc Trong
                    Cuộc Sống </a>
                  <div class="mb-3 text-danger d-flex align-items-center">
                    <!--giá đã giảm-->
                    <div class="d-flex align-items-center justify-content-center text-center">
                      <strong class="unit-price fw-semibold">76230</strong>
                      <i class="fa-solid fa-dong-sign fa-xs"></i>
                    </div>

                    <!--giá gốc-->
                    <div class="d-flex align-items-center justify-content-center text-center small text-muted text-decoration-line-through ms-2">
                      <span class="original-price">99000</span>
                      <i class="fa-solid fa-dong-sign fa-xs"></i>
                    </div>

                    <!--Số % được giảm-->
                    <span class="small bg-danger text-white me-2 px-2 py-1 rounded ms-2">-23%</span>
                  </div>
                </div>
              </div>

              <div class="d-flex">
                <a href="ProductDetail.html" class="me-3">
                  <img src="../img/product/NoiLuonChoNoVuong_1.jpg"
                       style="min-width: 96px; height: 96px;" class="img-md img-thumbnail"/>
                </a>
                <div class="info">
                  <a href="ProductDetail.html" class="nav-link mb-1"> Nói Luôn Cho Nó Vuông (Tái Bản
                    2023) </a>
                  <div class="mb-3 text-danger d-flex align-items-center">
                    <!--giá đã giảm-->
                    <div class="d-flex align-items-center justify-content-center text-center">
                      <strong class="unit-price fw-semibold">88560</strong>
                      <i class="fa-solid fa-dong-sign fa-xs"></i>
                    </div>

                    <!--giá gốc-->
                    <div class="d-flex align-items-center justify-content-center text-center small text-muted text-decoration-line-through ms-2">
                      <span class="original-price">108000</span>
                      <i class="fa-solid fa-dong-sign fa-xs"></i>
                    </div>

                    <!--Số % được giảm-->
                    <span class="small bg-danger text-white me-2 px-2 py-1 rounded ms-2">-18%</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!--Đánh giá sản phẩm-->
  <section class="bg-light border-top py-4">
    <div class="container-fluid">
      <div class="row gx-4">
        <div class="border rounded-2 px-3 py-2 bg-white">
          <div class="comment_content">
            <a class="nav-link d-flex align-items-center justify-content-start w-100 mt-2"
               id="ex1-tab-3" data-mdb-toggle="pill" href="#ex1-pills-1" role="tab"
               aria-controls="ex1-pills-1" aria-selected="true"
               style="font-weight: 500; font-size: 1.2rem; padding: 0; color: black">
              ĐÁNH GIÁ SẢN PHẨM
            </a>
            <ul class="comment-list">
              <li class="my-4 row">
                <!--Khách hàng-->
                <div class="comment-header col-2 d-flex align-items-start">

                  <img src="../img/avatar.jpg" alt="avatar" class="rounded-circle me-3"
                       style="width: 50px; height: 50px;">
                  <div>
                    <div class="comment-name" style="font-weight: bold">Như</div>
                    <div class="comment-date">09/09/2024</div>
                  </div>
                </div>
                <!--                                rating-->
                <div class="comment-content col-10">
                  <div class="rating-box mt-2">
                    <div class="text-warning mb-1 me-2">
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                      <i class="fa fa-star"></i>
                    </div>
                  </div>
                  <!--                                    Đánh giá-->
                  <div class="mt-2">
                    Sách đẹp, giấy dày, có in màu. Vì sách ghi "làm sao chúng ta đối phó với
                    những
                    kẻ
                    thích vượt qua giới hạn" nên mình lầm rằng đây là sách dạy cách đối phó
                    thật.
                    Sách
                    ghi chép những chuyện tác giả đã trải qua, nên cũng ghi lại cách tác giả ứng
                    phó
                    với
                    nó. Cách đối phó của tác giả là tránh xa tiêu cực, hoặc tìm niềm vui với
                    những
                    điều
                    tích cực hơn, và 1 chút về xã giao trong các mối quan hệ. Nó ổn với mình. Vì
                    mình hi
                    vọng sẽ đọc vị được những người hay vượt giới hạn để mình giải quyết vấn đề
                    mà
                    họ
                    đưa cho mình. Mình thích những quyển giải quyết vấn đề triệt để hơn, nên
                    quyển
                    này
                    khá cơ bản.
                  </div>
                </div>

              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

<!--Footer-->
<!--<div id="footer"></div>-->
<section class="footer">
  <div class="footer-row">
    <div class="footer-col">
      <a href="" class="mb-4"><img src="../img/logo/new_logo.png"/></a>
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
<!-- /FOOTER -->

<!--SCRIPT-->
<!--<script>-->
<!--    fetch('Header.html')-->
<!--        .then(response => {-->
<!--            if (!response.ok) throw new Error('Network response was not ok');-->
<!--            return response.text();-->
<!--        })-->
<!--        .then(data => document.getElementById('header').innerHTML = data)-->
<!--        .catch(error => console.error('Error:', error));-->

<!--    // Tải nội dung của footer từ tệp Footer.html-->
<!--    fetch('footer.html')-->
<!--        .then(response => response.text())-->
<!--        .then(data => {-->
<!--            document.getElementById('footer').innerHTML = data;-->
<!--        });-->
<!--</script>-->

<!--Script chọn ảnh thumbnail-->
<script>
  document.addEventListener("DOMContentLoaded", function () {
    // Kiểm tra xem các phần tử item-thumb có tồn tại không
    const itemThumbs = document.querySelectorAll('.item-thumb');

    // Lắng nghe sự kiện click trên mỗi ảnh chi tiết
    itemThumbs.forEach(item => {
      item.addEventListener('click', function (e) {
        e.preventDefault();  // Ngừng hành động mặc định của thẻ <a>

        // Lấy đường dẫn ảnh mới từ thuộc tính data-image-src
        const newImageSrc = this.getAttribute('data-image-src');

        // Kiểm tra xem thuộc tính data-image-src có tồn tại không
        if (newImageSrc) {
          // Thay đổi ảnh chính trong phần thumbnail
          const mainImage = document.getElementById('mainImage');

          // Kiểm tra nếu phần tử mainImage tồn tại
          if (mainImage) {
            mainImage.src = newImageSrc;
          } else {
            console.error("Không tìm thấy phần tử ảnh chính (id: mainImage).");
          }
        } else {
          console.error("Không tìm thấy thuộc tính 'data-image-src' trên ảnh chi tiết.");
        }
      });
    });
  });
</script>

<!--Script xếp hạng-->
<script>
  document.addEventListener("DOMContentLoaded", function() {
    // Lấy danh sách các phần tử nhận xét
    const comments = document.querySelectorAll(".comment-list .rating-box .text-warning");

    // Nếu không có nhận xét, giữ nguyên giá trị mặc định
    if (comments.length === 0) return;

    let totalRating = 0;

    // Tính tổng điểm xếp hạng
    comments.forEach(comment => {
      const stars = comment.querySelectorAll(".fa-star");
      totalRating += stars.length; // Mỗi ngôi sao trong `.text-warning` là một điểm
    });

    // Tính trung bình
    const averageRating = totalRating / comments.length;

    // Cập nhật số sao và giá trị trung bình hiển thị
    const averageRatingElement = document.getElementById("average-rating");
    const averageRatingValueElement = document.getElementById("average-rating-value");

    // Làm tròn đến 1 chữ số thập phân
    averageRatingValueElement.textContent = averageRating.toFixed(1);

    // Cập nhật số sao hiển thị
    averageRatingElement.innerHTML = '';
    for (let i = 0; i < 5; i++) {
      const star = document.createElement("i");
      star.classList.add("fa", i < Math.round(averageRating) ? "fa-star" : "fa-star-o", "text-warning");
      averageRatingElement.appendChild(star);
    }

    // Thêm lại phần điểm trung bình
    averageRatingElement.appendChild(averageRatingValueElement);
  });
</script>

<!--format tiền tệ-->
<script src="../js/FormatMoney.js"></script>
<script>
  document.querySelectorAll('.unit-price, .original-price').forEach(element => {
    const amount = parseInt(element.textContent.replace(/\./g, '')); // Bỏ dấu chấm cũ
    if (!isNaN(amount)) {
      element.textContent = formatCurrencyVN(amount);
    }
  });
</script>

<!--Script tăng giảm số lượng-->
<script>
  const decreaseButton = document.getElementById("decrease");
  const increaseButton = document.getElementById("increase");
  const quantityInput = document.getElementById("quantity");
  const stockQuantity = 12;

  decreaseButton.addEventListener("click", function () {
    let currentValue = parseInt(quantityInput.value);
    if (currentValue > 1) {
      quantityInput.value = currentValue - 1;
    }
  });

  increaseButton.addEventListener("click", function () {
    let currentValue = parseInt(quantityInput.value);
    if (currentValue < stockQuantity)
      quantityInput.value = currentValue + 1;
  });

  // Giới hạn số lượng nhập trực tiếp
  quantityInput.addEventListener('input', () => {
    let currentQuantity = parseInt(quantityInput.value);

    // Kiểm tra giá trị nhập vào
    if (isNaN(currentQuantity) || currentQuantity < 1) {
      quantityInput.value = 1; // Nếu giá trị nhỏ hơn 1, đặt về 1
    } else if (currentQuantity > stockQuantity) {
      quantityInput.value = stockQuantity; // Nếu vượt quá hàng tồn kho, đặt về số hàng tồn
    }
  });
</script>

<!--Script thêm vào giỏ hàng-->
<script>
  const addToCartButton = document.getElementById('add-to-cart');
  // const cartCountElement = document.getElementById('cart-count'); //số lượng sản phẩm trong giỏ hàng
  const cartNotification = document.getElementById('cart-notification');

  // Xử lý sự kiện khi nhấn nút "Thêm vào giỏ hàng"
  addToCartButton.addEventListener('click', () => {
    // Tăng số lượng giỏ hàng
    // let cartCount = parseInt(cartCountElement.textContent);
    // cartCountElement.textContent = cartCount + 1;

    // Hiển thị thông báo thêm vào giỏ hàng
    cartNotification.style.display = 'block';

    // Ẩn thông báo sau 2 giây
    setTimeout(() => {
      cartNotification.style.display = 'none';
    }, 2000);
  });
</script>

<!--Script yêu thích-->
<script>
  const favouriteButton = document.getElementById('favourite');

  // Xử lý sự kiện khi nhấn nút
  favouriteButton.addEventListener('click', () => {
    const icon = favouriteButton.querySelector('i');

    // Kiểm tra xem nút đã được yêu thích chưa
    if (icon.classList.contains('fa-regular')) {
      // Chuyển sang trạng thái đã yêu thích
      icon.classList.remove('fa-regular', 'fa-heart');
      icon.classList.add('fa-solid', 'fa-heart');

      // Thay đổi màu sắc và nền của nút
      favouriteButton.style.backgroundColor = '#B8D7D5'; // Màu xanh nhạt
      icon.style.color = 'red'; // Màu đỏ cho trái tim
    } else {
      // Chuyển lại về trạng thái chưa yêu thích
      icon.classList.remove('fa-solid', 'fa-heart');
      icon.classList.add('fa-regular', 'fa-heart');

      // Trở lại màu nền và màu biểu tượng ban đầu
      favouriteButton.style.backgroundColor = ''; // Trở về màu nền ban đầu
      icon.style.color = ''; // Trở về màu ban đầu
    }
  });
</script>

<!--Script xem thêm-->
<script>
  document.getElementById('toggleContent').addEventListener('click', function () {
    const content = document.getElementById('content');
    const isLimited = content.classList.toggle('content-limited');

    if (isLimited) {
      this.textContent = 'Xem thêm';
    } else {
      this.textContent = 'Thu gọn';
    }
  });
</script>

</body>
</html>
