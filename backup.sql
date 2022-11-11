-- MySQL dump 10.13  Distrib 8.0.18, for osx10.15 (x86_64)
--
-- Host: localhost    Database: laravelcms
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `body` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Teste 2','teste-2','<p><img src=\"http://159.65.162.228/media/images/1578837945.png\" alt=\"\" width=\"200\" height=\"200\" /></p>'),(4,'Sobre mim','sobre-mim','asrasrasrasrasrasasrasr');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `content` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,'title','Pizza Interessante'),(2,'subtitle','Site muito legal'),(3,'email','contato@site.com'),(4,'bgcolor','#0014ff'),(5,'textcolor','#fff500');
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'Bonieky','suporte@b7web.com.br','$2y$10$DuTTSAKyZJNSEolVA1739ue/dh5ReQjh79j9Wc9Y4Co0gNpHB0os.',NULL,1),(5,'Paulo Renasceu','paulo@renasceu.com','$2y$10$/FsvQWesDoB9U5usl7aQ/OnRbzeOMmQOOGJeH9RiIR.TkNyaLPLT2',NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `date_access` datetime DEFAULT NULL,
  `page` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (1,'1','2019-11-11 11:11:11','/'),(2,'1','2019-11-11 11:11:11','/'),(3,'1','2019-11-11 11:11:11','/teste');
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;


ALTER TABLE pages ADD `user` INT NULL;


/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-18 11:26:26



------ALTERAÇÕES------
CREATE TABLE contacts_type (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  description VARCHAR(255)  NULL  ,
  active TINYINT UNSIGNED  NULL DEFAULT 1   ,
PRIMARY KEY(id));



CREATE TABLE public_links_type (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  description VARCHAR(255)  NOT NULL  ,
  active TINYINT UNSIGNED  NULL DEFAULT 1   ,
PRIMARY KEY(id));



CREATE TABLE adresses_type (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  description VARCHAR(255)  NULL  ,
  active TINYINT UNSIGNED  NULL DEFAULT 1   ,
PRIMARY KEY(id));




CREATE TABLE pix_keys_type (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  description VARCHAR(255)  NOT NULL  ,
  active TINYINT UNSIGNED  NULL DEFAULT 1   ,
PRIMARY KEY(id));



CREATE TABLE pix_keys (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  pix_keys_type_id INTEGER UNSIGNED  NOT NULL  ,
  description VARCHAR(60)  NULL  ,
  pix_key VARCHAR(255)  NULL  ,
  active TINYINT UNSIGNED  NULL DEFAULT 1 ,
  pix_default TINYINT UNSIGNED  NULL DEFAULT 0 ,
  user INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id)  ,
INDEX pix_key_FKIndex1(pix_keys_type_id),
  FOREIGN KEY(pix_keys_type_id)
    REFERENCES pix_keys_type(id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE adresses (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  adresses_type_id INTEGER UNSIGNED  NOT NULL  ,
  street VARCHAR(255)  NULL  ,
  number VARCHAR(10)  NULL  ,
  district VARCHAR(255)  NULL  ,
  state CHAR(2)  NULL  ,
  city VARCHAR(255)  NULL  ,
  country VARCHAR(255)  NULL  ,
  zipCode VARCHAR(30)  NULL  ,
  latitude VARCHAR(20)  NULL  ,
  longitude VARCHAR(20)  NULL  ,
  complement VARCHAR(20)  NULL  ,
  addressDefault TINYINT UNSIGNED  NULL DEFAULT 0 ,
  active TINYINT UNSIGNED  NULL DEFAULT 1 ,
  user INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id)  ,
INDEX adresses_FKIndex1(adresses_type_id),
  FOREIGN KEY(adresses_type_id)
    REFERENCES adresses_type(id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE contacts (
  id INTEGER UNSIGNED ZEROFILL  NOT NULL   AUTO_INCREMENT,
  contacts_type_id INTEGER UNSIGNED  NOT NULL  ,
  description VARCHAR(60)  NULL  ,
  contact VARCHAR(255)  NULL  ,
  active TINYINT UNSIGNED  NULL DEFAULT 1 ,
  user INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id)  ,
INDEX contacts_FKIndex1(contacts_type_id),
  FOREIGN KEY(contacts_type_id)
    REFERENCES contacts_type(id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE public_links (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  public_links_type_id INTEGER UNSIGNED  NOT NULL  ,
  description VARCHAR(255)  NULL  ,
  url VARCHAR(255)  NULL  ,
  sequence TINYINT UNSIGNED  NULL  ,
  active TINYINT UNSIGNED  NULL DEFAULT 1 ,
  user INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id)  ,
INDEX public_links_FKIndex1(public_links_type_id),
  FOREIGN KEY(public_links_type_id)
    REFERENCES public_links_type(id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);









