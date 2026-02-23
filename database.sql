-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 26, 2025 at 09:10 AM
-- Server version: 11.8.3-MariaDB-log
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u967765871_laravel`
--

-- --------------------------------------------------------

--
-- Table structure for table `achats`
--

CREATE TABLE `achats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` enum('Création','Validation','Refus','Livraison','Réception') NOT NULL DEFAULT 'Création',
  `id_Fournisseur` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audits`
--

CREATE TABLE `audits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(255) NOT NULL,
  `auditable_type` varchar(255) NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `old_values` text DEFAULT NULL,
  `new_values` text DEFAULT NULL,
  `url` text DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` varchar(1023) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `audits`
--

INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 1, 'created', 'App\\Models\\Unite', 1, '[]', '{\"name\":\"Kg\",\"iduser\":1,\"id\":1}', 'https://skyblue-rat-607542.hostingersite.com/importUnite', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:29:49', '2025-11-23 09:29:49'),
(2, 'App\\Models\\User', 1, 'created', 'App\\Models\\Unite', 2, '[]', '{\"name\":\"Gramme\",\"iduser\":1,\"id\":2}', 'https://skyblue-rat-607542.hostingersite.com/importUnite', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:29:49', '2025-11-23 09:29:49'),
(3, 'App\\Models\\User', 1, 'created', 'App\\Models\\Unite', 3, '[]', '{\"name\":\"L\",\"iduser\":1,\"id\":3}', 'https://skyblue-rat-607542.hostingersite.com/importUnite', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:29:49', '2025-11-23 09:29:49'),
(4, 'App\\Models\\User', 1, 'created', 'App\\Models\\Unite', 4, '[]', '{\"name\":\"T\",\"iduser\":1,\"id\":4}', 'https://skyblue-rat-607542.hostingersite.com/importUnite', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:29:49', '2025-11-23 09:29:49'),
(5, 'App\\Models\\User', 1, 'created', 'App\\Models\\Unite', 5, '[]', '{\"name\":\"M\\u00e8tre\",\"iduser\":1,\"id\":5}', 'https://skyblue-rat-607542.hostingersite.com/importUnite', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:29:49', '2025-11-23 09:29:49'),
(6, 'App\\Models\\User', 1, 'created', 'App\\Models\\Unite', 6, '[]', '{\"name\":\"Unit\\u00e9\",\"iduser\":1,\"id\":6}', 'https://skyblue-rat-607542.hostingersite.com/importUnite', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:29:49', '2025-11-23 09:29:49'),
(7, 'App\\Models\\User', 1, 'created', 'App\\Models\\Unite', 7, '[]', '{\"name\":\"Paquet\",\"iduser\":1,\"id\":7}', 'https://skyblue-rat-607542.hostingersite.com/importUnite', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:29:49', '2025-11-23 09:29:49'),
(8, 'App\\Models\\User', 1, 'created', 'App\\Models\\Unite', 8, '[]', '{\"name\":\"Boite\",\"iduser\":1,\"id\":8}', 'https://skyblue-rat-607542.hostingersite.com/importUnite', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:29:49', '2025-11-23 09:29:49'),
(9, 'App\\Models\\User', 1, 'created', 'App\\Models\\Unite', 9, '[]', '{\"name\":\"Bouteille\",\"iduser\":1,\"id\":9}', 'https://skyblue-rat-607542.hostingersite.com/importUnite', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:29:49', '2025-11-23 09:29:49'),
(10, 'App\\Models\\User', 1, 'created', 'App\\Models\\Category', 1, '[]', '{\"name\":\"MATERIEL\",\"classe\":\"NON ALIMENTAIRE\",\"iduser\":1,\"id\":1}', 'https://skyblue-rat-607542.hostingersite.com/importCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:14', '2025-11-23 09:30:14'),
(11, 'App\\Models\\User', 1, 'created', 'App\\Models\\Category', 2, '[]', '{\"name\":\"OUTILLAGE\",\"classe\":\"NON ALIMENTAIRE\",\"iduser\":1,\"id\":2}', 'https://skyblue-rat-607542.hostingersite.com/importCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:14', '2025-11-23 09:30:14'),
(12, 'App\\Models\\User', 1, 'created', 'App\\Models\\Category', 3, '[]', '{\"name\":\"MOBILIER\",\"classe\":\"NON ALIMENTAIRE\",\"iduser\":1,\"id\":3}', 'https://skyblue-rat-607542.hostingersite.com/importCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:14', '2025-11-23 09:30:14'),
(13, 'App\\Models\\User', 1, 'created', 'App\\Models\\Category', 4, '[]', '{\"name\":\"FOURNITURE\",\"classe\":\"NON ALIMENTAIRE\",\"iduser\":1,\"id\":4}', 'https://skyblue-rat-607542.hostingersite.com/importCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:14', '2025-11-23 09:30:14'),
(14, 'App\\Models\\User', 1, 'created', 'App\\Models\\Category', 5, '[]', '{\"name\":\"EPICERIE & PRODUITS LAITIERS\",\"classe\":\"DENREES ALIMENTAIRES\",\"iduser\":1,\"id\":5}', 'https://skyblue-rat-607542.hostingersite.com/importCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:14', '2025-11-23 09:30:14'),
(15, 'App\\Models\\User', 1, 'created', 'App\\Models\\Category', 6, '[]', '{\"name\":\"LEGUMES & FRUITS\",\"classe\":\"DENREES ALIMENTAIRES\",\"iduser\":1,\"id\":6}', 'https://skyblue-rat-607542.hostingersite.com/importCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:14', '2025-11-23 09:30:14'),
(16, 'App\\Models\\User', 1, 'created', 'App\\Models\\Category', 7, '[]', '{\"name\":\"POISSON FRAIS\",\"classe\":\"DENREES ALIMENTAIRES\",\"iduser\":1,\"id\":7}', 'https://skyblue-rat-607542.hostingersite.com/importCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:14', '2025-11-23 09:30:14'),
(17, 'App\\Models\\User', 1, 'created', 'App\\Models\\Category', 8, '[]', '{\"name\":\"VIANDES ABATS\",\"classe\":\"DENREES ALIMENTAIRES\",\"iduser\":1,\"id\":8}', 'https://skyblue-rat-607542.hostingersite.com/importCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:14', '2025-11-23 09:30:14'),
(18, 'App\\Models\\User', 1, 'created', 'App\\Models\\Category', 9, '[]', '{\"name\":\"VOLAILLES ET \\u0152UFS\",\"classe\":\"DENREES ALIMENTAIRES\",\"iduser\":1,\"id\":9}', 'https://skyblue-rat-607542.hostingersite.com/importCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:14', '2025-11-23 09:30:14'),
(19, 'App\\Models\\User', 1, 'created', 'App\\Models\\Local', 1, '[]', '{\"name\":\"RESERVE FOUNITURE SCOLAIRE\",\"iduser\":1,\"id\":1}', 'https://skyblue-rat-607542.hostingersite.com/importLocal', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:32', '2025-11-23 09:30:32'),
(20, 'App\\Models\\User', 1, 'created', 'App\\Models\\Local', 2, '[]', '{\"name\":\"CHAMBRE FROIDE  NEGATIVE\",\"iduser\":1,\"id\":2}', 'https://skyblue-rat-607542.hostingersite.com/importLocal', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:32', '2025-11-23 09:30:32'),
(21, 'App\\Models\\User', 1, 'created', 'App\\Models\\Local', 3, '[]', '{\"name\":\"CHAMBRE FROIDE POSITIVE\",\"iduser\":1,\"id\":3}', 'https://skyblue-rat-607542.hostingersite.com/importLocal', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:32', '2025-11-23 09:30:32'),
(22, 'App\\Models\\User', 1, 'created', 'App\\Models\\Local', 4, '[]', '{\"name\":\"ECONOMAT\",\"iduser\":1,\"id\":4}', 'https://skyblue-rat-607542.hostingersite.com/importLocal', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:32', '2025-11-23 09:30:32'),
(23, 'App\\Models\\User', 1, 'created', 'App\\Models\\Local', 5, '[]', '{\"name\":\"RESERVE  MOBILIER DE BUREAU\",\"iduser\":1,\"id\":5}', 'https://skyblue-rat-607542.hostingersite.com/importLocal', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:32', '2025-11-23 09:30:32'),
(24, 'App\\Models\\User', 1, 'created', 'App\\Models\\Local', 6, '[]', '{\"name\":\"RESERVE FOUNITURE DE BUREAU\",\"iduser\":1,\"id\":6}', 'https://skyblue-rat-607542.hostingersite.com/importLocal', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:32', '2025-11-23 09:30:32'),
(25, 'App\\Models\\User', 1, 'created', 'App\\Models\\Local', 7, '[]', '{\"name\":\"RESERVE FOUNITURE ELECTRIQUE\",\"iduser\":1,\"id\":7}', 'https://skyblue-rat-607542.hostingersite.com/importLocal', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:32', '2025-11-23 09:30:32'),
(26, 'App\\Models\\User', 1, 'created', 'App\\Models\\Local', 8, '[]', '{\"name\":\"RESERVE FOUNITURE INFORMATIQUE\",\"iduser\":1,\"id\":8}', 'https://skyblue-rat-607542.hostingersite.com/importLocal', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:32', '2025-11-23 09:30:32'),
(27, 'App\\Models\\User', 1, 'created', 'App\\Models\\Local', 9, '[]', '{\"name\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION\",\"iduser\":1,\"id\":9}', 'https://skyblue-rat-607542.hostingersite.com/importLocal', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:32', '2025-11-23 09:30:32'),
(28, 'App\\Models\\User', 1, 'created', 'App\\Models\\Local', 10, '[]', '{\"name\":\"RESERVE MOBILIER SCOLAIRE\",\"iduser\":1,\"id\":10}', 'https://skyblue-rat-607542.hostingersite.com/importLocal', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:32', '2025-11-23 09:30:32'),
(29, 'App\\Models\\User', 1, 'created', 'App\\Models\\Local', 11, '[]', '{\"name\":\"RESERVE PAPITERIE\",\"iduser\":1,\"id\":11}', 'https://skyblue-rat-607542.hostingersite.com/importLocal', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:32', '2025-11-23 09:30:32'),
(30, 'App\\Models\\User', 1, 'created', 'App\\Models\\Local', 12, '[]', '{\"name\":\"RESERVE PRODUITS DE NETTOYAGE\",\"iduser\":1,\"id\":12}', 'https://skyblue-rat-607542.hostingersite.com/importLocal', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:32', '2025-11-23 09:30:32'),
(31, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 1, '[]', '{\"name\":\"A\",\"id_local\":2,\"iduser\":1,\"id\":1}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(32, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 2, '[]', '{\"name\":\"B\",\"id_local\":2,\"iduser\":1,\"id\":2}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(33, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 3, '[]', '{\"name\":\"C\",\"id_local\":2,\"iduser\":1,\"id\":3}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(34, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 4, '[]', '{\"name\":\"D\",\"id_local\":2,\"iduser\":1,\"id\":4}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(35, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 5, '[]', '{\"name\":\"A\",\"id_local\":3,\"iduser\":1,\"id\":5}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(36, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 6, '[]', '{\"name\":\"B\",\"id_local\":3,\"iduser\":1,\"id\":6}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(37, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 7, '[]', '{\"name\":\"C\",\"id_local\":3,\"iduser\":1,\"id\":7}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(38, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 8, '[]', '{\"name\":\"D\",\"id_local\":3,\"iduser\":1,\"id\":8}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(39, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 9, '[]', '{\"name\":\"E\",\"id_local\":3,\"iduser\":1,\"id\":9}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(40, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 10, '[]', '{\"name\":\"F\",\"id_local\":3,\"iduser\":1,\"id\":10}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(41, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 11, '[]', '{\"name\":\"A\",\"id_local\":4,\"iduser\":1,\"id\":11}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(42, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 12, '[]', '{\"name\":\"B\",\"id_local\":4,\"iduser\":1,\"id\":12}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(43, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 13, '[]', '{\"name\":\"C\",\"id_local\":4,\"iduser\":1,\"id\":13}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(44, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 14, '[]', '{\"name\":\"D\",\"id_local\":4,\"iduser\":1,\"id\":14}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(45, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 15, '[]', '{\"name\":\"E\",\"id_local\":4,\"iduser\":1,\"id\":15}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(46, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 16, '[]', '{\"name\":\"F\",\"id_local\":4,\"iduser\":1,\"id\":16}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(47, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 17, '[]', '{\"name\":\"G\",\"id_local\":4,\"iduser\":1,\"id\":17}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(48, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 18, '[]', '{\"name\":\"A\",\"id_local\":5,\"iduser\":1,\"id\":18}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(49, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 19, '[]', '{\"name\":\"B\",\"id_local\":5,\"iduser\":1,\"id\":19}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(50, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 20, '[]', '{\"name\":\"C\",\"id_local\":5,\"iduser\":1,\"id\":20}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(51, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 21, '[]', '{\"name\":\"D\",\"id_local\":5,\"iduser\":1,\"id\":21}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(52, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 22, '[]', '{\"name\":\"A1\",\"id_local\":6,\"iduser\":1,\"id\":22}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(53, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 23, '[]', '{\"name\":\"A2\",\"id_local\":6,\"iduser\":1,\"id\":23}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(54, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 24, '[]', '{\"name\":\"B1\",\"id_local\":6,\"iduser\":1,\"id\":24}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(55, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 25, '[]', '{\"name\":\"B2\",\"id_local\":6,\"iduser\":1,\"id\":25}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(56, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 26, '[]', '{\"name\":\"B3\",\"id_local\":6,\"iduser\":1,\"id\":26}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(57, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 27, '[]', '{\"name\":\"C\",\"id_local\":7,\"iduser\":1,\"id\":27}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(58, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 28, '[]', '{\"name\":\"A1\",\"id_local\":8,\"iduser\":1,\"id\":28}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(59, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 29, '[]', '{\"name\":\"A2\",\"id_local\":8,\"iduser\":1,\"id\":29}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(60, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 30, '[]', '{\"name\":\"A1\",\"id_local\":1,\"iduser\":1,\"id\":30}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(61, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 31, '[]', '{\"name\":\"A2\",\"id_local\":1,\"iduser\":1,\"id\":31}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(62, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 32, '[]', '{\"name\":\"B1\",\"id_local\":1,\"iduser\":1,\"id\":32}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(63, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 33, '[]', '{\"name\":\"B2\",\"id_local\":1,\"iduser\":1,\"id\":33}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(64, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 34, '[]', '{\"name\":\"B3\",\"id_local\":1,\"iduser\":1,\"id\":34}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(65, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 35, '[]', '{\"name\":\"A\",\"id_local\":9,\"iduser\":1,\"id\":35}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(66, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 36, '[]', '{\"name\":\"B\",\"id_local\":9,\"iduser\":1,\"id\":36}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(67, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 37, '[]', '{\"name\":\"D\",\"id_local\":10,\"iduser\":1,\"id\":37}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(68, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 38, '[]', '{\"name\":\"A1\",\"id_local\":11,\"iduser\":1,\"id\":38}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(69, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 39, '[]', '{\"name\":\"A2\",\"id_local\":11,\"iduser\":1,\"id\":39}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(70, 'App\\Models\\User', 1, 'created', 'App\\Models\\Rayon', 40, '[]', '{\"name\":\"A\",\"id_local\":12,\"iduser\":1,\"id\":40}', 'https://skyblue-rat-607542.hostingersite.com/importRayon', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:30:44', '2025-11-23 09:30:44'),
(71, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 1, '[]', '{\"name\":\"CUISINE\",\"id_categorie\":1,\"iduser\":1,\"id\":1}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(72, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 2, '[]', '{\"name\":\"RESTAURATION\",\"id_categorie\":1,\"iduser\":1,\"id\":2}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(73, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 3, '[]', '{\"name\":\"SCOLAIRE\",\"id_categorie\":1,\"iduser\":1,\"id\":3}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(74, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 4, '[]', '{\"name\":\"BUREAU\",\"id_categorie\":1,\"iduser\":1,\"id\":4}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(75, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 5, '[]', '{\"name\":\"INFORMATIQUE\",\"id_categorie\":1,\"iduser\":1,\"id\":5}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(76, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 6, '[]', '{\"name\":\"AUDIOVISUEL\",\"id_categorie\":1,\"iduser\":1,\"id\":6}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(77, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 7, '[]', '{\"name\":\"JARDINAGE\",\"id_categorie\":1,\"iduser\":1,\"id\":7}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(78, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 8, '[]', '{\"name\":\"CUISINE\",\"id_categorie\":2,\"iduser\":1,\"id\":8}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(79, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 9, '[]', '{\"name\":\"RESTAURATION\",\"id_categorie\":2,\"iduser\":1,\"id\":9}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(80, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 10, '[]', '{\"name\":\"PLOMBERIE ET QUINCAILLERIE\",\"id_categorie\":2,\"iduser\":1,\"id\":10}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(81, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 11, '[]', '{\"name\":\"BUREAU\",\"id_categorie\":3,\"iduser\":1,\"id\":11}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(82, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 12, '[]', '{\"name\":\"METALLIQUE\",\"id_categorie\":3,\"iduser\":1,\"id\":12}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(83, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 13, '[]', '{\"name\":\"SCOLAIRE\",\"id_categorie\":3,\"iduser\":1,\"id\":13}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(84, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 14, '[]', '{\"name\":\"RESTAURATION\",\"id_categorie\":3,\"iduser\":1,\"id\":14}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(85, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 15, '[]', '{\"name\":\"SCOLAIRE\",\"id_categorie\":4,\"iduser\":1,\"id\":15}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(86, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 16, '[]', '{\"name\":\"BUREAU\",\"id_categorie\":4,\"iduser\":1,\"id\":16}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(87, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 17, '[]', '{\"name\":\"INFORMATIQUE\",\"id_categorie\":4,\"iduser\":1,\"id\":17}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(88, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 18, '[]', '{\"name\":\"ELECTRIQUE\",\"id_categorie\":4,\"iduser\":1,\"id\":18}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(89, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 19, '[]', '{\"name\":\"PAPITERIE\",\"id_categorie\":4,\"iduser\":1,\"id\":19}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(90, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 20, '[]', '{\"name\":\"NETTOYAGE\",\"id_categorie\":4,\"iduser\":1,\"id\":20}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(91, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 21, '[]', '{\"name\":\"BOULANGERIE\",\"id_categorie\":5,\"iduser\":1,\"id\":21}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(92, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 22, '[]', '{\"name\":\"CONSERVES\",\"id_categorie\":5,\"iduser\":1,\"id\":22}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(93, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 23, '[]', '{\"name\":\"LEGUMES SECS (LEGUMINEUSES)\",\"id_categorie\":5,\"iduser\":1,\"id\":23}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(94, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 24, '[]', '{\"name\":\"PATTE & FARINEUSE\",\"id_categorie\":5,\"iduser\":1,\"id\":24}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(95, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 25, '[]', '{\"name\":\"EPICES MAROCAINES\",\"id_categorie\":5,\"iduser\":1,\"id\":25}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(96, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 26, '[]', '{\"name\":\"CONDIMENTS\",\"id_categorie\":5,\"iduser\":1,\"id\":26}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(97, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 27, '[]', '{\"name\":\"HERBES AROMATIQUES\",\"id_categorie\":5,\"iduser\":1,\"id\":27}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(98, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 28, '[]', '{\"name\":\"PRODUITS LAITIERS\",\"id_categorie\":5,\"iduser\":1,\"id\":28}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(99, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 29, '[]', '{\"name\":\"BOISSONS\",\"id_categorie\":5,\"iduser\":1,\"id\":29}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(100, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 30, '[]', '{\"name\":\"CHOCOLATERIES\",\"id_categorie\":5,\"iduser\":1,\"id\":30}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(101, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 31, '[]', '{\"name\":\"FRUITS SECS\",\"id_categorie\":5,\"iduser\":1,\"id\":31}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(102, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 32, '[]', '{\"name\":\"GLUCIDES\",\"id_categorie\":5,\"iduser\":1,\"id\":32}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(103, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 33, '[]', '{\"name\":\"MOLECULES\",\"id_categorie\":5,\"iduser\":1,\"id\":33}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(104, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 34, '[]', '{\"name\":\"HUILES\",\"id_categorie\":5,\"iduser\":1,\"id\":34}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(105, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 35, '[]', '{\"name\":\"LEGUMES\",\"id_categorie\":6,\"iduser\":1,\"id\":35}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(106, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 36, '[]', '{\"name\":\"FRUITS\",\"id_categorie\":6,\"iduser\":1,\"id\":36}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(107, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 37, '[]', '{\"name\":\"POISSON FRAIS\",\"id_categorie\":7,\"iduser\":1,\"id\":37}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(108, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 38, '[]', '{\"name\":\"VIANDES\",\"id_categorie\":8,\"iduser\":1,\"id\":38}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(109, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 39, '[]', '{\"name\":\"ABATS\",\"id_categorie\":8,\"iduser\":1,\"id\":39}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(110, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 40, '[]', '{\"name\":\"VOLAILLES\",\"id_categorie\":9,\"iduser\":1,\"id\":40}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(111, 'App\\Models\\User', 1, 'created', 'App\\Models\\SubCategory', 41, '[]', '{\"name\":\"\\u0152UFS\",\"id_categorie\":9,\"iduser\":1,\"id\":41}', 'https://skyblue-rat-607542.hostingersite.com/importSubCategory', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:12', '2025-11-23 09:31:12'),
(112, 'App\\Models\\User', 1, 'created', 'App\\Models\\Fournisseur', 1, '[]', '{\"entreprise\":\"FSM BUILDING\",\"Telephone\":\"0666259359\",\"Email\":\"rbenchtoukia@gmail.com\",\"ICE\":\"392516342689156\",\"RC\":\"36258\",\"siege_social\":\"BD SEBTA LOT FADL ALLAH 1 RUE RES MAJORELLE 1 IMM APPRT 7 ETG 2 , MOHAMMEDIA\",\"Patente\":\"39502156\",\"IF\":null,\"CNSS\":null,\"iduser\":1,\"id\":1}', 'https://skyblue-rat-607542.hostingersite.com/importFournisseur', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:28', '2025-11-23 09:31:28'),
(113, 'App\\Models\\User', 1, 'created', 'App\\Models\\Fournisseur', 2, '[]', '{\"entreprise\":\"STE HASNA FOURNITURE NEGOCE\",\"Telephone\":\"0522240160\",\"Email\":\"hasnafourniture@gmail.com\",\"ICE\":\"364556342685468\",\"RC\":\"41256\",\"siege_social\":\"24 Rue Dax Roche Noire, Casablanca\",\"Patente\":\"1600043\",\"IF\":null,\"CNSS\":null,\"iduser\":1,\"id\":2}', 'https://skyblue-rat-607542.hostingersite.com/importFournisseur', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:28', '2025-11-23 09:31:28'),
(114, 'App\\Models\\User', 1, 'created', 'App\\Models\\Fournisseur', 3, '[]', '{\"entreprise\":\"ULPRESS BUREAU\",\"Telephone\":\"0661939113\",\"Email\":\"ayoubaitcheraa@gmail.com\",\"ICE\":\"392516342688912\",\"RC\":\"21659\",\"siege_social\":\"147 BD LA RESISTANCE RES AFA ETAGE 2 APT 22 - CASA, Casablanca\",\"Patente\":\"3265060\",\"IF\":null,\"CNSS\":null,\"iduser\":1,\"id\":3}', 'https://skyblue-rat-607542.hostingersite.com/importFournisseur', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:28', '2025-11-23 09:31:28'),
(115, 'App\\Models\\User', 1, 'created', 'App\\Models\\Fournisseur', 4, '[]', '{\"entreprise\":\"STE MOBILIECTRO\",\"Telephone\":\"0661363946\",\"Email\":\"mobilieelectro@gmail.com\",\"ICE\":\"366516342689123\",\"RC\":\"15152\",\"siege_social\":\"359 BUREAU N\\u00b05 ETAGE 2 LOT MASSAR MARRAKECH, MARRAKECH\",\"Patente\":\"640094\",\"IF\":null,\"CNSS\":null,\"iduser\":1,\"id\":4}', 'https://skyblue-rat-607542.hostingersite.com/importFournisseur', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:28', '2025-11-23 09:31:28'),
(116, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 1, '[]', '{\"name\":\"Carnets Bon de Sortie Administration FT 20,5*20,5 cm\",\"code_article\":\"FOUELC039\",\"price_achat\":291.67,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":38,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A1 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC039\",\"id\":1}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(117, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 2, '[]', '{\"name\":\"Carnets Bon de Sortie de Cuisine FT 21*20,5 cm\",\"code_article\":\"FOUELC040\",\"price_achat\":2.4,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":38,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A1 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC040\",\"id\":2}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(118, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 3, '[]', '{\"name\":\"Carnets  de Rapport de Le\\u00e7ons   FT 25 *30 cm\",\"code_article\":\"FOUELC041\",\"price_achat\":250,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":38,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A1 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC041\",\"id\":3}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(119, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 4, '[]', '{\"name\":\"Carnets Bon de Sortie de Cuisine FT 21*30,5 cm\",\"code_article\":\"FOUELC042\",\"price_achat\":233.34,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":38,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A1 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC042\",\"id\":4}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(120, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 5, '[]', '{\"name\":\"Cardex Feuilles de Consommations FT 32*24,5 CM\",\"code_article\":\"FOUELC043\",\"price_achat\":66.67,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":38,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A1 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC043\",\"id\":5}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(121, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 6, '[]', '{\"name\":\"Carnets Bon de Sortie 03 Exemplaires\",\"code_article\":\"FOUELC044\",\"price_achat\":156,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":38,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A1 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC044\",\"id\":6}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(122, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 7, '[]', '{\"name\":\"Carnets Bon de Sortie de Restaurant  FT 21*20,5 cm\",\"code_article\":\"FOUELC045\",\"price_achat\":39.17,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":38,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A1 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC045\",\"id\":7}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(123, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 8, '[]', '{\"name\":\"Carnets Bon de Sortie de R\\u00e9ception   FT 26,5 *20,5 cm\",\"code_article\":\"FOUELC046\",\"price_achat\":36.71,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":38,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A1 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC046\",\"id\":8}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(124, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 9, '[]', '{\"name\":\"Carnets Bon de Sortie de Commande   FT 19,5 *13 cm\",\"code_article\":\"FOUELC047\",\"price_achat\":17,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":38,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A1 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC047\",\"id\":9}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(125, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 10, '[]', '{\"name\":\"Carnets  de Rapport de Le\\u00e7ons   FT 21,5 *31,5 cm\",\"code_article\":\"FOUELC048\",\"price_achat\":103,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":38,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A1 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC048\",\"id\":10}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(126, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 11, '[]', '{\"name\":\"Carnets  de Stages   FT12 *19,5 cm\",\"code_article\":\"FOUELC049\",\"price_achat\":850,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":38,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A1 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC049\",\"id\":11}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(127, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 12, '[]', '{\"name\":\"Carnets Feuilles de Consommations FT 48*32 CM\",\"code_article\":\"FOUELC053\",\"price_achat\":112.5,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":39,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A2 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC053\",\"id\":12}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(128, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 13, '[]', '{\"name\":\"Fiches de Renseignement FT 21*30 CM\",\"code_article\":\"FOUELC055\",\"price_achat\":1100,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":39,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A2 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC055\",\"id\":13}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(129, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 14, '[]', '{\"name\":\"Fiches Evaluations trimestrielle\",\"code_article\":\"FOUELC056\",\"price_achat\":970,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":39,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A2 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC056\",\"id\":14}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(130, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 15, '[]', '{\"name\":\"Feuilles d\'examen FT 44*31,5 cm\",\"code_article\":\"FOUELC057\",\"price_achat\":208.33,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":39,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A2 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC057\",\"id\":15}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(131, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 16, '[]', '{\"name\":\"Feuilles de Concours d\'acc\\u00e9s  FT 44*31,5 cm\",\"code_article\":\"FOUELC058\",\"price_achat\":870,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":39,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A2 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC058\",\"id\":16}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(132, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 17, '[]', '{\"name\":\"Livres D\\\"apprentissage m\\u00e9tier : Boulangerie p\\u00e2tissier\",\"code_article\":\"FOUELC059\",\"price_achat\":1380,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":39,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A2 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC059\",\"id\":17}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(133, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 18, '[]', '{\"name\":\"Livres D\\\"apprentissage m\\u00e9tier : Restaurant\",\"code_article\":\"FOUELC060\",\"price_achat\":760,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":39,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A2 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC060\",\"id\":18}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(134, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 19, '[]', '{\"name\":\"Livres D\\\"apprentissage m\\u00e9tier : Cuisine\",\"code_article\":\"FOUELC061\",\"price_achat\":1100,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":39,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A2 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC061\",\"id\":19}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(135, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 20, '[]', '{\"name\":\"Livres D\'engagement\",\"code_article\":\"FOUELC063\",\"price_achat\":650,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":39,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A2 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC063\",\"id\":20}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(136, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 21, '[]', '{\"name\":\"Registre de D\\u00e9pense\",\"code_article\":\"FOUELC064\",\"price_achat\":600,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":39,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A2 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC064\",\"id\":21}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(137, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 22, '[]', '{\"name\":\"Registre Comptable\",\"code_article\":\"FOUELC065\",\"price_achat\":600,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":39,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A2 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC065\",\"id\":22}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(138, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 23, '[]', '{\"name\":\"Registre de D\\u00e9part\",\"code_article\":\"FOUELC066\",\"price_achat\":600,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":39,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A2 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC066\",\"id\":23}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(139, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 24, '[]', '{\"name\":\"Registre d\'arriv\\u00e9e\",\"code_article\":\"FOUELC067\",\"price_achat\":650,\"id_categorie\":4,\"id_subcategorie\":19,\"id_local\":11,\"id_rayon\":39,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":null,\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PAPITERIE \\/ A2 \\/ FOURNITURE \\/ PAPITERIE \\/ FOUELC067\",\"id\":24}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(140, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 25, '[]', '{\"name\":\"Farine de Bl\\u00e9 Tendre\",\"code_article\":\"EPLBOU001\",\"price_achat\":13,\"id_categorie\":5,\"id_subcategorie\":21,\"id_local\":4,\"id_rayon\":11,\"seuil\":13,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-06-06 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ BOULANGERIE \\/ EPLBOU001\",\"id\":25}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(141, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 26, '[]', '{\"name\":\"Farine de Bl\\u00e9 Dur\",\"code_article\":\"EPLBOU002\",\"price_achat\":13,\"id_categorie\":5,\"id_subcategorie\":21,\"id_local\":4,\"id_rayon\":11,\"seuil\":13,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-01-07 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ BOULANGERIE \\/ EPLBOU002\",\"id\":26}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(142, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 27, '[]', '{\"name\":\"Far- de Bl\\u00e9 Tendre  pour P\\u00e4tisserie\",\"code_article\":\"EPLBOU003\",\"price_achat\":13,\"id_categorie\":5,\"id_subcategorie\":21,\"id_local\":4,\"id_rayon\":11,\"seuil\":13,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-02-07 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ BOULANGERIE \\/ EPLBOU003\",\"id\":27}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(143, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 28, '[]', '{\"name\":\"Farine de Bl\\u00e9 Dur Son\",\"code_article\":\"EPLBOU004\",\"price_achat\":13,\"id_categorie\":5,\"id_subcategorie\":21,\"id_local\":4,\"id_rayon\":11,\"seuil\":13,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-03-07 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ BOULANGERIE \\/ EPLBOU004\",\"id\":28}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(144, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 29, '[]', '{\"name\":\"Farine D\'orge\",\"code_article\":\"EPLBOU005\",\"price_achat\":20,\"id_categorie\":5,\"id_subcategorie\":21,\"id_local\":4,\"id_rayon\":11,\"seuil\":20,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-04-07 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ BOULANGERIE \\/ EPLBOU005\",\"id\":29}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(145, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 30, '[]', '{\"name\":\"Semoule Mais boulangerie\",\"code_article\":\"EPLBOU006\",\"price_achat\":14,\"id_categorie\":5,\"id_subcategorie\":21,\"id_local\":4,\"id_rayon\":11,\"seuil\":14,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-10-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ BOULANGERIE \\/ EPLBOU006\",\"id\":30}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(146, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 31, '[]', '{\"name\":\"Avoine\",\"code_article\":\"EPLBOU007\",\"price_achat\":14,\"id_categorie\":5,\"id_subcategorie\":21,\"id_local\":4,\"id_rayon\":11,\"seuil\":14,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-06-07 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ BOULANGERIE \\/ EPLBOU007\",\"id\":31}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(147, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 32, '[]', '{\"name\":\"Levure Boulang\\u00e9re de 125 grs\",\"code_article\":\"EPLBOU008\",\"price_achat\":7,\"id_categorie\":5,\"id_subcategorie\":21,\"id_local\":4,\"id_rayon\":11,\"seuil\":7,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-07-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ BOULANGERIE \\/ EPLBOU008\",\"id\":32}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(148, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 33, '[]', '{\"name\":\"Levure Chimique\",\"code_article\":\"EPLBOU009\",\"price_achat\":7,\"id_categorie\":5,\"id_subcategorie\":21,\"id_local\":4,\"id_rayon\":11,\"seuil\":7,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-08-07 00:00:00\",\"id_tva\":1,\"id_unite\":7,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ BOULANGERIE \\/ EPLBOU009\",\"id\":33}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(149, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 34, '[]', '{\"name\":\"PAIN DE MI\",\"code_article\":\"EPLBOU010\",\"price_achat\":7,\"id_categorie\":5,\"id_subcategorie\":21,\"id_local\":4,\"id_rayon\":11,\"seuil\":7,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-09-07 00:00:00\",\"id_tva\":1,\"id_unite\":7,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ BOULANGERIE \\/ EPLBOU010\",\"id\":34}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:47', '2025-11-23 09:31:47'),
(150, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 35, '[]', '{\"name\":\"Cornichons 4\\/4\",\"code_article\":\"EPLCON001\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":22,\"id_local\":4,\"id_rayon\":11,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-10-07 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ CONSERVES \\/ EPLCON001\",\"id\":35}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(151, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 36, '[]', '{\"name\":\"Cornichons de 500 grs\",\"code_article\":\"EPLCON002\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":22,\"id_local\":4,\"id_rayon\":11,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-11-07 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ CONSERVES \\/ EPLCON002\",\"id\":36}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(152, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 37, '[]', '{\"name\":\"Confiture 4\\/4\",\"code_article\":\"EPLCON003\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":22,\"id_local\":4,\"id_rayon\":11,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-12-07 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ CONSERVES \\/ EPLCON003\",\"id\":37}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(153, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 38, '[]', '{\"name\":\"Mais Doux 4\\/4\",\"code_article\":\"EPLCON004\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":22,\"id_local\":4,\"id_rayon\":11,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-08-05 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ CONSERVES \\/ EPLCON004\",\"id\":38}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(154, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 39, '[]', '{\"name\":\"Mais Doux de 500 grs\",\"code_article\":\"EPLCON005\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":22,\"id_local\":4,\"id_rayon\":11,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-07 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ CONSERVES \\/ EPLCON005\",\"id\":39}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(155, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 40, '[]', '{\"name\":\"Olive Noir 4\\/4\",\"code_article\":\"EPLCON006\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":22,\"id_local\":4,\"id_rayon\":11,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-07 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ CONSERVES \\/ EPLCON006\",\"id\":40}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(156, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 41, '[]', '{\"name\":\"Thon \\u00e0 L\'huile de 400 grs\",\"code_article\":\"EPLCON007\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":22,\"id_local\":4,\"id_rayon\":12,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-07 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ CONSERVES \\/ EPLCON007\",\"id\":41}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(157, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 42, '[]', '{\"name\":\"Tomate Concentr\\u00e9e 4\\/4\",\"code_article\":\"EPLCON008\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":22,\"id_local\":4,\"id_rayon\":12,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-07 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ CONSERVES \\/ EPLCON008\",\"id\":42}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(158, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 43, '[]', '{\"name\":\"Tomate Concentr\\u00e9e 1\\/6\",\"code_article\":\"EPLCON009\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":22,\"id_local\":4,\"id_rayon\":12,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-07 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ CONSERVES \\/ EPLCON009\",\"id\":43}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(159, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 44, '[]', '{\"name\":\"Tomate Concentr\\u00e9e 1\\/8\",\"code_article\":\"EPLCON010\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":22,\"id_local\":4,\"id_rayon\":12,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-07 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ CONSERVES \\/ EPLCON010\",\"id\":44}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(160, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 45, '[]', '{\"name\":\"Miel Ruche de 01 kg\",\"code_article\":\"EPLCON011\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":22,\"id_local\":4,\"id_rayon\":12,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-08-07 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ CONSERVES \\/ EPLCON011\",\"id\":45}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(161, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 46, '[]', '{\"name\":\"Miel Pur de 850 grs\",\"code_article\":\"EPLCON012\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":22,\"id_local\":4,\"id_rayon\":12,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-09-07 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ CONSERVES \\/ EPLCON012\",\"id\":46}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(162, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 47, '[]', '{\"name\":\"Ananas Rondelles 4\\/4\",\"code_article\":\"EPLCON013\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":22,\"id_local\":4,\"id_rayon\":12,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-10-07 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ CONSERVES \\/ EPLCON013\",\"id\":47}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(163, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 48, '[]', '{\"name\":\"Petits Pois 4\\/4\",\"code_article\":\"EPLCON014\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":22,\"id_local\":4,\"id_rayon\":12,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-11-07 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ CONSERVES \\/ EPLCON014\",\"id\":48}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(164, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 49, '[]', '{\"name\":\"Demi Poire 4\\/4\",\"code_article\":\"EPLCON015\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":22,\"id_local\":4,\"id_rayon\":12,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-02-05 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ CONSERVES \\/ EPLCON015\",\"id\":49}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(165, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 50, '[]', '{\"name\":\"Lentilles\",\"code_article\":\"EPLLSE001\",\"price_achat\":18,\"id_categorie\":5,\"id_subcategorie\":23,\"id_local\":4,\"id_rayon\":12,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-03-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ LEGUMES SECS (LEGUMINEUSES) \\/ EPLLSE001\",\"id\":50}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(166, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 51, '[]', '{\"name\":\"F\\u00e9ves S\\u00e9ches\",\"code_article\":\"EPLLSE002\",\"price_achat\":12,\"id_categorie\":5,\"id_subcategorie\":23,\"id_local\":4,\"id_rayon\":12,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-04-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ LEGUMES SECS (LEGUMINEUSES) \\/ EPLLSE002\",\"id\":51}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(167, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 52, '[]', '{\"name\":\"Haricot Blanc Secs\",\"code_article\":\"EPLLSE003\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":23,\"id_local\":4,\"id_rayon\":12,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-05-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ LEGUMES SECS (LEGUMINEUSES) \\/ EPLLSE003\",\"id\":52}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(168, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 53, '[]', '{\"name\":\"Petits Pois Concass\\u00e9es\",\"code_article\":\"EPLLSE004\",\"price_achat\":22,\"id_categorie\":5,\"id_subcategorie\":23,\"id_local\":4,\"id_rayon\":12,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-06-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ LEGUMES SECS (LEGUMINEUSES) \\/ EPLLSE004\",\"id\":53}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(169, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 54, '[]', '{\"name\":\"Poischiches\",\"code_article\":\"EPLLSE005\",\"price_achat\":25,\"id_categorie\":5,\"id_subcategorie\":23,\"id_local\":4,\"id_rayon\":12,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-07-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ LEGUMES SECS (LEGUMINEUSES) \\/ EPLLSE005\",\"id\":54}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(170, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 55, '[]', '{\"name\":\"Riz Long Glac\\u00e9\",\"code_article\":\"EPLPAF001\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":12,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-08-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF001\",\"id\":55}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(171, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 56, '[]', '{\"name\":\"Coquillettes\",\"code_article\":\"EPLPAF002\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":12,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-09-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF002\",\"id\":56}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(172, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 57, '[]', '{\"name\":\"Nouilles\",\"code_article\":\"EPLPAF003\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":13,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-10-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF003\",\"id\":57}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(173, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 58, '[]', '{\"name\":\"Spaghettis\",\"code_article\":\"EPLPAF004\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":13,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-11-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF004\",\"id\":58}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(174, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 59, '[]', '{\"name\":\"Semoule de Couscous\",\"code_article\":\"EPLPAF005\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":13,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-12-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF005\",\"id\":59}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(175, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 60, '[]', '{\"name\":\"Torsade\",\"code_article\":\"EPLPAF006\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":13,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF006\",\"id\":60}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(176, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 61, '[]', '{\"name\":\"Semoule Fine\",\"code_article\":\"EPLPAF007\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":13,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF007\",\"id\":61}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(177, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 62, '[]', '{\"name\":\"Semoule Grosse\",\"code_article\":\"EPLPAF008\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":13,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF008\",\"id\":62}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(178, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 63, '[]', '{\"name\":\"Semoule Fino\",\"code_article\":\"EPLPAF009\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":13,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF009\",\"id\":63}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(179, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 64, '[]', '{\"name\":\"Belboula GF\",\"code_article\":\"EPLPAF010\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":13,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF010\",\"id\":64}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(180, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 65, '[]', '{\"name\":\"Belboula MF\",\"code_article\":\"EPLPAF011\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":13,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF011\",\"id\":65}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(181, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 66, '[]', '{\"name\":\"Vermicelle de Chine\",\"code_article\":\"EPLPAF012\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":13,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF012\",\"id\":66}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(182, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 67, '[]', '{\"name\":\"Vermicelle Cheveux D\'enge\",\"code_article\":\"EPLPAF013\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":13,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-01-06 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF013\",\"id\":67}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(183, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 68, '[]', '{\"name\":\"Poudre de Riz\",\"code_article\":\"EPLPAF014\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":13,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-02-06 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF014\",\"id\":68}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(184, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 69, '[]', '{\"name\":\"Maizena de 180 grs\",\"code_article\":\"EPLPAF015\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":13,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-03-06 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF015\",\"id\":69}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(185, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 70, '[]', '{\"name\":\"Poudre Cr\\u00e8me\",\"code_article\":\"EPLPAF016\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":13,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-04-06 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF016\",\"id\":70}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(186, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 71, '[]', '{\"name\":\"BLE EBLY DE 500 GR\",\"code_article\":\"EPLPAF017\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":24,\"id_local\":4,\"id_rayon\":13,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-05-06 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ PATTE & FARINEUSE \\/ EPLPAF017\",\"id\":71}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(187, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 72, '[]', '{\"name\":\"Artichauts Frais\",\"code_article\":\"LEFLEG001\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-09-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG001\",\"id\":72}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(188, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 73, '[]', '{\"name\":\"Aubergines\",\"code_article\":\"LEFLEG002\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-10-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG002\",\"id\":73}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(189, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 74, '[]', '{\"name\":\"Betteraves\",\"code_article\":\"LEFLEG003\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-11-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG003\",\"id\":74}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(190, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 75, '[]', '{\"name\":\"Carottes\",\"code_article\":\"LEFLEG004\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-12-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG004\",\"id\":75}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(191, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 76, '[]', '{\"name\":\"Choux Verts\",\"code_article\":\"LEFLEG005\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-01-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG005\",\"id\":76}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(192, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 77, '[]', '{\"name\":\"CHAMPIGNONS FRAIS\",\"code_article\":\"LEFLEG006\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-02-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG006\",\"id\":77}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(193, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 78, '[]', '{\"name\":\"Choux Fleurs\",\"code_article\":\"LEFLEG007\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-03-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG007\",\"id\":78}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(194, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 79, '[]', '{\"name\":\"Courgettes\",\"code_article\":\"LEFLEG008\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-04-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG008\",\"id\":79}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(195, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 80, '[]', '{\"name\":\"Citrons Frais\",\"code_article\":\"LEFLEG009\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-05-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG009\",\"id\":80}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(196, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 81, '[]', '{\"name\":\"Citrons Confits\",\"code_article\":\"LEFLEG010\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-06-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG010\",\"id\":81}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(197, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 82, '[]', '{\"name\":\"Coings\",\"code_article\":\"LEFLEG011\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-07-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG011\",\"id\":82}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(198, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 83, '[]', '{\"name\":\"Concombres\",\"code_article\":\"LEFLEG012\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-08-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG012\",\"id\":83}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(199, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 84, '[]', '{\"name\":\"Coriandre\",\"code_article\":\"LEFLEG013\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-09-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG013\",\"id\":84}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(200, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 85, '[]', '{\"name\":\"Courge Rouge\",\"code_article\":\"LEFLEG014\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-10-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG014\",\"id\":85}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(201, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 86, '[]', '{\"name\":\"Epinards\",\"code_article\":\"LEFLEG015\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-11-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG015\",\"id\":86}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(202, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 87, '[]', '{\"name\":\"ECHALOTTE\",\"code_article\":\"LEFLEG016\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-12-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG016\",\"id\":87}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(203, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 88, '[]', '{\"name\":\"MAUVE\",\"code_article\":\"LEFLEG017\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG017\",\"id\":88}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(204, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 89, '[]', '{\"name\":\"PETITE OIGNON\",\"code_article\":\"LEFLEG018\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":7,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ C \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG018\",\"id\":89}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(205, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 90, '[]', '{\"name\":\"POURPIER\",\"code_article\":\"LEFLEG019\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG019\",\"id\":90}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(206, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 91, '[]', '{\"name\":\"Fenouils\",\"code_article\":\"LEFLEG020\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG020\",\"id\":91}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(207, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 92, '[]', '{\"name\":\"F\\u00e9ves Fraiches\",\"code_article\":\"LEFLEG021\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG021\",\"id\":92}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(208, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 93, '[]', '{\"name\":\"Haricots Verts\",\"code_article\":\"LEFLEG022\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-09 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG022\",\"id\":93}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(209, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 94, '[]', '{\"name\":\"Laitues\",\"code_article\":\"LEFLEG023\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-01-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG023\",\"id\":94}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(210, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 95, '[]', '{\"name\":\"Laitues Fris\\u00e9es\",\"code_article\":\"LEFLEG024\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-02-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG024\",\"id\":95}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(211, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 96, '[]', '{\"name\":\"Navets Sas Branche\",\"code_article\":\"LEFLEG025\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-03-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG025\",\"id\":96}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(212, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 97, '[]', '{\"name\":\"Navets salsif\\u00e9\",\"code_article\":\"LEFLEG026\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-04-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG026\",\"id\":97}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(213, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 98, '[]', '{\"name\":\"Oignons Sans Branches\",\"code_article\":\"LEFLEG027\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-05-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG027\",\"id\":98}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(214, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 99, '[]', '{\"name\":\"Oignons avec Branches\",\"code_article\":\"LEFLEG028\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-06-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG028\",\"id\":99}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(215, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 100, '[]', '{\"name\":\"Olives Confites Verte\",\"code_article\":\"LEFLEG029\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-07-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG029\",\"id\":100}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(216, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 101, '[]', '{\"name\":\"Olives Meslalla\",\"code_article\":\"LEFLEG030\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-08-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG030\",\"id\":101}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(217, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 102, '[]', '{\"name\":\"Persil\",\"code_article\":\"LEFLEG031\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-09-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG031\",\"id\":102}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(218, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 103, '[]', '{\"name\":\"Petits Pois Frais\",\"code_article\":\"LEFLEG032\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-10-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG032\",\"id\":103}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(219, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 104, '[]', '{\"name\":\"Poireaux\",\"code_article\":\"LEFLEG033\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-11-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG033\",\"id\":104}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(220, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 105, '[]', '{\"name\":\"Poivrons Verts\",\"code_article\":\"LEFLEG034\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":9,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-12-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ E \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG034\",\"id\":105}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(221, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 106, '[]', '{\"name\":\"Poivrons Rouge\",\"code_article\":\"LEFLEG035\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":9,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-01-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ E \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG035\",\"id\":106}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(222, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 107, '[]', '{\"name\":\"Poivrons Jaune\",\"code_article\":\"LEFLEG036\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":9,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-02-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ E \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG036\",\"id\":107}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(223, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 108, '[]', '{\"name\":\"Pomme de Terre\",\"code_article\":\"LEFLEG037\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":9,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-03-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ E \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG037\",\"id\":108}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(224, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 109, '[]', '{\"name\":\"Radis\",\"code_article\":\"LEFLEG038\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":9,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-04-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ E \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG038\",\"id\":109}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(225, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 110, '[]', '{\"name\":\"Tomates Fraiches\",\"code_article\":\"LEFLEG039\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":9,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-05-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ E \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG039\",\"id\":110}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(226, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 111, '[]', '{\"name\":\"Tomates Cerises\",\"code_article\":\"LEFLEG040\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":9,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-06-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ E \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG040\",\"id\":111}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(227, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 112, '[]', '{\"name\":\"TOPINAMBOUR\",\"code_article\":\"LEFLEG041\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":9,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-07-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ E \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG041\",\"id\":112}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(228, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 113, '[]', '{\"name\":\"PATATE DOUCE\",\"code_article\":\"LEFLEG042\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":35,\"id_local\":3,\"id_rayon\":9,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-08-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ E \\/ LEGUMES & FRUITS \\/ LEGUMES \\/ LEFLEG042\",\"id\":113}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(229, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 114, '[]', '{\"name\":\"Ananas Frais\",\"code_article\":\"LEFFRU001\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":9,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-09-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ E \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU001\",\"id\":114}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(230, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 115, '[]', '{\"name\":\"Bananes\",\"code_article\":\"LEFFRU002\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":9,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-10-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ E \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU002\",\"id\":115}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(231, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 116, '[]', '{\"name\":\"Cl\\u00e9mentines\",\"code_article\":\"LEFFRU003\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":9,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-11-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ E \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU003\",\"id\":116}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(232, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 117, '[]', '{\"name\":\"Fraises\",\"code_article\":\"LEFFRU004\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":9,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-12-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ E \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU004\",\"id\":117}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(233, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 118, '[]', '{\"name\":\"Grenadines\",\"code_article\":\"LEFFRU005\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":9,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ E \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU005\",\"id\":118}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(234, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 119, '[]', '{\"name\":\"Kiwi\",\"code_article\":\"LEFFRU006\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":9,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ E \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU006\",\"id\":119}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(235, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 120, '[]', '{\"name\":\"Oranges de Table\",\"code_article\":\"LEFFRU007\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":10,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ F \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU007\",\"id\":120}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(236, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 121, '[]', '{\"name\":\"Oranges \\u00e0 presser\",\"code_article\":\"LEFFRU008\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":10,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ F \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU008\",\"id\":121}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(237, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 122, '[]', '{\"name\":\"Poires\",\"code_article\":\"LEFFRU009\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":10,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ F \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU009\",\"id\":122}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(238, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 123, '[]', '{\"name\":\"Pomme Fruits\",\"code_article\":\"LEFFRU010\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":10,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ F \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU010\",\"id\":123}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(239, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 124, '[]', '{\"name\":\"Prunes\",\"code_article\":\"LEFFRU011\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":10,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-10 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ F \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU011\",\"id\":124}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(240, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 125, '[]', '{\"name\":\"Raisins Frais\",\"code_article\":\"LEFFRU012\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":10,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-01-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ F \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU012\",\"id\":125}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(241, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 126, '[]', '{\"name\":\"Abricots Frais\",\"code_article\":\"LEFFRU013\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":10,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-02-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ F \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU013\",\"id\":126}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(242, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 127, '[]', '{\"name\":\"Anones Frais\",\"code_article\":\"LEFFRU014\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":10,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-03-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ F \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU014\",\"id\":127}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(243, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 128, '[]', '{\"name\":\"past\\u00e9que\",\"code_article\":\"LEFFRU015\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":10,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-04-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ F \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU015\",\"id\":128}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(244, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 129, '[]', '{\"name\":\"melon\",\"code_article\":\"LEFFRU016\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":10,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-05-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ F \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU016\",\"id\":129}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(245, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 130, '[]', '{\"name\":\"cantaloupe\",\"code_article\":\"LEFFRU017\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":10,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-06-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ F \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU017\",\"id\":130}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(246, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 131, '[]', '{\"name\":\"Papaye\",\"code_article\":\"LEFFRU018\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":10,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-07-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ F \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU018\",\"id\":131}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(247, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 132, '[]', '{\"name\":\"Kaki\",\"code_article\":\"LEFFRU019\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":10,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-08-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ F \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU019\",\"id\":132}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(248, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 133, '[]', '{\"name\":\"Framboise\",\"code_article\":\"LEFFRU020\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":10,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-09-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ F \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU020\",\"id\":133}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(249, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 134, '[]', '{\"name\":\"Cerise\",\"code_article\":\"LEFFRU021\",\"price_achat\":15,\"id_categorie\":6,\"id_subcategorie\":36,\"id_local\":3,\"id_rayon\":10,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-10-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ F \\/ LEGUMES & FRUITS \\/ FRUITS \\/ LEFFRU021\",\"id\":134}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(250, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 135, '[]', '{\"name\":\"Calamar Frais\",\"code_article\":\"PAFPAF001\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":1,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-11-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ A \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF001\",\"id\":135}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(251, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 136, '[]', '{\"name\":\"Crevettes Frais\",\"code_article\":\"PAFPAF002\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":1,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-12-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ A \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF002\",\"id\":136}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(252, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 137, '[]', '{\"name\":\"Crevettes Royal\",\"code_article\":\"PAFPAF003\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":1,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-01-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ A \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF003\",\"id\":137}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(253, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 138, '[]', '{\"name\":\"Merlan Frais\",\"code_article\":\"PAFPAF004\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":1,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-02-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ A \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF004\",\"id\":138}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(254, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 139, '[]', '{\"name\":\"Sardines Frais\",\"code_article\":\"PAFPAF005\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":1,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-03-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ A \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF005\",\"id\":139}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(255, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 140, '[]', '{\"name\":\"Congres Frais\",\"code_article\":\"PAFPAF006\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":1,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-04-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ A \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF006\",\"id\":140}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(256, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 141, '[]', '{\"name\":\"Ombrines Frais\",\"code_article\":\"PAFPAF007\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":1,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-05-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ A \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF007\",\"id\":141}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(257, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 142, '[]', '{\"name\":\"Pageots Frais\",\"code_article\":\"PAFPAF008\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":1,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-06-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ A \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF008\",\"id\":142}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(258, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 143, '[]', '{\"name\":\"Soles Ration Frais\",\"code_article\":\"PAFPAF009\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":1,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-07-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ A \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF009\",\"id\":143}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(259, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 144, '[]', '{\"name\":\"Espadon Frais\",\"code_article\":\"PAFPAF010\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":1,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-08-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ A \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF010\",\"id\":144}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(260, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 145, '[]', '{\"name\":\"poulpe\",\"code_article\":\"PAFPAF011\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":1,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-09-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ A \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF011\",\"id\":145}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(261, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 146, '[]', '{\"name\":\"la seiche\",\"code_article\":\"PAFPAF012\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":2,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-10-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ B \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF012\",\"id\":146}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(262, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 147, '[]', '{\"name\":\"la pieuvre\",\"code_article\":\"PAFPAF013\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":2,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-11-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ B \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF013\",\"id\":147}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(263, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 148, '[]', '{\"name\":\"la raie\",\"code_article\":\"PAFPAF014\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":2,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-12-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ B \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF014\",\"id\":148}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(264, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 149, '[]', '{\"name\":\"les homards\",\"code_article\":\"PAFPAF015\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":2,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ B \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF015\",\"id\":149}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(265, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 150, '[]', '{\"name\":\"Langouste\",\"code_article\":\"PAFPAF016\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":2,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ B \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF016\",\"id\":150}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(266, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 151, '[]', '{\"name\":\"laugoustine\",\"code_article\":\"PAFPAF017\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":2,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ B \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF017\",\"id\":151}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(267, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 152, '[]', '{\"name\":\"les palourdes\",\"code_article\":\"PAFPAF018\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":2,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ B \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF018\",\"id\":152}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(268, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 153, '[]', '{\"name\":\"saint jack\",\"code_article\":\"PAFPAF019\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":2,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ B \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF019\",\"id\":153}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(269, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 154, '[]', '{\"name\":\"les huitres\",\"code_article\":\"PAFPAF020\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":2,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-11 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ B \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF020\",\"id\":154}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(270, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 155, '[]', '{\"name\":\"les moules\",\"code_article\":\"PAFPAF021\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":2,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-01-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ B \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF021\",\"id\":155}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(271, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 156, '[]', '{\"name\":\"les crabs\",\"code_article\":\"PAFPAF022\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":2,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-02-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ B \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF022\",\"id\":156}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(272, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 157, '[]', '{\"name\":\"tourteau\",\"code_article\":\"PAFPAF023\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":2,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-03-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ B \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF023\",\"id\":157}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(273, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 158, '[]', '{\"name\":\"araign\\u00e9e de mer\",\"code_article\":\"PAFPAF024\",\"price_achat\":15,\"id_categorie\":7,\"id_subcategorie\":37,\"id_local\":2,\"id_rayon\":3,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-04-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ C \\/ POISSON FRAIS \\/ POISSON FRAIS \\/ PAFPAF024\",\"id\":158}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(274, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 159, '[]', '{\"name\":\"Morceaux de Viande avec OS\",\"code_article\":\"VABVIA001\",\"price_achat\":15,\"id_categorie\":8,\"id_subcategorie\":38,\"id_local\":2,\"id_rayon\":3,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-05-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ C \\/ VIANDES ABATS \\/ VIANDES \\/ VABVIA001\",\"id\":159}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(275, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 160, '[]', '{\"name\":\"tripes de mouton\",\"code_article\":\"VABVIA002\",\"price_achat\":15,\"id_categorie\":8,\"id_subcategorie\":38,\"id_local\":2,\"id_rayon\":3,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-06-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ C \\/ VIANDES ABATS \\/ VIANDES \\/ VABVIA002\",\"id\":160}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(276, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 161, '[]', '{\"name\":\"pied de veau\",\"code_article\":\"VABVIA003\",\"price_achat\":15,\"id_categorie\":8,\"id_subcategorie\":38,\"id_local\":2,\"id_rayon\":3,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-07-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ C \\/ VIANDES ABATS \\/ VIANDES \\/ VABVIA003\",\"id\":161}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(277, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 162, '[]', '{\"name\":\"Epaule de Mouton\",\"code_article\":\"VABVIA004\",\"price_achat\":15,\"id_categorie\":8,\"id_subcategorie\":38,\"id_local\":2,\"id_rayon\":3,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-08-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ C \\/ VIANDES ABATS \\/ VIANDES \\/ VABVIA004\",\"id\":162}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(278, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 163, '[]', '{\"name\":\"Filet de B\\u0153ufs\",\"code_article\":\"VABVIA005\",\"price_achat\":15,\"id_categorie\":8,\"id_subcategorie\":38,\"id_local\":2,\"id_rayon\":3,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-09-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ C \\/ VIANDES ABATS \\/ VIANDES \\/ VABVIA005\",\"id\":163}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(279, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 164, '[]', '{\"name\":\"Viande Hach\\u00e9\",\"code_article\":\"VABVIA006\",\"price_achat\":15,\"id_categorie\":8,\"id_subcategorie\":38,\"id_local\":2,\"id_rayon\":3,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-10-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ C \\/ VIANDES ABATS \\/ VIANDES \\/ VABVIA006\",\"id\":164}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(280, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 165, '[]', '{\"name\":\"les saucisses\",\"code_article\":\"VABVIA007\",\"price_achat\":15,\"id_categorie\":8,\"id_subcategorie\":38,\"id_local\":2,\"id_rayon\":3,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-11-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ C \\/ VIANDES ABATS \\/ VIANDES \\/ VABVIA007\",\"id\":165}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(281, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 166, '[]', '{\"name\":\"Jarret d\'agneau\",\"code_article\":\"VABVIA008\",\"price_achat\":15,\"id_categorie\":8,\"id_subcategorie\":38,\"id_local\":2,\"id_rayon\":3,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2025-12-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ C \\/ VIANDES ABATS \\/ VIANDES \\/ VABVIA008\",\"id\":166}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(282, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 167, '[]', '{\"name\":\"steack de B\\u0153ufs\",\"code_article\":\"VABVIA009\",\"price_achat\":15,\"id_categorie\":8,\"id_subcategorie\":38,\"id_local\":2,\"id_rayon\":3,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-01-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ C \\/ VIANDES ABATS \\/ VIANDES \\/ VABVIA009\",\"id\":167}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(283, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 168, '[]', '{\"name\":\"rhumsteack\",\"code_article\":\"VABVIA010\",\"price_achat\":15,\"id_categorie\":8,\"id_subcategorie\":38,\"id_local\":2,\"id_rayon\":3,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-02-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ C \\/ VIANDES ABATS \\/ VIANDES \\/ VABVIA010\",\"id\":168}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(284, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 169, '[]', '{\"name\":\"entrecote\",\"code_article\":\"VABVIA011\",\"price_achat\":15,\"id_categorie\":8,\"id_subcategorie\":38,\"id_local\":2,\"id_rayon\":3,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-03-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ C \\/ VIANDES ABATS \\/ VIANDES \\/ VABVIA011\",\"id\":169}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(285, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 170, '[]', '{\"name\":\"Cervelles de Mouton\",\"code_article\":\"VABABA001\",\"price_achat\":15,\"id_categorie\":8,\"id_subcategorie\":39,\"id_local\":2,\"id_rayon\":3,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-04-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ C \\/ VIANDES ABATS \\/ ABATS \\/ VABABA001\",\"id\":170}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(286, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 171, '[]', '{\"name\":\"Foie de Veau\",\"code_article\":\"VABABA002\",\"price_achat\":15,\"id_categorie\":8,\"id_subcategorie\":39,\"id_local\":2,\"id_rayon\":3,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-05-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ C \\/ VIANDES ABATS \\/ ABATS \\/ VABABA002\",\"id\":171}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(287, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 172, '[]', '{\"name\":\"T\\u00eates de Moutons\",\"code_article\":\"VABABA003\",\"price_achat\":15,\"id_categorie\":8,\"id_subcategorie\":39,\"id_local\":2,\"id_rayon\":3,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-06-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ C \\/ VIANDES ABATS \\/ ABATS \\/ VABABA003\",\"id\":172}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(288, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 173, '[]', '{\"name\":\"Langues de Veau\",\"code_article\":\"VABABA004\",\"price_achat\":15,\"id_categorie\":8,\"id_subcategorie\":39,\"id_local\":2,\"id_rayon\":4,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-07-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ D \\/ VIANDES ABATS \\/ ABATS \\/ VABABA004\",\"id\":173}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(289, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 174, '[]', '{\"name\":\"Poulet des Abatoirs vid\\u00e9 plum\\u00e9 et sans jabot\",\"code_article\":\"VOEVOL001\",\"price_achat\":15,\"id_categorie\":9,\"id_subcategorie\":40,\"id_local\":2,\"id_rayon\":4,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-08-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ D \\/ VOLAILLES ET \\u0152UFS \\/ VOLAILLES \\/ VOEVOL001\",\"id\":174}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(290, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 175, '[]', '{\"name\":\"Poulet des Abatoirs beldit\",\"code_article\":\"VOEVOL002\",\"price_achat\":15,\"id_categorie\":9,\"id_subcategorie\":40,\"id_local\":2,\"id_rayon\":4,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-09-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ D \\/ VOLAILLES ET \\u0152UFS \\/ VOLAILLES \\/ VOEVOL002\",\"id\":175}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(291, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 176, '[]', '{\"name\":\"Blanc de Poulet\",\"code_article\":\"VOEVOL003\",\"price_achat\":15,\"id_categorie\":9,\"id_subcategorie\":40,\"id_local\":2,\"id_rayon\":4,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-10-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ D \\/ VOLAILLES ET \\u0152UFS \\/ VOLAILLES \\/ VOEVOL003\",\"id\":176}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(292, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 177, '[]', '{\"name\":\"Cuisse de Poulet\",\"code_article\":\"VOEVOL004\",\"price_achat\":15,\"id_categorie\":9,\"id_subcategorie\":40,\"id_local\":2,\"id_rayon\":4,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-11-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ D \\/ VOLAILLES ET \\u0152UFS \\/ VOLAILLES \\/ VOEVOL004\",\"id\":177}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(293, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 178, '[]', '{\"name\":\"Coquelets\",\"code_article\":\"VOEVOL005\",\"price_achat\":15,\"id_categorie\":9,\"id_subcategorie\":40,\"id_local\":2,\"id_rayon\":4,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-12-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ D \\/ VOLAILLES ET \\u0152UFS \\/ VOLAILLES \\/ VOEVOL005\",\"id\":178}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(294, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 179, '[]', '{\"name\":\"Pigeons\",\"code_article\":\"VOEVOL006\",\"price_achat\":15,\"id_categorie\":9,\"id_subcategorie\":40,\"id_local\":2,\"id_rayon\":4,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ D \\/ VOLAILLES ET \\u0152UFS \\/ VOLAILLES \\/ VOEVOL006\",\"id\":179}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(295, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 180, '[]', '{\"name\":\"Lapins\",\"code_article\":\"VOEVOL007\",\"price_achat\":15,\"id_categorie\":9,\"id_subcategorie\":40,\"id_local\":2,\"id_rayon\":4,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ D \\/ VOLAILLES ET \\u0152UFS \\/ VOLAILLES \\/ VOEVOL007\",\"id\":180}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(296, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 181, '[]', '{\"name\":\"FILET DE DINDE\",\"code_article\":\"VOEVOL008\",\"price_achat\":15,\"id_categorie\":9,\"id_subcategorie\":40,\"id_local\":2,\"id_rayon\":4,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ D \\/ VOLAILLES ET \\u0152UFS \\/ VOLAILLES \\/ VOEVOL008\",\"id\":181}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(297, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 182, '[]', '{\"name\":\"JAMBON DE DINDE FUME\",\"code_article\":\"VOEVOL009\",\"price_achat\":15,\"id_categorie\":9,\"id_subcategorie\":40,\"id_local\":2,\"id_rayon\":4,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-12 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE  NEGATIVE \\/ D \\/ VOLAILLES ET \\u0152UFS \\/ VOLAILLES \\/ VOEVOL009\",\"id\":182}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(298, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 183, '[]', '{\"name\":\"\\u0152ufs de 60 grs\",\"code_article\":\"VOEOEU001\",\"price_achat\":2,\"id_categorie\":9,\"id_subcategorie\":41,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ VOLAILLES ET \\u0152UFS \\/ \\u0152UFS \\/ VOEOEU001\",\"id\":183}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(299, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 184, '[]', '{\"name\":\"\\u0152ufs beldi de 60 grs\",\"code_article\":\"VOEOEU002\",\"price_achat\":3,\"id_categorie\":9,\"id_subcategorie\":41,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ VOLAILLES ET \\u0152UFS \\/ \\u0152UFS \\/ VOEOEU002\",\"id\":184}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(300, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 185, '[]', '{\"name\":\"\\u0152ufs de Caille\",\"code_article\":\"VOEOEU003\",\"price_achat\":6,\"id_categorie\":9,\"id_subcategorie\":41,\"id_local\":3,\"id_rayon\":8,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ D \\/ VOLAILLES ET \\u0152UFS \\/ \\u0152UFS \\/ VOEOEU003\",\"id\":185}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:31:48', '2025-11-23 09:31:48'),
(301, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 1, '[]', '{\"name\":\"G\\u00e2teau aux dattes\",\"type\":\"Dessert\",\"iduser\":1,\"id\":1}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(302, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 2, '[]', '{\"name\":\"Sabl\\u00e9e u confiture\",\"type\":\"Dessert\",\"iduser\":1,\"id\":2}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(303, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 3, '[]', '{\"name\":\"Feqqass\",\"type\":\"Dessert\",\"iduser\":1,\"id\":3}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(304, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 4, '[]', '{\"name\":\"Ghraiba\",\"type\":\"Dessert\",\"iduser\":1,\"id\":4}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(305, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 5, '[]', '{\"name\":\"M\'halbi\",\"type\":\"Dessert\",\"iduser\":1,\"id\":5}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(306, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 6, '[]', '{\"name\":\"Tajine d\\u2019agneau aux haricots vert\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":6}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(307, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 7, '[]', '{\"name\":\"Tajine de viande aux Cardons\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":7}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(308, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 8, '[]', '{\"name\":\"Tajine de viande aux choux Fleur\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":8}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(309, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 9, '[]', '{\"name\":\"Tajine de viande aux F\\u00e8ves\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":9}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(310, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 10, '[]', '{\"name\":\"Tajine de viande aux petit pois\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":10}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(311, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 11, '[]', '{\"name\":\"Tajine de viande aux pommes de terre et petit pois\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":11}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(312, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 12, '[]', '{\"name\":\"Tajine de viande au fenouil\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":12}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(313, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 13, '[]', '{\"name\":\"Tajine de viande Carotte et petit pois\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":13}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(314, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 14, '[]', '{\"name\":\"Coquelet Mbkher\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":14}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(315, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 15, '[]', '{\"name\":\"Poulet Messlala ( Viande)\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":15}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(316, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 16, '[]', '{\"name\":\"Poulet Messlala ( Poulet)\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":16}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(317, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 17, '[]', '{\"name\":\"Poulet Mbkher\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":17}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(318, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 18, '[]', '{\"name\":\"Poulet \\u00e0 la courge rouge au miel\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":18}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(319, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 19, '[]', '{\"name\":\"Poulet Mchermel\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":19}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(320, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 20, '[]', '{\"name\":\"Poulet Mkalli\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":20}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(321, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 21, '[]', '{\"name\":\"Poulet mhammer\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":21}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(322, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 22, '[]', '{\"name\":\"Tanjia\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":22}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(323, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 23, '[]', '{\"name\":\"Couscous aux L\\u00e9gumes Poulet\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":23}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(324, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 24, '[]', '{\"name\":\"Couscous aux L\\u00e9gumes Viande\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":24}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(325, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 25, '[]', '{\"name\":\"Mrouzia\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":25}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(326, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 26, '[]', '{\"name\":\"Couscous Tfaya Viande\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":26}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(327, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 27, '[]', '{\"name\":\"Couscous Tfaya Poulet\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":27}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(328, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 28, '[]', '{\"name\":\"Tajine de Poulet \\u00e0 la tomate aux miels\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":28}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(329, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 29, '[]', '{\"name\":\"Tajine Souiri\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":29}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(330, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 30, '[]', '{\"name\":\"Dalaa Mhamra\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":30}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(331, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 31, '[]', '{\"name\":\"Tajine Qadra touimia\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":31}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(332, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 32, '[]', '{\"name\":\"Tajine de f\\u00e8ve\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":32}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(333, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 33, '[]', '{\"name\":\"Tajine de Viande au pruneau \\/ abricot \\/ Ananas \\/ Poire \\/Datte\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":33}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(334, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 34, '[]', '{\"name\":\"Tajine de viande artichaut et petit pois\",\"type\":\"Plat Principal\",\"iduser\":1,\"id\":34}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(335, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 35, '[]', '{\"name\":\"Foie M\\u2019charmela\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":35}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(336, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 36, '[]', '{\"name\":\"Carotte R\\u00e2p\\u00e9\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":36}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(337, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 37, '[]', '{\"name\":\"Meselalla m\\u2019Charmel\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":37}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(338, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 38, '[]', '{\"name\":\"Orange \\u00e0 la cannelle\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":38}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(339, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 39, '[]', '{\"name\":\"Salade de trois Poivrons\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":39}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(340, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 40, '[]', '{\"name\":\"Pourpier\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":40}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(341, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 41, '[]', '{\"name\":\"Bakoula ou Mouve\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":41}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(342, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 42, '[]', '{\"name\":\"Cervelles m\\u2019charmela\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":42}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(343, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 43, '[]', '{\"name\":\"Aubergine Mraqad\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":43}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(344, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 44, '[]', '{\"name\":\"Salade de courgette \\u00e0 l\\u2019origan\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":44}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(345, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 45, '[]', '{\"name\":\"salade de tomate et poivrons grill\\u00e9es\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":45}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(346, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 46, '[]', '{\"name\":\"Salade de tomate et poivron maasline\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":46}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(347, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 47, '[]', '{\"name\":\"Seffa\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":47}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(348, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 48, '[]', '{\"name\":\"Pois chiche \\u00e0 la sauce jaune\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":48}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(349, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 49, '[]', '{\"name\":\"Haricot blanc en sauce\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":49}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(350, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 50, '[]', '{\"name\":\"Taalika(riz aux lait)\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":50}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(351, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 51, '[]', '{\"name\":\"soupe Langue d\\u2019oiseau\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":51}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(352, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 52, '[]', '{\"name\":\"Soupe de Mais au lait\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":52}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(353, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 53, '[]', '{\"name\":\"Soupe d\\u2019orge au lait\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":53}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(354, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 54, '[]', '{\"name\":\"BISSARA\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":54}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(355, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 55, '[]', '{\"name\":\"HERBBEL\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":55}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(356, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 56, '[]', '{\"name\":\"Soupe de l\\u2019anis\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":56}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(357, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 57, '[]', '{\"name\":\"Chorba\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":57}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(358, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 58, '[]', '{\"name\":\"Soupe de Mais \\u00e0 la tomate\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":58}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(359, 'App\\Models\\User', 1, 'created', 'App\\Models\\Plat', 59, '[]', '{\"name\":\"Harira\",\"type\":\"Entr\\u00e9e\",\"iduser\":1,\"id\":59}', 'https://skyblue-rat-607542.hostingersite.com/importPlat', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:32:23', '2025-11-23 09:32:23'),
(360, 'App\\Models\\User', 1, 'created', 'App\\Models\\Perte', 1, '[]', '{\"nature\":\"produit fini\",\"date_perte\":\"2025-11-17\",\"cause\":\"Cause\",\"circonstances\":\"Circonstances\",\"status\":\"En attente\",\"id_user\":1,\"reference\":\"PSAL001-112025\\/PF\",\"numero_serie\":1,\"id_category\":null,\"id_subcategorie\":null,\"classe\":null,\"id_product\":null,\"id_plat\":35,\"id_unite\":null,\"designation\":\"Foie M\\u2019charmela\",\"quantite\":0,\"produit_fini_type\":\"Entr\\u00e9e\",\"nombre_plats\":\"2\",\"cout_total\":277.8,\"n_inv\":null,\"id\":1}', 'https://skyblue-rat-607542.hostingersite.com/addPerte', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:36:08', '2025-11-23 09:36:08'),
(361, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Perte', 1, '{\"id\":1,\"id_product\":null,\"id_category\":null,\"id_subcategorie\":null,\"id_unite\":null,\"id_plat\":\"35\",\"classe\":null,\"designation\":\"Foie M\\u2019charmela\",\"quantite\":\"0.00\",\"nature\":\"produit fini\",\"date_perte\":\"2025-11-17\",\"cause\":\"Cause\",\"status\":\"En attente\",\"refusal_reason\":null,\"produit_fini_type\":\"Entr\\u00e9e\",\"nombre_plats\":2,\"cout_total\":\"277.80\",\"id_user\":1,\"circonstances\":\"Circonstances\",\"reference\":\"PSAL001-112025\\/PF\",\"numero_serie\":1,\"n_inv\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/deletePerte', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:36:37', '2025-11-23 09:36:37'),
(362, 'App\\Models\\User', 1, 'created', 'App\\Models\\Perte', 2, '[]', '{\"nature\":\"produit fini\",\"date_perte\":\"2025-11-21\",\"cause\":\"Cause\",\"circonstances\":\"Circonstances\",\"status\":\"En attente\",\"id_user\":1,\"reference\":\"PSAL002-112025\\/PF\",\"numero_serie\":2,\"id_category\":null,\"id_subcategorie\":null,\"classe\":null,\"id_product\":null,\"id_plat\":35,\"id_unite\":null,\"designation\":\"Foie M\\u2019charmela\",\"quantite\":0,\"produit_fini_type\":\"Entr\\u00e9e\",\"nombre_plats\":\"1\",\"cout_total\":138.9,\"n_inv\":null,\"id\":2}', 'https://skyblue-rat-607542.hostingersite.com/addPerte', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:38:26', '2025-11-23 09:38:26'),
(363, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Perte', 2, '{\"id\":2,\"id_product\":null,\"id_category\":null,\"id_subcategorie\":null,\"id_unite\":null,\"id_plat\":\"35\",\"classe\":null,\"designation\":\"Foie M\\u2019charmela\",\"quantite\":\"0.00\",\"nature\":\"produit fini\",\"date_perte\":\"2025-11-21\",\"cause\":\"Cause\",\"status\":\"En attente\",\"refusal_reason\":null,\"produit_fini_type\":\"Entr\\u00e9e\",\"nombre_plats\":1,\"cout_total\":\"138.90\",\"id_user\":1,\"circonstances\":\"Circonstances\",\"reference\":\"PSAL002-112025\\/PF\",\"numero_serie\":2,\"n_inv\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/deletePerte', '41.143.189.105', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 09:38:31', '2025-11-23 09:38:31'),
(364, 'App\\Models\\User', 1, 'created', 'App\\Models\\Perte', 3, '[]', '{\"nature\":\"produit fini\",\"date_perte\":\"2025-11-19\",\"cause\":\"Cause\",\"circonstances\":\"Circonstances\",\"status\":\"En attente\",\"id_user\":1,\"reference\":\"PSAL003-112025\\/PF\",\"numero_serie\":3,\"id_category\":null,\"id_subcategorie\":null,\"classe\":null,\"id_product\":null,\"id_plat\":35,\"id_unite\":null,\"designation\":\"Foie M\\u2019charmela\",\"quantite\":0,\"produit_fini_type\":\"Entr\\u00e9e\",\"nombre_plats\":\"2\",\"cout_total\":277.8,\"n_inv\":null,\"id\":3}', 'https://skyblue-rat-607542.hostingersite.com/addPerte', '160.179.163.198', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 19:53:07', '2025-11-23 19:53:07'),
(365, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Perte', 3, '{\"id\":3,\"id_product\":null,\"id_category\":null,\"id_subcategorie\":null,\"id_unite\":null,\"id_plat\":\"35\",\"classe\":null,\"designation\":\"Foie M\\u2019charmela\",\"quantite\":\"0.00\",\"nature\":\"produit fini\",\"date_perte\":\"2025-11-19\",\"cause\":\"Cause\",\"status\":\"En attente\",\"refusal_reason\":null,\"produit_fini_type\":\"Entr\\u00e9e\",\"nombre_plats\":2,\"cout_total\":\"277.80\",\"id_user\":1,\"circonstances\":\"Circonstances\",\"reference\":\"PSAL003-112025\\/PF\",\"numero_serie\":3,\"n_inv\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/deletePerte', '160.179.163.198', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-23 19:53:34', '2025-11-23 19:53:34'),
(366, 'App\\Models\\User', 1, 'created', 'App\\Models\\Perte', 4, '[]', '{\"nature\":\"stock\",\"date_perte\":\"2025-11-20\",\"cause\":\"Ras\",\"circonstances\":\"Ras\",\"status\":\"En attente\",\"id_user\":1,\"reference\":\"PSNAL001-112025\",\"numero_serie\":1,\"id_category\":\"4\",\"id_subcategorie\":\"19\",\"classe\":\"NON ALIMENTAIRE\",\"id_product\":5,\"id_unite\":6,\"designation\":\"Cardex Feuilles de Consommations FT 32*24,5 CM\",\"quantite\":\"3\",\"cout_total\":200.01,\"produit_fini_type\":null,\"id_plat\":null,\"nombre_plats\":null,\"n_inv\":\"Fghh\",\"id\":4}', 'https://skyblue-rat-607542.hostingersite.com/addPerte', '2a02:26f7:c304:4940:0:6000:0:b', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.1 Mobile/15E148 Safari/604.1', NULL, '2025-11-23 19:56:52', '2025-11-23 19:56:52'),
(367, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Perte', 4, '{\"status\":\"En attente\"}', '{\"status\":\"Valid\\u00e9\"}', 'https://skyblue-rat-607542.hostingersite.com/changeStatusPerte', '2a02:26f7:c304:4940:0:6000:0:b', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.1 Mobile/15E148 Safari/604.1', NULL, '2025-11-23 19:57:36', '2025-11-23 19:57:36'),
(368, 'App\\Models\\User', 1, 'created', 'App\\Models\\Perte', 5, '[]', '{\"nature\":\"produit fini\",\"date_perte\":\"2025-11-21\",\"cause\":\"Ras\",\"circonstances\":\"Ras\",\"status\":\"En attente\",\"id_user\":1,\"reference\":\"PSAL004-112025\\/PF\",\"numero_serie\":4,\"id_category\":null,\"id_subcategorie\":null,\"classe\":null,\"id_product\":null,\"id_plat\":57,\"id_unite\":null,\"designation\":\"Chorba\",\"quantite\":0,\"produit_fini_type\":\"Entr\\u00e9e\",\"nombre_plats\":\"1\",\"cout_total\":15.15,\"n_inv\":null,\"id\":5}', 'https://skyblue-rat-607542.hostingersite.com/addPerte', '2a09:bac2:482d:37d::59:3a', 'Mozilla/5.0 (iPhone; CPU iPhone OS 18_7 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/26.1 Mobile/15E148 Safari/604.1', NULL, '2025-11-23 19:59:42', '2025-11-23 19:59:42'),
(369, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 33, '{\"id\":33,\"matricule\":null,\"nom\":\"Tromp\",\"prenom\":\"Graham\",\"email\":\"dario70@example.net\",\"email_verified_at\":\"2025-11-23 09:27:57\",\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:16:03', '2025-11-24 07:16:03'),
(370, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 32, '{\"id\":32,\"matricule\":null,\"nom\":\"Kshlerin\",\"prenom\":\"Nedra\",\"email\":\"fritsch.vidal@example.org\",\"email_verified_at\":\"2025-11-23 09:27:57\",\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:16:06', '2025-11-24 07:16:06'),
(371, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 31, '{\"id\":31,\"matricule\":null,\"nom\":\"Predovic\",\"prenom\":\"Jamil\",\"email\":\"xnicolas@example.net\",\"email_verified_at\":\"2025-11-23 09:27:57\",\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:16:09', '2025-11-24 07:16:09'),
(372, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 30, '{\"id\":30,\"matricule\":null,\"nom\":\"Quigley\",\"prenom\":\"Lorenzo\",\"email\":\"marisol.torphy@example.com\",\"email_verified_at\":\"2025-11-23 09:27:57\",\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:16:12', '2025-11-24 07:16:12'),
(373, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 29, '{\"id\":29,\"matricule\":null,\"nom\":\"Goldner\",\"prenom\":\"Liza\",\"email\":\"hblick@example.net\",\"email_verified_at\":\"2025-11-23 09:27:57\",\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:16:15', '2025-11-24 07:16:15'),
(374, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 2, '{\"telephone\":null,\"fonction\":null}', '{\"telephone\":\"0615293801\",\"fonction\":\"Econome\"}', 'https://skyblue-rat-607542.hostingersite.com/updateUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:18:55', '2025-11-24 07:18:55'),
(375, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 3, '{\"telephone\":null,\"fonction\":null}', '{\"telephone\":\"0666747039\",\"fonction\":\"Directeur des \\u00e9tudes\"}', 'https://skyblue-rat-607542.hostingersite.com/updateUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:20:49', '2025-11-24 07:20:49'),
(376, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 5, '{\"telephone\":null,\"fonction\":null}', '{\"telephone\":\"0666494924\",\"fonction\":\"Charg\\u00e9e des stages\"}', 'https://skyblue-rat-607542.hostingersite.com/updateUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:22:29', '2025-11-24 07:22:29'),
(377, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 16, '{\"telephone\":null,\"fonction\":null}', '{\"telephone\":\"0654572527\",\"fonction\":\"Formatrice\"}', 'https://skyblue-rat-607542.hostingersite.com/updateUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:24:13', '2025-11-24 07:24:13'),
(378, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 17, '{\"telephone\":null,\"fonction\":null}', '{\"telephone\":\"0666494935\",\"fonction\":\"Formatrice\"}', 'https://skyblue-rat-607542.hostingersite.com/updateUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:26:59', '2025-11-24 07:26:59'),
(379, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 18, '{\"telephone\":null,\"fonction\":null}', '{\"telephone\":\"0621709391\",\"fonction\":\"Formatrice\"}', 'https://skyblue-rat-607542.hostingersite.com/updateUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:29:33', '2025-11-24 07:29:33'),
(380, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 22, '{\"telephone\":null,\"fonction\":null}', '{\"telephone\":\"0644884399\",\"fonction\":\"Formateur\"}', 'https://skyblue-rat-607542.hostingersite.com/updateUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:31:23', '2025-11-24 07:31:23'),
(381, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 19, '{\"telephone\":null,\"fonction\":null}', '{\"telephone\":\"0679945529\",\"fonction\":\"Formatrice\"}', 'https://skyblue-rat-607542.hostingersite.com/updateUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:35:34', '2025-11-24 07:35:34'),
(382, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 21, '{\"telephone\":null,\"fonction\":null}', '{\"telephone\":\"0606815893\",\"fonction\":\"Formateur\"}', 'https://skyblue-rat-607542.hostingersite.com/updateUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:37:44', '2025-11-24 07:37:44'),
(383, 'App\\Models\\User', 1, 'created', 'App\\Models\\User', 34, '[]', '{\"matricule\":null,\"nom\":\"BELLAMLIH\",\"prenom\":\"ABDELAZIZ\",\"email\":\"abdelaziz.bellemlih@outlook.com\",\"telephone\":\"0661461671\",\"fonction\":\"Formateur\",\"service\":null,\"id\":34}', 'https://skyblue-rat-607542.hostingersite.com/users', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:40:01', '2025-11-24 07:40:01'),
(384, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 20, '{\"telephone\":null,\"fonction\":null}', '{\"telephone\":\"0666494975\",\"fonction\":\"Formatrice\"}', 'https://skyblue-rat-607542.hostingersite.com/updateUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:41:30', '2025-11-24 07:41:30'),
(385, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 6, '{\"telephone\":null,\"fonction\":null}', '{\"telephone\":\"0666494963\",\"fonction\":\"chrag\\u00e9e d\'inventaire\"}', 'https://skyblue-rat-607542.hostingersite.com/updateUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:43:22', '2025-11-24 07:43:22'),
(386, 'App\\Models\\User', 1, 'created', 'App\\Models\\User', 35, '[]', '{\"matricule\":null,\"nom\":\"MAHAN\",\"prenom\":\"MHAMMED ANAS\",\"email\":\"anasmahan14@gmail.com\",\"telephone\":\"0627070725\",\"fonction\":\"Agent de saisie\",\"service\":null,\"id\":35}', 'https://skyblue-rat-607542.hostingersite.com/users', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:46:01', '2025-11-24 07:46:01'),
(387, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 10, '{\"telephone\":null,\"fonction\":null}', '{\"telephone\":\"0681436602\",\"fonction\":\"Magasinier\"}', 'https://skyblue-rat-607542.hostingersite.com/updateUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:47:31', '2025-11-24 07:47:31'),
(388, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 8, '{\"telephone\":null,\"fonction\":null}', '{\"telephone\":\"0625034484\",\"fonction\":\"responsable Biblioth\\u00e8que\"}', 'https://skyblue-rat-607542.hostingersite.com/updateUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:49:09', '2025-11-24 07:49:09'),
(389, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 28, '{\"id\":28,\"matricule\":null,\"nom\":\"DRIOUCH\",\"prenom\":\"Hassan\",\"email\":\"hdriouch@tourisme.gov.ma\",\"email_verified_at\":null,\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:49:31', '2025-11-24 07:49:31'),
(390, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 27, '{\"id\":27,\"matricule\":null,\"nom\":\"OUMADDOUCH\",\"prenom\":\"El Houssaine\",\"email\":\"eoumaddouch@tourisme.gov.ma\",\"email_verified_at\":null,\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:49:35', '2025-11-24 07:49:35'),
(391, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 26, '{\"id\":26,\"matricule\":null,\"nom\":\"ABADA\",\"prenom\":\"Hajar\",\"email\":\"habada@tourisme.gov.ma\",\"email_verified_at\":null,\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:49:39', '2025-11-24 07:49:39'),
(392, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 25, '{\"id\":25,\"matricule\":null,\"nom\":\"MOUFKI\",\"prenom\":\"Sara\",\"email\":\"smoufki@tourisme.gov.ma\",\"email_verified_at\":null,\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:49:44', '2025-11-24 07:49:44'),
(393, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 24, '{\"id\":24,\"matricule\":null,\"nom\":\"FOUGNAR\",\"prenom\":\"Zineb\",\"email\":\"zfougnar@tourisme.gov.ma\",\"email_verified_at\":null,\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:49:52', '2025-11-24 07:49:52'),
(394, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 23, '{\"id\":23,\"matricule\":null,\"nom\":\"EL AZMI\",\"prenom\":\"Fatima\",\"email\":\"felazmi@tourisme.gov.ma\",\"email_verified_at\":null,\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:50:11', '2025-11-24 07:50:11'),
(395, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 15, '{\"id\":15,\"matricule\":null,\"nom\":\"OUAOQA\",\"prenom\":\"Malika\",\"email\":\"mouaoqa@tourisme.gov.ma\",\"email_verified_at\":null,\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:50:20', '2025-11-24 07:50:20'),
(396, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 14, '{\"id\":14,\"matricule\":null,\"nom\":\"BELBACHA\",\"prenom\":\"Amina\",\"email\":\"abelbacha@tourisme.gov.ma\",\"email_verified_at\":null,\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:50:34', '2025-11-24 07:50:34'),
(397, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 13, '{\"id\":13,\"matricule\":null,\"nom\":\"JID\",\"prenom\":\"Hicham\",\"email\":\"hjid@tourisme.gov.ma\",\"email_verified_at\":null,\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:50:41', '2025-11-24 07:50:41'),
(398, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 12, '{\"id\":12,\"matricule\":null,\"nom\":\"AIT BELLA\",\"prenom\":\"Mohammed\",\"email\":\"maitbella@tourisme.gov.ma\",\"email_verified_at\":null,\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:50:49', '2025-11-24 07:50:49'),
(399, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 11, '{\"id\":11,\"matricule\":null,\"nom\":\"JADDOUR\",\"prenom\":\"Hassan\",\"email\":\"hjaddour@tourisme.gov.ma\",\"email_verified_at\":null,\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:50:57', '2025-11-24 07:50:57'),
(400, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 4, '{\"id\":4,\"matricule\":null,\"nom\":\"SAIED\",\"prenom\":\"Leila\",\"email\":\"leilasajed17@gmail.com\",\"email_verified_at\":null,\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:51:09', '2025-11-24 07:51:09'),
(401, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 7, '{\"id\":7,\"matricule\":null,\"nom\":\"ATTI\",\"prenom\":\"Sellamia\",\"email\":\"satti@tourisme.gov.ma\",\"email_verified_at\":null,\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:51:21', '2025-11-24 07:51:21'),
(402, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 1, '{\"telephone\":null,\"fonction\":null}', '{\"telephone\":\"0673084048\",\"fonction\":\"Directrice de l\'ISTAHT Touarga\"}', 'https://skyblue-rat-607542.hostingersite.com/updateUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:52:13', '2025-11-24 07:52:13'),
(403, 'App\\Models\\User', 1, 'updated', 'App\\Models\\User', 1, '{\"fonction\":\"Directrice de l\'ISTAHT Touarga\"}', '{\"fonction\":\"Directrice de l&#039;ISTAHT Touarga\"}', 'https://skyblue-rat-607542.hostingersite.com/updateUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:53:59', '2025-11-24 07:53:59'),
(404, 'App\\Models\\User', 10, 'updated', 'App\\Models\\Perte', 4, '{\"status\":\"Valid\\u00e9\"}', '{\"status\":\"Visa Magasinier\"}', 'https://skyblue-rat-607542.hostingersite.com/changeStatusPerte', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:55:03', '2025-11-24 07:55:03'),
(405, 'App\\Models\\User', 10, 'deleted', 'App\\Models\\Perte', 5, '{\"id\":5,\"id_product\":null,\"id_category\":null,\"id_subcategorie\":null,\"id_unite\":null,\"id_plat\":\"57\",\"classe\":null,\"designation\":\"Chorba\",\"quantite\":\"0.00\",\"nature\":\"produit fini\",\"date_perte\":\"2025-11-21\",\"cause\":\"Ras\",\"status\":\"En attente\",\"refusal_reason\":null,\"produit_fini_type\":\"Entr\\u00e9e\",\"nombre_plats\":1,\"cout_total\":\"15.15\",\"id_user\":1,\"circonstances\":\"Ras\",\"reference\":\"PSAL004-112025\\/PF\",\"numero_serie\":4,\"n_inv\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/deletePerte', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:55:50', '2025-11-24 07:55:50'),
(406, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Perte', 4, '{\"status\":\"Visa Magasinier\"}', '{\"status\":\"Annuler\"}', 'https://skyblue-rat-607542.hostingersite.com/changeStatusPerte', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:57:59', '2025-11-24 07:57:59'),
(407, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Perte', 4, '{\"id\":4,\"id_product\":5,\"id_category\":4,\"id_subcategorie\":19,\"id_unite\":6,\"id_plat\":null,\"classe\":\"NON ALIMENTAIRE\",\"designation\":\"Cardex Feuilles de Consommations FT 32*24,5 CM\",\"quantite\":\"3.00\",\"nature\":\"stock\",\"date_perte\":\"2025-11-20\",\"cause\":\"Ras\",\"status\":\"Annuler\",\"refusal_reason\":null,\"produit_fini_type\":null,\"nombre_plats\":null,\"cout_total\":\"200.01\",\"id_user\":1,\"circonstances\":\"Ras\",\"reference\":\"PSNAL001-112025\",\"numero_serie\":1,\"n_inv\":\"Fghh\"}', '[]', 'https://skyblue-rat-607542.hostingersite.com/deletePerte', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 07:58:07', '2025-11-24 07:58:07'),
(408, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\User', 9, '{\"id\":9,\"matricule\":null,\"nom\":\"AFRI\",\"prenom\":\"Fatima\",\"email\":\"fafri@tourisme.gov.ma\",\"email_verified_at\":null,\"telephone\":null,\"fonction\":null,\"service\":null,\"signature\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteUser', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:01:34', '2025-11-24 08:01:34'),
(409, 'App\\Models\\User', 34, 'created', 'App\\Models\\Vente', 1, '[]', '{\"numero_serie\":\"1\",\"total\":258.12,\"status\":\"Cr\\u00e9ation\",\"type_commande\":\"Alimentaire\",\"type_menu\":\"Menu eleves\",\"id_formateur\":\"34\",\"id_user\":34,\"eleves\":\"18\",\"personnel\":\"0\",\"invites\":\"0\",\"divers\":\"0\",\"entree\":\"35\",\"plat_principal\":\"6\",\"accompagnement\":null,\"dessert\":\"1\",\"date_usage\":\"2025-11-28 00:00:00\",\"id\":1}', 'https://skyblue-rat-607542.hostingersite.com/StoreVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:06:14', '2025-11-24 08:06:14'),
(410, 'App\\Models\\User', 3, 'updated', 'App\\Models\\Vente', 1, '{\"status\":\"Cr\\u00e9ation\"}', '{\"status\":\"Visa Directeur\"}', 'https://skyblue-rat-607542.hostingersite.com/UpdateVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:08:08', '2025-11-24 08:08:08'),
(411, 'App\\Models\\User', 2, 'updated', 'App\\Models\\Vente', 1, '{\"status\":\"Visa Directeur\"}', '{\"status\":\"Visa \\u00c9conome\"}', 'https://skyblue-rat-607542.hostingersite.com/UpdateVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:09:01', '2025-11-24 08:09:01'),
(412, 'App\\Models\\User', 10, 'updated', 'App\\Models\\Vente', 1, '{\"status\":\"Visa \\u00c9conome\"}', '{\"status\":\"Livraison\"}', 'https://skyblue-rat-607542.hostingersite.com/UpdateVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:10:08', '2025-11-24 08:10:08'),
(413, 'App\\Models\\User', 34, 'updated', 'App\\Models\\Vente', 1, '{\"status\":\"Livraison\"}', '{\"status\":\"Validation\"}', 'https://skyblue-rat-607542.hostingersite.com/ChangeStatusVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:11:45', '2025-11-24 08:11:45'),
(414, 'App\\Models\\User', 34, 'created', 'App\\Models\\Vente', 2, '[]', '{\"numero_serie\":\"2\",\"total\":26.4,\"status\":\"Cr\\u00e9ation\",\"type_commande\":\"Alimentaire\",\"type_menu\":\"Menu specials\",\"id_formateur\":\"34\",\"id_user\":34,\"eleves\":\"20\",\"personnel\":\"0\",\"invites\":\"0\",\"divers\":\"0\",\"entree\":\"37\",\"plat_principal\":\"8\",\"accompagnement\":null,\"dessert\":\"4,3\",\"date_usage\":\"2025-11-29 00:00:00\",\"id\":2}', 'https://skyblue-rat-607542.hostingersite.com/StoreVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:13:23', '2025-11-24 08:13:23'),
(415, 'App\\Models\\User', 3, 'updated', 'App\\Models\\Vente', 2, '{\"status\":\"Cr\\u00e9ation\"}', '{\"status\":\"Visa Directeur\"}', 'https://skyblue-rat-607542.hostingersite.com/UpdateVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:14:06', '2025-11-24 08:14:06'),
(416, 'App\\Models\\User', 2, 'updated', 'App\\Models\\Vente', 2, '{\"status\":\"Visa Directeur\"}', '{\"status\":\"Visa \\u00c9conome\"}', 'https://skyblue-rat-607542.hostingersite.com/UpdateVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:14:35', '2025-11-24 08:14:35'),
(417, 'App\\Models\\User', 1, 'updated', 'App\\Models\\Vente', 2, '{\"status\":\"Visa \\u00c9conome\"}', '{\"status\":\"R\\u00e9ception\"}', 'https://skyblue-rat-607542.hostingersite.com/UpdateVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:16:00', '2025-11-24 08:16:00'),
(418, 'App\\Models\\User', 2, 'updated', 'App\\Models\\Vente', 2, '{\"status\":\"R\\u00e9ception\"}', '{\"status\":\"Vis\\u00e9\"}', 'https://skyblue-rat-607542.hostingersite.com/ChangeStatusVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:17:33', '2025-11-24 08:17:33'),
(419, 'App\\Models\\User', 10, 'updated', 'App\\Models\\Vente', 2, '{\"status\":\"Vis\\u00e9\"}', '{\"status\":\"Livraison\"}', 'https://skyblue-rat-607542.hostingersite.com/UpdateVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:18:07', '2025-11-24 08:18:07'),
(420, 'App\\Models\\User', 34, 'updated', 'App\\Models\\Vente', 2, '{\"status\":\"Livraison\"}', '{\"status\":\"Validation\"}', 'https://skyblue-rat-607542.hostingersite.com/ChangeStatusVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:19:02', '2025-11-24 08:19:02'),
(421, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 186, '[]', '{\"name\":\"Arrache Agrafe ORD\",\"code_article\":\"FOUSCO001\",\"price_achat\":3.75,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":30,\"seuil\":3.75,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-05-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ A1 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO001\",\"id\":186}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(422, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 187, '[]', '{\"name\":\"Blanco Fluide de 20 ml\",\"code_article\":\"FOUSCO002\",\"price_achat\":11.25,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":30,\"seuil\":11.25,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-06-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ A1 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO002\",\"id\":187}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(423, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 188, '[]', '{\"name\":\"Brosses pour Tableaux Magn\\u00e9tique\",\"code_article\":\"FOUSCO004\",\"price_achat\":6,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":30,\"seuil\":6,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-08-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ A1 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO004\",\"id\":188}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(424, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 189, '[]', '{\"name\":\"Blister de 06 Aimants Magn\\u00e9tiques\",\"code_article\":\"FOUSCO005\",\"price_achat\":5,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":30,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-09-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ A1 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO005\",\"id\":189}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(425, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 190, '[]', '{\"name\":\"Calculatrices Casio 220 12 Chiffres 1er Choix\",\"code_article\":\"FOUSCO006\",\"price_achat\":80,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":30,\"seuil\":80,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-10-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ A1 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO006\",\"id\":190}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(426, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 191, '[]', '{\"name\":\"Cahiers de 192 Pages\",\"code_article\":\"FOUSCO007\",\"price_achat\":10.34,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":30,\"seuil\":10.34,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-11-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ A1 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO007\",\"id\":191}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(427, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 192, '[]', '{\"name\":\"Cahiers de 288 Pages FT 21*29,7\",\"code_article\":\"FOUSCO008\",\"price_achat\":15,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":31,\"seuil\":15,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-12-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ A2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO008\",\"id\":192}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(428, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 193, '[]', '{\"name\":\"Cahiers Spiral Plastifi\\u00e9es de 140 Pages\",\"code_article\":\"FOUSCO009\",\"price_achat\":10.58,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":31,\"seuil\":10.58,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ A2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO009\",\"id\":193}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(429, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 194, '[]', '{\"name\":\"Cahiers Palmier de 96 Pages\",\"code_article\":\"FOUSCO010\",\"price_achat\":8,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":31,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ A2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO010\",\"id\":194}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(430, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 195, '[]', '{\"name\":\"Crayon Noirs\",\"code_article\":\"FOUSCO011\",\"price_achat\":0.3,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":31,\"seuil\":0.3,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ A2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO011\",\"id\":195}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(431, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 196, '[]', '{\"name\":\"Crayon Noirs Fabre Castel\",\"code_article\":\"FOUSCO014\",\"price_achat\":1,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":31,\"seuil\":1,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ A2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO014\",\"id\":196}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(432, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 197, '[]', '{\"name\":\"Craie Blanche de 10 pi\\u00e8ces\",\"code_article\":\"FOUSCO015\",\"price_achat\":3,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":31,\"seuil\":3,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ A2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO015\",\"id\":197}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(433, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 198, '[]', '{\"name\":\"Coins de Lettres de 50 Pi\\u00e9ces\",\"code_article\":\"FOUSCO016\",\"price_achat\":8.33,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":31,\"seuil\":8.33,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-08-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ A2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO016\",\"id\":198}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(434, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 199, '[]', '{\"name\":\"Classeurs \\u00e0 Levier GF Chrono en Plastique\",\"code_article\":\"FOUSCO018\",\"price_achat\":17,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":32,\"seuil\":17,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-10-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B1 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO018\",\"id\":199}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(435, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 200, '[]', '{\"name\":\"Classeurs Scolaire GF \\u00e0 04 Anneaux\",\"code_article\":\"FOUSCO019\",\"price_achat\":18,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":32,\"seuil\":18,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-11-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B1 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO019\",\"id\":200}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(436, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 201, '[]', '{\"name\":\"Colle Uhu N\\u00b012\",\"code_article\":\"FOUSCO020\",\"price_achat\":6,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":32,\"seuil\":6,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-12-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B1 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO020\",\"id\":201}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(437, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 202, '[]', '{\"name\":\"Chemises Cartonn\\u00e9es\",\"code_article\":\"FOUSCO021\",\"price_achat\":0.48,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":32,\"seuil\":0.48,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-01-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B1 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO021\",\"id\":202}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(438, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 203, '[]', '{\"name\":\"Chemises \\u00e0 Rabat Elastique\",\"code_article\":\"FOUSCO022\",\"price_achat\":6.5,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":32,\"seuil\":6.5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-02-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B1 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO022\",\"id\":203}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(439, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 204, '[]', '{\"name\":\"Encre \\u00e0 Tampon B\\/R\\/N ORD\",\"code_article\":\"FOUSCO024\",\"price_achat\":6.13,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":32,\"seuil\":6.13,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-04-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B1 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO024\",\"id\":204}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(440, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 205, '[]', '{\"name\":\"Enceurs Tampon Bleu\",\"code_article\":\"FOUSCO025\",\"price_achat\":13,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":32,\"seuil\":13,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-05-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B1 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO025\",\"id\":205}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(441, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 206, '[]', '{\"name\":\"Gomme Blanche\",\"code_article\":\"FOUSCO026\",\"price_achat\":3,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":33,\"seuil\":3,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-06-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO026\",\"id\":206}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(442, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 207, '[]', '{\"name\":\"Marqueurs Permanent\",\"code_article\":\"FOUSCO027\",\"price_achat\":6,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":33,\"seuil\":6,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-01-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO027\",\"id\":207}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(443, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 208, '[]', '{\"name\":\"Marqueurs Fluorescent\",\"code_article\":\"FOUSCO028\",\"price_achat\":6,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":33,\"seuil\":6,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-02-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO028\",\"id\":208}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(444, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 209, '[]', '{\"name\":\"Punaises de Signalisations de 25 pi\\u00e9ces\",\"code_article\":\"FOUSCO029\",\"price_achat\":25,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":33,\"seuil\":25,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-03-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO029\",\"id\":209}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(445, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 210, '[]', '{\"name\":\"Punaises de 100 pi\\u00e9ces\",\"code_article\":\"FOUSCO030\",\"price_achat\":5.01,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":33,\"seuil\":5.01,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-04-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO030\",\"id\":210}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(446, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 211, '[]', '{\"name\":\"Paire de Ciseaux\",\"code_article\":\"FOUSCO033\",\"price_achat\":19.5,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":33,\"seuil\":19.5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-07-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO033\",\"id\":211}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(447, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 212, '[]', '{\"name\":\"Registres de 02 Mains\",\"code_article\":\"FOUSCO034\",\"price_achat\":21.01,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":33,\"seuil\":21.01,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-08-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO034\",\"id\":212}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(448, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 213, '[]', '{\"name\":\"Registres de 05 Mains\",\"code_article\":\"FOUSCO037\",\"price_achat\":24,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":33,\"seuil\":24,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-11-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO037\",\"id\":213}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(449, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 214, '[]', '{\"name\":\"Recharges Agrafe 8\\/4\",\"code_article\":\"FOUSCO038\",\"price_achat\":2,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":33,\"seuil\":2,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-12-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO038\",\"id\":214}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(450, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 215, '[]', '{\"name\":\"Recharges Agrafe 24\\/6\",\"code_article\":\"FOUSCO039\",\"price_achat\":2.6,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":33,\"seuil\":2.6,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B2 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO039\",\"id\":215}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(451, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 216, '[]', '{\"name\":\"Rouleaux de Scotch PF FT 19*33\",\"code_article\":\"FOUSCO040\",\"price_achat\":2,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":2,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO040\",\"id\":216}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(452, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 217, '[]', '{\"name\":\"Rouleaux de Scotch GF\",\"code_article\":\"FOUSCO041\",\"price_achat\":28.92,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":28.92,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO041\",\"id\":217}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(453, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 218, '[]', '{\"name\":\"R\\u00e9gles m\\u00e9tallique de 60 cm\",\"code_article\":\"FOUSCO042\",\"price_achat\":145.83,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":145.83,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO042\",\"id\":218}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(454, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 219, '[]', '{\"name\":\"R\\u00e9gles m\\u00e9tallique de 01 m\\u00e9tre\",\"code_article\":\"FOUSCO043\",\"price_achat\":180,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":180,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO043\",\"id\":219}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(455, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 220, '[]', '{\"name\":\"R\\u00e9gles Plate de 20 cm\",\"code_article\":\"FOUSCO044\",\"price_achat\":3.99,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":3.99,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO044\",\"id\":220}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(456, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 221, '[]', '{\"name\":\"R\\u00e9gles Plate de 30 cm\",\"code_article\":\"FOUSCO045\",\"price_achat\":4.16,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":4.16,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO045\",\"id\":221}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(457, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 222, '[]', '{\"name\":\"R\\u00e9gles Plate de 40 cm\",\"code_article\":\"FOUSCO046\",\"price_achat\":5,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-08-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO046\",\"id\":222}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(458, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 223, '[]', '{\"name\":\"Stylos pour Tableaux Magn\\u00e9tique\",\"code_article\":\"FOUSCO047\",\"price_achat\":10.4,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":10.4,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-09-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO047\",\"id\":223}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(459, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 224, '[]', '{\"name\":\"Stylos Feutre Pointe Fine\",\"code_article\":\"FOUSCO049\",\"price_achat\":13.33,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":13.33,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-11-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO049\",\"id\":224}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(460, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 225, '[]', '{\"name\":\"Stylos Pilote G2\",\"code_article\":\"FOUSCO050\",\"price_achat\":15,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":15,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-12-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO050\",\"id\":225}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(461, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 226, '[]', '{\"name\":\"Stylos Pilote G3\",\"code_article\":\"FOUSCO051\",\"price_achat\":10,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-01-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO051\",\"id\":226}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(462, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 227, '[]', '{\"name\":\"Stylos Blanco P\\u00e9likan 07 ml\",\"code_article\":\"FOUSCO052\",\"price_achat\":10,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-02-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO052\",\"id\":227}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(463, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 228, '[]', '{\"name\":\"Stylos Schneider Jaune\",\"code_article\":\"FOUSCO053\",\"price_achat\":1.58,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":1.58,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-03-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO053\",\"id\":228}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(464, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 229, '[]', '{\"name\":\"Stylos \\u00e0 Bille Schneider\",\"code_article\":\"FOUSCO054\",\"price_achat\":1.25,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":1.25,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-04-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO054\",\"id\":229}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(465, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 230, '[]', '{\"name\":\"Scotchs Magic\",\"code_article\":\"FOUSCO055\",\"price_achat\":11,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":11,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-05-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO055\",\"id\":230}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(466, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 231, '[]', '{\"name\":\"Scotchs Havane Transparent FT 50*50\",\"code_article\":\"FOUSCO056\",\"price_achat\":6.09,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":6.09,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-06-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO056\",\"id\":231}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(467, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 232, '[]', '{\"name\":\"Trombones Square N\\u00b0625\",\"code_article\":\"FOUSCO057\",\"price_achat\":5,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-07-05 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO057\",\"id\":232}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(468, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 233, '[]', '{\"name\":\"Trombones Plastifi\\u00e9es de 100 pi\\u00e9ces\",\"code_article\":\"FOUSCO058\",\"price_achat\":3,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":3,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-01-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO058\",\"id\":233}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(469, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 234, '[]', '{\"name\":\"Tailles Crayon Double Usage\",\"code_article\":\"FOUSCO059\",\"price_achat\":4,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":4,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-02-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO059\",\"id\":234}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(470, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 235, '[]', '{\"name\":\"Uhu stick de 21 grs\",\"code_article\":\"FOUSCO060\",\"price_achat\":12,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":12,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-03-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO060\",\"id\":235}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(471, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 236, '[]', '{\"name\":\"D\\u00e9vidoires Scotch MM\",\"code_article\":\"FOUSCO061\",\"price_achat\":19,\"id_categorie\":4,\"id_subcategorie\":15,\"id_local\":1,\"id_rayon\":34,\"seuil\":19,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-04-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE SCOLAIRE \\/ B3 \\/ FOURNITURE \\/ SCOLAIRE \\/ FOUSCO061\",\"id\":236}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(472, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 237, '[]', '{\"name\":\"Agrafeuses Primula 8\\/4\",\"code_article\":\"FOUBUR001\",\"price_achat\":50,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":22,\"seuil\":50,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-05-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ A1 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR001\",\"id\":237}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(473, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 238, '[]', '{\"name\":\"Agrafeuses GF 24\\/6\",\"code_article\":\"FOUBUR002\",\"price_achat\":70,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":22,\"seuil\":70,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-06-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ A1 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR002\",\"id\":238}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(474, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 239, '[]', '{\"name\":\"Agrafeuses Pistolet KW Tria R\\u00e9f: 8513\",\"code_article\":\"FOUBUR003\",\"price_achat\":150,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":22,\"seuil\":150,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-07-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ A1 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR003\",\"id\":239}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(475, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 240, '[]', '{\"name\":\"Album Carte Visite de 288 Cartes\",\"code_article\":\"FOUBUR004\",\"price_achat\":46,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":22,\"seuil\":46,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-08-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ A1 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR004\",\"id\":240}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(476, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 241, '[]', '{\"name\":\"Boite D\'archive en Plastique de 08 cm\",\"code_article\":\"FOUBUR005\",\"price_achat\":13,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":22,\"seuil\":13,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-09-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ A1 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR005\",\"id\":241}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(477, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 242, '[]', '{\"name\":\"Boite D\'archive en Carton PM 85 MM\",\"code_article\":\"FOUBUR006\",\"price_achat\":5.42,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":22,\"seuil\":5.42,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-10-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ A1 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR006\",\"id\":242}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(478, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 243, '[]', '{\"name\":\"Boite D\'attache G\\u00e9ante GM\",\"code_article\":\"FOUBUR007\",\"price_achat\":10,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":22,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-11-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ A1 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR007\",\"id\":243}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(479, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 244, '[]', '{\"name\":\"Boite Plein Simili de 12 cm\",\"code_article\":\"FOUBUR008\",\"price_achat\":54.2,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":23,\"seuil\":54.2,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-12-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ A2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR008\",\"id\":244}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(480, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 245, '[]', '{\"name\":\"Bloc Note FT A5\",\"code_article\":\"FOUBUR011\",\"price_achat\":4,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":23,\"seuil\":4,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ A2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR011\",\"id\":245}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(481, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 246, '[]', '{\"name\":\"Carnets Bloc Note GF FT A4\",\"code_article\":\"FOUBUR012\",\"price_achat\":7.92,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":23,\"seuil\":7.92,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ A2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR012\",\"id\":246}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(482, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 247, '[]', '{\"name\":\"Carnets Bloc Note GF FT A5\",\"code_article\":\"FOUBUR013\",\"price_achat\":7,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":23,\"seuil\":7,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ A2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR013\",\"id\":247}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(483, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 248, '[]', '{\"name\":\"Chemises en Plastique Perfor\\u00e9es\",\"code_article\":\"FOUBUR014\",\"price_achat\":1.08,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":23,\"seuil\":1.08,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ A2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR014\",\"id\":248}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(484, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 249, '[]', '{\"name\":\"Chemises \\u00e0 lamelles\",\"code_article\":\"FOUBUR016\",\"price_achat\":10.83,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":23,\"seuil\":10.83,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-08-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ A2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR016\",\"id\":249}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(485, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 250, '[]', '{\"name\":\"Chemises Clipsy\",\"code_article\":\"FOUBUR017\",\"price_achat\":11.25,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":23,\"seuil\":11.25,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-09-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ A2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR017\",\"id\":250}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(486, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 251, '[]', '{\"name\":\"Corbeilles \\u00e0 Papier M\\u00e9tallique 35\\/30 cm\",\"code_article\":\"FOUBUR019\",\"price_achat\":55,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":24,\"seuil\":55,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-11-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B1 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR019\",\"id\":251}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(487, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 252, '[]', '{\"name\":\"Corbeilles \\u00e0 Papier de 12 litres en Plastique\",\"code_article\":\"FOUBUR020\",\"price_achat\":8,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":24,\"seuil\":8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-12-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B1 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR020\",\"id\":252}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(488, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 253, '[]', '{\"name\":\"Dateurs Fran\\u00e7ais Arabe\",\"code_article\":\"FOUBUR021\",\"price_achat\":8.5,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":24,\"seuil\":8.5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-01-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B1 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR021\",\"id\":253}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(489, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 254, '[]', '{\"name\":\"Enveloppes Blanche FT 11*22\",\"code_article\":\"FOUBUR022\",\"price_achat\":0.35,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":24,\"seuil\":0.35,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-02-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B1 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR022\",\"id\":254}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(490, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 255, '[]', '{\"name\":\"Envoloppes en Kraft R\\u00e9f : 25 Imp 04 Couleurs\",\"code_article\":\"FOUBUR023\",\"price_achat\":1.67,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":24,\"seuil\":1.67,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-03-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B1 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR023\",\"id\":255}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(491, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 256, '[]', '{\"name\":\"Enveloppes en Kraft R\\u00e9f : 82 Imp 04 Couleurs\",\"code_article\":\"FOUBUR024\",\"price_achat\":2.17,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":24,\"seuil\":2.17,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-04-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B1 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR024\",\"id\":256}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(492, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 257, '[]', '{\"name\":\"Ensemble de Bureau En Sky de 05 Pi\\u00e9ces\",\"code_article\":\"FOUBUR025\",\"price_achat\":65,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":24,\"seuil\":65,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-05-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B1 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR025\",\"id\":257}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(493, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 258, '[]', '{\"name\":\"Feuilles Transparente FT A4\",\"code_article\":\"FOUBUR026\",\"price_achat\":0.47,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":25,\"seuil\":0.47,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-06-06 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR026\",\"id\":258}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(494, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 259, '[]', '{\"name\":\"Feuilles de Dossier Bleu FT A4\",\"code_article\":\"FOUBUR027\",\"price_achat\":0.45,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":25,\"seuil\":0.45,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-01-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR027\",\"id\":259}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(495, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 260, '[]', '{\"name\":\"Fiches Bristol Blanche FT A4\",\"code_article\":\"FOUBUR028\",\"price_achat\":41,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":25,\"seuil\":41,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-02-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR028\",\"id\":260}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(496, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 261, '[]', '{\"name\":\"Lot de 24 Notes Repositionnables FT 76*76\",\"code_article\":\"FOUBUR029\",\"price_achat\":86.4,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":25,\"seuil\":86.4,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-03-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR029\",\"id\":261}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(497, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 262, '[]', '{\"name\":\"Mi-fins Double FT 21*31 cm 60 grs\",\"code_article\":\"FOUBUR030\",\"price_achat\":17,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":25,\"seuil\":17,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-04-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR030\",\"id\":262}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(498, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 263, '[]', '{\"name\":\"\\u0152illets en plastique\",\"code_article\":\"FOUBUR031\",\"price_achat\":0.54,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":25,\"seuil\":0.54,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-05-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR031\",\"id\":263}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(499, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 264, '[]', '{\"name\":\"Parapheurs de Bureau Dif Couleurs\",\"code_article\":\"FOUBUR032\",\"price_achat\":44.5,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":25,\"seuil\":44.5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-06-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR032\",\"id\":264}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(500, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 265, '[]', '{\"name\":\"Pochettes Blanche FT 16*22 cm\",\"code_article\":\"FOUBUR033\",\"price_achat\":0.8,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":25,\"seuil\":0.8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-07-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR033\",\"id\":265}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(501, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 266, '[]', '{\"name\":\"Pochettes Blanche FT 22*32 cm\",\"code_article\":\"FOUBUR034\",\"price_achat\":1,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":25,\"seuil\":1,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-08-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR034\",\"id\":266}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(502, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 267, '[]', '{\"name\":\"Pochettes Blanche Autodox GF\",\"code_article\":\"FOUBUR035\",\"price_achat\":2.95,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":25,\"seuil\":2.95,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-09-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR035\",\"id\":267}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(503, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 268, '[]', '{\"name\":\"Pochettes en Kraft FT 22*32 cm\",\"code_article\":\"FOUBUR036\",\"price_achat\":3,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":25,\"seuil\":3,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-10-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR036\",\"id\":268}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(504, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 269, '[]', '{\"name\":\"Rame de Papier Bulle Double FT A4\",\"code_article\":\"FOUBUR037\",\"price_achat\":50,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":25,\"seuil\":50,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-11-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR037\",\"id\":269}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(505, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 270, '[]', '{\"name\":\"Rame de Papier Bulle Simple FT A4\",\"code_article\":\"FOUBUR038\",\"price_achat\":29.17,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":25,\"seuil\":29.17,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-12-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR038\",\"id\":270}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(506, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 271, '[]', '{\"name\":\"Rame de Papier Photocopie FT A4\",\"code_article\":\"FOUBUR039\",\"price_achat\":32,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":25,\"seuil\":32,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B2 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR039\",\"id\":271}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(507, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 272, '[]', '{\"name\":\"Rame de Papier Photocopie FT A3\",\"code_article\":\"FOUBUR041\",\"price_achat\":88,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":88,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR041\",\"id\":272}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(508, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 273, '[]', '{\"name\":\"Relieurs Porte Tarif Volti-plaste\",\"code_article\":\"FOUBUR042\",\"price_achat\":15,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":15,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR042\",\"id\":273}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(509, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 274, '[]', '{\"name\":\"Serres Feuilles de 04 mm\",\"code_article\":\"FOUBUR043\",\"price_achat\":1.33,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":1.33,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR043\",\"id\":274}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(510, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 275, '[]', '{\"name\":\"Serres Feuilles de 06 mm\",\"code_article\":\"FOUBUR044\",\"price_achat\":1.5,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":1.5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR044\",\"id\":275}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(511, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 276, '[]', '{\"name\":\"Serres Feuilles de 08 mm\",\"code_article\":\"FOUBUR045\",\"price_achat\":1.9,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":1.9,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR045\",\"id\":276}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(512, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 277, '[]', '{\"name\":\"Serres Feuilles Express de 16 mm\",\"code_article\":\"FOUBUR046\",\"price_achat\":0.7,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":0.7,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-08-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR046\",\"id\":277}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(513, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 278, '[]', '{\"name\":\"Serres Feuilles Express de 18 mm\",\"code_article\":\"FOUBUR047\",\"price_achat\":0.8,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":0.8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-09-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR047\",\"id\":278}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(514, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 279, '[]', '{\"name\":\"Serres Feuilles Express de 20 mm\",\"code_article\":\"FOUBUR048\",\"price_achat\":0.9,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":0.9,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-10-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR048\",\"id\":279}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(515, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 280, '[]', '{\"name\":\"Spiral en Plastique de 06 mm\",\"code_article\":\"FOUBUR049\",\"price_achat\":0.48,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":0.48,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-11-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR049\",\"id\":280}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(516, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 281, '[]', '{\"name\":\"Spiral en Plastique de 08 mm\",\"code_article\":\"FOUBUR052\",\"price_achat\":0.4,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":0.4,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-02-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR052\",\"id\":281}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(517, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 282, '[]', '{\"name\":\"Spiral en Plastique de 10 mm\",\"code_article\":\"FOUBUR053\",\"price_achat\":0.45,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":0.45,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-03-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR053\",\"id\":282}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(518, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 283, '[]', '{\"name\":\"Spiral en Plastique de 12 mm\",\"code_article\":\"FOUBUR054\",\"price_achat\":0.55,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":0.55,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-04-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR054\",\"id\":283}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(519, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 284, '[]', '{\"name\":\"Spiral en Plastique de 14 mm\",\"code_article\":\"FOUBUR055\",\"price_achat\":0.7,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":0.7,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-05-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR055\",\"id\":284}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(520, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 285, '[]', '{\"name\":\"Spiral en Plastique de 16 mm\",\"code_article\":\"FOUBUR056\",\"price_achat\":1.2,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":1.2,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-06-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR056\",\"id\":285}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(521, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 286, '[]', '{\"name\":\"Toner pour photocopier Canon C-EXV 14 R\\u00e9f : 113 R00730\",\"code_article\":\"FOUBUR057\",\"price_achat\":630,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":630,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-07-07 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR057\",\"id\":286}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(522, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 287, '[]', '{\"name\":\"Toner pour Photocopier R\\u00e9f : C-EXV 42\",\"code_article\":\"FOUBUR058\",\"price_achat\":170,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":170,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-01-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR058\",\"id\":287}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(523, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 288, '[]', '{\"name\":\"Toner pour Photocopier Konica Minolta 215\",\"code_article\":\"FOUBUR060\",\"price_achat\":850,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":850,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-03-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR060\",\"id\":288}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(524, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 289, '[]', '{\"name\":\"Toner pour Photocopier Konica Minolta 216\",\"code_article\":\"FOUBUR061\",\"price_achat\":900,\"id_categorie\":4,\"id_subcategorie\":16,\"id_local\":6,\"id_rayon\":26,\"seuil\":900,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-04-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE DE BUREAU \\/ B3 \\/ FOURNITURE \\/ BUREAU \\/ FOUBUR061\",\"id\":289}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(525, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 290, '[]', '{\"name\":\"Boite de Papier Glac\\u00e9\",\"code_article\":\"FOUINF001\",\"price_achat\":291.67,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":291.67,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-05-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF001\",\"id\":290}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(526, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 291, '[]', '{\"name\":\"CD HP Laser Vi\\u00e9rge\",\"code_article\":\"FOUINF002\",\"price_achat\":2.4,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":2.4,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-06-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF002\",\"id\":291}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(527, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 292, '[]', '{\"name\":\"Cartouche D\'encre HP 652 noirs\",\"code_article\":\"FOUINF003\",\"price_achat\":250,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":250,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-07-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF003\",\"id\":292}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(528, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 293, '[]', '{\"name\":\"Cartouche D\'encre HP 652 couleurs\",\"code_article\":\"FOUINF004\",\"price_achat\":233.34,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":233.34,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-08-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF004\",\"id\":293}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(529, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 294, '[]', '{\"name\":\"Cassettes Magn\\u00e9tique Zip\",\"code_article\":\"FOUINF005\",\"price_achat\":66.67,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":66.67,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-09-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF005\",\"id\":294}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(530, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 295, '[]', '{\"name\":\"Cassettes Magn\\u00e9tique Zip Mo 100\",\"code_article\":\"FOUINF006\",\"price_achat\":156,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":156,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-10-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF006\",\"id\":295}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(531, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 296, '[]', '{\"name\":\"Cassettes Vid\\u00e9o 120 mm\",\"code_article\":\"FOUINF007\",\"price_achat\":39.17,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":39.17,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-11-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF007\",\"id\":296}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(532, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 297, '[]', '{\"name\":\"Cassettes Vid\\u00e9o 30 mm\",\"code_article\":\"FOUINF008\",\"price_achat\":36.71,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":36.71,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-12-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF008\",\"id\":297}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(533, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 298, '[]', '{\"name\":\"Cassettes Radio Sony 90 mm\",\"code_article\":\"FOUINF009\",\"price_achat\":17,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":17,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF009\",\"id\":298}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(534, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 299, '[]', '{\"name\":\"Cl\\u00e9 USB 128 G\",\"code_article\":\"FOUINF010\",\"price_achat\":103,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":103,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF010\",\"id\":299}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(535, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 300, '[]', '{\"name\":\"Disque Dur Portable Seagate Expansion 1TP\",\"code_article\":\"FOUINF011\",\"price_achat\":850,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":850,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF011\",\"id\":300}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(536, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 301, '[]', '{\"name\":\"Disquette Ordinateurs 3\\\" 1\\/2\",\"code_article\":\"FOUINF012\",\"price_achat\":3,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":3,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF012\",\"id\":301}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(537, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 302, '[]', '{\"name\":\"Tapis Souris Antistatique\",\"code_article\":\"FOUINF013\",\"price_achat\":20,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":20,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF013\",\"id\":302}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(538, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 303, '[]', '{\"name\":\"Transparente pour Imprimante jet D\'encre\",\"code_article\":\"FOUINF014\",\"price_achat\":308.33,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":308.33,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF014\",\"id\":303}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(539, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 304, '[]', '{\"name\":\"Transparente pour R\\u00e9troprojecteur FT A4\",\"code_article\":\"FOUINF015\",\"price_achat\":112.5,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":112.5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF015\",\"id\":304}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(540, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 305, '[]', '{\"name\":\"Toner pour Imprimante HP Q 7553 A\",\"code_article\":\"FOUINF017\",\"price_achat\":1100,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":1100,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-09-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF017\",\"id\":305}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(541, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 306, '[]', '{\"name\":\"Toner pour Imprimante HP Q 7115 A\",\"code_article\":\"FOUINF018\",\"price_achat\":970,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":970,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-10-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF018\",\"id\":306}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(542, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 307, '[]', '{\"name\":\"Toner pour Imprimante HP CE 278 A\",\"code_article\":\"FOUINF019\",\"price_achat\":208.33,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":208.33,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-11-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF019\",\"id\":307}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(543, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 308, '[]', '{\"name\":\"Toner pour Imprimante HP CE 505 A\",\"code_article\":\"FOUINF021\",\"price_achat\":1380,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":28,\"seuil\":1380,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-01-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A1 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF021\",\"id\":308}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(544, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 309, '[]', '{\"name\":\"Toner pour Imprimante HP 285 A\",\"code_article\":\"FOUINF022\",\"price_achat\":760,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":29,\"seuil\":760,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-02-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A2 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF022\",\"id\":309}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(545, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 310, '[]', '{\"name\":\"Toner pour Imprimante HP 256 A\",\"code_article\":\"FOUINF024\",\"price_achat\":650,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":29,\"seuil\":650,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-04-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A2 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF024\",\"id\":310}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(546, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 311, '[]', '{\"name\":\"Toner pour Imprimante HP CF 219 A\",\"code_article\":\"FOUINF025\",\"price_achat\":650,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":29,\"seuil\":650,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-05-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A2 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF025\",\"id\":311}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(547, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 312, '[]', '{\"name\":\"Toner pour Imprimante HP CE 311 A\",\"code_article\":\"FOUINF026\",\"price_achat\":600,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":29,\"seuil\":600,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-06-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A2 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF026\",\"id\":312}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(548, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 313, '[]', '{\"name\":\"Toner pour Imprimante HP CE 312 A\",\"code_article\":\"FOUINF027\",\"price_achat\":600,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":29,\"seuil\":600,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-07-08 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A2 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF027\",\"id\":313}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(549, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 314, '[]', '{\"name\":\"Toner pour Imprimante HP CE 313 A\",\"code_article\":\"FOUINF028\",\"price_achat\":600,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":29,\"seuil\":600,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-01-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A2 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF028\",\"id\":314}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(550, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 315, '[]', '{\"name\":\"Toner pour Imprimante HP CF 530 A\",\"code_article\":\"FOUINF029\",\"price_achat\":650,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":29,\"seuil\":650,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-02-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A2 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF029\",\"id\":315}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(551, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 316, '[]', '{\"name\":\"Toner pour Imprimante HP Laser jet D\'origine ( W1360A ) 136A\",\"code_article\":\"FOUINF030\",\"price_achat\":520,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":29,\"seuil\":520,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-03-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A2 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF030\",\"id\":316}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(552, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 317, '[]', '{\"name\":\"Toner pour Imprimante HP Laser couleur jet D\'origine 222A W2220A Black\",\"code_article\":\"FOUINF031\",\"price_achat\":690,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":29,\"seuil\":690,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-04-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A2 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF031\",\"id\":317}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(553, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 318, '[]', '{\"name\":\"Toner pour Imprimante HP Laser couleur jet D\'origine 222A W2221A Cyan\",\"code_article\":\"FOUINF032\",\"price_achat\":830,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":29,\"seuil\":830,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-05-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A2 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF032\",\"id\":318}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(554, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 319, '[]', '{\"name\":\"Toner pour Imprimante HP Laser couleur jet D\'origine 222A W2222A Yellow\",\"code_article\":\"FOUINF033\",\"price_achat\":830,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":29,\"seuil\":830,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-06-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A2 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF033\",\"id\":319}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(555, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 320, '[]', '{\"name\":\"Toner pour Imprimante HP Laser couleur jet D\'origine 222A W2223A Magenta\",\"code_article\":\"FOUINF034\",\"price_achat\":830,\"id_categorie\":4,\"id_subcategorie\":17,\"id_local\":8,\"id_rayon\":29,\"seuil\":830,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-07-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE INFORMATIQUE \\/ A2 \\/ FOURNITURE \\/ INFORMATIQUE \\/ FOUINF034\",\"id\":320}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(556, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 321, '[]', '{\"name\":\"Applique Noirs 4*2 W 2700 K-V TAC\",\"code_article\":\"FOUELC001\",\"price_achat\":291.67,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":291.67,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-08-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC001\",\"id\":321}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(557, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 322, '[]', '{\"name\":\"Ampoules de 100 W\",\"code_article\":\"FOUELC002\",\"price_achat\":2.4,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":2.4,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-09-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC002\",\"id\":322}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(558, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 323, '[]', '{\"name\":\"Ampoules de 220 V 40 W E14\",\"code_article\":\"FOUELC004\",\"price_achat\":233.34,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":233.34,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-10-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC004\",\"id\":323}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(559, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 324, '[]', '{\"name\":\"Ampoules LED 9 W Ingelec\",\"code_article\":\"FOUELC005\",\"price_achat\":66.67,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":66.67,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-11-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC005\",\"id\":324}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(560, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 325, '[]', '{\"name\":\"Ampoules LED 5 W OPEL\",\"code_article\":\"FOUELC006\",\"price_achat\":156,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":156,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-12-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC006\",\"id\":325}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(561, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 326, '[]', '{\"name\":\"Ampoules pour Projecteurs Couleurs 230 V\",\"code_article\":\"FOUELC007\",\"price_achat\":39.17,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":39.17,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC007\",\"id\":326}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(562, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 327, '[]', '{\"name\":\"Ampoules Philips de 60 cm TLD 18 W \\/54\",\"code_article\":\"FOUELC008\",\"price_achat\":36.71,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":36.71,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC008\",\"id\":327}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(563, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 328, '[]', '{\"name\":\"Ampoules Philips de120 cm TLD 36 W \\/54\",\"code_article\":\"FOUELC009\",\"price_achat\":17,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":17,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC009\",\"id\":328}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(564, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 329, '[]', '{\"name\":\"Disjoncteurs 04 Fil 250 A 660V\",\"code_article\":\"FOUELC010\",\"price_achat\":103,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":103,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC010\",\"id\":329}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(565, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 330, '[]', '{\"name\":\"dIsjoncteurs  Combine de 03 Fil\",\"code_article\":\"FOUELC011\",\"price_achat\":850,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":850,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC011\",\"id\":330}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(566, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 331, '[]', '{\"name\":\"dIsjoncteurs  Combine de 02 Fil\",\"code_article\":\"FOUELC015\",\"price_achat\":112.5,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":112.5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC015\",\"id\":331}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(567, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 332, '[]', '{\"name\":\"Fusible pour Projecteurs kg lighting 70 W\",\"code_article\":\"FOUELC017\",\"price_achat\":1100,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":1100,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC017\",\"id\":332}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(568, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 333, '[]', '{\"name\":\"Fusible pour Projecteurs GMHh\\/D 70 W\",\"code_article\":\"FOUELC018\",\"price_achat\":970,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":970,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-08-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC018\",\"id\":333}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(569, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 334, '[]', '{\"name\":\"Fusible Ampoules 02 Fil hager 32 Amp\\u00e8res\",\"code_article\":\"FOUELC019\",\"price_achat\":208.33,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":208.33,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-09-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC019\",\"id\":334}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(570, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 335, '[]', '{\"name\":\"Fusible Ampoules 01 Fil hager 32 Amp\\u00e8res\",\"code_article\":\"FOUELC020\",\"price_achat\":870,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":870,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-10-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC020\",\"id\":335}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(571, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 336, '[]', '{\"name\":\"Fusible Ampoules 04 Fil hager 60 Amp\\u00e8res\",\"code_article\":\"FOUELC021\",\"price_achat\":1380,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":1380,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-11-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC021\",\"id\":336}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(572, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 337, '[]', '{\"name\":\"Fusible Bouchon Ampoules 550V 315 Amp\\u00e8res\",\"code_article\":\"FOUELC022\",\"price_achat\":760,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":760,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-12-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC022\",\"id\":337}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(573, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 338, '[]', '{\"name\":\"Interrupteurs Double Blanc\",\"code_article\":\"FOUELC023\",\"price_achat\":1100,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":1100,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-01-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC023\",\"id\":338}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(574, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 339, '[]', '{\"name\":\"Interrupteurs simple Blanc\",\"code_article\":\"FOUELC025\",\"price_achat\":650,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":650,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-02-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC025\",\"id\":339}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(575, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 340, '[]', '{\"name\":\"Projecteurs 500 W \\u00c9tanche\",\"code_article\":\"FOUELC026\",\"price_achat\":600,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":600,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-03-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC026\",\"id\":340}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(576, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 341, '[]', '{\"name\":\"Prises \\u00e9lectrique Blanc Ingelec 2p+t\",\"code_article\":\"FOUELC027\",\"price_achat\":600,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":600,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-04-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC027\",\"id\":341}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(577, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 342, '[]', '{\"name\":\"Piquets Gris GU 10  04 W IP  54\",\"code_article\":\"FOUELC028\",\"price_achat\":600,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":600,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-05-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC028\",\"id\":342}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(578, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 343, '[]', '{\"name\":\"Rallonge de 05 M\\u00e8tres 04 Prises ingelec\",\"code_article\":\"FOUELC029\",\"price_achat\":650,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":650,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-06-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC029\",\"id\":343}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(579, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 344, '[]', '{\"name\":\"Rallonge de 10 M\\u00e8tres 04 Prises  ingelec\",\"code_article\":\"FOUELC030\",\"price_achat\":520,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":520,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-01-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC030\",\"id\":344}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(580, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 345, '[]', '{\"name\":\"Scotchs Noirs \\u00e9lectrique\",\"code_article\":\"FOUELC031\",\"price_achat\":690,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":690,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-02-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC031\",\"id\":345}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(581, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 346, '[]', '{\"name\":\"Spots Halog\\u00e9ne R\\u00e9f; G4 230 V  35 W\",\"code_article\":\"FOUELC032\",\"price_achat\":830,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":830,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-03-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC032\",\"id\":346}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(582, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 347, '[]', '{\"name\":\"Starter pour Ampoules N\\u00e9on  30-40 W\",\"code_article\":\"FOUELC033\",\"price_achat\":830,\"id_categorie\":4,\"id_subcategorie\":18,\"id_local\":7,\"id_rayon\":27,\"seuil\":830,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-04-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE FOUNITURE ELECTRIQUE \\/ C \\/ FOURNITURE \\/ ELECTRIQUE \\/ FOUELC033\",\"id\":347}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(583, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 348, '[]', '{\"name\":\"Balais Synth\\u00e9tique avec Manche\",\"code_article\":\"FOUELC073\",\"price_achat\":16,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":16,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-05-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUELC073\",\"id\":348}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(584, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 349, '[]', '{\"name\":\"Balais Paille de Riz\",\"code_article\":\"FOUNET002\",\"price_achat\":33.33,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":33.33,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-07-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET002\",\"id\":349}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(585, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 350, '[]', '{\"name\":\"Boite de Mouchoirs de 550 Feuilles 02 P+B15:B60+B15:B40+B15:B40lis\",\"code_article\":\"FOUNET004\",\"price_achat\":9,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":9,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-02-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET004\",\"id\":350}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(586, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 351, '[]', '{\"name\":\"Brosses \\u00e0 Linge GF avec manche\",\"code_article\":\"FOUNET005\",\"price_achat\":30,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-03-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET005\",\"id\":351}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(587, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 352, '[]', '{\"name\":\"Brosses Sanitaire en Plastique\",\"code_article\":\"FOUNET006\",\"price_achat\":30,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-04-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET006\",\"id\":352}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(588, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 353, '[]', '{\"name\":\"Brosse Synth\\u00e9tique Tapis Avec Roulettes\",\"code_article\":\"FOUNET007\",\"price_achat\":15,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":15,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-05-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET007\",\"id\":353}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(589, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 354, '[]', '{\"name\":\"Chamoisines\",\"code_article\":\"FOUNET008\",\"price_achat\":6.8,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":6.8,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-06-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET008\",\"id\":354}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(590, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 355, '[]', '{\"name\":\"Chamoisines en coton 40*45\",\"code_article\":\"FOUNET010\",\"price_achat\":5,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-08-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET010\",\"id\":355}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(591, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 356, '[]', '{\"name\":\"Chiffons Microfibre 40*40\",\"code_article\":\"FOUNET011\",\"price_achat\":10,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-09-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET011\",\"id\":356}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(592, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 357, '[]', '{\"name\":\"D\\u00e9bouche Bien de 400 Grs\",\"code_article\":\"FOUNET012\",\"price_achat\":10,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":10,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-10-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET012\",\"id\":357}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(593, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 358, '[]', '{\"name\":\"D\\u00e9sinfectant multi usage de 01 litre\",\"code_article\":\"FOUNET013\",\"price_achat\":25,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":25,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-11-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET013\",\"id\":358}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(594, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 359, '[]', '{\"name\":\"D\\u00e9sinfectant Anti Rouille Textile K2R\",\"code_article\":\"FOUNET014\",\"price_achat\":25,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":25,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-12-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET014\",\"id\":359}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(595, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 360, '[]', '{\"name\":\"D\\u00e9sodorisant Spray de 400 ml\",\"code_article\":\"FOUNET015\",\"price_achat\":15,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":15,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET015\",\"id\":360}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(596, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 361, '[]', '{\"name\":\"Eau de Javel de 01 litre\",\"code_article\":\"FOUNET016\",\"price_achat\":6,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":6,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET016\",\"id\":361}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(597, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 362, '[]', '{\"name\":\"Eponges Mousse\",\"code_article\":\"FOUNET017\",\"price_achat\":1,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":1,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET017\",\"id\":362}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(598, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 363, '[]', '{\"name\":\"Eponges Pulvo-pro\",\"code_article\":\"FOUNET018\",\"price_achat\":1,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":1,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET018\",\"id\":363}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(599, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 364, '[]', '{\"name\":\"Eponges M\\u00e9tallique\",\"code_article\":\"FOUNET019\",\"price_achat\":0.35,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":0.35,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET019\",\"id\":364}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(600, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 365, '[]', '{\"name\":\"Essuie Mains ( Boite de 06 Rouleaux )\",\"code_article\":\"FOUNET020\",\"price_achat\":210,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":210,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET020\",\"id\":365}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(601, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 366, '[]', '{\"name\":\"Insecticide de 300 ml\",\"code_article\":\"FOUNET021\",\"price_achat\":18,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":18,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET021\",\"id\":366}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(602, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 367, '[]', '{\"name\":\"Liteau en Coton 60 cm*75 cm\",\"code_article\":\"FOUNET022\",\"price_achat\":20,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":20,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-08-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET022\",\"id\":367}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(603, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 368, '[]', '{\"name\":\"Liteau en Coton 100% 01m*60 cm\",\"code_article\":\"FOUNET023\",\"price_achat\":35,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":35,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-09-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET023\",\"id\":368}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(604, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 369, '[]', '{\"name\":\"Liteau en Coton 100% 01m*01 m\",\"code_article\":\"FOUNET024\",\"price_achat\":45,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":45,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-10-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET024\",\"id\":369}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(605, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 370, '[]', '{\"name\":\"Laines D\'acier\",\"code_article\":\"FOUNET025\",\"price_achat\":0.42,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":0.42,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-11-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET025\",\"id\":370}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(606, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 371, '[]', '{\"name\":\"Nettoyant R\\u00e9novateur pour Aluminium de 01 litre\",\"code_article\":\"FOUNET026\",\"price_achat\":190,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":190,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-12-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET026\",\"id\":371}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(607, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 372, '[]', '{\"name\":\"Papier Hygi\\u00e9nique 02 Plis Super Soft (Boite de 24 Rouleaux)\",\"code_article\":\"FOUNET027\",\"price_achat\":65,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":65,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-01-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET027\",\"id\":372}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(608, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 373, '[]', '{\"name\":\"Papier Hygi\\u00e9nique GF\",\"code_article\":\"FOUNET028\",\"price_achat\":34.25,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":34.25,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-02-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET028\",\"id\":373}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(609, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 374, '[]', '{\"name\":\"Papier Hygi\\u00e9nique PF\",\"code_article\":\"FOUNET030\",\"price_achat\":2.5,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":2.5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-04-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET030\",\"id\":374}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(610, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 375, '[]', '{\"name\":\"Peaux de Chamois GM\",\"code_article\":\"FOUNET031\",\"price_achat\":55,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":55,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-05-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET031\",\"id\":375}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(611, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 376, '[]', '{\"name\":\"Poubelles en Plastique 85\",\"code_article\":\"FOUNET032\",\"price_achat\":140,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":140,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-06-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET032\",\"id\":376}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(612, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 377, '[]', '{\"name\":\"Pelles en Plastique avec Manche\",\"code_article\":\"FOUNET035\",\"price_achat\":30,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-03-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET035\",\"id\":377}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(613, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 378, '[]', '{\"name\":\"Produit D\\u00e9graissant Prof- de Cuisine\",\"code_article\":\"FOUNET036\",\"price_achat\":34,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":34,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-04-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET036\",\"id\":378}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(614, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 379, '[]', '{\"name\":\"Produit de Nettoyage pour Cuivre de 250 ml\",\"code_article\":\"FOUNET037\",\"price_achat\":45,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":45,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-05-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET037\",\"id\":379}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(615, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 380, '[]', '{\"name\":\"Raclettes en Plastique avec manche\",\"code_article\":\"FOUNET038\",\"price_achat\":20,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":20,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-06-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET038\",\"id\":380}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(616, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 381, '[]', '{\"name\":\"Raclettes Vitre Professionnelle\",\"code_article\":\"FOUNET039\",\"price_achat\":22,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":22,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-07-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET039\",\"id\":381}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(617, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 382, '[]', '{\"name\":\"Raclettes de Nettoyage pour Parquet\",\"code_article\":\"FOUNET040\",\"price_achat\":25,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":25,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-08-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET040\",\"id\":382}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(618, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 383, '[]', '{\"name\":\"Sani croix de 01 litre\",\"code_article\":\"FOUNET041\",\"price_achat\":13,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":13,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-09-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET041\",\"id\":383}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(619, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 384, '[]', '{\"name\":\"Serpilli\\u00e9res Jaune\",\"code_article\":\"FOUNET042\",\"price_achat\":7,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":7,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-10-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET042\",\"id\":384}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(620, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 385, '[]', '{\"name\":\"Seaux en Plastique de 15 litres GM\",\"code_article\":\"FOUNET043\",\"price_achat\":15,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":15,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2026-11-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET043\",\"id\":385}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(621, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 386, '[]', '{\"name\":\"Sacs en Plastique pour Poubelle 100 litre\",\"code_article\":\"FOUNET045\",\"price_achat\":35,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":35,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET045\",\"id\":386}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(622, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 387, '[]', '{\"name\":\"Savon en Morceaux de 250 grs\",\"code_article\":\"FOUNET046\",\"price_achat\":5.5,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":5.5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET046\",\"id\":387}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(623, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 388, '[]', '{\"name\":\"Savon de Machine \\u00e0 laver de 05 kg\",\"code_article\":\"FOUNET047\",\"price_achat\":100,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":100,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET047\",\"id\":388}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(624, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 389, '[]', '{\"name\":\"Savon en P\\u00e2te Miti usage de 01 kg\",\"code_article\":\"FOUNET048\",\"price_achat\":13.5,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":13.5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET048\",\"id\":389}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(625, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 390, '[]', '{\"name\":\"Savon Liquide Mains Antibact\\u00e9rien Extra de 500 ml\",\"code_article\":\"FOUNET049\",\"price_achat\":12,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":12,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET049\",\"id\":390}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(626, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 391, '[]', '{\"name\":\"Serviettes de Papier de 50 Pi\\u00e9ces\",\"code_article\":\"FOUNET050\",\"price_achat\":13,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":13,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET050\",\"id\":391}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(627, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 392, '[]', '{\"name\":\"Serviettes de Papier Rouge de 30 Pi\\u00e9ces\",\"code_article\":\"FOUNET051\",\"price_achat\":13,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":13,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET051\",\"id\":392}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(628, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 393, '[]', '{\"name\":\"Serviettes de Papier pour Distributeur Zig Zag\",\"code_article\":\"FOUNET052\",\"price_achat\":18,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":18,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-08-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET052\",\"id\":393}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(629, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 394, '[]', '{\"name\":\"Tampons abrasif\",\"code_article\":\"FOUNET053\",\"price_achat\":1,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":1,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-09-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET053\",\"id\":394}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(630, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 395, '[]', '{\"name\":\"Torchons de Cuisine Professionnel pour Nettoyage\",\"code_article\":\"FOUNET054\",\"price_achat\":6.5,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":6.5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-10-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET054\",\"id\":395}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(631, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 396, '[]', '{\"name\":\"Torchons Essuie Main 50*70 cm\",\"code_article\":\"FOUNET055\",\"price_achat\":13,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":13,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-11-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET055\",\"id\":396}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(632, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 397, '[]', '{\"name\":\"Venteuse avec Manche\",\"code_article\":\"FOUNET056\",\"price_achat\":22,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":22,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-12-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET056\",\"id\":397}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(633, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 398, '[]', '{\"name\":\"Vim en Poudre de 500 grs\",\"code_article\":\"FOUNET057\",\"price_achat\":22,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":22,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-01-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET057\",\"id\":398}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(634, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 399, '[]', '{\"name\":\"Vinaigre Blanc Pour Nettoyage de 500 ml\",\"code_article\":\"FOUNET058\",\"price_achat\":6,\"id_categorie\":4,\"id_subcategorie\":20,\"id_local\":12,\"id_rayon\":40,\"seuil\":6,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-02-12 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE PRODUITS DE NETTOYAGE \\/ A \\/ FOURNITURE \\/ NETTOYAGE \\/ FOUNET058\",\"id\":399}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(635, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 400, '[]', '{\"name\":\"Cumin Moulu\",\"code_article\":\"EPLEMA001\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":25,\"id_local\":4,\"id_rayon\":13,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-12-02 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ EPICES MAROCAINES \\/ EPLEMA001\",\"id\":400}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(636, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 401, '[]', '{\"name\":\"Curcuma Moulu\",\"code_article\":\"EPLEMA002\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":25,\"id_local\":4,\"id_rayon\":13,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-01-02 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ EPICES MAROCAINES \\/ EPLEMA002\",\"id\":401}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(637, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 402, '[]', '{\"name\":\"Gingembre Moulu\",\"code_article\":\"EPLEMA003\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":25,\"id_local\":4,\"id_rayon\":13,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-02-02 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ EPICES MAROCAINES \\/ EPLEMA003\",\"id\":402}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(638, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 403, '[]', '{\"name\":\"Cannelle Moulu\",\"code_article\":\"EPLEMA004\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":25,\"id_local\":4,\"id_rayon\":13,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-03-02 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ EPICES MAROCAINES \\/ EPLEMA004\",\"id\":403}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(639, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 404, '[]', '{\"name\":\"Cannelle en Branche\",\"code_article\":\"EPLEMA005\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":25,\"id_local\":4,\"id_rayon\":13,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-04-02 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ C \\/ EPICERIE & PRODUITS LAITIERS \\/ EPICES MAROCAINES \\/ EPLEMA005\",\"id\":404}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(640, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 405, '[]', '{\"name\":\"Piment Moulu\",\"code_article\":\"EPLEMA006\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":25,\"id_local\":4,\"id_rayon\":14,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-05-02 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ EPICES MAROCAINES \\/ EPLEMA006\",\"id\":405}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(641, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 406, '[]', '{\"name\":\"Piment Fort\",\"code_article\":\"EPLEMA007\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":25,\"id_local\":4,\"id_rayon\":14,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-06-02 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ EPICES MAROCAINES \\/ EPLEMA007\",\"id\":406}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(642, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 407, '[]', '{\"name\":\"Poivre Moulu\",\"code_article\":\"EPLEMA008\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":25,\"id_local\":4,\"id_rayon\":14,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-07-02 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ EPICES MAROCAINES \\/ EPLEMA008\",\"id\":407}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(643, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 408, '[]', '{\"name\":\"Safran Fleurs\",\"code_article\":\"EPLEMA009\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":25,\"id_local\":4,\"id_rayon\":14,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-08-02 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ EPICES MAROCAINES \\/ EPLEMA009\",\"id\":408}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:28', '2025-11-24 08:24:28'),
(644, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 409, '[]', '{\"name\":\"Sel de Cuisine\",\"code_article\":\"EPLEMA010\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":25,\"id_local\":4,\"id_rayon\":14,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-09-02 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ EPICES MAROCAINES \\/ EPLEMA010\",\"id\":409}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(645, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 410, '[]', '{\"name\":\"Sel de Table de 500 grs\",\"code_article\":\"EPLEMA011\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":25,\"id_local\":4,\"id_rayon\":14,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-10-02 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ EPICES MAROCAINES \\/ EPLEMA011\",\"id\":410}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(646, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 411, '[]', '{\"name\":\"Gomme Arabiques\",\"code_article\":\"EPLCON001\",\"price_achat\":18,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":18,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-11-02 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON001\",\"id\":411}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(647, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 412, '[]', '{\"name\":\"Poivre en Grains\",\"code_article\":\"EPLCON002\",\"price_achat\":12,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":12,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-12-02 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON002\",\"id\":412}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(648, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 413, '[]', '{\"name\":\"Noix de Muscade\",\"code_article\":\"EPLCON003\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":15,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-01-02 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON003\",\"id\":413}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(649, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 414, '[]', '{\"name\":\"Sauce Soja de 150 ml\",\"code_article\":\"EPLCON004\",\"price_achat\":22,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":22,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-02-02 00:00:00\",\"id_tva\":1,\"id_unite\":9,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON004\",\"id\":414}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(650, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 415, '[]', '{\"name\":\"Moutarde de 100 grs\",\"code_article\":\"EPLCON005\",\"price_achat\":25,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":25,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-03-02 00:00:00\",\"id_tva\":1,\"id_unite\":8,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON005\",\"id\":415}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(651, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 416, '[]', '{\"name\":\"Vinaigre de 50 cl\",\"code_article\":\"EPLCON006\",\"price_achat\":18,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":18,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-04-02 00:00:00\",\"id_tva\":1,\"id_unite\":9,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON006\",\"id\":416}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(652, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 417, '[]', '{\"name\":\"Vinaigre de 25 cl\",\"code_article\":\"EPLCON007\",\"price_achat\":12,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":12,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-03 00:00:00\",\"id_tva\":1,\"id_unite\":9,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON007\",\"id\":417}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(653, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 418, '[]', '{\"name\":\"Noix de Coco\",\"code_article\":\"EPLCON008\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":15,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON008\",\"id\":418}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(654, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 419, '[]', '{\"name\":\"S\\u00e9sames\",\"code_article\":\"EPLCON009\",\"price_achat\":22,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":22,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON009\",\"id\":419}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(655, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 420, '[]', '{\"name\":\"S\\u00e9sames Blanc\",\"code_article\":\"EPLCON010\",\"price_achat\":25,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":25,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON010\",\"id\":420}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(656, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 421, '[]', '{\"name\":\"Anis Verte\",\"code_article\":\"EPLCON011\",\"price_achat\":18,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":18,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON011\",\"id\":421}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(657, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 422, '[]', '{\"name\":\"Eau de Fleur D\'oranger\",\"code_article\":\"EPLCON012\",\"price_achat\":12,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":12,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-03 00:00:00\",\"id_tva\":1,\"id_unite\":9,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON012\",\"id\":422}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(658, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 423, '[]', '{\"name\":\"Grains de Girofle\",\"code_article\":\"EPLCON013\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":15,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON013\",\"id\":423}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(659, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 424, '[]', '{\"name\":\"Ail Rouge\",\"code_article\":\"EPLCON014\",\"price_achat\":22,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":22,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-08-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON014\",\"id\":424}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(660, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 425, '[]', '{\"name\":\"CERISES ROUGES\",\"code_article\":\"EPLCON015\",\"price_achat\":25,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":25,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-09-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON015\",\"id\":425}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(661, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 426, '[]', '{\"name\":\"CERISES VERTES\",\"code_article\":\"EPLCON016\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":15,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-10-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON016\",\"id\":426}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(662, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 427, '[]', '{\"name\":\"NAPPAGE\",\"code_article\":\"EPLCON017\",\"price_achat\":22,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":14,\"seuil\":22,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-11-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ D \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON017\",\"id\":427}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(663, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 428, '[]', '{\"name\":\"GLUCOSES\",\"code_article\":\"EPLCON018\",\"price_achat\":25,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":15,\"seuil\":25,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-12-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ E \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON018\",\"id\":428}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(664, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 429, '[]', '{\"name\":\"CERISES CONFLITES\",\"code_article\":\"EPLCON019\",\"price_achat\":18,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":15,\"seuil\":18,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-01-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ E \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON019\",\"id\":429}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(665, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 430, '[]', '{\"name\":\"MORTADELLE\",\"code_article\":\"EPLCON020\",\"price_achat\":12,\"id_categorie\":5,\"id_subcategorie\":26,\"id_local\":4,\"id_rayon\":15,\"seuil\":12,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-02-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ E \\/ EPICERIE & PRODUITS LAITIERS \\/ CONDIMENTS \\/ EPLCON020\",\"id\":430}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(666, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 431, '[]', '{\"name\":\"Menthe\",\"code_article\":\"EPLHEA001\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":27,\"id_local\":4,\"id_rayon\":15,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-03-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ E \\/ EPICERIE & PRODUITS LAITIERS \\/ HERBES AROMATIQUES \\/ EPLHEA001\",\"id\":431}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(667, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 432, '[]', '{\"name\":\"Thyn\",\"code_article\":\"EPLHEA002\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":27,\"id_local\":4,\"id_rayon\":15,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-04-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ E \\/ EPICERIE & PRODUITS LAITIERS \\/ HERBES AROMATIQUES \\/ EPLHEA002\",\"id\":432}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(668, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 433, '[]', '{\"name\":\"Origon\",\"code_article\":\"EPLHEA003\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":27,\"id_local\":4,\"id_rayon\":15,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-05-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ E \\/ EPICERIE & PRODUITS LAITIERS \\/ HERBES AROMATIQUES \\/ EPLHEA003\",\"id\":433}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(669, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 434, '[]', '{\"name\":\"Verveine\",\"code_article\":\"EPLHEA004\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":27,\"id_local\":4,\"id_rayon\":15,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-06-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ E \\/ EPICERIE & PRODUITS LAITIERS \\/ HERBES AROMATIQUES \\/ EPLHEA004\",\"id\":434}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(670, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 435, '[]', '{\"name\":\"Laurier\",\"code_article\":\"EPLHEA005\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":27,\"id_local\":4,\"id_rayon\":15,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-07-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ E \\/ EPICERIE & PRODUITS LAITIERS \\/ HERBES AROMATIQUES \\/ EPLHEA005\",\"id\":435}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(671, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 436, '[]', '{\"name\":\"Romarain\",\"code_article\":\"EPLHEA006\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":27,\"id_local\":4,\"id_rayon\":15,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-08-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ E \\/ EPICERIE & PRODUITS LAITIERS \\/ HERBES AROMATIQUES \\/ EPLHEA006\",\"id\":436}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(672, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 437, '[]', '{\"name\":\"Estragon\",\"code_article\":\"EPLHEA007\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":27,\"id_local\":4,\"id_rayon\":15,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-09-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ E \\/ EPICERIE & PRODUITS LAITIERS \\/ HERBES AROMATIQUES \\/ EPLHEA007\",\"id\":437}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(673, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 438, '[]', '{\"name\":\"Basilic\",\"code_article\":\"EPLHEA008\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":27,\"id_local\":4,\"id_rayon\":15,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-10-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ E \\/ EPICERIE & PRODUITS LAITIERS \\/ HERBES AROMATIQUES \\/ EPLHEA008\",\"id\":438}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(674, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 439, '[]', '{\"name\":\"Ciboulette\",\"code_article\":\"EPLHEA009\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":27,\"id_local\":4,\"id_rayon\":15,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-11-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ E \\/ EPICERIE & PRODUITS LAITIERS \\/ HERBES AROMATIQUES \\/ EPLHEA009\",\"id\":439}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(675, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 440, '[]', '{\"name\":\"Fleurs de C\\u00e2pres\",\"code_article\":\"EPLHEA010\",\"price_achat\":30,\"id_categorie\":5,\"id_subcategorie\":27,\"id_local\":4,\"id_rayon\":15,\"seuil\":30,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-12-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ E \\/ EPICERIE & PRODUITS LAITIERS \\/ HERBES AROMATIQUES \\/ EPLHEA010\",\"id\":440}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(676, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 441, '[]', '{\"name\":\"Cr\\u00e9me Fraiche\",\"code_article\":\"EPLPRL001\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":28,\"id_local\":3,\"id_rayon\":5,\"seuil\":15,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-01-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ PRODUITS LAITIERS \\/ EPLPRL001\",\"id\":441}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(677, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 442, '[]', '{\"name\":\"Fromage EDAM\",\"code_article\":\"EPLPRL002\",\"price_achat\":20,\"id_categorie\":5,\"id_subcategorie\":28,\"id_local\":3,\"id_rayon\":5,\"seuil\":20,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-02-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ PRODUITS LAITIERS \\/ EPLPRL002\",\"id\":442}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(678, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 443, '[]', '{\"name\":\"charcuterie\",\"code_article\":\"EPLPRL003\",\"price_achat\":20,\"id_categorie\":5,\"id_subcategorie\":28,\"id_local\":3,\"id_rayon\":5,\"seuil\":20,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-03-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ PRODUITS LAITIERS \\/ EPLPRL003\",\"id\":443}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(679, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 444, '[]', '{\"name\":\"Fromage Frais\",\"code_article\":\"EPLPRL004\",\"price_achat\":20,\"id_categorie\":5,\"id_subcategorie\":28,\"id_local\":3,\"id_rayon\":5,\"seuil\":20,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-04-03 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ PRODUITS LAITIERS \\/ EPLPRL004\",\"id\":444}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(680, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 445, '[]', '{\"name\":\"Lait UHT de 01 litre\",\"code_article\":\"EPLPRL005\",\"price_achat\":4,\"id_categorie\":5,\"id_subcategorie\":28,\"id_local\":3,\"id_rayon\":5,\"seuil\":4,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-05-03 00:00:00\",\"id_tva\":1,\"id_unite\":3,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ PRODUITS LAITIERS \\/ EPLPRL005\",\"id\":445}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(681, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 446, '[]', '{\"name\":\"Lait Frais Pasteuris\\u00e9\",\"code_article\":\"EPLPRL006\",\"price_achat\":4,\"id_categorie\":5,\"id_subcategorie\":28,\"id_local\":3,\"id_rayon\":5,\"seuil\":4,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-06-03 00:00:00\",\"id_tva\":1,\"id_unite\":3,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ PRODUITS LAITIERS \\/ EPLPRL006\",\"id\":446}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(682, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 447, '[]', '{\"name\":\"Cr\\u00e8me Liquide Top Chef\",\"code_article\":\"EPLPRL007\",\"price_achat\":16,\"id_categorie\":5,\"id_subcategorie\":28,\"id_local\":3,\"id_rayon\":5,\"seuil\":16,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-07-03 00:00:00\",\"id_tva\":1,\"id_unite\":3,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ PRODUITS LAITIERS \\/ EPLPRL007\",\"id\":447}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(683, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 448, '[]', '{\"name\":\"Beurre Pasteuris\\u00e9\",\"code_article\":\"EPLPRL008\",\"price_achat\":22,\"id_categorie\":5,\"id_subcategorie\":28,\"id_local\":3,\"id_rayon\":5,\"seuil\":22,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ PRODUITS LAITIERS \\/ EPLPRL008\",\"id\":448}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(684, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 449, '[]', '{\"name\":\"Beurre Rance SMEN\",\"code_article\":\"EPLPRL009\",\"price_achat\":120,\"id_categorie\":5,\"id_subcategorie\":28,\"id_local\":3,\"id_rayon\":5,\"seuil\":120,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ A \\/ EPICERIE & PRODUITS LAITIERS \\/ PRODUITS LAITIERS \\/ EPLPRL009\",\"id\":449}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(685, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 450, '[]', '{\"name\":\"Petit Lait (Leben)\",\"code_article\":\"EPLPRL010\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":28,\"id_local\":3,\"id_rayon\":6,\"seuil\":15,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-04 00:00:00\",\"id_tva\":1,\"id_unite\":3,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ PRODUITS LAITIERS \\/ EPLPRL010\",\"id\":450}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(686, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 451, '[]', '{\"name\":\"Yaourt\",\"code_article\":\"EPLPRL011\",\"price_achat\":12,\"id_categorie\":5,\"id_subcategorie\":28,\"id_local\":3,\"id_rayon\":6,\"seuil\":12,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-04 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ PRODUITS LAITIERS \\/ EPLPRL011\",\"id\":451}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(687, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 452, '[]', '{\"name\":\"Lait en Poudre\",\"code_article\":\"EPLPRL012\",\"price_achat\":20,\"id_categorie\":5,\"id_subcategorie\":28,\"id_local\":3,\"id_rayon\":6,\"seuil\":20,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ PRODUITS LAITIERS \\/ EPLPRL012\",\"id\":452}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(688, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 453, '[]', '{\"name\":\"Eau Min\\u00e9rale de 50 cl\",\"code_article\":\"EPLBOI001\",\"price_achat\":3,\"id_categorie\":5,\"id_subcategorie\":29,\"id_local\":3,\"id_rayon\":6,\"seuil\":3,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-04 00:00:00\",\"id_tva\":1,\"id_unite\":3,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ BOISSONS \\/ EPLBOI001\",\"id\":453}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(689, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 454, '[]', '{\"name\":\"Eau Min\\u00e9rale de 01,5 LT\",\"code_article\":\"EPLBOI002\",\"price_achat\":5,\"id_categorie\":5,\"id_subcategorie\":29,\"id_local\":3,\"id_rayon\":6,\"seuil\":5,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-04 00:00:00\",\"id_tva\":1,\"id_unite\":3,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ BOISSONS \\/ EPLBOI002\",\"id\":454}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(690, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 455, '[]', '{\"name\":\"Eau Min\\u00e9rale Gazeuse de 01 lt\",\"code_article\":\"EPLBOI003\",\"price_achat\":6,\"id_categorie\":5,\"id_subcategorie\":29,\"id_local\":3,\"id_rayon\":6,\"seuil\":6,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-08-04 00:00:00\",\"id_tva\":1,\"id_unite\":3,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ BOISSONS \\/ EPLBOI003\",\"id\":455}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(691, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 456, '[]', '{\"name\":\"sodas\",\"code_article\":\"EPLBOI004\",\"price_achat\":4,\"id_categorie\":5,\"id_subcategorie\":29,\"id_local\":3,\"id_rayon\":6,\"seuil\":4,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-09-04 00:00:00\",\"id_tva\":1,\"id_unite\":3,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ BOISSONS \\/ EPLBOI004\",\"id\":456}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(692, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 457, '[]', '{\"name\":\"Sirop\",\"code_article\":\"EPLBOI005\",\"price_achat\":4,\"id_categorie\":5,\"id_subcategorie\":29,\"id_local\":3,\"id_rayon\":6,\"seuil\":4,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-10-04 00:00:00\",\"id_tva\":1,\"id_unite\":3,\"id_user\":1,\"emplacement\":\"CHAMBRE FROIDE POSITIVE \\/ B \\/ EPICERIE & PRODUITS LAITIERS \\/ BOISSONS \\/ EPLBOI005\",\"id\":457}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(693, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 458, '[]', '{\"name\":\"POUDRE CACAO\",\"code_article\":\"EPLCHO001\",\"price_achat\":20,\"id_categorie\":5,\"id_subcategorie\":30,\"id_local\":4,\"id_rayon\":16,\"seuil\":20,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-11-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ F \\/ EPICERIE & PRODUITS LAITIERS \\/ CHOCOLATERIES \\/ EPLCHO001\",\"id\":458}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(694, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 459, '[]', '{\"name\":\"CHOCOLATS NOISETTE\",\"code_article\":\"EPLCHO002\",\"price_achat\":20,\"id_categorie\":5,\"id_subcategorie\":30,\"id_local\":4,\"id_rayon\":16,\"seuil\":20,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-12-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ F \\/ EPICERIE & PRODUITS LAITIERS \\/ CHOCOLATERIES \\/ EPLCHO002\",\"id\":459}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(695, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 460, '[]', '{\"name\":\"Chocolat P\\u00e9pites Noirs\",\"code_article\":\"EPLCHO003\",\"price_achat\":20,\"id_categorie\":5,\"id_subcategorie\":30,\"id_local\":4,\"id_rayon\":16,\"seuil\":20,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-01-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ F \\/ EPICERIE & PRODUITS LAITIERS \\/ CHOCOLATERIES \\/ EPLCHO003\",\"id\":460}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(696, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 461, '[]', '{\"name\":\"Chocolat P\\u00e9pites Blanc\",\"code_article\":\"EPLCHO004\",\"price_achat\":20,\"id_categorie\":5,\"id_subcategorie\":30,\"id_local\":4,\"id_rayon\":16,\"seuil\":20,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-02-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ F \\/ EPICERIE & PRODUITS LAITIERS \\/ CHOCOLATERIES \\/ EPLCHO004\",\"id\":461}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(697, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 462, '[]', '{\"name\":\"Chocolat au Lait Riche\",\"code_article\":\"EPLCHO005\",\"price_achat\":20,\"id_categorie\":5,\"id_subcategorie\":30,\"id_local\":4,\"id_rayon\":16,\"seuil\":20,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-03-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ F \\/ EPICERIE & PRODUITS LAITIERS \\/ CHOCOLATERIES \\/ EPLCHO005\",\"id\":462}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(698, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 463, '[]', '{\"name\":\"Chocolat Blanct Riche\",\"code_article\":\"EPLCHO006\",\"price_achat\":20,\"id_categorie\":5,\"id_subcategorie\":30,\"id_local\":4,\"id_rayon\":16,\"seuil\":20,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-04-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ F \\/ EPICERIE & PRODUITS LAITIERS \\/ CHOCOLATERIES \\/ EPLCHO006\",\"id\":463}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(699, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 464, '[]', '{\"name\":\"Chocolat Noirs Riche\",\"code_article\":\"EPLCHO007\",\"price_achat\":20,\"id_categorie\":5,\"id_subcategorie\":30,\"id_local\":4,\"id_rayon\":16,\"seuil\":20,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-05-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ F \\/ EPICERIE & PRODUITS LAITIERS \\/ CHOCOLATERIES \\/ EPLCHO007\",\"id\":464}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(700, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 465, '[]', '{\"name\":\"Sucre Semoule\",\"code_article\":\"EPLGLU001\",\"price_achat\":14,\"id_categorie\":5,\"id_subcategorie\":32,\"id_local\":4,\"id_rayon\":16,\"seuil\":14,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-10-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ F \\/ EPICERIE & PRODUITS LAITIERS \\/ GLUCIDES \\/ EPLGLU001\",\"id\":465}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(701, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 466, '[]', '{\"name\":\"Sucre en Morceaux\",\"code_article\":\"EPLGLU002\",\"price_achat\":14,\"id_categorie\":5,\"id_subcategorie\":32,\"id_local\":4,\"id_rayon\":16,\"seuil\":14,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-11-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ F \\/ EPICERIE & PRODUITS LAITIERS \\/ GLUCIDES \\/ EPLGLU002\",\"id\":466}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(702, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 467, '[]', '{\"name\":\"Sucre Glac\\u00e9 Sp\\u00e9cial\",\"code_article\":\"EPLGLU003\",\"price_achat\":14,\"id_categorie\":5,\"id_subcategorie\":32,\"id_local\":4,\"id_rayon\":16,\"seuil\":14,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-12-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ F \\/ EPICERIE & PRODUITS LAITIERS \\/ GLUCIDES \\/ EPLGLU003\",\"id\":467}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(703, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 468, '[]', '{\"name\":\"Sucre Vanille de 75 grs\",\"code_article\":\"EPLGLU004\",\"price_achat\":14,\"id_categorie\":5,\"id_subcategorie\":32,\"id_local\":4,\"id_rayon\":17,\"seuil\":14,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-01-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ GLUCIDES \\/ EPLGLU004\",\"id\":468}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(704, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 469, '[]', '{\"name\":\"Sucre Gout de Fleur D\'oranger\",\"code_article\":\"EPLGLU005\",\"price_achat\":14,\"id_categorie\":5,\"id_subcategorie\":32,\"id_local\":4,\"id_rayon\":17,\"seuil\":14,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-02-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ GLUCIDES \\/ EPLGLU005\",\"id\":469}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(705, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 470, '[]', '{\"name\":\"Sucre Pain de 02 kg\",\"code_article\":\"EPLGLU006\",\"price_achat\":14,\"id_categorie\":5,\"id_subcategorie\":32,\"id_local\":4,\"id_rayon\":17,\"seuil\":14,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-03-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ GLUCIDES \\/ EPLGLU006\",\"id\":470}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(706, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 471, '[]', '{\"name\":\"Caf\\u00e9 Moulu\",\"code_article\":\"EPLMOL001\",\"price_achat\":25,\"id_categorie\":5,\"id_subcategorie\":33,\"id_local\":4,\"id_rayon\":17,\"seuil\":25,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-04-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ MOLECULES \\/ EPLMOL001\",\"id\":471}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(707, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 472, '[]', '{\"name\":\"Th\\u00e9 Vert de 100 grs\",\"code_article\":\"EPLMOL002\",\"price_achat\":15,\"id_categorie\":5,\"id_subcategorie\":33,\"id_local\":4,\"id_rayon\":17,\"seuil\":15,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-05-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ MOLECULES \\/ EPLMOL002\",\"id\":472}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(708, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 473, '[]', '{\"name\":\"Pistache\",\"code_article\":\"EPLFSE001\",\"price_achat\":150,\"id_categorie\":5,\"id_subcategorie\":31,\"id_local\":4,\"id_rayon\":17,\"seuil\":150,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-06-04 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ FRUITS SECS \\/ EPLFSE001\",\"id\":473}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(709, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 474, '[]', '{\"name\":\"noix de cajou\",\"code_article\":\"EPLFSE002\",\"price_achat\":150,\"id_categorie\":5,\"id_subcategorie\":31,\"id_local\":4,\"id_rayon\":17,\"seuil\":150,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ FRUITS SECS \\/ EPLFSE002\",\"id\":474}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(710, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 475, '[]', '{\"name\":\"Cacahu\\u00e8tes\",\"code_article\":\"EPLFSE003\",\"price_achat\":150,\"id_categorie\":5,\"id_subcategorie\":31,\"id_local\":4,\"id_rayon\":17,\"seuil\":150,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ FRUITS SECS \\/ EPLFSE003\",\"id\":475}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(711, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 476, '[]', '{\"name\":\"Amandes D\\u00e9cortiqu\\u00e9es\",\"code_article\":\"EPLFSE004\",\"price_achat\":150,\"id_categorie\":5,\"id_subcategorie\":31,\"id_local\":4,\"id_rayon\":17,\"seuil\":150,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ FRUITS SECS \\/ EPLFSE004\",\"id\":476}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(712, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 477, '[]', '{\"name\":\"Amandes Effil\\u00e9es\",\"code_article\":\"EPLFSE005\",\"price_achat\":150,\"id_categorie\":5,\"id_subcategorie\":31,\"id_local\":4,\"id_rayon\":17,\"seuil\":150,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ FRUITS SECS \\/ EPLFSE005\",\"id\":477}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(713, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 478, '[]', '{\"name\":\"Amandes Concass\\u00e9s\",\"code_article\":\"EPLFSE006\",\"price_achat\":150,\"id_categorie\":5,\"id_subcategorie\":31,\"id_local\":4,\"id_rayon\":17,\"seuil\":150,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ FRUITS SECS \\/ EPLFSE006\",\"id\":478}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(714, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 479, '[]', '{\"name\":\"Dattes 1er choix\",\"code_article\":\"EPLFSE007\",\"price_achat\":150,\"id_categorie\":5,\"id_subcategorie\":31,\"id_local\":4,\"id_rayon\":17,\"seuil\":150,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ FRUITS SECS \\/ EPLFSE007\",\"id\":479}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(715, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 480, '[]', '{\"name\":\"Dattes D\\u00e9noyaut\\u00e9e\",\"code_article\":\"EPLFSE008\",\"price_achat\":150,\"id_categorie\":5,\"id_subcategorie\":31,\"id_local\":4,\"id_rayon\":17,\"seuil\":150,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ FRUITS SECS \\/ EPLFSE008\",\"id\":480}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(716, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 481, '[]', '{\"name\":\"Noix D\\u00e9cortiqu\\u00e9es\",\"code_article\":\"EPLFSE009\",\"price_achat\":150,\"id_categorie\":5,\"id_subcategorie\":31,\"id_local\":4,\"id_rayon\":17,\"seuil\":150,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-08-05 00:00:00\",\"id_tva\":1,\"id_unite\":1,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ FRUITS SECS \\/ EPLFSE009\",\"id\":481}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(717, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 482, '[]', '{\"name\":\"Huile V\\u00e9g\\u00e9tale de 01 litre\",\"code_article\":\"EPLHUI001\",\"price_achat\":25,\"id_categorie\":5,\"id_subcategorie\":34,\"id_local\":4,\"id_rayon\":17,\"seuil\":25,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-09-05 00:00:00\",\"id_tva\":1,\"id_unite\":3,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ HUILES \\/ EPLHUI001\",\"id\":482}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(718, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 483, '[]', '{\"name\":\"Huile D\'olive de 01 litre\",\"code_article\":\"EPLHUI002\",\"price_achat\":120,\"id_categorie\":5,\"id_subcategorie\":34,\"id_local\":4,\"id_rayon\":17,\"seuil\":120,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-10-05 00:00:00\",\"id_tva\":1,\"id_unite\":3,\"id_user\":1,\"emplacement\":\"ECONOMAT \\/ G \\/ EPICERIE & PRODUITS LAITIERS \\/ HUILES \\/ EPLHUI002\",\"id\":483}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(719, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 484, '[]', '{\"name\":\"Bureau en bois 0,60*0,90m avec caisson fixe \\u00e0 4 tiroirs, couleur marron\",\"code_article\":\"MOBBUR001\",\"price_achat\":2000,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":18,\"seuil\":2000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ A \\/ MOBILIER \\/ BUREAU \\/ MOBBUR001\",\"id\":484}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(720, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 485, '[]', '{\"name\":\"Bureau 1,50*0,90m avec 2 caissons fixes \\u00e0 2 tiroirs et un tiroirs au milieu, couleur marron\",\"code_article\":\"MOBBUR002\",\"price_achat\":1400,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":18,\"seuil\":1400,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ A \\/ MOBILIER \\/ BUREAU \\/ MOBBUR002\",\"id\":485}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(721, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 486, '[]', '{\"name\":\"Portrait Hassan II\",\"code_article\":\"MOBBUR003\",\"price_achat\":700,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":18,\"seuil\":700,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-04-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ A \\/ MOBILIER \\/ BUREAU \\/ MOBBUR003\",\"id\":486}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(722, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 487, '[]', '{\"name\":\"Bureau de couleur marron de Dim 1,90*0,90m\",\"code_article\":\"MOBBUR004\",\"price_achat\":2500,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":18,\"seuil\":2500,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-05-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ A \\/ MOBILIER \\/ BUREAU \\/ MOBBUR004\",\"id\":487}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(723, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 488, '[]', '{\"name\":\"Retour assorti au bureau n\\u00b006\",\"code_article\":\"MOBBUR005\",\"price_achat\":500,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":18,\"seuil\":500,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ A \\/ MOBILIER \\/ BUREAU \\/ MOBBUR005\",\"id\":488}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(724, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 489, '[]', '{\"name\":\"Table pour imprimante de Dim 0,50*0,74m\",\"code_article\":\"MOBBUR006\",\"price_achat\":500,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":18,\"seuil\":500,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ A \\/ MOBILIER \\/ BUREAU \\/ MOBBUR006\",\"id\":489}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(725, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 490, '[]', '{\"name\":\"Table ordinateur couleur blanche, dimension 0,80 x 0,80m\",\"code_article\":\"MOBBUR007\",\"price_achat\":400,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":18,\"seuil\":400,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-08-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ A \\/ MOBILIER \\/ BUREAU \\/ MOBBUR007\",\"id\":490}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(726, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 491, '[]', '{\"name\":\"Bureau en bois couleur marron\",\"code_article\":\"MOBBUR008\",\"price_achat\":1500,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":18,\"seuil\":1500,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-09-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ A \\/ MOBILIER \\/ BUREAU \\/ MOBBUR008\",\"id\":491}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(727, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 492, '[]', '{\"name\":\"Portrait de SM Hassan II, dim 0,70 X 0,60m\",\"code_article\":\"MOBBUR009\",\"price_achat\":400,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":18,\"seuil\":400,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-10-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ A \\/ MOBILIER \\/ BUREAU \\/ MOBBUR009\",\"id\":492}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(728, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 493, '[]', '{\"name\":\"Portrait de SM Hassan II, dim 45 X 55 cm\",\"code_article\":\"MOBBUR010\",\"price_achat\":400,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":18,\"seuil\":400,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-11-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ A \\/ MOBILIER \\/ BUREAU \\/ MOBBUR010\",\"id\":493}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(729, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 494, '[]', '{\"name\":\"Portrait de SM Hassan II, dim 43 x 51,5 cm\",\"code_article\":\"MOBBUR011\",\"price_achat\":400,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":19,\"seuil\":400,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-12-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ B \\/ MOBILIER \\/ BUREAU \\/ MOBBUR011\",\"id\":494}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(730, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 495, '[]', '{\"name\":\"Bureau de couleur blanche de Dim 1,60*0,80m sans caisson\",\"code_article\":\"MOBBUR015\",\"price_achat\":2600,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":19,\"seuil\":2600,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-04-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ B \\/ MOBILIER \\/ BUREAU \\/ MOBBUR015\",\"id\":495}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(731, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 496, '[]', '{\"name\":\"Table porte scanner couleur gris mouchet\\u00e9\",\"code_article\":\"MOBBUR016\",\"price_achat\":400,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":19,\"seuil\":400,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-05-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ B \\/ MOBILIER \\/ BUREAU \\/ MOBBUR016\",\"id\":496}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(732, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 497, '[]', '{\"name\":\"Table porte ordinateur couleur gris mouchet\\u00e9\",\"code_article\":\"MOBBUR017\",\"price_achat\":500,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":19,\"seuil\":500,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-06-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ B \\/ MOBILIER \\/ BUREAU \\/ MOBBUR017\",\"id\":497}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(733, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 498, '[]', '{\"name\":\"Table de r\\u00e9union de dimension 4 x 1,20m\",\"code_article\":\"MOBBUR018\",\"price_achat\":14000,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":19,\"seuil\":14000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-07-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ B \\/ MOBILIER \\/ BUREAU \\/ MOBBUR018\",\"id\":498}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(734, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 499, '[]', '{\"name\":\"Bureau 1,10 x 0,55m\",\"code_article\":\"MOBBUR019\",\"price_achat\":700,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":19,\"seuil\":700,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-08-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ B \\/ MOBILIER \\/ BUREAU \\/ MOBBUR019\",\"id\":499}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(735, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 500, '[]', '{\"name\":\"Fauteuil pr\\u00e9sident sur roulettes, dossier haut pi\\u00e9tement sur cinq branches couleur marron mouchet\\u00e9\",\"code_article\":\"MOBBUR020\",\"price_achat\":1400,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":19,\"seuil\":1400,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-09-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ B \\/ MOBILIER \\/ BUREAU \\/ MOBBUR020\",\"id\":500}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(736, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 501, '[]', '{\"name\":\"Fauteuil visiteur , dossier bas pi\\u00e9tement luge, couleur marron mouchet\\u00e9\",\"code_article\":\"MOBBUR021\",\"price_achat\":800,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":19,\"seuil\":800,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-10-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ B \\/ MOBILIER \\/ BUREAU \\/ MOBBUR021\",\"id\":501}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(737, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 502, '[]', '{\"name\":\"Table ordinateur de Dim 80 x 80 couleur Blanche\",\"code_article\":\"MOBBUR022\",\"price_achat\":500,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":19,\"seuil\":500,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-11-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ B \\/ MOBILIER \\/ BUREAU \\/ MOBBUR022\",\"id\":502}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(738, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 503, '[]', '{\"name\":\"Table de r\\u00e9union ronde de couleur grise Diam 1,20m\",\"code_article\":\"MOBBUR023\",\"price_achat\":18000,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":19,\"seuil\":18000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-12-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ B \\/ MOBILIER \\/ BUREAU \\/ MOBBUR023\",\"id\":503}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(739, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 504, '[]', '{\"name\":\"Portrait de SM Hassan II 1,14 x 0,88m\",\"code_article\":\"MOBBUR024\",\"price_achat\":500,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":19,\"seuil\":500,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-01-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ B \\/ MOBILIER \\/ BUREAU \\/ MOBBUR024\",\"id\":504}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(740, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 505, '[]', '{\"name\":\"Table basse assortie au bureau n\\u00b0 06, dim 0,66 x 0,64m\",\"code_article\":\"MOBBUR025\",\"price_achat\":450,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":19,\"seuil\":450,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-02-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ B \\/ MOBILIER \\/ BUREAU \\/ MOBBUR025\",\"id\":505}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(741, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 506, '[]', '{\"name\":\"Rayonnage en bois \\u00e0 10 \\u00e9tag\\u00e8res 1,50 x 2,26m\",\"code_article\":\"MOBBUR026\",\"price_achat\":700,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":20,\"seuil\":700,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-03-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ C \\/ MOBILIER \\/ BUREAU \\/ MOBBUR026\",\"id\":506}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(742, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 507, '[]', '{\"name\":\"Armoire  en bois \\u00e0 portes battantes avec des vitres \\u00e0 2 \\u00e9tag\\u00e8res 1,20 x 2,20m\",\"code_article\":\"MOBBUR028\",\"price_achat\":600,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":20,\"seuil\":600,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-05-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ C \\/ MOBILIER \\/ BUREAU \\/ MOBBUR028\",\"id\":507}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(743, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 508, '[]', '{\"name\":\"Rayonnage en bois \\u00e0 4 \\u00e9tag\\u00e8res 1,60 x 1,70m\",\"code_article\":\"MOBBUR029\",\"price_achat\":700,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":20,\"seuil\":700,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-06-09 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ C \\/ MOBILIER \\/ BUREAU \\/ MOBBUR029\",\"id\":508}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(744, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 509, '[]', '{\"name\":\"Portrait de SM Hassan II\",\"code_article\":\"MOBBUR030\",\"price_achat\":500,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":20,\"seuil\":500,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ C \\/ MOBILIER \\/ BUREAU \\/ MOBBUR030\",\"id\":509}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(745, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 510, '[]', '{\"name\":\"Portrait de SM Hassan II, dim 0,43 x 0,52m\",\"code_article\":\"MOBBUR032\",\"price_achat\":300,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":20,\"seuil\":300,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-03-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ C \\/ MOBILIER \\/ BUREAU \\/ MOBBUR032\",\"id\":510}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(746, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 511, '[]', '{\"name\":\"Table de bureau en bois de dim 1,50 x 0,75m sans pi\\u00e9tement\",\"code_article\":\"MOBBUR035\",\"price_achat\":400,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":20,\"seuil\":400,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-06-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ C \\/ MOBILIER \\/ BUREAU \\/ MOBBUR035\",\"id\":511}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(747, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 512, '[]', '{\"name\":\"Banquettes avec rev\\u00eatement en tissu\",\"code_article\":\"MOBBUR036\",\"price_achat\":1200,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":20,\"seuil\":1200,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-07-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ C \\/ MOBILIER \\/ BUREAU \\/ MOBBUR036\",\"id\":512}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(748, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 513, '[]', '{\"name\":\"Table basse de dim 1,20 x 0,60m\",\"code_article\":\"MOBBUR037\",\"price_achat\":350,\"id_categorie\":3,\"id_subcategorie\":11,\"id_local\":5,\"id_rayon\":20,\"seuil\":350,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-08-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ C \\/ MOBILIER \\/ BUREAU \\/ MOBBUR037\",\"id\":513}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(749, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 514, '[]', '{\"name\":\"Chaise m\\u00e9tallique en ska\\u00ef noir fixe sur 4 pieds \\\"Hilton\\\"\",\"code_article\":\"MOBMET001\",\"price_achat\":250,\"id_categorie\":3,\"id_subcategorie\":12,\"id_local\":5,\"id_rayon\":21,\"seuil\":250,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-09-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ D \\/ MOBILIER \\/ METALLIQUE \\/ MOBMET001\",\"id\":514}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(750, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 515, '[]', '{\"name\":\"Clapet \\u00e0 10 cases\",\"code_article\":\"MOBMET002\",\"price_achat\":800,\"id_categorie\":3,\"id_subcategorie\":12,\"id_local\":5,\"id_rayon\":21,\"seuil\":800,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-10-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ D \\/ MOBILIER \\/ METALLIQUE \\/ MOBMET002\",\"id\":515}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(751, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 516, '[]', '{\"name\":\"Rayonnage  m\\u00e9tallique \\u00e0 4 \\u00e9tag\\u00e8res de Dim 1,80 x 1,90m\",\"code_article\":\"MOBMET003\",\"price_achat\":500,\"id_categorie\":3,\"id_subcategorie\":12,\"id_local\":5,\"id_rayon\":21,\"seuil\":500,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-11-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ D \\/ MOBILIER \\/ METALLIQUE \\/ MOBMET003\",\"id\":516}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(752, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 517, '[]', '{\"name\":\"Rayonnage m\\u00e9tallique \\u00e0 4 \\u00e9tag\\u00e8res de Dim 1,95 x 1,20m\",\"code_article\":\"MOBMET004\",\"price_achat\":500,\"id_categorie\":3,\"id_subcategorie\":12,\"id_local\":5,\"id_rayon\":21,\"seuil\":500,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-12-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ D \\/ MOBILIER \\/ METALLIQUE \\/ MOBMET004\",\"id\":517}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(753, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 518, '[]', '{\"name\":\"Clapet de 5 cases\",\"code_article\":\"MOBMET005\",\"price_achat\":600,\"id_categorie\":3,\"id_subcategorie\":12,\"id_local\":5,\"id_rayon\":21,\"seuil\":600,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-01-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE  MOBILIER DE BUREAU \\/ D \\/ MOBILIER \\/ METALLIQUE \\/ MOBMET005\",\"id\":518}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(754, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 519, '[]', '{\"name\":\"Chaises avec tablettes \\u00e9critoires semi-m\\u00e9talliques\",\"code_article\":\"MOBSCO001\",\"price_achat\":250,\"id_categorie\":3,\"id_subcategorie\":13,\"id_local\":10,\"id_rayon\":37,\"seuil\":250,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-02-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER SCOLAIRE \\/ D \\/ MOBILIER \\/ SCOLAIRE \\/ MOBSCO001\",\"id\":519}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(755, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 520, '[]', '{\"name\":\"Tapis R\'bati de couleur marron, dimension 3,50m x 2,50m\",\"code_article\":\"MOBRES001\",\"price_achat\":15000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":35,\"seuil\":15000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-03-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ A \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES001\",\"id\":520}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(756, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 521, '[]', '{\"name\":\"Table cendrier en bois scult\\u00e9\",\"code_article\":\"MOBRES002\",\"price_achat\":5000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":35,\"seuil\":5000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-04-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ A \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES002\",\"id\":521}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(757, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 522, '[]', '{\"name\":\"Tapis R\'b\\u00e2ti couleur rouge, de dim 6,10 x 4,04m\",\"code_article\":\"MOBRES003\",\"price_achat\":30000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":35,\"seuil\":30000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-05-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ A \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES003\",\"id\":522}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(758, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 523, '[]', '{\"name\":\"Tapis R\'b\\u00e2ti couleur rouge, de dim 5,60 x 2,93m\",\"code_article\":\"MOBRES004\",\"price_achat\":27000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":35,\"seuil\":27000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-06-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ A \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES004\",\"id\":523}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(759, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 524, '[]', '{\"name\":\"Tapis R\'b\\u00e2ti couleur rouge, de dim 5,48 x 2,59m\",\"code_article\":\"MOBRES005\",\"price_achat\":20000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":35,\"seuil\":20000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-07-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ A \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES005\",\"id\":524}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(760, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 525, '[]', '{\"name\":\"Tapis R\'b\\u00e2ti couleur rouge, de dim 2,10 x 1,51m\",\"code_article\":\"MOBRES006\",\"price_achat\":17000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":35,\"seuil\":17000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-08-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ A \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES006\",\"id\":525}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(761, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 526, '[]', '{\"name\":\"Tapis R\'b\\u00e2ti couleur rouge, de dim 2,20 x 1,50m\",\"code_article\":\"MOBRES007\",\"price_achat\":17000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":35,\"seuil\":17000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-09-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ A \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES007\",\"id\":526}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(762, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 527, '[]', '{\"name\":\"Tapis R\'b\\u00e2ti couleur rouge, de dim 1,80 x 1,49m\",\"code_article\":\"MOBRES008\",\"price_achat\":17000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":35,\"seuil\":17000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-10-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ A \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES008\",\"id\":527}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(763, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 528, '[]', '{\"name\":\"Tapis R\'b\\u00e2ti couleur rouge, de dim 2,52 x 1,66m\",\"code_article\":\"MOBRES009\",\"price_achat\":17000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":35,\"seuil\":17000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-11-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ A \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES009\",\"id\":528}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(764, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 529, '[]', '{\"name\":\"Table sculpt\\u00e9es, dim 1,13m \\u00e0 6 pieds sans roulettes\",\"code_article\":\"MOBRES010\",\"price_achat\":7000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":35,\"seuil\":7000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2028-12-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ A \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES010\",\"id\":529}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(765, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 530, '[]', '{\"name\":\"Cendriers sculpt\\u00e9, dim 0,47 x 0,38 x 0,49 m\",\"code_article\":\"MOBRES011\",\"price_achat\":4000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":35,\"seuil\":4000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-01-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ A \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES011\",\"id\":530}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(766, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 531, '[]', '{\"name\":\"Chaises tapiss\\u00e9es traditionnelle avec motif artisanaux sur bois\",\"code_article\":\"MOBRES012\",\"price_achat\":1000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":35,\"seuil\":1000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-02-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ A \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES012\",\"id\":531}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(767, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 532, '[]', '{\"name\":\"Table sculpt\\u00e9e, dim 1,14m \\u00e0 6 pieds\",\"code_article\":\"MOBRES013\",\"price_achat\":8000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":35,\"seuil\":8000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-03-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ A \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES013\",\"id\":532}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29');
INSERT INTO `audits` (`id`, `user_type`, `user_id`, `event`, `auditable_type`, `auditable_id`, `old_values`, `new_values`, `url`, `ip_address`, `user_agent`, `tags`, `created_at`, `updated_at`) VALUES
(768, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 533, '[]', '{\"name\":\"Table sculpt\\u00e9e, dim 0,99m \\u00e0 5 pieds sur roulettes\",\"code_article\":\"MOBRES014\",\"price_achat\":6000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":36,\"seuil\":6000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-04-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ B \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES014\",\"id\":533}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(769, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 534, '[]', '{\"name\":\"Table sculpt\\u00e9e, dim 1,10m \\u00e0 5 pieds sur roulettes\",\"code_article\":\"MOBRES015\",\"price_achat\":6000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":36,\"seuil\":6000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-05-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ B \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES015\",\"id\":534}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(770, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 535, '[]', '{\"name\":\"Table sculpt\\u00e9e, dim 1,10m \\u00e0 6 pieds sur roulettes\",\"code_article\":\"MOBRES016\",\"price_achat\":7000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":36,\"seuil\":7000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-06-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ B \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES016\",\"id\":535}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(771, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 536, '[]', '{\"name\":\"Tapis R\'b\\u00e2ti couleur marron,  de dim 4,10 x 2,90m\",\"code_article\":\"MOBRES017\",\"price_achat\":12000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":36,\"seuil\":12000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2029-07-10 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ B \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES017\",\"id\":536}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(772, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 537, '[]', '{\"name\":\"Tapis R\'b\\u00e2ti couleur marron-beige 4,20 x 3,00m\",\"code_article\":\"MOBRES018\",\"price_achat\":12000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":36,\"seuil\":12000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-01-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ B \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES018\",\"id\":537}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(773, 'App\\Models\\User', 1, 'created', 'App\\Models\\Product', 538, '[]', '{\"name\":\"Tapis R\'b\\u00e2ti couleur bleu de dim 3,65 x 2,50m\",\"code_article\":\"MOBRES019\",\"price_achat\":10000,\"id_categorie\":3,\"id_subcategorie\":14,\"id_local\":9,\"id_rayon\":36,\"seuil\":10000,\"code_barre\":null,\"photo\":null,\"date_expiration\":\"2027-02-11 00:00:00\",\"id_tva\":1,\"id_unite\":6,\"id_user\":1,\"emplacement\":\"RESERVE MOBILIER DE CUISINE & RESTAURATION \\/ B \\/ MOBILIER \\/ RESTAURATION \\/ MOBRES019\",\"id\":538}', 'https://skyblue-rat-607542.hostingersite.com/importProduct', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:24:29', '2025-11-24 08:24:29'),
(774, 'App\\Models\\User', 21, 'created', 'App\\Models\\Vente', 3, '[]', '{\"numero_serie\":\"3\",\"total\":735,\"status\":\"Cr\\u00e9ation\",\"type_commande\":\"Alimentaire\",\"type_menu\":\"Menu eleves\",\"id_formateur\":\"21\",\"id_user\":21,\"eleves\":\"0\",\"personnel\":\"0\",\"invites\":\"0\",\"divers\":\"0\",\"entree\":null,\"plat_principal\":null,\"accompagnement\":null,\"dessert\":null,\"date_usage\":null,\"id\":3}', 'https://skyblue-rat-607542.hostingersite.com/StoreVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:25:49', '2025-11-24 08:25:49'),
(775, 'App\\Models\\User', 22, 'created', 'App\\Models\\Vente', 4, '[]', '{\"numero_serie\":\"1\",\"total\":2060,\"status\":\"Cr\\u00e9ation\",\"type_commande\":\"Non Alimentaire\",\"type_menu\":null,\"id_formateur\":\"22\",\"id_user\":22,\"eleves\":0,\"personnel\":0,\"invites\":0,\"divers\":0,\"entree\":null,\"plat_principal\":null,\"accompagnement\":null,\"dessert\":null,\"date_usage\":\"2025-11-28 00:00:00\",\"id\":4}', 'https://skyblue-rat-607542.hostingersite.com/StoreVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:28:06', '2025-11-24 08:28:06'),
(776, 'App\\Models\\User', 6, 'updated', 'App\\Models\\Vente', 4, '{\"status\":\"Cr\\u00e9ation\"}', '{\"status\":\"Visa Charg\\u00e9\"}', 'https://skyblue-rat-607542.hostingersite.com/UpdateVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:29:17', '2025-11-24 08:29:17'),
(777, 'App\\Models\\User', 2, 'updated', 'App\\Models\\Vente', 4, '{\"status\":\"Visa Charg\\u00e9\"}', '{\"status\":\"Visa \\u00c9conome\"}', 'https://skyblue-rat-607542.hostingersite.com/UpdateVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:29:50', '2025-11-24 08:29:50'),
(778, 'App\\Models\\User', 10, 'updated', 'App\\Models\\Vente', 4, '{\"status\":\"Visa \\u00c9conome\"}', '{\"status\":\"Livraison\"}', 'https://skyblue-rat-607542.hostingersite.com/UpdateVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:30:45', '2025-11-24 08:30:45'),
(779, 'App\\Models\\User', 22, 'deleted', 'App\\Models\\Vente', 4, '{\"id\":4,\"numero_serie\":1,\"total\":\"2060.00\",\"status\":\"Livraison\",\"type_commande\":\"Non Alimentaire\",\"type_menu\":null,\"id_client\":null,\"id_formateur\":22,\"is_transfer\":0,\"eleves\":0,\"personnel\":0,\"invites\":0,\"divers\":0,\"entree\":null,\"plat_principal\":null,\"accompagnement\":null,\"dessert\":null,\"date_usage\":\"2025-11-28\",\"motif_refus\":null,\"id_user\":22}', '[]', 'https://skyblue-rat-607542.hostingersite.com/DeleteVente', '105.74.12.204', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36 Edg/142.0.0.0', NULL, '2025-11-24 08:31:41', '2025-11-24 08:31:41'),
(780, 'App\\Models\\User', 1, 'created', 'App\\Models\\Perte', 6, '[]', '{\"nature\":\"produit fini\",\"date_perte\":\"2025-11-20\",\"cause\":\"Cause\",\"circonstances\":\"Circonstances\",\"status\":\"En attente\",\"id_user\":1,\"reference\":\"PSAL005-112025\\/PF\",\"numero_serie\":5,\"id_category\":null,\"id_subcategorie\":null,\"classe\":null,\"id_product\":null,\"id_plat\":57,\"id_unite\":null,\"designation\":\"Chorba\",\"quantite\":0,\"produit_fini_type\":\"Entr\\u00e9e\",\"nombre_plats\":\"1\",\"cout_total\":15.15,\"n_inv\":null,\"id\":6}', 'https://skyblue-rat-607542.hostingersite.com/addPerte', '102.97.204.91', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-24 13:01:35', '2025-11-24 13:01:35'),
(781, 'App\\Models\\User', 1, 'deleted', 'App\\Models\\Perte', 6, '{\"id\":6,\"id_product\":null,\"id_category\":null,\"id_subcategorie\":null,\"id_unite\":null,\"id_plat\":\"57\",\"classe\":null,\"designation\":\"Chorba\",\"quantite\":\"0.00\",\"nature\":\"produit fini\",\"date_perte\":\"2025-11-20\",\"cause\":\"Cause\",\"status\":\"En attente\",\"refusal_reason\":null,\"produit_fini_type\":\"Entr\\u00e9e\",\"nombre_plats\":1,\"cout_total\":\"15.15\",\"id_user\":1,\"circonstances\":\"Circonstances\",\"reference\":\"PSAL005-112025\\/PF\",\"numero_serie\":5,\"n_inv\":null}', '[]', 'https://skyblue-rat-607542.hostingersite.com/deletePerte', '102.97.204.91', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/141.0.0.0 Safari/537.36', NULL, '2025-11-24 13:01:44', '2025-11-24 13:01:44'),
(782, 'App\\Models\\User', 34, 'updated', 'App\\Models\\User', 34, '{\"nom\":\"BELLAMLIH\"}', '{\"nom\":\"BELLEMLIH\"}', 'https://skyblue-rat-607542.hostingersite.com/updateProfile', '197.153.94.223', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36', NULL, '2025-11-25 23:21:58', '2025-11-25 23:21:58'),
(783, 'App\\Models\\User', 22, 'updated', 'App\\Models\\Vente', 3, '{\"status\":\"Cr\\u00e9ation\"}', '{\"status\":\"Refus\"}', 'https://skyblue-rat-607542.hostingersite.com/Command', '154.144.252.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:145.0) Gecko/20100101 Firefox/145.0', NULL, '2025-11-26 08:41:21', '2025-11-26 08:41:21'),
(784, 'App\\Models\\User', 22, 'created', 'App\\Models\\Vente', 5, '[]', '{\"numero_serie\":\"4\",\"total\":808.5,\"status\":\"Cr\\u00e9ation\",\"type_commande\":\"Alimentaire\",\"type_menu\":\"Menu eleves\",\"id_formateur\":\"22\",\"id_user\":22,\"eleves\":\"100\",\"personnel\":\"20\",\"invites\":\"10\",\"divers\":\"0\",\"entree\":\"36\",\"plat_principal\":\"7\",\"accompagnement\":null,\"dessert\":\"3\",\"date_usage\":\"2025-11-28 00:00:00\",\"id\":5}', 'https://skyblue-rat-607542.hostingersite.com/StoreVente', '154.144.252.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:145.0) Gecko/20100101 Firefox/145.0', NULL, '2025-11-26 08:42:49', '2025-11-26 08:42:49');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel_cache_chafiam1973@gmail.com|154.144.252.90', 'i:1;', 1764080605),
('laravel_cache_chafiam1973@gmail.com|154.144.252.90:timer', 'i:1764080605;', 1764080605),
('laravel_cache_labaaj@tourisme.gov.ma|105.156.164.32', 'i:1;', 1763967897),
('laravel_cache_labaaj@tourisme.gov.ma|105.156.164.32:timer', 'i:1763967897;', 1763967897),
('laravel_cache_labaaj@tourisme.gov.ma|105.74.12.204', 'i:1;', 1763970937),
('laravel_cache_labaaj@tourisme.gov.ma|105.74.12.204:timer', 'i:1763970937;', 1763970937),
('laravel_cache_spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:76:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:8:\"Products\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:9:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:7;i:5;i:8;i:6;i:9;i:7;i:10;i:8;i:11;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:15:\"Products-ajoute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:7;i:3;i:11;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:17:\"Products-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:7;i:3;i:11;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:18:\"Products-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:7;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:5:\"Taxes\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:12:\"Taxes-ajoute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:14:\"Taxes-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:15:\"Taxes-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:12:\"Fournisseurs\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:19:\"Fournisseurs-ajoute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:21:\"Fournisseurs-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:22:\"Fournisseurs-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:10:\"Categories\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:17:\"Categories-ajoute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:19:\"Categories-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:20:\"Categories-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:5:\"Local\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:12:\"Local-ajoute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:14:\"Local-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:15:\"Local-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:5:\"Rayon\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:12:\"Rayon-ajoute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:14:\"Rayon-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:15:\"Rayon-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:7:\"Famille\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:14:\"Famille-ajoute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:16:\"Famille-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:17:\"Famille-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:5:\"Achat\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:12:\"Achat-ajoute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:14:\"Achat-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:15:\"Achat-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:8:\"Commande\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:9:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:7;i:5;i:8;i:6;i:9;i:7;i:10;i:8;i:11;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:15:\"Commande-ajoute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:9:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:7;i:5;i:8;i:6;i:9;i:7;i:10;i:8;i:11;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:17:\"Commande-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:8:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:7;i:5;i:8;i:6;i:10;i:7;i:11;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:18:\"Commande-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:4:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:7;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:10:\"Historique\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:9;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:17:\"Historique-Export\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:18:\"Historique-montrer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:9;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:6:\"Unité\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:13:\"Unité-ajoute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:15:\"Unité-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:11;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:16:\"Unité-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:11:\"utilisateur\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:18:\"utilisateur-ajoute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:20:\"utilisateur-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:21:\"utilisateur-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:6:\"rôles\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:13:\"rôles-ajoute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:11:\"rôles-voir\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:15:\"rôles-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:16:\"rôles-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:15:\"Transfer-ajoute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:10;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:17:\"Transfer-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:10;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:18:\"Transfer-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:8:\"Transfer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:10;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:5:\"Stock\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:8:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:7;i:5;i:8;i:6;i:10;i:7;i:11;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:6:\"retour\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:10;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:14:\"retour-ajouter\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:10;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:15:\"retour-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:10;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:16:\"retour-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:3;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:10:\"Inventaire\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:7;i:5;i:8;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:17:\"Voir-Consommation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:7;i:4;i:8;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:27:\"Voir-Consommation-Complète\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:7;i:4;i:8;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:33:\"Voir-Rapport-Mensuel-Consommation\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:7;i:4;i:8;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:20:\"Voir-Stock-Demandeur\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:7;i:4;i:8;}}i:66;a:4:{s:1:\"a\";i:67;s:1:\"b\";s:14:\"Pertes-ajouter\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:7;i:5;i:8;}}i:67;a:4:{s:1:\"a\";i:68;s:1:\"b\";s:15:\"Pertes-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:7;i:5;i:8;}}i:68;a:4:{s:1:\"a\";i:69;s:1:\"b\";s:16:\"Pertes-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:2:{i:0;i:1;i:1;i:2;}}i:69;a:4:{s:1:\"a\";i:70;s:1:\"b\";s:14:\"Pertes-valider\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:5:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:7;i:4;i:8;}}i:70;a:4:{s:1:\"a\";i:71;s:1:\"b\";s:11:\"Pertes-voir\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:6:{i:0;i:1;i:1;i:2;i:2;i:3;i:3;i:4;i:4;i:7;i:5;i:8;}}i:71;a:4:{s:1:\"a\";i:72;s:1:\"b\";s:5:\"Plats\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:72;a:4:{s:1:\"a\";i:73;s:1:\"b\";s:11:\"Plats-liste\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:73;a:4:{s:1:\"a\";i:74;s:1:\"b\";s:12:\"Plats-ajoute\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:74;a:4:{s:1:\"a\";i:75;s:1:\"b\";s:14:\"Plats-modifier\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}i:75;a:4:{s:1:\"a\";i:76;s:1:\"b\";s:15:\"Plats-supprimer\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:3:{i:0;i:1;i:1;i:2;i:2;i:4;}}}s:5:\"roles\";a:9:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:14:\"Administrateur\";s:1:\"c\";s:3:\"web\";}i:1;a:3:{s:1:\"a\";i:2;s:1:\"b\";s:8:\"Économe\";s:1:\"c\";s:3:\"web\";}i:2;a:3:{s:1:\"a\";i:3;s:1:\"b\";s:10:\"Magasinier\";s:1:\"c\";s:3:\"web\";}i:3;a:3:{s:1:\"a\";i:4;s:1:\"b\";s:9:\"Formateur\";s:1:\"c\";s:3:\"web\";}i:4;a:3:{s:1:\"a\";i:7;s:1:\"b\";s:21:\"Directeur des études\";s:1:\"c\";s:3:\"web\";}i:5;a:3:{s:1:\"a\";i:8;s:1:\"b\";s:20:\"Chargé d\'inventaire\";s:1:\"c\";s:3:\"web\";}i:6;a:3:{s:1:\"a\";i:9;s:1:\"b\";s:11:\"Utilisateur\";s:1:\"c\";s:3:\"web\";}i:7;a:3:{s:1:\"a\";i:10;s:1:\"b\";s:12:\"Gestionnaire\";s:1:\"c\";s:3:\"web\";}i:8;a:3:{s:1:\"a\";i:11;s:1:\"b\";s:15:\"Agent de saisie\";s:1:\"c\";s:3:\"web\";}}}', 1764166539);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `classe` varchar(255) DEFAULT NULL,
  `iduser` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `classe`, `iduser`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'MATERIEL', 'NON ALIMENTAIRE', 1, '2025-11-23 09:30:14', '2025-11-23 09:30:14', NULL),
(2, 'OUTILLAGE', 'NON ALIMENTAIRE', 1, '2025-11-23 09:30:14', '2025-11-23 09:30:14', NULL),
(3, 'MOBILIER', 'NON ALIMENTAIRE', 1, '2025-11-23 09:30:14', '2025-11-23 09:30:14', NULL),
(4, 'FOURNITURE', 'NON ALIMENTAIRE', 1, '2025-11-23 09:30:14', '2025-11-23 09:30:14', NULL),
(5, 'EPICERIE & PRODUITS LAITIERS', 'DENREES ALIMENTAIRES', 1, '2025-11-23 09:30:14', '2025-11-23 09:30:14', NULL),
(6, 'LEGUMES & FRUITS', 'DENREES ALIMENTAIRES', 1, '2025-11-23 09:30:14', '2025-11-23 09:30:14', NULL),
(7, 'POISSON FRAIS', 'DENREES ALIMENTAIRES', 1, '2025-11-23 09:30:14', '2025-11-23 09:30:14', NULL),
(8, 'VIANDES ABATS', 'DENREES ALIMENTAIRES', 1, '2025-11-23 09:30:14', '2025-11-23 09:30:14', NULL),
(9, 'VOLAILLES ET ŒUFS', 'DENREES ALIMENTAIRES', 1, '2025-11-23 09:30:14', '2025-11-23 09:30:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `Telephone` varchar(255) NOT NULL,
  `iduser` bigint(20) UNSIGNED NOT NULL,
  `Email` varchar(255) NOT NULL,
  `Matricule` varchar(255) NOT NULL,
  `Fonction` enum('Directrice','Econome','Cadre Administratif','Assistante de Direction','Formateur','Administrateur') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `consumption_product_details`
--

CREATE TABLE `consumption_product_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consumption_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `ligne_vente_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ligne_achat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL,
  `tva_rate` decimal(5,2) NOT NULL DEFAULT 0.00,
  `tva_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `consumption_product_details`
--

INSERT INTO `consumption_product_details` (`id`, `consumption_id`, `product_id`, `ligne_vente_id`, `ligne_achat_id`, `quantity`, `unit_price`, `tva_rate`, `tva_amount`, `total_price`, `created_at`, `updated_at`) VALUES
(1, 1, 25, 1, NULL, 0.54, 13.00, 0.00, 0.00, 7.02, '2025-11-25 23:26:59', '2025-11-25 23:26:59'),
(2, 1, 126, 2, NULL, 3.60, 15.00, 0.00, 0.00, 54.00, '2025-11-25 23:26:59', '2025-11-25 23:26:59'),
(3, 1, 116, 3, NULL, 5.40, 15.00, 0.00, 0.00, 81.00, '2025-11-25 23:26:59', '2025-11-25 23:26:59'),
(4, 1, 118, 4, NULL, 7.20, 15.00, 0.00, 0.00, 108.00, '2025-11-25 23:26:59', '2025-11-25 23:26:59'),
(5, 1, 84, 5, NULL, 0.09, 15.00, 0.00, 0.00, 1.35, '2025-11-25 23:26:59', '2025-11-25 23:26:59'),
(6, 1, 102, 6, NULL, 0.45, 15.00, 0.00, 0.00, 6.75, '2025-11-25 23:26:59', '2025-11-25 23:26:59'),
(7, 2, 102, 7, NULL, 2.00, 15.00, 0.00, 0.00, 30.00, '2025-11-25 23:26:59', '2025-11-25 23:26:59'),
(8, 2, 84, 8, NULL, 2.00, 15.00, 0.00, 0.00, 30.00, '2025-11-25 23:26:59', '2025-11-25 23:26:59'),
(9, 2, 102, 9, NULL, 2.00, 15.00, 0.00, 0.00, 30.00, '2025-11-25 23:26:59', '2025-11-25 23:26:59');

-- --------------------------------------------------------

--
-- Table structure for table `daily_consumption`
--

CREATE TABLE `daily_consumption` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `consumption_date` date NOT NULL,
  `vente_id` bigint(20) UNSIGNED DEFAULT NULL,
  `achat_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type_commande` varchar(255) DEFAULT NULL,
  `type_menu` varchar(255) DEFAULT NULL,
  `total_people` int(11) NOT NULL DEFAULT 0,
  `total_cost` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_tva` decimal(10,2) NOT NULL DEFAULT 0.00,
  `average_cost_per_person` decimal(10,2) NOT NULL DEFAULT 0.00,
  `category_costs` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`category_costs`)),
  `eleves` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `personnel` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `invites` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `divers` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `type` enum('entree','sortie') NOT NULL DEFAULT 'sortie',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `daily_consumption`
--

INSERT INTO `daily_consumption` (`id`, `consumption_date`, `vente_id`, `achat_id`, `type_commande`, `type_menu`, `total_people`, `total_cost`, `total_tva`, `average_cost_per_person`, `category_costs`, `eleves`, `personnel`, `invites`, `divers`, `type`, `created_at`, `updated_at`) VALUES
(1, '2025-11-24', 1, NULL, 'Alimentaire', 'Menu eleves', 18, 258.12, 0.00, 14.34, '{\"5\":{\"id\":5,\"name\":\"EPICERIE & PRODUITS LAITIERS\",\"total_cost\":7.0200000000000005,\"total_tva\":0},\"6\":{\"id\":6,\"name\":\"LEGUMES & FRUITS\",\"total_cost\":251.1,\"total_tva\":0}}', 18, 0, 0, 0, 'sortie', '2025-11-25 23:26:59', '2025-11-25 23:26:59'),
(2, '2025-11-24', 2, NULL, 'Alimentaire', 'Menu specials', 20, 90.00, 0.00, 4.50, '{\"6\":{\"id\":6,\"name\":\"LEGUMES & FRUITS\",\"total_cost\":90,\"total_tva\":0}}', 20, 0, 0, 0, 'sortie', '2025-11-25 23:26:59', '2025-11-25 23:26:59');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fournisseurs`
--

CREATE TABLE `fournisseurs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `entreprise` varchar(255) NOT NULL,
  `Telephone` varchar(255) NOT NULL,
  `iduser` bigint(20) UNSIGNED NOT NULL,
  `Email` varchar(255) NOT NULL,
  `ICE` varchar(255) DEFAULT NULL,
  `siege_social` varchar(255) DEFAULT NULL,
  `RC` varchar(255) DEFAULT NULL,
  `Patente` varchar(255) DEFAULT NULL,
  `IF` varchar(255) DEFAULT NULL,
  `CNSS` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `fournisseurs`
--

INSERT INTO `fournisseurs` (`id`, `entreprise`, `Telephone`, `iduser`, `Email`, `ICE`, `siege_social`, `RC`, `Patente`, `IF`, `CNSS`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'FSM BUILDING', '0666259359', 1, 'rbenchtoukia@gmail.com', '392516342689156', 'BD SEBTA LOT FADL ALLAH 1 RUE RES MAJORELLE 1 IMM APPRT 7 ETG 2 , MOHAMMEDIA', '36258', '39502156', NULL, NULL, '2025-11-23 09:31:28', '2025-11-23 09:31:28', NULL),
(2, 'STE HASNA FOURNITURE NEGOCE', '0522240160', 1, 'hasnafourniture@gmail.com', '364556342685468', '24 Rue Dax Roche Noire, Casablanca', '41256', '1600043', NULL, NULL, '2025-11-23 09:31:28', '2025-11-23 09:31:28', NULL),
(3, 'ULPRESS BUREAU', '0661939113', 1, 'ayoubaitcheraa@gmail.com', '392516342688912', '147 BD LA RESISTANCE RES AFA ETAGE 2 APT 22 - CASA, Casablanca', '21659', '3265060', NULL, NULL, '2025-11-23 09:31:28', '2025-11-23 09:31:28', NULL),
(4, 'STE MOBILIECTRO', '0661363946', 1, 'mobilieelectro@gmail.com', '366516342689123', '359 BUREAU N°5 ETAGE 2 LOT MASSAR MARRAKECH, MARRAKECH', '15152', '640094', NULL, NULL, '2025-11-23 09:31:28', '2025-11-23 09:31:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hostorique_sig`
--

CREATE TABLE `hostorique_sig` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `signature` text DEFAULT NULL,
  `iduser` bigint(20) UNSIGNED DEFAULT NULL,
  `idvente` bigint(20) UNSIGNED DEFAULT NULL,
  `status` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hostorique_sig`
--

INSERT INTO `hostorique_sig` (`id`, `signature`, `iduser`, `idvente`, `status`, `created_at`, `updated_at`) VALUES
(1, 'images/signatures/signature_34_1763970001.png', 34, 1, 'Création', '2025-11-24 08:06:14', '2025-11-24 08:06:14'),
(2, 'images/signatures/signature_3_1763971659.png', 3, 1, 'Visa Directeur', '2025-11-24 08:08:08', '2025-11-24 08:08:08'),
(3, 'images/signatures/signature_2_1763971727.png', 2, 1, 'Visa Économe', '2025-11-24 08:09:01', '2025-11-24 08:09:01'),
(4, 'images/signatures/signature_10_1763971772.png', 10, 1, 'Livraison', '2025-11-24 08:10:08', '2025-11-24 08:10:08'),
(5, 'images/signatures/signature_34_1763970001.png', 34, 1, 'Validation', '2025-11-24 08:11:45', '2025-11-24 08:11:45'),
(6, 'images/signatures/signature_34_1763970001.png', 34, 2, 'Création', '2025-11-24 08:13:23', '2025-11-24 08:13:23'),
(7, 'images/signatures/signature_3_1763971659.png', 3, 2, 'Visa Directeur', '2025-11-24 08:14:06', '2025-11-24 08:14:06'),
(8, 'images/signatures/signature_2_1763971727.png', 2, 2, 'Visa Économe', '2025-11-24 08:14:35', '2025-11-24 08:14:35'),
(9, 'images/signatures/signature_1_1763971632.png', 1, 2, 'Réception', '2025-11-24 08:16:00', '2025-11-24 08:16:00'),
(10, 'images/signatures/signature_2_1763971727.png', 2, 2, 'Visé', '2025-11-24 08:17:33', '2025-11-24 08:17:33'),
(11, 'images/signatures/signature_10_1763971772.png', 10, 2, 'Livraison', '2025-11-24 08:18:07', '2025-11-24 08:18:07'),
(12, 'images/signatures/signature_34_1763970001.png', 34, 2, 'Validation', '2025-11-24 08:19:02', '2025-11-24 08:19:02'),
(13, NULL, 21, 3, 'Création', '2025-11-24 08:25:49', '2025-11-24 08:25:49'),
(14, NULL, 22, 4, 'Création', '2025-11-24 08:28:06', '2025-11-24 08:28:06'),
(15, 'images/signatures/signature_6_1763972946.png', 6, 4, 'Visa Chargé', '2025-11-24 08:29:17', '2025-11-24 08:29:17'),
(16, 'images/signatures/signature_2_1763971727.png', 2, 4, 'Visa Économe', '2025-11-24 08:29:50', '2025-11-24 08:29:50'),
(17, 'images/signatures/signature_10_1763971772.png', 10, 4, 'Livraison', '2025-11-24 08:30:45', '2025-11-24 08:30:45'),
(18, 'images/signatures/signature_22_1763972898.png', 22, 5, 'Création', '2025-11-26 08:42:49', '2025-11-26 08:42:49');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

CREATE TABLE `inventories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `entree` decimal(10,2) NOT NULL DEFAULT 0.00,
  `sortie` decimal(10,2) NOT NULL DEFAULT 0.00,
  `reste` decimal(10,2) NOT NULL,
  `prix_unitaire` decimal(10,2) DEFAULT NULL,
  `id_achat` bigint(20) UNSIGNED DEFAULT NULL,
  `id_vente` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `product_id`, `date`, `entree`, `sortie`, `reste`, `prix_unitaire`, `id_achat`, `id_vente`, `created_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 25, '2025-11-24', 0.00, 0.54, 99.46, 13.00, NULL, 1, 34, '2025-11-24 08:11:45', '2025-11-24 08:11:45', NULL),
(2, 126, '2025-11-24', 0.00, 3.60, 46.40, 15.00, NULL, 1, 34, '2025-11-24 08:11:45', '2025-11-24 08:11:45', NULL),
(3, 116, '2025-11-24', 0.00, 5.40, 44.60, 15.00, NULL, 1, 34, '2025-11-24 08:11:45', '2025-11-24 08:11:45', NULL),
(4, 118, '2025-11-24', 0.00, 7.20, 42.80, 15.00, NULL, 1, 34, '2025-11-24 08:11:45', '2025-11-24 08:11:45', NULL),
(5, 84, '2025-11-24', 0.00, 0.09, 49.91, 15.00, NULL, 1, 34, '2025-11-24 08:11:45', '2025-11-24 08:11:45', NULL),
(6, 102, '2025-11-24', 0.00, 0.45, 49.55, 15.00, NULL, 1, 34, '2025-11-24 08:11:45', '2025-11-24 08:11:45', NULL),
(7, 102, '2025-11-24', 0.00, 2.00, 45.55, 15.00, NULL, 2, 34, '2025-11-24 08:19:02', '2025-11-24 08:19:02', NULL),
(8, 84, '2025-11-24', 0.00, 2.00, 47.91, 15.00, NULL, 2, 34, '2025-11-24 08:19:02', '2025-11-24 08:19:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventory_monthly_summaries`
--

CREATE TABLE `inventory_monthly_summaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `total_entrees` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_sorties` decimal(10,2) NOT NULL DEFAULT 0.00,
  `end_stock` decimal(10,2) NOT NULL,
  `average_price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_monthly_summaries`
--

INSERT INTO `inventory_monthly_summaries` (`id`, `product_id`, `year`, `month`, `total_entrees`, `total_sorties`, `end_stock`, `average_price`, `created_at`, `updated_at`) VALUES
(1, 25, 2025, 11, 0.00, 0.54, 99.46, 13.00, '2025-11-24 08:11:45', '2025-11-24 08:11:45'),
(2, 126, 2025, 11, 0.00, 3.60, 46.40, 15.00, '2025-11-24 08:11:45', '2025-11-24 08:11:45'),
(3, 116, 2025, 11, 0.00, 5.40, 44.60, 15.00, '2025-11-24 08:11:45', '2025-11-24 08:11:45'),
(4, 118, 2025, 11, 0.00, 7.20, 42.80, 15.00, '2025-11-24 08:11:45', '2025-11-24 08:11:45'),
(5, 84, 2025, 11, 0.00, 2.09, 47.91, 15.00, '2025-11-24 08:11:45', '2025-11-24 08:19:02'),
(6, 102, 2025, 11, 0.00, 2.45, 45.55, 15.00, '2025-11-24 08:11:45', '2025-11-24 08:19:02');

-- --------------------------------------------------------

--
-- Table structure for table `inventory_yearly_summaries`
--

CREATE TABLE `inventory_yearly_summaries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `year` int(11) NOT NULL,
  `total_entrees` decimal(10,2) NOT NULL DEFAULT 0.00,
  `total_sorties` decimal(10,2) NOT NULL DEFAULT 0.00,
  `end_stock` decimal(10,2) NOT NULL,
  `average_price` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `inventory_yearly_summaries`
--

INSERT INTO `inventory_yearly_summaries` (`id`, `product_id`, `year`, `total_entrees`, `total_sorties`, `end_stock`, `average_price`, `created_at`, `updated_at`) VALUES
(1, 25, 2025, 0.00, 0.54, 99.46, 13.00, '2025-11-24 08:11:45', '2025-11-24 08:11:45'),
(2, 126, 2025, 0.00, 3.60, 46.40, 15.00, '2025-11-24 08:11:45', '2025-11-24 08:11:45'),
(3, 116, 2025, 0.00, 5.40, 44.60, 15.00, '2025-11-24 08:11:45', '2025-11-24 08:11:45'),
(4, 118, 2025, 0.00, 7.20, 42.80, 15.00, '2025-11-24 08:11:45', '2025-11-24 08:11:45'),
(5, 84, 2025, 0.00, 2.09, 47.91, 15.00, '2025-11-24 08:11:45', '2025-11-24 08:19:02'),
(6, 102, 2025, 0.00, 2.45, 45.55, 15.00, '2025-11-24 08:11:45', '2025-11-24 08:19:02');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ligne_achat`
--

CREATE TABLE `ligne_achat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `idachat` bigint(20) UNSIGNED NOT NULL,
  `idproduit` bigint(20) UNSIGNED NOT NULL,
  `qte` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ligne_plat`
--

CREATE TABLE `ligne_plat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_plat` bigint(20) UNSIGNED NOT NULL,
  `idproduit` bigint(20) UNSIGNED NOT NULL,
  `id_unite` bigint(20) UNSIGNED NOT NULL,
  `qte` decimal(10,2) NOT NULL,
  `nombre_couvert` int(11) NOT NULL DEFAULT 10,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ligne_plat`
--

INSERT INTO `ligne_plat` (`id`, `id_user`, `id_plat`, `idproduit`, `id_unite`, `qte`, `nombre_couvert`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 59, 102, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(2, 1, 59, 84, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(3, 1, 59, 25, 1, 0.30, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(4, 1, 58, 102, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(5, 1, 58, 84, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(6, 1, 57, 75, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(7, 1, 57, 104, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(8, 1, 57, 108, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(9, 1, 57, 84, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(10, 1, 57, 102, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(11, 1, 51, 102, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(12, 1, 51, 84, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(13, 1, 50, 25, 1, 0.20, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(14, 1, 49, 84, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(15, 1, 48, 84, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(16, 1, 45, 102, 1, 0.10, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(17, 1, 44, 102, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(18, 1, 43, 102, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(19, 1, 41, 102, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(20, 1, 41, 84, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(21, 1, 40, 102, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(22, 1, 40, 84, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(23, 1, 39, 102, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(24, 1, 37, 102, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(25, 1, 35, 25, 1, 0.30, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(26, 1, 34, 102, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(27, 1, 31, 102, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(28, 1, 29, 102, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(29, 1, 24, 85, 1, 0.50, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(30, 1, 23, 85, 1, 0.50, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(31, 1, 21, 102, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(32, 1, 21, 84, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(33, 1, 19, 102, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(34, 1, 19, 84, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(35, 1, 18, 85, 1, 4.00, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(36, 1, 17, 102, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(37, 1, 17, 84, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(38, 1, 17, 66, 1, 0.20, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(39, 1, 16, 102, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(40, 1, 16, 84, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(41, 1, 15, 102, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(42, 1, 15, 84, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(43, 1, 14, 102, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(44, 1, 14, 84, 1, 0.13, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(45, 1, 14, 66, 1, 0.20, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(46, 1, 13, 84, 1, 0.05, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(47, 1, 13, 102, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(48, 1, 12, 84, 1, 0.05, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(49, 1, 12, 102, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(50, 1, 11, 108, 1, 1.00, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(51, 1, 11, 84, 1, 0.05, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(52, 1, 11, 102, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(53, 1, 10, 84, 1, 0.05, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(54, 1, 10, 102, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(55, 1, 9, 84, 1, 0.05, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(56, 1, 9, 102, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(57, 1, 8, 84, 1, 0.50, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(58, 1, 8, 102, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(59, 1, 7, 84, 1, 0.05, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(60, 1, 7, 102, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(61, 1, 6, 84, 1, 0.05, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(62, 1, 6, 102, 1, 0.25, 10, '2025-11-23 09:32:37', '2025-11-23 09:32:37', NULL),
(63, 1, 35, 126, 1, 2.00, 10, '2025-11-23 09:34:07', '2025-11-23 09:34:07', NULL),
(64, 1, 35, 116, 1, 3.00, 10, '2025-11-23 09:34:07', '2025-11-23 09:34:07', NULL),
(65, 1, 35, 118, 1, 4.00, 10, '2025-11-23 09:34:07', '2025-11-23 09:34:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ligne_vente`
--

CREATE TABLE `ligne_vente` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `idvente` bigint(20) UNSIGNED NOT NULL,
  `idproduit` bigint(20) UNSIGNED NOT NULL,
  `qte` decimal(10,2) NOT NULL,
  `newquantet` decimal(10,2) DEFAULT NULL,
  `price_unitaire` decimal(10,2) NOT NULL DEFAULT 0.00,
  `contente_transfert` text DEFAULT NULL,
  `contete_formateur` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ligne_vente`
--

INSERT INTO `ligne_vente` (`id`, `id_user`, `idvente`, `idproduit`, `qte`, `newquantet`, `price_unitaire`, `contente_transfert`, `contete_formateur`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 34, 1, 25, 0.54, 0.54, 0.00, NULL, '0.54', '2025-11-24 08:06:14', '2025-11-24 08:11:45', NULL),
(2, 34, 1, 126, 3.60, 3.60, 0.00, NULL, '3.60', '2025-11-24 08:06:14', '2025-11-24 08:11:45', NULL),
(3, 34, 1, 116, 5.40, 5.40, 0.00, NULL, '5.40', '2025-11-24 08:06:14', '2025-11-24 08:11:45', NULL),
(4, 34, 1, 118, 7.20, 7.20, 0.00, NULL, '7.20', '2025-11-24 08:06:14', '2025-11-24 08:11:45', NULL),
(5, 34, 1, 84, 0.09, 0.09, 0.00, NULL, '0.09', '2025-11-24 08:06:14', '2025-11-24 08:11:45', NULL),
(6, 34, 1, 102, 0.45, 0.45, 0.00, NULL, '0.45', '2025-11-24 08:06:14', '2025-11-24 08:11:45', NULL),
(7, 34, 2, 102, 2.00, 0.26, 0.00, NULL, '2.00', '2025-11-24 08:13:23', '2025-11-24 08:19:02', NULL),
(8, 34, 2, 84, 2.00, 1.00, 0.00, NULL, '2.00', '2025-11-24 08:13:23', '2025-11-24 08:19:02', NULL),
(9, 34, 2, 102, 2.00, 0.50, 0.00, NULL, '2.00', '2025-11-24 08:13:23', '2025-11-24 08:19:02', NULL),
(10, 21, 3, 114, 49.00, 49.00, 0.00, NULL, NULL, '2025-11-24 08:25:49', '2025-11-24 08:25:49', NULL),
(11, 22, 4, 299, 20.00, 20.00, 0.00, NULL, NULL, '2025-11-24 08:28:06', '2025-11-24 08:31:41', '2025-11-24 08:31:41'),
(12, 22, 5, 84, 0.65, 0.65, 0.00, NULL, NULL, '2025-11-26 08:42:49', '2025-11-26 08:42:49', NULL),
(13, 22, 5, 102, 3.25, 3.25, 0.00, NULL, NULL, '2025-11-26 08:42:49', '2025-11-26 08:42:49', NULL),
(14, 22, 5, 175, 50.00, 50.00, 0.00, NULL, NULL, '2025-11-26 08:42:49', '2025-11-26 08:42:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `line_transfer`
--

CREATE TABLE `line_transfer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_product` bigint(20) UNSIGNED NOT NULL,
  `id_tva` bigint(20) UNSIGNED DEFAULT NULL,
  `id_unite` bigint(20) UNSIGNED DEFAULT NULL,
  `idcommande` bigint(20) UNSIGNED NOT NULL,
  `id_stocktransfer` bigint(20) UNSIGNED NOT NULL,
  `quantite` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `locals`
--

CREATE TABLE `locals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `iduser` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `locals`
--

INSERT INTO `locals` (`id`, `name`, `iduser`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'RESERVE FOUNITURE SCOLAIRE', 1, '2025-11-23 09:30:32', '2025-11-23 09:30:32', NULL),
(2, 'CHAMBRE FROIDE  NEGATIVE', 1, '2025-11-23 09:30:32', '2025-11-23 09:30:32', NULL),
(3, 'CHAMBRE FROIDE POSITIVE', 1, '2025-11-23 09:30:32', '2025-11-23 09:30:32', NULL),
(4, 'ECONOMAT', 1, '2025-11-23 09:30:32', '2025-11-23 09:30:32', NULL),
(5, 'RESERVE  MOBILIER DE BUREAU', 1, '2025-11-23 09:30:32', '2025-11-23 09:30:32', NULL),
(6, 'RESERVE FOUNITURE DE BUREAU', 1, '2025-11-23 09:30:32', '2025-11-23 09:30:32', NULL),
(7, 'RESERVE FOUNITURE ELECTRIQUE', 1, '2025-11-23 09:30:32', '2025-11-23 09:30:32', NULL),
(8, 'RESERVE FOUNITURE INFORMATIQUE', 1, '2025-11-23 09:30:32', '2025-11-23 09:30:32', NULL),
(9, 'RESERVE MOBILIER DE CUISINE & RESTAURATION', 1, '2025-11-23 09:30:32', '2025-11-23 09:30:32', NULL),
(10, 'RESERVE MOBILIER SCOLAIRE', 1, '2025-11-23 09:30:32', '2025-11-23 09:30:32', NULL),
(11, 'RESERVE PAPITERIE', 1, '2025-11-23 09:30:32', '2025-11-23 09:30:32', NULL),
(12, 'RESERVE PRODUITS DE NETTOYAGE', 1, '2025-11-23 09:30:32', '2025-11-23 09:30:32', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_03_07_102755_create_categories_table', 1),
(5, '2025_03_07_103252_create_sub_categories_table', 1),
(6, '2025_03_08_103654_create_permission_tables', 1),
(7, '2025_03_11_215241_create_local_table', 1),
(8, '2025_03_11_220748_create__rayon_table', 1),
(9, '2025_03_12_212343_create_tvas_table', 1),
(10, '2025_03_12_215502_create_unite_table', 1),
(11, '2025_03_12_220635_create_products_table', 1),
(12, '2025_03_12_220744_create_stock_table', 1),
(13, '2025_03_14_114155_create_fournisseurs_table', 1),
(14, '2025_03_14_232314_create_achats_table', 1),
(15, '2025_03_15_110158_create_temp_achat_table', 1),
(16, '2025_03_15_124318_create_ligne_achat_table', 1),
(17, '2025_03_18_224934_create_clients_table', 1),
(18, '2025_03_18_230744_create_ventes_table', 1),
(19, '2025_03_18_230958_create_temp__vente_table', 1),
(20, '2025_03_18_231140_create_ligne__vente_table', 1),
(21, '2025_03_21_133307_create_audits_table', 1),
(22, '2025_04_12_120123_create_notifications_table', 1),
(23, '2025_04_18_153700_create_inventories_table', 1),
(24, '2025_04_18_153753_create_inventory_monthly_summaries_table', 1),
(25, '2025_04_18_153828_create_inventory_yearly_summaries_table', 1),
(26, '2025_04_18_185229_create_stocktransfer_table', 1),
(27, '2025_04_22_172855_create_tmpstocktransfer_table', 1),
(28, '2025_04_22_191703_create_line_transfer_table', 1),
(29, '2025_05_04_210657_create_daily_consumption_table', 1),
(30, '2025_10_24_161430_add_signature_to_users_table', 1),
(31, '2025_10_24_163126_create_hostorique_sig', 1),
(32, '2025_10_31_164222_add_datereception_to_products_table', 1),
(33, '2025_10_31_164428_add_fournisseur_to_products_table', 1),
(34, '2025_10_31_194425_create_pertes_table', 1),
(35, '2025_11_01_181527_create_plats_table', 1),
(36, '2025_11_01_192723_create_ligne_plat_table', 1),
(37, '2025_11_01_192814_create_temp_plat_table', 1),
(38, '2025_11_02_121033_create_columnidplat_table', 1),
(39, '2025_11_04_131542_add_motif_refus_to_ventes_table', 1),
(40, '2025_11_07_184557_add_price_unitaire_to_ligne_vente_table', 1),
(41, '2025_11_10_232948_change_quantite_to_decimal_in_line_transfer_table', 1),
(42, '2025_11_12_192100_add_service_to_users_table', 1),
(43, '2025_11_13_074909_add_numero_serie_to_ventes_table', 1),
(44, '2025_11_14_182518_add_visa_status_to_ventes_table', 1),
(45, '2025_11_14_200025_add_newquantet_to_ligne_vente_table', 1),
(46, '2025_11_21_080919_add_new_columns_to_pertes_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1),
(2, 'App\\Models\\User', 2),
(7, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 4),
(9, 'App\\Models\\User', 5),
(8, 'App\\Models\\User', 6),
(9, 'App\\Models\\User', 7),
(9, 'App\\Models\\User', 8),
(9, 'App\\Models\\User', 9),
(3, 'App\\Models\\User', 10),
(9, 'App\\Models\\User', 11),
(10, 'App\\Models\\User', 12),
(9, 'App\\Models\\User', 13),
(9, 'App\\Models\\User', 14),
(9, 'App\\Models\\User', 15),
(4, 'App\\Models\\User', 16),
(4, 'App\\Models\\User', 17),
(4, 'App\\Models\\User', 18),
(4, 'App\\Models\\User', 19),
(4, 'App\\Models\\User', 20),
(4, 'App\\Models\\User', 21),
(4, 'App\\Models\\User', 22),
(9, 'App\\Models\\User', 23),
(9, 'App\\Models\\User', 24),
(9, 'App\\Models\\User', 25),
(9, 'App\\Models\\User', 26),
(9, 'App\\Models\\User', 27),
(9, 'App\\Models\\User', 28),
(4, 'App\\Models\\User', 34),
(11, 'App\\Models\\User', 35);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` char(36) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `type`, `notifiable_type`, `notifiable_id`, `data`, `read_at`, `created_at`, `updated_at`) VALUES
('042f6ec4-5cb2-480d-b863-8e76561236da', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 2, '{\"message\":\"Commande Alimentaire #1 vis\\u00e9e par le Directeur des \\u00e9tudes - en attente de votre visa\",\"status\":\"Visa Directeur\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/jR\"}', '2025-11-24 08:08:34', '2025-11-24 08:08:08', '2025-11-24 08:08:34'),
('182c4187-07fd-4b04-985f-a9ecdf4cb082', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 34, '{\"message\":\"Votre commande #2 a chang\\u00e9 de statut: Visa Directeur\",\"status\":\"Visa Directeur\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/k5\"}', '2025-11-25 23:22:13', '2025-11-24 08:14:06', '2025-11-25 23:22:13'),
('1cc266dc-78ac-4836-881f-d2c286542a4d', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 34, '{\"message\":\"Votre commande #2 a chang\\u00e9 de statut: Visa \\u00c9conome\",\"status\":\"Visa \\u00c9conome\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/k5\"}', '2025-11-25 23:22:13', '2025-11-24 08:14:35', '2025-11-25 23:22:13'),
('1db9b9c4-4f98-4d92-b11c-39ea6597e355', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 3, '{\"message\":\"Nouvelle commande A-4\\/Alimentaire\\/2025 cr\\u00e9\\u00e9e par Jamal SEHOUL\",\"status\":\"Cr\\u00e9ation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/nR\"}', NULL, '2025-11-26 08:42:49', '2025-11-26 08:42:49'),
('212ceff9-8f33-4b52-91dc-7265d1a8166f', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 6, '{\"message\":\"Nouvelle commande NA-1\\/Non Alimentaire\\/2025 cr\\u00e9\\u00e9e par Jamal SEHOUL\",\"status\":\"Cr\\u00e9ation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/mO\"}', '2025-11-24 08:28:40', '2025-11-24 08:28:06', '2025-11-24 08:28:40'),
('2175c888-2363-4d25-9f14-ef2f23743ec5', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 22, '{\"message\":\"Votre commande #4 a chang\\u00e9 de statut: Visa \\u00c9conome\",\"status\":\"Visa \\u00c9conome\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/mO\"}', NULL, '2025-11-24 08:29:50', '2025-11-24 08:29:50'),
('315be1ae-1dfe-476b-a1b6-f32bea1602e2', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 1, '{\"message\":\"Nouvelle commande A-4\\/Alimentaire\\/2025 cr\\u00e9\\u00e9e par Jamal SEHOUL\",\"status\":\"Cr\\u00e9ation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/nR\"}', NULL, '2025-11-26 08:42:49', '2025-11-26 08:42:49'),
('4e568cde-60f5-49a8-88f3-f3035a5304e6', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 34, '{\"message\":\"Votre commande #1 a chang\\u00e9 de statut: Livraison\",\"status\":\"Livraison\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/jR\"}', '2025-11-25 23:22:13', '2025-11-24 08:10:08', '2025-11-25 23:22:13'),
('52dd85a6-5b61-4cf4-9370-1d7e24a6ae5b', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 10, '{\"message\":\"Commande #1 vis\\u00e9e par le Directeur des \\u00e9tudes\",\"status\":\"Visa Directeur\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/jR\"}', '2025-11-24 08:10:16', '2025-11-24 08:08:08', '2025-11-24 08:10:16'),
('53cb8318-e675-407e-8f57-ff11ba1cce7c', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 1, '{\"message\":\"Nouvelle commande A-2\\/Alimentaire\\/2025 cr\\u00e9\\u00e9e par ABDELAZIZ BELLAMLIH\",\"status\":\"Cr\\u00e9ation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/k5\"}', '2025-11-24 08:24:44', '2025-11-24 08:13:23', '2025-11-24 08:24:44'),
('5fd5335a-f640-49d2-9920-cd52bffea9bd', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 34, '{\"message\":\"Votre commande #2 a chang\\u00e9 de statut: R\\u00e9ception\",\"status\":\"R\\u00e9ception\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/k5\"}', '2025-11-25 23:22:13', '2025-11-24 08:16:00', '2025-11-25 23:22:13'),
('6aba1dca-5e09-43bf-9603-2434959011a2', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 3, '{\"message\":\"Nouvelle commande A-2\\/Alimentaire\\/2025 cr\\u00e9\\u00e9e par ABDELAZIZ BELLAMLIH\",\"status\":\"Cr\\u00e9ation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/k5\"}', NULL, '2025-11-24 08:13:23', '2025-11-24 08:13:23'),
('6ba21f1a-d108-4264-8821-f394d1a2998b', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 10, '{\"message\":\"Commande #2 vis\\u00e9e par le Directeur des \\u00e9tudes\",\"status\":\"Visa Directeur\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/k5\"}', NULL, '2025-11-24 08:14:06', '2025-11-24 08:14:06'),
('71031116-3ae0-4b1e-9a60-a9d01a93d430', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 2, '{\"message\":\"Nouvelle commande NA-1\\/Non Alimentaire\\/2025 cr\\u00e9\\u00e9e par Jamal SEHOUL\",\"status\":\"Cr\\u00e9ation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/mO\"}', NULL, '2025-11-24 08:28:06', '2025-11-24 08:28:06'),
('718d475f-817f-4076-ae3e-c08d5f29d651', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 3, '{\"message\":\"Nouvelle commande A-3\\/Alimentaire\\/2025 cr\\u00e9\\u00e9e par Soufian ZIANI\",\"status\":\"Cr\\u00e9ation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/l5\"}', NULL, '2025-11-24 08:25:49', '2025-11-24 08:25:49'),
('720c84d2-ee77-49b3-b1e6-76d026de5021', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 10, '{\"message\":\"Commande #4 vis\\u00e9e par l\'\\u00c9conome\",\"status\":\"Visa \\u00c9conome\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/mO\"}', NULL, '2025-11-24 08:29:50', '2025-11-24 08:29:50'),
('7447c639-9593-47d8-b857-1af5331b6e1a', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 1, '{\"message\":\"ABDELAZIZ BELLAMLIH a re\\u00e7u la commande #2\",\"status\":\"Validation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/k5\"}', '2025-11-24 08:24:44', '2025-11-24 08:19:02', '2025-11-24 08:24:44'),
('7d3f0b4d-1ba1-463c-aa6a-3f24a1b8f28f', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 2, '{\"message\":\"Commande Non Alimentaire #4 vis\\u00e9e par le Charg\\u00e9 d\'inventaire - en attente de votre visa\",\"status\":\"Visa Charg\\u00e9\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/mO\"}', NULL, '2025-11-24 08:29:17', '2025-11-24 08:29:17'),
('81473785-7a9d-479e-87ec-a64cf0288af9', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 10, '{\"message\":\"Nouvelle commande #2 pr\\u00eate pour la livraison\",\"status\":\"R\\u00e9ception\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/k5\"}', NULL, '2025-11-24 08:16:00', '2025-11-24 08:16:00'),
('837e1a4d-bde2-4256-9bfb-952a1c6aff1c', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 10, '{\"message\":\"Commande #1 vis\\u00e9e par l\'\\u00c9conome\",\"status\":\"Visa \\u00c9conome\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/jR\"}', '2025-11-24 08:10:16', '2025-11-24 08:09:01', '2025-11-24 08:10:16'),
('86d0a498-6d72-44c2-afa1-57278a02ce98', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 1, '{\"message\":\"ABDELAZIZ BELLAMLIH a re\\u00e7u la commande #1\",\"status\":\"Validation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/jR\"}', '2025-11-24 08:24:44', '2025-11-24 08:11:45', '2025-11-24 08:24:44'),
('931b3394-ccc1-47db-bfcb-00ee4d5d8f96', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 10, '{\"message\":\"Commande #2 vis\\u00e9e par l\'\\u00c9conome\",\"status\":\"Visa \\u00c9conome\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/k5\"}', NULL, '2025-11-24 08:14:35', '2025-11-24 08:14:35'),
('94d341e6-10f0-4e5d-a07d-6bdeda99e87c', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 2, '{\"message\":\"Nouvelle commande A-3\\/Alimentaire\\/2025 cr\\u00e9\\u00e9e par Soufian ZIANI\",\"status\":\"Cr\\u00e9ation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/l5\"}', NULL, '2025-11-24 08:25:49', '2025-11-24 08:25:49'),
('a14f5931-ea7f-4d8d-9b65-35d6cbb35b76', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 1, '{\"message\":\"Nouvelle commande A-1\\/Alimentaire\\/2025 cr\\u00e9\\u00e9e par ABDELAZIZ BELLAMLIH\",\"status\":\"Cr\\u00e9ation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/jR\"}', '2025-11-24 08:24:44', '2025-11-24 08:06:14', '2025-11-24 08:24:44'),
('a3d1b596-e288-46da-9d02-7b9db37749e2', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 34, '{\"message\":\"Votre commande a \\u00e9t\\u00e9 vis\\u00e9e par Chaimae EMRAN\",\"status\":\"Vis\\u00e9\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/k5\"}', '2025-11-25 23:22:13', '2025-11-24 08:17:33', '2025-11-25 23:22:13'),
('adcc3390-794a-40a3-8663-4fa8e548f641', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 10, '{\"message\":\"Commande #4 vis\\u00e9e par le Charg\\u00e9 d\'inventaire\",\"status\":\"Visa Charg\\u00e9\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/mO\"}', NULL, '2025-11-24 08:29:17', '2025-11-24 08:29:17'),
('addbabb1-5f44-45dc-b9eb-bcc8a1542eb2', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 1, '{\"message\":\"Commande #1 vis\\u00e9e par l\'\\u00c9conome - pr\\u00eate pour validation\",\"status\":\"Visa \\u00c9conome\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/jR\"}', '2025-11-24 08:24:44', '2025-11-24 08:09:01', '2025-11-24 08:24:44'),
('b2e7cbf4-4206-41bc-8bdf-00a38c1dd1bd', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 1, '{\"message\":\"Commande #4 vis\\u00e9e par l\'\\u00c9conome - pr\\u00eate pour validation\",\"status\":\"Visa \\u00c9conome\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/mO\"}', NULL, '2025-11-24 08:29:50', '2025-11-24 08:29:50'),
('b3d9ee70-4426-4e0e-a893-6e698a081905', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 2, '{\"message\":\"Commande Alimentaire #2 vis\\u00e9e par le Directeur des \\u00e9tudes - en attente de votre visa\",\"status\":\"Visa Directeur\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/k5\"}', NULL, '2025-11-24 08:14:06', '2025-11-24 08:14:06'),
('b5931cd3-3a40-4c69-acaa-453225be9762', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 22, '{\"message\":\"Votre commande #4 a chang\\u00e9 de statut: Visa Charg\\u00e9\",\"status\":\"Visa Charg\\u00e9\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/mO\"}', NULL, '2025-11-24 08:29:17', '2025-11-24 08:29:17'),
('b59e5d66-d4f5-4137-98ae-118a1676970a', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 2, '{\"message\":\"Nouvelle commande A-4\\/Alimentaire\\/2025 cr\\u00e9\\u00e9e par Jamal SEHOUL\",\"status\":\"Cr\\u00e9ation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/nR\"}', NULL, '2025-11-26 08:42:49', '2025-11-26 08:42:49'),
('bd1ede1c-12f9-4506-8182-8bc470d69768', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 22, '{\"message\":\"Votre commande #4 a chang\\u00e9 de statut: Livraison\",\"status\":\"Livraison\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/mO\"}', NULL, '2025-11-24 08:30:45', '2025-11-24 08:30:45'),
('be00eec4-f7fa-4d8b-864b-66f114f28652', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 2, '{\"message\":\"Nouvelle commande A-2\\/Alimentaire\\/2025 cr\\u00e9\\u00e9e par ABDELAZIZ BELLAMLIH\",\"status\":\"Cr\\u00e9ation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/k5\"}', NULL, '2025-11-24 08:13:23', '2025-11-24 08:13:23'),
('c1a3a052-9fa5-4a26-a593-a7289286059c', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 3, '{\"message\":\"Nouvelle commande A-1\\/Alimentaire\\/2025 cr\\u00e9\\u00e9e par ABDELAZIZ BELLAMLIH\",\"status\":\"Cr\\u00e9ation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/jR\"}', '2025-11-24 08:08:18', '2025-11-24 08:06:14', '2025-11-24 08:08:18'),
('d85c19c3-e7de-4fb8-8ac7-cc774fd60804', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 1, '{\"message\":\"Nouvelle commande A-3\\/Alimentaire\\/2025 cr\\u00e9\\u00e9e par Soufian ZIANI\",\"status\":\"Cr\\u00e9ation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/l5\"}', NULL, '2025-11-24 08:25:49', '2025-11-24 08:25:49'),
('d91910f2-9374-47b7-82ca-0bd4800933b0', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 34, '{\"message\":\"Votre commande #1 a chang\\u00e9 de statut: Visa \\u00c9conome\",\"status\":\"Visa \\u00c9conome\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/jR\"}', '2025-11-25 23:22:13', '2025-11-24 08:09:01', '2025-11-25 23:22:13'),
('de598b3e-b904-4c81-8467-dd618291b020', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 1, '{\"message\":\"Nouvelle commande NA-1\\/Non Alimentaire\\/2025 cr\\u00e9\\u00e9e par Jamal SEHOUL\",\"status\":\"Cr\\u00e9ation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/mO\"}', NULL, '2025-11-24 08:28:06', '2025-11-24 08:28:06'),
('ee663ba2-b336-4df5-a059-0a48869a30f2', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 34, '{\"message\":\"Votre commande #1 a chang\\u00e9 de statut: Visa Directeur\",\"status\":\"Visa Directeur\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/jR\"}', '2025-11-25 23:22:13', '2025-11-24 08:08:08', '2025-11-25 23:22:13'),
('f03c878d-ca49-43ff-bca6-1909e19eac00', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 34, '{\"message\":\"Votre commande #2 a chang\\u00e9 de statut: Livraison\",\"status\":\"Livraison\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/k5\"}', '2025-11-25 23:22:13', '2025-11-24 08:18:07', '2025-11-25 23:22:13'),
('f18b7f51-2d37-4422-8d0f-b4016cc862af', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 1, '{\"message\":\"Commande #2 vis\\u00e9e par l\'\\u00c9conome - pr\\u00eate pour validation\",\"status\":\"Visa \\u00c9conome\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/k5\"}', '2025-11-24 08:24:44', '2025-11-24 08:14:35', '2025-11-24 08:24:44'),
('fc838ab5-f9bc-4134-99f6-85342feb4bba', 'App\\Notifications\\SystemNotification', 'App\\Models\\User', 2, '{\"message\":\"Nouvelle commande A-1\\/Alimentaire\\/2025 cr\\u00e9\\u00e9e par ABDELAZIZ BELLAMLIH\",\"status\":\"Cr\\u00e9ation\",\"view_url\":\"https:\\/\\/skyblue-rat-607542.hostingersite.com\\/ShowBonVente\\/jR\"}', '2025-11-24 08:08:34', '2025-11-24 08:06:14', '2025-11-24 08:08:34');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Products', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(2, 'Products-ajoute', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(3, 'Products-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(4, 'Products-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(5, 'Taxes', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(6, 'Taxes-ajoute', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(7, 'Taxes-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(8, 'Taxes-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(9, 'Fournisseurs', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(10, 'Fournisseurs-ajoute', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(11, 'Fournisseurs-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(12, 'Fournisseurs-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(13, 'Categories', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(14, 'Categories-ajoute', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(15, 'Categories-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(16, 'Categories-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(17, 'Local', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(18, 'Local-ajoute', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(19, 'Local-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(20, 'Local-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(21, 'Rayon', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(22, 'Rayon-ajoute', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(23, 'Rayon-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(24, 'Rayon-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(25, 'Famille', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(26, 'Famille-ajoute', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(27, 'Famille-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(28, 'Famille-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(29, 'Achat', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(30, 'Achat-ajoute', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(31, 'Achat-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(32, 'Achat-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(33, 'Commande', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(34, 'Commande-ajoute', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(35, 'Commande-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(36, 'Commande-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(37, 'Historique', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(38, 'Historique-Export', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(39, 'Historique-montrer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(40, 'Unité', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(41, 'Unité-ajoute', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(42, 'Unité-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(43, 'Unité-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(44, 'utilisateur', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(45, 'utilisateur-ajoute', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(46, 'utilisateur-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(47, 'utilisateur-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(48, 'rôles', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(49, 'rôles-ajoute', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(50, 'rôles-voir', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(51, 'rôles-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(52, 'rôles-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(53, 'Transfer-ajoute', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(54, 'Transfer-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(55, 'Transfer-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(56, 'Transfer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(57, 'Stock', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(58, 'retour', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(59, 'retour-ajouter', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(60, 'retour-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(61, 'retour-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(62, 'Inventaire', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(63, 'Voir-Consommation', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(64, 'Voir-Consommation-Complète', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(65, 'Voir-Rapport-Mensuel-Consommation', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(66, 'Voir-Stock-Demandeur', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(67, 'Pertes-ajouter', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(68, 'Pertes-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(69, 'Pertes-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(70, 'Pertes-valider', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(71, 'Pertes-voir', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(72, 'Plats', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(73, 'Plats-liste', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(74, 'Plats-ajoute', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(75, 'Plats-modifier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL),
(76, 'Plats-supprimer', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pertes`
--

CREATE TABLE `pertes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_product` bigint(20) UNSIGNED DEFAULT NULL,
  `id_category` bigint(20) UNSIGNED DEFAULT NULL,
  `id_subcategorie` bigint(20) UNSIGNED DEFAULT NULL,
  `id_unite` bigint(20) UNSIGNED DEFAULT NULL,
  `id_plat` varchar(255) DEFAULT NULL,
  `classe` varchar(255) DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `quantite` decimal(10,2) DEFAULT NULL,
  `nature` varchar(255) DEFAULT NULL,
  `date_perte` date DEFAULT NULL,
  `cause` text DEFAULT NULL,
  `status` enum('En attente','Visa Directeur','Visa Économe','Visa Chargé','Validé','Visa Magasinier','Refusé','Annuler') DEFAULT 'En attente',
  `refusal_reason` text DEFAULT NULL,
  `produit_fini_type` varchar(255) DEFAULT NULL,
  `nombre_plats` int(11) DEFAULT NULL,
  `cout_total` decimal(10,2) DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `circonstances` text DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `numero_serie` int(11) DEFAULT NULL,
  `n_inv` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pertes`
--

INSERT INTO `pertes` (`id`, `id_product`, `id_category`, `id_subcategorie`, `id_unite`, `id_plat`, `classe`, `designation`, `quantite`, `nature`, `date_perte`, `cause`, `status`, `refusal_reason`, `produit_fini_type`, `nombre_plats`, `cout_total`, `id_user`, `created_at`, `updated_at`, `deleted_at`, `circonstances`, `reference`, `numero_serie`, `n_inv`) VALUES
(1, NULL, NULL, NULL, NULL, '35', NULL, 'Foie M’charmela', 0.00, 'produit fini', '2025-11-17', 'Cause', 'En attente', NULL, 'Entrée', 2, 277.80, 1, '2025-11-23 09:36:08', '2025-11-23 09:36:37', '2025-11-23 09:36:37', 'Circonstances', 'PSAL001-112025/PF', 1, NULL),
(2, NULL, NULL, NULL, NULL, '35', NULL, 'Foie M’charmela', 0.00, 'produit fini', '2025-11-21', 'Cause', 'En attente', NULL, 'Entrée', 1, 138.90, 1, '2025-11-23 09:38:26', '2025-11-23 09:38:31', '2025-11-23 09:38:31', 'Circonstances', 'PSAL002-112025/PF', 2, NULL),
(3, NULL, NULL, NULL, NULL, '35', NULL, 'Foie M’charmela', 0.00, 'produit fini', '2025-11-19', 'Cause', 'En attente', NULL, 'Entrée', 2, 277.80, 1, '2025-11-23 19:53:07', '2025-11-23 19:53:34', '2025-11-23 19:53:34', 'Circonstances', 'PSAL003-112025/PF', 3, NULL),
(4, 5, 4, 19, 6, NULL, 'NON ALIMENTAIRE', 'Cardex Feuilles de Consommations FT 32*24,5 CM', 3.00, 'stock', '2025-11-20', 'Ras', 'Annuler', NULL, NULL, NULL, 200.01, 1, '2025-11-23 19:56:52', '2025-11-24 07:58:07', '2025-11-24 07:58:07', 'Ras', 'PSNAL001-112025', 1, 'Fghh'),
(5, NULL, NULL, NULL, NULL, '57', NULL, 'Chorba', 0.00, 'produit fini', '2025-11-21', 'Ras', 'En attente', NULL, 'Entrée', 1, 15.15, 1, '2025-11-23 19:59:42', '2025-11-24 07:55:50', '2025-11-24 07:55:50', 'Ras', 'PSAL004-112025/PF', 4, NULL),
(6, NULL, NULL, NULL, NULL, '57', NULL, 'Chorba', 0.00, 'produit fini', '2025-11-20', 'Cause', 'En attente', NULL, 'Entrée', 1, 15.15, 1, '2025-11-24 13:01:35', '2025-11-24 13:01:44', '2025-11-24 13:01:44', 'Circonstances', 'PSAL005-112025/PF', 5, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `plats`
--

CREATE TABLE `plats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('Entrée','Plat Principal','Dessert') NOT NULL,
  `iduser` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `plats`
--

INSERT INTO `plats` (`id`, `name`, `type`, `iduser`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Gâteau aux dattes', 'Dessert', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(2, 'Sablée u confiture', 'Dessert', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(3, 'Feqqass', 'Dessert', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(4, 'Ghraiba', 'Dessert', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(5, 'M\'halbi', 'Dessert', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(6, 'Tajine d’agneau aux haricots vert', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(7, 'Tajine de viande aux Cardons', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(8, 'Tajine de viande aux choux Fleur', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(9, 'Tajine de viande aux Fèves', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(10, 'Tajine de viande aux petit pois', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(11, 'Tajine de viande aux pommes de terre et petit pois', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(12, 'Tajine de viande au fenouil', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(13, 'Tajine de viande Carotte et petit pois', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(14, 'Coquelet Mbkher', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(15, 'Poulet Messlala ( Viande)', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(16, 'Poulet Messlala ( Poulet)', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(17, 'Poulet Mbkher', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(18, 'Poulet à la courge rouge au miel', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(19, 'Poulet Mchermel', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(20, 'Poulet Mkalli', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(21, 'Poulet mhammer', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(22, 'Tanjia', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(23, 'Couscous aux Légumes Poulet', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(24, 'Couscous aux Légumes Viande', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(25, 'Mrouzia', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(26, 'Couscous Tfaya Viande', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(27, 'Couscous Tfaya Poulet', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(28, 'Tajine de Poulet à la tomate aux miels', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(29, 'Tajine Souiri', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(30, 'Dalaa Mhamra', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(31, 'Tajine Qadra touimia', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(32, 'Tajine de fève', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(33, 'Tajine de Viande au pruneau / abricot / Ananas / Poire /Datte', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(34, 'Tajine de viande artichaut et petit pois', 'Plat Principal', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(35, 'Foie M’charmela', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(36, 'Carotte Râpé', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(37, 'Meselalla m’Charmel', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(38, 'Orange à la cannelle', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(39, 'Salade de trois Poivrons', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(40, 'Pourpier', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(41, 'Bakoula ou Mouve', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(42, 'Cervelles m’charmela', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(43, 'Aubergine Mraqad', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(44, 'Salade de courgette à l’origan', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(45, 'salade de tomate et poivrons grillées', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(46, 'Salade de tomate et poivron maasline', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(47, 'Seffa', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(48, 'Pois chiche à la sauce jaune', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(49, 'Haricot blanc en sauce', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(50, 'Taalika(riz aux lait)', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(51, 'soupe Langue d’oiseau', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(52, 'Soupe de Mais au lait', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(53, 'Soupe d’orge au lait', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(54, 'BISSARA', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(55, 'HERBBEL', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(56, 'Soupe de l’anis', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(57, 'Chorba', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(58, 'Soupe de Mais à la tomate', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL),
(59, 'Harira', 'Entrée', 1, '2025-11-23 09:32:23', '2025-11-23 09:32:23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `code_article` varchar(255) NOT NULL,
  `price_achat` decimal(10,2) NOT NULL,
  `code_barre` varchar(255) DEFAULT NULL,
  `emplacement` varchar(255) DEFAULT NULL,
  `seuil` int(11) NOT NULL DEFAULT 0,
  `date_expiration` date DEFAULT NULL,
  `id_categorie` bigint(20) UNSIGNED NOT NULL,
  `id_subcategorie` bigint(20) UNSIGNED NOT NULL,
  `id_local` bigint(20) UNSIGNED NOT NULL,
  `id_rayon` bigint(20) UNSIGNED NOT NULL,
  `id_tva` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `id_unite` bigint(20) UNSIGNED DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `class` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `price_vente` decimal(10,2) NOT NULL DEFAULT 1.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `date_reception` date DEFAULT NULL,
  `id_fournisseur` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `code_article`, `price_achat`, `code_barre`, `emplacement`, `seuil`, `date_expiration`, `id_categorie`, `id_subcategorie`, `id_local`, `id_rayon`, `id_tva`, `id_unite`, `id_user`, `class`, `photo`, `price_vente`, `created_at`, `updated_at`, `deleted_at`, `date_reception`, `id_fournisseur`) VALUES
(1, 'Carnets Bon de Sortie Administration FT 20,5*20,5 cm', 'FOUELC039', 291.67, NULL, 'RESERVE PAPITERIE / A1 / FOURNITURE / PAPITERIE / FOUELC039', 10, NULL, 4, 19, 11, 38, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(2, 'Carnets Bon de Sortie de Cuisine FT 21*20,5 cm', 'FOUELC040', 2.40, NULL, 'RESERVE PAPITERIE / A1 / FOURNITURE / PAPITERIE / FOUELC040', 10, NULL, 4, 19, 11, 38, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(3, 'Carnets  de Rapport de Leçons   FT 25 *30 cm', 'FOUELC041', 250.00, NULL, 'RESERVE PAPITERIE / A1 / FOURNITURE / PAPITERIE / FOUELC041', 10, NULL, 4, 19, 11, 38, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(4, 'Carnets Bon de Sortie de Cuisine FT 21*30,5 cm', 'FOUELC042', 233.34, NULL, 'RESERVE PAPITERIE / A1 / FOURNITURE / PAPITERIE / FOUELC042', 10, NULL, 4, 19, 11, 38, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(5, 'Cardex Feuilles de Consommations FT 32*24,5 CM', 'FOUELC043', 66.67, NULL, 'RESERVE PAPITERIE / A1 / FOURNITURE / PAPITERIE / FOUELC043', 10, NULL, 4, 19, 11, 38, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(6, 'Carnets Bon de Sortie 03 Exemplaires', 'FOUELC044', 156.00, NULL, 'RESERVE PAPITERIE / A1 / FOURNITURE / PAPITERIE / FOUELC044', 10, NULL, 4, 19, 11, 38, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(7, 'Carnets Bon de Sortie de Restaurant  FT 21*20,5 cm', 'FOUELC045', 39.17, NULL, 'RESERVE PAPITERIE / A1 / FOURNITURE / PAPITERIE / FOUELC045', 10, NULL, 4, 19, 11, 38, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(8, 'Carnets Bon de Sortie de Réception   FT 26,5 *20,5 cm', 'FOUELC046', 36.71, NULL, 'RESERVE PAPITERIE / A1 / FOURNITURE / PAPITERIE / FOUELC046', 10, NULL, 4, 19, 11, 38, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(9, 'Carnets Bon de Sortie de Commande   FT 19,5 *13 cm', 'FOUELC047', 17.00, NULL, 'RESERVE PAPITERIE / A1 / FOURNITURE / PAPITERIE / FOUELC047', 10, NULL, 4, 19, 11, 38, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(10, 'Carnets  de Rapport de Leçons   FT 21,5 *31,5 cm', 'FOUELC048', 103.00, NULL, 'RESERVE PAPITERIE / A1 / FOURNITURE / PAPITERIE / FOUELC048', 10, NULL, 4, 19, 11, 38, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(11, 'Carnets  de Stages   FT12 *19,5 cm', 'FOUELC049', 850.00, NULL, 'RESERVE PAPITERIE / A1 / FOURNITURE / PAPITERIE / FOUELC049', 10, NULL, 4, 19, 11, 38, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(12, 'Carnets Feuilles de Consommations FT 48*32 CM', 'FOUELC053', 112.50, NULL, 'RESERVE PAPITERIE / A2 / FOURNITURE / PAPITERIE / FOUELC053', 10, NULL, 4, 19, 11, 39, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(13, 'Fiches de Renseignement FT 21*30 CM', 'FOUELC055', 1100.00, NULL, 'RESERVE PAPITERIE / A2 / FOURNITURE / PAPITERIE / FOUELC055', 10, NULL, 4, 19, 11, 39, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(14, 'Fiches Evaluations trimestrielle', 'FOUELC056', 970.00, NULL, 'RESERVE PAPITERIE / A2 / FOURNITURE / PAPITERIE / FOUELC056', 10, NULL, 4, 19, 11, 39, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(15, 'Feuilles d\'examen FT 44*31,5 cm', 'FOUELC057', 208.33, NULL, 'RESERVE PAPITERIE / A2 / FOURNITURE / PAPITERIE / FOUELC057', 10, NULL, 4, 19, 11, 39, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(16, 'Feuilles de Concours d\'accés  FT 44*31,5 cm', 'FOUELC058', 870.00, NULL, 'RESERVE PAPITERIE / A2 / FOURNITURE / PAPITERIE / FOUELC058', 10, NULL, 4, 19, 11, 39, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(17, 'Livres D\"apprentissage métier : Boulangerie pâtissier', 'FOUELC059', 1380.00, NULL, 'RESERVE PAPITERIE / A2 / FOURNITURE / PAPITERIE / FOUELC059', 10, NULL, 4, 19, 11, 39, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(18, 'Livres D\"apprentissage métier : Restaurant', 'FOUELC060', 760.00, NULL, 'RESERVE PAPITERIE / A2 / FOURNITURE / PAPITERIE / FOUELC060', 10, NULL, 4, 19, 11, 39, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(19, 'Livres D\"apprentissage métier : Cuisine', 'FOUELC061', 1100.00, NULL, 'RESERVE PAPITERIE / A2 / FOURNITURE / PAPITERIE / FOUELC061', 10, NULL, 4, 19, 11, 39, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(20, 'Livres D\'engagement', 'FOUELC063', 650.00, NULL, 'RESERVE PAPITERIE / A2 / FOURNITURE / PAPITERIE / FOUELC063', 10, NULL, 4, 19, 11, 39, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(21, 'Registre de Dépense', 'FOUELC064', 600.00, NULL, 'RESERVE PAPITERIE / A2 / FOURNITURE / PAPITERIE / FOUELC064', 10, NULL, 4, 19, 11, 39, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(22, 'Registre Comptable', 'FOUELC065', 600.00, NULL, 'RESERVE PAPITERIE / A2 / FOURNITURE / PAPITERIE / FOUELC065', 10, NULL, 4, 19, 11, 39, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(23, 'Registre de Départ', 'FOUELC066', 600.00, NULL, 'RESERVE PAPITERIE / A2 / FOURNITURE / PAPITERIE / FOUELC066', 10, NULL, 4, 19, 11, 39, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(24, 'Registre d\'arrivée', 'FOUELC067', 650.00, NULL, 'RESERVE PAPITERIE / A2 / FOURNITURE / PAPITERIE / FOUELC067', 10, NULL, 4, 19, 11, 39, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(25, 'Farine de Blé Tendre', 'EPLBOU001', 13.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / BOULANGERIE / EPLBOU001', 13, '2028-06-06', 5, 21, 4, 11, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(26, 'Farine de Blé Dur', 'EPLBOU002', 13.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / BOULANGERIE / EPLBOU002', 13, '2026-01-07', 5, 21, 4, 11, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(27, 'Far- de Blé Tendre  pour Pätisserie', 'EPLBOU003', 13.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / BOULANGERIE / EPLBOU003', 13, '2026-02-07', 5, 21, 4, 11, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(28, 'Farine de Blé Dur Son', 'EPLBOU004', 13.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / BOULANGERIE / EPLBOU004', 13, '2026-03-07', 5, 21, 4, 11, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(29, 'Farine D\'orge', 'EPLBOU005', 20.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / BOULANGERIE / EPLBOU005', 20, '2026-04-07', 5, 21, 4, 11, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(30, 'Semoule Mais boulangerie', 'EPLBOU006', 14.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / BOULANGERIE / EPLBOU006', 14, '2025-10-05', 5, 21, 4, 11, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(31, 'Avoine', 'EPLBOU007', 14.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / BOULANGERIE / EPLBOU007', 14, '2026-06-07', 5, 21, 4, 11, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(32, 'Levure Boulangére de 125 grs', 'EPLBOU008', 7.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / BOULANGERIE / EPLBOU008', 7, '2026-07-07', 5, 21, 4, 11, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(33, 'Levure Chimique', 'EPLBOU009', 7.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / BOULANGERIE / EPLBOU009', 7, '2026-08-07', 5, 21, 4, 11, 1, 7, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(34, 'PAIN DE MI', 'EPLBOU010', 7.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / BOULANGERIE / EPLBOU010', 7, '2026-09-07', 5, 21, 4, 11, 1, 7, 1, NULL, NULL, 1.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL, NULL, NULL),
(35, 'Cornichons 4/4', 'EPLCON001', 15.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / CONSERVES / EPLCON001', 8, '2026-10-07', 5, 22, 4, 11, 1, 8, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(36, 'Cornichons de 500 grs', 'EPLCON002', 15.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / CONSERVES / EPLCON002', 8, '2026-11-07', 5, 22, 4, 11, 1, 8, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(37, 'Confiture 4/4', 'EPLCON003', 15.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / CONSERVES / EPLCON003', 8, '2026-12-07', 5, 22, 4, 11, 1, 8, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(38, 'Mais Doux 4/4', 'EPLCON004', 15.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / CONSERVES / EPLCON004', 8, '2026-08-05', 5, 22, 4, 11, 1, 8, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(39, 'Mais Doux de 500 grs', 'EPLCON005', 15.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / CONSERVES / EPLCON005', 8, '2027-02-07', 5, 22, 4, 11, 1, 8, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(40, 'Olive Noir 4/4', 'EPLCON006', 15.00, NULL, 'ECONOMAT / A / EPICERIE & PRODUITS LAITIERS / CONSERVES / EPLCON006', 8, '2027-03-07', 5, 22, 4, 11, 1, 8, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(41, 'Thon à L\'huile de 400 grs', 'EPLCON007', 15.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / CONSERVES / EPLCON007', 8, '2027-04-07', 5, 22, 4, 12, 1, 8, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(42, 'Tomate Concentrée 4/4', 'EPLCON008', 15.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / CONSERVES / EPLCON008', 8, '2027-05-07', 5, 22, 4, 12, 1, 8, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(43, 'Tomate Concentrée 1/6', 'EPLCON009', 15.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / CONSERVES / EPLCON009', 8, '2027-06-07', 5, 22, 4, 12, 1, 8, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(44, 'Tomate Concentrée 1/8', 'EPLCON010', 15.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / CONSERVES / EPLCON010', 8, '2027-07-07', 5, 22, 4, 12, 1, 8, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(45, 'Miel Ruche de 01 kg', 'EPLCON011', 15.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / CONSERVES / EPLCON011', 8, '2027-08-07', 5, 22, 4, 12, 1, 8, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(46, 'Miel Pur de 850 grs', 'EPLCON012', 15.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / CONSERVES / EPLCON012', 8, '2027-09-07', 5, 22, 4, 12, 1, 8, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(47, 'Ananas Rondelles 4/4', 'EPLCON013', 15.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / CONSERVES / EPLCON013', 8, '2027-10-07', 5, 22, 4, 12, 1, 8, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(48, 'Petits Pois 4/4', 'EPLCON014', 15.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / CONSERVES / EPLCON014', 8, '2027-11-07', 5, 22, 4, 12, 1, 8, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(49, 'Demi Poire 4/4', 'EPLCON015', 15.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / CONSERVES / EPLCON015', 8, '2026-02-05', 5, 22, 4, 12, 1, 8, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(50, 'Lentilles', 'EPLLSE001', 18.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / LEGUMES SECS (LEGUMINEUSES) / EPLLSE001', 5, '2026-03-05', 5, 23, 4, 12, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(51, 'Féves Séches', 'EPLLSE002', 12.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / LEGUMES SECS (LEGUMINEUSES) / EPLLSE002', 5, '2026-04-05', 5, 23, 4, 12, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(52, 'Haricot Blanc Secs', 'EPLLSE003', 15.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / LEGUMES SECS (LEGUMINEUSES) / EPLLSE003', 5, '2026-05-05', 5, 23, 4, 12, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(53, 'Petits Pois Concassées', 'EPLLSE004', 22.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / LEGUMES SECS (LEGUMINEUSES) / EPLLSE004', 5, '2026-06-05', 5, 23, 4, 12, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(54, 'Poischiches', 'EPLLSE005', 25.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / LEGUMES SECS (LEGUMINEUSES) / EPLLSE005', 5, '2026-07-05', 5, 23, 4, 12, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(55, 'Riz Long Glacé', 'EPLPAF001', 30.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF001', 10, '2026-08-05', 5, 24, 4, 12, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(56, 'Coquillettes', 'EPLPAF002', 30.00, NULL, 'ECONOMAT / B / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF002', 10, '2026-09-05', 5, 24, 4, 12, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(57, 'Nouilles', 'EPLPAF003', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF003', 10, '2026-10-05', 5, 24, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(58, 'Spaghettis', 'EPLPAF004', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF004', 10, '2026-11-05', 5, 24, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(59, 'Semoule de Couscous', 'EPLPAF005', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF005', 10, '2026-12-05', 5, 24, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(60, 'Torsade', 'EPLPAF006', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF006', 10, '2027-01-05', 5, 24, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(61, 'Semoule Fine', 'EPLPAF007', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF007', 10, '2027-02-05', 5, 24, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(62, 'Semoule Grosse', 'EPLPAF008', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF008', 10, '2027-03-05', 5, 24, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(63, 'Semoule Fino', 'EPLPAF009', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF009', 10, '2027-04-05', 5, 24, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(64, 'Belboula GF', 'EPLPAF010', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF010', 10, '2027-05-05', 5, 24, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(65, 'Belboula MF', 'EPLPAF011', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF011', 10, '2027-06-05', 5, 24, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(66, 'Vermicelle de Chine', 'EPLPAF012', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF012', 5, '2027-07-05', 5, 24, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(67, 'Vermicelle Cheveux D\'enge', 'EPLPAF013', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF013', 5, '2025-01-06', 5, 24, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(68, 'Poudre de Riz', 'EPLPAF014', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF014', 5, '2025-02-06', 5, 24, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(69, 'Maizena de 180 grs', 'EPLPAF015', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF015', 5, '2025-03-06', 5, 24, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(70, 'Poudre Crème', 'EPLPAF016', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF016', 5, '2025-04-06', 5, 24, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(71, 'BLE EBLY DE 500 GR', 'EPLPAF017', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / PATTE & FARINEUSE / EPLPAF017', 5, '2025-05-06', 5, 24, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(72, 'Artichauts Frais', 'LEFLEG001', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG001', 5, '2025-09-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(73, 'Aubergines', 'LEFLEG002', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG002', 5, '2025-10-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(74, 'Betteraves', 'LEFLEG003', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG003', 5, '2025-11-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(75, 'Carottes', 'LEFLEG004', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG004', 5, '2025-12-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(76, 'Choux Verts', 'LEFLEG005', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG005', 5, '2026-01-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(77, 'CHAMPIGNONS FRAIS', 'LEFLEG006', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG006', 5, '2026-02-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(78, 'Choux Fleurs', 'LEFLEG007', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG007', 5, '2026-03-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(79, 'Courgettes', 'LEFLEG008', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG008', 5, '2026-04-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(80, 'Citrons Frais', 'LEFLEG009', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG009', 5, '2026-05-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(81, 'Citrons Confits', 'LEFLEG010', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG010', 5, '2026-06-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(82, 'Coings', 'LEFLEG011', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG011', 5, '2026-07-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(83, 'Concombres', 'LEFLEG012', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG012', 5, '2026-08-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(84, 'Coriandre', 'LEFLEG013', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG013', 5, '2026-09-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(85, 'Courge Rouge', 'LEFLEG014', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG014', 5, '2026-10-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(86, 'Epinards', 'LEFLEG015', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG015', 5, '2026-11-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(87, 'ECHALOTTE', 'LEFLEG016', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG016', 5, '2026-12-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(88, 'MAUVE', 'LEFLEG017', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG017', 5, '2027-01-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(89, 'PETITE OIGNON', 'LEFLEG018', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / C / LEGUMES & FRUITS / LEGUMES / LEFLEG018', 5, '2027-02-09', 6, 35, 3, 7, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(90, 'POURPIER', 'LEFLEG019', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / LEGUMES & FRUITS / LEGUMES / LEFLEG019', 5, '2027-03-09', 6, 35, 3, 8, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(91, 'Fenouils', 'LEFLEG020', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / LEGUMES & FRUITS / LEGUMES / LEFLEG020', 5, '2027-04-09', 6, 35, 3, 8, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(92, 'Féves Fraiches', 'LEFLEG021', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / LEGUMES & FRUITS / LEGUMES / LEFLEG021', 5, '2027-05-09', 6, 35, 3, 8, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(93, 'Haricots Verts', 'LEFLEG022', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / LEGUMES & FRUITS / LEGUMES / LEFLEG022', 5, '2027-06-09', 6, 35, 3, 8, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(94, 'Laitues', 'LEFLEG023', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / LEGUMES & FRUITS / LEGUMES / LEFLEG023', 5, '2025-01-10', 6, 35, 3, 8, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(95, 'Laitues Frisées', 'LEFLEG024', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / LEGUMES & FRUITS / LEGUMES / LEFLEG024', 5, '2025-02-10', 6, 35, 3, 8, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(96, 'Navets Sas Branche', 'LEFLEG025', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / LEGUMES & FRUITS / LEGUMES / LEFLEG025', 5, '2025-03-10', 6, 35, 3, 8, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(97, 'Navets salsifé', 'LEFLEG026', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / LEGUMES & FRUITS / LEGUMES / LEFLEG026', 5, '2025-04-10', 6, 35, 3, 8, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(98, 'Oignons Sans Branches', 'LEFLEG027', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / LEGUMES & FRUITS / LEGUMES / LEFLEG027', 5, '2025-05-10', 6, 35, 3, 8, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(99, 'Oignons avec Branches', 'LEFLEG028', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / LEGUMES & FRUITS / LEGUMES / LEFLEG028', 5, '2025-06-10', 6, 35, 3, 8, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(100, 'Olives Confites Verte', 'LEFLEG029', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / LEGUMES & FRUITS / LEGUMES / LEFLEG029', 5, '2025-07-10', 6, 35, 3, 8, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(101, 'Olives Meslalla', 'LEFLEG030', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / LEGUMES & FRUITS / LEGUMES / LEFLEG030', 5, '2025-08-10', 6, 35, 3, 8, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(102, 'Persil', 'LEFLEG031', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / LEGUMES & FRUITS / LEGUMES / LEFLEG031', 5, '2025-09-10', 6, 35, 3, 8, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(103, 'Petits Pois Frais', 'LEFLEG032', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / LEGUMES & FRUITS / LEGUMES / LEFLEG032', 5, '2025-10-10', 6, 35, 3, 8, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(104, 'Poireaux', 'LEFLEG033', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / LEGUMES & FRUITS / LEGUMES / LEFLEG033', 5, '2025-11-10', 6, 35, 3, 8, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(105, 'Poivrons Verts', 'LEFLEG034', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / E / LEGUMES & FRUITS / LEGUMES / LEFLEG034', 5, '2025-12-10', 6, 35, 3, 9, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(106, 'Poivrons Rouge', 'LEFLEG035', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / E / LEGUMES & FRUITS / LEGUMES / LEFLEG035', 5, '2026-01-10', 6, 35, 3, 9, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(107, 'Poivrons Jaune', 'LEFLEG036', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / E / LEGUMES & FRUITS / LEGUMES / LEFLEG036', 5, '2026-02-10', 6, 35, 3, 9, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(108, 'Pomme de Terre', 'LEFLEG037', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / E / LEGUMES & FRUITS / LEGUMES / LEFLEG037', 5, '2026-03-10', 6, 35, 3, 9, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(109, 'Radis', 'LEFLEG038', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / E / LEGUMES & FRUITS / LEGUMES / LEFLEG038', 5, '2026-04-10', 6, 35, 3, 9, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(110, 'Tomates Fraiches', 'LEFLEG039', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / E / LEGUMES & FRUITS / LEGUMES / LEFLEG039', 5, '2026-05-10', 6, 35, 3, 9, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(111, 'Tomates Cerises', 'LEFLEG040', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / E / LEGUMES & FRUITS / LEGUMES / LEFLEG040', 5, '2026-06-10', 6, 35, 3, 9, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(112, 'TOPINAMBOUR', 'LEFLEG041', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / E / LEGUMES & FRUITS / LEGUMES / LEFLEG041', 5, '2026-07-10', 6, 35, 3, 9, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(113, 'PATATE DOUCE', 'LEFLEG042', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / E / LEGUMES & FRUITS / LEGUMES / LEFLEG042', 5, '2026-08-10', 6, 35, 3, 9, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(114, 'Ananas Frais', 'LEFFRU001', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / E / LEGUMES & FRUITS / FRUITS / LEFFRU001', 5, '2026-09-10', 6, 36, 3, 9, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(115, 'Bananes', 'LEFFRU002', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / E / LEGUMES & FRUITS / FRUITS / LEFFRU002', 5, '2026-10-10', 6, 36, 3, 9, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(116, 'Clémentines', 'LEFFRU003', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / E / LEGUMES & FRUITS / FRUITS / LEFFRU003', 5, '2026-11-10', 6, 36, 3, 9, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(117, 'Fraises', 'LEFFRU004', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / E / LEGUMES & FRUITS / FRUITS / LEFFRU004', 5, '2026-12-10', 6, 36, 3, 9, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(118, 'Grenadines', 'LEFFRU005', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / E / LEGUMES & FRUITS / FRUITS / LEFFRU005', 5, '2027-01-10', 6, 36, 3, 9, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(119, 'Kiwi', 'LEFFRU006', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / E / LEGUMES & FRUITS / FRUITS / LEFFRU006', 5, '2027-02-10', 6, 36, 3, 9, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(120, 'Oranges de Table', 'LEFFRU007', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / F / LEGUMES & FRUITS / FRUITS / LEFFRU007', 5, '2027-03-10', 6, 36, 3, 10, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(121, 'Oranges à presser', 'LEFFRU008', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / F / LEGUMES & FRUITS / FRUITS / LEFFRU008', 5, '2027-04-10', 6, 36, 3, 10, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(122, 'Poires', 'LEFFRU009', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / F / LEGUMES & FRUITS / FRUITS / LEFFRU009', 5, '2027-05-10', 6, 36, 3, 10, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(123, 'Pomme Fruits', 'LEFFRU010', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / F / LEGUMES & FRUITS / FRUITS / LEFFRU010', 5, '2027-06-10', 6, 36, 3, 10, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(124, 'Prunes', 'LEFFRU011', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / F / LEGUMES & FRUITS / FRUITS / LEFFRU011', 5, '2027-07-10', 6, 36, 3, 10, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(125, 'Raisins Frais', 'LEFFRU012', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / F / LEGUMES & FRUITS / FRUITS / LEFFRU012', 5, '2025-01-11', 6, 36, 3, 10, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(126, 'Abricots Frais', 'LEFFRU013', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / F / LEGUMES & FRUITS / FRUITS / LEFFRU013', 5, '2025-02-11', 6, 36, 3, 10, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(127, 'Anones Frais', 'LEFFRU014', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / F / LEGUMES & FRUITS / FRUITS / LEFFRU014', 5, '2025-03-11', 6, 36, 3, 10, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(128, 'pastéque', 'LEFFRU015', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / F / LEGUMES & FRUITS / FRUITS / LEFFRU015', 5, '2025-04-11', 6, 36, 3, 10, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(129, 'melon', 'LEFFRU016', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / F / LEGUMES & FRUITS / FRUITS / LEFFRU016', 5, '2025-05-11', 6, 36, 3, 10, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(130, 'cantaloupe', 'LEFFRU017', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / F / LEGUMES & FRUITS / FRUITS / LEFFRU017', 5, '2025-06-11', 6, 36, 3, 10, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(131, 'Papaye', 'LEFFRU018', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / F / LEGUMES & FRUITS / FRUITS / LEFFRU018', 5, '2025-07-11', 6, 36, 3, 10, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(132, 'Kaki', 'LEFFRU019', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / F / LEGUMES & FRUITS / FRUITS / LEFFRU019', 5, '2025-08-11', 6, 36, 3, 10, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(133, 'Framboise', 'LEFFRU020', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / F / LEGUMES & FRUITS / FRUITS / LEFFRU020', 5, '2025-09-11', 6, 36, 3, 10, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(134, 'Cerise', 'LEFFRU021', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / F / LEGUMES & FRUITS / FRUITS / LEFFRU021', 5, '2025-10-11', 6, 36, 3, 10, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(135, 'Calamar Frais', 'PAFPAF001', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / A / POISSON FRAIS / POISSON FRAIS / PAFPAF001', 10, '2025-11-11', 7, 37, 2, 1, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(136, 'Crevettes Frais', 'PAFPAF002', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / A / POISSON FRAIS / POISSON FRAIS / PAFPAF002', 10, '2025-12-11', 7, 37, 2, 1, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(137, 'Crevettes Royal', 'PAFPAF003', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / A / POISSON FRAIS / POISSON FRAIS / PAFPAF003', 10, '2026-01-11', 7, 37, 2, 1, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(138, 'Merlan Frais', 'PAFPAF004', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / A / POISSON FRAIS / POISSON FRAIS / PAFPAF004', 10, '2026-02-11', 7, 37, 2, 1, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(139, 'Sardines Frais', 'PAFPAF005', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / A / POISSON FRAIS / POISSON FRAIS / PAFPAF005', 10, '2026-03-11', 7, 37, 2, 1, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(140, 'Congres Frais', 'PAFPAF006', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / A / POISSON FRAIS / POISSON FRAIS / PAFPAF006', 10, '2026-04-11', 7, 37, 2, 1, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(141, 'Ombrines Frais', 'PAFPAF007', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / A / POISSON FRAIS / POISSON FRAIS / PAFPAF007', 10, '2026-05-11', 7, 37, 2, 1, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(142, 'Pageots Frais', 'PAFPAF008', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / A / POISSON FRAIS / POISSON FRAIS / PAFPAF008', 10, '2026-06-11', 7, 37, 2, 1, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(143, 'Soles Ration Frais', 'PAFPAF009', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / A / POISSON FRAIS / POISSON FRAIS / PAFPAF009', 10, '2026-07-11', 7, 37, 2, 1, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(144, 'Espadon Frais', 'PAFPAF010', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / A / POISSON FRAIS / POISSON FRAIS / PAFPAF010', 10, '2026-08-11', 7, 37, 2, 1, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(145, 'poulpe', 'PAFPAF011', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / A / POISSON FRAIS / POISSON FRAIS / PAFPAF011', 10, '2026-09-11', 7, 37, 2, 1, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(146, 'la seiche', 'PAFPAF012', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / B / POISSON FRAIS / POISSON FRAIS / PAFPAF012', 10, '2026-10-11', 7, 37, 2, 2, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(147, 'la pieuvre', 'PAFPAF013', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / B / POISSON FRAIS / POISSON FRAIS / PAFPAF013', 10, '2026-11-11', 7, 37, 2, 2, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(148, 'la raie', 'PAFPAF014', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / B / POISSON FRAIS / POISSON FRAIS / PAFPAF014', 10, '2026-12-11', 7, 37, 2, 2, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(149, 'les homards', 'PAFPAF015', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / B / POISSON FRAIS / POISSON FRAIS / PAFPAF015', 10, '2027-01-11', 7, 37, 2, 2, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(150, 'Langouste', 'PAFPAF016', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / B / POISSON FRAIS / POISSON FRAIS / PAFPAF016', 10, '2027-02-11', 7, 37, 2, 2, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(151, 'laugoustine', 'PAFPAF017', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / B / POISSON FRAIS / POISSON FRAIS / PAFPAF017', 10, '2027-03-11', 7, 37, 2, 2, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(152, 'les palourdes', 'PAFPAF018', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / B / POISSON FRAIS / POISSON FRAIS / PAFPAF018', 10, '2027-04-11', 7, 37, 2, 2, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(153, 'saint jack', 'PAFPAF019', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / B / POISSON FRAIS / POISSON FRAIS / PAFPAF019', 10, '2027-05-11', 7, 37, 2, 2, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(154, 'les huitres', 'PAFPAF020', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / B / POISSON FRAIS / POISSON FRAIS / PAFPAF020', 10, '2027-06-11', 7, 37, 2, 2, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(155, 'les moules', 'PAFPAF021', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / B / POISSON FRAIS / POISSON FRAIS / PAFPAF021', 10, '2025-01-12', 7, 37, 2, 2, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(156, 'les crabs', 'PAFPAF022', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / B / POISSON FRAIS / POISSON FRAIS / PAFPAF022', 10, '2025-02-12', 7, 37, 2, 2, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(157, 'tourteau', 'PAFPAF023', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / B / POISSON FRAIS / POISSON FRAIS / PAFPAF023', 10, '2025-03-12', 7, 37, 2, 2, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(158, 'araignée de mer', 'PAFPAF024', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / C / POISSON FRAIS / POISSON FRAIS / PAFPAF024', 10, '2025-04-12', 7, 37, 2, 3, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(159, 'Morceaux de Viande avec OS', 'VABVIA001', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / C / VIANDES ABATS / VIANDES / VABVIA001', 5, '2025-05-12', 8, 38, 2, 3, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(160, 'tripes de mouton', 'VABVIA002', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / C / VIANDES ABATS / VIANDES / VABVIA002', 5, '2025-06-12', 8, 38, 2, 3, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(161, 'pied de veau', 'VABVIA003', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / C / VIANDES ABATS / VIANDES / VABVIA003', 5, '2025-07-12', 8, 38, 2, 3, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(162, 'Epaule de Mouton', 'VABVIA004', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / C / VIANDES ABATS / VIANDES / VABVIA004', 5, '2025-08-12', 8, 38, 2, 3, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(163, 'Filet de Bœufs', 'VABVIA005', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / C / VIANDES ABATS / VIANDES / VABVIA005', 5, '2025-09-12', 8, 38, 2, 3, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(164, 'Viande Haché', 'VABVIA006', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / C / VIANDES ABATS / VIANDES / VABVIA006', 5, '2025-10-12', 8, 38, 2, 3, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(165, 'les saucisses', 'VABVIA007', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / C / VIANDES ABATS / VIANDES / VABVIA007', 5, '2025-11-12', 8, 38, 2, 3, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(166, 'Jarret d\'agneau', 'VABVIA008', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / C / VIANDES ABATS / VIANDES / VABVIA008', 5, '2025-12-12', 8, 38, 2, 3, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(167, 'steack de Bœufs', 'VABVIA009', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / C / VIANDES ABATS / VIANDES / VABVIA009', 5, '2026-01-12', 8, 38, 2, 3, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(168, 'rhumsteack', 'VABVIA010', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / C / VIANDES ABATS / VIANDES / VABVIA010', 5, '2026-02-12', 8, 38, 2, 3, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(169, 'entrecote', 'VABVIA011', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / C / VIANDES ABATS / VIANDES / VABVIA011', 5, '2026-03-12', 8, 38, 2, 3, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(170, 'Cervelles de Mouton', 'VABABA001', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / C / VIANDES ABATS / ABATS / VABABA001', 5, '2026-04-12', 8, 39, 2, 3, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(171, 'Foie de Veau', 'VABABA002', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / C / VIANDES ABATS / ABATS / VABABA002', 5, '2026-05-12', 8, 39, 2, 3, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(172, 'Têtes de Moutons', 'VABABA003', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / C / VIANDES ABATS / ABATS / VABABA003', 5, '2026-06-12', 8, 39, 2, 3, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(173, 'Langues de Veau', 'VABABA004', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / D / VIANDES ABATS / ABATS / VABABA004', 5, '2026-07-12', 8, 39, 2, 4, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(174, 'Poulet des Abatoirs vidé plumé et sans jabot', 'VOEVOL001', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / D / VOLAILLES ET ŒUFS / VOLAILLES / VOEVOL001', 5, '2026-08-12', 9, 40, 2, 4, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(175, 'Poulet des Abatoirs beldit', 'VOEVOL002', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / D / VOLAILLES ET ŒUFS / VOLAILLES / VOEVOL002', 5, '2026-09-12', 9, 40, 2, 4, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(176, 'Blanc de Poulet', 'VOEVOL003', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / D / VOLAILLES ET ŒUFS / VOLAILLES / VOEVOL003', 5, '2026-10-12', 9, 40, 2, 4, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(177, 'Cuisse de Poulet', 'VOEVOL004', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / D / VOLAILLES ET ŒUFS / VOLAILLES / VOEVOL004', 5, '2026-11-12', 9, 40, 2, 4, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(178, 'Coquelets', 'VOEVOL005', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / D / VOLAILLES ET ŒUFS / VOLAILLES / VOEVOL005', 5, '2026-12-12', 9, 40, 2, 4, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(179, 'Pigeons', 'VOEVOL006', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / D / VOLAILLES ET ŒUFS / VOLAILLES / VOEVOL006', 5, '2027-01-12', 9, 40, 2, 4, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(180, 'Lapins', 'VOEVOL007', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / D / VOLAILLES ET ŒUFS / VOLAILLES / VOEVOL007', 5, '2027-02-12', 9, 40, 2, 4, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(181, 'FILET DE DINDE', 'VOEVOL008', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / D / VOLAILLES ET ŒUFS / VOLAILLES / VOEVOL008', 5, '2027-03-12', 9, 40, 2, 4, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(182, 'JAMBON DE DINDE FUME', 'VOEVOL009', 15.00, NULL, 'CHAMBRE FROIDE  NEGATIVE / D / VOLAILLES ET ŒUFS / VOLAILLES / VOEVOL009', 5, '2027-04-12', 9, 40, 2, 4, 1, 1, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(183, 'Œufs de 60 grs', 'VOEOEU001', 2.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / VOLAILLES ET ŒUFS / ŒUFS / VOEOEU001', 5, '2027-05-12', 9, 41, 3, 8, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(184, 'Œufs beldi de 60 grs', 'VOEOEU002', 3.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / VOLAILLES ET ŒUFS / ŒUFS / VOEOEU002', 5, '2027-06-12', 9, 41, 3, 8, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(185, 'Œufs de Caille', 'VOEOEU003', 6.00, NULL, 'CHAMBRE FROIDE POSITIVE / D / VOLAILLES ET ŒUFS / ŒUFS / VOEOEU003', 5, '2027-07-12', 9, 41, 3, 8, 1, 6, 1, NULL, NULL, 1.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL, NULL, NULL),
(186, 'Arrache Agrafe ORD', 'FOUSCO001', 3.75, NULL, 'RESERVE FOUNITURE SCOLAIRE / A1 / FOURNITURE / SCOLAIRE / FOUSCO001', 4, '2026-05-04', 4, 15, 1, 30, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(187, 'Blanco Fluide de 20 ml', 'FOUSCO002', 11.25, NULL, 'RESERVE FOUNITURE SCOLAIRE / A1 / FOURNITURE / SCOLAIRE / FOUSCO002', 11, '2026-06-04', 4, 15, 1, 30, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(188, 'Brosses pour Tableaux Magnétique', 'FOUSCO004', 6.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / A1 / FOURNITURE / SCOLAIRE / FOUSCO004', 6, '2026-08-04', 4, 15, 1, 30, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(189, 'Blister de 06 Aimants Magnétiques', 'FOUSCO005', 5.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / A1 / FOURNITURE / SCOLAIRE / FOUSCO005', 5, '2026-09-04', 4, 15, 1, 30, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(190, 'Calculatrices Casio 220 12 Chiffres 1er Choix', 'FOUSCO006', 80.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / A1 / FOURNITURE / SCOLAIRE / FOUSCO006', 80, '2026-10-04', 4, 15, 1, 30, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(191, 'Cahiers de 192 Pages', 'FOUSCO007', 10.34, NULL, 'RESERVE FOUNITURE SCOLAIRE / A1 / FOURNITURE / SCOLAIRE / FOUSCO007', 10, '2026-11-04', 4, 15, 1, 30, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(192, 'Cahiers de 288 Pages FT 21*29,7', 'FOUSCO008', 15.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / A2 / FOURNITURE / SCOLAIRE / FOUSCO008', 15, '2026-12-04', 4, 15, 1, 31, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(193, 'Cahiers Spiral Plastifiées de 140 Pages', 'FOUSCO009', 10.58, NULL, 'RESERVE FOUNITURE SCOLAIRE / A2 / FOURNITURE / SCOLAIRE / FOUSCO009', 11, '2027-01-04', 4, 15, 1, 31, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(194, 'Cahiers Palmier de 96 Pages', 'FOUSCO010', 8.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / A2 / FOURNITURE / SCOLAIRE / FOUSCO010', 8, '2027-02-04', 4, 15, 1, 31, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(195, 'Crayon Noirs', 'FOUSCO011', 0.30, NULL, 'RESERVE FOUNITURE SCOLAIRE / A2 / FOURNITURE / SCOLAIRE / FOUSCO011', 0, '2027-03-04', 4, 15, 1, 31, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(196, 'Crayon Noirs Fabre Castel', 'FOUSCO014', 1.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / A2 / FOURNITURE / SCOLAIRE / FOUSCO014', 1, '2027-06-04', 4, 15, 1, 31, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(197, 'Craie Blanche de 10 pièces', 'FOUSCO015', 3.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / A2 / FOURNITURE / SCOLAIRE / FOUSCO015', 3, '2027-07-04', 4, 15, 1, 31, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(198, 'Coins de Lettres de 50 Piéces', 'FOUSCO016', 8.33, NULL, 'RESERVE FOUNITURE SCOLAIRE / A2 / FOURNITURE / SCOLAIRE / FOUSCO016', 8, '2027-08-04', 4, 15, 1, 31, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(199, 'Classeurs à Levier GF Chrono en Plastique', 'FOUSCO018', 17.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B1 / FOURNITURE / SCOLAIRE / FOUSCO018', 17, '2027-10-04', 4, 15, 1, 32, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(200, 'Classeurs Scolaire GF à 04 Anneaux', 'FOUSCO019', 18.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B1 / FOURNITURE / SCOLAIRE / FOUSCO019', 18, '2027-11-04', 4, 15, 1, 32, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(201, 'Colle Uhu N°12', 'FOUSCO020', 6.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B1 / FOURNITURE / SCOLAIRE / FOUSCO020', 6, '2027-12-04', 4, 15, 1, 32, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(202, 'Chemises Cartonnées', 'FOUSCO021', 0.48, NULL, 'RESERVE FOUNITURE SCOLAIRE / B1 / FOURNITURE / SCOLAIRE / FOUSCO021', 0, '2028-01-04', 4, 15, 1, 32, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL);
INSERT INTO `products` (`id`, `name`, `code_article`, `price_achat`, `code_barre`, `emplacement`, `seuil`, `date_expiration`, `id_categorie`, `id_subcategorie`, `id_local`, `id_rayon`, `id_tva`, `id_unite`, `id_user`, `class`, `photo`, `price_vente`, `created_at`, `updated_at`, `deleted_at`, `date_reception`, `id_fournisseur`) VALUES
(203, 'Chemises à Rabat Elastique', 'FOUSCO022', 6.50, NULL, 'RESERVE FOUNITURE SCOLAIRE / B1 / FOURNITURE / SCOLAIRE / FOUSCO022', 7, '2028-02-04', 4, 15, 1, 32, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(204, 'Encre à Tampon B/R/N ORD', 'FOUSCO024', 6.13, NULL, 'RESERVE FOUNITURE SCOLAIRE / B1 / FOURNITURE / SCOLAIRE / FOUSCO024', 6, '2028-04-04', 4, 15, 1, 32, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(205, 'Enceurs Tampon Bleu', 'FOUSCO025', 13.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B1 / FOURNITURE / SCOLAIRE / FOUSCO025', 13, '2028-05-04', 4, 15, 1, 32, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(206, 'Gomme Blanche', 'FOUSCO026', 3.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B2 / FOURNITURE / SCOLAIRE / FOUSCO026', 3, '2028-06-04', 4, 15, 1, 33, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(207, 'Marqueurs Permanent', 'FOUSCO027', 6.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B2 / FOURNITURE / SCOLAIRE / FOUSCO027', 6, '2026-01-05', 4, 15, 1, 33, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(208, 'Marqueurs Fluorescent', 'FOUSCO028', 6.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B2 / FOURNITURE / SCOLAIRE / FOUSCO028', 6, '2026-02-05', 4, 15, 1, 33, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(209, 'Punaises de Signalisations de 25 piéces', 'FOUSCO029', 25.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B2 / FOURNITURE / SCOLAIRE / FOUSCO029', 25, '2026-03-05', 4, 15, 1, 33, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(210, 'Punaises de 100 piéces', 'FOUSCO030', 5.01, NULL, 'RESERVE FOUNITURE SCOLAIRE / B2 / FOURNITURE / SCOLAIRE / FOUSCO030', 5, '2026-04-05', 4, 15, 1, 33, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(211, 'Paire de Ciseaux', 'FOUSCO033', 19.50, NULL, 'RESERVE FOUNITURE SCOLAIRE / B2 / FOURNITURE / SCOLAIRE / FOUSCO033', 20, '2026-07-05', 4, 15, 1, 33, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(212, 'Registres de 02 Mains', 'FOUSCO034', 21.01, NULL, 'RESERVE FOUNITURE SCOLAIRE / B2 / FOURNITURE / SCOLAIRE / FOUSCO034', 21, '2026-08-05', 4, 15, 1, 33, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(213, 'Registres de 05 Mains', 'FOUSCO037', 24.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B2 / FOURNITURE / SCOLAIRE / FOUSCO037', 24, '2026-11-05', 4, 15, 1, 33, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(214, 'Recharges Agrafe 8/4', 'FOUSCO038', 2.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B2 / FOURNITURE / SCOLAIRE / FOUSCO038', 2, '2026-12-05', 4, 15, 1, 33, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(215, 'Recharges Agrafe 24/6', 'FOUSCO039', 2.60, NULL, 'RESERVE FOUNITURE SCOLAIRE / B2 / FOURNITURE / SCOLAIRE / FOUSCO039', 3, '2027-01-05', 4, 15, 1, 33, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(216, 'Rouleaux de Scotch PF FT 19*33', 'FOUSCO040', 2.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO040', 2, '2027-02-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(217, 'Rouleaux de Scotch GF', 'FOUSCO041', 28.92, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO041', 29, '2027-03-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(218, 'Régles métallique de 60 cm', 'FOUSCO042', 145.83, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO042', 146, '2027-04-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(219, 'Régles métallique de 01 métre', 'FOUSCO043', 180.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO043', 180, '2027-05-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(220, 'Régles Plate de 20 cm', 'FOUSCO044', 3.99, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO044', 4, '2027-06-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(221, 'Régles Plate de 30 cm', 'FOUSCO045', 4.16, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO045', 4, '2027-07-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(222, 'Régles Plate de 40 cm', 'FOUSCO046', 5.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO046', 5, '2027-08-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(223, 'Stylos pour Tableaux Magnétique', 'FOUSCO047', 10.40, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO047', 10, '2027-09-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(224, 'Stylos Feutre Pointe Fine', 'FOUSCO049', 13.33, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO049', 13, '2027-11-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(225, 'Stylos Pilote G2', 'FOUSCO050', 15.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO050', 15, '2027-12-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(226, 'Stylos Pilote G3', 'FOUSCO051', 10.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO051', 10, '2028-01-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(227, 'Stylos Blanco Pélikan 07 ml', 'FOUSCO052', 10.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO052', 10, '2028-02-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(228, 'Stylos Schneider Jaune', 'FOUSCO053', 1.58, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO053', 2, '2028-03-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(229, 'Stylos à Bille Schneider', 'FOUSCO054', 1.25, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO054', 1, '2028-04-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(230, 'Scotchs Magic', 'FOUSCO055', 11.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO055', 11, '2028-05-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(231, 'Scotchs Havane Transparent FT 50*50', 'FOUSCO056', 6.09, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO056', 6, '2028-06-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(232, 'Trombones Square N°625', 'FOUSCO057', 5.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO057', 5, '2028-07-05', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(233, 'Trombones Plastifiées de 100 piéces', 'FOUSCO058', 3.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO058', 3, '2026-01-06', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(234, 'Tailles Crayon Double Usage', 'FOUSCO059', 4.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO059', 4, '2026-02-06', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(235, 'Uhu stick de 21 grs', 'FOUSCO060', 12.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO060', 12, '2026-03-06', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(236, 'Dévidoires Scotch MM', 'FOUSCO061', 19.00, NULL, 'RESERVE FOUNITURE SCOLAIRE / B3 / FOURNITURE / SCOLAIRE / FOUSCO061', 19, '2026-04-06', 4, 15, 1, 34, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(237, 'Agrafeuses Primula 8/4', 'FOUBUR001', 50.00, NULL, 'RESERVE FOUNITURE DE BUREAU / A1 / FOURNITURE / BUREAU / FOUBUR001', 50, '2026-05-06', 4, 16, 6, 22, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(238, 'Agrafeuses GF 24/6', 'FOUBUR002', 70.00, NULL, 'RESERVE FOUNITURE DE BUREAU / A1 / FOURNITURE / BUREAU / FOUBUR002', 70, '2026-06-06', 4, 16, 6, 22, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(239, 'Agrafeuses Pistolet KW Tria Réf: 8513', 'FOUBUR003', 150.00, NULL, 'RESERVE FOUNITURE DE BUREAU / A1 / FOURNITURE / BUREAU / FOUBUR003', 150, '2026-07-06', 4, 16, 6, 22, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(240, 'Album Carte Visite de 288 Cartes', 'FOUBUR004', 46.00, NULL, 'RESERVE FOUNITURE DE BUREAU / A1 / FOURNITURE / BUREAU / FOUBUR004', 46, '2026-08-06', 4, 16, 6, 22, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(241, 'Boite D\'archive en Plastique de 08 cm', 'FOUBUR005', 13.00, NULL, 'RESERVE FOUNITURE DE BUREAU / A1 / FOURNITURE / BUREAU / FOUBUR005', 13, '2026-09-06', 4, 16, 6, 22, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(242, 'Boite D\'archive en Carton PM 85 MM', 'FOUBUR006', 5.42, NULL, 'RESERVE FOUNITURE DE BUREAU / A1 / FOURNITURE / BUREAU / FOUBUR006', 5, '2026-10-06', 4, 16, 6, 22, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(243, 'Boite D\'attache Géante GM', 'FOUBUR007', 10.00, NULL, 'RESERVE FOUNITURE DE BUREAU / A1 / FOURNITURE / BUREAU / FOUBUR007', 10, '2026-11-06', 4, 16, 6, 22, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(244, 'Boite Plein Simili de 12 cm', 'FOUBUR008', 54.20, NULL, 'RESERVE FOUNITURE DE BUREAU / A2 / FOURNITURE / BUREAU / FOUBUR008', 54, '2026-12-06', 4, 16, 6, 23, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(245, 'Bloc Note FT A5', 'FOUBUR011', 4.00, NULL, 'RESERVE FOUNITURE DE BUREAU / A2 / FOURNITURE / BUREAU / FOUBUR011', 4, '2027-03-06', 4, 16, 6, 23, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(246, 'Carnets Bloc Note GF FT A4', 'FOUBUR012', 7.92, NULL, 'RESERVE FOUNITURE DE BUREAU / A2 / FOURNITURE / BUREAU / FOUBUR012', 8, '2027-04-06', 4, 16, 6, 23, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(247, 'Carnets Bloc Note GF FT A5', 'FOUBUR013', 7.00, NULL, 'RESERVE FOUNITURE DE BUREAU / A2 / FOURNITURE / BUREAU / FOUBUR013', 7, '2027-05-06', 4, 16, 6, 23, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(248, 'Chemises en Plastique Perforées', 'FOUBUR014', 1.08, NULL, 'RESERVE FOUNITURE DE BUREAU / A2 / FOURNITURE / BUREAU / FOUBUR014', 1, '2027-06-06', 4, 16, 6, 23, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(249, 'Chemises à lamelles', 'FOUBUR016', 10.83, NULL, 'RESERVE FOUNITURE DE BUREAU / A2 / FOURNITURE / BUREAU / FOUBUR016', 11, '2027-08-06', 4, 16, 6, 23, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(250, 'Chemises Clipsy', 'FOUBUR017', 11.25, NULL, 'RESERVE FOUNITURE DE BUREAU / A2 / FOURNITURE / BUREAU / FOUBUR017', 11, '2027-09-06', 4, 16, 6, 23, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(251, 'Corbeilles à Papier Métallique 35/30 cm', 'FOUBUR019', 55.00, NULL, 'RESERVE FOUNITURE DE BUREAU / B1 / FOURNITURE / BUREAU / FOUBUR019', 55, '2027-11-06', 4, 16, 6, 24, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(252, 'Corbeilles à Papier de 12 litres en Plastique', 'FOUBUR020', 8.00, NULL, 'RESERVE FOUNITURE DE BUREAU / B1 / FOURNITURE / BUREAU / FOUBUR020', 8, '2027-12-06', 4, 16, 6, 24, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(253, 'Dateurs Français Arabe', 'FOUBUR021', 8.50, NULL, 'RESERVE FOUNITURE DE BUREAU / B1 / FOURNITURE / BUREAU / FOUBUR021', 9, '2028-01-06', 4, 16, 6, 24, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(254, 'Enveloppes Blanche FT 11*22', 'FOUBUR022', 0.35, NULL, 'RESERVE FOUNITURE DE BUREAU / B1 / FOURNITURE / BUREAU / FOUBUR022', 0, '2028-02-06', 4, 16, 6, 24, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(255, 'Envoloppes en Kraft Réf : 25 Imp 04 Couleurs', 'FOUBUR023', 1.67, NULL, 'RESERVE FOUNITURE DE BUREAU / B1 / FOURNITURE / BUREAU / FOUBUR023', 2, '2028-03-06', 4, 16, 6, 24, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(256, 'Enveloppes en Kraft Réf : 82 Imp 04 Couleurs', 'FOUBUR024', 2.17, NULL, 'RESERVE FOUNITURE DE BUREAU / B1 / FOURNITURE / BUREAU / FOUBUR024', 2, '2028-04-06', 4, 16, 6, 24, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(257, 'Ensemble de Bureau En Sky de 05 Piéces', 'FOUBUR025', 65.00, NULL, 'RESERVE FOUNITURE DE BUREAU / B1 / FOURNITURE / BUREAU / FOUBUR025', 65, '2028-05-06', 4, 16, 6, 24, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(258, 'Feuilles Transparente FT A4', 'FOUBUR026', 0.47, NULL, 'RESERVE FOUNITURE DE BUREAU / B2 / FOURNITURE / BUREAU / FOUBUR026', 0, '2028-06-06', 4, 16, 6, 25, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(259, 'Feuilles de Dossier Bleu FT A4', 'FOUBUR027', 0.45, NULL, 'RESERVE FOUNITURE DE BUREAU / B2 / FOURNITURE / BUREAU / FOUBUR027', 0, '2026-01-07', 4, 16, 6, 25, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(260, 'Fiches Bristol Blanche FT A4', 'FOUBUR028', 41.00, NULL, 'RESERVE FOUNITURE DE BUREAU / B2 / FOURNITURE / BUREAU / FOUBUR028', 41, '2026-02-07', 4, 16, 6, 25, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(261, 'Lot de 24 Notes Repositionnables FT 76*76', 'FOUBUR029', 86.40, NULL, 'RESERVE FOUNITURE DE BUREAU / B2 / FOURNITURE / BUREAU / FOUBUR029', 86, '2026-03-07', 4, 16, 6, 25, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(262, 'Mi-fins Double FT 21*31 cm 60 grs', 'FOUBUR030', 17.00, NULL, 'RESERVE FOUNITURE DE BUREAU / B2 / FOURNITURE / BUREAU / FOUBUR030', 17, '2026-04-07', 4, 16, 6, 25, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(263, 'Œillets en plastique', 'FOUBUR031', 0.54, NULL, 'RESERVE FOUNITURE DE BUREAU / B2 / FOURNITURE / BUREAU / FOUBUR031', 1, '2026-05-07', 4, 16, 6, 25, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(264, 'Parapheurs de Bureau Dif Couleurs', 'FOUBUR032', 44.50, NULL, 'RESERVE FOUNITURE DE BUREAU / B2 / FOURNITURE / BUREAU / FOUBUR032', 45, '2026-06-07', 4, 16, 6, 25, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(265, 'Pochettes Blanche FT 16*22 cm', 'FOUBUR033', 0.80, NULL, 'RESERVE FOUNITURE DE BUREAU / B2 / FOURNITURE / BUREAU / FOUBUR033', 1, '2026-07-07', 4, 16, 6, 25, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(266, 'Pochettes Blanche FT 22*32 cm', 'FOUBUR034', 1.00, NULL, 'RESERVE FOUNITURE DE BUREAU / B2 / FOURNITURE / BUREAU / FOUBUR034', 1, '2026-08-07', 4, 16, 6, 25, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(267, 'Pochettes Blanche Autodox GF', 'FOUBUR035', 2.95, NULL, 'RESERVE FOUNITURE DE BUREAU / B2 / FOURNITURE / BUREAU / FOUBUR035', 3, '2026-09-07', 4, 16, 6, 25, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(268, 'Pochettes en Kraft FT 22*32 cm', 'FOUBUR036', 3.00, NULL, 'RESERVE FOUNITURE DE BUREAU / B2 / FOURNITURE / BUREAU / FOUBUR036', 3, '2026-10-07', 4, 16, 6, 25, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(269, 'Rame de Papier Bulle Double FT A4', 'FOUBUR037', 50.00, NULL, 'RESERVE FOUNITURE DE BUREAU / B2 / FOURNITURE / BUREAU / FOUBUR037', 50, '2026-11-07', 4, 16, 6, 25, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(270, 'Rame de Papier Bulle Simple FT A4', 'FOUBUR038', 29.17, NULL, 'RESERVE FOUNITURE DE BUREAU / B2 / FOURNITURE / BUREAU / FOUBUR038', 29, '2026-12-07', 4, 16, 6, 25, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(271, 'Rame de Papier Photocopie FT A4', 'FOUBUR039', 32.00, NULL, 'RESERVE FOUNITURE DE BUREAU / B2 / FOURNITURE / BUREAU / FOUBUR039', 32, '2027-01-07', 4, 16, 6, 25, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(272, 'Rame de Papier Photocopie FT A3', 'FOUBUR041', 88.00, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR041', 88, '2027-03-07', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(273, 'Relieurs Porte Tarif Volti-plaste', 'FOUBUR042', 15.00, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR042', 15, '2027-04-07', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(274, 'Serres Feuilles de 04 mm', 'FOUBUR043', 1.33, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR043', 1, '2027-05-07', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(275, 'Serres Feuilles de 06 mm', 'FOUBUR044', 1.50, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR044', 2, '2027-06-07', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(276, 'Serres Feuilles de 08 mm', 'FOUBUR045', 1.90, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR045', 2, '2027-07-07', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(277, 'Serres Feuilles Express de 16 mm', 'FOUBUR046', 0.70, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR046', 1, '2027-08-07', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(278, 'Serres Feuilles Express de 18 mm', 'FOUBUR047', 0.80, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR047', 1, '2027-09-07', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(279, 'Serres Feuilles Express de 20 mm', 'FOUBUR048', 0.90, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR048', 1, '2027-10-07', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(280, 'Spiral en Plastique de 06 mm', 'FOUBUR049', 0.48, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR049', 0, '2027-11-07', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(281, 'Spiral en Plastique de 08 mm', 'FOUBUR052', 0.40, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR052', 0, '2028-02-07', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(282, 'Spiral en Plastique de 10 mm', 'FOUBUR053', 0.45, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR053', 0, '2028-03-07', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(283, 'Spiral en Plastique de 12 mm', 'FOUBUR054', 0.55, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR054', 1, '2028-04-07', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(284, 'Spiral en Plastique de 14 mm', 'FOUBUR055', 0.70, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR055', 1, '2028-05-07', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(285, 'Spiral en Plastique de 16 mm', 'FOUBUR056', 1.20, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR056', 1, '2028-06-07', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(286, 'Toner pour photocopier Canon C-EXV 14 Réf : 113 R00730', 'FOUBUR057', 630.00, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR057', 630, '2028-07-07', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(287, 'Toner pour Photocopier Réf : C-EXV 42', 'FOUBUR058', 170.00, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR058', 170, '2026-01-08', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(288, 'Toner pour Photocopier Konica Minolta 215', 'FOUBUR060', 850.00, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR060', 850, '2026-03-08', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(289, 'Toner pour Photocopier Konica Minolta 216', 'FOUBUR061', 900.00, NULL, 'RESERVE FOUNITURE DE BUREAU / B3 / FOURNITURE / BUREAU / FOUBUR061', 900, '2026-04-08', 4, 16, 6, 26, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(290, 'Boite de Papier Glacé', 'FOUINF001', 291.67, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF001', 292, '2026-05-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(291, 'CD HP Laser Viérge', 'FOUINF002', 2.40, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF002', 2, '2026-06-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(292, 'Cartouche D\'encre HP 652 noirs', 'FOUINF003', 250.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF003', 250, '2026-07-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(293, 'Cartouche D\'encre HP 652 couleurs', 'FOUINF004', 233.34, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF004', 233, '2026-08-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(294, 'Cassettes Magnétique Zip', 'FOUINF005', 66.67, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF005', 67, '2026-09-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(295, 'Cassettes Magnétique Zip Mo 100', 'FOUINF006', 156.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF006', 156, '2026-10-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(296, 'Cassettes Vidéo 120 mm', 'FOUINF007', 39.17, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF007', 39, '2026-11-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(297, 'Cassettes Vidéo 30 mm', 'FOUINF008', 36.71, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF008', 37, '2026-12-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(298, 'Cassettes Radio Sony 90 mm', 'FOUINF009', 17.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF009', 17, '2027-01-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(299, 'Clé USB 128 G', 'FOUINF010', 103.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF010', 103, '2027-02-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(300, 'Disque Dur Portable Seagate Expansion 1TP', 'FOUINF011', 850.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF011', 850, '2027-03-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(301, 'Disquette Ordinateurs 3\" 1/2', 'FOUINF012', 3.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF012', 3, '2027-04-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(302, 'Tapis Souris Antistatique', 'FOUINF013', 20.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF013', 20, '2027-05-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(303, 'Transparente pour Imprimante jet D\'encre', 'FOUINF014', 308.33, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF014', 308, '2027-06-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(304, 'Transparente pour Rétroprojecteur FT A4', 'FOUINF015', 112.50, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF015', 113, '2027-07-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(305, 'Toner pour Imprimante HP Q 7553 A', 'FOUINF017', 1100.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF017', 1100, '2027-09-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(306, 'Toner pour Imprimante HP Q 7115 A', 'FOUINF018', 970.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF018', 970, '2027-10-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(307, 'Toner pour Imprimante HP CE 278 A', 'FOUINF019', 208.33, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF019', 208, '2027-11-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(308, 'Toner pour Imprimante HP CE 505 A', 'FOUINF021', 1380.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A1 / FOURNITURE / INFORMATIQUE / FOUINF021', 1380, '2028-01-08', 4, 17, 8, 28, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(309, 'Toner pour Imprimante HP 285 A', 'FOUINF022', 760.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A2 / FOURNITURE / INFORMATIQUE / FOUINF022', 760, '2028-02-08', 4, 17, 8, 29, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(310, 'Toner pour Imprimante HP 256 A', 'FOUINF024', 650.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A2 / FOURNITURE / INFORMATIQUE / FOUINF024', 650, '2028-04-08', 4, 17, 8, 29, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(311, 'Toner pour Imprimante HP CF 219 A', 'FOUINF025', 650.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A2 / FOURNITURE / INFORMATIQUE / FOUINF025', 650, '2028-05-08', 4, 17, 8, 29, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(312, 'Toner pour Imprimante HP CE 311 A', 'FOUINF026', 600.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A2 / FOURNITURE / INFORMATIQUE / FOUINF026', 600, '2028-06-08', 4, 17, 8, 29, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(313, 'Toner pour Imprimante HP CE 312 A', 'FOUINF027', 600.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A2 / FOURNITURE / INFORMATIQUE / FOUINF027', 600, '2028-07-08', 4, 17, 8, 29, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(314, 'Toner pour Imprimante HP CE 313 A', 'FOUINF028', 600.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A2 / FOURNITURE / INFORMATIQUE / FOUINF028', 600, '2026-01-09', 4, 17, 8, 29, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(315, 'Toner pour Imprimante HP CF 530 A', 'FOUINF029', 650.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A2 / FOURNITURE / INFORMATIQUE / FOUINF029', 650, '2026-02-09', 4, 17, 8, 29, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(316, 'Toner pour Imprimante HP Laser jet D\'origine ( W1360A ) 136A', 'FOUINF030', 520.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A2 / FOURNITURE / INFORMATIQUE / FOUINF030', 520, '2026-03-09', 4, 17, 8, 29, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(317, 'Toner pour Imprimante HP Laser couleur jet D\'origine 222A W2220A Black', 'FOUINF031', 690.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A2 / FOURNITURE / INFORMATIQUE / FOUINF031', 690, '2026-04-09', 4, 17, 8, 29, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(318, 'Toner pour Imprimante HP Laser couleur jet D\'origine 222A W2221A Cyan', 'FOUINF032', 830.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A2 / FOURNITURE / INFORMATIQUE / FOUINF032', 830, '2026-05-09', 4, 17, 8, 29, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(319, 'Toner pour Imprimante HP Laser couleur jet D\'origine 222A W2222A Yellow', 'FOUINF033', 830.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A2 / FOURNITURE / INFORMATIQUE / FOUINF033', 830, '2026-06-09', 4, 17, 8, 29, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(320, 'Toner pour Imprimante HP Laser couleur jet D\'origine 222A W2223A Magenta', 'FOUINF034', 830.00, NULL, 'RESERVE FOUNITURE INFORMATIQUE / A2 / FOURNITURE / INFORMATIQUE / FOUINF034', 830, '2026-07-09', 4, 17, 8, 29, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(321, 'Applique Noirs 4*2 W 2700 K-V TAC', 'FOUELC001', 291.67, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC001', 292, '2026-08-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(322, 'Ampoules de 100 W', 'FOUELC002', 2.40, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC002', 2, '2026-09-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(323, 'Ampoules de 220 V 40 W E14', 'FOUELC004', 233.34, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC004', 233, '2026-10-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(324, 'Ampoules LED 9 W Ingelec', 'FOUELC005', 66.67, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC005', 67, '2026-11-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(325, 'Ampoules LED 5 W OPEL', 'FOUELC006', 156.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC006', 156, '2026-12-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(326, 'Ampoules pour Projecteurs Couleurs 230 V', 'FOUELC007', 39.17, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC007', 39, '2027-01-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(327, 'Ampoules Philips de 60 cm TLD 18 W /54', 'FOUELC008', 36.71, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC008', 37, '2027-02-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(328, 'Ampoules Philips de120 cm TLD 36 W /54', 'FOUELC009', 17.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC009', 17, '2027-03-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(329, 'Disjoncteurs 04 Fil 250 A 660V', 'FOUELC010', 103.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC010', 103, '2027-04-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(330, 'dIsjoncteurs  Combine de 03 Fil', 'FOUELC011', 850.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC011', 850, '2027-05-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(331, 'dIsjoncteurs  Combine de 02 Fil', 'FOUELC015', 112.50, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC015', 113, '2027-06-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(332, 'Fusible pour Projecteurs kg lighting 70 W', 'FOUELC017', 1100.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC017', 1100, '2027-07-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(333, 'Fusible pour Projecteurs GMHh/D 70 W', 'FOUELC018', 970.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC018', 970, '2027-08-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(334, 'Fusible Ampoules 02 Fil hager 32 Ampères', 'FOUELC019', 208.33, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC019', 208, '2027-09-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(335, 'Fusible Ampoules 01 Fil hager 32 Ampères', 'FOUELC020', 870.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC020', 870, '2027-10-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(336, 'Fusible Ampoules 04 Fil hager 60 Ampères', 'FOUELC021', 1380.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC021', 1380, '2027-11-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(337, 'Fusible Bouchon Ampoules 550V 315 Ampères', 'FOUELC022', 760.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC022', 760, '2027-12-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(338, 'Interrupteurs Double Blanc', 'FOUELC023', 1100.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC023', 1100, '2028-01-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(339, 'Interrupteurs simple Blanc', 'FOUELC025', 650.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC025', 650, '2028-02-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(340, 'Projecteurs 500 W Étanche', 'FOUELC026', 600.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC026', 600, '2028-03-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(341, 'Prises électrique Blanc Ingelec 2p+t', 'FOUELC027', 600.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC027', 600, '2028-04-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(342, 'Piquets Gris GU 10  04 W IP  54', 'FOUELC028', 600.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC028', 600, '2028-05-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(343, 'Rallonge de 05 Mètres 04 Prises ingelec', 'FOUELC029', 650.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC029', 650, '2028-06-09', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(344, 'Rallonge de 10 Mètres 04 Prises  ingelec', 'FOUELC030', 520.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC030', 520, '2026-01-10', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(345, 'Scotchs Noirs électrique', 'FOUELC031', 690.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC031', 690, '2026-02-10', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(346, 'Spots Halogéne Réf; G4 230 V  35 W', 'FOUELC032', 830.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC032', 830, '2026-03-10', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(347, 'Starter pour Ampoules Néon  30-40 W', 'FOUELC033', 830.00, NULL, 'RESERVE FOUNITURE ELECTRIQUE / C / FOURNITURE / ELECTRIQUE / FOUELC033', 830, '2026-04-10', 4, 18, 7, 27, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(348, 'Balais Synthétique avec Manche', 'FOUELC073', 16.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUELC073', 16, '2028-05-10', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(349, 'Balais Paille de Riz', 'FOUNET002', 33.33, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET002', 33, '2028-07-10', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(350, 'Boite de Mouchoirs de 550 Feuilles 02 P+B15:B60+B15:B40+B15:B40lis', 'FOUNET004', 9.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET004', 9, '2026-02-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(351, 'Brosses à Linge GF avec manche', 'FOUNET005', 30.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET005', 30, '2026-03-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(352, 'Brosses Sanitaire en Plastique', 'FOUNET006', 30.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET006', 30, '2026-04-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(353, 'Brosse Synthétique Tapis Avec Roulettes', 'FOUNET007', 15.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET007', 15, '2026-05-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(354, 'Chamoisines', 'FOUNET008', 6.80, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET008', 7, '2026-06-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(355, 'Chamoisines en coton 40*45', 'FOUNET010', 5.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET010', 5, '2026-08-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(356, 'Chiffons Microfibre 40*40', 'FOUNET011', 10.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET011', 10, '2026-09-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(357, 'Débouche Bien de 400 Grs', 'FOUNET012', 10.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET012', 10, '2026-10-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(358, 'Désinfectant multi usage de 01 litre', 'FOUNET013', 25.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET013', 25, '2026-11-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(359, 'Désinfectant Anti Rouille Textile K2R', 'FOUNET014', 25.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET014', 25, '2026-12-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(360, 'Désodorisant Spray de 400 ml', 'FOUNET015', 15.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET015', 15, '2027-01-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(361, 'Eau de Javel de 01 litre', 'FOUNET016', 6.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET016', 6, '2027-02-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(362, 'Eponges Mousse', 'FOUNET017', 1.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET017', 1, '2027-03-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(363, 'Eponges Pulvo-pro', 'FOUNET018', 1.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET018', 1, '2027-04-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(364, 'Eponges Métallique', 'FOUNET019', 0.35, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET019', 0, '2027-05-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(365, 'Essuie Mains ( Boite de 06 Rouleaux )', 'FOUNET020', 210.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET020', 210, '2027-06-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(366, 'Insecticide de 300 ml', 'FOUNET021', 18.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET021', 18, '2027-07-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(367, 'Liteau en Coton 60 cm*75 cm', 'FOUNET022', 20.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET022', 20, '2027-08-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(368, 'Liteau en Coton 100% 01m*60 cm', 'FOUNET023', 35.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET023', 35, '2027-09-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(369, 'Liteau en Coton 100% 01m*01 m', 'FOUNET024', 45.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET024', 45, '2027-10-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(370, 'Laines D\'acier', 'FOUNET025', 0.42, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET025', 0, '2027-11-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(371, 'Nettoyant Rénovateur pour Aluminium de 01 litre', 'FOUNET026', 190.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET026', 190, '2027-12-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(372, 'Papier Hygiénique 02 Plis Super Soft (Boite de 24 Rouleaux)', 'FOUNET027', 65.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET027', 65, '2028-01-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(373, 'Papier Hygiénique GF', 'FOUNET028', 34.25, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET028', 34, '2028-02-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(374, 'Papier Hygiénique PF', 'FOUNET030', 2.50, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET030', 3, '2028-04-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(375, 'Peaux de Chamois GM', 'FOUNET031', 55.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET031', 55, '2028-05-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(376, 'Poubelles en Plastique 85', 'FOUNET032', 140.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET032', 140, '2028-06-11', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(377, 'Pelles en Plastique avec Manche', 'FOUNET035', 30.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET035', 30, '2026-03-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(378, 'Produit Dégraissant Prof- de Cuisine', 'FOUNET036', 34.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET036', 34, '2026-04-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(379, 'Produit de Nettoyage pour Cuivre de 250 ml', 'FOUNET037', 45.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET037', 45, '2026-05-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(380, 'Raclettes en Plastique avec manche', 'FOUNET038', 20.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET038', 20, '2026-06-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(381, 'Raclettes Vitre Professionnelle', 'FOUNET039', 22.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET039', 22, '2026-07-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(382, 'Raclettes de Nettoyage pour Parquet', 'FOUNET040', 25.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET040', 25, '2026-08-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(383, 'Sani croix de 01 litre', 'FOUNET041', 13.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET041', 13, '2026-09-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(384, 'Serpilliéres Jaune', 'FOUNET042', 7.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET042', 7, '2026-10-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(385, 'Seaux en Plastique de 15 litres GM', 'FOUNET043', 15.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET043', 15, '2026-11-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(386, 'Sacs en Plastique pour Poubelle 100 litre', 'FOUNET045', 35.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET045', 35, '2027-01-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(387, 'Savon en Morceaux de 250 grs', 'FOUNET046', 5.50, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET046', 6, '2027-02-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(388, 'Savon de Machine à laver de 05 kg', 'FOUNET047', 100.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET047', 100, '2027-03-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(389, 'Savon en Pâte Miti usage de 01 kg', 'FOUNET048', 13.50, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET048', 14, '2027-04-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(390, 'Savon Liquide Mains Antibactérien Extra de 500 ml', 'FOUNET049', 12.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET049', 12, '2027-05-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(391, 'Serviettes de Papier de 50 Piéces', 'FOUNET050', 13.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET050', 13, '2027-06-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL);
INSERT INTO `products` (`id`, `name`, `code_article`, `price_achat`, `code_barre`, `emplacement`, `seuil`, `date_expiration`, `id_categorie`, `id_subcategorie`, `id_local`, `id_rayon`, `id_tva`, `id_unite`, `id_user`, `class`, `photo`, `price_vente`, `created_at`, `updated_at`, `deleted_at`, `date_reception`, `id_fournisseur`) VALUES
(392, 'Serviettes de Papier Rouge de 30 Piéces', 'FOUNET051', 13.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET051', 13, '2027-07-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(393, 'Serviettes de Papier pour Distributeur Zig Zag', 'FOUNET052', 18.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET052', 18, '2027-08-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(394, 'Tampons abrasif', 'FOUNET053', 1.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET053', 1, '2027-09-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(395, 'Torchons de Cuisine Professionnel pour Nettoyage', 'FOUNET054', 6.50, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET054', 7, '2027-10-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(396, 'Torchons Essuie Main 50*70 cm', 'FOUNET055', 13.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET055', 13, '2027-11-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(397, 'Venteuse avec Manche', 'FOUNET056', 22.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET056', 22, '2027-12-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(398, 'Vim en Poudre de 500 grs', 'FOUNET057', 22.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET057', 22, '2028-01-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(399, 'Vinaigre Blanc Pour Nettoyage de 500 ml', 'FOUNET058', 6.00, NULL, 'RESERVE PRODUITS DE NETTOYAGE / A / FOURNITURE / NETTOYAGE / FOUNET058', 6, '2028-02-12', 4, 20, 12, 40, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(400, 'Cumin Moulu', 'EPLEMA001', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / EPICES MAROCAINES / EPLEMA001', 30, '2027-12-02', 5, 25, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(401, 'Curcuma Moulu', 'EPLEMA002', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / EPICES MAROCAINES / EPLEMA002', 30, '2028-01-02', 5, 25, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(402, 'Gingembre Moulu', 'EPLEMA003', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / EPICES MAROCAINES / EPLEMA003', 30, '2028-02-02', 5, 25, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(403, 'Cannelle Moulu', 'EPLEMA004', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / EPICES MAROCAINES / EPLEMA004', 30, '2028-03-02', 5, 25, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(404, 'Cannelle en Branche', 'EPLEMA005', 30.00, NULL, 'ECONOMAT / C / EPICERIE & PRODUITS LAITIERS / EPICES MAROCAINES / EPLEMA005', 30, '2028-04-02', 5, 25, 4, 13, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(405, 'Piment Moulu', 'EPLEMA006', 30.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / EPICES MAROCAINES / EPLEMA006', 30, '2028-05-02', 5, 25, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(406, 'Piment Fort', 'EPLEMA007', 30.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / EPICES MAROCAINES / EPLEMA007', 30, '2028-06-02', 5, 25, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(407, 'Poivre Moulu', 'EPLEMA008', 30.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / EPICES MAROCAINES / EPLEMA008', 30, '2028-07-02', 5, 25, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(408, 'Safran Fleurs', 'EPLEMA009', 30.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / EPICES MAROCAINES / EPLEMA009', 30, '2028-08-02', 5, 25, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL, NULL, NULL),
(409, 'Sel de Cuisine', 'EPLEMA010', 30.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / EPICES MAROCAINES / EPLEMA010', 30, '2028-09-02', 5, 25, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(410, 'Sel de Table de 500 grs', 'EPLEMA011', 30.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / EPICES MAROCAINES / EPLEMA011', 30, '2028-10-02', 5, 25, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(411, 'Gomme Arabiques', 'EPLCON001', 18.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON001', 18, '2028-11-02', 5, 26, 4, 14, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(412, 'Poivre en Grains', 'EPLCON002', 12.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON002', 12, '2028-12-02', 5, 26, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(413, 'Noix de Muscade', 'EPLCON003', 15.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON003', 15, '2029-01-02', 5, 26, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(414, 'Sauce Soja de 150 ml', 'EPLCON004', 22.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON004', 22, '2029-02-02', 5, 26, 4, 14, 1, 9, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(415, 'Moutarde de 100 grs', 'EPLCON005', 25.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON005', 25, '2029-03-02', 5, 26, 4, 14, 1, 8, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(416, 'Vinaigre de 50 cl', 'EPLCON006', 18.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON006', 18, '2029-04-02', 5, 26, 4, 14, 1, 9, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(417, 'Vinaigre de 25 cl', 'EPLCON007', 12.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON007', 12, '2027-01-03', 5, 26, 4, 14, 1, 9, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(418, 'Noix de Coco', 'EPLCON008', 15.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON008', 15, '2027-02-03', 5, 26, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(419, 'Sésames', 'EPLCON009', 22.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON009', 22, '2027-03-03', 5, 26, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(420, 'Sésames Blanc', 'EPLCON010', 25.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON010', 25, '2027-04-03', 5, 26, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(421, 'Anis Verte', 'EPLCON011', 18.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON011', 18, '2027-05-03', 5, 26, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(422, 'Eau de Fleur D\'oranger', 'EPLCON012', 12.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON012', 12, '2027-06-03', 5, 26, 4, 14, 1, 9, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(423, 'Grains de Girofle', 'EPLCON013', 15.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON013', 15, '2027-07-03', 5, 26, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(424, 'Ail Rouge', 'EPLCON014', 22.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON014', 22, '2027-08-03', 5, 26, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(425, 'CERISES ROUGES', 'EPLCON015', 25.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON015', 25, '2027-09-03', 5, 26, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(426, 'CERISES VERTES', 'EPLCON016', 15.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON016', 15, '2027-10-03', 5, 26, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(427, 'NAPPAGE', 'EPLCON017', 22.00, NULL, 'ECONOMAT / D / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON017', 22, '2027-11-03', 5, 26, 4, 14, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(428, 'GLUCOSES', 'EPLCON018', 25.00, NULL, 'ECONOMAT / E / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON018', 25, '2027-12-03', 5, 26, 4, 15, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(429, 'CERISES CONFLITES', 'EPLCON019', 18.00, NULL, 'ECONOMAT / E / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON019', 18, '2028-01-03', 5, 26, 4, 15, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(430, 'MORTADELLE', 'EPLCON020', 12.00, NULL, 'ECONOMAT / E / EPICERIE & PRODUITS LAITIERS / CONDIMENTS / EPLCON020', 12, '2028-02-03', 5, 26, 4, 15, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(431, 'Menthe', 'EPLHEA001', 30.00, NULL, 'ECONOMAT / E / EPICERIE & PRODUITS LAITIERS / HERBES AROMATIQUES / EPLHEA001', 30, '2028-03-03', 5, 27, 4, 15, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(432, 'Thyn', 'EPLHEA002', 30.00, NULL, 'ECONOMAT / E / EPICERIE & PRODUITS LAITIERS / HERBES AROMATIQUES / EPLHEA002', 30, '2028-04-03', 5, 27, 4, 15, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(433, 'Origon', 'EPLHEA003', 30.00, NULL, 'ECONOMAT / E / EPICERIE & PRODUITS LAITIERS / HERBES AROMATIQUES / EPLHEA003', 30, '2028-05-03', 5, 27, 4, 15, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(434, 'Verveine', 'EPLHEA004', 30.00, NULL, 'ECONOMAT / E / EPICERIE & PRODUITS LAITIERS / HERBES AROMATIQUES / EPLHEA004', 30, '2028-06-03', 5, 27, 4, 15, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(435, 'Laurier', 'EPLHEA005', 30.00, NULL, 'ECONOMAT / E / EPICERIE & PRODUITS LAITIERS / HERBES AROMATIQUES / EPLHEA005', 30, '2028-07-03', 5, 27, 4, 15, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(436, 'Romarain', 'EPLHEA006', 30.00, NULL, 'ECONOMAT / E / EPICERIE & PRODUITS LAITIERS / HERBES AROMATIQUES / EPLHEA006', 30, '2028-08-03', 5, 27, 4, 15, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(437, 'Estragon', 'EPLHEA007', 30.00, NULL, 'ECONOMAT / E / EPICERIE & PRODUITS LAITIERS / HERBES AROMATIQUES / EPLHEA007', 30, '2028-09-03', 5, 27, 4, 15, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(438, 'Basilic', 'EPLHEA008', 30.00, NULL, 'ECONOMAT / E / EPICERIE & PRODUITS LAITIERS / HERBES AROMATIQUES / EPLHEA008', 30, '2028-10-03', 5, 27, 4, 15, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(439, 'Ciboulette', 'EPLHEA009', 30.00, NULL, 'ECONOMAT / E / EPICERIE & PRODUITS LAITIERS / HERBES AROMATIQUES / EPLHEA009', 30, '2028-11-03', 5, 27, 4, 15, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(440, 'Fleurs de Câpres', 'EPLHEA010', 30.00, NULL, 'ECONOMAT / E / EPICERIE & PRODUITS LAITIERS / HERBES AROMATIQUES / EPLHEA010', 30, '2028-12-03', 5, 27, 4, 15, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(441, 'Créme Fraiche', 'EPLPRL001', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / A / EPICERIE & PRODUITS LAITIERS / PRODUITS LAITIERS / EPLPRL001', 15, '2029-01-03', 5, 28, 3, 5, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(442, 'Fromage EDAM', 'EPLPRL002', 20.00, NULL, 'CHAMBRE FROIDE POSITIVE / A / EPICERIE & PRODUITS LAITIERS / PRODUITS LAITIERS / EPLPRL002', 20, '2029-02-03', 5, 28, 3, 5, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(443, 'charcuterie', 'EPLPRL003', 20.00, NULL, 'CHAMBRE FROIDE POSITIVE / A / EPICERIE & PRODUITS LAITIERS / PRODUITS LAITIERS / EPLPRL003', 20, '2029-03-03', 5, 28, 3, 5, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(444, 'Fromage Frais', 'EPLPRL004', 20.00, NULL, 'CHAMBRE FROIDE POSITIVE / A / EPICERIE & PRODUITS LAITIERS / PRODUITS LAITIERS / EPLPRL004', 20, '2029-04-03', 5, 28, 3, 5, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(445, 'Lait UHT de 01 litre', 'EPLPRL005', 4.00, NULL, 'CHAMBRE FROIDE POSITIVE / A / EPICERIE & PRODUITS LAITIERS / PRODUITS LAITIERS / EPLPRL005', 4, '2029-05-03', 5, 28, 3, 5, 1, 3, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(446, 'Lait Frais Pasteurisé', 'EPLPRL006', 4.00, NULL, 'CHAMBRE FROIDE POSITIVE / A / EPICERIE & PRODUITS LAITIERS / PRODUITS LAITIERS / EPLPRL006', 4, '2029-06-03', 5, 28, 3, 5, 1, 3, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(447, 'Crème Liquide Top Chef', 'EPLPRL007', 16.00, NULL, 'CHAMBRE FROIDE POSITIVE / A / EPICERIE & PRODUITS LAITIERS / PRODUITS LAITIERS / EPLPRL007', 16, '2029-07-03', 5, 28, 3, 5, 1, 3, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(448, 'Beurre Pasteurisé', 'EPLPRL008', 22.00, NULL, 'CHAMBRE FROIDE POSITIVE / A / EPICERIE & PRODUITS LAITIERS / PRODUITS LAITIERS / EPLPRL008', 22, '2027-01-04', 5, 28, 3, 5, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(449, 'Beurre Rance SMEN', 'EPLPRL009', 120.00, NULL, 'CHAMBRE FROIDE POSITIVE / A / EPICERIE & PRODUITS LAITIERS / PRODUITS LAITIERS / EPLPRL009', 120, '2027-02-04', 5, 28, 3, 5, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(450, 'Petit Lait (Leben)', 'EPLPRL010', 15.00, NULL, 'CHAMBRE FROIDE POSITIVE / B / EPICERIE & PRODUITS LAITIERS / PRODUITS LAITIERS / EPLPRL010', 15, '2027-03-04', 5, 28, 3, 6, 1, 3, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(451, 'Yaourt', 'EPLPRL011', 12.00, NULL, 'CHAMBRE FROIDE POSITIVE / B / EPICERIE & PRODUITS LAITIERS / PRODUITS LAITIERS / EPLPRL011', 12, '2027-04-04', 5, 28, 3, 6, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(452, 'Lait en Poudre', 'EPLPRL012', 20.00, NULL, 'CHAMBRE FROIDE POSITIVE / B / EPICERIE & PRODUITS LAITIERS / PRODUITS LAITIERS / EPLPRL012', 20, '2027-05-04', 5, 28, 3, 6, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(453, 'Eau Minérale de 50 cl', 'EPLBOI001', 3.00, NULL, 'CHAMBRE FROIDE POSITIVE / B / EPICERIE & PRODUITS LAITIERS / BOISSONS / EPLBOI001', 3, '2027-06-04', 5, 29, 3, 6, 1, 3, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(454, 'Eau Minérale de 01,5 LT', 'EPLBOI002', 5.00, NULL, 'CHAMBRE FROIDE POSITIVE / B / EPICERIE & PRODUITS LAITIERS / BOISSONS / EPLBOI002', 5, '2027-07-04', 5, 29, 3, 6, 1, 3, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(455, 'Eau Minérale Gazeuse de 01 lt', 'EPLBOI003', 6.00, NULL, 'CHAMBRE FROIDE POSITIVE / B / EPICERIE & PRODUITS LAITIERS / BOISSONS / EPLBOI003', 6, '2027-08-04', 5, 29, 3, 6, 1, 3, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(456, 'sodas', 'EPLBOI004', 4.00, NULL, 'CHAMBRE FROIDE POSITIVE / B / EPICERIE & PRODUITS LAITIERS / BOISSONS / EPLBOI004', 4, '2027-09-04', 5, 29, 3, 6, 1, 3, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(457, 'Sirop', 'EPLBOI005', 4.00, NULL, 'CHAMBRE FROIDE POSITIVE / B / EPICERIE & PRODUITS LAITIERS / BOISSONS / EPLBOI005', 4, '2027-10-04', 5, 29, 3, 6, 1, 3, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(458, 'POUDRE CACAO', 'EPLCHO001', 20.00, NULL, 'ECONOMAT / F / EPICERIE & PRODUITS LAITIERS / CHOCOLATERIES / EPLCHO001', 20, '2027-11-04', 5, 30, 4, 16, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(459, 'CHOCOLATS NOISETTE', 'EPLCHO002', 20.00, NULL, 'ECONOMAT / F / EPICERIE & PRODUITS LAITIERS / CHOCOLATERIES / EPLCHO002', 20, '2027-12-04', 5, 30, 4, 16, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(460, 'Chocolat Pépites Noirs', 'EPLCHO003', 20.00, NULL, 'ECONOMAT / F / EPICERIE & PRODUITS LAITIERS / CHOCOLATERIES / EPLCHO003', 20, '2028-01-04', 5, 30, 4, 16, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(461, 'Chocolat Pépites Blanc', 'EPLCHO004', 20.00, NULL, 'ECONOMAT / F / EPICERIE & PRODUITS LAITIERS / CHOCOLATERIES / EPLCHO004', 20, '2028-02-04', 5, 30, 4, 16, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(462, 'Chocolat au Lait Riche', 'EPLCHO005', 20.00, NULL, 'ECONOMAT / F / EPICERIE & PRODUITS LAITIERS / CHOCOLATERIES / EPLCHO005', 20, '2028-03-04', 5, 30, 4, 16, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(463, 'Chocolat Blanct Riche', 'EPLCHO006', 20.00, NULL, 'ECONOMAT / F / EPICERIE & PRODUITS LAITIERS / CHOCOLATERIES / EPLCHO006', 20, '2028-04-04', 5, 30, 4, 16, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(464, 'Chocolat Noirs Riche', 'EPLCHO007', 20.00, NULL, 'ECONOMAT / F / EPICERIE & PRODUITS LAITIERS / CHOCOLATERIES / EPLCHO007', 20, '2028-05-04', 5, 30, 4, 16, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(465, 'Sucre Semoule', 'EPLGLU001', 14.00, NULL, 'ECONOMAT / F / EPICERIE & PRODUITS LAITIERS / GLUCIDES / EPLGLU001', 14, '2028-10-04', 5, 32, 4, 16, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(466, 'Sucre en Morceaux', 'EPLGLU002', 14.00, NULL, 'ECONOMAT / F / EPICERIE & PRODUITS LAITIERS / GLUCIDES / EPLGLU002', 14, '2028-11-04', 5, 32, 4, 16, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(467, 'Sucre Glacé Spécial', 'EPLGLU003', 14.00, NULL, 'ECONOMAT / F / EPICERIE & PRODUITS LAITIERS / GLUCIDES / EPLGLU003', 14, '2028-12-04', 5, 32, 4, 16, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(468, 'Sucre Vanille de 75 grs', 'EPLGLU004', 14.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / GLUCIDES / EPLGLU004', 14, '2029-01-04', 5, 32, 4, 17, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(469, 'Sucre Gout de Fleur D\'oranger', 'EPLGLU005', 14.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / GLUCIDES / EPLGLU005', 14, '2029-02-04', 5, 32, 4, 17, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(470, 'Sucre Pain de 02 kg', 'EPLGLU006', 14.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / GLUCIDES / EPLGLU006', 14, '2029-03-04', 5, 32, 4, 17, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(471, 'Café Moulu', 'EPLMOL001', 25.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / MOLECULES / EPLMOL001', 25, '2029-04-04', 5, 33, 4, 17, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(472, 'Thé Vert de 100 grs', 'EPLMOL002', 15.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / MOLECULES / EPLMOL002', 15, '2029-05-04', 5, 33, 4, 17, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(473, 'Pistache', 'EPLFSE001', 150.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / FRUITS SECS / EPLFSE001', 150, '2029-06-04', 5, 31, 4, 17, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(474, 'noix de cajou', 'EPLFSE002', 150.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / FRUITS SECS / EPLFSE002', 150, '2027-01-05', 5, 31, 4, 17, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(475, 'Cacahuètes', 'EPLFSE003', 150.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / FRUITS SECS / EPLFSE003', 150, '2027-02-05', 5, 31, 4, 17, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(476, 'Amandes Décortiquées', 'EPLFSE004', 150.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / FRUITS SECS / EPLFSE004', 150, '2027-03-05', 5, 31, 4, 17, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(477, 'Amandes Effilées', 'EPLFSE005', 150.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / FRUITS SECS / EPLFSE005', 150, '2027-04-05', 5, 31, 4, 17, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(478, 'Amandes Concassés', 'EPLFSE006', 150.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / FRUITS SECS / EPLFSE006', 150, '2027-05-05', 5, 31, 4, 17, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(479, 'Dattes 1er choix', 'EPLFSE007', 150.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / FRUITS SECS / EPLFSE007', 150, '2027-06-05', 5, 31, 4, 17, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(480, 'Dattes Dénoyautée', 'EPLFSE008', 150.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / FRUITS SECS / EPLFSE008', 150, '2027-07-05', 5, 31, 4, 17, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(481, 'Noix Décortiquées', 'EPLFSE009', 150.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / FRUITS SECS / EPLFSE009', 150, '2027-08-05', 5, 31, 4, 17, 1, 1, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(482, 'Huile Végétale de 01 litre', 'EPLHUI001', 25.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / HUILES / EPLHUI001', 25, '2027-09-05', 5, 34, 4, 17, 1, 3, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(483, 'Huile D\'olive de 01 litre', 'EPLHUI002', 120.00, NULL, 'ECONOMAT / G / EPICERIE & PRODUITS LAITIERS / HUILES / EPLHUI002', 120, '2027-10-05', 5, 34, 4, 17, 1, 3, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(484, 'Bureau en bois 0,60*0,90m avec caisson fixe à 4 tiroirs, couleur marron', 'MOBBUR001', 2000.00, NULL, 'RESERVE  MOBILIER DE BUREAU / A / MOBILIER / BUREAU / MOBBUR001', 2000, '2027-02-09', 3, 11, 5, 18, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(485, 'Bureau 1,50*0,90m avec 2 caissons fixes à 2 tiroirs et un tiroirs au milieu, couleur marron', 'MOBBUR002', 1400.00, NULL, 'RESERVE  MOBILIER DE BUREAU / A / MOBILIER / BUREAU / MOBBUR002', 1400, '2027-03-09', 3, 11, 5, 18, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(486, 'Portrait Hassan II', 'MOBBUR003', 700.00, NULL, 'RESERVE  MOBILIER DE BUREAU / A / MOBILIER / BUREAU / MOBBUR003', 700, '2027-04-09', 3, 11, 5, 18, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(487, 'Bureau de couleur marron de Dim 1,90*0,90m', 'MOBBUR004', 2500.00, NULL, 'RESERVE  MOBILIER DE BUREAU / A / MOBILIER / BUREAU / MOBBUR004', 2500, '2027-05-09', 3, 11, 5, 18, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(488, 'Retour assorti au bureau n°06', 'MOBBUR005', 500.00, NULL, 'RESERVE  MOBILIER DE BUREAU / A / MOBILIER / BUREAU / MOBBUR005', 500, '2027-06-09', 3, 11, 5, 18, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(489, 'Table pour imprimante de Dim 0,50*0,74m', 'MOBBUR006', 500.00, NULL, 'RESERVE  MOBILIER DE BUREAU / A / MOBILIER / BUREAU / MOBBUR006', 500, '2027-07-09', 3, 11, 5, 18, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(490, 'Table ordinateur couleur blanche, dimension 0,80 x 0,80m', 'MOBBUR007', 400.00, NULL, 'RESERVE  MOBILIER DE BUREAU / A / MOBILIER / BUREAU / MOBBUR007', 400, '2027-08-09', 3, 11, 5, 18, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(491, 'Bureau en bois couleur marron', 'MOBBUR008', 1500.00, NULL, 'RESERVE  MOBILIER DE BUREAU / A / MOBILIER / BUREAU / MOBBUR008', 1500, '2027-09-09', 3, 11, 5, 18, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(492, 'Portrait de SM Hassan II, dim 0,70 X 0,60m', 'MOBBUR009', 400.00, NULL, 'RESERVE  MOBILIER DE BUREAU / A / MOBILIER / BUREAU / MOBBUR009', 400, '2027-10-09', 3, 11, 5, 18, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(493, 'Portrait de SM Hassan II, dim 45 X 55 cm', 'MOBBUR010', 400.00, NULL, 'RESERVE  MOBILIER DE BUREAU / A / MOBILIER / BUREAU / MOBBUR010', 400, '2027-11-09', 3, 11, 5, 18, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(494, 'Portrait de SM Hassan II, dim 43 x 51,5 cm', 'MOBBUR011', 400.00, NULL, 'RESERVE  MOBILIER DE BUREAU / B / MOBILIER / BUREAU / MOBBUR011', 400, '2027-12-09', 3, 11, 5, 19, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(495, 'Bureau de couleur blanche de Dim 1,60*0,80m sans caisson', 'MOBBUR015', 2600.00, NULL, 'RESERVE  MOBILIER DE BUREAU / B / MOBILIER / BUREAU / MOBBUR015', 2600, '2028-04-09', 3, 11, 5, 19, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(496, 'Table porte scanner couleur gris moucheté', 'MOBBUR016', 400.00, NULL, 'RESERVE  MOBILIER DE BUREAU / B / MOBILIER / BUREAU / MOBBUR016', 400, '2028-05-09', 3, 11, 5, 19, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(497, 'Table porte ordinateur couleur gris moucheté', 'MOBBUR017', 500.00, NULL, 'RESERVE  MOBILIER DE BUREAU / B / MOBILIER / BUREAU / MOBBUR017', 500, '2028-06-09', 3, 11, 5, 19, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(498, 'Table de réunion de dimension 4 x 1,20m', 'MOBBUR018', 14000.00, NULL, 'RESERVE  MOBILIER DE BUREAU / B / MOBILIER / BUREAU / MOBBUR018', 14000, '2028-07-09', 3, 11, 5, 19, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(499, 'Bureau 1,10 x 0,55m', 'MOBBUR019', 700.00, NULL, 'RESERVE  MOBILIER DE BUREAU / B / MOBILIER / BUREAU / MOBBUR019', 700, '2028-08-09', 3, 11, 5, 19, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(500, 'Fauteuil président sur roulettes, dossier haut piétement sur cinq branches couleur marron moucheté', 'MOBBUR020', 1400.00, NULL, 'RESERVE  MOBILIER DE BUREAU / B / MOBILIER / BUREAU / MOBBUR020', 1400, '2028-09-09', 3, 11, 5, 19, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(501, 'Fauteuil visiteur , dossier bas piétement luge, couleur marron moucheté', 'MOBBUR021', 800.00, NULL, 'RESERVE  MOBILIER DE BUREAU / B / MOBILIER / BUREAU / MOBBUR021', 800, '2028-10-09', 3, 11, 5, 19, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(502, 'Table ordinateur de Dim 80 x 80 couleur Blanche', 'MOBBUR022', 500.00, NULL, 'RESERVE  MOBILIER DE BUREAU / B / MOBILIER / BUREAU / MOBBUR022', 500, '2028-11-09', 3, 11, 5, 19, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(503, 'Table de réunion ronde de couleur grise Diam 1,20m', 'MOBBUR023', 18000.00, NULL, 'RESERVE  MOBILIER DE BUREAU / B / MOBILIER / BUREAU / MOBBUR023', 18000, '2028-12-09', 3, 11, 5, 19, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(504, 'Portrait de SM Hassan II 1,14 x 0,88m', 'MOBBUR024', 500.00, NULL, 'RESERVE  MOBILIER DE BUREAU / B / MOBILIER / BUREAU / MOBBUR024', 500, '2029-01-09', 3, 11, 5, 19, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(505, 'Table basse assortie au bureau n° 06, dim 0,66 x 0,64m', 'MOBBUR025', 450.00, NULL, 'RESERVE  MOBILIER DE BUREAU / B / MOBILIER / BUREAU / MOBBUR025', 450, '2029-02-09', 3, 11, 5, 19, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(506, 'Rayonnage en bois à 10 étagères 1,50 x 2,26m', 'MOBBUR026', 700.00, NULL, 'RESERVE  MOBILIER DE BUREAU / C / MOBILIER / BUREAU / MOBBUR026', 700, '2029-03-09', 3, 11, 5, 20, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(507, 'Armoire  en bois à portes battantes avec des vitres à 2 étagères 1,20 x 2,20m', 'MOBBUR028', 600.00, NULL, 'RESERVE  MOBILIER DE BUREAU / C / MOBILIER / BUREAU / MOBBUR028', 600, '2029-05-09', 3, 11, 5, 20, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(508, 'Rayonnage en bois à 4 étagères 1,60 x 1,70m', 'MOBBUR029', 700.00, NULL, 'RESERVE  MOBILIER DE BUREAU / C / MOBILIER / BUREAU / MOBBUR029', 700, '2029-06-09', 3, 11, 5, 20, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(509, 'Portrait de SM Hassan II', 'MOBBUR030', 500.00, NULL, 'RESERVE  MOBILIER DE BUREAU / C / MOBILIER / BUREAU / MOBBUR030', 500, '2027-01-10', 3, 11, 5, 20, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(510, 'Portrait de SM Hassan II, dim 0,43 x 0,52m', 'MOBBUR032', 300.00, NULL, 'RESERVE  MOBILIER DE BUREAU / C / MOBILIER / BUREAU / MOBBUR032', 300, '2027-03-10', 3, 11, 5, 20, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(511, 'Table de bureau en bois de dim 1,50 x 0,75m sans piétement', 'MOBBUR035', 400.00, NULL, 'RESERVE  MOBILIER DE BUREAU / C / MOBILIER / BUREAU / MOBBUR035', 400, '2027-06-10', 3, 11, 5, 20, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(512, 'Banquettes avec revêtement en tissu', 'MOBBUR036', 1200.00, NULL, 'RESERVE  MOBILIER DE BUREAU / C / MOBILIER / BUREAU / MOBBUR036', 1200, '2027-07-10', 3, 11, 5, 20, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(513, 'Table basse de dim 1,20 x 0,60m', 'MOBBUR037', 350.00, NULL, 'RESERVE  MOBILIER DE BUREAU / C / MOBILIER / BUREAU / MOBBUR037', 350, '2027-08-10', 3, 11, 5, 20, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(514, 'Chaise métallique en skaï noir fixe sur 4 pieds \"Hilton\"', 'MOBMET001', 250.00, NULL, 'RESERVE  MOBILIER DE BUREAU / D / MOBILIER / METALLIQUE / MOBMET001', 250, '2027-09-10', 3, 12, 5, 21, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(515, 'Clapet à 10 cases', 'MOBMET002', 800.00, NULL, 'RESERVE  MOBILIER DE BUREAU / D / MOBILIER / METALLIQUE / MOBMET002', 800, '2027-10-10', 3, 12, 5, 21, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(516, 'Rayonnage  métallique à 4 étagères de Dim 1,80 x 1,90m', 'MOBMET003', 500.00, NULL, 'RESERVE  MOBILIER DE BUREAU / D / MOBILIER / METALLIQUE / MOBMET003', 500, '2027-11-10', 3, 12, 5, 21, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(517, 'Rayonnage métallique à 4 étagères de Dim 1,95 x 1,20m', 'MOBMET004', 500.00, NULL, 'RESERVE  MOBILIER DE BUREAU / D / MOBILIER / METALLIQUE / MOBMET004', 500, '2027-12-10', 3, 12, 5, 21, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(518, 'Clapet de 5 cases', 'MOBMET005', 600.00, NULL, 'RESERVE  MOBILIER DE BUREAU / D / MOBILIER / METALLIQUE / MOBMET005', 600, '2028-01-10', 3, 12, 5, 21, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(519, 'Chaises avec tablettes écritoires semi-métalliques', 'MOBSCO001', 250.00, NULL, 'RESERVE MOBILIER SCOLAIRE / D / MOBILIER / SCOLAIRE / MOBSCO001', 250, '2028-02-10', 3, 13, 10, 37, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(520, 'Tapis R\'bati de couleur marron, dimension 3,50m x 2,50m', 'MOBRES001', 15000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / A / MOBILIER / RESTAURATION / MOBRES001', 15000, '2028-03-10', 3, 14, 9, 35, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(521, 'Table cendrier en bois sculté', 'MOBRES002', 5000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / A / MOBILIER / RESTAURATION / MOBRES002', 5000, '2028-04-10', 3, 14, 9, 35, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(522, 'Tapis R\'bâti couleur rouge, de dim 6,10 x 4,04m', 'MOBRES003', 30000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / A / MOBILIER / RESTAURATION / MOBRES003', 30000, '2028-05-10', 3, 14, 9, 35, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(523, 'Tapis R\'bâti couleur rouge, de dim 5,60 x 2,93m', 'MOBRES004', 27000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / A / MOBILIER / RESTAURATION / MOBRES004', 27000, '2028-06-10', 3, 14, 9, 35, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(524, 'Tapis R\'bâti couleur rouge, de dim 5,48 x 2,59m', 'MOBRES005', 20000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / A / MOBILIER / RESTAURATION / MOBRES005', 20000, '2028-07-10', 3, 14, 9, 35, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(525, 'Tapis R\'bâti couleur rouge, de dim 2,10 x 1,51m', 'MOBRES006', 17000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / A / MOBILIER / RESTAURATION / MOBRES006', 17000, '2028-08-10', 3, 14, 9, 35, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(526, 'Tapis R\'bâti couleur rouge, de dim 2,20 x 1,50m', 'MOBRES007', 17000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / A / MOBILIER / RESTAURATION / MOBRES007', 17000, '2028-09-10', 3, 14, 9, 35, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(527, 'Tapis R\'bâti couleur rouge, de dim 1,80 x 1,49m', 'MOBRES008', 17000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / A / MOBILIER / RESTAURATION / MOBRES008', 17000, '2028-10-10', 3, 14, 9, 35, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(528, 'Tapis R\'bâti couleur rouge, de dim 2,52 x 1,66m', 'MOBRES009', 17000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / A / MOBILIER / RESTAURATION / MOBRES009', 17000, '2028-11-10', 3, 14, 9, 35, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(529, 'Table sculptées, dim 1,13m à 6 pieds sans roulettes', 'MOBRES010', 7000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / A / MOBILIER / RESTAURATION / MOBRES010', 7000, '2028-12-10', 3, 14, 9, 35, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(530, 'Cendriers sculpté, dim 0,47 x 0,38 x 0,49 m', 'MOBRES011', 4000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / A / MOBILIER / RESTAURATION / MOBRES011', 4000, '2029-01-10', 3, 14, 9, 35, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(531, 'Chaises tapissées traditionnelle avec motif artisanaux sur bois', 'MOBRES012', 1000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / A / MOBILIER / RESTAURATION / MOBRES012', 1000, '2029-02-10', 3, 14, 9, 35, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(532, 'Table sculptée, dim 1,14m à 6 pieds', 'MOBRES013', 8000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / A / MOBILIER / RESTAURATION / MOBRES013', 8000, '2029-03-10', 3, 14, 9, 35, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(533, 'Table sculptée, dim 0,99m à 5 pieds sur roulettes', 'MOBRES014', 6000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / B / MOBILIER / RESTAURATION / MOBRES014', 6000, '2029-04-10', 3, 14, 9, 36, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(534, 'Table sculptée, dim 1,10m à 5 pieds sur roulettes', 'MOBRES015', 6000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / B / MOBILIER / RESTAURATION / MOBRES015', 6000, '2029-05-10', 3, 14, 9, 36, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(535, 'Table sculptée, dim 1,10m à 6 pieds sur roulettes', 'MOBRES016', 7000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / B / MOBILIER / RESTAURATION / MOBRES016', 7000, '2029-06-10', 3, 14, 9, 36, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(536, 'Tapis R\'bâti couleur marron,  de dim 4,10 x 2,90m', 'MOBRES017', 12000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / B / MOBILIER / RESTAURATION / MOBRES017', 12000, '2029-07-10', 3, 14, 9, 36, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(537, 'Tapis R\'bâti couleur marron-beige 4,20 x 3,00m', 'MOBRES018', 12000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / B / MOBILIER / RESTAURATION / MOBRES018', 12000, '2027-01-11', 3, 14, 9, 36, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL),
(538, 'Tapis R\'bâti couleur bleu de dim 3,65 x 2,50m', 'MOBRES019', 10000.00, NULL, 'RESERVE MOBILIER DE CUISINE & RESTAURATION / B / MOBILIER / RESTAURATION / MOBRES019', 10000, '2027-02-11', 3, 14, 9, 36, 1, 6, 1, NULL, NULL, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rayons`
--

CREATE TABLE `rayons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `iduser` bigint(20) UNSIGNED NOT NULL,
  `id_local` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rayons`
--

INSERT INTO `rayons` (`id`, `name`, `iduser`, `id_local`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'A', 1, 2, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(2, 'B', 1, 2, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(3, 'C', 1, 2, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(4, 'D', 1, 2, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(5, 'A', 1, 3, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(6, 'B', 1, 3, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(7, 'C', 1, 3, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(8, 'D', 1, 3, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(9, 'E', 1, 3, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(10, 'F', 1, 3, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(11, 'A', 1, 4, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(12, 'B', 1, 4, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(13, 'C', 1, 4, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(14, 'D', 1, 4, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(15, 'E', 1, 4, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(16, 'F', 1, 4, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(17, 'G', 1, 4, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(18, 'A', 1, 5, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(19, 'B', 1, 5, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(20, 'C', 1, 5, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(21, 'D', 1, 5, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(22, 'A1', 1, 6, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(23, 'A2', 1, 6, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(24, 'B1', 1, 6, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(25, 'B2', 1, 6, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(26, 'B3', 1, 6, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(27, 'C', 1, 7, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(28, 'A1', 1, 8, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(29, 'A2', 1, 8, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(30, 'A1', 1, 1, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(31, 'A2', 1, 1, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(32, 'B1', 1, 1, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(33, 'B2', 1, 1, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(34, 'B3', 1, 1, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(35, 'A', 1, 9, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(36, 'B', 1, 9, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(37, 'D', 1, 10, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(38, 'A1', 1, 11, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(39, 'A2', 1, 11, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL),
(40, 'A', 1, 12, '2025-11-23 09:30:44', '2025-11-23 09:30:44', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'Administrateur', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51'),
(2, 'Économe', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51'),
(3, 'Magasinier', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51'),
(4, 'Formateur', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51'),
(5, 'Directeur', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51'),
(6, 'Chargé', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51'),
(7, 'Directeur des études', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51'),
(8, 'Chargé d\'inventaire', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51'),
(9, 'Utilisateur', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51'),
(10, 'Gestionnaire', 'web', '2025-11-23 09:27:51', '2025-11-23 09:27:51'),
(11, 'Agent de saisie', 'web', '2025-11-24 07:59:15', '2025-11-24 07:59:15');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(8, 2),
(9, 2),
(10, 2),
(11, 2),
(12, 2),
(13, 2),
(14, 2),
(15, 2),
(16, 2),
(17, 2),
(18, 2),
(19, 2),
(20, 2),
(21, 2),
(22, 2),
(23, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(29, 2),
(30, 2),
(31, 2),
(32, 2),
(33, 2),
(34, 2),
(35, 2),
(36, 2),
(37, 2),
(38, 2),
(39, 2),
(40, 2),
(41, 2),
(42, 2),
(43, 2),
(53, 2),
(54, 2),
(55, 2),
(56, 2),
(57, 2),
(58, 2),
(59, 2),
(60, 2),
(61, 2),
(62, 2),
(63, 2),
(64, 2),
(65, 2),
(66, 2),
(67, 2),
(68, 2),
(69, 2),
(70, 2),
(71, 2),
(72, 2),
(73, 2),
(74, 2),
(75, 2),
(76, 2),
(1, 3),
(33, 3),
(34, 3),
(35, 3),
(36, 3),
(53, 3),
(54, 3),
(55, 3),
(56, 3),
(57, 3),
(58, 3),
(59, 3),
(60, 3),
(61, 3),
(62, 3),
(63, 3),
(64, 3),
(65, 3),
(66, 3),
(67, 3),
(68, 3),
(70, 3),
(71, 3),
(1, 4),
(33, 4),
(34, 4),
(35, 4),
(53, 4),
(54, 4),
(56, 4),
(57, 4),
(58, 4),
(59, 4),
(60, 4),
(62, 4),
(67, 4),
(68, 4),
(71, 4),
(72, 4),
(73, 4),
(74, 4),
(75, 4),
(76, 4),
(1, 7),
(2, 7),
(3, 7),
(4, 7),
(33, 7),
(34, 7),
(35, 7),
(36, 7),
(57, 7),
(62, 7),
(63, 7),
(64, 7),
(65, 7),
(66, 7),
(67, 7),
(68, 7),
(70, 7),
(71, 7),
(1, 8),
(33, 8),
(34, 8),
(35, 8),
(57, 8),
(62, 8),
(63, 8),
(64, 8),
(65, 8),
(66, 8),
(67, 8),
(68, 8),
(70, 8),
(71, 8),
(1, 9),
(33, 9),
(34, 9),
(37, 9),
(39, 9),
(1, 10),
(33, 10),
(34, 10),
(35, 10),
(53, 10),
(54, 10),
(56, 10),
(57, 10),
(58, 10),
(59, 10),
(60, 10),
(1, 11),
(2, 11),
(3, 11),
(9, 11),
(10, 11),
(11, 11),
(13, 11),
(14, 11),
(15, 11),
(17, 11),
(18, 11),
(19, 11),
(21, 11),
(22, 11),
(23, 11),
(25, 11),
(26, 11),
(27, 11),
(33, 11),
(34, 11),
(35, 11),
(40, 11),
(41, 11),
(42, 11),
(57, 11);

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('bXkqpxjFM39fyisEOGtnlRM4vwzWPg76SW1lJgok', 22, '154.144.252.90', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:145.0) Gecko/20100101 Firefox/145.0', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicXd0Z3hHRUlrdWRkczdzbmJzWTJqMVJwQ2lCYVdRbjQ2VzJ3YVB6SiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NjA6Imh0dHBzOi8vc2t5Ymx1ZS1yYXQtNjA3NTQyLmhvc3RpbmdlcnNpdGUuY29tL0ZhY3R1cmVWZW50ZS9uUiI7czo1OiJyb3V0ZSI7Tjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MjI7czo0OiJhdXRoIjthOjE6e3M6MjE6InBhc3N3b3JkX2NvbmZpcm1lZF9hdCI7aToxNzY0MTQ2NDcxO319', 1764146574);

-- --------------------------------------------------------

--
-- Table structure for table `stock`
--

CREATE TABLE `stock` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_product` bigint(20) UNSIGNED NOT NULL,
  `id_tva` bigint(20) UNSIGNED DEFAULT NULL,
  `id_unite` bigint(20) UNSIGNED DEFAULT NULL,
  `quantite` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `stock`
--

INSERT INTO `stock` (`id`, `id_product`, `id_tva`, `id_unite`, `quantite`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(2, 2, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(3, 3, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(4, 4, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(5, 5, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-24 07:57:59', NULL),
(6, 6, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(7, 7, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(8, 8, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(9, 9, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(10, 10, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(11, 11, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(12, 12, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(13, 13, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(14, 14, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(15, 15, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(16, 16, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(17, 17, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(18, 18, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(19, 19, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(20, 20, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(21, 21, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(22, 22, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(23, 23, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(24, 24, 1, 6, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(25, 25, 1, 1, 99.46, '2025-11-23 09:31:47', '2025-11-24 08:11:45', NULL),
(26, 26, 1, 1, 100.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(27, 27, 1, 1, 100.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(28, 28, 1, 1, 100.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(29, 29, 1, 1, 100.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(30, 30, 1, 1, 100.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(31, 31, 1, 1, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(32, 32, 1, 6, 20.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(33, 33, 1, 7, 20.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(34, 34, 1, 7, 50.00, '2025-11-23 09:31:47', '2025-11-23 09:31:47', NULL),
(35, 35, 1, 8, 40.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(36, 36, 1, 8, 40.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(37, 37, 1, 8, 40.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(38, 38, 1, 8, 40.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(39, 39, 1, 8, 40.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(40, 40, 1, 8, 40.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(41, 41, 1, 8, 40.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(42, 42, 1, 8, 40.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(43, 43, 1, 8, 40.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(44, 44, 1, 8, 40.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(45, 45, 1, 8, 40.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(46, 46, 1, 8, 40.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(47, 47, 1, 8, 40.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(48, 48, 1, 8, 40.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(49, 49, 1, 8, 40.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(50, 50, 1, 1, 20.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(51, 51, 1, 1, 20.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(52, 52, 1, 1, 20.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(53, 53, 1, 1, 20.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(54, 54, 1, 1, 20.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(55, 55, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(56, 56, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(57, 57, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(58, 58, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(59, 59, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(60, 60, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(61, 61, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(62, 62, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(63, 63, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(64, 64, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(65, 65, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(66, 66, 1, 1, 20.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(67, 67, 1, 1, 20.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(68, 68, 1, 1, 20.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(69, 69, 1, 1, 20.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(70, 70, 1, 1, 20.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(71, 71, 1, 1, 20.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(72, 72, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(73, 73, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(74, 74, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(75, 75, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(76, 76, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(77, 77, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(78, 78, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(79, 79, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(80, 80, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(81, 81, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(82, 82, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(83, 83, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(84, 84, 1, 1, 47.91, '2025-11-23 09:31:48', '2025-11-24 08:19:02', NULL),
(85, 85, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(86, 86, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(87, 87, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(88, 88, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(89, 89, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(90, 90, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(91, 91, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(92, 92, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(93, 93, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(94, 94, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(95, 95, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(96, 96, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(97, 97, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(98, 98, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(99, 99, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(100, 100, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(101, 101, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(102, 102, 1, 1, 45.55, '2025-11-23 09:31:48', '2025-11-24 08:19:02', NULL),
(103, 103, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(104, 104, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(105, 105, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(106, 106, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(107, 107, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(108, 108, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(109, 109, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(110, 110, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(111, 111, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(112, 112, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(113, 113, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(114, 114, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(115, 115, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(116, 116, 1, 1, 44.60, '2025-11-23 09:31:48', '2025-11-24 08:11:45', NULL),
(117, 117, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(118, 118, 1, 1, 42.80, '2025-11-23 09:31:48', '2025-11-24 08:11:45', NULL),
(119, 119, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(120, 120, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(121, 121, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(122, 122, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(123, 123, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(124, 124, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(125, 125, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(126, 126, 1, 1, 46.40, '2025-11-23 09:31:48', '2025-11-24 08:11:45', NULL),
(127, 127, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(128, 128, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(129, 129, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(130, 130, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(131, 131, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(132, 132, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(133, 133, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(134, 134, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(135, 135, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(136, 136, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(137, 137, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(138, 138, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(139, 139, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(140, 140, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(141, 141, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(142, 142, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(143, 143, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(144, 144, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(145, 145, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(146, 146, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(147, 147, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(148, 148, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(149, 149, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(150, 150, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(151, 151, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(152, 152, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(153, 153, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(154, 154, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(155, 155, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(156, 156, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(157, 157, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(158, 158, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(159, 159, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(160, 160, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(161, 161, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(162, 162, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(163, 163, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(164, 164, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(165, 165, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(166, 166, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(167, 167, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(168, 168, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(169, 169, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(170, 170, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(171, 171, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(172, 172, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(173, 173, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(174, 174, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(175, 175, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(176, 176, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(177, 177, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(178, 178, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(179, 179, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(180, 180, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(181, 181, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(182, 182, 1, 1, 50.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(183, 183, 1, 6, 300.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(184, 184, 1, 6, 300.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(185, 185, 1, 6, 270.00, '2025-11-23 09:31:48', '2025-11-23 09:31:48', NULL),
(186, 186, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(187, 187, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(188, 188, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(189, 189, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(190, 190, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(191, 191, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(192, 192, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(193, 193, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(194, 194, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(195, 195, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(196, 196, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(197, 197, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(198, 198, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(199, 199, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(200, 200, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(201, 201, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(202, 202, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(203, 203, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(204, 204, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(205, 205, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(206, 206, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(207, 207, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(208, 208, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(209, 209, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(210, 210, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(211, 211, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(212, 212, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(213, 213, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(214, 214, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(215, 215, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(216, 216, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(217, 217, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(218, 218, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(219, 219, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(220, 220, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(221, 221, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(222, 222, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(223, 223, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(224, 224, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(225, 225, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(226, 226, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(227, 227, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(228, 228, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(229, 229, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(230, 230, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(231, 231, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(232, 232, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(233, 233, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(234, 234, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(235, 235, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(236, 236, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(237, 237, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(238, 238, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(239, 239, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(240, 240, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(241, 241, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(242, 242, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(243, 243, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(244, 244, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(245, 245, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(246, 246, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(247, 247, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(248, 248, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(249, 249, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(250, 250, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(251, 251, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(252, 252, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(253, 253, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(254, 254, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(255, 255, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(256, 256, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(257, 257, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(258, 258, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(259, 259, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(260, 260, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(261, 261, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(262, 262, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(263, 263, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(264, 264, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(265, 265, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(266, 266, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(267, 267, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(268, 268, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(269, 269, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(270, 270, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(271, 271, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(272, 272, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(273, 273, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(274, 274, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(275, 275, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(276, 276, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(277, 277, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(278, 278, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(279, 279, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(280, 280, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(281, 281, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(282, 282, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(283, 283, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(284, 284, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(285, 285, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(286, 286, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(287, 287, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(288, 288, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(289, 289, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(290, 290, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(291, 291, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(292, 292, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(293, 293, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(294, 294, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(295, 295, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(296, 296, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(297, 297, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(298, 298, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(299, 299, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(300, 300, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(301, 301, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(302, 302, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(303, 303, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(304, 304, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(305, 305, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(306, 306, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(307, 307, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(308, 308, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(309, 309, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(310, 310, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(311, 311, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(312, 312, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(313, 313, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(314, 314, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(315, 315, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(316, 316, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(317, 317, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(318, 318, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(319, 319, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(320, 320, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(321, 321, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(322, 322, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(323, 323, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(324, 324, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(325, 325, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(326, 326, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(327, 327, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(328, 328, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(329, 329, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(330, 330, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(331, 331, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(332, 332, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(333, 333, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(334, 334, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(335, 335, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(336, 336, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(337, 337, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(338, 338, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(339, 339, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(340, 340, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(341, 341, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(342, 342, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(343, 343, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(344, 344, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(345, 345, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(346, 346, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(347, 347, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(348, 348, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(349, 349, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(350, 350, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(351, 351, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(352, 352, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(353, 353, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(354, 354, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(355, 355, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(356, 356, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(357, 357, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(358, 358, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(359, 359, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(360, 360, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(361, 361, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(362, 362, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(363, 363, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(364, 364, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(365, 365, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(366, 366, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(367, 367, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(368, 368, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(369, 369, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(370, 370, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(371, 371, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(372, 372, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(373, 373, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(374, 374, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(375, 375, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(376, 376, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(377, 377, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(378, 378, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(379, 379, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(380, 380, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(381, 381, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(382, 382, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(383, 383, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(384, 384, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(385, 385, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(386, 386, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(387, 387, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(388, 388, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(389, 389, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(390, 390, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(391, 391, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(392, 392, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(393, 393, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(394, 394, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(395, 395, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(396, 396, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(397, 397, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(398, 398, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(399, 399, 1, 6, 50.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(400, 400, 1, 1, 5.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(401, 401, 1, 1, 5.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(402, 402, 1, 1, 5.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(403, 403, 1, 1, 5.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(404, 404, 1, 1, 5.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(405, 405, 1, 1, 5.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(406, 406, 1, 1, 5.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(407, 407, 1, 1, 5.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(408, 408, 1, 1, 5.00, '2025-11-24 08:24:28', '2025-11-24 08:24:28', NULL),
(409, 409, 1, 1, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(410, 410, 1, 1, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(411, 411, 1, 6, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(412, 412, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(413, 413, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(414, 414, 1, 9, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(415, 415, 1, 8, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(416, 416, 1, 9, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(417, 417, 1, 9, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(418, 418, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(419, 419, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(420, 420, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(421, 421, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(422, 422, 1, 9, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(423, 423, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(424, 424, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(425, 425, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(426, 426, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(427, 427, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(428, 428, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(429, 429, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(430, 430, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(431, 431, 1, 1, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(432, 432, 1, 1, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(433, 433, 1, 1, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(434, 434, 1, 1, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(435, 435, 1, 1, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(436, 436, 1, 1, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(437, 437, 1, 1, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(438, 438, 1, 1, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(439, 439, 1, 1, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(440, 440, 1, 1, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(441, 441, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(442, 442, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(443, 443, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(444, 444, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(445, 445, 1, 3, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(446, 446, 1, 3, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(447, 447, 1, 3, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(448, 448, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(449, 449, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(450, 450, 1, 3, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(451, 451, 1, 6, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(452, 452, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(453, 453, 1, 3, 120.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(454, 454, 1, 3, 60.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(455, 455, 1, 3, 120.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(456, 456, 1, 3, 40.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(457, 457, 1, 3, 40.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(458, 458, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(459, 459, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(460, 460, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(461, 461, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(462, 462, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(463, 463, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(464, 464, 1, 1, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(465, 465, 1, 1, 40.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(466, 466, 1, 1, 40.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(467, 467, 1, 1, 40.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(468, 468, 1, 1, 40.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(469, 469, 1, 1, 40.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(470, 470, 1, 1, 40.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(471, 471, 1, 1, 50.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(472, 472, 1, 1, 50.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(473, 473, 1, 1, 50.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(474, 474, 1, 1, 50.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(475, 475, 1, 1, 50.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(476, 476, 1, 1, 50.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(477, 477, 1, 1, 50.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(478, 478, 1, 1, 50.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(479, 479, 1, 1, 50.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(480, 480, 1, 1, 50.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(481, 481, 1, 1, 50.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(482, 482, 1, 3, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(483, 483, 1, 3, 30.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(484, 484, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(485, 485, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(486, 486, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(487, 487, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(488, 488, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(489, 489, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(490, 490, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(491, 491, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(492, 492, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(493, 493, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(494, 494, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(495, 495, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(496, 496, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(497, 497, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(498, 498, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(499, 499, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(500, 500, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(501, 501, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(502, 502, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(503, 503, 1, 6, 1.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(504, 504, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(505, 505, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(506, 506, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(507, 507, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(508, 508, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(509, 509, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(510, 510, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(511, 511, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(512, 512, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(513, 513, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(514, 514, 1, 6, 300.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(515, 515, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(516, 516, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(517, 517, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(518, 518, 1, 6, 5.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(519, 519, 1, 6, 300.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(520, 520, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(521, 521, 1, 6, 25.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(522, 522, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(523, 523, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(524, 524, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(525, 525, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(526, 526, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(527, 527, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(528, 528, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(529, 529, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(530, 530, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(531, 531, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(532, 532, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(533, 533, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(534, 534, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(535, 535, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(536, 536, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(537, 537, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL),
(538, 538, 1, 6, 10.00, '2025-11-24 08:24:29', '2025-11-24 08:24:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stocktransfer`
--

CREATE TABLE `stocktransfer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `status` enum('Création','Validation','Refus') NOT NULL DEFAULT 'Création',
  `from` int(10) UNSIGNED DEFAULT NULL,
  `refusal_reason` text DEFAULT NULL,
  `to` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `id_categorie` bigint(20) UNSIGNED NOT NULL,
  `iduser` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `name`, `id_categorie`, `iduser`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'CUISINE', 1, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(2, 'RESTAURATION', 1, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(3, 'SCOLAIRE', 1, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(4, 'BUREAU', 1, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(5, 'INFORMATIQUE', 1, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(6, 'AUDIOVISUEL', 1, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(7, 'JARDINAGE', 1, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(8, 'CUISINE', 2, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(9, 'RESTAURATION', 2, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(10, 'PLOMBERIE ET QUINCAILLERIE', 2, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(11, 'BUREAU', 3, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(12, 'METALLIQUE', 3, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(13, 'SCOLAIRE', 3, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(14, 'RESTAURATION', 3, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(15, 'SCOLAIRE', 4, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(16, 'BUREAU', 4, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(17, 'INFORMATIQUE', 4, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(18, 'ELECTRIQUE', 4, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(19, 'PAPITERIE', 4, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(20, 'NETTOYAGE', 4, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(21, 'BOULANGERIE', 5, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(22, 'CONSERVES', 5, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(23, 'LEGUMES SECS (LEGUMINEUSES)', 5, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(24, 'PATTE & FARINEUSE', 5, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(25, 'EPICES MAROCAINES', 5, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(26, 'CONDIMENTS', 5, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(27, 'HERBES AROMATIQUES', 5, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(28, 'PRODUITS LAITIERS', 5, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(29, 'BOISSONS', 5, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(30, 'CHOCOLATERIES', 5, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(31, 'FRUITS SECS', 5, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(32, 'GLUCIDES', 5, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(33, 'MOLECULES', 5, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(34, 'HUILES', 5, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(35, 'LEGUMES', 6, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(36, 'FRUITS', 6, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(37, 'POISSON FRAIS', 7, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(38, 'VIANDES', 8, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(39, 'ABATS', 8, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(40, 'VOLAILLES', 9, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL),
(41, 'ŒUFS', 9, 1, '2025-11-23 09:31:12', '2025-11-23 09:31:12', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `temp_achat`
--

CREATE TABLE `temp_achat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `idproduit` bigint(20) UNSIGNED NOT NULL,
  `id_fournisseur` bigint(20) UNSIGNED DEFAULT NULL,
  `qte` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `temp_plat`
--

CREATE TABLE `temp_plat` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `id_plat` bigint(20) UNSIGNED NOT NULL,
  `idproduit` bigint(20) UNSIGNED NOT NULL,
  `id_unite` bigint(20) UNSIGNED NOT NULL,
  `qte` decimal(10,2) NOT NULL,
  `nombre_couvert` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `temp_plat`
--

INSERT INTO `temp_plat` (`id`, `id_user`, `id_plat`, `idproduit`, `id_unite`, `qte`, `nombre_couvert`, `created_at`, `updated_at`) VALUES
(4, 1, 35, 25, 1, 0.30, 10, '2025-11-23 09:34:55', '2025-11-23 09:34:55'),
(5, 1, 35, 126, 1, 2.00, 10, '2025-11-23 09:34:55', '2025-11-23 09:34:55'),
(6, 1, 35, 116, 1, 3.00, 10, '2025-11-23 09:34:55', '2025-11-23 09:34:55'),
(7, 1, 35, 118, 1, 4.00, 10, '2025-11-23 09:34:55', '2025-11-23 09:34:55');

-- --------------------------------------------------------

--
-- Table structure for table `temp_vente`
--

CREATE TABLE `temp_vente` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `idproduit` bigint(20) UNSIGNED NOT NULL,
  `id_client` bigint(20) UNSIGNED DEFAULT NULL,
  `id_formateur` bigint(20) UNSIGNED DEFAULT NULL,
  `qte` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `idplat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tmpstocktransfer`
--

CREATE TABLE `tmpstocktransfer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_product` bigint(20) UNSIGNED NOT NULL,
  `quantite_stock` decimal(10,2) NOT NULL DEFAULT 0.00,
  `quantite_transfer` decimal(10,2) NOT NULL DEFAULT 0.00,
  `from` bigint(20) UNSIGNED NOT NULL,
  `to` bigint(20) UNSIGNED NOT NULL,
  `iduser` bigint(20) UNSIGNED NOT NULL,
  `idcommande` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tvas`
--

CREATE TABLE `tvas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` decimal(5,2) NOT NULL,
  `iduser` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tvas`
--

INSERT INTO `tvas` (`id`, `name`, `value`, `iduser`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'tv1', 0.00, 1, '2025-11-23 09:28:21', '2025-11-23 09:28:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `unite`
--

CREATE TABLE `unite` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `iduser` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `unite`
--

INSERT INTO `unite` (`id`, `name`, `iduser`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Kg', 1, '2025-11-23 09:29:49', '2025-11-23 09:29:49', NULL),
(2, 'Gramme', 1, '2025-11-23 09:29:49', '2025-11-23 09:29:49', NULL),
(3, 'L', 1, '2025-11-23 09:29:49', '2025-11-23 09:29:49', NULL),
(4, 'T', 1, '2025-11-23 09:29:49', '2025-11-23 09:29:49', NULL),
(5, 'Mètre', 1, '2025-11-23 09:29:49', '2025-11-23 09:29:49', NULL),
(6, 'Unité', 1, '2025-11-23 09:29:49', '2025-11-23 09:29:49', NULL),
(7, 'Paquet', 1, '2025-11-23 09:29:49', '2025-11-23 09:29:49', NULL),
(8, 'Boite', 1, '2025-11-23 09:29:49', '2025-11-23 09:29:49', NULL),
(9, 'Bouteille', 1, '2025-11-23 09:29:49', '2025-11-23 09:29:49', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `matricule` varchar(255) DEFAULT NULL,
  `nom` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `fonction` varchar(255) DEFAULT NULL,
  `service` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `signature` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `matricule`, `nom`, `prenom`, `email`, `email_verified_at`, `password`, `telephone`, `fonction`, `service`, `remember_token`, `created_at`, `updated_at`, `deleted_at`, `signature`) VALUES
(1, NULL, 'ANIA', 'Karima', 'kania@tourisme.gov.ma', NULL, '$2y$12$g75.FU4tcNlFTxzgAaqk/.WW7bSKN0kBR1IlbEzIGUj40QsaSSOse', '0673084048', 'Directrice de l&#039;ISTAHT Touarga', NULL, NULL, '2025-11-23 09:27:51', '2025-11-24 08:07:12', NULL, 'images/signatures/signature_1_1763971632.png'),
(2, NULL, 'EMRAN', 'Chaimae', 'cemran@tourisme.gov.ma', NULL, '$2y$12$TDWN3Eq/KQAqJbNkmAtw0OKr5btPVkzV6v/gGo5sdGbE/0CZXZPTq', '0615293801', 'Econome', NULL, NULL, '2025-11-23 09:27:52', '2025-11-24 08:08:47', NULL, 'images/signatures/signature_2_1763971727.png'),
(3, NULL, 'BOUNIF', 'Jaouad', 'jbounif@tourisme.gov.ma', NULL, '$2y$12$ETBOv3OpQJ71UqFQtwGpTenuHGDf9.PJ0CBLuJwmKf8xtGWZQ2VDO', '0666747039', 'Directeur des études', NULL, NULL, '2025-11-23 09:27:52', '2025-11-24 08:07:39', NULL, 'images/signatures/signature_3_1763971659.png'),
(4, NULL, 'SAIED', 'Leila', 'leilasajed17@gmail.com', NULL, '$2y$12$.8XH4FNwvplGbNkWk7Q5uuxIO.PxEFcPjeBAw8h9NdvggV5BcYutu', NULL, NULL, NULL, NULL, '2025-11-23 09:27:52', '2025-11-24 07:51:09', '2025-11-24 07:51:09', NULL),
(5, NULL, 'CABOUR', 'Fatima', 'fatimacabour@gmail.com', NULL, '$2y$12$5DnF37FwY4wN7vYpGrzsWu/BO36EEGSTW5V3ur7kBpWHPex3K9Mg2', '0666494924', 'Chargée des stages', NULL, NULL, '2025-11-23 09:27:52', '2025-11-24 07:22:29', NULL, NULL),
(6, NULL, 'MRIDA', 'Chafia', 'cmrida@tourisme.gov.ma', NULL, '$2y$12$czh9GQChLS1n7vAcxjRJ2eakSrszZ/xYj/uQMYmmV.CR5hOb6biGy', '0666494963', 'chragée d\'inventaire', NULL, NULL, '2025-11-23 09:27:52', '2025-11-24 08:29:06', NULL, 'images/signatures/signature_6_1763972946.png'),
(7, NULL, 'ATTI', 'Sellamia', 'satti@tourisme.gov.ma', NULL, '$2y$12$.2aTApFKheuy1mlcG/L3/.BKqtfOXzXpM4zHX0raJFNc.WUQ1VQVe', NULL, NULL, NULL, NULL, '2025-11-23 09:27:53', '2025-11-24 07:51:21', '2025-11-24 07:51:21', NULL),
(8, NULL, 'NASRI', 'Souad', 'snasri@tourisme.gov.ma', NULL, '$2y$12$Rq7W1obfrlRx1FYqPAHJMOcIU3YK3VWaBIuXzUXybBpoknMUvJZme', '0625034484', 'responsable Bibliothèque', NULL, NULL, '2025-11-23 09:27:53', '2025-11-24 07:49:09', NULL, NULL),
(9, NULL, 'AFRI', 'Fatima', 'fafri@tourisme.gov.ma', NULL, '$2y$12$FnpCSNK66Q207ucci27RI.HAvNsE/xU4GE2z7dJXj5/yVFhycFhX2', NULL, NULL, NULL, NULL, '2025-11-23 09:27:53', '2025-11-24 08:01:34', '2025-11-24 08:01:34', NULL),
(10, NULL, 'LABAAJ', 'Mustapha', 'mlabaaj@tourisme.gov.ma', NULL, '$2y$12$tzeBtV97P4Ea44H6rPFfweStL4fFFV4bZW4vFuWxencyXSA5ID94W', '0681436602', 'Magasinier', NULL, NULL, '2025-11-23 09:27:53', '2025-11-24 08:09:32', NULL, 'images/signatures/signature_10_1763971772.png'),
(11, NULL, 'JADDOUR', 'Hassan', 'hjaddour@tourisme.gov.ma', NULL, '$2y$12$hT2k6jkBv6U2ytgPfAcAzeAg0YEtZzNNIafaWR8ue8jsP.W6hKdza', NULL, NULL, NULL, NULL, '2025-11-23 09:27:53', '2025-11-24 07:50:57', '2025-11-24 07:50:57', NULL),
(12, NULL, 'AIT BELLA', 'Mohammed', 'maitbella@tourisme.gov.ma', NULL, '$2y$12$QbU2Cwzix4Z1BBlQUUVbl.0rkg1Jw/nOgi1ZlDpmGYaRUxMvazxuu', NULL, NULL, NULL, NULL, '2025-11-23 09:27:54', '2025-11-24 07:50:49', '2025-11-24 07:50:49', NULL),
(13, NULL, 'JID', 'Hicham', 'hjid@tourisme.gov.ma', NULL, '$2y$12$fGnqYiyqS/Ji9PqnmV5GgOspvBRG6IM0XQGdOsSHrGqJKoPFAssFm', NULL, NULL, NULL, NULL, '2025-11-23 09:27:54', '2025-11-24 07:50:41', '2025-11-24 07:50:41', NULL),
(14, NULL, 'BELBACHA', 'Amina', 'abelbacha@tourisme.gov.ma', NULL, '$2y$12$DKabFmPJrWH3Aw1xQex0o.UIamMPhbfoSfcLoVcOA6EGbmDo73EpS', NULL, NULL, NULL, NULL, '2025-11-23 09:27:54', '2025-11-24 07:50:34', '2025-11-24 07:50:34', NULL),
(15, NULL, 'OUAOQA', 'Malika', 'mouaoqa@tourisme.gov.ma', NULL, '$2y$12$hVXaZr9MOkT3vtU5uwoPtOXn3NMY7lILgZWXb00qPwsYoObC1HCY.', NULL, NULL, NULL, NULL, '2025-11-23 09:27:54', '2025-11-24 07:50:20', '2025-11-24 07:50:20', NULL),
(16, NULL, 'BAGHDI', 'Mina', 'mbeghdi70@gmail.com', NULL, '$2y$12$4xWAPzSUhoV/m16kAA5zr.bxTXug95.4rRsGKpyM9cj6cTZ/gIi06', '0654572527', 'Formatrice', NULL, NULL, '2025-11-23 09:27:54', '2025-11-24 07:24:13', NULL, NULL),
(17, NULL, 'AISSAOUI', 'Khadija', 'aissaouikhadija18@gmail.com', NULL, '$2y$12$kMeUK7Obi9.gCFNdHapsXOmLI1bABdI.5eWHubGrwyKINHDPx6tLK', '0666494935', 'Formatrice', NULL, NULL, '2025-11-23 09:27:55', '2025-11-24 07:26:59', NULL, NULL),
(18, NULL, 'SOUHADI', 'Bassma', 'souhadibassmaa@gmail.com', NULL, '$2y$12$yuEzZ7BcdC2W.tit/kKtnODNmyxIxhUwr6mVwoVdsBfge9h/WlP7e', '0621709391', 'Formatrice', NULL, NULL, '2025-11-23 09:27:55', '2025-11-24 07:29:33', NULL, NULL),
(19, NULL, 'ATTIF', 'Ihssane', 'ihssaneattif@gmail.com', NULL, '$2y$12$NTkk2xe.OMa3LAImR.bBQewFUz2upXM/UQx0W7nMmY8aTFkILwEju', '0679945529', 'Formatrice', NULL, NULL, '2025-11-23 09:27:55', '2025-11-24 07:35:34', NULL, NULL),
(20, NULL, 'HAIMOUDI', 'Fatiha', 'fatihahaimoudi@gmail.com', NULL, '$2y$12$Dd0.OqLftDhRZO5Tq1ohjecMLpDx/3.n643Qqyz/ZSoLzeRBD9snO', '0666494975', 'Formatrice', NULL, NULL, '2025-11-23 09:27:55', '2025-11-24 07:41:30', NULL, NULL),
(21, NULL, 'ZIANI', 'Soufian', 'sziani40@gmail.com', NULL, '$2y$12$57rd2QRXMgTZNFu63B1Ci.DYWOiYV/CwaWOonVkaJNIFuiEFiIJ6m', '0606815893', 'Formateur', NULL, NULL, '2025-11-23 09:27:55', '2025-11-24 07:37:44', NULL, NULL),
(22, NULL, 'SEHOUL', 'Jamal', 'jamal.sehoul@gmail.com', NULL, '$2y$12$CckgwFJ1SBY.9huueZUkUOeS0nHOqp7HNGpUKzWUZhOQ18KIL8OwC', '0644884399', 'Formateur', NULL, NULL, '2025-11-23 09:27:55', '2025-11-24 08:28:18', NULL, 'images/signatures/signature_22_1763972898.png'),
(23, NULL, 'EL AZMI', 'Fatima', 'felazmi@tourisme.gov.ma', NULL, '$2y$12$ahyKD6dMhX.DcY8gjT3IzOvjZbXcFvpgt2iFb5K/xk3V0ytqYSQ/O', NULL, NULL, NULL, NULL, '2025-11-23 09:27:56', '2025-11-24 07:50:11', '2025-11-24 07:50:11', NULL),
(24, NULL, 'FOUGNAR', 'Zineb', 'zfougnar@tourisme.gov.ma', NULL, '$2y$12$0Oo198WBDpvf1sRbKNl2iOglrS3WHinwoK2DsEWhmWt9bZbkjNcxO', NULL, NULL, NULL, NULL, '2025-11-23 09:27:56', '2025-11-24 07:49:52', '2025-11-24 07:49:52', NULL),
(25, NULL, 'MOUFKI', 'Sara', 'smoufki@tourisme.gov.ma', NULL, '$2y$12$BZZNqYr1sKeJaQd6SejqguRpbv.wlFlnstfY3kqbjqQqcFnd4XacG', NULL, NULL, NULL, NULL, '2025-11-23 09:27:56', '2025-11-24 07:49:44', '2025-11-24 07:49:44', NULL),
(26, NULL, 'ABADA', 'Hajar', 'habada@tourisme.gov.ma', NULL, '$2y$12$hU2Y4mW08fDyZAIBwRqSWuUGvRbxXQ271n5h5/HT7wtLKpyPbbVKC', NULL, NULL, NULL, NULL, '2025-11-23 09:27:56', '2025-11-24 07:49:39', '2025-11-24 07:49:39', NULL),
(27, NULL, 'OUMADDOUCH', 'El Houssaine', 'eoumaddouch@tourisme.gov.ma', NULL, '$2y$12$IQBnGJVyXmAPlxu45F.CtO/PSK2YZEHswpTOAq42CItj2n5RYe222', NULL, NULL, NULL, NULL, '2025-11-23 09:27:56', '2025-11-24 07:49:35', '2025-11-24 07:49:35', NULL),
(28, NULL, 'DRIOUCH', 'Hassan', 'hdriouch@tourisme.gov.ma', NULL, '$2y$12$WCIJZOkNuQ9jYTLUQHbgoOXN8XesAosJ8rFWNbAQLxwhhm3w00P.6', NULL, NULL, NULL, NULL, '2025-11-23 09:27:57', '2025-11-24 07:49:31', '2025-11-24 07:49:31', NULL),
(29, NULL, 'Goldner', 'Liza', 'hblick@example.net', '2025-11-23 09:27:57', '$2y$12$VgEkfsnl8eLZ6moO8x23OOBKTG6VCy6rKqUFgKCcwHEhAJEBCR.o2', NULL, NULL, NULL, 'HmSzrAZSfe', '2025-11-23 09:27:57', '2025-11-24 07:16:15', '2025-11-24 07:16:15', NULL),
(30, NULL, 'Quigley', 'Lorenzo', 'marisol.torphy@example.com', '2025-11-23 09:27:57', '$2y$12$VgEkfsnl8eLZ6moO8x23OOBKTG6VCy6rKqUFgKCcwHEhAJEBCR.o2', NULL, NULL, NULL, 'zYVa82qTQy', '2025-11-23 09:27:57', '2025-11-24 07:16:12', '2025-11-24 07:16:12', NULL),
(31, NULL, 'Predovic', 'Jamil', 'xnicolas@example.net', '2025-11-23 09:27:57', '$2y$12$VgEkfsnl8eLZ6moO8x23OOBKTG6VCy6rKqUFgKCcwHEhAJEBCR.o2', NULL, NULL, NULL, 'xQssysNiBU', '2025-11-23 09:27:57', '2025-11-24 07:16:09', '2025-11-24 07:16:09', NULL),
(32, NULL, 'Kshlerin', 'Nedra', 'fritsch.vidal@example.org', '2025-11-23 09:27:57', '$2y$12$VgEkfsnl8eLZ6moO8x23OOBKTG6VCy6rKqUFgKCcwHEhAJEBCR.o2', NULL, NULL, NULL, '4YQiYgYRYI', '2025-11-23 09:27:57', '2025-11-24 07:16:06', '2025-11-24 07:16:06', NULL),
(33, NULL, 'Tromp', 'Graham', 'dario70@example.net', '2025-11-23 09:27:57', '$2y$12$VgEkfsnl8eLZ6moO8x23OOBKTG6VCy6rKqUFgKCcwHEhAJEBCR.o2', NULL, NULL, NULL, 'hWQ3maIG2G', '2025-11-23 09:27:57', '2025-11-24 07:16:03', '2025-11-24 07:16:03', NULL),
(34, NULL, 'BELLEMLIH', 'ABDELAZIZ', 'abdelaziz.bellemlih@outlook.com', NULL, '$2y$12$zdhlwVW6He2.dSLMb4Z4Mut8F3pnZtWkaQI5lusyYCPKG3avb.t4C', '0661461671', 'Formateur', NULL, NULL, '2025-11-24 07:40:01', '2025-11-25 23:21:58', NULL, 'images/signatures/signature_34_1764112918.png'),
(35, NULL, 'MAHAN', 'MHAMMED ANAS', 'anasmahan14@gmail.com', NULL, '$2y$12$aa5/TA5.J5qNpLd9r.i4vODEkPMRW4qw.fZappKSfU7etWql30snS', '0627070725', 'Agent de saisie', NULL, NULL, '2025-11-24 07:46:01', '2025-11-24 07:46:01', NULL, 'images/signatures/signature_35_1763970361.png');

-- --------------------------------------------------------

--
-- Table structure for table `ventes`
--

CREATE TABLE `ventes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `numero_serie` int(10) UNSIGNED DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `status` enum('Création','Visa Directeur','Visa Économe','Visa Chargé','Validation','Refus','Livraison','Réception','Visé','Annuler') DEFAULT 'Création',
  `type_commande` enum('Alimentaire','Non Alimentaire','Fournitures et matériels') NOT NULL DEFAULT 'Alimentaire',
  `type_menu` enum('Menu eleves','Menu specials','Menu d''application') DEFAULT NULL,
  `id_client` bigint(20) UNSIGNED DEFAULT NULL,
  `id_formateur` bigint(20) UNSIGNED NOT NULL,
  `is_transfer` tinyint(1) NOT NULL DEFAULT 0,
  `eleves` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `personnel` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `invites` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `divers` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `entree` varchar(255) DEFAULT NULL,
  `plat_principal` varchar(255) DEFAULT NULL,
  `accompagnement` varchar(255) DEFAULT NULL,
  `dessert` varchar(255) DEFAULT NULL,
  `date_usage` date DEFAULT NULL,
  `motif_refus` text DEFAULT NULL,
  `id_user` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ventes`
--

INSERT INTO `ventes` (`id`, `numero_serie`, `total`, `status`, `type_commande`, `type_menu`, `id_client`, `id_formateur`, `is_transfer`, `eleves`, `personnel`, `invites`, `divers`, `entree`, `plat_principal`, `accompagnement`, `dessert`, `date_usage`, `motif_refus`, `id_user`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 1, 258.12, 'Validation', 'Alimentaire', 'Menu eleves', NULL, 34, 0, 18, 0, 0, 0, '35', '6', NULL, '1', '2025-11-28', NULL, 34, '2025-11-24 08:06:14', '2025-11-24 08:11:45', NULL),
(2, 2, 26.40, 'Validation', 'Alimentaire', 'Menu specials', NULL, 34, 0, 20, 0, 0, 0, '37', '8', NULL, '4,3', '2025-11-29', NULL, 34, '2025-11-24 08:13:23', '2025-11-24 08:19:02', NULL),
(3, 3, 735.00, 'Refus', 'Alimentaire', 'Menu eleves', NULL, 21, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, 21, '2025-11-24 08:25:49', '2025-11-26 08:41:21', NULL),
(4, 1, 2060.00, 'Livraison', 'Non Alimentaire', NULL, NULL, 22, 0, 0, 0, 0, 0, NULL, NULL, NULL, NULL, '2025-11-28', NULL, 22, '2025-11-24 08:28:06', '2025-11-24 08:31:41', '2025-11-24 08:31:41'),
(5, 4, 808.50, 'Création', 'Alimentaire', 'Menu eleves', NULL, 22, 0, 100, 20, 10, 0, '36', '7', NULL, '3', '2025-11-28', NULL, 22, '2025-11-26 08:42:49', '2025-11-26 08:42:49', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `achats`
--
ALTER TABLE `achats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `achats_id_fournisseur_foreign` (`id_Fournisseur`),
  ADD KEY `achats_id_user_foreign` (`id_user`);

--
-- Indexes for table `audits`
--
ALTER TABLE `audits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  ADD KEY `audits_user_id_user_type_index` (`user_id`,`user_type`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_iduser_foreign` (`iduser`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clients_iduser_foreign` (`iduser`);

--
-- Indexes for table `consumption_product_details`
--
ALTER TABLE `consumption_product_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consumption_product_details_consumption_id_foreign` (`consumption_id`),
  ADD KEY `consumption_product_details_product_id_foreign` (`product_id`),
  ADD KEY `consumption_product_details_ligne_vente_id_foreign` (`ligne_vente_id`),
  ADD KEY `consumption_product_details_ligne_achat_id_foreign` (`ligne_achat_id`);

--
-- Indexes for table `daily_consumption`
--
ALTER TABLE `daily_consumption`
  ADD PRIMARY KEY (`id`),
  ADD KEY `daily_consumption_vente_id_foreign` (`vente_id`),
  ADD KEY `daily_consumption_achat_id_foreign` (`achat_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fournisseurs_iduser_foreign` (`iduser`);

--
-- Indexes for table `hostorique_sig`
--
ALTER TABLE `hostorique_sig`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hostorique_sig_iduser_foreign` (`iduser`),
  ADD KEY `hostorique_sig_idvente_foreign` (`idvente`);

--
-- Indexes for table `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventories_product_id_foreign` (`product_id`),
  ADD KEY `inventories_id_achat_foreign` (`id_achat`),
  ADD KEY `inventories_id_vente_foreign` (`id_vente`),
  ADD KEY `inventories_created_by_foreign` (`created_by`);

--
-- Indexes for table `inventory_monthly_summaries`
--
ALTER TABLE `inventory_monthly_summaries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventory_monthly_summaries_product_id_year_month_unique` (`product_id`,`year`,`month`);

--
-- Indexes for table `inventory_yearly_summaries`
--
ALTER TABLE `inventory_yearly_summaries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `inventory_yearly_summaries_product_id_year_unique` (`product_id`,`year`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ligne_achat`
--
ALTER TABLE `ligne_achat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ligne_achat_id_user_foreign` (`id_user`),
  ADD KEY `ligne_achat_idachat_foreign` (`idachat`),
  ADD KEY `ligne_achat_idproduit_foreign` (`idproduit`);

--
-- Indexes for table `ligne_plat`
--
ALTER TABLE `ligne_plat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ligne_plat_id_user_foreign` (`id_user`),
  ADD KEY `ligne_plat_id_plat_foreign` (`id_plat`),
  ADD KEY `ligne_plat_idproduit_foreign` (`idproduit`),
  ADD KEY `ligne_plat_id_unite_foreign` (`id_unite`);

--
-- Indexes for table `ligne_vente`
--
ALTER TABLE `ligne_vente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ligne_vente_id_user_foreign` (`id_user`),
  ADD KEY `ligne_vente_idvente_foreign` (`idvente`),
  ADD KEY `ligne_vente_idproduit_foreign` (`idproduit`);

--
-- Indexes for table `line_transfer`
--
ALTER TABLE `line_transfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `line_transfer_id_user_foreign` (`id_user`),
  ADD KEY `line_transfer_id_product_foreign` (`id_product`),
  ADD KEY `line_transfer_id_tva_foreign` (`id_tva`),
  ADD KEY `line_transfer_id_unite_foreign` (`id_unite`),
  ADD KEY `line_transfer_idcommande_foreign` (`idcommande`),
  ADD KEY `line_transfer_id_stocktransfer_foreign` (`id_stocktransfer`);

--
-- Indexes for table `locals`
--
ALTER TABLE `locals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locals_iduser_foreign` (`iduser`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `pertes`
--
ALTER TABLE `pertes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pertes_reference_unique` (`reference`),
  ADD KEY `pertes_id_product_foreign` (`id_product`),
  ADD KEY `pertes_id_category_foreign` (`id_category`),
  ADD KEY `pertes_id_subcategorie_foreign` (`id_subcategorie`),
  ADD KEY `pertes_id_unite_foreign` (`id_unite`),
  ADD KEY `pertes_id_user_foreign` (`id_user`);

--
-- Indexes for table `plats`
--
ALTER TABLE `plats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `plats_iduser_foreign` (`iduser`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_categorie_foreign` (`id_categorie`),
  ADD KEY `products_id_subcategorie_foreign` (`id_subcategorie`),
  ADD KEY `products_id_local_foreign` (`id_local`),
  ADD KEY `products_id_rayon_foreign` (`id_rayon`),
  ADD KEY `products_id_unite_foreign` (`id_unite`),
  ADD KEY `products_id_user_foreign` (`id_user`),
  ADD KEY `products_id_fournisseur_foreign` (`id_fournisseur`),
  ADD KEY `products_id_tva_foreign` (`id_tva`);

--
-- Indexes for table `rayons`
--
ALTER TABLE `rayons`
  ADD PRIMARY KEY (`id`),
  ADD KEY `rayons_iduser_foreign` (`iduser`),
  ADD KEY `rayons_id_local_foreign` (`id_local`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stock_id_product_foreign` (`id_product`),
  ADD KEY `stock_id_tva_foreign` (`id_tva`),
  ADD KEY `stock_id_unite_foreign` (`id_unite`);

--
-- Indexes for table `stocktransfer`
--
ALTER TABLE `stocktransfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `stocktransfer_id_user_foreign` (`id_user`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sub_categories_id_categorie_foreign` (`id_categorie`),
  ADD KEY `sub_categories_iduser_foreign` (`iduser`);

--
-- Indexes for table `temp_achat`
--
ALTER TABLE `temp_achat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `temp_achat_id_user_foreign` (`id_user`),
  ADD KEY `temp_achat_idproduit_foreign` (`idproduit`),
  ADD KEY `temp_achat_id_fournisseur_foreign` (`id_fournisseur`);

--
-- Indexes for table `temp_plat`
--
ALTER TABLE `temp_plat`
  ADD PRIMARY KEY (`id`),
  ADD KEY `temp_plat_id_user_foreign` (`id_user`),
  ADD KEY `temp_plat_id_plat_foreign` (`id_plat`),
  ADD KEY `temp_plat_idproduit_foreign` (`idproduit`),
  ADD KEY `temp_plat_id_unite_foreign` (`id_unite`);

--
-- Indexes for table `temp_vente`
--
ALTER TABLE `temp_vente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `temp_vente_id_user_foreign` (`id_user`),
  ADD KEY `temp_vente_idproduit_foreign` (`idproduit`),
  ADD KEY `temp_vente_id_client_foreign` (`id_client`),
  ADD KEY `temp_vente_id_formateur_foreign` (`id_formateur`);

--
-- Indexes for table `tmpstocktransfer`
--
ALTER TABLE `tmpstocktransfer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tmpstocktransfer_id_product_foreign` (`id_product`),
  ADD KEY `tmpstocktransfer_from_foreign` (`from`),
  ADD KEY `tmpstocktransfer_to_foreign` (`to`),
  ADD KEY `tmpstocktransfer_iduser_foreign` (`iduser`),
  ADD KEY `tmpstocktransfer_idcommande_foreign` (`idcommande`);

--
-- Indexes for table `tvas`
--
ALTER TABLE `tvas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tvas_iduser_foreign` (`iduser`);

--
-- Indexes for table `unite`
--
ALTER TABLE `unite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `unite_iduser_foreign` (`iduser`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `ventes`
--
ALTER TABLE `ventes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ventes_id_client_foreign` (`id_client`),
  ADD KEY `ventes_id_formateur_foreign` (`id_formateur`),
  ADD KEY `ventes_id_user_foreign` (`id_user`),
  ADD KEY `ventes_type_commande_numero_serie_index` (`type_commande`,`numero_serie`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `achats`
--
ALTER TABLE `achats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audits`
--
ALTER TABLE `audits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=785;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `consumption_product_details`
--
ALTER TABLE `consumption_product_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `daily_consumption`
--
ALTER TABLE `daily_consumption`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hostorique_sig`
--
ALTER TABLE `hostorique_sig`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `inventory_monthly_summaries`
--
ALTER TABLE `inventory_monthly_summaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `inventory_yearly_summaries`
--
ALTER TABLE `inventory_yearly_summaries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ligne_achat`
--
ALTER TABLE `ligne_achat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ligne_plat`
--
ALTER TABLE `ligne_plat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `ligne_vente`
--
ALTER TABLE `ligne_vente`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `line_transfer`
--
ALTER TABLE `line_transfer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `locals`
--
ALTER TABLE `locals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `pertes`
--
ALTER TABLE `pertes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `plats`
--
ALTER TABLE `plats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=539;

--
-- AUTO_INCREMENT for table `rayons`
--
ALTER TABLE `rayons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `stock`
--
ALTER TABLE `stock`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=539;

--
-- AUTO_INCREMENT for table `stocktransfer`
--
ALTER TABLE `stocktransfer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `temp_achat`
--
ALTER TABLE `temp_achat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `temp_plat`
--
ALTER TABLE `temp_plat`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `temp_vente`
--
ALTER TABLE `temp_vente`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tmpstocktransfer`
--
ALTER TABLE `tmpstocktransfer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tvas`
--
ALTER TABLE `tvas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `unite`
--
ALTER TABLE `unite`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `ventes`
--
ALTER TABLE `ventes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `achats`
--
ALTER TABLE `achats`
  ADD CONSTRAINT `achats_id_fournisseur_foreign` FOREIGN KEY (`id_Fournisseur`) REFERENCES `fournisseurs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `achats_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_iduser_foreign` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `clients`
--
ALTER TABLE `clients`
  ADD CONSTRAINT `clients_iduser_foreign` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `consumption_product_details`
--
ALTER TABLE `consumption_product_details`
  ADD CONSTRAINT `consumption_product_details_consumption_id_foreign` FOREIGN KEY (`consumption_id`) REFERENCES `daily_consumption` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `consumption_product_details_ligne_achat_id_foreign` FOREIGN KEY (`ligne_achat_id`) REFERENCES `ligne_achat` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `consumption_product_details_ligne_vente_id_foreign` FOREIGN KEY (`ligne_vente_id`) REFERENCES `ligne_vente` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `consumption_product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `daily_consumption`
--
ALTER TABLE `daily_consumption`
  ADD CONSTRAINT `daily_consumption_achat_id_foreign` FOREIGN KEY (`achat_id`) REFERENCES `achats` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `daily_consumption_vente_id_foreign` FOREIGN KEY (`vente_id`) REFERENCES `ventes` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  ADD CONSTRAINT `fournisseurs_iduser_foreign` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `hostorique_sig`
--
ALTER TABLE `hostorique_sig`
  ADD CONSTRAINT `hostorique_sig_iduser_foreign` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `hostorique_sig_idvente_foreign` FOREIGN KEY (`idvente`) REFERENCES `ventes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventories`
--
ALTER TABLE `inventories`
  ADD CONSTRAINT `inventories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `inventories_id_achat_foreign` FOREIGN KEY (`id_achat`) REFERENCES `achats` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `inventories_id_vente_foreign` FOREIGN KEY (`id_vente`) REFERENCES `ventes` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `inventories_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_monthly_summaries`
--
ALTER TABLE `inventory_monthly_summaries`
  ADD CONSTRAINT `inventory_monthly_summaries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `inventory_yearly_summaries`
--
ALTER TABLE `inventory_yearly_summaries`
  ADD CONSTRAINT `inventory_yearly_summaries_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ligne_achat`
--
ALTER TABLE `ligne_achat`
  ADD CONSTRAINT `ligne_achat_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ligne_achat_idachat_foreign` FOREIGN KEY (`idachat`) REFERENCES `achats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ligne_achat_idproduit_foreign` FOREIGN KEY (`idproduit`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ligne_plat`
--
ALTER TABLE `ligne_plat`
  ADD CONSTRAINT `ligne_plat_id_plat_foreign` FOREIGN KEY (`id_plat`) REFERENCES `plats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ligne_plat_id_unite_foreign` FOREIGN KEY (`id_unite`) REFERENCES `unite` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ligne_plat_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ligne_plat_idproduit_foreign` FOREIGN KEY (`idproduit`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ligne_vente`
--
ALTER TABLE `ligne_vente`
  ADD CONSTRAINT `ligne_vente_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ligne_vente_idproduit_foreign` FOREIGN KEY (`idproduit`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ligne_vente_idvente_foreign` FOREIGN KEY (`idvente`) REFERENCES `ventes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `line_transfer`
--
ALTER TABLE `line_transfer`
  ADD CONSTRAINT `line_transfer_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `line_transfer_id_stocktransfer_foreign` FOREIGN KEY (`id_stocktransfer`) REFERENCES `stocktransfer` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `line_transfer_id_tva_foreign` FOREIGN KEY (`id_tva`) REFERENCES `tvas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `line_transfer_id_unite_foreign` FOREIGN KEY (`id_unite`) REFERENCES `unite` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `line_transfer_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `line_transfer_idcommande_foreign` FOREIGN KEY (`idcommande`) REFERENCES `ventes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `locals`
--
ALTER TABLE `locals`
  ADD CONSTRAINT `locals_iduser_foreign` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pertes`
--
ALTER TABLE `pertes`
  ADD CONSTRAINT `pertes_id_category_foreign` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pertes_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pertes_id_subcategorie_foreign` FOREIGN KEY (`id_subcategorie`) REFERENCES `sub_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pertes_id_unite_foreign` FOREIGN KEY (`id_unite`) REFERENCES `unite` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `pertes_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `plats`
--
ALTER TABLE `plats`
  ADD CONSTRAINT `plats_iduser_foreign` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_categorie_foreign` FOREIGN KEY (`id_categorie`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `products_id_fournisseur_foreign` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseurs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_id_local_foreign` FOREIGN KEY (`id_local`) REFERENCES `locals` (`id`),
  ADD CONSTRAINT `products_id_rayon_foreign` FOREIGN KEY (`id_rayon`) REFERENCES `rayons` (`id`),
  ADD CONSTRAINT `products_id_subcategorie_foreign` FOREIGN KEY (`id_subcategorie`) REFERENCES `sub_categories` (`id`),
  ADD CONSTRAINT `products_id_tva_foreign` FOREIGN KEY (`id_tva`) REFERENCES `tvas` (`id`),
  ADD CONSTRAINT `products_id_unite_foreign` FOREIGN KEY (`id_unite`) REFERENCES `unite` (`id`),
  ADD CONSTRAINT `products_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `rayons`
--
ALTER TABLE `rayons`
  ADD CONSTRAINT `rayons_id_local_foreign` FOREIGN KEY (`id_local`) REFERENCES `locals` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `rayons_iduser_foreign` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `stock_id_tva_foreign` FOREIGN KEY (`id_tva`) REFERENCES `tvas` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `stock_id_unite_foreign` FOREIGN KEY (`id_unite`) REFERENCES `unite` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `stocktransfer`
--
ALTER TABLE `stocktransfer`
  ADD CONSTRAINT `stocktransfer_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD CONSTRAINT `sub_categories_id_categorie_foreign` FOREIGN KEY (`id_categorie`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sub_categories_iduser_foreign` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `temp_achat`
--
ALTER TABLE `temp_achat`
  ADD CONSTRAINT `temp_achat_id_fournisseur_foreign` FOREIGN KEY (`id_fournisseur`) REFERENCES `fournisseurs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `temp_achat_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `temp_achat_idproduit_foreign` FOREIGN KEY (`idproduit`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `temp_plat`
--
ALTER TABLE `temp_plat`
  ADD CONSTRAINT `temp_plat_id_plat_foreign` FOREIGN KEY (`id_plat`) REFERENCES `plats` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `temp_plat_id_unite_foreign` FOREIGN KEY (`id_unite`) REFERENCES `unite` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `temp_plat_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `temp_plat_idproduit_foreign` FOREIGN KEY (`idproduit`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `temp_vente`
--
ALTER TABLE `temp_vente`
  ADD CONSTRAINT `temp_vente_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `temp_vente_id_formateur_foreign` FOREIGN KEY (`id_formateur`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `temp_vente_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `temp_vente_idproduit_foreign` FOREIGN KEY (`idproduit`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tmpstocktransfer`
--
ALTER TABLE `tmpstocktransfer`
  ADD CONSTRAINT `tmpstocktransfer_from_foreign` FOREIGN KEY (`from`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tmpstocktransfer_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tmpstocktransfer_idcommande_foreign` FOREIGN KEY (`idcommande`) REFERENCES `ventes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tmpstocktransfer_iduser_foreign` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tmpstocktransfer_to_foreign` FOREIGN KEY (`to`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tvas`
--
ALTER TABLE `tvas`
  ADD CONSTRAINT `tvas_iduser_foreign` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `unite`
--
ALTER TABLE `unite`
  ADD CONSTRAINT `unite_iduser_foreign` FOREIGN KEY (`iduser`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ventes`
--
ALTER TABLE `ventes`
  ADD CONSTRAINT `ventes_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ventes_id_formateur_foreign` FOREIGN KEY (`id_formateur`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ventes_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
