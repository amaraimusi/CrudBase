-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2020-09-09 21:54:59
-- サーバのバージョン： 10.4.13-MariaDB
-- PHP のバージョン: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- データベース: `crud_base_laravel7`
--

-- --------------------------------------------------------

--
-- テーブルの構造 `app_configs`
--

CREATE TABLE `app_configs` (
  `id` int(11) NOT NULL,
  `key_code` varchar(50) NOT NULL COMMENT 'キー',
  `val1` int(11) DEFAULT NULL COMMENT '値1',
  `text1` varchar(1000) DEFAULT NULL COMMENT 'テキスト1',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新者',
  `ip_addr` varchar(40) DEFAULT NULL COMMENT 'IPアドレス',
  `modified` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `app_configs`
--

INSERT INTO `app_configs` (`id`, `key_code`, `val1`, `text1`, `update_user`, `ip_addr`, `modified`) VALUES
(1, 'apy_type_id_google', 1, NULL, NULL, NULL, '2019-05-28 11:44:57'),
(2, 'apy_type_id_yahoo', 2, NULL, NULL, NULL, '2019-05-28 11:49:51');

-- --------------------------------------------------------

--
-- テーブルの構造 `butas`
--

CREATE TABLE `butas` (
  `id` int(11) NOT NULL,
  `buta_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort_no` int(11) DEFAULT 0 COMMENT '順番',
  `delete_flg` tinyint(1) DEFAULT 0 COMMENT '無効フラグ',
  `update_user` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '更新者',
  `ip_addr` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT 'IPアドレス',
  `created` datetime DEFAULT NULL COMMENT '生成日時',
  `modified` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `butas`
--

INSERT INTO `butas` (`id`, `buta_name`, `sort_no`, `delete_flg`, `update_user`, `ip_addr`, `created`, `modified`) VALUES
(1, 'ワートン', 0, 0, NULL, NULL, NULL, '2020-08-29 07:52:43'),
(2, 'アグー', 0, 0, NULL, NULL, NULL, '2020-08-29 07:55:12'),
(3, '金貨豚', 0, 0, NULL, NULL, NULL, '2020-08-29 07:55:12');

-- --------------------------------------------------------

--
-- テーブルの構造 `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- テーブルの構造 `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2019_08_19_000000_create_failed_jobs_table', 1),
(3, '2020_07_02_075049_create_sessions_table', 1);

-- --------------------------------------------------------

--
-- テーブルの構造 `nekos`
--

CREATE TABLE `nekos` (
  `id` int(11) NOT NULL,
  `neko_val` int(11) DEFAULT NULL,
  `neko_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `neko_date` date DEFAULT NULL,
  `neko_group` int(11) DEFAULT NULL COMMENT '猫種別',
  `neko_dt` datetime DEFAULT NULL,
  `neko_flg` tinyint(4) DEFAULT 0 COMMENT 'ネコフラグ',
  `img_fn` varchar(256) DEFAULT NULL COMMENT '画像ファイル名',
  `note` text CHARACTER SET utf8 DEFAULT '' COMMENT '備考',
  `sort_no` int(11) DEFAULT 0 COMMENT '順番',
  `delete_flg` tinyint(1) DEFAULT 0 COMMENT '無効フラグ',
  `update_user` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '更新者',
  `ip_addr` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT 'IPアドレス',
  `created` datetime DEFAULT NULL COMMENT '生成日時',
  `modified` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `nekos`
--

INSERT INTO `nekos` (`id`, `neko_val`, `neko_name`, `neko_date`, `neko_group`, `neko_dt`, `neko_flg`, `img_fn`, `note`, `sort_no`, `delete_flg`, `update_user`, `ip_addr`, `created`, `modified`) VALUES
(1, 2000, 'おキャット様', '2014-04-01', 2, '2014-12-12 00:00:00', 0, 'DSC_0010.jpg', '大きな\n猫', 24, 1, 'kani', '126.219.137.211', NULL, '2020-07-03 06:00:53'),
(2, 2000, '三毛A', '2014-04-02', 3, '2014-12-12 00:00:01', 0, '', '', 32, 1, 'kani', '126.219.137.211', NULL, '2019-02-17 14:00:29'),
(4, 2000, 'シャム猫', '2014-04-04', 0, '2014-12-12 00:00:03', 0, '', '', 38, 1, 'kani', '126.219.137.211', NULL, '2020-07-03 07:44:41'),
(5, 2000, 'おキャット様2', '2014-04-03', NULL, '2014-12-12 00:00:02', 0, '', '', 35, 1, 'kani', '126.219.137.211', NULL, '2020-07-03 09:06:16'),
(6, 3, 'ari', '2014-04-03', 2, '2014-12-12 00:00:02', 0, '', '', 40, 1, 'kani', '126.219.137.211', NULL, '2019-02-17 14:00:29'),
(7, 3, 'tori', '2014-04-03', NULL, '2014-12-12 00:00:02', 0, '', '', 41, 1, 'kani', '126.219.137.211', NULL, '2019-02-17 14:00:29'),
(8, 3, 'kame', '2014-04-03', 2, '2014-12-12 00:00:02', 0, '', '', 42, 1, 'kani', '126.219.137.211', NULL, '2019-02-17 14:00:29'),
(9, 111, 'ゴボウ', '1970-01-01', 2, '2014-04-28 10:04:00', 0, '', '白菜とサラダセット', 43, 1, 'kani', '126.219.137.211', NULL, '2019-02-17 14:00:29'),
(10, 123, 'PANDA', '1970-01-01', NULL, '2014-04-28 10:05:00', 0, '', '', 39, 1, 'kani', '126.219.137.211', NULL, '2019-02-17 14:00:29'),
(11, 3, 'kame', '2018-04-03', 0, '2014-12-12 00:00:02', 0, '', '', 36, 1, 'kani', '126.219.137.211', '2018-03-09 09:00:20', '2019-02-17 14:00:29'),
(17, 3, 'kame', '2014-04-03', 0, '2014-12-12 00:00:02', 0, '', '', 33, 1, 'kani', '126.219.137.211', '2018-03-20 06:39:26', '2019-02-17 14:00:29'),
(19, 111, 'ニャーニャー', '2018-10-18', 5, '2018-03-31 14:18:59', 0, '', 'a', 34, 1, 'kani', '126.219.137.211', '2018-03-20 06:41:48', '2019-02-17 14:00:29'),
(20, 3, 'kame2', '2014-04-03', NULL, '2014-12-12 00:00:02', 0, '', '', 37, 1, 'kani', '126.219.137.211', '2018-03-20 07:45:08', '2019-02-17 14:00:29'),
(22, 111, 'ハマダイコン', '1970-01-01', 2, '2014-04-29 10:04:00', 0, '', '砂浜に生える大根', 44, 1, 'kani', '::1', '2018-03-30 09:46:18', '2018-03-30 00:46:18'),
(26, 1, '', NULL, NULL, NULL, 0, '26_DSC_0037.jpg', '', 14, 1, 'kani', '126.219.137.211', '2018-04-19 22:28:39', '2019-02-17 13:57:43'),
(29, 124, 'ビッグキャット', NULL, NULL, NULL, 0, '29_DSC_0037.jpg', '', 17, 1, 'kani', '126.219.137.211', '2018-04-19 22:57:16', '2019-02-17 14:00:29'),
(37, NULL, 'ロイヤルアナロスタン', NULL, NULL, NULL, 0, '', '', 45, 1, 'kani', '126.219.137.211', '2018-04-19 23:28:36', '2019-02-17 14:00:29'),
(38, NULL, 'ルガルガン', NULL, NULL, NULL, 0, '', '', 46, 1, 'kani', '126.219.137.211', '2018-04-19 23:31:42', '2019-02-17 14:00:29'),
(39, NULL, 'pokemon', NULL, NULL, NULL, 0, '', '', 47, 1, 'kani', '126.219.137.211', '2018-04-19 23:33:35', '2019-02-17 14:00:29'),
(40, NULL, '', NULL, NULL, NULL, 0, '', '', 48, 1, 'kani', '126.219.137.211', '2018-04-19 23:34:50', '2020-06-29 03:23:23'),
(41, NULL, 'AFD', NULL, NULL, NULL, 0, '', '', 49, 1, 'kani', '126.219.137.211', '2018-04-19 23:36:30', '2019-02-17 14:00:29'),
(42, NULL, 'ヌガー', NULL, NULL, NULL, 0, '', '', 31, 1, 'kani', '126.219.137.211', '2018-04-19 23:37:50', '2019-02-17 14:00:29'),
(43, NULL, 'タヌキオジサン', NULL, 2, NULL, 0, '', '', 30, 1, 'kani', '126.219.137.211', '2018-04-19 23:38:45', '2019-02-17 14:00:29'),
(44, NULL, 'ライオン', NULL, NULL, NULL, 0, '', '', 29, 1, 'kani', '126.219.137.211', '2018-04-19 23:46:47', '2019-02-17 14:00:29'),
(45, NULL, 'バケオン', NULL, NULL, NULL, 0, '', '', 28, 1, 'kani', '126.219.137.211', '2018-04-19 23:46:57', '2019-02-17 14:00:29'),
(46, NULL, 'A', NULL, NULL, NULL, 0, 'DSC_0010.jpg', '', 27, 1, 'kani', '126.219.137.211', '2018-04-20 07:28:28', '2019-02-17 14:00:29'),
(47, NULL, 'ビッグマスター', '2018-04-17', NULL, NULL, 0, 'DSC_0037 (1).jpg', '', 26, 1, 'kani', '126.219.137.211', '2018-04-20 07:28:43', '2019-02-17 14:00:29'),
(49, NULL, 'モウセン', NULL, NULL, NULL, 0, '', '', 50, 1, 'kani', '126.219.137.211', '2018-04-20 07:31:06', '2019-02-17 14:00:29'),
(50, NULL, 'TEST\\\'', NULL, NULL, NULL, 0, 'DSC_0037.jpg', 'TEST\\nTEST2', 25, 1, 'kani', '126.219.137.211', '2018-04-20 10:45:34', '2019-02-17 14:00:29'),
(51, NULL, 'TEST2', NULL, NULL, NULL, 0, '', '', 37, 1, 'kani', '126.219.137.211', '2018-04-20 10:46:21', '2019-02-17 14:00:29'),
(55, 124, 'アカマムシ', NULL, 1, NULL, 0, '', '', 23, 1, 'kani', '126.219.137.211', '2018-04-24 07:06:22', '2019-02-17 14:00:29'),
(56, 1, '\'\' = \'\'', '2014-04-01', 2, '2014-12-12 00:00:00', 0, '', '大きな\n猫', 22, 1, 'kani', '126.219.137.211', '2018-04-24 13:56:44', '2019-02-17 14:00:29'),
(57, 1, '\'\' = \'\'', '2014-04-01', 2, '2014-12-12 00:00:00', 0, '', '大きな\n猫', 21, 1, 'kani', '126.219.137.211', '2018-04-24 13:58:23', '2019-02-17 14:00:29'),
(60, NULL, 'A2', NULL, 1, NULL, 0, 'DSC_0010.jpg', '', 19, 1, 'kani', '126.219.137.211', '2018-04-24 14:01:49', '2019-02-17 14:00:29'),
(63, 300, 'ザ・ビッグ2', NULL, 1, NULL, 0, 'DSC_0037 (1).jpg', '', 18, 1, 'kani', '126.219.137.211', '2018-04-26 06:46:01', '2019-02-17 14:00:29'),
(64, 123, '<input />', NULL, 1, NULL, 0, '53_hyomon.jpg', '', 12, 1, 'kani', '126.219.137.211', '2018-08-22 16:49:38', '2019-02-17 13:57:55'),
(65, 1, 'シリケンイモリ２', '2018-09-30', 1, NULL, 1, '58_2017-11-24_123306_DSC_0066.jpg', '', 10, 1, 'kani', '126.219.137.211', '2018-08-22 17:11:38', '2019-02-17 14:00:29'),
(66, 1, 'オロッティーモ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '66_DSC_0054 (1).jpg', '', 25, 0, '', '::1', '2018-08-27 16:31:59', '2020-08-11 23:13:33'),
(67, 22, '<input />', NULL, NULL, NULL, 0, '67_DSC_0037 (1).jpg', '', 13, 1, 'kani', '126.219.137.211', '2018-08-27 19:33:05', '2019-02-17 13:57:58'),
(69, 0, 'TEST', '2018-10-16', 1, NULL, 0, '1498312069338.jpg', '<input />\"neko\",\'inu\'\n\n全長オス14センチメートル、メス18センチメートル[4]。頭胴長オス4.6-7.5センチメートル、メス5.2-8センチメートル[4]。背面の体色は黒や黒褐色、暗褐色[3][4]。背面に地衣類状の明色斑や、正中線に沿って橙色の筋模様が入る個体もいるなど変異が大きい[4]。 腹面の色彩は赤色や黄色で、不規則に黒い斑紋が入る個体もいる[3]。指趾下面の体色は明色[3][6]。\n\n繁殖期になるとオスの尾は幅広くなる[4]。\n\nシリケンイモリは歩くのが遅いのですぐ捕まる。捕食されないのがなぞであるが、おそらく皮膚のテトロドトキシンが関係しているのかな。\n\nうーん。わからん。', 9, 1, 'kani', '126.219.137.211', '2018-10-02 22:01:00', '2019-02-17 14:00:29'),
(75, 99, 'ガーラ', '2018-10-18', 2, NULL, 1, 'hyomon.jpg', 'TEST2', 8, 1, 'kani', '126.219.137.211', '2018-10-10 13:51:08', '2019-02-17 14:00:29'),
(76, 1, 'シリケンイモリ２', '2018-09-30', 1, NULL, 1, 'DSC_0748.jpg', 'TEST', 11, 1, 'kani', '126.219.137.211', '2018-10-18 07:55:26', '2019-02-17 14:00:29'),
(77, 0, 'A223', '0000-00-00', 1, '0000-00-00 00:00:00', 0, '2018-10-01 (30).png', 'TET', 3, 0, '', '::1', '2018-10-18 15:58:19', '2020-08-11 23:13:33'),
(80, 999, 'アヒル', '2018-12-02', 8, '0000-00-00 00:00:00', 1, 'rsc/img/img_fn/y2019/m02/orig/20190217225931_DSC_0679.jpg', 'TEST', 46, 0, 'kani', '::1', '2018-10-19 21:01:01', '2020-08-11 23:13:33'),
(82, 1, 'オロッティーモ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '66_DSC_0054 (1).jpg', '', 19, 0, '', '::1', '2018-10-21 22:55:12', '2020-08-11 23:13:33'),
(83, 999, '大きなネコ', '2018-12-14', 2, '0000-00-00 00:00:00', 1, 'rsc/img/img_fn/y2019/m02/orig/20190217225845_DSC_0037.jpg', 'TEST', 23, 0, 'kani', '::1', '2018-10-21 23:01:10', '2020-08-11 23:12:50'),
(88, 999, 'ガーラ', '2018-12-31', 8, '0000-00-00 00:00:00', 1, 'rsc/img/img_fn/y2019/m02/orig/20190217225951_DSC_0700.jpg', 'TEST', 34, 0, 'kani', '::1', '2018-10-22 07:30:22', '2020-08-11 23:13:33'),
(89, 123, 'シリケンイモリ', '2018-12-02', 0, '0000-00-00 00:00:00', 1, 'rsc/img/img_fn/y2019/m02/orig/20190217225530_imori.jpg', 'TE', 27, 0, '', '::1', '2018-10-22 07:30:44', '2020-08-11 23:12:50'),
(90, 123, 'ヒョウモン', '2018-12-07', 0, '0000-00-00 00:00:00', 1, 'rsc/img/img_fn/y2019/m02/orig/20190217225552_53_hyomon.jpg', 'ひょー', 50, 0, '', '::1', '2018-12-01 07:21:06', '2020-08-11 23:13:33'),
(91, 123, 'たぬきA', NULL, NULL, NULL, 0, '', '', 51, 1, NULL, '::1', '2020-06-13 22:14:56', '2020-06-13 13:22:21'),
(92, 123, 'たぬき２', '0000-00-00', 0, '0000-00-00 00:00:00', 0, 'rsc/img/img_fn/y2020/m06/orig/20200616161522_tamamusi.jpg', '', 22, 0, '', '::1', '2020-06-13 22:16:53', '2020-08-11 23:13:33'),
(93, 456, 'いのしし２', NULL, NULL, NULL, 0, '', '', 7, 1, NULL, '::1', '2020-06-13 22:16:53', '2020-06-17 04:38:27'),
(94, 123, 'たぬき', NULL, NULL, NULL, 0, '', '', 8, 1, NULL, '::1', '2020-06-13 22:19:20', '2020-06-17 04:38:51'),
(96, NULL, '', NULL, 1, NULL, 0, '', '', 0, 0, 'kani', '::1', '2020-06-17 13:38:38', '2020-08-15 15:27:05'),
(97, NULL, '', NULL, 1, NULL, 0, '', '', -1, 1, NULL, '::1', '2020-06-17 13:38:40', '2020-06-17 04:38:51'),
(98, 123, '大きな猫10', '2020-02-02', 1, '2012-12-12 12:12:12', 0, '', '', 48, 0, 'kani', '::1', '2020-06-17 13:39:01', '2020-08-11 23:13:33'),
(99, 1234, 'ネズミキラー', '0000-00-00', 5, '0000-00-00 00:00:00', 0, '', '', 40, 0, 'kani', '::1', NULL, '2020-08-11 23:13:33'),
(100, 1001, 'ホンハブXｓｓ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 28, 0, 'kani', '::1', '0000-00-00 00:00:00', '2020-08-11 23:13:33'),
(101, 1002, 'ヒメハブ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 16, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(102, 1001, 'ホンハブ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 10, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(103, 1002, 'ヒメハブ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 5, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(104, 1003, '愚かなる猫おじさんの野望', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 43, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(108, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 41, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(109, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 37, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(110, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 35, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(111, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 31, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(112, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 29, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(113, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 23, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(114, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 17, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(115, 123, 'うなぎ', '2020-02-02', 1, '2012-12-12 12:12:12', 0, '', '', 13, 0, 'kani', '::1', NULL, '2020-08-11 23:13:33'),
(116, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 11, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(117, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 7, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(118, 0, 'ヌガー', '0000-00-00', NULL, '0000-00-00 00:00:00', 0, '', '', 1, 0, '', '::1', NULL, '2020-08-15 15:21:34'),
(119, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 21, 0, '', '::1', NULL, '2020-08-11 23:10:36'),
(120, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 24, 0, '', '::1', NULL, '2020-08-11 23:12:50'),
(121, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 25, 0, '', '::1', NULL, '2020-08-11 23:12:50'),
(122, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 28, 0, '', '::1', NULL, '2020-08-11 23:12:50'),
(123, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 30, 0, '', '::1', NULL, '2020-08-11 23:12:50'),
(124, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 49, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(125, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 47, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(126, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 44, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(127, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 38, 0, '', '::1', NULL, '2020-08-11 23:12:50'),
(128, 0, 'うなぎ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 32, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(129, 123, 'うなぎ', '2020-02-02', 1, '2012-12-12 12:12:12', 0, '', '', 26, 0, 'kani', '::1', NULL, '2020-08-11 23:13:33'),
(130, 123, 'うなぎ', '2020-02-02', 1, '2012-12-12 12:12:12', 0, '', '', 20, 0, 'kani', '::1', NULL, '2020-08-11 23:13:33'),
(131, 123, 'うなぎ', '2020-02-02', 1, '2012-12-12 12:12:12', 0, '', '', 14, 0, 'kani', '::1', NULL, '2020-08-11 23:13:33'),
(132, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 8, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(133, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 2, 1, 'kani', '::1', NULL, '2020-08-15 15:24:24'),
(134, 123, 'うなぎ', '2020-02-02', 1, '2012-12-12 12:12:12', 0, '', '', 45, 0, 'kani', '::1', NULL, '2020-08-11 23:13:33'),
(135, 123, 'うなぎ', '2020-02-02', 1, '2012-12-12 12:12:12', 0, '', '', 42, 0, 'kani', '::1', NULL, '2020-08-11 23:13:33'),
(136, 123, 'うなぎ', '2020-02-02', 1, '2012-12-12 12:12:12', 0, '', '', 39, 0, 'kani', '::1', NULL, '2020-08-11 23:13:33'),
(137, 0, 'うなぎ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 36, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(138, 0, 'うなぎ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 33, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(139, 0, 'うなぎ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 30, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(140, 123, 'うなぎ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 27, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(141, 123, 'うなぎ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 24, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(142, 123, 'うなぎ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 21, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(143, 123, 'うなぎ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 18, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(144, 123, 'うなぎ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 15, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(145, 123, 'うなぎ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 12, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(146, 0, '', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 9, 0, '', '::1', NULL, '2020-08-11 23:13:33'),
(147, 123, 'うなぎ', '2020-02-02', 1, '2012-12-12 12:12:12', 0, '', '', 6, 0, 'kani', '::1', NULL, '2020-08-11 23:13:33'),
(148, 123, '', '2020-02-02', 1, '2012-12-12 12:12:12', 0, '', '', 4, 0, 'kani', '::1', NULL, '2020-08-11 23:13:33'),
(149, 123, '', '2020-02-02', 1, '2012-12-12 12:12:12', 0, '', '', 1, 1, 'kani', '::1', NULL, '2020-08-15 15:24:14'),
(150, 123, 'さば', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 3, 0, '', '::1', NULL, '2020-08-11 23:12:17'),
(151, 123, 'うなぎ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 2, 1, 'kani', '::1', NULL, '2020-08-15 15:24:24'),
(152, 123, 'うなぎ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 4, 0, '', '::1', NULL, '2020-08-11 23:12:17'),
(156, 123, 'うなぎ', '0000-00-00', 1, '0000-00-00 00:00:00', 0, '', '', 5, 0, '', '::1', NULL, '2020-08-11 23:12:17'),
(157, 123, 'うなぎ', '0000-00-00', 1, '0000-00-00 00:00:00', 0, '', '', 6, 0, '', '::1', '2020-06-17 13:39:01', '2020-08-11 23:12:17'),
(158, 123, 'うなぎsss', '0000-00-00', 1, '0000-00-00 00:00:00', 0, '', '', 7, 0, '', '::1', '2020-06-17 13:39:01', '2020-08-11 23:12:17'),
(162, 123, 'うなぎ', '0000-00-00', 1, '0000-00-00 00:00:00', 0, '', '', 8, 0, '', '::1', NULL, '2020-08-11 23:12:17'),
(164, 0, 'アカトンボ', '0000-00-00', 3, '0000-00-00 00:00:00', 0, '', '', 9, 0, '', '::1', NULL, '2020-08-11 23:12:17'),
(165, 0, '灰色のにゃんだるふ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 10, 0, '', '::1', NULL, '2020-08-11 23:12:17'),
(166, 0, '機動戦士ニャンダム', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 11, 0, '', '::1', NULL, '2020-08-11 23:12:17'),
(167, 0, '灰色のにゃんだるふ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 12, 0, '', '::1', NULL, '2020-08-11 23:12:17'),
(168, 0, '機動戦士ニャンダム', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 13, 0, '', '::1', NULL, '2020-08-11 23:12:17'),
(169, 0, '灰色のにゃんだるふ', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 14, 0, '', '::1', NULL, '2020-08-11 23:12:17'),
(170, 0, '機動戦士ニャンダム', '0000-00-00', 0, '0000-00-00 00:00:00', 0, '', '', 15, 0, '', '::1', NULL, '2020-08-11 23:12:17'),
(171, 0, 'あおねこ', '0000-00-00', 6, '0000-00-00 00:00:00', 0, '', '', 16, 0, '', '::1', NULL, '2020-08-11 23:12:17'),
(172, 1234, 'ネズミキラー', '0000-00-00', 5, '0000-00-00 00:00:00', 0, '', '', 17, 0, '', '::1', NULL, '2020-08-11 23:12:17'),
(173, 123, '大きな猫2', '2020-02-02', 1, '2012-12-12 12:12:12', 0, '', '', 18, 0, 'kani', '::1', '2020-06-17 13:39:01', '2020-08-11 23:12:17'),
(174, 0, '125', '0000-00-00', 1, '0000-00-00 00:00:00', 0, '', '', 19, 0, '', '::1', NULL, '2020-08-11 23:12:17'),
(175, 0, '333', '0000-00-00', 1, '0000-00-00 00:00:00', 0, '', '', 20, 0, '', '::1', NULL, '2020-08-11 23:12:17'),
(176, 0, 'ガーラ２', '0000-00-00', 1, '0000-00-00 00:00:00', 0, '', '', 22, 0, '', '::1', NULL, '2020-08-11 23:12:50'),
(177, 0, '青猫', '0000-00-00', 1, '0000-00-00 00:00:00', 0, 'rsc/img/img_fn/y2020/m08/orig/20200806152201_IMG_0462.JPG', '', -1, 1, 'kani', '::1', NULL, '2020-08-15 15:27:12'),
(179, 0, 'おおやまねこ', '0000-00-00', 6, '0000-00-00 00:00:00', 0, '', '', -3, 0, 'kani', '::1', '0000-00-00 00:00:00', '2020-08-15 15:27:05'),
(180, 0, '青猫２', '0000-00-00', 1, '0000-00-00 00:00:00', 0, '', '', 26, 0, '', '::1', NULL, '2020-08-11 23:12:50'),
(181, 0, 'おおやまねこ', '0000-00-00', 3, '0000-00-00 00:00:00', 0, '', '', -3, 1, 'kani', '::1', NULL, '2020-08-15 15:27:12'),
(182, 0, 'TEST', '0000-00-00', 1, '0000-00-00 00:00:00', 0, 'rsc/img/img_fn/y2020/m08/orig/20200804141915_ga-ra.jpg', '', 29, 0, '', '::1', '2020-08-03 12:28:56', '2020-08-11 23:12:50'),
(183, 0, 'あしばー', '0000-00-00', 1, '0000-00-00 00:00:00', 0, '', '', 0, 0, NULL, '::1', '2020-08-13 16:28:45', '2020-08-13 07:28:45'),
(184, 101, 'モンティキャット', NULL, NULL, NULL, 0, NULL, '', 52, 0, 'kani', '::1', '2020-08-25 10:42:55', '2020-08-25 01:42:55'),
(185, 102, 'エビントゥーラー', NULL, NULL, NULL, 0, NULL, '', 53, 0, 'kani', '::1', '2020-08-25 10:42:55', '2020-08-25 01:42:55'),
(186, 101, 'モンティキャット', NULL, NULL, NULL, 0, NULL, '', 54, 0, 'kani', '::1', '2020-08-25 10:43:57', '2020-08-25 01:43:57'),
(187, 102, 'エビントゥーラー', NULL, NULL, NULL, 0, NULL, '', 55, 0, 'kani', '::1', '2020-08-25 10:43:57', '2020-08-25 01:43:57'),
(188, 101, 'モンティキャット', NULL, NULL, NULL, 0, NULL, '', 56, 0, 'kani', '::1', '2020-08-25 10:44:35', '2020-08-25 01:44:35'),
(189, 102, 'エビントゥーラー', NULL, NULL, NULL, 0, NULL, '', 57, 0, 'kani', '::1', '2020-08-25 10:44:35', '2020-08-25 01:44:35'),
(190, 101, 'モンティキャット', NULL, NULL, NULL, 0, NULL, '', 58, 0, 'kani', '::1', '2020-08-25 10:44:57', '2020-08-25 01:44:57'),
(191, 102, 'エビントゥーラー', NULL, NULL, NULL, 0, NULL, '', 59, 0, 'kani', '::1', '2020-08-25 10:44:57', '2020-08-25 01:44:57'),
(192, 500, 'サメハダー', NULL, NULL, NULL, 0, NULL, '', 60, 0, 'kani', '::1', '2020-08-25 10:47:59', '2020-08-25 01:47:59'),
(193, 600, 'ガブリアス', NULL, NULL, NULL, 0, NULL, '', 61, 0, 'kani', '::1', '2020-08-25 10:47:59', '2020-08-25 01:47:59');

-- --------------------------------------------------------

--
-- テーブルの構造 `neko_groups`
--

CREATE TABLE `neko_groups` (
  `id` int(11) NOT NULL,
  `neko_group_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `sort_no` int(11) DEFAULT 0 COMMENT '順番',
  `delete_flg` tinyint(1) DEFAULT 0 COMMENT '無効フラグ',
  `update_user` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '更新者',
  `ip_addr` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT 'IPアドレス',
  `created` datetime DEFAULT NULL COMMENT '生成日時',
  `modified` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- テーブルのデータのダンプ `neko_groups`
--

INSERT INTO `neko_groups` (`id`, `neko_group_name`, `sort_no`, `delete_flg`, `update_user`, `ip_addr`, `created`, `modified`) VALUES
(1, 'ペルシャ', 0, 0, NULL, NULL, NULL, '2018-04-22 06:57:53'),
(2, 'ボンベイ', 0, 0, NULL, NULL, NULL, '2018-04-22 06:57:53'),
(3, '三毛', 0, 0, NULL, NULL, NULL, '2018-04-22 06:58:15'),
(4, 'シャム', 0, 0, NULL, NULL, NULL, '2018-04-22 06:58:15'),
(5, 'キジトラ', 0, 0, NULL, NULL, NULL, '2018-04-22 06:58:39'),
(6, 'スフィンクス', 0, 0, NULL, NULL, NULL, '2018-04-22 06:58:39'),
(7, 'メインクーン', 0, 0, NULL, NULL, NULL, '2018-04-22 06:59:21'),
(8, 'ベンガル', 0, 0, NULL, NULL, NULL, '2018-04-22 06:59:21');

-- --------------------------------------------------------

--
-- テーブルの構造 `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('nPXmjYX5G3Zs1N3zXgZ9u89XADUNLgPfiXGQJ4BP', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36', 'YTo5OntzOjY6Il90b2tlbiI7czo0MDoiemlDQkNQOUlORWd1eUd6SkFFc0I3M215dm00TGIxSVN5NEZhOUI4eSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czoyNDoibmVrb19zZXNfcGFnZV92ZXJzaW9uX2NiIjtzOjM6IjEuMCI7czoyMToibmVrb19zb3J0ZXJfZmllbGREYXRhIjthOjI6e3M6MzoiZGVmIjthOjE1OntzOjI6ImlkIjthOjQ6e3M6NDoibmFtZSI7czoyOiJJRCI7czo5OiJyb3dfb3JkZXIiO3M6NzoiTmVrby5pZCI7czo4OiJjbG1fc2hvdyI7aToxO3M6MTE6ImNsbV9zb3J0X25vIjtpOjA7fXM6ODoibmVrb192YWwiO2E6NDp7czo0OiJuYW1lIjtzOjEyOiLjg43jgrPmlbDlgKQiO3M6OToicm93X29yZGVyIjtzOjEzOiJOZWtvLm5la29fdmFsIjtzOjg6ImNsbV9zaG93IjtpOjA7czoxMToiY2xtX3NvcnRfbm8iO2k6MTt9czo5OiJuZWtvX25hbWUiO2E6NDp7czo0OiJuYW1lIjtzOjEyOiLjg43jgrPlkI3liY0iO3M6OToicm93X29yZGVyIjtzOjE0OiJOZWtvLm5la29fbmFtZSI7czo4OiJjbG1fc2hvdyI7aToxO3M6MTE6ImNsbV9zb3J0X25vIjtpOjI7fXM6MTA6Im5la29fZ3JvdXAiO2E6NDp7czo0OiJuYW1lIjtzOjEyOiLjg43jgrPnqK7liKUiO3M6OToicm93X29yZGVyIjtzOjE1OiJOZWtvLm5la29fZ3JvdXAiO3M6ODoiY2xtX3Nob3ciO2k6MTtzOjExOiJjbG1fc29ydF9ubyI7aTozO31zOjk6Im5la29fZGF0ZSI7YTo0OntzOjQ6Im5hbWUiO3M6OToi44ON44Kz5pelIjtzOjk6InJvd19vcmRlciI7czoxNDoiTmVrby5uZWtvX2RhdGUiO3M6ODoiY2xtX3Nob3ciO2k6MTtzOjExOiJjbG1fc29ydF9ubyI7aTo0O31zOjc6Im5la29fZHQiO2E6NDp7czo0OiJuYW1lIjtzOjEyOiLjg43jgrPml6XmmYIiO3M6OToicm93X29yZGVyIjtzOjEyOiJOZWtvLm5la29fZHQiO3M6ODoiY2xtX3Nob3ciO2k6MTtzOjExOiJjbG1fc29ydF9ubyI7aTo1O31zOjg6Im5la29fZmxnIjthOjQ6e3M6NDoibmFtZSI7czoxNToi44ON44Kz44OV44Op44KwIjtzOjk6InJvd19vcmRlciI7czoxMzoiTmVrby5uZWtvX2ZsZyI7czo4OiJjbG1fc2hvdyI7aToxO3M6MTE6ImNsbV9zb3J0X25vIjtpOjY7fXM6NjoiaW1nX2ZuIjthOjQ6e3M6NDoibmFtZSI7czoyMToi55S75YOP44OV44Kh44Kk44Or5ZCNIjtzOjk6InJvd19vcmRlciI7czoxMToiTmVrby5pbWdfZm4iO3M6ODoiY2xtX3Nob3ciO2k6MTtzOjExOiJjbG1fc29ydF9ubyI7aTo3O31zOjQ6Im5vdGUiO2E6NDp7czo0OiJuYW1lIjtzOjY6IuWCmeiAgyI7czo5OiJyb3dfb3JkZXIiO3M6OToiTmVrby5ub3RlIjtzOjg6ImNsbV9zaG93IjtpOjA7czoxMToiY2xtX3NvcnRfbm8iO2k6ODt9czo3OiJzb3J0X25vIjthOjQ6e3M6NDoibmFtZSI7czo2OiLpoIbnlaoiO3M6OToicm93X29yZGVyIjtzOjEyOiJOZWtvLnNvcnRfbm8iO3M6ODoiY2xtX3Nob3ciO2k6MDtzOjExOiJjbG1fc29ydF9ubyI7aTo5O31zOjEwOiJkZWxldGVfZmxnIjthOjQ6e3M6NDoibmFtZSI7czoxMzoi5pyJ5Yq5L+eEoeWKuSI7czo5OiJyb3dfb3JkZXIiO3M6MTU6Ik5la28uZGVsZXRlX2ZsZyI7czo4OiJjbG1fc2hvdyI7aToxO3M6MTE6ImNsbV9zb3J0X25vIjtpOjEwO31zOjExOiJ1cGRhdGVfdXNlciI7YTo0OntzOjQ6Im5hbWUiO3M6OToi5pu05paw6ICFIjtzOjk6InJvd19vcmRlciI7czoxNjoiTmVrby51cGRhdGVfdXNlciI7czo4OiJjbG1fc2hvdyI7aTowO3M6MTE6ImNsbV9zb3J0X25vIjtpOjExO31zOjc6ImlwX2FkZHIiO2E6NDp7czo0OiJuYW1lIjtzOjIwOiLmm7TmlrBJUOOCouODieODrOOCuSI7czo5OiJyb3dfb3JkZXIiO3M6MTI6Ik5la28uaXBfYWRkciI7czo4OiJjbG1fc2hvdyI7aTowO3M6MTE6ImNsbV9zb3J0X25vIjtpOjEyO31zOjc6ImNyZWF0ZWQiO2E6NDp7czo0OiJuYW1lIjtzOjEyOiLnlJ/miJDml6XmmYIiO3M6OToicm93X29yZGVyIjtzOjEyOiJOZWtvLmNyZWF0ZWQiO3M6ODoiY2xtX3Nob3ciO2k6MDtzOjExOiJjbG1fc29ydF9ubyI7aToxMzt9czo4OiJtb2RpZmllZCI7YTo0OntzOjQ6Im5hbWUiO3M6MTI6IuabtOaWsOaXpeaZgiI7czo5OiJyb3dfb3JkZXIiO3M6MTM6Ik5la28ubW9kaWZpZWQiO3M6ODoiY2xtX3Nob3ciO2k6MTtzOjExOiJjbG1fc29ydF9ubyI7aToxNDt9fXM6NjoiYWN0aXZlIjthOjE1OntpOjA7YTo1OntzOjQ6Im5hbWUiO3M6MjoiSUQiO3M6OToicm93X29yZGVyIjtzOjc6Ik5la28uaWQiO3M6ODoiY2xtX3Nob3ciO2k6MTtzOjExOiJjbG1fc29ydF9ubyI7aTowO3M6MjoiaWQiO3M6MjoiaWQiO31pOjE7YTo1OntzOjQ6Im5hbWUiO3M6MTI6IuODjeOCs+aVsOWApCI7czo5OiJyb3dfb3JkZXIiO3M6MTM6Ik5la28ubmVrb192YWwiO3M6ODoiY2xtX3Nob3ciO2k6MDtzOjExOiJjbG1fc29ydF9ubyI7aToxO3M6MjoiaWQiO3M6ODoibmVrb192YWwiO31pOjI7YTo1OntzOjQ6Im5hbWUiO3M6MTI6IuODjeOCs+WQjeWJjSI7czo5OiJyb3dfb3JkZXIiO3M6MTQ6Ik5la28ubmVrb19uYW1lIjtzOjg6ImNsbV9zaG93IjtpOjE7czoxMToiY2xtX3NvcnRfbm8iO2k6MjtzOjI6ImlkIjtzOjk6Im5la29fbmFtZSI7fWk6MzthOjU6e3M6NDoibmFtZSI7czoxMjoi44ON44Kz56iu5YilIjtzOjk6InJvd19vcmRlciI7czoxNToiTmVrby5uZWtvX2dyb3VwIjtzOjg6ImNsbV9zaG93IjtpOjE7czoxMToiY2xtX3NvcnRfbm8iO2k6MztzOjI6ImlkIjtzOjEwOiJuZWtvX2dyb3VwIjt9aTo0O2E6NTp7czo0OiJuYW1lIjtzOjk6IuODjeOCs+aXpSI7czo5OiJyb3dfb3JkZXIiO3M6MTQ6Ik5la28ubmVrb19kYXRlIjtzOjg6ImNsbV9zaG93IjtpOjE7czoxMToiY2xtX3NvcnRfbm8iO2k6NDtzOjI6ImlkIjtzOjk6Im5la29fZGF0ZSI7fWk6NTthOjU6e3M6NDoibmFtZSI7czoxMjoi44ON44Kz5pel5pmCIjtzOjk6InJvd19vcmRlciI7czoxMjoiTmVrby5uZWtvX2R0IjtzOjg6ImNsbV9zaG93IjtpOjE7czoxMToiY2xtX3NvcnRfbm8iO2k6NTtzOjI6ImlkIjtzOjc6Im5la29fZHQiO31pOjY7YTo1OntzOjQ6Im5hbWUiO3M6MTU6IuODjeOCs+ODleODqeOCsCI7czo5OiJyb3dfb3JkZXIiO3M6MTM6Ik5la28ubmVrb19mbGciO3M6ODoiY2xtX3Nob3ciO2k6MTtzOjExOiJjbG1fc29ydF9ubyI7aTo2O3M6MjoiaWQiO3M6ODoibmVrb19mbGciO31pOjc7YTo1OntzOjQ6Im5hbWUiO3M6MjE6IueUu+WDj+ODleOCoeOCpOODq+WQjSI7czo5OiJyb3dfb3JkZXIiO3M6MTE6Ik5la28uaW1nX2ZuIjtzOjg6ImNsbV9zaG93IjtpOjE7czoxMToiY2xtX3NvcnRfbm8iO2k6NztzOjI6ImlkIjtzOjY6ImltZ19mbiI7fWk6ODthOjU6e3M6NDoibmFtZSI7czo2OiLlgpnogIMiO3M6OToicm93X29yZGVyIjtzOjk6Ik5la28ubm90ZSI7czo4OiJjbG1fc2hvdyI7aTowO3M6MTE6ImNsbV9zb3J0X25vIjtpOjg7czoyOiJpZCI7czo0OiJub3RlIjt9aTo5O2E6NTp7czo0OiJuYW1lIjtzOjY6IumghueVqiI7czo5OiJyb3dfb3JkZXIiO3M6MTI6Ik5la28uc29ydF9ubyI7czo4OiJjbG1fc2hvdyI7aTowO3M6MTE6ImNsbV9zb3J0X25vIjtpOjk7czoyOiJpZCI7czo3OiJzb3J0X25vIjt9aToxMDthOjU6e3M6NDoibmFtZSI7czoxMzoi5pyJ5Yq5L+eEoeWKuSI7czo5OiJyb3dfb3JkZXIiO3M6MTU6Ik5la28uZGVsZXRlX2ZsZyI7czo4OiJjbG1fc2hvdyI7aToxO3M6MTE6ImNsbV9zb3J0X25vIjtpOjEwO3M6MjoiaWQiO3M6MTA6ImRlbGV0ZV9mbGciO31pOjExO2E6NTp7czo0OiJuYW1lIjtzOjk6IuabtOaWsOiAhSI7czo5OiJyb3dfb3JkZXIiO3M6MTY6Ik5la28udXBkYXRlX3VzZXIiO3M6ODoiY2xtX3Nob3ciO2k6MDtzOjExOiJjbG1fc29ydF9ubyI7aToxMTtzOjI6ImlkIjtzOjExOiJ1cGRhdGVfdXNlciI7fWk6MTI7YTo1OntzOjQ6Im5hbWUiO3M6MjA6IuabtOaWsElQ44Ki44OJ44Os44K5IjtzOjk6InJvd19vcmRlciI7czoxMjoiTmVrby5pcF9hZGRyIjtzOjg6ImNsbV9zaG93IjtpOjA7czoxMToiY2xtX3NvcnRfbm8iO2k6MTI7czoyOiJpZCI7czo3OiJpcF9hZGRyIjt9aToxMzthOjU6e3M6NDoibmFtZSI7czoxMjoi55Sf5oiQ5pel5pmCIjtzOjk6InJvd19vcmRlciI7czoxMjoiTmVrby5jcmVhdGVkIjtzOjg6ImNsbV9zaG93IjtpOjA7czoxMToiY2xtX3NvcnRfbm8iO2k6MTM7czoyOiJpZCI7czo3OiJjcmVhdGVkIjt9aToxNDthOjU6e3M6NDoibmFtZSI7czoxMjoi5pu05paw5pel5pmCIjtzOjk6InJvd19vcmRlciI7czoxMzoiTmVrby5tb2RpZmllZCI7czo4OiJjbG1fc2hvdyI7aToxO3M6MTE6ImNsbV9zb3J0X25vIjtpOjE0O3M6MjoiaWQiO3M6ODoibW9kaWZpZWQiO319fXM6MTc6Im5la29fdGFibGVfZmllbGRzIjthOjE1OntzOjc6Ik5la28uaWQiO3M6MjoiSUQiO3M6MTM6Ik5la28ubmVrb192YWwiO3M6MTI6IuODjeOCs+aVsOWApCI7czoxNDoiTmVrby5uZWtvX25hbWUiO3M6MTI6IuODjeOCs+WQjeWJjSI7czoxNToiTmVrby5uZWtvX2dyb3VwIjtzOjEyOiLjg43jgrPnqK7liKUiO3M6MTQ6Ik5la28ubmVrb19kYXRlIjtzOjk6IuODjeOCs+aXpSI7czoxMjoiTmVrby5uZWtvX2R0IjtzOjEyOiLjg43jgrPml6XmmYIiO3M6MTM6Ik5la28ubmVrb19mbGciO3M6MTU6IuODjeOCs+ODleODqeOCsCI7czoxMToiTmVrby5pbWdfZm4iO3M6MjE6IueUu+WDj+ODleOCoeOCpOODq+WQjSI7czo5OiJOZWtvLm5vdGUiO3M6Njoi5YKZ6ICDIjtzOjEyOiJOZWtvLnNvcnRfbm8iO3M6Njoi6aCG55WqIjtzOjE1OiJOZWtvLmRlbGV0ZV9mbGciO3M6MTM6IuacieWKuS/nhKHlirkiO3M6MTY6Ik5la28udXBkYXRlX3VzZXIiO3M6OToi5pu05paw6ICFIjtzOjEyOiJOZWtvLmlwX2FkZHIiO3M6MjA6IuabtOaWsElQ44Ki44OJ44Os44K5IjtzOjEyOiJOZWtvLmNyZWF0ZWQiO3M6MTI6IueUn+aIkOaXpeaZgiI7czoxMzoiTmVrby5tb2RpZmllZCI7czoxMjoi5pu05paw5pel5pmCIjt9czo4OiJuZWtvX2tqcyI7YToyMDp7czo3OiJral9tYWluIjtzOjA6IiI7czo1OiJral9pZCI7czowOiIiO3M6MTI6ImtqX25la29fdmFsMSI7czowOiIiO3M6MTI6ImtqX25la29fdmFsMiI7czowOiIiO3M6MTI6ImtqX25la29fbmFtZSI7czowOiIiO3M6MTU6ImtqX25la29fZGF0ZV95bSI7czowOiIiO3M6MTM6ImtqX25la29fZGF0ZTEiO3M6MDoiIjtzOjEzOiJral9uZWtvX2RhdGUyIjtzOjA6IiI7czoxMzoia2pfbmVrb19ncm91cCI7czowOiIiO3M6MTA6ImtqX25la29fZHQiO3M6MDoiIjtzOjExOiJral9uZWtvX2ZsZyI7czoyOiItMSI7czo5OiJral9pbWdfZm4iO3M6MDoiIjtzOjc6ImtqX25vdGUiO3M6MDoiIjtzOjEwOiJral9zb3J0X25vIjtzOjA6IiI7czoxMzoia2pfZGVsZXRlX2ZsZyI7czoxOiIwIjtzOjE0OiJral91cGRhdGVfdXNlciI7czowOiIiO3M6MTA6ImtqX2lwX2FkZHIiO3M6MDoiIjtzOjEwOiJral9jcmVhdGVkIjtzOjA6IiI7czoxMToia2pfbW9kaWZpZWQiO3M6MDoiIjtzOjk6InJvd19saW1pdCI7czoyOiI1MCI7fXM6MTM6Im5la29faW5pX2NuZHMiO2E6Mjp7czozOiJranMiO2E6MjA6e3M6Nzoia2pfbWFpbiI7czowOiIiO3M6NToia2pfaWQiO3M6MDoiIjtzOjEyOiJral9uZWtvX3ZhbDEiO3M6MDoiIjtzOjEyOiJral9uZWtvX3ZhbDIiO3M6MDoiIjtzOjEyOiJral9uZWtvX25hbWUiO3M6MDoiIjtzOjE1OiJral9uZWtvX2RhdGVfeW0iO3M6MDoiIjtzOjEzOiJral9uZWtvX2RhdGUxIjtzOjA6IiI7czoxMzoia2pfbmVrb19kYXRlMiI7czowOiIiO3M6MTM6ImtqX25la29fZ3JvdXAiO3M6MDoiIjtzOjEwOiJral9uZWtvX2R0IjtzOjA6IiI7czoxMToia2pfbmVrb19mbGciO3M6MjoiLTEiO3M6OToia2pfaW1nX2ZuIjtzOjA6IiI7czo3OiJral9ub3RlIjtzOjA6IiI7czoxMDoia2pfc29ydF9ubyI7czowOiIiO3M6MTM6ImtqX2RlbGV0ZV9mbGciO3M6MToiMCI7czoxNDoia2pfdXBkYXRlX3VzZXIiO3M6MDoiIjtzOjEwOiJral9pcF9hZGRyIjtzOjA6IiI7czoxMDoia2pfY3JlYXRlZCI7czowOiIiO3M6MTE6ImtqX21vZGlmaWVkIjtzOjA6IiI7czo5OiJyb3dfbGltaXQiO3M6MjoiNTAiO31zOjU6InBhZ2VzIjthOjE0OntzOjk6InJvd19saW1pdCI7czoyOiI1MCI7czo3OiJwYWdlX25vIjtpOjA7czoxMDoic29ydF9maWVsZCI7czoxMjoiTmVrby5zb3J0X25vIjtzOjk6InNvcnRfZGVzYyI7aTowO3M6MTU6InBhZ2VfaW5kZXhfaHRtbCI7czo1NzY6IjxkaXYgaWQ9J3BhZ2VfaW5kZXgnPiZsdCZsdCZuYnNwOwombHQmbmJzcDsKMSZuYnNwOwo8YSBocmVmPScvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MSZyb3dfbGltaXQ9NTAmc29ydF9maWVsZD1OZWtvLnNvcnRfbm8mc29ydF9kZXNjPTAmYWN0X2ZsZz0yJmtqX25la29fZmxnPS0xJmtqX2RlbGV0ZV9mbGc9MCZyb3dfbGltaXQ9NTAnPjI8L2E+Jm5ic3A7CjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0xJnJvd19saW1pdD01MCZzb3J0X2ZpZWxkPU5la28uc29ydF9ubyZzb3J0X2Rlc2M9MCZhY3RfZmxnPTIma2pfbmVrb19mbGc9LTEma2pfZGVsZXRlX2ZsZz0wJnJvd19saW1pdD01MCc+Jmd0PC9hPiZuYnNwOwo8YSBocmVmPScvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MSZyb3dfbGltaXQ9NTAmc29ydF9maWVsZD1OZWtvLnNvcnRfbm8mc29ydF9kZXNjPTAmYWN0X2ZsZz0yJmtqX25la29fZmxnPS0xJmtqX2RlbGV0ZV9mbGc9MCZyb3dfbGltaXQ9NTAnPiZndCZndDwvYT4mbmJzcDsKPC9kaXY+CiI7czo3OiJkZWZfdXJsIjtzOjE0NzoiL0NydWRCYXNlL2xhcmF2ZWw3L2Rldi9wdWJsaWMvbmVrbz9wYWdlX25vPTEmcm93X2xpbWl0PTUwJnNvcnRfZmllbGQ9TmVrby5zb3J0X25vJnNvcnRfZGVzYz0wJmFjdF9mbGc9MiZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwIjtzOjE0OiJwYWdlX3ByZXZfbGluayI7czowOiIiO3M6MTQ6InBhZ2VfbmV4dF9saW5rIjtzOjE0NzoiL0NydWRCYXNlL2xhcmF2ZWw3L2Rldi9wdWJsaWMvbmVrbz9wYWdlX25vPTEmcm93X2xpbWl0PTUwJnNvcnRfZmllbGQ9TmVrby5zb3J0X25vJnNvcnRfZGVzYz0wJmFjdF9mbGc9MiZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwIjtzOjEzOiJwYWdlX3RvcF9saW5rIjtzOjA6IiI7czoxNDoicGFnZV9sYXN0X2xpbmsiO3M6MTQ3OiIvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MSZyb3dfbGltaXQ9NTAmc29ydF9maWVsZD1OZWtvLnNvcnRfbm8mc29ydF9kZXNjPTAmYWN0X2ZsZz0yJmtqX25la29fZmxnPS0xJmtqX2RlbGV0ZV9mbGc9MCZyb3dfbGltaXQ9NTAiO3M6OToicXVlcnlfc3RyIjtzOjEwMjoicGFnZV9ubz0wJnJvd19saW1pdD01MCZzb3J0X2ZpZWxkPU5la28uc29ydF9ubyZzb3J0X2Rlc2M9MCZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwIjtzOjU6InNvcnRzIjthOjE1OntzOjc6Ik5la28uaWQiO3M6MTQ2OiI8YSBocmVmPScvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MCZzb3J0X2ZpZWxkPU5la28uaWQmc29ydF9kZXNjPTAmYWN0X2ZsZz0zJmtqX25la29fZmxnPS0xJmtqX2RlbGV0ZV9mbGc9MCZyb3dfbGltaXQ9NTAnPklEPC9hPiI7czoxMzoiTmVrby5uZWtvX3ZhbCI7czoxNjI6IjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0wJnNvcnRfZmllbGQ9TmVrby5uZWtvX3ZhbCZzb3J0X2Rlc2M9MCZhY3RfZmxnPTMma2pfbmVrb19mbGc9LTEma2pfZGVsZXRlX2ZsZz0wJnJvd19saW1pdD01MCc+44ON44Kz5pWw5YCkPC9hPiI7czoxNDoiTmVrby5uZWtvX25hbWUiO3M6MTYzOiI8YSBocmVmPScvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MCZzb3J0X2ZpZWxkPU5la28ubmVrb19uYW1lJnNvcnRfZGVzYz0wJmFjdF9mbGc9MyZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwJz7jg43jgrPlkI3liY08L2E+IjtzOjE1OiJOZWtvLm5la29fZ3JvdXAiO3M6MTY0OiI8YSBocmVmPScvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MCZzb3J0X2ZpZWxkPU5la28ubmVrb19ncm91cCZzb3J0X2Rlc2M9MCZhY3RfZmxnPTMma2pfbmVrb19mbGc9LTEma2pfZGVsZXRlX2ZsZz0wJnJvd19saW1pdD01MCc+44ON44Kz56iu5YilPC9hPiI7czoxNDoiTmVrby5uZWtvX2RhdGUiO3M6MTYwOiI8YSBocmVmPScvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MCZzb3J0X2ZpZWxkPU5la28ubmVrb19kYXRlJnNvcnRfZGVzYz0wJmFjdF9mbGc9MyZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwJz7jg43jgrPml6U8L2E+IjtzOjEyOiJOZWtvLm5la29fZHQiO3M6MTYxOiI8YSBocmVmPScvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MCZzb3J0X2ZpZWxkPU5la28ubmVrb19kdCZzb3J0X2Rlc2M9MCZhY3RfZmxnPTMma2pfbmVrb19mbGc9LTEma2pfZGVsZXRlX2ZsZz0wJnJvd19saW1pdD01MCc+44ON44Kz5pel5pmCPC9hPiI7czoxMzoiTmVrby5uZWtvX2ZsZyI7czoxNjU6IjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0wJnNvcnRfZmllbGQ9TmVrby5uZWtvX2ZsZyZzb3J0X2Rlc2M9MCZhY3RfZmxnPTMma2pfbmVrb19mbGc9LTEma2pfZGVsZXRlX2ZsZz0wJnJvd19saW1pdD01MCc+44ON44Kz44OV44Op44KwPC9hPiI7czoxMToiTmVrby5pbWdfZm4iO3M6MTY5OiI8YSBocmVmPScvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MCZzb3J0X2ZpZWxkPU5la28uaW1nX2ZuJnNvcnRfZGVzYz0wJmFjdF9mbGc9MyZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwJz7nlLvlg4/jg5XjgqHjgqTjg6vlkI08L2E+IjtzOjk6Ik5la28ubm90ZSI7czoxNTI6IjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0wJnNvcnRfZmllbGQ9TmVrby5ub3RlJnNvcnRfZGVzYz0wJmFjdF9mbGc9MyZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwJz7lgpnogIM8L2E+IjtzOjEyOiJOZWtvLnNvcnRfbm8iO3M6MTY3OiI8YSBocmVmPScvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MCZsaW1pdD01MCZzb3J0X2ZpZWxkPU5la28uc29ydF9ubyZzb3J0X2Rlc2M9MSZhY3RfZmxnPTMma2pfbmVrb19mbGc9LTEma2pfZGVsZXRlX2ZsZz0wJnJvd19saW1pdD01MCc+4pay6aCG55WqPC9hPiI7czoxNToiTmVrby5kZWxldGVfZmxnIjtzOjE2NToiPGEgaHJlZj0nL0NydWRCYXNlL2xhcmF2ZWw3L2Rldi9wdWJsaWMvbmVrbz9wYWdlX25vPTAmc29ydF9maWVsZD1OZWtvLmRlbGV0ZV9mbGcmc29ydF9kZXNjPTAmYWN0X2ZsZz0zJmtqX25la29fZmxnPS0xJmtqX2RlbGV0ZV9mbGc9MCZyb3dfbGltaXQ9NTAnPuacieWKuS/nhKHlirk8L2E+IjtzOjE2OiJOZWtvLnVwZGF0ZV91c2VyIjtzOjE2MjoiPGEgaHJlZj0nL0NydWRCYXNlL2xhcmF2ZWw3L2Rldi9wdWJsaWMvbmVrbz9wYWdlX25vPTAmc29ydF9maWVsZD1OZWtvLnVwZGF0ZV91c2VyJnNvcnRfZGVzYz0wJmFjdF9mbGc9MyZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwJz7mm7TmlrDogIU8L2E+IjtzOjEyOiJOZWtvLmlwX2FkZHIiO3M6MTY5OiI8YSBocmVmPScvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MCZzb3J0X2ZpZWxkPU5la28uaXBfYWRkciZzb3J0X2Rlc2M9MCZhY3RfZmxnPTMma2pfbmVrb19mbGc9LTEma2pfZGVsZXRlX2ZsZz0wJnJvd19saW1pdD01MCc+5pu05pawSVDjgqLjg4njg6zjgrk8L2E+IjtzOjEyOiJOZWtvLmNyZWF0ZWQiO3M6MTYxOiI8YSBocmVmPScvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MCZzb3J0X2ZpZWxkPU5la28uY3JlYXRlZCZzb3J0X2Rlc2M9MCZhY3RfZmxnPTMma2pfbmVrb19mbGc9LTEma2pfZGVsZXRlX2ZsZz0wJnJvd19saW1pdD01MCc+55Sf5oiQ5pel5pmCPC9hPiI7czoxMzoiTmVrby5tb2RpZmllZCI7czoxNjI6IjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0wJnNvcnRfZmllbGQ9TmVrby5tb2RpZmllZCZzb3J0X2Rlc2M9MCZhY3RfZmxnPTMma2pfbmVrb19mbGc9LTEma2pfZGVsZXRlX2ZsZz0wJnJvd19saW1pdD01MCc+5pu05paw5pel5pmCPC9hPiI7fXM6MTI6ImFsbF9kYXRhX2NudCI7aTo5MDtzOjEyOiJhbGxfcGFnZV9jbnQiO2Q6Mjt9fXM6MTA6Im5la29fcGFnZXMiO2E6MTQ6e3M6OToicm93X2xpbWl0IjtzOjI6IjUwIjtzOjc6InBhZ2Vfbm8iO2k6MDtzOjEwOiJzb3J0X2ZpZWxkIjtzOjEyOiJOZWtvLnNvcnRfbm8iO3M6OToic29ydF9kZXNjIjtpOjA7czoxNToicGFnZV9pbmRleF9odG1sIjtzOjU3NjoiPGRpdiBpZD0ncGFnZV9pbmRleCc+Jmx0Jmx0Jm5ic3A7CiZsdCZuYnNwOwoxJm5ic3A7CjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0xJnJvd19saW1pdD01MCZzb3J0X2ZpZWxkPU5la28uc29ydF9ubyZzb3J0X2Rlc2M9MCZhY3RfZmxnPTIma2pfbmVrb19mbGc9LTEma2pfZGVsZXRlX2ZsZz0wJnJvd19saW1pdD01MCc+MjwvYT4mbmJzcDsKPGEgaHJlZj0nL0NydWRCYXNlL2xhcmF2ZWw3L2Rldi9wdWJsaWMvbmVrbz9wYWdlX25vPTEmcm93X2xpbWl0PTUwJnNvcnRfZmllbGQ9TmVrby5zb3J0X25vJnNvcnRfZGVzYz0wJmFjdF9mbGc9MiZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwJz4mZ3Q8L2E+Jm5ic3A7CjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0xJnJvd19saW1pdD01MCZzb3J0X2ZpZWxkPU5la28uc29ydF9ubyZzb3J0X2Rlc2M9MCZhY3RfZmxnPTIma2pfbmVrb19mbGc9LTEma2pfZGVsZXRlX2ZsZz0wJnJvd19saW1pdD01MCc+Jmd0Jmd0PC9hPiZuYnNwOwo8L2Rpdj4KIjtzOjc6ImRlZl91cmwiO3M6MTQ3OiIvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MSZyb3dfbGltaXQ9NTAmc29ydF9maWVsZD1OZWtvLnNvcnRfbm8mc29ydF9kZXNjPTAmYWN0X2ZsZz0yJmtqX25la29fZmxnPS0xJmtqX2RlbGV0ZV9mbGc9MCZyb3dfbGltaXQ9NTAiO3M6MTQ6InBhZ2VfcHJldl9saW5rIjtzOjA6IiI7czoxNDoicGFnZV9uZXh0X2xpbmsiO3M6MTQ3OiIvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MSZyb3dfbGltaXQ9NTAmc29ydF9maWVsZD1OZWtvLnNvcnRfbm8mc29ydF9kZXNjPTAmYWN0X2ZsZz0yJmtqX25la29fZmxnPS0xJmtqX2RlbGV0ZV9mbGc9MCZyb3dfbGltaXQ9NTAiO3M6MTM6InBhZ2VfdG9wX2xpbmsiO3M6MDoiIjtzOjE0OiJwYWdlX2xhc3RfbGluayI7czoxNDc6Ii9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0xJnJvd19saW1pdD01MCZzb3J0X2ZpZWxkPU5la28uc29ydF9ubyZzb3J0X2Rlc2M9MCZhY3RfZmxnPTIma2pfbmVrb19mbGc9LTEma2pfZGVsZXRlX2ZsZz0wJnJvd19saW1pdD01MCI7czo5OiJxdWVyeV9zdHIiO3M6MTAyOiJwYWdlX25vPTAmcm93X2xpbWl0PTUwJnNvcnRfZmllbGQ9TmVrby5zb3J0X25vJnNvcnRfZGVzYz0wJmtqX25la29fZmxnPS0xJmtqX2RlbGV0ZV9mbGc9MCZyb3dfbGltaXQ9NTAiO3M6NToic29ydHMiO2E6MTU6e3M6NzoiTmVrby5pZCI7czoxNDY6IjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0wJnNvcnRfZmllbGQ9TmVrby5pZCZzb3J0X2Rlc2M9MCZhY3RfZmxnPTMma2pfbmVrb19mbGc9LTEma2pfZGVsZXRlX2ZsZz0wJnJvd19saW1pdD01MCc+SUQ8L2E+IjtzOjEzOiJOZWtvLm5la29fdmFsIjtzOjE2MjoiPGEgaHJlZj0nL0NydWRCYXNlL2xhcmF2ZWw3L2Rldi9wdWJsaWMvbmVrbz9wYWdlX25vPTAmc29ydF9maWVsZD1OZWtvLm5la29fdmFsJnNvcnRfZGVzYz0wJmFjdF9mbGc9MyZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwJz7jg43jgrPmlbDlgKQ8L2E+IjtzOjE0OiJOZWtvLm5la29fbmFtZSI7czoxNjM6IjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0wJnNvcnRfZmllbGQ9TmVrby5uZWtvX25hbWUmc29ydF9kZXNjPTAmYWN0X2ZsZz0zJmtqX25la29fZmxnPS0xJmtqX2RlbGV0ZV9mbGc9MCZyb3dfbGltaXQ9NTAnPuODjeOCs+WQjeWJjTwvYT4iO3M6MTU6Ik5la28ubmVrb19ncm91cCI7czoxNjQ6IjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0wJnNvcnRfZmllbGQ9TmVrby5uZWtvX2dyb3VwJnNvcnRfZGVzYz0wJmFjdF9mbGc9MyZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwJz7jg43jgrPnqK7liKU8L2E+IjtzOjE0OiJOZWtvLm5la29fZGF0ZSI7czoxNjA6IjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0wJnNvcnRfZmllbGQ9TmVrby5uZWtvX2RhdGUmc29ydF9kZXNjPTAmYWN0X2ZsZz0zJmtqX25la29fZmxnPS0xJmtqX2RlbGV0ZV9mbGc9MCZyb3dfbGltaXQ9NTAnPuODjeOCs+aXpTwvYT4iO3M6MTI6Ik5la28ubmVrb19kdCI7czoxNjE6IjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0wJnNvcnRfZmllbGQ9TmVrby5uZWtvX2R0JnNvcnRfZGVzYz0wJmFjdF9mbGc9MyZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwJz7jg43jgrPml6XmmYI8L2E+IjtzOjEzOiJOZWtvLm5la29fZmxnIjtzOjE2NToiPGEgaHJlZj0nL0NydWRCYXNlL2xhcmF2ZWw3L2Rldi9wdWJsaWMvbmVrbz9wYWdlX25vPTAmc29ydF9maWVsZD1OZWtvLm5la29fZmxnJnNvcnRfZGVzYz0wJmFjdF9mbGc9MyZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwJz7jg43jgrPjg5Xjg6njgrA8L2E+IjtzOjExOiJOZWtvLmltZ19mbiI7czoxNjk6IjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0wJnNvcnRfZmllbGQ9TmVrby5pbWdfZm4mc29ydF9kZXNjPTAmYWN0X2ZsZz0zJmtqX25la29fZmxnPS0xJmtqX2RlbGV0ZV9mbGc9MCZyb3dfbGltaXQ9NTAnPueUu+WDj+ODleOCoeOCpOODq+WQjTwvYT4iO3M6OToiTmVrby5ub3RlIjtzOjE1MjoiPGEgaHJlZj0nL0NydWRCYXNlL2xhcmF2ZWw3L2Rldi9wdWJsaWMvbmVrbz9wYWdlX25vPTAmc29ydF9maWVsZD1OZWtvLm5vdGUmc29ydF9kZXNjPTAmYWN0X2ZsZz0zJmtqX25la29fZmxnPS0xJmtqX2RlbGV0ZV9mbGc9MCZyb3dfbGltaXQ9NTAnPuWCmeiAgzwvYT4iO3M6MTI6Ik5la28uc29ydF9ubyI7czoxNjc6IjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0wJmxpbWl0PTUwJnNvcnRfZmllbGQ9TmVrby5zb3J0X25vJnNvcnRfZGVzYz0xJmFjdF9mbGc9MyZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwJz7ilrLpoIbnlao8L2E+IjtzOjE1OiJOZWtvLmRlbGV0ZV9mbGciO3M6MTY1OiI8YSBocmVmPScvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MCZzb3J0X2ZpZWxkPU5la28uZGVsZXRlX2ZsZyZzb3J0X2Rlc2M9MCZhY3RfZmxnPTMma2pfbmVrb19mbGc9LTEma2pfZGVsZXRlX2ZsZz0wJnJvd19saW1pdD01MCc+5pyJ5Yq5L+eEoeWKuTwvYT4iO3M6MTY6Ik5la28udXBkYXRlX3VzZXIiO3M6MTYyOiI8YSBocmVmPScvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvP3BhZ2Vfbm89MCZzb3J0X2ZpZWxkPU5la28udXBkYXRlX3VzZXImc29ydF9kZXNjPTAmYWN0X2ZsZz0zJmtqX25la29fZmxnPS0xJmtqX2RlbGV0ZV9mbGc9MCZyb3dfbGltaXQ9NTAnPuabtOaWsOiAhTwvYT4iO3M6MTI6Ik5la28uaXBfYWRkciI7czoxNjk6IjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0wJnNvcnRfZmllbGQ9TmVrby5pcF9hZGRyJnNvcnRfZGVzYz0wJmFjdF9mbGc9MyZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwJz7mm7TmlrBJUOOCouODieODrOOCuTwvYT4iO3M6MTI6Ik5la28uY3JlYXRlZCI7czoxNjE6IjxhIGhyZWY9Jy9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL25la28/cGFnZV9ubz0wJnNvcnRfZmllbGQ9TmVrby5jcmVhdGVkJnNvcnRfZGVzYz0wJmFjdF9mbGc9MyZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwJz7nlJ/miJDml6XmmYI8L2E+IjtzOjEzOiJOZWtvLm1vZGlmaWVkIjtzOjE2MjoiPGEgaHJlZj0nL0NydWRCYXNlL2xhcmF2ZWw3L2Rldi9wdWJsaWMvbmVrbz9wYWdlX25vPTAmc29ydF9maWVsZD1OZWtvLm1vZGlmaWVkJnNvcnRfZGVzYz0wJmFjdF9mbGc9MyZral9uZWtvX2ZsZz0tMSZral9kZWxldGVfZmxnPTAmcm93X2xpbWl0PTUwJz7mm7TmlrDml6XmmYI8L2E+Ijt9czoxMjoiYWxsX2RhdGFfY250IjtpOjkwO3M6MTI6ImFsbF9wYWdlX2NudCI7ZDoyO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czo2MDoiaHR0cDovL2xvY2FsaG9zdC9DcnVkQmFzZS9sYXJhdmVsNy9kZXYvcHVibGljL3Bhc3N3b3JkL3Jlc2V0Ijt9fQ==', 1599650724);

-- --------------------------------------------------------

--
-- テーブルの構造 `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '権限',
  `sort_no` int(11) DEFAULT 0 COMMENT '順番',
  `delete_flg` tinyint(1) DEFAULT 0 COMMENT '削除フラグ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `role`, `sort_no`, `delete_flg`, `created_at`, `updated_at`) VALUES
(1, 'kani', 'amaraimusi@gmail.com', NULL, '$2y$10$nbLR1zXq9ypykNi19MEz4.1XBhZzaGrromW2EBJyMUdWoC4FWeE4K', NULL, 'master', 0, 0, '2020-07-05 22:18:59', '2020-07-05 22:18:59'),
(2, 'test', 'amaraimusi@yahoo.co.jp', NULL, '', NULL, 'admin', -1, 0, NULL, '2020-09-07 04:22:30');

-- --------------------------------------------------------

--
-- テーブルの構造 `yagis`
--

CREATE TABLE `yagis` (
  `id` int(11) NOT NULL,
  `yagi_age` int(11) DEFAULT NULL COMMENT 'ヤギ年齢',
  `yagi_name` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT 'ヤギ名',
  `yagi_date` date DEFAULT NULL COMMENT 'ヤギ日付',
  `buta_id` int(11) DEFAULT NULL COMMENT 'ブタID',
  `yagi_dt` datetime DEFAULT NULL COMMENT 'ヤギ日時',
  `yagi_flg` tinyint(4) DEFAULT 0 COMMENT 'ヤギフラグ',
  `img_fn` varchar(256) CHARACTER SET latin1 DEFAULT NULL COMMENT '画像ファイル名',
  `note` text CHARACTER SET utf8 DEFAULT '' COMMENT '備考',
  `sort_no` int(11) DEFAULT 0 COMMENT '順番',
  `delete_flg` tinyint(1) DEFAULT 0 COMMENT '無効フラグ',
  `update_user` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '更新者',
  `ip_addr` varchar(40) CHARACTER SET utf8 DEFAULT NULL COMMENT 'IPアドレス',
  `created` datetime DEFAULT NULL COMMENT '生成日時',
  `modified` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- テーブルのデータのダンプ `yagis`
--

INSERT INTO `yagis` (`id`, `yagi_age`, `yagi_name`, `yagi_date`, `buta_id`, `yagi_dt`, `yagi_flg`, `img_fn`, `note`, `sort_no`, `delete_flg`, `update_user`, `ip_addr`, `created`, `modified`) VALUES
(1, 123, 'ロードゴート２', '0000-00-00', 1, '0000-00-00 00:00:00', 0, '', '', 0, 0, '', '::1', '2020-08-31 13:16:41', '2020-08-31 04:17:32'),
(2, 123, 'ロードゴート３', '0000-00-00', 1, '0000-00-00 00:00:00', 0, '', '', 0, 0, '', '::1', '2020-08-31 13:17:35', '2020-08-31 04:17:40');

--
-- ダンプしたテーブルのインデックス
--

--
-- テーブルのインデックス `app_configs`
--
ALTER TABLE `app_configs`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `butas`
--
ALTER TABLE `butas`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `nekos`
--
ALTER TABLE `nekos`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `neko_groups`
--
ALTER TABLE `neko_groups`
  ADD PRIMARY KEY (`id`);

--
-- テーブルのインデックス `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_id_unique` (`id`);

--
-- テーブルのインデックス `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- テーブルのインデックス `yagis`
--
ALTER TABLE `yagis`
  ADD PRIMARY KEY (`id`);

--
-- ダンプしたテーブルのAUTO_INCREMENT
--

--
-- テーブルのAUTO_INCREMENT `app_configs`
--
ALTER TABLE `app_configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルのAUTO_INCREMENT `butas`
--
ALTER TABLE `butas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルのAUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- テーブルのAUTO_INCREMENT `nekos`
--
ALTER TABLE `nekos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- テーブルのAUTO_INCREMENT `neko_groups`
--
ALTER TABLE `neko_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- テーブルのAUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- テーブルのAUTO_INCREMENT `yagis`
--
ALTER TABLE `yagis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
