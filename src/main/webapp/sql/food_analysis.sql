CREATE DATABASE  IF NOT EXISTS `food_analysis` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `food_analysis`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: food_analysis
-- ------------------------------------------------------
-- Server version	5.7.14-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` tinyblob,
  `password_salt` tinyblob,
  `second_password` tinyblob,
  `is_super_admin` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (31,'d@yopmail.com','abc',1,'2017-03-09 15:20:04','aa','\�\�{b\�@Ϣ\�\��ډ\��9��S�\�\��j�ˇ','�\�TW��\��Q&\\\�','\�\�{b\�@Ϣ\�\��ډ\��9��S�\�\��j�ˇ',1),(32,'dd@yopmail.com','dd',0,NULL,'dd','��4\�\�m\� È\�H\�|���\�%\����%','�6]\�\�-UV�\�\�dG','��4\�\�m\� È\�H\�|���\�%\����%',NULL),(33,'ad@yopmail.com','ad',1,NULL,'ad','\�8i��覼29\�\\WaF\�Iw�պ\�\�m','\�B������s7R�ݮ&','\�8i��覼29\�\\WaF\�Iw�պ\�\�m',NULL);
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_items`
--

DROP TABLE IF EXISTS `food_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `food_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `fats` varchar(45) DEFAULT NULL,
  `proteins` varchar(45) DEFAULT NULL,
  `carbohydrates` varchar(45) DEFAULT NULL,
  `vitamins` varchar(45) DEFAULT NULL,
  `sugar` varchar(45) DEFAULT NULL,
  `calorie` varchar(45) DEFAULT NULL,
  `benefits` varchar(250) DEFAULT NULL,
  `disadvantages` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Name_UNIQUE` (`name`),
  KEY `User_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_items`
--

LOCK TABLES `food_items` WRITE;
/*!40000 ALTER TABLE `food_items` DISABLE KEYS */;
INSERT INTO `food_items` VALUES (1,'Apple','0.2g','0.3g','14g','1%','10g','52','Apples are extremely rich in important antioxidants, flavanoids, and dietary fiber. ','High in Sugar, so Sugar patients avoid Apples'),(2,'Banana','0.3g','1.1g','23g','10%','12g','89','High in Fiber, viitamins and calcium and carbohydrates, considered as rich source of Energy','Bananas contain sugar  not recommended for diabetics or the sugar-addicted'),(3,'orance','0.3g','1.1g','23g','10%','12g','89','High in Fiber, viitamins and calcium and carbohydrates, considered as rich source of Energy','Bananas contain sugar  not recommended for diabetics or the sugar-addicted');
/*!40000 ALTER TABLE `food_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seed_contact_us_infos`
--

DROP TABLE IF EXISTS `seed_contact_us_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seed_contact_us_infos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seed_contact_us_infos`
--

LOCK TABLES `seed_contact_us_infos` WRITE;
/*!40000 ALTER TABLE `seed_contact_us_infos` DISABLE KEYS */;
INSERT INTO `seed_contact_us_infos` VALUES (1,'Abhishek Kesanapalli','name@yopmail.com','203-685-7473');
/*!40000 ALTER TABLE `seed_contact_us_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(200) NOT NULL,
  `last_name` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password_salt` blob NOT NULL,
  `password` blob,
  `age` varchar(55) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `weight` smallint(6) DEFAULT NULL,
  `height_feet` smallint(6) DEFAULT NULL,
  `height_inch` smallint(6) DEFAULT NULL,
  `alergies` varchar(400) DEFAULT NULL,
  `health_issues` varchar(400) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_updated_on` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (11,'aac','b','b@yopmail.com','E\�#\"\�^�+eU3z��t8','�xj8\�\�Ԗ��r�B��\�x;\�\�EG4Ϣc\\\�','Between 18 to 30','MALE',NULL,NULL,NULL,'','','1111111111',1,'2017-03-07 16:44:26','2017-03-09 15:20:11'),(12,'bb','bb','bb@yopmail.com','\�\�B��1�4�H��s\�','��\'fbj����\�Nx�<9@\0�[�L�}','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,'2017-03-09 15:22:53'),(14,'bb','bb','bbc@yopmail.com','\�\��\�\�if�@�\�9:7\"','\\��漉\�\�᦬�t�@�!e+�y\�|�\�','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,'2017-03-09 15:23:31'),(15,'bb','bb','bbcc@yopmail.com','&U�~�\�\�~>�s\�%\�4','\����M�\'9\��|e�0/��y�n�/rU\��^8','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,'2017-03-09 15:23:37'),(16,'a','a','a@yopmail1.com','�����7���&d1Y/�g','0��h%�\�䌂��r�\�0\�O�����\�I���','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,NULL),(17,'b','b','bb1@g.com','�\�#��(򽡜e5\�','ުh�Q�p�\�r\�\�\�u��\�gUg\�볓E\�ۨ','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,NULL),(18,'c','c','c@yopmail.com','Z*K�\��	�\�}','\�a)�KR��\�Q�o��;��\�.�[\���','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,NULL),(19,'c','c','ca@yopmail.com','\�t_\�\�%�_��W\�','rw\��A�\�j�\�\�&\�Gτ�\Z�G0\�,�`V','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,NULL),(20,'a','a','aa@yopmail.com','<\�\�\�\\\"X?\0����\�a_','1���k���e$z�\�\�{o8\�\�Fn�D�yߍ��','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,NULL),(21,'a','a','aaa@yopmail.com','\Z4f�}\�O!�:���{O','=Á[�?�\�kA�xɫ\�5�j.d%�>�\�k�','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,NULL),(23,'a','a','aaaa@yopmail.com','\��wDhǸ\�\�|g\n��o�','VAc\�VHt��3��.7Vlu\�s�\�\��\�y+@m','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,NULL),(24,'a','a','aaaaa@yopmail.com','�\�\�\��\�|��S\�\�\���','��\�\�\�n�\�\����\��\�`\n\�O�r�\�N�\n','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,NULL),(25,'a','a','aa1@yopmail.com','���\�\\d3-Ǒb\�ot\�','\�p\��h,���\�c�8�Tۀ�\��\�7\��%�JP:','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,NULL),(26,'a','a','aa21@yopmail.com','N�\�mC�M�4��j','�WY���i\�~���/Q�yq�\�\��ĩ\�#8�','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,NULL),(27,'a','a','aac@g.com','_n���k�ǇK��','\�\�vOs��;����_��\�f\�e0\�(+�x&\n2','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,NULL),(28,'abc','abc','aaccc@g.com','2\�J\�]eA���D�h','h�r\�;Ԣ\�;\���#\�X�;�_�(+q��8�\Z\�','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,NULL),(29,'a','a','1@yopmail.com','rG\�\�H��	�x��\�','�c��ۆ\�\�\�\�\Z>x$\�\�0�%\�\�\�\�͂\�\r\�\�','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,NULL,NULL),(30,'v','v','v@yopmail.com','\�\�`��q&&\n\��&�','o�\�(\�mL�=/E\�n�pj\\1�׎y����&,..','Between 18 to 30','NONE',NULL,NULL,NULL,'','','',1,'2017-03-07 17:06:21',NULL),(34,'dd','a','d@yopmail.com','\n`c��\�\�N�[o�7P�','l\�%�\�HfnX\�P��D����\�\�Y\�J�b Ekm\�','Between 18 to 30','NONE',NULL,NULL,NULL,'a','a','',1,'2017-03-08 19:06:50',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-03-09 15:31:27
