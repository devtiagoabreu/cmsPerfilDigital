-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: cms
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.7-MariaDB

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
-- Table structure for table `atags`
--

DROP TABLE IF EXISTS `atags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL,
  `page` int(10) unsigned NOT NULL,
  `tag_type` varchar(30) NOT NULL,
  `value` longtext DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT 1,
  `sequence` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atags`
--

LOCK TABLES `atags` WRITE;
/*!40000 ALTER TABLE `atags` DISABLE KEYS */;
INSERT INTO `atags` VALUES (1,6,4,'Youtube','https://www.youtube.com/channel/UCbGCkSeMvXru--qp7DSZqPw',1,3),(2,6,4,'Instagram','https://www.instagram.com/devtiagoabreu/',1,1),(3,6,4,'Facebook','https://www.facebook.com/uerbaogait/',1,2),(4,6,4,'Whatsapp','19999034244',1,4),(5,6,4,'pix','devtiagoabreu@gmail.com',1,7),(6,6,4,'Nome','Tiago de Abreu',1,11),(7,6,4,'gtag','uwuw8w8w8092ihkhlo',1,12),(8,6,4,'Endereço','Atriostech\\nRua. João Rossi, 325 - residencial Parque do Lago\\nSanta Bárbara D\'Oeste / SP - 13458-630',1,13),(9,6,4,'Twitter','https://twitter.com/devtiagoabreu',1,14),(10,6,4,'Linkedin','https://www.linkedin.com/in/tiago-de-abreu-8020b5b1/',1,15),(11,6,4,'TikTok','https://www.tiktok.com/@devtiagoabreu?lang=pt-BR',1,5),(12,6,4,'Site','http://atriostech.com.br/',1,6),(13,6,4,'Profissão','Developer',1,8),(14,6,4,'E-mail','tiago@atriostech.com.br',1,9),(15,6,4,'Celular','19999034244',1,10),(16,6,4,'Telefone','1993277025',1,16);
/*!40000 ALTER TABLE `atags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linktype`
--

DROP TABLE IF EXISTS `linktype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linktype` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linktype`
--

LOCK TABLES `linktype` WRITE;
/*!40000 ALTER TABLE `linktype` DISABLE KEYS */;
/*!40000 ALTER TABLE `linktype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `body` text DEFAULT NULL,
  `user` int(11) DEFAULT NULL,
  `product_token` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `cover` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Bruno Silva','bruno-silva','',5,NULL,NULL,NULL),(4,'Tiago Abreu','tiago-abreu','Sou responsável pelos bastidores de uma aplicação, ou seja, os códigos que permitem a parte visual funcionar corretamente.Faço a ponte entre o banco de dados e as informações do navegador, de acordo com as regras de negócio em questão.',6,'cb23efe1a6297b2a104badd8f11f42c1','8a4e9dd41dc608ee23e219295c8c3193.jpg','8a4e9dd41dc608ee23e219295c8c3193.jpg'),(5,'suporte','suporte','',4,NULL,NULL,NULL),(6,'Marina Abreu','marina-abreu','Sou Ilustradora de pele',6,'b37747db0f4720d7244afbe4f09347bb',NULL,NULL),(7,'Rosa Maria','rosa-maria','Sou a Filha mais linda do mundo!',6,'cb23efe1a6297b2a104baddd87hbkx7x9',NULL,NULL),(8,'Ágatha Maria','agatha-maria','Minha Filha Maravilhosa!',6,'cb23efe1a6297b2a104badddqgh3ffrdg',NULL,NULL),(9,'Cecília Maria','cecilia-maria','Minha Filhota pequena querida!',6,'cb23efe1a6297b2a104baddd87hbkx7x9ccc',NULL,NULL),(10,'teste 1','teste-1','teste',6,'cb23efe1a6297b2a104badd8f11f42c1sss',NULL,NULL),(11,'teste 2','teste-2','ssss',6,'cb23efe1a6297b2a104badd8fdddd11f42c1','f7384651156dac2ac1e35cac0674f521.jpg','f7384651156dac2ac1e35cac0674f521.jpg');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_token_type`
--

DROP TABLE IF EXISTS `product_token_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_token_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `active` tinyint(3) unsigned DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_token_type`
--

LOCK TABLES `product_token_type` WRITE;
/*!40000 ALTER TABLE `product_token_type` DISABLE KEYS */;
INSERT INTO `product_token_type` VALUES (1,'PD_USER',1),(2,'PD_ENTERPRISE',1),(3,'PD_FULL',1);
/*!40000 ALTER TABLE `product_token_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tokens`
--

DROP TABLE IF EXISTS `product_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_tokens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token_type_id` int(10) unsigned NOT NULL,
  `token` varchar(255) NOT NULL,
  `user` int(10) unsigned DEFAULT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `tokens_FKIndex1` (`token_type_id`),
  CONSTRAINT `product_tokens_ibfk_1` FOREIGN KEY (`token_type_id`) REFERENCES `product_token_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tokens`
--

LOCK TABLES `product_tokens` WRITE;
/*!40000 ALTER TABLE `product_tokens` DISABLE KEYS */;
INSERT INTO `product_tokens` VALUES (1,1,'cb23efe1a6297b2a104badd8f11f42c1',NULL,1);
/*!40000 ALTER TABLE `product_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_links`
--

DROP TABLE IF EXISTS `public_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `public_links_type_id` int(10) unsigned DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `sequence` tinyint(3) unsigned DEFAULT NULL,
  `active` tinyint(3) unsigned DEFAULT 1,
  `user` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `public_links_FKIndex1` (`public_links_type_id`),
  CONSTRAINT `public_links_ibfk_1` FOREIGN KEY (`public_links_type_id`) REFERENCES `public_links_type` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_links`
--

LOCK TABLES `public_links` WRITE;
/*!40000 ALTER TABLE `public_links` DISABLE KEYS */;
INSERT INTO `public_links` VALUES (1,NULL,'Site','atriostech.com',9,1,4),(3,NULL,'Twitter','e',6,1,4),(4,NULL,'TikTok','/governanca',3,1,4),(5,NULL,'Instagram','https://www.youtube.com/watch?v=N9_LKU5Bjkk&feature=emb_imp_woyt',1,1,NULL),(6,NULL,'Instagram','https://www.youtube.com/watch?v=N9_LKU5Bjkk&feature=emb_imp_woyt',1,1,NULL),(7,NULL,'Twitter','https://www.youtube.com/watch?v=N9_LKU5Bjkk&feature=emb_imp_woyt',1,1,NULL),(8,NULL,'Youtube','44545',1,1,NULL),(9,NULL,'Youtube','https://www.youtube.com/watch?v=N9_LKU5Bjkk&feature=emb_imp_woyt',2,1,NULL),(10,NULL,'Youtube','https://www.youtube.com/watch?v=N9_LKU5Bjkk&feature=emb_imp_woyt',1,1,NULL),(11,NULL,'Youtube','https://www.youtube.com/watch?v=N9_LKU5Bjkk&feature=emb_imp_woyt',1,1,NULL),(12,NULL,'Instagram','https://www.facebook.com/tiago-abreu',1,1,6);
/*!40000 ALTER TABLE `public_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_links_type`
--

DROP TABLE IF EXISTS `public_links_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_links_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned DEFAULT 1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_links_type`
--

LOCK TABLES `public_links_type` WRITE;
/*!40000 ALTER TABLE `public_links_type` DISABLE KEYS */;
INSERT INTO `public_links_type` VALUES (1,'Facebook',1),(2,'Instagram',1),(3,'LinkedIn',1),(4,'Tweetter',1);
/*!40000 ALTER TABLE `public_links_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `content` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'Suporte','suporte@atriostech.com.br','$2y$10$jOONfn..1H7ojhWVJIUZ9uRTcWv/DNXkCAgj5U7v38oh3NtkRGCtS','N8JoINtbuD02incwcAd4SVFm0DAsZwrCfRnzOL1eh6YDc4VKTtEfFtjTVq3d',1),(5,'Bruno Ferreira Silva','bruno@email.com','$2y$10$jOONfn..1H7ojhWVJIUZ9uRTcWv/DNXkCAgj5U7v38oh3NtkRGCtS',NULL,0),(6,'Tiago de Abreu','tiago-abreu@gmail.com','$2y$10$QtFHXpVrDEGiUK/RdePUk.nQIDb4vmiRBLVU86fDiRQmfdMYsUZ4O','jC0eIhiXSEnyT92log3Haqx2D7PJTmkrtlslIL5EZFLex7M6E4vfrXEdKlj9',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitors`
--

DROP TABLE IF EXISTS `visitors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(100) DEFAULT NULL,
  `date_access` datetime DEFAULT NULL,
  `page` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitors`
--

LOCK TABLES `visitors` WRITE;
/*!40000 ALTER TABLE `visitors` DISABLE KEYS */;
INSERT INTO `visitors` VALUES (1,'1','2019-11-11 11:11:11','/'),(2,'1','2019-11-11 11:11:11','/'),(3,'1','2019-11-11 11:11:11','/teste');
/*!40000 ALTER TABLE `visitors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cms'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-09 10:27:28
