-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2020 at 07:30 AM
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

CREATE DATABASE IF NOT EXISTS  rebahan-homestay;
USE DATABASE rebahan-homestay;

--
-- Database: `rebahan-homestay`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BookId` int(11) NOT NULL,
  `guestId` int(200) DEFAULT NULL,
  `roomId` varchar(200) NOT NULL,
  `dateFrom` date NOT NULL,
  `dateTo` date NOT NULL,
  `total_price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`BookId`, `guestId`, `roomId`, `dateFrom`, `dateTo`, `total_price`) VALUES
(1002, 10001, 'A1', '2019-12-31', '2020-01-01', 370000);

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `guestId` int(200) NOT NULL,
  `guestEmail` varchar(200) NOT NULL,
  `guestName` varchar(200) NOT NULL,
  `guestContact` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`guestId`, `guestEmail`, `guestName`, `guestContact`) VALUES
(10001, 'pradipta.27@students.amikom.ac.id', 'pradipta agus wibisono', '18.83.0170'),
(10002, 'pradipta.s@students.amikom.ac.id', 'pradipta mahardika sulaksono', '18.83.0191'),
(10003, 'reza.28@students.amikom.ac.id', 'reza adriyanto', '18.83.0142'),
(10004, 'nurc2424@gmail.com', 'Nur Chalis', '18.83.0171'),
(10005, 'rizal.2000@students.amikom.ac.id', 'Rizal Febriawan Handaru', '18.83.0177');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomId` varchar(200) NOT NULL,
  `type` varchar(4) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `room`
--

INSERT INTO `room` (`roomId`, `type`, `price`) VALUES
('A1', 'A', 400000),
('A2', 'A', 350000),
('B1', 'B', 250000),
('B2', 'B', 300000),
('C1', 'C', 125000),
('C2', 'C', 170000);

-- --------------------------------------------------------

--
-- Table structure for table `type_room`
--

CREATE TABLE `type_room` (
  `type_room` varchar(5) NOT NULL,
  `max_occupancy` int(11) DEFAULT NULL,
  `floor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type_room`
--

INSERT INTO `type_room` (`type_room`, `max_occupancy`, `floor`) VALUES
('A', 5, 1),
('B', 3, 2),
('C', 2, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`BookId`),
  ADD KEY `RoomID` (`roomId`),
  ADD KEY `GuestId` (`guestId`);

--
-- Indexes for table `guest`
--
ALTER TABLE `guest`
  ADD PRIMARY KEY (`guestId`);

--
-- Indexes for table `room`
--
ALTER TABLE `room`
  ADD PRIMARY KEY (`roomId`),
  ADD KEY `TYPE` (`type`);

--
-- Indexes for table `type_room`
--
ALTER TABLE `type_room`
  ADD PRIMARY KEY (`type_room`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `BookId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1030;

--
-- AUTO_INCREMENT for table `guest`
--
ALTER TABLE `guest`
  MODIFY `guestId` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1000100;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `GuestId` FOREIGN KEY (`guestId`) REFERENCES `guest` (`guestId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `RoomID` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `TYPE` FOREIGN KEY (`type`) REFERENCES `type_room` (`type_room`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
