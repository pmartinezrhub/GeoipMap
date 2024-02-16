-- MariaDB dump 10.19  Distrib 10.5.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: devicetracker
-- ------------------------------------------------------
-- Server version	10.5.18-MariaDB-0+deb11u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `devices`
--

DROP TABLE IF EXISTS `devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `devices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceID` varchar(50) DEFAULT NULL,
  `location` varchar(250) DEFAULT NULL,
  `lastseen` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `devices`
--

LOCK TABLES `devices` WRITE;
/*!40000 ALTER TABLE `devices` DISABLE KEYS */;
INSERT INTO `devices` VALUES (3,'emulator4_f4k3vd3v','42.891665,-8.5335','2023-03-08 20:11:48');
/*!40000 ALTER TABLE `devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-03-07 22:42:06.297862'),(2,'auth','0001_initial','2023-03-07 22:42:06.564266'),(3,'admin','0001_initial','2023-03-07 22:42:06.625542'),(4,'admin','0002_logentry_remove_auto_add','2023-03-07 22:42:06.630593'),(5,'admin','0003_logentry_add_action_flag_choices','2023-03-07 22:42:06.636506'),(6,'contenttypes','0002_remove_content_type_name','2023-03-07 22:42:06.674995'),(7,'auth','0002_alter_permission_name_max_length','2023-03-07 22:42:06.700712'),(8,'auth','0003_alter_user_email_max_length','2023-03-07 22:42:06.708784'),(9,'auth','0004_alter_user_username_opts','2023-03-07 22:42:06.714876'),(10,'auth','0005_alter_user_last_login_null','2023-03-07 22:42:06.736032'),(11,'auth','0006_require_contenttypes_0002','2023-03-07 22:42:06.737672'),(12,'auth','0007_alter_validators_add_error_messages','2023-03-07 22:42:06.744463'),(13,'auth','0008_alter_user_username_max_length','2023-03-07 22:42:06.754925'),(14,'auth','0009_alter_user_last_name_max_length','2023-03-07 22:42:06.764285'),(15,'auth','0010_alter_group_name_max_length','2023-03-07 22:42:06.774729'),(16,'auth','0011_update_proxy_permissions','2023-03-07 22:42:06.780776'),(17,'auth','0012_alter_user_first_name_max_length','2023-03-07 22:42:06.789262'),(18,'sessions','0001_initial','2023-03-07 22:42:06.804815');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracker`
--

DROP TABLE IF EXISTS `tracker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tracker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceID` varchar(100) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `logtime` datetime DEFAULT NULL,
  UNIQUE KEY `tracker_UN` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=140 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracker`
--

LOCK TABLES `tracker` WRITE;
/*!40000 ALTER TABLE `tracker` DISABLE KEYS */;
INSERT INTO `tracker` VALUES (15,'emulator4_f4k3vd3v','42.891665,-7.334','2023-03-08 01:27:46'),(16,'emulator4_f4k3vd3v','42.891665,-7.234','2023-03-08 01:28:06'),(17,'emulator4_f4k3vd3v','42.891665,-7.134','2023-03-08 01:28:26'),(18,'emulator4_f4k3vd3v','42.891665,-8.533984','2023-03-08 16:11:46'),(19,'emulator4_f4k3vd3v','42.891665,-8.434','2023-03-08 16:12:06'),(20,'emulator4_f4k3vd3v','42.891665,-8.334','2023-03-08 16:12:26'),(21,'emulator4_f4k3vd3v','42.891665,-8.234','2023-03-08 16:12:46'),(22,'emulator4_f4k3vd3v','42.891665,-8.134','2023-03-08 16:13:06'),(23,'emulator4_f4k3vd3v','42.891665,-8.034','2023-03-08 16:13:26'),(24,'emulator4_f4k3vd3v','42.891665,-7.934','2023-03-08 16:13:46'),(25,'emulator4_f4k3vd3v','42.891665,-7.834','2023-03-08 16:14:06'),(26,'emulator4_f4k3vd3v','42.891665,-7.734','2023-03-08 16:14:26'),(27,'emulator4_f4k3vd3v','42.891665,-7.634','2023-03-08 16:14:46'),(28,'emulator4_f4k3vd3v','42.891665,-8.533984','2023-03-08 16:14:56'),(29,'emulator4_f4k3vd3v','42.891665,-8.434','2023-03-08 16:15:26'),(30,'emulator4_f4k3vd3v','42.891665,-8.334','2023-03-08 16:15:56'),(31,'emulator4_f4k3vd3v','42.891665,-8.234','2023-03-08 16:16:26'),(32,'emulator4_f4k3vd3v','42.891665,-8.134','2023-03-08 16:16:56'),(33,'emulator4_f4k3vd3v','42.891665,-8.034','2023-03-08 16:17:26'),(34,'emulator4_f4k3vd3v','42.891665,-7.934','2023-03-08 16:17:56'),(35,'emulator4_f4k3vd3v','42.891665,-7.834','2023-03-08 16:18:26'),(36,'emulator4_f4k3vd3v','42.891665,-7.734','2023-03-08 16:18:57'),(37,'emulator4_f4k3vd3v','42.891665,-7.634','2023-03-08 16:19:27'),(38,'emulator4_f4k3vd3v','42.891665,-7.534','2023-03-08 16:19:57'),(39,'emulator4_f4k3vd3v','42.891665,-7.434','2023-03-08 16:20:27'),(40,'emulator4_f4k3vd3v','42.891665,-7.334','2023-03-08 16:20:57'),(41,'emulator4_f4k3vd3v','42.891665,-7.234','2023-03-08 16:21:27'),(42,'emulator4_f4k3vd3v','42.891665,-7.134','2023-03-08 16:21:58'),(43,'emulator4_f4k3vd3v','42.891665,-7.034','2023-03-08 16:22:28'),(44,'emulator4_f4k3vd3v','42.891665,-6.934','2023-03-08 16:22:58'),(45,'emulator4_f4k3vd3v','42.891665,-6.834','2023-03-08 16:23:28'),(46,'emulator4_f4k3vd3v','42.891665,-6.734','2023-03-08 16:23:58'),(47,'emulator4_f4k3vd3v','42.891665,-6.634','2023-03-08 16:24:28'),(48,'emulator4_f4k3vd3v','42.891665,-6.334','2023-03-08 16:25:33'),(49,'emulator4_f4k3vd3v','42.891665,-6.234','2023-03-08 16:26:03'),(50,'emulator4_f4k3vd3v','42.891665,-6.134','2023-03-08 16:26:33'),(51,'emulator4_f4k3vd3v','42.891665,-6.034','2023-03-08 16:27:03'),(52,'emulator4_f4k3vd3v','42.891665,-5.934','2023-03-08 16:27:33'),(53,'emulator4_f4k3vd3v','42.891665,-5.834','2023-03-08 16:28:03'),(54,'emulator4_f4k3vd3v','42.891665,-5.734','2023-03-08 16:28:33'),(55,'emulator4_f4k3vd3v','42.891665,-5.634','2023-03-08 16:29:03'),(56,'emulator4_f4k3vd3v','42.891665,-5.534','2023-03-08 16:29:33'),(57,'emulator4_f4k3vd3v','42.891665,-5.434','2023-03-08 16:30:03'),(58,'emulator4_f4k3vd3v','42.891665,-5.334','2023-03-08 16:30:33'),(59,'emulator4_f4k3vd3v','42.891665,-5.234','2023-03-08 16:31:04'),(60,'emulator4_f4k3vd3v','42.891665,-5.134','2023-03-08 16:31:34'),(61,'emulator4_f4k3vd3v','42.891665,-5.034','2023-03-08 16:32:04'),(62,'emulator4_f4k3vd3v','42.891665,-4.934','2023-03-08 16:32:34'),(63,'emulator4_f4k3vd3v','42.891665,-4.834','2023-03-08 16:33:04'),(64,'emulator4_f4k3vd3v','42.891665,-8.533984','2023-03-08 16:33:14'),(65,'emulator4_f4k3vd3v','42.891665,-8.434','2023-03-08 16:33:44'),(66,'emulator4_f4k3vd3v','42.891665,-8.334','2023-03-08 16:34:14'),(67,'emulator4_f4k3vd3v','42.891665,-8.234','2023-03-08 16:34:44'),(68,'emulator4_f4k3vd3v','42.891665,-8.134','2023-03-08 16:35:14'),(69,'emulator4_f4k3vd3v','42.891665,-8.034','2023-03-08 16:35:44'),(70,'emulator4_f4k3vd3v','42.891665,-7.934','2023-03-08 16:36:14'),(71,'emulator4_f4k3vd3v','42.891665,-7.834','2023-03-08 16:36:44'),(72,'emulator4_f4k3vd3v','42.891665,-7.734','2023-03-08 16:37:14'),(73,'emulator4_f4k3vd3v','42.891665,-7.634','2023-03-08 16:37:44'),(74,'emulator4_f4k3vd3v','42.891665,-7.534','2023-03-08 16:38:14'),(75,'emulator4_f4k3vd3v','42.891665,-7.434','2023-03-08 16:38:44'),(76,'emulator4_f4k3vd3v','42.891665,-7.334','2023-03-08 16:39:14'),(77,'emulator4_f4k3vd3v','42.891665,-7.234','2023-03-08 16:39:44'),(78,'emulator4_f4k3vd3v','42.891665,-7.134','2023-03-08 16:40:14'),(79,'emulator4_f4k3vd3v','42.891665,-7.034','2023-03-08 16:40:44'),(80,'emulator4_f4k3vd3v','42.891665,-8.533984','2023-03-08 16:41:09'),(81,'emulator4_f4k3vd3v','42.891665,-8.434','2023-03-08 16:41:39'),(82,'emulator4_f4k3vd3v','42.891665,-8.334','2023-03-08 16:42:09'),(83,'emulator4_f4k3vd3v','42.891665,-8.234','2023-03-08 16:42:39'),(84,'emulator4_f4k3vd3v','42.891665,-8.134','2023-03-08 16:43:09'),(85,'emulator4_f4k3vd3v','42.891665,-8.034','2023-03-08 16:43:39'),(86,'emulator4_f4k3vd3v','42.891665,-7.934','2023-03-08 16:44:09'),(87,'emulator4_f4k3vd3v','42.891665,-7.834','2023-03-08 16:44:39'),(88,'emulator4_f4k3vd3v','42.891665,-7.734','2023-03-08 16:45:09'),(89,'emulator4_f4k3vd3v','42.891665,-7.634','2023-03-08 16:45:39'),(90,'emulator4_f4k3vd3v','42.891665,-7.534','2023-03-08 16:46:09'),(91,'emulator4_f4k3vd3v','42.891665,-7.434','2023-03-08 16:46:39'),(92,'emulator4_f4k3vd3v','42.891665,-7.334','2023-03-08 16:47:09'),(93,'emulator4_f4k3vd3v','42.891665,-7.234','2023-03-08 16:47:39'),(94,'emulator4_f4k3vd3v','42.891665,-8.533984','2023-03-08 16:47:54'),(95,'emulator4_f4k3vd3v','42.891665,-8.434','2023-03-08 16:48:24'),(96,'emulator4_f4k3vd3v','42.891665,-8.334','2023-03-08 16:48:54'),(97,'emulator4_f4k3vd3v','42.891665,-8.234','2023-03-08 16:49:24'),(98,'emulator4_f4k3vd3v','42.891665,-8.134','2023-03-08 16:49:54'),(99,'emulator4_f4k3vd3v','42.891665,-8.533984','2023-03-08 16:50:14'),(100,'emulator4_f4k3vd3v','42.891665,-8.434','2023-03-08 16:50:45'),(101,'emulator4_f4k3vd3v','42.891665,-8.334','2023-03-08 16:51:15'),(102,'emulator4_f4k3vd3v','42.891665,-8.533984','2023-03-08 16:51:42'),(103,'emulator4_f4k3vd3v','42.891665,-8.434','2023-03-08 16:52:12'),(104,'emulator4_f4k3vd3v','42.891665,-8.334','2023-03-08 16:52:42'),(105,'emulator4_f4k3vd3v','42.891665,-8.234','2023-03-08 16:53:12'),(106,'emulator4_f4k3vd3v','42.891665,-8.533984','2023-03-08 16:53:22'),(107,'emulator4_f4k3vd3v','42.891665,-8.524','2023-03-08 16:53:52'),(108,'emulator4_f4k3vd3v','42.891665,-8.514','2023-03-08 16:54:22'),(109,'emulator4_f4k3vd3v','42.891665,-8.533984','2023-03-08 16:54:32'),(110,'emulator4_f4k3vd3v','42.891665,-8.484','2023-03-08 16:55:02'),(111,'emulator4_f4k3vd3v','42.891665,-8.434','2023-03-08 16:55:32'),(112,'emulator4_f4k3vd3v','42.891665,-8.533984','2023-03-08 16:55:47'),(113,'emulator4_f4k3vd3v','42.891665,-8.524','2023-03-08 16:56:17'),(114,'emulator4_f4k3vd3v','42.891665,-8.514','2023-03-08 16:56:47'),(115,'emulator4_f4k3vd3v','42.891665,-8.533984','2023-03-08 16:56:57'),(116,'emulator4_f4k3vd3v','42.891665,-8.529','2023-03-08 16:57:27'),(117,'emulator4_f4k3vd3v','42.891665,-8.533984','2023-03-08 16:57:52'),(118,'emulator4_f4k3vd3v','42.891665,-8.5335','2023-03-08 16:58:22'),(119,'emulator4_f4k3vd3v','42.891665,-8.533','2023-03-08 16:58:52'),(120,'emulator4_f4k3vd3v','42.891665,-8.5325','2023-03-08 16:59:22'),(121,'emulator4_f4k3vd3v','42.891665,-8.532','2023-03-08 16:59:53'),(122,'emulator4_f4k3vd3v','42.891665,-8.5315','2023-03-08 17:00:23'),(123,'emulator4_f4k3vd3v','42.891665,-8.533984','2023-03-08 17:00:40'),(124,'emulator4_f4k3vd3v','42.891665,-8.5335','2023-03-08 17:01:01'),(125,'emulator4_f4k3vd3v','42.891665,-8.533','2023-03-08 17:01:21'),(126,'emulator4_f4k3vd3v','42.891665,-8.5325','2023-03-08 17:01:41'),(127,'emulator4_f4k3vd3v','42.891665,-8.532','2023-03-08 17:02:01'),(128,'emulator4_f4k3vd3v','42.891665,-8.5315','2023-03-08 17:02:21'),(129,'emulator4_f4k3vd3v','42.891665,-8.531','2023-03-08 17:02:41'),(130,'emulator4_f4k3vd3v','42.891665,-8.5305','2023-03-08 17:03:01'),(131,'emulator4_f4k3vd3v','42.891665,-8.512','2023-03-08 19:58:35'),(132,'emulator4_f4k3vd3v','42.891665,-8.5115','2023-03-08 19:58:55'),(133,'emulator4_f4k3vd3v','42.891665,-8.5325','2023-03-08 20:13:20'),(134,'emulator4_f4k3vd3v','42.891665,-8.532','2023-03-08 20:13:40'),(135,'emulator4_f4k3vd3v','42.891665,-8.532','2023-03-08 20:32:50'),(136,'emulator4_f4k3vd3v','42.891665,-8.5315','2023-03-08 20:33:10'),(137,'emulator4_f4k3vd3v','42.891665,-8.5205','2023-03-08 20:36:58'),(138,'emulator4_f4k3vd3v','42.891665,-8.52','2023-03-08 20:37:18'),(139,'emulator4_f4k3vd3v','42.891665,-8.5335','2023-03-08 21:11:48');
/*!40000 ALTER TABLE `tracker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `username` varchar(255) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-08 21:18:38
