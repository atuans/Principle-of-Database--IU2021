CREATE DATABASE  IF NOT EXISTS `ApressFinancial` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `ApressFinancial`;
-- MySQL dump 10.13  Distrib 8.0.22, for macos10.15 (x86_64)
--
-- Host: 127.0.0.1    Database: ApressFinancial
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Table structure for table `ApressFinancials`
--

DROP TABLE IF EXISTS `ApressFinancials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ApressFinancials` (
  `idApressFinancials` int NOT NULL,
  PRIMARY KEY (`idApressFinancials`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ApressFinancials`
--

LOCK TABLES `ApressFinancials` WRITE;
/*!40000 ALTER TABLE `ApressFinancials` DISABLE KEYS */;
/*!40000 ALTER TABLE `ApressFinancials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CustomerProducts`
--

DROP TABLE IF EXISTS `CustomerProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CustomerProducts` (
  `CustomerFinancialProductId` int NOT NULL AUTO_INCREMENT,
  `CustomerId` int NOT NULL,
  `FinancialProductId` int NOT NULL,
  `AmountToCollect` int NOT NULL,
  `Frequency` int NOT NULL,
  `LastCollected` date NOT NULL,
  `LastCollection` date NOT NULL,
  `Renewable` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CustomerFinancialProductId`),
  CONSTRAINT `customerproducts_chk_1` CHECK ((`AmountToCollect` > 0)),
  CONSTRAINT `customerproducts_chk_2` CHECK ((`AmountToCollect` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CustomerProducts`
--

LOCK TABLES `CustomerProducts` WRITE;
/*!40000 ALTER TABLE `CustomerProducts` DISABLE KEYS */;
INSERT INTO `CustomerProducts` VALUES (1,19233,1,100,1,'2019-01-02','2020-12-13',_binary ''),(2,19087,2,200,1,'2001-12-13','2003-03-09',_binary ''),(3,19234,2,200,1,'2020-01-01','2021-01-01',_binary ''),(4,19156,3,400,2,'2018-01-02','2019-03-06',_binary ''),(5,19033,5,1000,2,'2003-03-09','2001-12-13',_binary '');
/*!40000 ALTER TABLE `CustomerProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customers` (
  `CustomerId` bigint NOT NULL AUTO_INCREMENT,
  `CustomerTitleId` int NOT NULL,
  `CustomerFirstName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CustomerOtherInitials` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CustomerLastName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AddressId` bigint NOT NULL,
  `AccountNumber` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `AccountTypeId` int NOT NULL,
  `ClearedBalance` decimal(15,2) NOT NULL,
  `UnclearedBalance` decimal(15,2) NOT NULL,
  `DateAdded` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`CustomerId`)
) ENGINE=InnoDB AUTO_INCREMENT=19235 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (19033,3,'Công','Đức','Nguyễn',7400,'0123132153',1,23.12,0.00,'2019-06-07 03:25:01'),(19087,2,'Julie','A','Dewson',2134,'81625422',1,53.32,-12.21,'2018-04-15 01:08:52'),(19111,1,'Kiryu','C','Sento',1236,'3265473455',1,6546.00,0.00,'2019-04-19 00:00:00'),(19156,1,'Tuấn',' Hoàng Anh ','Nguyễn',7600,'0913174630',1,20.45,0.00,'2019-05-06 02:45:00'),(19233,3,'Bernie','I','McGee',314,'65368765',1,6653.11,0.00,'2018-04-15 01:08:52'),(19234,1,'Kirsty','B','Hull',4312,'96565334',1,1266.00,10.32,'2019-04-19 02:45:00');
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FinancialProducts`
--

DROP TABLE IF EXISTS `FinancialProducts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FinancialProducts` (
  `ProductId` bigint NOT NULL,
  `ProductName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`ProductId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FinancialProducts`
--

LOCK TABLES `FinancialProducts` WRITE;
/*!40000 ALTER TABLE `FinancialProducts` DISABLE KEYS */;
INSERT INTO `FinancialProducts` VALUES (12345,'Airpods Pro'),(14328,'Macbook Air 2017'),(16553,'iphone 12-XSMax'),(34290,'Macbook M1'),(42344,'G-Shock XSDB1212'),(45641,'Airpods 2'),(84723,'Macbook Pro 2019');
/*!40000 ALTER TABLE `FinancialProducts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SharePrices`
--

DROP TABLE IF EXISTS `SharePrices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SharePrices` (
  `SharePriceId` bigint NOT NULL,
  `ShareId` bigint NOT NULL,
  `Price` decimal(18,5) NOT NULL,
  `PriceDate` datetime NOT NULL,
  PRIMARY KEY (`SharePriceId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SharePrices`
--

LOCK TABLES `SharePrices` WRITE;
/*!40000 ALTER TABLE `SharePrices` DISABLE KEYS */;
INSERT INTO `SharePrices` VALUES (1,1,3000.00000,'2020-09-08 00:00:00'),(2,2,7000.00000,'2020-12-13 00:00:00'),(3,3,2400.00000,'2020-01-01 00:00:00'),(4,4,1900.00000,'2020-04-05 00:00:00'),(5,5,3800.00000,'2020-06-08 00:00:00'),(6,6,4500.00000,'2020-10-10 00:00:00');
/*!40000 ALTER TABLE `SharePrices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Shares`
--

DROP TABLE IF EXISTS `Shares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Shares` (
  `ShareId` bigint NOT NULL AUTO_INCREMENT,
  `ShareDesc` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ShareTickerId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CurrentPrice` decimal(18,5) NOT NULL,
  PRIMARY KEY (`ShareId`),
  CONSTRAINT `FK_SharePrices_Shares` FOREIGN KEY (`ShareId`) REFERENCES `SharePrices` (`SharePriceId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Shares`
--

LOCK TABLES `Shares` WRITE;
/*!40000 ALTER TABLE `Shares` DISABLE KEYS */;
INSERT INTO `Shares` VALUES (1,'TOKIWASOUGO','AAC',2.34125),(2,'KADOYATSUKASA','RMA',2.34125),(3,'HOJOEMU','FBC',45.20000),(4,'HIDENARUTO','YUI',29.79000),(5,'TOUMAKAMIYAMA','GDG',0.45500),(6,'KIRYUSENTO','SDA',1.46000);
/*!40000 ALTER TABLE `Shares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Transactions`
--

DROP TABLE IF EXISTS `Transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Transactions` (
  `TransactionId` bigint NOT NULL,
  `CustomerId` bigint NOT NULL,
  `TransactionType` int NOT NULL,
  `DateEntered` datetime NOT NULL,
  `Amount` decimal(18,5) NOT NULL,
  `ReferenceDetails` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Notes` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `RelatedShareId` bigint DEFAULT NULL,
  `RelatedProductId` bigint NOT NULL,
  PRIMARY KEY (`TransactionId`),
  KEY `FK_Customers_Transactions _idx` (`CustomerId`),
  KEY `FK_Shares_Transactions_idx` (`RelatedShareId`),
  KEY `FK_FinancialProducts_Transactions_idx` (`RelatedProductId`),
  CONSTRAINT `FK_Customers_Transactions ` FOREIGN KEY (`CustomerId`) REFERENCES `Customers` (`CustomerId`),
  CONSTRAINT `FK_FinancialProducts_Transactions` FOREIGN KEY (`RelatedProductId`) REFERENCES `FinancialProducts` (`ProductId`),
  CONSTRAINT `FK_Shares_Transactions` FOREIGN KEY (`RelatedShareId`) REFERENCES `Shares` (`ShareId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Transactions`
--

LOCK TABLES `Transactions` WRITE;
/*!40000 ALTER TABLE `Transactions` DISABLE KEYS */;
INSERT INTO `Transactions` VALUES (1,19233,1,'2020-01-01 00:00:00',10000.00000,'no','No',1,12345),(2,19087,2,'2020-01-01 00:00:00',21000.00000,'no','No',2,12345),(3,19234,2,'2019-05-22 00:00:00',30000.00000,'no','No',1,14328),(4,19156,1,'2018-09-09 00:00:00',24000.00000,'no','No',3,12345),(5,19033,1,'2017-03-05 00:00:00',65000.00000,'no','No',1,84723),(6,19111,1,'2015-09-10 00:00:00',12000.00000,'no','No',2,84723);
/*!40000 ALTER TABLE `Transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TransactionTypes`
--

DROP TABLE IF EXISTS `TransactionTypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TransactionTypes` (
  `TransactionTypeId` int NOT NULL,
  `TransactionDescription` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `CreditType` bit(1) NOT NULL,
  `AffectCashBalance` bit(1) NOT NULL,
  PRIMARY KEY (`TransactionTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TransactionTypes`
--

LOCK TABLES `TransactionTypes` WRITE;
/*!40000 ALTER TABLE `TransactionTypes` DISABLE KEYS */;
INSERT INTO `TransactionTypes` VALUES (1,'Success',_binary '',_binary ''),(2,'Success',_binary '',_binary ''),(3,'Success',_binary '',_binary ''),(4,'Failed',_binary '',_binary ''),(5,'Success',_binary '',_binary '');
/*!40000 ALTER TABLE `TransactionTypes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-18 22:00:32
