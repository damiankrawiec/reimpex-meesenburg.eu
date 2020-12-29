-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Czas generowania: 23 Gru 2020, 14:55
-- Wersja serwera: 5.7.26
-- Wersja PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `reimpex`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_category`
--

DROP TABLE IF EXISTS `im_category`;
CREATE TABLE IF NOT EXISTS `im_category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `content` text COLLATE utf8_polish_ci,
  `position` int(11) DEFAULT '0',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`category_id`),
  KEY `label_id` (`label_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_category`
--
DROP TRIGGER IF EXISTS `im_category_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_category_insert_date_create` BEFORE INSERT ON `im_category` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_category_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_category_insert_date_modify` BEFORE INSERT ON `im_category` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_category_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_category_update_date_modify` BEFORE UPDATE ON `im_category` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_file`
--

DROP TABLE IF EXISTS `im_file`;
CREATE TABLE IF NOT EXISTS `im_file` (
  `file_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `content` text COLLATE utf8_polish_ci,
  `url` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_file`
--
DROP TRIGGER IF EXISTS `im_file_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_file_insert_date_create` BEFORE INSERT ON `im_file` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_file_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_file_insert_date_modify` BEFORE INSERT ON `im_file` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_file_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_file_update_date_modify` BEFORE UPDATE ON `im_file` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_form`
--

DROP TABLE IF EXISTS `im_form`;
CREATE TABLE IF NOT EXISTS `im_form` (
  `form_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `content` text COLLATE utf8_polish_ci,
  `email_source` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `email_destination` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_form`
--
DROP TRIGGER IF EXISTS `im_form_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_form_insert_date_create` BEFORE INSERT ON `im_form` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_image`
--

DROP TABLE IF EXISTS `im_image`;
CREATE TABLE IF NOT EXISTS `im_image` (
  `image_id` int(11) NOT NULL AUTO_INCREMENT,
  `section` int(11) DEFAULT '0',
  `name` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `content` text COLLATE utf8_polish_ci,
  `url` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `link` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_image`
--

INSERT INTO `im_image` (`image_id`, `section`, `name`, `content`, `url`, `link`, `status`, `description`, `date_create`, `date_modify`) VALUES
(1, 1, 'Logo', NULL, 'logo-reimpex-meesenburg-207766fd1c791b729ae951bd3ce5d4df.svg', '', 'on', NULL, '2020-12-16 16:24:48', '2020-12-16 16:24:48'),
(2, 0, 'Slider główny', NULL, 'maszyny-off-43bae7a7da03c43be942309faf1567e8.jpg', '', 'on', NULL, '2020-12-16 17:05:08', '2020-12-16 17:05:08'),
(3, 0, 'Slider główny - biało czarny', NULL, 'maszyny-cb-bd5441c18dc59ec98a8d6cd50a9ad2af.jpg', '', 'on', NULL, '2020-12-16 17:07:54', '2020-12-16 17:07:54'),
(4, 0, 'Promag - szkolenie', NULL, 'promag-szkolenie-blicke-9061de71f0ec462997cc4e6d4f137f6d.jpg', '', 'on', NULL, '2020-12-22 21:15:41', '2020-12-22 21:15:41'),
(5, 0, 'Nazwa produktu 1', '', 'smdr-284f-podniesioy-1-fe81d2a01dedff2c8a2596f0a34f2e3c.jpg', '', 'on', '', '2020-12-23 14:40:19', '2020-12-23 14:41:50'),
(6, 0, 'Nazwa produktu 2', '', 'su275f-2-4e8a24ce43cdfd2fe995c8d4fbe92a2f.jpg', '', 'on', '', '2020-12-23 14:40:19', '2020-12-23 14:42:01');

--
-- Wyzwalacze `im_image`
--
DROP TRIGGER IF EXISTS `im_image_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_image_insert_date_create` BEFORE INSERT ON `im_image` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_image_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_image_insert_date_modify` BEFORE INSERT ON `im_image` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_image_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_image_update_date_modify` BEFORE UPDATE ON `im_image` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_label`
--

DROP TABLE IF EXISTS `im_label`;
CREATE TABLE IF NOT EXISTS `im_label` (
  `label_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `style` text COLLATE utf8_polish_ci,
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_label`
--

INSERT INTO `im_label` (`label_id`, `name`, `system_name`, `style`, `description`, `date_create`, `date_modify`) VALUES
(1, 'Ciasteczka', 'cookie', NULL, NULL, '2020-12-14 18:41:18', '2020-12-14 18:41:18'),
(2, 'Menu', 'menu', '', '', '2020-12-14 18:56:20', '2020-12-22 19:49:20'),
(3, 'Góra', 'top', NULL, NULL, '2020-12-16 15:48:43', '2020-12-16 15:48:43'),
(4, 'Logo', 'logo', NULL, NULL, '2020-12-16 16:23:53', '2020-12-16 16:23:53'),
(5, 'Slider', 'slider', NULL, NULL, '2020-12-16 17:02:24', '2020-12-16 17:02:24'),
(6, 'Zawartość - środek', 'content-center', '', '', '2020-12-16 17:25:49', '2020-12-22 20:52:57'),
(7, 'Zawartość - góra', 'content-top', NULL, NULL, '2020-12-22 20:53:19', '2020-12-22 20:53:19'),
(8, 'Zawartość - dół', 'content-bottom', NULL, NULL, '2020-12-22 20:53:41', '2020-12-22 20:53:41'),
(9, 'Mapa', 'map', NULL, NULL, '2020-12-22 20:53:54', '2020-12-22 20:53:54'),
(10, 'Stopka', 'footer', NULL, NULL, '2020-12-22 20:55:59', '2020-12-22 20:55:59');

--
-- Wyzwalacze `im_label`
--
DROP TRIGGER IF EXISTS `im_label_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_label_insert_date_create` BEFORE INSERT ON `im_label` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_label_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_label_insert_date_modify` BEFORE INSERT ON `im_label` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_label_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_label_update_date_modify` BEFORE UPDATE ON `im_label` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_label_section`
--

DROP TABLE IF EXISTS `im_label_section`;
CREATE TABLE IF NOT EXISTS `im_label_section` (
  `label_section_id` int(11) NOT NULL AUTO_INCREMENT,
  `label_id` int(11) NOT NULL,
  `section` int(11) NOT NULL,
  `class` varchar(256) COLLATE utf8_polish_ci DEFAULT '',
  `class_row` varchar(256) COLLATE utf8_polish_ci DEFAULT '',
  `class_row_second` varchar(256) COLLATE utf8_polish_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`label_section_id`),
  KEY `label_id` (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_label_section`
--

INSERT INTO `im_label_section` (`label_section_id`, `label_id`, `section`, `class`, `class_row`, `class_row_second`, `description`, `date_create`, `date_modify`) VALUES
(3, 2, 0, '', '', 'justify-content-center', 'Środkowanie menu', '2020-12-22 20:34:23', '2020-12-22 20:58:59');

--
-- Wyzwalacze `im_label_section`
--
DROP TRIGGER IF EXISTS `im_label_section_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_label_section_insert_date_create` BEFORE INSERT ON `im_label_section` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_label_section_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_label_section_insert_date_modify` BEFORE INSERT ON `im_label_section` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_label_section_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_label_section_update_date_modify` BEFORE UPDATE ON `im_label_section` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_language`
--

DROP TABLE IF EXISTS `im_language`;
CREATE TABLE IF NOT EXISTS `im_language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(4) COLLATE utf8_polish_ci DEFAULT '',
  `url` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `position` int(11) DEFAULT '0',
  `status_default` varchar(3) COLLATE utf8_polish_ci DEFAULT 'off',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_language`
--

INSERT INTO `im_language` (`language_id`, `name`, `system_name`, `url`, `position`, `status_default`, `status`, `description`, `date_create`, `date_modify`) VALUES
(1, 'Polish language', 'pl', 'pl.png', 1, 'on', 'on', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(2, 'English language', 'en', 'en.png', 2, 'off', 'on', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17');

--
-- Wyzwalacze `im_language`
--
DROP TRIGGER IF EXISTS `im_language_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_language_insert_date_create` BEFORE INSERT ON `im_language` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_language_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_language_insert_date_modify` BEFORE INSERT ON `im_language` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_language_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_language_update_date_modify` BEFORE UPDATE ON `im_language` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_movie`
--

DROP TABLE IF EXISTS `im_movie`;
CREATE TABLE IF NOT EXISTS `im_movie` (
  `movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `content` text COLLATE utf8_polish_ci,
  `url` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `status_loop` varchar(3) COLLATE utf8_polish_ci DEFAULT 'off',
  `status_controls` varchar(3) COLLATE utf8_polish_ci DEFAULT 'off',
  `status_autoplay` varchar(3) COLLATE utf8_polish_ci DEFAULT 'off',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_movie`
--
DROP TRIGGER IF EXISTS `im_movie_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_movie_insert_date_create` BEFORE INSERT ON `im_movie` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_movie_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_movie_insert_date_modify` BEFORE INSERT ON `im_movie` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_movie_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_movie_update_date_modify` BEFORE UPDATE ON `im_movie` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object`
--

DROP TABLE IF EXISTS `im_object`;
CREATE TABLE IF NOT EXISTS `im_object` (
  `object_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `label_id` int(11) NOT NULL,
  `section` int(11) DEFAULT '0',
  `section_name` varchar(256) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `name` varchar(256) COLLATE utf8_polish_ci DEFAULT '',
  `content` text COLLATE utf8_polish_ci,
  `link` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `link_name` varchar(256) COLLATE utf8_polish_ci DEFAULT '',
  `email` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `form` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `attachment` varchar(256) COLLATE utf8_polish_ci DEFAULT '',
  `icon` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `map` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `class` varchar(256) COLLATE utf8_polish_ci DEFAULT '',
  `position` int(11) DEFAULT '0',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `status_copy` varchar(3) COLLATE utf8_polish_ci DEFAULT 'off',
  `status_free` varchar(3) COLLATE utf8_polish_ci NOT NULL DEFAULT 'off',
  `description` text COLLATE utf8_polish_ci,
  `date` varchar(32) COLLATE utf8_polish_ci DEFAULT '',
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`object_id`),
  KEY `type_id` (`type_id`),
  KEY `label_id` (`label_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_object`
--

INSERT INTO `im_object` (`object_id`, `type_id`, `label_id`, `section`, `section_name`, `system_name`, `name`, `content`, `link`, `link_name`, `email`, `form`, `attachment`, `icon`, `map`, `class`, `position`, `status`, `status_copy`, `status_free`, `description`, `date`, `date_create`, `date_modify`) VALUES
(1, 1, 1, 0, '', 'Okno ciasteczek', '', '<div id=\"cookie\"><i class=\"fad fa-cookie fa-2x float-left m-1\"></i> Przeglądając niniejszy serwis internetowy, akceptujesz pliki cookies zgodnie z ustawieniami przeglądarki <button class=\"btn btn-dark\">OK</button></div>', '', '', '', '', '', '', '', '', 1, 'on', 'on', 'off', '', '2020-12-14', '2020-12-14 18:42:28', '2020-12-23 15:03:21'),
(2, 2, 2, 0, '', 'Menu', '<i class=\"fal fa-bars\"></i><i class=\"fal fa-times im-hide\"></i>', NULL, '', '', '', '', '', '', '', '', 1, 'on', 'on', 'off', '', '2020-12-14', '2020-12-14 18:58:41', '2020-12-23 15:03:17'),
(3, 3, 3, 1, '<i class=\"fal fa-user-unlock\"></i> strefa klienta', 'Strefa klienta', '', NULL, '', '', '', '', '', '', '', 'customer-link', 1, 'on', 'on', 'off', '', '2020-12-16', '2020-12-16 15:50:28', '2020-12-23 15:03:13'),
(4, 4, 4, 0, '', 'Logo', '', NULL, '', '', '', '', '', '', '', '', 1, 'on', 'on', 'off', '', '2020-12-16', '2020-12-16 16:26:06', '2020-12-16 16:26:18'),
(5, 5, 5, 0, '', 'Slider główny', '', NULL, '', '', '', '', '', '', '', '', 1, 'on', 'off', 'off', '', '2020-12-16', '2020-12-16 17:05:28', '2020-12-16 17:08:06'),
(6, 6, 7, 1, 'Czytaj więcej', 'Certyfikaty', 'Certyfikaty', '<p>Spełnienie wymagań naszych klient&oacute;w oraz dążenie do zwiększenia ich zadowolenia, jak r&oacute;wnież budowanie partnerskiej wsp&oacute;łpracy z dostawcami jest warunkiem trwałego powodzenia naszej Firmy.</p>', '', '', '', '', '', 'fal fa-file-certificate fa-2x', '', '', 1, 'on', 'off', 'off', '', '2020-12-16', '2020-12-16 17:29:02', '2020-12-22 21:07:54'),
(7, 6, 7, 1, 'Czytaj więcej', 'Dział projektowy', 'Dział projektowy', '<p>Nasz zesp&oacute;ł stanowią wykwalifikowani konstruktorzy, technolodzy, specjaliści w dziedzinie Lean Manufacturing oraz trener Kaizen. Łączymy wizję wyrobu klienta z naszym doświadczeniem.</p>', '', '', '', '', '', 'fal fa-ruler-triangle fa-2x', '', '', 1, 'on', 'off', 'off', '', '2020-12-16', '2020-12-16 17:32:08', '2020-12-22 21:08:00'),
(8, 6, 7, 1, 'Czytaj więcej', 'Serwis', 'Serwis', '<p>Nasz zesp&oacute;ł stanowią wykwalifikowani konstruktorzy, technolodzy, specjaliści w dziedzinie Lean Manufacturing oraz trener Kaizen. Łączymy wizję wyrobu klienta z naszym doświadczeniem.</p>', '', '', '', '', '', 'fal fa-tools fa-2x', '', '', 1, 'on', 'off', 'off', '', '2020-12-16', '2020-12-16 17:36:01', '2020-12-22 21:08:05'),
(9, 7, 10, 0, '', 'Stopka', '', '<p>Wszelkie prawa zastrzeżone - 2020 r.</p>', '', '', '', '', '', '', '', 'text-center', 1, 'on', 'off', 'off', '', '2020-12-22', '2020-12-22 20:57:30', '2020-12-22 21:26:41'),
(10, 8, 9, 0, '', 'Mapa', '', NULL, '', '', '', '', '', '', '51.65198165621338,15.139702398884488', '', 1, 'on', 'on', 'off', '', '2020-12-22', '2020-12-22 21:00:51', '2020-12-23 15:02:56'),
(11, 9, 8, 1, 'Czytaj więcej', 'Promag - szkolenie', 'Promag - szkolenie', '<p>W czerwcu 2017 roku gościliśmy przedstawicieli firmy Promag, jedynego w Polsce przedstawiciela firmy Blickle, kt&oacute;rzy zaprezentowali swoje rozwiązania a także przeprowadzi szkolenia naszych pracownik&oacute;w, w temacie profesjonalnego doboru system&oacute;w jezdnych do naszych rozwiązań.</p>', '', '', '', '', '', '', '', '', 1, 'on', 'off', 'off', '', '2020-12-22', '2020-12-22 21:13:18', '2020-12-22 21:15:53'),
(12, 9, 8, 1, 'Czytaj więcej', 'Promag - szkolenie', 'Promag - szkolenie', '<p>W czerwcu 2017 roku gościliśmy przedstawicieli firmy Promag, jedynego w Polsce przedstawiciela firmy Blickle, kt&oacute;rzy zaprezentowali swoje rozwiązania a także przeprowadzi szkolenia naszych pracownik&oacute;w, w temacie profesjonalnego doboru system&oacute;w jezdnych do naszych rozwiązań.</p>', '', '', '', '', '', '', '', '', 1, 'on', 'off', 'off', '', '2020-12-22', '2020-12-22 21:18:11', '2020-12-22 21:18:11'),
(13, 9, 8, 1, 'Czytaj więcej', 'Promag - szkolenie', 'Promag - szkolenie', '<p>W czerwcu 2017 roku gościliśmy przedstawicieli firmy Promag, jedynego w Polsce przedstawiciela firmy Blickle, kt&oacute;rzy zaprezentowali swoje rozwiązania a także przeprowadzi szkolenia naszych pracownik&oacute;w, w temacie profesjonalnego doboru system&oacute;w jezdnych do naszych rozwiązań.</p>', '', '', '', '', '', '', '', '', 1, 'on', 'off', 'off', '', '2020-12-22', '2020-12-22 21:18:28', '2020-12-22 21:18:28'),
(14, 10, 6, 0, '', 'Opis firmy', '', '<h3>Reimpex-Meesenburg</h3>\r\n<p>ma ugruntowaną pozycję na rynku od ponad 20 lat. Jesteśmy producentem i dostawcą urządzeń, system&oacute;w transportowych oraz rozwiązań logistycznych. Zapewniamy pełną obsługę w zakresie planowania, projektowania oraz wyposażenia zakład&oacute;w produkcyjnych.</p>', '', '', '', '', '', '', '', '', 1, 'on', 'off', 'off', '', '2020-12-23', '2020-12-23 14:40:51', '2020-12-23 15:19:15');

--
-- Wyzwalacze `im_object`
--
DROP TRIGGER IF EXISTS `im_object_insert_date`;
DELIMITER $$
CREATE TRIGGER `im_object_insert_date` BEFORE INSERT ON `im_object` FOR EACH ROW set new.date = current_date()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_object_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_object_insert_date_create` BEFORE INSERT ON `im_object` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_object_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_object_insert_date_modify` BEFORE INSERT ON `im_object` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_object_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_object_update_date_modify` BEFORE UPDATE ON `im_object` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object_category`
--

DROP TABLE IF EXISTS `im_object_category`;
CREATE TABLE IF NOT EXISTS `im_object_category` (
  `object_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`object_category_id`),
  KEY `object_id` (`object_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object_file`
--

DROP TABLE IF EXISTS `im_object_file`;
CREATE TABLE IF NOT EXISTS `im_object_file` (
  `object_file_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `file_id` int(11) NOT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`object_file_id`),
  KEY `object_id` (`object_id`),
  KEY `file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object_image`
--

DROP TABLE IF EXISTS `im_object_image`;
CREATE TABLE IF NOT EXISTS `im_object_image` (
  `object_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`object_image_id`),
  KEY `object_id` (`object_id`),
  KEY `image_id` (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_object_image`
--

INSERT INTO `im_object_image` (`object_image_id`, `object_id`, `image_id`, `position`) VALUES
(1, 4, 1, 1),
(3, 5, 2, 1),
(4, 5, 3, 2),
(5, 11, 4, 1),
(6, 12, 4, 1),
(7, 13, 4, 1),
(16, 14, 5, 1),
(17, 14, 6, 2);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object_movie`
--

DROP TABLE IF EXISTS `im_object_movie`;
CREATE TABLE IF NOT EXISTS `im_object_movie` (
  `object_movie_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`object_movie_id`),
  KEY `object_id` (`object_id`),
  KEY `movie_id` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_object_source`
--

DROP TABLE IF EXISTS `im_object_source`;
CREATE TABLE IF NOT EXISTS `im_object_source` (
  `object_source_id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) NOT NULL,
  `source_id` int(11) NOT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`object_source_id`),
  KEY `object_id` (`object_id`),
  KEY `source_id` (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_property`
--

DROP TABLE IF EXISTS `im_property`;
CREATE TABLE IF NOT EXISTS `im_property` (
  `property_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_property`
--

INSERT INTO `im_property` (`property_id`, `name`, `system_name`, `description`, `date_create`, `date_modify`) VALUES
(1, 'Nazwa', 'name', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(2, 'Tekst', 'content', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(3, 'Data', 'date', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(4, 'Zdjęcie', 'image', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(5, 'Link wewnętrzny', 'section', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(6, 'Plik', 'file', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(7, 'Menu', 'menu', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(8, 'Link zewnętrzny', 'link', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(9, 'E-mail', 'email', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(10, 'Formularz kontaktowy', 'form', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(11, 'Źródło', 'source', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(12, 'Ikona', 'icon', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(13, 'Język', 'language', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(14, 'Nawigacja okruszkowa', 'breadcrumb', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(15, 'Film', 'movie', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(16, 'Mapa', 'map', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17');

--
-- Wyzwalacze `im_property`
--
DROP TRIGGER IF EXISTS `im_property_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_property_insert_date_create` BEFORE INSERT ON `im_property` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_property_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_property_insert_date_modify` BEFORE INSERT ON `im_property` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_property_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_property_update_date_modify` BEFORE UPDATE ON `im_property` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_section`
--

DROP TABLE IF EXISTS `im_section`;
CREATE TABLE IF NOT EXISTS `im_section` (
  `section_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent` int(11) DEFAULT '0',
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `name_second` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `name_url` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `meta` text COLLATE utf8_polish_ci,
  `icon` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `class` varchar(128) COLLATE utf8_polish_ci DEFAULT 'container',
  `popup` text COLLATE utf8_polish_ci,
  `position` int(11) DEFAULT '0',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `status_copy` varchar(3) COLLATE utf8_polish_ci DEFAULT 'off',
  `status_popup` varchar(3) COLLATE utf8_polish_ci DEFAULT 'off',
  `status_parallax` varchar(3) COLLATE utf8_polish_ci DEFAULT 'off',
  `status_link` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_section`
--

INSERT INTO `im_section` (`section_id`, `parent`, `name`, `name_second`, `name_url`, `meta`, `icon`, `class`, `popup`, `position`, `status`, `status_copy`, `status_popup`, `status_parallax`, `status_link`, `description`, `date_create`, `date_modify`) VALUES
(1, 0, 'home', '', 'home', 'Opis strony głownej', 'fad fa-home-lg', '', '', 1, 'on', 'off', 'off', 'off', 'on', '', '2020-12-14 18:35:04', '2020-12-23 15:11:55'),
(2, 0, 'O nas', '', 'o-nas', '', 'fad fa-address-card', 'container', '', 2, 'on', 'off', 'off', 'off', 'on', '', '2020-12-23 15:03:39', '2020-12-23 15:11:38');

--
-- Wyzwalacze `im_section`
--
DROP TRIGGER IF EXISTS `im_section_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_section_insert_date_create` BEFORE INSERT ON `im_section` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_section_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_section_insert_date_modify` BEFORE INSERT ON `im_section` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_section_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_section_update_date_modify` BEFORE UPDATE ON `im_section` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_section_image`
--

DROP TABLE IF EXISTS `im_section_image`;
CREATE TABLE IF NOT EXISTS `im_section_image` (
  `section_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `image_id` int(11) NOT NULL,
  `position` int(11) DEFAULT '0',
  PRIMARY KEY (`section_image_id`),
  KEY `section_id` (`section_id`),
  KEY `image_id` (`image_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_section_object`
--

DROP TABLE IF EXISTS `im_section_object`;
CREATE TABLE IF NOT EXISTS `im_section_object` (
  `section_object_id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `object_id` int(11) NOT NULL,
  PRIMARY KEY (`section_object_id`),
  KEY `section_id` (`section_id`),
  KEY `object_id` (`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_section_object`
--

INSERT INTO `im_section_object` (`section_object_id`, `section_id`, `object_id`) VALUES
(1, 1, 1),
(4, 1, 3),
(5, 1, 4),
(10, 1, 2),
(12, 1, 5),
(29, 1, 10),
(30, 1, 6),
(31, 1, 7),
(32, 1, 8),
(33, 1, 11),
(34, 1, 12),
(35, 1, 13),
(36, 1, 9),
(38, 2, 1),
(39, 2, 2),
(40, 2, 3),
(41, 2, 4),
(42, 2, 10),
(46, 1, 14);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_setting`
--

DROP TABLE IF EXISTS `im_setting`;
CREATE TABLE IF NOT EXISTS `im_setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `content` text COLLATE utf8_polish_ci,
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_setting`
--

INSERT INTO `im_setting` (`setting_id`, `name`, `system_name`, `content`, `description`, `date_create`, `date_modify`) VALUES
(1, 'System name', 'name', 'IM-CMS Engine', '', '2020-12-14 18:32:18', '2020-12-14 18:32:18'),
(2, 'Favicon', 'favicon', 'favicon.png', '', '2020-12-14 18:32:18', '2020-12-14 18:32:18'),
(3, 'Font', 'font', 'Sarabun', '', '2020-12-14 18:32:18', '2020-12-22 21:32:00'),
(4, 'Font size', 'font-size', '16px', '', '2020-12-14 18:32:18', '2020-12-22 21:32:38'),
(5, 'Google API', 'google-api', 'AIzaSyBsx3mEXTFuu70t5rvDr7EgZGUDFfzx0DQ', '', '2020-12-14 18:32:18', '2020-12-22 21:04:18'),
(6, 'Style map', 'map-style', '[\r\n    {\r\n        \"featureType\": \"administrative\",\r\n        \"elementType\": \"all\",\r\n        \"stylers\": [\r\n            {\r\n                \"saturation\": \"-100\"\r\n            }\r\n        ]\r\n    },\r\n    {\r\n        \"featureType\": \"administrative.province\",\r\n        \"elementType\": \"all\",\r\n        \"stylers\": [\r\n            {\r\n                \"visibility\": \"off\"\r\n            }\r\n        ]\r\n    },\r\n    {\r\n        \"featureType\": \"landscape\",\r\n        \"elementType\": \"all\",\r\n        \"stylers\": [\r\n            {\r\n                \"saturation\": -100\r\n            },\r\n            {\r\n                \"lightness\": 65\r\n            },\r\n            {\r\n                \"visibility\": \"on\"\r\n            }\r\n        ]\r\n    },\r\n    {\r\n        \"featureType\": \"poi\",\r\n        \"elementType\": \"all\",\r\n        \"stylers\": [\r\n            {\r\n                \"saturation\": -100\r\n            },\r\n            {\r\n                \"lightness\": \"50\"\r\n            },\r\n            {\r\n                \"visibility\": \"simplified\"\r\n            }\r\n        ]\r\n    },\r\n    {\r\n        \"featureType\": \"road\",\r\n        \"elementType\": \"all\",\r\n        \"stylers\": [\r\n            {\r\n                \"saturation\": \"-100\"\r\n            }\r\n        ]\r\n    },\r\n    {\r\n        \"featureType\": \"road.highway\",\r\n        \"elementType\": \"all\",\r\n        \"stylers\": [\r\n            {\r\n                \"visibility\": \"simplified\"\r\n            }\r\n        ]\r\n    },\r\n    {\r\n        \"featureType\": \"road.arterial\",\r\n        \"elementType\": \"all\",\r\n        \"stylers\": [\r\n            {\r\n                \"lightness\": \"30\"\r\n            }\r\n        ]\r\n    },\r\n    {\r\n        \"featureType\": \"road.local\",\r\n        \"elementType\": \"all\",\r\n        \"stylers\": [\r\n            {\r\n                \"lightness\": \"40\"\r\n            }\r\n        ]\r\n    },\r\n    {\r\n        \"featureType\": \"transit\",\r\n        \"elementType\": \"all\",\r\n        \"stylers\": [\r\n            {\r\n                \"saturation\": -100\r\n            },\r\n            {\r\n                \"visibility\": \"simplified\"\r\n            }\r\n        ]\r\n    },\r\n    {\r\n        \"featureType\": \"water\",\r\n        \"elementType\": \"geometry\",\r\n        \"stylers\": [\r\n            {\r\n                \"hue\": \"#ffff00\"\r\n            },\r\n            {\r\n                \"lightness\": -25\r\n            },\r\n            {\r\n                \"saturation\": -97\r\n            }\r\n        ]\r\n    },\r\n    {\r\n        \"featureType\": \"water\",\r\n        \"elementType\": \"labels\",\r\n        \"stylers\": [\r\n            {\r\n                \"lightness\": -25\r\n            },\r\n            {\r\n                \"saturation\": -100\r\n            }\r\n        ]\r\n    }\r\n]', '', '2020-12-14 18:32:18', '2020-12-22 21:06:36'),
(7, 'Footer class', 'class-footer', 'animated slideInUp', '', '2020-12-14 18:32:18', '2020-12-14 18:32:18'),
(8, 'Loading page', 'loading-page', 'background: #000;|top:30%;|color:#fff;font-size: 150px;|fad fa-spinner-third fa-spin|fadeOutUp|1000', 'Background style, icon box style, icon style, icon class, animation, visible time', '2020-12-14 18:32:18', '2020-12-14 18:32:18'),
(9, 'Debug', 'debug', 'enable', 'enable/disable (status)', '2020-12-14 18:32:18', '2020-12-14 18:38:55'),
(10, 'Content class', 'class-content', 'content-gray', '', '2020-12-16 17:42:45', '2020-12-22 21:58:50'),
(11, 'Map zoom', 'zoom-map', '16', '15, 16, 17 - probably will be ok', '2020-12-22 17:58:41', '2020-12-22 17:58:41');

--
-- Wyzwalacze `im_setting`
--
DROP TRIGGER IF EXISTS `im_setting_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_setting_insert_date_create` BEFORE INSERT ON `im_setting` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_setting_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_setting_insert_date_modify` BEFORE INSERT ON `im_setting` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_setting_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_setting_update_date_modify` BEFORE UPDATE ON `im_setting` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_source`
--

DROP TABLE IF EXISTS `im_source`;
CREATE TABLE IF NOT EXISTS `im_source` (
  `source_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_polish_ci DEFAULT '',
  `content` text COLLATE utf8_polish_ci,
  `link` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_source`
--
DROP TRIGGER IF EXISTS `im_source_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_source_insert_date_create` BEFORE INSERT ON `im_source` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_source_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_source_insert_date_modify` BEFORE INSERT ON `im_source` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_source_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_source_update_date_modify` BEFORE UPDATE ON `im_source` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_translation`
--

DROP TABLE IF EXISTS `im_translation`;
CREATE TABLE IF NOT EXISTS `im_translation` (
  `translation_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `target_table` varchar(32) COLLATE utf8_polish_ci DEFAULT '',
  `target_column` varchar(32) COLLATE utf8_polish_ci DEFAULT '',
  `target_record` int(11) NOT NULL,
  `content` text COLLATE utf8_polish_ci,
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`translation_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Wyzwalacze `im_translation`
--
DROP TRIGGER IF EXISTS `im_translation_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_translation_insert_date_create` BEFORE INSERT ON `im_translation` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_translation_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_translation_insert_date_modify` BEFORE INSERT ON `im_translation` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_translation_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_translation_update_date_modify` BEFORE UPDATE ON `im_translation` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_translation_system`
--

DROP TABLE IF EXISTS `im_translation_system`;
CREATE TABLE IF NOT EXISTS `im_translation_system` (
  `translation_system_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `system_name` varchar(32) COLLATE utf8_polish_ci DEFAULT '',
  `content` text COLLATE utf8_polish_ci,
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`translation_system_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_translation_system`
--

INSERT INTO `im_translation_system` (`translation_system_id`, `language_id`, `name`, `system_name`, `content`, `description`, `date_create`, `date_modify`) VALUES
(1, 1, 'All', 'show-all', 'Pokaż wszystko', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(2, 2, 'All', 'show-all', 'Show all', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(3, 1, 'No data', 'no-data', 'Brak danych', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(4, 2, 'No data', 'no-data', 'No data', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(5, 1, 'Przycisk wyślij', 'send', 'Wyślij', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(6, 1, 'Nazwa', 'name', 'Nazwa', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(7, 1, 'Nadawca', 'source', 'Nadawca', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(8, 2, 'Send button', 'send', 'Send now', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(9, 2, 'Name', 'name', 'name', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(10, 2, 'From', 'source', 'from', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(11, 1, 'Formularz błąd', 'form-error', 'Błąd wysyłania wiadomości', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(12, 1, 'Formularz poprawny', 'form-ok', 'Wiadomość wysłana', '', '2020-12-14 18:32:17', '2020-12-14 18:32:17'),
(13, 2, 'Form error', 'form-error', 'Error sending form', '', '2020-12-14 18:32:18', '2020-12-14 18:32:18'),
(14, 2, 'Form ok', 'form-ok', 'Form send', '', '2020-12-14 18:32:18', '2020-12-14 18:32:18'),
(15, 1, 'Błąd captcha', 'captcha-error', 'Błąd obrazka', '', '2020-12-14 18:32:18', '2020-12-14 18:32:18'),
(16, 2, 'Captcha error', 'captcha-error', 'Captcha error', '', '2020-12-14 18:32:18', '2020-12-14 18:32:18'),
(17, 1, 'Captcha', 'captcha-text', 'Wpisz znaki', '', '2020-12-14 18:32:18', '2020-12-14 18:32:18'),
(18, 2, 'Captcha', 'captcha-text', 'Insert captcha', '', '2020-12-14 18:32:18', '2020-12-14 18:32:18'),
(19, 1, 'Więcej', 'more', 'Więcej...', '', '2020-12-23 10:58:25', '2020-12-23 10:58:25'),
(20, 2, 'Więcej', 'more', 'More...', '', '2020-12-23 10:58:25', '2020-12-23 11:01:56');

--
-- Wyzwalacze `im_translation_system`
--
DROP TRIGGER IF EXISTS `im_translation_system_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_translation_system_insert_date_create` BEFORE INSERT ON `im_translation_system` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_translation_system_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_translation_system_insert_date_modify` BEFORE INSERT ON `im_translation_system` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_translation_system_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_translation_system_update_date_modify` BEFORE UPDATE ON `im_translation_system` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_type`
--

DROP TABLE IF EXISTS `im_type`;
CREATE TABLE IF NOT EXISTS `im_type` (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `class` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_type`
--

INSERT INTO `im_type` (`type_id`, `name`, `class`, `status`, `description`, `date_create`, `date_modify`) VALUES
(1, 'Cookie', 'col-12', 'on', '', '2020-12-14 18:41:34', '2020-12-14 18:41:41'),
(2, 'Menu', 'col-12', 'on', '', '2020-12-14 18:56:35', '2020-12-22 19:52:12'),
(3, 'Link', 'col-12 col-lg-2 offset-lg-10', 'on', 'np. \"strefa klienta\"', '2020-12-16 15:49:49', '2020-12-16 16:11:03'),
(4, 'Logo', 'col-12 col-lg-2 pt-3', 'on', 'grafika wektorowa - SVG', '2020-12-16 16:23:38', '2020-12-16 16:34:07'),
(5, 'Slider', 'col-12', 'on', 'slider główny - strona główna', '2020-12-16 17:02:41', '2020-12-16 17:03:13'),
(6, 'Boksy', 'col-12 col-lg-4 mt-2 mb-2 p-3 bg-white animated zoomIn', 'on', 'np. na stronie głównej, pod sliderem', '2020-12-16 17:26:18', '2020-12-23 15:52:14'),
(7, 'Treść', 'col-12', 'on', '', '2020-12-22 20:56:42', '2020-12-22 20:56:48'),
(8, 'Mapa', 'col-12', 'on', '', '2020-12-22 21:00:02', '2020-12-22 21:00:12'),
(9, 'Aktualności', 'col-12 col sm-6 col-md-4 mt-3 mb-3 pt-3 pb-3 line-height-more news', 'on', '', '2020-12-22 21:09:52', '2020-12-23 15:40:57'),
(10, 'Treść i galeria', 'col-12 line-height-more', 'on', 'np. opis firmy ze sliderem produktów', '2020-12-23 14:33:31', '2020-12-23 15:25:24');

--
-- Wyzwalacze `im_type`
--
DROP TRIGGER IF EXISTS `im_type_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_type_insert_date_create` BEFORE INSERT ON `im_type` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_type_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_type_insert_date_modify` BEFORE INSERT ON `im_type` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_type_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_type_update_date_modify` BEFORE UPDATE ON `im_type` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `im_type_property`
--

DROP TABLE IF EXISTS `im_type_property`;
CREATE TABLE IF NOT EXISTS `im_type_property` (
  `type_property_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `class` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `class_field` varchar(128) COLLATE utf8_polish_ci DEFAULT '',
  `position` int(11) DEFAULT '0',
  `status` varchar(3) COLLATE utf8_polish_ci DEFAULT 'on',
  `description` text COLLATE utf8_polish_ci,
  `date_create` datetime DEFAULT NULL,
  `date_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`type_property_id`),
  KEY `type_id` (`type_id`),
  KEY `property_id` (`property_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `im_type_property`
--

INSERT INTO `im_type_property` (`type_property_id`, `type_id`, `property_id`, `class`, `class_field`, `position`, `status`, `description`, `date_create`, `date_modify`) VALUES
(1, 1, 2, 'col-12', '', 1, 'on', '', '2020-12-14 18:41:52', '2020-12-14 18:52:35'),
(2, 2, 7, '', 'navbar navbar-expand-lg animated fadeInRightBig text-uppercase', 1, 'on', '', '2020-12-14 18:57:15', '2020-12-23 15:14:02'),
(3, 3, 5, 'col-12 text-center', '', 1, 'on', '', '2020-12-16 15:50:53', '2020-12-16 16:06:09'),
(4, 4, 4, 'col-12 animated flipInX', '', 1, 'on', '', '2020-12-16 16:25:49', '2020-12-23 15:48:55'),
(5, 5, 4, 'col-12', '', 1, 'on', '', '2020-12-16 17:03:22', '2020-12-16 17:03:28'),
(6, 6, 12, 'col-12 text-center mt-1 mb-1', '', 1, 'on', '', '2020-12-16 17:27:41', '2020-12-16 17:38:58'),
(7, 6, 1, 'col-12 text-center mt-2 mb-2', 'text-uppercase h5', 2, 'on', '', '2020-12-16 17:27:55', '2020-12-16 17:39:58'),
(8, 6, 2, 'col-12 text-justify', '', 3, 'on', '', '2020-12-16 17:28:29', '2020-12-22 21:33:03'),
(9, 6, 5, 'col-12 text-center', 'btn btn-danger', 4, 'on', '', '2020-12-22 19:28:08', '2020-12-22 19:28:38'),
(10, 7, 2, 'col-12', '', 1, 'on', '', '2020-12-22 20:56:56', '2020-12-22 20:57:12'),
(11, 8, 16, 'col-12', '', 1, 'on', '', '2020-12-22 21:00:33', '2020-12-22 21:00:38'),
(12, 9, 1, 'col-7', 'font-weight-bold text-uppercase', 1, 'on', '', '2020-12-22 21:10:30', '2020-12-23 15:40:16'),
(13, 9, 3, 'col-5 text-right', '', 2, 'on', '', '2020-12-22 21:10:50', '2020-12-23 15:39:38'),
(14, 9, 4, 'col-12 image', '', 3, 'on', '', '2020-12-22 21:11:05', '2020-12-23 15:41:43'),
(15, 9, 2, 'col-12 text-justify text', '', 4, 'on', '', '2020-12-22 21:11:19', '2020-12-23 15:41:57'),
(16, 9, 5, 'col-12 text-center pt-3', 'btn btn-outline-dark', 5, 'on', '', '2020-12-22 21:11:36', '2020-12-23 15:46:59'),
(17, 10, 2, 'col-12 col-lg-6 pt-5', '', 1, 'on', '', '2020-12-23 14:34:11', '2020-12-23 15:23:21'),
(18, 10, 4, 'col-12 col-lg-6', '', 2, 'on', '', '2020-12-23 14:34:44', '2020-12-23 14:34:47');

--
-- Wyzwalacze `im_type_property`
--
DROP TRIGGER IF EXISTS `im_type_property_insert_date_create`;
DELIMITER $$
CREATE TRIGGER `im_type_property_insert_date_create` BEFORE INSERT ON `im_type_property` FOR EACH ROW set new.date_create = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_type_property_insert_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_type_property_insert_date_modify` BEFORE INSERT ON `im_type_property` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `im_type_property_update_date_modify`;
DELIMITER $$
CREATE TRIGGER `im_type_property_update_date_modify` BEFORE UPDATE ON `im_type_property` FOR EACH ROW set new.date_modify = now()
$$
DELIMITER ;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `im_category`
--
ALTER TABLE `im_category`
  ADD CONSTRAINT `im_category_ibfk_1` FOREIGN KEY (`label_id`) REFERENCES `im_label` (`label_id`);

--
-- Ograniczenia dla tabeli `im_label_section`
--
ALTER TABLE `im_label_section`
  ADD CONSTRAINT `im_label_section_ibfk_1` FOREIGN KEY (`label_id`) REFERENCES `im_label` (`label_id`);

--
-- Ograniczenia dla tabeli `im_object`
--
ALTER TABLE `im_object`
  ADD CONSTRAINT `im_object_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `im_type` (`type_id`),
  ADD CONSTRAINT `im_object_ibfk_2` FOREIGN KEY (`label_id`) REFERENCES `im_label` (`label_id`);

--
-- Ograniczenia dla tabeli `im_object_category`
--
ALTER TABLE `im_object_category`
  ADD CONSTRAINT `im_object_category_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`),
  ADD CONSTRAINT `im_object_category_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `im_category` (`category_id`);

--
-- Ograniczenia dla tabeli `im_object_file`
--
ALTER TABLE `im_object_file`
  ADD CONSTRAINT `im_object_file_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`),
  ADD CONSTRAINT `im_object_file_ibfk_2` FOREIGN KEY (`file_id`) REFERENCES `im_file` (`file_id`);

--
-- Ograniczenia dla tabeli `im_object_image`
--
ALTER TABLE `im_object_image`
  ADD CONSTRAINT `im_object_image_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`),
  ADD CONSTRAINT `im_object_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `im_image` (`image_id`);

--
-- Ograniczenia dla tabeli `im_object_movie`
--
ALTER TABLE `im_object_movie`
  ADD CONSTRAINT `im_object_movie_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`),
  ADD CONSTRAINT `im_object_movie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `im_movie` (`movie_id`);

--
-- Ograniczenia dla tabeli `im_object_source`
--
ALTER TABLE `im_object_source`
  ADD CONSTRAINT `im_object_source_ibfk_1` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`),
  ADD CONSTRAINT `im_object_source_ibfk_2` FOREIGN KEY (`source_id`) REFERENCES `im_source` (`source_id`);

--
-- Ograniczenia dla tabeli `im_section_image`
--
ALTER TABLE `im_section_image`
  ADD CONSTRAINT `im_section_image_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `im_section` (`section_id`),
  ADD CONSTRAINT `im_section_image_ibfk_2` FOREIGN KEY (`image_id`) REFERENCES `im_image` (`image_id`);

--
-- Ograniczenia dla tabeli `im_section_object`
--
ALTER TABLE `im_section_object`
  ADD CONSTRAINT `im_section_object_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `im_section` (`section_id`),
  ADD CONSTRAINT `im_section_object_ibfk_2` FOREIGN KEY (`object_id`) REFERENCES `im_object` (`object_id`);

--
-- Ograniczenia dla tabeli `im_translation`
--
ALTER TABLE `im_translation`
  ADD CONSTRAINT `im_translation_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `im_language` (`language_id`);

--
-- Ograniczenia dla tabeli `im_translation_system`
--
ALTER TABLE `im_translation_system`
  ADD CONSTRAINT `im_translation_system_ibfk_1` FOREIGN KEY (`language_id`) REFERENCES `im_language` (`language_id`);

--
-- Ograniczenia dla tabeli `im_type_property`
--
ALTER TABLE `im_type_property`
  ADD CONSTRAINT `im_type_property_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `im_type` (`type_id`),
  ADD CONSTRAINT `im_type_property_ibfk_2` FOREIGN KEY (`property_id`) REFERENCES `im_property` (`property_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
