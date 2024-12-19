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
  <title>Policy</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!--    all css files-->
  <link rel="stylesheet" href="../css/policy.css">
  <link rel="stylesheet" href="../fonts/fontawesome-free-6.6.0-web/css/all.css">
  <link rel="stylesheet" href="../css/boostrap/bootstrap.min.css">
  <link rel="stylesheet" href="../css/footer.css">
  <link rel="stylesheet" href="../css/Header.css">
  <link rel="stylesheet" href="../css/Style.css">
  <script src="../js/bootstrap.bundle.min.js"></script>

</head>
<body>
<!--header-->
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
        <a class="nav-link dropdown-toggle pt-0 pl-15 pr-10" href="category.html" id="productDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
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


<!--Content-->
<div class="container-policy">
  <div class="content-policy">
    <div class="content-policy-form">
      <div class="form">
        <p class="detail">Chính sách RIMBERIO</p>
        <i class="fa-solid fa-chevron-right"></i>
        <div class="empty"></div>
      </div>
    </div>
    <div class="content-policy-form">
      <h2>CHÍNH SÁCH BẢO MẬT</h2>
      <div class="description">
        <h3>1. Giới thiệu</h3>
        <p>1.1. Chào mừng bạn đến với nền tảng Rimberio.vn (bao gồm website và ứng dụng di động Rimberio)
          được vận hành bởi Công ty TNHH Rimberio và các công ty liên kết (gọi riêng và gọi chung là,
          "Rimberio", "chúng tôi", hay "của chúng tôi"). Rimberio nghiêm túc thực hiện trách nhiệm của
          mình liên quan đến bảo mật thông tin theo các quy định về bảo vệ bí mật thông tin cá nhân của
          pháp luật Việt Nam (“Luật riêng tư”) và cam kết tôn trọng quyền riêng tư và sự quan tâm của tất
          cả người dùng đối với website và ứng dụng di động của chúng tôi (“Nền tảng”) (chúng tôi gọi
          chung Các Nền tảng và các dịch vụ chúng tôi cung cấp như được mô tả trong Nền tảng của chúng tôi
          là "các Dịch Vụ"). Người dùng có nghĩa là người đăng ký tài khoản với chúng tôi để sử dụng các
          Dịch Vụ, bao gồm cả người mua và người bán (gọi chung và gọi riêng là “Các Người Dùng”, “bạn”
          hoặc “của bạn”). Chúng tôi nhận biết tầm quan trọng của dữ liệu cá nhân mà bạn đã tin tưởng giao
          cho chúng tôi và tin rằng chúng tôi có trách nhiệm quản lý, bảo vệ và xử lý dữ liệu cá nhân của
          bạn một cách thích hợp. Chính sách bảo mật này ("Chính sách bảo mật" hay "Chính sách") được
          thiết kế để giúp bạn hiểu được cách thức chúng tôi thu thập, sử dụng, tiết lộ và/hoặc xử lý dữ
          liệu cá nhân mà bạn đã cung cấp cho chúng tôi và/hoặc lưu giữ về bạn, cho dù là hiện nay hoặc
          trong tương lai, cũng như để giúp bạn đưa ra quyết định sáng suốt trước khi cung cấp cho chúng
          tôi bất kỳ dữ liệu cá nhân nào của bạn.</p>

        <p>1.2. "Dữ Liệu Cá Nhân" hay "dữ liệu cá nhân" có nghĩa là dữ liệu, dù đúng hay không, về một cá
          nhân mà thông qua đó có thể được xác định được danh tính, hoặc từ dữ liệu đó và thông tin khác
          mà một tổ chức có hoặc có khả năng tiếp cận. Các ví dụ thường gặp về dữ liệu cá nhân có thể gồm
          có tên, số chứng minh nhân dân và thông tin liên hệ</p>

        <p>1.3. Bằng việc sử dụng Các Dịch Vụ, đăng ký một tài khoản với chúng tôi hoặc truy cập Nền tảng,
          bạn xác nhận và đồng ý rằng bạn chấp nhận các phương pháp, yêu cầu, và/hoặc chính sách được mô
          tả trong Chính sách bảo mật này, và theo đây bạn xác nhận bạn đã biết rõ và đồng ý toàn bộ cho
          phép chúng tôi thu thập, sử dụng, tiết lộ và/hoặc xử lý dữ liệu cá nhân của bạn như mô tả trong
          đây. NẾU BẠN KHÔNG ĐỒNG Ý CHO PHÉP XỬ LÝ DỮ LIỆU CÁ NHÂN CỦA BẠN NHƯ MÔ TẢ TRONG CHÍNH SÁCH NÀY,
          VUI LÒNG KHÔNG SỬ DỤNG CÁC DỊCH VỤ CỦA CHÚNG TÔI HAY TRUY CẬP NỀN TẢNG HOẶC TRANG WEB CỦA CHÚNG
          TÔI. Nếu chúng tôi thay đổi Chính sách bảo mật của mình, chúng tôi sẽ thông báo cho bạn bao gồm
          cả thông qua việc đăng tải những thay đổi đó hoặc Chính sách bảo mật sửa đổi trên Nền tảng của
          chúng tôi. Trong phạm vi pháp luật cho phép, việc tiếp tục sử dụng các Dịch Vụ hoặc Nền Tảng,
          bao gồm giao dịch của bạn, được xem là bạn đã công nhận và đồng ý với các thay đổi trong Chính
          Sách Bảo Mật này.</p>

        <p>1.4. Chính sách này áp dụng cùng với các thông báo, điều khoản hợp đồng, điều khoản chấp thuận
          khác áp dụng liên quan đến việc chúng tôi thu thập, lưu trữ, sử dụng, tiết lộ và/hoặc xử lý dữ
          liệu cá nhân của bạn và không nhằm ghi đè những thông báo hoặc các điều khoản đó trừ khi chúng
          tôi có tuyên bố ràng khác.</p>

        <p>1.5. Chính sách này được áp dụng cho cả Người bán và Người mua đang sử dụng Dịch vụ trừ khi có
          tuyên bố rõ ràng ngược lại.</p>

      </div>

      <div class="description">
        <h3>2. KHI NÀO RIMBERIO SẼ THU THẬP DỮ LIỆU CÁ NHÂN?</h3>
        <p>2.1. Chúng tôi sẽ/có thể thu thập dữ liệu cá nhân về bạn:</p>
        <ul class="detail-2-1">
          <li>khi bạn đăng ký và/hoặc sử dụng Các Dịch Vụ hoặc Nền tảng của chúng tôi, hoặc mở một tài
            khoản với chúng tôi;
          </li>
          <li>khi bạn gửi bất kỳ biểu mẫu nào, bao gồm đơn đăng ký hoặc các mẫu đơn khác liên quan đến bất
            kỳ sản phẩm và dịch vụ nào của chúng tôi, bằng hình thức trực tuyến hay dưới hình thức khác;
          </li>
          <li>khi bạn ký kết bất kỳ thỏa thuận nào hoặc cung cấp các tài liệu hoặc thông tin khác liên
            quan đến tương tác giữa bạn với chúng tôi, hoặc khi bạn sử dụng các sản phẩm và dịch vụ của
            chúng tôi
          </li>
          <li>khi bạn tương tác với chúng tôi, chẳng hạn như thông qua các cuộc gọi điện thoại (có thể
            được ghi âm lại), thư từ, fax, gặp gỡ trực tiếp, các nền ứng dụng truyền thông xã hội và
            email;
          </li>
          <li>khi bạn sử dụng các dịch vụ điện tử của chúng tôi, hoặc tương tác với chúng tôi qua Nền tảng
            hoặc Trang Web hoặc Các Dịch Vụ của chúng tôi. Trường hợp này bao gồm thông qua tập tin
            cookie mà chúng tôi có thể triển khai khi bạn tương tác với các Nền tảng hoặc Trang Web của
            chúng tôi
          </li>
          <li>khi bạn cấp quyền trên thiết bị của bạn để chia sẻ thông tin với ứng dụng hoặc Nền tảng của
            chúng tôi
          </li>
          <li>khi bạn liên kết tài khoản Shopee với tài khoản mạng xã hội của bạn hoặc các tài khoản bên
            ngoài khác hoặc sử dụng các tính năng mạng xã hội khác, phù hợp với các chính sách của nhà
            cung cấp
          </li>
          <li>khi bạn thực hiện các giao dịch thông qua Dịch vụ của chúng tôi chẳng hạn như mỗi khi bạn
            đặt mua hàng hoặc chấp nhận đơn đặt hàng của Người mua;
          </li>
          <li>khi bạn cung cấp ý kiến phản hồi hoặc gửi khiếu nại cho chúng tôi;</li>
          <li>khi bạn đăng ký tham gia một cuộc thi</li>
          <li>khi bạn gửi dữ liệu cá nhân của bạn cho chúng tôi vì bất kỳ lý do gì; và/hoặc</li>
          <li>khi bạn thực hiện các hoạt động khác trên Nền tảng của chúng tôi.</li>
        </ul>
        <p>Các trường hợp trên không nhằm mục đích liệt kê đầy đủ các trường hợp và chỉ đưa ra một số trường
          hợp phổ biến về thời điểm dữ liệu cá nhân của bạn có thể bị thu thập</p>
        <p>2.2. Chúng tôi có thể thu thập thông tin của bạn từ bạn, các công ty liên kết, các bên thứ ba và
          từ các nguồn khác, bao gồm nhưng không giới hạn ở đối tác kinh doanh (ví dụ như đơn vị cung ứng
          dịch vụ vận chuyển, thanh toán), cơ quan đánh giá tín dụng, các đơn vị, đối tác cung cấp dịch vụ
          marketing, giới thiệu, các chương trình khách hàng thân thiết, những người dùng khác sử dụng Các
          Dịch Vụ của chúng tôi hoặc các nguồn dữ liệu công khai có sẵn hay các nguồn dữ liệu của nhà
          nước.</p>
        <p>2.3. Trong một số trường hợp, bạn có thể cung cấp dữ liệu cá nhân của các cá nhân khác cho chúng
          tôi (ví dụ như thành viên gia đình, bạn bè hoặc những người trong danh sách liên hệ của bạn).
          Nếu bạn cung cấp cho chúng tôi dữ liệu cá nhân của họ, bạn tuyên bố và đảm bảo rằng bạn đã nhận
          được sự đồng ý của họ để xử lý dữ liệu cá nhân của họ theo Chính sách này.</p>
      </div>
    </div>
  </div>
  <div class="col-md-12">
    <div class="explore">
      <h4>Bạn có muốn tìm thêm thông tin gì không?</h4>
      <div class="phone">
        <a href=""><i class="fa-solid fa-phone"></i></a>
        <p>Liên hệ RIMBERIO</p>
      </div>

    </div>
  </div>
</div>


<!--footer-->
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

<!--all script files-->
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
</body>
</html>
