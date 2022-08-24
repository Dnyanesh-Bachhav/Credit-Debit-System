-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2022 at 07:07 PM
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
-- Database: `credit_debit_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `credit_data`
--

CREATE TABLE `credit_data` (
  `ID` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `date_time` varchar(255) NOT NULL,
  `money` int(11) NOT NULL,
  `Status` varchar(255) NOT NULL,
  `previous_balance` int(11) NOT NULL,
  `total_balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `credit_data`
--

INSERT INTO `credit_data` (`ID`, `username`, `date_time`, `money`, `Status`, `previous_balance`, `total_balance`) VALUES
(12, 'nileshbachhav6336@gmail.com', '24-08-2022 20:30:29', 2000, 'credited', 100000000, 100002000),
(13, 'nileshbachhav6336@gmail.com', '24-08-2022 20:31:56', 2000, 'credited', 102000, 104000),
(14, 'nileshbachhav6336@gmail.com', '24-08-2022 20:32:28', 5000, 'credited', 102000, 107000),
(15, 'nileshbachhav6336@gmail.com', '24-08-2022 20:34:13', 5000, 'credited', 100000, 105000),
(16, 'nileshbachhav6336@gmail.com', '24-08-2022 20:36:49', 6000, 'credited', 100000, 106000),
(17, 'nileshbachhav6336@gmail.com', '24-08-2022 20:39:44', 1212, 'credited', 106000, 107212),
(18, 'nileshbachhav6336@gmail.com', '24-08-2022 21:50:05', 1600, 'credited', 108424, 110024),
(19, 'nileshbachhav6336@gmail.com', '24-08-2022 21:50:19', 1600, 'debited', 111624, 110024),
(20, 'nileshbachhav6336@gmail.com', '24-08-2022 21:55:14', 5000, 'debited', 110024, 105024),
(21, 'nileshbachhav6336@gmail.com', '24-08-2022 22:03:08', 10000, 'debited', 105024, 95024);

-- --------------------------------------------------------

--
-- Table structure for table `userdata`
--

CREATE TABLE `userdata` (
  `ID` int(11) NOT NULL,
  `Name` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Password` varchar(255) NOT NULL,
  `Balance` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `userdata`
--

INSERT INTO `userdata` (`ID`, `Name`, `Username`, `Password`, `Balance`) VALUES
(1, 'Dnyanesh Bachhav', 'dnyaneshbachhav.dev@gmail.com', 'qwerty12', 0),
(2, 'Administrator', 'dnyaneshbachhav2002@gmail.com', '1234', 110000),
(6, 'Nilesh', 'nileshbachhav6336@gmail.com', '12345', 95024),
(7, 'Dnyanesh12', 'george@krugerindustrial.com', '1234', 1234);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `credit_data`
--
ALTER TABLE `credit_data`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `userdata`
--
ALTER TABLE `userdata`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `credit_data`
--
ALTER TABLE `credit_data`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `userdata`
--
ALTER TABLE `userdata`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
