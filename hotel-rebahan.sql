-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 14, 2019 at 10:37 AM
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
-- Database: `hotel`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `BookId` int  NOT NULL,
  `roomId` int NOT NULL,
  `guestId` varchar(200) NOT NULL,
  `dateFrom` date NOT NULL,
  `dateTo` date NOT NULL,
  `total_price` int(11) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `guest`
--

CREATE TABLE `guest` (
  `guestId` varchar(200) NOT NULL,
  `guestPw` varchar(200) NOT NULL,
  `guestName` varchar(200) NOT NULL,
  `guestContact` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `guest`
--

INSERT INTO `guest` (`guestId`, `guestPw`, `guestName`, `guestContact`) VALUES
('pradipta.27', 'pradipta.27', 'pradipta agus wibisono', '18.83.0170'),
('pradipta.s', 'pradipta.s', 'pradipta mahardika sulaksono', '18.83.0191'),
('reza.28', 'reza.28', 'reza adriyanto', '18.83.0142');

-- --------------------------------------------------------

--
-- Table structure for table `room`
--

CREATE TABLE `room` (
  `roomId` INT NOT NULL,
  `type` varchar(4) NOT NULL,
  `price` int(11) NOT NULL
) ;

-- --------------------------------------------------------

--
-- Table structure for table `type_room`
--

CREATE TABLE `type_room` (
  `type_room` varchar(5) NOT NULL,
  `max_occupancy` int NULL,
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
  ADD KEY `Guestid` (`guestId`),
  ADD KEY `roomid` (`roomId`);

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
  ADD KEY `roomtype` (`type`);

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
  MODIFY `BookId` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `room`
  MODIFY `roomId` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `Guestid` FOREIGN KEY (`guestId`) REFERENCES `guest` (`guestId`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `roomid` FOREIGN KEY (`roomId`) REFERENCES `room` (`roomId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `room`
--
ALTER TABLE `room`
  ADD CONSTRAINT `roomtype` FOREIGN KEY (`type`) REFERENCES `type_room` (`type_room`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
