-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: ims
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `productmovement`
--

DROP TABLE IF EXISTS `productmovement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productmovement` (
  `movement_id` varchar(200) NOT NULL,
  `timestamp` timestamp NOT NULL,
  `from_location` varchar(200) DEFAULT NULL,
  `to_location` varchar(200) DEFAULT NULL,
  `product_id` varchar(200) NOT NULL,
  `qty` int NOT NULL,
  PRIMARY KEY (`movement_id`),
  KEY `fk_pid` (`product_id`),
  KEY `fk_lid` (`from_location`),
  KEY `fk_lidt` (`to_location`),
  CONSTRAINT `fk_lid` FOREIGN KEY (`from_location`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_lidt` FOREIGN KEY (`to_location`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_pid` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productmovement`
--

LOCK TABLES `productmovement` WRITE;
/*!40000 ALTER TABLE `productmovement` DISABLE KEYS */;
INSERT INTO `productmovement` VALUES ('M01','2021-02-11 07:00:15',NULL,'2001','101',5),('M02','2021-02-11 06:50:15',NULL,'2001','102',6),('M03','2021-02-10 19:50:15',NULL,'2002','101',9),('M04','2021-02-10 19:59:15',NULL,'2002','102',11),('M05','2021-02-12 04:30:11','2001',NULL,'101',2),('M06','2021-02-13 09:32:21','2002',NULL,'102',4),('M07','2021-02-14 02:42:21','2001','2002','102',1),('M08','2021-02-14 02:46:12','2002','2001','102',2),('M09','2021-02-12 13:39:12','2002','2001','101',1),('M10','2021-02-10 19:31:11','2002','2001','101',1),('M11','2021-02-12 09:15:23','2001','2002','101',1),('M12','2021-02-11 14:19:17',NULL,'2001','101',10),('M13','2021-02-12 07:19:11','2001','2002','101',3),('M14','2021-02-13 02:10:41',NULL,'2002','202',13),('M15','2021-02-12 11:50:21',NULL,'2002','201',15),('M16','2021-02-11 01:51:31',NULL,'2001','201',8),('M17','2021-02-12 13:50:39',NULL,'2001','201',8),('M18','2021-02-11 03:37:19',NULL,'2001','202',9),('M19','2021-02-08 19:32:11','2002','2001','202',2),('M20','2021-02-09 22:22:12','2001','2002','201',1);
/*!40000 ALTER TABLE `productmovement` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-21  0:39:48
