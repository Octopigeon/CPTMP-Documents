CREATE DATABASE  IF NOT EXISTS `cptmp_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cptmp_db`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: cptmp_db
-- ------------------------------------------------------
-- Server version	8.0.19

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
-- Table structure for table `authority`
--

DROP TABLE IF EXISTS `authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authority` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `uk_name` varchar(45) NOT NULL,
  `operation` varchar(45) NOT NULL COMMENT '''不同权限之间用英文逗号隔开''',
  `idx_table_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name_UNIQUE` (`uk_name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='对数据库所有表的权限管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authority`
--

LOCK TABLES `authority` WRITE;
/*!40000 ALTER TABLE `authority` DISABLE KEYS */;
/*!40000 ALTER TABLE `authority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cptmp_role`
--

DROP TABLE IF EXISTS `cptmp_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cptmp_role` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `idx_role_name` varchar(20) NOT NULL,
  `authority_ids` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cptmp_role`
--

LOCK TABLES `cptmp_role` WRITE;
/*!40000 ALTER TABLE `cptmp_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `cptmp_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cptmp_user`
--

DROP TABLE IF EXISTS `cptmp_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cptmp_user` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `idx_password` varchar(33) NOT NULL,
  `uk_username` varchar(20) NOT NULL,
  `introduction` text,
  `email` varchar(200) NOT NULL,
  `phone_number` decimal(11,0) DEFAULT NULL,
  `gender` tinyint unsigned DEFAULT NULL,
  `avatar` varchar(200) DEFAULT NULL,
  `idx_role_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_role_id_idx` (`idx_role_id`),
  CONSTRAINT `user_role_id` FOREIGN KEY (`idx_role_id`) REFERENCES `cptmp_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cptmp_user`
--

LOCK TABLES `cptmp_user` WRITE;
/*!40000 ALTER TABLE `cptmp_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `cptmp_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enterprise_admin`
--

DROP TABLE IF EXISTS `enterprise_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enterprise_admin` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `idx_name` varchar(20) NOT NULL,
  `uk_user_id` bigint unsigned NOT NULL,
  `uk_employee_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_employee_id` (`uk_employee_id`),
  UNIQUE KEY `uk_user_id` (`uk_user_id`),
  CONSTRAINT `enterprise_user_id` FOREIGN KEY (`uk_user_id`) REFERENCES `cptmp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enterprise_admin`
--

LOCK TABLES `enterprise_admin` WRITE;
/*!40000 ALTER TABLE `enterprise_admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `enterprise_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_instructor`
--

DROP TABLE IF EXISTS `school_instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_instructor` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `idx_name` varchar(20) NOT NULL,
  `uk_user_id` bigint unsigned NOT NULL,
  `uk_employee_id` bigint DEFAULT NULL,
  `idx_school_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id` (`uk_user_id`),
  UNIQUE KEY `uk_employee_id` (`uk_employee_id`),
  CONSTRAINT `teacher_user_id` FOREIGN KEY (`uk_user_id`) REFERENCES `cptmp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_instructor`
--

LOCK TABLES `school_instructor` WRITE;
/*!40000 ALTER TABLE `school_instructor` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_student`
--

DROP TABLE IF EXISTS `school_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school_student` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `idx_name` varchar(20) NOT NULL,
  `idx_school_name` varchar(20) NOT NULL,
  `uk_user_id` bigint unsigned NOT NULL,
  `uk_student_id` bigint DEFAULT NULL,
  `uk_student_face` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id` (`uk_user_id`),
  UNIQUE KEY `uk_student_id` (`uk_student_id`),
  CONSTRAINT `stu_user_id` FOREIGN KEY (`uk_user_id`) REFERENCES `cptmp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_student`
--

LOCK TABLES `school_student` WRITE;
/*!40000 ALTER TABLE `school_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `school_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_tb`
--

DROP TABLE IF EXISTS `test_tb`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_tb` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `pigeon_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_tb`
--

LOCK TABLES `test_tb` WRITE;
/*!40000 ALTER TABLE `test_tb` DISABLE KEYS */;
INSERT INTO `test_tb` VALUES (3,'lgh'),(4,'JOJO');
/*!40000 ALTER TABLE `test_tb` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authority`
--

DROP TABLE IF EXISTS `user_authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_authority` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `gmt_create` datetime NOT NULL,
  `gmt_modified` datetime DEFAULT NULL,
  `uk_user_id` bigint unsigned NOT NULL,
  `authority_ids` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_user_id_UNIQUE` (`uk_user_id`),
  CONSTRAINT `authority_user_id` FOREIGN KEY (`uk_user_id`) REFERENCES `cptmp_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='用户权限表，主要处理异常情况，剥夺某一用户的权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authority`
--

LOCK TABLES `user_authority` WRITE;
/*!40000 ALTER TABLE `user_authority` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_authority` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-07-08 10:26:39
