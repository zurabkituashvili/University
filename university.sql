-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 25, 2022 at 06:52 PM
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
-- Database: `university`
--

-- --------------------------------------------------------

--
-- Table structure for table `assistent`
--

CREATE TABLE `assistent` (
  `persID` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `researchArea` varchar(30) DEFAULT NULL,
  `profID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `assistent`
--

INSERT INTO `assistent` (`persID`, `name`, `researchArea`, `profID`) VALUES
(3000, 'YoungResearcher', 'Databases', 2133),
(3002, 'Platon', 'Ideology', 2125),
(3003, 'Aristoteles', 'Logic', 2125),
(3004, 'Wittgenstein', 'Speech Theorie', 2126),
(3005, 'Rhetikus', 'Movement of Planets', 2127),
(3006, 'Newton', 'Kepler\'s laws', 2127),
(3007, 'Spinoza', 'God and Nature', 2134),
(3200, 'Giorgi', 'Databases', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `course`
--

CREATE TABLE `course` (
  `course1ID` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `contactHours` int(11) DEFAULT NULL,
  `profID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `course`
--

INSERT INTO `course` (`course1ID`, `title`, `contactHours`, `profID`) VALUES
(4052, 'Logic', 4, 2125),
(4630, 'Three Critics', 4, 2137),
(5001, 'Foundation', 4, 2137),
(5022, 'Science and Faith', 2, 2134),
(5041, 'Ethics', 4, 2125),
(5043, 'Cognition Theory', 3, 2126),
(5049, 'maieutics', 2, 2125),
(5052, 'philosophy of science', 3, 2126),
(5216, 'Bioethics', 2, 2126),
(5259, 'Vienna Circle', 2, 2133);

-- --------------------------------------------------------

--
-- Table structure for table `enrollment`
--

CREATE TABLE `enrollment` (
  `studID` int(11) NOT NULL,
  `course1ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `enrollment`
--

INSERT INTO `enrollment` (`studID`, `course1ID`) VALUES
(25403, 5022),
(26120, 5001),
(27550, 4052),
(27550, 5001),
(28106, 5041),
(28106, 5052),
(28106, 5216),
(28106, 5259),
(29120, 5001),
(29120, 5041),
(29120, 5049),
(29555, 5001),
(29555, 5022);

-- --------------------------------------------------------

--
-- Table structure for table `examination`
--

CREATE TABLE `examination` (
  `studID` int(11) NOT NULL,
  `course1ID` int(11) NOT NULL,
  `profID` int(11) NOT NULL,
  `grade` decimal(2,1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `examination`
--

INSERT INTO `examination` (`studID`, `course1ID`, `profID`, `grade`) VALUES
(25403, 5041, 2125, '2.0'),
(27550, 4630, 2137, '2.0'),
(28106, 5001, 2126, '1.0');

-- --------------------------------------------------------

--
-- Table structure for table `log_exam`
--

CREATE TABLE `log_exam` (
  `logID` int(11) NOT NULL,
  `logTime` int(11) NOT NULL,
  `logUser` int(11) NOT NULL,
  `oldStudID` int(11) NOT NULL,
  `oldCourseID` int(11) NOT NULL,
  `oldProfID` int(11) NOT NULL,
  `oldGrade` int(11) NOT NULL,
  `newStudID` int(11) NOT NULL,
  `newCourseID` int(11) NOT NULL,
  `newProfID` int(11) NOT NULL,
  `newGrade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `professor`
--

CREATE TABLE `professor` (
  `profID` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `rank` char(2) DEFAULT NULL,
  `room` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `professor`
--

INSERT INTO `professor` (`profID`, `name`, `rank`, `room`) VALUES
(2125, 'Sokrates', 'C4', 226),
(2126, 'Russel', 'C4', 232),
(2127, 'Kopernikus', 'C3', 310),
(2133, 'Popper', 'C3', 52),
(2134, 'Augustinus', 'C3', 309),
(2136, 'Curie', 'C4', 36),
(2137, 'Kant', 'C4', 7);

-- --------------------------------------------------------

--
-- Table structure for table `requirement`
--

CREATE TABLE `requirement` (
  `predeccessor` int(11) NOT NULL,
  `successor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `requirement`
--

INSERT INTO `requirement` (`predeccessor`, `successor`) VALUES
(4052, 5049),
(4630, 5259),
(5041, 4630),
(5041, 5049),
(5259, 5052);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `studID` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `semester` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`studID`, `name`, `semester`) VALUES
(24002, 'Xenokrates', 18),
(25403, 'Jonas', 12),
(26120, 'Fichte', 10),
(26830, 'Aristoxenos', 8),
(27550, 'Schopenhauer', NULL),
(28106, 'Carnap', 3),
(29120, 'Theophrastos', NULL),
(29555, 'Feuerbach', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assistent`
--
ALTER TABLE `assistent`
  ADD PRIMARY KEY (`persID`),
  ADD KEY `profID` (`profID`);

--
-- Indexes for table `course`
--
ALTER TABLE `course`
  ADD PRIMARY KEY (`course1ID`),
  ADD KEY `lecturer` (`profID`);

--
-- Indexes for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD PRIMARY KEY (`studID`,`course1ID`),
  ADD KEY `course1ID` (`course1ID`);

--
-- Indexes for table `examination`
--
ALTER TABLE `examination`
  ADD PRIMARY KEY (`studID`,`course1ID`),
  ADD KEY `prof.ID` (`profID`),
  ADD KEY `course1ID` (`course1ID`);

--
-- Indexes for table `log_exam`
--
ALTER TABLE `log_exam`
  ADD PRIMARY KEY (`logID`);

--
-- Indexes for table `professor`
--
ALTER TABLE `professor`
  ADD PRIMARY KEY (`profID`),
  ADD KEY `name` (`name`);

--
-- Indexes for table `requirement`
--
ALTER TABLE `requirement`
  ADD PRIMARY KEY (`predeccessor`,`successor`),
  ADD KEY `requirement1_ibfk_2` (`successor`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`studID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assistent`
--
ALTER TABLE `assistent`
  ADD CONSTRAINT `assistent_ibfk_1` FOREIGN KEY (`profID`) REFERENCES `professor` (`profID`) ON UPDATE CASCADE;

--
-- Constraints for table `course`
--
ALTER TABLE `course`
  ADD CONSTRAINT `course_ibfk_1` FOREIGN KEY (`profID`) REFERENCES `professor` (`profID`) ON UPDATE CASCADE;

--
-- Constraints for table `enrollment`
--
ALTER TABLE `enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`course1ID`) REFERENCES `course` (`course1ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`studID`) REFERENCES `student` (`studID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `examination`
--
ALTER TABLE `examination`
  ADD CONSTRAINT `examination_ibfk_1` FOREIGN KEY (`studID`) REFERENCES `student` (`studID`),
  ADD CONSTRAINT `examination_ibfk_2` FOREIGN KEY (`course1ID`) REFERENCES `course` (`course1ID`),
  ADD CONSTRAINT `examination_ibfk_3` FOREIGN KEY (`profID`) REFERENCES `professor` (`profID`);

--
-- Constraints for table `requirement`
--
ALTER TABLE `requirement`
  ADD CONSTRAINT `requirement_ibfk_1` FOREIGN KEY (`predeccessor`) REFERENCES `course` (`course1ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `requirement_ibfk_2` FOREIGN KEY (`successor`) REFERENCES `course` (`course1ID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
