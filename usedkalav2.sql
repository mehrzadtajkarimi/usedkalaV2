-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 03, 2021 at 12:26 PM
-- Server version: 8.0.27-0ubuntu0.20.04.1
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `usedkalav2`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_codes`
--

CREATE TABLE `active_codes` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `code` int NOT NULL,
  `expired_at` timestamp NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `active_codes`
--

INSERT INTO `active_codes` (`id`, `user_id`, `code`, `expired_at`) VALUES
(249, 73, 8198, '2021-11-02 05:26:38');

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `referer` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` enum('create','read','update','delete') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `subject` json NOT NULL,
  `uri` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_product`
--

CREATE TABLE `attribute_product` (
  `id` int NOT NULL,
  `attribute_id` int NOT NULL,
  `product_id` int NOT NULL,
  `value_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` int NOT NULL,
  `attrebute_id` int NOT NULL,
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int NOT NULL,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `like` int DEFAULT '0',
  `dislike` int DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `key`, `value`, `slug`, `like`, `dislike`, `created_at`) VALUES
(22, 'Sed recusandae Ea d', '<p>Hello, World!sssssssssssssss</p>\r\n', 'Dignissimos occaecat', 0, 0, '2021-11-03 09:37:15'),
(23, 'Dolorum voluptatibus', '<p>Hello, World!sssssssssssssssssssssssssssssssssssssssssssssssssssssssss</p>\r\n', 'Consectetur maiores ', 0, 0, '2021-11-03 09:38:04'),
(24, 'Quia vero ut dolore ', '<p>Hello, World!ssssssssssssssssssssss</p>\r\n', 'Illum aut molestias', 0, 0, '2021-11-03 09:38:23');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `logo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `logo`, `sort`, `created_at`, `updated_at`) VALUES
(9, 'Zephr Estes', NULL, 0, '2021-10-31 09:09:59', NULL),
(10, 'brand 2', NULL, 0, '2021-11-03 08:56:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'session save'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `seo_title` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `seo_description` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `type` tinyint UNSIGNED DEFAULT NULL COMMENT '0=product 1=blog',
  `robot` tinyint UNSIGNED DEFAULT NULL COMMENT '0=Index 1=Noindex 2=Nofollow 3=Follow 4=None 5=Noimageindex 6=Noarchive 7=Nocache',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `H1` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `canonical` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `parent_id` int DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `seo_title`, `seo_description`, `status`, `type`, `robot`, `description`, `H1`, `canonical`, `parent_id`, `name`, `slug`, `created_at`) VALUES
(103, NULL, NULL, 1, 0, 2, 'Sed nisi ad quam sunt consequatur ut ipsum velit deleniti reprehenderit sunt omnis ducimus ullam sunt neque', 'Aperiam ut magnam ad', 'Quidem deserunt nobi', 0, 'hewafasaw@mailinator.com', 'Tempor-doloribus-fac', '2021-10-31 09:51:30'),
(104, NULL, NULL, 1, 0, 4, 'Qui velit et incidun', 'ccccccccccccccccddddddddddd', 'cccccccccccddddddddddddd', 103, 'ddddddddddddxaqovoriry@mailinator.com', 'asdasdIn-voluptatem-fugia', '2021-10-31 09:51:50'),
(107, NULL, NULL, 1, 1, 2, 'In nulla amet molestiae consectetur totam optio aspernatur odit dolore omnis fuga Dolor voluptatem natus ut aut cum q', 'Anim officia ratione', 'Asperiores sunt ea c', 0, 'Savannah Levine', 'Nesciunt-quia-nemo-', '2021-10-31 10:10:08'),
(108, NULL, NULL, 1, 1, 2, 'Ratione nihil sequi ', 'Qui ea enim laborios', NULL, 107, 'cylypube@mailinator.com', 'Consequuntur-ut-ab-q', '2021-10-31 10:10:18'),
(109, NULL, NULL, 1, 0, 4, 'Est aperiam eveniet', 'Enim dolor repellend', NULL, 104, 'bomumu@mailinator.com', 'Ducimus-voluptatum-', '2021-10-31 10:26:07'),
(110, NULL, NULL, 1, 1, 7, 'In magnam excepteur ', 'Totam est amet repu', NULL, 108, 'foqoxy@mailinator.com', 'Laborum-eu-distincti', '2021-10-31 10:26:59'),
(111, NULL, NULL, 1, 0, 0, 'Sit sed sunt iusto i', 'Est do excepturi lab', NULL, 103, 'goronove@mailinator.com', 'Ut-quibusdam-qui-qua', '2021-11-02 06:42:31'),
(112, NULL, NULL, 1, 0, 5, 'Et omnis qui libero ', 'In praesentium elit', NULL, 103, 'modilohuso@mailinator.com', 'Ipsum-natus-iusto-de', '2021-11-02 06:42:55'),
(113, NULL, NULL, 1, 0, 6, 'Dolor autem rem cupi', 'Similique fugiat ve', NULL, 103, 'biqivyryg@mailinator.com', 'Voluptatem-nostrud-', '2021-11-02 06:54:26'),
(114, NULL, NULL, 1, 0, 1, 'Autem illum amet v', 'Et culpa esse volup', NULL, 103, 'mybewum@mailinator.com', 'Vitae-consequat-Ut-', '2021-11-02 07:06:13'),
(115, NULL, NULL, 1, 0, 0, 'لورم', 'فایروال', NULL, 104, 'فایروال', 'firewall', '2021-11-02 10:06:26'),
(116, NULL, NULL, 1, 0, 2, 'Duis dolorem velit ', 'Veritatis rerum laud', NULL, 103, 'quti@mailinator.com', 'Sapiente-dolor-ex-es', '2021-11-02 10:54:26'),
(117, NULL, NULL, 1, 0, 2, 'Dolore soluta laboru', 'Quia corporis nobis ', NULL, 104, 'dokunog@mailinator.com', 'Assumenda-impedit-a', '2021-11-02 10:56:08'),
(118, 'sssssssssssss', 'Quam aliquid praesen', 1, 0, 5, '<p>Non tempora ad dolorddddddddddddddddddddddddddd</p>\r\n', 'Laborum non nihil ut', 'Exercitation dolorem', 104, 'ssssssssssssss', 'Voluptatum-rem-animi', '2021-11-02 10:57:46'),
(119, 'ffffffffffffff', 'Est quibusdam unde a', 1, 0, 3, '<p>fffffffffffffffffffffffff</p>\r\n', 'Do modi sit ipsa v', NULL, 104, 'fffffffffffff', 'In-exercitationem-no', '2021-11-02 11:23:28'),
(120, 'Magna necessitatibus', 'Voluptates reprehend', 1, 0, 6, '', 'Tempore ea neque ut', 'Qui eligendi archite', 104, 'rinysiz@mailinator.com', 'Quo-voluptas-eius-pr', '2021-11-02 11:29:01'),
(121, NULL, NULL, 1, 0, 0, 'سرورسرورسرورسرورسرور', 'سرور', NULL, 0, 'سرور', '-', '2021-11-03 06:38:23'),
(122, 'سرور ', 'سرور', 1, 0, 3, '<p>ddddddddddddddddddd</p>\r\n', 'Dolor odio libero do', 'بببببببببببببببببببVelit dolorem labor', 121, 'server', 'Pariatur-Ut-sed-pos', '2021-11-03 06:39:06'),
(125, NULL, NULL, 1, 0, 0, 'رکرکرکرکرک', 'رک', NULL, 0, 'رک', 'ssssss', '2021-11-03 07:10:16'),
(126, 'rack', 'rack', 1, 0, 0, '<p>rackrackrackrackrackrackrackrackrackrackrackrackrackrack</p>\r\n', 'rackrack', 'rackrackrack', 125, 'rack', 'rackrackrack', '2021-11-03 07:10:43'),
(127, NULL, NULL, 1, 0, 0, 'switchswitchswitchswitchswitch', 'switch', NULL, 0, 'سوئیج', 'switch', '2021-11-03 07:36:14'),
(128, 'switch', 'switch', 1, 0, 0, '<p>switchswitchswitchswitchswitchswitchswitchswitchswitchswitchswitchswitchswitchswitchswitchswitch</p>\r\n', 'switch', 'switch', 127, 'switch', '-switch-switch', '2021-11-03 07:36:40');

-- --------------------------------------------------------

--
-- Table structure for table `category_blogs`
--

CREATE TABLE `category_blogs` (
  `id` int NOT NULL,
  `blog_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_blogs`
--

INSERT INTO `category_blogs` (`id`, `blog_id`, `category_id`) VALUES
(9, 22, 110),
(10, 23, 110),
(11, 24, 110);

-- --------------------------------------------------------

--
-- Table structure for table `category_discounts`
--

CREATE TABLE `category_discounts` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `discount_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_discounts`
--

INSERT INTO `category_discounts` (`id`, `category_id`, `discount_id`) VALUES
(247, 116, 21),
(248, 113, 21);

-- --------------------------------------------------------

--
-- Table structure for table `category_samples`
--

CREATE TABLE `category_samples` (
  `id` int NOT NULL,
  `sample_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `province_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `entity_id` int DEFAULT NULL,
  `entity_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `parent_id` int DEFAULT '0',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `like` int DEFAULT '0',
  `dislike` int DEFAULT '0',
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `entity_id`, `entity_type`, `user_id`, `parent_id`, `message`, `title`, `ip`, `like`, `dislike`, `status`, `created_at`) VALUES
(4, 31, 'Product', 72, 0, 'sdfsdf', 'sdfsdf', '127.0.0.1', 1, -1, 0, '2021-10-31 12:19:10'),
(5, 31, 'Product', 72, 0, 'dasdddddddddddddd', 'asdas', '127.0.0.1', 0, 0, 0, '2021-11-01 08:18:35');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int NOT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint DEFAULT NULL,
  `percent` tinyint DEFAULT NULL COMMENT '%',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `start_at` timestamp NOT NULL,
  `finish_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `title`, `user_id`, `code`, `type`, `percent`, `description`, `status`, `start_at`, `finish_at`, `updated_at`, `created_at`) VALUES
(21, 'Enim dolor ad molest', 72, '210442', NULL, 0, 'Rerum corrupti nihi', 0, '2021-11-03 10:10:01', '2021-11-11 10:10:01', NULL, '2021-11-03 10:10:18');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `user_id` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `city_id` int UNSIGNED DEFAULT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `order_number` int NOT NULL,
  `status` enum('pending','processing','completed','decline') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `weight` enum('tiny','normal','big') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_count` int UNSIGNED DEFAULT NULL,
  `grand_total` float DEFAULT NULL,
  `discount_total` float DEFAULT NULL,
  `shipping_cost` int DEFAULT NULL,
  `payment_status` tinyint(1) DEFAULT NULL,
  `payment_method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `cerated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_role`
--

CREATE TABLE `permission_role` (
  `id` int NOT NULL,
  `permission_id` int DEFAULT NULL,
  `role_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permission_user`
--

CREATE TABLE `permission_user` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `permission_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int NOT NULL,
  `entity_id` int DEFAULT NULL,
  `entity_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` tinyint DEFAULT '0',
  `path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `alt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `entity_id`, `entity_type`, `type`, `path`, `alt`, `created_at`) VALUES
(105, 9, 'Brand', 0, 'http://usedkalaV2.me/Storage/202111/19.---d22bdcef.png', 'brand_image', '2021-10-31 09:09:59'),
(106, 104, 'Category', 0, 'http://usedkalaV2.me/Storage/202111/15.---e96fadb2.jpg', 'image_category', '2021-10-31 09:51:50'),
(107, 106, 'Category', 0, 'http://usedkalaV2.me/Storage/202110/23.---9c68323a.png', 'image_category', '2021-10-31 09:52:42'),
(108, 31, 'Product', 0, 'http://usedkalaV2.me/Storage/202110/sm-4.---cae723b6.png', 'product_image', '2021-10-31 09:53:34'),
(109, 31, 'Product', 1, 'http://usedkalaV2.me/Storage/202110/24.---8b9359f1.png', 'product_image', '2021-10-31 09:53:34'),
(110, 108, 'Category', 0, 'http://usedkalaV2.me/Storage/202110/25.---afacfafb.png', 'image_category', '2021-10-31 10:10:18'),
(111, 109, 'Category', 0, 'http://usedkalaV2.me/Storage/202110/23.---7302e13d.png', 'image_category', '2021-10-31 10:26:07'),
(112, 110, 'Category', 0, 'http://usedkalaV2.me/Storage/202110/24.---8583f8a6.png', 'image_category', '2021-10-31 10:26:59'),
(113, 32, 'Product', 0, 'http://usedkalaV2.me/Storage/202111/24.---69ec53d3.png', 'product_image', '2021-11-01 10:28:21'),
(114, 32, 'Product', 1, 'http://usedkalaV2.me/Storage/202111/sm-1.---9170589e.png', 'product_image', '2021-11-01 10:28:21'),
(115, 32, 'Product', 2, 'http://usedkalaV2.me/Storage/202111/sm-6.---9e084b1c.png', 'product_image', '2021-11-01 10:28:21'),
(116, 33, 'Product', 0, 'http://usedkalaV2.me/Storage/202111/17.---cc3c878d.png', 'product_image', '2021-11-01 10:31:02'),
(117, 33, 'Product', 0, 'http://usedkalaV2.me/Storage/202111/17.---cc3c878d.png', 'product_image', '2021-11-01 10:31:02'),
(118, 33, 'Product', 0, 'http://usedkalaV2.me/Storage/202111/17.---cc3c878d.png', 'product_image', '2021-11-01 10:31:02'),
(119, 34, 'Product', 0, 'http://usedkalaV2.me/Storage/202111/sm-5.---902fac84.png', 'product_image', '2021-11-01 10:59:28'),
(120, 34, 'Product', 1, 'http://usedkalaV2.me/Storage/202111/sm-6.---1429d756.png', 'product_image', '2021-11-01 10:59:28'),
(121, 34, 'Product', 2, 'http://usedkalaV2.me/Storage/202111/sm-4.---e22ad061.png', 'product_image', '2021-11-01 10:59:28'),
(122, 35, 'Product', 0, 'http://usedkalaV2.me/Storage/202111/sm-3.---dbfe34b3.png', 'product_image', '2021-11-01 12:25:23'),
(123, 35, 'Product', 1, 'http://usedkalaV2.me/Storage/202111/25.---59c6a8d4.png', 'product_image', '2021-11-01 12:25:23'),
(124, 112, 'Category', 0, 'http://usedkalaV2.me/Storage/202111/sm-4.---59511e5b.png', 'image_category', '2021-11-02 06:42:55'),
(125, 114, 'Category', 0, 'http://usedkalaV2.me/Storage/202111/sm-2.---69ba3834.png', 'image_category', '2021-11-02 07:06:13'),
(126, 116, 'Category', 0, 'http://usedkalaV2.me/Storage/202111/sm-4.---01cb4abe.png', 'image_category', '2021-11-02 10:54:26'),
(127, 117, 'Category', 0, 'http://usedkalaV2.me/Storage/202111/sm-6.---81e27f1b.png', 'image_category', '2021-11-02 10:56:08'),
(128, 118, 'Category', 0, 'http://usedkalaV2.me/Storage/202111/17.---dcb6cdcd.png', 'image_category', '2021-11-02 10:57:46'),
(129, 122, 'Category', 0, 'http://usedkalaV2.me/Storage/202111/16.---4c780a85.png', 'image_category', '2021-11-03 06:39:06'),
(130, 36, 'Product', 0, 'http://usedkalaV2.me/Storage/202111/17.---995ee128.png', 'product_image', '2021-11-03 06:40:30'),
(131, 36, 'Product', 1, 'http://usedkalaV2.me/Storage/202111/19.---fe61d803.png', 'product_image', '2021-11-03 06:40:30'),
(132, 126, 'Category', 0, 'http://usedkalaV2.me/Storage/202111/sm-2.---efe8577d.png', 'image_category', '2021-11-03 07:10:43'),
(133, 128, 'Category', 0, 'http://usedkalaV2.me/Storage/202111/16.---95010d4e.png', 'image_category', '2021-11-03 07:36:40'),
(134, 37, 'Product', 0, 'http://usedkalaV2.me/Storage/202111/sm-4.---0639f989.png', 'product_image', '2021-11-03 07:37:40'),
(135, 37, 'Product', 1, 'http://usedkalaV2.me/Storage/202111/24.---33ebcb92.png', 'product_image', '2021-11-03 07:37:40'),
(136, 38, 'Product', 0, 'http://usedkalaV2.me/Storage/202111/sm-2.---dbbe9da1.png', 'product_image', '2021-11-03 07:48:29'),
(137, 38, 'Product', 1, 'http://usedkalaV2.me/Storage/202111/21.---ce02ecfa.png', 'product_image', '2021-11-03 07:48:29'),
(138, 10, 'Brands', 0, 'http://usedkalaV2.me/Storage/202111/sm-1.---b5ecc7db.png', 'brand_image', '2021-11-03 08:56:51'),
(139, 39, 'Product', 0, 'http://usedkalaV2.me/Storage/202111/24.---53ded5da.png', 'product_image', '2021-11-03 08:57:37'),
(140, 39, 'Product', 1, 'http://usedkalaV2.me/Storage/202111/sm-6.---2dca8a9b.png', 'product_image', '2021-11-03 08:57:37'),
(141, 22, 'Blog', 0, 'http://usedkalaV2.me/Storage/202111/sm-5.---94ac4ecb.png', 'image_blog', '2021-11-03 09:37:15'),
(142, 24, 'Blog', 0, 'http://usedkalaV2.me/Storage/202111/23.---235ffc87.png', 'image_blog', '2021-11-03 09:38:23'),
(143, 6, 'Slider', 0, 'http://usedkalaV2.me/Storage/202111/home-v10-img-1.---c116b549.png', 'slider_image', '2021-11-03 10:43:57'),
(144, 7, 'Slider', 0, 'http://usedkalaV2.me/Storage/202111/home-v9-img-2.---147827e8.png', 'slider_image', '2021-11-03 12:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `brand_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `meta_title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `price` bigint NOT NULL,
  `featured` tinyint(1) DEFAULT '0',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `slug` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sale` tinyint(1) DEFAULT '0',
  `like` int DEFAULT '0',
  `dislike` int DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `sku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT 'Stock Keeping Unit',
  `quantity` int NOT NULL,
  `weight` float DEFAULT NULL COMMENT 'kg',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `user_id`, `title`, `meta_title`, `description`, `price`, `featured`, `image`, `slug`, `sale`, `like`, `dislike`, `status`, `sku`, `quantity`, `weight`, `created_at`, `updated_at`, `published_at`, `started_at`, `end_at`) VALUES
(35, 9, 72, 'Thaddeus Price', 'Quibusdam amet esse', 'Deserunt itaque iust', 37, 0, NULL, 'Non-Nam-obcaecati-la', 0, 0, 0, 1, 'Quis beatae consequa', 546, 24, '2021-11-01 12:25:23', NULL, NULL, NULL, NULL),
(36, 9, 72, 'سرور های دسته دوم', 'Sed dolorem ex ipsum', 'Quibusdam commodo re', 315, 0, NULL, 'Ullamco-lorem-ducimu', 0, 0, 0, 1, 'Mollitia laborum Si', 826, 95, '2021-11-03 06:40:30', NULL, NULL, NULL, NULL),
(37, 9, 72, 'switch', 'Vel ut ut at laudant', 'Blanditiis dolores d', 263, 0, NULL, 'switch', 0, 0, 0, 1, 'Facere non est illo ', 709, 43, '2021-11-03 07:37:40', NULL, NULL, NULL, NULL),
(38, 9, 72, 'switch', 'Quae id dolores quo ', 'Reprehenderit dolor', 773, 0, NULL, 'switch', 0, 0, 0, 1, 'Proident sit labore', 719, 48, '2021-11-03 07:48:29', NULL, NULL, NULL, NULL),
(39, 10, 72, 'Idola Fields', 'Ex amet quod volupt', 'Ad non nihil natus t', 567, 0, NULL, 'Ipsam-laudantium-ve', 1, 0, 0, 0, 'Odio non alias neque', 7, 39, '2021-11-03 08:57:37', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category_id`) VALUES
(31, 31, 104),
(32, 32, 104),
(33, 32, 109),
(36, 0, 103),
(37, 0, 104),
(38, 0, 103),
(39, 0, 104),
(40, 0, 104),
(41, 34, 104),
(42, 34, 109),
(43, 35, 104),
(44, 35, 109),
(45, 36, 122),
(46, 37, 128),
(47, 38, 128),
(48, 39, 122);

-- --------------------------------------------------------

--
-- Table structure for table `product_discounts`
--

CREATE TABLE `product_discounts` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `discount_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_discounts`
--

INSERT INTO `product_discounts` (`id`, `product_id`, `discount_id`) VALUES
(112, 38, 21),
(113, 35, 21);

-- --------------------------------------------------------

--
-- Table structure for table `product_samples`
--

CREATE TABLE `product_samples` (
  `id` int NOT NULL,
  `sample_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` int NOT NULL,
  `title` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `role_user`
--

CREATE TABLE `role_user` (
  `id` int NOT NULL,
  `role_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `samples`
--

CREATE TABLE `samples` (
  `id` int NOT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` tinyint DEFAULT NULL,
  `percent` tinyint DEFAULT NULL COMMENT '%',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `start_at` timestamp NOT NULL,
  `finish_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `order_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `site_contents`
--

CREATE TABLE `site_contents` (
  `id` int NOT NULL,
  `tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int NOT NULL,
  `small_text` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `link` varchar(512) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `sort` tinyint DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `small_text`, `link`, `product_id`, `category_id`, `sort`, `status`, `description`, `created_at`) VALUES
(6, 'Animi quo nobis aut    ', '.......................ddddddddddxxxxxxxxxxxddddddddddllllllll', 0, 128, 0, 1, 'Cumque in enim anim ', '2021-11-03 10:43:57'),
(7, 'Eos laboriosam qui', 'Unde in nostrum et s', 36, 0, 0, 0, 'Sed quasi deserunt v', '2021-11-03 12:11:45');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int NOT NULL,
  `city_id` int UNSIGNED DEFAULT NULL,
  `suppliers_lavel` tinyint DEFAULT '0',
  `logo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `side` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `postal_code` int DEFAULT NULL,
  `phone` int NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `payment_methods` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int UNSIGNED NOT NULL,
  `token` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'session save',
  `message` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `type` tinyint(1) DEFAULT '1' COMMENT 'question = 1 &&  answer = 0',
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `city_id` int UNSIGNED DEFAULT NULL,
  `user_level` tinyint DEFAULT '0',
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `company` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `jobtitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `national_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `postal_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `birthday` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `bank_name` tinyint UNSIGNED DEFAULT NULL,
  `bank_number` bigint UNSIGNED DEFAULT NULL,
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `city_id`, `user_level`, `phone`, `email`, `first_name`, `last_name`, `company`, `jobtitle`, `national_code`, `postal_code`, `address`, `birthday`, `gender`, `status`, `bank_name`, `bank_number`, `ip`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(72, NULL, 0, '09128897603', '', 'ddddd', '', NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, NULL, NULL, NULL, '2021-10-31 09:08:45', NULL),
(73, NULL, 0, '09199837091', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2021-11-02 05:24:38', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `active_codes`
--
ALTER TABLE `active_codes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `active_code_UN` (`user_id`,`code`);

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attributes`
--
ALTER TABLE `attributes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `attribute_product`
--
ALTER TABLE `attribute_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attribute_product_FK` (`product_id`);

--
-- Indexes for table `attribute_values`
--
ALTER TABLE `attribute_values`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_UN` (`key`),
  ADD UNIQUE KEY `settings_slug_IDX` (`slug`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_UN` (`slug`);

--
-- Indexes for table `category_blogs`
--
ALTER TABLE `category_blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_discounts`
--
ALTER TABLE `category_discounts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_discounts_FK` (`category_id`);

--
-- Indexes for table `category_samples`
--
ALTER TABLE `category_samples`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discounts`
--
ALTER TABLE `discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_UN` (`order_number`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_role`
--
ALTER TABLE `permission_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_user`
--
ALTER TABLE `permission_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `photos`
--
ALTER TABLE `photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_discounts`
--
ALTER TABLE `product_discounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_samples`
--
ALTER TABLE `product_samples`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `samples`
--
ALTER TABLE `samples`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_UN` (`key`),
  ADD UNIQUE KEY `settings_slug_IDX` (`slug`) USING BTREE;

--
-- Indexes for table `site_contents`
--
ALTER TABLE `site_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_UN` (`phone`),
  ADD UNIQUE KEY `users_email_IDX` (`email`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active_codes`
--
ALTER TABLE `active_codes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attributes`
--
ALTER TABLE `attributes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_product`
--
ALTER TABLE `attribute_product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `attribute_values`
--
ALTER TABLE `attribute_values`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `category_blogs`
--
ALTER TABLE `category_blogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `category_discounts`
--
ALTER TABLE `category_discounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `category_samples`
--
ALTER TABLE `category_samples`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_role`
--
ALTER TABLE `permission_role`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permission_user`
--
ALTER TABLE `permission_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=145;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `product_discounts`
--
ALTER TABLE `product_discounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `product_samples`
--
ALTER TABLE `product_samples`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `role_user`
--
ALTER TABLE `role_user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `samples`
--
ALTER TABLE `samples`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `site_contents`
--
ALTER TABLE `site_contents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
