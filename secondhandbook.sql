-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 26, 2023 at 06:09 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `secondhandbook`
--

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `logo`, `address`, `phone_no`, `slug`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'SÁCH TIỂU THUYẾT, HỒI KÝ', 'sachxua.vn-banner.jpg', '432 Trường Trinh, Kiến An, Hải Phòng', '0364782281', 'sach-tieu-thuyet-hoi-ky', 0, '2023-03-26 23:58:03', '2023-03-31 22:20:35'),
(2, 'SÁCH THƠ CA, DANH NGÔN', 'tuyen-tap-truyen-ngan-cua-nguyen-huy-thiep-600x600.png', '432 Trường Trinh, Kiến An, Hải Phòng', '0346788361', 'sach-tho-ca-danh-ngon', 0, '2023-03-26 23:58:53', '2023-03-31 22:20:50'),
(3, 'SÁCH NGHIÊN CỨU, PHÊ BÌNH VĂN HỌC', 'lets-go-3-workbook-390x525.jpg', '432 Trường Trinh, Kiến An, Hải Phòng', '0352673381', 'sach-nghien-cuu-phe-binh-van-hoc', 0, '2023-03-26 23:58:59', '2023-03-31 22:21:03');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `full_name`, `address`, `phone_no`, `email`, `slug`, `is_deleted`, `created_at`, `updated_at`, `user_id`) VALUES
(28, 'Văn Duy', 'Hà Nội, Việt Nam', '0123456789', 'duy@gmail.com', 'van-duy', 0, '2023-03-31 22:44:24', '2023-03-31 22:44:24', 16),
(31, 'ok demo nhe', '123 Huy Can', '0123456789', 'ok@gmail.com', 'ok-demo-nhe', 0, '2023-04-25 03:10:38', '2023-04-25 03:10:38', 19),
(32, 'Demo Test', 'Hà Nội Việt Nam', '0321231234', 'demo@gmail.com', 'demo-test', 0, '2023-04-25 03:12:44', '2023-04-25 03:12:44', 20),
(33, 'Trần Phương Duy', 'Hà Nội, Việt Nam', '0323456235', 'chanphuongduy@gmail.com', 'tran-phuong-duy', 0, '2023-04-25 03:16:54', '2023-04-25 03:16:54', 21),
(34, 'Nguyễn Thị Vui', 'Cầu Giấy, Hà Nọi', '0347382182', 'nguyenthivui@gmail.com', 'nguyen-thi-vui', 0, '2023-04-25 04:01:01', '2023-04-25 04:01:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(40, '2014_10_12_100000_create_password_resets_table', 1),
(41, '2023_01_20_1642520413_create_brands_table', 1),
(42, '2023_01_20_1642520923_create_product_categories_table', 1),
(43, '2023_01_20_1642522313_create_products_table', 1),
(44, '2023_01_20_1641230413_create_customers_table', 1),
(45, '2023_01_20_1653420413_create_slides_table', 1),
(46, '2023_01_20_1642520418_create_orders_table', 1),
(47, '2023_01_20_1641120413_create_order_details_table', 1),
(48, '2023_01_20_1642520423_create_roles_table', 1),
(49, '2023_01_20_1689720413_create_permissions_table', 1),
(50, '2023_01_20_1641110413_create_permission_roles_table', 1),
(51, '2023_01_20_1642520422_create_users_table', 1),
(52, '2023_01_20_1642523133_create_role_user_table', 1),
(53, '2023_01_22_1642520321_add_user_id_to_customers_table', 2),
(54, '2023_01_22_1649920413_add_foreign_user_id_to_customers_table', 3);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_status` int(11) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_status`, `payment_status`, `customer_id`, `is_deleted`, `created_at`, `updated_at`) VALUES
(67, 1, 3, 28, 0, '2023-03-31 22:44:36', '2023-03-31 22:44:36'),
(68, 1, 2, 28, 0, '2023-03-31 22:44:52', '2023-03-31 22:44:52'),
(74, 1, 2, 31, 0, '2023-04-25 03:11:09', '2023-04-25 03:11:09'),
(75, 1, 2, 32, 0, '2023-04-25 03:13:14', '2023-04-25 03:13:14'),
(76, 1, 3, 33, 0, '2023-04-25 03:58:43', '2023-04-25 03:58:43'),
(77, 1, 1, 33, 0, '2023-04-25 03:58:55', '2023-04-25 03:58:55'),
(78, 1, 1, 34, 0, '2023-04-25 04:01:01', '2023-04-25 04:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `quantity`, `order_id`, `product_id`, `is_deleted`, `created_at`, `updated_at`) VALUES
(59, 2, 67, 2, 0, '2023-03-31 22:44:36', '2023-03-31 22:44:36'),
(60, 1, 68, 1, 0, '2023-03-31 22:44:52', '2023-03-31 22:44:52'),
(66, 1, 74, 29, 0, '2023-04-25 03:11:09', '2023-04-25 03:11:09'),
(67, 1, 74, 28, 0, '2023-04-25 03:11:09', '2023-04-25 03:11:09'),
(68, 1, 75, 1, 0, '2023-04-25 03:13:14', '2023-04-25 03:13:14'),
(69, 1, 75, 2, 0, '2023-04-25 03:13:14', '2023-04-25 03:13:14'),
(70, 3, 75, 28, 0, '2023-04-25 03:13:14', '2023-04-25 03:13:14'),
(71, 1, 76, 1, 0, '2023-04-25 03:58:43', '2023-04-25 03:58:43'),
(72, 1, 76, 2, 0, '2023-04-25 03:58:43', '2023-04-25 03:58:43'),
(73, 3, 76, 28, 0, '2023-04-25 03:58:43', '2023-04-25 03:58:43'),
(74, 1, 77, 1, 0, '2023-04-25 03:58:55', '2023-04-25 03:58:55'),
(75, 1, 77, 2, 0, '2023-04-25 03:58:55', '2023-04-25 03:58:55'),
(76, 3, 77, 28, 0, '2023-04-25 03:58:55', '2023-04-25 03:58:55'),
(77, 1, 78, 28, 0, '2023-04-25 04:01:01', '2023-04-25 04:01:01');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `display_name`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'create_user', 'Create user', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(2, 'edit_user', 'Edit user', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(3, 'view_user', 'View user', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(4, 'detail_user', 'Detail user', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(5, 'create_brand', 'Create brand', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(6, 'edit_brand', 'Edit brand', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(7, 'view_brand', 'View brand', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(8, 'detail_brand', 'Detail brand', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(9, 'create_category', 'Create category', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(10, 'edit_category', 'Edit category', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(11, 'view_category', 'View category', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(12, 'detail_category', 'Detail category', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(13, 'create_product', 'Create product', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(14, 'edit_product', 'Edit product', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(15, 'view_product', 'View product', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(16, 'detail_product', 'Detail product', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(17, 'create_order', 'Create order', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(18, 'edit_order', 'Edit order', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(19, 'view_order', 'View order', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(20, 'detail_order', 'Detail order', 0, '2023-03-25 01:00:45', '2023-03-25 01:00:45'),
(21, 'create_slide', 'Create slide', 0, '2023-03-25 01:00:46', '2023-03-25 01:00:46'),
(22, 'edit_slide', 'Edit slide', 0, '2023-03-25 01:00:46', '2023-03-25 01:00:46'),
(23, 'view_slide', 'View slide', 0, '2023-03-25 01:00:46', '2023-03-25 01:00:46'),
(24, 'detail_slide', 'Detail slide', 0, '2023-03-25 01:00:46', '2023-03-25 01:00:46'),
(25, 'create_role', 'Create role', 0, '2023-03-25 01:00:46', '2023-03-25 01:00:46'),
(26, 'edit_role', 'Edit role', 0, '2020-06-29 01:00:46', '2020-06-29 01:00:46'),
(27, 'view_role', 'View role', 0, '2020-06-29 01:00:46', '2020-06-29 01:00:46'),
(28, 'detail_role', 'Detail role', 0, '2020-06-29 01:00:46', '2020-06-29 01:00:46'),
(29, 'delete_brand', 'Delete Brand', 0, NULL, NULL),
(30, 'delete_role', 'Delete Role', 0, NULL, NULL),
(31, 'delete_product', 'Delete Product', 0, NULL, NULL),
(32, 'delete_category', 'Delete Category', 0, NULL, NULL),
(33, 'delete_slide', 'Delete Slide', 0, NULL, NULL),
(34, 'delete_user', 'Delete User', 0, NULL, NULL),
(35, 'delete_order', 'Delete Order', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permission_roles`
--

CREATE TABLE `permission_roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `permission_roles`
--

INSERT INTO `permission_roles` (`id`, `permission_id`, `role_id`, `created_at`, `updated_at`) VALUES
(112, 1, 1, NULL, NULL),
(113, 2, 1, NULL, NULL),
(114, 3, 1, NULL, NULL),
(115, 4, 1, NULL, NULL),
(116, 5, 1, NULL, NULL),
(117, 6, 1, NULL, NULL),
(118, 7, 1, NULL, NULL),
(119, 8, 1, NULL, NULL),
(120, 9, 1, NULL, NULL),
(121, 10, 1, NULL, NULL),
(122, 11, 1, NULL, NULL),
(123, 12, 1, NULL, NULL),
(124, 13, 1, NULL, NULL),
(125, 14, 1, NULL, NULL),
(126, 15, 1, NULL, NULL),
(127, 16, 1, NULL, NULL),
(128, 17, 1, NULL, NULL),
(129, 18, 1, NULL, NULL),
(130, 19, 1, NULL, NULL),
(131, 20, 1, NULL, NULL),
(132, 21, 1, NULL, NULL),
(133, 22, 1, NULL, NULL),
(134, 23, 1, NULL, NULL),
(135, 24, 1, NULL, NULL),
(136, 25, 1, NULL, NULL),
(137, 26, 1, NULL, NULL),
(138, 27, 1, NULL, NULL),
(139, 28, 1, NULL, NULL),
(140, 29, 1, NULL, NULL),
(141, 30, 1, NULL, NULL),
(142, 31, 1, NULL, NULL),
(143, 32, 1, NULL, NULL),
(144, 33, 1, NULL, NULL),
(145, 34, 1, NULL, NULL),
(146, 35, 1, NULL, NULL),
(166, 3, 2, NULL, NULL),
(167, 4, 2, NULL, NULL),
(168, 7, 2, NULL, NULL),
(169, 8, 2, NULL, NULL),
(170, 11, 2, NULL, NULL),
(171, 12, 2, NULL, NULL),
(172, 15, 2, NULL, NULL),
(173, 16, 2, NULL, NULL),
(174, 19, 2, NULL, NULL),
(175, 20, 2, NULL, NULL),
(176, 23, 2, NULL, NULL),
(177, 24, 2, NULL, NULL),
(178, 27, 2, NULL, NULL),
(179, 28, 2, NULL, NULL),
(180, 5, 3, NULL, NULL),
(181, 6, 3, NULL, NULL),
(182, 7, 3, NULL, NULL),
(183, 8, 3, NULL, NULL),
(184, 9, 3, NULL, NULL),
(185, 10, 3, NULL, NULL),
(186, 11, 3, NULL, NULL),
(187, 12, 3, NULL, NULL),
(188, 13, 3, NULL, NULL),
(189, 14, 3, NULL, NULL),
(190, 15, 3, NULL, NULL),
(191, 16, 3, NULL, NULL),
(192, 17, 3, NULL, NULL),
(193, 18, 3, NULL, NULL),
(194, 19, 3, NULL, NULL),
(195, 20, 3, NULL, NULL),
(196, 21, 3, NULL, NULL),
(197, 22, 3, NULL, NULL),
(198, 23, 3, NULL, NULL),
(199, 24, 3, NULL, NULL),
(200, 29, 3, NULL, NULL),
(201, 31, 3, NULL, NULL),
(202, 32, 3, NULL, NULL),
(203, 33, 3, NULL, NULL),
(204, 35, 3, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `detail` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `url_image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) NOT NULL,
  `promotion_price` int(11) DEFAULT NULL,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_hot` tinyint(1) DEFAULT NULL,
  `is_new` tinyint(1) DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `code`, `description`, `detail`, `url_image`, `price`, `promotion_price`, `quantity`, `slug`, `is_hot`, `is_new`, `brand_id`, `category_id`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Tuyển tập vũ trọng phụng', '5efae3fca71eb', '<ul>\r\n	<li>Tặng Combo Dịch Vụ &amp; Phiếu Mua H&agrave;ng 700.000đ (800140)&nbsp;</li>\r\n	<li>Tặng 12 Th&aacute;ng Bảo H&agrave;nh</li>\r\n	<li>Đổi Trả Sản Phẩm Trong V&ograve;ng 35 Ng&agrave;y ( N&ecirc;́u Lỗi Kỹ Thuật)</li>\r\n</ul>', 'Tuyển tập Vũ Trọng Phụng', 'tuyen-tap-vu-trong-phung-300x300.png', 190000, 165000, 42, 'tuyen-tap-vu-trong-phung', 0, 1, 1, 1, 0, '2023-04-21 00:09:58', '2023-04-25 03:58:55'),
(2, 'Almanach', '5efae67bb4588', '<p>Almanach&nbsp;</p>', 'Từ lâu,', 'nhung-nen-van-minh-the-gioi-600x600.png', 480000, NULL, 81, 'almanach', 1, 0, 3, 7, 0, '2023-04-21 00:16:54', '2023-04-25 03:58:55'),
(3, 'TUYỂN TẬP TRUYỆN NGẮN – NGUYỄN HUY THIỆP', '5efae8d18651a', '<p>Trước khi đưa in, T&aacute;c giả đ&atilde; đọc lại lần cuối. C&oacute; thể n&oacute;i cho tới nay, đ&acirc;y l&agrave; một tuyển tập truyện ngắn đầy đủ v&agrave; tin cậy nhất về mặt văn bản của nh&agrave; văn Nguyễn Huy Thiệp.</p>', 'Danh mục: Văn Học Việt Nam, Sách Tiểu Thuyết, Hồi Ký\r\nTừ khóa: Nguyễn Huy Thiệp', 'tuyen-tap-truyen-ngan-cua-nguyen-huy-thiep-600x600.png', 480000, NULL, 40, 'tuyen-tap-truyen-ngan-nguyen-huy-thiep', 0, 1, 1, 1, 0, '2023-04-21 00:26:12', '2023-03-31 22:26:25'),
(27, 'Thánh Tông Di Thảo – Nguyễn Bích Ngô dịch', '6442594e0bf06', '<p><em>Số trang: 309 trang</em><br />\r\n<em>Chất liệu: Giấy trắng cổ.</em><br />\r\n<em>Ng&ocirc;n ngữ: Quốc ngữ</em><br />\r\n<em>Khổ s&aacute;ch: B5</em></p>', 'Sách: Thánh Tông Di Thảo – Nguyễn Bích Ngô dịch\r\nMiễn phí vận chuyển toàn quốc', 'Ảnh chụp màn hình 2023-04-21 163806.png', 50000, 30000, 11, 'thanh-tong-di-thao-nguyen-bich-ngo-dich', 0, 1, 3, 1, 0, '2023-04-21 02:40:11', '2023-04-21 22:43:16'),
(28, 'Nghệ Thuật Ăn Trộm Và Bắt Trộm Của Người Xưa – Toan Ánh', '644259ffd9de9', '<p><em>NXB Tiến Bộ 1969<br />\r\nSố trang: 213 trang</em><br />\r\n<em>Chất liệu: Giấy trắng cổ.</em><br />\r\n<em>Ng&ocirc;n ngữ: Quốc ngữ</em><br />\r\n<em>Khổ s&aacute;ch: B5</em></p>', 'Sách: Nghệ Thuật Ăn Trộm Và Bắt Trộm Của Người Xưa – Toan Ánh\r\nMiễn phí vận chuyển toàn quốc', 'Ảnh chụp màn hình 2023-04-21 164034.png', 180000, 100000, 4, 'nghe-thuat-an-trom-va-bat-trom-cua-nguoi-xua-toan-anh', 1, 1, 1, 2, 0, '2023-04-21 02:41:19', '2023-04-25 04:01:01'),
(29, 'Phong Thủy Toàn Thư – Đổng Dị Lâm', '64425ae2ec94d', '<p><em>Số trang: 446 trang</em><br />\r\n<em>Chất liệu: Giấy trắng cổ.</em><br />\r\n<em>Ng&ocirc;n ngữ: Quốc ngữ</em><br />\r\n<em>Khổ s&aacute;ch: B5</em></p>', 'Sách: Phong Thủy Toàn Thư – Đổng Dị Lâm\r\nMiễn phí vận chuyển toàn quốc', 'Ảnh chụp màn hình 2023-04-21 164435.png', 300000, 250000, 21, 'phong-thuy-toan-thu-dong-di-lam', 1, 1, 1, 9, 0, '2023-04-21 02:45:00', '2023-04-25 03:11:09'),
(30, 'Bí mật gia cư – âm trạch và dương trạch', '64425b23e649a', '<p>Số trang: 329<br />\r\nChất liệu: Giấy trắng cổ<br />\r\nNg&ocirc;n ngữ: Tiếng Việt (Quốc ngữ)<br />\r\nKhổ giấy: B5 xu&ocirc;i</p>', 'Sách: BÍ MẬT GIA CƯ – ÂM TRẠCH VÀ DƯƠNG TRẠCH\r\nMiễn phí vận chuyển toàn quốc', 'Ảnh chụp màn hình 2023-04-21 164530.png', 180000, 100000, 25, 'bi-mat-gia-cu-am-trach-va-duong-trach', 1, 1, 1, 6, 0, '2023-04-21 02:46:03', '2023-04-21 02:46:03'),
(31, 'La Kinh Thấu Giải', '64425b5d6dbd3', '<p>Số trang: 149<br />\r\nChất liệu: Giấy trắng cổ<br />\r\nNg&ocirc;n ngữ: Tiếng Việt<br />\r\nKhổ giấy: B5 xu&ocirc;i</p>', 'Sách: LA KINH THẤU GIẢI\r\nMiễn phí vận chuyển toàn quốc', 'Ảnh chụp màn hình 2023-04-21 164627.png', 200000, 180000, 10, 'la-kinh-thau-giai', 0, 1, 1, 6, 0, '2023-04-21 02:47:00', '2023-04-21 02:47:00'),
(32, 'ALMANACH NHỮNG NỀN VĂN MINH THẾ GIỚI', '64425d700e675', '<p>Nh&agrave; xuất bản:Hồng Đức</p>\r\n\r\n<p>T&aacute;c giả:Nhiều T&aacute;c Giả</p>\r\n\r\n<p>H&igrave;nh thức b&igrave;a:B&igrave;a Cứng</p>', 'Almanach - Những Nền Văn Minh Thế Giới (Tái Bản)', '9786048922276_1.jpg', 150000, 120000, 10, 'almanach-nhung-nen-van-minh-the-gioi', 1, 0, 3, 7, 0, '2023-04-21 02:56:10', '2023-04-21 02:56:10'),
(33, 'Sự Mê Hoặc Từ Nghệ Thuật Xăm Hình - Enchantment From Tattoo Art', '64425dce4ec7f', '<p>Nh&agrave; cung cấp:NXB Tổng Hợp TPHCM</p>\r\n\r\n<p>T&aacute;c giả:Trung Tadashi</p>\r\n\r\n<p>Nh&agrave; xuất bản:Tổng Hợp Th&agrave;nh Phố Hồ Ch&iacute; Minh</p>\r\n\r\n<p>H&igrave;nh thức b&igrave;a:B&igrave;a Mềm</p>', 'Sự Mê Hoặc Từ Nghệ Thuật Xăm Hình - Enchantment From Tattoo Art', '9786043778465_2.jpg', 200000, 180000, 10, 'su-me-hoac-tu-nghe-thuat-xam-hinh-enchantment-from-tattoo-art', 1, 0, 1, 2, 0, '2023-04-21 02:57:36', '2023-04-21 02:57:36'),
(34, 'Không Phải Sói Nhưng Cũng Đừng Là Cừu', '644260223f216', '<p>Nh&agrave; cung cấp:<a href=\"https://www.fahasa.com/sky-books\">Skybooks</a></p>\r\n\r\n<p>T&aacute;c giả:L&ecirc; Bảo Ngọc</p>\r\n\r\n<p>Nh&agrave; xuất bản:Thế Giới</p>\r\n\r\n<p>H&igrave;nh thức b&igrave;a:B&igrave;a Mềm</p>', 'Không Phải Sói Nhưng Cũng Đừng Là Cừu\r\n\r\nSÓI VÀ CỪU - BẠN KHÔNG TỐT NHƯ BẠN NGHĨ ĐÂU!', '_khong-phai-soi-nhung-cung-dung-la-cuu.jpg', 200000, 150000, 10, 'khong-phai-soi-nhung-cung-dung-la-cuu', 0, 1, 1, 9, 0, '2023-04-21 03:07:33', '2023-04-21 03:07:33'),
(35, 'Tinh Hoa Văn Học Việt Nam - Truyện Ngắn Nam Cao', '6447edfb6374d', '<p>Đ&acirc;y là ph&acirc;̀n m&ocirc; tả</p>', NULL, 'nam cao.u547.d20160509.t111411.jpg', 75000, 50000, 12, 'tinh-hoa-van-hoc-viet-nam-truyen-ngan-nam-cao', 0, 1, 1, 1, 0, '2023-04-25 08:14:20', '2023-04-25 08:14:20'),
(36, 'Đôi Lứa Xứng Đôi - Danh Tác Văn Học Việt Nam _MT', '6447f60128e4b', '<table>\r\n	<tbody>\r\n		<tr>\r\n			<td>C&ocirc;ng ty ph&aacute;t h&agrave;nh</td>\r\n			<td>Nh&agrave; s&aacute;ch Minh Thắng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Loại b&igrave;a</td>\r\n			<td>B&igrave;a mềm</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Số trang</td>\r\n			<td>116</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Nh&agrave; xuất bản</td>\r\n			<td>Nh&agrave; Xuất Bản Văn Học</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', 'Danh Tác Văn Học Việt Nam - Đôi Lứa Xứng Đôi\r\n\r\n (1915-1951). Tên thật là Trần Hữu Tri (theo giấy khai sinh 1917-1951), sinh tại làng Đại Hoàng, tổng Cao Đà, huyện Nam Sang, phủ Lý Nhân, tỉnh Hà Nam (nay là xã Hòa Hậu, huyện Lý Nhân, tỉnh Hà Nam) trong một gia đình trung nông. Ông đã ghép hai tên tổng và huyện làm bút danh Nam Cao.\r\n\r\nỞ cuốn sách bạn đọc đang cầm trên tay, nhóm biên soạn giới thiệu tập truyện ngắn  Đôi lứa xứng đôi của nhà văn Nam Cao (1917-1951). Được biết, truyện đứng đầu tập vốn được tác giả đặt tên trong bản thảo là \"Cái lò gạch cũ\", nhưng người viết lời tựa cho tập truyện - nhà văn Lê Văn Trương - đổi thành \"Đôi lứa xứng đôi\".\r\nGiá sản phẩm trên Tiki đã bao gồm thuế theo luật hiện hành. Bên cạnh đó, tuỳ vào loại sản phẩm, hình thức và địa chỉ giao hàng mà có thể phát sinh thêm chi phí khác như phí vận chuyển, phụ phí hàng cồng kềnh, thuế nhập khẩu (đối với đơn hàng giao từ nước ngoài có giá trị trên 1 triệu đồng).....', 'doiluaxungdoii.jpg', 29999, NULL, 3, 'doi-lua-xung-doi-danh-tac-van-hoc-viet-nam-mt', 0, 0, 2, 1, 0, '2023-04-25 08:48:20', '2023-04-25 08:48:20');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `description`, `slug`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Văn Học Việt Nam', 'abc', 'van-hoc-viet-nam', 0, '2023-03-31 00:00:28', '2023-03-31 22:21:52'),
(2, 'Văn Học Nước Ngoài', 'abc', 'van-hoc-nuoc-ngoai', 0, '2023-03-31 00:02:00', '2023-03-31 22:22:00'),
(6, 'Sách Lịch Sử', 'No', 'sach-lich-su', 0, '2023-03-31 00:12:24', '2023-03-31 22:22:05'),
(7, 'Sách Nghiên Cứu', 'no', 'sach-nghien-cuu', 0, '2023-03-31 04:26:51', '2023-03-31 22:22:13'),
(8, 'Sách Tôn Giáo', 'abc', 'sach-ton-giao', 0, '2023-03-30 21:51:40', '2023-03-31 22:22:25'),
(9, 'Truyện Tranh Bộ', 'abc', 'truyen-tranh-bo', 0, '2023-03-30 21:51:53', '2023-03-31 22:22:33');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `display_name`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'ROLE_ADMIN', 'Administrator', 0, '2023-04-01 01:00:45', '2023-04-01 01:00:45'),
(2, 'ROLE_MANAGER', 'Manager', 0, '2023-04-01 01:00:45', '2023-04-01 01:00:45'),
(3, 'ROLE_STAFF', 'Staff', 0, '2023-04-01 01:00:45', '2023-04-01 01:00:45'),
(4, 'ROLE_CUSTOMER', 'Customer', 0, '2023-04-01 01:00:45', '2023-04-01 01:00:45');

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `role_user`
--

INSERT INTO `role_user` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(6, 1, 1, NULL, NULL),
(25, 4, 16, NULL, NULL),
(28, 4, 19, NULL, NULL),
(29, 4, 20, NULL, NULL),
(30, 4, 21, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE `slides` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `content`, `description`, `image`, `url`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'KHUYẾN MÃI MỚI SALE KHỔNG LỒ - GIẢM SỐC 21 - 50% Tháng 5  - quà ngập nhà', 'Khuyến mãi đặc biết 30/04-01/05', 'sachxua.vn-banner.jpg', '#', 0, '2023-03-31 07:34:10', '2023-03-31 22:19:34'),
(2, 'Khuyến mãi đặc biết 30/04-01/05', NULL, 'tuyen-tap-truyen-ngan-cua-nguyen-huy-thiep-600x600.png', '#', 0, '2023-03-31 07:34:29', '2023-03-31 22:20:01'),
(3, 'KHUYẾN MÃI MỚI SALE KHỔNG LỒ - GIẢM SỐC 21 - 50% Tháng 6', 'Ưu đãi giảm giá siêu hot đối với tất cả các mặt hàng chào mừng chào 1/6', '2.jpg', '#', 1, '2023-03-31 07:34:40', '2023-03-31 22:20:04');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `level` int(11) DEFAULT NULL,
  `email_verified_at` date DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `reset_password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `level`, `email_verified_at`, `password`, `reset_password`, `remember_token`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@gmail.com', 0, NULL, '$2y$10$/R2hG9ld.VWodXp152nj6elEVmguqxg4YsakqBrjDwkDUB9PNjPyO', NULL, NULL, 0, '2023-03-31 01:00:44', '2023-03-31 01:00:44'),
(16, 'Duyphuongtran', 'duy@gmail.com', 1, NULL, '$2y$10$mrVmp.JKaTT3/AfW5EEIjugYYQzgPfbgWSmPtz3ttm1KejFkOxvOq', NULL, 'RAywGS0XrcJgBZsY4vAoIjAuTkE9tGw7B8rxmHpXKRt7CyLmzOptA9mSDC7O', 0, '2023-03-31 22:44:24', '2023-03-31 22:44:24'),
(19, 'Okdemo123', 'ok@gmail.com', 1, NULL, '$2y$10$xsRQDGdGr1bJ0GSxSF9a8eiepSMIfw3bjaFNQ4WgfDFrmG.jDMIuG', NULL, 'A3RJPrQ4fpPpPMguioj7rTaT9OSgLVSSFSUEX05OWYgRGyGtHhazmyIUg20U', 0, '2023-04-25 03:10:38', '2023-04-25 03:10:38'),
(20, 'demo', 'demo@gmail.com', 1, NULL, '$2y$10$uL9N9xFjtmVLQNEP7Hh12OudTTxZBpZHe.ymrP0UKKlKUWpYYbuzC', NULL, 'pmHaZX2w5npISzEDti9jscx1bCMEwWaI84BG9VUYgzgju8PFeIhL3nqbHcPE', 0, '2023-04-25 03:12:44', '2023-04-25 03:12:44'),
(21, 'chanphuongduy', 'chanphuongduy@gmail.com', 1, NULL, '$2y$10$L1K0DFw4NG9nIbMKk3z.aOO4LexcpxS/TOBFU7OkSh0o.8pCy43Ni', NULL, 'UvAhlxvoOQzKctZpzonhra6DH5JiyVPbKtqtAg6vNP3QrISFY76LlYSWwCsD', 0, '2023-04-25 03:16:54', '2023-04-25 03:16:54');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_user_id_foreign` (`user_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_customer_id_foreign` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_details_order_id_foreign` (`order_id`),
  ADD KEY `order_details_product_id_foreign` (`product_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_roles`
--
ALTER TABLE `permission_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `permission_roles_permission_id_foreign` (`permission_id`),
  ADD KEY `permission_roles_role_id_foreign` (`role_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_brand_id_foreign` (`brand_id`),
  ADD KEY `products_category_id_foreign` (`category_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_user`
--
ALTER TABLE `role_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_user_role_id_foreign` (`role_id`),
  ADD KEY `role_user_user_id_foreign` (`user_id`);

--
-- Indexes for table `slides`
--
ALTER TABLE `slides`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `permission_roles`
--
ALTER TABLE `permission_roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=205;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `slides`
--
ALTER TABLE `slides`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `permission_roles`
--
ALTER TABLE `permission_roles`
  ADD CONSTRAINT `permission_roles_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `permission_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_brand_id_foreign` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_user`
--
ALTER TABLE `role_user`
  ADD CONSTRAINT `role_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_user_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
