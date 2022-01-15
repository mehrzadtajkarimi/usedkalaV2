-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 15, 2022 at 12:50 PM
-- Server version: 8.0.27-0ubuntu0.20.04.1
-- PHP Version: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
  `expired_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `active_codes`
--

INSERT INTO `active_codes` (`id`, `user_id`, `code`, `expired_at`) VALUES
(303, 74, 7548, '2021-11-23 07:00:21'),
(324, 78, 1574, '2021-12-13 12:49:58'),
(326, 79, 1250, '2021-12-13 13:19:03'),
(331, 73, 4078, '2021-12-14 12:05:59'),
(360, 85, 1019, '2022-01-08 05:48:14');

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE `activity_log` (
  `id` int NOT NULL,
  `user_id` int DEFAULT '0',
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT '',
  `type` enum('create','read','update','delete') CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `target_table` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT '',
  `row_id` int DEFAULT '0',
  `where_condition` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT '',
  `detailed_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `uri` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`id`, `user_id`, `ip`, `type`, `target_table`, `row_id`, `where_condition`, `detailed_data`, `uri`, `created_at`) VALUES
(1, 77, '::1', 'create', 'blogs', 0, '', '{\"title\":\"پست جدید\",\"slug\":\"پست-جدید\",\"value\":\"<p>لورم ایپسوم<\\/p>\\r\\n\",\"seo_H1\":\"پست جدید\",\"seo_canonical\":\"\",\"seo_title\":\"پست جدید\",\"seo_robot\":\"0\",\"seo_description\":\"لورم ایپسوم\",\"meta_title\":\"لورم ایپسوم\"}', '/admin/blog', '2021-12-13 14:26:28'),
(2, 77, '::1', 'create', 'category_blogs', 0, '', '{\"blog_id\":\"13\",\"category_id\":\"55\"}', '/admin/blog', '2021-12-13 14:26:28'),
(3, 77, '::1', 'create', 'taggables', 0, '', '{\"tag_id\":\"2\",\"entity_id\":\"13\",\"entity_type\":\"Blog\"}', '/admin/blog', '2021-12-13 14:26:29'),
(4, 77, '::1', 'create', 'photos', 0, '', '{\"entity_type\":\"Blog\",\"entity_id\":13,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/Background-UNICOM-Engineering-Dell-EMC-Banner3_0.---b9800d50.jpg\",\"alt\":\"image_blog\",\"type\":0}', '/admin/blog', '2021-12-13 14:26:29'),
(5, 77, '::1', 'create', 'tags', 4, '', '{\"tag\":\"سوئیچ شبکه\"}', '/admin/tag', '2021-12-13 14:35:20'),
(6, 77, '::1', 'update', 'tags', 0, 'a:1:{s:2:\"id\";a:4:{s:4:\"path\";s:11:\"admin/tag/4\";s:7:\"_method\";s:5:\"patch\";s:3:\"tag\";s:19:\"سوییچ شبکه\";s:2:\"id\";s:1:\"4\";}}', '{\"old\":[{\"id\":\"4\",\"tag\":\"سوئیچ شبکه\",\"created_at\":\"2021-12-13 18:05:20\"}],\"new\":{\"tag\":\"سوییچ شبکه\"}}', '/admin/tag/4', '2021-12-13 14:36:34'),
(7, 77, '::1', 'update', 'tags', 0, '{\"id\":{\"path\":\"admin\\/tag\\/4\",\"_method\":\"patch\",\"tag\":\"سوئیچ شبکه\",\"id\":\"4\"}}', '{\"old\":[{\"id\":\"4\",\"tag\":\"سوییچ شبکه\",\"created_at\":\"2021-12-13 18:05:20\"}],\"new\":{\"tag\":\"سوئیچ شبکه\"}}', '/admin/tag/4', '2021-12-13 14:39:29'),
(8, 77, '::1', 'delete', 'blogs', 0, '{\"id\":{\"path\":\"admin\\/blog\\/12\",\"_method\":\"delete\",\"id\":\"12\"}}', '[{\"id\":\"12\",\"slug\":\"Accusamus fuga Fugi\",\"title\":\"Culpa quis minus nu\",\"value\":\"<p>Hello, World!<\\/p>\\r\\n\",\"seo_robot\":\"5\",\"seo_canonical\":\"Veritatis iusto in i\",\"seo_H1\":\"Aliquip aliqua Dolo\",\"seo_description\":\"Recusandae Eiusmod \",\"seo_title\":\"Voluptas qui minim b\",\"meta_title\":\"\",\"created_at\":\"2021-11-08 15:05:03\"}]', '/admin/blog/12', '2021-12-13 14:40:10'),
(9, 77, '::1', 'delete', 'taggables', 0, '{\"entity_id\":{\"path\":\"admin\\/blog\\/12\",\"_method\":\"delete\",\"id\":\"12\"}}', '[]', '/admin/blog/12', '2021-12-13 14:40:10'),
(10, 77, '::1', 'delete', 'blogs', 0, '{\"id\":{\"path\":\"admin\\/blog\\/11\",\"_method\":\"delete\",\"id\":\"11\"}}', '[{\"id\":\"11\",\"slug\":\"In proident elit m\",\"title\":\"Fuga Tenetur sit i\",\"value\":\"<p>Hello, World!3333333333<\\/p>\\r\\n\",\"seo_robot\":\"4\",\"seo_canonical\":\"Fuga Fugiat autem o\",\"seo_H1\":\"Dolor mollit velit a\",\"seo_description\":\"Esse praesentium iu\",\"seo_title\":\"Earum quos quia duis\",\"meta_title\":\"\",\"created_at\":\"2021-11-08 14:59:28\"}]', '/admin/blog/11', '2021-12-13 14:40:19'),
(11, 77, '::1', 'delete', 'taggables', 0, '{\"entity_id\":{\"path\":\"admin\\/blog\\/11\",\"_method\":\"delete\",\"id\":\"11\"}}', '[]', '/admin/blog/11', '2021-12-13 14:40:19'),
(12, 77, '::1', 'delete', 'blogs', 0, '{\"id\":{\"path\":\"admin\\/blog\\/10\",\"_method\":\"delete\",\"id\":\"10\"}}', '[{\"id\":\"10\",\"slug\":\"sssssssssssssss\",\"title\":\"ssssssssssssssss\",\"value\":\"<p>Hello, World!sssssssssssssss<\\/p>\\r\\n\",\"seo_robot\":\"4\",\"seo_canonical\":\"Qui aut velit archit\",\"seo_H1\":\"Aut dolorum tempore\",\"seo_description\":\"Blanditiis incidunt\",\"seo_title\":\"Molestiae corporis e\",\"meta_title\":\"\",\"created_at\":\"2021-11-08 13:57:00\"}]', '/admin/blog/10', '2021-12-13 14:43:56'),
(13, 77, '::1', 'delete', 'taggables', 0, '{\"entity_type\":\"Blog\",\"entity_id\":{\"path\":\"admin\\/blog\\/10\",\"_method\":\"delete\",\"id\":\"10\"}}', '[]', '/admin/blog/10', '2021-12-13 14:43:56'),
(14, 77, '::1', 'delete', 'blogs', 0, '{\"id\":{\"path\":\"admin\\/blog\\/9\",\"_method\":\"delete\",\"id\":\"9\"}}', '[{\"id\":\"9\",\"slug\":\"Anim qui quasi omnis\",\"title\":\"Doloribus rem provid\",\"value\":\"<p>Hello, World!sssssssssssss<\\/p>\\r\\n\",\"seo_robot\":\"4\",\"seo_canonical\":\"Ut est rerum commodo\",\"seo_H1\":\"Sit laborum Sunt a\",\"seo_description\":\"Voluptatum adipisici\",\"seo_title\":\"In recusandae Volup\",\"meta_title\":\"\",\"created_at\":\"2021-11-08 13:56:32\"}]', '/admin/blog/9', '2021-12-13 14:45:47'),
(15, 77, '::1', 'delete', 'taggables', 0, '{\"entity_type\":\"Blog\",\"entity_id\":{\"path\":\"admin\\/blog\\/9\",\"_method\":\"delete\",\"id\":\"9\"}}', '[]', '/admin/blog/9', '2021-12-13 14:45:47'),
(16, 77, '::1', 'delete', 'blogs', 0, '{\"id\":{\"path\":\"admin\\/blog\\/8\",\"_method\":\"delete\",\"id\":\"8\"}}', '[{\"id\":\"8\",\"slug\":\"Anim qui quasi omnis\",\"title\":\"Doloribus rem provid\",\"value\":\"<p>Hello, World!sssssssssssss<\\/p>\\r\\n\",\"seo_robot\":\"4\",\"seo_canonical\":\"Ut est rerum commodo\",\"seo_H1\":\"Sit laborum Sunt a\",\"seo_description\":\"Voluptatum adipisici\",\"seo_title\":\"In recusandae Volup\",\"meta_title\":\"\",\"created_at\":\"2021-11-08 13:56:08\"}]', '/admin/blog/8', '2021-12-13 14:47:16'),
(17, 77, '::1', 'delete', 'blogs', 0, '{\"id\":{\"path\":\"admin\\/blog\\/8\",\"_method\":\"delete\",\"id\":\"8\"}}', '[]', '/admin/blog/8', '2021-12-13 14:47:22'),
(18, 77, '::1', 'delete', 'blogs', 0, '{\"id\":{\"path\":\"admin\\/blog\\/8\",\"_method\":\"delete\",\"id\":\"8\"}}', '[]', '/admin/blog/8', '2021-12-13 14:47:55'),
(19, 77, '::1', 'delete', 'taggables', 0, '{\"entity_type\":\"Blog\",\"entity_id\":\"8\"}', '[]', '/admin/blog/8', '2021-12-13 14:47:55'),
(20, 77, '::1', 'delete', 'blogs', 0, '{\"id\":{\"path\":\"admin\\/blog\\/7\",\"_method\":\"delete\",\"id\":\"7\"}}', '[{\"id\":\"7\",\"slug\":\"Eos culpa ea ut ea\",\"title\":\"Consectetur dolor in\",\"value\":\"<p>Hello, World!1111111111111111<\\/p>\\r\\n\",\"seo_robot\":\"2\",\"seo_canonical\":\"Recusandae Sit dolo\",\"seo_H1\":\"Dolores nihil mollit\",\"seo_description\":\"Obcaecati consequat\",\"seo_title\":\"Nobis magnam maiores\",\"meta_title\":\"\",\"created_at\":\"2021-11-08 13:38:12\"}]', '/admin/blog/7', '2021-12-13 14:54:48'),
(21, 77, '::1', 'delete', 'taggables', 0, '{\"entity_type\":\"Blog\",\"entity_id\":\"7\"}', '[]', '/admin/blog/7', '2021-12-13 14:54:48'),
(22, 77, '::1', 'delete', 'category_blogs', 0, '{\"blog_id\":\"13\"}', '[{\"id\":\"11\",\"category_id\":\"55\",\"blog_id\":\"13\"}]', '/admin/blog/13', '2021-12-13 14:55:07'),
(23, 77, '::1', 'create', 'category_blogs', 12, '', '{\"blog_id\":\"13\",\"category_id\":\"55\"}', '/admin/blog/13', '2021-12-13 14:55:07'),
(24, 77, '::1', 'delete', 'category_blogs', 0, '{\"blog_id\":\"13\"}', '[{\"id\":\"12\",\"category_id\":\"55\",\"blog_id\":\"13\"}]', '/admin/blog/13', '2021-12-13 14:56:17'),
(25, 77, '::1', 'create', 'category_blogs', 13, '', '{\"blog_id\":\"13\",\"category_id\":\"55\"}', '/admin/blog/13', '2021-12-13 14:56:18'),
(26, 77, '::1', 'delete', 'taggables', 0, '{\"entity_id\":\"13\"}', '[{\"id\":\"3\",\"entity_id\":\"13\",\"entity_type\":\"Blog\",\"tag_id\":\"2\",\"created_at\":\"2021-12-13 17:56:28\"}]', '/admin/blog/13', '2021-12-13 14:56:18'),
(27, 77, '::1', 'create', 'taggables', 4, '', '{\"tag_id\":\"4\",\"entity_id\":\"13\",\"entity_type\":\"Blog\"}', '/admin/blog/13', '2021-12-13 14:56:18'),
(28, 77, '::1', 'create', 'taggables', 5, '', '{\"tag_id\":\"2\",\"entity_id\":\"13\",\"entity_type\":\"Blog\"}', '/admin/blog/13', '2021-12-13 14:56:18'),
(29, 77, '::1', 'update', 'blogs', 0, '{\"id\":\"13\"}', '{\"old\":[{\"id\":\"13\",\"slug\":\"پست-جدید\",\"title\":\"پست جدید\",\"value\":\"<p>لورم ایپسوم<\\/p>\\r\\n\",\"seo_robot\":\"0\",\"seo_canonical\":\"\",\"seo_H1\":\"پست جدید\",\"seo_description\":\"لورم ایپسوم\",\"seo_title\":\"پست جدید\",\"meta_title\":\"لورم ایپسوم\",\"created_at\":\"2021-12-13 17:56:28\"}],\"new\":{\"title\":\"پست جدید\",\"value\":\"<p>لورم ایپسوم<\\/p>\\r\\n\",\"slug\":\"پست-جدید\",\"seo_H1\":\"پست جدید\",\"seo_canonical\":\"\",\"seo_title\":\"پست جدید\",\"seo_robot\":\"0\",\"seo_description\":\"لورم ایپسوم\",\"meta_title\":\"لورم ایپسوم\"}}', '/admin/blog/13', '2021-12-13 14:56:18'),
(30, 77, '::1', 'update', 'orders', 0, '{\"id\":\"2\"}', '{\"old\":[{\"id\":\"2\",\"user_id\":\"76\",\"user_full_name\":\"\",\"user_phone\":\"09369532227\",\"city_id\":\"301\",\"province_id\":\"8\",\"postal_code\":\"12345678\",\"address\":\"تهرانپارس،\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"8\",\"grand_total\":\"6800000000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":\"0\",\"sender_id\":\"0\",\"status\":\"1\",\"created_at\":\"2021-11-30 13:15:39\",\"updated_at\":null}],\"new\":{\"handler_id\":\"77\",\"status\":2}}', '/admin/order/status/2', '2021-12-14 05:49:14'),
(31, 77, '::1', 'update', 'orders', 0, '{\"id\":\"2\"}', '{\"old\":[{\"id\":\"2\",\"user_id\":\"76\",\"user_full_name\":\"\",\"user_phone\":\"09369532227\",\"city_id\":\"301\",\"province_id\":\"8\",\"postal_code\":\"12345678\",\"address\":\"تهرانپارس،\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"8\",\"grand_total\":\"6800000000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":\"77\",\"sender_id\":\"0\",\"status\":\"2\",\"created_at\":\"2021-11-30 13:15:39\",\"updated_at\":null}],\"new\":{\"sender_id\":\"77\",\"status\":3}}', '/admin/order/status/2', '2021-12-14 05:49:19'),
(32, 77, '::1', 'update', 'categories', 0, '{\"id\":{\"path\":\"admin\\/category\\/111\",\"_method\":\"patch\",\"seo_title\":\"پرفروش ترین ها\",\"seo_description\":\"پرفروش ترین ها\",\"name\":\"پرفروش ترین ها\",\"slug\":\"پرفروش-ترین-ها\",\"H1\":\"پرفروش ترین ها\",\"canonical\":\"\",\"description\":\"\",\"robot\":\"0\",\"id\":\"111\"}}', '{\"old\":[{\"id\":\"111\",\"status\":\"1\",\"description\":\"\",\"type\":\"0\",\"H1\":\"پرفروش ترین ها\",\"canonical\":\"\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"پرفروش ترین ها\",\"slug\":\"پرفروش-ترین-ها\",\"seo_title\":\"پرفروش ترین ها\",\"seo_description\":\"پرفروش ترین ها\",\"created_at\":\"2021-12-14 11:52:52\"}],\"new\":{\"slug\":\"پرفروش-ترین-ها\",\"seo_description\":\"پرفروش ترین ها\",\"seo_title\":\"پرفروش ترین ها\",\"name\":\"پرفروش ترین ها\",\"H1\":\"پرفروش ترین ها\",\"robots\":\"0\",\"canonical\":\"\",\"description\":\"\",\"status\":0}}', '/admin/category/111', '2021-12-14 10:53:47'),
(33, 77, '::1', 'update', 'categories', 0, '{\"id\":{\"path\":\"admin\\/category\\/110\",\"_method\":\"patch\",\"seo_title\":\"حراجی\",\"seo_description\":\"حراجی\",\"name\":\"حراجی\",\"slug\":\"حراجی\",\"H1\":\"حراجی\",\"canonical\":\"\",\"description\":\"\",\"robot\":\"0\",\"id\":\"110\"}}', '{\"old\":[{\"id\":\"110\",\"status\":\"1\",\"description\":\"\",\"type\":\"0\",\"H1\":\"حراجی\",\"canonical\":\"\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"حراجی\",\"slug\":\"حراجی\",\"seo_title\":\"حراجی\",\"seo_description\":\"حراجی\",\"created_at\":\"2021-12-14 11:52:52\"}],\"new\":{\"slug\":\"حراجی\",\"seo_description\":\"حراجی\",\"seo_title\":\"حراجی\",\"name\":\"حراجی\",\"H1\":\"حراجی\",\"robots\":\"0\",\"canonical\":\"\",\"description\":\"\",\"status\":0}}', '/admin/category/110', '2021-12-14 10:53:52'),
(34, 77, '::1', 'update', 'categories', 0, '{\"id\":{\"path\":\"admin\\/category\\/109\",\"_method\":\"patch\",\"seo_title\":\"جدیدترین محصولات\",\"seo_description\":\"جدیدترین محصولات\",\"name\":\"جدیدترین محصولات\",\"slug\":\"جدیدترین-محصولات\",\"H1\":\"جدیدترین محصولات\",\"canonical\":\"\",\"description\":\"\",\"robot\":\"0\",\"id\":\"109\"}}', '{\"old\":[{\"id\":\"109\",\"status\":\"1\",\"description\":\"\",\"type\":\"0\",\"H1\":\"جدیدترین محصولات\",\"canonical\":\"\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"جدیدترین محصولات\",\"slug\":\"جدیدترین-محصولات\",\"seo_title\":\"جدیدترین محصولات\",\"seo_description\":\"جدیدترین محصولات\",\"created_at\":\"2021-12-14 11:52:52\"}],\"new\":{\"slug\":\"جدیدترین-محصولات\",\"seo_description\":\"جدیدترین محصولات\",\"seo_title\":\"جدیدترین محصولات\",\"name\":\"جدیدترین محصولات\",\"H1\":\"جدیدترین محصولات\",\"robots\":\"0\",\"canonical\":\"\",\"description\":\"\",\"status\":0}}', '/admin/category/109', '2021-12-14 10:53:56'),
(35, 77, '::1', 'update', 'photos', 0, '{\"entity_id\":15}', '{\"old\":[{\"id\":\"188\",\"entity_id\":\"15\",\"entity_type\":\"Product\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalav2.me\\/Storage\\/202112\\/17-292-033-04.jpg\",\"alt\":null,\"created_at\":\"2021-12-14 14:08:26\"}],\"new\":{\"entity_type\":\"Brand\",\"entity_id\":15,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/ADATA.---d1e1f27d.png\",\"alt\":\"brand_image\",\"type\":0}}', '/admin/brand/15', '2021-12-14 11:26:45'),
(36, 77, '::1', 'create', 'brands', 16, '', '{\"name\":\"VMware\",\"sort\":null}', '/admin/brand', '2021-12-14 11:34:36'),
(37, 77, '::1', 'create', 'photos', 194, '', '{\"entity_type\":\"Brands\",\"entity_id\":16,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/vmware-symbol-png-logo-3.---3302ea3f.png\",\"alt\":\"brand_image\",\"type\":0}', '/admin/brand', '2021-12-14 11:34:36'),
(38, 77, '::1', 'create', 'brands', 17, '', '{\"name\":\"Sophos\",\"sort\":null}', '/admin/brand', '2021-12-14 11:35:58'),
(39, 77, '::1', 'create', 'photos', 195, '', '{\"entity_type\":\"Brand\",\"entity_id\":17,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/Sophos-ATC-LogoSQ.---37fe0552.png\",\"alt\":\"brand_image\",\"type\":0}', '/admin/brand', '2021-12-14 11:35:58'),
(40, 77, '::1', 'delete', 'blogs', 0, '{\"id\":{\"path\":\"admin\\/blog\\/1\",\"_method\":\"delete\",\"id\":\"1\"}}', '[{\"id\":\"1\",\"slug\":\"sdgfasgfssssssssss\",\"title\":\"بیشلسیبل\",\"value\":\"<p><img alt=\\\"\\\" src=\\\"http:\\/\\/usedkalaV2.me\\/Storage\\/202110\\/Screenshot from 2021-09-14 19-40-43.---b84d2a26.png\\\" style=\\\"height:99px; width:512px\\\" \\/>Hello, World!fffffffffffffffffff<\\/p>\\r\\n\",\"seo_robot\":\"0\",\"seo_canonical\":\"\",\"seo_H1\":\"\",\"seo_description\":\"\",\"seo_title\":\"\",\"meta_title\":\"\",\"created_at\":\"2021-10-04 13:16:54\"}]', '/admin/blog/1', '2021-12-14 11:36:22'),
(41, 77, '::1', 'delete', 'taggables', 0, '{\"entity_id\":{\"path\":\"admin\\/blog\\/1\",\"_method\":\"delete\",\"id\":\"1\"}}', '[]', '/admin/blog/1', '2021-12-14 11:36:22'),
(42, 77, '::1', 'delete', 'blogs', 0, '{\"id\":{\"path\":\"admin\\/blog\\/2\",\"_method\":\"delete\",\"id\":\"2\"}}', '[{\"id\":\"2\",\"slug\":\"Irure anim maiores q\",\"title\":\"Suscipit sit quia s\",\"value\":\"<p>Hello, World!<\\/p>\\r\\n\",\"seo_robot\":\"0\",\"seo_canonical\":\"\",\"seo_H1\":\"\",\"seo_description\":\"\",\"seo_title\":\"\",\"meta_title\":\"\",\"created_at\":\"2021-10-04 15:52:27\"}]', '/admin/blog/2', '2021-12-14 11:36:24'),
(43, 77, '::1', 'delete', 'taggables', 0, '{\"entity_id\":{\"path\":\"admin\\/blog\\/2\",\"_method\":\"delete\",\"id\":\"2\"}}', '[]', '/admin/blog/2', '2021-12-14 11:36:24'),
(44, 77, '::1', 'delete', 'blogs', 0, '{\"id\":{\"path\":\"admin\\/blog\\/4\",\"_method\":\"delete\",\"id\":\"4\"}}', '[{\"id\":\"4\",\"slug\":\"Cumque dolor dolorum\",\"title\":\"Cillum laboriosam u\",\"value\":\"<p>Hello, World!<\\/p>\\r\\n\",\"seo_robot\":\"0\",\"seo_canonical\":\"\",\"seo_H1\":\"\",\"seo_description\":\"\",\"seo_title\":\"\",\"meta_title\":\"\",\"created_at\":\"2021-10-18 15:50:37\"}]', '/admin/blog/4', '2021-12-14 11:36:27'),
(45, 77, '::1', 'delete', 'taggables', 0, '{\"entity_id\":{\"path\":\"admin\\/blog\\/4\",\"_method\":\"delete\",\"id\":\"4\"}}', '[]', '/admin/blog/4', '2021-12-14 11:36:27'),
(46, 77, '::1', 'delete', 'blogs', 0, '{\"id\":{\"path\":\"admin\\/blog\\/5\",\"_method\":\"delete\",\"id\":\"5\"}}', '[{\"id\":\"5\",\"slug\":\"Commodo molestias te\",\"title\":\"Saepe ut in repellen\",\"value\":\"<p>Hello, World!<\\/p>\\r\\n\",\"seo_robot\":\"0\",\"seo_canonical\":\"\",\"seo_H1\":\"\",\"seo_description\":\"\",\"seo_title\":\"\",\"meta_title\":\"\",\"created_at\":\"2021-10-18 15:55:49\"}]', '/admin/blog/5', '2021-12-14 11:36:30'),
(47, 77, '::1', 'delete', 'taggables', 0, '{\"entity_id\":{\"path\":\"admin\\/blog\\/5\",\"_method\":\"delete\",\"id\":\"5\"}}', '[]', '/admin/blog/5', '2021-12-14 11:36:30'),
(48, 77, '::1', 'delete', 'blogs', 0, '{\"id\":{\"path\":\"admin\\/blog\\/6\",\"_method\":\"delete\",\"id\":\"6\"}}', '[{\"id\":\"6\",\"slug\":\"Rem tempore numquam\",\"title\":\"Commodo vel pariatur\",\"value\":\"<p>Hello, World!1111111111111<\\/p>\\r\\n\",\"seo_robot\":\"6\",\"seo_canonical\":\"Dolorem qui animi d\",\"seo_H1\":\"Est assumenda assum\",\"seo_description\":\"Deleniti illo est q\",\"seo_title\":\"Voluptas et consequa\",\"meta_title\":\"\",\"created_at\":\"2021-11-08 13:37:40\"}]', '/admin/blog/6', '2021-12-14 11:36:32'),
(49, 77, '::1', 'delete', 'taggables', 0, '{\"entity_id\":{\"path\":\"admin\\/blog\\/6\",\"_method\":\"delete\",\"id\":\"6\"}}', '[]', '/admin/blog/6', '2021-12-14 11:36:32');
INSERT INTO `activity_log` (`id`, `user_id`, `ip`, `type`, `target_table`, `row_id`, `where_condition`, `detailed_data`, `uri`, `created_at`) VALUES
(50, 77, '::1', 'delete', 'settings', 0, '{\"id\":{\"path\":\"admin\\/setting\\/1\",\"_method\":\"delete\",\"id\":\"1\"}}', '[{\"id\":\"1\",\"slug\":\"Quasi libero nulla i\",\"key\":\"Nemo sit impedit vo\",\"value\":\"<p><img title=\\\"Screenshot from 2021-09-14 13-00-07.png\\\" src=\\\"data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAABDAAAAKKCAYAAADLFas\\/AAAABHNCSVQICAgIfAhkiAAAABl0RVh0U29mdHdhcmUAZ25vbWUtc2NyZWVuc2hvdO8Dvz4AAAAvdEVYdENyZWF0aW9uIFRpbWUAVHVlIDE0IFNlcCAyMDIxIDAxOjAwOjEzIFBNICswNDMwuYrOUAAAIABJREFUeJzs3XdgTlcfwPHvfbITQRIj9t41Wn1bLbVXbLVnWlttWqqlOim1N0WIvWdstRKxgiBEguxB9pP9jHvfP4JmSkJI1Pn8RZ4n55577pm\\/e+6NpFarFV6Rs7MzdnZ2WX7u5uZGrVq1XjV5QRAEQRAEQRAEQRDecffv36dhw4bZfu\\/YsWM0adIky89VeZkpQRAEQRAEQRAEQRCEN0EEMARBEARBEARBEARBKPBEAEMQBEEQBEEQBEEQhAJPBDAEQRAEQRAEQRAEQSjwRABDEARBEARBEARBEIQCTwQwBEEQBEEQBEEQBEEo8EQAQxAEQRAEQRAEQRCEAk8EMARBEARBEARBEARBKPBEAEMQBEEQBEEQBEEQhAJPBDAEQRAEQRAEQRAEQSjwRABDEARBEARBEARBEIQCzzC\\/MyAIgiAIgiAIQgpFE4H3tYucP38Bt0K9WTa+EUb5nSlBEIQCQgQwBEEQBEH475ETeeIbgVmlshSW8jszgpANOQqvC6c4de4CLnejKVavCU0\\/68bgctUwyKcsKZoIHoeqqFTeSmzZFgShwBD9kSAIgiAI\\/w1yPMHup9m2ZAYje3Wl7\\/QD+OlfL0kl\\/CCTWjWlhf16vF8zrWzJj9k4tCVNW01g31M5T5LUnp9Fm2bN6b7gOto8STE7Gjw3DKV1s6a0HLqRx89PQ47EbfMsRg4bz4wZ4xk26me23ozi+cdK3H32zRnL0DHT+WnSCIZNX4tLqO6t5LggUBIecPl6LGWb9WfMqG7UVO6yZ+EsftvjyZuudmnykfSUe+f3sPKXsfTr2pOxjvfy7PhvpC7qPVk7qAVNW33LkSjlzbTXPGqXb7UveYe9aj15Y33dG+iX89rb7+fzl9iBIQiCIAjCOy4Rzz3zWLjNmQcROszL1OeLDuMZ3qYZdd7YTEcm\\/PRCdhUayzeNTN\\/UQfKXoub80vXIX02kRZGcbWPRPtzJ6tMxGEuQ9OKnMkEHf2PG+rvUnbqH3+xknL7rxfwfYrF0+IsuJWM4N386Sy\\/YMmLTH\\/Qv5sJvvWYya6Ypq1cNpup7MFuVTEpRXN6Cw5+beZJsQsk6n9NyxB+0bvG\\/t\\/P4iNaPY4v+wuHM3fw5vvAOSeDSihWElzfH07g337YrLu6Iv8teoZ\\/Pb+\\/BkCAIgiAIwn+a1gOnrWfxjDSg3ggH5veviOlbmIcVaTwKe8kQBXg3pn25JBWm2YRJOf++zoc9azz4zL4FYX\\/uJOT5z+VAzh1zJx4rSpWyQJIUSpUqDFdvcuxsMB3bu3PUJQrFsD5lSqrAwJYyxSQ03sc4+aA\\/VfMoCpV0dS2r1N2Z0Pp1F1waPPb\\/zWV9TT7+\\/DPqlTZ\\/7euv9z3NjmO3CaUSfZauYHS9Qm91UZj6+H2XrmRUPYu3cPy8L0fhbTDn8zHfIssKXVT5GLqQ\\/Tm48AJVJw58g4Hq90Bu+\\/kCQATMBEEQBEEoGJR4PE9swWHjftzCX75VVw46zNwNt9ABGNWhbftKmKDD2\\/kC\\/prsDqQnOUlDhiMocdxeM5y2zbsy3Skk4+cpXyLeYyvfD+hE2\\/YdsGvXji5f\\/8LBx5rnGePQnDUc2T+XdTffxGZeBV1SEtrX3smsI1EdS1KWW9kVYs4tZtGhQyxedJYoJbv09PjvX8WNhqPoWi7dWxv0wQQEy4AJpsYAEsamxoBMkH8Q2pAAgnUKGJlgLAGSCSbGEshhBAYnv9ZZpmb6yQgmvXbwAkAhOfQKe5b\\/yvj+vfj6lx3ciszkgsgycrbllsKgYkvs6ligkgO5cs6bhJz8Xi7Sz83xL597kOb4SsxZFi0+xKHFS7mgzu6AMqHnljLZvhcdWzenpV0fJix3JizT+prDcnyn5Ob884bm+joWOB1l3fzjhL70OAraBDVxya+RGSWG6+sm08+uFS1atKR11yHMPh70Vh9zekFVnq7f5iJ4kYvxBf0Ddszdlc2jPgqynC6dN9L\\/60hUq0nUvUJjl5OIVSeizfJXc9vPFwwigCEIgiAIQsEgWVCluiE3dizhpz+PEPySOaaqTGemDWnwbCupGXWHzGLkR4VIvreJ3\\/++SXymEzGF2FsOTOzRnrbt2tKu2zB+drxM6PN5plSIekOm0a9KHK5r\\/uZibCaJKGrOO27ENVBLtR7fM7mdLXGP\\/mHt9mskp2SMLtNH0qn7NIZ9mLL5Xn56jT0bHXA8\\/RCNEs\\/9Y5tw2HiAm5FavNbZ06JpKyYfiiTbpWG4C0tHdqNdu3a0tevJN3P3cDv9gk8Xhd99D+49Ckv1CEc6yV5sm\\/AlHTp3wq7rKFZejXpxbDlJTVRkFOokhSLNxzD8iybYf\\/0JhZRwTvxuz0D7GRwIzHhh5KBDrLpcl5E9KmKUyW30LM9NkjL\\/d15TYnBZ8R2Tv53PyZev8tL\\/IprYCMJjkv5dpCV4cvVaKAmygiLH8vjMKqaM\\/o2TwSnfkJ9eYMnYnrRr2YKWrTsx+Kd9eGd5MZ4xqkTvmZNpaqPHb99sFl\\/Muj68Uvrp6ROJCo8k\\/vnKJt3xF52PeBHAk4q0YNLELnSZOJ6m2b0RVw7Dee9BrvspNBz9Jz8NaU4l2Y9HmQUmsinHvJGE9ylHHDbu43qYjBx8iZ0ODjie9UGXdIYZrZvSvNcSbqV53YpCQqg39+7dJ1Cdy8V+bs7\\/lenxP72WxYtXcOSBBuOPhzGlYweGfdseWxXo3Fdg36UzPf44T8KLU4rj5poRdOnQmY4dejJ5i8eLPjJX\\/VPCVfbvdCPE4GNGzOxD5bhHnFyznZev1XV4bF+MU0DeRnH03nv4ecpkpjveJtuYNeRqfMGgBn2n9aZapm\\/QTcRz1wwGd2pNyxYtadtzAutvxqaUTyb9f07JSTGER6hJE1960Vd3xq6zPbNP5jxYpA9yYkbvjnTqbEfnr+ZyNlW\\/96r9fEEhAhiCIAiCIOQTmeQkbZqFmlGlbvRvVoT46zs4cP\\/ZrFjrzG92zWjWcTauWkCJxmlqW5q3Gsiae8+mc0YV+fLHKTS30eO3dz4OtzNb0SVzff8ObkaY8OnQGQyrH8eF9T8wdWOqFyUaladurSKgvoP741RTRUV+tqCTkSQDkIyxqliLmmUKo5IkDCQp5TyUGI7\\/2Im2dl+zzvPZgjbElZ0bHdh01INYfTjX923CYeNOXENkZH3Kd7JfustEXNzNwfsx2LQcx\\/d9KxJybBnf\\/rSXoNTzTMWXfTPHMHrsCi4nps7+ixAFT4+vYaO7lnp9v6KRkSe7Fm\\/nnjbls4A939KjWw++2xuIPvYMv\\/fsRvdBy7mh1aIODcQ\\/IAR1hsWKHt+LzjxJuMHq6d8ydelZwmSQg0+y4Pu5OAXZUr60CtCQrAFQ0CRpABVlypXGqFQ5ShtKoElCowBKMskaBVTFKVvaJOsiUWI4\\/n1bmjXvx4o7KZnS3V5On+ZNaT39OHGpvyuZYxTvxY1rZ7jyMIdLACUK1yVD6dr5S77s0pHeU3fhnQT6YDcu+yRj3GgC0+2sURmZYRR+lkWLjvJU1vPo8HoO3I6gZMeJDKqn4H9+LQ7nY9IGJJJc+bNrc5p3+QPnZ6tMVcnWfPdDV8qqnnJ60UouZrrbIYfpv4T20V6m9u5Ety+707HLUBa5pAQr\\/j1+GGcWzOVI0LNy0royt3s72vdawLXMFqqylqSkRJI0MqiK07R3Vz6wiuL8sp9YeQn+16cfjYr9u+R4XhdfXo45PJmsPG+vSgL3j2\\/CYeN2XIL0aB+dZuNGBzYd8yRBr3\\/WpqUM7S\\/h8krGjRrDrH2+WezEevXzz5jXXNRjADmMKwd2su\\/AOR4lpsu5HMn1U5fwj44hKiCIiGeZl332snynN2aN7en7QSI3HJZx4FlAISf9k6zXp9Qv06rUr2UJsVdY+9sOHmgVZHUooZlHjJ8xpE6\\/iXQsp4IkN5YO6kiHXrM4+XwXxLP+vXmnP7mci00LkqVC+K3rXHG+TUgO60uOxhdk\\/LeOonXzNozdFZzx+se7snXDRfz5EPvxdpSIuMW29cdS8vCi\\/x\\/Kes+chhpkQk7+yoDOXfjyyy50HvArx4N0pO+rPzP15+Sanbi\\/pIxe9PNKLM7rV+McVZluw9pg7X+MJRtcnwW0XrWfLzjEE0OCIAiCIOQDmYA9kxixKoTWf25iSv0YvLxjIdmLCw8SUOQYDi9bSrGudTAO+odbiQoKNzm4YSOPTGO4fE+DrAvh4p4dFG9QCDMjY5CjwFRC0Qdz\\/XoA+vrp\\/wSlgqIooGiJfhqBzsgEA2SiI6PRx7iwYcl5niY+4uqVCBSzT6lSWgXGJphIEnLQBXZusaSWhQUG5WtjddkN1\\/n2uAKSUSk+KBnGmcNOoHnMcfc4khISObdrB9YNTIh2dSZMAeXOPpavdcfHVw9KCGf+no9PaDCyyhxrG3Mkol9aYoqSMjlNinxCTHljjFGIjo4kzUYRlQWW5hJKlBp1ogLGppggE31tH1sORFBKCuTclhskS7YUNUsmDpCDj7F2jTWNi+t4fNYXPXoeHv2bdSFR3NWDHOvKlgWxxHrpkFRFKZrhLrwBlfsuYEPflP\\/p769m8DfbCCndlil\\/fkVllUxQ+3ps8fIgJCQepYFMSIgaLD6kffPSGBS1wO5zK65dfELQExmKhRIUrmBcrT1ta7xkqiqZU6yYOZIcgtPKZVi2LIN015UwRcLQyCTdJFdBq9OjIGGQYS2pEHVmLlMc7mP75W\\/8\\/mX5lDt8uke4nH1MglENOvcqzrUda\\/hlrkL\\/jzRYFZLwubqCv1BRvtMg6tzayDEvT\\/z0dphrtCgoaGLjMLUqgqSEEBocjkyRf+ujUTGKFZWQfc\\/x98KyBNeywtLcCCVBi6kK5Cg3rnnraNow\\/V1cBU1O0gfQ3cdxymxOJn3CuIXj+NQCQCbi5jncwvUUa9KXxpGHODjnJ+jXhprWJv8eP+YKy6f\\/QUzv\\/2EReparUYkkWUuZ3PmUCdk7iYHL71FlxEZWDyhPiS\\/Gs\\/Lzr\\/De\\/wdTlu9k9sqa7Py5BSbp66LBy8qxMyVUaY8TceMgh91jKd24N22rP3txrqIhKVlBkowxNpZAn7a91lQFcNpDB3IYZzcuR1HdJFEBxX038\\/4ywl0HKisbrNIcS8KikDkSMuoYNTKFs66DuTh\\/i6ySyFU9BlSWlCxhhkp+ypE\\/pyN3+JwqRWViAr246XKRG4HxyIDkdZCVG81paivz6PheHulUVC5sQlIkoPXkwCoHDD4yI+5GNv0Teh4cd2SvYU1MDFVYth\\/GyAZB+Luf4+Stp8ilqlGlUPo+QSHGdT3zD\\/th23Y8o5s\\/e3TLtA4NqsrsPXOO+ZMh8MtPKRp+jluJCtgYY\\/ySks5Aq015NEKlyv6OvCY0Z+OL427Ciinc\\/+cxWlnGwMgI0u1lU\\/QaNHpAiidWqoSVMQR4nWfvYUsq6x6m9P9JxZAy6brkgP3MnLGX4BpfsWB6a6wlgEQ8LjgTrLXkox52SGd2s+gnA562LsG9fWn7aiU5mUwfqkvVthy3+mCuv4\\/TBTVY1sJcn4SCTNT5TaysHk1dszhuvlI\\/X3CIAIYgCIIgCPnCyMwCczMLCplIKOorrBq\\/ADctSMbFqNOiDor7UdbuvgePfDCt0ZSmyi0ubduEh0omwaoezT+L5uo\\/a9ngbUGcXxwyEpKhKcWqf0Gv1hXJuPvXlE962tM4cB83j61mnaoQZT7uxQj7\\/2FkeBtTXQRPk4vxYedmfNG5Oy2Lq5DkhrRrWZobJ\\/057bCZW6p4IiVjLKzLUqtadWx1\\/ng9CuH6tkW4UIGy+BJaJF3eArSUqN0AyyeenN8TglWt3oz9NJiD209zXV+Eqi2H0P9\\/2f0lExXFmvejt0skxzz2seqOAUUqNsZ+XG9qpDpRre9lrgXJqIqWo6ylhGHdNrSvfIE9j13YuDKM8npf4stVoZw2gIsbt6MYWVKmfCEe7V+Ln4VCVHwRqjeoTIz3JXacKETljqMZoDnF1jPOJJmV49Pe9rS0znpiG3\\/DkXmOzkTIIIecZcWvJnz1Yz\\/qdpvJb3FLWLt3BjMvQYi6MUP\\/mEjnUirAihbf\\/kGkyUqOzfmR+8ZhBH\\/Qj58nDnj5XyBJeojb3RhkyQDdoyNsCjdG\\/yQRTMvSqnUDUu\\/dkMMvcupaHBjXp0bl9DVDJsznHj7+gajCoojWlMXKUEdcVGHqNSqN01Fv7khjmDVSyy9bTrP9ghcBkgXFihkQHRaD76H1+ErmVOvXmtqGhph2GYLdzRWcubCOtbKCghGFChdKc5dfF3SDWyEykkoi5Nwmdl5TCIvSgyShMi5KpcZ96Vgnsy3ohtTMQfoAaILwuudPoEUFwiLi0ZuboSTFoKn0MR9Y3OGWWxAfrJ4Ov8\\/j4s4l7I\\/+9\\/gV65VD8j3Hxl0+4PsIncqCqq2bUzPD9VCIi41DVkAbHUaUpiyFtVE8CfDk5v0QEhUwUamQJDKpi94vKcf0x0nEbc8KHC4Vp\\/cn\\/Wn7\\/BR93LgdrqAqXYFypiBJ6dtrHFHmlalfNwmfO4c4bFaGpsP6YeO6ncPn1RjbfkSfYR0ol3oFrERx9dJ9dJIhpcuXRpVxD8QrnX+WclGPU1jQZMzPDGUDR6\\/f4fCGa+gxxKRQEWxKVqNxxwY0\\/sgCt+3bubjFgTCbOAKkilQpoxBwfC2PJROKlCuP6tYW1nqZIEfI2Nb7hKIhd7mwJ4Siqfqna7rClK9uSbT3IVZtc0cK8n32ZzolVEbmFK\\/Zit7jB2RSL\\/QE3jjDRecwGjWd9m+AQUkiLl4HkiHGajd27vdH5\\/OsfrVpQY0cP3WRhPfpczzSq7CqVp2S2UQwcjy+OK4m0EbGP0LBuERj2n5ig4rYNGlJlk0YMOgT\\/HfcYN8Sj2fvobnD7qUJlOcRATpDitZtQ5MKGUcg\\/ZNHePgFkFD0KRGxWqwsVSSrY7D98BNsnC9yx7sEK2cOZNnvhzjwdwKUf95X78CwaFVaDe9FZk+mpG5bjg5eGCoaSleuiE2gG9sd9BhYlKSCdRgnVq7DyyaaB5Gv18\\/nN0mtzvZtPFlydnbGzs4uy8\\/d3NyoVavWqyYvCIIgCMJ7Q0fckyCeJBhiXaoUVqbiKdec0RIfGUlURCiPbp1m55bDeMQUpdGU5czuXDaTIM67TCFZHU5UdBQhD904uWMrxx7EYlprKEuXDaa6UcbvRkaG4efhzP7Nu7kcYkCNQfNZPOwDzNOlrPXZx\\/RJy7gWqU\\/7KIZkhHWN1gydNonOVdIHmbSogx7j+zQZk5KVqVraFI06lvjEeNThofjcPcfuzUfwlBsyef0cWplEERX5hMfuZ9mz9SDuERLlev7FmnEfZX13Po2UF69mnv5fdCmVrs0o0VxeOoFZ+3xITHtSqCzK8EmPCUwb8ik2r9nU9IFOzJywAJcwXaqyk5BMbKj5RQ9GjunHRy89SPpyLJRJvdVya8kAJu4Lw6ZBF7p+bos++DbnTrnim2hD02kr+KW97Ss\\/Gy8nqYmIiiTc\\/x4uh7axyzkApVJv5i7\\/ho8y7C543fPPTT1+V8n4bRnF12u9MK\\/Xj6njO1PDXM2Ds5tY7nCJp4VbMmvjT7QomotFsi6BqIhIwkO8cTuxnS3HHhBv05zpK2bR1ja7K58344ucHI86PoHE2CjCAr25emQLOy4FY\\/TxFBz+6kK22Uj0wGHyVDbdi037Al5JhWmJenT8ZhpjWpT5z+4wuH\\/\\/Pg0bNsz2e8eOHaNJkyZZfi4CGIIgCIIgFGhKzFkWO8RSBV+KDhmX\\/YsE3yfay\\/zZ\\/XuOqmWQjCha+TO6fD2KQU3LZnLn9l0Xx\\/Hp3ZjtogEkDC3L8VG7\\/owcYke1Z4tMrdta5vuXxsYrmcLRq1jpogFJhXmp+rQd+A0jOtYgq\\/WoHB+Ex21vnqiT0BuYU7R4CUqVqUDZYmY5WxinvhaAZGBB6Xqt6DNyBF2r3WPui+ukwrxkXVr2Hs7wL+ule3zhFdOvXTiL96hoifR2565\\/JAlaCZPC1pQoUYpyFUpTOA8XynJCEHdvehIck4RiaIFVqYpUq1YemzwMRCpxDzjqsJXT9\\/wJjUjEyKo05avUpUmn7rSpbfUawTqZoJ1jGLzCAy0SKrOS1G3dj1EjulKnSM7yn7vzz74eg5Yb6xYS0uk7Oma7Ki6YFPUtNv38O1vcnqa82wYACSObBvT98WeGfWyFRM779+ePpgXoQTKyomrj7gz\\/ZgCNbF+vIud8fEldT1LORWVWgtpNezDim940yGlD1qvxu32HxxFxJMtGFLIuRgnbclQoY4XJf3xoEwEMQRAEQRCE950Sg4\\/7Y2KNLbEpVZZSVqb\\/4Te064nwdscv0ZTC1raUKW2NWZYnqyfC+zb+SeZYlyxLmRIWb\\/6upqLG9\\/YjYlSmmBe2ooRtCYqYPMugEoPPrUfEGBfCukQZShd\\/hfy8LH3htSSHeuIRosXCuiRlypSg0ButLLmpx+86mYQwf\\/yCI4jXG1HIypZy5Utg8QrRJiU+EA+vCCTLYpQuVwqrfKj7yU88uRecjKGpOZZFi2Fb0gqxWTDnRABDEARBEARBEARBEIQCL68CGCJmJAiCIAiCIAiCIAhCgScCGIIgCIIgCIIgCIIgFHgigCEIgiAIgiAIgiAIQoEnAhiCIAiCIAiCIAiCIBR4IoAhCIIgCIIgCIIgCEKBJwIYgiAIgiAIgiAIgiAUeCKAIQiCIAiCIAiCIAhCgScCGIIgCIIgCMJ\\/nJ4Ir\\/sEJwNyHD5eQWjyO0uCIAhCrhnmdwYEQRCE7MjEB1zn5GEXpDbj6VbNIL8zJAiC8E6RQ8\\/jdDkM\\/bETxBlYUOrzbpTP70wJgiAIuSYCGIIgCAWVLoaHl45x6KgzfmZ1adG0CfVKio1zgiAIuaWybcngwfmdC+F9pYsJIkwqTanCUn5nRRDeeWImLAjvIq0Lf3T7gZPxb+uAMv5bR2O\\/xhP9GzqC7u4KBo7dSbD86mnoH25g2KjN+GWVhhKD09QezL2iffWDvDUKcdf3c9C3KJ906sCHRrfZsWo7NyKU\\/M7YOy0v6tkreafqXipvva95c\\/nIs2uvvcCvnWdxTps3+UpJM3fp5Fs9zgu5Otc8HntepR1qb7Cwz1SORL0jfW9e1UklikPf9mXRTW3e9V\\/52A\\/mT5vREnHvNBtnj2Hg8AW4vOHx+7XOMY\\/qzTvdN73DtOdn0aZZc7ovuM47Nst4JSKAIQhZkf05MGcDt3T5nZE3J+nySuafDkeMM2+Ljntb5rDrYU6m4hKmZUqhc1nPEsdr6D4cydLNC+lZ6T3stpU4nJct5Ew+LSA0V9cw92ioaCc5pESdYeEyZ+LekfWeIAjvOoXYi0tZeOgwSxecJjKP+p7X6ft1ASeYO7I\\/oxa7vN\\/jdw68V2Nsoisr\\/jpJWEE6WUXN+SWLOBvz7gza4hESQciKqjzdpg\\/J71y8UaaNvuHb\\/M5Evkvm2t8riO42kTbF3\\/TkwpDaA6dTO0ff1eN3ehdXy0\\/A8ccmWLzhnBVoUiGajJucb4c3\\/mQk0\\/LlyFqCzv7N0i3n8Sk7lLU\\/t6XoO7D7WLJqxeRx+Z0LQRDeHxKWX4wnr0eJV+\\/7xfidGzkrZ4X4a8sY9YsrdaauZFpTK96B4TAjs0aMnqKgKkixLKkwzSZMyuUvySQnaDAwN82XYEJBKj5BeHPkCFwXDmP40uuocxRglPHfP4d1R\\/YwZ\\/0t8nsThhJ7m3VjvuL3s2GZRqiz+zxTia6sWOCE04r5nArPq1Cwnke757DZI+sSk4MOM3fDy8tU\\/3AXczYdYcccRzx0oHN3YM5+\\/zcUnTfhf8Mnv4XgBeg8NjNn+xEc5+zEO9tNGAaUb96ecje3svt+Yo7SV9S32fbLWL4eNJihE+bi5POG3rEvR+K6aAQjV7uT8OJnTzg2dzVXkgHdLTbM2cOR9XPYn+XzPDmkqLm15SdG9u\\/LsF8P8ijpNfOeW8lXWD33EEdW\\/YlTaE7ORcuNdXNz+N10UpchIPvvZc4mNW1nbWDHL+9G8AIlktMLlnL40EKWXozl3bmfU\\/DJoU7MXXcj++3BmbXPNyTp0R6mfvUjR19jv\\/grjV\\/Zeo12KOSbV65Pb2KcyHXfn1rux++3KdH7EHMnDmXwoK8Z+8tOPOLzsafORTnrE9XEJcQRk6DLcmyRtUkkaTN+qgu9zJ6NDmw984g01UP\\/gB1zd72YkykxZ1m0+BCHFi\\/lQs4WDDmjxHB93WT62bWiRYuWtO46hNnHg17yaJye5CTN6\\/eJchKx6kQyKZLnGSPm3GIWHTrE4kVnydFGV50fh37oQwe79nQZsRq32Ldff0QAQ3g\\/qGz4bOxkPr65jO2ez6Z\\/ycFcd9rFnjMPUKfqIeSkOOKToXz36QxpY8e4AfUwJIlLi8ey5uarPlmmEOexgxlf96L3sFns9sxsQEvmwfZJ9Oj0JfbfLeeUT8KLDlqyrMeQ7+0IXbuBq5nMSLP7PAN9EnFyQ0ZP6UjHMRNobJyEFtB7b2Xq7BNkH89QiPPYycyh\\/Rg8eTkXQp93wQZU6TWdQXWyjseqynRm2pAGGKIQ57KUKauvZ5hkG1TtzXT7TvSdPpg6hmBY\\/2umdy+fiw5LR9j17cwe05eu3foy7Pt1XIlMf1JariwaQK9+9owYN5VflzridMUX9YvRJBmfI7MZ0acX9lMduPE6W+t0ScTGazGoM4jpvVvz5fjuVDGQCT8+m6nbvFMGMCUeX5eD7Nx\\/Ed+ElGMZVerBTxPKc\\/LXBZzLQZAp\\/tJ2toZ\\/wS8bNjLPvjpxwRHIgBLjjuMPX9HPfjrbPOJzuKhUiLuxhpHdOtFz2AzWu6T6k4Mqaz4bM5GPrq3493EYVUnspo3iUxPAsAFDpvek09DpdK\\/wkqumvcZfPb\\/n2MsmCQlX2LU1jE++m0m7WAfWnI7KkH85\\/ALz7DvTue9oft9+g\\/DcPCyvD+Hc4vEM7D+Cn3ff5995nJYEdQJak08ZNc2OVgOxNuU3AAAgAElEQVTG09ZWheyzmx9+dSLreZYRHw2bRkdbFcg+7P7xZw4FZfLlTK53mjIEkr09CKvbhqblLbKp+zJxvi7smzeCTpP2Z781VR\\/IkRl96dR1ABPmH+C+OjdTpJR2MarfQMbMO4bfi0oho4mPJUm2pvWUcbRvNZzhn1ki6e6wfsJ8LmT5XHXK5Ckl2KEj3PsO\\/nkwGZKfXmDx6N70HjoDxxsZ68zbpn\\/wN0PGbCPgNWajKtuOTBv2EUbZfjGT9plwl63TBtKpdWs6DfqBnZ7ZrfC0BJycz9gB\\/Rm94CyhWbQp0yo9mNZXYcu68zm8OZBRrsevHMlhO0xPG8adExv4vk+vlHc\\/vKo0fVvOylIf\\/YCzO35hkN0sziXn9Dj+HP1jCL36jub3vZ7k5zo0JT856NNfItv6pAni4roZDOvdjZ6DxjL7oHfKYjQH40QGedr3JxF0\\/TDLJ3zJUIdH6Mnh+K1RExaViIxMhOt2jlx2YbuT17NFrYaA6xfxjM7mTHJd5lrc927gQa0prNm0jNEfa3ny9GW3lF4yF8gBOfIa676zp9\\/X03FwS31dclvOEoWb\\/sjuE\\/v4o33xjGOiPpDjf9jTuV072rXrQL9JS3B68G8Q3bBkTUo\\/Oc7ff\\/zE2pupOhqDGvSd1pvnf9xNKtKCSRO70GXieJoWlgAF9Z3DbHLYhJNHLIrOh7OODjjsvESw7gl7xrWiacuhOPpk078kXGX\\/TjdCDD5mxMw+VI57xMk128nYzSjE3nJgYo\\/2tG3XlnbdhvGz42VC031PiQ3C8949vEKyntPpg5yY0bsjnTrb0fmruZxNVahykpqoyCjUSQpFmo9h+BdNsP\\/6Ewop4Zz43Z6B9jM4EJj5Oek8j7Dt0hO0ikzcg73scXn7NytEAEN4fxhXp8knMjeuByErcbgsGMcfh2\\/hvG4qsw4GP4ty6vHZPolJO\\/yQ0fNo63hGO3iiRyY+LJCITOIOSmwAHj5RqaKoClFXVzG2V3fs\\/zhBiAzIARxcfhjz\\/r8zvXEYjltcyDCf197h8H4dvVdt5PduEvt+mMuZVA9yqso0oYm1O1cfZj7QZPd5anLkcWaNXMtdHSjqU\\/zc90+ck0FJiiL4Seyzc9Hi8ntXZv6TyURXDuDg8oOY9v6JsdXcWbTh8rOItpYrCwYy52LG2Zccfod\\/rvqnGvgkzKuVRf\\/PBTwzdOCp01FQn\\/qZoSvc0QGy\\/1ZGD12fEi3X3WH5wInseyqn+V2\\/QzMZM+8mZb9azM69axlmcwbHkyHpItlGfDR8GSsXzeaHsX34UOfMqulj+OVwSl1QIk+z2jGW9j\\/9TGfpIBtPPckYCZej8PHwJ\\/V6Sw79h3nDetBjxFIuPQtla++sYvhPx4hUQHtrBUO+20eIDNrYUEKiNSjIhB39jYlLTuN+egmT550jZc6iwvqLSfzY7CErN9\\/K9M6rHHEfl9uh6ACLz\\/sxoOhRJgwYw+oHFWn7WSlUyPjsX8oRk15M7WHI\\/pVH0r5cS4nl7pE9XH6S\\/uwSuHLgJMVGObB+ejPC109j2bVUg75xdZo0TOTy5cCUctHfZ93oHzkSJme4Zshh7J\\/cjyW3dCn\\/ntidPy9rARk5w6gn47dlNMMdHqbUQ7MG2NkZcW7+XxzwSiAhMTndQCkTfn4vN2r\\/gOPKcdS5v5BpDp5pd\\/hoHnJq23n8M1k4JLpuYOWjD5kyoxO6HUs58HyFqXVhbv95uGqAJGfm9P2VM7GgJEcR8kSdyQ6iJHwvn8UjKlU5qspS2foe\\/1yNSFd3srjeacoQjMtWwOyGEyfueuN+Yh2zJqzgWoZKIBN54S8mzHFGrlWb0hFPCFMAFKKdptI7kxd66R+fYH9wC+ZuXoh9iYv8OnMfgTmqE\\/+2izY\\/TuXz4DWsPBWZcj3kCJxmjmDNnZRrfPiHQSy+rgUlkYjAcOL1WU1vJIo0n8j4LyyRkIi+uIQ5hwKQSdfWX0qHz\\/HtXHzRD8TjsnYJnh9+yy\\/9CnF8\\/lbuZrhgqfu3rMsq17TnmNXpFy5ogaSz\\/NRxOifiAEVGRkq75fkl9TJTSbfY9LMj7jlZ3KZrn0pyGA+9E2hgP4g6sQ95HKFBedl5xzuzfsVDGkwYT\\/0Hy9l0LauDSlh\\/\\/gXl3Jy5rYUsy\\/IldQpyN34BLym73LTDdLTebPt2KpsDSvFBZZmnTxIzmZSnO7+c9G05KEs5yImfJq7gjnkdatpEEPpswfvyNiATfnw56yPb8OOMtiRuW8T+DBGytPnNeZvKRm769GyufVrp6xOgvcHfU9ZxI+o2DlMmsTHiM777ew\\/b\\/2zKk3XbuJpEDsaJjPKs71fiubl6Ej8dVlP1g3JEP3m+kyi78VvGf\\/c0ph8IQkGFzWf96NSoMf06VscAQFHjtm0RBz11uS\\/zDBTUDy\\/j5p8IGFG\\/xxCqus1k4PC5XLFqTdNKLwuLZjMXAOTAi2w\\/4UXG2aKOe9uX4FpuBLMGF+X0wm3ce16AuR5jU85DyeJk9b6n2HXah4TyXZg6pSNFvfbz15S5nH6+pUAqSqMB3ahFIE47zj3baSDjv3UUrZu3ZszOoJTrpnVlbvd2tOsxn6vP+rSImwfZ5LCJfdfD0cfe5cgmBzY6nsNXJyPLQIaHWWSCdoymVdOWjNj6bPewaVXq17KE2Cus\\/W0HD7QKsjqU0AxRx2Su79\\/BzQgTPh06g2H147iw\\/gembkz7ImMl7BTzxo5m9LxTpH437IvyUWJxXr8a56jKdBvWBmv\\/YyzZ4PrshqFMwJ5v6dGtB9\\/tDUQfe4bfe3aj+6Dl3NBqUYcG4h8QgjqLAVFVogLlzVLOWVKVpHw5s7f+OI8IYAj\\/TZpALh+\\/TJAW0CcQl6hHG+6Os3scxUoURVKi8Q9QqPflRH4Z8RG+tx6gAZTkINw9gvG\\/cY3A+GBuugcQfP0i9yJ8eBxiiVWRjJ2U\\/8HZLHOOSdV4ZUJuuhJVdwDtk7ew6HAQCYGuXA0oRZ36lalc1gopOQlNhj5Yg0ZrirlFIcrUa0wd00D8ImSUpDjidTpiPM9zLdSakjZpm212n0M8l5dPYUWqW1sq65rUMHDmiHMYke63eJR0H9crYYT7+RPhf5c7ETrQhOAXKmFmmhKWNjM3QR3oT7QekgMvcSWgNB98WJVaNUujvXGe6zEyaEPx8Y1DyfBwn0KMqyOrncPSdHKqwlZYxscQo4BkaoZJRAAB8c\\/S8QnD93EgyXISAY99CfbxIVwnE+vvT3hkIAFqGV2UP0HRT\\/HzT3gxMZUDD7BwpzHDl85mQB0Vvhd2s\\/eahpK2lkiSMeamyQQHPEULGJmZI8U+4vzmZewOKkHFEmWpWExBI+sIv+qKl3VNGlSpTPlixiQnZZx06u5uYeYm9zQDrcb3GtfkJtg38mX18nNE6uJ5dOsBkQ+vce1pHI9ueBDu48pFnwh8Hj\\/F0qoIKmSe+gdi0WgA380cSKX7t3j8PFFFxsjEBL0m0\\/AFfk6LcbyViAqQCtej\\/2+b2LXaHnOnOWx01wEKWq0ORWVOuaaNqRrqS2DqUVAyJe7udg7eTBdSU\\/RoNBJmFuYUrtiQRlV0+PvHvijnlPb0FB\\/X8zxMkNFH+fI40I\\/HgYnISuprBrqIO9z1C+eu20PiIm5y43EM7i5uhAU9JgArrM3S1ApKlrIh8NI5vOJlUBXni7F\\/sfSnrlQ0LE6tWjYZBi6NRouRuQVmVtX47OOyRPsHkeZqGWh5dGI3rqFy2nomR3PT5S7G1RpQvVptqhR5jMtFPzTIxLjf4lGiJ1dvRBF9y40HSZ44OwcR5utLdOGiWKbvCnReHFp6CK80sy4Vha0siYtWZwi6ZHa905QhMroSjelU\\/ibzx45j7j8aPhnRlwYZ5pka3M9cp2TbDtSytsA4\\/DIXPBNRlEQC\\/MMwNss4sVA0yWhMzLEwL0HtLxpgHeyb9q5wmjphhpnRU\\/wDklDQ8vTyJR5Y1+TDqtWpWcEYj4uXeKoHXcRt7viFcfvqA2IjbnLjsZrbF68RFuxDgFKEoqaZ9J1H5rH8fOpFpQEValUm6Ph+bqp1xPr7E2lijlk2MyMl4gzrt\\/hhWEQFKMQ9vshFT4XS1apRuWoZCsWpiU3fx2hC8AtJ5IlfAEly1mWFHInX1fuEpS4fvRaNZMCznjFV+cjEuLvzONETt1sxxLi78SDxPpecgwl77Iu6qA1p\\/oJiqnqZI0ZmaPwu4\\/E0+++nb59SkU\\/o36MsbuscuFOlF30\\/KoT0sjoi69DqJYys6vBFw0IE+UdmvviX4\\/G9eJnHsXe4cCkMXVZpZtHPZD9+ZSGrsstVO0xL73eRMwkN6fq5LYXNjbl3wYVwPWgj\\/AhSh+AX8LxdPSE2OIAIbc76tuzLUibi6mn8anSkVUVrzE0e4XwxEC3yS9uAPuoBZy89xqxCdapUqYKtWRwxsTJp6mSa\\/L4sPS2hHtfwjk6VM0WDVmuAoYEE6cbOXPXpWY0xmUlfn5CJcjvL2VuHWDDud67Un8GS79pgG+POka0neShJyNqcjRNvru\\/35Ox5Y5p2\\/RAbCzPkG+e59nxX20vHbzA0MSLK\\/QJXfaJIlgFFS0KkPx7O+1n5w0TW3YnD6+Y9YvS5HUfTUaI4t2YZLlEpA4hZtS78sHYXDlMqcmX2apxf9pRLNnOBlMINxmXbPzzWpy1nJf4BLjcSqFD3A6p+UJ1iYVc4dy\\/hWV+Zy3JGQX1hDn3sejDjeCaPm8lKSrA2Ppwn8SpMjUBJjCQyQSba1wNPbw+cT10nRFZIuraJvzYe4uTRvWz\\/5zFaWcvD09vYfeAQuzft52pUIokRV9jnuJtDB3aw+ZQPevQ8PraWNWuPcl8PSrwrm+ctx8lbh2RojU3RtPMYm+I2SOjw2r2Y1Vv3sOeEJ5bthzHSvjcdGpTAUJIwKFWNKoUy9L4oigKKluinEeiMTDBAJjoyOu05mxfCXFJQ1CnjG8ammCATfW0fjlt3sX3zQv6+oAZLK8z1KeNT1PlNrNzjxAmn3Ww\\/64sePQ+P\\/s26NUe4qwc51pUtC1bg5KVDUhWlaBZ\\/8ldVogMzFv3A8EH2jP9zLkPrZLsvMM+Jl3gK\\/0ny08tsX+NM07qf8KWFK4uGz+dinCU12o5hWsuiSKrCtB3cCpeFg+j2NAm9coa2zg6UUz1B92FHOpjuYXjXjZRoYc\\/QEqeY3t8J2zaT+L1WxiZjZGpEmKsLd9rbUre4KWgSsP60JTazLmH65xCKzJpA52U6ylezZtPgDqyyqE7n7xpnfJ7dsD6duu\\/lz+G9cDQpRq12o5hQxQDdjfUM++kIkaaVaGb\\/HV3KqEgdytfdzeTz1LT3uHjBkDqDzP79mWSCqVEMF+f245xZHXqNaoX7ogHYG9ag0QexrBrYAYdCCvGl+vPrsxWTzRc9aHJkLr07rkPSaShXzZpNg+1YhiXFrWRmfdmbasXVhFj34dcG6ctJQZOswcTENM2kVuvlgU\\/xcpQxAINKbelRYxo\\/d+9LpWLRhBT9gFKHR9HxmDGGciVqFd3IwG47kPSG1K5hyMLevViNBssPKuE3szvDq5jjczcGvaJA3Hn+6HueOcaWlKzyES1GzGdgs8JIKPyvezf2\\/GKP3S5jUBtjW6Uujdp9x7JOtcF9E3\\/8NZzOS0FOsKFaqQeM6bwV4\\/KtGD+wXMYJkYkpBv7XuejVBLvqVhjKSSSXaUpTaTY3yi+g96PfmNZ\\/NkGmn9O1aSSrB3ZHX6EjI\\/s94eC4QSRV7s73I8qgQqJmF3vq\\/fwnffpGkSwrXGt9FGtDLdGyAYXKN2P0r5lvHTezNCfG7Q5+8RWoaJxIePAj7vxzgCuaWgwrqwJUVOs+gua\\/LWFQjzCSinahV5oU9Gi1CkZGBulOzpJGXZtzZPEgei4zp1SDnoxuWwIp4hDfDVjCTcmGGi1HMLbwBaZ1d8JEScCiTiV8f+iGe2VzgsLKvbhmJGup1aEbpc9OousuSz7uO5JGV+cycGxhmnzzGx+lOTGZyPBoDMOcmNjlGEWkCJ7qVBgXrcAnfaZjn2GgVFG6WXdq\\/\\/Qr\\/XsaYFn+U4aOa5z2pWmKFo3OECMjMLBNXc8i8ZEqU56ZdDuYjIlNcUw3D8HugClScjla96iP5++96G1cix6jOnJ\\/wzC+VtVl4E9NyTCuKxo0OhNMTFJ9oETx4H4Etu2Ko0qzdDLM9HpbGZlSrO6zMqxiQVBgEep83oNZf3emabUipLtCz5jy2dBxBB04wbGQkrT9qi5Hvu9Kf1tTImNqMvzP6hkGesPq7fjS5lem9DmIcdEqfDF2fLrASKo6YVSHTj2t+HF8Jy5WMScwoAjVSnkztrMjOrMSFDNcSl+7TRgoMrU6dKfshW\\/ptvf5Nf6Lgd8U4rORv\\/Kxcfp8a3l8\\/RJRrSelbVeShPLkGD\\/0vIjOwJTmk76itApe9jc0dXddcTOvwnAjUCJO8MfkTegaNUCzYQg946z46KtpfGiURR\\/j9A2dThhjINfJtKz0jw8wz8GYmR\\/XevEzjdd9fK1LU1IFGKQtn6AgW1r3qIfHLz3o9bzerB\\/K14YN+GpWunqTql7miBxPXKIZJc0liMn8K0rEIaZm1j5JwLBOG6asGY3u+Bp+7LUe8womBITVyPS8Jcsv+GqIC7O\\/\\/ZKNMTL1JqT\\/ho5bSwfy3cFIzMo2pNvkHgSt\\/4quf4NOm1lZZt7PZDt+ZSWrsstVO0zLoHJ3JnTazWmnc1jW6ktXt00MbLcOnaKjUr1yXPiuC87lzYmKKU+topsY2H1njvo2ySi7slRRrM1oBkUf5egpE8p2HUjc3lF0PG6L8kRD0+dtIDXZn90zpnG8aGMqe85nUG8ttk1G8EN1wwxt9klEqvzqDWmWWXra22z7ZTfV13xMtec\\/S\\/TGM9CGGiVUgOmLsbPDicpIvhHUyHGfnvraZxV8y6I+rYPkaFta9mzB07MnubN1PJ22GGBmXZaanzSiXZ1LzPuyL6uVp4S+dJxI3\\/7zsO83qkf\\/yU3Y948Tl2w+ZXDzc8zv0RnkeCJfOn6rKN11GpNi1uI4fRCznsajNzDFwqok5SvXpP7nU1g3NpZtP\\/1Ivztl0XmH5aLM0zPC0lzL4zvexNSpSSFtFCE+93DZc56wal2pbELWfWwWc4E0VUirQWdohFHqcu7WHQspEaliZUwX96JdvAFWJSx5OKkzl6uZExJcKnflDBiYWmBuZk4hM8MMQVeDKu0Z2PEG6y+4sWXlFYxtqtNq9Dg6lVbwWjKLSfueIksqLMp9RstSAbhu2USETSQPokvwcYuyBLg6sXrLLVRhIZjVaEpT5RaXHFcTaCMTEFOE6g1sifG+yp7ThajccTStNafY+o8LSWbl+Ly\\/Pc1TT+qVWG65eaFDwiDhLns2B0DCk2c3uyRURuYUr9mK3uMHUDPDssKUT3ra0zhwHzePrWadqhBlPu7FCPv\\/papDep5cucwjnYRJ2XKUUIFh3Ta0r3yBPY9dcHTwwlDRULpyRWwC3djuoMfAoiQVrMM4sXIdXjbRPIgsQvUGlYnxvsSOEynnNEBziq1nnEkyK8enve1paZ1VUExF4ZrtGFQzi4\\/fAkmtfvU3lDg7O2NnZ5fl525ubtSqVSvLzwUh3ynxuC0eyVqb31k1uOKrbUnSBHLeYRVbz7jjF6VBZVYU28r1adbrK\\/o3LkOGefvbFn+CH+zd6bZ9Kp886\\/3k4D1MnuLLQMdv+fgtBU6199Yw7I+n9Jk1muYVC5Ec4MrGOcsJ6bKcP7uUeje3gykJPDz+N2t3XeBukBqdgQXWZarRsE0\\/vu75EcUyX3G+LEGi\\/vmZUccasmJuF4rlpFC0QZxftwzH8w+Jlo0pWqoytT9qQvvOraljnXpkTEn7m1ONWDnbDqtn45I2YD\\/fT7xIkxXz6W6b\\/1dBib7MgrGrKDR9HaPyJKovE\\/bPb4zZWp45a7+mSq6vSQ4pkRz\\/cRRHKn\\/H973rUsIgCo8jS5lzpDQ\\/rB1HA7NMfyn31\\/steDt1Iomzs\\/rh3HoHM7949tIPdHj+PYzfNN+yacwHr3SHRXdzMQOWF2F2bq617hYb\\/npIiRLeaFtPS\\/PeFjloJ+Mn3aHtvB\\/oVE4h5PZJHBY78rTjYhb1rpBFUCknclsvdQQdnsH4Y\\/VZtLwf5d9WXdF44zD2d5ImrGf0S95tlJ28rVMvKbtXaodvSR6VJQDa8\\/zcdT\\/1Ny2ke05fQK3E4bx8DZEVjfAy68\\/k1sX+HXf1nqwZ8jvRX\\/\\/FxGbFSPZz4\\/DaxexTfc2qX9tR4jUuWUEbY95Xctg1Ni9fx3GPcLSGlpSsVIsGn7Wlc\\/sPsX2diaqi5vqSsSxgEpsmfpj\\/c95MyElRBIdEIZsXp1RJy+zfI\\/RKx1ATERVFROB9Lh\\/Zzs7zPiRafsrk1XNzHph9GV0CUZFRRD315c75fWzZd50w4w8YtmQhA6ubZP\\/7BcT9+\\/dp2LBhtt87duwYTZo0yfJzsQNDeD\\/JGtRPHnLt0BpWuX3ItysqvPoC2rgszUb+QbOReZnBPGRckhKGHlxw8aX6pyXQB11h2\\/xdKN3mZrId\\/V\\/6x3tZ5GpGhZBoPpjYn0w2n+SKUW17fh60muW\\/DWVxcCJmpWrzRc\\/fmdk5N8GLeC6tWk9UBSMemvZhfHMdpxYdwnrcsEzu8L4FkjlV7SYwz27CayYkkxQdxAOXXazYEEKbX9vkfDFrVIZmo\\/+k2eisvqAnKSoYz0u7WOnwlLa\\/tsBK0RL31Ic7zkfYvNUFi\\/5z6ZCvE0sFbWwIXtdOsn3DYaJazmJu7debYsjaeCID73P52DYcTybR\\/tcpVH5TwQsAyZq2U6YStuxvJvd5SKRkTeWG7Zkwb3Ami6bXuN65oLvjyGKf5kzukoMX4Mpa4sLeZp0wpnbDqqzatwO3Kj34wFpL8LXtLDldgr6La2OYvq23tM7RM7YKCookIWXz5fT925DpDTL9nqpMFyYO8mXhtD6sjjfCumJ9mg9eyKSWrxa8yG29lLXxRPjdxcVpM5vPG9FzTvc8DV5kVUcUbTxhvjc5vmEFJ8oMY1lOBwDdbRwXP6JY8Ufomo+jpalfntWpHJVdrtrhK0h9fi0m0yUHF+OVyxIg3pXV65PoM67Fi6Dzs1RRFAlVdhU9fX7HTcn8ewY16PdtJxYsGUePecmYlqjGx63GsbR341cLXrz1\\/kTIjqr4\\/7D\\/5X\\/Y50lqCvqkaIK8rnNm5yYOBDVk6sL6BTJ4AaAytaJsJas3eASZkIPTGLzCAy0gGRWlSuNBDB45iOZ5EbwA9N6OjP1mGwF6kAwKUbZhT74fPYR2Vd6d4EVeEjswhPeO3vNvhk46QKxNeWp+0o6+g7pQ1+q\\/PLDKhF9ex7xVR7kVoEayqkGLgWP5pludTLfoCW+Z9irz+87inFSCSh98TqcBA2hbrVDevBDpedqqklSp24TOA\\/vRqjKc+Xkwax4Wp2rDZrTr1IGm1Yrk4w4YmeC905iwJ5KyHzTBrnsXWtS2eb07JNqrLBw8F7dClajXpC2dOrWgjs3bf0YzU2\\/yer+yeE7nR52Qw7i2eTnrj9\\/AJ0pF8Rpf0Hv0KDrXfPXy0N5cxIAVVvy59isq5+IEdO4O\\/PW4FdNy9deOcpu5XNZL7VUW2c\\/DrVBlGjSzo0vHplQv+iajcAAywXsmMXSDH1Zla\\/Jxm14M6taQ4rluPnlcpwpym85SXpVlJrTnmNXlIB9tXkjXYrloLfEuLFudyIDJrclyd\\/hry6f+RHhr9J7rGf3jaXRla\\/NZ6050bvMhtqb5nav8lRx6n7shWsyLFKNUGVuKmuRtjVfiA\\/HwikAqZEXJMmUoZv6mx4I3I692YIgAhiAIgiAIgiAIgiAIb0xeBTBEQFQQBEEQBEEQBEEQhAJPBDAEQRAEQRAEQRAEQSjwRABDEARBEARBEARBEIQCTwQwBEEQBEEQBEEQBEEo8EQAQxAEQRAEQRAEQRCEAk8EMARBEARBEARBEARBKPBEAEMQBEEQBEEQBEEQhAJPBDAEQRAEQRAEQXh\\/yWoee\\/gRrwBJQXj5xaHkd54EQciUYX5nQBAEQRAEQRAEIX8oqK86cc5PR\\/zJKDArxkede1I9v7MlCEKmRAAjD2mjvPHTVKFqSbGxRXg\\/6WKCCJNKU6qwlN9ZEQRBeMtk4oJC0JYqg5WYBrxjxLV7v0kUbtSPIY3yOx\\/vCE0EQVHmlC5phpjt5YBOjd+dQEzq1cbWIL8z898guunXJhPn68L2eeP56pslXArXv1ZqursrGDh2J8FyHmUPQInBaWoP5l7R5mGiBZTWhT+6\\/cDJ+PzOyPtES8S902ycPYaBwxfgEvEubrqU8d86Gvs1nrxeC37fFJRyy+d8\\/Ef7naRQTzxDk1L+o\\/dm\\/dAROPpkMjgVlDEmv\\/Khj+Hhhe3MnzSIr2YdJygvx+9XleuyyMs2VFD6hRwoiNfuPZbbOXCez5lz25drL\\/Br51mc077C7+ZVHt4ahaTQWzitmcXwAWP5+1bsG37E5h3qRzKjjeLh5UOsnzsF++7dGTx1O\\/de0h1rz8+iTbPmdF9wnfdgtfbaxA6M16Cob7Nt7hJOxlajVbcxLJ9UAyuj\\/M5V\\/tPeXMf8gPZM6\\/J\\/9s46oKrzfeCfe2kUA1RM7G7dnG7GbDFQpqIoiLOdnVizZsx22FMxZmJgd0vYgujEoLs7773n\\/P5AN+ISKir7\\/s7nT+7hvPU8z\\/s8zxunspQhKwBizHU2HNBhzMS2FC\\/UVLaSvw+s4Xnr2VjU+jwpX2XAZdYt28UjsRHdzcdiN6MJ5XQ+9m0CoRfWcLrMNMa20i7MakpISHwEGnFObNj2nIXrB1Dpa1fmY1G6Yb\\/Gly62\\/TAp9AlJIMJ5G8s23SCuRif6DV3NhJaV0JOWJP8DFOGxU73h6GpXilULIqbJLKwbSq66ROEghJ5ntaNIg\\/hAjKeO47uC+muprzn5+0oOehbjm579mfnnr9QtLcmlehR4Oy5h4aFUz3IAACAASURBVE5nApLklKzekg6D5jCjS1sa6X7tuv3v8P9C+oSIq2w8VYoJo7\\/lo2OrHIjE3z3AwdS+\\/PWHGUZFYdIrImg1H8Xc5l+7Fv8dZKU7M33S53izJg2s5tLgc7waABV+1xx4YDKF\\/fPbUuyT3yenfE9bxhZCzST+RYjwxD25Ek2rGnz9hKLgg+N6V+pNHUL9\\/xezz38brTrm9Cs2m+PuvZnS5GvX5iPRbMaIuc0+z7uFKJyOXUDHej\\/2vYy+vn5JFJyiPHYatRk0t\\/bXroXE\\/yDy8r2YM\\/7D\\/0\\/x8jxH3n7D4n0TaFx4gdR\\/AJGkh5sYt8SVhrO3Ytu+dP5HZoRgXC664J8IJoM2smtCY\\/438xYCacnpaOjrfpVkQpGy2Z8LedmuTC\\/U5AWAjOINmlH17wNsuRXBh+9eUxB43Y5Zo4dhbTOOebsfElOoe7GUuNmv4uwX3g8pxrtzcNEYhlrPYNej2M9+g7OY8IxdE4az7Kb6MRATPdg9cSSrnGLyqItA6IVVbD17hlXb7pFa2HXMqw5iNNfW2XH2zHrs7n7Mdrzc66588RcrD59j\\/8qjvCnI\\/jshjIurtnM\\/raBla2DyYw+qPD3IsZcpH1zzbIUT4bID25GWWP6ylutByk98X\\/6keh1jls1sTvurLyvV6zizh8\\/nQl57U8VEnDat48xZO9Zei\\/wIO5AVpfseVjr6IyASe3Upgy2GMHzcFOau2MKhy08JSv6IElJe8tfkIYxbewnv5A+XMNXrI6w6eIFDq47w6p0cpUb44h\\/zEZsc5dUxn1k4yYu8x09J8NWljJhyGK+8qlnI4\\/exCEFnWWXvhrqW5CenhVyTrPZEZkSnQc3xcLhOhCAiiv+xTH3qaxxXTMRqkA1zD3qQUCDxz192\\/tFTuRHf92yOr8MBnsR\\/uaNz+c17\\/7MUpr4W2tgVvv+gCLjK+qk2DLaaxvZ7UZ8+xqo3OGSy3wVDSfCVxdhM3I\\/nRzaqQHNovu\\/4TPZP9YojqxwK5hsVMQrm16rj4\\/0srXrd6KZ3i\\/0X\\/P9Txxv+9ak+Xk9VKfEkJicSl6wsWH\\/Lq9DNoh1l5SoCbzjiGqlO\\/pWkxMeTovw6R67FuJts2HiGMxvtuJPF\\/okokuNJTM1HZ5V+nJk3iJ6mPTAbs53HBZtcC5X\\/WAIj476Jk6vH0HuaIxECgIL7G4Yy0NKGMZNms9RuP+fv+xL\\/ziiJCe7sn2GBaS8rFp7yImdsJhD3wpE1U6z4yXwwo+bs4n50wYytRvVBzB9fjUdrl3D4TYGjvgxUbzm315UyIzazb8dsOutFEPoRwUXuaNJshC19KmUf4vwCI5HEF0dY8PNALEYt4pjnhwSmAsEXdnBCYcosayOu2x3FUwWgIODKWiYOHcL4dTcJzWvCUP6N\\/TgLBlmPZMKMRayzd8TpdUyuBlNm0IQRc0wJ\\/dOeB8lqfi\\/emJ9tuxGwYx9u7yyWwucMi3\\/uS7fOplhO38WjeBnle9rySx8zbMe3VpMpLUj903h1eBr9e\\/+EzazNXPVJ\\/sfQqasDCKQnJZAqGNJlxiR6dB7N6DYGyJQe7J6ylju5nX1UROBx2Z45gway4amC97sWstRdmUpCkgKNhtbMtejCT5PNqakhEHlpBbMPvck4Sygm4et8mqOOd\\/F9L3dyY0xt89hSmKNs0Kren4VTTLiydB231BrpAiKEcevQeYQeC5jd8i12ezImGDHOnf3zhmNpM5dDL5LynDyEgOPMsrDAasR4pi1YxZ\\/HbvIiPC3X\\/9GtOYA5lpoc2nGdaDUP6dbsj+1gkQO7bpNh3wVCb6xlXP\\/udO4+gF823CFMLE7bSTMw6zOZmV3K5GpQMweoqaGevAxOUVsvzaY\\/M9fcBDkySrSbypYt61g8xZputZO4uXEawxacI\\/crRhT4n1\\/KcAsrpm+6TUjGQJPo5U5IxW8p92IDE2fY8ywxfzsjhJzh19lH8RFAo85gbIf2ZIjtYOpqZPRD1I11LD8bmM2xzse2CJG4bP4F8x5mjFx1jSB1epQexN1dCxhl0Y8B1hP5\\/aw6m51B3uOnScUuMxhT8Txbz4e+q+fHj18WFP5cWD6CgYPHs+yEZ8Yn9z4ReaU+2I5ohiYiic52zNj+iPfmLGc7BeJe3eTk0TM8DE7\\/gFIUPNm1ivOhAohx+DzzISaHyua0JzqN+tMz\\/TSOL6OITSxOya95Qa\\/iIWsGzOFiAQNOxbNT7Pesyfglluid2sxp\\/4LYKHWyk+2Jf\\/RUjnHXOcz77hmrlp0l8FNjLFUINzdMxHKgFVPs7hCeS3Xzm\\/fUkfLGkaVjLLGatoMHhbpaIhL3ZDfTLAcwbNZW7uY5wReUXGRVllNfheiH7JppzUDL8fx+MffgShX7iptHlmBtuohbaUChjZ2aOVgVwq2Nk7EaMobFx17+ayPEZDwvn+B+qACk8vqKA85BQja5VuF18QCuhpYsHmeCyx+Hef6pcqVRG4t\\/7HdB0aRi15mMq3KJzaez2\\/qCkXMO\\/Zh35D1PfzQadRlsa0FtDRAiLrHC9iCeXygyV73ayYgJhwj4SJdJvU+ZCTEZr8ubmG0zAHOL4UzfcI1ABbn6WTlRE2vpNeTnxcPRPLyQ7Y9zX2xTJkYRlaQEknA\\/cYJ7905w3O2d7yaE4X7rWa527X3ZocenYL31hdqE\\/oeS2Var09P87a2MEu3nc+zySZb3KFvAoFlOuc6zmN+\\/OhqRN1i\\/+lxWfyftNYem\\/ETPPn0w7WPDiitBn+GODyUvDm\\/kfC5CJivZkWlTzTCbOpn27+d0MZGnO8Zg1rMPvUzNGGPnTFQuY6X0PMchlzAUokDiqxMcd\\/7c96HkpMgnMMS4Bxw5\\/RIFAtF31jBlpRNC\\/QZUjAojQgTQosXoTWzdsIJ5EwfRXOnEtrkTWHI2GAFIvn8MB3Ew21f\\/SPChM\\/ytBBAIOreClef9Cby6nInLXChjuZpDx3cyqswN9l8JUWOsU3Babsnim5m\\/C61B5d5zmNE6lD2L7HCJEQEFzsv68usNNWZBTMH\\/8X3exougUYvew78jcIMNNgsvIn7fifrFcnMMBfwOjGf0nrcZQq70YLPVVE7maQUEgi+tY\\/2l4GxteR8YrWeZ7Tj61o7m0vqZTFj7boIRAji9+Sz6Q5Yx94cI9h9w5kPuEUpLTUfHqAo1a1emeHw0cQKQ5MTuLW9pNmUyTV9tZt\\/DrCGJ8tkmrKa\\/M5KadRi0ciubVi1i6rC2FHPfx8KJMzmQx9KBvFJb2hq68+CtenMnr\\/QDPxg8xOl1xu+qGB9eRVTDYtT3CN5vCUsWQfWSXePncy5CTZ\\/mU38AFB6cdVRisW0vy\\/rJODlvFdczzbbZ64AQxflfx7DDQwlCBGfnWbPxkQLEFKICI0lSqTEFijccmjmbvwIq0KiGQHjYuyA4W90VHtsYvfAi0SIo3LYwYtZJQgRQJIQSEpuOiEDEhd+Y+sc13K\\/9wfTVt4gVc76nQGUjx7DdNOZ3eMvWv9xycR7TiXjjSXDmBJ3ChzOLhmE+cAp7niUhysvyXe\\/WJJxeycargaSkpKBCwMfRjnM6A5ndXxPHreeyXdSVVS\\/kFXuxYOsW1iyeyahuFfA5vpzJ47fyOFenRIbhD+2p\\/uw+L9Q+I8Pw+3ZUeezEMwWASIL\\/S\\/xL92J8j+L4vw4kCRACjzNrykHU3W34nn8DVJAHX2T5Hzcydlxl0WWR+KuLGbnFHSUg1y2BUdkKVKtuSOzjB0RU68v00e0pnYuZEMIu8MdBFT8tnEHTt5vYcScBEZG4kAgM21rxU7MyVNX3wM7eLRenRYnPpcPcDRdQBXjyUrM05dTNEGIcLzyCMChlkG0rZd62RQi\\/xZEbZZmwax713Y5wxfddhymesHPGLp7EPGPPjGnsjWrDrJ3HOfx7e0LsHXjyseMnK0aLdg3wdn5EnAgfO34pzx059o\\/DJhB5aTO7o7syf0E3Ug5twDGHgyASe342Fu8u4hL8DzJ+5G61K31CpAc3HvjzbxpChn7tyqhu3MnkTGdtp+B7mDkzd+Psdo7lM7bwJDVnmerRosUoW3qVl4OYhtuehRx6kWGPstQxux2QV6DHwNo4r9nCA6MWNMtNADO3K482iwkBvPCJyeSwicQ82MbEgebYLL9MiAAIEThOt+QPtwz76DjVnN\\/vKQABIYdpFIh4eIIzz+JyOFCa9bpiZuzO1hUHcEtIITlFvYv1r5\\/xjhyyk3lez6qnyIrTbMwifkrey867ieqdOCEGnxf+WXaACKE3WD2qP\\/3HvPcdIMV1D9t8vmH2b9aUdbHnzNsPnfdy6Qshgktb9xHfeTYjKtxls8MHXIqX\\/parh27jn9s\\/KD34a+1tKo39jfHVnrBut2tO+5LFzuXhI\\/1DHrKaRV+V\\/H34D1yr\\/sKySfXx3OWAuxoFEILOs3DqFjz0G1LPKIrQ98n2AoxdgeQ1m86kuNqz1as5Mxb0RnnEjlPvbYSYyN8XjnA3UAVCJI8d93Pd671ci+\\/K16Bahz7U8\\/uLZX+6EJGSTGpekYEYw7nZlmx4ZyjV6p4Yh\\/O2ZZzIQ57Uyo6sON+0b0zQw6fv9OBDyTmHqrVTecpYfvO0GsQEnp87zr0wNUZdFczja08JzfST3LAmxpE3cPEr5DBScYtFvZdwRwGk3mRhr7lcTgREAQFZ1vkzPz3LRg6fUozl9sYFHPUM557dZOaekWO6ZB\\/H98+h\\/vNdnHihBLV+VnZyi7VAo1JP5k6th\\/PW43ipq6cYw+XfJrHfUwCK0bR\\/f1q37s+AZsUy2pryEseNh3n6bl1U8XQDg2ecyfBVn2zAYuJRggQQBaEAXzYRSQ7x5E1EpiS+mMyLgzOx7GfJ3ONepGe31Tn0tKD2VkTMOfH801+hJybTpUNHrHa8\\/DfpIitOi3ELGV5fi\\/j721h51OudzAuEX9rBXncFTQYPp42uP1d2HM1it\\/4pS4zl\\/KzOtP9xCNve2T\\/ls80M+rE9XeZeIjHP\\/tGkoeVUelWRQ+pj7Kx70XPgIq68t30KV1aZd6d7\\/7U8eFe24HOCzUffoPeDDYObqHjtuIsz3ur7RF6uKibvLgySyY0xqfLlv0ZTxBMYCl4d3YFTsgEapON+\\/RHG3XpS37AY2pH3uOOZEURp6ekjS\\/Di9l+bOBZUjmrlKlOtjEi6ADom1SgX6MKpc4+JqVKDCnIQU\\/1xuX6X6\\/vmMcteidW6lQxrooXvnWOcfJCGcfnsjjkgxBESrkOFCtkGSW7I9z1aUyLyKmuWOfA6Nhi\\/UBl6umpS3WkP2bvyMsFaMkCLyp2nsunIQZZ\\/680fdpdQFze+KwTjCkYEutzidZKAMsafoEQd9HTzEhc5pTRjuPPEB5VMG33dNIIDwlEAcl19dFVR\\/H15F1suJlO5almqVy1BmkIkLdCVBwEVaNi0BjUql0aWlkp6dr0VE7j9+zjsHmV3QORUM7WmlfdGxi06T7hRecrIQRSUKFQytEo3pF3L4gT5R2dJqsiNK2L45i63A9MQ0URPX4Nkf1ccNu3mSaWf2XRkBz+rWToQUxNJUiqJ87zNw1BDjI3UibOKOM87PAoI5dEdD+IF0GnQn6FNfTmw\\/Q4le1vTvpwcVYwv3iFK5No5+zS\\/+meQTrpCF\\/1ixanU5Aca6gbi90\\/qMmcdlFHP8PCL4NmDVyREPeWJdzzP7j4kItiHALEkpdSMrcrvLteTW9L3+\\/KU0Nfm7zvORKrIqHugH96BKQhCEl5ur4h++5CH4Yl4PXlBpI8rd32i8PEOx6B0SeQIhPsHUqz1UGb9akX1l254K8mzD3Ir+10HoaWjgyo9F+8i7QE75h\\/DS\\/7ve8WE19x\\/XgJT69rc37gbtyQNTHrYsmHDLDoba1CjQR30EFEolIhyfaq0\\/4Faob4EZrGlWfUCDR30tdMJdTvD1m030DH\\/nYOHp\\/GNmot105ISUaiS8L3jio+hMWXVrUwJSfjevYd3ggd3XCJQIqdaLxs6JDiy6YyCTjammMgFEv29CEiXqT0DqPQ8ylL7R2Tex6RVqx6VPM5y5k0qihh\\/gmLD8fNPRhBTCfD2JdjHh0glIKQS9eo6W2fO5mTJ8Wy1m0av+qVyNdoKH098S9aice061Cyn5NHFK3jHpFGmXi0iTi5gjVNleo3vjrH7I9T5aWLUdXYf8EOzpBwNk7pUfeXInlvexCsABFKj\\/Xh2x5Ht8yezI7oPw7uUQQbo6esQH+hPrCpv2yIvWY2qOm+5deoKz5UmVC8rAwRiHt\\/kptsZ1k1axv2mC\\/hjVlfKx7lz7uAV\\/IwqUFZNgwsyfmJqMPdcXhLv6cSdoDTEjxg\\/hEDO\\/nmGSN0Mu6+KecVNF2\\/0qtahZs2alNdLJC5BAPTQ0wrHPyAVUUwhwD+MhOAAohQCCf7+ROvoq7kcUCTOdT\\/bnSKyzCnyEqUxSIojTlTfTlWIP8EVfmTU3FmYG7zAPVAFYgoB\\/hFo66lxIoQobm1ezXn\\/LB47dWqL3HK8Q6Qqo46R0YEExAtZ7YAihaTUJGLS5RCpSYcxuVyEmWWOyavNAv6nV7DJKS5TPQVCnroS03goPdIOsOFsEGlRHjz3i+T547ckRj3liXcc7s6PiQjyJoDSGGZ5sRy9qEfsvfASZba5TlaiOTYr7FgxrCG6+vVoWEWdomf2M96NTHbZSQ\\/BLySFML8AUoVsegogyNHWEVEq1E\\/iyucH+HWfe5YVxXTfhzwU2mLT2pftm28RrYzDzdUD7VpNqVOjKsa6aaSoiVzznvcy9UXWGqBUCMh1yvFdu0Yk+QcUfAu1hgKvy8dwDVXXtlQCH97CLbocterXoLZJKRRx8aSLWe2CMrOdSw\\/J3UcqgKwm+nvhF+CFb5yAmPQK5yfJVG3UgBo1KlA8PUVNuwSiHlzDr24vOlczRF\\/HC6e7gf8G0HmOXcHkNT3LHBzLU+fnaNduRp3aDahZ0hvnu36kpUTi8\\/AMN15Hcu\\/8ZZ49vsRdn2QennLgwb0HeMa+5MY5N3yjUtCp259FdmuY2Kok2nUaUiOvI3ey4pQvl86jW0+IFXLRPZk+2oluPHid1y7GzLKjICkxDSE1GFdnTzTKlVNrv2JfXOPa3zkTh\\/92VbY5NDc7lYuMFWieVtsnuiQ+P8zppzmX34SA6+w88pQsGxFlJSlt8N6W54EQzesHL4nIPH+qFKTLNN7ZjkzzAAJx7u54p3jy2C2OOPfHvEp5iYtTMBHevsSXMiLLZrY89Sw7OX1KRdh9btx2wWHZNNb7d2fl+vG0KRHGfcfD3A6SgahARFONn5Wd3GMtEEFbBy1lei67IzTQ0UrlpbMzryMzkiOiKpXYIE\\/und\\/N4kkbcUn2we1xBAohCW+310R7PeZJZCJeT54T5XUPZ98ovL3DKVGmdN4BqhjLjQ3LuBiS6Skxkueu\\/lQZOJBS59Zx5HV8Flud1VcumL0Fkfg7Kxlk2p8Fl9Qd2RNJiI1HJYrEuF\\/nxjNfQiMjCPF7jcfTV4SlCSAm4bH7V36zP8Gp4\\/asP\\/CENFkpSumlkQ6IaWkZO021ddFBIPbhSQ6cusRFx\\/1cfKkCMQznE0c5eeYkR064EiHKkGvpqPFZROJcd\\/HrvF+zXm2g25BmtQSSwm6xdvoS7E9d4OQ+Rx7EpJASdZ+T+49x5vRJtm48gZdSTqkSOqRmVIzUNPXaLS\\/XkwUb5jHa2obJv69iZMMv\\/wWLon2NmhDI\\/fuhlBtujBwt2oycRNCpy1wMMabb8Macm9OXIeV1iQiQU75mY1p3n8Wm3g3AfR\\/L14ymjx2oItLRK1uNN\\/4K8LbDsut+ysoSoGkvfmr0jMt377BySBdWaRtgXLMFHcesxapDiZxOoNyIBg1Elu49QvMJfWlZRR9VbAAezpc4fjqAXivtqHRlORP7bkWsas26ZmoGU6M4BpqBPP87ktYtDBHiwwjwvM\\/pqz6Ubz2Kkrlqq0B0ZCyaEeeZanaRkvI0DHrPp7VBXgkMgaSEJPSKFUOGLt+a9+P4Eht6Xq6BzCeA4pXq0KxtbxZv6kL1JGe2Lvsd66MylOnpVKltyL5hPdlWrA59Zv1AqRzFKEmOC8fz0UO8a35LtdK6GVs5FcnECRXp8FNvhDM3iDc1pYYGyAzaMXyEMytm\\/sTeOIEmU7KKnRgTSYzMh4Mje+JQXEaswpCqDb7hx1EbmNW6Arl9j0L5fDejFp4jWrc6HWxmYVZJTua0vuLOUsyW3EYoWYMfLKfT1GMlgwZoIaQpqdV+BJv+LI2r\\/WqsTBPRFlIx6DmPNmq2R+dXfwA0m9Lb\\/AS\\/jx7Ifp0y1O8+jik1NXKtgyIhlfo9zal8Zyb9ThjwzeCxtH6wBqtfitNm7FK+UdNojRrmTOl9jGvnb2FQfzB9H+\\/DqucJjAlDq0F1fOf2xVkPEgx+oG\\/7aLZbmaOq2ouxlmGcnmRNag1z5oyphBwZ9cxsaLL4dwYNjiFNEHnY5QKltbQx6qW+D3ItW3iLv1KD4iYdGL+0BWpNmEwHXd5yz8WXZu2rYiBXkUptfmwZzU6vb1jUeQ+LLTsTES+goWdEzXajsO1fFTlQ23wMP\\/72B9b9I0gtZcbALC\\/OrhfxJJasTL3m7Riwcis\\/VtPPJSOswufYDGYf8kFWsRUWMyypqwEB\\/0oWbnZWzDodjV7llvSb3p+g3cPpu0uOkFKB1v3Xsqv2Sw7sGEWf5VooFHLaTbUmx2ktRGI9H\\/A6uX6WfpHJZMiU3hyZNJCzApRqVB2\\/X80ZXUOfoIgq1C+1F6t+R5ClJVK6elPa9lyEnVljSudhHyJu\\/s6cI4k0Kf43080PkCIvQQnN7YyyOoZGWgJl69bDKNGHPbN8KN9rHpXVOILK56481q\\/JaC2Ql+\\/D\\/AUpbLf\\/FavfI0gV5OiUKk+12o1o8cNMtnVtSjltADlG7frT9twqLHrtQqZMoERutiU5EnkJY6q\\/CkGp8OK3vt34q6Eefr5l6TSgI+E3r+BxcDK9D2igZ1SFBm16sej3n8j5AZ18xk\\/wYf+4sezz0cK4cQ8mj1ByfnxfLtXQxzewzAeMH4gxj7n32ohOFTVA8OfYAlsulfqBGp5rsbZQUL7tGObV0QSthvQeUJr5k3tzt6Y+YVEm1C+1Dyvzo6DSpMO04VRUIx\\/paeno6OhmkVPF6xf4lK1CJQ0VPodytlPWYiDDL\\/3GbPMDxCsExBGdOVvTgKSk+oz+vU7OSV3w56lzJHWsskQ0yGQi8S6rGDLqIISmUb+uJustBrKNf22h6s0RJk92IK5aOwav2chPjYrlolOZ55jqyAJTaKe2zaClq0WEqzMePcrTuKwupCdj+F0njBa5oPv7CEoumkLPzSINevaj4s1p9HV4bx9XYTWxBG1\\/+Y0WWQxNRqJTU0szWz1qIHvzmnSZFgaVmmFmO4c26m4azuxnqJUdM45qC6SUbUyF87\\/Q+7I2mkL1f\\/SUxFCUGnpU+NaGhe3U+A6ATEcXDf9H3H3dFtM6pdEUUkmr1J72shU8MVmHhddv2A5ZTqBGDUz4lX5nwbj1KJbWyznXqJ331PZFJuTl6T5qAI\\/WjsUsKBGN9t9R4NMEooJ0pSZaaox7kusfTF0bRIv22pz+ZQB79RowaGZbDGRyir+3C30dqaIIRKNBdfwW9GOwnoz0SkNYqs5H+gBZXWcxkG1iAmK1GuhuHEjP9NI0GfIrzXN0mZwyXcdjHXuBC1d1qNzXisQT4+h1qQKirxeKfMYuP3k1WrmIEVvD0PlnDhaJ162ZMY6n09AxKovuXyPodaMGsoAEWgyZSNene5i1UIc2o2fT4vZOFq4qTmvzH4k7NYdRZzQRQpMQNIph3KArU+d2p0xerp6YQlS0gqSXS+l\\/wwCZWnujIDFRpFhx7TxWSTPJjhDOlaUT2e6moExTM2bO\\/lbN0dp03lz6k52UpF2D7HfM5TKH7gSlomFOO6VWxtTb+YKhQqEQ0dJSs\\/CVnoZCWx+dzB2R8oq\\/A4ypVyHvAlTep1i9R5tfv6n\\/by+8fomvYUWM5YBG1nkgKKg8Xfo34cWS\\/gzUrk\\/\\/cb14uXskP2s2Y\\/ii9lkTGHnoWWZy9ymTqdvdglZeV7j+ZAsju29FU9+Iqo3a0LZrBW7ONeOevkBItCqHn5UVXTWxlhnmchWxcSJapWpjOm0ZddR1lawEnabOJ\\/zPfSwduZKQeCUybX1KGVeheu1GfDfGjvHaV\\/htqRXWG1XEF\\/+Bvu2i2Twkw1cdYxnGqYnWpNUewPxfKiDP81CCBrraKbx0eURw7VZU1ANFih5NO9XC4UIcQyc0ZN38wRyU1aRBqb1YD7xG5WQ\\/5Or0NA97C6ChWwx9PX2K62mq0R8NanQbSLsrG7n93IFlEx2y9YkmJaq1oJamN84Hj\\/JKjEZhUpMqigDu7j2CZqladB49kOZaoNm4Kz1q3OG4tzN7t0ZgonpDcMkm\\/Ngmlgc3\\/sT+TTES\\/ZJAtzKduzRTc6+jisAn17nrFEHr9rb\\/jq2YSmKSEmSaaMc\\/5qijP0pfP\\/Tqtqe96IbL\\/u0EGkGEZjVqVhIJuLQTH50yNOg9ArO6uaUJ5JSo1x3renkM0WdGFh\\/\\/8bcXOTk5YWpqmuvvjx8\\/pn79+rn+\\/p8jPQinA39y8Ko7frFKtEtVptH33fnJojctjAuSfRKJf36CzdtP4RaSiqxYGUzqNOG7Tr3p2cYE\\/VxmFjH2HusmbqP43F2MK2CWS0x0Y+ukFSSM2cMctV7bp6EMf8CRXYe4+uQtYfFpqNBAW88Awwom1KjbjHamvelYr3RWJyn9DXsmLiN1ym7Gv\\/8smCqMy0smc6b+GjZZmhTtLUHq6v+fRiTmxmLGXWzJllVmlPlsnS8S53GC7btO4\\/o6jCRBC4MyVaj3XU+shvehQb5n6jPq+cvV1mxdYfrPEYqP0Ysvi0CE40ymBg5n36Qm\\/zhsqQ\\/WMMy+Imu3Ds33s45izHU2HEymVqovRuMn8YM6VRbjOG9ryX1TR5Z2\\/H91lPi6tQAAIABJREFUPfiXRXGbxX0dabpvPebqtoWoQ0zEafMOoqtp8VpvCNOz3bOh+HsHo5aHM2jReH6sVpy0AFf2rtxMiNlmfjerkKc9FIIcmTntOf32\\/Er7vEy84gkbrI5Qe\\/sqer9XHiGYY1Mm8XrwAeb\\/kHMN7rOSHsjtPds4eN0dv5h05HqlKF+jKR0GDmfID5VyTVjnSqone6YuwG+QPYs6qg9CvzpiMm8v7eRPhzs8D4pHqVEMw0q1adnVkp8HtKBMYX3lOr++EJN4vHEc9uVXsMmySgHmW4GIG78x4aAJK\\/\\/8mZoaWX\\/z2TcG2+gJHJzWXH3yWg2qtw6sdtanenA0jWcNI8tUWtRkFQpfXgsVkeQXu5j6WzQ\\/77ZVn6ADUt8cYOacF\\/T6cwWmuX0y76vpUV4y9nEoAhyZM\\/Uubbesxbx8NilPvseqn3eiPWEBw1tVQjfBi+s7lvMXY9gxv72aBbtMNQ06yuRpHnRbPY\\/eVURCnl1hz8b9hPfayAaLqgVPCuZ8c6H3wf8HVBEPOLhtHxcfeRGZCjoGZanWqC39bKzpXCO3BazPVZkkwv39CY1NIk0hItPQRFuvOKXKVaJyGf1Ci20Uj\\/9krX9FjF7L6DOrFxWyvFjA78A4fv7zNfpNLJk9uQ919eN5dXMfm\\/e4EF6iE4v2LqRjXkL+BXj58iUtW7bM97mLFy\\/Stm3bXH\\/\\/X4jCvhzalWg7YgltR+T+iMr7BBtc9agaEkujHJ8KlFGi0QDmbR5QgMJEFAkhvH54hcP2Z4nptIhVDd65CEI4VzacwXDSqKwr9aKK1LhQ3j65zrG9J\\/FpNJ113+Xm2YpE37DjmP5oxrbWL0B9sqJZrhVW81phVZCWKJKI8H3KJfstXK40ik31NRHS4gh86crFv\\/ZwXWMgK34quskLdfX\\/byOQGhvEK2cHttiH0HVp18+YvACQUbLxAGz\\/KIjcZ0ZFakwwni4ObN0TTrelHSkty0MvihxyjJo2o5iDA2c6lad7reKk+Dlhv+0JTX8eRRW5QNjlDZxW1SMxqJzazzzLSndkWL31HNEbj1muqpxOerqITF5UNeh\\/hYyvcMhl+Uz+ymfs3+hFmbJeKDtOx2zSjFwf1Wpgw2Lr7Wz+bSQbg1PQq9CAdgOW8Wuf3JIXIsqUaAKf32T\\/psOIFuv4\\/p1cKD32s9HnR6abZbOlmrVo2ciPAwedaWz9DcaySJ6f2sBxZT+Wt9IDknDZtpuYqlq81R3E5E6Gn+j45fM+7cp0GLucDp\\/yvWRRIC0hFK+ntzi5\\/ygvTH5hXfvPF3TlPa8XAJk+tUynsNp0SuFXriB9IaQTH\\/aWh2d2sN2tJbM2Vc47OaZIIjrwJfcuHmL\\/lVR6LJ1BjRxBlYggiMhk5NPv2e2cBXNr5fJovrL6FSgMeS1sRCVJEd643TyOvcNbGs1YS4arl0n3tM0Z3igWj9un2H\\/4Kcaj19Ile\\/LiC+tRZtuY3m4sbWWv8pGxD0BQkBjhg4fTOf466EyxIavomT15AaD\\/HeMXBrNt+zysl4ajLGFCk042\\/D4q7+QFgLySGVOtfVlvO4jtSVoYVmvKj8PWM63TxyUvCqZnErmhUbYVwxa2YtjXrgiARjHKVa9PucJ8pxDEmVXnkNeLJbTadEY110Kr5Rjm5hr7yzEx+4VhT5Zx4PFBFow6+O7vMrSMmjF0\\/mR+\\/MrJi8JE2oFRJBEIPmHLlOPRVG7UFlNzMzo2MMpnhUMg+PgsJh2PolK91nTp3YduLSuR5zUZnx2B4OPTGGnvR+nK9fim60Cs+7XE0MueCQtvIFRrSode5vRpV4sSRTL2Ul\\/\\/skU1Xi4IigesHbyIW7JyVG\\/0Pb2HDqVb7eJFb9XyfT3lxtRs3JY+VpZ0rqFHyAfrxddGQdDt3Wz+6wYe\\/gloV2xMJ6sJjOpStfC+Cy4m8Oivrfh+O4MB\\/\\/nkWhFGcYtFZqdp8dd6+ua5pzsbSc5s2p7C0OldMPwkRUvi6gIL1j8rRoWazWhvbsXg9iYFkiMx\\/jknNu\\/g1IM3hCtLU6u1GaMnDKJ57ueSijDv5jqHSCrUa0VH0z70aG1Crndg\\/0+Tf1+oPHcyctopEoyqUr+NKZZDe9GwVB7jrnjA+mGreFy8Ok3adqN37440NFJnZVV47RnDvLiJHJza\\/ANWw1R4HVuNS4NZWKvZyfi\\/JaufgySuLbFhp08F6rXuRr9+XWlePrsVSOLa4mH86W1M7W860tPMlDbVimdLWn1FPSqwjBWUjPbueFuWWi070L13T9rXLllkF8WAz9AHEv8\\/UPBk13pCes\\/KuORYLQLJEf74BUeRpNKieOnyVDEpR7EikhwrrB0YUgJDQkJCQkJCQkJCQkJCQkLis1FYCYwinaCUkJCQkJCQkJCQkJCQkJCQACmBISEhISEhISEhISEhISEh8R9ASmBISEhISEhISEhISEhISEgUeaQEhoSEhISEhISEhISEhISERJFHSmBISEhISEhISEhISEhISEgUeaQEhoSEhISEhISEhISEhISERJFHSmBISEhISEhISEhISEhISEgUeaQEhoSEhISEhISEhISEhISERJFHSmBISEhISEhISEhISEhISEgUeaQEhoSEhISEhEQhoCTC\\/RmBwteuh0SBEFMIeu1PvPi1KyIh8R9ATCE0KBLF167H\\/wwi8W+e8iZBMkASH46UwJCQkJCQkJD4RFQEX1rNluc6GMq+dl3+Swj4HxyPzQ5PVF+qyPQIPC7sYMGo4Sw4+YaUXOIH5fMtWE08SvD\\/94SUwpnl\\/eZxJenrVuOLjocYx\\/nZ\\/Vl1\\/1PDdQHf\\/WMZvccLVaHJ+pfVGSHJn\\/sn7Zgz3JpZDm9I+yzx9lewA19drmUUN0rl0qqtPPx\\/mkX94ja20PT66yMlMCQkJCQkJCQ+CTHmJjtOlWagRV30CyuBIfhzaqU9bspCet\\/\\/DEr+PrASh7cfGuooCbq2nomj53LYx5h+S\\/dgP6czxl\\/KE1S6Yb\\/yFP7\\/3xMiEv8NxHie7rdl2LB5OPga02fxHvZNa0PxT7Rv6Q92sOpCKF8sZo25zvpNTiQWwRyB3LA1Nj+Gs\\/MvD9I\\/UxlFuf2FReq9ray9FvnFZKoooPm1KyAhISEhISHxX0Yk\\/v51XlbvRx2tQnyt3IR+c0cU4gv\\/V9CkgdVcGnzovyk9OWX\\/kDq2+5nctDAHqoBoNmPE3GZfvtwvjBBxlY2nSjFh9LfofO3KSHw8aY85dSQO0+17GWpSeOGSdqux2Bba2\\/JHVroz0yd9wQI\\/CBkGzZpjsOs6z8c0ocVnMEtFu\\/2Fg27rX5j5tSvxhZF2YEhISEhISEh8Air8vfwpaVwWjdweEaJwXT+K0XaPCnjngoC\\/40p2nTvOyt1u\\/Lc2YSTjsmUtVyM\\/z3qY8sVfrDx8jv0rj\\/LmQzZhaFShWWMll7YfxDP1s1Qtd1Jf47hiIlaDbJh70IMPPvaudMN+5XHO7V6Jo18B+7XAMicQfG4VOy+cZtWuJ+\\/uOFAQ4+9LxEf0k7xsV6YXQvJCTHjGrgnDWXYzQu3KaqrXcWYPn8+FPPefC4ReWMXWs2dYte0eX3rYiwwfbH8AnRaYdkrk3N47ROTZxdG4bhjD2O3uJOf3zrT7bF91hnPbfud8aCHah9z0Q4zm2jo7zp5Zj93dBPJqen7yViiIiThtWseZs3b\\/7BiQlSyHUYoP3lEFKPVDx\\/ED2v8lSPU6xiyb2Zz2Vz+j5fe7WlJc2bLuPOcLc84Rwri4ajv30wrndZ8DKYEhISEhISEh8QmIJCcmo6WbR8gmN6LNxOl883QThz3fnb9NC+bReQeOX39FfCa\\/S0hNJCkNTMznMqKrKZOGNkGTVFw2TmTH0489uyuS+OIIC34eiMWoRRzzTFHzSAzuZ8\\/xLFa9myuE3efktTfk79Pp8\\/2EmXQ1SsXr8iZm2wzA3GI40\\/+4SXC+CQeRxBdH+XWkJcOmb+ZOaKZ\\/UKaSkKRAo6E1cy268NNkc2pqCEReWsHsQ2\\/yPzsvK8n3k+bSI+kQi9bfIfqfPi9A33wIigg8LtszZ9BANrwbL8WzU+z3rMn4JZbondrM6bzOkSQ\\/56CtFb27dKG39TyOeqa+270xgN4j52JetYCuqzqZ+weR+FurmLLzGenIqdjbltE9+2I7qgUZi8Bp3N8+j0Oe2QMJBfc3DGWgpQ1jJs1mqd1+zt\\/3Jf5d54sJ7uyfYYFpLysWnvJSIysCcS8cWTPFip\\/MBzNqzi7uR6vvC5lBE0bMMSX0T3seqImMdWv2x3awyIFdt98FcwKhN9Yyrn93OncfwC8b7hAmyCnf05Zf+phhO741umpLSsbTYT7WA4Yyed0lfL960JLCtQX9WOFSiOf085SFDFSxr7h5ZAnWpou4lQbIStJ60iJ6R2xh0YFXuSd\\/5Ia0mTCVFg+35HGsS0FyfDIKne8YZ2tK56GT6VZejuBzjHlLz\\/NhuQyBRF9nTq4eQ+9pjhnJlRz6IZCelECqYEiXGZPo0Xk0o9sYIFN6sHvKWu6oufciP3lTW67yb+zHWTDIeiQTZixinb0jTq9j\\/rnoVBnhwZXjDlx8Fplhn2TFaTtpBmZ9JjOzS5l3Qag22lrJJBXE7KgZxxxlvKvrh7a\\/YKThc24FYwYNxGb2Hp7EqZkrVIGcWzCY3n2HMmXtKV5mmtx0aw5gjqUmh3ZcJ1rNv+b3e86yUkkUWjJ+Ri96TZjCD9qpKADVm4PMXnGZ\\/PMZGe0ZZ2nFhNUX8Xt\\/jkdujKntOL4rwlvIpASGhISEhISExCcgQ0dXB6Uin4BDuw5tWwk8eRSEICbivG4Sy8+64bRrNotOB79b9VPhc3ga0474IaDC6+Bkxu\\/xRIVAUkQgUeryDgkBvPCJyeS8isQ82MbEgebYLL9MiAAIAZzefBb9IcuY+0ME+w84k8OHTXvKib0eJBVTf8g9zfsmRy57kpzZsUy5yzKLRdx87\\/CLsdzeuICjnuHcs5vM3DNyTJfs4\\/j+OdT3sOd0joA4G0IApzefRtdiIRNru7PB\\/t9Vc4XHNkYvvEi0CAq3LYyYdZIQARQJoYTEpudYXRT8DzB+9B4yx1Sy4i0Y+6sVpW+vZskx74xz5wXpG6UHm62mcjJcABQ4L+vLrzfUhHSKNxyaOZu\\/AirQqIZAeFgKIqBZrytmxu5sXXEAt4QUkrPcHCrgd2A8o\\/e8RQWIaRG8fZNMMxtrGia8xTsqHRGR+KuLGbnFPY\\/dOAIRD09w5lncv32RWeayPRvyxhOhRBn1Z6mTXuDhXZzSpbK7yVq0GL2JrRtWMG\\/iIJorndg2dwJLzmbIb\\/L9YziIg9m++keCD53hb2VGWUHnVrDyvD+BV5czcZkLZSxXc+j4TkaVucH+KyG5rnjLK7WlraE7D96qa7UMw+\\/bUeWxE88UACIJ\\/i\\/xL92L8T2K4\\/86MGMcVS\\/ZNX4+53LZRiD4nmDDCU0GLZnJN\\/7b2HotWo0sHWT8yN0ZO36yyMKnoMJrz2jG7PdBQMXbPSMZtuMlKgQEAciihmrGNk8+RBZACDrPwqlb8NBvSD2jKELfR346tbFcOJKSp7dzMSyP9mrXoW3LFO7dC8x4d\\/Y+UjizashqXNOBVCdWDl7K9QQQ02IICYvPKdO59rFA9J01TFnphFC\\/ARWjwogQgez6IURx\\/tcx7PBQghDB2XnWbHykADGFqMBIklTqezF3eculXM06DFq5lU2rFjF1WFuKue9j4cSZHHilAoUHO6bN58iDRxz51Zb977aLCYHHmTXlID7\\/NE2JUqmDrnbu3Zujr9+PYy5lfHj7RZJDPHkTkekmDjGZFwdnYtnPkrnHvUgHxOhrbN+fQI+Fi+kjO83eq2E5ZEnlfRnH4I6s+ms9NuXusvTXk5m+zCXD8If2VH92nxdqp8v8fs+KEH2JRWP\\/5LkSxPirLB78O05pIKbGEByW8G5OzN1ev29P1\\/mz+T54B1uvvtP9fGxGUUBKYEhISEhISEh8AnIqmVQgPjLmX2cuPZB7l+4RpABUySSmqFBEuuPknkiZcqWQibH4B4g0+WkqS8a0wNftVYaDmBaE+4tg\\/J88JDApmKfuAQQ\\/usvfUT54hxhQumT25IKA\\/+kVbHKKyxTvCIQ8dSWm8VB6pB1gw9kgkgNdeRBQgYZNa1CjcmlkaamkZ\\/dhNcthrPeMi2efEZaa0RIhLZ6QN0+4edyOuRvcadKzDVmqoF2e8vrPueUcjhJQhN3nxm0XHJZNY71\\/d1auH0+bEmHcdzzMnchyVDDK6Xbp6esQH+hPrArSAl24H1CRRs1rUb9eRRRPbvMoTgAhCS+3V0S\\/fcjD8ES8nrwg0seVuz5R+HiHY1C6ZA6HThUaTETZilTIdq5Hp2Y3utRR8vfehdjdjSApl76R6eqhExVAQJKAMsafoNhw\\/PyTEdJD8AuVoaeb88CQyu8u15Nb0vf78pTQ1+bvO85EqkBWojk2K+xYMawhuvr1aFgl8\\/\\/KMa5gRKDLLV4nCchKtmJI\\/8o83rUHj5oDGdyiODIxlQBvf9LyvLpNjl7UI\\/ZeeIlSncxle7ZCneqEXviLy55RGV+WENKIDfwbl3P2LJ28mr9bj8CsqhzQQ08rHP+AVERAS08fWYIXt\\/\\/axLGgclQrV5lqZUTSBdAxqUa5QBdOnXtMTJUaVJCDmOqPy\\/W7XN83j1n2SqzWrWRYEy187xzj5IM0jMsbkF2qxdREkpRK4jxv8zDUEGM1coOQhO\\/de3gneHDHJQIlcqr1sqFDgiObzijoZGOKiRxUMb54hyiRa6tJzCnCeXbjEUGla1Cvek2qldEgIS4JUaaNvm4awQHhKBBI8PcnMjqQgPh3spCog55ujlqTEujOU7+kTEkGEUW6Eg1NTWRklXUxLZhnL0MIePqYoKQQ3NwCCH7kjGeUN17BJTEqnbnNmcY2Dwn4OFkQiHpwDb+6vehczRB9HS+c7gb+s4tAkGmjq6FAkccWp4x3h+Pjepu3ydn0BYE4dze8Ujx58CSGWLfHvEr1xMkpiAhfX2JLlMJAlrVvcu\\/jdNyvP8K4W0\\/qGxZDO\\/IedzxTEMVUArx9CfbxIVIJyqhnePhF8OzBKxKinvLEO55ndx8SEexDgFiSUtnem7+85VIumujpa5Ds74rDpt08qfQzm47s4Oe6GogpgfjH1qTnpAVM6ZSCx\\/NoBAQS\\/b0ISJf9o8liSjQx8kpUKaNGxvOZR1Bbxoe3HzGWGxuWcTEkUx3ESJ67+lNl4EBKnVvHkTfJRD5w5bVhPZrVrIFJGW3SUnNuVxLT00jX0aeYfjkatGuGYbAvoSpIS0pEoUrC944rPobGlM1mPvP7HZK4t3kGWzJtj5Eb1qOuhhPnnCKIdnfDK\\/UlrvcjiPTzJ8r\\/OR5RSshsr7PotYLwey68MqxH81p1qFdVmxd3XQhX5WMzigjSJZ4SEhISEhISn4Aco1ZtML7+gmChOSZyEMLvcXiHE+0bt+KnYq5sGL2Wu4kG1O02AdtOpZDJS9BtWGec11vTLzwVlXidbk57qCIPQ9m8Fz11jzO6717KdbRhZLmrzB1ynvJdp7Gsfk63RUtXiwhXZzx6lKdxWV1IT8bwu04YLXJB9\\/cRlFw0hT6blJjUNmTfsJ5sK1aHPrN+oFR230yzESN++5nd2\\/9gwq4A4pUg1zagTKVq1Gn4DX1X7KBDrRJZEwXKKKISFDzbZInpidrIvMKo3d2CVl5XuP5kCyO7b0WzWFmqNWmLxcoZ9Cqf3UmXY9SuP23PrcKi1y5kynSq1DZk3zBTNmFA2dICi36yoE7ZOPy0v6dv+2i2W5mjqtqLsZZhnJ5kTWoNc+aMqZQjgaFRowl13hxnx5Wq2HSoi6FGCuFvH3HrjAPXy05l0\\/BQdiwdhGmsNib1K+boG1n1bvSva8vifuYUkwuUbFQdvwX9GKwnI73SEJY2y3njnkYNc6b0Psa187cwqD+Yvo\\/3YdV9F0plFCqZFgaVmmFmO4c2xTL\\/l0B0ZCyaEeeZanaRkprpaDfsyowd41Fe2sH8gbvRr6qNf1hdRv9eJw\\/HVUShUKKppYmYoEbmsjwro0T7afwWt5OdK0fyR0gygkwbA+Mq1KrfjNZj7Zj9bSV0ZYBWQ3oPKM38yb25W1OfIB855Ws2pnX3WWzq3QDc97F8zWj62IEqIh29stV4468Abzssu+6nrCwBmvbip0bPuHz3DiuHdGGVtgHGNVvQccxarDqUyJHAUD7fzaiF54jWrU4Hm1mYVZJDzD+\\/4mZnxazT0ehVbkm\\/6f0J2j2cvrvkCCkVaN1\\/Lbtqv+TAjlH0WVMB4wQf5KbzaFMieykKXuyeweKntWhr6Mw8yxPIq3Vn0rhKyJHxrXk\\/ji+xoefl6sgCU6hfV5P1FgPZThoGvefT2iD7+1K5t3Mpzl0P0rzq+yGJ5dWrSMp0N0KeWdb7OlIlzZuU5r0w1XZgVF97ynW0YQRXsR1yloo9ZrCsTuYI7t+xLRgfIgtyynQdj3XsBS5c1aFyXysST4zD9JiIEJUC2mVoPHAO3SvkDLDFqDPMHvoHT2VG1O00hokl7mBrfh4dMZliDavj96s5o2vq4edfni79m+K5bCAW2vXpP64XL+1H8bO8MVYL21NCJkfM3DfpAWj0UtfHurQZOYmgU5e5GGJMt+GNOTenL0PK6xITZ0L9Unux6ncE0hTU72lO5Tsz6XfCgG8Gj6X1gzVY\\/VKcNmOX8o02kGmFX6285VuuGeZykWSVIVUbfMOPozYwq3UF3m+kkBm0Y6jFDVaO6UdwshJR7E8Xh+poxChoO9Wa90Wkef5NRIu2NFGzAyO\\/eUSumUsZkYnUy6\\/9WdBAVzuFly6PCK7diop6oEjRo2mnWjhciGPohIasm\\/cTe1PKUqfCKyb0OYi2SWcmW1XJYXc163TnJ6OlzBh0Gu1SNWk3cTLNtFS8PTiD2Yd8kFVshcUMS+pqkGnXoAqfYzl\\/z4Lib+7e0aShtd6\\/f5PpoKsVx91VltzSa8jAcZ1x3zAUG826tG6UwDarnuwpLpJU4b291vxHr00dtBGTjahd4Q0T++xHqVeOMpp2DO59liqqQDTV2oyigyw+\\/uM\\/vuvk5ISpqWmuvz9+\\/Jj69et\\/7OslJCQkJCQk\\/hOk4LFzCZfqzmZGe8OCb+8Uk3i8cSx\\/Gi1j27BqH7ctND2Q23u2cfC6O34x6cj1SlG+RlM6DBzOkB8qUdCdyR9RML4Os5n9tDvbVphiVOR8PZH4F6fZZX8al1ehJMuKUa52S37sbcGAH2tS\\/CP34KreOrDaWZ\\/qwdE0njWMhp+4FCbG3mPdxG0Un7uLcQ0\\/4TMEqZ7smboAv0H2LOqYMykgkQ0xitPTrXhidpolHQuqJQKhF9ZwUlWfhMByTMlyr0Y691cPZVexOfw+pjnFE7xwPbGZTTeqMGvHDFp\\/SjD0oWMryULRIf0NeyYuJmHiXiY3yabfCh8clu5FZ8xC+lbJ9QroTyujgKgiHnBw2z4uPvIiMhV0DMpSrVFb+tlY07mG\\/teXoaTLzLNxp9\\/h2bR610Qh+DjTZ\\/hitX8m33yFD0t9DC9fvqRly5b5Pnfx4kXatm2b6+\\/SDgwJCQkJCQmJT0SPxiNtEc89xVvViVr5+aJCOvFhb3l4ZgfbHjdn5paqH3+mVbsyHcYup8PYj32BepTu+7AL7sZU0wpZ6yakEu3nwZ1Teznw0JjRa7oWweQFgIwSDfsxfV0\\/pn\\/SewTCLm\\/gtKoeiUHlmDDagrm1PrVuIoqEEF4\\/vMJh+7PEdFrEqgYf4YGLAmkJoXg9vcXJ\\/Ud5YfIL69pLAWuBEAUEEZDn11tJuGzbTUxVLd7qDmJyT1t+UfucNt\\/+PAOPdXaMNo9EVawCdb\\/rzgI7c5p\\/TPLiQ8e2yMhCdn35iC\\/SCOFc2XAGw0mj1OwWKIIoX3JooydtpptT\\/Z2xFBVJRPi6cdl+ExfLj2BTo+z6LRL7\\/BVlRsyh40cmL\\/Ivo+BolG3FsIWtGPbRb\\/jMaBtTTvMFd5x9qfNdOVRB9zm01gGx3yrUbIb7B5X3CTa46lE1JJZGU4egZhPjfxJpB4aEhISEhITEF0PluZOR006RYGRCvVbdGWxtRuPS\\/5EruRQP2TB8DU9L1KJlZzPMTb\\/DJJdLP\\/93UeF1bDUuDWZh\\/VHbLwSCT9gy5Xg0lRu1xdTcjI4NjPjw0EMg+PgsJjlEUqFeKzqa9qFHaxP+3w3HxyJE4Dh9GG7mZ1jS4QN6Xwjj4hpHDKd+zq8UfOjYSrJQdBAIPj6Nkbv9KFWlDi07D8T6p28xLtQdAl+ijKKGQOS9XazedgG3gHhkpevS0Woiv\\/RrSBE+6ZGDwtqBISUwJCQkJCQkJCQkJCQkJCQkPhuFlcD4jyx5SEhISEhISEhISEhISEhI\\/H9GSmBISPwfe\\/cdHkXxP3D8vXeXTg+EJkF6VxR+iNJBQKpEehcpgvQuSvsiUqR3UGoooffQO4TQIdRQE1IgpBDSy93t\\/v5I0JBGQJCgn9fz8Ijc3e7szOzszGdnZ4UQQgghhBBCZHoSwBBCCCGEEEIIIUSm9y9Zi1QIIYQQQgghhPj3s7W1RdM0FEUBTQNUeGFlSy3lXxXlr\\/8qCfMYNE1L\\/Cflhb8DREdHv70D+BskgCGEEEIIIYQQQryHomPj6bzsKCExGjZWlugMBvQGAzqdgg4NnaKhxUVjjgxFiwolIvgxdcoVYVCnb8iaLRuapv0ZDEn698xKAhhCCCGEEEIIIcR75HmgwayquD0I5Um0hq2tNXpLSwyWlhgMFhj0Cnqdgl4zoEZboIZBZJCRQPebdPyqFkFBQRRydESv1wMvzsTIrCSAIYQQQgghhBBCvEeez5KwMOjY1KsGZkUPmoqqqqhqwkwKVVWJj48jLjaO+DhbQoMt8PcxgjGWokWLEB4WRkBAAIUKFXovZl+ABDCEEEIIIYQQQoj3kk5RqFHCAfQWYIrHbDRhNBkxG40A7c08AAAgAElEQVQYzWaMRgMx0QrR0SqRdjl5ZIghKCiI06dOEW80cue2J8WKFade\\/fqoqgqQqYMYEsAQQgghhBBCCCHeQ5qmERlrxmAAo9GEyWTCZDJjNqmYzCpms4ZJZ4FJZ4lmMJEttwOxJpVjR4\\/g7++Hn68viqKjcpUqZEtcE0MCGEIIIYQQQgghhHijFCVxnQudgqpT0BL\\/oFPQNAXVDHpFwcrSAtVsidlkwj53bjRNw8bWFhtrG56GPsVkMskaGEIIIYQQQgghhHgHkrxdRNHpsLCwwNIyIYiRM2dOjCYjcbGxiW8t0WX62RcgAQwhhBBCCCGEEOLfJzEY8UIQIzGAYTKbsbfPjcloRK83oCgKiqKgqmqmDmJIAEMIIYQQQgghhPgXU0hYL0OnKBgsLLAwmbC0tCSXvT2goEsS7MjMJIAhhBBCCCGEEEL8myXOsEDTMBgssLZRUAFV1cjtoEen15O5V79IIAEMIYQQQgghhBDi30zTQNPQFIXo8FBMcbGYTUaMUdFYWNui0+kTZmm863S+hAQwhBBCCCGEEEKIfztFh16NZdGBS3jEZCGblYEYo0qLgqHU\\/1KX6YMXIAEMIYQQQgghhBDiX+X561A1TfvrD6CoJqKschFgXZQIg0ZknBmj3gedpqEmztLIzHTvOgFCCCGEEEII8bZpMT7cuBeGChiD7vIgVH3XSRLirUm6FKeGgqbo0BQdKjpsLPXksrEgj50VuWwsMOj1qDodKAnfIxMv5CkzMIQQQgghhBD\\/ciauue7jRryZA3vMWOUozVcti7\\/rRAnx1mjPX52qKFgpKgYtHqOmgRqHAQ1Fb0CnV8iSxRIrxYzOFJMwvUHTQG\\/xrpOfJglgCCGEEEIIId45U5g\\/QUoB8md7G3d\\/DXzUqhcfvYUtC5EpaRoGg4HQ4CAWup4m1pAVgx4sNBPBij3ZbSyws9BjsLLm7rOcjNnghhE9RlWjkCGGXi0bvusjSJU8QiKEEEKIt8foxq8tfuJA1D+1QxWftX3ousQT8+v8XAvDdURLpp41vumEvT9eNQ\\/eYBmbri+gU78NPHqXM\\/ulDiRQn+F1zZuwxMfhY4+Moen\\/TvDmc8VIyM1DrJzUl049Z+AW8rrP32fs3M8UdexPf6+9ylzHIjKbhNkXOszxsZwKs2NvfGFOqB9yyrI8EbmKkDuLFVntbLC1MhD0wWdcyF6JkxalOWpdkRvRlu86+WmSAIYQQgghxCtTCdgzlSXn4t91QgCNiJNzmblzF3NnHOJp5l5\\/TWQmxgv8PnUvT1IbACsa9zf\\/wtILMS\\/fjvkuGyY7s9tlMqtvmDK8e5PvfqZ+34Hes90wffI9c1fPpFWRzDc8iT2zkOmHgpE4QWak4rVlMquuZbzeJWe+s56pG+6+XtA7E1OeP0Ki05HDxhJ7Gx25rHQ42OrJaWuJlYUFlgY9lgY91hixt1bIY6Mnl7VCNhurd538NMkjJEIIIYT4bzLdYt1sTz4f4sSrj5l05Gs8ku\\/fRrpemULWGgMY8q6TITKvtOq6RWV6jUzjN0pOarX5Pzas2E9ApRbkSG\\/7+hK0HVXiFRNl5uGhjZxzHIjzz9Wxe8Vf\\/5Osq\\/7AsHediJcx+3PjGhT9uCA2\\/\\/D6i2rwYSb+MIsHtX9h0Q+fYPOP7l1HEaeRFFZeP\\/ClL9mOkSXfYJLepSRvENE00OkUVFUl1mTGqOkwKTr0ltZYWlpioQOdXofOoEfVWxBjNBOvQZyqEBOXXnBeJS46Hr2t9TsJJmS+EKcQQggh3h\\/qU9xn9eL7xR5E\\/53tRLkx72\\/MHjB5rGDyNp9Xu0NqKEOHYa8TvFAJOr2Ekd3b0\\/6H6Rz2f\\/07f2+EFs6VNWP5vkM7ekzYwf3Yf2Cf5rtsnLqe2y+9ZWni0cEJfDfQhftpPXvwKmVvusLyyZvZvWwy2x6+7v3wDKTpNcTe38TwriPY4fN69eG16nBGpVXX1aecmdOHfkuuEJVK\\/luU+Ybmut1suRGPpqZdQEbfg8wc1JV2nQaz+ExIBo9Bj2Ptryh0eS2bbmVglkcKJh4dGE\\/Xfs54vs06H+POghmuuC6YzsHgN1E6CTOmZh8LI8PNnRrEmaU\\/07trZ7r2GsbcY49T5rEaxrn539Nx4GJO+r\\/mzDAtklPzZrBz19xXm3FiiiIiKprIiBjMr9CGqyGHmb30PHEJ\\/0d8VAQxpoxvwPjQlYndW1C\\/bh3q1GtEmyEr8Ih8xYuI+Tbrp65jz9qprL\\/zT8\\/BMOO5bjJrd69NOQNEjSUiPBrjKxyOpml\\/vj0k4fERUFUzVnZZaV1YoVvuAFpnf8xX6nXyhd\\/HYGWDtUHB0qCjsN8pGpmu0dLqAR0tb1GrQBqPkJgesvOntjRu9BXNey3mYsQ\\/P+VPAhhCCCGEeH26XHzedxCfnl\\/AxnsZ6fzF4bV7Er3bd6Lvb3t5+LyfbVeN\\/kO\\/JNdr3jk0fNyNUU6OqXRsVMJuH2Xrhp2cf5S4M9NNlvduQ9vO3ek7dBwzlm\\/j1J3QjD\\/brz7h2DpX1K9GM6LSPeauOEOK8ZMWy7PAMGIB1e8oLofOcNjlCL4qgEbUfXfOeEUlDmA0Im9sYEz39nQZMp8TAX\\/loxpwhs0Hbids58lZtuy9SaSmErB5IJ0X3sAEEH2WjWuDqDJ8DA0jVrDkUGiaAyPVfxdTl1\\/BBMQGeHLrUUzGB1FJ6UvQZmQ7Sulf9kUDBb4cSq8Crix0DUh9QJRm2adSdoaKfDeqFU27j8KpcCql\\/fQ8S4d1pnX7PkzZ65NGmWYgTWkx+7F7dDuaft2RgdO3cyv8r19bF2vFj+0NrFtyOCEYo0Xh7baDDdtO4h2dJJfNjzk2ewCdOvRi\\/KZbfwYO0q7Dcdx2GUzLpt\\/Qdfh8DnpFZ7zMXlbXdbmo+v0PlHGfi8udVAIvOgfqty3HpQ1H8H4WnkZembm\\/dw3uudozvrcjp+e4cD3VGE4s\\/hd2MX\\/gN3RfcR8zYFGkJWMHOnJgwgyOpREcUINP8FvXZjRr14eJLpcI\\/vP0MFCg\\/jB6F9rH\\/B1+qaRNI\\/LGekZ3a02bHuPY5PkaQRJzLJFqJfoMbUKTvgOpZhmLETDfXcuISft5vXhGwoypQbWzk9HmTn18hNWuGi2mr2TpOCfyhT4mLNm+1ZDbXIsuRmXr44zv+xOb78els0Ujl5ZOxTVABS0Mr6tehKqAkoXq\\/YfSvNkAhn2ZGx0ZO6d0+Zozdft+1o\\/4giyv0Ibr7OsxqEclIi44M7pLUxo0bspXX31Dn+kH8HlpDMbM\\/f3rOXw3jAJfj2JADRsCL65l6b4nGTunjVGEhoYSGluUdiM7UL9FLxrmiSDKqBJ2ZArfdurKj5u9\\/3ZAUQ06wtwVF0m9NPSU7jCKjk07MrJtCZ43p2Z\\/V0a3aULTpo1o3O4nttx9eYROS5x5oWnan28eUXQ6FCBnrtx0\\/7oe3Rv8H13qVabV52XIrovDoNdhY2kATaOQtYluTarTvUlNejevRdsmX6a6H5PnbtadfoJRU4m8vYXNbhGvdw35GySAIYQQQoi\\/x7Ik1SvFcOZM4iDCdI35nQaxNTCVIcXTQyx2jqD+zyP44tESFh58igaofpsZPnAtXil+ohH92JO7QUl6s1o0N9YOo32L9ozafJ94NMIPjqf7Ag+Sj5tUbxd+HLYMtyu7+XXoAi7FAoaStJ28kHlTxzGoS3XsPFYxtt8w1qQzncB0dR6dhmwjSAV0efisaVUidkxm9kE\\/YmJiUjw7bbq+lH6TjxChgu6DOrT\\/sir12telkA5A5cnJFSw6kHi3XfVlx\\/wdWLcZS78SHsxa\\/ldAxOzvxkbXa4SpYLp\\/mNVbLxCkgWo2\\/9lhxaYijRpZcGz6NLbfiSY6Ji7NDqWuYDNGflcRA6B7tJdf5xwhVEu\\/zFKlheG2aCJbMhK0Uuz4tEZZHrhdSFwQ0ojbxK8ZcyThKNMq+1TLLllZqz5r6dN9GXfNACZuuszBvfAPTOxfBs+lG\\/FIKyr1kjSlxfxgP9se1WHq6pl0dTjJhDFb8fsz3Qq5qtWkyNWz3DCqBO35hUFzDuFxaA5DfjvGs8RCiXFfzsL7nzB0dFNM6+ey3VdNcVwvMF5j1zYTbRatZGILha0\\/TeXwC9NVVB6u6UPPFfcS6mHSssxIXbcuQ+0qRs6f8091sGb9SWsahK9h0lZP4mNjiE++D\\/R8WKsZpR+uZuLvpwmKiSY2eQXUori8eDBjd4VTvHwhnj0JStyXjlw1BvNzrXssXH0llcGxSvDxLVwq+xPOC\\/tT7tZMRq7w\\/CuPlCxUrlkB\\/\\/OX\\/1xs9K+f+rJj\\/i5sO0xkVLUgnNe48arrzKpP9zHu+9+5bgIt\\/CDj203hVBxosaE8ehKReN4nrTsaz1xH0GbGhXQDoua7m5m42I3w9EZ+xgCuut0iRAVd\\/rp0bmRkVa9ODHMJ4aP6n5Az2ShODXlEsGMDvmtchnyOGodnrCft09OCT3uMpEk+HWhxXFkxlnWJa5e8eD6+wjmlmV9hRkkolzb\\/wZLVJ7h7+XeGj1rOBeULvv\\/pR9qWjuPWrpksc0s2py\\/WnSlf16Z28185FQ2go0D5j8lnqeK9fTJzjwWjaiYCHwdmKOigBrkyulULWg3fir8axdGJrfm6RUfmnDcSHxaAr48P\\/k9jE47JeIpfGtWiVpNJuBsBVHzW9KJuzXr02ZD6efOcLk9dBnSrhBUqAduH83XjpvRaevPPWSe+G\\/rRuEFjBm5O3I4WwallizkVWpQWPRuQJ9CNP9a4pzrDMWnQQlGUP\\/\\/odDp0Oh16vR6dToemqUTFGYmKV4kyqsSYQNEZ0P35fQWzzoDRqKJqGiZVRU1jxpXOoTCOic8oKbq8OBayyXAg7k2RAIYQQgghMi7ejzP7zuCfpBNrDPbglEcgXu7HuRetYgr1wT\\/SChtrBbDBxiIQH99YNIwEnjnN7Vyl+aR4SUoXtuTGydMEmlUife7jG6+kfJ5We8aRWRPZ+zhJl0UL5rq7D4VatybH7hmsvxOO7wMf4lJ5Gtf82IdH+WvTY9RwnLLewMPPDBiwsdUT7ePOxnnLuFSwG\\/PWL6FbOtMJdHkLkOvuSY77xaFhwPGrkcyaNZx6efUULVsyxTPfiqUV+kcXOHrFj3CjBqgYI4Pw8jjKxllD+XHDA4JuXsIrSiXO7zRnfQtQ\\/pPilCldAOOl41wIiyf80S0O7jlH0K3D7Dh3jUOHPYh4cIBNRy7hfsWHgHP7OHE7gHBzHmr0m8bcsV\\/zoSEPZcrYp+jgmTw3MGH5BZLeg7YoXpqC13ax824sxhfKLAMUWywjr3DuTtRLBy1a7CPOnL5FuOcpTvjHocU\\/5uHjGJ489CVWS7vsUy07LRbfB9488vIi2KQS4eND8FM\\/fMNVtKjbuF2KpnD5shQtmp8s8TEpZ8akl6YABRvr9KeUaPFxxFvZYmfrQNkaFcn1yJsAM8RFRWI0R+F9wh2vXHnJo1cJ9PHDrmpHho\\/pRJFbV3hgAtRnXHa7jmWJipQsUZZi2R\\/gdvIh8VpsmnUY4ok3WmNrl4WCH1WjnLUfD0OSDpl05M1vj9\\/pY9yJSjz\\/ngXy0CcaNb26bo4mMsaMMdgDt2uR2OdJPiNAJS4qmtjwMDTLSGLyV6L4\\/ZOcfGJKtg+wLtWScXOn0a9KdixLlqNo8sMweXL0uCU1v\\/4Eezsb1EvHOf989oqmYmFlhTk+9ZFxfLwRC1s7bHKW4PPKH\\/DMx584jERFxqHGPsLdzRO9gwM2CtjYWhHu58MzM8T5uXPONz\\/lPi5K0Q9yosTFEp9uZY3izPyhLDj311BRl6s0pfSn2H0qiKceV7gfewv3s0EEP\\/QhxOc610JMkLQ+qzH4+gRhaZP+oE7JCkFuV\\/BNJ\\/5nurmRKdvuJjwRoMtD1V7TWOcyi8aRq5i22QsVUKxtsArxxTdKRV+4LEU8VzFk0U3KtepOTcNlLgelmKbBsfm\\/4eqT5N91uShZQuPYthMEJ7bFD33v4x2W8XNKDdjNj980ocM091QeRVLx2TCApg2bMuj5IF1nQ9jVTaxbNp2R\\/9vEA2MePq1VGuPtk5y9H42q2JE9W7JKZJGb3DkU1LBj\\/DFzFRu37MItrBwde3eng1NNitnpQLGlaIlCpDiLtTCOT+1Km3YDWX0noZ7pHEpTyl7BdGs7C39fwu4bJtCiOLtuOvN3e2JC5dHJjbhs3sr6lTu5EqOhRV1mh\\/Mmdu7YjMtRb8yApWUqj1qY77Fj8mh+nrCRm39Nd8Lh4wrkjg3n9tqfGD5nA667N+Ny8A5RsVHcPuDCpu072bJmJn+cCIesObE1JwRQzLFxpPZkjZL4uIhOpyMuLo6YmBji4+MxmUyYzWZUsxk1Mcih1+sxGPRYGAxYWugxoxCjsyQaS6I1C\\/R6A3q9HoWEAIGSRgXWOTRm9Kyf6Nm5KwOmTKV7OYvUv\\/gWySKeQgghhMgwNfAMLktOUbNCFb6x3s2IjnO4rNhTqm4v+mU7wUgnV6zUKOya\\/kzVrAoo5WjaKic\\/D2jKyWK2+Plmp0T+u\\/Rr5ozJxoHchrm0a7QKvc6CGoM6UzDFrRU91pYx3Dp9gUclqlDABowxNnxctzgb94TRsW85ZvzcltVaBXpNKZmiY2PxaWu+3fcLI5zWEG5U0b6rx+bseoyaPYXLVqZ2j1kMr5qfl70wTgsNJlTxYm33xmzMohEYqqK3sadYjR6MbFk4RcBAX6oT47sv5\\/eFg1nlHUKMZsA6qz35HYtR5tNGjF81EO9FYxjQYTfxUTEUKpGLVV0aMY+s5MmpMu6bDpSwD8Mv+1f80C2a3b8MJaxwa4b1e4zL7NGcLVYfp2I3mdXvB2y0pwSadFjmKEyVtqPomqJDqfHM8xx3osuQ9BNFUVBMD1jfvzW7zBo5miWWWYYYiYzUsMtimfZATfXCuff3rPKyIG+FrxjwnQnXPs3ZYKkSk6cC+V370vxsEfCOoFpi2ScdbqVWdruKZSU6qjBlcqykU4v1KGYDZUsZmNmmNYu1CLQPi2I9uzWN43PyUYcxfJK8QqSTpuj8HZhQMf3OuKFkQ76xn8DQtjuwzFGMGv0GUNHCzL21QxmxzgulQBXaDG1PKb0BtXlXPho\\/hbbtQolTNc5\\/uZ9iDiYCDEVxZAwtdsRhZZ8H69Xf0Wi7NTqtfKp1GMPHNHXawpSerXG2yk2Zhr0ZWCzpEE3lafAzDEGuDGq+l+y6eLKWL8LD0S1obwOhxlyp1nUtwp1ZPadzMjIrpRr0ZUS9HC+WpRaF22\\/tmXIpBxWbDmHOt1WI2DKKUZ3bslxL3McYJ3oWs8Xrehiq3o68ZeszaFRDcievFBYf0WFIdbYeceW0\\/Wd0qX2M6S2bgRrFU1VPFsda9JnwKSlzX0eBWk6UHTuBDq30ZHX8jO79q2GnBrJtQj8WXzGS++PmDBvxf1ijw7JGS6rvnkqbJktRTPGJ51VjFtmVpNnwauRQSPtNE8abnDxhoFznJOFIxQprizBOTm3PMZtytO5dD49ZHelqKEXV8hEs6tSYFVk0ovNUIL\\/rDzTdb4leLUfP1MoxadZGRhBlkxXbdG4lK3ZZsXlyi6uPG1Azn46oID\\/uXd6H6zUbyjd2SBhoFmlAy1IjGd\\/CiSxKNHEFylDC7imX5\\/zMtSLtmGCffJqGD5fdginZKWkBKSiKRvjpqXTosRYC4ihTysCMNq1ZlJFzCsBgjZ2NDbZ2VuiSl732lEvuNwg3fsinlfIntJVqKEFPzWio6Cws0GlPcHNewDmb7OT5oApOTbvR49MXW2WT\\/yWuPFZRdAqPj61iw3mNoNCE0lQUPVY5ClGlTQ\\/618+Zsk2Ku8Kxo94E2rWgfNGEWqbFBBEcqaHYmbm3ex8xeRryfXuFI+sOcjzamgIlixDvfZilq26iDw\\/EplRNampXOO28GD97FZ8QDUuHajSokjJgrEXdwe3QCc7n+4COST5UoyOIVkGxAZ+9LmzPGsbdMAcq1\\/kAX\\/fdLF5TEH1oOPmLfoi930VcVkJWxy\\/4tmM10muaLSwsyJYt258zMpTUog+KAokzNTSTPTncbxLtfx4bCz2R0THk\\/cAWnYUlZrOKTqekvg0AdGQr3ZDOpdNOz9umhIenO3kpXadOnaJRo0Zpfn7x4kXKlCnzupsXQgghhMAcdI61i1ax98J9gmPBKmsePixfnRZdO1OvqG2Gpq+q\\/tsYNvg6LVaMoearvu7A\\/IT9\\/xvAzjLTmNc+tTUKMjuVoG3DGOT3Lav6f\\/TnwCr23DS6LC\\/A9IUdcXzFg4q9u4ZhP96gye+TaGT\\/dicQ\\/62ye+c0Qo+Mp\\/feSiyY2pzcb6HyaM\\/OMKPfIrKMWkrvd3A39F8jaj8\\/dfWghcsIqiRmo\\/poM0OGetPJeRiVM5K1pissn3YPB4e7GL8cmeo6LahPOTGlL3\\/kHM3yPuVSCdo8F8P9PYtZsMGdh5FgY\\/8BxctVplaTptQqnu312iHjJWZ1Wk+JxVNpmlN5fpBsGtifO+3W8HO1t\\/D+EC2U3SNaM+28LZ99\\/z\\/6fG7JfdcFzN50ncgC7Vjg\\/APlUo32GIl6+pTQp0944HGUzWt34BGiUKjVNJb0\\/\\/TV3loTe4IJTmM4rJan8y9DaZAjgBPLZ7LMPZjsjaewfmRVrF\\/poMx4rvuNi9kc8YuqwrAk61ck7O8UE1uN5mBMAer1H8G3n+fD7H+BbYsXsPN2PMW6LeH3b4unnCnyL3fr1i0qVar00u\\/t3buX6tWrp\\/m5zMAQQgghxBuk8mT\\/LHaYSxPp70Dfnv\\/H332bvD5PFbqMrUKXV\\/6lhinmKX7Xj+I8zwWtzQy+eIVerxoXht8td\\/auXsFhfWsmffM+Bi8AdNh\\/XBG7jRvZWTcfDYtnIebhKZYvusTH3XpQSJfBMlPjCQ98wNXj23F2uUzentP58jWCF+YHW5jlbkPhx88oP6gDZVLtjWak7KI4vWgZoYUtuGfdlgF1c732s9gZS9OrUIl95s9tt40sWP6Y+hPqv+HghYYx4jF3zh\\/AZfkuQuuOY2pZC97G+ZcqNZADs3aSq38PKr9s+tL7wjIvDoYbnHDzpuRnDpj9z7Ju+ka0FlNJb2JO8rrz3aiKqXxLwxQTir\\/nWfa5rGLvszqM7Vc2neAFgA3FGg9mZuPBf++4kjIUp1L5h6xZ60aFzpXJqwRzffssNpta8GuVt\\/TyUyUHNdt+w\\/brGzm7aCBnFgEoWOWrSs+fulA2rXPNeJF5XX5kT7gKig7bvBVo0r8nPb\\/56NVfuWtdhVbtK3B++TWch32LM4BiQe6KHRnVq8pLgxda2FFmr4igGN7k+K4\\/NbMlLL6Z5iQE68\\/o2r8h9+fs5\\/DMARx6nhU6Owp\\/OYQxHf57wYs3SWZgCCGEEOJfKIqDo9sw86od+YtVpKZTJ9rVdMzwXTaz53L6jj2C+uHH1GriRLMaxcn2fkYvEhnxP76M+auPcM0nAssCFajbqS89viycwTyJ4tD4Lvz+IC8lKtehcfNGfP5hlrcU0Pl7ZffOGc8xvd04jikOFCn\\/BU07dqRBiSxvcKE7lUdbRjJw81M+KF+dRk7NqVPW\\/iWDYfFyKsFnlvLboj1c8Q1HyVmKOp368UOLcmR7hcIzeaxg2oN6jEzyRhmz5zL6jD6E2bEC1Rs0o2m9CuR5RwWmhV9ny\\/wlbD93l0BTTopXbU7Pvm35JPmqoG+YOdKfO7d9eRoLNrkKUaJkQbKmN4rXwvC6cp8wyyzkcihIgTx2f\\/POu0r0k3vc9goiWrMie4HilCqc4\\/XPG\\/Nt1k\\/3oNKwNpRI6ziMYfh7+xAYFgfW2XH4oDAFcqTz2N2\\/3JuagSEBDCGEEEIIIYQQQrw1byqA8V7fSxBCCCGEEEIIIcR\\/gwQwhBBCCCGEEEIIkelJAEMIIYQQQgghhBCZngQwhBBCCCGEEEIIkelJAEMIIYQQQgghhBCZngQwhBBCCCGEEEIIkelJAEMIIYQQQgghhBCZngQwhBBCCCGEEEIIkelJAEMIIYQQQgiR+RlDuHXYmenL3QjX3vTGVaJ8z7Ft4Sy23zW\\/6Y2L94QxzItzriuZNqIXkw6G88arWTJafAh33Lbzx6Qh9J57BuNb3t+\\/geFdJ0AIIYQgPgT\\/UFsK5LVBeddpEUKI94ApzJ8gpQD5s\\/3bW02N2AAPDu\\/ayQGPKBy\\/qEPVz4ph86YO2xTGvdN72bnnFA9tKlCnZnU+yiv3eP9LtAgvTh86yPHjJ7kUkIUyX9SkWpOuFCr1lvokaih3Thzk4LETuF1\\/Ru6PqlPz8xZ0KVQC\\/dvY37+MnJ1CCCHeEY3YgCu4LhlHz479+ONKxOvf6TC68WuLnzgQlfGfmK4voFO\\/DTxSX3enz6n4rO1D1yWeZIp7dloYriNaMvXsW7yPo\\/qzfWgTGow9Stxf\\/0jwmaX8b9xvzJ31C2Om7eJ+bEY++4fTnhn2KTKn96IuGAm5eYiVk\\/rSqecM3EL+xv3hN9luvum8S7o98wMObDxDfPF6fF27IEH7l7LkgBdxb+TWuEbkhW3s8M5BlaaN+cTiKusXuXDp7+Qrb\\/L68u\\/0avnz5q+xWvAOBterSZ2uy7hrBvPDc7gH2lOldR\\/6tquEjZcr8\\/83lpUXo97KDAwt+jZnLkTwQa0O9O3dgtLadTbPHMcvm99xP8Loxq+NalG76RTOZOJmUGZgCCGE+OfF3mHrlMms9bSjcuOWDPt9DKVyvsIlyXSF5dO8+XJkCxwlFP\\/3qT5sn3qID4d\\/R8WXFoMZv53LOWvO\\/cJdEO3pIWbP86PeonHUyWbi7vIfmLS2FEu6l0SfzmfSERF\\/hxrgym\\/bNMqG+5F3UG8+s3rXKXp7TL77mTFxKRe08jR0+p65Qz\\/C4VWO931tN3V5KJTDixnzT5G3WjO+Gb+Cz4tkfUN3YRWsC+bHtGIpc069Zr7+F5jvsuE3d+w+9Cf0o+F0Lvfvarl1efJjfXsxM9f7E6XPRcnP6ki7WlsAACAASURBVNB5zJfU\\/SL7W5mBoVjlJ4+6hhVTVvMkzoq85b6gbq9f+bLO\\/2HxFvb3b\\/Pvqn1CCCHeC8Zbrqy\\/V5nxq\\/pS4XU6ioaKfDeq4htP13+WzpEWo77L0FfNvjtZea8a3WqHcuXS83\\/ViDh3lMsFqzM8qwJYUOT\\/PiZm+nHuf1uC\\/Gl+VpJSMl9W\\/A26fE34sc+7TsU\\/wczDQxs55zgQ55+rY\\/c6m3hf2824i2xfH0ajxSvp6Pimhy5vIF\\/\\/C\\/QlaDuqxLtORSo0os7Po\\/f\\/3Ck3YiEja+Z8jYCDSrDbFrZd8MPs0IiJf4ygRs63e2Eyex9i\\/d6rBFCEtnMX0OejLO\\/ZYxEqcdHx6G2t30kw4f3KKyGEEJlW7P3NjPj2Z\\/akNSc0yo15Mw7xVAOL0g1oYHMM5z0+r75gVewdtk3qR6e2XRm19hoRac3vNF1l5eSteL\\/OFF71Ke6zevH9Yg+i09q8xwomb\\/MhI5s339vI5FW7WT\\/ZmRum10jPW6Xis20yS3dvZvKyK6SbPLMP21fep\\/p3tcn9Qg9CJfDxEww5c2Gb2HvU5bQne9AjnqjpfZbOvkxXWD55M7uXTWbbw9ebh61FXGVp32+ZeDQoQ+WUcCghuM\\/sQc+5F9JcJDD2\\/iaGdx3BDp9MV5hAxtOnRV5jWb\\/uTD0V+tYXqns7VIJOL2Fk9\\/a0\\/2E6h\\/3fQXlkoL6kJ+Ptph7H2l9R6PJaNt2KeY0dZazdVL02M9n5evrtwJtkvs36qRtJd81Mq09pVDeS3StPEJQsm1LLv1dpmyHj+foq17iXegPt2z\\/J6HuQmYO60q7TYBafCcl4e\\/raNCJOzmX2sbCXtk3mmHAioyMJiza9+F3Vi23T13HrpZVZR+4vGvFZLh1a8EWOeTxLdnwqoR47WbXCmT03kj7qqhF2bDZzT77646\\/6D+vSqJwdOtWPs8fuEp3BDcRfWMoM1z0snb6PgHdVbUwP2flTWxo3+ormvRZzMc1O2NsjAQwhhBBvhHWxloxsp7Fm6fHUO\\/J21eg\\/9EtyKYBNObqN\\/xaDy1gWX0zn4m8M4tr+5fzYtjWzLieEOoxXt+PsWYw+\\/2uPzfb57PBJ4ypu+IhvR33DhyZ\\/Ti4dTY82LWjVuR9Tdt1Psm5DGnS5+LzvID49v4CN91LvWRs+7sYoJ8eUF1ItCm+3HWzYdhLvxF6JvngbRnVtSrtRXUg581Yj8sZ6RndrTZse49jkmVonOo7bLoNp2fQbug6fz0Gv6FfoMGlE3tjAmO7t6TJkPicC\\/joeNTaSqDhwdBrFd\\/Ub0b\\/jRxiI5fTsfiy5nDy0ZMJn20q8a3WnVq5U7nFp6aQovc\\/SYqjId6Na0bT7KJwKp+yuxNzdxoRe7ek0eAnnQlPfvpL1I777sREBvy\\/nXFqRqOR09nzebwiVL8\\/DxTP18Jp1sVb82N7AuiWHEwYrqZQ5ppss792Gtp2703foOGYs38apO6GJATsjvgem069jB\\/rMOEpAalUsPpyg0BhUVELcXdh9xg0X1zuJz0fH43vhJJ7PUj\\/u5OnTwjxw\\/ulb2ncdxbobfz3TrWSpQLeRDfBdsoorsQAazw5OoF2bDnzbeyCjJi1g3f7L+Ec\\/P8cyUldVokODCDcC5ru4urhxxtUF9+CEbaihtzhx0f\\/PwKX69DxLh3elfbdRrLj4VyBFDTjD5gO3iQXUJ2fZsvcmkZpKwOaBdF54I2GArT7h2DpX1K9GM6LSPeauOENqS6sALwyUtShfbtwNejOr\\/WegvqTnVdpNiyItGTvQkQMTZnAsOO3Ri\\/nZbY6u\\/x+dG43jWGJjl9F2U1ekFaO6lIegC6z9pQ\\/tnL6hQ+9xuFyLfDtBLn0p2o1sQwk9qEH7mDRyLSmyUclO1f7jaBq0gHFrbr9QxqnlX5ptcxoymq+vdI17gUrY7aNs3bCT84\\/iExOZfvuG+TFHZ\\/WjfetODJx7gsBUkmWKDCEkygRE4bFlC2fObGHzlcTzW32Cx7GrSX4Xh9fuSfRu34m+v+3lYWIy0KLx3L+FswEqEMudAxtx81fBeJ5prX5kb7gGmLm\\/dw3uudozvrcjp+e4cD3NoICRS0un4hqgghaG11UvQl9roK2QtcYABtV+2SMcCtlq\\/sym\\/Vv59as8L5a5rghOwzpQxgDGG0vp9U0L2k88TGrNpi5fQ0b+2IyC+iAOz5jKbv+kjbKOnCWKEnNiFb+NncWJP683CtlrD2JAjayvPuvDoghtxgyhpr2Zh1snMfvk0zTOLzM+h35n9uwF7L4dj2XlHgxt0pgew74inw5MHgvo2rwZLX89nnizRSP82i5WrViF640INJMXR51XsGLDaR6ZnrC5fz1q1u2Os9frRz9MnrtZd\\/oJRk0l8vYWNrv9jfXLXpMEMIQQQrwhCrm+qEGhi6e4agTQeOY6gjYzLmAEVL\\/NDB+4lufXTX3BxowaVBq3hZu5n9oAzniXdcNGsNo3P+WLqgQ+iUEDDKXr0zyvBwsnreFKRAzRMalcOo2X+GPoUi6FXmXF0MGsDPmc4X9sxmVKTR4v38iljIwzLEtSvVIMZ874JdyNMV1jfqdBbA1UAY3wg+PpvsAj2Z1KlaA9vzBoziE8Ds1hyG\\/HEjtLRs7O6MTkk3Ep8gXVlx3zd2HbYSKjqgXhvMaNFGvqGa+xa5uJNotWMrGFwtafpnL4hdt8KkHnt7Dzaip3q1RfdszfgXWbsfQr4cGs5c8HeWa8XAYzeP1DVMzcXzuAPis8MaMSFeRHSPKxqdmbM1ejiTq3jBnTZ7D44EPi7+xmzszlnAgAhwJ5MYY+\\/fNOkhoaQlie\\/DjodOl8ll4BpJXHgBrEvoWrCK83gu\\/yn2T+xrQXPtMVrE71XB6cu5dkK1oE13dv5kxaU0AsS1K9isqlC\\/5p3GlUyFWtJkWunuWGMY0yN5Sk7eSFzJs6jkFdqmPnsYqx\\/Yax5rYZok6xbME9Kg4cwMe357PqfPKQmorPppGM2u6Phg77z9vTtGo12jcpmbBCvRbOxXWz2OGZcEyqz1r6dF+W5C72i+nz2jaX3VatGdHSwLaFu19YOE9XsBrVsp7n1B0ToJCtxiAWLJjJxJG9+brEU\\/bNHEbf6YkDtozU1Vh3Zn0\\/n4vxgL4ETdpXo2qT9nyeOGXH5L2fxStOJQ6sTNx0mYN7oV6M65KDQzPXcTOxmMz+bmx0vUaYCqb7h1m99QJBGqhmM9rzgJguD581rUrEjsnMPuhHTExM2gvgJRkoK9o9No79g7MxAEbcJn7NmCNphj5SlE2Kcy3d+mLCa58LJ1MbgQKv1m7qyFVjMD\\/XusfC1VdSDcCo\\/q6MHbSAa7blKG0fQkDigDwj7ab5tguj55wg4O5WRg+YzZ3SfZi\\/cSPznMxsWncq7dlu6VD9TuKy\\/07KwJL5ERcPXX7hLrIuVzHyBh\\/h9MNUStGqBO3Hdif7jsXsfeG8TZl\\/qbYbMSeZ2GYcR6MTvvNCG5yBfE1rX+ld4\\/7MA28Xfhy2DLcru\\/l16AIuxaZMZ\\/JzOMZ9BYu8KjPil87kOb2cnckD6Voo+3\\/pj7OnCtjxccuWVK3aklYV7RIG0zG32DbbhcuJ7bj29BCLnSOo\\/\\/MIvni0hIUHEwfMWiQ396znpJ8Z1GAubnPm8H0joKJqWmId1\\/NhrWaUfriaib+fJigmmtg064IFn\\/YYSZN8OtDiuLJiLOtupNVOpc98dzMTF2fkdbkamvpn6JOg60c5ePAYN0L+KgiL4mX5MP4Zj06f5np80p+qieesQvaqfRnbqRQW4edYPHvPizMcbMvRvk1lLIOP47I3sU9gdGNSkzrU\\/XoqL65dq+K\\/vg\\/1atal19rEmUDGU\\/zSqBa1mkzCPfG7urxfMvynr\\/lAF8ihWQs5mdqBqkGc3b6BrduPcT8mWZhEfcqFg6fxeRZGqK8\\/CYerEXJ5B6tWrGLrhWDMEdfZvWoFK52P4W1SUdWEYzYn5pfp6nza1q5JvZH7Es9v7aWza3QOhXFMfAWQosuLY6F\\/\\/u1xEsAQQgjxGjSe3TjEoZtJOvFqFN4nz\\/Ag4honTgdh0mLw9XlCxCNfQowqkT73eeh7H++wv+7mYmmFhSk+1enK5ocnORxdia+\\/yEc2W0tunnAj2AxKtk\\/oOmkuk7qUw9q2NOUK6QEbbCwC8fGNRUMl9OJRjl7ZyYz+Ezn78WjmDK9PvjAPdq89wEP7\\/OTJwNXPGOzBKY9AvNyPcy9axRTqg\\/+zQB76RKNqsfg+8CEuxdOfKoE+fthV7cjwMZ0ocusKD0yAMQAvryC8H\\/gRpybNF4jzc+ecb37KfVyUoh\\/kRImLJT5FPyaeeKM1tnZZKPhRNcpZ+\\/EwJGk3Q4dNyAVW7rmFSbHE1jqOR76BGIE4v9Oc9S1A+U+KU6Z0AYyXjnMhTEWL88fjxiN8Lp3HL+oRlz18eXThJDdDvHjwOCs5syfrkuiL02bCFMYOG8awYUPpXb8wliWbMnDId9TMpyfr\\/9XmE7\\/zXIrQACNe5zywrl6T4nolnc+SHWbStKeZxwAmTEYVnZUDn9UoT5SPb4oBkhYbSZTJRJjncc4H5CKvfZJCV6yJvO7CjsvJht\\/maCJjzIllH0luhxwpOmZxUZEYzVF4n3DHK1de8ujTKHMM2NjqifZxZ+O8ZVwq2I1565fQrZQeTTVhNCtY5CxHjUpZ8Pd5mqLTaLCyINTjBOe8QolTAc1I9FMfbpzaxsKfBrH0WiR3Lt8kzKwS4ePDUytbbJTU0qdhNJrQdLYUqlmN4gHe+P05gDAT5nmCC74BXDhxjXAVdNa2WJtDuLl\\/KQv2RvNB4TwUKZyNOKOWsbqqs8QKL9yP3SAgKmFKtxoXTsC9ixxYM4WBv+whyO8qlx7Hokbdxu1SNIUrlKd4+ZLkDjrLsZthhD26xcE95wi6dZgd565x6LAHEQ8OsOnIJdyv+BBwbh8nbgcQbjTg+NVIZs0aTr28eoqWLYlN8qoSc4HlEzbgmbSRsS1B6Rxn2b7PD2P8Yx4GKNhYZ\\/SZ9yTnWgbqixZymGVrHmLInkaj86rtpqZiYWWFOT7V8AUh5w7xsFQT6n2YC1ur+5w66YeRDLSbahS3Tx7hzN5FDBuzg9z95zKuRVHiPQ\\/hsusGVvnyYvU6oxTlEW7rjvAg2aBV9T3MH+svE5m0\\/ijZyZk1krAI9cW24PlvFEus9UaMSbeVIv\\/SaDcs85HP9jrH3AKT5TEZyNe09pWyrHzjlRQtlvmxD4\\/y16bHqOE4Zb2Bh58ZtFh8H3jzyMuLYFPCORz81A\\/fcBXUMK64X8Oy+MeULFqYvNZxxKSIGOixsojllpsbd4ITAneaOZZn\\/p6ccV3G+P6zOR3txZWLQRgxEnjmNLdzleaT4iUpXdiSGydP8yQyGK\\/zOzlyJ5gzrvu5enEfJ72iOb99I+fOnMPz2S2O7L6Cd0gMVqVaMm7uNPpVyY5lyXIUTXHpC+HY\\/N9w9XkhIkXJEhrHtp0gOFk7lRFKVghyu4JvugEPjfATk2nbqCWj9wWhqiGcWjqRXyY5c+5Z0uzKTo6soMWF8Sw6oe9hpSio\\/ifYsGY9m7buYe\\/eo9yOtMRCUYnyOMfNeECLws\\/zFvc8z3LwzEOMGPHcOJNFqzeybuUOLkaZUQ0WyRbe1GGfxx4FE3c2zWbx2k24rNzJlRgNLeoyO5w3sXPnXvbu3cfJh0asdaCGXuT83VR6Qrqs5HWwQacGsnvKKGY5b2Xnzs2sXjiJIZ078uMuX8yA+c4OFq7czt7d61l90AszZh7s\\/Z0lv+\\/hlhm0KHdW\\/zYf17smUH05um4jO1y3s2GLO0EamG\\/uYYXzGlb+sZ3LMRpYWZHW8mQ6h8aMnvUTPTt3ZcCUqXQv988vOyqLeAohhHgN8dzd9zt\\/kJ0aZT\\/h1txODN\\/xFJsPKtFiSEv8l33L13+A2ViEMjlW0clpA4rZQNlSBma06czW3AFce6xikaMEjQZPpGQqYwd9UScGNt3EIddjZC3Tjq8vrqJTw6WYTCGYFQuyFqxI85E\\/8rkdQDmatsrJzwOacrKYLf6+eajbqg6BRw9wbe0Amq7RY2NfiLKfN2HclG8orifNZ7y1kJ2M6DiHy4o9per2ol+2E4x0csVKi8auXBEejnGiZ1EbfJ+UoueU5G\\/RMFC6eVc+Gj+Ftu1CiVM1zn+5n6IOKmH25cm\\/qzdN9lpiUP\\/KF2JjKVQiF6u6NGaRXUmaDa9GjuQdPMPHNHXawpSerXG2yk2Zhr0ZWCxppiUMUg0WBsCa\\/3Nqweb\\/daXx\\/qIoXoEULJGLVV0aMY+s5MmpMs6pBTmUOAyVmtDYejM9v16JQ52udHc4yKgOruSrP5iJZdLqIsRxa+cSdhz2IT5wDwsWm\\/imV30+tG\\/AoP4PWTBjGtdyxBIY34xRA0sn5E96n73gr7Q32miJTi2XSh4Dunw07NGKC9O\\/p7l\\/JPqan5G8CpmuL6PH2N08tS5Cra7DaV4w6QDSjNGoYWGhhyShAy3CnVk9p3MyMiulGvRlZN3kA1IzXpuGMmKdF0qBKrQZ2p5SegNqKmVezMGMf0xOCpetTO0esxheNT+WiVtRstbg2+\\/cmDTsG1aGqXw0MPkR6ijw9UgGh\\/2O86jOjAuMwqy3xi5nXhyLlubjL4aytF8E68b+TPtrH2DyiqTG4G8poDNzJ0X69GhOvaj9yxw6twwiNkdzWgPGExNo\\/r\\/jqNmLUq39ED6+Npm2rSwwhT8la8GSVKzelPHzvqRIlBsLJ06h8wYFU3z8y+uqZWV6jXfi92W\\/8cN8P0LjFCxssuNQsDDFylWm3bS15L0wjTHfdWK1ORztw6JYz25Nwyg9OR2ycm+wE4ez6Ih3aMQP3aLZ\\/ctQwgq3Zli\\/x7jMHs3ZYvVxKnaTWf2H8KH9E649NqO3sadYjR6MbFk4xZ059fF1zjw28OULHygoxHJtcTfarAStUAcmVMxoJ\\/yvc+3l9QVM1925aFuMnik2b+LKK7WbrVmkhRBo1pPFsRZ9JnyaytsKdOSu34fOz\\/aw56AVH3zdicgtvWmyLz+a932MabWb\\/Zuwzw6isnyBUxMT7vvPsfunb9itsyJHgVL8X4PhTG\\/3CVak3W6myRiPKcUAD7T4OIyWti8GRWJuc9M3L6Xz6wHDC22BGhgNlrmp0PpHGubXpZt\\/xriyKdsNUwghEUauzmvPV8us\\/2yDO7c5TKHI6zwwpZevGSsrTDpqDOpMQR0vBCQtPm3Nt\\/t+YYTTGsKNKtp39dhVLCvRUYUpk2MlnVqs\\/7OcZ7bpzLbcT7hHURwZQ4tdkLdqDyaUTtZGKNmoO+hnAn9fxYTuk3kcbkKxtCVH3kIUKVGez3rNpY\\/lAX6Z0JkfNlnywCs7JfLfpV8zZ0w2DuQ2zKX9NyvRo6NSh37Uv7yC4WOt+LznCD49\\/gdjp2ahqlNtwrb\\/SI+dBtSAKFS9HXnL1mfQqIbkTl7RVR8uuwVTslPSDxQURSP89FQ69FiLFhBHzcHfUiBZ\\/qRFi4wgyiYrti+54aC3tsPWxpYsNgYUwomK1kCxwNLyr+9oEd54h2josjrgYKegGCrRsG4BLh3w4dCK1VzRRRBsAkXRYZG1IJVbfE0lK0B7wqFpfVl+14SisybvJ3UpFnaeLat9ITYQs86O4vXrUCpppdEiuHLxDiYU9NHX2bzaF2JCsC1Vk5raFU47L8bPXsUn2AyKgs4yB0WqtaNJqoEAO6r3HU93lrPnwjV2LT+PGQNWWbJjn7cE1ZpUpNqndlx0ceHkmhUE2Ydz92lOylYpQOjNc2w+lIWiTfrwZfxB1h52I8a2ACXzx+J1aAmrHtjy1EvD8YvaZPd0Y8tKL3TmMFRdFko2SHZML9CRrXRDOpfOQCG+JUp4+OssOZTg1KlTNGrUKM3PL168SJkyZV5380IIIcR7SiP0yHh6763EgqnNky14+RbEerJi0Ggetl3OuDrZ\\/vHpnO+MFsXF2b1Znm8S89oXyvC0UqPvNn4cdJLqC6bjlO9NFc5rlHn8XVb0m0jswGX0eeuvJUxI3w8Hq7JwUiNy\\/kcqifneCnpPNzB6YWeeLzWghR1gTLdDfL50Kk1SW88lPf\\/Vc+11aOFcmNOPGQxm1aBPsEz6WfQZpnb7A8u+o\\/m2SkGsI+5zeMmvrKYXS36umTIw9rfE471xBCMuN2TRpEbYv6NCU\\/23MWzwdVqsGEPNf9vrToyXmNVpPSUWT6Xp88ZFfcSmgf25024NP1dLMTcqfepTTkzpyx85R7O8T7lXeLVoNKd+bcfoAxHkrdWXH3tUJ0\\/UbQ4snYPzhVA+aDOXZX0rpDm7ICUNY\\/hj\\/ILisc5dgHzZLVM959XYcEJCQwnxu8WZ3S5sOO5FTNbPGLJ4arLg+X\\/brVu3qFSp0ku\\/t3fvXqpXr57m5zIDQwghxNthuorz7PvkznMfU50hNHd8ny\\/iKk\\/2z2KHuTSR\\/g707fl\\/aXSAVGKf+XPbbSMLlj+m\\/oT6KQeybypfNJW4iADuXz7GVucN3HD8gRk1\\/yMDKjWe8Cf3OL9zCYuvVGL4vA9eHrxQjUQGeXHt1G5Wr3XDrsNUGr+R4MVLytx0i3WzPfl8iBNFng+gjVEEeV9m3\\/IF7C\\/Yg3lpznbJiChOL1pGaGEL7lm3ZUDdXClmjcSGPsLz9EYWrgikwYQ6\\/5ngBYDe8VMqRM7A5VBVetVwxCrsDgcWrcK37nB+yqVgfrCFWe42FH78jPKDEhb8S+GfPNfe+3ZTwxz7DP87Fzi8YRXb\\/SsxYubHLwYvAGw\\/o8\\/YRyxa\\/BOdJwRiyubIR3W7MqXHGwxeqLE8fXiNE9tXsuZ8XnpOq58QvHhTeZyh7WiYYp7id\\/0ozvNc0NrM4IsUwYuXncPvAUNxKpV\\/yJq1blToXJm8SjDXt89is6kFv1axIWPHqGGKCcXf8yz7XFax91kdxvYr+wrBCwBbvugxDCffGew4PpeBx+YCoOisKVC9L6O7lX+F4AWAgkW2AhTJlt53VB7vGEmXBTcSHteyyEGxap3p8n1naicGL7Swo8xeEUExvMnxXX9qZsscJWy8+DvTfQpgf0eh2fAm5H9PmhuZgSGEEEK8CcZzTG83jmOKA0XKf0HTjh1pUCLLW+qIqjzaPJz+G4PJX7oKdRo146uqjthljj7RW2X2\\/IPug7cTYV+YMp83on3HJpTL8bJeVxSHxndhyb08FK9Ui4ZNG1OzRPa\\/vxDYK5e5yqPNg+m+\\/CE5PyhN5fqt6dyiEnne1iPEz9Ony0uxCtVp1qk99YravX+Do79FI+b+XhYv3Mipm4+IyVKYTxt1o1\\/nL8iXoXz\\/755rr8PsuYw+Px\\/C9EFZPv+yKc3qf0I+63eQEON5Zn07jcvZilOpXnOcGn2G4z9eaFEcHN2GmVftyF+sIjWdOtGupiPvIjv+CVr4dbbMX8L2c3cJNOWkeNXm9Ozblk9yZqylNXsuo8\\/oQ5gdK1C9QTOa1qvwN9pGE5EB3ng\\/DiNeb4d9wQ8pZG\\/91hZ\\/jAu4xfXHRmyz5yZ\\/wXzksHpPIgH\\/sDc1A0MCGEIIIYQQQgghhHhr3lQAQ8JDQgghhBBCCCGEyPQkgCGEEEIIIYQQQohMTwIYQgghhBBCCCGEyPQkgCGEEEIIIYQQQohMTwIYQgghhBBCCCGEyPQkgCGEEEIIIYQQQohMTwIYQgghhBBCCCGEyPQkgCGEEEIIIYQQQohMTwIYQgghhBDi\\/9m77+goqj6M49\\/Z3XQIJRCkBUHpoiIqqEhRLIAiiCIo6IsoRUHsBRUbFlBUsCBFuiKIoAiGJqASivTeCSSUQHovuzPz\\/pEAoUcIZsHnc06OJLsz89vZuevOM\\/feERER8XoKMERERMRLWaTt30+iVdR1iMj5UVsWkcKhAENERES8i5nMzj8n8clzXfjfW7PZfwFOejwbv6Jz78kcKPR1W0R914vHhm\\/FLOxVSyG4AO+PO4L32\\/ZjbnrBtr9nfA+eHLMLs7BqsZOZ9XJ7Bi53n89aCmE92Szs34Z3\\/8q3fCG15YK1VzdxOzaxL90GwDo8jWc7DWGtB8AidvpzPPLFejynXfyfvI+FUa+cyT\\/bh\\/rcPcKO+4Xnbm9C88e+ZcclujMUYIiIiIiXsIiN+Iq+jzzOgNkJXPnIICaM7MZVrn+zBg+bJ37IlJ2X6Dc\\/kX9FUbRlJ9nrRvHepO2cZ5Qj58LcweQPxzNz0odM2HTamEjkvP2rXwlERERETsuKZ\\/GPv+HXZTyjW4cUzlUWcz+bNkC1ayoSYBRkARd1Or9GncLY9iXDJmPHLL7+6keWH7qaF8a\\/QCOfoq3Iit3KuoyKXFOl+L93Nc6K5e9xQ\\/l27jaK3T+Yjx+srCuBp3Mh2nI+dsoGfvxiODPW5tDs7a95oq4LcFCxZQeq9ZlMRIc3aVLI25SzcFbnodeqF3UVp2CTvuILer6zlLovf80rTUpRoP8VnAtzN7NH\\/U5SlfrcdHN9qgQ7L9SWiphFdkYOzkD\\/IgkT9LkrIiIiF5CHA\\/Pe5fG+k9h1msuinnVj+HB6FJYjhJtb1WfPlImsTrH\\/+aasBJZ+1p0e36wj4+jfkvn7yx480vcb\\/tqfc\\/ZqN03gw0kzGf\\/h5Euw+61F\",\"created_at\":\"2021-09-28 19:35:57\"}]', '/admin/setting/1', '2021-12-14 11:40:03');
INSERT INTO `activity_log` (`id`, `user_id`, `ip`, `type`, `target_table`, `row_id`, `where_condition`, `detailed_data`, `uri`, `created_at`) VALUES
(51, 77, '::1', 'delete', 'settings', 0, '{\"id\":{\"path\":\"admin\\/setting\\/2\",\"_method\":\"delete\",\"id\":\"2\"}}', '[{\"id\":\"2\",\"slug\":\"ZXC\",\"key\":\"xC\",\"value\":\"<p><img src=\\\"data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAABREAAALCCAYAAABJD5QQAAAABHNCSVQICAgIfAhkiAAAABl0RVh0U29mdHdhcmUAZ25vbWUtc2NyZWVuc2hvdO8Dvz4AAAAvdEVYdENyZWF0aW9uIFRpbWUAVHVlIDE0IFNlcCAyMDIxIDAxOjE0OjI0IFBNICswNDMwnwI4yAAAIABJREFUeJzs3XdYFFfbwOHf7LIsbSlSlCbYBewNjIq9xK4xlkSNiSVGTdfUV1NM8iYxrxrzaYyaGJPYEnuNHRUFKxawN6QoHeltd78\\/QGJBQAVR89zXxaW7M3PmmXOm7TNnZhR3d3cjQgghhBBCCCGEEEIIcQ+qig5ACCGEEEIIIYQQQgjxeJMkohBCCCGEEEIIIYQQoliSRBRCCCGEEEIIIYQQQhRLkohCCCGEEEIIIYQQQohiSRLxKdWtWzc+\\/PDDig5DCCGEEEIIIYQQQjwFTCo6AFH2mjVrxjfffINarSYoKIiAgICKDkkIIYQQQgghhBBCPMGkJ+ITTKvVUq1atbu+f++99zAxMUFRFL7++mtq1KhRAdE9feo9\\/zYTOjmhruhAhBBCCCGEEEIIIR6xCksiOjdqR6uaZii3fGc0ac6Y1fvZNqleidMXNe7Dlvkk0Wg0\\/Pjjj7Rr144+ffrQvXt3ABo0aICPj0\\/heDqdjjlz5lC\\/fn00Gs1DzbMs69Jo1ZB+Xyzj76AQjocEs2dqq4cus7w1G\\/Qy\\/erpblu\\/hBBCCCGEEArmPi\\/w4fz17DxwLP\\/8fuPvzB7XHKdy\\/sVpWns4320\\/yuKBlvcYwwT7rjPYEBLCqhEO9\\/UDuMiyVU7UHzqV2asCCD4awqGAVfzyYVfqmBkrNFYhhHgUHmq\\/ZLAfwLf7Qzm2oDfu91nSi9Nn8m5rq9sSMoohlbgrV7gUk17i9EWN+7BlPkleffVVfH19GTFiBF999RXOzs60adMGrVbL0KFDmTVrFhkZGQC4ubkxfvx4JkyYUGK5PeaFERoaesffEX7rb16mdVlrzHQ+bRHJqo9HMmzEBN77Peyhy7zJfdwmjh\\/4gt4WJR\\/Ilc6zCQr5hdfcDWU2\\/5taf7aN3QdCOH7yJCdCDrJ\\/20oWfT2Gbp4Pl8wVQgghhBDicWK0683Hcz+in\\/UB\\/pj6FhPe\\/A\\/fLj9GzI1UUsr+NBsAxdqbjuPn8OfvE+nsdM+xsGr1CfM+qo82u4zKNmZjapbDmSWf8c5rr\\/PRoqvYDPiamSM9C58VNnrpFta86fVIYhVCiEfpIZ6JqMa9\\/3A65caR3PQVXqq\\/ji+OP2Q0hjOsfvsFVpfluPdT5hPC3NycESNGAODg4ADAuHHjmDJlCnv37gUgPDyczMxM3nzzTczMzGjVqhWNGjVi3rx5pKcXnwRUDs9g9KwQsgq\\/MZAWnlWmddm0qROJW+excOc5csugvFtFnD5HqtYLL08j604VpJTVjRg6+z90Ovw+oxdcLJinCVXr1sQiaRth18u+f6GNswuOp6bx8swQsk11VKralB6vjOO7n6zJ6jeNgAzp0yiEEEIIIZ58xtq++Omusvnbz\\/nlSEHvkj3b2XDrOCbutBwzifE9m1K3MtwI28qib77hj7AsjECbSb8wrl1NqjnbYGZIIvr4dpb\\/MJPfj6VRVB7Sod9kPm5znqUTv8T1vx9Qq6jAPIby1VRvwiZ\\/StTE\\/6NrKZen2LKNNziyYCpHbn4+eAYT3y58V6cG5oSTCphb22Frri5deQ8ZqxBCPEoP3BPRaN6GFwY6ceL\\/xjPjsAd9hrbG7s6ciMqJRq9M5\\/ctBzhy9CD7Ni\\/grUY3B2qoPTGAE6GhhIYe5qdugMqbEStOsOOt\\/Gf4NZ96kNAVI\\/AujFJBN3AJR\\/d9Rned123jlrZMyD+A+Y2bxe+b9nHoyD62\\/\\/YJw3wKboNWrKg+4L8s\\/DuYo8dDOLRrFd\\/3sX\\/QaioXvr6+mJub3\\/admZkZ3377Lf\\/73\\/8ASExMxMnJCa1WC4BKpUKn09GsWbMSy1duXOL40aMcLfw7xrkEY5F12WLCbH5bv5vgo8c4FryF2b2tgRLqGDDXqnAcsYqQ0FBCQ0NYM7Jy\\/gBVFZqMnskf2w5y9GgQO5Z+xThfW9SAVceZbD2ygslNNAXzqM3AX4+w77u2VL5lTTacO81Zowd1a1sUzs9Qpxv9Wtaled\\/ONLh5PFd01K7jgsm5ME7nKSXGDCosW7\\/P\\/I1BHAk5yJ7V3\\/N+xypoi6vMpEucOH6cY4cC2bnyeyZ+v4+0yk1p4mostv6Kq4fGnwRzcvVI6hcsh9G0Ax\\/sDmHZYF3BBq1g1m8hh4O\\/op\\/Ootj1uaRlvmd8dxg5ciRhYWHF\\/o0fP764mhJCCCGEEE+q6HCu6J3x7dEKN9Oi7gaywPutBcx5Dg7NHMdLr0xhUUoHJs16mw5W+SnCGr7NqXpxHh+NH8Nr781hY24n3po3hze8ir7wHvf7i3QaPIV5wYnkFDHcqPHmhS9exWXpu3y5P52S71EqfdmFVDqcnxlOf584gnYe42ZXjVk9WtDu69BHEqsQQjxKD9gTUcGywxD6spr\\/bDxFYPwu3vzmRfo672Fh9M1sjjk1XvuZ+cOz2P3jh8wJTcfE0ZasSCOgALlc+XU076xNxoiB9Gt37ypDAo+Q2t0PP6eFnLquADqa+HmhDllIcIZC77umKLnMwgPYs2f59Ztx\\/DfGgaajpzBpVg7Rfb5km\\/MYvvyoBek\\/vsPLgclgXx2760kPVk3lpHr16nd9d+zYMQICAti+fXvhdz\\/++CPDhw9Hrf7nKpi7u3uJ5RsVFSZqdeELRIxGIwZD0fcheLdrS82r3\\/LxF6Ekq21Rwm8AlsXW8Y40FWAgftUbvPp7JAaMZMfHA+bUev1n5r+Qyrbv32XWBVM8er\\/FxNlzsBgxlO92fsln21Yze\\/Io\\/n5hHhHPfcY7Vf\\/mv5MCiDH8c3KhxJzgRKyWwfVqoVlzkhxMqNaxHa6BG9jesBtdvX\\/kyEkFo9qbenWNRKw5RZKx+PUiP2YFrWkCR37+mAXXNbj3GM9b383FYswAPjmUV3ylqkyxdG5Ej54NMI9eycFIpZj6syi2Hr4\\/eJz03g1pZGvgZIIKY7WmNLE1oWZDb7TLDpCJFq9GPmhDV7PbZSyz77k+l7zMRcd394nczz\\/\\/DMA777xT5OLPmTOH2bNnF19HQgghhBDiiaSKWMQnn1Xnu\\/d\\/Yn37k+zdsJq\\/\\/lxPYEQ2RsBo050RA6w58sV7\\/LA1v+dh2BfVaL1pON2bfMmOPQBGsi4FsSfoInkcYP++8+Qt+53RL\\/ky84Pgu2dqMBTZQzGfBtehnzOB2Yz89TLZRrv7W6Biy85n2nM+e7\\/yw1LJJXbju7y0PvHe05RnrEII8Qg9WBJR5UH3gb5kbPiWwAzI2beMVXHzeb6vJ7\\/PuUoeYNB14ZUX3Yic9ywf\\/Hqdf1Is\\/yQgcuIvc+F8fMEOVbmrX2TuwV3sz5uEf0tLFq7OwGD+DG2b6zn5wwGSjW5FhlZSmSUdwLZmVcJeSSbs0EGOn84DTj1QFZWnOxN6x48fZ+jQoRiNtydN09PTSU1NxdbWtvA7larkzqfGDt+z75Zb05VLsxjabx4hRV4SM5B5fh+7D1wsaGOl1CcJ+sSrXDx\\/sXDdMFp35eXBLlyd9ywfL7mOHjh4JBJtrRW8M+IZvpsYyN5vv2btX5\\/zySdVuObvxJHPX2V93O1JLSUvlGNhBsZ416Oq6iQXlAZ066zj0P9NZ03OJqZ0rct3J8+S5Vyf+pUSCT1+hVyb50sRs57EnQuYu6og5uBLqKuvZuLgZ\\/jk0J4i61Lf+QcOnFAwKgpqRYHMM6x+92f2Zxb2kby7\\/kqoh2+\\/3c8RRtO8kQm\\/7wC7pk3wTE9B36g5DUyCOWD0pkUTLZfXHSTRpsU91+fStdPd8d3LvRKJkkAUQgghhHjaZRG17n2GbJ1F\\/Y696fvca\\/xv3Wucn\\/sG4+eFkejphZeFJR5T93Pk85vTqFBr9Bx3sAQy7ypRyQ4l8NANJrSoBxSRRCyG0ek53n1ZxYbXl3M6VwF1ydPcr5yATxk6xIUq3p0ZOm46f0ydwMCP9xFzn90IH0WsQghRVh4oiWis+RzP+5xg7afnyUWFknOE1WuvMqpfH5otmEVwjgLV61PfPJJDh6PJe8C7ppXknWw++BHftX+GSmu2k9i0A+20+1m4KxkDRScRS4y9hAOYasMS5gbPY8r8ddTe9CfLl61iy+kUSuhn9khFR0ff9tnR0RG1Wk1e3u1Ruru7Y2Njc9t38fHxJZavOjSN4d8d\\/udQnh3LJT2lvvm9pDou6iQBwFitHvXM8tcZ\\/c2Z6S9x+EgiGv96QCCqxI1Mm96Tjf\\/tj\\/v+9+m2NaWIq3rpnAw5T+4bTWhstYTzNXrR22Y7c\\/bHst\\/kCGZv9cT3h7Ps92mEjyGEmaEPGLPhCiEnkjDxqwMUnURUBf2XgdOOkI0as0rVaNBzLK\\/P+B0mDGJyUNFPTC6pHlTxfxNwaiJv+flgujOSpr7VOffrT1wf0ZmW1WYRnONHS5dz7N0bjfHSvdfnB22n4tyZSJQEohBCCCHEv0hWFCc3\\/sjJjYv4bdSvLJ\\/wCaN2D+BbFBRDDDsmj+KHsFt\\/VBjIisu6Z3FGowGU+3+OuEWbHrSzq4Fq4WEGAKCgMlGjfmsrh+uMo8mH95eULFJaFOfDojgfdpiDGZ7smTqcXj\\/sZcE1FVorHZrcDNKy9Y9HrEIIUUYeIImoxbtvL+qaOeCz\\/hRjbx1k6MsAvzkE78nPOD30ayOMCQRuDiZjyrN0tNvHhS7+2B6awpZ4VXEdokpQ\\/AFMyTnFqnFdCfbrx+CXhjNl+SuM+OFlnp9\\/8WGXpswEBQWRm5uLRpP\\/bEAXFxc++OADvv7668JEopmZGZ9++inKLQfd3NxcgoKCSp5BylVOh4Xx4O9gfrCTBFBKblbFljpN62CZkU5e\\/Wfp7LqR3yLunMpA\\/KFgzpk8S1Mfc8537kSlve8SkAZZgZvZ9fGb9PObQ1LjelicmUXwDeWBY1YUFRjvfblRSYvm0vnzBem4M4Qevo5Vw98Z16cxk4PudUJQQj0YIgjcc5n\\/9PWnge4S\\/g3PsH\\/GRiKaT2C4nxO\\/5bWhwbWdzLqgoOQVtz4\\/aDsV7+effy58FuecOXMeuBwhhBBCCPGkyuDy\\/iNEvd4fT1cjytGznM15Du+qRqI2XC7+OYM3qTxp1NCOvAtn73vuWVve57mj2n\\/OqdVeDPrhK1ptG8Vbf5T9nWZGoxGDosGk4Nf16+v2MyBgKH6fl\\/zm0UcdqxBCPIz7TiIazVvTp5s15+YOY8r2zH8e+qo44D95Lq\\/2aYXd3j0kXj3DmZx+NGnmgsnx63f15MvMUrCytkJFfDHPhzCSuXs1m7Om0qt3by61zWX\\/lwHE3Xys4gOUqVwtxQHMmE500B9MD1rNpomrWT6kP8yfVlLVPDKpqamsWrWKQYMGFX43ZMgQ\\/Pz8CA4OxsLCglatWhW+ufmm9evXk5RU\\/s93LFUdFzXd5VBCs\\/vTpJkz6uMx6AHU1WnapBJ5Z8IABfM2HzG1ezi\\/vvIV1yct4f0pfQl8dS2X7mhw5eJ+9scNp0enMeR1zGDn+4dIB5SU7azd\\/SGz+48kqqo10bsOEmF4sJiNpj4809yG7DNhpa4bo8YKnRnk5dx7DiXXg56o7ds5ObYL3Yado13iHl6PiCU68BKfdXyegXovEndM5mRewUZyj\\/X5QdupNCR5KIQQQgjxL9LwVf7bF44fPENEYjZG25q0erEvtTMPse6MgpK0iUWrRvHbK7OYrp\\/HXyGxZJm7UNvmImvWh5FqBFBj134UY8O3cvS6CW7dX+eNOhdY97\\/99x2OMS2aK2m3fKG2JTEXchOvcjn2wS+WAxi1Tek\\/ui55Jy9wLV2Nrlprnh\\/bEu3xz9gelX9hPuL4YULC00ooqfxjFUKIsnbfSUTTZ\\/rQ3eYQi1Yd4XT0rb2XVMRtOcNr4\\/rRrVIASxM28evKUfwxdg7TlLmsPp5ItrU71pHr2XY2j1PnDIztPpZhJ1YSprhTOXEL60\\/ePT8lfTcr\\/85gyYRJ+CQt55092Rjv0U+rNGWWdABLcevEC81zuHAuljSNK741rFDdeLxerALwww8\\/0KZNG1xcXAq\\/q1atGtWqVSty\\/JiYGKZPn\\/5IYivdSUIR06X8zcKlo1g6+nu+yJjNqgsaPHu\\/wxs1Q1ny5T6MVm2Z8GFH8hb1Z\\/6pK2R9Pp9uyybxSf9AXl6RcFviWMk9yq7ANF557mV6Rc5n5BED+ZnnNA6u2078nFEMU19m5aeXyENVypgVzKr70qqFLelmVWk68HVedT3Kbx\\/f+xYDY6WaNGqSRo7GAuvKdfHtP5zBDudZU9TKXsp6AFCFb2T9mTF8MNKF2IWzOa03krNrB8feGMOrynmWfneOXFQY3e+9Pj9oOwkhhBBCCHErbU4SCZX6M\\/SDUbjamUJGHFdPbmTGuFn8HqUCUjnx3QheTZrI6\\/0m879xFqhSo7m09Rt2bKDgvNNITq49TUZ\\/xSsuJqRfDmLNpK+YUdILDB81C2ucvPrSd3ANXHSQFX+Jk7s+ZfTslVwoeNnj8rdfZnkFhymEEOXhvpOIbXq3we7E52y9fucD8gzE7djKkTfH0LtLJZYuTSZ0+suMSZ7Em89PZcbrphgSL7D7u11sO5tMwIypLPlyAmNmPIs27TIH\\/+9gkUlEyCJ0xWpCB72Mw5o\\/Ccy6942epSuz+ANYmr0X7V4ZzDvu1mjzkrkWtpXvJv9xv9VU7pKSkhg7dixz5869LZFYlJiYGEaPHv1IeiHmK81JQlEyOffDKMZkfsA7I\\/\\/HT5UMJJ\\/dxW8TvmHuSQMe4ybyAn\\/w+qLLZKOgXP6Vr5f0Y8W4cXTZ+jl\\/p9y6bmRxYnsgsQO6kLtpPcdy\\/xlmOLKaddF9GW+yg22nbn5fcsyXDh8lqv14pv2kw1SfxLUT25k1Zga\\/nSp6gW5cjya+2xv8tEiNos8mPTGay6EbmDlmPn8czi2m\\/oqvh\\/yFuMzmNSG866Nh65b8RKgqchObQsfTwmQFK8\\/mb5+qYtfnB20nIYQQQggh\\/pF9+k++e\\/NPvitmHCUvioM\\/vc2wn+41hoH0wG8YM\\/PifT2PXsndxletGxc\\/kj6Eeb0bMe8+yr1X2UrSLn4av4u7F6Pk522VZ6xCCPEoKO7u7pIqeILZ2dkxYcIEnnvuucJnJN6Um5vLmjVrmDlzJsnJyRUUoRBCCCGEEEIUb8SKEwwL7EfX+0wiCiGEeHQe6O3M4vGRlJTE1KlTmTFjBi1btsTZ2RlFUbh27RoHDhzgxo0bFR2iEEIIIYQQQgghhHjCSU9EIYQQQgghhBBCCCFEse58sKEQQgghhBBCCCGEEELcRpKIQgghhBBCCCGEEEKIYkkSUQghhBBCCCGEEEIIUSxJIgohhBBCCCGEEEIIIYolSUQhhBBCCCGEEEIIIUSxTIwGTUXHIIQQQgghhBBCCCGEeIxJT0QhhBBCCCGEEEIIIUSxJIkohBBCCCGEEEIIIYQoliQRhRBCCCGEEEIIIYQQxTK59YOFuSUOjk5oteYoilJRMQnxVDIajWRnZxIfF0tGZnpFhyOEEEIIIYQQQghRaoU9ES3MLXF188DMzEISiEKUA0VRMDOzwNXNAwtzy4oORwghhBBCCCGEEKLUCpOIDo5OkjwU4hFQFAUHR6eKDkMIIYQQQgghhBCi1AqTiFqteUXGIcS\\/imxvQgghhBBCCCGEeJIUJhGlF6IQj45sb0IIIYQQQgghhHiSyNuZhRBCCCGEEEIIIYQQxZIkohBCCCGEEEIIIYQQoliSRBRCCCGEEEIIIYQQQhTrsU4iOjo6YGNjU9Fh\\/KuYmKgrOgTxAHx8vCs6BCGEEEIIIYQQQjzFHuskopOTIxYWD\\/YW2yEvDOS110aVcUSPj4kT3+TzqZPLpCwLC3N69e7B\\/AX\\/R526de57+sqVndiydS21a9csk3hK436Xv3OXjqxdt7wcI6pYGzauw8\\/Pt6LDEEIIIYQQQgghxFPKpDwKtTA3p4\\/OgkpXLnO9WnU2p6STkZlZHrMSD8HT04NevZ+lY8f2pKens3nzNi5fulLRYQkhhBBCCCGEEEKIx8x99US01pliZqZFq9Wg1ZqiNVWjMVHQmKgK\\/lUwMVHR3rky7mdOU3NgH6qGhdLC0qy84n+sfPTRRDp0aFvRYZTKhNdf5ad5s6jq7sb\\/\\/jeL4cNG88fvS8nIyKjo0B5br702ipo1q9\\/1fc2a1Rk2bHAFRCSEEEIIIYQQQgjxaJS6J2I7P2sqV8qmac0zaNUp5OWZotfnkqfXYzSqwKAHjKRlmhO9Mh4MpqAxBTMzTBMSAaXEeVhZWWJtbY1Wa4peb0ClKvu7rV95ZRjp6ZksX76izMueM2c+2dnZZV5uWbO1taFXr+78OGcBa9asr+hwnhjbtu1kyicf8vln\\/+XChUtAfgLx5ndCCCGEEEIIIYQQT6tSZ+mGdNxMXferHD5fh5QMO2zUF7DThONgFom99ip2plHYa6NJynIj1sOeBH02MVsCSdeac8bRqcTyzc3NsLCwIDU1lZiYODIzM8slifjXX6vZuHFzmZf76thX6NSpA59\\/\\/h8aNKhXZuWWtg6mTfuCxo0bsmr1UnQ6XbHjpqWlcf16LM1bNEFRSk7uPg7efGsczz7bpUJjuHDhEp9\\/9l+mfPIhNWtWvy2BeDOpWBGsra0B8PaWl6sIIYQQQgghhBCifJS6J6Jer1CrykGcbS4SfL4NZ\\/Oq0axqEFpDDEYgOr0BYVF1cLONoWXDjVxWqzmd7cAugzUpsXEllq\\/VaklLSy+8nTYjIwMnJ8cix1WpVJiY5IeuKJCbm4fBYCjVcmRkZJZ63Fs1aFgfj6rurF+\\/qcjhS5f8hV6vZ9euAFJT04udRlEULC0tCj\\/n5OSSk5Nz2zg6nY5p332Bp6cHx0JO8OOPCwgPv3rP+L7++n+kpaXz2tg3SUtLK3ZZ8vL0TP38a6bP+Joxr77MT3N\\/KXb8W1laWpCbm3dXvGXJ378VRqORvXv3F37368I\\/yM3NLXHam3Wblpb+0HEU1X63JhKBR55A9PPzZemyxUUOmzzlYyZP+fi276Z+\\/iW\\/\\/LLwUYQmhBBCCCGEEEKIp1ipu\\/opioLKBCw1CbSruYaaTpfZebotZxPbcSiqO+diqtHSI4Cauj3YWupp5JtDbhUTUrJKvr33Zm+70iSJAKpWdWfgoP4MGzaYl18ZjouLc6mmGzToOVas\\/IM1a5fx3IC+tw2rUqUKw4YNxtTUFAAHB3uGDRuMhUV+sq9hAx969X72tmns7SvR7dkumJiYkJKSikajoXmL5oXLU9Q0kP\\/W6ZWrlhT+DRrU\\/65x+vbtgZ2dHVM\\/\\/4aMzAy+nzUND4+q91y2hIQknJycuHEjBaPRCICZmRmdu3SgT5+e6HRWt41\\/4cJFpk+fRf\\/+fejcpUNJVQfAiy8OYsXKxaxY+QfPP393zLdq1KgB3bt3LfysKArDhg3G1dX1ntM0aFifzz7\\/mLffeZ3uPbreNkyr1Ra2zb04Ojkwf8H\\/sXLVEn77bR61ahX\\/tugHafOKFhx8gCGDX7ztb+rnXwKwYsWqu4atWLGygiMWQgghhBBCCCHE06D09wurjKgUUKlBMYGquuP0qL+WHL0WJ+s42nqsxVwVh6JW0OshNxtUhvK5Vfb69Ri2bd3Jpk1bWbd2I3Fx8SVO417VnUGDB7B+3SZ27tzNmDEvY29vVzjc2aUyQ4cNQavV5o\\/v7sbQYUOwscm\\/VVQp4rbiqh7uvP32eMzNzQo+V+Xtt8djY2uTP42iFCb0bpWUlMykSf8p\\/Nu6dedd49SqVZMDwQfZty+Izz\\/7mqNHQxg56qV7Lp9arWbBz7Np2Kg+ABqNhu9nfcurr77CCy8OZPqMr+9KwgXs2suqVWsZO3ZUiQm6Zs2aMPylF\\/jzz1WsWrmWUaNfon59n3uO36hRfbr3+Of2Y5VKxdBhQ3Bzdyly\\/K5dO\\/HFF1M4FXaWXbsCcHCwv234Bx++y8CBxScu33xzHOnpGXzz9XQyMjMZPWZEseP\\/0+b5y+7m5srQYUMKbw8uqv1uvYX51lubH6Xg4AO3\\/d3sabhyxcq7hqWkpDzS2IQQQgghhBBCCPF0uo+eiIb8sVX5txArJqBWsmlYeQueukMoKlBuLc1I\\/oilYDAYMBopTOaUJCsri5iYWK5du0509LUiX2ai1+ehMdX8E07BLcz79gUTHHwIo9HIrfmhap6eANStWxuAOgX\\/evvUBcDR0R4nJ6fbbkN2cHAA8pNPAB5V3QHw9Mj\\/18bWhpSU1Ltiy8nJ4cTxk4V\\/MTGxd42jMdWQmZlV+Dks7Azu7v\\/04svNy72tvkwLlvXmbcZeXnXw9PTg\\/fen8NrYN3FxcaZ586Z3zSdwbxBWVpY4ODrcNexWDRr6cP36dRb+8ju\\/\\/rqY5OQb+NTLfwZfXl5uQQzawvHNzc0xNze\\/5XN+ojUjvei3Pw9\\/6QXmzv2Z5ctXcCD4MK6uLrclEk1NNbfdQn3n8ms0Gho0qM+ypX+xc+dutm7dhZubW+HwvNxcTEw0tz0D0skp\\/1mdVW+2m6cHANWq5ff4vLP97nwG4p3PSBRCCCGEEEIIIYR4WpX6mYimpqr8FyzfTCSqQWXMzxWSB0ZD\\/mBFDyigB1RqFfn\\/K1l2dhbW1tao1WpycnJRq9UP9WKV6KjrtGrVkk6dOmA0GkhPTychIZHPPv8PZmZmREZG4ePjhc7ammrVqtKlS0dyc3N56+3xHDxwiPYd2nH9+nVee200XnVr066dP6ampkyb9iWnTp3m7LmLjBjxIgCvjRvFpk3bGDToOdLTMxjz6ivY2NjSuvUzrFu78YHivxoeQavWLQkKOkgl+0oMGNCXAwcOFg6\\/dCmcLl060q9fb5JvpNCkSX30ej1XwyMAuHb9Onq9nhdeGMi+fcGkpaXj69u0oE1Ar9djbm5G7949SEhIJDYm5p6xvDJyGN27dyM3N5caNatj0BvQ6axITcl\\/9mJiYjLJyTcYOmwQ27btxExrTvsObbGxsWbosCFERUbRokVTcnNz7\\/lcx8TEJAYNeo7Wrf3w8qqLWq1m\\/IRXOXI4BEtLS2rWrMGfy1cVufxWdvPeAAAgAElEQVR5eblUr+6JVmtKu3b+aM20+Ps\\/Q3z8P8\\/ivHw5HBMTNePHj+b0mXOoVGqGDx8CwNjXRrFp4xaeH9gvv\\/3GvIxOZ31X+3Xu3OGuZyDeTCR27tyhQl+uIoQQQgghhBBCCFGeFDfX6kaA2rXvfWsqwPfvH8RKm4heD4bc\\/D+jUcGgN2LIA6M+P5Go14M+F7KzNfx1YiAnzyaUOhhzc3NsbKyxsLDARGOCAsTExpGclHzfC6bRaBgx4kUaN26IxtQUnc6SzMxswsPD0Wq11KxZA2trHfFxCVSyt+P48ZPMmDGbiRPfoE6dWhwLOcHs2fPyP9etzb7AIEJCTjJ02CCcnBwxGo2cPXue339byrjxo3F0dORU2GnmzVvIW2+Pw9PTk32B+5k5czbZ2ff\\/EhJbWxsmvfcWDRrUIyEhkR3bd\\/Hnn6sKy9JqTXnv\\/Xdo3rwpCQmJWFlZsnTJX6xatbawjA4d2zFs6CCqOFe5LSGbnHwDW1sbDAYDV69GMOv7HwkLO11kHM2aNeHLrz4hLPQUOmtdYa+9E8dPMnnyF2Rl5feW9PVrzvjxY6hc2Qm9Xs+ZM+e4di0\\/kZuQkICVlRW\\/\\/7aUDRuKfjO2TmdFG\\/\\/WWOusuHwlnNycXN5+ZwJOTo5kZ2ezb18w334zo\\/D24luXH4zo9QaCgw7g5V0Xe\\/tKREVF8920WVy4cLFwHi8OHUy\\/fj3R6w1YW+vKtf1K49y5sDIr6\\/KVCwwZ\\/CLBwQfKrEwhhBBCCCGEEEKIm0qdRBRPLn\\/\\/Vnz08SReefk1oqOv3de0g4c8zwsvDKRvn0EYDAacnBzRarVERESWU7T\\/HmWZRHzrrTf45Zdf5RmIQgghhBBCCCGEKBelvp1ZPBkURUGns8Lc3BwXF2fatWtN126dWbLkz\\/tOIAJoTNTk5eVhKHimZGxsXAlT5PdeHDCgLyEhJ9BZW7Jg\\/iKmTfuCJUv+YvKUD3hp+BhSU+9+VqR4cDNnzqroEIQQQgghhBBCCPEUkyTiU8bBwZ4\\/Fv9c+Pny5St89ulXBAUdLGaqsnXyZCiXL18mOzsHpeBtO1OmfMGcOTP4+KPPSEtLe2SxCCGEEEIIIYQQQoiHJ0nEp0xy8g3eeedDMtIziImJJSOj6Lchl6fs7Jy7niOYmZnFe+9NJikpqfC5hkIIIYQQQgghhBDiySDPRBSigpTlMxGFEEIIIYQQQgghylPhK3uld5gQj45sb0IIIYQQQgghhHiSFCYRs7MzKzIOIf5VZHsTQgghhBBCCCHEk6QwiRgfFyu9o4R4BIxGI\\/FxsRUdhhBCCCGEEEIIIUSpFSYRMzLTiYoMJysrQ5KJQpQDo9FIVlYGUZHhZGSmV3Q4QgghhBBCCCGEEKVW+GIVIYQQQgghhBBCCCGEKIqq5FGEEEIIIYQQQgghhBD\\/ZpJEFEIIIYQQQgghhBBCFEuSiEIIIYQQQgghhBBCiGKZ2NjYVXQMQgghhBBCCCGEEEKIx5j0RBRCCCGEEEIIIYQQQhRLkohCCCGEEEIIIYQQQohiSRJRCCGEEEIIIYQQQghRLJOKDkA8PfR6PdnZmeTl5WE0Gis6HCGEEEIIIYQQQghRRiSJKMqEXq8nPT1VkodCCCGEEEIIIYQQTyG5nVmUiezsTEkgCiGEEEIIIYQQQjylJIkoykReXl5FhyCEEEIIIYQQQgghyokkEUWZkF6IQgghhBBCCCGEEE8vSSKKR8ra2po333qD4yeOcvzEUd58642HKs\\/N3Y2ffvqRvXsD2Ls3gJ9++hE3d7cyilYIIYQQQgghhBBCgCQR\\/xV0Oh3TZ0zj2PFDTJ8xDZ1OVyFxDHj+OTZuXMfIkS8zdeqXfD\\/zB0aOfJm9ewMYMKD\\/fZfn5u7Gxo3rsLG15vtZP\\/D9rB+wsbVm48Z1kkgUQgghhBBCCCGEKENlnkR0dXWpsCRVUTQaDZaWFo98vjqdjrFjx7Bs+WKOHT\\/EseOHWLZ8MWPHjimsn7p1azN9xrRyj2P+grm4urowauRYXF1dmL9g7iNtoy5dO7N3bwBTpvyHlStX0bpVW1b8tZJffllI61ZtWblyFVM+mcyGjevw8\\/MtdblTJv+H06dPM3jQi6z4ayUr\\/lrJ4EEvcvr0aaZM\\/s8DRmtK5Xpt6NDY+YnJsCvW1Wj6TBM8rJTbvjd3a8gzLWpiq9xjQkDl6s\\/oD8bTxeVJWdqKoqGyT0v8vBzllfaPGcXBh069OuBlXcyK\\/m+kqkStlm1p6mH2UMUo1p408\\/ej5n3U711tonGmSbfetKmufahYxJNHts\\/HiYJ1bX96dGuEY8EhX9pHPA4Uh\\/p0G9CdhpVkPRQPS0Hn2Qz\\/lrWQ3ZoQ5adMMwd169Zm2fI\\/6N2nV1kW+1A8PD3o2LEDtrY2j2yeffr0YtPmtfTu05P16zcyauRYRo0cy\\/r1G+ndpyebNq\\/lhReHMH\\/BXDp0aFducdxMICoKjBo5lsOHjzBq5FgUhUeWSJz23bf89NOPbNu+ndat2jJz5ixSUlIKh6ekpDBz5iy6d+\\/F6dNnWLpsMdOmfVOqsv1a+vLLL7\\/e9f2KFavw8qr7YAErZrg1aEEjD5t7bxxqSxw9a+Fmc+fRyQRdlWrUcLbi0R23VDjUb0u7hvaQdctzKRUddVt3oJmzyW1f30ldvQujR3bH565lKSOKBV6Dv2RZwGFOXzjL6aMreaOhunzmVZ7MauDbqSWe5tnoK2D2prau1KjmyJ3pIPPa3Rn75gja\\/IuTwCobT7zruGKjqbgYyrMdFDN7qtasSqX7XT51ZXyeaUYte81D7Y9Ulerg28KLKmb3LkWxachzEyYwqJk9CkW0idqe6vVqUcWqYNtXOeE37HVe6+ON1VNykn9nHRQ77oO26RPoQbbPe+3vHi8Vcbx\\/WApWrnWo61kJ04Jv7rt97nn+U5GexLZ4zJRBuz7MdquycqGGZ2V0JtKCwIMdIx+wDRVdNVr3f4nX3nqXiRPfYmwvL8qv640J7u1H8saYLpTfNUUVlWq3oLlXZYo5bXlyPJb7XCEou041devWZv6CuezatZvFfywpq2If2oXzF7C1scHfvw179uwlOflGuc6vT59efPb5FKZNm3FXPRw+fITFfyzhvffe4b333inXOO5MIKampgKQmprKqJFjWfDzXOYvmMvoUf8MK2s+Pt4MGNCfIYNfJDj4QLHjRkZEMmnie6xcsZKlyxbz\\/awfiIyILHYanU5Hyo2Uu76PjIgs19uZFSsvOg\\/wJ23990TeuCWlpHKgcc\\/++IT\\/xU\\/X0ngkr5pROeHlZU\\/aue1E3vKCbMWmLt6ueVxaf4msRxHHPWgav87sqR2I+vETRgZEkmNuQvwFQwVG9GAsanhRTR3JnqSadH+hEe4ONlhq9KTFXOTwrh0ciSrPWlbj6tePvs5H+e1K3G1JYX1GEnFxKlKy5cVGFelB20HRVad1l3Y09KyEaU4i4ccC2BJ4ibRbitFU92dAd1N2zr1KYm4ZB15GjLlpJMbFY5KaU8oJskmNjyc+PZ28p2TVvZ86eBLatOLce39XWuZuLejcsRnVHc0xpEQStncrAaeTyvYCUEUc7x8D9zz\\/KfBI6v5O\\/9K2KEsP364Pv90+FhQL3Jt3oF3TGjhZKmQlRXE6aBd7T8WTWzDcpdEztGpcCxc7C1Q5KcRcCmH3zsNEZd7frNQ2tWjVuQ31q9phmptMRGggO\\/acJUlP0cdIdS16vtEPb9NbCjEkEPz7QvZcN5TYhkUvrxX1uvamufU5Atbv4Hqmgqk+iftclPtgIOtGPPEJyWRWxBX54mir0LBdO1rUccHaJJeUa+c5HBBAyLX7OL9XzKns1ZgmPjVxr2yH6ZVNzN1wnrySp0Rl5Unrvr1plrGd\\/1t1iptnEg\\/UrndRY+XmQ5PGXlR3dcJGH8rKn3cRaQBQsG85jJf9q9zWeSbv\\/IZb4jDDuUl7OrSoTWVLyIi9wOGdOzl8vyu9eKqUSRLx1gTilMmflUWRZerw4SM0a9a03BOJOp2OiZPeLjKBeOs4TZo2LZf53zqPohKINz3KRCJAZFRUqcc9deo0ADbW1hSfQhQAahcv6tre4Mzp6FtO5hQq1a1LlewLBF8p5Y\\/68omOqr6+uKXs4tMfNrL\\/if2xbEVNbw+Uq9s5l5AOpwM5eT2ZLBMnGnfuTPteWcTO30FEBZwQ5UQGsfLxuWbzr\\/Vg7WCJT5deNDELYf2iE6TYNqF77+74R\\/\\/EpotP2MaScZFdyy+WfnzjDcI2LyWs\\/CJ69O63DkT5MK1Ouz6tsT+\\/kSVr4zH37kyfbh2IvbqSk+kVHdxTTur+6fSvaVcV9s378lwbc87vXMOWyBxs6\\/jTucfzmOf+ysbzmajs69OuRWWSju9lY0w6agdvWrVpTz91Gj+vO1P65JvGjTYDetHIcIrda3dwQ1eH1u168pw6i9+2h5NT1DHSxBRTVSZnt6wgKPrmCaeejMSHuDCvqkJVNxNiAvdz7OKNR5CANxB3dC1Ljpb7jO6PoqNejwF0qhzF3o2LuZRuSbWWnekwsCf6hSs5kVKKmtG64NunD82trhF64jA7gpNITUks+QKKxpZqjfxo5etDFXM1hrI+jVAsqda2H919FK6cCCU4dB\\/JaTf4Z7VRMDU1xXD9ACv\\/Pk16waIas2\\/kJ85RsG7QgwEdK3N9\\/1ZWRRlwbtaetgN6oV\\/0FyHJT+oVA\\/GwHjqJ+LgnEG96FInEF4cOJjU1rdiemJPee4e6dWsXfk5LTSvTGEpKIN70KBKJYWGnAHBzdS2xV+FN3t5et01bUdTubXhpXDdsLFTkpl7nwqFd7Dx6jezCMUyo2\\/dd8m+azuP8+v9j9RkABV2TwUxsAmAk4\\/gKfvz7CpZ1O9C1RTUcK1ljoYHctASunjlM4L4w4gryfKaVG9GhY3NqOdtgasgiLf4Efy\\/bQ3ieFV49h9LF5Qqbfvub85n\\/xODmVQddUhhnrt9yEqFyoK6XExnn9xKeA5i40OHNKUwc2JKa9moy4yPYO3Msby4LLxjfjQE\\/bGOYqzOWhiQuBa1i+mffsy2iIJFh0pDxf8zg5frO2GrzSL5yhPU\\/TOWbtRfJAlSVmjPq0w8Y3s6LymY5JEcdZ8Ebr\\/DTSTC3MEdlP5BF5wfml5W9mXH1X2er2wvMnv86rdwrYW5IJfLENuZP\\/ZIlJ+\\/Ri0DR4f3cm0wc1R3f6rYYU6I49sskXp5zjFxFR72B7zBp1LM087AiO\\/ok23+fzre\\/HiJeD6DCtecUvhnbmloeVahkYUJO3Bl2\\/LGYw7bt6d+lBXWczciMOMSf\\/\\/0P07ZF3XbQV6xr4eVu5MrfF0lPySQk5OaQOA6fbkL9ljqsTEDRutO8Yzua1HDCykRP5o1rHF7\\/FwcK2sbErhbPtPWljrsjOnUWCVdOsGdHEJdTb7adFqf6rfFvXge3SuaQdYNrhzexIjgmv5mcWvPye60BMCQE88cve4ir2pWxA1w4\\/tsiAmMNgIKlW1P8\\/RtT09kak+xkos4eYs+eE1wvWHlVjg15tnNj3OxtsTQzQcnLIPFqKIHb93G+1Fc5zfBs04PWtZ2oZGOJqSqPjMQozocEEnjsGpnG\\/G3Byqsrz7evg52lBiU3jdhLIezefoCrGQDmVPPvQevajthZW6BVG8lKKWJbU8xxaexPm0bVqWJnhj4lmnMHdhFwIpaiUuRql1a8+Hxj8oKWs+xgPHZNn2dwa0tCV\\/7O7kg91l4deda3Gva2OixMVeSlxXIx5BhR5jXwqeWGo05D7o0ITuzawt4LKRgAVM74DepFsyo6zEwM+b0T9u9g96kE8gC15+3tUKo6VtngYK8m6UQYl+OTMSZdIDqzAdbmauCOJKLagy7j36MLgD6SnfOXcviGCZ7th9Ctvj1WWhV5GQlcPRnI9sALpBTuDlTY+XRjaAsXnKxUZCVFciY4gL1hcUXW3T0pltRoP5i6latgo8m\\/Qn8kIICj0QVX6DVe9H2jO2a75rH8aCmOI4o1TYeMpm3GRmatOUNeadcFEztqtfSnZT1PHKw0GHPSSUmI4UzgJvZdySqx7a1qtKGzXy2qONpgqTGSlXCUtYt2E6FXYeXZgnbP+FC1sg2muclEhu1j596zJOaVbt531YFF8fuDotvUWMJ+Qou7bxda+bjiaGuFVskh5dRmFm0+T\\/Y99x\\/R6NFSuUGb\\/GF2WvJSrnEhJJA9hyMKfjDcrH8n7KzNMVUbyEoI58TRixir+lDHozI2WgNp0acJ3LKTsIQ8QMG6FMe1opS8Lyx6f3fdUHI7KZYO2JulE37qPLHJBpTzEaT4VcNMo8BtRxcFc9fGtGnTmNoudpip8shKTSIu4ijbN58kwVjS\\/iu\\/jLuP95fRU4r1qQT5+5AmuNnb5O9DclO5fvYoJ+JtqVOvJq6VLFBlJ3LlyA62BF2lMCRTR3za+NOsliuVLCEj5iJHAnZyOLK06Q1NKfYrRZz\\/nMops7pPq9Obsb0cOPrbr+yNyT+uWTcdzOg2aaybvZ7zuflx1ur1Gr3tDrBwcXiRbbHwaiNG97Dh0K+L2BdXMH9NTXq81gfHw4tYtD8NjxKPY9z3MehupdxWSjjOKHbedOzYFM8q9tiYq9FnRBP013IOxBpK2KZKuX996Ha913Zb8nnJnUwcm9J\\/cBssT61m2Y5wMktqA7ULvn3b4+NUCWtLLSbGXNLiLnNs9w4OhKeXLjmmqky9hi7knVnDtpBwcoDY+M1YuY+iXZM67L5wjLT4gyybfxCDoaDEy5HoK9egr7sbDqozRBRsIyqdB83btqZh9cpYayE3I4XE2Esc2LKLcylGLGq3oFGlJA4v2kpIrAGIIMXCmZf8mlM3KJwTGXceI0ExM8eMDCKuxRAbe6\\/EYdFtiEklaj\\/jj5+PB46WKnJS4zi59S8CIjVo1GrcOr7KpI4ABmIDF\\/FbsIbmt9VnNjciT3HkdAaVvb2o5myHORnEnj\\/Atm1HC9qxNOeFKiq3GcHQBhGsmLuNcH1ppjHB3tufjs9442pnBjnpJJ3ZwZ9bzuXv9xQrPHzb49+4Oo6WKrITo4hXTFEKG73k9V+xqUuj6hrCt2zh4MX8vWn85j24jO1Ok3r2nNwfX8Ix3YLaXfrQOHsPv68M4+5TaeWe5x+JddrTtaGK07tWc6FBP565r3Yt4bwEBdtGPehRM5bNv27jYnpRW4KCmbkZxtQ4omKK2KepqtDItxrK+Y1s2HeaTODKdSMOo3vTvIkLJ3ZGVchjnkTFe6gk4pOSQLypvBOJ7du3Y\\/HiZcWOM2XyZ+VaVwt+nkudOrWLTSDelJqayrRvpxcmEgcPerHM4zlw4AB+fr4l3s58k5+fLwcOFD+un59v4XMTly5bXOQ4kya9f3+B3sGYdpXD+86SlG2CXZ2WtOvYD278zOaLN8948ri8czG7rugBIzkpN3\\/0G0k\\/tZm\\/gq9hAIyZKehRMHf0wMMuhaBN24nMVmFRuTbNW3ZnSGUzFv95hAScadm7EzVTg9my\\/DzJejNsbQ3\\/\\/DBSqVCp7ngehsYdr9qWJISc5tbzCZWTF3Xt0zi\\/PYI8FOz7fML3r3qw5dPxfHg8GY1TDWyuxaKn4KGoxnTObZjJ7wdjyLVvyvAP3mDW9zfo+fx8LuoBQzT7F37DiaQYUqlEg8Hv8eG33xITNpC5F0xp+8EsJjUN4du3vmB\\/LNh5OpEaZbhZOoaEjXw8fDYheYAhlehcMMQf48\\/pH7DwWjJ5VrXp\\/e5HfDrrBme6fM2Ruzphqan58lyWflSN0F9\\/4O0vrpBl5YxtXAR5BcMWf+TB8XnTmLAvFquGA3l70kJ+sx\\/OgG+PkoGCXR1ffN2v8v2b\\/+FguinuXScw+Z0veebQImZ89RaX0+3wHf0R46d\\/woUOr7IirvDXAzZ1vHHNu8SGi7f\\/CFNZ18a3fiWSju\\/mUraGas\\/2xt8tmt3rd3A1DcztrMi+UdAwFrXoMrg3HvEHCFi7gxSNM43bt6Nvn1x+W3yQBKMK+2b9GNK+EteP7GfjziTyTHWYpScXHpyNCUdZs+4YSUYgL5PkIs4hNS5teH5gMzSX9rN99TWyLarStE1nBjlqWbzsEPEGUCyr4OlqRuSu9RyLzUOtc6Oxf0t69cpi0eKDJJTmbFsxxd7dk8o5R9mw5hJZmGFfrTF+nQbjYrWMJXuvkYuRzNgzBG85RUpmHia2NfHr2IZe7ROYv\\/ECOYqGSm4eOGUfYf3qy2QZTbGv05K2nW7d1tQ4+vZnoJ+GM3u2Eng9F5taz9Ch63Oo03+5ZXu8rWVQKSpUN+\\/LUFSoVCoUJb89zR2q4m6TzL71W4jMUWNT+xk6tOmKR+QRAneFkJRrjnvzDrTs2YmE+asITQeMKVw9EsD1jDSyMce5UTvaPdudtJg\\/OFBEhZWqjg3xhIdn0MSnIe4nDqI0a00d\\/Wn+vljErTP6aPb\\/uYUzmUYw5pKeagTySLpwkB2X00jLUdBVbUaHNj3pnLyAlSf+uThloqRwZvdh9mRqcKjrR6vuA7EyLmLdqfu47U8xQZ1xiaCN+0hT2VKjeWs6DLRF+W05RxLL4Cp0adYFRYd3zyF090wjNPBv9sRmgmUt\\/Hs2wr2SBuVKFiW1vaVLTWo4phG8eTvh6UY0mizi9WDq7s\\/A5+qRFbKbTQEJ4OCDf4ee9DOmsiggmrxSzPv2WtBQrW0x+wMouk1L2k+gxalGbdzyjrFx9TlS80zQ6uPIobj9R\\/6wwe3tuHZwN2uvpKN1bkAr\\/+d53mI5i3dHkXuz\\/rMOs27bJbIUK6q2aM8zXdyJORFI4IZAMjVVaNzen67PJnNt8UESjaU4rhX1O7fEfWH+aEXt70psJ8CYEsHVpNZ4N6rJwYRUvNo2wPzyHs7euKOFXFozcFALzK8eJGBtODfyTHFu0gX\\/alWwUp0kQV\\/C\\/is\\/yiKO96WLs8RNwrIKnq5aInasJSRWj6mjD\\/7t29Mt8yJBgds4dMOArtYzdGzTk7axC9h8MQcUGxr0HkRHuwj271zF1QxzPHw70q7\\/s2QtXE1oqa4Tl2a\\/UvT5T5nVfUQ40YZauLpaosSkYsQUV\\/fKqE11uDmpOB9lAJUT7i4abpy5Sn5HmLvbIt1oTZShEx4e1uyPy+9lpXJyx9U0nYsRiRgVq1Icxx7kGHRXa5ZuWynhOKOycadONSui92xkW1QmmKlJSzaUYr9RmmPtw7crFL3dlua85FYqWx+6D\\/DH5tImlu0MJ7M0baCywdnTGSVsC+tO30CvsaV6C3\\/a9O1K2s+rCU0rxXFK0WKmhdzMrH+2UWMasbHpqOo6Ya+CNL0Rw63xKmZYWaoxJCdS2FnNrBqdhvTHx3CeoO37iU4zovXwpbufB05mCudSVFR2d8Ek7TRXChfeQGL4VVJb1cOtigknLhURnoUF5uSiaK2x1KaQnl3UDraINlR0+PQczLMeqZzc9zd74rLRWFmRk3AzXWTgWtBf\\/H06P9mqT0\\/CoKqNs6czhG5mzakUjOZVaNS+LZ06J3FmXxBbgtJRKnnTpkMHeqZd45eAaxhKdV5450KVPE2eXWO6PdsA1fGtrNwQT47GGnuThIJenyY4txnAcy20XAnezr6INNS2HjTwc\\/\\/nWmwpzi8UrRlaxUBS1i0ptOxYYpIUajg5YMIN3Is5piv2DfCro0Uf24Tnx3bEUp1DUsQpggP2cy4p\\/6Lbvc4\\/MkPX8FOoEaNiReP691o5i27XEs9L1C40aVEVld6UVi+Oo4eFQlb8FU4EBnDwShoFXRywsDQlL0+NTmfOjbTM2x4zo+hccbMxcv3g1X962mZFcOW6gTqurlgrUfnbu\\/jXeagk4oIFP2Gls6J375707t2zVNOkpqbSpnWHh5ntXXr36YlGc39PKPf3b8O6dRvKNI46dWpz9sz0Mi3zfq1bt5FJk2qXPOId1q\\/fWA7RQEREFN7e3qUe39vbm4iI4m9\\/nvbdtwQHH2DlPRKFqampeHl7cfnKBVb8tfKBEoqGpHDCzl0hD7gamYVD9cHUreWM+uIVbh62s1PiiY+79ZmIBdNm3SA+Lh7DHQOMeUlEXrxCuB4Iv8TlJDWv9PWjuedx\\/g63wMoCsi5f5UpkTP4V0Gs3p0\\/j1No53Nk309TTm5rmsRw6k3DLD1g1zt51sU05x9\\/RekCNtaMD2txrHA0I4ni0HsJCby\\/ImMSJLRvZeVoPHOSMrgV7P+uAf5WfuRhlAEMcIVu2FI5+\\/II97Xt+SvOGVsy9qMLB0Rriw9gdGMK5HOCO4slLJuLcOc7devaQcoqdhavcccK0vvSZ05QmLiqOhN9xYmTehjHjmpK6fBRjvgjktrtnLNozZlwz0v4cyWvfFgzbF8xF7SrWjhrLsz+\\/ysqEgsXMiuDo3mAO5sLBkDwaPfsLrY9tZPnfx8gDDtyoQ\\/dVQ\\/Crr2HFzoITCaUSdb2qkHPxAFdu+a2gsvWmx6BO2F\\/ewJ+7wsnGHEtLLaRf5\\/KV6PwekDE3x1awb+CHl8kZ1q0L5Hw2wDViFWeq9fWitv0hgm540sLPjezjK1i988odVwLzX0Zh1GeQHBdPvPHOIYWVQZ2WTXBIPsQf64O5rgcI\\/3\\/27js8qip\\/\\/Pj7Tk8mk94hhF5CL9KLIKIIggpYsWL96urq6rq7Lrq2n6vrqutasIuiooCK2BDpSK8hEEjvvU7J9Ht\\/fySEhMwkAwR19bwefR5y55Yz99x7z5nPPYUiq4GbF4zmvB4H+e5EN1nFSXVBLvkVMpBPhbYrt0\\/vTXfTHqptyVx01wKGGn0M4iyXsOntj9hd17QbSynZOfl4gPycHMrlG7hm5Fj67v2CI3bwVueR3nT+KSnDE9+fq3t1IUqVRemJYIGljJzcxn0UFDqI7HFV873m1fVg9Hnx1Ox8n7X7G6\\/z4lIrock3MyalGz9mZ3JqNdpbspX3X9ra\\/Hf13uX8d29zzjUe01NHSV4BhV4oLJFJ6LeA7iXHSM0oQQYK7TH0u7Fth+oAACAASURBVH4Y3eLVpGV7QbFRkpHRvM\\/S6mB69r+Qrgl6dlX7GS+nvXNsVgAX+bt3UzzgAhbcNZSGgh2s+XgXBT4bDLmx1lRS1arhukJ94TFOvAorLbUR2fdmzusaizrV2hR8lqlM287edAsKkJ9fhhy+iGmjBhGZvpPauMncfP1YonzMB6PU7uajtzc1XsZyPRm7dnOk6bvkFzow3n4pI4clcmBDcZs8OFPtXQtK\\/HDG99GSu\\/Zz1qY2BUC1RobJw5oH8g8o7901FGbltxh+wMiQscMJK9zAZxsOYwUoKccd3YOrBwwgYUsJxXEdH7s1TTvPgxNOzdMAnhNN95JsLiYzt\\/DkD11tT\\/\\/PD22vxs9SV\\/Ll5qbP8guo1lzPDeeNod+ez0lruuYUazm5+Y37LW6Iou+NI6jKPMixXC9QSF1ob3pNSSLRsJuaE9u0V67lnBouC+A7VjXtt83zruN8KpQBbxn7d2Qx6NI53N7PQdm+7\\/l4axate6MF03fcSGLM+\\/j4y62UeBqvD1c3B0riybXafX41LW5b3hvp3246SzGPuIZbL+iKrynGHIdX8eq3Tf3ZFCc1RfkUVshQVIY2uR+zTIUcSctq\\/NFWotB1wDySukWjyi6BxBGM7e7k0PJv2NU0SHJpTRBJd11ISq9g0g4G0hqx\\/eeK3\\/oPnXjuG\\/LJK4cJyUno9x\\/FoUkkuYuMw2UiKSkCqbgaopLpZmogL7cCmRjfeSHlkFUkM7V3T0L2HcCiSIR37YrJWUB+i94b7ZZj3o7KoCyCR3WUn7mNx+noXgmknFEcVOZmN5UrABJRIwJ7brT3fD37fG06Rpv7NphBgdZLAFVofy6eNoPE0nV8+v1xLAoQQD2gKdyJrSKP3HwLCgUU1BnpdvNY+nTTkXZUIeWKe5jdx9fPXi\\/Z37zKqrQKCotcDO43ksFpVRyucKIKiiA8WA1qtY\\/81RA1bAYTEmvY81ka9U09MCIGj2dwaDnb3vuaXU1vUtSqfnjGnJiuRIsxRA82Kw0tzqFis2BTdBhDdKceCABJK+GxGhk6\\/1bGamRsFVns37SBnXmtXwiemoeqhBGM66Mm65tVrD3a0Hqn2sbz5rbWUFVpObmfpuUNlQXkF1pQKKImpBe9p7rJOXiUbAeQX4a+R38uTkoiTCql9sT36KBe6Et726QHh2BUuSkpzKWgzA5UUHZiQ31PRg2PxnrwU77a1lQm5hfhihtE966nHqOdumZNIYXWMfQbMYouJXsotoE+LAKTFlCrUXVQphuTkonBzLG0naSW1OPSxTD4\\/OlceqWOle\\/92NgrDF\\/1j8bzHEgMrm2+dlwvkSK7kWTyUHsole3p5Vg8QXQZeQFT581DtexDtpfLIBlQe824k6Zx010zkVy1FB7ZwYbNaVS6QDKGYJQ8lNha1nVdWK1uiArBKCGCiL9TZxVE\\/Ne\\/XuDxJx7lq6++5qvVgQXkrNbOH3tvy+atAQcRk5OTSe7ejdTUw52ejtN1oiVnZwZVP1r2MQ89dH+rZaNGjeTxJx6lS5dEiotLeOzRJ9i7d1+b7c6FXbt2sXjxIwGvP3bcGB588M\\/trtO1axdWrVzlt3VjaGgoH3+yDID5C+axatXnAbeE9Emuo6ZeQR8cjBo67QezIy+LYu8A4uLDkXIK2LejkHlT5rMoPoO01EMcOlqI2W+TBQM9U3qhK93O8ZZPb01XBvQzUXc0nVIvgJf8L99g5RXP8\\/h333DB6hV89vEqfjxW56f5uUJdXj61jCU6SoJikIwDuPz++7h+2iCSY4Lx1jvQaSQO63VIShXr3nqPa1+7l8\\/XjeHrFSv45NPvOVTZ\\/phu+u4zuOfBW5gxoicJJgmrVSJYKkHvYyo1dY+hDAl3sn\\/rXk4dfkfdfQhDwh3s37qvxWduMn7aRdndMxnWT8Oq7T5yzFtOSYVCRHRE80DCSmUZlYqB8HA9NP0MV0X3p3+snaxt+S1+mIcwcPqFdK\\/awNJ1WY2VXOxk7tnLsMsmsPDWbhxLTeVQagalNi+gISY+BnVQHHP+0HLWcBVqVQOmEBUqVSLxQR6K84pOr5tpq5MRQ2K8BuvxPCpaZK6rKI9i91DiEyJQZVf43NReW4OdbhiDJTCXsH35Ug74nGjYjdXv2DBuyrILsI3qRUK0iiOFYOp+HpPGpZAUFUqQyo1TMaDyaP0XPHJtq3tNCY8n1qAmetJNPDDx5GqSSo3iMREk0eaaOG2yFYtVIcgY1Dyzp2KzYlM0GAwawAu6WAZOnMCIXvGEG3XIDjcalUSZJvCZxlufYwVD0kSuuGwYqqPb2BcxnOER0Zh0jSc9aeIVDG\\/YyNf7q9rZYxCJIyYxYUgyMWFGNB4HXp0KTV07xbpiobCgFmlsLFFqqK7az5dLj\\/n88Yu3gVp\\/DztHMYXlCn1jYwimmM4dlKNJq2tBQp+QSJhSxr7cALumBUodTXysBq1xOnc8OP3kckmFWjYRopYwnvax23se+NPxc4Jq31uqIvw\\/P1QRCcQHeSjJK27xmZeqvEIs4\\/qREKMmraDtPmWrGauiJShYCzS2frBZbShSCEF6CX+Df7Uu1069fgP4jv4u+Q7zCZC1xI2ayxXjQ8jftgvt4FEkRIdhUEO9EsuouZPR7v6CHWUxJMZpsGXlUO63jFWd\\/vMroHQqlBz5jg8KfM+aLjsay+a296QHi9kOscEEnfjRJtuwNCgYDAYkJILj4jCpwxlx9X0MP3lgVGqoNoWgCmjEtjN4rgDQiedeqScnq5LJ53Wni\\/YouXE96KZksuNAHBN7JGPaVYPUvTuR9hw2l7RzTykWMtILmXJhX3qbDnLAHEzXbtG483dT6AbfUzm3LsfSnR2VQQrWAPLTl1PvFeWMypkzfG6cUtb6r9cGmK\\/+3v2fTr1EFc7w2TPR2vaz\\/Ju0xglGAFUA9QBfNU6lroY6WYUx2ICEmez1H\\/L+Nl+5pOA0OwGF9B\\/XED1rBtNu+gMzFEBx4vTqwWxrFfADHfGj53LFBBOZX69gW\\/GJp6uGuC6xSNW7yfFbgDYf9rR4Czaz9I3NgIbgmGQGT5rOxHlXwIfL2OG3e7OEMSGBMKWCvfkNftYJhEKD2YJXiiA4SKJx5hwPVqsTooIaZ0H2+X3a1gs7dso2xYfYkdmXCy+9hRsHHOFwaippuTW4FFCFxxGj81BaUBpQC+9mp1z\\/XnceW9ZswXjxOK69ZxIooLiceHQSriIbnnbLdBVGkxHJU0HGocymAGEFletj6XHtIAYmbSI\\/u7MnlAysXqIymgiR7KSnp5HdOIsKFes2k9jzMgamxLOzvARZqSf1y7dJBSRdKIl9RzNt+sUsMLh4f03Gyck5RaBQOMVZBRFXr14DwONPPMq+vfub\\/\\/65BdotuXv3xgDivr37ycvL7\\/R0HD+eQb\\/+\\/doE6Pw5f+oUSkpKO17xLD3x5GPs3buPxx59glHnjeDxJx5l1iVzz\\/lxAX5Yu45HH\\/078xfMY+WKVe2uO3\\/BPAB27jiLgB\\/wx\\/vvJTQ0lKFDRvDJ8o\\/4++JHmD1rzpnvUFGQvYAk+a5znsV+FeVEPdZN2e5PeSsjmQFDhzNi6lWcN+4Y33\\/yDUd9BW2CezGgh5riLRm07FGi7TaAvsYaDqVXNFcK5bIf+NusaXx84RVce+ONvPTNXRx5+TZu+M8B3xUvjwcvKtQSgJHJi9\\/iuRn5vP3kQzx6tApvxEz+8eGdJ9ambvvzzJ+ymimXX831Nz7N53fdyQd3X88Tm\\/zcl5oh3PvWf7jBsYL\\/95dnOFDmJGTiA7z513jf60uqds57Y54oiu9xPvxSXLjdoFapWixy4VYkpKbjKaiITelPlC2TjQUtzpSkQTbncyAzo9WbeEf+Fpa9cZSeA4cyfORFLBw7lv2rP2V9jgdJArn2EF99sZ9WvT8VGYfFC5GdfG2dJkWWUZCaun26sFRV0O7rHj+JbcwHqfG\\/yBFcesUEgjK3sH5LAXUuNfGj53Bxt\\/YScsq9JklIeMjf9BHrT2nVpLhtWJV2czlAXrxeUEkn96R4PXiRkCQJ0NFj2jxm9qllz4ZvWVdhQw7qx\\/Qrx57WUVqdY1UCYy4eQ1jWF7z7Qw5OzXGqZs5jxjWXE\\/TVYaIGxyGvt7T6YXfq9zQOvJj5F8RRtG0ja3KqsUsRDJ05lyHtpqLp+CfuF4+V6or2Q4A+f75KNO3nHNYrT7kWJJUK8Jwci6rTSCApNBxby6c\\/lbb+Ma04sbjBcAbH9v88OPlDrnWeSh0\\/J\\/x+hfafH\\/6fke3wevEqoJZaPCO9XuTm54Qfrcq1tinp+Dv6C5h0nE9S5HAunJJI2dp3+SbNiiqtjAvmzeLKBcGs2S4xOFnF\\/h8bx9hTqUD2yn6v3zN6fgWYTq+7lsozmNRS9npB1aI8VBqfXVJThkiSBHIZuz77lqOt3q4oeBrqA3oBembPlc4996BQk5VJ1cTh9O6qo6FbD7QFm0nNsDFkRC+6G7NQ94rDmbOTIg\\/NvUB8sWWkkXP+JaT0D+fQoXh6dpEp\\/KGA9johtyzHAimDZHtH+eknga3ulTMtZ87wuRFgvTbwfG0nEwKl2ChIryJ20FAunFrIinVZWBUCygPf+5ORZZqGAlJw1lfi+zVqi02suWz59A1+MpgI0Ss4XTFMvmkefUqKWgzPYCBp0jwuH6ki9YvlbM5raHEtN9UbZC\\/+iws3NqsTokMIlmjOM8loIlhyU2t10f7Pcw8Nldns+tZA4v\\/NpH\\/fKHZVVPp\\/lkkSndL8QZbxNt2\\/jRS8jQ+gdq+hVvdTgFptI9dw+Mt3yOvSj8HDRzDuilGMzd\\/AZ5\\/vp6apXJPaLZR8HqDN9e8o2s0Xb+9FH2LCILlwhIzi2oUjqS9qHP7J67dMtzeeB40Bg47mF2yKpR6roiPYqIV2nzhnJpA6keKV8aInyKCi+RrwWKi3QW9jcJssUVxmitM28GNUMteNGECSLoOMppfqxhADJ1\\/b6wgxasFmxecwi8LvwllPrNIykNjy71+b7t2TGTlqxDkLIAJs3LiJa6+9KuBWfXPmXMpXX53785WYmMBXq79uDm7eeeft5\\/yYJ5jNZt595z0WL36EnTt3+Z1gpWtSVxYvfoR333kPs9l8xsfrmtSVm2++qfnYFouZMWPGBBTEDJTiceNBQm\\/QAy3e7Clu3B7QGfS0eFz7pU3sRrzGSXHFyRnRXHX5HNqcz+EDw5m\\/aBojU7aTvrOmTeUgpPcAklVFbMgwt\\/hMR\\/eU3gRV7uVY5SlHd1eR9u2b\\/O27j1nz2Bd8uOhaxr1+gC0dfVl1IoMHRdOw+R+88MWOxpYsul5UyhDWYjVvfSYb3n+SDZ98xh8+W83dN13Ay5s\\/97lLKTyFIckK+xa\\/xPItjd9NG1WKU\\/EdRPTmHSHdamDkxFEEf7+t5RnHm5\\/KYbOBMRNHEvz9T02faeg9fjTxzqOkZnTwC6Pd757AgP7hWI6vpahlvVWp48gPX\\/rcRHFUkb1vPdmHUhl\\/7Y2MHdmL7TlpVJZXQ684IuRaMn3NpFdbRoVLQ5fuXdFlnNqdWcHj8TSN2YL\\/qI23itJyD0O6JROjLqS86beDtksyXbQOCstqkfH\\/E\\/3k9+4ecHfm1lREJXXB6K2iolpG1SWBWHUlO7fvI6taAVRIdU6UDn+EtzhcXTmVLjVJMSFY92T7rIapaapsnitSKPHxRty5P7LtSH5jqxJ1FDYFP11ZA6AJJyIU6iqqGvPaU0Pa159gv2Ael149B1XVDj5qGqdK9niQJRN6vcTJX0sqIhPi0Fky2LXrOMUyIDmosXdQm1NF0LNHJErFESq9oIoPsDvzqackpAc94yXqD5T7advUNk8U4NRhXQOnYKuqwi71JamLgUMZfrqQnwm5iopKmSGx0Wjr05q6V7bmPcNj+34eHMbtM0\\/dHT8n\\/Jw\\/uZ3nh1xXRplDQ1L3LugyTrSoVhGV3BWTp4Kyqs4dEr1tudbyWgjgO\\/p73gWQT+rQCMIkK\\/mVjSWBbM5k3fJVNFx+GfMX6DEfXEG6RQGphqoahcFdk4hUFbUZkw1AFd3B88tfed9hOiXCOuz+eibTcyrYKiqwMYjYMCdbC3y9HGgeLLTFpdQyfzp+rvir\\/6g68dwDKNXHOVY+jpEpI\\/HEB1P4UyHOchvZ1hH0GzYEdaKDzJ0FjS9C26t7ObI4eNTGgsGDSbKGk6Tk82NOexG\\/1uWY7OmoDAokP3N9HqnVvSKFnWE5c+bPjZbOOl\\/93benUy9R3FQe+IoNBRdx5azZXG5fwadbi3EFUA\\/omC6A7swnn+1eh4V6h4Gk8yczMLiS3fvzm2eqDRsyi7mjNKSu+oxNbcYf8VBTVQfdu9E1ZBfVFl9lspfywhI8g5NIjlZRVNEYhI3olkSot4RdZafRpk5pfCeo4C8PFWzlFVilFJKTgzl4anfmc671\\/RRYffzUbQA8WIqPsL34KAezZnPzpaMYHH+QjZWN5Vtyz27oj5\\/ptdGSjNNaj1MXx+jZw4kyH2FDxslz5q9Mr6+swqVKpmuijsPZjaWsJjqWCMnK8ZqzS5XffA2gXiLXVFDtHUZ81xjUWaWNzxV9NDGhCnXptR38Tm0qwS3FFNVLDO2eRNChphnI9UkkJ6gwHyn2OayB8Ptw1kFE+PUHEn+OACLAR8uWs\\/C6a7lu4bUdBhKvW3gtoSYTHy1rfyKW34KXXnqZsePGsGTJa1x7zcI2QcLQ0FCWLHmN9PR0Xnrp5bM61vPPP9tqvyZTKACLFz\\/CD2vXnVWAspm9grI6iRHDxjPYkolZbcJoz+ZokZmycjvaPiMZn+Imr0FHhL6eo8crAZCCejBy\\/BC0BXXIIUkMmzSUkKrd7M9zgxRF35GJyOVVWFwSQfHxmNRe6hucKNIpszM7TPRJSYL8H8hq+TvB0JMBvfSU7zje4m20RMSY+cyJLeVwXg3uoG6M7R2GUlfrc2KONrylHDteR\\/CU6\\/nDbAvrcsx4g7sTIZ2oqBsYfPk19KlNJbPSiS5+NCnRYMuqwemnYFHqM0gvUXP1Nfcwr3g16TUudL2j0TX\\/jollzksreWroT\\/zpsr+xrnYTb7+TxoX3PcfbjldYujmLeiJIMuTx1botvLlkPzMeeoZXqv\\/Nez9VEDLsKv50Ry9yPniSb6rOvHTTdB1AP1M96eklrbsjGXox44bZ9Cr\\/kWVfHWnqzqwhfuAwouylVNu8qEOSiDWCq9qOF4Xq1F0cHzabCVfMRr3zCCX1blTB4UR4CzmQVYviymHPnnJ6T7iEKzzb2ZdTjVMKIkxdS3pWJdWl5XiG9+W80UWoS9wERaioPJxN61iejeM7DzDqqvO4dJabrYdKcBq7MXLKUIJKtrEnt\\/0u5s28gXdnVncZyqThMrnVLgwJg5gwNgZz2iqO20CurqBa7kPK2GFUHCzB6lYRHep7rB+\\/nDns2VtO7\\/EXc4VrB\\/uyK7HLOkzRBurTjlDsBMXegF2KoEdKD47vzsEc1d4MvWfwNl4xU1lpR9tjBOMHOMmqdiDrIgiSzqIVnruI7Hw3M0ZMYlDxZo5XudCGxxCmA6\\/bDWHd6ZOwh\\/IiJ97KMirlvgwcN5yqw9UoRhOeoqNUV1ThGd6H0ecVsie\\/HpcSQphBavVeAySMsd3pnlSHVxdGt6HjGB1v4fDnaY3dIQPtziwZiOrWnW56N2pTIiljx9HDncm3B8p8VkJPzZNajx27S6J77xSScg9ReAajmngLD3KgfCATpl9KvXYveRY1Yd0GEq+m+T5of3Zmf9EKK+m7Uhk1fySXXiaz41A+tU4JQ1g06vL9HKuQAzp2a+09D\\/CTp0co6Og54e\\/ktPv8yGH3rhL6TJ7JnIYt7M23oUsYwqQxUdTsX89xG2cVg2+3XKPttdDhsxDZ7\\/Ouw3wqyya3YTCDJo4gb10qpXYNoTERGCQZj8uDMakvScYCsm1m0vcdZ8zcMcy+2MVPRypwB8XSv1do80\\/cDp9fir\\/yvrzDdAbS\\/TXwgRJO8hbtZ1fBQKZfcAUzg\\/ZwvMyKR2Mk0mQnKzUfq6Jgb3CAsSv9+kRTnVmFs1X+5FLb0XPFX\\/2nE8994\\/mt5djREsZPHc8wVwZrcp0gl3Msw8KIsWNQWQ6wrdDTYV648VB44CAVQ0czc4oacr8j55Tf2+2VY9BRGRR4d+Z275UzLmcCqF8EcvGcdb76v29Pr14iU5\\/+PV8YQ7hm6mymly3j28yO6wEdcwfQnRnQhxIbFY4pMoGeg4YzuKtCzrqV7GqOfnZn7KQeuI9\\/x3GHidhYU3O6HfVVmJ0yFYf3kz\\/iQibPnQY7MqlVQkgYlIReOlmTbMjcw6HaBZx3yYXYtqZjNvZlwpgY6lNXcszXM1kKodfooYTWl1Jj86AyRtNrxDh6UcbWjKZx0f3lYfF+duWncOGF87goeA8ZFTZkfSgGazbH2xsx5Qy1fz+d\\/jZSaE+G9dJQXV6PU9ET1SUcrWLH7lDAlcPuncX0Of8SFnh\\/YndGJXZFT9cI3\\/dje7SmaKLDQomIT6b\\/8KH01JeyddXmpvEM2y\\/T3XkHSa3uz4ipF1Lm3UuJHMeIqQPQlfzEwZKzbKnrL18DqZfYMjlwbAKXDb+QqVUbOVylIWnsRHrKuaw90tiIQxU\\/mAnJCmXlZhyKjrCuAxkzMgLb8S0UuADKOLQrj6EXTeWS8bC3WCZh5DT6qQrYsL\\/E73ANwm9fpwQRoXUg0WKxsGHDps7a9VlJTEz8WQKI0DTbcdM4kYqi8PFHn\\/hc77qF1\\/LQQ\\/fz2KNPdDiD8m\\/F7bfdxSfLP+LjT5bx8J\\/\\/wpEjjdOEDByYwrPP\\/RNJkrj9trvO6hhjx45hzJgxzX9\\/svwjUlIGAI0BxVtuuemsg5QAyKXs\\/n4bUTNGMn3eMCRHLfnbyzlWVEnetrXsNk1l6Mz5jJYbqMrYTF5GYxARrwddl1FcfF4ketlKRfZPrNq4i1IPoDcR33csQyaHEaRRcFmrKNzzDRuO2ICQVhUKKawfKV1k8r7LbhUvCO41gJ6aErYcr2tRaVQR1XMCC+6dwt\\/ijKiddRQcXs+T977Kfk8gDwArG\\/7fvfxL+zALn36Xu0LUuO1magqPsrbcBapwkkbO4o+zHyQxTIOnvpT0bf\\/h3n9upMFfEe4+wMt\\/eJzQv9\\/C396+jjCNF4ellor0nyg+0Sqn1aYu0l5ZxMLaB3jghj\\/wwo2RaByVZH37DFvXHyfjrTtZaHuQhxc9wpt3G3GWpLHhP7fy7Ft7OPN3rlqSBvTFWJPKsfK2wQfp1DRKQYR16c\\/EAZMJNajxOsxU5m5jzabsxpY\\/1mN894mXsZPHMHjaXCboJdy2Wkr3V3EoqxYvXsq3r+Qz+yQmjpjArBFBqD02qo9vJDe7EuuxTaztMpPJYy9lgcaDrSKNdRmnBhHBVbSFFSvsTJk0jIvmT0LjqqM4YwOfbj7AqWOl+xd4d2bFrSJq6HSGRgeBvZr8favZuC238W1w9T6+\\/S6EaePGM+faYLSKB6fdRnVpLYG35fJQtn0FnzZMYuLwsVwyLBiN7MBcmcnWzKMUOxXk0gNsPdSF80dOY1huHlvkpgQ258\\/ZtlJ0kb3xK7aqzmfYjPmM1avwuhw01JWT2V4X0\\/YoFg5\\/vQLNlMmMXnAbFxkk3NYairNS+eLtY6hGX8W8ORdR\\/cEa0msP8uOGWGaMm8zcASrc5lL2fXOM\\/LQfWBN2ARNHzuKqKVokjwt7Qw1lNU1dq+R6SvLKiOo5lcsG61F77dSV5bBt5Rb25jW1ngigO7NkLSOvuAtJ4+fS26BGcVqoyN3L6q07yfTzCvrUPNlYlM\\/uLceImTCB81NyWbYrwIB2S94Kdn3+OcrUiQyaOpfROje1JfXISmPXp5bdyU437515G1i+wsLkCYOZPPs8DGov9rpy0jakcazCcRrHPnHYDp4H\\/vK0qKPnhN+T0+7zo2r353zmnszkUdO4YpwOj7mc7J9WsXn3WYzB2nzodso1fF0LHX\\/HBj\\/Pu+qO8smRxY8rvmXilDFcessUgjVeGmpLyU37lvdWNTBg3tXMml3NshX7qTn+Ayu+dXD+eecxc0Awkq2SCqe3MT8VUDp8frn9lPfl1HeQTm+H3V\\/PkFLLgS8+wTVhEqNGzmBAiBZcVqrzdlKUmo8Vhdq0bezpcSHDZoyhIPsbMlvlz7ts7PC54q\\/+03nnvunLUJ+eSu7EJLpkHW2a2Eym\\/Gg6NaPHoxxOpbj5hmgnLxRQqg+xK2MUcwd4OJSa06a1UrvlWABlUMf52RRAaPdeOfNyRumwfhGAzshXf\\/ftaddLvFTt+4b1XW\\/kkoumk1v6Fekd5EHHAuvOrO42mWvm9MJtrqYs\\/yBfrz9ARuXJK0YKTyAhWEXY4Flc32omXQdHVr7KN9lelLqDfL1SxZTJwxh\\/6TCC5HrKqhVkFOQTF7irkC0r1yBPn8TEywahc9VReOhrvt6S36YnSiM9QRFdGTZiFJEhWhSXjZqSDNZ\\/9hMHT\\/Q8aue3ycEvl+OaMInRoy9mkFGD115L3k9lZJyDIGL799MpXyuAbdTGGHqPGMWUyGC0uGmoKSHt+w3sq25sAVu1ZxWf2Ccw8bwxzBwSgg43dksthdmVjUM3BkRF3Oh5XDlEi7WmnML0dXy0P53ShqZz21GZ7i5m68rVyBdMZOzlCwnGTmX2Dj5fv6dFN\\/gz5DdfA6mX2Mlat4LvXFMZe\\/58hhpkrKUZbFixgbSm+ptObyK670CGTgjDoPLgMFdSsHs1W3dmNvU0UahP\\/ZqV2mlcMPoi5o+XsJVnsmXVBg7UiWaIv2fSwJSRnXoFTJt2PmazJeBxAc+1mJhotFodJSUlP9sx5869lIceeoB6s5mPPlrO8ePHAejXrx\\/XXXc1YaGh\\/OtfL5yzFpvbtm1k\\/YaNzbNPv\\/POGzz33AscP36cfv368ec\\/P8CiRXcAMGfObM47bxSXzDyLMQOB+vraDtcJDQ3l+eefY8zY0bz04suEhjUGJX96YwAAIABJREFU9nbt3M2DD\\/454FaCqYcPsPb7H1i58mR32fT0dN586\\/VWQcQTYyKeCCQC9Oje+zS+VWdRETfpJhYOKWTlknWNM\\/OdMYmosQu5aXQda95YQ0ZzqRzCkAW3coFqE299dtD\\/GDFCYHR9mHXHHKL3LeWD7VViPOFTSaGMvOY2pjR8w8tfHju9Aa0FoZNIYSO55raJWL56jTUZZxCY\\/B899q9DZ5ZrvwYaelx8O1fEH+D9pTuoFg\\/9n9G5PveN9aYbUnL5+P1tNL8X\\/NnKsd\\/avSKcLkPK5dw5U8vGJZ9xKJDZ4KRoxt90I6MqvuTVb7L\\/N1p7BXQ\\/qUiafjtX9jzGJ29vokQRdcnOJOolws+p01oinvBraYF4QmXlOXjN0oHVq9ewYcMmrlt4NXPnzqZfvweAxolX1qz5mo+WLT+nLRD\\/+McHeeLJx5g799LmZX\\/+8wOt1nnnnTcAKCkp5dHFj5+ztLRkNpu5\\/fY7ueWWm7n\\/gfsAeOnFl3n33fdOaz+333Yn\\/3r+ueaJWACuufo6jh5NbxVEPJS6v9V2R4+mn0XqfyWkaPoPiMWRvb3pzXzT4tA+DOgGBT9kigBiJzD0HEAvfQW7jlWLAKIg\\/BpIRroN7ovRVoO5wQlBMfQePZZEexarC85xZfmXPLZwTqhi+jE8QaG61oLDoyW06xAmpuip2J7Z2NVfOGd+rnOvC48jXCOjixvKtDHBpH+9Dx8dCwShc+kSSBkcibu6HqtDRhfZnRGTeyIXrCO3w+4xesLiIgmNHcaAaC+l+8s7Y0qUX4WgyATCQxMZ1TcEZ0FxYwu9X3JGwf91ol4i\\/MI6PYgoNLJYLCx5\\/S2WvP7Wz37svXv3nXXLwnPp3XffO+3AYUs7d+5i0sQpPpc\\/8fhTZ5O0Xz1V3AD6R9nJ2lTQosuDRFi\\/AXTx5vN9ViCvOIX2BdErpSea0m0cE78mBeHXQTIS03sIo7pGYjKokZ1WqoqO8t1nP5HZifOs\\/OqOLZwThrAu9B3dn9iwYHSSh4a6cvK2f87m3VW\\/mR\\/tv1Y\\/z7lXEz9yLvNHmPCYSzi2fhUbss9FH3JBaE0KjqR7ynh6RIcSrAWXtYbSrI2s3Jra8SQUmkTGzr+CQVoLJQe\\/58c062\\/kRXYQPadcycyeMrUFu\\/l2U9Y5mK\\/4d0bUS4RfWKd3ZxZ+n8zmOhRFXEqCIAiCIAiCIAiCIAi\\/RWcxXZAgnKTRiEatgiAIgiAIgiAIgiAIv1UiiCh0Cr0+CEkSg1sIgiAIgiAIgiAIgiD8FokgotAp1Go1RqMJrVYrgomCIAiCIAiCIAiCIAi\\/MaIPqtBp1Go1wcEhv3QyBEEQBEEQBEEQBEEQhE4mWiIKgiAIgiAIgiAIgiAIgtAuEUQUBEEQBEEQBEEQBEEQBKFdIogoCIIgCIIgCIIgCIIgCEK7pJAQk\\/JLJ0IQBEEQBEEQBEEQBEEQhF8vyWw2iyCiIAiC8D+h\\/4jJv3QSBEEQBEEQBEEQfpdEd2ZBEARBEARBEARBEARBENolgoiCIAiCIAiCIAiCIAiCILRLBBEFQRAEQRAEQRAEQRAEQWiXCCIKgiAIgiAIgiAIgiAIgtAuEUQUBEEQBEEQBEEQBEEQBKFdIogoCIIgCIIgCIIgCIIgCEK7RBBREARBEARBEARBEARBEIR2iSCiIAiCIAiCIAiCIAiCIAjtEkFEQRAEQRAEQRAEQRAEQRDaJYKIgiAIgiAIgiAIgiAIgiC0S\\/NLJ0AQBEEQhN82lUpFUpdEEhPj0ajVeLxeCouKKSktR5blXzp5giAIgiAIgiAEQAQRBUEQBEHodAaDntkzL2TWRdMZN3okJlNIm3WsNhu79uznyzXf8\\/26jTTY7b9ASgVBEARBEARBCIRkNpuVXzoRgiAIghCI\\/iMmn9F2iR43BkUm0AJPpUC9Wk2V+tf7rm3GBVPYtfcA9fXmNp\\/Nv2wWE8aNbm7lp1KpKCur4LmXXkNRzm2xbwwO5vZbFrLoxmuJCA8LeLv6ejPvfricJW9\\/gNVmO4cpFARBEARBEAThTIggoiAIgvA\\/43SDiDpF4enKIq601KA5zeCZRaXmvxFxvBoRe1rb\\/RymTh7Psnde5fCRdP789ydJTUtv9fmLzz7OlVfMabWspLSM0VMuOadBxFkXT+epRx8mNib6jPdRWlbOXx97hnUbNndiygRBEARBEARBOFu\\/3iYWgiAIgnCWFlhquNZcTZo+iCP6INQBxs8UYILdwt+qS\\/gpKISDhuBzms7TERsTzXNPLQZg8MABrFj2Fs88\\/1+WfvRZc4DQ4XC22c7WcO66ChsMep59cjHzL5t11vtKiI\\/j\\/TdeYvXXa3nokSewNTR0QgoFQRAEQRAEQThbIogoCIIg\\/GYNdTQGoO6P7cZRfdBpbXuluYYXKwpIcdl\\/NUFEjVrNP594hMSE+OZlIUYjTz\\/2Fwb068NfHn36nHdXPlV8XCxL3\\/wPg1L6+12ntKycDZt\\/Ir+giJraWoKDgujTpyfjx4yiV4\\/uPreZO\\/si+vbuyY133EtxSdm5SbwgCIIgCIIgCAETQURBEAThN0uWJAAU6fS39TZtK3MGG58j1151BRdNP9\\/nZ4cOH2kOIGq12jaf63Rtl52tpC6JfLbsTbp17eLz8w2bf+KVJe+ye98Bv8HNYUMGctetNzLr4ulIUutzPaB\\/H75euYyFi+7mSPrxTk+\\/IAiCIPyidG7cExtgXxja+l86MWdPMXrBqUby\\/NIpEQThXFH90gkQBEEQhHNNdQaN83RK46QkP2e7vr69ezJl4jgmjR\\/DpPFjmDxhLMOHDm7+\\/Kcde1i\\/aWub7T769HM+\\/uyL5r8LCotIP5ZJ2tFjpB09xtFjGRxNz+jUtEZFRrB86RKfAcSComKuuekurr\\/1Hnbt3Y+iKDz6lwfYs+U7ju3fyvYNa\\/jvv59mwrjRHEw9wh33\\/pkFC28jv7Cozb5iY6JYvnQJ\\/fv16dT0C4IgCEJHVDHjuf\\/uqcR05vtElYx3VC3WJ3Oo2H6UyldLsSe3qG1Ibhx\\/zaH2hnM3DMk5EVlD7bbDlL1Thfe3FGUwNNBwfxn23j9fjdA7L5eyg8cwjwjgmD3rsNxfg9tnhxsF9w35VL9SjsvY\\/m40\\/ebxyPUphPx63p3\\/T1HLToa73L+LANvv4TsKgiAIQodmWeu4s66i+e90XRA2lYrgpmDiz+HuO27h4\\/deY\\/nSJSxfuoRP3n+dfz\\/zGCpVY3GdnZvHDbfdyzPPv4zL5QLg2PFMnnjmhVb7+e+Sd5kx92oumntN8\\/+3\\/+GhTuvqHBRk4MO3X6F7clKbz9b+uInps65ky087Wy13Op0kJsRjMoWQnNSVK+ZcwmcfvMGb\\/\\/0XxuBgduzex\\/RZV7Li8zVt9hkZEc6yt\\/9LTHRUp6RfEARBEDpkGMA9rz7BmLp0qjsrfqR2YP3oCOUfF2AZJ6N7P4noC\\/sSmtoiciMpeIZacPX2nLsXmeo+3L\\/yeeaZOnGf9SEEL40m5BMTqrOsOilhbmQ9oJKRY7wBnAcN4xYv51+TO7\\/XBXoHjkUVOHp0\\/q79Ue2MxvRKLEHZHUf0lGQztkW1uP2MvCNZVUgNaiRv+\\/vx5BzDe9XzPD8rrhODRApdbBVc4wz8StY2FHIgt5ApikI\\/Sxl3Nrh+pqCVk8tra+lzOjed4iHFVsXisgx25R5jaZ0dfTurS14rt9TUMOQXndpYTb\\/Zd3Ln+fGncV5VJM+6nxcevohktQgiCoIgCAIA5zdYWFxVwpOVxaiAg4ZgbkjoSZ5W97Olwett2\\/\\/H42m77JU33uOam+5i7\\/5D\\/HnxU1httlafK4qCLMt0SYxHr9chyzKy3HnB0KcefZihg1PaHPM\\/r73Fov97wOdkKKtWf+NzX7Muns7SN\\/+DVqulwW7njw8\\/yrMvvtpmvYT4OF545h9tujwLgiAIQudT0XvhX7h3wHFWry3Hfwmq4BlvwWMIcLeyFnWtAvUmQhf1IvyVSHRF\\/yM\\/yeOsOAf6j0Qp3Rx43RqIs+MJP4soibGOuk1HKH+2Ds+CXMq3pVM\\/8ReNuvx8JA\\/2l9Moe9+M5kcFy4+pVDxgO7NgstqO9a0M6gaFEvaZB\\/OKTMzj26kLutNZvdbCRQ\\/fxdTQzqlrBTvKeLvKRbH2zPbXy1bB9Q0\\/V+s+HZlKBW9UWQgNaH0nt5UcZW15BUNUoTybOIBxsaG0135Y5bVxVV0d\\/X++9gk+qOl1wUKuHxN7WufVZXficthxKSKIKAiCIAgAWJta+91SX8mbpbmYZC87g0LYGBxYVaIz+Gop6K\\/14M49+7ni2lvYdyC11fLEhHiuWXAZH779Cuu\\/WcmMC87v1DROO38iV8+\\/rE0a\\/\\/aPZ3juxdf8pjcrJ48DqWk+Pxs3ZhT333Nb898vv\\/Y2z77wis9j33L91WeRekEQBEEIgLof8+YNRFtyjKO17YRwwixYn82h+t81eAJpBKeoCXo6iSCLBfOSYpwBN7BX8A6ro+GaGhz9T325KOMdUU\\/DNdXYxzvPaBzojsk478mn+t08bL4iID0qqVmVg\\/nmKmwP51H1ZSGOyAB2G2vDPqcW+9xa7JfW4RjuQmkwYbo\\/mYjXTWi+TyTiz90I2fc\\/\\/ALR4MBxVRW2a6qwXV1Nw7xanAPcvgODihrdlzEYPwpFU2oieEksIesNZzY6t6JBc9yAJluLqkKPJisITXl7e5LJOZqJI\\/ZCrp8e3gkjgju5rqqS+KAwdv5PRJ0kjhlDUcwl3OIKJGyr5YhOg1fSszY8lhVBOmwdb\\/S\\/RzIx698\\/sP76SpYXzuGHnc+LiVUEQRCE35dhzgbuqK1ApyjNFThZkhjkPPnucKatnriSHO6KT6ZI8\\/O1RPTVyq69lnde78mKfIjRyL+eXszUyRMwmUKal18yYxprvv2hU9Kn1+t4avHDbZY\\/\\/swLfPDxiua\\/g4IMvL\\/kP7y3bDk\\/rN\\/c3Apy1ZffMHzIIJ\\/7vvWm63j1jfebWzG+\\/Po7mEwh\\/N9tN7Va7+E\\/3cNX3\\/5AZVV1p3wnQRAEQWjD0IN+SSqUtDrq2osn1IcSdnc81e8WUvOMiqiHw1G3aayn4B1gw+M1oM\\/QQHEE4YtkapcVUfuqhshF8eg6iD54L8uj8p9mlAYJ9FqC7+hL2DY1ION6IJPqW12oKiTkBC\\/qZT2JedLUqdPCKT1rsV3gQQqyYX4rH+mG7gTnnjyCPNyCyx5F5LQkdL3LqFpZgW1GAoblp0RWJQ+e8xwo+Ua0FV4cD+dRd5EXZECtoGhU6B\\/tR9SnEY2BCrUWdbkXxQjtNvEKmIx7diVOTxgh37fTfFTtxHFrHfKOaILz236sJDbg6qpCu8eACi+e0Q0ohSFoSySU7jZcEVp0B3SNeSC7cN5Zht2kgEZBCZJRUKP7d2+i3gw6JZ8k1BviGlvCGe24JDWq+rYROLmLHa9eiybHdzhH7mPFoxgwPJ+MIdSJa6CekL9GoHYoeAda8TYEoctVt9nOW19PvWKgf0oP1J\\/Xcjbz46g8Zi52KhSG6M5qP51DIdzVQG\\/0pOo0uPys5dEayKeC2VYHr0QGdZBuFduje7LYk80TJYVUd+nGFy1aXEpyA4sqi7naCcdDE\\/lbuBFrp30fL92cDkLVQaRpfEdoJeMArrrzIkzbP+SdHdXttKbW0Xvun3jylhGElW\\/lhcde4cfSFmsrVra88Rh\\/1KeTVpDKH2tk0RJREARB+H252FrPHGsdF9vqmdn0\\/yxrHcluZ6v1RjhsfFacxRBn266554qvgKFKUgU0lqHD6aRXz+6tAogAkyaMJSoyolPSd+uN15HcrWurZZ+uWs1b7y1rtWzyhLFMHD+ad157gQ3fruSqeXPRarV89c1an92zAYzBwYwdPbLVsn\\/++79s3LK9zXp3LLq+E76NIAiCIPghu3DJIKklOhpFQ0qNI\\/LuGKTpBVQ\\/YkE+dX3Ji\\/NP2dTcdbJbqpQbRcStiWh7llP77+r2WzGqnNivtaB5uR\\/xIwcSuVKh4cb6xuMEWbBd50T3VD\\/izh9I3FXdMK0ydmoAEZWLhseKcZqjiLy4D6HHG6h\\/uxB74sm6iepYMJqwGmp\\/PErlf6vxqBTkaB9dn7UNWJZkY57qAZ0Td18vZEUTOWUICZO6EVQv4+nnOtlKT2fB8nYOljGd1f9TwX1pOZaLnO13EVY7sd9Rhn2I7+PK00qo+Vc1HjWgsWN7IRfzNA+g4Lm8kJpHa\\/GeiNG5QgmbOoj4UYOJHzaEhKEDCNsi4bqpCld7+R5qo+H+Uuxt5pVTcN2bRdVzNSeP0Tp1OO\\/NofrOxutN6VdF7VvF2OMUUHlwPJxD7bUO399frUINeN3udhIWGJXXSzjgkFSdOrZnuK2Y5RW1JLRcqNi5tSyLvzf4yi+ZIXU5rCkr5aHyTFZVWwj3t3NJwoVClNdzyj3kZk5lNk9aT1kuGfgwrif\\/1Fp4rrSEKc2XvMLg2gLucwfzfriJ0LoC7nf4PgsqTw0vFBdzQcuky2YWlxQyz1eVWXFydVkmyyrLeLY4k+etvrt7q6KGcvm1V3HdhC7tBv1UcXN44pGhFK34gK8aLuD5hy8grOlLavpfzev\\/XUj37J\\/Y4JzBKy+ej21bpggiCoIgCL8vntMYUy\\/Z7eKLoizOb7CcwxSd9Nqb73PNTXdx5Q13cOUNd3D1jXfy4COPA6BWq1CpGv8\\/8e+WPB6Pz3EHI8LDmDp5fKek7+r5c1v9XVxSxiOP\\/7PNej27Jzf\\/u0+vHrzwz3+wY8Ma5l02m917D\\/jdf6+e3Vv97fXK\\/Omv\\/6C+3txq+ayLp59B6gVBEAQhQK5MDmV4kGLiiQ+g2qDalUjUA+FwVRHWYX5CJqrWy6X0GCL+LwbVlCJqnqo7GRCSFNBysluy2oW3iwpNuh5JUaNN10NXZ+MMyLKE5JVQVWkACdXBCIKOdvJPfI0d11AF3bI49CVBGJ+PQtOlhrq3inHENK1zNI6oBT0IfTUW44fhaC2gGNuZEEUCnEZMN\\/fAqFRT+0E21Z8W4vCEEPJpiyDoia\\/SiVEoSQHUHe1QaUxjy9VabqNWmnbUcscdH1vpWY\\/l3zmYJ8toDgR1XjBGUlBaBhRVPtITQPqCYmKJkBo4ciSfDuZh6ZBXo6MYMMleH9\\/TyaXVhdzsJ7DW0qnJ1nkcjHC5aT0ZtUxXZwM9fSRa8tZxX72Wf3TtzVVdu7HPVs58PzFSSfZiQqJYozul5Z5CvNNGf6\\/S9jSqgngzoQevq2p4raycYTKAlxSnm\\/1h8SwLjeO9YJmhjpPBvpbnQ5Ld9HM6iWo5Qbvioa\\/DToLc9vzo7OXcp8RyRddezE0Ip29tFYN8nEZvwXKuGjmO859P9dmiUlI1fhN13xT6ZX\\/NKx+v4e1311M3cAh9T1xLpm4MG5pEqAoISWTI8O5EqBDdmQVBEITfl9N9O1+g1VGp\\/nmKy9kzL+Si6edzouGhJEFqWjox0dE8+pf7kVu0SJRlmZtuv4\\/8wqLmZT+s38xfHrgHna51F+ypUyay8kvfE5ucDqOx9dR\\/doejeZboljzetrW4hPg4HvvrA+3u3+NpW6uzWm3YGhoICzs5NmWQIdAR7AVBEAThDHgL+eLj7dzz1DBGJ6vYmX1KCye1C+dsa+uWYKEgKW68CQocaFvbUMZXUv9oA+pMA+oTnR8i3SiSgufyfKqSzBj26tGUu3H0UpCjKrHcZwGNG2ekF+XyalxVepwzG1CSPFgfBm2WBsplHH8sxBphQuUGZA26H0LRdFZHCq8ebQ5YZ1bjSDWhXFGPx6lHo62h9gMPwT8Y0BToGmNqLhVSqBvZKKEu0Pmpcym4rivBHKNHXSuh1KtRxltwKmp0X4SgzCrFMsaA2gpK71pcKi3BRZ3VtlKFOlcLs2qwXi2j9tOvVelaj0uvxZClAacayaHgurKE+tFqNLkSzusbUGLdWG80E1JowRUu451dieOoCc9QN0rvWix3S+iq1Uh2UKJduEfX45johIxwTDclYtyh7ZwWo2Y1ktqO\\/f5iPBU6tJVu7CNlFHcNDeO1aEbYkbV2HNfUo1vrxZWsoNqu9nFsHUPPS0Fb8h0fbjSfddxWUYfypVHN\\/3PYMWGgrtWHHoZaa+mm78J77ZwFh0pFlNPCDJtMrVqFE4UBDieKKgKz361OSYekpVJyMtTl5qDKTg+07PETvdU7GxggBfN6iO6UIKqKOjV0dZgZqzfg8LHtLmMwt1eXsrTUwyshOlI8Mj0dNuKCNYx0KlQFqZElCYfiZLy1FotWS6lKIsTRQBfFyVibmVKtGpsEereV7qhZq2p7bmS1FqvHzmCPl1ynA6PaSI2PUygZU7j67plE7PiAJVsrWwRFFRxON1GDJzBzegSM7Etkt2BGJIShGzaA+DgDM2ZPQZdTQ9CUgcSEw7jBMeQkxhKiT2bksGgRRBQEQRB+X06nQ8ymYBN\\/iEum5mcKInZP7sbggQNaLXO7Pezed4CePZLbrK\\/Tte4Hk5tXQGpaOqNGDMVqs7F770G+X7eBLdt2dkr6Pv\\/qW+669cbmv3v37M6D997VZjblouKSM9p\\/QWHb7f7+8B9JTIhvtWzHrr1ntH9BEARBCIxM2ep\\/8sikt\\/jjVcN48\\/\\/tbx04UDlxPFyALabFMo8azfoEQjb5GaOsSsJ9WSUNphbhGVlCdTyK8CV6nIsqaVhYi2JQodkTgcFkxfZ\\/FhSHDv0nMagmllD1uYxUacK4TIXjukrshhO1mlrMT9U2\\/tOrJyTfRKiPQOYZ8RowLk7E9VoJNavKwGIgeHFPwjZ7sD2Xj+X6epSW36lBi255N8JW+uurK6G2uLEvrMdrlFAfMxHyh2R0idVYbqzAkiCjnGi1adeifyuZkMOdFUSU0L3VlZCUQqz\\/KGjdeq8luxb9u90w7ZZACcX0j2jq76mhYYIXrFo0B6IJ\\/cJNw305VBkkVPtiCNnroH5pBV6vgeB3TXjml2NDxhMjIZk1aI6EYHwwGeN3QagCbuYn+a+4nnjhfDCWsDdcWK6pwhaugEeD9sskInc6sLyciTtIg35JAtpRxVTf7IaCSMJXt30ZK0VN44bza3nr4VfY1ikzhGhYHZXIRaU1zPVEsLRVVTqQ\\/JTYGRbP95UVvFBRRbDXgxqJBo2JF+PDqQo0GSoTT8e5ebg6j6UYWBnblW995ruHC802MiOT+aDNbNIavo2IY05ZMcstMr4290pa9oUnstNdyV+qPNg1BmqsueyrVzAb4lloVONVRfByuIVHqwu4VFbQAR6Vnl1BaqZVFjIFN\\/EKyJKWHRHJrPHx88Ojj+P2iDIeKcsmXBvGo7FRFLVdDSm0N9Mvu4xk9w+82SqI6Gbn0lf5\\/qlF\\/PvZq8FyhK92J\\/HU+o2EuYtY+00Ocx9\\/mjuDgrAXbOW1J\\/fQ\\/ekv2ZVs5adP1tLzn9+IIKIgCILw+\\/JJaBQ2lQpty4lVkLjIVs8ox8la06ehkTwck4T7NLo\\/ny1fLfFcbjeyt20NUpZln2Mlvv72UpK6duGHHze1aqXYGV5\\/aykLr56PKcTYvOwPdy0iKyevVVfqbTt243A4MRj0Ae\\/b1tDAzt37Wi27\\/pr53HDtglbLFEXhjXdbj8EoCIIgCJ3OW8aXDy2icHQ4Ogla9bx0mwgbP4ywQPaj8iJHSKg3JhLzXLDf1YK\\/jW1\\/P+p4QhM9SOU6VC4IazuayDkjHYkh8oJIvPEyUqUWlRNAT8gdKYR0tHFLIR5kjRrdGz0JbxNsNaJ\\/r9OS7F+NCdONKZgC3kBC83UXor7u0uaTkHc9eEMkVJWNLftCXvUio0blAF5su\\/7pUJKceNASfOr7VcmDHKdAhbYpGKnF8GIPDC+23YdhbTyySo3KDhCDKdwDFg2Sr26\\/2lI+vuNONh87+1aIJ3i1kdyTaCAFhVaBQ0lNrRoGeb1ItB4z0SB70al11AMN+mju6xodyJEIkVXUqH3X2S36SP6e2PF04TnhPbjJoMfp4zOrIY6F3eMCSEssz574p+Il3qtg1mhobBisZX1UL9YHPCu7LypyQxK5tYMbTy79ikXjv\\/L5WUP6Su6bt5L7mpdIGJ6MI8xdSbnFC385ZYOVK3hY78HukOGpV0QQURAEQfh9KdFoWRLetqIe7fU0BxFfjIzn+cjG1m9qFLydO0R5p\\/A318r36zaes2NW19Ty1LMv8eyTjzQvkySJF599Ao\\/Xw+qv1wJgsVh5871l3HvXooD3\\/d6Hn2K1nQziXnrJDJ5+7K9t1lv15TccTE07i28hCIIgCAHyVLBve8WZb29w4bylCGt\\/HcGPB3W8fnu8KtSFuo7XO1c8atRF\\/prudUyJsdHwWBmuujAi\\/fUn\\/V9j16BuOWu0Q33m4xyqZeRoL4pGxtu\\/HttfqlH2JxKUIaGEuZGDFJQoJ84FZVjGaAi6K7TjYzlbp0eq8x\\/+kcsOsansTBPvn1sTzKE2S3V8GxLM3XVFLNJ1YYVBgwOFCGcdf6sxUxXci\\/SWVW\\/ZyTi7m5LgYNSO\\/8\\/efUdHUTVgHP7NtvROCb1XBQSpUkURERAB6b1K772DiCAgohQRUOkgRRThEwEFBVQ6UkREeicBEiCk7n5\\/hJKQZGmBUN7nHM4hO7uzd3b3zsx95947V0ll8WSL1cDmcOAefZ1Kl89Q1eTLe64Pc75uYZ9rMsdjhpmzSawyICKUog43frFEUTECtnm4E3P9Al2vuzDDx0T1S9f42zct6x9LYucg\\/OLZRIdpxy6O5Hr47f8rRBQREQE87LGXZXunycR879hLhI1DgrlmMvGtV\\/Lc3fhuXBOZ68\\/dzQ2LJeHhOrGbqzwO8xYtpfJr5alYoUy8snw2bhTeXl7MWbAEgE+nzqDsK8UpXKjAXde5fedfjJs49dbfdWpVZ9yooZjN8bfvvyNHE72Ri4iIyJPDTvjY\\/VyqbAebHQdWXMZlw+uvJ++C5CNnuUro\\/w5zLS04XO0Q6o5nl3S4JMtw2WRiRHP9k3+4XMxXmLc\\/AAAgAElEQVQD3xpZcbuQQuXwCOHy2mOEuwIOA9OeVPj2CsAS4yCy478EtbgxgWOkDdfxWfHe8OCBbsozOOKTmV5RR\\/j41H6Gx3n8lEd62vh7xOsNaIm6xKALoaxOlwH3C8cp6ZWTlpYzbD0XgisQZfFiXGA6fntqsukYioacYrg9kGOeoQwJNnjfNTO7Y6JIF23C124mbXQkl+139OB8QhihoaHJecdtERGRRyZvkXL39fzRF07SJCSINzLlYZ+L8x4AL0Zcxy8mmt\\/cYwe4VAi7wrzT\\/9E3dSbm+jzUuIN7Vq1KJV5+qcCtG5OYDBNHjp1g5+491Hr7LeyO2GHNhmHgcDj4fMZsgi9eeixli8vHx5tVS+eSNUumBMtmz1\\/M0A\\/GERkZibe3F5PHj4oXON5p7S+\\/0qnHAK5cvYbFbKZPj450bNsiwfOuXw\\/n7brN2H\\/gYLJui4iISHKzF75EeB47RJox7\\/TC5cgTFvgY\\/pSqU4zLy1fzdxI3F0me94khqtJlIv3BuGLDttkTy6VHEYqYyFS+FnmPLmPNsfuZ\\/RrATlTDk1x5yR2vIamwJtkd6xEzookqFUaMDYyLrtj22W4NO3ZkvEZErhiIMmP5xw3LhacmLbsrz+hwckTbMQGRZhsHrRaSuHlyPIY9khcjozEbZk7YXAh+8rK2B5L6yjG+u2RiWIZM\\/PSE7TZuUk9EERERYO8dIWPgjfkJox\\/jnIj3IybGjoe7O62bNcTP3xeHPfaaoNlsZvXa9axb\\/9sje++QkFAaterI99\\/MIsA\\/fi\\/Npg3rUKJYEXoPHMH2nX\\/RpE1nKlUsT8O6NXm5cEEC\\/P24EBTMn1t3sHDJcn75dTMA+fLmYvyoYRQqkD\\/B+0VFRdGmU08FiCIi8lQw7fTDfWdKl8IJx0V+\\/2b1Y3gfM9afAkjqFivJx86JDUs48UCvNWGdnxn\\/+clcpPvlsGDd7J3oZ2Wc9MA1eae5fmJctbiy+wFSKYfJxh7XFBze\\/4hccgtgArD\\/Cc6JFSKKiMgzLDZYi3mAIDDixmuMZJte+u6qvFGRd6q9Ge+xv\\/b+TWRkJO1aN03w\\/F82bKJJwzr4+caf2v3S5ZBHGiICHD12gvrN2jH\\/qymkThW\\/p2aeXDlYvvArVq1ex6RpX7Hm5w2s+XlDouvJmT0rbVs2oV7ttxMdth0eHkGbzr1uhY0iIiIiIs+iaIsni+\\/9rj8pQiGiiIg8sxw35hHxj4m+79emuvEa+2OciyQ8POEYmrDr14mOTlj+yMhIYuwxXL12LUGIGBn5KMcm3bb\\/wEFqN2zN7OmfJhjabDKZqFalEtWqVOLAwUNs\\/H0Lh\\/47wqXLIfh4e5Eze1ZKlShKgRfyJbn+oOCLtGzfne07\\/3rUmyIiIiIiInehEFFERJ5Zv7h70TQkiC\\/PHOGkxXZPvQodGBg4yB0ZTrhhYqubx2Mo6dPrvyNHeat2Yz4bN5LXKpRN9Dl5c+ckb+6c97Xe37dsp1OPAZw99xB3xRQRERERkWTzBI+0FhEReTg\\/efgwKHVGTlpseDpicHPY7\\/rP3RGDp93OLlcP2qTLymGry2Mrr8WScCYcm9WKyZzwcG2z2TCZTLjYEs4HYzE\\/3pmYQ0JCada2K70HjiAkJPSh1hUaeoXB74+hbpO2ChBFRERERJ4g6okoIiLPtK98UvGVT6r7HpT8+GZCvO306TMcOnwUhyP23Q3D4PDR41y+HBrvcYi92UhY2HX++fc\\/Qq9cjfeacxeCHnvZHQ4H87\\/5lh\\/X\\/ELr5g1p1qguvj4+d3\\/hDdfCwpi\\/aBmfTp3JxUuXH2FJRURERETkQRihoaEp0U4SERG5b3mLlEvpIjxShmFgGEa8QNDhcOBwODCZTPFCRIgN7py9JiV5enjwTvUqVKvyOkULF8LNzTXBc65fD2fL9p2sWr2OFf9b89C9GEVERERE5NFRiCgiIk+NZz1EfFZZLBZyZs9K6lQB+Ph4Exp6hVOnz3LsxMlEbxojIiIiIiJPHoWIIiLy1FCIKCIiIiIikjJ0YxURERERERERERFxSiGiiIiIiIiIiIiIOKUQUURERERERERERJxSiCgiIiIiIiIiIiJOKUQUERERERERERERpxQiioiIiIiIiIiIiFMKEUVERERERERERMQphYgiIiIiIiIiIiLilEJEERERERERERERccoIDQ11pHQhRERERERERERE5MmlnogiIiIiIiIiIiLilEJEERERERERERERcUohooiIiIiIiIiIiDilEFFEREREREREREScUogoIiIiIiIiIiIiTilEFBEREREREREREacUIoqIiIiIiIiIiIhTChFFRERERERERETEKYWIIiIiIiIiIiIi4pRCRBEREREREREREXFKIaKIiIiIiIiIiIg4pRBRREREREREREREnFKIKCIiIiIiIiIiIk5ZUroAIiIi9ypvkXIpXQQREREREZHnknoiioiIiIiIiIiIiFMKEUVERERERERERMQphYgiIiIiIiIiIiLilEJEERERERERERERcUohooiIiIiIiIiIiDilEFFEREREREREREScUogoIiIiIiIiIiIiTilEFBEREREREREREacUIoqIiIiIiIiIiIhTChFFRERERERERETEKYWIIiIiIiIiIiIi4pRCRBEREREREREREXHKktIFEBERERF5pAwTZpOBAYADu92O3ZGSBTJhNt8uj8NhJ8aekuURkfujOiwizyf1RBQRERGRZ5LhV5x+C9Zy+MA2jh\\/YxrED2zj29698+rotZQpkSstb7y9k3\\/4bZTmwjWMHtrKpf2Fd2Rd5GqgOi8hzTvs6EREREXkGmchesz3N\\/TczuNVS9oVE4QBw2Ll0POqxlcJw8SGNewTnL4VjLViPXm9Fs6RvO74\\/dpXo2AIREXSMmMdWIhG5H6rD8jwwmW1YjGgioxPvUuue63WaVHDh90Wr+Cs0Tld+t3QUyufK8d0nseZ8gdSX9rPvfOTDlATPAD+MkGCuRD\\/gGu6yLfJw1BNRRERERJ5Bdv77sg0v1xzJvI3\\/kq39DKa8ZWHf3gMcD31cY5k9eGvMSrb\\/+jGN0hhE7vqUN8u25f0V2zhfuCdLhhbnyv6\\/OXAmjBQdXS23mDI3ZMmWmbTNpmaSgOrwI2TORfdvv6Hvi+YHe72lIAN+XM\\/SFll4wDXILVZKD13J\\/k8r45HochPpX21K327NqJQx7r7RwPeNPiyeN5Y2BYrR\\/csZLOxRHJck3sVWeQwHN\\/SllJOubOY8rVm28SfW9ivygD3e7rYt8rB0dBQRERG5G3MW6o8dRsOMZlKV68qSn9ey438jeDv1jVMpc3qqDv2S3zf\\/j5X9XsHLcLYyCy80HsmgSj7Ef5qB10tNmbFyNTt\\/mkDTHDdP00wEvt6DjxrnvH1CbctH21EdKO+XxBuZM1F7RH\\/qxj3Zv9s2ABh+1J++lklvuDn\\/PNxfZtDsT+hU1DfONhi4pc1IWlfAcCEwb1ZSmcDslYHM\\/il1yhnNtbCH6RHxsMLY9OWHDBv6Of+7EBsxRIaF8YCdK54rhnd+3qlXggyPOR2wn1hC+5p9mXM0qR4sZjKXfZfq+TwwAJNHevJm8cYAXFLnIW\\/a2AKbPdOTOcAMmPDIkItsPgZYfciSwRunuwdnEqvXAFhJlSs7gRbA7EXWfJnxSepNEq27j6a8NpcUmjYgWakOx2cjdebA2GOc1Z+8udJgwYRHYEbS3JEcJajDhukefksGpnv9wUX\\/w7xBAxnxw4lEe4EmeP8k64+BV8GmfPnjGravGEPz\\/K73WICkeRZrxaSORYm\\/JgPXtLnIEWACLPjnzEWmxA61Fh+yZIg9PzD7ZCFvBlfARupMafE0AGzkqjOSnzau5dfprSmZZGVPTnYOzWhL4VKNGb8\\/7qft4PJ3fSlRriUTdm1mcJXKlB+2kQjAlPY1Rs6ewcc1M95XyBvz3wo+GDGWwfP2PXw9cy9O\\/wXzmd4wJ\\/maTODHeR0o+fBf7zPnfo+3ChFFRERE7sYeAr7lKFsoLw07F2VrtxqUaT6ZX4NigwZr8WYMq3COTzv2ZMiyA1xz2iXFTrh7Zmq\\/XpB4TWxTWmr3aEnqtcNp2vcLNpy033p+0OEgcr3XnhqpDcBEhlqdaJX6DIdCkngj+1Ws6d6kanGv2422u2wDALZ8vPyCFwVeyum0B4Br5oIUzvkirT+bzpjKgbHPNWel9ZQZ9CpmA\\/cKvD+3BxW9rRTpPImPqwc+NSedZhdXXJKjsBZP0mRIh1fwTlb\\/eR6Lt8tT8xmkPBsFWw2iXfqrXHiMY0RNGeqzZOtUaqavwIyt8+mSJ+E3ZqR+g0GDS2INCsOBgc\\/rvVk0oDy+hoWXO3zMuJqZMWPh5S5T+apZbiymNNQbM5WuRay4lOvN8gGl8XzQAiZWrwHMuWkzcRytXjBjBLzJmK\\/eo2QSXYESrbuPoLzmLHX5+n9T6FLQI5HgyITFcp+1wTBjNd9bWKI6\\/OgYqasyYUkfKnkbWIu1Z\\/YHVchkzUyLzz6mRa64CcSdddjGyz1msqD9izeCsETXjneFQXw\\/+V1y3VP+HMGxbZvYfSGxwD+RfUhS9ceUhprd3+L44HeptdiXbp1ew\\/8hc7nwGB8KvV2G\\/PEOpDZKdf2U8TUzYDJno\\/n4cbR6IeGR1qNCb5aPrUZGk5l8LT9iWuNcWP3f4uN5bXnZAniWo1srBxPeqc+E63XpUyvD4\\/ld2sMJCY0Eiwe+HnHLHcmlC9ew+QfgGXmJi+E3HnY4cJjNEBNzj710rfikTUemtAaHf93A3qtWrA+bj0acZsfGLWw5FMyFf7ax6Y+\\/Of34ZjN5Stz\\/8fZ53w+KiIiI3J3jKoePXqNIjaZUyBDMkVNRuPjmIF\\/m2EaT4eKK9eJ\\/7Nh7gIOOfLya38tJjws7Jw4dx5QuHX7xzsSsuLpEcnL\\/Xvbtu0jaMkXJaI1dEn14MWPXZKd1vZxYLHlo3MCbheNXcCqpzlKOKxw6fJHAjGlu9wC4yzYAuBQuS77N37G\\/YClyJXFF2vB9hWETa3JyeEPKvbeSLIM+Y1hZX4yYE2z\\/y07RUnlwtUQTEZmKdGmsREdH4Rfgk+Ck0\\/Apy4hvV7Bm5GukftiGgmHCbL6zl0tij91lNf5Vmf77JrZ\\/VOHWMCiT2XRHzxgjkccSPm4KeIvJa1byx\\/qV\\/LH+f+zY+itbZ7WhuPNuqs8FS6ZKvD9rEeu+GUnjvAm7hZjSV6NX5UNM+HI\\/SfUjteV+lynfrWLH+oVMb1XgdjBhePBSzaa8GXc4sikdFZvWpLifgTnjm4z7dg3\\/7FrH2gk1yX2jjll905ExfAVt3urPd6e3MbROV2Ye8SJjRv84vYlcKd6mBWmXTuX7Cw7AQei+fZwqUIayfm7YLA5Spw3AIJp9Ow4QWKI4mcwxREa7EpjWG1tMNJG+fvg+aAsssXoNEPMfu\\/7xp2z5nLjbbFjcUpHWO\\/aCQ+aaI\\/h2ejMKmp3U3fstrymQ2uMWs3lpV0q7J17UmBPrmPmbL52nfUSLPLcTTVuud5nx80aO7N\\/CvhXDqZU5kR2NWyAFir1IFo\\/YbchYdRjrtv\\/JkX2\\/sXFyfZx1FFMdfrQcF\\/ey40w+yhRxxxodRUSqQAKtMURFexMQ54eSsA5Hsmv+PM7WHMfnTXKR+FfoIHTzHBaaWjFrzFtkviNf83ixKu3fyIoZMKWrzazN69m79Rf2\\/L6KtdM7UTG1s\\/cn6fpjeOHnfY1zQVHEhF4mJndecjxkD+iYI4c5GpCe9Na4j0ay968j5Cn3ChlcrVhNAQQG3Ciza2F6zJrJh5UDuP7Xbg7mKk4pfzNREVEEBKbBhRhi3Hzxt4Hh5otPVDDnrzsIuRRGnhdyJHnRz6XIe3y7Zhlf1Mv0YEO+DSPOMdSNvHVHsm7LBvZuWcGc5vlwAwzPgnSe9T\\/2\\/bGGPX8sZHSl1JgA+\\/mfGdyoBT1WnMMw38NOz5yBJlO+v1HfVrF10wb2\\/TSO5nnjXxExTCYSrs7AL0dhSuYOiP9ZxJxk9eRPmL7lEkFbFjBqygZOPGeTlz6K461CRBEREZG7snMx6DKemVJhv5SHQSu\\/Y9mw6hRO44kBRP65iGlX6rBi++\\/sXfkxg+sUIKmRxgD20MtccfPAI+5z7KdYPvNX8o5azb87V7H0w1ZUutWKus4fXy3haoVXyV\\/4TV49sZA5\\/zgb6GMn5PJV3Dzc4z3mbBvAg9LVi3Fs3RzWX61IrQLWRNbrQolOfXl153iG\\/nSe0L9m0ab3n5Qa0YvKfg7OnAoifdV+LJjTiazrN+HV9QvGFf2bad8dSjAsyRF9jeALQVy4FMbDdgywvjKAbTs\\/4u04Q8MsBTuzfudnNAi49wa\\/I2Q7sz6ZxAfzdhMGYM5Dz+83s7xlxtsnzdbSjPsjkTs8W0syeuNmZlSPjS7s57+nXaVqvFKxOqUr1eatdnM4XrA1fWulf75PwA0\\/3unXhKjPWlJtyDFqDqxD1nitWw\\/KtW+Idd4XrLmjp637awNZM6Yy\\/oaVYo1aUXDvxzTu8zOp2rbizZtD+gwPCr3TlCpZ4zQlTel5tXlNivuZyfV2U964MIXXSndlXc4G1MwdO4Q3W8OxzGmdgyvBHtT7dAKN\\/C4RnrEWn3\\/ZggI3VmXOWpvepXcwdu5\\/t37P9qALBHu+TK\\/ZixhX5ADTl+0nGog4e5ZLOWrz6bzJtDatYEeu4SzumZ4fZ\\/0cJ\\/y3kOPV+rRp3ij+v6YVSaStR+L1GiCa8+dCyVLrA35c0ADTkoWsCYoNOS8d\\/IPV6\\/ZwxuGs7hr3WN4bHFGEBAVz\\/kIIYUldyLAHs25EZ3puyszA6R9QN4sFcKV8m45UvPYD3doMYnHkawxpXypBoGROV4XRX42kcQ4TWArQssdbuP0ymmZd53CyaCf6VPFN8uKA6vAjZj\\/PyfO+vNp9IktHFOavVWE0+mo87wTNYf6Om3vyxOtwzJm19G77OddbTmB81TSJf4aRR5nbvQdzArrydf+ScYblG3i8WI0Ob8TOf2g\\/+wPdatajUvX6vNn8E3ZmaczARrluBEhJ7UOSqD8xR\\/huzmlqzF7B910K4ebtlWBKEiOgEO82vaOeNm9AveKpE90Ox7UQQuzueLrGXZGDkPPB2PM14usVE6h2YS6z\\/7zxmUWdYce69fx26Ar2y+c4Q0HafzaTqVUv8M3xMnz9dSPMcxaxIQwcwRuY9WchJq9bxMgKvrh4eSURykJMWAjng4IIvhJ1R29AA8+8r9Gs2btUyJDEr9n2OtN2r2F0aStg4F+hN18OLUnQ7L7UG7SFHN27US+9mTTV2tM1135G1G9EuxVm6vSox+1pLk2ka\\/Q5B9d2p9jdJjiMOc7X7WpQqmJ1yrzxLpUbDmB+SEn693wzzoVGL2pP3ZTI3dCtFGv\\/GfN7liKJ6xoPdE7w1HuI460psAZTl\\/einDXh8VZ3ZxYRERG5B1HRUVzaNJn6I3cknKfn+n6mtmjAsbHz+MBnJi0\\/2MxFB4CBe2BW0kSc4OilOK+y27GbTHc0Puyc\\/WkkVY6fYemcymzv2pev\\/7v9GvvJH\\/k2aCQNqps49L+ZBN8837P4kCWLKxcOnyMszjmgPcaByRT\\/HZxtgynz23Qoe4ivPzrFFo9zdGv5GtO6\\/kiQA0xe6cnpHcqhc7l4swKs6ruJEO+8vFHMYOvPXzBxzzJaVktDj4jrXN7wJXWH\\/HkjGJzMyKQ+0Gs7mNi2RSILLJToNJG24VN4b8b9zIlkYMRtG8TrQeGEKQPvjhzAi78MYvias2yY\\/dXd3wdw3G18liOc4FOnCMaEd943aNSkCgVtl9kYYX3wOfGeBYYLXu5XOXn6OuGR5whxz4RXnMWWPA3oUeBXho48yZ35lMkjFZnSeGIGzCYT4CDs6D7+vvoqOXP44\\/tvJHaXLGQNiOJa+B1fkCk1+V7KyW43g4snLpH61RqUs+xhclQW8uV2p3DuVKT2K06pQufJEeBPhtLFKXwqO\\/72C0Q5AMOHyp1qETKzHZuv3V6tIyKCiOi9fNqgG0uuxHm\\/iHCunf6Rfg2msO9Gz5ePEnwYJrwCs5Ajxx1NsugYdiXRbSixeg0OIiPCObtyBJXG7o1TZxxcP3+Ug0eucd2c30ndTcvP2+6lvDdXG8za0e1Ym9Tym2LO8P2AznhPmsHw4e+wufVGMmVwJ2jLar7bsJO\\/8jelcYVspDVt5FhSYaQ1kExpo9m1+nvWrfEksH5z3suZETOXb2+n6vDj4wjnekQUW6d1ou3Km+NWP4v3lAR12GTD08MltofnxZ\\/54ItKrKpbntSrd8V5lRlXTzdsJgM4ycIxS6g6uyZlxv7BrbfBwJYlH4Uy7OFwhBXvgMwULP0mTRpVIGDf13z0XezciM72IYnXnxiOLh\\/Mm8vBCKjJ3JUvc+fIecPFj8zZs5ImXr10cOmcaxK\\/BTsxdoM738oREUHYocW0bDQn\\/m\\/efoUTBw\\/jGRoDjnDCr\\/3L7B7t+OrMjSdNiLuSC6wZ2YI1I8FWaRTb61qwGJDYmOHoAwt5r8HCRMpnpUTpNPz+9QIOu3niZkTEbmfc8xIjtiew2Qy4FqbLwDcIndGelp\\/s4ZqXK\\/8M70TOjCYcDgf2qyfZf+AAe9bv52pFH3xMcHOiSsMwEi1bYp\\/Z1QunuQqY\\/fJRu2Et3spj4eK6aFxvbV\\/scf5eVmfceY51r+cEz5KHON5i8SQwYwAeBly743irEFFERETkHhlJnoGaSPNmb4YW\\/oM+dZZy+Gbr1pyJZpMW0fFQD4r025jkUJFbXPLRYWQDoqa144PfQ+OfKDsusWGzhfd7htF\\/wpVby2xle7JqUhY+e6sFnyfZEr\\/LNhi+VO7SFP8f+rAmxE7Eynn8\\/F5fOr68geHbonipw+cse20dNatvxmq14e7njX\\/RBozsH07PbV\\/j4WImVWo\\/jPN3ffvbXPPRbEgrihyZz6AZO7hya2NNBOR4iaJhN288YyV9wRLkD4jbHHAQGRGD1cWCgZlU5fPjY\\/OmeocWeP19mDNhBv5lipIm7BBnnU9QCYY7mV4swgv7bSTeDjOT++0uDPfYzra9Z4gKfJ3C7kGsSXTyIAuFa79He+\\/\\/OHr2Gu5pslGkfCVqlM\\/ElU0L6FZjJj8cuobj+e3HBPZzLPn0T8aP\\/4q3TSH8OXH4rdAKIxXvdHmTo1NasyvC2Uqi+GPWVLaN6cWPv6TB02rCMW0hHXxSYbJHcPrXT2m+487+rTYKd59B1bQeWI0J\\/NA09tGp88rj8Pbg3B\\/zGPlLFoZMaYj598WsydODWa192T+pM3\\/HgEvBpnTO\\/D969LtwR2PLgQODBK3Te2o0R7JrwRh23f2J9yZB5TaRsUpXPm3xH23f+sVp3TXdz62FDW9Kte1Di8y7mDhiCfviflfWQF4qnZtUcXqQhR0\\/i+2tPGQzVnL85FXSvtqAdrt9CcnqjsnVFTdnLfuo0xw7Y6V2gzbUNY6Q28eEq+udd\\/BQHX6snP1WEqnDpgx1mbu6J8WssS+OvnqMHz\\/cSrAjTm93c166L51Fp+xmwIE9KpQDy0ayI95B04GRtjITZ9ciQwZfwi+eYv\\/WX1jQtS7LdgfHhsr3vA+5P\\/bT6\\/l42PrkWVliv3dbAVqPHknmaQ1psuQedx\\/3wJytKsN7lOXK0nGMXR8UZ98Vxda\\/0zBj\\/mec2vwtEydv4OrVa5jLVaBJXRsXQy5yNVNlCtl8sDRpRZOSRanv+xdf\\/O1HqVfL4ZK7EoWsMUSXb06104c5mLYBXy\\/NzUH3l3A7Pg\\/\\/CpV52xpOWLgrL5bLhhH0GxfuZaNc01O+cQcGtqtM5qCdHDy0nY0bzFSoW5mz566DW3Yq5zG4sCXYyWdkv7UtrZp6cfbcaYIiTfd+TvAseUTHW4WIIiIiIvcoqevYhk9ZBvQvyMYhDVh7Mc4JasxxpreowsKoi3cPEDGTp3l\\/WkbNpvZXhxIZ4mvn3J79nDx0hV2ht98jcv0oypYzExp89wAxyW1wzUBG+4+Mnr6XCIDr25j06RZ650iPZdt\\/7JjQmGJTr3MhwiBy9gkWTFrLu+FnOBzix4Ktdbh+bA2DRx8iuvQ9FSG2HC6pyV+yJGU8f8bdIE6IGBvL3GalRLvxTKoUd+hhJH\\/9eZkXSqTBjIOoiwdZ\\/0swxVu25w2rFRMOokP+ZdmIGfwazl047tJgs3PVowjNOleiJQ7sERfZOW840\\/ckFkA4CPMsRqfuDfFyjyEs5Bz\\/bv+N8a26s3DTKa7frSjPBQdXds6ibYNZCZa4F2vBe17LaLPucqLfidligugoooDIQ8vpVns5eLzBFxua8FedZkw6kkQdMGy4GH8z6Z3OrCgznvWvrKTWotT0652H5R1GsPrS7Xeb\\/\\/XN\\/03iw5v\\/NaWnSdey7P60BX8n0TXWMJLoCvQYJbxAYOfo7Pd4cTaAjZAk6+6\\/RLtUuI83cidjwRKUz3udhTbih4imPLQcP4Ha3jcK44gNjVaP\\/4atUdeJmjCUyUM70nTIKAK9rTgOJDkwOTbwiN7L5P6TSN\\/3XQaPTYevq8HZXQkTW9XhJ0Niddh+Yi7v5J+b6PMn1Kx743\\/7+LBy0dt1LgEDFxcLZ38cQcVRO5PsoX63fcgTwTAS1tWIP+hf4dXY\\/1szJdtbmfyyU6p0CYK3eWEQFGeJlQyufzOqwyR2BcfWg5PzPuOrfB1pN+hlfFx94eoxVo\\/qwnfpWjKs8Ut4upno+VmpeOt\\/q017qjiiuH7lIufDzTgcF4nIXYdxH4dz0RxARouda6d+5+MeyzgWA4lNknKTa66ajJ\\/cm2reh1j0SVsaL9yNtWJvJg\\/qR740bniawRFzndN\\/zKTz4sTvyI3DgYMY9tzYljZ9yuDt4nqf5wTPkgc\\/3mI2Y4qOIpKEx1sjNDT0ia1fIiIiceUtUi6liyDPLQOvAm9Q3XMXC38\\/l3DYh+FBrpczcXH7gdvDjB+AJc2LFHQ7yPxvO3sAACAASURBVI5jd48c799dtuE+WL18cQ0P4UqMFR9fV8IvhxJhB\\/dc5XjT5wDLt51\\/iPVbKD5wObMzfU6p9j9w6cYQJpPFFf9cDfhicV3+bl2NgX\\/c+0Bnp0yBtJj9LY22NOXNT\\/+N3zi1FmXkmo9JNaYK7f53Lak1xPJ+k+nru3KuXXUGbUmmsj1XzGQuU508Z1ax5r87f\\/8GroHF6Dh+FK\\/+2oYa047ENiDN\\/pTq8jEz3thBs4EwdlIgE3qepMuE7Eyp0ptllxxg8iR\\/4w+Y8drv1G+xkNMv9+HXYdF0qzsNv6FzqbSyLr02OJ+V0\\/DOR7WKrvzx\\/U4S3AjWkpU3Gmbn2KKf+SdOmGb45uetkgabV+\\/j0iNvbRmkerkar5l\\/Z\\/GWIKd1L6m6+3jLC2Cj1OBvmVdgIa\\/Wjz+001asNxu+zM20Su\\/x9dk4C8w56LpsPu9uas2rH+2JM5xZdfjxMZGldHWynviBDcfvjHGc1eGHYw0sw5BpvTCPqc+AzUmlQMnw\\/q65qFo7DXsXbuLYI7gBhylDSRoWvsL3K\\/eRZApjSkOJqvkIWbuBA3dJrc1ZytA4z1kW\\/XSIpzobs75Iv+9m0vjSTFp1msGfl+7zDMIIoPFXK+lxrAslhm556HmWn33O64rJPROVen7EmMyLqPzecs7ZiXe8VYgoIiJPDYWIIs8H12K9+fnLsuz4YBAfrjpIUIQdLP681HAw0zpZmfhWO746ZSJzudpUiNnA\\/H3+VK+ajv3fbSMqawBX\\/jlCWJo8ZOM4+06F3aVHionMjabyU1crcweP5ouNRwmJNrD5ZKdSx8GMqnSYblXeZ0ea7HicP8hxR3ryB4Zz8OAFoiw2rGYTrqlfoFbvoQzI+wsN3p7AtmQcRvd8M0hT5xPWDy6Jp6udk2sm0LrXN+yPeYXRa0ZTK5UH5gu\\/8VGXgXyxJ4aAVBYuB8Xgn86FS0H5GfHTaGoGuGE5\\/wvD3hvE3EORYM5IjSHD6V0xE5bzvzC8\\/Rj+d\\/5hInW5ZyYrbi5WTFZPcrzalo\\/fr0r4pEbU+OI4Lj4euNrcSZu3PO36daLi8dFU6vgD50wuuNnMmD3SU6bFQMY392Vhk\\/qM2B6v+6Pq8DPJRJamU\\/mh24t4ukay5+sBtBj7+0NdqJMnk6VgF9bNLcK8ai354njC\\/bF7utxkN59i31kbOfL6cOnAUS6ZPfBxt+Hik4nitToyvGUA3zRuyIe7HsVF2OeDOWcLln3zHoU8rIQfWkH\\/9iP59mzxBMdbhYgiIvLUUIgo8pwwPCncegxfdCtFetvtcV\\/2q4dY+n5v+iw7SqQpIy1nL6Kf4zNqzHmRRRMKsWzMZqoOeJPNnZvzV4uFDOITyjVewIm7ZUTmtLzWawyftCiI\\/60Z9R1EB+1kaq\\/ejNlVhCm\\/jabQ4rZ0DB\\/A8mZH6VpuINeHrmHm214YOIg49SujOg5gxr6wR\\/axPI8MtwAyp3Yj5lowZ4Kv3xjCZsM3bQCehBF8IYTriX6\\/NnzSBuBlXCf4wmWuP4JeRXJ\\/zLnasOr7DrxoAUd0EH98PZJu4zZwkjz0\\/m4e3fKYwRHDxV1z6dLxU3654CBN\\/Sn8+X5JbDiICfmb+e8PYth3RxL2ulIdfiaZ3PxJ728jMjSY81fUv+xZZSnWh03T\\/Bn+Sj9W3Vm5TWlp+tX3jPD8nCoTMzD\\/iwr81KoK7\\/t+yM4Jr+FugOP6CVaO6kHXhU95j8yUZvYgbQY\\/XKOucPZsCBEOSOx4qxBRRESeGgoRRZ4vNv+s5M8egJsZHJGhnDh0mFNX4qZBZjJVbEHz7Hv54qs\\/ORdjxjfQl8hzQUR6pyOQ85wMudf0yMA1IAt5swXgZgJ7xCWO\\/HOE8zfu8usSEIjX1bMEOfzJ7B\\/BybNhuGd6gQLpXIi+HsR\\/B45xUW1ckaRZAshTMBPeMdc4e\\/QoJ0JuVhgrafIWIIc3RIac5O+D52\\/dad7wyULhnH5wPZij\\/53kYoTTu3qoDos8hQz\\/qsxc043wwfXpuCrhTVMMt1QEulzmTIiVtBk9CD0RRLhXJgrnS4NLzHXO\\/HeQo5c1BcHjohBRRESeGgoRRSQ+K4U7TOKjUtvo02I6O9WGEBERecq4UKjTTL5paeWHceP5fO0\\/nAu\\/2cXcQVTYVa7r+P7EUIgoIiJPDYWIIiIiIiLPGJMvxZr15YP2r5Pfz8LtiUwi2TDoLRotSthDUVKGQkQREXlqKEQUEREREXlGmT0IzJwOfxczhgHgIOzcEY5oroEnhiWlCyAiIiIiIiIiIs+5mGucPXKIsyldDkmSKaULICIiIiIiIiIiIk82hYgiIiIiIiIiIiLilEJEERERERERERERcUohooiIiIiIiIiIiDilEFFEREREREREREScUogoIiIiIiIiIiIiTilEFBEREREREREREacUIoqIiIiIiIiIiIhTChFFRERERERERETEKYWIIiIiIiIiIiIi4pQRGhrqSOlCiIiIiIiIiIiIyJNLPRFFRERERERERETEKYWIIiIiIiIiIiIi4pRCRBEREREREREREXFKIaKIiIiIiIiIiIg4pRBRREREREREREREnFKIKCIiIiIiIiIiIk4pRBQRERERERERERGnFCKKiIiIiIiIiIiIUwoRRURERERERERExCmFiCIiIiIiIiIiIuKUJaULICIicr\\/yFimX0kUQERERERF5rqgnooiIiIiIiIiIiDilEFFEREREREREREScUogoIiIiIiIiIiIiTilEFBEREREREREREacUIoqIiIiIiIiIiIhTChFFRERERERERETEKYWIIiIiIiIiIiIi4pQlpQsgIiIij1+6wLRUe\\/N1oqKjWbV6LecvBKd0kSQZVatSCU8PDxYuWZ7SRRERJ8xmE3a7gwZ13qFBnZrs3rOPNT\\/\\/yrYdu7kWFpbSxROgdKnidO\\/Ullw5smG327FarTgcDgzDwOFwEBMTg8MBVquFJct\\/YPzEqVy5ei2liy0PwDAMDMPA1cWFbFkzY3fY+fvAv7eWORyOFC6hJJfMGTMw+v2BWC0WBr\\/\\/EQcOHkrpIj01FCKKiIg8hwq+mI9hA3sBcOLkadat\\/y2FSyTJwdXVhQG9u9KqaQMAypcpSZ\\/BI7ly5WoKl0weFS8vT8qXKUWliuV5IW9uvL29OHvuPHv3H2Dl6nVs3b6LyMjIlC6m3MFisZAzRzZyZMvC7j37KFggP0VeKkD+vLkpW7okS5f\\/wKz5iwkJCU3poj73GtWtRaniL9\\/6+1pYGKdOn8VsNuFwQIC\\/H36+PgDUq\\/U2Z86eY9WP6zhx6nRKFVkekMPhwM3VlUIF8lOvdg0cOJi7cCm7\\/9pHdExMShdPkklg2jTMnvEZuXJkA6Djey3o3HNgCpfq6aEQUURE5BlnMplo27IxwRcvsXjZCoBbJ04AeXLluBUi1qlVnQB\\/P774ci52uz1FyisPpswrxRk\\/ahipAvxp\\/l43Ll66xIzJ4\\/nzl5X0HzaK735YndJFlGSWJVNGBvbtRoWypfBwd7\\/1eIb0gbxcuCA1q1dh7qKlfDp1poLkJ4TFbKby6xVoWK8WeXPnxNfHh259hxCYJjV79v3NzNkLqFe7Bj06v8crJYvRrc8Qzp47n9LFfq7lz5f71v+PHjtBt75DbvVaslos9OnekSYN3gXA29uL\\/j07U\\/2tN+jSaxAnTp4mKioqRcr9vDO7uWO5HkbEPTz3Zi9Ddzc3Xq9Yjm4d25AnVw4AChV4gfGffs7aX34lIiJSPRKfcunTBTJn+qfxzoPjHj8BMmVIT9+enRjx4cecvxD0uIv4xFOIKCIi8oxr27Ixg\\/t2B+DlwgWJioymTs1qt5Z3ad+K1Kn8cXN3o0n9d289\\/vmM2Y+9rHL\\/LBYLIwb1plmjuvy45he69xtK+sC0eHp6UKJCVT4Y2o8pE0ZT+bVX6Tf0A0JDr6R0kSUZlH2lBGNHDSFThvRJPsfb24sObZpTrMhLdO0zmGPHTz7GEsqdvDw9GNyvBw3qvIPJdHtq+oiICNKnC+TAwUMsXraCZd+tpHmjevTv1YVPPhpBm449NTw2BcVER9\\/6\\/\\/5\\/DrJ1+65bf1ssFqzW+E3qlavXUbFcaV4uXJDw8AhOnzn72Mr63LOlomCF16iQzw\\/jwnYWLdzK2Xu4HupwOPDy8qR5o7q0bdkEfz\\/fW8vy5MrB6BED+eLLzHw9dxFXrl7DZDLpQutTKHfO7MyYMp4c2bLGe\\/zO7zJ3rhzUrF6FLJkyUqdJG8LD7yWKfn7oxioiIiLJwWTBZjM\\/wIHVwCtjHvJn8MDARNpS9ejasixZkvEy3+kz54iJiT1BalL\\/XVo2rc\\/R4yf4fMZsPp8xm6PHT9C2ZZNbAaLdbuf0mXPJV4CnkMlsw2Z5BKdJ5oy83W8oQ6tnS5YruRXKvsJva5ZTq0ZVWnfsScce\\/encriWrv1vAd4u+5oOh\\/Rg+ajy1G7bilZJF+ePnH6j+1hvJ8M5PMLMn6bOkxsNI6YLEYbjgn9oHl2QqU6YM6Zk49n2nAWJcxV5+iXEfDMHFxZY8BXgsLARkz0dOP3PKvH0yf2fubm6MGNyHRvVqxQsQL4eEEHb9OunTBXLx0mUAYmLszJy9gGGjxlOiaGFaNKmPm5tr8hTkKeB8\\/2vCYrNiifu9mNzJXLwqXT+YzNxOBR5pL5k7wwSz2YRhxP+R\\/Lx+I+ERERg8STuhx8jp+ZAVvwwZSZVMP2eLVwCpPEyAiYwVmtK7dUXSXdjNH\\/9cw79Me7q87n7XdQBkyZyRwX2707NLu3gB4k3+fr707NKOwf16kCVzRgWIj4yBxWrDkky7favViq+PD6kC\\/KlRrTJL5s1IECDeycvLk3Xrf+ODjyZS5KUCdGnfKnkK8xQzvF+kQfcudKqYEQsKEUVERO6BDd8bjUmLZwCp3BMePt2qjGb\\/hgGUtd7vuq2U6jadBR0KYcFKvmqt6dmhBkW8k6\\/xsWLVT8xfvAyAyMhIBg4fzZCRYzl+8hTHT55iyMixDBw++ta8abPmfcOKVT8l2\\/s\\/fayUHrqS\\/Z9WxiPZ123g4pOKAE\\/LQzUvfX18GDmkL\\/O+nMyefQcoWaEqV65eZfV3C+nQpjkWS2wzumHdmqz\\/cSlp06amVMVqLPt+FZ9PHMPnE8eQPl1g8mzSE8b9tYH8vHouA0ved2V8SBZKDfkf\\/0x4jfhRnUGaehPYumkln1RO6heV1GsT8vLyZMiAHqRNkzrBsrade1OmUg2mzpiVYNkrJYvxXqumeHl53uP2pDBbSQYunMu3fUre9TN5qLepPIaDG\\/pSKl7ylLzfmZubK43q16ZurbcTLLt48TI2qxWbzcrRYyfiLftm2fccPnqcurXepkTRIvezWU8uiyep\\/d0wYcLdPwCvBImf8\\/2vKV1dFm5bSM8XzBg++anTYxTf\\/ryWTXMGUD9rMNv2BnG3eMdI8y6L\\/lpA19wPcNnPuPue2zA9y+Hhw50PGanfZsrqb1nYNtc9h71Jfl+WIgxe8RPbF7Qmr9lO8PFTRGZ8lYHT57JsXFOK2f9i2zHnv4YM6QN5p9qbTPzofRrVq4XFYiEmxp7oP4vFQqN6tZj40fvUrF6FrFky3eMWyD0z56b78g180zj9QwdVpUsVZ82KRfy2Zjm\\/\\/bScKRNGE+Dv5\\/Q1adOkZtXSuVR+vQJTpn\\/Njl17aNuiCekC0z5kaZ5uptSFqdusMc0r58bLUIgoIiJyV5YS3Vnz2\\/d8VCk37836ka3T6pD+kRxBI1g\\/9B1eqtifby86wJaftlO+ZE7nl281piwvNmf+d9PoUjgjtcbMZcWQ8vjfpb3icDiIiY6dEHzE6AlcvXaNWdMmMmpYf0YN68+saRO5eu0aI0ZPACAyMur5mu\\/HnJUG42awaEB5Uj1E28+rTHe+Wz6Wxrny0XbGApZ0LYxLnOXWl9qw+PvRFPl5DEszD+LHGY3J94BX2+vUqs67NavTqkMPBo8Yw\\/BBvVk0axo5s2dN8Nx0gWmZMmE0kz\\/+kJmzF1CnSVuKFy18aw6vlGPFxZbwAzdne4eJ86Yx7PWA+w5a3bKUoLJtBU1q92KVXyVeze5+\\/2GtYcM1WVMrB0Frp9F38EA+\\/u3h77ZbvkwpXq9QNtFlx46f5MjR40nebb1G1cqUL1PqocuQnAzvVKRxu+NBWwbKVPFhVYcGNPzOk7fLZeXe+hMll+T9zkoULULDujUTXXbu\\/AVcXVyxx9gJ8PejVImi9OzSjqmfjGb+V1PImjkTgWnTUKLYsxAimsj73gy2bRhL\\/dxvM23DjyzvmNtJmGTg\\/UoH5i4YR6u8CXeWhldhGrauTNaD06j\\/WiVeaTSET9afuWuIKA\\/uYc6HDK+cvFYqhClNmtJvZw6qlUj\\/cBcIovczZ8Qoeg5fxr8xYM5fhU61XyBoUW9eL\\/Mmb3X6hGX\\/hDtdRfasWWjaqA7FXn4J4MZdt0n0383zomIvv0SThu+S7VkKEd2L03\\/BfKY3zEm+JhP4cV4HSj7lnZ87tGlGrhzZ8Pfzxdvb655eY7VaCPD3Y9Sw\\/litVj6ZPB03N1eqVan0iEv7CJht2BLsNk2kfaMvi+YNp07me2\\/IxBxeTLt3G1F71G9ccmhORBERkbuK3vYFTRp\\/z+Xd\\/3Ll75b8YfqPM\\/fQSjFcvEnlFknw5fB7btRYXS1Ehd2Y+8rhwGGYMTtiuBnp2c\\/tZ8NmC4fOXebC9q1sijjFtSTyvnSBaSnyUgGyZMpIzepV2Lv\\/AHv3H2DOjEl4eXrw+5\\/bAChVoigjh\\/SjSetO7N1\\/gPrv1iAo+CLHTpxkx649nDn7rA9tduAg9nN+mMbn9eN\\/sWHjCfafP49tw68YR04Tdzr9mFO7WfuriZOHgjgctZ6fTuy5p99RYmbN+4b5i5bxdtU3WLdy8a07gwJcvHSZXX\\/tA4eDvHly3upxWPn1ClQo+wqjP55E2UrvEGNPyTtNmkhX40OWNjtJr5YT2Xw5zo\\/YYQezGaITKZ\\/ZFT8\\/G2HBoUQk+N2byf52d8Y1PUb3er\\/y9ogh5FxwnN\\/G7yU6zrNMLt6k8jYIvRhCeEy8Bfj6+fJS+8mMzfU9LdvPZs\\/D50cA2IN2s2RR8qyrUsXy2GyJN71dXWNja\\/ckhr5my5KZShXL88P\\/1iRPYR6W4cfbIxcxzH06DTot5MCN9r45XRk6DWzFpffb8G3pHozMs4QDm6az18lP1mSxYERHk1y\\/6uT9zsqRJVPGRJddCArGw9MdDw932rZsTJvmjbBYLJw+e5YD\\/xziiy\\/ncPT4Sf7+52DyFCZF2flndj\\/qbIpi778X+LnBMbxPHIpXP+\\/kcIDZYpDY6FH7mV+Ys6YRH5etSIlUS9ic6JSfBi4+\\/nhGXSY4THfXfVgPej4EYHmhNqM+rMCatp052mEIfZjM7sbzOPLAX0s4h35eyqEbf13btJQF\\/5amYflipJ2xngP3sAYvT09W\\/biOY8dPUrN6FaxW5z3Yo6Ki+HbF\\/9i77wBurnde\\/XiKRZxmx8YtBB0K5gLb2OR7mtO3TmAMrJ7++FnDuHjputP6CoDZHR\\/XSEKuOX+mYTJhNgwcOLDH2EnuS9cW8\\/1HXSdPnWHUuM8Y8\\/5AXi33Cut\\/+53w8AjKlS7J9K\\/mJnMJHyHDm4rDZjHY8hkNB\\/3MmTh1zAGYLZDYKWBi7RbDpzh9Z3xEh0I+mKIvsHlyP4WIIiIiiTE80vFCDhdO7zvKxZhLHNh2KXbBiT1sv\\/kkiz+58qfh+n\\/\\/EL\\/fj0GqCr2Y\\/3F98nuE8+\\/iITQYsi7+5N6GGavVICbyxt\\/mAMr3mMHYNkXwC\\/6DsZ16M2XX30xv34zphil23qUYO\\/YLW5g2ZkvsaxZ\\/xj7DkWSjuWrl1xg+qPetv+cv\\/pZ8eXLFBohbtlO\\/WTsAls6fSdEihciXJxe\\/bf6T9q2bMbBPVwCGjhzLjFnzH\\/hzfCrEHGNhrxYs5ObnnPjTDJMJEw5i7HFPdU1YbBaIjiT6+Do+HnfjufOmsRX77ZMwkwkj+MZ3Z5gwH5\\/FRzF2HBiYzAbE2OMHmIYJs4kkT6wjIyMZN2oItWtUTbBs5+49NG3TBYAPhw+gacM6t5a5uNgY2r8Hr1coQ4t23e\\/1E3oE7JzdsIhVzScwfepVGrWeya4baXjM0e\\/pWv97MJkwm4xbn7c5QxUmfD2EWllshO6ZRZuWn7EpJO6nE8O+SY3JP81OVAysKr0GIiOJNpkw4yDGbpC+2ggWj6pCFjeDiNO\\/Meq9Psw8EIElUxXGTR\\/Eu9lduRYahot3V2Z\\/HEqtTss54qwdZHiQpWAevM7tZe+9zN5\\/B5PZBHY79vtoPb2QN3e8v9t27n1rDtOD\\/\\/4HwPxvvmXDxj8AeP3VsnTr2AaI\\/f7vfH1KsmQuR\\/UiPqRK3ZN5EyKp13UZhyIh5tgi6pf4BhwOjJVVedGIuSNTNmE236gfHgXpMmUs3Uqlxgjew6z+PRmx3smQ1njfWWRSz0rSg3xnBV7Il+R8lEHBlzj031HmLFjC2fMXOHrsBCbDwNPTg7RpUuPj4832nbs5dPjofZf1SeGaJid5fS7z979BRFw5ypYb9yUJ27uTm7ccMXwyUyiLgyN74t6ExMGV36fQoM6NwMFkxN8fxpxmWZ9OeHz6OSOnjOJ8o17MPRLn0o05HW9\\/MImxNbPhEX2OtaO70G7Ov\\/d0t96k3JxfuMAL+YiOiea\\/w8ew38+P4Sn0cOdDt0X9MZbSRT7GHhWDseVVZtsjiLDHqctxnmtJnYuimaM4sOMoIfdYTsel3xneeiDus0cxdUowDVrNZPddLgRVrfI6eXPnZOCwD1n87Q98MLQfuXNmT\\/S5Bw8dZsCwD8Hh4INh\\/fn7n39Z9dO6eyzdEy7mJKsnf3LjjwWM2n4jZDJ8qDDgCz5vmgsvI5oL276kXbtp\\/BHqgJvnL7f2h67kqtWPqQOrkdc1mN8m9aHt57u5Eq96mEj\\/enc+HVSL4undMRuAw0FUyCG+HdGdXquSKmCcc604O3dn+2PHA8aSG3\\/\\/E4AiLxXkp3UbOHvuPFkyZ3igdaUYRyh\\/LvqOoC\\/fZ\\/bVMOqP+oNgB4Cd8z+N4d2fbpzTGtz47JJqtxikeasVrXx+oWvdpYS91oNPOvbTcGYREZHEmPM3YebcnrzumfRgSMO\\/IiPnfUzb\\/HeMFzBnoX7n6oTN6sAbjWdwrnIX2haKf93OUrQnG7dN4F0fAzDwqdyHKfVMLOvdjo4\\/pab7sIbkubFaW4Xh7Nn+AW\\/Ga4OayNLyK\\/5Z2pJcSQyJjYq+6\\/Xiu0qOdTwtLHnf46dds+mYPZHTIyOARjM3s21YceL1U7BVYOKWNYwvH+fLMQXScu4m1nTNd+NqrQvVJm5kU\\/\\/CWADbGx9yYONAylnBSFObBTsX0uOOoXqe1cfzz6\\/9eCWJThFms4lCBV5IdJmn5+2ZxDw8Eh8Emi9vbtzdU7YXhePyVka1HcgKv1Z8\\/Wk98sbrPGfh5d7L+WdmLVIbsX8XadaBskcnUbNGZ+ZSl\\/51M3PzU7Pkbc+6vybT0D+GCEcJRm\\/cyKQKEO2wULz\\/Cg5MrISrOQf12lbCsvZ93qnTgy9OvUSvThXwMSwUb9mFyqc+ocKr7Zl3xsblHVs5X7IPUzu+iNMRXeZctPhkKqOqprnLSbU7NSZtYuf7pW7\\/fiwFGPDjZhY1SntfJ+S+vt7x\\/l63\\/jd27t7Dzt17uBYW22I+fyHo1mM7d+91+voUY8pAoxG9KXN6BnXrfsTeQn35qlcRbv0qHQ7AnXcmbWTHiFLx6p2lYGfW7\\/yMBgEmUlVpQ+eCJ\\/micxcGrPekyYBGFHQ2TUAKfGeZMibdAE2fLi2BaVNz9vwFcuXIxnstmzByaD+GDuhJ1w5taFS3FoUKvIDFnEI3mHloJjK\\/O4IlH1Yjg5NNsJbsyJI5HZLY57lQbeJm9n1ULuHw14jDzOnWmQ\\/+LcCILwbwZprb34ytRAsGV7zApOb1qNLzNzJ16\\/F\\/9u47OoqyC+Dwb7am90pCKCGV3ntHsSCKgh0RBFFAQFGwI2JvoCIfNqyIiiJioxeR3kIvISSU9EJ63d35\\/lgIhFQgDbjPOZxDdnZn352dTGbu3Pdehvpc2eWvjdHA7YMGMv9\\/H\\/Dj1\\/O47eYbsLO9hjLSynBF50MA+k68+d8G5tygo6hAz+A5G9n8XEvMZjAMeI0D6y\\/+W6fg3GcyP8x7mHaVpDzpmo9j9Z4vGO1n\\/V7NCWt4dtQrrPF+lPnv3UGTSkrjGgx6QoOb8fWnHxIaHMjDYyfx94rVJUq6qKrK3ytW8\\/DYSTQPDearTz8kJCgQg6G26+7WjvPHVwWN1408fq8X298Zza2PzGVPoxE8fYeP9fhn6MWsbWuZ1ccAKDj3eIqvZvYi48cXuHvaBvzGT2Nks5K\\/b4pzP158406cN3zAi4tPUbD3K4YPHcEjiwq5bdwQmpd3jCjrXEsbztS\\/Nl7y8bgylrM3CrRa61pVVUWjXH1hs5z93zB63EIK7nqHrya2xvHCX19tIx7\\/eSN\\/P97Ueh5VwXVLYW4uZgd\\/OnTrSJAplSRNQ8lEFEIIIcqkqqgoVFxDXQFUzp1rKlqN9URG24jgRvH8u3wHByPjWBczmu6BDii708\\/fF1UUFOXc+hV0hgS+fmwir23NRpd9gPw7GhGghcPm888t\",\"created_at\":\"2021-09-28 19:55:13\"}]', '/admin/setting/2', '2021-12-14 11:40:07');
INSERT INTO `activity_log` (`id`, `user_id`, `ip`, `type`, `target_table`, `row_id`, `where_condition`, `detailed_data`, `uri`, `created_at`) VALUES
(52, 77, '::1', 'delete', 'settings', 0, '{\"id\":{\"path\":\"admin\\/setting\\/3\",\"_method\":\"delete\",\"id\":\"3\"}}', '[{\"id\":\"3\",\"slug\":\"sdfsdf\",\"key\":\"afa\",\"value\":\"<p><img src=\\\"data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAA+0AAAKyCAYAAACg6D+FAAAABHNCSVQICAgIfAhkiAAAABl0RVh0U29mdHdhcmUAZ25vbWUtc2NyZWVuc2hvdO8Dvz4AAAAvdEVYdENyZWF0aW9uIFRpbWUARnJpIDEwIFNlcCAyMDIxIDA0OjMyOjMwIFBNICswNDMwKnmgbQAAIABJREFUeJzs3XV8lfX\\/xvHXfc5ZNzG6Q1JKEREQkVYJC7uVr92d6M8uVCxUVEBFJBRQuqS7u2PEuuPU\\/ftjY4yxjY3V2byeD33ods6578+J3ee+7vcnDNM0TURERERERETE41jKuwEiIiIiIiIikjeFdhEREREREREPpdAuIiIiIiIi4qEU2kVEREREREQ8lEK7iIiIiIiIiIdSaBcRERERERHxUArtIiIiIiIiIh5KoV1ERERERETEQym0i4iIiIiIiHgohXYRERERERERD6XQLiIiIiIiIuKhFNpFREREREREPJRCu4iIiIiIiIiHUmgXERERERER8VAK7SIiIiIiIiIeSqFdRERERERExEMptIuIiIiIiIh4KIV2EREREREREQ+l0C4iIiIiIiLioRTaRURERERERDyUQruIiIiIiIiIh1JoFxEREREREfFQCu0iIiIiIiIiHkqhXURERERERMRDKbSLiIiIiIiIeCiFdhEREREREREPpdAuIiIiIiIi4qEU2kVEREREREQ8lEK7iIiIiIiIiIdSaBcRERERERHxUArtIiIiIiIiIh5KoV1ERERERETEQym0i4iIiIiIiHgohXYRERERERERD6XQLiIiIiIiIuKhFNpFREREREREPJRCu4iIiIiIiIiHUmgXERERERER8VAK7SIiIiIiIiIeSqFdRERERERExEMptIuIiIiIiIh4KIV2EREREREREQ+l0C4iIiIiIiLioRTaRURERERERDyUQruIiIiIiIiIh1JoFxEREREREfFQCu0iIiIiIiIiHkqhXURERERERMRDKbSLiIiIiIiIeCiFdhEREREREREPpdAuIiIiIiIi4qEU2kVEREREREQ8lEK7iIiIiIiIiIdSaBcRERERERHxUArtIiIiIiIiIh5KoV1ERERERETEQym0i4iIiIiIiHgohXYRERERERERD6XQLiIiIiIiIuKhFNpFREREREREPJRCu4iIiIiIiIiHUmgXERERERER8VAK7SIiIiIiIiIeSqFdRERERERExEMptIuIiIiIiIh4KIV2EREREREREQ+l0C4iIiIiIiLioRTaRURERCoZV8Z2Zm94nJe37sBZ3o0REZFiUWgXEZHSZ6aSWq7JwcQsz93LeXBzbO8DXPFNMK1+e4J5qSXxDsby79KutPmqCt1n\\/cLhSvehcBAbNZlR866kx693MyWtA4MaNMRa3s0SEZFiUWgXEam0UoiInM\\/cE0dxl2czzAhmzr+YLlPfZl1GeaSkBNau6kP\\/ORM44nZyfN+DXDX5DVaVS1vOLSVyHJ+sfIMPV77N9FhXeTenHKWwfMc4tqcnEX1yDJOP24u\\/Sdca\\/ty+ikh7HLv2jGVxmmd+BorOJDbiUx77ozUDFvxJWt23mXz7HJ6tnchf8y9m6OotHlVtd2fsYv7Gx7h5\\/FWMTijXo5OISIWg0C4iUlm59zB+dn\\/uWbWApPJshxFA1cBwqgXUJtRmnOdGXOxb24U6X\\/Rj7DkrrnEsWT2MYfPHc8wEHNuYt381Ww\\/\\/wcqk46zdM5tNx\\/9g+skED6y+m6ScHMsnK0fw4cq3mRbrSVGrrAVwWcu7aOsfQnjN+7i+lnfxN2ntzNA2XanlU42Wze+kp9\\/5fh49jZskRxBX9ljCv0NeoWP6rzz5SwO6\\/\\/kEYyN9CLclkVreTcRNUtwsvl80kG5jWnPLom\\/ZZAnCSE8r74aJiHg8W3k3QERESolRjep+FtxpJ4kxIaTM84lJwrG3eHS9H0\\/1nc88yy5+nTeU31p9x8v1qlG05hj4eflhkEqq04QCH+1NTOR0lkQ34LgJtb268vzQJfRNv4COIb7QZz51OvjQrkZoEdvwX+HG4TbxspR3p2oLtZp+zbymX5fgNsPo3nUJm7qe+56m24HL4lVBTpQsVA2tQ9TGu7lixxz2ZXhRo9Z1PNXvYW5rdim1yvVJJLH\\/4M\\/8sGkUvx\\/cTZKlBu2avsjn7YYzpHZdfEp8f06O7vkfj+\\/twnt97qVu\\/CgeWbKfW\\/p+zJUBqlWJSMWko5eISGVlhBHma80O7WXvJIs2jWbe\\/i\\/4\\/nA0KSe+45vd0xi7ZiIHi9weAz+bf+bYeMe5HuxFqG8QZkYciVl3NXzb0THUN\\/MHayM61qid\\/zhfxzQe+dZK+EiD2j+\\/yIbs3rt2li6sR62RBuGfNeCFIxkAuNPX8fuym7jm55o0GeVD\\/W8a0W\\/Gc0yKTspVyY9ny\\/ZnuOO3Rlwwypu6o6pz8YRreWP7OuJNwL2Yl37wos38eWR2BE\\/jrxm+hH\\/Rm59TzCLuy03cie95dVonOn7tS51RIVw4rg9Prp3D0Rw97p0nnufSzw3CR\\/owdPUUvpnZkTajfLlo8eKsNsSzZduj3Di2Jo2+8OeCn3rx7NYZfD7Jh\\/CRBnUnfsKh7B2nc\\/jgRzz7V0c6fhNA3S+CaTO2F4+vm8\\/xU6+hGcGPkzMfW3vcqyw7OYYXp7Sm9Ze+1P+mGUMX\\/MxOR\\/YbwdolzTJf789b807k6V4HZsZmJi29jv4\\/VqPBF740\\/q411839lKUp5+iZYO5m1ARvwkca1Bz9AItcmc9x4jS\\/zN99\\/wC\\/7n6a634Mpd6X\\/RiXXFG6bsfw16KhvLx1O9WbvsnoWw6ydth4nm1Z3oEdnJEfcNe0xxgbGUrfS8byzz0HmTPgLYaVSmAH3HuZveVPlu\\/\\/islRUazf\\/g1zDv\\/CmAMHy3eYkIhIMVSMC8giIpWImbGSkbPfwXXRWJ6ulcqcxfczrfonfNr6AkqgA3AOXgT7+IMjgeQihOSSa19NBveZQ0BLg24Nw\\/HlAyYMuZzI8EE0KnKJ28DPyx8LKVmV9oLv6+vlD84UTne8zWDP9od4dPmfHPHpxl2Xf8OT9Wvl\\/SXo1ZMB9UOZtCsWZ8Iilie66BBqBfc2lh49gQuw+PdnQC0fzIx5vPbHIL6LSTsdmp0H2bD3Qx45spLIG+bxUDVvIJX1K\\/ty\\/co1JGfvKJpDJ6by1YnZLI6dybRzVH8Lvy83kfv\\/x5B\\/vmdv9muVwYmYefyydCFzI75gytUP0vyMqxYO1q6+leXOdEys1MGKgYNd64dy3ZJFmRcVgJT4hfw8bxneVgdncrJv81CuWTibaPP0+xMZu5DflixleexkZvW5hqo5HuFO\\/IEHp5zkREZWlHLsZdnm+7jb1oRFPbrlH+jsy3h\\/ykA+PZl4+nVI2c6SbU+z6ugWvh\\/2A\\/39z68PhZkynhdmp5PuMsFqxWJUkL4YZiKpTiuGpQptmt7NNeE1PKcqYwKGBf\\/g7gxpPYxOAV6luz9LC+65eh7NYmrRrVY4lhqzmdgghrYNGnvOayIiUkQ6fomIlDbTlaPCYxJ3dDTjDs5k\\/Oa5HI+bzOids5i27nvW5c5B58FpTyQ9+yeDQO8gcCRT4DDw0myfrRW9G7bEF8CVRkjtwXT0Ob8gZPHyx8dMJSWPSnuGI+WMiba8LF5gOjh1V2fMpzy64GcOBnSjhXMuH0+\\/nm9i8ntCQXRrciVBAO5NLI2IwQTcyYtZFu8ELFRtOJjONhf7t77KTzFpmATSvv1v\\/HPbRib3uIaaBrgzlvH5ulmkAGRM58v1a0nGIKj2K\\/xx13G23DGV+6r5YJDK9o1vMSW1M88O28Psrt2yLo740rfXLtbd+QvX+7sLvS8zYwZvzf+BvU4Tw9acgZ2\\/4vPe7zAsPBQLLiIPPMuzm\\/dy5hR3JhlOJ6FVenF1i5vpH14dI3UCb69aTLwJhqUePTp+wsdXvs89daviduV6Dxyz+GzlHKJNE2vQYEYMXc+\\/N\\/3OveH+GDg4vPMtfsk1qZ7bEYmjyr28cuX3vNf5GhpYDcDJgd2\\/sSbf+fccbF73EKNOJmLiS6Mmr\\/BBn694uukF+GFiTxjHm+vXcL5\\/SqaZRoZRj46NbuL65j1pWF6lDTOZBHsRJiE0GnPPgEncF7qHH\\/4ZxPvHy3UWizPYarzBxGuepFHsJ9w9cRjjYzPO+Ri3o3hj8A3v9vSolXnhwuEMoWODdgQWY3siIuVNlXYRkVKVwfJ\\/u\\/BK+pOM7nMHTS0GVZp8zeShN+Os1YfaNpMxQxuzxb8flxarAGUSf\\/AJrpm1mEHXreXZ6jbAwN8rAMNMJS3ffqFl0z534s88MOlp4i9az8QL65\\/fFWOrHz6kk35Gpd3F7k2DGLbaj1dv+4Nr\\/QzAwGKxYuDGbQI42bLzJzabXXn9qqnc43iPq399lW\\/Wz+HuPlcRcNaODILrD6Kr9yRm2tNZd2QZqa2HYI9YwBYXYFShZ+Me+GHgW+N\\/vN3rTjBqcFHzIbT2MSDsCQas\\/5sfk90kRW\\/iiDmI5hnHiHSZgJWQqt3pFFqTQAbxZK+vqXc8BtMIo5nhQ1hAQxx+vtnt8PNvQL1gH8BdyH1dQ40DY5iR4ga8uLDzZL7r3AYv4MZGNYkbey9zMlJYu+N39rZ\\/mSbZz9lCaKOvmHfN\\/dSzAJjE7XiRxRkmYKNJ+98Y3+OyzIsvFzQg6vubmW4\\/\\/T6YZgMGdv2STm4D77ABDKtXHwvteKz1N4yLXIjdtZ2tsXYIy\\/Eq2wYwYvC33OhrAEPwi6rLEwfScaft46DdpJtfHp8B91qm7NqGHbCGDOezAW\\/RxQa0vBjX+EsZGevkUMS\\/HDU7n0dvDsDSkuFDVzKiTnAx5ztIZNe+H5kRY6VV49voX60I8ye41\\/PFpP58G\\/wNy\\/pfS0jO25z7Wbr7TzY56tG16VA6BJw+jbMGDODNwb+Q8scNjJrzMt1u\\/ozu3uf3LJwpy5mycy5HbRcxqNVAmnrlvx1H7ETGxV\\/MbY0b5dMTx0rNhh8wcUgIt\\/\\/1Oi9Mf4q6w0bR0zfvbWYcH8HgaT\\/RdsBWPqx\\/9l9n4bk5uedeBs3bzZ03\\/ctDYeU9R4OIyPlTpV1EpDS5NzDnwFb2ptoJzj7i+tCoXh+a2QAMQmpcRbegHNdQzaMs3vot\\/0RFkbvW5k5ayKRdc9iVnhWYHIsYNfdxRh+NJrBKU6o6tzJh2\\/Ks8cgGPl5+GKYbl5lPqb1E2xfNqk2P8fDqBeSeD9oS2IbGtgRW7piYYwx00Rg2P3xIy+y6nM1K\\/SoNMVJnMWl\\/ZHZ3aauR8+stid3RByGkO10CLXhVuZ1htbyIOTQzx3j1XPvy7Uv\\/Ov4YmCRFLGCjK43VR1aQDhjevelfNxCwUKfundzZ5lo6+B3jn1XDeWTmMO6d+VZW2AXTlUa6CZbAK+hRxQcDF0e3DKXH7zfy4sqvWebuys0dnuGhjvfStcBJsgq7Lye7T27O7G1hacLlDVpw6lqLJWAgfWtkxipn3AZ2OM\\/cfrVq7amV3QQXB2J2ZVasjdr0bNyZU5cSsPqTO28Z3m3p32Y41zVoiuXk17w093aG\\/30jz23bkfUZcZHuzDXe3AgiMDsMBhLmcyryZZCRzxAIM30bO5JcgIFvjW60O\\/WxtHTg4SGb+Pf2LSzodwe1zzdxW5pxYbXiBvYk1qy4kgHTn+D95Y9y14TuvHY4LtecAybJJ0fz4szn+Sf3snOW5rQK8yJm\\/3jmpee4zdzLzzMu4fo5TzNi4TCu\\/nUQ30enn\\/nQgEG8M+B5WiSN5vV1G8h3kTzzILNX3sOjG9adtRScmTKFJ36\\/gkeXvMF7CwfRf+r7bMl3qoBYZq9+lJdnP88\\/6QX9YRsE13qZH\\/vfT92E0Ty\\/8t98K+neYRdQx32EGTvmZ\\/ZSOaf8jjsWqlVpQpBjDZN2bz\\/rWCoiUpEotIuIlCbHHvYnm1QLa56zyFggV9x43l34MK9s255r4iQ3x\\/e\\/yROzX8iqpIIjegbjto9mUYIFa9AQBtWycfzQ32zNeqDNYoXsinNpt8+LI4d\\/4M\\/d\\/7I\\/dxi2tOPqps1xR81lyTmXbMubYfXF13CSliv8+da+nj4B6aw+9G\\/2ePEz9+BLiG8AZtoWNsQn4TJqcmGNepC2nyP2\\/NpSnV5NMivLrpTFLItezbKjcbgxCKo3mO5ZA67dKf\\/wyoTm9J3xCB+u\\/46JuyYyfe8i9ufuwm9pz+NXj+PeWjXwIpWjx\\/\\/gh5WP8MCklrQfO4Qvj8Wec\\/m5wu3LJMWeNSmdEUYV35xf8yGE+lgwANMdT3y+zz1zO6mOlMz3N2sVgoKlsX3TEHqM7cOjS99jzLbxTN0zmdmRJ0o0LJmOpKwgZ+DjFZhjMkErIcGtaFG1DReEhpfOBGe5uQ\\/w5\\/zBjDgcf8Z7Z4\\/6hBfWbqJG279Ye88M7gnZw4\\/LvmXvGS+3gXfaSqbu+Y0lMbkTcSDdmg2gimMJi46fiqEmCftH8MFhkyuu2MqWWz7lcnMOb84bya5cb6NfjWd5qUV1dm58nSn5TqTnYt+hX5i6fzXRZ\\/w+hWWrn2FySkseuiGCZVdejffx9\\/lsf3zen0\\/XCmYfiCGk8W30zadynvM5V2n4Di81C+Xwjs\\/Ovlhx6l6+A7imfgDxR+awIeeHx7WVCQsGcc+6DbkuNOR\\/3LFWuY6rq8HuQ\\/OJ8Lz1HUVECk2hXUSkNFnDCLGZxCXsJ6Ew93fv57cln7DRZaGqf\\/UzD9LmAWbsXoXLrwudQ62Ag+0HZnGEUOoEBWEYtbi4VlNI3MburEDmcrsBC5b8zqdLsn34USMgBDPlKCfPOkG20Sy8LT6uPexJyK9sZ5Icu4rt6XkHDcPmjw8mGc60MwOEtS3tqtlIi9vB0awbXO6c+\\/CjZ4dnuMj9N8+NDabWSG8GrtuL27Bhy3eiMYPqDQZzkc0A9y4WbxnPkmQXEEjXJr2zuiynsXTVcH6ITMBt1KX\\/5UtY\\/5CDk48t5X\\/BZ3fF9Q65gXeGHWDNTVP48NKHuaZWffwwSY3\\/i7f+forZGQWlisLuyyDIJ6tSbCaRmJHztYwnLsOdOS+YEZijyp338w\\/wDsh8f81EEuwFz7vtTvyel5ZM56gL\\/MMf58fbozjyuJsdffqX6OSKhndQ1nAGk4xTFxXKhYNta2\\/mfcet3F8vq+u7Gc+R6JX8tvortnsN4bmu11A\\/eCDPduqNNWYp63K9vxa\\/GlQlmuMpZ4\\/x9qrWgeaWBPbGRmRd9LCzdv8sYv2Gcn\\/r1tQIf5T3OneDyO\\/45XjuEfxBXNaoB\\/4ZM\\/lo9XzyHN1uVCfc34I7JYLIHC+iO3EsI7cfpkaLt3miTm2atbyfK31S2Ba5K++LL2YGdjf4+4QUcrxlCG3Cm2LJmM24nfvyef8CaRXeHEvaDvbmrN5bvImOnMXMTWNYecYhpIDjjtGYttVDcMVvY5+mjheRCkyhXUSkNNm6M6hJbdIPvsTDq+cTkW83UzeJsX\\/ywbSevHAgHqvFxb4jCzmafaKZwf5tT\\/PFsTQM72ACDHAmjufjLTtwmhmkODI37DLdnK6sm9id6ZgFhdMSax\\/g2s3ayBhc9l3sTsl9huwiJiUKl+GNjzWftpi7+XluT\\/pOfiu7p8AZrL5442TXyY1ndoM1E4jPMMHinR0crBYrmBlkZHWl9w1\\/kcl3LOe7niN4qPUV1LMZeFXtwoUFJEpL4ED61fDGwMGG7WPZ4QbDqzv9G1TNCmn7WHP8JC7AGjiE4e26UdfbhoGTM3t3m8Qd+ZRXFj7CC4tGsj1wMHdeMoofhu1g6sVtsQHu1EUsjT714p9+fdzurKhU6H3ZaBreNrMru3sPi4\\/szw5bZtoCFp3MDHjWsA60KjBlWWlUtUVm4DYPsvDAltNdrd0Z5C7S2yOXsclpAt50avM8A6tWw8fIffGk+Ayf1rQMsgImGVEr2Zr95Pbz07RmdBzTkM5\\/fcmB7Pa5cObbzaQY3GuYuD2G9rXCSEx3AXHMndeeS8ZfyrN7IjF8vUiKP0YGYLHYwH2Yw0k5Y28quw4tIcLtYN+pYQg52FMiiDENfG2+WZ+GDOLSk8ErNGsYi4W6jQdzoXGEVRH7cgXqNPZE7SIdF0e2PsQreyPOCtyulHksinLgSj59gQ\\/XHn5d9CZLHb7UDgjG7gbTGU+Cy8Ri5DMe3NqZ7nUCOLbjef5v765zrFJhkhTzCx9vWY+TVFatGs6XOVcAyJZOdGoCpuHNGdeVjMZ0r98UI\\/FH3t2whexLHQUdd8w4olLtYPGhwGtUIiIeThPRiYiUqhB6dx\\/PE3HXM3J5Hzqva8KFtTrSLLgGITYvDHcaiekRHIxaw4bYE6TbLmBQz4Xc53qBW5Y+xcAJ87gsMJbjaZHsPLGLNIsPrvjRPP7nVgJi57EhwwdfSwIzllyH78EANu7eha3GvVziawAmac5UTMMX33znYCpu+2bSyS8V068eZvTfLIi2Y7KcT6YPZGlwTRpXrYuPK46ImKUsPLwFd5UXGVgt768ed\\/Jc5kU6adjpalrkcUnZsPjgY7iI2HobV8e1oWbghbQPsnLsxBSmnvCi3WWDaGwA2Gha+zKqrfmZt6f25w+rk9CqLQl1niAifisbI3cT79WFpy5\\/mOYFFpvr0adxR96MWIHd7QAMfGsNolf2cmJBBGVN9OVOmc34rXPwqWZn8\\/bXmZicMyYZ+LOHvzd\\/TYTpzb\\/2WlTrOoSmloNsjcvqFm9Uo6qfhcyl7U51+85g1da3GOu6hHYN2hd6X6GN7mJAwHQmpWSwfuV1POJ+mn5BCazc\\/DYzM9yAP51a3swFltzDCM548oQ0uIGePtP5J8PJzvXDuM94lkGhGWzd+REzc6V2i3cIAQakmA627vqc6VUHEZY0i69XL84RSEsgPFsuYmjzFny3ehuOuK94ck4YDzeuR3zE14w8sJdY00r9Jm2pY4CZPotXJw\\/jh9gQevecw49tW5TcSY+ZQELGfiYv7MfMfV+zYnBz5h86iq3GzdwRuJPpB3\\/jmd8n8n9hF9PAuZ50t4Nv\\/76EldU70dQnlYioxSw5eZR0YPeGfrTZ4KJBk\\/voFpBBXMJGlh5exhHvfnzUqE5WdSWAdrU74LXvSx6YfJy+NWri695JtOkiaudwbjzemFZVauCNk8S4uUzbvxX\\/OnfQM30SE\\/7pyPYGlxKSkUxIWFMC7LtZd3gJezNcmMzg9Sm9+MU\\/FJ+kxSyOdVE9wML61T3pvKMDrbwPs8FZk1vqtsz7tTPqMqznFyyZOpxvZ7RibGA7LqrVnqZB1QiwnPojdmPPOMaB6OWsOHGQNP8reb5vH9Yse4n\\/m9iS6fU6EOR0EF6tE7WNaA5GzmNBxCGCGr1IT7+cf6A2WtTqTJCxg7UretN7f1NqBtbHO24uC7OOOx\\/\\/dTlzghvTunodrBnH2HtsFoui0mjQ4Xo6qEwlIhWYQruISCkzfC\\/n+eu303\\/vGCbsncOayKXMiogmyeEAawDBfnVoWPUK7mw1mGtbDKF9gDfwJxNtL\\/HOpj+ZeSAah6UarZq+zYiul7NtxUN8sX8h0SH9eabPpwzNGMkzS39k4g5fGtR5gi97PUqTzFIwSRmJ4BVc4HJHxWrfxknMj4rDafhTPbQzN3Z\\/miHek3lvxS\\/Mi7Zj7gMTA5tXDZo3eolPL3+NjvlcQHAl7OaQO5AuNVvn\\/eVksWLFQnCAH4ePLmCbOZ\\/5eBEQ1I6+l37LW51aZY9xDmj4AT\\/1dPHamt9ZlpwKJ9cS5l+HBlU6ccOlbzC05XV0POd60VbqN7qGVstWsNEN4MNFTQYQnv3C1eOatlfz2bEpRLn3MHlBPybn2oLpyFwr3qfui7za\\/G8e3XWYvdvvpu\\/2u3Pcy4u6zZ\\/n5qzZrQNq96KT158sdbiJPPwezxxtxRM3beDuQu7L8BnE673uYsPMH9nn2MrkZXfnuK+Vag3e48N2zbHCWZOQ5WT43chLl\\/7IisXziXPuZdaq4cwCDCwYmSPjs+\\/rXfsebq02jpFRacRFvMd9f7yXu3WkOVJLILZ7cWGnr3jw4FV8EZnMrl0v89iu7BbjFXwrb1yUuWSe\\/eQUpkYn4jITWbh7AVFtWlCr2PvPYu3GLe26MX\\/9bhrUbkOwkdUPIfhaRlx1PW+lbWHh7nFM2jWZpYkXcVvHWizaNJml8RtZ7RVGeHArend4gbua12DB8qf58chhNu78iE2GF77e1ahf437ev+xdbs2eHdJKs\\/bj+Tr1Ed7bMZWxEWk4T72aMUtYGrOEJftNwIKPb2M6thrJa90foQOP0XPlK3yz8x+WpDvg+DKC\\/OvRuOZtPNP6frqkjuKV5RNZHuVF9er9+F\\/\\/t3mmSRDrt37IdzvnsDWtHn0v\\/ZgXG+Q\\/i7tX6B18c+sl3LB9NH\\/sm8vqw7+zwp6Gw8xsj83qR5BfHRpU6cKt3T\\/m5taDaeljwV7\\/In5e+zm\\/75nN0pR0zKNzMLDg5dOADq0\\/Y0T3u6iT66KaNbABNQ0bwdVrcuzEcnaxgephXbKOO5MYsXQcy2KWsvQAGNjw9W\\/B5Z1G8dalPfNYJUJEpOJQaBcRKQuW6rRr\\/jztmj9fyAdUpVO7b5nc7tuzbuk+cCP\\/O+M3n\\/Fn88\\/y2IY3V\\/SO5HgZtw+uomfbMYXczmmmM5kUI5Bg73xSvenGjY1m7ecyo1PTc4zvCqNjuzHMaFf0duRkDbuavlVfZ2OUA8N6EX0b1s2xXwu1WvzMJLM+I9b+xsq4OCz+bbi81ZN0jH6Y\\/9ufiDt1M9tT3FwaVI9r+62kVu13+GrbDFbHHSPZDKRGlS70afUcT154OTWzAool+AE+6buXp5eNZ3WSnZDg5tT2shZhXxZqNBnN9Os68+nq0cw8toNIp43QkIvo1fIZnukwkPqFWv3Ki+btJzPZ6xVGrJvI6oQk\\/EJ6cONFV3B44Yv84wAMa+aFEtslPDtkOoFLXuGnAxs44Qqifq1rue8CX8Yu+Jwdbid7orZhp0Wx3g8Aw6cHL1+3hOar32TMnn\\/ZkZKCl18zOjW6h0e7PEK3rFn4vWrewm21ZjA6JowBrfoTfuZ1hmIKonOXxWzpkvWjeyW+tqwZ\\/IEQv7b0bfcBfdt9cPohPfLeUo\\/rrueNwuzS2piruv\\/DVd0zf3ScfJlev39N64GH+KZpUD4P6sRzSNdiAAAgAElEQVQtPWdyS8\\/8NtqVxe1\\/Peu33dt\\/Qff2hWlUJsP7Anq3\\/5jeRXiMd2Av7u\\/Zi\\/vzbVtuJkmx24gwa3BdtzW8Xy\\/32Jar6Nn2x8I3QESkAjFMM791gERERIrCJDF2I7HBHWh4HpeEHcefo\\/sfo6jbcw8TL6xzVihP3n8Xl0yfTOf+R\\/nxglOrVycSlepFdf+8FvWWYjNPsC\\/Bn8ahp5dBc0S+Su8J\\/8cOt0FQ84lsHni9qpjuTXzw60V87j+K9dcOP90boyjMCJbuP0LrJl0Icx9h6aFILmzUieC87uvcxuhpPXgj\\/gZ+u\\/0bLj9Xp5HMHZCcGonFvwb+gDsjigSv6oR5SLdxZ9JCFqd1old4MIZjG4tPBtC1bsPsJQtxrOTtiT350v4gU27\\/lC7Zx5jiHXdERCoCDzlUi4hIRZce+T63\\/n4Jg2f+mGMisMLzqt6fnoF2lq1+lPExZ67QnJ4wkVeWTiDGuzdX1TsVY+JYuaI\\/3X4ZwjeRhVvRWYrCyYEtdzLw10u4e\\/lo\\/j40lzk73mL4zI\\/Z6QaMalzZ7Ar8y7uZnsDww99mgDONgpYrN9PXsTwqARNwpaxmTfypddbTWLt8ALfM6M9d61ezZFl\\/bp7Wj\\/s27zlrErmMxL9576\\/evHE0lBt6jqBHIQN74vG3uXVcW25bu4aE5Om8MLE5A+b+zhFPmFXdvpARUwdw69SbGB9\\/iEmze3PT1D68fDBrfXvnNsbOHsaXMTW4tvsLXJIjnBf3uCMiUhHomqSIiJQIn9Ar6VtjAmsbXkLt85mp2daTJ3rcyvyZ43j2t5ZMbHwNHQNNomOXs\\/jIZqLNelzd52OGZE8E54Wftz\\/elgACbYXq7y1FYR5lxcENJNij+Gf1cP4540Zv6jX\\/jNeaVkWTcgP44WczMO2ppOd3F9d6Pv\\/rSt6L68gbg5\\/n6LyhjLEPZtSwXxga6Ee7Ni9wXcxK+jXvRGf7k1wTu43rmjTJHH7gjGTn8TnM2vUDY3cuJoJmXNt7Gh80rlHI19\\/AyyuUQJsvhpcfXtYAAm3e2CxenlG98b6U2zpcx7642+gXUh+vdnfR06zKrXVCSYkZz1tzHufnSC96dP+H95ue+ZyLfdwREakA1D1eRERKkBsTSzGCnIuY49\\/x8amx2A4LgYHNaVt3MDe3f4Qh4dU4M56nkWi3EuxdkquBSzbXIf7d\\/CHf7fib1bERJBFC3Wrd6d\\/6WR5rcynVFJKyxPDbn3V4OulZZt36FhfmmYTT2bXlNp48cjVf9B1C7LobeD3pIb6\\/cug5w6b98P\\/oNPVbIo0wmjcczlOXvciQqsFF\\/juz25PAOwhvwHQkkGwLIciD38P0o09xxdSRHLB15PZev\\/DWBRdkLmd4luIed0REPJtCu4iIiEixpPLnjGo8GPUg0+78mItLuHxt2jcz\\/3ACjep1oYlPofrDVw6OJXy9Yi1tOjxE9yCf8m6NiEi5UWgXERERERER8VAeMZRJRERERERERM6m0C4iIiIiIiLioRTaRURERERERDyUQruIiIiIiIiIh1JoFxEREREREfFQCu0iIiIiIiIiHkqhXURERERERMRDKbSLiIiIiIiIeCiFdhEREREREREPpdAuIiIiIiIi4qEU2kVEREREREQ8lEK7iIiIiIiIiIdSaBcRERERERHxUArtIiIiIiIiIh5KoV1ERERERETEQym0i4iIiIiIiHgohXYRERERERERD6XQLiIiIiIiIuKhFNpFREREREREPJRCu4iIiIiIiIiHUmgXERERERER8VAK7SIiIiIiIiIeSqFdRERERERExEMptIuIiIiIiIh4KIV2EREREREREQ+l0C4iIiIiIiLioWzl3YD\\/CtM0y7sJIiIiIiIi\\/0mGYZR3E86bQnsJUSgXEZFCMV24sGKtuOcOIiIiFc658ponh3p1jz8Ppmme9a+IiMg5uWNY+uUrPPnNWqLd5d0YF0cW\\/cSI5z9l+onyakwBbTAT2bf7JPZibN2eYSf7G9pMZd+iiXzy7kQ2OoqxURERqZQ8OeMptBeCp755IiJSsTjSXfgGBxMS4o1pd5V3c0g6sIn1+w9zMq78vtvybIOZzOax7\\/PCK+\\/w8aJIin5JwSRl5xReffRNvt+QkBXcU9g67x8WbtzNkQR9l4uIyLl5Sg5UaM+HJ7w5IiLi+dyx6xn93g8sibQTvfJn3h2znpg8Uqb96Hzee\\/JtZtW4kVtDZvPc09+w8ISz7BuczSAwOACLmUZyas7AnErkySTKpmX5tMHwp07LJtSsWpfWDUMKOFnJYP\\/fX\\/Lu5D2kpB1g6qdfMe1ABuAk9tB+TsRHsXdfNOkARhAhQQaGmUh8Qrl3cxARkQqovDLif2ZMu8K3iIiUPJPY7StYuWEbx9ZfTOrG1azeG8cl13SgV\\/Uzx8ZZfYMIDvDDDAwg0OmPn48PPrbyvHZu4O3tDdjJcJz6jjRJWD2W5z9ejaVlNwYNGkCfjrXwL7Vhfnm1AcBC1c5380kHF15eBZyq2I+yeslG1qWHsKW+lQVr1mEJ703fRs2p1+8x3msWRXCjOvgBYCMw0AfcuS4QiIiInIei5svijJmv1KFdQV1EREqXQbVuD\\/B+oziC64Tjc8VrtIwLo371s7+YrdU689iHncBqxeBBPu9mYCvibHSuxIOs2mPhok718T6P1jrTEklIceMbFkqAFaxWK5gmLqcL8AIzlR0rtxDjsmNuXcD32xbxW90O9B90FYO6N6eKV\\/7bNjOSSbYEElTAfQBwJ7Fn9SGCOrehpiWPNgCuhL3MnfoPS\\/cm41+3BZf0uJzuraqe\\/Zy9mzDslTfp5qxB3VCDlh\\/0gDp18M28kVr1\\/NmxYguhl7SlltXA188XgwwcGtMuIiJlLGc2LWqAr3Td49WtXUREypYX1euE4+NK5fiBo0Smu8j5DeR2nf7ZsEJGqh03FmxWA1dGEjGRMSSd1RfdSeLR7SzdfOJ0N3XXISa88TrvfT6dtalFa6Ejcj3j3nmGW+94mLuGP8odL\\/7FQffpkwa3O7O7uH33NH5elohfo8u4cUhn6nmbpBxZx+Qv32L4U18wY18aeX+7utg35R0eeesvdqYV9P3rZPdvb\\/Pcx9\\/yx8b0zNckVxucx5fy8Yv\\/x1fTV7Npx3ZWzJ3CyNee5t7nvuSXBVs5knhm4jYCa1E31MAed4R9R5PIyL7FzsYf3+CFT39g+s7Mx\\/j5+mLgxu3WOYKIiJSfombWShPaFdRFRKRMOBLYs3orEbnmkXMdnMFbr33Gl\\/MOcvqmdFZ98Th3PvMTKxJMsG9j9KP3c+vbC4k2Hawf\\/Qx3P\\/Ihfx3JtTHHdsa+\\/i4fj13B0VPDr611ueySOlhStrBqe15zqptkpKWfNWmbGb2Cka9+xh\\/rY\\/Cq24KOFzajXdf21LNkPgbAdAO42L10JceMptz0zHBuv\\/0RXhnWBJvhTbOul1IrfjWj3x7Notg8vmtdB1m2PILEdPD3Lqh6YKPJ5ZfRxBbP8gUbSDJzt8HOnoWzWJ9Qm35Pvsevv47mh3cf5c4rmmA7spIJX77Hw\\/c8wC0PfcbcqDPH4S8f\\/SZvjJzK2uwJ7bxpdWkHqhLL2jUHcWLg5W3Dcxf0ERGR\\/6LC5NgKHdpVVRcRkbJlZ\\/0Pr\\/D0B98yeVP6GbdY6zaggc0kMTrmdLU3bRsrNyeQkOZNWKBBxo61bEh04\\/QNJNgwcdid4I4jOvfMdbZ6NK5nxRUTnWNSOyv1OrajpiWNA\\/tPnD2juusIU159jOEf\\/8vJ7CHqKaz6ZTxL4kLpfN8IvvvkZUa8\\/hqvDWmAFTCzKs6GxQKYpKdnYFoCCPQ3wEwj4mgcbiOEVgMf4N1nr6Rm0kYWrks8u9ruTiAmHsLbtKa2teBX0FrnCgZf5E\\/K5vVsSc\\/dBm9a3jKC7756mQe71SXIx5\\/w5pdw\\/YNP8ep93WngZ2CaDpJTfQkNyRG\\/DV8aNgzH4o4lKvb0K+PdogPtg0yiDh4i0YTMor6BYVF0FxERz1JQtq1woV1BXUREyo83rS5uSyjx\\/DtxFvuz07mL2M1b2Oc0cUUc4agDMJPZOvlPliaaWIJDCHYdY+bk5cS4wZWcRLLzBAcjnJhmGltWbibnKmT2k1vYdMSFmRLBoajTIdThzH8wtvvkJtYeTiPdL4SwU5k0fRv\\/rk2iyuV38WS\\/+vjlyqqZQRmcDjsmVpq2uYAAxxbGj\\/yFcaPe5ZOFsRjhHenSxILT6QbDxOXKY+Z1Wz2aNbJyYuGvjJmzmYNx9jy70Zv2RI7u2MSBZBuGPZGENDNXGwCsBIUEYDHTid63kbm\\/f8uLDz\\/OE1\\/\\/y6E0E8OrAde9eAcX5RjgbqZHsH57FG53HIeOpGTv28xw4Mx+ziYupxsTC5YKd\\/YjIiL\\/Jbkzr2FWgPRbAZooIiL\\/FWmr+eCBL1iSBjYvH3wDQwm1JXMyKhmHCRg2AoID8LU6SYhLxbQYuPGnelU3MVFpYLHgdvtQvZYP8cfjMW02nE43fgG+2HyDqeJrJ+p4LCkuEzDw8vPDL7gaNQPtnDx8kkTqMeydt7i1cc6StknCgo+456tdXPTE57zYzT\\/ztydn8vxjE0ge8CIf3tmCgFyh3bn7Nx555R+O2fzwM0y8g33JiIrj9LB0A6\\/g6oT7pBIVnYIjsD2PffQUvaudXam2H5jFO2\\/\\/xvo4F6ZhwTsgmNAgf3xsFgxc2FOTiY9PJt1lYviE03nYgzw5qBk+e061IYAAG\\/hVqUagK5m4uDgS0lyYGFgCatHpyr5c7FjED7MOYrcFUyPMIMXhS9Vgg8STkcSluzEBw9uPAL8Qwmv4knrsCCdTvGhzz9u8PbAau8c9z\\/N\\/ZdDv9U95sG2lnotXREQqEesbb7zxRnk3oiAK7CIi4lEsKeyYt4Tdbn9s9jTS0lJJtwRR74KO9BvSi2aOw+w6Ek+K3YcGXW\\/iufvbY9+7k70xVhpedhMvPtwN7yM72XncSXi7ATzx7HU0StjD1gMxJKekkGy3UaV+Cy4beDW9asWyY08USckJxCZk4F2rNQPvG84tFwZxZi90N3vmT2Te\\/nB63dybVkGZodrwcXPo3yWs2bCEGfPXse3ASVJ8a9KwZgBWwFKlGa3Ckji4+yAnkjNIT3VgDahCvSYX0KQqpCZnPT8Cqd3yUm55+C761vXOc1y4NawpPa7oQP1AG4bpJCM1mfj4eOLik0lzGPiEhNOkTSd6DbyW+\\/93G4PaVcPbON2GQ3sOcCwxnZSkJFLdNgKq1qFVp0vpP\\/QmHvnfMAZ2akKzDhdzYaidmKgTHDkeT2paKompLnyrNaRd9wEM7RJExI6DRKckExebhDOgLp0H38ejgxrjb7g5tupvFhzw48J+vWlfVeV2ERGpGDy20u6hzRIRkf84+96JPPnSdJJ7Pcd3\\/2t7XkuvlTwHyz4ezvtr2vDkmKe4wv\\/0LelHl\\/PLz38xf\\/MxkpwmhqUaA159nwcv9Cm\\/5pYLk\\/TEeBx+oQR5aUy7iIhUHB55mVmBXUREPJEZv5mfvprFEUsD+vVtWeKBPf3AIiYuisBuprFn9nSWnji14JuDiIVj+Pzvg6Tn+UiDwCB\\/cEWw9+CZM8v71u3KvS+\\/z\\/ifRvLRfRcTZsZz6Egek8mVAmfkCka++gWzj3rCwugGvsFhCuwiIlLheNSArv9iWP8vPmcRkYrHJHH3XL7+fALLT3rR8uZ7ubaRtWSP4e5j\\/D16LOMPN8XbrwWLfpzKiQuDuOCFy6kat4IxPy1kjeMo9dq\\/zJDaua+5W2l+UQeqzl3ErG\\/H0ODRW+jV5HQXeldqJHvWL+PPmZuJs9amX8swMM1SDu4O9s2fwdIdEeyYvYvu97TGr1T3JyIiAoZR+S7Oekz3eA9pRomoTM9FROQ\\/z0xh84RP+OjPPSSYwbS54RFeuL4FQaVwTuCK3sySiHr0aBfEyTUriWx6Ge3CDMAkcdts5qZezJCLq5LnqmpmAqu\\/fYcP5h\\/DjgWfwDDCAm2405OIi0\\/DYZoYXtXpcteTPNWvHmXSOd4dx8Z\\/D1KzWwdqelSZQEREpOIE\\/HIP7RU54FbktouISGG5OT7jXV5YEMrgu29hcNuwvEOzJzBTObBsFn8tXM\\/W\\/SeITXFi8QmkSs26NG\\/biV59u9Ohpm+eE8mJiIhIJk8L8+Ua2itC6K0IbRQRkVLmtJNheOPjsWldREREykJ5BPpyCe2eHIQ9uW0iIiIiIiLiOcoixJf5CDNPDMWe2CYRERERERHxbDmzZGkF+DIL7Z4WjD2tPSIiIiIiIlJxlVaAL5PQ7ikB2VPaISIiIiIiIpVXSQb4Ug\\/t5R2Uy3v\\/pa1yPzsREREREfkv8ax520tGcQN8qU5EV56B2VPDeqFa5aFtFxERERER8RiFCMCeehGgKOG91EJ7eYRmTwjqZ7XAA9okIiIiIiIinBX0PSHUnyvAl0poL+vwXC4XCM5uRJm3QUREREREREqAB4T5\\/MJ7iYf2sgzQZbqvM3dcZvsVERERERGRcpAjRJdliM8d3ks0tFemwK6QLiIiIiIiItnKMMTnDO4lFtrLKrCX1n4U0kVERERERKTQyiDEG4ZRMqG9ogb27K1VopBeiZ6KiIiIiIhUcsVcwtyzZD2Zkn5KxQ7tZRHYS3IfnhLUC969kreIiIiIiEjB8o\\/H5X4xoAQDfLFCe0UK7GUd1s\\/cjUK4iIiIiIhI+crRnb2sQn0JhPfzDu2lPhFcBQrrpzetcC4iIiIiIlKxZAXr0gzyxQjv5xXaK0JgL62wrgq6iIiIiIhIZVaKFfnzCO9FDu0VJrCX5Dh4VdJFRERERET+o0qhEm8YhQ7uRQrtnh7YSzKse1pQL1QrNHW8iIiIiIhUNIVIw+U9r9xpJRzgCxHeCx3aPTmwl0RYL6uQftbWFbRFRERERERKRq40Xfphv4RCfAHhvdxDe3mG9dIK6p6yrJyIiIiIiIjkUkrrqZdIgM8jvBcqtFe2wJ75MM+d7E5ERERERETKWImGeeP8w3uu4H7O0O5pgb08w3plCekVvPkiIiIiIlIBlNla6KWlREJ88cN7uYT2sg7s5xvWyyOk570rpWwREREREfmvOzv9lumFgWKF+PMM74ZRcGiv6IH9fMJ6aQZ1rfEuIiIiIiJSFkpxrfUcGy36pose3vMN7RU5sJ93WK+ky8WJiIiIiIjIKWW\\/bFtebSjs\\/m1F3nYZK+3AXnLLxSmgi4iIiIiIeL7M7HZmDCzG2HPTzNxikcK7iWkWbp95Vto9ocruqWG9LKvoJT+8XRcWRERERESkrBWjpJ3HQ8tmGHsxqvFFrrwXHN7LJLSXfmAv3bBeGpX0vLO\\/QrWIiIiIiEjRGGf9b2mswV7kAF\\/E8G7ks4OzQntFCuxFCdNlMS4+z33m\\/T8iIiIiIiJSJoy8\\/lOs7RUpwBcpvJ+97VIN7Z4Q2MsqrFfUgF4xWikiIiIiIhVBxVmavSSCfGmF9zO3e0Zor3SBvUxmnC\\/644q0\\/UL9slh3FBERERERKWOFTLtlOqbdOPVPkR9XlPCeXzf4\\/LbpObPHFzOwWywWLBZLybZJREREREREpBS43W7cbnc+t56eXb5UKu2lVWXPb7tWq7WQVytEREREREREPINpmrhcrgLvk12arqiB3WKxKLCLiIiIiIhIhWMYxjl7jJdrf\\/LiBnZAXeJFRERERESkwrJYLAXOSFaiibc01ksv6SXoRERERERERDyKaeYb3C2Ztxc\\/GJdOYC\\/EdkREREREREQqunyCu61cKtmFDuz5308VeBEREREREalUsoJ7znnbSqR7fJGr7OfcXsH3VGAXERERERGRyipn5i12aC\\/pbvHnDOyF3puIiIiIiIhIxXQq+5bt1OuFCvjnCOyqsouIiIiIiEhll9VVvlihveS7xSuwi4iIiIiIiABgmmVYaS9Ut\\/h8bivE40VEREREREQqooIK2Ocd2ku6yl7gvRTYRUREREREpBLLL2OXTaW9uFX289usiIiIiIiISIWRV8Yt9dB+rlxd0GzxBXWLP9cs8yIiIiIiIiIVi3lWBD6v0F7YrvGFG4te9G7xCuwiIiIiIiJSOZ0Z3Mt2ybdcCuwWX2DYV2AXERERERGRyup05i1yaC+LKnvB49gV2EVERERERKRyO5V9y63SXnAhvaBu8SIiIiIiIiKVR35Z1zRLKbSXVpVd3eJFRERERESk8jHzTchFCu0l1TX9\\/KrsZ\\/9eEV5EREREREQqBTPv4F7ilfbSqLLnuzmldhEREREREaksymOd9rPacB5V9rxabubzexEREREREZGK6exqe8mH9jKosheumi8iIiIiIiJSweTqJl\\/o0F6Y8eznjOslVGVXgV1EREREREQqrRyZt9yWfMupyFV2pXYRERERERGpJPIaEH7qdyUb2s+za7yq7CIiIiIiIvKflX\\/FuuRC+\\/l2jVeVXURERERERP7rzs7AmdX2Muweryq7iIiIiIiISN7yzsCFCu2FmYSuJBW2yq4J5EVERERERKSyyKvaXnKV9gISdFG7xhe+yq7ULiIiIiIiIpXF2Rn3nKG9JJZ6K2DjhbtbHntRlV1EREREREQqm9xZt4zGtBc+YecZxlVlFxERERERkf+EM7NuqYf2Eukaryq7iIiIiIiI\\/EfkzLwFhvZCT0B3Pim6SF3jC\\/dbERERERERkYrm7IR7+jfFrrSX5Ij3wnSNV1wXERERERGRSqWAudhLtXt8aXSNV2oXERERERGRyiX\\/1F5GE9GdH3WNFxERERERkf+C\\/LrIl09oz6MEr67xIiIiIiIi8p+VT7G9+KG9wAnlihuzldrlFJOkjeMYNe0A9nLaf+rh5Uz6bjrbnUV9rJvjq37jq69ncdB1anPJbJn0Ps+\\/OYVDrnwe5krm8KrpLNiZdv7NFhEpZfbkFBzl3QgRkRzs0dtY8PdqjrtLbptm4l4WTPiJuQfyO3ETKQl5p\\/Z8Q3uhZ44vfjPyvKUwXeOV4f9D3CnsXjiZ3ycv5UiRQ3OJNICIv\\/6PZ98dy6rIc30DmMRuWM72lNOPPTbnSz78bBrbs89sneycMZoJ09ZyJJ\\/Nufb+wAM3PcbIRSfQ14OIeKKM3eMY3rs3D0\\/Yr+AuIh4inXmvXcvdz09gWwmeM7p2juflF95m0taMzJ9PzuXNB99k7kmdpUnJyquLvOeOaS9MkV2pvVLI2DuBN\\/5vOkeSdvLLiA+YezzXwc91nJnPD+Pt1If55Op1PH7bp6xJLPk335mcTJoJOJJJSs99q4WwalWwmEkknGPfZvRUnr\\/jdh75dA2Zud1K\\/cb1sdijiYzNSuhGANWqBkBCFDH5dB2whFUhzGISfTJaH3URKRx3GqnpAC5SUzNKfXe2oHBqVK1OzfAgrKW+NxGRwrARVjUUIy2SqBznbK7EeJKKUXk3qlQlzHCTGJ+EiZvIVX\\/yz5zpTFp6nBIs6IvkmXGLFdoL7Bif342FHc+u1P4f4eTYmtnM\\/GcWq9Yu5e9pfzFjXdSZBz+LL2Hh4VSrHk549SqEhoYS6GWUaCvcJ2fwdN\\/LufeHBfzxWB+uuH8ce8+4Omvg5++HQTppGQV\\/7oxqfbn3hgYc\\/Ol1vt\\/uAAxC6zcghGgiY049M4PQqmFY3GmkpuW9PSMolBCLSUpSsj7pInJuZiwLX72ay+\\/8hkXTX+SqnnczZlfp1r+ttfrx7oy\\/eLNXdQ+uAojIf01IaDCGmUJyStYZlHMvY+7tSf8Hx7Ej9fy2afj642eYpKdnYGKh1qBPmTJvKp9dV1fHPylhZ5\\/5e8hnrOjd3hViKgsbjW7+loXzPuP6K+5jzOLZfHx1zTM\\/mEYYXZ79kdEPtKNBz9cY\\/83dtPQr3Nad0euZ+NF3LE06+xPjPLyBTVGZVX1L9c4Mvm4I1\\/TozKVXX8OgQV2pb3MRveYnPp20BydgtVjAdOLMOgc2Y1fzzSOD6Nr2Alp2vpqHPl9IhAMgkC5Pvc0ddXby\\/cd\\/EWmCpVZdahPNyehT7ci8CIBpJz1+L39\\/9CDXXNqaC1pfypBnJrI7HbAFEOAHaalpuoIrInly7f+bMdN3k2wCRihtevejT+8utO\\/Qk15XXsnFdb0KvS370UV889wtXNmpJY0bNaFVl6sY\\/vECjuXTvdQZvZZxr95B34tb0rTFxVz9xM9syj7WOjmxegKjRo5m+pY4HcNEpNSYyXuYO+47fp6+iWgngIWAoAAMM43U9KxjkulLw7b1SZj1Krc9\\/At7z3U900xm9+wf+GzkD8zek1U8sVixYuJ0OLNyiI2A9A18O2oOJ3SQkxKWO7l4SGgvDE1KV3l54+9vcGj2h7w0Ygp7Tp0guiNZN2s+m4+nAS4OLvqVyUv2k+xOYNPUr\\/ni9\\/WckcXdJ1ny9Qs89uWa7MnqMrb8xoejPuHnefG5PjJJzPvobm4cPoYDLsASTq+nX+Xm5v\\/P3n3GR1HtcRz+zu6mhxB6h9B7712kFwsiXa+CiCgqVVSqiCDSROmKICC9F+m995IAoYaQCultN2V3Z+6LBExC6AkJ8H\\/8cC+7OztzZpmdOb9zzpx1pnD74YzuXBJb9S67Z03h91\\/mc8QEOp0eBStWFdCCWf9tH37eGki+Jh1o7hbBnmnfMHV\\/0nac6\\/H1t+2x2TeXRRct6PPlJ6\\/ORFjovUnlNFRVBesV5vbowBdzTkGFN2le1Z5rq4fz3ZLbqIoDjg5K4nJCCPEAC1c3\\/Mb4SSvwTADQkafZMCZ8Wg3Xwu0Y9fMnVHZKXDL25J+MmLSWSzHJz4RWbu+YzOBvFuMZf415fXvx8yZf8jbqRO9PP6JDRTPHZgzgl72J5y31zk5mTFrK6RCVuCuL+bRdZ0YsPkF0\\/ho0rOqK\\/6YxfDJ6FxGaRuT+0bzfbRi\\/TB1H\\/47vMXp\\/6nOwEEL8Rw0+wNQxC\\/EwPnwZLfIMS0Z9yaQ9Uf+dTyw3+KvXO\\/QZ\\/iMj+3fkvR8OEaUpODg4oKBitSYtaVOYlqqPJzUAACAASURBVKOWsWxYHcx7xzJo7uVHzMNh4ty0rrz96Q9MmfoDfTt+xj8+Kopejw6wWu\\/dxmnFe9OvTP91Hlv8pa4m0lmqi2YGhvbnuDw\\/UT6Xy\\/\\/LSSP67EIGvd+Xhalm37R6HWL9+v1cThq2pN7dzuQv+zB4qRcW63U2TBzBNzMPE6MGc\\/ivSUxbcJAU50jFhsDja9iy+\\/z92UKdGr5Hm\\/xxnD7uQYrOIssVTpyKpsQbTSn6sBsxdQXpNOhDiodsZ8MRI5qmoaGgKID5PAeORJHz3Z9ZOmsqM1ftYuuGf\\/ihhSuJA\\/cVcrb+ml7lvVm55BAmu1zkctKIDI+83+NkjIlBUyOIytGJGbsOsfmvGcxeuorhDRV8vf2wokevA9L3TgAhxCtDJdAvEF2pCpS1e9RyRo6vnseyf45wJ9WtRffPu7GO5M\\/vipIABVp9znfDh9Grbg5UJSf58iT21ptOb2DO3BWc8DnIT5\\/9wH59M0asPszhLctYtHI7a4ZWJnz\\/HtwT7rLpjzWE1R7B1oN\\/0a2gN0vHz0\\/XCaGEEC8\\/LeIce08FY8HCzfW\\/M3\\/xbOYfDCHs7F981WUY\\/4alrOsrdmGc3fgvW096JU3QqxG2fRqzTjvy7pz9rO5XloA1C9kVoaHTJ0Wc5Kc8xZkqX8xm8ns5uTh\\/Druj0y6X1esffpznRYUhmzizbwJv6o6zdpsP1qT7eRXl3kptqPTO25RVL3L8TEw6fjJCQOqs+3yh\\/SlnmE\\/zp9gle79mFOwJ4OyZXfy95Az\\/3VakkRBvBmsAvgFWII4LixdzIsGOcpVKEXf8H1ZfsaDYO2CvBnMnWMPq487F8GQHkJZAfAKoAT4E3GsPMBSntJtCdHAIKaZkUrKRPTtEXLvArZiHH4RKoSpUyxON+\\/lbxFstgJJ4\\/tflpUA+hRivy3iZABwoWa0cLskvDvpSdOlZj5gd69lz9QY+8SohQUn365vc2XP4LvrS\\/2Pe8vG8XcIBsBJ2ZjmbPOyoWqMshnur0ekltwsh0qCnWImiqKfWseLyw+a+MOG1eRzjNwRhTYggwph8qWTn3TsF6DzzH0Y3NrF+YE\\/6fvUBPX8+Ta7uY+hXzQBqIFtWHyBGC+PgpJEsC6\\/H6CVz+axOHgyAJegYq7ZfhyLFKax5ceW6SuV2b1OxeEu+G9QCxxu72H1DZlgWQtxj5driEfTp3pcFtxRKfzqf1WtWMLFtLvTBHhw5sZrJ04+mGFGpxccTj8pdX\\/\\/EOl3MSWZO20Z44Xf4sHVJ6nzUheraHQJC7nWP6DHoFCy+Zzl+25h4jlRy0\\/yD9hSOuYSHd6qWRNWPNf0bUan5eM5YilC+tBO2RRtSx02HMcaIajFjJnloB32xUpSwNRMWHCG3AYkMpaiqmvYUb0+Qph+1TFqvaYkvpFru\\/isPfW\\/qZZKvx8HhCW9uFlmH5TQ\\/vvE+8\\/1dKVm+KIVLliOP8SL7918k2KIjV6lKFM+ZwK3TVwi16shf+00K3d7H2SALOJSkSSNHzu+5SJSm4FyyJhVzu1KkVC5MVw6x54w\\/cYoLxSuWp0zFiuSNPsW2HVfIN+Bftgwsfz8Ig8rdrUPp9NUafPW5KVm+HMUL5SG7oy16RcVsDOfOLU\\/cr\\/gTm702gxcs4XNtKs06LSCubAWc4izYJdzC0y8Om9ylqFzSlYQgH+y7LGP1l2XQo2KxaOC3gC7Nf+GS3kpsrAUlWwmqlclJNkMIx076kaf+e7QobUdCTDA+nuc4eyWMnK0nsnx2F4prB\\/m2zv\\/Y0vRPzk1viW0m\\/pMJIbImLfwgYzv3YcFNG4pWqUmVkoXImc0WxRxHTJg\\/1y+c4ZK\\/mQJ1q2E4e5qwEg2o7mrFvlgJsoVdSDrvKrgWKUfZ8mXJF3OePUdvYdRA0eemUst65Aq8QXBsGDeuB5NA4uXXrkgtmlXOg041ExN6m8vu1wnVleWTv9YwumEkC7o0Z9z1krRoXYdCCR5s2nCFxn9c4PdWciYTQgCWS0xt24E5LiPYu7oPRZN3I1rOM7FlR2Z5OVKmbiVcbfNSurCG95E9HPOOQbMvQuVqpcgReY5DVyJQsSFP5Va0KRvE1j0F+fnI71Re2ZkmPyUwdM8SSs98kz7rYilYuTZVizoSefkgx8ObM+vA77TL\\/l8A14L\\/oWe9EVwuVBLF\\/wYhCWCXKy9OMVbemH2I3xoeY3DDPmx2qkqVPM7kr1AC3ZWdbD2rp8fy\\/Yyr\\/8ghT0I8lik2NmVHnaLcf6wfM2bMD6nf8ESB\\/VlKkuZ6n\\/732ZM\\/tLF58kl2RBah6PHZvZB9IRDj74PXtav4xDhTplk3eja2wX3\\/aW4EalT8eAIj3zRyZPtxQgq05bvJAyjrt5cdZ42UfHcM0\\/oX5\\/au7Ry\\/eoPLnrcIs3Gj4fsf0ib3NQ4c8+TqxfNcDtBTrtNopg59g7wpDhUF59It6dSiFI4JEQTeusYl9\\/Ocv+CB53UfQmIN5ChVj7d7f8uEiUNp42aLrkBlKtrd4tDu49y8G0RwVGILrRobRWiUBaciVanXrAVNymZHF\\/0vX9ZqxRdzDxBgVdHla0z\\/kR\\/j5n+I\\/ee98PKLwIpKtO9l3C9d4dbdBLKVbkKPbyYzedAbFNADVk82zviXkOrd6PNmkZdpAgohxAuiOBSj6XutKedo4o7XJc6fPsmJk2e44OnFnRgbClRvR6\\/vJ\\/HLN71oUTyaSwf3cOSSFzcuX\\/nvvNvQzKmDHty65UOYoSh12n\\/MwH4tyR3jg+eZU1y8HURIXG4afDyROaObYhfkh7+XJ+6Xr+HlH0q8bUGqt\\/2IbydP4JPqLihKdirVKo7x0hH27NnPMQ9\\/TIoLNbr0pWUx+WE4IQRgOsbCX7Zj23U0n9XLmbKOo8uNwWsV6zxVCLrBjZtXuHQjCK1Abd768B1K3znMAfcbhGRvTL+ff+bTcnFcOb6X\\/VcdaTtmPJ9Vy07IkcUsOeVCm75daFwqDzYxd\\/G6eJazl32xFG5O\\/0k\\/0K2kY8qAFHeZjX\\/uI8fgf\\/l3UieqFHDAGmMmT8tvGPlhBVzs3ahS2szlPTs5dtWLqx4XuZ1QjDZDpjH67cLYybBI8ZzMZgtKytR+\\/3GaPe1PHNofslxavecPW+8DvepprPfBnvf\\/HktP+8tHDVhBr5bfc\\/uD9ez+vlqy3u9XhxpymrVrjnKH7BQsV49mjcqS82l3VDMRHgYuuRzl94+FEC8pC17zu9NuajbGHfqLzrmlViuEAGI20KfaYCKGH2JV70KpOiYsnBrbhG4nurNj81eUeoZKUEJUKPEOOcn2ND8RbNrIp1UGEjhoFxv7l5K6l3jhTCZTitsv4L\\/bMbJe551MEv9KU8OOM7X\\/OA4ojfj0wyrpEtjVkP1M+Go8ewMD2DVuIFOOhKEB5ttr+bpjH\\/72jH3sOtKbLnctOvf7mq\\/6fUSnN54hsAMojuSQwC6ESG8WXzaNGMCMUyF4rR3OkD\\/decTUHs9OjcB9yQA+nniGgj0\\/p70EdiHEPQ6VqVEezi3\\/ixMRKU9AsdeXM3tDIPnq1KGoXiPq9AwGDN+Ad\\/Bxpg\\/6ke0P+x3KZGxdcj1dYAcwOOBgA8YYk+QPkWkeduxl\\/U5OCfGviHj8D\\/7J6OG\\/sftuEbrPnkr3wunTZhQXcInz587geLUB5jMnOZ3bn7iGOYj1ucT1G9cweIWjlnfIgi1UQgjx4mnRt7lw\\/iw3Sl+l1LXTnAyqSnCvKjinU41ADTrD+jUb+XftOvZeN5Kv5Y\\/8ObQ2jumzeiHEq0Bfgu6Du7Hik\\/l82PIUbzSpTD67BCJ8PDh2zJPwXB2Y\\/lltbLHie+08584Fc\\/VqUU6dPIHRO4bWBV3Tf5JexR4HezBGy0zwIuvQSPwRhGcfHv+Uk9A97PnHTjr3iEnoQIbHvyy0kDV80mQIB7O\\/wYBpU\\/mifu507UG2mC0YbAxgTsBsY0vi7esa0eFROOTI\\/hK0TgkhxAtkMWMx2GDQzCRYbbBNx5OkxWMyrd+eiX\\/+unTs9w1DPqhNbhkyJIR4gIXAQ38yecZq9nt4Ex6nxzl\\/aWo068RnX39Eg\\/yG+8tZLHoMBgVzghkb2wyaz8pyirGNu7Cq7h8yAbDIFCaTieT3sQP3J6N7YaH92WeOf\\/R7JLS\\/LOK5dvAo+ppvUNJJhkgKIcQryxrKbW+NfCVyYy+neyHEy0IL4+L+cxiL1aJOiezyc7vihUsztCc9ltAuhBBCCCGEEEJkosTQTqrJ6BJD+0t4m6\\/c1S6EEEIIIYQQ4lWXmH2zVGhPHccfF88lvgshhBBCCCGEeFWklXGfKbQ\\/Kiw\\/dNR8mi88XeyWkC6EEEIIIYQQ4nWhkcV62h8gXe1CCCGEEEIIIV4XaWTcrBXaJaQLIYQQQgghhBCJtKwW2oUQQgghhBBCCHFfBoT29OwOl653IYQQQgghhBCviwczrvS0CyGEEEIIIYQQWdQLCe1pzhufZie59KwLIYQQQgghhBCJtJe3p13iuxBCCCGEEEKIV03qrPtAaNce+kPrKRZKp+IIIYQQQgghhBDiYbJsT7s0CwghhBBCCCGEeN1lYmh\\/ulj+wNKS6oUQQgghhBBCvGpSZd0s09MuGVwIIYQQQgghhEgpy4R2IYQQQgghhBBCpCShXQghhBBCCCGEyKIktAshhBBCCCGEEFlU1g3tj73JXe6CF0IIIYQQQgjx8tMe8SjrhnYhhBBCCCGEEOI1J6FdCCGEEEIIIYTIol6e0C6j4YUQQgghhBBCvGZeTGjXniBxSygXQgghhBBCCCFSMKTnyp4km4vMp8k\\/lEgHiqJkdhGEEEIIIYR45aVraBdZS3h4eGYXQbzCXF1dUzyWEC+EEEIIIUT6e+rQLn20Lxcn52yZXQTxCjLGRKOq6v2grigKmqZJcBdCCCGEECKdZeGJ6KR5QIisTFVVVFVF07T7t1zIrRdCCCGEEEKkLxkeL4R4Jvd62hVFQadLbP+TnnYhhBBCCCHSVxbuaX846csTIvOl1dMuhBBCCCGEeH7Ja9cvUWiXUCBEVnIvrCf\\/I4QQQgghhEhfMjxeCPFMJKQLIYQQQgiR8V6innbxNCRQiYz2sMnn5NgTQgghhBAi\\/UhoF0IIIYQQQgghsigJ7UIIIYQQQgghRBYloV0IIYQQQgghhMiiZCI6IYQQQgghhBAvHfOl40TO+gY12O+JltflKUz2\\/pOxqVgvg0uWvqSnXQghhBBCCCHESydy5tAnDuwAarAfkbO+ycASZQwJ7UIIIUQG0DQramYX4kWw3OJyeBQWzZrZJck0ljgPtp8dyuhLHpgzuzBCCPEaUUP8n\\/49TxHys4osFNrlZ6KEEOJ1Ex97A29TfLqvVzVuZ+qRJdxM1xxpxtd7KYeMFsIDV7A9LO6hSxqDZvLx8k\\/ZHv+KXtsSDjN5YxPeWlqYEn++xby7+5i4ujk\\/+wa\\/oIYKMxFR1wg0Z+7nGxexmd\\/3fcTA41uJy\\/MWdRM2sDHUkoFbtBAesp45Zzbh94oeWkIIkd4URxdyTv6XnJP\\/zeyiPLMsFNqFSEZLICoonNgMq5RYCTq5mPEDevG\\/j79g\\/GZvMrKaBYA5GI+t85k6fjwTxo\\/jp3E\\/MfXvPdyMeZqdNBMTEkGsBpo5iqDwWGnuEi8xMxdOtafvxeuka7bWwghOcCCnvQMxsSFP8N02c\\/JgWdqeuppGOVR8L3\\/Ih6fPYdFuc8BjOst8L3Pu6nT+uHmZtJob1JjlDNwyl7z1J9DGTnmuXbEET+PD7X\\/im9W+6LoidGi6mhlNJrKwxwV+K\\/c2A5o05+jOrvwRmpDx29dusnhrW2bczfAz96MKgVnLS\\/2yHams7eXnf7syLSAWAxmw\\/2oYnjcnM3RtGeqtn8gFs4L1mY4JjYgYf0xAgjGA8Kx2XAnxEjEfHEjpMoM4+DTDa6LX82GRukzweH1HJmUGly+nYHCrgD5vkcwuyjPLlNCuyUVCPI7lIkt\\/WILHk9bH4n3Yv\\/EgflG32Lf5OA\\/U48w3WDdhDkciEw8+Lfwgf\\/\\/lSdEPf2TapG\\/4X8MiGTsro9mXHTPmcTJbSz77fgTDR4xi5KjhfNbEyo65K7hsesIvheUqq378izNxYPFYwth\\/PJ6ysUEj7MgsJq7xyvhGCiEeS0dOx5yEGdOzd1Yl4NKHNNtxhLolAhm7tBN\\/RTyucqTgYHAg3mJKsxHMYA7kfPgdVKUUH7x1ktnlqvDmG8dYW7sGdg8sHc7Oo99zo9wCxhXP\\/\\/wXWSWKgKCbBGe166ahGOVdXfDwGMBfgUZAIVv+4cyqbcu8gwszvhdYyU1u+wiCYzPzTGbF9+YQPtr6M+ftezLjA2\\/2tJ\\/Au7kc03cz5l2MXFKOnmcuUbDSSg71PsHcem9R7BkOLi1+MyNXvMkE3+P8vrE6X3sGvB63cIiXgIrfrDfJ3nEZMem5Wk1FzaDzkU39kWzfPoL6Nk\\/xpmxtmbR3Ff0r6lM+n4HlfN05dRmIXe2WaKZowsd0y+ziPNojjgHpaRdZk84RJ7tYTHFPdgbT1ARio2OIjTMSGR6BKXU9zpCf\\/A7n2X8iDA1Qw+8S4lCCqhUKkztnHmxCvAh8wm09PRX\\/7cu4UqMfvRsXxXJxNdPH\\/cD4X1dx3aUFvdtZ2LHD96E9jdY7p9l2KqlipTjj7GjCaNTQOTpjH2vi6UbfKmQvlIeIg\\/u5KjdeimemEeU\\/ku5bfsc9ZD591w\\/lwDMNi9GRzdYZY3z0w69T2k1WbW\\/N916XOXi4LX08PB\\/Tj6mjYIU\\/2NJuIBVy9GVG18V85Kp\\/5DtAwcHWkThzWiNXFBxs7EmwxCYWx7SDn9aWp8HqL9kc+WBgVGNWs9C7En2r1sb+ufYjaesGJ+ytJh4+EP8F0W6zal9fFgVFJfuM9LjYORETF5kU\\/PQUrTCUluHzWJ6hQ8QBnMluqxGTYEwsT5rly3gaKgaHenSu+iF1nO0f\\/4Zn2ogeg96eAgW707NMbfI+7nB+BMWuA+O67OLbIvXo\\/9YxppQrKBVB8UyiNnxIocbTuJnU6qMFLaRD3rbMD9Qg\\/jqrB7ehWvlylHYrRf1PFnIpNmm5sCNM6VqLUm5uFC1WiXbfb8HXksC+EU1pP+kMxgOjaNpsDIfMPHI9qHfZO7ErdcqWpFTxUtR8fzx77yYWRguYS4tsdejycQNKF2\\/D9KtWrP7\\/8l2LUuTNV4xyDXoy7H81KPr57sTz8EO3Y2b\\/VyWo2e8XhrSvQakCuShQszf\\/3Eg8v5mPjaNVu0mcMQPEc33VIFpWcKNo4cKUeeNLll1N48wdv40hdbvzp5c1zXKK5+PSfwqKo8v9x3a1W+HUeQAAUTOHYvG+nFlFe25Z8lz92AuutEQ9lzVrVmM0Gh943mg0snbNmkwoEYAVa4pzlQEbm9TPPUhLGrahOJSi7QdtKaI5Uuu91hRPXXdSnKhcowQ+Hp6YNNAXa0LbYu5M++wjPvqoD0N+WcTJwOT9DRqxN7Yw\\/fsBDBn7F8eDEguiRXmwauJQBn3zMysuRCQeitZgTv49lqEDv+XXTdd4oNPcco197oVp2yg3hB1g4UaV9kNH0aPgZU75qtiXbUhhv7MEpNHdYQ65yI7l\\/7D6sHfi5EaKHQ52cYmNGXoDOqv5oT3mWtxdbt95MIToi1SnisGTi75ycRBPxxq+jF8vniUGBeccTWnpVodi2WvTonhjSj7pMHDtLvtPfMvqSCug4GTrhNliSnUcR3H4\\/Hh2R6ugFKSqW3sa5y5BmcLtaZa3EI\\/t1NAVooSLmVNnv2NnQkEeH6USg3mc+V5PuxXva0OZ7BWChoJBZ0BVLaiYOXtmEFtcRjCm0DlG7l\\/MnVRfMFPAbs7nbEMTR+UZ9yOcE2cGsSgk8RNRdDYYNMsjhkKr+FwfxqSbQc91adRi9\\/HboQVcf9hKlBxUymNk3sZ3mRN8ryKq4GDjQGzyEQqGBrxZMIBDvr4Z3IOrw9HW8b9\\/szTL93y0+KPM3vc755NOlZppB+PXVaLJumHsjLECBirW+pd5bscZunMe3ulQNzGFn+FaQqoV2b7JmPeX0Mi\\/Nz2PHCI69ZssF1i8fwrHn6idREcOlyJY\\/Sfzs7eRXFmyFiheBi4tutLq9ka23FYBjbCdmzhbtwtv5Ve5OLkHA290Yu35K1y\\/tJq2lwYzYKEvKhZOTuzDbOcxnPDyxvvcDEpv6s23G+NoNv4A\\/w6riVPTcRzYN5bGNtZHrEfF+8+P+HBDaX49fp0bXqeZVWkr\\/+s5534jAtYgbNsu55L3TgaXDWbZl5+wqfTvuPvf5tLGT9FfuZHUWfKo7QBYuHzQm6bzjnPD\\/wpzq+zju8n7Hrg1Kv7kj7w\\/zIfuG6\\/g43edLT39+P7DqVx8XFUreTnLPUeLnMD+jfexf6MTOcYuR3F0weBWAZf+kwGI+Xsc8ad2ZnIJn0Gyy4Gcrl9D27ZuZdyPY1MEd6PRyLgfx7J1a2ZM0KARdWI23\\/26n1DNSlRYJBZ0KIr2360UWgyXV49j0NffM2e\\/P1Ys+G7\\/hYGf9uWbmQe5YwWwcHvHTObvv5NGZVHBsagbrgG3CVQBfUGaffkNnUra4FypG6N+Hcs7xZOdLLUQDiw\\/RsFPJzK6tYl16y+QgBXv7cu5UXUoE4fV5PaKf7lhBcvljawJb87Iif0pdmbp\\/Zbee9TAy\\/jkrUhxg8qdwwfRmrSllIOGKVaHs7MC+gIU1AVyN9WJ3eyzlSkTVuCbuxi5IsOI0ADFFlsbMwkJGuh16FQtaV81on2v4RetgjWQC4evcPfqZqb\\/eYCQB1J7YdwKhePjJ\\/fDi6eh4ntrDn8H3sUG0Dm2pHelemS3qUqXau9QWAdogWw\\/MZJ\\/I+8dzBqht3\\/lVy9vVOI5cbIbk\\/2AmFXMvHQBC2BrsEenpmp8sh5hzaltXFcBHChb7mvaudiT3+1LeuZzQQES7s7lhwvH7w+j1OK28dP2KZy\\/\\/\\/Vzwj5+L3M9jz9Bj7aCg8GeBOu9sKfDRfViscdGQgCdogfNipVorofdpUzhdrSs+SU17mzgYIqhLlbuRPlgk70keZRn2w9wxjZuF\\/M8TyU11OnRJZuF3hq1juln9xKsaUTe+p7Pzp3BXvVi0bkVTzgk3UpY8Clu3QuisSdZ53mAuzbZiPGezNI7SUNw1FCuBl4i7P77XKhQaRHL6jnyx+7JSRVRBVu9HWZLfLJziS1FXAsQEOHz8HkKND+2HxnIohATaBEEGGNSnos0Xzbs68Wi8P\\/WkBC+hEErS1NvxUcsCYkFFOz0dljVe0dOWuVLSzTuF3rSalEFOh3chH+yDUf7jKT3ySP3Z39XbJwxBvzKsoB4IJYjJ75kV65xjMx3iG\\/3LycIgBzUr\\/8Pn1snM\\/7a3WfYj5TLr973NhO8Qh44Nyv2Tfm2w2+UvvY50++kigt6Z4xB01nq8981Pd7kQ9D9L5WFK+4fMOr6vfUqOOlD2XduCRdkbLx4Vs5v0rW1Lxu3+KFqkezedIa6XTqQV9FTqv8mzi\\/rRUk7wKkSLRrm4faN21gBW3tbjDdPcOxKKJaczfj1vC+L3nVJYwOPWI96m\\/X\\/nKLewKE0zKEDxZV6Q4fR7NIiVt3rrbapSYcOxbAFiN7Hhv0l+WRoG\\/IbQJ+nEZ1bu6F\\/3HaSXi\\/d6VPaFbYFXW4aN61A9O3bRKX4kpo5u2oN0W9\\/zQel7QEHyvSaxl9f1cXxcefl5OUUzyVu\\/xri9q\\/F4FaBXEmTzilOLsTtX4vp3wWZXbznJqH9NTRq9BiCg4OZO2fO\\/efmzJ5NcHAwo0aPeYEliefKunns8FFxqdGVrz+oR854d1aMm8vhcDVF65LZazOLT7nRZ1hLYjZswSPyNBu22tJlygQ6xK1h6ZFINGwoWasSkZc8SWtuN12uPOSICiFMBTDjtWEOW3iLbwa\\/SzmX1K2bWuJ\\/GqBpaPcqNpqW2Luf9HziUxpasuVTz9mghoej5ciBjni8bsZTrLgTChpGow5nJwUwYKuzEJcytXB993a0toP49P26FI4OTiq3DbY2VswWQEv2EWmhHF00h73+Gla\\/w6zY4k58uTpUDL7ApejUH4YtufI4ExESLqFdPAWNOEssCg8f7BQT+CsTTm3h8v0ZvYPZc2ECR2LsUNTz7PDch5\\/VlbrFGxMWeIIQABQe6KPXYol9VO+Edpu1J0bxt5\\/v\\/bkoFEMsvt6HuXH\\/e2SgXJEmqHdPpAhmAFrCHYJSzDqeGD4T7odPBdfCzSkTfAwPK6iaCijocKVZ5R74HyhKmYVfsMccRliq+1M0DQw6wzPvB9hQsUhj4u6cSOzF11TU+5+Ris\\/1acy7G46jYuLkjcVcNKq4Fm1HldAjnE\\/d06pd5Y9\\/P2BlVPJkFszu410ZmxQwrZFrmXJ4GVeVKjQpFMuFu4GJDQSWg\\/y2ZQAbY5K\\/14BbxQn01P5goV9icNQrOqxq8p1U0Cs6tDSaTo1+P\\/OduzvxmoaqWbBqGnF+o3hvw8+cS152xR5j5DZOhic9qV3n7z2DcC\\/4KxOLXmX8sTWEAygKWoqj8cHypRYX8ANfnNPRp9UUqvgPYrrvf73ydmoAp\\/wvJa4bQFeeRoX0uN\\/xwqp6csjfgVbl36JVraHUDVzMNmPStnWl6VGlNgdPTObks+zHPep1LkcUpWa+nA9+JwCd0zt8WMLIGvedRCV\\/QSlG4yJ5cL9zJanxK4AV22sy4Grg\\/eNZibvGwSDv+w0pNnnepE7CSc7GSGoXz8qRpl3b4Lt5C\\/6R+9h8ui5d2udGAex0QWz\\/6X+0bd6C1m06MHjdnaTRQgaqf7+Gec28mdyxPAWK1qX7hD0EPuQwfOh6rHcJDMlB0cJO\\/y1sX5iiuYLxv\\/vgytTIUMLU\\/BQukHbseXh5H6QouqTzcootEBocTu4CeblfmzSUoMWHLSiRoRMmidSiZg3F4u2JLm9hAMyXTxA1a2gmlyp9SGh\\/Dbm5uTFkyFBOnz7F3DmzmTN7NmfOnGbIkKG4ubm9yqVQgQAAIABJREFUuILEebB3fwxOOXRgk5ci+e1R7CtSt7wfp91N6HRxGGNV1OgrrF+0C2ORYuTM5kp2YjHFRBBlcMHFLjf1mpbG2+MaZixERRhR1bSqi6A4OOOECWOshha0h2W7bXm771u4PTiTFCh5aNq1Hn7zhvHDNgfe7VgVW\\/S4te5KyXOT+WbiCQp3bU8pPdhUfJv3XHbz47CZeNXoTrP8qb5WCmiqCloUEdHOuGTTgWbCaHIgm7MCmokYiyPZUoyV1VG8UXNsdo6i\\/6BFXIrw4todK1iCuRtui6ODAno9+ngTsdZ47hxdydartjjZBnNyy378LFYsqi12NnHEPtDNqOCUzZHYmLQn3RIibXpKlexCQa9BfHlqLafDA4gwxxKbEIJ\\/2CE2nf6Yd7esJMExgIM3jhIQ689Zj6+Z5G0EawCnzo1hWUQc4aYgwuONaCROumOxxqPqDCkngjQ0pWMJP2btGMxSH3f8YqOJtcQQabyJu\\/d8xm54g3FhOXAJ2sSWsDDirRF4eW\\/D3ezO8YBQrIDVEojH3avE6h1S9WBYuXKuA28d3p\\/iPnFbgx2WoJ0cMJqBBEJDrxCkc8BeAYPBAZ3Ri1vxCbgWHs2CdxbSv0hB7FwaUMs5+fddTz6XgsRG3SLyGfYjAbCaA3C\\/e414gwM2Cih6B+wsftyKvouP3xS+P3MCTYvB22c8U6\\/dJSY2iIi4SOLQHpjEyBK0iH+Cc1HUKXkZ89O2fF2OHx\\/K2rC73Aw8TUDsEfYFeHI9yoS9jX1iYLRtROO8Fzl+x4QatZm\\/Lu7gcnQIIdF3MBJLjDmxP9qqWVGU5BEzAd\\/IQPK7FElVwQhl+\\/kZ3CQHNroitGs0k955nLAv9AFtLb8z6NB6vBPiiUsI4bb\\/ErYFh+Puf4LwhFvsOfoxk+\\/W5H\\/V29GwWD1yWIzEo2G2JiTeuvCI8t2n+bBme2VqbZxFsHNRstlUplE+lbN+7kRZogmPOsnaq4cJDz3MSWMCVjWe6JhTnA4z4mTrhKLYYquL5HaYLyZDJSq5XONiWBxWzYLF4ssJf0\\/iIuYyZN8yrsYaiX3i\\/Uh++FTjjUL+LNg\\/mjX+VwhOiMeiWrCoZuLibnH2+k\\/8djOGuFuDGHzhKAFmCxoq8bGXOBMahp0h6d+OfDQsWoIjp0awOSoGk\\/E0O3yvczvwELetgGbkTtApvFR77PTP9+sG4vXm0KgzbXw2sXrlBk7V7ULbHAoQw7bBbzE1oS9Lduxmx\\/Yt\\/Pp+gaTzQTyhwTY0HPYPB67ewXvvt+Rc3ZPPl9xJoz7yiPXo81MobxSBd5KNVon3wyckb5rBXOeajzyGYAKD0qodPqq8T0pPnny5CA8K\\/a\\/+qUXiffEW4XIn4gsXPqYbFm9PLN6eRPzSN7OLk26k\\/ec1VaFiRfp9\\/gVz58wGoN\\/nX1ChYsUXWgbr3Vv45SzNe07JKw02FCicm5BgR7q2zs30ET1ZSX5qtu1Gm8h9TPr2Li5N+tGjQDGc68xgwYBPiIyLIy7hMB8ftSVbvip06Fef7GnVQxRbbPUJxCdYubl7J8F1etGiYMoedqvn3wxdV5DRw1uRo8zbDJn0dspVuFaj24hqpJh7Up+P+p+Mpf5D9lOXJy+6\\/YHEU4XsztEERKhouotc8IqjggW0sDNctqvARymKouBQ5h2+mfwOAPE3NvDLj5+wId6WAg17MbiwDr3akFa5p\\/HDJ2sxu1ahWTMX9o0biUOVZrQtcIKJXxwgT4OPGZIr9YehYGNjICE+XkK7eCqGXENZ+k4Opp2eytfnL+NjisKsOODqXJrKhd6m37tnect2JyN39KTeqSBwbEHfuh9w4GQzPnbuQN+G3dh+qAwN9LXo3bILBRSNULMJg8Ep1cUoF23e3INy9if+PPQ2P4YHEGlRMdjmpWiuujQtM48dlWvif+4Thq4swCCLgmO2hrSvVJNj\\/xaiqDkeCza45GjLoFYfUjDFVyCUM4G+1KxcL+W97job9MaV9P1rAbGqhr1THXo0W0FdHeiLDWLA5e60mzeGeBzJ6VKOaoX\\/x5x3BlEr1SAd54LNqXRgK\\/tNn9LZ8Un3ozcDl+flS7MVDRtccnZgSOse5AMUp058VXkFX\\/1ThO8pTvuaw2l2fRBv7yjLu3XH4Hb5Q2osz0mjOstonqJ1QiMs6AzB+ftRLVUZHXNUoFDsTH5cXYIYQx06V6vMni0NCMnxJfNK5kkKfq4Uy+6Mb0QAJhd\\/Llz9nWn7rxOpd6NO+VlMKe4MmDEmGLHP5vhfz7DlKLv8clC\\/qhspNqt6cCqoGE0appr4TFeBijlVlt8axJsXu2HSbMjhUpXGZftT6kZbKp+3wa3YAMa3cOT4\\/vfZZ7HSvsYI8qFxzmzC3saJhLiHlS\\/l9g\\/6ZKfvu4coFbiUlbuacl51I7+xKeVOWbCxL0b5Qh3oW\\/QAg+bb0VvTYTDkoUzx7\\/m1fBF0ikaPeh35ZE9FSm6PxQoo611ZrCaA4kTBAr2Z1X0mfqe\\/pP0fHxCNAzmzV3uC\\/UguJ22b78J6agxzdjVmSFQocSqg2OBoX5hS+VvQseUZ5jrs4ZdDH9PkgBfRqgo6Z4oUHsivlSvcH+5bNFc5HOK2882iHETp8lDRrScdY36i8cwhWDSwtStHy3qL6eQkoV08B\\/sGdG5zi\\/dHXafV3N9xVQDNxJ3ASPQFnbHTqxi9d7NufyCW+lbQwtnyZW1mVtnCnnF1cSlalXL59Nw0W9FQsLO3Q4uKIFIFZ+UR69EV5Z0eNZg0+RcOvzmORjmMnP19Oger9eLH0nq4k6qczm\\/wXvMBjJ+6mx7TW5E78gTrd3ljrf6Y8j4xA9U6vYt991msHliHHsUU\\/NZ+TasJbqw8ORaXsGu4R+SnWgmXNEfRiPSlmaII+6ZdZhcj3Ulof401bdoUR0cHAGrXrvPCt68YbDAkJJCyP0QlKiIa55zZKdxsAFObDUj2Wivaf\\/rfoyrdRvJrNysBm8cxx9ybse8VfUzLqA693orVqqdkx+GMtuZ64OeazFFRqDkq4ZiOZ1Vd3hpUilrKsdB61G9dmf0LpzCnRFUadMnLztlT8XDMQ8MPPsD5Edu0K\\/Uuo+e9m\\/JJfSGafT2VZsme+qj3vb\\/1pMcjyqQ36LFaZVikeFo6cuT\\/lHEdPmXcQ5fpzuSu3Zmc7JmRdf+4\\/\\/fBtealWDp3pe14VkpjNYaStK6zkNaPODUVqb2Bw7VTPdkszUX\\/o8UTb7XBNkUPo4YpPgql6Cw83upJttTvsanNF2\\/f4IvHrBpAl60r\\/ys8gd\\/On+HtBrWwe6L92Mjx1PtxXy4aN9jL+QbJnqo\\/9r+\\/1xr10PUadAZIY7JKizGACNevWNV9JOXufQxNUi2kXuPknThK1CmIc95+\\/N6pXxpbsKFhMy+23n9sxefyL2x1\\/oSNeVNVLzT1\\/uiKlM+HEBLrSLMml5lTKtVPpTWZluJhl7IpX27bJoS2ADysfMk5YG9IQLWrQbsatWlXY\\/pDlxzdKq1nFQqUmM7WEtPR4jczYPlc6nTewgepQ2\\/bC\\/Rrm+qtj9mPFAxl6VB\\/BR0e1goMQC8mvteLiQ993YJ3yFXsS87nRMt2yRqnZvLro1YrxFOzo16XDriuDKZLy+yJTyl56fLTBHb3eQe3eXryVupA5wpFiQwIJFZpSs+Zf3P9q37ULBWDphoo1Hoac\\/5XCB2Qq\\/XHdJrSn+rlr7HEY\\/rD14MOt08Xsuhuf76qXYIozQbXmp+weElfiuvSuIVLyUOX3xZysdeXVC1iIYdbberlyIWtjQ3Ko8r7NJ9E3VGs+GEoX7aryA9mBYfi7flpxXCqG6x4\\/tWbdvs\\/5vTmPhRKnw9eJKM4ZkMzPTBF5yPpcr98\\/xKKqqa8hGqP+RH1xJ9WSXuZxKcffC31OtNaLvkyaW0jxevJ3u\\/omM6\\/h\\/qK0DSNiIgInJwfqH5mHVZv1o6axJWa\\/fi0Q2Xy6KLwObORv1YE0WL0EJrkfExyVqPx2ruIeTvt6DaqD9WzPW\\/STuDyshl41vmKTqXSd0qQ2GurmLbKTPvPu1It18vfVmaMicbGxgadTodOp0Ov19\\/\\/O5BquKwQGU0jKuBHvnYvyIiWn1L6kRPwmjl3pBrd\\/Dsyv\\/1oGjvpCA9eyg\\/bBuNd+QTrqpciPngmYzzz8nWjLhR5hpvIrBFz6bF6LmXb7GVskbTvT07jXXhf6sZXAd2YXOYowy8UZXz7AZR\\/jsmE1ah5dF85j5JvrmZkyZI4YiEidB2\\/7PiK86X3sLl2pbRb7rUgDh5uz1dBH7C64wDKPOFnEBcyhR7rV1DnrYN8lz\\/1tTmS3buq8p15JIub96aCnQ7N4sORC\\/356pwL43r+Q3vdYaYf3k3NOt0JPDsPXdWJdHZN6\\/6lZ6AeZ+w\\/\\/bBrc5rvUjUomE2+hNsXIVe8P2G2hciju82a7d3Z4zaBRl4jOV5mJb+VTgwVatxx5u7owcqcf7O1cROc0tiUFn8o4\\/YjxYbusG1PZ1bln8mXpm\\/52TqKv+s3wBo4lp5bdtGq4z6+zm0Lqhdr9gzmctn5jCqaW3r6xGvIStDxrVzM14I3izugRZ9lfLuOXPzqLMu75JLvxEvOfOk4kTOHoob4P9HyutyFyP7lFGwq1svgkj09o9FEyiq0cv\\/xy58exMtL78a7g3qzesFixvQLIt7gQv4ydWk7uD+NHhnYNSLP\\/MP0RYcIK9CMj4Z1SYfADmBLhR5DqJAOa0rNoUxnBn14hC0rprPXbINeAb1tXup07kad3HK5EOL5KDi51KBOgRzkfmzItaF6nWWM2PMRfRZOw6LTiNcVp2mVhcyqWgo9oNc74WSw41lv99W7fsbsVtfpvmcQO7r\\/TZsn+jk8PQUL9aCbUy1K5MnJe2VcKfqcv\\/6jc+nDb60CGbK\\/JuW263BQYok1VKBN9aUsqJl2YLdEbeaX3V+zwtyd2W9\\/9cSBHesppu38k7yNtzHkgcAOkJ3mTVbRb99ndPpzIBaDgXgzFCj4AcPemUB7BwUS7HAw2GPQGbDRGdDSs\\/FPccTREI8x9exS2jX+3FKfrSWW0dHnA1YW3sfWOuWoV\\/4zcuSqQ0nbXuTLmw+idzL7zGxWXj2KXZk5LGmYdmBP3FYG7keK7eSheumPsbqUoXRCDzom5MDj3AcMO32Rem9uoX\\/upMZnXV7KFGiAjYsMzRWvKwUSrrGk93A+8zVhwZWavRYy630J7K8Cm4r1yD3ncGYXI8NJT\\/sr6qXoaX8O1nBffKy5KZbbQWZTzATS0y5eBVZLGOFmAy4OLhnwczsaxrgIbOxzZIGf8rFgigshRnMih0O2R\\/7OvRq9jpnXnHmvWisKP1WjgUZUXCRO9q487m2qJYLQ+ARs7XKT3fCCzuDaTWavbolP\\/atMLJLyE0gw3iLUvji5425y164khdNozVCjNjL7ShDlSnaiWa6cj93HTGE9y58HVpG72kjezeksYUQIIV4yj+ppl9D+inrVQ7vIXBLahRBCCCGESD+PCu3SSSmEEEIIIYQQQmRREtqFEEIIIYQQQogsSkK7EEIIIYQQQgiRRUloF0IIIYQQQgghsigJ7UIIIYQQQgghRBYloV0IIYQQQgghhMiiJLQLIYQQQgghhBBZlIR2IYQQQgghhBAii5LQLoQQQgghhBBCZFES2oUQQgghhBBCiCxKQrsQQgghhBBCCJFFSWgXQgghhBBCCCGyKENmF0BkDEVRADDGRGdyScSr6t4xdu\\/\\/Uz8vhBBCCCGEeH4S2l9hrq6uqKqa4o+maff\\/CPGsFEW5\\/0cIIYQQQgiRcSS0v+KSh6vkAUvClnheqY8tOaaEEEIIIYRIfxLaXwP3ApVOp7vfwy497eJ5JB8aL4FdCCGEEEKIjCOh\\/RV3L0zdC+wS1kV6kp52IYQQQgghMpaE9leYoihompaiV1RCu0hPqSejk+AuhBBCCCFE+pLQ\\/opLK7gLkRHk2BJCCCGEECL9SWh\\/DaQOU9LbLtKDhHQhhBBCCCEynoT215CELSGEEEIIIYR4OegyuwBCCCGEEEIIIYRIm4R2IYQQQgghhBAii5Lh8Y9hjI3P7CIIIYQQQgghhMhETg52mbZt6WkXQgghhBBCCCGyKAntQgghhBBCCCFEFiWhXQghhBBCCCGEyKIktAshhBBCCCGEEFmUhHYhhBBCCCGEECKLktAuhBBCCCGEEEJkURLahRBCCCGEEEKILEpCuxBCCCGEEEIIkUVJaBdCCCGEEEIIIbIoQ2YXQGSMhDhTZhdBvAZs7R0AJbOLIYQQQgghxCtLQvsrzM7BKbOLIF5h8bFG0CDpf5KyuwR4IYQQQggh0pMMjxdCPDMt6b+kB9wP8EIIIYQQQoh0IaFdCPHsNA201MFdCCGEEEIIkV4ktAshnp2mAamCuxBCCCGEECLdSGgXQjwzDS2N3nUJ70IIIYQQQqQXCe1CiPQhWV0IIYQQQoh0J6FdCPHstKTedknsQgghhBBCZAgJ7UIIIYQQQgghRBYloV0IIYQQQgghhMiiJLQLIYQQQgghhBBZlCGzCyCEEEIIIYQQQjwtb29fzp72IDQ0\\/ImWz5bNiXoNauLmViSDS5a+pKddCCGEEEIIIcRL59iR008c2AGio42cPe2RgSXKGNLTLoQQQmQATbOiKfpXv3Xc4s0VY05KuThhUPSZXZpMYY27yN5r\\/3DC9gO+K1dJKldCCPGCxMSYABg4sPcTLT99+oKnCvlZxStflxBCCJF1xcfd5HZsfLqvVzXtZMaJZdyypudazfj5LOeoyULE3VXsioh76JKmkDn0W\\/85uxJe0Z9DNB9l+rbmdF5TgkpL3mNB8AGmbWrDVP8Q1BdTACKjr3PHkrmfb1zkv8w58gnDzmwnPld7apk3sSXckoFbtBARtpH57lsIeEUPLSGEEA+S0C4ygUZcRDCRCS9mWzFXNrHigC8BR+fz49ef8NnXY\\/hz53ViMqPCYw7h4ra\\/mD5xAr\\/8PJ6fx09g+uK9eD1VYczEhEQQp4FmjiI4PFZ+JV28pMx4nHuXrzxvkK7ZWgsnxOyAq709MXGhT7BuM6ePVea989fSWFbF72ov+pw\\/j1Xz4YjnTFYFeHLhxgwW3vIkreYG1biSYTv\\/JE+tcbS0VZ5rV6yhv9FnzwL8stqXXClM2wbLmVJ\\/PHM7nWJSqQ58Ub8Zx\\/f3ZGH4Czi5a14s2\\/02c4MzMiA\\/thBYyEudku9QUdvPlF09mXknDgMZsP9qOFe9pzF8cyWabZ2CR4LCs7VXaEQaAzABCaZAwrPacSVEVqT6s+AdNzou8H9BjZJCPEhCu3jxNCOn\\/prApptPWE3XTFzftZnTwRFc2bkV94hUtQxrBDfOeBKmJS57Y88ajviZ8T\\/8D1svxWKni+LcqklMWuRFqV4\\/MPrzJriaYjC\\/6MqK2Zeds\\/7gVLYW9Bk2nG+\\/H8H3I76jTyMrO\\/9YiafpCQtkucba8Qs4GwfWi0v5adlFnq7aqhF2dDaT13o95fuESG86cjrkIMIUko4NTyp3rvai3d6j1C52h5\\/XdGVR5OPONQoOBgfizaY0XzVY7uARcRdVKUnX1of5tVRlmjY8yNLq1bF7YOlw9p4chVepeYwsmi8dLrLR3An1IjSrhStDUcpmz8ZlzyEsumsEFJzzfsu06rb8dWwx\\/hldXiU3uewiCYnNzLOYFb9bw\\/hs92Tc7bozpfM1trT8kQ45HNN3M5Y9\\/Li6Mr0vXKZg+X\\/Y2eMQv9VqT9FnOLi0hH\\/5cX1rpvifZO62OnxzLVBCiMgEsazrmZdWs26n6\\/Gnqhl0NOsK0nX2LmZ2LfhCgpPFYxz1S37BnhfSuSVeFhLaxYun2OFon4Ap7klPrhYSjNEY4+IwRkYQFZuyAq7FXmPXwvlsv24GEvA5uZUTt2Ix3j7H8euh6EvWoaptGGFqTgoVK0ihco1oUb8YTi\\/06FcJ2LGcq9X78nGjolgurWHGhB+Z+NtqbmRvzsdtLeza6fvQHkHrndPsOB2QeHFTnHByNBFj0lAcnbCLNRL\\/VBVkheyF8hBx6ADXzM+9Y+K1pBEd+AO9ds7iYuhCvtr6HYfjniWl6XC2dcaYEP3wipvmxbq9HRhz25MjJ96m\\/+UrPPqw1ZG\\/zGzWtPiKcq6fMPXdBfTI\\/rj7rBUcbByIs8Sl0Xig4GBjT4I1cUSLFruLSVuq0nzTQLZFPRgYVeM6lvhWpFelWtg\\/134kMThibzXx8IH4L4jmw7ojX7A0JCrZZ6Qnm60jxviopH8\\/PUXKDKJ5xHxWh2V0mHbCxVbDmGBKLE+a5ct4GioG+zp0rNSDWk72j3\\/Ds1D1GPT2FMjflS4la5HnOa5dim07Rr2zlcGF6vBp64NMKF1AKoLiMRI49m0lao06fb+h37itD6WbTOKqFawBu5jQtQE1qlWiQvl6\\/G\\/GKaKSvoRGjwV83qwSFcqXplzVVgxacY04yzl+e68FY\\/YZcf+tEy2GbiEKjbBjv9G7WXWqVy1HhZodGb836P51QYs8xR\\/93qRmxQpUqlCL90Zu5rYZwMyhwWWp\\/E4v3qtVhqoDdhCPRviRSXSrURS3UpVo3G0UX7fIS881iY2yDy2v9SI\\/N6jAJz+Po2eTypQuVJiaPebgbgK0YFZ+3pCB6yMSzy+WAHaO60S98qUoW6oczfr+yfnoB8888Rs+oGDr75jxdRvqli9CkTLN+G7rvYYyKwG7xtGlbjnKly5F9Q7fs8XXTNjGAbT6eAE3Qzcy+M3OzLoo3SsikZyrXzPr1q7BZDI+8LzJZGT9urUZtl2rNXkcVTDYKFgfdx7StMSTo+JCxXd70DinhZxNOtGoQMopfhTn6jSpGc\\/hzYcJMXrjFZCAz\\/XrxMRbsLG1RdEXoYSbHc7ZAlgxuBef9u7DsKlbuREPWIM5tXgc3w75nt+2XCNlZ7dG7I1\\/mTFiEN+OW8CJoMR90KI8WDNpGEO\\/ncgq96QT+CPXA1iusd+jMG0a5oawAyzerNJ28Ai6FvTkjK+KfZkGFPI\\/R2AaycUSepFdK5ey9sjtxEq+YoeDbRyxsRroDeislof2mGtxQfjceXD4vL5wNSrbeHLJL10HJYtXnDViBTOvnMOIgpNrY5oVrU1Rl5o0K9qQEk86DFwL4tCZEayPsgIKTjZOmC2mVMdwFMcuTmRfjApKASoVaUuDnMUpVbAtTfIUfPwkX7qCuGUzc8Z9JLvNBXh8lFJwMNgTZ0kKgFi5ffM7frsdioaCQTGgqhZUzJy\\/8A3bsn3H8ALn+fHIUu6m+nLF3tmLe45WNHJQnnE\\/wjl94RuWhiZ+IorOBr1mecQQfxVfr+H86h38XGFVizvA7GOLuPmwlSiuVMhlYsG2zswPvdeEoGBv45DscwMM9WiSP4CjAX4Z3IOrwzH5ttMs3\\/PREo7z5+FZeCTtiBa7i8lbatD63+HsNVoBA+WrbeD3IicZvm8+t9OhtcAUcZYbqYeB2b7B9x0WUj+wL5+cPEJM6jdZ3Vl+5FdOPVHdXodrtsJYA6cx1ddILqkFiseypVant9G2b8bDAhDL0c0HKNqxI6UUPxb1682+mnM5dP4i57f0ImrSl8y8ZAHrDf4c8ANhvXbg7nmdM4vfwH3IIJbercqAdbsZ28yJKgPWsntKB7JFbmRoz3\\/IN24vZy9cYu9wF5Z8MYHD8YAWyqaB3fnD7lu2ul\\/m4qnFtLo0kJ6TziXdiGIlJLoUw\\/dewWNGW+yidzGq95\\/YDT3A1RsebP0uJ7c8k74c6iPKC6D6c\\/SyG2O3\\/5+9+4yPomobOPyfbekhCRAgBAi99957b6J0OyqiUgURBERFwfZQpBdBUUCkKkhHeu8dQguk97rZ3WyZ90NCSEIoIggv3Jc\\/NZmdmXNmMnP23KfMnCHwwgraBX7B1+vjc5Stdq7MeZ2BBxow7\\/BlLl3YzjBlGq9\\/sT\\/X6VK2E\\/uI67mE\\/Reuse8TH5Z\\/Oo\\/TNrBfms4b7+2j3rwjnA88zo\\/1DzB08BJMnaex5ad+lMzblcl\\/r+CDSvJYS5FOiuvnzKZNG\\/nqywnZAvfUVCNffTmBjRs3PJY01ehtTPlkASdSVKzxcSSroNEoqJmloEr8sZ\\/4fNhQJvx8hFgVzIGrmDDoHQaPW8TxjEl35gt\\/MuPXQ5ktuLfpKVmxDLYTCxgxaBZBZZtR8tJcFlwqT+s6vigYyOfrg0\\/DIfwwdwbfTp7NrG9eoYIT2M7\\/yer45oz+6j2KHVvGzsgs1Uw1hj2\\/H6DQWxP5pE0qa9eeJg07NzYv50qVD5k4oiY3l2\\/gqv0++wEcERcI9q1AcZ2DyP17URu3o6Szismkwc1dAW0hCmkiiMxRM7cFb2Ty178Tkq8YPolxJKqAYsCgt5FmVUGjQXOrcQOV5JBAQpMdYA\\/n9L5LRAWuY\\/qPu+8cWqv1p5hfPMEhMh9ePCgHITfnsSQyCh2gcWnJa+Xq4KmvwouVOuOnAdQIth3\\/jE1Jty5klbiQH5gRdAMHFo6eeJVpYUDqSuZeOo0d0Gud0eQMSu0HWHtyM1cdAC6UKf0BbT2cKVDkPXrl90QBrNHzmXj2MLdKMtW8mW+3T8kMsMANZ8tOfgw8\\/AA92grOOmesmT3tGjwd11l6fh2xgKJoQbXjIIWr8VGUKtSO5lXfo1rUn+zL9qA5O5HJN9F7liCf8nDHAe4YzNtZGHgsvSFD0aJR7ZkBsD15LTNP7yRGVUm6MY7BZ47j7LjO0tO\\/P+CQdDvxsUe5Yb913o7wZ+AeovTuGEMmszwq42w54rgceZ7bz9f1pFy5BSys5crCXZM5nz7sByetE1Zb1qqqAX\\/PQkQkBd9j9EQo2w6PYElsKqgJRBhTspdDagjr977DkoTbV4U1cSmj1lak+Zq3+C3OlJ62zgm741akmlv+cpPM2bNv0OW3arxyYD3hWRJOCf2M948fyGxAUnRuGCN+4PdwC2Di4PGh\\/O0zno\\/z72Xsvt+JBsCbOrUX8Y5jMt9djXqI48idZAlIAAAgAElEQVS+\\/pp9L\\/F9UOwd5bLi3Jhhbf5HyauDmBmVIzTQuGOMmc7y0NtXkcUUzO3p\\/jYCz7\\/JhGu39qvgpo1j9+mlnJax8eIB6Gu8RGc28dd5G1gOsWF3UV7oWhKtxpfuC46xamgV3ABDQHOaFA\\/mapAdFD0uTjZCTx7gXKQZ16qj2HxtDa\\/73Rl6KG6t+Hb\\/FsY38kZBS4FmLaiQcI3rySpq4haWbS7O2yNaU0ALuFXgrZEvkbRsKcesAFqKNutANc\\/0\\/aYd\\/oMtrj0Z1LM4Tih4VOlOh4oZge+98gug5KP1G70o5QqKZw0aVdcSeiMye1lmv8a6ledp8O67VPFQQF+YTuPnMbald64dKLpqvenXIC9a9BRu2IDi4UGE2G2c+30JV5sPYkBVDxTFk+pvvUz5QxvZd0ernBDpJGh\\/zowZO47o6GjmzZmTuWzunNlER0czZuy4R5iSSsqxpfy8NwryNeSVQS9S2S2ZQ4smsOxEKo6sNRLTKVYvC6LGoKFUu7GCbVej2Ld6P\\/7vTmFU3WCWrjyFGXCtVJMSN85yJZdS0VC4CIV82zBqwTy+HPg2g76Zx6xvBlAvnwIouHu4kpqcgsbJE29vd\\/SZnYLpAa+KiqqqWRoS0j9zqGQMvUz\\/PGMpZFl+\\/\\/2AIz4e1dsbBQvXrlooWswNBZVUowZ3NwXQYdBYsWSPXLi8fTNq26H0e6ku\\/inRxDkA9Oj1dmw5z4May8HFc9kZpmIP3cfvf53GXLYOFWJOcf6OYVsG8uZ3JyE2QYJ28YBULDZzxk+5M0b+wHcnNnAps6cwhp3nvuFgqhOK4zTbAncSas9DrSINiY88QgyAonBHH71q4p5TldWbrD3+GUvCg7k18F3RmwgJ2c\\/VzO10lC3cCDX68B1P2VatkURne4qXgkHnRJrdkhnU5PFrTqnYg5xzZNzzKCjkoUn5XoQfKEW1pUPYaY0jPsfcFBXQKrqHPg7QU96\\/IZbow0SogOrAwa1z5CDk+jQWRsfjqqRy9PqvnE9V8fJvR6X4A5zJ2R2vBrJo65usSs5a5Yxhx9FXmJQRYDqS1jLt8G9cVirToKCJM9ER6RVU+x5mbR3OemPWbXUUK\\/sFvdUf+SUsPXDUKBrsavaRVFqNBlW9MxpMDf+W8efPYFFV7KoNOyrm8M\\/ps\\/E7Tmc9T4ozxqTNHEvMWKhe4dddIzhb8Du+8A\\/k2yNrMhoTFNRsV+Od+cvJHPElw84qvNH8ayqGf8SM0Nu98k72MI6FZ2mo0JSjQSEtZ6KuY3dcZH+4Cy1Ld6RFtWHUjvqVLcaMtDWl6FmhFvuPT+bYQx0HmZ9fSixCtfzed94TgMa1M32KGVl7bhvJWT9QitLALz9nIy9lNH6Fs+rveoy8EpF5PWO+zL6YoMzgQ5e3GTWtRzhllKhdPABdVV7sorB5\\/UVSj6xnZ5EX6RKgAQzoEw8wY+ALdOzQkRe6vccvl23pdSBNMfot+JUe5oW8Xa84pev2YPyf17HmdnHrnDCf+4mRPdrTsVMnur06nePW9LqUIzaCaMUff9\\/bIYvWrwgFY8Lv6OgAsMXHkexbmIK5Rjj3yG8uFI2Cw5GzQhdHTLwXBfLffqKJxq8BPdpVwO0+pxGNBkV1oOIgIiycpE3DaVitCtWrVaFGu\\/9x0dlKSpLckyJ3ErQ\\/Z4oVC2DYsOEcO3aUeXPnMHfObI4fO8awYcMpVizg0SWkJnL078PYPfKgKC4U9M+PTvGgWp0iXDhyCbsWTKkmVHscJ35bwgFtMYrm8cTbw4YpNZnEZBfyeDrj17ghBS6d5qZdJS0hEVNGIJ2TxjsfeYyJJOda1ikYnAykmdPuCDZ0Fbrwguc2Jo6ayfXqvWmatZRX8tOkR11C54\\/iy80udHmhKga0BLTuRYlT3zPq28MU7tGBktr77OfWKXE4QE0mMdkNTw8NqCZSUp3Tg3Y1lRSbK+7ZRkFpCGjQAv3WTxk8fDHnE65zOcIOtmii4g24uCig0aIxp2KyW4g88DubAg246qM58tcuQm127KoBg96C6Y6HmSi4ubthSjFK0C4ekJaSAS\\/hF\\/QRw0+u4XhiOIk2E6a0WMLj97Hh5Nv03rKCNJcw9l4\\/SLg5jFMXPmTqzVSwh3HszBf8nmgh3hRNYloqKg5UFWx2Cw5FS7ZZ57omdAkIZd6OkSwPPUOoORmTLYWk1GucDV7EpI2t+SbeG4+Y9WyKj8fiSCDoxmbOpp3hcEQcdsBui+BsdCAmrQuGbMdhJ\\/B0N3oc3J1tnrhe44QtZhv7UtOfjREXf4kYjQvOgFbrgjb1OjfS0shTeAyz2s2jf+FCGDzqU909672uxdfdD3NyEIkPcRxWwG4L50zUZSxaF\\/QKKFoXnGyh3EiOJCR8CuNPHkFVjdwI+Ybp16IwmqNIsCRizqVstMf8ym+xPhRxzZrHArQpXYfDxz7mj\\/gorkUeI8J0gN3hF7manIqzzjk9YNQ3pEHecxyJTMWR\\/BeLL2zlYkossSmRGDFhTEvvkXeodhQlay08jZCkcAp4+OcIPOPYemYW1\\/BGr\\/Gnbd2pvJbXDeeCfWljm8nHB\\/\\/ghtWC2RrLzfAlbIlN4FzYEeLTgth5+G2mxtSgb+V21Pevi5fNSBoqVnsaOo3unvnLpAaz9u+aNNk4h1i3orjrKlE\\/v4NT4WdJtiUTn3yEtVf3Ex+\\/j6OpadgdFlKMxzieYMTN4IaiGDBoErmZEEKqtiIV3C9zIcGc3vhgC+FI+EXMifMZve83As1GTA98HFloqtKoUBiL933B2vBLxFgt2B027A4rZksQJ699zaygFCw3P2LUuYNEWG2oOLCYz3MyIQ6D7tZEEF\\/qFS7BwZOfsjE5hdTU42wPu0Jw5D5u2gHVSGTMUYIczjhp\\/93bDcTzQkfFFzujbFrDinU7KdKtK0U0gO0Ik3qN5kb7mazZ8Bdr18zhtbIZFRlbItFpFXl75gaOXLvGzkkVOTDkbWZfujPStl+eyRsD9lJ14mrWr1\\/PmiVDqKlP\\/0ybrxAFiCAi7nYBZw+9SYRvYQrm8rgSXT5fvGIiic6tPniv\\/D4obT58fZKIibtdxqgpoVy6GvMP3huhwSdfPvz6LuLwydOcOHmaEycvcvnaavr5S2gmcicTJZ5D5StUoP+7A5g3N723vf+7AyhfocKjTcQeQlBoYUqXzFpdVnDx88NlVwwFerWFGYN5fYGWwvW70LdBCGsmfEJywQ68Xy6APF1KMHvKB2xOsWAxp3H69S0Y8vhT68UPqGrIJT29Cy6KGbNFJUs3eiatVos9t0n0Wl\\/qvfkZ9bJm\\/eLPjFrrxycft8a7TGeGTuqcbRPFqyo9R1Wl5332k5Umvy+a3RFYqIynewrhiQ5UzVnOXDdT3gZq3HEuOFXg1WxfQAouZbrw4TddALBc+YPvv3qHP80GCjZ4g6GFNWgdDWmVbwpf9F+NLU8VmjbzYNfEcThXbk7bQof5buAu8tV\\/g6F5c54TBb1Bh9VyZ0OGEHej9RnGgvbezDg5lY\\/OXCTElIRVccHLrRQVCnXirQ6HaK\\/fyoQdr9PiZDSqSwv61ezD3uNtGeDWgX51erDlYCVaamvwatPuFFBU4qyp6HRuOb6MfGjVeBPKqUksOvAS3ySGk2hzoDPkx9+7Do1KzmRt+RqEn3mXT\\/4oxiibgqt7fdqUr8HhbcUpb7VgQ4+HV1sGNutLwWyXfxwnI4OpXqFO9rnuGh3a1BUMWvIzJoeKs1stejT4lVoa0PoP4r1Lr\\/HizxOw4IqPR1mq+L3M1PaDqZGjfuVWsDkV9m9ij6kf3Vwe9Dj6M3KNP8OtdlT0eHh1YHCLXvgCims33q3wOx+tKMV4JYC2VT+mybWP6LmzNJ1qjKFoYD8arfKmfo3FNNNnzYlKXMxxYvK\\/Q+UcFVsXr3L4mWbz9Z\\/lSNHVolulSuza0owYr\\/f4oXi+jGA7D0U93QlNCifVM4wzV2Yyff8VErXFqFV6GhMD3AErxjQjzu5ZnpZuO8iOMG\\/qVCyWvSHGcZbjMUVpWCfHg8805Sjv7WDFzZF0vPgqJlWPl0dlGpQaQImgztQ7p6dokUGMb+LC4f192G21067KKHxROWVNxVnnRprlbvnLnv6+EE\\/e7LCdEpG\\/sXpXK045AiiY2ooaJ2zonYpStlAH+hXew6hfPXlf1aDT5aNU0ZF8U8YfjaLSo0ZXPthbnSp\\/m7ADyl++LFWtoLhRsMDr\\/O\\/FqYSdHEqPxW+SjAvenlUe4Diy8qZN4w3YT0zgx10t+CQ5DrMDUPS4OhWmhG8LOjc7yFTnHUw98DZt9l8nxeEAjTv+foOYVKF8xjnX4u9dBhfzFsb8VpBkTX7KF+1NZ+Mk2vz4MTYV9E5laVnzR7q6StAuHoy23It0crRl\\/OpqfLor4ynqtijCozW4ubugU81EHFzNtitW8jsA834mtB6JYdYOJrfJR6EK5fFz3obVDqDByVlHSkL6QyzV2HCi7M64ueogLY5Tq\\/7irNVBBwfg2YbebcfxxaSNdJzcgUK2y\\/w69U98+q6gph4O5sinoXZX2preY\\/qat5jTowjW82vZfN6W3gt+r\\/w+KE0AHV4ozax5i7jY4gPKOcWy+4tuDLJ8zYFpzbFcP0V4nsqU8bnXA1B1VOn2Iu69JzGnzy8MrJYHa+gW5q5w0H1wO3wNzjhZEkk0A7nVecVzSYL251TjJk1xcU2vaNWqVfvRJ6Do0eus5OzssCclYnEvinepBoyY2inbZy26Zvmlbj\\/G1e1H2pWlfLnKlyEjW3FH3JktPR1arR1rrkNRFTwbDeabeoYHuuCtSUk4vCrh9gjrMhrf6lRMWsrB2LrUa1OJ3T\\/9j7klqlK\\/uy9b50zmrGt+6r\\/8Mu73SNOpVFfGzOqafaHWj2YDv6NZlkWvvnHrp770vkeetFpNjgcECnE\\/Grx9+zGuTT\\/uPpmmF1++0IsvsywZWWNW5s8Dq83Mtnbe8us4Vj6X3WhL0LLGfFrWuHtu\\/KuvYGv1HAsb3X19AFQLFrseQ7YeRhVTWjJK4WkcatsH95zb6GvxTrvzvHOfXQNo3HvQ1+8bZp09TofaNXF6oONYyY6cx5HJh4a1N7M\\/azFdK8vZr\\/bJXfer0+jAYb3jIXY2UziJXu+zuNtoytw6DfVzrOS4zNEoMwHVC+Ge7x2+65zb0eup1+gitx9haic48Hs2u73B8nw5S1sHam4jpdRYYs0uNKl\\/gqnFc7wqrf632X59sVT2j9u0DKMNAHfLXxaKC846Kw5DddpWqUXbKt\\/fddVRzXPdAQUDvmdVwPeoaX8xcvV8anVZQ6+cQW\\/LI7zVMsem9zmObHRlaF\\/7F9rf82v5NT7v9Bqf3\\/VzGzfjAnEqPocdTdtlaZyaytf32q0Q96ItwwsvFGPa3hfpWCij6c25NR9\\/u4F3B1aiuN2H0i16U6mUysWwaBzu7Zjw03mGf9KcasMdqIoPdT+axnvltYCGBn1eQ\\/tWW6pfn8Lfcwbzde+3+LheMcZ6BlC\\/TyPKOv1NeIQdCvjQefISQj4cTptKw1G1bpR5aTK\\/jKiCPrcnlrg157OFA3j\\/gyaUH+dJ4coNKVxAj16vuXd+H\\/xEUPr9RXwfPZg36s7CrBgo0GgQv37THDc1kl8\\/6sqPdTew7aOK99yLocbH\\/PrtZ3z4Vk1mWpxx8ShD13FTya8BbckuvFJ\\/AUOqNeXS8m2Mrq2\\/576ed+7urqSkpDJ16sIH3sbHx\\/sx5ujxUBw5Jmuod5vYcevz9JVy\\/0zNXCPHcvW+62VdJ7c0sn2eZXtX10f8PtQcjKbc58U97dLMqTi53Hd2zWNk4fzi0fwY14Z3X29JaS8HCVcPsOrHdSg9v6Bfdbdc5+zdZiPhwkZ+WnQIv7fH0rPMY3qVzh3SuLBsJhfrfEC3ko+2edMcuIKpK620f7cnVfP+\\/28vs5iM6HR6UMgYHqtJ\\/78C3OevK8SjpZIc8RUfnffjo2b9KHnP0YVWTh+qwxsRXZne6hMaummIj\\/2NSdtHcqP8HpZWLokldjYTA\\/MzoG53Hmakoj1xPv3Wzad0i82M8ct9fnIuW3Hj4quMiOzBVyUP8tnZIoxvPZCy93tb3T04khfw5toFFG+8lJEBJXDFRmL8WibvGMaZEptYUa0iue5ejWbfwRcYEduHXzoMpNQDngNz7BT6bVxBzTbbGO6b87s5kR27ajPeOpp5TV6nnEGDagvm4LkhDD\\/jybjui2in7Gfmob+pXqMnEacXoKn4Jd3yOOWa1j\\/mOMykFQMxtNzP8BwNCjZTCPFO\\/vikhRFv8COfcpO1f7\\/KziITqH9jPEdKLuHbEuk9iw7zYX7c+Rqr8ixgdf1G5FYDUS37Ht9xZEsoki27+7DGdyr9zWP4n+0T5tauhz3yK97auo0W7bfwXl4DOK6zdvdILpaew8eF80rpLJ5tagKntxzGqX5rynoqmC7P57XOa2i9eT39i8nQ82dRUFAwx46cIS4u\\/v4rkx7k129Yi4CAIv84LTeXx1CWZ2E0ppJtxhlK5u\\/\\/\\/yMH8ZRyokLvD3lx2U\\/MH72ceJuBPIUr0OClj+hyn4DdEbmHhTOXc8JcknZvfkSn\\/yxgBzBQvs8wcuv4+7ecy3Rn8Cv72PD7NHZa9WgVBa0hP7Vf6kWtfFKNEuLhKbh6VKemr\\/cDvMJKT5WaP\\/PR7rcZtGwaVo1KmiaARhXmMbliSbSAVuuGq84J3UPelto8bzOl2RXe2D2CbS8uoPUDvQ5PS6FCvejuWpPieX3oWjIPRf5FwA6g8XiTb5tH8Mne+tT8W4MzJsy68rSq\\/DOzquQesNuT\\/2Ly7g9Zae3F5HbvP3DAjuMoM3YuJH\\/dPxlyR8AOkIdm9Zfw1p6BvPzLCGxaHWk2KFCwD8Paf0E7ZwXSDLjonNBpdOg1OlTlEZaLiguuOgtGe86nEl5m0ZambCn2M51D32BloS2sqVGW2qXfwcunFsUNr+ObzxdStjH\\/1FxWXTmAoeR05tfNPWBPT+sxHke2dPJRtcRr2D1KU8ram85pXpw78ybjTp6jduM19M+b0fCsyU+pgvXQu3tIwC6eAwr2sPWMbPMh15KtqK7l6Pb9HPpJwP7MCggo8lAB+P830tN+H9LT\\/gSkxXAzQkfBIl486KufxX9PetrF\\/3d2WzwJNi0ezp6PYdqgSqolAb2TN09+YKONVHMsRlzxdva4Z2u9I2Utc6+507ViK\\/z+UaOBSrIlEVcnr9x777OmYU8gzmLF4JQXT+1\\/VJFWrzH\\/zw6E1D7D537Z\\/yJWYxCxzgHks1wjylACv1xOkCN5HfOvRFOmWDea+Hjf9xifCMcJftq3iryVRtHJ211KYSGEeMSeZE+7BO33IUG7ELmToF0IIYQQQjwvnmTQLmNFhBBCCCGEEEKIp5QE7UIIIYQQQgghxFNKgnYhhBBCCCGEEOIpJUG7EEIIIYQQQgjxlJKgXQghhBBCCCGEeEpJ0C6EEEIIIYQQQjylJGgXQgghhBBCCCGeUhK0CyGEEEIIIYQQTykJ2oUQQgghhBBCiKeUBO1CCCGEEEIIIcRTSoJ2IYQQQgghhBDiKSVBuxBCCCGEEEII8ZTSPekMiMfHYjI+6SyIZ50CCkr6D0IIIYQQQohHToL2Z5TB2QVUUFFBTf9XRU3\\/UH2yeRPPiJxxusTtQgghhBBCPHIStD+zFLJF5wooanpUpSoStYt\\/T7kVpd8RrEv0LoQQQgghxKMiQfszTkFBvRW\\/3y3GEuKhZLmSFOV2EC+EEEIIIYR4ZCRof5ZlBOuZgTtkdL5LcCUekcyGIGkREkIIIYQQ4nGQoP2ZpoCiZgbutxYJ8Vgomf8RQgghhBBCPCIStD\\/zlCxxlMxlF4+DBOpCCCGEEEI8LhK0P1ckuBJCCCGEEEKI\\/080TzoDQgghhBBCCCGEyJ0E7UIIIYQQQgghxFNKgnYhhBBCCCGEEOIpJXPa78PNxelJZ0EIIYQQQgghxHNKetqFEEIIIYQQQoinlATtQgghhBBCCCHEU0qCdiGEEEIIIYQQ4iklQbsQQgghhBBCCPGUkqBdCCGEEEIIIYR4SknQLoQQQgghhBBCPKUkaBdCCCGEEEIIIZ5SErQLIYQQQgghhBBPKd2TzoD4b6mq+qSzIJ4hiqI86SwIIYQQQgjxTJOg\\/RkVHx\\/\\/pLMgngNeXl7ZfpcgXgghhBBCiEdLgvZnmJu7x5POgniGGVOScTgcmYG6oiioqiqBuxBCCCGEEI+QzGkXQjw0h8OBw+FAVdXMqRcyBUMIIYQQQohHR3rahRAP7VZPu6IoaDTpbYDS0y6EEEIIIcSjIz3tQoiHlltPuxBCCCGEEOLRkaBdCPHQbgXrWf8VQgghhBBCPDoyPF4I8dAkSBdCCCGEEOLxkp72Z5AEUuK\\/creHz8k1KIQQQgghxKMhQbsQQgghhBBCCPGUkqBdCCGEEEIIIYR4SknQLoQQQgghhBBCPKXkQXRCCCGEEEIIIf7fuXr1BgcPniA6Ou6B1vf0dKdp07qULFnsMefs0ZKediGEEEIIIYQQ\\/+\\/s3HnwgQN2gKSkFA4ePPEYc\\/R4SE+7EEII8Rioqh1V0T77reO265xPzksZLzd0ivZJ5+aJsJnPsO38z+x3ep1xFSujf9IZEkKI50RyshGAoUP7PdD6U6cu\\/EdB\\/tPima9LCHFPqh2rTV5PJsSTYjFdISjV8sj36zBu4n\\/7fuGq\\/VHu1Upw0BL2GG3Eh\\/\\/GpjjzXdc0Rs3gjWXvsMnyjJYvaXv57o8mdF7iT4n5nZkbuYOvV7RkUnA0jv8kA1YSkgIJtz7Z82tOWMcPO15n6MENmPN3pm7aWv6ItT3GFG3Ex6xh9rE\\/CXlGLy0hhBB3kqBdPBF2UywxyY+zYnN\\/qvEsy8a8wxtvDmH6nmgef\\/1HxRi0l+XTJ\\/HVV1\\/y1YQJfDlpJquPR2L9B3txmOKJS7YBdkxxMTzh0yjEv2Dl1JGO9D97mUcaW6txRKe54OPsQoophvvfIlYO7y5L+yOXcsmHg+Dzr\\/Lq0RPY1BvsOjOVpcHnOXFpKvOunie35gZHyjKGrp+Db\\/2JtHNS\\/tWh2KIn8+qm+QQ\\/bQGapgidmq5gepOvWdT3FNPKdWFIk5bs39KLebFpjz999SqLN7RneuSTLABVrKov9ct2o7L6N5P+6sXkMBM6HsPxO+K4cPU7RqwqQ701X3PKqmB\\/qGtCJSEllFQgzRhG\\/NN2XQnxNEpew6tF6jLxzCP9phLiH5GgXTwBDqK2TmPq1vAH7JFRSTi1no1n44k5tp4tl4w5AmwVc9hxTt5Mrz47Ig+zZsMZEpPOsm7ZbkJzTcRB+LblnK00kikfVubaur8JeqxlsUrSiZ+YtiqGCn2GM2bMWMaMG8fY4T0IuPgL83dEPGDQopKwZxbf\\/nUTuyOKbdOmsC3iH\\/ZrWa+weuJs9iVKbU08aRp8XH2IMz7K3lkHYedepfnmfdQtEc7nS17ix4T73V0KLjoXLLbUXBvvdNZwTsZH4FBK8Urnw8wqV4UWzQ6wqnYNnO5YO54t+0dzpdxCJhQv+O+\\/ZJUkwqKuEv203a66YpT38uTMmSH8GG4EFDwKfsLM2gbm7l70+HuBlXzkc04g2vQkg3Y7wVeH8\\/qGSZx0fpnprwSxveNEXsjr+miTsW5l7C\\/lePnYOfwqLWdPv0PMqdeZYg9xcamWdYz9rQUTgw\\/ywx\\/VGXwh7D8aGSHEbbZT46lWuD9bHmn7lorjcV3MHu359u\\/f+aDi45n+43hsGRfPEgnaxROg4OrmgiXV9IC92w5sZiPJRjPmlAQSUiw5tnMQfWgls5btI04FNfYcO7afIdoRw\\/ntJwjNtb5uJyIshYCKJfGtVJ1SiWFEPsagXTUe47eNTrz0wQtU9ohgx\\/xJfPHFJObvTqF879cpe\\/YPjqbc5WyoyQTu2MmlFBVQcHN3JTUlBVVxxc3FjDH1H9aOdQUp6HKSnYfi\\/oPRBeLZpJIUOpY+63\\/gdMwC+q8ZwS7Tw1xNGjwM7hgtyXe\\/FtWr\\/L6pLaOvnWf33va8febCffoxNfhVmMf6DkOp4N2f6b0W87rX\\/SpaCi4GV8zW3MokBRe9M2k2U3p2Ujfz5aryNFgxkHWJdwaMjpQVLAqqRP+qtXH+V8eRkbrODWd7KncfiP8fUW\\/w+47+\\/ByVlOUcafF0ciPFnJgR+GkpWmEErePnsuyxDhEHcCePQSUlLaMRN9f8PX4qDnQu9ehR9VXquDvff4OHSkSLTutMIb8+vFymNr7\\/Im5QnDoxoedWPi5Sjw86H+D7cn5SERT3pIYvoH3BriyOybiz7IF8W9+PV9cmgZrCqQX9aVa5HOVKFqNsi2Gsup4xdtAexqZxnahSojjFixanRvdJ7Ip2ELv6Axr3XcDlmDUMbPgCU0\\/b7r0frAT9OYYuNUpTslRxytZ\\/nRmHE9Lvc\\/sZvqhRiGZ9elCzRAn6\\/BqFmnaZZe81pFj+QhSv1Jz+H3anTLVPOWnjnulYVvXCq9kIJr\\/XkirFC5C3aCM+XJfRqGXZyPC6fZh\\/zQ6oJJ+cz9uNylCsqD9FKnbgk\\/XBuY7oUhMOM7NfYyqULEWJElXo8PEfBFnTj2nnoOKUav8KHSoHUOb9jVhQidsziRcqFMTXvwy1XhzNu43z0H156mP724r\\/X6Ssfs6sXLkCo9F4x3Kj0ciqlSsfW7qq3Z6lIqWgN+iw2e5XqVNRVQAt+er2omctV2zF2vJSTZ8cF64W\\/8ZNKHphAxsvpRB1PYiEqMtcjjBh1RkwKKAmneH3r0cw7KNJ\\/HYqARUdJWuW4fysEXwy\\/ldOWdKwpOWo6tmjOfzT54wY+jFT\\/gwkPTa2ErJjFp8OG8rYmdsItqTn03RlPVNHD2H45z9yMCpn9K8Sf3AXxvodKOOcRuCqnzhb7h3GfNSY1APnSVLyUa+6nVPncxloqxq5sW81S5f\\/xemY9GqxxtmA3WRGRYdOa+Pup9FO0s1g4tYh2KkAACAASURBVHI24CpuVK5RgptnLvBP433xfLPHL2XK2eOkoODu3ZTWAXUolqc2rYo3puSDDgNXI9l56GNWJNoBBTeDG1Zbao4KTxJ7T37FtmQHKH5UDehI43wlKOPfkea+he\\/\\/kC9NYUp4WjlyfBRb0vy4fyiVHpibrbd62u0EBY7gu2sxqCjoNDocDhsOrBw\\/Noz1nmMYX\\/gEY3cuJiLHPZQato2TPu1o4qo85HHEc+jYMH6OST8jikaPTrXdYyi0g5uXR\\/Lt1ah\\/Fayqph1M27OQy3fbieJNpfxG5v7xArOjbzUhKLjoXTBlHaGga0ALvzD2BAc\\/5h5cDa4G19t\\/s1zz9++olv3M2vEDJzOKdDV1M1+trkST1SPZkmIHdFSs9RdzAw4yYstcgh5BeZoaf4zAnN9FhhaM7\\/4LjUL78fK+PSTn3Mh2isU7v+fgA7WTaPD2LII99DsmBRnJK7VAcR9Kwc70qn2UtZvTG\\/odNzfwV0hberXyxLJnLC9NSmPIlnNcvHKS2ZU2M2D0WhKA1E1j6PdnReaevs71a\\/sY7TyXN7\\/ci+eLM9mz9G1K5+vGjH1rGVpFd8\\/92E59Q4\\/3j9Hi55NcvXKF3Z95Mq\\/7AFZEZtwnahIxvv3ZGHid5a\\/l5fKMfgw+0YJlgaFcP76YjsazhGTcw\\/dKB8B6bC+xfZZz4noIx8f7sOST2enBflZJWxjx0vfw0U6u3gzm3OJG7B\\/Qn4XBOUo8NYbVH3RnlvMn\\/B14hWtnltH+7EBe+up4RoOtneikMny29xpX5nTEKXkzH78yB+fR+wkOucTfY\\/Ny7bzMfxS3SXH9nNm4YQMTvvg8W+BuNBqZ8MXnbNjw1+NJ1B7E2s\\/HsuxSGqoljjijiqJoyFrDtIfvZNaoQQyf+DvnklXUpBP8NPpd3hn0OSvOp6ACatJRlk9ZxelcYlvFpwLlC4bx14QBjNmkp1FDhb++WwdtW1FOZydo0zKuVB3B1yNrcuO3v7hiV8hTZwDfTBrCyz1aUd7dji1HrG07\\/wcr41sy9usPKHZsCX9HOlCNh1m1UU\\/3L7+ij9tWfj+YhKrGsGvZAfze+ZpP26ayes2pHD1oaVy5aKFMhTwoljPsuFiK9g3yoTGlYnJ1xw0FZ7\\/8WCNisldy1UROLPyCmQd0+BcyEZeQfsIUvRPatDRsigaNRsWhZpxIazTXrkRjUVWSLh\\/kRHAY+37+njXncvbnKbgWDcAr7AbhMiJLPDAHwddn81N4JHpA49qafpXqkUdflZ7VuuKvAdRwNh0ay1+Jt24mldgbU5hyLQgHFg4d7s13IUDK78w4dwobYNA5o3FYswft9n2sPLKRyw4AF8qWG0wHT2cKBgzk5QKeKEBa5Bw+O3WQlFspmTfy5abvOZl5TbvhbPmbORcOPkCPtoKLzpk0+61gT4On4xqLz\\/xBDKBRtKDasZPM5bhIyvh3oHXNgdSIWMvubA+asxORdBN9npLkVx7uOMAdg3krcy8cSX\\/WhaJFo9ozywZ70mqmHv+baFUl8fpo3j1xDGfHNX4+8dsDDkm3Exd9hOu3AlHTYVZf2EWk3oOUoO9YEpHRu+WI5VL4OW4\\/X9eTCpV+Zmk9V+Zt+46z9vTzZtA6YbVlHf1koIhXIcISbt59yo8awqZ9Q\\/k5JhXUBMKMKdkbHNRg1u54k5\\/jb+8hLf4Xhi0vTb3fXueXGBOg4KR1wu64deXklr\\/cJHP61Mu0+bkCL+3+k9AsCSffHEu\\/w\\/synzGi6N0xhk1haZgFMLHv0EC25p3A2AJ7+HjnMqIA8KZ+\\/V95z\\/4dXwVGPsRxZF9\\/xY4uTLwWc0cDjOLclI87TaN04HtMjcjxJah1xxg1lSU3b3+vW1JvEpV5U9m4ePoVxl2+tV8FN20sO078win5DhD3o\\/jSqVcdjq7dSoLqIHTDem627Ulzd9DXGsfuw7PoWkgLijcNW9WCa1eIsIPGyRl9\\/EX2H75CIn70+PkyF75vlGtj5d33Y+Pk8mVEdhrBe5XdAC0F2oxjSMUtLFyX0VCp+NCwU1N8dYAjlE1\\/nqH++8Oo760BQxHad2+a2Th1r\\/wC6Gv05d1G+dCix79xI0qEXSc4R1li3rWUtV6vMrSTHzoUPGsOZubc16iQI6JSEzbxy8YSDBjVloJawK0iAz7pQdKvv3DYCqClWItO1MiTvmHawTVsdO3Nh31K4ISCZ7WedK4kL\\/kSt0nQ\\/pwZ9+l4oqOjmTN7duay2bNmER0dzbhPxz\\/StNSYXfy05DhJmmK0fvd92pfSEbl1GpPWBJLtgb9qPPuWrsbY+iPeKnqUlbvCubntdwKrj2bq4FIcW\\/Qn1+ygeNWghm8g53KbfK4pSNHCblTuN5Mfp4+l\\/4BPmfHjLMZ2K53ey6aqqKqa3lBwK8hFweBTgopVqxKQJ5HY+Oy1F1VVyfxHvbWZikMFR+bPKmRZB1VFzVkJUpOITXAnr5eCPfQywflLUEQLqjEFq5sHTgooBj2qOS1bRU1NOMTGs+V4fUhvWlfwID4mfQixotejt9uwq9mrdWmX\\/mT6itOYSOX8Xz+xKyQftWvn5cKpoDsqz5q8+fFOirmzF16Iu1Ix20wocNce3ZTwKUw8sp7zmTd4NNtPTWRfihOK4ySbL+wgxO5F3eKNiQs\\/RAwACnf00asmTPearqLeYNWhcfwUEpz53lJFZyI4aC9XMgMVHeWKNMEReShbYAagpkUQla0QSg8+0zKDTwUv\\/5aUiT7AGTs4VAegoMGL5pX7ErqrKGUWvc92axxxOZ4Or6qg0+ge+jhAT8UijTFHHErvxVcdODLPkYOblyczNzIeVyWVw1cWc9bowKtoB6rE7ruzR0i9xLy\\/XmF5UtYbPZptB3vxeUaAaU9cxfd7l3JJqUKTwiZORWY8a8S2m2nrh\\/BHStZtdQRUnMjL6jwWhaQHjlpFg92R9SAVtIoGNZd+dmPIJEadPo1FVXGo6WWYOWQcL66dxImseVecMSZu5HB8xkL1Mj9tH8Zpvyl8XfQSXx1YSTyAoqBmuxrvzF9O5rDPeP+EhrfbfE+V0GFMDb7dK+\\/kCONI6Ln0fQNoytOosJbTEdewOy6wJ9SFNuU706bWCOqGL2ajMSNtTWn6VqnN7kPfcfhhjuMWx2XOJxSlZgGfO+8JQOPWlVdLGFl5egtJWT9QitG4SH5OR1zMaPwK47dNNRlyKTzzelbMgeyOuv1doM\\/fgjpphzmeIl8C4n4U8nboRb2ja9mWEMHG9Tdo26sZboDG2UHQ76Pp2aYFrdu2o\\/Pn2zGq6Xelc8tv+HNiOQ6MaUPJgqVo8tYPHLzLW7buvh87keExFCxW+HYZqXjh7+9CVFjUnaWMI46YeA\\/8\\/Nxzv4fukd87V9agqI4caaikxsZgzl+QApkRlDsVO\\/ahUeHsIZUjNoIoxZ+it1dEW7gohWLCMhsJsrLFxZJcwJ9CEpmJu5BL4zkTEBDA8OEjOHr0CHNmz2L2rFkcO3aU4cNHEBAQ8AhTchC+dyvntV64KQruhYvgrdVQoE4dPE4e5QYabKmppKlWIvYuZsXZPBQv4oGXtxsWUyqJ8Sm45\\/HApVQT6jqd50yEA9WcSJLFnhEw56TFJ28ekhNzm8+oJaBtL0qe+I6Pvj6Ef6+OlMo6J1Dji3\\/BRIKDzdm21Vfswoue2\\/hi5Ayu1ehD84IaFLc6dG9nZsUno1mS3Iqe9fOgKPlp2qseIXNH8tlGF17oVhVDjhwoSnqwryYlYnP3QAeoRiOKuxsaQE1JAQ+3bDekkqcazStdY\\/6Q95m0LYqwwCuYVBVjdAwWZxd0igatxoYp1Yo96RLrVu4l2dUF29WNbDhhwm6zoXcyYDGZ7+y1cXHHjVSMDzUPWTyftJQq2RO\\/a8MYeGQVR+PDSLCaMKXFEBq3hz+PvsEL65eT5hrG7iv7CTOFcvzMYL4NMoI9jCMnxrM0wUx8ahTxFiMqDhwq2OwWHBod2foTdE3pViKEmZs\\/ZMnN04SYkjHZUkg0XuV00AI+X9uMCXHeeEb9yfq4OCz2BK4FbeS09TQHw2KxA3ZbOGciL2HSuuS4H+1cPNGJznt3ZpsnbtA5YYvawi6jFUgjNvYiURoXnBXQ6VzQGK9x3ZKGl\\/+nLOy6iA+K+OHk2YBa7lnvWi0FPP0wJV0n8SGOIw2wW8M4HRmIReeCXgFF64KTLYTryZHcDPme0ccOoaopBN38iv8FRpJiiiLBnIg5o0ExK1vUz\\/wanZeiblnzWJD25ety8OAIVsVFcjX8KGGmfewIu8DlpFSc9c7plV1DIxr7nuVgRCqOpHX8eHYz55NjiEmOwIiJFGt6f7RdtaMoWavHaQQnhlPQs0iOCkYsm05O5yre6DVF6NBoBv3yu+Fc+BXa235g2J41BKVZMKfFcCP0FzZGx3M69BDxadfZvv8NvousyWvVO9CwWD28bUYsqFjtaelTF+6Rv0zqTVZuqkytP2YS7V4UD31lGhVwcDzkNEm2ZOKTDrPq0l7iY\\/dy2JiG3WEhOeUIR+OMuBncUBQDBk0iN+KCSdVVopJnIGfjzNhVGzZbMIdCL2BOmMPwHUu5ZDJieuDjyHr5VKNZ4VAW7vyUlaEXiU6zYHPYsDmsmM3XOX75S6ZdTcF8fRgfntpPmNWGigOL6RzHYuNw0mX87ShAw6Il2HdkDOuSUkg1HmVz8GVuhO\\/hhh1QjUREHeGawxkn7b97u4F4Pije7ehR7xhrlq9gXVBbejZ2AVQifnmb7st8GbNyO1s3b2Ld561wz9gmNToOnw4TWHngGhGX1\\/C6eQa9Rq7PMqrolnvtR0uhwr7EhEXe7nxQEwgOSaVg4QJ3BjGafBTIayQyMrd54PfO7wOeCVzz++IaF01MZjRvJfbqOYKTsxfA2nx+FCSCsNjby+0hNwj39adQLs+l0OUvgFdMBFHSjibuQsZdPIcqVKzIgPfeZ87sWQAMeO99KlSs+IhTsXIzKI7iTYqQtWxSfPwpaLpEUvnWNPp7JgP6puBaqimd+lYicOEYJqSVoseI4pS3v8CeWeMYsNyI2ZSGbXhfVjr7UKLxqwwsndtTeBScXZ2wpOT+cDvFqxq9x1Sjd655NVC2Sgl+OX0ec6My7P96HDe7TOHNigWo\\/9bn1M+xbpGWg\\/iqZfa0Xct0Yfi3XXI\\/FUoeCuRN4GqEHcXDE11iPGbVStTps0SnVUfFzJXj0fg1yJe9ZVjjS\\/23JlD\\/LUCN5eCcCQzqNx08ytF1UFWccaJyq8ZsmTOAt5L0FGncnOpXFjJysj+N2jciaOlgRjiVocugsnfe6IoBgzYNy3\\/wZibx7NDlHcGSrt5MPvo\\/Bp88z83UJKyKC17upalcuAsDXjhOZ8MWxm5+mXpHosC1Ff3rvsKuw815w70T\\/Rv2ZtOeMjTQ1qJf654UUlRiranodG45rtG8tGuxHeX4l8zf04Uv4sNItDnQGXwpmrcuTcvMZXPlmoSeeIsRywsxzKbg6tGQjpVqcuCvwhS1WrChx9O7PcPavIpfthsrlmPhwdSsXC\\/7XHeNHq1xOf1\\/XIjJoeLsVoe+zX+jrga0xYYx5HwfOswdjwVXfDzLUc3\\/NWZ3HUatHMWRu19LKu3awM7Ud+jh+qDH0Y+hy3wZaLWjosfTpxPD2\\/alAKC4vcSgyr8x6NcijKY4HWt+QvPLw+iyuSwv1B1PwPlXqbHMh0Z1ltIyW+uESlzUMaILDqBajjy6elegsGkGX6woQYquDj2qVWb7+gbEeA9kbsn8GeWQF8XyuBOcEEaqZyinLv3A5J2XSdQGUKf8TL4v7g5YMaYZcfZwvV122fazNcSb+lUDspX9OM5wJKoYTRrmePCZpgIVfRwsuz6MFmd7k6rq8fasSuOyH1DqSnsqn9QTUGwIX7Vy5eDO7uyw2elYYwwFUDlhTcVZ70aa+W75y57+7pt56P\\/CHkqFL2H51qacdARQ0NiUckds6J2LUb5wJ\\/oX3cWwBU70UzXodPkpU3w0U8oXQaOo9K3Xjbe2V6TkJhN2QFnjxWJHGihu+BXqx8w+Mwg5OpCO814hGRd88lR7gOPIyof2LbdiPzKe2VsbMzwpFrMDUPS4OvtTqmArurU+xhyX7Xyz5w2a7LpGssMBGneK+A9lSuUKGedcS9G85XAxb+Kjn71J0uSnYsDLdEv5ksYzhmNTweBUjtb1FvOSmwTt4gEoXrTtUZeRAybi3HcFDZ0BHCRGRGI2uONmULAlXmTtmkMYHaVxYCdk8cs02tSdXX8Oo7x3CaqV9sFx1ZY+YtDJBSdLAglmwHCv\\/eio0rM3+TpMZMbbtfiwqiuxu75l9sUOfNIlPwqR2fOp8aN9t2pMmDmNw50+pY5bBNvW7iHW0f0++X1wzo170DH6I2Zse4sf2vqSFvgjb7RdSdvtWxjoFMm5C2kUr1oU1zxteaX9aMZN+Iuu0zvhZwvkp+\\/X4vPaWuroYV+O\\/RrqdqNj6jtMXtmfRb2LknZ2NRvO2f5ho4J4lknQ\\/pxq2rQprq4uANSuXecxpKCg04E1zQZZZjCppgSStB54elWm1\\/g59MqyRcfWWX9ryQeTWqIajzHvs\\/1U+2wQdd3unZ5Wp8V+34fb5b6tR61O9HDNh0FNIjElDz7ej7IiY6BsLV\\/+2H2JTi83p5Uyg8k\\/nKNcrW4027eK\\/012xaN0V94odo9HAit5qffeVOq9l32xe+U+jJ\\/ZJ8uS127\\/2Pude+RJg1Zrxy6vHBX\\/iAbvgu8wodM7TLjrOn34rlcfvsuyZGzdeZk\\/f1hrbra181XaxIVKuexGV5K2dRbR9h7FU5Haa9lbO8fC5ndfHwDVgsWux5Cth1El1ZKEUnQmZzq\\/jEfObfS1eb\\/LFd6\\/z64BNB69eM1\\/ItNOHqNLg1o4PdBx\\/MHBnMeRKS+NG\\/zNyQZZFtX\\/\\/PbPtcbddb86jQ7s1jueamwzhpHgNYjf+4yl3K3T0CTHSo5ADkeYKVHHD3ffAfzw0oBcUtDTsPk1NmT+bufm+W\\/Y4P4Wf\\/jmqF6ojszRFdmXxxBjcqV5k\\/PMLpXjVWlNJmf7tWfZ7B+3bxdDewDulr+sXHDWpeFwqkGHGrXpUGPqXdf8tE1uSxUKlZjKhhJTUS3rGLJsDnV6rOeVnEFv+1MMaJ9j0\\/scRza6snSq\\/xud6t9jHd7k6xff5Ou7fm4jKOYSziUXcKh1hyyNUzOYcq\\/dCnEPnq170lh7mPw962W86lJLmbe\\/4cO9A2hceBKuhWvRvUNF8kWFEm7T0mrgQqYFD6JnlZmYVRXnUi8yb16X9PK11Au82XAu75VrwMU1uxh31\\/1AxSojWf5DAgNersx0k4KhQBOGrJzNi\\/kV7nxwhoYS787nh8A36FV2Pjrf0jSqlh93gwGdcq\\/8QqkHPhHt+X75VQYPbULZQQ607uXpNesn3iuhwbp\\/Mt17RjDpwmJe8MhLt+nLCR40hCalhuDQulGu5w+sGFUVPdY79+vWkq9+\\/YC3+9en2ChP\\/Ks2xr+AHr1eBkXfj4eHG8nJRqZOXfjA2+TL5\\/MYc\\/R4KA5H9q9QVb33cNn0qby5r3Nrzu+dy++c85dzvazr5JZGts+zbO\\/q+ojfh\\/oMUFWVhIQE3NzvqHr+l7kg6dB0xqzQ033gKzQKcCMt6iI7lyxgV8EBfNGnzB1DyHNKizrO2rmLCawxnFEdi\\/wnLUxqzDZmr3Sh97sN8XmUcbsjmr0zp3O8XD\\/ebhWA6zPQuWFMSUav16PRaNBoNGi12syfgRxDZoV4nFSSwr5g8Gk\\/xrR+h1wH42SycmJfNXqHdmNBx09p7KYhPnoJn238kKDKh1hdvRSW6BmMv+DL4EY9KfIQ9SV7whz6rphD2XZ\\/83mR3Ocn57IVQed6MyisN9+V2c8np4ryVcchlP8Xr\\/dyJM2lz\\/K5lGyxgrElS+KKjYTY1XyzeRAnS29nXe1KuZerahS793ZkUNQrrOg2hDIPeA7MMd\\/Td81v1Om8m1EFc343J7Jta1VGWceyuGU\\/KjhpUG032XfqAwad8GTCy7\\/SUbOXqXu3UbNOH8KPz0VT9Wt6eDk9\\/AnIynGQz38dgFO7o4zK0aBgTQ0m3rkIeS2hxBkKk19zg5Wb+rA9YCKNro3lYJnlTCtdGA3gMB9kzua+LPf5iQ2Nm5BbW7Jq2fP4jiNbQhFs3N6D3wvOYGDqx0yyj+On+g2wh3\\/Oy+u30qbbDgbnM4DjGiu3f8j5sgsYVzTfA16PQvz\\/lHZzF5tDStO2gR8Geww7RrTkHesUzsxogcuTzty9qAmc3HgQp0ZtKe+pYAqcQ882q2i3czMfBEjgfi9Xr97gwIETxMTc5aEJOXh4uNGsWT1Kliz2mHP2zxmNqWSvPiuZv0tPu3hMFDzrvMXQhMUs\\/t8QFiWpuOQtRpVmbzKy430CdnsQm6fOZO1lLVVeGsyHrf6bgB1AydeK9+\\/XYfMwNPlp9N4Q8mxZy7z\\/JaLRa1A0OlzKtOPVtqV4DNU5IZ4jCm6eNahTyJt89w1y9VSvs5Qx21\\/n7UWTsWlULJriNK2yiJlVS6EFtFo33HROPOx0X63Xu8xqc5k+24exuc9PtHug1+Fp8Svcl95utSiR34cXy3hR9F8E7AAaz7eZ1iac4TtrUm6TBhfFhElXgXbVl7CwZu4Buy1pHd9sG8xv1j7M6jLogQN27EeYvGU+vo03MvyOgB0gDy2b\\/M6AHe\\/y0vyh2HQ6LFYo5PcKI7tOpKOLAmlOuOic0Wl06DU61EfZ8Ke44qqzYMz57jw1kPnr67OhxFK63XyF\\/2PvvuOjKB43jn\\/27tJD6D303qQjKEVQEVAUVMT6U8HeUQREsCFgQQULgih+QVEEkSJNeu81Cb0FCOk9ubQr+\\/sjgEkIRUgg4vP2BcLdZnd22Z2bZ2Z277fAlSxsU5+2DZ6lZOk21PJ8kvLlykPKEsZvH89vBzbgVfdbfro5\\/8Ceva1C3I9c2ylL8zpP4AqoS52sh+mdVZLgnY8yaFsIbbvM58Uypz9pLeWoW\\/EmPAICFNjlumeYdnZ82YfB\\/xdFpstCuQ6v8OtXnYt2YAfAwHVqHq91eoXDyQ5Mvwb0Gfc9zyqwX1StWtWKZAAvaBppvw4VjZH2K2DaiTyeiG\\/lygRc9AuZ5VrRSLv827mc8SQ4bAT4BFx05s8\\/Z2LPSMTDu2QhrPufcpKWEUuq6UdJn2IX\\/J57d8offH3Qn3ubdSXwH3UamCRnJOHnXYKL\\/ZjbmUhcZhaeXmUobrtKDVLzCONn3s6Jdgf4qEruI5BlP0acdw3KZBwhyqsWgfn0ZriT5zJ+fzT1a91H59KlLrqP14RrB5NWz6BMs2H0KpX\\/07NFRKToutBIu0L7dehfH9rlX0GhXURERESkYFwotGvOhYiIiIiIiEgRpdAuIiIiIiIiUkQptIuIiIiIiIgUUQrtIiIiIiIiIkWUQruIiIiIiIhIEaXQLiIiIiIiIlJEKbSLiIiIiIiIFFEK7SIiIiIiIiJFlEK7iIiIiIiISBGl0C4iIiIiIiJSRCm0i4iIiIiIiBRRCu0iIiIiIiIiRZTtWhdACp5hGADYU1OucUnkenfmXDvz\\/7yvi4iIiIjIlVFov06VKFECt9ud65dpmmd\\/iVwpwzDO\\/hIRERERkcKh0H4dyxmqcgYrhSwpKHnPMZ1bIiIiIiIFS6H9OncmSFkslrMj7Bppl4KQc2q8AruIiIiISOFQaL+OnQlRZwK7wroUBo20i4iIiIgUHoX265RhGJimmWs0VKFdCkPeh9EpuIuIiIiIFByF9utYfsFdpDDpHBMRERERKVgK7de5vCFKo+1SkBTSRUREREQKl0L7f4xCloiIiIiIyL+H5VoXQERERERERETyp9AuIiIiIiIiUkRpevxF2NMzr3URRERERERE5Bry8\\/G6ZtvWSLuIiIiIiIhIEaXQLiIiIiIiIlJEKbSLiIiIiIiIFFEK7SIiIiIiIiJFlEK7iIiIiIiISBGl0C4iIiIiIiJSRCm0i4iIiIiIiBRRCu0iIiIiIiIiRZRCu4iIiIiIiEgRZbvWBZCCl5WRdq2LIP8hnt4+gHGtiyEiIiIicl1SaL9Oefn4XesiyH9AZrodTDj92+nsrgAvIiIiIlJQND1eRK6Iefq\\/03\\/hbIAXEREREZErptAuIlfGNMHMG9xFRERERKQgKLSLyJUxTSBPcBcRERERkQKh0C4iV8TEzGd0XeFdRERERKQgKLSLSMFRVhcRERERKVAK7SJyZczTo+1K7CIiIiIiBU6hXURERERERKSIUmgXERERERERKaIU2kVERERERESKKNu1LoCIiIiIiIjIPxUaepId24KJi0u4pOWLFfOj7U0tqV69SiGXrGBppF1ERERERET+dTau33bJgR0gJcXOjm3BhViiwqGRdhERkUJgmi5Mw3r99447Q9lvL0XtAD9shvVal+aacGWEsOLgz2z2fJQh9RurcSUicpWkpqYB8Npr\\/S5p+bFjJ\\/+jkF9UXPdtCRERKboyM45wPD2zwNfrTlvCV5t\\/4ZirINfqIOzEr2xIc5IYNYOliRnnXTIt9luem\\/08S7Ou069CdGxg7KJb6fN7TRr\\/dC+TY1bz+bxufHYqFvfVKQBJKYeIdF7b45uRtIBv1\\/dn0PbFZJa+k1aOecxPcBbiFp0kxs\\/l\",\"created_at\":\"2021-09-28 19:56:18\"}]', '/admin/setting/3', '2021-12-14 11:40:09');
INSERT INTO `activity_log` (`id`, `user_id`, `ip`, `type`, `target_table`, `row_id`, `where_condition`, `detailed_data`, `uri`, `created_at`) VALUES
(53, 77, '::1', 'update', 'settings', 0, '{\"id\":{\"path\":\"admin\\/setting\\/4\",\"_method\":\"patch\",\"key\":\"درباره یوزدکالا\",\"slug\":\"درباره یوزدکالا\",\"value\":\"<p>لورم ایپسوم<\\/p>\\r\\n\",\"id\":\"4\"}}', '{\"old\":[{\"id\":\"4\",\"slug\":\"agsdf\",\"key\":\"agsfdgdf\",\"value\":\"<p><img src=\\\"data:image\\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAiQAAAF\\/CAYAAAB5UtLZAAAABHNCSVQICAgIfAhkiAAAABl0RVh0U29mdHdhcmUAZ25vbWUtc2NyZWVuc2hvdO8Dvz4AAAAvdEVYdENyZWF0aW9uIFRpbWUAVHVlIDE0IFNlcCAyMDIxIDA3OjQzOjE0IFBNICswNDMwrKFfGAAAIABJREFUeJzs3XeAVOW9+P\\/3OdPr9ga7NCkqqIiCYsMSYye2aBI1FmJy00xubnLNTW7yzb3JLzflxpgYk9s0Row1JtbYC6hYAQUU6Wxhe5udPnPOeX5\\/zAAL7MLssuzMLp\\/XX+zOmTPPnB3m+ZzP83meR1NXT1MIIYQQQuSRnu8GCCGEEEJIQCKEEEKIvJOARAghhBB5Z893A8ShEe3sYsErIT5SNi5dUMujU2x5iT5TvT0sfKGHVZbOmcdP5MWZDmx5aEeuIuEYd2+N8ExHio+jBu0pRcKCRfPqeHGGXSJ4IYQ4RCQgGY+sJP+5qo\\/1FnjKivjJ5FyDEUV3JMW73Une6UrwdleSd3rTdJqgAGd5GevPLmKalntTnMVF\\/HRqmIu2GCz\\/sIt7a6u50Tu8t3WohTq6OWt5L6uNvR8ZwhsWQggxLBKQjEMN27r5dY9CaTauPjrI0bn0pyrNb17Zwbc6LKwRbY3OuUcWcdr2LpalYvzowxhXzPcSHNHXGAEqzd1rQryfDUaKiv18\\/QgvCwJ2SmxQ7M9PhkkIIQ4XEpCMN0ac\\/1gfJwQ4i4P8U42e8\\/191FB7BCOaplPpVHQk1UEFKbo\\/wHcm9fLaNpPG+h7unOnhX4oKK+ugkgme61EoQLN7+MXplXyxQDM5QggxHslN3zjTsL2X+6IAGmceEcgtO5Ll8zg4Y2KA7xxbwaNn1dJ4+WTem+0egahV59wjAszUQJlJ7twYJ3zQ5xxZRjTFlmzUZS\\/ycKYnv+0RQojDjWRIxhMryf9sShABNIeXm+qGUISpOfjG6bV8Y69fN41Q05ylAa4rDvH9HkVzQx8PzvFycwF1+iqtiGT\\/rTttlBVWAkcIIca9YQQkisbuGM+0JljemWRtX5qGpEXEBLfDRm3AyclVXj43NcAn\\/FqOwwUmdy9vYEmLAs3OV86s485KDTOZ5KFNfdyzI86qiEnIgoDLztFlXhbX+blpkovygU5nxfj8Y60sTQM2H49cXsWVOvT1RfnDxjCPtiX5OGYR1zTKvQ5OqPRy5ZQg15bb9rkgfZEEz7XEebUzwareNJvjJiEDbDadKp+D48s9XDYlwNXldlyDvLsdW1qY9V6cKOCvqWDTGQGqD3RFwiFOf7aLNy3QXX7+clEllzn2\\/5xEZ4Q\\/hzML7xZV+znPeYAXGU2ag8vrnPyoJ0naiPOnhjRLZjkKJ0WnFDtrWTWNgp4JJIQQ49HQAhKV5vfLd3BLq4U5wMORlMHHXQYfd8X408e9nD+nknuPcg8cNBxAqKuXq97o4YV4Zlx\\/p554mjeaQqxoMzmqtpJLcunRlOLDre0sXhVl6x4NV7SGkzwdTvJizM7FZwT6tVWx6sNmzliXJDrAKdOGSX3IpD6U4LEtIX46qZQH5gc5foArOqEuwPlr4jyagmh7hL9EA3zNt\\/8mr2+I8F52CGFCbYDzDhCMgOKNxiiNCkDjjAluig70lFE2vcbLUWuTrFGKdxqibJ5ZzEzJRAghhGAYGZLepMIkU\\/A4ucTFySVOZnhtBHWIJg3WdsZ4tssgahk8s6aVS1QNLx\\/tYijZeSsWYckH3TyfyLxObZGT2T4bXmXR2Jfkg4jFPjMz96O7tYtPrYyy1QLdZuOoEifT3DoYBht7UmxMDrydTyxlkgBAozTgYmGpk9l+G2V2DdMw2dKT4O9tSVpMiw0NnZyXhtdPD+7TyWpOLzdMtPG3bSaWmeC+xjRfPnI\\/63GoJA80pEgDaA4+M9XNAesrrSTPtBqZQFF3cVaFreAmq9qDbs7wwJoYGL0xnosXM1MKR4UQQjCMgMTrc\\/MPk4PcPNnLPPdAXZ6ivqmLi97q40PT4u313dw9uYavHiAjsJvFsvXdbExozKor5c65Qc7x9n8dRXtPlNvWpwYdItnzdCl++4HBVuxcMKec22d5mdn\\/XSuLD3eE+EnHvsNLusPBhbOK+eo0H2cHbQyUpIj2hblpeSePRBUdrT38oMnHg3V7BwM6n5jiZ\\/L2ENuUYmV9hA9nlXDsIBFDsivCg9mhF3uRn+tKDxxamNEEr8Uy\\/7Z5XJxYQPUZu+guFpRoaDGFslIs67T4+qSCGbTpl4krtFBOCCHGv6H1BpqDb55awx9m+QYJRgA0JteW8svJmYJKZSR4rNUk5y2FlcX6Poup06p4dWHRXsFI5vyVJX5+dkopn8xpuCbNhxGdy06s4fHZewUjAJrO7NoSHjjeT9ler3PKnBqemBvkvEGCEQBfMMAdc7LraiiT55oSAw7xuCv8fC6YeS9GKMKfuwe7IorXtkepzw69nDTFz5wc+sdoT5L12SEeR9DJUYXTz\\/ejMbtoZ2bIYnV3NgtUAEzDIp79k2i6RiGV3wghxOHgEHVbOqdWurIZDMXmvvSQhlh0t49fHOeleoRuVANVpdw+xTFoUHGwyivcHJu9krFwOlvHsRfNxXVTnJmOTqV5qD6RHQ7aixHnvh2ZoRfN7ubzk3Ir\\/GyIGLvOV+qzExj62xgFGnU++66hquZwetfMlnzb0pfeFRyVe\\/RD9lkRQggxsIOe9htNGNTHTXoMhaF2F6CmYwonEAd6UkNb\\/bN6YoALRuwWVecTU3zUjkBwk06b1McMOtOKlAXWzndrmLuKfK20SY9iwKz\\/jEkBzliX5EUTGhsjvHyshwv3+gv0tIR5Mpn5d1F1gCtyGnpRNEez9SNoVLltBTtLpMhtwwckATNu0KygJN8jJEaCu+p3BiQ688tdMh9eCCFG2bC+d3dOn32gOc66uBpwxk1\\/KTPnARtAY26ZM7f6kFzoDk4uzX210r2ZySQPburj7sYYK8ImiQO9FUuRHKwpXh831HTzUpOFlYyxtMXigrr+bTN5sj6eDWhsLJ7i3WsYaXARY1d4hNee63Tr0afZNbwadCuwDJWXDIkyDFb1GkRNi6a+BI9t7ePRbM2Ot6SIf544\\/M+LEEKI4RliQGKxelM7l70fo34IKQ8FuWdINJ0a9wh2CJqdie7hPbWro4crV\\/SyLKFyroFRiv0ca+OSKT4qdoRpVyZ\\/r4\\/SWRegIvuoFY9yX2smsLB5fdxQnfuImtHvRW1aAXenmrb7Q2cp0oNkkw4lozfE1S+H2NLvmtmdTi6ZWsQPjw4wr1DTS0IIMY4NKSDpau7i0tUxGhTZYtAg35jiY1GJg1qXjrdf\\/5lq6WDia2E6h5IcAUDDNcIdwnDOZ8XC3PhGD68mM22qKPVzyww\\/F5Y7me7R8du03bUd6QiLH2\\/nyQOlioBgtZ9Pe8PcGYVwa4S\\/xgJ8KTv1tb4xwmtm5vVmTApw2hDa7bFp7AyFEmbuAdRoU6baVeui2TLZkkJgpg3W9KbYkFDMcxZIo4QQ4jCSe0Ci0tyzPpIp2NR0zjp2Ak8d6Rx0fQyj36yFsUfx3uZensmOvdTUlvP6wgDTBklYKMMilut7tbm5YZKD\\/16fxjATLG1Mc\\/MsB7pK81B9kiSg6U6umewaUmFlucuGTmbBut6UVbABSTpt0pdtnO6y5TwkNZIc5WVsvqoM07RoDMV5ZEM3\\/9aQZltbiOuWWfjPq+ASmWYjhBCjKucxAZVOsiy7G6ru8vGdGYMHIwDbwgapg29ffiiD1zqMzMwgzcH1R\\/kHDUYAjEiazTlHABrHTwkwVwdQvFMfYb3KTAW+P3t9XWV+rgkOpcH9Z68oWmNGwUyn3VtrzNw148rrdVCVx2SEzaYzpdTHd06u5odlmbobMxbhd41DmKYuhBBiROQekKRMdi6dobvtTNzfM1WavzenhjTVt7BYdO6MpjQ7dZ799ZqKlc0xdgyhB7MF\\/NxQnukA072ZQOS9bGACOmdP9TNliB11VbGTmuxz4pE02wuyR1Vs2jUFXOPoEkdhrPehObiibmdGSrGmp3DWRxFCiMPFEDaD1SnKdnhmLM2G\\/UQbbU09\\/Ka7cOsYDkyneOdglkrzUXjwd2JEwvxo69DWWUGz8+mp3sxaISrNg1t7uasxcw7d6eH6iUNf9t1R7OKEbM2JEU6yLod6llGnDN7vzU4B12zMLx3CbsSHWK3Pvis46k2aYziYFkKIsSn3gMTp4pRg5q5epaL8+9o4bfv004ptTV1c9G5kSBmDgqPZOaU8u5aHMli6tpc3B7hlDofCLFnexfPDGJuqnOhncXZu87atvdwT3fn7ABcOJ23g8HBeNuuijCTLB10JNn9UMsHyUKZdusvDeTksiT9aNJvGrsWHLcbucKMQQoxRuRe1ak6WHOnld29FaVWKdZtamdPh4coJbma6NOLJNKvbYjzdZZDQbCye7OT1hjgF2C\\/mQOOU6cUs2tbJy2no6+zhrGdiLK7zcqJPRzdMNnbHeKIlRZulMX2Sn+qmCK8PZfU3h5fr6+w8sNnAVCpbr2Lniske\\/MNqs43zJ7hxt8aJK5OX21IYlUNb4KujpYevb91zqC0e3f2zEQ7z1RUJ+m9L5CgO8l+zPTntLNzXEeetbOamvNo3pFlEo2tMfmiFEGJMG9K03+pJFTwctrjqwzitStHZG+O\\/emN7HKPpdi44toq7gn0c1TCibR1VtkCQpSenufTtEO+lIBlP8sjGJI\\/scZTGzMnlPD5X49YdQ13iS2PRFD\\/Tt\\/SyIdv\\/2f1+rq0Yftagrs7P2WviPG0oNu6IsXaOi+OHcLpoOM7fmhKDZgesZIpnm\\/Z81GV4uJ1cAhKLl5pihCATeE3xFOjy9kIIIfJhiEP4OqfPrub9T1Twr1M8zPXZ8Otg13WqAy4uOqKUh86t5clZLoY0SaRATZhQxmvn1fD7WT4WFdkptWvYNI1ij4PTaov41em1rDw5wJHDvNN3lPq5tnhnxKBx1CQ\\/Jx5EUYXm9vGlWhs6YPRFeLCA0lMqGeP+1kz9iCMY4OaDCLyEEEKMP5q6elrh9FqHGyvBN\\/7ezG+joOkufnb+RP75INMGRm8PJ77QwwcWTJhWzYb53mEOAY2s+k0tHL0qTgydC+fX8uS0wiloBUi1dTJlWR8tClw1FTSdEaA8340SQojDSCH1CYedcGuYR7IjXp6KAJ8dgcjBXhzk+9ksSUtDiPtjB3zKoWcl+f3mBDHAHgzy\\/cmFFYwA6A591xCSlTTpkjBdCCFGVaH1C4cPZfDApiit2bVHzp86MjsSg43LZxez0A7KSHDbpsSupdrzpb2xl7vCCjQbl88uYmEBFrPafA6mZ\\/83GKE4L8fz2x4hhDjcSECSJ23NPfy0bedGen7+YRhrjwzGFgxy20wnLhQbN\\/dwVz621N3JTPCLj2J0KyiuKuE\\/6kbufY4kzenhguxqrcqM893lbXx3Y5hHm+O82BZnVc57AwghhBgOqSEZJWY0zl3NaVLKoi0UZ2l9nHoTQGfR8RN5aaaDEU0cGEn+vDHGJguqK4N8sdKWl+gzHY5ye0OKKDrzJgdZ7C\\/EcCQj0tXDOa\\/28M4+q6JpnDWvjhdnFN5QkxBCjBcSkIyS5I52Kl6PEN7jtxqT6sp56eTAruECkV\\/RSJx7toR5uiPFR1GD9pRFwtI4UwISIYQ4pCQgGSX9AxKbrjOhyM3iqcV8f7p71x40QgghxOFKAhIhhBBC5J1koIUQQgiRdxKQCCGEECLvJCARQgghRN5JQCKEEEKIvJOARAghhBB5JwGJEEIIIfJOAhIhhBBC5J093w04lGINbZS9GR1gc7l8LgVucvfyBpa0DLD8i+7hfy+p4QvuUW+UEEIIkVfjOiAZOYrG9jC\\/2xLlmc4kWxKKtKZR7XdySo2fm6cHOMcny60KIYQQw3XYBCRlE8v4y5GuXW+42J\\/jZnNWmodXtfGFrSnCeyQ1FI2hBA+FEjy8uY\\/Pn1DFf01xcODkhs7Fc2t47eid50\\/xu7c6eUi2uxdCCHEYO2wCEqfbySnlbpxDepbJs6tbuW5LmhQAGtWlXi4qt+M3DN5qifFOXKGMFPe+24LmmMjdE23sP1eiURl0U7nzRwv+KpU8QgghDnOHTUAyHOG2Hr6SDUY0zcZFx9fwwAwn\\/p0HmCn+761WvtxkYFgGS1d1c0VFBRcPLeoRQgghDntybz4YZfDn9WG2Z4dpJkwu54\\/9gxEAm5MlCyq4yZf50YxF+Pm2NNZot1UIIYQY4yQgGYQVi\\/JAh0IBaE6un+mlfIDjNIeHb0xzZYeCFG83RNk0hvZPjrd0c\\/G7vTzQZQwwG0kIIYQYHRKQDKKnI8572VSHzefhoqLBK0NmTvAyK\\/uw0Rvn1THUs6t0mpe2dvO5FxupfbaVWzZGWZMcQxGVEEKIcUECkgEpPuxJkcz+5Clxc8x+rpQ94OKEbN2IUilWhsZOh65pOz8Eiq5QjDtWtzH3yQYWrOjmv1vTjKG3IoQQYgyTotYBKbZFzF21IDU+e7\\/pvIqOSJqQw8F0VzYtotuZ5tEgqUBZbI1aKA4022Z4rFgf5zzdyasHUajiKCtl3TnFzNTAU1fJ+nOi3LctzNKmBBtSCmWavNvYy7uNvfyTz82VUwMsmeLnNJ92SN6TEEIIIRmSgSiT1gSZ+hE0Kt02bAAqzT0rGpn0dBMzn2zi09vSpAE0GzX9FiDpiJuYeWj28GhMKvfzvfk1fLS4jjcXlvLlGidl2U9GNJrgT+s6WPR0PUct6+QXjUlapWpXCCHECJMMyYAswsbunzz2TGYg3dXHT5qyxZ9mmr+uDfHa5HLO1jW8tp1HKyKGxaEa6dDsDs6q81N1EC9g9zsJDnRum52TJhVz0qRifp1I8lR9hHu3R3i21ySlLDa09nFrax8\\/cDu5cHKAJVMDnF+ky4dICCHEQZO+ZBDpfh2+M5st0Gw6nn7H6HYdvwag4dRBI5NVMQ5hBkFzevjhyZ4DH3iQXG4XV8xyccWsUtp7Yzy4PcK99TFWJRSpRIrHNnTx2IZuast8fOWYMm6tynHlWyGEEGIA0ocMwtGvWCKVDTDsJUF+O9vLDKdOadDLj04sYr4GoEhZ7MqK2MfVVdWoLPZxy9wq3ls8ibVnlPPPdS5qdABFU1eEu1vTY2iISgghRCGSDMmAdAL9rkzCyKxHomHjrNnVbJy99\\/GK2K4eWcNv18dl8Wc6ZbItYrA9ZtIrdSRCCCFGkAQkA9FsVO0qUlW0JUxM7IOnk5RJS7+1Ryo82SLYQ0AlY\\/zgvTDrDqaGJODnjmN91OQSNVkmK5sztSQPtSRp6xeI6HY7p9UG+Mpkp3yQhBBCHBTpRwakMdVnw4aBCbREDZK4cAx2uGWwLZ6NEDSdab5DlyFRpsEbzdGDnPbr4qdAzeCvQmNnlD9vj7C0Mc76lOpXpKtRU+rl89OC3DTJw8xBL4oQQgiROwlIBqQxu8SJC4MYEO9JsNbysXCQFIkRTrIylX2m5mTeflZ1LWThSJy\\/1kdYWh\\/l1bC1R12Iw+Xk\\/MkBlkz1c2GxbfDgTAghhBgGCUgGUVrpYZ4e43ULzGicp0OKhSUDBxqbWmJ8nE0h2Is9nOke8LARoXuDvPLpgSbtDo9Kp3mhIcy92yM81mUQ7TcUpGk60yt93DgtyPUTXUw4VONQQgghDnsSkAxC9\\/r4bEU3b7QplEpxz8YY3zzJt88Geyod5zdbkmQSJBrzJ\\/mYMYYSJPGWbj71XnSPjfW8XjeXTQnwhWk+Fh3C4SchhBBiJwlIBqPZufbIAL9s72O7gub6Lm4qdXD\\/DCf+nceYKe5+t4O7opkfbR4\\/\\/zzVccgKWg8lTbdx\\/AQ\\/N00L8rlqB4Mkg4QQQohDQgKS\\/QhWl\\/C7aXEu35ImpQyeXLWDmdu9XFxux2cYvNUS4+14dkqwZudz80q5xJnvVg+NzePmy8f5uXaKl3luiUKEEELkhwQk+2XjonnV3GO18cVtKSIoWrqj\\/G\\/3nkdpdgfXzKvmf2rH3mqlrooibqvIdyuEEEIc7iQgORDdwWcXTOSUyWF+tyXCs10ptsQtUrpOtc\\/JwhofN08P8km\\/ZBeEEEKI4ZKAJCcak6uC\\/LIqyC\\/z3RQhhBBiHBprIwxCCCGEGIcOmwxJKpFiRae26w0X+13MyUsRp6K9L8nG7EJqWCmaZV8YIYQQh7nDJiDp2tHFWTt2\\/qRx1rw6Xpyxn\\/1pDhmLp95vYUnLQWxGI4QQQowzMmQjhBBCiLzT1NXT5FZdCCGEEHklGRIhhBBC5J0EJEIIIYTIOwlIhBBCCJF3EpAIIYQQIu8kIBFCCCFE3klAIoQQQoi8k4BECCGEEHknAYkQQggh8k4CEiGEEELk3WGzl40Yv1Qqxk3PtXJPDCZNq2bNfC9FeWhHqreHhS\\/0sMrSOfP4ibw404EtD+3IlZVK8detYf7SmuCDsEFz0iJqKhx1VXSf4sOT7wYKIQ4r4zQgUdS3h7lzS5Tnu1JsTVikNJ0Kt40pRS5Oq\\/Dymak+jnPmu53i4Fm8sq6L+2KgO7z8cHZuwUg8nuSF5hjPtCV4rzfF1rhFnwluh41JAScnV\\/u4Zqqfs3257wjtLC7ip1PDXLTFYPmHXdxbW82N3uG\\/s0NJJWJ88aU27o4o9t47wpGXFgkhDnfjby8bZfDXVa3cuCVF32DvTHPwrbNr+VV57p2NKEzpUC+nvtDNu6bGrCNreP84N+79HK9SCX7+Tif\\/2ZKiy9r\\/uTXdziePquDu2R4m5PhRsSIhzn62i2VmJluzdr6XYM7vZrQo3lvTxML1aQzA5nZx\\/Ywg55fYqXRoOJwOFgZtyP8OIcRoGncZki2bO7hxc4o+QNN0jq7x86lyBxW6IpRIs6Yzzgvd+W6lGBkmj6wLsdIEze7mH2fsPxgBsFJJHt8jGNEo8jmY7bdTZoNIPMXqkEGvBcoyeO7DVs6KV7HsRC\\/VOfTQuj\\/Adyb18to2k8b6Hu6c6eFfigqsa1cGL7QZGACajc+cUMP\\/1eoSgAgh8mp8BSQqxf3bEvQBaHY+c\\/IE7p1k3+dNhsMJNtnl63esM0J9\\/GeziQVUTAxy9RCGR4qDXq6ZGuDaSR7me\\/U9aj3i0Ti\\/eq+Df2s1MFBs3NbBt2tqWVqbS9ZA59wjAszc3svHZpI7N8b52nwvgSG\\/u0NIpdkQyaQPNd3FOZUSjAgh8m98zbJRBpuyX7Q2n4+v1+4bjAAEAm7mScXeGKd4aVOYNRag2blyqpfiHJ6l213ccnItW86v5ndH+jh5r2AEwOPz8K+nVvKtIi3TUSuTv22J0pJjy5ylAa4rznTxzQ19PBjP+U2NDssibGb\\/reuUj6\\/bEiHEGDXOvoo0\\/HYgDViQGoEz9kUSPNcS59XOBKt602yOm4QMsNl0qnwOji\\/3cNmUAFeX23HleM4N63dwzJokaTSOmzOR92Y7sVsmr28Pcef2GK+H0rSlwemwMa3YzXkT\\/dw41cvRA1Ybmty9vIElLQo0O185s447KzXMZJKHNvVxz444qyImIQsCLjtHl3lZXOfnpkkuyvc6UzqVZnlLjJfaE7zdm2JDxKTLsDA1nVK3naNKPZxf5+emWhcVg9xSm6FeFjzfzSoLdHeAxy6q4JIDfcqsJLc+28wvwgo0B988q5ZfD\\/YCWSod40+NBiZg83i5Msd6IM3t5rN1ORxod\\/PFqS5ufz9BCkj0JPnAggm5hPCag8vrnPyoJ0naiPOnhjRLZjkKJ\\/pXZIZrAE3TCnomkBDi8DG+AhLdyWllOv\\/VZGHGY\\/ytq5RFB+jYBqdY9WEzZ6xLEh3g0bRhUh8yqQ8leGxLiJ9OKuWB+UGOH8YVtRJxbn29jf\\/ssuhfZ5lOGaxtj7C2I4lV6sm5CDfU1ctVb\\/TwQnzPGRQ98TRvNIVY0WZyVG0ll\\/TrIVNtncxY3kfDgIWeFm3RFG3RFK82hvhZSZDfLyzjs4F922ML+rmhrIfVHQorGWVpcxkXT9r\\/kECyM8LD2cyWPejn8zm8z1BLhL9nI86yKi8LD0GvWuuz4yQT2CrDIjqE8u\\/pNV6OWptkjVK80xBl88xiZsq4iBBCDGp8BSTYWHyEn8k7+tiu0vzfmhBLzirmmGHemsZSJgkANEoDLhaWOpntt1Fm1zANky09Cf7elqTFtNjQ0Ml5aXj99OCQOh5lpbjjzc5sMKJR7HNyfNBOia7oiqZYFTIID6HNVizCkg+6eT6RKeqtLXIy22fDqywa+5J8ELF23R3v0Q7DoicbjLjdThaUuTg+aKfSqWO3TJrDSV5qTvBhStHb08fnl1nYz6nk03sPfWl2rprq4fsdMcLK4tn6KO2TAlQNfgV4tT5CgwLQOGGKn2MPeP0Ur7UkstdF55SqAxezDkckvfta6R47NUP4u9qDbs7wwJoYGL0xnosXM7NApwALIUQhGGcBCfirS\\/hpbZRrG02inT3c8KGbZce48Q\\/jXLrDwYWzivnqNB9nB20Drs8Q7Qtz0\\/JOHokqOlp7+EGTjwfrcp0yqehq6uEnYYtASYBfnFDKjWV7vk48lmDpx3305BRUWSxb383GhMasulLunBvkHG\\/\\/lijae6Lctj617\\/CSZuPYumK+MD3A5RUOggO8AZVO8qsVrdzaamJEI3znowAXneBh7362sjbAxR\\/EeCAJkbYIf4kF+OpgnXE6xn07MoWpms3N9ZNyWEzMSrKsM\\/McdAcLSg5FUabFq63JXcN+VZVejh9KYKu7WFCiocUUykqxrNPi65MKZtBmj8yZJG6EEIWgcL4hR4RiS2MPt7WZ2S9cxer17Xy50eAAS04MQOOUOTU8MTfIeYMEIwC+YIA75mTXmlAmzzUlBhziGcyOvjSp4mKePKuCL5bt+zoer5svzqvk1tIcug1lsb7PYuq0Kl5dWLRXMJJ5T5Ulfn52Simf3Osv75pQxuunlHJD5cDBCIDmcPGtE4pZmH1uU3OMdwe4sJrDyw21dmyAMhPc15DG3PcwALpaIjyVzPw7UB3gihyyCFYixcpY9rXsTub4DvycoUr2hvj5zkBJd\\/GlGe59Aq\\/905hdtDO4sljdnSI98s0clj2Gn2wasj6gEKIQjKOARLFmUxunv9nHStPBdSdVc8cEG5oyuP\\/ddn7Zc+iOkqpXAAAgAElEQVTWfyuvcHNs9krGwmkah\\/JSmoMvHl\\/C6SO0PKbu9vGL43JbM2NY5\\/e5WeTPnNxMpNg4YOWwxplTfUzLTFFhZX2Ejwa8JiZP1McJAWg2LpnipTKHNpiRNFuz57N57Ix44sFI8h\\/v9vKeCaBx9MwyvlU81AuqUeez78r2NIfTREa2lcOWDqfZvPP6uWxUSYpECFEAxs2QTduOTj61OkYLNq44sYa7ptixVZfz7ovtLI0m+MGKTo4+p4JL9io2MMMhPrU8xDqlsWB2DQ9OtQ8apaXTJvUxg860ImWBtTPxbZi7MgBW2qRHkXMe3B7wcd0IrhhbPTHABSNwy6ssix1Rg5aURdzs916VSc+u5lp0p2GgAg5naYBri\\/r4Ua8iHYrw555ifrZXlseKRbmvLXNmm8fH9TW5RRaJuEH7zg7VbaNyJDtUZfDoynZ+2p0pCC6uKOG+OcMb8ity2\\/ABScCMGzQrKMl752\\/y1NYoO7LXr6LMzfS8t0kIIcZJQKLSMb63Ksx2BRV1Zdw5Jbv+iNvHbxcEWbUsxLpImBvecrLsjCLm7NHvKTpjBvWWxnRL2yeOMJNJHtzUx92NMVaETRIHyn5YiuQQ2h4odXP0iHUIGnPLnDlPP96HZfDa9j7u3Bbl+e70riLXwSmSgx2jObl2qov\\/WJ0godI8tD3Bj0o9e8QuWxsjvJGN5KZN8rMox5kyEWNXeIRm14c4lLI\\/Fq+uaePG7WnSgDsYZOkpxcwd5gweza7h1aBbgWWoPGVILDZ2pWg3FV2xFMsa+\\/if5sx0ad3p4daZh6YgWAghhmpcBCQ7GkI8GAM0O5+d4dtjRkdRZSn3zUly+poE3W3dXPW+k9fmeSjLPq5MRTzbu5U69yyO7Oro4coVvSxL7LsB2WCUIudjQaPKYxu5P4KmU+MeXoGnGY\\/xT6+3c0e3lXu9jQJTDZ4OmloX4Oy1Cf5uQENThFeO9XDBzjerUjxYn8wEb5qTaya7cq5lMK1+11gbqQ+xxYoPW7lsQ5Iw4PD7ufuMMi4+mN5a03a3zVKkh5A5GzFWgp8sa2VpvwIWTbcxvzbIP88u4srBCoaEEGKUjYOAxGJ5S4I4meLDk\\/bJiWscd2QFt3U286Vmk\\/Wb27muaAKPHeHACZgJgzYAzcGMfnl5Kxbmxjd6eDXTY1JR6ueWGX4uLHcy3aPjt2m7h3bSERY\\/3s6Tg1Vu7ofLNpIdgoZrOHfzVorbVrTz2+5M5sHldXPjjCBXV7uZ7bdRYu\\/Xsao0t73cxD91Hjjs0jw+bpjQxbMNFlYixtJWi\\/Oze6YYvREe6M2cw1UW4Joh7Pfise\\/OZClTkQAOrq7V4p31rSz+MEGvArvXx3+fUcFnh7DT70B2tg1As2WyJYVAWRabepOsiVh8KqjL7r5CiIIw9otalcH2WPaOWdNwD\\/SlrzlYMr+ca30amjJ5dnUb32vPdL4bu5J0K9BdLk7ddbeoeG9zL89kx15qast565wK\\/nWKh3l+G8H+wQiZWQuxMbxncrQtxG1dmeth9wd4+NwJ\\/OFIP2cW26noH4wAoIgMtJDJgHQunOLLFNgqk79vj9GZPcfb9VE2ZNceWTRlZwFsbvwu265hGpWyOLh6ZYt317dx0doEXdlg5M5Fldw4wKJvQ5VOm7t2nNZdtl1ZuVGle7n38mlYn55K+0UTeHC2lym6orcvxk\\/eaOX7OQSWQggxGsZ+QIKGlu07lGWwdZB9Q7RsPclsHZSZ4tdvdXBPb5y76jP1AtUTfJyxM7ugDF7r2LkbqoPrj\\/IzbT9XyojsnrUw9ig+7EjQmQ0OTppevP9hCjPNx0NYstRXFeDqbPqiry3M3+KAmeDPjZmpwJrDy\\/V1gxcSD8TmtVOX\\/ZubCYOWYV97i3c\\/buPCtXE6Fdg9Xu44o5IvjtAwRmvM3LWwmtfryOtsFk3XqPC7uXpOFffPdGAnsyjf\\/22ODWnhPSGEOFTGfkCi2Zjuy6bwrSR\\/aRx8zYuiylKWznETAKx4lC+\\/2MqdYYVmc\\/GNWZ5+MyksOndOZ9Xs1Hn215MoVjbHds1aGIu6k7vrRiZ49x8chNtjvJJzhgTQXVw\\/2ZnpAI0ESxvShNoi\\/DUbOFZODHDJEGcF2f1OZmfTNlYixYZhbVqUyYxcuKZfMLKoin8YwtDR\\/ik29aWzAYnG0SWOAlnvQ2N+3e6MVLg3NYaDaSHEeDL2AxJ0zpzooQgAxbsfd\\/KHvsG+YTXmHlnBrybY0IGkqTA0nVPnVHDLHnfFOsW7ii\\/TfBQe\\/BvbiIT50db0gMuxjxVBx+5C2E19gwd0mElu\\/zBC25A6MI1jpgRYoENmqKaP27dH6VCAZueKKR4CQ22wzcXJxZkgVFlp3h\\/07z0Yi7fXt3HBrsyIj9+dOZLBCKAM3u\\/NBnqajfmlQ8sCHUo2r53J2bdqJU26JCARQhSAQvmOPCgVtcXcUpLpoKxUnG+92sqPW40Bp9+GIykarf41IBolLn3Pu1fNzinltsyiVspg6dpe3hxgmc1wKMyS5V08PxLbCueNxpxyV3Z9DMWazd38IbRvD2Wmktz+Zhs\\/7s59xtFOus\\/HDZWZv0+6p4+fNGU6arvfz3XD2fxQs\\/OJ6kzWBWXyRsd+gqh9WLz5USsXrY3vrhk5s5IvjfBsE5VMsDx7HXWXh\\/NyWWl3lGg2nV1JP0sVzAqyQojD2ziYZQPYXHzv5DJWvdrJ03FIx+P8cFkj\\/1Pq5aIqJ0e4dFLJNOs6YzzVaRDZuaiWBqYyefr9Tu6qrObmXVM1NE6ZXsyibZ28nIa+zh7OeibG4jovJ\\/p0dMNkY3eMJ1pStFka0yf5qW6K8PrQ16cvCMEJRXylOMqPexRWIsYtLzbyl4k+zim248eiuS\\/B0zvifJwCT7Gfy4jycO8QwhLNzhVTvdzaFqVHKYxsvcrsyX5OHGZIPHOCl6PWZXbTXd8Wp\\/FoJ1Ny6PNTrV1cui6RzQpolLsUz69t5\\/kc3sNVx5VxVY7Tefo64ryVjZLKq32cdgh2Ix4pkiARQhSC8RGQAK5gkEfPsfODtzv4dYdJGkVTd5T\\/7t53ZxmXx8M3Tyjj\\/K52zlufIpWK8d33+jj7jCBHZDs1WyDI0pPTXPp2iPdSkIwneWRjkkf2OJPGzMnlPD5X49YdhbIw+DDoLr5\\/SgX1r3Vwb59CGQbL6kMsq9\\/zsGBxkD+dVsTWt6I8PMSXKJ0Q4DJ3lLuztSOa7uRzk5zD\\/gDai\\/xcU9rL2i5FqivKE7EibskhWFCGxe4ROEVrT4xHe3J4Qc3J7KNzXUjE4qWmWHZJ\\/GEOSwkhxGFmXAzZ7OT0efn52XWsX1TOrVO8nOi3UWrXcOg6FV4np04M8v8WTGDTRTX8bKKTRUeVcUO2E+tu6+ZLm\\/esBZkwoYzXzqvh97N8LCqyU2rXsGkaxR4Hp9UW8avTa1l5coAjC\\/juN1dOv58\\/nlvLk3ODXFruoMahYdc0vE47x1T6+fYJNaw9t5xLh7ssqt3D5+t27+3iLg9w9XDWY99Jc3DtER6CgLKSPLifYubRppIx7m\\/NDEs5ggFuHs6wlBBCHGY0dfU0ydiKUWDx6JuNXNVgYqFz0YI6npxqO7iFS404X322hd9HwR4sZsV5pcwvgBC7flMLR6+KE0Pnwvm1PDmtcApaATAjXPm3dh41QXP4eezSShYXVAOFEIcj+RoSo0IlotzTYmIButPL9RMPMhgBsHv4zpGZ4RAjHOY3zVb+6yGsJL\\/fnCAG2INBvj+5wIIRAE0nmE1VKdOiQ6pahRAFoOC+K8V4pPhoax\\/PZzu+CXUBLhqhRTmmTC3lK8HMCryPftyXXf01f9obe7krrECzcfnsIhYW4nCe5uDInSvRqiQvthdAICeEOOxJQCIOOSMS4bsbk6TIFLPeeIR75Hbotbn47twAkzVIdIf4UZOZv87VTPCLj2J0KyiuKuE\\/6kYgC3QoaHY+We3YNW36kZUtXL+ujz\\/viPF8W5xXQmbuGywKIcQIkRoSMfLMFE9sS9CgFJF4kse3RXk7u2NyZW0l75\\/qp2ZkX5DXt\\/bxUgxsfi+3THERHNHz5yYdjnJ7Q4ooOvMmB1nsL8hwBMgU3n7t5Tb+0LfvujLuuiq6T\\/HhyUvLhBCHKwlIxIhTiTAXPNnBc3vdZnuCQR48s5zF0tMVBJVO8djWMA+3JFgdNmhOWkRNhVMCEiFEHoybdUhEYdI0jRKvk0V1Qb5\\/VIATCmNDFwFoDieXzSrjsln5bokQQkiGRAghhBAFQIpahRBCCJF3EpAIIYQQIu8kIBFCCCFE3klAIoQQQoi8k4BECCGEEHknAYkQQggh8k4CEiGEEELknSyMli8qxQ+f28GPQ\\/suA6N7grxwcTlnj7NwMdnURskbUeJA6dRqmhd4cY3oKyjeXdPEKevTGGh84sRJPH\\/E6O0ns2H9Do5Zk2TfzXN1PnfaZP48sXCXkhdCiHwbZ13e4ceK9XHWI1vRHtqK5\\/UIkd0P8Pm\\/Zn7vfL6X9bL83T5iDW14HtqK9tA2ztho7NpQLt3ZxfSHM9du6urEAAGGEEKIkSYZkkKgu\\/jmwjKucGd+1HQbcyRUHHMmTang1QorG9goXv+wle+17rt5nRBCiH1JQFIQdI4odXOaN9\\/tOLR0r5tPT9JIAv5SG7Z8N2iEeTxOTtm1I52i26WBhCNCCJETCUjEqHGUFvGnhfluhRBCiEIkAwNCCCGEyDvJkAhA8cRb9Vxab6EONCPESnDL083cEQN0L3\\/8VDU3OA9w3ACGN8tGsaMjzG82R3i6I8XWhAK7jVllHj4zvZivT5SP805WPMLXViWYMSXItTVOKuTWQwhR4OQbXIwNyuSZD1q5dmOS7v5lGWmDD1rDfNAa5cEZFfx4vBWmDJeyWN\\/cxx+a+viex8UlkwMsmebnEwF93NXuCCHGBwlIxKGhO\\/nmqRO4ytr9q1R7DxeujZMc8skU733UylUbktlpzRp15T4ur3JSo1vUd8d4tCXFB5s7+IZPwzrA2Q4XO3NciXiSRz5O8pcNXUwq93PDtAA31rqZLP\\/7hRAFRL6SxjjNZmd+tQeXBc6S\\/jNXbBxb5eU8Q2EP2PGPest0ppW6mdbvN8mEPqyiJbMvxNfXZ4MRzcYFc2t4aKaTwK4jSvm39m4Wv97LW5FBT7MPm8fJudUWKTTm+LRdHbjudHJ6tYfpSqM6OLw2D9l+FsrLWb8hNN0b5LHzHTxSH+be7TFej1pYSlHfEebfOsL8ZJWDcyYFWDItwKdKbSO8QJ0QQgydBCRjnOby8ovTB5gvrLv49qnVfHv0mzTCFK9v6eNdM\\/NT2cQy7t4jGMmoqCzl3jkJjl+dIJrjmV0VJTyxaN\\/f24IB\\/njG3q8w9gQDHpbM8bBktsXWjij3bY+wtCnOljSY6TTPb+nm+S09VBR7uWZqgCVTPMxxymqyQoj8kIBEFDYryZPNBiaAZuOyaT6qBzl0+pQg569L8OiYXFpV55gaH1cXHcQpNCdTB0rnaDrTKgP8sDLAD04wWNEU4U\\/bw\\/ylLU2PUnT0Rrl9dZTfrLFz0kQ\\/S6YFuKrSQVBiEyHEKJKARBQ0K5FiZXamjqa7WFQ+eC+pOdycWaLxaPsYXIxMs\\/Pp4yr59KF+GZudUycXc+rkYn4TT\\/JkfZg\\/bY\\/yQsgkbRq81dDLWw29fMvv4aqZpfxqhouDiZGEECJXMhlQFDQznqYpG1\\/obgdT9zdFRLMx3T9KNR\\/jgMfj4qojy3n6\\/Ek0fLKKX830cowzU0sTjsS5tz5O2xiM7YQQY5N8d4uCptKKcPbfmkMncIBhhIBDH7XdfccN06IxYrA9atBmyN47Qoj8kCEbUfAOiwBDGTzwfhcP5VqROxDdyS0LSjg7p\\/\\/ViobOKH\\/eHmZpY4KPU7sDEU3TmVnl56YZPuoOi4svhCgEEpCIIVIkRnGhD92hEwRaAZW2CCv2G6GE09YYvcO3WN8W4\\/GDmvaruPQAf5u+SJxHt0dYWh9lecTC7PeYz+fmiikBlkz1c3q\\/adBCCDEaJCARADhtmQ5IoUjtr1MzTNpGcRaLzWunToONCqxEmq0mnDrYQKMy2RyxZGG0vRipNC82hlm6PcLjXQbRfjGPZrNxwoTMeiSfqXJQLFGIECJPJCARABQ5dLTs\\/XJLzMDCMWCBUaInwapR7PE1t4sTfRovhRXKSrKsU3FdzcC9pkoneLlnbOZH0Jz8+\\/lT+feROp+yWNsc5p7tER5oSdLSPxWCRlmRh89NDbBkipfjXBKFCCHyT4paBaBxRNCejU4VH7QlaB\\/wOJO\\/bYnSPJp9vuZk8QR7ZgVaZfK3LRFaBjl007Y+nhuTa5CMPCse4ZYVXdzWtDsYsTkcnDOtlPs\\/UUfT+dX8dpZPghEhRMGQgEQAUFbu4djspyHa2sutjQZ79O3K4q2P2\\/lmkznKNRoaJx0R5JRsLq+7uZsbNyTp2+uotrZurluXYJDNhQ9jGnXlfv51QQ0bF9fx4vxiPltmx53vZgkhxF5kyEYAYAv4+WJVLytbLCyVZumbTby91cu5xXZcpsG69jgvhUyCVX4u6ovwVHw\\/JzMMVvakMwWo\\/aRDu+s70okUy9s1HHscoVHkd3G8d8+7dlsgyG+PjnLGmgRhZfLc+80c3ejl8ion1bqivjvGX1tSdKIz3a+xNWIe9nUkms3OebPK+fYUP+cFdfmPLoQoePI9JTI0OzccX8ZTvZ08EVcoZbGhNcKG1t2HFJUW8cACL0+9tP8d7MxomJtf7WH1fqKCcEs3n9xn7EVj4dxaXp+1d\\/2Kxtwjq3g41co1G5J0K8WOrih3dPWfI6szb1Yl\\/651cenHEpBoLi\\/fPTbfrRBCiNzJkI3YxR4I8Mi51fxmhpd5Ph2PBg67jellPr5+fA0fnF3GJ915qjnQbJx\\/3ATWnFXOt+vcHOXRcWngctg5tirAT0+byPK5HiqlJEIIIcYkyZCIPTg8Hr4+z8PX5w12hJvfXjKN3+7nHLaiElZ9uuQQtE5jYkWQX1YE+eUgR8w\\/to60ZAaEEGLMkQyJEEIIIfJOMiQFwWJLd4LXd+1qa2NOqUN2WR1j4vEUq6M7C3cVHyXH6JooQgiRBxKQFAIrye1vNHN79kfdE+SFi8s5W\\/JXY0rD9g7OXJNElkIRQoihky5PCCGEEHmnqaunSV5ZCCGEEHklGRIhhBBC5J0EJEIIIYTIOwlIhBBCCJF3EpAIIYQQIu8kIBFCCCFE3klAIoQQQoi8k4BECCGEEHknAYkQQggh8k4CEiGEEELknQQkYoxSvLqqAftDW9Ee2sYl2y0OhyWHVSrGjU9uRXtoK5PfjRHKV0OMOLc8nWlH1YoILYfDxRdCHFKyuV4eWKkUj27u497mOKvCBl0GeJw2qr0O5pa7OXtigBsq7Tjy1UBl8MLmMG8kAd3B4pl+5sknpQBYvLKui\\/tioDu8\\/HC294A7QluGwdquBG90JXm3J8WHfWm2xUx6TIXNplPpdXBsmYeL6wJcU+0gqOXYFLuH783x8cDbUdqbuvl+i5e7Jujk+vRDSqX44XM7+HFIobsDPHNJBZ\\/UAUzuXt7AkhYFuof\\/vaSGL7gHP02soY2yN6MkhvjyjpJSPji3mKMGvBiK7kiKd7uTvNOV4O2uJO\\/0puk0QQHO8jLWn13EtFwvpLJoCCUz5+lK8nZ3gtV9JhEFoDHrqAmsO9aV+xf9CF07IYZDuplRFu4OcfUb3TwbU3vc0ScTBr0Jg4+74\\/wtbOeyygDl+WqkMnlhUw+\\/DAO6h9ppEpAUgnSoj+9uTWOgMeuIYq7xHugZipff38F5W0ysAR41DYumviRNfUn+vi3Ev1cE+a+TSvmUL7fesLqumH9YH+P\\/Cxnct6aXL1eXMl9yroNTaX7zyg6+1WEN+PcY8ulSEa58qp2\\/pTkssoNi\\/JNuZjQZcb77ZhfPxjJfIG6vm8vrPMz16uiGSX1fkmVtCTbmu51jgkZliZerJmW+3Of5tMK4Oz9kTB5ZF2KlCZrdzT\\/OcDPUG1S73cZkv4NJbp2ATcMwDLaGUmxMKCwUrR0hPv2Kyf3nVHKlJ4cT6i6+MsvDHe\\/ECIX6+H\\/bgzw1zT4ux4E1u4Mzq52U5nCs3e8gOMhjUUPtEYxomk6lU9GRVEMPUixF1NwzGLHZbZRqJh3poZ5MiPyTgGQUhVvD3B\\/JfIH4y0p4aVEJC\\/Yel7FM3umx8OejgWPM0VPLuX9qvlsxOoxQH\\/\\/ZnMl0VEwMcvUBsyMZFaV+vht0c26Vm\\/lBG\\/skP5TFR0093PxeiBUpSEcj3LLGxydO8lGcw\\/lr6oJcsTbG3XGLFzb0sXLK+MyS6B4fP11YyskH+d58HgdneF2cVObm5DIXJ5U6UNtaOWJVnNRQT6ZplAfcXFzi4qQyFyeXuZlfZOO5t7ZzdaPkTMTYIwHJKGoJp4kCoHHGEUXMH6hIRLexoMw2ug0TBU7x0qYwayxAs3PlVG9OwQJoHDetjOP2e4jO0XVl\\/NUymP12lC4FrTsiPJ\\/2cVUuRUx2DzfWOfjTxjRGOMxvW4pZOnEcRiQjQXPwjdNr+cZev24a7ulcfu47f+9bFwlExNglAcko8tp3F\\/2lrJH74gj1xfjj1ghPtSf5KGLQaSg0XafYbWdG0MmCCg8XTPRxVlAf4A+u+Oub27myQQ38VWbFufnxrdw8wEPOqnK2LgoycT9jJenOLo56OcQW1f94xbbWPm7fEuW5rhT1CYWy6UwIODmjxse1UwN8wr\\/nSc1QD\\/Of72H1gHltjYtPmswTU3IpqlQ88VY9l9ZbKHQ+d9pk\\/jwRmtrD\\/HpThKe7UmxPKHSHjVllXq6ZWczXqu05DY+k4nHu2tjH\\/c1J1sdMwuhMDLq4YHIRt073UN3WwcTXwnQq8E2qomuhD1cO51XpGH9qNDABm8fLleUjPzhVWe1lvhblWQXKTLMhBgesmAVAY0Gdl8mbQmxVJk9si9Ex0U\\/FiLdQCDHeSUAyiqrLXUzX4nykFG81RWmaFqTuoPoWixXr27hqXZwde3fUpkV7NEV7NMUbLRF+vS7KHz9VzQ3Og3m9EaAMHnmvlSVbU4T7\\/94w2dYTZ1tPgvV2D2cd5WBU8kTKYtm6Nq74KEFX\\/4gsZfB+Sx8ftEZ57rganpjlZH9lFa0tXSx+K8R7qf73qCbbumP8vjvGwztKeXz68JoYaonw92w+v6zKy8JDcGGUYRHZ9ZOGYwifS2epl\\/M9IX4fg3BbhKcSfm6UGRhCiCGSgGQU2YsDfKmij2+2W0TaevlBs48\\/TrQNuxiztaGDK9bGac1O8asr87K4ysURbh27ZdERS\\/N+V5xXu409O\\/89aCyaU8NrM\\/p1pFaKP7zdyf0xQHdx66llXDxAIKM7HFQMpfFK8fa6Vq7fmiIOOJ0Oji9xUOOAeMLgg54UbebAT7X5A9x9lqdfp6lYvaGdbzYNPIMkxwbR3NDB1U0Jeu0OzpngYZ5Xx0imeHlHnDVJhVImL63t4DfVE\\/nuIBmDaFcPi1eEeNfI\\/Oz2uFhc6+U4j0YsluTpxhgftPdwbdJOYsiJMcVrLYns30\\/nlKqhF7MemMUrG\\/p4J3shdZeLE31DeLru4qxynT80WCgjwdPtFjdMKpApwEKIMUMCktGkOfji3CLuebGH1ZbBfSs7ObekKofpmwNQaZZujNGmAE3nnOMm8PgsJwP1I\\/FYgoe2JKkbZGi\\/LODm1EC\\/X1gaT+y6C9eZXurmtBHoBa1YmO93pUi53HxrXjnfr3NS2q\\/XUkaa57f08uhAn0qbnbnl\\/R9QGA0HO7NG8WpjjKKyYp45rYRz3bvPZh0T55uvtvK7kEKZSf5vW4J\\/muved20YK8VtK3t5LxuMVNWU8feFRczrd+C\\/zY7zneWt3N6THvoIv5VkWWc26NIdLCgZoY5eKSKpzDTzhzeHuLM5nS2q1Dn9yCLOHFIWRmdeqRNHQ4IUFivak6QnechfMk5jRrmH8zwK3elk9wiXRm2Jh\\/OUAt1FrZRqDUCuncgfCUhGkUol+N26MB9l70TNeJSvrOhh1pklnDjUv4SVYmUoU\\/eh2bx8+YiBgxEAj9fNDcfkP4duRFJsdHr4+ZnVfLt4325Vszs4b1YF541imzS7h5+cXMq5e10e3e3hx3N8PLAiQqeChvYEm5V7n8Wuom0h\\/tCb+Tvobj93nLRnMAJgc3v4+YJiXn1hsBqYwVmJFCtjO9vqZM5QMhd7MXq6Oe6FXj4aJCrSdDtnH1XB\\/TMcQ\\/5iqC1yUqolaFXQ2ZNkm\\/IwK18pEs3BdSdWc90+D+h88phqPjmMU1rxKN97M33gab+axqmzKvjHsjGaHzoE106IXElAMkqsRIxvLGvnzl6LssoS\\/jLD4l\\/eCrGuq5erVzp5fYGPmiF+h+2ui1Ukx0Rxvca8WWV8c4BgJF+Ka4JcO8gc62Clh5P0CE+bYETTbFXsFZAoXm\\/KZqmAKZODfGqQKlVHUYAvVPTytbZBiocHYUYyrwtg89iZdAgmsGiazrGTSvjp7AAXBIaXgbF57dRp0Koybd6iyF9AcggoI80rTbks7qFhmyQlvUIMh8zPGw1Wil++kQlGPCXFPHZaCRfXlnLfbDcBFFvrO\\/jchtQAS1QrnlvVyNSnGpj2Qjev9b+71h3MDmS+8ZUR4xdro2wdpP6iUGi6i2snOwsoCtaYU+4adBErzW5nQjbboUyLnr2vr0rzTk921U3NxumVrsGHKTQbp5UPvVA3ETdo3xmQuG1UHkQnrztdXDEtwJL\\/v707j5OrqvP\\/\\/7q39up9TS\\/ZQ0hCIgmrRBCQ3RFxVJSHCKKiMy6jIurojOOM4zjOoPNzUHF5jI7OgDLqV1ARRDYhrAmEJRuBBLJ0Or1vtW+37vn90ZWkk3QnXUm6q9N5P\\/\\/q7qq6dbuqu877nvM558yv4MNzy3l3c5BFAQuMy\\/q2QW56cYhfRY9sTyBP0MOMwteu47Cr6EU1ROREN3XahupYOzIAACAASURBVGnslS19fK3PBdvP586q4VwfgMXyxQ18u6+Dv+7Is2pDNzdVtfDD5v2LXHO5PDsTLrZx2a89tPzcsDDE99Ym6TeGdVu7WbTDx8qmEBfUBTijJsBpNT7mFDNdYoLZ4QBnj2cF0EnUGPQcIpVbBPfcaAzOgS21cdiWKPzQ8nJy+aFea4u5FT68ZHGKOL+4sy8gWF6bIyk32sMuK+NrB1arunnW7hzkky9FebZziGt7U6w9r4lvzSiy2NpjE977AEOsmF\\/yOOCpqObJK45+YTQRGZv+vSaam+YHr6VJAsHGSj42crjC8nHjWfVcV2aBm+PHa3r4fnT\\/Vi+VH\\/7e8nv2KwAFmDu\\/gbuXhZlbuOx2cjme2BXl6y\\/18s5H25n32x20PtjFTa+n6TwWm2ccJU\\/QS9PUyUeAReBoivNcl8jelGhTfZiFxAJea1zrjoyUd0fMfrIm4ArC9nDmvHoefnM1y20wTob\\/XNPP3Zkij2OBd0QgyU2BvzcROb4okEwwJ5LkkSSAxbzawEFd7lawjO+eXclSG9xMii88PcDDe7q7TZ7d6eEGKVDmY85BjbmH809pYvPbWvnliiqubw6yJLRv8TNjDB2DSb6ztpMznoywvtRDOh6rhDMvjk8h776ZRCZvit55drwq6qv5YmG3XjeV4Ds7neKmU7tmxJRmizLNwhCRIimQTLB80mHPthJBz+jTVKsaa7ljWZAKIB2JcN2aGK+5gJNhdcQAFqc2BKgY5bEwvO7FNYvquP38Fl6+ai4Db2\\/l\\/rNruL7OUwgAhs7OAT78anHDBXIYtk3V3obXZegwNY8Zx1Bsx0N5wLN3mMZkXQYnrHjZZnnNntk1hhf7MqSKeLQ74twsy0NDsV1BInLCUyCZBIXSU3bFnTE20LJYsbiBb7cM1zN0d\\/Txng0p1rdFuT8LlifAe1p9436zKsIBrphXw+0Xz+SBxYHCCqOGdbsSY075lCNgeZm\\/p3DCOGyJH+rFNWyP5YoOhHtmrwDk0w6dE\\/j+5c2+g+dy+RGL0B2em3boKDzcnqDZQCIyveljY4J5y33MK7zK\\/V0JHhrrKnpEPYmFYd2rXbzpxRRRoGV2NR88ku1\\/LQ8XLKrk\\/MLzuymH3eNp0CzwWPv6cnIKMaOzfJxdaw\\/\\/E5k8T\\/Rkxt6x1eR5qi9HsaNm3nI\\/SwtjcG46y6sTNnslz\\/MDzt7A5PN5itpxOhbL7u0JDFT6WaJPFhEpkj42JpinIszbCrMv3FScL25I0TfGfUfWkxhjSOTBV1bBbaeGqTnC53ez+b3PZ3ntMYd99mdTt6dA0zi0pZRIRmdx7szw3rqgHTuj3DPGmEwuEuO\\/e4tbgwQAT4BzqoeH+oyb46Xo+I9gcnkGxlkIEukZ4j+69szosVhRd+i9ew54Jl4ezBWGoyyW1AXGty+fiMgICiQTzQ7wN0vDhdklhle2dnPxczHWj9ZT4uZ5OeZij3hXbK+HhlGmVrjJGNc\\/1su\\/7crQPsZlt3Gy\\/GBdZO\\/qoHUNIZaP5x23vCyr2nPl7\\/C7tkxR3fcnkvIZVXysEBjcdJxPPRth3QHjMm4mxVeeixS9SisAlpdLmgprt5g8T\\/WOv5cl29PP4vs6uGFjjD8O5UctiDWOw6Nbe7nwyQib9u5lE+Zjc8Y\\/RIhxeLJ3eDdiLC+XNk3SxogiMq1oHZJJ0Dy7ntsHcrzz1SwJXNZv6+WM9iEubA7zpiovVbh0xDM83JFifXr4KtpjDa\\/EmolE+KuNYVavCB7Qu2Fo743x8+4YX\\/F6Oa0+yFnVPmYFbULGpTue5aHdSV4oHM\\/2hfi7JaFx9pBYnDczTMv2GO3G8OqWLs5LVnJDs5\\/ZPgtPoUfADgS4rN47AZu97S+byrI6dvAmei+l9vU49EfTrOo5sGTYZnZtgPkT+Vdu+\\/nc6VX8YdUQzzvQ1dHPyvsTXD07zIqQRSqZ4d62BGtScGp9gB39GSJFdpOc3BJmycYM641hc3eKXaf4mTvO6dPpZJrbN6W5fRP4fF4WVfpoCdiELUM0lWNTJEdPft\\/UYsv2cu0ZdbyviDfVTad4uPBLecrCXDWFVuI9Vsa9dDyA7edDp9XwtlFew97OQT61bf\\/i8lRi3\\/dOLMYnn07vtw2Er7qSHy0NjdLrZHjylV5u7d\\/\\/D2r3gNl7e0f7ANfE9l99d\\/6cOv59pldXozLlKJBMCg+XrmjhsbI+PrA+zmYHnGyOh3dGePiAe1qWzbLZtfzXYotbHuvl9xnD5q29\\/ENLK7c2jvhgsdgbDPKOw9quOGu7Rn92fzjEV85p5DOV428oyptq+e7cNNduz5E2Lut2DXHzrgOOO6OebRdU0jrB7c9ARz+XrU0dYoaK4ZnNXbxl8wE\\/tnz87SUzueXABVyOsfL6Wv6w0vD21RFeyA1vZnjHK2nu2HciNLfU8bP5GS57qth5NuCtKuf9tUNs6Ddk+xPck6zi0+PY08byWIQtiBXap1zOYWO\\/w8Yx7h8sC\\/H5Mxr4p+biGqvOjgRPDXePcMqcCs6ahi3d+JeOB+w85506+iBrIpbit+3pMWuN3EyWP7Xvf2vACXEroweStr4Edx2iMCwWS3H3flt9W5xeU3NEq\\/GKTDQFkkljc+bCRtbNquI322Lc1ZXmuahDb85ge22ayvyc0xjmPfMquLLKxgN885QYj7yYJu7m+OHaAa68tJ5LC7UddqiSe68M8nhXij\\/3pnl2MMuWRJ7+nEvWsqgKeDmpOshFLWXcODfMwmLfacvDO89u5dnmKLftSPD4YI62jEtq5EJdsldzSx1PXxHmx1ui3NmRZnPSJY7NrKoAV86t5osLgtR19VJY5w6fXURIsnxctyDEN\\/qTRNwMv9yV45OLDz8s4m9qYMdVVazqSvFEf4YXhnK8nnToyrgk8gbbY9MQ9nFKTZCLW8q4bmaw+F1cjcNdO9OkGZ4N9pG5U2lrABE5nljmmvlqX0QmQXRnNzNWJ0gDCxa1sHlFkMMs7rqPk+KTf+rkBwnwVlbz9OW1U6Inwhka5IwHB1lvoGluE5vfGKa61CclIselKfCRJnIiMGyJ7KkVsDi5yldcT4I3xBcWD9cAObEY3+k4sk3wji2XB7fE2GSGe0c+uySkMCIiR0yBRGQyuFnu7hhe58OyA1zSUOTmdcDcebV8otLCMnnueiXKqyVOJG48xi1tw7Nr5s2r5eNF1CiJiBxIgUTkaDkpbl0f5eG4O8b+Ly5PburjtsJMlOrmCt53JAvdeQJ8aUUFcyxID0T4anu+hL0kLvduivBUHuxQObcsHe8MLhGR0an+TORomTyPbunj5lcGmF0b4q0zgpxW4aHWAwOJLKvaY\\/ymP08WsP0hvr68nOYjfKrq5hruONPDI0nw5B1ieKg8lr\\/LeDkO8YoK\\/mEp1DdU8q6JnvstItOeilpFjlYuzjt+38M9h1mxLFgW5usrG7m5zi56uEZEZLpTIBE5WsbllZ4kD\\/akeaIvw\\/pYjt0Zl5SxKPN7WFAd5OLWcv563hFMvxYROUEokIiIiEjJqahVRERESk6BREREREpOgURERERKToFERERESk6BREREREpOgURERERKToFERERESk7LNJWKyfKPD+zmXyIHLwNjhyp56Mp6LlJclGPFTfKB33VxR+7gm3w1tay7tJolWj5WREpIgeQ45yajXHxfH4+5EGxtpPe8csqHb9jbAJW6wTHZND\\/dmmKXAU8oxMcXBKkvzakczDg89FqMpzKA7eOqk8s5fSr8V4wIrHawgvvf3sBlNkCenz7exo2dBuwQP357Mx\\/RPjIiMg1MhY9esQPctLKOdxcaFsv2sGwa9Y642Qw\\/eXmQ1S74aiyunh+kfqpcjZs8D20d5FsxwA4xc\\/4UCSTHmh3kHy5o4a8KHXJuIs7H1kTZrHWaRWSKmI4fvcchmwW1Qc4Ll\\/o8ZPqyObkuyMmF7\\/L+NOUWoEAiIlPENLoOFxERkeOVAomIiIiUnIZs5ACGbd0xfrwjyZ\\/7s2xN5om64PfYNIS9LK4OcG5jmHe0hlgeHKUQxE3z6fs6+F5y9KPnBgc45dcDo9xisXxZK2uX+sf4ozTsGkhyf1eax\\/sybIjmaMu4xPMQ9HmYWeHnnBlhrp1XwSXlFqOXqBjufmYHV7eZ0Ucq3BQf\\/f02PjrKTf4Z9Wy7oJLWw9S+DAwl+Nn2OPf1ZNgYzzOYB7\\/Pw4KqABfPrOAT88MsPOH\\/6wxPvdzDf7lhPjSvjAvK7DHeLxE5kZzwH40yQj7Lj9Z0c\\/OuHKkDbko5edqiedqiGR5si\\/L17bVsuriahZPRkpgcP3h8N5\\/ucsmPcnM86\\/BKv8Mr\\/Un+95UhrljWyO1LJnkmTz7H\\/73Uw6dez9B\\/QNpxsg4beh029Cb40ZYw\\/7qykc\\/WndiNcCqZ5uevJ7jj5X5OaizjQ\\/MruaE1QIun1GcmIqWiQCIFLg+91M2nduVwGJ7pc1pzGZfW+mj1gZN36YhlebY3xTMxFxijHtL2c9O5LbzXHXHkZJxPrI6yyYC3spL\\/ObOcOaO0xmVh35h\\/kEMZQx6wLJs5NQHOqfGzMOyh0oZExmFDX5I\\/9TskXIf713fxdtPMn08JENrvKBYXLGvmiYUjzt3N8sM1fdyZBOwAXzy3jiv9o\\/xaPh8NYyWIfJbbnurkps584Rw9nNIU5rJaH81eiKayPNmR5PG4SzqR5AuPd+O5qInPVJ24kcS2hn93Y1y2dsf4++4Y\\/xTwc8WcCm6cV85fVHvwlfgcRWRyKZAc5yyPl7OaQgRc8Nd42HeB6eHUGWEudwzeCu\\/w2iSHYNIJvrujEEY8Ab54YTPfqB\\/tKt7QM5jgJ10Wo08KsplfG2T+iJ\\/k4xkqCjM6LI+X0+uDRa+JEi4L8rE5lXx0TpjTRxsqwrCzvZ+3rY6yKe+yZvMAP53TzCfL9r9XXUWQcytG\\/MC1uGfvi2ZzUm2Q84pa18PlyY09fK4QRkKV5XxvZT0frj7gtVvu8Kf13bz31QyxbIovPx\\/lrW+p4uQxXweLhfUhLg8ZbL9\\/xDRpi5k1IS43BuwAMyepRyHZ1k3dMwnSR3GMkxa38PLyID4sLjqtlTUz4ty+I8avOrP0uJDLZPnDln7+sGWAltowH5hfyYdnh1ioZCJyQlAgOc5ZgTDffPMo0cAO8Plzm\\/j8OI\\/jRLOsL4yH+Osr+PSoYQTAorGmnL+vObLzPSKWj5vObT7cnZgzs5ZvzUly5TYH10nzu648n1jgmdChkXwsxt9tzZIFbH+YW9\\/cwI3lozyj7eWK5Y3880A7n+s1JPqi\\/Ki\\/km+PtSCL5eP6M5u4\\/uADcdkbmrjs2P4ak8\\/2cObMKs6cWcV\\/pLPc3xbj9h1x7hvMk8HQMZDg3wcSfPMlL2+eVcGN8yt4d713jBAsItOBAokAYDB76zOMa8gaOP6KHGzObQwQ2OaQwvBaNIfDRHb9GzbsjLE6D2CxaEENHxotjOxh+Xj\\/3BBf7k2SMg4PdmZx6gPHxT+htyzIe2ZbZI\\/iGE3VnlGn9fmDft5xch3vOLmW\\/kiKX+2I8b87kzyXMriOw6rtg6zaPsSnK0O8b14FN84Nc8aovWQicjw7Hj4LZRJ4y\\/0ssmF3HnL9Ub68M8QP5vipnKKf+4m0w85UnkHH4Jh9s2ZySYMfSAGDWRf3EMc4aibPo93Dw1xYHi5p8h82\\/NRU+mi2YJsxbIvkSBKgciLP8Rjx11Vx+8qJfhaLuqown1ge5hOnurzSHef2HXF+sTvNLscwFE3yw3VJfrTBw4qWCv5xRS1\\/WXb4o4rI8UGBRACww2V8atYQq3Y45N0cv1jTzu83BLioKcS5dQFOr\\/azospHfQlnQUSjCX64Jcb\\/daTYmDKjzrgZKZuf4GVITY7N8cJzGIfvPbqd7xXx8Hw2z5Bhyoa+krJsFjdV8o2mSr6ey\\/Foe5zbt8e4q9ch4eZ5sT3Kb+fV8JdlevFEpgsFEinw8I4zZvA9t4e\\/bcsRB+LJDPdsy3DPtuF7WB4PpzSU8eFF1Xyiycvk7enm8uLWHt75UpKdRXR5GJjwHpL+UXbPHf\\/jGe5dkUOKpR12JHLsTLoHTUcXkelDgUT2srwBPr5yJlcvSfLLtiSP9GV4fijH7tzwkIjJ59nUFeVz3XF+c0oT9y8LUjUJ59Xf0c9fvpikzQCWzdKZlXxmbhkX1PiYGbAJjyhMyHb20vpEjL7J2KNl5HPYQb50bg2XF\\/EfZft8tBwnF\\/iZviGufyVzVDUkza213DbPx3g62XLZLA+2xbljR5w\\/DDgkR7zWwVCAd8yt5OO1x8mLJyLjokAiB7BoqC7jU9VlfArAGLqiaR7pSPCT12OsShiMcVn9ci\\/\\/NGMmt465OMcxYnL8z+Y4uwph5C2ntnDvYv+Ysy0cxyU1WRvG2R5qfbBn7KipKsSF07SmIZ\\/M8IfdRzntt6IKl0MEEjfPCx1x7tgZ55cdGbpGdG9ZtodlzeXcOK+C9zf7qdemFyLTjgKJHJpl0VQV4v1VIa5dWMEtT3Ty5R4X1+T4TVuabzaEGGUdsWPG5DKsGhzuobEDZXxh4dhhBGB7zDmqq\\/iiWF6WlFuQNmByrIsaUE1DkQzt\\/Ql+sSPOHW0pXs7uv6x\\/VUWI986r4CNzyzg7pNdWZDpTIJFxs7wBPnNymH\\/viRMB+lN5UnDYQGJZ7L0qNsZQTNmFyeYZKLRQdtBL66GujE2OP3Zki6vLsMBjFVZtA3LF9K5YXi5s9OHty+KYPPe3pYg0hydlGGuyhWfPIDX72B0vmUhz144Yt+9M8Ghs\\/y0BbI+XN80cXnvkPY1epmmnk4gcQB2fUpRIJk+m8HXAa42rd8Ty2dQULm7dtENHEZWmls9mzwrr+WSOVw+RNrrbB\\/nOwBgb543Jpm7PXF3j0FbUeI\\/F8jnlnFlIW91tA\\/xzjzuu53dzeQYmtOJ2KjM8vbmbD26M8fDeMGLRVFPG589oYuNVs3ninBo+qDAickJRIBEAku19nPvMILf35oiN0aKm43E+vzldCCQ2584IjmumjeXzs6wwlOFmkvyiMz\\/u0GD5A7ypcnj3XpNN8LUNKboPerBhe3s\\/b3suzu5i60csL8uq7OF\\/BOPwu7YM8SIe7qms5N8W+PABxs3ynSc7+XRblsgY5zEUS\\/Hj9d0s\\/2MPdx5NQcY04fX7+YuFddx92Wx2XjaDb50UZslEjgGKyJSlIRsZ5uZ5oS3KDW2DfCzk5031AVZU+mjyW9j5PNsG0\\/yhI01boW89VF3JV2aPc1l2y8+7Wn38f9EsOZPnF2s6GOyt4KpaHw3ePQvCWlRVBLmw8oAl6y0\\/Ny4Oc9vqBF3GsHFrF8t6Q1zdEuTkgEUqk+PF7iT39TukLQ9XzfHzZFtq7zDPOE6O82aGadkeo90YXt3SxXnJSm5o9jPbZ+EpnIwdCHBZ\\/WhTnW0uPHUG34p28rmuPPlchtue2c2dG4NcOiPAopBNwLj0JnK80J\\/m2Wh+uDDUDh10pBNJfW0F\\/9IQ5gMzg5O2H4+ITG0KJALsX+eRSmV5ZFeWR0a\\/Jw31lfx0ZQ3njLshsThzcR2f7ermW4Muxslx35YB7jvgPsuXtbJ2qf+gP8qm2Q38Ouby3k0puoyhbyjJj4aS+z\\/a9vLWU2fw35VRlrSN97yGlTfV8t25aa7dniNtXNbtGuLmXfvfxz+jnm0XVNI6WgLz+PnMeS00r+\\/l06+l6XYNA7EUv4qNtWqGRXW5j1knbENssWJ+LStKfRoiMqUokAgAoVmN7Hxrmoe60qzqS\\/NCJMe2ZJ5I3mBsm\\/qQj6W1Qf5iVgUfbPVT7BIQlj\\/ELRe1cv7rUX62O8VzkRxdOUPOMI7hG5s3L23ipeY4t22Nc29vltdSedLY1Jf5OKOxjBtOquTd1TZO5xH88paHd57dyrPNUW7bkeDxwRxtGZeUO55zK\\/D4eO9pLbz1pBR37ohzb3eGdbEc3TmDa9tUBzwsqPRzRn2IS5vDXF7r5cTuIxER2Z9lrpk\\/Was2yEgmyz8+sJt\\/iRiwQ3zvbc38jbYylUmSjw6x8oEBnnPBV1PLukurWaJZtSJSQipqFRERkZLTkM2U4PL6QJonC2URlu1hWa1vWq5nIaXisqU\\/S0+hP9RNOMTVNyoiU4gCyVTgZrj1qQ5uLXxrhyp56Mp6LlL\\/lRwrbpqvr+rijqPZDFBEZAKpyRMREZGSU1GriIiIlJx6SERERKTkFEhERESk5BRIREREpOQUSERERKTkFEhERESk5BRIREREpOQUSERERKTkFEhERESk5BRIREREpOQUSOQ4ZXjshTa8v9qG9avtvH2Hy4mw5LDJJvnQH7Zh\\/Wobc55LEinViTgpPn3f8HnMeDpO54nw4ovIhNLmeiXgZrPc9VqU2ztSvBBz6Hcg5PfQFPaxoj7IRa0VfLDRi69UJ2gcHnotxlMZwPZx1cnlnK6\\/lCnA5dGN\\/fw8CbYvzD8uDR92R2jXcdjQn+ap\\/gzPDWbZFM2xPZlnMG\\/weGwawz5OrQtx5awK3t\\/ko9Ia56l4Q\\/z9sjL+b02CnvYBvtwZ5r9bbMb78AllsvzjA7v5l4jBDlZw\\/9sbuMwGyPPTx9u4sdOAHeLHb2\\/mI8GxD5Ns66bumQTpIp\\/eV1PLukurWTLqi2EYiGd5biDDs\\/1p1vRneHYoR18eDOCvr2PzRVXMH+8LaVzaIpnh4\\/RnWDOQ5sVovrCTs8WiJS1sPDUw\\/g\\/6Y\\/TaiRwJNTOTLDYQ4ZqnBvhT0ux3RZ9JOwylHV4ZSPHbmJd3NlZQX6qTNHke2jrIt2KAHWLmfAWSqSAXifKlbTkcLBYtqOb94cM9wvDnl3Zz+et53FFuzTsu7dEM7dEMf9we4WsNlfzojbW8o2x8rWHTrGo+tjnJv0Ycfr5+iI831XKW+lzHZnJ859Hd3Nzrjvp+FH24bJyr7+3htzlOiN5Bmf7UzEwmJ8WXnunnT8nhD5BgOMi7ZoVYEbaxnTw7oxlWdafZUurzPC5YNNaEee\\/s4Q\\/308usqXF1PmHy\\/L+NEZ7Pg+UN8tmFQYq9QPV6Pcwp9zE7aFPhsXAch22RLFvSBhdDV2+E9zya586LG7k6NI4D2gE+sSjE955NEolE+acdldw73zstx4Etr48Lm\\/zUjuO+3nIflWPclnDMfmHEsmwa\\/YbejCk+pLiGRH7\\/MOLxeqi18vTmij2YSOkpkEyiWFeMO+PDHyDldTU8ckENZx84LuPmeXbQpbwUJ3icOWVePXfOK\\/VZTA4nEuU\\/OoZ7OhpaK7nmsL0jwxpqy\\/lSZZBLZwQ5q9LDQZ0fxuXl9kE+ujbC01nIJeJ8en0Zl7yxjOpxHL95ViXv3pDkpymXh16N8vzc6dlLYofK+MbKWs45yt+tLOTj\\/HCAN9YFOacuwBtrfZjtXSx4IUW22INZFvUVQa6sCfDGugDn1AU5q8rDA6t3cM0u9ZnI8UeBZBJ1xnIkALA4f0EVZ41WJGJ7OLvOM7knJlOc4ZGtMda7gOXl6nnhcYUFsFg+v47lh7yLzSmz6rjbdVi6JkG\\/ga7dcR7MlfHe8RQxeUN8aJaP\\/92Sw4nF+G5nNXe0TsNEcixYPj7z5pl85oAftx\\/p4QLl\\/PyKAy9dFETk+KVAMonC3n1Ff1n32H1wRKJJfrYtzr09GV6OO\\/Q5Bsu2qQ56WVjp5+yGEG9tLeMtlfYob7jh7md2cHWbGf2jzE3x0d9v46Oj3OSfUc+2CyppPcRYSa6vnyV\\/jvC6GXl\\/w\\/auKLe+nuCB\\/iw70wbjsWmp8HN+cxnXzavgkvL9D5qPDHLWg4O8OGq\\/tsWVb5zDPXPHU1RpuGf1Tv5yp4vB5trz5vCLVmjvifGfW+Pc159lR9pg+zwsqgvz\\/pOr+Zsm77iGR7KpFP+9JcqdHRk2J\\/PEsGmtDPDWOVV88aQQTd29tD4Ro89A2ewZ9K8sIzCO45pckv\\/d5ZAHPKEwV9cf+8GpxqYwZ1kJ\\/mTA5HO8moTDVswCYHH2rDBztkbYZvLcsz1Jb2s5Dcf8DEVkulMgmURN9QFOslK8bAyr2xO0z69k1lG1LS5Pb+7mvRtT7D6woc679CSy9CSyPNUZ5z83JvjZO5r4oP9onu8YMA7\\/b20XN27LEhv5cyfP9sEU2wfTbPaGeMsSH5PST2RcVm3s5t0vp+kfmciyDi91RlnXleCB5c3cs8jPocoqujr7uWp1hLXZkdeoebYPJPnBQJJf767l9ycd2SlGOuP8sdCfXzcjzMoJeGGM4xLf+52Fr4i\\/S39tmCtCEX6QhFh3nHvT5XxIMzBEpEgKJJPIW13BXzdEuanHJd49xFc6yvhZq+eIizG72np594YUXYUpfrPqwlw1I8CCoI3XdelN5nipP8VjA87+jf9+LC5Y1swTC0c0pG6WH67p484kYAf44rl1XDlKkLF9PhqKOXljWLOxixu2ZUkBfr+P02p8NPsglXZYN5ilOz\\/6Qz3lFfz0LaERjabhxVd7uKl99Bkk4zwhOtp6uaY9zZDXx8UtIU4P2ziZLH\\/enWJ9xmBMnkc29PKdpla+NEaPQaJ\\/kKuejvCcM\\/x9MBTgqplhlocskskM9+1Ksq5nkOsyXtJFd4wZnuhMF94\\/mzfNKL6Y9fBcHn01yrOFF9IOBDizrIiH2wHeUm\\/zwzYX46S5r8flg7OnyBRgETluKJBMJsvHX62o4n8eHuRF1+Hnz\\/dxac2McUzfHIXJcceWJN0GsGwuXt7C7xf5Ga0dSSXT\\/Or1DLPGGNqvqwhybsWIH7gW9+y9Crc5qTbIecegFXSTMb7cnyUbCHLz6fV8eZaf2hGtlnFyPPj6EHeN9lfp8bKifuQNBqftaGfWGB7blaSqrpr7z6vh0uC+o7lvSHHTY13cFjGYfIafbE\\/zuRXBg9eGcbN8+\\/kh1hbCyIzmOv64sorTR9zxn5em+MLjXdw6mCt+hN\\/NsKqvELpsH2fXHKOG3hji2eFp5r9+LcL3O3KFokqbNy+u4sKiyeOjzQAAE9lJREFUemFsTq\\/142tLk8Xl6Z4MudkhStcZZ7GwPsTlIYPt97NvhMtiZk2Iy40BO8BMlWqNQq+dlI4CySQy2TS3bYzxcuFKNJ9K8ImnB1l0YQ1nFvtOuFmejwzXfVieMB9fMHoYAQiFg3zwDaXvQ3fiWbb4Q9xyYROfrz64WbW8Pi5f1MDlk3hOljfE18+p5dIDXh47GOJflpXxf0\\/H6TPQ1pPmNRM8aLGrRHeEHw4Nvw92sJzvvXH\\/MALgCYa45exqHntorBqYsbnpLM8n95yrn2XF9FwcwBkcYPlDQ7w8RiqybC8XLWngzoW+oj8YZlb5qbXSdBnoG8yw3YRYVKouEsvH9Wc2cf1BN9hc9oYmLjuCQ7qpBH\\/\\/TO7w034ti3MXNfDZuuO0f2gCXjuR8VIgmSRuOslnVvXw\\/SGXusYafrPQ5e9WR9jYP8Q1z\\/t58uwymov8DNtXF2vIHBfF9RanL6rjplHCSKlUN1dy3RhzrCsbQ7zRjnNfHpxEjm2GAwKJ4cn2Qi8VMHdOJe8Yo0rVV1XBRxqG+JvuMYqHx5CPDz8vgCfkZfYETGCxLJtTZ9fwjaUVvLXiyHpgPGEvsyzoMsPn\\/LqhdIFkAhgnx6Pt41ncw8IzWyW9IkdC8\\/Mmg5vlW08Nh5FQTTW\\/O6+GK2fW8vOlQSowbNvZy7WvZkdZotrwwAu7mHdvG\\/MfGuCJkVfXto+lFcOf+MZJ8s0NCbaNUX8xVVh2gOvm+KdQCrZYVh8YcxEry+ulpdDbYfIugwe+vibHs4OFVTctD29uDIw9TGF5OK+++ELddMqhZ08gCXpoPIpG3vYHePf8Cm6cX8GH55bz7uYgiwIWGJf1bYPc9OIQv4oe2Z5AnqCHGYWvXcdhV9GLaojIiW7qtA3T2Ctb+vhanwu2n8+dVcO5PgCL5Ysb+HZfB3\\/dkWfVhm5uqmrhh837F7nmcnl2Jlxs47Jfe2j5uWFhiO+tTdJvDOu2drNoh4+VTSEuqAtwRk2A02p8zClmusQEs8MBzh7PCqCTqDHoOUQqtwjuudEYnANbauOwLVH4oeXl5PJDvdYWcyt8eMniFHF+cWdfQLC8NkdSbrSHXVbG1w6sVnXzrN05yCdfivJs5xDX9qZYe14T35pRZLG1xya89wGGWDG\\/5HHAU1HNk1cc\\/cJoIjI2\\/XtNNDfND15LkwSCjZV8bORwheXjxrPqua7MAjfHj9f08P3o\\/q1eKj\\/8veX37FcACjB3fgN3Lwszt3DZ7eRyPLErytdf6uWdj7Yz77c7aH2wi5teT9N5LDbPOEqeoJemqZOPAIvA0RTnuS6RvSnRpvowC4kFvNa41h0ZKe+OmP1kTcAVhO3hzHn1PPzmapbbYJwM\\/7mmn7szRR7HAu+IQJKbAn9vInJ8USCZYE4kySNJAIt5tYGDutytYBnfPbuSpTa4mRRfeHqAh\\/d0d5s8u9PDDVKgzMecgxpzD+ef0sTmt7XyyxVVXN8cZElo3+Jnxhg6BpN8Z20nZzwZYX2ph3Q8VglnXhyfQt59M4lM3hS98+x4VdRX88XCbr1uKsF3djrFTad2zYgpzRZlmoUhIkVSIJlg+aTDnm0lgp7Rp6lWNdZyx7IgFUA6EuG6NTFecwEnw+qIASxObQhQMcpjYXjdi2sW1XH7+S28fNVcBt7eyv1n13B9nacQAAydnQN8+NXihgvkMGybqr0Nr8vQYWoeM46h2I6H8oBn7zCNyboMTljxss3ymj2zawwv9mVIFfFod8S5WZaHhmK7gkTkhKdAMgkKpafsijtjbKBlsWJxA99uGa5n6O7o4z0bUqxvi3J\\/FixPgPe0+sb9ZlWEA1wxr4bbL57JA4sDhRVGDet2Jcac8ilHwPIyf0\\/hhHHYEj\\/Ui2vYHssVHQj3zF4ByKcdOifw\\/cubfQfP5fIjFqE7PDft0FF4uD1Bs4FEZHrTx8YE85b7mFd4lfu7Ejw01lX0iHoSC8O6V7t404spokDL7Go+eCTb\\/1oeLlhUyfmF53dTDrvH06BZ4LH29eXkFGJGZ\\/k4u9Ye\\/icyeZ7oyYy9Y6vJ81RfjmJHzbzlfpYWxuDcdJZXJ2z2Sp7nB5y9gcnn8xS143Qslt3bExio9LNEnywiUiR9bEwwT0WYtxVmX7ipOF\\/ckKJvjPuOrCcxxpDIg6+sgttODVNzhM\\/vZvN7n8\\/y2mMO++zPpm5PgaZxaEspkYzO4tyZ4b11QTt2RrlnjDGZXCTGf\\/cWtwYJAJ4A51QPD\\/UZN8dL0fEfweTyDIyzECTSM8R\\/dO2Z0WOxou7Qe\\/cc8Ey8PJgrDEdZLKkLjG9fPhGRERRIJpod4G+WhguzSwyvbO3m4udirB+tp8TN83LMxR7xrtheDw2jTK1wkzGuf6yXf9uVoX2My27jZPnBusje1UHrGkIsH887bnlZVrXnyt\\/hd22ZorrvTyTlM6r4WCEwuOk4n3o2wroDxmXcTIqvPBcpepVWACwvlzQV1m4xeZ7qHX8vS7ann8X3dXDDxhh\\/HMqPWhBrHIdHt\\/Zy4ZMRNu3dyybMx+aMf4gQ4\\/Bk7\\/BuxFheLm2apI0RRWRa0Tokk6B5dj23D+R456tZEris39bLGe1DXNgc5k1VXqpw6YhneLgjxfr08FW0xxpeiTUTifBXG8OsXhE8oHfD0N4b4+fdMb7i9XJafZCzqn3MCtqEjEt3PMtDu5O8UDie7Qvxd0tC4+whsThvZpiW7THajeHVLV2cl6zkhmY\\/s30WnkKPgB0IcFm9dwI2e9tfNpVldezgTfReSu3rceiPplnVc2DJsM3s2gDzJ\\/Kv3PbzudOr+MOqIZ53oKujn5X3J7h6dpgVIYtUMsO9bQnWpODU+gA7+jNEiuwmObklzJKNGdYbw+buFLtO8TN3nNOn08k0t29Kc\\/sm8Pm8LKr00RKwCVuGaCrHpkiOnvy+qcWW7eXaM+p4XxFvqptO8XDhl\\/KUhblqCq3Ee6yMe+l4ANvPh06r4W2jvIa9nYN8atv+xeWpxL7vnViMTz6d3m8bCF91JT9aGhql18nw5Cu93Nq\\/\\/x\\/U7gGz9\\/aO9gGuie2\\/+u78OXX8+0yvrkZlylEgmRQeLl3RwmNlfXxgfZzNDjjZHA\\/vjPDwAfe0LJtls2v5r8UWtzzWy+8zhs1be\\/mHllZubRzxwWKxNxjkHYe1XXHWdo3+7P5wiK+c08hnKsffUJQ31fLduWmu3Z4jbVzW7Rri5l0HHHdGPdsuqKR1gtufgY5+LlubOsQMFcMzm7t4y+YDfmz5+NtLZnLLgQu4HGPl9bX8YaXh7asjvJAb3szwjlfS3LHvRGhuqeNn8zNc9lSx82zAW1XO+2uH2NBvyPYnuCdZxafHsaeN5bEIWxArtE+5nMPGfoeNY9w\\/WBbi82c08E\\/NxTVWnR0JnhruHuGUORWcNQ1buvEvHQ\\/Yec47dfRB1kQsxW\\/b02PWGrmZLH9q3\\/\\/WgBPiVkYPJG19Ce46RGFYLJbi7v22+rY4vabmiFbjFZloCiSTxubMhY2sm1XFb7bFuKsrzXNRh96cwfbaNJX5OacxzHvmVXBllY0H+OYpMR55MU3czfHDtQNceWk9lxZqO+xQJfdeGeTxrhR\\/7k3z7GCWLYk8\\/TmXrGVRFfByUnWQi1rKuHFumIXFvtOWh3ee3cqzzVFu25Hg8cEcbRmX1MiFumSv5pY6nr4izI+3RLmzI83mpEscm1lVAa6cW80XFwSp6+qlsM4dPruIkGT5uG5BiG\\/0J4m4GX65K8cnFx9+WMTf1MCOq6pY1ZXiif4MLwzleD3p0JVxSeQNtsemIezjlJogF7eUcd3MYPG7uBqHu3amSTM8G+wjc6fS1gAicjyxzDXz1b6ITILozm5mrE6QBhYsamHziiCHWdx1HyfFJ\\/\\/UyQ8S4K2s5unLa6dET4QzNMgZDw6y3kDT3CY2vzFMdalPSkSOS1PgI03kRGDYEtlTK2BxcpWvuJ4Eb4gvLB6uAXJiMb7TcWSb4B1bLg9uibHJDPeOfHZJSGFERI6YAonIZHCz3N0xvM6HZQe4pKHIzeuAufNq+USlhWXy3PVKlFdLnEjceIxb2oZn18ybV8vHi6hREhE5kAKJyNFyUty6PsrDcXeM\\/V9cntzUx22FmSjVzRW870gWuvME+NKKCuZYkB6I8NX2fAl7SVzu3RThqTzYoXJuWTreGVwiIqNT\\/ZnI0TJ5Ht3Sx82vDDC7NsRbZwQ5rcJDrQcGEllWtcf4TX+eLGD7Q3x9eTnNR\\/hU1c013HGmh0eS4Mk7xPBQeSx\\/l\\/FyHOIVFfzDUqhvqORdEz33W0SmPRW1ihytXJx3\\/L6Hew6zYlmwLMzXVzZyc51d9HCNiMh0p0AicrSMyys9SR7sSfNEX4b1sRy7My4pY1Hm97CgOsjFreX89bwjmH4tInKCUCARERGRklNRq4iIiJScAomIiIiUnAKJiIiIlJwCiYiIiJScAomIiIiUnAKJiIiIlJwCiYiIiJTctFqmKdfXz5I\\/R9huWZR5PTSVeXlDbYh3zq\\/kmlrP+Ld6FxERkUk1rQLJHq5riGUdYlmHrYNpfrstym\\/PbuXXc714Sn1yIiIicpBptVKrcRxeGHJIuC59iRyP7YzwX90OGcATruSPb63nsmkZwURERI5v06p5trxezqjf9yu9a3aQ0IMdfDNqyKdSPDhkuKxe25qJiIhMNdO7qNXj55IGe\\/iXNA5b49OmM0hERGRamd6BBKgLePb+kjHHxS3p2YiIiMhopn0g8Y74DR2lERERkSlp2gcSERERmfoUSERERKTkpnkg2X9GjUpaRUREpqZpHkggYFt7Y0nScRVKREREpqBpH0gaQp7C6qyG7dEcqRKfj4iIiBxs2geSqtogSwu\\/ZaQzxp2J0p6PiIiIHMzz1WU1Xy31SUwkO+CjLpbg7ohLPp\\/jofY0u13I5F3603litodGr1ZvFRERKaVptZfNmFyHR7YO8o3XEjwaH1lHYvGW02fx8ELv9O8qEhERmcJOiHbYzTlsHMqyKamiVhERkaloWm2uNyqT4\\/tPd3Fzz\\/Cy8U2NVfzb0kour\\/Eyw2edGIlMRERkipv2gcQZjPH93uEw4glX8JPz6nibr9RnJSIiIiNN+w6CgaEMOwrjNPVN5VyiMCIiIjLlTPtA0p\\/Zs8Ovxaxy7\\/TvEhIRETkOTftAknPN3kLWkMdCE3xFRESmnmkeSDSnRkRE5HgwzQOJiIiIHA8USERERKTkpn0gcdx9X\\/ts1ZCIiIhMRdM+kPSl8+zJJJU+BRIREZGpaHoHknyGBwqLomF5OblCcURERGQqmlbLcphcjmcGHBKuoT+Z5bGdUX4WG55p4wmHuKJKgURERGQqmlaBxIlE+cCqCK8fMNvXsr2899RqLvCU5rxERETk0KZVINnDsizCPpvmsJ\\/l9SHeNa+C99Z6pvn4lIiIyPHLMtfM1+phIiIiUlLqNBAREZGSUyARERGRklMgERERkZJTIBEREZGSUyARERGRklMgERERkZJTIBEREZGSUyARERGRkitypdY8P328jY90gc+2qAl6mVfp57ymcj46P8zJ03LdVxEREZloR9RDYowhm3fpTmRZ3RnnP17s4vQ\\/D\\/Bk7lifnoiIiJwIilw63tATzbAlC+msw9aBJD\\/eGufFLIDF+afN5NGTfRoHEhERkaIc9V42XTu6WLwmSQQINjew6\\/wK6o\\/RyYmIiMiJ4ag7MxobQ6woHMWJ59iurfpERESkSEcdSGy\\/hzpr+GvXcYkpkIiIiEiRjr7cw7bw7PnaGJyjPqCIiIicaFR\\/KiIiIiWnQCIiIiIld8wDiUpIREREpFjHIJBYBApHMY4hoUQiIiIiRToGgcRDc3D4K+Pm2Jw4+iOKiIjIieUYzLLxsbLWM3wgN8sdr6eJHfVBRURE5ETi+eqymq8e3SEs5pfBgztT7HahfyDBvREXxzXEsnk6M4aqkIfgMTldERERmY6Oeun4PSJDcf59U4SfdmTocff93A5V8tCV9Vyk+TwiIiIyhmMUEwy98SwvDuXodw9\\/bxEREZGRvMfiIJGufi5\\/Oso2A5bXz\\/uW1nDzrCBLwx5C1rF4BhEREZnOjkEgyXPPa\\/HCpnoWK5fO4PbFvmOTdEREROSEcPRDNm6O54fc4QXR7ABXz1IYERERkeIcgxqSPH2Z4a8sj5f5oaM\\/ooiIiJxYjklRa7YwT8fyWCiPiIiISLE0GVdERERKToFERERESk6BREREREruGMyyMTh7j2bhO+oDioiIyInmqAOJm8nTVyhqtb02FVoITURERIp01IGkqzvFS4Xl4n3lPuYrkIiIiEiRilzDzNA5lGZTBjI5h9cGkvzktSQxACze1ByiegJOUkRERKa3IgOJy\\/3ru7ix8+ANgivrqvnXuV5VyYqIiEjRjmiVdwvweGxqg17mV\\/o5v7mCv5oXYoHWjBcREZEjYJlr5h\\/c3SEiIiIyiTTCIiIiIiWnQCIiIiIlp0AiIiIiJadAIiIiIiWnQCIiIiIlp0AiIiIiJadAIiIiIiWnQCIiIiIlp0AiIiIiJadAIiIiIiWnQCIiIiIlp0AiIiIiJadAIiIiIiWnQCIiIiIlp0AiIiIiJadAIiIiIiWnQCIiIiIlp0AiIiIiJadAIiIiIiWnQCIiIiIlp0AiIiIiJadAIiIiIiWnQCIiIiIlp0AiIiIiJadAIiIiIiWnQCIiIiIlp0AiIiIiJadAIiIiIiWnQCIiIiIlp0AiIiIiJadAIiIiIiWnQCIiIiIlp0AiIiIiJadAIiIiIiWnQCIiIiIlp0AiIiIiJff\\/A3CDATORb5nMAAAAAElFTkSuQmCC\\\" alt=\\\"\\\" width=\\\"548\\\" height=\\\"383\\\" \\/>Hello, World!<\\/p>\",\"created_at\":\"2021-09-28 20:33:31\"}],\"new\":{\"key\":\"درباره یوزدکالا\",\"value\":\"<p>لورم ایپسوم<\\/p>\\r\\n\",\"slug\":\"درباره-یوزدکالا\"}}', '/admin/setting/4', '2021-12-14 11:40:23'),
(54, 77, '::1', 'create', 'photos', 196, '', '{\"entity_type\":\"Category\",\"entity_id\":131,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/LD0003959506_2_0003959562_0005140614.---b2a7e5ff.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/131', '2021-12-14 11:49:57'),
(55, 77, '::1', 'create', 'photos', 197, '', '{\"entity_type\":\"Category\",\"entity_id\":130,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/sophos-xg-450-firewall.---5a804d12.png\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/130', '2021-12-14 11:52:22'),
(56, 77, '::1', 'create', 'photos', 198, '', '{\"entity_type\":\"Category\",\"entity_id\":129,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/patch cord.---39d421b6.png\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/129', '2021-12-14 11:53:28'),
(57, 77, '::1', 'create', 'photos', 199, '', '{\"entity_type\":\"Category\",\"entity_id\":128,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/patch panel.---68bc7dff.png\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/128', '2021-12-14 11:54:38'),
(58, 77, '::1', 'create', 'photos', 200, '', '{\"entity_type\":\"Category\",\"entity_id\":127,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/network module.---ef5be843.png\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/127', '2021-12-14 11:56:49'),
(59, 0, '::1', 'create', 'active_codes', 328, '', '{\"user_id\":\"77\",\"code\":5679,\"expired_at\":\"2021-12-14 15:28:33\"}', '/admin/login', '2021-12-14 11:58:32'),
(60, 77, '::1', 'delete', 'active_codes', 0, '{\"user_id\":\"77\"}', '[{\"id\":\"328\",\"user_id\":\"77\",\"code\":\"5679\",\"expired_at\":\"2021-12-14 15:28:33\"}]', '/admin/token', '2021-12-14 11:58:42'),
(61, 0, '::1', 'create', 'active_codes', 329, '', '{\"user_id\":\"77\",\"code\":7534,\"expired_at\":\"2021-12-14 15:28:54\"}', '/login', '2021-12-14 11:58:53'),
(62, 77, '::1', 'delete', 'active_codes', 0, '{\"user_id\":\"77\"}', '[{\"id\":\"329\",\"user_id\":\"77\",\"code\":\"7534\",\"expired_at\":\"2021-12-14 15:28:54\"}]', '/token', '2021-12-14 11:58:59'),
(63, 0, '::1', 'create', 'users', 80, '', '{\"phone\":\"09199837091\"}', '/admin/login', '2021-12-14 12:05:41'),
(64, 0, '::1', 'create', 'active_codes', 330, '', '{\"user_id\":\"80\",\"code\":3641,\"expired_at\":\"2021-12-14 15:35:42\"}', '/admin/login', '2021-12-14 12:05:41'),
(65, 80, '::1', 'delete', 'active_codes', 0, '{\"user_id\":\"80\"}', '[{\"id\":\"330\",\"user_id\":\"80\",\"code\":\"3641\",\"expired_at\":\"2021-12-14 15:35:42\"}]', '/admin/token', '2021-12-14 12:05:48'),
(66, 0, '::1', 'create', 'active_codes', 331, '', '{\"user_id\":\"73\",\"code\":4078,\"expired_at\":\"2021-12-14 15:35:59\"}', '/admin/login', '2021-12-14 12:05:58'),
(67, 0, '::1', 'create', 'active_codes', 332, '', '{\"user_id\":\"80\",\"code\":3339,\"expired_at\":\"2021-12-14 15:36:32\"}', '/admin/login', '2021-12-14 12:06:31'),
(68, 80, '::1', 'delete', 'active_codes', 0, '{\"user_id\":\"80\"}', '[{\"id\":\"332\",\"user_id\":\"80\",\"code\":\"3339\",\"expired_at\":\"2021-12-14 15:36:32\"}]', '/admin/token', '2021-12-14 12:06:38'),
(69, 80, '::1', 'create', 'photos', 201, '', '{\"entity_type\":\"Category\",\"entity_id\":126,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hub dlink.---e5a07762.png\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/126', '2021-12-14 12:09:53'),
(70, 80, '::1', 'create', 'photos', 202, '', '{\"entity_type\":\"Category\",\"entity_id\":125,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/access point.---2e3eebcc.png\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/125', '2021-12-14 12:11:17'),
(71, 80, '::1', 'create', 'photos', 203, '', '{\"entity_type\":\"Category\",\"entity_id\":124,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/cisco router.---0c42e588.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/124', '2021-12-14 12:12:33'),
(72, 80, '::1', 'create', 'photos', 204, '', '{\"entity_type\":\"Category\",\"entity_id\":123,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/Cisco-Catalyst-9600.---b277a54d.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/123', '2021-12-14 12:12:49'),
(73, 80, '::1', 'create', 'photos', 205, '', '{\"entity_type\":\"Category\",\"entity_id\":122,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/server rack.---9830492c.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/122', '2021-12-14 12:13:47'),
(74, 0, '::1', 'create', 'active_codes', 333, '', '{\"user_id\":\"80\",\"code\":9474,\"expired_at\":\"2021-12-14 15:58:59\"}', '/admin/login', '2021-12-14 12:28:58'),
(75, 80, '::1', 'delete', 'active_codes', 0, '{\"user_id\":\"80\"}', '[{\"id\":\"333\",\"user_id\":\"80\",\"code\":\"9474\",\"expired_at\":\"2021-12-14 15:58:59\"}]', '/admin/token', '2021-12-14 12:29:05'),
(76, 0, '::1', 'create', 'active_codes', 334, '', '{\"user_id\":\"80\",\"code\":6743,\"expired_at\":\"2021-12-14 16:00:25\"}', '/admin/login', '2021-12-14 12:30:24'),
(77, 0, '::1', 'create', 'active_codes', 335, '', '{\"user_id\":\"80\",\"code\":3977,\"expired_at\":\"2021-12-14 16:00:44\"}', '/admin/login', '2021-12-14 12:30:43'),
(78, 80, '::1', 'delete', 'active_codes', 0, '{\"user_id\":\"80\"}', '[{\"id\":\"335\",\"user_id\":\"80\",\"code\":\"3977\",\"expired_at\":\"2021-12-14 16:00:44\"},{\"id\":\"334\",\"user_id\":\"80\",\"code\":\"6743\",\"expired_at\":\"2021-12-14 16:00:25\"}]', '/admin/token', '2021-12-14 12:30:54'),
(79, 80, '::1', 'create', 'photos', 206, '', '{\"entity_type\":\"Category\",\"entity_id\":120,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hp disk enclosure.---02c2d0b2.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/120', '2021-12-14 12:32:28'),
(80, 80, '::1', 'create', 'photos', 207, '', '{\"entity_type\":\"Category\",\"entity_id\":118,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/tape library.---5f78f800.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/118', '2021-12-14 12:33:14'),
(81, 80, '::1', 'create', 'photos', 208, '', '{\"entity_type\":\"Category\",\"entity_id\":117,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/storage accessories.---1df4f310.jpeg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/117', '2021-12-14 12:35:58'),
(82, 80, '::1', 'create', 'photos', 209, '', '{\"entity_type\":\"Category\",\"entity_id\":116,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/raid controller.---5cf2d413.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/116', '2021-12-14 12:36:32'),
(83, 80, '::1', 'create', 'photos', 210, '', '{\"entity_type\":\"Category\",\"entity_id\":114,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/3par8000.---c26ad887.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/114', '2021-12-14 12:37:34'),
(84, 80, '::1', 'create', 'photos', 211, '', '{\"entity_type\":\"Category\",\"entity_id\":113,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/bios.---2252c959.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/113', '2021-12-14 12:38:45'),
(85, 80, '::1', 'create', 'photos', 212, '', '{\"entity_type\":\"Category\",\"entity_id\":160,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/storage accessories.---0e7a37fd.jpeg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/160', '2021-12-14 12:39:04'),
(86, 80, '::1', 'create', 'photos', 213, '', '{\"entity_type\":\"Category\",\"entity_id\":159,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/network controller.---d68db64c.png\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/159', '2021-12-14 12:40:15'),
(87, 80, '::1', 'create', 'photos', 214, '', '{\"entity_type\":\"Category\",\"entity_id\":158,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/VMware_FUS4_ENG_M_CP_VMware_Fusion_4_Software_823248.---ace03ad7.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/158', '2021-12-14 12:41:37'),
(88, 80, '::1', 'create', 'photos', 215, '', '{\"entity_type\":\"Category\",\"entity_id\":157,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/storage controller.---85ce8841.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/157', '2021-12-14 12:42:40');
INSERT INTO `activity_log` (`id`, `user_id`, `ip`, `type`, `target_table`, `row_id`, `where_condition`, `detailed_data`, `uri`, `created_at`) VALUES
(89, 80, '::1', 'create', 'photos', 216, '', '{\"entity_type\":\"Category\",\"entity_id\":156,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hba.---056e3f92.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/156', '2021-12-14 12:43:13'),
(90, 80, '::1', 'create', 'photos', 217, '', '{\"entity_type\":\"Category\",\"entity_id\":155,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/power.---81a23f84.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/155', '2021-12-14 12:43:43'),
(91, 80, '::1', 'create', 'photos', 218, '', '{\"entity_type\":\"Category\",\"entity_id\":154,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/optical drive.---dbf9b509.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/154', '2021-12-14 12:44:16'),
(92, 80, '::1', 'create', 'photos', 219, '', '{\"entity_type\":\"Category\",\"entity_id\":153,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/memory upgrade kit.---84912c39.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/153', '2021-12-14 12:45:03'),
(93, 80, '::1', 'create', 'photos', 220, '', '{\"entity_type\":\"Category\",\"entity_id\":152,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hpe hdd.---f0c053f5.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/152', '2021-12-14 12:45:48'),
(94, 80, '::1', 'create', 'photos', 221, '', '{\"entity_type\":\"Category\",\"entity_id\":151,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hpe ram.---3181fc34.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/151', '2021-12-14 12:46:21'),
(95, 80, '::1', 'create', 'photos', 222, '', '{\"entity_type\":\"Category\",\"entity_id\":150,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/heatsink-for-dell-poweredge-r310-r410.---bb94290b.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/150', '2021-12-14 12:47:16'),
(96, 80, '::1', 'create', 'photos', 223, '', '{\"entity_type\":\"Category\",\"entity_id\":149,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/intel-xeon-e5507.---cf3df4b4.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/149', '2021-12-14 12:47:50'),
(97, 80, '::1', 'create', 'photos', 224, '', '{\"entity_type\":\"Category\",\"entity_id\":148,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/fujitsu-server-rx300s7-front-25x12_ml.---52abd9ee.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/148', '2021-12-14 12:48:46'),
(98, 80, '::1', 'create', 'photos', 225, '', '{\"entity_type\":\"Category\",\"entity_id\":112,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/dl380.---5e6533ff.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/112', '2021-12-14 12:49:09'),
(99, 80, '::1', 'update', 'products', 0, '{\"id\":\"92\"}', '{\"old\":[{\"id\":\"92\",\"brand_id\":\"10\",\"user_id\":\"0\",\"title\":\"لایسنس P\\/N:512485-B21 اچ پی ای HPE\",\"title_english\":\"HPE iLO Adv incl 1yr TSU 1-Svr Lic P\\/N:512485-B21\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت لایسنس P\\/N:512485-B21 اچ پی ای HPE | مناسبترین قیمت انواع لایسنس در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت لایسنس P\\/N:512485-B21 اچ پی ای HPE | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"20000000\",\"featured\":null,\"image\":null,\"slug\":\"لایسنس-PN512485-B21-اچ-پی-ای-HPE\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:32\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"لایسنس-PN512485-B21-اچ-پی-ای-HPE\",\"title\":\"لایسنس P\\/N:512485-B21 اچ پی ای HPE\",\"price\":\"20000000\",\"brand_id\":\"10\",\"sku\":\"\",\"weight\":\"0\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت لایسنس P\\/N:512485-B21 اچ پی ای HPE | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت لایسنس P\\/N:512485-B21 اچ پی ای HPE | مناسبترین قیمت انواع لایسنس در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/92', '2021-12-14 12:57:52'),
(100, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":92}', '[{\"id\":\"260\",\"product_id\":\"92\",\"category_id\":\"106\"},{\"id\":\"261\",\"product_id\":\"92\",\"category_id\":\"113\"},{\"id\":\"262\",\"product_id\":\"92\",\"category_id\":\"125\"}]', '/admin/product/92', '2021-12-14 12:57:52'),
(101, 80, '::1', 'create', 'product_categories', 263, '', '{\"product_id\":\"92\",\"category_id\":\"125\"}', '/admin/product/92', '2021-12-14 12:57:52'),
(102, 80, '::1', 'create', 'product_categories', 264, '', '{\"product_id\":\"92\",\"category_id\":\"106\"}', '/admin/product/92', '2021-12-14 12:57:52'),
(103, 80, '::1', 'create', 'product_categories', 265, '', '{\"product_id\":\"92\",\"category_id\":\"113\"}', '/admin/product/92', '2021-12-14 12:57:52'),
(104, 80, '::1', 'create', 'photos', 226, '', '{\"entity_type\":\"Product\",\"entity_id\":92,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hpe license.---a8ef9d31.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/92', '2021-12-14 12:57:52'),
(105, 80, '::1', 'update', 'products', 0, '{\"id\":\"15\"}', '{\"old\":[{\"id\":\"15\",\"brand_id\":\"14\",\"user_id\":\"0\",\"title\":\"پاور سرور  460W Gold Ht Plg اچ پیHP\",\"title_english\":\"HP 460W CS Gold Ht Plg Pwr Supply Kit\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت پاور سرور  460W Gold Ht Plg اچ پیHP | مناسبترین قیمت انواع پاور سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت پاور سرور  460W Gold Ht Plg اچ پیHP | یوزدکالا\",\"meta_title\":null,\"description\":\"<p><span class=\\\"tlid-translation translation\\\" lang=\\\"fa\\\" tabindex=\\\"-1\\\"><span class=\\\"\\\" title=\\\"\\\">منبع تغذیه HP AC - توان خروجی 460W: 460 سازگار با سبز: بله گواهینامه \\/ مرجع انطباق با رنگ سبز: 80 پلاس گواهینامه \\/ مرجع انطباق سبز: ENERGY STAR<\\/span><\\/span><\\/p>\",\"price\":\"3000000\",\"featured\":null,\"image\":null,\"slug\":\"پاور-سرور--460W-Gold-Ht-Plg-اچ-پیHP\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:26\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"پاور-سرور--460W-Gold-Ht-Plg-اچ-پیHP\",\"title\":\"پاور سرور  460W Gold Ht Plg اچ پیHP\",\"price\":\"3000000\",\"brand_id\":\"14\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"<p>منبع تغذیه HP AC - توان خروجی 460W: 460 سازگار با سبز: بله گواهینامه \\/ مرجع انطباق با رنگ سبز: 80 پلاس گواهینامه \\/ مرجع انطباق سبز: ENERGY STAR<\\/p>\\r\\n\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت پاور سرور  460W Gold Ht Plg اچ پیHP | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت پاور سرور  460W Gold Ht Plg اچ پیHP | مناسبترین قیمت انواع پاور سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/15', '2021-12-14 13:06:42'),
(106, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":15}', '[{\"id\":\"48\",\"product_id\":\"15\",\"category_id\":\"106\"},{\"id\":\"49\",\"product_id\":\"15\",\"category_id\":\"113\"},{\"id\":\"50\",\"product_id\":\"15\",\"category_id\":\"155\"}]', '/admin/product/15', '2021-12-14 13:06:42'),
(107, 80, '::1', 'create', 'product_categories', 266, '', '{\"product_id\":\"15\",\"category_id\":\"106\"}', '/admin/product/15', '2021-12-14 13:06:42'),
(108, 80, '::1', 'create', 'product_categories', 267, '', '{\"product_id\":\"15\",\"category_id\":\"113\"}', '/admin/product/15', '2021-12-14 13:06:42'),
(109, 80, '::1', 'create', 'product_categories', 268, '', '{\"product_id\":\"15\",\"category_id\":\"155\"}', '/admin/product/15', '2021-12-14 13:06:42'),
(110, 80, '::1', 'create', 'photos', 227, '', '{\"entity_type\":\"Product\",\"entity_id\":15,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hp power 460w.---92b90b0f.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/15', '2021-12-14 13:06:42'),
(111, 80, '::1', 'update', 'products', 0, '{\"id\":\"21\"}', '{\"old\":[{\"id\":\"21\",\"brand_id\":\"14\",\"user_id\":\"0\",\"title\":\"کابل 5 متری OM4 2f-P\\/N:QK734A اچ پیHP\",\"title_english\":\"HP Premier Flex LC\\/LC OM4 2f 5m Cbl P\\/N:QK734A\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت کابل 5 متری OM4 2f-P\\/N:QK734A اچ پیHP | مناسبترین قیمت انواع کابل در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت کابل 5 متری OM4 2f-P\\/N:QK734A | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"8500000\",\"featured\":null,\"image\":null,\"slug\":\"کابل-5-متری-OM4-2f-PNQK734A-اچ-پیHP\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:27\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"کابل-5-متری-OM4-2f-PNQK734A-اچ-پیHP\",\"title\":\"کابل 5 متری OM4 2f-P\\/N:QK734A اچ پیHP\",\"price\":\"8500000\",\"brand_id\":\"14\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت کابل 5 متری OM4 2f-P\\/N:QK734A | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت کابل 5 متری OM4 2f-P\\/N:QK734A اچ پیHP | مناسبترین قیمت انواع کابل در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/21', '2021-12-14 13:11:19'),
(112, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":21}', '[{\"id\":\"65\",\"product_id\":\"21\",\"category_id\":\"108\"},{\"id\":\"66\",\"product_id\":\"21\",\"category_id\":\"129\"}]', '/admin/product/21', '2021-12-14 13:11:19'),
(113, 80, '::1', 'create', 'product_categories', 269, '', '{\"product_id\":\"21\",\"category_id\":\"108\"}', '/admin/product/21', '2021-12-14 13:11:19'),
(114, 80, '::1', 'create', 'product_categories', 270, '', '{\"product_id\":\"21\",\"category_id\":\"129\"}', '/admin/product/21', '2021-12-14 13:11:19'),
(115, 80, '::1', 'create', 'photos', 228, '', '{\"entity_type\":\"Product\",\"entity_id\":21,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hpe cable 5m.---59876967.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/21', '2021-12-14 13:11:19'),
(116, 80, '::1', 'update', 'products', 0, '{\"id\":\"22\"}', '{\"old\":[{\"id\":\"22\",\"brand_id\":\"14\",\"user_id\":\"0\",\"title\":\"سرور رکمونت DL380p Gen9 HP\",\"title_english\":\"HP ProLiant DL380 Gen9 8SFF Configure-to-order Server P\\/N:719064-B21\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت سرور رکمونت DL380p Gen9 HP | یوزدکالا | بهترین قیمت انواع سرور دست دوم | یوزد کالا\",\"seo_title\":\"خرید و بهترین قیمت سرور رکمونت DL380p Gen9 HP | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"25000000\",\"featured\":null,\"image\":null,\"slug\":\"سرور-رکمونت-DL380p-Gen9-HP\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:27\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"سرور-رکمونت-DL380p-Gen9-HP\",\"title\":\"سرور رکمونت DL380p Gen9 HP\",\"price\":\"25000000\",\"brand_id\":\"14\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت سرور رکمونت DL380p Gen9 HP | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت سرور رکمونت DL380p Gen9 HP | یوزدکالا | بهترین قیمت انواع سرور دست دوم | یوزد کالا\",\"status_related\":\"0\"}}', '/admin/product/22', '2021-12-14 13:12:04'),
(117, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":22}', '[{\"id\":\"67\",\"product_id\":\"22\",\"category_id\":\"106\"},{\"id\":\"68\",\"product_id\":\"22\",\"category_id\":\"148\"}]', '/admin/product/22', '2021-12-14 13:12:04'),
(118, 80, '::1', 'create', 'product_categories', 271, '', '{\"product_id\":\"22\",\"category_id\":\"106\"}', '/admin/product/22', '2021-12-14 13:12:04'),
(119, 80, '::1', 'create', 'product_categories', 272, '', '{\"product_id\":\"22\",\"category_id\":\"148\"}', '/admin/product/22', '2021-12-14 13:12:04'),
(120, 80, '::1', 'create', 'photos', 229, '', '{\"entity_type\":\"Product\",\"entity_id\":22,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/HPE-ProLiant-DL380-Gen9-5.---a69c5196.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/22', '2021-12-14 13:12:04'),
(121, 80, '::1', 'update', 'products', 0, '{\"id\":\"23\"}', '{\"old\":[{\"id\":\"23\",\"brand_id\":\"12\",\"user_id\":\"0\",\"title\":\"سی پی یو سرور 3075\",\"title_english\":\"Intel® Xeon® processor 3075 (2.66GHz, 4MB L2 Cache, 65 Watts, 1333MHz FSB)\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور 3075 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور 3075 اینتل Intel | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"2000000\",\"featured\":null,\"image\":null,\"slug\":\"سی-پی-یو-سرور-3075\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:27\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"سی-پی-یو-سرور-3075\",\"title\":\"سی پی یو سرور 3075\",\"price\":\"2000000\",\"brand_id\":\"12\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور 3075 اینتل Intel | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور 3075 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/23', '2021-12-14 13:12:34'),
(122, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":23}', '[{\"id\":\"69\",\"product_id\":\"23\",\"category_id\":\"113\"},{\"id\":\"70\",\"product_id\":\"23\",\"category_id\":\"149\"}]', '/admin/product/23', '2021-12-14 13:12:34'),
(123, 80, '::1', 'create', 'product_categories', 273, '', '{\"product_id\":\"23\",\"category_id\":\"113\"}', '/admin/product/23', '2021-12-14 13:12:34'),
(124, 80, '::1', 'create', 'product_categories', 274, '', '{\"product_id\":\"23\",\"category_id\":\"149\"}', '/admin/product/23', '2021-12-14 13:12:34'),
(125, 80, '::1', 'create', 'photos', 230, '', '{\"entity_type\":\"Product\",\"entity_id\":23,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/intel-xeon-e5507.---d34123f9.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/23', '2021-12-14 13:12:35'),
(126, 80, '::1', 'update', 'products', 0, '{\"id\":\"24\"}', '{\"old\":[{\"id\":\"24\",\"brand_id\":\"12\",\"user_id\":\"0\",\"title\":\"سی پی یو سرور E5504\",\"title_english\":\"Intel® Xeon® E5504 (2.00GHz\\/4-core\\/4MB\\/80W, DDR3-800) Processor\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور E5504 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور E5504 اینتل Intel | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"2000000\",\"featured\":null,\"image\":null,\"slug\":\"سی-پی-یو-سرور-E5504\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:27\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"سی-پی-یو-سرور-E5504\",\"title\":\"سی پی یو سرور E5504\",\"price\":\"2000000\",\"brand_id\":\"12\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور E5504 اینتل Intel | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور E5504 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/24', '2021-12-14 13:12:53'),
(127, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":24}', '[{\"id\":\"71\",\"product_id\":\"24\",\"category_id\":\"113\"},{\"id\":\"72\",\"product_id\":\"24\",\"category_id\":\"149\"}]', '/admin/product/24', '2021-12-14 13:12:53'),
(128, 80, '::1', 'create', 'product_categories', 275, '', '{\"product_id\":\"24\",\"category_id\":\"113\"}', '/admin/product/24', '2021-12-14 13:12:54'),
(129, 80, '::1', 'create', 'product_categories', 276, '', '{\"product_id\":\"24\",\"category_id\":\"149\"}', '/admin/product/24', '2021-12-14 13:12:54'),
(130, 80, '::1', 'create', 'photos', 231, '', '{\"entity_type\":\"Product\",\"entity_id\":24,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/intel-xeon-e5507.---0d0b5d9a.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/24', '2021-12-14 13:12:54'),
(131, 80, '::1', 'update', 'products', 0, '{\"id\":\"25\"}', '{\"old\":[{\"id\":\"25\",\"brand_id\":\"12\",\"user_id\":\"0\",\"title\":\"سی پی یو سرور 5140\",\"title_english\":\"Intel® Xeon® Processor 5140 (2.33 GHz, 65 Watts, 1333 FSB)\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور 5140 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور 5140 اینتل Intel | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"2000000\",\"featured\":null,\"image\":null,\"slug\":\"سی-پی-یو-سرور-5140\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:27\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"سی-پی-یو-سرور-5140\",\"title\":\"سی پی یو سرور 5140\",\"price\":\"2000000\",\"brand_id\":\"12\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور 5140 اینتل Intel | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور 5140 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/25', '2021-12-14 13:13:12'),
(132, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":25}', '[{\"id\":\"73\",\"product_id\":\"25\",\"category_id\":\"113\"},{\"id\":\"74\",\"product_id\":\"25\",\"category_id\":\"149\"}]', '/admin/product/25', '2021-12-14 13:13:12'),
(133, 80, '::1', 'create', 'product_categories', 277, '', '{\"product_id\":\"25\",\"category_id\":\"113\"}', '/admin/product/25', '2021-12-14 13:13:12'),
(134, 80, '::1', 'create', 'product_categories', 278, '', '{\"product_id\":\"25\",\"category_id\":\"149\"}', '/admin/product/25', '2021-12-14 13:13:12'),
(135, 80, '::1', 'create', 'photos', 232, '', '{\"entity_type\":\"Product\",\"entity_id\":25,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/intel-xeon-e5507.---bd7a069b.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/25', '2021-12-14 13:13:12'),
(136, 80, '::1', 'update', 'products', 0, '{\"id\":\"26\"}', '{\"old\":[{\"id\":\"26\",\"brand_id\":\"12\",\"user_id\":\"0\",\"title\":\"سی پی یو سرور E5335\",\"title_english\":\"Intel® Xeon® Processor E5335 (2.00 GHz, 50 Watts, 1333 FSB, Low Voltage\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور E5335 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور E5335 اینتل Intel | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"2000000\",\"featured\":null,\"image\":null,\"slug\":\"سی-پی-یو-سرور-E5335\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:27\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"سی-پی-یو-سرور-E5335\",\"title\":\"سی پی یو سرور E5335\",\"price\":\"2000000\",\"brand_id\":\"12\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور E5335 اینتل Intel | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور E5335 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/26', '2021-12-14 13:13:36'),
(137, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":26}', '[{\"id\":\"75\",\"product_id\":\"26\",\"category_id\":\"113\"},{\"id\":\"76\",\"product_id\":\"26\",\"category_id\":\"149\"}]', '/admin/product/26', '2021-12-14 13:13:36'),
(138, 80, '::1', 'create', 'product_categories', 279, '', '{\"product_id\":\"26\",\"category_id\":\"113\"}', '/admin/product/26', '2021-12-14 13:13:36'),
(139, 80, '::1', 'create', 'product_categories', 280, '', '{\"product_id\":\"26\",\"category_id\":\"149\"}', '/admin/product/26', '2021-12-14 13:13:36'),
(140, 80, '::1', 'create', 'photos', 233, '', '{\"entity_type\":\"Product\",\"entity_id\":26,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/intel-xeon-e5507.---b5fa15f9.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/26', '2021-12-14 13:13:36'),
(141, 80, '::1', 'update', 'products', 0, '{\"id\":\"27\"}', '{\"old\":[{\"id\":\"27\",\"brand_id\":\"12\",\"user_id\":\"0\",\"title\":\"سی پی یو سرور 5150\",\"title_english\":\"Intel® Xeon® Processor 5150 (2.67 GHz, 65 Watts, 1333 FSB)\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور 5150 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور 5150 اینتل Intel | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"2000000\",\"featured\":null,\"image\":null,\"slug\":\"سی-پی-یو-سرور-5150\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:28\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"سی-پی-یو-سرور-5150\",\"title\":\"سی پی یو سرور 5150\",\"price\":\"2000000\",\"brand_id\":\"12\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور 5150 اینتل Intel | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور 5150 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/27', '2021-12-14 13:13:49'),
(142, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":27}', '[{\"id\":\"77\",\"product_id\":\"27\",\"category_id\":\"113\"},{\"id\":\"78\",\"product_id\":\"27\",\"category_id\":\"149\"}]', '/admin/product/27', '2021-12-14 13:13:50'),
(143, 80, '::1', 'create', 'product_categories', 281, '', '{\"product_id\":\"27\",\"category_id\":\"113\"}', '/admin/product/27', '2021-12-14 13:13:50'),
(144, 80, '::1', 'create', 'product_categories', 282, '', '{\"product_id\":\"27\",\"category_id\":\"149\"}', '/admin/product/27', '2021-12-14 13:13:50'),
(145, 80, '::1', 'create', 'photos', 234, '', '{\"entity_type\":\"Product\",\"entity_id\":27,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/intel-xeon-e5507.---a5b8efda.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/27', '2021-12-14 13:13:50'),
(146, 80, '::1', 'update', 'products', 0, '{\"id\":\"28\"}', '{\"old\":[{\"id\":\"28\",\"brand_id\":\"12\",\"user_id\":\"0\",\"title\":\"سی پی یو سرور E5320\",\"title_english\":\"Intel® Xeon® Processor E5320 (1.86 GHz, 80 Watts, 1066 FSB)\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور E5320 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور E5320 اینتل Intel | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"2000000\",\"featured\":null,\"image\":null,\"slug\":\"سی-پی-یو-سرور-E5320\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:28\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"سی-پی-یو-سرور-E5320\",\"title\":\"سی پی یو سرور E5320\",\"price\":\"2000000\",\"brand_id\":\"12\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور E5320 اینتل Intel | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور E5320 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/28', '2021-12-14 13:15:27'),
(147, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":28}', '[{\"id\":\"79\",\"product_id\":\"28\",\"category_id\":\"113\"},{\"id\":\"80\",\"product_id\":\"28\",\"category_id\":\"149\"}]', '/admin/product/28', '2021-12-14 13:15:27'),
(148, 80, '::1', 'create', 'product_categories', 283, '', '{\"product_id\":\"28\",\"category_id\":\"113\"}', '/admin/product/28', '2021-12-14 13:15:27'),
(149, 80, '::1', 'create', 'product_categories', 284, '', '{\"product_id\":\"28\",\"category_id\":\"149\"}', '/admin/product/28', '2021-12-14 13:15:27'),
(150, 80, '::1', 'create', 'photos', 235, '', '{\"entity_type\":\"Product\",\"entity_id\":28,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/intel-xeon-e5507.---6a08c983.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/28', '2021-12-14 13:15:27'),
(151, 80, '::1', 'update', 'products', 0, '{\"id\":\"29\"}', '{\"old\":[{\"id\":\"29\",\"brand_id\":\"12\",\"user_id\":\"0\",\"title\":\"سی پی یو سرور E5606 \",\"title_english\":\"Intel® Xeon® E5606 (2.13GHz\\/4-core\\/8MB\\/80W)\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور E5606 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور E5606 اینتل Intel | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"2000000\",\"featured\":null,\"image\":null,\"slug\":\"سی-پی-یو-سرور-E5606\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:28\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"سی-پی-یو-سرور-E5606\",\"title\":\"سی پی یو سرور E5606 \",\"price\":\"2000000\",\"brand_id\":\"12\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور E5606 اینتل Intel | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور E5606 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/29', '2021-12-14 13:15:40'),
(152, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":29}', '[{\"id\":\"81\",\"product_id\":\"29\",\"category_id\":\"113\"},{\"id\":\"82\",\"product_id\":\"29\",\"category_id\":\"149\"}]', '/admin/product/29', '2021-12-14 13:15:40'),
(153, 80, '::1', 'create', 'product_categories', 285, '', '{\"product_id\":\"29\",\"category_id\":\"113\"}', '/admin/product/29', '2021-12-14 13:15:40'),
(154, 80, '::1', 'create', 'product_categories', 286, '', '{\"product_id\":\"29\",\"category_id\":\"149\"}', '/admin/product/29', '2021-12-14 13:15:40'),
(155, 80, '::1', 'create', 'photos', 236, '', '{\"entity_type\":\"Product\",\"entity_id\":29,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/intel-xeon-e5507.---1960d2c1.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/29', '2021-12-14 13:15:40'),
(156, 80, '::1', 'update', 'products', 0, '{\"id\":\"30\"}', '{\"old\":[{\"id\":\"30\",\"brand_id\":\"12\",\"user_id\":\"0\",\"title\":\"سی پی یو سرور E5-2640 اینتل intel\",\"title_english\":\"Intel® Xeon® E5-2640 (2.5GHz\\/6-core\\/15MB\\/7.2GT-s QPI\\/95W, DDR3-1333, HT, Turbo2- 3\\/3\\/4\\/4\\/5\\/5)\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور E5-2640 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور E5-2640 اینتل Intel | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"10000000\",\"featured\":null,\"image\":null,\"slug\":\"سی-پی-یو-سرور-E5-2640\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:28\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"سی-پی-یو-سرور-E5-2640\",\"title\":\"سی پی یو سرور E5-2640 اینتل intel\",\"price\":\"10000000\",\"brand_id\":\"12\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور E5-2640 اینتل Intel | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور E5-2640 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/30', '2021-12-14 13:15:54'),
(157, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":30}', '[{\"id\":\"83\",\"product_id\":\"30\",\"category_id\":\"113\"},{\"id\":\"84\",\"product_id\":\"30\",\"category_id\":\"149\"}]', '/admin/product/30', '2021-12-14 13:15:54'),
(158, 80, '::1', 'create', 'product_categories', 287, '', '{\"product_id\":\"30\",\"category_id\":\"113\"}', '/admin/product/30', '2021-12-14 13:15:54'),
(159, 80, '::1', 'create', 'product_categories', 288, '', '{\"product_id\":\"30\",\"category_id\":\"149\"}', '/admin/product/30', '2021-12-14 13:15:54'),
(160, 80, '::1', 'create', 'photos', 237, '', '{\"entity_type\":\"Product\",\"entity_id\":30,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/intel-xeon-e5507.---382efba6.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/30', '2021-12-14 13:15:54'),
(161, 80, '::1', 'update', 'products', 0, '{\"id\":\"31\"}', '{\"old\":[{\"id\":\"31\",\"brand_id\":\"12\",\"user_id\":\"0\",\"title\":\"سی پی یو سرور E5-2650\",\"title_english\":\"Intel® Xeon® E5-2650 (2.0GHz\\/8-core\\/20MB\\/8GT-s QPI\\/95W, DDR3-1600, HT, Turbo2- 4\\/4\\/5\\/5\\/5\\/7\\/8\\/8)\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور E5-2650 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور E5-2650 اینتل Intel | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"12000000\",\"featured\":null,\"image\":null,\"slug\":\"سی-پی-یو-سرور-E5-2650\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:28\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"سی-پی-یو-سرور-E5-2650\",\"title\":\"سی پی یو سرور E5-2650\",\"price\":\"12000000\",\"brand_id\":\"12\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت سی پی یو سرور E5-2650 اینتل Intel | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت سی پی یو سرور E5-2650 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/31', '2021-12-14 13:16:10'),
(162, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":31}', '[{\"id\":\"85\",\"product_id\":\"31\",\"category_id\":\"113\"},{\"id\":\"86\",\"product_id\":\"31\",\"category_id\":\"149\"}]', '/admin/product/31', '2021-12-14 13:16:10'),
(163, 80, '::1', 'create', 'product_categories', 289, '', '{\"product_id\":\"31\",\"category_id\":\"113\"}', '/admin/product/31', '2021-12-14 13:16:10'),
(164, 80, '::1', 'create', 'product_categories', 290, '', '{\"product_id\":\"31\",\"category_id\":\"149\"}', '/admin/product/31', '2021-12-14 13:16:10'),
(165, 80, '::1', 'create', 'photos', 238, '', '{\"entity_type\":\"Product\",\"entity_id\":31,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/intel-xeon-e5507.---b321b46a.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/31', '2021-12-14 13:16:10'),
(166, 80, '::1', 'update', 'products', 0, '{\"id\":\"43\"}', '{\"old\":[{\"id\":\"43\",\"brand_id\":\"14\",\"user_id\":\"0\",\"title\":\"هیت سینک و فن DL380 G10 اچ پی HP\",\"title_english\":\"Heatsink & fan DL380 G10\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت هیت سینک و فن DL380 G10 اچ پی HP | مناسبترین قیمت انواع هیت سینک و فن در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت هیت سینک و فن DL380 G10 اچ پی HP | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"25000000\",\"featured\":null,\"image\":null,\"slug\":\"هیت-سینک-و-فن-DL380-G10-اچ-پی-HP\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:28\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"هیت-سینک-و-فن-DL380-G10-اچ-پی-HP\",\"title\":\"هیت سینک و فن DL380 G10 اچ پی HP\",\"price\":\"25000000\",\"brand_id\":\"14\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت هیت سینک و فن DL380 G10 اچ پی HP | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت هیت سینک و فن DL380 G10 اچ پی HP | مناسبترین قیمت انواع هیت سینک و فن در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/43', '2021-12-14 13:22:51'),
(167, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":43}', '[{\"id\":\"109\",\"product_id\":\"43\",\"category_id\":\"113\"},{\"id\":\"110\",\"product_id\":\"43\",\"category_id\":\"150\"},{\"id\":\"111\",\"product_id\":\"43\",\"category_id\":\"108\"}]', '/admin/product/43', '2021-12-14 13:22:51'),
(168, 80, '::1', 'create', 'product_categories', 291, '', '{\"product_id\":\"43\",\"category_id\":\"108\"}', '/admin/product/43', '2021-12-14 13:22:52'),
(169, 80, '::1', 'create', 'product_categories', 292, '', '{\"product_id\":\"43\",\"category_id\":\"113\"}', '/admin/product/43', '2021-12-14 13:22:52'),
(170, 80, '::1', 'create', 'product_categories', 293, '', '{\"product_id\":\"43\",\"category_id\":\"150\"}', '/admin/product/43', '2021-12-14 13:22:52'),
(171, 80, '::1', 'create', 'photos', 250, '', '{\"entity_type\":\"Product\",\"entity_id\":43,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/dl380p g8 heatsink.---b6701bf9.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/43', '2021-12-14 13:22:52'),
(172, 80, '::1', 'update', 'products', 0, '{\"id\":\"54\"}', '{\"old\":[{\"id\":\"54\",\"brand_id\":\"14\",\"user_id\":\"0\",\"title\":\"رم سرور 16G PC3-14900R اچ پیHP \",\"title_english\":\"HP 16GB (1x16GB) Dual Rank x4 PC3-14900R (DDR3-1866) Registered CAS-13 Memory Kit\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت رم سرور 16G PC3-14900R اچ پیHP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت رم سرور 16G PC3-14900R اچ پیHP | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"15000000\",\"featured\":null,\"image\":null,\"slug\":\"رم-سرور-16G-PC3-14900R-اچ-پیHP\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:29\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"رم-سرور-16G-PC3-14900R-اچ-پیHP\",\"title\":\"رم سرور 16G PC3-14900R اچ پیHP \",\"price\":\"15000000\",\"brand_id\":\"14\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت رم سرور 16G PC3-14900R اچ پیHP | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت رم سرور 16G PC3-14900R اچ پیHP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/54', '2021-12-14 13:24:03'),
(173, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":54}', '[{\"id\":\"142\",\"product_id\":\"54\",\"category_id\":\"113\"},{\"id\":\"143\",\"product_id\":\"54\",\"category_id\":\"151\"},{\"id\":\"144\",\"product_id\":\"54\",\"category_id\":\"108\"}]', '/admin/product/54', '2021-12-14 13:24:04'),
(174, 80, '::1', 'create', 'product_categories', 294, '', '{\"product_id\":\"54\",\"category_id\":\"108\"}', '/admin/product/54', '2021-12-14 13:24:04'),
(175, 80, '::1', 'create', 'product_categories', 295, '', '{\"product_id\":\"54\",\"category_id\":\"113\"}', '/admin/product/54', '2021-12-14 13:24:04'),
(176, 80, '::1', 'create', 'product_categories', 296, '', '{\"product_id\":\"54\",\"category_id\":\"151\"}', '/admin/product/54', '2021-12-14 13:24:04'),
(177, 80, '::1', 'create', 'photos', 261, '', '{\"entity_type\":\"Product\",\"entity_id\":54,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hpe ram.---4bcbe487.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/54', '2021-12-14 13:24:04'),
(178, 80, '::1', 'update', 'products', 0, '{\"id\":\"70\"}', '{\"old\":[{\"id\":\"70\",\"brand_id\":\"14\",\"user_id\":\"0\",\"title\":\"پاور سرور  750W Plat PL Ht Plg اچ پیHP\",\"title_english\":\"HP 750W CS Plat PL Ht Plg Pwr Supply Kit\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت پاور سرور  750W Plat PL Ht Plg اچ پیHP | مناسبترین قیمت انواع پاور سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت پاور سرور  750W Plat PL Ht Plg اچ پیHP | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"3500000\",\"featured\":null,\"image\":null,\"slug\":\"پاور-سرور--750W-Plat-PL-Ht-Plg-اچ-پیHP\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:30\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"پاور-سرور--750W-Plat-PL-Ht-Plg-اچ-پیHP\",\"title\":\"پاور سرور  750W Plat PL Ht Plg اچ پیHP\",\"price\":\"3500000\",\"brand_id\":\"14\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت پاور سرور  750W Plat PL Ht Plg اچ پیHP | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت پاور سرور  750W Plat PL Ht Plg اچ پیHP | مناسبترین قیمت انواع پاور سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/70', '2021-12-14 13:30:13'),
(179, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":70}', '[{\"id\":\"192\",\"product_id\":\"70\",\"category_id\":\"106\"},{\"id\":\"193\",\"product_id\":\"70\",\"category_id\":\"113\"},{\"id\":\"194\",\"product_id\":\"70\",\"category_id\":\"155\"}]', '/admin/product/70', '2021-12-14 13:30:13'),
(180, 80, '::1', 'create', 'product_categories', 297, '', '{\"product_id\":\"70\",\"category_id\":\"106\"}', '/admin/product/70', '2021-12-14 13:30:13'),
(181, 80, '::1', 'create', 'product_categories', 298, '', '{\"product_id\":\"70\",\"category_id\":\"113\"}', '/admin/product/70', '2021-12-14 13:30:13'),
(182, 80, '::1', 'create', 'product_categories', 299, '', '{\"product_id\":\"70\",\"category_id\":\"155\"}', '/admin/product/70', '2021-12-14 13:30:13'),
(183, 80, '::1', 'create', 'photos', 277, '', '{\"entity_type\":\"Product\",\"entity_id\":70,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/HP-750W-Common-Slot-Gold-Hot-Plug-Power-Supply-1.---6db47428.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/70', '2021-12-14 13:30:14'),
(184, 80, '::1', 'update', 'products', 0, '{\"id\":\"71\"}', '{\"old\":[{\"id\":\"71\",\"brand_id\":\"14\",\"user_id\":\"0\",\"title\":\"پاور سرور  800W Plat Ht Plg اچ پیHP\",\"title_english\":\"HP 800W FS Plat Ht Plg Pwr Supply Kit \",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت پاور سرور  800W Plat Ht Plg اچ پیHP | مناسبترین قیمت انواع پاور سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت پاور سرور  800W Plat Ht Plg اچ پیHP | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"30000000\",\"featured\":null,\"image\":null,\"slug\":\"پاور-سرور--800W-Plat-Ht-Plg-اچ-پیHP\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:30\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"پاور-سرور--800W-Plat-Ht-Plg-اچ-پیHP\",\"title\":\"پاور سرور  800W Plat Ht Plg اچ پیHP\",\"price\":\"30000000\",\"brand_id\":\"14\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت پاور سرور  800W Plat Ht Plg اچ پیHP | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت پاور سرور  800W Plat Ht Plg اچ پیHP | مناسبترین قیمت انواع پاور سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/71', '2021-12-14 13:30:58'),
(185, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":71}', '[{\"id\":\"195\",\"product_id\":\"71\",\"category_id\":\"106\"},{\"id\":\"196\",\"product_id\":\"71\",\"category_id\":\"113\"},{\"id\":\"197\",\"product_id\":\"71\",\"category_id\":\"155\"}]', '/admin/product/71', '2021-12-14 13:30:58'),
(186, 80, '::1', 'create', 'product_categories', 300, '', '{\"product_id\":\"71\",\"category_id\":\"106\"}', '/admin/product/71', '2021-12-14 13:30:58'),
(187, 80, '::1', 'create', 'product_categories', 301, '', '{\"product_id\":\"71\",\"category_id\":\"113\"}', '/admin/product/71', '2021-12-14 13:30:58'),
(188, 80, '::1', 'create', 'product_categories', 302, '', '{\"product_id\":\"71\",\"category_id\":\"155\"}', '/admin/product/71', '2021-12-14 13:30:58'),
(189, 80, '::1', 'create', 'photos', 278, '', '{\"entity_type\":\"Product\",\"entity_id\":71,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hpe-power-800w.---46edc4de.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/71', '2021-12-14 13:30:58'),
(190, 80, '::1', 'update', 'products', 0, '{\"id\":\"72\"}', '{\"old\":[{\"id\":\"72\",\"brand_id\":\"14\",\"user_id\":\"0\",\"title\":\"پاور سرور 400W FACTORY LNTEGRATED اچ پیHP\",\"title_english\":\"HP 400W FACTORY LNTEGRATED POWER SUPPLY KIT\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت پاور سرور 400W FACTORY LNTEGRATED اچ پیHP | مناسبترین قیمت انواع پاور سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت پاور سرور 400W FACTORY LNTEGRATED اچ پیHP | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"2000000\",\"featured\":null,\"image\":null,\"slug\":\"پاور-سرور-400W-FACTORY-LNTEGRATED-اچ-پیHP\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:30\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"پاور-سرور-400W-FACTORY-LNTEGRATED-اچ-پیHP\",\"title\":\"پاور سرور 400W FACTORY LNTEGRATED اچ پیHP\",\"price\":\"2000000\",\"brand_id\":\"14\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت پاور سرور 400W FACTORY LNTEGRATED اچ پیHP | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت پاور سرور 400W FACTORY LNTEGRATED اچ پیHP | مناسبترین قیمت انواع پاور سرور در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/72', '2021-12-14 13:31:47'),
(191, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":72}', '[{\"id\":\"198\",\"product_id\":\"72\",\"category_id\":\"106\"},{\"id\":\"199\",\"product_id\":\"72\",\"category_id\":\"113\"},{\"id\":\"200\",\"product_id\":\"72\",\"category_id\":\"155\"}]', '/admin/product/72', '2021-12-14 13:31:47'),
(192, 80, '::1', 'create', 'product_categories', 303, '', '{\"product_id\":\"72\",\"category_id\":\"106\"}', '/admin/product/72', '2021-12-14 13:31:47'),
(193, 80, '::1', 'create', 'product_categories', 304, '', '{\"product_id\":\"72\",\"category_id\":\"113\"}', '/admin/product/72', '2021-12-14 13:31:47'),
(194, 80, '::1', 'create', 'product_categories', 305, '', '{\"product_id\":\"72\",\"category_id\":\"155\"}', '/admin/product/72', '2021-12-14 13:31:47'),
(195, 80, '::1', 'create', 'photos', 279, '', '{\"entity_type\":\"Product\",\"entity_id\":72,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hp-power-400w.---fc7fd57d.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/72', '2021-12-14 13:31:47'),
(196, 80, '::1', 'update', 'products', 0, '{\"id\":\"73\"}', '{\"old\":[{\"id\":\"73\",\"brand_id\":\"14\",\"user_id\":\"0\",\"title\":\"کنترلر E200\\/64MB اچ پی HP\",\"title_english\":\"HP Smart Array E200\\/64MB Controller\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت کنترلر E200\\/64MB اچ پی HP | مناسبترین قیمت انواع کنترلر در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت کنترلر E200\\/64MB اچ پی HP | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"2000000\",\"featured\":null,\"image\":null,\"slug\":\"کنترلر-E20064MB-اچ-پی-HP\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:30\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"کنترلر-E20064MB-اچ-پی-HP\",\"title\":\"کنترلر E200\\/64MB اچ پی HP\",\"price\":\"2000000\",\"brand_id\":\"14\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت کنترلر E200\\/64MB اچ پی HP | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت کنترلر E200\\/64MB اچ پی HP | مناسبترین قیمت انواع کنترلر در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/73', '2021-12-14 13:32:51'),
(197, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":73}', '[{\"id\":\"201\",\"product_id\":\"73\",\"category_id\":\"113\"},{\"id\":\"202\",\"product_id\":\"73\",\"category_id\":\"157\"},{\"id\":\"203\",\"product_id\":\"73\",\"category_id\":\"108\"}]', '/admin/product/73', '2021-12-14 13:32:51'),
(198, 80, '::1', 'create', 'product_categories', 306, '', '{\"product_id\":\"73\",\"category_id\":\"108\"}', '/admin/product/73', '2021-12-14 13:32:51'),
(199, 80, '::1', 'create', 'product_categories', 307, '', '{\"product_id\":\"73\",\"category_id\":\"113\"}', '/admin/product/73', '2021-12-14 13:32:51'),
(200, 80, '::1', 'create', 'product_categories', 308, '', '{\"product_id\":\"73\",\"category_id\":\"157\"}', '/admin/product/73', '2021-12-14 13:32:51'),
(201, 80, '::1', 'create', 'photos', 280, '', '{\"entity_type\":\"Product\",\"entity_id\":73,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hp-e200-g5-fh-pcie-x8-raid-controller-dce.---27c0eaed.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/73', '2021-12-14 13:32:51');
INSERT INTO `activity_log` (`id`, `user_id`, `ip`, `type`, `target_table`, `row_id`, `where_condition`, `detailed_data`, `uri`, `created_at`) VALUES
(202, 80, '::1', 'update', 'products', 0, '{\"id\":\"74\"}', '{\"old\":[{\"id\":\"74\",\"brand_id\":\"14\",\"user_id\":\"0\",\"title\":\"کنترلر P400\\/256MB اچ پی HP\",\"title_english\":\"HP Smart Array P400\\/256MB Controller\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت کنترلر کنترلر P400\\/256MB اچ پی HP | مناسبترین قیمت انواع کنترلر در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت کنترلر P400\\/256MB اچ پی HP | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"2000000\",\"featured\":null,\"image\":null,\"slug\":\"کنترلر-P400256MB-اچ-پی-HP\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:30\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"کنترلر-P400256MB-اچ-پی-HP\",\"title\":\"کنترلر P400\\/256MB اچ پی HP\",\"price\":\"2000000\",\"brand_id\":\"14\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت کنترلر P400\\/256MB اچ پی HP | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت کنترلر کنترلر P400\\/256MB اچ پی HP | مناسبترین قیمت انواع کنترلر در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/74', '2021-12-14 13:33:32'),
(203, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":74}', '[{\"id\":\"204\",\"product_id\":\"74\",\"category_id\":\"106\"},{\"id\":\"205\",\"product_id\":\"74\",\"category_id\":\"113\"},{\"id\":\"206\",\"product_id\":\"74\",\"category_id\":\"157\"}]', '/admin/product/74', '2021-12-14 13:33:32'),
(204, 80, '::1', 'create', 'product_categories', 309, '', '{\"product_id\":\"74\",\"category_id\":\"106\"}', '/admin/product/74', '2021-12-14 13:33:32'),
(205, 80, '::1', 'create', 'product_categories', 310, '', '{\"product_id\":\"74\",\"category_id\":\"113\"}', '/admin/product/74', '2021-12-14 13:33:32'),
(206, 80, '::1', 'create', 'product_categories', 311, '', '{\"product_id\":\"74\",\"category_id\":\"157\"}', '/admin/product/74', '2021-12-14 13:33:32'),
(207, 80, '::1', 'create', 'photos', 281, '', '{\"entity_type\":\"Product\",\"entity_id\":74,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hp-p400.---d4fec46d.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/74', '2021-12-14 13:33:32'),
(208, 80, '::1', 'update', 'products', 0, '{\"id\":\"77\"}', '{\"old\":[{\"id\":\"77\",\"brand_id\":\"10\",\"user_id\":\"0\",\"title\":\"انکلوژر D2700-P\\/N:AJ941A\",\"title_english\":\"HPE D2700 Disk Enclosure\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت انکلوژر D2700-P\\/N:AJ941A | مناسبترین قیمت انواع انکلوژر در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت انکلوژر D2700-P\\/N:AJ941A | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"150000000\",\"featured\":null,\"image\":null,\"slug\":\"انکلوژر-D2700-PNAJ941A\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:30\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"انکلوژر-D2700-PNAJ941A\",\"title\":\"انکلوژر D2700-P\\/N:AJ941A\",\"price\":\"150000000\",\"brand_id\":\"10\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت انکلوژر D2700-P\\/N:AJ941A | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت انکلوژر D2700-P\\/N:AJ941A | مناسبترین قیمت انواع انکلوژر در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/77', '2021-12-14 13:34:51'),
(209, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":77}', '[{\"id\":\"213\",\"product_id\":\"77\",\"category_id\":\"106\"},{\"id\":\"214\",\"product_id\":\"77\",\"category_id\":\"107\"},{\"id\":\"215\",\"product_id\":\"77\",\"category_id\":\"120\"},{\"id\":\"216\",\"product_id\":\"77\",\"category_id\":\"108\"}]', '/admin/product/77', '2021-12-14 13:34:51'),
(210, 80, '::1', 'create', 'product_categories', 312, '', '{\"product_id\":\"77\",\"category_id\":\"108\"}', '/admin/product/77', '2021-12-14 13:34:51'),
(211, 80, '::1', 'create', 'product_categories', 313, '', '{\"product_id\":\"77\",\"category_id\":\"107\"}', '/admin/product/77', '2021-12-14 13:34:51'),
(212, 80, '::1', 'create', 'product_categories', 314, '', '{\"product_id\":\"77\",\"category_id\":\"120\"}', '/admin/product/77', '2021-12-14 13:34:51'),
(213, 80, '::1', 'create', 'product_categories', 315, '', '{\"product_id\":\"77\",\"category_id\":\"106\"}', '/admin/product/77', '2021-12-14 13:34:52'),
(214, 80, '::1', 'create', 'photos', 284, '', '{\"entity_type\":\"Product\",\"entity_id\":77,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hpe-disk-enc.---cfc6639e.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/77', '2021-12-14 13:34:52'),
(215, 80, '::1', 'update', 'products', 0, '{\"id\":\"78\"}', '{\"old\":[{\"id\":\"78\",\"brand_id\":\"14\",\"user_id\":\"0\",\"title\":\"انکلوژر D2600 12lff-P\\/N:AJ940A\",\"title_english\":\"HP D2600 12lff Disk Enclosure P\\/N:AJ940A\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت انکلوژر D2600 12lff | مناسبترین قیمت انواع انکلوژر در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت انکلوژر D2600 12lff | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"170000000\",\"featured\":null,\"image\":null,\"slug\":\"انکلوژر-D2600-12lff\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:30\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"انکلوژر-D2600-12lff\",\"title\":\"انکلوژر D2600 12lff-P\\/N:AJ940A\",\"price\":\"170000000\",\"brand_id\":\"14\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت انکلوژر D2600 12lff | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت انکلوژر D2600 12lff | مناسبترین قیمت انواع انکلوژر در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/78', '2021-12-14 13:35:10'),
(216, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":78}', '[{\"id\":\"217\",\"product_id\":\"78\",\"category_id\":\"106\"},{\"id\":\"218\",\"product_id\":\"78\",\"category_id\":\"107\"},{\"id\":\"219\",\"product_id\":\"78\",\"category_id\":\"120\"},{\"id\":\"220\",\"product_id\":\"78\",\"category_id\":\"108\"}]', '/admin/product/78', '2021-12-14 13:35:10'),
(217, 80, '::1', 'create', 'product_categories', 316, '', '{\"product_id\":\"78\",\"category_id\":\"108\"}', '/admin/product/78', '2021-12-14 13:35:10'),
(218, 80, '::1', 'create', 'product_categories', 317, '', '{\"product_id\":\"78\",\"category_id\":\"107\"}', '/admin/product/78', '2021-12-14 13:35:10'),
(219, 80, '::1', 'create', 'product_categories', 318, '', '{\"product_id\":\"78\",\"category_id\":\"120\"}', '/admin/product/78', '2021-12-14 13:35:11'),
(220, 80, '::1', 'create', 'product_categories', 319, '', '{\"product_id\":\"78\",\"category_id\":\"106\"}', '/admin/product/78', '2021-12-14 13:35:11'),
(221, 80, '::1', 'create', 'photos', 285, '', '{\"entity_type\":\"Product\",\"entity_id\":78,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hpe-disk-enc.---09cbf3fe.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/78', '2021-12-14 13:35:12'),
(222, 80, '::1', 'update', 'products', 0, '{\"id\":\"79\"}', '{\"old\":[{\"id\":\"79\",\"brand_id\":\"14\",\"user_id\":\"0\",\"title\":\"کیج HOTPLUG 2.5 SFF G8 اچ پی HP\",\"title_english\":\"HP CAGE HOTPLUG 2.5 SFF G8\",\"seo_robot\":null,\"seo_canonical\":null,\"seo_H1\":null,\"seo_description\":\"خرید و بهترین قیمت کیج HOTPLUG 2.5 SFF G8 اچ پی HP | مناسبترین قیمت انواع کیج در بازار | فروشگاه آنلاین یوزدکالا\",\"seo_title\":\"خرید و بهترین قیمت کیج HOTPLUG 2.5 SFF G8 اچ پی HP | یوزدکالا\",\"meta_title\":null,\"description\":\"\",\"price\":\"2400000\",\"featured\":null,\"image\":null,\"slug\":\"کیج-HOTPLUG-25-SFF-G8-اچ-پی-HP\",\"sale\":\"0\",\"status\":\"1\",\"status_related\":\"0\",\"sku\":null,\"quantity\":\"0\",\"weight\":null,\"created_at\":\"2021-12-14 14:08:31\",\"updated_at\":null,\"published_at\":null,\"started_at\":null,\"end_at\":null}],\"new\":{\"user_id\":\"80\",\"slug\":\"کیج-HOTPLUG-25-SFF-G8-اچ-پی-HP\",\"title\":\"کیج HOTPLUG 2.5 SFF G8 اچ پی HP\",\"price\":\"2400000\",\"brand_id\":\"14\",\"sku\":\"\",\"weight\":\"\",\"quantity\":\"0\",\"meta_title\":\"\",\"description\":\"\",\"featured\":1,\"sale\":1,\"status\":\"on\",\"seo_H1\":\"\",\"seo_canonical\":\"\",\"seo_title\":\"خرید و بهترین قیمت کیج HOTPLUG 2.5 SFF G8 اچ پی HP | یوزدکالا\",\"seo_robot\":\"0\",\"seo_description\":\"خرید و بهترین قیمت کیج HOTPLUG 2.5 SFF G8 اچ پی HP | مناسبترین قیمت انواع کیج در بازار | فروشگاه آنلاین یوزدکالا\",\"status_related\":\"0\"}}', '/admin/product/79', '2021-12-14 13:36:07'),
(223, 80, '::1', 'delete', 'product_categories', 0, '{\"product_id\":79}', '[{\"id\":\"221\",\"product_id\":\"79\",\"category_id\":\"106\"},{\"id\":\"222\",\"product_id\":\"79\",\"category_id\":\"113\"},{\"id\":\"223\",\"product_id\":\"79\",\"category_id\":\"160\"}]', '/admin/product/79', '2021-12-14 13:36:07'),
(224, 80, '::1', 'create', 'product_categories', 320, '', '{\"product_id\":\"79\",\"category_id\":\"106\"}', '/admin/product/79', '2021-12-14 13:36:07'),
(225, 80, '::1', 'create', 'product_categories', 321, '', '{\"product_id\":\"79\",\"category_id\":\"113\"}', '/admin/product/79', '2021-12-14 13:36:07'),
(226, 80, '::1', 'create', 'product_categories', 322, '', '{\"product_id\":\"79\",\"category_id\":\"160\"}', '/admin/product/79', '2021-12-14 13:36:07'),
(227, 80, '::1', 'create', 'photos', 286, '', '{\"entity_type\":\"Product\",\"entity_id\":79,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hpe-hotplug.---54c8184d.jpg\",\"alt\":\"product_image\",\"type\":0}', '/admin/product/79', '2021-12-14 13:36:07'),
(228, 80, '::1', 'create', 'photos', 299, '', '{\"entity_type\":\"Brand\",\"entity_id\":14,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hp.---f609ff31.png\",\"alt\":\"brand_image\",\"type\":0}', '/admin/brand/14', '2021-12-14 13:59:08'),
(229, 80, '::1', 'create', 'photos', 300, '', '{\"entity_type\":\"Brand\",\"entity_id\":13,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/dell emc.---35ea7b01.png\",\"alt\":\"brand_image\",\"type\":0}', '/admin/brand/13', '2021-12-14 13:59:19'),
(230, 80, '::1', 'create', 'photos', 301, '', '{\"entity_type\":\"Brand\",\"entity_id\":12,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/intel.---cdeea7f9.png\",\"alt\":\"brand_image\",\"type\":0}', '/admin/brand/12', '2021-12-14 13:59:27'),
(231, 80, '::1', 'create', 'photos', 302, '', '{\"entity_type\":\"Brand\",\"entity_id\":11,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/Cisco_logo.svg.---bb349861.png\",\"alt\":\"brand_image\",\"type\":0}', '/admin/brand/11', '2021-12-14 13:59:35'),
(232, 80, '::1', 'create', 'photos', 303, '', '{\"entity_type\":\"Brand\",\"entity_id\":10,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/hpe.---a157fa8c.png\",\"alt\":\"brand_image\",\"type\":0}', '/admin/brand/10', '2021-12-14 13:59:43'),
(233, 80, '::1', 'create', 'role_users', 13, '', '{\"role_id\":\"17\",\"user_id\":\"81\"}', '/admin/access/add_access/role/81', '2021-12-14 14:21:04'),
(234, 80, '::1', 'create', 'role_users', 14, '', '{\"role_id\":\"17\",\"user_id\":\"82\"}', '/admin/access/add_access/role/82', '2021-12-14 14:21:12'),
(235, 80, '::1', 'create', 'role_users', 15, '', '{\"role_id\":\"17\",\"user_id\":\"83\"}', '/admin/access/add_access/role/83', '2021-12-14 14:21:20'),
(236, 80, '::1', 'delete', 'role_users', 0, '{\"id\":\"8\"}', '[{\"id\":\"8\",\"role_id\":\"18\",\"user_id\":\"73\",\"created_at\":\"2021-12-06 12:52:06\",\"updated_at\":null}]', '/admin/access/delete_access/role/8', '2021-12-14 14:21:26'),
(237, 80, '::1', 'delete', 'role_users', 0, '{\"id\":\"7\"}', '[{\"id\":\"7\",\"role_id\":\"15\",\"user_id\":\"73\",\"created_at\":\"2021-12-06 12:36:30\",\"updated_at\":null}]', '/admin/access/delete_access/role/7', '2021-12-14 14:21:31'),
(238, 80, '::1', 'delete', 'role_users', 0, '{\"id\":\"6\"}', '[{\"id\":\"6\",\"role_id\":\"16\",\"user_id\":\"73\",\"created_at\":\"2021-12-06 12:34:00\",\"updated_at\":null}]', '/admin/access/delete_access/role/6', '2021-12-14 14:21:35'),
(239, 80, '::1', 'create', 'role_users', 16, '', '{\"role_id\":\"17\",\"user_id\":\"84\"}', '/admin/access/add_access/role/84', '2021-12-14 14:22:20'),
(240, 0, '127.0.0.1', 'create', 'active_codes', 336, '', '{\"user_id\":\"81\",\"code\":5246,\"expired_at\":\"2021-12-18 08:24:02\"}', '/admin/login', '2021-12-18 04:54:01'),
(241, 0, '127.0.0.1', 'create', 'active_codes', 337, '', '{\"user_id\":\"81\",\"code\":4395,\"expired_at\":\"2021-12-18 08:24:32\"}', '/admin/login', '2021-12-18 04:54:31'),
(242, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"337\",\"user_id\":\"81\",\"code\":\"4395\",\"expired_at\":\"2021-12-18 08:24:32\"},{\"id\":\"336\",\"user_id\":\"81\",\"code\":\"5246\",\"expired_at\":\"2021-12-18 08:24:02\"}]', '/admin/token', '2021-12-18 04:54:38'),
(243, 0, '127.0.0.1', 'create', 'active_codes', 338, '', '{\"user_id\":\"81\",\"code\":2436,\"expired_at\":\"2021-12-18 13:09:08\"}', '/admin/login', '2021-12-18 09:39:07'),
(244, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"338\",\"user_id\":\"81\",\"code\":\"2436\",\"expired_at\":\"2021-12-18 13:09:08\"}]', '/admin/token', '2021-12-18 09:39:19'),
(245, 0, '127.0.0.1', 'create', 'active_codes', 339, '', '{\"user_id\":\"81\",\"code\":9087,\"expired_at\":\"2021-12-19 08:26:55\"}', '/admin/login', '2021-12-19 04:56:54'),
(246, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"339\",\"user_id\":\"81\",\"code\":\"9087\",\"expired_at\":\"2021-12-19 08:26:55\"}]', '/admin/token', '2021-12-19 04:57:02'),
(247, 0, '127.0.0.1', 'create', 'active_codes', 340, '', '{\"user_id\":\"81\",\"code\":6826,\"expired_at\":\"2021-12-19 12:07:49\"}', '/admin/login', '2021-12-19 08:37:48'),
(248, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"340\",\"user_id\":\"81\",\"code\":\"6826\",\"expired_at\":\"2021-12-19 12:07:49\"}]', '/admin/token', '2021-12-19 08:47:01'),
(249, 0, '127.0.0.1', 'create', 'active_codes', 341, '', '{\"user_id\":\"81\",\"code\":6289,\"expired_at\":\"2021-12-25 08:16:50\"}', '/admin/login', '2021-12-25 04:46:49'),
(250, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"341\",\"user_id\":\"81\",\"code\":\"6289\",\"expired_at\":\"2021-12-25 08:16:50\"}]', '/admin/token', '2021-12-25 04:46:58'),
(251, 81, '127.0.0.1', 'create', 'discounts', 24, '', '{\"user_id\":\"81\",\"start_at\":\"2021-12-25 08:19:49\",\"finish_at\":\"2022-01-03 08:19:49\",\"code\":\"553022\",\"title\":\"fff\",\"description\":\"dd\",\"percent\":\"5\",\"status\":0}', '/admin/discount', '2021-12-25 04:50:19'),
(252, 81, '127.0.0.1', 'create', 'product_discounts', 120, '', '{\"discount_id\":\"24\",\"product_id\":\"92\"}', '/admin/discount', '2021-12-25 04:50:19'),
(253, 81, '127.0.0.1', 'delete', 'category_discounts', 0, '{\"discount_id\":{\"_method\":\"delete\",\"id\":\"24\"}}', '[]', '/admin/discount/24', '2021-12-25 05:30:11'),
(254, 81, '127.0.0.1', 'delete', 'product_discounts', 0, '{\"discount_id\":{\"_method\":\"delete\",\"id\":\"24\"}}', '[{\"id\":\"120\",\"product_id\":\"92\",\"discount_id\":\"24\"}]', '/admin/discount/24', '2021-12-25 05:30:11'),
(255, 81, '127.0.0.1', 'delete', 'discounts', 0, '{\"id\":{\"_method\":\"delete\",\"id\":\"24\"}}', '[{\"id\":\"24\",\"title\":\"fff\",\"user_id\":\"81\",\"code\":\"553022\",\"type\":null,\"percent\":\"5\",\"description\":\"dd\",\"status\":\"0\",\"start_at\":\"2021-12-25 08:19:49\",\"finish_at\":\"2022-01-03 08:19:49\",\"updated_at\":null,\"created_at\":\"2021-12-25 08:20:19\"}]', '/admin/discount/24', '2021-12-25 05:30:11'),
(256, 81, '127.0.0.1', 'create', 'discounts', 25, '', '{\"user_id\":\"81\",\"start_at\":\"2021-12-25 09:00:14\",\"finish_at\":\"2022-01-20 09:00:14\",\"code\":\"578022\",\"title\":\"یلدا \",\"description\":\"یلدا \",\"percent\":\"7\",\"status\":0}', '/admin/discount', '2021-12-25 05:30:59'),
(257, 81, '127.0.0.1', 'create', 'product_discounts', 121, '', '{\"discount_id\":\"25\",\"product_id\":\"84\"}', '/admin/discount', '2021-12-25 05:30:59'),
(258, 81, '127.0.0.1', 'create', 'discounts', 26, '', '{\"user_id\":\"81\",\"start_at\":\"2021-12-25 09:42:07\",\"finish_at\":\"2022-01-20 09:42:07\",\"code\":\"688283\",\"title\":\"یلدا 2\",\"description\":\"یلدا 2\",\"percent\":\"10\",\"status\":0}', '/admin/discount', '2021-12-25 06:12:56'),
(259, 81, '127.0.0.1', 'create', 'product_discounts', 122, '', '{\"discount_id\":\"26\",\"product_id\":\"83\"}', '/admin/discount', '2021-12-25 06:12:56'),
(260, 81, '127.0.0.1', 'create', 'discounts', 27, '', '{\"user_id\":\"81\",\"start_at\":\"2021-12-25 09:43:24\",\"finish_at\":\"2021-12-25 09:43:24\",\"code\":\"271451\",\"title\":\"یلدا3\",\"description\":\"یلدا3\",\"percent\":\"50\",\"status\":\"on\"}', '/admin/discount', '2021-12-25 06:16:25'),
(261, 81, '127.0.0.1', 'create', 'product_discounts', 123, '', '{\"discount_id\":\"27\",\"product_id\":\"85\"}', '/admin/discount', '2021-12-25 06:16:25'),
(262, 81, '127.0.0.1', 'delete', 'category_discounts', 0, '{\"discount_id\":{\"_method\":\"delete\",\"id\":\"27\"}}', '[]', '/admin/discount/27', '2021-12-25 06:16:50'),
(263, 81, '127.0.0.1', 'delete', 'product_discounts', 0, '{\"discount_id\":{\"_method\":\"delete\",\"id\":\"27\"}}', '[{\"id\":\"123\",\"product_id\":\"85\",\"discount_id\":\"27\"}]', '/admin/discount/27', '2021-12-25 06:16:50'),
(264, 81, '127.0.0.1', 'delete', 'discounts', 0, '{\"id\":{\"_method\":\"delete\",\"id\":\"27\"}}', '[{\"id\":\"27\",\"title\":\"یلدا3\",\"user_id\":\"81\",\"code\":\"271451\",\"type\":null,\"percent\":\"50\",\"description\":\"یلدا3\",\"status\":\"1\",\"start_at\":\"2021-12-25 09:46:42\",\"finish_at\":\"2021-12-25 09:43:24\",\"updated_at\":null,\"created_at\":\"2021-12-25 09:46:25\"}]', '/admin/discount/27', '2021-12-25 06:16:50'),
(265, 81, '127.0.0.1', 'create', 'discounts', 28, '', '{\"user_id\":\"81\",\"start_at\":\"2021-12-25 09:46:51\",\"finish_at\":\"2022-01-20 09:46:51\",\"code\":\"525516\",\"title\":\"یلدا3\",\"description\":\"یلدا3\",\"percent\":\"50\",\"status\":\"on\"}', '/admin/discount', '2021-12-25 06:17:07'),
(266, 81, '127.0.0.1', 'create', 'product_discounts', 124, '', '{\"discount_id\":\"28\",\"product_id\":\"85\"}', '/admin/discount', '2021-12-25 06:17:07'),
(267, 81, '127.0.0.1', 'delete', 'category_discounts', 0, '{\"discount_id\":{\"_method\":\"delete\",\"id\":\"28\"}}', '[]', '/admin/discount/28', '2021-12-25 06:20:52'),
(268, 81, '127.0.0.1', 'delete', 'product_discounts', 0, '{\"discount_id\":{\"_method\":\"delete\",\"id\":\"28\"}}', '[{\"id\":\"124\",\"product_id\":\"85\",\"discount_id\":\"28\"}]', '/admin/discount/28', '2021-12-25 06:20:52'),
(269, 81, '127.0.0.1', 'delete', 'discounts', 0, '{\"id\":{\"_method\":\"delete\",\"id\":\"28\"}}', '[{\"id\":\"28\",\"title\":\"یلدا3\",\"user_id\":\"81\",\"code\":\"525516\",\"type\":null,\"percent\":\"50\",\"description\":\"یلدا3\",\"status\":\"0\",\"start_at\":\"2021-12-25 09:46:51\",\"finish_at\":\"2022-01-20 09:46:51\",\"updated_at\":null,\"created_at\":\"2021-12-25 09:47:07\"}]', '/admin/discount/28', '2021-12-25 06:20:52'),
(270, 81, '127.0.0.1', 'create', 'discounts', 29, '', '{\"user_id\":\"81\",\"start_at\":\"2021-12-25 09:50:54\",\"finish_at\":\"2022-01-20 09:50:54\",\"code\":\"692111\",\"title\":\"یلدا 3\",\"description\":\"یلدا 3\",\"percent\":\"50\",\"status\":\"1\"}', '/admin/discount', '2021-12-25 06:21:16'),
(271, 81, '127.0.0.1', 'create', 'product_discounts', 125, '', '{\"discount_id\":\"29\",\"product_id\":\"85\"}', '/admin/discount', '2021-12-25 06:21:16'),
(272, 0, '127.0.0.1', 'create', 'active_codes', 342, '', '{\"user_id\":\"81\",\"code\":4415,\"expired_at\":\"2021-12-25 16:31:14\"}', '/admin/login', '2021-12-25 13:01:13'),
(273, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"342\",\"user_id\":\"81\",\"code\":\"4415\",\"expired_at\":\"2021-12-25 16:31:14\"}]', '/admin/token', '2021-12-25 13:01:23'),
(274, 0, '127.0.0.1', 'create', 'active_codes', 343, '', '{\"user_id\":\"81\",\"code\":2955,\"expired_at\":\"2021-12-26 08:23:10\"}', '/admin/login', '2021-12-26 04:53:09'),
(275, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"343\",\"user_id\":\"81\",\"code\":\"2955\",\"expired_at\":\"2021-12-26 08:23:10\"}]', '/admin/token', '2021-12-26 04:53:23'),
(276, 0, '127.0.0.1', 'create', 'active_codes', 344, '', '{\"user_id\":\"81\",\"code\":1638,\"expired_at\":\"2021-12-26 10:49:51\"}', '/admin/login', '2021-12-26 07:19:50'),
(277, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"344\",\"user_id\":\"81\",\"code\":\"1638\",\"expired_at\":\"2021-12-26 10:49:51\"}]', '/admin/token', '2021-12-26 07:19:59'),
(278, 81, '127.0.0.1', 'create', 'coupons', 1, '', '{\"user_id\":\"81\",\"start_at\":\"2021-12-26 11:18:47\",\"finish_at\":\"2021-12-26 11:18:47\",\"code\":\"338918\",\"title\":\"ماه رمضان\",\"description\":\"ماه رمضان\",\"percent\":\"5\",\"status\":\"1\"}', '/admin/coupon', '2021-12-26 07:48:52'),
(279, 81, '127.0.0.1', 'update', 'coupons', 0, '{\"id\":\"1\"}', '{\"old\":[{\"id\":\"1\",\"title\":\"ماه رمضان\",\"user_id\":\"81\",\"code\":\"338918\",\"type\":null,\"percent\":\"5\",\"description\":\"ماه رمضان\",\"status\":\"1\",\"start_at\":\"2021-12-26 11:18:47\",\"finish_at\":\"2021-12-26 11:18:47\",\"updated_at\":null,\"created_at\":\"2021-12-26 11:18:52\"}],\"new\":{\"user_id\":\"81\",\"start_at\":\"2021-12-26 11:18:47\",\"finish_at\":\"2021-12-26 11:18:47\",\"code\":\"338918\",\"title\":\"ماه رمضان\",\"description\":\"ماه رمضان\",\"percent\":\"5\",\"status\":1}}', '/admin/coupon/1', '2021-12-26 08:54:02'),
(280, 81, '127.0.0.1', 'update', 'coupons', 0, '{\"id\":\"1\"}', '{\"old\":[{\"id\":\"1\",\"title\":\"ماه رمضان\",\"user_id\":\"81\",\"code\":\"338918\",\"type\":null,\"percent\":\"5\",\"description\":\"ماه رمضان\",\"status\":\"1\",\"start_at\":\"2021-12-26 11:18:47\",\"finish_at\":\"2021-12-26 11:18:47\",\"updated_at\":null,\"created_at\":\"2021-12-26 11:18:52\"}],\"new\":{\"user_id\":\"81\",\"start_at\":\"2021-12-26 11:18:47\",\"finish_at\":\"2021-12-26 11:18:47\",\"code\":\"338918\",\"title\":\"ماه رمضان\",\"description\":\"ماه رمضان\",\"percent\":\"5\",\"status\":1}}', '/admin/coupon/1', '2021-12-26 08:54:15'),
(281, 81, '127.0.0.1', 'delete', 'product_coupons', 0, '{\"product_id\":1}', '[]', '/admin/coupon/1', '2021-12-26 08:54:15'),
(282, 81, '127.0.0.1', 'create', 'product_coupons', 1, '', '{\"coupon_id\":{\"_method\":\"patch\",\"start_at\":\"1640504927\",\"finish_at\":\"1640504927\",\"coupon-code\":\"338918\",\"coupon-title\":\"ماه رمضان\",\"coupon-percent\":\"5\",\"coupon-product\":[\"83\"],\"coupon-description\":\"ماه رمضان\",\"coupon-status\":\"on\",\"id\":\"1\"},\"product_id\":\"83\"}', '/admin/coupon/1', '2021-12-26 08:54:15'),
(283, 81, '127.0.0.1', 'create', 'coupons', 2, '', '{\"user_id\":\"81\",\"start_at\":\"2021-12-26 13:19:25\",\"finish_at\":\"2022-01-19 13:19:25\",\"code\":\"112218\",\"title\":\"رمضان 2\",\"description\":\"رمضان 2\",\"percent\":\"15\",\"status\":\"1\"}', '/admin/coupon', '2021-12-26 09:49:56'),
(284, 81, '127.0.0.1', 'create', 'product_coupons', 2, '', '{\"coupon_id\":\"2\",\"product_id\":\"83\"}', '/admin/coupon', '2021-12-26 09:49:56'),
(285, 81, '127.0.0.1', 'create', 'samples', 2, '', '{\"user_id\":\"81\",\"start_at\":\"2021-12-27 09:36:33\",\"finish_at\":\"2022-01-19 09:36:33\",\"code\":\"983073\",\"title\":\"sss\",\"description\":\"111\",\"percent\":\"10\",\"status\":0}', '/admin/sample', '2021-12-27 06:07:56'),
(286, 81, '127.0.0.1', 'create', 'product_samples', 4, '', '{\"sample_id\":\"2\",\"product_id\":\"90\"}', '/admin/sample', '2021-12-27 06:07:56'),
(287, 81, '127.0.0.1', 'create', 'samples', 3, '', '{\"user_id\":\"81\",\"start_at\":\"2021-12-27 09:51:40\",\"finish_at\":\"2022-01-20 09:51:40\",\"start_price\":\"1000000\",\"finish_price\":\"2000000\",\"code\":\"908705\",\"title\":\"عید\",\"description\":\"عید\",\"percent\":\"10\",\"status\":0}', '/admin/sample', '2021-12-27 06:25:50'),
(288, 81, '127.0.0.1', 'create', 'product_samples', 5, '', '{\"sample_id\":\"3\",\"product_id\":\"92\"}', '/admin/sample', '2021-12-27 06:25:50'),
(289, 81, '127.0.0.1', 'update', 'samples', 0, '{\"id\":\"3\"}', '{\"old\":[{\"id\":\"3\",\"title\":\"عید\",\"user_id\":\"81\",\"code\":\"908705\",\"type\":null,\"percent\":\"10\",\"description\":\"عید\",\"status\":\"0\",\"start_price\":\"1000000\",\"finish_price\":\"2000000\",\"start_at\":\"2021-12-27 09:51:40\",\"finish_at\":\"2022-01-20 09:51:40\",\"updated_at\":null,\"created_at\":\"2021-12-27 09:55:50\"}],\"new\":{\"user_id\":\"81\",\"start_at\":\"2021-12-27 09:51:40\",\"finish_at\":\"2022-01-20 09:51:40\",\"start_price\":\"11111111\",\"finish_price\":\"222222222\",\"code\":\"908705\",\"title\":\"عید\",\"description\":\"عید\",\"percent\":\"10\",\"status\":1}}', '/admin/sample/3', '2021-12-27 06:32:43'),
(290, 81, '127.0.0.1', 'update', 'samples', 0, '{\"id\":\"3\"}', '{\"old\":[{\"id\":\"3\",\"title\":\"عید\",\"user_id\":\"81\",\"code\":\"908705\",\"type\":null,\"percent\":\"10\",\"description\":\"عید\",\"status\":\"1\",\"start_price\":\"11111111\",\"finish_price\":\"222222222\",\"start_at\":\"2021-12-27 09:51:40\",\"finish_at\":\"2022-01-20 09:51:40\",\"updated_at\":null,\"created_at\":\"2021-12-27 09:55:50\"}],\"new\":{\"user_id\":\"81\",\"start_at\":\"2021-12-27 09:51:40\",\"finish_at\":\"2022-01-20 09:51:40\",\"start_price\":\"11111111\",\"finish_price\":\"222222222\",\"code\":\"908705\",\"title\":\"عید\",\"description\":\"عید\",\"percent\":\"10\",\"status\":1}}', '/admin/sample/3', '2021-12-27 06:39:25'),
(291, 81, '127.0.0.1', 'delete', 'product_samples', 0, '{\"sample_id\":\"3\"}', '[{\"id\":\"5\",\"sample_id\":\"3\",\"product_id\":\"92\"}]', '/admin/sample/3', '2021-12-27 06:39:25'),
(292, 81, '127.0.0.1', 'create', 'product_samples', 6, '', '{\"sample_id\":\"3\",\"product_id\":\"92\"}', '/admin/sample/3', '2021-12-27 06:39:25'),
(293, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"4\"}', '{\"old\":[{\"id\":\"4\",\"user_id\":\"76\",\"user_full_name\":\"\",\"user_phone\":\"09369532227\",\"city_id\":\"301\",\"province_id\":\"8\",\"postal_code\":\"12345678\",\"address\":\"تهرانپارس،\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"2\",\"grand_total\":\"240000000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":\"73\",\"sender_id\":\"73\",\"status\":\"2\",\"created_at\":\"2021-11-30 13:19:52\",\"updated_at\":null}],\"new\":{\"sender_id\":\"81\",\"status\":3}}', '/admin/order/status/4', '2021-12-27 06:41:23'),
(294, 0, '127.0.0.1', 'create', 'active_codes', 345, '', '{\"user_id\":\"81\",\"code\":7958,\"expired_at\":\"2021-12-27 11:13:59\"}', '/admin/login', '2021-12-27 07:43:58'),
(295, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"345\",\"user_id\":\"81\",\"code\":\"7958\",\"expired_at\":\"2021-12-27 11:13:59\"}]', '/admin/token', '2021-12-27 07:44:14'),
(296, 81, '127.0.0.1', 'update', 'samples', 0, '{\"id\":\"3\"}', '{\"old\":[{\"id\":\"3\",\"title\":\"عید\",\"user_id\":\"81\",\"code\":\"908705\",\"type\":null,\"percent\":\"10\",\"description\":\"عید\",\"status\":\"1\",\"start_price\":\"11111111\",\"finish_price\":\"222222222\",\"start_at\":\"2021-12-27 09:51:40\",\"finish_at\":\"2022-01-20 09:51:40\",\"updated_at\":null,\"created_at\":\"2021-12-27 09:55:50\"}],\"new\":{\"user_id\":\"81\",\"start_at\":\"2021-12-27 09:51:40\",\"finish_at\":\"2022-01-20 09:51:40\",\"start_price\":\"11111111\",\"finish_price\":\"222222222\",\"code\":\"908705\",\"title\":\"عید\",\"description\":\"عیدبب\",\"percent\":\"10\",\"status\":1}}', '/admin/sample/3', '2021-12-27 07:50:04'),
(297, 81, '127.0.0.1', 'delete', 'product_samples', 0, '{\"sample_id\":\"3\"}', '[{\"id\":\"6\",\"sample_id\":\"3\",\"product_id\":\"92\"}]', '/admin/sample/3', '2021-12-27 07:50:04'),
(298, 81, '127.0.0.1', 'create', 'product_samples', 7, '', '{\"sample_id\":\"3\",\"product_id\":\"92\"}', '/admin/sample/3', '2021-12-27 07:50:04'),
(299, 81, '127.0.0.1', 'delete', 'product_samples', 0, '{\"sample_id\":\"3\"}', '[{\"id\":\"7\",\"sample_id\":\"3\",\"product_id\":\"92\"}]', '/admin/sample/3', '2021-12-27 07:53:20'),
(300, 81, '127.0.0.1', 'delete', 'samples', 0, '{\"id\":\"3\"}', '[{\"id\":\"3\",\"title\":\"عید\",\"user_id\":\"81\",\"code\":\"908705\",\"type\":null,\"percent\":\"10\",\"description\":\"عیدبب\",\"status\":\"1\",\"start_price\":\"11111111\",\"finish_price\":\"222222222\",\"start_at\":\"2021-12-27 09:51:40\",\"finish_at\":\"2022-01-20 09:51:40\",\"updated_at\":null,\"created_at\":\"2021-12-27 09:55:50\"}]', '/admin/sample/3', '2021-12-27 07:53:20'),
(301, 81, '127.0.0.1', 'create', 'categories', 168, '', '{\"type\":0,\"seo_description\":\"پرفروش ترین ها\",\"seo_title\":\"پرفروش ترین ها\",\"parent_id\":\"0\",\"name\":\"پرفروش ترین ها\",\"H1\":\"پرفروش ترین ها\",\"robots\":\"0\",\"canonical\":\"\",\"description\":\"پرفروش ترین ها\",\"status\":\"1\",\"slug\":\"پرفروش-ترین-ها\"}', '/admin/category/0', '2021-12-27 08:47:30'),
(302, 81, '127.0.0.1', 'create', 'photos', 304, '', '{\"entity_type\":\"Category\",\"entity_id\":168,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/Screenshot from 2021-12-27 10-48-46.---807b98fc.png\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0', '2021-12-27 08:47:31'),
(303, 81, '127.0.0.1', 'create', 'categories', 169, '', '{\"type\":0,\"seo_description\":\"پرفروش ترین ها\",\"seo_title\":\"پرفروش ترین ها\",\"parent_id\":\"0\",\"name\":\"پرفروش ترین ها\",\"H1\":\"پرفروش ترین ها\",\"robots\":\"0\",\"canonical\":\"\",\"description\":\"پرفروش ترین ها\",\"status\":\"1\",\"slug\":\"پرفروش-ترین-ها\"}', '/admin/category/0', '2021-12-27 09:02:04'),
(304, 81, '127.0.0.1', 'create', 'photos', 305, '', '{\"entity_type\":\"Category\",\"entity_id\":169,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/Screenshot from 2021-12-16 09-34-22.---f0891fdd.png\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0', '2021-12-27 09:02:04'),
(305, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"169\"}', '[{\"id\":\"169\",\"status\":\"1\",\"description\":\"پرفروش ترین ها\",\"type\":\"0\",\"H1\":\"پرفروش ترین ها\",\"canonical\":\"\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"پرفروش ترین ها\",\"slug\":\"پرفروش-ترین-ها\",\"seo_title\":\"پرفروش ترین ها\",\"seo_description\":\"پرفروش ترین ها\",\"created_at\":\"2021-12-27 12:32:04\"}]', '/admin/category/169', '2021-12-27 09:02:17'),
(306, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"169\"}', '[{\"id\":\"305\",\"entity_id\":\"169\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/Screenshot from 2021-12-16 09-34-22.---f0891fdd.png\",\"alt\":\"image_category\",\"created_at\":\"2021-12-27 12:32:04\"}]', '/admin/category/169', '2021-12-27 09:02:17'),
(307, 81, '127.0.0.1', 'create', 'categories', 170, '', '{\"type\":0,\"seo_description\":\"it\",\"seo_title\":\"it\",\"parent_id\":\"0\",\"name\":\"it\",\"H1\":\"it\",\"robots\":\"0\",\"canonical\":\"\",\"description\":\"it\",\"status\":\"1\",\"slug\":\"it\"}', '/admin/category/0', '2021-12-27 09:18:27'),
(308, 81, '127.0.0.1', 'create', 'photos', 306, '', '{\"entity_type\":\"Category\",\"entity_id\":170,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/card-4.---39ee1398.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0', '2021-12-27 09:18:27'),
(309, 81, '127.0.0.1', 'create', 'categories', 171, '', '{\"type\":1,\"seo_description\":\"it\",\"seo_title\":\"it\",\"parent_id\":\"0\",\"name\":\"it\",\"H1\":\"it\",\"robots\":\"0\",\"canonical\":\"it\",\"description\":\"it\",\"status\":\"1\",\"slug\":\"it\"}', '/admin/category/0/blog', '2021-12-27 09:22:37'),
(310, 81, '127.0.0.1', 'create', 'photos', 307, '', '{\"entity_type\":\"Category\",\"entity_id\":171,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/40.---a7f64bb0.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/blog', '2021-12-27 09:22:37'),
(311, 81, '127.0.0.1', 'create', 'categories', 172, '', '{\"type\":1,\"seo_description\":\"it\",\"seo_title\":\"it\",\"parent_id\":\"0\",\"name\":\"it\",\"H1\":\"it\",\"robots\":\"0\",\"canonical\":\"it\",\"description\":\"it\",\"status\":\"1\",\"slug\":\"it\"}', '/admin/category/0/blog', '2021-12-27 09:22:47'),
(312, 81, '127.0.0.1', 'create', 'photos', 308, '', '{\"entity_type\":\"Category\",\"entity_id\":172,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/40.---2745d6d1.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/blog', '2021-12-27 09:22:47'),
(313, 81, '127.0.0.1', 'create', 'categories', 173, '', '{\"type\":1,\"seo_description\":\"hp\",\"seo_title\":\"hp\",\"parent_id\":\"0\",\"name\":\"hp\",\"H1\":\"hp\",\"robots\":\"0\",\"canonical\":\"hp\",\"description\":\"hp\",\"status\":\"1\",\"slug\":\"hp\"}', '/admin/category/0/blog', '2021-12-27 09:31:36'),
(314, 81, '127.0.0.1', 'create', 'photos', 309, '', '{\"entity_type\":\"Category\",\"entity_id\":173,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/42.---b54766a3.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/blog', '2021-12-27 09:31:36'),
(315, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"172\"}', '[{\"id\":\"172\",\"status\":\"1\",\"description\":\"it\",\"type\":\"1\",\"H1\":\"it\",\"canonical\":\"it\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"it\",\"slug\":\"it\",\"seo_title\":\"it\",\"seo_description\":\"it\",\"created_at\":\"2021-12-27 12:52:47\"}]', '/admin/category/172', '2021-12-27 09:31:42'),
(316, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"172\"}', '[{\"id\":\"308\",\"entity_id\":\"172\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/40.---2745d6d1.jpg\",\"alt\":\"image_category\",\"created_at\":\"2021-12-27 12:52:47\"}]', '/admin/category/172', '2021-12-27 09:31:42'),
(317, 81, '127.0.0.1', 'create', 'categories', 174, '', '{\"type\":1,\"seo_description\":\"ssd\",\"seo_title\":\"ssd\",\"parent_id\":\"0\",\"name\":\"ssd\",\"H1\":\"ssd\",\"robots\":\"0\",\"canonical\":\"ssd\",\"description\":\"ssd\",\"status\":\"1\",\"slug\":\"ssd\"}', '/admin/category/0/blog', '2021-12-27 11:25:48'),
(318, 81, '127.0.0.1', 'create', 'photos', 310, '', '{\"entity_type\":\"Category\",\"entity_id\":174,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/card-2.---e7c20b35.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/blog', '2021-12-27 11:25:48'),
(319, 81, '127.0.0.1', 'create', 'categories', 175, '', '{\"type\":0,\"seo_description\":\"product\",\"seo_title\":\"product\",\"parent_id\":\"0\",\"name\":\"product\",\"H1\":\"product\",\"robots\":\"0\",\"canonical\":\"product\",\"description\":\"product\",\"status\":\"1\",\"slug\":\"product\"}', '/admin/category/0/product', '2021-12-27 11:26:18'),
(320, 81, '127.0.0.1', 'create', 'photos', 311, '', '{\"entity_type\":\"Category\",\"entity_id\":175,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/card-4.---03deb567.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/product', '2021-12-27 11:26:18'),
(321, 81, '127.0.0.1', 'create', 'categories', 176, '', '{\"type\":1,\"seo_description\":\"ss\",\"seo_title\":\"ss\",\"parent_id\":\"0\",\"name\":\"ss\",\"H1\":\"ss\",\"robots\":\"0\",\"canonical\":\"ss\",\"description\":\"ss\",\"status\":\"1\",\"slug\":\"ss\"}', '/admin/category/0/blog', '2021-12-27 11:33:47'),
(322, 81, '127.0.0.1', 'create', 'photos', 312, '', '{\"entity_type\":\"Category\",\"entity_id\":176,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/39.---a28b948d.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/blog', '2021-12-27 11:33:47'),
(323, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"176\"}', '[{\"id\":\"176\",\"status\":\"1\",\"description\":\"ss\",\"type\":\"1\",\"H1\":\"ss\",\"canonical\":\"ss\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"ss\",\"slug\":\"ss\",\"seo_title\":\"ss\",\"seo_description\":\"ss\",\"created_at\":\"2021-12-27 15:03:47\"}]', '/admin/category/176/blog', '2021-12-27 11:33:57'),
(324, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"176\"}', '[{\"id\":\"312\",\"entity_id\":\"176\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/39.---a28b948d.jpg\",\"alt\":\"image_category\",\"created_at\":\"2021-12-27 15:03:47\"}]', '/admin/category/176/blog', '2021-12-27 11:33:57'),
(325, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"174\"}', '[{\"id\":\"174\",\"status\":\"1\",\"description\":\"ssd\",\"type\":\"1\",\"H1\":\"ssd\",\"canonical\":\"ssd\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"ssd\",\"slug\":\"ssd\",\"seo_title\":\"ssd\",\"seo_description\":\"ssd\",\"created_at\":\"2021-12-27 14:55:48\"}]', '/admin/category/174/blog', '2021-12-27 11:34:00'),
(326, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"174\"}', '[{\"id\":\"310\",\"entity_id\":\"174\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/card-2.---e7c20b35.jpg\",\"alt\":\"image_category\",\"created_at\":\"2021-12-27 14:55:48\"}]', '/admin/category/174/blog', '2021-12-27 11:34:00'),
(327, 81, '127.0.0.1', 'create', 'categories', 177, '', '{\"type\":1,\"seo_description\":\"ssd\",\"seo_title\":\"ssd\",\"parent_id\":\"0\",\"name\":\"ssd\",\"H1\":\"ssd\",\"robots\":\"0\",\"canonical\":\"ssd\",\"description\":\"ssd\",\"status\":\"1\",\"slug\":\"ssd\"}', '/admin/category/0/blog', '2021-12-27 11:34:27'),
(328, 81, '127.0.0.1', 'create', 'photos', 313, '', '{\"entity_type\":\"Category\",\"entity_id\":177,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/1-1.---fa39d684.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/blog', '2021-12-27 11:34:27'),
(329, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"177\"}', '[{\"id\":\"177\",\"status\":\"1\",\"description\":\"ssd\",\"type\":\"1\",\"H1\":\"ssd\",\"canonical\":\"ssd\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"ssd\",\"slug\":\"ssd\",\"seo_title\":\"ssd\",\"seo_description\":\"ssd\",\"created_at\":\"2021-12-27 15:04:27\"}]', '/admin/category/177/blog', '2021-12-27 11:41:16'),
(330, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"177\"}', '[{\"id\":\"313\",\"entity_id\":\"177\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/1-1.---fa39d684.jpg\",\"alt\":\"image_category\",\"created_at\":\"2021-12-27 15:04:27\"}]', '/admin/category/177/blog', '2021-12-27 11:41:16'),
(331, 81, '127.0.0.1', 'create', 'categories', 178, '', '{\"type\":1,\"seo_description\":\"ssd\",\"seo_title\":\"ssd\",\"parent_id\":\"0\",\"name\":\"ssd\",\"H1\":\"ssd\",\"robots\":\"0\",\"canonical\":\"ssd\",\"description\":\"ssd\",\"status\":\"1\",\"slug\":\"ssd\"}', '/admin/category/0/blog', '2021-12-27 11:41:31'),
(332, 81, '127.0.0.1', 'create', 'photos', 314, '', '{\"entity_type\":\"Category\",\"entity_id\":178,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/1-1.---0e0ce5a5.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/blog', '2021-12-27 11:41:31'),
(333, 81, '127.0.0.1', 'create', 'categories', 179, '', '{\"type\":1,\"seo_description\":\"Commodi quisquam vol\",\"seo_title\":\"Ea fugiat elit et \",\"parent_id\":\"0\",\"name\":\"cyreqiwewa@mailinator.com\",\"H1\":\"Dolore ut nesciunt \",\"robots\":\"0\",\"canonical\":\"Officia mollit hic q\",\"description\":\"Dicta voluptate amet dolor omnis rerum nostrum vitae et adipisicing aut id nostrud blanditiis Nam\",\"status\":\"0\",\"slug\":\"Cum-nemo-a-id-fuga\"}', '/admin/category/0/blog', '2021-12-27 11:48:00'),
(334, 81, '127.0.0.1', 'create', 'categories', 180, '', '{\"type\":1,\"seo_description\":\"Commodi quisquam vol\",\"seo_title\":\"Ea fugiat elit et \",\"parent_id\":\"0\",\"name\":\"cyreqiwewa@mailinator.com\",\"H1\":\"Dolore ut nesciunt \",\"robots\":\"0\",\"canonical\":\"Officia mollit hic q\",\"description\":\"Dicta voluptate amet dolor omnis rerum nostrum vitae et adipisicing aut id nostrud blanditiis Nam\",\"status\":\"0\",\"slug\":\"Cum-nemo-a-id-fuga\"}', '/admin/category/0/blog', '2021-12-27 11:49:08'),
(335, 81, '127.0.0.1', 'create', 'categories', 181, '', '{\"type\":1,\"seo_description\":\"Commodi quisquam vol\",\"seo_title\":\"Ea fugiat elit et \",\"parent_id\":\"0\",\"name\":\"cyreqiwewa@mailinator.com\",\"H1\":\"Dolore ut nesciunt \",\"robots\":\"0\",\"canonical\":\"Officia mollit hic q\",\"description\":\"Dicta voluptate amet dolor omnis rerum nostrum vitae et adipisicing aut id nostrud blanditiis Nam\",\"status\":\"0\",\"slug\":\"Cum-nemo-a-id-fuga\"}', '/admin/category/0/blog', '2021-12-27 11:49:22'),
(336, 81, '127.0.0.1', 'create', 'categories', 182, '', '{\"type\":1,\"seo_description\":\"Commodi quisquam vol\",\"seo_title\":\"Ea fugiat elit et \",\"parent_id\":\"0\",\"name\":\"cyreqiwewa@mailinator.com\",\"H1\":\"Dolore ut nesciunt \",\"robots\":\"0\",\"canonical\":\"Officia mollit hic q\",\"description\":\"Dicta voluptate amet dolor omnis rerum nostrum vitae et adipisicing aut id nostrud blanditiis Nam\",\"status\":\"0\",\"slug\":\"Cum-nemo-a-id-fuga\"}', '/admin/category/0/blog', '2021-12-27 11:57:27'),
(337, 81, '127.0.0.1', 'create', 'photos', 315, '', '{\"entity_type\":\"Category\",\"entity_id\":182,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/37.---80c374f7.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/blog', '2021-12-27 11:57:27'),
(338, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"182\"}', '[{\"id\":\"182\",\"status\":\"0\",\"description\":\"Dicta voluptate amet dolor omnis rerum nostrum vitae et adipisicing aut id nostrud blanditiis Nam\",\"type\":\"1\",\"H1\":\"Dolore ut nesciunt \",\"canonical\":\"Officia mollit hic q\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"cyreqiwewa@mailinator.com\",\"slug\":\"Cum-nemo-a-id-fuga\",\"seo_title\":\"Ea fugiat elit et \",\"seo_description\":\"Commodi quisquam vol\",\"created_at\":\"2021-12-27 15:27:27\"}]', '/admin/category/182/blog', '2021-12-27 11:57:35'),
(339, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"182\"}', '[{\"id\":\"315\",\"entity_id\":\"182\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/37.---80c374f7.jpg\",\"alt\":\"image_category\",\"created_at\":\"2021-12-27 15:27:27\"}]', '/admin/category/182/blog', '2021-12-27 11:57:35'),
(340, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"181\"}', '[{\"id\":\"181\",\"status\":\"0\",\"description\":\"Dicta voluptate amet dolor omnis rerum nostrum vitae et adipisicing aut id nostrud blanditiis Nam\",\"type\":\"1\",\"H1\":\"Dolore ut nesciunt \",\"canonical\":\"Officia mollit hic q\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"cyreqiwewa@mailinator.com\",\"slug\":\"Cum-nemo-a-id-fuga\",\"seo_title\":\"Ea fugiat elit et \",\"seo_description\":\"Commodi quisquam vol\",\"created_at\":\"2021-12-27 15:19:22\"}]', '/admin/category/181/blog', '2021-12-27 11:57:38'),
(341, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"181\"}', '[]', '/admin/category/181/blog', '2021-12-27 11:57:38'),
(342, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"180\"}', '[{\"id\":\"180\",\"status\":\"0\",\"description\":\"Dicta voluptate amet dolor omnis rerum nostrum vitae et adipisicing aut id nostrud blanditiis Nam\",\"type\":\"1\",\"H1\":\"Dolore ut nesciunt \",\"canonical\":\"Officia mollit hic q\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"cyreqiwewa@mailinator.com\",\"slug\":\"Cum-nemo-a-id-fuga\",\"seo_title\":\"Ea fugiat elit et \",\"seo_description\":\"Commodi quisquam vol\",\"created_at\":\"2021-12-27 15:19:08\"}]', '/admin/category/180/blog', '2021-12-27 11:57:42'),
(343, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"180\"}', '[]', '/admin/category/180/blog', '2021-12-27 11:57:42'),
(344, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"179\"}', '[{\"id\":\"179\",\"status\":\"0\",\"description\":\"Dicta voluptate amet dolor omnis rerum nostrum vitae et adipisicing aut id nostrud blanditiis Nam\",\"type\":\"1\",\"H1\":\"Dolore ut nesciunt \",\"canonical\":\"Officia mollit hic q\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"cyreqiwewa@mailinator.com\",\"slug\":\"Cum-nemo-a-id-fuga\",\"seo_title\":\"Ea fugiat elit et \",\"seo_description\":\"Commodi quisquam vol\",\"created_at\":\"2021-12-27 15:18:00\"}]', '/admin/category/179/blog', '2021-12-27 11:57:45'),
(345, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"179\"}', '[]', '/admin/category/179/blog', '2021-12-27 11:57:45'),
(346, 81, '127.0.0.1', 'create', 'categories', 183, '', '{\"type\":1,\"seo_description\":\"Sapiente commodo atq\",\"seo_title\":\"Dolor illum proiden\",\"parent_id\":\"0\",\"name\":\"xorehivefe@mailinator.com\",\"H1\":\"Est iure odit praese\",\"robots\":\"7\",\"canonical\":\"Fuga Voluptatem in\",\"description\":\"Nisi dolore obcaecati ipsa cumque qui quis quas minima necessitatibus sed tempore excepteur qui quod quia libero amet\",\"status\":\"0\",\"slug\":\"Possimus-non-quibus\"}', '/admin/category/0/blog', '2021-12-27 11:57:55'),
(347, 81, '127.0.0.1', 'create', 'photos', 316, '', '{\"entity_type\":\"Category\",\"entity_id\":183,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/38.---650c187c.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/blog', '2021-12-27 11:57:55'),
(348, 81, '127.0.0.1', 'update', 'photos', 0, '{\"entity_type\":\"Category\",\"entity_id\":183}', '{\"old\":[{\"id\":\"316\",\"entity_id\":\"183\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/38.---650c187c.jpg\",\"alt\":\"image_category\",\"created_at\":\"2021-12-27 15:27:55\"}],\"new\":{\"entity_type\":\"Category\",\"entity_id\":183,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/40.---3824a777.jpg\",\"alt\":\"image_category\",\"type\":0}}', '/admin/category/183/blog', '2021-12-27 11:58:25'),
(349, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"183\"}', '[{\"id\":\"183\",\"status\":\"0\",\"description\":\"Nisi dolore obcaecati ipsa cumque qui quis quas minima necessitatibus sed tempore excepteur qui quod quia libero amet\",\"type\":\"1\",\"H1\":\"Est iure odit praese\",\"canonical\":\"Fuga Voluptatem in\",\"robots\":\"7\",\"parent_id\":\"0\",\"name\":\"xorehivefe@mailinator.com\",\"slug\":\"Possimus-non-quibus\",\"seo_title\":\"Dolor illum proiden\",\"seo_description\":\"Sapiente commodo atq\",\"created_at\":\"2021-12-27 15:27:55\"}]', '/admin/category/183/blog', '2021-12-27 12:00:27'),
(350, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"183\"}', '[{\"id\":\"316\",\"entity_id\":\"183\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/40.---3824a777.jpg\",\"alt\":\"image_category\",\"created_at\":\"2021-12-27 15:27:55\"}]', '/admin/category/183/blog', '2021-12-27 12:00:27'),
(351, 81, '127.0.0.1', 'create', 'categories', 184, '', '{\"type\":1,\"seo_description\":\"Et eveniet sit et \",\"seo_title\":\"Temporibus in est c\",\"parent_id\":\"0\",\"name\":\"xevysoz@mailinator.com\",\"H1\":\"Similique quia aliqu\",\"robots\":\"5\",\"canonical\":\"Laboris error cum om\",\"description\":\"Consequuntur obcaecati perspiciatis quos laboris est et eaque recusandae Et sed eaque sint et voluptas\",\"status\":\"0\",\"slug\":\"Incidunt-voluptatib\"}', '/admin/category/0/blog', '2021-12-27 12:00:38'),
(352, 81, '127.0.0.1', 'create', 'photos', 317, '', '{\"entity_type\":\"Category\",\"entity_id\":184,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/38.---1f09188c.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/blog', '2021-12-27 12:00:38'),
(353, 81, '127.0.0.1', 'update', 'photos', 0, '{\"entity_type\":\"Category\",\"entity_id\":184}', '{\"old\":[{\"id\":\"317\",\"entity_id\":\"184\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/38.---1f09188c.jpg\",\"alt\":\"image_category\",\"created_at\":\"2021-12-27 15:30:38\"}],\"new\":{\"entity_type\":\"Category\",\"entity_id\":184,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/card-5.---a25e1dfc.jpg\",\"alt\":\"image_category\",\"type\":0}}', '/admin/category/184/blog', '2021-12-27 12:00:50'),
(354, 0, '127.0.0.1', 'create', 'active_codes', 346, '', '{\"user_id\":\"81\",\"code\":1341,\"expired_at\":\"2021-12-28 08:30:22\"}', '/admin/login', '2021-12-28 05:00:21'),
(355, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"346\",\"user_id\":\"81\",\"code\":\"1341\",\"expired_at\":\"2021-12-28 08:30:22\"}]', '/admin/token', '2021-12-28 05:00:29'),
(356, 0, '127.0.0.1', 'create', 'active_codes', 347, '', '{\"user_id\":\"81\",\"code\":2380,\"expired_at\":\"2021-12-28 09:51:48\"}', '/admin/login', '2021-12-28 06:21:47'),
(357, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"347\",\"user_id\":\"81\",\"code\":\"2380\",\"expired_at\":\"2021-12-28 09:51:48\"}]', '/admin/token', '2021-12-28 06:21:54');
INSERT INTO `activity_log` (`id`, `user_id`, `ip`, `type`, `target_table`, `row_id`, `where_condition`, `detailed_data`, `uri`, `created_at`) VALUES
(358, 0, '127.0.0.1', 'create', 'active_codes', 348, '', '{\"user_id\":\"81\",\"code\":1815,\"expired_at\":\"2021-12-28 12:04:08\"}', '/login', '2021-12-28 08:34:07'),
(359, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"348\",\"user_id\":\"81\",\"code\":\"1815\",\"expired_at\":\"2021-12-28 12:04:08\"}]', '/token', '2021-12-28 08:34:13'),
(360, 0, '127.0.0.1', 'create', 'active_codes', 349, '', '{\"user_id\":\"81\",\"code\":4747,\"expired_at\":\"2021-12-28 16:08:45\"}', '/admin/login', '2021-12-28 12:38:44'),
(361, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"349\",\"user_id\":\"81\",\"code\":\"4747\",\"expired_at\":\"2021-12-28 16:08:45\"}]', '/admin/token', '2021-12-28 12:38:50'),
(362, 81, '127.0.0.1', 'create', 'coupons', 3, '', '{\"user_id\":\"81\",\"start_at\":\"2021-12-28 16:09:10\",\"finish_at\":\"2022-01-20 16:09:10\",\"code\":\"624667\",\"title\":\"شب چله\",\"description\":\"شب چله\",\"percent\":\"20\",\"status\":\"1\"}', '/admin/coupon', '2021-12-28 12:39:47'),
(363, 0, '127.0.0.1', 'create', 'active_codes', 350, '', '{\"user_id\":\"81\",\"code\":4635,\"expired_at\":\"2021-12-29 08:37:14\"}', '/admin/login', '2021-12-29 05:07:13'),
(364, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"350\",\"user_id\":\"81\",\"code\":\"4635\",\"expired_at\":\"2021-12-29 08:37:14\"}]', '/admin/token', '2021-12-29 05:07:22'),
(365, 0, '127.0.0.1', 'create', 'active_codes', 351, '', '{\"user_id\":\"81\",\"code\":2629,\"expired_at\":\"2021-12-29 12:26:22\"}', '/admin/login', '2021-12-29 08:56:21'),
(366, 0, '127.0.0.1', 'create', 'active_codes', 352, '', '{\"user_id\":\"81\",\"code\":7739,\"expired_at\":\"2021-12-29 12:27:09\"}', '/admin/login', '2021-12-29 08:57:08'),
(367, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"351\",\"user_id\":\"81\",\"code\":\"2629\",\"expired_at\":\"2021-12-29 12:26:22\"},{\"id\":\"352\",\"user_id\":\"81\",\"code\":\"7739\",\"expired_at\":\"2021-12-29 12:27:09\"}]', '/admin/token', '2021-12-29 08:57:20'),
(368, 81, '127.0.0.1', 'create', 'coupons', 4, '', '{\"user_id\":\"81\",\"user_level\":\"1\",\"start_at\":\"2021-12-29 12:51:57\",\"finish_at\":\"2022-01-20 12:51:57\",\"code\":\"838703\",\"title\":\"عیدی\",\"description\":\"عیدی\",\"percent\":\"20\",\"status\":\"1\"}', '/admin/coupon', '2021-12-29 09:22:35'),
(369, 81, '127.0.0.1', 'update', 'coupons', 0, '{\"id\":\"4\"}', '{\"old\":[{\"id\":\"4\",\"title\":\"عیدی\",\"user_id\":\"81\",\"user_level\":\"1\",\"code\":\"838703\",\"type\":null,\"percent\":\"20\",\"description\":\"عیدی\",\"status\":\"1\",\"start_at\":\"2021-12-29 12:51:57\",\"finish_at\":\"2022-01-20 12:51:57\",\"updated_at\":null,\"created_at\":\"2021-12-29 12:52:35\"}],\"new\":{\"user_id\":\"81\",\"start_at\":\"2021-12-29 12:51:57\",\"finish_at\":\"2022-01-20 12:51:57\",\"code\":\"838703\",\"title\":\"عیدی\",\"description\":\"عیدی\",\"percent\":\"20\",\"status\":1}}', '/admin/coupon/4', '2021-12-29 09:28:27'),
(370, 81, '127.0.0.1', 'update', 'coupons', 0, '{\"id\":\"4\"}', '{\"old\":[{\"id\":\"4\",\"title\":\"عیدی\",\"user_id\":\"81\",\"user_level\":\"1\",\"code\":\"838703\",\"type\":null,\"percent\":\"20\",\"description\":\"عیدی\",\"status\":\"1\",\"start_at\":\"2021-12-29 12:51:57\",\"finish_at\":\"2022-01-20 12:51:57\",\"updated_at\":null,\"created_at\":\"2021-12-29 12:52:35\"}],\"new\":{\"user_id\":\"81\",\"user_level\":\"3\",\"start_at\":\"2021-12-29 12:51:57\",\"finish_at\":\"2022-01-20 12:51:57\",\"code\":\"838703\",\"title\":\"عیدی\",\"description\":\"عیدی\",\"percent\":\"20\",\"status\":1}}', '/admin/coupon/4', '2021-12-29 09:29:27'),
(371, 81, '127.0.0.1', 'update', 'coupons', 0, '{\"id\":\"4\"}', '{\"old\":[{\"id\":\"4\",\"title\":\"عیدی\",\"user_id\":\"81\",\"user_level\":\"3\",\"code\":\"838703\",\"type\":null,\"percent\":\"20\",\"description\":\"عیدی\",\"status\":\"1\",\"start_at\":\"2021-12-29 12:51:57\",\"finish_at\":\"2022-01-20 12:51:57\",\"updated_at\":null,\"created_at\":\"2021-12-29 12:52:35\"}],\"new\":{\"user_id\":\"81\",\"user_level\":\"3\",\"start_at\":\"2021-12-29 12:51:57\",\"finish_at\":\"2022-01-20 12:51:57\",\"code\":\"838703\",\"title\":\"عیدی\",\"description\":\"عیدی\",\"percent\":\"20\",\"status\":1}}', '/admin/coupon/4', '2021-12-29 09:29:35'),
(372, 81, '127.0.0.1', 'delete', 'product_coupons', 0, '{\"coupon_id\":4}', '[]', '/admin/coupon/4', '2021-12-29 09:29:35'),
(373, 81, '127.0.0.1', 'create', 'product_coupons', 4, '', '{\"coupon_id\":\"4\",\"product_id\":\"91\"}', '/admin/coupon/4', '2021-12-29 09:29:35'),
(374, 0, '127.0.0.1', 'create', 'active_codes', 353, '', '{\"user_id\":\"81\",\"code\":5206,\"expired_at\":\"2021-12-29 15:04:28\"}', '/admin/login', '2021-12-29 11:34:27'),
(375, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"353\",\"user_id\":\"81\",\"code\":\"5206\",\"expired_at\":\"2021-12-29 15:04:28\"}]', '/admin/token', '2021-12-29 11:34:34'),
(376, 0, '127.0.0.1', 'create', 'active_codes', 354, '', '{\"user_id\":\"81\",\"code\":3572,\"expired_at\":\"2022-01-03 08:32:46\"}', '/admin/login', '2022-01-03 05:02:45'),
(377, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"354\",\"user_id\":\"81\",\"code\":\"3572\",\"expired_at\":\"2022-01-03 08:32:46\"}]', '/admin/token', '2022-01-03 05:02:56'),
(378, 81, '127.0.0.1', 'create', 'coupons', 5, '', '{\"user_id\":\"81\",\"min_price\":\"\",\"max_price\":\"\",\"user_level\":\"1\",\"start_at\":\"2022-01-03 09:42:22\",\"finish_at\":\"2022-01-20 09:42:22\",\"code\":\"680375\",\"title\":\"dd\",\"description\":\"dd\",\"percent\":\"10\",\"status\":\"1\"}', '/admin/coupon', '2022-01-03 06:13:00'),
(379, 81, '127.0.0.1', 'create', 'product_coupons', 5, '', '{\"coupon_id\":\"5\",\"product_id\":\"84\"}', '/admin/coupon', '2022-01-03 06:13:00'),
(380, 0, '127.0.0.1', 'create', 'active_codes', 355, '', '{\"user_id\":\"81\",\"code\":1081,\"expired_at\":\"2022-01-03 14:27:31\"}', '/login', '2022-01-03 10:57:30'),
(381, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"355\",\"user_id\":\"81\",\"code\":\"1081\",\"expired_at\":\"2022-01-03 14:27:31\"}]', '/token', '2022-01-03 10:57:39'),
(382, 81, '127.0.0.1', 'update', 'users', 0, '{\"id\":\"81\"}', '{\"old\":[{\"id\":\"81\",\"city_id\":null,\"province_id\":null,\"user_level\":\"0\",\"phone\":\"09128897603\",\"email\":null,\"first_name\":\"مهرزاد\",\"last_name\":\"تاج کریمی\",\"company\":null,\"jobtitle\":null,\"national_code\":null,\"postal_code\":null,\"address\":null,\"birthday\":null,\"gender\":null,\"status\":\"1\",\"bank_name\":null,\"bank_number\":null,\"ip\":null,\"email_verified_at\":null,\"created_at\":\"2021-12-14 17:50:00\",\"updated_at\":null}],\"new\":{\"first_name\":\"مهرزاد\",\"last_name\":\"تاج کریمی\",\"phone\":\"09128897603\",\"email\":\"\",\"address\":\"dfgzsdfgg\",\"province_id\":\"3\",\"city_id\":\"100\",\"postal_code\":\"1000000000\",\"national_code\":\"\",\"birthday\":\"1641208393\",\"gender\":null,\"jobtitle\":\"\",\"company\":\"\"}}', '/profile/81', '2022-01-03 11:13:51'),
(383, 81, '127.0.0.1', 'create', 'orders', 5, '', '{\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"weight\":\"normal\",\"item_count\":1,\"grand_total\":2000000,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"44\"}', '/order/create', '2022-01-03 11:14:00'),
(384, 81, '127.0.0.1', 'create', 'order_items', 7, '', '{\"order_id\":\"5\",\"product_id\":\"85\",\"quantity\":1,\"price\":\"2000000\",\"discount\":0}', '/order/create', '2022-01-03 11:14:00'),
(385, 81, '127.0.0.1', 'create', 'orders', 6, '', '{\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"weight\":\"normal\",\"item_count\":2,\"grand_total\":11000000,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\"}', '/order/create', '2022-01-03 11:35:08'),
(386, 81, '127.0.0.1', 'create', 'order_items', 8, '', '{\"order_id\":\"6\",\"product_id\":\"86\",\"quantity\":1,\"price\":\"7500000\",\"discount\":0}', '/order/create', '2022-01-03 11:35:08'),
(387, 81, '127.0.0.1', 'create', 'order_items', 9, '', '{\"order_id\":\"6\",\"product_id\":\"83\",\"quantity\":1,\"price\":\"3500000\",\"discount\":0}', '/order/create', '2022-01-03 11:35:08'),
(388, 0, '127.0.0.1', 'create', 'active_codes', 356, '', '{\"user_id\":\"81\",\"code\":5963,\"expired_at\":\"2022-01-03 17:12:40\"}', '/admin/login', '2022-01-03 13:42:39'),
(389, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"356\",\"user_id\":\"81\",\"code\":\"5963\",\"expired_at\":\"2022-01-03 17:12:40\"}]', '/admin/token', '2022-01-03 13:42:47'),
(390, 81, '127.0.0.1', 'create', 'categories', 185, '', '{\"type\":0,\"seo_description\":\"یی\",\"seo_title\":\"یی\",\"parent_id\":\"0\",\"name\":\"یی\",\"H1\":\"یی\",\"robots\":\"0\",\"canonical\":\"یی\",\"description\":\"یی\",\"status\":\"1\",\"slug\":\"یی\"}', '/admin/category/0/product', '2022-01-03 13:50:42'),
(391, 81, '127.0.0.1', 'create', 'photos', 318, '', '{\"entity_type\":\"Category\",\"entity_id\":185,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/35.---90eaa26f.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/product', '2022-01-03 13:50:42'),
(392, 0, '127.0.0.1', 'create', 'active_codes', 357, '', '{\"user_id\":\"81\",\"code\":4092,\"expired_at\":\"2022-01-04 10:23:30\"}', '/admin/login', '2022-01-04 06:53:29'),
(393, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"357\",\"user_id\":\"81\",\"code\":\"4092\",\"expired_at\":\"2022-01-04 10:23:30\"}]', '/admin/token', '2022-01-04 06:53:44'),
(394, 81, '127.0.0.1', 'create', 'categories', 186, '', '{\"type\":0,\"seo_description\":\"dd\",\"seo_title\":\"dd\",\"parent_id\":\"185\",\"name\":\"dd\",\"H1\":\"dd\",\"robots\":\"3\",\"canonical\":null,\"description\":\"<p>dd<\\/p>\\r\\n\",\"status\":\"1\",\"slug\":\"dd\"}', '/admin/category/185/product', '2022-01-04 06:56:36'),
(395, 81, '127.0.0.1', 'create', 'photos', 319, '', '{\"entity_type\":\"Category\",\"entity_id\":186,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/39.---818d9cc6.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/185/product', '2022-01-04 06:56:36'),
(396, 81, '127.0.0.1', 'update', 'photos', 0, '{\"entity_type\":\"Category\",\"entity_id\":186}', '{\"old\":[{\"id\":\"319\",\"entity_id\":\"186\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/39.---818d9cc6.jpg\",\"alt\":\"image_category\",\"created_at\":\"2022-01-04 10:26:36\"}],\"new\":{\"entity_type\":\"Category\",\"entity_id\":186,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/card-3.---3b1fca36.jpg\",\"alt\":\"image_category\",\"type\":0}}', '/admin/category/186/product', '2022-01-04 06:57:30'),
(397, 81, '127.0.0.1', 'update', 'photos', 0, '{\"entity_type\":\"Category\",\"entity_id\":186}', '{\"old\":[{\"id\":\"319\",\"entity_id\":\"186\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/card-3.---3b1fca36.jpg\",\"alt\":\"image_category\",\"created_at\":\"2022-01-04 10:26:36\"}],\"new\":{\"entity_type\":\"Category\",\"entity_id\":186,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/36.---b312db70.jpg\",\"alt\":\"image_category\",\"type\":0}}', '/admin/category/186/product', '2022-01-04 07:00:09'),
(398, 81, '127.0.0.1', 'update', 'categories', 0, '{\"id\":\"186\"}', '{\"old\":[{\"id\":\"186\",\"status\":\"1\",\"description\":\"<p>dd<\\/p>\\r\\n\",\"type\":\"0\",\"H1\":\"dd\",\"canonical\":null,\"robots\":\"3\",\"parent_id\":\"185\",\"name\":\"dd\",\"slug\":\"dd\",\"seo_title\":\"dd\",\"seo_description\":\"dd\",\"created_at\":\"2022-01-04 10:26:36\"}],\"new\":{\"slug\":\"hhdd\",\"seo_description\":\"hhdd\",\"seo_title\":\"hhdd\",\"name\":\"hhdd\",\"H1\":\"hhdd\",\"robots\":\"3\",\"canonical\":\"\",\"description\":\"<p>hhdd<\\/p>\\r\\n\",\"status\":1}}', '/admin/category/186/product', '2022-01-04 07:11:42'),
(399, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"186\"}', '[{\"id\":\"186\",\"status\":\"1\",\"description\":\"<p>hhdd<\\/p>\\r\\n\",\"type\":\"0\",\"H1\":\"hhdd\",\"canonical\":\"\",\"robots\":\"3\",\"parent_id\":\"185\",\"name\":\"hhdd\",\"slug\":\"hhdd\",\"seo_title\":\"hhdd\",\"seo_description\":\"hhdd\",\"created_at\":\"2022-01-04 10:26:36\"}]', '/admin/category/186/product', '2022-01-04 07:12:02'),
(400, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"186\"}', '[{\"id\":\"319\",\"entity_id\":\"186\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/36.---b312db70.jpg\",\"alt\":\"image_category\",\"created_at\":\"2022-01-04 10:26:36\"}]', '/admin/category/186/product', '2022-01-04 07:12:02'),
(401, 81, '127.0.0.1', 'create', 'categories', 187, '', '{\"type\":1,\"seo_description\":\"Esse doloribus nesci\",\"seo_title\":\"Nesciunt autem sint\",\"parent_id\":\"0\",\"name\":\"xusesukow@mailinator.com\",\"H1\":\"Dolorem molestiae ne\",\"robots\":\"7\",\"canonical\":\"Nesciunt iusto aspe\",\"description\":\"Culpa eius amet non in adipisci esse id ipsum atque excepteur culpa eveniet atque ut veniam eaque ut placeat nostr\",\"status\":\"1\",\"slug\":\"Id-elit-quae-repell\"}', '/admin/category/0/blog', '2022-01-04 07:23:50'),
(402, 81, '127.0.0.1', 'create', 'photos', 320, '', '{\"entity_type\":\"Category\",\"entity_id\":187,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/36.---28038b78.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/blog', '2022-01-04 07:23:50'),
(403, 81, '127.0.0.1', 'create', 'categories', 188, '', '{\"type\":1,\"seo_description\":\"Esse doloribus nesci\",\"seo_title\":\"Nesciunt autem sint\",\"parent_id\":\"0\",\"name\":\"xusesukow@mailinator.com\",\"H1\":\"Dolorem molestiae ne\",\"robots\":\"7\",\"canonical\":\"Nesciunt iusto aspe\",\"description\":\"Culpa eius amet non in adipisci esse id ipsum atque excepteur culpa eveniet atque ut veniam eaque ut placeat nostr\",\"status\":\"1\",\"slug\":\"Id-elit-quae-repell\"}', '/admin/category/0/blog', '2022-01-04 07:23:53'),
(404, 81, '127.0.0.1', 'create', 'photos', 321, '', '{\"entity_type\":\"Category\",\"entity_id\":188,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/36.---67e46db5.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/blog', '2022-01-04 07:23:53'),
(405, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"188\"}', '[{\"id\":\"188\",\"status\":\"1\",\"description\":\"Culpa eius amet non in adipisci esse id ipsum atque excepteur culpa eveniet atque ut veniam eaque ut placeat nostr\",\"type\":\"1\",\"H1\":\"Dolorem molestiae ne\",\"canonical\":\"Nesciunt iusto aspe\",\"robots\":\"7\",\"parent_id\":\"0\",\"name\":\"xusesukow@mailinator.com\",\"slug\":\"Id-elit-quae-repell\",\"seo_title\":\"Nesciunt autem sint\",\"seo_description\":\"Esse doloribus nesci\",\"created_at\":\"2022-01-04 10:53:53\"}]', '/admin/category/188/blog', '2022-01-04 07:23:59'),
(406, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"188\"}', '[{\"id\":\"321\",\"entity_id\":\"188\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/36.---67e46db5.jpg\",\"alt\":\"image_category\",\"created_at\":\"2022-01-04 10:53:53\"}]', '/admin/category/188/blog', '2022-01-04 07:23:59'),
(407, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"187\"}', '[{\"id\":\"187\",\"status\":\"1\",\"description\":\"Culpa eius amet non in adipisci esse id ipsum atque excepteur culpa eveniet atque ut veniam eaque ut placeat nostr\",\"type\":\"1\",\"H1\":\"Dolorem molestiae ne\",\"canonical\":\"Nesciunt iusto aspe\",\"robots\":\"7\",\"parent_id\":\"0\",\"name\":\"xusesukow@mailinator.com\",\"slug\":\"Id-elit-quae-repell\",\"seo_title\":\"Nesciunt autem sint\",\"seo_description\":\"Esse doloribus nesci\",\"created_at\":\"2022-01-04 10:53:50\"}]', '/admin/category/187/blog', '2022-01-04 07:24:02'),
(408, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"187\"}', '[{\"id\":\"320\",\"entity_id\":\"187\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/36.---28038b78.jpg\",\"alt\":\"image_category\",\"created_at\":\"2022-01-04 10:53:50\"}]', '/admin/category/187/blog', '2022-01-04 07:24:02'),
(409, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"184\"}', '[{\"id\":\"184\",\"status\":\"0\",\"description\":\"Consequuntur obcaecati perspiciatis quos laboris est et eaque recusandae Et sed eaque sint et voluptas\",\"type\":\"1\",\"H1\":\"Similique quia aliqu\",\"canonical\":\"Laboris error cum om\",\"robots\":\"5\",\"parent_id\":\"0\",\"name\":\"xevysoz@mailinator.com\",\"slug\":\"Incidunt-voluptatib\",\"seo_title\":\"Temporibus in est c\",\"seo_description\":\"Et eveniet sit et \",\"created_at\":\"2021-12-27 15:30:38\"}]', '/admin/category/184/blog', '2022-01-04 07:24:05'),
(410, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"184\"}', '[{\"id\":\"317\",\"entity_id\":\"184\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/card-5.---a25e1dfc.jpg\",\"alt\":\"image_category\",\"created_at\":\"2021-12-27 15:30:38\"}]', '/admin/category/184/blog', '2022-01-04 07:24:05'),
(411, 81, '127.0.0.1', 'create', 'categories', 189, '', '{\"type\":1,\"seo_description\":\"Sed temporibus in iu\",\"seo_title\":\"Et officiis optio q\",\"parent_id\":\"0\",\"name\":\"retefa@mailinator.com\",\"H1\":\"Suscipit tenetur sol\",\"robots\":\"4\",\"canonical\":\"Alias sit aut susci\",\"description\":\"Id maxime veritatis qui eum explicabo Labore nulla et deserunt consequatur minus rerum\",\"status\":\"1\",\"slug\":\"Voluptatem-Minima-c\"}', '/admin/category/0/blog', '2022-01-04 07:24:14'),
(412, 81, '127.0.0.1', 'create', 'photos', 322, '', '{\"entity_type\":\"Category\",\"entity_id\":189,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/38.---ddece540.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/189/blog', '2022-01-04 07:24:36'),
(413, 0, '127.0.0.1', 'create', 'active_codes', 358, '', '{\"user_id\":\"81\",\"code\":1232,\"expired_at\":\"2022-01-04 12:15:35\"}', '/admin/login', '2022-01-04 08:45:34'),
(414, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"358\",\"user_id\":\"81\",\"code\":\"1232\",\"expired_at\":\"2022-01-04 12:15:35\"}]', '/admin/token', '2022-01-04 08:45:44'),
(415, 0, '127.0.0.1', 'create', 'active_codes', 359, '', '{\"user_id\":\"81\",\"code\":4242,\"expired_at\":\"2022-01-08 08:02:05\"}', '/admin/login', '2022-01-08 04:32:04'),
(416, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"359\",\"user_id\":\"81\",\"code\":\"4242\",\"expired_at\":\"2022-01-08 08:02:05\"}]', '/admin/token', '2022-01-08 04:32:28'),
(417, 81, '127.0.0.1', 'create', 'orders', 7, '', '{\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"weight\":\"normal\",\"item_count\":1,\"grand_total\":500000,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\"}', '/order/create', '2022-01-08 04:32:58'),
(418, 81, '127.0.0.1', 'create', 'order_items', 10, '', '{\"order_id\":\"7\",\"product_id\":\"84\",\"quantity\":1,\"price\":\"500000\",\"discount\":0}', '/order/create', '2022-01-08 04:32:58'),
(419, 81, '127.0.0.1', 'create', 'orders', 8, '', '{\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"weight\":\"normal\",\"item_count\":1,\"grand_total\":3150000,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\"}', '/order/create', '2022-01-08 04:49:08'),
(420, 81, '127.0.0.1', 'create', 'order_items', 11, '', '{\"order_id\":\"8\",\"product_id\":\"83\",\"quantity\":1,\"price\":\"3500000\",\"discount\":0}', '/order/create', '2022-01-08 04:49:08'),
(421, 81, '127.0.0.1', 'create', 'orders', 9, '', '{\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"weight\":\"normal\",\"item_count\":2,\"grand_total\":4650000,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\"}', '/order/create', '2022-01-08 04:49:37'),
(422, 81, '127.0.0.1', 'create', 'order_items', 12, '', '{\"order_id\":\"9\",\"product_id\":\"82\",\"quantity\":1,\"price\":\"1500000\",\"discount\":0}', '/order/create', '2022-01-08 04:49:37'),
(423, 81, '127.0.0.1', 'create', 'order_items', 13, '', '{\"order_id\":\"9\",\"product_id\":\"83\",\"quantity\":1,\"price\":\"3500000\",\"discount\":0}', '/order/create', '2022-01-08 04:49:37'),
(424, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"9\"}', '{\"old\":[{\"id\":\"9\",\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"2\",\"grand_total\":\"4650000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-08 08:19:37\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/9', '2022-01-08 04:50:04'),
(425, 0, '127.0.0.1', 'create', 'users', 85, '', '{\"phone\":\"091288976063\"}', '/login', '2022-01-08 05:48:13'),
(426, 0, '127.0.0.1', 'create', 'active_codes', 360, '', '{\"user_id\":\"85\",\"code\":1019,\"expired_at\":\"2022-01-08 09:18:14\"}', '/login', '2022-01-08 05:48:13'),
(427, 0, '127.0.0.1', 'create', 'active_codes', 361, '', '{\"user_id\":\"81\",\"code\":2778,\"expired_at\":\"2022-01-08 09:19:02\"}', '/login', '2022-01-08 05:49:01'),
(428, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"361\",\"user_id\":\"81\",\"code\":\"2778\",\"expired_at\":\"2022-01-08 09:19:02\"}]', '/token', '2022-01-08 05:49:08'),
(429, 81, '127.0.0.1', 'create', 'orders', 10, '', '{\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"weight\":\"normal\",\"item_count\":1,\"grand_total\":418500,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\"}', '/order/create', '2022-01-08 08:51:08'),
(430, 81, '127.0.0.1', 'create', 'order_items', 14, '', '{\"order_id\":\"10\",\"product_id\":\"84\",\"quantity\":1,\"price\":\"500000\",\"discount\":0}', '/order/create', '2022-01-08 08:51:08'),
(431, 81, '127.0.0.1', 'create', 'order_items', 15, '', '{\"order_id\":\"10\",\"product_id\":null,\"quantity\":null,\"price\":null,\"discount\":0}', '/order/create', '2022-01-08 08:51:08'),
(432, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"8\"}', '{\"old\":[{\"id\":\"8\",\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"3150000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-08 08:19:08\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/8', '2022-01-08 08:51:43'),
(433, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"10\"}', '{\"old\":[{\"id\":\"10\",\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"418500\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-08 12:21:08\",\"updated_at\":null}],\"new\":{\"sender_id\":\"81\",\"status\":3}}', '/admin/order/status/10', '2022-01-08 08:53:07'),
(434, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"10\"}', '{\"old\":[{\"id\":\"10\",\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"418500\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":\"81\",\"status\":\"1\",\"created_at\":\"2022-01-08 12:21:08\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/10', '2022-01-08 08:54:21'),
(435, 81, '127.0.0.1', 'create', 'coupons', 6, '', '{\"user_id\":\"81\",\"min_price\":\"\",\"max_price\":\"\",\"user_level\":\"انتخابی کنید\",\"start_at\":\"2022-01-08 13:08:37\",\"finish_at\":\"2022-01-20 13:08:37\",\"code\":\"992363\",\"title\":\"gg\",\"description\":\"gg\",\"percent\":\"10\",\"status\":\"1\"}', '/admin/coupon', '2022-01-08 09:38:52'),
(436, 81, '127.0.0.1', 'create', 'orders', 11, '', '{\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"weight\":\"normal\",\"item_count\":1,\"grand_total\":900000,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\"}', '/order/create', '2022-01-08 09:40:04'),
(437, 81, '127.0.0.1', 'create', 'order_items', 16, '', '{\"order_id\":\"11\",\"product_id\":\"85\",\"quantity\":1,\"price\":\"2000000\",\"discount\":0}', '/order/create', '2022-01-08 09:40:04'),
(438, 81, '127.0.0.1', 'create', 'order_items', 17, '', '{\"order_id\":\"11\",\"product_id\":null,\"quantity\":null,\"price\":null,\"discount\":0}', '/order/create', '2022-01-08 09:40:04'),
(439, 81, '127.0.0.1', 'create', 'orders', 12, '', '{\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"weight\":\"normal\",\"item_count\":1,\"grand_total\":1800000,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\"}', '/order/create', '2022-01-08 09:44:55'),
(440, 81, '127.0.0.1', 'create', 'order_items', 18, '', '{\"order_id\":\"12\",\"product_id\":\"80\",\"quantity\":1,\"price\":\"2000000\",\"discount\":0}', '/order/create', '2022-01-08 09:44:55'),
(441, 81, '127.0.0.1', 'create', 'order_items', 19, '', '{\"order_id\":\"12\",\"product_id\":null,\"quantity\":null,\"price\":null,\"discount\":0}', '/order/create', '2022-01-08 09:44:55'),
(442, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"12\"}', '{\"old\":[{\"id\":\"12\",\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"1800000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-08 13:14:55\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/12', '2022-01-08 09:45:21'),
(443, 81, '127.0.0.1', 'create', 'orders', 13, '', '{\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"weight\":\"normal\",\"item_count\":1,\"grand_total\":418500,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\"}', '/order/create', '2022-01-08 10:50:09'),
(444, 81, '127.0.0.1', 'create', 'order_items', 20, '', '{\"order_id\":\"13\",\"product_id\":\"84\",\"quantity\":1,\"price\":\"500000\",\"discount\":0}', '/order/create', '2022-01-08 10:50:09'),
(445, 81, '127.0.0.1', 'create', 'order_items', 21, '', '{\"order_id\":\"13\",\"product_id\":null,\"quantity\":null,\"price\":null,\"discount\":0}', '/order/create', '2022-01-08 10:50:09'),
(446, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"13\"}', '{\"old\":[{\"id\":\"13\",\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"418500\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-08 14:20:09\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/13', '2022-01-08 10:50:48'),
(447, 81, '127.0.0.1', 'create', 'orders', 14, '', '{\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"weight\":\"normal\",\"item_count\":1,\"grand_total\":2835000,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\"}', '/order/create', '2022-01-08 11:11:01'),
(448, 81, '127.0.0.1', 'create', 'order_items', 22, '', '{\"order_id\":\"14\",\"product_id\":\"83\",\"quantity\":1,\"price\":\"3500000\",\"discount\":0}', '/order/create', '2022-01-08 11:11:01'),
(449, 81, '127.0.0.1', 'create', 'order_items', 23, '', '{\"order_id\":\"14\",\"product_id\":null,\"quantity\":null,\"price\":null,\"discount\":0}', '/order/create', '2022-01-08 11:11:01'),
(450, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"14\"}', '{\"old\":[{\"id\":\"14\",\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"2835000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-08 14:41:01\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/14', '2022-01-08 11:11:25'),
(451, 81, '127.0.0.1', 'create', 'orders', 15, '', '{\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"weight\":\"normal\",\"item_count\":1,\"grand_total\":7000000,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\"}', '/order/create', '2022-01-08 11:21:17'),
(452, 81, '127.0.0.1', 'create', 'order_items', 24, '', '{\"order_id\":\"15\",\"product_id\":\"88\",\"quantity\":1,\"price\":\"7000000\",\"discount\":0}', '/order/create', '2022-01-08 11:21:17'),
(453, 81, '127.0.0.1', 'create', 'orders', 16, '', '{\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"weight\":\"normal\",\"item_count\":1,\"grand_total\":900000,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\"}', '/order/create', '2022-01-08 11:21:39'),
(454, 81, '127.0.0.1', 'create', 'order_items', 25, '', '{\"order_id\":\"16\",\"product_id\":\"90\",\"quantity\":1,\"price\":\"1000000\",\"discount\":0}', '/order/create', '2022-01-08 11:21:39'),
(455, 81, '127.0.0.1', 'create', 'order_items', 26, '', '{\"order_id\":\"16\",\"product_id\":null,\"quantity\":null,\"price\":null,\"discount\":0}', '/order/create', '2022-01-08 11:21:39'),
(456, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"16\"}', '{\"old\":[{\"id\":\"16\",\"user_id\":\"81\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"900000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-08 14:51:39\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/16', '2022-01-08 11:22:00'),
(457, 81, '127.0.0.1', 'create', 'orders', 17, '', '{\"user_id\":\"81\",\"coupon_id\":6,\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"item_count\":1,\"grand_total\":900000,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\",\"weight\":\"normal\"}', '/order/create', '2022-01-08 11:45:53'),
(458, 81, '127.0.0.1', 'create', 'order_items', 27, '', '{\"order_id\":\"17\",\"product_id\":\"85\",\"quantity\":1,\"price\":\"2000000\",\"discount\":0}', '/order/create', '2022-01-08 11:45:53'),
(459, 81, '127.0.0.1', 'create', 'order_items', 28, '', '{\"order_id\":\"17\",\"product_id\":null,\"quantity\":null,\"price\":null,\"discount\":0}', '/order/create', '2022-01-08 11:45:53'),
(460, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"17\"}', '{\"old\":[{\"id\":\"17\",\"user_id\":\"81\",\"coupon_id\":\"6\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"900000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-08 15:15:53\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/17', '2022-01-08 11:46:08'),
(461, 81, '127.0.0.1', 'create', 'orders', 18, '', '{\"user_id\":\"81\",\"coupon_id\":0,\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"item_count\":0,\"grand_total\":0,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\",\"weight\":\"normal\"}', '/order/create', '2022-01-08 11:48:34'),
(462, 81, '127.0.0.1', 'create', 'orders', 19, '', '{\"user_id\":\"81\",\"coupon_id\":0,\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"item_count\":0,\"grand_total\":0,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\",\"weight\":\"normal\"}', '/order/create', '2022-01-08 11:48:44'),
(463, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"19\"}', '{\"old\":[{\"id\":\"19\",\"user_id\":\"81\",\"coupon_id\":\"0\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"0\",\"grand_total\":\"0\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-08 15:18:44\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/19', '2022-01-08 12:04:51'),
(464, 81, '127.0.0.1', 'create', 'orders', 20, '', '{\"user_id\":\"81\",\"coupon_id\":6,\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"item_count\":1,\"grand_total\":2835000,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\",\"weight\":\"normal\"}', '/order/create', '2022-01-08 12:28:30'),
(465, 81, '127.0.0.1', 'create', 'order_items', 29, '', '{\"order_id\":\"20\",\"product_id\":\"83\",\"quantity\":1,\"price\":\"3500000\",\"discount\":0}', '/order/create', '2022-01-08 12:28:30'),
(466, 81, '127.0.0.1', 'create', 'order_items', 30, '', '{\"order_id\":\"20\",\"product_id\":null,\"quantity\":null,\"price\":null,\"discount\":0}', '/order/create', '2022-01-08 12:28:30'),
(467, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"20\"}', '{\"old\":[{\"id\":\"20\",\"user_id\":\"81\",\"coupon_id\":\"6\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"2835000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-08 15:58:30\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/20', '2022-01-08 12:28:49'),
(468, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"18\"}', '{\"old\":[{\"id\":\"18\",\"user_id\":\"81\",\"coupon_id\":\"0\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"0\",\"grand_total\":\"0\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-08 15:18:34\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/18', '2022-01-08 12:46:42'),
(469, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"15\"}', '{\"old\":[{\"id\":\"15\",\"user_id\":\"81\",\"coupon_id\":\"0\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"7000000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-08 14:51:17\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/15', '2022-01-08 12:46:49'),
(470, 0, '127.0.0.1', 'create', 'active_codes', 362, '', '{\"user_id\":\"81\",\"code\":1718,\"expired_at\":\"2022-01-09 08:01:08\"}', '/login', '2022-01-09 04:31:07'),
(471, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"362\",\"user_id\":\"81\",\"code\":\"1718\",\"expired_at\":\"2022-01-09 08:01:08\"}]', '/token', '2022-01-09 04:31:18'),
(472, 81, '127.0.0.1', 'create', 'orders', 21, '', '{\"user_id\":\"81\",\"coupon_id\":6,\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"item_count\":1,\"grand_total\":2835000,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\",\"weight\":\"normal\"}', '/order/create', '2022-01-09 04:35:46'),
(473, 81, '127.0.0.1', 'create', 'order_items', 31, '', '{\"order_id\":\"21\",\"product_id\":\"83\",\"quantity\":1,\"price\":\"3500000\",\"discount\":0}', '/order/create', '2022-01-09 04:35:46'),
(474, 81, '127.0.0.1', 'create', 'order_items', 32, '', '{\"order_id\":\"21\",\"product_id\":null,\"quantity\":null,\"price\":null,\"discount\":0}', '/order/create', '2022-01-09 04:35:46'),
(475, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"21\"}', '{\"old\":[{\"id\":\"21\",\"user_id\":\"81\",\"coupon_id\":\"6\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"2835000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-09 08:05:46\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/21', '2022-01-09 04:36:03'),
(476, 81, '127.0.0.1', 'create', 'orders', 22, '', '{\"user_id\":\"81\",\"coupon_id\":6,\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"item_count\":1,\"grand_total\":900000,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\",\"weight\":\"normal\"}', '/order/create', '2022-01-09 04:50:16'),
(477, 81, '127.0.0.1', 'create', 'order_items', 33, '', '{\"order_id\":\"22\",\"product_id\":\"85\",\"quantity\":1,\"price\":\"2000000\",\"discount\":0}', '/order/create', '2022-01-09 04:50:16'),
(478, 81, '127.0.0.1', 'create', 'order_items', 34, '', '{\"order_id\":\"22\",\"product_id\":null,\"quantity\":null,\"price\":null,\"discount\":0}', '/order/create', '2022-01-09 04:50:16'),
(479, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"22\"}', '{\"old\":[{\"id\":\"22\",\"user_id\":\"81\",\"coupon_id\":\"6\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"900000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-09 08:20:16\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/22', '2022-01-09 04:50:27'),
(480, 0, '127.0.0.1', 'create', 'active_codes', 363, '', '{\"user_id\":\"81\",\"code\":2135,\"expired_at\":\"2022-01-09 09:30:19\"}', '/admin/login', '2022-01-09 06:00:18'),
(481, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"363\",\"user_id\":\"81\",\"code\":\"2135\",\"expired_at\":\"2022-01-09 09:30:19\"}]', '/admin/token', '2022-01-09 06:00:35'),
(482, 81, '127.0.0.1', 'create', 'orders', 23, '', '{\"user_id\":\"81\",\"coupon_id\":2,\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":0,\"order_number\":0,\"item_count\":1,\"grand_total\":850000,\"discount_total\":0,\"shipping_cost\":0,\"notes\":\"\",\"weight\":\"normal\"}', '/order/create', '2022-01-09 07:28:30'),
(483, 81, '127.0.0.1', 'create', 'order_items', 35, '', '{\"order_id\":\"23\",\"product_id\":\"85\",\"quantity\":1,\"price\":\"2000000\",\"discount\":0}', '/order/create', '2022-01-09 07:28:30'),
(484, 0, '127.0.0.1', 'create', 'active_codes', 364, '', '{\"user_id\":\"81\",\"code\":8819,\"expired_at\":\"2022-01-09 14:28:43\"}', '/admin/login', '2022-01-09 10:58:42'),
(485, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"364\",\"user_id\":\"81\",\"code\":\"8819\",\"expired_at\":\"2022-01-09 14:28:43\"}]', '/admin/token', '2022-01-09 10:58:51'),
(486, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"185\"}', '[{\"id\":\"185\",\"status\":\"1\",\"description\":\"یی\",\"type\":\"0\",\"H1\":\"یی\",\"canonical\":\"یی\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"یی\",\"slug\":\"یی\",\"seo_title\":\"یی\",\"seo_description\":\"یی\",\"created_at\":\"2022-01-03 17:20:42\"}]', '/admin/category/185/product', '2022-01-09 11:43:22'),
(487, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"185\"}', '[{\"id\":\"318\",\"entity_id\":\"185\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/35.---90eaa26f.jpg\",\"alt\":\"image_category\",\"created_at\":\"2022-01-03 17:20:42\"}]', '/admin/category/185/product', '2022-01-09 11:43:22'),
(488, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"175\"}', '[{\"id\":\"175\",\"status\":\"1\",\"description\":\"product\",\"type\":\"0\",\"H1\":\"product\",\"canonical\":\"product\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"product\",\"slug\":\"product\",\"seo_title\":\"product\",\"seo_description\":\"product\",\"created_at\":\"2021-12-27 14:56:18\"}]', '/admin/category/175/product', '2022-01-09 11:43:26'),
(489, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"175\"}', '[{\"id\":\"311\",\"entity_id\":\"175\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/card-4.---03deb567.jpg\",\"alt\":\"image_category\",\"created_at\":\"2021-12-27 14:56:18\"}]', '/admin/category/175/product', '2022-01-09 11:43:26'),
(490, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"170\"}', '[{\"id\":\"170\",\"status\":\"1\",\"description\":\"it\",\"type\":\"0\",\"H1\":\"it\",\"canonical\":\"\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"it\",\"slug\":\"it\",\"seo_title\":\"it\",\"seo_description\":\"it\",\"created_at\":\"2021-12-27 12:48:27\"}]', '/admin/category/170/product', '2022-01-09 11:43:29'),
(491, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"170\"}', '[{\"id\":\"306\",\"entity_id\":\"170\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/card-4.---39ee1398.jpg\",\"alt\":\"image_category\",\"created_at\":\"2021-12-27 12:48:27\"}]', '/admin/category/170/product', '2022-01-09 11:43:29'),
(492, 81, '127.0.0.1', 'create', 'photos', 323, '', '{\"entity_type\":\"Category\",\"entity_id\":111,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/home-v12-background.---face2bfe.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/111/product', '2022-01-09 11:46:09'),
(493, 81, '127.0.0.1', 'update', 'photos', 0, '{\"entity_type\":\"Category\",\"entity_id\":111}', '{\"old\":[{\"id\":\"323\",\"entity_id\":\"111\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/home-v12-background.---face2bfe.jpg\",\"alt\":\"image_category\",\"created_at\":\"2022-01-09 15:16:09\"}],\"new\":{\"entity_type\":\"Category\",\"entity_id\":111,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/home-v9-img-1.---176734ba.jpg\",\"alt\":\"image_category\",\"type\":0}}', '/admin/category/111/product', '2022-01-09 11:46:25'),
(494, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"111\"}', '[{\"id\":\"111\",\"status\":\"0\",\"description\":\"\",\"type\":\"0\",\"H1\":\"پرفروش ترین ها\",\"canonical\":\"\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"پرفروش ترین ها\",\"slug\":\"پرفروش-ترین-ها\",\"seo_title\":\"پرفروش ترین ها\",\"seo_description\":\"پرفروش ترین ها\",\"created_at\":\"2021-12-14 11:52:52\"}]', '/admin/category/111/product', '2022-01-09 11:47:53'),
(495, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"111\"}', '[{\"id\":\"323\",\"entity_id\":\"111\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/home-v9-img-1.---176734ba.jpg\",\"alt\":\"image_category\",\"created_at\":\"2022-01-09 15:16:09\"}]', '/admin/category/111/product', '2022-01-09 11:47:53'),
(496, 81, '127.0.0.1', 'create', 'categories', 190, '', '{\"type\":0,\"seo_description\":\"ff\",\"seo_title\":\"ff\",\"parent_id\":\"168\",\"name\":\"ff\",\"H1\":\"ff\",\"robots\":\"0\",\"canonical\":null,\"description\":\"<p>ff<\\/p>\\r\\n\",\"status\":\"1\",\"slug\":\"ff\"}', '/admin/category/168/product', '2022-01-09 11:52:48'),
(497, 81, '127.0.0.1', 'create', 'photos', 324, '', '{\"entity_type\":\"Category\",\"entity_id\":190,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/home-v12-background.---65083477.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/168/product', '2022-01-09 11:52:48'),
(498, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"190\"}', '[{\"id\":\"190\",\"status\":\"1\",\"description\":\"<p>ff<\\/p>\\r\\n\",\"type\":\"0\",\"H1\":\"ff\",\"canonical\":null,\"robots\":\"0\",\"parent_id\":\"168\",\"name\":\"ff\",\"slug\":\"ff\",\"seo_title\":\"ff\",\"seo_description\":\"ff\",\"created_at\":\"2022-01-09 15:22:48\"}]', '/admin/category/190/product', '2022-01-09 11:53:20'),
(499, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"190\"}', '[{\"id\":\"324\",\"entity_id\":\"190\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/home-v12-background.---65083477.jpg\",\"alt\":\"image_category\",\"created_at\":\"2022-01-09 15:22:48\"}]', '/admin/category/190/product', '2022-01-09 11:53:20'),
(500, 81, '127.0.0.1', 'create', 'categories', 191, '', '{\"type\":0,\"seo_description\":\"ff\",\"seo_title\":\"ff\",\"parent_id\":\"0\",\"name\":\"ff\",\"H1\":\"ff\",\"robots\":\"0\",\"canonical\":\"ff\",\"description\":\"ff\",\"status\":\"1\",\"slug\":\"ff\"}', '/admin/category/0/product', '2022-01-09 11:53:41'),
(501, 81, '127.0.0.1', 'create', 'photos', 325, '', '{\"entity_type\":\"Category\",\"entity_id\":191,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/home-v12-background.---c3100f30.jpg\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/product', '2022-01-09 11:53:41');
INSERT INTO `activity_log` (`id`, `user_id`, `ip`, `type`, `target_table`, `row_id`, `where_condition`, `detailed_data`, `uri`, `created_at`) VALUES
(502, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"191\"}', '[{\"id\":\"191\",\"status\":\"1\",\"description\":\"ff\",\"type\":\"0\",\"H1\":\"ff\",\"canonical\":\"ff\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"ff\",\"slug\":\"ff\",\"seo_title\":\"ff\",\"seo_description\":\"ff\",\"created_at\":\"2022-01-09 15:23:41\"}]', '/admin/category/191/product', '2022-01-09 12:02:49'),
(503, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"191\"}', '[{\"id\":\"325\",\"entity_id\":\"191\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/home-v12-background.---c3100f30.jpg\",\"alt\":\"image_category\",\"created_at\":\"2022-01-09 15:23:41\"}]', '/admin/category/191/product', '2022-01-09 12:02:49'),
(504, 81, '127.0.0.1', 'create', 'categories', 192, '', '{\"type\":0,\"seo_description\":\"gg\",\"seo_title\":\"gg\",\"parent_id\":\"0\",\"name\":\"gg\",\"H1\":\"gg\",\"robots\":\"0\",\"canonical\":\"gg\",\"description\":\"gg\",\"status\":\"1\",\"slug\":\"gg\"}', '/admin/category/0/product', '2022-01-09 12:05:25'),
(505, 81, '127.0.0.1', 'create', 'categories', 193, '', '{\"type\":0,\"seo_description\":\"gg\",\"seo_title\":\"gg\",\"parent_id\":\"0\",\"name\":\"gg\",\"H1\":\"gg\",\"robots\":\"0\",\"canonical\":\"gg\",\"description\":\"gg\",\"status\":\"1\",\"slug\":\"gg\"}', '/admin/category/0/product', '2022-01-09 12:10:41'),
(506, 81, '127.0.0.1', 'create', 'categories', 194, '', '{\"type\":0,\"seo_description\":\"gg\",\"seo_title\":\"gg\",\"parent_id\":\"0\",\"name\":\"gg\",\"H1\":\"gg\",\"robots\":\"0\",\"canonical\":\"gg\",\"description\":\"gg\",\"status\":\"1\",\"slug\":\"gg\"}', '/admin/category/0/product', '2022-01-09 12:10:59'),
(507, 81, '127.0.0.1', 'create', 'photos', 326, '', '{\"entity_type\":\"Category\",\"entity_id\":194,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/home-v9-img-2.---d0a13fd5.png\",\"alt\":\"image_category\",\"type\":0}', '/admin/category/0/product', '2022-01-09 12:10:59'),
(508, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"194\"}', '[{\"id\":\"194\",\"status\":\"1\",\"description\":\"gg\",\"type\":\"0\",\"H1\":\"gg\",\"canonical\":\"gg\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"gg\",\"slug\":\"gg\",\"seo_title\":\"gg\",\"seo_description\":\"gg\",\"created_at\":\"2022-01-09 15:40:59\"}]', '/admin/category/194/product', '2022-01-09 12:11:02'),
(509, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"194\"}', '[{\"id\":\"326\",\"entity_id\":\"194\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/home-v9-img-2.---d0a13fd5.png\",\"alt\":\"image_category\",\"created_at\":\"2022-01-09 15:40:59\"}]', '/admin/category/194/product', '2022-01-09 12:11:02'),
(510, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"193\"}', '[{\"id\":\"193\",\"status\":\"1\",\"description\":\"gg\",\"type\":\"0\",\"H1\":\"gg\",\"canonical\":\"gg\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"gg\",\"slug\":\"gg\",\"seo_title\":\"gg\",\"seo_description\":\"gg\",\"created_at\":\"2022-01-09 15:40:41\"}]', '/admin/category/193/product', '2022-01-09 12:11:05'),
(511, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"193\"}', '[]', '/admin/category/193/product', '2022-01-09 12:11:05'),
(512, 81, '127.0.0.1', 'delete', 'categories', 0, '{\"id\":\"192\"}', '[{\"id\":\"192\",\"status\":\"1\",\"description\":\"gg\",\"type\":\"0\",\"H1\":\"gg\",\"canonical\":\"gg\",\"robots\":\"0\",\"parent_id\":\"0\",\"name\":\"gg\",\"slug\":\"gg\",\"seo_title\":\"gg\",\"seo_description\":\"gg\",\"created_at\":\"2022-01-09 15:35:25\"}]', '/admin/category/192/product', '2022-01-09 12:11:08'),
(513, 81, '127.0.0.1', 'delete', 'photos', 0, '{\"entity_id\":\"192\"}', '[]', '/admin/category/192/product', '2022-01-09 12:11:08'),
(514, 81, '127.0.0.1', 'update', 'photos', 0, '{\"entity_type\":\"Category\",\"entity_id\":168}', '{\"old\":[{\"id\":\"304\",\"entity_id\":\"168\",\"entity_type\":\"Category\",\"type\":\"0\",\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202112\\/Screenshot from 2021-12-27 10-48-46.---807b98fc.png\",\"alt\":\"image_category\",\"created_at\":\"2021-12-27 12:17:31\"}],\"new\":{\"entity_type\":\"Category\",\"entity_id\":168,\"path\":\"http:\\/\\/usedkalaV2.me\\/Storage\\/202201\\/home-v12-background.---708391ff.jpg\",\"alt\":\"image_category\",\"type\":0}}', '/admin/category/168/product', '2022-01-09 12:11:23'),
(515, 0, '127.0.0.1', 'create', 'active_codes', 365, '', '{\"user_id\":\"81\",\"code\":6932,\"expired_at\":\"2022-01-15 08:30:58\"}', '/login', '2022-01-15 05:00:57'),
(516, 81, '127.0.0.1', 'delete', 'active_codes', 0, '{\"user_id\":\"81\"}', '[{\"id\":\"365\",\"user_id\":\"81\",\"code\":\"6932\",\"expired_at\":\"2022-01-15 08:30:58\"}]', '/token', '2022-01-15 05:01:42'),
(517, 81, '127.0.0.1', 'update', 'users', 0, '{\"id\":\"85\"}', '{\"old\":[{\"id\":\"85\",\"city_id\":null,\"province_id\":null,\"user_level\":\"1\",\"phone\":\"091288976063\",\"email\":null,\"first_name\":null,\"last_name\":null,\"company\":null,\"jobtitle\":null,\"national_code\":null,\"postal_code\":null,\"address\":null,\"birthday\":null,\"gender\":null,\"status\":\"1\",\"bank_name\":null,\"bank_number\":null,\"ip\":null,\"email_verified_at\":null,\"created_at\":\"2022-01-08 09:18:13\",\"updated_at\":null}],\"new\":{\"first_name\":\"مهرزاد\",\"last_name\":\"تاج کریمی \",\"national_code\":\"0073591521\",\"province_id\":\"8\",\"city_id\":\"301\",\"postal_code\":\"072012346\",\"address\":\"مهراباد جنوبی خیابان رجبی \",\"email\":\" mehrzadth@gmail.com\",\"status\":\"1\"}}', '/admin/user/85', '2022-01-15 05:13:15'),
(518, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"23\"}', '{\"old\":[{\"id\":\"23\",\"user_id\":\"81\",\"coupon_id\":\"2\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"850000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-09 10:58:30\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/23', '2022-01-15 05:16:24'),
(519, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"22\"}', '{\"old\":[{\"id\":\"22\",\"user_id\":\"81\",\"coupon_id\":\"6\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"900000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":\"81\",\"sender_id\":null,\"status\":\"2\",\"created_at\":\"2022-01-09 08:20:16\",\"updated_at\":null}],\"new\":{\"sender_id\":\"81\",\"status\":3}}', '/admin/order/status/22', '2022-01-15 05:16:46'),
(520, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"23\"}', '{\"old\":[{\"id\":\"23\",\"user_id\":\"81\",\"coupon_id\":\"2\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"850000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-09 10:58:30\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/23', '2022-01-15 05:51:58'),
(521, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"23\"}', '{\"old\":[{\"id\":\"23\",\"user_id\":\"81\",\"coupon_id\":\"2\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"850000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":\"81\",\"sender_id\":null,\"status\":\"2\",\"created_at\":\"2022-01-09 10:58:30\",\"updated_at\":null}],\"new\":{\"sender_id\":\"81\",\"status\":3}}', '/admin/order/status/23', '2022-01-15 05:52:12'),
(522, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"23\"}', '{\"old\":[{\"id\":\"23\",\"user_id\":\"81\",\"coupon_id\":\"2\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"850000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":null,\"sender_id\":null,\"status\":\"1\",\"created_at\":\"2022-01-09 10:58:30\",\"updated_at\":null}],\"new\":{\"handler_id\":\"81\",\"status\":2}}', '/admin/order/status/23', '2022-01-15 05:53:05'),
(523, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"23\"}', '{\"old\":[{\"id\":\"23\",\"user_id\":\"81\",\"coupon_id\":\"2\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"850000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":\"81\",\"sender_id\":null,\"tracking\":\"0\",\"status_sender\":\"0\",\"status\":\"2\",\"created_at\":\"2022-01-09 10:58:30\",\"updated_at\":null}],\"new\":{\"sender_id\":\"81\",\"status\":3}}', '/admin/order/status/23', '2022-01-15 09:31:41'),
(524, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"23\"}', '{\"old\":[{\"id\":\"23\",\"user_id\":\"81\",\"coupon_id\":\"2\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"850000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":\"81\",\"sender_id\":\"81\",\"tracking\":\"0\",\"status_sender\":\"0\",\"status\":\"3\",\"created_at\":\"2022-01-09 10:58:30\",\"updated_at\":null}],\"new\":{\"tracker\":{\"postbar\":\"4556456\"},\"status_sender\":\"2\"}}', '/admin/order/tracker/23', '2022-01-15 12:34:26'),
(525, 81, '127.0.0.1', 'update', 'orders', 0, '{\"id\":\"23\"}', '{\"old\":[{\"id\":\"23\",\"user_id\":\"81\",\"coupon_id\":\"2\",\"user_full_name\":\"مهرزاد تاج کریمی\",\"user_phone\":\"09128897603\",\"city_id\":\"100\",\"province_id\":\"3\",\"postal_code\":\"1000000000\",\"address\":\"dfgzsdfgg\",\"token\":\"0\",\"order_number\":\"0\",\"weight\":\"normal\",\"item_count\":\"1\",\"grand_total\":\"850000\",\"discount_total\":\"0\",\"shipping_cost\":\"0\",\"notes\":\"\",\"handler_id\":\"81\",\"sender_id\":\"81\",\"tracking\":\"0\",\"status_sender\":\"0\",\"status\":\"3\",\"created_at\":\"2022-01-09 10:58:30\",\"updated_at\":null}],\"new\":{\"tracking\":{\"postbar\":\"4556456\"},\"status_sender\":\"2\"}}', '/admin/order/tracker/23', '2022-01-15 12:34:59');

-- --------------------------------------------------------

--
-- Table structure for table `attributes`
--

CREATE TABLE `attributes` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_product`
--

CREATE TABLE `attribute_product` (
  `id` int NOT NULL,
  `attribute_id` int NOT NULL,
  `product_id` int NOT NULL,
  `value_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `attribute_values`
--

CREATE TABLE `attribute_values` (
  `id` int NOT NULL,
  `attrebute_id` int NOT NULL,
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `seo_robot` tinyint NOT NULL COMMENT '0=Index 1=Noindex 2=Nofollow 3=Follow 4=None 5=Noimageindex 6=Noarchive 7=Nocache',
  `seo_canonical` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `seo_H1` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `seo_description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `seo_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `meta_title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `slug`, `title`, `value`, `seo_robot`, `seo_canonical`, `seo_H1`, `seo_description`, `seo_title`, `meta_title`, `created_at`) VALUES
(13, 'پست-جدید', 'پست جدید', '<p>لورم ایپسوم</p>\r\n', 0, '', 'پست جدید', 'لورم ایپسوم', 'پست جدید', 'لورم ایپسوم', '2021-12-13 14:26:28');

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` int NOT NULL,
  `blog_id` int NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT '',
  `html_title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT '',
  `html_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci,
  `canonical` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT '',
  `robots` tinyint DEFAULT '0' COMMENT '0=Noindex 1=Index 2=Nofollow 3=Follow 4=None 5=Noimageindex 6=Noarchive 7=Nocache',
  `logo` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `sort` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name`, `slug`, `html_title`, `html_desc`, `canonical`, `robots`, `logo`, `sort`, `created_at`, `updated_at`) VALUES
(10, 'HPE', '', '', NULL, '', 0, NULL, NULL, '2021-12-14 09:36:38', NULL),
(11, 'Cisco', '', '', NULL, '', 0, NULL, NULL, '2021-12-14 09:36:38', NULL),
(12, 'INTEL', '', '', NULL, '', 0, NULL, NULL, '2021-12-14 09:36:38', NULL),
(13, 'EMC', '', '', NULL, '', 0, NULL, NULL, '2021-12-14 09:36:38', NULL),
(14, 'HP', '', '', NULL, '', 0, NULL, NULL, '2021-12-14 09:36:38', NULL),
(15, 'ADATA', '', '', NULL, '', 0, NULL, NULL, '2021-12-14 09:36:38', NULL),
(16, 'VMware', '', '', NULL, '', 0, NULL, NULL, '2021-12-14 11:34:35', NULL),
(17, 'Sophos', '', '', NULL, '', 0, NULL, NULL, '2021-12-14 11:35:58', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL COMMENT 'session save'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci,
  `type` tinyint UNSIGNED DEFAULT '0' COMMENT '0=product 1=blog',
  `H1` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `canonical` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `robots` tinyint DEFAULT '0' COMMENT '0=Noindex 1=Index 2=Nofollow 3=Follow 4=None 5=Noimageindex 6=Noarchive 7=Nocache',
  `parent_id` int DEFAULT '0',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT '',
  `seo_title` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT '',
  `seo_description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `status`, `description`, `type`, `H1`, `canonical`, `robots`, `parent_id`, `name`, `slug`, `seo_title`, `seo_description`, `created_at`) VALUES
(106, 1, '<h2 style=\"text-align: justify;\"><strong>نکاتی که در زمان خرید سرور دست دوم باید به آن توجه کنیم!</strong></h2>\r\n<p style=\"text-align: justify;\">افزایش روز افزون قطعات سخت افزاری از جمله سرور موجب شده تا بسیاری از شرکت ها توانایی تامین بودجه زیاد برای خرید آن را نداشته باشند به خصوص اگر سرور مورد نظرشان توسط کمپانی های بزرگ و معروفی نیز ساخته شده باشد از این رو اغلب خریداران سرورها به بازارهایی که سرور کارکرده به فروش می رسانند مراجعه می کنند زیرا دیگر مجبور نیستند که هزینه بالایی را برای خرید سرور پرداخت کنند.</p>\r\n<p style=\"text-align: justify;\">سرورهای کارکرده قبلا مدت زمان بسیار اندکی توسط سایر سازمان ها و یا شرکت ها استفاده شده اند، این سازمان ها سرور های خود را با توجه به پیشرفت تکنولوژی فورا تعویض می کنند از این رو سرورهای کارکرده خود را به بازار سرورهای دسته دوم می سپارند تا با قیمتی معقولانه به فروش برسد.انتخاب و خرید سرور دست دوم بسیار حساس می باشد و لازم است که در این زمینه از اطلاعات لازم و کافی&nbsp; برخوردار باشید، زیرا سرورها اصلی ترین و مهم ترین زیر ساختار شبکه محسوب می شوند، از جمله مهم ترین مواردی که در زمان خرید سرور کارکرده باید مدنظر قرار دهید شامل: میزان فضای مورد استفاده در هارد دیسک- حافظه داخلی و کارت گرافیکی- مدل CPU است، لازم است که بدانید ویژگی های فنی مذکور قابلیت ارتقا با توجه به نیاز مشتری را دارد.</p>\r\n<h2 style=\"text-align: justify;\"><strong>در زمان خرید سرور دست دوم باید به چه نکاتی توجه کنیم؟</strong></h2>\r\n<h3 style=\"text-align: justify;\"><strong>از فروشنده قابل اعتماد سرور خریداری کنید</strong></h3>\r\n<p style=\"text-align: justify;\">- در زمان انتخاب سرور به نوع هارد دقت کنید زیرا که نوع هارد در این زمینه بسیار مهم می باشد اگر سرور مورد نظر شما دارای هارد و یا درایورهای 2.5 اینچی باشد هزینه ای که برای خرید آن باید بپردازید بالا می باشد، حتما به این نکته نیز توجه داشته باشید که آیا سرور قابلیت راه اندازی بدون رید کنترلر را دارد؟ زیرا برخی سرورهای کارکرده دارای رید کنترل هایی با پهنای باند اندک هستند از این رو می بایست حتما سرور با رید راه اندازی شود که این امر موجب کاهش کیفیت درایورهای SSD می شود.</p>\r\n<p style=\"text-align: justify;\">- حتما مدت زمانی که سرور مورد استفاده قرار گرفته است را در نظر بگیرید که این امر را براساس سال تولید سرور باید بسنجید به عنوان مثال سرور مدل G6 شرکت HP در سال 2011 &nbsp;وارد بازار شده است.</p>\r\n<p style=\"text-align: justify;\">- برای بررسی کردن پارت نامبر- فرکانس و... می توانید از طریق ILO این کار را انجام دهید، پارت نامبر را در لیست شرکت تولید کننده رک سرور مشاهده کیند تا اطمینان کسب کنید که مدل CPU- میزان حافظه و سایر مشخصات آن صحیح درج شده است.</p>\r\n<h3 style=\"text-align: justify;\"><strong>سرور دست دوم رده پایین</strong></h3>\r\n<p style=\"text-align: justify;\">- برخی سرور های دسته دوم در بازار وجود دارد که قیمت پایینی دارند که می توانند پاسخگوی برخی نیاز ها مانند اشتراک گذاری انواع فایل ها- ایمیل ها و پرینتر برای حدود 10 کاربر می باشد.</p>\r\n<p style=\"text-align: justify;\">این سرورها معمولا به صورت ایستاده هستند که به آن رکمونت نیز می گویند و دارای 4 هارد دیسک از نوع SATA می باشند، لازم است که بدانید حداقل حافظه سرورهای کارکرده 4 گیگابایت می باشد که می توانید آن ها را تا 64 گیگابایت نیز ارتقا دهید.</p>\r\n<p style=\"text-align: justify;\">- بهتر است مدلی را انتخاب نمایید که 3 الی 4 هاردو درایور اضافی داشته باشد معمولا سرور دست دوم با کمترین قیمت دارای 5 اسلات می باشد که ریدکنترلرهای 64 بیتی یا آداپتور پرسرعت روی 2 اسلات آن قرار گرفته است.</p>\r\n<h3 style=\"text-align: justify;\"><strong>سرور دست دوم رده متوسط</strong></h3>\r\n<p style=\"text-align: justify;\">- این سرور ها به صورت ایستاده بوده و دارای ارتفاع 1 الی 4 یونیت می باشند و &nbsp;این قابلیت را دارند که مدیریت چندین کار را به صورت همزمان برعهده بگیرند.</p>\r\n<p style=\"text-align: justify;\">- همچنین می توان از چندین سرور دست دوم یا کارکرده به صورت همزمان استفاده کرد در این حالت سرورها به صورت خوشه ای عمل سرویس دهی را انجام می دهند.</p>\r\n<p style=\"text-align: justify;\">- سرورهای دسته دوم رده متوسط قابلیت پشتیبانی از دو یا چهار پردازنده را به صورت همزمان دارند و حافظه رم آن ها در حد 3 ترابایت می باشد.</p>\r\n<p style=\"text-align: justify;\">- در زمان خرید توجه داشته باشید که این مدل سرور می بایست دارای هارددیسک- فن و منبع تغذیه نیز باشد همچنین امکان اضافه کردن سخت افزارهای اکسترنال به این مدل سرورها وجود دارد.</p>\r\n<h2 style=\"text-align: justify;\"><strong>آیا عملکرد سرور دست دوم برای برآورده کردن نیاز کسب و کار مناسب می باشد؟</strong></h2>\r\n<p style=\"text-align: justify;\">برخی افراد تصور می کنند که سرور های دسته دوم قادر به برآورده کردن نیاز کسب و کارها نمی باشند در حالی این تصور کاملا غلط است بلکه یک سرور دست دوم می تواند مانند یک سرور جدید فعالیت و راندمانی تاثیر گذار داشته باشد، زیرا که سخت افزارهایی که در سرورها وجود دارد را می توانید ارتقا دهید به عنوان مثال می توانید پردازنده سرور خود را با مدل بالاتری که در بازار موجود است تعویض کنید و از این طریق قدرت پردازش را افزایش دهید.</p>\r\n<p style=\"text-align: justify;\">نکته ای که لازم است بدانید این است که شرکت های بزرگ براساس قراردادی که با شرکت های تامین کننده تجهیزات سخت افزاری دارند می بایست هر چند سال یک بار به صورت کامل سرور خود را با مدل جدیدتر تعویض کنند، تعویض این سرورها به این معنا نیست که سرور های قبلی دچار مشکل و یا خرابی شده اند بلکه این کار هدف تجاری دارد.اغلب سرورهایی که با نام دسته دوم وارد بازار می شوند می توانند حداقل تا 10 سال آینده به خوبی کار کنند.</p>\r\n<p style=\"text-align: justify;\">حتما در زمان خرید سرور کارکرده دقت کنید که از نظر ظاهری و سخت افزاری بدون نقص و ایراد باشد در این حالت سرور شما می تواند تا چندین سال بدون هیچگونه مشکلی نیازهای کسب و کار شما را از نظر عملکردی برآورده سازد.اگر سروری که خریدداری می کنید یک الی دو نسل با نسل جدید که در بازار وجود دارد فاصله داشته باشد به راحتی می توانید قطعات سخت افزاری آن را در بازار خریداری کرده و آن را ارتقا دهید از این رو در صورتی که سرور دست دوم در سال های بعد دچار خرابی نیز شود به راحتی می توانید با تعویض قطعات آن را تعمیر کنید.اغلب شرکت های بزرگ احتمال خرابی برخی قطعات سرور را از قبل می دهند از این رو آن قطعات را خریداری و انبار می کنند و در صورت خرابی قطعات مورد نیاز در دسترشان می باشد و کسب و کار آن ها هرگز با خرابی&nbsp; سرور مواجه نمی شود.</p>\r\n<p style=\"text-align: justify;\">&nbsp;</p>', 0, 'سرور دست دوم', '', 0, 0, 'سرور', 'سرور', 'خرید انواع سرور دست دوم', 'خرید انواع سرور دست دوم', '2021-12-14 08:22:52'),
(107, 1, '', 0, 'ذخیره ساز', '', 0, 0, 'ذخیره ساز', 'ذخیره-ساز', 'ذخیره ساز', 'ذخیره ساز', '2021-12-14 08:22:52'),
(108, 1, '', 0, 'تجهیزات شبکه', '', 0, 0, 'تجهیزات شبکه', 'تجهیزات-شبکه', 'تجهیزات شبکه', 'تجهیزات شبکه', '2021-12-14 08:22:52'),
(109, 0, '', 0, 'جدیدترین محصولات', '', 0, 0, 'جدیدترین محصولات', 'جدیدترین-محصولات', 'جدیدترین محصولات', 'جدیدترین محصولات', '2021-12-14 08:22:52'),
(110, 0, '', 0, 'حراجی', '', 0, 0, 'حراجی', 'حراجی', 'حراجی', 'حراجی', '2021-12-14 08:22:52'),
(112, 1, '', 0, 'سرور باندلی - BTO', '', 0, 106, 'سرور باندلی - BTO', 'سرور-باندلی---BTO', 'سرور باندلی - BTO', 'سرور باندلی - BTO', '2021-12-14 08:22:52'),
(113, 1, '', 0, 'قطعات داخل سرور', '', 0, 106, 'قطعات داخل سرور', 'قطعات-داخل-سرور', 'قطعات داخل سرور', 'قطعات داخل سرور', '2021-12-14 08:22:52'),
(114, 1, '', 0, 'Storage', '', 0, 107, 'Storage', 'Storage', 'Storage', 'Storage', '2021-12-14 08:22:52'),
(115, 1, '', 0, 'Hard Drive', '', 0, 107, 'Hard Drive', 'Hard-Drive', 'Hard Drive', 'Hard Drive', '2021-12-14 08:22:52'),
(116, 1, '', 0, 'Controller', '', 0, 107, 'Controller', 'Controller', 'Controller', 'Controller', '2021-12-14 08:22:52'),
(117, 1, '', 0, 'لوازم جانبی ذخیره ساز', '', 0, 107, 'لوازم جانبی ذخیره ساز', 'لوازم-جانبی-ذخیره-ساز', 'لوازم جانبی ذخیره ساز', 'لوازم جانبی ذخیره ساز', '2021-12-14 08:22:52'),
(118, 1, '', 0, 'Tape Libraries', '', 0, 107, 'Tape Libraries', 'Tape-Libraries', 'Tape Libraries', 'Tape Libraries', '2021-12-14 08:22:52'),
(119, 1, '', 0, 'Tape Drives', '', 0, 107, 'Tape Drives', 'Tape-Drives', 'Tape Drives', 'Tape Drives', '2021-12-14 08:22:52'),
(120, 1, '', 0, 'Disk Enclosures', '', 0, 107, 'Disk Enclosures', 'Disk-Enclosures', 'Disk Enclosures', 'Disk Enclosures', '2021-12-14 08:22:52'),
(121, 1, '', 0, 'San Switch', '', 0, 107, 'San Switch', 'San-Switch', 'San Switch', 'San Switch', '2021-12-14 08:22:52'),
(122, 1, '<h2><strong>نکاتی که در زمان خرید رک سرور دست دوم باید بدانید!</strong></h2>\r\n<p>رک سرور محفظه ای است که برای نگهداری تجهیزات شبکه مانند روتر- سوییچ و... مورد استفاده قرار می گیرد، یکی از مهم ترین مزایای رک محافظت از سرور در برابر صدمات فیزیکی مانند ضربه و فشار و... می باشد، رک ها در دو نوع دیواری و ایستاده در بازار موجود می باشند اما از انجا که در سال های اخیر فروش وسایل و تجهیزات شبکه کارکرده مرسوم شده می توانید رک سرور کارکرده را با قیمت پایین تری خریداری کنید.نباید چنین تصور کنید که رک سرور دسته دوم ممکن است دچار خرابی و یا هر گونه مشکل خاصی باشد شما می توانید با کسب اطلاعات لازم در این زمینه و مراجعه به بازار تجهیزات شبکه دسته دوم از هر لحاظ رک سروری را که پسندیده اید مورد بررسی قرار دهید.</p>\r\n<p>در این مقاله می خواهیم به بررسی خرید رک سرور کارکرده بپردازیم برای کسب اطلاعات در این زمینه با ما همراه باشید:</p>\r\n<p>برای این که در زمان خرید رک سرور دسته دوم اطلاعات کافی داشته باشید لازم است ابتدا با انواع رک سرور آشنا شوید از این رو در این بخش از مقاله به صورت مختصر انواع رک سرور را مورد بررسی قرار می دهیم</p>\r\n<h2><strong>معرفی انواع رک دست دوم</strong></h2>\r\n<h3><strong>- رک سرور دیواری</strong></h3>\r\n<p>&nbsp;&nbsp;رک های دیواری در ارتفاع های مختلفی وجود دارد که آنچه که در بازار رک سرورهای کارکرده می توانید پیدا کنید در ارتفاع عای 5-6-7 و 9 یونیت می باشد (یونیت واحد سنجش ارتفاع رک می باشد) هر یونیت برابر 5/43 میلی متر است، علاوه بر ارتفاع از نظر عمق نیز با هم فرق دارند که معمولا در حدود 35- 45 و یا 60 سانتی متر می باشد.از کید رکمونت ها برای جایگزاری سوئیچ های با سایز کوچوک غیر رکمونت بر روی دیوار استفاده خواهد شد، و عمق آن ها در حدود 29 سانتی متر می باشد.رک سرور 9 یونیت دارای تنوع بیشتری است و قاب هایی که در قسمت چپ و راست رک قرار گرفته به صورت کامل باز می شود و از این طریق می توانید از بغل نیز به رک دستر سی داشته باشید.</p>\r\n<p>برخی از انواع رک سرورهای دیواری نیز از قابلیت چرخش 100 درجه ای برخوردارند و این امکان را برای کاربر فراهم می کنند که از پشت بتوانند به رک دسترسی داشته باشند البته این نوع رک سرور برای سوئیچ هایی که در قسمت پشت آنها ماژول وجود دارد استفاده می شود، بر روی رک های دیواری می توانید پاور یونیت های 3 و 4 پورت و فن 12 سانتی متری را نصب کرد.</p>\r\n<h3><strong>رک های ایستاده</strong></h3>\r\n<p>رک ایستاده نوع دیگری از رک سرورها می باشد که در بازار و سایت های فروش رک سرور کارکرده نیز موجود می باشد اگر قصد خرید رک سرور کارکرده از نوع ایستاده دارید بهتر است اطلاعاتی در مورد این رک داشته باشید.در این نوع رک سرور انواع پچ پنل- سرور- یو پی اس- سوئیچ و مابقی قطعات رکمونت 19 اینچی را قرار می دهند و از این طریق بر روی این قطعات می توان نظارت داشت.رک های ایستاده در حالت استاندارد دارای 1 عدد فن- 4 عدد چرخ و 4 پایه ثابت می باشند که از قسمت های بالا و پایین برای انواع کابل ها ورودی هایی تعبیه شده است، این نوع رک سرور ازهر چهار طرف قابل باز شدن می باشد و در ارتفاع های مختلفی از جمله 16- 21- 28- 36- 40و 44 یونیت و عمق های 60-80 و100 سانتی متری تولید و در بازار موجود می باشد.</p>\r\n<p>از ویژگی های این نوع رک سرور می توان به قابلیت نصب 1 الی 4 فن در داخل این رک ها اشاره کرد، ولیکن در حالت پیش فرض در زمان خرید دارای 1 فن می باشد همچنین می توان پاور ماژول های 8 پورت و 9 پورت افقی را داخل این رک سرورها نصب کرد و با توجه به ارتفاع آن امکان نصب پاور ماژول های عمودی نیز وجود دارد.</p>\r\n<h2><strong>نکاتی که در زمان خرید رک سرور دسته دوم باید رعایت کنیم کدامند؟</strong></h2>\r\n<h3><strong>1- مدل جدید را خریداری کنید</strong></h3>\r\n<p>یکی از مهم ترین نکاتی که در زمان خرید رک سرور کارکرده باید به آن دقت داشته باشید جدید و به روز بودن آن است، زیرا شما می خواهید تجهیزات شبکه را در این محفظه نگهداری کنید و هرکدام از این تجهیزات نیز براساس فناوری و تکنولوژی روز دنیا در حال تغییر می باشند از این رو برای این که بتوان آن ها را داخل رک سروری قرار دهید می بایست جایگاه قرار گیری هر کدام از آن ها کاملا مناسب تعبیه شده باشد.</p>\r\n<h3><strong>2- رک سروری را انتخاب کنید که مدت زمان کمتری کار کرده باشد</strong></h3>\r\n<p>قطعا هر وسیله ای که مدت زمان بیشتری استفاده شده باشد قطعات آن فرسوده شده و احتمال این که سریعتر کارایی خود را از دست بدهد وجود دارد لذا بهتر است در زمان خرید حتما به این نکته دقت داشته باشید رک سرور دست دوم سالمی را خریداری کنید. به تغییر رنگ- ورودی های کابل- قاب های بغل- چرخ (در صورتی که قصد خرید نوع ایستاده را دارید)- دستگاه تهویه و... توجه کنید.</p>\r\n<h3><strong>3- ارزان بخرید</strong></h3>\r\n<p>هدف شما از خرید رک سرور کارکرده قیمت ارزان تر است دقت داشته باشید که قیمت آن با مدل های نو، باید بیش از 50 درصد تفاوت داشته باشد زیرا اگر قرار باشد که این دو با هم تفاوت قیمت کمی داشته باشند بهتر است رک سرور نو را خریداری کنید که به طور قطع دارای گارانتی نیز می باشد.</p>\r\n<h3><strong>4- جنس گارانتی دار بخرید</strong></h3>\r\n<p>شاید تعجب کنید که چگونه جنس دسته دوم می تواند دارای گارانتی باشد، اما لازم است که بدانید برخی از دستگاه های دسته دوم نیز دارای گارانتی می باشند و حتی مدت زمان آن هم طولانی است، اگر بتوانید رک سرور دسته دوم گارنتی دار پیدا کنید دیگر هیچ نکرانی بابت خریدتان نخواهید داشت.</p>', 0, 'رک و لوازم جانبی', '', 0, 108, 'رک و لوازم جانبی', 'رک-و-لوازم-جانبی', 'رک و لوازم جانبی', 'رک و لوازم جانبی', '2021-12-14 08:22:52'),
(123, 1, '<h2><strong>راهنمای خرید سوئیچ شبکه دست دوم</strong></h2>\r\n<p>چندی است که در بیشتر کسب و کارهای متفاوت و منازل به میزان قابل توجهی کمبود تجهیزات شبکه احساس می شود. حال در این میان یکی از سخت افزار هایی که می توان از آن به عنوان پایه و بیس شبکه نام برد، سوئیچ شبکه است. در واقع سوئیچ شبکه می تواند موجب ایجاد اتصال بین چند رایانه، پرینتر، تلفن IP، دوربین مداربسته و ... شود که طبق نیاز مشتری به 5، 8، 16، 24، 48، 52 پورت تقسیم می شوند.از این رو مدتی است که وب سایت های متفاوت اینترنتی در فضای مجازی شروع به خرید و فروش این محصول کرده اند. در واقع مشتری می تواند با صرف هزینه ای پایین تر به انتخاب سوئیچ شبکه کار کرده اقدام و از آن نهایت استفاده را ببرد. در حقیقت با ورود به این وب سایت ها می توانید محصولات شبکه از قبیل روتر، مودم روتر، مودم، سوئیچ آنتن خارجی، کابل و ... را با هزینه ای کمتر از نرخ بازار پیدا کنید.</p>\r\n<h2><strong>مفهوم سوئیچ شبکه و نوع عملکرد آن</strong></h2>\r\n<p>افرادی که قصد اتصال Node را در شبکه داشته باشند می بایست با بهره گیری از قطعاتی همچون روتر، هاب، مودم، سوئیچ و ... امکان اتصال بین سیستم های مورد نظر را فراهم بیاورند. اتصال در سوئیچ شبکه می تواند امکان جابه جایی اطلاعات را برای کاربر میسر کند. همان گونه که می دانید تمام اطلاعات موجود در شبکه با استفاده از بسته، داده و فریم منتقل می شود. علاوه بر آن هر فریم حاوی اطلاعاتی نظیر آدرس مبدا و آدرس مقصد می باشد.</p>\r\n<p>حال سوئیچ ها بر اساس نوع آدرس موجود در بخش مقصد داده، پورت را تشخیص و اطلاعات را به این آدرس ارسال می کند. شایان ذکر است که آدرس (MAC Address) هر سیستمی منحصر به فرد بوده و تنها مختص به یک دستگاه مشخص است. از این رو سوئیچ با دریافت مک آدرس مقصد می تواند اطلاعات را به صاحب اصلی آن برساند. از طرفی هم این مک آدرس ها را در جدولی به نام جدول مک آدرس ذخیره می کند.</p>\r\n<h2><strong>برای خرید سوئیچ شبکه کار کرده اقدام کنیم؟</strong></h2>\r\n<p>در حالت کلی می توان گفت اگر شکل ظاهری این دستگاه برای شما اهمیت چندانی نداشته باشد و بیش از هر چیزی به عملکرد آن حساس باشید، می توانید با صرف هزینه ای معقول خریدی مناسب با هزینه ای پایین را پیش روی خود داشته باشید. در این میان قطعاتی همچون مودم و روتر جزو لوازمی هستند که حساسیت چندانی ندارند و مسائلی همچون سوختگی پیکسل، ضربه نمایشگر، خش و مشکلاتی از این دست را نخواهند داشت. در واقع مسئله مهم تنها عملکرد صحیح این قطعات در سوئیچ شبکه دست دوم است.</p>\r\n<p>در صورتی که بتوانید سوئیچ شبکه ای را پیدا کنید که درجه کیفی بالایی داشته و بتواند برای شما به درستی کار کند، نباید چندان به ظاهر آن اهمیت داد. چرا که بعضا ممکن است افرادی بنا به دلایل مختلف از جمله تغییر محیط کار، به روز رسانی شبکه و ... تصمیم به فروش این محصولات بگیرند. با چنین شرایطی شما می توانید نسبت به خرید سوئیچ شبکه کار کرده مورد نظر خود اقدام کرده و محصول مورد نیاز خود را خریداری کنید.</p>\r\n<h2><strong>پیش از خرید سوئیچ شبکه دست دوم چه مواردی را باید در نظر داشت؟</strong></h2>\r\n<p>توجه داشته باشید که قطعاتی همچون مودم ها و روتر ها باید به روز باشند. در حقیقت هنگامی که قصد خرید سوئیچ شبکه دست دوم را دارید بهتر است مدل هایی را انتخاب کنید که نمونه نو آن نیز در بازار های فروش وجود داشته باشند. در چنین حالتی می توان گفت که با خرید کالای کار کرده علاوه بر کیفیت مطلوب، خرید ارزان تری را انجام داده اید. توجه داشته باشید دستگاه هایی که چند سال از عمر مفیدشان گذسته باشد، حال چه سیستم مورد نظر شما دست دوم بوده و چه نو، نمی تواند عملکرد چندان موفقی را برای کاربر داشته باشد.</p>\r\n<p>برخی از قطعات پس از گذشت مدتی بلا استفاده شده و ارزش چندانی نخواهند داشت. به عنوان مثال با پیشرفت تکنولوژی در تولید قطعاتی همچون مودم، امروزه خرید مودم های ADSL یا 3G کار چندان عاقلانه ای به نظر نمی رسد. از این رو بهتر است پیش از سفارش سوئیچ شبکه کار کرده مورد نظر خود تمام جوانب آن را بسنجید.حال در این میان می توان گفت که یکی از مهم ترین دلایل هر فردی برای خرید دستگاه های دست دوم مورد نظر خود، پایین تر بودن قیمت سیستم است. با این تفاسیر تفاوت قیمت هایی همچون 10 یا 20 هزار تومان با بازار نمی تواند چندان منطقی به نظر برسد از این رو در چنین شرایطی پیشنهاد ما خرید سیستم نو می باشد. اما در صورتی که سوئیچ شبکه دست دوم را با تفاوت قیمت بالا تری پیدا کنید، می توانید بگویید که خرید دست دوم اقتصادی تر و توجیه پذیری داشتید.</p>\r\n<p>تلاش کنید دستگاه هایی را انتخاب کنید که دارای گارانتی باشند. در حقیقت برخی از برند ها ضمانت های بلند مدتی را برای دستگاه های خود در نظر گرفته و آن را به مشتریان خود عرضه می کنند. در واقع بسیاری از افراد سیستم هایی که ضمانت دارند را تعویض و دستگاه قدیمی را به فروش می رسانند. چنانچه بتوانید این دستگاه ها را خریداری کنید هیچ نگرانی از بابت خرابی دستگاه نخواهید داشت و می توان با خیال راحت سیستم مورد نیاز خود را سفارش دهید.</p>\r\n<h2><strong>انواع سوئیچ شبکه دست دوم و تفاوت آن ها</strong></h2>\r\n<p>در حالت کلی سوئیچ های شبکه به چند دسته متفاوت تقسیم بندی می شوند که از جمله آن شامل:</p>\r\n<p>1 - سوئیچ شبکه غیر مدیریتی یا Unmanaged</p>\r\n<p>2 - سوئیچ شبکه اترنت یا LAN</p>\r\n<p>3 - سوئیچ شبکه POE Switch که با حرف اختصار POE خوانده می شود</p>\r\n<p>4 - سوئیچ شبکه مدیریتی یا Managed Switch</p>\r\n<p>5 - سوئیچ شبکه هوشمند یا Smart Switch</p>\r\n<p>6 - سوئیچ شبکه مدیریتی انترپرایزی یا Enterprise Managed Switch</p>\r\n<p>همان گونه که می دانید انواع دسته های سوئیچ شبکه دست دوم با توجه به نوع نیاز کاربران در مدل های متفاوتی که عنوان شد طراحی و ساخته شده اند که مهم ترین تفاوت میان سوئیچ های شبکه مدیریتی و غیر مدیریتی را می توان توانایی کانفیگ کردن سوئیچ و اولویت دهی به ترافیک LAN دانست. در واقع با این کار می توان مهم ترین اطلاعات را در اولویت ارسال قرار داد.</p>', 0, 'سوئیچ شبکه دست دوم', '', 0, 108, 'سوئیچ شبکه', 'سوئیچ-شبکه', 'فروش سوئیچ شبکه دست دوم | یوزد کالا', 'فروش انواع سوئیچ شبکه دست دوم و کارکرده | انواع سوئیچ شبکه های دست دوم در برندهای مختلف | فروشگاه یوزد کالا', '2021-12-14 08:22:52'),
(124, 1, '', 0, 'روتر', '', 0, 108, 'روتر', 'روتر', 'روتر', 'روتر', '2021-12-14 08:22:52'),
(125, 1, '', 0, 'Access Point', '', 0, 108, 'Access Point', 'Access-Point', 'Access Point', 'Access Point', '2021-12-14 08:22:52'),
(126, 1, '', 0, 'هاب', '', 0, 108, 'هاب', 'هاب', 'هاب', 'هاب', '2021-12-14 08:22:53'),
(127, 1, '', 0, 'Modal', '', 0, 108, 'Modal', 'Modal', 'Modal', 'Modal', '2021-12-14 08:22:53'),
(128, 1, '', 0, 'Pach Panel', '', 0, 108, 'Pach Panel', 'Pach-Panel', 'Pach Panel', 'Pach Panel', '2021-12-14 08:22:53'),
(129, 1, '', 0, 'Patch Cord', '', 0, 108, 'Patch Cord', 'Patch-Cord', 'Patch Cord', 'Patch Cord', '2021-12-14 08:22:53'),
(130, 1, '', 0, 'فایروال', '', 0, 108, 'فایروال', 'فایروال', 'فایروال', 'فایروال', '2021-12-14 08:22:53'),
(131, 1, '', 0, 'تلفن IP', '', 0, 108, 'تلفن IP', 'تلفن-IP', 'تلفن IP', 'تلفن IP', '2021-12-14 08:22:53'),
(132, 1, '', 0, 'Notebook', '', 0, -1, 'Notebook', 'Notebook', 'Notebook', 'Notebook', '2021-12-14 08:22:53'),
(133, 1, '', 0, 'All In One', '', 0, -1, 'All In One', 'All-In-One', 'All In One', 'All In One', '2021-12-14 08:22:53'),
(134, 1, '', 0, 'Thin Client', '', 0, -1, 'Thin Client', 'Thin-Client', 'Thin Client', 'Thin Client', '2021-12-14 08:22:53'),
(135, 1, '', 0, 'Tablet', '', 0, -1, 'Tablet', 'Tablet', 'Tablet', 'Tablet', '2021-12-14 08:22:53'),
(136, 1, '', 0, 'Speaker', '', 0, -1, 'Speaker', 'Speaker', 'Speaker', 'Speaker', '2021-12-14 08:22:53'),
(137, 1, '', 0, 'Flash Memory', '', 0, -1, 'Flash Memory', 'Flash-Memory', 'Flash Memory', 'Flash Memory', '2021-12-14 08:22:53'),
(139, 1, '', 0, 'پرینتر', '', 0, -1, 'پرینتر', 'پرینتر', 'پرینتر', 'پرینتر', '2021-12-14 08:22:53'),
(140, 1, '', 0, 'اسکنر', '', 0, -1, 'اسکنر', 'اسکنر', 'اسکنر', 'اسکنر', '2021-12-14 08:22:53'),
(141, 1, '', 0, 'فکس', '', 0, -1, 'فکس', 'فکس', 'فکس', 'فکس', '2021-12-14 08:22:53'),
(142, 1, '', 0, 'POS', '', 0, -1, 'POS', 'POS', 'POS', 'POS', '2021-12-14 08:22:53'),
(143, 1, '', 0, 'ویدئو پروژکتور', '', 0, -1, 'ویدئو پروژکتور', 'ویدئو-پروژکتور', 'ویدئو پروژکتور', 'ویدئو پروژکتور', '2021-12-14 08:22:53'),
(145, 1, '', 0, 'ساعت هوشمند', '', 0, -1, 'ساعت هوشمند', 'ساعت-هوشمند', 'ساعت هوشمند', 'ساعت هوشمند', '2021-12-14 08:22:53'),
(146, 1, '', 0, 'IoT', '', 0, -1, 'IoT', 'IoT', 'IoT', 'IoT', '2021-12-14 08:22:53'),
(148, 1, '', 0, 'BASE', '', 0, 113, 'BASE', 'BASE', 'BASE', 'BASE', '2021-12-14 08:22:53'),
(149, 1, '', 0, 'CPU', '', 0, 113, 'CPU', 'CPU', 'CPU', 'CPU', '2021-12-14 08:22:53'),
(150, 1, '', 0, 'Heatsink', '', 0, 113, 'Heatsink', 'Heatsink', 'Heatsink', 'Heatsink', '2021-12-14 08:22:53'),
(151, 1, '', 0, 'RAM', '', 0, 113, 'RAM', 'RAM', 'RAM', 'RAM', '2021-12-14 08:22:53'),
(152, 1, '', 0, 'Hard Drive', '', 0, 113, 'Hard Drive', 'Hard-Drive', 'Hard Drive', 'Hard Drive', '2021-12-14 08:22:53'),
(153, 1, '', 0, 'Memory Upgrade', '', 0, 113, 'Memory Upgrade', 'Memory-Upgrade', 'Memory Upgrade', 'Memory Upgrade', '2021-12-14 08:22:53'),
(154, 1, '', 0, 'Optical Drives', '', 0, 113, 'Optical Drives', 'Optical-Drives', 'Optical Drives', 'Optical Drives', '2021-12-14 08:22:53'),
(155, 1, '', 0, 'Power', '', 0, 113, 'Power', 'Power', 'Power', 'Power', '2021-12-14 08:22:53'),
(156, 1, '', 0, 'HBA', '', 0, 113, 'HBA', 'HBA', 'HBA', 'HBA', '2021-12-14 08:22:53'),
(157, 1, '', 0, 'Storage Controllers', '', 0, 113, 'Storage Controllers', 'Storage-Controllers', 'Storage Controllers', 'Storage Controllers', '2021-12-14 08:22:53'),
(158, 1, '', 0, 'License', '', 0, 113, 'License', 'License', 'License', 'License', '2021-12-14 08:22:53'),
(159, 1, '', 0, 'Network Controller', '', 0, 113, 'Network Controller', 'Network-Controller', 'Network Controller', 'Network Controller', '2021-12-14 08:22:53'),
(160, 1, '', 0, 'لوازم جانبی', '', 0, 113, 'لوازم جانبی', 'لوازم-جانبی', 'لوازم جانبی', 'لوازم جانبی', '2021-12-14 08:22:53'),
(161, 1, '', 0, 'Hewlett Packard Enterprise', '', 0, -1, 'Hewlett Packard Enterprise', 'Hewlett-Packard-Enterprise', 'Hewlett Packard Enterprise', 'Hewlett Packard Enterprise', '2021-12-14 08:22:53'),
(162, 1, '', 0, 'Cisco', '', 0, -1, 'Cisco', 'Cisco', 'Cisco', 'Cisco', '2021-12-14 08:22:53'),
(163, 1, '', 0, 'Dell EMC', '', 0, -1, 'Dell EMC', 'Dell-EMC', 'Dell EMC', 'Dell EMC', '2021-12-14 08:22:53'),
(164, 1, '', 0, ' VMware', '', 0, -1, ' VMware', ' VMware', ' VMware', ' VMware', '2021-12-14 08:22:53'),
(165, 1, '', 0, 'Intel', '', 0, -1, 'Intel', 'Intel', 'Intel', 'Intel', '2021-12-14 08:22:53'),
(166, 1, '', 0, 'SOPHOS', '', 0, -1, 'SOPHOS', 'SOPHOS', 'SOPHOS', 'SOPHOS', '2021-12-14 08:22:53'),
(167, 1, '', 0, 'IBM', '', 0, -1, 'IBM', 'IBM', 'IBM', 'IBM', '2021-12-14 08:22:53'),
(168, 1, 'پرفروش ترین ها', 0, 'پرفروش ترین ها', '', 0, 0, 'پرفروش ترین ها', 'پرفروش-ترین-ها', 'پرفروش ترین ها', 'پرفروش ترین ها', '2021-12-27 08:47:30'),
(171, 1, 'it', 1, 'it', 'it', 0, 0, 'it', 'it', 'it', 'it', '2021-12-27 09:22:37'),
(173, 1, 'hp', 1, 'hp', 'hp', 0, 0, 'hp', 'hp', 'hp', 'hp', '2021-12-27 09:31:36'),
(178, 1, 'ssd', 1, 'ssd', 'ssd', 0, 0, 'ssd', 'ssd', 'ssd', 'ssd', '2021-12-27 11:41:31'),
(189, 1, 'Id maxime veritatis qui eum explicabo Labore nulla et deserunt consequatur minus rerum', 1, 'Suscipit tenetur sol', 'Alias sit aut susci', 4, 0, 'retefa@mailinator.com', 'Voluptatem-Minima-c', 'Et officiis optio q', 'Sed temporibus in iu', '2022-01-04 07:24:14');

-- --------------------------------------------------------

--
-- Table structure for table `category_blogs`
--

CREATE TABLE `category_blogs` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `blog_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_discounts`
--

CREATE TABLE `category_discounts` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `discount_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_samples`
--

CREATE TABLE `category_samples` (
  `id` int NOT NULL,
  `sample_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `category_samples`
--

INSERT INTO `category_samples` (`id`, `sample_id`, `category_id`) VALUES
(1, 1, 53);

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int NOT NULL,
  `name` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `slug` varchar(26) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `province_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `name`, `slug`, `province_id`) VALUES
(1, 'اسکو', 'اسکو', 1),
(2, 'اهر', 'اهر', 1),
(3, 'ایلخچی', 'ایلخچی', 1),
(4, 'آبش احمد', 'آبش-احمد', 1),
(5, 'آذرشهر', 'آذرشهر', 1),
(6, 'آقکند', 'آقکند', 1),
(7, 'باسمنج', 'باسمنج', 1),
(8, 'بخشایش', 'بخشایش', 1),
(9, 'بستان آباد', 'بستان-آباد', 1),
(10, 'بناب', 'بناب', 1),
(11, 'بناب جدید', 'بناب-جدید', 1),
(12, 'تبریز', 'تبریز', 1),
(13, 'ترک', 'ترک', 1),
(14, 'ترکمانچای', 'ترکمانچای', 1),
(15, 'تسوج', 'تسوج', 1),
(16, 'تیکمه داش', 'تیکمه-داش', 1),
(17, 'جلفا', 'جلفا', 1),
(18, 'خاروانا', 'خاروانا', 1),
(19, 'خامنه', 'خامنه', 1),
(20, 'خراجو', 'خراجو', 1),
(21, 'خسروشهر', 'خسروشهر', 1),
(22, 'خضرلو', 'خضرلو', 1),
(23, 'خمارلو', 'خمارلو', 1),
(24, 'خواجه', 'خواجه', 1),
(25, 'دوزدوزان', 'دوزدوزان', 1),
(26, 'زرنق', 'زرنق', 1),
(27, 'زنوز', 'زنوز', 1),
(28, 'سراب', 'سراب', 1),
(29, 'سردرود', 'سردرود', 1),
(30, 'سهند', 'سهند', 1),
(31, 'سیس', 'سیس', 1),
(32, 'سیه رود', 'سیه-رود', 1),
(33, 'شبستر', 'شبستر', 1),
(34, 'شربیان', 'شربیان', 1),
(35, 'شرفخانه', 'شرفخانه', 1),
(36, 'شندآباد', 'شندآباد', 1),
(37, 'صوفیان', 'صوفیان', 1),
(38, 'عجب شیر', 'عجب-شیر', 1),
(39, 'قره آغاج', 'قره-آغاج', 1),
(40, 'کشکسرای', 'کشکسرای', 1),
(41, 'کلوانق', 'کلوانق', 1),
(42, 'کلیبر', 'کلیبر', 1),
(43, 'کوزه کنان', 'کوزه-کنان', 1),
(44, 'گوگان', 'گوگان', 1),
(45, 'لیلان', 'لیلان', 1),
(46, 'مراغه', 'مراغه', 1),
(47, 'مرند', 'مرند', 1),
(48, 'ملکان', 'ملکان', 1),
(49, 'ملک کیان', 'ملک-کیان', 1),
(50, 'ممقان', 'ممقان', 1),
(51, 'مهربان', 'مهربان', 1),
(52, 'میانه', 'میانه', 1),
(53, 'نظرکهریزی', 'نظرکهریزی', 1),
(54, 'هادی شهر', 'هادی-شهر', 1),
(55, 'هرگلان', 'هرگلان', 1),
(56, 'هریس', 'هریس', 1),
(57, 'هشترود', 'هشترود', 1),
(58, 'هوراند', 'هوراند', 1),
(59, 'وایقان', 'وایقان', 1),
(60, 'ورزقان', 'ورزقان', 1),
(61, 'یامچی', 'یامچی', 1),
(62, 'ارومیه', 'ارومیه', 2),
(63, 'اشنویه', 'اشنویه', 2),
(64, 'ایواوغلی', 'ایواوغلی', 2),
(65, 'آواجیق', 'آواجیق', 2),
(66, 'باروق', 'باروق', 2),
(67, 'بازرگان', 'بازرگان', 2),
(68, 'بوکان', 'بوکان', 2),
(69, 'پلدشت', 'پلدشت', 2),
(70, 'پیرانشهر', 'پیرانشهر', 2),
(71, 'تازه شهر', 'تازه-شهر', 2),
(72, 'تکاب', 'تکاب', 2),
(73, 'چهاربرج', 'چهاربرج', 2),
(74, 'خوی', 'خوی', 2),
(75, 'دیزج دیز', 'دیزج-دیز', 2),
(76, 'ربط', 'ربط', 2),
(77, 'سردشت', 'آذربایجان-غربی-سردشت', 2),
(78, 'سرو', 'سرو', 2),
(79, 'سلماس', 'سلماس', 2),
(80, 'سیلوانه', 'سیلوانه', 2),
(81, 'سیمینه', 'سیمینه', 2),
(82, 'سیه چشمه', 'سیه-چشمه', 2),
(83, 'شاهین دژ', 'شاهین-دژ', 2),
(84, 'شوط', 'شوط', 2),
(85, 'فیرورق', 'فیرورق', 2),
(86, 'قره ضیاءالدین', 'قره-ضیاءالدین', 2),
(87, 'قطور', 'قطور', 2),
(88, 'قوشچی', 'قوشچی', 2),
(89, 'کشاورز', 'کشاورز', 2),
(90, 'گردکشانه', 'گردکشانه', 2),
(91, 'ماکو', 'ماکو', 2),
(92, 'محمدیار', 'محمدیار', 2),
(93, 'محمودآباد', 'آذربایجان-غربی-محمودآباد', 2),
(94, 'مهاباد', 'آذربایجان-غربی-مهاباد', 2),
(95, 'میاندوآب', 'میاندوآب', 2),
(96, 'میرآباد', 'میرآباد', 2),
(97, 'نالوس', 'نالوس', 2),
(98, 'نقده', 'نقده', 2),
(99, 'نوشین', 'نوشین', 2),
(100, 'اردبیل', 'اردبیل', 3),
(101, 'اصلاندوز', 'اصلاندوز', 3),
(102, 'آبی بیگلو', 'آبی-بیگلو', 3),
(103, 'بیله سوار', 'بیله-سوار', 3),
(104, 'پارس آباد', 'پارس-آباد', 3),
(105, 'تازه کند', 'تازه-کند', 3),
(106, 'تازه کندانگوت', 'تازه-کندانگوت', 3),
(107, 'جعفرآباد', 'جعفرآباد', 3),
(108, 'خلخال', 'خلخال', 3),
(109, 'رضی', 'رضی', 3),
(110, 'سرعین', 'سرعین', 3),
(111, 'عنبران', 'عنبران', 3),
(112, 'فخرآباد', 'فخرآباد', 3),
(113, 'کلور', 'کلور', 3),
(114, 'کوراییم', 'کوراییم', 3),
(115, 'گرمی', 'گرمی', 3),
(116, 'گیوی', 'گیوی', 3),
(117, 'لاهرود', 'لاهرود', 3),
(118, 'مشگین شهر', 'مشگین-شهر', 3),
(119, 'نمین', 'نمین', 3),
(120, 'نیر', 'اردبیل-نیر', 3),
(121, 'هشتجین', 'هشتجین', 3),
(122, 'هیر', 'هیر', 3),
(123, 'ابریشم', 'ابریشم', 4),
(124, 'ابوزیدآباد', 'ابوزیدآباد', 4),
(125, 'اردستان', 'اردستان', 4),
(126, 'اژیه', 'اژیه', 4),
(127, 'اصفهان', 'اصفهان', 4),
(128, 'افوس', 'افوس', 4),
(129, 'انارک', 'انارک', 4),
(130, 'ایمانشهر', 'ایمانشهر', 4),
(131, 'آران وبیدگل', 'آران-وبیدگل', 4),
(132, 'بادرود', 'بادرود', 4),
(133, 'باغ بهادران', 'باغ-بهادران', 4),
(134, 'بافران', 'بافران', 4),
(135, 'برزک', 'برزک', 4),
(136, 'برف انبار', 'برف-انبار', 4),
(137, 'بهاران شهر', 'بهاران-شهر', 4),
(138, 'بهارستان', 'بهارستان', 4),
(139, 'بوئین و میاندشت', 'بوئین-میاندشت', 4),
(140, 'پیربکران', 'پیربکران', 4),
(141, 'تودشک', 'تودشک', 4),
(142, 'تیران', 'تیران', 4),
(143, 'جندق', 'جندق', 4),
(144, 'جوزدان', 'جوزدان', 4),
(145, 'جوشقان و کامو', 'جوشقان-کامو', 4),
(146, 'چادگان', 'چادگان', 4),
(147, 'چرمهین', 'چرمهین', 4),
(148, 'چمگردان', 'چمگردان', 4),
(149, 'حبیب آباد', 'حبیب-آباد', 4),
(150, 'حسن آباد', 'اصفهان-حسن-آباد', 4),
(151, 'حنا', 'حنا', 4),
(152, 'خالدآباد', 'خالدآباد', 4),
(153, 'خمینی شهر', 'خمینی-شهر', 4),
(154, 'خوانسار', 'خوانسار', 4),
(155, 'خور', 'اصفهان-خور', 4),
(157, 'خورزوق', 'خورزوق', 4),
(158, 'داران', 'داران', 4),
(159, 'دامنه', 'دامنه', 4),
(160, 'درچه', 'درچه', 4),
(161, 'دستگرد', 'دستگرد', 4),
(162, 'دهاقان', 'دهاقان', 4),
(163, 'دهق', 'دهق', 4),
(164, 'دولت آباد', 'اصفهان-دولت-آباد', 4),
(165, 'دیزیچه', 'دیزیچه', 4),
(166, 'رزوه', 'رزوه', 4),
(167, 'رضوانشهر', 'اصفهان-رضوانشهر', 4),
(168, 'زاینده رود', 'زاینده-رود', 4),
(169, 'زرین شهر', 'زرین-شهر', 4),
(170, 'زواره', 'زواره', 4),
(171, 'زیباشهر', 'زیباشهر', 4),
(172, 'سده لنجان', 'سده-لنجان', 4),
(173, 'سفیدشهر', 'سفیدشهر', 4),
(174, 'سگزی', 'سگزی', 4),
(175, 'سمیرم', 'سمیرم', 4),
(176, 'شاهین شهر', 'شاهین-شهر', 4),
(177, 'شهرضا', 'شهرضا', 4),
(178, 'طالخونچه', 'طالخونچه', 4),
(179, 'عسگران', 'عسگران', 4),
(180, 'علویجه', 'علویجه', 4),
(181, 'فرخی', 'فرخی', 4),
(182, 'فریدونشهر', 'فریدونشهر', 4),
(183, 'فلاورجان', 'فلاورجان', 4),
(184, 'فولادشهر', 'فولادشهر', 4),
(185, 'قمصر', 'قمصر', 4),
(186, 'قهجاورستان', 'قهجاورستان', 4),
(187, 'قهدریجان', 'قهدریجان', 4),
(188, 'کاشان', 'کاشان', 4),
(189, 'کرکوند', 'کرکوند', 4),
(190, 'کلیشاد و سودرجان', 'کلیشاد-سودرجان', 4),
(191, 'کمشچه', 'کمشچه', 4),
(192, 'کمه', 'کمه', 4),
(193, 'کهریزسنگ', 'کهریزسنگ', 4),
(194, 'کوشک', 'کوشک', 4),
(195, 'کوهپایه', 'کوهپایه', 4),
(196, 'گرگاب', 'گرگاب', 4),
(197, 'گزبرخوار', 'گزبرخوار', 4),
(198, 'گلپایگان', 'گلپایگان', 4),
(199, 'گلدشت', 'گلدشت', 4),
(200, 'گلشهر', 'گلشهر', 4),
(201, 'گوگد', 'گوگد', 4),
(202, 'لای بید', 'لای-بید', 4),
(203, 'مبارکه', 'مبارکه', 4),
(204, 'مجلسی', 'مجلسی', 4),
(205, 'محمدآباد', 'اصفهان-محمدآباد', 4),
(206, 'مشکات', 'مشکات', 4),
(207, 'منظریه', 'منظریه', 4),
(208, 'مهاباد', 'اصفهان-مهاباد', 4),
(209, 'میمه', 'اصفهان-میمه', 4),
(210, 'نائین', 'نائین', 4),
(211, 'نجف آباد', 'نجف-آباد', 4),
(212, 'نصرآباد', 'اصفهان-نصرآباد', 4),
(213, 'نطنز', 'نطنز', 4),
(214, 'نوش آباد', 'نوش-آباد', 4),
(215, 'نیاسر', 'نیاسر', 4),
(216, 'نیک آباد', 'نیک-آباد', 4),
(217, 'هرند', 'هرند', 4),
(218, 'ورزنه', 'ورزنه', 4),
(219, 'ورنامخواست', 'ورنامخواست', 4),
(220, 'وزوان', 'وزوان', 4),
(221, 'ونک', 'ونک', 4),
(222, 'اسارا', 'اسارا', 5),
(223, 'اشتهارد', 'اشتهارد', 5),
(224, 'تنکمان', 'تنکمان', 5),
(225, 'چهارباغ', 'چهارباغ', 5),
(226, 'سعید آباد', 'سعید-آباد', 5),
(227, 'شهر جدید هشتگرد', 'شهر-جدید-هشتگرد', 5),
(228, 'طالقان', 'طالقان', 5),
(229, 'کرج', 'کرج', 5),
(230, 'کمال شهر', 'کمال-شهر', 5),
(231, 'کوهسار', 'کوهسار', 5),
(232, 'گرمدره', 'گرمدره', 5),
(233, 'ماهدشت', 'ماهدشت', 5),
(234, 'محمدشهر', 'البرز-محمدشهر', 5),
(235, 'مشکین دشت', 'مشکین-دشت', 5),
(236, 'نظرآباد', 'نظرآباد', 5),
(237, 'هشتگرد', 'هشتگرد', 5),
(238, 'ارکواز', 'ارکواز', 6),
(239, 'ایلام', 'ایلام', 6),
(240, 'ایوان', 'ایوان', 6),
(241, 'آبدانان', 'آبدانان', 6),
(242, 'آسمان آباد', 'آسمان-آباد', 6),
(243, 'بدره', 'بدره', 6),
(244, 'پهله', 'پهله', 6),
(245, 'توحید', 'توحید', 6),
(246, 'چوار', 'چوار', 6),
(247, 'دره شهر', 'دره-شهر', 6),
(248, 'دلگشا', 'دلگشا', 6),
(249, 'دهلران', 'دهلران', 6),
(250, 'زرنه', 'زرنه', 6),
(251, 'سراب باغ', 'سراب-باغ', 6),
(252, 'سرابله', 'سرابله', 6),
(253, 'صالح آباد', 'ایلام-صالح-آباد', 6),
(254, 'لومار', 'لومار', 6),
(255, 'مهران', 'مهران', 6),
(256, 'مورموری', 'مورموری', 6),
(257, 'موسیان', 'موسیان', 6),
(258, 'میمه', 'ایلام-میمه', 6),
(259, 'امام حسن', 'امام-حسن', 7),
(260, 'انارستان', 'انارستان', 7),
(261, 'اهرم', 'اهرم', 7),
(262, 'آب پخش', 'آب-پخش', 7),
(263, 'آبدان', 'آبدان', 7),
(264, 'برازجان', 'برازجان', 7),
(265, 'بردخون', 'بردخون', 7),
(266, 'بندردیر', 'بندردیر', 7),
(267, 'بندردیلم', 'بندردیلم', 7),
(268, 'بندرریگ', 'بندرریگ', 7),
(269, 'بندرکنگان', 'بندرکنگان', 7),
(270, 'بندرگناوه', 'بندرگناوه', 7),
(271, 'بنک', 'بنک', 7),
(272, 'بوشهر', 'بوشهر', 7),
(273, 'تنگ ارم', 'تنگ-ارم', 7),
(274, 'جم', 'جم', 7),
(275, 'چغادک', 'چغادک', 7),
(276, 'خارک', 'خارک', 7),
(277, 'خورموج', 'خورموج', 7),
(278, 'دالکی', 'دالکی', 7),
(279, 'دلوار', 'دلوار', 7),
(280, 'ریز', 'ریز', 7),
(281, 'سعدآباد', 'سعدآباد', 7),
(282, 'سیراف', 'سیراف', 7),
(283, 'شبانکاره', 'شبانکاره', 7),
(284, 'شنبه', 'شنبه', 7),
(285, 'عسلویه', 'عسلویه', 7),
(286, 'کاکی', 'کاکی', 7),
(287, 'کلمه', 'کلمه', 7),
(288, 'نخل تقی', 'نخل-تقی', 7),
(289, 'وحدتیه', 'وحدتیه', 7),
(290, 'ارجمند', 'ارجمند', 8),
(291, 'اسلامشهر', 'اسلامشهر', 8),
(292, 'اندیشه', 'اندیشه', 8),
(293, 'آبسرد', 'آبسرد', 8),
(294, 'آبعلی', 'آبعلی', 8),
(295, 'باغستان', 'باغستان', 8),
(296, 'باقرشهر', 'باقرشهر', 8),
(297, 'بومهن', 'بومهن', 8),
(298, 'پاکدشت', 'پاکدشت', 8),
(299, 'پردیس', 'پردیس', 8),
(300, 'پیشوا', 'پیشوا', 8),
(301, 'تهران', 'تهران', 8),
(302, 'جوادآباد', 'جوادآباد', 8),
(303, 'چهاردانگه', 'چهاردانگه', 8),
(304, 'حسن آباد', 'تهران-حسن-آباد', 8),
(305, 'دماوند', 'دماوند', 8),
(306, 'دیزین', 'دیزین', 8),
(307, 'شهر ری', 'شهر-ری', 8),
(308, 'رباط کریم', 'رباط-کریم', 8),
(309, 'رودهن', 'رودهن', 8),
(310, 'شاهدشهر', 'شاهدشهر', 8),
(311, 'شریف آباد', 'شریف-آباد', 8),
(312, 'شمشک', 'شمشک', 8),
(313, 'شهریار', 'شهریار', 8),
(314, 'صالح آباد', 'تهران-صالح-آباد', 8),
(315, 'صباشهر', 'صباشهر', 8),
(316, 'صفادشت', 'صفادشت', 8),
(317, 'فردوسیه', 'فردوسیه', 8),
(318, 'فشم', 'فشم', 8),
(319, 'فیروزکوه', 'فیروزکوه', 8),
(320, 'قدس', 'قدس', 8),
(321, 'قرچک', 'قرچک', 8),
(322, 'کهریزک', 'کهریزک', 8),
(323, 'کیلان', 'کیلان', 8),
(324, 'گلستان', 'شهر-گلستان', 8),
(325, 'لواسان', 'لواسان', 8),
(326, 'ملارد', 'ملارد', 8),
(327, 'میگون', 'میگون', 8),
(328, 'نسیم شهر', 'نسیم-شهر', 8),
(329, 'نصیرآباد', 'نصیرآباد', 8),
(330, 'وحیدیه', 'وحیدیه', 8),
(331, 'ورامین', 'ورامین', 8),
(332, 'اردل', 'اردل', 9),
(333, 'آلونی', 'آلونی', 9),
(334, 'باباحیدر', 'باباحیدر', 9),
(335, 'بروجن', 'بروجن', 9),
(336, 'بلداجی', 'بلداجی', 9),
(337, 'بن', 'بن', 9),
(338, 'جونقان', 'جونقان', 9),
(339, 'چلگرد', 'چلگرد', 9),
(340, 'سامان', 'سامان', 9),
(341, 'سفیددشت', 'سفیددشت', 9),
(342, 'سودجان', 'سودجان', 9),
(343, 'سورشجان', 'سورشجان', 9),
(344, 'شلمزار', 'شلمزار', 9),
(345, 'شهرکرد', 'شهرکرد', 9),
(346, 'طاقانک', 'طاقانک', 9),
(347, 'فارسان', 'فارسان', 9),
(348, 'فرادنبه', 'فرادبنه', 9),
(349, 'فرخ شهر', 'فرخ-شهر', 9),
(350, 'کیان', 'کیان', 9),
(351, 'گندمان', 'گندمان', 9),
(352, 'گهرو', 'گهرو', 9),
(353, 'لردگان', 'لردگان', 9),
(354, 'مال خلیفه', 'مال-خلیفه', 9),
(355, 'ناغان', 'ناغان', 9),
(356, 'نافچ', 'نافچ', 9),
(357, 'نقنه', 'نقنه', 9),
(358, 'هفشجان', 'هفشجان', 9),
(359, 'ارسک', 'ارسک', 10),
(360, 'اسدیه', 'اسدیه', 10),
(361, 'اسفدن', 'اسفدن', 10),
(362, 'اسلامیه', 'اسلامیه', 10),
(363, 'آرین شهر', 'آرین-شهر', 10),
(364, 'آیسک', 'آیسک', 10),
(365, 'بشرویه', 'بشرویه', 10),
(366, 'بیرجند', 'بیرجند', 10),
(367, 'حاجی آباد', 'خراسان-جنوبی-حاجی-آباد', 10),
(368, 'خضری دشت بیاض', 'خضری-دشت-بیاض', 10),
(369, 'خوسف', 'خوسف', 10),
(370, 'زهان', 'زهان', 10),
(371, 'سرایان', 'سرایان', 10),
(372, 'سربیشه', 'سربیشه', 10),
(373, 'سه قلعه', 'سه-قلعه', 10),
(374, 'شوسف', 'شوسف', 10),
(375, 'طبس', 'خراسان-جنوبی-طبس-', 10),
(376, 'فردوس', 'فردوس', 10),
(377, 'قاین', 'قاین', 10),
(378, 'قهستان', 'قهستان', 10),
(379, 'محمدشهر', 'خراسان-جنوبی-محمدشهر', 10),
(380, 'مود', 'مود', 10),
(381, 'نهبندان', 'نهبندان', 10),
(382, 'نیمبلوک', 'نیمبلوک', 10),
(383, 'احمدآباد صولت', 'احمدآباد-صولت', 11),
(384, 'انابد', 'انابد', 11),
(385, 'باجگیران', 'باجگیران', 11),
(386, 'باخرز', 'باخرز', 11),
(387, 'بار', 'بار', 11),
(388, 'بایگ', 'بایگ', 11),
(389, 'بجستان', 'بجستان', 11),
(390, 'بردسکن', 'بردسکن', 11),
(391, 'بیدخت', 'بیدخت', 11),
(392, 'تایباد', 'تایباد', 11),
(393, 'تربت جام', 'تربت-جام', 11),
(394, 'تربت حیدریه', 'تربت-حیدریه', 11),
(395, 'جغتای', 'جغتای', 11),
(396, 'جنگل', 'جنگل', 11),
(397, 'چاپشلو', 'چاپشلو', 11),
(398, 'چکنه', 'چکنه', 11),
(399, 'چناران', 'چناران', 11),
(400, 'خرو', 'خرو', 11),
(401, 'خلیل آباد', 'خلیل-آباد', 11),
(402, 'خواف', 'خواف', 11),
(403, 'داورزن', 'داورزن', 11),
(404, 'درگز', 'درگز', 11),
(405, 'در رود', 'در-رود', 11),
(406, 'دولت آباد', 'خراسان-رضوی-دولت-آباد', 11),
(407, 'رباط سنگ', 'رباط-سنگ', 11),
(408, 'رشتخوار', 'رشتخوار', 11),
(409, 'رضویه', 'رضویه', 11),
(410, 'روداب', 'روداب', 11),
(411, 'ریوش', 'ریوش', 11),
(412, 'سبزوار', 'سبزوار', 11),
(413, 'سرخس', 'سرخس', 11),
(414, 'سفیدسنگ', 'سفیدسنگ', 11),
(415, 'سلامی', 'سلامی', 11),
(416, 'سلطان آباد', 'سلطان-آباد', 11),
(417, 'سنگان', 'سنگان', 11),
(418, 'شادمهر', 'شادمهر', 11),
(419, 'شاندیز', 'شاندیز', 11),
(420, 'ششتمد', 'ششتمد', 11),
(421, 'شهرآباد', 'شهرآباد', 11),
(422, 'شهرزو', 'شهرزو', 11),
(423, 'صالح آباد', 'خراسان-رضوی-صالح-آباد', 11),
(424, 'طرقبه', 'طرقبه', 11),
(425, 'عشق آباد', 'خراسان-رضوی-عشق-آباد', 11),
(426, 'فرهادگرد', 'فرهادگرد', 11),
(427, 'فریمان', 'فریمان', 11),
(428, 'فیروزه', 'فیروزه', 11),
(429, 'فیض آباد', 'فیض-آباد', 11),
(430, 'قاسم آباد', 'قاسم-آباد', 11),
(431, 'قدمگاه', 'قدمگاه', 11),
(432, 'قلندرآباد', 'قلندرآباد', 11),
(433, 'قوچان', 'قوچان', 11),
(434, 'کاخک', 'کاخک', 11),
(435, 'کاریز', 'کاریز', 11),
(436, 'کاشمر', 'کاشمر', 11),
(437, 'کدکن', 'کدکن', 11),
(438, 'کلات', 'کلات', 11),
(439, 'کندر', 'کندر', 11),
(440, 'گلمکان', 'گلمکان', 11),
(441, 'گناباد', 'گناباد', 11),
(442, 'لطف آباد', 'لطف-آباد', 11),
(443, 'مزدآوند', 'مزدآوند', 11),
(444, 'مشهد', 'مشهد', 11),
(445, 'ملک آباد', 'ملک-آباد', 11),
(446, 'نشتیفان', 'نشتیفان', 11),
(447, 'نصرآباد', 'خراسان-رضوی-نصرآباد', 11),
(448, 'نقاب', 'نقاب', 11),
(449, 'نوخندان', 'نوخندان', 11),
(450, 'نیشابور', 'نیشابور', 11),
(451, 'نیل شهر', 'نیل-شهر', 11),
(452, 'همت آباد', 'همت-آباد', 11),
(453, 'یونسی', 'یونسی', 11),
(454, 'اسفراین', 'اسفراین', 12),
(455, 'ایور', 'ایور', 12),
(456, 'آشخانه', 'آشخانه', 12),
(457, 'بجنورد', 'بجنورد', 12),
(458, 'پیش قلعه', 'پیش-قلعه', 12),
(459, 'تیتکانلو', 'تیتکانلو', 12),
(460, 'جاجرم', 'جاجرم', 12),
(461, 'حصارگرمخان', 'حصارگرمخان', 12),
(462, 'درق', 'درق', 12),
(463, 'راز', 'راز', 12),
(464, 'سنخواست', 'سنخواست', 12),
(465, 'شوقان', 'شوقان', 12),
(466, 'شیروان', 'شیروان', 12),
(467, 'صفی آباد', 'خراسان-شمالی-صفی-آباد', 12),
(468, 'فاروج', 'فاروج', 12),
(469, 'قاضی', 'قاضی', 12),
(470, 'گرمه', 'گرمه', 12),
(471, 'لوجلی', 'لوجلی', 12),
(472, 'اروندکنار', 'اروندکنار', 13),
(473, 'الوان', 'الوان', 13),
(474, 'امیدیه', 'امیدیه', 13),
(475, 'اندیمشک', 'اندیمشک', 13),
(476, 'اهواز', 'اهواز', 13),
(477, 'ایذه', 'ایذه', 13),
(478, 'آبادان', 'آبادان', 13),
(479, 'آغاجاری', 'آغاجاری', 13),
(480, 'باغ ملک', 'باغ-ملک', 13),
(481, 'بستان', 'بستان', 13),
(482, 'بندرامام خمینی', 'بندرامام-خمینی', 13),
(483, 'بندرماهشهر', 'بندرماهشهر', 13),
(484, 'بهبهان', 'بهبهان', 13),
(485, 'ترکالکی', 'ترکالکی', 13),
(486, 'جایزان', 'جایزان', 13),
(487, 'چمران', 'چمران', 13),
(488, 'چویبده', 'چویبده', 13),
(489, 'حر', 'حر', 13),
(490, 'حسینیه', 'حسینیه', 13),
(491, 'حمزه', 'حمزه', 13),
(492, 'حمیدیه', 'حمیدیه', 13),
(493, 'خرمشهر', 'خرمشهر', 13),
(494, 'دارخوین', 'دارخوین', 13),
(495, 'دزآب', 'دزآب', 13),
(496, 'دزفول', 'دزفول', 13),
(497, 'دهدز', 'دهدز', 13),
(498, 'رامشیر', 'رامشیر', 13),
(499, 'رامهرمز', 'رامهرمز', 13),
(500, 'رفیع', 'رفیع', 13),
(501, 'زهره', 'زهره', 13),
(502, 'سالند', 'سالند', 13),
(503, 'سردشت', 'خوزستان-سردشت', 13),
(504, 'سوسنگرد', 'سوسنگرد', 13),
(505, 'شادگان', 'شادگان', 13),
(506, 'شاوور', 'شاوور', 13),
(507, 'شرافت', 'شرافت', 13),
(508, 'شوش', 'شوش', 13),
(509, 'شوشتر', 'شوشتر', 13),
(510, 'شیبان', 'شیبان', 13),
(511, 'صالح شهر', 'صالح-شهر', 13),
(512, 'صفی آباد', 'خوزستان-صفی-آباد', 13),
(513, 'صیدون', 'صیدون', 13),
(514, 'قلعه تل', 'قلعه-تل', 13),
(515, 'قلعه خواجه', 'قلعه-خواجه', 13),
(516, 'گتوند', 'گتوند', 13),
(517, 'لالی', 'لالی', 13),
(518, 'مسجدسلیمان', 'مسجدسلیمان', 13),
(520, 'ملاثانی', 'ملاثانی', 13),
(521, 'میانرود', 'میانرود', 13),
(522, 'مینوشهر', 'مینوشهر', 13),
(523, 'هفتگل', 'هفتگل', 13),
(524, 'هندیجان', 'هندیجان', 13),
(525, 'هویزه', 'هویزه', 13),
(526, 'ویس', 'ویس', 13),
(527, 'ابهر', 'ابهر', 14),
(528, 'ارمغان خانه', 'ارمغان-خانه', 14),
(529, 'آب بر', 'آب-بر', 14),
(530, 'چورزق', 'چورزق', 14),
(531, 'حلب', 'حلب', 14),
(532, 'خرمدره', 'خرمدره', 14),
(533, 'دندی', 'دندی', 14),
(534, 'زرین آباد', 'زرین-آباد', 14),
(535, 'زرین رود', 'زرین-رود', 14),
(536, 'زنجان', 'زنجان', 14),
(537, 'سجاس', 'سجاس', 14),
(538, 'سلطانیه', 'سلطانیه', 14),
(539, 'سهرورد', 'سهرورد', 14),
(540, 'صائین قلعه', 'صائین-قلعه', 14),
(541, 'قیدار', 'قیدار', 14),
(542, 'گرماب', 'گرماب', 14),
(543, 'ماه نشان', 'ماه-نشان', 14),
(544, 'هیدج', 'هیدج', 14),
(545, 'امیریه', 'امیریه', 15),
(546, 'ایوانکی', 'ایوانکی', 15),
(547, 'آرادان', 'آرادان', 15),
(548, 'بسطام', 'بسطام', 15),
(549, 'بیارجمند', 'بیارجمند', 15),
(550, 'دامغان', 'دامغان', 15),
(551, 'درجزین', 'درجزین', 15),
(552, 'دیباج', 'دیباج', 15),
(553, 'سرخه', 'سرخه', 15),
(554, 'سمنان', 'سمنان', 15),
(555, 'شاهرود', 'شاهرود', 15),
(556, 'شهمیرزاد', 'شهمیرزاد', 15),
(557, 'کلاته خیج', 'کلاته-خیج', 15),
(558, 'گرمسار', 'گرمسار', 15),
(559, 'مجن', 'مجن', 15),
(560, 'مهدی شهر', 'مهدی-شهر', 15),
(561, 'میامی', 'میامی', 15),
(562, 'ادیمی', 'ادیمی', 16),
(563, 'اسپکه', 'اسپکه', 16),
(564, 'ایرانشهر', 'ایرانشهر', 16),
(565, 'بزمان', 'بزمان', 16),
(566, 'بمپور', 'بمپور', 16),
(567, 'بنت', 'بنت', 16),
(568, 'بنجار', 'بنجار', 16),
(569, 'پیشین', 'پیشین', 16),
(570, 'جالق', 'جالق', 16),
(571, 'چابهار', 'چابهار', 16),
(572, 'خاش', 'خاش', 16),
(573, 'دوست محمد', 'دوست-محمد', 16),
(574, 'راسک', 'راسک', 16),
(575, 'زابل', 'زابل', 16),
(576, 'زابلی', 'زابلی', 16),
(577, 'زاهدان', 'زاهدان', 16),
(578, 'زهک', 'زهک', 16),
(579, 'سراوان', 'سراوان', 16),
(580, 'سرباز', 'سرباز', 16),
(581, 'سوران', 'سوران', 16),
(582, 'سیرکان', 'سیرکان', 16),
(583, 'علی اکبر', 'علی-اکبر', 16),
(584, 'فنوج', 'فنوج', 16),
(585, 'قصرقند', 'قصرقند', 16),
(586, 'کنارک', 'کنارک', 16),
(587, 'گشت', 'گشت', 16),
(588, 'گلمورتی', 'گلمورتی', 16),
(589, 'محمدان', 'محمدان', 16),
(590, 'محمدآباد', 'سیستان-و-بلوچستان-محمدآباد', 16),
(591, 'محمدی', 'محمدی', 16),
(592, 'میرجاوه', 'میرجاوه', 16),
(593, 'نصرت آباد', 'نصرت-آباد', 16),
(594, 'نگور', 'نگور', 16),
(595, 'نوک آباد', 'نوک-آباد', 16),
(596, 'نیک شهر', 'نیک-شهر', 16),
(597, 'هیدوچ', 'هیدوچ', 16),
(598, 'اردکان', 'فارس-اردکان', 17),
(599, 'ارسنجان', 'ارسنجان', 17),
(600, 'استهبان', 'استهبان', 17),
(601, 'اشکنان', 'اشکنان', 17),
(602, 'افزر', 'افزر', 17),
(603, 'اقلید', 'اقلید', 17),
(604, 'امام شهر', 'امام-شهر', 17),
(605, 'اهل', 'اهل', 17),
(606, 'اوز', 'اوز', 17),
(607, 'ایج', 'ایج', 17),
(608, 'ایزدخواست', 'ایزدخواست', 17),
(609, 'آباده', 'آباده', 17),
(610, 'آباده طشک', 'آباده-طشک', 17),
(611, 'باب انار', 'باب-انار', 17),
(612, 'بالاده', 'فارس-بالاده', 17),
(613, 'بنارویه', 'بنارویه', 17),
(614, 'بهمن', 'بهمن', 17),
(615, 'بوانات', 'بوانات', 17),
(616, 'بیرم', 'بیرم', 17),
(617, 'بیضا', 'بیضا', 17),
(618, 'جنت شهر', 'جنت-شهر', 17),
(619, 'جهرم', 'جهرم', 17),
(620, 'جویم', 'جویم', 17),
(621, 'زرین دشت', 'زرین-دشت', 17),
(622, 'حسن آباد', 'فارس-حسن-آباد', 17),
(623, 'خان زنیان', 'خان-زنیان', 17),
(624, 'خاوران', 'خاوران', 17),
(625, 'خرامه', 'خرامه', 17),
(626, 'خشت', 'خشت', 17),
(627, 'خنج', 'خنج', 17),
(628, 'خور', 'فارس-خور', 17),
(629, 'داراب', 'داراب', 17),
(630, 'داریان', 'داریان', 17),
(631, 'دبیران', 'دبیران', 17),
(632, 'دژکرد', 'دژکرد', 17),
(633, 'دهرم', 'دهرم', 17),
(634, 'دوبرجی', 'دوبرجی', 17),
(635, 'رامجرد', 'رامجرد', 17),
(636, 'رونیز', 'رونیز', 17),
(637, 'زاهدشهر', 'زاهدشهر', 17),
(638, 'زرقان', 'زرقان', 17),
(639, 'سده', 'سده', 17),
(640, 'سروستان', 'سروستان', 17),
(641, 'سعادت شهر', 'سعادت-شهر', 17),
(642, 'سورمق', 'سورمق', 17),
(643, 'سیدان', 'سیدان', 17),
(644, 'ششده', 'ششده', 17),
(645, 'شهرپیر', 'شهرپیر', 17),
(646, 'شهرصدرا', 'شهرصدرا', 17),
(647, 'شیراز', 'شیراز', 17),
(648, 'صغاد', 'صغاد', 17),
(649, 'صفاشهر', 'صفاشهر', 17),
(650, 'علامرودشت', 'علامرودشت', 17),
(651, 'فدامی', 'فدامی', 17),
(652, 'فراشبند', 'فراشبند', 17),
(653, 'فسا', 'فسا', 17),
(654, 'فیروزآباد', 'فارس-فیروزآباد', 17),
(655, 'قائمیه', 'قائمیه', 17),
(656, 'قادرآباد', 'قادرآباد', 17),
(657, 'قطب آباد', 'قطب-آباد', 17),
(658, 'قطرویه', 'قطرویه', 17),
(659, 'قیر', 'قیر', 17),
(660, 'کارزین (فتح آباد)', 'کارزین-فتح-آباد', 17),
(661, 'کازرون', 'کازرون', 17),
(662, 'کامفیروز', 'کامفیروز', 17),
(663, 'کره ای', 'کره-ای', 17),
(664, 'کنارتخته', 'کنارتخته', 17),
(665, 'کوار', 'کوار', 17),
(666, 'گراش', 'گراش', 17),
(667, 'گله دار', 'گله-دار', 17),
(668, 'لار', 'لار', 17),
(669, 'لامرد', 'لامرد', 17),
(670, 'لپویی', 'لپویی', 17),
(671, 'لطیفی', 'لطیفی', 17),
(672, 'مبارک آباددیز', 'مبارک-آباددیز', 17),
(673, 'مرودشت', 'مرودشت', 17),
(674, 'مشکان', 'مشکان', 17),
(675, 'مصیری', 'مصیری', 17),
(676, 'مهر', 'مهر', 17),
(677, 'میمند', 'میمند', 17),
(678, 'نوبندگان', 'نوبندگان', 17),
(679, 'نوجین', 'نوجین', 17),
(680, 'نودان', 'نودان', 17),
(681, 'نورآباد', 'فارس-نورآباد', 17),
(682, 'نی ریز', 'نی-ریز', 17),
(683, 'وراوی', 'وراوی', 17),
(684, 'ارداق', 'ارداق', 18),
(685, 'اسفرورین', 'اسفرورین', 18),
(686, 'اقبالیه', 'اقبالیه', 18),
(687, 'الوند', 'الوند', 18),
(688, 'آبگرم', 'آبگرم', 18),
(689, 'آبیک', 'آبیک', 18),
(690, 'آوج', 'آوج', 18),
(691, 'بوئین زهرا', 'بوئین-زهرا', 18),
(692, 'بیدستان', 'بیدستان', 18),
(693, 'تاکستان', 'تاکستان', 18),
(694, 'خاکعلی', 'خاکعلی', 18),
(695, 'خرمدشت', 'خرمدشت', 18),
(696, 'دانسفهان', 'دانسفهان', 18),
(697, 'رازمیان', 'رازمیان', 18),
(698, 'سگزآباد', 'سگزآباد', 18),
(699, 'سیردان', 'سیردان', 18),
(700, 'شال', 'شال', 18),
(701, 'شریفیه', 'شریفیه', 18),
(702, 'ضیاآباد', 'ضیاآباد', 18),
(703, 'قزوین', 'قزوین', 18),
(704, 'کوهین', 'کوهین', 18),
(705, 'محمدیه', 'محمدیه', 18),
(706, 'محمودآباد نمونه', 'محمودآباد-نمونه', 18),
(707, 'معلم کلایه', 'معلم-کلایه', 18),
(708, 'نرجه', 'نرجه', 18),
(709, 'جعفریه', 'جعفریه', 19),
(710, 'دستجرد', 'دستجرد', 19),
(711, 'سلفچگان', 'سلفچگان', 19),
(712, 'قم', 'قم', 19),
(713, 'قنوات', 'قنوات', 19),
(714, 'کهک', 'کهک', 19),
(715, 'آرمرده', 'آرمرده', 20),
(716, 'بابارشانی', 'بابارشانی', 20),
(717, 'بانه', 'بانه', 20),
(718, 'بلبان آباد', 'بلبان-آباد', 20),
(719, 'بوئین سفلی', 'بوئین-سفلی', 20),
(720, 'بیجار', 'بیجار', 20),
(721, 'چناره', 'چناره', 20),
(722, 'دزج', 'دزج', 20),
(723, 'دلبران', 'دلبران', 20),
(724, 'دهگلان', 'دهگلان', 20),
(725, 'دیواندره', 'دیواندره', 20),
(726, 'زرینه', 'زرینه', 20),
(727, 'سروآباد', 'سروآباد', 20),
(728, 'سریش آباد', 'سریش-آباد', 20),
(729, 'سقز', 'سقز', 20),
(730, 'سنندج', 'سنندج', 20),
(731, 'شویشه', 'شویشه', 20),
(732, 'صاحب', 'صاحب', 20),
(733, 'قروه', 'قروه', 20),
(734, 'کامیاران', 'کامیاران', 20),
(735, 'کانی دینار', 'کانی-دینار', 20),
(736, 'کانی سور', 'کانی-سور', 20),
(737, 'مریوان', 'مریوان', 20),
(738, 'موچش', 'موچش', 20),
(739, 'یاسوکند', 'یاسوکند', 20),
(740, 'اختیارآباد', 'اختیارآباد', 21),
(741, 'ارزوئیه', 'ارزوئیه', 21),
(742, 'امین شهر', 'امین-شهر', 21),
(743, 'انار', 'انار', 21),
(744, 'اندوهجرد', 'اندوهجرد', 21),
(745, 'باغین', 'باغین', 21),
(746, 'بافت', 'بافت', 21),
(747, 'بردسیر', 'بردسیر', 21),
(748, 'بروات', 'بروات', 21),
(749, 'بزنجان', 'بزنجان', 21),
(750, 'بم', 'بم', 21),
(751, 'بهرمان', 'بهرمان', 21),
(752, 'پاریز', 'پاریز', 21),
(753, 'جبالبارز', 'جبالبارز', 21),
(754, 'جوپار', 'جوپار', 21),
(755, 'جوزم', 'جوزم', 21),
(756, 'جیرفت', 'جیرفت', 21),
(757, 'چترود', 'چترود', 21),
(758, 'خاتون آباد', 'خاتون-آباد', 21),
(759, 'خانوک', 'خانوک', 21),
(760, 'خورسند', 'خورسند', 21),
(761, 'درب بهشت', 'درب-بهشت', 21),
(762, 'دهج', 'دهج', 21),
(763, 'رابر', 'رابر', 21),
(764, 'راور', 'راور', 21),
(765, 'راین', 'راین', 21),
(766, 'رفسنجان', 'رفسنجان', 21),
(767, 'رودبار', 'کرمان-رودبار', 21),
(768, 'ریحان شهر', 'ریحان-شهر', 21),
(769, 'زرند', 'زرند', 21),
(770, 'زنگی آباد', 'زنگی-آباد', 21),
(771, 'زیدآباد', 'زیدآباد', 21),
(772, 'سیرجان', 'سیرجان', 21),
(773, 'شهداد', 'شهداد', 21),
(774, 'شهربابک', 'شهربابک', 21),
(775, 'صفائیه', 'صفائیه', 21),
(776, 'عنبرآباد', 'عنبرآباد', 21),
(777, 'فاریاب', 'فاریاب', 21),
(778, 'فهرج', 'فهرج', 21),
(779, 'قلعه گنج', 'قلعه-گنج', 21),
(780, 'کاظم آباد', 'کاظم-آباد', 21),
(781, 'کرمان', 'کرمان', 21),
(782, 'کشکوئیه', 'کشکوئیه', 21),
(783, 'کهنوج', 'کهنوج', 21),
(784, 'کوهبنان', 'کوهبنان', 21),
(785, 'کیانشهر', 'کیانشهر', 21),
(786, 'گلباف', 'گلباف', 21),
(787, 'گلزار', 'گلزار', 21),
(788, 'لاله زار', 'لاله-زار', 21),
(789, 'ماهان', 'ماهان', 21),
(790, 'محمدآباد', 'کرمان-محمدآباد', 21),
(791, 'محی آباد', 'محی-آباد', 21),
(792, 'مردهک', 'مردهک', 21),
(793, 'مس سرچشمه', 'مس-سرچشمه', 21),
(794, 'منوجان', 'منوجان', 21),
(795, 'نجف شهر', 'نجف-شهر', 21),
(796, 'نرماشیر', 'نرماشیر', 21),
(797, 'نظام شهر', 'نظام-شهر', 21),
(798, 'نگار', 'نگار', 21),
(799, 'نودژ', 'نودژ', 21),
(800, 'هجدک', 'هجدک', 21),
(801, 'یزدان شهر', 'یزدان-شهر', 21),
(802, 'ازگله', 'ازگله', 22),
(803, 'اسلام آباد غرب', 'اسلام-آباد-غرب', 22),
(804, 'باینگان', 'باینگان', 22),
(805, 'بیستون', 'بیستون', 22),
(806, 'پاوه', 'پاوه', 22),
(807, 'تازه آباد', 'تازه-آباد', 22),
(808, 'جوان رود', 'جوان-رود', 22),
(809, 'حمیل', 'حمیل', 22),
(810, 'ماهیدشت', 'ماهیدشت', 22),
(811, 'روانسر', 'روانسر', 22),
(812, 'سرپل ذهاب', 'سرپل-ذهاب', 22),
(813, 'سرمست', 'سرمست', 22),
(814, 'سطر', 'سطر', 22),
(815, 'سنقر', 'سنقر', 22),
(816, 'سومار', 'سومار', 22),
(817, 'شاهو', 'شاهو', 22),
(818, 'صحنه', 'صحنه', 22),
(819, 'قصرشیرین', 'قصرشیرین', 22),
(820, 'کرمانشاه', 'کرمانشاه', 22),
(821, 'کرندغرب', 'کرندغرب', 22),
(822, 'کنگاور', 'کنگاور', 22),
(823, 'کوزران', 'کوزران', 22),
(824, 'گهواره', 'گهواره', 22),
(825, 'گیلانغرب', 'گیلانغرب', 22),
(826, 'میان راهان', 'میان-راهان', 22),
(827, 'نودشه', 'نودشه', 22),
(828, 'نوسود', 'نوسود', 22),
(829, 'هرسین', 'هرسین', 22),
(830, 'هلشی', 'هلشی', 22),
(831, 'باشت', 'باشت', 23),
(832, 'پاتاوه', 'پاتاوه', 23),
(833, 'چرام', 'چرام', 23),
(834, 'چیتاب', 'چیتاب', 23),
(835, 'دهدشت', 'دهدشت', 23),
(836, 'دوگنبدان', 'دوگنبدان', 23),
(837, 'دیشموک', 'دیشموک', 23),
(838, 'سوق', 'سوق', 23),
(839, 'سی سخت', 'سی-سخت', 23),
(840, 'قلعه رئیسی', 'قلعه-رئیسی', 23),
(841, 'گراب سفلی', 'گراب-سفلی', 23),
(842, 'لنده', 'لنده', 23),
(843, 'لیکک', 'لیکک', 23),
(844, 'مادوان', 'مادوان', 23),
(845, 'مارگون', 'مارگون', 23),
(846, 'یاسوج', 'یاسوج', 23),
(847, 'انبارآلوم', 'انبارآلوم', 24),
(848, 'اینچه برون', 'اینچه-برون', 24),
(849, 'آزادشهر', 'آزادشهر', 24),
(850, 'آق قلا', 'آق-قلا', 24),
(851, 'بندرترکمن', 'بندرترکمن', 24),
(852, 'بندرگز', 'بندرگز', 24),
(853, 'جلین', 'جلین', 24),
(854, 'خان ببین', 'خان-ببین', 24),
(855, 'دلند', 'دلند', 24),
(856, 'رامیان', 'رامیان', 24),
(857, 'سرخنکلاته', 'سرخنکلاته', 24),
(858, 'سیمین شهر', 'سیمین-شهر', 24),
(859, 'علی آباد کتول', 'علی-آباد-کتول', 24),
(860, 'فاضل آباد', 'فاضل-آباد', 24),
(861, 'کردکوی', 'کردکوی', 24),
(862, 'کلاله', 'کلاله', 24),
(863, 'گالیکش', 'گالیکش', 24),
(864, 'گرگان', 'گرگان', 24),
(865, 'گمیش تپه', 'گمیش-تپه', 24),
(866, 'گنبدکاووس', 'گنبدکاووس', 24),
(867, 'مراوه', 'مراوه', 24),
(868, 'مینودشت', 'مینودشت', 24),
(869, 'نگین شهر', 'نگین-شهر', 24),
(870, 'نوده خاندوز', 'نوده-خاندوز', 24),
(871, 'نوکنده', 'نوکنده', 24),
(872, 'ازنا', 'ازنا', 25),
(873, 'اشترینان', 'اشترینان', 25),
(874, 'الشتر', 'الشتر', 25),
(875, 'الیگودرز', 'الیگودرز', 25),
(876, 'بروجرد', 'بروجرد', 25),
(877, 'پلدختر', 'پلدختر', 25),
(878, 'چالانچولان', 'چالانچولان', 25),
(879, 'چغلوندی', 'چغلوندی', 25),
(880, 'چقابل', 'چقابل', 25),
(881, 'خرم آباد', 'لرستان-خرم-آباد', 25),
(882, 'درب گنبد', 'درب-گنبد', 25),
(883, 'دورود', 'دورود', 25),
(884, 'زاغه', 'زاغه', 25),
(885, 'سپیددشت', 'سپیددشت', 25),
(886, 'سراب دوره', 'سراب-دوره', 25),
(887, 'فیروزآباد', 'لرستان-فیروزآباد', 25),
(888, 'کونانی', 'کونانی', 25),
(889, 'کوهدشت', 'کوهدشت', 25),
(890, 'گراب', 'گراب', 25),
(891, 'معمولان', 'معمولان', 25),
(892, 'مومن آباد', 'مومن-آباد', 25),
(893, 'نورآباد', 'لرستان-نورآباد', 25),
(894, 'ویسیان', 'ویسیان', 25),
(895, 'احمدسرگوراب', 'احمدسرگوراب', 26),
(896, 'اسالم', 'اسالم', 26),
(897, 'اطاقور', 'اطاقور', 26),
(898, 'املش', 'املش', 26),
(899, 'آستارا', 'آستارا', 26),
(900, 'آستانه اشرفیه', 'آستانه-اشرفیه', 26),
(901, 'بازار جمعه', 'بازار-جمعه', 26),
(902, 'بره سر', 'بره-سر', 26),
(903, 'بندرانزلی', 'بندرانزلی', 26),
(906, 'پره سر', 'پره-سر', 26),
(907, 'تالش', 'تالش', 26),
(908, 'توتکابن', 'توتکابن', 26),
(909, 'جیرنده', 'جیرنده', 26),
(910, 'چابکسر', 'چابکسر', 26),
(911, 'چاف و چمخاله', 'چاف-و-چمخاله', 26),
(912, 'چوبر', 'چوبر', 26),
(913, 'حویق', 'حویق', 26),
(914, 'خشکبیجار', 'خشکبیجار', 26),
(915, 'خمام', 'خمام', 26),
(916, 'دیلمان', 'دیلمان', 26),
(917, 'رانکوه', 'رانکوه', 26),
(918, 'رحیم آباد', 'رحیم-آباد', 26),
(919, 'رستم آباد', 'رستم-آباد', 26),
(920, 'رشت', 'رشت', 26),
(921, 'رضوانشهر', 'گیلان-رضوانشهر', 26),
(922, 'رودبار', 'گیلان-رودبار', 26),
(923, 'رودبنه', 'رودبنه', 26),
(924, 'رودسر', 'رودسر', 26),
(925, 'سنگر', 'سنگر', 26),
(926, 'سیاهکل', 'سیاهکل', 26),
(927, 'شفت', 'شفت', 26),
(928, 'شلمان', 'شلمان', 26),
(929, 'صومعه سرا', 'صومعه-سرا', 26),
(930, 'فومن', 'فومن', 26),
(931, 'کلاچای', 'کلاچای', 26),
(932, 'کوچصفهان', 'کوچصفهان', 26),
(933, 'کومله', 'کومله', 26),
(934, 'کیاشهر', 'کیاشهر', 26),
(935, 'گوراب زرمیخ', 'گوراب-زرمیخ', 26),
(936, 'لاهیجان', 'لاهیجان', 26),
(937, 'لشت نشا', 'لشت-نشا', 26),
(938, 'لنگرود', 'لنگرود', 26),
(939, 'لوشان', 'لوشان', 26),
(940, 'لولمان', 'لولمان', 26),
(941, 'لوندویل', 'لوندویل', 26),
(942, 'لیسار', 'لیسار', 26),
(943, 'ماسال', 'ماسال', 26),
(944, 'ماسوله', 'ماسوله', 26),
(945, 'مرجقل', 'مرجقل', 26),
(946, 'منجیل', 'منجیل', 26),
(947, 'واجارگاه', 'واجارگاه', 26),
(948, 'امیرکلا', 'امیرکلا', 27),
(949, 'ایزدشهر', 'ایزدشهر', 27),
(950, 'آلاشت', 'آلاشت', 27),
(951, 'آمل', 'آمل', 27),
(952, 'بابل', 'بابل', 27),
(953, 'بابلسر', 'بابلسر', 27),
(954, 'بلده', 'مازندران-بلده', 27),
(955, 'بهشهر', 'بهشهر', 27),
(956, 'بهنمیر', 'بهنمیر', 27),
(957, 'پل سفید', 'پل-سفید', 27),
(958, 'تنکابن', 'تنکابن', 27),
(959, 'جویبار', 'جویبار', 27),
(960, 'چالوس', 'چالوس', 27),
(961, 'چمستان', 'چمستان', 27),
(962, 'خرم آباد', 'مازندران-خرم-آباد', 27),
(963, 'خلیل شهر', 'خلیل-شهر', 27),
(964, 'خوش رودپی', 'خوش-رودپی', 27),
(965, 'دابودشت', 'دابودشت', 27),
(966, 'رامسر', 'رامسر', 27),
(967, 'رستمکلا', 'رستمکلا', 27),
(968, 'رویان', 'رویان', 27),
(969, 'رینه', 'رینه', 27),
(970, 'زرگرمحله', 'زرگرمحله', 27),
(971, 'زیرآب', 'زیرآب', 27),
(972, 'ساری', 'ساری', 27),
(973, 'سرخرود', 'سرخرود', 27),
(974, 'سلمان شهر', 'سلمان-شهر', 27),
(975, 'سورک', 'سورک', 27),
(976, 'شیرگاه', 'شیرگاه', 27),
(977, 'شیرود', 'شیرود', 27),
(978, 'عباس آباد', 'عباس-آباد', 27),
(979, 'فریدونکنار', 'فریدونکنار', 27),
(980, 'فریم', 'فریم', 27),
(981, 'قائم شهر', 'قائم-شهر', 27),
(982, 'کتالم', 'کتالم', 27),
(983, 'کلارآباد', 'کلارآباد', 27),
(984, 'کلاردشت', 'کلاردشت', 27),
(985, 'کله بست', 'کله-بست', 27),
(986, 'کوهی خیل', 'کوهی-خیل', 27),
(987, 'کیاسر', 'کیاسر', 27),
(988, 'کیاکلا', 'کیاکلا', 27),
(989, 'گتاب', 'گتاب', 27),
(990, 'گزنک', 'گزنک', 27),
(991, 'گلوگاه', 'گلوگاه', 27),
(992, 'محمودآباد', 'مازندران-محمودآباد', 27),
(993, 'مرزن آباد', 'مرزن-آباد', 27),
(994, 'مرزیکلا', 'مرزیکلا', 27),
(995, 'نشتارود', 'نشتارود', 27),
(996, 'نکا', 'نکا', 27),
(997, 'نور', 'نور', 27),
(998, 'نوشهر', 'نوشهر', 27),
(999, 'اراک', 'اراک', 28),
(1000, 'آستانه', 'آستانه', 28),
(1001, 'آشتیان', 'آشتیان', 28),
(1002, 'پرندک', 'پرندک', 28),
(1003, 'تفرش', 'تفرش', 28),
(1004, 'توره', 'توره', 28),
(1005, 'جاورسیان', 'جاورسیان', 28),
(1006, 'خشکرود', 'خشکرود', 28),
(1007, 'خمین', 'خمین', 28),
(1008, 'خنداب', 'خنداب', 28),
(1009, 'داودآباد', 'داودآباد', 28),
(1010, 'دلیجان', 'دلیجان', 28),
(1011, 'رازقان', 'رازقان', 28),
(1012, 'زاویه', 'زاویه', 28),
(1013, 'ساروق', 'ساروق', 28),
(1014, 'ساوه', 'ساوه', 28),
(1015, 'سنجان', 'سنجان', 28),
(1016, 'شازند', 'شازند', 28),
(1017, 'غرق آباد', 'غرق-آباد', 28),
(1018, 'فرمهین', 'فرمهین', 28),
(1019, 'قورچی باشی', 'قورچی-باشی', 28),
(1020, 'کرهرود', 'کرهرود', 28),
(1021, 'کمیجان', 'کمیجان', 28),
(1022, 'مامونیه', 'مامونیه', 28),
(1023, 'محلات', 'محلات', 28),
(1024, 'مهاجران', 'مهاجران', 28),
(1025, 'میلاجرد', 'میلاجرد', 28),
(1026, 'نراق', 'نراق', 28),
(1027, 'نوبران', 'نوبران', 28),
(1028, 'نیمور', 'نیمور', 28),
(1029, 'هندودر', 'هندودر', 28),
(1030, 'ابوموسی', 'ابوموسی', 29),
(1031, 'بستک', 'بستک', 29),
(1032, 'بندرجاسک', 'بندرجاسک', 29),
(1033, 'بندرچارک', 'بندرچارک', 29),
(1034, 'بندرخمیر', 'بندرخمیر', 29),
(1035, 'بندرعباس', 'بندرعباس', 29),
(1036, 'بندرلنگه', 'بندرلنگه', 29),
(1037, 'بیکا', 'بیکا', 29),
(1038, 'پارسیان', 'پارسیان', 29),
(1039, 'تخت', 'تخت', 29),
(1040, 'جناح', 'جناح', 29),
(1041, 'حاجی آباد', 'هرمزگان-حاجی-آباد', 29),
(1042, 'درگهان', 'درگهان', 29),
(1043, 'دهبارز', 'دهبارز', 29),
(1044, 'رویدر', 'رویدر', 29),
(1045, 'زیارتعلی', 'زیارتعلی', 29),
(1046, 'سردشت', 'هرمزگان-سردشت', 29),
(1047, 'سندرک', 'سندرک', 29),
(1048, 'سوزا', 'سوزا', 29),
(1049, 'سیریک', 'سیریک', 29),
(1050, 'فارغان', 'فارغان', 29),
(1051, 'فین', 'فین', 29),
(1052, 'قشم', 'قشم', 29),
(1053, 'قلعه قاضی', 'قلعه-قاضی', 29),
(1054, 'کنگ', 'کنگ', 29),
(1055, 'کوشکنار', 'کوشکنار', 29),
(1056, 'کیش', 'کیش', 29),
(1057, 'گوهران', 'گوهران', 29),
(1058, 'میناب', 'میناب', 29),
(1059, 'هرمز', 'هرمز', 29),
(1060, 'هشتبندی', 'هشتبندی', 29),
(1061, 'ازندریان', 'ازندریان', 30),
(1062, 'اسدآباد', 'اسدآباد', 30),
(1063, 'برزول', 'برزول', 30),
(1064, 'بهار', 'بهار', 30),
(1065, 'تویسرکان', 'تویسرکان', 30),
(1066, 'جورقان', 'جورقان', 30),
(1067, 'جوکار', 'جوکار', 30),
(1068, 'دمق', 'دمق', 30),
(1069, 'رزن', 'رزن', 30),
(1070, 'زنگنه', 'زنگنه', 30),
(1071, 'سامن', 'سامن', 30),
(1072, 'سرکان', 'سرکان', 30),
(1073, 'شیرین سو', 'شیرین-سو', 30),
(1074, 'صالح آباد', 'همدان-صالح-آباد', 30),
(1075, 'فامنین', 'فامنین', 30),
(1076, 'فرسفج', 'فرسفج', 30),
(1077, 'فیروزان', 'فیروزان', 30),
(1078, 'قروه درجزین', 'قروه-درجزین', 30),
(1079, 'قهاوند', 'قهاوند', 30),
(1080, 'کبودر آهنگ', 'کبودر-آهنگ', 30),
(1081, 'گل تپه', 'گل-تپه', 30),
(1082, 'گیان', 'گیان', 30),
(1083, 'لالجین', 'لالجین', 30),
(1084, 'مریانج', 'مریانج', 30),
(1085, 'ملایر', 'ملایر', 30),
(1086, 'نهاوند', 'نهاوند', 30),
(1087, 'همدان', 'همدان', 30),
(1088, 'ابرکوه', 'ابرکوه', 31),
(1089, 'احمدآباد', 'احمدآباد', 31),
(1090, 'اردکان', 'یزد-اردکان', 31),
(1091, 'اشکذر', 'اشکذر', 31),
(1092, 'بافق', 'بافق', 31),
(1093, 'بفروئیه', 'بفروئیه', 31),
(1094, 'بهاباد', 'بهاباد', 31),
(1095, 'تفت', 'تفت', 31),
(1096, 'حمیدیا', 'حمیدیا', 31),
(1097, 'خضرآباد', 'خضرآباد', 31),
(1098, 'دیهوک', 'دیهوک', 31),
(1099, 'زارچ', 'زارچ', 31),
(1100, 'شاهدیه', 'شاهدیه', 31),
(1101, 'طبس', 'یزد-طبس', 31),
(1103, 'عقدا', 'عقدا', 31),
(1104, 'مروست', 'مروست', 31),
(1105, 'مهردشت', 'مهردشت', 31),
(1106, 'مهریز', 'مهریز', 31),
(1107, 'میبد', 'میبد', 31),
(1108, 'ندوشن', 'ندوشن', 31),
(1109, 'نیر', 'یزد-نیر', 31),
(1110, 'هرات', 'هرات', 31),
(1111, 'یزد', 'یزد', 31),
(1116, 'پرند', 'پرند', 8),
(1117, 'فردیس', 'فردیس', 5),
(1118, 'مارلیک', 'مارلیک', 5),
(1119, 'سادات شهر', 'سادات-شهر', 27),
(1121, 'زیباکنار', 'زیباکنار', 26),
(1135, 'کردان', 'کردان', 5),
(1137, 'ساوجبلاغ', 'ساوجبلاغ', 5),
(1138, 'تهران دشت', 'تهران-دشت', 5),
(1150, 'گلبهار', NULL, 11),
(1153, 'قیامدشت', 'قیامدشت', 8),
(1155, 'بینالود', 'بینالود', 11),
(1159, 'پیربازار', 'پیربازار', 26),
(1160, 'رضوانشهر', 'رضوانشهر', 31);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int NOT NULL,
  `entity_id` int DEFAULT NULL,
  `entity_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `like` int NOT NULL DEFAULT '0',
  `dislike` int NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` int NOT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `user_id` int NOT NULL,
  `user_level` tinyint NOT NULL COMMENT '1=Bronze,\r\n2=Silver,\r\n3=Gold,\r\n4=Platinum,\r\n5=Titanium',
  `code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `type` tinyint DEFAULT NULL,
  `percent` tinyint DEFAULT NULL COMMENT '%',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `all_product` tinyint(1) DEFAULT '1' COMMENT '1=all_product,\r\n0=relation_product_coupons\r\n',
  `min_price` int NOT NULL,
  `max_price` int NOT NULL,
  `start_at` timestamp NOT NULL,
  `finish_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`id`, `title`, `user_id`, `user_level`, `code`, `type`, `percent`, `description`, `status`, `all_product`, `min_price`, `max_price`, `start_at`, `finish_at`, `updated_at`, `created_at`) VALUES
(1, 'ماه رمضان', 81, 0, '338918', NULL, 5, 'ماه رمضان', 1, 0, 0, 0, '2021-12-26 07:48:47', '2021-12-26 07:48:47', NULL, '2021-12-26 07:48:52'),
(2, 'رمضان 2', 81, 0, '112218', NULL, 15, 'رمضان 2', 1, 0, 0, 0, '2021-12-26 09:49:25', '2022-01-19 09:49:25', NULL, '2021-12-26 09:49:56'),
(3, 'شب چله', 81, 0, '624667', NULL, 20, 'شب چله', 1, 1, 0, 0, '2021-12-28 12:39:10', '2022-01-20 12:39:10', NULL, '2021-12-28 12:39:47'),
(4, 'عیدی', 81, 3, '838703', NULL, 20, 'عیدی', 1, 0, 0, 0, '2021-12-29 09:21:57', '2022-01-20 09:21:57', NULL, '2021-12-29 09:22:35'),
(5, 'dd', 81, 1, '680375', NULL, 10, 'dd', 1, 0, 0, 0, '2022-01-03 06:12:22', '2022-01-20 06:12:22', NULL, '2022-01-03 06:13:00'),
(6, 'gg', 81, 0, '992363', NULL, 10, 'gg', 1, 1, 0, 0, '2022-01-08 09:38:37', '2022-01-20 09:38:37', NULL, '2022-01-08 09:38:52');

-- --------------------------------------------------------

--
-- Table structure for table `discounts`
--

CREATE TABLE `discounts` (
  `id` int NOT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `user_id` int NOT NULL,
  `code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `type` tinyint DEFAULT NULL,
  `percent` tinyint DEFAULT NULL COMMENT '%',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `start_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `finish_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `discounts`
--

INSERT INTO `discounts` (`id`, `title`, `user_id`, `code`, `type`, `percent`, `description`, `status`, `start_at`, `finish_at`, `updated_at`, `created_at`) VALUES
(25, 'یلدا ', 81, '578022', NULL, 7, 'یلدا ', 1, '2021-12-25 05:38:45', '2022-01-20 05:30:14', NULL, '2021-12-25 05:30:59'),
(26, 'یلدا 2', 81, '688283', NULL, 10, 'یلدا 2', 1, '2021-12-25 06:13:08', '2022-01-20 06:12:07', NULL, '2021-12-25 06:12:56'),
(29, 'یلدا 3', 81, '692111', NULL, 50, 'یلدا 3', 1, '2021-12-25 06:20:54', '2022-01-20 06:20:54', NULL, '2021-12-25 06:21:16');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `entity_id` int DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `session_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `user_id` int UNSIGNED DEFAULT NULL,
  `coupon_id` int NOT NULL,
  `user_full_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `user_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `city_id` int UNSIGNED DEFAULT NULL,
  `province_id` int UNSIGNED DEFAULT NULL,
  `postal_code` bigint DEFAULT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci,
  `token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `order_number` int DEFAULT NULL,
  `weight` enum('tiny','normal','big') CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `item_count` int UNSIGNED DEFAULT NULL,
  `grand_total` float DEFAULT NULL,
  `discount_total` float DEFAULT NULL,
  `shipping_cost` int DEFAULT NULL,
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `handler_id` int DEFAULT NULL,
  `sender_id` int DEFAULT NULL,
  `tracking` int NOT NULL,
  `status_sender` tinyint(1) NOT NULL COMMENT ' 0 = none , 1 = post , 2 = postbar , 3 = chapar , 4 = alopeyk , 5 = snappـbox',
  `status` tinyint(1) DEFAULT '1' COMMENT '0 = delete,\r\n1 = default,\r\n2 = handler,\r\n3 = sender,\r\n4 = delivery',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `coupon_id`, `user_full_name`, `user_phone`, `city_id`, `province_id`, `postal_code`, `address`, `token`, `order_number`, `weight`, `item_count`, `grand_total`, `discount_total`, `shipping_cost`, `notes`, `handler_id`, `sender_id`, `tracking`, `status_sender`, `status`, `created_at`, `updated_at`) VALUES
(1, 76, 0, '', '09369532227', 301, 8, 12345678, 'تهرانپارس،', '0', 0, 'normal', 6, 2710000000, 0, 0, 'لطفا کالاها را به موقع برسانید.', 0, 0, 0, 0, 1, '2021-11-30 05:32:54', NULL),
(2, 76, 0, '', '09369532227', 301, 8, 12345678, 'تهرانپارس،', '0', 0, 'normal', 8, 6800000000, 0, 0, '', 77, 77, 0, 0, 3, '2021-11-30 09:45:39', NULL),
(3, 76, 0, '', '09369532227', 301, 8, 12345678, 'تهرانپارس،', '0', 0, 'normal', 3, 2550000000, 0, 0, '', 73, 0, 0, 0, 2, '2021-11-30 09:49:05', NULL),
(4, 76, 0, '', '09369532227', 301, 8, 12345678, 'تهرانپارس،', '0', 0, 'normal', 2, 240000000, 0, 0, '', 73, 81, 0, 0, 3, '2021-11-30 09:49:52', NULL),
(5, 81, 0, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 1, 2000000, 0, 0, '44', NULL, NULL, 0, 0, 1, '2022-01-03 11:14:00', NULL),
(6, 81, 0, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 2, 11000000, 0, 0, '', NULL, NULL, 0, 0, 1, '2022-01-03 11:35:08', NULL),
(7, 81, 0, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 1, 500000, 0, 0, '', NULL, NULL, 0, 0, 1, '2022-01-08 04:32:58', NULL),
(8, 81, 0, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 1, 3150000, 0, 0, '', 81, NULL, 0, 0, 2, '2022-01-08 04:49:08', NULL),
(9, 81, 0, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 2, 4650000, 0, 0, '', 81, NULL, 0, 0, 2, '2022-01-08 04:49:37', NULL),
(10, 81, 0, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 1, 418500, 0, 0, '', 81, 81, 0, 0, 2, '2022-01-08 08:51:08', NULL),
(11, 81, 0, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 1, 900000, 0, 0, '', NULL, NULL, 0, 0, 1, '2022-01-08 09:40:04', NULL),
(12, 81, 0, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 1, 1800000, 0, 0, '', 81, NULL, 0, 0, 2, '2022-01-08 09:44:55', NULL),
(13, 81, 0, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 1, 418500, 0, 0, '', 81, NULL, 0, 0, 2, '2022-01-08 10:50:09', NULL),
(14, 81, 0, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 1, 2835000, 0, 0, '', 81, NULL, 0, 0, 2, '2022-01-08 11:11:01', NULL),
(15, 81, 0, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 1, 7000000, 0, 0, '', 81, NULL, 0, 0, 2, '2022-01-08 11:21:17', NULL),
(16, 81, 0, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 1, 900000, 0, 0, '', 81, NULL, 0, 0, 2, '2022-01-08 11:21:39', NULL),
(17, 81, 6, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 1, 900000, 0, 0, '', 81, NULL, 0, 0, 2, '2022-01-08 11:45:53', NULL),
(18, 81, 0, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 0, 0, 0, 0, '', 81, NULL, 0, 0, 2, '2022-01-08 11:48:34', NULL),
(19, 81, 0, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 0, 0, 0, 0, '', 81, NULL, 0, 0, 2, '2022-01-08 11:48:44', NULL),
(20, 81, 6, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 1, 2835000, 0, 0, '', 81, NULL, 0, 0, 2, '2022-01-08 12:28:30', NULL),
(21, 81, 6, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 1, 2835000, 0, 0, '', 81, NULL, 0, 0, 2, '2022-01-09 04:35:46', NULL),
(22, 81, 6, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 1, 900000, 0, 0, '', 81, 81, 0, 0, 3, '2022-01-09 04:50:16', NULL),
(23, 81, 2, 'مهرزاد تاج کریمی', '09128897603', 100, 3, 1000000000, 'dfgzsdfgg', '0', 0, 'normal', 1, 850000, 0, 0, '', 81, 81, 0, 2, 3, '2022-01-09 07:28:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `price` int DEFAULT NULL,
  `discount` float DEFAULT NULL,
  `cerated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`, `discount`, `cerated_at`) VALUES
(1, 1, 32, 1, 850000000, 0, NULL),
(2, 1, 33, 2, 750000000, 0, NULL),
(3, 1, 30, 3, 120000000, 0, NULL),
(4, 2, 32, 8, 850000000, 0, NULL),
(5, 3, 32, 3, 850000000, 0, NULL),
(6, 4, 30, 2, 120000000, 0, NULL),
(7, 5, 85, 1, 2000000, 0, NULL),
(8, 6, 86, 1, 7500000, 0, NULL),
(9, 6, 83, 1, 3500000, 0, NULL),
(10, 7, 84, 1, 500000, 0, NULL),
(11, 8, 83, 1, 3500000, 0, NULL),
(12, 9, 82, 1, 1500000, 0, NULL),
(13, 9, 83, 1, 3500000, 0, NULL),
(14, 10, 84, 1, 500000, 0, NULL),
(16, 11, 85, 1, 2000000, 0, NULL),
(18, 12, 80, 1, 2000000, 0, NULL),
(20, 13, 84, 1, 500000, 0, NULL),
(22, 14, 83, 1, 3500000, 0, NULL),
(24, 15, 88, 1, 7000000, 0, NULL),
(25, 16, 90, 1, 1000000, 0, NULL),
(27, 17, 85, 1, 2000000, 0, NULL),
(29, 20, 83, 1, 3500000, 0, NULL),
(31, 21, 83, 1, 3500000, 0, NULL),
(33, 22, 85, 1, 2000000, 0, NULL),
(35, 23, 85, 1, 2000000, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `label`, `status`, `created_at`) VALUES
(191, 'contact-us-read', 'نمایش پیامهای تماس با ما', 1, '2021-12-06 07:10:38'),
(192, 'about-read', 'نمایش در باره ما', 1, '2021-12-06 07:10:38'),
(193, 'about-update', 'ویرایش درباره ما', 1, '2021-12-06 07:10:38'),
(194, 'policies-read', 'نمایش قوانین', 1, '2021-12-06 07:10:38'),
(195, 'policies-update', 'ویرایش قوانین', 1, '2021-12-06 07:10:38'),
(196, 'news-read', 'نمایش اخبار اطلاعات', 1, '2021-12-06 07:10:38'),
(197, 'news-update', 'ویرایش اخبار اطلاعات', 1, '2021-12-06 07:10:38'),
(198, 'news-create', 'ایجاد اخبار اطلاعات', 1, '2021-12-06 07:10:38'),
(199, 'news-delete', 'حذف اخبار اطلاعات', 1, '2021-12-06 07:10:38'),
(200, 'category-read', 'نمایش دسته بندی ها', 1, '2021-12-06 07:10:38'),
(201, 'category-update', 'ویرایش دسته بندی ها', 1, '2021-12-06 07:10:38'),
(202, 'category-create', 'ایجاد دسته بندی ها', 1, '2021-12-06 07:10:38'),
(203, 'category-delete', 'حذف دسته بندی ها', 1, '2021-12-06 07:10:38'),
(204, 'site-content-read', 'نمایش سایر اطلاعات', 1, '2021-12-06 07:10:38'),
(205, 'site-content-update', 'ویرایش سایر اطلاعات', 1, '2021-12-06 07:10:38'),
(206, 'commission-read', 'نمایش کارمزد معاملات', 1, '2021-12-06 07:10:38'),
(207, 'commission-update', 'ویرایش کارمزد معاملات', 1, '2021-12-06 07:10:38'),
(208, 'market-read', 'نمایش مدیرت مارکت ها', 1, '2021-12-06 07:10:38'),
(209, 'market-update', 'ویرایش مدیرت مارکت ها', 1, '2021-12-06 07:10:38'),
(210, 'wallet-address-create', 'ایجاد آدرس ها کیف پول', 1, '2021-12-06 07:10:38'),
(211, 'wallet-address-read', 'نمایش آدرس ها کیف پول', 1, '2021-12-06 07:10:38'),
(212, 'wallet-address-check', 'بررسی آدرس ها کیف پول', 1, '2021-12-06 07:10:38'),
(213, 'slideshow-create', 'ایجاد اسلاید شو', 1, '2021-12-06 07:10:38'),
(214, 'slideshow-read', 'نمایش اسلاید شو', 1, '2021-12-06 07:10:38'),
(215, 'slideshow-update', 'ویرایش اسلاید شو', 1, '2021-12-06 07:10:38'),
(216, 'slideshow-delete', 'حذف اسلاید شو', 1, '2021-12-06 07:10:38'),
(217, 'ticket-create', 'ایجاد تیکت ها', 1, '2021-12-06 07:10:38'),
(218, 'ticket-read', 'نمایش تیکت ها', 1, '2021-12-06 07:10:38'),
(219, 'ticket-update', 'ویرایش تیکت ها', 1, '2021-12-06 07:10:38'),
(220, 'ticket-delete', 'حذف تیکت ها', 1, '2021-12-06 07:10:38'),
(221, 'ticket-reply', 'پاسخ تیکت ها', 1, '2021-12-06 07:10:38'),
(222, 'site-fee-read', 'مشاهده گزارش عملکرد', 1, '2021-12-06 07:10:38'),
(223, 'report-wallet-read', 'مشاهده گزارش صندوق', 1, '2021-12-06 07:10:38'),
(224, 'report-wallet-user-balance', 'مشاهده موجودی کاربران در گزارش صندوق', 1, '2021-12-06 07:10:38'),
(225, 'transaction-read', 'مشاهده گردش حساب کاربر', 1, '2021-12-06 07:10:38'),
(226, 'order-read', 'نمایش سفارشها', 1, '2021-12-06 07:10:38'),
(227, 'site-settings-create', 'ایجاد تنظیمات سایت', 1, '2021-12-06 07:10:38'),
(228, 'site-settings-read', 'نمایش تنظیمات سایت', 1, '2021-12-06 07:10:38'),
(229, 'site-settings-update', 'ویرایش تنظیمات سایت', 1, '2021-12-06 07:10:38'),
(230, 'site-settings-delete', 'حذف تنظیمات سایت', 1, '2021-12-06 07:10:38'),
(231, 'bank-account-create', 'ایجاد حساب بانکی', 1, '2021-12-06 07:10:38'),
(232, 'bank-account-read', 'نمایش حساب بانکی', 1, '2021-12-06 07:10:38'),
(233, 'bank-account-update', 'ویرایش حساب بانکی', 1, '2021-12-06 07:10:38'),
(234, 'bank-account-delete', 'حذف حساب بانکی', 1, '2021-12-06 07:10:38'),
(235, 'api-log-read', 'مشاهده فراخوانی های api', 1, '2021-12-06 07:10:38'),
(236, 'activity-log-read', 'مشاهده ریز فعالیت های سایت', 1, '2021-12-06 07:10:38'),
(237, 'user-create', 'ایجاد کاربر', 1, '2021-12-06 07:10:38'),
(238, 'user-read', 'نمایش کاربر', 1, '2021-12-06 07:10:38'),
(239, 'user-update', 'ویرایش کاربر', 1, '2021-12-06 07:10:38'),
(240, 'user-delete', 'حذف کاربر', 1, '2021-12-06 07:10:38'),
(241, 'user-auth', 'احراز هویت کاربر', 1, '2021-12-06 07:10:38'),
(242, 'user-hard-update', 'ویرایش تمامی اطلاعات کاربر', 1, '2021-12-06 07:10:38'),
(243, 'user-pics-read', 'مشاهده تصاویر کاربر', 1, '2021-12-06 07:10:38'),
(244, 'user-pics-delete', 'حذف تصاویر کاربر', 1, '2021-12-06 07:10:38'),
(245, 'user-wallet-read', 'مشاهده کیف پول کاربر', 1, '2021-12-06 07:10:38'),
(246, 'user-wallet-manual-deposit-withdraw', ' تغییر موجودی کیف پول کاربر', 1, '2021-12-06 07:10:38'),
(247, 'permission-create', 'ایجاد دسترسی', 1, '2021-12-06 07:10:38'),
(248, 'permission-read', 'نمایش دسترسی', 1, '2021-12-06 07:10:38'),
(249, 'permission-update', 'ویرایش دسترسی', 1, '2021-12-06 07:10:38'),
(250, 'permission-delete', 'حذف دسترسی', 1, '2021-12-06 07:10:38'),
(251, 'role-create', 'ایجادنقش', 1, '2021-12-06 07:10:38'),
(252, 'role-read', 'نمایش نقش', 1, '2021-12-06 07:10:38'),
(253, 'role-update', 'ویرایش نقش', 1, '2021-12-06 07:10:38'),
(254, 'role-delete', 'حذف نقش', 1, '2021-12-06 07:10:38'),
(255, 'admin-create', 'ایجاد ادمین', 1, '2021-12-06 07:10:38'),
(256, 'admin-read', 'نمایش ادمین', 1, '2021-12-06 07:10:38'),
(257, 'admin-update', 'ویرایش ادمین', 1, '2021-12-06 07:10:38'),
(258, 'admin-delete', 'حذف ادمین', 1, '2021-12-06 07:10:38'),
(259, 'admin-self-read', 'نمایش پروفایل مدیر', 1, '2021-12-06 07:10:38'),
(260, 'admin-self-update', 'ویرایش پروفایل مدیر', 1, '2021-12-06 07:10:38');

-- --------------------------------------------------------

--
-- Table structure for table `permission_users`
--

CREATE TABLE `permission_users` (
  `id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `permission_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `permission_users`
--

INSERT INTO `permission_users` (`id`, `user_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 74, 3, '2021-11-24 14:05:13', NULL),
(2, 74, 2, '2021-11-24 14:05:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `photos`
--

CREATE TABLE `photos` (
  `id` int NOT NULL,
  `entity_id` int DEFAULT NULL,
  `entity_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `type` tinyint DEFAULT '0',
  `path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `alt` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `photos`
--

INSERT INTO `photos` (`id`, `entity_id`, `entity_type`, `type`, `path`, `alt`, `created_at`) VALUES
(65, 70, 'User', 0, 'http://usedkalaV2.me/Storage/202109/33.---06e07e5d.jpg', 'product_image', '2021-09-22 05:23:50'),
(67, 2, 'Blog', 0, NULL, 'image_blog', '2021-10-04 12:22:27'),
(68, 3, 'Blog', 0, 'http://usedkalaV2.me/Storage/202110/Screenshot from 2021-09-14 13-14-21.---4dc7ef1f.png', 'image_blog', '2021-10-04 12:24:57'),
(69, 4, 'Blog', 0, 'http://usedkalaV2.me/Storage/202110/Screenshot from 2021-09-14 19-43-10.---29d7782a.png', 'image_blog', '2021-10-18 12:20:37'),
(72, 5, 'Blog', 0, 'http://usedkalaV2.me/Storage/202110/Screenshot from 2021-09-28 20-00-46.---21c940ae.png', 'image_blog', '2021-10-18 12:25:49'),
(73, 72, 'User', 0, 'http://usedkalaV2.me/Storage/202110/PHOTO-2021-06-23-10-49-09.---fccfb516.jpg', 'profile_image', '2021-10-21 07:50:41'),
(77, 10, 'Blog', 0, 'http://usedkalaV2.me/Storage/202111/2fb7065f9329c0c.---62c7b202.jpg', 'image_blog', '2021-11-08 10:27:00'),
(78, 11, 'Blog', 0, 'http://usedkalaV2.me/Storage/202111/PHOTO-2021-06-23-10-49-09.---9eefbbbc.jpg', 'image_blog', '2021-11-08 11:29:28'),
(79, 73, 'User', 0, 'http://usedkalaV2.me/Storage/202111/F5.---5f12ec19.png', 'profile_image', '2021-11-10 11:31:40'),
(87, 6, 'Slider', 0, 'http://usedkalaV2.me/Storage/202111/20_.---95962910.jpg', 'slider_image', '2021-11-13 09:44:50'),
(88, 7, 'Slider', 0, 'http://usedkalaV2.me/Storage/202111/card-2.---fb860520.jpg', 'slider_image', '2021-11-13 09:55:20'),
(90, 9, 'Slider', 0, 'http://usedkalaV2.me/Storage/202111/40.---a248e0ce.jpg', 'slider_image', '2021-11-17 09:14:16'),
(91, 76, 'User', 0, 'http://usedkalav2.me/Storage/202111/composable-applications.---a157ec34.jpg', 'profile_image', '2021-11-28 08:40:51'),
(93, 13, 'Blog', 0, 'http://usedkalaV2.me/Storage/202112/Background-UNICOM-Engineering-Dell-EMC-Banner3_0.---b9800d50.jpg', 'image_blog', '2021-12-13 14:26:29'),
(101, 106, 'Category', 0, 'http://usedkalav2.me/Storage/202112/server.png', NULL, '2021-12-14 08:22:52'),
(102, 107, 'Category', 0, 'http://usedkalav2.me/Storage/202112/s-l640.png', NULL, '2021-12-14 08:22:52'),
(103, 108, 'Category', 0, 'http://usedkalav2.me/Storage/202112/3pyw9u.png', NULL, '2021-12-14 08:22:52'),
(104, 115, 'Category', 0, 'http://usedkalav2.me/Storage/202112/surveillance-hard-drive-hdd-L1.png', NULL, '2021-12-14 08:22:52'),
(105, 119, 'Category', 0, 'http://usedkalav2.me/Storage/202112/TAPE-DRIVE.png', NULL, '2021-12-14 08:22:52'),
(106, 121, 'Category', 0, 'http://usedkalav2.me/Storage/202112/SWITCH-6505.png', NULL, '2021-12-14 08:22:52'),
(107, 161, 'Category', 0, 'http://usedkalav2.me/Storage/202112/Hewlett_Packard_Enterprise_logo.png', NULL, '2021-12-14 08:22:53'),
(108, 162, 'Category', 0, 'http://usedkalav2.me/Storage/202112/Cisco_logo.png', NULL, '2021-12-14 08:22:53'),
(109, 163, 'Category', 0, 'http://usedkalav2.me/Storage/202112/Dell_EMC-Logo.png', NULL, '2021-12-14 08:22:53'),
(110, 164, 'Category', 0, 'http://usedkalav2.me/Storage/202112/vmware-logo.png', NULL, '2021-12-14 08:22:53'),
(111, 165, 'Category', 0, 'http://usedkalav2.me/Storage/202112/Intel_logo.png', NULL, '2021-12-14 08:22:53'),
(112, 166, 'Category', 0, 'http://usedkalav2.me/Storage/202112/SOPHOS_training_calender_logo.png', NULL, '2021-12-14 08:22:53'),
(113, 167, 'Category', 0, 'http://usedkalav2.me/Storage/202112/1200px-IBM_logo.svg_.png', NULL, '2021-12-14 08:22:53'),
(174, 1, 'Product', 0, 'http://usedkalav2.me/Storage/202112/300.png', NULL, '2021-12-14 10:38:24'),
(175, 2, 'Product', 0, 'http://usedkalav2.me/Storage/202112/prod_9715600413.jpg', NULL, '2021-12-14 10:38:24'),
(176, 3, 'Product', 0, 'http://usedkalav2.me/Storage/202112/826682-b21-10120594-014_600x600.jpg', NULL, '2021-12-14 10:38:25'),
(177, 4, 'Product', 0, 'http://usedkalav2.me/Storage/202112/588072-b21-10107628-014.jpg', NULL, '2021-12-14 10:38:25'),
(178, 5, 'Product', 0, 'http://usedkalav2.me/Storage/202112/417py4oLqfL._AC_SX425_.jpg', NULL, '2021-12-14 10:38:25'),
(179, 6, 'Product', 0, 'http://usedkalav2.me/Storage/202112/513+WsWKaOL._AC_.jpg', NULL, '2021-12-14 10:38:25'),
(180, 7, 'Product', 0, 'http://usedkalav2.me/Storage/202112/CPU-Cooler-Server-CPU-Processor-Fan-and-HEATSINK-DL380-G6-G7-Upgrade-Kit-Heatsink-507661-001.jpg_q50.jpg', NULL, '2021-12-14 10:38:25'),
(181, 8, 'Product', 0, 'http://usedkalav2.me/Storage/202112/s-l1600.jpg', NULL, '2021-12-14 10:38:25'),
(182, 9, 'Product', 0, 'http://usedkalav2.me/Storage/202112/s-l640.jpg', NULL, '2021-12-14 10:38:25'),
(183, 10, 'Product', 0, 'http://usedkalav2.me/Storage/202112/c_708639_B21_1024_x_768_1.jpg', NULL, '2021-12-14 10:38:25'),
(184, 11, 'Product', 0, 'http://usedkalav2.me/Storage/202112/img_21422042_medium_1482836926_7332_30852.jpg', NULL, '2021-12-14 10:38:25'),
(185, 12, 'Product', 0, 'http://usedkalav2.me/Storage/202112/hp-619291-b21-hp-900gb-6g-sas-10k-2-5in-dp-ent-hdd-10106162.jpg', NULL, '2021-12-14 10:38:25'),
(186, 13, 'Product', 0, 'http://usedkalav2.me/Storage/202112/s-l500.jpg', NULL, '2021-12-14 10:38:26'),
(187, 14, 'Product', 0, 'http://usedkalav2.me/Storage/202112/A4MR_1_20160304651104895.jpg', NULL, '2021-12-14 10:38:26'),
(188, 15, 'Brand', 0, 'http://usedkalaV2.me/Storage/202112/ADATA.---d1e1f27d.png', 'brand_image', '2021-12-14 10:38:26'),
(189, 16, 'Product', 0, 'http://usedkalav2.me/Storage/202112/51IN3KG1PlL._AC_SL1024_.jpg', NULL, '2021-12-14 10:38:26'),
(190, 17, 'Product', 0, 'http://usedkalav2.me/Storage/202112/81RUq+s4qbL._AC_SL1500_.jpg', NULL, '2021-12-14 10:38:27'),
(191, 18, 'Product', 0, 'http://usedkalav2.me/Storage/202112/0~EF52BA7D-269E-40AB-B82C-68AF478F331D~400~300~1.png', NULL, '2021-12-14 10:38:27'),
(192, 19, 'Product', 0, 'http://usedkalav2.me/Storage/202112/P387909.jpg', NULL, '2021-12-14 10:38:27'),
(193, 20, 'Product', 0, 'http://usedkalav2.me/Storage/202112/61KkSEM84QL._AC_SL1024_.jpg', NULL, '2021-12-14 10:38:27'),
(194, 16, 'Brand', 0, 'http://usedkalaV2.me/Storage/202112/vmware-symbol-png-logo-3.---3302ea3f.png', 'brand_image', '2021-12-14 11:34:36'),
(195, 17, 'Brand', 0, 'http://usedkalaV2.me/Storage/202112/Sophos-ATC-LogoSQ.---37fe0552.png', 'brand_image', '2021-12-14 11:35:58'),
(196, 131, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/LD0003959506_2_0003959562_0005140614.---b2a7e5ff.jpg', 'image_category', '2021-12-14 11:49:57'),
(197, 130, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/sophos-xg-450-firewall.---5a804d12.png', 'image_category', '2021-12-14 11:52:22'),
(198, 129, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/patch cord.---39d421b6.png', 'image_category', '2021-12-14 11:53:28'),
(199, 128, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/patch panel.---68bc7dff.png', 'image_category', '2021-12-14 11:54:37'),
(200, 127, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/network module.---ef5be843.png', 'image_category', '2021-12-14 11:56:49'),
(201, 126, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/hub dlink.---e5a07762.png', 'image_category', '2021-12-14 12:09:53'),
(202, 125, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/access point.---2e3eebcc.png', 'image_category', '2021-12-14 12:11:17'),
(203, 124, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/cisco router.---0c42e588.jpg', 'image_category', '2021-12-14 12:12:33'),
(204, 123, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/Cisco-Catalyst-9600.---b277a54d.jpg', 'image_category', '2021-12-14 12:12:49'),
(205, 122, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/server rack.---9830492c.jpg', 'image_category', '2021-12-14 12:13:47'),
(206, 120, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/hp disk enclosure.---02c2d0b2.jpg', 'image_category', '2021-12-14 12:32:28'),
(207, 118, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/tape library.---5f78f800.jpg', 'image_category', '2021-12-14 12:33:14'),
(208, 117, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/storage accessories.---1df4f310.jpeg', 'image_category', '2021-12-14 12:35:58'),
(209, 116, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/raid controller.---5cf2d413.jpg', 'image_category', '2021-12-14 12:36:32'),
(210, 114, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/3par8000.---c26ad887.jpg', 'image_category', '2021-12-14 12:37:34'),
(211, 113, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/bios.---2252c959.jpg', 'image_category', '2021-12-14 12:38:44'),
(212, 160, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/storage accessories.---0e7a37fd.jpeg', 'image_category', '2021-12-14 12:39:04'),
(213, 159, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/network controller.---d68db64c.png', 'image_category', '2021-12-14 12:40:15'),
(214, 158, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/VMware_FUS4_ENG_M_CP_VMware_Fusion_4_Software_823248.---ace03ad7.jpg', 'image_category', '2021-12-14 12:41:37'),
(215, 157, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/storage controller.---85ce8841.jpg', 'image_category', '2021-12-14 12:42:40'),
(216, 156, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/hba.---056e3f92.jpg', 'image_category', '2021-12-14 12:43:13'),
(217, 155, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/power.---81a23f84.jpg', 'image_category', '2021-12-14 12:43:43'),
(218, 154, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/optical drive.---dbf9b509.jpg', 'image_category', '2021-12-14 12:44:16'),
(219, 153, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/memory upgrade kit.---84912c39.jpg', 'image_category', '2021-12-14 12:45:03'),
(220, 152, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/hpe hdd.---f0c053f5.jpg', 'image_category', '2021-12-14 12:45:47'),
(221, 151, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/hpe ram.---3181fc34.jpg', 'image_category', '2021-12-14 12:46:21'),
(222, 150, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/heatsink-for-dell-poweredge-r310-r410.---bb94290b.jpg', 'image_category', '2021-12-14 12:47:16'),
(223, 149, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---cf3df4b4.jpg', 'image_category', '2021-12-14 12:47:50'),
(224, 148, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/fujitsu-server-rx300s7-front-25x12_ml.---52abd9ee.jpg', 'image_category', '2021-12-14 12:48:46'),
(225, 112, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/dl380.---5e6533ff.jpg', 'image_category', '2021-12-14 12:49:09'),
(226, 92, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe license.---a8ef9d31.jpg', 'product_image', '2021-12-14 12:57:52'),
(227, 15, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hp power 460w.---92b90b0f.jpg', 'product_image', '2021-12-14 13:06:42'),
(228, 21, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe cable 5m.---59876967.jpg', 'product_image', '2021-12-14 13:11:19'),
(229, 22, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/HPE-ProLiant-DL380-Gen9-5.---a69c5196.jpg', 'product_image', '2021-12-14 13:12:04'),
(230, 23, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---d34123f9.jpg', 'product_image', '2021-12-14 13:12:34'),
(231, 24, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---0d0b5d9a.jpg', 'product_image', '2021-12-14 13:12:54'),
(232, 25, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---bd7a069b.jpg', 'product_image', '2021-12-14 13:13:12'),
(233, 26, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---b5fa15f9.jpg', 'product_image', '2021-12-14 13:13:36'),
(234, 27, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---a5b8efda.jpg', 'product_image', '2021-12-14 13:13:50'),
(235, 28, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---6a08c983.jpg', 'product_image', '2021-12-14 13:15:27'),
(236, 29, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---1960d2c1.jpg', 'product_image', '2021-12-14 13:15:40'),
(237, 30, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---382efba6.jpg', 'product_image', '2021-12-14 13:15:54'),
(238, 31, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---b321b46a.jpg', 'product_image', '2021-12-14 13:16:10'),
(239, 32, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---b321b46a.jpg', NULL, '2021-12-14 13:19:43'),
(240, 33, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---b321b46a.jpg', NULL, '2021-12-14 13:19:43'),
(241, 34, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---b321b46a.jpg', NULL, '2021-12-14 13:19:43'),
(242, 35, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---b321b46a.jpg', NULL, '2021-12-14 13:19:43'),
(243, 36, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---b321b46a.jpg', NULL, '2021-12-14 13:19:43'),
(244, 37, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---b321b46a.jpg', NULL, '2021-12-14 13:19:43'),
(245, 38, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---b321b46a.jpg', NULL, '2021-12-14 13:19:43'),
(246, 39, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---b321b46a.jpg', NULL, '2021-12-14 13:19:43'),
(247, 40, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---b321b46a.jpg', NULL, '2021-12-14 13:19:43'),
(248, 41, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---b321b46a.jpg', NULL, '2021-12-14 13:19:44'),
(249, 42, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/intel-xeon-e5507.---b321b46a.jpg', NULL, '2021-12-14 13:19:44'),
(250, 43, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/dl380p g8 heatsink.---b6701bf9.jpg', 'product_image', '2021-12-14 13:22:52'),
(251, 44, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/dl380p%20g8%20heatsink.---b6701bf9.jpg', NULL, '2021-12-14 13:23:22'),
(252, 45, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/dl380p%20g8%20heatsink.---b6701bf9.jpg', NULL, '2021-12-14 13:23:22'),
(253, 46, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/dl380p%20g8%20heatsink.---b6701bf9.jpg', NULL, '2021-12-14 13:23:22'),
(254, 47, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/dl380p%20g8%20heatsink.---b6701bf9.jpg', NULL, '2021-12-14 13:23:22'),
(255, 48, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/dl380p%20g8%20heatsink.---b6701bf9.jpg', NULL, '2021-12-14 13:23:22'),
(256, 49, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/dl380p%20g8%20heatsink.---b6701bf9.jpg', NULL, '2021-12-14 13:23:22'),
(257, 50, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/dl380p%20g8%20heatsink.---b6701bf9.jpg', NULL, '2021-12-14 13:23:22'),
(258, 51, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/dl380p%20g8%20heatsink.---b6701bf9.jpg', NULL, '2021-12-14 13:23:22'),
(259, 52, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/dl380p%20g8%20heatsink.---b6701bf9.jpg', NULL, '2021-12-14 13:23:22'),
(260, 53, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/dl380p%20g8%20heatsink.---b6701bf9.jpg', NULL, '2021-12-14 13:23:22'),
(261, 54, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe ram.---4bcbe487.jpg', 'product_image', '2021-12-14 13:24:04'),
(262, 55, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20ram.---4bcbe487.jpg', NULL, '2021-12-14 13:29:15'),
(263, 56, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20ram.---4bcbe487.jpg', NULL, '2021-12-14 13:29:15'),
(264, 57, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20ram.---4bcbe487.jpg', NULL, '2021-12-14 13:29:15'),
(265, 58, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20ram.---4bcbe487.jpg', NULL, '2021-12-14 13:29:15'),
(266, 59, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20ram.---4bcbe487.jpg', NULL, '2021-12-14 13:29:15'),
(267, 60, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20ram.---4bcbe487.jpg', NULL, '2021-12-14 13:29:15'),
(268, 61, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20ram.---4bcbe487.jpg', NULL, '2021-12-14 13:29:15'),
(269, 62, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20ram.---4bcbe487.jpg', NULL, '2021-12-14 13:29:15'),
(270, 63, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20ram.---4bcbe487.jpg', NULL, '2021-12-14 13:29:16'),
(271, 64, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20ram.---4bcbe487.jpg', NULL, '2021-12-14 13:29:16'),
(272, 65, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20ram.---4bcbe487.jpg', NULL, '2021-12-14 13:29:16'),
(273, 66, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20ram.---4bcbe487.jpg', NULL, '2021-12-14 13:29:16'),
(274, 67, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20ram.---4bcbe487.jpg', NULL, '2021-12-14 13:29:16'),
(275, 68, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20ram.---4bcbe487.jpg', NULL, '2021-12-14 13:29:16'),
(276, 69, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20ram.---4bcbe487.jpg', NULL, '2021-12-14 13:29:16'),
(277, 70, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/HP-750W-Common-Slot-Gold-Hot-Plug-Power-Supply-1.---6db47428.jpg', 'product_image', '2021-12-14 13:30:13'),
(278, 71, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe-power-800w.---46edc4de.jpg', 'product_image', '2021-12-14 13:30:58'),
(279, 72, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hp-power-400w.---fc7fd57d.jpg', 'product_image', '2021-12-14 13:31:47'),
(280, 73, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hp-e200-g5-fh-pcie-x8-raid-controller-dce.---27c0eaed.jpg', 'product_image', '2021-12-14 13:32:51'),
(281, 74, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hp-p400.---d4fec46d.jpg', 'product_image', '2021-12-14 13:33:32'),
(282, 75, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hp-p400.---d4fec46d.jpg', NULL, '2021-12-14 13:34:02'),
(283, 76, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hp-p400.---d4fec46d.jpg', NULL, '2021-12-14 13:34:02'),
(284, 77, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe-disk-enc.---cfc6639e.jpg', 'product_image', '2021-12-14 13:34:52'),
(285, 78, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe-disk-enc.---09cbf3fe.jpg', 'product_image', '2021-12-14 13:35:11'),
(286, 79, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe-hotplug.---54c8184d.jpg', 'product_image', '2021-12-14 13:36:07'),
(287, 80, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe-hotplug.---54c8184d.jpg', NULL, '2021-12-14 13:36:52'),
(288, 81, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe-hotplug.---54c8184d.jpg', NULL, '2021-12-14 13:36:52'),
(289, 82, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe-hotplug.---54c8184d.jpg', NULL, '2021-12-14 13:36:52'),
(290, 83, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe-hotplug.---54c8184d.jpg', NULL, '2021-12-14 13:36:52'),
(291, 84, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe-hotplug.---54c8184d.jpg', NULL, '2021-12-14 13:36:52'),
(292, 85, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe-hotplug.---54c8184d.jpg', NULL, '2021-12-14 13:36:52'),
(293, 86, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20cable%205m.---59876967.jpg', NULL, '2021-12-14 13:37:57'),
(294, 87, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20cable%205m.---59876967.jpg', NULL, '2021-12-14 13:37:57'),
(295, 88, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20cable%205m.---59876967.jpg', NULL, '2021-12-14 13:37:57'),
(296, 89, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20cable%205m.---59876967.jpg', NULL, '2021-12-14 13:37:57'),
(297, 90, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20cable%205m.---59876967.jpg', NULL, '2021-12-14 13:37:57'),
(298, 91, 'Product', 0, 'http://usedkalaV2.me/Storage/202112/hpe%20cable%205m.---59876967.jpg', NULL, '2021-12-14 13:37:57'),
(299, 14, 'Brand', 0, 'http://usedkalaV2.me/Storage/202112/hp.---f609ff31.png', 'brand_image', '2021-12-14 13:59:08'),
(300, 13, 'Brand', 0, 'http://usedkalaV2.me/Storage/202112/dell emc.---35ea7b01.png', 'brand_image', '2021-12-14 13:59:19'),
(301, 12, 'Brand', 0, 'http://usedkalaV2.me/Storage/202112/intel.---cdeea7f9.png', 'brand_image', '2021-12-14 13:59:27'),
(302, 11, 'Brand', 0, 'http://usedkalaV2.me/Storage/202112/Cisco_logo.svg.---bb349861.png', 'brand_image', '2021-12-14 13:59:35'),
(303, 10, 'Brand', 0, 'http://usedkalaV2.me/Storage/202112/hpe.---a157fa8c.png', 'brand_image', '2021-12-14 13:59:43'),
(304, 168, 'Category', 0, 'http://usedkalaV2.me/Storage/202201/home-v12-background.---708391ff.jpg', 'image_category', '2021-12-27 08:47:31'),
(307, 171, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/40.---a7f64bb0.jpg', 'image_category', '2021-12-27 09:22:37'),
(309, 173, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/42.---b54766a3.jpg', 'image_category', '2021-12-27 09:31:36'),
(314, 178, 'Category', 0, 'http://usedkalaV2.me/Storage/202112/1-1.---0e0ce5a5.jpg', 'image_category', '2021-12-27 11:41:31'),
(322, 189, 'Category', 0, 'http://usedkalaV2.me/Storage/202201/38.---ddece540.jpg', 'image_category', '2022-01-04 07:24:36');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `brand_id` int DEFAULT NULL,
  `user_id` int DEFAULT '0',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT '',
  `title_english` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT '',
  `seo_robot` tinyint DEFAULT NULL COMMENT '''0=Index 1=Noindex 2=Nofollow 3=Follow 4=None 5=Noimageindex 6=Noarchive 7=Nocache''',
  `seo_canonical` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `seo_H1` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `seo_description` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `seo_title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `meta_title` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci,
  `price` bigint DEFAULT '0',
  `featured` tinyint(1) DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `slug` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT '',
  `sale` tinyint(1) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `status_related` tinyint(1) DEFAULT '0' COMMENT '0 = not show related products \r\n1 = get related products by categories \r\n2 = get related products by selected products by Admin ',
  `sku` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL COMMENT 'Stock Keeping Unit',
  `quantity` int DEFAULT '0',
  `weight` float DEFAULT NULL COMMENT 'kg',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `published_at` timestamp NULL DEFAULT NULL,
  `started_at` timestamp NULL DEFAULT NULL,
  `end_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `brand_id`, `user_id`, `title`, `title_english`, `seo_robot`, `seo_canonical`, `seo_H1`, `seo_description`, `seo_title`, `meta_title`, `description`, `price`, `featured`, `image`, `slug`, `sale`, `status`, `status_related`, `sku`, `quantity`, `weight`, `created_at`, `updated_at`, `published_at`, `started_at`, `end_at`) VALUES
(1, 14, 0, 'سرور باندل رکمونت DL380 Gen7 HP', 'HP ProLiant DL380 G7 X5650 2P 12GB-R P410i/1GB FBWC 8 SFF 750W RPS Perf IC Svr', NULL, NULL, NULL, 'خرید و بهترین قیمت سرور باندل رکمونت DL380 Gen7 HP | یوزدکالا | بهترین قیمت انواع سرور دست دوم | یوزد کالا', 'خرید و بهترین قیمت سرور باندل رکمونت DL380 Gen7 HP | یوزدکالا', NULL, '<p><span class=\"tlid-translation translation\" lang=\"fa\"><span class=\"\" title=\"\"><span class=\"tlid-translation translation\" lang=\"fa\"><span class=\"\" title=\"\">نوع: رک (2U)</span><br /> <span class=\"\" title=\"\">خانواده پردازنده: Intel&reg; Xeon&reg; 5000 Sequence</span><br /> <span class=\"\" title=\"\">پردازنده: X5650</span><br /> <span title=\"\">حداکثر پردازنده ها: 2</span><br /> <span title=\"\">حداکثر دیسک: 12</span><br /> <span title=\"\">حداکثر حافظه: 384 گیگابایت</span><br /> <span title=\"\">مدل: HP Proliant DL380</span></span></span></span></p>\r\n<p>&nbsp;</p>\r\n<p><span class=\"tlid-translation translation\" lang=\"fa\"><span class=\"\" title=\"\">توضیحات محصول</span><br /><br /><span class=\"\" title=\"\">تراکم بهینه شده برای انعطاف پذیری و مدیریت</span> <span title=\"\">ایده آل برای استقرار چند سرور.</span> <span title=\"\">مدل رک و خوشه ای</span><br /><br /><span title=\"\">امتیاز مهم و مزایا</span><br /><br /> <span title=\"\">سرورهای همه کاره با 1 - 2 پردازنده</span><br /> <span title=\"\">مناسب برای مراکز داده بزرگ و محیط های پیچیده SMB</span><br /> <span title=\"\">برنامه های ایمیل و پایگاه داده، </span></span><span class=\"tlid-translation translation\" lang=\"fa\"><span title=\"\"><span class=\"tlid-translation translation\" lang=\"fa\"><span title=\"\">نصب کامل </span></span>برنامه های شبکه<br /></span></span></p>', 50000000, NULL, NULL, 'سرور-باندل-رکمونت-DL380-Gen7-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:24', NULL, NULL, NULL, NULL),
(2, 14, 0, 'سرور باندل رکمونت DL380p Gen8 HP', 'HP ProLiant DL380p Gen8 E5-2690v2 2P 32GB-R P420i/2GB FBWC 750W RPS Server', NULL, NULL, NULL, 'خرید و بهترین قیمت سرور باندل رکمونت DL380p Gen8 HP | یوزدکالا | بهترین قیمت انواع سرور دست دوم | یوزد کالا', 'خرید و بهترین قیمت سرور باندل رکمونت DL380p Gen8 HP | یوزدکالا', NULL, '<p><span class=\"tlid-translation translation\" lang=\"fa\">این سرور، استاندارد مرکز داده را برای سرورهای rack 2 سوکت 2U با جدیدترین قابلیت سرویس، انعطاف پذیری پیکربندی پیشرفته، طراحی الهام گرفته از مشتری و عملکرد بی نظیر تنظیم می کند. سرور DL380p Gen8 راهکار مناسبی برای نیازهای محاسبه پویا مشاغل کوچک در حال رشد و همچنین مراکز داده متقاضی ارائه می دهد.<br /><br /> ظرفیت و عملکرد بهبود یافته در محاسبه و ذخیره سازی<br /></span><span class=\"tlid-translation translation\" lang=\"fa\"><span class=\"tlid-translation translation\" lang=\"fa\">پردازنده </span>اینتل Xeon خانواده E5-2600 v2 افزایش عملکرد، بهبود امنیت و بهره وری را </span><span class=\"tlid-translation translation\" lang=\"fa\"><span class=\"tlid-translation translation\" lang=\"fa\">ارائه می دهد </span>. ایده آل برای بارهای کاری سنگین است. HP SmartMemory با سرعت حداکثر 1866 مگاهرتز، ضمن بهبود عملکرد حجم کار و بهره وری از انرژی، با مدیریت خطای پیشرفته، از از دست رفتن داده ها و از کار افتادن آنها جلوگیری می کند. GPU پشتیبانی را برای به حداکثر رساندن عملکرد محاسبه می کند. HP SmartCache، یک راهکار حافظه پنهان مبتنی بر کنترل کننده، داده های داغ را روی حافظه SSD با تأخیر کم تر ذخیره می کند و عملکرد 4 برابر بار کاری بهتر را فراهم می کند.</span></p>\r\n<p><span class=\"tlid-translation translation\" lang=\"fa\"><br /> با مدیریت و پشتیبانی آسان و یکپارچه HP پتانسیل زیرساخت خود را باز کنید<br /> HP iLO Management Engine مجموعه کاملی از ویژگی های جاسازی شده استاندارد در همه سرورهای ProLiant Gen8 است. Embedded Remote Support با پشتیبانی از راه دور HP امکان نظارت از راه دور 24X7 و در هر مکان و در هر زمان دسترسی شخصی به IT و وضعیت پشتیبانی شما را فراهم می کند. HP Smart Update ، از جمله HP SUM ،SPP و سایر محصولات، با به روزرسانی سیستماتیک و ایمن زیرساخت سرور در مرکز داده، زمان استقرار و پیچیدگی به روزرسانی را کاهش می دهد. در بیشتر موارد زمان خرابی فقط به یک راه اندازی مجدد محدود می شود.</span></p>\r\n<p><span class=\"tlid-translation translation\" lang=\"fa\"><br /> بهره وری انرژی به واسطه طراحی<br /> منابع تغذیه مشترک اسلات HP با کارآیی 80 PLUS Titanium (96٪) و بازده انرژی جدید زیرساختی با ولتاژ ورودی 277VAC و 380VDC سطح جدیدی از کارایی را ارائه می دهند. اولین بار در صنعت شامل آرایه سه بعدی سنسورهای دمایی است که به شما کمک می کند فن های سرور را دقیقاً کنترل کنید تا خنک کننده را هدایت کرده و از انرژی فن غیرضروری بکاهید و در هزینه های خنک سازی صرفه جویی کنید. پیکربندی های سرور واجد شرایط ENERGY STAR تعهد مستمر HP را برای کمک به مشتریان در صرفه جویی در مصرف انرژی و صرفه جویی در هزینه نشان می دهد.</span></p>\r\n<p><span class=\"tlid-translation translation\" lang=\"fa\"><br /> تعریف مجدد تجربه مشتری با HP ProActive Insight Architecture<br /> ویژگی های طراحی الهام گرفته شده از کاربر که از اتلاف داده جلوگیری می کند، زمان خرابی را کاهش می دهد و قابلیت سرویس دهی را بهبود می بخشد شامل HP SmartDrives، راهنماهای سوکت هوشمند HP، گزینه های کیت ریلی \"نصب آسان\" و دسترسی بدون ابزار به اجزا است. یکپارچه سازی چرخه عمر اتوماتیک با تهیه ساده، نظارت و هشدار فعال، و سیستم عامل خودکار و نگهداری نرم افزار سیستم، دستیابی به موفقیت در مدیریت زیرساخت همگرا را فراهم می کند. Dynamic Work Up Acceleration همزمان با ذخیره ، محاسبه و ورودی و خروجی را به عملکرد شارژ توربو و انعطاف پذیری همگرا می کند. بهینه سازی خودکار انرژی، فضا ، نیرو و منابع خنک کننده مورد نیاز برای بارهای کاری را بازیابی می کند و خطاهای پرهزینه ناشی از فعالیت های دستی در مرکز داده را برطرف می کند. HP Proactive Insight Experience با بهره گیری از یک تجربه پشتیبانی فعال ، شخصی و ساده ، عملکرد برتر صنعت ، به روز بودن و بهره وری را قادر می سازد.</span></p>', 240000000, NULL, NULL, 'سرور-باندل-رکمونت-DL380p-Gen8-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:24', NULL, NULL, NULL, NULL),
(3, 10, 0, 'سرور باندل رکمونت DL380 Gen9 HP-E5-2620v4', 'HPE ProLiant DL380 Gen9 E5-2620v4 1P 16GB-R P440ar 8SFF 500W PS Server', NULL, NULL, NULL, 'خرید و بهترین قیمت سرور باندل رکمونت DL380 Gen9 HP-E5-2620v4 | یوزدکالا | بهترین قیمت انواع سرور دست دوم | یوزد کالا', 'خرید و بهترین قیمت سرور باندل رکمونت DL380 Gen9 HP-E5-2620v4 | یوزدکالا', NULL, '<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\">توضیحات محصول<br />سرور پایه HP Proliant DL380 Gen9 E5-2620v4 1P 16GB-R P440ar 8SFF 500W PS<br /></span></p>\r\n<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\">حافظه نهان<br />حافظه پنهان برای هر پردازنده: 20 مگابایت<br />حجم نصب شده: حافظه پنهان L3 - 20 مگابایت<br /></span></p>\r\n<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\">گسترش / اتصال<br />Bays: 8 (در کل) / 8 (رایگان) x hot swap 2.5 \"SFF<br />رابط ها: 4 x LAN (گیگابیت اترنت) - RJ-45 &brvbar; 1 x HP iLO - RJ-45 &brvbar; 1 x VGA &brvbar; 5 x USB 3.0 (1 جلو ، 2 عقب ، 2 داخلی)<br />شکافها: 2 (کل) / 1 (رایگان) x CPU &brvbar; 24 (کل) / 23 (رایگان) x DIMM 288 پین &brvbar; 2 (کل) / 2 (رایگان) x PCIe 3.0 x16 - نیم طول ، تمام قد (حالت x8) &brvbar; 1 (کل) / 1 (رایگان) x PCIe 3.0 x8 - نیم طول ، تمام قد &brvbar; 1 (کل) / 1 (رایگان) x کارت microSD (داخلی)<br /></span></p>\r\n<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\">عمومی<br />Embedded Security: تراشه امنیتی ماژول بستر های نرم افزاری قابل اعتماد (TPM 1.2)<br />تعداد خلیجهای Hot-Swap: 8<br />محلی سازی: منطقه: در سراسر جهان (به استثنای چین ، ژاپن)<br />فاکتور فرم محصول: قابل نصب بر روی رک - 2U<br />مقیاس پذیری سرور: دو طرفه<br />نوع: سرور<br />کنترل کننده گرافیک<br />پردازنده گرافیک: Matrox G200eH2<br />رابط های ویدئویی: VGA<br />هارد دیسک<br />نوع: بدون HDD<br /></span></p>\r\n<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\">متفرقه<br />استانداردهای سازگار: ACPI 2.0b ، FCC کلاس A دارای گواهی ، EN 61000-3-2 ، EN55022 ، ICES-003 ، EN 61000-3-3 ، EN55024 ، CISPR 22 ، FCC CFR47 قسمت 15 ، IEC 60950-1 ، EN 60950- 1 ، WEEE ، GB 9254 ، CNS 13438<br />لوازم جانبی شامل: نصب آسان ریل HP<br /></span></p>\r\n<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\">مانیتور کنید<br />نوع مانیتور: هیچ کدام<br /></span></p>\r\n<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\">شبکه سازی<br />استانداردهای سازگار: IEEE 802.3 ، IEEE 802.3u ، IEEE 802.3ab<br />پروتکل پیوند داده: اترنت ، اترنت سریع ، اترنت گیگابیتی<br />کنترل کننده اترنت: HP 331FLR<br />بنادر اترنت: 4 x گیگابایت اترنت<br />ویژگی ها: Wake on LAN (WoL) ، پشتیبانی از PXE<br />رابط (گذرگاه) نوع: PCI Express x2<br />کنترل از راه دور از راه دور: چراغ های مجتمع خاموش 4<br /></span></p>\r\n<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\">سیستم عامل / نرم افزار<br />دارای گواهینامه سیستم عامل: SUSE Linux Enterprise Server، Microsoft Windows Server، Red Hat Enterprise Linux، Oracl<br />ذخیره سازی نوری<br />نوع: بدون درایو نوری</span></p>\r\n<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\"><br />قدرت<br />صدور گواهینامه 80 PLUS: 80 PLUS Platinum<br />نوع دستگاه: منبع تغذیه - گرم پلاگین<br />کارایی: 94٪<br />ولتاژ اسمی: AC 120/230 ولت<br />برق تأمین شده: 500 وات<br />پردازنده / چیپ ست<br />پردازنده: Intel Xeon E5-2620V4 / 2.1 GHz<br />تعداد پردازنده: 1<br />قابلیت ارتقا CPU: قابل ارتقا<br />حداکثر تعداد پردازنده: 2<br />حداکثر سرعت توربو: 3 گیگاهرتز<br />تعداد هسته ها: 8 هسته ای<br />ویژگی های اصلی پردازنده: فناوری Hyper-Threading ، Intel Turbo Boost Technology 2</span></p>\r\n<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\"><br />رم<br />ویژگی های پیکربندی: 1 16 16 گیگابایت<br />سرعت حافظه موثر: 2133 مگاهرتز<br />ویژگی ها: ثبت شده ، حافظه یدکی آنلاین ، معماری حافظه چهار کانال ، HP SmartMemory<br />فاکتور فرم: DIMM 288 پین<br />اندازه نصب شده: 16 GB / 768 GB (حداکثر)<br />انطباق مشخصات حافظه: PC4-19200<br />RAM پشتیبانی شده: PC4-19200 - 768 گیگابایت ثبت شده - پیشرفته ECC &brvbar; PC4-19200 - 3 ترابایت کاهش بار - پیشرفته ECC &brvbar; 128 گیگابایت غیر فرار - پیشرفته ECC<br />سرعت حافظه دارای رتبه: 2400 مگاهرتز<br />شکافها: 24 (کل) / 23 (خالی)<br />فناوری: DDR4 SDRAM - ECC پیشرفته<br />کنترل کننده ذخیره سازی<br />حجم بافر: 2 گیگابایت<br />تعداد کانال: 8<br />نوع رابط کنترل کننده: SATA 6Gb / s / SAS 12Gb / s<br />سطح RAID: RAID 0 ، RAID 1 ، RAID 5 ، RAID 6 ، RAID 10 ، RAID 50 ، RAID 60 ، RAID 1 ADM ، RAID 10 ADM<br />نام کنترل کننده ذخیره سازی: Smart Array P440ar با 2 گیگابایت FBWC<br />نوع: 1 x RAID - PCIe 3.0 x8</span></p>', 450000000, NULL, NULL, 'سرور-باندل-رکمونت-DL380-Gen9-HP-E5-2620v4', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:25', NULL, NULL, NULL, NULL),
(4, 12, 0, 'سی پی یو E5620', 'Intel® Xeon® E5620 (2.40GHz/4-core/12MB/80W) ', NULL, NULL, NULL, 'خرید و بهترین قیمت سی پی یو سرور E5620 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5620 اینتل Intel | یوزدکالا', NULL, '<p><span class=\"tlid-translation translation\" lang=\"fa\"><span class=\"\" title=\"\">توضیحات محصول</span> <span class=\"\" title=\"\">پردازنده Intel Xeon E5620 (2.40GHz / 4-core / 12MB / 80W)</span><br /><strong><span class=\"\" title=\"\">حافظه نهان</span></strong><br /><span title=\"\">حجم نصب شده: 12 مگابایت</span><br /><strong><span title=\"\">اطلاعات سازگاری</span></strong><br /><span title=\"\">طراحی شده برای: HPE ProLiant DL360 G7، DL360 G7 Base، DL360 G7 Entry، DL360 G7 Performance، DL360 G7 Server ویژه</span><br /><strong><span title=\"\">گسترش / اتصال</span></strong><br /><span title=\"\">اسلات های سازگار: 1 عدد پردازنده</span><br /><strong><span title=\"\">عمومی</span></strong><br /><span title=\"\">نوع محصول: پردازنده</span><br /><strong><span title=\"\">پردازنده</span></strong><br /><span title=\"\">محاسبات 64 بیتی: بله</span><br /><span title=\"\">ویژگی های معماری: فناوری Hyper-Threading ، Intel Turbo Boost Technology</span><br /><span title=\"\">حافظه پنهان: 12 مگابایت</span><br /><span title=\"\">جزئیات حافظه پنهان: حافظه پنهان هوشمند - 12 مگابایت</span><br /><span title=\"\">سرعت ساعت: 2.4 گیگاهرتز</span><br /><span title=\"\">فرایند ساخت: 32 نانومتر</span><br /><span title=\"\">حداکثر سرعت توربو: 2.66 گیگاهرتز</span><br /><span title=\"\">تعداد هسته ها: چهار هسته ای</span><br /><span title=\"\">تعداد نخ ها: 8 موضوع</span><br /><span title=\"\">تعداد پردازنده: 1</span><br /><span title=\"\">قدرت طراحی حرارتی: 80 وات</span><br /><span title=\"\">نوع / عامل عامل: Intel Xeon E5620</span></span></p>', 2000000, NULL, NULL, 'سی-پی-یو-E5620', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:25', NULL, NULL, NULL, NULL),
(5, 12, 0, 'سی پی یو E5-2640', 'Intel® Xeon® E5-2640 (2.5GHz/6-core/15MB/7.2GT-s QPI/95W, DDR3-1333, HT, Turbo2- 3/3/4/4/5/5)', NULL, NULL, NULL, 'خرید و بهترین قیمت سی پی یو سرور E5-2640 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5-2640 اینتل Intel | یوزدکالا', NULL, '<p><span class=\"tlid-translation translation\" lang=\"fa\"><span title=\"\">توضیحات محصول:</span><br /><span title=\"\">تولید کننده پردازنده: Intel</span><br /></span><span class=\"tlid-translation translation\" lang=\"fa\"><span title=\"\"><span class=\"tlid-translation translation\" lang=\"fa\"><span title=\"\">مدل </span></span>پردازنده: Intel Xeon</span><br /><span title=\"\">سرعت پردازنده: 3 گیگاهرتز</span><br /><span title=\"\">سوکت پردازنده: LGA 2011</span><br /><span title=\"\">سرعت ساعت: 2.5 گیگاهرتز</span><br /> <span title=\"\">فرکانس حداکثر توربو: 3 گیگاهرتز</span><br /> <span title=\"\">Intel QPI Speed:؟ 7.2 GT / s</span><br /> <span title=\"\">سوکت: LGA2011</span><br /> <span class=\"\" title=\"\">پهنای باند حداکثر حافظه: 42.6 گیگابایت بر ثانیه</span></span></p>', 25000000, NULL, NULL, 'سی-پی-یو-E5-2640', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:25', NULL, NULL, NULL, NULL),
(6, 12, 0, 'سی پی یو E5-2650 v2', 'Intel® Xeon® E5-2650 v2 (2.6GHz/8-core/20MB/8.0GT-s QPI/95W, DDR3-1866, HT, Turbo2- 4/4/4/4/5/6/7/8)', NULL, NULL, NULL, 'خرید و بهترین قیمت سی پی یو سرور E5-2650 v2 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا\r\n', 'خرید و بهترین قیمت سی پی یو سرور E5-2650 v2 اینتل Intel | یوزدکالا', NULL, '<ul class=\"specs-list\">\r\n<li dir=\"ltr\"><span class=\"label\"> Product Collection </span> <span class=\"value\" data-key=\"ProductGroup\"> Intel&reg; Xeon&reg; Processor E5 v2 Family </span></li>\r\n<li dir=\"ltr\"><span class=\"label\"> Code Name </span> <span class=\"value\" data-key=\"CodeNameText\"> Products formerly Ivy Bridge EP </span></li>\r\n<li dir=\"ltr\"><span class=\"label\"> Vertical Segment</span> <span class=\"value\" data-key=\"MarketSegment\"> Server</span></li>\r\n<li dir=\"ltr\"><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-ProcessorNumber\">Processor Number</a> </span> <span class=\"value\" data-key=\"ProcessorNumber\"> E5-2650V2</span></li>\r\n<li dir=\"ltr\"><span class=\"label\"> Status</span> <span class=\"value\" data-key=\"StatusCodeText\"> Launched</span></li>\r\n<li dir=\"ltr\"><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-BornOnDate\">Launch Date</a> </span> <span class=\"value\" data-key=\"BornOnDate\"> Q3\'13</span></li>\r\n<li dir=\"ltr\"><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-Lithography\">Lithography</a> </span> <span class=\"value\" data-key=\"Lithography\"> 22 nm</span></li>\r\n<li dir=\"ltr\"><span class=\"label\"> <a class=\"view-modal info-modal\" data-modal=\"tt-recommendedCustomerPrice\">Recommended Customer Price</a></span><span class=\"value\">$1166.00 - $1171.00</span></li>\r\n</ul>\r\n<section id=\"tab-blade-1-0-1\" class=\"blade specs-blade specifications\" dir=\"ltr\">\r\n<div id=\"bladeInside\" class=\"blade-inside\">\r\n<div class=\"subhead\">\r\n<h2 class=\"h2\">CPU Specifications</h2>\r\n</div>\r\n<ul class=\"specs-list\">\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-CoreCount\"># of Cores</a> </span> <span class=\"value\" data-key=\"CoreCount\"> 8</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-ThreadCount\"># of Threads</a> </span> <span class=\"value\" data-key=\"ThreadCount\"> 16</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-ClockSpeed\">Processor Base Frequency</a> </span> <span class=\"value\" data-key=\"ClockSpeed\"> 2.60 GHz</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-ClockSpeedMax\">Max Turbo Frequency</a> </span> <span class=\"value\" data-key=\"ClockSpeedMax\"> 3.40 GHz</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-Cache\">Cache</a> </span> <span class=\"value\" data-key=\"Cache\"> 20 MB Intel&reg; Smart Cache</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-Bus\">Bus Speed</a> </span> <span class=\"value\" data-key=\"Bus\"> 8 GT/s</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-BusNumPorts\"># of QPI Links</a> </span> <span class=\"value\" data-key=\"BusNumPorts\"> 2</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-TurboBoostTech2MaxFreq\">Intel&reg; Turbo Boost Technology 2.0 Frequency<small><sup>&Dagger;</sup></small></a> </span> <span class=\"value\" data-key=\"TurboBoostTech2MaxFreq\"> 3.40 GHz</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-MaxTDP\">TDP</a> </span> <span class=\"value\" data-key=\"MaxTDP\"> 95 W</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-CoreVoltage\">VID Voltage Range</a> </span> <span class=\"value\" data-key=\"CoreVoltage\"> 0.65&ndash;1.30V</span></li>\r\n</ul>\r\n</div>\r\n</section>\r\n<section id=\"tab-blade-1-0-2\" class=\"blade specs-blade specifications\" dir=\"ltr\">\r\n<div id=\"bladeInside\" class=\"blade-inside\">\r\n<div class=\"subhead\">\r\n<h2 class=\"h2\">Supplemental Information</h2>\r\n</div>\r\n<ul class=\"specs-list\">\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-Embedded\">Embedded Options Available</a> </span> <span class=\"value\" data-key=\"Embedded\"> No</span></li>\r\n<li><span class=\"label\"> Datasheet</span> <span class=\"value\"> <a class=\"ark-accessible-color hrefcolor\" href=\"http://www.intel.com/content/www/us/en/processors/xeon/xeon-technical-resources.html\">View now</a> </span></li>\r\n<li><span class=\"label\"> Additional Information URL</span> <span class=\"value\"> <a class=\"ark-accessible-color hrefcolor\" href=\"http://www.intel.com/content/www/us/en/processors/xeon/xeon-e5-v2-datasheet-vol-2.html\">View now</a> </span></li>\r\n</ul>\r\n</div>\r\n</section>\r\n<section id=\"tab-blade-1-0-3\" class=\"blade specs-blade specifications\" dir=\"ltr\">\r\n<div id=\"bladeInside\" class=\"blade-inside\">\r\n<div class=\"subhead\">\r\n<h2 class=\"h2\">Memory Specifications</h2>\r\n</div>\r\n<ul class=\"specs-list\">\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-MaxMem\">Max Memory Size (dependent on memory type)</a> </span> <span class=\"value\" data-key=\"MaxMem\"> 768 GB</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-MemoryTypes\">Memory Types</a> </span> <span class=\"value\" data-key=\"MemoryTypes\"> DDR3 800/1066/1333/1600/1866</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-NumMemoryChannels\">Max # of Memory Channels</a> </span> <span class=\"value\" data-key=\"NumMemoryChannels\"> 4</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-MaxMemoryBandwidth\">Max Memory Bandwidth</a> </span> <span class=\"value\" data-key=\"MaxMemoryBandwidth\"> 59.7 GB/s</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-PhysicalAddressExtension\">Physical Address Extensions</a> </span> <span class=\"value\" data-key=\"PhysicalAddressExtension\"> 46-bit</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-ECCMemory\">ECC Memory Supported <small><sup>&Dagger;</sup></small></a> </span> <span class=\"value\" data-key=\"ECCMemory\"> Yes</span></li>\r\n</ul>\r\n</div>\r\n</section>\r\n<section id=\"tab-blade-1-0-4\" class=\"blade specs-blade specifications\" dir=\"ltr\">\r\n<div id=\"bladeInside\" class=\"blade-inside\">\r\n<div class=\"subhead\">\r\n<h2 class=\"h2\">Expansion Options</h2>\r\n</div>\r\n<ul class=\"specs-list\">\r\n<li><span class=\"label\"> Scalability</span> <span class=\"value\" data-key=\"ScalableSockets\"> 2S Only</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-PCIExpressRevision\">PCI Express Revision</a> </span> <span class=\"value\" data-key=\"PCIExpressRevision\"> 3.0</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-PCIExpressConfigs\">PCI Express Configurations <small><sup>&Dagger;</sup></small></a> </span> <span class=\"value\" data-key=\"PCIExpressConfigs\"> x4, x8, x16</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-NumPCIExpressPorts\">Max # of PCI Express Lanes</a> </span> <span class=\"value\" data-key=\"NumPCIExpressPorts\"> 40</span></li>\r\n</ul>\r\n</div>\r\n</section>\r\n<section id=\"tab-blade-1-0-5\" class=\"blade specs-blade specifications\" dir=\"ltr\">\r\n<div id=\"bladeInside\" class=\"blade-inside\">\r\n<div class=\"subhead\">\r\n<h2 class=\"h2\">Package Specifications</h2>\r\n</div>\r\n<ul class=\"specs-list\">\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-SocketsSupported\">Sockets Supported</a> </span> <span class=\"value\" data-key=\"SocketsSupported\"> FCLGA2011</span></li>\r\n<li><span class=\"label\"> Max CPU Configuration</span> <span class=\"value\" data-key=\"MaxCPUs\"> 2</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-TCase\">T<sub>CASE</sub></a> </span> <span class=\"value\" data-key=\"TCase\"> 75&deg;C</span></li>\r\n<li><span class=\"label\"> Package Size</span> <span class=\"value\" data-key=\"PackageSize\"> 52.5mm x 51mm</span></li>\r\n</ul>\r\n</div>\r\n</section>\r\n<section id=\"tab-blade-1-0-6\" class=\"blade specs-blade specifications\" dir=\"ltr\">\r\n<div id=\"bladeInside\" class=\"blade-inside\">\r\n<div class=\"subhead\">\r\n<h2 class=\"h2\">Advanced Technologies</h2>\r\n</div>\r\n<ul class=\"specs-list\">\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-TBTVersion\">Intel&reg; Turbo Boost Technology <small><sup>&Dagger;</sup></small></a> </span> <span class=\"value\" data-key=\"TBTVersion\"> 2.0</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-VProTechnology\">Intel vPro&reg; Platform Eligibility <small><sup>&Dagger;</sup></small></a> </span> <span class=\"value\" data-key=\"VProTechnology\"> Yes</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-HyperThreading\">Intel&reg; Hyper-Threading Technology <small><sup>&Dagger;</sup></small></a> </span> <span class=\"value\" data-key=\"HyperThreading\"> Yes</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-VTX\">Intel&reg; Virtualization Technology (VT-x) <small><sup>&Dagger;</sup></small></a> </span> <span class=\"value\" data-key=\"VTX\"> Yes</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-VTD\">Intel&reg; Virtualization Technology for Directed I/O (VT-d) <small><sup>&Dagger;</sup></small></a> </span> <span class=\"value\" data-key=\"VTD\"> Yes</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-ExtendedPageTables\">Intel&reg; VT-x with Extended Page Tables (EPT) <small><sup>&Dagger;</sup></small></a> </span> <span class=\"value\" data-key=\"ExtendedPageTables\"> Yes</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-TransactionalSynchronizationExtensionVersion\">Intel&reg; Transactional Synchronization Extensions</a> </span> <span class=\"value\" data-key=\"TransactionalSynchronizationExtensionVersion\"> No</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-EM64\">Intel&reg; 64 <small><sup>&Dagger;</sup></small></a> </span> <span class=\"value\" data-key=\"EM64\"> Yes</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-InstructionSet\">Instruction Set</a> </span> <span class=\"value\" data-key=\"InstructionSet\"> 64-bit</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-InstructionSetExtensions\">Instruction Set Extensions</a> </span> <span class=\"value\" data-key=\"InstructionSetExtensions\"> Intel&reg; AVX</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-HaltState\">Idle States</a> </span> <span class=\"value\" data-key=\"HaltState\"> Yes</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-SpeedstepTechnology\">Enhanced Intel SpeedStep&reg; Technology</a> </span> <span class=\"value\" data-key=\"SpeedstepTechnology\"> Yes</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-DemandBasedSwitching\">Intel&reg; Demand Based Switching</a> </span> <span class=\"value\" data-key=\"DemandBasedSwitching\"> Yes</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-ThermalMonitoring2Indicator\">Thermal Monitoring Technologies</a> </span> <span class=\"value\" data-key=\"ThermalMonitoring2Indicator\"> Yes</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-FlexMemoryTechnology\">Intel&reg; Flex Memory Access</a> </span> <span class=\"value\" data-key=\"FlexMemoryTechnology\"> No</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-IdentityProtectionTechVersion\">Intel&reg; Identity Protection Technology <small><sup>&Dagger;</sup></small></a> </span> <span class=\"value\" data-key=\"IdentityProtectionTechVersion\"> No</span></li>\r\n</ul>\r\n</div>\r\n</section>\r\n<div class=\"subhead\" dir=\"ltr\">\r\n<h2 class=\"h2\">Security &amp; Reliability</h2>\r\n</div>\r\n<ul class=\"specs-list\" dir=\"ltr\">\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-AESTech\">Intel&reg; AES New Instructions</a> </span> <span class=\"value\" data-key=\"AESTech\"> Yes</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-SecureKeyTechVersion\">Secure Key</a> </span> <span class=\"value\" data-key=\"SecureKeyTechVersion\"> Yes</span></li>\r\n<li><span class=\"label\"> Intel&reg; OS Guard</span> <span class=\"value\" data-key=\"OSGuardTechVersion\"> Yes</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-TXT\">Intel&reg; Trusted Execution Technology <small><sup>&Dagger;</sup></small></a> </span> <span class=\"value\" data-key=\"TXT\"> Yes</span></li>\r\n<li><span class=\"label\"> <a class=\"view-modal info-modal ark-accessible-color\" data-modal=\"tt-ExecuteDisable\">Execute Disable Bit <small><sup>&Dagger;</sup></small></a> </span> <span class=\"value\" data-key=\"ExecuteDisable\"> Yes</span></li>\r\n</ul>', 40000000, NULL, NULL, 'سی-پی-یو-E5-2650-v2', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:25', NULL, NULL, NULL, NULL),
(7, NULL, 0, 'Heatsink & fan DL380 G7', '', NULL, NULL, NULL, 'Heatsink & fan DL380 G7', 'Heatsink & fan DL380 G7', NULL, '<p class=\"product-name\" data-spm-anchor-id=\"2114.12057483.0.i0.adc93d33HxWoAi\">CPU Cooler Server CPU Processor Fan and HEATSINK DL380 G6 G7 Upgrade Kit Heatsink 507661-001 496064-001 496066-001 463172-001</p>\r\n<p class=\"product-name\" data-spm-anchor-id=\"2114.12057483.0.i0.adc93d33HxWoAi\"><span class=\"tlid-translation translation\" lang=\"fa\"><span class=\"\" title=\"\">ما سه بسته برای انتخاب شما داریم:</span></span></p>\r\n<p class=\"product-name\" data-spm-anchor-id=\"2114.12057483.0.i0.adc93d33HxWoAi\"><span class=\"tlid-translation translation\" lang=\"fa\"><span class=\"\" title=\"\">1 496064-001 heatsink*1<br /><br />2 496066-001 fan*1<br /><br />3 496064-001 heatsink*1+ 496066-001 fan*2</span></span></p>', 3000000, NULL, NULL, 'Heatsink--fan-DL380-G7', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:25', NULL, NULL, NULL, NULL),
(8, NULL, 0, 'Heatsink & fan DL380 G8', '', NULL, NULL, NULL, 'Heatsink & fan DL380 G8', 'Heatsink & fan DL380 G8', NULL, '<p><span class=\"tlid-translation translation\" lang=\"fa\"><span class=\"\" title=\"\">شما پیشنهاد خرید کیت CPU HP DL380e G8 / GEN8 ، Heatsink 663673-001 / 677090-001 ، Fan 654577-001 را دارید.</span> <span title=\"\">از سیستم کشیده شده است.</span> <span title=\"\">تمیز در شرایط خوب</span> <span title=\"\">حمل و نقل به سراسر جهان.</span><br /><br /><span title=\"\">مورد شامل:</span></span></p>\r\n<ul style=\"text-size-adjust: auto;\">\r\n<li><span style=\"font-family: Verdana;\">HP DL380e G8 Gen8 CPU Kit, including 1 x Heatsink &amp; 1 x Hot-Plug Fans</span>\r\n<ul>\r\n<li>1 x Heatsink, PN: 663673-001 or 677090-001</li>\r\n<li>1 x Hot-Plug Fans, PN: 654577-001</li>\r\n</ul>\r\n</li>\r\n</ul>', 8000000, NULL, NULL, 'Heatsink--fan-DL380-G8', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:25', NULL, NULL, NULL, NULL),
(9, NULL, 0, 'Heatsink & fan DL380 G9', '', NULL, NULL, NULL, 'Heatsink & fan DL380 G9', 'Heatsink & fan DL380 G9', NULL, '<div id=\"vi-frag-btfcontainer-w1\" class=\"app-itemspecifics-mobile-wrapper\">\r\n<div class=\"row\">\r\n<div id=\"vi-frag-btfcontainer-w1-w0\" class=\"ui-component-map-wrapper cc-stdmargin__top  cc-stdmargin__top \" data-w-body=\"0\">\r\n<div class=\"row\">\r\n<div class=\"wrappingDiv\">Condition: <span class=\" \">New</span></div>\r\n</div>\r\n</div>\r\n<div id=\"vi-frag-btfcontainer-w1-w1\" class=\"ui-component-map-wrapper cc-stdmargin__top  cc-stdmargin__top \" data-w-body=\"0\">\r\n<div class=\"row\">\r\n<div class=\"wrappingDiv\">Quantity: <span class=\" \">10 available</span></div>\r\n</div>\r\n</div>\r\n<div id=\"vi-frag-btfcontainer-w1-w2\" class=\"ui-component-map-wrapper cc-stdmargin__top  cc-stdmargin__top \" data-w-body=\"0\">\r\n<div class=\"row\">\r\n<div class=\"wrappingDiv\">Type: <span class=\" \">Heatsink</span></div>\r\n</div>\r\n</div>\r\n<div id=\"vi-frag-btfcontainer-w1-w3\" class=\"ui-component-map-wrapper cc-stdmargin__top  cc-stdmargin__top \" data-w-body=\"0\">\r\n<div class=\"row\">\r\n<div class=\"wrappingDiv\">MPN: <span class=\" \">775403-001 734042-001<br /></span></div>\r\n</div>\r\n</div>\r\n<div id=\"vi-frag-btfcontainer-w1-w4\" class=\"ui-component-map-wrapper cc-stdmargin__top  cc-stdmargin__top \" data-w-body=\"0\">\r\n<div class=\"row\">\r\n<div class=\"wrappingDiv\">Brand: <span class=\" \">HP</span></div>\r\n</div>\r\n</div>\r\n<div id=\"vi-frag-btfcontainer-w1-w5\" class=\"ui-component-map-wrapper cc-stdmargin__top  cc-stdmargin__top \" data-w-body=\"0\">\r\n<div class=\"row\">\r\n<div class=\"wrappingDiv\">Model: <span class=\" \">HP ProLiant DL360 G9</span></div>\r\n</div>\r\n</div>\r\n<div id=\"vi-frag-btfcontainer-w1-w6\" class=\"ui-component-map-wrapper cc-stdmargin__top  cc-stdmargin__top \" data-w-body=\"0\">\r\n<div class=\"row\">\r\n<div class=\"wrappingDiv\">UPC: <span class=\" \">894586237550</span></div>\r\n</div>\r\n</div>\r\n</div>\r\n</div>', 25000000, NULL, NULL, 'Heatsink--fan-DL380-G9', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:25', NULL, NULL, NULL, NULL),
(10, 14, 0, 'رم سرور PC3-14900R اچ پی HP ', 'HP 8GB (1x8GB) Dual Rank x4 PC3-14900R (DDR3-1866)', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور PC3-14900R اچ پی HP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور PC3-14900R اچ پی HP | یوزدکالا', NULL, '<p class=\"desc desc-short\">HP 708639-B21 HP 8GB 2Rx4 PC3-14900R-13 Kit</p>', 7000000, NULL, NULL, 'رم-سرور-PC3-14900R-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:25', NULL, NULL, NULL, NULL),
(11, 14, 0, 'هارد سرور 300GB 6G SAS 10K اچ پی HP ', 'HP 300GB 6G SAS 10K SFF DP ENT HDD', NULL, NULL, NULL, 'خرید و بهترین قیمت هارد سرور 300GB 6G SAS 10K اچ پی HP | مناسبترین قیمت انواع هارد سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت هارد سرور 300GB 6G SAS 10K اچ پی HP | یوزدکالا', NULL, '<div class=\"product-primary-properties-outer\">\r\n<ul class=\"clearfix list-unstyled product-primary-properties promoted-primary-properties-has-many\">\r\n<li>\r\n<div class=\"product-tile-primary-propertie-title\">HDD capacity</div>\r\n<div class=\"product-tile-primary-propertie-value\">300 GB</div>\r\n</li>\r\n<li>\r\n<div class=\"product-tile-primary-propertie-title\">Hard drive speed</div>\r\n<div class=\"product-tile-primary-propertie-value\">10000 RPM</div>\r\n</li>\r\n<li>\r\n<div class=\"product-tile-primary-propertie-title\">Hard drive size</div>\r\n<div class=\"product-tile-primary-propertie-value\">2.5\"</div>\r\n</li>\r\n</ul>\r\n</div>', 8000000, NULL, NULL, 'هارد-سرور-300GB-6G-SAS-10K-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:25', NULL, NULL, NULL, NULL),
(12, 14, 0, 'هارد سرور 900GB 6G SAS 10K اچ پی HP ', 'HP 900GB 6G SAS 10K rpm SFF (2.5-inch) Dual Port Enterprise', NULL, NULL, NULL, 'خرید و بهترین قیمت هارد سرور 900GB 6G SAS 10K اچ پی HP | مناسبترین قیمت انواع هارد سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت هارد سرور 900GB 6G SAS 10K اچ پی HP | یوزدکالا', NULL, '<p>مناسب برای سرورهای: HPE D2700, P2000 G3, SB40c storage blade &brvbar; HPE Integrity BL860c i2 (2.5\"), BL860c i2 Base (2.5\"), BL860c i4 (2.5\"), BL870c i2 (2.5\"), BL890c i2 (2.5\"), BL890c i2 Base (2.5\") &brvbar; HPE Modular Smart Array 1040 Dual Controller SFF Storage, P2000 G3 FC MSA Dual Controller Virtualization SAN Starter Kit, P2000 G3 SAS Dual Controller SFF Array &brvbar; HPE ProLiant BL460c G7 (2.5\"), BL465c G7 (2.5\"), BL620C G7 (2.5\"), BL680c G7 (2.5\"), BL685c G7 (2.5\"), DL120 G7 (2.5\"), DL165 G7 Performance (2.5\"), DL360 G7 Central Management Server (2.5\"), DL360 G7 Efficiency (2.5\"), DL360 G7 Special Server (2.5\"), DL370 G6 High Performance (2.5\"), DL370 G6 Special Server (2.5\"), DL380 G7 Efficiency (2.5\"), DL380 G7 Special Server (2.5\"), DL385 G7 HE (2.5\"), DL385 G7 Performance (2.5\"), DL580 G7 (2.5\"), DL580 G7 Base (2.5\"), DL580 G7 High Performance (2.5\"), DL585 G7 (2.5\"), DL585 G7 Base (2.5\"), DL585 G7 Performance (2.5\"), DL980 G7 (2.5\"), ML110 G7 Base (2.5\"), ML110 G7 Entry (2.5\"), ML370 G6 Special Server (2.5\"), SL390s G7 (2.5\"), SL390s G7 1U Left Half Width tray (2.5\"), SL390s G7 1U Left Tray Node Server (2.5\"), SL390s G7 1U Right Half Width tray (2.5\"), SL390s G7 1U Right Tray Node Server (2.5\"), SL390s G7 4U Left Half Width tray (2.5\"), SL390s G7 4U Right Half Width tray (2.5\"), SL390s G7 Base 1U left Half Width tray (2.5\"), SL390s G7 Base 1U Right Half Width tray (2.5\"), SL390s G7 Entry 1U Left Half Width tray (2.5\"), SL390s G7 Entry 1U Right Half Width tray (2.5\"), SL390s G7 Performance 1U left Half Width tray (2.5\"), SL390s G7 Performance 1U Right Half Width tray (2.5\"), WS460c G6 Graphics Expansion Blade (2.5\") &brvbar; HPE StorageWorks D2200sb PCIe Storage Blade &brvbar; HPE StorageWorks Modular Smart Array P2000 G3 SAS Dual Controller, P2000 G3 SAS Dual Controller SFF Array &brvbar; HPE StorageWorks Network Storage Blade X1800sb G2 &brvbar; HPE StorageWorks Network Storage Gateway X3800sb G2 &brvbar; HPE StorageWorks Network Storage System X1600 G2, X1800 G2</p>\r\n<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\"><span title=\"\">عمومی</span><br /><span title=\"\">بایت در هر بخش: 512</span><br /><span title=\"\">ظرفیت: 900 گیگابایت</span><br /><span title=\"\">عمق: 10 سانتی متر</span><br /><span title=\"\">نوع دستگاه: هارد دیسک - مبادله گرم</span><br /><span title=\"\">فاکتور فرم: 2.5 \"SFF</span><br /><span title=\"\">ارتفاع: 1.5 سانتی متر</span><br /><span title=\"\">رابط: SAS 6Gb / s</span><br /><span title=\"\">عرض: 7 سانتی متر</span><br /><span title=\"\">کارایی</span><br /><span title=\"\">نرخ انتقال درایو: 600 مگابایت بر ثانیه (خارجی)</span><br /><span title=\"\">زمان جستجو: 3.57 میلی ثانیه (متوسط) / 7.3 میلی ثانیه (حداکثر)</span><br /><span title=\"\">سرعت اسپیندل: 10000 دور در دقیقه</span><br /><span title=\"\">زمان جستجو برای پیگیری: 0.21 میلی ثانیه</span></span></p>', 30000000, NULL, NULL, 'هارد-سرور-900GB-6G-SAS-10K-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:25', NULL, NULL, NULL, NULL),
(13, 10, 0, 'هارد سرور 1.8TB SAS 10K اچ پی ای HPE', 'HPE 1.8TB SAS 10K SFF SC 512e DS HDD', NULL, NULL, NULL, 'خرید و بهترین قیمت هارد سرور 1.8TB SAS 10K اچ پی ای HPE | مناسبترین قیمت انواع هارد سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت هارد سرور 1.8TB SAS 10K اچ پی ای HPE | یوزدکالا', NULL, '<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\"><span class=\"\" title=\"\">ظرفیت ذخیره سازی: 1.8 ترابایت رابط: SAS</span><br /><span title=\"\">نام تجاری:</span> <span title=\"\">HPE</span><br /><span title=\"\">فاکتور فرم:&nbsp; </span></span><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\"><span title=\"\"><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\"><span title=\"\">SATA </span></span>2.5 inch</span><br /><span title=\"\">فاکتور فرم: 2.5 در MPN:</span><br /><span title=\"\">872481-B21</span><br /><span title=\"\">UPC:</span> <span title=\"\">صدق نمی کند</span></span></p>', 88000000, NULL, NULL, 'هارد-سرور-18TB-SAS-10K-اچ-پی-ای-HPE', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:26', NULL, NULL, NULL, NULL),
(14, 14, 0, 'پاور سرور 350W اچ پیHP', 'HP 350W Factory Integrated Power Supply Kit', NULL, NULL, NULL, 'خرید و بهترین قیمت پاور سرور 350W اچ پیHP | مناسبترین قیمت انواع پاور سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت پاور سرور 350W اچ پیHP | یوزدکالا', NULL, '<p><strong>Part Number</strong>:<br /><strong> 674838-B21Manufacturer</strong>:<br /><strong> HpWattage</strong>: 350<br /><strong> WattType</strong>: Micro Atx, Multi-Output<br /><strong> Fixed Power SupplyCompatibility</strong>: For Ml310E Gen8</p>', 3000000, NULL, NULL, 'پاور-سرور-350W-اچ-پیHP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:26', NULL, NULL, NULL, NULL),
(15, 14, 80, 'پاور سرور  460W Gold Ht Plg اچ پیHP', 'HP 460W CS Gold Ht Plg Pwr Supply Kit', 0, '', '', 'خرید و بهترین قیمت پاور سرور  460W Gold Ht Plg اچ پیHP | مناسبترین قیمت انواع پاور سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت پاور سرور  460W Gold Ht Plg اچ پیHP | یوزدکالا', '', '<p>منبع تغذیه HP AC - توان خروجی 460W: 460 سازگار با سبز: بله گواهینامه / مرجع انطباق با رنگ سبز: 80 پلاس گواهینامه / مرجع انطباق سبز: ENERGY STAR</p>\r\n', 3000000, 1, NULL, 'پاور-سرور--460W-Gold-Ht-Plg-اچ-پیHP', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:26', NULL, NULL, NULL, NULL),
(16, 14, 0, 'پاور سرور 500W FS Plat Ht اچ پیHP', 'HP 500W FS Plat Ht Plg Pwr Supply Kit', NULL, NULL, NULL, 'خرید و بهترین قیمت پاور سرور 500W FS Plat Ht اچ پیHP | مناسبترین قیمت انواع پاور سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت پاور سرور 500W FS Plat Ht اچ پیHP | یوزدکالا', NULL, '<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\"><span title=\"\">مارک: HP</span><br /><span title=\"\">توان خروجی: 750 وات</span><br /><span title=\"\">نوع محصول: انحصاری</span><br /><span title=\"\">وات: 500 وات</span><br /><span title=\"\">ابعاد: LxWxH 14.7 x 7.2 x 5.5 اینچ</span></span></p>', 8000000, NULL, NULL, 'پاور-سرور-500W-FS-Plat-Ht-اچ-پیHP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:26', NULL, NULL, NULL, NULL),
(17, 14, 0, 'کنترلر P400/512 BBWC اچ پی HP', 'HP Smart Array P400/512 BBWC Controller', NULL, NULL, NULL, 'خرید و بهترین قیمت کنترلر P400/512 BBWC اچ پی HP | مناسبترین قیمت انواع کنترلر در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کنترلر P400/512 BBWC اچ پی HP | یوزدکالا', NULL, '<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\"><span title=\"\">گسترش آرایه آنلاین</span><br /><span title=\"\">پسوند درایو منطقی آنلاین</span><br /><span title=\"\">مهاجرت آنلاین سطح RAID</span><br /><span title=\"\">کوچ اندازه نوار آنلاین</span><br /><span title=\"\">سازگاری داده ها</span><br /><span title=\"\">پیکربندی مداوم و ابزار مدیریت</span><br /><span title=\"\">هارد دیسک جهانی</span></span></p>', 1000500, NULL, NULL, 'کنترلر-P400512-BBWC-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:27', NULL, NULL, NULL, NULL),
(18, 14, 0, 'کنترلر P420/2GB FBWC اچ پی HP', 'HP Smart Array P420/2GB FBWC Controller', NULL, NULL, NULL, 'خرید و بهترین قیمت کنترلر P420/2GB FBWC اچ پی HP | مناسبترین قیمت انواع کنترلر در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کنترلر P420/2GB FBWC اچ پی HP | یوزدکالا', NULL, '<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\">نوع دستگاه کنترل کننده ذخیره سازی (RAID) - کارت پلاگین - مشخصات پایین<br />میزبان باس PCIe 3.0 x8<br />کنترل کننده ذخیره سازی<br />رابط SATA 6Gb / s / SAS 6Gb / s<br />نرخ انتقال داده 600 مگابایت در ثانیه<br />بافر اندازه 2 گیگابایت<br />دستگاه های پشتیبانی شده دیسک سخت ، آرایه دیسک (RAID)<br />کانال تعداد 8<br />RAID سطح RAID 0 ، RAID 1 ، RAID 5 ، RAID 10 ، RAID 50<br />گسترش / اتصال<br />رابط ها 2 x SATA 6Gb / s / SAS 6Gb / s (داخلی)<br />اسلات های سازگار 1 x PCI Express 3.0 x8<br />الزامات نرم افزار / سیستم<br />سیستم عامل مورد نیاز SuSE Linux Enterprise Server 11، SuSE Linux Enterprise Server 10، Red Hat Enterprise Linux 5، Red Hat Enterprise Linux 6، Microsoft Windows Server 2008 (32/64-bit)، Microsoft Windows Server 2003 (32/64-bit)<br />ابعاد و وزن<br />عرض 5.7 سانتی متر<br />عمق 24.1 سانتی متر<br />قد 19.1 سانتی متر<br />اطلاعات سازگاری<br />برای HPE ProLiant DL160 Gen8، DL160 Gen8 Entry، DL160 Gen8 Performance، DL320e Gen8، DL320e Gen8 Base، DL320e Gen8 Entry، DL320e Gen8 Performance، DL380e Gen8، DL380p Gen8، DL380p Gen8 Base، DL380p Gen8 Entry، DL380p Gen8 Base، DL380p Gen8 Entry، DL380p Gen8 حجم کار اختصاصی Gen8 Special، DL385p Gen8، DL385p Gen8، DL385p Gen8 Entry، DL385p Gen8 Maximized Consolidation، DL385p Gen8 Storage، DL560 Gen8، DL560 Gen8 Base، DL560 Gen8 Entry، DL560 Gen8 Performance، ML310e Gen8، ML310e M8، ML310e ML310e Gen8 Performance، ML310e Gen8 v2، ML310e Gen8 v2 Base، ML310e Gen8 v2 Enty، ML310e Gen8 v2 Performance، ML350e Gen8، ML350e Gen8 Base، ML350e Gen8 Entry، ML350e Gen8 Gen8 M83 M23، ML310e Gen8 M23 سینی عرض نیمه چپ SL270s Gen8 1U ، سینی عرض نیمه راست SL270s Gen8 1U ، سینی عرض عرض نیمه چپ SL270s Gen8 Base 4U ، سینی عرض عرض نیمه SL270s Gen8 Base 4U ، سینی سمت چپ SL270s Gen8 SE 4U ، سینی سمت چپ ، SL270s Gen8 SE 4</span></p>', 23000000, NULL, NULL, 'کنترلر-P4202GB-FBWC-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:27', NULL, NULL, NULL, NULL),
(19, 14, 0, 'کنترلر P440ar/2G اچ پی HP', 'HP Smart Array P440ar/2G Controller', NULL, NULL, NULL, 'خرید و بهترین قیمت کنترلر P440ar/2G اچ پی HP | مناسبترین قیمت انواع کنترلر در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کنترلر P440ar/2G اچ پی HP | یوزدکالا', NULL, '<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\">آیا به دنبال محافظت از داده های خود با ذخیره سازی درون سرور یا رمزگذاری امن داده های خود بدون اشغال اسلات PCIe هستید؟ کنترلر HP Smart Array P440ar یک کنترلر هوشمند آرایه ای ، 12 گیگابایت بر ثانیه SAS RAID است که عملکرد ذخیره سازی کلاس سازمانی ، افزایش مقیاس پذیری داخلی با کارت SAS Expander و محافظت از داده ها را برای سرورهای برج و برج HP ProLiant Gen9 فراهم می کند. این ویژگی از هشت پیوند داخلی فیزیکی برخوردار است و با ارائه قابلیت ذخیره سازی پیشرفته ، از جمله انتقال سطح RAID آنلاین بین هر سطح RAID با حافظه پنهان نوشتن پشتیبان فلش (FBWC) ، هشدار قبل از خرابی جهانی ، باعث افزایش زمان سرور می شود. کنترل کننده های خانواده Gen9 از باتری ذخیره سازی هوشمند HP پشتیبانی می کنند. با استفاده از باتری ذخیره سازی هوشمند HP ، چندین کنترل کننده Smart Array بدون نیاز به منابع تغذیه اضافی پشتیبان برای هر کنترل کننده پشتیبانی می شوند ، در نتیجه فرآیند ساده ارتقا می یابد.<br /> <br />افزایش عملکرد برای برنامه ها.<br /> <br />HP Smart Array P440ar Controller با افزایش 12 گیگابایت بر ثانیه اتصال SAS در سرورهای HP ProLiant Gen9 هنگام اتصال به دستگاه های ذخیره سازی داخلی 12 گیگابایت بر ثانیه برای افزایش کارایی در پیام رسانی ، پایگاه داده یا برنامه های سرور عمومی. حافظه پنهان نوشتاری پشتیبان 2 GB DDR3-1866 با پشتیبانی از پهنای باند حافظه نهان تا 14.9 گیگابایت بر ثانیه برای کاهش تأخیر در برنامه های فشرده نوشتن که به ثبت سنگین مانند پایگاه داده نیاز دارند. HP SmartCache اختیاری شتاب خواندن و نوشتن را برای بارهای کاری مانند پایگاه داده یا صفحات وب فراهم می کند.<br />محافظت از داده با قابلیت رمزگذاری.<br /> <br />HP Smart Array P440ar Controller قابلیت اختیاری HP Secure Encryption را فراهم می کند که از اطلاعات در حالت استراحت در هر فضای ذخیره سازی بزرگ متصل به کنترل کننده محافظت می کند. نگهداری طولانی مدت داده ها با حافظه ذخیره سازی پشتیبان فلش پشتیبان 2 GB (FBWC) برای بهبود قابلیت اطمینان داده ها. فعال سازی اضافی پیش بینی را برای بهبود بازسازی و افزایش زمان کار حتی در حالت بازیابی ارائه می دهد.<br /> <br />پیکربندی کارآمد و ساده است.<br /> <br />HP Smart Array P440ar Controller و دستگاههای ذخیره سازی متصل شده توسط نرم افزار HP Smart Storage Administrator که در تهیه هوشمند سرور گنجانده شده است ، پیکربندی و مدیریت می شوند. سازگاری داده ها بین خانواده HP Smart Array Controller امکان انتقال ساده و آسان را در هر زمان که نیاز به عملکرد ، ظرفیت یا در دسترس بودن بالاتر وجود دارد مانند تبدیل حجم ذخیره سازی موجود به پیکربندی آرایه دیسک پیشرفته تر ، امکان پذیر می کند.<br /> <br />مشخصات فنی<br /> <br />ابعاد محصول (W x D x H) 4.09 x 5.3 x 1.23 in<br />وزن (شاهنشاهی) 1 پوند<br />وزن (متریک) 0.45 کیلوگرم</span></p>', 65000000, NULL, NULL, 'کنترلر-P440ar2G-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:27', NULL, NULL, NULL, NULL),
(20, 10, 0, 'انکلوژر D3600', 'HPE D3600 Enclosure', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور انکلوژر D3600 اچ پی ای HPE | مناسبترین قیمت انواع انکلوژر در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت انکلوژر D3600 اچ پی ای HPE | یوزدکالا', NULL, '<p><span class=\"tlid-translation translation\" lang=\"fa\" tabindex=\"-1\"><span title=\"\">HP D3000 Enclosures 12 Gb SAS سرعت انتقال داده بالاتر یا سریعتر را دو برابر می کند ، سرعت انتقال فعلی راه حل های 6 گیگابایتی که پهنای باند اساسی را فراهم می کند</span><br /><span title=\"\">محفظه های HP D3000 این انعطاف پذیری را برای مخلوط کردن و مطابقت درایوهای SAS ، SATA و Solid State در همان محفظه به شما می دهد و از مزایای ذخیره سازی طبقه بندی شده برای هدایت مشترک مشتریان استفاده می کند.</span><br /><span class=\"\" title=\"\">محفظه های HP D3000 از HP SmartDrive Carrier (درایوهای Gen8 ProLiant) پشتیبانی می کنند و مجموعه ای از درایوهای مشترک را برای سرورهای Gen8 / 9 ProLiant و D3000 Enclosures امکان پذیر می کنند.</span><br /><span title=\"\">نرم افزار HP StoreVirtual VSA: با HP StoreVirtual VSA می توانید از قدرت مجازی سازی برای ایجاد یک آرایه مجازی در سرور میزبان خود استفاده کنید.</span></span></p>', 0, NULL, NULL, 'انکلوژر-D3600', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:27', NULL, NULL, NULL, NULL),
(21, 14, 80, 'کابل 5 متری OM4 2f-P/N:QK734A اچ پیHP', 'HP Premier Flex LC/LC OM4 2f 5m Cbl P/N:QK734A', 0, '', '', 'خرید و بهترین قیمت کابل 5 متری OM4 2f-P/N:QK734A اچ پیHP | مناسبترین قیمت انواع کابل در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کابل 5 متری OM4 2f-P/N:QK734A | یوزدکالا', '', '', 8500000, 1, NULL, 'کابل-5-متری-OM4-2f-PNQK734A-اچ-پیHP', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:27', NULL, NULL, NULL, NULL),
(22, 14, 80, 'سرور رکمونت DL380p Gen9 HP', 'HP ProLiant DL380 Gen9 8SFF Configure-to-order Server P/N:719064-B21', 0, '', '', 'خرید و بهترین قیمت سرور رکمونت DL380p Gen9 HP | یوزدکالا | بهترین قیمت انواع سرور دست دوم | یوزد کالا', 'خرید و بهترین قیمت سرور رکمونت DL380p Gen9 HP | یوزدکالا', '', '', 25000000, 1, NULL, 'سرور-رکمونت-DL380p-Gen9-HP', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:27', NULL, NULL, NULL, NULL),
(23, 12, 80, 'سی پی یو سرور 3075', 'Intel® Xeon® processor 3075 (2.66GHz, 4MB L2 Cache, 65 Watts, 1333MHz FSB)', 0, '', '', 'خرید و بهترین قیمت سی پی یو سرور 3075 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور 3075 اینتل Intel | یوزدکالا', '', '', 2000000, 1, NULL, 'سی-پی-یو-سرور-3075', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:27', NULL, NULL, NULL, NULL);
INSERT INTO `products` (`id`, `brand_id`, `user_id`, `title`, `title_english`, `seo_robot`, `seo_canonical`, `seo_H1`, `seo_description`, `seo_title`, `meta_title`, `description`, `price`, `featured`, `image`, `slug`, `sale`, `status`, `status_related`, `sku`, `quantity`, `weight`, `created_at`, `updated_at`, `published_at`, `started_at`, `end_at`) VALUES
(24, 12, 80, 'سی پی یو سرور E5504', 'Intel® Xeon® E5504 (2.00GHz/4-core/4MB/80W, DDR3-800) Processor', 0, '', '', 'خرید و بهترین قیمت سی پی یو سرور E5504 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5504 اینتل Intel | یوزدکالا', '', '', 2000000, 1, NULL, 'سی-پی-یو-سرور-E5504', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:27', NULL, NULL, NULL, NULL),
(25, 12, 80, 'سی پی یو سرور 5140', 'Intel® Xeon® Processor 5140 (2.33 GHz, 65 Watts, 1333 FSB)', 0, '', '', 'خرید و بهترین قیمت سی پی یو سرور 5140 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور 5140 اینتل Intel | یوزدکالا', '', '', 2000000, 1, NULL, 'سی-پی-یو-سرور-5140', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:27', NULL, NULL, NULL, NULL),
(26, 12, 80, 'سی پی یو سرور E5335', 'Intel® Xeon® Processor E5335 (2.00 GHz, 50 Watts, 1333 FSB, Low Voltage', 0, '', '', 'خرید و بهترین قیمت سی پی یو سرور E5335 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5335 اینتل Intel | یوزدکالا', '', '', 2000000, 1, NULL, 'سی-پی-یو-سرور-E5335', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:27', NULL, NULL, NULL, NULL),
(27, 12, 80, 'سی پی یو سرور 5150', 'Intel® Xeon® Processor 5150 (2.67 GHz, 65 Watts, 1333 FSB)', 0, '', '', 'خرید و بهترین قیمت سی پی یو سرور 5150 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور 5150 اینتل Intel | یوزدکالا', '', '', 2000000, 1, NULL, 'سی-پی-یو-سرور-5150', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(28, 12, 80, 'سی پی یو سرور E5320', 'Intel® Xeon® Processor E5320 (1.86 GHz, 80 Watts, 1066 FSB)', 0, '', '', 'خرید و بهترین قیمت سی پی یو سرور E5320 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5320 اینتل Intel | یوزدکالا', '', '', 2000000, 1, NULL, 'سی-پی-یو-سرور-E5320', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(29, 12, 80, 'سی پی یو سرور E5606 ', 'Intel® Xeon® E5606 (2.13GHz/4-core/8MB/80W)', 0, '', '', 'خرید و بهترین قیمت سی پی یو سرور E5606 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5606 اینتل Intel | یوزدکالا', '', '', 2000000, 1, NULL, 'سی-پی-یو-سرور-E5606', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(30, 12, 80, 'سی پی یو سرور E5-2640 اینتل intel', 'Intel® Xeon® E5-2640 (2.5GHz/6-core/15MB/7.2GT-s QPI/95W, DDR3-1333, HT, Turbo2- 3/3/4/4/5/5)', 0, '', '', 'خرید و بهترین قیمت سی پی یو سرور E5-2640 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5-2640 اینتل Intel | یوزدکالا', '', '', 10000000, 1, NULL, 'سی-پی-یو-سرور-E5-2640', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(31, 12, 80, 'سی پی یو سرور E5-2650', 'Intel® Xeon® E5-2650 (2.0GHz/8-core/20MB/8GT-s QPI/95W, DDR3-1600, HT, Turbo2- 4/4/5/5/5/7/8/8)', 0, '', '', 'خرید و بهترین قیمت سی پی یو سرور E5-2650 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5-2650 اینتل Intel | یوزدکالا', '', '', 12000000, 1, NULL, 'سی-پی-یو-سرور-E5-2650', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(32, 12, 0, 'سی پی یو سرور E5-2660', 'Intel® Xeon® E5-2660 (2.2GHz/8-core/20MB/8GT-s QPI/95W, DDR3-1600, HT, Turbo2- 5/5/6/6/7/7/8/8)', NULL, NULL, NULL, 'خرید و بهترین قیمت سی پی یو سرور E5-2660 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5-2660 اینتل Intel | یوزدکالا', NULL, '', 14000000, NULL, NULL, 'سی-پی-یو-سرور-E5-2660', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(33, 12, 0, 'سی پی یو سرور E5-2670', 'Intel® Xeon® E5-2670 (2.6GHz/8-core/20MB/8GT-s QPI/115W, DDR3-1600, HT, Turbo2- 4/4/5/5/6/6/7/7)', NULL, NULL, NULL, 'خرید و بهترین قیمت سی پی یو سرور E5-2670 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5-2670 اینتل Intel | یوزدکالا', NULL, '', 17000000, NULL, NULL, 'سی-پی-یو-سرور-E5-2670', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(34, 12, 0, 'سی پی یو سرور E5-2620 v2', 'Intel® Xeon® E5-2620 v2 (2.1GHz/6-core/15MB/7.2GT-s QPI/80W, DDR3-1600, HT, Turbo2- 3/3/3/3/4/5)', NULL, NULL, NULL, 'خرید و بهترین قیمت سی پی یو سرور E5-2620 v2 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5-2620 v2 اینتل Intel | یوزدکالا', NULL, '', 7000000, NULL, NULL, 'سی-پی-یو-سرور-E5-2620-v2', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(35, 12, 0, 'سی پی یو سرور E5-2650 v2', 'Intel® Xeon® E5-2650 v2 (2.6GHz/8-core/20MB/8.0GT-s QPI/95W, DDR3-1866, HT, Turbo2- 4/4/4/4/5/6/7/8)', NULL, NULL, NULL, 'خرید و بهترین قیمت سی پی یو سرور E5-2650 v2 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5-2650 v2 اینتل Intel | یوزدکالا', NULL, '', 17000000, NULL, NULL, 'سی-پی-یو-سرور-E5-2650-v2', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(36, 12, 0, 'سی پی یو سرور E5-2603v3', 'Intel® Xeon® E5-2603v3 (1.6GHz/6-core/15MB/85W)', NULL, NULL, NULL, 'خرید و بهترین قیمت سی پی یو سرور E5-2603v3 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5-2603v3 اینتل Intel | یوزدکالا', NULL, '', 5000000, NULL, NULL, 'سی-پی-یو-سرور-E5-2603v3', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(37, 12, 0, 'سی پی یو سرور E5-2620v3', 'Intel® Xeon® E5-2620v3 (2.4GHz/6-core/15MB/85W)', NULL, NULL, NULL, 'خرید و بهترین قیمت سی پی یو سرور E5-2620v3 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5-2620v3 اینتل Intel | یوزدکالا', NULL, '', 7000000, NULL, NULL, 'سی-پی-یو-سرور-E5-2620v3', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(38, 12, 0, 'سی پی یو سرور E5-2650v3', 'Intel® Xeon® E5-2650v3 (2.3GHz/10-core/25MB/105W)', NULL, NULL, NULL, 'خرید و بهترین قیمت سی پی یو سرور E5-2650v3 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5-2650v3 اینتل Intel | یوزدکالا', NULL, '', 26000000, NULL, NULL, 'سی-پی-یو-سرور-E5-2650v3', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(39, 12, 0, 'سی پی یو سرور E5-2690v3', 'Intel® Xeon® E5-2690v3 (2.6GHz/12-core/30MB/135W)', NULL, NULL, NULL, 'خرید و بهترین قیمت سی پی یو سرور E5-2690v3 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5-2690v3 اینتل Intel | یوزدکالا', NULL, '', 55000000, NULL, NULL, 'سی-پی-یو-سرور-E5-2690v3', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(40, 12, 0, 'سی پی یو سرور E5-2697v4', 'Intel® Xeon® E5-2697v4 2.3GHz/18-core/45MB/145W', NULL, NULL, NULL, 'خرید و بهترین قیمت سی پی یو سرور E5-2697v4 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5-2697v4 اینتل Intel | یوزدکالا', NULL, '', 270000000, NULL, NULL, 'سی-پی-یو-سرور-E5-2697v4', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(41, 12, 0, 'سی پی یو سرور E5-2620v4', 'Intel® Xeon® E5-2620v4 (2.1GHz/8-core/20MB/85W)', NULL, NULL, NULL, 'خرید و بهترین قیمت سی پی یو سرور E5-2620v4 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5-2620v4 اینتل Intel | یوزدکالا', NULL, '', 70000000, NULL, NULL, 'سی-پی-یو-سرور-E5-2620v4', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(42, 12, 0, 'سی پی یو سرور E5-2699v4', 'Intel Xeon E5-2699v4 (2.2GHz/22-core/55MB/145W) Processor ', NULL, NULL, NULL, 'خرید و بهترین قیمت سی پی یو سرور E5-2699v4 اینتل Intel | مناسبترین قیمت انواع سی پی یو سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت سی پی یو سرور E5-2699v4 اینتل Intel | یوزدکالا', NULL, '', 279000000, NULL, NULL, 'سی-پی-یو-سرور-E5-2699v4', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(43, 14, 80, 'هیت سینک و فن DL380 G10 اچ پی HP', 'Heatsink & fan DL380 G10', 0, '', '', 'خرید و بهترین قیمت هیت سینک و فن DL380 G10 اچ پی HP | مناسبترین قیمت انواع هیت سینک و فن در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت هیت سینک و فن DL380 G10 اچ پی HP | یوزدکالا', '', '', 25000000, 1, NULL, 'هیت-سینک-و-فن-DL380-G10-اچ-پی-HP', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(44, 14, 0, ' فن ML 350 G9 اچ پی HP', 'FAN  ML 350 G9', NULL, NULL, NULL, 'خرید و بهترین قیمت فن ML 350 G9 اچ پی HP | مناسبترین قیمت انواع هیت سینک و فن در بازار | فروشگاه آنلاین یوزدکالا', ' خرید و بهترین قیمت فن ML 350 G9 اچ پی HP | یوزدکالا', NULL, '', 20000000, NULL, NULL, '-فن-ML-350-G9-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:28', NULL, NULL, NULL, NULL),
(45, 14, 0, 'هیت سینک و VRM ML370 G5 اچ پی HP', 'Heatsink & VRM ML370 G5', NULL, NULL, NULL, 'خرید و بهترین قیمت هیت سینک و VRM ML370 G5 اچ پی HP | مناسبترین قیمت انواع هیت سینک و فن در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت هیت سینک و VRM ML370 G5 اچ پی HP | یوزدکالا', NULL, '', 2000000, NULL, NULL, 'هیت-سینک-و-VRM-ML370-G5-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(46, 14, 0, 'هیت سینک و فن DL360G7 اچ پی HP', 'Heatsink & fan  DL360G7', NULL, NULL, NULL, 'خرید و بهترین قیمت هیت سینک و فن DL360G7 اچ پی HP | مناسبترین قیمت انواع هیت سینک و فن در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت هیت سینک و فن DL360G7 اچ پی HP | یوزدکالا', NULL, '', 4000000, NULL, NULL, 'هیت-سینک-و-فن-DL360G7-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(47, 14, 0, 'هیت سینک و فن DL380 G8 اچ پی HP', 'Heatsink & fan DL380 G8', NULL, NULL, NULL, 'خرید و بهترین قیمت هیت سینک و فن DL380 G8 اچ پی HP | مناسبترین قیمت انواع هیت سینک و فن در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت هیت سینک و فن DL380 G8 اچ پی HP | یوزدکالا', NULL, '', 7000000, NULL, NULL, 'هیت-سینک-و-فن-DL380-G8-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(48, 14, 0, 'هیت سینک و فن DL380 G9 اچ پی HP', 'Heatsink & fan DL380 G9', NULL, NULL, NULL, 'خرید و بهترین قیمت هیت سینک و فن DL380 G9 اچ پی HP | مناسبترین قیمت انواع هیت سینک و فن در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت هیت سینک و فن DL380 G9 اچ پی HP | یوزدکالا', NULL, '', 7000000, NULL, NULL, 'هیت-سینک-و-فن-DL380-G9-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(49, 10, 0, 'فن dl380 G9 اچ پی HP', 'fan dl380 G9', NULL, NULL, NULL, 'خرید و بهترین قیمت فن dl380 G9 اچ پی HP | مناسبترین قیمت انواع هیت سینک و فن در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت فن dl380 G9 اچ پی HP | یوزدکالا', NULL, '', 7000000, NULL, NULL, 'فن-dl380-G9-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(50, 14, 0, 'هیت سینک DL360 G5 اچ پی HP', 'HEATSINK DL360 G5', NULL, NULL, NULL, 'خرید و بهترین قیمت هیت سینک DL360 G5 اچ پی HP | مناسبترین قیمت انواع هیت سینک و فن در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت هیت سینک DL360 G5 اچ پی HP | یوزدکالا', NULL, '', 2000000, NULL, NULL, 'هیت-سینک-DL360-G5-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(51, 14, 0, 'هیت سینک DL180 G6 اچ پی HP', 'HEATSINK DL180 G6', NULL, NULL, NULL, 'خرید و بهترین قیمت هیت سینک DL180 G6 اچ پی HP | مناسبترین قیمت انواع هیت سینک و فن در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت هیت سینک DL180 G6 اچ پی HP | یوزدکالا', NULL, '', 2000000, NULL, NULL, 'هیت-سینک-DL180-G6-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(52, 14, 0, 'هیت سینک ML370 G5 اچ پی HP', 'HEATSINK ML370 G5', NULL, NULL, NULL, 'خرید و بهترین قیمت هیت سینک ML370 G5 اچ پی HP | مناسبترین قیمت انواع هیت سینک و فن در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت هیت سینک ML370 G5 اچ پی HP | یوزدکالا', NULL, '', 3000000, NULL, NULL, 'هیت-سینک-ML370-G5-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(53, 14, 0, 'فن 80 X 38MM-ML310E G8 اچ پی HP', 'HP FAN 80 X 38MM FOR HP PROLIANT ML310E G8', NULL, NULL, NULL, 'خرید و بهترین قیمت فن 80 X 38MM-ML310E G8 اچ پی HP | مناسبترین قیمت انواع هیت سینک و فن در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت فن 80 X 38MM-ML310E G8 اچ پی HP | یوزدکالا', NULL, '', 2000000, NULL, NULL, 'فن-80-X-38MM-ML310E-G8-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(54, 14, 80, 'رم سرور 16G PC3-14900R اچ پیHP ', 'HP 16GB (1x16GB) Dual Rank x4 PC3-14900R (DDR3-1866) Registered CAS-13 Memory Kit', 0, '', '', 'خرید و بهترین قیمت رم سرور 16G PC3-14900R اچ پیHP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 16G PC3-14900R اچ پیHP | یوزدکالا', '', '', 15000000, 1, NULL, 'رم-سرور-16G-PC3-14900R-اچ-پیHP', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(55, 10, 0, 'رم سرور 16G DDR4-2400 اچ پی ای HPE', 'HPE 16GB (1x16GB) Dual Rank x4 DDR4-2133 CAS-15-15-15 Registered Memory Kit', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور 16G DDR4-2400 اچ پی ای HPE | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 16G DDR4-2400 اچ پی ای HPE | یوزدکالا', NULL, '', 17000000, NULL, NULL, 'رم-سرور-16G-DDR4-2400-اچ-پی-ای-HPE', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(56, 10, 0, 'رم سرور 8G DDR4-2133 اچ پی ای HPE ', 'HPE 8GB (1x8GB) Single Rank x4 DDR4-2133 CAS-15-15-15 Registered Memory Kit', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور 8G DDR4-2133 اچ پی ای HPE | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 8G DDR4-2133 اچ پی ای HPE | یوزدکالا', NULL, '', 8000000, NULL, NULL, 'رم-سرور-8G-DDR4-2133-اچ-پی-ای-HPE-', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(57, 14, 0, 'رم سرور 16G DDR4-2400 اچ پی ای HPE ', 'HPE 16GB 1x16GB Single Rank x4 DDR4-2400 CAS Registered Memory Kit ', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور 16G DDR4-2400 اچ پی ای HPE | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 16G DDR4-2400 اچ پی ای HPE | یوزدکالا', NULL, '', 21000000, NULL, NULL, 'رم-سرور-16G-DDR4-2400-اچ-پی-ای-HPE', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(58, 14, 0, 'رم سرور 32GB DDR4-2400 اچ پی HP', 'HP 32GB (1x32GB) Dual Rank x4 DDR4-2400 CAS-17-17-17 Registered Memory Kit', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور 32GB DDR4-2400 اچ پی HP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 32GB DDR4-2400 اچ پی HP | یوزدکالا', NULL, '', 34000000, NULL, NULL, 'رم-سرور-32GB-DDR4-2400-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(59, 14, 0, 'رم سرور 1G PC2 PC3200 DDR2 SDRAM اچ پیHP', 'HP 1 GB of Advanced PC2 PC3200 DDR2 SDRAM DIMM Memory Kit', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور 1G PC2 PC3200 DDR2 SDRAM اچ پیHP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 1G PC2 PC3200 DDR2 SDRAM اچ پیHP | یوزدکالا', NULL, '', 500000, NULL, NULL, 'رم-سرور-1G-PC2-PC3200-DDR2-SDRAM-اچ-پیHP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(60, 14, 0, 'رم سرور 4G PC2 PC3200 DDR2 SDRAM اچ پیHP', 'HP 4 GB of Single-Ranked PC2 PC3200 DDR2 SDRAM DIMM Memory Kit ', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور 4G PC2 PC3200 DDR2 SDRAM اچ پیHP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 4G PC2 PC3200 DDR2 SDRAM اچ پیHP | یوزدکالا', NULL, '', 2000000, NULL, NULL, 'رم-سرور-4G-PC2-PC3200-DDR2-SDRAM-اچ-پیHP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:29', NULL, NULL, NULL, NULL),
(61, 14, 0, 'رم سرور 2G PC3-12800E اچ پیHP', 'HP 2GB (1x2GB) Single Rank x8 PC3-12800E (DDR3-1600) Unbuffered  ', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور 2G PC3-12800E اچ پیHP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 2G PC3-12800E اچ پیHP | یوزدکالا', NULL, '', 1000000, NULL, NULL, 'رم-سرور-2G-PC3-12800E-اچ-پیHP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(62, 14, 0, 'رم سرور 8G PC3-12800R اچ پیHP', 'HP 8GB (1x8GB) Single Rank x4 PC3-12800R (DDR3-1600) ', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور 8G PC3-12800R اچ پیHP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 8G PC3-12800R اچ پیHP | یوزدکالا', NULL, '', 7500000, NULL, NULL, 'رم-سرور-8G-PC3-12800R-اچ-پیHP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(63, 14, 0, 'رم سرور 2G PC3-10600 اچ پیHP', 'HP 2GB (1x2GB) Dual Rank x8 PC3-10600 (DDR3-1333) Unbuffered CAS-9 Memory', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور 2G PC3-10600 اچ پیHP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 2G PC3-10600 اچ پیHP | یوزدکالا', NULL, '', 2000000, NULL, NULL, 'رم-سرور-2G-PC3-10600-اچ-پیHP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(64, 14, 0, 'رم سرور 16G PC3-8500 اچ پیHP', 'HP 16GB (1x16GB) Quad Rank x4 PC3-8500 (DDR3-1066) Registered CAS-7 Memory Kit ', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور 16G PC3-8500 اچ پیHP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 16G PC3-8500 اچ پیHP | یوزدکالا', NULL, '', 10000000, NULL, NULL, 'رم-سرور-16G-PC3-8500-اچ-پیHP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(65, 14, 0, 'رم سرور 1G PC2-6400 اچ پیHP', 'HP 1GB (1x1GB) Dual Rank PC2-6400 (DDR2-800) Unbuffered Memory Kit ', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور 1G PC2-6400 اچ پیHP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 1G PC2-6400 اچ پیHP | یوزدکالا', NULL, '', 500000, NULL, NULL, 'رم-سرور-1G-PC2-6400-اچ-پیHP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(66, 14, 0, 'رم سرور 2G PC3-10600R اچ پیHP', 'HP 2GB 2Rx8 PC3-10600R-9 Kit', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور 2G PC3-10600R اچ پیHP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 2G PC3-10600R اچ پیHP | یوزدکالا', NULL, '', 1000000, NULL, NULL, 'رم-سرور-2G-PC3-10600R-اچ-پیHP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(67, 14, 0, 'رم سرور 4G PC3-10600R اچ پیHP', 'HP 4GB 2Rx4 PC3-10600R-9 Kit(SPARE)', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور 4G PC3-10600R اچ پیHP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 4G PC3-10600R اچ پیHP | یوزدکالا', NULL, '', 2000000, NULL, NULL, 'رم-سرور-4G-PC3-10600R-اچ-پیHP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(68, 14, 0, 'رم سرور 8G PC3L-10600R اچ پیHP', 'HP 8GB 2Rx4 PC3L-10600R-9 Kit', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور 8G PC3L-10600R اچ پیHP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 8G PC3L-10600R اچ پیHP | یوزدکالا', NULL, '', 7500000, NULL, NULL, 'رم-سرور-8G-PC3L-10600R-اچ-پیHP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(69, 14, 0, 'رم سرور 4G PC3-12800E اچ پیHP', 'HP 4GB 2Rx8 PC3-12800E-11 Kit', NULL, NULL, NULL, 'خرید و بهترین قیمت رم سرور 4G PC3-12800E اچ پیHP | مناسبترین قیمت انواع رم سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت رم سرور 4G PC3-12800E اچ پیHP | یوزدکالا', NULL, '', 2000000, NULL, NULL, 'رم-سرور-4G-PC3-12800E-اچ-پیHP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(70, 14, 80, 'پاور سرور  750W Plat PL Ht Plg اچ پیHP', 'HP 750W CS Plat PL Ht Plg Pwr Supply Kit', 0, '', '', 'خرید و بهترین قیمت پاور سرور  750W Plat PL Ht Plg اچ پیHP | مناسبترین قیمت انواع پاور سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت پاور سرور  750W Plat PL Ht Plg اچ پیHP | یوزدکالا', '', '', 3500000, 1, NULL, 'پاور-سرور--750W-Plat-PL-Ht-Plg-اچ-پیHP', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(71, 14, 80, 'پاور سرور  800W Plat Ht Plg اچ پیHP', 'HP 800W FS Plat Ht Plg Pwr Supply Kit ', 0, '', '', 'خرید و بهترین قیمت پاور سرور  800W Plat Ht Plg اچ پیHP | مناسبترین قیمت انواع پاور سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت پاور سرور  800W Plat Ht Plg اچ پیHP | یوزدکالا', '', '', 30000000, 1, NULL, 'پاور-سرور--800W-Plat-Ht-Plg-اچ-پیHP', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(72, 14, 80, 'پاور سرور 400W FACTORY LNTEGRATED اچ پیHP', 'HP 400W FACTORY LNTEGRATED POWER SUPPLY KIT', 0, '', '', 'خرید و بهترین قیمت پاور سرور 400W FACTORY LNTEGRATED اچ پیHP | مناسبترین قیمت انواع پاور سرور در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت پاور سرور 400W FACTORY LNTEGRATED اچ پیHP | یوزدکالا', '', '', 2000000, 1, NULL, 'پاور-سرور-400W-FACTORY-LNTEGRATED-اچ-پیHP', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(73, 14, 80, 'کنترلر E200/64MB اچ پی HP', 'HP Smart Array E200/64MB Controller', 0, '', '', 'خرید و بهترین قیمت کنترلر E200/64MB اچ پی HP | مناسبترین قیمت انواع کنترلر در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کنترلر E200/64MB اچ پی HP | یوزدکالا', '', '', 2000000, 1, NULL, 'کنترلر-E20064MB-اچ-پی-HP', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(74, 14, 80, 'کنترلر P400/256MB اچ پی HP', 'HP Smart Array P400/256MB Controller', 0, '', '', 'خرید و بهترین قیمت کنترلر کنترلر P400/256MB اچ پی HP | مناسبترین قیمت انواع کنترلر در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کنترلر P400/256MB اچ پی HP | یوزدکالا', '', '', 2000000, 1, NULL, 'کنترلر-P400256MB-اچ-پی-HP', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(75, 14, 0, 'کنترلر P400/512 BBWC اچ پی HP', 'HP Smart Array P400/512 BBWC Controller', NULL, NULL, NULL, 'خرید و بهترین قیمت کنترلر P400/512 BBWC اچ پی HP | مناسبترین قیمت انواع کنترلر در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کنترلر P400/512 BBWC اچ پی HP | یوزدکالا', NULL, '', 2000000, NULL, NULL, 'کنترلر-P400512-BBWC-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(76, 14, 0, 'کنترلر P420 Internal PCI-e SAS اچ پی HP', 'HP Smart Array P420 Internal PCI-e SAS Controller', NULL, NULL, NULL, 'خرید و بهترین قیمت کنترلر P420 Internal PCI-e SAS اچ پی HP | مناسبترین قیمت انواع کنترلر در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کنترلر P420 Internal PCI-e SAS اچ پی HP | یوزدکالا', NULL, '', 2000000, NULL, NULL, 'کنترلر-P420-Internal-PCI-e-SAS-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(77, 10, 80, 'انکلوژر D2700-P/N:AJ941A', 'HPE D2700 Disk Enclosure', 0, '', '', 'خرید و بهترین قیمت انکلوژر D2700-P/N:AJ941A | مناسبترین قیمت انواع انکلوژر در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت انکلوژر D2700-P/N:AJ941A | یوزدکالا', '', '', 150000000, 1, NULL, 'انکلوژر-D2700-PNAJ941A', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(78, 14, 80, 'انکلوژر D2600 12lff-P/N:AJ940A', 'HP D2600 12lff Disk Enclosure P/N:AJ940A', 0, '', '', 'خرید و بهترین قیمت انکلوژر D2600 12lff | مناسبترین قیمت انواع انکلوژر در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت انکلوژر D2600 12lff | یوزدکالا', '', '', 170000000, 1, NULL, 'انکلوژر-D2600-12lff', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:30', NULL, NULL, NULL, NULL),
(79, 14, 80, 'کیج HOTPLUG 2.5 SFF G8 اچ پی HP', 'HP CAGE HOTPLUG 2.5 SFF G8', 0, '', '', 'خرید و بهترین قیمت کیج HOTPLUG 2.5 SFF G8 اچ پی HP | مناسبترین قیمت انواع کیج در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کیج HOTPLUG 2.5 SFF G8 اچ پی HP | یوزدکالا', '', '', 2400000, 1, NULL, 'کیج-HOTPLUG-25-SFF-G8-اچ-پی-HP', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:31', NULL, NULL, NULL, NULL),
(80, 14, 0, 'کیج 3.5 SAS -SATA G7 اچ پی HP', 'HP CAGE 3.5 SAS -SATA G7', NULL, NULL, NULL, 'خرید و بهترین قیمت کیج 3.5 SAS -SATA G7 اچ پی HP | مناسبترین قیمت انواع کیج در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کیج 3.5 SAS -SATA G7 اچ پی HP | یوزدکالا', NULL, '', 2000000, NULL, NULL, 'کیج-35-SAS--SATA-G7-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:31', NULL, NULL, NULL, NULL),
(81, 14, 0, 'کیج 3.5 SAS -SATA G8 اچ پی HP', 'HP CAGE 3.5 SAS -SATA G8', NULL, NULL, NULL, 'خرید و بهترین قیمت کیج 3.5 SAS -SATA G8 اچ پی HP | مناسبترین قیمت انواع کیج در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کیج 3.5 SAS -SATA G8 اچ پی HP | یوزدکالا', NULL, '', 2400000, NULL, NULL, 'کیج-35-SAS--SATA-G8-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:31', NULL, NULL, NULL, NULL),
(82, 14, 0, 'کیج HOTPLUG 2.5 SFF G7 اچ پی HP', 'HP CAGE HOTPLUG 2.5 SFF G7', NULL, NULL, NULL, 'خرید و بهترین قیمت کیج HOTPLUG 2.5 SFF G7 اچ پی HP | مناسبترین قیمت انواع کیج در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کیج HOTPLUG 2.5 SFF G7 اچ پی HP | یوزدکالا', NULL, '', 1500000, NULL, NULL, 'کیج-HOTPLUG-25-SFF-G7-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:31', NULL, NULL, NULL, NULL),
(83, 14, 0, 'کیج SSD 2.5 TO 3.5 اچ پی HP', 'HP CAGE SSD 2.5 TO 3.5', NULL, NULL, NULL, 'خرید و بهترین قیمت کیج SSD 2.5 TO 3.5 اچ پی HP | مناسبترین قیمت انواع کیج در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کیج SSD 2.5 TO 3.5 اچ پی HP | یوزدکالا', NULL, '', 3500000, NULL, NULL, 'کیج-SSD-25-TO-35-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:31', NULL, NULL, NULL, NULL),
(84, 15, 0, 'کیج  ADATA SSD 2.5 TO 3.5 ', ' ADATA CAGE SSD 2.5 TO 3.5 ', NULL, NULL, NULL, ' خرید و بهترین قیمت کیج  ADATA SSD 2.5 TO 3.5 | مناسبترین قیمت انواع کیج در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کیج  ADATA SSD 2.5 TO 3.5 | یوزدکالا', NULL, '', 500000, NULL, NULL, 'کیج--ADATA-SSD-25-TO-35-', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:31', NULL, NULL, NULL, NULL),
(85, 14, 0, 'کیج DL370G6HDD-SFF اچ پی HP', 'HP DL370G6HDD-SFF cage', NULL, NULL, NULL, 'خرید و بهترین قیمت کیج DL370G6HDD-SFF اچ پی HP | مناسبترین قیمت انواع کیج در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کیج DL370G6HDD-SFF اچ پی HP | یوزدکالا', NULL, '', 2000000, NULL, NULL, 'کیج-DL370G6HDD-SFF-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:31', NULL, NULL, NULL, NULL),
(86, 14, 0, 'کابل 5متری Premier Flex LC/LC OM4 2f اچ پی HP', 'HP Premier Flex LC/LC OM4 2f 5m Cbl P/N', NULL, NULL, NULL, 'خرید و بهترین قیمت کابل 5متری Premier Flex LC/LC OM4 2f اچ پی HP | مناسبترین قیمت انواع کابل در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کابل 5متری Premier Flex LC/LC OM4 2f اچ پی HP | یوزدکالا', NULL, '', 7500000, NULL, NULL, 'کابل-5متری-Premier-Flex-LCLC-OM4-2f-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:31', NULL, NULL, NULL, NULL),
(87, 14, 0, 'کابل 2 متری Multi-mode OM3 LC/LC اچ پی HP', 'HP 2m Multi-mode OM3 LC/LC FC Cable', NULL, NULL, NULL, 'خرید و بهترین قیمت کابل 2 متری Multi-mode OM3 LC/LC اچ پی HP | مناسبترین قیمت انواع کابل در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کابل 2 متری Multi-mode OM3 LC/LC اچ پی HP | یوزدکالا', NULL, '', 7000000, NULL, NULL, 'کابل-2-متری-Multi-mode-OM3-LCLC-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:31', NULL, NULL, NULL, NULL),
(88, 14, 0, 'کابل 2 متری OM4 2f-P/N:QK733A اچ پی HP', 'HP Premier Flex LC/LC OM4 2f 2m Cbl P/N:QK733A', NULL, NULL, NULL, 'خرید و بهترین قیمت کابل 2 متری OM4 2f-P/N:QK733A اچ پی HP | مناسبترین قیمت انواع کابل در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کابل 2 متری OM4 2f-P/N:QK733A اچ پی HP | یوزدکالا', NULL, '', 7000000, NULL, NULL, 'کابل-2-متری-OM4-2f-PNQK733A-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:31', NULL, NULL, NULL, NULL),
(89, 10, 0, 'کابل 15متری OM4 2f-P/N:QK735A اچ پی ای HPE', 'HPE Premier Flex LC/LC OM4 2f 15m Cbl ', NULL, NULL, NULL, 'خرید و بهترین قیمت کابل 15متری OM4 2f-P/N:QK735A اچ پی ای HPE | مناسبترین قیمت انواع کابل در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کابل 15متری OM4 2f-P/N:QK735A اچ پی ای HPE | یوزدکالا', NULL, '', 12000000, NULL, NULL, 'کابل-15متری-OM4-2f-PNQK735A-اچ-پی-ای-HPE', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:32', NULL, NULL, NULL, NULL),
(90, 14, 0, 'کابل1متری Ext SAS-P/N:389665-B21 اچ پی HP', 'HP Ext SAS 1m Cable P/N:389665-B21', NULL, NULL, NULL, 'خرید و بهترین قیمت کابل1متری Ext SAS-P/N:389665-B21 اچ پی HP | مناسبترین قیمت انواع کابل در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کابل1متری Ext SAS-P/N:389665-B21 اچ پی HP | یوزدکالا', NULL, '', 1000000, NULL, NULL, 'کابل1متری-Ext-SAS-PN389665-B21-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:32', NULL, NULL, NULL, NULL),
(91, 14, 0, 'کابل 30متری SW LC/LC-P/N:224692-B26 اچ پی HP', 'HP 30m SW LC/LC FC Cable Kit P/N:221692-B26', NULL, NULL, NULL, 'خرید و بهترین قیمت کابل 30متری SW LC/LC-P/N:224692-B26 اچ پی HP | مناسبترین قیمت انواع کابل در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت کابل 30متری SW LC/LC-P/N:224692-B26 اچ پی HP | یوزدکالا', NULL, '', 10000000, NULL, NULL, 'کابل-30متری-SW-LCLC-PN224692-B26-اچ-پی-HP', 0, 1, 0, NULL, 0, NULL, '2021-12-14 10:38:32', NULL, NULL, NULL, NULL),
(92, 10, 80, 'لایسنس P/N:512485-B21 اچ پی ای HPE', 'HPE iLO Adv incl 1yr TSU 1-Svr Lic P/N:512485-B21', 0, '', '', 'خرید و بهترین قیمت لایسنس P/N:512485-B21 اچ پی ای HPE | مناسبترین قیمت انواع لایسنس در بازار | فروشگاه آنلاین یوزدکالا', 'خرید و بهترین قیمت لایسنس P/N:512485-B21 اچ پی ای HPE | یوزدکالا', '', '', 20000000, 1, NULL, 'لایسنس-PN512485-B21-اچ-پی-ای-HPE', 1, 0, 0, '', 0, 0, '2021-12-14 10:38:32', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `category_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category_id`) VALUES
(1, 1, 111),
(2, 1, 106),
(3, 1, 112),
(4, 2, 111),
(5, 2, 106),
(6, 2, 112),
(7, 3, 111),
(8, 3, 106),
(9, 3, 112),
(10, 4, 110),
(11, 4, 106),
(12, 4, 113),
(13, 4, 149),
(14, 5, 110),
(15, 5, 106),
(16, 5, 113),
(17, 5, 149),
(18, 6, 110),
(19, 6, 106),
(20, 6, 113),
(21, 6, 149),
(22, 7, 109),
(23, 7, 106),
(24, 7, 113),
(25, 7, 150),
(26, 8, 106),
(27, 8, 113),
(28, 8, 150),
(29, 9, 106),
(30, 9, 113),
(31, 9, 150),
(32, 10, 106),
(33, 10, 113),
(34, 10, 151),
(35, 11, 109),
(36, 11, 106),
(37, 11, 113),
(38, 11, 152),
(39, 12, 106),
(40, 12, 113),
(41, 12, 152),
(42, 13, 106),
(43, 13, 113),
(44, 13, 152),
(45, 14, 106),
(46, 14, 113),
(47, 14, 155),
(51, 16, 106),
(52, 16, 113),
(53, 16, 155),
(54, 17, 106),
(55, 17, 113),
(56, 17, 157),
(57, 18, 106),
(58, 18, 113),
(59, 18, 157),
(60, 19, 106),
(61, 19, 113),
(62, 19, 157),
(63, 20, 107),
(64, 20, 120),
(87, 32, 113),
(88, 32, 149),
(89, 33, 113),
(90, 33, 149),
(91, 34, 113),
(92, 34, 149),
(93, 35, 113),
(94, 35, 149),
(95, 36, 113),
(96, 36, 149),
(97, 37, 113),
(98, 37, 149),
(99, 38, 113),
(100, 38, 149),
(101, 39, 113),
(102, 39, 149),
(103, 40, 113),
(104, 40, 149),
(105, 41, 113),
(106, 41, 149),
(107, 42, 113),
(108, 42, 149),
(112, 44, 113),
(113, 44, 150),
(114, 44, 108),
(115, 45, 113),
(116, 45, 150),
(117, 45, 108),
(118, 46, 113),
(119, 46, 150),
(120, 46, 108),
(121, 47, 113),
(122, 47, 150),
(123, 47, 108),
(124, 48, 113),
(125, 48, 150),
(126, 48, 108),
(127, 49, 113),
(128, 49, 150),
(129, 49, 108),
(130, 50, 113),
(131, 50, 150),
(132, 50, 108),
(133, 51, 113),
(134, 51, 150),
(135, 51, 108),
(136, 52, 113),
(137, 52, 150),
(138, 52, 108),
(139, 53, 113),
(140, 53, 150),
(141, 53, 108),
(145, 55, 113),
(146, 55, 151),
(147, 55, 108),
(148, 56, 113),
(149, 56, 151),
(150, 56, 108),
(151, 57, 106),
(152, 57, 113),
(153, 57, 151),
(154, 57, 108),
(155, 58, 113),
(156, 58, 151),
(157, 58, 108),
(158, 59, 113),
(159, 59, 151),
(160, 59, 108),
(161, 60, 113),
(162, 60, 151),
(163, 60, 108),
(164, 61, 113),
(165, 61, 151),
(166, 61, 108),
(167, 62, 113),
(168, 62, 151),
(169, 62, 108),
(170, 63, 113),
(171, 63, 151),
(172, 63, 108),
(173, 64, 113),
(174, 64, 151),
(175, 64, 108),
(176, 65, 113),
(177, 65, 151),
(178, 65, 108),
(179, 66, 113),
(180, 66, 159),
(181, 66, 151),
(182, 66, 108),
(183, 67, 113),
(184, 67, 151),
(185, 67, 108),
(186, 68, 113),
(187, 68, 151),
(188, 68, 108),
(189, 69, 113),
(190, 69, 151),
(191, 69, 108),
(207, 75, 106),
(208, 75, 113),
(209, 75, 157),
(210, 76, 106),
(211, 76, 113),
(212, 76, 157),
(224, 80, 106),
(225, 80, 113),
(226, 80, 160),
(227, 81, 106),
(228, 81, 113),
(229, 81, 160),
(230, 82, 106),
(231, 82, 113),
(232, 82, 160),
(233, 83, 106),
(234, 83, 113),
(235, 83, 160),
(236, 84, 106),
(237, 84, 113),
(238, 84, 160),
(239, 85, 106),
(240, 85, 113),
(241, 85, 160),
(242, 86, 106),
(243, 86, 113),
(244, 86, 160),
(245, 87, 106),
(246, 87, 113),
(247, 87, 160),
(248, 88, 106),
(249, 88, 113),
(250, 88, 160),
(251, 89, 106),
(252, 89, 113),
(253, 89, 160),
(254, 90, 106),
(255, 90, 113),
(256, 90, 160),
(257, 91, 106),
(258, 91, 113),
(259, 91, 160),
(263, 92, 125),
(264, 92, 106),
(265, 92, 113),
(266, 15, 106),
(267, 15, 113),
(268, 15, 155),
(269, 21, 108),
(270, 21, 129),
(271, 22, 106),
(272, 22, 148),
(273, 23, 113),
(274, 23, 149),
(275, 24, 113),
(276, 24, 149),
(277, 25, 113),
(278, 25, 149),
(279, 26, 113),
(280, 26, 149),
(281, 27, 113),
(282, 27, 149),
(283, 28, 113),
(284, 28, 149),
(285, 29, 113),
(286, 29, 149),
(287, 30, 113),
(288, 30, 149),
(289, 31, 113),
(290, 31, 149),
(291, 43, 108),
(292, 43, 113),
(293, 43, 150),
(294, 54, 108),
(295, 54, 113),
(296, 54, 151),
(297, 70, 106),
(298, 70, 113),
(299, 70, 155),
(300, 71, 106),
(301, 71, 113),
(302, 71, 155),
(303, 72, 106),
(304, 72, 113),
(305, 72, 155),
(306, 73, 108),
(307, 73, 113),
(308, 73, 157),
(309, 74, 106),
(310, 74, 113),
(311, 74, 157),
(312, 77, 108),
(313, 77, 107),
(314, 77, 120),
(315, 77, 106),
(316, 78, 108),
(317, 78, 107),
(318, 78, 120),
(319, 78, 106),
(320, 79, 106),
(321, 79, 113),
(322, 79, 160);

-- --------------------------------------------------------

--
-- Table structure for table `product_coupons`
--

CREATE TABLE `product_coupons` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `coupon_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Dumping data for table `product_coupons`
--

INSERT INTO `product_coupons` (`id`, `product_id`, `coupon_id`) VALUES
(1, 83, 1),
(2, 83, 2),
(3, 92, 2),
(4, 91, 4),
(5, 84, 5);

-- --------------------------------------------------------

--
-- Table structure for table `product_discounts`
--

CREATE TABLE `product_discounts` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `discount_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `product_discounts`
--

INSERT INTO `product_discounts` (`id`, `product_id`, `discount_id`) VALUES
(121, 84, 25),
(122, 83, 26),
(125, 85, 29);

-- --------------------------------------------------------

--
-- Table structure for table `product_samples`
--

CREATE TABLE `product_samples` (
  `id` int NOT NULL,
  `sample_id` int NOT NULL,
  `product_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `product_samples`
--

INSERT INTO `product_samples` (`id`, `sample_id`, `product_id`) VALUES
(1, 1, 30),
(2, 1, 29),
(3, 1, 26),
(4, 2, 90);

-- --------------------------------------------------------

--
-- Table structure for table `product_tags`
--

CREATE TABLE `product_tags` (
  `id` int NOT NULL,
  `product_id` int NOT NULL,
  `tag_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` int NOT NULL,
  `name` varchar(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `slug` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`, `slug`) VALUES
(1, 'آذربایجان شرقی', 'آذربایجان-شرقی'),
(2, 'آذربایجان غربی', 'آذربایجان-غربی'),
(3, 'اردبیل', 'اردبیل'),
(4, 'اصفهان', 'اصفهان'),
(5, 'البرز', 'البرز'),
(6, 'ایلام', 'ایلام'),
(7, 'بوشهر', 'بوشهر'),
(8, 'تهران', 'تهران'),
(9, 'چهارمحال و بختیاری', 'چهارمحال-بختیاری'),
(10, 'خراسان جنوبی', 'خراسان-جنوبی'),
(11, 'خراسان رضوی', 'خراسان-رضوی'),
(12, 'خراسان شمالی', 'خراسان-شمالی'),
(13, 'خوزستان', 'خوزستان'),
(14, 'زنجان', 'زنجان'),
(15, 'سمنان', 'سمنان'),
(16, 'سیستان و بلوچستان', 'سیستان-بلوچستان'),
(17, 'فارس', 'فارس'),
(18, 'قزوین', 'قزوین'),
(19, 'قم', 'قم'),
(20, 'کردستان', 'کردستان'),
(21, 'کرمان', 'کرمان'),
(22, 'کرمانشاه', 'کرمانشاه'),
(23, 'کهگیلویه و بویراحمد', 'کهگیلویه-بویراحمد'),
(24, 'گلستان', 'گلستان'),
(25, 'لرستان', 'لرستان'),
(26, 'گیلان', 'گیلان'),
(27, 'مازندران', 'مازندران'),
(28, 'مرکزی', 'مرکزی'),
(29, 'هرمزگان', 'هرمزگان'),
(30, 'همدان', 'همدان'),
(31, 'یزد', 'یزد');

-- --------------------------------------------------------

--
-- Table structure for table `relateds`
--

CREATE TABLE `relateds` (
  `id` int NOT NULL,
  `entity_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `entity_id` int NOT NULL,
  `related_id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `label`, `status`, `created_at`) VALUES
(8, 'manager-user', 'مدیریت کاربران', 1, '2021-12-06 08:58:20'),
(9, 'manager-category', 'مدیریت دسته بندی ها', 1, '2021-12-06 08:58:20'),
(10, 'manager-product', 'مدیریت محصولات', 1, '2021-12-06 08:58:20'),
(11, 'manager-tag', 'مدیریت تک', 1, '2021-12-06 08:58:20'),
(12, 'manager-blog', 'مدیریت وبلاک', 1, '2021-12-06 08:58:20'),
(13, 'manager-discount', 'مدیریت تخفیفات', 1, '2021-12-06 08:58:20'),
(14, 'manager-cart', 'مدیریت سبد تخفیف', 1, '2021-12-06 08:58:20'),
(15, 'manager-comment', 'مدیریت نظرات', 1, '2021-12-06 08:58:20'),
(16, 'manager-setting', 'مدیریت تنظیمات', 1, '2021-12-06 08:58:20'),
(17, 'super-admin', 'مدیر کل', 1, '2021-12-06 08:58:20'),
(18, 'super-user', 'مدیر', 1, '2021-12-06 08:58:20');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` int NOT NULL,
  `role_id` int DEFAULT NULL,
  `permission_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission_id`) VALUES
(34, 6, 237),
(35, 6, 238),
(36, 6, 239),
(37, 6, 240),
(38, 7, 200),
(39, 7, 201),
(40, 7, 202),
(41, 7, 203);

-- --------------------------------------------------------

--
-- Table structure for table `role_users`
--

CREATE TABLE `role_users` (
  `id` int NOT NULL,
  `role_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `role_users`
--

INSERT INTO `role_users` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(9, 17, 73, '2021-12-06 09:46:43', NULL),
(12, 17, 80, '2021-12-13 14:02:02', NULL),
(13, 17, 81, '2021-12-14 14:21:04', NULL),
(14, 17, 82, '2021-12-14 14:21:12', NULL),
(15, 17, 83, '2021-12-14 14:21:20', NULL),
(16, 17, 84, '2021-12-14 14:22:20', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `samples`
--

CREATE TABLE `samples` (
  `id` int NOT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `user_id` int NOT NULL,
  `code` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `type` tinyint DEFAULT NULL,
  `percent` tinyint DEFAULT NULL COMMENT '%',
  `description` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `start_price` int NOT NULL,
  `finish_price` int NOT NULL,
  `start_at` timestamp NOT NULL,
  `finish_at` timestamp NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `samples`
--

INSERT INTO `samples` (`id`, `title`, `user_id`, `code`, `type`, `percent`, `description`, `status`, `start_price`, `finish_price`, `start_at`, `finish_at`, `updated_at`, `created_at`) VALUES
(1, 'Error laborum est ip', 70, '517882', NULL, 0, 'Dolore quam similiqu', 1, 0, 0, '2021-10-06 12:39:51', '2021-10-08 12:39:51', NULL, '2021-10-06 12:40:09'),
(2, 'sss', 81, '983073', NULL, 10, '111', 0, 0, 0, '2021-12-27 06:06:33', '2022-01-19 06:06:33', NULL, '2021-12-27 06:07:56');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int NOT NULL,
  `entity_id` tinyint NOT NULL COMMENT '1-about,\r\n2-footer',
  `slug` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `key` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `entity_id`, `slug`, `key`, `value`, `created_at`) VALUES
(4, 0, 'درباره-یوزدکالا', 'درباره یوزدکالا', '<p>لورم ایپسوم</p>\r\n', '2021-09-28 17:03:31');

-- --------------------------------------------------------

--
-- Table structure for table `site_contents`
--

CREATE TABLE `site_contents` (
  `id` int NOT NULL,
  `tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `update_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int NOT NULL,
  `small_text` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `linktype` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT '',
  `link` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT '',
  `product_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `sort` tinyint DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `small_text`, `linktype`, `link`, `product_id`, `category_id`, `sort`, `status`, `description`, `created_at`) VALUES
(6, '  ', 'category', 'http://google.com', 0, 64, 0, 1, '', '2021-11-13 09:44:50'),
(7, ' جشن خردادگان مبارک باد!  ', 'link', 'http://google.com', 0, 0, 0, 1, 'جشن خردادگان یکی از جشنهای اساطیری و کهنِ ایران‌زمین می‌باشد.', '2021-11-13 09:55:20'),
(9, 'سرور های hp', 'link', 'hhhhhhh', 33, 0, 0, 0, 'سرور های hp', '2021-11-17 09:14:16');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int NOT NULL,
  `city_id` int UNSIGNED DEFAULT NULL,
  `suppliers_lavel` tinyint DEFAULT '0',
  `logo` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `company` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `side` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `address` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `postal_code` int DEFAULT NULL,
  `phone` int NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `payment_methods` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `notes` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `taggables`
--

CREATE TABLE `taggables` (
  `id` int NOT NULL,
  `entity_id` int NOT NULL,
  `entity_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `tag_id` int NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE `tags` (
  `id` int NOT NULL,
  `tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `tag`, `created_at`) VALUES
(1, 'سرور', '2021-11-08 05:50:01'),
(2, 'هارد ', '2021-11-08 05:50:16'),
(3, 'تلفن تحت شبکه', '2021-11-10 15:00:03'),
(4, 'سوئیچ شبکه', '2021-12-13 14:35:20');

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `id` int UNSIGNED NOT NULL,
  `token` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL COMMENT 'session save',
  `message` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `status` tinyint(1) DEFAULT '1',
  `type` tinyint(1) DEFAULT '1' COMMENT 'question = 1 &&  answer = 0',
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `city_id` int UNSIGNED DEFAULT NULL,
  `province_id` int UNSIGNED DEFAULT NULL,
  `user_level` tinyint DEFAULT '1' COMMENT '0=Admin,\r\n1=Bronze,\r\n2=Silver,\r\n3=Gold,\r\n4=Platinum,\r\n5=Titanium,\r\n',
  `phone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `first_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `last_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `company` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `jobtitle` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `national_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `postal_code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `address` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `birthday` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `bank_name` tinyint UNSIGNED DEFAULT NULL,
  `bank_number` bigint UNSIGNED DEFAULT NULL,
  `ip` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_persian_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_persian_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `city_id`, `province_id`, `user_level`, `phone`, `email`, `first_name`, `last_name`, `company`, `jobtitle`, `national_code`, `postal_code`, `address`, `birthday`, `gender`, `status`, `bank_name`, `bank_number`, `ip`, `email_verified_at`, `created_at`, `updated_at`) VALUES
(73, NULL, 0, 0, '09363175161', 'sn7091@yahoo.com', 'سیاوش', 'نوروزی', NULL, NULL, NULL, NULL, '', NULL, NULL, 1, NULL, NULL, NULL, NULL, '2021-10-26 09:17:57', NULL),
(76, 1, 1, 0, '09369532227', 'moon.star125@yahoo.com', 'میثاق', 'محرری', 'مفتاح رایانه افزار', 'برنامه نویس', '0015158731', '1', 'تهرانپارس،', '722771648', 1, 1, NULL, NULL, NULL, NULL, '2021-11-27 09:26:38', NULL),
(80, NULL, NULL, 0, '09199837091', NULL, 'سیاوش', 'نوروزی', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2021-12-14 12:05:41', NULL),
(81, 100, 3, 0, '09128897603', '', 'مهرزاد', 'تاج کریمی', '', '', '', '1000000000', 'dfgzsdfgg', '1641208393', NULL, 1, NULL, NULL, NULL, NULL, '2021-12-14 14:20:00', NULL),
(82, NULL, NULL, 0, '09378454043', NULL, 'میثم', 'علی‌قلی‌پور', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2021-12-14 14:20:00', NULL),
(83, NULL, NULL, 0, '09124953770', NULL, 'سجاد', 'رضایی', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2021-12-14 14:20:00', NULL),
(84, NULL, NULL, 0, '09359312383', NULL, 'علی', 'حریرساز', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, '2021-12-14 14:21:59', NULL),
(85, 301, 8, 1, '091288976063', ' mehrzadth@gmail.com', 'مهرزاد', 'تاج کریمی ', NULL, NULL, '0073591521', '072012346', 'مهراباد جنوبی خیابان رجبی ', NULL, NULL, 1, NULL, NULL, NULL, NULL, '2022-01-08 05:48:13', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `wish_lists`
--

CREATE TABLE `wish_lists` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `entity_id` int NOT NULL,
  `entity_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_persian_ci NOT NULL,
  `ctreated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_persian_ci;

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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`);

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
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_users`
--
ALTER TABLE `permission_users`
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
-- Indexes for table `product_coupons`
--
ALTER TABLE `product_coupons`
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
-- Indexes for table `product_tags`
--
ALTER TABLE `product_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relateds`
--
ALTER TABLE `relateds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_users`
--
ALTER TABLE `role_users`
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
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `taggables`
--
ALTER TABLE `taggables`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
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
-- Indexes for table `wish_lists`
--
ALTER TABLE `wish_lists`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `active_codes`
--
ALTER TABLE `active_codes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=366;

--
-- AUTO_INCREMENT for table `activity_log`
--
ALTER TABLE `activity_log`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=526;

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
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT for table `category_blogs`
--
ALTER TABLE `category_blogs`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `category_discounts`
--
ALTER TABLE `category_discounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=252;

--
-- AUTO_INCREMENT for table `category_samples`
--
ALTER TABLE `category_samples`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `discounts`
--
ALTER TABLE `discounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=261;

--
-- AUTO_INCREMENT for table `permission_users`
--
ALTER TABLE `permission_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `photos`
--
ALTER TABLE `photos`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=327;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=323;

--
-- AUTO_INCREMENT for table `product_coupons`
--
ALTER TABLE `product_coupons`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `product_discounts`
--
ALTER TABLE `product_discounts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=126;

--
-- AUTO_INCREMENT for table `product_samples`
--
ALTER TABLE `product_samples`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `product_tags`
--
ALTER TABLE `product_tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `relateds`
--
ALTER TABLE `relateds`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `role_users`
--
ALTER TABLE `role_users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `samples`
--
ALTER TABLE `samples`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `site_contents`
--
ALTER TABLE `site_contents`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `taggables`
--
ALTER TABLE `taggables`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tickets`
--
ALTER TABLE `tickets`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `wish_lists`
--
ALTER TABLE `wish_lists`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;