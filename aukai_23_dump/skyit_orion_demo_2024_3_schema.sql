-- MySQL dump 10.13  Distrib 8.4.8, for Win64 (x86_64)
--
-- Host: aukai-prod-v6-23-db.mysql.database.azure.com    Database: skyit_orion_demo_2024_3
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
-- Table structure for table `api_annualreport`
--

DROP TABLE IF EXISTS `api_annualreport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_annualreport` (
  `id` int NOT NULL AUTO_INCREMENT,
  `lifesaving_ok` tinyint(1) NOT NULL,
  `lifesaving_notes` longtext NOT NULL,
  `engine_ok` tinyint(1) NOT NULL,
  `engine_notes` longtext NOT NULL,
  `communications_ok` tinyint(1) NOT NULL,
  `communications_notes` longtext NOT NULL,
  `bilge_pump_ok` tinyint(1) NOT NULL,
  `bilge_pump_notes` longtext NOT NULL,
  `steering_controls_ok` tinyint(1) NOT NULL,
  `steering_controls_notes` longtext NOT NULL,
  `hatches_ok` tinyint(1) NOT NULL,
  `hatches_notes` longtext NOT NULL,
  `emergency_drills_ok` tinyint(1) NOT NULL,
  `emergency_drills_notes` longtext NOT NULL,
  `fire_extinguishers_ok` tinyint(1) NOT NULL,
  `fire_extinguishers_notes` longtext NOT NULL,
  `hull_ok` tinyint(1) NOT NULL,
  `hull_notes` longtext NOT NULL,
  `electrical_ok` tinyint(1) NOT NULL,
  `electrical_notes` longtext NOT NULL,
  `lights_ok` tinyint(1) NOT NULL,
  `lights_notes` longtext NOT NULL,
  `fuel_systems_ok` tinyint(1) NOT NULL,
  `fuel_systems_notes` longtext NOT NULL,
  `anchoring_ok` tinyint(1) NOT NULL,
  `anchoring_notes` longtext NOT NULL,
  `guard_rails_lines_ok` tinyint(1) NOT NULL,
  `guard_rails_lines_notes` longtext NOT NULL,
  `crew_qualifications_ok` tinyint(1) NOT NULL,
  `crew_qualifications_notes` longtext NOT NULL,
  `signature_name` varchar(100) DEFAULT NULL,
  `signature_date` varchar(100) DEFAULT NULL,
  `VIN_id` varchar(100) NOT NULL,
  `file_id` int NOT NULL,
  `changed_this_year` tinyint(1) NOT NULL,
  `damaged_this_year` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_annualreport_VIN_id_3faed4f1_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_annualreport_file_id_c90b0f55_fk_api_assetfile_file_id` (`file_id`),
  CONSTRAINT `api_annualreport_file_id_c90b0f55_fk_api_assetfile_file_id` FOREIGN KEY (`file_id`) REFERENCES `api_assetfile` (`file_id`),
  CONSTRAINT `api_annualreport_VIN_id_3faed4f1_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_annualreport`
--

LOCK TABLES `api_annualreport` WRITE;
/*!40000 ALTER TABLE `api_annualreport` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_annualreport` ENABLE KEYS */;
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
  `lifesaving_equipments` tinyint(1) DEFAULT NULL,
  `engine_and_all_mechanical` tinyint(1) DEFAULT NULL,
  `communication` tinyint(1) DEFAULT NULL,
  `steering_and_hydraulics` tinyint(1) DEFAULT NULL,
  `electrical` tinyint(1) DEFAULT NULL,
  `navigation_and_strobe_lights` tinyint(1) DEFAULT NULL,
  `fuel_systems` tinyint(1) DEFAULT NULL,
  `anchoring_system` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`daily_check_id`),
  KEY `api_assetdailychecksmodel_VIN_id_d3577052_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_assetdailychecks_created_by_id_029fc175_fk_api_detai` (`created_by_id`),
  KEY `api_assetdailychecks_location_id_f76e3d5a_fk_api_locat` (`location_id`),
  KEY `api_assetdailychecks_modified_by_id_4fbf1c05_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_assetdailychecks_created_by_id_029fc175_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetdailychecks_location_id_f76e3d5a_fk_api_locat` FOREIGN KEY (`location_id`) REFERENCES `api_locationmodel` (`location_id`),
  CONSTRAINT `api_assetdailychecks_modified_by_id_4fbf1c05_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assetdailychecksmodel_VIN_id_d3577052_fk_api_assetmodel_VIN` FOREIGN KEY (`VIN_id`) REFERENCES `api_assetmodel` (`VIN`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetdailychecksmodel`
--

LOCK TABLES `api_assetdailychecksmodel` WRITE;
/*!40000 ALTER TABLE `api_assetdailychecksmodel` DISABLE KEYS */;
INSERT INTO `api_assetdailychecksmodel` VALUES (1,'Camellia-Shipping-LLC-dc-1',1,-1,400,0,'2024-05-15 11:15:40.457697','2024-05-15 11:15:40.471185',1,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,'AIR-PJET-002',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'Camellia-Shipping-LLC-dc-2',1,-1,180,0,'2024-05-15 11:16:01.940862','2024-05-15 11:16:01.955891',1,NULL,NULL,75,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,'AIR-PJET-003',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,'Camellia-Shipping-LLC-dc-3',1,-1,500,0,'2024-08-27 00:26:22.501490','2024-08-27 00:26:22.531372',1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1,1,1,NULL,NULL,'AIR-PJET-001',1,1,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(4,'Camellia-Shipping-LLC-dc-4',1,-1,200,0,'2024-08-27 04:53:37.838515','2024-08-27 04:53:37.852284',1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1,1,1,NULL,NULL,'AIR-PJET-003',1,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(5,'Camellia-Shipping-LLC-dc-5',1,-1,500,0,'2024-09-26 01:45:11.845345','2024-09-26 01:45:11.859211',1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1,NULL,1,NULL,NULL,'BEL-FJET-006',1,3,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetdailychecksmodelhistory`
--

LOCK TABLES `api_assetdailychecksmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_assetdailychecksmodelhistory` DISABLE KEYS */;
INSERT INTO `api_assetdailychecksmodelhistory` VALUES (1,'Camellia-Shipping-LLC-dc-1',1,-1,400,0,'2024-05-15 11:15:40.485602',1,NULL,NULL,50,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,1,1,1),(2,'Camellia-Shipping-LLC-dc-2',1,-1,180,0,'2024-05-15 11:16:01.971535',1,NULL,NULL,75,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,1,NULL,NULL,NULL,NULL,2,1,1),(3,'Camellia-Shipping-LLC-dc-3',1,-1,500,0,'2024-08-27 00:26:22.545614',1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1,1,1,NULL,NULL,3,1,1),(4,'Camellia-Shipping-LLC-dc-4',1,-1,200,0,'2024-08-27 04:53:37.865448',1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1,1,1,NULL,NULL,4,3,1),(5,'Camellia-Shipping-LLC-dc-5',1,-1,500,0,'2024-09-26 01:45:11.873045',1,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,1,NULL,1,NULL,NULL,5,3,1);
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
  `vendor_email` varchar(50) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetissuecategory`
--

LOCK TABLES `api_assetissuecategory` WRITE;
/*!40000 ALTER TABLE `api_assetissuecategory` DISABLE KEYS */;
INSERT INTO `api_assetissuecategory` VALUES (1,'E','Engine','2024-01-01 00:00:00.000000','2024-01-01 00:00:00.000000',1,1),(2,'H','Hydraulic','2024-01-01 00:00:00.000000','2024-01-01 00:00:00.000000',1,1),(3,'E','Electrical','2024-01-01 00:00:00.000000','2024-01-01 00:00:00.000000',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetissuemodel`
--

LOCK TABLES `api_assetissuemodel` WRITE;
/*!40000 ALTER TABLE `api_assetissuemodel` DISABLE KEYS */;
INSERT INTO `api_assetissuemodel` VALUES (1,'Camellia-Shipping-LLC-i-1','Leak','Leak','Critical','Other',0,'2024-05-15 11:03:58.057697','2024-05-15 11:03:59.610546','BEL-FJET-005',NULL,2,1,1,1,1),(2,'Camellia-Shipping-LLC-i-2','Engine Oil Leak','Engine Oil Leak','Critical','Other',0,'2024-08-27 00:18:26.830225','2024-08-27 00:18:28.147651','BEL-FJET-005',NULL,1,1,2,1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetissuemodelhistory`
--

LOCK TABLES `api_assetissuemodelhistory` WRITE;
/*!40000 ALTER TABLE `api_assetissuemodelhistory` DISABLE KEYS */;
INSERT INTO `api_assetissuemodelhistory` VALUES (1,'Camellia-Shipping-LLC-i-1','Leak','Leak','Critical','Other',0,'2024-05-15 11:03:59.622072',NULL,1,1,1,NULL),(2,'Camellia-Shipping-LLC-i-1','Leak','Leak','Critical','Other',0,'2024-05-15 11:04:26.041502',NULL,1,1,1,1),(3,'Camellia-Shipping-LLC-i-2','Engine Oil Leak','Engine Oil Leak','Critical','Other',0,'2024-08-27 00:18:28.161288',NULL,2,2,1,NULL),(4,'Camellia-Shipping-LLC-i-2','Engine Oil Leak','Engine Oil Leak','Critical','Other',0,'2024-08-27 00:19:08.353748',NULL,2,2,1,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetlog`
--

LOCK TABLES `api_assetlog` WRITE;
/*!40000 ALTER TABLE `api_assetlog` DISABLE KEYS */;
INSERT INTO `api_assetlog` VALUES (1,'event','issue','Camellia-Shipping-LLC-i-1','Event: Issue Camellia-Shipping-LLC-i-1 was added.','2024-05-15 11:03:59.809322','2024-05-15 11:03:59.809375','BEL-FJET-005',1,1,1),(2,'event','issue','Camellia-Shipping-LLC-i-1','Event: Issue Camellia-Shipping-LLC-i-1 was added to repair Camellia-Shipping-LLC-r-1.','2024-05-15 11:04:26.049073','2024-05-15 11:04:26.049108','BEL-FJET-005',1,1,1),(3,'event','repair','Camellia-Shipping-LLC-r-1','Event: Repair order Camellia-Shipping-LLC-r-1 was created.','2024-05-15 11:04:26.146521','2024-05-15 11:04:26.146561','BEL-FJET-005',1,1,1),(4,'event','repair','Camellia-Shipping-LLC-r-1','Event: Asset was set to inoperative and last proccess was set to Repair Camellia-Shipping-LLC-r-1.','2024-05-15 11:04:26.174421','2024-05-15 11:04:26.174460','BEL-FJET-005',1,1,1),(5,'event','maintenance','Camellia-Shipping-LLC-m-1','Event: Maintenance request Camellia-Shipping-LLC-m-1 was created.','2024-05-15 11:04:49.602725','2024-05-15 11:04:49.602766','BEL-FJET-005',1,1,1),(6,'event','maintenance','Camellia-Shipping-LLC-m-1','Event: Asset was set to inoperative and last proccess was set to maintenance Camellia-Shipping-LLC-m-1.','2024-05-15 11:04:49.655687','2024-05-15 11:04:49.655736','BEL-FJET-005',1,1,1),(7,'event','operator check','Camellia-Shipping-LLC-dc-1','Event: Operator check Camellia-Shipping-LLC-dc-1 was added. Asset hours were set to 400.0.','2024-05-15 11:15:40.675060','2024-05-15 11:15:40.675099','AIR-PJET-002',1,1,1),(8,'event','operator check','Camellia-Shipping-LLC-dc-2','Event: Operator check Camellia-Shipping-LLC-dc-2 was added. Asset hours were set to 180.0.','2024-05-15 11:16:02.034185','2024-05-15 11:16:02.034225','AIR-PJET-003',1,1,1),(9,'event','issue','Camellia-Shipping-LLC-i-2','Event: Issue Camellia-Shipping-LLC-i-2 was added.','2024-08-27 00:18:28.326049','2024-08-27 00:18:28.326096','BEL-FJET-005',1,2,1),(10,'event','issue','Camellia-Shipping-LLC-i-2','Event: Issue Camellia-Shipping-LLC-i-2 was added to repair Camellia-Shipping-LLC-r-2.','2024-08-27 00:19:08.361022','2024-08-27 00:19:08.361062','BEL-FJET-005',1,2,1),(11,'event','repair','Camellia-Shipping-LLC-r-2','Event: Repair order Camellia-Shipping-LLC-r-2 was created.','2024-08-27 00:19:08.431209','2024-08-27 00:19:08.431249','BEL-FJET-005',1,2,1),(12,'event','repair','Camellia-Shipping-LLC-r-2','Event: Asset was set to inoperative and last proccess was set to Repair Camellia-Shipping-LLC-r-2.','2024-08-27 00:19:08.455576','2024-08-27 00:19:08.455620','BEL-FJET-005',1,2,1),(13,'event','operator check','Camellia-Shipping-LLC-dc-3','Event: Operator check Camellia-Shipping-LLC-dc-3 was added. Asset hours were set to 500.0.','2024-08-27 00:26:22.723231','2024-08-27 00:26:22.723264','AIR-PJET-001',1,1,1),(14,'event','operator check','Camellia-Shipping-LLC-dc-4','Event: Operator check Camellia-Shipping-LLC-dc-4 was added. Asset hours were set to 200.0.','2024-08-27 04:53:38.123751','2024-08-27 04:53:38.123786','AIR-PJET-003',1,3,1),(15,'event','operator check','Camellia-Shipping-LLC-dc-5','Event: Operator check Camellia-Shipping-LLC-dc-5 was added. Asset hours were set to 500.0.','2024-09-26 01:45:12.049612','2024-09-26 01:45:12.049659','BEL-FJET-006',1,3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetmanufacturermodel`
--

LOCK TABLES `api_assetmanufacturermodel` WRITE;
/*!40000 ALTER TABLE `api_assetmanufacturermodel` DISABLE KEYS */;
INSERT INTO `api_assetmanufacturermodel` VALUES (1,'Boeing','2024-03-14 15:58:02.852385','2024-03-14 15:58:02.852449',1,1),(2,'Lockheed Martin','2024-03-14 15:59:45.556997','2024-03-14 15:59:45.557092',1,1),(3,'Boeing','2024-03-14 16:00:48.558583','2024-03-14 16:00:48.558697',1,1),(4,'Leonardo','2024-03-14 16:01:29.336346','2024-03-14 16:01:29.336408',1,1),(5,'Airbus','2024-03-14 16:02:09.182860','2024-03-14 16:02:09.182926',1,1),(6,'General Atomics','2024-03-14 16:03:04.475911','2024-03-14 16:03:04.475977',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetmanufacturermodel_asset_type`
--

LOCK TABLES `api_assetmanufacturermodel_asset_type` WRITE;
/*!40000 ALTER TABLE `api_assetmanufacturermodel_asset_type` DISABLE KEYS */;
INSERT INTO `api_assetmanufacturermodel_asset_type` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6);
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
  `cost_centre_id` int DEFAULT NULL,
  `lifespan_years` int NOT NULL,
  PRIMARY KEY (`VIN`),
  KEY `api_assetmodel_company_id_f122d18f_fk_api_company_company_id` (`company_id`),
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
  KEY `api_assetmodel_cost_centre_id_a29a81e9_fk_api_costc` (`cost_centre_id`),
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
INSERT INTO `api_assetmodel` VALUES ('AIR-PJET-001',NULL,'Active',NULL,'CFGXK',NULL,'2017-01-01',NULL,NULL,NULL,'Null','hours',-1,500,NULL,NULL,21000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:22:57.705248',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,1,1,5,1,6,1,1,NULL,NULL,15),('AIR-PJET-002',NULL,'Active',NULL,'CFHSJ',NULL,'2019-01-01',NULL,NULL,NULL,'Null','hours',-1,400,NULL,NULL,28000000,6.573770491803279,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:23:15.964929',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,2,1,5,1,3,1,1,NULL,NULL,15),('AIR-PJET-003',NULL,'Active',NULL,'CFGST',NULL,'2016-01-01',NULL,NULL,NULL,'Null','hours',-1,200,NULL,NULL,37000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:23:34.167243',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,3,1,5,1,4,1,1,NULL,NULL,15),('BEL-FJET-001',NULL,'Active',NULL,'CFISU',NULL,'2014-01-01',NULL,NULL,NULL,'Null','hours',-1,930,NULL,NULL,670000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:14:44.991809',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,1,1,3,1,6,1,1,NULL,NULL,15),('BEL-FJET-002',NULL,'Active',NULL,'CFPAI',NULL,'2018-01-01',NULL,NULL,NULL,'Null','hours',-1,220,NULL,NULL,460000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:15:02.272996',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,2,1,3,1,3,1,1,NULL,NULL,15),('BEL-FJET-003',NULL,'Active',NULL,'CFUIA',NULL,'2017-01-01',NULL,NULL,NULL,'Null','hours',-1,500,NULL,NULL,520000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:15:18.960030',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,3,1,3,1,4,1,1,NULL,NULL,15),('BEL-FJET-004',NULL,'Active',NULL,'CFPLA',NULL,'2013-01-01',NULL,NULL,NULL,'Null','hours',-1,800,NULL,NULL,701000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:15:35.273612',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,1,1,3,1,7,1,1,NULL,NULL,15),('BEL-FJET-005',NULL,'Inoperative',NULL,'CFJAK',NULL,'2019-01-01',NULL,NULL,NULL,'Repair','hours',-1,500,NULL,NULL,380009868.5320647,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-08-27 00:19:08.447441',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,2,1,3,1,5,1,1,NULL,NULL,15),('BEL-FJET-006',NULL,'Active',NULL,'CFTRA',NULL,'2014-01-01',NULL,NULL,NULL,'Null','hours',-1,500,NULL,NULL,220000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:16:55.172055',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,3,1,3,1,7,1,1,NULL,NULL,15),('BOE-APLN-001',NULL,'Active',NULL,'CFRTA',NULL,'2018-01-01',NULL,NULL,NULL,'Null','hours',-1,8100,NULL,NULL,787000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 16:37:58.783601',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,2,1,1,1,6,1,1,NULL,NULL,15),('BOE-APLN-002',NULL,'Active',NULL,'CFPLZ',NULL,'2016-01-01',NULL,NULL,NULL,'Null','hours',-1,390,NULL,NULL,377000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 16:58:20.298223',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,2,1,1,1,3,1,1,NULL,NULL,15),('BOE-APLN-003',NULL,'Active',NULL,'CFYHZ',NULL,'2018-01-01',NULL,NULL,NULL,'Null','hours',-1,200,NULL,NULL,652000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 16:58:42.766464',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,3,1,1,1,3,1,1,NULL,NULL,15),('BOE-APLN-004',NULL,'Active',NULL,'CFKMA',NULL,'2019-01-01',NULL,NULL,NULL,'Null','hours',-1,200,NULL,NULL,380000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 16:59:19.292731',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,1,1,1,1,4,1,1,NULL,NULL,15),('BOE-APLN-005',NULL,'Active',NULL,'CFNYA',NULL,'2017-01-01',NULL,NULL,NULL,'Null','hours',-1,400,NULL,NULL,777000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 16:59:40.971584',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,3,1,1,1,2,1,1,NULL,NULL,15),('GAT-RCON-001',NULL,'Active',NULL,'CFBYA',NULL,'2016-01-01',NULL,NULL,NULL,'Null','hours',-1,500,NULL,NULL,46000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:25:58.978937',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,1,1,6,1,6,1,1,NULL,NULL,15),('GAT-RCON-002',NULL,'Active',NULL,'CFDJK',NULL,'2017-01-01',NULL,NULL,NULL,'Null','hours',-1,800,NULL,NULL,34000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:26:17.790370',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,2,1,6,1,3,1,1,NULL,NULL,15),('GAT-RCON-003',NULL,'Active',NULL,'CFBZA',NULL,'2018-01-01',NULL,NULL,NULL,'Null','hours',-1,200,NULL,NULL,45000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:26:34.727933',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,1,1,6,1,4,1,1,NULL,NULL,15),('LEO-HEL-001',NULL,'Active',NULL,'CFCGF',NULL,'2019-01-01',NULL,NULL,NULL,'Null','hours',-1,190,NULL,NULL,44000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:19:43.991837',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,3,1,4,1,6,1,1,NULL,NULL,15),('LEO-HEL-002',NULL,'Active',NULL,'N76161',NULL,'2013-01-01',NULL,NULL,NULL,'Null','hours',-1,490,NULL,NULL,39000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:20:02.560036',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,1,1,4,1,3,1,1,NULL,NULL,15),('LEO-HEL-003',NULL,'Active',NULL,'N71651',NULL,'2016-01-01',NULL,NULL,NULL,'Null','hours',-1,440,NULL,NULL,29000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:20:20.069690',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,3,1,4,1,4,1,1,NULL,NULL,15),('LKM-CARG-001',NULL,'Active',NULL,'N91816',NULL,'2013-01-01',NULL,NULL,NULL,'Null','hours',-1,300,NULL,NULL,50000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:07:58.357518',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,1,1,2,1,6,1,1,NULL,NULL,15),('LKM-CARG-002',NULL,'Active',NULL,'N1827Z',NULL,'2018-01-01',NULL,NULL,NULL,'Null','hours',-1,600,NULL,NULL,48000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:08:26.702406',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,2,1,2,1,3,1,1,NULL,NULL,15),('LKM-CARG-003',NULL,'Active',NULL,'N123FA',NULL,'2017-01-01',NULL,NULL,NULL,'Null','hours',-1,770,NULL,NULL,38000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:08:51.647174',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,1,1,2,1,4,1,1,NULL,NULL,15),('LKM-CARG-004',NULL,'Active',NULL,'N871GA',NULL,'2017-01-01',NULL,NULL,NULL,'Null','hours',-1,780,NULL,NULL,28400000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:09:22.441326',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,3,1,2,1,7,1,1,NULL,NULL,15),('LKM-CARG-005',NULL,'Active',NULL,'N182YA',NULL,'2016-01-01',NULL,NULL,NULL,'Null','hours',-1,400,NULL,NULL,60000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,'NA','2024-03-14','2024-03-14 17:09:48.231361',NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',1,NULL,1,1,2,1,5,1,1,NULL,NULL,15);
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetmodelhistory`
--

LOCK TABLES `api_assetmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_assetmodelhistory` DISABLE KEYS */;
INSERT INTO `api_assetmodelhistory` VALUES (1,'2024-03-14 16:37:58.792229',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BOE-APLN-001',NULL,NULL,1,1,1,NULL,6,1,1,NULL),(2,'2024-03-14 16:58:20.306618',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BOE-APLN-002',NULL,NULL,1,1,1,NULL,3,1,1,NULL),(3,'2024-03-14 16:58:42.775904',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BOE-APLN-003',NULL,NULL,1,1,1,NULL,3,1,1,NULL),(4,'2024-03-14 16:59:19.304059',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BOE-APLN-004',NULL,NULL,1,1,1,NULL,4,1,1,NULL),(5,'2024-03-14 16:59:40.980723',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BOE-APLN-005',NULL,NULL,1,1,1,NULL,2,1,1,NULL),(6,'2024-03-14 17:07:58.369991',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'LKM-CARG-001',NULL,NULL,1,1,2,NULL,6,1,1,NULL),(7,'2024-03-14 17:08:26.711776',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'LKM-CARG-002',NULL,NULL,1,1,2,NULL,3,1,1,NULL),(8,'2024-03-14 17:08:51.663076',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'LKM-CARG-003',NULL,NULL,1,1,2,NULL,4,1,1,NULL),(9,'2024-03-14 17:09:22.450722',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'LKM-CARG-004',NULL,NULL,1,1,2,NULL,7,1,1,NULL),(10,'2024-03-14 17:09:48.239362',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'LKM-CARG-005',NULL,NULL,1,1,2,NULL,5,1,1,NULL),(11,'2024-03-14 17:14:45.001834',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BEL-FJET-001',NULL,NULL,1,1,3,NULL,6,1,1,NULL),(12,'2024-03-14 17:15:02.291124',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BEL-FJET-002',NULL,NULL,1,1,3,NULL,3,1,1,NULL),(13,'2024-03-14 17:15:18.967932',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BEL-FJET-003',NULL,NULL,1,1,3,NULL,4,1,1,NULL),(14,'2024-03-14 17:15:35.282268',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BEL-FJET-004',NULL,NULL,1,1,3,NULL,7,1,1,NULL),(15,'2024-03-14 17:15:54.911039',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BEL-FJET-005',NULL,NULL,1,1,3,NULL,5,1,1,NULL),(16,'2024-03-14 17:16:55.203116',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BEL-FJET-006',NULL,NULL,1,1,3,NULL,7,1,1,NULL),(17,'2024-03-14 17:19:44.001701',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'LEO-HEL-001',NULL,NULL,1,1,4,NULL,6,1,1,NULL),(18,'2024-03-14 17:20:02.576898',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'LEO-HEL-002',NULL,NULL,1,1,4,NULL,3,1,1,NULL),(19,'2024-03-14 17:20:20.081903',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'LEO-HEL-003',NULL,NULL,1,1,4,NULL,4,1,1,NULL),(20,'2024-03-14 17:22:57.714842',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'AIR-PJET-001',NULL,NULL,1,1,5,NULL,6,1,1,NULL),(21,'2024-03-14 17:23:15.974224',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'AIR-PJET-002',NULL,NULL,1,1,5,NULL,3,1,1,NULL),(22,'2024-03-14 17:23:34.176005',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'AIR-PJET-003',NULL,NULL,1,1,5,NULL,4,1,1,NULL),(23,'2024-03-14 17:25:58.986331',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'GAT-RCON-001',NULL,NULL,1,1,6,NULL,6,1,1,NULL),(24,'2024-03-14 17:26:17.797706',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'GAT-RCON-002',NULL,NULL,1,1,6,NULL,3,1,1,NULL),(25,'2024-03-14 17:26:34.738030',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','neither',-1,-1,NULL,0,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'GAT-RCON-003',NULL,NULL,1,1,6,NULL,4,1,1,NULL),(26,'2024-05-15 11:04:26.208673',NULL,'Inoperative',NULL,NULL,NULL,NULL,NULL,'Repair','hours',-1,400,NULL,380000000,6.573770491803279,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BEL-FJET-005','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',NULL,1,1,3,1,5,1,1,NULL),(27,'2024-05-15 11:04:49.693925',NULL,'Inoperative',NULL,NULL,NULL,NULL,NULL,'Maintenance','hours',-1,400,NULL,380000000,6.573770491803279,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BEL-FJET-005','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',NULL,1,1,3,1,5,1,1,NULL),(28,'2024-05-15 11:06:50.573175',NULL,'Inoperative',NULL,NULL,NULL,NULL,NULL,'Maintenance','hours',-1,400,NULL,380005500,6.573770491803279,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BEL-FJET-005','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',NULL,1,1,3,1,5,1,1,NULL),(29,'2024-05-15 11:09:30.149010',NULL,'Inoperative',NULL,NULL,NULL,NULL,NULL,'Maintenance','hours',-1,400,NULL,380009185.986515,6.573770491803279,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BEL-FJET-005','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',NULL,1,1,3,1,5,1,1,NULL),(30,'2024-05-15 11:09:41.469727',NULL,'Inoperative',NULL,NULL,NULL,NULL,NULL,'Maintenance','hours',-1,400,NULL,380009868.5320647,6.573770491803279,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BEL-FJET-005','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',NULL,1,1,3,1,5,1,1,NULL),(31,'2024-05-15 11:15:40.707849',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','hours',-1,400,NULL,28000000,6.573770491803279,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'AIR-PJET-002','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',NULL,1,1,5,1,3,1,1,NULL),(32,'2024-05-15 11:16:02.069135',NULL,'Active',NULL,NULL,NULL,NULL,NULL,'Null','hours',-1,180,NULL,37000000,2.9672131147540983,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'AIR-PJET-003','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',NULL,1,1,5,1,4,1,1,NULL),(33,'2024-08-27 00:19:08.488662',NULL,'Inoperative','CFJAK',NULL,NULL,NULL,NULL,'Repair','hours',-1,500,NULL,380009868.5320647,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BEL-FJET-005','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',NULL,2,1,3,1,5,1,1,NULL),(34,'2024-08-27 00:26:22.756763',NULL,'Active','CFGXK',NULL,NULL,NULL,NULL,'Null','hours',-1,500,NULL,21000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'AIR-PJET-001','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',NULL,1,1,5,1,6,1,1,NULL),(35,'2024-08-27 04:53:38.158438',NULL,'Active','CFGST',NULL,NULL,NULL,NULL,'Null','hours',-1,200,NULL,37000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'AIR-PJET-003','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',NULL,3,1,5,1,4,1,1,NULL),(36,'2024-09-26 01:45:12.086305',NULL,'Active','CFTRA',NULL,NULL,NULL,NULL,'Null','hours',-1,500,NULL,220000000,0,0,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,-7,'BEL-FJET-006','aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',NULL,3,1,3,1,7,1,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetrequestjustificationmodel`
--

LOCK TABLES `api_assetrequestjustificationmodel` WRITE;
/*!40000 ALTER TABLE `api_assetrequestjustificationmodel` DISABLE KEYS */;
INSERT INTO `api_assetrequestjustificationmodel` VALUES (1,'New Operation'),(2,'Life Cycle Replacement'),(3,'Operational Change'),(4,'Equipment Failure'),(5,'Accident'),(6,'Unexpected');
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
  `created_by_id` int DEFAULT NULL,
  `disposal_id` int DEFAULT NULL,
  `equipment_id` int NOT NULL,
  `justification_id` int NOT NULL,
  `location_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `cost_centre_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_assetrequestmode_business_unit_id_1a6162e8_fk_api_busin` (`business_unit_id`),
  KEY `api_assetrequestmode_created_by_id_d8e64481_fk_api_detai` (`created_by_id`),
  KEY `api_assetrequestmode_disposal_id_89a7a0e3_fk_api_asset` (`disposal_id`),
  KEY `api_assetrequestmode_equipment_id_ace308f7_fk_api_equip` (`equipment_id`),
  KEY `api_assetrequestmode_justification_id_a448f514_fk_api_asset` (`justification_id`),
  KEY `api_assetrequestmode_location_id_ed98707a_fk_api_locat` (`location_id`),
  KEY `api_assetrequestmode_modified_by_id_7f4fd728_fk_api_detai` (`modified_by_id`),
  KEY `api_assetrequestmode_vendor_id_6bd6d19d_fk_api_appro` (`vendor_id`),
  KEY `api_assetrequestmodel_VIN_id_a420f925_fk_api_assetmodel_VIN` (`VIN_id`),
  KEY `api_assetrequestmode_cost_centre_id_77d6521a_fk_api_costc` (`cost_centre_id`),
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetrequestmodel`
--

LOCK TABLES `api_assetrequestmodel` WRITE;
/*!40000 ALTER TABLE `api_assetrequestmodel` DISABLE KEYS */;
INSERT INTO `api_assetrequestmodel` VALUES (1,'Camellia-Shipping-LLC-ar-1','2024-03-20 07:00:00.000000',NULL,NULL,'airbus@skyit.services','delivered','2024-03-14 16:26:22.886637','2024-03-14 16:37:59.446877',1,'BOE-APLN-001',1,1,NULL,1,1,1,1,NULL,NULL),(2,'Camellia-Shipping-LLC-ar-2','2024-03-20 07:00:00.000000',NULL,NULL,'embraer@skyit.services','delivered','2024-03-14 16:51:09.522215','2024-03-14 16:58:20.815054',1,'BOE-APLN-002',1,1,NULL,1,3,1,1,NULL,NULL),(3,'Camellia-Shipping-LLC-ar-3','2024-03-20 07:00:00.000000',NULL,NULL,'bombardier@skyit.services','delivered','2024-03-14 16:51:46.717699','2024-03-14 16:59:41.239532',1,'BOE-APLN-005',1,1,NULL,1,6,1,1,NULL,NULL),(4,'Camellia-Shipping-LLC-ar-4','2024-03-27 07:00:00.000000',NULL,NULL,'airbus@skyit.services','delivered','2024-03-14 16:52:42.039537','2024-03-14 16:59:19.728606',1,'BOE-APLN-004',1,1,NULL,1,1,1,1,NULL,NULL),(5,'Camellia-Shipping-LLC-ar-5','2024-03-30 07:00:00.000000',NULL,NULL,'embraer@skyit.services','delivered','2024-03-14 16:53:24.785860','2024-03-14 16:58:42.969083',1,'BOE-APLN-003',1,1,NULL,1,3,1,1,NULL,NULL),(6,'Camellia-Shipping-LLC-ar-6','2024-03-17 07:00:00.000000',NULL,NULL,'antonov@skyit.services','delivered','2024-03-14 17:02:44.183889','2024-03-14 17:09:48.473235',1,'LKM-CARG-005',1,1,NULL,2,1,1,1,NULL,NULL),(7,'Camellia-Shipping-LLC-ar-7','2024-03-18 07:00:00.000000',NULL,NULL,'ilyushin@skyit.services','delivered','2024-03-14 17:03:27.982024','2024-03-14 17:09:23.129534',1,'LKM-CARG-004',1,1,NULL,2,3,1,1,NULL,NULL),(8,'Camellia-Shipping-LLC-ar-8','2024-03-24 07:00:00.000000',NULL,NULL,'airbus@skyit.services','delivered','2024-03-14 17:04:18.551920','2024-03-14 17:08:51.971633',1,'LKM-CARG-003',1,1,NULL,2,6,1,1,NULL,NULL),(9,'Camellia-Shipping-LLC-ar-9','2024-03-28 07:00:00.000000',NULL,NULL,'boeing@skyit.services','delivered','2024-03-14 17:05:04.958465','2024-03-14 17:08:27.048473',1,'LKM-CARG-002',1,1,NULL,2,1,1,1,NULL,NULL),(10,'Camellia-Shipping-LLC-ar-10','2024-03-31 07:00:00.000000',NULL,NULL,'antonov@skyit.services','delivered','2024-03-14 17:05:48.583592','2024-03-14 17:07:58.731237',1,'LKM-CARG-001',1,1,NULL,2,3,1,1,NULL,NULL),(11,'Camellia-Shipping-LLC-ar-11','2024-03-17 07:00:00.000000',NULL,NULL,'lockheed@skyit.services','delivered','2024-03-14 17:10:55.323962','2024-03-14 17:16:55.718361',1,'BEL-FJET-006',1,1,NULL,3,1,1,1,NULL,NULL),(12,'Camellia-Shipping-LLC-ar-12','2024-03-24 07:00:00.000000',NULL,NULL,'boeing@skyit.services','delivered','2024-03-14 17:11:34.475284','2024-03-14 17:15:55.090207',1,'BEL-FJET-005',1,1,NULL,3,3,1,1,NULL,NULL),(13,'Camellia-Shipping-LLC-ar-13','2024-03-27 07:00:00.000000',NULL,NULL,'northrop@skyit.services','delivered','2024-03-14 17:12:23.159510','2024-03-14 17:15:35.462475',1,'BEL-FJET-004',1,1,NULL,3,3,1,1,NULL,NULL),(14,'Camellia-Shipping-LLC-ar-14','2024-03-20 07:00:00.000000',NULL,NULL,'northrop@skyit.services','delivered','2024-03-14 17:12:52.379931','2024-03-14 17:15:19.145273',1,'BEL-FJET-003',1,1,NULL,3,1,1,1,NULL,NULL),(15,'Camellia-Shipping-LLC-ar-15','2024-03-20 07:00:00.000000',NULL,NULL,'boeing@skyit.services','delivered','2024-03-14 17:13:20.817696','2024-03-14 17:15:02.744674',1,'BEL-FJET-002',1,1,NULL,3,3,1,1,NULL,NULL),(16,'Camellia-Shipping-LLC-ar-16','2024-03-20 07:00:00.000000',NULL,NULL,'lockheed@skyit.services','delivered','2024-03-14 17:13:52.210900','2024-03-14 17:14:45.177861',1,'BEL-FJET-001',1,1,NULL,3,6,1,1,NULL,NULL),(17,'Camellia-Shipping-LLC-ar-17','2024-03-17 07:00:00.000000',NULL,NULL,'rolls@skyit.services','delivered','2024-03-14 17:17:52.435146','2024-03-14 17:19:44.564879',1,'LEO-HEL-001',1,1,NULL,4,1,1,1,NULL,NULL),(18,'Camellia-Shipping-LLC-ar-18','2024-03-27 07:00:00.000000',NULL,NULL,'lockheed@skyit.services','delivered','2024-03-14 17:18:24.507813','2024-03-14 17:20:02.952554',1,'LEO-HEL-002',1,1,NULL,4,1,1,1,NULL,NULL),(19,'Camellia-Shipping-LLC-ar-19','2024-03-24 07:00:00.000000',NULL,NULL,'boeing@skyit.services','delivered','2024-03-14 17:18:55.407324','2024-03-14 17:20:20.266302',1,'LEO-HEL-003',1,1,NULL,4,6,1,1,NULL,NULL),(20,'Camellia-Shipping-LLC-ar-20','2024-03-25 07:00:00.000000',NULL,NULL,'boeing@skyit.services','delivered','2024-03-14 17:21:12.233319','2024-03-14 17:23:34.343472',1,'AIR-PJET-003',1,1,NULL,5,1,1,1,NULL,NULL),(21,'Camellia-Shipping-LLC-ar-21','2024-03-27 07:00:00.000000',NULL,NULL,'translink@skyit.services','delivered','2024-03-14 17:21:43.746680','2024-03-14 17:23:16.202841',1,'AIR-PJET-002',1,1,NULL,5,3,1,1,NULL,NULL),(22,'Camellia-Shipping-LLC-ar-22','2024-03-27 07:00:00.000000',NULL,NULL,'lockheed@skyit.services','delivered','2024-03-14 17:22:16.512841','2024-03-14 17:22:57.884077',1,'AIR-PJET-001',1,1,NULL,5,3,1,1,NULL,NULL),(23,'Camellia-Shipping-LLC-ar-23','2024-03-24 07:00:00.000000',NULL,NULL,'boeing@skyit.services','delivered','2024-03-14 17:24:20.096497','2024-03-14 17:26:34.933502',1,'GAT-RCON-003',1,1,NULL,6,1,1,1,NULL,NULL),(24,'Camellia-Shipping-LLC-ar-24','2024-03-31 07:00:00.000000',NULL,NULL,'bombarder@skyit.services','delivered','2024-03-14 17:24:55.246441','2024-03-14 17:26:18.038065',1,'GAT-RCON-002',1,1,NULL,6,3,1,1,NULL,NULL),(25,'Camellia-Shipping-LLC-ar-25','2024-03-17 07:00:00.000000',NULL,NULL,'translink@skyit.services','delivered','2024-03-14 17:25:25.469790','2024-03-14 17:25:59.164730',1,'GAT-RCON-001',1,1,NULL,6,6,1,1,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assetrequestmodelhistory`
--

LOCK TABLES `api_assetrequestmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_assetrequestmodelhistory` DISABLE KEYS */;
INSERT INTO `api_assetrequestmodelhistory` VALUES (1,'Camellia-Shipping-LLC-ar-1','2024-03-20 07:00:00.000000',NULL,NULL,'airbus@skyit.services','awaiting approval','2024-03-14 16:26:22.922949',1,NULL,1,1,1,1,1,1,NULL),(2,'Camellia-Shipping-LLC-ar-1','2024-03-20 07:00:00.000000',NULL,NULL,'airbus@skyit.services','delivered','2024-03-14 16:37:59.472617',1,'BOE-APLN-001',1,1,1,1,1,1,NULL),(3,'Camellia-Shipping-LLC-ar-2','2024-03-20 07:00:00.000000',NULL,NULL,'embraer@skyit.services','awaiting approval','2024-03-14 16:51:09.556503',1,NULL,2,1,1,3,1,1,NULL),(4,'Camellia-Shipping-LLC-ar-3','2024-03-20 07:00:00.000000',NULL,NULL,'bombardier@skyit.services','awaiting approval','2024-03-14 16:51:46.760060',1,NULL,3,1,1,6,1,1,NULL),(5,'Camellia-Shipping-LLC-ar-4','2024-03-27 07:00:00.000000',NULL,NULL,'airbus@skyit.services','awaiting approval','2024-03-14 16:52:42.069852',1,NULL,4,1,1,1,1,1,NULL),(6,'Camellia-Shipping-LLC-ar-5','2024-03-30 07:00:00.000000',NULL,NULL,'embraer@skyit.services','awaiting approval','2024-03-14 16:53:24.825254',1,NULL,5,1,1,3,1,1,NULL),(7,'Camellia-Shipping-LLC-ar-2','2024-03-20 07:00:00.000000',NULL,NULL,'embraer@skyit.services','delivered','2024-03-14 16:58:20.853383',1,'BOE-APLN-002',2,1,1,3,1,1,NULL),(8,'Camellia-Shipping-LLC-ar-5','2024-03-30 07:00:00.000000',NULL,NULL,'embraer@skyit.services','delivered','2024-03-14 16:58:42.988089',1,'BOE-APLN-003',5,1,1,3,1,1,NULL),(9,'Camellia-Shipping-LLC-ar-4','2024-03-27 07:00:00.000000',NULL,NULL,'airbus@skyit.services','delivered','2024-03-14 16:59:19.854439',1,'BOE-APLN-004',4,1,1,1,1,1,NULL),(10,'Camellia-Shipping-LLC-ar-3','2024-03-20 07:00:00.000000',NULL,NULL,'bombardier@skyit.services','delivered','2024-03-14 16:59:41.270660',1,'BOE-APLN-005',3,1,1,6,1,1,NULL),(11,'Camellia-Shipping-LLC-ar-6','2024-03-17 07:00:00.000000',NULL,NULL,'antonov@skyit.services','awaiting approval','2024-03-14 17:02:44.211580',1,NULL,6,1,2,1,1,1,NULL),(12,'Camellia-Shipping-LLC-ar-7','2024-03-18 07:00:00.000000',NULL,NULL,'ilyushin@skyit.services','awaiting approval','2024-03-14 17:03:28.057655',1,NULL,7,1,2,3,1,1,NULL),(13,'Camellia-Shipping-LLC-ar-8','2024-03-24 07:00:00.000000',NULL,NULL,'airbus@skyit.services','awaiting approval','2024-03-14 17:04:18.585719',1,NULL,8,1,2,6,1,1,NULL),(14,'Camellia-Shipping-LLC-ar-9','2024-03-28 07:00:00.000000',NULL,NULL,'boeing@skyit.services','awaiting approval','2024-03-14 17:05:04.982976',1,NULL,9,1,2,1,1,1,NULL),(15,'Camellia-Shipping-LLC-ar-10','2024-03-31 07:00:00.000000',NULL,NULL,'antonov@skyit.services','awaiting approval','2024-03-14 17:05:48.609838',1,NULL,10,1,2,3,1,1,NULL),(16,'Camellia-Shipping-LLC-ar-10','2024-03-31 07:00:00.000000',NULL,NULL,'antonov@skyit.services','delivered','2024-03-14 17:07:58.749364',1,'LKM-CARG-001',10,1,2,3,1,1,NULL),(17,'Camellia-Shipping-LLC-ar-9','2024-03-28 07:00:00.000000',NULL,NULL,'boeing@skyit.services','delivered','2024-03-14 17:08:27.102805',1,'LKM-CARG-002',9,1,2,1,1,1,NULL),(18,'Camellia-Shipping-LLC-ar-8','2024-03-24 07:00:00.000000',NULL,NULL,'airbus@skyit.services','delivered','2024-03-14 17:08:51.999800',1,'LKM-CARG-003',8,1,2,6,1,1,NULL),(19,'Camellia-Shipping-LLC-ar-7','2024-03-18 07:00:00.000000',NULL,NULL,'ilyushin@skyit.services','delivered','2024-03-14 17:09:23.200272',1,'LKM-CARG-004',7,1,2,3,1,1,NULL),(20,'Camellia-Shipping-LLC-ar-6','2024-03-17 07:00:00.000000',NULL,NULL,'antonov@skyit.services','delivered','2024-03-14 17:09:48.499196',1,'LKM-CARG-005',6,1,2,1,1,1,NULL),(21,'Camellia-Shipping-LLC-ar-11','2024-03-17 07:00:00.000000',NULL,NULL,'lockheed@skyit.services','awaiting approval','2024-03-14 17:10:55.371590',1,NULL,11,1,3,1,1,1,NULL),(22,'Camellia-Shipping-LLC-ar-12','2024-03-24 07:00:00.000000',NULL,NULL,'boeing@skyit.services','awaiting approval','2024-03-14 17:11:34.521017',1,NULL,12,1,3,3,1,1,NULL),(23,'Camellia-Shipping-LLC-ar-13','2024-03-27 07:00:00.000000',NULL,NULL,'northrop@skyit.services','awaiting approval','2024-03-14 17:12:23.189582',1,NULL,13,1,3,3,1,1,NULL),(24,'Camellia-Shipping-LLC-ar-14','2024-03-20 07:00:00.000000',NULL,NULL,'northrop@skyit.services','awaiting approval','2024-03-14 17:12:52.403810',1,NULL,14,1,3,1,1,1,NULL),(25,'Camellia-Shipping-LLC-ar-15','2024-03-20 07:00:00.000000',NULL,NULL,'boeing@skyit.services','awaiting approval','2024-03-14 17:13:20.848839',1,NULL,15,1,3,3,1,1,NULL),(26,'Camellia-Shipping-LLC-ar-16','2024-03-20 07:00:00.000000',NULL,NULL,'lockheed@skyit.services','awaiting approval','2024-03-14 17:13:52.233038',1,NULL,16,1,3,6,1,1,NULL),(27,'Camellia-Shipping-LLC-ar-16','2024-03-20 07:00:00.000000',NULL,NULL,'lockheed@skyit.services','delivered','2024-03-14 17:14:45.194011',1,'BEL-FJET-001',16,1,3,6,1,1,NULL),(28,'Camellia-Shipping-LLC-ar-15','2024-03-20 07:00:00.000000',NULL,NULL,'boeing@skyit.services','delivered','2024-03-14 17:15:02.764930',1,'BEL-FJET-002',15,1,3,3,1,1,NULL),(29,'Camellia-Shipping-LLC-ar-14','2024-03-20 07:00:00.000000',NULL,NULL,'northrop@skyit.services','delivered','2024-03-14 17:15:19.163429',1,'BEL-FJET-003',14,1,3,1,1,1,NULL),(30,'Camellia-Shipping-LLC-ar-13','2024-03-27 07:00:00.000000',NULL,NULL,'northrop@skyit.services','delivered','2024-03-14 17:15:35.479965',1,'BEL-FJET-004',13,1,3,3,1,1,NULL),(31,'Camellia-Shipping-LLC-ar-12','2024-03-24 07:00:00.000000',NULL,NULL,'boeing@skyit.services','delivered','2024-03-14 17:15:55.109972',1,'BEL-FJET-005',12,1,3,3,1,1,NULL),(32,'Camellia-Shipping-LLC-ar-11','2024-03-17 07:00:00.000000',NULL,NULL,'lockheed@skyit.services','delivered','2024-03-14 17:16:55.752038',1,'BEL-FJET-006',11,1,3,1,1,1,NULL),(33,'Camellia-Shipping-LLC-ar-17','2024-03-17 07:00:00.000000',NULL,NULL,'rolls@skyit.services','awaiting approval','2024-03-14 17:17:52.493317',1,NULL,17,1,4,1,1,1,NULL),(34,'Camellia-Shipping-LLC-ar-18','2024-03-27 07:00:00.000000',NULL,NULL,'lockheed@skyit.services','awaiting approval','2024-03-14 17:18:24.565147',1,NULL,18,1,4,1,1,1,NULL),(35,'Camellia-Shipping-LLC-ar-19','2024-03-24 07:00:00.000000',NULL,NULL,'boeing@skyit.services','awaiting approval','2024-03-14 17:18:55.446616',1,NULL,19,1,4,6,1,1,NULL),(36,'Camellia-Shipping-LLC-ar-17','2024-03-17 07:00:00.000000',NULL,NULL,'rolls@skyit.services','delivered','2024-03-14 17:19:44.591872',1,'LEO-HEL-001',17,1,4,1,1,1,NULL),(37,'Camellia-Shipping-LLC-ar-18','2024-03-27 07:00:00.000000',NULL,NULL,'lockheed@skyit.services','delivered','2024-03-14 17:20:02.972822',1,'LEO-HEL-002',18,1,4,1,1,1,NULL),(38,'Camellia-Shipping-LLC-ar-19','2024-03-24 07:00:00.000000',NULL,NULL,'boeing@skyit.services','delivered','2024-03-14 17:20:20.287609',1,'LEO-HEL-003',19,1,4,6,1,1,NULL),(39,'Camellia-Shipping-LLC-ar-20','2024-03-25 07:00:00.000000',NULL,NULL,'boeing@skyit.services','awaiting approval','2024-03-14 17:21:12.259632',1,NULL,20,1,5,1,1,1,NULL),(40,'Camellia-Shipping-LLC-ar-21','2024-03-27 07:00:00.000000',NULL,NULL,'translink@skyit.services','awaiting approval','2024-03-14 17:21:43.768397',1,NULL,21,1,5,3,1,1,NULL),(41,'Camellia-Shipping-LLC-ar-22','2024-03-27 07:00:00.000000',NULL,NULL,'lockheed@skyit.services','awaiting approval','2024-03-14 17:22:16.544808',1,NULL,22,1,5,3,1,1,NULL),(42,'Camellia-Shipping-LLC-ar-22','2024-03-27 07:00:00.000000',NULL,NULL,'lockheed@skyit.services','delivered','2024-03-14 17:22:57.900403',1,'AIR-PJET-001',22,1,5,3,1,1,NULL),(43,'Camellia-Shipping-LLC-ar-21','2024-03-27 07:00:00.000000',NULL,NULL,'translink@skyit.services','delivered','2024-03-14 17:23:16.247099',1,'AIR-PJET-002',21,1,5,3,1,1,NULL),(44,'Camellia-Shipping-LLC-ar-20','2024-03-25 07:00:00.000000',NULL,NULL,'boeing@skyit.services','delivered','2024-03-14 17:23:34.367595',1,'AIR-PJET-003',20,1,5,1,1,1,NULL),(45,'Camellia-Shipping-LLC-ar-23','2024-03-24 07:00:00.000000',NULL,NULL,'boeing@skyit.services','awaiting approval','2024-03-14 17:24:20.202689',1,NULL,23,1,6,1,1,1,NULL),(46,'Camellia-Shipping-LLC-ar-24','2024-03-31 07:00:00.000000',NULL,NULL,'bombarder@skyit.services','awaiting approval','2024-03-14 17:24:55.269002',1,NULL,24,1,6,3,1,1,NULL),(47,'Camellia-Shipping-LLC-ar-25','2024-03-17 07:00:00.000000',NULL,NULL,'translink@skyit.services','awaiting approval','2024-03-14 17:25:25.490953',1,NULL,25,1,6,6,1,1,NULL),(48,'Camellia-Shipping-LLC-ar-25','2024-03-17 07:00:00.000000',NULL,NULL,'translink@skyit.services','delivered','2024-03-14 17:25:59.183230',1,'GAT-RCON-001',25,1,6,6,1,1,NULL),(49,'Camellia-Shipping-LLC-ar-24','2024-03-31 07:00:00.000000',NULL,NULL,'bombarder@skyit.services','delivered','2024-03-14 17:26:18.086219',1,'GAT-RCON-002',24,1,6,3,1,1,NULL),(50,'Camellia-Shipping-LLC-ar-23','2024-03-24 07:00:00.000000',NULL,NULL,'boeing@skyit.services','delivered','2024-03-14 17:26:34.951110',1,'GAT-RCON-003',23,1,6,1,1,1,NULL);
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
  `fire_extinguisher` tinyint(1) NOT NULL,
  `leaks` tinyint(1) NOT NULL,
  `hydraulic_hoses` tinyint(1) NOT NULL,
  `trailer_air_lines` tinyint(1) NOT NULL,
  `other_leaks` tinyint(1) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_updated` datetime(6) NOT NULL,
  `created_by_id` int DEFAULT NULL,
  `modified_by_id` int DEFAULT NULL,
  `anchoring_system` tinyint(1) NOT NULL,
  `communication` tinyint(1) NOT NULL,
  `electrical` tinyint(1) NOT NULL,
  `engine_and_all_mechanical` tinyint(1) NOT NULL,
  `fuel_systems` tinyint(1) NOT NULL,
  `lifesaving_equipments` tinyint(1) NOT NULL,
  `navigation_and_strobe_lights` tinyint(1) NOT NULL,
  `steering_and_hydraulics` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `asset_type_name` (`asset_type_name`),
  KEY `api_assettypechecks_created_by_id_afdea472_fk_api_detai` (`created_by_id`),
  KEY `api_assettypechecks_modified_by_id_12ec3feb_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_assettypechecks_created_by_id_afdea472_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_assettypechecks_modified_by_id_12ec3feb_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assettypechecks`
--

LOCK TABLES `api_assettypechecks` WRITE;
/*!40000 ALTER TABLE `api_assettypechecks` DISABLE KEYS */;
INSERT INTO `api_assettypechecks` VALUES (1,'Passenger Jets',1,0,0,1,0,0,0,0,0,0,0,1,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,'2023-01-20 02:15:01.895878','2024-05-15 10:49:57.914787',1,1,0,0,0,0,0,0,0,0),(2,'Fighter Jets',1,0,0,1,0,0,0,0,0,0,0,1,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,'2023-01-20 02:15:01.895878','2024-05-15 10:49:57.914787',1,1,0,0,0,0,0,0,0,0),(3,'Cargo Planes',1,0,0,1,0,0,0,0,0,0,0,1,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,'2023-01-20 02:15:01.895878','2024-05-15 10:49:57.914787',1,1,0,0,0,0,0,0,0,0),(4,'Aviation Assets',1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,1,0,0,1,1,0,0,'2024-05-15 10:53:57.953842','2024-08-27 00:26:53.649368',1,1,0,0,0,0,0,0,0,0),(5,'Narrow Body Airplanes',1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,1,1,1,0,0,'2024-08-27 00:25:39.892174','2024-08-27 00:25:39.899600',1,1,0,0,0,0,0,0,0,0),(6,'Wide-Body Airplanes',1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,1,0,0,1,1,0,0,'2024-08-27 00:28:09.385796','2024-08-27 00:28:09.393274',1,1,0,0,0,0,0,0,0,0),(7,'Cargo Airplanes',1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,1,0,0,1,1,0,0,'2024-08-27 00:28:39.095523','2024-08-27 00:28:39.102513',1,1,0,0,0,0,0,0,0,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assettypecheckshistory`
--

LOCK TABLES `api_assettypecheckshistory` WRITE;
/*!40000 ALTER TABLE `api_assettypecheckshistory` DISABLE KEYS */;
INSERT INTO `api_assettypecheckshistory` VALUES (1,'Passenger Jets',1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,'2024-05-15 10:49:03.041646',1,1),(2,'Passenger Jets',1,0,0,1,0,0,0,0,0,0,0,1,1,0,0,1,0,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,'2024-05-15 10:49:57.931210',1,1),(3,'Aviation Assets',1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,'2024-05-15 10:53:57.992593',4,1),(4,'Narrow Body Airplanes',1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,1,1,1,1,1,0,0,'2024-08-27 00:25:39.925354',5,1),(5,'Aviation Assets',1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,1,0,0,1,1,0,0,'2024-08-27 00:26:53.675586',4,1),(6,'Wide-Body Airplanes',1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,1,0,0,1,1,0,0,'2024-08-27 00:28:09.423412',6,1),(7,'Cargo Airplanes',1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,1,0,0,0,1,0,0,1,1,0,0,'2024-08-27 00:28:39.129674',7,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_assettypemodel`
--

LOCK TABLES `api_assettypemodel` WRITE;
/*!40000 ALTER TABLE `api_assettypemodel` DISABLE KEYS */;
INSERT INTO `api_assettypemodel` VALUES (1,'Aviation Assets',0,-7,'2024-03-14 15:58:02.870928','2024-05-15 10:53:57.968795',NULL,4,1,1),(2,'Cargo Airplanes',0,-7,'2024-03-14 15:59:45.577511','2024-08-27 00:28:39.109713',NULL,7,1,1),(3,'Wide-Body Airplanes',0,-7,'2024-03-14 16:00:48.578157','2024-08-27 00:28:09.403347',NULL,6,1,1),(4,'Helicopters',0,-7,'2024-03-14 16:01:29.377020','2024-03-14 16:01:29.377084',NULL,NULL,1,1),(5,'Narrow Body Airplanes',0,-7,'2024-03-14 16:02:09.238174','2024-08-27 00:25:39.908751',NULL,5,1,1),(6,'Drones',0,-7,'2024-03-14 16:03:04.496939','2024-03-14 16:03:04.496986',NULL,NULL,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_businessunitmodel`
--

LOCK TABLES `api_businessunitmodel` WRITE;
/*!40000 ALTER TABLE `api_businessunitmodel` DISABLE KEYS */;
INSERT INTO `api_businessunitmodel` VALUES (1,'Flight Ops','orion_demo_2024_3@skyit.services',1);
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
INSERT INTO `api_company` VALUES ('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1','Camellia Shipping LLC','4444 Camellia Ave, Ottawa, ON K1K 1K1','(613) 666-6666','orion_demo_2024_3@skyit.services','','lokomotive',2);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_costcentremodel`
--

LOCK TABLES `api_costcentremodel` WRITE;
/*!40000 ALTER TABLE `api_costcentremodel` DISABLE KEYS */;
INSERT INTO `api_costcentremodel` VALUES (1,'Canada Cost Centre');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_currency`
--

LOCK TABLES `api_currency` WRITE;
/*!40000 ALTER TABLE `api_currency` DISABLE KEYS */;
INSERT INTO `api_currency` VALUES (1,'EUR','','Euro'),(2,'CAD','','Canadian Dollar'),(3,'USD','','US Dollar');
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
  `role_permissions_id` int DEFAULT NULL,
  `cost_centre_id` int DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_detaileduser`
--

LOCK TABLES `api_detaileduser` WRITE;
/*!40000 ALTER TABLE `api_detaileduser` DISABLE KEYS */;
INSERT INTO `api_detaileduser` VALUES (1,'orion_demo_2024_3@skyit.services',999999999,'NA',1,0,1,'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa1',3,1);
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
  `responsible_user_id` int NOT NULL,
  `date` datetime(6) NOT NULL,
  `engine_id_id` int DEFAULT NULL,
  `responsible_daily_check_id` int DEFAULT NULL,
  PRIMARY KEY (`engine_history_id`),
  KEY `api_enginehistorymod_responsible_user_id_3e190328_fk_api_detai` (`responsible_user_id`),
  KEY `api_enginehistorymod_engine_id_id_6dfadf2c_fk_api_engin` (`engine_id_id`),
  KEY `api_enginehistorymod_responsible_daily_ch_08e0d8ff_fk_api_asset` (`responsible_daily_check_id`),
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
  `daily_average_hours` double NOT NULL,
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
  KEY `api_equipmenttypemod_asset_type_id_3143c189_fk_api_asset` (`asset_type_id`),
  KEY `api_equipmenttypemod_created_by_id_c346a1e6_fk_api_detai` (`created_by_id`),
  KEY `api_equipmenttypemodel_fuel_id_cba9eff5_fk_api_fueltype_id` (`fuel_id`),
  KEY `api_equipmenttypemod_manufacturer_id_29668e7f_fk_api_asset` (`manufacturer_id`),
  KEY `api_equipmenttypemod_modified_by_id_da7eef15_fk_api_detai` (`modified_by_id`),
  CONSTRAINT `api_equipmenttypemod_asset_type_id_3143c189_fk_api_asset` FOREIGN KEY (`asset_type_id`) REFERENCES `api_assettypemodel` (`id`),
  CONSTRAINT `api_equipmenttypemod_created_by_id_c346a1e6_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_equipmenttypemod_manufacturer_id_29668e7f_fk_api_asset` FOREIGN KEY (`manufacturer_id`) REFERENCES `api_assetmanufacturermodel` (`id`),
  CONSTRAINT `api_equipmenttypemod_modified_by_id_da7eef15_fk_api_detai` FOREIGN KEY (`modified_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_equipmenttypemodel_fuel_id_cba9eff5_fk_api_fueltype_id` FOREIGN KEY (`fuel_id`) REFERENCES `api_fueltype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_equipmenttypemodel`
--

LOCK TABLES `api_equipmenttypemodel` WRITE;
/*!40000 ALTER TABLE `api_equipmenttypemodel` DISABLE KEYS */;
INSERT INTO `api_equipmenttypemodel` VALUES (1,'B747-8','General Electric GEnx','2024-03-14 15:58:02.909573','2024-03-14 15:58:02.909676',NULL,NULL,1,1,1,1,1),(2,'C-130J Super Hercules','Rolls-Royce AE 2100D3','2024-03-14 15:59:45.609307','2024-03-14 15:59:45.609539',NULL,NULL,2,1,1,2,1),(3,'B777-300ER','GE90–115B','2024-03-14 16:00:48.610888','2024-03-14 16:00:48.610947',NULL,NULL,3,1,1,3,1),(4,'AW101','Rolls-Royce RTM322','2024-03-14 16:01:29.444765','2024-03-14 16:01:29.444833',NULL,NULL,4,1,1,4,1),(5,'A350','Rolls-Royce Trent XWB','2024-03-14 16:02:09.311306','2024-03-14 16:02:09.311396',NULL,NULL,5,1,1,5,1),(6,'MQ-9 Reaper','Honeywell TPE331','2024-03-14 16:03:04.529799','2024-03-14 16:03:04.529844',NULL,NULL,6,1,1,6,1);
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
  `flagged` tinyint(1) NOT NULL,
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
-- Table structure for table `api_fuelcostcheck`
--

DROP TABLE IF EXISTS `api_fuelcostcheck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_fuelcostcheck` (
  `fuel_cost_check_id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  `volume_ratio_threshold` double NOT NULL,
  `company_id` char(32) NOT NULL,
  `cost_ratio_threshold` double NOT NULL,
  `cost_ratio_type_id` int DEFAULT NULL,
  `cost_ratio_units` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`fuel_cost_check_id`),
  KEY `api_fuelcostcheck_company_id_5deafa6a_fk_api_company_company_id` (`company_id`),
  KEY `api_fuelcostcheck_cost_ratio_type_id_1805091a_fk_api_fueltype_id` (`cost_ratio_type_id`),
  CONSTRAINT `api_fuelcostcheck_company_id_5deafa6a_fk_api_company_company_id` FOREIGN KEY (`company_id`) REFERENCES `api_company` (`company_id`),
  CONSTRAINT `api_fuelcostcheck_cost_ratio_type_id_1805091a_fk_api_fueltype_id` FOREIGN KEY (`cost_ratio_type_id`) REFERENCES `api_fueltype` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_fuelcostcheck`
--

LOCK TABLES `api_fuelcostcheck` WRITE;
/*!40000 ALTER TABLE `api_fuelcostcheck` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_fuelcostcheck` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_fueltype`
--

LOCK TABLES `api_fueltype` WRITE;
/*!40000 ALTER TABLE `api_fueltype` DISABLE KEYS */;
INSERT INTO `api_fueltype` VALUES (1,'Jet Fuel','2024-03-14 15:58:02.884078','2024-03-14 15:58:02.884245',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_inspectiontypemodel`
--

LOCK TABLES `api_inspectiontypemodel` WRITE;
/*!40000 ALTER TABLE `api_inspectiontypemodel` DISABLE KEYS */;
INSERT INTO `api_inspectiontypemodel` VALUES (1,'Monthly Inspection','MI',250),(2,'Yearly Inspection','YI',1000);
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_jobspecification`
--

LOCK TABLES `api_jobspecification` WRITE;
/*!40000 ALTER TABLE `api_jobspecification` DISABLE KEYS */;
INSERT INTO `api_jobspecification` VALUES (1,'Training'),(2,'Transport'),(3,'Safety'),(4,'Security'),(5,'Surveying'),(6,'Power'),(7,'Sensor');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_locationmodel`
--

LOCK TABLES `api_locationmodel` WRITE;
/*!40000 ALTER TABLE `api_locationmodel` DISABLE KEYS */;
INSERT INTO `api_locationmodel` VALUES (1,'OTTAWA','Ottawa',45.4215,-75.6972),(2,'CALGARY','Calgary',51.0447,-114.0719),(3,'VANCOUVER','Vancouver',49.2827,-123.1207);
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
  `linked_engine_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `api_maintenanceforec_VIN_id_43d27b29_fk_api_asset` (`VIN_id`),
  KEY `api_maintenanceforec_created_by_id_7b4190e3_fk_api_detai` (`created_by_id`),
  KEY `api_maintenanceforec_inspection_type_id_4c2e50e0_fk_api_inspe` (`inspection_type_id`),
  KEY `api_maintenanceforec_location_id_7d1db767_fk_api_locat` (`location_id`),
  KEY `api_maintenanceforec_modified_by_id_0cb09b5d_fk_api_detai` (`modified_by_id`),
  KEY `api_maintenanceforec_linked_engine_id_e91b800b_fk_api_engin` (`linked_engine_id`),
  CONSTRAINT `api_maintenanceforec_created_by_id_7b4190e3_fk_api_detai` FOREIGN KEY (`created_by_id`) REFERENCES `api_detaileduser` (`detailed_user_id`),
  CONSTRAINT `api_maintenanceforec_inspection_type_id_4c2e50e0_fk_api_inspe` FOREIGN KEY (`inspection_type_id`) REFERENCES `api_inspectiontypemodel` (`id`),
  CONSTRAINT `api_maintenanceforec_linked_engine_id_e91b800b_fk_api_engin` FOREIGN KEY (`linked_engine_id`) REFERENCES `api_enginemodel` (`engine_id`),
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
  `linked_engine_id` int DEFAULT NULL,
  PRIMARY KEY (`maintenance_forecast_history_id`),
  KEY `api_maintenanceforec_maintenance_forecast_2b1d7f75_fk_api_maint` (`maintenance_forecast_id`),
  KEY `api_maintenanceforec_modified_by_id_679c2f26_fk_api_detai` (`modified_by_id`),
  KEY `api_maintenanceforec_linked_engine_id_a1c94f89_fk_api_engin` (`linked_engine_id`),
  CONSTRAINT `api_maintenanceforec_linked_engine_id_a1c94f89_fk_api_engin` FOREIGN KEY (`linked_engine_id`) REFERENCES `api_enginemodel` (`engine_id`),
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
  `description` longtext NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_maintenancerequestmodel`
--

LOCK TABLES `api_maintenancerequestmodel` WRITE;
/*!40000 ALTER TABLE `api_maintenancerequestmodel` DISABLE KEYS */;
INSERT INTO `api_maintenancerequestmodel` VALUES (1,'Camellia-Shipping-LLC-m-1',1,'2024-05-15 11:04:49.441343','2024-05-15 11:04:49.472832',NULL,NULL,'2024-05-28 06:00:00.000000',NULL,'2024-05-15 11:04:46.321000','NA',-1,400,'awaiting approval','BEL-FJET-005',NULL,1,1,1,1,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_maintenancerequestmodelhistory`
--

LOCK TABLES `api_maintenancerequestmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_maintenancerequestmodelhistory` DISABLE KEYS */;
INSERT INTO `api_maintenancerequestmodelhistory` VALUES (1,'Camellia-Shipping-LLC-m-1','2024-05-15 11:04:49.489897',NULL,NULL,'2024-05-28',NULL,'2024-05-15','NA',-1,400,'awaiting approval',NULL,1,1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_notificationconfiguration`
--

LOCK TABLES `api_notificationconfiguration` WRITE;
/*!40000 ALTER TABLE `api_notificationconfiguration` DISABLE KEYS */;
INSERT INTO `api_notificationconfiguration` VALUES (1,'New Accident',1,'-accident_id-vin-is_preventable-is_equipment_failure-evaluation_required-date_created-date_updated-is_operational-','','-add_accident-update_accident-','user','-','-','','-','2023-10-30 00:00:00.000000',1),(2,'Asset Reassigned',1,'-accident_id-vin-is_preventable-is_equipment_failure-evaluation_required-date_created-date_updated-is_operational-','','-reassign_asset-','user','-','-','','-','2023-10-30 00:00:00.000000',1),(3,'New Asset Request',1,'-accident_id-vin-is_preventable-is_equipment_failure-evaluation_required-date_created-date_updated-is_operational-','','-update_asset_request-','user','-','-','','-','2023-10-30 00:00:00.000000',1),(4,'New Auction Disposal',1,'-contact_name-company-company_address-contact_email-date-vin-available_pickup_date-asset_type-year-make-model-colour-odometer-engine_hours-location-manager_contact_email-interior_condition-interior_condition_details-exterior_condition-exterior_condition_details-accident-equipment_failure-','','-add_auction-update_disposal-','user','-','-','','-','2023-10-30 00:00:00.000000',1),(5,'New Daily Check',1,'-vin-created_by-date-mileage-hours-daily_check_name-daily_check_status-','','-add_daily_check-','user','-','-','','-','2023-10-30 00:00:00.000000',1),(6,'New Donation Disposal',1,'-contact_name-company-company_address-contact_email-date-vin-available_pickup_date-asset_type-year-make-model-colour-odometer-engine_hours-location-manager_contact_email-interior_condition-interior_condition_details-exterior_condition-exterior_condition_details-accident-equipment_failure-','','-add_donation-update_disposal-','user','-','-','','-','2023-10-30 00:00:00.000000',1),(7,'Expiry',1,'-vin-expiring_items-','','-notify_expiry-','user','-',NULL,NULL,NULL,'2023-10-30 00:00:00.000000',1),(8,'New Asset Issue',1,'-issue_id-vin-issue_type-cause-date_created-date_updated-status-issue_repair_category-issue_title-issue_description-','','-add_issue-update_issue-','user','-',NULL,NULL,NULL,'2023-10-30 00:00:00.000000',1),(9,'Maintenance Forecast',1,'-vin-inspection_type-','','-notify_maintenance-','user','-','-',NULL,'-','2023-10-30 00:00:00.000000',1),(10,'New Maintenance',1,'maintenance_id-vin-inspection_type-location-mileage-hours-assigned_vendor-fleet_contact_email-fleet_contact_name-requested_delivery-estimated_delivery-status-','','-add_maintenance-update_maintenance-','user','-','-',NULL,'-','2023-10-30 00:00:00.000000',1),(11,'New Repair',1,'-company_name-company_address-company_phone-asset_num-serial_num-license_num-engine_type-odometer-engine_hours-make-model-repair_id-po_num-wo_num-fleet_contact_email-fleet_contact_name-vendor_pickup_date-est_return_date-pickup_location-dropoff_location-invoice_to-issue_repair_category-issue_title-issue_description-','','-add_repair-update_repair-update_issue-','user','-','-',NULL,'-','2023-10-30 00:00:00.000000',1),(12,'Request Cancellation',1,NULL,'','-cancel_maintenance-cancel_repair-cancel_asset_request-','user','-',NULL,NULL,'-','2023-10-30 00:00:00.000000',1),(13,'New Scrap Disposal',1,'-contact_name-company-company_address-contact_email-date-vin-available_pickup_date-asset_type-year-make-model-colour-odometer-engine_hours-location-manager_contact_email-interior_condition-interior_condition_details-exterior_condition-exterior_condition_details-accident-equipment_failure-','','-add_scrap-update_disposal-','user','-',NULL,NULL,'-','2023-10-30 00:00:00.000000',1),(14,'New Transfer',1,'-asset_transfer_id-vin-fleet_contact_email-fleet_contact_name-pickup_date-destination_location-justification-status-','','-add_transfer-update_transfer-','user','-','-',NULL,'-','2023-10-30 00:00:00.000000',1),(15,'Updated Daily Check',1,'-daily_op_checks_id-daily_op_checks_manufacturer-daily_op_checks_asset_type-daily_op_checks_model-vin-modified_by-prev_mileage-updated_mileage-prev_hours-updated_hours-prev_fuel-updated_fuel-','','-update_daily_check-','user','-','-',NULL,'-','2023-10-30 00:00:00.000000',1),(16,'Overdue Maintenance',0,'-vin-inspection_type-','','-notify_overdue_maintenance','user','-','-','','-','2023-10-30 00:00:00.000000',1),(17,'Unusual Fuel Cost',1,NULL,NULL,NULL,'user','-',NULL,NULL,NULL,'2023-10-30 00:00:00.000000',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_parts`
--

LOCK TABLES `api_parts` WRITE;
/*!40000 ALTER TABLE `api_parts` DISABLE KEYS */;
INSERT INTO `api_parts` VALUES (1,'123','123',10,500,500,5500,'2024-05-15 11:06:50.446207','2024-05-15 11:06:50.485676',1,2,NULL,NULL,1,1,1),(2,'12312','123',5,732.8004999999999,21.984015,3685.986515,'2024-05-15 11:09:30.066112','2024-05-15 11:09:30.092456',1,2,NULL,NULL,1,1,1),(3,'123','123',1,675.7876729698947,6.757876729698947,682.5455496995937,'2024-05-15 11:09:41.383738','2024-05-15 11:09:41.408484',1,2,NULL,NULL,1,1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_partsmodelhistory`
--

LOCK TABLES `api_partsmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_partsmodelhistory` DISABLE KEYS */;
INSERT INTO `api_partsmodelhistory` VALUES (1,'123','123',10,500,500,5500,'2024-05-15 11:06:50.496097','2024-05-15 11:06:50.496132',2,NULL,NULL,1,1,1,1),(2,'12312','123',5,732.8004999999999,21.984015,3685.986515,'2024-05-15 11:09:30.102557','2024-05-15 11:09:30.102591',2,NULL,NULL,1,1,1,2),(3,'123','123',1,675.7876729698947,6.757876729698947,682.5455496995937,'2024-05-15 11:09:41.419024','2024-05-15 11:09:41.419053',2,NULL,NULL,1,1,1,3);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_repairsmodel`
--

LOCK TABLES `api_repairsmodel` WRITE;
/*!40000 ALTER TABLE `api_repairsmodel` DISABLE KEYS */;
INSERT INTO `api_repairsmodel` VALUES (1,'Camellia-Shipping-LLC-r-1','2024-05-15 11:04:25.970540','2024-05-15 11:04:26.056458',1,'Fix',0,'2024-05-26 06:00:00.000000',NULL,'2024-05-15 11:04:18.283000',NULL,4839,NULL,'NA',-1,400,0,'approved','BEL-FJET-005',1,NULL,1,1,NULL),(2,'Camellia-Shipping-LLC-r-2','2024-08-27 00:19:08.305191','2024-08-27 00:19:08.368775',1,'Fix',0,'2024-08-30 06:00:00.000000',NULL,'2024-08-27 00:18:50.975000',NULL,2353,NULL,'NA',-1,500,0,'approved','BEL-FJET-005',1,NULL,2,1,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_repairsmodelhistory`
--

LOCK TABLES `api_repairsmodelhistory` WRITE;
/*!40000 ALTER TABLE `api_repairsmodelhistory` DISABLE KEYS */;
INSERT INTO `api_repairsmodelhistory` VALUES (1,'Camellia-Shipping-LLC-r-1','2024-05-15 11:04:26.064774','Fix','2024-05-26 06:00:00.000000',NULL,'2024-05-15 11:04:18.283000',NULL,NULL,NULL,'NA',-1,400,'approved',1,1,1,NULL),(2,'Camellia-Shipping-LLC-r-2','2024-08-27 00:19:08.376240','Fix','2024-08-30 06:00:00.000000',NULL,'2024-08-27 00:18:50.975000',NULL,NULL,NULL,'NA',-1,500,'approved',2,1,2,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_rolepermissions`
--

LOCK TABLES `api_rolepermissions` WRITE;
/*!40000 ALTER TABLE `api_rolepermissions` DISABLE KEYS */;
INSERT INTO `api_rolepermissions` VALUES (1,'operator',0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,1,1,0,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0),(2,'manager',1,0,1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,1,1),(3,'executive',1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1),(4,'supervisor',0,0,0,0,0,1,0,0,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,0,0,0,1,1,0,1,1);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_snapshotdailycounts`
--

LOCK TABLES `api_snapshotdailycounts` WRITE;
/*!40000 ALTER TABLE `api_snapshotdailycounts` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_snapshotdailycurrency`
--

LOCK TABLES `api_snapshotdailycurrency` WRITE;
/*!40000 ALTER TABLE `api_snapshotdailycurrency` DISABLE KEYS */;
INSERT INTO `api_snapshotdailycurrency` VALUES (1,1,'2024-04-04 04:02:37.022533',2),(4,0.7398773608915388,'2024-04-04 04:02:36.961652',1),(6,0.6823139449277122,'2024-04-04 04:02:37.083238',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_userconfiguration`
--

LOCK TABLES `api_userconfiguration` WRITE;
/*!40000 ALTER TABLE `api_userconfiguration` DISABLE KEYS */;
INSERT INTO `api_userconfiguration` VALUES (1,'2024-10-22 20:02:44.454680',0,20,NULL,NULL,1);
/*!40000 ALTER TABLE `api_userconfiguration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `api_usertablelayoutmodel`
--

DROP TABLE IF EXISTS `api_usertablelayoutmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `api_usertablelayoutmodel` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(100) NOT NULL,
  `value` longtext,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_usertablelayoutm_user_id_e9170365_fk_api_detai` (`user_id`),
  CONSTRAINT `api_usertablelayoutm_user_id_e9170365_fk_api_detai` FOREIGN KEY (`user_id`) REFERENCES `api_detaileduser` (`detailed_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `api_usertablelayoutmodel`
--

LOCK TABLES `api_usertablelayoutmodel` WRITE;
/*!40000 ALTER TABLE `api_usertablelayoutmodel` DISABLE KEYS */;
/*!40000 ALTER TABLE `api_usertablelayoutmodel` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'api','0001_initial','2024-03-12 16:40:13.568002'),(2,'api','0002_maintenancerequestmodel_description','2024-03-12 16:40:45.547836'),(3,'api','0003_auto_20231113_1734','2024-03-12 16:40:47.535082'),(4,'api','0004_auto_20231124_0245','2024-03-12 16:40:48.088179'),(5,'api','0005_detaileduser_cost_centre','2024-03-12 16:40:48.531555'),(6,'api','0006_assetrequestmodel_cost_centre','2024-03-12 16:40:48.969812'),(7,'api','0007_enginemodel','2024-03-12 16:40:49.267179'),(8,'api','0008_enginehistorymodel','2024-03-12 16:40:49.865514'),(9,'api','0009_enginehistorymodel_date','2024-03-12 16:40:50.317183'),(10,'api','0010_auto_20231204_2222','2024-03-12 16:40:51.123704'),(11,'api','0011_enginehistorymodel_responsible_daily_check','2024-03-12 16:40:51.435897'),(12,'api','0007_assetrequestfile_inventory_requestquote','2024-03-12 16:40:53.139515'),(13,'api','0012_merge_20231205_2040','2024-03-12 16:40:55.384866'),(14,'api','0013_usertablelayoutmodel','2024-03-12 16:40:55.697853'),(15,'api','0014_fuelcostcheck','2024-03-12 16:40:56.106966'),(16,'api','0015_auto_20240116_0352','2024-03-12 16:40:56.790342'),(17,'api','0016_annualreport','2024-03-12 16:40:58.374656'),(18,'api','0017_auto_20240118_1511','2024-03-12 16:40:59.777099'),(19,'api','0013_auto_20231211_2156','2024-03-12 16:41:00.516864'),(20,'api','0018_merge_20240118_1531','2024-03-12 16:41:00.574237'),(21,'api','0019_assetmodel_lifespan_years','2024-03-12 16:41:00.950901'),(22,'api','0020_enginemodel_daily_average_hours','2024-03-12 16:41:01.157228'),(23,'api','0021_auto_20240209_1546','2024-03-12 16:41:01.510084'),(24,'api','0022_auto_20240223_2012','2024-03-12 16:41:01.719438');
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

-- Dump completed on 2026-01-22 13:56:08
