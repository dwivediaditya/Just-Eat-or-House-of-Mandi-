-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 29, 2019 at 01:19 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `houseofmandidb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `password`) VALUES
('admin', '123');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL,
  `firstName` varchar(40) NOT NULL,
  `lastName` varchar(40) NOT NULL,
  `mobileNumber` varchar(10) NOT NULL,
  `address` varchar(200) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `verificationcode` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `password`, `firstName`, `lastName`, `mobileNumber`, `address`, `verified`, `approved`, `verificationcode`) VALUES
('dwivediaditya24@gmail.com', '1234', 'Pqr', 'wxy', '7004635496', 'Indore', 1, 1, '3ffa7'),
('dwivediaditya@outlook.in', '12345', 'Aditya', 'Dwivedi', '7547030211', 'bhopal', 1, 1, '53bab');

-- --------------------------------------------------------

--
-- Table structure for table `fooditem`
--

CREATE TABLE `fooditem` (
  `id` int(11) NOT NULL,
  `itemName` varchar(40) NOT NULL,
  `itemDesc` varchar(200) NOT NULL,
  `itemPrice` int(11) NOT NULL,
  `percentOff` int(11) NOT NULL,
  `actual_price` int(11) NOT NULL,
  `img_path` varchar(200) NOT NULL,
  `itemStatus` tinyint(1) NOT NULL,
  `personCount` int(11) NOT NULL,
  `categoryID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fooditem`
--

INSERT INTO `fooditem` (`id`, `itemName`, `itemDesc`, `itemPrice`, `percentOff`, `actual_price`, `img_path`, `itemStatus`, `personCount`, `categoryID`) VALUES
(4, 'bottle opener 2', 'glucose', 20, 50, 10, 'F:\\HouseOfMandi\\HouseOfMandiApp\\web\\images\\img1556348014827.png', 1, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `fooditemcategory`
--

CREATE TABLE `fooditemcategory` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fooditemcategory`
--

INSERT INTO `fooditemcategory` (`id`, `categoryName`) VALUES
(2, 'Dessert'),
(3, 'SweetDish'),
(4, 'dinner');

-- --------------------------------------------------------

--
-- Table structure for table `itemorder`
--

CREATE TABLE `itemorder` (
  `id` int(11) NOT NULL,
  `orderDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deliveryAddress` varchar(200) NOT NULL,
  `orderStatus` tinyint(1) NOT NULL,
  `paymentMode` varchar(40) NOT NULL,
  `customerID` varchar(40) NOT NULL,
  `cancelled` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `itemorderdetail`
--

CREATE TABLE `itemorderdetail` (
  `id` int(11) NOT NULL,
  `itemID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `itemOrderID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fooditem`
--
ALTER TABLE `fooditem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FoodItem_ibfk_1` (`categoryID`);

--
-- Indexes for table `fooditemcategory`
--
ALTER TABLE `fooditemcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `itemorder`
--
ALTER TABLE `itemorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ItemOrder_ibfk_1` (`customerID`);

--
-- Indexes for table `itemorderdetail`
--
ALTER TABLE `itemorderdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `itemOrderID` (`itemOrderID`),
  ADD KEY `itemID` (`itemID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fooditem`
--
ALTER TABLE `fooditem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `fooditemcategory`
--
ALTER TABLE `fooditemcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `itemorder`
--
ALTER TABLE `itemorder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `itemorderdetail`
--
ALTER TABLE `itemorderdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `fooditem`
--
ALTER TABLE `fooditem`
  ADD CONSTRAINT `FoodItem_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `fooditemcategory` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `itemorder`
--
ALTER TABLE `itemorder`
  ADD CONSTRAINT `ItemOrder_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `itemorderdetail`
--
ALTER TABLE `itemorderdetail`
  ADD CONSTRAINT `ItemOrderDetail_ibfk_1` FOREIGN KEY (`itemOrderID`) REFERENCES `itemorder` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ItemOrderDetail_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `fooditem` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
