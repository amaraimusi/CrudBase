-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- ホスト: 127.0.0.1
-- 生成日時: 2021-07-10 15:18:07
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
-- テーブルの構造 `en_sps`
--

CREATE TABLE `en_sps` (
  `id` int(11) NOT NULL,
  `bio_cls_id` int(11) DEFAULT NULL COMMENT '綱ID',
  `family_name` varchar(255) DEFAULT NULL COMMENT '科',
  `wamei` varchar(255) DEFAULT NULL COMMENT '和名',
  `scien_name` varchar(225) DEFAULT NULL COMMENT '学名',
  `en_ctg_id` int(11) DEFAULT 0 COMMENT '絶滅危惧種カテゴリーID',
  `endemic_sp_flg` tinyint(4) DEFAULT 0 COMMENT '固有種フラグ',
  `note` text NOT NULL COMMENT '備考',
  `sort_no` int(11) DEFAULT 0 COMMENT '順番',
  `delete_flg` tinyint(1) DEFAULT 0 COMMENT '無効フラグ',
  `update_user` varchar(50) DEFAULT NULL COMMENT '更新者',
  `ip_addr` varchar(40) DEFAULT NULL COMMENT 'IPアドレス',
  `created` datetime DEFAULT NULL COMMENT '生成日時',
  `modified` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT '更新日'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='en_sps Endangered species(絶滅危惧生物テーブル)';

--
-- テーブルのデータのダンプ `en_sps`
--

INSERT INTO `en_sps` (`id`, `bio_cls_id`, `family_name`, `wamei`, `scien_name`, `en_ctg_id`, `endemic_sp_flg`, `note`, `sort_no`, `delete_flg`, `update_user`, `ip_addr`, `created`, `modified`) VALUES
(1, 4, 'サンショウウオ', 'アベサンショウウオ', 'Hynobius abei', 7, 0, '', 5, 0, 'kani', '::1', NULL, '2018-09-02 13:47:27'),
(2, 4, 'サンショウウオ', 'アカイシサンショウウオ', 'Hynobius katoi', 8, 0, '', 6, 0, '', '', NULL, '2018-09-01 11:20:37'),
(3, 4, 'サンショウウオ', 'ハクバサンショウウオ', 'Hynobius hidamontanus', 8, 0, '', 7, 0, '', '', NULL, '2018-09-01 11:20:37'),
(4, 4, 'サンショウウオ', 'ホクリクサンショウウオ', 'Hynobius takedai', 8, 0, '', 8, 0, '', '', NULL, '2018-09-01 11:20:37'),
(5, 4, 'サンショウウオ', 'オオイタサンショウウオ', 'Hynobius dunni', 9, 0, '1997年版から、「高知県のオオイタサンショウウオ個体群」も含む。', 9, 0, '', '', NULL, '2018-09-01 11:20:37'),
(6, 4, 'サンショウウオ', 'オオダイガハラサンショウウオ', 'Hynobius boulengeri', 9, 0, '1997年版まで、「本州・九州地域のオオダイガハラサンショウウオ個体群」を評価単位としていた。', 10, 0, '', '', NULL, '2018-09-01 11:20:37'),
(7, 4, 'サンショウウオ', 'オキサンショウウオ', 'Hynobius okiensis', 9, 0, '', 11, 0, '', '', NULL, '2018-09-01 11:20:37'),
(8, 4, 'サンショウウオ', 'カスミサンショウウオ', 'Hynobius nebulosus', 9, 0, '1997年版まで、「京都・大阪地域のカスミサンショウウオ個体群」を評価単位としていた。さらに、「愛知県のトウキョウサンショウウオ個体群」も分類の変更により含まれる。', 12, 0, '', '', NULL, '2018-09-01 11:20:37'),
(9, 4, 'サンショウウオ', 'トウキョウサンショウウオ', 'Hynobius tokyoensis', 9, 0, '1997年版まで、「東京都のトウキョウサンショウウオ個体群」を評価単位としていた。', 13, 0, '', '', NULL, '2018-09-01 11:20:37'),
(10, 4, 'サンショウウオ', 'ベッコウサンショウウオ', 'Hynobius stejnegeri', 9, 0, '', 14, 0, '', '', NULL, '2018-09-01 11:20:37'),
(11, 4, 'サンショウウオ', 'キタサンショウウオ', 'Salamandrella keyserlingii', 4, 0, '', 15, 0, '', '', NULL, '2018-09-01 11:20:37'),
(12, 4, 'サンショウウオ', 'イシヅチサンショウウオ', 'Hynobius hirosei', 4, 0, 'オオダイガハラサンショウウオ四国個体群とされていたものが独立種となった。', 16, 0, '', '', NULL, '2018-09-01 11:20:37'),
(13, 4, 'サンショウウオ', 'クロサンショウウオ', 'Hynobius nigrescens', 4, 0, '', 17, 0, '', '', NULL, '2018-09-01 11:20:37'),
(14, 4, 'サンショウウオ', 'コガタブチサンショウウオ', 'Hynobius yatsui', 4, 0, 'ブチサンショウウオの山地小型個体群とされていたものが独立種となった', 18, 0, '', '', NULL, '2018-09-01 11:20:37'),
(15, 4, 'サンショウウオ', 'ツシマサンショウウオ', 'Hynobius tsuensis', 4, 0, '', 19, 0, '', '', NULL, '2018-09-01 11:20:37'),
(16, 4, 'サンショウウオ', 'トウホクサンショウウオ', 'Hynobius lichenatus', 4, 0, '', 20, 0, '', '', NULL, '2018-09-01 11:20:37'),
(17, 4, 'サンショウウオ', 'ヒダサンショウウオ', 'Hynobius kimurae', 4, 0, '', 21, 0, '', '', NULL, '2018-09-01 11:20:37'),
(18, 4, 'サンショウウオ', 'ブチサンショウウオ', 'Hynobius naevius', 4, 0, '', 22, 0, '', '', NULL, '2018-09-01 11:20:37'),
(19, 4, 'サンショウウオ', 'エゾサンショウウオ', 'Hynobius retardatus', 5, 0, '', 23, 0, '', '', NULL, '2018-09-01 11:20:37'),
(20, 4, 'オオサンショウウオ', 'オオサンショウウオ', 'Andrias japonicus', 9, 0, '', 24, 0, '', '', NULL, '2018-09-01 11:20:37'),
(21, 4, 'イモリ', 'イボイモリ', 'Echinotriton andersoni', 9, 0, '', 25, 0, '', '', NULL, '2018-09-01 11:20:37'),
(22, 4, 'イモリ', 'アカハライモリ', 'Cynops pyrrhogaster', 4, 0, '', 26, 0, '', '', NULL, '2018-09-01 11:20:37'),
(23, 4, 'イモリ', 'シリケンイモリ', 'Cynops ensicauda', 4, 0, '', 27, 0, '', '', NULL, '2018-09-01 11:20:37'),
(24, 4, 'ヒキガエル', 'ミヤコヒキガエル', 'Bufo gargarizans miyakonis', 4, 0, '', 28, 0, '', '', NULL, '2018-09-01 11:20:37'),
(25, 4, 'アカガエル', 'アマミイシカワガエル', 'Odorrana splendida', 8, 0, 'イシカワガエルの奄美大島個体群とされていたものが独立種となった。', 29, 0, '', '', NULL, '2018-09-01 11:20:37'),
(26, 4, 'アカガエル', 'オキナワイシカワガエル', 'Odorrana ishikawae', 8, 0, '2006年版まで、和名をイシカワガエルとしていた。アマミイシカワガエル備考欄の理由により沖縄島個体群のみがO. ishikawaeとなり、それに伴い和名が変更された。', 30, 0, '', '', NULL, '2018-09-01 11:20:37'),
(27, 4, 'アカガエル', 'コガタハナサキガエル', 'Odorrana utsunomiyaorum', 8, 0, '', 31, 0, '', '', NULL, '2018-09-01 11:20:37'),
(28, 4, 'アカガエル', 'オットンガエル', 'Babina subaspera', 8, 0, '', 32, 0, '', '', NULL, '2018-09-01 11:20:37'),
(29, 4, 'アカガエル', 'ナゴヤダルマガエル', 'Rana porosa brevipoda', 8, 0, '1997年版まで、和名をダルマガエルとしていた。', 33, 0, '', '', NULL, '2018-09-01 11:20:37'),
(30, 4, 'アカガエル', 'ナミエガエル', 'Limnonectes namiyei', 8, 0, '', 34, 0, '', '', NULL, '2018-09-01 11:20:37'),
(31, 4, 'アカガエル', 'ホルストガエル', 'Babina holsti', 8, 0, '', 35, 0, '', '', NULL, '2018-09-01 11:20:37'),
(32, 4, 'アカガエル', 'アマミハナサキガエル', 'Odorrana amamiensis', 9, 0, '', 36, 0, '', '', NULL, '2018-09-01 11:20:37'),
(33, 4, 'アカガエル', 'ハナサキガエル', 'Odorrana narina', 9, 0, '', 37, 0, '', '', NULL, '2018-09-01 11:20:37'),
(34, 4, 'アカガエル', 'ヤエヤマハラブチガエル', 'Rana okinavana', 9, 0, '2006年版まで学名がRana psaltesだったが、リュウキュウアカガエルの学名とされていたR. okinavanaの模式標本がヤエヤマハラブチガエルであったことが判明したため学名が変更された。', 38, 0, '', '', NULL, '2018-09-01 11:20:37'),
(35, 4, 'アカガエル', 'アマミアカガエル', 'Rana kobai', 4, 0, 'リュウキュウアカガエルの奄美諸島個体群とされていたものが独立種となった', 39, 0, '', '', NULL, '2018-09-01 11:20:37'),
(36, 4, 'アカガエル', 'オキタゴガエル', 'Rana tagoi okiensis', 4, 0, '', 40, 0, '', '', NULL, '2018-09-01 11:20:37'),
(37, 4, 'アカガエル', 'ヤクシマタゴガエル', 'Rana tagoi yakushimensis', 4, 0, '', 41, 0, '', '', NULL, '2018-09-01 11:20:37'),
(38, 4, 'アカガエル', 'トウキョウダルマガエル', 'Rana porosa porosa', 4, 0, '', 42, 0, '', '', NULL, '2018-09-01 11:20:37'),
(39, 4, 'アカガエル', 'チョウセンヤマアカガエル', 'Rana dybowskii', 4, 0, '', 43, 0, '', '', NULL, '2018-09-01 11:20:37'),
(40, 4, 'アカガエル', 'ツシマアカガエル', 'Rana tsushimensis', 4, 0, '', 44, 0, '', '', NULL, '2018-09-01 11:20:37'),
(41, 4, 'アカガエル', 'トノサマガエル', 'Rana nigromaculata', 4, 0, '', 45, 0, '', '', NULL, '2018-09-01 11:20:37'),
(42, 4, 'アカガエル', 'リュウキュウアカガエル', 'Rana ulma', 4, 0, '2006年版まで学名がRana okinavanaだったが、R. okinavanaの模式標本がヤエヤマハラブチガエルであったことが判明したため改めて新種として記載された。', 46, 0, '', '', NULL, '2018-09-01 11:20:37'),
(43, 2, 'ウミガメ', 'アカウミガメ', 'Caretta caretta', 8, 0, '', 47, 0, '', '', NULL, '2018-09-01 11:20:37'),
(44, 2, 'ウミガメ', 'タイマイ', 'Eretmochelys imbricata', 8, 0, '', 48, 0, '', '', NULL, '2018-09-01 11:20:37'),
(45, 2, 'ウミガメ', 'アオウミガメ', 'Chelonia mydas mydas', 9, 0, '', 49, 0, '', '', NULL, '2018-09-01 11:20:37'),
(46, 2, 'イシガメ', 'ヤエヤマセマルハコガメ', 'Cuora flavomarginata evelynae', 9, 0, '1997年版まで、和名をセマルハコガメとしていた。', 50, 0, '', '', NULL, '2018-09-01 11:20:37'),
(47, 2, 'イシガメ', 'リュウキュウヤマガメ', 'Geoemyda japonica', 9, 0, '', 49, 0, '', '', NULL, '2018-09-01 11:20:37'),
(48, 2, 'イシガメ', 'ニホンイシガメ', 'Mauremys japonica', 4, 0, '', 50, 0, '', '', NULL, '2018-09-01 11:20:37'),
(49, 2, 'スッポン', 'ニホンスッポン', 'Pelodiscus sinensis', 5, 0, '1997年版までスッポンを、2006年版ではP. s. japonicusとして評価していた。', 50, 0, '', '', NULL, '2018-09-01 11:20:37'),
(50, 2, 'トカゲモドキ', 'イヘヤトカゲモドキ', 'Goniurosaurus kuroiwae toyamai', 7, 0, '1991年版では、種クロイワトカゲモドキとして評価していた。', 50, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(51, 2, 'トカゲモドキ', 'クメトカゲモドキ', 'Goniurosaurus kuroiwae yamashinae', 7, 0, '1991年版では、種クロイワトカゲモドキとして評価していた。', 51, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(52, 2, 'トカゲモドキ', 'オビトカゲモドキ', 'Goniurosaurus kuroiwae splendens', 8, 0, '1991年版では、種クロイワトカゲモドキとして評価していた。', 52, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(53, 2, 'トカゲモドキ', 'マダラトカゲモドキ', 'GGoniurosaurus kuroiwae orientalis', 8, 0, '1991年版では、種クロイワトカゲモドキとして評価していた。', 53, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(54, 2, 'トカゲモドキ', 'クロイワトカゲモドキ', 'Goniurosaurus kuroiwae kuroiwae', 9, 0, '', 54, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(55, 2, 'ヤモリ', 'ミナミトリシマヤモリ', 'Perochirus ateles', 9, 0, '', 55, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(56, 2, 'ヤモリ', 'タシロヤモリ', 'Hemidactylus bowringii', 9, 0, '', 56, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(57, 2, 'ヤモリ', 'ヤクヤモリ', 'Gekko yakuensis', 9, 0, '', 57, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(58, 2, 'ヤモリ', 'オキナワヤモリ', 'Gekko sp. 1', 4, 0, '', 58, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(59, 2, 'ヤモリ', 'タカラヤモリ', 'Gekko shibatai', 4, 0, '', 59, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(60, 2, 'ヤモリ', 'タワヤモリ', 'Gekko tawaensis', 4, 0, '', 60, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(61, 2, 'ヤモリ', '大東諸島のオガサワラヤモリ', 'Lepidodactylus lugubrisi', 12, 0, '', 61, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(62, 2, 'アガマ', 'オキナワキノボリトカゲ', 'Japalura polygonata polygonata', 9, 0, '1997年版まで、和名をキノボリトカゲとしていた。', 62, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(63, 2, 'アガマ', 'ヨナグニキノボリトカゲ', 'Japalura polygonata donan', 9, 0, '', 63, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(64, 2, 'アガマ', 'サキシマキノボリトカゲ', 'Japalura polygonata ishigakiensis', 4, 0, '', 64, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(65, 2, 'カナヘビ', 'ミヤコカナヘビ', 'Takydromus toyamai', 7, 0, '', 65, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(66, 2, 'カナヘビ', 'サキシマカナヘビ', 'Takydromus dorsalis', 9, 0, '', 66, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(67, 2, 'カナヘビ', 'コモチカナヘビ', 'Zootoca vivipara', 9, 0, '', 67, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(68, 2, 'カナヘビ', 'アムールカナヘビ', 'Takydromus amurensis', 4, 0, '', 68, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(69, 2, 'カナヘビ', '沖永良部島、徳之島のアオカナヘビ', 'Takydromus smaragdinusi', 12, 0, '', 69, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(70, 2, 'ナミヘビ', 'キクザトサワヘビ', 'Opisthotropis kikuzatoi', 7, 0, '', 70, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(71, 2, 'ナミヘビ', 'シュウダ', 'Elaphe carinata carinata', 8, 0, '', 71, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(72, 2, 'ナミヘビ', 'ヨナグニシュウダ', 'Elaphe carinata yonaguniensis', 8, 0, '', 72, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(73, 2, 'ナミヘビ', 'ミヤコヒバァ', 'Amphiesma concelarum', 8, 0, '', 73, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(74, 2, 'ナミヘビ', 'ミヤコヒメヘビ', 'Calamaria pfefferi', 8, 0, '1997年版まで、和名をヒメヘビとしていた。', 74, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(75, 2, 'ナミヘビ', 'ヤエヤマタカチホヘビ', 'Achalinus formosanus chigiraii', 9, 0, '', 75, 0, NULL, NULL, NULL, '2018-09-01 11:20:37'),
(76, 2, 'ナミヘビ', 'サキシマスジオ', 'Elaphe taeniura schmackeri', 9, 0, '', 76, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(77, 2, 'ナミヘビ', 'ミヤラヒメヘビ', 'Calamaria pavimentata miyarai', 9, 0, '', 77, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(78, 2, 'ナミヘビ', 'サキシマアオヘビ', 'Cyclophiops herminaei', 4, 0, '', 78, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(79, 2, 'ナミヘビ', 'サキシマバイカダ', 'Lycodon ruhstrati multifasciatusi', 4, 0, '', 79, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(80, 2, 'ナミヘビ', 'イワサキセダカヘビ', 'Pareas iwasakiii', 4, 0, '', 80, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(81, 2, 'ナミヘビ', 'アマミタカチホヘビ', 'Achalinus wernerii', 4, 0, '', 81, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(82, 2, 'ナミヘビ', 'アカマダラ', 'Dinodon rufozonatum rufozonatumi', 4, 0, '', 82, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(83, 2, 'ナミヘビ', 'ダンジョヒバカリ', 'Amphiesma vibakari danjoense', 5, 0, '', 83, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(84, 2, 'ナミヘビ', '宮古諸島のサキシママダラ', 'Dinodon rufozonatum walli', 12, 0, '', 84, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(85, 2, 'コブラ', 'クメジマハイ', 'Sinomicrurus japonicus takarai', 9, 0, '', 85, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(86, 2, 'コブラ', 'イワサキワモンベニヘビ', 'Hemibungarus macclellandi iwasakii', 9, 0, '', 86, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(87, 2, 'コブラ', 'ハイ', 'Sinomicrurus japonicus boettgeri', 4, 0, '', 87, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(88, 2, 'コブラ', 'ヒャン', 'Sinomicrurus japonicus japonicus', 4, 0, '', 88, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(89, 2, 'ウミヘビ', 'エラブウミヘビ', 'Laticauda semifasciata', 9, 0, '', 89, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(90, 2, 'ウミヘビ', 'ヒロオウミヘビ', 'Laticauda laticaudata', 9, 0, '', 90, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(91, 2, 'ウミヘビ', 'イイジマウミヘビ', 'Emydocephalus ijimae', 9, 0, '', 91, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(92, 2, 'クサリヘビ', 'トカラハブ', 'Protobothrops tokarensis', 4, 0, '', 92, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(93, 1, 'カイツブリ', '青森県のカンムリカイツブリ繁殖個体群', 'Podiceps cristatus cristatus', 12, 0, '', 93, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(94, 1, 'アホウドリ', 'コアホウドリ', 'Diomedea immutabilis', 8, 0, '', 94, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(95, 1, 'アホウドリ', 'アホウドリ', 'Diomedea albatrus', 9, 0, '', 95, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(96, 1, 'ミズナギドリ', 'オガサワラヒメミズナギドリ', 'Puffinus bryani', 7, 0, '', 96, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(97, 1, 'ミズナギドリ', 'セグロミズナギドリ', 'Puffinus lherminieri bannermani', 8, 1, '', 97, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(98, 1, 'ミズナギドリ', 'シロハラミズナギドリ', 'Pterodroma hypoleuca', 5, 0, '', 98, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(99, 1, 'ウミツバメ', 'クロコシジロウミツバメ', 'Oceanodroma castro', 7, 0, '', 99, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(100, 1, 'ウミツバメ', 'ヒメクロウミツバメ', 'Oceanodroma monorhis', 9, 0, '', 100, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(101, 1, 'ウミツバメ', 'オーストンウミツバメ', 'Oceanodroma tristrami', 4, 0, '', 101, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(102, 1, 'ウミツバメ', 'クロウミツバメ', 'Oceanodroma matsudairae', 4, 0, '', 102, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(103, 1, 'ネッタイチョウ', 'アカオネッタイチョウ', 'Phaethon rubricauda rothschildi', 8, 1, '', 103, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(104, 1, 'カツオドリ', 'アカアシカツオドリ', 'Sula sula rubripes', 8, 1, '', 104, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(105, 1, 'カツオドリ', 'アオツラカツオドリ', 'Sula dactylatra personata', 9, 0, '', 105, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(106, 1, 'ウ', 'チシマウガラス', 'Phalacrocorax urile', 7, 0, '', 106, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(107, 1, 'ウ', 'ヒメウ', 'Phalacrocorax pelagicus pelagicus', 8, 0, '', 107, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(108, 1, 'サギ', 'ハシブトゴイ', 'Nycticorax caledonicus crassirostris', 6, 0, '', 108, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(109, 1, 'サギ', 'オオヨシゴイ', 'Ixobrychus eurhythmus', 7, 0, '', 109, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(110, 1, 'サギ', 'サンカノゴイ', 'Botaurus stellaris stellaris', 8, 1, '', 110, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(111, 1, 'サギ', 'ミゾゴイ', 'Gorsachius goisagi', 9, 0, '', 111, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(112, 1, 'サギ', 'ズグロミゾゴイ', 'Gorsachius melanolophus', 9, 0, '', 112, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(113, 1, 'サギ', 'ヨシゴイ', 'Ixobrychus sinensis sinensis', 4, 0, '', 113, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(114, 1, 'サギ', 'チュウサギ', 'Egretta intermedia intermedia', 4, 0, '', 114, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(115, 1, 'サギ', 'カラシラサギ', 'Egretta eulophotes', 4, 0, '', 115, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(116, 1, 'コウノトリ', 'コウノトリ', 'Ciconia boyciana', 7, 0, '', 116, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(117, 1, 'コウノトリ', 'ナベコウ', 'Ciconia nigra', 2, 0, '', 117, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(118, 1, 'トキ', 'トキ', 'Nipponia nippon', 13, 0, '', 118, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(119, 1, 'トキ', 'クロツラヘラサギ', 'Platalea minor', 8, 0, '', 119, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(120, 1, 'トキ', 'ヘラサギ', 'Platalea leucorodia major', 5, 0, '', 120, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(121, 1, 'トキ', 'クロトキ', 'Threskiornis melanocephalus', 5, 0, '', 121, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(122, 1, 'カモ', 'カンムリツクシガモ', 'Tadorna cristata', 6, 0, '', 122, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(123, 1, 'カモ', 'シジュウカラガン', 'Branta canadensis leucopareia', 7, 0, '', 123, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(124, 1, 'カモ', 'ハクガン', 'Anser caerulescens caerulescens', 7, 0, '', 124, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(125, 1, 'カモ', 'カリガネ', 'Anser erythropus', 8, 0, '', 125, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(126, 1, 'カモ', 'コクガン', 'Branta bernicla orientalis', 9, 0, '', 126, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(127, 1, 'カモ', 'ヒシクイ', 'Anser fabalis serrirostris', 9, 0, '', 127, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(128, 1, 'カモ', 'ツクシガモ', 'Tadorna tadorna', 9, 0, '', 128, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(129, 1, 'カモ', 'トモエガモ', 'Anas formosa', 9, 0, '', 129, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(130, 1, 'カモ', 'マガン', 'Anser albifrons frontalis', 4, 0, '', 130, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(131, 1, 'カモ', 'オオヒシクイ', 'Anser fabalis middendorffii', 4, 0, '', 131, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(132, 1, 'カモ', 'サカツラガン', 'Anser cygnoides', 5, 0, '', 132, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(133, 1, 'カモ', 'アカツクシガモ', 'Tadorna ferruginea', 5, 0, '', 133, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(134, 1, 'カモ', 'オシドリ', 'Aix galericulata', 5, 0, '', 134, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(135, 1, 'カモ', 'アカハジロ', 'Aythya baeri', 5, 0, '', 135, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(136, 1, 'カモ', '東北地方以北のシノリガモ繁殖個体群', 'Histrionicus histrionicus pacificus', 12, 0, '', 136, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(137, 1, 'カモ', 'コハクチョウ', 'Cygnus columbianus jankowskii', 2, 0, '', 137, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(138, 1, 'カモ', 'コウライアイサ', 'Mergus squamatus', 5, 0, '', 138, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(139, 1, 'タカ', 'ダイトウノスリ', 'Buteo buteo oshiroi', 6, 1, '', 139, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(140, 1, 'タカ', 'カンムリワシ', 'Spilornis cheela perplexus', 7, 1, '', 140, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(141, 1, 'タカ', 'オジロワシ', 'Haliaeetus albicilla albicilla', 9, 0, '', 141, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(142, 1, 'タカ', 'リュウキュウツミ', 'Accipiter gularis iwasakii', 8, 1, '', 142, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(143, 1, 'タカ', 'オガサワラノスリ', 'Buteo buteo toyoshimai', 8, 1, '', 143, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(144, 1, 'タカ', 'クマタカ', 'Spizaetus nipalensis orientalis', 8, 0, '', 144, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(145, 1, 'タカ', 'イヌワシ', 'Aquila chrysaetos japonica', 8, 0, '', 145, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(146, 1, 'タカ', 'チュウヒ', 'Circus spilonotus spilonotus', 8, 0, '', 146, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(147, 1, 'タカ', 'オオワシ', 'Haliaeetus pelagicus pelagicus', 9, 0, '', 147, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(148, 1, 'タカ', 'サシバ', 'Butastur indicus', 9, 0, '', 148, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(149, 1, 'タカ', 'ミサゴ', 'Pandion haliaetus haliaetus', 4, 0, '', 149, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(150, 1, 'タカ', 'ハチクマ', 'Pernis apivorus orientalis', 4, 0, '', 150, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(151, 1, 'タカ', 'オオタカ', 'Accipiter gentilis fujiyamae', 4, 0, '', 151, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(152, 1, 'タカ', 'ハイタカ', 'Accipiter nisus nisosimilis', 4, 0, '', 152, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(153, 1, 'ハヤブサ', 'ハヤブサ', 'Falco peregrinus japonensis', 9, 1, '', 153, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(154, 1, 'ハヤブサ', 'シマハヤブサ', 'Falco peregrinus furuitii', 5, 1, '', 154, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(155, 1, 'ハヤブサ', 'オオハヤブサ', 'Falco peregrinus pealei', 5, 0, '', 155, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(156, 1, 'ハヤブサ', 'シベリアハヤブサ', 'Falco peregrinus harterti', 2, 0, '', 156, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(157, 1, 'ライチョウ', 'ライチョウ', 'Lagopus mutus japonicus', 8, 1, '', 157, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(158, 1, 'ライチョウ', 'エゾライチョウ', 'Tetrastes bonasia vicinitas', 5, 0, '', 158, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(159, 1, 'キジ', 'ウズラ', 'Coturnix japonica', 9, 0, '', 159, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(160, 1, 'キジ', 'アカヤマドリ', 'Syrmaticus soemmerringii soemmerringii', 4, 1, '', 160, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(161, 1, 'キジ', 'コシジロヤマドリ', 'Syrmaticus soemmerringii ijimae', 4, 1, '', 161, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(162, 1, 'ツル', 'タンチョウ', 'Grus japonensis', 9, 0, '', 162, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(163, 1, 'ツル', 'ナベヅル', 'Grus monacha', 9, 0, '', 163, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(164, 1, 'ツル', 'マナヅル', 'Grus vipio', 9, 0, '', 164, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(165, 1, 'ツル', 'クロヅル', 'Grus grus lilfordi', 5, 0, '', 165, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(166, 1, 'ツル', 'カナダヅル', 'Grus canadensis canadensis', 2, 0, '', 166, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(167, 1, 'ツル', 'ソデグロヅル', 'Grus leucogeranus', 2, 0, '', 167, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(168, 1, 'ツル', 'アネハヅル', 'Anthropoides virgo', 2, 0, '', 168, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(169, 1, 'クイナ', 'マミジロクイナ', 'Poliolimnas cinereus brevipes', 6, 1, '', 169, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(170, 1, 'クイナ', 'ヤンバルクイナ', 'Gallirallus okinawae', 7, 1, '', 170, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(171, 1, 'クイナ', 'オオクイナ', 'Rallina eurizonoides sepiaria', 8, 1, '', 171, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(172, 1, 'クイナ', 'シマクイナ', 'Coturnicops noveboracensis exquisitus', 8, 0, '', 172, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(173, 1, 'クイナ', 'ヒクイナ', 'Porzana fusca erythrothorax', 4, 0, '', 173, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(174, 1, 'ノガン', 'ノガン', 'Otis tarda dybowskii', 2, 0, '', 174, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(175, 1, 'タマシギ', 'タマシギ', 'Rostratula benghalensis benghalensis', 9, 0, '', 175, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(176, 1, 'チドリ', 'シロチドリ', 'Charadrius alexandrinus', 9, 0, '', 176, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(177, 1, 'シギ', 'ヘラシギ', 'Eurynorhynchus pygmeus', 7, 0, '', 177, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(178, 1, 'シギ', 'カラフトアオアシシギ', 'Tringa guttifer', 7, 0, '', 178, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(179, 1, 'シギ', 'コシャクシギ', 'Numenius minutus', 8, 0, '', 179, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(180, 1, 'シギ', 'ツルシギ', 'Tringa erythropus', 9, 0, '', 180, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(181, 1, 'シギ', 'アカアシシギ', 'Tringa totanus ussuriensis', 9, 0, '', 181, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(182, 1, 'シギ', 'タカブシギ', 'Tringa glareola', 9, 0, '', 182, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(183, 1, 'シギ', 'オオソリハシシギ', 'Limosa lapponica', 9, 0, '', 183, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(184, 1, 'シギ', 'ホウロクシギ', 'Numenius madagascariensis', 9, 0, '', 184, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(185, 1, 'シギ', 'アマミヤマシギ', 'Scolopax mira', 9, 1, '', 185, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(186, 1, 'シギ', 'ハマシギ', 'Calidris alpina', 4, 0, '', 186, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(187, 1, 'シギ', 'オオジシギ', 'Gallinago hardwickii', 4, 0, '', 187, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(188, 1, 'シギ', 'ケリ', 'Vanellus cinereus', 5, 0, '', 188, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(189, 1, 'シギ', 'チシマシギ', 'Calidris ptilocnemis kurilensis', 5, 0, '', 189, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(190, 1, 'シギ', 'シベリアオオハシシギ', 'Limnodromus semipalmatus', 5, 0, '', 190, 0, NULL, NULL, NULL, '2018-09-01 11:20:38'),
(191, 1, 'シギ', 'シロハラチュウシャクシギ', 'Numenius tenuirostris', 2, 0, '', 191, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(192, 1, 'セイタカシギ', 'セイタカシギ', 'Himantopus himantopus himantopus', 9, 0, '', 192, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(193, 1, 'セイタカシギ', 'ツバメチドリ', 'Glareola maldivarum', 9, 0, '', 193, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(194, 1, 'カモメ', 'ズグロカモメ', 'Larus saundersi', 9, 0, '', 194, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(195, 1, 'カモメ', 'オオアジサシ', 'Thalasseus bergii cristatus', 9, 0, '', 195, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(196, 1, 'カモメ', 'ベニアジサシ', 'Sterna dougallii bangsi', 9, 0, '', 196, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(197, 1, 'カモメ', 'エリグロアジサシ', 'Sterna sumatrana', 9, 0, '', 197, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(198, 1, 'カモメ', 'コアジサシ', 'Sterna albifrons sinensis', 9, 0, '', 198, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(199, 1, 'ウミスズメ', 'ウミガラス', 'Uria aalge inornata', 7, 0, '', 199, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(200, 1, 'ウミスズメ', 'ウミスズメ', 'Synthliboramphus antiquus', 7, 0, '', 200, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(201, 1, 'ウミスズメ', 'エトピリカ', 'Lunda cirrhata', 7, 0, '', 201, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(202, 1, 'ウミスズメ', 'ケイマフリ', 'Cepphus carbo', 9, 0, '', 202, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(203, 1, 'ウミスズメ', 'カンムリウミスズメ', 'Synthliboramphus wumizusume', 9, 0, '', 203, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(204, 1, 'ウミスズメ', 'マダラウミスズメ', 'Brachyramphus marmoratus perdix', 5, 0, '', 204, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(205, 1, 'ハト', 'リュウキュウカラスバト', 'Columba jouyi', 6, 1, '', 205, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(206, 1, 'ハト', 'オガサワラカラスバト', 'Columba versicolor', 6, 1, '', 206, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(207, 1, 'ハト', 'アカガシラカラスバト', 'Columba janthina nitens', 7, 1, '', 207, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(208, 1, 'ハト', 'ヨナクニカラスバト', 'Columba janthina stejnegeri', 8, 1, '', 208, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(209, 1, 'ハト', 'シラコバト', 'Streptopelia decaocto decaocto', 8, 0, '', 209, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(210, 1, 'ハト', 'キンバト', 'Chalcophaps indica yamashinai', 8, 1, '', 210, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(211, 1, 'ハト', 'カラスバト', 'Columba janthina janthina', 4, 0, '', 211, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(212, 1, 'フクロウ', 'ワシミミズク', 'Bubo bubo', 7, 0, '', 212, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(213, 1, 'ヨタカ', 'ヨタカ', 'Caprimulgus indicus jotaka', 4, 0, '', 213, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(214, 1, 'カワセミ', 'ミヤコショウビン', 'Halcyon miyakoensis', 6, 1, '', 214, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(215, 1, 'ブッポウソウ', 'ブッポウソウ', 'Eurystomus orientalis calonyx', 8, 0, '', 215, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(216, 1, 'キツツキ', 'キタタキ', 'Dryocopus javensis richardsi', 6, 0, '', 216, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(217, 1, 'キツツキ', 'ノグチゲラ', 'Sapheopipo noguchii', 7, 1, '', 217, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(218, 1, 'キツツキ', 'ミユビゲラ', 'Picoides tridactylus inouyei', 7, 1, '', 218, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(219, 1, 'キツツキ', 'クマゲラ', 'Dryocopus martius martius', 9, 0, '', 219, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(220, 1, 'キツツキ', 'オーストンオオアカゲラ', 'Dendrocopos leucotos owstoni', 9, 1, '', 220, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(221, 1, 'キツツキ', 'アマミコゲラ', 'Dendrocopos kizuki amamii', 9, 0, '', 221, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(222, 1, 'ヤイロチョウ', 'ヤイロチョウ', 'Pitta brachyura nympha', 8, 0, '', 222, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(223, 1, 'ヤイロチョウ', 'サンショウクイ', 'Pericrocotus divaricatus divaricatus', 9, 0, '', 223, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(224, 1, 'ヒヨドリ', 'シロガシラ（ヤエヤマシロガシラ）', 'Pycnonotus sinensis orii', 2, 0, '', 224, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(225, 1, 'モズ', 'チゴモズ', 'Lanius tigrinus', 7, 0, '', 225, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(226, 1, 'モズ', 'アカモズ', 'Lanius cristatus superciliosus', 8, 0, '', 226, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(227, 1, 'ミソサザイ', 'ダイトウミソサザイ', 'Troglodytes troglodytes orii', 6, 1, '', 227, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(228, 1, 'ミソサザイ', 'モスケミソサザイ', 'Troglodytes troglodytes mosukei', 8, 1, '', 228, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(229, 1, 'ツグミ', 'オガサワラガビチョウ', 'Cichlopasser terrestris', 6, 1, '', 229, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(230, 1, 'ツグミ', 'ホントウアカヒゲ', 'Erithacus komadori namiyei', 8, 1, '', 230, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(231, 1, 'ツグミ', 'アカコッコ', 'Turdus celaenops', 8, 1, '', 231, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(232, 1, 'ツグミ', 'タネコマドリ', 'Erithacus akahige tanensis', 9, 1, '', 232, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(233, 1, 'ツグミ', 'アカヒゲ', 'Erithacus komadori komadori', 9, 1, '', 233, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(234, 1, 'ツグミ', 'オオトラツグミ', 'Zoothera dauma major', 9, 1, '', 234, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(235, 1, 'ツグミ', 'ウスアカヒゲ', 'Erithacus komadori subrufus', 5, 1, '', 235, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(236, 1, 'ツグミ', 'コトラツグミ', 'Zoothera dauma horsfieldi', 5, 0, '', 236, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(237, 1, 'ウグイス', 'ダイトウウグイス', 'Cettia diphone restricta', 6, 1, '[8]', 237, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(238, 1, 'ウグイス', 'オオセッカ', 'Locustella pryeri pryeri', 8, 1, '', 238, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(239, 1, 'ウグイス', 'ウチヤマセンニュウ', 'Locustella pleskei', 8, 0, '[9]', 239, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(240, 1, 'ウグイス', 'イイジマムシクイ', 'Phylloscopus ijimae', 9, 1, '', 240, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(241, 1, 'ウグイス', 'マキノセンニュウ', 'Locustella lanceolata', 4, 0, '', 241, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(242, 1, 'ウグイス', 'ウグイスの1亜種', 'Cettia diphone ssp.', 5, 0, '', 242, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(243, 1, 'シジュウカラ', 'ダイトウヤマガラ', 'Parus varius orii', 6, 1, '', 243, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(244, 1, 'シジュウカラ', 'ナミエヤマガラ', 'Parus varius namiyei', 8, 1, '', 244, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(245, 1, 'シジュウカラ', 'オーストンヤマガラ', 'Parus varius owstoni', 8, 1, '', 245, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(246, 1, 'シジュウカラ', 'オリイヤマガラ', 'Parus varius olivaceus', 4, 1, '', 246, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(247, 1, 'ミツスイ', 'ムコジマメグロ', 'Apalopteron familiare familiare', 6, 1, '', 247, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(248, 1, 'ミツスイ', 'ハハジマメグロ', 'Apalopteron familiare hahasima', 8, 1, '', 248, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(249, 1, 'ホオジロ', 'シマアオジ', 'Emberiza aureola ornata', 7, 0, '', 249, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(250, 1, 'ホオジロ', 'コジュリン', 'Emberiza yessoensis yessoensis', 9, 0, '', 250, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(251, 1, 'ホオジロ', 'ノジコ', 'Emberiza sulphurata', 4, 1, '', 251, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(252, 1, 'アトリ', 'オガサワラマシコ', 'Chaunoproctus ferreorostris', 6, 1, '', 252, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(253, 1, 'アトリ', 'オガサワラカワラヒワ', 'Carduelis sinica kittlitzi', 7, 1, '', 253, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(254, 1, 'カラス', 'ルリカケス', 'Garrulus lidthi', 9, 1, '', 254, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(255, 1, 'カササギ', 'カササギ', 'Pica pica sericea', 2, 0, '', 255, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(256, 3, 'トガリネズミ', 'オリイジネズミ', 'Crocidura orii', 8, 0, '', 256, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(257, 3, 'トガリネズミ', 'トウキョウトガリネズミ', 'Sorex minutissimus hawkeri', 9, 0, '', 257, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(258, 3, 'トガリネズミ', 'アズミトガリネズミ', 'Sorex hosonoi', 4, 0, '2006年版までは亜種別に評価していた。', 258, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(259, 3, 'トガリネズミ', 'シコクトガリネズミ', 'Sorex shinto shikokensis', 4, 0, '', 259, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(260, 3, 'トガリネズミ', 'コジネズミ', 'Crocidura shantungensis', 4, 0, '1998年版まではチョウセンコジネズミで評価した。', 260, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(261, 3, 'トガリネズミ', 'ワタセジネズミ', 'Crocidura watasei', 4, 0, '', 261, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(262, 3, 'トガリネズミ', '九州地方のカワネズミ', 'Chimarrogale platycephala', 12, 0, '', 262, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(263, 3, 'トガリネズミ', 'サドトガリネズミ', 'Sorex sadonisus', 4, 0, '', 263, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(264, 3, 'モグラ', 'センカクモグラ', 'Mogera uchidai', 7, 0, '', 264, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(265, 3, 'モグラ', 'エチゴモグラ', 'Mogera etigo', 8, 0, '1991年版では種サドモグラで評価した。', 265, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(266, 3, 'モグラ', 'ミズラモグラ', 'Euroscaptor mizura', 4, 0, '2006年版までは亜種別に評価していた。', 266, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(267, 3, 'モグラ', 'サドモグラ', 'Mogera tokudae', 4, 0, '', 267, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(268, 3, 'オオコウモリ', 'オキナワオオコウモリ', 'Pteropus loochoensis', 6, 0, '', 268, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(269, 3, 'オオコウモリ', 'ダイトウオオコウモリ', 'Pteropus dasymallus daitoensis', 7, 0, '', 269, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(270, 3, 'オオコウモリ', 'エラブオオコウモリ', 'Pteropus dasymallus dasymallus', 7, 0, '', 270, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(271, 3, 'オオコウモリ', 'オガサワラオオコウモリ', 'Pteropus pselaphon', 8, 0, '', 271, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(272, 3, 'オオコウモリ', 'オリイオオコウモリ', 'Pteropus dasymallus inopinatus', 2, 0, '', 272, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(273, 3, 'オオコウモリ', 'ミヤココキクガシラコウモリ', 'Rhinolophus pumilus miyakonis', 6, 0, '', 273, 1, NULL, '176.190.58.145', NULL, '2020-02-27 14:47:22'),
(274, 3, 'オオコウモリ', 'オリイコキクガシラコウモリ', 'Rhinolophus cornutus orii', 8, 0, '', 274, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(275, 3, 'オオコウモリ', 'オキナワコキクガシラコウモリ', 'Rhinolophus pumilus pumilus', 8, 0, '', 275, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(276, 3, 'オオコウモリ', 'ヤエヤマコキクガシラコウモリ', 'Rhinolophus perditus', 9, 0, '2006年版までは亜種別に評価していた。', 276, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(277, 3, 'カグラコウモリ', '与那国島のカグラコウモリ', 'Hipposideros turpis', 3, 0, '2006年版までは種で評価していた。', 277, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(278, 3, 'カグラコウモリ', '波照間島のカグラコウモリ', 'Hipposideros turpis', 3, 0, '2006年版までは種で評価していた。', 278, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(279, 3, 'ヒナコウモリ', 'オガサワラアブラコウモリ', 'Pipistrellus sturdeei', 6, 0, '', 279, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(280, 3, 'ヒナコウモリ', 'クロアカコウモリ', 'Myotis formosus', 7, 0, '2006年版までは亜種ツシマクロアカコウモリとして評価していた。', 280, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(281, 3, 'ヒナコウモリ', 'ヤンバルホオヒゲコウモリ', 'Myotis yanbarensis', 7, 0, '', 281, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(282, 3, 'ヒナコウモリ', 'コヤマコウモリ', 'Nyctalus furvus', 8, 0, '', 282, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(283, 3, 'ヒナコウモリ', 'リュウキュウユビナガコウモリ', 'Miniopterus fuscus', 8, 0, '', 283, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(284, 3, 'ヒナコウモリ', 'リュウキュウテングコウモリ', 'Murina ryukyuana', 8, 0, '', 284, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(285, 3, 'ヒナコウモリ', 'クビワコウモリ', 'Eptesicus japonensis', 9, 0, '', 285, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(286, 3, 'ヒナコウモリ', 'ヤマコウモリ', 'Nyctalus aviator', 9, 0, '', 286, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(287, 3, 'ヒナコウモリ', 'モリアブラコウモリ', 'Pipistrellus endoi', 9, 0, '', 287, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(288, 3, 'ヒナコウモリ', 'ウスリホオヒゲコウモリ', 'Myotis gracilis', 9, 0, '', 288, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(289, 3, 'ヒナコウモリ', 'ホンドノレンコウモリ', 'Myotis nattereri bombinus', 9, 0, '', 289, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(290, 3, 'ヒナコウモリ', 'クロホオヒゲコウモリ', 'Myotis pruinosus', 9, 0, '', 290, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(291, 3, 'ヒナコウモリ', 'オオアブラコウモリ', 'Pipistrellus savii', 5, 0, '2006年版までは亜種別に評価されていた', 291, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(292, 3, 'ヒナコウモリ', 'ヒメヒナコウモリ', 'Vespertilio murinus', 5, 0, '', 292, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(293, 3, 'ヒナコウモリ', 'クチバテングコウモリ', 'Murina tenebrosa', 5, 0, '', 293, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(294, 3, 'ヒナコウモリ', '本州のチチブコウモリ', 'Barbastella leucomelas darjelingensis', 12, 0, '1998年版ではチチブコウモリで評価した。', 294, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(295, 3, 'ヒナコウモリ', '四国のチチブコウモリ', 'Barbastella leucomelas darjelingensis', 12, 0, '1998年版ではチチブコウモリで評価した。', 295, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(296, 3, 'ヒナコウモリ', '近畿地方以西のウサギコウモリ', 'Plecotus sacrimontis', 12, 0, '', 296, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(297, 3, 'ヒナコウモリ', '紀伊半島のシナノホオヒゲコウモリ', 'Myotis ikonnikovi hosonoi', 12, 0, '1991年版では種ヒメホオヒゲコウモリ、2006年版までは亜種シナノホオヒゲコウモリで評価されていた。', 297, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(298, 3, 'ヒナコウモリ', '中国地方のシナノホオヒゲコウモリ', 'Myotis ikonnikovi hosonoi', 12, 0, '1991年版では種ヒメホオヒゲコウモリ、2006年版までは亜種シナノホオヒゲコウモリで評価されていた。', 298, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(299, 3, 'ヒナコウモリ', 'ヒメホリカワコウモリ', 'Eptesicus nilssonii parvus', 8, 0, '', 299, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(300, 3, 'ヒナコウモリ', 'ニホンコテングコウモリ', 'Murina ussuriensis silvatica', 9, 0, '', 300, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(301, 3, 'ヒナコウモリ', 'テングコウモリ', 'Murina hilgendorfi', 9, 0, '1998年版ではニホンテングコウモリで評価した。', 301, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(302, 3, 'ヒナコウモリ', 'ウスリドーベントンコウモリ', 'Myotis daubentonii ussuriensis', 9, 0, '', 302, 0, NULL, NULL, NULL, '2018-09-01 11:20:39'),
(303, 3, 'ヒナコウモリ', 'カグヤコウモリ', 'Myotis frater kaguyae', 9, 0, '', 303, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(304, 3, 'ヒナコウモリ', 'フジホオヒゲコウモリ', 'Myotis ikonnikovi fujiensis', 4, 0, '1991年版では種ヒメホオヒゲコウモリで評価した。', 304, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(305, 3, 'ヒナコウモリ', 'ヒメホオヒゲコウモリ', 'Myotis ikonnikovi ikonnikovi', 8, 0, '', 305, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(306, 3, 'ヒナコウモリ', 'オゼホオヒゲコウモリ', 'Myotis ikonnikovi ozensis', 5, 0, '', 306, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(307, 3, 'ヒナコウモリ', 'エゾホオヒゲコウモリ', 'Myotis ikonnikovi yesoensis', 8, 0, '1991年版では種ヒメホオヒゲコウモリで評価した。', 307, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(308, 3, 'ヒナコウモリ', 'ヒナコウモリ', 'Vespertilio superans', 9, 0, '', 308, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(309, 3, 'オヒキコウモリ', 'オヒキコウモリ', 'Tadarida insignis', 9, 0, '', 309, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(310, 3, 'オヒキコウモリ', 'スミイロオヒキコウモリ', 'Tadarida latouchei', 5, 0, '1991年版では種オヒキコウモリで評価した。', 310, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(311, 3, 'オナガザル', '北奥羽・北上山系のホンドザル', 'Macaca fuscata fuscata', 12, 0, '1991年版では東北地方のニホンザル個体群（下北半島の個体群を除く）で、1998年版では「東北地方のホンドザル」で評価した。', 311, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(312, 3, 'オナガザル', '金華山のホンドザル', 'Macaca fuscata fuscata', 12, 0, '1991年版では東北地方のニホンザル個体群（下北半島の個体群を除く）で、1998年版では「東北地方のホンドザル」で評価した。', 312, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(313, 3, 'オナガザル', 'ヤクシマザル', 'Macaca fuscata yakui', 4, 0, '', 313, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(314, 3, 'オナガザル', '下北半島のホンドザル', 'Macaca fuscata fuscata(population in Shimokita Peninsula)', 12, 0, '1991年版では「下北半島のニホンザル個体群（青森県）」で評価した。', 314, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(315, 3, 'リス', 'エゾシマリス', 'Tamias sibiricus lineatus', 5, 0, '', 315, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(316, 3, 'リス', '中国地方のニホンリス', 'Sciurus lis', 12, 0, '1991年版では「琵琶湖以西のニホンリス個体群」で、中国地方以西（四国を除く）のニホンリスで評価した。', 316, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(317, 3, 'リス', '九州地方のニホンリス', 'Sciurus lis', 12, 0, '1991年版では「琵琶湖以西のニホンリス個体群」で、中国地方以西（四国を除く）のニホンリスで評価した。', 317, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(318, 3, 'リス', 'ホンドモモンガ', 'Pteromys momonga', 2, 0, '', 318, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(319, 3, 'ヤマネ', 'ヤマネ', 'Glirulus japonicus', 4, 0, '', 319, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(320, 3, 'ネズミ', 'セスジネズミ', 'Apodemus agrarius', 7, 0, '', 320, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(321, 3, 'ネズミ', 'オキナワトゲネズミ', 'Tokudaia muenninki', 7, 0, '1991年版では種アマミトゲネズミで評価した。', 321, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(322, 3, 'ネズミ', 'アマミトゲネズミ', 'Tokudaia osimensis', 8, 0, '', 322, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(323, 3, 'ネズミ', 'トクノシマトゲネズミ', 'Tokudaia tokunoshimensis', 8, 0, '1998年版まではアマミトゲネズミに含めて評価した。', 323, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(324, 3, 'ネズミ', 'ケナガネズミ', 'Diplothrix legata', 8, 0, '', 324, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(325, 3, 'ネズミ', 'ミヤマムクゲネズミ', 'Clethrionomys rex montanus', 4, 0, '', 325, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(326, 3, 'ネズミ', 'リシリムクゲネズミ', 'Clethrionomys rex rex', 4, 0, '', 326, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(327, 3, 'ネズミ', 'ワカヤマヤチネズミ', 'Eothenomys imaizumii', 2, 0, '', 327, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(328, 3, 'ネズミ', 'ミヤケアカネズミ', 'Apodemus miyakensis', 2, 0, '', 328, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(329, 3, 'ネズミ', 'カラフトアカネズミ', 'Apodemus peninsulae giliacus', 2, 0, '', 329, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(330, 3, 'ナキウサギ', 'エゾナキウサギ', 'Ochotona hyperborea yesoensis', 4, 0, '1998年版では「夕張・芦別のナキウサギ」で、2006年版までは「夕張・芦別のエゾナキウサギ」で評価されていた。', 330, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(331, 3, 'ウサギ', 'アマミノクロウサギ', 'Pentalagus furnessi', 8, 0, '', 331, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(332, 3, 'ウサギ', 'サドノウサギ', 'Lepus brachyurus lyoni', 4, 0, '', 332, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(333, 3, 'クマ', '天塩・増毛地方のエゾヒグマ', 'Ursus arctos yesoensis', 12, 0, '', 333, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(334, 3, 'クマ', '石狩西部のエゾヒグマ', 'Ursus arctos yesoensis', 12, 0, '', 334, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(335, 3, 'クマ', '下北半島のツキノワグマ', 'Ursus thibetanus japonicus', 12, 0, '', 335, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(336, 3, 'クマ', '紀伊半島のツキノワグマ', 'Ursus thibetanus japonicus', 12, 0, '', 336, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(337, 3, 'クマ', '東中国地域のツキノワグマ', 'Ursus thibetanus japonicus', 12, 0, '1991年版では「東中国山地（氷ノ山）のツキノワグマ個体群」で評価した。', 337, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(338, 3, 'クマ', '西中国地域のツキノワグマ', 'Ursus thibetanus japonicus', 12, 0, '1991年版では「西中国地域のツキノワグマ個体群（島根県、広島県、山口県）」で評価した。', 338, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(339, 3, 'クマ', '四国山地のツキノワグマ', 'Ursus thibetanus japonicus', 12, 0, '', 339, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(340, 3, 'クマ', '九州地方のツキノワグマ', 'Ursus thibetanus japonicus', 12, 0, '', 340, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(341, 3, 'イヌ', 'エゾオオカミ', 'Canis lupus hattai', 6, 0, '', 341, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(342, 3, 'イヌ', 'ニホンオオカミ', 'Canis lupus hodophilax', 6, 0, '', 342, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(343, 3, 'イタチ', 'ニホンカワウソ（本州以南亜種）', 'Lutra lutra nippon', 6, 0, '1991年版ではニホンカワウソ（Lutra nippon）で評価した。', 343, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(344, 3, 'イタチ', 'ニホンカワウソ（北海道亜種）', 'Lutra lutra whiteleyi', 6, 0, '1991年版ではニホンカワウソ（Lutra nippon）で評価した。', 344, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(345, 3, 'イタチ', 'ラッコ', 'Enhydra lutris', 7, 0, '', 345, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(346, 3, 'イタチ', 'チョウセンイタチ', 'Mustela sibirica coreana', 4, 0, '自然分布域である対馬の個体群が対象である（国内移入である西日本地域は対象外）。', 346, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(347, 3, 'イタチ', 'ニホンイイズナ（本州亜種）', 'Mustela nivalis namiyei', 4, 0, '1991年版では「青森県の「ニホンイイズナ個体群」で、2006年版では「本州のニホンイイズナ」として評価されていた。', 347, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(348, 3, 'イタチ', 'ホンドオコジョ', 'Mustela erminea nippon', 4, 0, '', 348, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(349, 3, 'イタチ', 'エゾオコジョ', 'Mustela erminea orientalis', 4, 0, '', 349, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(350, 3, 'イタチ', 'ツシマテン', 'Martes melampus tsuensis', 4, 0, '', 350, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(351, 3, 'イタチ', 'エゾクロテン', 'Martes zibellina brachyura', 4, 0, '', 351, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(352, 3, 'ネコ', 'イリオモテヤマネコ', 'Prionailurus bengalensis iriomotensis', 7, 0, '', 352, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(353, 3, 'ネコ', 'ツシマヤマネコ', 'Prionailurus bengalensis euptilura', 7, 0, '', 353, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(354, 3, 'アシカ', 'ニホンアシカ', 'Zalophus japonicus', 7, 0, '', 354, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(355, 3, 'アシカ', 'トド', 'Eumetopias jubatus', 4, 0, '', 355, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(356, 3, 'アザラシ', 'ゼニガタアザラシ', 'Phoca vitulina', 9, 0, '', 356, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(357, 3, 'イノシシ', '徳之島のリュウキュウイノシシ', 'Sus scrofa riukiuanus', 12, 0, '', 357, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(358, 3, 'シカ', '馬毛島のニホンジカ', 'Cervus nippon', 12, 0, '', 358, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(359, 3, 'シカ', 'ケラマジカ', 'Cervus nippon keramae', 1, 0, '', 359, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(360, 3, 'シカ', 'ヤクシカ', 'Cervus nippon yakushimae', 2, 0, '', 360, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(361, 3, 'シカ', 'ツシマジカ', 'Cervus pulchellus', 2, 0, '', 361, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(362, 3, 'ウシ', '九州地方のカモシカ', 'Capricornis crispus', 12, 0, '1991年版では「九州のニホンカモシカ個体群」で評価した。', 362, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(363, 3, 'ウシ', '四国のニホンカモシカ個体群', 'Capricornis crispus crispus', 12, 0, '', 363, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(364, 3, 'ジュゴン', 'ジュゴン', 'Dugong dugon', 7, 0, '', 364, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(365, 5, 'ヤツメウナギ', 'スナヤツメ北方種', 'Lethenteron sp. 1', 9, 0, '1999年版では「スナヤツメL. reissneri」で評価した。', 365, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(366, 5, 'ヤツメウナギ', 'スナヤツメ南方種', 'Lethenteron sp. 2', 9, 0, '1999年版では「スナヤツメLethenteron reissneri」で評価した。', 366, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(367, 5, 'ヤツメウナギ', 'カワヤツメ', 'Lethenteron japonicum', 9, 0, '', 367, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(368, 5, 'ヤツメウナギ', 'シベリアヤツメ', 'Lethenteron kessleri', 4, 0, '', 368, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(369, 5, 'ヤツメウナギ', '栃木県のミツバヤツメ', 'Entosphenus tridentatus', 12, 0, '1999年版では「ミツバヤツメ」で評価した。', 369, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(370, 5, 'ヤツメウナギ', 'ユウフツヤツメ', 'Lampetra tridentata', 2, 0, '', 370, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(371, 5, 'チョウザメ', 'チョウザメ', 'Acipenser medirostris', 6, 0, '', 371, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(372, 5, 'ウナギ', 'ニホンウナギ', 'Anguilla japonica', 5, 0, '絶滅危惧IB類[注 1]', 372, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(373, 5, 'ウナギ', 'ニューギニアウナギ', 'Anguilla bicolor pacifica', 5, 0, '情報不足', 373, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(374, 5, 'ウツボ', 'コゲウツボ', 'Uropterygius concolor', 7, 0, '絶滅危惧IA類', 374, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(375, 5, 'ウツボ', 'ナミダカワウツボ', 'Echidna rhodochilus', 7, 0, '絶滅危惧IA類', 375, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(376, 5, 'カタクチイワシ', 'エツ', 'Coilia nasus', 9, 0, '1991年版では「エツ」と「佐賀県六角川のエツ個体群」に分けて評価した。', 376, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(377, 5, 'ニシン', 'ドロクイ', 'Nematalosa japonica', 8, 0, '', 377, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(378, 5, 'ニシン', '太平洋側湖沼系群のニシン', 'Clupea pallasii', 12, 0, '', 378, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(379, 5, 'ドジョウ', 'スジシマドジョウ小型種山陽型', 'Cobitis sp., S San-yo form', 7, 0, '1999年版では「スジシマドジョウ小型種」で評価した。', 379, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(380, 5, 'ドジョウ', 'アユモドキ', 'Leptobotia curta', 7, 0, '', 380, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(381, 5, 'ドジョウ', 'イシドジョウ', 'Cobitis takatsuensis', 8, 0, '', 381, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(382, 5, 'ドジョウ', 'ヒナイシドジョウ', 'Cobitis shikokuensis', 8, 0, '1999年版では「イシドジョウ」に含められていた（2006年11月に新種記載）。', 382, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(383, 5, 'ドジョウ', 'スジシマドジョウ大型種', 'Cobitis sp. L', 8, 0, '', 383, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(384, 5, 'ドジョウ', 'スジシマドジョウ小型種東海型', 'Cobitis sp., S Tokai form', 8, 0, '1999年版では「スジシマドジョウ小型種」で評価した。', 384, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(385, 5, 'ドジョウ', 'スジシマドジョウ小型種琵琶湖型（淀川個体群を含む）', 'Cobitis sp., S Biwako form', 8, 0, '1999年版では「スジシマドジョウ小型種」で評価した。', 385, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(386, 5, 'ドジョウ', 'スジシマドジョウ小型種山陰型', 'Cobitis sp., S San-in form', 8, 0, '1999年版では「スジシマドジョウ小型種」で評価した。', 386, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(387, 5, 'ドジョウ', 'スジシマドジョウ小型種九州型', 'Cobitis sp., S Kyushu form', 8, 0, '1999年版では「スジシマドジョウ小型種」で評価した。', 387, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(388, 5, 'ドジョウ', 'エゾホトケドジョウ', 'Lefua nikkonis', 8, 0, '', 388, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(389, 5, 'ドジョウ', 'ホトケドジョウ', 'Lefua echigonia', 8, 0, '', 389, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(390, 5, 'ドジョウ', 'ナガレホトケドジョウ', 'Lefua sp.', 8, 0, '', 390, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(391, 5, 'ドジョウ', 'アジメドジョウ', 'Niwaella delicata', 9, 0, '1999年版では「大阪府のアジメドジョウ」で評価した。', 391, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(392, 5, 'ドジョウ', 'ヤマトシマドジョウ', 'Cobitis matsubarae', 9, 0, '', 392, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(393, 5, 'ドジョウ', 'スジシマドジョウ中型種', 'Cobitis sp. M', 9, 0, '', 393, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(394, 5, 'コイ', 'スワモロコ', 'Gnathopogon elongatus suwae', 6, 0, '', 394, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(395, 5, 'コイ', 'ミヤコタナゴ', 'Tanakia tanago', 7, 0, '', 395, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(396, 5, 'コイ', 'イチモンジタナゴ', 'Acheilognathus cyanostigma', 7, 0, '', 396, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(397, 5, 'コイ', 'イタセンパラ', 'Acheilognathus longipinnis', 7, 0, '', 397, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(398, 5, 'コイ', 'セボシタビラ', 'Acheilognathus tabira nakamurae', 7, 0, '', 398, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(399, 5, 'コイ', 'ゼニタナゴ', 'Acheilognathus typus', 7, 0, '', 399, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(400, 5, 'コイ', 'ニッポンバラタナゴ', 'Rhodeus ocellatus kurumeus', 7, 0, '', 400, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(401, 5, 'コイ', 'スイゲンゼニタナゴ', 'Rhodeus atremius suigensis', 7, 0, '', 401, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(402, 5, 'コイ', 'ヒナモロコ', 'Aphyocypris chinensis', 7, 0, '', 402, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(403, 5, 'コイ', 'シナイモツゴ', 'Pseudorasbora pumila pumila', 7, 0, '', 403, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(404, 5, 'コイ', 'ウシモツゴ', 'Pseudorasbora pumilasubsp.', 7, 0, '', 404, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(405, 5, 'コイ', 'アブラヒガイ', 'Sarcocheilichthys biwaensis', 7, 0, '', 405, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(406, 5, 'コイ', 'ホンモロコ', 'Gnathopogon caerulescens', 7, 0, '', 406, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(407, 5, 'コイ', 'ゲンゴロウブナ', 'Carassius cuvieri', 8, 0, '', 407, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(408, 5, 'コイ', 'ニゴロブナ', 'Carassius auratus grandoculis', 8, 0, '', 408, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(409, 5, 'コイ', 'タナゴ', 'Acheilognathus melanogaster', 8, 0, '', 409, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(410, 5, 'コイ', 'シロヒレタビラ', 'Acheilognathus tabira tabira', 8, 0, '', 410, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(411, 5, 'コイ', '山陰地方のアカヒレタビラ', 'Acheilognathus tabirasubsp.', 8, 0, '', 411, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(412, 5, 'コイ', 'カゼトゲタナゴ', 'Rhodeus atremius atremius', 8, 0, '', 412, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(413, 5, 'コイ', 'ワタカ', 'Ischikauia steenackeri', 8, 0, '', 413, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(414, 5, 'コイ', 'カワバタモロコ', 'Hemigrammocypris rasborella', 8, 0, '1991年版では「静岡県のカワバタモロコ個体群」で評価した。', 414, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(415, 5, 'コイ', 'ウケクチウグイ', 'Tribolodon nakamurai', 8, 0, '', 415, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(416, 5, 'コイ', 'ハス', 'Opsariichthys uncirostris uncirostris', 9, 0, '', 416, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(417, 5, 'コイ', 'ツチフキ', 'Abbottina rivularis', 9, 0, '', 417, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(418, 5, 'コイ', 'デメモロコ', 'Squalidus japonicus japonicus', 9, 0, '', 418, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(419, 5, 'コイ', 'キンブナ', 'Carassius auratussubsp. 2', 4, 0, '', 419, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(420, 5, 'コイ', 'ヤリタナゴ', 'Tanakia lanceolata', 4, 0, '', 420, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(421, 5, 'コイ', 'アブラボテ', 'Tanakia limbata', 4, 0, '', 421, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(422, 5, 'コイ', 'ヤチウグイ', 'Phoxinus percnurus sachalinensis', 4, 0, '', 422, 0, NULL, NULL, NULL, '2018-09-01 11:20:40'),
(423, 5, 'コイ', 'カワヒガイ', 'Sarcocheilichthys variegatus', 4, 0, '', 423, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(424, 5, 'コイ', 'スゴモロコ', 'Squalidus chankaensis biwae', 4, 0, '', 424, 0, NULL, NULL, NULL, '2018-09-01 11:20:41');
INSERT INTO `en_sps` (`id`, `bio_cls_id`, `family_name`, `wamei`, `scien_name`, `en_ctg_id`, `endemic_sp_flg`, `note`, `sort_no`, `delete_flg`, `update_user`, `ip_addr`, `created`, `modified`) VALUES
(425, 5, 'コイ', 'フナ属の1種（沖縄諸島産）', 'Carassius sp.', 5, 0, '', 425, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(426, 5, 'コイ', 'ナガブナ', 'Carassius auratussubsp. 1', 5, 0, '', 426, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(427, 5, 'コイ', 'ヤマナカハヤ', 'Phoxinus lagowskii yamamotis', 5, 0, '', 427, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(428, 5, 'コイ', '琵琶湖のコイ野生型', 'Cyprinus carpio', 12, 0, '', 428, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(429, 5, 'コイ', '本州日本海側のマルタウグイ', 'Tribolodon brandti', 12, 0, '', 429, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(430, 5, 'コイ', '東北地方のエゾウグイ', 'Tribolodon sachalinensis', 12, 0, '', 430, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(431, 5, 'ナマズ', 'イワトコナマズ', 'Silurus lithophilus', 4, 0, '', 431, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(432, 5, 'ナマズ', 'ネコギギ', 'Pseudobagrus ichikawai', 8, 0, '', 432, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(433, 5, 'ナマズ', 'ギバチ', 'Pseudobagrus tokiensis', 9, 0, '', 433, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(434, 5, 'ナマズ', 'アリアケギバチ', 'Pseudobagrus aurantiacus', 4, 0, '1991年版では「九州産ギバチ P. sp.」で評価した。', 434, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(435, 5, 'アカザ', 'アカザ', 'Liobagrus reini', 9, 0, '1991年版では「九州のアカザ個体群」で評価した。', 435, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(436, 5, 'サケ', 'クニマス', 'Oncorhynchus nerka kawamurae', 6, 0, '2010年、西湖にて生息を確認。', 436, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(437, 5, 'サケ', 'ベニザケ（ヒメマス）', 'Oncorhynchus nerka nerka', 7, 0, '', 437, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(438, 5, 'サケ', 'イトウ', 'Hucho perryi', 8, 0, '', 438, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(439, 5, 'サケ', 'オショロコマ', 'Salvelinus malma krascheninnikovi', 9, 0, '', 439, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(440, 5, 'サケ', 'ミヤベイワナ', 'Salvelinus malma miyabei', 9, 0, '', 440, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(441, 5, 'サケ', 'ゴギ', 'Salvelinus leucomaenis imbrius', 9, 0, '1999年版では「西中国地方のイワナ（ゴギ）」で評価した。', 441, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(442, 5, 'サケ', 'サクラマス（ヤマメ）', 'Oncorhynchus masou masou', 4, 0, '', 442, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(443, 5, 'サケ', 'サツキマス（アマゴ）', 'Oncorhynchus masou ishikawae', 4, 0, '', 443, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(444, 5, 'サケ', 'ビワマス', 'Oncorhynchus masousubsp.', 4, 0, '', 444, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(445, 5, 'サケ', 'ニッコウイワナ', 'Salvelinus leucomaenis pluvius', 5, 0, '', 445, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(446, 5, 'サケ', '紀伊半島のヤマトイワナ（キリクチ）', 'Salvelinus leucomaenis japonicus', 12, 0, '1991年版では「キリクチ」で評価した。', 446, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(447, 5, 'サケ', 'イワメ', 'Oncorhynchus iwame', 10, 0, '', 447, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(448, 5, 'アユ', 'リュウキュウアユ', 'Plecoglossus altivelis ryukyuensis', 7, 0, '', 448, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(449, 5, 'シラウオ', 'アリアケシラウオ', 'Salanx ariakensis', 7, 0, '', 449, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(450, 5, 'シラウオ', 'アリアケヒメシラウオ', 'Neosalanx reganius', 7, 0, '', 450, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(451, 5, 'シラウオ', 'イシカリワカサギ', 'Hypomesus olidus', 4, 0, '', 451, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(452, 5, 'シラウオ', '襟裳岬以西のシシャモ', 'Spirinchus lanceolatus', 12, 0, '', 452, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(453, 5, 'タウナギ', 'タウナギ', 'Monopterus sp.', 8, 0, '1999年版までは、沖縄島のタウナギで評価。', 453, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(454, 5, 'ボラ', 'カワボラ', 'Cestraeus plicatilis', 7, 0, '', 454, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(455, 5, 'ボラ', 'ナガレフウライボラ', 'Crenimugil heterocheilos', 8, 0, '', 455, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(456, 5, 'ボラ', 'アンピンボラ', 'Chelon subviridis', 5, 0, '', 456, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(457, 5, 'ボラ', 'オニボラ', 'Ellochelon vaigiensis', 5, 0, '', 457, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(458, 5, 'ボラ', 'カマヒレボラ', 'Moolgarda pedaraki', 5, 0, '', 458, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(459, 5, 'ボラ', 'モンナシボラ', 'Moolgarda engeli', 5, 0, '', 459, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(460, 5, 'メダカ', 'メダカ北日本集団', 'Oryzias latipes subsp.', 9, 0, '1991年版では「沖縄のメダカ個体群」で、1999年版では種「メダカ」で評価した。', 460, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(461, 5, 'メダカ', 'メダカ南日本集団', 'Oryzias latipes latipes', 9, 0, '1991年版では「沖縄のメダカ個体群」で、1999年版では種「メダカ」で評価した。', 461, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(462, 5, 'サヨリ', 'コモチサヨリ', 'Zenarchopterus dunckeri', 4, 0, '', 462, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(463, 5, 'サヨリ', 'クルメサヨリ', 'Hyporhamphus intermedius', 4, 0, '', 463, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(464, 5, 'トゲウオ', 'ミナミトミヨ', 'Pungitius kaibarae', 6, 0, '', 464, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(465, 5, 'トゲウオ', 'ハリヨ', 'Gasterosteus aculeatus leiurus', 7, 0, '1999年版では「福島以南の陸封イトヨ類（ハリヨを含む）」で評価した。', 465, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(466, 5, 'トゲウオ', 'ムサシトミヨ', 'Pungitius sp. 1', 7, 0, '', 466, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(467, 5, 'トゲウオ', 'トミヨ属雄物型', 'Pungitius sp. 2', 7, 0, '1999年版では「イバラトミヨ雄物型」で評価した。', 467, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(468, 5, 'トゲウオ', 'トミヨ属汽水型', 'Pungitius sp. 3', 4, 0, '', 468, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(469, 5, 'トゲウオ', 'エゾトミヨ', 'Pungitius tymensis', 4, 0, '', 469, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(470, 5, 'トゲウオ', '福島県以南の陸封イトヨ太平洋型', 'Gasterosteus aculeatus aculeatus', 12, 0, '1991年版では「福島県会津のイトヨ個体群（地域個体群）」および「福井県大野盆地のイトヨ個体群（地域個体群）」で、1999年版では「福島以南の陸封イトヨ類（ハリヨを含む）」で評価した。', 470, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(471, 5, 'トゲウオ', '本州のイトヨ日本海型', 'Gasterosteus aculeatus aculeatus', 12, 0, '', 471, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(472, 5, 'トゲウオ', '本州のトミヨ属淡水型', 'Pungitius pungitius', 12, 0, '', 472, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(473, 5, 'ヨウジウオ', 'ホシイッセンヨウジ', 'Microphis (Coelonotus) argulus', 7, 0, '', 473, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(474, 5, 'ヨウジウオ', 'タニヨウジ', 'Microphis (Lophocampus) retzii', 7, 0, '', 474, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(475, 5, 'ヨウジウオ', 'ヒメテングヨウジ', 'Microphis (Oostethus) jagorii', 7, 0, '', 475, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(476, 5, 'フグ', '沖縄島のクサフグ', 'akifugu niphobles', 12, 0, '', 476, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(477, 5, 'ハオコゼ', 'アゴヒゲオコゼ', 'Tetraroge barbata', 7, 0, '', 477, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(478, 5, 'ハオコゼ', 'ヒゲソリオコゼ', 'Tetraroge niger', 7, 0, '', 478, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(479, 5, 'カジカ', 'ヤマノカミ', 'Trachidermus fasciatus', 8, 0, '', 479, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(480, 5, 'カジカ', 'カジカ小卵型', 'Cottus reinii', 8, 0, '1999年版では和名は「ウツセミカジカ」。', 480, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(481, 5, 'カジカ', 'カジカ中卵型', 'Cottus sp.', 8, 0, '', 481, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(482, 5, 'カジカ', 'カマキリ（アユカケ）', 'Cottus kazika', 9, 0, '', 482, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(483, 5, 'カジカ', 'カジカ大卵型', 'Cottus pollux', 4, 0, '', 483, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(484, 5, 'カジカ', '東北・北陸地方のカンキョウカジカ', 'Cottus hangiongensis', 12, 0, '', 484, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(485, 5, 'カジカ', '東北地方のハナカジカ', 'Cottus nozawae', 12, 0, '', 485, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(486, 5, 'アカメ', 'アカメ', 'Lates japonicus', 8, 0, '絶滅危惧IB類', 486, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(487, 5, 'イサキ', 'ダイダイコショウダイ', 'Plectorhinchus albovittatus', 5, 0, '情報不足', 487, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(488, 5, 'キス', 'アオギス', 'Sillago parvisquamis', 7, 0, '絶滅危惧IA類', 488, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(489, 5, 'キス', 'アトクギス', 'Sillaginops macrolepis', 8, 0, '絶滅危惧IB類', 489, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(490, 5, 'シマイサキ', 'ヨコシマイサキ', 'Mesopristes cancellatus', 7, 0, '絶滅危惧IA類', 490, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(491, 5, 'シマイサキ', 'ニセシマイサキ', 'Mesopristes argenteus', 7, 0, '絶滅危惧IA類', 491, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(492, 5, 'シマイサキ', 'シミズシマイサキ', 'Mesopristes iravi', 7, 0, '絶滅危惧IA類', 492, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(493, 5, 'ペルキクティス', 'オヤニラミ', 'Coreoperca kawamebari', 9, 0, '絶滅危惧II類', 493, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(494, 5, 'タイ', 'ナンヨウチヌ', 'Acanthopagrus berda', 4, 0, '絶滅危惧Ⅱ類', 494, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(495, 5, 'スズキ', '有明海のスズキ', 'Lateolabrax japonicus', 12, 0, '地域個体群', 495, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(496, 5, 'ハゼ', '北海道南部・東北地方のスミウキゴリ', 'Gymnogobius petschiliensis', 12, 0, '地域個体群', 496, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(497, 5, 'タカサゴイシモチ', 'ナンヨウタカサゴイシモチ', 'Ambassis interrupta', 9, 0, '情報不足', 497, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(498, 5, 'テッポウウオ', 'テッポウウオ', 'Toxotes jaculatrix', 5, 0, '絶滅危惧IA類', 498, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(499, 5, 'テンジクダイ', 'カガミテンジクダイ', 'Yarica hyalosoma', 7, 0, '絶滅危惧IA類', 499, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(500, 5, 'テンジクダイ', 'ハナダカタカサゴイシモチ', 'Ambassis macracanthus', 5, 0, '情報不足', 500, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(501, 5, 'テンジクダイ', 'ワキイシモチ', 'Fibramia lateralis', 5, 0, '情報不足', 501, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(502, 5, 'テンジクダイ', 'ヒルギヌメリテンジクダイ', 'Pseudamia amblyuroptera', 5, 0, '情報不足', 502, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(503, 5, 'フエダイ', 'ウラウチフエダイ', 'Lutjanus goldiei', 7, 0, '絶滅危惧IA類', 503, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(504, 5, 'ユゴイ', 'トゲナガユゴイ', 'Kuhlia munda', 8, 0, '絶滅危惧IB類', 504, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(505, 5, 'ヘビギンポ', 'ウラウチヘビギンポ', 'Enneapterygius cheni', 7, 0, '絶滅危惧IA類', 505, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(506, 5, 'イソギンポ', 'ヒルギギンポ', 'Omox biporos', 7, 0, '絶滅危惧IA類', 506, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(507, 5, 'イソギンポ', 'カワギンポ', 'Omobranchus ferox', 7, 0, '絶滅危惧IA類', 507, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(508, 5, 'イソギンポ', 'ゴマクモギンポ', 'Omobranchus elongatus', 5, 0, '情報不足', 508, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(509, 5, 'ネズッポ', 'ナリタイトヒキヌメリ', 'Pseudocalliurichthys ikedai', 5, 0, '情報不足', 509, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(510, 5, 'ツバサハゼ', 'ツバサハゼ', 'Rhyacichthys aspro', 7, 0, '絶滅危惧IA類', 510, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(511, 5, 'カワアナゴ', 'オウギハゼ', 'Bunaka gyrinoides', 5, 0, '準絶滅危惧', 511, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(512, 5, 'ハゼ', 'トカゲハゼ', 'Scartelaos histophorus', 7, 0, '絶滅危惧IA類', 512, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(513, 5, 'ハゼ', 'ヨロイボウズハゼ', 'Lentipes armatus', 7, 0, '絶滅危惧IA類', 513, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(514, 5, 'ハゼ', 'カエルハゼ', 'Smilosicyopus leprurus', 7, 0, '絶滅危惧IA類', 514, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(515, 5, 'ハゼ', 'アカボウズハゼ', 'Sicyopus zosterophorus', 7, 0, '絶滅危惧IA類', 515, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(516, 5, 'ハゼ', 'ハヤセボウズハゼ', 'Stiphodon imperiorientis', 7, 0, '絶滅危惧IA類', 516, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(517, 5, 'ハゼ', 'コンテリボウズハゼ', 'Stiphodon atropurpureus', 7, 0, '絶滅危惧IA類', 517, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(518, 5, 'ハゼ', 'ドウクツミミズハゼ', 'Luciogobius albus', 7, 0, '絶滅危惧IA類', 518, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(519, 5, 'ハゼ', 'ミスジハゼ', 'Callogobius sp.', 7, 0, '絶滅危惧IA類', 519, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(520, 5, 'ハゼ', 'ウラウチイソハゼ', 'Eviota ocellifer', 7, 0, '絶滅危惧IA類', 520, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(521, 5, 'ハゼ', 'シマサルハゼ', 'Oxyurichthys sp. 2', 7, 0, '絶滅危惧IA類', 521, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(522, 5, 'ハゼ', 'ヒメトサカハゼ', 'Cristatogobius aurimaculatus', 7, 0, '絶滅危惧IA類', 522, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(523, 5, 'ハゼ', 'クロトサカハゼ', 'Cristatogobius nonatoae', 7, 0, '絶滅危惧IA類', 523, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(524, 5, 'ハゼ', 'イサザ', 'Gymnogobius isaza', 7, 0, '絶滅危惧IA類', 524, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(525, 5, 'ハゼ', 'キセルハゼ', 'Gymnogobius cylindricus', 7, 0, '絶滅危惧IB類', 525, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(526, 5, 'ハゼ', 'アゴヒゲハゼ', 'Glossogobius bicirrhosus', 7, 0, '絶滅危惧IA類', 526, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(527, 5, 'ハゼ', 'コンジキハゼ', 'Glossogobius aureus', 7, 0, '絶滅危惧IA類', 527, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(528, 5, 'ハゼ', 'カワクモハゼ', 'Bathygobius sp.', 7, 0, '絶滅危惧IA類', 528, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(529, 5, 'ハゼ', 'ホホグロハゼ', 'Mugilogobius parvus', 7, 0, '準絶滅危惧', 529, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(530, 5, 'ハゼ', 'オガサワラヨシノボリ', 'Rhinogobius sp. BI', 7, 0, '絶滅危惧IB類', 530, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(531, 5, 'ハゼ', 'コマチハゼ', 'Parioglossus taeniatus', 7, 0, '絶滅危惧IA類', 531, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(532, 5, 'ハゼ', 'ヒメサツキハゼ', 'Parioglossus interruptus', 7, 0, '絶滅危惧IA類', 532, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(533, 5, 'ハゼ', 'ヤエヤマノコギリハゼ', 'Butis amboinensis', 8, 0, '絶滅危惧IA類', 533, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(534, 5, 'ハゼ', 'ヒスイボウズハゼ', 'Stiphodon alcedo', 0, 0, '絶滅危惧IA類', 534, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(535, 5, 'ハゼ', 'ジャノメハゼ', 'Bostrychus sinensis', 8, 0, '絶滅危惧IB類', 535, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(536, 5, 'ハゼ', 'タナゴモドキ', 'Hypseleotris cyprinoides', 8, 0, '絶滅危惧IB類', 536, 0, NULL, NULL, NULL, '2018-09-01 11:20:41'),
(537, 5, 'ハゼ', 'タメトモハゼ', 'Giuris sp. 1', 8, 0, '絶滅危惧IB類', 537, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(538, 5, 'ハゼ', 'タビラクチ', 'Apocryptodon punctatus', 8, 0, '絶滅危惧II類', 538, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(539, 5, 'ハゼ', 'ムツゴロウ', 'Boleophthalmus pectinirostris', 8, 0, '絶滅危惧IB類', 539, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(540, 5, 'ハゼ', 'チワラスボ', 'Taenioides cirratus', 8, 0, '絶滅危惧IB類', 540, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(541, 5, 'ハゼ', 'ルリボウズハゼ', 'Sicyopterus lagocephalus', 8, 0, '絶滅危惧II類', 541, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(542, 5, 'ハゼ', 'トサカハゼ', 'Cristatogobius lophius', 8, 0, '絶滅危惧IB類', 542, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(543, 5, 'ハゼ', 'クボハゼ', 'Gymnogobius scrobiculatus', 8, 0, '絶滅危惧IB類', 543, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(544, 5, 'ハゼ', 'ジュズカケハゼ', 'Gymnogobius castaneus', 8, 0, '準絶滅危惧', 544, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(545, 5, 'ハゼ', 'コシノハゼ', 'Gymnogobius nakamurae', 8, 0, '絶滅危惧IA類', 545, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(546, 5, 'ハゼ', 'ホクリクジュズカケハゼ', 'Gymnogobius sp. 2', 8, 0, '絶滅危惧IA類', 546, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(547, 5, 'ハゼ', 'ムサシノジュズカケハゼ', 'Gymnogobius sp. 1', 8, 0, '絶滅危惧IB類', 547, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(548, 5, 'ハゼ', 'シマエソハゼ', 'Schismatogobius ampluvinculus', 8, 0, '絶滅危惧IB類', 548, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(549, 5, 'ハゼ', 'エソハゼ', 'Schismatogobius roxasi', 8, 0, '絶滅危惧IB類', 549, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(550, 5, 'ハゼ', 'マングローブゴマハゼ', 'Pandaka lidwilli', 8, 0, '絶滅危惧II類', 550, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(551, 5, 'ハゼ', 'アオバラヨシノボリ', 'Rhinogobius sp. BB', 8, 0, '絶滅危惧IA類', 551, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(552, 5, 'ハゼ', 'キバラヨシノボリ', 'Rhinogobius sp. YB', 8, 0, '絶滅危惧IB類', 552, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(553, 5, 'ハゼ', 'コビトハゼ', 'Parioglossus rainfordi', 8, 0, '絶滅危惧IB類', 553, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(554, 5, 'ハゼ', 'ホシマダラハゼ', 'Ophiocara porocephala', 9, 0, '絶滅危惧II類', 554, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(555, 5, 'ハゼ', 'アサガラハゼ', 'Caragobius urolepis', 9, 0, '絶滅危惧II類', 555, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(556, 5, 'ハゼ', 'ワラスボ', 'Odontamblyopus lacepedii', 9, 0, '絶滅危惧II類', 556, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(557, 5, 'ハゼ', 'ヒゲワラスボ', 'Trypauchenopsis intermedia', 9, 0, '絶滅危惧II類', 557, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(558, 5, 'ハゼ', 'シロウオ', 'Leucopsarion petersii', 9, 0, '絶滅危惧II類', 558, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(559, 5, 'ハゼ', 'ミナミヒメミミズハゼ', 'Luciogobius sp.', 9, 0, '絶滅危惧II類', 559, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(560, 5, 'ハゼ', 'エドハゼ', 'Gymnogobius macrognathos', 9, 0, '絶滅危惧II類', 560, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(561, 5, 'ハゼ', 'チクゼンハゼ', 'Gymnogobius uchidai', 9, 0, '絶滅危惧II類', 561, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(562, 5, 'ハゼ', 'シンジコハゼ', 'Gymnogobius taranetzi', 9, 0, '絶滅危惧II類', 562, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(563, 5, 'ハゼ', 'ハゼクチ', 'Acanthogobius hasta', 9, 0, '絶滅危惧II類', 563, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(564, 5, 'ハゼ', 'ミナミアシシロハゼ', 'Acanthogobius insularis', 9, 0, '絶滅危惧II類', 564, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(565, 5, 'ハゼ', 'マサゴハゼ', 'Pseudogobius masago', 9, 0, '絶滅危惧II類', 565, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(566, 5, 'ハゼ', 'キララハゼ', 'Acentrogobius viridipunctatus', 9, 0, '絶滅危惧II類', 566, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(567, 5, 'ハゼ', 'ゴマハゼ', 'Pandaka sp.', 9, 0, '絶滅危惧II類', 567, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(568, 5, 'ハゼ', 'ボルネオハゼ', 'Parioglossus palustris', 9, 0, '絶滅危惧II類', 568, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(569, 5, 'ハゼ', 'ゴシキタメトモハゼ', 'Giuris sp. 2', 4, 0, '絶滅危惧IB類', 569, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(570, 5, 'ハゼ', 'トビハゼ', 'Periophthalmus modestus', 4, 0, '準絶滅危惧', 570, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(571, 5, 'ハゼ', 'イドミミズハゼ', 'Luciogobius pallidus', 4, 0, '準絶滅危惧', 571, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(572, 5, 'ハゼ', 'ヒモハゼ', 'Eutaeniichthys gilli', 4, 0, '準絶滅危惧', 572, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(573, 5, 'ハゼ', 'ホクロハゼ', 'Acentrogobius caninus', 4, 0, '準絶滅危惧', 573, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(574, 5, 'ハゼ', 'トウカイヨシノボリ', 'Rhinogobius sp. TO', 4, 0, '準絶滅危惧', 574, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(575, 5, 'ハゼ', 'ショウキハゼ', 'Tridentiger barbatus', 4, 0, '準絶滅危惧', 575, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(576, 5, 'ハゼ', 'イシドンコ', 'Odontobutis hikimius', 5, 0, '絶滅危惧II類', 576, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(577, 5, 'ハゼ', 'エリトゲハゼ', 'Belobranchus belobranchus', 5, 0, '情報不足', 577, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(578, 5, 'ハゼ', 'カキイロヒメボウズハゼ', 'Stiphodon surrufus', 5, 0, '情報不足', 578, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(579, 5, 'ハゼ', 'ネムリミミズハゼ', 'Luciogobius dormitoris', 5, 0, '情報不足', 579, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(580, 5, 'ハゼ', 'ドウケハゼ', 'Stenogobius ophthalmoporus', 5, 0, '情報不足', 580, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(581, 5, 'ハゼ', 'ヘビハゼ', 'Gymnogobius mororanus', 5, 0, '情報不足', 581, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(582, 5, 'ハゼ', 'スダレウロハゼ', 'Glossogobius circumspectus', 5, 0, '準絶滅危惧', 582, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(583, 5, 'ハゼ', 'フタゴハゼ', 'Glossogobius sp.', 5, 0, '情報不足', 583, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(584, 5, 'ハゼ', 'コクチスナゴハゼ', 'Pseudogobius gastrospilos', 5, 0, '情報不足', 584, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(585, 5, 'ハゼ', 'ニセシラヌイハゼ', 'Silhouettea sp.', 5, 0, '準絶滅危惧', 585, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(586, 5, 'ハゼ', 'シラヌイハゼ', 'Silhouettea dotui', 5, 0, '準絶滅危惧', 586, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(587, 5, 'ハゼ', 'タスキヒナハゼ', 'Redigobius balteatus', 5, 0, '情報不足', 587, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(588, 5, 'ハゼ', 'フタホシハゼ', 'Mugilogobius fuscus', 5, 0, '情報不足', 588, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(589, 5, 'ハゼ', 'ムジナハゼ', 'Mugilogobius mertoni', 5, 0, '絶滅危惧II類', 589, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(590, 5, 'ハゼ', 'ニセツムギハゼ', 'Acentrogobius audax', 5, 0, '準絶滅危惧', 590, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(591, 5, 'ハゼ', 'ホホグロスジハゼ', 'Acentrogobius suluensis', 5, 0, '準絶滅危惧', 591, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(592, 5, 'ハゼ', 'ギンポハゼ', 'Parkraemeria saltator', 5, 0, '絶滅危惧II類', 592, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(593, 5, 'ハゼ', 'ビワヨシノボリ', 'Rhinogobius sp. BW', 5, 0, '情報不足', 593, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(594, 5, 'ハゼ', 'ナミノコハゼ', 'Gobitrichinotus radiocularis', 5, 0, '準絶滅危惧', 594, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(595, 5, 'ハゼ', 'トンガスナハゼ', 'Kraemeria tongaensis', 5, 0, '情報不足', 595, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(596, 5, 'ハゼ', 'マイコハゼ', 'Parioglossus lineatus', 5, 0, '情報不足', 596, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(597, 5, 'ハゼ', 'ニライカナイボウズハゼ', 'Stiphodon niraikanaiensis', 0, 0, '情報不足', 597, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(598, 5, 'ハゼ', 'トラフボウズハゼ', 'Stiphodon multisquamus', 0, 0, '情報不足', 598, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(599, 5, 'ゴクラクギョ', 'タイワンキンギョ', 'Macropodus opercularis', 7, 0, '絶滅危惧IA類', 599, 0, NULL, NULL, NULL, '2018-09-01 11:20:42'),
(600, 1, 'テスト', 'テスト和名', 'abc', 1, 1, 'TEST', 0, 1, NULL, '::1', '2018-09-02 22:55:50', '2018-09-03 02:37:02'),
(601, 1, 'TEST2', 'マスタービッグチキン', 'ookii-niwatori', 12, 1, 'TEST', 1, 0, '', '126.219.137.211', '2018-09-03 06:49:50', '2018-09-08 14:07:56'),
(602, 3, 'TESTjt', 'アジフライ<input />', 'ajihurai-oisi-', 5, 1, 'TEST', 2, 0, '', '36.11.224.72', '2018-09-08 23:07:11', '2018-10-18 16:13:15'),
(604, 5, 'TEST', 'アジフライ2', 'ajihurai-oisi-', 5, 1, 'TEST', -2, 1, NULL, '126.219.137.211', '2018-09-08 23:47:22', '2018-09-08 14:47:48'),
(605, 5, 'TEST', 'アジフライ3', 'ajihurai-oisi-', 5, 1, 'TEST', -2, 1, NULL, '126.219.137.211', '2018-09-08 23:47:32', '2018-09-08 14:47:48'),
(606, 5, 'TEST', 'アジフライ4', 'ajihurai-oisi-', 5, 1, 'TEST', -2, 1, NULL, '126.219.137.211', '2018-09-08 23:48:04', '2018-09-08 14:48:13'),
(607, 3, 'アカマムシ', '道三', '', 4, NULL, '', 0, 1, NULL, '126.219.137.211', '2018-09-09 00:06:56', '2018-09-08 15:07:48'),
(608, 2, 'ＴＥＳＴ', 'ＴＥＳ', 'ＴＥ', 3, 1, '℡', 0, 1, NULL, '126.219.137.211', '2018-09-09 00:14:15', '2018-09-08 15:14:18'),
(609, 5, 'TEST', 'アジフライ<input />', 'ajihurai-oisi-', 5, 1, 'TEST', 1, 1, NULL, '126.219.137.211', '2018-09-09 00:18:24', '2018-09-08 15:18:26'),
(610, 1, 'TEST2', 'マスタービッグチキン', 'ookii-niwatori', 12, 1, 'TEST', 3, 0, '', '36.11.224.72', '2018-10-19 01:13:31', '2018-10-18 16:13:31'),
(611, 1, 'TEST2', 'マスタービッグチキン', 'ookii-niwatori', 12, 1, 'TEST', 4, 0, '', '36.11.224.72', '2018-10-19 01:13:33', '2018-10-18 16:13:33');

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
(3, '2020_07_02_075049_create_sessions_table', 1),
(4, '2014_10_12_100000_create_password_resets_table', 2);

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
(96, 8, '〇〇についての質問です。〇〇の調子が悪いのですがどうすればいいですか？', '0000-00-00', 1, '0000-00-00 00:00:00', 0, 'rsc/img/img_fn/y2020/m10/orig/20201005132533_ga-ra.jpg', 'https://xxxxx.dummy2.sakura.ne.jp', 0, 0, 'kani', '::1', '2020-06-17 13:38:38', '2020-10-10 08:36:49'),
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
(118, 10, '〇〇について教えてください。', '0000-00-00', NULL, '0000-00-00 00:00:00', 0, 'rsc/img/img_fn/y2020/m10/orig/20201005132601_madara.jpg', 'https://xxxxx.dummy3.sakura.ne.jp', 1, 0, '', '::1', NULL, '2020-10-10 08:36:56'),
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
(179, 5, '〇〇についての質問です。どうすれば〇〇を取得できるでしょうか？', '0000-00-00', 6, '0000-00-00 00:00:00', 0, 'rsc/img/img_fn/y2020/m09/orig/20200911135202_F0231C3D-17B6-43A6-8A96-136B7678DB98.png', 'https://xxxxx.dummy.sakura.ne.jp', -3, 0, 'kani', '::1', '0000-00-00 00:00:00', '2020-10-10 08:36:36'),
(180, 0, '青猫２', '0000-00-00', 1, '0000-00-00 00:00:00', 0, '', '', 26, 0, '', '::1', NULL, '2020-08-11 23:12:50'),
(181, 0, 'おおやまねこ', '0000-00-00', 3, '0000-00-00 00:00:00', 0, '', '', -3, 1, 'kani', '::1', NULL, '2020-08-15 15:27:12'),
(182, 0, 'TEST', '0000-00-00', 1, '0000-00-00 00:00:00', 0, 'rsc/img/img_fn/y2020/m08/orig/20200804141915_ga-ra.jpg', '', 29, 0, '', '::1', '2020-08-03 12:28:56', '2020-08-11 23:12:50'),
(183, 0, 'あしばー', '0000-00-00', 1, '0000-00-00 00:00:00', 0, '', '', 0, 1, '', '::1', '2020-08-13 16:28:45', '2020-09-18 06:37:58'),
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(8, 'ベンガル', 0, 0, NULL, NULL, NULL, '2018-04-22 06:59:21'),
(9, 'アメリカンカール', 0, 0, NULL, NULL, NULL, '2020-09-13 02:37:44'),
(10, '不明', 0, 0, NULL, NULL, NULL, '2020-09-13 02:37:44'),
(11, '長毛種の雑種', 0, 0, NULL, NULL, NULL, '2020-09-14 01:44:57'),
(12, 'ペルシャ猫のような雑種', 0, 0, NULL, NULL, NULL, '2020-09-14 01:44:57'),
(13, 'クロネコ', 0, 0, NULL, NULL, NULL, '2020-09-14 01:45:55'),
(14, 'ぶち猫', 0, 0, NULL, NULL, NULL, '2020-09-14 01:53:05'),
(15, 'サバトラ', 0, 0, NULL, NULL, NULL, '2020-09-14 01:53:05'),
(16, '灰猫', 0, 0, NULL, NULL, NULL, '2020-09-14 01:53:38');

-- --------------------------------------------------------

--
-- テーブルの構造 `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- テーブルのデータのダンプ `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('amaraimusi@yahoo.co.jp', '$2y$10$R/cdZ3gvucTozAlHtSyrveGFSyotl.vf5Dg0b1hyJWGNwygHWEdh6', '2020-09-09 14:12:45');

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
('disQ7xI32v2AnDs4cBgvB8MrclDPcDHGgz6lnLZz', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUp1Wm9mSHEybE1YbFFBZnZxVE9lU2FaNTdocUlOd1hvN0xNdE5KZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTA6Imh0dHA6Ly9sb2NhbGhvc3QvQ3J1ZEJhc2UvbGFyYXZlbDcvZGV2L3B1YmxpYy9uZWtvIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1625878055);

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
-- テーブルのインデックス `en_sps`
--
ALTER TABLE `en_sps`
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
-- テーブルのインデックス `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

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
-- テーブルのAUTO_INCREMENT `en_sps`
--
ALTER TABLE `en_sps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=612;

--
-- テーブルのAUTO_INCREMENT `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- テーブルのAUTO_INCREMENT `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- テーブルのAUTO_INCREMENT `nekos`
--
ALTER TABLE `nekos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=194;

--
-- テーブルのAUTO_INCREMENT `neko_groups`
--
ALTER TABLE `neko_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

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
