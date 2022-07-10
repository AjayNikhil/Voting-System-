-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 20, 2021 at 09:54 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `votesystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `created_on` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `firstname`, `lastname`, `photo`, `created_on`) VALUES
(1, 'admin', '$2y$10$gpJO6AErtzbcgBJJ58pRJ.wyEjWp0jdmPcFa2OLOBWht1cKKJXB5S', 'Anirudh', 'S', 'Screenshot 2021-08-16 152436.png', '2018-04-02');

-- --------------------------------------------------------

--
-- Table structure for table `candidates`
--

CREATE TABLE `candidates` (
  `id` int(11) NOT NULL,
  `position_id` int(11) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `votes` int(11) NOT NULL,
  `parties_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `candidates`
--

INSERT INTO `candidates` (`id`, `position_id`, `firstname`, `lastname`, `photo`, `votes`, `parties_id`) VALUES
(27, 11, 'Anirudh', 'Simhachalam', 'Screenshot 2021-08-16 152436.png', 0, 1),
(28, 11, 'cifal', 'shaul', 'Screenshot 2021-08-16 152403.png', 0, 2),
(29, 11, 'Ajay', 'Nikhil', '1.png', 0, 3),
(30, 12, 'Sainath', 'B', 'Screenshot 2021-08-16 152436.png', 0, 4),
(31, 12, 'Prashanth', 'Kota', '1.png', 1, 2),
(32, 12, 'Suraj', 'U', 'Screenshot 2021-08-16 152414.png', 1, 1),
(33, 13, 'srinidh', 'Y', 'Screenshot 2021-08-16 152333.png', 0, 2),
(34, 13, 'sravan', 'B', 'Screenshot 2021-08-16 152345.png', 0, 4),
(35, 13, 'krishna', 'Prakash', '1.png', 0, 3),
(36, 14, 'Gopal', 'babu', '2.png', 0, 4),
(37, 14, 'gopi', 'krishna', 'Screenshot 2021-08-16 152426.png', 0, 2),
(38, 12, 'Jayram', 'Naik', 'Screenshot 2021-08-16 152345.png', 0, 3),
(39, 14, 'Abhinav ', 'Kathuri', 'Screenshot 2021-08-16 152414.png', 0, 1),
(40, 14, 'Janiki', 'Ram', 'Screenshot 2021-08-16 152403.png', 0, 3),
(41, 13, 'Pranav', 'sai', '2.png', 0, 1),
(42, 11, 'Harsha', 'Vardhan', '2.png', 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `parties`
--

CREATE TABLE `parties` (
  `id` int(11) NOT NULL,
  `name` varchar(30) CHARACTER SET latin1 NOT NULL,
  `leader` varchar(50) CHARACTER SET latin1 NOT NULL,
  `logo` varchar(100) CHARACTER SET latin1 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `parties`
--

INSERT INTO `parties` (`id`, `name`, `leader`, `logo`) VALUES
(1, 'BJP', 'Bandi Sanjay Kumar', 'bjp-logo-1-1.png'),
(2, 'YCP', 'Y.S.Jagan Mohan Reddy', 'ycp fan.jpeg'),
(3, 'TRS', 'K.C.R', 'TRS-Party-Symbol-CAR1.jpg'),
(4, 'INC', 'N. Uttam Kumar Reddy', 'congress.png');

-- --------------------------------------------------------

--
-- Table structure for table `positions`
--

CREATE TABLE `positions` (
  `id` int(11) NOT NULL,
  `wardname` varchar(50) NOT NULL,
  `dist_name` varchar(50) NOT NULL,
  `priority` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `positions`
--

INSERT INTO `positions` (`id`, `wardname`, `dist_name`, `priority`) VALUES
(11, 'warangal east', 'Warangal Urban', 3),
(12, 'warangal west', 'Warangal Urban', 1),
(13, 'peerzadiguda', 'Hyderabad', 2),
(14, 'Kukatpally', 'Hyderabad', 4);

-- --------------------------------------------------------

--
-- Table structure for table `voters`
--

CREATE TABLE `voters` (
  `id` int(11) NOT NULL,
  `voters_id` varchar(15) NOT NULL,
  `password` varchar(60) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `photo` varchar(150) NOT NULL,
  `position_id` int(11) NOT NULL,
  `voted` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voters`
--

INSERT INTO `voters` (`id`, `voters_id`, `password`, `firstname`, `lastname`, `photo`, `position_id`, `voted`) VALUES
(19, 'ABN4598621', '$2y$10$486CBQzwChRcjcl7qtquIukqC8YtPyP3GTq7KXtOGvsF5ehnDKira', 'voter1', 'V1', '1.png', 12, 1),
(20, 'STV2895715', '$2y$10$jJn8UIV/mcNShkWB9BCLfuHAePNKIY3mLbXgLicCTUp0Crw.pCQ.i', 'voter2', 'V2', '2.png', 12, 1),
(21, 'TXK8569247', '$2y$10$1qkvooKO99GpomPGTGvfT.hnsMEJpga.XbtBEgEPwhJ5.Rnpzw58.', 'voter3', 'V3', 'Screenshot 2021-08-16 152333.png', 12, 0),
(22, 'WFR4521896', '$2y$10$eq29uHlMUrlECjkxHOPoF.soWL0SkftP2BlMMrkk.OgJiz8.Sj2Vu', 'voter4', 'V4', 'Screenshot 2021-08-16 152436.png', 12, 0),
(23, 'YNH4598176', '$2y$10$SD1tAEAYRUNRN5xN2goPe.AgL/P1PDwuqmwduScHKJd.SmPpn2roK', 'voter5', 'V5', 'Screenshot 2021-08-16 152345.png', 12, 0),
(24, 'JBP4318296', '$2y$10$PM.96Jo/y6Fd89xdeVuT2O2dxsA6xRvrhFdF5bOvK3BVnDS.pZiFy', 'voter6', 'V6', 'Screenshot 2021-08-16 152403.png', 12, 0),
(25, 'YDA3496128', '$2y$10$tqwaWyC2iHK5KNh5ViHXn.dgN/NydOf/PaAp69qwhKQsm7c1VeFb2', 'voter7', 'v7', '1.png', 11, 0),
(26, 'BMV1483295', '$2y$10$3.ejXieIL1di9zQsVNTVYe0tTuBgqlJRnTe6rlKler23OWUYdh.Tq', 'voter8', 'v8', '2.png', 11, 0),
(27, 'NMZ7386912', '$2y$10$b28rWfYCPnqz8zAlVbNIOOW94SE5UjCFmBl3X1n5KnnMjFBHxMzI.', 'voter9', 'v9', 'Screenshot 2021-08-16 152333.png', 11, 0),
(28, 'IXF7685239', '$2y$10$z9BePaPdHUYfBe4YCcLd6OKXCBBezOE1EsICFg9XhM7EM9c6ueREG', 'voter10', 'v10', 'Screenshot 2021-08-16 152345.png', 11, 0),
(29, 'EGQ4287513', '$2y$10$HRpPMwlxz4QJyHPsKduCOeXLSGne/GbnVhIyeIQ7H53LlPVDaYILO', 'voter11', 'v11', 'Screenshot 2021-08-16 152414.png', 11, 0),
(30, 'RYX4215678', '$2y$10$GuvuOSdV/uxjOOqScVWit.l5lF6sru06s4DT7XOR7jryMcDIh/5Qa', 'voter12', 'v12', 'Screenshot 2021-08-16 152426.png', 11, 0),
(31, 'OPU6425139', '$2y$10$FKuY1bhdAapyO14URFcMcOCYzxA6CbNN1xs6C9GfbTPdVFfc3TsR.', 'voter13', 'v13', 'Screenshot 2021-08-16 152436.png', 13, 0),
(32, 'IDH1354629', '$2y$10$ta9zWUnT4eLHYg4JbecqluMqnZKp768qb4saVer3nPPR1uiK9usrq', 'voter14', 'v14', 'Screenshot 2021-08-16 152426.png', 13, 0),
(33, 'DEF8315296', '$2y$10$jr0C64EvLaG2G3oHYClnf.zmrWC1MnvkAcHq9GfwnL0LQjyzvrfue', 'voter15', 'v15', '2.png', 13, 0),
(34, 'HKW9832514', '$2y$10$dugbFDAnBnUsIP4KQDJnOeN4.KImmYgc4uGlgJQ9hwP1aEhpvsMPS', 'voter16', 'v16', 'Screenshot 2021-08-16 152333.png', 13, 0),
(35, 'ZXA7248913', '$2y$10$iCS47WXIBcTtfgcDcgbh7OkHJGCr.ObJ1HNjz31Xhzfa37Elheuwm', 'voter17', 'v17', 'Screenshot 2021-08-16 152426.png', 13, 0),
(36, 'PKA7235148', '$2y$10$XlFxRtj6vi0pM58BBFzwHOQs0GEFPktAv0hZ0AfZzfos0d.pEzKM2', 'voter18', 'v18', 'Screenshot 2021-08-16 152333.png', 13, 0),
(37, 'WGD4728396', '$2y$10$Dek4mvb.VVRqQa2QyTmfs.4s5WwP4jzb3Sgd9cjZDeGZQh0lD5NwW', 'voter19', 'v19', 'Screenshot 2021-08-16 152333.png', 14, 0),
(38, 'BNR4925836', '$2y$10$F9TscrCsjgVcnZl/B5Q8yuByTBEiTHauC/uHM/iT5.Cz.QRDS5/QK', 'voter20', 'v20', 'Screenshot 2021-08-16 152426.png', 14, 0),
(39, 'NQD1936572', '$2y$10$nS8f/KWhpAdg1KcvW7uOT.ZXmI.RpJcng1Dah1YJWSoz253LVK00e', 'voter21', 'v21', '1.png', 14, 0),
(40, 'ITA7834612', '$2y$10$6cQqQv5zeoUOJb9TL/tsxePUhbmY6GoKA/b3YFp1Ojv/iKP6MlB1.', 'voter22', 'v22', 'Screenshot 2021-08-16 152403.png', 14, 0),
(41, 'HCD9138472', '$2y$10$.yUT.kQsClGyOQGutsQHfuE/Z1cutIgl/CErWEqzL59lDKOnYVyQu', 'voter23', 'v23', 'Screenshot 2021-08-16 152345.png', 14, 0),
(42, 'DHV8139726', '$2y$10$3/LHjjUuFCzjWKGTIWkoceFKgzcf4BZRhflQ44bGgSWUewa0Fehwi', 'voter24', 'v24', 'Screenshot 2021-08-16 152414.png', 14, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `candidates`
--
ALTER TABLE `candidates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `parties`
--
ALTER TABLE `parties`
  ADD PRIMARY KEY (`id`) KEY_BLOCK_SIZE=15 USING BTREE;

--
-- Indexes for table `positions`
--
ALTER TABLE `positions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `voters`
--
ALTER TABLE `voters`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `candidates`
--
ALTER TABLE `candidates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `parties`
--
ALTER TABLE `parties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `positions`
--
ALTER TABLE `positions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `voters`
--
ALTER TABLE `voters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
