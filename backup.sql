-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: wm_db
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.22.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_customuser'),(22,'Can change user',6,'change_customuser'),(23,'Can delete user',6,'delete_customuser'),(24,'Can view user',6,'view_customuser'),(25,'Can add words model',7,'add_wordsmodel'),(26,'Can change words model',7,'change_wordsmodel'),(27,'Can delete words model',7,'delete_wordsmodel'),(28,'Can view words model',7,'view_wordsmodel'),(29,'Can add memo model',8,'add_memomodel'),(30,'Can change memo model',8,'change_memomodel'),(31,'Can delete memo model',8,'delete_memomodel'),(32,'Can view memo model',8,'view_memomodel'),(33,'Can add mc model',9,'add_mcmodel'),(34,'Can change mc model',9,'change_mcmodel'),(35,'Can delete mc model',9,'delete_mcmodel'),(36,'Can view mc model',9,'view_mcmodel');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_user`
--

DROP TABLE IF EXISTS `custom_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user`
--

LOCK TABLES `custom_user` WRITE;
/*!40000 ALTER TABLE `custom_user` DISABLE KEYS */;
INSERT INTO `custom_user` VALUES (1,'pbkdf2_sha256$720000$wzY3mC04u3ApeXY3RUkYVj$u72y75YscwWQaypGlwND9N9CNnNqWKsLDv+p8hOfu1o=','2024-09-12 07:42:01.843200',1,'super','','','',1,1,'2024-07-06 16:09:29.059000',NULL),(2,'pbkdf2_sha256$720000$xVLLldiwDCRNY1Vu3F4YpL$wCkIMe4a2TTc21hr808PyNTji5gZ+KM9XnB2+RLQAP8=','2024-07-06 16:15:48.436000',0,'goemon024','','','hirotorics@gmail.com',0,1,'2024-07-06 16:15:38.606000',NULL),(3,'pbkdf2_sha256$720000$EyK1P4ch0HBECZ3zMemlvF$lsWHwUucD+jeci/IRa1D8bT23vzhWdF6ll6UN9cKKZo=','2024-07-07 15:12:43.841000',0,'xxx1','','','',0,1,'2024-07-07 15:12:43.581000',NULL),(4,'pbkdf2_sha256$720000$1P5CDV85ABqgPQFYutm1WR$NikrXTpgEYLtmYxccuw0qAymydEIwCgqg6Ap5CzUyro=','2024-07-07 15:13:04.114000',0,'xxx2','','','',0,1,'2024-07-07 15:13:03.900000',NULL),(5,'pbkdf2_sha256$720000$2pegKPh9mwgairg9hUtmOi$QpUkofj9Lhz4rPludq4F5gkT9AFGnT6m7I+xHGIHjBU=','2024-07-07 15:37:34.102000',0,'yyy1','','','',0,1,'2024-07-07 15:35:32.720000',NULL),(6,'pbkdf2_sha256$720000$lsQ897sJEVu2QPOPmJUlBn$OcR8MXTvDK+v27UI8Mt2FA5/t1PNweTiKrO7JmYAtVQ=','2024-09-10 10:04:47.085772',0,'super1','','','hirotorics@gmail.com',0,1,'2024-07-10 07:47:00.009000',NULL),(7,'pbkdf2_sha256$720000$0bWVY8t5Snjzn9f1RIaIgR$zEaUTqoWSZI6hEEeq5Gdb5Xe8/Yc9LmeZ1nwUga1Nec=','2024-08-30 10:55:37.056699',0,'guest','','','',0,1,'2024-08-07 11:35:59.113000',NULL),(8,'pbkdf2_sha256$720000$zElwvF6nK35FaSuURj1Sth$RsvsZNUUYfqYMREVs5yUr7rh/NZ8+h08EqREIO8OUbQ=','2024-09-06 16:05:52.485574',0,'tsap','','','',0,1,'2024-09-01 12:49:28.752391',NULL);
/*!40000 ALTER TABLE `custom_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_user_groups`
--

DROP TABLE IF EXISTS `custom_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custom_user_groups_customuser_id_group_id_ea14f886_uniq` (`customuser_id`,`group_id`),
  KEY `custom_user_groups_group_id_02874f21_fk_auth_group_id` (`group_id`),
  CONSTRAINT `custom_user_groups_customuser_id_8e3d0338_fk_custom_user_id` FOREIGN KEY (`customuser_id`) REFERENCES `custom_user` (`id`),
  CONSTRAINT `custom_user_groups_group_id_02874f21_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user_groups`
--

LOCK TABLES `custom_user_groups` WRITE;
/*!40000 ALTER TABLE `custom_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_user_user_permissions`
--

DROP TABLE IF EXISTS `custom_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custom_user_user_permiss_customuser_id_permission_f9232336_uniq` (`customuser_id`,`permission_id`),
  KEY `custom_user_user_per_permission_id_f82b5e3f_fk_auth_perm` (`permission_id`),
  CONSTRAINT `custom_user_user_per_customuser_id_ec2da4cb_fk_custom_us` FOREIGN KEY (`customuser_id`) REFERENCES `custom_user` (`id`),
  CONSTRAINT `custom_user_user_per_permission_id_f82b5e3f_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user_user_permissions`
--

LOCK TABLES `custom_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `custom_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_custom_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_custom_user_id` FOREIGN KEY (`user_id`) REFERENCES `custom_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2024-07-07 15:35:32.915000','5','yyy1',1,'[{\"added\": {}}]',6,1),(2,'2024-07-08 08:44:44.928000','4','moon',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',7,1),(3,'2024-07-08 08:44:51.429000','3','star',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',7,1),(4,'2024-07-08 08:44:57.345000','2','month',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',7,1),(5,'2024-07-08 08:45:01.834000','1','sun',2,'[{\"changed\": {\"fields\": [\"User\"]}}]',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (6,'accounts','customuser'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(5,'sessions','session'),(9,'wlist','mcmodel'),(8,'wlist','memomodel'),(7,'wlist','wordsmodel');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-08-19 06:55:17.224469'),(2,'contenttypes','0002_remove_content_type_name','2024-08-19 06:55:17.317284'),(3,'auth','0001_initial','2024-08-19 06:55:17.684123'),(4,'auth','0002_alter_permission_name_max_length','2024-08-19 06:55:17.764888'),(5,'auth','0003_alter_user_email_max_length','2024-08-19 06:55:17.772453'),(6,'auth','0004_alter_user_username_opts','2024-08-19 06:55:17.780102'),(7,'auth','0005_alter_user_last_login_null','2024-08-19 06:55:17.788380'),(8,'auth','0006_require_contenttypes_0002','2024-08-19 06:55:17.793103'),(9,'auth','0007_alter_validators_add_error_messages','2024-08-19 06:55:17.802994'),(10,'auth','0008_alter_user_username_max_length','2024-08-19 06:55:17.812110'),(11,'auth','0009_alter_user_last_name_max_length','2024-08-19 06:55:17.821243'),(12,'auth','0010_alter_group_name_max_length','2024-08-19 06:55:17.843078'),(13,'auth','0011_update_proxy_permissions','2024-08-19 06:55:17.853883'),(14,'auth','0012_alter_user_first_name_max_length','2024-08-19 06:55:17.862114'),(15,'accounts','0001_initial','2024-08-19 06:55:18.346282'),(16,'admin','0001_initial','2024-08-19 06:55:18.539311'),(17,'admin','0002_logentry_remove_auto_add','2024-08-19 06:55:18.546795'),(18,'admin','0003_logentry_add_action_flag_choices','2024-08-19 06:55:18.554411'),(19,'sessions','0001_initial','2024-08-19 06:55:18.611461'),(20,'wlist','0001_initial','2024-08-19 06:55:18.642578'),(21,'wlist','0002_wordsmodel_user','2024-08-19 06:55:18.721741'),(22,'wlist','0003_memomodel','2024-08-19 06:55:18.827452'),(23,'wlist','0004_alter_memomodel_memo_alter_wordsmodel_word','2024-08-19 06:55:18.916229'),(24,'wlist','0005_mcmodel','2024-08-30 13:30:09.864332');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2nxh8c3ns84u2ipi1uxyxx2r5o8j683g','.eJxVjDsOwjAQBe_iGln-O0tJzxks765NAsiR4qRC3B0ipYD2zcx7iZS3dUxbL0uaWJxFFKffDTM9StsB33O7zZLmti4Tyl2RB-3yOnN5Xg7372DMffzWoJTxNjoOWAAIQoglIlZNYLxnZXPV1oUhIzEqA3VQgQHKYMmSJifeH9RBN7g:1sjauT:TlMXyX01rjCyFyaVHJwd9oFG8VtgS48VdVrtvF4cQnA','2024-09-12 08:53:41.735532'),('2va686kik60n5nij9df3kf51c1k99ztk','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1shSrb:3mdNwPQajNCuTd4fW7CIrxG_OyP3qAjV-9xbX1l-qz4','2024-09-06 11:53:55.793000'),('4g2dy8wlo62u0yckq567fkmu5hcjuk48','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1snIFk:L4jE6bKim8ZMirbBFUb7YWm_otZdpTwXUsgXgSdy2fM','2024-09-22 13:46:56.506820'),('5odzswt0nm7f2bwbzy6wad11qli1w9hh','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1sYkRK:Zr6dsbCRYg10JrEAv0kcXbtp87kEyf4Zzb-FAaYHv6A','2024-08-13 10:50:46.952000'),('9jp53foj181n8tcm9u01qcuk37ubxxim','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1scfHU:Zu0Y6XEa_jHB9WXjbWbvkXV68T1_DgaBBQeArGtaqns','2024-08-24 06:08:48.129000'),('aeskrd2xguf1gmoidkwoc1twt5aimsfe','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1sfwM9:_eF4G5Q7fCAE-mhUQA_e3xFJRA1baf7wqQ0QkzhZUDE','2024-09-02 06:59:09.161000'),('cklabbb1fxd7rpqtk0oo94v99z7dc36m','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1snDus:jsDWPdsC7CEsTXneOpkjnnXlwnn-pinIqHtjwVApxNU','2024-09-22 09:09:06.117264'),('dfajjo33ew3lg5iina2di94isjdmakda','.eJxVjMEOwiAQBf-FsyHAQgGP3v0GwsIiVQNJaU_Gf9cmPej1zcx7sRC3tYZt0BLmzM5MstPvhjE9qO0g32O7dZ56W5cZ-a7wgw5-7Zmel8P9O6hx1G9NVpICrRQ5KOCUIRR-sgjoyWLOmozQykG2KVGaJJRikhe-FG2NB2TvD9s_N-k:1sT1IH:32gawtG0_D5_s75fyufXsU73hudxH1Nvkaohiq1DNw4','2024-07-28 15:37:45.276000'),('el37mbg3zrww3ekh5fw1jnd6cda31nff','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1sUkMw:6VA8x97VrI3-VTslFHf6cMNPSh4QG1xRl8civa_j1qM','2024-08-02 09:57:42.011000'),('lfo2hzg71nyad0s9bq21gge2j2ohadin','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1snxjr:wN_nnwXaVnx9SoT-he5XwhKeZCLvJdD-9cFvDXMJyx0','2024-09-24 10:04:47.093635'),('ou6x4em1fad82xd1ixsxn2ga1t3c676z','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1slWpl:nfx8q2x56Ksq-DanraMOIsBii-rBhZvVvnDFr7oegLA','2024-09-17 16:56:49.524585'),('rd1hxtsj1dd3rreinep8wdn74bp409h4','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1snIIm:UOaOEHBtoYOVv2hgtX-_AwFb_sWhJF2iV9eQf4E7-wA','2024-09-22 13:50:04.887019'),('sfonlin3h4cderm6hfqzrj1p8ncf9tmr','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1sjhgf:Qxy4Nj5GO9vkU27_HS8l2bENib0YTh5HGxQIp8n1tI4','2024-09-12 16:07:53.503899'),('stvfuqyn8fd6jckgxkh8r4gzlidm9gbr','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1sjbOw:C8WV5uARD_bjNL5kE5rnH2_2mXLtP2i0xu2sL3rabDc','2024-09-12 09:25:10.417461'),('ue2fjvrx1i9m5ztfdkowltm92xmc27q5','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1smxAa:hGZNKfQ4QAtfWBOsdF1jQBBqmLrh_fhOzywlAY7FeeM','2024-09-21 15:16:12.217367'),('xat481za5h4igpw3zb1mz5ufthi8oat8','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1skyDY:XPhuqSrDY3s9lacaNPy1lmRttJSFQ0Kqd58fgwEq2bI','2024-09-16 03:59:04.060214'),('xkxur7iy57hwxa07rku1ovk7a02trc5h','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1sgglE:I86RXHo5PVaWxjXwBUW-dG1Tv_3tmvdhDPL7Q6L8zBQ','2024-09-04 08:32:08.578000'),('xzl47fctwwx04p1xr35b6i7p8x0pua7y','.eJxVjDsOwjAQBe_iGln-O0tJzxks765NAsiR4qRC3B0ipYD2zcx7iZS3dUxbL0uaWJxFFKffDTM9StsB33O7zZLmti4Tyl2RB-3yOnN5Xg7372DMffzWoJTxNjoOWAAIQoglIlZNYLxnZXPV1oUhIzEqA3VQgQHKYMmSJifeH9RBN7g:1sjawa:qDl3tHXlRyZ6HIpEYlZy2-oho3nHLD8C8cEXxkbAji4','2024-09-12 08:55:52.965758'),('z5rbfmh5uo6ytag8vcpo3m4xhyvy2lju','.eJxVjLsOAiEUBf-F2hCeF7C0328gPC6yaiBZdivjvxuSLbQ9M3PexIdjr_4YuPk1kysBcvndYkhPbBPkR2j3TlNv-7ZGOhV60kGXnvF1O92_gxpGnXVhRlnkigknIIFG41gIjBuWpLQJ0HGho0JU0YKWBYUUgnMoWRZbFPl8AcLSNxY:1sfhHK:kc1Ot67hhrc7MfIlUkIQcrZ-SMOhYY0GwvN6ct4FNec','2024-09-01 14:53:10.022000');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wlist_mcmodel`
--

DROP TABLE IF EXISTS `wlist_mcmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wlist_mcmodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `memo1` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `memo2` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_date` date DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wlist_mcmodel_user_id_f754928a_fk_custom_user_id` (`user_id`),
  CONSTRAINT `wlist_mcmodel_user_id_f754928a_fk_custom_user_id` FOREIGN KEY (`user_id`) REFERENCES `custom_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wlist_mcmodel`
--

LOCK TABLES `wlist_mcmodel` WRITE;
/*!40000 ALTER TABLE `wlist_mcmodel` DISABLE KEYS */;
INSERT INTO `wlist_mcmodel` VALUES (5,'帰ります！','それはだめ。町が寂れる。土地の価値が下がる。','2024-08-31',6),(7,'買い物','俺が選んであげよう。\r\n店ごと買っちゃおう。\r\nお姉さんのお金で。','2024-08-31',6),(8,'待ち合わせ','それ、きっとドタキャンされる奴。\r\nお姉さんは罠にはめられたの。\r\nそれ、脳内ともだち。','2024-08-31',6),(9,'仕事です','何か手伝うよ。俺にもできることはあるはず。','2024-08-31',6),(10,'肌きれいですね','この周辺だけ光ってる。なんか明るくなってる。','2024-09-01',6),(11,'待ち合わせ','それ、ドタキャンされる奴。きっと罠にはめられたんだ。','2024-09-01',8),(12,'買い物','俺が選んでやるよ。店ごと買おう。お姉さんの金で。','2024-09-01',8),(13,'仕事です','手伝ってあげるよ。俺にもできることがあるはず。','2024-09-01',8),(14,'帰ります','それはだめ。町が寂れる・落ちぶれる。','2024-09-01',8),(15,'肌きれい','肌、光ってる。この周囲だけ明るくなってる。','2024-09-01',8),(16,'test','test','2024-09-02',6),(18,'test','aaaaaaaaaaaaaaaaaaaa','2024-09-09',6);
/*!40000 ALTER TABLE `wlist_mcmodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wlist_memomodel`
--

DROP TABLE IF EXISTS `wlist_memomodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wlist_memomodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `memo` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reg_date` date DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wlist_memomodel_user_id_23410b3a_fk_custom_user_id` (`user_id`),
  CONSTRAINT `wlist_memomodel_user_id_23410b3a_fk_custom_user_id` FOREIGN KEY (`user_id`) REFERENCES `custom_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wlist_memomodel`
--

LOCK TABLES `wlist_memomodel` WRITE;
/*!40000 ALTER TABLE `wlist_memomodel` DISABLE KEYS */;
INSERT INTO `wlist_memomodel` VALUES (2,'get_context_dataは、templateで2以上のモデルを使いたい場合に、親クラスのListViewをオーバーライドして導入。','2024-07-18',6),(3,'*argsは、複数の引数をタプルとして受け入れいる。**kwargsは辞書引数を受け入れる。','2024-07-18',6),(4,'viewsで実行される    \r\ndef form_valid(self, form):は、フォーム入力送信時のデータをモデルに保存するために実行されるバリデータ','2024-07-19',6),(5,'スタイル定義の優先度は、\r\nhtmlのstyle > htmlのインライン> css.style > form.pyのwidget定義','2024-07-19',6),(6,'formタグ内のinputタグに、さまざまなtypeを割り当てて多様な入力に対応できる。例えば、submit、text、button、radioなど','2024-07-20',6),(8,'<textarea>タグでcol=300として横文字数を設定できるが、 style=\"width: 100%;\"のほうが優先される。\r\n    <textarea id=\"memo\" name=\"memo\" rows=\"6\" cols =\"300\" style=\"width: 100%;\">{{ form.memo.value }}</textarea>','2024-07-21',6),(9,'viewsでmixinのライブラリを使って、機能を持たせる。','2024-07-21',6),(10,'get_context_data メソッドは、htmlテンプレートにコンテキストデータを渡すためのもの','2024-07-21',6),(11,'align-items: flex-startで左から開始。centerで中央配置','2024-07-22',6),(12,'tldraw,make real, cursor, ui sketcherを使ってフロントエンド開発を効率化。','2024-07-23',6),(15,'WordsModel.objects.filter(             user=self.request.user,             reg_date=today.date()         )クエリセットはリストのように振る舞いますが、実際には遅延評価されるため、クエリが実行されるまでデータベースからはデータが取得されません。','2024-07-23',6),(16,'テンプレート埋め込みfor文では、forloop.firstとかforloop.counter0などとして条件とか変数設定を行える。','2024-07-24',6),(17,'divのスタイル設定で、dispaly:blockは縦方向に子要素を配置し、display:flexは横方向に子要素を配置する','2024-07-24',6),(20,'リンターは、コーディング解析をして品質をチェックするツール。CI/CD（コミット時に自動的にビルド、テスト、デプロイするツール）にリンターを組み込んだりする。\r\nGit Hub Actionsは、レポジトリに対してCI/CDパイプラインを構築するためのツール。','2024-07-26',6),(21,'display: blockは、ブロック要素ではデフォルト。縦に要素を並べる。インライン要素で入力すると、ブロック要素になる。\r\ndisplay: flex; flex-direction: column; は、複数要素を束ねて縦に並べて束ねられた複数要素全体としてスタイルを提供する。','2024-07-27',6),(22,'justify-contentは、flex-direction軸に平行な位置合わせ。\r\nalign-itemsは、flex-direction軸に垂直な位置合わせ。\r\nこれらにcenterや、flex-startを入力しても異なる効果。','2024-07-27',6),(23,'SQLで、シングルクォート ’  ’ は文字リテラルを囲むために使用される。ダブルクォート ” ” は識別子（カラム名、テーブル名）を囲むために使用される。\r\nDBMSによって異なることがある。','2024-07-29',6),(24,'update 商品 set 商品コード=\'E\' || substring(商品コード,2,4) where substring(商品コード,1,1)=\'M\'','2024-07-29',6),(25,'truncは切り捨て。数値や日付で。第2引数を省略すると、数値の場合は0、すなわち小数点、日付の場合は日の単位で切り捨てられる。日付の場合は、’yyyy’とか’MM’と入力する。','2024-07-29',6),(26,'OFFSET 10 ROWS\r\nFETCH NEXT 10 ROWS ONLY;\r\n最初の10番目までをスキップして次の10行を取得する。\r\noffset 0 rows ならスキップ無しで10行とってくるということ。','2024-07-29',6),(27,'get_querysetとget_context_data:\r\nデータ取得のロジックが複雑でなく、単純にデータを表示するだけなら get_queryset が適しています。データを加工したり、追加のコンテキスト情報をテンプレートに渡す必要がある場合は get_context_data を使うべきです。','2024-07-29',6),(28,'行方向（row)は、横方向に相当し、列方向（column）は、縦方向に対応する。\r\n１．CSS、Numpy、エクセルでの共通概念。\r\n２．そもそも英語のrowとcolumnの概念は、日本語の「行」と「列」の意味と完全一致せず、日本語に翻訳せずに考えるべき。rowは、町・通り・漕ぐ、（横）列を、columnは柱、縦列などを意味する。\r\n３．行番号（row番号）、列名（column名称）','2024-07-29',6),(29,'flex:1 1 auto;の3つのパラメータは、grow、shrink、basis。\r\ngrowは、0で拡大不許可、1で拡大許可、2で他よりも2倍拡大しやすくする。\r\nshrinkは、0で縮小不許可し1で縮小許可。\r\nbasisは初期サイズであり、autoとすると自然なサイズとなる。','2024-07-31',6),(31,'where 商品コード like \'Z%\'　　　　\r\n冒頭がZとなる商品コード','2024-08-10',6),(32,'クエリ文字列。　　　\r\n動的ページを作成するために、URLの一部としてサーバ側に送信する文字列のこと。viewにおいて、request.GETで取得する。','2024-08-12',6),(33,'URLconfは、urls.pyで定義される、URLとviewsをマッチングする設定（地図）。URLディスパッチャは、ユーザーがアクセスしたURLに基づいて、Djangoが適切なビューを呼び出す仕組みを指します（ガイド）。','2024-08-12',6),(34,'update 注文 \r\nset 商品コード=(select 商品コード from 商品\r\nwhere 商品名 like \'%ブーツ%\' and\r\n商品名 like \'%雨%\' and\r\n商品名 like \'%安心%\' and 商品区分=\'2\')\r\nwhere 注文番号=\'201803150014\' and\r\n注文枝番=1','2024-08-12',6),(35,'linuxOS-docker engine-docker container。\r\ndocker image が設計図。コンテナからimageを作ることもできる。linuxOSにてカーネル部分を担当し、container部分には一部のLinuxOSが入る。','2024-08-13',6),(36,'リバースプロキシは、クライアントとバックエンドサーバーの間に立って通信を中継し、さまざまな機能（ロードバランシング：複数のバックエンドサーバーにリクエストを分散する、セキュリティ強化、キャッシングなど）を提供する技術です。','2024-08-14',6),(37,'docker runは、docker hubからのpullと、createと、startをまとめて実行。','2024-08-14',6),(38,'select A.数量合計 as 販売数量,TRUNC(A.割引料合計/A.数量合計)\r\nfrom (select sum(数量) as 数量合計,\r\nsum(クーポン割引料) as 割引料合計\r\nfrom 注文 where 商品コード=\'W0746\'\r\nand クーポン割引料 is not null) as A','2024-08-20',6),(39,'insert into 注文\r\nselect 注文日, 注文番号, MAX(注文枝番)+1,\r\n\'S1003\',1,Null from 注文\r\nwhere 注文日=\'2018-03-21\' and 注文番号=\'201803210080\' \r\ngroup by 注文日,注文番号','2024-08-20',6),(40,'linuxOS-docker engine-docker container。\r\ndocker image が設計図。コンテナからimageを作ることもできる。linuxOSにてカーネル部分を担当し、container部分には一部のLinuxOSが入る。','2024-08-13',7),(41,'リバースプロキシは、クライアントとバックエンドサーバーの間に立って通信を中継し、さまざまな機能（ロードバランシング：複数のバックエンドサーバーにリクエストを分散する、セキュリティ強化、キャッシングなど）を提供する技術です。','2024-08-14',7),(42,'docker runは、docker hubからのpullと、createと、startをまとめて実行。','2024-08-14',7),(43,'select A.数量合計 as 販売数量,TRUNC(A.割引料合計/A.数量合計)\r\nfrom (select sum(数量) as 数量合計,\r\nsum(クーポン割引料) as 割引料合計\r\nfrom 注文 where 商品コード=\'W0746\'\r\nand クーポン割引料 is not null) as A','2024-08-20',7),(44,'insert into 注文\r\nselect 注文日, 注文番号, MAX(注文枝番)+1,\r\n\'S1003\',1,Null from 注文\r\nwhere 注文日=\'2018-03-21\' and 注文番号=\'201803210080\' \r\ngroup by 注文日,注文番号','2024-08-20',7),(45,'selfが現在のクラスのインスタンスを指すのに対して、super()は親クラスのメソッドを呼び出すために使われるものです。','2024-08-29',6),(47,'test','2024-09-02',6),(48,'test','2024-09-02',6),(49,'テスト','2024-09-08',6),(50,'習慣化（日記、時間割アプリなど）することで、人生の質を向上させていく。日用品などは、何も考えないで自分のQOLが上昇するものを取り入れていく。MZ氏','2024-09-10',6),(51,'営業にはウェブ営業とリアル営業の２つがある。前者はコピーライティング（人を動かす文章）で、手掛けていくことでうまくなっていく。経営者は、自分でチラシがかける、HPやLPの良しあしが分かるようになりましょう。ライザップのチラシは勉強になる。','2024-09-10',6),(52,'４つの見ないという壁をどのように突破するか（キャッチコピー、権威性の記述、USPなど）。権威性・信頼性の獲得のために、雑誌の広告枠を安く大量に購入する方法がある。ほかでは言われていないような切り口があるか（目新しさなど）、疑念（権威性や、テスト展開などの実績で補う）、行動しないという壁（プレミア付けて解決）。','2024-09-10',6);
/*!40000 ALTER TABLE `wlist_memomodel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wlist_wordsmodel`
--

DROP TABLE IF EXISTS `wlist_wordsmodel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wlist_wordsmodel` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `word` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mean1` varchar(15) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mean2` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reg_date` date DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `wlist_wordsmodel_user_id_64bda923_fk_custom_user_id` (`user_id`),
  CONSTRAINT `wlist_wordsmodel_user_id_64bda923_fk_custom_user_id` FOREIGN KEY (`user_id`) REFERENCES `custom_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wlist_wordsmodel`
--

LOCK TABLES `wlist_wordsmodel` WRITE;
/*!40000 ALTER TABLE `wlist_wordsmodel` DISABLE KEYS */;
INSERT INTO `wlist_wordsmodel` VALUES (3,'star','スター','星,星形のもの,星章,星形勲章,星印,(ホテル・レストランなどの格付けに用いる)星印,スター,花形,人気者,星回り','2024-07-07',2),(11,'ship','船','(大きい)船,(交通手段として見た)船,競漕用ボート,飛行船,(大型の)航空機,宇宙船,(船の)全乗組員','2024-07-09',1),(19,'zombi','ゾンビ','果汁と通常アプリコットリキュールでつくる数種類のラム,機械仕掛けのように無感情に動いたり反応したりする人,超自然的な力によって息を吹き返した死体,特に西インド諸島で崇拝される、アフリカを起源とするヴードゥー教の神,死体を生き返らせる霊あるいは超自然的な力','2024-07-18',6),(20,'symphony','シンフォニー','交響曲,シンフォニー','2024-07-18',6),(22,'moderate','控えめ','(極端に走らず)節度のある,穏健な,度を越さないで,節度があって,(量・大きさ・程度・質など)適度の,中くらいの,並の,高価でない,手ごろな,(比較的)安い','2024-07-19',6),(33,'enforcement','執行','(法律などの)施行,執行,(服従などの)強制,(意見などの)強調','2024-07-21',6),(35,'lunatic','でんぱなやつ','精神異常者,狂人,変人,愚人','2024-07-21',6),(45,'positive','ポジティブ','明確な,疑いのない,否定しがたい,はっきりした,直截な,完全な,まったくの,確信して,(…を)確信して,自信のある','2024-07-22',6),(53,'ascend','登る','(上方に)登る,上がる,立ちのぼる,上りになる,騰貴する,(地位的に)向上する','2024-07-23',6),(56,'contractor','請負業者','契約者,請負人,土建業者','2024-07-25',6),(57,'compartment','コンパートメント','区画,仕切り,(英国などの列車の)仕切り客室,コンパートメント','2024-07-25',6),(59,'spacious','広い','広々とした,雄大な','2024-07-25',6),(60,'discontinued','生産中止','discontinueの過去形、または過去分詞。(…を)(続けることを)やめる,  停止する, 中止する','2024-07-25',6),(62,'tuition','学費','教授,授業,授業料,月謝','2024-07-25',6),(63,'municipal','都市','(自治権を持つ)都市の,市の,市営の,地方自治体の','2024-07-25',6),(64,'landmark','名所','(陸上の)目印(となるもの),陸標,(土地の)境界標,顕著な事件','2024-07-26',6),(65,'recipient','受取人','受取人,受領者,受容者,レシピエント','2024-07-26',6),(66,'managerial','経営上','支配人の,経営(上)の,管理(上)の','2024-07-26',6),(67,'attire','服装','(…で)盛装する','2024-07-26',6),(68,'reimburse','弁償','費用などを払い戻す,弁済する,弁償する,返済する','2024-07-26',6),(69,'enroll','登録','エンロール','2024-07-28',6),(70,'proficiency','熟練','熟達,堪能(たんのう)','2024-07-28',6),(71,'acclaimed','絶賛','acclaimの過去形、または過去分詞。盛んなかっさいを送る','2024-07-28',6),(72,'medication','投薬','薬物治療,薬,薬品','2024-07-28',6),(73,'an array of','の配列','ずらりと並んだ','2024-07-28',6),(74,'informative','有益な','知識を与える,教育的な,有益な','2024-07-29',6),(75,'voucher','券','保証人,証明者,(旅行業者・企業体などが旅行者・従業員などに渡す)クーポン券,商品引換券,商品割引券,証拠書類,証書,(特に金銭の)領収証,受取','2024-07-29',6),(76,'correspondence','通信','文通,(手紙による)通信,往復文書,書状,一致,調和,相応,対応,該当','2024-07-29',6),(77,'detergent','洗剤','洗浄性の','2024-07-29',6),(78,'duration','存続期間','持続(期),存続(期間)','2024-07-29',6),(79,'imburse','インバース','《古》金銭を与える','2024-07-29',6),(80,'superb','素晴らしい','(他を圧するほど)すばらしい,すてきな,実に見事な,とび切り上等な,堂々とした,壮麗な','2024-07-30',6),(81,'nationwide','全国','全国的な','2024-07-30',6),(82,'last-minute','土壇場','最後の瞬間の,どたん場での','2024-07-30',6),(83,'thrilled','わくわく','感激している　thrillの過去形、または過去分詞。(快感・恐怖などで)ぞくぞくする感じ, スリル','2024-07-30',6),(84,'introdutory','紹介','入門の、最初の','2024-07-30',6),(85,'prestigious','一流','名声のある','2024-07-30',6),(88,'screening','上映、検査','(映画・テレビなどの)上映,映写,審査,選抜,選考,スクリーニング,審査の(ための),集団検診,(窓などの防虫用)網,金網','2024-07-31',6),(89,'periodical','定期刊行物','定期刊行の','2024-07-31',6),(90,'plumber','配管工','(ガス・スチーム・上下水道の)配管工,鉛管工,水道業者','2024-07-31',6),(91,'incur','まねく','(ある行為の結果として)負う,受ける,招く','2024-07-31',6),(92,'oversee','オーバーシーズ','監督する','2024-07-31',6),(93,'retrieve','取り出す','(…を)取り戻す,回収する,救う,救い出す,(…を)回復する,復旧する,挽回(ばんかい)する,埋め合わせる,つぐなう,繕(つくろ)う','2024-08-01',6),(94,'reunion','再会','再会の集い,親睦会,同窓会,クラス会,再会,再結合','2024-08-01',6),(95,'apprentice','見習い','(昔の)徒弟,年季奉公人,初心者,実習生,練習生','2024-08-01',6),(96,'proceeds','収益','売上高,収益','2024-08-01',6),(97,'outing','外出','遠出,遠足,ピクニック,遊山','2024-08-01',6),(98,'refrain','リフレイン','(…を)控える,断つ,やめる,我慢する','2024-08-02',6),(99,'inclement','インクレメント','(寒さまたは風雨のために)不良な,荒れ模様の','2024-08-02',6),(100,'increment','インクリメント','増加,増大,増進,増殖,増加量,増額,利益,利得','2024-08-02',6),(101,'novice','ニュース','初心者,未熟者,初出場の馬,修練士,新信者','2024-08-02',6),(102,'anecdote','アネクドート','(特定の人物・事件にまつわる)逸話','2024-08-02',6),(103,'commemorate','偲ぶ','(祝辞によって)(…を)記念する,(…の)記念式を挙行する,祝する,(…の)記念となる','2024-08-03',6),(104,'intermission','休憩','休止,中断,(芝居などの)幕間(まくあい),休憩時間','2024-08-03',6),(105,'compost','堆肥','堆肥(たいひ),積み肥え','2024-08-03',6),(106,'proofread','校正','(…を)校正する','2024-08-03',6),(107,'solicit','募る','(…を)懇請する,せがむ,(…に)(…を)懇請する,(…を)(贈賄して)悪事に誘う,誘う,声をかける','2024-08-03',6),(108,'applicable','該当','適用できる,当てはまる,適切な,(…に)適用できて,当てはまって,適切で','2024-08-04',6),(109,'commend','讃する','ほめる,推賞する,(…に)推薦する,勧める,ゆだねる,託する','2024-08-04',6),(110,'complement','補足','補足して完全にするもの,補足物,(完全にするのに必要な)全数,乗組定員,補語,余数,余角,余弧','2024-08-04',6),(111,'compliment','賛辞','賛辞,ほめ言葉,(社交上の)お世辞,(行為・言葉などによる)敬意,光栄なこと,(儀礼的な)あいさつ(の言葉),祝辞','2024-08-04',6),(112,'lapse','失効','(ちょっとした)間違い,しくじり,経過,推移,(過去の短い)期間,時間,喪失,衰退,廃止,一時的にそれること','2024-08-04',6),(113,'prospective','プロスペクティブ','将来の,予期される,見込みの(ある)','2024-08-05',6),(114,'surplus','余剰','余り,過剰,(金銭の)黒字,剰余金','2024-08-05',6),(115,'advocate','擁護者','主唱者,唱道者,代弁者','2024-08-05',6),(116,'aspiring','抱負','高い目標を目ざしている,野心のある','2024-08-05',6),(117,'credentials','証明書','credentialの複数形。(大使・公使などに授ける)信任状。','2024-08-05',6),(120,'malfunction','誤動作','(臓器・機械などの)機能不全,故障','2024-08-06',6),(121,'obstruct','妨げる','ふさぐ,遮断する,さえぎる,進行を妨害する','2024-08-07',6),(122,'agreeable','良い','快い,感じのよい,(…に)快くて,気持ちよくて,(…に)喜んで同意して,賛成して','2024-08-07',6),(123,'dominant','支配的','支配的な,最も有力な,優勢な,(群を抜いて)高い,そびえる,優性の,第 5 度の,属音の','2024-08-07',6),(124,'prosperous','盛ん','繁栄する,富裕な,(経済的に)成功した,好都合の,順調な','2024-08-07',6),(125,'reluctant','気が向かない','不承不承の,いやいやながらの,しぶしぶの,しぶって,いやがって,気が進まなくて','2024-08-07',6),(126,'coincide','同じ','同時に起こる,(…と)同時に起こる,符合する,一致する,(…と)符合する,(…と)合致する','2024-08-09',6),(128,'concise','簡潔','簡潔な,簡明な','2024-08-09',6),(129,'delegation','代表団','代表任命,代表派遣,代表団,委任','2024-08-09',6),(130,'enforce','強制する','実施する,施行する,強いる,強要する,強める,強調する,強く主張する','2024-08-09',6),(131,'predecessor','前任者','前任者,先輩,前にあったもの,前のもの','2024-08-09',6),(132,'adoption','採用','採用(すること,されること),採択,養子縁組','2024-08-10',6),(133,'appraisal','評価','値踏み,評価,鑑定,見積もり,査定,見積もり価格,査定額','2024-08-10',6),(134,'adhere','付く','(互いにしっかりと)くっつく,くっついて離れない,(…に)付着する,粘着する,執着する,(…を)支持する','2024-08-10',6),(135,'distraction','注意散漫','気の散ること,気を散らすこと,注意散漫,気を紛らすもの,気晴らし,娯楽,心の混乱,動揺,乱心','2024-08-10',6),(136,'integral','インテグラル','(完全体をなすのに)不可欠な,必須の,完全な,整数の,積分の','2024-08-10',6),(137,'interact','対話','(…と)相互に作用する,互いに影響し合う','2024-08-12',6),(138,'embrace','抱擁','(愛情をもって)抱擁する,抱き締める,(…を)取り囲む,取り巻く,含む,包含する,(…を)包含する,乗ずる,喜んで応ずる,取り入れる','2024-08-12',6),(139,'synthetic','合成','総合の,統合的な,合成の,本物でない,にせの,人工的な','2024-08-12',6),(140,'deduct','差し引く','控除する','2024-08-12',6),(141,'quota','クォーター','分担分,割り当て,(製造・輸出入などの)規定数量,(受け入れる移民・会員・学生などの)定数・定員','2024-08-12',6),(143,'dispatch','派遣','(…へ)急派する,特派する,(…へ)発送する,さっさと済ます,処刑する,(…を)殺す','2024-08-12',6),(145,'abridged','簡略化','abridgeの過去形、または過去分詞。要約する','2024-08-13',6),(146,'subsequent','次','その次の,続いて起こる,あとの,その後の,(…に)続いて起こって,続いて,(…の)後に','2024-08-13',6),(147,'thoughtfully','よくよく','思慮と思慮深さを示す,思慮深い方法で','2024-08-13',6),(148,'carpool','相乗り','カープール','2024-08-13',6),(149,'compatible','適合','(…と)(調和して)両立できて,矛盾なく,一致して,両立式の,コンパチ式の,互換性のある','2024-08-13',6),(150,'endorse','裏づける','裏書きをする,裏に違反事項を書き入れる,是認する,支持する,(広告文・コマーシャルで)推奨する','2024-08-14',6),(151,'explicit','明示的','明白な,はっきりした,明示的な,腹蔵のない,露骨な','2024-08-14',6),(152,'plaque','プレート','(金属・焼き物・ぞうげなどでできた)額,飾り板,(事件・人物などを記念するための金属または石製などの)銘板,刻板,歯垢(しこう)','2024-08-14',6),(153,'exempt','エグゼンプト','免除する','2024-08-14',6),(154,'centerpiece','センターピース','(テーブルなどの)中央部装飾,センターピース,(計画・演説などの)最も重要なもの,「目玉」','2024-08-14',6),(155,'oversight','見落とし','見落とし,手落ち,監視,監督','2024-08-16',6),(156,'recur','ぶり返す','再発する,繰り返される,再び浮かぶ,回想される,(…に)戻る,回想する,立ち返って話す,循環する','2024-08-16',6),(157,'skeptical','懐疑的','懐疑的な,疑い深い,懐疑的で,信用しないで,無神論的な','2024-08-16',6),(158,'artifact','アーティファクト','(天然物に対して)人工物,工芸品,芸術品,(自然の遺物に対して)人工遺物,文化遺物','2024-08-16',6),(159,'breathtaking','息をのむような','はらはらさせる,あっと言わせるような','2024-08-18',6),(160,'cubicle','キュービクル','(寮などの仕切った)小寝室,(仕切りのある)個人用小室','2024-08-18',6),(161,'outage','供給停止','停電,停電時間','2024-08-18',6),(162,'perishable','割れ易い','腐敗しやすい','2024-08-18',6),(163,'avid','熱心','貪欲(どんよく)な,熱心な,(…を)渇望して,(…が)ほしくてたまらなくて','2024-08-18',6),(164,'detour','迂回路','遠回り,回り道,迂回路','2024-08-20',6),(165,'vicinity','側','近所,付近,近隣地,周辺,近くにあること,近接','2024-08-20',6),(167,'expedite','拍車をかける','はかどらせる,促進する,手早く片づける','2024-08-20',6),(168,'affiliated','同系列','提携している,系列下の,支部の,密接な関係のある,(…に) 加入して,(…と)合併して,提携して,(…の)系列下にあって','2024-08-20',6),(169,'definitive','決定的','決定的な,最終的な,最も完全で正確な,最も信頼のおける','2024-08-20',6),(170,'deteriorate','不良','悪くする,悪化させる,(…を)下等にする,(…の)質を低下させる,堕落させる','2024-08-23',6),(171,'sturdy','頑丈','(体が)たくましい,頑健な,丈夫な,頑丈な,頑強な,不屈の,しっかりした,健全な','2024-08-23',6),(172,'intact','手付かず','手をつけてなくて,そこなわれていなくて,(そっくり)そのままで,完全で','2024-08-23',6),(173,'unanimous','全員一致','(…に)合意して,同意見で,合意して,満場一致の,異口同音の','2024-08-23',6),(174,'turnover','ターンオーバー','(車などの)転覆,転倒,(資金などの)回転率,(一定期間の)取引高,総売上高,転職率,ターンオーバー','2024-08-23',6),(275,'bearer','ベアラ','運ぶ人,運搬人,かごかき,(小切手・手形の)持参人,(手紙の)使者,実のなる草木','2024-08-26',6),(278,'commensurate','見合った','(…と)同一基準で,(…と)比例して,釣り合って,(…に)ふさわしくて','2024-08-26',6),(279,'adverse','鹹い','逆らう,反対の,(…に)反対で,反して,不利な,不運な,(…に)不利で','2024-08-26',6),(280,'unprecedented','前代未聞','先例のない,空前の,前代未聞の,新しい,新奇な','2024-08-26',6),(281,'consecutive','連続','連続する,引き続く,結果を表わす','2024-08-26',6),(289,'entail','包含する','(…を)必然的に伴う,必要とする,(…に)かからせる,課する,相続人を限定する,相続人を(…に)限定して譲る','2024-09-05',6),(290,'foremost','一流','いちばん先の,真っ先の,主流を占める,主要な','2024-09-05',6),(291,'imperative','必要不可欠','ぜひともしなければならない,緊急の,必須で,肝要で,命令的な,断固とした,威厳のある,厳然たる,命令法の','2024-09-05',6),(292,'meticulously','几帳面に','注意深く','2024-09-05',6),(293,'mandatory','必須','義務的な,強制の,必須の,命令の,委任の,委任された','2024-09-05',6),(294,'outreach','福祉活動','(…を)しのぐ,(…に)まさる','2024-09-08',6),(295,'versatile','用途が広い','多才の,多芸な,多方面にわたる,何をやらせてもうまい,多目的に使用できる,何にでも利用できる','2024-09-08',6),(296,'tenure','在職期間','(不動産の)保有,保有,保持,保有期間,保有条件,(在職期間後に与えられる)身分保障(権),(大学教授などの)終身在職権','2024-09-08',6),(297,'alleviate','和らげる','軽くする,緩和する,楽にする','2024-09-08',6),(298,'exemplary','模範的','模範的な,模範となる,見せしめの,戒めの(ための),典型的な,代表的な','2024-09-09',6),(299,'gala','はれがましい','お祭りの,お祭り騒ぎの,特別の催しの,ガラの','2024-09-09',6),(301,'mural','壁画','壁(上)の','2024-09-09',6),(302,'proprietor','経営者','(商店・ホテル・土地などの)持ち主,所有者,経営者,事業主','2024-09-09',6),(303,'stagnant','停滞','流れない,よどんでいる,停滞した,不活発な,不景気な','2024-09-09',6),(304,'faucet','蛇口','(水道・たるの)飲み口,蛇口,栓,コック','2024-09-11',6),(305,'testimonial','推薦文','(人物・資格などの)証明書,推薦状,感謝状,表彰状,賞状,功労表彰の贈り物','2024-09-11',6),(306,'waive','放棄','(進んで)放棄する,差し控える,延ばす,先延ばしする','2024-09-11',6),(307,'turnout','参加者数','(集会などの)出席者(数),産額,生産高,身じたく,着こなし,装備,(鉄道などの)待避線,(道路上の)車の退避所,(引き出しなどの)中身を外に出すこと','2024-09-11',6),(308,'fraud','詐欺','詐欺,欺瞞(ぎまん),詐欺行為,不正手段,詐欺師,ぺてん師,偽物','2024-09-11',6),(2094,'zombi','ゾンビ','果汁と通常アプリコットリキュールでつくる数種類のラム,機械仕掛けのように無感情に動いたり反応したりする人,超自然的な力によって息を吹き返した死体,特に西インド諸島で崇拝される、アフリカを起源とするヴードゥー教の神,死体を生き返らせる霊あるいは超自然的な力','2024-07-19',7),(2095,'symphony','シンフォニー','交響曲,シンフォニー','2024-07-19',7),(2096,'moderate','控えめ','(極端に走らず)節度のある,穏健な,度を越さないで,節度があって,(量・大きさ・程度・質など)適度の,中くらいの,並の,高価でない,手ごろな,(比較的)安い','2024-07-20',7),(2097,'enforcement','執行','(法律などの)施行,執行,(服従などの)強制,(意見などの)強調','2024-07-22',7),(2098,'lunatic','でんぱなやつ','精神異常者,狂人,変人,愚人','2024-07-22',7),(2099,'positive','ポジティブ','明確な,疑いのない,否定しがたい,はっきりした,直截な,完全な,まったくの,確信して,(…を)確信して,自信のある','2024-07-23',7),(2100,'ascend','登る','(上方に)登る,上がる,立ちのぼる,上りになる,騰貴する,(地位的に)向上する','2024-07-24',7),(2101,'contractor','請負業者','契約者,請負人,土建業者','2024-07-26',7),(2102,'compartment','コンパートメント','区画,仕切り,(英国などの列車の)仕切り客室,コンパートメント','2024-07-26',7),(2103,'spacious','広い','広々とした,雄大な','2024-07-26',7),(2104,'discontinued','生産中止','discontinueの過去形、または過去分詞。(…を)(続けることを)やめる,  停止する, 中止する','2024-07-26',7),(2105,'tuition','学費','教授,授業,授業料,月謝','2024-07-26',7),(2106,'municipal','都市','(自治権を持つ)都市の,市の,市営の,地方自治体の','2024-07-26',7),(2107,'landmark','名所','(陸上の)目印(となるもの),陸標,(土地の)境界標,顕著な事件','2024-07-27',7),(2108,'recipient','受取人','受取人,受領者,受容者,レシピエント','2024-07-27',7),(2109,'managerial','経営上','支配人の,経営(上)の,管理(上)の','2024-07-27',7),(2110,'attire','服装','(…で)盛装する','2024-07-27',7),(2111,'reimburse','弁償','費用などを払い戻す,弁済する,弁償する,返済する','2024-07-27',7),(2112,'enroll','登録','エンロール','2024-07-29',7),(2113,'proficiency','熟練','熟達,堪能(たんのう)','2024-07-29',7),(2114,'acclaimed','絶賛','acclaimの過去形、または過去分詞。盛んなかっさいを送る','2024-07-29',7),(2115,'medication','投薬','薬物治療,薬,薬品','2024-07-29',7),(2116,'an array of','の配列','ずらりと並んだ','2024-07-29',7),(2117,'informative','有益な','知識を与える,教育的な,有益な','2024-07-30',7),(2118,'voucher','券','保証人,証明者,(旅行業者・企業体などが旅行者・従業員などに渡す)クーポン券,商品引換券,商品割引券,証拠書類,証書,(特に金銭の)領収証,受取','2024-07-30',7),(2119,'correspondence','通信','文通,(手紙による)通信,往復文書,書状,一致,調和,相応,対応,該当','2024-07-30',7),(2120,'detergent','洗剤','洗浄性の','2024-07-30',7),(2121,'duration','存続期間','持続(期),存続(期間)','2024-07-30',7),(2122,'imburse','インバース','《古》金銭を与える','2024-07-30',7),(2123,'superb','素晴らしい','(他を圧するほど)すばらしい,すてきな,実に見事な,とび切り上等な,堂々とした,壮麗な','2024-07-31',7),(2124,'nationwide','全国','全国的な','2024-07-31',7),(2125,'last-minute','土壇場','最後の瞬間の,どたん場での','2024-07-31',7),(2126,'thrilled','わくわく','感激している　thrillの過去形、または過去分詞。(快感・恐怖などで)ぞくぞくする感じ, スリル','2024-07-31',7),(2127,'introdutory','紹介','入門の、最初の','2024-07-31',7),(2128,'prestigious','一流','名声のある','2024-07-31',7),(2129,'screening','上映、検査','(映画・テレビなどの)上映,映写,審査,選抜,選考,スクリーニング,審査の(ための),集団検診,(窓などの防虫用)網,金網','2024-08-01',7),(2130,'periodical','定期刊行物','定期刊行の','2024-08-01',7),(2131,'plumber','配管工','(ガス・スチーム・上下水道の)配管工,鉛管工,水道業者','2024-08-01',7),(2132,'incur','まねく','(ある行為の結果として)負う,受ける,招く','2024-08-01',7),(2133,'oversee','オーバーシーズ','監督する','2024-08-01',7),(2134,'retrieve','取り出す','(…を)取り戻す,回収する,救う,救い出す,(…を)回復する,復旧する,挽回(ばんかい)する,埋め合わせる,つぐなう,繕(つくろ)う','2024-08-02',7),(2135,'reunion','再会','再会の集い,親睦会,同窓会,クラス会,再会,再結合','2024-08-02',7),(2136,'apprentice','見習い','(昔の)徒弟,年季奉公人,初心者,実習生,練習生','2024-08-02',7),(2137,'proceeds','収益','売上高,収益','2024-08-02',7),(2138,'outing','外出','遠出,遠足,ピクニック,遊山','2024-08-02',7),(2139,'refrain','リフレイン','(…を)控える,断つ,やめる,我慢する','2024-08-03',7),(2140,'inclement','インクレメント','(寒さまたは風雨のために)不良な,荒れ模様の','2024-08-03',7),(2141,'increment','インクリメント','増加,増大,増進,増殖,増加量,増額,利益,利得','2024-08-03',7),(2142,'novice','ニュース','初心者,未熟者,初出場の馬,修練士,新信者','2024-08-03',7),(2143,'anecdote','アネクドート','(特定の人物・事件にまつわる)逸話','2024-08-03',7),(2144,'commemorate','偲ぶ','(祝辞によって)(…を)記念する,(…の)記念式を挙行する,祝する,(…の)記念となる','2024-08-04',7),(2145,'intermission','休憩','休止,中断,(芝居などの)幕間(まくあい),休憩時間','2024-08-04',7),(2146,'compost','堆肥','堆肥(たいひ),積み肥え','2024-08-04',7),(2147,'proofread','校正','(…を)校正する','2024-08-04',7),(2148,'solicit','募る','(…を)懇請する,せがむ,(…に)(…を)懇請する,(…を)(贈賄して)悪事に誘う,誘う,声をかける','2024-08-04',7),(2149,'applicable','該当','適用できる,当てはまる,適切な,(…に)適用できて,当てはまって,適切で','2024-08-05',7),(2150,'commend','讃する','ほめる,推賞する,(…に)推薦する,勧める,ゆだねる,託する','2024-08-05',7),(2151,'complement','補足','補足して完全にするもの,補足物,(完全にするのに必要な)全数,乗組定員,補語,余数,余角,余弧','2024-08-05',7),(2152,'compliment','賛辞','賛辞,ほめ言葉,(社交上の)お世辞,(行為・言葉などによる)敬意,光栄なこと,(儀礼的な)あいさつ(の言葉),祝辞','2024-08-05',7),(2153,'lapse','失効','(ちょっとした)間違い,しくじり,経過,推移,(過去の短い)期間,時間,喪失,衰退,廃止,一時的にそれること','2024-08-05',7),(2154,'prospective','プロスペクティブ','将来の,予期される,見込みの(ある)','2024-08-06',7),(2155,'surplus','余剰','余り,過剰,(金銭の)黒字,剰余金','2024-08-06',7),(2156,'advocate','擁護者','主唱者,唱道者,代弁者','2024-08-06',7),(2157,'aspiring','抱負','高い目標を目ざしている,野心のある','2024-08-06',7),(2158,'credentials','証明書','credentialの複数形。(大使・公使などに授ける)信任状。','2024-08-06',7),(2159,'malfunction','誤動作','(臓器・機械などの)機能不全,故障','2024-08-07',7),(2160,'obstruct','妨げる','ふさぐ,遮断する,さえぎる,進行を妨害する','2024-08-08',7),(2161,'agreeable','良い','快い,感じのよい,(…に)快くて,気持ちよくて,(…に)喜んで同意して,賛成して','2024-08-08',7),(2162,'dominant','支配的','支配的な,最も有力な,優勢な,(群を抜いて)高い,そびえる,優性の,第 5 度の,属音の','2024-08-08',7),(2163,'prosperous','盛ん','繁栄する,富裕な,(経済的に)成功した,好都合の,順調な','2024-08-08',7),(2164,'reluctant','気が向かない','不承不承の,いやいやながらの,しぶしぶの,しぶって,いやがって,気が進まなくて','2024-08-08',7),(2165,'coincide','同じ','同時に起こる,(…と)同時に起こる,符合する,一致する,(…と)符合する,(…と)合致する','2024-08-10',7),(2166,'concise','簡潔','簡潔な,簡明な','2024-08-10',7),(2167,'delegation','代表団','代表任命,代表派遣,代表団,委任','2024-08-10',7),(2168,'enforce','強制する','実施する,施行する,強いる,強要する,強める,強調する,強く主張する','2024-08-10',7),(2169,'predecessor','前任者','前任者,先輩,前にあったもの,前のもの','2024-08-10',7),(2170,'adoption','採用','採用(すること,されること),採択,養子縁組','2024-08-11',7),(2171,'appraisal','評価','値踏み,評価,鑑定,見積もり,査定,見積もり価格,査定額','2024-08-11',7),(2172,'adhere','付く','(互いにしっかりと)くっつく,くっついて離れない,(…に)付着する,粘着する,執着する,(…を)支持する','2024-08-11',7),(2173,'distraction','注意散漫','気の散ること,気を散らすこと,注意散漫,気を紛らすもの,気晴らし,娯楽,心の混乱,動揺,乱心','2024-08-11',7),(2174,'integral','インテグラル','(完全体をなすのに)不可欠な,必須の,完全な,整数の,積分の','2024-08-11',7),(2175,'interact','対話','(…と)相互に作用する,互いに影響し合う','2024-08-13',7),(2176,'embrace','抱擁','(愛情をもって)抱擁する,抱き締める,(…を)取り囲む,取り巻く,含む,包含する,(…を)包含する,乗ずる,喜んで応ずる,取り入れる','2024-08-13',7),(2177,'synthetic','合成','総合の,統合的な,合成の,本物でない,にせの,人工的な','2024-08-13',7),(2178,'deduct','差し引く','控除する','2024-08-13',7),(2179,'quota','クォーター','分担分,割り当て,(製造・輸出入などの)規定数量,(受け入れる移民・会員・学生などの)定数・定員','2024-08-13',7),(2180,'dispatch','派遣','(…へ)急派する,特派する,(…へ)発送する,さっさと済ます,処刑する,(…を)殺す','2024-08-13',7),(2181,'abridged','簡略化','abridgeの過去形、または過去分詞。要約する','2024-08-14',7),(2182,'subsequent','次','その次の,続いて起こる,あとの,その後の,(…に)続いて起こって,続いて,(…の)後に','2024-08-14',7),(2183,'thoughtfully','よくよく','思慮と思慮深さを示す,思慮深い方法で','2024-08-14',7),(2184,'carpool','相乗り','カープール','2024-08-14',7),(2185,'compatible','適合','(…と)(調和して)両立できて,矛盾なく,一致して,両立式の,コンパチ式の,互換性のある','2024-08-14',7),(2186,'endorse','裏づける','裏書きをする,裏に違反事項を書き入れる,是認する,支持する,(広告文・コマーシャルで)推奨する','2024-08-15',7),(2187,'explicit','明示的','明白な,はっきりした,明示的な,腹蔵のない,露骨な','2024-08-15',7),(2188,'plaque','プレート','(金属・焼き物・ぞうげなどでできた)額,飾り板,(事件・人物などを記念するための金属または石製などの)銘板,刻板,歯垢(しこう)','2024-08-15',7),(2189,'exempt','エグゼンプト','免除する','2024-08-15',7),(2190,'centerpiece','センターピース','(テーブルなどの)中央部装飾,センターピース,(計画・演説などの)最も重要なもの,「目玉」','2024-08-15',7),(2191,'oversight','見落とし','見落とし,手落ち,監視,監督','2024-08-17',7),(2192,'recur','ぶり返す','再発する,繰り返される,再び浮かぶ,回想される,(…に)戻る,回想する,立ち返って話す,循環する','2024-08-17',7),(2193,'skeptical','懐疑的','懐疑的な,疑い深い,懐疑的で,信用しないで,無神論的な','2024-08-17',7),(2194,'artifact','アーティファクト','(天然物に対して)人工物,工芸品,芸術品,(自然の遺物に対して)人工遺物,文化遺物','2024-08-17',7),(2195,'breathtaking','息をのむような','はらはらさせる,あっと言わせるような','2024-08-19',7),(2196,'cubicle','キュービクル','(寮などの仕切った)小寝室,(仕切りのある)個人用小室','2024-08-19',7),(2197,'outage','供給停止','停電,停電時間','2024-08-19',7),(2198,'perishable','割れ易い','腐敗しやすい','2024-08-19',7),(2199,'avid','熱心','貪欲(どんよく)な,熱心な,(…を)渇望して,(…が)ほしくてたまらなくて','2024-08-19',7),(2200,'detour','迂回路','遠回り,回り道,迂回路','2024-08-21',7),(2201,'vicinity','側','近所,付近,近隣地,周辺,近くにあること,近接','2024-08-21',7),(2202,'expedite','拍車をかける','はかどらせる,促進する,手早く片づける','2024-08-21',7),(2203,'affiliated','同系列','提携している,系列下の,支部の,密接な関係のある,(…に) 加入して,(…と)合併して,提携して,(…の)系列下にあって','2024-08-21',7),(2204,'definitive','決定的','決定的な,最終的な,最も完全で正確な,最も信頼のおける','2024-08-21',7),(2205,'deteriorate','不良','悪くする,悪化させる,(…を)下等にする,(…の)質を低下させる,堕落させる','2024-08-24',7),(2206,'sturdy','頑丈','(体が)たくましい,頑健な,丈夫な,頑丈な,頑強な,不屈の,しっかりした,健全な','2024-08-24',7),(2207,'intact','手付かず','手をつけてなくて,そこなわれていなくて,(そっくり)そのままで,完全で','2024-08-24',7),(2208,'unanimous','全員一致','(…に)合意して,同意見で,合意して,満場一致の,異口同音の','2024-08-24',7),(2209,'turnover','ターンオーバー','(車などの)転覆,転倒,(資金などの)回転率,(一定期間の)取引高,総売上高,転職率,ターンオーバー','2024-08-24',7),(2210,'bearer','ベアラ','運ぶ人,運搬人,かごかき,(小切手・手形の)持参人,(手紙の)使者,実のなる草木','2024-08-27',7),(2211,'commensurate','見合った','(…と)同一基準で,(…と)比例して,釣り合って,(…に)ふさわしくて','2024-08-27',7),(2212,'adverse','鹹い','逆らう,反対の,(…に)反対で,反して,不利な,不運な,(…に)不利で','2024-08-27',7),(2213,'unprecedented','前代未聞','先例のない,空前の,前代未聞の,新しい,新奇な','2024-08-27',7),(2214,'consecutive','連続','連続する,引き続く,結果を表わす','2024-08-27',7),(2215,'entail','包含する','(…を)必然的に伴う,必要とする,(…に)かからせる,課する,相続人を限定する,相続人を(…に)限定して譲る','2024-09-06',7),(2216,'foremost','一流','いちばん先の,真っ先の,主流を占める,主要な','2024-09-06',7),(2217,'imperative','必要不可欠','ぜひともしなければならない,緊急の,必須で,肝要で,命令的な,断固とした,威厳のある,厳然たる,命令法の','2024-09-06',7),(2218,'meticulously','几帳面に','注意深く','2024-09-06',7),(2219,'mandatory','必須','義務的な,強制の,必須の,命令の,委任の,委任された','2024-09-06',7),(2220,'outreach','福祉活動','(…を)しのぐ,(…に)まさる','2024-09-09',7),(2221,'versatile','用途が広い','多才の,多芸な,多方面にわたる,何をやらせてもうまい,多目的に使用できる,何にでも利用できる','2024-09-09',7),(2222,'tenure','在職期間','(不動産の)保有,保有,保持,保有期間,保有条件,(在職期間後に与えられる)身分保障(権),(大学教授などの)終身在職権','2024-09-09',7),(2223,'alleviate','和らげる','軽くする,緩和する,楽にする','2024-09-09',7),(2224,'exemplary','模範的','模範的な,模範となる,見せしめの,戒めの(ための),典型的な,代表的な','2024-09-10',7),(2225,'gala','はれがましい','お祭りの,お祭り騒ぎの,特別の催しの,ガラの','2024-09-10',7),(2226,'mural','壁画','壁(上)の','2024-09-10',7),(2227,'proprietor','経営者','(商店・ホテル・土地などの)持ち主,所有者,経営者,事業主','2024-09-10',7),(2228,'stagnant','停滞','流れない,よどんでいる,停滞した,不活発な,不景気な','2024-09-10',7),(2229,'faucet','蛇口','(水道・たるの)飲み口,蛇口,栓,コック','2024-09-12',7),(2230,'testimonial','推薦文','(人物・資格などの)証明書,推薦状,感謝状,表彰状,賞状,功労表彰の贈り物','2024-09-12',7),(2231,'waive','放棄','(進んで)放棄する,差し控える,延ばす,先延ばしする','2024-09-12',7),(2232,'turnout','参加者数','(集会などの)出席者(数),産額,生産高,身じたく,着こなし,装備,(鉄道などの)待避線,(道路上の)車の退避所,(引き出しなどの)中身を外に出すこと','2024-09-12',7),(2233,'fraud','詐欺','詐欺,欺瞞(ぎまん),詐欺行為,不正手段,詐欺師,ぺてん師,偽物','2024-09-12',7);
/*!40000 ALTER TABLE `wlist_wordsmodel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-13 23:11:10
