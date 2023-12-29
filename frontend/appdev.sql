-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 12, 2023 at 01:54 PM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appdev`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int NOT NULL,
  `username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` text NOT NULL,
  `token` text NOT NULL,
  `status` text NOT NULL,
  `role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `token`, `status`, `role`) VALUES
(6, 'karl', '$2y$10$JX/z/HNC/tdVzkX0yEk/F.FYGVQ7KNrQxDNo9vQynFMbuZ8Q1AcbG', 'fKcMYAPn7o0wmyusk3iUOXGH4xgRbTZLNtz286DCpBFVjrSQvl', 'active', 'user'),
(8, 'Admin', '$2y$10$fbLFaCkkUqOUZbasbPy8Q.sj9XAi4AFHGpAzRoTkwOyjxsezdYxq6', 'tO9l3CaSFw0f2xRejq5oU4ImADu1WKVknyYJMQpNirPgBzv7Xh', 'active', 'user'),
(9, 'Rence', '$2y$10$PUGCxQmejrKjVVrsFm.m8OK3bgFGX57lPUxdhVm0kJaPRW/o/wZTq', 'rRFZbSWpNfyC5XzkJUoK3xtm0BHV86d7OgnsvaYcQ2P4I9qljT', 'active', 'user'),
(10, 'allan', '$2y$10$UO55nULZ2SO2iAjXfoZC5.UZLcFcS3dL/skG6A/3m8xB1e/nSX3Q2', 'gdjZEfx4okq0ib17yDYSu8XCvPFr5ntA3eQWBRaIzwlGHh2cLp', 'active', 'user'),
(11, 'Admin', '$2y$10$vveYMcfa29XSOzSIgRIdk.CXgJH9s5rixivyASwf.T2K11rIl.VTG', '17U3kbglo68qvFrXtIQEYfdWL9HBjTG0JZAMyaD2mzpNsui5eh', 'active', 'user'),
(12, 'criz', '$2y$10$d1x1hNsIyt1DRQVnq0m3WesDeE5kPySoWVIZfCMdqF0UtAK/Btqq.', 'HCm5lvfLirTQVx3EMUK9FwqBobg7GjRN1DYteWPXzdh286SuJy', 'active', 'user'),
(13, 'jc', '$2y$10$9CmcsQfAj9z1QCldhH9hVOPkD5xWdbWQgwupWn9vItmeHwRpSq/CK', '7QwinHjYWEV3dqJy5vbcauM0pm98KGNBIOP2kRZDsxCXeoA6zf', 'active', 'user'),
(14, 'jc', '$2y$10$/1T9S0FNq30VTh.2PoJSsueb7M5oUWUAQrfiwdZCbAHSEQziqsZ2a', 'mqLpaMu563lHDFb1txOe8AyRkYIw72WUCP4JhznoQc0KsSXBGi', 'active', 'user'),
(15, 'jc', '$2y$10$cL1buExvPArEmtrPGHsIYeGKFzSPhuQqjY1nM1uv.hKEuN3608iPe', 'fTJua4poIhVX3EiUykMtjqmF0BcALv1dlnQ5wgDx2KSrNY96ze', 'active', 'user'),
(16, 'qwer', '$2y$10$aQNMcS2IaTqghx8SktdCS.nn68PuARwBsrfn9654CsMdZNVyCOvGO', 'jbUQIiC9ZENMoV1zdh80y3rvFfxYcmPRkOHGuDagS24qpwLTle', 'active', 'user'),
(17, 'criz', '$2y$10$fL2ssKirQWqHA7oArEz6MuIMvVLmaTqBfMIFq/DdV/C2.O/HMZm/q', 'JN7AjsvPWxn0b2fYXRlLhSwmdIMo5ZEGOuVka48TQi63gHpq1F', 'active', 'user'),
(18, 'jaja', '$2y$10$i8hFbrmlx.5exfeUhmCYPeGvFf.cthBAxt9pURrlzpK5NlQkWUnwW', 'FyRrf3kMABVlaWGjipN0OZ5xd8DLInchYmQXtgSJCuzbPvsH2U', 'active', 'user'),
(19, 'chiwa', '$2y$10$/riHKHh97dKOZZj4j4TBB.LUcYcPfWFoa7lPqf9o8VIhPtwxadf7S', 'loAm1HFJWKdIX8Mnt0D2YT5CwqyBZeigO9aLzjcvUsrfGQkVxp', 'active', 'user');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int NOT NULL,
  `category_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `category_name`) VALUES
(1, 'E-Bike'),
(2, 'E-Bike Parts'),
(3, 'E-Bike and Parts');

-- --------------------------------------------------------

--
-- Table structure for table `eassign`
--

CREATE TABLE `eassign` (
  `id` int NOT NULL,
  `staff` varchar(1000) NOT NULL,
  `description` varchar(500) NOT NULL,
  `location` varchar(50) NOT NULL,
  `contact` varchar(11) NOT NULL,
  `costumer` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `eassign`
--

INSERT INTO `eassign` (`id`, `staff`, `description`, `location`, `contact`, `costumer`) VALUES
(41, 'John', 'Employee', 'Naujan', '0912345678', 'Allan');

-- --------------------------------------------------------

--
-- Table structure for table `ebikelist`
--

CREATE TABLE `ebikelist` (
  `id` int NOT NULL,
  `productName` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `description` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `quantity` int NOT NULL,
  `categImage` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ebikelist`
--

INSERT INTO `ebikelist` (`id`, `productName`, `description`, `category`, `quantity`, `categImage`, `price`) VALUES
(1, 'default', 'default', 'default', 0, 'default', 0),
(5, 'Motor', 'walang gulong', 'no wheels', 10, 'http://localhost:8080/uploads/Thumb_Shin-Megami-Tensei.jpg', 100000);

-- --------------------------------------------------------

--
-- Table structure for table `ebikeparts`
--

CREATE TABLE `ebikeparts` (
  `ID` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(500) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `quantity` int NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `ebikeparts`
--

INSERT INTO `ebikeparts` (`ID`, `name`, `description`, `brand`, `model`, `quantity`, `image`, `price`) VALUES
(1, 'default', 'default', 'default', 'default', 0, 'default', 0);

-- --------------------------------------------------------

--
-- Table structure for table `invoice`
--

CREATE TABLE `invoice` (
  `id` int NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `invoiceID` varchar(255) NOT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `category` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL,
  `parts` varchar(255) NOT NULL,
  `quantity` int DEFAULT NULL,
  `quantityp` int NOT NULL,
  `totalAmount` decimal(10,2) DEFAULT NULL,
  `totalAmountp` decimal(11,2) NOT NULL,
  `grandAmountp` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `invoice`
--

INSERT INTO `invoice` (`id`, `date`, `invoiceID`, `customer`, `category`, `product`, `parts`, `quantity`, `quantityp`, `totalAmount`, `totalAmountp`, `grandAmountp`) VALUES
(3, '2023-12-09 08:47:05', 'N75ZUG2E', 'chiwa', 'E-Bike', 'Motor', 'default', 1, 0, '28000.00', '0.00', '28000.00'),
(4, '2023-12-09 12:23:39', 'H2QE9TTM', 'Teriyaki', 'E-Bike', 'Motor', 'default', 1, 0, '28000.00', '0.00', '28000.00'),
(5, '2023-12-09 12:26:56', 'F8DFEN28', 'tohru', 'E-Bike', 'Motor', 'default', 1, 0, '28000.00', '0.00', '28000.00'),
(6, '2023-12-09 12:31:12', 'BI00LGS7', 'viva', 'E-Bike', 'Motor', 'default', 1, 0, '28000.00', '0.00', '28000.00'),
(7, '2023-12-09 12:40:59', 'HWLDSEC7', 'chiwa', 'E-Bike', 'Motor', 'default', 2, 0, '56000.00', '0.00', '56000.00'),
(8, '2023-12-09 12:46:41', 'HJ6ZACNC', 'chiwa', 'E-Bike', 'Motor', 'default', 2, 0, '56000.00', '0.00', '56000.00'),
(9, '2023-12-09 13:10:35', '2679UZEZ', 'chiwa', 'E-Bike', 'Motor', 'default', 1, 0, '28000.00', '0.00', '28000.00'),
(10, '2023-12-09 13:18:17', 'KIHCGHLU', 'chiwa', 'E-Bike', 'Motor', 'default', 1, 0, '28000.00', '0.00', '28000.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `eassign`
--
ALTER TABLE `eassign`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ebikelist`
--
ALTER TABLE `ebikelist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ebikeparts`
--
ALTER TABLE `ebikeparts`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `eassign`
--
ALTER TABLE `eassign`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `ebikelist`
--
ALTER TABLE `ebikelist`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `ebikeparts`
--
ALTER TABLE `ebikeparts`
  MODIFY `ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `invoice`
--
ALTER TABLE `invoice`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
