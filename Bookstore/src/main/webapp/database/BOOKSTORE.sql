/*
 Navicat Premium Dump SQL

 Source Server         : localhost
 Source Server Type    : MariaDB
 Source Server Version : 100432 (10.4.32-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : bookstore

 Target Server Type    : MariaDB
 Target Server Version : 100432 (10.4.32-MariaDB)
 File Encoding         : 65001

 Date: 04/06/2025
*/
-- drop database bookstore

USE BOOKSTORE;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- BẢNG NGƯỜI DÙNG
CREATE TABLE `users` (
  `uid` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg',
  `gender` ENUM('male','female','other') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` DATE DEFAULT NULL,
  `phone` VARCHAR(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` VARCHAR(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` TINYINT(4) DEFAULT 1 COMMENT '1: Active, 0: Inactive',
  `create_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `update_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `verification_code` VARCHAR(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  
  PRIMARY KEY (`uid`),
  UNIQUE KEY `unq_email` (`email`),
  UNIQUE KEY `unq_username` (`username`),
  UNIQUE KEY `unq_phone` (`phone`),
  KEY `idx_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- BẢNG NHÀ XUẤT BẢN
CREATE TABLE `publishers`  (
  `p_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `p_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `p_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `p_phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`p_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- BẢNG CHƯƠNG TRÌNH KHUYẾN MÃI
CREATE TABLE `promotions`  (
  `promotion_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `promotion_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `discount` decimal(3, 2) NULL DEFAULT 0.00,
  `start_date` datetime NULL DEFAULT NULL,
  `end_date` datetime NULL DEFAULT NULL,
  `is_active` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`promotion_id`) USING BTREE,
  UNIQUE INDEX `promotion_name`(`promotion_name`) USING BTREE,
  CONSTRAINT `chk_dates` CHECK (`start_date` <= `end_date`)
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;


-- DANH MỤC
CREATE TABLE `categories`  (
  `category_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `update_at` datetime NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- đảm bảo tính nhất quán và tự động cập nhật thông tin tồn kho và số lượng bán
-- TẠO 1 TRIGGER
-- BẢNG SÁCH
CREATE TABLE `books`  (
  `b_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `category_id` int(10) UNSIGNED NOT NULL,
  `p_id` int(10) UNSIGNED NOT NULL,
  `publish_year` year NULL DEFAULT NULL,
  `dimensions` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `weight` decimal(5, 2) NULL DEFAULT NULL,
  `page_count` int(10) UNSIGNED NULL DEFAULT NULL,
  `format` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `original_price` decimal(10, 0) NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `promotion_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `sold_quantity` int(10) UNSIGNED NULL DEFAULT 0,
  `stock_quantity` int(10) UNSIGNED NOT NULL,
  `create_at` datetime NULL DEFAULT current_timestamp(),
  `update_at` datetime NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`b_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  INDEX `promotion_id`(`promotion_id`) USING BTREE,
  INDEX `p_id`(`p_id`) USING BTREE,
  CONSTRAINT `books_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `books_ibfk_2` FOREIGN KEY (`promotion_id`) REFERENCES `promotions` (`promotion_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `books_ibfk_3` FOREIGN KEY (`p_id`) REFERENCES `publishers` (`p_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;


-- Bảng hình ảnh
CREATE TABLE `images`  (
  `img_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `b_id` int(10) UNSIGNED NOT NULL,
  `source_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_thumbnail` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`img_id`) USING BTREE,
  INDEX `b_id`(`b_id`) USING BTREE,
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `books` (`b_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- bảng hóa đơn 
CREATE TABLE `invoices`  (
  `invoice_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL,
  `recipient_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `recipient_phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `order_date` datetime NOT NULL,
  `status` enum('Pending','Shipping','Completed','Cancelled') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shipping_fee` decimal(10, 0) NOT NULL,
  `completion_date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`invoice_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- bảng chi tiết hóa đơn
CREATE TABLE `invoice_details`  (
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `b_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `unit_price` decimal(10, 0) NOT NULL,
  PRIMARY KEY (`invoice_id`, `b_id`) USING BTREE,
  INDEX `b_id`(`b_id`) USING BTREE,
  CONSTRAINT `invoice_details_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `invoice_details_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `books` (`b_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;


-- bảng thanh toán
CREATE TABLE `payments`  (
  `payment_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `amount` decimal(10, 0) NOT NULL,
  `payment_date` datetime NOT NULL,
  `payment_method` tinyint(4) NOT NULL,
  `payment_status` enum('Pending','Completed','Failed','Refunded') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`payment_id`) USING BTREE,
  UNIQUE INDEX `invoice_id`(`invoice_id`) USING BTREE,
  CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- bảng đánh giá (Chỉ người mua sách trong các hóa đơn hợp lệ mới được phép đánh giá.)
CREATE TABLE `reviews`  (
  `review_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `invoice_id` int(10) UNSIGNED NOT NULL,
  `b_id` int(10) UNSIGNED NOT NULL,
  `uid` int(10) UNSIGNED NOT NULL,
  `review_date` datetime NOT NULL,
  `rating` tinyint(3) UNSIGNED NOT NULL CHECK (`rating` between 1 and 5),
  `comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`review_id`) USING BTREE,
  UNIQUE INDEX `invoice_id`(`invoice_id`, `b_id`) USING BTREE,
  INDEX `b_id`(`b_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  FOREIGN KEY (`invoice_id`, `b_id`) REFERENCES `invoice_details` (`invoice_id`, `b_id`),
  CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `books` (`b_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `reviews_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- bảng yêu thích ( mỗi người dùng có một danh dách yêu thích)
CREATE TABLE `wish_lists`  (
  `wid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL,
  `create_at` datetime NULL DEFAULT current_timestamp(),
  `update_at` datetime NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`wid`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`) USING BTREE,
  CONSTRAINT `wish_lists_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci 
ROW_FORMAT = Dynamic;

-- bang chi tiet yeu thich
CREATE TABLE `wishlist_details`  (
  `wid` int(10) UNSIGNED NOT NULL,
  `b_id` int(10) UNSIGNED NOT NULL,
  `added_date` datetime NOT NULL,
  PRIMARY KEY (`wid`, `b_id`) USING BTREE,
  INDEX `b_id`(`b_id`) USING BTREE,
  CONSTRAINT `wishlist_details_ibfk_1` FOREIGN KEY (`wid`) REFERENCES `wish_lists` (`wid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `wishlist_details_ibfk_2` FOREIGN KEY (`b_id`) REFERENCES `books` (`b_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci 
ROW_FORMAT = Dynamic;

-- Bảng dùng để lưu token
CREATE TABLE `password_reset_tokens`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NULL DEFAULT current_timestamp(),
  `expires_at` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  CONSTRAINT `password_reset_tokens_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- Bảng LOG: lưu lại các thao tác trên web
CREATE TABLE Logs (
  log_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT NULL,                -- Người dùng đã đăng nhập (NULL nếu guest)
  session_id VARCHAR(100),           -- Mã phiên làm việc (dành cho guest)
  ip_address VARCHAR(45),            -- IPv4 hoặc IPv6 
  level ENUM('INFO', 'ALERT', 'WARNING', 'DANGER') NOT NULL, 
  resource VARCHAR(100) NOT NULL,     
  action VARCHAR(255) NOT NULL,       
  data_before TEXT,   
  data_after TEXT,             
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  locked BOOLEAN DEFAULT FALSE,
  INDEX idx_user_id (user_id) USING BTREE,
  INDEX idx_level (level) USING BTREE,
  INDEX idx_resource (resource) USING BTREE,
  INDEX idx_action (action) USING BTREE,
  INDEX idx_user_level (user_id, level) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci
ROW_FORMAT = Dynamic;

-- Bảng STOCK: bảng nhập kho
CREATE TABLE `Stocks`  (
  `stock_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `b_id` int(10) UNSIGNED NOT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `stock_date` datetime NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`stock_id`) USING BTREE,
  INDEX `b_id`(`b_id`) USING BTREE,
  CONSTRAINT `stocks_ibfk_1` FOREIGN KEY (`b_id`) REFERENCES `books` (`b_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;


-- Bảng resource
CREATE TABLE `resource`  (
  `resource_id` int(11) NOT NULL AUTO_INCREMENT,
  `resource_code` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `resource_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`resource_id`) USING BTREE,
  UNIQUE INDEX `resource_code`(`resource_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(10) UNSIGNED NOT NULL,
  `resource_id` int(11) NOT NULL,
  `permission` int(11) NOT NULL DEFAULT 0 COMMENT '0: No access, 1: Read, 2: Write, 3: Delete',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `uid`(`uid`, `resource_id`) USING BTREE,
  INDEX `resource_id`(`resource_id`) USING BTREE,
  CONSTRAINT `role_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`uid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `role_ibfk_2` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- TRIGGER ---------------------------------------------------------------------------------------------

-- kiểm soát/ cập nhật số lượng tồn kho và số lượng đã bán của sản phẩm

-- Trigger đảm bảo chỉ cho phép đánh giá khi hóa đơn đã hoàn thành (Completed)
DELIMITER //

CREATE TRIGGER before_review_insert
BEFORE INSERT ON reviews
FOR EACH ROW
BEGIN
    DECLARE invoice_status ENUM('Pending', 'Shipping', 'Completed', 'Cancelled');
    
    -- Lấy trạng thái hóa đơn của hóa đơn hiện tại
    SELECT status INTO invoice_status
    FROM invoices
    WHERE invoice_id = NEW.invoice_id;

    -- Kiểm tra nếu hóa đơn không phải 'Completed' thì không cho phép thêm đánh giá
    IF invoice_status != 'Completed' THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Only completed orders can be reviewed';
    END IF;
END //

DELIMITER ;
-- -----------------------------------------------------------------------------------------------------------------
  -- Nha xuat ban
INSERT INTO publishers (p_name, p_address, p_phone)
VALUES 
    ('NXB Trẻ', '161B Lý Chính Thắng, Phường Võ Thị Sáu, Quận 3, TP. Hồ Chí Minh', '028 3931 6289'),
    ('NXB giáo dục Việt Nam', 'Số 81 Trần Hưng Đạo, Hoàn Kiếm, Hà Nội', '024 3822 0801'),
    ('NXB Kim Đồng', '55 Quang Trung, Hai Bà Trưng, Hà Nội', '1900571595'),
    ('NXB Hội Nhà văn', 'Số 65 Nguyễn Du, Hà Nội', '024 3822 2135'),
    ('NXB Phương Nam', '231 Đ. Nguyễn Văn Cừ, Phường 4, Quận 5, Hồ Chí Minh', '028 7303 5556'),
    ('NXB Thế Giới', '7 Đ. Nguyễn Thị Minh Khai, Bến Nghé, Quận 1, Hồ Chí Minh', '028 3822 0102'),
    ('NXB Phụ Nữ', '39 P. Hàng Chuối, Phạm Đình Hổ, Hai Bà Trưng, Hà Nội', '024 3971 0717'),
    ('NXB Dân Trí', 'Số 278, Tôn Đức Thắng, Đống Đa, Hà Nội', '024 6686 0751'),
    ('NXB Khoa Học - Xã Hội', '26 Lý Thường Kiệt, Phường Hàng Bài, Quận Hoàn Kiếm, Hà Nội', '(84) 39719073'),
    ('NXB Tổng Hợp TP. HCM', 'QMJX+3MP, Bến Nghé, Quận 1, Hồ Chí Minh', '028 3823 8191'),
    ('NXB Thanh Niên', '143 Pasteur, Phường 6, Quận 3, Hồ Chí Minh', '028 3910 6963'),
    ('NXB Công Thương', 'Tòa nhà Bộ Công Thương, 655 Đ. Phạm Văn Đồng, phường, Bắc Từ Liêm, Hà Nội', '024 3938 7165'),
    ('NXB Hà Nội', '4 P. Tống Duy Tân, Hàng Bông, Hoàn Kiếm, Hà Nội', '024 3825 2916'),
    ('NXB Văn Học', '290/20 Đ. Nam Kỳ Khởi Nghĩa, Phường 8, Quận 3, Hồ Chí Minh', '028 3526 5845');

  -- Bang danh muc 
INSERT INTO categories (category_name, update_at)
VALUES
    ('Văn học', '2024-11-11'),
    ('Kinh tế', '2024-11-11'),
    ('Tâm lí học', '2024-11-11'),
    ('Sách thiếu nhi', '2024-11-11'),
    ('Tiểu sử-hồi kí', '2024-11-11'),
    ('Sách giáo khoa', '2024-11-11'),
    ('Sách Hướng Nghiệp & Phát Triển Bản Thân', '2024-11-11'),
    ('Truyện ngắn', '2024-11-11'),
    ('Tiểu thuyết', '2024-11-11'),
    ('Tâm lí- Giáo dục', '2024-11-11'),
    ('Tâm lí- Kỹ năng sống', '2024-11-11'),
    ('Sách Tiếng Việt', '2024-11-11'),
    ('Sách Kiến Thức - Hội Họa - Điện Ảnh', '2024-11-11'),
    ('Truyện Tranh', '2024-11-11'),
    ('Sách Chuyên Ngành', '2024-11-11'),
    ('Nuôi dạy con', '2024-11-11');
    
INSERT INTO promotions (promotion_name, discount, start_date, end_date, is_active)
VALUES
('Khuyến mãi 5%', 0.05, '2025-01-16 00:00:00', '2025-01-31 23:59:59', 1),
('Khuyến mãi 10%', 0.10, '2025-01-16 00:00:00', '2025-01-31 23:59:59', 1),
('Khuyến mãi 15%', 0.15, '2025-01-16 00:00:00', '2025-01-31 23:59:59', 1),
('Khuyến mãi 20%', 0.20, '2025-01-16 00:00:00', '2025-01-31 23:59:59', 1),
('Khuyến mãi 50%', 0.50, '2024-01-16 00:00:00', '2024-01-31 23:59:59', 0);

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'diem123', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '2002-12-20', '0912345868', 'ngocdiem23@gmail.com', '4f1511633563a5f7360797002dc29c4adf1f482f0cffb0981d052b10f4877aac', 0, '2025-05-28 11:09:53', '2025-06-01 16:36:13', NULL);
INSERT INTO `users` VALUES (2, 'ThanhDieu', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '2004-12-31', '0901234567', 'thanhdieu@gmail.com', 'e005fed49427c9e03052a9f7322f4fdb760e2cf84174bd9fc8cb830e4e6df732', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (3, 'ThanhDieua', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '2004-02-28', '0907654321', 'thanhdieua@gmail.com', '559e4d3e364f1f38336291398e52049a3ed71eb9ba4191fcbf230d1bf3ed3592', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (4, 'NgocDiem', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '2002-12-20', '0912345678', 'ngocdiem@gmail.com', '4f1511633563a5f7360797002dc29c4adf1f482f0cffb0981d052b10f4877aac', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (5, 'NgocDiema', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '2003-02-28', '0918765432', 'ngocdiema@gmail.com', 'bd8666fcf10a6d11afbe9deb6a71885c522e3e6c7d02ee7bfeff992f73b1249d', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (6, 'ThinhTran', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '2002-10-20', '0934567890', 'thinhtran@gmail.com', 'e95d381b6cbb01bf5e7d5779b2708ba0a314f56cf3565e9296a45307373222d7', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (7, 'ThinhTrana', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '2004-01-31', '0932109876', 'thinhtrana@gmail.com', 'bb723d89139639d652ccf99c1df2342a21e783f0fff5f2f10ed81dee69024ff8', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (8, 'HoaiPhuong', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '1998-05-15', '0971234567', 'hoaiphuong@gmail.com', '0f50df3c28898f56532af42adae7a295c14cda04c785e2751047090ab2d351ac', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (9, 'MinhQuan', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '2000-09-12', '0982345678', 'minhquan@gmail.com', 'a6bb7955dee174dbf8e9b6460a8dc87a5a902c675d438cb66318d071f066384e', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (10, 'MinhTuan', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1995-03-15', '0902345678', 'minhtuan@gmail.com', '960f05d8d1f13ff4273ffacd00fd30b14c3f2f3dc237dde4ca67c098ef3ad817', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (11, 'HoaMai', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '1998-05-25', '0903456789', 'hoamai@gmail.com', 'a29abf816785c5783a82087e795524553bdb9b4ed8c69374c6ab4b237068aa99', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (12, 'NguyenHieu', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '2000-07-10', '0904567890', 'nguyenhieu@gmail.com', '2a786e6d8ab4267ef7b3a1363d087427562b78918e3c36ea195fecb7d565e495', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (13, 'LanChi', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '1992-02-20', '0905678901', 'lanchi@gmail.com', 'ded5f26ed7bd96a5d824ef9b47c2a617f41df6eb7fbac7c38507c117fa86d205', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (14, 'QuangHieu', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1989-08-30', '0906789012', 'quanghieu@gmail.com', '6530e2dfe72b3b15fad802f77dff920d92920053975ddbdaf82f62e2c3cf8f2d', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (15, 'HieuNhat', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1990-01-01', '0907890123', 'hieunhat@gmail.com', '72dbe47a8a2f0d7a0b48eeafd14fd5d24d4c3d82a88b6fe9b3b8ca850b03a27f', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (16, 'LanChi02', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '1993-10-04', '0908901234', 'lanchi02@gmail.com', 'ff62f14fe1c530226b8e59d77e59ebec583ffedc3d3b8a15f7792223d02538d7', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (17, 'ThaoDuy', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '2001-12-19', '0909012345', 'thaoduy@gmail.com', '7eff9ef741018b42da3165a6eb6d065ce43cd2fddbeba174e1405b62b7922ee1', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (18, 'TuAnh', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '1997-04-06', '0900123456', 'tuanh@gmail.com', '6022812befd917e6bd6f3340cb1e46c2e505da0206088c9fabb6343281af30a1', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (19, 'DatKien', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1995-07-14', '0901234568', 'datkien@gmail.com', 'a98483fd6be76d89cfc43aea1e0a88725fc23d450b5964082579afabac68444a', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (20, 'VuQuang', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1993-11-23', '0902345679', 'vuquang@gmail.com', '9f1fc645c0ea3e1148be5bf5899408fdde8bfbb254f65c5b94307df3aa98be2d', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (21, 'YenBich', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '2002-09-12', '0903456780', 'yenbich@gmail.com', 'f6fa39713db3038220802906e24f937dca170d42e5848454fe907aedb5c725ef', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (22, 'KimChi', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '2001-06-15', '0904567891', 'kimchi@gmail.com', 'c5db62e195f0972af609dbfa414b6caec9ef8101486dd2b9bed783cb61fdbcbf', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (23, 'HoaNguyen', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '1990-11-05', '0905678902', 'hoanguyen@gmail.com', 'a5f97ee81aa22a35eedfe103c09cedcdf5e9d973781b97819f0fa5ace0b097dc', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (24, 'DuongLinh', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1998-04-17', '0906789013', 'duonglinh@gmail.com', '2b42f5388db581fd6544ede408e6d2f197f1c598ae6248cb6cd9b607e807fb1e', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (25, 'ThuyDuong', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '1995-02-12', '0907890124', 'thuyduong@gmail.com', 'e3abde16db2f3e73f85c24636ed4c39aae17650464733dd61daed9d973fa38f0', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (26, 'HoangQuan', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1992-07-22', '0908901235', 'hoangquan@gmail.com', 'aa36f34db0838e60a6746e10c7559b5a47f5e72a553f0c5e3771973db9cdde88', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (27, 'ThiLan', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '1997-10-03', '0909012346', 'thilan@gmail.com', '21140fa108459bf2551d7ac5bb4438da9a479c7f18d33848a892432acb4985a9', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (28, 'PhongKien', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1999-09-13', '0900123457', 'phongkien@gmail.com', '77c0160d874d999cf0bc24c871da4912c6289db40884b7d96aea6875ef591bf4', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (29, 'QuyenBao', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '1994-03-20', '0901234569', 'quyenbao@gmail.com', '1bea69af293f709c99bd48a207a7c336c274bde9b2f735ef579112ef5d0d9932', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (30, 'MinhLe', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1993-06-25', '0902345680', 'minhle@gmail.com', '89af68fb55f6caac54c71235ce243e8433696bd6d8151a311533d0f2316399f5', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (31, 'AnhDuy', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1991-04-10', '0903456781', 'annduy@gmail.com', '7cd38f18c76fb37258ec6763bff74e05e1d763cf2ff592eecea6ce26005db3fd', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (32, 'ThaoChau', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '1996-12-07', '0904567892', 'thaochau@gmail.com', 'e04db10db35e994f542d837d791c686c89d631cd0b15a9b84c2fc7884953ac90', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (33, 'ThiLe', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '2000-05-14', '0905678903', 'thile@gmail.com', 'fc22afde115ab8e6c077e0d72dfae953ecd687e921185091e61e387899edeb36', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (34, 'HuyDung', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1994-01-16', '0906789014', 'huydung@gmail.com', '37a3888cf16d624800c5fa9b6c0494f6e7dc12fa480d8e7d94de53eaa7566e6e', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (35, 'TuanAnh', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1999-11-03', '0907890125', 'tuananh@gmail.com', '45ed646a13702d67b5adc8ddbfec8449e4278dbc06922fc52f6acc545e1f068b', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (36, 'NgocMai', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '1995-03-19', '0908901236', 'ngocmai@gmail.com', '48bb118c96c612952aef1cdb5ca01c95337937a22b63e469bafc752b1e15de9f', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (37, 'KienDong', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '2000-04-18', '0909012347', 'kiendong@gmail.com', '6e2c4d59b6ddc86a503750de96ea7eba538a28a9996576480927af9981557cb9', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (38, 'MyHien', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '1998-02-10', '0900123458', 'myhien@gmail.com', 'f399ed4026e7586b2010a9f0d030aa59a11c47d47ce4c713db8ff679df8733bd', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (39, 'HoangTam', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1997-09-05', '0901234570', 'hoangtam@gmail.com', '7b8cddfc7bd0197e88e4793bdfdd07bc3b705feadf352f6e70319bdb4425a1d7', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (40, 'KimLien', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '2002-08-11', '0902345681', 'kimlien@gmail.com', '608250e572b83441711800651b7a85a954ae0d9b10650c14c82b62eb5032f998', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (41, 'TuanHoang', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1993-05-16', '0903456782', 'tuanhoang@gmail.com', 'f283a0410bfdd8a4f5561bee7e736458d84a62470f141d5c88dca7dccf21a9c4', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (42, 'TamDuong', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '2000-01-01', '0904567893', 'tamduong@gmail.com', '424016f88453b79e35cc42e005eb4ceba067361c9193677375428b23ef47ed20', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (43, 'ThiBich', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '1992-11-25', '0905678904', 'thibich@gmail.com', '15660f1fd659c450295055e733e9d6b6d61d1bea20f2f4983bfd104d544012ca', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (44, 'AnhTuan', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1994-12-20', '0906789015', 'anhtuan@gmail.com', '39994ddf91c2348accc60b132bdc04ef199a9198e52392739b1c64782f2fe13f', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (45, 'ThiDuong', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '2001-09-08', '0907890126', 'thiduong@gmail.com', '6df976dccb4ddf9ef5bd198ccbe70ba5492c3e4d24496d1bf8927a25ffaa8f9a', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (46, 'HoangTan', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '1996-06-22', '0908901237', 'hoangtans@gmail.com', '974df4154e5902cd77f945bc0d27d0fb3f84c4bf7324d9a0862a2ee5f3b8b10d', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (47, 'NguyenThanh', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'male', '2002-02-14', '0909012348', 'nguyenthanh@gmail.com', '617cb35fd8c3875701b7242e1b5ebc7a97bdd76881ea18704ffba5fe522c6398', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (48, 'ThiHa', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'female', '1999-08-25', '0900123459', 'thiha@gmail.com', '1b7b803e56d4081faf32816228ecc5a02bbdbd39aea682cde4f808a8ae0b3f7b', 1, '2025-05-28 11:09:53', '2025-05-28 11:09:53', NULL);
INSERT INTO `users` VALUES (52, 'Nguyễn Hữu Thịnh', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'other', NULL, NULL, 'thinhnguyen23052004@gmail.com', '0cadf58f-0f0a-47b4-be2b-56d03eeb9ffa', 1, '2025-05-29 11:59:16', '2025-05-29 11:59:16', NULL);
INSERT INTO `users` VALUES (53, 'Nguyễn Thịnh', 'https://dulichnghialo.vn/wp-content/uploads/2024/10/avatar-fb-mac-dinh-46nlrTXx.jpg', 'other', NULL, NULL, 'Nguyễn Thịnh@gmail.com', 'd466c402-436b-422f-a0db-e8d2b02e8d37', 1, '2025-05-29 12:01:06', '2025-05-29 12:01:06', NULL);
INSERT INTO `users` VALUES (57, 'thinh123', 'http://res.cloudinary.com/djhqmrh8s/image/upload/v1748836087/notswlmfvqd8j7ouarzw.png', 'male', '1996-05-28', '0958899001', 'shadow05.rx@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 1, '2025-06-02 10:46:57', '2025-06-02 10:48:08', NULL);
    
-- -------------------------------------------------------------
-- Insert dữ liệu vào bảng books
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Sách Nhà Giả Kim (Tái bản năm 2020)', 'Paulo Coelho', 
    (SELECT category_id FROM categories WHERE category_name = 'Văn học'), 
    (SELECT p_id FROM publishers WHERE p_name = 'NXB Phương Nam'), 
    2020, '13 x 20.5 cm', 300, 227, 'Bìa mềm', 79000, 
    'Nhà Giả Kim Tất cả những trải nghiệm trong chuyến phiêu du theo đuổi vận mệnh của mình đã giúp Santiago thấu hiểu được ý nghĩa sâu xa nhất của hạnh phúc, hòa hợp với vũ trụ và con người.Tiểu thuyết Nhà giả kim của Paulo Coelho như một câu chuyện cổ tích giản dị, nhân ái, giàu chất thơ, thấm đẫm những minh triết huyền bí của phương Đông. Trong lần xuất bản đầu tiên tại Brazil vào năm 1988, sách chỉ bán được 900 bản. Nhưng, với số phận đặc biệt của cuốn sách dành cho toàn nhân loại, vượt ra ngoài biên giới quốc gia, Nhà giả kim đã làm rung động hàng triệu tâm hồn, trở thành một trong những cuốn sách bán chạy nhất mọi thời đại, và có thể làm thay đổi cuộc đời người đọc.“Nhưng nhà luyện kim đan không quan tâm mấy đến những điều ấy. Ông đã từng thấy nhiều người đến rồi đi, trong khi ốc đảo và sa mạc vẫn là ốc đảo và sa mạc. Ông đã thấy vua chúa và kẻ ăn xin đi qua biển cát này, cái biển cát thường xuyên thay hình đổi dạng vì gió thổi nhưng vẫn mãi mãi là biển cát mà ông đã biết từ thuở nhỏ. Tuy vậy, tự đáy lòng mình, ông không thể không cảm thấy vui trước hạnh phúc của mỗi người lữ khách, sau bao ngày chỉ có cát vàng với trời xanh nay được thấy chà là xanh tươi hiện ra trước mắt. ‘Có thể Thượng đế tạo ra sa mạc chỉ để cho con người biết quý trọng cây chà là,’ ông nghĩ.” (trích đoạn)', 
    NULL, 40, 79, '2021-06-01', '2021-06-01', 1);

-- Thêm sách "Một Trái Tim Nhạy Cảm, Một Cái Đầu Nghĩ Nhiều"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Một Trái Tim Nhạy Cảm, Một Cái Đầu Nghĩ Nhiều', 'Monet (Mỹ Linh)', 
    (SELECT category_id FROM categories WHERE category_name = 'Tâm lí học'), 
    (SELECT p_id FROM publishers WHERE p_name = 'NXB Phương Nam'), 
    2024, '20 x 13 x 1.1 cm', 250, 232, 'Bìa mềm', 95000, 
    'NHẠY CẢM - KHÔNG PHẢI MÓN QUÀ CŨNG CHẲNG LÀ BẤT HẠNH\n\n\n\n- Bạn là người luôn cố kìm nén cảm xúc của bản thân dù là tích cực hay tiêu cực?\n\n- Bạn dễ xúc động, “hở tí là khóc”?\n\n- Bạn cũng là người thường bị ảnh hưởng bởi cái nhìn, suy nghĩ của người khác?\n\n- Đôi khi bạn cảm thấy dường như không ai hiểu được mình?\n\n\n\nVậy rất có thể bạn là người vừa nhạy cảm, lại vừa nghĩ nhiều. \n\n\n\nAi cũng hiểu sự nhạy cảm là nguyên nhân của những đêm trằn trọc mất ngủ, những câu hỏi không có câu trả lời, những cơn đau xé lòng, những suy nghĩ miên man như muốn nổ tung tâm trí, những lần bộc phát cảm xúc để rồi hối hận hay những lần bất lực với bản thân... Dù cả thế giới nói nhạy cảm là một món quà thì sâu bên trong, dường như chẳng ai muốn đón nhận món quà đó. \n\n\n\nVậy nhạy cảm là điều bất hạnh sao? Cũng không hẳn nhỉ, tác giả Monet có chia sẻ trong cuốn sách đầu tay “Một trái tim nhạy cảm, một cái đầu nghĩ nhiều” rằng: “Ý nghĩa của sự nhạy cảm không phân rõ trắng đen. Chúng không cần dán nhãn là món quà hay nỗi bất hạnh, không cần gạt bỏ cũng không cần tôn vinh. Chúng đến nhưng không kèm theo hướng dẫn sử dụng. Cách bạn đối diện và đối xử mới quyết định chúng là nỗi bất hạnh hay món quà trời ban.”\n\n\n\nChứa đựng những lời chia sẻ và kiến thức bổ ích từ chủ nhân podcast phát triển bản thân với hơn 1 triệu lượt nghe Monet’s Talk & Touch, cuốn sách “Một trái tim nhạy cảm, một cái đầu nghĩ nhiều” sẽ giúp bạn đón nhận sự nhạy cảm một cách tự nhiên như chúng vốn là, giúp bạn điềm tĩnh làm quen, làm thân và làm lành với phiên bản nhạy cảm bên trong mình.', 
    NULL, 195, 40, '2024-01-01', '2024-01-01', 1);

-- Thêm sách "The Journey Into Summer - Chưa Kịp Lớn Đã Phải Trưởng Thành - Quyển 2: Phiên Bản Mùa Hè"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('The Journey Into Summer - Chưa Kịp Lớn Đã Phải Trưởng Thành - Quyển 2: Phiên Bản Mùa Hè', 'Tớ Là Mây', 
    (SELECT category_id FROM categories WHERE category_name = 'Sách Hướng Nghiệp & Phát Triển Bản Thân'), 
    (SELECT p_id FROM publishers WHERE p_name = 'NXB Phương Nam'), 
    2023, '17 x 14 x 1.1 cm', 185, 240, 'Bìa mềm', 63200, 
    'Chưa Kịp Lớn Đã Trưởng Thành Chúng ta của hiện tại, đều chưa kịp lớn đã phải trưởng thành. Lúc còn nhỏ có thể khóc cười tuỳ ý. Trưởng thành rồi mới biết hành động cũng cần nhìn sắc mặt người khác. Lúc còn nhỏ có thể sống vô tư, vô lo. Trưởng thành rồi mới biết nếu chậm chân hơn người khác, chắc chắn sẽ bị đào thải bất cứ lúc nào. Lúc còn nhỏ có thể khao khát, mơ mộng. Trưởng thành rồi mới biết thế giới ngoài kia thực sự rất tàn khốc. Chúng ta đều giống nhau, lúc còn nhỏ đều khao khát trưởng thành. Trưởng thành rồi lại loay hoay học cách trở thành người lớn. Nếu bạn đang trải qua giai đoạn lạc lõng và cô đơn như vậy, hãy để “Chưa kịp lớn đã phải trưởng thành” làm một người bạn ở bên, xoa dịu tổn thương và gửi tặng bạn đôi điều khích lệ. Mỗi trang sách đều là một lá thư nhắn nhủ bạn về sự đặc biệt của bản thân, về những nỗ lực hoàn thiện khô...', 
    NULL, 286, 19, '2023-01-01', '2023-01-01', 1);

-- Thêm sách "Lúc Biết Xuyên Không Thì Đã Muộn!"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Lúc Biết Xuyên Không Thì Đã Muộn!', 'Tớ Là Mây', 
    (SELECT category_id FROM categories WHERE category_name = 'Văn học'), 
    (SELECT p_id FROM publishers WHERE p_name = 'NXB Phương Nam'), 
    2024, '24 x 16 x 2.7 cm', 560, 544, 'Bìa mềm', 239000, 
    'Trăm tính vạn tính nàng cũng không tính được vì say rượu mà xuyên không, rơi vào Đại Cồ Việt tròn 1000 năm về trước.\n\nTrong cái rủi có cái xui, giữa thời kỳ loạn lạc binh biến, nơi nàng mở mắt tỉnh dậy lại chính là doanh trại quân đội. Con đường sống duy nhất là phải giả trai chịu kiếp nô bộc, làm đủ mọi việc chỉ mong yên thân.\n\nMột lần uống say, cả đời lầm lỡ, đã xuyên không thì chớ còn đắc tội với hôn quân tàn bạo nhất lịch sử…', 
    NULL, 2100, 54, '2024-06-01', '2025-06-01', 1);
    
-- Inserting "Tuyển Tập Kawabata - Truyện Ngắn Trong Lòng Bàn Tay"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Tuyển Tập Kawabata - Truyện Ngắn Trong Lòng Bàn Tay', 'Kawabata Yasunari', 
    (SELECT category_id FROM categories WHERE category_name = 'Truyện ngắn'), 
    (SELECT p_id FROM publishers WHERE p_name = 'NXB Phương Nam'), 
    2024, '24 x 15 x 3 cm', 560, 580, 'Bìa mềm', 380000, 
    'Tình yêu luôn là chủ đề muôn thuở của văn học, hầu hết các tác phẩm của Yasunari Kawabata đều miêu tả tình yêu, nhưng chủ đề tình yêu của ông rất khác với chủ đề tình yêu trong văn chương truyền thống. Kawabata không nhấn mạnh bầu không khí vui vẻ kéo dài của tình yêu, cũng không nhấn mạnh sự sống chết và kết thúc bi thảm của tình yêu, mà thể hiện một tình yêu nhẹ nhàng và đa cảm. Nhiều mối tình trong tác phẩm của ông, các nhân vật từ đầu đến cuối chưa bao giờ dành cho nhau một lời yêu thương nào, tình cảm của đối phương dành cho nhau chỉ ở giai đoạn nhận thức lẫn nhau. Loại tình yêu này chỉ là một loại tình cảm cảm mến lẫn nhau, không có tình cảm biểu đạt, không có thề nguyền sống chết, cũng không có những lời yêu thương cuồng nhiệt, không có bốc đồng, không có phàn nàn và không có tiếc thương, tất cả lời nói và việc làm đều rất thờ ơ. Một tình yêu trong sáng và hững hờ, giữa cặp đôi không có vướng mắc phức tạp, cũng không có bi kịch tình yêu, mọi thứ diễn ra và kết thúc rất bình dị, nhưng lại vô cùng quyến rũ người đọc.', 
    NULL, 34, 20, '2024-01-23', '2024-01-23', 1);

-- Inserting "Xứ Tuyết"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Xứ Tuyết', 'Kawabata Yasunari', 
    (SELECT category_id FROM categories WHERE category_name = 'Tiểu thuyết'), 
    (SELECT p_id FROM publishers WHERE p_name = 'NXB Phương Nam'), 
    2024, '20.5 x 14 x 0.9 cm', 300, 180, 'Bìa mềm', 95500, 
    'Tình yêu luôn là chủ đề muôn thuở của văn học, hầu hết các tác phẩm của Yasunari Kawabata đều miêu tả tình yêu, nhưng chủ đề tình yêu của ông rất khác với chủ đề tình yêu trong văn chương truyền thống. Kawabata không nhấn mạnh bầu không khí vui vẻ kéo dài của tình yêu, cũng không nhấn mạnh sự sống chết và kết thúc bi thảm của tình yêu, mà thể hiện một tình yêu nhẹ nhàng và đa cảm. Nhiều mối tình trong tác phẩm của ông, các nhân vật từ đầu đến cuối chưa bao giờ dành cho nhau một lời yêu thương nào, tình cảm của đối phương dành cho nhau chỉ ở giai đoạn nhận thức lẫn nhau. Loại tình yêu này chỉ là một loại tình cảm cảm mến lẫn nhau, không có tình cảm biểu đạt, không có thề nguyền sống chết, cũng không có những lời yêu thương cuồng nhiệt, không có bốc đồng, không có phàn nàn và không có tiếc thương, tất cả lời nói và việc làm đều rất thờ ơ. Một tình yêu trong sáng và hững hờ, giữa cặp đôi không có vướng mắc phức tạp, cũng không có bi kịch tình yêu, mọi thứ diễn ra và kết thúc rất bình dị, nhưng lại vô cùng quyến rũ người đọc.', 
    NULL, 82, 20, '2024-02-24', '2024-02-24', 1);

-- Inserting "Storytelling - Lay Động Lòng Người Bằng Chuyện Kể"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Storytelling - Lay Động Lòng Người Bằng Chuyện Kể', 'Nguyễn Trần Quang', 
    (SELECT category_id FROM categories WHERE category_name = 'Tâm lí- Giáo dục'), 
    (SELECT p_id FROM publishers WHERE p_name = 'NXB Thế Giới'), 
    2024, '20.5 x 14 x 1.5 cm', 320, 296, 'Bìa mềm', 246000, 
    'Trăm tính vạn tính nàng cũng không tính được vì say rượu mà xuyên không, rơi vào Đại Cồ Việt tròn 1000 năm về trước.\n\nTrong cái rủi có cái xui, giữa thời kỳ loạn lạc binh biến, nơi nàng mở mắt tỉnh dậy lại chính là doanh trại quân đội. Con đường sống duy nhất là phải giả trai chịu kiếp nô bộc, làm đủ mọi việc chỉ mong yên thân.\n\nMột lần uống say, cả đời lầm lỡ, đã xuyên không thì chớ còn đắc tội với hôn quân tàn bạo nhất lịch sử…', 
    NULL, 55, 12, '2024-03-12', '2025-03-12', 1);

-- Inserting "Người Trồng Rừng"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Người Trồng Rừng', 'Jean Giono', 
    (SELECT category_id FROM categories WHERE category_name = 'Văn học'), 
    (SELECT p_id FROM publishers WHERE p_name = 'NXB Phụ Nữ'), 
    2024, '24 x 15 x 0.8 cm', 320, 49, 'Bìa cứng', 80500, 
    'Trăm tính vạn tính nàng cũng không tính được vì say rượu mà xuyên không, rơi vào Đại Cồ Việt tròn 1000 năm về trước.\n\nTrong cái rủi có cái xui, giữa thời kỳ loạn lạc binh biến, nơi nàng mở mắt tỉnh dậy lại chính là doanh trại quân đội. Con đường sống duy nhất là phải giả trai chịu kiếp nô bộc, làm đủ mọi việc chỉ mong yên thân.\n\nMột lần uống say, cả đời lầm lỡ, đã xuyên không thì chớ còn đắc tội với hôn quân tàn bạo nhất lịch sử…', 
    NULL, 45, 10, '2024-04-05', '2024-04-05', 1);

-- Insert dữ liệu vào bảng images
-- Thêm hình ảnh cho sách "Sách Nhà Giả Kim (Tái bản năm 2020)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Sách Nhà Giả Kim (Tái bản năm 2020)'), 'https://nhasachphuongnam.com/images/thumbnails/529/652/detailed/131/nha-gia-kim-tb-2020.jpg', 1);
    
    
-- Thêm hình ảnh cho sách "Một Trái Tim Nhạy Cảm, Một Cái Đầu Nghĩ Nhiều"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Một Trái Tim Nhạy Cảm, Một Cái Đầu Nghĩ Nhiều'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/mot-trai-tim-nhay-cam-mot-cai-dau-nghi-nhieu.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Một Trái Tim Nhạy Cảm, Một Cái Đầu Nghĩ Nhiều'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/mot-trai-tim-nhay-cam-mot-cai-dau-nghi-nhieu-p01.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Một Trái Tim Nhạy Cảm, Một Cái Đầu Nghĩ Nhiều'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/mot-trai-tim-nhay-cam-mot-cai-dau-nghi-nhieu-p02.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Một Trái Tim Nhạy Cảm, Một Cái Đầu Nghĩ Nhiều'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/mot-trai-tim-nhay-cam-mot-cai-dau-nghi-nhieu-p03.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Một Trái Tim Nhạy Cảm, Một Cái Đầu Nghĩ Nhiều'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/mot-trai-tim-nhay-cam-mot-cai-dau-nghi-nhieu-p04.jpg', 0);

-- Thêm hình ảnh cho sách "The Journey Into Summer - Chưa Kịp Lớn Đã Phải Trưởng Thành - Quyển 2"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'The Journey Into Summer - Chưa Kịp Lớn Đã Phải Trưởng Thành - Quyển 2: Phiên Bản Mùa Hè'), 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-locfuxpjrcri1e', 1),
    ((SELECT b_id FROM books WHERE title = 'The Journey Into Summer - Chưa Kịp Lớn Đã Phải Trưởng Thành - Quyển 2: Phiên Bản Mùa Hè'), 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luj4h8k42plxa0', 0),
    ((SELECT b_id FROM books WHERE title = 'The Journey Into Summer - Chưa Kịp Lớn Đã Phải Trưởng Thành - Quyển 2: Phiên Bản Mùa Hè'), 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-luj4h8k4446de3', 0);

-- Thêm hình ảnh cho sách "Lúc Biết Xuyên Không Thì Đã Muộn!"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Lúc Biết Xuyên Không Thì Đã Muộn!'), 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lss5dueh7btlbc', 1),
    ((SELECT b_id FROM books WHERE title = 'Lúc Biết Xuyên Không Thì Đã Muộn!'), 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lss5dueh1pjtb6', 0),
    ((SELECT b_id FROM books WHERE title = 'Lúc Biết Xuyên Không Thì Đã Muộn!'), 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lss5dueh3449dd', 0),
    ((SELECT b_id FROM books WHERE title = 'Lúc Biết Xuyên Không Thì Đã Muộn!'), 'https://down-vn.img.susercontent.com/file/vn-11134207-7r98o-lss5dueh4iopdc', 0);
    
-- Adding images for "Tuyển Tập Kawabata - Truyện Ngắn Trong Lòng Bàn Tay"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Tuyển Tập Kawabata - Truyện Ngắn Trong Lòng Bàn Tay'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/tuyen-tap-kawabata-truyen-ngan-trong-long-ban-tay.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Tuyển Tập Kawabata - Truyện Ngắn Trong Lòng Bàn Tay'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/tuyen-tap-kawabata-truyen-ngan-trong-long-ban-tay-mockup.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Tuyển Tập Kawabata - Truyện Ngắn Trong Lòng Bàn Tay'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/tuyen-tap-kawabata-truyen-ngan-trong-long-ban-tay-mockup-02.jpg', 0);

-- Adding images for "Xứ Tuyết"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Xứ Tuyết'), 'https://cdn0.fahasa.com/media/catalog/product/8/9/8935235241855.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Xứ Tuyết'), 'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/xu_tuyet/2024_08_16_16_23_56_1-390x510.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Xứ Tuyết'), 'https://cdn0.fahasa.com/media/flashmagazine/images/page_images/xu_tuyet/2024_08_16_16_23_56_2-390x510.jpg', 0);

-- Adding images for "Storytelling - Lay Động Lòng Người Bằng Chuyện Kể"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Storytelling - Lay Động Lòng Người Bằng Chuyện Kể'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/storytelling-lay-dong-long-nguoi-bang-chuyen-ke.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Storytelling - Lay Động Lòng Người Bằng Chuyện Kể'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/storytelling-lay-dong-long-nguoi-bang-chuyen-ke-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Storytelling - Lay Động Lòng Người Bằng Chuyện Kể'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/storytelling-lay-dong-long-nguoi-bang-chuyen-ke-p01.jpg', 0);

-- Adding images for "Người Trồng Rừng"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Người Trồng Rừng'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/281/nguoi-trong-rung-bc.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Người Trồng Rừng'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/281/nguoi-trong-rung-bc-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Người Trồng Rừng'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/281/nguoi-trong-rung-bc-b04.jpg', 0);
    
-- Insert thông tin cho "Sức Mạnh Của Sự Tử Tế (Tái bản năm 2022)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Sức Mạnh Của Sự Tử Tế (Tái bản năm 2022)', 
     'Linda Kaplan Thaler, Robin Koval', 
     (SELECT category_id FROM categories WHERE category_name = 'Tâm lí- Kỹ năng sống'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Thế Giới'),
     2023, '20.5 x 14 x 0.9 cm', 320, 177, 'Bìa Mềm', 88400,
     'Trong kinh doanh, tử tế không có nghĩa là thiếu quyết đoán hay cả nể… chẳng dễ mà thành được người tử tế, nhưng một khi đã được rồi thì bạn sẽ',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     100, 12, '2024-04-16', '2025-04-16', 1);

-- Insert hình ảnh cho "Sức Mạnh Của Sự Tử Tế (Tái bản năm 2022)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Sức Mạnh Của Sự Tử Tế (Tái bản năm 2022)'), 'https://nhasachphuongnam.com/images/thumbnails/170/205/detailed/227/suc-manh-cua-su-tu-te-tb-2022.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Sức Mạnh Của Sự Tử Tế (Tái bản năm 2022)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/227/suc-manh-cua-su-tu-te-tb-2022.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Sức Mạnh Của Sự Tử Tế (Tái bản năm 2022)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/227/suc-manh-cua-su-tu-te-tb-2022-b4.jpg', 0);

-- Insert thông tin cho "Những Chiếc Cầu Ở Quận Madison (Tái bản năm 2022)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Những Chiếc Cầu Ở Quận Madison (Tái bản năm 2022)', 
     'Robert James Waller', 
     (SELECT category_id FROM categories WHERE category_name = 'Văn học'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Hội Nhà Văn'),
     2023, '13 x 20.5 x 0.9 cm', 320, 166, 'Bìa Mềm', 71200,
     'Câu chuyện bắt đầu bởi cuộc gặp gỡ định mệnh giữa nhiếp ảnh gia Robert Kincaid và Francesca – người phụ nữ nông thôn đã có gia đình. Những con người không thể tìm thấy nhau ở năm tháng tươi trẻ đã chạm nhau ở ngưỡng gần như chấp nhận sự sắp đặt của số phận. Tình yêu chỉ diễn ra trong 4 ngày, nhưng nó đủ cho cả cuộc đời. Nỗi đau êm đềm mà day dứt, âm thầm mà dai dẳng. Và dù chỉ có chiếc cầu ở quận Madison là nhân chứng duy nhất, tình yêu ấy vẫn bất diệt.', 
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     100, 12, '2024-04-14', '2025-04-15', 1);

-- Insert hình ảnh cho "Những Chiếc Cầu Ở Quận Madison (Tái bản năm 2022)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Những Chiếc Cầu Ở Quận Madison (Tái bản năm 2022)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/253/Untitled-1_c8z2-gj.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Những Chiếc Cầu Ở Quận Madison (Tái bản năm 2022)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/232/nhung-chiec-cau-o-quan-madison-tb-2022-b4.jpg', 0);

-- Insert thông tin cho "Atomic Habits - Thay Đổi Tí Hon, Hiệu Quả Bất Ngờ"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Atomic Habits - Thay Đổi Tí Hon, Hiệu Quả Bất Ngờ', 
     'James Clear', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Hội Nhà Văn'),
     2023, '14.5 x 20.5 x 2 cm', 320, 385, 'Bìa Mềm', 132300,
     'Wall Street Journal Bestseller, USA Today Bestseller, Publisher Weekly Bestseller\n•  Nằm trong Top 20 tựa sách thể loại non-fiction bán chạy và được tìm đọc nhiều nhất của Amazon suốt 40 tuần tính đến tháng 9/2019', 
     NULL, 100, 12, '2019-04-11', '2019-04-11', 1);

-- Insert hình ảnh cho "Atomic Habits - Thay Đổi Tí Hon, Hiệu Quả Bất Ngờ"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Atomic Habits - Thay Đổi Tí Hon, Hiệu Quả Bất Ngờ'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/273/thay-doi-ti-hon-hieu-qua-bat-ngo-tb-2024.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Atomic Habits - Thay Đổi Tí Hon, Hiệu Quả Bất Ngờ'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/273/thay-doi-ti-hon-hieu-qua-bat-ngo-tb-2024-b4.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Atomic Habits - Thay Đổi Tí Hon, Hiệu Quả Bất Ngờ'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/273/thay-doi-ti-hon-hieu-qua-bat-ngo-tb-2024-mockup.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Atomic Habits - Thay Đổi Tí Hon, Hiệu Quả Bất Ngờ'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/273/thay-doi-ti-hon-hieu-qua-bat-ngo-tb-2024-b4.jpg', 0);

    
-- Insert thông tin cho "Trở Về Không - Trải Nghiệm Ho'oponopono"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Trở Về Không - Trải Nghiệm Ho\'oponopono', 
     'Joe Vitale', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Thế Giới'),
     2023, '20.5 x 14 x 1.6 cm', 350, 340, 'Bìa Mềm', 111300,
     'Nếu Không giới hạn (Zero Limit) là sự bắt đầu của phương pháp Ho’oponopono thì Trở về không (At Zero) chính là sự nối tiếp thông điệp với những phương thức nâng cao bí truyền, mở đường cho phép mầu xảy đến trong thực tại.\\n\\n Hầu hết chúng ta đều chẳng hạnh phúc, thanh thản, hoặc hài lòng...\\n\\nĐã đến lúc để bạn nắm bắt những bí mật cao thâm của Hooponopono.\\n\\nĐã đến lúc bạn khai phóng chính mình đề tỉnh thức, để được hạnh phúc, và cho phép Siêu nhiên (Zero) truyền hứng khởi hoặc thậm chí thức tỉnh bạn.\\n\\nHooponopono đích thực là một phép mầu giúp ta đạt đến bình an. Thực hành Hooponopono là một cách để xóa tất cả các dữ liệu chặn giữa ta và Siêu nhiên. Mục đích của nó là dọn dẹp cỏ dại tinh thần và những ký ức tích tụ để Siêu nhiên sống trong ta với nhận thức và tình yêu. Nó giúp ta thanh lọc để có thể thức tỉnh với thực tại này. Để đạt đến đó, ta có rất nhiều việc phải làm, vì vậy, hãy thanh tẩy... không ngừng. Đây là chiếc vé để đạt đến sự viên mãn. Những lợi lạc khác sẽ đến cùng, hầu như một cách bí ẩn và siêu phàm.\\n\\nHãy tạo ra thực tại của chính mình!\\n\\n------\\n\\nCốt lõi của hooponopono là tinh thần nhận trách nhiệm về mọi chuyện trong cuộc sống. Đấy là một khái niệm lớn lao để ta thay đổi tư duy.\\n\\nTa không cần phải tìm đến ai khác, ta không cần phải thay đổi người khác, hay tìm đến một sản phẩm, dịch vụ hoặc bất kỳ điều gì khác.\\n\\nQuy trình này diễn ra bên trong. Nó cho ta cảm giác của quyền chủ động, và ta không còn là nạn nhân theo bất kỳ cách thức, hình thức hoặc thể thức nào; ta hoàn toàn chịu trách nhiệm về mọi thứ.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     127, 120, '2023-03-11', '2023-03-11', 1);

-- Insert hình ảnh cho "Trở Về Không - Trải Nghiệm Ho'oponopono"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Trở Về Không - Trải Nghiệm Ho\'oponopono'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/253/tro-ve-khong-tb-2023.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Trở Về Không - Trải Nghiệm Ho\'oponopono'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/253/tro-ve-khong-tb-2023-b4.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Trở Về Không - Trải Nghiệm Ho\'oponopono'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/253/tro-ve-khong-tb-2023-full.jpg', 0);

-- Insert thông tin cho "Atomic Habits - Thay Đổi Tí Hon, Hiệu Quả Bất Ngờ (Tái bản năm 2022)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Atomic Habits - Thay Đổi Tí Hon, Hiệu Quả Bất Ngờ (Tái bản năm 2022)', 
     'James Clear', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Thế Giới'),
     2023, '14.5 x 20.5 x 2 cm', 350, 385, 'Bìa Mềm', 171000,
     'Atomic Habits - Thay Đổi Tí Hon, Hiệu Quả Bất Ngờ\n\n•  Wall Street Journal Bestseller, USA Today Bestseller, Publishers Weekly Bestseller •  Nằm trong Top 20 tựa sách thể loại non-fiction bán chạy và được tìm đọc nhiều nhất của Amazon suốt 40 tuần tính đến tháng 9/2019\n\nMột thay đổi tí hon có thể biến đổi cuộc đời bạn không?\n\nHẳn là khó đồng ý với điều đó. Nhưng nếu bạn thay đổi thêm một chút? Một chút nữa? Rồi thêm một chút nữa? Đến một lúc nào đó, bạn phải công nhận rằng cuộc sống của mình đã chuyển biến nhờ vào một thay đổi nhỏ...\n\nVà đó chính là sức mạnh của thói quen nguyên tử.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 10k'),
     121, 10, '2024-04-11', '2024-04-11', 1);

-- Insert hình ảnh cho "Atomic Habits - Thay Đổi Tí Hon, Hiệu Quả Bất Ngờ (Tái bản năm 2022)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Atomic Habits - Thay Đổi Tí Hon, Hiệu Quả Bất Ngờ (Tái bản năm 2022)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/273/thay-doi-ti-hon-hieu-qua-bat-ngo-tb-2024.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Atomic Habits - Thay Đổi Tí Hon, Hiệu Quả Bất Ngờ (Tái bản năm 2022)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/273/thay-doi-ti-hon-hieu-qua-bat-ngo-tb-2024-b4.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Atomic Habits - Thay Đổi Tí Hon, Hiệu Quả Bất Ngờ (Tái bản năm 2022)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/273/thay-doi-ti-hon-hieu-qua-bat-ngo-tb-2024-mockup.jpg', 0);
    

-- Insert thông tin cho "Heidi (Song ngữ Việt-Anh)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Heidi (Song ngữ Việt-Anh)', 
     'Johanna Spyri', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Dân Trí'),
     2024, '20.5 x 14 x 2 cm', 300, 380, 'Bìa Mềm', 119000,
     'Heidi là một trong những tác phẩm kinh điển của Johanna Spyri, đã để lại dấu ấn sâu sắc trong văn học thiếu nhi thế giới. Câu chuyện kể về cô bé Heidi, mồ côi cha mẹ và phải sống với ông nội trên dãy núi Alps. Giữa thiên nhiên hùng vĩ, Heidi trải qua nhiều khó khăn nhưng dần tìm thấy tình yêu thương, lòng nhân ái và sự kết nối với mọi người xung quanh. Tác phẩm Heidi mang lại những cảm xúc sâu sắc về lòng lạc quan, sự kiên cường và tinh thần bất khuất, trở thành nguồn cảm hứng cho độc giả trên toàn thế giới.\n\nĐiểm nổi bật của sách song ngữ Heidi\n\n– Tác phẩm kinh điển: Heidi là biểu tượng của văn học thiếu nhi, với thông điệp về tình yêu thiên nhiên và sức mạnh của tình người.\n\n– Sách song ngữ đặc biệt: Phiên bản Heidi song ngữ Việt – Anh giúp độc giả vừa đắm chìm trong câu chuyện của Heidi, vừa phát triển kỹ năng ngôn ngữ một cách toàn diện.\n\n– Trình bày song ngữ thông minh: Với bố cục sách song ngữ song song, người đọc dễ dàng nắm bắt ý nghĩa và từ vựng, giúp việc học tiếng Anh trở nên dễ dàng và hiệu quả.\n\n– Audiobook đi kèm: Sách tặng kèm audiobook giúp người đọc trải nghiệm Heidi qua giọng đọc truyền cảm, đưa độc giả vào thế giới diệu kỳ của cô bé Heidi.\n\nThành tích và giá trị giáo dục của truyện song ngữ Heidi\n\n– Heidi đã được dịch ra hơn 50 ngôn ngữ và trở thành một trong những tác phẩm văn học thiếu nhi bán chạy nhất, với hơn 20 triệu bản được phát hành trên toàn thế giới.\n\n– Giáo dục qua sách song ngữ: Cuốn sách song ngữ này không chỉ giúp cải thiện kỹ năng ngôn ngữ mà còn mang lại bài học về sự lạc quan, lòng tốt và tinh thần kiên cường, truyền cảm hứng cho cả trẻ em và người lớn.\n\nƯu điểm của phiên bản sách song ngữ\n\n– Heidi phiên bản sách song ngữ không chỉ giúp bạn khám phá câu chuyện mà còn là công cụ tuyệt vời để học tiếng Anh. Với phần ghi chú từ vựng và phiên âm chi tiết, sách giúp bạn dễ dàng hiểu nội dung và nâng cao vốn từ vựng một cách hiệu quả.\n\n– Audiobook chất lượng cao đi kèm là lựa chọn tuyệt vời cho người muốn luyện nghe tiếng Anh hoặc thư giãn với câu chuyện hấp dẫn của Heidi.
',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 10k'),
     23, 100, '2024-05-12', '2024-05-12', 1);

-- Insert hình ảnh cho "Heidi (Song ngữ Việt-Anh)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Heidi (Song ngữ Việt-Anh)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/sach-song-ngu-heidi.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Heidi (Song ngữ Việt-Anh)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/sach-song-ngu-heidi-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Heidi (Song ngữ Việt-Anh)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/sach-song-ngu-heidi-mockup.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Heidi (Song ngữ Việt-Anh)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/sach-song-ngu-heidi-mockup-02.jpg', 0);

-- Insert thông tin cho "Tình Yêu Ở Thành Phố Lớn"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Tình Yêu Ở Thành Phố Lớn', 
     'Sang Young Park', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Hội Nhà Văn'),
     2024, '20.5 x 14 x 1.4 cm', 240, 262, 'Bìa Mềm', 139000,
     'Young là một sinh viên Hàn Quốc hay hoài nghi nhưng vui tính. Anh và Jaehee, cô bạn thân kiêm bạn trọ cùng phòng thường xuyên dạo khắp các quán bar và quán nhậu, nơi họ kìm nén những lo lắng về tương lai bằng rượu soju và những mối tình chóng vánh.\n\nThời gian trôi, ngay cả Jaehee cũng dần ổn định cuộc sống, để Young lại một mình với những tổn thương từ rạn nứt gia đình chưa thể hàn gắn và tìm bạn đồng hành trong các mối quan hệ vắt kiệt mọi cảm xúc.\n\nTình yêu ở thành phố lớn là hành trình khám phá cuộc sống đồng tính cũng như nỗi cô đơn thế hệ của lớp trẻ Hàn Quốc hiện đại. Một cuốn tiểu thuyết tràn đầy năng lượng, hài hước và cảm động, mô tả trọn vẹn cả thế giới về đêm lấp lánh của Seoul lẫn buổi sáng mờ mịt sau đó của thành phố lớn cô liêu.\n\nSang Young Park sinh năm 1988 tại Daegu, Hàn Quốc. Anh từng theo học chuyên ngành Văn học và Báo chí Pháp tại Đại học Sungkyunkwan và Sáng tác tại Trường Cao học Đại học Dongguk. Anh đăng đàn năm 2016, sau khi giành giải Tác giả trẻ của Munhakdongne với truyện ngắn \"Tìm kiếm Paris Hilton\". Anh được biết đến như một đại diện cho văn học đồng tính của văn học hiện đại Hàn Quốc. Bằng lối kể chuyện châm biếm sâu sắc và hài hước đặc trưng, các tác phẩm của anh tập trung khai thác trạng thái hoang mang lạc lối của tuổi trẻ, mổ xẻ nhiều vấn đề của các cộng đồng thiểu số và yếu thế trong xã hội.\n\nNăm 2022, anh lọt vào vòng sơ khảo của giải Booker Quốc tế với tiểu thuyết \"Tình yêu ở thành phố lớn',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 10k'),
     23, 100, '2024-05-14', '2024-05-14', 1);

-- Insert hình ảnh cho "Tình Yêu Ở Thành Phố Lớn"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Tình Yêu Ở Thành Phố Lớn'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/tinh-yeu-o-thanh-pho-lon.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Tình Yêu Ở Thành Phố Lớn'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/tinh-yeu-o-thanh-pho-lon-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Tình Yêu Ở Thành Phố Lớn'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/tinh-yeu-o-thanh-pho-lon-mockup.jpg', 0);

-- Insert thông tin sách
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Bà Nội Găngxtơ!', 
     'Johann Wolfgang von Goethe', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Văn Học'),
     2024, '20.5 x 14 x 1.2 cm', 240, 220, 'Bìa cứng', 100000,
     'Chán ghét đời sống thị thành rối ren vô hy vọng, Werther trở về làng quê Wahlheim. Ở nơi ấy, dưới bầu trời xanh, giữa những thung lũng tuyệt đẹp có lũ trẻ hồn nhiên và những nông dân chất phác thuần hậu, tâm hồn trống rỗng của chàng dường như đã trở nên lắng dịu và thư thái. Nhưng định mệnh đưa đẩy, khiến Werther gặp gỡ với thiếu nữ Lotte thanh tú, yêu kiều. Và trái tim nồng nhiệt của chàng nghệ sĩ, dù trốn chạy nơi đâu cũng không thể nguôi quên một mối tình si chỉ biết tôn thờ và dâng tặng, để rồi tan vỡ bi thảm…\n\nLà một trong những best-seller đầu tiên của thế giới, năm 1774, vừa được xuất bản, Nỗi đau của chàng Werther đã bùng lên như một cơn sốt, lan khắp châu Âu, đem lại sự nổi tiếng tức thì cho Johann Wolfgang von Goethe mới bước sang tuổi 25 đang vô danh. Tác phẩm đã gây nên một phong trào sáng tác thơ, kịch, nhạc mô phỏng Werther ở châu Âu trong ngót nửa thế kỷ. Suốt hơn 200 năm qua, Nỗi đau của chàng Werther vẫn giữ vị trí một kiệt tác kinh điển quan trọng, liên tục được xuất bản trên toàn thế giới.\n\nNhận định\n\nKhông chỉ là một bi kịch tình yêu, Nỗi đau của chàng Werther, phần nào lấy nguyên mẫu từ chính cuộc đời thực của Goethe, là nỗi đau từ những xung đột nhức nhối giữa tư tưởng và thực tại của một tâm hồn lớn, thể hiện khát vọng giải phóng tình cảm, khát vọng về quyền tự do, quyền bình đẳng của con người – mà Werther là một đại diện.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 20k'),
     29, 10, '2024-01-14', '2024-01-14', 1),
     
    ('Nỗi Đau Của Chàng Werther (Tái bản năm 2024)', 
     'David Walliams', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Hội Nhà Văn'),
     2024, '20.5 x 14 x 1.8 cm', 300, 348, 'Bìa mềm', 155000,
     'Không còn mùi bắp cải ám ảnh mọi đồ vật, không còn những bữa cà kê ngồi chơi trò xếp chữ, và đặc biệt là không còn những đêm phiêu lưu kịch tính cùng tay trộm trang sức khét tiếng quốc tế Mèo Đen... Ben giờ đã dần quen với cuộc sống vắng bóng bà nội kính yêu.\n\nẤy thế nhưng, một loạt báu vật lại bốc hơi giữa đêm đen!\n\nVà mọi dấu vết đều chỉ về phía người bà ĐÃ KHUẤT của Ben.\n\nLiệu có thể nào bà nội găngxtơ đã trở lại?\n\nNối tiếp một siêu phẩm đã thành công vang dội, David Walliams tiếp tục lôi kéo thêm những người hâm mộ mới vào biệt đội hàng triệu những độc giả đã yêu mến Bà nội găng xtơ.\n\nDavid Walliams là danh hài, diễn viên người Anh và là một trong những tác giả sách thiếu nhi thành công nhất mọi thời đại. Gia tài sách của ông được dịch ra hơn 50 thứ tiếng và bán được hơn 50 triệu bản trên toàn cầu. Ông từng giành nhiều giải thưởng danh giá trong nhiều năm với các tác phẩm được giới chuyên môn đánh giá cao. Ông được mệnh danh là \"người kế vị xứng tầm\" của Roald Dahl - người kể chuyện cho trẻ em vĩ đại nhất thế kỷ 20.\n\nNhững tác phẩm của David Walliams đã được xuất bản:\n\n- Cậu bé mặc váy\n\n- Nhóc tì tỷ phú\n\n- Ông thối hoắc\n\n- Bà bác khủng khiếp\n\n- Quái vật băng\n\n- Băng đảng nửa đêm\n\n- Bố xấu, bố tốt\n\n- Ông nội vượt ngục\n\n- Bà nội Găngxtơ\n\n- Bánh mì kẹp chuột\n\n- Lũ trẻ hư nhất quả đất 1 + 2 + 3\n\n- Gấu trúc mứt cam\n\n- Hà mã lên mặt trăng\n\n- Nhóc gấu thích hù\n\n- Cậu voi phiền phức',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 20k'),
     29, 10, '2024-01-14', '2024-01-14', 1),
     
    ('Chàng chó!', 
     'Yoko Tawada', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Phụ Nữ'),
     2024, '20.5 x 14.5 x 0.8 cm', 300, 144, 'Bìa mềm', 115000,
     '“Chàng chó” mang đến một câu chuyện đầy tính siêu thực, pha trộn giữa hiện thực và huyền ảo. Truyện được đặt trong bối cảnh ở vùng ngoại ô Tokyo, kể về mối quan hệ kỳ lạ giữa Iinuma, một người đàn ông kỳ lạ giống chó và cô giáo Kitamura Mitsuko. Điều bất ngờ là câu chuyện cổ tích Mitsuko kể đã trở thành sự thật khi Iinuma Taro – một người đàn ông kỳ lạ, bí ẩn – xuất hiện, làm đảo lộn hoàn toàn cuộc sống của cô.\n\nNgoài “Chàng chó”, có thêm “Bản nguyên”,  “Bản nguyên” cho thấy một Tawada đa sắc, không chấp nhận một trói buộc nào, giới hạn nào làm tàn tạ hay thu hẹp đời sống. Đời sống là một con đường mở.\n\nTrong “Bản nguyên”, Michiko và em trai Kazuo cùng tới Đức du học.  Nhân vật của Tawada có thể là du khách, sinh viên đi du học... bị buộc phải lang thang trong khoảng trống giữa các ngôn ngữ, nơi ý nghĩa của trải nghiệm đời thường hàng ngày trở nên trơn trượt và kỳ lạ…\n\n“Yoko Tawada lôi cuốn ta đến cảnh giới ngôn từ viễn tưởng, huyền thoại và phản địa đàng của bà bằng cách đẩy ta đi xa, đẩy ta lạc bước, xô ta rơi vào đồng thoại dân gian lẫn truyện kể siêu hiện đại, phóng ta vào bên trong một đường ngầm hay đường ngầm của bên trong mọi thứ, nhất là bên trong chính ta. Để đến một nơi rất đẹp rất thơ mà cũng có thể rất nhơ nhớp rất tục. Mở trang sách Tawada là mở ra thế giới như nó vẫn vậy và như nó có thể tới, có thể hiện thành, thế giới đó kỳ lạ và nghịch lý như một công án mà sao vẫn quen thuộc đến ngỡ ngàng.” – Nhà nghiên cứu Nhật Chiêu\n\n“Thế nên, người ta mới cho rằng Tawada, người rất nhạy bén với bản chất siêu thực cơ bản của thực tế, là hậu duệ trực hệ của những nhà viết truyện có tính chất ngụ ngôn châu Âu thế kỷ XIX và XX. Gogol có thể cảm thấy bà như một người bạn tâm giao; và Bruno Schulz cũng vậy, với khả năng tiếp nhận kỳ diệu của ông trước sự kỳ lạ ẩn náu trong cuộc sống gia đình bình thường. Nhưng nếu để so sánh thì không có gì có thể nghi ngờ, Kafka là người tương hợp nhất với bà, người mang trong mình tình yêu của sự nghịch lý và phi lý. Các nhân vật của Tawada có thể được ví như phiên bản đương đại của những con người tìm kiếm tuyệt vọng trên trang văn Kafka, bị ném vào một thế giới đa văn hóa, đa ngôn ngữ.” – Nhà văn Robert Anthony Siegel, Khoa Viết sáng tạo, Đại học North Carolina Wilmington',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 20k'),
     29, 110, '2024-12-14', '2024-12-14', 1),
     
    ('Showbiz Là Của Tôi - Tập 3', 
     'Xuân Đao Hàn', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Văn Học'),
     2024, '24 x 17 x 2.2 cm', 300, 416, 'Bìa mềm', 222000,
     'Sau bao nỗ lực, cuối cùng Hứa Trích Tinh đã có thể giúp idol mình yêu thương mở lòng đón nhận thế giới này. Không chỉ giúp anh dần thoát khỏi bóng tối bi thương, Hứa Trích Tinh còn thành công hơn nữa khi trở thành bạn gái của anh, khiến cả hai cùng nhau bước vào một thế giới mới tràn ngập niềm vui và yêu thương. \n\nThế nhưng, cùng với hạnh phúc mà cô tìm thấy bên Sầm Phong, những ám ảnh từ quá khứ lại âm thầm trở lại, đeo đuổi và dày vò tâm trí Hứa Trích Tinh. \n\nSầm Phong sẽ lựa chọn ở bên cô hay bi kịch của quá khứ lại tái diễn?\n\nLiệu rằng nỗi đau của kiếp trước có hóa thành niềm vui bù đắp cho hai người tại kiếp này không?',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 20k'),
     29, 10, '2024-11-12', '2024-11-12', 1),

    ('Sau Cánh Cửa Khóa Kín', 
     'Freida McFadden', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Văn Học'),
     2024, '20.5 x 14.5 x 1.8 cm', 250, 360, 'Bìa mềm', 162000,
     'Khi ngoan ngoãn làm bài tập về nhà trong phòng riêng của mình, có bé Nora Davis 11 tuổi không hề biết bố mình đã tra tấn và giết hại biết bao phụ nữ trong tầng hầm của căn nhà, cho tới ngày cảnh sát ập tới khám xét.\n\nNhiều năm sau, khi cha của Nora đã bị kết tội và chịu án trong tù, Nora đã trở thành một bác sĩ phẫu thuật thành công với cuộc đời bình lặng và cô độc. Không ai hay biết cha của vị bác sĩ phẫu thuật nổi tiêngs là kẻ giết người hàng loạt. Và cô cũng không muốn để ai biết được sự thật này.\n\nNhưng rồi Nora phát hiện ra một trong những nữ bệnh nhân trẻ tuổi của mình đã bị sát hại, theo cái cách man rợ và kinh hoàng mà cha cô đã giết những người phụ nữ năm đó.\n\nCó người đã biết được bí mật của Nora. Có người muốn cô phải chịu tội thay cha vì những tội ác ông ta gây ra. Nhưng cô không phải kẻ điên cuồng như cha cô. Cô thông minh hơn ông ta nhiều chứ. Cảnh sát sẽ không có bằng chứng nào buộc tôi cô được. Cô đảm bảo như vậy.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 20k'),
     29, 10, '2024-12-14', '2024-12-14', 1);

-- Insert hình ảnh
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    -- Hình ảnh cho "Bà Nội Găngxtơ!"
    ((SELECT b_id FROM books WHERE title = 'Bà Nội Găngxtơ!'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/ba-noi-gangxto-tai-xuat.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Bà Nội Găngxtơ!'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/ba-noi-gangxto-tai-xuat-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Bà Nội Găngxtơ!'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/ba-noi-gangxto-tai-xuat-mockup.jpg', 0),

    -- Hình ảnh cho "Nỗi Đau Của Chàng Werther (Tái bản năm 2024)"
    ((SELECT b_id FROM books WHERE title = 'Nỗi Đau Của Chàng Werther (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/noi-dau-cua-chang-werther.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Nỗi Đau Của Chàng Werther (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/noi-dau-cua-chang-werther-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Nỗi Đau Của Chàng Werther (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/noi-dau-cua-chang-werther-mockup.jpg', 0),

    -- Hình ảnh cho "Chàng chó!"
    ((SELECT b_id FROM books WHERE title = 'Chàng chó!'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/chang-cho.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Chàng chó!'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/chang-cho-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Chàng chó!'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/chang-cho-mockup.jpg', 0),

    -- Hình ảnh cho "Showbiz Là Của Tôi - Tập 3"
    ((SELECT b_id FROM books WHERE title = 'Showbiz Là Của Tôi - Tập 3'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/showbiz-la-cua-toi-tap-3.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Showbiz Là Của Tôi - Tập 3'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/showbiz-la-cua-toi-tap-3-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Showbiz Là Của Tôi - Tập 3'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/showbiz-la-cua-toi-tap-3-mockup.jpg', 0),

    -- Hình ảnh cho "Sau Cánh Cửa Khóa Kín"
    ((SELECT b_id FROM books WHERE title = 'Sau Cánh Cửa Khóa Kín'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/showbiz-la-cua-toi-tap-3.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Sau Cánh Cửa Khóa Kín'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/showbiz-la-cua-toi-tap-3-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Sau Cánh Cửa Khóa Kín'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/showbiz-la-cua-toi-tap-3-mockup.jpg', 0);
    
-- Insert thông tin cho "Chim Sẻ Serafino Và Những Chuyến Ngao Du Kì Thú"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Chim Sẻ Serafino Và Những Chuyến Ngao Du Kì Thú', 
     'Angelo Petrosino, Sara Not', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Kim Đồng'),
     2024, '20.5 x 16.5 x 1 cm', 230, 172, 'Bìa mềm', 90000,
     'Những chuyến phiêu lưu của một chú chim sẻ non quả cảm và nhiệt huyết. Chú trò chuyện với con người, lắng nghe họ để khám phá thế giới cùng những bí mật lạ thường của cuộc sống.\n\nSẻ con Serafino sống trên cây đoạn và háo hức rời tổ để khám phá thế giới. Nhưng bắt đầu từ đâu nhỉ?\n\nTrước cây đoạn có tòa chung cư sáu tầng. Ai sống sau những khung cửa sổ kia? Ai ra ban công để ngắm phố phường? Chắc chắn trong những căn hộ kia có nhiều chuyện cần khám phá, và có lẽ cả những bí ẩn phải tìm hiểu nữa.\n\nQuyết định rất nhanh. Dũng cảm và tò mò, Serafino quyết sáng tỏ những gì mình chưa biết.\n\nMỗi ngày chú sẽ gặp một người để nghe họ kể về những mong muốn, ước mơ, kỉ niệm và những điều hối tiếc.\n\nNhưng sau mỗi khám phá, Serafino lại cảm thấy vẫn còn chưa đủ. Chú sẽ phải bay tiếp, tới những khu vườn và công viên ở dưới chân đồi, bên bờ một con sông lớn. Và chú sẽ còn khám phá ra những điều ngày càng lớn lao hơn.\n\nThông tin tác giả\n\nTÁC GIẢ ANGELO PETROSINO\n\nNhà giáo, nhà báo, dịch giả, chủ nhiệm tờ “Il Giornale dei Bambini” dành cho trẻ em. Hiện nay, ông là cộng tác viên và cố vấn tòa soạn của tạp chí “Pagine Giovani”. Đã có hơn ba mươi năm sáng tác cho trẻ em, ông nổi tiếng và được yêu thích với Valentina, nhân vật chính của hơn một trăm cuốn sách. Bộ truyện “Những cuộc phiêu lưu của cô mèo Ludovica” đã xuất bản của ông cũng do Sara Not minh họa.\n\nHỌA SĨ SARA NOT\n\nCộng tác với nhiều nhà xuất bản lớn của Italia và với một số nhà xuất bản nước ngoài. Những bức vẽ của bà luôn tươi mới, dí dỏm và khác thường. Bà là mẹ của hai con nhỏ, một con mèo và một con chó Chihuahua. Khu vườn của họ là nơi trú ngụ của mòng biển, ác là, quạ, sáo, hoét cổ đỏ và lũ chim sẻ như Serafino. Ơn giời, tất cả đều tự do.', 
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     29, 11, '2024-10-12', '2024-10-12', 1);

-- Insert hình ảnh cho "Chim Sẻ Serafino Và Những Chuyến Ngao Du Kì Thú"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Chim Sẻ Serafino Và Những Chuyến Ngao Du Kì Thú'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/chim-se-serafino.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Chim Sẻ Serafino Và Những Chuyến Ngao Du Kì Thú'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/chim-se-serafino-p01.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Chim Sẻ Serafino Và Những Chuyến Ngao Du Kì Thú'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/chim-se-serafino-p02.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Chim Sẻ Serafino Và Những Chuyến Ngao Du Kì Thú'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/chim-se-serafino-p03.jpg', 0);

-- Insert thông tin cho "Carrie - Vũ Hội Đẫm Máu"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Carrie - Vũ Hội Đẫm Máu!', 
     'Stephen King', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Hội Nhà Văn'),
     2024, '20.5 x 14 x 1.6 cm', 400, 316, 'Bìa mềm', 146000,
     'Carrie White là một cô gái đáng thương, ở trường thì bị bạn bè bắt nạt và biến thành trò cười một cách tàn nhẫn, ở nhà thì phải chịu đựng bà mẹ cuồng tín đến bệnh hoạn. Nhưng có một điều không một ai bên ngoài căn nhà của Carrie biết, đấy là cô có niệm lực bẩm sinh có thể dịch chuyển mọi thứ chỉ bằng ý nghĩ. Khi buổi vũ hội cuối cấp đến gần, những kẻ bắt nạt Carrie bày ra một trò chơi khăm độc địa mà không hề nhận ra mình đang châm ngòi một quả bom khủng khiếp.\n\nKhông chỉ đơn thuần là một cuốn tiểu thuyết kinh dị máu me, Carrie còn được ghi nhận ở sự sáng tạo của Stephen King trong việc tạo ra một lối dẫn truyện kết hợp giữa lời kể thông thường với những mẩu phỏng vấn, các bài báo, sách nghiên cứu. Cách làm này của King đặc biệt mới lạ vào thời điểm đó, nó khiến người đọc cảm thấy câu chuyện kinh hoàng trong cuốn sách trên tay không diễn ra ở một thế giới tưởng tượng xa vời nào đó, mà là ngay gần kề mình, chỉ cần hé cửa là sẽ thấy nó. King không tạo ra một thế giới đáng sợ, mà ông khiến chính thể giới chúng ta trở nên đáng sợ khủng khiếp.\n\nSTEPHEN KING (21/09/1947) là tác giả nổi tiếng người Mỹ. Ông được mệnh danh là “Ông hoàng Kinh dị” với gia tài sách đã xuất bản gồm 63 tiểu thuyết, 5 cuốn phi hư cấu cùng 11 tuyển tập truyện ngắn. Sách của ông đã bán được hơn 350 triệu bản và rất nhiều lần được dựng thành phim. Ông từng nhận giải thưởng Bram Stokcer, giải thưởng World Fantasy (Văn học kỳ ảo Quốc tế) và giải thưởng British Fantasy Society (Hội Văn học kỳ ảo Anh Quốc). Năm 2003, ông được trao huy chương của National Book Foundation (Quỹ sách Quốc gia) vì những đóng góp đặc biệt cho văn học Mỹ.\n\nCarrie là tiểu thuyết đầu tay của Stephen King, xuất bản lần đầu năm 1974 và nhanh chóng trở thành cuốn sách bán rất chạy. Đây không chỉ là cuốn sách mở đầu văn nghiệp mênh mông của tác giả, mà còn giúp hồi sinh dòng văn học kinh dị và để lại nhiều ảnh hưởng lên các thế hệ tác giả về sau.', 
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     23, 1, '2024-10-15', '2024-10-15', 1);

-- Insert hình ảnh cho "Carrie - Vũ Hội Đẫm Máu"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Carrie - Vũ Hội Đẫm Máu!'), 'https://nhasachphuongnam.com/images/thumbnails/730/900/detailed/293/vu-hoi-dam-mau.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Carrie - Vũ Hội Đẫm Máu!'), 'https://nhasachphuongnam.com/images/thumbnails/730/900/detailed/293/vu-hoi-dam-mau-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Carrie - Vũ Hội Đẫm Máu!'), 'https://nhasachphuongnam.com/images/thumbnails/900/1112/detailed/293/vu-hoi-dam-mau-mockup.jpg', 0);

-- Insert thông tin cho "Mùa Rễ Ngọt"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Mùa Rễ Ngọt', 
     'Võ Diệu Thanh', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Kim Đồng'),
     2024, '20.5 x 14.5 x 0.6 cm', 155, 128, 'Bìa mềm', 40000,
     'Mẹ của Chuồn Chuồn Ớt qua đời. Chới với vì đau khổ và bị trêu chọc, Chuồn Chuồn Ớt bé nhỏ tự nhắc mình phải vô cảm với đời, bỏ đi lang thang.\n\nTình cờ, Chuồn Chuồn rớt xuống Đìa Miễu. Ở đó có Cố Lộc già nua thông thái, biết thương yêu tất thảy. Có cua Càng Kềnh thô lỗ, ác mồm ác miệng nhưng tâm thiện lành. Có ếch Trớt là ngôi sao thể hình, luôn giúp đỡ bất kì ai cần đến…\n\nTất cả đã cùng cưu mang Chuồn Chuồn Ớt, giúp cô bé vượt qua thời gian khó khăn, tìm ý nghĩa cuộc sống mới.\n\nMùa rễ ngọt là câu chuyện đậm chất miền Tây nghĩa tình. Với lời văn gần gũi, giàu tình cảm và sống động của nhà văn Võ Diệu Thanh, thế giới sông nước của xóm Đìa Miễu sẽ khó phai mờ trong tâm trí bạn đọc.\n\n“Lúc đó Chuồn Chuồn Ớt nhìn thấy hai cây lúa nhỏ.\n\n- Chèn ơi, hai đứa nhỏ dễ thương quá. Ước gì ta có được đứa con như vậy. Một bông lúa liền cầu khẩn:\n\n- Chuồn Chuồn làm má của con đi. Con rất cần vòng tay ấm áp của má. Con cần tiếng nói thân thương chân tình của má. Con cần tấm lòng rộng như biển của má…”\n\nTÁC PHẨM DỰ GIẢI THƯỞNG VĂN HỌC KIM ĐỒNG LẦN THỨ NHẤT 2023-2025".', 
     NULL,
     23, 1, '2024-01-15', '2024-01-15', 1);

-- Insert hình ảnh cho "Mùa Rễ Ngọt"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Mùa Rễ Ngọt'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/mua-re-ngot.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Mùa Rễ Ngọt'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/mua-re-ngot-p01.jpg', 0);

-- Insert thông tin cho "Hành Trình Người Viết"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Hành Trình Người Viết - Cấu Trúc Thần Thoại Kinh Điển Trong Sáng Tác (Ấn bản kỷ niệm 25 năm)', 
     'Christopher Vogler', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Thế Giới'),
     2024, '23.5 x 15.5 x 2.8 cm', 570, 552, 'Bìa mềm', 332100,
     '“Một trong những quyển sách về nghề viết hay nhất mọi thời đại.” (James Clear, tác giả quyển Atomic Habits)\n\nHành Trình Người Viết trình bày một phương pháp kể chuyện gồm mười hai bước rất chi tiết, dựa trên thần thoại cổ đại. Trước đây, Joseph Campbell cũng đã phát hiện những câu chuyện thần thoại đều theo một hình thức chung về cốt truyện. Phương pháp của Christopher Vogler đã áp dụng những phát hiện này của Campbell vào cách kể chuyện hiện đại.\n\nQuyển sách sẽ chỉ ra: Hành trình Anh Hùng thật ra là sự tái diễn giải theo cách mới mẻ hơn về những hình mẫu từ thời cổ đại khắc họa cách mà các nhân vật, trải dài từ con người tầm thường, cho đến thánh thần, vua chúa, hay siêu anh hùng, đương đầu với khó khăn, đối đầu với những thế lực chết chóc, hủy diệt không gì cản nổi. Như trong Biệt Đội Siêu Anh Hùng, Thanos đã quét sạch phân nửa dân số vũ trụ chỉ với một cái búng tay. Hay như trong Trò Chơi Vương Quyền, khi Dạ Đế dẫn binh đoàn thây ma kinh hoàng xâm chiếm lục địa. Sau cùng thì cái chết luôn luôn chiến thắng, chúng là kẻ thù kinh hoàng bậc nhất, nhưng các câu chuyện luôn ẩn chứa niềm tin rằng loài người là những chiến binh ngoan cường chẳng kém, và đôi lúc họ có thể xoay chuyển cục diện, trở thành Anh Hùng trong thời khắc huy hoàng.\n\nThông tin tác giả\n\nChristopher Vogler (1949)\n\nLà một trong những nhà tư vấn câu chuyện hàng đầu của Hollywood, từng cộng tác với những hãng phim lớn như 20th Century Fox, Walt Disney, Paramount.\n\nTham gia phát triển kịch bản nhiều phim hoạt hình nổi tiếng của Disney như Aladdin, The Lion King…\n\nLà chủ tịch của Storytech, một công ty tư vấn, đánh giá kịch bản, tiểu thuyết và ý tưởng, giúp các nhà văn, nhà sản xuất và giám đốc hãng phim định hình dự án.\n\nDịch giả Trần Minh (1985)\n\nNhà sáng lập Bột Creative Hub, biên kịch, dịch giả, tác giả sách, nhà báo.\n\nCác tác phẩm tiêu biểu:\n\n• Mike Tyson – Sự Thật Trần Trụi (dịch năm 2017), Cristiano & Leo – Khổ Luyện & Thiên Tài (dịch năm 2020), Vẫy Vùng Giữa Vũng Lầy (dịch năm 2021), Lưỡi Lam Lẳng Lơ (dịch năm 2022)…\n\n• Phim Tiệc Trăng Máu (viết năm 2020), phim Mai (viết năm 2024)…\n\n• Sài Gòn Hay Ta! (Xuất bản cùng Thăng Fly năm 2022).', 
     NULL,
     15, 3, '2024-10-15', '2024-10-15', 1);

-- Insert hình ảnh cho "Hành Trình Người Viết"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Hành Trình Người Viết - Cấu Trúc Thần Thoại Kinh Điển Trong Sáng Tác (Ấn bản kỷ niệm 25 năm)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/hanh-trinh-nguoi-viet.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Hành Trình Người Viết - Cấu Trúc Thần Thoại Kinh Điển Trong Sáng Tác (Ấn bản kỷ niệm 25 năm)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/296/hanh-trinh-nguoi-viet-b04.jpg', 0);

-- Insert thông tin sách "Một Thử Nghiệm Phê Bình"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Một Thử Nghiệm Phê Bình', 
     'C. S. Lewis', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Thế Giới'),
     2024, '20.5 x 14 x 1 cm', 300, 207, 'Bìa mềm', 95000,
     '\"Một thử nghiệm phê bình\" là tác phẩm quan trọng của C.S. Lewis được xuất bản vào năm 1961. Trong bối cảnh có quá nhiều lý thuyết cực đoan về việc đọc và giá trị của sách, ông đã đưa ra một quan điểm hoàn toàn khác biệt.\n\nTheo đó, không có cái gọi là tác phẩm \"cao cấp\" \"phổ thông\", giá trị của tác phẩm đơn thuần nằm ở niềm vui đọc. Một độc giả đích thực sẽ điềm tĩnh bước theo sự dẫn dắt của câu chữ, không vội xét đoán phê bình. Hành động đọc chỉ trở nên thông suốt nếu ta gạt bỏ những kỳ vọng và giá trị không liên quan đến tác phẩm. Trải nghiệm đọc chỉ có giá trị nếu ta say mê nghiền ngẫm lại từng chương đoạn để tìm thấy những gợi mở mới mẻ. Quan trọng hơn cả, cũng như đối với các vấn đề lân lý, tôn giáo và tình yêu, việc đọc đòi hỏi ta phải bước ra khỏi trải nghiệm của riêng mình để bước vào trải nghiệm của những chủ đề khác.\n\n\"Một thử nghiệm phê bình\" được viết bằng giọng văn chân phương, gần gũi như chính tư tưởng xuyên suốt của C.S.Lewis: mời gọi độc giả bước vào địa hạt phê bình tưởng chông gai nhưng lại đầy thông sáng\"\n\nThông tin tác giả\n\nC. S. LEWIS (1898-1963) là tiểu thuyết gia, thi sĩ, nhà phê bình văn học, nhà thần học... nổi tiếng người Anh. Ông từng giữ ghế giáo sư Văn học Anh thời Trung cổ và Phục hưng của Đại học Cambridge và được coi là một học giả lỗi lạc của thế kỷ 20, với những tư tưởng đầy sức ảnh hưởng về các vấn đề. Các tác phẩm của Lewis đã được dịch sang hơn 30 ngôn ngữ và bán được hàng triệu bản, trong đó được biết đến rộng rãi nhất là bộ sách 7 tập dành cho thiếu nhi \"Biên niên sử Narnia\"',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     54, 10, '2024-03-01', '2024-03-01', 1);

-- Insert hình ảnh cho sách "Một Thử Nghiệm Phê Bình"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Một Thử Nghiệm Phê Bình'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/294/mot-thu-nghiem-phe-binh.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Một Thử Nghiệm Phê Bình'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/294/mot-thu-nghiem-phe-binh.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Một Thử Nghiệm Phê Bình'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/294/mot-thu-nghiem-phe-binh-mockup.jpg', 0);

-- Insert thông tin sách "Lĩnh Nam Chích Quái: Khảo Luận - Dịch Chú Nguyên Bản Chữ Hán"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Lĩnh Nam Chích Quái: Khảo Luận - Dịch Chú Nguyên Bản Chữ Hán', 
     'Nguyễn Thị Oanh', 
     (SELECT category_id FROM categories WHERE category_name = 'Văn Học'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Khoa Học - Xã Hội'),
     2024, '24 x 16 x 4 cm', 300, 720, 'Bìa cứng', 789000,
     'Lĩnh Nam chích quái là tác phẩm ghi chép truyện cổ Việt Nam được viết bằng chữ Hán, Nôm ra đời vào thời Lý-Trần. Sách gồm 2 quyển, 22 truyện. Không rõ tác giả, tương truyền là Trần Thế Pháp. Cũng như Việt điện u linh, Lĩnh Nam chích quái được coi là một trong tác phẩm văn xuôi tự sự cổ nhất của Việt Nam còn lưu lại cho tới ngày nay. Ngay từ khi ra đời, tác phẩm không chỉ chiếm được tình cảm của các tác gia thời trung đại thể hiện qua hàng chục văn bản mang tên Lĩnh Nam chích quái hiện còn, mà còn hấp dẫn đối với các nhà nghiên cứu văn học trung đại ngày nay qua rất nhiều công trình nghiên cứu có giá trị về Lĩnh Nam chích quái.\n\nChuyên luận Lĩnh Nam chích quái (Khảo luận - Dịch chú – Nguyên bản chữ Hán) được hoàn chỉnh và bổ sung trên cơ sở Luận án Tiến sĩ Ngữ văn với nhan đề: Nghiên cứu văn bản Lĩnh Nam chích quái do Nguyễn Thị Oanh thực hiện, GS.TS. Nguyễn Ngọc San và cố PGS. Đặng Đức Siêu hướng dẫn, được Hội đồng Quốc gia chấm luận án Trường Đại học Sư phạm Hà Nội thông qua vào ngày 22 tháng 10 năm 2005.\n\nChuyên luận Lĩnh Nam chích quái tập trung nghiên cứu các bản Lĩnh Nam chích quái hiện đang được lưu trữ tại các Thư viện ở Hà Nội. Với quan điểm coi tất cả các bản Lĩnh Nam chích quái còn lại là đối tượng cần được khảo cứu và xem xét kỹ lưỡng, đặc biệt mối quan hệ \"bà con\" giữa chúng, công trình đã tập trung so sánh, đối chiếu và phân loại Lĩnh Nam chích quái thành các nhóm bản; đi sâu tìm hiểu kỹ nhóm bản Lĩnh Nam chích quái được các nhà nghiên cứu đi trước coi là cổ, xác định bản cổ và phác họa quá trình truyền bản của Lĩnh Nam chích quái. Đi sâu lý giải một số đặc điểm ngôn ngữ Hán văn và đặc điểm nội dung trong tác phẩm, so sánh với một số tác phẩm Hán văn thời Lý-Trần.\n\nVề bố cục, chuyên luận gồm 3 phần:\n\nPhần I: Nghiên cứu văn bản Lĩnh Nam chích quái;\nPhần II: Phụ lục;\nPhần III: Nguyên bản chữ Hán.\n\nỞ Phần I, ngoài Lời dẫn và phần Mở đầu, Kết luận, chuyên luận chia làm 5 chương:\n\nChương 1: Văn bản học Hán Nôm và văn bản Lĩnh Nam chích quái - Một vài nhận định;\nChương 2: Phân loại và phác họa quá trình truyền bản của Lĩnh Nam chích quái;\nChương 3: Một số đặc điểm ngôn ngữ của tác phẩm.\nChương 4: Địa danh trong Lĩnh Nam chích quái A.2914;\nChương 5: Một số đặc điểm về nội dung của tác phẩm.\n\nPhần Phụ lục II gồm Dịch nghĩa - Khảo dị - Chú thích bản Lĩnh Nam chích quái liệt truyện A.2914. Tiếp đó là bảng thống kê Địa danh, Nhân danh.\n\nPhần Phụ lục III gồm nguyên bản chữ Hán LNCQ A.2914 hiện lưu giữ tại Viện Nghiên cứu Hán Nôm.\n\n“Tác giả đã lược bỏ một số thao tác trường ốc của một luận án để tập trung vào những thao tác học thuật cần có đối với một công trình khảo cứu dịch thuật trong đó có sự khảo sát tất cả văn bản Lĩnh Nam chích quái hiện có, tìm hiểu tình hình nghiên cứu Lĩnh Nam chích quái, củng cố hệ thống thao tác văn bản học cần có để tiến tới lựa chọn hiệu đính xác định một văn bản tương đối chuẩn và tiếp theo là công việc dịch thuật, chú giải. Trong công trình này có sự mở rộng kiến thức về mối quan hệ giữa Lĩnh Nam chích quái với các thư tịch Hán Nôm liên quan đến văn học dân gian có các truyền thuyết và ít nhiều có sự liên hệ so sánh Lĩnh Nam chích quái của Việt Nam với Nhật Bản linh dị ký của Nhật Bản để giúp độc giả thoáng thấy bóng dáng của tính chất đồng văn của văn hoá Việt-Nhật trong văn hoá Đông Á.” — Giáo sư, Nhà giáo nhân dân Nguyễn Đình Chú, Trường Đại học Sư phạm Hà Nội"',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     54, 10, '2024-03-01', '2024-03-01', 1);
     
-- Insert hình ảnh cho sách "Lĩnh Nam Chích Quái: Khảo Luận - Dịch Chú Nguyên Bản Chữ Hán"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Lĩnh Nam Chích Quái: Khảo Luận - Dịch Chú Nguyên Bản Chữ Hán'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/293/linh-nam-chich-quai.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Lĩnh Nam Chích Quái: Khảo Luận - Dịch Chú Nguyên Bản Chữ Hán'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/293/linh-nam-chich-quai-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Lĩnh Nam Chích Quái: Khảo Luận - Dịch Chú Nguyên Bản Chữ Hán'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/293/linh-nam-chich-quai-mockup.jpg', 0);

-- Insert thông tin sách "The Exorcist - Quỷ Ám"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('The Exorcist - Quỷ Ám', 
     'William Peter Blatty', 
     (SELECT category_id FROM categories WHERE category_name = 'Văn Học'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Thanh Niên'),
     2024, '20.5 x 13 x 2.8 cm', 580, 560, 'Bìa mềm', 229000,
     '•  Hơn 13 triệu bản sách đã được bán ra tại Mỹ.\n\n•  10 đề cử giải Oscar cho tác phẩm điện ảnh chuyển thể cùng tên.\n\nĐược xuất bản lần đầu vào năm 1971, cho đến tận ngày nay, The Exorcist vẫn là một trong những cuốn tiểu thuyết gây tranh cãi nhất từng được viết và trở thành một hiện tượng văn học. Lấy cảm hứng từ câu chuyện có thật về một đứa trẻ bị quỷ ám vào những năm 1940, William Peter Blatty đã tạo ra một cuốn tiểu thuyết mang tính biểu tượng với nhân vật chính là Regan, cô con gái 11 tuổi của một nữ diễn viên điện ảnh sống ở Washington, D.C.\n\nRegan bỗng dưng thay đổi, từ một đứa trẻ xinh xắn, dễ thương, cô bé trở nên đáng sợ và đột nhiên sở hữu những năng lực kỳ lạ. Regan có thể làm cho đồ vật bay lên, mạnh đến phi thường, luôn mồm văng tục và có một giọng nam đầy ma quái phát ra từ cổ họng cô bé. Lúc đầu, Chris cho rằng đó chỉ là hội chứng tâm lý do ảnh hưởng từ vụ ly hôn của bố mẹ. Nhưng câu chuyện dần đáng sợ hơn khi có người chết ngay dưới cửa sổ phòng cô bé trong bộ dạng cực kỳ thê thảm.\n\nThông tin tác giả\n\nWilliam Peter Blatty là nhà văn, đạo diễn và nhà sản xuất người Mỹ. Ông được biết đến nhiều nhất với cuốn tiểu thuyết The Exorcist xuất bản năm 1971 và kịch bản phim năm 1973 cho bộ phim chuyển thể cùng tên. Blatty đã giành được Giải Oscar cho Kịch bản chuyển thể hay nhất với The Exorcist.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     58, 10, '2024-06-07', '2024-06-07', 1);

-- Insert hình ảnh cho sách "The Exorcist - Quỷ Ám"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'The Exorcist - Quỷ Ám'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/291/quy-am.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'The Exorcist - Quỷ Ám'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/291/quy-am-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'The Exorcist - Quỷ Ám'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/291/quy-am-mockup.jpg', 0);

-- Insert dữ liệu cho sách "39 Cuộc Đối Thoại Tri Thức"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('39 Cuộc Đối Thoại Tri Thức', 
     'Phàn Đăng', 
     (SELECT category_id FROM categories WHERE category_name = 'Văn Học'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Kim Đồng'),
     2024, '20.5 x 14.5 x 2.5 cm', 580, 484, 'Bìa mềm', 150000,
     '39 Cuộc Đối Thoại Tri Thức - Tri Thức Là Để Đối Thoại, Không Phải Để Áp Đặt\n\nĐối thoại là chìa khóa giúp chúng ta mở ra một cánh cửa quan sát thế giới xung quanh. Đối thoại giúp người với người gần nhau hơn, hiểu nhau hơn, hóa giải những hiểu lầm đáng tiếc có thể xuất hiện trong các mối quan hệ. Khi có cái nhìn tôn trọng sự khác biệt, đối thoại mang đến tấm vé đặc biệt phiêu lưu vào tâm trí người khác, sống cùng những ý nghĩ, những bước chân, khám phá những con đường được định hình ở trong đầu người khác.\n\n39 Cuộc Đối Thoại Tri Thức mang đến 39 miền phiêu lưu như thế. Qua 39 cuộc phiêu lưu trong tâm trí của 39 trí thức tới từ nhiều lĩnh vực khác nhau, bạn đọc sẽ phát hiện những “vỉa quặng tri thức” giá trị, góp phần làm giàu thêm cho vốn sống, trải nghiệm, gợi mở tư duy, để trong một khoảnh khắc tương lai nào đó, khi suy ngẫm lại, bạn sửng sốt nhận ra góc nhìn mới mẻ từ những điều mình thu nhận được.\n\n“Tri thức là để đối thoại, chứ không phải để áp đặt, bạn hãy đọc cuốn sách này với tinh thần như vậy nhé!” – chính là điều tác giả Phan Đăng muốn nhắn nhủ thông qua cuốn sách 39 Cuộc Đối Thoại Tri Thức.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     64, 10, '2024-07-07', '2024-07-07', 1);

INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = '39 Cuộc Đối Thoại Tri Thức'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/292/39-cuoc-doi-thoai-tri-thuc.jpg', 1);

-- Insert dữ liệu cho sách "Holly - Tù Nhân Dưới Tầng Hầm"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Holly - Tù Nhân Dưới Tầng Hầm', 
     'Stephen King', 
     (SELECT category_id FROM categories WHERE category_name = 'Văn Học'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Thanh Niên'),
     2024, '24 x 16 x 3.5 cm', 580, 672, 'Bìa mềm', 350000,
     'Khi Penny Dahl gọi điện cho cơ quan thám tử Finders Keepers với hy vọng được giúp đỡ tìm kiếm đứa con gái mất tích của mình, Holly đã miễn cưỡng chấp nhận vụ án. Đối tác của cô lúc ấy, Pete, đang mắc bệnh Covid còn mẹ của cô (một người rất phức tạp) vừa qua đời. Nhưng có điều gì đó trong giọng nói da diết đến tuyệt vọng của bà Penny Dahl đã khiến Holly không thể chối từ.\n\nChỉ cách nơi Bonnie Dahl biến mất vài dãy nhà là nơi ở của Giáo sư Rodney và Emily Harris. Họ là hình mẫu đáng kính: cặp vợ chồng già 80 tuổi, hết lòng vì nhau và dành cả cuộc đời cống hiến cho học thuật và khoa học. Thế nhưng đằng sau vẻ vẻ tôn nghiêm đạo mạo ấy là cả một bí mật khủng khiếp được giấu dưới tầng hầm của ngôi nhà đầy những cuốn sách. Bí mật được ngụy trang khéo léo ấy liệu có liên quan đến sự biến mất của cô gái Bonnie và nhiều người khác… giữa lúc đại dịch COVID đang hoành hành?\n\n------\n\n“Cái tài của King nằm ở khả năng lột tả sự biến đổi khôn lường ở tâm lý nhân vật.” - Cosmopotian\n\n“Stephen King đã làm được điều gì đó đáng kinh ngạc trong cuốn tiểu thuyết mới của mình, H Kỹ năng kể chuyện của King không hề suy giảm một chút nào.” - Tampa Bay Times\n\n“Thành công rực rỡ Holly chắc chắn là ngôi sao sáng tiếp theo.” - Portland Press Herald\n\n“Điều khiến tác phẩm của King trở nên đáng sợ hơn nhiều so với hầu hết các nhà văn kinh dị khác, điều khiến Holly trở thành nỗi kinh hoàng về đêm, không phải là sự tàn ác của ông đối với các nhân vật của mình mà là lòng tốt của ông.” - Flynn Berry, New York Times Book Review\n\nThông tin tác giả\n\nNói đến thể loại văn học kinh dị, có lẽ không ai là không biết đến Stephen King, ông vua của thể loại này. Với hơn 350 triệu đầu sách được bán ra trên toàn thế giới với vô vàn giải thưởng lớn như National Medal of Art, British Fantasy Society Award… Stephen King đã trở thành ông hoàng sách kinh dị cũng như của các tác phẩm chuyển thể.\n\nNhững tác phẩm của King không chỉ đem lại nỗi sợ hãi cá nhân cho người đọc mà còn xây dựng nên cả một nền văn hóa kinh dị cho thế giới. Ông là tác giả duy nhất có hơn 30 cuốn sách từng đứng đầu trong danh sách bán chạy nhất thế giới và cũng là người định nghĩa lại 3 cảm xúc chính trong mảng kinh dị là Kinh hoàng (Terror), Ghê rợn (Horror) và Khiếp sợ (Revulsion). Quan điểm người sáng tác có thể điều khiển tâm trí độc giả để tạo ra những cảm xúc sợ hãi khiến các tác phẩm của ông luôn thu hút được số lượng bạn đọc đông đảo.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     61, 0, '2024-08-07', '2024-08-07', 0);

INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Holly - Tù Nhân Dưới Tầng Hầm'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/290/holly-tu-nhan-duoi-tang-ham.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Holly - Tù Nhân Dưới Tầng Hầm'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/290/holly-tu-nhan-duoi-tang-ham-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Holly - Tù Nhân Dưới Tầng Hầm'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/290/holly-tu-nhan-duoi-tang-ham-mockup.jpg', 0);

-- Insert dữ liệu cho sách "Mỗi Từ Là Một Chú Chim Đang Chờ Ta Dạy Hót"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Mỗi Từ Là Một Chú Chim Đang Chờ Ta Dạy Hót', 
     'Daniel Tammet', 
     (SELECT category_id FROM categories WHERE category_name = 'Văn Học'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Trẻ'),
     2024, '20.5 x 14.5 x 1.6 cm', 381, 328, 'Bìa mềm', 160000,
     'Vì sao tên gọi “Cleopatra” không được phép sử dụng ở Iceland? Vì sao đồng hồ “nói chuyện” với người Nahua ở Mexico? Và nếu như chúng ta là những gì mà chúng ta ăn, thì có phải chúng ta cũng là những gì mà chúng ta nói không? Đó chỉ là một vài câu hỏi mà Daniel Tammet sẽ giải đáp trong tuyển tập các bài viết rất cuốn hút này, trong đó anh sẽ cùng chúng ta tìm hiểu những khía cạnh tinh tế và sức mạnh vô cùng của ngôn ngữ con người. Từ nghệ thuật dịch cho đến tính trữ tình đáng ngạc nhiên trong ngôn ngữ ký hiệu, cuốn sách Mỗi từ là một chú chim đang chờ ta dạy hót là một hành trình lý thú xuyên qua thế giới của từ ngữ, chữ viết, những câu chuyện và ý nghĩa, đồng thời cũng là một bằng chứng tuyệt vời cho tài năng văn chương và đa ngôn ngữ xuất sắc của Tammet.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     61, 10, '2024-09-07', '2024-09-07', 1);

INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Mỗi Từ Là Một Chú Chim Đang Chờ Ta Dạy Hót'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/289/moi-tu-la-mot-chu-chim-dang-cho-ta-day-hot.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Mỗi Từ Là Một Chú Chim Đang Chờ Ta Dạy Hót'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/289/moi-tu-la-mot-chu-chim-dang-cho-ta-day-hot-b04.jpg', 0);

-- Insert dữ liệu cho sách "Trước Nhà Có Cây Hoàng Mai"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Trước Nhà Có Cây Hoàng Mai: Những Ghi Chép Về Huế', 
     'Minh Tự', 
     (SELECT category_id FROM categories WHERE category_name = 'Văn Học'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Phụ Nữ'),
     2024, '21 x 14 x 1.5 cm', 244, 220, 'Bìa mềm', 130000,
     'Trước nhà có cây hoàng mai: Những ghi chép về Huế - xứ sở phong rêu kiêu sa (tái bản lần thứ nhất có bổ sung và chỉnh sửa) là tập ghi chép về “nước Huế” phong rêu kiêu sa của nhà báo Minh Tự. Hơn ba mươi bài viết của tác giả trong cuốn sách sách hầu hết được viết vào những năm 2000 - 2002, khi anh từ Đà Lạt trở về quê hương sau gần 10 năm tha phương; và trong lần tái bản này, tác giả có cập nhật, chỉnh sửa các bài viết cho hoàn thiện thêm, cùng hình ảnh minh họa sinh động. Tập ghi chép đã khắc họa đậm nét văn hóa, lối sống của người Huế dưới các góc nhìn khác nhau, từ chuyện ăn theo lối Huế, chuyện cơm hến, mè xửng, tô bún bò đến đường kim mũi chỉ, vành nón bài thơ, gốc mai lão trượng hay phiên chợ mà với tác giả, đó là “lối Huế”. Còn nhà văn Hoàng Phủ Ngọc Tường thì cho rằng lối sống ấy là “tính cách Huế”, với biểu hiện: “thích sống văn hóa hơn là hưởng thụ vật chất, thích sống đẹp hơn là sống giàu có”.\n\nNhà văn Vĩnh Quyền nói: “Trước nhà có cây hoàng mai của Minh Tự mang dấu ấn một thời sống bên ngoài Huế và cách nhìn - nghĩ của nghề báo, làm nên sự khác biệt với những tác giả viết về Huế – khúc ruột của mình – bằng tinh thần cực đoan đáng yêu kiểu ‘không nơi nào có được’ hoặc ‘chẳng thể nào đổi khác’.”\n\nChia sẻ về đứa con tinh thần của mình, tác giả Minh Tự nói: “Những tháng năm tôi được làm một người Huế sống ngoài Huế, và nhờ vậy mới hiểu rõ hơn, một cách khách quan hơn, về bản sắc riêng biệt của xứ sở nà Cuốn sách này xin cùng khám phá nghệ thuật sống của người Huế, dù không thể nói hết muôn màu muôn vẻ của ‘lối Huế’. Nó chỉ là những trạng thái của Huế được chúng tôi ‘đọc’ được và thuật lại bằng cách của một người viết báo.”\n\nĐặc biệt, trong lần tái bản này, Nhà xuất bản Phụ nữ Việt Nam ấn hành Trước nhà có cây hoàng mai bản tiếng Anh với tựa Ochna in the front yard: Fascinating stories about Huế - an ancient, poetic and glamorous land để có thể giới thiệu với bạn đọc ngoại quốc vẻ đẹp kiêu sa, cổ kính của Huế.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     77, 101, '2024-10-07', '2024-10-07', 1);

INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Trước Nhà Có Cây Hoàng Mai: Những Ghi Chép Về Huế'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/truoc-nha-co-cay-hoang-mai_bvl2-ua.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Trước Nhà Có Cây Hoàng Mai: Những Ghi Chép Về Huế'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/truoc-nha-co-cay-hoang-mai-b04_j77x-x8.jpg', 0);

-- Insert dữ liệu cho sách "Những Câu Chuyện Hãi Hùng Và Kì Bí 1 - Lô Số 249"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Những Câu Chuyện Hãi Hùng Và Kì Bí 1 - Lô Số 249', 
     'Arthur Conan Doyle', 
     (SELECT category_id FROM categories WHERE category_name = 'Văn Học'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Phụ Nữ'),
     2024, '22.5 x 14 x 2.5 cm', 491, 504, 'Bìa mềm', 145000,
     '“Khi tôi nhìn lại những sự kiện trong cuộc đời mình, cái đêm kinh hoàng đó sừng sững hiện ra như một cột mốc khổng lồ. Ngay cả bây giờ, sau nhiều năm trời, tôi vẫn chẳng thể nghĩ tới nó mà không khỏi rùng mình.”\n\nArthur Conan Doyle là nhà viết truyện bậc thầy, với thiên hướng đính kèm yếu tố bí ẩn, đáng sợ, và đôi khi là tàn nhẫn trong các tác phẩm hư cấu của mình. Dẫu rằng ở các câu chuyện về vị thám tử lừng danh Sherlock Holmes cũng có một vài khoảnh khắc rất đen tối, nhưng chính những tác phẩm kì ảo mới là nơi ngòi bút sáng tạo bầu không khí lạnh lẽo và ma quái của ông được thoả sức tung hoành.\n\nTuyển tập LÔ SỐ 249 gồm mười sáu truyện ngắn được nhà văn Arthur Conan Doyle sáng tác trong giai đoạn từ cuối những năm 1870 đến năm 1894, hé lộ các đóng góp của ông cho thể loại văn học Gothic thế kỉ mười chín: những bóng ma vùng Cực Bắc vắng bóng mặt trời, xác ướp hiểm ác, linh hồn lang thang trong dinh thự cổ, vũ khí bị ám, và kể cả kẻ sát nhân cuồng loạn…\n\nDù cho thực tế những câu chuyện này đều đã được viết cách đây hơn một trăm năm, nhưng chúng vẫn chưa hề mai một khả năng tạo ra cho người đọc trải nghiệm bứt rứt, bất an khôn nguôi. Luôn luôn tồn tại thứ cảm giác bất định đối với cả độc giả lẫn các nhân vật trung tâm. Chính bản chất của sự e sợ mơ hồ đó khiến ta căng thẳng, lo lắng, và bị cảm giác kinh hãi bao trùm.\n\nĐộc giả thân mến, bạn đã được cảnh báo rồi đấy!\n\nThông tin tác giả\n\nArthur Conan Doyle (1859 - 1930) là một bác sĩ, nhà văn người Scotland. Bên cạnh những câu chuyện về Sherlock Holmes được hậu thế biết đến rộng rãi, các tác phẩm của Doyle trải dài trên nhiều thể loại và đều được đánh giá cao. Ông đã viết một loạt tiểu thuyết lịch sử đáng chú ý, cũng như xuất bản các tác phẩm khoa học viễn tưởng nổi tiếng xoay quanh nhân vật Giáo sư Challenger. Doyle còn thể hiện mình là một nhà văn có tài trong thể loại truyện ngắn kinh dị.\n\nSách cùng tác giả đã phát hành:\n\n- NHỮNG CUỘC PHIÊU LƯU CỦA GIÁO SƯ CHALLENGER (2 tập)\n\nThế giới thất lạc\nVành đai khí độc & những câu chuyện khác\n\n- SHERLOCK HOLMES (6 tập)\n\nCuộc điều tra màu đỏ & Dấu bộ tứ\nNhững cuộc phiêu lưu của Sherlock Holmes\nHồi ức về Sherlock Holmes\nSự trở về của Sherlock Holmes\nCon chó của dòng họ Baskerville & Thung lũng Kinh hoàng\nCung đàn sau cuối & Tàng thư của Sherlock Holmes',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     88, 200, '2024-11-07', '2024-11-07', 1);

INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Những Câu Chuyện Hãi Hùng Và Kì Bí 1 - Lô Số 249'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/lo-so-249.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Những Câu Chuyện Hãi Hùng Và Kì Bí 1 - Lô Số 249'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/lo-so-249-mockup.jpg', 0);
    
-- Insert dữ liệu cho sách "Chuyện Kể Lúc Hoàng Hôn (Tuyển tập truyện ma Charles Dickens)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Chuyện Kể Lúc Hoàng Hôn (Tuyển tập truyện ma Charles Dickens)', 
     'Charles Dickens', 
     (SELECT category_id FROM categories WHERE category_name = 'Văn Học'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Kim Đồng'),
     2024, '22.5 x 14 x 1 cm', 230, 180, 'Bìa mềm', 60000,
     '“Các vị chú ý lời tôi nhé, chuyện có thật. Không phải những gì lấp lánh đều là vàng; nhưng những gì tôi sắp kể là sự thật.”\n\nCharles Dickens dành cả đời mình tìm hiểu về các sự kiện siêu nhiên. Ông luôn có một niềm yêu thích với các câu chuyện ma, đặc biệt là vào dịp Giáng sinh, luôn cởi mở, sẵn sàng tiếp thu và đặt câu hỏi về sự tồn tại của linh hồn. Bản năng hướng về các sự kiện kịch tính, giật gân và rùng rợn khiến ông trở thành một người kể truyện ma xuất chúng của thời đại.\n\nNhững câu chuyện ma dưới đây, một số hài hước, một số quyến rũ, một số lại khiến người khác khó chịu. Nhiều câu chuyện trong số đó đã ảnh hưởng không nhỏ đến những nhà văn nổi tiếng cùng thời như Edgar Allan Poe, M. R. James, Sheridan Le Fanu…\n\n“Tôi không sáng tạo ra nó, tôi thực sự không làm gì ngoài việc nhìn thấy, và viết nó ra.” – CHARLES DICKENS\n\n“Một trong những điều tốt đẹp không thể bỏ qua của Charles Dickens là tài năng kể truyện ma. Ông ấy khao khát điều đó, như độc giả đã từng biết niềm hứng thú của Dickens với các hiện tượng siêu nhiên, mà còn hơn thế nữa, dù có sự kiềm chế mạnh mẽ theo lẽ thường, ông ấy có thể đã rơi vào vòng xoáy tâm linh điên rồ. Vì thế, khía cạnh huyền ảo trong bản năng của ông dừng lại ở những giấc mơ, về những ngày may mắn hoặc những sự trùng hợp trong tự nhiên. Và không có người đàn ông nào sẵn sàng kiểm nghiệm một câu chuyện ma hay một ngôi nhà ma ám… hoàn hảo được như cách ông kể lại.” – JOHN FORSTER, Chuyện đời Charles Dickens\n\nThông tin tác giả\n\nCharles Dickens (1812 – 1870) là một trong những nhà văn vĩ đại nhất nước Anh thế kỉ 19. Ông bắt đầu sự nghiệp sáng tác văn học từ năm 1833 và mau chóng gặt hái được nhiều thành công vang dội.\n\nMột số tác phẩm tiêu biểu: Oliver Twist, Khúc ca mừng Giáng sinh, Những kì vọng lớn lao, David Copperfield…',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     61, 11, '2024-11-07', '2024-11-07', 1);

-- Insert hình ảnh cho sách "Chuyện Kể Lúc Hoàng Hôn"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Chuyện Kể Lúc Hoàng Hôn (Tuyển tập truyện ma Charles Dickens)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/chuyen-ke-luc-hoang-hon.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Chuyện Kể Lúc Hoàng Hôn (Tuyển tập truyện ma Charles Dickens)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/chuyen-ke-luc-hoang-hon.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Chuyện Kể Lúc Hoàng Hôn (Tuyển tập truyện ma Charles Dickens)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/chuyen-ke-luc-hoang-hon-mockup.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Chuyện Kể Lúc Hoàng Hôn (Tuyển tập truyện ma Charles Dickens)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/chuyen-ke-luc-hoang-hon-mockup.jpg', 0);

-- Insert dữ liệu cho sách "Hai Vạn Dặm Dưới Biển (Tái bản năm 2024) (Sách Đinh Tị)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Hai Vạn Dặm Dưới Biển (Tái bản năm 2024) (Sách Đinh Tị)', 
     'Jules Verne', 
     (SELECT category_id FROM categories WHERE category_name = 'Văn Học'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Văn Học'),
     2024, '20.5 x 14.5 x 2.2 cm', 230, 432, 'Bìa mềm', 99000,
     'Tác phẩm nổi tiếng thế giới là kết tinh trí tuệ và tri thức của các tác giả, nó có sức hút bất diệt, ảnh hưởng đến nhiều thế hệ. Tuy nhiên đối với trẻ mà nói, phần lớn những tác phẩm văn học kinh điển nổi tiếng đều rất hấp dẫn và chứa đựng nội dung sâu sắc. Do vậy, chúng tôi đã căn cứ vào lứa tuổi và đặc điểm tâm lý của các em để tiến hành biên soạn lại những tác phẩm văn học kinh điển nổi tiếng.\n\nHai Vạn Dặm Dưới Biển kể về câu chuyện thám hiểm đại dương của giáo sư Aronnax. Thông qua chuyến đi tìm “quái vật trên biển”, cuốn sách miêu tả thế giới rộng lớn dưới đáy đại dương. Ở đó có đồng bằng, rừng rậm, nghĩa địa dưới đáy biển, thế giới châu báu, châu lục và lâu đài cổ bị nhấn chìm… Verne còn dùng ngòi bút thần kỳ của mình tạo ra rất nhiều tình huống nguy hiểm, khiến câu chuyện này càng sinh động và lôi cuốn hơn.\n\nNgôn ngữ bình dị, lời văn mạch lạc, tình tiết sinh động, phù hợp với các em nhỏ, giúp các em cảm nhận được sức hút của văn học và niềm vui. Ngoài ra, chúng tôi còn xen kẽ rất nhiều tranh vẽ minh họa để các em có thể cảm nhận được tác phẩm văn học kinh điển một cách đơn giản và gần gũi nhất.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     61, 11, '2024-11-07', '2024-11-07', 1);

-- Insert hình ảnh cho sách "Hai Vạn Dặm Dưới Biển"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Hai Vạn Dặm Dưới Biển (Tái bản năm 2024) (Sách Đinh Tị)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/294/hai-van-dam-duoi-bien-tb-2024.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Hai Vạn Dặm Dưới Biển (Tái bản năm 2024) (Sách Đinh Tị)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/294/hai-van-dam-duoi-bien-tb-2024-p01.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Hai Vạn Dặm Dưới Biển (Tái bản năm 2024) (Sách Đinh Tị)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/294/hai-van-dam-duoi-bien-tb-2024-p02.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Hai Vạn Dặm Dưới Biển (Tái bản năm 2024) (Sách Đinh Tị)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/294/hai-van-dam-duoi-bien-tb-2024-p03.jpg', 0);

-- Insert dữ liệu cho sách "Tội Phạm Tâm Thần Và Những Lỗ Hổng Công Lý"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Tội Phạm Tâm Thần Và Những Lỗ Hổng Công Lý', 
     'Changwon Pyo', 
     (SELECT category_id FROM categories WHERE category_name = 'Văn Học'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Thanh Niên'),
     2024, '24 x 15.7 x 1.4 cm', 290, 272, 'Bìa mềm', 140000,
     'TỘI PHẠM TÂM THẦN VÀ NHỮNG LỖ HỔNG CÔNG LÝ - Khi đồng tiền trở thành tấm “bùa hộ mệnh” cho ác quỷ.\n\n“Tội phạm tâm thần và những lỗ hổng công lý” là cuốn sổ tay tổng hợp 32 trọng án từng làm rúng động cả xã hội Hàn Quốc. Không chỉ tường thuật nội dung của từng vụ, cuốn sách còn phác họa chân dung những loại tội phạm như: tội phạm hiếp dâm cận huyết, tội phạm giết người thân, tội phạm đa nhân cách… Hầu hết chúng đều mắc các chứng bệnh tâm thần, có khuynh hướng bạo lực hoặc từng trải qua tuổi thơ bất hạnh.\n\nBằng kinh nghiệm làm cố vấn tâm lý tội phạm tại Cơ quan Cảnh sát Quốc gia, tác giả Changwon Pyo đã tiết lộ những bí mật, góc khuất xã hội - nơi những kẻ dùng địa vị và quyền lực để thao túng pháp luật. Bạn đọc sẽ đi từ ngạc nhiên, sợ hãi đến phẫn nộ khi lắng nghe nỗi oan bị vùi sâu dưới bóng đen của đồng tiền: trưởng phòng công tố hiếp dâm con gái suốt 12 năm mà không bị tố cáo, mẹ vợ thẩm phán giết người nhưng được “giam lỏng” ở phòng vip bệnh viện, em trai cựu Tổng thống tham nhũng, trốn thuế chỉ phải ngồi tù vỏn vẹn 3 năm…\n\n“Không có tiền thì có tội, có tiền thì vô tội.”\n\nDũng cảm và sắc sảo, cuốn sách chỉ ra rất nhiều thiếu sót trong hệ thống Tư pháp, những lỗ hổng khiến cho tội phạm lọt lưới một cách dễ dàng. Chúng chỉ cần sử dụng tiền là có thể giảm án hoặc trốn tội. Ngược lại, nạn nhân sẽ phải chịu đựng sự giày vò về cả thể xác lẫn tinh thần trong suốt quá trình xét xử, thậm chí kéo dài cả đời. Khi không được pháp luật bảo vệ, một số còn trở nên phẫn nộ, khao khát trả thù để rồi tự biến bản thân thành kẻ ác. \n\nHy vọng sau khi đọc “Tội phạm tâm thần và những lỗ hổng công lý”, độc giả sẽ có một cái nhìn đồng cảm hơn với nỗi đau của các nạn nhân, đồng thời thiết lập nhận thức “Chúng ta phải tự biết bảo vệ chính mình bởi bất cứ ai cũng có thể trở thành nạn nhân của tội phạm.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     60, 11, '2024-12-07', '2024-12-07', 1);

-- Insert hình ảnh cho sách "Tội Phạm Tâm Thần Và Những Lỗ Hổng Công Lý"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Tội Phạm Tâm Thần Và Những Lỗ Hổng Công Lý'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/291/toi-pham-tam-than-va-nhung-lo-hong-cong-ly.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Tội Phạm Tâm Thần Và Những Lỗ Hổng Công Lý'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/291/toi-pham-tam-than-va-nhung-lo-hong-cong-ly-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Tội Phạm Tâm Thần Và Những Lỗ Hổng Công Lý'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/291/toi-pham-tam-than-va-nhung-lo-hong-cong-ly-mockup.jpg', 0);

-- Insert dữ liệu cho sách "Những Mảnh Ký Ức 1979-1989: Chuyện Kể Từ Biên Giới Phía Bắc"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Những Mảnh Ký Ức 1979-1989: Chuyện Kể Từ Biên Giới Phía Bắc', 
     'Đào Thanh Huyền\n  Phạm Hoài Thanh\n  Hà Hương', 
     (SELECT category_id FROM categories WHERE category_name = 'Văn Học'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Thanh Niên'),
     2024, '24 x 17 x 1.5 cm', 460, 288, 'Bìa mềm', 335000,
     'Cuốn sách bạn đọc đang cầm trên tay hẳn chưa phải là toàn bộ cuộc chiến và có lẽ không một cuốn sách nào có thể làm được nhiệm vụ này. Tuy vậy, việc cho ra đời những cuốn sách thế này là hết sức cần thiết, đặc biệt có ý nghĩa đối với thế hệ trẻ tuổi, chưa từng kinh qua chiến tranh. Nội dung chính của cuốn sách tập trung vào hai mốc thời gian trọng yếu: 1979 và 1984, với mục đích của nhóm biên soạn là để phần nào tái hiện lại một thời đoạn lịch sử qua lời kể của các nhân chứng là dân thường, bộ đội chính quy, công an vũ trang, bộ đội địa phương, dân phòng.\n\n\"Với tư cách một độc giả, đồng thời là một cựu binh, tôi thấy câu chuyện lịch sử được kể và tái hiện ở nhiều phương diện, góc nhìn, gồm đa dạng các nguồn tin chính thống khả tín kết hợp với tư liệu phỏng vấn công phu. Cuốn sách được tổ chức theo hình thức hiện đại, nhưng vẫn bám sát tình hình chiến sự nóng hổi của 40 năm về trước, điều đó chắc chắn sẽ giúp bạn đọc ở nhiều thế hệ dễ tiếp cận hơn cuộc chiến đặc biệt này.\n\nBiên cương đã im tiếng súng, nhưng thời gian không thể làm suy suyển sự thật và bản chất lịch sử. Lịch sử cần được nhìn nhận, ghi nhớ, không phải nhen lên thù hận dân tộc, mà để xây đắp cho ước vọng hòa bình, để chúng ta không bao giờ bị bất ngờ trong nhiệm vụ tối hậu: bảo vệ độc lập chủ quyền thiêng liêng.\" - Trung tướng Nguyễn Hữu Khảm Nguyên Phó Tổng tham mưu trưởng Quân đội Nhân dân Việt Nam, Nguyên Sư đoàn trưởng Sư đoàn 316.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     71, 11, '2024-01-19', '2024-01-07', 1);

-- Insert hình ảnh cho sách "Những Mảnh Ký Ức 1979-1989: Chuyện Kể Từ Biên Giới Phía Bắc"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Những Mảnh Ký Ức 1979-1989: Chuyện Kể Từ Biên Giới Phía Bắc'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/287/nhung-manh-ky-uc-1979-1989.jpg', 1);

-- Insert dữ liệu cho sách "Siêu Nhân Cua"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Siêu Nhân Cua', 
     'Võ Diệu Thanh', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Thiếu Nhi'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Kim Đồng'),
     2024, '20.5 x 14.5 x 0.6 cm', 140, 80, 'Bìa mềm', 60000,
     'Chắc rằng bạn đã hơn một lần mê mẩn những bộ phim, quyển sách về siêu nhân và nguệch ngoạc vẽ ra theo tưởng tượng của mình. Bạn cũng từng bắt chước y chang hình mẫu trong sách giáo khoa khi làm bài tập vẽ.\n\nThế rồi một cô giáo dạy mĩ thuật cá tính xuất hiện, làm đảo lộn mọi thứ bạn vẫn hình dung trước đây. Cô hướng dẫn bạn những tuyệt chiêu để trở thành họa sĩ nhí đặc biệt. Cô đưa bạn đến một vùng đất hoàn toàn mới, ở đó, mọi sự sáng tạo dù có kì khôi thế nào vẫn được hào hứng đón nhận. Ở đó, có một Siêu nhân Cua thật lạ lùng, một hình tượng độc đáo mà bạn chỉ có thể tìm thấy trong cuốn sách này.\n\n“Ôm ấp giấc mơ viết về thiếu nhi từ lâu, nhưng mãi tới hôm nay tôi mới bắt đầu.\n\nMọi thứ rào cản hay-dở, đẹp-xấu, được-mất không có nhiều ý nghĩa với thiếu nhi. Đó là một thế giới khác hẳn với thế giới mà người lớn chúng ta đang sống. Nó như một vùng đất rộng thênh thang mà mọi luật lệ khô cằn lập tức bị vô hiệu hóa. Tôi sẽ kể về nơi đó cho bạn nghe qua truyện Siêu nhân Cua, nó biến tôi thành một Võ Diệu Thanh hoàn toàn khác.” \n\n— Võ Diệu Thanh\n\nThông tin tác giả\n\nNhà văn VÕ DIỆU THANH\n\nSinh năm 1975\n\nQuê quán: An Giang\n\nSách đã in:\n\nChúng mình bay đầy trời\nThiên thần ốc tiêu\nMùa rễ ngọt\n...\n\nGiải thưởng:\n\nGiải Nhì Văn học Tuổi hai mươi\nGiải Nhì cuộc thi Truyện ngắn Đồng bằng sông Cửu Long\nGiải Ba cuộc vận động sáng tác cho thiếu nhi chủ đề “Gõ cửa trái tim” - Dự án Hỗ trợ Văn học Thiếu nhi Việt Nam - Đan Mạch\n...',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     51, 11, '2024-02-19', '2024-02-19', 1);

-- Insert hình ảnh cho sách "Siêu Nhân Cua"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Siêu Nhân Cua'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/sieu-nhan-cua.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Siêu Nhân Cua'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/sieu-nhan-cua-p02.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Siêu Nhân Cua'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/sieu-nhan-cua-p03.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Siêu Nhân Cua'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/sieu-nhan-cua-p04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Siêu Nhân Cua'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/sieu-nhan-cua-p05.jpg', 0);

-- Insert dữ liệu cho sách "Một Ngày Bình Thường, Một Ngày Hạnh Phúc"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Một Ngày Bình Thường, Một Ngày Hạnh Phúc', 
     'Chao', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Kiến Thức - Hội Họa - Điện Ảnh'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Phụ Nữ'),
     2024, '21 x 19 x 0.8 cm', 150, 136, 'Bìa mềm', 155000,
     'Phải chăng khi ta càng lớn, nụ cười của chúng mình lại dần vơi đi?\n\nChúng mình mải chạy theo guồng quay của cuộc sống, để tâm đến mọi người xung quanh mà quên mất còn một người nữa cũng cần được quan tâm, đó là chính mình.\n\nNgày rảnh rỗi là khoảng thời gian quý giá để chúng ta nghỉ ngơi, thư giãn và làm những việc khiến mình vui. Nếu một ngày bạn cảm thấy mệt mỏi hay căng thẳng, hay chỉ đơn giản là không biết phải làm gì để thời gian trôi qua không uổng phí, hãy cùng bước vào thế giới sắc màu đầy diệu kỳ và dễ thương trong cuốn sách tô màu “Một ngày bình thường, một ngày hạnh phúc” nhé!\n\n“Một ngày bình thường, một ngày hạnh phúc” là sự kết hợp tinh tế giữa họa sĩ Chao (Lê Bảo Châu) và người bạn đồng hành Phương Thanh. Cuốn sách không chỉ là tập hợp những nét vẽ đen trắng chờ được đánh thức bởi sắc màu, mà còn là cánh cửa mở ra thế giới nơi tâm hồn được tự do bay bổng. Mỗi trang sách như viên kẹo ngọt ngào, dẫn dắt bạn lạc vào khu vườn ngập nắng, dừng chân bên ô cửa nhà thân thương, hay say sưa ngắm nhìn chú mèo lười biếng và cô bạn nhỏ đang chăm chút cho khu vườn của mình.\n\nVới những hướng dẫn chi tiết về kỹ thuật phối màu và tô màu từ họa sĩ Chao, bạn sẽ dễ dàng tạo nên những tác phẩm nghệ thuật của riêng mình. Hơn cả một quyển sách tô màu thông thường, \"Một ngày bình thường, một ngày hạnh phúc\" còn là kho tàng những “bảng kế hoạch niềm vui”, hay gợi ý các hoạt động thư giãn đơn giản mà ta có thể thực hiện trong bất kỳ thời gian nào, giúp bạn tận hưởng cuộc sống một cách trọn vẹn.\n\nHãy đến với “Một ngày bình thường, một ngày hạnh phúc”, để tận hưởng khoảnh khắc của riêng bạn, gác lại muộn phiền và cùng tìm lại niềm vui trong từng nét màu xinh!', 
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     32, 14, '2024-03-19', '2024-03-19', 1);

-- Insert hình ảnh cho sách "Một Ngày Bình Thường, Một Ngày Hạnh Phúc"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Một Ngày Bình Thường, Một Ngày Hạnh Phúc'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/mot-ngay-binh-thuong-mot-ngay-hanh-phuc.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Một Ngày Bình Thường, Một Ngày Hạnh Phúc'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/mot-ngay-binh-thuong-mot-ngay-hanh-phuc-mockup.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Một Ngày Bình Thường, Một Ngày Hạnh Phúc'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/mot-ngay-binh-thuong-mot-ngay-hanh-phuc-mockup-02.jpg', 0);

-- Insert dữ liệu cho sách "Mô Hình Xây Dựng Chiến Lược Và Kế Hoạch Kinh Doanh Cho Doanh Nghiệp Vừa Và Nhỏ"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Mô Hình Xây Dựng Chiến Lược Và Kế Hoạch Kinh Doanh Cho Doanh Nghiệp Vừa Và Nhỏ', 
     'Đào Xuân Khương', 
     (SELECT category_id FROM categories WHERE category_name = 'kinh Tế'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Công Thương'),
     2024, '20.5 x 13 x 1 cm', 140, 180, 'Bìa mềm', 89000,
     'Cuốn sách được viết dựa trên nền tảng hỗ trợ các doanh nghiệp và nhà quản lý muốn đưa ra chiến lược kinh doanh mới và kế hoạch kinh doanh nhằm gia tăng khách hàng mới và doanh thu trong giai đoạn suy thoái kinh tế nhưng chưa biết làm gì và như thế nào để bắt đầu quá trình thay đổi.\n\nQuá trình lập kế hoạch kinh doanh hiệu quả theo quan điểm của tác giả thường bắt đầu từ xây dựng chiến lược kinh doanh; sau đó bắt tay vào lập kế hoạch kinh doanh năm, quý, tháng, tuần; và cuối cùng là thực thi các hoạt động kinh doanh hàng ngày.\n\nĐể tháo gỡ những khó khăn mà doanh nghiệp mình đang mắc phải, đây sẽ là một cuốn sách vô cùng hữu dụng.\n\nNội dung cuốn sách được chia làm ba phần:\n\n•  Phần 1: Mô hình xây dựng chiến lược kinh doanh\n\n•  Phần 2: Mô hình xây dựng kế hoạch kinh doanh\n\n•  Phần 3: Mô hình thực thi các hoạt động kinh doanh\n\nPhương pháp viết cuốn sách:\n\nCuốn sách được tác giả viết dựa trên việc nghiên cứu các mô hình học thuật, tổng kết thực tiễn dựa trên trải nghiệm điều hành và tư vấn quản lý kinh doanh, đưa ra các giải pháp gợi mở để áp dụng. Cuốn sách được viết theo ba bước sau:\n\nBước 1: Dựa vào các mô hình chuẩn mực mang tính học thuật cao\n\nBước 2: Giải thích mô hình dễ hiểu nhất và ví dụ minh họa cho độc giả\n\nBước 3: Gợi ý giải pháp áp dụng vào các tình huống thực tiễn của doanh nghiệp, đồng thời chia sẻ các kinh nghiệm điều hành và tư vấn kinh doanh của tác giả trong 20 năm qua.\n\nAi nên đọc cuốn sách này:\n\n•  Chủ doanh nghiệp\n\n•  Ban điều hành công ty\n\n •  Quản lý các phòng ban\n\nThông tin tác giả\n\nTiến sĩ Đào Xuân Khương là chuyên gia tư vấn, đào tạo về phát triển kênh phân phối và hệ thống cửa hàng bán lẻ. Tiến sĩ Khương là đối tác tư vấn và đào tạo của rất nhiều các tập đoàn lớn trên thế giới và Việt Nam. Các tập đoàn đa quốc gia có thể kể đến như Castrol, Piaggio, Nestle, K+, Panasonic, Denso, Saint-Gobain… Các tập đoàn Nhà nước có thể kể đến như Vinaphone, VietinBank, Vicem, VTC, Viettel, VNPost… Các tập đoàn tư nhân tiêu biểu là Vingroup, FPT, Vĩnh Tường, Tân Á Đại Thành, TNG, PNJ, Canifa…\n\nNgoài ra, ông còn là Chủ tịch Học viện bán lẻ và phân phối KCP. Ông được đánh giá là một trong những chuyên gia hàng đầu Việt Nam về phân phối và bán lẻ. Ông bảo vệ thành công luận án tiến sĩ về bán lẻ hiện đại năm 2014, thạc sĩ quản trị kinh doanh về kênh phân phối năm 2009. Tiến sĩ Khương nghiên cứu bán lẻ hiện đại tại Đức năm 2008 và nghiên cứu marketing tại Mỹ năm 2007. Ông từng là giảng viên cộng tác tham gia giảng dạy các chương trình cử nhân, thạc sĩ của các trường đại học và viện quản trị kinh doanh lớn ở Việt Nam như Đại học Kinh tế Quốc dân, Đại học kinh tế – Đại học Quốc gia, Viện quản trị kinh doanh FSA, Đại học FPT…\n\nTrước khi chuyên tâm làm công tác tư vấn và đào tạo chuyên sâu về phân phối – bán lẻ cho các doanh nghiệp trong và ngoài nước. Ông từng là Giám đốc điều hành siêu thị Melinh Plaza với quy mô hơn 10.000m2, hơn 13 ngành hàng và trên 500 nhân viên. Ông cũng từng đảm nhiệm vị trí Giám đốc điều hành công ty Kowil với các nhãn hiệu như Winny và Owen. Trước đó, ông trải qua vị trí Giám đốc kinh doanh Tập đoàn Phú Thái – tập đoàn tư nhân tập trung vào phân phối với hơn 12 trung tâm kinh doanh. Công việc mà ông gắn bó hơn 5 năm là giám đốc bán hàng của P&G Việt nam với các nhãn hàng như Rejoice, Pantene, Tide, Downy, Pamper.', 
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     51, 11, '2024-02-19', '2024-02-19', 1);

-- Insert hình ảnh cho sách "Mô Hình Xây Dựng Chiến Lược Và Kế Hoạch Kinh Doanh Cho Doanh Nghiệp Vừa Và Nhỏ"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Mô Hình Xây Dựng Chiến Lược Và Kế Hoạch Kinh Doanh Cho Doanh Nghiệp Vừa Và Nhỏ'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/mo-hinh-xay-dung-chien-luoc-va-ke-hoach-kinh-doanh.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Mô Hình Xây Dựng Chiến Lược Và Kế Hoạch Kinh Doanh Cho Doanh Nghiệp Vừa Và Nhỏ'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/mo-hinh-xay-dung-chien-luoc-va-ke-hoach-kinh-doanh-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Mô Hình Xây Dựng Chiến Lược Và Kế Hoạch Kinh Doanh Cho Doanh Nghiệp Vừa Và Nhỏ'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/mo-hinh-xay-dung-chien-luoc-va-ke-hoach-kinh-doanh-p01.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Mô Hình Xây Dựng Chiến Lược Và Kế Hoạch Kinh Doanh Cho Doanh Nghiệp Vừa Và Nhỏ'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/mo-hinh-xay-dung-chien-luoc-va-ke-hoach-kinh-doanh-p02.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Mô Hình Xây Dựng Chiến Lược Và Kế Hoạch Kinh Doanh Cho Doanh Nghiệp Vừa Và Nhỏ'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/mo-hinh-xay-dung-chien-luoc-va-ke-hoach-kinh-doanh-p03.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Mô Hình Xây Dựng Chiến Lược Và Kế Hoạch Kinh Doanh Cho Doanh Nghiệp Vừa Và Nhỏ'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/mo-hinh-xay-dung-chien-luoc-va-ke-hoach-kinh-doanh-p04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Mô Hình Xây Dựng Chiến Lược Và Kế Hoạch Kinh Doanh Cho Doanh Nghiệp Vừa Và Nhỏ'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/mo-hinh-xay-dung-chien-luoc-va-ke-hoach-kinh-doanh-p05.jpg', 0);

-- Insert dữ liệu cho sách "Người Ở Trong Mơ Tập 2"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Người Ở Trong Mơ Tập 2', 
     'Nalah2410', 
     (SELECT category_id FROM categories WHERE category_name = 'Văn Học'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Văn Học'),
     2024, '16 x 24 cm', 250, 380, 'Bìa cứng', 220000,
     'Võ Thi Quân là một kẻ bất cần chẳng biết mình muốn gì với đời. Vào một ngày nọ, trên đường về nhà từ buổi tụ tập với bạn bè, cậu bất ngờ bị tai nạn và tỉnh lại trong bệnh viện. Tại đây, Quân gặp gỡ một “hồn ma” với nụ cười thân thiện tên là Đại Dương, có khả năng điều khiển giấc mơ của người khác. Anh chỉ nhớ được những ký ức mơ hồ về gia đình nên muốn nhờ Quân giúp tìm đường về nhà.\n\nDù nghi ngại và ngờ vực nhưng Quân vẫn không tránh khỏi niềm thương xót mà đưa tay giúp đỡ Đại Dương. Lần theo những manh mối ít ỏi thu thập được từ bệnh viện, cậu biết được nhiều hơn về con người của anh ta lúc còn sống. Mọi người đều bảo Đại Dương rất tốt bụng, số phận của anh quá đỗi tang thương. Nhưng liệu mọi chuyện có thật sự đơn giản như vậy? Cậu phát hiện ra, đằng sau vẻ tươi cười thân thiện của Đại Dương dường như có một nhân cách khác đầy tuyệt vọng và thù hận…\n\nLiệu Quân có thể giúp Đại Dương tìm lại được kí ức? Cái c.h.ế.t của Đại Dương liệu có uẩn khúc gì không? Mời các bạn đón đọc tập thứ 2 của bộ truyện tranh vừa hài hước vừa bí ẩn “Người ở trong mơ”!', 
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     45, 12, '2024-04-15', '2024-04-15', 1);

-- Insert hình ảnh cho sách "Người Ở Trong Mơ Tập 2"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Người Ở Trong Mơ Tập 2'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/nguoi-o-trong-mo-tap-2.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Người Ở Trong Mơ Tập 2'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/nguoi-o-trong-mo-tap-2-mockup.jpg', 0);

-- Insert dữ liệu cho sách "Sơ Đồ Tư Duy (Sách Nhân Trí Việt)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Sơ Đồ Tư Duy (Sách Nhân Trí Việt)', 
     'Tony Buzan, Barry Buzan', 
     (SELECT category_id FROM categories WHERE category_name = 'Tâm lí- Kỹ năng sống'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Tổng Hợp TP. HCM'),
     2024, '21.5 x 14 x 2 cm', 296, 380, 'Bìa mềm', 228000,
     'Bạn đã từng trăn trở tìm cách cải thiện trí nhớ, sự sáng tạo, khả năng tập trung, năng lực giao tiếp, kỹ năng tư duy, kỹ năng học tập, trí thông minh và sự nhanh nhạy?\n\nCuốn Sơ đồ Tư duy, một trong những tác phẩm thuộc bộ sách kinh điển về tư duy (The Mind Set) của Tony Buzan, sẽ đem đến cho bạn công cụ tư duy mạnh mẽ để đạt được các mục tiêu sau đây và hơn thế nữa! Thông qua tư duy mở rộng (radiant thinking), một phương pháp liên kết tiến trình tư duy phi tuyến, các tác giả đã đề xuất việc xây dựng “Sơ đồ Tư duy” – những bức tranh nhiều màu sắc, thể hiện cấu trúc – để làm công cụ tổ chức ý tưởng, sáng tạo, củng cố trí nhớ và nâng cao hiệu quả các cuộc họp hành hoặc hội thảo.\n\nVới cuốn Sơ đồ Tư duy, bạn sẽ dễ dàng:\n\nCải thiện trí nhớ\nNảy sinh những ý tưởng độc đáo\nSoạn thảo các bài trình bày hoặc báo cáo\nThuyết phục và thương lượng với người khác\nHoạch định các mục tiêu cá nhân\nLàm chủ cuộc sống của bạn\n\nSơ đồ Tư duy, được mệnh danh “công cụ vạn năng cho bộ não”, là phương pháp ghi chú đầy sáng tạo, hiện đang được hơn 250 triệu người trên thế giới sử dụng, đã và đang đem lại những hiệu quả thực sự đáng kinh ngạc, nhất là trong lĩnh vực giáo dục và kinh doanh.\n\nTony Buzan, người phát minh kỹ thuật lập Sơ đồ Tư duy, là nhà nghiên cứu hàng đầu thế giới về não bộ và phương pháp học tập. Các tác phẩm của ông đã thành công vang dội ở hơn 100 quốc gia và được dịch sang 30 thứ tiếng. Ông cũng là một diễn giả có đẳng cấp quốc tế và giữ vai trò cố vấn cho nhiều tập đoàn đa quốc gia hàng đầu cùng các chính phủ trên thế giới. Ngoài ra, ông còn là Chủ tịch Quỹ nghiên cứu về Não bộ (Brain Foundation), nhà sáng lập Tổ chức Brain Trust và các giải Vô địch Thế giới về Trí nhớ và Tư duy.\n\nBarry Buzan là Giáo sư Quan hệ Quốc tế thuộc Trường Kinh tế và Chính trị Luân Đôn (LSE) đồng thời là một tác giả nổi tiếng về lĩnh vực lịch sử và cấu trúc của hệ thống chính trị quốc tế. Ông đã sử dụng Sơ đồ Tư duy như một công cụ hữu hiệu trong sự nghiệp của mình và tích cực cộng tác với người anh là Tony Buzan trong việc phát triển kỹ thuật lập Sơ đồ Tư duy.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     12, 11, '2024-04-19', '2024-04-19', 1);

-- Insert hình ảnh cho sách "Sơ Đồ Tư Duy (Sách Nhân Trí Việt)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Sơ Đồ Tư Duy (Sách Nhân Trí Việt)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/so-do-tu-duy.jpg', 1);

-- Insert dữ liệu cho sách "Slam Dunk - Deluxe Edition - Tập 24"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Slam Dunk - Deluxe Edition - Tập 24', 
     'Takehiko Inoue', 
     (SELECT category_id FROM categories WHERE category_name = 'Truyện Tranh'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Kim Đồng'),
     2024, '18 x 13 x 1.4 cm', 300, 252, 'Bìa mềm', 60000,
     'Còn 2 phút, Shohoku bị bỏ lại với 5 điểm cách biệt. Sannoh cũng phát động đòn tấn công liều lĩnh hòng bỏ xa tỉ số và thể hiện ý chí của nhà vô địch. Trận đấu đầy cảm xúc giữa Sannoh VS Shohoku cuối cùng đã đến hồi cao trào!\n\nTRỌN BỘ 24 TẬP HOÀNH TRÁNG!!\n\nPhiên bản nâng cấp với phần bìa được vẽ mới!! Bổ sung đầy đủ các trang màu từ tạp chí!!',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     60, 110, '2024-12-16', '2024-12-16', 1);

-- Insert hình ảnh cho sách "Slam Dunk - Deluxe Edition - Tập 24"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Slam Dunk - Deluxe Edition - Tập 24'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/slam-dunk-deluxe-tap-24.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Slam Dunk - Deluxe Edition - Tập 24'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/slam-dunk-deluxe-tap-24-b01.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Slam Dunk - Deluxe Edition - Tập 24'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/slam-dunk-deluxe-tap-24-ao.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Slam Dunk - Deluxe Edition - Tập 24'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/slam-dunk-deluxe-tap-24.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Slam Dunk - Deluxe Edition - Tập 24'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/slam-dunk-deluxe-tap-24-b01.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Slam Dunk - Deluxe Edition - Tập 24'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/slam-dunk-deluxe-tap-24-ao.jpg', 0);

-- Insert dữ liệu cho sách "Chính Sách Của Các Vương Triều Việt Nam Đối Với Người Hoa"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Chính Sách Của Các Vương Triều Việt Nam Đối Với Người Hoa', 
     'Huỳnh Ngọc Đáng', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Chuyên Ngành'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Tổng Hợp TP. HCM'),
     2024, '24 x 16 x 1.4 cm', 300, 272, 'Bìa mềm', 135000,
     'Năm 2018, cuốn sách “Chính sách của các vương triều Việt Nam đối với người Hoa” xuất bản lần đầu đã nhận được những phản hồi tốt từ phía độc giả, sự ghi nhận, đánh giá cao của các nhà chuyên môn.\n\nVới công trình nghiên cứu này, tác giả đã bước đầu tổng kết một cách có hệ thống về chính sách đối với người Hoa của các triều đại phong kiến Việt Nam. Mỗi một triều đại tùy vào tình hình lịch sử cụ thể, lại có sự ứng xử cho tương thích, và triều đại sau hầu như bao giờ cũng có sự kế thừa, phát triển chính sách đối với người Hoa đã được thực hiện từ triều đại trước theo hướng ngày càng quy củ hơn, chặt chẽ hơn để góp phần trở thành một trong những yếu tố quan trọng làm cho người Hoa luôn gắn bó với cộng đồng các dân tộc Việt Nam, có những đóng góp nhất định về kinh tế, văn hóa, xã hội… vào sự phát triển chung của đất nước.\n\nNhằm đáp ứng nhu cầu tìm đọc của công chúng, đồng thời mong muốn góp thêm một tiếng nói học thuật để độc giả có thêm nguồn tư liệu tham khảo cho một vấn đề tưởng như xưa cũ, nhưng cũng rất thời sự, Nhà xuất bản Tổng hợp Thành phố Hồ Chí Minh thực hiện tái bản (có bổ sung phần Phụ lục) cuốn sách này. Chắc chắn rằng qua những tư liệu lịch sử được đưa ra cùng với những kết luận khoa học, biện chứng, cuốn sách sẽ góp phần không nhỏ cho việc ngẫm xưa, nghĩ nay để chúng ta có những ứng dụng phù hợp với tình hình thực tế.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     60, 110, '2024-12-16', '2024-12-16', 1);

-- Insert hình ảnh cho sách "Chính Sách Của Các Vương Triều Việt Nam Đối Với Người Hoa"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Chính Sách Của Các Vương Triều Việt Nam Đối Với Người Hoa'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/chinh-sach-cua-cac-vuong-trieu-viet-nam-doi-voi-nguoi-hoa.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Chính Sách Của Các Vương Triều Việt Nam Đối Với Người Hoa'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/chinh-sach-cua-cac-vuong-trieu-viet-nam-doi-voi-nguoi-hoa-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Chính Sách Của Các Vương Triều Việt Nam Đối Với Người Hoa'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/chinh-sach-cua-cac-vuong-trieu-viet-nam-doi-voi-nguoi-hoa-mockup.jpg', 0);
    
-- Insert dữ liệu cho sách "Zenlam Du Hành Vào Cõi Xanh"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Zenlam Du Hành Vào Cõi Xanh', 
     'Vi Lam', 
     (SELECT category_id FROM categories WHERE category_name = 'Văn Học'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Dân Trí'),
     2024, '14 x 20.5 x 1.1 cm', 296, 228, 'Bìa mềm', 135000,
     '“Đây không phải là một cuốn sách, với mực và giấy. Đây là một mảnh hồn được chiết xuất tỉ mẩn từ những giọt buồn giọt vui rồi giãi bày thẩm thấu trên từng trang thời gian lặng lẽ. Mảnh hồn ấy, tôi nhận lấy, từ phía bên kia của cánh cửa màu xanh. Và ngồi đây, ôm trong tay, chậm rãi vô ưu, kể chuyện với bạn.”\n\nZENLAM - DU HÀNH VÀO CÕI XANH là tập typoem thứ hai trong hành trình cá nhân của Vi Lam khi khám phá thể loại sáng tác này. Không chỉ là đọc sách, đó là trải nghiệm thị giác trên trang giấy. Một cuộc chơi của các biểu tượng và con chữ. Nếu như GIỮA TRỜI VÀ ĐẤT LÀ TÌNH YÊU chứa đựng những rung động trong trẻo, dạt dào và nồng nhiệt của tuổi 20, thì trong ZENLAM, bạn sẽ cảm nhận một giọng nói, hay thậm chí là nhiều giọng nói - sâu lắng, tĩnh tại và điềm nhiên của tuổi 30, đưa bạn DU HÀNH VÀO CÕI XANH, chốn thiêng liêng sâu xa nhất trong tâm hồn mỗi người. Trong không gian đa chiều của cõi xanh, một cái tôi đơn nhất là chủ thể quan sát giờ được bội phân, luỹ thừa lên thành cái-tôi-multiple, đứng từ nhiều góc cạnh mà soi chiếu sự vật. Chẳng phải hành trình của sự trưởng thành hiện sinh chính là thoát khỏi cái tôi đơn nhất để tự nhân bản mình và đặt mình vào nhiều góc cạnh của lăng kính cuộc đời? Một tuyển tập chắt lọc những suy tư lạ thường trong những ngày bình thường, cũng có thể gọi là nhật ký trưởng thành của Vi Lam.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     60, 110, '2024-05-16', '2024-05-16', 1);

-- Insert hình ảnh cho sách "Zenlam Du Hành Vào Cõi Xanh"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Zenlam Du Hành Vào Cõi Xanh'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/272/zenlam-du-hanh-vao-coi-xanh.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Zenlam Du Hành Vào Cõi Xanh'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/272/zenlam-du-hanh-vao-coi-xanh-b4.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Zenlam Du Hành Vào Cõi Xanh'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/272/zenlam-du-hanh-vao-coi-xanh-mockup.jpg', 0);

-- Insert data for "Tần Số Cô Đơn"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Tần Số Cô Đơn', 
     '52.0 Hz', 
     (SELECT category_id FROM categories WHERE category_name = 'Văn Học'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Thế Giới'),
     2024, '13 x 19 x 1 cm', 300, 192, 'Bìa mềm', 95000,
     'Người ta thường bảo tận cùng của cô đơn là những tiếng nói không được lắng nghe. Có những kẻ vừa sinh ra đã ở nơi sâu thẳm tuyệt vọng đó, lại có những người dù dùng chung một ngôn ngữ nhưng những câu từ nói ra vẫn chẳng đến được với người họ muốn gửi gắm.\n\n“Tần số cô đơn” như một sự gói ghém những tiếng lòng, những xúc cảm khao khát được truyền tải đến một nơi nào đó khác cõi tim này, là một tập thơ ‒ tập hợp của những tần số bị rè, những nỗi nhớ và tình yêu đang mắc kẹt ở đâu đó.\n\n“chuyện tần số 52.0 Hz\nnỗi nhớ này bị nghẹt\nkhông gửi được đến em”\n\nThông tin tác giả\n\n52.0 Hz là nhóm bút hoạt động trên mạng xã hội rất được các bạn trẻ yêu thích với những sáng tác thơ như nói thay cho tiếng lòng của người trẻ, cho tuyệt cùng hạnh phúc, cho tột cùng đau thương. Những thành viên của 52.0 Hz đã trở nên quen thuộc với độc giả có thể kể đến như macmart, Châu sa đáy mắt, Synæsthesia, Âu Lãng,…\n\n“Cảm ơn đời vì đã cho chúng mình được gặp nhau khi ai cũng đang lao đao giữa ngàn vạn mét khối nỗi buồn!',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     60, 110, '2024-11-16', '2024-11-16', 1);

-- Insert images for "Tần Số Cô Đơn"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Tần Số Cô Đơn'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/266/tan-so-co-don.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Tần Số Cô Đơn'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/266/tan-so-co-don-b4.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Tần Số Cô Đơn'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/266/tan-so-co-don-mockup.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Tần Số Cô Đơn'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/266/tan-so-co-don-mockup-02.jpg', 0);

-- Insert data for "Bản Chất Của Người (Tái bản năm 2024)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Bản Chất Của Người (Tái bản năm 2024)', 
     'Han Kang', 
     (SELECT category_id FROM categories WHERE category_name = 'Tiểu thuyết'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Hà Nội'),
     2024, '20.5 x 14 x 1.2 cm', 380, 248, 'Bìa mềm', 129000,
     '“Bây giờ, tôi xin được hỏi anh.\n\nNhư vậy, có phải con người là một sinh vật tàn nhẫn từ trong bản chất? Hay đó chỉ là những trải nghiệm phổ biến của chúng ta? Có phải chúng ta chỉ đang sống trong ảo tưởng về phẩm giá con người, còn thực ra bất cứ lúc nào, chúng ta cũng có thể biến thành một thứ chẳng là gì cả, thành sâu bọ, thành thú vật, thành một đống mủ dịch lẫn lộn? Bỉ sỉ nhục, bị bôi nhọ, bị tàn sát, phải chăng đó là bản chất của con người đã được chứng minh trong lịch sử?\n\nTôi đang chiến đấu. Ngày nào tôi cũng một mình chiến đấu. Tôi chiến đấu với nỗi nhục nhã vì mình đã sống sót, và vì mình vẫn còn đang sống tiếp. Tôi chiến đấu với sự thật rằng mình cũng là con người. Tôi chiến đấu với ý nghĩ rằng chỉ có cái chết mới là con đường duy nhất có thể kéo tôi thoát khỏi sự thật đó. Cùng là con người với nhau, anh có thể cho tôi một câu trả lời không?”\n\nBản chất của người, với sự kiện lịch sử Phong trào dân chủ Gwangju (1980) làm bối cảnh chính, được đánh giá là một trong những tiểu thuyết xuất sắc và giàu sức lay động nhất của Han Kang, được chính tác giả thừa nhận là “tác phẩm mà tôi không thể trốn tránh, không thể không viết, nếu không viết, không vượt qua, có lẽ tôi sẽ không thể đi tiếp đến bất cứ đâu.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     95, 110, '2024-10-16', '2024-10-16', 1);

-- Insert images for "Bản Chất Của Người (Tái bản năm 2024)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Bản Chất Của Người (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/ban-chat-cua-nguoi-tb-2024.jpg', 1);

-- Insert data for "Phấn Hoa Lầu Xanh (Tái bản năm 2024)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Phấn Hoa Lầu Xanh (Tái bản năm 2024)', 
     'Tào Đình', 
     (SELECT category_id FROM categories WHERE category_name = 'Tiểu thuyết'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Văn Học'),
     2024, '20.5 x 13 x 1.5 cm', 380, 280, 'Bìa mềm', 108000,
     '“Phấn hoa lầu xanh” của tác giả Tào Đình lấy bối cảnh cổ đại, thời kỳ Bắc Tống. Tác phẩm là câu chuyện trần thuật về một cô gái tên là Sở Sở. Cô sinh ra và lớn lên trong một gia đình gia giáo với thân phận là một tiểu thư đài các, “lá ngọc cành vàng”.\n\nNgay từ nhỏ Sở Sở đã được học cầm kỳ thi họa, cô tinh thông tất cả các môn. Có thể thấy suốt 15 năm đầu đời, Sở Sở sống trong sự yêu thương bảo bọc của gia đình, cuộc sống ung dung tự do tự tại. Ấy vậy mà vào một ngày, khi biết tới hai chữ “ái tình”, cuộc đời của Sở Sở bắt đầu bước vào những chuỗi ngày bất hạnh khổ đau, cho tới khi gần cuối đời cô vẫn không hiểu mình đã làm sai chuyện gì để chịu sự trừng phạt của gã mang tên “số phận” và “định mệnh”.\n\nCó lẽ, phải chăng điều sai lầm lớn nhất trong cuộc đời của Sở Sở là cô sinh ra đã mang phận đàn bà. Mọi chuyện đều không được tự định đoạt và phải chịu sự điều khiển, sắp đặt của số phận và người khác.\n\n“Phấn hoa lầu xanh” là một câu chuyện cũ về những lề thói của xã hội phong kiến xưa, phơi bày sự mong manh của một kiếp người, đồng thời nói lên những khát khao về tình yêu, về cuộc sống, về hạnh phúc giản đơn…',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     95, 110, '2024-10-16', '2024-10-16', 1);

-- Insert images for "Phấn Hoa Lầu Xanh (Tái bản năm 2024)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Phấn Hoa Lầu Xanh (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/297/phan-hoa-lau-xanh-tb-2024.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Phấn Hoa Lầu Xanh (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/297/phan-hoa-lau-xanh-tb-2024-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Phấn Hoa Lầu Xanh (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/297/phan-hoa-lau-xanh-tb-2024-mockup.jpg', 0);

-- Insert data for "Thay Đổi Để Thành Công (Tái bản năm 2024)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Thay Đổi Để Thành Công (Tái bản năm 2024)', 
     'Dale Carnegie', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Trẻ'),
     2024, '20.5 x 14 x 1.5 cm', 175, 306, 'Bìa mềm', 143100,
     '“Dù trong công việc hoặc trong cuộc sống cá nhân, nếu muốn tiến bộ, chúng ta cần sẵn lòng thay đổi cách thức làm việc hoặc thậm chí cách sinh hoạt. Điều này không có nghĩa là mọi thứ chúng ta làm đều cần phải thay đổi. Đúng ra là chúng ta nên cởi mở với những ý tưởng mới.\n\n- Để có thể xác định cách thức tiến hành thay đổi trên con đường đi tới thành công, chúng ta sẽ xem xét sự thay đổi dưới nhiều khía cạnh khác nhau:\n\n- Thay đổi như một bước tiến tới thành công\n\n- Tự điều chỉnh để thay đổi\n\n- Thời điểm và cách thức đề nghị hay bắt đầu sự thay đổi\n\n- Cách thức tiến hành thay đổi với tư cách một thành viên của nhóm\n\n- Giảm áp lực căng thẳng khi tiến hành thay đổi...',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     0, 11, '2024-12-12', '2024-12-12', 1);

-- Insert images for "Phấn Hoa Lầu Xanh (Tái bản năm 2024)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Thay Đổi Để Thành Công (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/287/thay-doi-de-thanh-cong-tb-2024.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Thay Đổi Để Thành Công (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/287/thay-doi-de-thanh-cong-tb-2024-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Thay Đổi Để Thành Công (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/287/thay-doi-de-thanh-cong-tb-2024-mockup.jpg', 1);
    
-- Insert data for "Những Nỗi Đau Đứt Đoạn"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Những Nỗi Đau Đứt Đoạn', 
     'Khiếm Khuyết', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Thế Giới'),
     2024, '19 x 13 x 1.2 cm', 175, 240, 'Bìa mềm', 109000,
     'Nỗi buồn sao quên nổi\n\nLuyến tiếc biết bao lần.\n\nChỉ mong mỏi cầm viết\n\nLượn vài nét, bẻ đôi.\n\nBên trong chúng ta đều có một khoảng không chứa đựng những nỗi đau, có người giữ chặt, có người chọn nói ra. Và nhóm tác giả Khiếm Khuyết đã chọn chuyển tải xúc cảm ấy thành những câu chuyện xen kẽ đôi ba vần thơ và lưu giữ chúng trong cuốn sách Những nỗi đau đứt đoạn.\n\nTừng trang sách là lời tâm sự về những cuộc yêu đã tàn, những cảm xúc mênh mang không thể gọi thành tên hay những mảnh vỡ gia đình mà ai đó đang cố gắng nhặt nhạnh.\n\nMỗi câu chữ trong cuốn sách như thể đang chạm vào từng mảnh buồn đứt đoạn, trôi dạt trong tâm hồn của chúng ta, vỗ về một chút, an ủi một chút, chữa lành một chút để ta cảm thấy mình không đơn độc trên hành trình này.\n\nKhiếm Khuyết mong rằng cuốn sách Những nỗi đau đứt đoạn sẽ là sợi dây liên kết giữa người viết và bạn đọc, những con người đều đang ôm trong mình biết bao là chênh vênh. Để rồi sau cùng…\n\n“Chúng ta giờ đã sẵn sàng trưởng thành, mỉm cười với nỗi buồn hôm qua. Không còn cánh cửa khóa trái hay căn phòng trống nào nữa. Nước mắt cần phải chi cho lần cười hạnh phúc sau này.”\n\nThông tin tác giả\n\nKhiếm Khuyết\n\nNhóm tác giả chuyên viết về những cảm nhận lạc lõng, cô đơn, vô định của một thế hệ trẻ; những đổ vỡ, sự chia xa trong tình yêu một thời, giờ chỉ còn là hoài niệm.',
     (SELECT promotion_id FROM promotions WHERE promotion_name = 'Giảm 5k'),
     0, 11, '2024-12-08', '2024-12-08', 1);

-- Insert images for "Những Nỗi Đau Đứt Đoạn"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Những Nỗi Đau Đứt Đoạn'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/299/nhung-noi-dau-dut-doan-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Những Nỗi Đau Đứt Đoạn'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/299/nhung-noi-dau-dut-doan-mockup.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Những Nỗi Đau Đứt Đoạn'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/299/nhung-noi-dau-dut-doan-mockup-02.jpg', 1); 
    
       
 -- Insert data for "Tìm Mình Giữa Từng Lớp Đau Thương"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Tìm Mình Giữa Từng Lớp Đau Thương', 
     '52.0 Hz', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Trẻ'),
     2024, '19 x 13 x 1.2 cm', 175, 232, 'Bìa mềm', 105000,
     'Bao giờ nỗi buồn mới trở nên đáng giá?\n\nVà khi nào sự cô đơn chẳng còn là một “mầm bệnh” mà ai cũng muốn trốn chạy?\n\nNhững câu hỏi dường như không ai có đáp án chính xác đã mở ra cuốn sách “Tìm mình giữa từng lớp đau thương” của 52.0Hz - một chuyến hành trình xuyên qua những cung bậc cảm xúc sâu thẳm, khó nói nhất của con người. Bởi nếu chưa từng nếm trải vị đắng của nỗi buồn, ta làm sao thấu hiểu được vị ngọt ngào của hạnh phúc?\n\nNhóm tác giả 52.0Hz tựa như những chú cá voi xanh cất lên thanh âm đơn độc giữa đại dương mênh mông, tưởng chừng lạc lõng nhưng lại vô tình tìm thấy nhau qua văn chương. Họ dùng ngôn từ để hóa giải những dằn vặt nội tâm, khắc họa nỗi đau và chứng minh sự hiện hữu. Mỗi tác giả là một thanh âm riêng biệt, mang trong mình những vết xước của cuộc đời, để rồi chuyển hóa chúng thành những câu chữ đầy mê hoặc, vừa sầu bi, vừa chân thật của tâm hồn người trẻ.\n\n“Tìm mình giữa từng lớp đau thương” được chia thành 5 chương, tương ứng với 5 tầng sâu của biển cả, cũng là đại diện cho những cung bậc khác nhau của nỗi đau trong đời người. Nơi ấy có nỗi đau chung cho cả một thế hệ, có sự tan vỡ của một đứa trẻ lớn lên trong gia đình không hạnh phúc, là giọt nước mắt của một mối tình dang dở và cuối cùng là những tổn thương ẩn sâu trong tâm trí của mỗi “tần số cô đơn trong 52.0hz”...\n\n“một cuộc đời của con\n\nmột cuộc đời của bạn\n\nmột cuộc đời mình nghĩ rằng xứng đáng\n\nmột cuộc đời nhân thế muốn trở thành.\n\nnhưng rồi mình thấm mệt vì cứ phải lao nhanh,\n\nmình sống hai tư giờ không giờ nào ngơi nghỉ.”\n\nNhững câu chữ trong “Tìm mình giữa từng lớp đau thương” như tiếng lòng thầm lặng của những người trẻ giữa cuộc sống hối hả, bộn bề - nơi dễ lạc lối và chìm khuất trong những kỳ vọng của thế gian và xúc cảm của chính chúng ta. Chính từ nỗi buồn ẩn sâu trong mỗi trang viết, bạn sẽ tìm thấy sự đồng cảm mà bấy lâu nay chưa một lần dám thổ lộ. Để rồi từ đó, bạn cũng sẽ tìm thấy trong mình khả năng biến nỗi đau thành dũng khí, biến những giọt nước mắt thành hạnh phúc, để có thể mỉm cười và nói “cảm ơn tôi vì đã được sinh ra”.',
     1,0, 11, '2024-12-08', '2024-12-08', 1);

-- Insert images for "Tìm Mình Giữa Từng Lớp Đau Thương"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Tìm Mình Giữa Từng Lớp Đau Thương'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/299/tim-minh-giua-tung-lop-dau-thuong.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Tìm Mình Giữa Từng Lớp Đau Thương'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/299/tim-minh-giua-tung-lop-dau-thuong-mockup-01.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Tìm Mình Giữa Từng Lớp Đau Thương'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/299/tim-minh-giua-tung-lop-dau-thuong-mockup-02.jpg', 1);
    
  
-- Insert data for "Hãy Kể Tôi Nghe Sự Thật Về Tình Yêu"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Hãy Kể Tôi Nghe Sự Thật Về Tình Yêu', 
     'Susanna Abse', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     (SELECT p_id FROM publishers WHERE p_name = 'NXB Trẻ'),
     2024, '20.5 x 14 x 1.5 cm', 265, 292, 'Bìa mềm', 170100,
     'Mối quan hệ cặp đôi là trọng tâm thảo luận của quyển sách này, với 13 chương mục được lấy cảm hứng từ 13 câu chuyện cổ vượt thời gian, đại biểu cho những tình huống lưỡng nan và các mô thức hành vi điển hình trong tình yêu. Bố mẹ thổi sập ngôi nhà rơm rồi cặm cụi xây lại, Khăn Đỏ khăng khăng bảo vệ con sói đội lốt cừu, Rapunzel khao khát được bầu bạn nhưng mắc kẹt trong lâu đài của chính mình,... Những cặp đôi rơi khỏi vườn địa đàng, nếm vị đắng của trái táo độc và bắt ngời lạ nằm trên giường của họ.\n\nTừ việc đối mặt với sự phản bội đến điều hướng vai trò của mỗi cá nhân trong mối quan hệ, Hãy Kể Tôi Nghe Sự Thật Về Tình Yêu là câu chuyện vệ việc buông bỏ một loạt “sự thật ngầm định”, lần mở ra điều còn ẩn khuất giữa hai người, dẫn dắt đến những khám phá, từ đó giúp họ mở lòng ra để thấu hiểu nhau hơn, mà đôi khi còn có thể tạo ra một sự chuyển hóa. Chấp nhận rằng hoàng tử và ếch là hai nửa của một con người - phải chẳng đó là sự thật về tình yêu?\n\n“Trên hành trình khám phá các mối quan hệ yêu đương, có hai khía cạnh về “sự thật” giữa một cặp đôi rất cần phải đặt ra nghi vấn: sự thật thứ nhất liên quan đến việc đối diện với cảm xúc của chính mình và tri nhận trải nghiệm của bản thân; cái thứ hai liên quan đến việc đối diện với cảm xúc của đối phương và thấu hiểu trải nghiệm của họ.” (Susanna Abse - Cựu Chủ tịch Hội đồng Phân tâm học Anh)\n\nThông tin tác giả\n\nSUSANNA ABSE\n\n• Nhà trị liệu phân tâm học, với hơn 35 năm kinh nghiệm trong công tác trị liệu cá nhân, cặp đôi và phụ huynh.\n\n• CEO của tổ chức thiện nguyện Tavistock Relationships (2006 - 2016).\n\n• Chủ tịch Hội đồng Phân tâm học Anh (2018 - 2021).\n\n• Tác giả của nhiều ấn phẩm về trị liệu cặp đôi, phương pháp nuôi dạy con, chính sách gia đình; cùng nhiều bài báo về các vấn đề chính trị cà xã hội cho Guardian, New Statesman và Open Democracy.\n\n• Người dẫn chương trình “Britain on the Couch” năm 2019 trên kênh Channel 4 News.\n\n• Đồng biên soạn The Library of Couple and Family Psychoanalysis của Routledge Books và là thành viên quản trị của Bảo tàng Freud ở London.',
     1,
     0, 11, '2024-12-04', '2024-12-04', 1);

-- Insert images for "Hãy Kể Tôi Nghe Sự Thật Về Tình Yêu"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
  ((SELECT b_id FROM books WHERE title = 'Hãy Kể Tôi Nghe Sự Thật Về Tình Yêu'), 
'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/289/hay-ke-toi-nghe-su-that-ve-tinh-yeu-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Hãy Kể Tôi Nghe Sự Thật Về Tình Yêu'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/289/hay-ke-toi-nghe-su-that-ve-tinh-yeu-mockup.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Hãy Kể Tôi Nghe Sự Thật Về Tình Yêu'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/289/hay-ke-toi-nghe-su-that-ve-tinh-yeu-mockup-02.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Hãy Kể Tôi Nghe Sự Thật Về Tình Yêu'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/289/hay-ke-toi-nghe-su-that-ve-tinh-yeu-mockup-03.jpg', 1);
    
    -- Insert data for "Ngày Trôi Về Phía Cũ... (Tái bản năm 2024)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Ngày Trôi Về Phía Cũ... (Tái bản năm 2024)', 
     'Anh Khang', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     3,
     2024, '20 x 12 x 1.4 cm', 245, 213, 'Bìa mềm', 143100,
     'Một quyển sách với nhiều cảm xúc nhẹ nhàng về cuộc sống… Chỉ là những cảm xúc được góp nhặt sau một-vài-lần yêu, những tản văn - tùy bút được tác giả viết như một cách cất giữ những điều xưa cũ của một thời non trẻ. Tác giả gom hết người cũ - chuyện xưa và gọi tên những trang viết này là Ngày Trôi Về Phía Cũ.... Chưa đủ dày dặn để gọi là “hồi ký của yêu thương”, cũng chưa hẳn là những lời hoa mỹ để dán mác “thư tình”, tất cả chỉ là những cảm xúc lửng lơ của những người trẻ vừa bước vào yêu. Có niềm tin lẫn thất vọng, có ngọt ngào lẫn cực đoan, nhưng tất cả rồi cũng trôi về phía sau và yên mình khép mắt, ngủ một giấc say nồng trong chăn ấm nệm êm mang tên “Kỷ niệm”.',
     3,
     0, 120, '2024-12-2', '2024-12-2', 1);

-- Insert images for "Ngày Trôi Về Phía Cũ... (Tái bản năm 2024)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Ngày Trôi Về Phía Cũ... (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/ngay-troi-ve-phia-cu-tb-2024-mockup-02.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Ngày Trôi Về Phía Cũ... (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/ngay-troi-ve-phia-cu-tb-2024-mockup-03.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Ngày Trôi Về Phía Cũ... (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/ngay-troi-ve-phia-cu-tb-2024-mockup-04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Ngày Trôi Về Phía Cũ... (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/ngay-troi-ve-phia-cu-tb-2024-mockup-05.jpg', 1);

-- Insert data for "Chōwa - Ổn Định Nội Tâm Sống Cân Bằng Như Người Nhật"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Chōwa - Ổn Định Nội Tâm Sống Cân Bằng Như Người Nhật', 
     'Akemi Tanaka', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     3,
     2024, '20.5 x 14 x 1.5 cm', 265, 292, 'Bìa mềm', 170100,
     'Chōwa có thể hiểu nôm na là “hài hòa” hay đúng hơn là “tìm kiếm sự cân bằng”. Thay vì nhắm đến mục tiêu đạt thành tựu, chōwa cung cấp cho mỗi cá nhân phương pháp giải quyết vấn đề thiên về cách giữ cân bằng trước những áp lực cuộc sống có thể xảy ra mọi lúc mọi nơi, từ môi trường gia đình, công việc, học đường và cả những mối quan hệ cá nhân. Bên cạnh đó, chōwa còn đưa ra những góc nhìn mới đối với các luận đề chưa bao giờ lỗi thời như: Bản thân mang trách nhiệm, làm thế nào chúng ta có thể dung hòa chính mình với nhu cầu và mong muốn của người khác. Làm thế nào để giữ gìn truyền thống tốt nhất, trong khi vẫn học cách thích nghi với thời cuộc đổi thay…',
     2,
     0, 11, '2024-12-3', '2024-12-3', 1);

-- Insert images for "Chōwa - Ổn Định Nội Tâm Sống Cân Bằng Như Người Nhật"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Chōwa - Ổn Định Nội Tâm Sống Cân Bằng Như Người Nhật'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/291/chowa-on-dinh-noi-tam-song-can-bang-nhu-nguoi-nhat.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Chōwa - Ổn Định Nội Tâm Sống Cân Bằng Như Người Nhật'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/291/chowa-on-dinh-noi-tam-song-can-bang-nhu-nguoi-nhat-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Chōwa - Ổn Định Nội Tâm Sống Cân Bằng Như Người Nhật'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/291/chowa-on-dinh-noi-tam-song-can-bang-nhu-nguoi-nhat-mockup.jpg', 1),
    ((SELECT b_id FROM books WHERE title = 'Chōwa - Ổn Định Nội Tâm Sống Cân Bằng Như Người Nhật'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/291/chowa-on-dinh-noi-tam-song-can-bang-nhu-nguoi-nhat-mockup-02.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Chōwa - Ổn Định Nội Tâm Sống Cân Bằng Như Người Nhật'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/291/chowa-on-dinh-noi-tam-song-can-bang-nhu-nguoi-nhat-mockup-03.jpg', 1);

-- Insert data for "Khoa Học Kỹ Năng Cho Thời Đại Mới - Làm Chủ Việc Tự Học (Tái bản năm 2024)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Khoa Học Kỹ Năng Cho Thời Đại Mới - Làm Chủ Việc Tự Học (Tái bản năm 2024)', 
     'Peter Hollins', 
     (SELECT category_id FROM categories WHERE category_name = 'Sách Tiếng Việt'),
     2,
     2024, '20.5 x 14 x 1 cm', 265, 157, 'Bìa mềm', 85500,
     'LÀM SAO ĐỂ:\n\nXác định mục tiêu tự học cụ thể và thiết thực?\nTự học bất cứ thứ gì với thời gian hạn chế?\nKhông bỏ dở việc tự học giữa chừng?\nMục đích của cuốn sách này là làm vơi đi một số khó khăn đó và giúp bạn trở thành một người tự học tận tụy, kiên quyết và nhanh nhẹn ở bất cứ môn học nào bạn đã chọn, sách sẽ dẫn dắt bạn từng bước tìm kiếm nguồn cảm hứng để học tập, hoạch định, phát triển những thói quen tốt và điều khiển việc học tập của chính mình.',
     3,
     0, 11, '2024-12-4', '2024-12-4', 1);

-- Insert images for "Khoa Học Kỹ Năng Cho Thời Đại Mới - Làm Chủ Việc Tự Học (Tái bản năm 2024)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Khoa Học Kỹ Năng Cho Thời Đại Mới - Làm Chủ Việc Tự Học (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/289/lam-chu-viec-tu-hoc-tb-2024.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Khoa Học Kỹ Năng Cho Thời Đại Mới - Làm Chủ Việc Tự Học (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/289/lam-chu-viec-tu-hoc-tb-2024-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Khoa Học Kỹ Năng Cho Thời Đại Mới - Làm Chủ Việc Tự Học (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/289/lam-chu-viec-tu-hoc-tb-2024-mockup.jpg', 1);


-- Insert data for "Nghệ Thuật Thiết Lập Truyền Thông (Tái bản năm 2024)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Nghệ Thuật Thiết Lập Truyền Thông (Tái bản năm 2024)', 
     'Thích Nhất Hạnh', 
     4,
     2,
     2024, '20.5 x 14 x 1 cm', 245, 183, 'Bìa mềm', 94500,
     'Nghệ Thuật Thiết Lập Truyền Thông là tập sách của Thiền sư Thích Nhất Hạnh - một trong những vị thiền sư có tầm ảnh hưởng sâu rộng đến cộng đồng tu tập Thiền trên toàn thế giới - nêu ra sự cần thiết của việc thiết lập truyền thông, trao đổi, giải tỏa những suy nghĩ, tâm tư, tình cảm của con người với nhau, và với cả bản thân mình. Từ đó, Thiền sư đề xuất các phương cách tạo lập truyền thông: thiền đi, thở, ôm trong chánh niệm; cách kiềm chế, chuyển hóa cơn giận... để mỗi người có thể lắng nghe cha mẹ, đồng nghiệp, và bản thân mình; hiểu rõ những khổ đau mà người khác phải chịu đựng, từ đó chữa lành những tổn thương trong quá khứ, vui sống với hiện tại, vị tha, bao dung hơn với mọi người. Hạnh phúc sẽ tỏa sáng khi con người hiểu biết và yêu thương nhau hơn.\n\n"Chúng ta thường cho rằng truyền thông là những gì chúng ta viết hay nói. Tuy nhiên dáng dấp của chúng ta, sắc diện của chúng ta, giọng nói, cử chỉ của chúng ta và ngay cả ý nghĩ của chúng ta, tất cả đều là những phương tiện truyền thông. Cũng như một cây cam cống hiến hoa, lá và trái cam tươi tốt, mỗi cá nhân trong cộng đồng cống hiến lời hay, cử chỉ đẹp. Một sự truyền thông không thể nào không có ảnh hưởng. Mỗi khi truyền thông là ta đóng góp hoặc yêu thương hòa hợp hoặc khổ đau đổ vỡ." (Thích Nhất Hạnh)',
     4,
     12, 23, '2024-12-1', '2024-12-1', 1);

-- Insert images for "Nghệ Thuật Thiết Lập Truyền Thông (Tái bản năm 2024)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Nghệ Thuật Thiết Lập Truyền Thông (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/nghe-thuat-thiet-lap-truyen-thong-tb-2024.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Nghệ Thuật Thiết Lập Truyền Thông (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/nghe-thuat-thiet-lap-truyen-thong-tb-2024-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Nghệ Thuật Thiết Lập Truyền Thông (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/nghe-thuat-thiet-lap-truyen-thong-tb-2024-mockup.jpg', 1);

-- Insert data for "Combo Sách Anh Khang 2024: Bước Qua Nước Mắt, Tự Khắc Trưởng Thành & Ngày Trôi Về Phía Cũ..."
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Combo Sách Anh Khang 2024: Bước Qua Nước Mắt, Tự Khắc Trưởng Thành & Ngày Trôi Về Phía Cũ... (Tặng Bộ 24 thẻ hình & Bộ sticker PVC cao cấp, kèm chữ ký tác giả - Áp dụng tới 10.11)', 
     'Anh Khang', 
     4,
     2,
     2024, '20.5 x 14 x 3 cm', 476, 505, 'Bìa mềm', 304200,
     'Combo Sách Anh Khang 2024: Bước Qua Nước Mắt, Tự Khắc Trưởng Thành & Ngày Trôi Về Phía Cũ...\n\n#1. Bước Qua Nước Mắt, Tự Khắc Trưởng Thành\n\n“‘Ra mắt’ thế giới sách bằng tản văn Ngày trôi về phía cũ… (2012) và tạo cơn sốt ngay ở tác phẩm đầu tiên, Anh Khang đến nay đã trở thành ‘hiện tượng xuất bản’ trong làng sách trẻ…” (Trích báo Thanh Niên)\n\nKỷ niệm hơn một thập kỷ gắn bó với văn chương, Anh Khang trình làng tác phẩm mới: Bước qua nước mắt, tự khắc trưởng thành. Anh Khang gọi đây là một “cuốn sách làm lành” – thay vì “ chữa lành” như cách gọi thường thấy trong xã hội hiện đại. Tác phẩm được chia làm hai phần, mở đầu bằng “Độc thoại” với những dòng tư lự đơn lẻ như tự trấn an “đứa trẻ bên trong đang ăn vạ trên đường trưởng thành”, rồi sang đến “ Đối thoại” là những lời tâm can san sẻ cùng Gen Z lẫn Gen Z(à) để tìm sự ủi an. Mỗi câu, mỗi lời tâm tình thủ thỉ đều quá đỗi chân thành, như chính lời tác giả tự nhận thì đây “chính là những ghi chép trong lúc ‘khóc một trận đã đời’, rồi từ nay, chỉ nhìn về phía trước”.\n\nMong bạn sẽ tìm thấy nơi từng trang sách, không chỉ là những cái gật gù tán đồng và câu trả lời về những nan đề trong tình trường của tuổi còn vụng dại, mà còn là để nhìn lại và mỉm cười bao dung với thanh xuân của chính chúng ta.\n\n------\n\n"Cuốn hút độc giả từ những câu chuyện tình mang màu sắc hoài niệm về một ký ức dở dang đầy nuối tiếc, nhưng Anh Khang không lặp lại lối mòn để chiều lòng người đọc, mà nhà văn trẻ 8x này luôn tìm tòi nhiều cách thể nghiệm để biến hóa ngòi bút đa dạng, phong phú."\n\n[Đài Truyền hình TP.HCM - HTV]\n\n"Trong suốt 10 năm qua, Anh Khang là tác giả sách say mê “theo đuổi” nỗi buồn và là người hiểu hơn ai hết nỗi lòng của người đang chung đôi lẫn những kẻ vẫn bền bỉ độc thân... Không chỉ được mệnh danh là “Hoàng tử ngôn tình” hay “ Nhà văn triệu bản”, anh còn được các độc giả gọi là “Chuyên gia thả thính”."\n\n[Tạp chí Đẹp]\n\n"Bút lực dồi dào, viết văn nhẹ nhàng, không cao siêu, không "tỏ ra nguy hiểm", sự thành công của Anh Khang là một ví dụ điển hình của việc thấu hiểu lớp độc giả của mình... và có sự "giao lưu" với từng người đọc."\n\n[Báo Tuổi Trẻ]\n\n#2. Ngày Trôi Về Phía Cũ...\n\nMột quyển sách với nhiều cảm xúc nhẹ nhàng về cuộc sống…\n\nChỉ là những cảm xúc được góp nhặt sau một-vài-lần yêu, những tản văn - tùy bút được tác giả viết như một cách cất giữ những điều xưa cũ của một thời non trẻ. Tác giả gom hết người cũ - chuyện xưa và gọi tên những trang viết này là Ngày Trôi Về Phía Cũ.... Chưa đủ dày dặn để gọi là “hồi ký của yêu thương”, cũng chưa hẳn là những lời hoa mỹ để dán mác “thư tình”, tất cả chỉ là những cảm xúc lửng lơ của những người trẻ vừa bước vào yêu. Có niềm tin lẫn thất vọng, có ngọt ngào lẫn cực đoan, nhưng tất cả rồi cũng trôi về phía sau và yên mình khép mắt, ngủ một giấc say nồng trong chăn ấm nệm êm mang tên “Kỷ niệm”.\n\nCó thể bạn sẽ choáng ngợp bởi tất cả những cảm xúc vụn vặt được góp nhặt thành câu chữ dưới đây đều chỉ viết về Tình yêu. Chẳng lẽ cuộc sống của những người trẻ bây giờ chỉ có thế thôi sao? Hẳn nhiên không phải vậy. Nhưng nếu để nhớ lại những ký ức của một thời tuổi trẻ, chắc hẳn nhiều người - sẽ nghĩ đến những cảm xúc yêu thương trước nhất. Bởi một lẽ đơn giản, khi người ta trẻ, người ta còn dư dả những niềm tin trong lành nhất để trao đi và nhận lại yêu thương.\n\nBiết đâu những người cùng thế hệ 8X sẽ bắt gặp mình đâu đó trong những cảm xúc nhặt nhạnh này, để nhắc nhớ mình về ngày cũ - người xưa. Nhớ nhung không phải để níu chân hay làm lòng bỗng dưng chùng lại, chỉ là để dặn dò hiện tại rằng hãy biết sống xứng đáng với quãng thời gian đa trôi về phía sau. Biết đâu một lúc nào đó quay về nhận mặt năm tháng, người ta sẽ thấy nhẹ lòng xiết bao khi thấy rằng những khoảnh khắc đa qua dù vui hay buồn, dù còn lại hay trôi xa, vẫn sẽ là những cảm xúc đã nuôi lớn “Tôi” của bây giờ.\n\n------\n\n"Đúng như tên gọi, tập tản văn được viết bằng những nỗi niềm xưa dành cho kỷ niệm đã qua. Đọc nó, chúng ta đều có thể thấy thấp thoáng mình đâu đó trên những trang viết. Đọc Ngày Trôi Về Phía Cũ... của Anh Khang, độc giả tìm thấy giọng văn lãng mạn, giàu chất thơ... Cuốn sách ghi lại những khoảnh khắc của tình yêu thời trẻ của tác giả, từ những vụng về bỡ ngỡ cho đến khi đã rời xa và quay nhìn lại với tất cả sự trân trọng." (VnExpress)\n\n"Ngày Trôi Về Phía Cũ... - tác phẩm đầu tay của tác giả Anh Khang - dễ làm người ta liên tưởng đến những điều đã qua với một chút hoặc rất nhiều tiếc nuối... Dù chỉ xoay quanh những cảm xúc tình yêu nhưng Ngày trôi về phía cũ... lại không hề bi lụy và não nề. Chọn cách nhìn thẳng vào những nỗi đau, những ngày vất vả đi qua một cuộc tình cũ, Khang viết như một cách trải lòng và tìm sự thấu cảm từ những độc giả của mình." (Tuổi Trẻ)\n\n"Đại diện cho thế hệ thanh niên trẻ tuổi, Anh Khang là một trong những cây viết tài năng thể hiện rõ những cảm nhận sâu sắc cùng những cảm quan nghệ thuật tinh tế. Sở dĩ những trang viết này gần gũi, dễ được các bạn trẻ đón nhận vì tác giả đã nói thay những cảm xúc của họ về người cũ chuyện xưa, điều mà ai cũng từng có và đánh mất trong đời." (Đài truyền hình TP.HCM - HTV7)',
     1,
     12, 23, '2024-5-11', '2024-5-11', 1);

-- Insert images for "Combo Sách Anh Khang 2024: Bước Qua Nước Mắt, Tự Khắc Trưởng Thành & Ngày Trôi Về Phía Cũ..."
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Combo Sách Anh Khang 2024: Bước Qua Nước Mắt, Tự Khắc Trưởng Thành & Ngày Trôi Về Phía Cũ... (Tặng Bộ 24 thẻ hình & Bộ sticker PVC cao cấp, kèm chữ ký tác giả - Áp dụng tới 10.11)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/combo-sach-anh-khang-2024.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Combo Sách Anh Khang 2024: Bước Qua Nước Mắt, Tự Khắc Trưởng Thành & Ngày Trôi Về Phía Cũ... (Tặng Bộ 24 thẻ hình & Bộ sticker PVC cao cấp, kèm chữ ký tác giả - Áp dụng tới 10.11)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/combo-sach-anh-khang-buoc-qua-nuoc-mat-tu-khac-truong-thanh.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Combo Sách Anh Khang 2024: Bước Qua Nước Mắt, Tự Khắc Trưởng Thành & Ngày Trôi Về Phía Cũ... (Tặng Bộ 24 thẻ hình & Bộ sticker PVC cao cấp, kèm chữ ký tác giả - Áp dụng tới 10.11)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/combo-sach-anh-khang-ngay-troi-ve-phia-cu-tb-2024.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Combo Sách Anh Khang 2024: Bước Qua Nước Mắt, Tự Khắc Trưởng Thành & Ngày Trôi Về Phía Cũ... (Tặng Bộ 24 thẻ hình & Bộ sticker PVC cao cấp, kèm chữ ký tác giả - Áp dụng tới 10.11)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/295/combo-sach-anh-khang-2024-gift.jpg', 1);

-- Insert data for "Tục Ngữ, Ca Dao, Dân Ca Việt Nam (Tái bản năm 2024)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Tục Ngữ, Ca Dao, Dân Ca Việt Nam (Tái bản năm 2024)', 
     'Vũ Ngọc Phan', 
     (SELECT category_id FROM categories WHERE category_name = 'Tiểu Thuyết'),
     3,
     2024, '23.5 x 15.5 x 4.5 cm', 860, 875, 'Bìa mềm', 405000,
     'Tác phẩm Tục Ngữ, Ca Dao, Dân Ca Việt Nam có giá trị sâu sắc nhiều mặt, được tái bản nhiều lần. Công trình này là kết quả của nhiều năm sưu tầm, nghiên cứu, tập hợp được khá nhiều tinh hoa tục ngữ, ca dao, dân ca vô cùng đa dạng và phong phú của cộng đồng các dân tộc Việt Nam...',
     4,
     12, 23, '2024-5-11', '2024-5-11', 1);

-- Insert images for "Tục Ngữ, Ca Dao, Dân Ca Việt Nam (Tái bản năm 2024)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Tục Ngữ, Ca Dao, Dân Ca Việt Nam (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/297/tuc-ngu-ca-dao-dan-ca-viet-nam-tb-2024.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Tục Ngữ, Ca Dao, Dân Ca Việt Nam (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/297/tuc-ngu-ca-dao-dan-ca-viet-nam-tb-2024-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Tục Ngữ, Ca Dao, Dân Ca Việt Nam (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/297/tuc-ngu-ca-dao-dan-ca-viet-nam-tb-2024-mockup.jpg', 1);

-- Insert data for "Tà Dương (Tái bản năm 2024)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Tà Dương (Tái bản năm 2024)', 
     'Dazai Osamu', 
     3,
     5,
     2024, '20.5 x 13 x 1.4 cm', 268, 875, 'Bìa mềm', 116100,
     'Tà Dương không chỉ là cuộc suy tàn của một gia đình quý tộc mà còn là cơn tan vỡ của một thời đại đầy ảo tưởng và một xã hội đầy nạn nhân. Đó là những ngày tháng phong ba và ám tối vào giữa thế kỷ hai mươi ở Nhật...',
     2,
     12, 23, '2024-5-11', '2024-5-11', 1);

-- Insert images for "Tà Dương (Tái bản năm 2024)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Tà Dương (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/297/ta-duong-tb-2024.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Tà Dương (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/297/ta-duong-tb-2024-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Tà Dương (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/297/ta-duong-tb-2024-mockup.jpg', 1);

-- Insert data for "Sổ Tay Sửa Lỗi Hành Văn: Lỗi Ngữ Pháp Trong Câu Có Trạng Ngữ Mở Đầu (Tái bản năm 2024)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Sổ Tay Sửa Lỗi Hành Văn: Lỗi Ngữ Pháp Trong Câu Có Trạng Ngữ Mở Đầu (Tái bản năm 2024)', 
     'Trần Thị Tuyết Mai, Cao Xuân Hạo', 
     4,
     6,
     2024, '20.5 x 13 x 0.6 cm', 268, 92, 'Bìa mềm', 52200,
     'Khi nói đến nhiệm vụ "giữ gìn sự trong sáng của tiếng Việt", khá nhiều người trong chúng ta thường nghĩ trước tiên đến việc thay thế những từ "Hán-Việt" bằng những từ "thuần Việt", mà ít khi nghĩ đến việc tìm cách làm sao cho câu văn được đúng mẹo luật...',
     4,
     12, 23, '2024-5-11', '2024-5-11', 1);

-- Insert images for "Sổ Tay Sửa Lỗi Hành Văn: Lỗi Ngữ Pháp Trong Câu Có Trạng Ngữ Mở Đầu (Tái bản năm 2024)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Sổ Tay Sửa Lỗi Hành Văn: Lỗi Ngữ Pháp Trong Câu Có Trạng Ngữ Mở Đầu (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/297/so-tay-sua-loi-hanh-van-tb-2024.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Sổ Tay Sửa Lỗi Hành Văn: Lỗi Ngữ Pháp Trong Câu Có Trạng Ngữ Mở Đầu (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/297/so-tay-sua-loi-hanh-van-tb-2024-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Sổ Tay Sửa Lỗi Hành Văn: Lỗi Ngữ Pháp Trong Câu Có Trạng Ngữ Mở Đầu (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/297/so-tay-sua-loi-hanh-van-tb-2024-mockup.jpg', 1);
    
   -- Insert data for "Chiến Tranh Hoa Hồng Giữa Lancaster Và York - Cuộc Chiến Vương Quyền Anh Quốc (Bìa cứng)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Chiến Tranh Hoa Hồng Giữa Lancaster Và York - Cuộc Chiến Vương Quyền Anh Quốc (Bìa cứng)', 
     'Alison Weir', 
     2,
     2,
     2024, '23.5 x 15.5 x 3.6 cm', 550, 656, 'Bìa mềm', 440100,
     'Thế kỷ 15 đã chứng kiến ngai vàng nước Anh năm lần đổi chủ, khi hai nhánh của triều đại Plantagenet xâu xé nhau để giành quyền cai trị vương quốc này. Cũng trong thời kỳ biến động ấy, những vị vua hùng mạnh và những quyền thần vĩ đại nhất lịch sử đã đối đầu nhau không chút khoan nhượng, từ Henry VI, vị quân vương ngoan đạo nhưng tâm lý thất thường, cam tâm trở thành con rối trong tay các phe phái quyền lực; cho đến Công tước xứ York, vị chủ soái can trường với tham vọng đoạt lại ngai vàng theo luật thừa kế cổ xưa. Đây đồng thời còn là thời kỳ mà những vị nữ hoàng, những người vợ như Margaret xứ Anjou kiên cường nắm lấy quyền lực giữa một thế giới bạo lực vốn không dành cho phái yếu.\n\nTác phẩm Chiến tranh Hoa hồng giữa Lancaster và York sẽ đưa người đọc tiếp cận một trong những giai đoạn đen tối nhất lịch sử châu Âu Trung cổ – Chiến tranh Hoa hồng, nơi lòng trung thành thường xuyên gặp thử thách và những tham vọng mù quáng dẫn đến những bi kịch không thể vãn hồi. Ngòi bút tài ba của nhà sử học Alison Weir không chỉ tái hiện sinh động bức tranh toàn cảnh bi thương của nước Anh qua các trận chiến đẫm máu như St. Albans, Wakefield, Towton… mà còn khắc họa nên câu chuyện về những cá nhân kiệt xuất với đầy đủ những cung bậc cảm xúc, dũng khí và bi kịch.\n\n“...sự kết thúc của danh tiếng, tước vị và mọi thứ thuộc về trần thế này. Nhà Bohun đâu rồi? Nhà Mowbray đâu rồi? Nhà Mortimer đâu rồi? Không, quan trọng hơn hết thảy, là nhà Plantagenet đâu rồi? Tất cả đều đã bị vùi chôn trong những bình hài cốt và huyệt mộ phàm nhân.”\n\n------\n\n\"Anh mù quáng lấy máu em ruột, Cha liều lĩnh sát hại con đẻ Con thành đồ tể giết chết cha: Tất cả chỉ vì York và Lancaster chia rẽ.\" (SHAKESPEARE)\n\n\"Tác phẩm học thuật toàn diện và hấp dẫn về một trong những cuộc nội chiến đẫm máu nhất lịch sử châu Âu.\" (SUNDAY TIMES)\n\n“Cuốn sách cực kỳ dễ đọc của Alison Weir đã giúp chúng ta giải mã một trong những thời kỳ phức tạp nhất lịch sử nước Anh…” (YORKSHIRE EVENING POST)\n\n“Weir dẫn dắt người đọc một cách tài tình qua những phả hệ hoàng tộc nước Anh đầy phức tạp và sự tranh đoạt ngai vàng của vô số những kẻ soán ngôi.” (CHICAGO TRIBUNE)\n\nThông tin tác giả\n\nAlison Weir là nhà văn sở hữu hàng loạt tiểu thuyết lịch sử phi hư cấu về thời kỳ Tudor và đồng thời cũng là nhà sử học hàng đầu tại Vương quốc Anh. Bà đã xuất bản 32 tác phẩm với hơn 3 triệu bản sách tại Anh và Hoa Kỳ. Hiện Alison Weir đang sống và làm việc tại vùng ngoại ô Surrey, nước Anh cùng hai con.\n\nMột số tác phẩm tạo nên tên tuổi của bà như:\n\n• Tudor Rose\n\n• Six Tudor Queens\n\n• Britain’s Royal Families\n\n• The Six Wives of Henry VIII\n\n• The Princes in the Tower\n\n• Children of England\n\n• Elizabeth the Queen',
     3,
     60, 23, '2024-3-11', '2024-4-11', 1);

-- Insert images for "Chiến Tranh Hoa Hồng Giữa Lancaster Và York - Cuộc Chiến Vương Quyền Anh Quốc (Bìa cứng)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Chiến Tranh Hoa Hồng Giữa Lancaster Và York - Cuộc Chiến Vương Quyền Anh Quốc (Bìa cứng)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/299/chien-tranh-hoa-hong-giua-lancaster-va-york-bc.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Chiến Tranh Hoa Hồng Giữa Lancaster Và York - Cuộc Chiến Vương Quyền Anh Quốc (Bìa cứng)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/299/chien-tranh-hoa-hong-giua-lancaster-va-york-bc-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Chiến Tranh Hoa Hồng Giữa Lancaster Và York - Cuộc Chiến Vương Quyền Anh Quốc (Bìa cứng)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/299/chien-tranh-hoa-hong-giua-lancaster-va-york-bc-bt.jpg', 1);
    
    
 -- Insert data for "Nhật Tụng Thiền Môn Giảng Giải - Công Phu Nở Đóa Sen Ngàn Cánh - Tập 3: Công Phu Ngày Thứ Tư"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description,  sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Nhật Tụng Thiền Môn Giảng Giải - Công Phu Nở Đóa Sen Ngàn Cánh - Tập 3: Công Phu Ngày Thứ Tư', 
     'Thích Nhất Hạnh', 
     9,
     2,
     2024, '24 x 15.5 x 3.4 cm', 523, 624, 'Bìa mềm', 332100,
     'Bộ sách Công Phu Nở Đóa Sen Ngàn Cánh cống hiến việc giới thiệu và luận giải một cách tỉ mỉ các kinh văn, nghi thức được trình bày trong sách Nhật Tụng Thiền Môn đã lưu hành, lần lượt cho bảy ngày trong tuần, gồm những nội dung của hai thời công phu sáng chiều.\n\nTập 3 của bộ sách - Công Phu Ngày Thứ Tư tiếp tục việc phân tích, giảng giải các kinh tiêu biểu được trì tụng trong ngày thứ Tư gồm: kinh Bốn lĩnh vực quán niệm, kinh Trung đạo nhân duyên, kinh Duyên sinh, Đại không, kinh Soi gương,... Bên cạnh đó, sách cũng bổ sung thêm phần phụ lục nguồn gốc kinh văn với nhiều thứ tiếng và những chỉ dẫn thực tập khác. Tin rằng đây là bộ sách ứng dụng thực tập bổ ích cho cả hai giới xuất gia và tại gia tu tập.\n\n“Công phu là sự thực tập, sự rèn luyện hằng ngày của chúng ta. Hễ có tu là có chứng, có rèn luyện là có thành công. Nhờ sự thực tập đi, đứng, nằm, ngồi, ăn, uống, thở, làm việc,… chúng ta đưa công phu của mình lên tới một mức độ nào đó, có thể làm cho ta từ một con người nở ra thành một đóa sen. Đóa sen không chỉ nở một cánh mà nở ra hai cánh, ba cánh, bốn cánh, ngàn cánh rất mầu nhiệm. Chỉ cần duy trì công phu của mình cho tinh chuyên, ta có thể làm cho đóa sen nở ra ngàn cánh, không chỉ ở đây mà ở khắp nơi; không phải trong những thời gian khác nhau mà là đồng thời. Cùng với tăng thân, chúng ta có khả năng làm cho những đóa sen ấy nở tươi từng giây từng phút.” (Thích Nhất Hạnh)\n\nTrích dẫn:\n\nCó những người nghĩ rằng thiền tập phải là sự chiến đấu giữa cái thiện và cái ác, giữa Phật và Ma. Nhưng trong ánh sáng của tương tức, rác làm ra hoa và hoa làm ra rác. Trong ta có phiền não và có bồ đề. Bồ đề không phải là kẻ thù của phiền não và phiền não không phải là kẻ thù của bồ đề. Nếu không giữ gìn thì bồ đề biến thành phiền não. Nếu biết cách tu tập chuyển hóa thì phiền não trở thành bồ đề. Không có rác thì không có hoa, không có phiền não thì không có bồ đề. “Phiền não tức bồ đề” là vậy.\n\n(Trích Kinh Bốn lĩnh vực quán niệm)',
     60, 23, '2024-4-11', '2024-4-11', 1);

-- Insert images for "Nhật Tụng Thiền Môn Giảng Giải - Công Phu Nở Đóa Sen Ngàn Cánh - Tập 3: Công Phu Ngày Thứ Tư"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Nhật Tụng Thiền Môn Giảng Giải - Công Phu Nở Đóa Sen Ngàn Cánh - Tập 3: Công Phu Ngày Thứ Tư'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/cong-phu-no-doa-sen-ngan-canh-tap-3.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Nhật Tụng Thiền Môn Giảng Giải - Công Phu Nở Đóa Sen Ngàn Cánh - Tập 3: Công Phu Ngày Thứ Tư'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/cong-phu-no-doa-sen-ngan-canh-tap-3-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Nhật Tụng Thiền Môn Giảng Giải - Công Phu Nở Đóa Sen Ngàn Cánh - Tập 3: Công Phu Ngày Thứ Tư'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/cong-phu-no-doa-sen-ngan-canh-tap-3-bt.jpg', 1);

-- Insert data for "Tội Ác Và Hình Phạt (Tái bản năm 2024)"
INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Tội Ác Và Hình Phạt (Tái bản năm 2024)', 
     'Fyodor Dostoevsky', 
    10,
     2,
     2024, '23.5 x 15.5 x 4 cm', 433, 728, 'Bìa mềm', 359100,
     'Tội Ác Và Hình Phạt là cuốn tiểu thuyết hoàn chỉnh và hay nhất trong các tác phẩm của cây bút bậc thầy nước Nga Fyodor Dostoevsky (1821 -1881). Chuyện kể về chàng sinh viên nghèo Raxkônnikốp vì quá lạc lối mà đã giết chết hai chị em bà lão cầm đồ. Những ngày sau đó, Raxkônnikốp rơi vào một bi kịch mới, khủng hoảng tinh thần trầm trọng. Anh càng cố gắng che giấu tội lỗi thì càng tỏ ra lúng túng.Tình yêu sâu sắc, sự hy sinh cao cả và tấm lòng nhân hậu của cô gái Xônya cùng sự quan tâm, yêu thương giúp đỡ của mọi người đã thức tỉnh Raxkônnikốp. Chấm dứt những giằng xé nội tâm, anh đưa ra quyết định: thà bị giam cầm về thể xác còn hơn bị tù đày về tâm hồn.\n\nCuốn tiểu thuyết là một trong những tác phẩm có nội dung bi thảm nhất của nền văn học nhân loại. Với tấm lòng nhân đạo vô bờ bến, tác giả đã dựng lên một bức tranh ảm đạm về số phận bế tắc của tầng lớp người dưới đáy xã hội Nga. Tác phẩm còn là lời tố cáo mãnh liệt tầng lớp tư sản hãnh tiến, giẫm đạp lên đạo đức, nhân phẩm, tài năng.',
     3,
     12, 23, '2024-4-11', '2024-4-11', 1);

-- Insert images for "Tội Ác Và Hình Phạt (Tái bản năm 2024)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Tội Ác Và Hình Phạt (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/toi-ac-va-hinh-phat-tb-2024.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Tội Ác Và Hình Phạt (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/toi-ac-va-hinh-phat-tb-2024-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Tội Ác Và Hình Phạt (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/298/toi-ac-va-hinh-phat-tb-2024-mockup.jpg', 1);


INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Kiếm Tiền Cùng ChatGPT - Vào Nghề Đồ Họa AI', 
     'Học Viện Văn Họa AIGC', 
     10,
     2,
     2024, '27 x 20 x 1.5 cm', 0.380, 300, 'Bìa mềm', 345000,
     'Kiếm tiền cùng ChatGPT – Vào nghề Đồ họa AI: Tập trung hướng dẫn độc giả sử dụng các công cụ AI tiên tiến như Midjourney, Stable Diffusion và các phần mềm chỉnh sửa như Premiere, CapCut. Độc giả sẽ học cách tích hợp kỹ năng từ văn bản, hình ảnh đến video, đi kèm nhiều case study và video hướng dẫn, giúp áp dụng ngay kiến thức vào công việc. Phương pháp tiếp cận từng bước đơn giản và hiệu quả giúp người đọc nhanh chóng nâng cao kỹ năng.\n\nCuốn sách này sẽ chia sẻ những kỹ năng đồ họa AI hữu ích, giúp bạn nắm bắt vẻ đẹp của khoảnh khắc và biểu đạt cảm xúc nội tâm bằng AI...',
     3,
     95, 110, '2024-12-16', '2024-12-16', 1);

-- Insert images for "Kiếm Tiền Cùng ChatGPT - Vào Nghề Đồ Họa AI"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Kiếm Tiền Cùng ChatGPT - Vào Nghề Đồ Họa AI'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/300/kiem-tien-cung-chat-gpt-vao-nghe-do-hoa-ai-p03.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Kiếm Tiền Cùng ChatGPT - Vào Nghề Đồ Họa AI'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/300/kiem-tien-cung-chat-gpt-vao-nghe-do-hoa-ai-p04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Kiếm Tiền Cùng ChatGPT - Vào Nghề Đồ Họa AI'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/300/kiem-tien-cung-chat-gpt-vao-nghe-do-hoa-ai-p05.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Kiếm Tiền Cùng ChatGPT - Vào Nghề Đồ Họa AI'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/300/kiem-tien-cung-chat-gpt-vao-nghe-do-hoa-ai-p06.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Kiếm Tiền Cùng ChatGPT - Vào Nghề Đồ Họa AI'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/300/kiem-tien-cung-chat-gpt-vao-nghe-do-hoa-ai-p07.jpg', 1);

INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Dẫn Dắt Một Bầy Sói Hay Chăn Một Đàn Cừu', 
     'Tiffani Bova', 
     10,
     2,
     2024, '20.5 x 13 x 1.8 cm', 0.400, 358, 'Bìa mềm', 195000,
     'DẪN DẮT MỘT BẦY SÓI HAY CHĂN MỘT ĐÀN CỪU — Phát triển đội ngũ nhân sự - Nâng cao trải nghiệm khách hàng – Gia tăng hiệu suất công việc\n\nTrong cuộc chiến thu hút khách hàng, các doanh nghiệp đầu tư hàng triệu đô la để cải thiện trải nghiệm của khách hàng. Họ giao hàng nhanh hơn, tung ra các sản phẩm mới và không ngừng cải tiến giao diện người dùng, và họ thường gây áp lực lớn hơn cho nhân viên vì lợi nhuận giảm dần. Theo tác giả Tiffani Bova, việc tập trung duy nhất vào trải nghiệm của khách hàng – mà không xem xét tác động đến nhân viên của bạn – thực sự cản trở sự phát triển về lâu dài. Các công ty thành công nhất áp dụng Tư duy trải nghiệm để củng cố cả trải nghiệm của nhân viên (EX) và trải nghiệm của khách hàng (CX) cùng một lúc.\n\nDựa trên nghiên cứu độc quyền từ hai nghiên cứu do Salesforce tài trợ với hàng nghìn nhân viên và giám đốc điều hành cấp cao, cuốn sách “Dẫn dắt một bầy sói hay chăn một đàn cừu” trình bày chi tiết chính xác cách công ty của bạn có thể áp dụng tư duy trải nghiệm trên quy mô lớn. Dù bạn đang làm quản lý, khởi nghiệp, hay quản lý cấp cao, cuốn sách sẽ giúp bạn sử dụng và giữ chân những nhân viên tài năng nhất, khiến họ toàn tâm, toàn ý với sứ mệnh của bạn, thu hút khách hàng nhiều hơn trước. Nhân viên là trái tim của doanh nghiệp bạn. Nếu bạn muốn duy trì khả năng cạnh tranh trên thị trường ngày nay, đầu tư vào con người không còn là điều nên có nữa mà là điều bắt buộc phải có. Sau khi đọc cuốn sách này, bạn sẽ trang bị cho mình một câu trả lời thỏa đáng cho câu hỏi “Nên đặt-nhân-viên hay khách-hàng lên trước”?\n\n------\n\n“Một cuốn sách thiết thực và khai sáng, cho bạn những công cụ hàng ngày, bổ sung mảnh ghép còn thiếu trong bức tranh tăng trưởng phức tạp, đó là: cải thiện trải nghiệm nhân viên.”\n\n— Arianna Huffington, người sáng lập và CEO của Thrive Global\n\n“Nếu bạn đang điều hành hay làm việc cho công ty nào đó thì cần đọc cuốn sách này. Nghiên cứu của Tiffani Bova trả lời một số câu hỏi cấp bách nhất hiện nay, tại sao thị trường lao động quá nhiều rối loạn, tại sao khách hàng không phải lúc nào cũng đúng, và tại sao công nghệ không phải lúc nào cũng giúp ích nhân viên.”\n\n— Rita McGrath, tác giả cuốn Seeing Around Corners và là giáo sư của trường Kinh doanh Columbia (Columbia Business School)\n\n“Điểm chung của những công ty thành công nhất trên thế giới? Đó là họ kết hợp hài hòa trải nghiệm nhân viên với trải nghiệm khách hàng. Cuốn sách này cho bạn thấy những trải nghiệm tưởng chừng khác biệt này liên kết với nhau thế nào và thay đổi công ty bạn với tư duy-hướng-đến-tăng-trưởng đó là: Tư duy Trải nghiệm.”\n\n— Deanna Singh, tác giả cuốn Actions Speak Louder, và là nhà tư vấn thay đổi chính của Flying Elephant\n\nThông tin tác giả\n\nTiffani Bova là người truyền bá tư tưởng phát triển khách hàng toàn cầu và đột phá sáng tạo tại Salesforce. Trong hơn 20 năm qua, cô đã dẫn dắt nhiều phòng, ban tạo doanh thu tại rất nhiều doanh nghiệp, từ tân binh khởi nghiệp đến những “lão làng” trong danh sách Fortune 500.\n\nCô đã có 10 năm làm việc tại Gartner, công ty nghiên cứu và cố vấn IT hàng đầu thế giới, với tư cách một chuyên gia phân tích và nghiên cứu viên ưu tú. Những quan điểm độc đáo của cô đã giúp Microsoft, Cisco, Hewlett-Packard, IBM, Oracle, SAP, AT&T, DEII, Amazon-AWS và nhiều công ty xuất sắc khác mở rộng thị phần và tăng doanh thu.',
     230, 23, '2024-12-11', '2024-12-11', 1);

-- Insert images for "Dẫn Dắt Một Bầy Sói Hay Chăn Một Đàn Cừu"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Dẫn Dắt Một Bầy Sói Hay Chăn Một Đàn Cừu'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/293/dan-dat-mot-bay-soi-hay-chan-mot-dan-cuu.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Dẫn Dắt Một Bầy Sói Hay Chăn Một Đàn Cừu'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/293/dan-dat-mot-bay-soi-hay-chan-mot-dan-cuu-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Dẫn Dắt Một Bầy Sói Hay Chăn Một Đàn Cừu'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/293/dan-dat-mot-bay-soi-hay-chan-mot-dan-cuu-mockup.jpg', 1);

INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Mùa Xuân Vắng Lặng (Tái bản năm 2024)', 
     'Rachel Carson', 
     10,
     2,
     2024, '23.5 x 15.5 x 1.8 cm', 0.400, 353, 'Bìa mềm', 170100,
     'Nhà tự nhiên học nổi tiếng Sir David Attenborough cho rằng nếu phải tìm một tác phẩm để so sánh với Mùa Xuân Vắng Lặng về sức ảnh hưởng của nó lên thế giới khoa học kỹ thuật này, thì đó chỉ có thể là Nguồn gốc các loài (The Origin of Species) của Charles Darwin.\n\nĐược đăng thành nhiều kỳ trên tờ New Yorker trước khi xuất bản thành sách vào tháng Chín năm 1962; đến nay, Mùa Xuân Vắng Lặng đã bán được hơn hai triệu bản.\n\nRachel Carson đã chỉ ra những thiệt hại nghiêm trọng về môi trường sống do thuốc trừ sâu tổng hợp DDT gây ra, và bày tỏ sự quan ngại to lớn khi chính phủ Mỹ cho phép việc sử dụng tràn lan những hóa chất độc hại trước khi hiểu rõ hệ quả lâu dài của chúng đối với môi trường và sự sống.\n\nCuốn sách ra đời không những gây ảnh hưởng mạnh mẽ trong xã hội Mỹ, như một hồi chuông cảnh tỉnh về môi trường, mà còn là tiền đề cho việc ra đời nhiều bộ luật và cơ quan kiểm soát chặt chẽ sau này. Ngoài lệnh cấm bán DDT trên toàn nước Mỹ vài năm sau đó, cuốn sách còn là khởi nguồn của Đạo luật Nước và Không khí sạch, Đạo luật Chính sách Môi trường Quốc gia, và dẫn đến sự ra đời của Ngày Trái Đất.\n\n------\n\n\"Rachel Carson để lại cho chúng ta một di sản không chỉ có thể bao quát được cuộc sống tương lai, nhiệt huyết cả đời của bà, mà còn giữ vững được tinh thần của nhiều thế hệ. Bà bắt chúng ta đối mặt với sự tàn phá của hóa chất lên toàn cầu và kêu gọi chúng ta điều chỉnh lại tham vọng của bản thân - một thái độ mang tính cách mạng - để duy trì sự sống cho chính mình.\" — Linda Lear\n\n\"Xét tổng thể, Rachel Carson đã thành công trong việc làm chúng ta khiếp sợ bị thế giới tự nhiên ruồng bỏ. Tác phẩm của bà gợi lên nỗi oán giận, sự tổn thương và tính phản kháng. Đó là Túp lều của bác Tom ở thế kỷ 20.\" — Walter Sullivan, \"Books of the Times”, New York Times, 1962',
     230, 23, '2024-1-11', '2024-1-11', 1);

-- Insert images for "Mùa Xuân Vắng Lặng (Tái bản năm 2024)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Mùa Xuân Vắng Lặng (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/300/mua-xuan-vang-lang-tb-2024.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Mùa Xuân Vắng Lặng (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/300/mua-xuan-vang-lang-tb-2024-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Mùa Xuân Vắng Lặng (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/300/mua-xuan-vang-lang-tb-2024-mockup.jpg', 1);

INSERT INTO books 
    (title, author, category_id, p_id, publish_year, dimensions, weight, page_count, format, original_price, description, promotion_id, sold_quantity, stock_quantity, create_at, update_at, status)
VALUES
    ('Đời Sống Bí Ẩn Của Cây (Tái bản năm 2024)', 
     'Peter Wohlleben', 
     10,
     2,
     2024, '23.5 x 15.5 x 1.3 cm', 0.400, 256, 'Bìa mềm', 134100,
     'Chúng cảm thấy gì?\n\nChúng giao tiếp thế nào?\n\nNhững phát hiện từ Thế Giới Bí Mật\n\n\"Khi bạn biết rằng cây cũng biết đau, cũng có ký ức, và cây ba mẹ sống cùng con cái, thì bạn không còn có thể chặt chúng và phá vỡ cuộc sống của chúng bằng những cỗ máy to lớn nữa\"\n\nĐược xem là một trong những quyển sách hay nhất về cây cối, \"Đời sống bí ẩn của cây\" mở ra một thế giới kỳ diệu về đời sống xã hội phức tạp của những khu rừng ôn đới. Những cái cây giao tiếp với nhau, thể hiện cá tính riêng, hỗ trợ nhau lớn lên, chia sẻ chất dinh dưỡng cho những cá nhân đang chống chọi bệnh tật và thậm chí cảnh báo nhau về những nguy hiểm sắp xảy ra... Không chỉ gây bất ngờ với những thông tin hấp dẫn về các loài cây cối mà lâu nay chúng ta vẫn xem là vô tri vô giác, trong tác phẩm này, Wohlleben còn chia sẻ tình yêu sâu sắc của ông đối với cây và rừng, đồng thời giải thích các tiến trình thú vị của sự sống, cái chết và sự tái sinh mà ông đã quan sát được trong chính khu rừng của mình.\n\n------\n\n\"Wohlleben thực sự khiến cho độc giả thích thú với những thông tin mà từ lâu các nhà sinh vật học đã nhắc đến - rằng cây trong rừng cũng có một đời sống xã hội.\" — Sally McGrane, The New York Times\n\n\"Cuốn sách này sẽ gây tò mò và tạo cảm hứng cho bất cứ độc giả nào yêu thích việc dạo chơi trong rừng.\" — Publishers Weekly\n\n\"Đó là lời nhắc nhở sâu sắc cho chúng ta về sự khiêm nhường và nghiêng mình trước thông điệp của Thiên nhiên.\" — Rachel Sussman, Tác giả của The Oldest Living Things in The World\n\n\"Bạn sẽ nhìn một cái cây khác đi sau khi đọc Đời Sống Bí Ẩn Của Cây của Peter Wohlleben, cuốn sách tiết lộ những thuộc tính và hành vi đáng kinh ngạc của những gã khổng lồ trên cạn. Hãy đọc sách, sau đó bước ra ngoài và ôm một cái cây - với tất cả lòng biết ơn và ngưỡng mộ.\" — David Suzuki"',
     3,
     230, 23, '2024-2-11', '2024-2-11', 1);

-- Insert images for "Đời Sống Bí Ẩn Của Cây (Tái bản năm 2024)"
INSERT INTO images (b_id, source_img, is_thumbnail) VALUES
    ((SELECT b_id FROM books WHERE title = 'Đời Sống Bí Ẩn Của Cây (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/300/doi-song-bi-an-cua-cay-tb-2024.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Đời Sống Bí Ẩn Của Cây (Tái bản năm 2024)'), 'https://nhasachphuongnam.com/images/thumbnails/435/537/detailed/300/doi-song-bi-an-cua-cay-tb-2024-b04.jpg', 0),
    ((SELECT b_id FROM books WHERE title = 'Đời Sống Bí Ẩn Của Cây (Tái bản năm 2024)'), 
    'https://nhasachphuongnam.com/images/thumbnails/80/80/detailed/300/doi-song-bi-an-cua-cay-tb-2024-mockup.jpg',1);

-- -------------------------------------------------------------
INSERT INTO invoices (
    uid, recipient_name, recipient_phone, address, order_date, status, shipping_fee, completion_date
) VALUES
(1, 'Nguyễn Văn An', '0912345678', '123 Mai Xuân Thưởng, Quận 1, TP.HCM', '2024-12-01 08:00:00', 'Pending', 50000, NULL),
(2, 'Trần Thị Bình', '0923456789', '456 Nguyễn Thị Minh Khai, Quận 3, TP.HCM', '2024-12-02 09:15:00', 'Completed', 40000, '2024-12-03 11:00:00'),
(3, 'Phạm Quang Cẩm', '0934567890', '789 Lý Thái Tổ, Quận 5, TP.HCM', '2024-12-03 10:30:00', 'Pending', 55000, NULL),
(4, 'Lê Minh Duy', '0945678901', '101 Nguyễn Hữu Cảnh, Quận 10, TP.HCM', '2024-12-04 11:45:00', 'Completed', 60000, '2024-12-05 14:20:00'),
(5, 'Vũ Đức Tài', '0956789012', '202 Phan Đăng Lưu, Quận Bình Thạnh, TP.HCM', '2024-12-05 12:00:00', 'Pending', 52000, NULL),
(6, 'Hoàng Thị Hoa', '0967890123', '303 Đường 3/2, Quận 11, TP.HCM', '2024-12-06 13:10:00', 'Completed', 45000, '2024-12-07 15:25:00'),
(7, 'Nguyễn Hữu Giang', '0978901234', '404 Lê Đại Hành, Quận 12, TP.HCM', '2024-12-07 14:30:00', 'Pending', 50000, NULL),
(8, 'Trần Minh Hải', '0989012345', '505 Đỗ Ngọc Thạnh, Quận 4, TP.HCM', '2024-12-08 15:50:00', 'Completed', 53000, '2024-12-09 16:00:00'),
(9, 'Phạm Minh Thành', '0990123456', '606 Cộng Hòa, Quận Tân Bình, TP.HCM', '2024-12-09 16:20:00', 'Pending', 49000, NULL),
(10, 'Lê Quang Mạnh', '0912345678', '707 Lê Trọng Tấn, Quận Gò Vấp, TP.HCM', '2024-12-10 17:00:00', 'Completed', 56000, '2024-12-11 17:30:00'),
(11, 'Vũ Quang Khanh', '0923456789', '808 Bà Hạt, Quận 1, TP.HCM', '2024-12-11 18:10:00', 'Pending', 58000, NULL),
(12, 'Hoàng Thị Linh', '0934567890', '909 Nguyễn Văn Cừ, Quận 3, TP.HCM', '2024-12-12 19:20:00', 'Completed', 59000, '2024-12-13 20:40:00'),
(13, 'Nguyễn Duy Mai', '0945678901', '1010 Trường Chinh, Quận Tân Phú, TP.HCM', '2024-12-13 20:30:00', 'Pending', 54000, NULL),
(14, 'Trần Quang Ngọc', '0956789012', '1111 Lý Tự Trọng, Quận Bình Thạnh, TP.HCM', '2024-12-14 21:00:00', 'Completed', 51000, '2024-12-15 22:15:00'),
(15, 'Phạm Duy Thủ', '0967890123', '1212 Phan Xích Long, Quận Phú Nhuận, TP.HCM', '2024-12-15 22:30:00', 'Pending', 55000, NULL),
(16, 'Lê Thị Hoa', '0978901234', '1313 Nguyễn Đình Chiểu, Quận 2, TP.HCM', '2024-12-16 23:00:00', 'Completed', 47000, '2024-12-17 23:30:00'),
(17, 'Vũ Thị Q', '0989012345', '1414 Cách Mạng Tháng 8, Quận 10, TP.HCM', '2024-12-17 00:00:00', 'Pending', 49000, NULL),
(18, 'Hoàng Duy Hải', '0990123456', '1515 Hòa Hảo, Quận 6, TP.HCM', '2024-12-18 01:00:00', 'Completed', 56000, '2024-12-19 01:15:00'),
(19, 'Nguyễn Minh Sang', '0912345678', '1616 Trần Hưng Đạo, Quận 8, TP.HCM', '2024-12-19 02:00:00', 'Pending', 50000, NULL),
(20, 'Trần Duy Tường', '0923456789', '1717 Võ Thị Sáu, Quận 5, TP.HCM', '2024-12-20 03:00:00', 'Completed', 52000, '2024-12-21 03:45:00'),
(21, 'Nguyễn Hương Mai', '0990123456', '4000 Lê Lợi, Quận 1, TP.HCM', '2024-12-31 23:59:59', 'Completed', 60000, '2025-01-01 00:00:00'),
(22, 'Lê Thị Thanh', '0912345678', '505 Phạm Ngọc Thạch, Quận 6, TP.HCM', '2024-12-21 04:15:00', 'Pending', 51000, NULL),
(23, 'Trần Quang Hưng', '0923456789', '606 Nguyễn Tri Phương, Quận 10, TP.HCM', '2024-12-22 05:30:00', 'Completed', 53000, '2024-12-23 06:45:00'),
(24, 'Nguyễn Thị Lan', '0934567890', '707 Phan Huy Ích, Quận Tân Bình, TP.HCM', '2024-12-23 06:45:00', 'Pending', 54000, NULL),
(25, 'Phạm Quang Sơn', '0945678901', '808 Trường Sơn, Quận 12, TP.HCM', '2024-12-24 07:00:00', 'Completed', 55000, '2024-12-25 08:15:00'),
(26, 'Vũ Minh Tân', '0956789012', '909 Cộng Hòa, Quận Gò Vấp, TP.HCM', '2024-12-25 08:30:00', 'Pending', 56000, NULL),
(27, 'Hoàng Thị Tuyết', '0967890123', '1010 Nguyễn Văn Linh, Quận 7, TP.HCM', '2024-12-26 09:00:00', 'Completed', 57000, '2024-12-27 10:30:00'),
(28, 'Nguyễn Quang Hòa', '0978901234', '1111 Lê Văn Sĩ, Quận 3, TP.HCM', '2024-12-27 10:30:00', 'Pending', 48000, NULL),
(29, 'Trần Thị Thanh Tâm', '0989012345', '1212 Nguyễn Huệ, Quận Bình Thạnh, TP.HCM', '2024-12-28 11:45:00', 'Completed', 49000, '2024-12-29 12:30:00'),
(30, 'Phạm Minh Thành', '0990123456', '1313 Võ Văn Kiệt, Quận 8, TP.HCM', '2024-12-29 12:00:00', 'Pending', 50000, NULL),
(31, 'Lê Quang Vinh', '0912345678', '1414 Lý Tự Trọng, Quận 1, TP.HCM', '2024-12-30 13:00:00', 'Completed', 52000, '2024-12-31 13:45:00'),
(32, 'Nguyễn Thị Mai', '0923456789', '1515 Hoàng Văn Thụ, Quận 10, TP.HCM', '2024-12-31 14:15:00', 'Pending', 53000, NULL),
(33, 'Trần Duy Tường', '0934567890', '1616 Trường Chinh, Quận Tân Phú, TP.HCM', '2025-01-01 15:30:00', 'Completed', 54000, '2025-01-02 16:00:00'),
(34, 'Vũ Thị Kim', '0945678901', '1717 Phan Xích Long, Quận Phú Nhuận, TP.HCM', '2025-01-02 16:45:00', 'Pending', 55000, NULL),
(35, 'Phạm Đức An', '0956789012', '1818 Nguyễn Thị Minh Khai, Quận 4, TP.HCM', '2025-01-03 17:30:00', 'Completed', 56000, '2025-01-04 18:00:00'),
(36, 'Lê Thị Lan', '0967890123', '1919 Lý Thái Tổ, Quận 5, TP.HCM', '2025-01-04 18:45:00', 'Pending', 57000, NULL),
(37, 'Hoàng Quang Duy', '0978901234', '2020 Cách Mạng Tháng 8, Quận 12, TP.HCM', '2025-01-05 19:30:00', 'Completed', 58000, '2025-01-06 20:15:00'),
(38, 'Nguyễn Minh Hải', '0989012345', '2121 Nguyễn Văn Cừ, Quận 3, TP.HCM', '2025-01-06 20:45:00', 'Pending', 59000, NULL),
(39, 'Trần Duy Bình', '0990123456', '2222 Phan Đăng Lưu, Quận Bình Thạnh, TP.HCM', '2025-01-07 21:00:00', 'Completed', 60000, '2025-01-08 22:00:00'),
(6, 'Khanh Phan', '192844313', 'Số 184 đường 58 Tiền Giang', '2024-12-26 10:00:00', 'Completed', 46000, '2024-12-27'),
(11, 'An Ngo', '930401532', 'Số 776 đường 88 Nghệ An', '2024-12-27 10:00:00', 'Completed', 11000, '2024-12-29'),
(7, 'Minh Duong', '497300608', 'Số 729 đường 72 Thái Bình', '2024-01-01 10:00:00', 'Completed', 24000, '2024-01-03'),
(12, 'Hung Trinh', '828951720', 'Số 408 đường 25 Bình Định', '2025-12-02 14:52:00', 'Completed', 18000, '2025-02-14'),
(4, 'Hoa Tran', '860798598', 'Số 800 đường 38 Quảng Trị', '2024-06-01 09:11:00', 'Cancelled', 18000, '2024-01-08'),
(6, 'Tuan Vu', '774269464', 'Số 210 đường 29 Hà Nội', '2025-01-01 18:03:00', 'Completed', 11000, '2025-01-02'),
(3, 'Anh Duong', '923324296', 'Số 337 đường 46 Đắk Nông', '2024-01-20 07:30:00', 'Completed', 43000, '2024-01-21'),
(20, 'Minh Trinh', '176935457', 'Số 436 đường 40 Sóc Trăng', '2025-09-08 05:27:00', 'Completed', 44000, '2025-09-09'),
(2, 'Thanh Ho', '647427749', 'Số 415 đường 65 Ninh Bình', '2024-01-29 16:55:00', 'Completed', 36000, '2024-01-31'),
(16, 'Lan Bui', '656955828', 'Số 477 đường 20 Hà Nội', '2025-10-10 22:40:00', 'Cancelled', 33000, '2025-10-12'),
(10, 'Anh Huynh', '590892084', 'Số 554 đường 71 Hải Dương', '2024-12-05 03:18:00', 'Completed', 35000, '2024-12-06'),
(14, 'Nhi Do', '916361317', 'Số 513 đường 56 Tiền Giang', '2024-12-10 21:22:00', 'Completed', 26000, '2024-12-12'),
(5, 'Lan Luong', '318224092', 'Số 436 đường 3 Cần Thơ', '2024-07-06 19:14:00', 'Completed', 23000, '2024-07-07'),
(9, 'Duc Huynh', '239797991', 'Số 187 đường 100 Vĩnh Phúc', '2024-05-02 12:40:00', 'Completed', 11000, '2024-05-04'),
(18, 'Dieu Trinh', '727982079', 'Số 111 đường 14 Bình Thuận', '2024-04-09 08:32:00', 'Completed', 35000, '2024-04-12'),
(11, 'Anh Do', '927078645', 'Số 915 đường 93 Quảng Trị', '2024-12-02 13:45:00', 'Completed', 35000, '2024-12-14'),
(16, 'Tuan Duong', '783042013', 'Số 830 đường 11 Khánh Hòa', '2025-02-20 23:40:00', 'Completed', 28000, '2025-02-22'),
(3, 'Hoa Do', '637897859', 'Số 626 đường 10 Hải Phòng', '2024-03-02 16:08:00', 'Completed', 22000, '2024-03-05'),
(13, 'Huyen Ngoc', '743122695', 'Số 31 đường 91 Nghệ An', '2025-02-24 15:37:00', 'Completed', 24000, '2025-02-25'),
(8, 'dan', '558564346', 'Số 31 đường 91 Nghệ An', '2024-03-02 16:08:00', 'Completed', 22000, '2024-03-03'),
(6, 'Khanh Phan', '192844313', 'Số 184 đường 58 Tiền Giang', '2025-01-17 23:03:02', 'Completed', 46000, '2025-01-18 03:45:00'),
(11, 'An Ngo', '930401532', 'Số 776 đường 88 Nghệ An', '2025-01-17 23:03:02', 'Completed', 11000, '2025-01-19 09:15:00'),
(7, 'Minh Duong', '497300608', 'Số 729 đường 72 Thái Bình', '2025-01-17 23:03:02', 'Completed', 24000, '2025-01-18 12:30:00'),
(12, 'Hung Trinh', '828951720', 'Số 408 đường 25 Bình Định', '2025-01-17 23:03:02', 'Completed', 18000, '2025-02-14 10:45:00'),
(4, 'Hoa Tran', '860798598', 'Số 800 đường 38 Quảng Trị', '2025-01-17 23:03:02', 'Cancelled', 18000, '2025-01-20 14:20:00'),
(6, 'Tuan Vu', '774269464', 'Số 210 đường 29 Hà Nội', '2025-01-17 23:03:02', 'Completed', 11000, '2025-01-18 16:05:00'),
(3, 'Anh Duong', '923324296', 'Số 337 đường 46 Đắk Nông', '2025-01-17 23:03:02', 'Completed', 43000, '2025-01-18 11:50:00'),
(20, 'Minh Trinh', '176935457', 'Số 436 đường 40 Sóc Trăng', '2025-01-17 23:03:02', 'Completed', 44000, '2025-09-10 08:00:00'),
(2, 'Thanh Ho', '647427749', 'Số 415 đường 65 Ninh Bình', '2025-01-17 23:03:02', 'Completed', 36000, '2025-01-18 18:20:00'),
(16, 'Lan Bui', '656955828', 'Số 477 đường 20 Hà Nội', '2025-01-17 23:03:02', 'Completed', 33000, '2025-10-13 22:35:00'),
(10, 'Anh Huynh', '590892084', 'Số 554 đường 71 Hải Dương', '2025-01-17 23:03:02', 'Completed', 35000, '2025-01-18 01:40:00'),
(14, 'Nhi Do', '916361317', 'Số 513 đường 56 Tiền Giang', '2025-01-17 23:03:02', 'Completed', 26000, '2025-01-18 15:25:00'),
(5, 'Lan Luong', '318224092', 'Số 436 đường 3 Cần Thơ', '2025-01-17 23:03:02', 'Completed', 23000, '2025-07-08 10:50:00'),
(9, 'Duc Huynh', '239797991', 'Số 187 đường 100 Vĩnh Phúc', '2025-01-17 23:03:02', 'Completed', 11000, '2025-01-19 17:40:00'),
(18, 'Dieu Trinh', '727982079', 'Số 111 đường 14 Bình Thuận', '2025-01-17 23:03:02', 'Completed', 35000, '2025-01-18 13:30:00'),
(11, 'Anh Do', '927078645', 'Số 915 đường 93 Quảng Trị', '2025-01-17 23:03:02', 'Completed', 35000, '2025-01-18 16:55:00'),
(16, 'Tuan Duong', '783042013', 'Số 830 đường 11 Khánh Hòa', '2025-01-17 23:03:02', 'Completed', 28000, '2025-02-22 10:10:00'),
(3, 'Hoa Do', '637897859', 'Số 626 đường 10 Hải Phòng', '2025-01-17 23:03:02', 'Completed', 22000, '2025-03-06 11:25:00'),
(13, 'Huyen Ngoc', '743122695', 'Số 31 đường 91 Nghệ An', '2025-01-17 23:03:02', 'Cancelled', 24000, '2025-02-26 13:00:00'),
(8, 'dan', '558564346', 'Số 31 đường 91 Nghệ An', '2025-01-17 23:03:02', 'Completed', 22000, '2025-03-04 09:10:00');

-- -------------------------------
-- insert table stocks 
INSERT INTO Stocks (b_id, quantity, stock_date) VALUES
(1, 50, '2024-12-01 10:00:00'),
(2, 30, '2024-12-02 11:30:00'),
(3, 40, '2024-12-03 09:45:00'),
(1, 20, '2025-01-05 14:00:00'), -- thêm hàng cho sách ID 1
(4, 60, '2025-01-10 08:20:00'),
(2, 25, '2025-02-12 16:10:00'),
(5, 100, '2025-03-01 13:00:00'),
(3, 15, '2025-03-15 17:00:00'),
(6, 80, '2025-04-01 10:30:00'),
(1, 10, '2025-04-05 12:00:00'); -- lần nhập kho gần nhất cho sách ID 1

INSERT INTO Stocks (b_id, quantity, stock_date) VALUES
(7, 30, '2025-03-01 09:00:00'),
(8, 40, '2025-03-02 09:10:00'),
(9, 25, '2025-03-03 09:20:00'),
(10, 35, '2025-03-04 09:30:00'),
(11, 50, '2025-03-05 09:40:00'),
(12, 20, '2025-03-06 09:50:00'),
(13, 60, '2025-03-07 10:00:00'),
(14, 45, '2025-03-08 10:10:00'),
(15, 55, '2025-03-09 10:20:00'),
(16, 30, '2025-03-10 10:30:00'),
(17, 40, '2025-03-11 10:40:00'),
(18, 35, '2025-03-12 10:50:00'),
(19, 25, '2025-03-13 11:00:00'),
(20, 50, '2025-03-14 11:10:00'),
(21, 45, '2025-03-15 11:20:00'),
(22, 60, '2025-03-16 11:30:00'),
(23, 30, '2025-03-17 11:40:00'),
(24, 20, '2025-03-18 11:50:00'),
(25, 55, '2025-03-19 12:00:00'),
(26, 35, '2025-03-20 12:10:00'),
(27, 40, '2025-03-21 12:20:00'),
(28, 45, '2025-03-22 12:30:00'),
(29, 50, '2025-03-23 12:40:00'),
(30, 30, '2025-03-24 12:50:00'),
(31, 25, '2025-03-25 13:00:00'),
(32, 60, '2025-03-26 13:10:00'),
(33, 55, '2025-03-27 13:20:00'),
(34, 35, '2025-03-28 13:30:00'),
(35, 40, '2025-03-29 13:40:00'),
(36, 45, '2025-03-30 13:50:00'),
(37, 50, '2025-03-31 14:00:00'),
(38, 60, '2025-04-01 14:10:00'),
(39, 20, '2025-04-02 14:20:00'),
(40, 30, '2025-04-03 14:30:00'),
(41, 25, '2025-04-04 14:40:00'),
(42, 35, '2025-04-05 14:50:00'),
(43, 40, '2025-04-06 15:00:00'),
(44, 45, '2025-04-07 15:10:00'),
(45, 50, '2025-04-08 15:20:00'),
(46, 55, '2025-04-09 15:30:00'),
(47, 60, '2025-04-10 15:40:00'),
(48, 35, '2025-04-11 15:50:00'),
(49, 30, '2025-04-12 16:00:00'),
(50, 25, '2025-04-13 16:10:00'),
(51, 40, '2025-04-14 16:20:00'),
(52, 50, '2025-04-15 16:30:00'),
(53, 55, '2025-04-16 16:40:00'),
(54, 60, '2025-04-17 16:50:00'),
(55, 20, '2025-04-18 17:00:00'),
(56, 35, '2025-04-19 17:10:00'),
(57, 30, '2025-04-20 17:20:00'),
(58, 25, '2025-04-21 17:30:00'),
(59, 40, '2025-04-22 17:40:00'),
(60, 45, '2025-04-23 17:50:00'),
(61, 50, '2025-04-24 18:00:00'),
(62, 55, '2025-04-25 18:10:00'),
(63, 60, '2025-04-26 18:20:00'),
(64, 35, '2025-04-27 18:30:00'),
(65, 30, '2025-04-28 18:40:00'),
(66, 25, '2025-04-29 18:50:00');
-- -----------------------------
INSERT IGNORE INTO invoice_details (invoice_id, b_id, quantity, unit_price)
SELECT 
    (SELECT invoice_id FROM invoices ORDER BY RAND() LIMIT 1) AS invoice_id,
    (SELECT b_id FROM books ORDER BY RAND() LIMIT 1) AS b_id,
    FLOOR(RAND() * 5 + 1) AS quantity,
    (SELECT original_price FROM books ORDER BY RAND() LIMIT 1) AS unit_price
FROM 
    (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5
     UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10
     UNION SELECT 11 UNION SELECT 12 UNION SELECT 13 UNION SELECT 14 UNION SELECT 15
     UNION SELECT 16 UNION SELECT 17 UNION SELECT 18 UNION SELECT 19 UNION SELECT 20
     UNION SELECT 21 UNION SELECT 22 UNION SELECT 23 UNION SELECT 24 UNION SELECT 25
     UNION SELECT 26 UNION SELECT 27 UNION SELECT 28 UNION SELECT 29 UNION SELECT 30
     UNION SELECT 31 UNION SELECT 32 UNION SELECT 33 UNION SELECT 34 UNION SELECT 35
     UNION SELECT 36 UNION SELECT 37 UNION SELECT 38 UNION SELECT 39 UNION SELECT 40
     UNION SELECT 41 UNION SELECT 42 UNION SELECT 43 UNION SELECT 44 UNION SELECT 45
     UNION SELECT 46 UNION SELECT 47 UNION SELECT 48 UNION SELECT 49 UNION SELECT 50
     UNION SELECT 51 UNION SELECT 52 UNION SELECT 53 UNION SELECT 54 UNION SELECT 55
     UNION SELECT 56 UNION SELECT 57 UNION SELECT 58 UNION SELECT 59 UNION SELECT 60
     UNION SELECT 61 UNION SELECT 62 UNION SELECT 63 UNION SELECT 64 UNION SELECT 65
     UNION SELECT 76 UNION SELECT 77 UNION SELECT 78 UNION SELECT 79 UNION SELECT 70) AS tmp;
 -- ----------------------------------------
INSERT INTO payments (invoice_id, amount, payment_date, payment_method, payment_status)
SELECT 
    i.invoice_id,
    COALESCE((SELECT SUM(quantity * unit_price) FROM invoice_details WHERE invoice_details.invoice_id = i.invoice_id), 0)
      + COALESCE(i.shipping_fee, 0) AS amount,
    DATE_ADD(i.order_date, INTERVAL FLOOR(RAND() * 10) DAY) AS payment_date,
    FLOOR(1 + RAND() * 3) AS payment_method,
    CASE
        WHEN RAND() < 0.7 THEN 'Completed'
        WHEN RAND() < 0.85 THEN 'Pending'
        WHEN RAND() < 0.95 THEN 'Refunded'
        ELSE 'Failed'
    END AS payment_status
FROM invoices i;
-- ----------------------
INSERT INTO reviews (invoice_id, b_id, uid, review_date, rating, comment)
SELECT 
    i.invoice_id,
    d.b_id,
    i.uid,
    DATE_ADD(i.order_date, INTERVAL FLOOR(RAND() * 15) DAY) AS review_date,
    FLOOR(1 + RAND() * 5) AS rating, 
    CASE FLOOR(1 + RAND() * 5)
        WHEN 1 THEN
            CASE FLOOR(1 + RAND() * 3)
                WHEN 1 THEN 'Không hài lòng, sách chưa hay.'
                WHEN 2 THEN 'Khá ổn nhưng hơi dài dòng.'
                ELSE 'Nội dung chưa hấp dẫn, hơi khó đọc.'
            END
        WHEN 2 THEN
            CASE FLOOR(1 + RAND() * 3)
                WHEN 1 THEN 'Nội dung khá đơn giản, chưa đặc sắc.'
                WHEN 2 THEN 'Không quá ấn tượng, nhưng vẫn chấp nhận được.'
                ELSE 'Hơi thất vọng vì nội dung không như mong đợi.'
            END
        WHEN 3 THEN
            CASE FLOOR(1 + RAND() * 3)
                WHEN 1 THEN 'Tạm ổn, có thể đọc giải trí.'
                WHEN 2 THEN 'Sách ổn nhưng giao hơi lâu.'
                ELSE 'Nội dung tốt nhưng hơi khó hiểu.'
            END
        WHEN 4 THEN
            CASE FLOOR(1 + RAND() * 3)
                WHEN 1 THEN 'Sách hay, rất đáng đọc.'
                WHEN 2 THEN 'Dịch vụ tốt, sách chất lượng.'
                ELSE 'Câu chuyện đầy cảm xúc.'
            END
        ELSE
            CASE FLOOR(1 + RAND() * 3)
                WHEN 1 THEN 'Xuất sắc, một quyển sách tuyệt vời!'
                WHEN 2 THEN 'Rất hài lòng, sẽ mua tiếp.'
                ELSE 'Tuyệt vời, không thể chê vào đâu được.'
            END
    END AS comment
FROM invoices i
JOIN payments p ON i.invoice_id = p.invoice_id
JOIN invoice_details d ON i.invoice_id = d.invoice_id
WHERE i.status = 'Completed'
AND p.payment_status = 'Completed'
AND NOT EXISTS (SELECT 1 FROM reviews r WHERE r.invoice_id = i.invoice_id)
GROUP BY i.invoice_id, d.b_id, i.uid
ORDER BY RAND()
LIMIT 100;
-- ----------------------------
-- Records of resource
-- ----------------------------
INSERT INTO `resource` VALUES (1, 'USER_MGMT', 'Quản lý người dùng', 'Chức năng quản lý thông tin người dùng, bao gồm thêm, sửa, xóa người dùng', '2025-05-28 11:08:59', '2025-05-28 11:08:59');
INSERT INTO `resource` VALUES (2, 'PRODUCT_MGMT', 'Quản lý sản phẩm', 'Chức năng quản lý sản phẩm, bao gồm thêm, sửa, xóa sản phẩm', '2025-05-28 11:08:59', '2025-05-28 11:08:59');
INSERT INTO `resource` VALUES (3, 'ORDER_MGMT', 'Quản lý đơn hàng', 'Chức năng quản lý đơn hàng, bao gồm xem, cập nhật trạng thái đơn hàng', '2025-05-28 11:08:59', '2025-05-28 11:08:59');
INSERT INTO `resource` VALUES (4, 'CATEGORY_MGMT', 'Quản lý danh mục', 'Chức năng quản lý danh mục sản phẩm', '2025-05-28 11:08:59', '2025-05-28 11:08:59');
INSERT INTO `resource` VALUES (5, 'STOCK_MGMT', 'Quản lý kho', 'Chức năng quản lí kho', '2025-06-02 09:43:29', '2025-06-02 09:43:29');
INSERT INTO `resource` VALUES (6, 'PROMOTION_MGMT', 'Quản lý khuyễn mãi', 'Chức năng quản lí khuyến mãi', '2025-06-02 10:41:44', '2025-06-02 10:41:44');
INSERT INTO `resource` VALUES (7, 'PUBLISHER_MGMT', 'Quản lý nhà sản xuất', 'Chức năng quản lí nhà sản xuất', '2025-06-02 10:42:56', '2025-06-02 10:42:56');
INSERT INTO `resource` VALUES (8, 'ROLE_MGMT', 'Quản lý vai trò', 'Chức năng quản lí vai trò', '2025-06-02 11:04:16', '2025-06-02 11:04:16');

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (151, 1, 1, 1, '2025-05-28 11:09:58', '2025-06-01 16:04:52');
INSERT INTO `role` VALUES (152, 1, 2, 3, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (153, 1, 3, 3, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (154, 1, 4, 2, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (156, 3, 1, 1, '2025-05-28 11:09:58', '2025-06-02 09:51:32');
INSERT INTO `role` VALUES (157, 3, 2, 3, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (158, 3, 3, 3, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (159, 3, 4, 2, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (161, 5, 1, 3, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (162, 5, 2, 3, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (163, 5, 3, 3, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (164, 5, 4, 2, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (166, 7, 1, 3, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (167, 7, 2, 3, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (168, 7, 3, 3, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (169, 7, 4, 2, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (171, 2, 2, 1, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (172, 2, 3, 1, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (173, 2, 1, 1, '2025-05-28 11:09:58', '2025-06-01 16:30:48');
INSERT INTO `role` VALUES (174, 2, 4, 0, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (176, 4, 2, 1, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (177, 4, 3, 1, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (178, 4, 1, 0, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (179, 4, 4, 0, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (181, 6, 2, 1, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (182, 6, 3, 1, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (183, 6, 1, 0, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (184, 6, 4, 0, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (186, 8, 2, 1, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (187, 8, 3, 1, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (188, 8, 1, 0, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (189, 8, 4, 0, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (191, 9, 2, 1, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (192, 9, 3, 1, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (193, 9, 1, 0, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (194, 9, 4, 0, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (196, 10, 2, 1, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (197, 10, 3, 1, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (198, 10, 1, 0, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (199, 10, 4, 0, '2025-05-28 11:09:58', '2025-05-28 11:09:58');
INSERT INTO `role` VALUES (221, 57, 2, 3, '2025-06-02 10:46:57', '2025-06-02 11:54:59');
INSERT INTO `role` VALUES (222, 57, 3, 3, '2025-06-02 10:46:57', '2025-06-02 11:55:01');
INSERT INTO `role` VALUES (223, 57, 1, 3, '2025-06-02 10:46:57', '2025-06-02 11:55:01');
INSERT INTO `role` VALUES (224, 57, 4, 3, '2025-06-02 10:46:57', '2025-06-02 11:55:02');
INSERT INTO `role` VALUES (225, 57, 5, 3, '2025-06-02 10:46:57', '2025-06-02 10:48:44');
INSERT INTO `role` VALUES (226, 57, 6, 3, '2025-06-02 10:46:57', '2025-06-02 11:55:03');
INSERT INTO `role` VALUES (227, 57, 7, 3, '2025-06-02 10:46:57', '2025-06-02 11:55:05');
INSERT INTO `role` VALUES (228, 57, 8, 3, '2025-06-02 11:22:31', '2025-06-02 11:22:31');

-- --------------------------------------------------------------------
-- XÓA 2 CỘT CỦA BOOK
-- Xóa cột sold_quantity và stock_quantity
ALTER TABLE books DROP COLUMN sold_quantity;
ALTER TABLE books DROP COLUMN stock_quantity;
-- --------------------------------------------------------------
SET FOREIGN_KEY_CHECKS = 1;
