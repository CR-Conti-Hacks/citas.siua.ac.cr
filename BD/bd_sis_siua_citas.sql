-- MySQL dump 10.13  Distrib 8.0.18, for Linux (x86_64)
--
-- Host: localhost    Database: bd_sis_siua_citas
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `ea_appointments`
--

DROP TABLE IF EXISTS `ea_appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ea_appointments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_datetime` datetime DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `notes` text,
  `hash` text,
  `is_unavailable` tinyint(4) DEFAULT '0',
  `id_users_provider` int(11) DEFAULT NULL,
  `id_users_customer` int(11) DEFAULT NULL,
  `id_services` int(11) DEFAULT NULL,
  `id_google_calendar` text,
  PRIMARY KEY (`id`),
  KEY `id_users_customer` (`id_users_customer`),
  KEY `id_services` (`id_services`),
  KEY `id_users_provider` (`id_users_provider`),
  CONSTRAINT `appointments_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appointments_users_customer` FOREIGN KEY (`id_users_customer`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `appointments_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ea_appointments`
--

LOCK TABLES `ea_appointments` WRITE;
/*!40000 ALTER TABLE `ea_appointments` DISABLE KEYS */;
INSERT INTO `ea_appointments` VALUES (1,'2019-11-04 10:56:08','2019-11-04 10:30:00','2019-11-04 11:30:00','','c7aa77fb77bec3ad5e3c642967659b3d',0,2,3,1,NULL);
/*!40000 ALTER TABLE `ea_appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ea_consents`
--

DROP TABLE IF EXISTS `ea_consents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ea_consents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created` datetime DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(256) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `ip` varchar(256) DEFAULT NULL,
  `type` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ea_consents`
--

LOCK TABLES `ea_consents` WRITE;
/*!40000 ALTER TABLE `ea_consents` DISABLE KEYS */;
/*!40000 ALTER TABLE `ea_consents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ea_migrations`
--

DROP TABLE IF EXISTS `ea_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ea_migrations` (
  `version` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ea_migrations`
--

LOCK TABLES `ea_migrations` WRITE;
/*!40000 ALTER TABLE `ea_migrations` DISABLE KEYS */;
INSERT INTO `ea_migrations` VALUES (12);
/*!40000 ALTER TABLE `ea_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ea_roles`
--

DROP TABLE IF EXISTS `ea_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ea_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `slug` varchar(256) DEFAULT NULL,
  `is_admin` tinyint(4) DEFAULT NULL,
  `appointments` int(11) DEFAULT NULL,
  `customers` int(11) DEFAULT NULL,
  `services` int(11) DEFAULT NULL,
  `users` int(11) DEFAULT NULL,
  `system_settings` int(11) DEFAULT NULL,
  `user_settings` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ea_roles`
--

LOCK TABLES `ea_roles` WRITE;
/*!40000 ALTER TABLE `ea_roles` DISABLE KEYS */;
INSERT INTO `ea_roles` VALUES (1,'Administrator','admin',1,15,15,15,15,15,15),(2,'Provider','provider',0,15,15,0,0,0,15),(3,'Customer','customer',0,0,0,0,0,0,0),(4,'Secretary','secretary',0,15,15,0,0,0,15);
/*!40000 ALTER TABLE `ea_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ea_secretaries_providers`
--

DROP TABLE IF EXISTS `ea_secretaries_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ea_secretaries_providers` (
  `id_users_secretary` int(11) NOT NULL,
  `id_users_provider` int(11) NOT NULL,
  PRIMARY KEY (`id_users_secretary`,`id_users_provider`),
  KEY `id_users_secretary` (`id_users_secretary`),
  KEY `id_users_provider` (`id_users_provider`),
  CONSTRAINT `secretaries_users_provider` FOREIGN KEY (`id_users_provider`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `secretaries_users_secretary` FOREIGN KEY (`id_users_secretary`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ea_secretaries_providers`
--

LOCK TABLES `ea_secretaries_providers` WRITE;
/*!40000 ALTER TABLE `ea_secretaries_providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `ea_secretaries_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ea_service_categories`
--

DROP TABLE IF EXISTS `ea_service_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ea_service_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ea_service_categories`
--

LOCK TABLES `ea_service_categories` WRITE;
/*!40000 ALTER TABLE `ea_service_categories` DISABLE KEYS */;
INSERT INTO `ea_service_categories` VALUES (1,'Universidad Nacional','Servicios ofrecidos por la Universidad Nacional de Costa Rica');
/*!40000 ALTER TABLE `ea_service_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ea_services`
--

DROP TABLE IF EXISTS `ea_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ea_services` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(256) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `currency` varchar(32) DEFAULT NULL,
  `description` text,
  `availabilities_type` varchar(32) DEFAULT 'flexible',
  `attendants_number` int(11) DEFAULT '1',
  `id_service_categories` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_service_categories` (`id_service_categories`),
  CONSTRAINT `services_service_categories` FOREIGN KEY (`id_service_categories`) REFERENCES `ea_service_categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ea_services`
--

LOCK TABLES `ea_services` WRITE;
/*!40000 ALTER TABLE `ea_services` DISABLE KEYS */;
INSERT INTO `ea_services` VALUES (1,'Carnet Tradicional',30,0.00,'Colones','Por favor recuerde que debe traer una fotocopia de su identificación por ambos lados','fixed',1,1),(2,'Carnet Convenio Banco Nacional',30,0.00,'Colones','Por favor recuerde que debe traer una fotocopia de su identificación por ambos lados','fixed',1,1);
/*!40000 ALTER TABLE `ea_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ea_services_providers`
--

DROP TABLE IF EXISTS `ea_services_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ea_services_providers` (
  `id_users` int(11) NOT NULL,
  `id_services` int(11) NOT NULL,
  PRIMARY KEY (`id_users`,`id_services`),
  KEY `id_services` (`id_services`),
  CONSTRAINT `services_providers_services` FOREIGN KEY (`id_services`) REFERENCES `ea_services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `services_providers_users_provider` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ea_services_providers`
--

LOCK TABLES `ea_services_providers` WRITE;
/*!40000 ALTER TABLE `ea_services_providers` DISABLE KEYS */;
INSERT INTO `ea_services_providers` VALUES (2,1),(2,2);
/*!40000 ALTER TABLE `ea_services_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ea_settings`
--

DROP TABLE IF EXISTS `ea_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ea_settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(512) DEFAULT NULL,
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ea_settings`
--

LOCK TABLES `ea_settings` WRITE;
/*!40000 ALTER TABLE `ea_settings` DISABLE KEYS */;
INSERT INTO `ea_settings` VALUES (1,'company_working_plan','{\"sunday\":null,\"monday\":{\"start\":\"09:00\",\"end\":\"17:00\",\"breaks\":[{\"start\":\"12:00\",\"end\":\"13:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"17:00\",\"breaks\":[{\"start\":\"12:00\",\"end\":\"13:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"17:00\",\"breaks\":[{\"start\":\"12:00\",\"end\":\"13:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"17:00\",\"breaks\":[{\"start\":\"12:00\",\"end\":\"13:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"17:00\",\"breaks\":[{\"start\":\"12:00\",\"end\":\"13:00\"}]},\"saturday\":{\"start\":\"09:00\",\"end\":\"17:00\",\"breaks\":[]}}'),(2,'book_advance_timeout','30'),(3,'google_analytics_code',''),(4,'customer_notifications','1'),(5,'date_format','DMY'),(6,'time_format','regular'),(7,'require_captcha','0'),(8,'display_cookie_notice','0'),(9,'cookie_notice_content','Esta en una noticia de cookie<br>'),(10,'display_terms_and_conditions','0'),(11,'terms_and_conditions_content','Estos son los terminos <br>'),(12,'display_privacy_policy','0'),(13,'privacy_policy_content','poilitica de privaciada<br>'),(14,'company_name','Sede Interuniversitaria de Alajuela'),(15,'company_email','gustavo.matamoros@gmail.com'),(16,'company_link','https://www.siua.ac.cr');
/*!40000 ALTER TABLE `ea_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ea_user_settings`
--

DROP TABLE IF EXISTS `ea_user_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ea_user_settings` (
  `id_users` int(11) NOT NULL,
  `username` varchar(256) DEFAULT NULL,
  `password` varchar(512) DEFAULT NULL,
  `salt` varchar(512) DEFAULT NULL,
  `working_plan` text,
  `notifications` tinyint(4) DEFAULT '0',
  `google_sync` tinyint(4) DEFAULT '0',
  `google_token` text,
  `google_calendar` varchar(128) DEFAULT NULL,
  `sync_past_days` int(11) DEFAULT '5',
  `sync_future_days` int(11) DEFAULT '5',
  `calendar_view` varchar(32) DEFAULT 'default',
  PRIMARY KEY (`id_users`),
  CONSTRAINT `user_settings_users` FOREIGN KEY (`id_users`) REFERENCES `ea_users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ea_user_settings`
--

LOCK TABLES `ea_user_settings` WRITE;
/*!40000 ALTER TABLE `ea_user_settings` DISABLE KEYS */;
INSERT INTO `ea_user_settings` VALUES (1,'gmatamor','4d8b8541077933eacf74dbbfee3cec6a5d217322ea94113ab4192454cb51d3e3','b6830ca2b33b1cf84abf9abc7ca1a1b125895e2d5122787d0e4bd296a378b13b',NULL,0,0,NULL,NULL,5,5,'default'),(2,'dorita.lopez','f00aeddfa9b94dfa51dd81426feebaa24634805857af694856e5acd5c69ec9a3','e12ed0043e911f2ea85c4d55b1089aeabe8eb7572364901dece047fdb2dd055b','{\"sunday\":null,\"monday\":{\"start\":\"09:00\",\"end\":\"12:00\",\"breaks\":[{\"start\":\"12:00\",\"end\":\"13:00\"}]},\"tuesday\":{\"start\":\"09:00\",\"end\":\"12:00\",\"breaks\":[{\"start\":\"12:00\",\"end\":\"13:00\"}]},\"wednesday\":{\"start\":\"09:00\",\"end\":\"12:00\",\"breaks\":[{\"start\":\"12:00\",\"end\":\"13:00\"}]},\"thursday\":{\"start\":\"09:00\",\"end\":\"12:00\",\"breaks\":[{\"start\":\"12:00\",\"end\":\"13:00\"}]},\"friday\":{\"start\":\"09:00\",\"end\":\"12:00\",\"breaks\":[{\"start\":\"12:00\",\"end\":\"13:00\"}]},\"saturday\":null}',1,0,NULL,NULL,5,5,'default'),(4,'secret','3230e27d6776df2a459d0df03e3b23c59edff0d4cf6a04e0f21ff908032d9290','516d81d0700e1c21b27821348f24dd0a2de59e56f69700d2ac5cedd91407f4a9',NULL,0,0,NULL,NULL,5,5,'default');
/*!40000 ALTER TABLE `ea_user_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ea_users`
--

DROP TABLE IF EXISTS `ea_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ea_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(256) DEFAULT NULL,
  `last_name` varchar(512) DEFAULT NULL,
  `email` varchar(512) DEFAULT NULL,
  `mobile_number` varchar(128) DEFAULT NULL,
  `phone_number` varchar(128) DEFAULT NULL,
  `address` varchar(256) DEFAULT NULL,
  `city` varchar(256) DEFAULT NULL,
  `state` varchar(128) DEFAULT NULL,
  `zip_code` varchar(64) DEFAULT NULL,
  `notes` text,
  `id_roles` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_roles` (`id_roles`),
  CONSTRAINT `users_roles` FOREIGN KEY (`id_roles`) REFERENCES `ea_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ea_users`
--

LOCK TABLES `ea_users` WRITE;
/*!40000 ALTER TABLE `ea_users` DISABLE KEYS */;
INSERT INTO `ea_users` VALUES (1,'Gustavo','Matamoros','gustavo.matamoros@gmail.com','','60462663','','','','','',1),(2,'Dorita','Lopéz Carvajal','dorita.lopez.carvajal@una.cr','','0123456789','','','','','',2),(3,'Gustavo','Matamoros','gustavo.matamoros@gmail.com',NULL,'60462663','','',NULL,'',NULL,3),(4,'secretaruia1','jhjhj','gustavo.matamoros@gmail.com','','45435435435','','','','','',4);
/*!40000 ALTER TABLE `ea_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-04 14:14:21
