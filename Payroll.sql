
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Payroll`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE IF NOT EXISTS `employee` (
  `empId` int(11) NOT NULL DEFAULT '0',
  `nic` char(10) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `address` text NOT NULL,
  `city` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `designation` varchar(50) NOT NULL,
  `department` varchar(50) NOT NULL,
  `tel_home` varchar(10) NOT NULL,
  `tel_mobile` varchar(10) NOT NULL,
  `date_of_joining` date NOT NULL,
  `salType` varchar(10) NOT NULL,
  `salAmount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`empId`, `nic`, `fname`, `lname`, `dob`, `address`, `city`, `gender`, `designation`, `department`, `tel_home`, `tel_mobile`, `date_of_joining`, `salType`, `salAmount`) VALUES
(1, '931552171v', 'Neil', 'Nitin', '1993-06-03', 'Banashankari', 'Bengaluru', 'Male', 'Software Engineer', 'IT', '0112934766', '0775096052', '2015-12-12', 'Monthly', 90000),
(2, '921547812v', 'Nitin', 'Mukesh', '1993-05-04', 'Jayanagar', 'Bengaluru', 'Male', 'Accountant', 'Finance', '0112568478', '0778412563', '2015-01-05', 'Monthly', 30000),
(3, '901336587v', 'Mukesh', 'Kumar', '1990-05-04', 'Kathriguppe', 'Bengaluru', 'Male', 'Clerk', 'Finance', '0112789654', '0713456258', '2015-04-08', 'Monthly', 38000);

-- --------------------------------------------------------

--
-- Table structure for table `salary_details`
--

CREATE TABLE IF NOT EXISTS `salary_details` (
  `empId` int(11) NOT NULL,
  `travelAllow` double NOT NULL,
  `foodAllow` double NOT NULL,
  `bonus` double NOT NULL,
  `epf` double NOT NULL,
  `tax` double NOT NULL,
  `paye` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `salary_details`
--

INSERT INTO `salary_details` (`empId`, `travelAllow`, `foodAllow`, `bonus`, `epf`, `tax`, `paye`) VALUES
(1, 48, 40, 60, 32, 8, 8),
(2, 3000, 3000, 4500, 2400, 1500, 600),
(3, 1, 1, 1.5, 0.8, 0.5, 0.2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_leave`
--

CREATE TABLE IF NOT EXISTS `tbl_leave` (
  `empId` int(11) NOT NULL,
  `annual` double NOT NULL DEFAULT '15',
  `casual` double NOT NULL DEFAULT '10',
  `optional` double NOT NULL DEFAULT '5'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_leave`
--

INSERT INTO `tbl_leave` (`empId`, `annual`, `casual`, `optional`) VALUES
(1, 15, 10, 5),
(2, 15, 10, 5),
(3, 15, 10, 5);

-- --------------------------------------------------------

--
-- Table structure for table `User`
--

CREATE TABLE IF NOT EXISTS `User` (
  `userId` int(11) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `User`
--

INSERT INTO `User` (`userId`, `userName`, `password`, `admin`) VALUES
(1, 'sumukha', 'admin', 1),
(2, 'srinivasa', 'admin', 1),
(3, 'sribhargav', 'admin', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`empId`),
  ADD UNIQUE KEY `empId` (`empId`);

--
-- Indexes for table `salary_details`
--
ALTER TABLE `salary_details`
  ADD PRIMARY KEY (`empId`);

--
-- Indexes for table `tbl_leave`
--
ALTER TABLE `tbl_leave`
  ADD PRIMARY KEY (`empId`);

--
-- Indexes for table `User`
--
ALTER TABLE `User`
  ADD PRIMARY KEY (`userId`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `salary_details`
--
ALTER TABLE `salary_details`
  ADD CONSTRAINT `fl_salary` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_leave`
--
ALTER TABLE `tbl_leave`
  ADD CONSTRAINT `fk_leave` FOREIGN KEY (`empId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `User`
--
ALTER TABLE `User`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`userId`) REFERENCES `employee` (`empId`) ON DELETE CASCADE ON UPDATE CASCADE;
