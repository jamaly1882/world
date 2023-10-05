-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: markt
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

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
-- Current Database: `markt`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `markt` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci */;

USE `markt`;

--
-- Table structure for table `accounts_city`
--

DROP TABLE IF EXISTS `accounts_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_city` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city` varchar(200) NOT NULL,
  `phone_number` varchar(200) NOT NULL,
  `img` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_city`
--

LOCK TABLES `accounts_city` WRITE;
/*!40000 ALTER TABLE `accounts_city` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts_city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_profile`
--

DROP TABLE IF EXISTS `accounts_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(100) NOT NULL,
  `img` varchar(100) DEFAULT NULL,
  `city_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `accounts_profile_city_id_267b3d7f_fk_accounts_city_id` (`city_id`),
  CONSTRAINT `accounts_profile_city_id_267b3d7f_fk_accounts_city_id` FOREIGN KEY (`city_id`) REFERENCES `accounts_city` (`id`),
  CONSTRAINT `accounts_profile_user_id_49a85d32_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_profile`
--

LOCK TABLES `accounts_profile` WRITE;
/*!40000 ALTER TABLE `accounts_profile` DISABLE KEYS */;
INSERT INTO `accounts_profile` VALUES (1,'','',NULL,1),(2,'','',NULL,2);
/*!40000 ALTER TABLE `accounts_profile` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add notification',1,'add_notification'),(2,'Can change notification',1,'change_notification'),(3,'Can delete notification',1,'delete_notification'),(4,'Can view notification',1,'view_notification'),(5,'Can add sanf',2,'add_sanf'),(6,'Can change sanf',2,'change_sanf'),(7,'Can delete sanf',2,'delete_sanf'),(8,'Can view sanf',2,'view_sanf'),(9,'Can add prodect',3,'add_prodect'),(10,'Can change prodect',3,'change_prodect'),(11,'Can delete prodect',3,'delete_prodect'),(12,'Can view prodect',3,'view_prodect'),(13,'can_view_prodect',3,'can_add_prodect'),(14,'Can add city',4,'add_city'),(15,'Can change city',4,'change_city'),(16,'Can delete city',4,'delete_city'),(17,'Can view city',4,'view_city'),(18,'Can add profile',5,'add_profile'),(19,'Can change profile',5,'change_profile'),(20,'Can delete profile',5,'delete_profile'),(21,'Can view profile',5,'view_profile'),(22,'Can add permission',6,'add_permission'),(23,'Can change permission',6,'change_permission'),(24,'Can delete permission',6,'delete_permission'),(25,'Can view permission',6,'view_permission'),(26,'Can add group',7,'add_group'),(27,'Can change group',7,'change_group'),(28,'Can delete group',7,'delete_group'),(29,'Can view group',7,'view_group'),(30,'Can add user',8,'add_user'),(31,'Can change user',8,'change_user'),(32,'Can delete user',8,'delete_user'),(33,'Can view user',8,'view_user'),(34,'Can add content type',9,'add_contenttype'),(35,'Can change content type',9,'change_contenttype'),(36,'Can delete content type',9,'delete_contenttype'),(37,'Can view content type',9,'view_contenttype'),(38,'Can add log entry',10,'add_logentry'),(39,'Can change log entry',10,'change_logentry'),(40,'Can delete log entry',10,'delete_logentry'),(41,'Can view log entry',10,'view_logentry'),(42,'Can add session',11,'add_session'),(43,'Can change session',11,'change_session'),(44,'Can delete session',11,'delete_session'),(45,'Can view session',11,'view_session');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$390000$T1mff2tANoVOMqZL6UD3hh$EaDlugMSYg72HSCtzKyJWkBLsO6GFqPVmwWTeIuji3I=','2023-09-26 18:33:12.569626',1,'kaml','','','jamly2013@outlook.com',1,1,'2023-09-26 18:25:36.382607'),(2,'pbkdf2_sha256$390000$jLi07UBCpE9CCs1yX43sYN$1oSQWmH73BHQkE833kgQBdJ9Ac2qgIzobTPTTB59b78=','2023-09-27 20:24:55.926417',0,'talal','','','',0,1,'2023-09-26 18:28:41.000000');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
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
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
INSERT INTO `auth_user_user_permissions` VALUES (1,2,9),(2,2,10),(3,2,13);
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-09-26 18:26:20.594895','1','1',1,'[{\"added\": {}}]',2,1),(2,'2023-09-26 18:26:41.191539','2','2',1,'[{\"added\": {}}]',2,1),(3,'2023-09-26 18:26:55.514225','3','3',1,'[{\"added\": {}}]',2,1),(4,'2023-09-26 18:27:11.094219','4','4',1,'[{\"added\": {}}]',2,1),(5,'2023-09-26 18:27:38.160734','5','5',1,'[{\"added\": {}}]',2,1),(6,'2023-09-26 18:27:50.942209','6','6',1,'[{\"added\": {}}]',2,1),(7,'2023-09-26 18:28:42.469185','2','talal',1,'[{\"added\": {}}]',8,1),(8,'2023-09-26 18:28:56.206215','2','talal',2,'[{\"changed\": {\"fields\": [\"User permissions\"]}}]',8,1),(9,'2023-09-26 18:33:40.670948','6','6',2,'[{\"changed\": {\"fields\": [\"Name\"]}}]',3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (4,'accounts','city'),(5,'accounts','profile'),(10,'admin','logentry'),(7,'auth','group'),(6,'auth','permission'),(8,'auth','user'),(9,'contenttypes','contenttype'),(1,'markt','notification'),(3,'markt','prodect'),(2,'markt','sanf'),(11,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'markt','0001_initial','2023-09-26 18:23:13.181925'),(2,'contenttypes','0001_initial','2023-09-26 18:23:37.520247'),(3,'auth','0001_initial','2023-09-26 18:23:38.504776'),(4,'accounts','0001_initial','2023-09-26 18:23:38.686554'),(5,'admin','0001_initial','2023-09-26 18:23:47.049144'),(6,'admin','0002_logentry_remove_auto_add','2023-09-26 18:23:47.068659'),(7,'admin','0003_logentry_add_action_flag_choices','2023-09-26 18:23:47.099571'),(8,'contenttypes','0002_remove_content_type_name','2023-09-26 18:23:47.221871'),(9,'auth','0002_alter_permission_name_max_length','2023-09-26 18:23:47.317166'),(10,'auth','0003_alter_user_email_max_length','2023-09-26 18:23:47.410871'),(11,'auth','0004_alter_user_username_opts','2023-09-26 18:23:47.436315'),(12,'auth','0005_alter_user_last_login_null','2023-09-26 18:23:47.510668'),(13,'auth','0006_require_contenttypes_0002','2023-09-26 18:23:47.522101'),(14,'auth','0007_alter_validators_add_error_messages','2023-09-26 18:23:47.534139'),(15,'auth','0008_alter_user_username_max_length','2023-09-26 18:23:47.583915'),(16,'auth','0009_alter_user_last_name_max_length','2023-09-26 18:23:47.617934'),(17,'auth','0010_alter_group_name_max_length','2023-09-26 18:23:47.698796'),(18,'auth','0011_update_proxy_permissions','2023-09-26 18:23:47.725271'),(19,'auth','0012_alter_user_first_name_max_length','2023-09-26 18:23:47.771674'),(20,'sessions','0001_initial','2023-09-26 18:23:47.840006');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('uiodumhxc75fm3t9ss0szsimki82svcq','.eJxVjrFygzAQRP9FbWLN6U6AoEyfLr3mJB3GDoMmSFQe_7th7CJud_e92ZvyvNXJb0VWf0lqUKg-_2eB468sR5GuvJyzjnmp6yXoY6JfbdHfOcn89dq-CSYu004zRhsBpI_kRgzYWOc4ABkHfUi2odSIcJMijiNh58CwtBbRGLL9Du3S54FDnf2cz3mrfuZS_Sp_m5R6fAekE_Qn7H4QBtsNZDS1bUf0ATAAqPsD-d1Lxg:1qlbRT:Cs3EMmPcTwprwK3HHV9PMhUMxWjsk6ZW3tvM7MSyWl8','2023-10-11 20:47:31.370779');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markt_notification`
--

DROP TABLE IF EXISTS `markt_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `markt_notification` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `is_read` tinyint(1) NOT NULL,
  `message` longtext NOT NULL,
  `almo` longtext NOT NULL,
  `date_a` longtext NOT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markt_notification`
--

LOCK TABLES `markt_notification` WRITE;
/*!40000 ALTER TABLE `markt_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `markt_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markt_prodect`
--

DROP TABLE IF EXISTS `markt_prodect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `markt_prodect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `img_trhl` varchar(100) DEFAULT NULL,
  `sanf_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `markt_prodect_sanf_id_990446fb_fk_markt_sanf_id` (`sanf_id`),
  CONSTRAINT `markt_prodect_sanf_id_990446fb_fk_markt_sanf_id` FOREIGN KEY (`sanf_id`) REFERENCES `markt_sanf` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markt_prodect`
--

LOCK TABLES `markt_prodect` WRITE;
/*!40000 ALTER TABLE `markt_prodect` DISABLE KEYS */;
INSERT INTO `markt_prodect` VALUES (1,'كوت ',8000,'images/coat_8lsoxvI.jpg',1),(2,'ثوب ابيض',9000,'images/e79fdf71-5ab4-494b-9bcd-dcbb5cc1954d-thumbnail-1000x1000-70_Df6haNP.jpeg',2),(3,'جاكت زيتي',20000,'images/images_1_mzWjjcy.jpg',4),(4,'جاكت ',15000,'images/jact_lk1F3pz_MnD3DEo.jpg',4),(5,'شميز ',7000,'images/chmiz_srNa8oz_VwUnIv7.jpg',3),(6,'بدلة رياضية',10000,'images/تنزيل_2_B78MT55.jpg',5);
/*!40000 ALTER TABLE `markt_prodect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `markt_sanf`
--

DROP TABLE IF EXISTS `markt_sanf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `markt_sanf` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `bine` varchar(100) NOT NULL,
  `img_trhl` varchar(100) DEFAULT NULL,
  `img_persone` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `markt_sanf`
--

LOCK TABLES `markt_sanf` WRITE;
/*!40000 ALTER TABLE `markt_sanf` DISABLE KEYS */;
INSERT INTO `markt_sanf` VALUES (1,'اكوت','اكوات','',''),(2,'اثواب','اثواب رجالي','',''),(3,'شمزان','شمزان رجالي','',''),(4,'جواكت','الجواكت','',''),(5,'بدلة رياضية','بدلة رياضية','',''),(6,'بدلة عسكرية','بدلة عسكرية','',''),(7,'بناطيل','','','');
/*!40000 ALTER TABLE `markt_sanf` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-27 23:51:33
