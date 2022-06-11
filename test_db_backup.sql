-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2022 at 06:19 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ourmoney`
--

-- --------------------------------------------------------

--
-- Table structure for table `canteens`
--

CREATE TABLE `canteens` (
  `canteen_id` int(11) NOT NULL,
  `canteen_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `canteens`
--

INSERT INTO `canteens` (`canteen_id`, `canteen_name`) VALUES
(1001, 'Chinese Food 101'),
(2001, 'Japan Win Liao'),
(3001, 'Korea Saranghe'),
(4001, 'Eggsplosion'),
(5001, 'Ga Mampu Ga Usah Mampir');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `item_id` int(11) NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `item_price` int(11) NOT NULL,
  `canteen_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`item_id`, `item_name`, `item_price`, `canteen_id`) VALUES
(10001, 'Bakwan', 3000, 1001),
(10002, 'Salmon Sashimi', 35000, 2001),
(10003, 'Tteokbbokki', 5000, 3001),
(10004, 'Telor Dadar', 10000, 4001),
(10005, 'A5 Wagyu Steak 10g', 100000, 5001),
(20001, 'Babi Hong', 30000, 1001),
(20002, 'Salmon Teriyaki', 50000, 2001),
(20003, 'Kimbap Salmon', 10000, 3001),
(20004, 'Telor Dadar Seafood', 15000, 4001),
(20005, 'MB6 Ribeye 20g', 50000, 5001),
(30001, 'Ikan Asem Manis', 40000, 1001),
(30002, 'Tempe Teriyaki', 10000, 2001),
(30003, 'Japchae', 15000, 3001),
(30004, 'Jjajangmyeon', 20000, 3001),
(30005, 'Telor Benedict', 30000, 4001),
(30006, 'Sweet Iced-Tea', 15000, 5001),
(40002, 'Kulit Ayam Krispi', 5000, 2001),
(40004, 'Martabak Telor', 35000, 4001),
(50002, 'Kulit Salmon Krispi', 10000, 2001),
(50003, 'Nasi Goreng Telor', 10000, 4001);

-- --------------------------------------------------------

--
-- Table structure for table `parents`
--

CREATE TABLE `parents` (
  `parent_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parents`
--

INSERT INTO `parents` (`parent_id`, `email`, `password`) VALUES
(101, 'myparent1@parent.com', 'parent123'),
(201, 'myparent2@parent.com', 'mychildno1'),
(301, 'myparent3@parent.com', 'cangcimen420'),
(401, 'myparent4@parent.com', 'varcharisgood');

-- --------------------------------------------------------

--
-- Table structure for table `titles`
--

CREATE TABLE `titles` (
  `title_id` int(11) NOT NULL,
  `title_name` varchar(50) NOT NULL,
  `points_requirement` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `titles`
--

INSERT INTO `titles` (`title_id`, `title_name`, `points_requirement`) VALUES
(1111, 'Newbie', 0),
(1112, 'Amateur', 10000),
(1113, 'Adept', 50000),
(1114, 'Professional', 100000),
(1115, 'Superstar', 200000),
(1116, 'Dolphin', 500000),
(1117, 'Whale', 1000000),
(1118, 'Titanic', 10000000),
(1119, 'Leviathan', 1000000000);

-- --------------------------------------------------------

--
-- Table structure for table `topups`
--

CREATE TABLE `topups` (
  `topup_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `topup_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `topups`
--

INSERT INTO `topups` (`topup_id`, `parent_id`, `user_id`, `amount`, `topup_date`) VALUES
(1, 101, 1, 400000, '2022-06-01'),
(2, 101, 2, 5000000, '2022-06-05'),
(3, 201, 3, 300000, '2022-04-19'),
(4, 301, 4, 1000000, '2022-03-22'),
(5, 401, 5, 2000000, '2022-02-17'),
(6, 101, 1, 300000, '2022-04-25'),
(7, 101, 1, 300000, '2022-05-20');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `canteen_id` int(11) NOT NULL,
  `transaction_date` date NOT NULL,
  `payed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`transaction_id`, `user_id`, `canteen_id`, `transaction_date`, `payed`) VALUES
(11, 1, 1001, '2022-06-02', 0),
(12, 3, 2001, '2022-05-31', 0),
(13, 4, 4001, '2021-12-10', 0),
(14, 2, 5001, '2020-02-29', 0),
(15, 2, 3001, '2021-01-01', 0),
(16, 1, 4001, '2022-05-01', 1),
(17, 1, 3001, '2022-05-20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `transaction_details`
--

CREATE TABLE `transaction_details` (
  `transaction_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaction_details`
--

INSERT INTO `transaction_details` (`transaction_id`, `item_id`, `quantity`) VALUES
(11, 10001, 1),
(11, 20001, 1),
(11, 30001, 2),
(12, 40002, 2),
(12, 50002, 1),
(13, 10004, 1),
(13, 20004, 2),
(13, 30004, 2),
(13, 40004, 1),
(14, 10005, 4),
(15, 10003, 1),
(15, 20003, 2),
(15, 30003, 1),
(15, 40002, 1),
(15, 50003, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `student_id` varchar(11) NOT NULL,
  `class` varchar(5) NOT NULL,
  `absent_number` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `user_balance` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `email`, `password`, `full_name`, `student_id`, `class`, `absent_number`, `parent_id`, `user_balance`) VALUES
(1, 'dummy1@email.com', 'yaboikongming', 'Kong Ming', '2401962112', '5A', 20, 101, 1000000),
(2, 'dummy2@email.com', 'anyawantsmama', 'Anya Forger', '2401929192', '5B', 1, 101, 5000000),
(3, 'dummy3@email.com', 'gabisagaess', 'Valentino Rossi', '2204921929', '5B', 26, 201, 300000),
(4, 'dummy4@email.com', 'cakeoskekeo', 'Lewis Hamilton', '2102010202', '6A', 15, 301, 1000000),
(5, 'dummy5@email.com', 'ilikepanda', 'Xong Xina', '2201020102', '4C', 19, 401, 2000000);

-- --------------------------------------------------------

--
-- Table structure for table `user_titles`
--

CREATE TABLE `user_titles` (
  `title_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_titles`
--

INSERT INTO `user_titles` (`title_id`, `user_id`) VALUES
(1111, 1),
(1111, 2),
(1111, 3),
(1111, 4),
(1111, 5),
(1112, 1),
(1112, 2),
(1112, 3),
(1112, 4),
(1112, 5),
(1113, 2),
(1113, 3),
(1113, 4),
(1113, 5),
(1114, 2),
(1114, 3),
(1115, 2),
(1116, 2),
(1117, 2),
(1118, 2),
(1119, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `canteens`
--
ALTER TABLE `canteens`
  ADD PRIMARY KEY (`canteen_id`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `canteen_id` (`canteen_id`);

--
-- Indexes for table `parents`
--
ALTER TABLE `parents`
  ADD PRIMARY KEY (`parent_id`);

--
-- Indexes for table `titles`
--
ALTER TABLE `titles`
  ADD PRIMARY KEY (`title_id`);

--
-- Indexes for table `topups`
--
ALTER TABLE `topups`
  ADD PRIMARY KEY (`topup_id`),
  ADD KEY `parent_id` (`parent_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `canteen_id` (`canteen_id`);

--
-- Indexes for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD PRIMARY KEY (`transaction_id`,`item_id`),
  ADD KEY `item_id` (`item_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `user_titles`
--
ALTER TABLE `user_titles`
  ADD PRIMARY KEY (`title_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`canteen_id`) REFERENCES `canteens` (`canteen_id`);

--
-- Constraints for table `topups`
--
ALTER TABLE `topups`
  ADD CONSTRAINT `topups_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`parent_id`),
  ADD CONSTRAINT `topups_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`canteen_id`) REFERENCES `canteens` (`canteen_id`);

--
-- Constraints for table `transaction_details`
--
ALTER TABLE `transaction_details`
  ADD CONSTRAINT `transaction_details_ibfk_1` FOREIGN KEY (`transaction_id`) REFERENCES `transactions` (`transaction_id`),
  ADD CONSTRAINT `transaction_details_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `parents` (`parent_id`);

--
-- Constraints for table `user_titles`
--
ALTER TABLE `user_titles`
  ADD CONSTRAINT `user_titles_ibfk_1` FOREIGN KEY (`title_id`) REFERENCES `titles` (`title_id`),
  ADD CONSTRAINT `user_titles_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
