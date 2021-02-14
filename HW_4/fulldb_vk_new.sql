-- MariaDB dump 10.17  Distrib 10.4.15-MariaDB, for Linux (x86_64)
--
-- Host: mysql.hostinger.ro    Database: u574849695_25
-- ------------------------------------------------------
-- Server version	10.4.15-MariaDB-cll-lve

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
-- Table structure for table `communities`
--

DROP TABLE IF EXISTS `communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `communities` (
  `id` int(10) unsigned NOT NULL,
  `name` varchar(145) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(245) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_communities_users1_idx` (`admin_id`),
  CONSTRAINT `fk_communities_users1` FOREIGN KEY (`admin_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `communities`
--

LOCK TABLES `communities` WRITE;
/*!40000 ALTER TABLE `communities` DISABLE KEYS */;
INSERT INTO `communities` VALUES (1,'ipsa','Beatae aut eos inventore nisi officia.',26),(2,'et','Reprehenderit modi et quos.',44),(3,'error','Tenetur ut nam vel aut.',2),(4,'est','Asperiores aperiam debitis repellat dolorem.',38),(5,'beatae','Ea sapiente et sit ullam.',19),(6,'quisquam','',3),(7,'quia','',26),(8,'facere','Esse neque optio debitis id ab.',28),(9,'sapiente','Velit saepe natus ipsum dolor omnis facilis.',1),(10,'et','',18),(11,'nesciunt','Error velit numquam vitae quod similique.',22),(12,'est','Ducimus omnis ad enim sed quia.',28),(13,'labore','Minima harum quaerat laboriosam eum animi impedit.',29),(14,'quisquam','Qui nihil reiciendis vel voluptates consequatur.',20),(15,'aut','',23),(16,'dignissimos','Quam eligendi voluptatibus modi officia qui accusamus fugit.',20),(17,'at','',23),(18,'accusamus','Aut necessitatibus id at exercitationem.',29),(19,'quasi','Atque aut modi sunt laboriosam est.',4),(20,'in','Qui deleniti aut quo minima.',2),(21,'illum','',24),(22,'et','Dolorem esse dicta voluptates.',28),(23,'aperiam','',1),(24,'enim','Aspernatur dolor cum sit qui.',23),(25,'dolor','Molestias quia earum omnis.',39),(26,'nesciunt','',14),(27,'vel','',46),(28,'earum','',24),(29,'enim','',41),(30,'dolor','Ea laborum qui ut ea laboriosam id.',49),(31,'aliquam','Culpa sed sunt voluptas ducimus ratione.',12),(32,'qui','',17),(33,'ea','Molestiae quaerat ut nihil deserunt qui aspernatur ut nesciunt.',28),(34,'qui','Ullam dolorem ut blanditiis porro natus quia.',27),(35,'ipsam','Consequatur ut eius nemo natus consectetur.',38),(36,'aut','Magni vel voluptatem earum et consectetur.',4),(37,'similique','Occaecati ad debitis ea et ratione libero quidem.',42),(38,'sit','',3),(39,'laboriosam','Omnis reiciendis culpa inventore ipsa voluptas perspiciatis ea.',24),(40,'dolor','',25),(41,'ad','Qui aut soluta aperiam in.',31),(42,'et','',29),(43,'amet','',8),(44,'illo','',13),(45,'eos','',16),(46,'eos','Porro nihil fugit neque eos ipsa.',43),(47,'est','',47),(48,'commodi','Reprehenderit non ipsum vitae et.',26),(49,'quo','',21),(50,'aut','',4);
/*!40000 ALTER TABLE `communities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend`
--

DROP TABLE IF EXISTS `friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend` (
  `from_users_id` int(10) unsigned NOT NULL,
  `to_users_id` int(10) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '-1 - отклонен\\n0 - запрос\\n1 - принят',
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`from_users_id`,`to_users_id`),
  KEY `fk_friend_requests_users1_idx` (`from_users_id`),
  KEY `fk_friend_requests_users2_idx` (`to_users_id`),
  CONSTRAINT `fk_friend_requests_users1` FOREIGN KEY (`from_users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_friend_requests_users2` FOREIGN KEY (`to_users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend`
--

LOCK TABLES `friend` WRITE;
/*!40000 ALTER TABLE `friend` DISABLE KEYS */;
INSERT INTO `friend` VALUES (1,44,1,'1991-03-26 04:07:36','0000-00-00 00:00:00'),(2,50,0,'1987-08-12 19:24:43','0000-00-00 00:00:00'),(3,25,1,'2000-05-20 06:50:51','0000-00-00 00:00:00'),(3,50,0,'1989-04-22 07:56:13','1977-06-01 15:18:56'),(4,2,-1,'2011-11-17 22:49:07','0000-00-00 00:00:00'),(5,1,-1,'1995-10-03 10:40:39','0000-00-00 00:00:00'),(5,38,0,'2013-02-22 16:49:31','0000-00-00 00:00:00'),(6,30,0,'1974-09-09 16:14:34','2014-08-18 06:08:51'),(6,37,-1,'2014-01-21 04:31:41','0000-00-00 00:00:00'),(7,50,0,'1979-01-13 15:48:41','0000-00-00 00:00:00'),(8,21,-1,'1999-06-03 05:18:24','0000-00-00 00:00:00'),(8,36,1,'1970-08-19 18:10:55','0000-00-00 00:00:00'),(8,40,0,'1979-03-31 08:01:41','1999-12-03 09:58:04'),(13,42,0,'1985-01-07 23:59:21','0000-00-00 00:00:00'),(14,34,0,'1971-01-09 22:53:33','1975-04-10 22:47:08'),(15,19,0,'1984-02-06 08:50:18','0000-00-00 00:00:00'),(16,30,0,'2000-09-08 13:03:30','0000-00-00 00:00:00'),(17,9,0,'1974-08-30 12:00:53','0000-00-00 00:00:00'),(18,9,1,'1984-12-31 11:02:03','0000-00-00 00:00:00'),(18,25,1,'2007-06-12 06:13:08','0000-00-00 00:00:00'),(18,50,-1,'1970-06-20 10:42:15','0000-00-00 00:00:00'),(19,41,-1,'1992-06-29 19:26:07','2019-06-15 21:20:03'),(20,17,1,'1989-12-24 22:58:42','2014-05-11 14:49:21'),(20,37,-1,'2000-04-09 15:35:36','2016-11-02 03:33:46'),(22,6,1,'2013-12-12 21:41:58','0000-00-00 00:00:00'),(22,15,1,'1987-02-11 09:46:05','1994-07-19 02:29:11'),(22,21,1,'2016-03-20 05:41:34','1977-06-21 12:52:58'),(23,8,0,'2004-02-27 04:31:09','0000-00-00 00:00:00'),(25,27,-1,'2001-12-19 07:32:23','1980-07-01 04:14:11'),(28,25,1,'2003-08-14 07:38:45','0000-00-00 00:00:00'),(28,36,1,'1987-07-18 02:20:14','0000-00-00 00:00:00'),(30,19,-1,'2012-03-11 17:08:10','0000-00-00 00:00:00'),(33,7,0,'2008-03-16 02:36:00','0000-00-00 00:00:00'),(34,11,-1,'2014-12-12 21:31:40','0000-00-00 00:00:00'),(34,48,1,'2016-02-20 17:31:17','0000-00-00 00:00:00'),(35,42,0,'2011-11-13 07:51:36','2018-09-01 13:20:50'),(36,6,1,'1978-08-28 00:58:22','1981-02-10 00:12:07'),(36,49,-1,'1996-04-13 23:53:05','0000-00-00 00:00:00'),(37,10,1,'1973-11-19 10:41:32','0000-00-00 00:00:00'),(37,20,0,'1996-12-03 08:48:23','2020-10-14 11:45:39'),(41,2,0,'2016-04-27 19:06:22','1993-12-29 13:24:07'),(42,1,0,'1985-01-09 08:43:36','1989-03-19 23:10:20'),(42,12,0,'1994-08-28 22:36:44','0000-00-00 00:00:00'),(42,19,0,'2012-02-20 19:04:55','1976-12-07 07:32:47'),(42,34,0,'1983-03-12 16:24:10','2003-06-30 20:44:36'),(44,42,1,'1987-06-27 03:33:03','1987-11-18 07:29:23'),(45,16,0,'1970-03-29 07:35:50','0000-00-00 00:00:00'),(46,32,-1,'2004-05-03 04:21:47','0000-00-00 00:00:00'),(47,13,-1,'2015-11-09 12:07:43','0000-00-00 00:00:00'),(50,47,1,'2015-04-26 11:55:31','2017-02-22 22:30:38');
/*!40000 ALTER TABLE `friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `users_id` int(10) unsigned NOT NULL,
  `media_id` int(10) unsigned DEFAULT NULL,
  `messages_id` int(10) unsigned DEFAULT NULL,
  `posts_id` int(10) unsigned DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `likescol` int(11) DEFAULT NULL,
  `summ` int(10) unsigned NOT NULL,
  UNIQUE KEY `like_media` (`users_id`,`media_id`),
  UNIQUE KEY `like_messages` (`users_id`,`messages_id`),
  UNIQUE KEY `like_posts` (`users_id`,`posts_id`),
  KEY `fk_likes_users1_idx` (`users_id`),
  KEY `fk_likes_media1_idx` (`media_id`),
  KEY `fk_likes_messages1_idx` (`messages_id`),
  KEY `fk_likes_posts1_idx` (`posts_id`),
  CONSTRAINT `fk_likes_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_likes_messages1` FOREIGN KEY (`messages_id`) REFERENCES `messages` (`id`),
  CONSTRAINT `fk_likes_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_likes_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (30,22,17,401,'1977-07-30 10:58:18',NULL,0),(46,15,17,402,'1982-06-26 00:35:26',NULL,907942),(37,44,23,403,'2015-11-15 05:20:05',NULL,533),(17,29,28,404,'1970-07-30 11:49:20',NULL,8546984),(29,43,8,405,'1991-01-31 03:03:57',NULL,63),(22,46,24,406,'1999-07-22 01:39:27',NULL,124175),(1,1,30,407,'1971-03-02 07:38:37',NULL,0),(35,6,47,408,'2007-08-20 01:03:09',NULL,766),(18,23,17,409,'1973-01-17 19:02:13',NULL,571),(4,26,48,410,'1975-05-06 13:35:44',NULL,0),(27,5,20,411,'2000-01-31 15:53:37',NULL,108201),(44,50,34,412,'2017-11-07 04:13:24',NULL,30),(10,37,27,413,'2011-03-15 22:09:54',NULL,914308538),(33,3,5,414,'2016-03-06 18:49:11',NULL,7524),(11,32,47,415,'2006-06-25 16:11:48',NULL,8730552),(19,3,43,416,'2008-03-31 23:05:48',NULL,182),(42,4,44,417,'1973-12-07 13:54:24',NULL,89),(21,38,50,418,'2020-05-22 19:59:31',NULL,0),(17,6,22,419,'1988-05-19 03:21:09',NULL,871030),(34,10,48,420,'2020-11-03 09:19:21',NULL,61044),(31,37,2,421,'1990-09-23 01:03:13',NULL,0),(50,30,2,422,'1993-10-19 18:44:54',NULL,2055),(33,40,38,423,'1980-08-04 12:51:03',NULL,7151707),(10,23,41,424,'2013-10-04 07:55:50',NULL,0),(15,34,22,425,'2013-04-29 17:42:02',NULL,62437),(12,2,25,426,'1984-08-10 20:50:29',NULL,4170),(5,43,28,427,'2011-06-04 05:35:24',NULL,707),(49,14,16,428,'2003-12-08 02:16:06',NULL,1673224),(48,30,22,429,'1987-02-14 22:45:51',NULL,71359658),(19,14,31,430,'1996-10-10 18:47:46',NULL,5),(16,44,18,431,'2017-04-21 13:12:41',NULL,0),(18,43,48,432,'1997-08-15 04:45:25',NULL,0),(19,26,38,433,'1978-01-26 17:27:49',NULL,393671),(7,36,10,434,'2010-08-19 20:55:28',NULL,122),(48,50,43,435,'2013-05-14 06:06:14',NULL,41808),(19,12,44,436,'1978-05-30 21:44:50',NULL,7497820),(44,16,36,437,'1984-12-05 13:34:11',NULL,7098820),(22,14,49,438,'1979-05-20 09:40:30',NULL,65),(37,12,29,439,'1993-09-05 18:57:46',NULL,3451231),(9,30,42,440,'2010-03-08 13:01:11',NULL,4),(40,46,36,441,'1978-08-06 16:47:51',NULL,33824915),(7,13,29,442,'1975-09-21 11:39:59',NULL,0),(4,32,4,443,'1981-03-19 03:20:43',NULL,666109),(42,39,39,444,'1980-09-29 21:34:29',NULL,60511039),(1,36,39,445,'1980-08-04 04:49:34',NULL,974364),(44,5,1,446,'1999-03-20 01:47:35',NULL,57395),(37,49,16,447,'1989-01-10 00:12:38',NULL,731),(23,20,30,448,'1985-12-08 14:55:48',NULL,489),(22,7,41,449,'2001-01-19 14:14:49',NULL,9176),(1,15,21,450,'2017-05-20 15:43:07',NULL,0),(43,5,16,401,'1990-09-17 17:16:46',NULL,54),(28,12,29,402,'1973-10-04 13:59:17',NULL,769826),(6,15,11,403,'1987-03-18 08:32:07',NULL,0),(10,6,50,404,'1992-02-01 06:32:26',NULL,26),(49,7,35,405,'1984-12-27 15:33:16',NULL,128962),(38,50,40,406,'2003-11-17 05:17:02',NULL,1),(38,37,38,407,'2010-12-31 04:57:34',NULL,96589),(4,10,7,408,'2012-07-16 23:38:51',NULL,8366701),(33,32,14,409,'2012-09-03 10:44:16',NULL,40031),(24,33,28,410,'1970-02-03 04:13:38',NULL,15197640),(44,25,33,411,'2018-07-14 08:45:35',NULL,6),(10,3,44,412,'1984-06-30 02:58:15',NULL,1860),(38,9,9,413,'1979-09-24 22:36:08',NULL,45),(49,19,15,414,'1998-04-23 10:17:03',NULL,82468677),(48,17,21,415,'2003-01-29 17:20:20',NULL,98443),(32,5,21,416,'1997-11-07 17:28:12',NULL,59383),(22,42,8,417,'1993-02-21 15:54:32',NULL,761802),(9,45,18,418,'2017-10-24 05:16:10',NULL,2175823),(16,28,49,419,'1986-09-10 10:48:19',NULL,3771304),(29,1,31,420,'2006-10-22 08:18:48',NULL,54),(7,44,6,421,'1995-11-05 13:26:51',NULL,4),(39,3,9,422,'1980-01-09 10:55:01',NULL,70813),(41,39,36,424,'1992-03-20 08:00:32',NULL,4422),(5,37,2,425,'2007-07-18 15:49:30',NULL,21556),(26,19,6,426,'1971-02-06 03:23:25',NULL,0),(47,40,48,427,'1985-10-09 19:14:37',NULL,4),(4,48,43,428,'1982-10-08 10:28:06',NULL,0),(20,42,21,430,'1993-04-22 14:34:02',NULL,199957),(1,49,14,431,'2003-11-13 14:48:56',NULL,90110),(7,38,17,432,'1998-04-19 11:14:49',NULL,67),(15,20,8,433,'2014-12-04 17:12:27',NULL,59),(32,10,47,434,'1989-07-17 00:45:42',NULL,97578182),(17,15,33,435,'2018-07-29 05:24:03',NULL,43),(25,36,40,437,'2002-10-15 15:55:19',NULL,68266332),(15,11,1,439,'1999-01-08 22:46:54',NULL,0),(34,31,43,440,'2018-06-21 21:15:45',NULL,720023361),(18,38,29,442,'1982-11-09 17:28:42',NULL,2964),(35,3,48,443,'2006-11-19 04:36:18',NULL,5),(38,1,22,445,'1987-11-21 20:41:27',NULL,369029),(21,19,12,446,'2020-06-16 22:09:03',NULL,899913516),(21,44,48,447,'1993-11-17 12:38:45',NULL,5044774),(10,15,37,448,'1970-01-12 17:20:21',NULL,4),(48,29,48,449,'1970-03-14 04:53:31',NULL,7965),(48,13,29,450,'1985-01-27 22:49:31',NULL,5908949),(41,17,10,401,'2014-08-12 15:33:14',NULL,44),(32,35,48,402,'1993-07-02 07:54:14',NULL,389),(11,19,50,403,'1978-11-05 06:16:19',NULL,680384),(8,11,34,404,'1973-04-19 06:58:08',NULL,638300),(15,49,35,405,'2008-03-31 10:38:57',NULL,1),(37,19,3,406,'1999-10-14 10:23:36',NULL,1),(48,39,46,407,'2001-07-29 11:33:50',NULL,11),(45,49,11,408,'2020-11-23 20:37:24',NULL,875428),(32,46,40,409,'1991-01-18 20:05:58',NULL,103675),(29,44,3,410,'2002-05-07 18:56:49',NULL,7080066),(7,35,20,411,'1979-12-31 22:04:22',NULL,960),(17,17,4,412,'2011-06-13 04:53:03',NULL,84744),(14,27,23,413,'2010-08-04 03:42:34',NULL,71760),(14,34,34,414,'2016-02-15 06:38:33',NULL,2),(47,49,32,415,'1988-01-28 15:05:16',NULL,865),(31,36,1,416,'2014-11-11 20:42:05',NULL,262),(34,33,40,417,'2001-02-11 17:28:09',NULL,8971340),(30,28,39,418,'2019-05-19 20:42:44',NULL,3),(41,9,35,419,'2000-06-01 22:24:19',NULL,244),(30,38,28,420,'1974-11-04 07:04:54',NULL,7160),(33,44,13,421,'1974-10-13 09:02:21',NULL,732735),(2,11,29,422,'2017-03-17 14:51:06',NULL,428436),(6,24,5,423,'1980-08-22 13:00:48',NULL,75),(28,37,39,424,'1996-03-29 23:40:22',NULL,8),(11,34,38,425,'1991-01-29 07:40:53',NULL,8007777),(43,15,23,426,'1972-10-19 12:40:37',NULL,82),(44,49,6,427,'1987-10-28 15:51:25',NULL,73906),(33,28,33,428,'2016-03-30 11:00:51',NULL,6),(21,18,42,429,'2006-08-20 21:25:58',NULL,0),(6,48,29,430,'1974-03-18 23:44:36',NULL,7871691),(33,30,23,431,'1972-11-10 06:40:13',NULL,5508),(45,32,33,432,'1973-12-24 11:42:25',NULL,13330),(24,37,7,433,'2003-09-03 17:00:45',NULL,250493292),(28,15,43,434,'1993-12-10 04:39:40',NULL,320),(4,18,41,436,'1978-09-30 19:07:27',NULL,7612289),(26,11,40,437,'1981-12-30 04:55:13',NULL,60466134),(32,44,17,438,'1974-08-09 15:55:14',NULL,0),(14,15,35,439,'1984-12-27 21:12:19',NULL,125693),(6,20,33,440,'2005-09-26 00:51:04',NULL,997374442),(34,3,13,441,'1996-05-31 14:02:05',NULL,6092991),(39,21,31,443,'1999-08-26 17:38:01',NULL,4070),(37,15,20,445,'1972-09-01 23:36:50',NULL,0),(14,18,37,446,'2005-09-16 20:52:33',NULL,42),(5,44,48,447,'1984-09-22 10:38:53',NULL,3640),(44,26,41,448,'1974-05-26 09:54:54',NULL,68285349),(11,40,5,449,'1999-10-10 17:12:38',NULL,79434655),(46,45,25,450,'1972-10-15 15:06:01',NULL,16608),(28,28,27,401,'2020-03-09 15:59:21',NULL,194),(40,34,24,402,'1993-08-18 10:19:47',NULL,767927),(34,22,45,403,'2007-07-20 08:14:01',NULL,0),(14,16,43,404,'1985-11-02 07:05:29',NULL,743921685),(9,2,7,405,'2006-05-11 18:40:51',NULL,722),(28,16,25,406,'1991-03-09 02:16:41',NULL,95934),(14,20,19,407,'1993-02-24 03:41:44',NULL,496158342),(11,14,44,408,'1987-04-22 15:22:00',NULL,9002289),(2,24,33,409,'2004-05-05 04:45:24',NULL,8),(6,19,27,410,'2019-02-07 02:14:42',NULL,4946125),(31,47,5,411,'1974-09-26 15:15:47',NULL,0),(31,20,9,413,'1981-03-21 07:34:08',NULL,773),(25,34,24,414,'1974-08-11 22:17:08',NULL,6716),(17,42,26,415,'2002-01-12 12:20:00',NULL,6),(24,19,41,416,'2008-04-06 04:12:59',NULL,52873),(48,32,11,417,'1992-09-05 12:24:00',NULL,877062277),(17,43,24,418,'1980-08-30 23:55:00',NULL,318034691),(10,44,48,419,'2012-07-15 14:38:28',NULL,52695),(19,30,12,421,'2015-08-24 12:17:07',NULL,933),(23,37,48,422,'1988-08-23 18:27:32',NULL,75),(10,17,18,423,'1978-02-07 04:58:43',NULL,964111616),(18,41,1,424,'1995-12-20 12:10:53',NULL,78),(42,7,42,425,'2009-01-07 19:40:40',NULL,1959),(17,30,11,426,'1981-01-25 16:25:36',NULL,32124353),(7,28,42,427,'2001-01-06 11:39:39',NULL,959012),(17,44,35,428,'2006-10-22 02:07:54',NULL,94),(41,3,28,429,'2002-04-01 19:07:05',NULL,246485482),(38,46,28,430,'2008-12-12 07:23:31',NULL,10328),(16,37,43,432,'1980-02-11 19:02:57',NULL,3),(14,47,9,433,'1975-04-27 12:42:41',NULL,4234),(31,15,50,434,'2007-11-27 20:13:14',NULL,4474951),(32,6,6,435,'1982-10-08 10:18:36',NULL,58455),(23,22,36,436,'1993-07-22 10:17:04',NULL,8),(10,36,9,439,'2020-06-07 22:34:00',NULL,7716010),(38,24,4,440,'1997-08-25 03:30:49',NULL,3),(15,27,18,441,'1996-11-14 23:23:34',NULL,826764202),(22,43,5,442,'1972-08-09 22:33:55',NULL,950),(15,6,2,443,'2010-01-17 10:02:04',NULL,0),(24,36,17,444,'2000-07-09 13:24:51',NULL,5829),(23,17,22,445,'1993-06-09 12:29:23',NULL,6849198),(29,40,44,446,'1995-04-23 12:57:42',NULL,319),(27,48,18,448,'2012-05-10 10:50:25',NULL,3),(33,8,4,449,'2005-01-29 06:23:38',NULL,7712476),(42,45,28,450,'2019-10-21 19:48:34',NULL,1385),(45,10,5,401,'1996-05-20 18:15:25',NULL,0),(13,31,47,402,'1992-11-08 03:38:59',NULL,68298298),(18,46,2,403,'2015-09-26 00:08:53',NULL,6993),(35,42,5,405,'1996-09-20 00:33:42',NULL,66760),(7,20,45,406,'1986-05-06 12:32:08',NULL,709),(23,10,15,408,'1986-02-22 04:42:56',NULL,4674076),(41,43,22,409,'1981-02-05 03:21:40',NULL,622577380),(45,34,17,410,'2011-07-13 23:20:51',NULL,3121),(23,28,26,411,'1989-02-20 06:19:04',NULL,9013),(27,41,7,412,'1996-02-03 18:20:15',NULL,41845),(23,9,3,413,'1985-02-13 23:53:51',NULL,2771),(12,12,13,415,'1983-10-25 18:12:19',NULL,71861),(17,19,32,416,'1993-04-18 10:10:28',NULL,169),(28,42,26,418,'1999-02-02 05:04:05',NULL,3),(42,33,18,419,'1976-04-10 13:36:50',NULL,8),(14,28,1,420,'2016-08-22 11:17:58',NULL,53686),(30,50,29,421,'1993-12-14 07:44:42',NULL,0),(6,27,20,422,'2013-05-28 04:11:19',NULL,8988460),(13,49,28,423,'1995-09-10 09:36:22',NULL,5),(15,24,5,424,'1978-06-12 19:31:31',NULL,36953),(36,36,16,425,'2021-01-13 20:46:32',NULL,4255),(48,2,35,426,'2008-06-29 11:46:42',NULL,91091136),(30,12,4,427,'1989-03-23 00:11:41',NULL,16),(45,39,45,428,'1997-03-12 19:02:12',NULL,533964),(13,6,4,434,'2016-03-22 14:13:09',NULL,0),(33,39,40,436,'1993-11-15 06:08:42',NULL,1248507),(17,18,2,437,'1970-01-29 00:25:48',NULL,93603099),(20,13,41,438,'2012-07-18 10:58:01',NULL,917077),(42,20,15,440,'1972-06-25 01:30:43',NULL,995701),(47,8,38,441,'1980-01-27 12:32:46',NULL,0),(33,9,8,443,'1973-06-22 12:25:21',NULL,222),(12,21,14,444,'1980-12-11 05:04:35',NULL,0),(44,36,11,447,'2014-04-05 08:57:49',NULL,465608435),(45,5,23,448,'2004-10-31 02:44:05',NULL,2662765),(35,20,6,449,'1973-06-06 04:37:11',NULL,290),(6,11,26,450,'1985-07-20 14:58:15',NULL,0),(20,8,33,401,'2018-04-09 09:37:21',NULL,69478635),(8,10,7,402,'1992-12-26 12:00:40',NULL,236),(24,42,15,403,'2001-12-07 20:27:59',NULL,9995361),(32,4,36,404,'1999-05-04 06:25:46',NULL,818258),(49,22,42,406,'1970-01-15 00:14:24',NULL,74),(42,16,27,407,'1988-12-26 17:25:34',NULL,1921618),(2,10,32,408,'1997-09-12 16:41:29',NULL,6286418),(24,45,1,409,'2001-08-28 07:08:22',NULL,0),(30,1,12,410,'2004-05-09 06:49:48',NULL,22986),(5,20,20,411,'2011-09-24 10:26:43',NULL,742689),(38,27,29,412,'2018-09-13 21:53:33',NULL,41888),(44,1,21,413,'2017-01-18 21:48:35',NULL,278976660),(9,32,24,414,'1981-10-12 20:41:23',NULL,499),(44,27,42,415,'1996-11-20 22:08:06',NULL,74401581),(16,26,14,416,'2013-02-25 04:08:19',NULL,8),(8,17,29,417,'1993-10-30 00:55:37',NULL,0),(34,18,39,418,'1973-10-05 07:56:17',NULL,0),(16,21,34,420,'1976-08-20 17:48:43',NULL,1),(28,25,3,421,'2012-03-14 13:56:38',NULL,40),(47,13,30,422,'1982-06-09 00:56:09',NULL,341917208),(26,6,30,423,'1998-05-03 21:05:57',NULL,1832),(46,14,12,424,'1983-03-08 16:31:40',NULL,4735),(11,23,14,426,'1980-02-25 00:39:48',NULL,92121921),(25,30,30,427,'1999-06-23 12:41:05',NULL,414607),(42,29,40,429,'2019-08-08 05:04:38',NULL,5377937),(26,45,10,430,'1970-03-15 00:43:35',NULL,18677),(9,22,35,431,'2002-05-23 20:13:26',NULL,190991),(12,19,47,432,'1993-01-08 13:52:12',NULL,0),(41,44,3,433,'1992-06-30 01:52:56',NULL,421472),(21,39,16,434,'1999-02-28 12:22:01',NULL,374842534),(20,18,46,436,'1992-10-01 05:13:14',NULL,0),(33,42,26,437,'2014-12-09 08:02:42',NULL,389),(13,45,40,438,'1984-07-29 21:23:52',NULL,91582080),(50,12,13,440,'2014-01-15 22:17:32',NULL,44652860),(9,21,34,441,'1984-05-26 06:22:14',NULL,880992845),(44,32,2,442,'1987-06-21 23:59:34',NULL,348713),(41,23,45,443,'2008-05-23 03:20:22',NULL,355435243),(43,43,33,444,'2013-02-26 01:48:01',NULL,6458),(9,25,40,445,'2013-05-17 22:37:17',NULL,9302),(28,27,49,447,'2008-01-10 02:48:31',NULL,0),(43,49,30,449,'2004-04-12 15:20:41',NULL,104312),(11,49,42,450,'1997-04-03 10:34:25',NULL,99),(23,7,12,401,'2007-03-02 07:01:19',NULL,223006727),(7,1,43,402,'2009-03-09 12:29:56',NULL,5),(8,41,16,403,'2017-05-28 18:01:36',NULL,67093872),(3,34,9,404,'2001-11-17 03:36:22',NULL,7133917),(36,43,33,405,'2003-09-06 04:37:19',NULL,0),(26,24,27,406,'1986-02-25 22:43:21',NULL,19095630),(31,5,43,408,'1980-07-26 13:48:36',NULL,388),(3,7,40,410,'1988-08-24 20:28:45',NULL,281016),(6,36,47,412,'2020-11-01 08:16:12',NULL,498968456),(49,44,38,413,'2020-04-29 14:24:16',NULL,2),(22,32,14,415,'1984-06-08 01:56:32',NULL,631),(5,7,38,416,'1979-06-14 20:34:44',NULL,51121687),(31,39,39,417,'1984-10-14 00:56:58',NULL,7359594),(27,43,39,419,'2002-09-02 12:07:29',NULL,124195395),(4,45,11,422,'2006-08-02 17:18:59',NULL,10359931),(50,43,4,423,'2010-01-11 11:53:28',NULL,82099824),(38,7,50,424,'2004-06-04 18:52:17',NULL,9780301),(9,28,31,425,'2009-12-03 16:48:18',NULL,88839209),(23,33,38,426,'1998-01-25 06:47:51',NULL,0),(40,24,39,429,'2006-10-04 16:17:41',NULL,4742),(29,42,34,430,'2006-09-12 19:13:13',NULL,111858),(24,49,23,431,'1983-02-23 07:23:01',NULL,528944),(49,2,17,432,'2002-11-18 09:10:30',NULL,5159579),(12,39,16,434,'2012-12-03 19:22:01',NULL,35479010),(12,48,44,435,'2016-01-24 07:18:23',NULL,0),(42,21,26,436,'1971-03-17 17:05:11',NULL,139263),(41,45,50,440,'1970-05-11 05:53:09',NULL,0),(47,17,50,442,'1978-03-12 07:00:35',NULL,2613),(39,48,38,445,'2014-12-11 13:15:44',NULL,99),(32,40,8,446,'1977-02-19 14:08:15',NULL,7619280),(8,19,38,447,'2003-10-18 07:31:19',NULL,3),(46,26,15,448,'1981-05-15 22:37:51',NULL,3),(31,28,32,449,'1988-11-26 09:38:58',NULL,0),(40,18,26,450,'2002-08-29 14:08:08',NULL,3760),(39,42,45,401,'1982-09-28 02:17:48',NULL,0),(37,39,11,402,'1992-08-07 14:36:41',NULL,9),(37,25,21,404,'2004-08-06 01:26:34',NULL,802),(26,14,18,405,'1986-04-20 10:25:31',NULL,7032853),(21,2,26,407,'1982-01-04 00:58:49',NULL,61),(8,48,1,408,'2008-08-18 02:18:27',NULL,981720320),(22,28,29,409,'2005-03-29 23:12:01',NULL,862719),(29,6,38,411,'2015-06-17 13:20:34',NULL,466014883),(34,29,28,413,'1997-01-18 09:45:04',NULL,9732333),(19,16,2,414,'1986-10-28 18:15:26',NULL,81),(40,42,15,415,'2018-05-18 19:29:25',NULL,9707),(8,5,10,416,'2003-03-09 05:55:00',NULL,26871859),(15,25,12,417,'1973-02-09 01:05:01',NULL,3984212),(40,32,9,418,'1984-07-23 20:44:58',NULL,95),(19,6,3,420,'1996-11-16 12:47:35',NULL,30),(15,35,9,421,'1982-08-02 13:13:37',NULL,844),(28,41,31,423,'1995-05-19 15:36:03',NULL,6),(5,9,46,424,'2004-07-22 08:09:55',NULL,2094582),(7,48,37,425,'1975-03-13 09:56:09',NULL,8064),(22,5,42,426,'2002-09-03 04:10:26',NULL,899788010),(31,19,16,427,'2015-04-12 21:26:11',NULL,8),(43,9,48,428,'2013-03-05 06:50:18',NULL,544),(1,50,1,429,'1987-07-26 11:13:00',NULL,958),(37,18,7,430,'1979-05-18 10:28:51',NULL,65),(40,33,41,431,'2013-10-08 22:12:31',NULL,293255831),(50,13,38,433,'1975-05-23 04:11:19',NULL,8998),(26,25,44,435,'1991-06-05 23:03:37',NULL,9670025),(13,46,48,436,'1983-01-28 09:03:47',NULL,8990),(4,27,16,437,'1986-02-27 21:10:53',NULL,20926),(23,45,24,441,'1987-11-05 15:27:10',NULL,5654316),(13,44,9,442,'1994-03-14 06:35:16',NULL,93),(48,24,39,444,'2016-12-07 08:22:57',NULL,9),(34,16,35,447,'1985-05-06 20:03:15',NULL,18775),(50,35,3,448,'1984-10-26 14:02:43',NULL,0),(24,1,22,449,'2019-06-14 09:48:35',NULL,56317),(22,12,9,403,'2018-12-13 16:52:59',NULL,0),(32,3,31,405,'1997-10-26 08:51:49',NULL,2765),(3,23,7,407,'1976-05-04 17:01:23',NULL,638),(38,22,42,408,'1993-12-09 21:24:59',NULL,99820),(12,44,8,410,'1995-07-18 12:23:50',NULL,451056),(39,32,47,411,'1985-04-30 17:28:24',NULL,3126),(26,16,11,413,'2014-05-06 20:00:28',NULL,8963343),(34,9,20,414,'1998-03-14 11:57:53',NULL,0),(46,35,10,416,'1985-02-20 20:07:04',NULL,0),(37,38,32,417,'1995-07-07 22:24:19',NULL,15),(35,15,50,419,'2012-04-29 00:22:20',NULL,9),(27,26,43,420,'1982-01-17 23:30:41',NULL,342301100),(35,14,25,421,'1998-02-16 08:50:15',NULL,3987),(32,24,19,422,'2012-04-12 16:35:01',NULL,923002728),(30,49,35,423,'2004-07-16 03:17:22',NULL,502),(31,42,18,426,'2020-07-06 18:14:33',NULL,319506),(40,29,5,427,'1972-09-11 15:41:57',NULL,52),(22,23,30,428,'1973-12-02 22:33:43',NULL,61),(25,8,44,429,'2008-12-30 22:59:07',NULL,2086),(18,19,32,431,'1985-12-30 00:09:24',NULL,60122),(42,50,5,432,'1996-09-21 22:40:25',NULL,6006),(11,30,4,433,'1980-05-19 12:39:43',NULL,5688517),(45,20,35,434,'2008-07-15 08:15:41',NULL,3822),(38,29,32,435,'2015-11-09 11:58:16',NULL,42),(21,9,24,436,'1998-05-28 05:48:23',NULL,1991),(44,20,25,438,'1972-11-06 06:23:16',NULL,5),(16,19,16,440,'1970-05-11 15:06:07',NULL,406),(20,38,13,443,'2006-05-15 20:46:58',NULL,9383),(13,30,16,447,'2016-08-16 13:19:47',NULL,3648),(15,23,36,448,'2009-12-01 14:29:56',NULL,83373),(40,45,30,449,'2017-10-06 01:16:15',NULL,483490532),(22,11,48,450,'2007-05-15 20:08:46',NULL,78),(5,29,49,403,'1973-10-17 10:52:50',NULL,71),(9,49,43,406,'1981-12-11 04:08:30',NULL,6),(27,12,23,407,'2017-04-08 20:45:08',NULL,668905500),(43,27,45,408,'1977-05-17 21:32:23',NULL,810845),(28,17,40,409,'1972-04-26 18:33:07',NULL,3),(39,46,3,412,'2017-02-19 08:38:23',NULL,33596974),(50,50,32,413,'2015-03-08 22:28:19',NULL,3996553),(30,15,43,415,'2002-11-06 02:30:02',NULL,319),(46,42,30,418,'1982-04-27 08:10:18',NULL,666),(31,25,34,420,'1987-06-03 04:21:52',NULL,225),(24,18,4,422,'2000-08-09 05:10:06',NULL,7),(27,17,3,423,'1987-08-17 14:33:43',NULL,73754),(8,15,19,424,'2009-04-03 07:53:55',NULL,1),(33,25,6,426,'1980-08-02 11:01:12',NULL,928242),(2,16,39,430,'1999-01-13 11:38:25',NULL,42343818),(35,47,18,431,'2002-02-22 19:52:02',NULL,223),(43,20,35,432,'1997-03-29 02:59:58',NULL,1847531),(46,47,2,433,'2007-03-19 19:41:53',NULL,6736308),(1,27,35,436,'1986-08-09 10:20:36',NULL,821609236),(11,26,28,438,'2012-02-11 04:50:42',NULL,201787),(7,31,13,439,'2015-02-20 15:28:55',NULL,611670433),(21,33,29,440,'1974-04-08 02:56:48',NULL,715451),(10,18,25,441,'1982-08-29 23:32:11',NULL,6217731),(28,10,45,442,'1986-04-26 14:14:56',NULL,326310412),(14,4,45,444,'1985-10-28 02:12:12',NULL,222),(39,22,15,446,'2014-12-26 17:03:33',NULL,73047211),(23,27,14,447,'1977-01-08 16:09:28',NULL,37823839),(6,38,39,448,'1977-10-05 07:36:04',NULL,1165059),(45,15,2,450,'2003-11-08 12:04:40',NULL,5);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_types_id` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `size` bigint(20) NOT NULL,
  `file` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '/files/folder/file.jpg\\n\\n',
  `blob` blob DEFAULT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_media_media_types1_idx` (`media_types_id`),
  KEY `fk_media_users1_idx` (`users_id`),
  CONSTRAINT `fk_media_media_types1` FOREIGN KEY (`media_types_id`) REFERENCES `media_types` (`id`),
  CONSTRAINT `fk_media_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,5,1,3002,'application/vnd.kde.kspread',NULL,NULL),(2,4,43,3294968,'application/vnd.ds-keypoint',NULL,NULL),(3,5,13,41065,'application/pskc+xml',NULL,NULL),(4,4,32,82,'application/vnd.dece.ttml+xml',NULL,NULL),(5,5,17,0,'application/x-conference',NULL,NULL),(6,5,17,85492069,'application/vnd.oasis.opendocument.presentati',NULL,NULL),(7,4,7,5,'application/x-tex-tfm',NULL,NULL),(8,6,13,0,'application/x-ms-wmd',NULL,NULL),(9,5,50,1,'video/vnd.dece.mobile',NULL,NULL),(10,6,25,98753,'application/x-msdownload',NULL,NULL),(11,4,9,65772080,'application/vnd.symbian.install',NULL,NULL),(12,5,25,730,'text/tab-separated-values',NULL,NULL),(13,4,38,63,'application/vnd.adobe.xfdf',NULL,NULL),(14,4,42,7,'application/xcap-diff+xml',NULL,NULL),(15,4,4,9230,'video/x-ms-wmv',NULL,NULL),(16,4,34,654885,'application/vnd.recordare.musicxml',NULL,NULL),(17,4,11,9912841,'application/vnd.sun.xml.writer.global',NULL,NULL),(18,5,33,68711934,'image/x-portable-pixmap',NULL,NULL),(19,5,42,0,'application/vnd.kde.kpresenter',NULL,NULL),(20,4,49,384312035,'application/x-cpio',NULL,NULL),(21,4,42,262207,'application/x-sh',NULL,NULL),(22,4,21,32218780,'application/xop+xml',NULL,NULL),(23,6,4,323231164,'image/gif',NULL,NULL),(24,5,23,186927,'application/vnd.wqd',NULL,NULL),(25,4,26,429,'text/vnd.curl.dcurl',NULL,NULL),(26,6,4,8,'image/vnd.net-fpx',NULL,NULL),(27,6,26,22044777,'application/vnd.adobe.air-application-install',NULL,NULL),(28,5,34,0,'application/x-sv4cpio',NULL,NULL),(29,4,44,1,'application/vnd.trid.tpt',NULL,NULL),(30,5,25,116794,'application/vnd.lotus-screencam',NULL,NULL),(31,6,34,9592,'application/x-gca-compressed',NULL,NULL),(32,4,2,94493,'application/x-msdownload',NULL,NULL),(33,6,34,67,'audio/x-pn-realaudio',NULL,NULL),(34,6,18,900183186,'application/x-tcl',NULL,NULL),(35,5,48,0,'video/vnd.dece.mobile',NULL,NULL),(36,4,33,2659,'application/x-font-ttf',NULL,NULL),(37,6,31,64466010,'application/x-ustar',NULL,NULL),(38,4,37,0,'application/vnd.dece.ttml+xml',NULL,NULL),(39,6,35,1,'application/vnd.lotus-notes',NULL,NULL),(40,4,38,56008,'application/x-texinfo',NULL,NULL),(41,4,6,38,'application/vnd.openxmlformats-officedocument',NULL,NULL),(42,6,44,23,'application/x-blorb',NULL,NULL),(43,5,21,5,'application/epub+zip',NULL,NULL),(44,5,45,4,'application/vnd.dart',NULL,NULL),(45,4,3,7895386,'video/jpm',NULL,NULL),(46,5,12,9572048,'application/x-sv4crc',NULL,NULL),(47,6,26,1524,'application/vnd.svd',NULL,NULL),(48,4,31,474,'application/vnd.shana.informed.formdata',NULL,NULL),(49,4,46,835,'application/vnd.mozilla.xul+xml',NULL,NULL),(50,6,35,9145923,'image/prs.btif',NULL,NULL);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_types`
--

DROP TABLE IF EXISTS `media_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_types`
--

LOCK TABLES `media_types` WRITE;
/*!40000 ALTER TABLE `media_types` DISABLE KEYS */;
INSERT INTO `media_types` VALUES (4,' video'),(5,' audio'),(6,'img');
/*!40000 ALTER TABLE `media_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `from_users_id` int(10) unsigned NOT NULL,
  `to_users_id` int(10) unsigned NOT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `read_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_messages_users1_idx` (`from_users_id`),
  KEY `fk_messages_users2_idx` (`to_users_id`),
  CONSTRAINT `fk_messages_users1` FOREIGN KEY (`from_users_id`) REFERENCES `users` (`id`),
  CONSTRAINT `fk_messages_users2` FOREIGN KEY (`to_users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,15,24,'Ut aut sunt dolorem.','1988-11-19 19:51:06','1977-12-02 21:48:57'),(2,11,37,'','1972-03-10 14:38:25','0000-00-00 00:00:00'),(3,45,39,'','2013-02-22 09:45:45','0000-00-00 00:00:00'),(4,22,21,'','1983-08-12 18:49:40','0000-00-00 00:00:00'),(5,41,26,'Molestiae aut dolorem reiciendis quibusdam odio.','1987-02-11 18:44:39','2020-05-30 00:33:08'),(6,33,35,'Placeat labore tempora quas rem.','1994-05-04 02:41:58','0000-00-00 00:00:00'),(7,9,4,'','1990-10-28 19:52:21','1973-11-24 09:15:19'),(8,9,40,'','1995-02-02 09:04:57','1970-02-27 14:41:23'),(9,36,2,'Sit rerum magnam velit temporibus corporis aut.','2002-09-02 00:39:58','0000-00-00 00:00:00'),(10,46,22,'','1980-04-17 00:24:20','2001-03-22 10:28:25'),(11,37,45,'Rerum cumque vel sit nostrum facere commodi perspiciatis.','1988-03-02 20:43:52','0000-00-00 00:00:00'),(12,25,43,'Est eaque deserunt cum ratione omnis atque.','2003-02-05 20:04:52','0000-00-00 00:00:00'),(13,19,36,'Dolores porro voluptatum cum iste optio quas.','1996-01-25 05:46:50','2005-07-26 13:30:32'),(14,44,1,'','2012-09-07 19:13:48','1981-10-13 13:34:00'),(15,12,15,'Est ut excepturi autem eum.','1997-11-18 22:43:43','0000-00-00 00:00:00'),(16,33,26,'Qui dolorum soluta quia dolorem provident est.','1977-04-12 19:06:21','0000-00-00 00:00:00'),(17,38,43,'Nesciunt nam unde vel assumenda corrupti itaque numquam quia.','1981-03-24 04:36:03','2013-11-10 04:46:07'),(18,13,32,'Et ratione eius delectus quia inventore omnis.','1999-11-17 06:55:45','1991-03-12 09:54:32'),(19,32,34,'Dolore explicabo vitae illum recusandae quos laudantium.','2008-09-19 10:11:01','2006-04-03 05:01:37'),(20,3,22,'','1983-11-04 21:04:55','1974-04-19 15:52:44'),(21,10,35,'','2014-10-28 19:28:31','2007-04-24 22:34:07'),(22,6,18,'Quia sit distinctio eius qui sit tempora aut.','1970-10-07 11:02:56','0000-00-00 00:00:00'),(23,38,15,'Eaque illum odio eos blanditiis ut.','1978-02-03 01:31:19','0000-00-00 00:00:00'),(24,8,24,'','1987-11-22 00:58:02','2007-03-23 09:46:15'),(25,16,4,'','2009-05-24 21:30:50','1976-04-17 01:15:09'),(26,46,2,'Maxime mollitia nulla voluptatem mollitia ad commodi.','2015-12-25 20:10:44','0000-00-00 00:00:00'),(27,48,20,'','1974-09-16 04:38:08','2012-02-08 06:58:54'),(28,45,17,'Minima voluptas et illo autem pariatur nulla.','2013-04-05 05:56:15','0000-00-00 00:00:00'),(29,5,39,'','1973-08-31 10:10:15','2019-11-08 00:05:33'),(30,17,16,'','1982-08-15 13:50:23','2016-05-01 08:05:18'),(31,4,49,'','2004-07-01 12:48:36','0000-00-00 00:00:00'),(32,42,41,'','1995-05-31 09:50:23','1970-05-15 07:13:01'),(33,42,4,'Dolores est eos exercitationem necessitatibus quis quia fugiat dicta.','2011-03-08 12:02:38','0000-00-00 00:00:00'),(34,23,23,'Sint eveniet nesciunt suscipit consequuntur doloremque assumenda repudiandae.','1979-09-10 16:53:36','2003-01-31 08:37:25'),(35,38,25,'','1975-07-29 20:55:43','0000-00-00 00:00:00'),(36,44,48,'','1978-05-23 18:45:11','1976-11-04 05:30:32'),(37,10,50,'','2013-10-26 15:47:32','1995-02-26 20:43:34'),(38,15,48,'Laboriosam iusto ut accusantium aspernatur est repellendus.','1998-01-03 22:00:45','0000-00-00 00:00:00'),(39,14,23,'','1997-12-18 15:56:39','1986-06-05 15:01:29'),(40,22,30,'','2004-07-21 21:30:06','2011-10-07 02:59:16'),(41,27,17,'Recusandae fuga ipsum blanditiis tempore sed.','2001-01-27 19:25:33','2016-10-21 18:17:19'),(42,32,25,'Aspernatur veritatis ea id.','2006-09-10 19:07:40','0000-00-00 00:00:00'),(43,36,27,'Dolor quae quaerat provident incidunt.','2011-06-25 01:56:30','0000-00-00 00:00:00'),(44,41,41,'Earum dicta et enim nam cumque et sed.','2012-09-01 08:37:04','0000-00-00 00:00:00'),(45,15,8,'','1980-11-07 16:25:53','1970-08-29 01:40:27'),(46,7,18,'Ipsum amet reprehenderit beatae itaque.','1985-05-31 16:43:07','0000-00-00 00:00:00'),(47,7,48,'Sed saepe aut et et.','2014-10-19 14:40:08','0000-00-00 00:00:00'),(48,9,48,'Ullam rerum rerum et eos cum esse molestiae.','1994-04-05 00:41:47','0000-00-00 00:00:00'),(49,2,31,'','2007-03-12 12:20:44','1976-05-05 00:54:45'),(50,21,40,'','1976-11-16 14:48:02','1981-09-17 03:45:27');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `posts_id` int(10) unsigned DEFAULT NULL,
  `users_id` int(10) unsigned NOT NULL,
  `communities_id` int(10) unsigned DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `media_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_posts_users1_idx` (`users_id`),
  KEY `fk_posts_communities1_idx` (`communities_id`),
  KEY `fk_posts_media1_idx` (`media_id`),
  KEY `fk_posts_posts1_idx` (`posts_id`),
  CONSTRAINT `fk_posts_communities1` FOREIGN KEY (`communities_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_posts_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_posts_posts1` FOREIGN KEY (`posts_id`) REFERENCES `posts` (`id`),
  CONSTRAINT `fk_posts_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (401,NULL,26,6,'Voluptatem quo sed voluptatum porro.','2015-02-08 08:36:15',49),(402,NULL,43,42,'Dolores enim cumque laudantium molestias quis.','1998-08-31 21:56:11',19),(403,NULL,1,5,'Cum vero deleniti consequatur.','1995-07-20 13:40:22',47),(404,NULL,19,14,'Omnis aut commodi nisi dolor soluta.','1986-11-17 16:01:10',45),(405,NULL,1,23,'Repudiandae minima qui voluptas sint.','2015-06-08 00:30:55',27),(406,NULL,23,36,'Dolores eos rem animi voluptatem culpa sapiente facere.','1971-09-07 00:54:47',43),(407,NULL,28,19,'Fuga eum voluptas id tenetur et sed.','1978-11-19 06:08:09',19),(408,NULL,50,3,'Tempore unde quibusdam sint rem.','1990-10-31 20:54:32',4),(409,NULL,13,2,'Molestiae inventore id omnis quam.','2017-01-22 02:52:46',5),(410,NULL,40,41,'Totam aspernatur maxime suscipit minus qui blanditiis explicabo cum.','1979-03-05 00:21:07',3),(411,NULL,3,17,'Maxime harum vitae rerum consequatur laboriosam sed dolorum.','1987-06-02 18:03:06',9),(412,NULL,1,9,'Sit sapiente reiciendis et ea harum.','2014-05-07 16:13:46',1),(413,NULL,20,9,'Quae reprehenderit unde voluptas ipsum quia at.','2005-06-19 12:11:12',5),(414,NULL,17,28,'Excepturi occaecati eum consequatur sed ut commodi asperiores unde.','1982-01-16 11:19:50',18),(415,NULL,11,28,'Doloribus cumque fuga qui magni.','2002-04-09 09:39:57',40),(416,NULL,37,1,'Minus ea natus accusantium perferendis sed distinctio harum repudiandae.','2003-02-15 22:29:56',26),(417,NULL,30,29,'Quasi quidem minus eveniet quis praesentium qui repudiandae.','1997-04-10 14:10:35',44),(418,NULL,49,28,'Incidunt unde dicta repudiandae.','2000-04-30 02:14:22',47),(419,NULL,2,40,'Sed assumenda harum ut aperiam aperiam rerum.','1983-02-05 16:48:48',49),(420,NULL,6,30,'Sapiente vel perferendis animi in.','2016-07-29 22:42:25',39),(421,NULL,8,33,'Quia id temporibus rerum deleniti dolorem qui tenetur.','2000-01-31 12:55:57',5),(422,NULL,17,34,'Incidunt aut sed dolores est rerum.','2005-03-26 18:03:26',14),(423,NULL,17,3,'Voluptatem corrupti aut cumque.','1986-06-09 16:27:45',22),(424,NULL,21,20,'Quis quo omnis et sed distinctio eum.','2009-06-25 00:43:23',49),(425,NULL,38,30,'Iste vitae quia et voluptate molestiae nulla autem.','2003-05-26 20:41:57',27),(426,NULL,28,16,'Delectus est molestias et eius quisquam sed.','2004-06-09 20:11:18',28),(427,NULL,4,46,'Molestiae magnam autem quae cum.','2013-01-07 23:36:02',6),(428,NULL,48,44,'Voluptas omnis neque beatae est.','1972-01-11 05:38:39',34),(429,NULL,44,45,'Delectus numquam architecto dolore aut illum.','2003-02-06 22:04:48',24),(430,NULL,42,50,'Repellendus similique eveniet maiores doloribus nam.','1985-03-23 13:19:35',4),(431,NULL,30,8,'Et ut dolore cum distinctio.','1996-04-22 01:05:16',36),(432,NULL,35,24,'Dolor in cupiditate est magnam omnis cumque voluptas.','1985-03-05 07:20:53',19),(433,NULL,49,41,'Sit neque sequi doloribus explicabo vero enim.','1991-03-24 00:46:05',22),(434,NULL,20,11,'Pariatur enim doloribus qui quia totam quisquam aliquam.','1970-05-23 04:47:53',41),(435,NULL,19,49,'Repudiandae aut nemo aperiam facilis ipsum optio tempore.','2006-01-09 03:07:45',20),(436,NULL,46,27,'Et est dolores temporibus facilis.','2015-05-22 16:14:31',36),(437,NULL,23,30,'Animi molestiae eos est repellat incidunt ut quod.','1979-01-18 01:55:52',31),(438,NULL,29,27,'A molestiae omnis vitae officia.','2007-07-19 23:19:26',24),(439,NULL,13,20,'In ratione et velit aut.','1973-04-29 17:56:28',19),(440,NULL,37,12,'Voluptas ut ex eos sed.','2003-07-11 18:38:56',19),(441,NULL,40,42,'Exercitationem enim nemo quia voluptate consectetur id.','2018-02-03 07:02:52',26),(442,NULL,25,26,'Eligendi ut pariatur et eaque fuga.','1981-11-09 12:10:29',50),(443,NULL,44,24,'Quia voluptate ipsa voluptatibus ipsum qui iure.','1981-08-08 23:31:30',40),(444,NULL,15,44,'Ut qui perferendis placeat rerum vero.','1991-12-19 04:53:35',1),(445,NULL,6,13,'Quas tempore amet non consequatur perspiciatis libero voluptate nam.','1997-12-26 19:02:44',50),(446,NULL,25,8,'Vero eligendi enim amet dolor molestias aliquid.','1988-02-05 02:45:42',26),(447,NULL,11,31,'Explicabo et voluptatibus debitis accusantium reiciendis ex fugiat.','1999-01-05 09:16:39',6),(448,NULL,41,10,'Vero quaerat rem est vel natus eveniet rem tenetur.','1994-06-21 06:31:27',32),(449,NULL,15,23,'Ipsa mollitia consectetur voluptatem vero officiis qui.','2005-12-09 10:14:36',2),(450,NULL,33,9,'Optio reprehenderit exercitationem dolores qui odio voluptas nulla.','1986-03-09 19:13:47',13);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `profiles` (
  `users_id` int(10) unsigned NOT NULL,
  `firstname` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` enum('m','f','x') COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `address` varchar(245) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `photo_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `school` varchar(145) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`users_id`),
  KEY `fk_profiles_media1_idx` (`photo_id`),
  KEY `firstname_lastname_idx` (`lastname`,`firstname`),
  CONSTRAINT `fk_profiles_media1` FOREIGN KEY (`photo_id`) REFERENCES `media` (`id`),
  CONSTRAINT `fk_profiles_users_users_id` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Nayeli','Hilpert','f','1975-06-01','9194 Christiansen Plaza','','1981-03-08 03:12:53',1,'Quisquam molestiae aperiam illum est molestiae.'),(2,'Jocelyn','Dickinson','m','1991-12-25','213 Andreanne Spring Apt. 721','Sint nobis suscipit mollitia enim placeat at.','1975-02-21 03:38:21',2,'Consectetur ad aut eos omnis.'),(3,'Janick','Konopelski','f','2008-10-13','9136 Vita Rapids Suite 435','','2019-01-03 03:29:07',3,'Saepe omnis molestiae ad eos sed cumque.'),(4,'Beverly','Tillman','f','1993-02-27','31426 Swift Manor','Error soluta assumenda deserunt laudantium od','1987-04-11 06:47:42',4,'Totam omnis impedit ipsam consequatur rerum rem.'),(5,'Alvena','McCullough','m','1988-12-07','351 Brekke Avenue','','1998-04-06 04:51:21',5,'Qui nam cupiditate et at unde est aspernatur.'),(6,'Jesse','Smitham','f','2001-04-03','575 Casimir Tunnel Suite 814','','2017-06-01 11:52:08',6,'Porro qui soluta saepe autem quia maxime nulla.'),(7,'Roderick','Moore','m','1988-04-14','919 Rowe Tunnel','','2008-05-08 21:03:11',7,'Doloremque repellat quo odit laudantium sed minima molestiae dolores.'),(8,'Robert','Dach','m','1983-03-02','250 Lonzo Garden Apt. 977','Voluptas ipsum delectus vero illum cumque pro','1994-01-09 07:08:48',8,'Omnis aperiam minus sed.'),(9,'Dusty','Kihn','m','1988-01-01','183 Dallin Trail','Similique natus tempora eum placeat qui harum','2010-02-06 02:57:37',9,'Quo alias consectetur est aut reiciendis occaecati aut praesentium.'),(10,'Caden','Spencer','m','1988-08-15','359 Weissnat Course Suite 785','Nemo consequuntur numquam modi recusandae.','1984-11-05 16:16:56',10,'Sit error ut earum voluptas nobis dolor fugiat.'),(11,'Adelbert','Gaylord','f','2019-03-09','583 Cassin Islands','','2015-02-08 07:08:30',11,'Dolorem tempore dicta aut.'),(12,'Neha','Skiles','m','2012-07-03','277 Angelita Mission Apt. 209','Rerum optio distinctio libero tempora veniam ','1984-02-26 05:27:30',12,'Modi beatae expedita deleniti minus alias rerum natus.'),(13,'Asha','Bins','f','1972-06-16','841 Jamison Isle Suite 609','','2007-09-25 10:26:43',13,'Non qui aut et ea soluta.'),(14,'Leopold','Runolfsdottir','m','1997-12-15','7064 Lizeth Gateway Apt. 525','Deserunt culpa repellat ad repellat impedit l','2019-01-06 04:26:14',14,'Repellat rerum sit ab id.'),(15,'Brian','Mayert','m','1977-08-30','37778 Nelle Corners','Accusamus voluptas illo ipsam enim.','1997-08-08 23:05:00',15,'Ut laboriosam unde quia.'),(16,'Ocie','Feest','f','1992-10-13','1902 Yost Loop Apt. 595','','1993-02-07 06:50:23',16,'Qui consectetur nesciunt aperiam error quo ad.'),(17,'Horace','Yundt','f','2018-05-19','816 Buckridge Inlet Apt. 490','','1984-09-03 11:32:40',17,'Dolor numquam et ad accusantium quia laboriosam.'),(18,'Nolan','Shields','m','2019-10-04','420 Ayden Circle Suite 868','','1979-02-12 02:32:43',18,'Et quos officiis quo consequatur.'),(19,'Dorris','Friesen','f','2004-12-12','806 Kulas Ways Apt. 994','Facere aut provident aut quo delectus labore ','1970-11-27 02:56:44',19,'Aliquid vero autem perferendis pariatur.'),(20,'Walker','Lesch','m','1988-12-27','03688 Rohan Rue','','1981-01-16 20:44:33',20,'Molestias in aut dolores dicta.'),(21,'Tod','Reichel','m','1988-07-20','76610 Margarete Spur','','2011-09-08 08:55:30',21,'Modi commodi voluptatem voluptas ipsa nisi.'),(22,'Rafael','Blanda','f','1989-03-01','333 Kuvalis Union Apt. 241','Harum qui fugiat exercitationem quibusdam nos','2015-08-15 20:54:07',22,'Dolor iusto earum aut ut sit.'),(23,'Donavon','Schulist','f','1982-08-16','7904 Reichert Parkway Suite 693','Quia possimus minus consequatur consectetur.','2002-08-19 22:18:59',23,'Ut natus laudantium illo est pariatur quidem ut.'),(24,'Icie','Schmitt','m','1983-01-12','4686 Hayes Circles','','1994-03-19 06:27:52',24,'Qui earum dolores nemo recusandae nisi rem est quas.'),(25,'Myriam','Kassulke','m','2013-09-15','3541 Ronny Port','','1971-06-14 19:49:11',25,'Et illo sunt et minima nulla.'),(26,'Jessica','Johnston','m','1996-10-29','9530 Kaci Courts','Non voluptatem rerum excepturi.','1987-12-06 04:13:32',26,'Consectetur dolore recusandae ipsam ducimus laudantium quas.'),(27,'Ryan','Gislason','f','2018-07-17','75086 D\'Amore Ports','Optio voluptas vel voluptatem quia molestiae.','1990-09-20 20:56:28',27,'Sit ipsam omnis minima ullam laboriosam at explicabo neque.'),(28,'Burley','Schroeder','m','1981-12-31','1672 Josiah Neck Apt. 146','','1974-09-13 11:09:11',28,'Quae et consectetur optio aut illum sit.'),(29,'Dillan','Bogisich','f','1979-10-22','52846 Dahlia Mall Apt. 042','','2017-12-28 13:09:32',29,'Molestiae velit sequi repudiandae.'),(30,'Opal','Weimann','m','1987-08-12','83231 Wuckert Hills','Voluptates harum aut laborum.','2003-06-25 05:22:28',30,'Assumenda iusto minima voluptas temporibus temporibus non iure.'),(31,'Nash','Pouros','m','1972-10-17','1063 McCullough Field','Velit natus vel non veritatis.','2017-02-22 09:13:13',31,'Dolores eveniet consequatur quis.'),(32,'Carlee','Schulist','m','2006-07-22','354 Brionna Landing','A praesentium rerum eum tempora soluta ipsa.','1973-02-25 14:02:51',32,'Et assumenda possimus facere quidem rerum quam.'),(33,'Abner','Labadie','m','1992-01-17','16553 Schuppe Mountains','Architecto nihil ut voluptas unde voluptatem ','2018-04-27 17:05:43',33,'Officiis cum earum qui officia.'),(34,'Arne','Lehner','m','1980-01-21','997 Greg Corners','Dicta dolorem voluptatem non sunt expedita im','2016-09-04 13:34:14',34,'Ipsum reiciendis sed qui expedita velit unde doloribus.'),(35,'Dejuan','Nader','m','1990-02-04','4586 Lou Highway Suite 494','','1995-07-11 01:42:54',35,'Itaque qui quibusdam qui nam asperiores.'),(36,'Candido','Muller','m','1980-05-16','0795 Hattie Plaza Suite 628','Aliquam facilis dolor voluptas ex ut libero c','1980-12-24 23:22:20',36,'Corrupti cum consequatur voluptatum tempora ut.'),(37,'Mikel','Will','f','2011-06-12','4719 Kertzmann Spurs','Modi sit qui animi nulla numquam consequatur ','1995-05-09 18:59:58',37,'Eum autem iure quia odit consectetur est.'),(38,'Alec','Skiles','f','2021-02-13','78466 Kaelyn Views Suite 342','','2016-01-15 01:40:08',38,'Ut ad vitae non excepturi.'),(39,'Shany','Mraz','f','1990-12-23','968 Cora Court Suite 001','','1975-06-05 13:04:56',39,'Nihil officiis odio fugiat.'),(40,'Braxton','Upton','f','2010-02-21','9921 Mustafa Inlet','Qui maiores consequuntur rerum officia.','1995-09-01 19:18:10',40,'Provident ducimus iusto culpa ut earum.'),(41,'Pamela','Schaefer','f','1989-04-20','412 Garret Rapids','Assumenda dignissimos molestiae repudiandae n','1994-11-16 01:11:25',41,'Amet et explicabo exercitationem et ratione unde aspernatur.'),(42,'Alden','Gulgowski','f','2019-04-01','6420 Troy Ranch Suite 185','','2007-04-19 12:35:49',42,'Illum qui totam tempore aut ullam.'),(43,'Myah','Feil','m','1987-09-01','270 Huels Trail','Quo ex eos asperiores fuga aut.','1997-06-25 20:13:55',43,'Ad sit atque ut voluptatem.'),(44,'Dimitri','Rohan','m','1977-01-11','1571 Solon Mall Apt. 584','Odit dignissimos dignissimos facere nesciunt.','2003-06-30 15:03:18',44,'Quis ut necessitatibus et consectetur ea pariatur ut et.'),(45,'Annalise','Willms','f','1994-11-07','88044 Russell Terrace','Nisi molestiae consequatur corporis iure est ','1992-08-04 19:17:13',45,'Molestias excepturi nihil tenetur sed nam.'),(46,'Elmo','Jakubowski','m','1975-06-09','88154 Keara Mountain','Quia quas eum nisi est fugiat doloremque dele','1997-06-27 08:58:47',46,'Molestiae maxime placeat nulla illo.'),(47,'Zelma','Kub','m','2019-07-29','31734 Kunze Avenue Suite 231','','1999-07-16 08:14:47',47,'Enim quae ut doloribus quaerat.'),(48,'Tito','Moore','f','2007-10-23','0996 Senger Squares Suite 406','Sit ut corporis impedit non quis asperiores.','1975-02-08 05:09:28',48,'Incidunt modi nostrum fugiat.'),(49,'Hank','Weimann','m','2015-01-26','128 Estevan Via','','1993-09-01 15:05:28',49,'Accusantium fugiat at sed quisquam autem dolorem beatae.'),(50,'Amy','Schowalter','f','2001-04-19','4479 Nienow Mountain Apt. 814','','2004-06-07 21:28:15',50,'Beatae quod et qui in.');
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school_types`
--

DROP TABLE IF EXISTS `school_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `school_types` (
  `profiles_users_id` int(10) unsigned NOT NULL,
  `types` enum('h','c','u') COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'h - high school\nc - college\nu - university',
  `name` varchar(145) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(145) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`profiles_users_id`),
  KEY `fk_school_types_profiles1_idx` (`profiles_users_id`),
  CONSTRAINT `fk_school_types_profiles1` FOREIGN KEY (`profiles_users_id`) REFERENCES `profiles` (`users_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school_types`
--

LOCK TABLES `school_types` WRITE;
/*!40000 ALTER TABLE `school_types` DISABLE KEYS */;
INSERT INTO `school_types` VALUES (1,'c','Minima dolorum eligendi quia magni.','Turnerchester'),(7,'h','Eum rerum nisi corrupti recusandae et nesciunt.','Lake Marinahaven'),(10,'c','Dignissimos in in ea aliquam accusantium dolorem quod.','Krajcikberg'),(11,'c','Magnam earum et id autem repudiandae repellat sunt rerum.','Hermanchester'),(12,'h','Et beatae non deserunt non voluptas possimus.','Waltertown'),(13,'u','Et voluptas quidem et non aut molestiae ex quia.','Carlifort'),(15,'h','Deserunt voluptate tempore aut animi eos itaque natus.','New Dandrebury'),(17,'h','Eum et deleniti labore dignissimos reiciendis voluptatum.','Kameronside'),(18,'h','Aliquam doloremque ipsum quaerat doloremque dicta sunt.','Lenoraville'),(19,'c','Autem nesciunt velit necessitatibus dolorum.','Lake Kaylinside'),(20,'u','Quisquam qui reiciendis ut voluptas sed.','West Katarinafort'),(21,'u','Facere sint voluptatem ea magni sit.','Port Hughview'),(23,'h','Voluptatem minus sunt sit consequuntur perspiciatis.','Braunberg'),(25,'h','Et tempora voluptatem porro et accusamus dignissimos vel.','Giannimouth'),(26,'h','Illum omnis et placeat quo aliquid blanditiis ut.','Aufderharmouth'),(27,'u','Vero enim possimus quidem.','Emardchester'),(28,'h','Similique illo commodi quasi neque voluptates qui asperiores.','Weimannmouth'),(30,'u','Aut voluptate ipsam est doloribus accusamus.','Alviston'),(33,'h','Ut mollitia voluptatibus repellendus.','West Monte'),(36,'u','Id harum aliquam veritatis nam tenetur placeat et.','Port Genovevamouth'),(39,'c','Sunt et est qui id.','New Nellie'),(40,'h','Aspernatur ut vitae consequatur omnis.','Lake Beryl'),(42,'c','Ipsa ducimus iste eligendi amet pariatur.','Jacobsburgh'),(44,'h','Consequatur rem repellendus rem iure quo est voluptatem et.','Bergstromshire'),(45,'c','Maxime libero cumque dicta et dolore vitae et.','Naderstad'),(46,'u','Ut excepturi sed error ut doloremque.','Uptonmouth'),(49,'c','Sunt autem odit quisquam quis similique possimus.','East Joanstad');
/*!40000 ALTER TABLE `school_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(245) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` bigint(20) NOT NULL,
  `password_hash` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phone_UNIQUE` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'jamir00@example.net',79280102991,'5337f3e3fee8715d734e6eadc832799793095a38'),(2,'giovani.bartell@example.org',79589832797,'87b982b0ff91069ac47abd50e6ff5964814551dd'),(3,'monahan.norma@example.com',79808776769,'d6703928d8dfe47b7c71cbcca201e778ab76052b'),(4,'milford.tromp@example.com',79696621469,'43228ebf50aa71181e535c4421f025fefbe664b8'),(5,'roel48@example.net',79289631230,'e63b2defafbf20b33ff9f3460aece8772b558ddb'),(6,'edgardo37@example.net',79924968235,'54c0ca2d9105ed9fd243b569c7d47fc967ae2713'),(7,'bergnaum.cecelia@example.net',79789544873,'580c35777225b7fbc9260e936ac021622fb5e8e6'),(8,'qhilpert@example.org',79146977494,'01d6aa6c36d3b9518b485ae425281bfd0d2d2ea8'),(9,'nya.padberg@example.org',79617554479,'d263b26de6d153d32cea4c6cbac20fea939b9c29'),(10,'uheidenreich@example.com',79829660103,'5dd2e4a43574b1961cd9629ed5ced11dc3a407e0'),(11,'lavada83@example.org',79002609577,'5a56608c964962de55a84490657dc0397e8d8941'),(12,'bartoletti.ettie@example.org',79928025446,'1240cb97d336c67176022dbeca03d78e09b8a08c'),(13,'bosco.eileen@example.org',79063402546,'42cae9e236778794e8e7efc8530029e3254382ff'),(14,'linnie.waelchi@example.com',79803449926,'6c5d63f713bf0149e2343a8f57b7f8afd0e6d4c1'),(15,'adela05@example.net',79482219702,'ef3ff05181103789953ba696aecaf95cac3fe353'),(16,'deckow.arvilla@example.net',79651280094,'25689b09a0fcd26de61c4f1a0addb1889cd2a4b9'),(17,'orn.amie@example.net',79062768897,'acba3947436ddfd6153e1c597784378ca237d921'),(18,'berniece.trantow@example.org',79586958010,'b57bb5845b9127eab233c9a8e996d100481c637f'),(19,'klocko.karelle@example.com',79867542172,'715b525262fe3942850291fd70a86659806c59a3'),(20,'kiera51@example.net',79364288282,'7bdad80ad7411e9f3943979968d8ef656bab5050'),(21,'hulda.littel@example.com',79316128963,'f0d33d70043625ebce78f705916801ee2831fcda'),(22,'andreane28@example.com',79322838240,'d03ace3774526795767d25598595d7b03fa9268e'),(23,'carolanne18@example.com',79539921689,'c32333badb45d707e92feae6b4f6de6a5146b727'),(24,'ledner.austyn@example.org',79345827204,'d3e30ead057cae3c97e389c58aadcd2b9367dafe'),(25,'sauer.henderson@example.com',79794744593,'fa88f0e48109340742c2087cd6c1d443f90d4fba'),(26,'bednar.mercedes@example.net',79432326992,'25608ea1fea2e0601c7f4cd9fefc837fb376e3da'),(27,'shields.franz@example.org',79085225969,'2afe53f8d1f0a834bc6ced72d0d3c9e9554793a2'),(28,'nprice@example.net',79379253007,'86bd585263fbc0af56ebdb1e2427331a87a384b7'),(29,'destinee.mclaughlin@example.com',79629364336,'1991988e6e855729096894467de6a74081679c46'),(30,'idell07@example.net',79017276520,'2f74663192ddbc50ee2fef52b47bb638cfe31543'),(31,'kheathcote@example.com',79415086708,'b56a0d2d6fe8bac3609674191692a2ac7026bbd0'),(32,'thompson.everette@example.org',79437625370,'dbc109568c7994581c3dbe0e0bee28905319bb4f'),(33,'cleo28@example.com',79560273008,'93b7818d060a0108af1d22b04b2f035d125b44a0'),(34,'yost.muhammad@example.com',79737230835,'04c71123c8b20906cc8559dfab695bac9dc0c609'),(35,'alvah55@example.com',79034695188,'18708ee0e93b7be2adaea954a8fbab3e5df48abe'),(36,'jmoore@example.org',79405796843,'bf39be1ea2a24ed2b959213fd23e3e61a4cc1000'),(37,'guiseppe.lockman@example.com',79157730850,'d2dc7b591088234f3688a9caee1d7e1a4467f438'),(38,'ijacobi@example.com',79095092574,'3c5f04e17ee5e43166ddc0fd1a36db0f0bbaae83'),(39,'akovacek@example.net',79278294394,'dfd3ab0a84c255e15b2f0916b3296583afde1c1f'),(40,'elody.jenkins@example.org',79899762858,'476bb4890e095b91b2e46ffb24be18d9d1dc21d9'),(41,'selina97@example.com',79865596442,'cae10c39a9a34e4bfe0001349240bd562e5c34c0'),(42,'conrad.kovacek@example.net',79113395861,'a93a5a727badc275726eff65bcfc5f7ce9c4bc1a'),(43,'winston.leffler@example.com',79046521142,'6ca213a915b2f9a917fca92f3d8a0b6a17eee517'),(44,'hauck.loraine@example.org',79205262411,'80eb7818e6a61fb1048b8076f4a3ceb4f06ec893'),(45,'hollis46@example.net',79887300376,'7f54e31d04e987972e22d9e1be888085944c9a3b'),(46,'baron.welch@example.org',79661780334,'0206b140a120349e7fd6e5d30b6586c96ba73310'),(47,'ansel00@example.net',79245435072,'9ed7aaabcf57ff6bede905642b229e551b76adc8'),(48,'mwillms@example.com',79399791824,'451604b22ca937aa98401fb788c19f9d18e6f6d5'),(49,'mervin.luettgen@example.org',79092007439,'b6fd46092851cb73eb54076ed3acc5a17d0fad5f'),(50,'atowne@example.com',79568727539,'b4d16619827a92e10b58dbeb4ef7c39ce01e4770');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_communities`
--

DROP TABLE IF EXISTS `users_communities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_communities` (
  `communities_id` int(10) unsigned NOT NULL,
  `users_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`communities_id`,`users_id`),
  KEY `fk_users_communities_communities1_idx` (`communities_id`),
  KEY `fk_users_communities_users1_idx` (`users_id`),
  CONSTRAINT `fk_users_communities_communities1` FOREIGN KEY (`communities_id`) REFERENCES `communities` (`id`),
  CONSTRAINT `fk_users_communities_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_communities`
--

LOCK TABLES `users_communities` WRITE;
/*!40000 ALTER TABLE `users_communities` DISABLE KEYS */;
INSERT INTO `users_communities` VALUES (2,40),(2,45),(3,36),(4,3),(6,7),(8,17),(9,36),(10,14),(12,26),(12,29),(12,46),(15,9),(15,26),(15,37),(15,45),(16,27),(18,31),(19,4),(19,5),(20,26),(20,37),(21,4),(21,12),(21,35),(21,41),(22,10),(24,37),(24,45),(25,26),(28,41),(28,47),(29,7),(30,4),(30,40),(32,26),(33,5),(35,43),(35,48),(36,32),(36,36),(38,37),(39,20),(40,35),(42,34),(43,29),(43,30),(45,3),(45,17),(48,12);
/*!40000 ALTER TABLE `users_communities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-14 17:07:08
