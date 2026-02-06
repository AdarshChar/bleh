-- MySQL dump 10.13  Distrib 8.4.8, for Win64 (x86_64)
--
-- Host: aukai-prod-v6-23-db.mysql.database.azure.com    Database: skyit_demo_4
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

--
-- Table structure for table `api_acquisitioncostmodelhistory`
--

DROP TABLE IF EXISTS `api_acquisitioncostmodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_acquisitioncostmodelhistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_cost` double NOT NULL,
  `taxes` double NOT NULL,
  `administrative_cost` double NOT NULL,
  `misc_cost` double NOT NULL,
  `date` datetime(6) NOT NULL,
  `VIN_id` varchar(100) DEFAULT NULL,
  `acquisition_cost_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_acquisitioncostm_VIN_id_943b3499_fk_api_asset` (`VIN_id`),
  KEY `api_acquisitioncostm_acquisition_cost_id_7094c72d_fk_api_acqui` (`acquisition_cost_id`),
  KEY `api_acquisitioncostm_currency_id_4f614d77_fk_api_curre` (`currency_id`),
  KEY `api_acquisitioncostm_location_id_fe5ae5a3_fk_api_locat` (`location_id`),
  KEY `api_acquisitioncostm_modified_by_id_ffbff6db_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_acquisitioncostm_acquisition_cost_id_7094c72d_fk_api_acqui` FOREIGN KEY (`acquisition_cost_id`) REFERENCES `api_acquisitioncost` (`id`),
  CONSTRAINT `api_acquisitioncostm_currency_id_4f614d77_fk_api_curre` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_acquisitioncostm_location_id_fe5ae5a3_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_acquisitioncostm_modified_by_id_ffbff6db_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_acquisitioncostm_VIN_id_943b3499_fk_api_asset` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_acquisitioncostmodelhistory`
--

LOCK TABLES `api_acquisitioncostmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_acquisitioncostmodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_acquisitioncostmodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_approval`
--

DROP TABLE IF EXISTS `api_approval`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_approval` (
  `approval_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `deny_reason` longtext NOT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `date_created` date NOT NULL,
  `date_modified` date NOT NULL,
  `VIN_id` varchar(100) NOT NULL,
  `approving_user_id` int DEFAULT NULL,
  `asset_request_id` int DEFAULT NULL,
  `asset_transfer_request_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `maintenance_request_id` int DEFAULT NULL,
  `repair_request_id` int DEFAULT NULL,
  `requesting_user_id` int DEFAULT NULL,
  PRIMARY KEY (`approval_id`),
  KEY `api_approval_VIN_id_867898b0_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_approval_approving_user_id_42cad599_fk_api_detai` (`approving_user_id`),
  KEY `api_approval_asset_request_id_11278853_fk_api_asset` (`asset_request_id`),
  KEY `api_approval_asset_transfer_reque_a51ddf9b_fk_api_asset` (`asset_transfer_request_id`),
  KEY `api_approval_location_id_090f0b07_fk_api_locat` (`location_id`),
  KEY `api_approval_maintenance_request__2f0759c6_fk_api_maint` (`maintenance_request_id`),
  KEY `api_approval_repair_request_id_2651d208_fk_api_repai` (`repair_request_id`),
  KEY `api_approval_requesting_user_id_e6e018a6_fk_api_detai` (`requesting_user_id`),
  CONSTRAINT `api_approval_approving_user_id_42cad599_fk_api_detai` FOREIGN KEY (`approving_user_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_approval_asset_request_id_11278853_fk_api_asset` FOREIGN KEY (`asset_request_id`) REFERENCES `api_assetrequestmodel` (`id`),
  CONSTRAINT `api_approval_asset_transfer_reque_a51ddf9b_fk_api_asset` FOREIGN KEY (`asset_transfer_request_id`) REFERENCES `api_assettransfer` (`asset_transfer_id`),
  CONSTRAINT `api_approval_location_id_090f0b07_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_approval_maintenance_request__2f0759c6_fk_api_maint` FOREIGN KEY (`maintenance_request_id`) REFERENCES `api_maintenancerequestmodel` (`maintenance_id`),
  CONSTRAINT `api_approval_repair_request_id_2651d208_fk_api_repai` FOREIGN KEY (`repair_request_id`) REFERENCES `api_repairsmodel` (`repair_id`),
  CONSTRAINT `api_approval_requesting_user_id_e6e018a6_fk_api_detai` FOREIGN KEY (`requesting_user_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_approval_VIN_id_867898b0_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_approval`
--

LOCK TABLES `api_approval` WRITE;
/*!40000 ALTER TABLE `api_approval` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_approval` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_approvalmodelhistory`
--

DROP TABLE IF EXISTS `api_approvalmodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_approvalmodelhistory` (
  `approval_history_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `deny_reason` longtext NOT NULL,
  `is_approved` tinyint(1) DEFAULT NULL,
  `accident_summary` longtext,
  `date` datetime(6) NOT NULL,
  `approval_id` int NOT NULL,
  `approving_user_id` int DEFAULT NULL,
  `asset_request_id` int DEFAULT NULL,
  `asset_transfer_request_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `maintenance_request_id` int DEFAULT NULL,
  `repair_request_id` int DEFAULT NULL,
  `requesting_user_id` int DEFAULT NULL,
  PRIMARY KEY (`approval_history_id`),
  KEY `api_approvalmodelhis_approval_id_0a7b0f20_fk_api_appro` (`approval_id`),
  KEY `api_approvalmodelhis_approving_user_id_0f09aa8a_fk_api_detai` (`approving_user_id`),
  KEY `api_approvalmodelhis_asset_request_id_95a3e31b_fk_api_asset` (`asset_request_id`),
  KEY `api_approvalmodelhis_asset_transfer_reque_58f1e105_fk_api_asset` (`asset_transfer_request_id`),
  KEY `api_approvalmodelhis_location_id_60640ac2_fk_api_locat` (`location_id`),
  KEY `api_approvalmodelhis_maintenance_request__e206156c_fk_api_maint` (`maintenance_request_id`),
  KEY `api_approvalmodelhis_repair_request_id_6f14411b_fk_api_repai` (`repair_request_id`),
  KEY `api_approvalmodelhis_requesting_user_id_39c5af2f_fk_api_detai` (`requesting_user_id`),
  CONSTRAINT `api_approvalmodelhis_approval_id_0a7b0f20_fk_api_appro` FOREIGN KEY (`approval_id`) REFERENCES `api_approval` (`approval_id`),
  CONSTRAINT `api_approvalmodelhis_approving_user_id_0f09aa8a_fk_api_detai` FOREIGN KEY (`approving_user_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_approvalmodelhis_asset_request_id_95a3e31b_fk_api_asset` FOREIGN KEY (`asset_request_id`) REFERENCES `api_assetrequestmodel` (`id`),
  CONSTRAINT `api_approvalmodelhis_asset_transfer_reque_58f1e105_fk_api_asset` FOREIGN KEY (`asset_transfer_request_id`) REFERENCES `api_assettransfer` (`asset_transfer_id`),
  CONSTRAINT `api_approvalmodelhis_location_id_60640ac2_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_approvalmodelhis_maintenance_request__e206156c_fk_api_maint` FOREIGN KEY (`maintenance_request_id`) REFERENCES `api_maintenancerequestmodel` (`maintenance_id`),
  CONSTRAINT `api_approvalmodelhis_repair_request_id_6f14411b_fk_api_repai` FOREIGN KEY (`repair_request_id`) REFERENCES `api_repairsmodel` (`repair_id`),
  CONSTRAINT `api_approvalmodelhis_requesting_user_id_39c5af2f_fk_api_detai` FOREIGN KEY (`requesting_user_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_approvalmodelhistory`
--

LOCK TABLES `api_approvalmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_approvalmodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_approvalmodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_approvedvendordepartments`
--

DROP TABLE IF EXISTS `api_approvedvendordepartments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_approvedvendordepartments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_approvedvendordepartments`
--

LOCK TABLES `api_approvedvendordepartments` WRITE;
/*!40000 ALTER TABLE `api_approvedvendordepartments` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_approvedvendordepartments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_approvedvendorrequest`
--

DROP TABLE IF EXISTS `api_approvedvendorrequest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_approvedvendorrequest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_department_id` int DEFAULT NULL,
  `vendor_task_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_approvedvendorre_vendor_department_id_ad59b755_fk_api_appro` (`vendor_department_id`),
  KEY `api_approvedvendorre_vendor_task_id_ba536e79_fk_api_appro` (`vendor_task_id`),
  CONSTRAINT `api_approvedvendorre_vendor_department_id_ad59b755_fk_api_appro` FOREIGN KEY (`vendor_department_id`) REFERENCES `api_approvedvendordepartments` (`id`),
  CONSTRAINT `api_approvedvendorre_vendor_task_id_ba536e79_fk_api_appro` FOREIGN KEY (`vendor_task_id`) REFERENCES `api_approvedvendortasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_approvedvendorrequest`
--

LOCK TABLES `api_approvedvendorrequest` WRITE;
/*!40000 ALTER TABLE `api_approvedvendorrequest` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_approvedvendorrequest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_approvedvendorsmodel`
--

DROP TABLE IF EXISTS `api_approvedvendorsmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_approvedvendorsmodel` (
  `vendor_id` int NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(100) NOT NULL,
  `is_vendor_green` tinyint(1) NOT NULL,
  `phone_number` varchar(50) NOT NULL,
  `address` varchar(100) NOT NULL,
  `website` varchar(1000) NOT NULL,
  `primary_email` varchar(254) NOT NULL,
  `vendor_department_id` int DEFAULT NULL,
  `vendor_task_id` int DEFAULT NULL,
  PRIMARY KEY (`vendor_id`),
  KEY `api_approvedvendorsm_vendor_task_id_93aad341_fk_api_appro` (`vendor_task_id`),
  KEY `api_approvedvendorsm_vendor_department_id_c7c8df78_fk_api_appro` (`vendor_department_id`),
  CONSTRAINT `api_approvedvendorsm_vendor_department_id_c7c8df78_fk_api_appro` FOREIGN KEY (`vendor_department_id`) REFERENCES `api_approvedvendordepartments` (`id`),
  CONSTRAINT `api_approvedvendorsm_vendor_task_id_93aad341_fk_api_appro` FOREIGN KEY (`vendor_task_id`) REFERENCES `api_approvedvendortasks` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_approvedvendorsmodel`
--

LOCK TABLES `api_approvedvendorsmodel` WRITE;
/*!40000 ALTER TABLE `api_approvedvendorsmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_approvedvendorsmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_approvedvendortasks`
--

DROP TABLE IF EXISTS `api_approvedvendortasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_approvedvendortasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_approvedvendortasks`
--

LOCK TABLES `api_approvedvendortasks` WRITE;
/*!40000 ALTER TABLE `api_approvedvendortasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_approvedvendortasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetdailycheckscomment`
--

DROP TABLE IF EXISTS `api_assetdailycheckscomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetdailycheckscomment` (
  `daily_check_comment_id` int NOT NULL AUTO_INCREMENT,
  `comment` longtext NOT NULL,
  `check` varchar(50) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `daily_check_id` int DEFAULT NULL,
  PRIMARY KEY (`daily_check_comment_id`),
  KEY `api_assetdailychecks_daily_check_id_14befe1e_fk_api_asset` (`daily_check_id`),
  CONSTRAINT `api_assetdailychecks_daily_check_id_14befe1e_fk_api_asset` FOREIGN KEY (`daily_check_id`) REFERENCES `api_assetdailychecksmodel` (`daily_check_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetdailycheckscomment`
--

LOCK TABLES `api_assetdailycheckscomment` WRITE;
/*!40000 ALTER TABLE `api_assetdailycheckscomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetdailycheckscomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetdailychecksmodel`
--

DROP TABLE IF EXISTS `api_assetdailychecksmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetdailychecksmodel` (
  `daily_check_id` int NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(100) NOT NULL,
  `operable` tinyint(1) NOT NULL,
  `mileage` double DEFAULT NULL,
  `hours` double DEFAULT NULL,
  `is_tagout` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  `tires` tinyint(1) DEFAULT NULL,
  `wheels` tinyint(1) DEFAULT NULL,
  `horn` tinyint(1) DEFAULT NULL,
  `fuel` int DEFAULT NULL,
  `mirrors` tinyint(1) DEFAULT NULL,
  `glass` tinyint(1) DEFAULT NULL,
  `overhead_guard` tinyint(1) DEFAULT NULL,
  `steps` tinyint(1) DEFAULT NULL,
  `forks` tinyint(1) DEFAULT NULL,
  `operator_cab` tinyint(1) DEFAULT NULL,
  `cosmetic_damage` tinyint(1) DEFAULT NULL,
  `brakes` tinyint(1) DEFAULT NULL,
  `steering` tinyint(1) DEFAULT NULL,
  `attachments` tinyint(1) DEFAULT NULL,
  `mud_flaps` tinyint(1) DEFAULT NULL,
  `electrical_connectors` tinyint(1) DEFAULT NULL,
  `air_pressure` tinyint(1) DEFAULT NULL,
  `boom_extensions` tinyint(1) DEFAULT NULL,
  `spreader_functions` tinyint(1) DEFAULT NULL,
  `headlights` tinyint(1) DEFAULT NULL,
  `backup_lights` tinyint(1) DEFAULT NULL,
  `trailer_light_cord` tinyint(1) DEFAULT NULL,
  `oil` tinyint(1) DEFAULT NULL,
  `transmission_fluid` tinyint(1) DEFAULT NULL,
  `steering_fluid` tinyint(1) DEFAULT NULL,
  `hydraulic_fluid` tinyint(1) DEFAULT NULL,
  `brake_fluid` tinyint(1) DEFAULT NULL,
  `fire_extinguisher` tinyint(1) DEFAULT NULL,
  `hydraulic_hoses` tinyint(1) DEFAULT NULL,
  `trailer_air_lines` tinyint(1) DEFAULT NULL,
  `other_leaks` tinyint(1) DEFAULT NULL,
  `VIN_id` varchar(100) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`daily_check_id`),
  KEY `api_assetdailychecksmodel_VIN_id_d3577052_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_assetdailychecks_created_by_id_029fc175_fk_api_detai` (`created_by_id`),
  KEY `api_assetdailychecks_location_id_f76e3d5a_fk_api_locat` (`location_id`),
  KEY `api_assetdailychecks_modified_by_id_4fbf1c05_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_assetdailychecks_created_by_id_029fc175_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetdailychecks_location_id_f76e3d5a_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assetdailychecks_modified_by_id_4fbf1c05_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetdailychecksmodel_VIN_id_d3577052_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetdailychecksmodel`
--

LOCK TABLES `api_assetdailychecksmodel` WRITE;
/*!40000 ALTER TABLE `api_assetdailychecksmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetdailychecksmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetdailychecksmodelhistory`
--

DROP TABLE IF EXISTS `api_assetdailychecksmodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetdailychecksmodelhistory` (
  `daily_check_history_id` int NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(100) NOT NULL,
  `operable` tinyint(1) NOT NULL,
  `mileage` double DEFAULT NULL,
  `hours` double DEFAULT NULL,
  `is_tagout` tinyint(1) NOT NULL,
  `date` datetime(6) NOT NULL,
  `tires` tinyint(1) DEFAULT NULL,
  `wheels` tinyint(1) DEFAULT NULL,
  `horn` tinyint(1) DEFAULT NULL,
  `fuel` int DEFAULT NULL,
  `mirrors` tinyint(1) DEFAULT NULL,
  `glass` tinyint(1) DEFAULT NULL,
  `overhead_guard` tinyint(1) DEFAULT NULL,
  `steps` tinyint(1) DEFAULT NULL,
  `forks` tinyint(1) DEFAULT NULL,
  `operator_cab` tinyint(1) DEFAULT NULL,
  `cosmetic_damage` tinyint(1) DEFAULT NULL,
  `brakes` tinyint(1) DEFAULT NULL,
  `steering` tinyint(1) DEFAULT NULL,
  `attachments` tinyint(1) DEFAULT NULL,
  `mud_flaps` tinyint(1) DEFAULT NULL,
  `electrical_connectors` tinyint(1) DEFAULT NULL,
  `air_pressure` tinyint(1) DEFAULT NULL,
  `boom_extensions` tinyint(1) DEFAULT NULL,
  `spreader_functions` tinyint(1) DEFAULT NULL,
  `headlights` tinyint(1) DEFAULT NULL,
  `backup_lights` tinyint(1) DEFAULT NULL,
  `trailer_light_cord` tinyint(1) DEFAULT NULL,
  `oil` tinyint(1) DEFAULT NULL,
  `transmission_fluid` tinyint(1) DEFAULT NULL,
  `steering_fluid` tinyint(1) DEFAULT NULL,
  `hydraulic_fluid` tinyint(1) DEFAULT NULL,
  `brake_fluid` tinyint(1) DEFAULT NULL,
  `fire_extinguisher` tinyint(1) DEFAULT NULL,
  `hydraulic_hoses` tinyint(1) DEFAULT NULL,
  `trailer_air_lines` tinyint(1) DEFAULT NULL,
  `other_leaks` tinyint(1) DEFAULT NULL,
  `daily_check_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`daily_check_history_id`),
  KEY `api_assetdailychecks_daily_check_id_668316ed_fk_api_asset` (`daily_check_id`),
  KEY `api_assetdailychecks_location_id_21106c94_fk_api_locat` (`location_id`),
  KEY `api_assetdailychecks_modified_by_id_107f412c_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_assetdailychecks_daily_check_id_668316ed_fk_api_asset` FOREIGN KEY (`daily_check_id`) REFERENCES `api_assetdailychecksmodel` (`daily_check_id`),
  CONSTRAINT `api_assetdailychecks_location_id_21106c94_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assetdailychecks_modified_by_id_107f412c_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetdailychecksmodelhistory`
--

LOCK TABLES `api_assetdailychecksmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_assetdailychecksmodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetdailychecksmodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetdisposalfile`
--

DROP TABLE IF EXISTS `api_assetdisposalfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetdisposalfile` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `file_type` varchar(150) NOT NULL,
  `file_purpose` varchar(50) NOT NULL,
  `file_name` longtext NOT NULL,
  `file_url` longtext NOT NULL,
  `bytes` bigint NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `disposal_id` int DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `api_assetdisposalfil_created_by_id_16c71e95_fk_api_detai` (`created_by_id`),
  KEY `api_assetdisposalfil_disposal_id_21e54a10_fk_api_asset` (`disposal_id`),
  CONSTRAINT `api_assetdisposalfil_created_by_id_16c71e95_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetdisposalfil_disposal_id_21e54a10_fk_api_asset` FOREIGN KEY (`disposal_id`) REFERENCES `api_assetdisposalmodel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetdisposalfile`
--

LOCK TABLES `api_assetdisposalfile` WRITE;
/*!40000 ALTER TABLE `api_assetdisposalfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetdisposalfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetdisposalmodel`
--

DROP TABLE IF EXISTS `api_assetdisposalmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetdisposalmodel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(100) NOT NULL,
  `disposal_type` varchar(50) NOT NULL,
  `estimated_pickup_date` datetime(6) DEFAULT NULL,
  `vendor_contacted_date` datetime(6) DEFAULT NULL,
  `accounting_contacted_date` datetime(6) DEFAULT NULL,
  `available_pickup_date` datetime(6) DEFAULT NULL,
  `interior_condition` varchar(50) NOT NULL,
  `interior_condition_details` longtext NOT NULL,
  `exterior_condition` varchar(50) NOT NULL,
  `exterior_condition_details` longtext NOT NULL,
  `disposal_reason` varchar(50) NOT NULL,
  `replacement_reason` varchar(50) NOT NULL,
  `is_stripped` tinyint(1) NOT NULL,
  `refurbished` tinyint(1) NOT NULL,
  `primary_vendor_email` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  `VIN_id` varchar(100) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_assetdisposalmodel_VIN_id_243b83ce_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_assetdisposalmod_created_by_id_64abcd41_fk_api_detai` (`created_by_id`),
  KEY `api_assetdisposalmod_location_id_b2ebc3c6_fk_api_locat` (`location_id`),
  KEY `api_assetdisposalmod_modified_by_id_8e1214f6_fk_api_detai` (`modified_by_id`),
  KEY `api_assetdisposalmod_vendor_id_ceb0fad4_fk_api_appro` (`vendor_id`),
  CONSTRAINT `api_assetdisposalmod_created_by_id_64abcd41_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetdisposalmod_location_id_b2ebc3c6_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assetdisposalmod_modified_by_id_8e1214f6_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetdisposalmod_vendor_id_ceb0fad4_fk_api_appro` FOREIGN KEY (`vendor_id`) REFERENCES `api_approvedvendorsmodel` (`vendor_id`),
  CONSTRAINT `api_assetdisposalmodel_VIN_id_243b83ce_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetdisposalmodel`
--

LOCK TABLES `api_assetdisposalmodel` WRITE;
/*!40000 ALTER TABLE `api_assetdisposalmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetdisposalmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetdisposalmodelhistory`
--

DROP TABLE IF EXISTS `api_assetdisposalmodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetdisposalmodelhistory` (
  `disposal_history_id` int NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `disposal_type` varchar(50) NOT NULL,
  `estimated_pickup_date` datetime(6) DEFAULT NULL,
  `vendor_contacted_date` datetime(6) DEFAULT NULL,
  `accounting_contacted_date` datetime(6) DEFAULT NULL,
  `available_pickup_date` datetime(6) DEFAULT NULL,
  `date` datetime(6) NOT NULL,
  `disposal_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`disposal_history_id`),
  KEY `api_assetdisposalmod_disposal_id_eab85920_fk_api_asset` (`disposal_id`),
  KEY `api_assetdisposalmod_location_id_b9df111d_fk_api_locat` (`location_id`),
  KEY `api_assetdisposalmod_modified_by_id_77d46eb8_fk_api_detai` (`modified_by_id`),
  KEY `api_assetdisposalmod_vendor_id_10c94a92_fk_api_appro` (`vendor_id`),
  CONSTRAINT `api_assetdisposalmod_disposal_id_eab85920_fk_api_asset` FOREIGN KEY (`disposal_id`) REFERENCES `api_assetdisposalmodel` (`id`),
  CONSTRAINT `api_assetdisposalmod_location_id_b9df111d_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assetdisposalmod_modified_by_id_77d46eb8_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetdisposalmod_vendor_id_10c94a92_fk_api_appro` FOREIGN KEY (`vendor_id`) REFERENCES `api_approvedvendorsmodel` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetdisposalmodelhistory`
--

LOCK TABLES `api_assetdisposalmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_assetdisposalmodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetdisposalmodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetfile`
--

DROP TABLE IF EXISTS `api_assetfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetfile` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `file_type` varchar(150) NOT NULL,
  `file_purpose` varchar(50) NOT NULL,
  `file_name` longtext NOT NULL,
  `file_url` longtext NOT NULL,
  `bytes` bigint NOT NULL,
  `date_created` date NOT NULL,
  `date_modified` date NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `VIN_id` varchar(100) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `api_assetfile_VIN_id_686ffcd4_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_assetfile_created_by_id_db646b2a_fk_api_detai` (`created_by_id`),
  KEY `api_assetfile_modified_by_id_8c9e37fc_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_assetfile_created_by_id_db646b2a_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetfile_modified_by_id_8c9e37fc_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetfile_VIN_id_686ffcd4_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetfile`
--

LOCK TABLES `api_assetfile` WRITE;
/*!40000 ALTER TABLE `api_assetfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetissuecategory`
--

DROP TABLE IF EXISTS `api_assetissuecategory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetissuecategory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_assetissuecatego_created_by_id_ba655274_fk_api_detai` (`created_by_id`),
  KEY `api_assetissuecatego_modified_by_id_c453ea4c_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_assetissuecatego_created_by_id_ba655274_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetissuecatego_modified_by_id_c453ea4c_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetissuecategory`
--

LOCK TABLES `api_assetissuecategory` WRITE;
/*!40000 ALTER TABLE `api_assetissuecategory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetissuecategory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetissuefilemodel`
--

DROP TABLE IF EXISTS `api_assetissuefilemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetissuefilemodel` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `file_type` varchar(150) NOT NULL,
  `file_name` longtext NOT NULL,
  `file_url` longtext NOT NULL,
  `bytes` bigint NOT NULL,
  `file_created` datetime(6) NOT NULL,
  `issue_id` int DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `api_assetissuefilemo_issue_id_301f3ca4_fk_api_asset` (`issue_id`),
  CONSTRAINT `api_assetissuefilemo_issue_id_301f3ca4_fk_api_asset` FOREIGN KEY (`issue_id`) REFERENCES `api_assetissuemodel` (`issue_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetissuefilemodel`
--

LOCK TABLES `api_assetissuefilemodel` WRITE;
/*!40000 ALTER TABLE `api_assetissuefilemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetissuefilemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetissuemodel`
--

DROP TABLE IF EXISTS `api_assetissuemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetissuemodel` (
  `issue_id` int NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(100) NOT NULL,
  `issue_details` longtext,
  `issue_title` varchar(150) NOT NULL,
  `issue_type` varchar(50) NOT NULL,
  `issue_result` varchar(100) NOT NULL,
  `is_resolved` tinyint(1) NOT NULL,
  `issue_created` datetime(6) NOT NULL,
  `issue_updated` datetime(6) NOT NULL,
  `VIN_id` varchar(100) NOT NULL,
  `accident_id_id` int DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `repair_id_id` int DEFAULT NULL,
  PRIMARY KEY (`issue_id`),
  KEY `api_assetissuemodel_VIN_id_08375bbc_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_assetissuemodel_accident_id_id_22653a0e_fk_api_accid` (`accident_id_id`),
  KEY `api_assetissuemodel_category_id_cd4c02f3_fk_api_asset` (`category_id`),
  KEY `api_assetissuemodel_created_by_id_0f5c0bd9_fk_api_detai` (`created_by_id`),
  KEY `api_assetissuemodel_location_id_af14c6da_fk_api_locat` (`location_id`),
  KEY `api_assetissuemodel_modified_by_id_9575934e_fk_api_detai` (`modified_by_id`),
  KEY `api_assetissuemodel_repair_id_id_4ca7bc53_fk_api_repai` (`repair_id_id`),
  CONSTRAINT `api_assetissuemodel_accident_id_id_22653a0e_fk_api_accid` FOREIGN KEY (`accident_id_id`) REFERENCES `api_accidentmodel` (`accident_id`),
  CONSTRAINT `api_assetissuemodel_category_id_cd4c02f3_fk_api_asset` FOREIGN KEY (`category_id`) REFERENCES `api_assetissuecategory` (`id`),
  CONSTRAINT `api_assetissuemodel_created_by_id_0f5c0bd9_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetissuemodel_location_id_af14c6da_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assetissuemodel_modified_by_id_9575934e_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetissuemodel_repair_id_id_4ca7bc53_fk_api_repai` FOREIGN KEY (`repair_id_id`) REFERENCES `api_repairsmodel` (`repair_id`),
  CONSTRAINT `api_assetissuemodel_VIN_id_08375bbc_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetissuemodel`
--

LOCK TABLES `api_assetissuemodel` WRITE;
/*!40000 ALTER TABLE `api_assetissuemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetissuemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetissuemodelhistory`
--

DROP TABLE IF EXISTS `api_assetissuemodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetissuemodelhistory` (
  `issue_history_id` int NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(100) NOT NULL,
  `issue_details` longtext,
  `issue_title` varchar(150) NOT NULL,
  `issue_type` varchar(50) NOT NULL,
  `issue_result` varchar(100) NOT NULL,
  `is_resolved` tinyint(1) NOT NULL,
  `date` datetime(6) NOT NULL,
  `accident_id` int DEFAULT NULL,
  `issue_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `repair_id` int DEFAULT NULL,
  PRIMARY KEY (`issue_history_id`),
  KEY `api_assetissuemodelh_accident_id_8bf9790b_fk_api_accid` (`accident_id`),
  KEY `api_assetissuemodelh_issue_id_405009a0_fk_api_asset` (`issue_id`),
  KEY `api_assetissuemodelh_location_id_d302e45a_fk_api_locat` (`location_id`),
  KEY `api_assetissuemodelh_modified_by_id_4ccfcbc4_fk_api_detai` (`modified_by_id`),
  KEY `api_assetissuemodelh_repair_id_177618a0_fk_api_repai` (`repair_id`),
  CONSTRAINT `api_assetissuemodelh_accident_id_8bf9790b_fk_api_accid` FOREIGN KEY (`accident_id`) REFERENCES `api_accidentmodel` (`accident_id`),
  CONSTRAINT `api_assetissuemodelh_issue_id_405009a0_fk_api_asset` FOREIGN KEY (`issue_id`) REFERENCES `api_assetissuemodel` (`issue_id`),
  CONSTRAINT `api_assetissuemodelh_location_id_d302e45a_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assetissuemodelh_modified_by_id_4ccfcbc4_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetissuemodelh_repair_id_177618a0_fk_api_repai` FOREIGN KEY (`repair_id`) REFERENCES `api_repairsmodel` (`repair_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetissuemodelhistory`
--

LOCK TABLES `api_assetissuemodelhistory` WRITE;
/*!40000 ALTER TABLE `api_assetissuemodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetissuemodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetlog`
--

DROP TABLE IF EXISTS `api_assetlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetlog` (
  `asset_log_id` int NOT NULL AUTO_INCREMENT,
  `log_type` varchar(50) NOT NULL,
  `event_type` varchar(50) DEFAULT NULL,
  `event_id` varchar(100) DEFAULT NULL,
  `content` longtext NOT NULL,
  `asset_log_created` datetime(6) NOT NULL,
  `asset_log_updated` datetime(6) NOT NULL,
  `VIN_id` varchar(100) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`asset_log_id`),
  KEY `api_assetlog_VIN_id_e1fe8a29_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_assetlog_created_by_id_ca0ba384_fk_api_detai` (`created_by_id`),
  KEY `api_assetlog_location_id_d02de46b_fk_api_locat` (`location_id`),
  KEY `api_assetlog_modified_by_id_cf6e288f_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_assetlog_created_by_id_ca0ba384_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetlog_location_id_d02de46b_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assetlog_modified_by_id_cf6e288f_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetlog_VIN_id_e1fe8a29_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetlog`
--

LOCK TABLES `api_assetlog` WRITE;
/*!40000 ALTER TABLE `api_assetlog` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetmanufacturermodel`
--

DROP TABLE IF EXISTS `api_assetmanufacturermodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetmanufacturermodel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_assetmanufacture_created_by_id_4003f7de_fk_api_detai` (`created_by_id`),
  KEY `api_assetmanufacture_modified_by_id_752c0d40_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_assetmanufacture_created_by_id_4003f7de_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetmanufacture_modified_by_id_752c0d40_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetmanufacturermodel`
--

LOCK TABLES `api_assetmanufacturermodel` WRITE;
/*!40000 ALTER TABLE `api_assetmanufacturermodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetmanufacturermodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetmanufacturermodel_asset_type`
--

DROP TABLE IF EXISTS `api_assetmanufacturermodel_asset_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetmanufacturermodel_asset_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `assetmanufacturermodel_id` int NOT NULL,
  `assettypemodel_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_assetmanufacturermod_assetmanufacturermodel_i_065ca3a4_uniq` (`assetmanufacturermodel_id`,`assettypemodel_id`),
  KEY `api_assetmanufacture_assettypemodel_id_913e74b9_fk_api_asset` (`assettypemodel_id`),
  CONSTRAINT `api_assetmanufacture_assetmanufacturermod_c02f3a63_fk_api_asset` FOREIGN KEY (`assetmanufacturermodel_id`) REFERENCES `api_assetmanufacturermodel` (`id`),
  CONSTRAINT `api_assetmanufacture_assettypemodel_id_913e74b9_fk_api_asset` FOREIGN KEY (`assettypemodel_id`) REFERENCES `api_assettypemodel` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetmanufacturermodel_asset_type`
--

LOCK TABLES `api_assetmanufacturermodel_asset_type` WRITE;
/*!40000 ALTER TABLE `api_assetmanufacturermodel_asset_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetmanufacturermodel_asset_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetmodel`
--

DROP TABLE IF EXISTS `api_assetmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetmodel` (
  `VIN` varchar(100) NOT NULL,
  `jde_department` varchar(100) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `aircraft_compatability` varchar(100) DEFAULT NULL,
  `unit_number` varchar(100) DEFAULT NULL,
  `license_plate` varchar(100) DEFAULT NULL,
  `date_of_manufacture` date DEFAULT NULL,
  `fire_extinguisher_quantity` varchar(100) DEFAULT NULL,
  `fire_extinguisher_inspection_date` date DEFAULT NULL,
  `path` varchar(300) DEFAULT NULL,
  `last_process` varchar(50) NOT NULL,
  `hours_or_mileage` varchar(50) NOT NULL,
  `mileage` double NOT NULL,
  `hours` double NOT NULL,
  `mileage_unit` varchar(50) DEFAULT NULL,
  `date_in_service` date DEFAULT NULL,
  `total_cost` double NOT NULL,
  `daily_average_hours` double NOT NULL,
  `daily_average_mileage` double NOT NULL,
  `replacement_hours` double DEFAULT NULL,
  `replacement_mileage` double DEFAULT NULL,
  `insurance_renewal_date` date DEFAULT NULL,
  `registration_renewal_date` date DEFAULT NULL,
  `load_capacity` double DEFAULT NULL,
  `load_capacity_unit` varchar(50) DEFAULT NULL,
  `engine` varchar(50) DEFAULT NULL,
  `colour` varchar(50) NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `fuel_tank_capacity` double DEFAULT NULL,
  `fuel_tank_capacity_unit` varchar(50) DEFAULT NULL,
  `is_rental` tinyint(1) DEFAULT NULL,
  `monthly_subscription_cost` double DEFAULT NULL,
  `class_code` varchar(50) DEFAULT NULL,
  `asset_description` longtext,
  `custom_fields` longtext,
  `overdue_date_variance` int NOT NULL,
  `due_soon_date_variance` int NOT NULL,
  `company_id` char(32) DEFAULT NULL,
  `cost_centre_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `current_location_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `equipment_type_id` int DEFAULT NULL,
  `fuel_id` int DEFAULT NULL,
  `job_specification_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `original_location_id` int DEFAULT NULL,
  `parent_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`VIN`),
  KEY `api_assetmodel_company_id_f122d18f_fk_api_company_company_id` (`company_id`),
  KEY `api_assetmodel_cost_centre_id_a29a81e9_fk_api_costc` (`cost_centre_id`),
  KEY `api_assetmodel_created_by_id_d48a4bf8_fk_api_detai` (`created_by_id`),
  KEY `api_assetmodel_currency_id_fa8254f2_fk_api_currency_id` (`currency_id`),
  KEY `api_assetmodel_current_location_id_f50c42e2_fk_api_locat` (`current_location_id`),
  KEY `api_assetmodel_department_id_95103181_fk_api_busin` (`department_id`),
  KEY `api_assetmodel_equipment_type_id_08bc551d_fk_api_equip` (`equipment_type_id`),
  KEY `api_assetmodel_fuel_id_90e7cb1a_fk_api_fueltype_id` (`fuel_id`),
  KEY `api_assetmodel_job_specification_id_b5467ffd_fk_api_jobsp` (`job_specification_id`),
  KEY `api_assetmodel_modified_by_id_6826ae09_fk_api_detai` (`modified_by_id`),
  KEY `api_assetmodel_original_location_id_9d64c4f1_fk_api_locat` (`original_location_id`),
  KEY `api_assetmodel_parent_id_9e5f5e9c_fk_api_assetmodel_VIN` (`parent_id`),
  CONSTRAINT `api_assetmodel_company_id_f122d18f_fk_api_company_company_id` FOREIGN KEY (`company_id`) REFERENCES `api_company` (`company_id`),
  CONSTRAINT `api_assetmodel_cost_centre_id_a29a81e9_fk_api_costc` FOREIGN KEY (`cost_centre_id`) REFERENCES `api_costcentremodel` (`cost_centre_id`),
  CONSTRAINT `api_assetmodel_created_by_id_d48a4bf8_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetmodel_currency_id_fa8254f2_fk_api_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_assetmodel_current_location_id_f50c42e2_fk_api_locat` FOREIGN KEY (`current_location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assetmodel_department_id_95103181_fk_api_busin` FOREIGN KEY (`department_id`) REFERENCES `api_businessunitmodel` (`business_unit_id`),
  CONSTRAINT `api_assetmodel_equipment_type_id_08bc551d_fk_api_equip` FOREIGN KEY (`equipment_type_id`) REFERENCES `api_equipmenttypemodel` (`equipment_type_id`),
  CONSTRAINT `api_assetmodel_fuel_id_90e7cb1a_fk_api_fueltype_id` FOREIGN KEY (`fuel_id`) REFERENCES `api_fueltype` (`id`),
  CONSTRAINT `api_assetmodel_job_specification_id_b5467ffd_fk_api_jobsp` FOREIGN KEY (`job_specification_id`) REFERENCES `api_jobspecification` (`job_specification_id`),
  CONSTRAINT `api_assetmodel_modified_by_id_6826ae09_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetmodel_original_location_id_9d64c4f1_fk_api_locat` FOREIGN KEY (`original_location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assetmodel_parent_id_9e5f5e9c_fk_api_assetmodel_VIN` FOREIGN KEY (`parent_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetmodel`
--

LOCK TABLES `api_assetmodel` WRITE;
/*!40000 ALTER TABLE `api_assetmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetmodelhistory`
--

DROP TABLE IF EXISTS `api_assetmodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetmodelhistory` (
  `asset_history_id` int NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `jde_department` varchar(100) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `unit_number` varchar(100) DEFAULT NULL,
  `license_plate` varchar(100) DEFAULT NULL,
  `fire_extinguisher_quantity` varchar(100) DEFAULT NULL,
  `fire_extinguisher_inspection_date` varchar(100) DEFAULT NULL,
  `path` varchar(300) DEFAULT NULL,
  `last_process` varchar(50) NOT NULL,
  `hours_or_mileage` varchar(50) NOT NULL,
  `mileage` double NOT NULL,
  `hours` double NOT NULL,
  `mileage_unit` varchar(50) DEFAULT NULL,
  `total_cost` double NOT NULL,
  `daily_average_hours` double NOT NULL,
  `daily_average_mileage` double NOT NULL,
  `replacement_hours` double DEFAULT NULL,
  `replacement_mileage` double DEFAULT NULL,
  `load_capacity` double DEFAULT NULL,
  `load_capacity_unit` varchar(50) DEFAULT NULL,
  `engine` varchar(50) DEFAULT NULL,
  `fuel_tank_capacity` double DEFAULT NULL,
  `fuel_tank_capacity_unit` varchar(50) DEFAULT NULL,
  `is_rental` tinyint(1) DEFAULT NULL,
  `monthly_subscription_cost` double DEFAULT NULL,
  `class_code` varchar(50) DEFAULT NULL,
  `asset_description` longtext,
  `custom_fields` longtext,
  `overdue_date_variance` int NOT NULL,
  `due_soon_date_variance` int NOT NULL,
  `VIN_id` varchar(100) DEFAULT NULL,
  `company_id` char(32) DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `current_location_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  `equipment_type_id` int DEFAULT NULL,
  `fuel_id` int DEFAULT NULL,
  `job_specification_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `original_location_id` int DEFAULT NULL,
  `parent_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`asset_history_id`),
  KEY `api_assetmodelhistory_VIN_id_3382cd23_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_assetmodelhistor_company_id_f7bb1171_fk_api_compa` (`company_id`),
  KEY `api_assetmodelhistory_currency_id_ab3b9b7a_fk_api_currency_id` (`currency_id`),
  KEY `api_assetmodelhistor_current_location_id_467d3a2f_fk_api_locat` (`current_location_id`),
  KEY `api_assetmodelhistor_department_id_8fb917a8_fk_api_busin` (`department_id`),
  KEY `api_assetmodelhistor_equipment_type_id_4b88b5ce_fk_api_equip` (`equipment_type_id`),
  KEY `api_assetmodelhistory_fuel_id_73ea8d75_fk_api_fueltype_id` (`fuel_id`),
  KEY `api_assetmodelhistor_job_specification_id_78ef1952_fk_api_jobsp` (`job_specification_id`),
  KEY `api_assetmodelhistor_modified_by_id_77a2bcc7_fk_api_detai` (`modified_by_id`),
  KEY `api_assetmodelhistor_original_location_id_6c04f79b_fk_api_locat` (`original_location_id`),
  KEY `api_assetmodelhistory_parent_id_1c81d2a0_fk_api_assetmodel_VIN` (`parent_id`),
  CONSTRAINT `api_assetmodelhistor_company_id_f7bb1171_fk_api_compa` FOREIGN KEY (`company_id`) REFERENCES `api_company` (`company_id`),
  CONSTRAINT `api_assetmodelhistor_current_location_id_467d3a2f_fk_api_locat` FOREIGN KEY (`current_location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assetmodelhistor_department_id_8fb917a8_fk_api_busin` FOREIGN KEY (`department_id`) REFERENCES `api_businessunitmodel` (`business_unit_id`),
  CONSTRAINT `api_assetmodelhistor_equipment_type_id_4b88b5ce_fk_api_equip` FOREIGN KEY (`equipment_type_id`) REFERENCES `api_equipmenttypemodel` (`equipment_type_id`),
  CONSTRAINT `api_assetmodelhistor_job_specification_id_78ef1952_fk_api_jobsp` FOREIGN KEY (`job_specification_id`) REFERENCES `api_jobspecification` (`job_specification_id`),
  CONSTRAINT `api_assetmodelhistor_modified_by_id_77a2bcc7_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetmodelhistor_original_location_id_6c04f79b_fk_api_locat` FOREIGN KEY (`original_location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assetmodelhistory_currency_id_ab3b9b7a_fk_api_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_assetmodelhistory_fuel_id_73ea8d75_fk_api_fueltype_id` FOREIGN KEY (`fuel_id`) REFERENCES `api_fueltype` (`id`),
  CONSTRAINT `api_assetmodelhistory_parent_id_1c81d2a0_fk_api_assetmodel_VIN` FOREIGN KEY (`parent_id`) REFERENCES `api_assetmodel` (`VIN`),
  CONSTRAINT `api_assetmodelhistory_VIN_id_3382cd23_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetmodelhistory`
--

LOCK TABLES `api_assetmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_assetmodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetmodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetrequestfile`
--

DROP TABLE IF EXISTS `api_assetrequestfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetrequestfile` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `file_type` varchar(150) NOT NULL,
  `file_purpose` varchar(50) NOT NULL,
  `file_name` longtext NOT NULL,
  `file_url` longtext NOT NULL,
  `bytes` bigint NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `asset_request_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `api_assetrequestfile_asset_request_id_c29ec116_fk_api_asset` (`asset_request_id`),
  KEY `api_assetrequestfile_created_by_id_83520cc2_fk_api_detai` (`created_by_id`),
  KEY `api_assetrequestfile_vendor_id_725b6af9_fk_api_appro` (`vendor_id`),
  CONSTRAINT `api_assetrequestfile_asset_request_id_c29ec116_fk_api_asset` FOREIGN KEY (`asset_request_id`) REFERENCES `api_assetrequestmodel` (`id`),
  CONSTRAINT `api_assetrequestfile_created_by_id_83520cc2_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetrequestfile_vendor_id_725b6af9_fk_api_appro` FOREIGN KEY (`vendor_id`) REFERENCES `api_approvedvendorsmodel` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetrequestfile`
--

LOCK TABLES `api_assetrequestfile` WRITE;
/*!40000 ALTER TABLE `api_assetrequestfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetrequestfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetrequestjustificationmodel`
--

DROP TABLE IF EXISTS `api_assetrequestjustificationmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetrequestjustificationmodel` (
  `justification_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`justification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetrequestjustificationmodel`
--

LOCK TABLES `api_assetrequestjustificationmodel` WRITE;
/*!40000 ALTER TABLE `api_assetrequestjustificationmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetrequestjustificationmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetrequestmodel`
--

DROP TABLE IF EXISTS `api_assetrequestmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetrequestmodel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(100) NOT NULL,
  `date_required` datetime(6) NOT NULL,
  `estimated_delivery_date` datetime(6) DEFAULT NULL,
  `nonstandard_description` longtext,
  `vendor_email` varchar(100) NOT NULL,
  `status` varchar(50) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `quantity` int NOT NULL,
  `VIN_id` varchar(100) DEFAULT NULL,
  `business_unit_id` int NOT NULL,
  `cost_centre_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `disposal_id` int DEFAULT NULL,
  `equipment_id` int NOT NULL,
  `justification_id` int NOT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_assetrequestmode_business_unit_id_1a6162e8_fk_api_busin` (`business_unit_id`),
  KEY `api_assetrequestmode_cost_centre_id_77d6521a_fk_api_costc` (`cost_centre_id`),
  KEY `api_assetrequestmode_created_by_id_d8e64481_fk_api_detai` (`created_by_id`),
  KEY `api_assetrequestmode_disposal_id_89a7a0e3_fk_api_asset` (`disposal_id`),
  KEY `api_assetrequestmode_equipment_id_ace308f7_fk_api_equip` (`equipment_id`),
  KEY `api_assetrequestmode_justification_id_a448f514_fk_api_asset` (`justification_id`),
  KEY `api_assetrequestmode_location_id_ed98707a_fk_api_locat` (`location_id`),
  KEY `api_assetrequestmode_modified_by_id_7f4fd728_fk_api_detai` (`modified_by_id`),
  KEY `api_assetrequestmode_vendor_id_6bd6d19d_fk_api_appro` (`vendor_id`),
  KEY `api_assetrequestmodel_VIN_id_a420f925_fk_api_assetmodel_VIN` (`VIN_id`),
  CONSTRAINT `api_assetrequestmode_business_unit_id_1a6162e8_fk_api_busin` FOREIGN KEY (`business_unit_id`) REFERENCES `api_businessunitmodel` (`business_unit_id`),
  CONSTRAINT `api_assetrequestmode_cost_centre_id_77d6521a_fk_api_costc` FOREIGN KEY (`cost_centre_id`) REFERENCES `api_costcentremodel` (`cost_centre_id`),
  CONSTRAINT `api_assetrequestmode_created_by_id_d8e64481_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetrequestmode_disposal_id_89a7a0e3_fk_api_asset` FOREIGN KEY (`disposal_id`) REFERENCES `api_assetdisposalmodel` (`id`),
  CONSTRAINT `api_assetrequestmode_equipment_id_ace308f7_fk_api_equip` FOREIGN KEY (`equipment_id`) REFERENCES `api_equipmenttypemodel` (`equipment_type_id`),
  CONSTRAINT `api_assetrequestmode_justification_id_a448f514_fk_api_asset` FOREIGN KEY (`justification_id`) REFERENCES `api_assetrequestjustificationmodel` (`justification_id`),
  CONSTRAINT `api_assetrequestmode_location_id_ed98707a_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assetrequestmode_modified_by_id_7f4fd728_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetrequestmode_vendor_id_6bd6d19d_fk_api_appro` FOREIGN KEY (`vendor_id`) REFERENCES `api_approvedvendorsmodel` (`vendor_id`),
  CONSTRAINT `api_assetrequestmodel_VIN_id_a420f925_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetrequestmodel`
--

LOCK TABLES `api_assetrequestmodel` WRITE;
/*!40000 ALTER TABLE `api_assetrequestmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetrequestmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assetrequestmodelhistory`
--

DROP TABLE IF EXISTS `api_assetrequestmodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assetrequestmodelhistory` (
  `asset_request_history_id` int NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(100) NOT NULL,
  `date_required` datetime(6) NOT NULL,
  `estimated_delivery_date` datetime(6) DEFAULT NULL,
  `nonstandard_description` longtext,
  `vendor_email` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `date` datetime(6) NOT NULL,
  `quantity` int NOT NULL,
  `VIN_id` varchar(100) DEFAULT NULL,
  `asset_request_id` int NOT NULL,
  `business_unit_id` int DEFAULT NULL,
  `equipment_id` int DEFAULT NULL,
  `justification_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`asset_request_history_id`),
  KEY `api_assetrequestmode_VIN_id_48d61bfd_fk_api_asset` (`VIN_id`),
  KEY `api_assetrequestmode_asset_request_id_eeb3776d_fk_api_asset` (`asset_request_id`),
  KEY `api_assetrequestmode_business_unit_id_5b84c75a_fk_api_busin` (`business_unit_id`),
  KEY `api_assetrequestmode_equipment_id_4f536288_fk_api_equip` (`equipment_id`),
  KEY `api_assetrequestmode_justification_id_cf624510_fk_api_asset` (`justification_id`),
  KEY `api_assetrequestmode_location_id_18ff3e40_fk_api_locat` (`location_id`),
  KEY `api_assetrequestmode_modified_by_id_5c2c48c1_fk_api_detai` (`modified_by_id`),
  KEY `api_assetrequestmode_vendor_id_e6b31e09_fk_api_appro` (`vendor_id`),
  CONSTRAINT `api_assetrequestmode_asset_request_id_eeb3776d_fk_api_asset` FOREIGN KEY (`asset_request_id`) REFERENCES `api_assetrequestmodel` (`id`),
  CONSTRAINT `api_assetrequestmode_business_unit_id_5b84c75a_fk_api_busin` FOREIGN KEY (`business_unit_id`) REFERENCES `api_businessunitmodel` (`business_unit_id`),
  CONSTRAINT `api_assetrequestmode_equipment_id_4f536288_fk_api_equip` FOREIGN KEY (`equipment_id`) REFERENCES `api_equipmenttypemodel` (`equipment_type_id`),
  CONSTRAINT `api_assetrequestmode_justification_id_cf624510_fk_api_asset` FOREIGN KEY (`justification_id`) REFERENCES `api_assetrequestjustificationmodel` (`justification_id`),
  CONSTRAINT `api_assetrequestmode_location_id_18ff3e40_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assetrequestmode_modified_by_id_5c2c48c1_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetrequestmode_vendor_id_e6b31e09_fk_api_appro` FOREIGN KEY (`vendor_id`) REFERENCES `api_approvedvendorsmodel` (`vendor_id`),
  CONSTRAINT `api_assetrequestmode_VIN_id_48d61bfd_fk_api_asset` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetrequestmodelhistory`
--

LOCK TABLES `api_assetrequestmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_assetrequestmodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assetrequestmodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assettransfer`
--

DROP TABLE IF EXISTS `api_assettransfer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assettransfer` (
  `asset_transfer_id` int NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(100) NOT NULL,
  `justification` longtext NOT NULL,
  `status` varchar(50) NOT NULL,
  `pickup_date` date DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `interior_condition` varchar(50) NOT NULL,
  `interior_condition_details` longtext,
  `exterior_condition` varchar(50) NOT NULL,
  `exterior_condition_details` longtext,
  `mileage` double NOT NULL,
  `hours` double NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  `VIN_id` varchar(100) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `destination_location_id` int DEFAULT NULL,
  `disposal_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `original_location_id` int DEFAULT NULL,
  PRIMARY KEY (`asset_transfer_id`),
  KEY `api_assettransfer_created_by_id_ab9cdd92_fk_api_detai` (`created_by_id`),
  KEY `api_assettransfer_destination_location_51514ea1_fk_api_locat` (`destination_location_id`),
  KEY `api_assettransfer_disposal_id_dbc94e0f_fk_api_asset` (`disposal_id`),
  KEY `api_assettransfer_modified_by_id_b584b255_fk_api_detai` (`modified_by_id`),
  KEY `api_assettransfer_original_location_id_2bc14e49_fk_api_locat` (`original_location_id`),
  KEY `api_assettransfer_VIN_id_12084905_fk_api_assetmodel_VIN` (`VIN_id`),
  CONSTRAINT `api_assettransfer_created_by_id_ab9cdd92_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assettransfer_destination_location_51514ea1_fk_api_locat` FOREIGN KEY (`destination_location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assettransfer_disposal_id_dbc94e0f_fk_api_asset` FOREIGN KEY (`disposal_id`) REFERENCES `api_assetdisposalmodel` (`id`),
  CONSTRAINT `api_assettransfer_modified_by_id_b584b255_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assettransfer_original_location_id_2bc14e49_fk_api_locat` FOREIGN KEY (`original_location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assettransfer_VIN_id_12084905_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assettransfer`
--

LOCK TABLES `api_assettransfer` WRITE;
/*!40000 ALTER TABLE `api_assettransfer` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assettransfer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assettransfermodelhistory`
--

DROP TABLE IF EXISTS `api_assettransfermodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assettransfermodelhistory` (
  `asset_transfer_history_id` int NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(100) NOT NULL,
  `justification` longtext NOT NULL,
  `status` varchar(50) NOT NULL,
  `pickup_date` date DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `interior_condition` varchar(50) DEFAULT NULL,
  `interior_condition_details` longtext,
  `exterior_condition` varchar(50) DEFAULT NULL,
  `exterior_condition_details` longtext,
  `mileage` double NOT NULL,
  `hours` double NOT NULL,
  `date` datetime(6) NOT NULL,
  `asset_transfer_id` int NOT NULL,
  `destination_location_id` int DEFAULT NULL,
  `disposal_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `original_location_id` int DEFAULT NULL,
  PRIMARY KEY (`asset_transfer_history_id`),
  KEY `api_assettransfermod_asset_transfer_id_dc8952a7_fk_api_asset` (`asset_transfer_id`),
  KEY `api_assettransfermod_destination_location_3ca950b2_fk_api_locat` (`destination_location_id`),
  KEY `api_assettransfermod_disposal_id_01325a31_fk_api_asset` (`disposal_id`),
  KEY `api_assettransfermod_modified_by_id_eb45f7a7_fk_api_detai` (`modified_by_id`),
  KEY `api_assettransfermod_original_location_id_d180fece_fk_api_locat` (`original_location_id`),
  CONSTRAINT `api_assettransfermod_asset_transfer_id_dc8952a7_fk_api_asset` FOREIGN KEY (`asset_transfer_id`) REFERENCES `api_assettransfer` (`asset_transfer_id`),
  CONSTRAINT `api_assettransfermod_destination_location_3ca950b2_fk_api_locat` FOREIGN KEY (`destination_location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assettransfermod_disposal_id_01325a31_fk_api_asset` FOREIGN KEY (`disposal_id`) REFERENCES `api_assetdisposalmodel` (`id`),
  CONSTRAINT `api_assettransfermod_modified_by_id_eb45f7a7_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assettransfermod_original_location_id_d180fece_fk_api_locat` FOREIGN KEY (`original_location_id`) REFERENCES `api_locationmodel` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assettransfermodelhistory`
--

LOCK TABLES `api_assettransfermodelhistory` WRITE;
/*!40000 ALTER TABLE `api_assettransfermodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assettransfermodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assettypechecks`
--

DROP TABLE IF EXISTS `api_assettypechecks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assettypechecks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_type_name` varchar(100) NOT NULL,
  `tires` tinyint(1) NOT NULL,
  `wheels` tinyint(1) NOT NULL,
  `horn` tinyint(1) NOT NULL,
  `fuel` tinyint(1) NOT NULL,
  `mirrors` tinyint(1) NOT NULL,
  `glass` tinyint(1) NOT NULL,
  `overhead_guard` tinyint(1) NOT NULL,
  `steps` tinyint(1) NOT NULL,
  `forks` tinyint(1) NOT NULL,
  `operator_cab` tinyint(1) NOT NULL,
  `cosmetic_damage` tinyint(1) NOT NULL,
  `brakes` tinyint(1) NOT NULL,
  `steering` tinyint(1) NOT NULL,
  `attachments` tinyint(1) NOT NULL,
  `mud_flaps` tinyint(1) NOT NULL,
  `electrical_connectors` tinyint(1) NOT NULL,
  `air_pressure` tinyint(1) NOT NULL,
  `boom_extensions` tinyint(1) NOT NULL,
  `spreader_functions` tinyint(1) NOT NULL,
  `lights` tinyint(1) NOT NULL,
  `headlights` tinyint(1) NOT NULL,
  `backup_lights` tinyint(1) NOT NULL,
  `trailer_light_cord` tinyint(1) NOT NULL,
  `fluids` tinyint(1) NOT NULL,
  `oil` tinyint(1) NOT NULL,
  `transmission_fluid` tinyint(1) NOT NULL,
  `steering_fluid` tinyint(1) NOT NULL,
  `hydraulic_fluid` tinyint(1) NOT NULL,
  `brake_fluid` tinyint(1) NOT NULL,
  `safety_equipment` tinyint(1) NOT NULL,
  `leaks` tinyint(1) NOT NULL,
  `hydraulic_hoses` tinyint(1) NOT NULL,
  `trailer_air_lines` tinyint(1) NOT NULL,
  `other_leaks` tinyint(1) NOT NULL,
  `lifesaving_equipments` tinyint(1) NOT NULL,
  `engine_and_all_mechanical` tinyint(1) NOT NULL,
  `communication` tinyint(1) NOT NULL,
  `steering_and_hydraulics` tinyint(1) NOT NULL,
  `fire_extinguisher` tinyint(1) NOT NULL,
  `electrical` tinyint(1) NOT NULL,
  `navigation_and_strobe_lights` tinyint(1) NOT NULL,
  `fuel_systems` tinyint(1) NOT NULL,
  `anchoring_system` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_type_name` (`asset_type_name`),
  KEY `api_assettypechecks_created_by_id_afdea472_fk_api_detai` (`created_by_id`),
  KEY `api_assettypechecks_modified_by_id_12ec3feb_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_assettypechecks_created_by_id_afdea472_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assettypechecks_modified_by_id_12ec3feb_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assettypechecks`
--

LOCK TABLES `api_assettypechecks` WRITE;
/*!40000 ALTER TABLE `api_assettypechecks` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assettypechecks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assettypecheckshistory`
--

DROP TABLE IF EXISTS `api_assettypecheckshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assettypecheckshistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_type_name` varchar(100) NOT NULL,
  `tires` tinyint(1) NOT NULL,
  `wheels` tinyint(1) NOT NULL,
  `horn` tinyint(1) NOT NULL,
  `fuel` tinyint(1) NOT NULL,
  `mirrors` tinyint(1) NOT NULL,
  `glass` tinyint(1) NOT NULL,
  `overhead_guard` tinyint(1) NOT NULL,
  `steps` tinyint(1) NOT NULL,
  `forks` tinyint(1) NOT NULL,
  `operator_cab` tinyint(1) NOT NULL,
  `cosmetic_damage` tinyint(1) NOT NULL,
  `brakes` tinyint(1) NOT NULL,
  `steering` tinyint(1) NOT NULL,
  `attachments` tinyint(1) NOT NULL,
  `mud_flaps` tinyint(1) NOT NULL,
  `electrical_connectors` tinyint(1) NOT NULL,
  `air_pressure` tinyint(1) NOT NULL,
  `boom_extensions` tinyint(1) NOT NULL,
  `spreader_functions` tinyint(1) NOT NULL,
  `lights` tinyint(1) NOT NULL,
  `headlights` tinyint(1) NOT NULL,
  `backup_lights` tinyint(1) NOT NULL,
  `trailer_light_cord` tinyint(1) NOT NULL,
  `fluids` tinyint(1) NOT NULL,
  `oil` tinyint(1) NOT NULL,
  `transmission_fluid` tinyint(1) NOT NULL,
  `steering_fluid` tinyint(1) NOT NULL,
  `hydraulic_fluid` tinyint(1) NOT NULL,
  `brake_fluid` tinyint(1) NOT NULL,
  `safety_equipment` tinyint(1) NOT NULL,
  `fire_extinguisher` tinyint(1) NOT NULL,
  `leaks` tinyint(1) NOT NULL,
  `hydraulic_hoses` tinyint(1) NOT NULL,
  `trailer_air_lines` tinyint(1) NOT NULL,
  `other_leaks` tinyint(1) NOT NULL,
  `date` datetime(6) NOT NULL,
  `asset_type_checks_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_assettypechecksh_asset_type_checks_id_8f30fc10_fk_api_asset` (`asset_type_checks_id`),
  KEY `api_assettypechecksh_modified_by_id_80f02d97_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_assettypechecksh_asset_type_checks_id_8f30fc10_fk_api_asset` FOREIGN KEY (`asset_type_checks_id`) REFERENCES `api_assettypechecks` (`id`),
  CONSTRAINT `api_assettypechecksh_modified_by_id_80f02d97_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assettypecheckshistory`
--

LOCK TABLES `api_assettypecheckshistory` WRITE;
/*!40000 ALTER TABLE `api_assettypecheckshistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assettypecheckshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_assettypemodel`
--

DROP TABLE IF EXISTS `api_assettypemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_assettypemodel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `overdue_date_variance` int NOT NULL,
  `due_soon_date_variance` int NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  `custom_fields` longtext,
  `asset_type_checks_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_assettypemodel_created_by_id_be41afef_fk_api_detai` (`created_by_id`),
  KEY `api_assettypemodel_modified_by_id_a7557b41_fk_api_detai` (`modified_by_id`),
  KEY `api_assettypemodel_asset_type_checks_id_dd77b5e2_fk_api_asset` (`asset_type_checks_id`),
  CONSTRAINT `api_assettypemodel_asset_type_checks_id_dd77b5e2_fk_api_asset` FOREIGN KEY (`asset_type_checks_id`) REFERENCES `api_assettypechecks` (`id`),
  CONSTRAINT `api_assettypemodel_created_by_id_be41afef_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assettypemodel_modified_by_id_a7557b41_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assettypemodel`
--

LOCK TABLES `api_assettypemodel` WRITE;
/*!40000 ALTER TABLE `api_assettypemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_assettypemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_businessunitmodel`
--

DROP TABLE IF EXISTS `api_businessunitmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_businessunitmodel` (
  `business_unit_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `accounting_email` varchar(254) NOT NULL,
  `location_id` int NOT NULL,
  PRIMARY KEY (`business_unit_id`),
  KEY `api_businessunitmode_location_id_1fdea960_fk_api_locat` (`location_id`),
  CONSTRAINT `api_businessunitmode_location_id_1fdea960_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_businessunitmodel`
--

LOCK TABLES `api_businessunitmodel` WRITE;
/*!40000 ALTER TABLE `api_businessunitmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_businessunitmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_company`
--

DROP TABLE IF EXISTS `api_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_company` (
  `company_id` char(32) NOT NULL,
  `company_name` varchar(150) NOT NULL,
  `company_address` varchar(150) NOT NULL,
  `company_phone` varchar(50) NOT NULL,
  `accounting_email` varchar(254) NOT NULL,
  `software_logo` varchar(1000) NOT NULL,
  `software_name` varchar(50) NOT NULL,
  `standard_currency_id` int DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `accounting_email` (`accounting_email`),
  KEY `api_company_standard_currency_id_7f70e121_fk_api_currency_id` (`standard_currency_id`),
  CONSTRAINT `api_company_standard_currency_id_7f70e121_fk_api_currency_id` FOREIGN KEY (`standard_currency_id`) REFERENCES `api_currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_company`
--

LOCK TABLES `api_company` WRITE;
/*!40000 ALTER TABLE `api_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_costcentremodel`
--

DROP TABLE IF EXISTS `api_costcentremodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_costcentremodel` (
  `cost_centre_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`cost_centre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_costcentremodel`
--

LOCK TABLES `api_costcentremodel` WRITE;
/*!40000 ALTER TABLE `api_costcentremodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_costcentremodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_currency`
--

DROP TABLE IF EXISTS `api_currency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_currency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `number` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_currency`
--

LOCK TABLES `api_currency` WRITE;
/*!40000 ALTER TABLE `api_currency` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_currency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_dailyinspection`
--

DROP TABLE IF EXISTS `api_dailyinspection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_dailyinspection` (
  `id` int NOT NULL AUTO_INCREMENT,
  `VIN` varchar(17) NOT NULL,
  `inspection_date` date NOT NULL,
  `pfd_lifejacket_ledger` longtext,
  `throw_bags` tinyint(1) NOT NULL,
  `heaving_line` tinyint(1) NOT NULL,
  `liferings` tinyint(1) NOT NULL,
  `reboarding_device` tinyint(1) NOT NULL,
  `watertight_flashlight` tinyint(1) NOT NULL,
  `pyrotechnic_flares` tinyint(1) NOT NULL,
  `first_aid_kit` tinyint(1) NOT NULL,
  `engine_working` tinyint(1) NOT NULL,
  `marine_vhf_radio` tinyint(1) NOT NULL,
  `police_radio` tinyint(1) NOT NULL,
  `epirb_registered` tinyint(1) NOT NULL,
  `bilge_pump_clear` tinyint(1) NOT NULL,
  `steering_controls_operable` tinyint(1) NOT NULL,
  `hatches_operable` tinyint(1) NOT NULL,
  `training_skills_exercised` tinyint(1) NOT NULL,
  `drills_entered_logbook` tinyint(1) NOT NULL,
  `emergency_briefings_conducted` tinyint(1) NOT NULL,
  `fire_extinguishers_inspected` tinyint(1) NOT NULL,
  `regular_inspections_completed` tinyint(1) NOT NULL,
  `electrical_inspections_completed` tinyint(1) NOT NULL,
  `broken_cracked_lenses` tinyint(1) NOT NULL,
  `lights_functioning` tinyint(1) NOT NULL,
  `fuel_connections_good` tinyint(1) NOT NULL,
  `fuel_containers_stored_properly` tinyint(1) NOT NULL,
  `ground_tackle_inspected` tinyint(1) NOT NULL,
  `bitter_end_attached` tinyint(1) NOT NULL,
  `anchor_secured` tinyint(1) NOT NULL,
  `welds_bolts_screws_good` tinyint(1) NOT NULL,
  `grab_lines_good` tinyint(1) NOT NULL,
  `operators_trained` tinyint(1) NOT NULL,
  `crew_equipment_trained` tinyint(1) NOT NULL,
  `vessel_damaged_since_last_report` tinyint(1) NOT NULL,
  `structural_changes_made_since_last_report` tinyint(1) NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_dailyinspection_created_by_id_f033ed51_fk_api_detai` (`created_by_id`),
  KEY `api_dailyinspection_modified_by_id_ccd7e2b7_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_dailyinspection_created_by_id_f033ed51_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_dailyinspection_modified_by_id_ccd7e2b7_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_dailyinspection`
--

LOCK TABLES `api_dailyinspection` WRITE;
/*!40000 ALTER TABLE `api_dailyinspection` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_dailyinspection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_dailyinspectionhistory`
--

DROP TABLE IF EXISTS `api_dailyinspectionhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_dailyinspectionhistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `VIN` varchar(17) NOT NULL,
  `inspection_date` date NOT NULL,
  `pfd_lifejacket_ledger` longtext,
  `throw_bags` tinyint(1) NOT NULL,
  `heaving_line` tinyint(1) NOT NULL,
  `liferings` tinyint(1) NOT NULL,
  `reboarding_device` tinyint(1) NOT NULL,
  `watertight_flashlight` tinyint(1) NOT NULL,
  `pyrotechnic_flares` tinyint(1) NOT NULL,
  `first_aid_kit` tinyint(1) NOT NULL,
  `engine_working` tinyint(1) NOT NULL,
  `marine_vhf_radio` tinyint(1) NOT NULL,
  `police_radio` tinyint(1) NOT NULL,
  `epirb_registered` tinyint(1) NOT NULL,
  `bilge_pump_clear` tinyint(1) NOT NULL,
  `steering_controls_operable` tinyint(1) NOT NULL,
  `hatches_operable` tinyint(1) NOT NULL,
  `training_skills_exercised` tinyint(1) NOT NULL,
  `drills_entered_logbook` tinyint(1) NOT NULL,
  `emergency_briefings_conducted` tinyint(1) NOT NULL,
  `fire_extinguishers_inspected` tinyint(1) NOT NULL,
  `regular_inspections_completed` tinyint(1) NOT NULL,
  `electrical_inspections_completed` tinyint(1) NOT NULL,
  `broken_cracked_lenses` tinyint(1) NOT NULL,
  `lights_functioning` tinyint(1) NOT NULL,
  `fuel_connections_good` tinyint(1) NOT NULL,
  `fuel_containers_stored_properly` tinyint(1) NOT NULL,
  `ground_tackle_inspected` tinyint(1) NOT NULL,
  `bitter_end_attached` tinyint(1) NOT NULL,
  `anchor_secured` tinyint(1) NOT NULL,
  `welds_bolts_screws_good` tinyint(1) NOT NULL,
  `grab_lines_good` tinyint(1) NOT NULL,
  `operators_trained` tinyint(1) NOT NULL,
  `crew_equipment_trained` tinyint(1) NOT NULL,
  `vessel_damaged_since_last_report` tinyint(1) NOT NULL,
  `structural_changes_made_since_last_report` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_dailyinspectionhistory`
--

LOCK TABLES `api_dailyinspectionhistory` WRITE;
/*!40000 ALTER TABLE `api_dailyinspectionhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_dailyinspectionhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_deliverycost`
--

DROP TABLE IF EXISTS `api_deliverycost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_deliverycost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `taxes` double NOT NULL,
  `total_cost` double NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `asset_request_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `disposal_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `maintenance_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `repair_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_deliverycost_created_by_id_c17f28d6_fk_api_detai` (`created_by_id`),
  KEY `api_deliverycost_currency_id_91d26aab_fk_api_currency_id` (`currency_id`),
  KEY `api_deliverycost_disposal_id_9dc4f78b_fk_api_asset` (`disposal_id`),
  KEY `api_deliverycost_location_id_4354d4fc_fk_api_locat` (`location_id`),
  KEY `api_deliverycost_maintenance_id_418648c9_fk_api_maint` (`maintenance_id`),
  KEY `api_deliverycost_modified_by_id_5500cc05_fk_api_detai` (`modified_by_id`),
  KEY `api_deliverycost_repair_id_1ba17210_fk_api_repai` (`repair_id`),
  KEY `api_deliverycost_asset_request_id_4f0d9ded_fk_api_asset` (`asset_request_id`),
  CONSTRAINT `api_deliverycost_asset_request_id_4f0d9ded_fk_api_asset` FOREIGN KEY (`asset_request_id`) REFERENCES `api_assetrequestmodel` (`id`),
  CONSTRAINT `api_deliverycost_created_by_id_c17f28d6_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_deliverycost_currency_id_91d26aab_fk_api_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_deliverycost_disposal_id_9dc4f78b_fk_api_asset` FOREIGN KEY (`disposal_id`) REFERENCES `api_assetdisposalmodel` (`id`),
  CONSTRAINT `api_deliverycost_location_id_4354d4fc_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_deliverycost_maintenance_id_418648c9_fk_api_maint` FOREIGN KEY (`maintenance_id`) REFERENCES `api_maintenancerequestmodel` (`maintenance_id`),
  CONSTRAINT `api_deliverycost_modified_by_id_5500cc05_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_deliverycost_repair_id_1ba17210_fk_api_repai` FOREIGN KEY (`repair_id`) REFERENCES `api_repairsmodel` (`repair_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_deliverycost`
--

LOCK TABLES `api_deliverycost` WRITE;
/*!40000 ALTER TABLE `api_deliverycost` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_deliverycost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_deliverycosthistory`
--

DROP TABLE IF EXISTS `api_deliverycosthistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_deliverycosthistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `taxes` double NOT NULL,
  `total_cost` double NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `asset_request_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `delivery_cost_id` int DEFAULT NULL,
  `disposal_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `maintenance_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `repair_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_deliverycosthist_asset_request_id_3c9735d9_fk_api_asset` (`asset_request_id`),
  KEY `api_deliverycosthist_created_by_id_93a7f210_fk_api_detai` (`created_by_id`),
  KEY `api_deliverycosthistory_currency_id_5506c51d_fk_api_currency_id` (`currency_id`),
  KEY `api_deliverycosthist_delivery_cost_id_06598be1_fk_api_deliv` (`delivery_cost_id`),
  KEY `api_deliverycosthist_disposal_id_b5de59a0_fk_api_asset` (`disposal_id`),
  KEY `api_deliverycosthist_location_id_6956ae5d_fk_api_locat` (`location_id`),
  KEY `api_deliverycosthist_maintenance_id_142da7d7_fk_api_maint` (`maintenance_id`),
  KEY `api_deliverycosthist_modified_by_id_7fb448f4_fk_api_detai` (`modified_by_id`),
  KEY `api_deliverycosthist_repair_id_7fef1a8d_fk_api_repai` (`repair_id`),
  CONSTRAINT `api_deliverycosthist_asset_request_id_3c9735d9_fk_api_asset` FOREIGN KEY (`asset_request_id`) REFERENCES `api_assetrequestmodel` (`id`),
  CONSTRAINT `api_deliverycosthist_created_by_id_93a7f210_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_deliverycosthist_delivery_cost_id_06598be1_fk_api_deliv` FOREIGN KEY (`delivery_cost_id`) REFERENCES `api_deliverycost` (`id`),
  CONSTRAINT `api_deliverycosthist_disposal_id_b5de59a0_fk_api_asset` FOREIGN KEY (`disposal_id`) REFERENCES `api_assetdisposalmodel` (`id`),
  CONSTRAINT `api_deliverycosthist_location_id_6956ae5d_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_deliverycosthist_maintenance_id_142da7d7_fk_api_maint` FOREIGN KEY (`maintenance_id`) REFERENCES `api_maintenancerequestmodel` (`maintenance_id`),
  CONSTRAINT `api_deliverycosthist_modified_by_id_7fb448f4_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_deliverycosthist_repair_id_7fef1a8d_fk_api_repai` FOREIGN KEY (`repair_id`) REFERENCES `api_repairsmodel` (`repair_id`),
  CONSTRAINT `api_deliverycosthistory_currency_id_5506c51d_fk_api_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_deliverycosthistory`
--

LOCK TABLES `api_deliverycosthistory` WRITE;
/*!40000 ALTER TABLE `api_deliverycosthistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_deliverycosthistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_detaileduser`
--

DROP TABLE IF EXISTS `api_detaileduser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_detaileduser` (
  `detailed_user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `cost_allowance` int NOT NULL,
  `image_url` longtext NOT NULL,
  `agreement_accepted` tinyint(1) NOT NULL,
  `first_time_login` tinyint(1) NOT NULL,
  `business_unit_id` int DEFAULT NULL,
  `company_id` char(32) DEFAULT NULL,
  `cost_centre_id` int DEFAULT NULL,
  `role_permissions_id` int DEFAULT NULL,
  PRIMARY KEY (`detailed_user_id`),
  UNIQUE KEY `email` (`email`),
  KEY `api_detaileduser_role_permissions_id_3878b73c_fk_api_rolep` (`role_permissions_id`),
  KEY `api_detaileduser_business_unit_id_7932adec_fk_api_busin` (`business_unit_id`),
  KEY `api_detaileduser_company_id_4d55f60a_fk_api_company_company_id` (`company_id`),
  KEY `api_detaileduser_cost_centre_id_dbed5ea7_fk_api_costc` (`cost_centre_id`),
  CONSTRAINT `api_detaileduser_business_unit_id_7932adec_fk_api_busin` FOREIGN KEY (`business_unit_id`) REFERENCES `api_businessunitmodel` (`business_unit_id`),
  CONSTRAINT `api_detaileduser_company_id_4d55f60a_fk_api_company_company_id` FOREIGN KEY (`company_id`) REFERENCES `api_company` (`company_id`),
  CONSTRAINT `api_detaileduser_cost_centre_id_dbed5ea7_fk_api_costc` FOREIGN KEY (`cost_centre_id`) REFERENCES `api_costcentremodel` (`cost_centre_id`),
  CONSTRAINT `api_detaileduser_role_permissions_id_3878b73c_fk_api_rolep` FOREIGN KEY (`role_permissions_id`) REFERENCES `api_rolepermissions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_detaileduser`
--

LOCK TABLES `api_detaileduser` WRITE;
/*!40000 ALTER TABLE `api_detaileduser` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_detaileduser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_detaileduser_location`
--

DROP TABLE IF EXISTS `api_detaileduser_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_detaileduser_location` (
  `id` int NOT NULL AUTO_INCREMENT,
  `detaileduser_id` int NOT NULL,
  `locationmodel_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_detaileduser_locatio_detaileduser_id_location_0662e2dc_uniq` (`detaileduser_id`,`locationmodel_id`),
  KEY `api_detaileduser_loc_locationmodel_id_0f0a3f9b_fk_api_locat` (`locationmodel_id`),
  CONSTRAINT `api_detaileduser_loc_detaileduser_id_e5cfc688_fk_api_detai` FOREIGN KEY (`detaileduser_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_detaileduser_loc_locationmodel_id_0f0a3f9b_fk_api_locat` FOREIGN KEY (`locationmodel_id`) REFERENCES `api_locationmodel` (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_detaileduser_location`
--

LOCK TABLES `api_detaileduser_location` WRITE;
/*!40000 ALTER TABLE `api_detaileduser_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_detaileduser_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_detailedusermodelhistory`
--

DROP TABLE IF EXISTS `api_detailedusermodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_detailedusermodelhistory` (
  `detailed_user_history_id` int NOT NULL AUTO_INCREMENT,
  `date` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `cost_allowance` int NOT NULL,
  `image_url` longtext NOT NULL,
  `business_unit_id` int DEFAULT NULL,
  `company_id` char(32) DEFAULT NULL,
  `role_permissions_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`detailed_user_history_id`),
  KEY `api_detailedusermode_business_unit_id_c0219409_fk_api_busin` (`business_unit_id`),
  KEY `api_detailedusermode_company_id_7c62abcc_fk_api_compa` (`company_id`),
  KEY `api_detailedusermode_role_permissions_id_f60796a1_fk_api_rolep` (`role_permissions_id`),
  KEY `api_detailedusermode_user_id_458862a4_fk_api_detai` (`user_id`),
  CONSTRAINT `api_detailedusermode_business_unit_id_c0219409_fk_api_busin` FOREIGN KEY (`business_unit_id`) REFERENCES `api_businessunitmodel` (`business_unit_id`),
  CONSTRAINT `api_detailedusermode_company_id_7c62abcc_fk_api_compa` FOREIGN KEY (`company_id`) REFERENCES `api_company` (`company_id`),
  CONSTRAINT `api_detailedusermode_role_permissions_id_f60796a1_fk_api_rolep` FOREIGN KEY (`role_permissions_id`) REFERENCES `api_rolepermissions` (`id`),
  CONSTRAINT `api_detailedusermode_user_id_458862a4_fk_api_detai` FOREIGN KEY (`user_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_detailedusermodelhistory`
--

LOCK TABLES `api_detailedusermodelhistory` WRITE;
/*!40000 ALTER TABLE `api_detailedusermodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_detailedusermodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_enginehistorymodel`
--

DROP TABLE IF EXISTS `api_enginehistorymodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_enginehistorymodel` (
  `engine_history_id` int NOT NULL AUTO_INCREMENT,
  `updated_name` varchar(100) DEFAULT NULL,
  `updated_hours` double DEFAULT NULL,
  `action` varchar(20) NOT NULL,
  `date` datetime(6) NOT NULL,
  `engine_id_id` int DEFAULT NULL,
  `responsible_daily_check_id` int DEFAULT NULL,
  `responsible_user_id` int NOT NULL,
  PRIMARY KEY (`engine_history_id`),
  KEY `api_enginehistorymod_engine_id_id_6dfadf2c_fk_api_engin` (`engine_id_id`),
  KEY `api_enginehistorymod_responsible_daily_ch_08e0d8ff_fk_api_asset` (`responsible_daily_check_id`),
  KEY `api_enginehistorymod_responsible_user_id_3e190328_fk_api_detai` (`responsible_user_id`),
  CONSTRAINT `api_enginehistorymod_engine_id_id_6dfadf2c_fk_api_engin` FOREIGN KEY (`engine_id_id`) REFERENCES `api_enginemodel` (`engine_id`),
  CONSTRAINT `api_enginehistorymod_responsible_daily_ch_08e0d8ff_fk_api_asset` FOREIGN KEY (`responsible_daily_check_id`) REFERENCES `api_assetdailychecksmodel` (`daily_check_id`),
  CONSTRAINT `api_enginehistorymod_responsible_user_id_3e190328_fk_api_detai` FOREIGN KEY (`responsible_user_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_enginehistorymodel`
--

LOCK TABLES `api_enginehistorymodel` WRITE;
/*!40000 ALTER TABLE `api_enginehistorymodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_enginehistorymodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_enginemodel`
--

DROP TABLE IF EXISTS `api_enginemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_enginemodel` (
  `engine_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `hours` double NOT NULL,
  `VIN_id` varchar(100) NOT NULL,
  PRIMARY KEY (`engine_id`),
  KEY `api_enginemodel_VIN_id_93922063_fk_api_assetmodel_VIN` (`VIN_id`),
  CONSTRAINT `api_enginemodel_VIN_id_93922063_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_enginemodel`
--

LOCK TABLES `api_enginemodel` WRITE;
/*!40000 ALTER TABLE `api_enginemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_enginemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_equipmenttypemodel`
--

DROP TABLE IF EXISTS `api_equipmenttypemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_equipmenttypemodel` (
  `equipment_type_id` int NOT NULL AUTO_INCREMENT,
  `model_number` varchar(100) DEFAULT NULL,
  `engine` varchar(50) DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  `fuel_tank_capacity` double DEFAULT NULL,
  `fuel_tank_capacity_unit` varchar(50) DEFAULT NULL,
  `asset_type_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `fuel_id` int DEFAULT NULL,
  `manufacturer_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`equipment_type_id`),
  KEY `api_equipmenttypemodel_fuel_id_cba9eff5_fk_api_fueltype_id` (`fuel_id`),
  KEY `api_equipmenttypemod_manufacturer_id_29668e7f_fk_api_asset` (`manufacturer_id`),
  KEY `api_equipmenttypemod_modified_by_id_da7eef15_fk_api_detai` (`modified_by_id`),
  KEY `api_equipmenttypemod_asset_type_id_3143c189_fk_api_asset` (`asset_type_id`),
  KEY `api_equipmenttypemod_created_by_id_c346a1e6_fk_api_detai` (`created_by_id`),
  CONSTRAINT `api_equipmenttypemod_asset_type_id_3143c189_fk_api_asset` FOREIGN KEY (`asset_type_id`) REFERENCES `api_assettypemodel` (`id`),
  CONSTRAINT `api_equipmenttypemod_created_by_id_c346a1e6_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_equipmenttypemod_manufacturer_id_29668e7f_fk_api_asset` FOREIGN KEY (`manufacturer_id`) REFERENCES `api_assetmanufacturermodel` (`id`),
  CONSTRAINT `api_equipmenttypemod_modified_by_id_da7eef15_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_equipmenttypemodel_fuel_id_cba9eff5_fk_api_fueltype_id` FOREIGN KEY (`fuel_id`) REFERENCES `api_fueltype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_equipmenttypemodel`
--

LOCK TABLES `api_equipmenttypemodel` WRITE;
/*!40000 ALTER TABLE `api_equipmenttypemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_equipmenttypemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_errorreport`
--

DROP TABLE IF EXISTS `api_errorreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_errorreport` (
  `error_report_id` int NOT NULL AUTO_INCREMENT,
  `issue_type` varchar(50) NOT NULL,
  `error_title` varchar(1000) NOT NULL,
  `error_description` longtext NOT NULL,
  `steps_to_reproduce` longtext,
  `date_created` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  PRIMARY KEY (`error_report_id`),
  KEY `api_errorreport_created_by_id_d3637fe3_fk_api_detai` (`created_by_id`),
  CONSTRAINT `api_errorreport_created_by_id_d3637fe3_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_errorreport`
--

LOCK TABLES `api_errorreport` WRITE;
/*!40000 ALTER TABLE `api_errorreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_errorreport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_errorreportfile`
--

DROP TABLE IF EXISTS `api_errorreportfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_errorreportfile` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `file_type` varchar(150) NOT NULL,
  `file_name` longtext NOT NULL,
  `file_url` longtext NOT NULL,
  `bytes` bigint NOT NULL,
  `file_created` datetime(6) NOT NULL,
  `error_report_id` int NOT NULL,
  PRIMARY KEY (`file_id`),
  KEY `api_errorreportfile_error_report_id_ee964a4f_fk_api_error` (`error_report_id`),
  CONSTRAINT `api_errorreportfile_error_report_id_ee964a4f_fk_api_error` FOREIGN KEY (`error_report_id`) REFERENCES `api_errorreport` (`error_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_errorreportfile`
--

LOCK TABLES `api_errorreportfile` WRITE;
/*!40000 ALTER TABLE `api_errorreportfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_errorreportfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_fleetguru`
--

DROP TABLE IF EXISTS `api_fleetguru`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_fleetguru` (
  `id` int NOT NULL AUTO_INCREMENT,
  `process` varchar(50) NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `image_url` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_fleetguru`
--

LOCK TABLES `api_fleetguru` WRITE;
/*!40000 ALTER TABLE `api_fleetguru` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_fleetguru` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_fuelcard`
--

DROP TABLE IF EXISTS `api_fuelcard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_fuelcard` (
  `card_id` int NOT NULL AUTO_INCREMENT,
  `expiration` date DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `assigned_employee_id` varchar(254) DEFAULT NULL,
  `business_unit_id` int DEFAULT NULL,
  `issuer_id` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  KEY `api_fuelcard_assigned_employee_id_fcb6a40a_fk_api_detai` (`assigned_employee_id`),
  KEY `api_fuelcard_business_unit_id_6843f63b_fk_api_busin` (`business_unit_id`),
  KEY `api_fuelcard_issuer_id_7a73ca8f_fk_api_detaileduser_email` (`issuer_id`),
  CONSTRAINT `api_fuelcard_assigned_employee_id_fcb6a40a_fk_api_detai` FOREIGN KEY (`assigned_employee_id`) REFERENCES `api_detaileduser` (`email`),
  CONSTRAINT `api_fuelcard_business_unit_id_6843f63b_fk_api_busin` FOREIGN KEY (`business_unit_id`) REFERENCES `api_businessunitmodel` (`business_unit_id`),
  CONSTRAINT `api_fuelcard_issuer_id_7a73ca8f_fk_api_detaileduser_email` FOREIGN KEY (`issuer_id`) REFERENCES `api_detaileduser` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_fuelcard`
--

LOCK TABLES `api_fuelcard` WRITE;
/*!40000 ALTER TABLE `api_fuelcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_fuelcard` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_fuelcost`
--

DROP TABLE IF EXISTS `api_fuelcost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_fuelcost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `volume` double NOT NULL,
  `volume_unit` varchar(50) NOT NULL,
  `total_cost` double NOT NULL,
  `taxes` double NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  `VIN_id` varchar(100) DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `fuel_type_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_fuelcost_fuel_type_id_a68c2509_fk_api_fueltype_id` (`fuel_type_id`),
  KEY `api_fuelcost_location_id_3e8c907b_fk_api_locat` (`location_id`),
  KEY `api_fuelcost_modified_by_id_f184d7f2_fk_api_detai` (`modified_by_id`),
  KEY `api_fuelcost_VIN_id_b79a526d_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_fuelcost_created_by_id_9050c739_fk_api_detai` (`created_by_id`),
  KEY `api_fuelcost_currency_id_4e73dab3_fk_api_currency_id` (`currency_id`),
  CONSTRAINT `api_fuelcost_created_by_id_9050c739_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_fuelcost_currency_id_4e73dab3_fk_api_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_fuelcost_fuel_type_id_a68c2509_fk_api_fueltype_id` FOREIGN KEY (`fuel_type_id`) REFERENCES `api_fueltype` (`id`),
  CONSTRAINT `api_fuelcost_location_id_3e8c907b_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_fuelcost_modified_by_id_f184d7f2_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_fuelcost_VIN_id_b79a526d_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_fuelcost`
--

LOCK TABLES `api_fuelcost` WRITE;
/*!40000 ALTER TABLE `api_fuelcost` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_fuelcost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_fuelcostmodelhistory`
--

DROP TABLE IF EXISTS `api_fuelcostmodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_fuelcostmodelhistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `volume` double NOT NULL,
  `volume_unit` varchar(50) NOT NULL,
  `total_cost` double NOT NULL,
  `taxes` double NOT NULL,
  `date` datetime(6) NOT NULL,
  `VIN_id` varchar(100) DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `fuel_cost_id` int DEFAULT NULL,
  `fuel_type_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_fuelcostmodelhistory_VIN_id_64ba6882_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_fuelcostmodelhistory_currency_id_8bdfe0d9_fk_api_currency_id` (`currency_id`),
  KEY `api_fuelcostmodelhis_fuel_cost_id_4fb992ed_fk_api_fuelc` (`fuel_cost_id`),
  KEY `api_fuelcostmodelhis_fuel_type_id_1bb4b854_fk_api_fuelt` (`fuel_type_id`),
  KEY `api_fuelcostmodelhis_location_id_bf6c4061_fk_api_locat` (`location_id`),
  KEY `api_fuelcostmodelhis_modified_by_id_f59c2374_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_fuelcostmodelhis_fuel_cost_id_4fb992ed_fk_api_fuelc` FOREIGN KEY (`fuel_cost_id`) REFERENCES `api_fuelcost` (`id`),
  CONSTRAINT `api_fuelcostmodelhis_fuel_type_id_1bb4b854_fk_api_fuelt` FOREIGN KEY (`fuel_type_id`) REFERENCES `api_fueltype` (`id`),
  CONSTRAINT `api_fuelcostmodelhis_location_id_bf6c4061_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_fuelcostmodelhis_modified_by_id_f59c2374_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_fuelcostmodelhistory_currency_id_8bdfe0d9_fk_api_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_fuelcostmodelhistory_VIN_id_64ba6882_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_fuelcostmodelhistory`
--

LOCK TABLES `api_fuelcostmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_fuelcostmodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_fuelcostmodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_fueltype`
--

DROP TABLE IF EXISTS `api_fueltype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_fueltype` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_fueltype_created_by_id_7ac2889b_fk_api_detai` (`created_by_id`),
  KEY `api_fueltype_modified_by_id_22b884e4_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_fueltype_created_by_id_7ac2889b_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_fueltype_modified_by_id_22b884e4_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_fueltype`
--

LOCK TABLES `api_fueltype` WRITE;
/*!40000 ALTER TABLE `api_fueltype` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_fueltype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_inspectiontypemodel`
--

DROP TABLE IF EXISTS `api_inspectiontypemodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_inspectiontypemodel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inspection_name` varchar(50) NOT NULL,
  `inspection_code` varchar(50) NOT NULL,
  `required_at` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_inspectiontypemodel`
--

LOCK TABLES `api_inspectiontypemodel` WRITE;
/*!40000 ALTER TABLE `api_inspectiontypemodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_inspectiontypemodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_insurancecost`
--

DROP TABLE IF EXISTS `api_insurancecost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_insurancecost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deductible` double NOT NULL,
  `total_cost` double NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `VIN_id` varchar(100) DEFAULT NULL,
  `accident_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_insurancecost_location_id_db265a0a_fk_api_locat` (`location_id`),
  KEY `api_insurancecost_modified_by_id_061bb451_fk_api_detai` (`modified_by_id`),
  KEY `api_insurancecost_VIN_id_7e6d575e_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_insurancecost_accident_id_a2a7e128_fk_api_accid` (`accident_id`),
  KEY `api_insurancecost_created_by_id_faf2bae2_fk_api_detai` (`created_by_id`),
  KEY `api_insurancecost_currency_id_8973d10c_fk_api_currency_id` (`currency_id`),
  CONSTRAINT `api_insurancecost_accident_id_a2a7e128_fk_api_accid` FOREIGN KEY (`accident_id`) REFERENCES `api_accidentmodel` (`accident_id`),
  CONSTRAINT `api_insurancecost_created_by_id_faf2bae2_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_insurancecost_currency_id_8973d10c_fk_api_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_insurancecost_location_id_db265a0a_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_insurancecost_modified_by_id_061bb451_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_insurancecost_VIN_id_7e6d575e_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_insurancecost`
--

LOCK TABLES `api_insurancecost` WRITE;
/*!40000 ALTER TABLE `api_insurancecost` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_insurancecost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_insurancecostmodelhistory`
--

DROP TABLE IF EXISTS `api_insurancecostmodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_insurancecostmodelhistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `deductible` double NOT NULL,
  `total_cost` double NOT NULL,
  `date` datetime(6) NOT NULL,
  `VIN_id` varchar(100) DEFAULT NULL,
  `accident_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `insurance_cost_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_insurancecostmod_VIN_id_c804804e_fk_api_asset` (`VIN_id`),
  KEY `api_insurancecostmod_accident_id_9a6dc962_fk_api_accid` (`accident_id`),
  KEY `api_insurancecostmod_currency_id_0a59edae_fk_api_curre` (`currency_id`),
  KEY `api_insurancecostmod_insurance_cost_id_9153c60e_fk_api_insur` (`insurance_cost_id`),
  KEY `api_insurancecostmod_location_id_268f5a48_fk_api_locat` (`location_id`),
  KEY `api_insurancecostmod_modified_by_id_1edeba66_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_insurancecostmod_accident_id_9a6dc962_fk_api_accid` FOREIGN KEY (`accident_id`) REFERENCES `api_accidentmodel` (`accident_id`),
  CONSTRAINT `api_insurancecostmod_currency_id_0a59edae_fk_api_curre` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_insurancecostmod_insurance_cost_id_9153c60e_fk_api_insur` FOREIGN KEY (`insurance_cost_id`) REFERENCES `api_insurancecost` (`id`),
  CONSTRAINT `api_insurancecostmod_location_id_268f5a48_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_insurancecostmod_modified_by_id_1edeba66_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_insurancecostmod_VIN_id_c804804e_fk_api_asset` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_insurancecostmodelhistory`
--

LOCK TABLES `api_insurancecostmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_insurancecostmodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_insurancecostmodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_inventory`
--

DROP TABLE IF EXISTS `api_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_inventory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `serial` varchar(255) DEFAULT NULL,
  `custom_id` varchar(255) DEFAULT NULL,
  `inventory_type` varchar(255) NOT NULL,
  `description` longtext,
  `per_unit_cost` double DEFAULT NULL,
  `date_of_manufacture` date DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `equipment_type_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `serial` (`serial`),
  UNIQUE KEY `custom_id` (`custom_id`),
  KEY `api_inventory_created_by_id_b84009f2_fk_api_detai` (`created_by_id`),
  KEY `api_inventory_equipment_type_id_90bcccc7_fk_api_equip` (`equipment_type_id`),
  KEY `api_inventory_location_id_a4bcfa28_fk_api_locat` (`location_id`),
  KEY `api_inventory_modified_by_id_f9495787_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_inventory_created_by_id_b84009f2_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_inventory_equipment_type_id_90bcccc7_fk_api_equip` FOREIGN KEY (`equipment_type_id`) REFERENCES `api_equipmenttypemodel` (`equipment_type_id`),
  CONSTRAINT `api_inventory_location_id_a4bcfa28_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_inventory_modified_by_id_f9495787_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_inventory`
--

LOCK TABLES `api_inventory` WRITE;
/*!40000 ALTER TABLE `api_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_jobspecification`
--

DROP TABLE IF EXISTS `api_jobspecification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_jobspecification` (
  `job_specification_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`job_specification_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_jobspecification`
--

LOCK TABLES `api_jobspecification` WRITE;
/*!40000 ALTER TABLE `api_jobspecification` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_jobspecification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_laborcost`
--

DROP TABLE IF EXISTS `api_laborcost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_laborcost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `base_hourly_rate` double NOT NULL,
  `total_base_hours` double NOT NULL,
  `overtime_rate` double NOT NULL,
  `total_overtime_hours` double NOT NULL,
  `taxes` double NOT NULL,
  `total_cost` double NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `disposal_id` int DEFAULT NULL,
  `issue_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `maintenance_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_laborcost_location_id_88ec229d_fk_api_locat` (`location_id`),
  KEY `api_laborcost_maintenance_id_366ad8b9_fk_api_maint` (`maintenance_id`),
  KEY `api_laborcost_modified_by_id_d6ec089d_fk_api_detai` (`modified_by_id`),
  KEY `api_laborcost_created_by_id_1a3ecd17_fk_api_detai` (`created_by_id`),
  KEY `api_laborcost_currency_id_ced7edd3_fk_api_currency_id` (`currency_id`),
  KEY `api_laborcost_disposal_id_df44d769_fk_api_assetdisposalmodel_id` (`disposal_id`),
  KEY `api_laborcost_issue_id_3b954f4a_fk_api_assetissuemodel_issue_id` (`issue_id`),
  CONSTRAINT `api_laborcost_created_by_id_1a3ecd17_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_laborcost_currency_id_ced7edd3_fk_api_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_laborcost_disposal_id_df44d769_fk_api_assetdisposalmodel_id` FOREIGN KEY (`disposal_id`) REFERENCES `api_assetdisposalmodel` (`id`),
  CONSTRAINT `api_laborcost_issue_id_3b954f4a_fk_api_assetissuemodel_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `api_assetissuemodel` (`issue_id`),
  CONSTRAINT `api_laborcost_location_id_88ec229d_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_laborcost_maintenance_id_366ad8b9_fk_api_maint` FOREIGN KEY (`maintenance_id`) REFERENCES `api_maintenancerequestmodel` (`maintenance_id`),
  CONSTRAINT `api_laborcost_modified_by_id_d6ec089d_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_laborcost`
--

LOCK TABLES `api_laborcost` WRITE;
/*!40000 ALTER TABLE `api_laborcost` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_laborcost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_laborcostmodelhistory`
--

DROP TABLE IF EXISTS `api_laborcostmodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_laborcostmodelhistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `base_hourly_rate` double NOT NULL,
  `total_base_hours` double NOT NULL,
  `overtime_rate` double NOT NULL,
  `total_overtime_hours` double NOT NULL,
  `taxes` double NOT NULL,
  `total_cost` double NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  `currency_id` int DEFAULT NULL,
  `disposal_id` int DEFAULT NULL,
  `issue_id` int DEFAULT NULL,
  `labor_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `maintenance_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_laborcostmodelhi_currency_id_9fcdf08c_fk_api_curre` (`currency_id`),
  KEY `api_laborcostmodelhi_disposal_id_9c6f3528_fk_api_asset` (`disposal_id`),
  KEY `api_laborcostmodelhi_issue_id_bb6a1afc_fk_api_asset` (`issue_id`),
  KEY `api_laborcostmodelhistory_labor_id_2cc63593_fk_api_laborcost_id` (`labor_id`),
  KEY `api_laborcostmodelhi_location_id_79ca8861_fk_api_locat` (`location_id`),
  KEY `api_laborcostmodelhi_maintenance_id_e612f7a2_fk_api_maint` (`maintenance_id`),
  KEY `api_laborcostmodelhi_modified_by_id_3752372f_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_laborcostmodelhi_currency_id_9fcdf08c_fk_api_curre` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_laborcostmodelhi_disposal_id_9c6f3528_fk_api_asset` FOREIGN KEY (`disposal_id`) REFERENCES `api_assetdisposalmodel` (`id`),
  CONSTRAINT `api_laborcostmodelhi_issue_id_bb6a1afc_fk_api_asset` FOREIGN KEY (`issue_id`) REFERENCES `api_assetissuemodel` (`issue_id`),
  CONSTRAINT `api_laborcostmodelhi_location_id_79ca8861_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_laborcostmodelhi_maintenance_id_e612f7a2_fk_api_maint` FOREIGN KEY (`maintenance_id`) REFERENCES `api_maintenancerequestmodel` (`maintenance_id`),
  CONSTRAINT `api_laborcostmodelhi_modified_by_id_3752372f_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_laborcostmodelhistory_labor_id_2cc63593_fk_api_laborcost_id` FOREIGN KEY (`labor_id`) REFERENCES `api_laborcost` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_laborcostmodelhistory`
--

LOCK TABLES `api_laborcostmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_laborcostmodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_laborcostmodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_licensecost`
--

DROP TABLE IF EXISTS `api_licensecost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_licensecost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `license_registration` double NOT NULL,
  `taxes` double NOT NULL,
  `license_plate_renewal` double NOT NULL,
  `total_cost` double NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  `VIN_id` varchar(100) DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_licensecost_location_id_13de6a03_fk_api_locat` (`location_id`),
  KEY `api_licensecost_modified_by_id_41820a9d_fk_api_detai` (`modified_by_id`),
  KEY `api_licensecost_VIN_id_30492662_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_licensecost_created_by_id_b691722b_fk_api_detai` (`created_by_id`),
  KEY `api_licensecost_currency_id_6eea48cf_fk_api_currency_id` (`currency_id`),
  CONSTRAINT `api_licensecost_created_by_id_b691722b_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_licensecost_currency_id_6eea48cf_fk_api_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_licensecost_location_id_13de6a03_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_licensecost_modified_by_id_41820a9d_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_licensecost_VIN_id_30492662_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_licensecost`
--

LOCK TABLES `api_licensecost` WRITE;
/*!40000 ALTER TABLE `api_licensecost` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_licensecost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_licensecostmodelhistory`
--

DROP TABLE IF EXISTS `api_licensecostmodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_licensecostmodelhistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `license_registration` double NOT NULL,
  `taxes` double NOT NULL,
  `license_plate_renewal` double NOT NULL,
  `total_cost` double NOT NULL,
  `date` datetime(6) NOT NULL,
  `VIN_id` varchar(100) DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `license_cost_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_licensecostmodel_VIN_id_2e8564f7_fk_api_asset` (`VIN_id`),
  KEY `api_licensecostmodel_currency_id_7162ca61_fk_api_curre` (`currency_id`),
  KEY `api_licensecostmodel_license_cost_id_6cdba7b2_fk_api_licen` (`license_cost_id`),
  KEY `api_licensecostmodel_location_id_e8ea7596_fk_api_locat` (`location_id`),
  KEY `api_licensecostmodel_modified_by_id_5d6e8b37_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_licensecostmodel_currency_id_7162ca61_fk_api_curre` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_licensecostmodel_license_cost_id_6cdba7b2_fk_api_licen` FOREIGN KEY (`license_cost_id`) REFERENCES `api_licensecost` (`id`),
  CONSTRAINT `api_licensecostmodel_location_id_e8ea7596_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_licensecostmodel_modified_by_id_5d6e8b37_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_licensecostmodel_VIN_id_2e8564f7_fk_api_asset` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_licensecostmodelhistory`
--

LOCK TABLES `api_licensecostmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_licensecostmodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_licensecostmodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_locationmodel`
--

DROP TABLE IF EXISTS `api_locationmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_locationmodel` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `location_code` varchar(10) NOT NULL,
  `location_name` varchar(100) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_locationmodel`
--

LOCK TABLES `api_locationmodel` WRITE;
/*!40000 ALTER TABLE `api_locationmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_locationmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_maintenanceforecastrules`
--

DROP TABLE IF EXISTS `api_maintenanceforecastrules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_maintenanceforecastrules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(100) NOT NULL,
  `date_created` date NOT NULL,
  `date_updated` date NOT NULL,
  `hour_cycle` double NOT NULL,
  `mileage_cycle` double NOT NULL,
  `time_cycle` double NOT NULL,
  `VIN_id` varchar(100) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `inspection_type_id` int NOT NULL,
  `location_id` int NOT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_maintenanceforec_VIN_id_43d27b29_fk_api_asset` (`VIN_id`),
  KEY `api_maintenanceforec_created_by_id_7b4190e3_fk_api_detai` (`created_by_id`),
  KEY `api_maintenanceforec_inspection_type_id_4c2e50e0_fk_api_inspe` (`inspection_type_id`),
  KEY `api_maintenanceforec_location_id_7d1db767_fk_api_locat` (`location_id`),
  KEY `api_maintenanceforec_modified_by_id_0cb09b5d_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_maintenanceforec_created_by_id_7b4190e3_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_maintenanceforec_inspection_type_id_4c2e50e0_fk_api_inspe` FOREIGN KEY (`inspection_type_id`) REFERENCES `api_inspectiontypemodel` (`id`),
  CONSTRAINT `api_maintenanceforec_location_id_7d1db767_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_maintenanceforec_modified_by_id_0cb09b5d_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_maintenanceforec_VIN_id_43d27b29_fk_api_asset` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_maintenanceforecastrules`
--

LOCK TABLES `api_maintenanceforecastrules` WRITE;
/*!40000 ALTER TABLE `api_maintenanceforecastrules` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_maintenanceforecastrules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_maintenanceforecastruleshistory`
--

DROP TABLE IF EXISTS `api_maintenanceforecastruleshistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_maintenanceforecastruleshistory` (
  `maintenance_forecast_history_id` int NOT NULL AUTO_INCREMENT,
  `custom_id` varchar(100) NOT NULL,
  `date` datetime(6) NOT NULL,
  `hour_cycle` double NOT NULL,
  `mileage_cycle` double NOT NULL,
  `time_cycle` double NOT NULL,
  `maintenance_forecast_id` int NOT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`maintenance_forecast_history_id`),
  KEY `api_maintenanceforec_maintenance_forecast_2b1d7f75_fk_api_maint` (`maintenance_forecast_id`),
  KEY `api_maintenanceforec_modified_by_id_679c2f26_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_maintenanceforec_maintenance_forecast_2b1d7f75_fk_api_maint` FOREIGN KEY (`maintenance_forecast_id`) REFERENCES `api_maintenanceforecastrules` (`id`),
  CONSTRAINT `api_maintenanceforec_modified_by_id_679c2f26_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_maintenanceforecastruleshistory`
--

LOCK TABLES `api_maintenanceforecastruleshistory` WRITE;
/*!40000 ALTER TABLE `api_maintenanceforecastruleshistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_maintenanceforecastruleshistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_maintenancerequestfile`
--

DROP TABLE IF EXISTS `api_maintenancerequestfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_maintenancerequestfile` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `file_type` varchar(150) NOT NULL,
  `file_purpose` varchar(50) NOT NULL,
  `file_name` longtext NOT NULL,
  `file_url` longtext NOT NULL,
  `bytes` bigint NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `maintenance_request_id` int DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `api_maintenancereque_created_by_id_4a69c2fe_fk_api_detai` (`created_by_id`),
  KEY `api_maintenancereque_maintenance_request__dfdeb7ab_fk_api_maint` (`maintenance_request_id`),
  CONSTRAINT `api_maintenancereque_created_by_id_4a69c2fe_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_maintenancereque_maintenance_request__dfdeb7ab_fk_api_maint` FOREIGN KEY (`maintenance_request_id`) REFERENCES `api_maintenancerequestmodel` (`maintenance_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_maintenancerequestfile`
--

LOCK TABLES `api_maintenancerequestfile` WRITE;
/*!40000 ALTER TABLE `api_maintenancerequestfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_maintenancerequestfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_maintenancerequestmodel`
--

DROP TABLE IF EXISTS `api_maintenancerequestmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_maintenancerequestmodel` (
  `maintenance_id` int NOT NULL AUTO_INCREMENT,
  `work_order` varchar(100) NOT NULL,
  `in_house` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `date_completed` datetime(6) DEFAULT NULL,
  `description` longtext NOT NULL,
  `estimated_delivery_date` datetime(6) DEFAULT NULL,
  `requested_delivery_date` datetime(6) DEFAULT NULL,
  `vendor_contacted_date` datetime(6) DEFAULT NULL,
  `available_pickup_date` datetime(6) DEFAULT NULL,
  `vendor_email` varchar(100) NOT NULL,
  `mileage` double NOT NULL,
  `hours` double NOT NULL,
  `status` varchar(50) NOT NULL,
  `VIN_id` varchar(100) NOT NULL,
  `assigned_vendor_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `inspection_type_id` int NOT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`maintenance_id`),
  KEY `api_maintenancereque_VIN_id_50b77888_fk_api_asset` (`VIN_id`),
  KEY `api_maintenancereque_assigned_vendor_id_02b819e7_fk_api_appro` (`assigned_vendor_id`),
  KEY `api_maintenancereque_created_by_id_8181a9ca_fk_api_detai` (`created_by_id`),
  KEY `api_maintenancereque_inspection_type_id_f5a6ad64_fk_api_inspe` (`inspection_type_id`),
  KEY `api_maintenancereque_location_id_945bb3c1_fk_api_locat` (`location_id`),
  KEY `api_maintenancereque_modified_by_id_f7a66dc4_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_maintenancereque_assigned_vendor_id_02b819e7_fk_api_appro` FOREIGN KEY (`assigned_vendor_id`) REFERENCES `api_approvedvendorsmodel` (`vendor_id`),
  CONSTRAINT `api_maintenancereque_created_by_id_8181a9ca_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_maintenancereque_inspection_type_id_f5a6ad64_fk_api_inspe` FOREIGN KEY (`inspection_type_id`) REFERENCES `api_inspectiontypemodel` (`id`),
  CONSTRAINT `api_maintenancereque_location_id_945bb3c1_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_maintenancereque_modified_by_id_f7a66dc4_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_maintenancereque_VIN_id_50b77888_fk_api_asset` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_maintenancerequestmodel`
--

LOCK TABLES `api_maintenancerequestmodel` WRITE;
/*!40000 ALTER TABLE `api_maintenancerequestmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_maintenancerequestmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_maintenancerequestmodelhistory`
--

DROP TABLE IF EXISTS `api_maintenancerequestmodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_maintenancerequestmodelhistory` (
  `maintenance_history_id` int NOT NULL AUTO_INCREMENT,
  `work_order` varchar(100) NOT NULL,
  `date` datetime(6) NOT NULL,
  `date_completed` date DEFAULT NULL,
  `estimated_delivery_date` date DEFAULT NULL,
  `requested_delivery_date` date DEFAULT NULL,
  `vendor_contacted_date` date DEFAULT NULL,
  `available_pickup_date` date DEFAULT NULL,
  `vendor_email` varchar(100) NOT NULL,
  `mileage` double NOT NULL,
  `hours` double NOT NULL,
  `status` varchar(100) NOT NULL,
  `assigned_vendor_id` int DEFAULT NULL,
  `inspection_type_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `maintenance_id` int NOT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`maintenance_history_id`),
  KEY `api_maintenancereque_assigned_vendor_id_09af396c_fk_api_appro` (`assigned_vendor_id`),
  KEY `api_maintenancereque_inspection_type_id_cbbfad63_fk_api_inspe` (`inspection_type_id`),
  KEY `api_maintenancereque_location_id_9de4fbdf_fk_api_locat` (`location_id`),
  KEY `api_maintenancereque_maintenance_id_94b8ca43_fk_api_maint` (`maintenance_id`),
  KEY `api_maintenancereque_modified_by_id_8c9621ac_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_maintenancereque_assigned_vendor_id_09af396c_fk_api_appro` FOREIGN KEY (`assigned_vendor_id`) REFERENCES `api_approvedvendorsmodel` (`vendor_id`),
  CONSTRAINT `api_maintenancereque_inspection_type_id_cbbfad63_fk_api_inspe` FOREIGN KEY (`inspection_type_id`) REFERENCES `api_inspectiontypemodel` (`id`),
  CONSTRAINT `api_maintenancereque_location_id_9de4fbdf_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_maintenancereque_maintenance_id_94b8ca43_fk_api_maint` FOREIGN KEY (`maintenance_id`) REFERENCES `api_maintenancerequestmodel` (`maintenance_id`),
  CONSTRAINT `api_maintenancereque_modified_by_id_8c9621ac_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_maintenancerequestmodelhistory`
--

LOCK TABLES `api_maintenancerequestmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_maintenancerequestmodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_maintenancerequestmodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_notificationconfiguration`
--

DROP TABLE IF EXISTS `api_notificationconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_notificationconfiguration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `fields` longtext,
  `custom_text` longtext,
  `triggers` longtext,
  `recipient_type` varchar(50) NOT NULL,
  `users` longtext,
  `locations` longtext,
  `business_units` longtext,
  `roles` longtext,
  `date_modified` datetime(6) NOT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_notificationconf_modified_by_id_0d1b5ca6_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_notificationconf_modified_by_id_0d1b5ca6_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_notificationconfiguration`
--

LOCK TABLES `api_notificationconfiguration` WRITE;
/*!40000 ALTER TABLE `api_notificationconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_notificationconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_parts`
--

DROP TABLE IF EXISTS `api_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_parts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `part_number` varchar(100) NOT NULL,
  `part_name` varchar(100) NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `taxes` double NOT NULL,
  `total_cost` double NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `disposal_id` int DEFAULT NULL,
  `issue_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `maintenance_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_parts_created_by_id_8d88feb8_fk_api_detai` (`created_by_id`),
  KEY `api_parts_currency_id_31be192f_fk_api_currency_id` (`currency_id`),
  KEY `api_parts_disposal_id_8471b0ca_fk_api_assetdisposalmodel_id` (`disposal_id`),
  KEY `api_parts_issue_id_75453a17_fk_api_assetissuemodel_issue_id` (`issue_id`),
  KEY `api_parts_location_id_675c79a9_fk_api_locationmodel_location_id` (`location_id`),
  KEY `api_parts_maintenance_id_3be00de0_fk_api_maint` (`maintenance_id`),
  KEY `api_parts_modified_by_id_fc2414a8_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_parts_created_by_id_8d88feb8_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_parts_currency_id_31be192f_fk_api_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_parts_disposal_id_8471b0ca_fk_api_assetdisposalmodel_id` FOREIGN KEY (`disposal_id`) REFERENCES `api_assetdisposalmodel` (`id`),
  CONSTRAINT `api_parts_issue_id_75453a17_fk_api_assetissuemodel_issue_id` FOREIGN KEY (`issue_id`) REFERENCES `api_assetissuemodel` (`issue_id`),
  CONSTRAINT `api_parts_location_id_675c79a9_fk_api_locationmodel_location_id` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_parts_maintenance_id_3be00de0_fk_api_maint` FOREIGN KEY (`maintenance_id`) REFERENCES `api_maintenancerequestmodel` (`maintenance_id`),
  CONSTRAINT `api_parts_modified_by_id_fc2414a8_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_parts`
--

LOCK TABLES `api_parts` WRITE;
/*!40000 ALTER TABLE `api_parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_partsmodelhistory`
--

DROP TABLE IF EXISTS `api_partsmodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_partsmodelhistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `part_number` varchar(100) NOT NULL,
  `part_name` varchar(100) NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `taxes` double NOT NULL,
  `total_cost` double NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  `currency_id` int DEFAULT NULL,
  `disposal_id` int DEFAULT NULL,
  `issue_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `maintenance_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `parts_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_partsmodelhistory_currency_id_a606df9b_fk_api_currency_id` (`currency_id`),
  KEY `api_partsmodelhistor_disposal_id_78da58e1_fk_api_asset` (`disposal_id`),
  KEY `api_partsmodelhistor_issue_id_7708c488_fk_api_asset` (`issue_id`),
  KEY `api_partsmodelhistor_location_id_2c2991fe_fk_api_locat` (`location_id`),
  KEY `api_partsmodelhistor_maintenance_id_cd17ac11_fk_api_maint` (`maintenance_id`),
  KEY `api_partsmodelhistor_modified_by_id_d6a9f159_fk_api_detai` (`modified_by_id`),
  KEY `api_partsmodelhistory_parts_id_ba93e01e_fk_api_parts_id` (`parts_id`),
  CONSTRAINT `api_partsmodelhistor_disposal_id_78da58e1_fk_api_asset` FOREIGN KEY (`disposal_id`) REFERENCES `api_assetdisposalmodel` (`id`),
  CONSTRAINT `api_partsmodelhistor_issue_id_7708c488_fk_api_asset` FOREIGN KEY (`issue_id`) REFERENCES `api_assetissuemodel` (`issue_id`),
  CONSTRAINT `api_partsmodelhistor_location_id_2c2991fe_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_partsmodelhistor_maintenance_id_cd17ac11_fk_api_maint` FOREIGN KEY (`maintenance_id`) REFERENCES `api_maintenancerequestmodel` (`maintenance_id`),
  CONSTRAINT `api_partsmodelhistor_modified_by_id_d6a9f159_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_partsmodelhistory_currency_id_a606df9b_fk_api_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_partsmodelhistory_parts_id_ba93e01e_fk_api_parts_id` FOREIGN KEY (`parts_id`) REFERENCES `api_parts` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_partsmodelhistory`
--

LOCK TABLES `api_partsmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_partsmodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_partsmodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_rentalcost`
--

DROP TABLE IF EXISTS `api_rentalcost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_rentalcost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_cost` double NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `VIN_id` varchar(100) DEFAULT NULL,
  `accident_id` int DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `maintenance_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `repair_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_rentalcost_repair_id_bffbdf9c_fk_api_repairsmodel_repair_id` (`repair_id`),
  KEY `api_rentalcost_VIN_id_70e51830_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_rentalcost_accident_id_87ebc25f_fk_api_accid` (`accident_id`),
  KEY `api_rentalcost_created_by_id_a458d221_fk_api_detai` (`created_by_id`),
  KEY `api_rentalcost_currency_id_500e53df_fk_api_currency_id` (`currency_id`),
  KEY `api_rentalcost_location_id_1efbd134_fk_api_locat` (`location_id`),
  KEY `api_rentalcost_maintenance_id_9237c325_fk_api_maint` (`maintenance_id`),
  KEY `api_rentalcost_modified_by_id_0a505810_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_rentalcost_accident_id_87ebc25f_fk_api_accid` FOREIGN KEY (`accident_id`) REFERENCES `api_accidentmodel` (`accident_id`),
  CONSTRAINT `api_rentalcost_created_by_id_a458d221_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_rentalcost_currency_id_500e53df_fk_api_currency_id` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_rentalcost_location_id_1efbd134_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_rentalcost_maintenance_id_9237c325_fk_api_maint` FOREIGN KEY (`maintenance_id`) REFERENCES `api_maintenancerequestmodel` (`maintenance_id`),
  CONSTRAINT `api_rentalcost_modified_by_id_0a505810_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_rentalcost_repair_id_bffbdf9c_fk_api_repairsmodel_repair_id` FOREIGN KEY (`repair_id`) REFERENCES `api_repairsmodel` (`repair_id`),
  CONSTRAINT `api_rentalcost_VIN_id_70e51830_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_rentalcost`
--

LOCK TABLES `api_rentalcost` WRITE;
/*!40000 ALTER TABLE `api_rentalcost` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_rentalcost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_rentalcostmodelhistory`
--

DROP TABLE IF EXISTS `api_rentalcostmodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_rentalcostmodelhistory` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_cost` double NOT NULL,
  `date` datetime(6) NOT NULL,
  `VIN_id` varchar(100) DEFAULT NULL,
  `accident_id` int DEFAULT NULL,
  `currency_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `maintenance_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `rental_cost_id` int DEFAULT NULL,
  `repair_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_rentalcostmodelhistory_VIN_id_c83a2cb4_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_rentalcostmodelh_accident_id_a69d45ed_fk_api_accid` (`accident_id`),
  KEY `api_rentalcostmodelh_currency_id_d08ff758_fk_api_curre` (`currency_id`),
  KEY `api_rentalcostmodelh_location_id_939da8fa_fk_api_locat` (`location_id`),
  KEY `api_rentalcostmodelh_maintenance_id_e9f9565d_fk_api_maint` (`maintenance_id`),
  KEY `api_rentalcostmodelh_modified_by_id_3b0dbc48_fk_api_detai` (`modified_by_id`),
  KEY `api_rentalcostmodelh_rental_cost_id_794e94d2_fk_api_renta` (`rental_cost_id`),
  KEY `api_rentalcostmodelh_repair_id_bfb01785_fk_api_repai` (`repair_id`),
  CONSTRAINT `api_rentalcostmodelh_accident_id_a69d45ed_fk_api_accid` FOREIGN KEY (`accident_id`) REFERENCES `api_accidentmodel` (`accident_id`),
  CONSTRAINT `api_rentalcostmodelh_currency_id_d08ff758_fk_api_curre` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`),
  CONSTRAINT `api_rentalcostmodelh_location_id_939da8fa_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_rentalcostmodelh_maintenance_id_e9f9565d_fk_api_maint` FOREIGN KEY (`maintenance_id`) REFERENCES `api_maintenancerequestmodel` (`maintenance_id`),
  CONSTRAINT `api_rentalcostmodelh_modified_by_id_3b0dbc48_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_rentalcostmodelh_rental_cost_id_794e94d2_fk_api_renta` FOREIGN KEY (`rental_cost_id`) REFERENCES `api_rentalcost` (`id`),
  CONSTRAINT `api_rentalcostmodelh_repair_id_bfb01785_fk_api_repai` FOREIGN KEY (`repair_id`) REFERENCES `api_repairsmodel` (`repair_id`),
  CONSTRAINT `api_rentalcostmodelhistory_VIN_id_c83a2cb4_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_rentalcostmodelhistory`
--

LOCK TABLES `api_rentalcostmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_rentalcostmodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_rentalcostmodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_repairfile`
--

DROP TABLE IF EXISTS `api_repairfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_repairfile` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `file_type` varchar(150) NOT NULL,
  `file_purpose` varchar(50) NOT NULL,
  `file_name` longtext NOT NULL,
  `file_url` longtext NOT NULL,
  `bytes` bigint NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `expiration_date` date DEFAULT NULL,
  `created_by_id` int DEFAULT NULL,
  `repair_id` int DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `api_repairfile_created_by_id_e6fffdd7_fk_api_detai` (`created_by_id`),
  KEY `api_repairfile_repair_id_19d4f16c_fk_api_repairsmodel_repair_id` (`repair_id`),
  CONSTRAINT `api_repairfile_created_by_id_e6fffdd7_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_repairfile_repair_id_19d4f16c_fk_api_repairsmodel_repair_id` FOREIGN KEY (`repair_id`) REFERENCES `api_repairsmodel` (`repair_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_repairfile`
--

LOCK TABLES `api_repairfile` WRITE;
/*!40000 ALTER TABLE `api_repairfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_repairfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_repairsmodel`
--

DROP TABLE IF EXISTS `api_repairsmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_repairsmodel` (
  `repair_id` int NOT NULL AUTO_INCREMENT,
  `work_order` varchar(100) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  `in_house` tinyint(1) NOT NULL,
  `description` longtext NOT NULL,
  `is_refurbishment` tinyint(1) NOT NULL,
  `requested_delivery_date` datetime(6) DEFAULT NULL,
  `estimated_delivery_date` datetime(6) DEFAULT NULL,
  `available_pickup_date` datetime(6) DEFAULT NULL,
  `date_completed` datetime(6) DEFAULT NULL,
  `down_time` double DEFAULT NULL,
  `vendor_contacted_date` datetime(6) DEFAULT NULL,
  `vendor_email` varchar(100) NOT NULL,
  `mileage` double NOT NULL,
  `hours` double NOT NULL,
  `is_urgent` tinyint(1) NOT NULL,
  `status` varchar(50) NOT NULL,
  `VIN_id` varchar(100) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `disposal_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`repair_id`),
  KEY `api_repairsmodel_VIN_id_93706939_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_repairsmodel_created_by_id_132af9d7_fk_api_detai` (`created_by_id`),
  KEY `api_repairsmodel_disposal_id_c9f681ab_fk_api_asset` (`disposal_id`),
  KEY `api_repairsmodel_location_id_baf19500_fk_api_locat` (`location_id`),
  KEY `api_repairsmodel_modified_by_id_de30d9ec_fk_api_detai` (`modified_by_id`),
  KEY `api_repairsmodel_vendor_id_11d778d3_fk_api_appro` (`vendor_id`),
  CONSTRAINT `api_repairsmodel_created_by_id_132af9d7_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_repairsmodel_disposal_id_c9f681ab_fk_api_asset` FOREIGN KEY (`disposal_id`) REFERENCES `api_assetdisposalmodel` (`id`),
  CONSTRAINT `api_repairsmodel_location_id_baf19500_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_repairsmodel_modified_by_id_de30d9ec_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_repairsmodel_vendor_id_11d778d3_fk_api_appro` FOREIGN KEY (`vendor_id`) REFERENCES `api_approvedvendorsmodel` (`vendor_id`),
  CONSTRAINT `api_repairsmodel_VIN_id_93706939_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_repairsmodel`
--

LOCK TABLES `api_repairsmodel` WRITE;
/*!40000 ALTER TABLE `api_repairsmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_repairsmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_repairsmodelhistory`
--

DROP TABLE IF EXISTS `api_repairsmodelhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_repairsmodelhistory` (
  `repair_history_id` int NOT NULL AUTO_INCREMENT,
  `work_order` varchar(100) NOT NULL,
  `date` datetime(6) NOT NULL,
  `description` longtext NOT NULL,
  `requested_delivery_date` datetime(6) DEFAULT NULL,
  `estimated_delivery_date` datetime(6) DEFAULT NULL,
  `available_pickup_date` datetime(6) DEFAULT NULL,
  `date_completed` datetime(6) DEFAULT NULL,
  `down_time` int DEFAULT NULL,
  `vendor_contacted_date` datetime(6) DEFAULT NULL,
  `vendor_email` varchar(100) NOT NULL,
  `mileage` double NOT NULL,
  `hours` double NOT NULL,
  `status` varchar(100) NOT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `repair_id` int NOT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`repair_history_id`),
  KEY `api_repairsmodelhist_location_id_409ef7e3_fk_api_locat` (`location_id`),
  KEY `api_repairsmodelhist_modified_by_id_a021000f_fk_api_detai` (`modified_by_id`),
  KEY `api_repairsmodelhist_repair_id_34ccb561_fk_api_repai` (`repair_id`),
  KEY `api_repairsmodelhist_vendor_id_22ec1f3b_fk_api_appro` (`vendor_id`),
  CONSTRAINT `api_repairsmodelhist_location_id_409ef7e3_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_repairsmodelhist_modified_by_id_a021000f_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_repairsmodelhist_repair_id_34ccb561_fk_api_repai` FOREIGN KEY (`repair_id`) REFERENCES `api_repairsmodel` (`repair_id`),
  CONSTRAINT `api_repairsmodelhist_vendor_id_22ec1f3b_fk_api_appro` FOREIGN KEY (`vendor_id`) REFERENCES `api_approvedvendorsmodel` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_repairsmodelhistory`
--

LOCK TABLES `api_repairsmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_repairsmodelhistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_repairsmodelhistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_requestquote`
--

DROP TABLE IF EXISTS `api_requestquote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_requestquote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(50) NOT NULL,
  `vendor_quote_id` varchar(50) DEFAULT NULL,
  `estimated_cost` double DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `approved_by_id` int DEFAULT NULL,
  `asset_request_id` int DEFAULT NULL,
  `disposal_request_id` int DEFAULT NULL,
  `maintenance_request_id` int DEFAULT NULL,
  `repair_request_id` int DEFAULT NULL,
  `transfer_request_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_requestquote_approved_by_id_90433a46_fk_api_detai` (`approved_by_id`),
  KEY `api_requestquote_asset_request_id_e19b02a6_fk_api_asset` (`asset_request_id`),
  KEY `api_requestquote_disposal_request_id_ea75c564_fk_api_asset` (`disposal_request_id`),
  KEY `api_requestquote_maintenance_request__00583fc6_fk_api_maint` (`maintenance_request_id`),
  KEY `api_requestquote_repair_request_id_ea0c519b_fk_api_repai` (`repair_request_id`),
  KEY `api_requestquote_transfer_request_id_10604ee4_fk_api_asset` (`transfer_request_id`),
  KEY `api_requestquote_vendor_id_2f3b5a52_fk_api_appro` (`vendor_id`),
  CONSTRAINT `api_requestquote_approved_by_id_90433a46_fk_api_detai` FOREIGN KEY (`approved_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_requestquote_asset_request_id_e19b02a6_fk_api_asset` FOREIGN KEY (`asset_request_id`) REFERENCES `api_assetrequestmodel` (`id`),
  CONSTRAINT `api_requestquote_disposal_request_id_ea75c564_fk_api_asset` FOREIGN KEY (`disposal_request_id`) REFERENCES `api_assetdisposalmodel` (`id`),
  CONSTRAINT `api_requestquote_maintenance_request__00583fc6_fk_api_maint` FOREIGN KEY (`maintenance_request_id`) REFERENCES `api_maintenancerequestmodel` (`maintenance_id`),
  CONSTRAINT `api_requestquote_repair_request_id_ea0c519b_fk_api_repai` FOREIGN KEY (`repair_request_id`) REFERENCES `api_repairsmodel` (`repair_id`),
  CONSTRAINT `api_requestquote_transfer_request_id_10604ee4_fk_api_asset` FOREIGN KEY (`transfer_request_id`) REFERENCES `api_assettransfer` (`asset_transfer_id`),
  CONSTRAINT `api_requestquote_vendor_id_2f3b5a52_fk_api_appro` FOREIGN KEY (`vendor_id`) REFERENCES `api_approvedvendorsmodel` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_requestquote`
--

LOCK TABLES `api_requestquote` WRITE;
/*!40000 ALTER TABLE `api_requestquote` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_requestquote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_rolepermissions`
--

DROP TABLE IF EXISTS `api_rolepermissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_rolepermissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(50) NOT NULL,
  `dashboard` tinyint(1) NOT NULL,
  `dashboard_operator` tinyint(1) NOT NULL,
  `fleet_at_a_glance` tinyint(1) NOT NULL,
  `fleet_at_a_glance_executive` tinyint(1) NOT NULL,
  `fleet_at_a_glance_manager` tinyint(1) NOT NULL,
  `fleet_overview` tinyint(1) NOT NULL,
  `asset_request` tinyint(1) NOT NULL,
  `asset_request_new_order` tinyint(1) NOT NULL,
  `asset_request_list` tinyint(1) NOT NULL,
  `repairs` tinyint(1) NOT NULL,
  `repairs_list` tinyint(1) NOT NULL,
  `repairs_new_request` tinyint(1) NOT NULL,
  `maintenance` tinyint(1) NOT NULL,
  `maintenance_status` tinyint(1) NOT NULL,
  `maintenance_new_request` tinyint(1) NOT NULL,
  `maintenance_forecast` tinyint(1) NOT NULL,
  `maintenance_lookup` tinyint(1) NOT NULL,
  `incidents` tinyint(1) NOT NULL,
  `incidents_list` tinyint(1) NOT NULL,
  `incidents_new_report` tinyint(1) NOT NULL,
  `issues` tinyint(1) NOT NULL,
  `issues_new` tinyint(1) NOT NULL,
  `issues_list` tinyint(1) NOT NULL,
  `issues_search` tinyint(1) NOT NULL,
  `operators` tinyint(1) NOT NULL,
  `operators_daily_check` tinyint(1) NOT NULL,
  `operators_search` tinyint(1) NOT NULL,
  `unfinished_checks` tinyint(1) NOT NULL,
  `energy` tinyint(1) NOT NULL,
  `energy_fuel_tracking` tinyint(1) NOT NULL,
  `fuel_orders` tinyint(1) NOT NULL,
  `fuel_transactions` tinyint(1) NOT NULL,
  `asset_removal` tinyint(1) NOT NULL,
  `asset_removal_new` tinyint(1) NOT NULL,
  `asset_removal_list` tinyint(1) NOT NULL,
  `approval_request` tinyint(1) NOT NULL,
  `asset_transfers` tinyint(1) NOT NULL,
  `asset_transfers_current_transfers` tinyint(1) NOT NULL,
  `asset_transfers_new_transfer_request` tinyint(1) NOT NULL,
  `asset_transfers_map` tinyint(1) NOT NULL,
  `asset_log` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_rolepermissions`
--

LOCK TABLES `api_rolepermissions` WRITE;
/*!40000 ALTER TABLE `api_rolepermissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_rolepermissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_snapshotdailyasset`
--

DROP TABLE IF EXISTS `api_snapshotdailyasset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_snapshotdailyasset` (
  `id` int NOT NULL AUTO_INCREMENT,
  `VIN` varchar(100) DEFAULT NULL,
  `parent` varchar(100) DEFAULT NULL,
  `equipment_type` varchar(100) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `jde_department` varchar(100) DEFAULT NULL,
  `original_location` varchar(100) DEFAULT NULL,
  `current_location` varchar(100) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `aircraft_compatability` varchar(100) DEFAULT NULL,
  `unit_number` varchar(100) DEFAULT NULL,
  `license_plate` varchar(100) DEFAULT NULL,
  `date_of_manufacture` date DEFAULT NULL,
  `department` varchar(100) DEFAULT NULL,
  `job_specification` varchar(100) DEFAULT NULL,
  `fire_extinguisher_quantity` varchar(100) DEFAULT NULL,
  `fire_extinguisher_inspection_date` date DEFAULT NULL,
  `path` varchar(300) DEFAULT NULL,
  `last_process` varchar(50) DEFAULT NULL,
  `hours_or_mileage` varchar(50) DEFAULT NULL,
  `mileage` double NOT NULL,
  `hours` double NOT NULL,
  `mileage_unit` varchar(50) DEFAULT NULL,
  `date_in_service` date DEFAULT NULL,
  `total_cost` double NOT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `daily_average_hours` double NOT NULL,
  `daily_average_mileage` double NOT NULL,
  `replacement_hours` double DEFAULT NULL,
  `replacement_mileage` double DEFAULT NULL,
  `insurance_renewal_date` date DEFAULT NULL,
  `registration_renewal_date` date DEFAULT NULL,
  `load_capacity` double DEFAULT NULL,
  `load_capacity_unit` varchar(50) DEFAULT NULL,
  `fuel` varchar(100) DEFAULT NULL,
  `engine` varchar(50) DEFAULT NULL,
  `colour` varchar(50) NOT NULL,
  `fuel_tank_capacity` double DEFAULT NULL,
  `fuel_tank_capacity_unit` varchar(50) DEFAULT NULL,
  `is_rental` tinyint(1) DEFAULT NULL,
  `monthly_subscription_cost` double DEFAULT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_snapshotdailyasset`
--

LOCK TABLES `api_snapshotdailyasset` WRITE;
/*!40000 ALTER TABLE `api_snapshotdailyasset` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_snapshotdailyasset` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_snapshotdailycounts`
--

DROP TABLE IF EXISTS `api_snapshotdailycounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_snapshotdailycounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `asset_count` int NOT NULL,
  `user_count` int NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_snapshotdailycounts`
--

LOCK TABLES `api_snapshotdailycounts` WRITE;
/*!40000 ALTER TABLE `api_snapshotdailycounts` DISABLE KEYS */;
INSERT INTO `api_snapshotdailycounts` VALUES (1,0,3,'2023-12-15 02:20:13.090104'),(2,0,3,'2023-12-16 02:20:03.946468'),(3,0,3,'2023-12-17 02:20:04.008053'),(4,0,3,'2023-12-18 02:20:04.093656'),(5,0,3,'2023-12-19 02:20:03.959652'),(6,0,3,'2023-12-20 02:20:03.924220'),(7,0,3,'2023-12-21 02:20:03.971559'),(8,0,3,'2023-12-22 02:20:04.007237'),(9,0,3,'2023-12-23 02:20:04.038343'),(10,0,3,'2023-12-24 02:20:03.928799'),(11,0,3,'2023-12-25 02:20:03.989340'),(12,0,3,'2023-12-26 02:20:03.947590'),(13,0,3,'2023-12-27 02:20:03.979988'),(14,0,3,'2023-12-28 02:20:03.986565'),(15,0,3,'2023-12-29 02:20:04.235733'),(16,0,3,'2023-12-30 02:20:04.098327'),(17,0,3,'2023-12-31 02:20:04.022670'),(18,0,3,'2024-01-01 02:20:04.084257'),(19,0,3,'2024-01-02 02:20:03.984311'),(20,0,3,'2024-01-03 02:20:04.082275'),(21,0,3,'2024-01-04 02:20:03.971594'),(22,0,3,'2024-01-05 02:20:03.979054'),(23,0,3,'2024-01-06 02:20:04.020011'),(24,0,3,'2024-01-07 02:20:04.037339'),(25,0,3,'2024-01-08 02:20:04.244735'),(26,0,3,'2024-01-09 02:20:04.170162'),(27,0,3,'2024-01-10 02:20:04.053451'),(28,0,3,'2024-01-11 02:20:04.132952'),(29,0,3,'2024-01-12 02:20:04.123083'),(30,0,3,'2024-01-13 02:20:04.086244'),(31,0,3,'2024-01-14 02:20:04.205062'),(32,0,3,'2024-01-15 02:20:04.094572'),(33,0,3,'2024-01-16 02:20:04.013973'),(34,0,3,'2024-01-17 02:20:04.121333'),(35,0,3,'2024-01-18 02:20:04.422332'),(36,0,3,'2024-01-19 02:20:04.159137'),(37,0,3,'2024-01-20 02:20:04.207114'),(38,0,3,'2024-01-21 02:20:04.064189'),(39,0,3,'2024-01-22 02:20:04.215560'),(40,0,3,'2024-01-23 02:20:04.119733'),(41,0,3,'2024-01-24 02:20:04.321303'),(42,0,3,'2024-01-25 02:20:04.247374'),(43,0,3,'2024-01-26 02:20:04.030635'),(44,0,3,'2024-01-27 02:20:04.164829'),(45,0,3,'2024-01-28 02:20:04.129458'),(46,0,3,'2024-01-29 02:20:04.117861'),(47,0,3,'2024-01-30 02:20:04.181535'),(48,0,3,'2024-01-31 02:20:04.138816'),(49,0,3,'2024-02-01 02:20:04.199780'),(50,0,3,'2024-02-02 02:20:04.220098'),(51,0,3,'2024-02-03 02:20:04.152509'),(52,0,3,'2024-02-04 02:20:04.135161'),(53,0,3,'2024-02-05 02:20:04.120357'),(54,0,3,'2024-02-06 02:20:22.040447'),(55,0,3,'2024-02-07 02:20:04.158878'),(56,0,3,'2024-02-08 02:20:04.150948'),(57,0,3,'2024-02-09 02:20:04.168119'),(58,0,3,'2024-02-10 02:20:04.107249'),(59,0,3,'2024-02-11 02:20:04.537283'),(60,0,3,'2024-02-12 02:20:04.225708'),(61,0,3,'2024-02-13 02:20:04.204143'),(62,0,3,'2024-02-14 02:20:04.125552'),(63,0,3,'2024-02-15 02:20:04.440816'),(64,0,3,'2024-02-16 02:20:04.365593'),(65,0,3,'2024-02-17 02:20:04.255868'),(66,0,3,'2024-02-18 02:20:04.118838'),(67,0,3,'2024-02-19 02:20:04.228519'),(68,0,3,'2024-02-20 02:20:04.213800'),(69,0,3,'2024-02-21 02:20:04.158217'),(70,0,3,'2024-02-22 02:20:04.156390'),(71,0,3,'2024-02-23 02:20:04.229820'),(72,0,3,'2024-02-24 02:20:04.466192'),(73,0,3,'2024-02-25 02:20:04.176338'),(74,0,3,'2024-02-26 02:20:04.291472'),(75,0,3,'2024-02-27 02:20:04.151838'),(76,0,3,'2024-02-28 02:20:04.142209'),(77,0,3,'2024-02-29 02:20:04.124474'),(78,0,3,'2024-03-01 02:20:04.192194'),(79,0,3,'2024-03-02 02:20:19.446630'),(80,0,3,'2024-03-03 02:20:25.104827'),(81,0,3,'2024-03-04 02:20:04.500661'),(82,0,3,'2024-03-05 02:20:04.183050'),(83,0,3,'2024-03-06 02:20:03.749593'),(84,0,3,'2024-03-07 02:20:03.608950'),(85,0,3,'2024-03-08 02:20:03.962470'),(86,0,3,'2024-03-09 02:20:04.583413'),(87,0,3,'2024-03-10 02:20:03.725812'),(88,0,3,'2024-03-11 02:20:03.602642'),(89,0,3,'2024-03-12 02:20:03.909492'),(90,0,3,'2024-03-13 02:20:04.023319'),(91,0,3,'2024-03-14 02:20:04.984497'),(92,0,3,'2024-03-15 02:20:29.588895'),(93,0,3,'2024-03-16 02:20:06.549914'),(94,0,3,'2024-03-17 02:20:07.526028'),(95,0,3,'2024-03-18 02:20:08.024786'),(96,0,3,'2024-03-19 02:20:06.574464'),(97,0,3,'2024-03-20 02:20:07.278587'),(98,0,3,'2024-03-21 02:20:06.629680'),(99,0,3,'2024-03-22 02:20:06.745961'),(100,0,3,'2024-03-23 02:20:06.784216'),(101,0,3,'2024-03-24 02:20:07.557511'),(102,0,3,'2024-03-25 02:20:06.750790'),(103,0,3,'2024-03-26 02:20:06.733071'),(104,0,3,'2024-03-27 02:20:06.854627'),(105,0,3,'2024-03-28 02:20:06.714208'),(106,0,3,'2024-03-29 02:20:06.811083'),(107,0,3,'2024-03-30 02:20:06.712219'),(108,0,3,'2024-03-31 02:20:08.098372'),(109,0,3,'2024-04-01 02:20:07.945876'),(110,0,3,'2024-04-02 02:20:07.222177'),(111,0,3,'2024-04-03 02:20:30.122833'),(112,0,3,'2024-04-04 02:20:12.602334'),(113,0,3,'2024-04-05 02:20:12.526449'),(114,0,3,'2024-04-06 02:20:12.637855'),(115,0,3,'2024-04-07 02:20:13.674699'),(116,0,3,'2024-04-08 02:20:12.623008'),(117,0,3,'2024-04-09 02:20:12.918836'),(118,0,3,'2024-04-10 02:20:20.287725'),(119,0,3,'2024-04-11 02:20:29.983082'),(120,0,3,'2024-04-12 02:20:20.574119'),(121,0,3,'2024-04-13 02:20:28.522660'),(122,0,3,'2024-04-14 02:20:07.272129'),(123,0,3,'2024-04-15 02:20:18.316610'),(124,0,3,'2024-04-16 02:20:08.950649'),(125,0,3,'2024-04-17 02:20:08.777573'),(126,0,3,'2024-04-18 02:20:24.819347'),(127,0,3,'2024-04-19 02:20:04.188787'),(128,0,3,'2024-04-20 02:20:05.347385'),(129,0,3,'2024-04-21 02:20:04.242119'),(130,0,3,'2024-04-22 02:20:04.425896'),(131,0,3,'2024-04-23 02:20:04.302653'),(132,0,3,'2024-04-24 02:20:05.404986'),(133,0,3,'2024-04-25 02:20:04.262109'),(134,0,3,'2024-04-26 02:20:05.352749'),(135,0,3,'2024-04-27 02:20:05.129232'),(136,0,3,'2024-04-28 02:20:04.272367'),(137,0,3,'2024-04-29 02:20:04.369879'),(138,0,3,'2024-04-30 02:20:04.971221'),(139,0,3,'2024-05-01 02:20:04.278229'),(140,0,3,'2024-05-02 02:20:05.016480'),(141,0,3,'2024-05-03 02:20:04.885724'),(142,0,3,'2024-05-04 02:20:04.272920'),(143,0,3,'2024-05-05 02:20:04.422261'),(144,0,3,'2024-05-06 02:20:04.343145'),(145,0,3,'2024-05-07 02:20:23.124766'),(146,0,3,'2024-05-08 02:20:26.071852'),(147,0,3,'2024-05-09 02:20:06.362624'),(148,0,3,'2024-05-10 02:20:05.195864'),(149,0,3,'2024-05-11 02:20:05.582808'),(150,0,3,'2024-05-12 02:20:05.414079'),(151,0,3,'2024-05-13 02:20:05.179033'),(152,0,3,'2024-05-14 02:20:05.409668'),(153,0,3,'2024-05-15 02:20:05.435576'),(154,0,3,'2024-05-16 02:20:05.346032'),(155,0,3,'2024-05-17 02:20:05.753203'),(156,0,3,'2024-05-18 02:20:05.620849'),(157,0,3,'2024-05-19 02:20:18.139792'),(158,0,3,'2024-05-20 02:20:23.967721'),(159,0,3,'2024-05-21 02:20:05.386551'),(160,0,3,'2024-05-22 02:20:05.703172'),(161,0,3,'2024-05-23 02:20:06.251699'),(162,0,3,'2024-05-24 02:20:05.731392'),(163,0,3,'2024-05-25 02:20:05.856477'),(164,0,3,'2024-05-26 02:20:05.251224'),(165,0,3,'2024-05-27 02:20:05.253245'),(166,0,3,'2024-05-28 02:20:05.434589'),(167,0,3,'2024-05-29 02:20:05.573443'),(168,0,3,'2024-05-30 02:20:05.778046'),(169,0,3,'2024-05-31 02:20:06.161943'),(170,0,3,'2024-06-01 02:20:05.644300'),(171,0,3,'2024-06-02 02:20:18.949270'),(172,0,3,'2024-06-03 02:20:04.049753'),(173,0,3,'2024-06-04 02:20:05.634056'),(174,0,3,'2024-06-05 02:20:05.030626'),(175,0,3,'2024-06-06 02:20:05.076193'),(176,0,3,'2024-06-07 02:20:05.434100'),(177,0,3,'2024-06-08 02:20:05.029341'),(178,0,3,'2024-06-09 02:20:04.841395'),(179,0,3,'2024-06-10 02:20:04.217920'),(180,0,3,'2024-06-11 02:20:05.145001'),(181,0,3,'2024-06-12 02:20:05.416377'),(182,0,3,'2024-06-13 02:20:26.138465'),(183,0,3,'2024-06-14 02:20:05.495114'),(184,0,3,'2024-06-15 02:20:05.600458'),(185,0,3,'2024-06-16 02:20:05.528050'),(186,0,3,'2024-06-17 02:20:04.821528'),(187,0,3,'2024-06-18 02:20:05.748851'),(188,0,3,'2024-06-19 02:20:06.089153'),(189,0,3,'2024-06-20 02:20:05.645624'),(190,0,3,'2024-06-21 02:20:05.865979'),(191,0,3,'2024-06-22 02:20:05.432138'),(192,0,3,'2024-06-23 02:20:05.555345'),(193,0,3,'2024-06-24 02:20:06.059590'),(194,0,3,'2024-06-25 02:20:05.697383'),(195,0,3,'2024-06-26 02:20:06.190032'),(196,0,3,'2024-06-27 02:20:05.666443'),(197,0,3,'2024-06-28 02:20:05.703290'),(198,0,3,'2024-06-29 02:20:05.653710'),(199,0,3,'2024-06-30 02:20:16.528648'),(200,0,3,'2024-07-01 02:20:04.324222'),(201,0,3,'2024-07-02 02:20:04.841677'),(202,0,3,'2024-07-03 02:20:05.287629'),(203,0,3,'2024-07-04 02:20:15.522520'),(204,0,3,'2024-07-05 02:20:04.273740'),(205,0,3,'2024-07-06 02:20:04.243280'),(206,0,3,'2024-07-07 02:20:04.165301'),(207,0,3,'2024-07-08 02:20:04.213348'),(208,0,3,'2024-07-09 02:20:04.167245'),(209,0,3,'2024-07-10 02:20:04.276564'),(210,0,3,'2024-07-11 02:20:21.844427'),(211,0,3,'2024-07-12 02:20:05.359959'),(212,0,3,'2024-07-13 02:20:05.536108'),(213,0,3,'2024-07-14 02:20:05.343405'),(214,0,3,'2024-07-15 02:20:09.650250'),(215,0,3,'2024-07-16 02:20:05.160241'),(216,0,3,'2024-07-17 02:20:05.329511'),(217,0,3,'2024-07-18 02:20:26.926791'),(218,0,3,'2024-07-19 02:20:19.700777'),(219,0,3,'2024-07-20 02:20:06.224500'),(220,0,3,'2024-07-21 02:20:06.391665'),(221,0,3,'2024-07-22 02:20:06.321683'),(222,0,3,'2024-07-23 02:20:06.964963'),(223,0,3,'2024-07-24 02:20:06.547503'),(224,0,3,'2024-07-25 02:20:06.629090'),(225,0,3,'2024-07-26 02:20:06.566618'),(226,0,3,'2024-07-27 02:20:07.529160'),(227,0,3,'2024-07-28 02:20:06.484101'),(228,0,3,'2024-07-29 02:20:06.719214'),(229,0,3,'2024-07-30 02:20:06.882271'),(230,0,3,'2024-07-31 02:20:08.030152'),(231,0,3,'2024-08-01 02:20:06.797208'),(232,0,3,'2024-08-02 02:20:06.645748'),(233,0,3,'2024-08-03 02:20:07.128586'),(234,0,3,'2024-08-04 02:20:07.118159'),(235,0,3,'2024-08-05 02:20:05.576457'),(236,0,3,'2024-08-06 02:20:06.567965'),(237,0,3,'2024-08-07 02:20:06.853882'),(238,0,3,'2024-08-08 02:20:06.810766'),(239,0,3,'2024-08-09 02:20:08.353852'),(240,0,3,'2024-08-10 02:20:06.620110'),(241,0,3,'2024-08-11 02:20:06.788289'),(242,0,3,'2024-08-12 02:20:05.704038'),(243,0,3,'2024-08-13 02:20:06.578999'),(244,0,3,'2024-08-14 02:20:06.638427'),(245,0,3,'2024-08-15 02:20:07.225487'),(246,0,3,'2024-08-16 02:20:30.828736'),(247,0,3,'2024-08-17 02:20:20.040386'),(248,0,3,'2024-08-18 02:20:06.568597'),(249,0,3,'2024-08-19 02:20:06.803049'),(250,0,3,'2024-08-20 02:20:06.919618'),(251,0,3,'2024-08-21 02:20:06.836529'),(252,0,3,'2024-08-22 02:20:07.497186'),(253,0,3,'2024-08-23 02:20:06.726156'),(254,0,3,'2024-08-24 02:20:06.734804'),(255,0,3,'2024-08-25 02:20:06.418874'),(256,0,3,'2024-08-26 02:20:06.498677'),(257,0,3,'2024-08-27 02:20:06.645923'),(258,0,3,'2024-08-28 02:20:06.550210'),(259,0,3,'2024-08-29 02:20:06.983782'),(260,0,3,'2024-08-30 02:20:07.137536'),(261,0,3,'2024-08-31 02:20:06.976673'),(262,0,3,'2024-09-01 02:20:06.821526'),(263,0,3,'2024-09-02 02:20:29.050285'),(264,0,3,'2024-09-03 02:20:06.627643'),(265,0,3,'2024-09-04 02:20:08.344090'),(266,0,3,'2024-09-05 02:20:07.230578'),(267,0,3,'2024-09-06 02:20:07.297542'),(268,0,3,'2024-09-07 02:20:07.695765'),(269,0,3,'2024-09-08 02:20:06.009594'),(270,0,3,'2024-09-09 02:20:06.245210'),(271,0,3,'2024-09-10 02:20:07.192925'),(272,0,3,'2024-09-11 02:20:07.052686'),(273,0,3,'2024-09-12 02:20:07.274132'),(274,0,3,'2024-09-13 02:20:07.236974'),(275,0,3,'2024-09-14 02:20:07.701563'),(276,0,3,'2024-09-15 02:20:07.093707'),(277,0,3,'2024-09-16 02:20:07.329767'),(278,0,3,'2024-09-17 02:20:07.134572'),(279,0,3,'2024-09-18 02:20:07.257383'),(280,0,3,'2024-09-19 02:20:07.599693'),(281,0,3,'2024-09-20 02:20:08.328990'),(282,0,3,'2024-09-21 02:20:08.096244'),(283,0,3,'2024-09-22 02:20:08.056636'),(284,0,3,'2024-09-23 02:20:08.295823'),(285,0,3,'2024-09-24 02:20:07.889613'),(286,0,3,'2024-09-25 02:20:21.822154'),(287,0,3,'2024-09-26 02:20:07.399485'),(288,0,3,'2024-09-27 02:20:08.195042'),(289,0,3,'2024-09-28 02:20:29.732762'),(290,0,3,'2024-09-29 02:20:13.474533'),(291,0,3,'2024-09-30 02:20:14.006751'),(292,0,3,'2024-10-01 02:20:13.857495'),(293,0,3,'2024-10-02 02:20:14.519187'),(294,0,3,'2024-10-03 02:20:14.529196'),(295,0,3,'2024-10-04 02:20:16.652067'),(296,0,3,'2024-10-05 02:20:14.515151'),(297,0,3,'2024-10-06 02:20:17.203670'),(298,0,3,'2024-10-07 02:20:14.753375'),(299,0,3,'2024-10-08 02:20:14.513036'),(300,0,3,'2024-10-09 02:20:32.789053'),(301,0,3,'2024-10-10 02:20:13.361893'),(302,0,3,'2024-10-11 02:20:14.205280'),(303,0,3,'2024-10-12 02:20:14.181425'),(304,0,3,'2024-10-13 02:20:14.944202'),(305,0,3,'2024-10-14 02:20:36.229946'),(306,0,3,'2024-10-15 02:20:14.698682'),(307,0,3,'2024-10-16 02:20:21.482387'),(308,0,3,'2024-10-17 02:20:16.925327'),(309,0,3,'2024-10-18 02:20:14.934339'),(310,0,3,'2024-10-19 02:20:16.275242'),(311,0,3,'2024-10-20 02:20:19.023993'),(312,0,3,'2024-10-21 02:20:14.940721'),(313,0,3,'2024-10-22 02:20:15.298590'),(314,0,3,'2024-10-23 02:20:15.698991'),(315,0,3,'2024-10-24 02:20:15.592257'),(316,0,3,'2024-10-25 02:20:20.834609'),(317,0,3,'2024-10-26 02:20:15.925977'),(318,0,3,'2024-10-27 02:20:16.017958'),(319,0,3,'2024-10-28 02:20:14.925742'),(320,0,3,'2024-10-29 02:20:37.648406'),(321,0,3,'2024-10-30 02:20:15.457917'),(322,0,3,'2024-10-31 02:20:16.932292'),(323,0,3,'2024-11-01 02:20:16.214874'),(324,0,3,'2024-11-02 02:20:17.122626'),(325,0,3,'2024-11-03 02:20:17.170369'),(326,0,3,'2024-11-04 02:20:15.997153'),(327,0,3,'2024-11-05 02:20:17.025114'),(328,0,3,'2024-11-06 02:20:17.014203'),(329,0,3,'2024-11-07 02:20:17.044148'),(330,0,3,'2024-11-08 02:20:17.113265'),(331,0,3,'2024-11-09 02:20:21.780849'),(332,0,3,'2024-11-10 02:20:18.389270'),(333,0,3,'2024-11-11 02:20:18.236445'),(334,0,3,'2024-11-12 02:20:17.192408'),(335,0,3,'2024-11-13 02:20:16.203863'),(336,0,3,'2024-11-14 02:20:18.224904'),(337,0,3,'2024-11-15 02:20:18.717907'),(338,0,3,'2024-11-16 02:20:17.798380'),(339,0,3,'2024-11-17 02:20:40.348021'),(340,0,3,'2024-11-18 02:20:15.031808'),(341,0,3,'2024-11-19 02:20:15.650600'),(342,0,3,'2024-11-20 02:20:16.153279'),(343,0,3,'2024-11-21 02:20:20.226535'),(344,0,3,'2024-11-22 02:20:16.708305'),(345,0,3,'2024-11-23 02:20:16.650648'),(346,0,3,'2024-11-24 02:20:16.585010'),(347,0,3,'2024-11-25 02:20:16.131706'),(348,0,3,'2024-11-26 02:20:15.661325'),(349,0,3,'2024-11-27 02:20:17.442592'),(350,0,3,'2024-11-28 02:20:16.417547'),(351,0,3,'2024-11-29 02:20:16.593001'),(352,0,3,'2024-11-30 02:20:16.697380'),(353,0,3,'2024-12-01 02:20:17.365472'),(354,0,3,'2024-12-02 02:20:16.716369'),(355,0,3,'2024-12-03 02:20:17.096561'),(356,0,3,'2024-12-04 02:20:16.787007'),(357,0,3,'2024-12-05 02:20:16.367150'),(358,0,3,'2024-12-06 02:20:18.563591'),(359,0,3,'2024-12-07 02:20:16.806851'),(360,0,3,'2024-12-08 02:20:16.985233'),(361,0,3,'2024-12-09 02:20:16.425360'),(362,0,3,'2024-12-10 02:20:17.929024'),(363,0,3,'2024-12-11 02:20:18.857841'),(364,0,3,'2024-12-12 02:20:17.583827'),(365,0,3,'2024-12-13 02:20:17.213990'),(366,0,3,'2024-12-14 02:20:21.941434'),(367,0,3,'2024-12-15 02:20:16.172163'),(368,0,3,'2024-12-16 02:20:16.138681'),(369,0,3,'2024-12-17 02:20:17.247297'),(370,0,3,'2024-12-18 02:20:17.191219'),(371,0,3,'2024-12-19 02:20:17.051455'),(372,0,3,'2024-12-20 02:20:17.598714'),(373,0,3,'2024-12-21 02:20:18.052157'),(374,0,3,'2024-12-22 02:20:17.272580'),(375,0,3,'2024-12-23 02:20:16.782780'),(376,0,3,'2024-12-24 02:20:16.736031'),(377,0,3,'2024-12-25 02:20:16.618691'),(378,0,3,'2024-12-26 02:20:17.023111'),(379,0,3,'2024-12-27 02:20:17.016842'),(380,0,3,'2024-12-28 02:20:21.511800'),(381,0,3,'2024-12-29 02:20:19.803730'),(382,0,3,'2024-12-30 02:20:17.771911'),(383,0,3,'2024-12-31 02:20:17.131476'),(384,0,3,'2025-01-01 02:20:17.279386'),(385,0,3,'2025-01-02 02:20:17.459325'),(386,0,3,'2025-01-03 02:20:17.527337'),(387,0,3,'2025-01-04 02:20:18.089265'),(388,0,3,'2025-01-05 02:20:17.172436'),(389,0,3,'2025-01-06 02:20:17.658988'),(390,0,3,'2025-01-07 02:20:17.924610'),(391,0,3,'2025-01-08 02:20:18.716017'),(392,0,3,'2025-01-09 02:20:18.693086'),(393,0,3,'2025-01-10 02:20:18.721349'),(394,0,3,'2025-01-11 02:20:18.557539'),(395,0,3,'2025-01-12 02:20:18.930809'),(396,0,3,'2025-01-13 02:20:20.335298'),(397,0,3,'2025-01-14 02:20:20.109659'),(398,0,3,'2025-01-15 02:20:21.723963'),(399,0,3,'2025-01-16 02:20:19.611866'),(400,0,3,'2025-01-17 02:20:19.480895'),(401,0,3,'2025-01-18 02:20:19.850024'),(402,0,3,'2025-01-19 02:20:22.054519'),(403,0,3,'2025-01-20 02:20:20.592542'),(404,0,3,'2025-01-21 02:20:26.382515'),(405,0,3,'2025-01-22 02:20:19.773890'),(406,0,3,'2025-01-23 02:20:18.105995'),(407,0,3,'2025-01-24 02:20:18.967707'),(408,0,3,'2025-01-25 02:20:19.063701'),(409,0,3,'2025-01-26 02:20:19.249248'),(410,0,3,'2025-01-27 02:20:19.098978'),(411,0,3,'2025-01-28 02:20:18.431225'),(412,0,3,'2025-01-29 02:20:21.889360'),(413,0,3,'2025-01-30 02:20:20.166887'),(414,0,3,'2025-01-31 02:20:19.317048');
/*!40000 ALTER TABLE `api_snapshotdailycounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_snapshotdailycurrency`
--

DROP TABLE IF EXISTS `api_snapshotdailycurrency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_snapshotdailycurrency` (
  `id` int NOT NULL AUTO_INCREMENT,
  `currency_value` double NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  `currency_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_snapshotdailycur_currency_id_2b593858_fk_api_curre` (`currency_id`),
  CONSTRAINT `api_snapshotdailycur_currency_id_2b593858_fk_api_curre` FOREIGN KEY (`currency_id`) REFERENCES `api_currency` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_snapshotdailycurrency`
--

LOCK TABLES `api_snapshotdailycurrency` WRITE;
/*!40000 ALTER TABLE `api_snapshotdailycurrency` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_snapshotdailycurrency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_snapshotdailylocationcost`
--

DROP TABLE IF EXISTS `api_snapshotdailylocationcost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_snapshotdailylocationcost` (
  `id` int NOT NULL AUTO_INCREMENT,
  `location` varchar(50) NOT NULL,
  `volume_fuel` double NOT NULL,
  `volume_unit` varchar(50) NOT NULL,
  `total_cost_fuel` double NOT NULL,
  `taxes_fuel` double NOT NULL,
  `deductible` double NOT NULL,
  `total_cost_insurance` double NOT NULL,
  `total_base_hours` double NOT NULL,
  `total_overtime_hours` double NOT NULL,
  `total_cost_labor` double NOT NULL,
  `taxes_labor` double NOT NULL,
  `license_registration_cost` double NOT NULL,
  `license_plate_renewal_cost` double NOT NULL,
  `total_cost_license` double NOT NULL,
  `taxes_license` double NOT NULL,
  `total_cost_parts` double NOT NULL,
  `taxes_parts` double NOT NULL,
  `total_cost_rental` double NOT NULL,
  `total_cost_acquisition` double NOT NULL,
  `taxes_acquisition` double NOT NULL,
  `total_cost_delivery` double NOT NULL,
  `taxes_delivery` double NOT NULL,
  `currency` varchar(50) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_modified` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_snapshotdailylocationcost`
--

LOCK TABLES `api_snapshotdailylocationcost` WRITE;
/*!40000 ALTER TABLE `api_snapshotdailylocationcost` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_snapshotdailylocationcost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_snapshotdailylocationcounts`
--

DROP TABLE IF EXISTS `api_snapshotdailylocationcounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_snapshotdailylocationcounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `active_asset_count` int NOT NULL,
  `all_asset_count` int NOT NULL,
  `daily_check_count` int NOT NULL,
  `location` int NOT NULL,
  `date_of_checks` date NOT NULL,
  `date_created` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_snapshotdailylocationcounts`
--

LOCK TABLES `api_snapshotdailylocationcounts` WRITE;
/*!40000 ALTER TABLE `api_snapshotdailylocationcounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_snapshotdailylocationcounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_transferfile`
--

DROP TABLE IF EXISTS `api_transferfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_transferfile` (
  `file_id` int NOT NULL AUTO_INCREMENT,
  `file_type` varchar(150) NOT NULL,
  `file_name` longtext NOT NULL,
  `file_url` longtext NOT NULL,
  `bytes` bigint NOT NULL,
  `file_created` datetime(6) NOT NULL,
  `file_purpose` varchar(50) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `transfer_id` int DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `api_transferfile_created_by_id_eb950b6f_fk_api_detai` (`created_by_id`),
  KEY `api_transferfile_transfer_id_93e2fc4e_fk_api_asset` (`transfer_id`),
  CONSTRAINT `api_transferfile_created_by_id_eb950b6f_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_transferfile_transfer_id_93e2fc4e_fk_api_asset` FOREIGN KEY (`transfer_id`) REFERENCES `api_assettransfer` (`asset_transfer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_transferfile`
--

LOCK TABLES `api_transferfile` WRITE;
/*!40000 ALTER TABLE `api_transferfile` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_transferfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_userconfiguration`
--

DROP TABLE IF EXISTS `api_userconfiguration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_userconfiguration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date_modified` datetime(6) NOT NULL,
  `sound` tinyint(1) NOT NULL,
  `sound_percentage` int unsigned NOT NULL,
  `dashboard_layout` longtext,
  `table_filter` longtext,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_userconfiguratio_user_id_0dd3d13f_fk_api_detai` (`user_id`),
  CONSTRAINT `api_userconfiguratio_user_id_0dd3d13f_fk_api_detai` FOREIGN KEY (`user_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_userconfiguration_chk_1` CHECK ((`sound_percentage` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_userconfiguration`
--

LOCK TABLES `api_userconfiguration` WRITE;
/*!40000 ALTER TABLE `api_userconfiguration` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_userconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'api','0001_initial','2023-12-14 19:45:25.500463');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-22 13:37:27
