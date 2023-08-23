-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2023 at 04:48 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `grievance_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `attachments`
--

CREATE TABLE `attachments` (
  `id` int(11) NOT NULL,
  `request_id` int(11) NOT NULL,
  `file_name` varchar(50) NOT NULL,
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `attachments`
--

INSERT INTO `attachments` (`id`, `request_id`, `file_name`, `created_date`, `updated_date`) VALUES
(1, 19, '1692800476_f96d55015b2b898eaf5f.pdf', '2023-08-23 14:21:16', '0000-00-00 00:00:00'),
(2, 20, '1692800522_4780696805523f2f1ef8.png', '2023-08-23 14:22:02', '0000-00-00 00:00:00'),
(3, 21, '1692801435_77e600b11f9ed0decc41.png', '2023-08-23 14:37:15', '0000-00-00 00:00:00'),
(4, 22, '1692801542_1443338cfd3faa2eb5f8.png', '2023-08-23 14:39:02', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `grievance_request`
--

CREATE TABLE `grievance_request` (
  `id` int(11) NOT NULL,
  `applicant_name` varchar(50) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `district` varchar(15) NOT NULL,
  `tehsil` varchar(15) NOT NULL,
  `gram_panchayat` varchar(15) NOT NULL,
  `village` varchar(15) NOT NULL,
  `slot` date NOT NULL,
  `department` varchar(20) NOT NULL,
  `detailed_grievance` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tracking_no` varchar(30) NOT NULL,
  `application_status` int(1) NOT NULL DEFAULT 0 COMMENT '0 = Pending, 1 = Completed, 2 = Rejected',
  `created_date` datetime NOT NULL,
  `updated_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `grievance_request`
--

INSERT INTO `grievance_request` (`id`, `applicant_name`, `mobile`, `district`, `tehsil`, `gram_panchayat`, `village`, `slot`, `department`, `detailed_grievance`, `tracking_no`, `application_status`, `created_date`, `updated_date`) VALUES
(19, 'Pankaj Batham', '8963957654', 'District-1', 'Tehsil-1', 'Panchayat-1', 'Village-1', '2023-12-31', 'Department-1', 'Test content', '1692800476', 1, '2023-08-23 14:21:16', '0000-00-00 00:00:00'),
(20, 'Rahul', '9999999999', 'District-1', 'Tehsil-1', 'Panchayat-1', 'Village-2', '2024-12-30', 'Department-1', 'Test Content', '1692800522', 0, '2023-08-23 14:22:02', '0000-00-00 00:00:00'),
(21, 'Amber Jain', '9876543210', 'District-2', 'Tehsil-1', 'Panchayat-2', 'Village-2', '2023-12-29', 'Department-2', 'Test Detail Grievance', '1692801435', 2, '2023-08-23 14:37:15', '0000-00-00 00:00:00'),
(22, 'Girish', '9876543211', 'District-2', 'Tehsil-2', 'Panchayat-2', 'Village-2', '2024-12-30', 'Department-3', 'test', '1692801542', 0, '2023-08-23 14:39:02', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attachments`
--
ALTER TABLE `attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_attachments_request_id` (`request_id`);

--
-- Indexes for table `grievance_request`
--
ALTER TABLE `grievance_request`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attachments`
--
ALTER TABLE `attachments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `grievance_request`
--
ALTER TABLE `grievance_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attachments`
--
ALTER TABLE `attachments`
  ADD CONSTRAINT `fk_attachments_request_id` FOREIGN KEY (`request_id`) REFERENCES `grievance_request` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
