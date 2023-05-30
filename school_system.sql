-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2023 at 04:01 PM
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
  `updated_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `classies`
--

INSERT INTO `classies` (`class`, `id`, `supervisor`, `created_at`, `updated_at`) VALUES
('تاتلة خامس', 1, 19, '2023-05-07 00:47:31', '2023-05-07 20:06:51'),
('خامسة رابع', 2, 10, '2023-05-07 07:47:34', '2023-05-07 07:47:34'),
('تالتة أعدادى تالت', 4, 13, '2023-05-20 07:30:40', '2023-05-20 07:30:40');

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
(3, 'تالتة أعدادى تالت', 5000, '2023-05-20 07:30:40', '2023-05-20 07:30:40', 4);

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
