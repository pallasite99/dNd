CREATE DATABASE  IF NOT EXISTS `dnd` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `dnd`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: dnd
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `hit_die` int NOT NULL,
  `spellcasting` enum('None','Partial','Full') NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'Barbarian',12,'None','2023-06-13 17:37:22','2023-06-13 17:37:22'),(2,'Wizard',6,'Full','2023-06-13 17:37:22','2023-06-13 17:37:22'),(3,'Rogue',8,'None','2023-06-13 17:37:22','2023-06-13 17:37:22'),(4,'Cleric',8,'Full','2023-06-13 17:37:22','2023-06-13 17:37:22');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gender` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'Male','Identifies as male.','2023-06-13 16:15:07','2023-06-13 16:15:07'),(2,'Female','Identifies as female.','2023-06-13 16:15:07','2023-06-13 16:15:07'),(3,'Non-binary','Identifies outside the traditional binary genders.','2023-06-13 16:15:07','2023-06-13 16:15:07'),(4,'Other','Identifies with a gender not listed above.','2023-06-13 16:15:07','2023-06-13 16:15:07');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `races`
--

DROP TABLE IF EXISTS `races`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `races` (
  `id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `size` enum('Small','Medium','Large') NOT NULL,
  `speed` int NOT NULL,
  `ability_bonuses` json DEFAULT NULL,
  `alignment` varchar(20) DEFAULT NULL,
  `languages` json DEFAULT NULL,
  `traits` json DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `races`
--

LOCK TABLES `races` WRITE;
/*!40000 ALTER TABLE `races` DISABLE KEYS */;
INSERT INTO `races` VALUES (1,'Human','Medium',30,'{\"wisdom\": 1, \"charisma\": 1, \"strength\": 1, \"dexterity\": 1, \"constitution\": 1, \"intelligence\": 1}','Neutral','[\"Common\"]','{\"Trait 1\": \"Description 1\", \"Trait 2\": \"Description 2\"}','2023-06-12 15:05:32','2023-06-12 15:05:32'),(2,'Elf','Medium',30,'{\"dexterity\": 2}','Chaotic Good','[\"Common\", \"Elvish\"]','{\"Trait 1\": \"Description 1\", \"Trait 2\": \"Description 2\"}','2023-06-12 15:05:32','2023-06-12 15:05:32'),(3,'Dwarf','Medium',25,'{\"constitution\": 2}','Lawful Good','[\"Common\", \"Dwarvish\"]','{\"Trait 1\": \"Description 1\", \"Trait 2\": \"Description 2\"}','2023-06-12 15:05:32','2023-06-12 15:05:32');
/*!40000 ALTER TABLE `races` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `id` int NOT NULL,
  `spell_id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_components`
--

DROP TABLE IF EXISTS `spell_components`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_components` (
  `id` int NOT NULL,
  `spell_id` int DEFAULT NULL,
  `component_name` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spell_components`
--

LOCK TABLES `spell_components` WRITE;
/*!40000 ALTER TABLE `spell_components` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_components` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_damage`
--

DROP TABLE IF EXISTS `spell_damage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_damage` (
  `id` int NOT NULL,
  `spell_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spell_damage`
--

LOCK TABLES `spell_damage` WRITE;
/*!40000 ALTER TABLE `spell_damage` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_damage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_damage_type`
--

DROP TABLE IF EXISTS `spell_damage_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_damage_type` (
  `id` int NOT NULL,
  `spell_damage_id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spell_damage_type`
--

LOCK TABLES `spell_damage_type` WRITE;
/*!40000 ALTER TABLE `spell_damage_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_damage_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spell_slot_level_damage`
--

DROP TABLE IF EXISTS `spell_slot_level_damage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spell_slot_level_damage` (
  `id` int NOT NULL,
  `damage_info` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spell_slot_level_damage`
--

LOCK TABLES `spell_slot_level_damage` WRITE;
/*!40000 ALTER TABLE `spell_slot_level_damage` DISABLE KEYS */;
/*!40000 ALTER TABLE `spell_slot_level_damage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spells`
--

DROP TABLE IF EXISTS `spells`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spells` (
  `id` int NOT NULL,
  `name` varchar(25) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `higher_level` varchar(100) DEFAULT NULL,
  `spell_range_m` int DEFAULT NULL,
  `material` varchar(50) DEFAULT NULL,
  `ritual` tinyint(1) DEFAULT NULL,
  `duration` varchar(50) DEFAULT NULL,
  `concentration` tinyint(1) DEFAULT NULL,
  `casting_time` varchar(25) DEFAULT NULL,
  `level` int DEFAULT NULL,
  `attack_type` varchar(25) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spells`
--

LOCK TABLES `spells` WRITE;
/*!40000 ALTER TABLE `spells` DISABLE KEYS */;
/*!40000 ALTER TABLE `spells` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subclasses`
--

DROP TABLE IF EXISTS `subclasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subclasses` (
  `id` int NOT NULL,
  `class_id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `url` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subclasses`
--

LOCK TABLES `subclasses` WRITE;
/*!40000 ALTER TABLE `subclasses` DISABLE KEYS */;
/*!40000 ALTER TABLE `subclasses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-13 23:13:57
