-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.7.12-log


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema trainingmanagementsystem
--

CREATE DATABASE IF NOT EXISTS trainingmanagementsystem;
USE trainingmanagementsystem;

--
-- Definition of table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_email_id` varchar(45) DEFAULT NULL,
  `admin_password` varchar(45) DEFAULT NULL,
  `admin_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


--
-- Definition of table `batch`
--

DROP TABLE IF EXISTS `batch`;
CREATE TABLE `batch` (
  `batch_id` int(11) NOT NULL,
  `batch_name` varchar(45) DEFAULT NULL,
  `batch_start_date` date DEFAULT NULL,
  `batch_end_date` date DEFAULT NULL,
  `batch_type` varchar(45) DEFAULT NULL,
  `batch_location` varchar(45) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`batch_id`),
  KEY `createdby_batch_fk_idx` (`created_by`),
  KEY `modifiedby_batch_fk_idx` (`modified_by`),
  CONSTRAINT `createdby_batch_fk` FOREIGN KEY (`created_by`) REFERENCES `admin` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `modifiedby_batch_fk` FOREIGN KEY (`modified_by`) REFERENCES `admin` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `batch`
--

/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;


--
-- Definition of table `batch_employee`
--

DROP TABLE IF EXISTS `batch_employee`;
CREATE TABLE `batch_employee` (
  `batch_emp_id` int(11) NOT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `emp_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`batch_emp_id`),
  KEY `batchid_batchemployee_fk_idx` (`batch_id`),
  KEY `empid_batchemployee_fk_idx` (`emp_id`),
  CONSTRAINT `batchid_batchemployee_fk` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `empid_batchemployee_fk` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `batch_employee`
--

/*!40000 ALTER TABLE `batch_employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_employee` ENABLE KEYS */;


--
-- Definition of table `batch_technology`
--

DROP TABLE IF EXISTS `batch_technology`;
CREATE TABLE `batch_technology` (
  `batch_tech_id` int(11) NOT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `tech_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`batch_tech_id`),
  KEY `batchid_batchtechnology_fk_idx` (`batch_id`),
  KEY `techid_batchtechnology_fk_idx` (`tech_id`),
  CONSTRAINT `batchid_batchtechnology_fk` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `techid_batchtechnology_fk` FOREIGN KEY (`tech_id`) REFERENCES `technology` (`tech_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `batch_technology`
--

/*!40000 ALTER TABLE `batch_technology` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch_technology` ENABLE KEYS */;


--
-- Definition of table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee` (
  `emp_id` int(11) NOT NULL,
  `emp_name` varchar(45) DEFAULT NULL,
  `emp_email_id` varchar(45) DEFAULT NULL,
  `emp_password` varchar(45) DEFAULT NULL,
  `emp_location` varchar(45) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `modifiedby_fk_idx` (`modified_by`),
  KEY `createdby_fk_idx` (`created_by`),
  CONSTRAINT `createdby_fk` FOREIGN KEY (`created_by`) REFERENCES `admin` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `modifiedby_fk` FOREIGN KEY (`modified_by`) REFERENCES `admin` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;


--
-- Definition of table `session`
--

DROP TABLE IF EXISTS `session`;
CREATE TABLE `session` (
  `session_id` int(11) NOT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `tech_id` int(11) DEFAULT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  `session_date` date DEFAULT NULL,
  `session_start_time` datetime DEFAULT NULL,
  `session_end_time` datetime DEFAULT NULL,
  `session_conducted` varchar(45) DEFAULT NULL,
  `topic_covered` varchar(45) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`session_id`),
  KEY `batchid_session_fk_idx` (`batch_id`),
  KEY `techid_session_fk_idx` (`tech_id`),
  KEY `trainerid_session_fk_idx` (`trainer_id`),
  KEY `createdby_session_fk_idx` (`created_by`),
  KEY `modifiedby_session_fk_idx` (`modified_by`),
  CONSTRAINT `batchid_session_fk` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `createdby_session_fk` FOREIGN KEY (`created_by`) REFERENCES `admin` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `modifiedby_session_fk` FOREIGN KEY (`modified_by`) REFERENCES `admin` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `techid_session_fk` FOREIGN KEY (`tech_id`) REFERENCES `technology` (`tech_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `trainerid_session_fk` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `session`
--

/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;


--
-- Definition of table `technology`
--

DROP TABLE IF EXISTS `technology`;
CREATE TABLE `technology` (
  `tech_id` int(11) NOT NULL,
  `tech_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tech_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `technology`
--

/*!40000 ALTER TABLE `technology` DISABLE KEYS */;
/*!40000 ALTER TABLE `technology` ENABLE KEYS */;


--
-- Definition of table `trainer`
--

DROP TABLE IF EXISTS `trainer`;
CREATE TABLE `trainer` (
  `trainer_id` int(11) NOT NULL,
  `trainer_name` varchar(45) DEFAULT NULL,
  `trainer_location` varchar(45) DEFAULT NULL,
  `trainer_email_id` varchar(45) DEFAULT NULL,
  `trainer_password` varchar(45) DEFAULT NULL,
  `created` date DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `modified` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`trainer_id`),
  KEY `createdby_trainer_fk_idx` (`created_by`),
  KEY `modifiedby_trainer_fk_idx` (`modified_by`),
  CONSTRAINT `createdby_trainer_fk` FOREIGN KEY (`created_by`) REFERENCES `admin` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `modifiedby_trainer_fk` FOREIGN KEY (`modified_by`) REFERENCES `admin` (`admin_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trainer`
--

/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;


--
-- Definition of table `trainer_technology`
--

DROP TABLE IF EXISTS `trainer_technology`;
CREATE TABLE `trainer_technology` (
  `trainer_tech_id` int(11) NOT NULL,
  `tech_id` int(11) DEFAULT NULL,
  `trainer_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`trainer_tech_id`),
  KEY `techid_trainertechnology_fk_idx` (`tech_id`),
  KEY `trainerid_trainertechnology_fk_idx` (`trainer_id`),
  CONSTRAINT `techid_trainertechnology_fk` FOREIGN KEY (`tech_id`) REFERENCES `technology` (`tech_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `trainerid_trainertechnology_fk` FOREIGN KEY (`trainer_id`) REFERENCES `trainer` (`trainer_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `trainer_technology`
--

/*!40000 ALTER TABLE `trainer_technology` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainer_technology` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
