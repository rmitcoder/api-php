-- MySQL dump 10.13  Distrib 5.6.25, for osx10.8 (x86_64)
--
-- Host: localhost    Database: Bridge_Qiao
-- ------------------------------------------------------
-- Server version	5.6.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `Bridge_Qiao`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `Bridge_Qiao` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `Bridge_Qiao`;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `ad_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  PRIMARY KEY (`ad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'111','111','111');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `documents` (
  `doc_id` int(10) NOT NULL AUTO_INCREMENT,
  `docName` varchar(20) NOT NULL,
  `docType` varchar(20) NOT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'Driver\'s Licence','standard'),(2,'Birth Certificate','standard'),(3,'Marriage Certificate','standard'),(4,'Police Clearance','standard'),(5,'Degree Certificate','standard'),(6,'Diploma Certificate','standard'),(7,'High School Certific','standard'),(8,'Academic Transcript ','spec'),(9,'Name Change Certific','standard'),(10,'Death Certificate','spec'),(11,'Divorce Certificate','spec'),(12,'ID Card','standard'),(13,'1-Page Letter','spec'),(14,'Apostille','ap'),(15,'Passport','standard'),(16,'Family Register','japOnly'),(17,'Baptism Certificate','standard'),(18,'Medical Certificate','spec'),(19,'Other 1-page Certifi','standard'),(20,'Police Report','spec');
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `lan_id` int(10) NOT NULL AUTO_INCREMENT,
  `language` varchar(20) NOT NULL,
  `class` varchar(10) NOT NULL,
  PRIMARY KEY (`lan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'Afrikaans','B'),(2,'Albanian','B'),(3,'Arabic','A'),(4,'Assyrian','B'),(5,'Bengali','B'),(6,'Bosnian','A'),(7,'Bulgarian','A'),(8,'Burmese','A'),(9,'Catalan','B'),(10,'Chinese Simplified','A'),(11,'Chinese Traditional','A'),(12,'Croatian','A'),(13,'Czech','A'),(14,'Danish','A'),(15,'Dari','A'),(16,'Dinka','B'),(17,'Dutch','A'),(18,'Estonian','A'),(19,'Farsi (Persian)','A'),(20,'Finnish','A'),(21,'French','A'),(22,'German','A'),(23,'Greek','A'),(24,'Hebrew','B'),(25,'Hindi','A'),(26,'Hungarian','A'),(27,'Icelandic','B'),(28,'Indonesian','A'),(29,'Italian','A'),(30,'Japanese','A'),(31,'Khmer','A'),(32,'Korean','A'),(33,'Lao','B'),(34,'Latin','A'),(35,'Latvian','B'),(36,'Lithuanian','B'),(37,'Macedonian','A'),(38,'Malay','A'),(39,'Maltese','B'),(40,'Marathi','B'),(41,'Mongolian','B'),(42,'Nepali','A'),(43,'Norwegian','A'),(44,'Persian (Farsi)','A'),(45,'Polish','A'),(46,'Portuguese (Brazil)','A'),(47,'Portuguese (Portugal','A'),(48,'Punjabi','A'),(49,'Romanian','A'),(50,'Russian','A'),(51,'Serbian','A'),(52,'Sinhala','A'),(53,'Slovak','A'),(54,'Slovenian','A'),(55,'Spanish','A'),(56,'Swahili','B'),(57,'Swedish','A'),(58,'Tagalog','B'),(59,'Tamil','A'),(60,'Thai','A'),(61,'Turkish','A'),(62,'Ukrainian','A'),(63,'Urdu','A'),(64,'Vietnamese','A');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `order_id` int(10) NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(20) NOT NULL,
  `user_id` int(10) NOT NULL,
  `document` int(10) NOT NULL,
  `sourceLang` varchar(20) NOT NULL,
  `TargetLang` varchar(20) NOT NULL,
  `qty` int(10) NOT NULL,
  `copyQty` int(10) NOT NULL,
  `price` varchar(20) NOT NULL,
  `docAddress` varchar(50) NOT NULL,
  `totalPrice` varchar(20) NOT NULL,
  `orderTime` varchar(20) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `userInfo` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `price`
--

DROP TABLE IF EXISTS `price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(10) NOT NULL,
  `class` varchar(10) NOT NULL,
  `price` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `price`
--

LOCK TABLES `price` WRITE;
/*!40000 ALTER TABLE `price` DISABLE KEYS */;
INSERT INTO `price` VALUES (1,'standard','A','69'),(2,'standard','B','88'),(3,'spec','A','88'),(4,'spec','B','110'),(5,'ap','A','22'),(6,'ap','B','33'),(7,'japOnly','japOnly','132');
/*!40000 ALTER TABLE `price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userInfo`
--

DROP TABLE IF EXISTS `userInfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userInfo` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(20) NOT NULL,
  `lastName` varchar(20) NOT NULL,
  `emailAdd` varchar(50) NOT NULL,
  `postAdd` varchar(50) NOT NULL,
  `phoneNumber` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userInfo`
--

LOCK TABLES `userInfo` WRITE;
/*!40000 ALTER TABLE `userInfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `userInfo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-06 14:31:53
