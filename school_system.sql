-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2023 at 09:19 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.4.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'احمد فرغلى ثابت', 'ahmedgits2001@gmail.com', 'ahmedahmed', NULL, '2023-04-28 12:15:56', '2023-04-28 12:15:56');

-- --------------------------------------------------------

--
-- Table structure for table `attend`
--

CREATE TABLE `attend` (
  `std_id` int(11) DEFAULT NULL,
  `class_id` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `attend`
--

INSERT INTO `attend` (`std_id`, `class_id`, `updated_at`, `created_at`, `id`) VALUES
(36, 2, '2023-05-17 19:32:07', '2023-05-17 19:32:07', 1),
(28, 2, '2023-05-28 17:19:44', '2023-05-28 17:19:44', 2);

-- --------------------------------------------------------

--
-- Table structure for table `classies`
--

CREATE TABLE `classies` (
  `class` varchar(35) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id` bigint(20) UNSIGNED NOT NULL,
  `supervisor` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classies`
--

INSERT INTO `classies` (`class`, `id`, `supervisor`, `created_at`, `updated_at`, `level`) VALUES
('تاتلة خامس', 1, 19, '2023-05-07 00:47:31', '2023-05-07 20:06:51', 3),
('خامسة رابع', 2, 10, '2023-05-07 07:47:34', '2023-05-07 07:47:34', 5),
('تالتة أعدادى تالت', 4, 13, '2023-05-20 07:30:40', '2023-05-20 07:30:40', 9),
('اولى أول', 5, 20, '2023-06-08 07:18:27', '2023-06-08 07:18:27', 1);

-- --------------------------------------------------------

--
-- Table structure for table `depts`
--

CREATE TABLE `depts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `student_id` bigint(20) NOT NULL,
  `dept` double(8,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joined_at` datetime NOT NULL DEFAULT current_timestamp(),
  `birth_date` datetime NOT NULL,
  `nat_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `relegion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'مسلم',
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'ذكر',
  `personal_image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `salary` int(11) NOT NULL DEFAULT 2000
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `name`, `phone`, `email`, `address`, `joined_at`, `birth_date`, `nat_id`, `added_by`, `relegion`, `gender`, `personal_image`, `created_at`, `updated_at`, `salary`) VALUES
(10, 'أحمد حسن على محمود', '56456796', 'ahmed_20190076@fci.helwan.edu.eg', 'ميدان الجيزة', '2023-05-04 01:01:53', '1995-05-05 00:00:00', '56456', NULL, 'مسلم', 'ذكر', '\\public\\images\\teachers\\php6B36.tmp', '2023-05-04 08:01:53', '2023-05-04 17:38:19', 2000),
(13, 'محمود إبراهيم حمادة', '5648964', 'ahmedgits2001@hotmail.com', 'ميدان رمسيس', '2023-05-04 07:16:07', '2001-05-02 00:00:00', '64', NULL, 'مسلم', NULL, '\\public\\images\\teachers\\phpA19.tmp', '2023-05-04 14:16:07', '2023-05-04 17:42:36', 2000),
(18, 'أحمد حسن على محمود', '0125675688', 'ahmed@gmail.com', 'ميدان الجيزة', '2023-05-04 07:18:48', '2001-05-02 00:00:00', '64564', NULL, 'مسلم', 'ذكر', '\\public\\images\\teachers\\php810B.tmp', '2023-05-04 14:18:48', '2023-05-04 14:18:48', 2000),
(19, 'أحمد على الدين إبراهيم', '+201128715837', 'ahmedgits2001@gmail', 'ميدان رمسيس', '2023-05-07 03:28:35', '2001-02-05 00:00:00', '567895', NULL, 'مسلم', 'ذكر', '\\public\\images\\teachers\\phpC4F8.tmp', '2023-05-07 10:28:35', '2023-05-07 10:28:35', 2000),
(20, 'أحمد حسن على محمود', '+201128715837', '4a671f2e15@boxmail.lol', 'ميدان الجيزة', '2023-05-27 17:44:03', '2001-03-01 00:00:00', '56456568', NULL, 'مسلم', 'ذكر', '\\public\\images\\teachers\\phpB357.tmp', '2023-05-27 15:44:03', '2023-05-27 15:44:03', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `Remote_ip` varchar(24) COLLATE utf8_bin NOT NULL,
  `time` datetime NOT NULL DEFAULT current_timestamp(),
  `ReuqestUrl` varchar(128) COLLATE utf8_bin NOT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`Remote_ip`, `time`, `ReuqestUrl`, `updated_at`, `created_at`) VALUES
('127.0.0.1', '2023-06-08 09:19:01', '/admin/get/statictics?_token=X79DdTsjsPBhxJuD72f1FFZI6kL6kDXgIPiQytud', '2023-06-08 07:19:01', '2023-06-08 07:19:01'),
('127.0.0.1', '2023-06-08 09:19:03', '/admin/get/statictics?_token=X79DdTsjsPBhxJuD72f1FFZI6kL6kDXgIPiQytud', '2023-06-08 07:19:03', '2023-06-08 07:19:03');

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
(157, '2014_10_12_000000_create_users_table', 1),
(158, '2014_10_12_100000_create_password_resets_table', 1),
(159, '2019_08_19_000000_create_failed_jobs_table', 1),
(160, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(161, '2023_04_07_090319_admins', 1),
(162, '2023_04_07_092416_students', 1),
(163, '2023_04_07_092435_teachers', 1),
(164, '2023_04_07_092524_prices', 1),
(165, '2023_04_07_092546_dept_managing', 1),
(166, '2023_04_07_092606_parent_contact', 1),
(167, '2023_04_07_092624_classies', 1),
(168, '2023_04_07_092651_matrials', 1),
(169, '2023_04_07_092708_timetables', 1),
(170, '2023_04_08_080815_relations', 2);

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `id` bigint(20) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `email` varchar(35) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`id`, `name`, `address`, `phone`, `job`, `updated_at`, `created_at`, `email`) VALUES
(7, 'فرغلى ثابت عبد الرحمن أحمد', 'الهرم فيصل', '+201128715837', 'مدرس', '2023-05-21 08:30:11', '2023-05-21 08:30:11', 'ahmedgits2001@gmail.comarghly');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prices`
--

CREATE TABLE `prices` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `class_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `prices`
--

INSERT INTO `prices` (`id`, `name`, `price`, `created_at`, `updated_at`, `class_id`) VALUES
(1, 'تاتلة خامس', 5600, '2023-05-20 09:24:32', '2023-05-20 09:24:32', 1),
(2, 'خامسة رابع', 5000, '2023-05-20 09:25:17', '2023-05-20 09:25:17', 2),
(3, 'تالتة أعدادى تالت', 5000, '2023-05-20 07:30:40', '2023-05-20 07:30:40', 4),
(4, 'اولى أول', 200, '2023-06-08 07:18:27', '2023-06-08 07:18:27', 5);

-- --------------------------------------------------------

--
-- Table structure for table `relation`
--

CREATE TABLE `relation` (
  `rel_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `std_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `relation`
--

INSERT INTO `relation` (`rel_id`, `parent_id`, `std_id`, `created_at`, `updated_at`) VALUES
(6, 7, 28, '2023-05-21 08:30:11', '2023-05-21 08:30:11');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birth_date` datetime NOT NULL,
  `join_date` datetime NOT NULL DEFAULT current_timestamp(),
  `nat_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `personal_image` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `relegion` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'مسلم',
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ذكر',
  `nationality` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'مصرى'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`id`, `name`, `phone`, `email`, `address`, `birth_date`, `join_date`, `nat_id`, `added_by`, `updated_at`, `created_at`, `personal_image`, `relegion`, `gender`, `nationality`) VALUES
(28, 'محمود فرغلى ثابن عبد الرحمن أحمد', '+201128715837', 'ahmedgits2001@gmail.com', 'الطوابق فيصل', '5555-01-31 00:00:00', '2023-05-02 02:34:36', '46464652', NULL, '2023-05-02 09:34:36', '2023-05-02 09:34:36', '\\public\\images\\phpC078.tmp', 'مسلم', 'ذكر', 'مصرى'),
(29, 'محمد حسن على ثابت', '+201128715837', 'ahmed_20190076@fci.helwan.edu.eg', 'الطوابق فيصل', '2001-05-06 00:00:00', '2023-05-02 02:35:20', '464646564', NULL, '2023-05-03 04:04:32', '2023-05-02 09:35:20', '\\public\\images\\php6A26.tmp', 'مسلم', 'ذكر', 'مصرى'),
(30, 'أحمد فرغلى ثابت عبد الرحمن أحمد', '+201128715837', 'ahmedgits2001@gmail.com', 'الطوابق فيصل', '2001-02-22 00:00:00', '2023-05-03 12:16:07', '4646465', NULL, '2023-05-03 19:16:07', '2023-05-03 19:16:07', '\\public\\images\\php5735.tmp', 'مسلم', 'ذكر', 'مصرى'),
(32, 'أحمد فرغلى ثابت عبد الرحمن أحمد', '+201128715837', 'ahmedgits2001@gmail.com', 'الطوابق فيصل', '2001-02-22 00:00:00', '2023-05-03 12:16:48', '46464654', NULL, '2023-05-03 19:16:48', '2023-05-03 19:16:48', '\\public\\images\\phpF915.tmp', 'مسلم', 'ذكر', 'مصرى'),
(34, 'زينب', '+201128715837', 'ahmedgits2001@gmail.com', 'الطوابق فيصل', '0222-02-22 00:00:00', '2023-05-03 12:59:03', '75613247', NULL, '2023-05-03 19:59:03', '2023-05-03 19:59:03', '\\public\\images\\phpA608.tmp', 'مسيحى', 'أنثى', 'مصرية'),
(36, 'محمود فرغلى ثابن عبد الرحمن أحمد', '+201128715837', 'ahmed_20190076@fci.helwan.edu.eg', 'الطوابق فيصل', '2001-02-23 00:00:00', '2023-05-17 21:32:07', '756132642', NULL, '2023-05-17 19:32:07', '2023-05-17 19:32:07', '\\public\\images\\php6021.tmp', 'مسلم', 'ذكر', 'مصرية');

-- --------------------------------------------------------

--
-- Table structure for table `student_marks`
--

CREATE TABLE `student_marks` (
  `year` year(4) NOT NULL DEFAULT current_timestamp(),
  `std_id` int(11) NOT NULL,
  `subject_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `study`
--

CREATE TABLE `study` (
  `class_id` bigint(20) UNSIGNED NOT NULL,
  `subj_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `study`
--

INSERT INTO `study` (`class_id`, `subj_id`) VALUES
(1, 1),
(2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `subj_name` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`subj_name`, `description`, `added_by`, `created_at`, `updated_at`, `id`) VALUES
('كيمياء', 'مادة الكيمياء لصف الثالث الثانوى', NULL, '2023-05-08 10:09:56', '2023-05-08 10:09:56', 1),
('اللغة العربية الفصحة', 'مادة اللغة العربية الفصحى يتم الأشراف عليها من قبل المختصيين', NULL, '2023-05-08 17:17:59', '2023-05-14 10:19:37', 2);

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE `teachers` (
  `id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `joined_at` datetime NOT NULL DEFAULT current_timestamp(),
  `birth_date` datetime NOT NULL,
  `nat_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `added_by` bigint(20) UNSIGNED DEFAULT NULL,
  `relegion` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'مسلم',
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'ذكر',
  `personal_image` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp(),
  `salary` int(11) NOT NULL DEFAULT 2000,
  `type` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`id`, `name`, `phone`, `email`, `address`, `joined_at`, `birth_date`, `nat_id`, `added_by`, `relegion`, `gender`, `personal_image`, `created_at`, `updated_at`, `salary`, `type`) VALUES
(10, 'أحمد حسن على محمود', '56456796', 'ahmed_20190076@fci.helwan.edu.eg', 'ميدان الجيزة', '2023-05-04 01:01:53', '1995-05-05 00:00:00', '56456', NULL, 'مسلم', 'ذكر', '\\public\\images\\teachers\\php6B36.tmp', '2023-05-04 08:01:53', '2023-05-04 17:38:19', 2000, 0),
(13, 'محمود إبراهيم حمادة', '5648964', 'ahmedgits2001@hotmail.com', 'ميدان رمسيس', '2023-05-04 07:16:07', '2001-05-02 00:00:00', '64', NULL, 'مسلم', NULL, '\\public\\images\\teachers\\phpA19.tmp', '2023-05-04 14:16:07', '2023-05-04 17:42:36', 2000, 0),
(18, 'أحمد حسن على محمود', '0125675688', 'ahmed@gmail.com', 'ميدان الجيزة', '2023-05-04 07:18:48', '2001-05-02 00:00:00', '64564', NULL, 'مسلم', 'ذكر', '\\public\\images\\teachers\\php810B.tmp', '2023-05-04 14:18:48', '2023-05-04 14:18:48', 2000, 0),
(19, 'أحمد على الدين إبراهيم', '+201128715837', 'ahmedgits2001@gmail', 'ميدان رمسيس', '2023-05-07 03:28:35', '2001-02-05 00:00:00', '567895', NULL, 'مسلم', 'ذكر', '\\public\\images\\teachers\\phpC4F8.tmp', '2023-05-07 10:28:35', '2023-05-07 10:28:35', 2000, 0),
(20, 'أحمد حسن على محمود', '+201128715837', '4a671f2e15@boxmail.lol', 'ميدان الجيزة', '2023-05-27 17:44:03', '2001-03-01 00:00:00', '56456568', NULL, 'مسلم', 'ذكر', '\\public\\images\\teachers\\phpB357.tmp', '2023-05-27 15:44:03', '2023-05-27 15:44:03', 3000, 0),
(21, 'أحمد حسن على محمود', '+201128715837', '4a671f2e15@boxmail.lol', 'ميدان الجيزة', '2023-05-27 18:11:59', '2222-03-22 00:00:00', '64564789', NULL, 'مسلم', 'ذكر', '\\public\\images\\teachers\\php4A5E.tmp', '2023-05-27 16:11:59', '2023-05-27 16:11:59', 3500, 0);

-- --------------------------------------------------------

--
-- Table structure for table `teachs`
--

CREATE TABLE `teachs` (
  `teacher_id` int(11) NOT NULL,
  `subj_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `teachs`
--

INSERT INTO `teachs` (`teacher_id`, `subj_id`, `created_at`, `updated_at`) VALUES
(10, 2, '2023-05-15 11:15:59', '2023-05-15 11:15:59'),
(13, 1, '2023-05-15 11:16:16', '2023-05-15 11:16:16');

-- --------------------------------------------------------

--
-- Table structure for table `transfereed_log`
--

CREATE TABLE `transfereed_log` (
  `last_record` datetime NOT NULL DEFAULT current_timestamp(),
  `counter` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `transfereed_log`
--

INSERT INTO `transfereed_log` (`last_record`, `counter`, `created_at`, `updated_at`) VALUES
('2023-06-06 21:40:00', 55, '2023-06-06 19:40:00', '2023-06-06 19:40:00'),
('2023-06-06 21:41:00', 55, '2023-06-06 19:41:00', '2023-06-06 19:41:00'),
('2023-06-06 21:42:00', 51, '2023-06-06 19:42:00', '2023-06-06 19:42:00'),
('2023-06-06 21:43:00', 54, '2023-06-06 19:43:00', '2023-06-06 19:43:00'),
('2023-06-06 21:44:00', 54, '2023-06-06 19:44:00', '2023-06-06 19:44:00'),
('2023-06-06 21:45:00', 55, '2023-06-06 19:45:00', '2023-06-06 19:45:00'),
('2023-06-06 21:46:00', 55, '2023-06-06 19:46:00', '2023-06-06 19:46:00'),
('2023-06-06 21:47:00', 55, '2023-06-06 19:47:00', '2023-06-06 19:47:00'),
('2023-06-06 21:48:01', 55, '2023-06-06 19:48:01', '2023-06-06 19:48:01'),
('2023-06-06 21:49:00', 55, '2023-06-06 19:49:00', '2023-06-06 19:49:00'),
('2023-06-06 21:50:00', 55, '2023-06-06 19:50:00', '2023-06-06 19:50:00'),
('2023-06-06 21:51:00', 55, '2023-06-06 19:51:00', '2023-06-06 19:51:00'),
('2023-06-06 21:52:00', 54, '2023-06-06 19:52:00', '2023-06-06 19:52:00'),
('2023-06-06 21:53:00', 54, '2023-06-06 19:53:00', '2023-06-06 19:53:00'),
('2023-06-06 21:54:00', 52, '2023-06-06 19:54:00', '2023-06-06 19:54:00'),
('2023-06-06 21:55:00', 52, '2023-06-06 19:55:00', '2023-06-06 19:55:00'),
('2023-06-06 21:56:00', 55, '2023-06-06 19:56:00', '2023-06-06 19:56:00'),
('2023-06-06 21:57:00', 53, '2023-06-06 19:57:00', '2023-06-06 19:57:00'),
('2023-06-06 21:58:00', 49, '2023-06-06 19:58:00', '2023-06-06 19:58:00'),
('2023-06-06 21:59:00', 54, '2023-06-06 19:59:00', '2023-06-06 19:59:00'),
('2023-06-06 22:00:00', 34, '2023-06-06 20:00:00', '2023-06-06 20:00:00'),
('2023-06-07 14:17:01', 20, '2023-06-07 12:17:01', '2023-06-07 12:17:01'),
('2023-06-07 14:18:00', 54, '2023-06-07 12:18:00', '2023-06-07 12:18:00'),
('2023-06-07 14:19:00', 54, '2023-06-07 12:19:00', '2023-06-07 12:19:00'),
('2023-06-07 14:20:00', 54, '2023-06-07 12:20:00', '2023-06-07 12:20:00'),
('2023-06-07 14:21:01', 54, '2023-06-07 12:21:01', '2023-06-07 12:21:01'),
('2023-06-07 14:22:00', 52, '2023-06-07 12:22:00', '2023-06-07 12:22:00'),
('2023-06-07 14:23:01', 54, '2023-06-07 12:23:01', '2023-06-07 12:23:01'),
('2023-06-07 14:24:01', 54, '2023-06-07 12:24:01', '2023-06-07 12:24:01'),
('2023-06-07 14:25:00', 26, '2023-06-07 12:25:00', '2023-06-07 12:25:00'),
('2023-06-07 14:27:00', 51, '2023-06-07 12:27:00', '2023-06-07 12:27:00'),
('2023-06-07 14:28:00', 26, '2023-06-07 12:28:00', '2023-06-07 12:28:00'),
('2023-06-07 14:29:00', 53, '2023-06-07 12:29:00', '2023-06-07 12:29:00'),
('2023-06-07 14:30:00', 54, '2023-06-07 12:30:00', '2023-06-07 12:30:00'),
('2023-06-07 14:31:00', 54, '2023-06-07 12:31:00', '2023-06-07 12:31:00'),
('2023-06-07 14:32:01', 55, '2023-06-07 12:32:01', '2023-06-07 12:32:01'),
('2023-06-07 14:33:00', 53, '2023-06-07 12:33:00', '2023-06-07 12:33:00'),
('2023-06-07 14:34:00', 57, '2023-06-07 12:34:00', '2023-06-07 12:34:00'),
('2023-06-07 14:35:00', 54, '2023-06-07 12:35:00', '2023-06-07 12:35:00'),
('2023-06-07 14:36:00', 39, '2023-06-07 12:36:00', '2023-06-07 12:36:00'),
('2023-06-07 14:37:00', 42, '2023-06-07 12:37:00', '2023-06-07 12:37:00'),
('2023-06-07 14:38:00', 78, '2023-06-07 12:38:00', '2023-06-07 12:38:00'),
('2023-06-07 14:39:00', 73, '2023-06-07 12:39:00', '2023-06-07 12:39:00'),
('2023-06-07 14:40:00', 77, '2023-06-07 12:40:00', '2023-06-07 12:40:00'),
('2023-06-07 14:41:00', 76, '2023-06-07 12:41:00', '2023-06-07 12:41:00'),
('2023-06-07 14:42:00', 78, '2023-06-07 12:42:00', '2023-06-07 12:42:00'),
('2023-06-07 14:43:00', 78, '2023-06-07 12:43:00', '2023-06-07 12:43:00'),
('2023-06-07 14:44:00', 68, '2023-06-07 12:44:00', '2023-06-07 12:44:00'),
('2023-06-07 18:57:01', 16, '2023-06-07 16:57:01', '2023-06-07 16:57:01'),
('2023-06-07 18:58:00', 57, '2023-06-07 16:58:00', '2023-06-07 16:58:00'),
('2023-06-07 18:59:00', 72, '2023-06-07 16:59:00', '2023-06-07 16:59:00'),
('2023-06-07 19:00:00', 4, '2023-06-07 17:00:00', '2023-06-07 17:00:00'),
('2023-06-07 19:00:00', 119, '2023-06-07 17:00:00', '2023-06-07 17:00:00'),
('2023-06-07 19:01:00', 158, '2023-06-07 17:01:00', '2023-06-07 17:01:00'),
('2023-06-07 19:02:00', 136, '2023-06-07 17:02:00', '2023-06-07 17:02:00'),
('2023-06-07 19:03:00', 113, '2023-06-07 17:03:00', '2023-06-07 17:03:00'),
('2023-06-07 19:04:00', 91, '2023-06-07 17:04:00', '2023-06-07 17:04:00'),
('2023-06-07 19:05:00', 60, '2023-06-07 17:05:00', '2023-06-07 17:05:00'),
('2023-06-07 19:06:00', 61, '2023-06-07 17:06:00', '2023-06-07 17:06:00'),
('2023-06-07 19:07:00', 30, '2023-06-07 17:07:00', '2023-06-07 17:07:00'),
('2023-06-07 19:08:00', 30, '2023-06-07 17:08:00', '2023-06-07 17:08:00'),
('2023-06-07 19:09:00', 30, '2023-06-07 17:09:00', '2023-06-07 17:09:00'),
('2023-06-07 19:10:00', 30, '2023-06-07 17:10:00', '2023-06-07 17:10:00'),
('2023-06-07 19:11:00', 31, '2023-06-07 17:11:00', '2023-06-07 17:11:00'),
('2023-06-07 19:12:00', 30, '2023-06-07 17:12:00', '2023-06-07 17:12:00'),
('2023-06-07 19:13:00', 31, '2023-06-07 17:13:00', '2023-06-07 17:13:00'),
('2023-06-07 19:14:00', 30, '2023-06-07 17:14:00', '2023-06-07 17:14:00'),
('2023-06-07 19:15:00', 30, '2023-06-07 17:15:00', '2023-06-07 17:15:00'),
('2023-06-07 19:16:00', 30, '2023-06-07 17:16:00', '2023-06-07 17:16:00'),
('2023-06-07 19:17:00', 30, '2023-06-07 17:17:00', '2023-06-07 17:17:00'),
('2023-06-07 19:18:00', 30, '2023-06-07 17:18:00', '2023-06-07 17:18:00'),
('2023-06-07 19:19:00', 30, '2023-06-07 17:19:00', '2023-06-07 17:19:00'),
('2023-06-07 19:20:00', 30, '2023-06-07 17:20:00', '2023-06-07 17:20:00'),
('2023-06-07 19:21:00', 31, '2023-06-07 17:21:00', '2023-06-07 17:21:00'),
('2023-06-07 19:22:00', 30, '2023-06-07 17:22:00', '2023-06-07 17:22:00'),
('2023-06-07 19:23:00', 30, '2023-06-07 17:23:00', '2023-06-07 17:23:00'),
('2023-06-07 19:24:00', 29, '2023-06-07 17:24:00', '2023-06-07 17:24:00'),
('2023-06-07 19:25:00', 30, '2023-06-07 17:25:00', '2023-06-07 17:25:00'),
('2023-06-07 19:26:00', 30, '2023-06-07 17:26:00', '2023-06-07 17:26:00'),
('2023-06-07 19:27:01', 31, '2023-06-07 17:27:01', '2023-06-07 17:27:01'),
('2023-06-07 19:28:00', 29, '2023-06-07 17:28:00', '2023-06-07 17:28:00'),
('2023-06-07 19:29:00', 31, '2023-06-07 17:29:00', '2023-06-07 17:29:00'),
('2023-06-07 19:30:00', 30, '2023-06-07 17:30:00', '2023-06-07 17:30:00'),
('2023-06-07 19:31:00', 31, '2023-06-07 17:31:00', '2023-06-07 17:31:00'),
('2023-06-07 19:32:00', 29, '2023-06-07 17:32:00', '2023-06-07 17:32:00'),
('2023-06-07 19:33:00', 31, '2023-06-07 17:33:00', '2023-06-07 17:33:00'),
('2023-06-07 19:34:00', 30, '2023-06-07 17:34:00', '2023-06-07 17:34:00'),
('2023-06-08 09:03:01', 14, '2023-06-08 07:03:01', '2023-06-08 07:03:01'),
('2023-06-08 09:03:01', 62, '2023-06-08 07:03:01', '2023-06-08 07:03:01'),
('2023-06-08 09:04:00', 30, '2023-06-08 07:04:00', '2023-06-08 07:04:00'),
('2023-06-08 09:05:01', 30, '2023-06-08 07:05:01', '2023-06-08 07:05:01'),
('2023-06-08 09:06:00', 30, '2023-06-08 07:06:00', '2023-06-08 07:06:00'),
('2023-06-08 09:07:00', 30, '2023-06-08 07:07:00', '2023-06-08 07:07:00'),
('2023-06-08 09:08:00', 30, '2023-06-08 07:08:00', '2023-06-08 07:08:00'),
('2023-06-08 09:09:00', 30, '2023-06-08 07:09:00', '2023-06-08 07:09:00'),
('2023-06-08 09:10:00', 30, '2023-06-08 07:10:00', '2023-06-08 07:10:00'),
('2023-06-08 09:11:00', 30, '2023-06-08 07:11:00', '2023-06-08 07:11:00'),
('2023-06-08 09:12:00', 30, '2023-06-08 07:12:00', '2023-06-08 07:12:00'),
('2023-06-08 09:13:00', 30, '2023-06-08 07:13:00', '2023-06-08 07:13:00'),
('2023-06-08 09:14:00', 18, '2023-06-08 07:14:00', '2023-06-08 07:14:00'),
('2023-06-08 09:15:00', 2, '2023-06-08 07:15:00', '2023-06-08 07:15:00'),
('2023-06-08 09:16:01', 17, '2023-06-08 07:16:01', '2023-06-08 07:16:01'),
('2023-06-08 09:17:00', 30, '2023-06-08 07:17:00', '2023-06-08 07:17:00'),
('2023-06-08 09:18:00', 26, '2023-06-08 07:18:00', '2023-06-08 07:18:00'),
('2023-06-08 09:19:00', 30, '2023-06-08 07:19:00', '2023-06-08 07:19:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`);

--
-- Indexes for table `attend`
--
ALTER TABLE `attend`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attend_ibfk_1` (`std_id`),
  ADD KEY `attend_ibfk_2` (`class_id`);

--
-- Indexes for table `classies`
--
ALTER TABLE `classies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `supervisor` (`supervisor`);

--
-- Indexes for table `depts`
--
ALTER TABLE `depts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teachers_nat_id_unique` (`nat_id`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `prices`
--
ALTER TABLE `prices`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `class_id` (`class_id`);

--
-- Indexes for table `relation`
--
ALTER TABLE `relation`
  ADD PRIMARY KEY (`rel_id`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `relation_ibfk_2` (`parent_id`);

--
-- Indexes for table `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `students_nat_id_unique` (`nat_id`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `student_marks`
--
ALTER TABLE `student_marks`
  ADD KEY `subject_id` (`subject_id`),
  ADD KEY `std_id` (`std_id`);

--
-- Indexes for table `study`
--
ALTER TABLE `study`
  ADD KEY `class_id` (`class_id`),
  ADD KEY `subj_id` (`subj_id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `teachers`
--
ALTER TABLE `teachers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `teachers_nat_id_unique` (`nat_id`),
  ADD KEY `added_by` (`added_by`);

--
-- Indexes for table `teachs`
--
ALTER TABLE `teachs`
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `subj_id` (`subj_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `attend`
--
ALTER TABLE `attend`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `classies`
--
ALTER TABLE `classies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `depts`
--
ALTER TABLE `depts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=171;

--
-- AUTO_INCREMENT for table `parents`
--
ALTER TABLE `parents`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prices`
--
ALTER TABLE `prices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `relation`
--
ALTER TABLE `relation`
  MODIFY `rel_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `subject`
--
ALTER TABLE `subject`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `teachers`
--
ALTER TABLE `teachers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attend`
--
ALTER TABLE `attend`
  ADD CONSTRAINT `attend_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `students` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `attend_ibfk_2` FOREIGN KEY (`class_id`) REFERENCES `classies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `classies`
--
ALTER TABLE `classies`
  ADD CONSTRAINT `classies_ibfk_1` FOREIGN KEY (`supervisor`) REFERENCES `teachers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `prices`
--
ALTER TABLE `prices`
  ADD CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `relation`
--
ALTER TABLE `relation`
  ADD CONSTRAINT `relation_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `relation_ibfk_2` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `student_marks`
--
ALTER TABLE `student_marks`
  ADD CONSTRAINT `student_marks_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `student_marks_ibfk_2` FOREIGN KEY (`std_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `study`
--
ALTER TABLE `study`
  ADD CONSTRAINT `study_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `study_ibfk_2` FOREIGN KEY (`subj_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`added_by`) REFERENCES `admins` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `teachs`
--
ALTER TABLE `teachs`
  ADD CONSTRAINT `teachs_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `teachs_ibfk_2` FOREIGN KEY (`subj_id`) REFERENCES `subject` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
