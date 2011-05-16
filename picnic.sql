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
INSERT INTO `adverts` VALUES (1,'PICNIC11 Early Bird Booking','http://picnic.yoomee.com/picnic11','2011/05/06/08_38_29_682_download.jpeg',133,NULL,7,NULL,NULL,NULL,1,'2011-05-06 15:03:15','2011-05-16 09:38:18','Tickets now available. Don\'t miss the Early Bird discount, valid until 31 July.');
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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `badge_awardings`
--

LOCK TABLES `badge_awardings` WRITE;
/*!40000 ALTER TABLE `badge_awardings` DISABLE KEYS */;
INSERT INTO `badge_awardings` VALUES (2,1,9,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(3,1,10,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(4,1,11,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(5,1,12,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(6,1,13,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(7,1,14,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(8,2,15,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(9,2,16,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(10,2,17,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(11,2,18,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(12,2,19,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(13,2,20,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(14,3,21,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(15,3,22,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(16,3,23,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(17,3,24,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(18,3,25,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(19,3,26,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(20,4,27,0,'2011-05-05 12:34:58','2011-05-05 12:34:58'),(21,4,28,0,'2011-05-05 12:34:58','2011-05-05 12:34:58'),(22,4,29,0,'2011-05-05 12:34:58','2011-05-05 12:34:58'),(23,4,30,0,'2011-05-05 12:34:58','2011-05-05 12:34:58'),(24,4,31,0,'2011-05-05 12:34:58','2011-05-05 12:34:58'),(25,4,32,0,'2011-05-05 12:34:58','2011-05-05 12:34:58'),(26,3,2,0,'2011-05-05 13:15:41','2011-05-05 13:15:41'),(27,3,13,0,'2011-05-06 07:58:25','2011-05-06 07:58:25'),(28,1,33,0,'2011-05-11 09:30:47','2011-05-11 09:30:47'),(29,2,10,0,'2011-05-11 12:05:54','2011-05-11 12:05:54');
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
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
INSERT INTO `badges` VALUES (1,'picnic11_team','Picnic Team','Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia.','2011/05/05/02_20_05_490_shield.png',''),(2,'picnic_advisor','Picnic Advisor','Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero. Vestibulum mollis mauris enim. Morbi euismod magna.','2011/05/05/02_19_08_20_shield.png',''),(3,'correspondent','NewsNetwork Correspondent','Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero. Vestibulum mollis mauris enim. Morbi euismod magna.','2011/05/05/02_20_24_165_shield.png',''),(4,'picnic11_speaker','PICNIC 11 Speaker','Vestibulum at risus augue. Sed non semper dolor. Sed fringilla consequat velit a porta. Pellentesque sed lectus pharetra ipsum ultricies commodo non sit amet velit. ','2011/05/05/05_30_31_946_shield.png','Vestibulum at risus augue. Sed non semper dolor. Sed fringilla consequat velit a porta. Pellentesque sed lectus pharetra ipsum ultricies commodo non sit amet velit. ');
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
INSERT INTO `item_relationships` VALUES (1,16,'Page',1,'Document','2011-05-05 12:02:04','2011-05-05 12:02:04'),(2,24,'Page',2,'Page','2011-05-05 12:04:51','2011-05-05 12:04:51'),(3,24,'Page',3,'Page','2011-05-05 12:04:51','2011-05-05 12:04:51'),(4,24,'Page',6,'Page','2011-05-05 12:04:51','2011-05-05 12:04:51'),(5,24,'Page',6,'Section','2011-05-05 12:04:51','2011-05-05 12:04:51'),(6,10,'Page',2,'Page','2011-05-05 12:20:47','2011-05-05 12:20:47'),(8,10,'Page',10,'Member','2011-05-06 16:08:09','2011-05-06 16:08:09'),(9,10,'Page',4,'Page','2011-05-06 16:08:34','2011-05-06 16:08:34'),(11,2,'Page',13,'Member','2011-05-10 12:34:50','2011-05-10 12:34:50'),(12,2,'Page',42,'Page','2011-05-11 10:22:43','2011-05-11 10:22:43'),(13,42,'Page',9,'Section','2011-05-11 10:36:56','2011-05-11 10:36:56'),(15,14,'Page',4,'Page','2011-05-11 12:01:09','2011-05-11 12:01:09');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'Member','2011-05-05 13:15:41','2011-05-05 13:15:41'),(2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,'Member','2011-05-05 13:24:17','2011-05-05 13:24:17'),(3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,13,'Member','2011-05-06 07:58:25','2011-05-06 07:58:25'),(4,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7,'Member','2011-05-06 10:38:50','2011-05-06 10:38:50'),(5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'Shout','2011-05-06 11:13:20','2011-05-06 11:13:20'),(6,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2,'Shout','2011-05-06 11:13:20','2011-05-06 11:13:20'),(7,NULL,NULL,NULL,NULL,NULL,NULL,NULL,3,'Shout','2011-05-06 11:13:20','2011-05-06 11:13:20'),(8,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,'Shout','2011-05-06 11:13:20','2011-05-06 11:13:20'),(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,5,'Shout','2011-05-06 11:13:20','2011-05-06 11:13:20'),(10,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6,'Shout','2011-05-06 11:13:20','2011-05-06 11:13:20'),(11,NULL,NULL,NULL,NULL,NULL,NULL,NULL,33,'Member','2011-05-11 09:30:16','2011-05-11 09:30:16'),(12,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,'Member','2011-05-11 12:05:54','2011-05-11 12:05:54');
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
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'si@yoomee.com','si','olive123','Si','Wilkins',1,'',NULL,'2011-04-28 11:18:54','2011-05-05 09:21:58',NULL,0,0,'77.86.30.132',NULL,NULL),(2,'andy@yoomee.com','andy','olive123','Andy','Mayer',1,'Yoomee','I run a web development company called Yoomee - we specialise in building social websites and are passionate about making the world a better place by connecting people together online. For example, we built this website for PICNIC :-)','2011-04-28 11:18:54','2011-05-13 09:08:02','2011/05/05/06_35_05_970_IMG_0055.JPG',1,0,'77.86.30.132',747785309,NULL),(3,'nicola@yoomee.com','nicola','olive123','Nicola','Mayer',1,'',NULL,'2011-04-28 11:18:54','2011-04-28 11:18:54',NULL,0,0,NULL,NULL,NULL),(4,'rich@yoomee.com','rich','olive123','Rich','Wells',1,'',NULL,'2011-04-28 11:18:54','2011-05-05 13:24:17',NULL,0,0,'77.86.30.132',NULL,NULL),(5,'ian@yoomee.com','ian','olive123','Ian','Mooney',1,'',NULL,'2011-04-28 11:18:54','2011-05-04 08:43:24',NULL,0,0,'77.86.30.132',NULL,NULL),(6,'rob@yoomee.com','rob','olive123','Rob','Parvin',1,'',NULL,'2011-04-28 11:18:54','2011-04-28 11:18:54',NULL,0,0,NULL,NULL,NULL),(7,'matt@yoomee.com','matt','olive123','Matt','Atkins',1,'',NULL,'2011-04-28 11:18:54','2011-05-06 10:38:50',NULL,0,0,'77.86.30.132',NULL,NULL),(8,'iancmooney@gmail.com','','bluebiz13','Ian','Mooney',0,'',NULL,'2011-05-03 15:24:43','2011-05-05 10:08:33',NULL,0,1,'77.86.30.132',61102010,NULL),(9,'teammember1@yoomee.com','','password','Marleen','Stikker',0,'PICNIC','I\'m the co-founder of PICNIC. I bring you exciting technology applications and a sixth sense for what’s next.','2011-05-05 09:11:46','2011-05-05 10:10:51','2011/05/05/03_10_27_315_screen_capture_37.png',0,0,NULL,NULL,NULL),(10,'teammember2@yoomee.com','','password','Bas','Vehart',0,'PICNIC','I am a co-founder of PICNIC. I bring you the spirit of entrepreneurship and killer guitar riffs.','2011-05-05 09:11:46','2011-05-11 12:05:54','2011/05/05/03_21_07_218_screen_capture_38.png',0,0,NULL,NULL,NULL),(11,'teammember3@yoomee.com','','password','Kitty','Leering',0,'PICNIC','I\'m the programme director of PICNIC. I bring you this year’s program and my champagne connoisseurship.\r\n','2011-05-05 09:11:46','2011-05-05 10:22:30','2011/05/05/03_22_30_980_kitty.jpg',0,0,NULL,NULL,NULL),(12,'teammember4@yoomee.com','','password','Annemarie','van Asselen',0,'PICNIC','I\'m the director of sponsoring & partnerships at PICNIC. I brings you a passion for building relationships and capturing memories on film.\r\n','2011-05-05 09:11:47','2011-05-05 10:31:50','2011/05/05/03_31_50_860_screen_capture_40.png',0,0,NULL,NULL,NULL),(13,'marcel@kampman.nl','','password','Marcel','Kampman',1,'PICNIC','I\'m the creative director of PICNIC. I bring you a superior creative eye and a collection of inspiring quotes.\r\n','2011-05-05 09:11:47','2011-05-06 14:56:13','2011/05/05/03_30_25_824_screen_capture_39.png',0,0,'77.86.30.132',NULL,NULL),(14,'teammember6@yoomee.com','','password','Team Member','6',0,'',NULL,'2011-05-05 09:11:47','2011-05-05 09:11:47',NULL,0,0,NULL,NULL,NULL),(15,'advisor1@yoomee.com','','password','Advisor','1',0,'',NULL,'2011-05-05 09:14:54','2011-05-05 09:14:54',NULL,0,0,NULL,NULL,NULL),(16,'advisor2@yoomee.com','','password','Advisor','2',0,'',NULL,'2011-05-05 09:14:54','2011-05-05 09:14:54',NULL,0,0,NULL,NULL,NULL),(17,'advisor3@yoomee.com','','password','Advisor','3',0,'',NULL,'2011-05-05 09:14:54','2011-05-05 09:14:54',NULL,0,0,NULL,NULL,NULL),(18,'advisor4@yoomee.com','','password','Advisor','4',0,'',NULL,'2011-05-05 09:14:54','2011-05-05 09:14:54',NULL,0,0,NULL,NULL,NULL),(19,'advisor5@yoomee.com','','password','Advisor','5',0,'',NULL,'2011-05-05 09:14:54','2011-05-05 09:14:54',NULL,0,0,NULL,NULL,NULL),(20,'advisor6@yoomee.com','','password','Advisor','6',0,'',NULL,'2011-05-05 09:14:54','2011-05-05 09:14:54',NULL,0,0,NULL,NULL,NULL),(21,'correspondent1@yoomee.com','','password','Correspondent','1',0,'',NULL,'2011-05-05 09:18:19','2011-05-05 09:18:19',NULL,0,0,NULL,NULL,NULL),(22,'correspondent2@yoomee.com','','password','Correspondent','2',0,'',NULL,'2011-05-05 09:18:19','2011-05-05 09:18:19',NULL,0,0,NULL,NULL,NULL),(23,'correspondent3@yoomee.com','','password','Correspondent','3',0,'',NULL,'2011-05-05 09:18:19','2011-05-05 09:18:19',NULL,0,0,NULL,NULL,NULL),(24,'correspondent4@yoomee.com','','password','Correspondent','4',0,'',NULL,'2011-05-05 09:18:20','2011-05-05 09:18:20',NULL,0,0,NULL,NULL,NULL),(25,'correspondent5@yoomee.com','','password','Correspondent','5',0,'',NULL,'2011-05-05 09:18:20','2011-05-05 09:18:20',NULL,0,0,NULL,NULL,NULL),(26,'correspondent6@yoomee.com','','password','Correspondent','6',0,'',NULL,'2011-05-05 09:18:20','2011-05-05 09:18:20',NULL,0,0,NULL,NULL,NULL),(27,'speaker1@yoomee.com','','password','Speaker','1',0,'',NULL,'2011-05-05 12:32:54','2011-05-05 12:32:54',NULL,0,0,NULL,NULL,NULL),(28,'speaker2@yoomee.com','','password','Speaker','2',0,'',NULL,'2011-05-05 12:32:54','2011-05-05 12:32:54',NULL,0,0,NULL,NULL,NULL),(29,'speaker3@yoomee.com','','password','Speaker','3',0,'',NULL,'2011-05-05 12:32:54','2011-05-05 12:32:54',NULL,0,0,NULL,NULL,NULL),(30,'speaker4@yoomee.com','','password','Speaker','4',0,'',NULL,'2011-05-05 12:32:54','2011-05-05 12:32:54',NULL,0,0,NULL,NULL,NULL),(31,'speaker5@yoomee.com','','password','Speaker','5',0,'',NULL,'2011-05-05 12:32:55','2011-05-05 12:32:55',NULL,0,0,NULL,NULL,NULL),(32,'speaker6@yoomee.com','','password','Speaker','6',0,'',NULL,'2011-05-05 12:32:55','2011-05-05 12:32:55',NULL,0,0,NULL,NULL,NULL),(33,'todd@picnicnetwork.org','todd','hamper123','Todd','Savage',1,'Marketing Manager','More about me.','2011-05-11 09:30:16','2011-05-16 09:39:13',NULL,1,0,'95.97.39.198',NULL,NULL);
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
INSERT INTO `members_news_feed_items` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(2,8),(8,10),(9,11),(10,12),(11,13),(12,14),(13,15),(14,16),(15,17),(16,18),(17,19),(18,20),(19,21),(20,22),(21,23),(22,24),(23,25),(24,26),(25,27),(26,28),(27,29),(28,30),(29,31),(30,32),(31,33),(32,34),(2,35),(2,36),(2,37),(2,38),(2,39),(2,40),(2,41),(33,42),(2,43);
/*!40000 ALTER TABLE `members_news_feed_items` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `news_feed_items`
--

LOCK TABLES `news_feed_items` WRITE;
/*!40000 ALTER TABLE `news_feed_items` DISABLE KEYS */;
INSERT INTO `news_feed_items` VALUES (1,1,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(2,2,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(3,3,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(4,4,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(5,5,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(6,6,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(7,7,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(8,2,'Photo',NULL,0,1,'2011-05-03 14:25:04','2011-05-03 14:25:04'),(10,8,'Member',NULL,0,1,'2011-05-03 15:24:43','2011-05-03 15:24:43'),(11,9,'Member',NULL,0,1,'2011-05-05 09:11:46','2011-05-05 09:11:46'),(12,10,'Member',NULL,0,1,'2011-05-05 09:11:46','2011-05-05 09:11:46'),(13,11,'Member',NULL,0,1,'2011-05-05 09:11:46','2011-05-05 09:11:46'),(14,12,'Member',NULL,0,1,'2011-05-05 09:11:47','2011-05-05 09:11:47'),(15,13,'Member',NULL,0,1,'2011-05-05 09:11:47','2011-05-05 09:11:47'),(16,14,'Member',NULL,0,1,'2011-05-05 09:11:47','2011-05-05 09:11:47'),(17,15,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(18,16,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(19,17,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(20,18,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(21,19,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(22,20,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(23,21,'Member',NULL,0,1,'2011-05-05 09:18:19','2011-05-05 09:18:19'),(24,22,'Member',NULL,0,1,'2011-05-05 09:18:19','2011-05-05 09:18:19'),(25,23,'Member',NULL,0,1,'2011-05-05 09:18:19','2011-05-05 09:18:19'),(26,24,'Member',NULL,0,1,'2011-05-05 09:18:20','2011-05-05 09:18:20'),(27,25,'Member',NULL,0,1,'2011-05-05 09:18:20','2011-05-05 09:18:20'),(28,26,'Member',NULL,0,1,'2011-05-05 09:18:20','2011-05-05 09:18:20'),(29,27,'Member',NULL,0,1,'2011-05-05 12:32:54','2011-05-05 12:32:54'),(30,28,'Member',NULL,0,1,'2011-05-05 12:32:54','2011-05-05 12:32:54'),(31,29,'Member',NULL,0,1,'2011-05-05 12:32:54','2011-05-05 12:32:54'),(32,30,'Member',NULL,0,1,'2011-05-05 12:32:54','2011-05-05 12:32:54'),(33,31,'Member',NULL,0,1,'2011-05-05 12:32:55','2011-05-05 12:32:55'),(34,32,'Member',NULL,0,1,'2011-05-05 12:32:55','2011-05-05 12:32:55'),(35,1,'Shout',NULL,0,1,'2011-05-05 13:14:09','2011-05-05 13:14:09'),(36,2,'Shout',NULL,0,1,'2011-05-05 13:23:29','2011-05-05 13:23:29'),(37,3,'Shout',NULL,0,1,'2011-05-05 13:25:16','2011-05-05 13:25:16'),(38,4,'Shout',NULL,0,1,'2011-05-05 13:25:21','2011-05-05 13:25:21'),(39,5,'Shout',NULL,0,1,'2011-05-05 13:25:23','2011-05-05 13:25:23'),(40,6,'Shout',NULL,0,1,'2011-05-05 13:25:25','2011-05-05 13:25:25'),(41,9,'Photo',NULL,0,1,'2011-05-11 08:21:20','2011-05-11 08:21:20'),(42,33,'Member',NULL,0,1,'2011-05-11 09:30:16','2011-05-11 09:30:16'),(43,11,'Photo',NULL,0,1,'2011-05-11 10:44:11','2011-05-11 10:44:11');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (2,1,'What is PICNIC?',NULL,'<h5 class=\"article_intro\">\r\n	The PICNIC name represents everything we strive to be. It is a gathering of friends old and new, where everyone brings something to the table.</h5>\r\n<p>\r\n	People from diverse backgrounds come to exchange ideas and insight in an informal, social atmosphere. It&rsquo;s a chance to try new things and expose yourself to ideas outside your area of expertise. Share, discuss, collaborate and leave with a new perspective on what is possible.</p>\r\n<p>\r\n	PICNIC is about innovative ideas for business and society. It is an annual three-day festival that blurs the lines between creativity, science, technology and business to explore new solutions in the spirit of co-creation. Curious minds eager to exchange their knowledge, ideas and skills gather at PICNIC, making it the place to create the future &ndash; together.</p>\r\n<h4>\r\n	Who Attends PICNIC</h4>\r\n<p>\r\n	PICNIC attracts a global audience from a wide range of sectors. PICNIC attendees include creative agencies, artists, scientists, designers, marketers, brand managers, content producers, (new) media experts, government leaders, programmers, investors, lawyers, entrepreneurs, freelancers, inventors, technology providers, games developers, services providers, students and teachers just to name a few!</p>\r\n<p>\r\n	PICNIC attendees have one thing in common: they are all curious minds with a passion for finding innovative solutions for the challenges we face today and tomorrow.</p>\r\n','2011-04-28 11:45:38','2011-05-11 12:15:08','2035-01-01 00:00:00','2011-04-28 11:45:00',0,6,2,''),(3,4,'Festival experience',NULL,'<h5 class=\"article_intro\">\r\n	PICNIC is so much more than your average conference, it&#39;s a festival! What sets PICNIC apart from the rest? Keep reading to find out more.</h5>\r\n<p>\r\n	<strong>Three full days of information</strong>, collaboration and entertainment. A chance for prolonged conversations and development of relationships.</p>\r\n<p>\r\n	<strong>Interdisciplinary themes</strong> attract the widest possible audience. Every year, our key themes evolve to reflect changes in our society and economy. Cutting-edge content with far-reaching applications.</p>\r\n<p>\r\n	<strong>Get inspired.</strong> Sit back, relax and catch up on the latest ideas from global thought leaders.</p>\r\n<p>\r\n	<strong>Make and create</strong>. PICNIC is not for observers, it&rsquo;s for participants. Lectures are only a small part of the PICNIC experience. Competitions, challenges, social games, matchmaking, labs and workshops encourage everyone to get involved and get their hands dirty.</p>\r\n<p>\r\n	<strong>Play.</strong> Interactive exhibitions, games, networking sessions and unexpected surprises make for a fun and laid-back experience.</p>\r\n<p>\r\n	<strong>Interaction across boundaries.</strong> Speakers guide students. Designers meet business developers. Hackers collaborate with artists. The combinations are endless.</p>\r\n<p>\r\n	<strong>Casual, social atmosphere</strong> wrapped in a festival environment.</p>\r\n<p>\r\n	<strong>Escape to another world.</strong> The entire event ground is transformed by the PICNIC look and feel.</p>\r\n','2011-04-28 11:46:13','2011-05-11 12:32:36','2035-01-01 00:00:00','2011-04-28 11:46:00',1,5,2,''),(4,1,'The team',NULL,'<p>\r\n	.</p>\r\n','2011-04-28 11:46:43','2011-05-11 12:00:03','2035-01-01 00:00:00','2011-04-28 11:46:00',0,NULL,3,''),(5,4,'Get to know our advisors for PICNIC \'11',NULL,'<p>\r\n	PICNIC&#39;s advisors are one of our most valuable resources! They share their dedication, time and expertise to help shape the content and experience that defines PICNIC.</p>\r\n','2011-04-28 11:49:24','2011-05-11 12:35:22','2035-01-01 00:00:00','2011-04-28 11:49:00',1,NULL,5,'Advisors'),(6,4,'Location',NULL,'<p>\r\n	Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula egestas tincidunt. Nullam risus magna, ornare vitae varius eget, scelerisque a libero. Morbi eu porttitor ipsum. Nullam lorem nisi, posuere quis volutpat eget, luctus nec massa. Pellentesque aliquam lacinia tellus sit amet bibendum. Ut posuere justo in enim pretium scelerisque. Etiam ornare vehicula euismod. Vestibulum at risus augue. Sed non semper dolor. Sed fringilla consequat velit a porta. Pellentesque sed lectus pharetra ipsum ultricies commodo non sit amet velit. Suspendisse volutpat lobortis ipsum, in scelerisque nisi iaculis a. Duis pulvinar lacinia commodo. Integer in lorem id nibh luctus aliquam. Sed elementum, est ac sagittis porttitor, neque metus ultricies ante, in accumsan massa nisl non metus. Vivamus sagittis quam a lacus dictum tempor. Nullam in semper ipsum. Cras a est id massa malesuada tincidunt. Etiam a urna tellus. Ut rutrum vehicula dui, eu cursus magna tincidunt pretium. Donec malesuada accumsan quam, et commodo orci viverra et. Integer tincidunt sagittis lectus. Mauris ac ligula quis orci auctor tincidunt. Suspendisse odio justo, varius id posuere sit amet, iaculis sit amet orci. Suspendisse potenti. Suspendisse potenti. Aliquam erat volutpat. Sed posuere dignissim odio, nec cursus odio mollis et. Praesent cursus, orci ut dictum adipiscing, tellus ante porttitor leo, vel gravida lacus lorem vitae est. Duis ultricies feugiat ante nec aliquam. Maecenas varius, nulla vel fermentum semper, metus nibh bibendum nunc, vitae suscipit mauris velit ac nunc. Mauris nunc eros.</p>\r\n','2011-04-28 11:50:07','2011-05-06 15:04:45','2035-01-01 00:00:00','2011-04-28 11:50:00',0,8,99,''),(7,7,'How to register',NULL,'<p>\r\n	Morbi euismod magna ac lorem rutrum elementum. Donec viverra auctor lobortis. Pellentesque eu est a nulla placerat dignissim. Morbi a enim in magna semper bibendum. Etiam scelerisque, nunc ac egestas consequat, odio nibh euismod nulla, eget auctor orci nibh vel nisi. Aliquam erat volutpat. Mauris vel neque sit amet nunc gravida congue sed sit amet purus. Quisque lacus quam, egestas ac tincidunt a, lacinia vel velit. Aenean facilisis nulla vitae urna tincidunt congue sed ut dui. Morbi malesuada nulla nec purus convallis consequat. Vivamus id mollis quam. Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam vestibulum, arcu sodales feugiat consectetur, nisl orci bibendum elit, eu euismod magna sapien ut nibh. Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus.</p>\r\n','2011-04-28 11:50:58','2011-05-11 19:30:34','2035-01-01 00:00:00','2011-04-28 11:50:00',1,NULL,6,'3 day ticket'),(9,6,'Themes',NULL,'<p>\r\n	<span class=\"Apple-style-span\" style=\"color: rgb(51, 51, 51); font-size: 13px; line-height: 19px; \">Urban Futures</span></p>\r\n','2011-05-05 09:49:20','2011-05-11 12:47:16','2035-01-01 00:00:00','2011-05-05 09:49:00',1,2,0,'Themes'),(10,14,'How it began',NULL,'<p>\r\n	In 2006, Bas Verhart (founder of Media Republic) joined forces with Marleen Stikker (founder and CEO of Waag Society) to develop a new platform for creativity and innovation in Amsterdam. They wanted to bring together the world&rsquo;s top creative and business professionals to develop new partnerships and opportunities. Supported by their network of friends, collaborators and admirers, including former Amsterdam Mayor Job Cohen, PICNIC was born. The first edition of PICNIC was launched in September 2006</p>\r\n','2011-05-05 09:59:52','2011-05-11 12:19:10','2035-01-01 00:00:00','2011-05-05 09:59:00',0,2,6,'2006'),(14,1,'Contact us',NULL,'<p>\r\n	Haarlemmerweg 321 B</p>\r\n<p>\r\n	1051 LG Amsterdam </p>\r\n<p>\r\n	The Netherlands</p>\r\n<p>\r\n	Tel: +31 20 320 5813 </p>\r\n<p>\r\n	Email: info(at)picnicnetwork.org</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Company Registration &amp; Tax information</p>\r\n<p>\r\n	Amsterdam Chamber of Commerce (KvK) Number: 34234137</p>\r\n<p>\r\n	VAT number: 8149.09.322</p>\r\n','2011-05-05 10:50:17','2011-05-11 12:01:09','2035-01-01 00:00:00','2011-05-05 10:49:00',0,2,6,'Contact'),(15,1,'Welcome to the press room',NULL,'<h5 class=\"article_intro\">\r\n	Looking for more information about PICNIC? On this page, you will find a complete selection of resources for the press, including logos, images and press releases from PICNIC and our partners.</h5>\r\n<p>\r\n	Find out what the media has to say about PICNIC! Please take a moment to check out a selection of the great press coverage from PICNIC &#39;11.</p>\r\n<p>\r\n	For additional press-related requests, please contact us directly:</p>\r\n<p>\r\n	PICNIC</p>\r\n<p>\r\n	+31 (0)20 320 5813 </p>\r\n<p>\r\n	press(at)picnicnetwork.org</p>\r\n','2011-05-05 10:52:01','2011-05-11 10:36:21','2035-01-01 00:00:00','2011-05-05 10:52:01',0,7,0,'Welcome'),(16,9,'PICNIC Logos in Low & High Res',NULL,'<p>\r\n	Download the PICNIC Logos by clicking <a href=\"/documents/1\" target=\"_blank\">here</a>.</p>\r\n','2011-05-05 10:52:38','2011-05-05 12:03:54','2035-01-01 00:00:00','2011-05-05 10:52:00',0,NULL,3,'Logos'),(18,10,'Amsterdam, 15 April 2011',NULL,'<h5 class=\"article_intro\">\r\n	PRESS RELEASE: For immediate release</h5>\r\n<p>\r\n	PICNIC &lsquo;11 on &lsquo;Urban Futures&rsquo;: Building the PICNIC CITY</p>\r\n<p>\r\n	PICNIC, Europe&rsquo;s leading event for the creative industries announced its program themes and a new venue for 2011 during a meet-up in the historic Waag building in Amsterdam.</p>\r\n<p>\r\n	Now in its sixth year, PICNIC reiterated its commitment to creativity and technology &ndash; in terms of content, involvement of the PICNIC community and its international reach. This event for professionals is internationally known for its innovative festival approach, combining cutting edge content with new, interactive program formats and a surprising and exciting visitors experience.</p>\r\n<p>\r\n	Waag Society director and PICNIC co-founder Marleen Stikker revealed the theme of PICNIC &rsquo;11: &ldquo;The PICNIC &rsquo;11 theme is &lsquo;Urban Futures&rsquo;. We will explore the impact of global urbanization on our cities, societies and our lives and the way creative and smart technologies can play a role. The challenges following from mega urban environments in areas like demographic shifts, (natural) resources, infrastructure, health and governance are getting more and more pressing. PICNIC brings creative thinkers, developers, designers and entrepreneurs together to collaborate on possible solutions.&rdquo;</p>\r\n<p>\r\n	&ldquo;What will make PICNIC &lsquo;11 really different compared to the preceding editions or any event out there is our theme as the starting point for everything&rdquo;, says Creative Director, Marcel Kampman. &ldquo;We are going to build an actual &ldquo;PICNIC City&rdquo; to prototype creative, urban applications and concepts and we will call upon the PICNIC community to help us build this temporary environment.&rdquo;</p>\r\n<p>\r\n	The &ldquo;PICNIC City&rdquo; will arise at a new location for PICNIC &rsquo;11: the NDSM Wharf on the North side of Amsterdam. PICNIC&rsquo;s Program Director, Kitty Leering commented on the move: &ldquo;We have had an amazing five years at the Westergasfabriek, (((I&rsquo;ve been there, and it&rsquo;s a remodeled fossil-fuel depot that is kinda the ne plus ultra of European &ldquo;stuffed animal&rdquo;))) but the time has come to challenge ourselves more, as well as offer our visitors a new experience. Moving our event to the NDSM Wharf gives us an excellent opportunity to take the look and feel of the festival to another level.&rdquo;</p>\r\n<p>\r\n	According to Rob Post, chairman of the city district Amsterdam-North, the festival and this part of Amsterdam have similar characteristics: &ldquo;PICNIC represents a strong pioneering spirit, innovation and creativity. That also holds true for Amsterdam North. We welcome PICNIC to the sunny side of the IJ&rdquo;</p>\r\n<p>\r\n	PICNIC &rsquo;11 will take place from 14 to 16 September 2011 at the NDSM Wharf in Amsterdam.</p>\r\n<p>\r\n	Download this press release as a PDF</p>\r\n<p>\r\n	###</p>\r\n<p>\r\n	Note to the editor</p>\r\n<p>\r\n	About PICNIC</p>\r\n<p>\r\n	PICNIC is about innovative ideas for business and society. It is an annual three-day festival that blurs the lines between creativity, science, technology and business to explore new solutions in the spirit of co-creation. Curious minds eager to exchange their knowledge, ideas and skills gather at PICNIC, making it the place to create the future &ndash; together.</p>\r\n<p>\r\n	PICNIC &lsquo;11 takes place at the NDSM Wharf in Amsterdam from 14 to 16 September 2011.</p>\r\n<p>\r\n	www.picnicnetwork.org</p>\r\n<p>\r\n	For more information, please contact:</p>\r\n<p>\r\n	Kitty Leering, Program Director</p>\r\n<p>\r\n	Tel: +31 (0)20 320 5813</p>\r\n<p>\r\n	kitty@picnicnetwork.org</p>\r\n<p>\r\n	PICNIC</p>\r\n<p>\r\n	Haarlemmerweg 321 B</p>\r\n<p>\r\n	1051 LG Amsterdam</p>\r\n<p>\r\n	www.picnicnetwork.org</p>\r\n<p>\r\n	Photos of previous PICNIC festivals are available here: http://www.flickr.com/photos/crossmediaweek</p>\r\n','2011-05-05 11:13:18','2011-05-11 11:31:17','2035-01-01 00:00:00','2011-05-05 11:13:18',0,NULL,0,'Press release 1'),(19,10,'Press release 2',NULL,'<p>\r\n	Aliquam erat volutpat. Mauris vel neque sit amet nunc gravida congue sed sit amet purus. Quisque lacus quam, egestas ac tincidunt a, lacinia vel velit. Aenean facilisis nulla vitae urna tincidunt congue sed ut dui. Morbi malesuada nulla nec purus convallis consequat. Vivamus id mollis quam. Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam vestibulum, arcu sodales feugiat consectetur, nisl orci bibendum elit, eu euismod magna sapien ut nibh. Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam.</p>\r\n','2011-05-05 11:14:07','2011-05-05 11:14:07','2035-01-01 00:00:00','2011-05-05 11:14:07',0,NULL,0,'Press release 2'),(20,10,'Press release 3',NULL,'<p>\r\n	Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna.</p>\r\n','2011-05-05 11:14:49','2011-05-05 11:14:49','2035-01-01 00:00:00','2011-05-05 11:14:49',0,NULL,0,'Press release 3'),(21,9,'Photos and videos',NULL,'<h4>\r\n	Photos</h4>\r\n<p>\r\n	For photos of PICNIC &#39;10 and past PICNICs, please visit our <a href=\"http://www.flickr.com/photos/crossmediaweek\" target=\"_blank\">Flickr page</a>. Most of the photos can be republished under the Creative Commons license. Please remember to credit the photographer when using any of these images.</p>\r\n<h4>\r\n	Videos</h4>\r\n<p>\r\n	Lectures from PICNIC &#39;10 and prior events, as well as promotional films can be found on our <a href=\"http://vimeo.com/picnicfestival\" target=\"_blank\">Vimeo channel</a>.</p>\r\n','2011-05-05 11:18:32','2011-05-05 11:45:39','2035-01-01 00:00:00','2011-05-05 11:18:00',0,NULL,4,'Photos and videos'),(22,11,'Note to the editor',NULL,'<h4>\r\n	About PICNIC</h4>\r\n<p>\r\n	PICNIC is about innovative ideas for business and society. It is an annual three-day festival that</p>\r\n<p>\r\n	blurs the lines between creativity, science, technology and business to explore new solutions in</p>\r\n<p>\r\n	the spirit of co-creation. Curious minds eager to exchange their knowledge, ideas and skills</p>\r\n<p>\r\n	gather at PICNIC, making it the place to create the future &ndash; together. PICNIC &lsquo;10 takes place at the</p>\r\n<p>\r\n	Westergasfabriek in Amsterdam from 22 to 24 September 2010.</p>\r\n<p>\r\n	www.picnicnetwork.org</p>\r\n<p>\r\n	For more information, please contact:</p>\r\n<p>\r\n	Liz Keel, Communications &amp; PR Manager</p>\r\n<p>\r\n	Tel: +31 (0)20 320 5813</p>\r\n<p>\r\n	Liz@picnicnetwork.org</p>\r\n<p>\r\n	PICNIC</p>\r\n<p>\r\n	Haarlemmerweg 321 B</p>\r\n<p>\r\n	1051 LG Amsterdam</p>\r\n<p>\r\n	www.picnicnetwork.org</p>\r\n','2011-05-05 11:22:27','2011-05-05 11:23:18','2035-01-01 00:00:00','2011-05-05 11:22:27',0,NULL,0,'English version'),(23,11,'Noot aan de redactie',NULL,'<p>\r\n	<span class=\"Apple-style-span\" style=\"font-family: \'Avant Garde Gothic ITCW01Bd\', arial, snas-serif; font-size: 19px; font-weight: bold; line-height: 28px; color: rgb(0, 0, 0); \">Over PICNIC</span></p>\r\n<p>\r\n	Innovatieve idee&euml;n voor bedrijven en maatschappij staan bij PICNIC centraal. Het is een jaarlijks</p>\r\n<p>\r\n	terugkerend driedaags festival dat de grenzen opzoekt in creativiteit, wetenschap, technologie en</p>\r\n<p>\r\n	ondernemen om nieuwe oplossingen te vinden door middel van co-creatie. Nieuwsgierige</p>\r\n<p>\r\n	mensen verzamelen zich bij PICNIC om hun kennis, idee&euml;n en vaardigheden uit te wisselen, dit</p>\r\n<p>\r\n	maakt het d&eacute; plaats om samen de toekomst te cre&euml;ren. PICNIC &rsquo;10 vindt plaats op het terrein van</p>\r\n<p>\r\n	de Westergasfabriek in Amsterdam van 22 t/m 24 september 2010.</p>\r\n<p>\r\n	www.picnicnetwork.org</p>\r\n<p>\r\n	Voor meer informatie, neem contact op met:</p>\r\n<p>\r\n	Liz Keel, Communications &amp; PR Manager</p>\r\n<p>\r\n	Tel: +31 (0)20 320 5813</p>\r\n<p>\r\n	Liz@picnicnetwork.org</p>\r\n<p>\r\n	PICNIC</p>\r\n<p>\r\n	Haarlemmerweg 321 B</p>\r\n<p>\r\n	1051 LG Amsterdam</p>\r\n<p>\r\n	www.picnicnetwork.org</p>\r\n','2011-05-05 11:23:58','2011-05-05 11:23:58','2035-01-01 00:00:00','2011-05-05 11:23:58',0,NULL,0,'Nederlandse Versie'),(24,9,'About PICNIC',NULL,'<p>\r\n	Looking for more information about PICNIC? On this page, you will find a complete selection of resources for the press, including logos, images and press releases from PICNIC and our partners.</p>\r\n<p>\r\n	Find out what the media has to say about PICNIC! Please take a moment to check out a selection of the great press coverage from PICNIC &#39;11.</p>\r\n<p>\r\n	For additional press-related requests, please contact us directly:</p>\r\n<p>\r\n	PICNIC</p>\r\n<p>\r\n	+31 (0)20 320 5813 </p>\r\n<p>\r\n	press(at)picnicnetwork.org</p>\r\n','2011-05-05 11:41:12','2011-05-16 09:55:40','2035-01-01 00:00:00','2011-05-05 11:41:12',1,NULL,0,'About'),(25,9,'Press clippings',NULL,'<p>\r\n	Another successful edition of PICNIC is behind us! Below you&#39;ll find just a small selection of the press coverage of PICNIC &#39;10.</p>\r\n<h4>\r\n	Links</h4>\r\n<ul>\r\n	<li>\r\n		Press coverage link 1</li>\r\n	<li>\r\n		Press coverage link 2</li>\r\n	<li>\r\n		Press coverage link 3</li>\r\n	<li>\r\n		Press coverage link 4</li>\r\n	<li>\r\n		Press coverage link 5</li>\r\n</ul>\r\n<p>\r\n	&nbsp;</p>','2011-05-05 12:13:25','2011-05-05 12:13:36','2035-01-01 00:00:00','2011-05-05 12:13:00',0,NULL,99,'Press clippings'),(26,3,'Speakers',NULL,'<p>\r\n	Here are the speakers for PICNIC11. Lorem ipsum dolar secator ippy whippy et dolur ipsalem.</p>\r\n','2011-05-05 12:29:41','2011-05-05 16:26:01','2035-01-01 00:00:00','2011-05-05 12:29:00',0,NULL,2,''),(29,14,'PICNIC Amsterdam 2007',NULL,'<p>\r\n	Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero. Vestibulum mollis mauris enim. Morbi euismod magna ac lorem rutrum elementum. Donec viverra auctor lobortis. Pellentesque eu est a nulla placerat dignissim. Morbi a enim in magna semper bibendum. Etiam scelerisque, nunc ac egestas consequat, odio nibh euismod nulla, eget auctor orci nibh vel nisi.</p>\r\n','2011-05-05 15:22:54','2011-05-11 12:19:28','2035-01-01 00:00:00','2011-05-05 15:22:00',0,2,5,'2007'),(30,14,'PICNIC Amsterdam 2008',NULL,'<p>\r\n	In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero. Vestibulum mollis mauris enim. Morbi euismod magna ac lorem rutrum elementum. Donec viverra auctor lobortis. Pellentesque eu est a nulla placerat dignissim. Morbi a enim in magna semper bibendum. Etiam scelerisque, nunc ac egestas consequat, odio nibh euismod nulla, eget auctor orci nibh vel nisi. Aliquam erat volutpat. Mauris vel neque sit amet nunc gravida congue sed sit amet purus. Quisque lacus quam, egestas ac.</p>\r\n','2011-05-05 15:27:14','2011-05-11 12:18:55','2035-01-01 00:00:00','2011-05-05 15:27:00',0,2,4,'2008'),(31,14,'PICNIC Amsterdam 2009',NULL,'<p>\r\n	Praesent id metus massa, ut blandit odio. Proin quis tortor orci. Etiam at risus et justo dignissim congue. Donec congue lacinia dui, a porttitor lectus condimentum laoreet. Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices.</p>\r\n','2011-05-05 15:28:12','2011-05-11 12:18:40','2035-01-01 00:00:00','2011-05-05 15:28:00',0,2,3,'2009'),(32,14,'PICNIC Amsterdam 2010',NULL,'<p>\r\n	Mauris iaculis porttitor posuere. Praesent id metus massa, ut blandit odio. Proin quis tortor orci. Etiam at risus et justo dignissim congue. Donec congue lacinia dui, a porttitor lectus condimentum laoreet. Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed.</p>\r\n','2011-05-05 15:34:34','2011-05-11 12:18:21','2035-01-01 00:00:00','2011-05-05 15:34:00',0,2,2,'2010'),(33,14,'Building the PICNIC city',NULL,'<p>\r\n	The sixth edition of PICNIC is scheduled from 14 to 16 September 2011 and is now a large network of connections spanning the globe. The theme this year is about the impact of the global urbanisation on cities and how we deal with it. More than the previous five PICNICs. Engaging with people 365 days a year, 24 hours a day.&nbsp;</p>\r\n','2011-05-05 15:38:11','2011-05-11 12:18:03','2035-01-01 00:00:00','2011-05-05 15:38:00',0,2,0,'2011'),(34,4,'See what makes PICNIC unique',NULL,'<h5 class=\"article_intro\">\r\n	Below you will find a couple videos that give you a brief impression of what you can experience as a PICNIC visitor. For a more in-depth idea of some of the topics we cover at the yearly PICNIC festival, be sure to view our archive of PICNIC lectures on Vimeo.</h5>\r\n<p>\r\n	PICNIC Promo Video</p>\r\n<p>\r\n	http://www.youtube.com/watch?v=w_DmwaVNAJ8&nbsp;</p>\r\n','2011-05-06 07:59:40','2011-05-11 12:39:41','2035-01-01 00:00:00','2011-05-06 07:59:00',1,NULL,1,'Why unique?'),(35,7,'How to register',NULL,'<p>\r\n	Aenean facilisis nulla vitae urna tincidunt congue sed ut dui. Morbi malesuada nulla nec purus convallis consequat. Vivamus id mollis quam. Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam vestibulum, arcu sodales feugiat consectetur, nisl orci bibendum elit, eu euismod magna sapien ut nibh. Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget.</p>\r\n','2011-05-06 17:14:01','2011-05-06 17:15:17','2035-01-01 00:00:00','2011-05-06 17:14:00',0,NULL,1,'1 day ticket'),(36,7,'How to register',NULL,'<p>\r\n	Vivamus hendrerit arcu sed erat molestie vehicula. Sed auctor neque eu tellus rhoncus ut eleifend nibh porttitor. Ut in nulla enim. Phasellus molestie magna non est bibendum non venenatis nisl tempor. Suspendisse dictum feugiat nisl ut dapibus. Mauris iaculis porttitor posuere. Praesent id metus massa, ut blandit odio. Proin quis tortor orci. Etiam at risus et justo dignissim congue. Donec congue lacinia dui, a porttitor lectus condimentum laoreet. Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus.</p>\r\n','2011-05-06 17:14:35','2011-05-06 17:15:05','2035-01-01 00:00:00','2011-05-06 17:14:00',0,NULL,99,'Lunch ticket'),(42,15,'This is news page 1',NULL,'<h5 class=\"article_intro\">\r\n	Morbi euismod magna ac lorem rutrum elementum. Donec viverra auctor lobortis. Pellentesque eu est a nulla placerat dignissim. Morbi a enim in magna semper bibendum. Etiam scelerisque, nunc ac egestas consequat, odio nibh euismod nulla, eget auctor orci nibh vel nisi.</h5>\r\n<p>\r\n	Aliquam erat volutpat. Mauris vel neque sit amet nunc gravida congue sed sit amet purus. Quisque lacus quam, egestas ac tincidunt a, lacinia vel velit. Aenean facilisis nulla vitae urna tincidunt congue sed ut dui. Morbi malesuada nulla nec purus convallis consequat. Vivamus id mollis quam. Morbi ac commodo nulla. In.</p>\r\n<h4>\r\n	Small heading</h4>\r\n<p>\r\n	Morbi euismod magna ac lorem rutrum elementum. Donec viverra auctor lobortis. Pellentesque eu est a nulla placerat dignissim. Morbi a enim in magna semper bibendum. Etiam scelerisque, nunc ac egestas consequat, odio nibh euismod nulla, eget auctor orci nibh vel nisi. Aliquam erat volutpat. Mauris vel neque sit amet nunc gravida congue sed sit amet purus. Quisque lacus quam, egestas ac tincidunt a, lacinia vel velit. Aenean facilisis nulla vitae urna tincidunt congue sed ut dui. Morbi malesuada nulla nec purus convallis consequat. Vivamus id mollis quam. Morbi ac commodo nulla. In.</p>\r\n','2011-05-11 08:28:42','2011-05-11 12:12:26','2035-01-01 00:00:00','2011-05-11 08:28:42',0,10,0,'News title 1'),(43,15,'This is news page 2',NULL,'<p>\r\n	Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula egestas tincidunt. Nullam risus magna, ornare vitae varius eget, scelerisque a libero. Morbi eu porttitor ipsum. Nullam lorem nisi, posuere quis volutpat eget, luctus nec massa. Pellentesque aliquam lacinia tellus sit amet bibendum. Ut posuere justo in enim pretium scelerisque. Etiam ornare vehicula euismod. Vestibulum at risus augue. Sed non semper dolor. Sed fringilla consequat velit a porta. Pellentesque sed lectus pharetra ipsum ultricies commodo non sit amet velit. Suspendisse volutpat lobortis ipsum, in scelerisque nisi iaculis a. Duis pulvinar lacinia commodo. Integer in lorem id nibh.</p>\r\n<p>\r\n	Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula egestas tincidunt. Nullam risus magna, ornare vitae varius eget, scelerisque a libero. Morbi eu porttitor ipsum. Nullam lorem nisi, posuere quis volutpat eget, luctus nec massa. Pellentesque aliquam lacinia tellus sit amet bibendum. Ut posuere justo in enim pretium scelerisque. Etiam ornare vehicula euismod. Vestibulum at risus augue. Sed non semper dolor. Sed fringilla consequat velit a porta. Pellentesque sed lectus pharetra ipsum ultricies commodo non sit amet velit. Suspendisse volutpat lobortis ipsum, in scelerisque nisi iaculis a. Duis pulvinar lacinia commodo. Integer in lorem id nibh.</p>\r\n','2011-05-11 08:29:27','2011-05-11 12:12:15','2035-01-01 00:00:00','2011-06-01 08:29:00',0,2,1,'News title 2'),(45,3,'Sponsors',NULL,'<p>\r\n	Sponsors &nbsp;</p>\r\n','2011-05-11 11:35:28','2011-05-11 13:23:22','2035-05-10 23:00:00','2011-05-11 11:35:00',1,NULL,150,''),(46,1,'Stay in touch',NULL,'<p>\r\n	Sign up today for PICNIC&rsquo;s monthly newsletter. Get the latest news, announcements, special offers and more from PICNIC and our partners.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<strong><em>CONNECT MAIL CHIMP FORM</em></strong></p>\r\n','2011-05-11 11:50:05','2011-05-11 11:53:39','2035-01-01 00:00:00','2011-05-11 11:50:00',0,NULL,5,''),(47,4,'Best of PICNIC: the first 5 years',NULL,'<p>\r\n	http://vimeo.com/17756354</p>\r\n','2011-05-11 12:30:58','2011-05-11 12:35:01','2035-01-01 00:00:00','2011-05-11 12:30:00',1,NULL,3,'Best of PICNIC'),(48,4,'Welcome',NULL,'<p>\r\n	Intro</p>\r\n','2011-05-11 12:41:47','2011-05-11 13:21:43','2035-05-02 23:00:00','2011-05-11 12:41:00',1,NULL,0,''),(52,16,'Premium Sponsors',NULL,'<p>\r\n	test</p>\r\n','2011-05-11 13:17:57','2011-05-11 13:19:18','2035-01-01 00:00:00','2011-05-11 13:17:00',1,NULL,8,''),(53,3,'Visiting Amsterdam',NULL,'<p>\r\n	Travel guide</p>\r\n','2011-05-11 19:29:04','2011-05-11 19:29:57','2035-01-01 00:00:00','2011-05-11 19:29:00',1,NULL,7,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `permalinks`
--

LOCK TABLES `permalinks` WRITE;
/*!40000 ALTER TABLE `permalinks` DISABLE KEYS */;
INSERT INTO `permalinks` VALUES (1,'about-us','Section',1,'about_us'),(4,'picnic11-section','Section',3,'picnic11'),(5,'picnic11-intro','Section',4,NULL),(7,'festival','Page',2,NULL),(8,'festival-experience','Page',3,NULL),(9,'team','Page',4,'the_team'),(10,'advisors','Page',5,'advisors'),(11,'location','Page',6,NULL),(12,'registration','Page',7,NULL),(14,'picnic11-themes','Section',6,NULL),(15,'themes-overview','Page',9,NULL),(16,'picnic11-registration','Section',7,NULL),(17,'history','Page',10,NULL),(22,'press','Section',9,'press-room'),(23,'contact','Page',14,'contact'),(24,'welcome','Page',15,NULL),(25,'logos','Page',16,NULL),(27,'press-releases','Section',10,NULL),(28,'press-release-1','Page',18,NULL),(29,'press-release-2','Page',19,NULL),(30,'press-release-3','Page',20,NULL),(31,'photos-and-videos','Page',21,NULL),(32,'english-version','Page',22,NULL),(33,'boilerplate','Section',11,NULL),(34,'nederlandse-versie','Page',23,NULL),(36,'about','Page',24,NULL),(38,'press-clippings','Page',25,NULL),(39,'picnic11-speakers','Page',26,'picnic11_speakers'),(42,'2007','Page',29,NULL),(43,'history-1','Section',14,NULL),(44,'2008','Page',30,NULL),(45,'picnic-amsterdam-2009','Page',31,NULL),(46,'picnic-amsterdam-2010','Page',32,NULL),(47,'2011','Page',33,NULL),(48,'what-makes-picnic-unique','Page',34,NULL),(49,'e2---the-green-apple-pbs','Shout',6,NULL),(50,'1-day-ticket','Page',35,NULL),(51,'lunch-ticket','Page',36,NULL),(57,'news','Section',15,NULL),(58,'news-title-1','Page',42,NULL),(59,'awesome-news','Page',43,NULL),(61,'sponsors','Page',45,NULL),(62,'stay-in-touch','Page',46,NULL),(63,'best-of-picnic','Page',47,NULL),(64,'welcome-1','Page',48,NULL),(66,'sponsors-1','Section',16,NULL),(70,'premium-sponsors','Page',52,NULL),(71,'visiting-amsterdam','Page',53,NULL),(73,'visiting-amsterdam-1','Section',18,NULL),(74,'hotels','Section',19,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (2,'Holding image','','2011/05/03/07_25_04_590_holding.png',2,NULL,NULL,'2011-05-03 14:25:04','2011-05-11 12:46:15',1,1),(5,'Festival_d961c0b77f.jpg',NULL,'2011/05/03/07_53_44_220_Festival_d961c0b77f.jpg',2,NULL,NULL,'2011-05-03 14:53:44','2011-05-11 12:32:36',1,1),(6,'Mark_Bun_16743b5844.jpg',NULL,'2011/05/03/07_54_33_54_Mark_Bun_16743b5844.jpg',2,NULL,NULL,'2011-05-03 14:54:33','2011-05-11 10:22:43',1,0),(7,'screen-capture-41.png',NULL,'2011/05/05/05_15_13_117_screen_capture_41.png',2,NULL,NULL,'2011-05-05 12:15:13','2011-05-11 10:36:21',1,0),(8,'screen-capture-43.png',NULL,'2011/05/05/05_18_47_123_screen_capture_43.png',2,NULL,NULL,'2011-05-05 12:18:47','2011-05-06 15:04:45',1,0),(9,'Test','Test','2011/05/11/01_21_20_367_screen_capture_44.png',2,NULL,NULL,'2011-05-11 08:21:20','2011-05-11 08:21:20',2,0),(11,'PICNIC logo','','2011/05/11/03_44_10_982_PICNIC_Heart_WAYB.jpg',2,NULL,NULL,'2011-05-11 10:44:10','2011-05-11 10:44:10',4,0);
/*!40000 ALTER TABLE `photos` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
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
INSERT INTO `schema_migrations` VALUES ('20091016104635'),('20091016120409'),('20091106165316'),('20100210115949'),('20100305173427'),('20100325163719'),('20100407105403'),('20100407105419'),('20100407144339'),('20100408145821'),('20100408162026'),('20100409093733'),('20100409141224'),('20100409143244'),('20100409143304'),('20100409160300'),('20100409160456'),('20100415145447'),('20100415154222'),('20100416115334'),('20100416151432'),('20100416155503'),('20100421100955'),('20100421101145'),('20100421120435'),('20100422091505'),('20100422142610'),('20100423123257'),('20100423123315'),('20100521112757'),('20100524122600'),('20100524153922'),('20100524163512'),('20100525102621'),('20100527100007'),('20100527115352'),('20100601092537'),('20100601094912'),('20100601142242'),('20100601152053'),('20100602090247'),('20100602112131'),('20100602114556'),('20100608101828'),('20100608135949'),('20100609084428'),('20100610132813'),('20100623115210'),('20100714085900'),('20100714090928'),('20100715094246'),('20100715144911'),('20100716105516'),('20100720131711'),('20100727134606'),('20100810082603'),('20100812140336'),('20100825134535'),('20100826094542'),('20101005151730'),('20101013133204'),('20101021165624'),('20101028141828'),('20101215120207'),('20110107150714'),('20110110113046'),('20110112163551'),('20110113145943'),('20110128112444'),('20110207164351'),('20110214162012'),('20110215120230'),('20110218153159'),('20110224151746'),('20110228123442'),('20110228124555'),('20110401111953'),('20110407120146'),('20110428095550'),('20110428150331'),('20110503143045'),('20110503153808'),('20110504112720'),('20110505110943'),('20110506091301'),('20110506104655'),('20110506143819');
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
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'About',101,'first_page',0,'','2011-04-28 11:18:53','2011-05-11 11:30:00',NULL,''),(3,NULL,'Festival',4,'first_page',1,'','2011-04-28 11:18:54','2011-05-11 19:31:25',NULL,''),(4,3,'PICNIC \'11',0,'latest_stories',1,'','2011-04-28 11:20:49','2011-05-11 12:42:41',NULL,''),(6,4,'Themes',1,'first_page',1,'','2011-05-05 09:48:36','2011-05-11 12:38:37',NULL,''),(7,3,'Registration',4,'first_page',1,'','2011-05-05 09:54:41','2011-05-11 19:31:48',NULL,''),(9,1,'Press room',4,'first_page',0,'','2011-05-05 10:45:37','2011-05-11 11:19:19',NULL,'Press room'),(10,9,'Press releases',0,'first_page',0,'','2011-05-05 11:10:01','2011-05-11 11:32:35',NULL,''),(11,9,'Boilerplate',2,'first_page',0,'','2011-05-05 11:23:07','2011-05-05 12:08:04',NULL,''),(14,1,'History',0,'first_page',0,NULL,'2011-05-05 15:23:19','2011-05-05 15:23:19',NULL,NULL),(15,3,'News',0,'first_page',0,NULL,'2011-05-11 08:27:56','2011-05-11 10:21:34',NULL,NULL),(16,4,'Sponsors',0,'first_page',1,NULL,'2011-05-11 13:12:54','2011-05-11 13:12:54',NULL,NULL),(18,4,'Visiting Amsterdam',0,'first_page',1,NULL,'2011-05-11 19:34:49','2011-05-11 19:34:49',NULL,NULL),(19,18,'Hotels',0,'first_page',1,NULL,'2011-05-16 09:39:39','2011-05-16 09:39:39',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `shouts`
--

LOCK TABLES `shouts` WRITE;
/*!40000 ALTER TABLE `shouts` DISABLE KEYS */;
INSERT INTO `shouts` VALUES (1,2,1,'Video','<p>\r\n	The latest addition to the e&sup2; series - e&sup2; transport begins with traffic policy in London, which adopted a congestion charge to combat gridlock. Meanwhile, the city added bus and train service, and redistributed road space to bicyclists and pedestrians. Will these changes improve Londoners&#39; quality of life?</p>\r\n',0,'2011-05-05 13:14:09','2011-05-06 11:13:20',NULL,NULL,'e2 - The Green Apple | PBS'),(2,2,2,'Video','<p>\r\n	The latest addition to the e&sup2; series - e&sup2; transport begins with traffic policy in London, which adopted a congestion charge to combat gridlock. Meanwhile, the city added bus and train service, and redistributed road space to bicyclists and pedestrians. Will these changes improve Londoners&#39; quality of life?</p>\r\n',0,'2011-05-05 13:14:09','2011-05-06 11:13:20',NULL,NULL,'e2 - The Green Apple | PBS'),(3,2,3,'Video','<p>\r\n	The latest addition to the e&sup2; series - e&sup2; transport begins with traffic policy in London, which adopted a congestion charge to combat gridlock. Meanwhile, the city added bus and train service, and redistributed road space to bicyclists and pedestrians. Will these changes improve Londoners&#39; quality of life?</p>\r\n',0,'2011-05-05 13:14:09','2011-05-06 11:13:20',NULL,NULL,'e2 - The Green Apple | PBS'),(4,2,4,'Video','<p>\r\n	The latest addition to the e&sup2; series - e&sup2; transport begins with traffic policy in London, which adopted a congestion charge to combat gridlock. Meanwhile, the city added bus and train service, and redistributed road space to bicyclists and pedestrians. Will these changes improve Londoners&#39; quality of life?</p>\r\n',0,'2011-05-05 13:14:09','2011-05-06 11:13:20',NULL,NULL,'e2 - The Green Apple | PBS'),(5,2,5,'Video','<p>\r\n	The latest addition to the e&sup2; series - e&sup2; transport begins with traffic policy in London, which adopted a congestion charge to combat gridlock. Meanwhile, the city added bus and train service, and redistributed road space to bicyclists and pedestrians. Will these changes improve Londoners&#39; quality of life?</p>\r\n',0,'2011-05-05 13:14:09','2011-05-06 11:13:20',NULL,NULL,'e2 - The Green Apple | PBS'),(6,2,6,'Video','<p>\r\n	The latest addition to the e&sup2; series - e&sup2; transport begins with traffic policy in London, which adopted a congestion charge to combat gridlock. Meanwhile, the city added bus and train service, and redistributed road space to bicyclists and pedestrians. Will these changes improve Londoners&#39; quality of life?</p>\r\n',0,'2011-05-05 13:14:09','2011-05-10 13:01:28',NULL,NULL,'e2 - The Green Apple | PBS');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `snippets`
--

LOCK TABLES `snippets` WRITE;
/*!40000 ALTER TABLE `snippets` DISABLE KEYS */;
INSERT INTO `snippets` VALUES (5,'Page',6,'call_to_action','<p>\r\n	Duis pulvinar lacinia commodo. Integer in lorem id nibh luctus aliquam. Sed elementum, est ac sagittis porttitor, neque metus ultricies ante, in accumsan massa nisl non metus. Vivamus sagittis quam a lacus dictum tempor.</p>\r\n',1,'2011-05-06 15:04:45','2011-05-06 15:04:45'),(9,'Page',2,'call_to_action','<p>\r\n	This is a call to action.</p>\r\n',1,'2011-05-10 15:04:51','2011-05-10 15:04:51'),(10,'Page',2,'photo_caption','<p>\r\n	This is a photo caption.</p>\r\n',1,'2011-05-10 15:04:51','2011-05-10 15:04:51'),(11,'Page',2,'pull_quote','<p>\r\n	This is a pullquote&nbsp;Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia.</p>\r\n',1,'2011-05-10 16:43:39','2011-05-10 16:43:39'),(13,'Page',42,'call_to_action','<p>\r\n	Click <a href=\"http://www.google.com\" target=\"_blank\">here</a> to book your tickets.</p>\r\n',1,'2011-05-11 10:24:00','2011-05-11 10:25:12'),(15,'Page',34,'pull_quote','<p>\r\n	http://vimeo.com/16245565</p>\r\n',1,'2011-05-11 10:27:48','2011-05-11 10:27:48'),(17,'Page',47,'photo_caption','<p>\r\n	http://vimeo.com/17756354</p>\r\n',1,'2011-05-11 12:34:22','2011-05-11 12:34:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (5,5,1,NULL,NULL,'Shout','tags','2011-05-05 13:24:05'),(7,7,1,NULL,NULL,'Shout','tags','2011-05-05 13:24:05'),(8,8,1,NULL,NULL,'Shout','tags','2011-05-05 13:24:05'),(12,4,5,NULL,NULL,'Shout','tags','2011-05-06 08:08:40'),(13,5,5,NULL,NULL,'Shout','tags','2011-05-06 08:08:40'),(14,6,5,NULL,NULL,'Shout','tags','2011-05-06 08:08:40'),(16,8,5,NULL,NULL,'Shout','tags','2011-05-06 08:08:40'),(17,1,4,NULL,NULL,'Shout','tags','2011-05-06 08:09:06'),(20,4,4,NULL,NULL,'Shout','tags','2011-05-06 08:09:06'),(22,6,4,NULL,NULL,'Shout','tags','2011-05-06 08:09:06'),(24,8,4,NULL,NULL,'Shout','tags','2011-05-06 08:09:06'),(30,6,3,NULL,NULL,'Shout','tags','2011-05-06 08:09:30'),(31,7,3,NULL,NULL,'Shout','tags','2011-05-06 08:09:30'),(32,8,3,NULL,NULL,'Shout','tags','2011-05-06 08:09:30'),(33,1,6,NULL,NULL,'Shout','tags','2011-05-06 08:11:36'),(34,3,6,NULL,NULL,'Shout','tags','2011-05-06 08:11:36'),(35,5,6,NULL,NULL,'Shout','tags','2011-05-06 08:11:36'),(36,7,6,NULL,NULL,'Shout','tags','2011-05-06 08:11:36'),(37,6,2,NULL,NULL,'Shout','tags','2011-05-06 08:19:00'),(38,8,2,NULL,NULL,'Shout','tags','2011-05-06 08:19:00');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Mobility',NULL,'Etiam at risus et justo dignissim congue. Donec congue lacinia dui, a porttitor lectus condimentum laoreet. Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit.'),(2,'Sustainability',NULL,'Sed auctor neque eu tellus rhoncus ut eleifend nibh porttitor. Ut in nulla enim. Phasellus molestie magna non est bibendum non venenatis nisl tempor. Suspendisse dictum feugiat nisl ut dapibus. Mauris iaculis porttitor posuere. Praesent id metus massa, ut blandit odio. Proin quis tortor orci. Etiam at risus et justo dignissim congue. Donec congue lacinia dui, a porttitor lectus condimentum laoreet. Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo.'),(3,'Health',NULL,'In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor.'),(4,'Community',NULL,'Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula egestas tincidunt. Nullam risus magna, ornare vitae varius eget, scelerisque a libero. Morbi eu porttitor ipsum. Nullam lorem nisi, posuere quis volutpat eget, luctus nec massa. Pellentesque aliquam lacinia tellus sit amet bibendum. Ut posuere justo.'),(5,'Urban planning',NULL,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien.'),(6,'Connectivity',NULL,'Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus.'),(7,'Shelter',NULL,'Vestibulum mollis mauris enim. Morbi euismod magna ac lorem rutrum elementum. Donec viverra auctor lobortis. Pellentesque eu est a nulla placerat dignissim. Morbi a enim in magna semper bibendum. Etiam scelerisque, nunc ac egestas consequat, odio nibh euismod nulla, eget auctor orci nibh vel nisi. Aliquam erat volutpat. Mauris vel neque sit amet nunc gravida congue sed sit amet purus. Quisque lacus quam, egestas ac tincidunt a, lacinia vel velit. Aenean facilisis nulla vitae urna tincidunt congue sed ut dui. Morbi malesuada nulla nec purus convallis.'),(8,'Business',NULL,'Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam.Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam.Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam.');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (1,'e2 - The Green Apple | PBS',NULL,'http://www.youtube.com/watch?v=wDnvY6xHOjw','\n        <object width=\"425\" height=\"350\">\n          <param name=\"movie\" value=\"http://www.youtube.com/v/wDnvY6xHOjw\"></param>\n          <param name=\"wmode\" value=\"transparent\"></param>\n          <embed src=\"http://www.youtube.com/v/wDnvY6xHOjw\" \n            type=\"application/x-shockwave-flash\" wmode=\"transparent\" \n            width=\"425\" height=\"300\">\n          </embed>\n        </object>\n      ','2011/05/05/06_14_09_810_file',2,NULL,NULL,'2011-05-05 13:14:09','2011-05-06 08:19:28',0),(2,'e2 - The Green Apple | PBS',NULL,'http://www.youtube.com/watch?v=wDnvY6xHOjw','\n        <object width=\"425\" height=\"350\">\n          <param name=\"movie\" value=\"http://www.youtube.com/v/wDnvY6xHOjw\"></param>\n          <param name=\"wmode\" value=\"transparent\"></param>\n          <embed src=\"http://www.youtube.com/v/wDnvY6xHOjw\" \n            type=\"application/x-shockwave-flash\" wmode=\"transparent\" \n            width=\"425\" height=\"300\">\n          </embed>\n        </object>\n      ','2011/05/05/06_24_37_34_file',2,NULL,NULL,'2011-05-05 13:24:37','2011-05-06 08:19:00',0),(3,'e2 - The Green Apple | PBS',NULL,'http://www.youtube.com/watch?v=wDnvY6xHOjw','\n        <object width=\"425\" height=\"350\">\n          <param name=\"movie\" value=\"http://www.youtube.com/v/wDnvY6xHOjw\"></param>\n          <param name=\"wmode\" value=\"transparent\"></param>\n          <embed src=\"http://www.youtube.com/v/wDnvY6xHOjw\" \n            type=\"application/x-shockwave-flash\" wmode=\"transparent\" \n            width=\"425\" height=\"300\">\n          </embed>\n        </object>\n      ','2011/05/05/06_25_16_514_file',2,NULL,NULL,'2011-05-05 13:25:16','2011-05-06 08:18:38',0),(4,'e2 - The Green Apple | PBS',NULL,'http://www.youtube.com/watch?v=wDnvY6xHOjw','\n        <object width=\"425\" height=\"350\">\n          <param name=\"movie\" value=\"http://www.youtube.com/v/wDnvY6xHOjw\"></param>\n          <param name=\"wmode\" value=\"transparent\"></param>\n          <embed src=\"http://www.youtube.com/v/wDnvY6xHOjw\" \n            type=\"application/x-shockwave-flash\" wmode=\"transparent\" \n            width=\"425\" height=\"300\">\n          </embed>\n        </object>\n      ','2011/05/05/06_25_21_968_file',2,NULL,NULL,'2011-05-05 13:25:21','2011-05-06 08:18:20',0),(5,'e2 - The Green Apple | PBS',NULL,'http://www.youtube.com/watch?v=wDnvY6xHOjw','\n        <object width=\"425\" height=\"350\">\n          <param name=\"movie\" value=\"http://www.youtube.com/v/wDnvY6xHOjw\"></param>\n          <param name=\"wmode\" value=\"transparent\"></param>\n          <embed src=\"http://www.youtube.com/v/wDnvY6xHOjw\" \n            type=\"application/x-shockwave-flash\" wmode=\"transparent\" \n            width=\"425\" height=\"300\">\n          </embed>\n        </object>\n      ','2011/05/05/06_25_23_559_file',2,NULL,NULL,'2011-05-05 13:25:23','2011-05-06 08:17:57',0),(6,'e2 - The Green Apple | PBS',NULL,'http://www.youtube.com/watch?v=wDnvY6xHOjw','\n        <object width=\"425\" height=\"350\">\n          <param name=\"movie\" value=\"http://www.youtube.com/v/wDnvY6xHOjw\"></param>\n          <param name=\"wmode\" value=\"transparent\"></param>\n          <embed src=\"http://www.youtube.com/v/wDnvY6xHOjw\" \n            type=\"application/x-shockwave-flash\" wmode=\"transparent\" \n            width=\"425\" height=\"300\">\n          </embed>\n        </object>\n      ','2011/05/05/06_25_25_78_file',2,NULL,NULL,'2011-05-05 13:25:25','2011-05-10 13:01:28',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wall_posts`
--

LOCK TABLES `wall_posts` WRITE;
/*!40000 ALTER TABLE `wall_posts` DISABLE KEYS */;
INSERT INTO `wall_posts` VALUES (1,2,1,'This is very interesting in latin. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero. Vestibulum mollis mauris enim. Morbi euismod magna ac lorem rutrum elementum. Donec viverra auctor lobortis. Pellentesque eu est a nulla placerat dignissim. Morbi a.','2011-05-06 16:00:16','2011-05-06 16:00:16'),(2,2,1,'This is cool!','2011-05-10 13:01:28','2011-05-10 13:01:28');
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `walls`
--

LOCK TABLES `walls` WRITE;
/*!40000 ALTER TABLE `walls` DISABLE KEYS */;
INSERT INTO `walls` VALUES (1,6,'Shout',NULL,'2011-05-06 15:12:17','2011-05-06 15:12:17'),(2,1,'Shout',NULL,'2011-05-06 17:36:02','2011-05-06 17:36:02'),(3,5,'Shout',NULL,'2011-05-07 09:28:10','2011-05-07 09:28:10'),(4,4,'Shout',NULL,'2011-05-08 11:47:26','2011-05-08 11:47:26');
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

-- Dump completed on 2011-05-16  9:55:54
