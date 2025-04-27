-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 27, 2025 at 04:05 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `librarydb`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `ISBN` int(11) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `publication` varchar(20) DEFAULT NULL,
  `genre` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`ISBN`, `title`, `author`, `publication`, `genre`) VALUES
(11, 'Harry Potter', 'Rowling', 'Bloomsbury', 'Fantasy'),
(12, 'The Hobbit', 'Tolkien', 'Allen & Unwin', 'Fantasy'),
(13, 'Inferno', 'Dan Brown', 'Doubleday', 'Thriller'),
(14, 'Digital Fortress', 'Dan Brown', 'St. Martin', 'Thriller'),
(15, 'Atomic Habits', 'James Clear', 'Penguin', 'Self-help'),
(16, '1984', 'George Orwell', 'Secker', 'Dystopian'),
(17, 'Animal Farm', 'George Orwell', 'Penguin', 'Satire'),
(18, 'The Alchemist', 'Paulo Coelho', 'HarperOne', 'Fiction'),
(19, 'Rich Dad Poor Dad', 'Kiyosaki', 'Warner Books', 'Finance'),
(20, 'Sapiens', 'Yuval Harari', 'Vintage', 'History'),
(21, 'Power of Subconscious Mind', 'Joseph Murphy', NULL, 'Self-growth');

-- --------------------------------------------------------

--
-- Table structure for table `bookcopies`
--

CREATE TABLE `bookcopies` (
  `copyno` int(11) NOT NULL,
  `ISBN` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookcopies`
--

INSERT INTO `bookcopies` (`copyno`, `ISBN`) VALUES
(21, 11),
(22, 12),
(23, 13),
(24, 14),
(25, 15),
(26, 16),
(27, 17),
(28, 18),
(29, 19),
(30, 20);

-- --------------------------------------------------------

--
-- Table structure for table `borrowing`
--

CREATE TABLE `borrowing` (
  `bid` int(11) NOT NULL,
  `borrowdate` date DEFAULT NULL,
  `copyno` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `duedate` date DEFAULT NULL,
  `returndate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `borrowing`
--

INSERT INTO `borrowing` (`bid`, `borrowdate`, `copyno`, `userid`, `duedate`, `returndate`) VALUES
(1, '2025-04-14', 21, 38, '2025-04-28', NULL),
(61, '2024-03-01', 21, 31, '2024-03-15', NULL),
(62, '2024-03-03', 22, 32, '2024-03-17', '2024-03-15'),
(63, '2024-03-05', 23, 33, '2024-03-19', '2024-03-20'),
(64, '2024-03-06', 24, 34, '2024-03-20', NULL),
(65, '2024-03-07', 25, 35, '2024-03-21', NULL),
(66, '2025-04-14', 29, 38, '2025-04-28', '2025-04-14'),
(68, '2025-04-14', 29, 38, '2025-04-28', NULL),
(69, '2025-04-14', 29, 38, '2025-04-28', NULL),
(70, '2025-04-14', 29, 38, '2025-04-28', NULL),
(71, '2025-04-14', 22, 38, '2025-04-28', NULL),
(72, '2025-04-14', 22, 38, '2025-04-28', NULL),
(73, '2025-04-14', 22, 38, '2025-04-20', NULL),
(74, '2025-04-14', 22, 38, '2025-04-28', NULL),
(75, '2025-04-14', 29, 41, '2025-04-28', '2025-04-14'),
(76, '2025-04-14', 21, 44, '2025-04-24', '2025-04-25'),
(77, '2025-04-14', 25, 38, '2025-04-28', '2025-04-14'),
(78, '2025-04-15', 21, 39, '2025-04-29', '2025-04-15'),
(79, '2025-04-15', 21, 39, '2025-04-24', '2025-04-15'),
(80, '2025-04-20', 26, 45, '2025-04-20', NULL),
(81, '2025-04-25', 28, 39, '2025-05-09', '2025-04-25'),
(82, '2025-04-25', 27, 39, '2025-05-09', '2025-04-25'),
(83, '2025-04-26', 25, 44, '2025-04-20', '2025-04-26'),
(84, '2025-04-26', 22, 44, '2025-04-20', '2025-04-26'),
(85, '2025-04-26', 22, 44, '2025-04-20', '2025-04-26'),
(86, '2025-04-26', 25, 44, '2025-05-10', '2025-04-26'),
(87, '2025-04-26', 22, 44, '2025-04-20', '2025-04-26'),
(88, '2025-04-26', 25, 44, '2025-05-10', NULL),
(89, '2025-04-10', 22, 44, '2025-04-24', NULL),
(90, '2025-04-10', 23, 44, '2025-04-24', NULL),
(91, '2025-04-27', 25, 42, '2025-05-11', NULL),
(92, '2025-04-20', 21, 43, '2025-05-04', NULL);

--
-- Triggers `borrowing`
--
DELIMITER $$
CREATE TRIGGER `prevent_past_duedate` BEFORE INSERT ON `borrowing` FOR EACH ROW BEGIN
  IF NEW.duedate < CURDATE() THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Due date cannot be in the past';
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Stand-in structure for view `borrowinginfo`
-- (See below for the actual view)
--
CREATE TABLE `borrowinginfo` (
`bid` int(11)
,`fullname` varchar(50)
,`title` varchar(50)
,`borrowdate` date
,`returndate` date
);

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `pid` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `phoneno` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`pid`, `name`, `phoneno`) VALUES
(51, 'Pearson', '9999999999'),
(52, 'McGraw Hill', '8888888888');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staffid` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `role` enum('librarian','assistant','admin') DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staffid`, `name`, `role`, `address`) VALUES
(41, 'Tom', 'librarian', 'Delhi'),
(42, 'Spike', 'assistant', 'Mumbai'),
(43, 'Jerry', 'admin', 'Pune');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `address` varchar(50) DEFAULT NULL,
  `phoneno` varchar(10) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `fullname` varchar(50) DEFAULT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `address`, `phoneno`, `email`, `fullname`, `password`) VALUES
(1, NULL, NULL, 'elonmusk@gmail.com', 'harry', '$2y$10$kMvEuKM1PCGrenzZwS3DGuYo68GlYA0QT0e93G.XxOmUqVLxLUCai'),
(31, 'Bandra', '12345', 'abc@gmail.com', 'Oggybhai', 'abc123\r\n'),
(32, 'Andheri', '23456', 'def@gmail.com', 'Tommy', '1234\r\n'),
(33, 'Bandra', '34567', 'ghi@gmail.com', 'Spike', ''),
(34, 'Borivali', '45678', 'jkl@gmail.com', 'Jerry', ''),
(35, 'Thane', '56789', 'mno@gmail.com', 'Tyke', ''),
(36, NULL, NULL, 'harry@gmail.com', 'elon', '$2y$10$BVJKdDUHHn8xU3kXw5lN5ukJk3w9aDypSBo3LFhxzDIcRIDnybT1m'),
(37, NULL, NULL, 'her@gmail.com', 'herry', '$2y$10$pIxIpIuK0WMtW24hzPLW4uIUEFZL3ZINGK5yROaCNSykSH0HX8jG6'),
(38, NULL, NULL, 'perry@gmail.com', 'perry', '$2y$10$JHiEmu0j.foKvY.yGrJXDeMRkomfAl5VTCsWJXB0Dy3Fja6XSydle'),
(39, NULL, NULL, 'serry@gmail.com', 'serry', '$2y$10$XFCWaihDXYDvVGkQ3aoCtuhmHBMJNHoDz6qxVpv3NUPBbkdpNbumi'),
(40, NULL, NULL, 'kerry@gmail.com', 'kerry', '$2y$10$N30mpzuKODVv4kCXD1mtYel.nfHLyUkXlyuYZp5/jV8NNL2CPOfcC'),
(41, NULL, NULL, 'berry@gmail.com', 'berry', '$2y$10$0OvYXZRPhcrMAST62q8lK.cXVtZLQ7I8PNQS.Z6HzhWf9vR9oENNi'),
(42, NULL, NULL, 'mary@gmail.com', 'mary', '$2y$10$5OARutHWretH5Uz3b.IwEe8LigI1NdCQTKNG93LwF6mP/C5ULTYdG'),
(43, NULL, NULL, 'cherry@gmail.com', 'cherry', '$2y$10$zVscp904xpsSaMVK3cEyEeoseQqWzcHvb2gDq50lbLmn9abS55KDy'),
(44, NULL, NULL, 'aery@gmail.com', 'aery', '$2y$10$diAry3Xc5RMjBDg.vVcmnOxrx4EBtRuouHDR9SxTAUC15SGmDaSwW'),
(45, NULL, NULL, 'robo@gmail.com', 'robo', '$2y$10$MOsf.bpaNgNNnwCRzERgoekFf44PeGami8vQIBgs0yrWE/D1n6uZW');

-- --------------------------------------------------------

--
-- Structure for view `borrowinginfo`
--
DROP TABLE IF EXISTS `borrowinginfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `borrowinginfo`  AS SELECT `br`.`bid` AS `bid`, `u`.`fullname` AS `fullname`, `bk`.`title` AS `title`, `br`.`borrowdate` AS `borrowdate`, `br`.`returndate` AS `returndate` FROM (((`borrowing` `br` join `users` `u` on(`br`.`userid` = `u`.`userid`)) join `bookcopies` `bc` on(`br`.`copyno` = `bc`.`copyno`)) join `book` `bk` on(`bc`.`ISBN` = `bk`.`ISBN`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`ISBN`);

--
-- Indexes for table `bookcopies`
--
ALTER TABLE `bookcopies`
  ADD PRIMARY KEY (`copyno`),
  ADD KEY `ISBN` (`ISBN`);

--
-- Indexes for table `borrowing`
--
ALTER TABLE `borrowing`
  ADD PRIMARY KEY (`bid`),
  ADD KEY `userid` (`userid`),
  ADD KEY `copyno` (`copyno`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staffid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `borrowing`
--
ALTER TABLE `borrowing`
  MODIFY `bid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookcopies`
--
ALTER TABLE `bookcopies`
  ADD CONSTRAINT `bookcopies_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `book` (`ISBN`);

--
-- Constraints for table `borrowing`
--
ALTER TABLE `borrowing`
  ADD CONSTRAINT `borrowing_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`),
  ADD CONSTRAINT `borrowing_ibfk_2` FOREIGN KEY (`copyno`) REFERENCES `bookcopies` (`copyno`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
