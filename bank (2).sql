-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 22, 2019 at 06:23 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank`
--

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `Account_No` int(5) NOT NULL,
  `Balance` int(10) NOT NULL,
  `Acc_Type` varchar(20) NOT NULL,
  `Br_ID` int(4) NOT NULL,
  `Cust_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account`
--

INSERT INTO `account` (`Account_No`, `Balance`, `Acc_Type`, `Br_ID`, `Cust_ID`) VALUES
(10222, 230000, 'Current', 100, 1001),
(11022, 210000, 'Savings', 101, 10112);

-- --------------------------------------------------------

--
-- Table structure for table `account_holder`
--

CREATE TABLE `account_holder` (
  `Cust_ID` int(5) NOT NULL,
  `Cust_Name` varchar(27) NOT NULL,
  `Cust_Add` varchar(40) NOT NULL,
  `Phone_No` int(10) NOT NULL,
  `Br_ID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_holder`
--

INSERT INTO `account_holder` (`Cust_ID`, `Cust_Name`, `Cust_Add`, `Phone_No`, `Br_ID`) VALUES
(1001, 'Anthony', 'Belapur', 1234567890, 101),
(10112, 'Usha', 'Andheri', 246724762, 100);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `Br_ID` int(40) NOT NULL,
  `Br_Name` varchar(40) NOT NULL,
  `Br_Add` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`Br_ID`, `Br_Name`, `Br_Add`) VALUES
(100, 'Andheri', 'J B Nagar'),
(101, 'Belapur', 'Sector 11'),
(103, 'Sion', 'Nehru Nagar');

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

CREATE TABLE `login` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`username`, `password`) VALUES
('admin', '12345'),
('ANTHONY', 'ARRGDRG'),
('root', '123');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `T_ID` int(5) NOT NULL,
  `Time` time NOT NULL,
  `T_Type` varchar(40) NOT NULL,
  `T_Amount` int(10) NOT NULL,
  `Date` date NOT NULL,
  `Account_No` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`T_ID`, `Time`, `T_Type`, `T_Amount`, `Date`, `Account_No`) VALUES
(122, '06:06:10', 'Debit', 1200, '2019-10-10', 10222),
(123, '21:28:22', 'Credit', 1200, '2019-10-10', 11022);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`Account_No`),
  ADD KEY `Br_ID` (`Br_ID`),
  ADD KEY `Cust_ID` (`Cust_ID`);

--
-- Indexes for table `account_holder`
--
ALTER TABLE `account_holder`
  ADD PRIMARY KEY (`Cust_ID`),
  ADD KEY `Br_ID` (`Br_ID`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`Br_ID`);

--
-- Indexes for table `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`T_ID`),
  ADD KEY `Account_No` (`Account_No`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `branch id` FOREIGN KEY (`Br_ID`) REFERENCES `branch` (`Br_ID`) ON UPDATE CASCADE,
  ADD CONSTRAINT `customer id` FOREIGN KEY (`Cust_ID`) REFERENCES `account_holder` (`Cust_ID`) ON UPDATE CASCADE;

--
-- Constraints for table `account_holder`
--
ALTER TABLE `account_holder`
  ADD CONSTRAINT `branch` FOREIGN KEY (`Br_ID`) REFERENCES `branch` (`Br_ID`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `account` FOREIGN KEY (`Account_No`) REFERENCES `account` (`Account_No`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
