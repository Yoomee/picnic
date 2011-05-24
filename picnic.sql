-- MySQL dump 10.11
--
-- Host: localhost    Database: picnic
-- ------------------------------------------------------
-- Server version	5.0.51-log

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
-- Table structure for table `advert_campaigns`
--

DROP TABLE IF EXISTS `advert_campaigns`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `advert_campaigns` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `advert_campaigns`
--

LOCK TABLES `advert_campaigns` WRITE;
/*!40000 ALTER TABLE `advert_campaigns` DISABLE KEYS */;
INSERT INTO `advert_campaigns` VALUES (1,'Splash page','2011-05-06 15:02:05','2011-05-06 15:02:05');
/*!40000 ALTER TABLE `advert_campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `adverts`
--

DROP TABLE IF EXISTS `adverts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `adverts` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `url` varchar(255) default NULL,
  `image_uid` varchar(255) default NULL,
  `impression_count` int(11) default '0',
  `max_impression_count` int(11) default NULL,
  `click_count` int(11) default '0',
  `max_click_count` int(11) default NULL,
  `active_from` datetime default NULL,
  `active_until` datetime default NULL,
  `campaign_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `tag_line` text,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `adverts`
--

LOCK TABLES `adverts` WRITE;
/*!40000 ALTER TABLE `adverts` DISABLE KEYS */;
INSERT INTO `adverts` VALUES (1,'PICNIC11 Early Bird Booking','http://picnic.yoomee.com/picnic11','2011/05/20/09_58_50_275_picnic_cardboard.jpg',251,NULL,8,NULL,NULL,NULL,1,'2011-05-06 15:03:15','2011-05-24 11:54:47','Tickets now available. Don\'t miss the Early Bird discount, valid until 31 July.');
/*!40000 ALTER TABLE `adverts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badge_awardings`
--

DROP TABLE IF EXISTS `badge_awardings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `badge_awardings` (
  `id` int(11) NOT NULL auto_increment,
  `badge_id` int(11) default NULL,
  `member_id` int(11) default NULL,
  `announced` tinyint(1) default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_badge_awardings_on_badge_id` (`badge_id`),
  KEY `index_badge_awardings_on_member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `badge_awardings`
--

LOCK TABLES `badge_awardings` WRITE;
/*!40000 ALTER TABLE `badge_awardings` DISABLE KEYS */;
INSERT INTO `badge_awardings` VALUES (2,1,9,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(3,1,10,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(4,1,11,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(5,1,12,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(6,1,13,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(7,1,14,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(8,2,15,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(9,2,16,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(10,2,17,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(11,2,18,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(12,2,19,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(13,2,20,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(14,3,21,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(15,3,22,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(16,3,23,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(17,3,24,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(18,3,25,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(19,3,26,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(20,4,27,0,'2011-05-05 12:34:58','2011-05-05 12:34:58'),(21,4,28,0,'2011-05-05 12:34:58','2011-05-05 12:34:58'),(22,4,29,0,'2011-05-05 12:34:58','2011-05-05 12:34:58'),(23,4,30,0,'2011-05-05 12:34:58','2011-05-05 12:34:58'),(24,4,31,0,'2011-05-05 12:34:58','2011-05-05 12:34:58'),(25,4,32,0,'2011-05-05 12:34:58','2011-05-05 12:34:58'),(26,3,2,0,'2011-05-05 13:15:41','2011-05-05 13:15:41'),(27,3,13,0,'2011-05-06 07:58:25','2011-05-06 07:58:25'),(28,1,33,0,'2011-05-11 09:30:47','2011-05-11 09:30:47'),(29,2,10,0,'2011-05-11 12:05:54','2011-05-11 12:05:54'),(30,1,34,0,'2011-05-16 16:18:26','2011-05-16 16:18:26'),(31,1,35,0,'2011-05-18 15:20:28','2011-05-18 15:20:28'),(32,1,36,0,'2011-05-18 15:23:01','2011-05-18 15:23:01'),(33,1,37,0,'2011-05-18 15:25:59','2011-05-18 15:25:59');
/*!40000 ALTER TABLE `badge_awardings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badges`
--

DROP TABLE IF EXISTS `badges`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `badges` (
  `id` int(11) NOT NULL auto_increment,
  `ref` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `description` text,
  `image_uid` varchar(255) default NULL,
  `award_message` text,
  `trigger_name` varchar(255) default NULL,
  `trigger_num` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
INSERT INTO `badges` VALUES (1,'picnic11_team','Picnic Team','Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia.','2011/05/05/02_20_05_490_shield.png','',NULL,NULL),(2,'picnic_advisor','Picnic Advisor','Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero. Vestibulum mollis mauris enim. Morbi euismod magna.','2011/05/05/02_19_08_20_shield.png','',NULL,NULL),(3,'correspondent','NewsNetwork Correspondent','Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero. Vestibulum mollis mauris enim. Morbi euismod magna.','2011/05/05/02_20_24_165_shield.png','',NULL,NULL),(4,'picnic11_speaker','PICNIC 11 Speaker','Vestibulum at risus augue. Sed non semper dolor. Sed fringilla consequat velit a porta. Pellentesque sed lectus pharetra ipsum ultricies commodo non sit amet velit. ','2011/05/05/05_30_31_946_shield.png','Vestibulum at risus augue. Sed non semper dolor. Sed fringilla consequat velit a porta. Pellentesque sed lectus pharetra ipsum ultricies commodo non sit amet velit. ',NULL,NULL);
/*!40000 ALTER TABLE `badges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `bookings` (
  `id` int(11) NOT NULL auto_increment,
  `date_of_birth` date default NULL,
  `email` varchar(255) default NULL,
  `event_id` int(11) default NULL,
  `first_name` varchar(255) default NULL,
  `gender` varchar(255) default NULL,
  `phone_number` varchar(255) default NULL,
  `surname` varchar(255) default NULL,
  `where_did_you_hear_about_the_event` varchar(255) default NULL,
  `payment_status` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conference_delegates`
--

DROP TABLE IF EXISTS `conference_delegates`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `conference_delegates` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `regdate` date default NULL,
  `present` tinyint(1) default NULL,
  `delegate_type` varchar(255) default NULL,
  `promo` varchar(255) default NULL,
  `firstname` varchar(255) default NULL,
  `lastname` varchar(255) default NULL,
  `gender` varchar(255) default NULL,
  `organisation` varchar(255) default NULL,
  `branch` varchar(255) default NULL,
  `function` varchar(255) default NULL,
  `email` varchar(255) default NULL,
  `twitter` varchar(255) default NULL,
  `ticket_wed` tinyint(1) default NULL,
  `ticket_thu` tinyint(1) default NULL,
  `ticket_fri` tinyint(1) default NULL,
  `ticket_3` tinyint(1) default NULL,
  `dinner_wed` tinyint(1) default NULL,
  `dinner_thu` tinyint(1) default NULL,
  `signature` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `conference_delegates`
--

LOCK TABLES `conference_delegates` WRITE;
/*!40000 ALTER TABLE `conference_delegates` DISABLE KEYS */;
/*!40000 ALTER TABLE `conference_delegates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conference_sessions`
--

DROP TABLE IF EXISTS `conference_sessions`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `conference_sessions` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `venue_id` int(11) default NULL,
  `description` text,
  `starts_at` datetime default NULL,
  `ends_at` datetime default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_conference_sessions_on_venue_id` (`venue_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `conference_sessions`
--

LOCK TABLES `conference_sessions` WRITE;
/*!40000 ALTER TABLE `conference_sessions` DISABLE KEYS */;
INSERT INTO `conference_sessions` VALUES (1,'Session 1',1,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero.','2011-09-14 09:00:00','2011-09-14 10:00:00','2011-05-05 11:30:16','2011-05-05 14:43:42'),(2,'Session 2',1,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero.','2011-09-14 12:00:00','2011-09-14 13:00:00','2011-05-05 11:30:16','2011-05-05 14:43:42'),(3,'Session 3',2,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero.','2011-09-14 14:00:00','2011-09-14 16:00:00','2011-05-05 11:30:16','2011-05-05 14:43:43'),(4,'Session 4',2,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero.','2011-09-14 12:00:00','2011-09-14 13:00:00','2011-05-05 11:30:16','2011-05-05 14:43:43'),(5,'Session 5',3,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero.','2011-09-14 15:00:00','2011-09-14 17:00:00','2011-05-05 11:30:16','2011-05-05 14:43:43'),(6,'Session 6',4,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero.','2011-09-14 15:00:00','2011-09-14 16:00:00','2011-05-05 11:30:16','2011-05-05 14:43:43'),(7,'Session 7',1,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero.','2011-09-15 09:00:00','2011-09-14 10:00:00','2011-05-05 11:30:16','2011-05-05 14:43:43'),(8,'Session 8',1,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero.','2011-09-15 12:00:00','2011-09-14 13:00:00','2011-05-05 11:30:16','2011-05-05 14:43:43'),(9,'Session 9',2,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero.','2011-09-15 14:00:00','2011-09-14 16:00:00','2011-05-05 11:30:16','2011-05-05 14:43:43'),(10,'Session 10',2,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero.','2011-09-15 12:00:00','2011-09-14 13:00:00','2011-05-05 11:30:16','2011-05-05 14:43:43'),(11,'Session 11',3,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero.','2011-09-15 15:00:00','2011-09-14 17:00:00','2011-05-05 11:30:16','2011-05-05 14:43:43'),(12,'Session 12',4,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero.','2011-09-15 15:00:00','2011-09-14 16:00:00','2011-05-05 11:30:16','2011-05-05 14:43:43');
/*!40000 ALTER TABLE `conference_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_folders`
--

DROP TABLE IF EXISTS `document_folders`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `document_folders` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `document_folders`
--

LOCK TABLES `document_folders` WRITE;
/*!40000 ALTER TABLE `document_folders` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `documents`
--

DROP TABLE IF EXISTS `documents`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `documents` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `file_uid` varchar(255) collate utf8_unicode_ci default NULL,
  `file_name` varchar(255) collate utf8_unicode_ci default NULL,
  `file_ext` varchar(255) collate utf8_unicode_ci default NULL,
  `member_id` int(11) default NULL,
  `delta` tinyint(1) default '1',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `folder_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_documents_on_member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
INSERT INTO `documents` VALUES (1,'PICNIC Logos','2011/05/05/05_01_38_506_PICNIC_Logos.zip','PICNIC_Logos.zip','zip',2,0,'2011-05-05 12:01:38','2011-05-05 12:01:38',NULL);
/*!40000 ALTER TABLE `documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquiries`
--

DROP TABLE IF EXISTS `enquiries`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `enquiries` (
  `id` int(11) NOT NULL auto_increment,
  `form_name` varchar(255) collate utf8_unicode_ci default NULL,
  `member_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `enquiries`
--

LOCK TABLES `enquiries` WRITE;
/*!40000 ALTER TABLE `enquiries` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquiry_fields`
--

DROP TABLE IF EXISTS `enquiry_fields`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `enquiry_fields` (
  `id` int(11) NOT NULL auto_increment,
  `enquiry_id` int(11) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `value` text collate utf8_unicode_ci,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `enquiry_fields`
--

LOCK TABLES `enquiry_fields` WRITE;
/*!40000 ALTER TABLE `enquiry_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `enquiry_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_categories`
--

DROP TABLE IF EXISTS `event_categories`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `event_categories` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `color` varchar(255) default '#2795E4',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `event_categories`
--

LOCK TABLES `event_categories` WRITE;
/*!40000 ALTER TABLE `event_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `events` (
  `id` int(11) NOT NULL auto_increment,
  `start_at` datetime default NULL,
  `end_at` datetime default NULL,
  `all_day` tinyint(1) default NULL,
  `attachable_type` varchar(255) default NULL,
  `attachable_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `page_id` int(11) default NULL,
  `paypal_business` varchar(255) default NULL,
  `paypal_payment_amount` float default '0',
  `use_paypal` tinyint(1) default '0',
  `category_id` int(11) default NULL,
  `venue_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_events_on_page_id` (`page_id`),
  KEY `index_events_on_attachable_id` (`attachable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `member_id_target` int(11) default NULL,
  `message` text,
  `is_accepted` tinyint(1) default '0',
  `accepted_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,7,2,NULL,1,NULL),(2,7,38,NULL,0,NULL),(3,2,4,NULL,0,NULL);
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_relationships`
--

DROP TABLE IF EXISTS `item_relationships`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `item_relationships` (
  `id` int(11) NOT NULL auto_increment,
  `item_id` int(11) default NULL,
  `item_type` varchar(255) collate utf8_unicode_ci default NULL,
  `related_item_id` int(11) default NULL,
  `related_item_type` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `item_relationship_unique_index` (`item_id`,`item_type`,`related_item_id`,`related_item_type`),
  KEY `item_relationship_item` (`item_id`,`item_type`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `item_relationships`
--

LOCK TABLES `item_relationships` WRITE;
/*!40000 ALTER TABLE `item_relationships` DISABLE KEYS */;
INSERT INTO `item_relationships` VALUES (1,16,'Page',1,'Document','2011-05-05 12:02:04','2011-05-05 12:02:04'),(2,24,'Page',2,'Page','2011-05-05 12:04:51','2011-05-05 12:04:51'),(3,24,'Page',3,'Page','2011-05-05 12:04:51','2011-05-05 12:04:51'),(4,24,'Page',6,'Page','2011-05-05 12:04:51','2011-05-05 12:04:51'),(6,10,'Page',2,'Page','2011-05-05 12:20:47','2011-05-05 12:20:47'),(8,10,'Page',10,'Member','2011-05-06 16:08:09','2011-05-06 16:08:09'),(9,10,'Page',4,'Page','2011-05-06 16:08:34','2011-05-06 16:08:34'),(15,14,'Page',4,'Page','2011-05-11 12:01:09','2011-05-11 12:01:09');
/*!40000 ALTER TABLE `item_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `links` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  `url` varchar(255) collate utf8_unicode_ci default NULL,
  `image_uid` varchar(255) collate utf8_unicode_ci default NULL,
  `member_id` int(11) default NULL,
  `attachable_id` int(11) default NULL,
  `attachable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `delta` tinyint(1) default '1',
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `url_error` tinyint(1) default '0',
  PRIMARY KEY  (`id`),
  KEY `index_links_on_member_id` (`member_id`),
  KEY `index_links_on_attachable_id` (`attachable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `locations` (
  `id` int(11) NOT NULL auto_increment,
  `lat` varchar(255) default NULL,
  `lng` varchar(255) default NULL,
  `address1` varchar(255) default NULL,
  `address2` varchar(255) default NULL,
  `city` varchar(255) default NULL,
  `country` varchar(255) default NULL,
  `postcode` varchar(255) default NULL,
  `attachable_id` int(11) default NULL,
  `attachable_type` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'53.3830548','-1.4647953',NULL,NULL,'Sheffield','United Kingdom',NULL,2,'Member','2011-05-05 13:15:41','2011-05-20 17:04:08'),(2,NULL,NULL,NULL,NULL,NULL,'',NULL,4,'Member','2011-05-05 13:24:17','2011-05-17 14:10:21'),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,'Member','2011-05-06 07:58:25','2011-05-06 07:58:25'),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,'Member','2011-05-06 10:38:50','2011-05-06 10:38:50'),(11,'52.26787669331263','4.951220324999985',NULL,NULL,NULL,NULL,NULL,33,'Member','2011-05-11 09:30:16','2011-05-20 08:36:50'),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,'Member','2011-05-11 12:05:54','2011-05-11 12:05:54'),(13,NULL,NULL,NULL,NULL,NULL,NULL,NULL,34,'Member','2011-05-16 16:17:56','2011-05-16 16:17:56'),(17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Member','2011-05-18 11:50:12','2011-05-18 11:50:12'),(18,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'Member','2011-05-18 14:15:32','2011-05-18 14:15:32'),(19,NULL,NULL,NULL,NULL,NULL,NULL,NULL,15,'Member','2011-05-18 14:45:50','2011-05-18 14:45:50'),(20,NULL,NULL,NULL,NULL,NULL,NULL,NULL,16,'Member','2011-05-18 14:55:11','2011-05-18 14:55:11'),(21,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,'Member','2011-05-18 14:55:11','2011-05-18 14:55:11'),(22,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18,'Member','2011-05-18 14:55:11','2011-05-18 14:55:11'),(23,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19,'Member','2011-05-18 14:55:11','2011-05-18 14:55:11'),(24,NULL,NULL,NULL,NULL,NULL,NULL,NULL,20,'Member','2011-05-18 14:55:11','2011-05-18 14:55:11'),(25,NULL,NULL,NULL,NULL,NULL,NULL,NULL,9,'Member','2011-05-18 14:55:48','2011-05-18 14:55:48'),(26,'53.36994692217272','-1.4757816281249947',NULL,NULL,NULL,NULL,NULL,11,'Member','2011-05-18 14:58:15','2011-05-19 13:43:30'),(27,NULL,NULL,NULL,NULL,NULL,NULL,NULL,21,'Member','2011-05-18 14:58:43','2011-05-18 14:58:43'),(28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,22,'Member','2011-05-18 14:58:43','2011-05-18 14:58:43'),(29,NULL,NULL,NULL,NULL,NULL,NULL,NULL,23,'Member','2011-05-18 14:58:43','2011-05-18 14:58:43'),(30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,24,'Member','2011-05-18 14:58:43','2011-05-18 14:58:43'),(31,NULL,NULL,NULL,NULL,NULL,NULL,NULL,25,'Member','2011-05-18 14:58:43','2011-05-18 14:58:43'),(32,NULL,NULL,NULL,NULL,NULL,NULL,NULL,26,'Member','2011-05-18 14:58:43','2011-05-18 14:58:43'),(33,NULL,NULL,NULL,NULL,NULL,NULL,NULL,12,'Member','2011-05-18 14:58:58','2011-05-18 14:58:58'),(34,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27,'Member','2011-05-18 15:04:52','2011-05-18 15:04:52'),(35,NULL,NULL,NULL,NULL,NULL,NULL,NULL,28,'Member','2011-05-18 15:04:52','2011-05-18 15:04:52'),(36,NULL,NULL,NULL,NULL,NULL,NULL,NULL,29,'Member','2011-05-18 15:04:52','2011-05-18 15:04:52'),(37,NULL,NULL,NULL,NULL,NULL,NULL,NULL,30,'Member','2011-05-18 15:04:52','2011-05-18 15:04:52'),(38,NULL,NULL,NULL,NULL,NULL,NULL,NULL,31,'Member','2011-05-18 15:04:52','2011-05-18 15:04:52'),(39,NULL,NULL,NULL,NULL,NULL,NULL,NULL,32,'Member','2011-05-18 15:04:52','2011-05-18 15:04:52'),(40,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14,'Member','2011-05-18 15:11:22','2011-05-18 15:11:22'),(41,NULL,NULL,NULL,NULL,NULL,NULL,NULL,35,'Member','2011-05-18 15:19:56','2011-05-18 15:19:56'),(42,NULL,NULL,NULL,NULL,NULL,NULL,NULL,36,'Member','2011-05-18 15:22:29','2011-05-18 15:22:29'),(43,NULL,NULL,NULL,NULL,NULL,NULL,NULL,37,'Member','2011-05-18 15:25:30','2011-05-18 15:25:30'),(46,'','',NULL,NULL,NULL,NULL,NULL,8,'Shout','2011-05-18 16:52:40','2011-05-18 16:52:40'),(47,'','',NULL,NULL,NULL,NULL,NULL,9,'Shout','2011-05-18 16:54:00','2011-05-18 16:54:00'),(48,'','',NULL,NULL,NULL,NULL,NULL,10,'Shout','2011-05-18 16:54:56','2011-05-18 16:54:56'),(49,'53.37977820876196','-1.4579288449218497',NULL,NULL,NULL,NULL,NULL,39,'Member','2011-05-19 13:40:56','2011-05-19 18:08:45'),(51,NULL,NULL,NULL,NULL,NULL,NULL,NULL,40,'Member','2011-05-21 18:22:45','2011-05-21 18:22:45'),(54,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'Member','2011-05-23 16:38:49','2011-05-23 16:38:49'),(55,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,'Member','2011-05-24 10:51:57','2011-05-24 10:51:57');
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_hashes`
--

DROP TABLE IF EXISTS `login_hashes`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `login_hashes` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `salt` varchar(255) collate utf8_unicode_ci default NULL,
  `long_hash` varchar(255) collate utf8_unicode_ci default NULL,
  `expire_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `login_hashes`
--

LOCK TABLES `login_hashes` WRITE;
/*!40000 ALTER TABLE `login_hashes` DISABLE KEYS */;
/*!40000 ALTER TABLE `login_hashes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailings`
--

DROP TABLE IF EXISTS `mailings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mailings` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `from` varchar(255) collate utf8_unicode_ci default NULL,
  `html_body` text collate utf8_unicode_ci,
  `plain_body` text collate utf8_unicode_ci,
  `subject` varchar(255) collate utf8_unicode_ci default NULL,
  `attachable_id` int(11) default NULL,
  `attachable_type` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mailings`
--

LOCK TABLES `mailings` WRITE;
/*!40000 ALTER TABLE `mailings` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mails`
--

DROP TABLE IF EXISTS `mails`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mails` (
  `id` int(11) NOT NULL auto_increment,
  `mailing_id` int(11) default NULL,
  `recipient_id` int(11) default NULL,
  `subject` varchar(255) collate utf8_unicode_ci default NULL,
  `from` varchar(255) collate utf8_unicode_ci default NULL,
  `plain_body` text collate utf8_unicode_ci,
  `html_body` text collate utf8_unicode_ci,
  `status` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mails`
--

LOCK TABLES `mails` WRITE;
/*!40000 ALTER TABLE `mails` DISABLE KEYS */;
/*!40000 ALTER TABLE `mails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `members` (
  `id` int(11) NOT NULL auto_increment,
  `email` varchar(255) collate utf8_unicode_ci NOT NULL default '',
  `username` varchar(255) collate utf8_unicode_ci default '',
  `password` varchar(25) collate utf8_unicode_ci NOT NULL default '',
  `forename` varchar(25) collate utf8_unicode_ci NOT NULL default '',
  `surname` varchar(25) collate utf8_unicode_ci NOT NULL default '',
  `is_admin` tinyint(1) NOT NULL default '0',
  `company` varchar(255) collate utf8_unicode_ci default '',
  `bio` text collate utf8_unicode_ci,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `image_uid` varchar(255) collate utf8_unicode_ci default NULL,
  `delta` tinyint(1) default '1',
  `password_generated` tinyint(1) default '0',
  `ip_address` varchar(255) collate utf8_unicode_ci default NULL,
  `fb_user_id` int(11) default NULL,
  `twitter_id` int(11) default NULL,
  `points` int(11) default '0',
  `what_i_bring` varchar(255) collate utf8_unicode_ci default NULL,
  `linked_in_user_id` varchar(255) collate utf8_unicode_ci default NULL,
  `twitter_username` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'si@yoomee.com','si','olive123','Si','Wilkins',1,'',NULL,'2011-04-28 11:18:54','2011-05-24 10:53:05',NULL,0,0,'77.86.30.132',NULL,NULL,2,'',NULL,NULL),(2,'andy@yoomee.com','andy','olive123','Andy','Mayer',1,'Yoomee','I run a web development company called Yoomee - we specialise in building social websites and are passionate about making the world a better place by connecting people together online. ','2011-04-28 06:18:54','2011-05-24 10:55:22','2011/05/05/06_35_05_970_IMG_0055.JPG',0,0,'77.86.30.132',747785309,14701791,42,'a passion for using using the web for good','xldlPUCLQB','andymayer'),(3,'nicola@yoomee.com','nicola','olive123','Nicola','Mayer',1,'',NULL,'2011-04-28 11:18:54','2011-05-24 10:53:06',NULL,0,0,'78.105.160.174',NULL,NULL,2,'stuff',NULL,NULL),(4,'rich@yoomee.com','rich','olive123','Rich','Wells',1,'',NULL,'2011-04-28 10:18:54','2011-05-24 10:53:06','2011/05/20/10_04_12_815_lomo_0.06.53.09_.jpg',0,0,'77.86.30.132',NULL,NULL,2,'badass drawing skills, and a passion for creating wonderful user experiences. ',NULL,NULL),(5,'ian@yoomee.com','ian','olive123','Ian','Mooney',1,'',NULL,'2011-04-28 10:18:54','2011-05-24 10:53:06',NULL,0,0,'77.86.30.132',61102010,19117562,2,'web development skills. I work for a company called Yoomee and helped make this site awesome!','5OLA9xcrVI','ianmooney'),(6,'rob@yoomee.com','rob','olive123','Rob','Parvin',1,'',NULL,'2011-04-28 11:18:54','2011-05-24 10:53:06',NULL,0,0,NULL,NULL,NULL,2,NULL,NULL,NULL),(7,'matt@yoomee.com','matt','olive123','Matt','Atkins',1,'','Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at.','2011-04-28 11:18:54','2011-05-24 10:53:06','2011/05/17/05_13_02_809_matt.jpg',0,0,'77.86.30.132',NULL,NULL,2,'developer skillz',NULL,NULL),(9,'teammember1@yoomee.com','','password','Marleen','Stikker',0,'PICNIC','I\'m the co-founder of PICNIC.','2011-05-05 09:11:46','2011-05-24 10:53:06','2011/05/05/03_10_27_315_screen_capture_37.png',0,0,NULL,NULL,NULL,2,'you exciting technology applications and a sixth sense for what’s next.',NULL,NULL),(10,'teammember2@yoomee.com','','password','Bas','Vehart',0,'PICNIC','I\'m a co-founder of PICNIC as well as co-founder & CEO of Media Republic, a leading digital media and entertainment company based in Amsterdam.\n\nI\'m a passionate entrepreneur and always on the lookout for the next big idea. I\'m currently a board member at Trendwatching.com and Eccky.com, and am busy with a new project seeking innovation in education.\n\n','2011-05-05 09:11:46','2011-05-24 10:53:06','2011/05/05/03_21_07_218_screen_capture_38.png',0,0,NULL,NULL,NULL,2,'the spirit of entrepreneurship and killer guitar riffs.',NULL,NULL),(11,'kitty@picnicnetwork.org','','kitty','Kitty','Leering',1,'PICNIC','I\'m the Program Director of PICNIC.\r\n','2011-05-05 09:11:46','2011-05-24 10:53:06','2011/05/05/03_22_30_980_kitty.jpg',0,0,NULL,NULL,NULL,2,'this year’s program and my champagne connoisseurship.',NULL,NULL),(12,'teammember4@yoomee.com','','password','Annemarie','van Asselen',0,'PICNIC','I\'m the Director of Sponsoring & Partnerships at PICNIC.\n','2011-05-05 09:11:47','2011-05-24 10:53:06','2011/05/05/03_31_50_860_screen_capture_40.png',0,0,NULL,NULL,NULL,2,'you a passion for building relationships and capturing memories on film.',NULL,NULL),(13,'marcel@kampman.nl','','password','Marcel','Kampman',1,'PICNIC','I\'m the Creative Director of PICNIC.\n','2011-05-05 09:11:47','2011-05-24 10:53:06','2011/05/05/03_30_25_824_screen_capture_39.png',0,0,'77.86.30.132',NULL,NULL,2,'a superior creative eye and a collection of inspiring quotes.',NULL,NULL),(14,'teammember6@yoomee.com','','password','Alrik','Koudenburg',0,'','I\'m the Spatial Director at PICNIC.','2011-05-05 09:11:47','2011-05-24 10:53:06','2011/05/18/08_45_11_858_screen_capture_9.png',0,0,NULL,NULL,NULL,2,'you supreme spacial perception and my collection of pristine comic books.',NULL,NULL),(15,'advisor1@yoomee.com','','hamper123','Adam','Greenfield',0,'','I am founder and managing director of urban systems design practice Urbanscale LLC.\r\n\r\nI have a number of books to my name \'Everyware: The dawning age of ubiquitous computing\' (2006), the forthcoming \'The City Is Here For You To Use\' and, with Mark Shepard, I co-authored the inaugural Situated Technologies pamphlet \'Urban Computing and its Discontents\' (2007). I was previously Nokia\'s head of design direction for service and user interface. I live and work in New York City with my wife, artist Nurri Kim.','2011-05-05 09:14:54','2011-05-24 10:53:06','2011/05/24/03_01_53_244_screen_capture_1.png',0,0,NULL,NULL,NULL,2,'advice and lots of it',NULL,NULL),(16,'advisor2@yoomee.com','','hamper123','Zuha','van ‘t Zelfde',0,'Viral Radio','I am a researcher, developer and radical user in the converging domains of contemporary art, experimental music, network technology, heritage and urbanism. With Michiel van Iersel I co-founded Non-fiction, an innovation agency reconfiguring popular engagement with public institutions for the 21st century. Non-fiction, based in Amsterdam, works with public institutions, architects designers and artists, and explores the emerging patterns of engagement, collaboration, and creation in the arts and public domain.\r\n\r\nWith Ben Cerveny and James Burke I co-founded VURB, a European framework for policy and design research concerning urban computational systems. The VURB foundation, based in Amsterdam, provides direction and resources to a portfolio of projects investigating how our cultures might come to use networked digital resources to change the way we understand, build, and inhabit cities.\r\n\r\nI also founded Viral Radio, a vehicle for the dissemination of electronic music. Viral Radio sets up site-specific performances for festivals and music venues in Europe, displaying new developments in computer improvisation and hyperrhythmic dance music. It has worked with a wide range of artists, from Fennesz, Stephen O’Malley and Alog, to Kode9, Icarus and Dimlite. As a DJ I perform across Europe on festivals and club nights of innovative electronic dance music.','2011-05-05 09:14:54','2011-05-24 10:53:06','2011/05/24/03_13_31_380_screen_capture_2.png',0,0,NULL,NULL,NULL,2,'innovation by the bucket load',NULL,NULL),(17,'advisor3@yoomee.com','','password','Advisor','3',0,'',NULL,'2011-05-05 09:14:54','2011-05-24 10:53:06',NULL,0,0,NULL,NULL,NULL,2,'advice',NULL,NULL),(18,'advisor4@yoomee.com','','password','Advisor','4',0,'',NULL,'2011-05-05 09:14:54','2011-05-24 10:53:06',NULL,0,0,NULL,NULL,NULL,2,'advice',NULL,NULL),(19,'advisor5@yoomee.com','','password','Advisor','5',0,'',NULL,'2011-05-05 09:14:54','2011-05-24 10:53:06',NULL,0,0,NULL,NULL,NULL,2,'advice',NULL,NULL),(20,'advisor6@yoomee.com','','password','Advisor','6',0,'',NULL,'2011-05-05 09:14:54','2011-05-24 10:53:06',NULL,0,0,NULL,NULL,NULL,2,'advice',NULL,NULL),(21,'correspondent1@yoomee.com','','password','Correspondent','1',0,'',NULL,'2011-05-05 09:18:19','2011-05-24 10:53:06',NULL,0,0,NULL,NULL,NULL,2,'correspondence',NULL,NULL),(22,'correspondent2@yoomee.com','','password','Correspondent','2',0,'',NULL,'2011-05-05 09:18:19','2011-05-24 10:53:07',NULL,0,0,NULL,NULL,NULL,2,'correspondence',NULL,NULL),(23,'correspondent3@yoomee.com','','password','Correspondent','3',0,'',NULL,'2011-05-05 09:18:19','2011-05-24 10:53:07',NULL,0,0,NULL,NULL,NULL,2,'correspondence',NULL,NULL),(24,'correspondent4@yoomee.com','','password','Correspondent','4',0,'',NULL,'2011-05-05 09:18:20','2011-05-24 10:53:07',NULL,0,0,NULL,NULL,NULL,2,'correspondence',NULL,NULL),(25,'correspondent5@yoomee.com','','password','Correspondent','5',0,'',NULL,'2011-05-05 09:18:20','2011-05-24 10:53:07',NULL,0,0,NULL,NULL,NULL,2,'correspondence',NULL,NULL),(26,'correspondent6@yoomee.com','','password','Correspondent','6',0,'',NULL,'2011-05-05 09:18:20','2011-05-24 10:53:07',NULL,0,0,NULL,NULL,NULL,2,'correspondence',NULL,NULL),(27,'speaker1@yoomee.com','','password','Speaker','1',0,'',NULL,'2011-05-05 12:32:54','2011-05-24 10:53:07',NULL,0,0,NULL,NULL,NULL,2,'ideas',NULL,NULL),(28,'speaker2@yoomee.com','','password','Speaker','2',0,'',NULL,'2011-05-05 12:32:54','2011-05-24 10:53:07',NULL,0,0,NULL,NULL,NULL,2,'ideas',NULL,NULL),(29,'speaker3@yoomee.com','','password','Speaker','3',0,'',NULL,'2011-05-05 12:32:54','2011-05-24 10:53:07',NULL,0,0,NULL,NULL,NULL,2,'ideas',NULL,NULL),(30,'speaker4@yoomee.com','','password','Speaker','4',0,'',NULL,'2011-05-05 12:32:54','2011-05-24 10:53:07',NULL,0,0,NULL,NULL,NULL,2,'ideas',NULL,NULL),(31,'speaker5@yoomee.com','','password','Speaker','5',0,'',NULL,'2011-05-05 12:32:55','2011-05-24 10:53:07',NULL,0,0,NULL,NULL,NULL,2,'ideas',NULL,NULL),(32,'speaker6@yoomee.com','','password','Speaker','6',0,'',NULL,'2011-05-05 12:32:55','2011-05-24 10:53:07',NULL,0,0,NULL,NULL,NULL,2,'ideas',NULL,NULL),(33,'todd@picnicnetwork.org','todd','hamper123','Todd','Savage',1,'Marketing Manager','I\'m the Marketing Manager at PICNIC.','2011-05-11 09:30:16','2011-05-24 10:53:08','2011/05/18/08_55_13_234_screen_capture_11.png',0,0,'62.195.16.40',NULL,NULL,12,'a nice cold bottle of ginger beer.',NULL,NULL),(34,'janwillem@picnicnetwork.org','jan','rootlemon39','Jan-Willem','Blom',1,'','I am the Office Manager at PICNIC.','2011-05-16 16:17:56','2011-05-24 10:53:08','2011/05/18/08_57_28_718_screen_capture_12.png',0,0,'95.97.39.198',NULL,NULL,2,'you the ability to keep the HQ under control and hardcore DJ skills.',NULL,NULL),(35,'mirjam@picnicnetwork.org','','picnic123','Mirjam','Flik',0,'PICNIC','I am Director of Operations at PICNIC.','2011-05-18 15:19:56','2011-05-24 10:53:08','2011/05/18/09_11_42_120_screen_capture_13.png',0,0,NULL,NULL,NULL,2,'you a large heart-shaped red balloon.',NULL,NULL),(36,'liz@picnicnetwork.org','','picnic123','Liz','Keel',0,'PICNIC','I am Communications & PR Manager at PICNIC.','2011-05-18 15:22:28','2011-05-24 10:53:08','2011/05/18/09_13_13_760_screen_capture_14.png',0,0,NULL,NULL,NULL,2,'you stories worth (re-)telling and an invitation to dinner.',NULL,NULL),(37,'rene@picnicnetwork.org','','picnic123','René','van Schendel',0,'PICNIC','I am the Finance Director at PICNIC.','2011-05-18 15:25:30','2011-05-24 10:53:08',NULL,0,0,NULL,NULL,NULL,2,'you a complete budget overview and an assortment of bubbly Belgian beverages.',NULL,NULL),(39,'atkins.matthew@gmail.com','matkins','junepush85','Matt','Atkins',0,'','Ruby on Rails developer for @yoomeehq','2011-05-19 13:40:56','2011-05-24 10:53:08','2011/05/19/06_40_56_133_file',0,1,'94.194.113.34',NULL,18734348,2,'web development skills and bright ideas.',NULL,'matkins'),(40,'iamrichwells@gmail.com','','pushblue49','Richard','Wells',0,'',NULL,'2011-05-21 18:22:45','2011-05-24 10:53:08',NULL,0,1,'62.31.254.87',632136536,NULL,2,'badass drawing skills and a passion for creating engaging user experiences',NULL,NULL);
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members_news_feed_items`
--

DROP TABLE IF EXISTS `members_news_feed_items`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `members_news_feed_items` (
  `member_id` int(11) default NULL,
  `news_feed_item_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `members_news_feed_items`
--

LOCK TABLES `members_news_feed_items` WRITE;
/*!40000 ALTER TABLE `members_news_feed_items` DISABLE KEYS */;
INSERT INTO `members_news_feed_items` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(2,8),(9,11),(10,12),(11,13),(12,14),(13,15),(14,16),(15,17),(16,18),(17,19),(18,20),(19,21),(20,22),(21,23),(22,24),(23,25),(24,26),(25,27),(26,28),(27,29),(28,30),(29,31),(30,32),(31,33),(32,34),(2,41),(33,42),(2,43),(34,44),(35,48),(36,49),(37,50),(2,53),(2,54),(2,55),(39,56),(34,58),(11,59),(11,60),(11,61),(2,62),(2,63),(4,64),(40,65),(40,66),(40,67),(7,68),(9,70),(10,71),(12,72),(14,73),(15,74),(16,75),(17,76),(18,77),(19,78),(20,79),(21,80),(22,81),(23,82),(24,83),(25,84),(26,85),(27,86),(28,87),(29,88),(30,89),(31,90),(32,91),(35,92),(36,93),(37,94),(39,96),(40,97),(2,103),(5,104),(2,105),(5,106),(2,107),(5,108),(5,109),(5,110),(2,111),(2,112),(2,113),(2,114),(15,115),(15,116),(15,117),(15,118),(15,119),(16,120),(16,121),(16,122),(9,123),(10,124),(12,125),(14,126),(15,127),(16,128),(17,129),(18,130),(19,131),(20,132),(21,133),(22,134),(23,135),(24,136),(25,137),(26,138),(27,139),(28,140),(29,141),(30,142),(31,143),(32,144),(35,145),(36,146),(37,147),(39,148),(40,149),(1,150),(2,151),(3,152),(4,153),(5,154),(6,155),(7,156),(9,157),(10,158),(11,159),(12,160),(13,161),(14,162),(15,163),(16,164),(17,165),(18,166),(19,167),(20,168),(21,169),(22,170),(23,171),(24,172),(25,173),(26,174),(27,175),(28,176),(29,177),(30,178),(31,179),(32,180),(33,181),(34,182),(35,183),(36,184),(37,185),(39,186),(40,187),(33,188),(2,189),(33,190),(2,191),(2,192),(2,193),(2,194),(2,195);
/*!40000 ALTER TABLE `members_news_feed_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message_recipients`
--

DROP TABLE IF EXISTS `message_recipients`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `message_recipients` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `message_id` int(11) default NULL,
  `read` tinyint(1) default '0',
  `deleted` tinyint(1) default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `index_message_recipients_on_member_id_and_message_id` (`member_id`,`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `message_recipients`
--

LOCK TABLES `message_recipients` WRITE;
/*!40000 ALTER TABLE `message_recipients` DISABLE KEYS */;
INSERT INTO `message_recipients` VALUES (1,40,1,0,0,'2011-05-23 16:33:00','2011-05-23 16:33:00');
/*!40000 ALTER TABLE `message_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `subject` varchar(255) default NULL,
  `text` text,
  `parent_id` int(11) default NULL,
  `deleted` tinyint(1) default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,2,'There are two of you!','Which is the real you??',1,0,'2011-05-23 16:33:00','2011-05-23 16:33:02');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news_feed_items`
--

DROP TABLE IF EXISTS `news_feed_items`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `news_feed_items` (
  `id` int(11) NOT NULL auto_increment,
  `attachable_id` int(11) default NULL,
  `attachable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `attribute_changes` varchar(255) collate utf8_unicode_ci default NULL,
  `updated` tinyint(1) default '0',
  `weighting` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_news_feed_items_on_attachable_id` (`attachable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `news_feed_items`
--

LOCK TABLES `news_feed_items` WRITE;
/*!40000 ALTER TABLE `news_feed_items` DISABLE KEYS */;
INSERT INTO `news_feed_items` VALUES (1,1,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(2,2,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(3,3,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(4,4,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(5,5,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(6,6,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(7,7,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(8,2,'Photo',NULL,0,1,'2011-05-03 14:25:04','2011-05-03 14:25:04'),(11,9,'Member',NULL,0,1,'2011-05-05 09:11:46','2011-05-05 09:11:46'),(12,10,'Member',NULL,0,1,'2011-05-05 09:11:46','2011-05-05 09:11:46'),(13,11,'Member',NULL,0,1,'2011-05-05 09:11:46','2011-05-05 09:11:46'),(14,12,'Member',NULL,0,1,'2011-05-05 09:11:47','2011-05-05 09:11:47'),(15,13,'Member',NULL,0,1,'2011-05-05 09:11:47','2011-05-05 09:11:47'),(16,14,'Member',NULL,0,1,'2011-05-05 09:11:47','2011-05-05 09:11:47'),(17,15,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(18,16,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(19,17,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(20,18,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(21,19,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(22,20,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(23,21,'Member',NULL,0,1,'2011-05-05 09:18:19','2011-05-05 09:18:19'),(24,22,'Member',NULL,0,1,'2011-05-05 09:18:19','2011-05-05 09:18:19'),(25,23,'Member',NULL,0,1,'2011-05-05 09:18:19','2011-05-05 09:18:19'),(26,24,'Member',NULL,0,1,'2011-05-05 09:18:20','2011-05-05 09:18:20'),(27,25,'Member',NULL,0,1,'2011-05-05 09:18:20','2011-05-05 09:18:20'),(28,26,'Member',NULL,0,1,'2011-05-05 09:18:20','2011-05-05 09:18:20'),(29,27,'Member',NULL,0,1,'2011-05-05 12:32:54','2011-05-05 12:32:54'),(30,28,'Member',NULL,0,1,'2011-05-05 12:32:54','2011-05-05 12:32:54'),(31,29,'Member',NULL,0,1,'2011-05-05 12:32:54','2011-05-05 12:32:54'),(32,30,'Member',NULL,0,1,'2011-05-05 12:32:54','2011-05-05 12:32:54'),(33,31,'Member',NULL,0,1,'2011-05-05 12:32:55','2011-05-05 12:32:55'),(34,32,'Member',NULL,0,1,'2011-05-05 12:32:55','2011-05-05 12:32:55'),(41,9,'Photo',NULL,0,1,'2011-05-11 08:21:20','2011-05-11 08:21:20'),(42,33,'Member',NULL,0,1,'2011-05-11 09:30:16','2011-05-11 09:30:16'),(43,11,'Photo',NULL,0,1,'2011-05-11 10:44:11','2011-05-11 10:44:11'),(44,34,'Member',NULL,0,1,'2011-05-16 16:17:56','2011-05-16 16:17:56'),(48,35,'Member',NULL,0,1,'2011-05-18 15:19:56','2011-05-18 15:19:56'),(49,36,'Member',NULL,0,1,'2011-05-18 15:22:29','2011-05-18 15:22:29'),(50,37,'Member',NULL,0,1,'2011-05-18 15:25:30','2011-05-18 15:25:30'),(53,8,'Shout',NULL,0,1,'2011-05-18 16:52:40','2011-05-18 16:52:40'),(54,9,'Shout',NULL,0,1,'2011-05-18 16:54:00','2011-05-18 16:54:00'),(55,10,'Shout',NULL,0,1,'2011-05-18 16:54:56','2011-05-18 16:54:56'),(56,39,'Member',NULL,0,1,'2011-05-19 13:40:56','2011-05-19 13:40:56'),(58,34,'Member','ip_address',1,1,'2011-05-20 09:41:25','2011-05-20 09:41:25'),(59,11,'Member','bio, password, email',1,1,'2011-05-20 10:22:19','2011-05-20 10:22:19'),(60,11,'Member','what_i_bring',1,1,'2011-05-20 10:22:29','2011-05-20 10:22:29'),(61,11,'Member','is_admin',1,1,'2011-05-20 10:31:38','2011-05-20 10:31:38'),(62,2,'Member','what_i_bring',1,1,'2011-05-20 10:45:21','2011-05-20 10:45:21'),(63,2,'Member','what_i_bring',1,1,'2011-05-20 10:45:25','2011-05-20 10:45:25'),(64,4,'Member','image_uid',1,1,'2011-05-20 17:04:12','2011-05-20 17:04:12'),(65,40,'Member',NULL,0,1,'2011-05-21 18:22:45','2011-05-21 18:22:45'),(66,40,'Member','ip_address',1,1,'2011-05-21 18:22:45','2011-05-21 18:22:45'),(67,40,'Member','what_i_bring',1,1,'2011-05-21 18:23:21','2011-05-21 18:23:21'),(68,7,'Member','ip_address',1,1,'2011-05-23 08:56:34','2011-05-23 08:56:34'),(70,9,'Member','points',1,1,'2011-05-23 14:39:19','2011-05-23 14:39:19'),(71,10,'Member','points',1,1,'2011-05-23 14:39:19','2011-05-23 14:39:19'),(72,12,'Member','points',1,1,'2011-05-23 14:39:19','2011-05-23 14:39:19'),(73,14,'Member','points',1,1,'2011-05-23 14:39:20','2011-05-23 14:39:20'),(74,15,'Member','points',1,1,'2011-05-23 14:39:20','2011-05-23 14:39:20'),(75,16,'Member','points',1,1,'2011-05-23 14:39:20','2011-05-23 14:39:20'),(76,17,'Member','points',1,1,'2011-05-23 14:39:20','2011-05-23 14:39:20'),(77,18,'Member','points',1,1,'2011-05-23 14:39:20','2011-05-23 14:39:20'),(78,19,'Member','points',1,1,'2011-05-23 14:39:20','2011-05-23 14:39:20'),(79,20,'Member','points',1,1,'2011-05-23 14:39:20','2011-05-23 14:39:20'),(80,21,'Member','points',1,1,'2011-05-23 14:39:20','2011-05-23 14:39:20'),(81,22,'Member','points',1,1,'2011-05-23 14:39:20','2011-05-23 14:39:20'),(82,23,'Member','points',1,1,'2011-05-23 14:39:20','2011-05-23 14:39:20'),(83,24,'Member','points',1,1,'2011-05-23 14:39:20','2011-05-23 14:39:20'),(84,25,'Member','points',1,1,'2011-05-23 14:39:21','2011-05-23 14:39:21'),(85,26,'Member','points',1,1,'2011-05-23 14:39:21','2011-05-23 14:39:21'),(86,27,'Member','points',1,1,'2011-05-23 14:39:21','2011-05-23 14:39:21'),(87,28,'Member','points',1,1,'2011-05-23 14:39:21','2011-05-23 14:39:21'),(88,29,'Member','points',1,1,'2011-05-23 14:39:21','2011-05-23 14:39:21'),(89,30,'Member','points',1,1,'2011-05-23 14:39:21','2011-05-23 14:39:21'),(90,31,'Member','points',1,1,'2011-05-23 14:39:21','2011-05-23 14:39:21'),(91,32,'Member','points',1,1,'2011-05-23 14:39:21','2011-05-23 14:39:21'),(92,35,'Member','points',1,1,'2011-05-23 14:39:21','2011-05-23 14:39:21'),(93,36,'Member','points',1,1,'2011-05-23 14:39:21','2011-05-23 14:39:21'),(94,37,'Member','points',1,1,'2011-05-23 14:39:21','2011-05-23 14:39:21'),(96,39,'Member','points',1,1,'2011-05-23 14:39:22','2011-05-23 14:39:22'),(97,40,'Member','points',1,1,'2011-05-23 14:39:22','2011-05-23 14:39:22'),(103,2,'Member','what_i_bring',1,1,'2011-05-23 16:34:11','2011-05-23 16:34:11'),(104,5,'Member','what_i_bring',1,1,'2011-05-23 16:38:49','2011-05-23 16:38:49'),(105,2,'Member','linked_in_user_id',1,1,'2011-05-23 16:39:08','2011-05-23 16:39:08'),(106,5,'Member','fb_user_id',1,1,'2011-05-23 16:39:08','2011-05-23 16:39:08'),(107,2,'Member','twitter_username, twitter_id',1,1,'2011-05-23 16:39:20','2011-05-23 16:39:20'),(108,5,'Member','created_at, updated_at',1,1,'2011-05-23 16:41:11','2011-05-23 16:41:11'),(109,5,'Member','twitter_username, twitter_id',1,1,'2011-05-23 16:46:01','2011-05-23 16:46:01'),(110,5,'Member','linked_in_user_id',1,1,'2011-05-23 16:46:41','2011-05-23 16:46:41'),(111,2,'Member','ip_address',1,1,'2011-05-23 20:22:48','2011-05-23 20:22:48'),(112,2,'Member','created_at',1,1,'2011-05-23 20:23:14','2011-05-23 20:23:14'),(113,2,'Member','ip_address',1,1,'2011-05-24 08:17:19','2011-05-24 08:17:19'),(114,2,'Member','created_at',1,1,'2011-05-24 08:18:42','2011-05-24 08:18:42'),(115,15,'Member','bio, password, surname, forename',1,1,'2011-05-24 09:52:32','2011-05-24 09:52:32'),(116,15,'Member','what_i_bring',1,1,'2011-05-24 09:58:21','2011-05-24 09:58:21'),(117,15,'Member','image_uid',1,1,'2011-05-24 10:01:48','2011-05-24 10:01:48'),(118,15,'Member','image_uid',1,1,'2011-05-24 10:01:49','2011-05-24 10:01:49'),(119,15,'Member','image_uid',1,1,'2011-05-24 10:01:53','2011-05-24 10:01:53'),(120,16,'Member','company, what_i_bring, bio, password, surname, forename',1,1,'2011-05-24 10:09:26','2011-05-24 10:09:26'),(121,16,'Member','what_i_bring',1,1,'2011-05-24 10:09:51','2011-05-24 10:09:51'),(122,16,'Member','image_uid',1,1,'2011-05-24 10:13:31','2011-05-24 10:13:31'),(123,9,'Member','points',1,1,'2011-05-24 10:51:57','2011-05-24 10:51:57'),(124,10,'Member','points',1,1,'2011-05-24 10:51:57','2011-05-24 10:51:57'),(125,12,'Member','points',1,1,'2011-05-24 10:51:57','2011-05-24 10:51:57'),(126,14,'Member','points',1,1,'2011-05-24 10:51:57','2011-05-24 10:51:57'),(127,15,'Member','points',1,1,'2011-05-24 10:51:57','2011-05-24 10:51:57'),(128,16,'Member','points',1,1,'2011-05-24 10:51:57','2011-05-24 10:51:57'),(129,17,'Member','points',1,1,'2011-05-24 10:51:57','2011-05-24 10:51:57'),(130,18,'Member','points',1,1,'2011-05-24 10:51:57','2011-05-24 10:51:57'),(131,19,'Member','points',1,1,'2011-05-24 10:52:02','2011-05-24 10:52:02'),(132,20,'Member','points',1,1,'2011-05-24 10:52:02','2011-05-24 10:52:02'),(133,21,'Member','points',1,1,'2011-05-24 10:52:02','2011-05-24 10:52:02'),(134,22,'Member','points',1,1,'2011-05-24 10:52:02','2011-05-24 10:52:02'),(135,23,'Member','points',1,1,'2011-05-24 10:52:02','2011-05-24 10:52:02'),(136,24,'Member','points',1,1,'2011-05-24 10:52:02','2011-05-24 10:52:02'),(137,25,'Member','points',1,1,'2011-05-24 10:52:02','2011-05-24 10:52:02'),(138,26,'Member','points',1,1,'2011-05-24 10:52:02','2011-05-24 10:52:02'),(139,27,'Member','points',1,1,'2011-05-24 10:52:02','2011-05-24 10:52:02'),(140,28,'Member','points',1,1,'2011-05-24 10:52:02','2011-05-24 10:52:02'),(141,29,'Member','points',1,1,'2011-05-24 10:52:02','2011-05-24 10:52:02'),(142,30,'Member','points',1,1,'2011-05-24 10:52:02','2011-05-24 10:52:02'),(143,31,'Member','points',1,1,'2011-05-24 10:52:03','2011-05-24 10:52:03'),(144,32,'Member','points',1,1,'2011-05-24 10:52:03','2011-05-24 10:52:03'),(145,35,'Member','points',1,1,'2011-05-24 10:52:03','2011-05-24 10:52:03'),(146,36,'Member','points',1,1,'2011-05-24 10:52:03','2011-05-24 10:52:03'),(147,37,'Member','points',1,1,'2011-05-24 10:52:03','2011-05-24 10:52:03'),(148,39,'Member','points',1,1,'2011-05-24 10:52:03','2011-05-24 10:52:03'),(149,40,'Member','points',1,1,'2011-05-24 10:52:03','2011-05-24 10:52:03'),(150,1,'Member','points',1,1,'2011-05-24 10:53:05','2011-05-24 10:53:05'),(151,2,'Member','points',1,1,'2011-05-24 10:53:05','2011-05-24 10:53:05'),(152,3,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(153,4,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(154,5,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(155,6,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(156,7,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(157,9,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(158,10,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(159,11,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(160,12,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(161,13,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(162,14,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(163,15,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(164,16,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(165,17,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(166,18,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(167,19,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(168,20,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(169,21,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(170,22,'Member','points',1,1,'2011-05-24 10:53:07','2011-05-24 10:53:07'),(171,23,'Member','points',1,1,'2011-05-24 10:53:07','2011-05-24 10:53:07'),(172,24,'Member','points',1,1,'2011-05-24 10:53:07','2011-05-24 10:53:07'),(173,25,'Member','points',1,1,'2011-05-24 10:53:07','2011-05-24 10:53:07'),(174,26,'Member','points',1,1,'2011-05-24 10:53:07','2011-05-24 10:53:07'),(175,27,'Member','points',1,1,'2011-05-24 10:53:07','2011-05-24 10:53:07'),(176,28,'Member','points',1,1,'2011-05-24 10:53:07','2011-05-24 10:53:07'),(177,29,'Member','points',1,1,'2011-05-24 10:53:07','2011-05-24 10:53:07'),(178,30,'Member','points',1,1,'2011-05-24 10:53:07','2011-05-24 10:53:07'),(179,31,'Member','points',1,1,'2011-05-24 10:53:07','2011-05-24 10:53:07'),(180,32,'Member','points',1,1,'2011-05-24 10:53:07','2011-05-24 10:53:07'),(181,33,'Member','points',1,1,'2011-05-24 10:53:07','2011-05-24 10:53:07'),(182,34,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(183,35,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(184,36,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(185,37,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(186,39,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(187,40,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(188,33,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(189,2,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(190,33,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(191,2,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(192,2,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(193,2,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(194,2,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(195,2,'Member','created_at, updated_at',1,1,'2011-05-24 10:55:22','2011-05-24 10:55:22');
/*!40000 ALTER TABLE `news_feed_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `attachable_id` int(11) default NULL,
  `attachable_type` varchar(255) default NULL,
  `text` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `read` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,2,8,'Shout',NULL,'2011-05-20 08:35:45','2011-05-20 08:36:39',1),(2,33,8,'Shout',NULL,'2011-05-20 08:37:37','2011-05-20 09:30:59',1),(3,2,8,'Shout',NULL,'2011-05-20 08:39:24','2011-05-20 09:42:22',1),(5,38,2,'FriendRequest',NULL,'2011-05-23 08:56:57','2011-05-23 08:56:57',0),(6,4,3,'FriendRequest',NULL,'2011-05-23 08:58:27','2011-05-23 08:58:27',0),(7,7,NULL,NULL,'<a href=\'/members/2\'>Andy Mayer</a> has accepted your friend request.','2011-05-23 08:58:37','2011-05-23 08:58:37',0);
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications_wall_posts`
--

DROP TABLE IF EXISTS `notifications_wall_posts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `notifications_wall_posts` (
  `notification_id` int(11) default NULL,
  `wall_post_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `notifications_wall_posts`
--

LOCK TABLES `notifications_wall_posts` WRITE;
/*!40000 ALTER TABLE `notifications_wall_posts` DISABLE KEYS */;
INSERT INTO `notifications_wall_posts` VALUES (1,3),(2,4),(3,5),(2,6);
/*!40000 ALTER TABLE `notifications_wall_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL auto_increment,
  `section_id` int(11) default NULL,
  `title` varchar(255) collate utf8_unicode_ci default NULL,
  `intro` text collate utf8_unicode_ci,
  `text` text collate utf8_unicode_ci,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `expires_on` datetime default '2035-01-01 00:00:00',
  `publish_on` datetime default NULL,
  `delta` tinyint(1) default '1',
  `photo_id` int(11) default NULL,
  `weight` int(11) default '0',
  `small_title` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (2,1,'What is PICNIC?','','<h5 class=\"article_intro\">\r\n	The PICNIC name represents everything we strive to be. It is a gathering of friends old and new, where everyone brings something to the table.</h5>\r\n<p>\r\n	People from diverse backgrounds come to exchange ideas and insight in an informal, social atmosphere. It&rsquo;s a chance to try new things and expose yourself to ideas outside your area of expertise. Share, discuss, collaborate and leave with a new perspective on what is possible.</p>\r\n<p>\r\n	PICNIC is about innovative ideas for business and society. It is an annual three-day festival that blurs the lines between creativity, science, technology and business to explore new solutions in the spirit of co-creation. Curious minds eager to exchange their knowledge, ideas and skills gather at PICNIC, making it the place to create the future &ndash; together.</p>\r\n','2011-04-28 11:45:38','2011-05-20 14:41:55','2035-01-01 00:00:00','2011-04-28 11:45:00',0,6,2,''),(3,4,'Festival experience',NULL,'<h5 class=\"article_intro\">\r\n	PICNIC is so much more than your average conference, it&#39;s a festival! What sets PICNIC apart from the rest? Keep reading to find out more.</h5>\r\n<p>\r\n	<strong>Three full days of information</strong>, collaboration and entertainment. A chance for prolonged conversations and development of relationships.</p>\r\n<p>\r\n	<strong>Interdisciplinary themes</strong> attract the widest possible audience. Every year, our key themes evolve to reflect changes in our society and economy. Cutting-edge content with far-reaching applications.</p>\r\n<p>\r\n	<strong>Get inspired.</strong> Sit back, relax and catch up on the latest ideas from global thought leaders.</p>\r\n<p>\r\n	<strong>Make and create</strong>. PICNIC is not for observers, it&rsquo;s for participants. Lectures are only a small part of the PICNIC experience. Competitions, challenges, social games, matchmaking, labs and workshops encourage everyone to get involved and get their hands dirty.</p>\r\n<p>\r\n	<strong>Play.</strong> Interactive exhibitions, games, networking sessions and unexpected surprises make for a fun and laid-back experience.</p>\r\n<p>\r\n	<strong>Interaction across boundaries.</strong> Speakers guide students. Designers meet business developers. Hackers collaborate with artists. The combinations are endless.</p>\r\n<p>\r\n	<strong>Casual, social atmosphere</strong> wrapped in a festival environment.</p>\r\n<p>\r\n	<strong>Escape to another world.</strong> The entire event ground is transformed by the PICNIC look and feel.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Take a look at the video below to get a brief impression of what you can experience at PICNIC. For a more in-depth idea of some of the topics we cover at the yearly PICNIC festival, be sure to view our archive of PICNIC lectures on Vimeo.</p>\r\n<p>\r\n	http://www.youtube.com/watch?v=w_DmwaVNAJ8&nbsp;</p>\r\n','2011-04-28 11:46:13','2011-05-16 11:49:29','2035-01-01 00:00:00','2011-04-28 11:46:00',0,5,50,''),(4,1,'Team',NULL,'<p>\r\n	The PICNIC team, at your service.</p>\r\n','2011-04-28 11:46:43','2011-05-18 15:10:27','2035-01-01 00:00:00','2011-04-28 11:46:00',0,NULL,3,''),(5,4,'Get to know our advisors for PICNIC \'11',NULL,'<p>\r\n	PICNIC&#39;s advisors are one of our most valuable resources! They share their dedication, time and expertise to help shape the content and experience that defines PICNIC.</p>\r\n','2011-04-28 11:49:24','2011-05-16 11:50:04','2035-01-01 00:00:00','2011-04-28 11:49:00',0,NULL,70,'Advisors'),(6,4,'Set sail with PICNIC','','<h5 class=\"article_intro\">\r\n	Take a quick ferry ride across the IJ River and join us for PICNIC Festival 2011 at the NDSM Wharf.</h5>\r\n<h5 class=\"article_intro\">\r\n	This former shipyard on the north side of Amsterdam is an emerging location for art, creativity and culture.</h5>\r\n<p>\r\n	NDSM is the largest artistic incubator in the Netherlands, with 130 artists working in 80 studios, surrounded by creative and media businesses, schools and residences. The NDSM Wharf Foundation has big ambitions: maintain and preserve the area&#39;s identity for its historic character, create an open area sustainability lab, and feature high-quality cultural programming. We are proud that PICNIC will contribute toward NDSM&#39;s ambitions.&nbsp;</p>\r\n','2011-04-28 11:50:07','2011-05-19 14:23:56','2035-01-01 00:00:00','2011-04-28 11:50:00',0,8,40,'New location'),(10,14,'How it began',NULL,'<p>\r\n	In 2006, Bas Verhart (founder of Media Republic) joined forces with Marleen Stikker (founder and CEO of Waag Society) to develop a new platform for creativity and innovation in Amsterdam. They wanted to bring together the world&rsquo;s top creative and business professionals to develop new partnerships and opportunities. Supported by their network of friends, collaborators and admirers, including former Amsterdam Mayor Job Cohen, PICNIC was born. The first edition of PICNIC was launched in September 2006</p>\r\n','2011-05-05 09:59:52','2011-05-19 14:17:47','2035-01-01 00:00:00','2011-05-05 09:59:00',0,2,6,'History'),(14,1,'Contact us',NULL,'<p>\r\n	Haarlemmerweg 321 B</p>\r\n<p>\r\n	1051 LG Amsterdam </p>\r\n<p>\r\n	The Netherlands</p>\r\n<p>\r\n	Tel: +31 20 320 5813 </p>\r\n<p>\r\n	Email: info(at)picnicnetwork.org</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Company Registration &amp; Tax information</p>\r\n<p>\r\n	Amsterdam Chamber of Commerce (KvK) Number: 34234137</p>\r\n<p>\r\n	VAT number: 8149.09.322</p>\r\n','2011-05-05 10:50:17','2011-05-18 21:55:16','2035-01-01 00:00:00','2011-05-05 10:49:00',0,2,999,'Contact'),(16,9,'PICNIC Logos in Low & High Res',NULL,'<p>\r\n	Download the PICNIC Logos by clicking <a href=\"/documents/1\" target=\"_blank\">here</a>.</p>\r\n','2011-05-05 10:52:38','2011-05-05 12:03:54','2035-01-01 00:00:00','2011-05-05 10:52:00',0,NULL,3,'Logos'),(18,10,'Amsterdam, 15 April 2011',NULL,'<h5 class=\"article_intro\">\r\n	PRESS RELEASE: For immediate release</h5>\r\n<p>\r\n	PICNIC &lsquo;11 on &lsquo;Urban Futures&rsquo;: Building the PICNIC CITY</p>\r\n<p>\r\n	PICNIC, Europe&rsquo;s leading event for the creative industries announced its program themes and a new venue for 2011 during a meet-up in the historic Waag building in Amsterdam.</p>\r\n<p>\r\n	Now in its sixth year, PICNIC reiterated its commitment to creativity and technology &ndash; in terms of content, involvement of the PICNIC community and its international reach. This event for professionals is internationally known for its innovative festival approach, combining cutting edge content with new, interactive program formats and a surprising and exciting visitors experience.</p>\r\n<p>\r\n	Waag Society director and PICNIC co-founder Marleen Stikker revealed the theme of PICNIC &rsquo;11: &ldquo;The PICNIC &rsquo;11 theme is &lsquo;Urban Futures&rsquo;. We will explore the impact of global urbanization on our cities, societies and our lives and the way creative and smart technologies can play a role. The challenges following from mega urban environments in areas like demographic shifts, (natural) resources, infrastructure, health and governance are getting more and more pressing. PICNIC brings creative thinkers, developers, designers and entrepreneurs together to collaborate on possible solutions.&rdquo;</p>\r\n<p>\r\n	&ldquo;What will make PICNIC &lsquo;11 really different compared to the preceding editions or any event out there is our theme as the starting point for everything&rdquo;, says Creative Director, Marcel Kampman. &ldquo;We are going to build an actual &ldquo;PICNIC City&rdquo; to prototype creative, urban applications and concepts and we will call upon the PICNIC community to help us build this temporary environment.&rdquo;</p>\r\n<p>\r\n	The &ldquo;PICNIC City&rdquo; will arise at a new location for PICNIC &rsquo;11: the NDSM Wharf on the North side of Amsterdam. PICNIC&rsquo;s Program Director, Kitty Leering commented on the move: &ldquo;We have had an amazing five years at the Westergasfabriek, (((I&rsquo;ve been there, and it&rsquo;s a remodeled fossil-fuel depot that is kinda the ne plus ultra of European &ldquo;stuffed animal&rdquo;))) but the time has come to challenge ourselves more, as well as offer our visitors a new experience. Moving our event to the NDSM Wharf gives us an excellent opportunity to take the look and feel of the festival to another level.&rdquo;</p>\r\n<p>\r\n	According to Rob Post, chairman of the city district Amsterdam-North, the festival and this part of Amsterdam have similar characteristics: &ldquo;PICNIC represents a strong pioneering spirit, innovation and creativity. That also holds true for Amsterdam North. We welcome PICNIC to the sunny side of the IJ&rdquo;</p>\r\n<p>\r\n	PICNIC &rsquo;11 will take place from 14 to 16 September 2011 at the NDSM Wharf in Amsterdam.</p>\r\n<p>\r\n	Download this press release as a PDF</p>\r\n<p>\r\n	###</p>\r\n<p>\r\n	Note to the editor</p>\r\n<p>\r\n	About PICNIC</p>\r\n<p>\r\n	PICNIC is about innovative ideas for business and society. It is an annual three-day festival that blurs the lines between creativity, science, technology and business to explore new solutions in the spirit of co-creation. Curious minds eager to exchange their knowledge, ideas and skills gather at PICNIC, making it the place to create the future &ndash; together.</p>\r\n<p>\r\n	PICNIC &lsquo;11 takes place at the NDSM Wharf in Amsterdam from 14 to 16 September 2011.</p>\r\n<p>\r\n	www.picnicnetwork.org</p>\r\n<p>\r\n	For more information, please contact:</p>\r\n<p>\r\n	Kitty Leering, Program Director</p>\r\n<p>\r\n	Tel: +31 (0)20 320 5813</p>\r\n<p>\r\n	kitty@picnicnetwork.org</p>\r\n<p>\r\n	PICNIC</p>\r\n<p>\r\n	Haarlemmerweg 321 B</p>\r\n<p>\r\n	1051 LG Amsterdam</p>\r\n<p>\r\n	www.picnicnetwork.org</p>\r\n<p>\r\n	Photos of previous PICNIC festivals are available here: http://www.flickr.com/photos/crossmediaweek</p>\r\n','2011-05-05 11:13:18','2011-05-19 14:19:36','2035-01-01 00:00:00','2011-05-05 11:13:18',0,NULL,0,'Announcing PICNIC Festival 2011'),(19,10,'Press release 2',NULL,'<p>\r\n	Aliquam erat volutpat. Mauris vel neque sit amet nunc gravida congue sed sit amet purus. Quisque lacus quam, egestas ac tincidunt a, lacinia vel velit. Aenean facilisis nulla vitae urna tincidunt congue sed ut dui. Morbi malesuada nulla nec purus convallis consequat. Vivamus id mollis quam. Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam vestibulum, arcu sodales feugiat consectetur, nisl orci bibendum elit, eu euismod magna sapien ut nibh. Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam.</p>\r\n','2011-05-05 11:14:07','2011-05-05 11:14:07','2035-01-01 00:00:00','2011-05-05 11:14:07',0,NULL,0,'Press release 2'),(20,10,'Press release 3',NULL,'<p>\r\n	Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna.</p>\r\n','2011-05-05 11:14:49','2011-05-05 11:14:49','2035-01-01 00:00:00','2011-05-05 11:14:49',0,NULL,0,'Press release 3'),(21,9,'Photos and videos',NULL,'<h4>\r\n	Photos</h4>\r\n<p>\r\n	For photos of PICNIC &#39;10 and past PICNICs, please visit our <a href=\"http://www.flickr.com/photos/crossmediaweek\" target=\"_blank\">Flickr page</a>. Most of the photos can be republished under the Creative Commons license. Please remember to credit the photographer when using any of these images.</p>\r\n<h4>\r\n	Videos</h4>\r\n<p>\r\n	Lectures from PICNIC &#39;10 and prior events, as well as promotional films can be found on our <a href=\"http://vimeo.com/picnicfestival\" target=\"_blank\">Vimeo channel</a>.</p>\r\n','2011-05-05 11:18:32','2011-05-05 11:45:39','2035-01-01 00:00:00','2011-05-05 11:18:00',0,NULL,4,'Photos and videos'),(22,11,'Note to the editor',NULL,'<h4>\r\n	About PICNIC</h4>\r\n<p>\r\n	PICNIC is about innovative ideas for business and society. It is an annual three-day festival that</p>\r\n<p>\r\n	blurs the lines between creativity, science, technology and business to explore new solutions in</p>\r\n<p>\r\n	the spirit of co-creation. Curious minds eager to exchange their knowledge, ideas and skills</p>\r\n<p>\r\n	gather at PICNIC, making it the place to create the future &ndash; together. PICNIC &lsquo;10 takes place at the</p>\r\n<p>\r\n	Westergasfabriek in Amsterdam from 22 to 24 September 2010.</p>\r\n<p>\r\n	www.picnicnetwork.org</p>\r\n<p>\r\n	For more information, please contact:</p>\r\n<p>\r\n	Liz Keel, Communications &amp; PR Manager</p>\r\n<p>\r\n	Tel: +31 (0)20 320 5813</p>\r\n<p>\r\n	Liz@picnicnetwork.org</p>\r\n<p>\r\n	PICNIC</p>\r\n<p>\r\n	Haarlemmerweg 321 B</p>\r\n<p>\r\n	1051 LG Amsterdam</p>\r\n<p>\r\n	www.picnicnetwork.org</p>\r\n','2011-05-05 11:22:27','2011-05-05 11:23:18','2035-01-01 00:00:00','2011-05-05 11:22:27',0,NULL,0,'English version'),(23,11,'Noot aan de redactie',NULL,'<p>\r\n	<span class=\"Apple-style-span\" style=\"font-family: \'Avant Garde Gothic ITCW01Bd\', arial, snas-serif; font-size: 19px; font-weight: bold; line-height: 28px; color: rgb(0, 0, 0); \">Over PICNIC</span></p>\r\n<p>\r\n	Innovatieve idee&euml;n voor bedrijven en maatschappij staan bij PICNIC centraal. Het is een jaarlijks</p>\r\n<p>\r\n	terugkerend driedaags festival dat de grenzen opzoekt in creativiteit, wetenschap, technologie en</p>\r\n<p>\r\n	ondernemen om nieuwe oplossingen te vinden door middel van co-creatie. Nieuwsgierige</p>\r\n<p>\r\n	mensen verzamelen zich bij PICNIC om hun kennis, idee&euml;n en vaardigheden uit te wisselen, dit</p>\r\n<p>\r\n	maakt het d&eacute; plaats om samen de toekomst te cre&euml;ren. PICNIC &rsquo;10 vindt plaats op het terrein van</p>\r\n<p>\r\n	de Westergasfabriek in Amsterdam van 22 t/m 24 september 2010.</p>\r\n<p>\r\n	www.picnicnetwork.org</p>\r\n<p>\r\n	Voor meer informatie, neem contact op met:</p>\r\n<p>\r\n	Liz Keel, Communications &amp; PR Manager</p>\r\n<p>\r\n	Tel: +31 (0)20 320 5813</p>\r\n<p>\r\n	Liz@picnicnetwork.org</p>\r\n<p>\r\n	PICNIC</p>\r\n<p>\r\n	Haarlemmerweg 321 B</p>\r\n<p>\r\n	1051 LG Amsterdam</p>\r\n<p>\r\n	www.picnicnetwork.org</p>\r\n','2011-05-05 11:23:58','2011-05-05 11:23:58','2035-01-01 00:00:00','2011-05-05 11:23:58',0,NULL,0,'Nederlandse Versie'),(24,9,'About PICNIC',NULL,'<p>\r\n	Looking for more information about PICNIC? On this page, you will find a complete selection of resources for the press, including logos, images and press releases from PICNIC and our partners.</p>\r\n<p>\r\n	Find out what the media has to say about PICNIC! Please take a moment to check out a selection of the great press coverage from PICNIC &#39;11.</p>\r\n<p>\r\n	For additional press-related requests, please contact us directly:</p>\r\n<p>\r\n	PICNIC</p>\r\n<p>\r\n	+31 (0)20 320 5813 </p>\r\n<p>\r\n	press(at)picnicnetwork.org</p>\r\n','2011-05-05 11:41:12','2011-05-18 11:31:12','2035-01-01 00:00:00','2011-05-05 11:41:00',0,NULL,0,'About'),(25,9,'Press clippings',NULL,'<p>\r\n	Another successful edition of PICNIC is behind us! Below you&#39;ll find just a small selection of the press coverage of PICNIC &#39;10.</p>\r\n<h4>\r\n	Links</h4>\r\n<ul>\r\n	<li>\r\n		Press coverage link 1</li>\r\n	<li>\r\n		Press coverage link 2</li>\r\n	<li>\r\n		Press coverage link 3</li>\r\n	<li>\r\n		Press coverage link 4</li>\r\n	<li>\r\n		Press coverage link 5</li>\r\n</ul>','2011-05-05 12:13:25','2011-05-19 14:20:23','2035-01-01 00:00:00','2011-05-31 12:13:00',0,NULL,99,'Press clippings'),(26,4,'Speakers','','<p>\r\n	Here are the speakers for PICNIC Festival 2011.&nbsp;</p>\r\n','2011-05-05 12:29:41','2011-05-23 12:56:59','2011-05-21 23:00:00','2011-05-05 12:29:00',0,NULL,30,''),(35,7,'Register now',NULL,'<p>\r\n	Register now for the PICNIC Festival 2011.</p>\r\n<p>\r\n	Early registration has begun. Register before 30 July to get a special discount rate.</p>\r\n','2011-05-06 17:14:01','2011-05-19 14:56:34','2035-01-01 00:00:00','2011-05-06 17:14:00',0,NULL,3,'How to register'),(48,4,'Overview',NULL,'<p>\r\n	Intro</p>\r\n','2011-05-11 12:41:47','2011-05-18 11:27:32','2035-05-02 23:00:00','2011-05-11 12:41:00',0,NULL,0,''),(56,20,'Hotels and Travel',NULL,'<h5 class=\"article_intro\">\r\n	September is a busy period in Amsterdam, so we encourage out-of-town visitors to book flights and hotels immediately.&nbsp;</h5>\r\n<h2>\r\n	Flights</h2>\r\n<p>\r\n	Schiphol Airport Amsterdam is an international airport with direct connections worldwide, and is accessible by train to the city centre in 15 minutes.</p>\r\n<p>\r\n	<img src=\"/media/BAhbBlsHOgZmIi8yMDExLzA1LzIzLzA1XzU1XzAzXzM3M19BaXJfRnJhbmNlX0tMTS5qcGc\" alt=\"\" style=\"float: left; width: 251px; height: 47px;\" /></p>\r\n<p>\r\n	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	PICNIC visitors can book flights on KLM and Air France by visiting the <a href=\"http://www.airfrance.fr/FR/fr/local/www_airfranceklm-globalmeetings_com.htm?eid=13239AF\" target=\"_self\">Air France and KLM Global Meetings website</a> and using event code 13239AF. This code also can be used when booking through your travel agency.</p>\r\n<p>\r\n	<em>Get the best price for your flight with AIR FRANCE &amp; KLM Global Meetings. Event ID Code to keep for the booking: 13239AF</em></p>\r\n<p>\r\n	<a href=\"/air-france-klm-global-meetings-information\"><em>More details here</em></a></p>\r\n<h2>\r\n	Hotels</h2>\r\n<p>\r\n	PICNIC Festival 2011 will be held this year at the NDSM Wharf, a 12-minute ferry ride across the river IJ on the north side of Amsterdam. Ferries depart often from behind Centraal Station.</p>\r\n<p>\r\n	Amsterdam has over 400 registered hotels of varying standards from budget facilities to some of the most expensive hotels in Europe. When you are booking a hotel, we suggest booking one within a short walk to Centraal Station and the ferry landing.</p>\r\n<p>\r\n	We have negotiated special PICNIC rates for a limited number of rooms at three hotels close to the station:</p>\r\n<h4>\r\n	Mint Hotel</h4>\r\n<p>\r\n	Located on the riverfront next to Centraal Station, Amsterdam&#39;s brand-new <a href=\"http://www.minthotel.com/our-hotels/amsterdam\" target=\"_blank\">Mint Hotel</a> opened in May. Rooms are airy and modern and furnished with Apple iMacs and free high-speed Wi-Fi. The hotel&#39;s Skylounge offers stunning views of the city of Amsterdam and as far as the PICNIC venue at the NDSM Wharf. A lounge on the ground floor will be a gathering place for both visitors and PICNIC speakers staying at the hotel.</p>\r\n<p>\r\n	Mint Hotel has a limited number of <a href=\"http://www.minthotel.com/our-hotels/amsterdam/gallery\" target=\"_blank\">rooms</a> at a special PICNIC rate of <em>&euro;169,00 per room per night</em>, including VAT, excluding breakfast and 5% city tax. If you would like to book your room(s) at the Mint Hotel, please visit the <a href=\"http://www.yourreservation.net/ibe/minthotel/main.html;jsessionid=E7E75B5C92D4EA4900464987D402598F.node4?_flowExecutionKey=_c8644387C-3238-CA0D-498D-5D5E5DDD210B_kD1BC253B-1730-BC0D-2159-EB78A13D247B\" target=\"_blank\">registration page</a> and use promotional code: ....</p>\r\n<p>\r\n	<em>available until 1st of July</em></p>\r\n<h4>\r\n	Lloyd Hotel</h4>\r\n<p>\r\n	The <a href=\"http://www.lloydhotel.com/\" target=\"_blank\">Lloyd Hotel</a> is the first &lsquo;one to five star&rsquo; hotel of the world and is situated in a revamped 1920s building and is a showcase of Dutch design. The rooms differ in size, but the high quality service is the same for everybody: beds with feather quilts, an excellent restaurant with pure, local food, where breakfast is served.&nbsp;The hotel is five minutes by tram from Centraal Station.</p>\r\n<p>\r\n	The Lloyd Hotel has a limited number of two-star <a href=\"http://www.lloydhotel.com/attachment-1527-en.html\" target=\"_blank\">rooms</a> at a special PICNIC rate of<strong> </strong><em>&euro;145 per room per night</em>, including VAT, excluding breakfast and 5% city tax. If you would like to book your room(s) at the Lloyd Hotel, please send your reservation inquiry to m.degroot@lloydhotel.com (Majorie de Groot) and mention promotion code <strong>GF10446</strong> to be eligible for the discount. Please note that you need to mention your credit card details (cc number and expiry date) for this booking.</p>\r\n<p>\r\n	<em>available until 1st of July</em></p>\r\n<h4>\r\n	Park Plaza Victoria Hotel</h4>\r\n<p>\r\n	The four-star <a href=\"http://www.parkplaza.com/amsterdam-hotel-nl-1012lg/netamst\" target=\"_blank\">Park Plaza Victoria Amsterdam</a> is located in the heart of the city centre near shopping and business districts, opposite Centraal Station. The hotel features 306 rooms.</p>\r\n<p>\r\n	Park Plaza Victoria Hotel has a limited number of <a href=\"http://www.parkplaza.com/amsterdam-hotel-nl-1012lg/netamst/rooms\" target=\"_blank\">rooms</a> at a special PICNIC rate of <em>&euro;159,00 per room per night</em>, including VAT, excluding breakfast and 5% city tax. If you would like to book your room(s) at the Park Plaza Victoria Hotel, please visit the <a href=\"http://www.parkplaza.com/reservation/clearReservation.do\" target=\"_blank\">reservation page</a> and use promotional code : .......</p>\r\n<p>\r\n	<em>available until 1st of July</em></p>\r\n','2011-05-16 10:54:19','2011-05-24 11:41:26','2035-01-01 00:00:00','2011-05-16 10:54:19',0,NULL,0,''),(57,4,'This year\'s theme: Urban Futures',NULL,'<h5 class=\"article_intro\">\r\n	Within the next few decades, more than 70% of the world&rsquo;s population will live in an urban environment. The scale of our cities will grow from big to mega, which will amplify challenges in these areas throughout the world. The challenges are myriad: How can we manage such developments as a fast-aging population, growing slums, insufficient healthcare, decreased mobility and transportation, social detachment, increased criminality, and diminished sustainability?</h5>\r\n<p>\r\n	Can we face these challenges and still enhance the quality of living? What should the role of governments be? Should we get residents more involved in their (social) environment? How can we leverage more of their talents? And what role will architecture, social engineering and technology play in redesigning the city of the future?</p>\r\n<p>\r\n	PICNIC Festival 2011 will investigate several urban future scenarios, from different perspectives. And we will not only talk about it, but we will showcase some of the ideas in our very own PICNIC City at the NDSM Wharf. &nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	infrastructure (mobility, transportation, the grid, sewage, a.s.o.)</p>\r\n<p>\r\n	- sustainability (natural resources, green vs brick, waste/water management, air quality, health, food, a.s.o.)</p>\r\n<p>\r\n	- health of demographics (food, waste/water management, air quality, aging, in house smart technology, green vs brick, health care, a.s.o.)</p>\r\n<p>\r\n	- smart society of connectedness (social engineering, gamification, open data, role of government, a.s.o.)</p>\r\n<p>\r\n	- media (urban screens, social media, gamification, transmedia, AR)</p>\r\n','2011-05-16 11:26:25','2011-05-20 08:49:07','2035-01-01 00:00:00','2011-05-16 11:26:00',0,12,10,'Themes'),(58,4,'Who attends PICNIC Festival?',NULL,'<h5 class=\"article_intro\">\r\n	PICNIC Festival attracts a global audience from a wide range of sectors.</h5>\r\n<p>\r\n	PICNIC attendees include creative agencies, artists, scientists, designers, marketers, brand managers, content producers, (new) media experts, government leaders, programmers, investors, lawyers, entrepreneurs, freelancers, inventors, technology providers, games developers, services providers, students and teachers just to name a few!</p>\r\n<p>\r\n	PICNIC attendees have one thing in common: they are all curious minds with a passion for finding innovative solutions for the challenges we face today and tomorrow.&nbsp;</p>\r\n','2011-05-16 11:37:05','2011-05-19 14:24:30','2035-01-01 00:00:00','2011-05-16 11:37:00',0,NULL,60,'Who attends?'),(59,15,'PICNIC announces new venue and Urban Futures theme for 2011',NULL,'<h5 class=\"article_intro\">\r\n	PICNIC, Europe&rsquo;s leading event for the creative industries, announced its program themes and a new venue for 2011 during a meet-up in the historic Waag building in Amsterdam.</h5>\r\n<p>\r\n	After five years, PICNIC moves to NDSM wharf and builds a PICNIC City</p>\r\n<p>\r\n	Now in its sixth year, PICNIC reiterated its commitment to creativity and technology &ndash; in terms of content, involvement of the PICNIC community and its international reach. This event for professionals is internationally known for its innovative festival approach, combining cutting edge content with new, interactive program formats and a surprising and exciting visitors experience.</p>\r\n<p>\r\n	Waag Society director and PICNIC co-founder Marleen Stikker revealed the theme of PICNIC &rsquo;11: &ldquo;The PICNIC &rsquo;11 theme is &lsquo;Urban Futures&rsquo;. We will explore the impact of global urbanization on our cities, societies and our lives and the way creative and smart technologies can play a role. The challenges following from mega urban environments in areas like demographic shifts, (natural) resources, infrastructure, health and governance are getting more and more pressing. PICNIC brings creative thinkers, developers, designers and entrepreneurs together to collaborate on possible solutions.&rdquo;</p>\r\n<p>\r\n	&ldquo;What will make PICNIC &lsquo;11 really different compared to the preceding editions or any event out there is our theme as the starting point for everything&rdquo;, says Creative Director, Marcel Kampman. &ldquo;We are going to build an actual &ldquo;PICNIC City&rdquo; to prototype creative, urban applications and concepts and we will call upon the PICNIC community to help us build this temporary environment.&rdquo;</p>\r\n<p>\r\n	PICNIC &rsquo;11 will take place from 14 to 16 September 2011 at the NDSM Wharf in Amsterdam.</p>\r\n<p>\r\n	The &ldquo;PICNIC City&rdquo; will arise at a new location for PICNIC &rsquo;11: the NDSM Wharf on the north side of the river IJ in Amsterdam. PICNIC&rsquo;s Program Director, Kitty Leering commented on the move: &ldquo;We have had an amazing five years at the Westergasfabriek, but the time has come to challenge ourselves more, as well as offer our visitors a new experience. Moving our event to the NDSM Wharf gives us an excellent opportunity to take the look and feel of the festival to another level.&rdquo;</p>\r\n<p>\r\n	According to Rob Post, chairman of the city district Amsterdam-North, the festival and this part of Amsterdam have similar characteristics: &ldquo;PICNIC represents a strong pioneering spirit, innovation and creativity. That also holds true for Amsterdam North. We welcome PICNIC to the sunny side of the IJ.&rdquo;</p>\r\n','2011-05-16 11:59:23','2011-05-17 16:33:58','2035-01-01 00:00:00','2011-04-26 11:59:00',0,14,0,'Urban Futures'),(60,20,'The weekend after PICNIC',NULL,'<h5 class=\"article_intro\">\r\n	<span class=\"Apple-style-span\" style=\"font-family: \'VAG Rounded W02 Light\', arial, sans-serif; font-size: 14px; line-height: 21px; \">Amsterdam has many attractions to fill your time the weekend after PICNIC. Look for tips here closer to the festival.</span></h5>\r\n<p>\r\n	Flights to London and other European capitals can be made in one to three hours.</p>\r\n<p>\r\n	Direct trains run from Amsterdam to Paris (three hours and 19 minutes), Brussels and Antwerp (both two hours) and to such German cities as Cologne (two hours) and Berlin (six hours). Most destinations within the Netherlands can be reached within about two hours. For more information, visit the website of the <a href=\"http://www.ns.nl/en\" target=\"_blank\">NS</a>, the Dutch rail service.</p>\r\n','2011-05-16 13:21:49','2011-05-20 14:21:48','2035-01-01 00:00:00','2011-05-16 13:21:49',0,NULL,0,'After PICNIC'),(61,20,'Getting to the venue',NULL,'<p>\r\n	More information coming soon.</p>\r\n','2011-05-16 14:21:46','2011-05-19 14:21:19','2035-01-01 00:00:00','2011-07-31 14:21:00',0,NULL,0,'Getting to the venue'),(62,15,'Spotlight on MaxClass: participant in PICNIC \'10 Pitch Night and Marketplace','<p>\r\n	PICNIC has a passion for great ideas and inspiring individuals with an entrepreneurial spirit. In 2010, we introduced the PICNIC Business Program with expanded offerings for start-ups, SMBs and entrepreneurs. One of the participants was Michiel Klonhammer, with his new initiative called MaxClass. Michiel&rsquo;s been hard at work since last year&rsquo;s event, and his social networking platform specifically for schools/classrooms is now live! Keep reading to find out more about Michiel and MaxClass&hellip;</p>\r\n','<h5 class=\"article_intro\">\r\n	Get to know MaxClass: Social media for school and home</h5>\r\n<p>\r\n	We&rsquo;re always curious to find out more about people and companies who participate in PICNIC, especially ones that seem on the brink of having a real impact in their market. Happily, Michiel Klonhammer was more than willing to give us a peek behind the scenes of MaxClass and the process he went through transforming a great idea into a functioning business.</p>\r\n<p>\r\n	<em>Congratulations on the launch of MaxClass! Can you tell us a little more about your company, who MaxClass is meant for, and the benefits of such a platform?</em></p>\r\n<p>\r\n	MaxClass is a communication platform for pupils, parents and teachers. We call it social media for school and home but it&#39;s different from current social media in that it&#39;s specifically designed for education and it&#39;s private. We first presented the concept during Picnic &lsquo;10 and after a private beta we went live at the end of January 2011. After about 6 weeks we have 250 classes in the Netherlands and - really exciting - since we opened up to non-Dutch schools yesterday we have schools in India, Alaska, Florida, Columbia and Australia. They are all just starting up so it&#39;s too early to know how it&#39;s going but we&#39;re really excited!</p>\r\n<p>\r\n	<em>When did you first get the idea for MaxClass? Many great business ideas get stuck at the idea phase. What gave you the courage to actually pursue turning this idea into a business/service?</em></p>\r\n<p>\r\n	I know it sounds crazy, but I simply woke up with the whole idea as a blueprint. I&#39;m happy I told my girlfriend about it in detail that morning otherwise I might not have believed this myself. Somehow I am just completely convinced this needs to be done. Once I started telling people about it, they kept saying that &quot;it must already exist&quot;. But I knew that wasn&#39;t the case so I realized I was on to something important.</p>\r\n<p>\r\n	<em>How much time was there between the idea stage and the launch stage? Can you walk us through some of your key milestones along the way?</em></p>\r\n<p>\r\n	I started talking about it in 2009 with lots of people (especially parents, teachers and educational publishers) and it took nearly a year of research, sketching and planning before I stopped my job and invested all my money into it.</p>\r\n<p>\r\n	I realized I needed a brilliant team to pull this off and I was lucky to find Marc Worrell (ex Mediamatic), Joost Faber (ex Lostboys) and Atilla Erdodi (ex Erlang Solutions) willing to join me.</p>\r\n<p>\r\n	That&#39;s really the biggest step - the people. In November we had a big party to launch a private beta and then we were ready to go live at the end of January. So I guess from the morning I woke up, to the day we went live took about 20 months.</p>\r\n<p>\r\n	<em>Do you consider yourself an &ldquo;entrepreneur at heart&rdquo;? Have you started other businesses in the past, or is this your first venture? What do you find most appealing about running your own business?</em></p>\r\n<p>\r\n	Yes, I think this is my perfect fit. I love art, science and even large corporations but I&#39;m probably at my best in a startup situation. It&#39;s incredible what you can achieve with a small team of smart people. The combination of low overhead and enough energy to work obsessively is pretty productive! But at the same time, I like managing a bigger company as I did before (with ICATT interactive media) so I&#39;m looking forward to growing. It&#39;s fun to work like crazy for a while, but at the same time I want people that work with me to be able to have a life.</p>\r\n<p>\r\n	<em>You participated in PICNIC &rsquo;10 at Pitch Night and the Chamber of Commerce Marketplace. How did you find out about these activities and what made you decide to attend?</em></p>\r\n<p>\r\n	PICNIC is the coolest event in the Netherlands by far. I love the crazy mix of stuff that goes on.</p>\r\n<p>\r\n	I&#39;ve been a visitor several times even though it&#39;s pretty expensive for smaller companies. So I had already decided to try and do our first presentation there somehow. I heard about the specific event through Syntens and the PICNIC mailing lists, so it didn&#39;t take long to jump at that chance.</p>\r\n<p>\r\n	<em>What did you find most valuable about your experience at PICNIC? Did you gain any good connections or learn something new? If so, please elaborate!</em></p>\r\n<p>\r\n	The nice thing about PICNIC is that a lot of people have an open mind and are just curious. So when you&#39;re still in the phase of getting your story straight, it&#39;s a great place. It&#39;s different from a regular conference because you can discuss instead of only presenting.</p>\r\n<p>\r\n	We actually met some of the people that joined the private beta later and we interviewed a lot of visitors to see what they thought. We had three interns that we dressed up as a Russian Camera crew (one of the interns was Russian) - which actually got them past security!</p>\r\n<p>\r\n	I met an investor on the dance floor (this is really true!) who I&#39;m still in contact with.</p>\r\n<p>\r\n	<em>What are your goals for MaxClass in the coming year?</em></p>\r\n<p>\r\n	Well we&#39;re trying to grow into a platform that is used by a few hundred thousand people. So we have to focus on getting it perfect, letting people know what we&#39;re doing and - not unimportantly - attracting more investors.</p>\r\n<p>\r\n	<em>What advice would you give to other entrepreneurs who are considering diving in to a new business venture? For example, what are some positive (or even negative) lessons you learned as you were building MaxClass?</em></p>\r\n<p>\r\n	If you are based in the Netherlands, you need to decide you do not care too much if you fail.</p>\r\n<p>\r\n	The Dutch are pretty careful people and that gets in the way sometimes. At the same time, you need to know what you&#39;re doing. I chose to work on the idea for a couple of months before writing a business plan. I really don&#39;t believe that you can write a plan at the very start like starting entrepreneurs are often told. Just get to work!</p>\r\n<p>\r\n	Something that has been absolutely amazing is that it&#39;s possible to set up a business based on cloud applications - so for the first time ever you can avoid buying expensive licenses for such things as accounting, CRM, domain management, file servers etc and just pay for the use of it all. It&#39;s not free but so much less work and overhead. It&#39;s interesting to experience this as MaxClass is a cloud application as well.</p>\r\n<p>\r\n	Having said that, I personally need to work with people in one office so I can work side by side with them. I think it&#39;s wise to keep in extremely close contact with the people you work with. Of course you can do it online but I need and enjoy the contact in the office.</p>\r\n<p>\r\n	<em>Finally, how can people find out more about MaxClass?</em></p>\r\n<p>\r\n	www.maxclass.com</p>\r\n<p>\r\n	michiel(at)maxclass.com</p>\r\n<p>\r\n	www.twitter.com/maxclassEng</p>\r\n<p>\r\n	tel: +31 (0)20 8202383</p>\r\n<p>\r\n	Thanks once again to Michiel for sharing his story! If you are curious to find out more &ndash; especially if you work in the education sector &ndash; please don&rsquo;t hesitate to get in touch with him.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<em>If you are a (former) PICNIC participant with exciting news about your venture or a story about how PICNIC impacted your business, drop us a line at info(at)picnicnetwork.org</em></p>\r\n','2011-05-17 14:14:16','2011-05-17 16:34:30','2035-01-01 00:00:00','2011-03-24 15:13:00',0,15,0,'Spotlight on MaxClass'),(63,15,'Cure Violence: Portrait of an Epidemic','','<h5 class=\"article_intro\">\r\n	Chicago-based video artist and former PICNIC speaker Lincoln Schatz continually strives to use his artistic abilities to create projects that inspire social change and public interaction. His most recent work is a composite video entitled Cure Violence: Portrait of an Epidemic. This video series is a portrait of more than 50 Chicago residents committed to ending gun violence.</h5>\r\n<h3>\r\n	A chapter a month to reduce violence</h3>\r\n<p>\r\n	Cure Violence: Portrait of an Epidemic is a composite video portrait of Chicagoans who are working to reduce violence in their communities. Each month for the next year, Lincoln Schatz will release a new chapter in this series.</p>\r\n<p>\r\n	You can <a href=\"http://lincolnschatz.com/cure-violence-portrait-of-an-epidemic/\" target=\"_blank\">watch the first chapter on Lincoln&rsquo;s website</a> or subscribe to the whole series as <a href=\"http://itunes.apple.com/us/podcast/cure-violence/id425696044\" target=\"_blank\">iTunes Podcasts</a>.</p>\r\n<p>\r\n	Lincoln created Cure Violence: Portrait of an Epidemic in conjunction with <a href=\"http://www.ceasefirechicago.org/\" target=\"_blank\">CeaseFire</a>, a nonprofit organization dedicated to working with community and government partners to reduce violence. Travelling through the greater Chicago area in 2009, including the neighborhoods most ridden with violence, he interviewed people from the CeaseFire network of violence interrupters, outreach workers and community members. He processed the footage through his custom software to create a non-editorialized composite portrait of the complex landscape of violence.</p>\r\n<p>\r\n	Cure Violence: Portrait of an Epidemic is intended to increase awareness, incite social action and provide a platform for discussion.</p>\r\n<p>\r\n	Learn more about Lincoln Schatz and his work at http://lincolnschatz.com.</p>\r\n','2011-05-17 16:32:52','2011-05-17 16:33:30','2035-01-01 00:00:00','2011-03-21 17:32:00',0,NULL,0,''),(64,15,'Help FairPhone celebrate its first birthday on 17 March','','<h5 class=\"article_intro\">\r\n	FairPhone is the world&rsquo;s first collective, non-profit developer of fair trade mobile phones. On 17 March, you&rsquo;re invited to help celebrate the first anniversary of FairPhone with a special event at the Waag in Amsterdam. In addition to this milestone, FairPhone is also celebrating the return of the FairPhone team who recently travelled to Congo to collect samples of raw materials to be used in the first Fair Phone prototypes.</h5>\r\n<h2>\r\n	FairPhone presents: The future of FairPhone - retour du Congo</h2>\r\n<p>\r\n	On 17 March 2011 the initiators of FairPhone (Waag Society, NIZA and Schrijf-Schrijf) are hosting a festive gathering, and you&rsquo;re invited to be a part of it! This special occasion marks the first birthday of FairPhone and the return of team members who recently completed a fact and resource finding mission in Congo. During this event they will also give a preview of the future of the FairPhone campaign: developing a phone based on fair resources.</p>\r\n<p>\r\n	Show your support for FairPhone and join the festivities on 17 March! Just send an email to events(at)waag.org to reserve your place.</p>\r\n<h3>\r\n	Program details</h3>\r\n<p>\r\n	Look back at what FairPhone has accomplished in the past year and learn about their plans for the future. During this event, they will reveal exciting collaborations and special partners. There are workshops on raw materials (bring along your old mobile!) and the FairPhone team will give demonstrations on how to campaign successfully. Furthermore, experts on Congo, fair-trade and (phone) design share their knowledge and experience.</p>\r\n<p>\r\n	<strong>15:30 Doors open</strong></p>\r\n<p>\r\n	<strong>16:00 &ndash; 18:30 Congo experience, mobile phone design &amp; fair-trade campaigning</strong></p>\r\n<p>\r\n	Learn more about mining and processing of cobalt, from the team who went straight to the source in Congo. Explore mobile phone design and development. Learn how to build a successful fair-trade campaign using examples like Tony Chocolonely. The afternoon program closes with drinks and time for open discussion.</p>\r\n<p>\r\n	<strong>19:00 &ndash; 21:00 Documentary, workshops, Q&amp;A</strong></p>\r\n<p>\r\n	During the evening, you can watch the IDFA documentary &quot;Blood in the Mobile&quot;, and participate in workshops from Our Mobile Generation and Urban Mining. The FairPhone team will be on hand for Q&amp;A, as well as to reveal the future of the FairPhone campaign and the process of developing a fair-trade mobile phone. The evening session also closes with a drink.</p>\r\n<p>\r\n	The event takes place at the Waag building (Nieuwmarkt 4) in Amsterdam. Sign up today by sending an email to events(at)waag.org.</p>\r\n<p>\r\n	FairPhone is an initiative of Waag Society, development organisation Niza and communication agency Schrijf-Schrijf. Oxfam Novib&rsquo;s Doenersnet is part of the official FairPhone team.</p>\r\n<p>\r\n	FairPhone is made possible by NCDO.</p>\r\n<p>\r\n	Learn more about FairPhone at: http://fairphone.com</p>\r\n','2011-05-17 16:37:26','2011-05-17 16:39:45','2035-01-01 00:00:00','2011-03-10 17:37:00',0,16,0,''),(65,15,'Attend iCE Amsterdam 2011 with a special discount from PICNIC','','<h5 class=\"article_intro\">\r\n	Clear your calendars on 7 and 8 March for iCE Amsterdam 2011! This event covers all the latest on mobile strategies, platforms and app development. Featuring a conference, boot camps, dev camps, seminars and workshops there&rsquo;s something for everybody &ndash; from managers and designers to developers and business professionals. Keep reading to find out more about the program and how to get your tickets with a special discount for friends of PICNIC.</h5>\r\n<h2>\r\n	iCE Amsterdam 2011</h2>\r\n<p>\r\n	iCE Amsterdam takes place at the Westergasfabriek from 7 to 8 March, 2011. Started in 2009, this event is dedicated to exploring, learning and collaborating in the rapidly changing world of mobile. They will look at mobile strategies, platforms and apps development with a slew of speakers and attendees from around the world. Just a few of this year&rsquo;s speakers include Philippe Winthrop, Dom Sagolla, Mike Lee, Joe Pezzillo, Andrew Seybold, David Kao, Mike McGrail and Ajit Jaokar.</p>\r\n<p>\r\n	Want to attend iCE 2011?</p>\r\n<p>\r\n	We&rsquo;ll be attending iCE 2011, and we hope to see you there! We&rsquo;ve arranged a special discount just for friends and fans of PICNIC. Register now using the PICNIC discount code (ok3301) and get 25% off any and all tickets. Take a look at the full program, with specific tracks for C-level executives, directors &amp; managers, developers &amp; programmers or marketers &amp; media professionals.</p>\r\n<h3>\r\n	iCE Amsterdam 2011 is for C-level executives, directors, managers &amp; innovators</h3>\r\n<p>\r\n	Wireless and Apps are revolutionizing the world and mobile technology is having a profound impact on many business processes. iCE Amsterdam 2011 provides professionals with unbiased, actionable intelligence from enterprise mobility experts. Program highlights include:</p>\r\n<ul>\r\n	<li>\r\n		Enterprise &amp; Applications Conference</li>\r\n	<li>\r\n		Workshop Mobile Web and Mobile Apps, Synergies and Strategies</li>\r\n	<li>\r\n		Enterprise Mobility Boot Camp</li>\r\n	<li>\r\n		Andrew Seybold Wireless University</li>\r\n	<li>\r\n		Mobile Government</li>\r\n	<li>\r\n		CIO Strategy Summit (invitation only)</li>\r\n</ul>\r\n<h3>\r\n	iCE Amsterdam 2011 is for developers, UI designers, programmers &amp; publishers</h3>\r\n<p>\r\n	If you&rsquo;re a developer, iCE Amsterdam 2011 is a can&rsquo;t-miss event! There&rsquo;s a great program for everyone, whether you&rsquo;re an iOS developer or an Android specialist. And make sure to check out the iCE Amsterdam HiGrids App Challenge. A total cash prize of &euro; 30.000 is at stake for the best location-aware app. Submit your idea at www.iceamsterdam.com. Program highlights include:</p>\r\n<ul>\r\n	<li>\r\n		iOSDevCamp (for developers/programmers)</li>\r\n	<li>\r\n		Android Top Gun Training Camp (for developers/programmers)</li>\r\n	<li>\r\n		iPad &amp; Tablet Boot camp (for marketing/media)</li>\r\n</ul>\r\n<p>\r\n	After two days of talking, learning, listening and creating, iCE Amsterdam 2011 will end with the iCE Amsterdam 2011 Award Dinner and the Appsterdam Mobile Party.</p>\r\n<p>\r\n	We hope to see you there! Go to the <a href=\"http://www.iceamsterdam.com/\" target=\"_blank\">iCE website</a> and register today.&nbsp;</p>\r\n','2011-05-17 16:43:50','2011-05-17 16:44:49','2035-01-01 00:00:00','2011-02-20 17:43:00',0,NULL,0,''),(66,15,'Apps for Amsterdam starts a local data revolution',NULL,'<h5 class=\"article_intro\">\r\n	On February 16, the Waag building at the Nieuwmarkt in Amsterdam was absolutely packed for the informative and inspiring kick-off event of Apps for Amsterdam. The evening started with a short intro from Waag Society Director Marleen Stikker and city representative Carolien Gehrels. It was followed by a keynote presentation by Peter Corbett, CEO of iStrategy Labs and co-creator of Apps for Democracy in the US. Keep reading to find out more about the Apps for Amsterdam competition and the beginnings of Amsterdam&rsquo;s open data revolution.</h5>\r\n<h2>\r\n	Open data comes to Amsterdam</h2>\r\n<p>\r\n	The internet has been buzzing for some time now about the wonders of open data, and thanks to <a href=\"http://www.appsforamsterdam.nl/\" target=\"_blank\">Apps for Amsterdam</a>, started by Waag Society, the City of Amsterdam (EZ) and Hack de Overheid, the buzz is finally coming to our fine city. Open data is simply data and information that is available to the general public, often collected by the government, universities, research institutes or other (independent) third parties. It can encompass a nearly unlimited range of interests, disciplines and figures &ndash; think of population and demographic data, crime statistics, environmental indicators or public transport information. The organizers of Apps for Amsterdam have been working with local organizations for months to &ldquo;free&rdquo; data from institutions throughout the city. They have currently received permission to share <a href=\"http://www.appsforamsterdam.nl/databronnen\" target=\"_blank\">nine sources of Amsterdam data</a>, and are actively working to increase that number.</p>\r\n<h3>\r\n	Apps for Amsterdam needs YOU to explore the potential of open data!</h3>\r\n<p>\r\n	Beyond getting various organizations to agree to share their data, the primary challenge is making all this information useful to the general public. And this is where you come in! Apps for Amsterdam is seeking programmers, developers and anyone with a passion for information to develop a winning application using Amsterdam&rsquo;s open data. It can be any kind of application you like &ndash; and is certainly NOT limited to the iPhone! To enter the competition, you must create a working prototype of an app that uses at least one source of open data from the city of Amsterdam. <strong>The final day to submit your entry is 4 May, 2011</strong>. <a href=\"http://www.appsforamsterdam.nl/spelregels-en-prijzen\" target=\"_blank\">Find out more about the competition and how to enter.</a></p>\r\n<h3>\r\n	A total of 14,500 euros is up for grabs</h3>\r\n<p>\r\n	Besides local fame and glory, there is a total of 14,500 euros in prize money available in a variety of categories. This competition is open to both individuals as well as established companies, with separate prizes for each. <a href=\"http://www.appsforamsterdam.nl/spelregels-en-prijzen/prijzengeld\" target=\"_blank\">Take a look at what you could win!</a></p>\r\n<p>\r\n	The prize winners will be announced during Open Data Day on 25 May.</p>\r\n<h3>\r\n	Need some inspiration?</h3>\r\n<p>\r\n	During the kick-off, there were lots of great ideas for new applications being discussed during the presentations, as well as during the informal networking session that followed. How about an app to help you find your lost or stolen bike? Or locate the nearest parking meter? What about updates on public transport delays or a breakdown of crimes in your neighborhood? Be sure to take a few minutes to look at <a href=\"http://www.appsforamsterdam.nl/nieuws/presentatie-peter-corbett\" target=\"_blank\">Peter Corbett&#39;s presentation</a> to see what&rsquo;s been accomplished in the last few years in the US.</p>\r\n<p>\r\n	Finally, if you plan to enter, be sure to check out the special <a href=\"http://www.appsforamsterdam.nl/evenementen\" target=\"_blank\">Apps for Amsterdam collaboration day on 12 March</a>, organized by Hack de Overheid.</p>\r\n','2011-05-17 16:48:08','2011-05-17 16:48:24','2035-01-01 00:00:00','2011-02-21 17:48:00',0,NULL,0,''),(67,15,'Calling all programmers - Apps for Amsterdam wants you!',NULL,'<h5 class=\"article_intro\">\r\n	Does information get you excited? Dive into the world of Amsterdam data, create an innovative application, and become the Netherlands&rsquo; first Open Data Hero! If this sounds like something for you, don&rsquo;t miss the kick-off of Apps for Amsterdam on 16 February.</h5>\r\n<p>\r\n	Apps for Amsterdam is a new initiative to make data from the City of Amsterdam accessible to everyone. They are calling programmers, developers and designers to use their talents to turn statistical information into engaging applications. Create Android apps, iPhone apps, Facebook apps and web apps with Amsterdam&rsquo;s open data!</p>\r\n<p>\r\n	It&rsquo;s an exciting challenge in and of itself&hellip;but there&rsquo;s also cash at stake! <a href=\"http://www.appsforamsterdam.nl/index.html\" target=\"_blank\">Register for the Apps for Amsterdam kick-off event</a> on 16 February to learn more about the competition, enjoy an evening full of networking and stimulating presentations about the possibilities of data, and find out how much you could win!</p>\r\n<h3>\r\n	Apps for Amsterdam kick-off on 16 February, 2011</h3>\r\n<p>\r\n	The festive kick-off event takes place on 16 February at the Waag building on the Nieuwmarkt in Amsterdam. Doors open at 19:30, and the official program starts at 20:00 with a welcome from minister Carolien Gehrels. It&rsquo;s followed by a keynote from <strong>Peter Corbett</strong> (iStrategyLabs) and presentations from <strong>Marleen Stikker</strong> (Waag Society) and <strong>Lex Slaghuis</strong> (HackDeOverheid.nl). The evening closes with networking drinks. <a href=\"http://www.appsforamsterdam.nl/events.html\" target=\"_blank\">Check out the full program</a>.</p>\r\n<p>\r\n	<strong><a href=\"http://www.appsforamsterdam.nl/index.html\" target=\"_blank\">Register today</a> for Apps for Amsterdam and get started coding!</strong></p>\r\n<p>\r\n	Apps for Amsterdam is organized by the <a href=\"http://www.ez.amsterdam.nl/\" target=\"_blank\">Amsterdam Ministry of Economic Affairs</a>, <a href=\"http://www.hackdeoverheid.nl/\" target=\"_blank\">Hack de Overheid</a> and <a href=\"http://www.waag.org/\" target=\"_blank\">Waag Society</a>. The competition is also supported by Open Cities, Service Innovation &amp; ICT, Virtual Creative Collaboration Platform and Seventh Framework Programme.&nbsp;</p>\r\n','2011-05-17 16:51:15','2011-05-17 16:51:33','2035-01-01 00:00:00','2011-02-03 17:51:00',0,NULL,0,''),(68,15,'We are now entering the era of Sustainism','','<h5 class=\"article_intro\">\r\n	On Thursday 20 January, visitors wedged their way into a packed room at the ABC Treehouse in Amsterdam for the official launch of &lsquo;Sustainism,&rsquo; a new book by Michiel Schwarz and Joost Elffers. We were privileged to have Michiel as a guest in the Press Lounge at PICNIC &rsquo;10, where he organized a special &ldquo;pre-launch&rdquo; of his book back in September.</h5>\r\n<p>\r\n	Michiel and Joost boldly introduce their book as a manifesto &ndash; the identification of a new era following modernism and post-modernism. They are putting a name on an era we have already entered, with new attitudes and ideas than the previous generations.</p>\r\n<p>\r\n	The elements of Sustainism they identified certainly rang true. Our new cultural perspective can be seen in the current emergence of an interconnected global age, a returned interest in localism, the era of climate change, and the tendency toward openness and sharing.</p>\r\n<h3>\r\n	Naming a cultural shift</h3>\r\n<p>\r\n	With their academic (Michiel) and creative design (Joost) backgrounds, they are clear to state that their strength lies in observation. They are simply putting a name on the current transition in the world we already inhabit, not trying to start a new movement.</p>\r\n<p>\r\n	Rather than being a dry studious read, &lsquo;Sustainism&rsquo; is a very accessible book, combining a collection of powerful statements with strong symbolism. Get your copy at the <a href=\"http://www.abc.nl/\" target=\"_blank\">American Book Center</a> in Amsterdam.</p>\r\n<p>\r\n	<strong>Read their recent coverage in the New York Times:</strong></p>\r\n<ul>\r\n	<li>\r\n		<a href=\"http://www.nytimes.com/2011/01/10/arts/10iht-design10.html\" target=\"_blank\">Sustainism: It&rsquo;s Got a Name, Now Do It!</a></li>\r\n</ul>\r\n','2011-05-17 16:53:56','2011-05-17 16:54:36','2035-01-01 00:00:00','2011-01-24 17:53:00',0,NULL,0,''),(69,15,'Winners of Designers & Artists 4 Genomics Award Announced','','<h5 class=\"article_intro\">\r\n	The Designers &amp; Artists 4 Genomics Award (DA4GA) was a brand new initiative launched in 2010 to bring emerging artists and designers together with the Netherlands&rsquo; most prestigious genomics centers to stimulate the field of &ldquo;bio-art&rdquo; in this country. In December, the winners of the competition were announced at Naturalis in Leiden.</h5>\r\n<h2>\r\n	Art meets science at PICNIC &lsquo;10</h2>\r\n<p>\r\n	DA4GA was launched in August 2010 as an initiative of Waag Society, the Netherlands Genomics Initiative and the Centre for Society and Genomics. Artist were encouraged to submit proposals for a chance to collaborate with the Netherland&rsquo;s leading genomics centers to create an installation for Naturalis in Leiden, plus a cash award of &euro;25,000 to invest in developing their projects.</p>\r\n<p>\r\n	During PICNIC &rsquo;10, the selected semi-finalists met renowned experts from the bio-arts field like Alexandra Daisy Ginsberg, pitched their ideas to the PICNIC audience, and sat down to brainstorm with the genomics centers that would be their (potential) partners.</p>\r\n<h3>\r\n	Three artists take home the prize</h3>\r\n<p>\r\n	During the award ceremony in December, three of the semi-finalists were selected as winners of the 2010 DA4GA competition.</p>\r\n<p>\r\n	<strong>Jalila Essaidi</strong> and the Forensic Genomics Consortium Netherlands won for their project 2.6g 329m/s. The project seeks to develop bullet-proof skin by re-enforcing transgenic human skin with ultra strong spider webs.</p>\r\n<p>\r\n	<strong>Maurizio Montalti </strong>en the Kluyver Centre for Genomics of Industrial Fermentation won for their proposal System Synthetics. Their transparent system let viewers can observe an ecological bioreactor in action. One type of fungus breaks down plastic, while another type of fungus converts it to bio-ethanol (an alternative fuel source).</p>\r\n<p>\r\n	<strong>Matthijs Munnik</strong> and the Netherlands Consortium for Systems Biology were also named winners for their Microscopic Opera. This audiovisual installation utilizes mutated C. Elegans lab worms performing and &ldquo;opera&rdquo; of movement and sound.</p>\r\n<p>\r\n	The winning projects will be on display at <a href=\"http://www.naturalis.nl/\" target=\"_blank\">Naturalis </a>in Leiden from mid June through the end of December 2011.</p>\r\n<p>\r\n	<a href=\"http://www.waag.org/pers/75080\" target=\"_blank\">Read the full press release on the Waag Society website</a> (in Dutch).</p>','2011-05-17 16:57:03','2011-05-17 16:57:03','2035-01-01 00:00:00','2011-01-19 17:54:00',0,NULL,0,''),(70,15,'ID Award: Vote for PICNIC Co-founder Bas Verhart!','','<h5 class=\"article_intro\">\r\n	PICNIC co-founder Bas Verhart has been nominated by BID (Big Improvement Day) for their 2011 ID Award! This yearly award is given to a person with an extraordinary idea for an innovative product or service that addresses a need in the market and Bas has gained recognition for THNK, his new organization for educating creative leadership. Want to show your support for Bas? Be sure to vote for him before Monday 17 January. Keep reading for more details&hellip;</h5>\r\n<h2>\r\n	Big Improvement Day: Great ideas for improving business in the Netherlands</h2>\r\n<p>\r\n	This year, the <a href=\"http://www.bigimprovementday.nl/\" target=\"_blank\">BID (Big Improvement Day)</a> event takes place on 18 January at the RAI in Amsterdam. BID is a platform for inspiring connections, new insights and boundary-crossing collaboration. It&rsquo;s a podium for Dutch professionals to offer their input on the continued improvement of the business environment within the Netherlands.</p>\r\n<p>\r\n	During BID 2011, the Netherlands&rsquo; top business minds will give presentations, and there will be plenty of time for networking. During the course of the day, they will also announce the winners of 4 different awards for inspiring professionals who are making a difference this country: the LEF Award, ID Award, 3e Dinsdag Award (3rd Thursday) and BID Award.</p>\r\n<h3>\r\n	Cast your vote for Bas Verhart</h3>\r\n<p>\r\n	Bas Verhart has been nominated for the ID Award&hellip;but he needs your help to win! Show your support for Bas by casting your vote before Monday 17 January. <a href=\"http://www.bigimprovementday.nl/awards/Stemmen/\" target=\"_blank\"><strong>Simply go to the voting page on the BID website</strong></a>. On the bottom of the page, you will see tabs to vote for each of the four awards, including the ID Award. (<em>Please note, the website is in Dutch and you will be required to vote for all four awards to complete your entry</em>.)</p>\r\n<p>\r\n	Bas has been nominated on the strength of his latest business venture THNK, an Amsterdam-based school for creative leadership. THNK&rsquo;s mission is to develop a new breed of global creative leaders who co-create to solve real world challenges and generate unexpected innovations. Their graduate-level education programs will teach a select group of experienced professionals how to lead continuous innovation and radical collaboration, manage complexity and develop new creative processes. THNK&rsquo;s first full-time program will launch in September 2011.</p>\r\n<p>\r\n	<a href=\"http://www.thnk.org/blog/\" target=\"_blank\">Visit the THNK website to learn more</a>. &nbsp;</p>\r\n','2011-05-17 17:00:00','2011-05-17 17:00:00','2035-01-01 00:00:00','2011-01-11 17:57:00',0,NULL,0,''),(71,15,'Social Cities with Dennis Crowley','','<h5 class=\"article_intro\">\r\n	Dennis Crowley, co-founder and CEO of foursquare, talks to the audience at PICNIC &rsquo;10 about making cities more social. His company mixes human behavior, locative technology, gaming mechanics and mobile devices to encourage people to interact and explore the cities in which they live.</h5>\r\n<h3>\r\n	Combining digital interaction with physical locations</h3>\r\n<p>\r\n	In his own words, Dennis introduces foursquare by saying, &ldquo;We build things for mobile phones&hellip;to make cities easier to use and the world more interesting to explore.&rdquo;</p>\r\n<p>\r\n	His organization started with a simple question &ndash; How can we connect people and physical points on a map in a fun and interesting way? This led them to come up with a mobile application that allowed people to &ldquo;check in&rdquo; to physical locations they visited, leave tips and info for other visitors, and compete with each other for &ldquo;digital candy&rdquo; like badges or mayor of a specific location. It also gave companies a new platform for interacting and offering promotions to both new visitors and loyal customers.</p>\r\n<p>\r\n	Beyond the features of foursquare&rsquo;s mobile apps, Dennis digs deeper to explore how game mechanics &ndash; used in foursquare and elsewhere &ndash; can be used to affect changes in real world behavior and make people think differently about how they experience their physical surroundings.</p>\r\n<p>\r\n	http://vimeo.com/17756354</p>\r\n','2011-05-17 17:00:57','2011-05-17 17:02:39','2035-01-01 00:00:00','2010-12-13 18:00:00',0,NULL,0,''),(72,15,'Instrumenting the City: Data is King with Andreas Weigend',NULL,'<h5 class=\"article_intro\">\r\n	Andreas Weigend loves people and the data they create. He was formerly Chief Scientist at Amazon.com, where he helped build the customer-centric, measurement-focused culture that has become central to Amazon&#39;s success. Since 2003, he has been teaching The Social Data Revolution, Data Mining and E-Business at Stanford, and The Digital Networked Economy at Tsinghua in China.</h5>\r\n<p>\r\n	In his lecture at PICNIC &rsquo;10, Andreas Weigend discusses the importance of data and how it will impact the future of cities. He looks at the city from the perspective of its most crucial element &ndash; people. He explains how the behavior of people is changing based on the data they create and share and the feedback they receive. Andreas shares poignant and often very entertaining examples of how the feedback we receive from devices, websites and other people impacts and shapes our motivations, reactions and decisions.</p>\r\n<p>\r\n	http://vimeo.com/16769612</p>\r\n','2011-05-17 17:03:29','2011-05-17 17:03:29','2035-01-01 00:00:00','2010-12-13 18:02:00',0,NULL,0,''),(73,15,'Paradigm Shift with Reinier de Graaf',NULL,'<h5 class=\"article_intro\">\r\n	In less than ten years the world&rsquo;s largest cities will be exclusively located outside of the West. The metropolis, zenith of Western civilization, will be a property of the third world. Reinier de Graaf joins us at PICNIC &rsquo;10 to look at the consequences of this paradigm shift: What theoretical framework could guide the turbulent growth of cities in emerging regions and what will be the repercussions for the West as a former front runner?</h5>\r\n<p>\r\n	During his lecture, Reinier outlines how the world&rsquo;s largest cities are exploding in the most deprived, least developed, and least democratic countries. He explored what this means to the countries and their citizens who face economic, urban planning and infrastructure challenges that are much more daunting than what we are accustomed to in the West.</p>\r\n<p>\r\n	Reinier de Graaf joined the Office for Metropolitan Architecture (OMA, founded by Rem Koolhaas) in 1996. As Partner of OMA he is responsible for a number of building projects in Europe, Russia and the Middle East. He is also director of AMO, the research and design studio established in 1998 as a counterpart to the architectural practice of OMA. AMO operates in fields such as media, sociology, technology, energy, fashion, publishing and graphic design.</p>\r\n<p>\r\n	http://vimeo.com/16107033</p>','2011-05-17 17:08:47','2011-05-17 17:08:47','2035-01-01 00:00:00','2010-11-25 18:07:00',0,NULL,0,''),(74,21,'Disclaimer',NULL,'<h5 class=\"article_intro\">\r\n	This website has been drafted with the greatest possible care.</h5>\r\n<p>\r\n	Nonetheless, the Amsterdam Cross Media Week Foundation (ACMW) cannot guarantee the absence of any mistakes and/or incorrect information on this website. Please be informed the content of this website is solely intended as general information and the content of this website is not in any way construed as granting any right to any party. Therefore, no party shall have any claim pursuant to the content of this website and ACMW shall not be held liable for any incorrect information on this website. In addition, ACMW is not liable for any virus or other failure on this website.</p>\r\n<p>\r\n	This website contains referrals or links to other websites, which are outside of the domain of this website. These referrals and/or links are selected by ACMW for information purposes only. The Foundation is not responsible and/or liable for any and all content of or availability of these external websites and no referral or link may be deemed to be an approval by ACMW of the content of any external website.</p>\r\n<p>\r\n	ACMW explicitly reserves the right to deny any visitor the access to this website or part(s) thereof. In addition, ACMW may monitor the access of its visitors to this website. Furthermore, ACMW explicitly reserves the right to adjust this website in such way it deems appropriate.</p>\r\n<p>\r\n	Visitors of this website indemnify and hold harmless ACMW and any of ACMW&rsquo;s employees, board members and/or representatives from any claim from any third party pursuant to the use of this website or the content thereof.</p>\r\n<p>\r\n	During your visit, so-called &lsquo;cookies&rsquo; may be automatically saved on the hard disk of your computer. These cookies allow ACMW to further develop our website and adjust it better to the wishes of the visitors of this website. Most internet browsers have the possibility to delete cookies, reject cookies or to have you informed before cookies are saved on your hard disk. Please read the instruction manual and/or help program of your internet browser for further details.</p>\r\n<p>\r\n	Any and all information provided to us through this website shall not be shared with third parties, and regulated as outlined in our privacy policy.</p>\r\n<p>\r\n	The content of this website is subject to copyrights and cannot be used without prior written approval from ACMW. The name and trademark of ACMW are protected as trademarks, as a consequence of which these cannot be used without ACMW&rsquo;s prior written approval. Should you be interested in using the trademarks, please contact ACMW to request approval.</p>\r\n<p>\r\n	To the terms and conditions of this website are subject to the laws of the Netherlands. Any dispute arising out of or pursuant to these terms and conditions shall be settled by the competent courts in Amsterdam, the Netherlands.</p>\r\n','2011-05-18 15:38:09','2011-05-18 15:41:11','2035-01-01 00:00:00','2011-05-18 15:38:09',0,NULL,0,''),(75,21,'Terms and conditions',NULL,'<h5 class=\"article_intro\">\r\n	Below you will find PICNIC&#39;s general terms and conditions for purchasing a ticket to our event.</h5>\r\n<h4>\r\n	Article 1 &ndash; Definitions</h4>\r\n<p>\r\n	<strong>ACMW:</strong> Stichting Amsterdam Cross Media Week, a foundation, incorporated and existing under the laws of the Netherlands, having its principle place of business at Haarlemmerweg 321 B, 1051 LG Amsterdam</p>\r\n<p>\r\n	<strong>PICNIC:</strong> a cross media event named &lsquo;PICNIC&rsquo;, organised by ACMW</p>\r\n<p>\r\n	<strong>General Terms &amp; Conditions:</strong> these general terms &amp; conditions</p>\r\n<p>\r\n	<strong>Participant:</strong> each party, being a natural person or legal person, participating in any way in PICNIC</p>\r\n<h4>\r\n	Article 2 &ndash; Registration fee</h4>\r\n<p>\r\n	2.1 Participants who wish to attend (one or more specific parts of) PICNIC can register for the event online.</p>\r\n<p>\r\n	2.2 For each registration for PICNIC or partial registration, payment of a registration fee is due, unless otherwise agreed between a Participant and ACMW. The registration fees applicable are set forth on www.picnicnetwork.org. Payment of the registration fee can be made online via the PICNIC website of ACMW by iDEAL or credit card through a secure server. Under certain circumstances, the registration fee can also be paid by invoice.</p>\r\n<p>\r\n	2.3 After payment of the registration fee is received by ACMW, the participant will receive a confirmation of its registration. With this confirmation, the participant shall be able to collect its ticket(s) at the reception of PICNIC.</p>\r\n<h4>\r\n	Article 3 &ndash; Participation</h4>\r\n<p>\r\n	3.1 The number of Participants that can attend PICNIC, or parts thereof, is limited. Registrations are handled on a first-come, first-served basis. If the maximum number of Participants of (parts of) PICNIC is reached, ACMW has the right to refuse a registration. Moreover, ACMW retains the right to reject any Participant.</p>\r\n<p>\r\n	3.2 ACMW cannot guarantee a minimum number of Participants to (any part of) the Cross Media Week Event (PICNIC).</p>\r\n<p>\r\n	3.3 ACMW reserves the right to amend and adapt the event&rsquo;s programme and speakers&rsquo; list of PICNIC.</p>\r\n<h4>\r\n	Article 4 &ndash; Liability</h4>\r\n<p>\r\n	4.1 ACMW will under no circumstances be liable for any damages whatsoever arising from the refusal of a registration.</p>\r\n<p>\r\n	4.2 ACMW shall not be liable for any damages of a Participant arising in connection with PICNIC.</p>\r\n<p>\r\n	4.3 Under no circumstance shall ACWM be liable for any damage arising pursuant to a situation of force majeure. The expression &quot;force majeure&quot; shall mean and include any circumstance or occurrence beyond ACMW&#39;s reasonable control - whether or not foreseeable at the time of registration - in consequence of which ACMW cannot reasonably be required to execute its obligations. Such circumstances or occurrences explicitly include but are not restricted to: war, fires, floods, earthquakes, labor disputes, strikes, epidemics, governmental regulations and/or similar acts, embargoes, defaults of suppliers or subcontractors, disruption of electricity supplies, the non-availability of telecommunication services and withdrawal of the Dutch government and/or the city of Amsterdam as sponsor(s) of PICNIC.</p>\r\n<h4>\r\n	Article 5 &ndash; Cancellation and transfer</h4>\r\n<p>\r\n	5.1 Should the Participant be unable to attend PICNIC for any reason, the Participant may transfer the registration to another person within its organization or company at any time by providing written notice to the following email address: info(at)picnicnetwork.org. Please note we do not offer refunds, only the possibility to transfer ownership.</p>\r\n<p>\r\n	5.2 In the event of cancellations, no refunds will be provided by ACMW.</p>','2011-05-18 15:38:37','2011-05-18 15:44:16','2035-01-01 00:00:00','2011-05-18 15:38:37',0,NULL,0,''),(76,21,'Privacy policy',NULL,'<h5 class=\"article_intro\">\r\n	Collected Data and Purpose</h5>\r\n<p>\r\n	Amsterdam Cross Media Week Foundation (ACMW) collects various sorts of personal data. These include your name, address (including e-mail address), and phone number. The Foundation collects such data in order to (i) make it possible for the Foundation to inform you about the event PICNIC &lsquo;10 and additional events organized by the ACMW; (ii) make it possible to register visitors of this website who wish to attend PICNIC &lsquo;10. The Foundation only uses your email address and name to send you a newsletter about PICNIC, which you can opt-out of at any time. ACMW explicitly does not provide any personal data to third parties having a (legal) relationship with ACMW. Any provision by ACMW of personal data to any third party shall only be done after the prior written approval of the individual concerned.</p>\r\n','2011-05-18 15:39:05','2011-05-18 15:45:56','2035-01-01 00:00:00','2011-05-18 15:39:05',0,NULL,0,''),(79,26,'Air France KLM Global Meetings Information','','<p>\r\n	<strong>Event:<em> PICNIC</em></strong></p>\r\n<p>\r\n	Event ID: <strong><em>13239AF</em></strong></p>\r\n<p>\r\n	Valid for travel from<strong> 09/09/2011 to 21/09/2011</strong></p>\r\n<p>\r\n	Event location: <strong>Amsterdam, Netherlands</strong></p>\r\n<p>\r\n	Discounts are applied to a wide range of airfares on all Air France and KLM flights worldwide.</p>\r\n<p>\r\n	-10% on a range of published unrestricted public fares and -5% discount on a large range of restricted</p>\r\n<p>\r\n	fares.</p>\r\n<p>\r\n	Discounts up to -47%* are offered on domestic flights in Metropolitan France.</p>\r\n<p>\r\n	Use the website of this event or visit www.airfranceklm-globalmeetings.com to</p>\r\n<p>\r\n	<strong>&bull; access the preferential fares granted for this event,</strong></p>\r\n<p>\r\n	<strong>&bull; make your booking,</strong></p>\r\n<p>\r\n	<strong>&bull; issue your electronic ticket*,</strong></p>\r\n<p>\r\n	<strong>&bull; select your seat**,</strong></p>\r\n<p>\r\n	<strong>&bull; and print your boarding card**.</strong></p>\r\n<p>\r\n	If you buy your ticket via AIR FRANCE &amp; KLM Global Meetings website, your electronic ticket will carry</p>\r\n<p>\r\n	a special mention which justifies the application of the preferential fares.</p>\r\n<p>\r\n	Should you prefer to process your reservations and ticket-purchase directly with an Air France and</p>\r\n<p>\r\n	KLM sales outlet, &lt;u&gt;you must keep this current document which serves to justify the application of the&lt;/u&gt;</p>\r\n<p>\r\n	&lt;u&gt;preferential airfares&lt;/u&gt;</p>\r\n<p>\r\n	Keep the document to justify the special fares with you as you may be asked for it at any point</p>\r\n<p>\r\n	of your journey.</p>\r\n<p>\r\n	To locate your nearest Air France and KLM sales point, visit: www.airfrance.com or www.klm.com.</p>\r\n<p>\r\n	You will need to quote the reference given above which is registered in AIR FRANCE KLM data into</p>\r\n<p>\r\n	GDS Amadeus: GGAIRAFEVENTNEGO or GGAIRAFGLOBALMEETINGS</p>\r\n<p>\r\n	Frequent flyer / loyalty programs of Air France and KLM partner airlines are credited with &quot;miles&quot; when</p>\r\n<p>\r\n	Air France or KLM flights are used.</p>\r\n<p>\r\n	* not available in certain countries</p>\r\n<p>\r\n	** subject to conditions</p>\r\n<p>\r\n	<em>Air France, French Limited Company with a capital of 1,901,231,625 euros</em></p>\r\n<p>\r\n	<em>Head Office: 45, rue de Paris, 95747 Roissy CDG cedex, France</em></p>\r\n<p>\r\n	<em>Registered on the Trade and Companies register in Bobigny under no. 420 495 178</em></p>\r\n<p>\r\n	<em>Koninklijke Luchtvaart Maatschappij n.v. (also known as KLM Royal Dutch Airlines)</em></p>\r\n<p>\r\n	<em>Head Office: Amsterdamseweg 55, 1182 GP Amstelveen, the Netherlands</em></p>\r\n<p>\r\n	Registered No 33014286</p>\r\n<p>\r\n	Edited by AIR FRANCE &amp; KLM Global Meetings: JH.VC</p>\r\n','2011-05-23 13:10:46','2011-05-24 08:40:06','2035-01-01 00:00:00','2011-05-23 13:10:00',0,NULL,0,'Air France KLM Global Meetings Information');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_notifications`
--

DROP TABLE IF EXISTS `paypal_notifications`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `paypal_notifications` (
  `id` int(11) NOT NULL auto_increment,
  `booking_id` int(11) default NULL,
  `params` text,
  `status` varchar(255) default NULL,
  `transaction_id` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `paypal_notifications`
--

LOCK TABLES `paypal_notifications` WRITE;
/*!40000 ALTER TABLE `paypal_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permalinks`
--

DROP TABLE IF EXISTS `permalinks`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `permalinks` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `model_type` varchar(255) collate utf8_unicode_ci default NULL,
  `model_id` int(11) default NULL,
  `slug` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `permalinks`
--

LOCK TABLES `permalinks` WRITE;
/*!40000 ALTER TABLE `permalinks` DISABLE KEYS */;
INSERT INTO `permalinks` VALUES (1,'about-us','Section',1,'about_us'),(4,'picnic11-section','Section',3,'picnic11'),(5,'picnic11-intro','Section',4,NULL),(7,'festival','Page',2,'what_is_picnic'),(8,'festival-experience','Page',3,NULL),(9,'team','Page',4,'the_team'),(10,'advisors','Page',5,'advisors'),(11,'location','Page',6,NULL),(16,'picnic11-registration','Section',7,NULL),(17,'history','Page',10,NULL),(22,'press','Section',9,'press-room'),(23,'contact','Page',14,'contact'),(25,'logos','Page',16,NULL),(27,'press-releases','Section',10,NULL),(28,'press-release-1','Page',18,NULL),(29,'press-release-2','Page',19,NULL),(30,'press-release-3','Page',20,NULL),(31,'photos-and-videos','Page',21,NULL),(32,'english-version','Page',22,NULL),(33,'boilerplate','Section',11,NULL),(34,'nederlandse-versie','Page',23,NULL),(36,'about','Page',24,'press_room'),(38,'press-clippings','Page',25,NULL),(39,'picnic11-speakers','Page',26,'picnic11_speakers'),(43,'history-1','Section',14,NULL),(50,'1-day-ticket','Page',35,'registration'),(57,'news','Section',15,'news'),(64,'welcome-1','Page',48,'overview'),(76,'visiting-amsterdam','Section',20,NULL),(77,'travel-and-accommodations','Page',56,NULL),(78,'themes','Page',57,'themes'),(79,'participants','Page',58,NULL),(80,'green-challenge','Page',59,NULL),(81,'after-picnic','Page',60,NULL),(82,'getting-to-the-venue','Page',61,NULL),(83,'spotlight-on-maxclass','Page',62,NULL),(84,'cure-violence-portrait-of-an-epidemic','Page',63,NULL),(85,'help-fairphone-celebrate-its-first-birthday-on-17-march','Page',64,NULL),(86,'attend-ice-amsterdam-2011-with-a-special-discount-from-picnic','Page',65,NULL),(87,'apps-for-amsterdam-starts-a-local-data-revolution','Page',66,NULL),(88,'calling-all-programmers---apps-for-amsterdam-wants-you','Page',67,NULL),(89,'we-are-now-entering-the-era-of-sustainism','Page',68,NULL),(90,'winners-of-designers-artists-4-genomics-award-announced','Page',69,NULL),(91,'id-award-vote-for-picnic-co-founder-bas-verhart','Page',70,NULL),(92,'social-cities-with-dennis-crowley','Page',71,NULL),(93,'instrumenting-the-city-data-is-king-with-andreas-weigend','Page',72,NULL),(94,'paradigm-shift-with-reinier-de-graaf','Page',73,NULL),(95,'legal','Section',21,NULL),(96,'disclaimer','Page',74,NULL),(97,'terms-and-conditions','Page',75,NULL),(98,'privacy-policy','Page',76,NULL),(102,'sponsors','Section',23,NULL),(142,'si-wilkins','Member',1,NULL),(143,'andy-mayer','Member',2,NULL),(144,'nicola-mayer','Member',3,NULL),(145,'rich-wells','Member',4,NULL),(146,'ian-mooney','Member',5,NULL),(147,'rob-parvin','Member',6,NULL),(148,'matt-atkins','Member',7,NULL),(150,'marleen-stikker','Member',9,NULL),(151,'bas-vehart','Member',10,NULL),(152,'kitty-leering','Member',11,NULL),(153,'annemarie-van-asselen','Member',12,NULL),(154,'marcel-kampman','Member',13,NULL),(155,'alrik-koudenburg','Member',14,NULL),(156,'gentry-underwood','Member',15,NULL),(157,'advisor-2','Member',16,NULL),(158,'advisor-3','Member',17,NULL),(159,'advisor-4','Member',18,NULL),(160,'advisor-5','Member',19,NULL),(161,'advisor-6','Member',20,NULL),(162,'correspondent-1','Member',21,NULL),(163,'correspondent-2','Member',22,NULL),(164,'correspondent-3','Member',23,NULL),(165,'correspondent-4','Member',24,NULL),(166,'correspondent-5','Member',25,NULL),(167,'correspondent-6','Member',26,NULL),(168,'speaker-1','Member',27,NULL),(169,'speaker-2','Member',28,NULL),(170,'speaker-3','Member',29,NULL),(171,'speaker-4','Member',30,NULL),(172,'speaker-5','Member',31,NULL),(173,'speaker-6','Member',32,NULL),(174,'todd-savage','Member',33,NULL),(175,'jan-willem-blom','Member',34,NULL),(176,'mirjam-flik','Member',35,NULL),(177,'liz-keel','Member',36,NULL),(178,'rene-van-schendel','Member',37,NULL),(180,'matt-atkins-1','Member',39,NULL),(181,'richard-wells','Member',40,NULL),(182,'air-france-klm-global-meetings-information','Page',79,'air-france-klm-global-meetings-information'),(183,'air-france','Section',26,NULL);
/*!40000 ALTER TABLE `permalinks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photo_albums`
--

DROP TABLE IF EXISTS `photo_albums`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `photo_albums` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `attachable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `attachable_id` int(11) default NULL,
  `system_album` tinyint(1) default '0',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_photo_albums_on_attachable_id` (`attachable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'CMS photos','',NULL,1,'2011-04-28 11:18:53','2011-05-10 15:49:25'),(2,'Another album','Member',2,1,'2011-05-10 15:50:08','2011-05-10 15:50:08'),(3,'Partner logos','Member',2,1,'2011-05-11 10:42:31','2011-05-11 10:42:53'),(4,'PICNIC logos','Member',2,1,'2011-05-11 10:43:06','2011-05-11 10:43:06');
/*!40000 ALTER TABLE `photo_albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `photos`
--

DROP TABLE IF EXISTS `photos`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `photos` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  `image_uid` varchar(255) collate utf8_unicode_ci default NULL,
  `member_id` int(11) default NULL,
  `attachable_id` int(11) default NULL,
  `attachable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `photo_album_id` int(11) default NULL,
  `delta` tinyint(1) default '1',
  PRIMARY KEY  (`id`),
  KEY `index_photos_on_member_id` (`member_id`),
  KEY `index_photos_on_attachable_id` (`attachable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (2,'Holding image','','2011/05/03/07_25_04_590_holding.png',2,NULL,NULL,'2011-05-03 14:25:04','2011-05-19 14:17:47',1,0),(5,'Festival_d961c0b77f.jpg',NULL,'2011/05/03/07_53_44_220_Festival_d961c0b77f.jpg',2,NULL,NULL,'2011-05-03 14:53:44','2011-05-16 11:03:21',1,0),(6,'Mark_Bun_16743b5844.jpg',NULL,'2011/05/03/07_54_33_54_Mark_Bun_16743b5844.jpg',2,NULL,NULL,'2011-05-03 14:54:33','2011-05-20 14:41:33',1,0),(7,'screen-capture-41.png',NULL,'2011/05/05/05_15_13_117_screen_capture_41.png',2,NULL,NULL,'2011-05-05 12:15:13','2011-05-16 11:34:21',1,0),(8,'screen-capture-43.png',NULL,'2011/05/05/05_18_47_123_screen_capture_43.png',2,NULL,NULL,'2011-05-05 12:18:47','2011-05-19 14:23:56',1,0),(9,'Test','Test','2011/05/11/01_21_20_367_screen_capture_44.png',2,NULL,NULL,'2011-05-11 08:21:20','2011-05-11 08:21:20',2,0),(11,'PICNIC logo','','2011/05/11/03_44_10_982_PICNIC_Heart_WAYB.jpg',2,NULL,NULL,'2011-05-11 10:44:10','2011-05-11 10:44:10',4,0),(12,'download.jpeg',NULL,'2011/05/17/09_10_26_564_download.jpeg',4,NULL,NULL,'2011-05-17 16:10:26','2011-05-19 14:55:12',1,0),(13,'MaxClass_f30c36ef1a.jpg',NULL,'2011/05/17/09_12_08_579_MaxClass_f30c36ef1a.jpg',4,NULL,NULL,'2011-05-17 16:12:08','2011-05-17 16:12:08',1,0),(14,'Untitled-1.jpg',NULL,'2011/05/17/09_30_21_676_Untitled_1.jpg',4,NULL,NULL,'2011-05-17 16:30:21','2011-05-17 16:30:21',1,0),(15,'maxclass.jpg',NULL,'2011/05/17/09_34_27_923_maxclass.jpg',4,NULL,NULL,'2011-05-17 16:34:27','2011-05-17 16:34:27',1,0),(16,'DSC_1202_0.jpg',NULL,'2011/05/17/09_39_42_553_DSC_1202_0.jpg',4,NULL,NULL,'2011-05-17 16:39:42','2011-05-17 16:39:42',1,0),(17,'Global Meetings.jpg',NULL,'2011/05/23/05_54_58_468_Global_Meetings.jpg',34,NULL,NULL,'2011-05-23 12:54:58','2011-05-23 12:54:58',1,0),(18,'Air France - KLM.jpg',NULL,'2011/05/23/05_55_03_373_Air_France_KLM.jpg',34,NULL,NULL,'2011-05-23 12:55:03','2011-05-23 12:55:03',1,0);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points_events`
--

DROP TABLE IF EXISTS `points_events`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `points_events` (
  `id` int(11) NOT NULL auto_increment,
  `slug` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `points` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `points_events`
--

LOCK TABLES `points_events` WRITE;
/*!40000 ALTER TABLE `points_events` DISABLE KEYS */;
INSERT INTO `points_events` VALUES (1,'like_my_shout','Having your discussion \"thumbed up\"',1,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(2,'register','Registering for the first time',2,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(3,'dislike_my_shout','Having your discussion \"thumbed down\"',-1,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(4,'rate_shout','Rating someone else\'s discussion',1,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(5,'first_comment_on_my_shout','Having comments on your discussion',2,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(6,'share_shout','Sharing a discussion (by email, Facebook or Twitter)',2,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(7,'share_my_shout','Having your discussion shared by others',5,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(8,'post_comment','Adding a comment to a discussion',5,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(9,'friend_on_fb','Having friends on Facebook also on PICNIC',5,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(10,'post_shout','Posting a new discussion',10,'2011-05-23 14:39:08','2011-05-23 14:39:08');
/*!40000 ALTER TABLE `points_events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `points_transfers`
--

DROP TABLE IF EXISTS `points_transfers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `points_transfers` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `points` int(11) default NULL,
  `attachable_id` int(11) default NULL,
  `attachable_type` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `points_event_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_points_transfers_on_member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `points_transfers`
--

LOCK TABLES `points_transfers` WRITE;
/*!40000 ALTER TABLE `points_transfers` DISABLE KEYS */;
INSERT INTO `points_transfers` VALUES (31,1,2,1,'Member','2011-04-28 11:18:54','2011-05-24 10:53:05',2),(32,2,2,2,'Member','2011-04-28 07:18:54','2011-05-24 10:53:06',2),(33,3,2,3,'Member','2011-04-28 11:18:54','2011-05-24 10:53:06',2),(34,4,2,4,'Member','2011-04-28 10:18:54','2011-05-24 10:53:06',2),(35,5,2,5,'Member','2011-04-28 10:18:54','2011-05-24 10:53:06',2),(36,6,2,6,'Member','2011-04-28 11:18:54','2011-05-24 10:53:06',2),(37,7,2,7,'Member','2011-04-28 11:18:54','2011-05-24 10:53:06',2),(38,9,2,9,'Member','2011-05-05 09:11:46','2011-05-24 10:53:06',2),(39,10,2,10,'Member','2011-05-05 09:11:46','2011-05-24 10:53:06',2),(40,11,2,11,'Member','2011-05-05 09:11:46','2011-05-24 10:53:06',2),(41,12,2,12,'Member','2011-05-05 09:11:47','2011-05-24 10:53:06',2),(42,13,2,13,'Member','2011-05-05 09:11:47','2011-05-24 10:53:06',2),(43,14,2,14,'Member','2011-05-05 09:11:47','2011-05-24 10:53:06',2),(44,15,2,15,'Member','2011-05-05 09:14:54','2011-05-24 10:53:06',2),(45,16,2,16,'Member','2011-05-05 09:14:54','2011-05-24 10:53:06',2),(46,17,2,17,'Member','2011-05-05 09:14:54','2011-05-24 10:53:06',2),(47,18,2,18,'Member','2011-05-05 09:14:54','2011-05-24 10:53:06',2),(48,19,2,19,'Member','2011-05-05 09:14:54','2011-05-24 10:53:06',2),(49,20,2,20,'Member','2011-05-05 09:14:54','2011-05-24 10:53:06',2),(50,21,2,21,'Member','2011-05-05 09:18:19','2011-05-24 10:53:07',2),(51,22,2,22,'Member','2011-05-05 09:18:19','2011-05-24 10:53:07',2),(52,23,2,23,'Member','2011-05-05 09:18:19','2011-05-24 10:53:07',2),(53,24,2,24,'Member','2011-05-05 09:18:20','2011-05-24 10:53:07',2),(54,25,2,25,'Member','2011-05-05 09:18:20','2011-05-24 10:53:07',2),(55,26,2,26,'Member','2011-05-05 09:18:20','2011-05-24 10:53:07',2),(56,27,2,27,'Member','2011-05-05 12:32:54','2011-05-24 10:53:07',2),(57,28,2,28,'Member','2011-05-05 12:32:54','2011-05-24 10:53:07',2),(58,29,2,29,'Member','2011-05-05 12:32:54','2011-05-24 10:53:07',2),(59,30,2,30,'Member','2011-05-05 12:32:54','2011-05-24 10:53:07',2),(60,31,2,31,'Member','2011-05-05 12:32:55','2011-05-24 10:53:07',2),(61,32,2,32,'Member','2011-05-05 12:32:55','2011-05-24 10:53:07',2),(62,33,2,33,'Member','2011-05-11 09:30:16','2011-05-24 10:53:08',2),(63,34,2,34,'Member','2011-05-16 16:17:56','2011-05-24 10:53:08',2),(64,35,2,35,'Member','2011-05-18 15:19:56','2011-05-24 10:53:08',2),(65,36,2,36,'Member','2011-05-18 15:22:28','2011-05-24 10:53:08',2),(66,37,2,37,'Member','2011-05-18 15:25:30','2011-05-24 10:53:08',2),(67,39,2,39,'Member','2011-05-19 13:40:56','2011-05-24 10:53:08',2),(68,40,2,40,'Member','2011-05-21 18:22:45','2011-05-24 10:53:08',2),(69,33,5,3,'WallPost','2011-05-20 08:35:44','2011-05-24 10:53:08',8),(70,2,5,4,'WallPost','2011-05-20 08:37:37','2011-05-24 10:53:08',8),(71,33,5,5,'WallPost','2011-05-20 08:39:24','2011-05-24 10:53:08',8),(72,2,5,6,'WallPost','2011-05-20 08:59:09','2011-05-24 10:53:08',8),(73,2,10,8,'Shout','2011-05-18 16:52:40','2011-05-24 10:53:08',10),(74,2,10,9,'Shout','2011-05-18 16:54:00','2011-05-24 10:53:08',10),(75,2,10,10,'Shout','2011-05-18 16:54:56','2011-05-24 10:53:09',10);
/*!40000 ALTER TABLE `points_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `rateable_id` int(11) default NULL,
  `rateable_type` varchar(255) default NULL,
  `score` int(11) default '1',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_ratings_on_member_id` (`member_id`),
  KEY `index_ratings_on_rateable_id_and_rateable_type` (`rateable_id`,`rateable_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,2,10,'Shout',1,'2011-05-23 08:39:43','2011-05-23 08:39:46');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) collate utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20091016104635'),('20091016120409'),('20091106165316'),('20100210115949'),('20100305173427'),('20100325163719'),('20100407105403'),('20100407105419'),('20100407144339'),('20100408145821'),('20100408162026'),('20100409093733'),('20100409141224'),('20100409143244'),('20100409143304'),('20100409160300'),('20100409160456'),('20100415145447'),('20100415154222'),('20100416115334'),('20100416151432'),('20100416155503'),('20100421100955'),('20100421101145'),('20100421120435'),('20100422091505'),('20100422142610'),('20100423123257'),('20100423123315'),('20100521112757'),('20100524122600'),('20100524153922'),('20100524163512'),('20100525102621'),('20100527100007'),('20100527115352'),('20100601092537'),('20100601094912'),('20100601142242'),('20100601152053'),('20100602090247'),('20100602112131'),('20100602114556'),('20100608101828'),('20100608135949'),('20100609084428'),('20100610132813'),('20100623115210'),('20100714085900'),('20100714090928'),('20100715094246'),('20100715144911'),('20100716105516'),('20100720131711'),('20100727134606'),('20100803135018'),('20100803141623'),('20100805095610'),('20100809151249'),('20100810082603'),('20100812140336'),('20100825134535'),('20100826094542'),('20101005151730'),('20101013133204'),('20101021165624'),('20101028141828'),('20101215120207'),('20110107150714'),('20110110113046'),('20110112163551'),('20110113145943'),('20110128112444'),('20110207164351'),('20110214162012'),('20110215120230'),('20110218153159'),('20110224151746'),('20110228123442'),('20110228124555'),('20110314174103'),('20110401111953'),('20110407120146'),('20110419094000'),('20110419094110'),('20110428095550'),('20110428150331'),('20110503143045'),('20110503153808'),('20110504112720'),('20110505110943'),('20110506091301'),('20110506104655'),('20110506143819'),('20110511153538'),('20110512104523'),('20110516115726'),('20110516134238'),('20110516151939'),('20110517142216'),('20110523153124'),('20110524091638');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sections`
--

DROP TABLE IF EXISTS `sections`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sections` (
  `id` int(11) NOT NULL auto_increment,
  `parent_id` int(11) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `weight` int(11) default '0',
  `view` varchar(255) collate utf8_unicode_ci default 'normal',
  `delta` tinyint(1) NOT NULL default '1',
  `description` text collate utf8_unicode_ci,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `photo_id` int(11) default NULL,
  `small_name` varchar(255) collate utf8_unicode_ci default NULL,
  `hidden` tinyint(1) default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'About',200,'first_page',0,'','2011-04-28 11:18:53','2011-05-16 12:23:23',NULL,'',0),(3,NULL,'Festival',1,'first_page',0,'','2011-04-28 11:18:54','2011-05-16 12:16:17',NULL,'',0),(4,3,'PICNIC Festival 2011',10,'first_page',0,'','2011-04-28 11:20:49','2011-05-20 08:55:38',NULL,'',0),(7,3,'Registration',30,'first_page',0,'','2011-05-05 09:54:41','2011-05-20 08:56:22',NULL,'',0),(9,1,'Press room',4,'first_page',0,'','2011-05-05 10:45:37','2011-05-11 11:19:19',NULL,'Press room',0),(10,9,'Press releases',0,'first_page',0,'','2011-05-05 11:10:01','2011-05-11 11:32:35',NULL,'',0),(11,9,'Boilerplate',2,'first_page',0,'','2011-05-05 11:23:07','2011-05-05 12:08:04',NULL,'',0),(14,1,'History',3,'first_page',0,'','2011-05-05 15:23:19','2011-05-17 11:29:33',NULL,'',0),(15,3,'News',0,'news_view',0,'','2011-05-11 08:27:56','2011-05-18 11:24:58',NULL,'',0),(20,3,'Visiting Amsterdam',50,'first_page',0,'','2011-05-16 10:52:24','2011-05-20 08:55:59',NULL,'',0),(21,1,'Legal',990,'first_page',0,'','2011-05-18 15:36:20','2011-05-18 21:55:33',NULL,'',0),(23,3,'Sponsors',40,'first_page',0,'','2011-05-20 08:53:52','2011-05-20 08:54:21',NULL,'',0),(26,NULL,'Hidden Section',999,'normal',1,'','2011-05-23 14:54:16','2011-05-24 12:17:30',NULL,'',1);
/*!40000 ALTER TABLE `sections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `short_urls`
--

DROP TABLE IF EXISTS `short_urls`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `short_urls` (
  `id` int(11) NOT NULL auto_increment,
  `long` text collate utf8_unicode_ci,
  `short` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `short_urls`
--

LOCK TABLES `short_urls` WRITE;
/*!40000 ALTER TABLE `short_urls` DISABLE KEYS */;
/*!40000 ALTER TABLE `short_urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shouts`
--

DROP TABLE IF EXISTS `shouts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `shouts` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `attachable_id` int(11) default NULL,
  `attachable_type` varchar(255) default NULL,
  `text` text,
  `delta` tinyint(1) default '1',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `recipient_type` varchar(255) default NULL,
  `recipient_id` int(11) default NULL,
  `title` varchar(255) default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_shouts_on_member_id` (`member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `shouts`
--

LOCK TABLES `shouts` WRITE;
/*!40000 ALTER TABLE `shouts` DISABLE KEYS */;
INSERT INTO `shouts` VALUES (8,2,NULL,NULL,'What do people think of the first iteration of the Club area? What direction should we take?',0,'2011-05-18 16:52:40','2011-05-20 08:35:46',NULL,NULL,NULL),(9,2,NULL,NULL,'If you are interested in being a beta tester. Please can you get in touch. Thanks!',0,'2011-05-18 16:54:00','2011-05-18 16:54:00',NULL,NULL,NULL),(10,2,8,'Video','Check out this awesome video about explosives and art. My two  favourite subjects!',0,'2011-05-18 16:54:56','2011-05-18 16:54:56',NULL,NULL,NULL);
/*!40000 ALTER TABLE `shouts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `snippets`
--

DROP TABLE IF EXISTS `snippets`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `snippets` (
  `id` int(11) NOT NULL auto_increment,
  `item_type` varchar(255) collate utf8_unicode_ci default NULL,
  `item_id` int(11) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `text` text collate utf8_unicode_ci,
  `delta` tinyint(1) default '1',
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_snippets_on_item_id_and_item_type` (`item_id`,`item_type`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `snippets`
--

LOCK TABLES `snippets` WRITE;
/*!40000 ALTER TABLE `snippets` DISABLE KEYS */;
INSERT INTO `snippets` VALUES (5,'Page',6,'call_to_action','<p>\r\n	Just a short ferry ride to the NDSM Wharf for PICNIC Festival 2011.</p>\r\n',1,'2011-05-06 15:04:45','2011-05-19 14:23:56'),(10,'Page',2,'photo_caption','<p>\r\n	What are <em>you</em> bringing?</p>\r\n',1,'2011-05-10 15:04:51','2011-05-20 14:41:55'),(18,'Page',58,'pull_quote','<p>\r\n	<strong>A really rich programme and the smartest, most lively people in Europe in one place. </strong>--David Rowan, editor, WIRED Magazine (UK)</p>\r\n',1,'2011-05-16 11:41:26','2011-05-16 11:53:10'),(19,'Page',48,'call_to_action','<p>\r\n	Mark your calendar now to attend PICNIC Festival 2011 from 14 to 16 September in Amsterdam.</p>\r\n',1,'2011-05-16 11:55:36','2011-05-16 11:55:36'),(20,'Page',64,'call_to_action','<p>\r\n	Show your support for FairPhone and join the festivities on 17 March! Just send an email to <a href=\"mailto:events@waag.org\" target=\"_blank\">events(at)waag.org</a> to reserve your place.</p>\r\n',1,'2011-05-17 16:37:26','2011-05-17 16:37:26'),(21,'Page',65,'call_to_action','<p>\r\n	<a href=\"http://www.iceamsterdam.com/register\" target=\"_blank\">Register now</a> using the PICNIC discount code (ok3301) and get 25% off any and all tickets</p>\r\n',1,'2011-05-17 16:43:51','2011-05-17 16:43:51'),(22,'Page',68,'pull_quote','<p>\r\n	&quot;Sustainism is the new ecology of our networked world.&quot;</p>\r\n',1,'2011-05-17 16:53:56','2011-05-17 16:54:16'),(23,'Page',68,'call_to_action','<p>\r\n	Read their recent coverage in the New York Times:</p>\r\n<p>\r\n	<a href=\"http://www.nytimes.com/2011/01/10/arts/10iht-design10.html\" target=\"_blank\">Sustainism: It&rsquo;s Got a Name, Now Do It!</a></p>\r\n',1,'2011-05-17 16:53:56','2011-05-17 16:53:56'),(24,'Page',69,'call_to_action','<p>\r\n	<a href=\"http://www.waag.org/pers/75080\" target=\"_blank\">Read the full press release on the Waag Society website</a></p>\r\n',1,'2011-05-17 16:57:03','2011-05-17 16:57:03'),(25,'Page',70,'call_to_action','<p>\r\n	<a href=\"http://www.thnk.org/blog/\" target=\"_blank\">Visit the THNK website to learn more</a></p>\r\n',1,'2011-05-17 17:00:00','2011-05-17 17:00:00');
/*!40000 ALTER TABLE `snippets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL auto_increment,
  `text` text collate utf8_unicode_ci,
  `member_id` int(11) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `taggings`
--

DROP TABLE IF EXISTS `taggings`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `taggings` (
  `id` int(11) NOT NULL auto_increment,
  `tag_id` int(11) default NULL,
  `taggable_id` int(11) default NULL,
  `tagger_id` int(11) default NULL,
  `tagger_type` varchar(255) collate utf8_unicode_ci default NULL,
  `taggable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `context` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_taggings_on_tag_id` (`tag_id`),
  KEY `index_taggings_on_taggable_id_and_taggable_type_and_context` (`taggable_id`,`taggable_type`,`context`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (40,9,2,NULL,NULL,'Member','tags','2011-05-18 16:51:00'),(41,10,8,NULL,NULL,'Shout','tags','2011-05-18 16:52:40'),(42,11,9,NULL,NULL,'Shout','tags','2011-05-18 16:54:00'),(43,12,10,NULL,NULL,'Shout','tags','2011-05-18 16:54:56'),(44,13,39,NULL,NULL,'Member','tags','2011-05-19 13:42:04'),(45,14,39,NULL,NULL,'Member','tags','2011-05-19 18:09:00'),(47,16,2,NULL,NULL,'Member','tags','2011-05-20 08:57:49'),(48,17,2,NULL,NULL,'Member','tags','2011-05-20 08:58:11');
/*!40000 ALTER TABLE `taggings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `image_uid` varchar(255) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Mobility',NULL,'Etiam at risus et justo dignissim congue. Donec congue lacinia dui, a porttitor lectus condimentum laoreet. Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit.'),(2,'Sustainability',NULL,'Sed auctor neque eu tellus rhoncus ut eleifend nibh porttitor. Ut in nulla enim. Phasellus molestie magna non est bibendum non venenatis nisl tempor. Suspendisse dictum feugiat nisl ut dapibus. Mauris iaculis porttitor posuere. Praesent id metus massa, ut blandit odio. Proin quis tortor orci. Etiam at risus et justo dignissim congue. Donec congue lacinia dui, a porttitor lectus condimentum laoreet. Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo.'),(3,'Health',NULL,'In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor.'),(4,'Community',NULL,'Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula egestas tincidunt. Nullam risus magna, ornare vitae varius eget, scelerisque a libero. Morbi eu porttitor ipsum. Nullam lorem nisi, posuere quis volutpat eget, luctus nec massa. Pellentesque aliquam lacinia tellus sit amet bibendum. Ut posuere justo.'),(5,'Urban planning',NULL,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien.'),(6,'Connectivity',NULL,'Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus.'),(7,'Shelter',NULL,'Vestibulum mollis mauris enim. Morbi euismod magna ac lorem rutrum elementum. Donec viverra auctor lobortis. Pellentesque eu est a nulla placerat dignissim. Morbi a enim in magna semper bibendum. Etiam scelerisque, nunc ac egestas consequat, odio nibh euismod nulla, eget auctor orci nibh vel nisi. Aliquam erat volutpat. Mauris vel neque sit amet nunc gravida congue sed sit amet purus. Quisque lacus quam, egestas ac tincidunt a, lacinia vel velit. Aenean facilisis nulla vitae urna tincidunt congue sed ut dui. Morbi malesuada nulla nec purus convallis.'),(8,'Business',NULL,'Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam.Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam.Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam.'),(9,'fencing',NULL,NULL),(10,'picnic11',NULL,NULL),(11,'testing',NULL,NULL),(12,'video',NULL,NULL),(13,'web',NULL,NULL),(14,'ruby',NULL,NULL),(15,'farming',NULL,NULL),(16,'arduino',NULL,NULL),(17,'fatherhood',NULL,NULL),(18,'hello',NULL,NULL);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `urls`
--

DROP TABLE IF EXISTS `urls`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `urls` (
  `id` int(11) NOT NULL auto_increment,
  `url` text,
  `host` varchar(255) default NULL,
  `attachable_id` int(11) default NULL,
  `attachable_type` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `urls`
--

LOCK TABLES `urls` WRITE;
/*!40000 ALTER TABLE `urls` DISABLE KEYS */;
INSERT INTO `urls` VALUES (1,'twitter.com/matkins','twitter',7,'Member','2011-05-18 12:57:32','2011-05-18 12:57:32'),(2,'matkins.co.uk','matkins.co',7,'Member','2011-05-18 12:57:40','2011-05-18 12:57:40'),(3,'www.yoomee.com','yoomee',2,'Member','2011-05-18 13:48:39','2011-05-18 13:48:39'),(5,'www.kampman.nl','kampman',13,'Member','2011-05-18 14:44:56','2011-05-18 14:44:56'),(6,'http://www.flavors.me/andymayer','flavors',38,'Member','2011-05-18 16:07:13','2011-05-18 16:07:13'),(7,'http://www.yoomee.com','yoomee',38,'Member','2011-05-18 16:07:13','2011-05-18 16:07:13'),(8,'http://www.matkins.co.uk','matkins.co',39,'Member','2011-05-19 13:40:56','2011-05-19 13:40:56');
/*!40000 ALTER TABLE `urls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venues`
--

DROP TABLE IF EXISTS `venues`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `venues` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `venues`
--

LOCK TABLES `venues` WRITE;
/*!40000 ALTER TABLE `venues` DISABLE KEYS */;
INSERT INTO `venues` VALUES (1,'Venue 1'),(2,'Venue 2'),(3,'Venue 3'),(4,'Venue 4'),(5,'Venue 5'),(6,'Venue 6');
/*!40000 ALTER TABLE `venues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `videos`
--

DROP TABLE IF EXISTS `videos`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `videos` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `description` text collate utf8_unicode_ci,
  `url` varchar(255) collate utf8_unicode_ci default NULL,
  `html` text collate utf8_unicode_ci,
  `image_uid` varchar(255) collate utf8_unicode_ci default NULL,
  `member_id` int(11) default NULL,
  `attachable_id` int(11) default NULL,
  `attachable_type` varchar(255) collate utf8_unicode_ci default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  `delta` tinyint(1) default '1',
  PRIMARY KEY  (`id`),
  KEY `index_videos_on_member_id` (`member_id`),
  KEY `index_videos_on_attachable_id` (`attachable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (8,'Orelha Negra - M.I.R.I.A.M. X Vhils',NULL,'http://www.youtube.com/watch?v=t6FU1Fvn9Nk','\n        <object width=\"425\" height=\"350\">\n          <param name=\"movie\" value=\"http://www.youtube.com/v/t6FU1Fvn9Nk\"></param>\n          <param name=\"wmode\" value=\"transparent\"></param>\n          <embed src=\"http://www.youtube.com/v/t6FU1Fvn9Nk\" \n            type=\"application/x-shockwave-flash\" wmode=\"transparent\" \n            width=\"425\" height=\"300\">\n          </embed>\n        </object>\n      ','2011/05/18/09_54_56_737_file',2,NULL,NULL,'2011-05-18 16:54:56','2011-05-18 16:54:56',0);
/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wall_posts`
--

DROP TABLE IF EXISTS `wall_posts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `wall_posts` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `wall_id` int(11) default NULL,
  `text` text,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_wall_posts_on_wall_id` (`wall_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wall_posts`
--

LOCK TABLES `wall_posts` WRITE;
/*!40000 ALTER TABLE `wall_posts` DISABLE KEYS */;
INSERT INTO `wall_posts` VALUES (3,33,8,'I didn\'t really notice the tags/themes to the far right... Also maybe restrict themes to a pulldown menu?','2011-05-20 08:35:44','2011-05-20 08:35:44'),(4,2,8,'Hi Todd. Please ignore this! Just testing! Also, the Club area is about to change a lot today based in feedback from Marcel. Also the emails you get will look a lot better.','2011-05-20 08:37:37','2011-05-20 08:37:37'),(5,33,8,'No problem. I\'m just testing too! But will get out of here now then...','2011-05-20 08:39:24','2011-05-20 08:39:24'),(6,2,8,'Things will change a lot here by the end of today. Thanks for playing!','2011-05-20 08:59:09','2011-05-20 08:59:09');
/*!40000 ALTER TABLE `wall_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `walls`
--

DROP TABLE IF EXISTS `walls`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `walls` (
  `id` int(11) NOT NULL auto_increment,
  `attachable_id` int(11) default NULL,
  `attachable_type` varchar(255) default NULL,
  `name` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `index_walls_on_attachable_id` (`attachable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `walls`
--

LOCK TABLES `walls` WRITE;
/*!40000 ALTER TABLE `walls` DISABLE KEYS */;
INSERT INTO `walls` VALUES (8,8,'Shout',NULL,'2011-05-18 16:52:50','2011-05-18 16:52:50'),(9,10,'Shout',NULL,'2011-05-19 08:49:24','2011-05-19 08:49:24'),(10,9,'Shout',NULL,'2011-05-19 12:31:33','2011-05-19 12:31:33');
/*!40000 ALTER TABLE `walls` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-05-24 12:19:12
