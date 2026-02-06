-- MySQL dump 10.13  Distrib 8.4.8, for Win64 (x86_64)
--
-- Host: aukai-prod-v6-23-db.mysql.database.azure.com    Database: skyit_traxx
-- ------------------------------------------------------
-- Server version	8.0.42-azure

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `api_accidentfilemodel`
--

DROP TABLE IF EXISTS `api_accidentfilemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_accidentfilemodel` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `file_type` varchar(150) NOT NULL,
  `file_name` longtext NOT NULL,
  `file_url` longtext NOT NULL,
  `bytes` bigint NOT NULL,
  `file_created` datetime(6) NOT NULL,
  `accident_id` int DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `api_accidentfilemode_accident_id_a356de30_fk_api_accid` (`accident_id`),
  CONSTRAINT `api_accidentfilemode_accident_id_a356de30_fk_api_accid` FOREIGN KEY (`accident_id`) REFERENCES `api_accidentmodel` (`accident_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_accidentfilemodel`
--

LOCK TABLES `api_accidentfilemodel` WRITE;
/*!40000 ALTER TABLE `api_accidentfilemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_accidentfilemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_accidentmodel`
--

DROP TABLE IF EXISTS `api_accidentmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_accidentmodel` (
  `accident_id` int NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(100) NOT NULL,
  `estimated_return_date` datetime(6) DEFAULT NULL,
  `accident_report_completed` tinyint(1) NOT NULL,
  `is_equipment_failure` tinyint(1) NOT NULL,
  `notification_ack` tinyint(1) NOT NULL,
  `evaluation_required` tinyint(1) NOT NULL,
  `is_resolved` tinyint(1) NOT NULL,
  `is_preventable` tinyint(1) NOT NULL,
  `is_operational` tinyint(1) NOT NULL,
  `date_returned_to_service` datetime(6) DEFAULT NULL,
  `accident_summary` longtext,
  `downtime_hours` double NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  `VIN_id` varchar(100) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `disposal_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`accident_id`),
  KEY `api_accidentmodel_VIN_id_3130961a_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_accidentmodel_created_by_id_3c566486_fk_api_detai` (`created_by_id`),
  KEY `api_accidentmodel_disposal_id_a16512ac_fk_api_asset` (`disposal_id`),
  KEY `api_accidentmodel_location_id_1b207e0d_fk_api_locat` (`location_id`),
  KEY `api_accidentmodel_modified_by_id_ef02950f_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_accidentmodel_created_by_id_3c566486_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_accidentmodel_disposal_id_a16512ac_fk_api_asset` FOREIGN KEY (`disposal_id`) REFERENCES `api_assetdisposalmodel` (`id`),
  CONSTRAINT `api_accidentmodel_location_id_1b207e0d_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_accidentmodel_modified_by_id_ef02950f_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_accidentmodel_VIN_id_3130961a_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_accidentmodel`
--

LOCK TABLES `api_accidentmodel` WRITE;
/*!40000 ALTER TABLE `api_accidentmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_accidentmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_accidentmodelhistory`
--

DROP TABLE IF EXISTS `api_accidentmodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_accidentmodelhistory` (
  `accident_history_id` int NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(100) NOT NULL,
  `estimated_return_date` datetime(6) DEFAULT NULL,
  `accident_report_completed` tinyint(1) NOT NULL,
  `is_equipment_failure` tinyint(1) NOT NULL,
  `notification_ack` tinyint(1) NOT NULL,
  `evaluation_required` tinyint(1) NOT NULL,
  `is_resolved` tinyint(1) NOT NULL,
  `is_preventable` tinyint(1) NOT NULL,
  `is_operational` tinyint(1) NOT NULL,
  `date_returned_to_service` datetime(6) DEFAULT NULL,
  `accident_summary` longtext,
  `downtime_hours` double NOT NULL,
  `date` datetime(6) NOT NULL,
  `accident_id` int NOT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`accident_history_id`),
  KEY `api_accidentmodelhis_accident_id_7eec054b_fk_api_accid` (`accident_id`),
  KEY `api_accidentmodelhis_location_id_9d5dc35c_fk_api_locat` (`location_id`),
  KEY `api_accidentmodelhis_modified_by_id_d676ee67_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_accidentmodelhis_accident_id_7eec054b_fk_api_accid` FOREIGN KEY (`accident_id`) REFERENCES `api_accidentmodel` (`accident_id`),
  CONSTRAINT `api_accidentmodelhis_location_id_9d5dc35c_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_accidentmodelhis_modified_by_id_d676ee67_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_accidentmodelhistory`
--

LOCK TABLES `api_accidentmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_accidentmodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_accidentmodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_acquisitioncost`
--

DROP TABLE IF EXISTS `api_acquisitioncost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_acquisitioncost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_cost` double NOT NULL,
  `taxes` double NOT NULL,
  `administrative_cost` double NOT NULL,
  `misc_cost` double NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `VIN_id` varchar(100) DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_acquisitioncost_VIN_id_3526fd6e_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_acquisitioncost_created_by_id_2a71eeed_fk_api_detai` (`created_by_id`),
  KEY `api_acquisitioncost_currency_id_e73277cd_fk_api_currency_id` (`currency_id`),
  KEY `api_acquisitioncost_location_id_5bd5e472_fk_api_locat` (`location_id`),
  KEY `api_acquisitioncost_modified_by_id_1662932d_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_acquisitioncost_created_by_id_2a71eeed_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_acquisitioncost_currency_id_e73277cd_fk_api_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_acquisitioncost_location_id_5bd5e472_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_acquisitioncost_modified_by_id_1662932d_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_acquisitioncost_VIN_id_3526fd6e_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_acquisitioncost`
--

LOCK TABLES `api_acquisitioncost` WRITE;
/*!40000 ALTER TABLE `api_acquisitioncost` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_acquisitioncost` ENABLE KEYS */;
UNLOCK TABLES;
