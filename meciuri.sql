-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 02, 2021 at 10:00 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `practica`
--

-- --------------------------------------------------------

--
-- Table structure for table `meciuri`
--

CREATE TABLE `meciuri` (
  `id` int(10) NOT NULL,
  `echipa1` varchar(50) NOT NULL,
  `scor1` int(2) NOT NULL,
  `echipa2` varchar(50) NOT NULL,
  `scor2` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `meciuri`
--

INSERT INTO `meciuri` (`id`, `echipa1`, `scor1`, `echipa2`, `scor2`) VALUES
(1, 'Chelsea', 3, 'Liverpool', 2),
(2, 'Chelsea', 3, 'Liverpool', 3),
(3, 'Chelsea', 1, 'Liverpool', 3),
(4, 'Chelsea', 1, 'Liverpool', 4),
(5, 'Chelsea', 2, 'Liverpool', 3),
(6, 'Chelsea', 3, 'Liverpool', 2),
(7, 'Chelsea', 4, 'Liverpool', 1),
(8, 'Chelsea', 1, 'Liverpool', 2),
(9, 'Chelsea', 1, 'Liverpool', 2),
(10, 'Chelsea', 0, 'Real Madrid', 3),
(11, 'Chelsea', 2, 'Real Madrid', 3),
(12, 'Chelsea', 1, 'Real Madrid', 0),
(13, 'Chelsea', 2, 'Real Madrid', 1),
(14, 'Chelsea', 3, 'Real Madrid', 4),
(15, 'Chelsea', 3, 'Real Madrid', 3),
(16, 'Chelsea', 3, 'Real Madrid', 0),
(17, 'Chelsea', 1, 'Real Madrid', 1),
(18, 'Chelsea', 1, 'Real Madrid', 2),
(19, 'Chelsea', 3, 'Real Madrid', 3),
(20, 'Chelsea', 0, 'Real Madrid', 0),
(21, 'Liverpool', 3, 'Real Madrid', 1),
(22, 'Liverpool', 3, 'Real Madrid', 1),
(23, 'Liverpool', 2, 'Real Madrid', 2),
(24, 'Liverpool', 2, 'Real Madrid', 1),
(25, 'Liverpool', 1, 'Real Madrid', 0),
(26, 'Liverpool', 1, 'Real Madrid', 1),
(27, 'Liverpool', 2, 'Real Madrid', 1),
(28, 'Liverpool', 4, 'Real Madrid', 0),
(29, 'Liverpool', 5, 'Real Madrid', 0),
(30, 'Liverpool', 0, 'Real Madrid', 3),
(31, 'Bayern Munchen', 2, 'Red-Bull Leipzig', 1),
(32, 'Bayern Munchen', 1, 'Red-Bull Leipzig', 1),
(33, 'Bayern Munchen', 2, 'Red-Bull Leipzig', 0),
(34, 'Bayern Munchen', 2, 'Red-Bull Leipzig', 1),
(35, 'Bayern Munchen', 4, 'Red-Bull Leipzig', 0),
(36, 'Bayern Munchen', 2, 'Red-Bull Leipzig', 3),
(37, 'Bayern Munchen', 4, 'Red-Bull Leipzig', 2),
(38, 'Bayern Munchen', 0, 'Red-Bull Leipzig', 1),
(39, 'Bayern Munchen', 0, 'Red-Bull Leipzig', 2),
(40, 'Bayern Munchen', 3, 'Red-Bull Leipzig', 2),
(41, 'Liverpool', 2, 'Bayern Munchen', 1),
(42, 'Liverpool', 2, 'Bayern Munchen', 1),
(43, 'Liverpool', 3, 'Bayern Munchen', 1),
(44, 'Liverpool', 2, 'Bayern Munchen', 0),
(45, 'Liverpool', 0, 'Bayern Munchen', 1),
(46, 'Liverpool', 3, 'Bayern Munchen', 1),
(47, 'Liverpool', 2, 'Bayern Munchen', 1),
(48, 'Liverpool', 0, 'Bayern Munchen', 3),
(49, 'Liverpool', 2, 'Bayern Munchen', 4),
(50, 'Liverpool', 0, 'Bayern Munchen', 2),
(51, 'Barcelona', 3, 'Chelsea', 2),
(52, 'Barcelona', 3, 'Chelsea', 2),
(53, 'Barcelona', 0, 'Chelsea', 2),
(54, 'Barcelona', 3, 'Chelsea', 0),
(55, 'Barcelona', 1, 'Chelsea', 2),
(56, 'Barcelona', 3, 'Chelsea', 1),
(57, 'Barcelona', 2, 'Chelsea', 2),
(58, 'Barcelona', 3, 'Chelsea', 2),
(59, 'Barcelona', 3, 'Chelsea', 2),
(60, 'Barcelona', 3, 'Chelsea', 4),
(61, 'Liverpool', 1, 'Red-Bull Leipzig', 1),
(62, 'Liverpool', 1, 'Red-Bull Leipzig', 1),
(63, 'Liverpool', 0, 'Red-Bull Leipzig', 1),
(64, 'Liverpool', 1, 'Red-Bull Leipzig', 0),
(65, 'Liverpool', 2, 'Red-Bull Leipzig', 1),
(66, 'Liverpool', 3, 'Red-Bull Leipzig', 1),
(67, 'Liverpool', 1, 'Red-Bull Leipzig', 4),
(68, 'Liverpool', 0, 'Red-Bull Leipzig', 1),
(69, 'Liverpool', 3, 'Red-Bull Leipzig', 4),
(70, 'Liverpool', 4, 'Red-Bull Leipzig', 2),
(71, 'Liverpool', 2, 'Barcelona', 0),
(72, 'Liverpool', 2, 'Barcelona', 0),
(73, 'Liverpool', 2, 'Barcelona', 2),
(74, 'Liverpool', 3, 'Barcelona', 0),
(75, 'Liverpool', 4, 'Barcelona', 0),
(76, 'Liverpool', 0, 'Barcelona', 1),
(77, 'Liverpool', 2, 'Barcelona', 3),
(78, 'Liverpool', 2, 'Barcelona', 2),
(79, 'Liverpool', 0, 'Barcelona', 4),
(80, 'Liverpool', 1, 'Barcelona', 3),
(81, 'Real Madrid', 1, 'Barcelona', 0),
(82, 'Real Madrid', 1, 'Barcelona', 1),
(83, 'Real Madrid', 1, 'Barcelona', 2),
(84, 'Real Madrid', 1, 'Barcelona', 0),
(85, 'Real Madrid', 1, 'Barcelona', 3),
(86, 'Real Madrid', 1, 'Barcelona', 2),
(87, 'Real Madrid', 3, 'Barcelona', 2),
(88, 'Real Madrid', 0, 'Barcelona', 3),
(89, 'Real Madrid', 1, 'Barcelona', 2),
(90, 'Real Madrid', 1, 'Barcelona', 4),
(91, 'Real Madrid', 2, 'Bayern Munchen', 2),
(92, 'Real Madrid', 2, 'Bayern Munchen', 2),
(93, 'Real Madrid', 0, 'Bayern Munchen', 2),
(94, 'Real Madrid', 0, 'Bayern Munchen', 1),
(95, 'Real Madrid', 2, 'Bayern Munchen', 3),
(96, 'Real Madrid', 2, 'Bayern Munchen', 1),
(97, 'Real Madrid', 4, 'Bayern Munchen', 2),
(98, 'Real Madrid', 1, 'Bayern Munchen', 3),
(99, 'Real Madrid', 2, 'Bayern Munchen', 4),
(100, 'Real Madrid', 2, 'Bayern Munchen', 1),
(101, 'Real Madrid', 1, 'Red-Bull Leipzig', 3),
(102, 'Real Madrid', 1, 'Red-Bull Leipzig', 3),
(103, 'Real Madrid', 0, 'Red-Bull Leipzig', 3),
(104, 'Real Madrid', 2, 'Red-Bull Leipzig', 3),
(105, 'Real Madrid', 1, 'Red-Bull Leipzig', 0),
(106, 'Real Madrid', 1, 'Red-Bull Leipzig', 1),
(107, 'Real Madrid', 0, 'Red-Bull Leipzig', 2),
(108, 'Real Madrid', 2, 'Red-Bull Leipzig', 3),
(109, 'Real Madrid', 3, 'Red-Bull Leipzig', 4),
(110, 'Real Madrid', 1, 'Red-Bull Leipzig', 5),
(111, 'Bayern Munchen', 1, 'Chelsea', 3),
(112, 'Bayern Munchen', 1, 'Chelsea', 3),
(113, 'Bayern Munchen', 2, 'Chelsea', 3),
(114, 'Bayern Munchen', 1, 'Chelsea', 0),
(115, 'Bayern Munchen', 2, 'Chelsea', 3),
(116, 'Bayern Munchen', 1, 'Chelsea', 2),
(117, 'Bayern Munchen', 1, 'Chelsea', 0),
(118, 'Bayern Munchen', 1, 'Chelsea', 4),
(119, 'Bayern Munchen', 4, 'Chelsea', 3),
(120, 'Bayern Munchen', 0, 'Chelsea', 3),
(121, 'Barcelona', 2, 'Red-Bull Leipzig', 1),
(122, 'Barcelona', 2, 'Red-Bull Leipzig', 1),
(123, 'Barcelona', 3, 'Red-Bull Leipzig', 2),
(124, 'Barcelona', 1, 'Red-Bull Leipzig', 1),
(125, 'Barcelona', 0, 'Red-Bull Leipzig', 3),
(126, 'Barcelona', 3, 'Red-Bull Leipzig', 0),
(127, 'Barcelona', 2, 'Red-Bull Leipzig', 4),
(128, 'Barcelona', 4, 'Red-Bull Leipzig', 2),
(129, 'Barcelona', 0, 'Red-Bull Leipzig', 1),
(130, 'Barcelona', 1, 'Red-Bull Leipzig', 2),
(131, 'Barcelona', 2, 'Bayern Munchen', 2),
(132, 'Barcelona', 2, 'Bayern Munchen', 2),
(133, 'Barcelona', 1, 'Bayern Munchen', 0),
(134, 'Barcelona', 3, 'Bayern Munchen', 1),
(135, 'Barcelona', 1, 'Bayern Munchen', 3),
(136, 'Barcelona', 4, 'Bayern Munchen', 2),
(137, 'Barcelona', 0, 'Bayern Munchen', 4),
(138, 'Barcelona', 2, 'Bayern Munchen', 4),
(139, 'Barcelona', 1, 'Bayern Munchen', 3),
(140, 'Barcelona', 3, 'Bayern Munchen', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `meciuri`
--
ALTER TABLE `meciuri`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `meciuri`
--
ALTER TABLE `meciuri`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
