-- MySQL dump 10.11
--
-- Host: localhost    Database: picnic_static
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
INSERT INTO `adverts` VALUES (1,'PICNIC11 Early Bird Booking','http://picnicnetwork.org/festival-registration','2011/05/20/09_58_50_275_picnic_cardboard.jpg',3365,NULL,69,NULL,NULL,NULL,1,'2011-05-06 15:03:15','2011-06-03 08:24:00','Tickets now available. Don\'t miss the Early Bird discount, valid until 1 July.');
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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `badge_awardings`
--

LOCK TABLES `badge_awardings` WRITE;
/*!40000 ALTER TABLE `badge_awardings` DISABLE KEYS */;
INSERT INTO `badge_awardings` VALUES (2,1,9,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(3,1,10,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(4,1,11,1,'2011-05-05 09:12:58','2011-06-01 17:03:21'),(5,1,12,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(7,1,14,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(8,2,15,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(9,2,16,1,'2011-05-05 09:17:34','2011-06-01 13:37:23'),(26,3,2,1,'2011-05-05 13:15:41','2011-06-01 20:13:37'),(28,1,33,0,'2011-05-11 09:30:47','2011-05-11 09:30:47'),(29,2,10,0,'2011-05-11 12:05:54','2011-05-11 12:05:54'),(30,1,34,1,'2011-05-16 16:18:26','2011-06-01 11:45:27'),(31,1,35,0,'2011-05-18 15:20:28','2011-05-18 15:20:28'),(32,1,36,0,'2011-05-18 15:23:01','2011-05-18 15:23:01'),(33,1,37,0,'2011-05-18 15:25:59','2011-05-18 15:25:59'),(34,1,46,1,'2011-05-31 08:44:46','2011-06-03 04:30:03'),(35,3,46,1,'2011-05-31 08:45:25','2011-06-03 04:30:03'),(36,1,43,1,'2011-05-31 14:29:33','2011-06-01 10:58:59'),(38,4,15,0,'2011-05-31 20:26:51','2011-05-31 20:26:51'),(39,5,47,0,'2011-05-31 20:27:47','2011-05-31 20:27:47');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
INSERT INTO `badges` VALUES (1,'picnic11_team','Picnic Team','Holders of this badge are on the team for PICNIC 11.','2011/06/01/04_43_15_214_picnic_team_member.png','',NULL,NULL),(2,'picnic_advisor','Picnic Advisor','Holders of this badge advise on PICNIC.','2011/06/01/04_44_07_500_advisor.png','',NULL,NULL),(3,'correspondent','NewsNetwork Correspondent','Holders of this badge report in the PICNIC NewsNetwork.','2011/05/05/02_20_24_165_shield.png','',NULL,NULL),(4,'picnic11_speaker','PICNIC 11 Speaker','Holders of this badge will be speaking at PICNIC 11.','2011/05/05/05_30_31_946_shield.png','',NULL,NULL),(5,'picnic_contributor','Picnic Contributor','Holders of this badge are contributing to PICNIC.','2011/05/31/02_07_24_315_shield.png','',NULL,NULL),(6,'picnic11_attendee','Picnic 11 Attendee','Looking forward to seeing you at PICNIC 11!','2011/06/01/04_41_30_729_picnic11_attendee.png','',NULL,NULL);
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
  `evp_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `conference_delegates`
--

LOCK TABLES `conference_delegates` WRITE;
/*!40000 ALTER TABLE `conference_delegates` DISABLE KEYS */;
INSERT INTO `conference_delegates` VALUES (12,NULL,'2011-05-27',1,'Attendee','','Luiz Felippe','M V Motta','M','Felippe Motta','Marketing, Advertising, & Creative Agencies','Copywriter','felippe.motta@gmail.com','',0,0,0,1,0,0,'+1ctZ/EFabfSSG9EENkGzyiIkVo=','2011-05-27 01:37:37','2011-05-27 01:37:37',NULL),(20,NULL,'2011-06-01',1,'Attendee','','test','test','F','Eventpartners','Art & Design','Student','carolien@picnicnetwork.org','',0,0,0,1,0,0,'st3moqVay4fzuPRDNDezZ7gG4GA=','2011-06-01 09:54:50','2011-06-01 09:54:50',3911),(25,NULL,'2011-05-27',1,'Attendee','','Rafael','Mattioli','M','RM','Marketing, Advertising, & Creative Agencies','Copywriter','rafaelmattioli@yahoo.com.br','',0,0,0,1,0,0,'m5a6pGx7QTZUAvpAb0jiJH2d8T8=','2011-06-03 08:19:55','2011-06-03 08:19:55',3910);
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `enquiries`
--

LOCK TABLES `enquiries` WRITE;
/*!40000 ALTER TABLE `enquiries` DISABLE KEYS */;
INSERT INTO `enquiries` VALUES (1,'Beta',1,'2011-06-01 09:06:17','2011-06-01 09:06:17'),(2,'Beta',62,'2011-06-03 08:03:36','2011-06-03 08:03:36'),(3,'Beta',62,'2011-06-03 08:19:46','2011-06-03 08:19:46'),(4,'Beta',62,'2011-06-03 08:19:48','2011-06-03 08:19:48');
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `enquiry_fields`
--

LOCK TABLES `enquiry_fields` WRITE;
/*!40000 ALTER TABLE `enquiry_fields` DISABLE KEYS */;
INSERT INTO `enquiry_fields` VALUES (1,1,'name','Si Wilkins','2011-06-01 09:06:17','2011-06-01 09:06:17'),(2,1,'comments','Testing feedback form','2011-06-01 09:06:17','2011-06-01 09:06:17'),(3,1,'email_address','si@yoomee.com','2011-06-01 09:06:17','2011-06-01 09:06:17'),(4,2,'name','Zoe-Amber ','2011-06-03 08:03:36','2011-06-03 08:03:36'),(5,2,'comments','dear reader, \r\n\r\nI joined as a member via twitter (@sphinxje), (using firefox) then it asked my email adres confirmation, that was not clickable (nothing happened), I just shut down the tab, clicked the confirmation email I did get,  opened another tab and was registered anyway aka could continue as if nothing happened. \r\n\r\nThis description probably isnt the best, but it was late yesterday and I was trying to multitask with 10 tabs and mail and so on. \r\n:)\r\n\r\nsorry guys, good luck with the site!\r\n\r\ncheers, \r\n\r\nzoe','2011-06-03 08:03:36','2011-06-03 08:03:36'),(6,2,'email_address','Zoeamber.bakker@gmail.com','2011-06-03 08:03:36','2011-06-03 08:03:36'),(7,3,'name','Zoe-Amber','2011-06-03 08:19:46','2011-06-03 08:19:46'),(8,3,'comments','Reply message after newsletter subscription is as follows:\r\n\r\nYour subscription to our list has been confirmed.\r\n\r\nFor your records, here is a copy of the information you submitted to us...\r\nCreate_date:\r\nLast Name: Bakker\r\nFirst Name: Zoe-Amber\r\nFull Name (Name + Surname):\r\nEmail Address: zoeamber.bakker@gmail.com\r\nUser_id:\r\nEnabled:\r\n\r\nIf at any time you wish to stop receiving our emails, you can unsubscribe here.\r\n\r\nI there are some fields that need to be set to hidden?\r\nCreate_date, enabled, user name?\r\n\r\nI had no idea what to fill in @ the last two.\r\n\r\ncheers!\r\nz','2011-06-03 08:19:46','2011-06-03 08:19:46'),(9,3,'email_address','Zoeamber.bakker@gmail.com','2011-06-03 08:19:46','2011-06-03 08:19:46'),(10,4,'name','Zoe-Amber','2011-06-03 08:19:48','2011-06-03 08:19:48'),(11,4,'comments','Reply message after newsletter subscription is as follows:\r\n\r\nYour subscription to our list has been confirmed.\r\n\r\nFor your records, here is a copy of the information you submitted to us...\r\nCreate_date:\r\nLast Name: Bakker\r\nFirst Name: Zoe-Amber\r\nFull Name (Name + Surname):\r\nEmail Address: zoeamber.bakker@gmail.com\r\nUser_id:\r\nEnabled:\r\n\r\nIf at any time you wish to stop receiving our emails, you can unsubscribe here.\r\n\r\nI there are some fields that need to be set to hidden?\r\nCreate_date, enabled, user name?\r\n\r\nI had no idea what to fill in @ the last two.\r\n\r\ncheers!\r\nz','2011-06-03 08:19:48','2011-06-03 08:19:48'),(12,4,'email_address','Zoeamber.bakker@gmail.com','2011-06-03 08:19:48','2011-06-03 08:19:48');
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
-- Table structure for table `friend_of_a_friendships`
--

DROP TABLE IF EXISTS `friend_of_a_friendships`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `friend_of_a_friendships` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `friend_of_a_friend_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `friend_of_a_friendships`
--

LOCK TABLES `friend_of_a_friendships` WRITE;
/*!40000 ALTER TABLE `friend_of_a_friendships` DISABLE KEYS */;
INSERT INTO `friend_of_a_friendships` VALUES (7,11,5),(8,5,11),(9,33,5),(10,5,33),(11,33,1),(12,1,33),(13,46,11),(14,11,46),(23,34,5),(24,5,34),(25,47,2),(26,2,47),(27,47,7),(28,7,47),(31,7,43),(32,43,7),(33,11,1),(34,1,11),(35,1,47),(36,47,1),(37,1,43),(38,43,1),(39,5,47),(40,47,5),(41,5,43),(42,43,5),(45,44,7),(46,7,44),(47,44,5),(48,5,44),(49,44,33),(50,33,44),(51,44,46),(52,46,44),(53,44,34),(54,34,44),(55,44,43),(56,43,44),(57,44,11),(58,11,44),(61,4,33),(62,33,4),(63,4,11),(64,11,4),(65,4,46),(66,46,4),(67,4,34),(68,34,4),(69,4,5),(70,5,4),(71,4,44),(72,44,4),(73,4,43),(74,43,4),(75,1,44),(76,44,1),(77,11,49),(78,49,11),(79,16,2),(80,2,16),(81,16,33),(82,33,16),(83,16,47),(84,47,16),(85,16,43),(86,43,16),(87,16,34),(88,34,16),(89,16,7),(90,7,16),(91,53,46),(92,46,53),(93,53,47),(94,47,53),(95,53,34),(96,34,53),(97,53,2),(98,2,53),(99,53,33),(100,33,53),(101,53,16),(102,16,53),(103,53,7),(104,7,53),(105,60,2),(106,2,60),(109,60,47),(110,47,60),(113,60,16),(114,16,60),(115,60,53),(116,53,60),(117,60,34),(118,34,60),(119,60,7),(120,7,60),(121,60,1),(122,1,60),(123,60,5),(124,5,60);
/*!40000 ALTER TABLE `friend_of_a_friendships` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
INSERT INTO `friend_requests` VALUES (1,7,2,NULL,1,NULL),(2,7,38,NULL,0,NULL),(3,2,4,NULL,1,NULL),(4,5,2,NULL,1,NULL),(6,7,4,NULL,1,NULL),(7,1,7,NULL,1,NULL),(8,2,11,NULL,1,NULL),(9,44,2,NULL,1,NULL),(10,33,2,NULL,1,NULL),(11,5,1,NULL,1,NULL),(12,33,7,NULL,1,NULL),(13,33,11,NULL,1,NULL),(14,11,34,NULL,1,NULL),(15,11,7,NULL,1,NULL),(16,11,35,NULL,0,NULL),(17,11,12,NULL,0,NULL),(19,46,34,NULL,1,NULL),(20,46,35,NULL,0,NULL),(21,46,10,NULL,0,NULL),(22,46,33,NULL,1,NULL),(23,46,2,NULL,1,NULL),(24,46,7,NULL,1,NULL),(25,46,1,NULL,1,NULL),(26,46,5,NULL,1,NULL),(27,46,12,NULL,0,NULL),(28,46,36,NULL,0,NULL),(29,46,43,NULL,1,NULL),(30,46,14,NULL,0,NULL),(31,34,2,NULL,1,NULL),(32,34,33,NULL,1,NULL),(33,34,7,NULL,1,NULL),(34,34,1,NULL,1,NULL),(35,47,33,NULL,1,NULL),(36,47,11,NULL,1,NULL),(37,47,34,NULL,1,NULL),(38,47,46,NULL,1,NULL),(39,47,43,NULL,1,NULL),(40,47,14,NULL,0,NULL),(41,47,9,NULL,0,NULL),(42,47,36,NULL,0,NULL),(44,47,12,NULL,0,NULL),(45,7,5,NULL,0,NULL),(46,43,12,NULL,0,NULL),(47,43,14,NULL,0,NULL),(48,43,34,NULL,1,NULL),(49,43,11,NULL,1,NULL),(50,43,2,NULL,1,NULL),(51,43,33,NULL,1,NULL),(52,2,1,NULL,1,NULL),(54,4,1,NULL,1,NULL),(55,16,11,NULL,1,NULL),(56,16,49,NULL,1,NULL),(57,53,9,NULL,0,NULL),(58,53,43,NULL,1,NULL),(59,53,11,NULL,1,NULL),(60,60,59,NULL,0,NULL),(61,60,9,NULL,0,NULL),(62,60,11,NULL,1,NULL),(67,60,33,NULL,0,NULL),(68,60,46,NULL,1,NULL),(69,60,43,NULL,1,NULL),(78,60,37,NULL,0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `item_relationships`
--

LOCK TABLES `item_relationships` WRITE;
/*!40000 ALTER TABLE `item_relationships` DISABLE KEYS */;
INSERT INTO `item_relationships` VALUES (1,16,'Page',1,'Document','2011-05-05 12:02:04','2011-05-05 12:02:04'),(2,24,'Page',2,'Page','2011-05-05 12:04:51','2011-05-05 12:04:51'),(4,24,'Page',6,'Page','2011-05-05 12:04:51','2011-05-05 12:04:51'),(15,14,'Page',4,'Page','2011-05-11 12:01:09','2011-05-11 12:01:09');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (1,NULL,'','http://www.arduino.cc','2011/05/25/15_35_14_620_file',2,NULL,NULL,'2011-05-25 22:34:21','2011-05-25 22:35:14',0,'Arduino - HomePage',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
INSERT INTO `locations` VALUES (1,'53.3830548','-1.4647953',NULL,NULL,'Sheffield','United Kingdom',NULL,2,'Member','2011-05-05 13:15:41','2011-05-20 17:04:08'),(2,NULL,NULL,NULL,NULL,NULL,'',NULL,4,'Member','2011-05-05 13:24:17','2011-05-17 14:10:21'),(4,'53.3830548','-1.4647953',NULL,NULL,'Sheffield','United Kingdom',NULL,7,'Member','2011-05-06 10:38:50','2011-05-25 11:14:23'),(11,'52.3730556','4.8922222',NULL,NULL,'Amsterdam','Netherlands',NULL,33,'Member','2011-05-11 09:30:16','2011-05-24 14:48:14'),(12,'52.3730556','4.8922222',NULL,NULL,'Amsterdam','Netherlands',NULL,10,'Member','2011-05-11 12:05:54','2011-05-24 14:46:24'),(13,'52.3730556','4.8922222',NULL,NULL,'Amsterdam','Netherlands',NULL,34,'Member','2011-05-16 16:17:56','2011-05-24 14:48:20'),(17,'53.3830548','-1.4647953',NULL,NULL,'Sheffield','United Kingdom',NULL,1,'Member','2011-05-18 11:50:12','2011-05-26 14:00:13'),(19,'40.7143528','-74.0059731',NULL,NULL,'New York','United States',NULL,15,'Member','2011-05-18 14:45:50','2011-05-24 14:43:32'),(20,'52.3730556','4.8922222',NULL,NULL,'Amsterdam','Netherlands',NULL,16,'Member','2011-05-18 14:55:11','2011-05-24 14:45:54'),(25,'52.3730556','4.8922222',NULL,NULL,'Amsterdam','Netherlands',NULL,9,'Member','2011-05-18 14:55:48','2011-05-24 14:46:13'),(26,'52.35519358142407','4.775439074999985',NULL,NULL,'Amsterdam','Netherlands',NULL,11,'Member','2011-05-18 14:58:15','2011-05-24 14:47:03'),(33,'52.3730556','4.8922222',NULL,NULL,'Amsterdam','Netherlands',NULL,12,'Member','2011-05-18 14:58:58','2011-05-24 14:47:15'),(40,'52.3730556','4.8922222',NULL,NULL,'Amsterdam','Netherlands',NULL,14,'Member','2011-05-18 15:11:22','2011-05-24 14:47:44'),(41,'52.3730556','4.8922222',NULL,NULL,'Amsterdam','Netherlands',NULL,35,'Member','2011-05-18 15:19:56','2011-05-24 14:48:31'),(42,'52.3730556','4.8922222',NULL,NULL,'Amsterdam','Netherlands',NULL,36,'Member','2011-05-18 15:22:29','2011-05-24 14:49:42'),(43,'52.3730556','4.8922222',NULL,NULL,'Amsterdam','Netherlands',NULL,37,'Member','2011-05-18 15:25:30','2011-05-24 14:50:06'),(46,'','',NULL,NULL,NULL,NULL,NULL,8,'Shout','2011-05-18 16:52:40','2011-05-18 16:52:40'),(48,'','',NULL,NULL,NULL,NULL,NULL,10,'Shout','2011-05-18 16:54:56','2011-05-18 16:54:56'),(54,'51.5','-0.11666700000001251',NULL,NULL,'','',NULL,5,'Member','2011-05-23 16:38:49','2011-05-25 15:20:27'),(56,'','',NULL,NULL,NULL,NULL,NULL,13,'Shout','2011-05-25 09:55:11','2011-05-25 09:55:11'),(57,'','',NULL,NULL,NULL,NULL,NULL,14,'Shout','2011-05-25 22:24:46','2011-05-25 22:24:46'),(58,'','',NULL,NULL,NULL,NULL,NULL,15,'Shout','2011-05-25 22:34:21','2011-05-25 22:34:21'),(61,'52.132633','5.291266',NULL,NULL,NULL,'Netherlands',NULL,43,'Member','2011-05-26 16:16:09','2011-05-26 16:16:09'),(62,'55.378051','-3.435973',NULL,NULL,NULL,'United Kingdom',NULL,44,'Member','2011-05-27 11:24:58','2011-05-27 11:24:58'),(65,'','',NULL,NULL,NULL,NULL,NULL,16,'Shout','2011-05-27 14:54:26','2011-05-27 14:54:26'),(66,'52.3730556','4.8922222',NULL,NULL,'Amsterdam','Netherlands',NULL,46,'Member','2011-05-30 04:51:14','2011-05-30 05:13:55'),(67,'','',NULL,NULL,NULL,NULL,NULL,17,'Shout','2011-05-30 05:32:30','2011-05-30 05:32:30'),(68,'52.0901422','5.1096649',NULL,NULL,'Utrecht','Netherlands',NULL,47,'Member','2011-05-30 16:08:59','2011-05-30 16:30:28'),(70,'40.7143528','-74.0059731',NULL,NULL,'New York','United States',NULL,49,'Member','2011-06-01 14:56:44','2011-06-01 14:59:28'),(71,NULL,NULL,NULL,NULL,NULL,NULL,NULL,50,'Member','2011-06-01 16:28:33','2011-06-01 16:28:33'),(73,NULL,NULL,NULL,NULL,NULL,NULL,NULL,52,'Member','2011-06-02 01:48:21','2011-06-02 01:48:21'),(74,'52.3730556','4.8922222',NULL,NULL,'Amsterdam','Netherlands',NULL,53,'Member','2011-06-02 08:06:12','2011-06-03 05:16:14'),(75,NULL,NULL,NULL,NULL,NULL,NULL,NULL,54,'Member','2011-06-02 12:23:32','2011-06-02 12:23:32'),(76,NULL,NULL,NULL,NULL,NULL,NULL,NULL,55,'Member','2011-06-02 12:59:01','2011-06-02 12:59:01'),(77,NULL,NULL,NULL,NULL,NULL,NULL,NULL,56,'Member','2011-06-02 13:50:07','2011-06-02 13:50:07'),(78,NULL,NULL,NULL,NULL,NULL,NULL,NULL,57,'Member','2011-06-02 15:19:47','2011-06-02 15:19:47'),(79,NULL,NULL,NULL,NULL,NULL,NULL,NULL,58,'Member','2011-06-02 15:24:21','2011-06-02 15:24:21'),(80,NULL,NULL,NULL,NULL,NULL,NULL,NULL,59,'Member','2011-06-02 17:57:31','2011-06-02 17:57:31'),(81,NULL,NULL,NULL,NULL,NULL,NULL,NULL,60,'Member','2011-06-02 18:04:02','2011-06-02 18:04:02'),(82,NULL,NULL,NULL,NULL,NULL,NULL,NULL,61,'Member','2011-06-02 20:42:50','2011-06-02 20:42:50'),(83,'52.132633','5.291266',NULL,NULL,NULL,'Netherlands',NULL,62,'Member','2011-06-02 20:56:52','2011-06-02 20:56:52'),(84,'60.1698125','24.9382401',NULL,NULL,'Helsinki','Finland',NULL,63,'Member','2011-06-02 21:28:02','2011-06-02 21:37:23'),(85,NULL,NULL,NULL,NULL,NULL,NULL,NULL,64,'Member','2011-06-02 22:32:53','2011-06-02 22:32:53');
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
  `fb_user_id` varchar(255) collate utf8_unicode_ci default NULL,
  `twitter_id` int(11) default NULL,
  `points` int(11) default '0',
  `what_i_bring` varchar(255) collate utf8_unicode_ci default NULL,
  `linked_in_user_id` varchar(255) collate utf8_unicode_ci default NULL,
  `twitter_username` varchar(255) collate utf8_unicode_ci default NULL,
  `job_title` varchar(255) collate utf8_unicode_ci default NULL,
  `twitter_token` varchar(255) collate utf8_unicode_ci default NULL,
  `twitter_secret` varchar(255) collate utf8_unicode_ci default NULL,
  `no_notification_emails` tinyint(1) default '0',
  `linked_in_token` varchar(255) collate utf8_unicode_ci default NULL,
  `linked_in_secret` varchar(255) collate utf8_unicode_ci default NULL,
  `linked_in_profile_url` text collate utf8_unicode_ci,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'si@yoomee.com','si','olive123','Si','Wilkins',1,'','I am a Ruby on Rails developer for Yoomee, a great web development agency based in Sheffield, UK. I helped create this website.','2011-04-28 11:18:54','2011-06-02 12:10:34','2011/06/01/02_03_37_696_IMG_6807_1.jpg',0,0,'77.86.30.132','537473622',14265787,2,'web development skills, music and reflections.','5arWR0bjfN','siwilkins',NULL,'14265787-wOscQ26TiHpSVoMgSf2z5Pchxcb1zDy7CrvV0bfvU','PVCTD3txKuQpUEdVu6zqBkFStEbJNLsbplo31GfM',0,'bf6b078f-bd6d-4a6b-91fb-94daafdb0a22','942012b7-9f46-4563-a53a-037505bf5432','http://www.linkedin.com/pub/si-wilkins/19/291/a36'),(2,'andy@yoomee.com','andy','olive123','Andy','Mayer',1,'Yoomee','Founder of Agile web agency Yoomee. We make cool social web platforms for social change. I\'m a Geek, father, husband, petrolhead, Arduino and fencing fan - touché!','2011-04-28 06:18:54','2011-06-02 12:11:55','2011/05/05/06_35_05_970_IMG_0055.JPG',0,0,'195.60.143.254','747785309',14701791,68,'a passion for online communities and using the social web as a way of improving the world','xldlPUCLQB','andymayer',NULL,NULL,NULL,0,NULL,NULL,'http://uk.linkedin.com/in/yoomee'),(4,'rich@yoomee.com','rich','olive123','Rich','Wells',1,'','I work at Yoomee, a great web development agency based in Sheffield, UK. I helped create this website.','2011-04-28 10:18:54','2011-06-01 15:06:20','2011/05/20/10_04_12_815_lomo_0.06.53.09_.jpg',0,0,'77.86.30.132',NULL,14713297,16,'badass drawing skills, and a passion for creating user experiences. ',NULL,'richwells',NULL,NULL,NULL,0,NULL,NULL,NULL),(5,'ian@yoomee.com','ian','olive123','Ian','Mooney',1,'','I\'m a web developer from Sheffield. I work for a company called Yoomee and helped make this site awesome.','2011-04-28 09:18:54','2011-06-02 12:12:49',NULL,0,0,'77.86.30.132','61102010',19117562,10,'a lovely mop of ginger hair.','5OLA9xcrVI','ianmooney',NULL,NULL,NULL,0,NULL,NULL,'http://uk.linkedin.com/pub/ian-mooney/29/85a/aa9'),(7,'matt@yoomee.com','matt','olive123','Matt','Atkins',1,'','Sheffield-based web developer, musician and tea-drinker.','2011-04-28 11:18:54','2011-06-02 12:04:31','2011/05/31/01_48_50_736_matt_squarebw.png',0,0,'77.86.30.132','286103766',18734348,7,'developer skillz','O05vUjvOun','matkins',NULL,'18734348-7wSsilt3HqI9B3RBbtRrrBa1EfPlmB59jltDBJck','Eqs1Nj6yuw8mygUBvFNtcI2X70AMeK7gSU7mcw',0,'3c6967ab-d743-407f-ae7b-1399fa313365','12018bb7-759c-4392-9ea3-32b2b40f53ac','http://www.linkedin.com/pub/matthew-atkins/15/a45/b39'),(9,'teammember1@yoomee.com','','password','Marleen','Stikker',0,'PICNIC','I\'m the co-founder of PICNIC.','2011-05-05 09:11:46','2011-05-25 23:07:45','2011/05/05/03_10_27_315_screen_capture_37.png',0,0,NULL,NULL,NULL,2,'you exciting technology applications and a sixth sense for what’s next.',NULL,NULL,'',NULL,NULL,0,NULL,NULL,NULL),(10,'teammember2@yoomee.com','','password','Bas','Vehart',0,'PICNIC','I\'m a co-founder of PICNIC as well as co-founder & CEO of Media Republic, a leading digital media and entertainment company based in Amsterdam.\r\n\r\nI\'m a passionate entrepreneur and always on the lookout for the next big idea. I\'m currently a board member at Trendwatching.com and Eccky.com, and am busy with a new project seeking innovation in education.\r\n\r\n','2011-05-05 09:11:46','2011-06-01 12:00:03','2011/05/05/03_21_07_218_screen_capture_38.png',0,0,NULL,NULL,NULL,2,'the spirit of entrepreneurship and killer guitar riffs.',NULL,NULL,'',NULL,NULL,0,NULL,NULL,NULL),(11,'kitty@picnicnetwork.org','','kitty','Kitty','Leering',1,'PICNIC','I\'m the Program Director of PICNIC.\r\n','2011-05-05 09:11:46','2011-06-02 20:05:19','2011/05/29/15_04_36_20_Kitty_PICNIC10.jpg',1,0,'195.60.143.254','100000000380345',NULL,2,'you urban future scenarios and gourmet cooking skills.',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(12,'teammember4@yoomee.com','','password','Annemarie','van Asselen',0,'PICNIC','I\'m the Director of Sponsoring & Partnerships at PICNIC.\n','2011-05-05 09:11:47','2011-05-24 14:47:15','2011/05/05/03_31_50_860_screen_capture_40.png',0,0,NULL,NULL,NULL,2,'you a passion for building relationships and capturing memories on film.',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(14,'teammember6@yoomee.com','','password','Alrik','Koudenburg',0,'','I\'m the Spatial Director at PICNIC.','2011-05-05 09:11:47','2011-05-24 14:47:44','2011/05/18/08_45_11_858_screen_capture_9.png',0,0,NULL,NULL,NULL,2,'you supreme spacial perception and my collection of pristine comic books.',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(15,'advisor1@yoomee.com','','hamper123','Adam','Greenfield',0,'','I am founder and managing director of urban systems design practice Urbanscale LLC.\r\n\r\nI have a number of books to my name \'Everyware: The dawning age of ubiquitous computing\' (2006), the forthcoming \'The City Is Here For You To Use\' and, with Mark Shepard, I co-authored the inaugural Situated Technologies pamphlet \'Urban Computing and its Discontents\' (2007). I was previously Nokia\'s head of design direction for service and user interface. I live and work in New York City with my wife, artist Nurri Kim.','2011-05-05 09:14:54','2011-06-03 03:54:47','2011/05/24/03_01_53_244_screen_capture_1.png',1,0,NULL,NULL,NULL,4,'insights that go beyond smart cities',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(16,'juha@non-fiction.nl','','PICNIC11','Juha','van ‘t Zelfde',0,'Viral Radio','As researcher, developer and radical user in the converging domains of art, heritage, network technology and urbanism, I work as a middleperson between those who invent the future and those who mind the past. With Michiel van Iersel I co-founded Non-fiction, an innovation agency reconfiguring popular engagement with public institutions for the 21st century. Non-fiction, based in Amsterdam, works with a.o. the Stedelijk Museum, Stadsherstel and the Royal Concertgebouw Orchestra.\n\nWith Ben Cerveny and James Burke I co-founded VURB, a European framework for policy and design research concerning urban computational systems. The VURB foundation, based in Amsterdam, provides direction and resources to a portfolio of projects investigating how our cultures might come to use networked digital resources to change the way we understand, build, and inhabit cities.\n\nLastly, I founded Viral Radio, a vehicle for the dissemination of electronic music. Viral Radio sets up site-specific performances for festivals and music venues in Europe, displaying new developments in computer music exploration and hyperrhythmic dance music. It has worked with a.o. Exit Festival, North Sea Jazz Festival and Bimhuis.','2011-05-05 09:14:54','2011-06-02 18:00:52','2011/05/24/03_13_31_380_screen_capture_2.png',1,0,'50.18.8.238','725890240',NULL,2,'futurist synthetic rhythm fiction...',NULL,NULL,'',NULL,NULL,1,NULL,NULL,NULL),(33,'todd@picnicnetwork.org','todd','hamper123','Todd','Savage',1,'Marketing Manager','I\'m the Marketing Manager at PICNIC.','2011-05-11 09:30:16','2011-06-01 20:28:09','2011/05/18/08_55_13_234_screen_capture_11.png',0,0,'98.194.14.5',NULL,NULL,25,'a nice cold bottle of ginger beer.',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(34,'janwillem@picnicnetwork.org','jan','rootlemon39','Jan-Willem','Blom',1,'','I am the Office Manager at PICNIC.','2011-05-16 16:17:56','2011-06-01 11:45:26','2011/05/18/08_57_28_718_screen_capture_12.png',0,0,'95.97.39.198',NULL,NULL,2,'you the ability to keep the HQ under control and hardcore DJ skills.',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(35,'mirjam@picnicnetwork.org','','picnic123','Mirjam','Flik',0,'PICNIC','I am Director of Operations at PICNIC.','2011-05-18 15:19:56','2011-05-24 14:48:31','2011/05/18/09_11_42_120_screen_capture_13.png',0,0,NULL,NULL,NULL,2,'you a large heart-shaped red balloon.',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(36,'liz@picnicnetwork.org','','picnic123','Liz','Keel',0,'PICNIC','I am Communications & PR Manager at PICNIC.','2011-05-18 15:22:28','2011-05-24 14:49:42','2011/05/18/09_13_13_760_screen_capture_14.png',0,0,NULL,NULL,NULL,2,'you stories worth (re-)telling and an invitation to dinner.',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(37,'rene@picnicnetwork.org','','picnic123','René','van Schendel',0,'PICNIC','I am the Finance Director at PICNIC.','2011-05-18 15:25:30','2011-05-24 14:50:06',NULL,0,0,NULL,NULL,NULL,2,'you a complete budget overview and an assortment of bubbly Belgian beverages.',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(43,'Micky@picnicnetwork.org','','hatthisw2301','Micky','van Zeijl',1,'','I am the Program Coordinator at PICNIC','2011-05-26 16:16:09','2011-06-03 07:38:23','2011/05/31/05_41_37_165_Photo_on_2011_05_29_at_15.16_2.jpg',1,0,'95.97.39.198','40307655',767237,3,'an overview of content partners, satisfied speakers and some colored cakes, all with a big smile',NULL,'micky',NULL,'767237-pNftzCgRp7oD6bTVwodqQUN37Qlnp5NW9sUSFBuZjA0','VH0xM9vKHztHWSVFuVR9Zo5w8L9Nhd4mpaFHmzbt9w',0,NULL,NULL,NULL),(44,'test@yoomee.com','','olive123','Gordon','Freeman',0,'','I used to work at  Black Mesa, conducting nuclear and subatomic research in its Anomalous Materials department. I am now rescuing the world from the wrong that I have unleashed.','2011-05-27 11:24:58','2011-05-27 16:23:47',NULL,0,0,'77.86.30.132','774294275',NULL,2,'a deep knowledge of theoretical physics',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(46,'hello@kampman.nl','','winblue27','Marcel','Kampman',0,'','I\'m the directive creator of PICNIC','2011-05-30 04:51:14','2011-06-03 04:30:01',NULL,1,1,'86.83.183.70','738034190',728643,15,'you PICNIC','bFN0lSd08E','happykamping',NULL,'728643-24cbffxl4O3h3qQZ73tW98F6N58RlEwk25N9RH4Y','TTTPkuFgW9sPyym3r1eOdDUXKlxHUPGd3i04MmwyYY',0,NULL,NULL,'http://nl.linkedin.com/in/happykamping'),(47,'martine@diezijnvaardig.nl','','bluelemon22','Martine','Eyzenga',0,'','I\'m senior designer at PICNIC\'11','2011-05-30 16:08:59','2011-06-02 12:10:36','2011/05/30/09_32_25_779_Martine.jpg',0,1,'87.251.48.79',NULL,NULL,3,'some sweet graphic thingamajigs and my calming scuba skills\n','_l1PMNTOMw',NULL,NULL,NULL,NULL,0,'f147b42e-3f09-4a81-b62f-e26b6bbb59ca','9bcd57be-3d59-4f7a-beff-731950db302c','http://www.linkedin.com/in/martineeyzenga'),(49,'ag@urbanscale.org','','iglooblue44','Adam','Greenfield',0,'','Founder and managing director, Urbanscale.','2011-06-01 14:56:44','2011-06-03 03:55:01',NULL,1,0,'207.237.195.111','759901994',NULL,2,'THE FEAR',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(50,'ni_ninaki@hotmail.gr','','vocalgold42','Kwnstantina','Ntinaki',0,'',NULL,'2011-06-01 16:28:33','2011-06-01 16:28:33',NULL,0,1,NULL,'100001280050447',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(52,'nenabonita28_nerak@hotmail.com','','pushharp36','Karen','Sanchez',0,'',NULL,'2011-06-02 01:48:21','2011-06-02 01:48:21',NULL,0,1,NULL,'100001698144279',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(53,'paul@cardcloud.com','','winwheel94','Paul','Geurts',0,'',NULL,'2011-06-02 08:06:12','2011-06-03 05:14:53',NULL,1,1,'86.82.128.114','688414526',654533,2,'my brain and a hand full of ideas. ',NULL,'paulgeurts',NULL,'654533-Ksch3e3zXTcXVkCZOktOEmCeCnEn7AMK4aApJA0BI','EEsmS0ulP7BaOXXji9K93DgMWw6IOj3XpbqUueC32Y',0,NULL,NULL,NULL),(54,'bev@beverleymerriman.com','','xrayblue48','Beverley','Merriman',0,'','Co-Founder of Wixel','2011-06-02 12:23:32','2011-06-02 12:23:32','2011/06/02/05_23_32_202_file',0,1,NULL,NULL,NULL,2,NULL,'PX36XBUVd7',NULL,NULL,NULL,NULL,0,'a8183155-cd1b-43c7-afda-c3be6dcbc581','c244d2c1-0467-42e9-b5ea-f50ffe3187e6','http://www.linkedin.com/in/beverleymerriman'),(55,'gcoolman53@yahoo.com','','rootxray70','George','Milad',0,'',NULL,'2011-06-02 12:59:01','2011-06-02 12:59:01',NULL,0,1,NULL,'100000760607060',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(56,'raulpadillarivera@hotmail.com','','zebraqueen16','Raul','Padilla',0,'',NULL,'2011-06-02 13:50:07','2011-06-02 13:50:40',NULL,0,1,NULL,'756839021',NULL,2,'Fives',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(57,'vourkososfp7@yahoo.gr','','noonpush82','Giwrgoc','Vourkoc',0,'',NULL,'2011-06-02 15:19:47','2011-06-02 15:19:47',NULL,1,1,NULL,'100000602708712',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(58,'ellisofia@suomi24.fi','','junezebra40','Milja','Suvinen',0,'',NULL,'2011-06-02 15:24:21','2011-06-02 15:24:21',NULL,1,1,NULL,'1546758147',NULL,2,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL),(59,'mail@thomasjacobs.nl','ThomasJacobs','junetrick52','Thomas','Jacobs',0,'','Webdeveloper / Fronteer / Expression Engine Pro / Magento / Wordpress / langer op twitter dan jij / volg mijn startup @sixclix','2011-06-02 17:57:31','2011-06-02 18:09:00','2011/06/02/10_57_31_915_file',1,1,'212.64.120.188',NULL,641323,2,NULL,NULL,'ThomasJacobs',NULL,'641323-YYfkI1nrktoBTE5Mdz18mNXRt8JiSjXPeDVTHXXFV4','4uFf2PlOhPeB544bILhdrIhxYYQMPwx9SAalCFwlc',0,NULL,NULL,NULL),(60,'gian@conferencebasics.com','gchicco','pushtrick59','Gianfranco','Chicco',0,'','A nomad looking for his way...','2011-06-02 18:04:02','2011-06-02 21:44:26','2011/06/02/11_04_02_672_file',1,1,'89.6.83.107',NULL,5553422,2,'good vibes, the will to meet cool people and a lot of curiosity!',NULL,'gchicco',NULL,'5553422-KzWQyEoyADx5wyNGPXZ2Ih39eAW3dhbpQGphDDU','K9qqFwhstvALObqrBuLNPpZA1RyvZJwsBUKxYHRT8',0,NULL,NULL,NULL),(61,'deklontjes@googlemail.com','deKlontjes','rootnoon78','Leonike de','Klontjes',0,'','A golden fleece.','2011-06-02 20:42:50','2011-06-02 20:46:55','2011/06/02/13_42_50_279_file',1,1,'77.23.164.243',NULL,15821514,2,NULL,NULL,'deKlontjes',NULL,'15821514-cJIrDAErWsuBvTDLGSlMuCxu9ERup0r0pb2An3kDb','0rkWT69QYnDaLDNGOB5j09HCVpPQ6PkGtBkbOGTmQ',0,NULL,NULL,NULL),(62,'zoeamber.bakker@gmail.com','','sergei123','Zoë-Amber','Bakker',0,'','Loves writing and editing, languages (Dutch, English, German), skydiving, touch rugby, Starbucks mugs and Coffee Company white mocca lattes. :) ','2011-06-02 20:56:52','2011-06-02 21:04:48','2011/06/02/14_01_09_27_zoe.jpg',1,0,NULL,'',62467547,2,'enthousiasm, creativity and energy.... ',NULL,'Sphinxje',NULL,'62467547-AjNi23ulg8vulbrAhT158KSYT3O7WnthBBtj5FluX','IxY8KabYKQqd35jsHI7DEuNWrxm31omLoO5LWGhEG4o',0,NULL,NULL,NULL),(63,'sami.niemela@gmail.com','samin','wheelbiz90','Sami','Niemelä',0,'','Designer, thinker and an optimist. Head of world domination at @Nordkapp.','2011-06-02 21:28:02','2011-06-02 21:33:52','2011/06/02/14_28_02_129_file',1,1,NULL,NULL,63433,2,'my whole 198 cms of northern manliness which I just *might* be able to disguise as a Dutch person.',NULL,'samin',NULL,'63433-hfAT4myFMi7uiKc5o8npsYawPvpcYs3HOvgNysRJt8','wpqigAqHK4eUbtIPo9Z0N6yiAz9bZOfc2NfHa0wvT8',0,NULL,NULL,NULL),(64,'zyad2012@live.com','','xrayking35','Zezo','Mohamed',0,'',NULL,'2011-06-02 22:32:53','2011-06-02 22:41:11',NULL,1,1,NULL,'100001860486366',NULL,2,'zezo',NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL);
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
INSERT INTO `members_news_feed_items` VALUES (1,1),(2,2),(4,4),(5,5),(7,7),(2,8),(9,11),(10,12),(11,13),(12,14),(14,16),(15,17),(16,18),(2,41),(33,42),(2,43),(34,44),(35,48),(36,49),(37,50),(2,53),(2,55),(34,58),(11,59),(11,60),(11,61),(2,62),(2,63),(4,64),(7,68),(9,70),(10,71),(12,72),(14,73),(15,74),(16,75),(35,92),(36,93),(37,94),(2,103),(5,104),(2,105),(5,106),(2,107),(5,108),(5,109),(5,110),(2,111),(2,112),(2,113),(2,114),(15,115),(15,116),(15,117),(15,118),(15,119),(16,120),(16,121),(16,122),(9,123),(10,124),(12,125),(14,126),(15,127),(16,128),(35,145),(36,146),(37,147),(1,150),(2,151),(4,153),(5,154),(7,156),(9,157),(10,158),(11,159),(12,160),(14,162),(15,163),(16,164),(33,181),(34,182),(35,183),(36,184),(37,185),(33,188),(2,189),(33,190),(2,191),(2,192),(2,193),(2,194),(2,195),(11,196),(11,197),(11,198),(11,199),(33,200),(5,201),(5,202),(4,203),(4,204),(7,206),(7,207),(7,208),(16,209),(1,210),(4,211),(4,212),(7,213),(2,214),(2,215),(2,216),(2,217),(2,218),(9,219),(10,220),(10,221),(9,222),(2,225),(4,226),(5,227),(5,228),(1,229),(1,230),(1,231),(7,232),(7,233),(7,234),(7,235),(2,236),(11,237),(43,241),(43,242),(2,243),(43,244),(1,245),(2,246),(44,247),(44,248),(44,249),(44,250),(44,252),(1,253),(11,254),(11,255),(7,258),(7,259),(7,260),(7,261),(33,265),(33,266),(33,267),(2,268),(7,269),(11,270),(11,271),(46,272),(46,273),(46,274),(46,275),(46,276),(46,277),(2,278),(46,279),(46,280),(46,281),(2,282),(43,283),(47,284),(47,285),(47,286),(47,287),(47,288),(47,289),(47,290),(7,291),(7,292),(7,293),(46,294),(11,295),(34,296),(47,297),(33,298),(2,299),(43,300),(43,301),(43,302),(43,303),(43,304),(43,305),(43,306),(47,307),(46,308),(47,309),(16,312),(16,313),(2,314),(15,315),(16,316),(16,317),(16,318),(43,319),(33,320),(7,321),(43,322),(2,323),(2,324),(4,325),(2,326),(1,327),(7,328),(34,329),(46,330),(43,331),(16,332),(7,333),(49,334),(49,335),(49,336),(16,337),(16,338),(16,339),(4,340),(16,341),(49,342),(16,343),(43,344),(50,345),(50,346),(11,347),(33,350),(2,351),(33,352),(2,353),(7,354),(16,355),(52,356),(52,357),(53,358),(53,359),(7,360),(53,361),(53,362),(53,363),(7,364),(5,365),(1,366),(47,367),(2,368),(5,369),(46,370),(54,371),(54,372),(55,373),(55,374),(56,375),(56,376),(56,377),(57,378),(57,379),(58,380),(58,381),(11,382),(59,383),(59,384),(16,385),(60,386),(60,387),(60,388),(59,389),(11,390),(61,391),(61,392),(61,393),(62,394),(62,395),(62,396),(62,397),(62,398),(62,399),(63,400),(63,401),(63,402),(63,403),(60,404),(64,405),(64,406),(64,407),(64,408),(64,409),(49,410),(15,411),(49,412),(46,413),(53,414),(43,415);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `message_recipients`
--

LOCK TABLES `message_recipients` WRITE;
/*!40000 ALTER TABLE `message_recipients` DISABLE KEYS */;
INSERT INTO `message_recipients` VALUES (1,40,1,0,0,'2011-05-23 16:33:00','2011-05-23 16:33:00'),(2,2,2,1,0,'2011-05-25 23:18:11','2011-05-26 13:45:54');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,2,'There are two of you!','Which is the real you??',1,0,'2011-05-23 16:33:00','2011-05-23 16:33:02'),(2,2,'Test message','This is a test message.',2,0,'2011-05-25 23:18:11','2011-05-25 23:18:12');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mutual_friendships`
--

DROP TABLE IF EXISTS `mutual_friendships`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mutual_friendships` (
  `friend_of_a_friendship_id` int(11) default NULL,
  `mutual_friend_id` int(11) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mutual_friendships`
--

LOCK TABLES `mutual_friendships` WRITE;
/*!40000 ALTER TABLE `mutual_friendships` DISABLE KEYS */;
INSERT INTO `mutual_friendships` VALUES (7,2),(8,2),(9,7),(10,7),(11,7),(12,7),(13,2),(14,2),(9,2),(10,2),(14,34),(13,34),(23,2),(24,2),(25,46),(26,46),(14,47),(13,47),(25,11),(26,11),(25,33),(26,33),(27,33),(28,33),(13,33),(14,33),(25,34),(26,34),(28,34),(27,34),(23,7),(24,7),(28,46),(27,46),(31,46),(32,46),(28,11),(27,11),(7,7),(8,7),(33,7),(34,7),(14,7),(13,7),(35,46),(36,46),(12,46),(11,46),(37,46),(38,46),(34,34),(33,34),(35,34),(36,34),(12,34),(11,34),(23,1),(24,1),(39,46),(40,46),(24,46),(23,46),(10,46),(9,46),(41,46),(42,46),(32,34),(31,34),(38,34),(37,34),(14,43),(13,43),(32,11),(31,11),(26,43),(25,43),(32,2),(31,2),(42,2),(41,2),(32,33),(31,33),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,2),(58,2),(61,7),(62,7),(63,7),(64,7),(65,7),(66,7),(67,7),(68,7),(61,7),(63,7),(65,7),(67,7),(69,2),(70,2),(71,2),(72,2),(61,2),(62,2),(65,2),(66,2),(67,2),(68,2),(73,2),(74,2),(63,2),(64,2),(69,2),(71,2),(61,2),(65,2),(67,2),(73,2),(63,2),(75,2),(76,2),(12,2),(11,2),(37,2),(38,2),(34,2),(33,2),(69,1),(70,1),(65,1),(66,1),(67,1),(68,1),(77,16),(78,16),(79,11),(80,11),(81,11),(82,11),(83,11),(84,11),(85,11),(86,11),(87,11),(88,11),(89,11),(90,11),(91,43),(92,43),(93,43),(94,43),(95,43),(96,43),(97,43),(98,43),(99,43),(100,43),(97,11),(98,11),(99,11),(100,11),(93,11),(94,11),(101,11),(102,11),(95,11),(96,11),(103,11),(104,11),(105,11),(106,11),(109,11),(110,11),(113,11),(114,11),(115,11),(116,11),(117,11),(118,11),(119,11),(120,11),(13,60),(14,60),(109,46),(110,46),(117,46),(118,46),(105,46),(106,46),(119,46),(120,46),(121,46),(122,46),(123,46),(124,46),(109,43),(110,43),(115,43),(116,43),(117,43),(118,43),(105,43),(106,43);
/*!40000 ALTER TABLE `mutual_friendships` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=416 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `news_feed_items`
--

LOCK TABLES `news_feed_items` WRITE;
/*!40000 ALTER TABLE `news_feed_items` DISABLE KEYS */;
INSERT INTO `news_feed_items` VALUES (1,1,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(2,2,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(4,4,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(5,5,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(7,7,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(8,2,'Photo',NULL,0,1,'2011-05-03 14:25:04','2011-05-03 14:25:04'),(11,9,'Member',NULL,0,1,'2011-05-05 09:11:46','2011-05-05 09:11:46'),(12,10,'Member',NULL,0,1,'2011-05-05 09:11:46','2011-05-05 09:11:46'),(13,11,'Member',NULL,0,1,'2011-05-05 09:11:46','2011-05-05 09:11:46'),(14,12,'Member',NULL,0,1,'2011-05-05 09:11:47','2011-05-05 09:11:47'),(16,14,'Member',NULL,0,1,'2011-05-05 09:11:47','2011-05-05 09:11:47'),(17,15,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(18,16,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(41,9,'Photo',NULL,0,1,'2011-05-11 08:21:20','2011-05-11 08:21:20'),(42,33,'Member',NULL,0,1,'2011-05-11 09:30:16','2011-05-11 09:30:16'),(43,11,'Photo',NULL,0,1,'2011-05-11 10:44:11','2011-05-11 10:44:11'),(44,34,'Member',NULL,0,1,'2011-05-16 16:17:56','2011-05-16 16:17:56'),(48,35,'Member',NULL,0,1,'2011-05-18 15:19:56','2011-05-18 15:19:56'),(49,36,'Member',NULL,0,1,'2011-05-18 15:22:29','2011-05-18 15:22:29'),(50,37,'Member',NULL,0,1,'2011-05-18 15:25:30','2011-05-18 15:25:30'),(53,8,'Shout',NULL,0,1,'2011-05-18 16:52:40','2011-05-18 16:52:40'),(55,10,'Shout',NULL,0,1,'2011-05-18 16:54:56','2011-05-18 16:54:56'),(58,34,'Member','ip_address',1,1,'2011-05-20 09:41:25','2011-05-20 09:41:25'),(59,11,'Member','bio, password, email',1,1,'2011-05-20 10:22:19','2011-05-20 10:22:19'),(60,11,'Member','what_i_bring',1,1,'2011-05-20 10:22:29','2011-05-20 10:22:29'),(61,11,'Member','is_admin',1,1,'2011-05-20 10:31:38','2011-05-20 10:31:38'),(62,2,'Member','what_i_bring',1,1,'2011-05-20 10:45:21','2011-05-20 10:45:21'),(63,2,'Member','what_i_bring',1,1,'2011-05-20 10:45:25','2011-05-20 10:45:25'),(64,4,'Member','image_uid',1,1,'2011-05-20 17:04:12','2011-05-20 17:04:12'),(68,7,'Member','ip_address',1,1,'2011-05-23 08:56:34','2011-05-23 08:56:34'),(70,9,'Member','points',1,1,'2011-05-23 14:39:19','2011-05-23 14:39:19'),(71,10,'Member','points',1,1,'2011-05-23 14:39:19','2011-05-23 14:39:19'),(72,12,'Member','points',1,1,'2011-05-23 14:39:19','2011-05-23 14:39:19'),(73,14,'Member','points',1,1,'2011-05-23 14:39:20','2011-05-23 14:39:20'),(74,15,'Member','points',1,1,'2011-05-23 14:39:20','2011-05-23 14:39:20'),(75,16,'Member','points',1,1,'2011-05-23 14:39:20','2011-05-23 14:39:20'),(92,35,'Member','points',1,1,'2011-05-23 14:39:21','2011-05-23 14:39:21'),(93,36,'Member','points',1,1,'2011-05-23 14:39:21','2011-05-23 14:39:21'),(94,37,'Member','points',1,1,'2011-05-23 14:39:21','2011-05-23 14:39:21'),(103,2,'Member','what_i_bring',1,1,'2011-05-23 16:34:11','2011-05-23 16:34:11'),(104,5,'Member','what_i_bring',1,1,'2011-05-23 16:38:49','2011-05-23 16:38:49'),(105,2,'Member','linked_in_user_id',1,1,'2011-05-23 16:39:08','2011-05-23 16:39:08'),(106,5,'Member','fb_user_id',1,1,'2011-05-23 16:39:08','2011-05-23 16:39:08'),(107,2,'Member','twitter_username, twitter_id',1,1,'2011-05-23 16:39:20','2011-05-23 16:39:20'),(108,5,'Member','created_at, updated_at',1,1,'2011-05-23 16:41:11','2011-05-23 16:41:11'),(109,5,'Member','twitter_username, twitter_id',1,1,'2011-05-23 16:46:01','2011-05-23 16:46:01'),(110,5,'Member','linked_in_user_id',1,1,'2011-05-23 16:46:41','2011-05-23 16:46:41'),(111,2,'Member','ip_address',1,1,'2011-05-23 20:22:48','2011-05-23 20:22:48'),(112,2,'Member','created_at',1,1,'2011-05-23 20:23:14','2011-05-23 20:23:14'),(113,2,'Member','ip_address',1,1,'2011-05-24 08:17:19','2011-05-24 08:17:19'),(114,2,'Member','created_at',1,1,'2011-05-24 08:18:42','2011-05-24 08:18:42'),(115,15,'Member','bio, password, surname, forename',1,1,'2011-05-24 09:52:32','2011-05-24 09:52:32'),(116,15,'Member','what_i_bring',1,1,'2011-05-24 09:58:21','2011-05-24 09:58:21'),(117,15,'Member','image_uid',1,1,'2011-05-24 10:01:48','2011-05-24 10:01:48'),(118,15,'Member','image_uid',1,1,'2011-05-24 10:01:49','2011-05-24 10:01:49'),(119,15,'Member','image_uid',1,1,'2011-05-24 10:01:53','2011-05-24 10:01:53'),(120,16,'Member','company, what_i_bring, bio, password, surname, forename',1,1,'2011-05-24 10:09:26','2011-05-24 10:09:26'),(121,16,'Member','what_i_bring',1,1,'2011-05-24 10:09:51','2011-05-24 10:09:51'),(122,16,'Member','image_uid',1,1,'2011-05-24 10:13:31','2011-05-24 10:13:31'),(123,9,'Member','points',1,1,'2011-05-24 10:51:57','2011-05-24 10:51:57'),(124,10,'Member','points',1,1,'2011-05-24 10:51:57','2011-05-24 10:51:57'),(125,12,'Member','points',1,1,'2011-05-24 10:51:57','2011-05-24 10:51:57'),(126,14,'Member','points',1,1,'2011-05-24 10:51:57','2011-05-24 10:51:57'),(127,15,'Member','points',1,1,'2011-05-24 10:51:57','2011-05-24 10:51:57'),(128,16,'Member','points',1,1,'2011-05-24 10:51:57','2011-05-24 10:51:57'),(145,35,'Member','points',1,1,'2011-05-24 10:52:03','2011-05-24 10:52:03'),(146,36,'Member','points',1,1,'2011-05-24 10:52:03','2011-05-24 10:52:03'),(147,37,'Member','points',1,1,'2011-05-24 10:52:03','2011-05-24 10:52:03'),(150,1,'Member','points',1,1,'2011-05-24 10:53:05','2011-05-24 10:53:05'),(151,2,'Member','points',1,1,'2011-05-24 10:53:05','2011-05-24 10:53:05'),(153,4,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(154,5,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(156,7,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(157,9,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(158,10,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(159,11,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(160,12,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(162,14,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(163,15,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(164,16,'Member','points',1,1,'2011-05-24 10:53:06','2011-05-24 10:53:06'),(181,33,'Member','points',1,1,'2011-05-24 10:53:07','2011-05-24 10:53:07'),(182,34,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(183,35,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(184,36,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(185,37,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(188,33,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(189,2,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(190,33,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(191,2,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(192,2,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(193,2,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(194,2,'Member','points',1,1,'2011-05-24 10:53:08','2011-05-24 10:53:08'),(195,2,'Member','created_at, updated_at',1,1,'2011-05-24 10:55:22','2011-05-24 10:55:22'),(196,11,'Member','ip_address',1,1,'2011-05-24 13:22:34','2011-05-24 13:22:34'),(197,11,'Member','image_uid',1,1,'2011-05-24 13:23:49','2011-05-24 13:23:49'),(198,11,'Member','image_uid',1,1,'2011-05-24 13:25:27','2011-05-24 13:25:27'),(199,11,'Member','what_i_bring',1,1,'2011-05-24 13:27:10','2011-05-24 13:27:10'),(200,33,'Member','ip_address',1,1,'2011-05-24 15:15:36','2011-05-24 15:15:36'),(201,5,'Member','what_i_bring',1,1,'2011-05-24 16:37:11','2011-05-24 16:37:11'),(202,5,'Member','created_at, updated_at',1,1,'2011-05-24 16:40:43','2011-05-24 16:40:43'),(203,13,'Shout',NULL,0,1,'2011-05-25 09:55:11','2011-05-25 09:55:11'),(204,4,'Member','points',1,1,'2011-05-25 09:55:11','2011-05-25 09:55:11'),(206,7,'Member','twitter_username, twitter_id',1,1,'2011-05-25 11:13:51','2011-05-25 11:13:51'),(207,7,'Member','fb_user_id',1,1,'2011-05-25 11:15:10','2011-05-25 11:15:10'),(208,7,'Member','linked_in_user_id',1,1,'2011-05-25 11:15:38','2011-05-25 11:15:38'),(209,16,'Member','forename',1,1,'2011-05-25 13:01:08','2011-05-25 13:01:08'),(210,1,'Member','what_i_bring',1,1,'2011-05-25 13:42:34','2011-05-25 13:42:34'),(211,4,'Member','twitter_username, twitter_id',1,1,'2011-05-25 13:45:34','2011-05-25 13:45:34'),(212,4,'Member','points',1,1,'2011-05-25 15:46:50','2011-05-25 15:46:50'),(213,7,'Member','points',1,1,'2011-05-25 15:46:50','2011-05-25 15:46:50'),(214,2,'Member','ip_address',1,1,'2011-05-25 22:06:09','2011-05-25 22:06:09'),(215,14,'Shout',NULL,0,1,'2011-05-25 22:24:46','2011-05-25 22:24:46'),(216,2,'Member','points',1,1,'2011-05-25 22:24:46','2011-05-25 22:24:46'),(217,15,'Shout',NULL,0,1,'2011-05-25 22:34:21','2011-05-25 22:34:21'),(218,2,'Member','points',1,1,'2011-05-25 22:34:21','2011-05-25 22:34:21'),(219,9,'Member','job_title',1,1,'2011-05-25 23:04:33','2011-05-25 23:04:33'),(220,10,'Member','job_title, bio',1,1,'2011-05-25 23:05:46','2011-05-25 23:05:46'),(221,10,'Member','job_title',1,1,'2011-05-25 23:06:58','2011-05-25 23:06:58'),(222,9,'Member','job_title',1,1,'2011-05-25 23:07:45','2011-05-25 23:07:45'),(225,2,'Member','ip_address',1,1,'2011-05-26 07:51:23','2011-05-26 07:51:23'),(226,4,'Member','points',1,1,'2011-05-26 08:53:52','2011-05-26 08:53:52'),(227,5,'Member','points',1,1,'2011-05-26 08:53:52','2011-05-26 08:53:52'),(228,5,'Member','points',1,1,'2011-05-26 08:54:32','2011-05-26 08:54:32'),(229,1,'Member','twitter_username, twitter_id',1,1,'2011-05-26 13:55:59','2011-05-26 13:55:59'),(230,1,'Member','fb_user_id',1,1,'2011-05-26 13:56:18','2011-05-26 13:56:18'),(231,1,'Member','linked_in_user_id',1,1,'2011-05-26 13:56:32','2011-05-26 13:56:32'),(232,7,'Member','twitter_id',1,1,'2011-05-26 14:24:25','2011-05-26 14:24:25'),(233,7,'Member','twitter_id',1,1,'2011-05-26 14:24:40','2011-05-26 14:24:40'),(234,7,'Member','linked_in_user_id',1,1,'2011-05-26 14:29:43','2011-05-26 14:29:43'),(235,7,'Member','linked_in_user_id',1,1,'2011-05-26 14:40:29','2011-05-26 14:40:29'),(236,2,'Member','ip_address',1,1,'2011-05-26 15:27:31','2011-05-26 15:27:31'),(237,11,'Member','fb_user_id',1,1,'2011-05-26 15:48:56','2011-05-26 15:48:56'),(241,43,'Member',NULL,0,1,'2011-05-26 16:16:09','2011-05-26 16:16:09'),(242,43,'Member','created_at, updated_at, id, points, surname, forename, password, email',1,1,'2011-05-26 16:16:09','2011-05-26 16:16:09'),(243,2,'Member','ip_address',1,1,'2011-05-26 16:21:23','2011-05-26 16:21:23'),(244,43,'Member','what_i_bring',1,1,'2011-05-26 16:22:21','2011-05-26 16:22:21'),(245,1,'Member','twitter_token, twitter_secret',1,1,'2011-05-27 09:00:06','2011-05-27 09:00:06'),(246,2,'Member','ip_address',1,1,'2011-05-27 10:41:27','2011-05-27 10:41:27'),(247,44,'Member',NULL,0,1,'2011-05-27 11:24:58','2011-05-27 11:24:58'),(248,44,'Member','created_at, updated_at, id, points, surname, forename, password, email',1,1,'2011-05-27 11:24:58','2011-05-27 11:24:58'),(249,44,'Member','what_i_bring',1,1,'2011-05-27 11:27:59','2011-05-27 11:27:59'),(250,44,'Member','ip_address',1,1,'2011-05-27 11:30:57','2011-05-27 11:30:57'),(252,44,'Member','fb_user_id',1,1,'2011-05-27 11:42:52','2011-05-27 11:42:52'),(253,1,'Member','linked_in_secret, linked_in_token',1,1,'2011-05-27 12:14:28','2011-05-27 12:14:28'),(254,11,'Member','fb_user_id',1,1,'2011-05-27 13:13:16','2011-05-27 13:13:16'),(255,11,'Member','fb_user_id',1,1,'2011-05-27 13:22:13','2011-05-27 13:22:13'),(258,7,'Member','fb_user_id',1,1,'2011-05-27 14:00:50','2011-05-27 14:00:50'),(259,7,'Member','fb_user_id',1,1,'2011-05-27 14:01:34','2011-05-27 14:01:34'),(260,7,'Member','fb_user_id',1,1,'2011-05-27 14:03:44','2011-05-27 14:03:44'),(261,7,'Member','fb_user_id',1,1,'2011-05-27 14:05:56','2011-05-27 14:05:56'),(265,33,'Member','ip_address',1,1,'2011-05-27 14:52:12','2011-05-27 14:52:12'),(266,16,'Shout',NULL,0,1,'2011-05-27 14:54:26','2011-05-27 14:54:26'),(267,33,'Member','points',1,1,'2011-05-27 14:54:26','2011-05-27 14:54:26'),(268,2,'Member','ip_address',1,1,'2011-05-28 00:27:43','2011-05-28 00:27:43'),(269,7,'Member','ip_address',1,1,'2011-05-28 06:57:40','2011-05-28 06:57:40'),(270,11,'Member','what_i_bring',1,1,'2011-05-29 21:35:04','2011-05-29 21:35:04'),(271,11,'Member','image_uid',1,1,'2011-05-29 22:04:36','2011-05-29 22:04:36'),(272,46,'Member',NULL,0,1,'2011-05-30 04:51:14','2011-05-30 04:51:14'),(273,46,'Member','created_at, password_generated, fb_user_id, updated_at, id, points, surname, forename, password, email',1,1,'2011-05-30 04:51:14','2011-05-30 04:51:14'),(274,46,'Member','what_i_bring',1,1,'2011-05-30 04:52:28','2011-05-30 04:52:28'),(275,46,'Member','twitter_username, twitter_token, twitter_id, twitter_secret',1,1,'2011-05-30 04:55:20','2011-05-30 04:55:20'),(276,46,'Member','linked_in_user_id',1,1,'2011-05-30 04:55:39','2011-05-30 04:55:39'),(277,46,'Member','ip_address',1,1,'2011-05-30 05:09:45','2011-05-30 05:09:45'),(278,2,'Member','points',1,1,'2011-05-30 05:14:41','2011-05-30 05:14:41'),(279,46,'Member','points',1,1,'2011-05-30 05:14:42','2011-05-30 05:14:42'),(280,17,'Shout',NULL,0,1,'2011-05-30 05:32:29','2011-05-30 05:32:29'),(281,46,'Member','points',1,1,'2011-05-30 05:32:29','2011-05-30 05:32:29'),(282,2,'Member','ip_address',1,1,'2011-05-30 06:38:15','2011-05-30 06:38:15'),(283,43,'Member','ip_address',1,1,'2011-05-30 11:07:33','2011-05-30 11:07:33'),(284,47,'Member',NULL,0,1,'2011-05-30 16:08:59','2011-05-30 16:08:59'),(285,47,'Member','created_at, password_generated, image_uid, updated_at, id, points, linked_in_secret, linked_in_user_id, bio, surname, linked_in_token, forename, password, email',1,1,'2011-05-30 16:08:59','2011-05-30 16:08:59'),(286,47,'Member','what_i_bring',1,1,'2011-05-30 16:14:52','2011-05-30 16:14:52'),(287,47,'Member','what_i_bring',1,1,'2011-05-30 16:20:34','2011-05-30 16:20:34'),(288,47,'Member','what_i_bring',1,1,'2011-05-30 16:26:14','2011-05-30 16:26:14'),(289,47,'Member','image_uid',1,1,'2011-05-30 16:32:25','2011-05-30 16:32:25'),(290,47,'Member','ip_address',1,1,'2011-05-30 18:46:04','2011-05-30 18:46:04'),(291,7,'Member','ip_address',1,1,'2011-05-31 08:16:28','2011-05-31 08:16:28'),(292,7,'Member','image_uid',1,1,'2011-05-31 08:47:58','2011-05-31 08:47:58'),(293,7,'Member','image_uid',1,1,'2011-05-31 08:48:51','2011-05-31 08:48:51'),(294,46,'Member','ip_address',1,1,'2011-05-31 10:23:03','2011-05-31 10:23:03'),(295,11,'Member','ip_address',1,1,'2011-05-31 10:25:33','2011-05-31 10:25:33'),(296,34,'Member','ip_address',1,1,'2011-05-31 10:27:03','2011-05-31 10:27:03'),(297,47,'Member','ip_address',1,1,'2011-05-31 10:28:07','2011-05-31 10:28:07'),(298,33,'Member','ip_address',1,1,'2011-05-31 10:32:46','2011-05-31 10:32:46'),(299,2,'Member','ip_address',1,1,'2011-05-31 10:36:39','2011-05-31 10:36:39'),(300,43,'Member','ip_address',1,1,'2011-05-31 12:19:18','2011-05-31 12:19:18'),(301,43,'Member','what_i_bring',1,1,'2011-05-31 12:36:05','2011-05-31 12:36:05'),(302,43,'Member','image_uid',1,1,'2011-05-31 12:41:37','2011-05-31 12:41:37'),(303,43,'Member','what_i_bring',1,1,'2011-05-31 12:42:16','2011-05-31 12:42:16'),(304,43,'Member','fb_user_id',1,1,'2011-05-31 12:43:09','2011-05-31 12:43:09'),(305,43,'Member','twitter_username, twitter_token, twitter_id, twitter_secret',1,1,'2011-05-31 12:43:26','2011-05-31 12:43:26'),(306,43,'Member','is_admin',1,1,'2011-05-31 14:28:59','2011-05-31 14:28:59'),(307,47,'Member','ip_address',1,1,'2011-05-31 14:34:19','2011-05-31 14:34:19'),(308,46,'Member','points',1,1,'2011-05-31 14:35:22','2011-05-31 14:35:22'),(309,47,'Member','points',1,1,'2011-05-31 14:35:22','2011-05-31 14:35:22'),(312,16,'Member','what_i_bring',1,1,'2011-05-31 15:02:54','2011-05-31 15:02:54'),(313,16,'Member','job_title, fb_user_id, no_notification_emails, password, email',1,1,'2011-05-31 15:24:17','2011-05-31 15:24:17'),(314,2,'Member','ip_address',1,1,'2011-05-31 20:25:05','2011-05-31 20:25:05'),(315,15,'Member','what_i_bring',1,1,'2011-05-31 20:35:23','2011-05-31 20:35:23'),(316,16,'Member','what_i_bring',1,1,'2011-05-31 20:41:01','2011-05-31 20:41:01'),(317,16,'Member','what_i_bring',1,1,'2011-05-31 20:41:43','2011-05-31 20:41:43'),(318,16,'Member','what_i_bring',1,1,'2011-05-31 20:41:54','2011-05-31 20:41:54'),(319,43,'Member','ip_address',1,1,'2011-05-31 21:10:33','2011-05-31 21:10:33'),(320,33,'Member','ip_address',1,1,'2011-06-01 04:01:37','2011-06-01 04:01:37'),(321,7,'Member','ip_address',1,1,'2011-06-01 06:19:46','2011-06-01 06:19:46'),(322,43,'Member','ip_address',1,1,'2011-06-01 08:02:03','2011-06-01 08:02:03'),(323,2,'Member','what_i_bring',1,1,'2011-06-01 08:32:29','2011-06-01 08:32:29'),(324,2,'Member','what_i_bring',1,1,'2011-06-01 08:33:42','2011-06-01 08:33:42'),(325,4,'Member','points',1,1,'2011-06-01 08:42:38','2011-06-01 08:42:38'),(326,2,'Member','points',1,1,'2011-06-01 08:42:38','2011-06-01 08:42:38'),(327,1,'Member','image_uid',1,1,'2011-06-01 09:03:37','2011-06-01 09:03:37'),(328,7,'Member','ip_address',1,1,'2011-06-01 09:33:31','2011-06-01 09:33:31'),(329,34,'Member','ip_address',1,1,'2011-06-01 11:45:26','2011-06-01 11:45:26'),(330,46,'Member','points',1,1,'2011-06-01 12:05:02','2011-06-01 12:05:02'),(331,43,'Member','points',1,1,'2011-06-01 12:05:02','2011-06-01 12:05:02'),(332,16,'Member','ip_address',1,1,'2011-06-01 13:37:18','2011-06-01 13:37:18'),(333,7,'Member','twitter_token, twitter_secret',1,1,'2011-06-01 14:30:57','2011-06-01 14:30:57'),(334,49,'Member',NULL,0,1,'2011-06-01 14:56:44','2011-06-01 14:56:44'),(335,49,'Member','created_at, password_generated, fb_user_id, updated_at, id, points, surname, forename, password, email',1,1,'2011-06-01 14:56:44','2011-06-01 14:56:44'),(336,49,'Member','what_i_bring',1,1,'2011-06-01 14:58:21','2011-06-01 14:58:21'),(337,16,'Member','ip_address',1,1,'2011-06-01 15:00:09','2011-06-01 15:00:09'),(338,16,'Member','what_i_bring',1,1,'2011-06-01 15:02:41','2011-06-01 15:02:41'),(339,16,'Member','fb_user_id',1,1,'2011-06-01 15:03:02','2011-06-01 15:03:02'),(340,4,'Member','what_i_bring',1,1,'2011-06-01 15:06:20','2011-06-01 15:06:20'),(341,16,'Member','what_i_bring',1,1,'2011-06-01 15:25:44','2011-06-01 15:25:44'),(342,49,'Member','ip_address',1,1,'2011-06-01 15:27:49','2011-06-01 15:27:49'),(343,16,'Member','what_i_bring',1,1,'2011-06-01 15:28:21','2011-06-01 15:28:21'),(344,43,'Member','ip_address',1,1,'2011-06-01 16:24:45','2011-06-01 16:24:45'),(345,50,'Member',NULL,0,1,'2011-06-01 16:28:33','2011-06-01 16:28:33'),(346,50,'Member','created_at, password_generated, fb_user_id, updated_at, id, points, surname, forename, password, email',1,1,'2011-06-01 16:28:33','2011-06-01 16:28:33'),(347,11,'Member','ip_address',1,1,'2011-06-01 17:03:20','2011-06-01 17:03:20'),(350,33,'Member','points',1,1,'2011-06-01 20:28:05','2011-06-01 20:28:05'),(351,2,'Member','points',1,1,'2011-06-01 20:28:05','2011-06-01 20:28:05'),(352,33,'Member','points',1,1,'2011-06-01 20:28:09','2011-06-01 20:28:09'),(353,2,'Member','points',1,1,'2011-06-01 20:28:09','2011-06-01 20:28:09'),(354,7,'Member','ip_address',1,1,'2011-06-01 22:04:14','2011-06-01 22:04:14'),(355,16,'Member','what_i_bring',1,1,'2011-06-01 22:52:23','2011-06-01 22:52:23'),(356,52,'Member',NULL,0,1,'2011-06-02 01:48:21','2011-06-02 01:48:21'),(357,52,'Member','created_at, password_generated, fb_user_id, updated_at, id, points, surname, forename, password, email',1,1,'2011-06-02 01:48:21','2011-06-02 01:48:21'),(358,53,'Member',NULL,0,1,'2011-06-02 08:06:12','2011-06-02 08:06:12'),(359,53,'Member','created_at, password_generated, fb_user_id, updated_at, id, points, surname, forename, password, email',1,1,'2011-06-02 08:06:12','2011-06-02 08:06:12'),(360,7,'Member','ip_address',1,1,'2011-06-02 08:08:16','2011-06-02 08:08:16'),(361,53,'Member','what_i_bring',1,1,'2011-06-02 08:08:57','2011-06-02 08:08:57'),(362,53,'Member','what_i_bring',1,1,'2011-06-02 08:09:53','2011-06-02 08:09:53'),(363,53,'Member','twitter_username, twitter_token, twitter_id, twitter_secret',1,1,'2011-06-02 08:11:26','2011-06-02 08:11:26'),(364,7,'Member','linked_in_profile_url, linked_in_secret, linked_in_token',1,1,'2011-06-02 12:04:31','2011-06-02 12:04:31'),(365,5,'Member','points',1,1,'2011-06-02 12:07:33','2011-06-02 12:07:33'),(366,1,'Member','linked_in_profile_url',1,1,'2011-06-02 12:10:34','2011-06-02 12:10:34'),(367,47,'Member','linked_in_profile_url',1,1,'2011-06-02 12:10:36','2011-06-02 12:10:36'),(368,2,'Member','linked_in_profile_url',1,1,'2011-06-02 12:11:55','2011-06-02 12:11:55'),(369,5,'Member','linked_in_profile_url',1,1,'2011-06-02 12:12:49','2011-06-02 12:12:49'),(370,46,'Member','linked_in_profile_url',1,1,'2011-06-02 12:13:38','2011-06-02 12:13:38'),(371,54,'Member',NULL,0,1,'2011-06-02 12:23:32','2011-06-02 12:23:32'),(372,54,'Member','created_at, password_generated, image_uid, updated_at, linked_in_profile_url, id, points, linked_in_secret, linked_in_user_id, bio, surname, linked_in_token, forename, password, email',1,1,'2011-06-02 12:23:32','2011-06-02 12:23:32'),(373,55,'Member',NULL,0,1,'2011-06-02 12:59:01','2011-06-02 12:59:01'),(374,55,'Member','created_at, password_generated, fb_user_id, updated_at, id, points, surname, forename, password, email',1,1,'2011-06-02 12:59:01','2011-06-02 12:59:01'),(375,56,'Member',NULL,0,1,'2011-06-02 13:50:07','2011-06-02 13:50:07'),(376,56,'Member','created_at, password_generated, fb_user_id, updated_at, id, points, surname, forename, password, email',1,1,'2011-06-02 13:50:07','2011-06-02 13:50:07'),(377,56,'Member','what_i_bring',1,1,'2011-06-02 13:50:40','2011-06-02 13:50:40'),(378,57,'Member',NULL,0,1,'2011-06-02 15:19:47','2011-06-02 15:19:47'),(379,57,'Member','created_at, password_generated, fb_user_id, updated_at, id, points, surname, forename, password, email',1,1,'2011-06-02 15:19:47','2011-06-02 15:19:47'),(380,58,'Member',NULL,0,1,'2011-06-02 15:24:21','2011-06-02 15:24:21'),(381,58,'Member','created_at, password_generated, fb_user_id, updated_at, id, points, surname, forename, password, email',1,1,'2011-06-02 15:24:21','2011-06-02 15:24:21'),(382,11,'Member','fb_user_id',1,1,'2011-06-02 16:27:43','2011-06-02 16:27:43'),(383,59,'Member',NULL,0,1,'2011-06-02 17:57:31','2011-06-02 17:57:31'),(384,59,'Member','created_at, twitter_username, password_generated, image_uid, updated_at, username, id, points, twitter_token, twitter_id, twitter_secret, bio, surname, forename, password, email',1,1,'2011-06-02 17:57:31','2011-06-02 17:57:31'),(385,16,'Member','ip_address',1,1,'2011-06-02 18:00:52','2011-06-02 18:00:52'),(386,60,'Member',NULL,0,1,'2011-06-02 18:04:02','2011-06-02 18:04:02'),(387,60,'Member','created_at, twitter_username, password_generated, image_uid, updated_at, username, id, points, twitter_token, twitter_id, twitter_secret, bio, surname, forename, password, email',1,1,'2011-06-02 18:04:02','2011-06-02 18:04:02'),(388,60,'Member','what_i_bring',1,1,'2011-06-02 18:04:54','2011-06-02 18:04:54'),(389,59,'Member','ip_address',1,1,'2011-06-02 18:09:00','2011-06-02 18:09:00'),(390,11,'Member','ip_address',1,1,'2011-06-02 20:05:19','2011-06-02 20:05:19'),(391,61,'Member',NULL,0,1,'2011-06-02 20:42:50','2011-06-02 20:42:50'),(392,61,'Member','created_at, twitter_username, password_generated, image_uid, updated_at, username, id, points, twitter_token, twitter_id, twitter_secret, bio, surname, forename, password, email',1,1,'2011-06-02 20:42:50','2011-06-02 20:42:50'),(393,61,'Member','ip_address',1,1,'2011-06-02 20:46:55','2011-06-02 20:46:55'),(394,62,'Member',NULL,0,1,'2011-06-02 20:56:52','2011-06-02 20:56:52'),(395,62,'Member','created_at, updated_at, id, points, surname, forename, password, email',1,1,'2011-06-02 20:56:52','2011-06-02 20:56:52'),(396,62,'Member','what_i_bring',1,1,'2011-06-02 20:57:58','2011-06-02 20:57:58'),(397,62,'Member','twitter_username, twitter_token, twitter_id, twitter_secret',1,1,'2011-06-02 20:57:59','2011-06-02 20:57:59'),(398,62,'Member','image_uid',1,1,'2011-06-02 21:01:09','2011-06-02 21:01:09'),(399,62,'Member','fb_user_id, bio',1,1,'2011-06-02 21:04:48','2011-06-02 21:04:48'),(400,63,'Member',NULL,0,1,'2011-06-02 21:28:02','2011-06-02 21:28:02'),(401,63,'Member','created_at, twitter_username, password_generated, image_uid, updated_at, username, id, points, twitter_token, twitter_id, twitter_secret, bio, surname, forename, password, email',1,1,'2011-06-02 21:28:02','2011-06-02 21:28:02'),(402,63,'Member','what_i_bring',1,1,'2011-06-02 21:33:22','2011-06-02 21:33:22'),(403,63,'Member','what_i_bring',1,1,'2011-06-02 21:33:52','2011-06-02 21:33:52'),(404,60,'Member','ip_address',1,1,'2011-06-02 21:44:26','2011-06-02 21:44:26'),(405,64,'Member',NULL,0,1,'2011-06-02 22:32:53','2011-06-02 22:32:53'),(406,64,'Member','created_at, password_generated, fb_user_id, updated_at, id, points, surname, forename, password, email',1,1,'2011-06-02 22:32:53','2011-06-02 22:32:53'),(407,64,'Member','what_i_bring',1,1,'2011-06-02 22:34:00','2011-06-02 22:34:00'),(408,64,'Member','what_i_bring',1,1,'2011-06-02 22:40:59','2011-06-02 22:40:59'),(409,64,'Member','what_i_bring',1,1,'2011-06-02 22:41:11','2011-06-02 22:41:11'),(410,49,'Member','ip_address',1,1,'2011-06-03 03:54:34','2011-06-03 03:54:34'),(411,15,'Member','points',1,1,'2011-06-03 03:54:47','2011-06-03 03:54:47'),(412,49,'Member','password_generated',1,1,'2011-06-03 03:55:01','2011-06-03 03:55:01'),(413,46,'Member','ip_address',1,1,'2011-06-03 04:30:01','2011-06-03 04:30:01'),(414,53,'Member','ip_address',1,1,'2011-06-03 05:14:53','2011-06-03 05:14:53'),(415,43,'Member','ip_address',1,1,'2011-06-03 07:38:23','2011-06-03 07:38:23');
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
  `from_member_id` int(11) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=137 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,2,8,'Shout',NULL,'2011-05-20 08:35:45','2011-05-20 08:36:39',1,NULL),(2,33,8,'Shout',NULL,'2011-05-20 08:37:37','2011-05-20 09:30:59',1,NULL),(3,2,8,'Shout',NULL,'2011-05-20 08:39:24','2011-05-20 09:42:22',1,NULL),(5,38,2,'FriendRequest',NULL,'2011-05-23 08:56:57','2011-05-23 08:56:57',0,NULL),(7,7,NULL,NULL,'<a href=\'/members/2\'>Andy Mayer</a> is now sitting on your blanket.','2011-05-23 08:58:37','2011-05-31 10:41:23',1,2),(10,5,NULL,NULL,'<a href=\'/members/7\'>Matt Atkins</a> is now sitting on your blanket.','2011-05-24 16:39:49','2011-05-31 10:41:23',1,7),(12,4,13,'Shout',NULL,'2011-05-25 15:46:51','2011-06-01 14:56:33',1,NULL),(13,7,13,'Shout',NULL,'2011-05-26 08:54:32','2011-05-26 10:47:08',1,NULL),(14,5,NULL,NULL,'<a href=\'/members/2\'>Andy Mayer</a> is now sitting on your blanket.','2011-05-26 15:31:29','2011-05-31 10:41:23',1,2),(16,1,NULL,NULL,'<a href=\'/members/7\'>Matt Atkins</a> is now sitting on your blanket.','2011-05-26 15:37:02','2011-05-31 10:41:23',1,7),(18,2,NULL,NULL,'<a href=\'/members/11\'>Kitty Leering</a> is now sitting on your blanket.','2011-05-26 16:04:52','2011-05-31 10:41:23',1,11),(22,5,NULL,NULL,'<a href=\'/members/1\'>Si Wilkins</a> is now sitting on your blanket.','2011-05-27 16:40:39','2011-05-31 10:36:17',1,1),(25,33,NULL,NULL,'<a href=\'/members/7\'>Matt Atkins</a> is now sitting on your blanket.','2011-05-28 06:57:47','2011-05-31 10:35:32',1,7),(26,33,NULL,NULL,'<a href=\'/members/11\'>Kitty Leering</a> is now sitting on your blanket.','2011-05-29 10:40:58','2011-05-31 10:34:21',1,11),(29,35,16,'FriendRequest',NULL,'2011-05-29 22:07:57','2011-05-29 22:07:57',0,NULL),(30,12,17,'FriendRequest',NULL,'2011-05-29 22:08:21','2011-05-29 22:08:21',0,NULL),(33,35,20,'FriendRequest',NULL,'2011-05-30 04:53:29','2011-05-30 04:53:29',0,NULL),(34,10,21,'FriendRequest',NULL,'2011-05-30 04:53:40','2011-05-30 04:53:40',0,NULL),(40,12,27,'FriendRequest',NULL,'2011-05-30 05:06:42','2011-05-30 05:06:42',0,NULL),(41,36,28,'FriendRequest',NULL,'2011-05-30 05:06:45','2011-05-30 05:06:45',0,NULL),(43,14,30,'FriendRequest',NULL,'2011-05-30 05:13:08','2011-05-30 05:13:08',0,NULL),(44,46,NULL,NULL,'<a href=\'/members/2\'>Andy Mayer</a> is now sitting on your blanket.','2011-05-30 06:38:40','2011-05-31 10:33:20',1,2),(45,33,NULL,NULL,'<a href=\'/members/2\'>Andy Mayer</a> is now sitting on your blanket.','2011-05-30 06:38:59','2011-05-31 10:32:35',1,2),(46,46,NULL,NULL,'<a href=\'/members/34\'>Jan-Willem Blom</a> is now sitting on your blanket.','2011-05-30 08:02:47','2011-05-31 10:31:15',1,34),(47,11,NULL,NULL,'<a href=\'/members/34\'>Jan-Willem Blom</a> is now sitting on your blanket.','2011-05-30 08:02:49','2011-05-31 10:29:50',1,34),(52,46,NULL,NULL,'<a href=\'/members/43\'>Micky van Zeijl</a> is now sitting on your blanket.','2011-05-30 11:07:56','2011-05-31 10:29:06',1,43),(53,34,NULL,NULL,'<a href=\'/members/2\'>Andy Mayer</a> is now sitting on your blanket.','2011-05-30 11:59:05','2011-05-31 10:28:53',1,2),(59,14,40,'FriendRequest',NULL,'2011-05-30 16:28:15','2011-05-30 16:28:15',0,NULL),(60,9,41,'FriendRequest',NULL,'2011-05-30 16:28:27','2011-05-30 16:28:27',0,NULL),(61,36,42,'FriendRequest',NULL,'2011-05-30 16:29:13','2011-05-30 16:29:13',0,NULL),(63,12,44,'FriendRequest',NULL,'2011-05-30 16:34:09','2011-05-30 16:34:09',0,NULL),(64,47,NULL,NULL,'<a href=\'/members/46\'>Marcel Kampman</a> is now sitting on your blanket.','2011-05-30 18:05:16','2011-05-30 18:05:16',0,NULL),(65,47,NULL,NULL,'<a href=\'/members/11\'>Kitty Leering</a> is now sitting on your blanket.','2011-05-30 19:50:11','2011-05-31 10:28:20',0,11),(66,47,NULL,NULL,'<a href=\'/members/33\'>Todd Savage</a> is now sitting on your blanket.','2011-05-31 01:19:12','2011-05-31 10:27:36',0,33),(67,46,NULL,NULL,'<a href=\'/members/33\'>Todd Savage</a> is now sitting on your blanket.','2011-05-31 01:19:21','2011-06-03 04:30:46',1,33),(68,34,NULL,NULL,'<a href=\'/members/33\'>Todd Savage</a> is now sitting on your blanket.','2011-05-31 01:19:31','2011-05-31 10:27:18',1,33),(69,47,NULL,NULL,'<a href=\'/members/34\'>Jan-Willem Blom</a> is now sitting on your blanket.','2011-05-31 07:41:34','2011-05-31 10:26:29',0,34),(70,34,NULL,NULL,'<a href=\'/members/7\'>Matt Atkins</a> is now sitting on your blanket.','2011-05-31 08:16:34','2011-05-31 12:54:51',1,7),(71,46,NULL,NULL,'<a href=\'/members/7\'>Matt Atkins</a> is now sitting on your blanket.','2011-05-31 08:16:41','2011-06-03 04:30:46',1,7),(72,11,NULL,NULL,'<a href=\'/members/7\'>Matt Atkins</a> is now sitting on your blanket.','2011-05-31 08:17:15','2011-05-31 10:25:51',1,7),(73,46,NULL,NULL,'<a href=\'/members/1\'>Si Wilkins</a> is now sitting on your blanket.','2011-05-31 08:17:17','2011-06-03 04:30:46',1,1),(74,34,NULL,NULL,'<a href=\'/members/1\'>Si Wilkins</a> is now sitting on your blanket.','2011-05-31 08:17:19','2011-05-31 12:54:51',1,1),(75,46,NULL,NULL,'<a href=\'/members/5\'>Ian Mooney</a> is now sitting on your blanket.','2011-05-31 08:26:03','2011-06-03 04:30:46',1,5),(76,5,45,'FriendRequest',NULL,'2011-05-31 08:54:23','2011-05-31 10:36:04',1,NULL),(77,47,NULL,NULL,'<a href=\'/members/43\'>Micky van Zeijl</a> is now sitting on your blanket.','2011-05-31 12:19:26','2011-05-31 12:19:26',0,43),(78,12,46,'FriendRequest',NULL,'2011-05-31 12:49:31','2011-05-31 12:49:31',0,NULL),(79,14,47,'FriendRequest',NULL,'2011-05-31 12:49:53','2011-05-31 12:49:53',0,NULL),(84,43,NULL,NULL,'<a href=\'/members/34\'>Jan-Willem Blom</a> is now sitting on your blanket.','2011-05-31 12:54:54','2011-05-31 13:00:40',1,34),(85,43,NULL,NULL,'<a href=\'/members/11\'>Kitty Leering</a> is now sitting on your blanket.','2011-05-31 14:25:57','2011-05-31 14:40:16',1,11),(86,43,NULL,NULL,'<a href=\'/members/2\'>Andy Mayer</a> is now sitting on your blanket.','2011-05-31 20:25:37','2011-05-31 21:10:37',1,2),(87,43,NULL,NULL,'<a href=\'/members/33\'>Todd Savage</a> is now sitting on your blanket.','2011-06-01 04:04:57','2011-06-01 08:02:09',1,33),(88,44,NULL,NULL,'<a href=\'/members/2\'>Andy Mayer</a> is now sitting on your blanket.','2011-06-01 08:37:25','2011-06-01 08:37:25',0,2),(94,2,NULL,NULL,'<a href=\'/members/1\'>Si Wilkins</a> is now sitting on your blanket.','2011-06-01 15:06:07','2011-06-01 20:14:41',1,1),(95,4,NULL,NULL,'<a href=\'/members/1\'>Si Wilkins</a> is now sitting on your blanket.','2011-06-01 15:06:11','2011-06-01 15:06:11',0,1),(98,16,NULL,NULL,'<a href=\'/members/49\'>Adam Greenfield</a> is now sitting on your blanket.','2011-06-01 15:27:54','2011-06-01 15:29:11',1,49),(99,16,NULL,NULL,'<a href=\'/members/11\'>Kitty Leering</a> is now sitting on your blanket.','2011-06-01 17:07:04','2011-06-01 18:23:32',1,11),(100,33,16,'Shout',NULL,'2011-06-01 20:28:05','2011-06-01 20:28:05',0,NULL),(101,9,57,'FriendRequest',NULL,'2011-06-02 08:10:20','2011-06-02 08:10:20',0,NULL),(104,53,NULL,NULL,'<a href=\'/members/43\'>Micky van Zeijl</a> is now sitting on your blanket.','2011-06-02 08:24:32','2011-06-03 05:14:59',1,43),(105,53,NULL,NULL,'<a href=\'/members/11\'>Kitty Leering</a> is now sitting on your blanket.','2011-06-02 09:23:30','2011-06-03 05:14:59',1,11),(106,59,60,'FriendRequest',NULL,'2011-06-02 18:06:29','2011-06-02 18:06:29',0,NULL),(107,9,61,'FriendRequest',NULL,'2011-06-02 18:06:46','2011-06-02 18:06:46',0,NULL),(113,60,NULL,NULL,'<a href=\'/members/11\'>Kitty Leering</a> is now sitting on your blanket.','2011-06-02 18:34:04','2011-06-02 18:34:04',0,11),(114,33,67,'FriendRequest',NULL,'2011-06-02 21:45:44','2011-06-02 21:45:44',0,NULL),(125,37,78,'FriendRequest',NULL,'2011-06-02 21:48:17','2011-06-02 21:48:17',0,NULL),(135,60,NULL,NULL,'<a href=\'/members/46\'>Marcel Kampman</a> is now sitting on your blanket.','2011-06-03 04:30:55','2011-06-03 04:30:55',0,46),(136,60,NULL,NULL,'<a href=\'/members/43\'>Micky van Zeijl</a> is now sitting on your blanket.','2011-06-03 07:38:29','2011-06-03 07:38:29',0,43);
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
INSERT INTO `notifications_wall_posts` VALUES (1,3),(2,4),(3,5),(2,6),(12,7),(13,8),(12,8),(100,9);
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (2,1,'What is PICNIC?','','<h5 class=\"article_intro\">\r\n	The PICNIC name represents everything we strive to be. It is a gathering of friends old and new, where everyone brings something to the table.</h5>\r\n<p>\r\n	PICNIC is about innovative ideas for business, people and society. It is a platform that brings together people from diverse backgrounds who like to exchange ideas and insights and are keen to expose themselves to ideas outside their own area of expertise. PICNIC offers an online meeting place to do that through the PICNIC Club, our online community, and the PICNIC News Network (PNN) that offers inspiring, crowdsourced and co-hosted content.</p>\r\n<p>\r\n	In addition PICNIC also organizes off line events, culminating in our annual festival in Amsterdam. During three intensive days we mix creativity, science, technology, media and business to explore new solutions in the spirit of co-creation. Curious minds eager to exchange knowledge, ideas and skills gather at PICNIC and leave with a new perspective on what is possible.</p>\r\n','2011-04-28 11:45:38','2011-05-29 16:45:21','2035-01-01 00:00:00','2011-04-28 11:45:00',0,26,2,''),(4,1,'Team',NULL,'<p>\r\n	The PICNIC team, at your service.</p>\r\n','2011-04-28 11:46:43','2011-05-27 20:04:04','2035-01-01 00:00:00','2011-04-28 11:46:00',0,28,3,''),(5,4,'Get to know our advisors for PICNIC \'11',NULL,'<p>\r\n	PICNIC&#39;s advisors are one of our most valuable resources! They share their dedication, time and expertise to help shape the content and experience that defines PICNIC.</p>\r\n','2011-04-28 11:49:24','2011-05-27 22:53:08','2035-01-01 00:00:00','2011-04-28 11:49:00',0,NULL,70,'Advisors'),(6,4,'Set sail with PICNIC','','<h5 class=\"article_intro\">\r\n	Take a quick ferry ride across the IJ River and join us for PICNIC Festival 2011 at the NDSM Wharf. This former shipyard on the north side of Amsterdam is an emerging location for art, creativity and culture.</h5>\r\n<p>\r\n	NDSM is the largest artistic incubator in the Netherlands, with 130 artists working in 80 studios, surrounded by creative and media businesses, schools and residences. The NDSM Wharf Foundation has big ambitions: maintain and preserve the area&#39;s identity for its historic character, create an open area sustainability lab, and feature high-quality cultural programming. We are proud that PICNIC will contribute toward NDSM&#39;s ambitions. Take a look at their <a href=\"http://www.ndsm.nl/index.php?pg=0&amp;subpg=3\" target=\"_blank\">website</a>.</p>\r\n<p>\r\n	PICNIC Festival 2011 will investigate several scenarios of urban futures. At the NDSM Wharf, we will also use our festival venue as a huge urban lab: together with Tiham&eacute;r Salij of the <a href=\"http://www.thewhyfactory.com/index.php?page=thewhy\" target=\"_blank\">Why Factory</a>, a thinktank on urban scenarios run by MVRDV and Delft University, our creative team has designed a blueprint of the first PICNIC City. Together with leading architects, urbanists and other experts, PICNIC will organize workshops and labs as part of the festival program, discussing the blueprint for PICNIC City 2012. Make sure you join one of them. Your chance to redesign PICNIC Festival 2012 with us.</p>\r\n','2011-04-28 11:50:07','2011-05-29 21:12:20','2035-01-01 00:00:00','2011-04-28 11:50:00',0,39,40,'Location'),(14,1,'Contact us',NULL,'<p>\r\n	Haarlemmerweg 321 B</p>\r\n<p>\r\n	1051 LG Amsterdam </p>\r\n<p>\r\n	The Netherlands</p>\r\n<p>\r\n	Tel: +31 20 320 5813 </p>\r\n<p>\r\n	Email: info(at)picnicnetwork.org</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	Company Registration &amp; Tax information</p>\r\n<p>\r\n	Amsterdam Chamber of Commerce (KvK) Number: 34234137</p>\r\n<p>\r\n	VAT number: 8149.09.322</p>\r\n','2011-05-05 10:50:17','2011-05-27 19:26:13','2035-01-01 00:00:00','2011-05-05 10:49:00',0,27,999,'Contact'),(16,9,'PICNIC Logos in Low & High Res',NULL,'<p>\r\n	Download the PICNIC Logos by clicking <a href=\"/documents/1\" target=\"_blank\">here</a>.</p>\r\n','2011-05-05 10:52:38','2011-05-28 02:48:41','2035-01-01 00:00:00','2011-05-05 10:52:00',0,37,3,'Logos'),(18,10,'Amsterdam, 15 April 2011',NULL,'<h5 class=\"article_intro\">\r\n	PRESS RELEASE: For immediate release</h5>\r\n<p>\r\n	PICNIC &lsquo;11 on &lsquo;Urban Futures&rsquo;: Building the PICNIC CITY</p>\r\n<p>\r\n	PICNIC, Europe&rsquo;s leading event for the creative industries announced its program themes and a new venue for 2011 during a meet-up in the historic Waag building in Amsterdam.</p>\r\n<p>\r\n	Now in its sixth year, PICNIC reiterated its commitment to creativity and technology &ndash; in terms of content, involvement of the PICNIC community and its international reach. This event for professionals is internationally known for its innovative festival approach, combining cutting edge content with new, interactive program formats and a surprising and exciting visitors experience.</p>\r\n<p>\r\n	Waag Society director and PICNIC co-founder Marleen Stikker revealed the theme of PICNIC &rsquo;11: &ldquo;The PICNIC &rsquo;11 theme is &lsquo;Urban Futures&rsquo;. We will explore the impact of global urbanization on our cities, societies and our lives and the way creative and smart technologies can play a role. The challenges following from mega urban environments in areas like demographic shifts, (natural) resources, infrastructure, health and governance are getting more and more pressing. PICNIC brings creative thinkers, developers, designers and entrepreneurs together to collaborate on possible solutions.&rdquo;</p>\r\n<p>\r\n	&ldquo;What will make PICNIC &lsquo;11 really different compared to the preceding editions or any event out there is our theme as the starting point for everything&rdquo;, says Creative Director, Marcel Kampman. &ldquo;We are going to build an actual &ldquo;PICNIC City&rdquo; to prototype creative, urban applications and concepts and we will call upon the PICNIC community to help us build this temporary environment.&rdquo;</p>\r\n<p>\r\n	The &ldquo;PICNIC City&rdquo; will arise at a new location for PICNIC &rsquo;11: the NDSM Wharf on the North side of Amsterdam. PICNIC&rsquo;s Program Director, Kitty Leering commented on the move: &ldquo;We have had an amazing five years at the Westergasfabriek, (((I&rsquo;ve been there, and it&rsquo;s a remodeled fossil-fuel depot that is kinda the ne plus ultra of European &ldquo;stuffed animal&rdquo;))) but the time has come to challenge ourselves more, as well as offer our visitors a new experience. Moving our event to the NDSM Wharf gives us an excellent opportunity to take the look and feel of the festival to another level.&rdquo;</p>\r\n<p>\r\n	According to Rob Post, chairman of the city district Amsterdam-North, the festival and this part of Amsterdam have similar characteristics: &ldquo;PICNIC represents a strong pioneering spirit, innovation and creativity. That also holds true for Amsterdam North. We welcome PICNIC to the sunny side of the IJ&rdquo;</p>\r\n<p>\r\n	PICNIC &rsquo;11 will take place from 14 to 16 September 2011 at the NDSM Wharf in Amsterdam.</p>\r\n<p>\r\n	Download this press release as a PDF</p>\r\n<p>\r\n	###</p>\r\n<p>\r\n	Note to the editor</p>\r\n<p>\r\n	About PICNIC</p>\r\n<p>\r\n	PICNIC is about innovative ideas for business and society. It is an annual three-day festival that blurs the lines between creativity, science, technology and business to explore new solutions in the spirit of co-creation. Curious minds eager to exchange their knowledge, ideas and skills gather at PICNIC, making it the place to create the future &ndash; together.</p>\r\n<p>\r\n	PICNIC &lsquo;11 takes place at the NDSM Wharf in Amsterdam from 14 to 16 September 2011.</p>\r\n<p>\r\n	www.picnicnetwork.org</p>\r\n<p>\r\n	For more information, please contact:</p>\r\n<p>\r\n	Kitty Leering, Program Director</p>\r\n<p>\r\n	Tel: +31 (0)20 320 5813</p>\r\n<p>\r\n	kitty@picnicnetwork.org</p>\r\n<p>\r\n	PICNIC</p>\r\n<p>\r\n	Haarlemmerweg 321 B</p>\r\n<p>\r\n	1051 LG Amsterdam</p>\r\n<p>\r\n	www.picnicnetwork.org</p>\r\n<p>\r\n	Photos of previous PICNIC festivals are available here: http://www.flickr.com/photos/crossmediaweek</p>\r\n','2011-05-05 11:13:18','2011-05-28 02:40:47','2035-01-01 00:00:00','2011-05-05 11:13:18',0,NULL,0,'Announcing PICNIC Festival 2011'),(19,10,'Amsterdam, 9 June 2011',NULL,'<p>\r\n	During a meet-up for PICNIC&#39;s sponsors and partners, creative director Marcel Kampman revealed the first bleuprint of the PICNIC City.</p>\r\n','2011-05-05 11:14:07','2011-05-29 17:15:21','2035-01-01 00:00:00','2011-06-15 11:14:00',0,NULL,0,'PICNIC reveals bleuprint of the PICNIC City'),(20,10,'Press release 3',NULL,'<p>\r\n	Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna.</p>\r\n','2011-05-05 11:14:49','2011-05-29 17:16:03','2035-01-01 00:00:00','2011-09-18 11:14:00',0,NULL,0,'Press release 3'),(21,9,'Photos and videos',NULL,'<h4>\r\n	Photos</h4>\r\n<p>\r\n	For photos of PICNIC &#39;10 and past PICNICs, please visit our <a href=\"http://www.flickr.com/photos/crossmediaweek\" target=\"_blank\">Flickr page</a>. Most of the photos can be republished under the Creative Commons license. Please remember to credit the photographer when using any of these images.</p>\r\n<h4>\r\n	Videos</h4>\r\n<p>\r\n	Lectures from PICNIC &#39;10 and prior events, as well as promotional films can be found on our <a href=\"http://vimeo.com/picnicfestival\" target=\"_blank\">Vimeo channel</a>.</p>\r\n','2011-05-05 11:18:32','2011-05-28 02:30:15','2035-01-01 00:00:00','2011-05-05 11:18:00',0,34,4,'Photos and videos'),(24,9,'About Press',NULL,'<p>\r\n	Looking for more information about PICNIC? On this page, you will find a complete selection of resources for the press, including logos, images and press releases from PICNIC and our partners.</p>\r\n<p>\r\n	Find out what the media has to say about PICNIC! Please take a moment to check out a selection of the great press coverage from PICNIC.</p>\r\n<p>\r\n	For additional press-related requests, please contact us directly:</p>\r\n<p>\r\n	PICNIC</p>\r\n<p>\r\n	+31 (0)20 320 5813 </p>\r\n<p>\r\n	press(at)picnicnetwork.org</p>\r\n','2011-05-05 11:41:12','2011-05-29 17:10:39','2035-01-01 00:00:00','2011-05-05 11:41:00',0,22,0,'About Press'),(25,9,'Press clippings',NULL,'<p>\r\n	Another successful edition of PICNIC is behind us! Below you&#39;ll find just a small selection of the press coverage of PICNIC &#39;10.</p>\r\n<h4>\r\n	Links</h4>\r\n<ul>\r\n	<li>\r\n		Press coverage link 1</li>\r\n	<li>\r\n		Press coverage link 2</li>\r\n	<li>\r\n		Press coverage link 3</li>\r\n	<li>\r\n		Press coverage link 4</li>\r\n	<li>\r\n		Press coverage link 5</li>\r\n</ul>\r\n','2011-05-05 12:13:25','2011-05-28 02:32:35','2035-01-01 00:00:00','2011-05-31 12:13:00',0,35,99,'Press clippings'),(26,4,'Speakers','','<p>\r\n	Here are the speakers for PICNIC Festival 2011.&nbsp;</p>\r\n','2011-05-05 12:29:41','2011-05-31 20:25:06','2035-01-01 00:00:00','2011-06-12 07:00:00',0,NULL,30,''),(35,7,'Early Bird registration is open!','<p>\r\n	this is a page intro</p>\r\n','<h5 class=\"article_intro\">\r\n	Early Bird tickets are now available for PICNIC Festival 2011. Purchase yours today!</h5>\r\n<h5 class=\"article_intro\">\r\n	Experience the entire festival or visit for one day. Add on special networking dinners on Wednesday and Thursday night.</h5>\r\n<p>\r\n	<a href=\"http://www.eventpartners04.nl/picnic\" target=\"_blank\">Go to the registration page and buy your ticket now.</a></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"font-family: \'VAG Rounded W02 Light\',arial,sans-serif; font-size: 21px; line-height: 33px;\">Festival Passe-partout</span></p>\r\n<p>\r\n	This ticket provides access to all PICNIC Festival 2011 events on 14, 15 and 16 September. &nbsp;Lunch is included each day.</p>\r\n<p>\r\n	<strong><a href=\"http://www.eventpartners04.nl/Default.aspx?alias=www.eventpartners04.nl/picnic\" target=\"_blank\">Early Bird Price until 31 July: &euro; 695 (ex VAT</a><a href=\"http://www.eventpartners04.nl/Default.aspx?alias=www.eventpartners04.nl/picnic\" target=\"_blank\">)</a></strong></p>\r\n<p>\r\n	Full Price: &euro; 995 (ex VAT)</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<span class=\"Apple-style-span\" style=\"font-family: \'VAG Rounded W02 Light\',arial,sans-serif; font-size: 21px; line-height: 33px;\">Day ticket</span></p>\r\n<p>\r\n	Sample one day at PICNIC Festival 2011. Choose one day: &nbsp;14, 15 or 16 September. Lunch is included with your day ticket.</p>\r\n<p>\r\n	<strong><a href=\"http://www.eventpartners04.nl/Default.aspx?alias=www.eventpartners04.nl/picnic\" target=\"_blank\">Early Bird Price until 31 July: &euro; 295 (ex VAT)&nbsp;</a></strong></p>\r\n<p>\r\n	Full Price: &euro; 395 (ex VAT)</p>\r\n','2011-05-06 17:14:01','2011-06-01 17:28:59','2035-01-01 00:00:00','2011-05-06 17:14:00',0,25,3,'How to register'),(48,4,'PICNIC Festival 2011','<br />\r\n','<h5 class=\"article_intro\">\r\n	PICNIC is so much more than your average conference, it&#39;s a festival! What sets PICNIC apart from the rest? Keep reading to find out more.</h5>\r\n<ul>\r\n	<li>\r\n		Three full days of information, inspiration, collaboration, co-creation and entertainment. A chance for prolonged conversations and development of relationships.</li>\r\n	<li>\r\n		Interdisciplinary themes attract the widest possible audience. Every year, our key themes evolve to reflect changes in our personal lives, our society, economy and environment. Cutting-edge content with far-reaching applications.</li>\r\n	<li>\r\n		Get inspired by the latest visions from global thought leaders. But also learn from exciting, new and upcoming talents.</li>\r\n	<li>\r\n		Make and create. PICNIC is not for observers, it&rsquo;s for participants. Lectures are only a small part of the PICNIC experience. Competitions, challenges, social games, matchmaking, labs and workshops encourage everyone to get involved and get their hands dirty.</li>\r\n	<li>\r\n		Play. Interactive exhibitions, games, networking sessions and unexpected surprises make for a fun and laid-back experience.</li>\r\n	<li>\r\n		Interaction across boundaries. Speakers guide students. Designers meet business developers. Hackers collaborate with artists. The combinations are endless.</li>\r\n	<li>\r\n		Casual, social atmosphere wrapped in a festival environment.</li>\r\n	<li>\r\n		Escape to another world. The entire event ground is transformed by the PICNIC look and feel.</li>\r\n</ul>\r\n<p>\r\n	Take a look at the video below to get a brief impression of what you can experience at PICNIC. For a more in-depth idea of some of the topics we cover at the yearly PICNIC festival, be sure to view our archive of PICNIC lectures on Vimeo.</p>\r\n<p>\r\n	http://www.youtube.com/watch?v=w_DmwaVNAJ8</p>\r\n','2011-05-11 12:41:47','2011-05-31 16:36:52','2035-05-02 23:00:00','2011-05-11 12:41:00',0,32,0,'Overview'),(56,20,'Hotels and Travel','','<h5 class=\"article_intro\">\r\n	September is a busy period in Amsterdam, so we encourage out-of-town visitors to book flights and hotels immediately.&nbsp;</h5>\r\n<h2>\r\n	Flights</h2>\r\n<p>\r\n	Schiphol Airport Amsterdam is an international airport with direct connections worldwide, and is accessible by train to the city centre in 15 minutes.</p>\r\n<p>\r\n	<a href=\"http://www.airfranceklm-globalmeetings.com/?eid=13239AF\" target=\"_blank\"><img src=\"/media/BAhbBlsHOgZmIi8yMDExLzA1LzIzLzA1XzU1XzAzXzM3M19BaXJfRnJhbmNlX0tMTS5qcGc\" alt=\"\" style=\"width: 251px; height: 47px; float: left;\" /></a></p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	PICNIC visitors can book flights on KLM and Air France by visiting the <a href=\"http://www.airfranceklm-globalmeetings.com/?eid=13239AF\" target=\"_self\">Air France and KLM Global Meetings website</a> and using event code 13239AF. This code also can be used when booking through your travel agency.</p>\r\n<p>\r\n	<em>Get the best price for your flight with AIR FRANCE &amp; KLM Global Meetings. Event ID Code to keep for the booking: 13239AF</em></p>\r\n<p>\r\n	<a href=\"/air-france-klm-global-meetings-information\"><em>More details here</em></a></p>\r\n<h2>\r\n	Hotels</h2>\r\n<p>\r\n	PICNIC Festival 2011 will be held this year at the NDSM Wharf, a 12-minute ferry ride across the river IJ on the north side of Amsterdam. Ferries depart often from behind Centraal Station.</p>\r\n<p>\r\n	Amsterdam has over 400 registered hotels of varying standards from budget facilities to some of the most expensive hotels in Europe. When you are booking a hotel, we suggest booking one within a short walk to Centraal Station and the ferry landing.</p>\r\n<p>\r\n	We have negotiated special PICNIC rates for a limited number of rooms at three hotels close to the station:</p>\r\n<h4>\r\n	Mint Hotel</h4>\r\n<p>\r\n	Located on the riverfront next to Centraal Station, Amsterdam&#39;s brand-new <a href=\"http://www.minthotel.com/our-hotels/amsterdam\" target=\"_blank\">Mint Hotel</a> opened in May. Rooms are airy and modern and furnished with Apple iMacs and free high-speed Wi-Fi. The hotel&#39;s Skylounge offers stunning views of the city of Amsterdam and as far as the PICNIC venue at the NDSM Wharf. A lounge on the ground floor will be a gathering place for both visitors and PICNIC speakers staying at the hotel.</p>\r\n<p>\r\n	Mint Hotel has a limited number of <a href=\"http://www.minthotel.com/our-hotels/amsterdam/gallery\" target=\"_blank\">rooms</a> at a special PICNIC rate of <em>&euro;169,00 per room per night</em>, including VAT, excluding breakfast and 5% city tax. Booking rooms at the Mint Hotel is possible starting from Thursday 2nd of June.&nbsp;</p>\r\n<p>\r\n	<em>available until 1st of July</em></p>\r\n<h4>\r\n	Lloyd Hotel</h4>\r\n<p>\r\n	The <a href=\"http://www.lloydhotel.com/\" target=\"_blank\">Lloyd Hotel</a> is the first &lsquo;one to five star&rsquo; hotel of the world and is situated in a revamped 1920s building and is a showcase of Dutch design. The rooms differ in size, but the high quality service is the same for everybody: beds with feather quilts, an excellent restaurant with pure, local food, where breakfast is served.&nbsp;The hotel is five minutes by tram from Centraal Station.</p>\r\n<p>\r\n	The Lloyd Hotel has a limited number of two-star <a href=\"http://www.lloydhotel.com/attachment-1527-en.html\" target=\"_blank\">rooms</a> at a special PICNIC rate of<strong> </strong><em>&euro;145 per room per night</em>, including VAT, excluding breakfast and 5% city tax. If you would like to book your room(s) at the Lloyd Hotel, please send your reservation inquiry to m.degroot@lloydhotel.com (Majorie de Groot) and mention promotion code <strong>GF10446</strong> to be eligible for the discount. Please note that you need to mention your credit card details (cc number and expiry date) for this booking.</p>\r\n<p>\r\n	<em>available until 1st of July</em></p>\r\n<h4>\r\n	Park Plaza Victoria Hotel</h4>\r\n<p>\r\n	The four-star <a href=\"http://www.parkplaza.com/amsterdam-hotel-nl-1012lg/netamst\" target=\"_blank\">Park Plaza Victoria Amsterdam</a> is located in the heart of the city centre near shopping and business districts, opposite Centraal Station. The hotel features 306 rooms.</p>\r\n<p>\r\n	Park Plaza Victoria Hotel has a limited number of <a href=\"http://www.parkplaza.com/amsterdam-hotel-nl-1012lg/netamst/rooms\" target=\"_blank\">rooms</a> at a special PICNIC rate of <em>&euro;159,00 per room per night</em>, including VAT, excluding breakfast and 5% city tax. If you would like to book your room(s) at the Park Plaza Victoria Hotel, please visit the <a href=\"http://www.parkplaza.com/reservation/itineraryEntrance.do?newSearch=true&amp;hotelCode=NETAMST&amp;promotionalCode=PICNIC\" target=\"_blank\">reservation page</a> and put in promotion code <strong>PICNIC</strong> to be eligible for the discount.</p>\r\n<p>\r\n	<em>available until 1st of July</em></p>\r\n','2011-05-16 10:54:19','2011-06-01 12:06:29','2035-01-01 00:00:00','2011-05-16 10:54:19',0,29,0,''),(57,4,'Urban Futures','<br />\r\n','<h5 class=\"article_intro\">\r\n	The world is undergoing the largest wave of population growth in history: we are looking at more than 8 billion people in 2030 and essentially all of the growth will take place in the less developed countries, concentrated among the poorest populations in urban areas. By that time at least 70% of the world population will be living in an urban environment.</h5>\r\n<p>\r\n	And there is a very good reason for that development: urban environments hold many promises for a better future simply because of their massive scale and density. Cities generate jobs and thus income, they can provide education, healthcare and other services more efficiently than less densely settled areas. And cities offer the chance to climb the social ladder, especially for women.</p>\r\n<p>\r\n	But the same scale and proximity that provide chances, will also amplify challenges to keep urban life livable. Most cities have never been designed to host a population that soon will surpass that of the entire Netherlands (16,6 million). So can their infrastructure hold up, maintaining the distribution of utilties? What about mobility issues, clogged up streets and insufficient transport?</p>\r\n<p>\r\n	Environment and sustainability are a huge challenge in dense areas like (mega)cities: from waste management (the vast landfills in India go hand in hand with the waste crisis in Naples, Italy), to air quality (the smog filled cities in China) and the use of (natural) resources. How can technology help to monitor our usage and visualize the &quot;problem areas&quot;?</p>\r\n<p>\r\n	The huge scale of our (future) megacities will also impact social dynamics and the commitment of residents to keep up the quality of their living environment. In emerging countries like Brazil and India, growing slums demand a new approach of governance and valuation of informal economic dynamics. Should the role of governments change? And can the application of open data or the influence of social media play a role in shifting control back to citizens more?</p>\r\n<p>\r\n	We&#39;re looking to engage you and others of the world&#39;s most creative and innovative minds at PICNIC Festival 2011. Join us investigating several urban future scenarios, including perspectives on:</p>\r\n<ul>\r\n	<li>\r\n		<strong>Infrastructure</strong>: mobility, sewage, utility grids, street plan, public transport, public and private buildings, public services.</li>\r\n	<li>\r\n		<strong>Sustainability</strong>: waste, water, green energy, pollution, Co2, building green, nano-tech, urban gardens, economy, bio-tech, food.</li>\r\n	<li>\r\n		<strong>Society</strong>: governance, open data, health, education, social cohesion, poverty, democratization, privacy, aging, immigration, safety.</li>\r\n	<li>\r\n		<strong>Design</strong>: city planning, architecture, health care, educational system, green, social change, data visualization, products, services.</li>\r\n	<li>\r\n		<strong>Media</strong>: urban screens, social media, gamification, trans media, augmented city, open versus closed, privacy, social engineering.</li>\r\n</ul>\r\n','2011-05-16 11:26:25','2011-06-01 17:30:15','2035-01-01 00:00:00','2011-05-16 11:26:00',0,12,10,'Themes'),(58,4,'Who attends PICNIC Festival?','<br />\r\n','<h5 class=\"article_intro\">\r\n	PICNIC Festival attracts a global audience from a wide range of sectors.</h5>\r\n<p>\r\n	PICNIC attendees include creative agencies, artists, scientists, designers, marketers, brand managers, content producers, (new) media experts, government leaders, programmers, investors, lawyers, entrepreneurs, freelancers, inventors, technology providers, games developers, services providers, students and teachers just to name a few!</p>\r\n<p>\r\n	PICNIC attendees have one thing in common: they are all curious minds with a passion for finding innovative solutions for the challenges we face today and tomorrow.&nbsp;</p>\r\n','2011-05-16 11:37:05','2011-06-01 17:30:49','2035-01-01 00:00:00','2011-05-16 11:37:00',0,47,60,'Who attends?'),(59,15,'PICNIC announces new venue and Urban Futures theme for 2011',NULL,'<h5 class=\"article_intro\">\r\n	PICNIC, Europe&rsquo;s leading event for the creative industries, announced its program themes and a new venue for 2011 during a meet-up in the historic Waag building in Amsterdam.</h5>\r\n<p>\r\n	After five years, PICNIC moves to NDSM wharf and builds a PICNIC City</p>\r\n<p>\r\n	Now in its sixth year, PICNIC reiterated its commitment to creativity and technology &ndash; in terms of content, involvement of the PICNIC community and its international reach. This event for professionals is internationally known for its innovative festival approach, combining cutting edge content with new, interactive program formats and a surprising and exciting visitors experience.</p>\r\n<p>\r\n	Waag Society director and PICNIC co-founder Marleen Stikker revealed the theme of PICNIC &rsquo;11: &ldquo;The PICNIC &rsquo;11 theme is &lsquo;Urban Futures&rsquo;. We will explore the impact of global urbanization on our cities, societies and our lives and the way creative and smart technologies can play a role. The challenges following from mega urban environments in areas like demographic shifts, (natural) resources, infrastructure, health and governance are getting more and more pressing. PICNIC brings creative thinkers, developers, designers and entrepreneurs together to collaborate on possible solutions.&rdquo;</p>\r\n<p>\r\n	&ldquo;What will make PICNIC &lsquo;11 really different compared to the preceding editions or any event out there is our theme as the starting point for everything&rdquo;, says Creative Director, Marcel Kampman. &ldquo;We are going to build an actual &ldquo;PICNIC City&rdquo; to prototype creative, urban applications and concepts and we will call upon the PICNIC community to help us build this temporary environment.&rdquo;</p>\r\n<p>\r\n	PICNIC &rsquo;11 will take place from 14 to 16 September 2011 at the NDSM Wharf in Amsterdam.</p>\r\n<p>\r\n	The &ldquo;PICNIC City&rdquo; will arise at a new location for PICNIC &rsquo;11: the NDSM Wharf on the north side of the river IJ in Amsterdam. PICNIC&rsquo;s Program Director, Kitty Leering commented on the move: &ldquo;We have had an amazing five years at the Westergasfabriek, but the time has come to challenge ourselves more, as well as offer our visitors a new experience. Moving our event to the NDSM Wharf gives us an excellent opportunity to take the look and feel of the festival to another level.&rdquo;</p>\r\n<p>\r\n	According to Rob Post, chairman of the city district Amsterdam-North, the festival and this part of Amsterdam have similar characteristics: &ldquo;PICNIC represents a strong pioneering spirit, innovation and creativity. That also holds true for Amsterdam North. We welcome PICNIC to the sunny side of the IJ.&rdquo;</p>\r\n','2011-05-16 11:59:23','2011-05-17 16:33:58','2035-01-01 00:00:00','2011-04-26 11:59:00',0,14,0,'Urban Futures'),(60,20,'The weekend after PICNIC',NULL,'<h5 class=\"article_intro\">\r\n	<span class=\"Apple-style-span\" style=\"font-family: \'VAG Rounded W02 Light\', arial, sans-serif; font-size: 14px; line-height: 21px; \">Amsterdam has many attractions to fill your time the weekend after PICNIC. Look for tips here closer to the festival.</span></h5>\r\n<p>\r\n	Flights to London and other European capitals can be made in one to three hours.</p>\r\n<p>\r\n	Direct trains run from Amsterdam to Paris (three hours and 19 minutes), Brussels and Antwerp (both two hours) and to such German cities as Cologne (two hours) and Berlin (six hours). Most destinations within the Netherlands can be reached within about two hours. For more information, visit the website of the <a href=\"http://www.ns.nl/en\" target=\"_blank\">NS</a>, the Dutch rail service.</p>\r\n','2011-05-16 13:21:49','2011-05-20 14:21:48','2035-01-01 00:00:00','2011-05-16 13:21:49',0,NULL,0,'After PICNIC'),(61,20,'Getting to the venue',NULL,'<p>\r\n	<strong>Traveling to Amsterdam </strong></p>\r\n<p>\r\n	Schiphol Airport provides a fairly economical way to city-hop to Amsterdam from other spots.</p>\r\n<p>\r\n	<em>From Schiphol Airport to Amsterdam City Center by train</em></p>\r\n<p>\r\n	From Schiphol, you can take a direct train to Amsterdam Central Station for &euro;3.70 in 20 min. Buy the ticket from the yellow machines. The train station at Schiphol is located underground, under the main airport hall; trains to Amsterdam Central Station run from platform 3. There are 4 to 5 trains per hour during peak times</p>\r\n<p>\r\n	<em>From Schiphol Airport to Amsterdam City Center by local transport</em></p>\r\n<p>\r\n	Local transport (bus) from Schiphol to central Amsterdam takes about 30 min and leads directly to the southwest of the centre of Amsterdam (Museumplein and Leidseplein). Take local bus 197, which costs &euro;2.38 to Leidseplein using the OV-chipkaart. Bus 197 runs every 15 min for most of the day, daily from 5:01AM till midnight.</p>\r\n<p>\r\n	<em>From Schiphol Airport to Amsterdam City Center by Connexxion Hotel Shuttle</em></p>\r\n<p>\r\n	The Connexxion Hotel Shuttle serves over 100 city center hotels, departing every 30 minutes between 6 AM and 9 PM, which cost about &euro;15.50/25.00 one-way/return. Buses depart from platform A7 and can be reserved for the trip back.</p>\r\n<p>\r\n	<strong>Traveling to PICNIC </strong></p>\r\n<p>\r\n	The &ldquo;PICNIC City&rdquo; will arise at a new location for PICNIC &rsquo;11: the NDSM Wharf on the north side of the river IJ in Amsterdam. There are two ways to visit PICNIC on the NDSM Wharf:</p>\r\n<p>\r\n	<em>Ferry from Amsterdam Central Station</em></p>\r\n<p>\r\n	At the backside of Amsterdam Central Station you&rsquo;ll find the Ferry Wharf. Crossing over to NDSM is free and will take about 10 minutes. The Ferry to NDSM departs every half hour. Bus from Amsterdam Central Station</p>\r\n<p>\r\n	You can also take Bus 35 with direction &lsquo;Molenwijk&rsquo; to the NDSM Wharf (stop at Ataturk). Bus 91 or 94 with direction &lsquo;Zaandam is also possible (stop at Klaprozenweg). The Bus Platform is located at the backside of Central Station.</p>\r\n<p>\r\n	<em>Ticketing System</em></p>\r\n<p>\r\n	The OV Chipkaart (Public Transport Chipcard) is the only valid way of traveling in Amsterdam. Check in at the start of the journey and check out at the end by holding the card in front of the card reader. The OV-chipkaart can be obtained from GVB vending machines in all metro stations and from Central Station desks.</p>\r\n<p>\r\n	<strong>Climate </strong></p>\r\n<p>\r\n	Amsterdam in July and August has an average temperature of 72&deg;F (22&deg;C).</p>\r\n','2011-05-16 14:21:46','2011-06-01 12:53:17','2035-01-01 00:00:00','2011-07-31 14:21:00',0,NULL,0,'Getting to the venue'),(62,15,'Spotlight on MaxClass: participant in PICNIC \'10 Pitch Night and Marketplace','<p>\r\n	PICNIC has a passion for great ideas and inspiring individuals with an entrepreneurial spirit. In 2010, we introduced the PICNIC Business Program with expanded offerings for start-ups, SMBs and entrepreneurs. One of the participants was Michiel Klonhammer, with his new initiative called MaxClass. Michiel&rsquo;s been hard at work since last year&rsquo;s event, and his social networking platform specifically for schools/classrooms is now live! Keep reading to find out more about Michiel and MaxClass&hellip;</p>\r\n','<h5 class=\"article_intro\">\r\n	Get to know MaxClass: Social media for school and home</h5>\r\n<p>\r\n	We&rsquo;re always curious to find out more about people and companies who participate in PICNIC, especially ones that seem on the brink of having a real impact in their market. Happily, Michiel Klonhammer was more than willing to give us a peek behind the scenes of MaxClass and the process he went through transforming a great idea into a functioning business.</p>\r\n<p>\r\n	<em>Congratulations on the launch of MaxClass! Can you tell us a little more about your company, who MaxClass is meant for, and the benefits of such a platform?</em></p>\r\n<p>\r\n	MaxClass is a communication platform for pupils, parents and teachers. We call it social media for school and home but it&#39;s different from current social media in that it&#39;s specifically designed for education and it&#39;s private. We first presented the concept during Picnic &lsquo;10 and after a private beta we went live at the end of January 2011. After about 6 weeks we have 250 classes in the Netherlands and - really exciting - since we opened up to non-Dutch schools yesterday we have schools in India, Alaska, Florida, Columbia and Australia. They are all just starting up so it&#39;s too early to know how it&#39;s going but we&#39;re really excited!</p>\r\n<p>\r\n	<em>When did you first get the idea for MaxClass? Many great business ideas get stuck at the idea phase. What gave you the courage to actually pursue turning this idea into a business/service?</em></p>\r\n<p>\r\n	I know it sounds crazy, but I simply woke up with the whole idea as a blueprint. I&#39;m happy I told my girlfriend about it in detail that morning otherwise I might not have believed this myself. Somehow I am just completely convinced this needs to be done. Once I started telling people about it, they kept saying that &quot;it must already exist&quot;. But I knew that wasn&#39;t the case so I realized I was on to something important.</p>\r\n<p>\r\n	<em>How much time was there between the idea stage and the launch stage? Can you walk us through some of your key milestones along the way?</em></p>\r\n<p>\r\n	I started talking about it in 2009 with lots of people (especially parents, teachers and educational publishers) and it took nearly a year of research, sketching and planning before I stopped my job and invested all my money into it.</p>\r\n<p>\r\n	I realized I needed a brilliant team to pull this off and I was lucky to find Marc Worrell (ex Mediamatic), Joost Faber (ex Lostboys) and Atilla Erdodi (ex Erlang Solutions) willing to join me.</p>\r\n<p>\r\n	That&#39;s really the biggest step - the people. In November we had a big party to launch a private beta and then we were ready to go live at the end of January. So I guess from the morning I woke up, to the day we went live took about 20 months.</p>\r\n<p>\r\n	<em>Do you consider yourself an &ldquo;entrepreneur at heart&rdquo;? Have you started other businesses in the past, or is this your first venture? What do you find most appealing about running your own business?</em></p>\r\n<p>\r\n	Yes, I think this is my perfect fit. I love art, science and even large corporations but I&#39;m probably at my best in a startup situation. It&#39;s incredible what you can achieve with a small team of smart people. The combination of low overhead and enough energy to work obsessively is pretty productive! But at the same time, I like managing a bigger company as I did before (with ICATT interactive media) so I&#39;m looking forward to growing. It&#39;s fun to work like crazy for a while, but at the same time I want people that work with me to be able to have a life.</p>\r\n<p>\r\n	<em>You participated in PICNIC &rsquo;10 at Pitch Night and the Chamber of Commerce Marketplace. How did you find out about these activities and what made you decide to attend?</em></p>\r\n<p>\r\n	PICNIC is the coolest event in the Netherlands by far. I love the crazy mix of stuff that goes on.</p>\r\n<p>\r\n	I&#39;ve been a visitor several times even though it&#39;s pretty expensive for smaller companies. So I had already decided to try and do our first presentation there somehow. I heard about the specific event through Syntens and the PICNIC mailing lists, so it didn&#39;t take long to jump at that chance.</p>\r\n<p>\r\n	<em>What did you find most valuable about your experience at PICNIC? Did you gain any good connections or learn something new? If so, please elaborate!</em></p>\r\n<p>\r\n	The nice thing about PICNIC is that a lot of people have an open mind and are just curious. So when you&#39;re still in the phase of getting your story straight, it&#39;s a great place. It&#39;s different from a regular conference because you can discuss instead of only presenting.</p>\r\n<p>\r\n	We actually met some of the people that joined the private beta later and we interviewed a lot of visitors to see what they thought. We had three interns that we dressed up as a Russian Camera crew (one of the interns was Russian) - which actually got them past security!</p>\r\n<p>\r\n	I met an investor on the dance floor (this is really true!) who I&#39;m still in contact with.</p>\r\n<p>\r\n	<em>What are your goals for MaxClass in the coming year?</em></p>\r\n<p>\r\n	Well we&#39;re trying to grow into a platform that is used by a few hundred thousand people. So we have to focus on getting it perfect, letting people know what we&#39;re doing and - not unimportantly - attracting more investors.</p>\r\n<p>\r\n	<em>What advice would you give to other entrepreneurs who are considering diving in to a new business venture? For example, what are some positive (or even negative) lessons you learned as you were building MaxClass?</em></p>\r\n<p>\r\n	If you are based in the Netherlands, you need to decide you do not care too much if you fail.</p>\r\n<p>\r\n	The Dutch are pretty careful people and that gets in the way sometimes. At the same time, you need to know what you&#39;re doing. I chose to work on the idea for a couple of months before writing a business plan. I really don&#39;t believe that you can write a plan at the very start like starting entrepreneurs are often told. Just get to work!</p>\r\n<p>\r\n	Something that has been absolutely amazing is that it&#39;s possible to set up a business based on cloud applications - so for the first time ever you can avoid buying expensive licenses for such things as accounting, CRM, domain management, file servers etc and just pay for the use of it all. It&#39;s not free but so much less work and overhead. It&#39;s interesting to experience this as MaxClass is a cloud application as well.</p>\r\n<p>\r\n	Having said that, I personally need to work with people in one office so I can work side by side with them. I think it&#39;s wise to keep in extremely close contact with the people you work with. Of course you can do it online but I need and enjoy the contact in the office.</p>\r\n<p>\r\n	<em>Finally, how can people find out more about MaxClass?</em></p>\r\n<p>\r\n	www.maxclass.com</p>\r\n<p>\r\n	michiel(at)maxclass.com</p>\r\n<p>\r\n	www.twitter.com/maxclassEng</p>\r\n<p>\r\n	tel: +31 (0)20 8202383</p>\r\n<p>\r\n	Thanks once again to Michiel for sharing his story! If you are curious to find out more &ndash; especially if you work in the education sector &ndash; please don&rsquo;t hesitate to get in touch with him.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	<em>If you are a (former) PICNIC participant with exciting news about your venture or a story about how PICNIC impacted your business, drop us a line at info(at)picnicnetwork.org</em></p>\r\n','2011-05-17 14:14:16','2011-05-29 22:18:27','2035-01-01 00:00:00','2011-03-24 15:13:00',0,43,0,'Spotlight on MaxClass'),(63,15,'Cure Violence: Portrait of an Epidemic','','<h5 class=\"article_intro\">\r\n	Chicago-based video artist and former PICNIC speaker Lincoln Schatz continually strives to use his artistic abilities to create projects that inspire social change and public interaction. His most recent work is a composite video entitled Cure Violence: Portrait of an Epidemic. This video series is a portrait of more than 50 Chicago residents committed to ending gun violence.</h5>\r\n<h3>\r\n	A chapter a month to reduce violence</h3>\r\n<p>\r\n	Cure Violence: Portrait of an Epidemic is a composite video portrait of Chicagoans who are working to reduce violence in their communities. Each month for the next year, Lincoln Schatz will release a new chapter in this series.</p>\r\n<p>\r\n	You can <a href=\"http://lincolnschatz.com/cure-violence-portrait-of-an-epidemic/\" target=\"_blank\">watch the first chapter on Lincoln&rsquo;s website</a> or subscribe to the whole series as <a href=\"http://itunes.apple.com/us/podcast/cure-violence/id425696044\" target=\"_blank\">iTunes Podcasts</a>.</p>\r\n<p>\r\n	Lincoln created Cure Violence: Portrait of an Epidemic in conjunction with <a href=\"http://www.ceasefirechicago.org/\" target=\"_blank\">CeaseFire</a>, a nonprofit organization dedicated to working with community and government partners to reduce violence. Travelling through the greater Chicago area in 2009, including the neighborhoods most ridden with violence, he interviewed people from the CeaseFire network of violence interrupters, outreach workers and community members. He processed the footage through his custom software to create a non-editorialized composite portrait of the complex landscape of violence.</p>\r\n<p>\r\n	Cure Violence: Portrait of an Epidemic is intended to increase awareness, incite social action and provide a platform for discussion.</p>\r\n<p>\r\n	Learn more about Lincoln Schatz and his work at http://lincolnschatz.com.</p>\r\n','2011-05-17 16:32:52','2011-05-29 21:40:50','2035-01-01 00:00:00','2011-03-21 17:32:00',0,40,0,''),(64,15,'Help FairPhone celebrate its first birthday on 17 March','','<h5 class=\"article_intro\">\r\n	FairPhone is the world&rsquo;s first collective, non-profit developer of fair trade mobile phones. On 17 March, you&rsquo;re invited to help celebrate the first anniversary of FairPhone with a special event at the Waag in Amsterdam. In addition to this milestone, FairPhone is also celebrating the return of the FairPhone team who recently travelled to Congo to collect samples of raw materials to be used in the first Fair Phone prototypes.</h5>\r\n<h2>\r\n	FairPhone presents: The future of FairPhone - retour du Congo</h2>\r\n<p>\r\n	On 17 March 2011 the initiators of FairPhone (Waag Society, NIZA and Schrijf-Schrijf) are hosting a festive gathering, and you&rsquo;re invited to be a part of it! This special occasion marks the first birthday of FairPhone and the return of team members who recently completed a fact and resource finding mission in Congo. During this event they will also give a preview of the future of the FairPhone campaign: developing a phone based on fair resources.</p>\r\n<p>\r\n	Show your support for FairPhone and join the festivities on 17 March! Just send an email to events(at)waag.org to reserve your place.</p>\r\n<h3>\r\n	Program details</h3>\r\n<p>\r\n	Look back at what FairPhone has accomplished in the past year and learn about their plans for the future. During this event, they will reveal exciting collaborations and special partners. There are workshops on raw materials (bring along your old mobile!) and the FairPhone team will give demonstrations on how to campaign successfully. Furthermore, experts on Congo, fair-trade and (phone) design share their knowledge and experience.</p>\r\n<p>\r\n	<strong>15:30 Doors open</strong></p>\r\n<p>\r\n	<strong>16:00 &ndash; 18:30 Congo experience, mobile phone design &amp; fair-trade campaigning</strong></p>\r\n<p>\r\n	Learn more about mining and processing of cobalt, from the team who went straight to the source in Congo. Explore mobile phone design and development. Learn how to build a successful fair-trade campaign using examples like Tony Chocolonely. The afternoon program closes with drinks and time for open discussion.</p>\r\n<p>\r\n	<strong>19:00 &ndash; 21:00 Documentary, workshops, Q&amp;A</strong></p>\r\n<p>\r\n	During the evening, you can watch the IDFA documentary &quot;Blood in the Mobile&quot;, and participate in workshops from Our Mobile Generation and Urban Mining. The FairPhone team will be on hand for Q&amp;A, as well as to reveal the future of the FairPhone campaign and the process of developing a fair-trade mobile phone. The evening session also closes with a drink.</p>\r\n<p>\r\n	The event takes place at the Waag building (Nieuwmarkt 4) in Amsterdam. Sign up today by sending an email to events(at)waag.org.</p>\r\n<p>\r\n	FairPhone is an initiative of Waag Society, development organisation Niza and communication agency Schrijf-Schrijf. Oxfam Novib&rsquo;s Doenersnet is part of the official FairPhone team.</p>\r\n<p>\r\n	FairPhone is made possible by NCDO.</p>\r\n<p>\r\n	Learn more about FairPhone at: http://fairphone.com</p>\r\n','2011-05-17 16:37:26','2011-05-17 16:39:45','2035-01-01 00:00:00','2011-03-10 17:37:00',0,16,0,''),(68,15,'We are now entering the era of Sustainism','','<h5 class=\"article_intro\">\r\n	On Thursday 20 January, visitors wedged their way into a packed room at the ABC Treehouse in Amsterdam for the official launch of &lsquo;Sustainism,&rsquo; a new book by Michiel Schwarz and Joost Elffers. We were privileged to have Michiel as a guest in the Press Lounge at PICNIC &rsquo;10, where he organized a special &ldquo;pre-launch&rdquo; of his book back in September.</h5>\r\n<p>\r\n	Michiel and Joost boldly introduce their book as a manifesto &ndash; the identification of a new era following modernism and post-modernism. They are putting a name on an era we have already entered, with new attitudes and ideas than the previous generations.</p>\r\n<p>\r\n	The elements of Sustainism they identified certainly rang true. Our new cultural perspective can be seen in the current emergence of an interconnected global age, a returned interest in localism, the era of climate change, and the tendency toward openness and sharing.</p>\r\n<h3>\r\n	Naming a cultural shift</h3>\r\n<p>\r\n	With their academic (Michiel) and creative design (Joost) backgrounds, they are clear to state that their strength lies in observation. They are simply putting a name on the current transition in the world we already inhabit, not trying to start a new movement.</p>\r\n<p>\r\n	Rather than being a dry studious read, &lsquo;Sustainism&rsquo; is a very accessible book, combining a collection of powerful statements with strong symbolism. Get your copy at the <a href=\"http://www.abc.nl/\" target=\"_blank\">American Book Center</a> in Amsterdam.</p>\r\n<p>\r\n	<strong>Read their recent coverage in the New York Times:</strong></p>\r\n<ul>\r\n	<li>\r\n		<a href=\"http://www.nytimes.com/2011/01/10/arts/10iht-design10.html\" target=\"_blank\">Sustainism: It&rsquo;s Got a Name, Now Do It!</a></li>\r\n</ul>\r\n','2011-05-17 16:53:56','2011-05-29 22:25:44','2035-01-01 00:00:00','2011-01-24 17:53:00',0,NULL,0,''),(70,15,'ID Award: Vote for PICNIC Co-founder Bas Verhart!','','<h5 class=\"article_intro\">\r\n	PICNIC co-founder Bas Verhart has been nominated by BID (Big Improvement Day) for their 2011 ID Award! This yearly award is given to a person with an extraordinary idea for an innovative product or service that addresses a need in the market and Bas has gained recognition for THNK, his new organization for educating creative leadership. Want to show your support for Bas? Be sure to vote for him before Monday 17 January. Keep reading for more details&hellip;</h5>\r\n<h2>\r\n	Big Improvement Day: Great ideas for improving business in the Netherlands</h2>\r\n<p>\r\n	This year, the <a href=\"http://www.bigimprovementday.nl/\" target=\"_blank\">BID (Big Improvement Day)</a> event takes place on 18 January at the RAI in Amsterdam. BID is a platform for inspiring connections, new insights and boundary-crossing collaboration. It&rsquo;s a podium for Dutch professionals to offer their input on the continued improvement of the business environment within the Netherlands.</p>\r\n<p>\r\n	During BID 2011, the Netherlands&rsquo; top business minds will give presentations, and there will be plenty of time for networking. During the course of the day, they will also announce the winners of 4 different awards for inspiring professionals who are making a difference this country: the LEF Award, ID Award, 3e Dinsdag Award (3rd Thursday) and BID Award.</p>\r\n<h3>\r\n	Cast your vote for Bas Verhart</h3>\r\n<p>\r\n	Bas Verhart has been nominated for the ID Award&hellip;but he needs your help to win! Show your support for Bas by casting your vote before Monday 17 January. <a href=\"http://www.bigimprovementday.nl/awards/Stemmen/\" target=\"_blank\"><strong>Simply go to the voting page on the BID website</strong></a>. On the bottom of the page, you will see tabs to vote for each of the four awards, including the ID Award. (<em>Please note, the website is in Dutch and you will be required to vote for all four awards to complete your entry</em>.)</p>\r\n<p>\r\n	Bas has been nominated on the strength of his latest business venture THNK, an Amsterdam-based school for creative leadership. THNK&rsquo;s mission is to develop a new breed of global creative leaders who co-create to solve real world challenges and generate unexpected innovations. Their graduate-level education programs will teach a select group of experienced professionals how to lead continuous innovation and radical collaboration, manage complexity and develop new creative processes. THNK&rsquo;s first full-time program will launch in September 2011.</p>\r\n<p>\r\n	<a href=\"http://www.thnk.org/blog/\" target=\"_blank\">Visit the THNK website to learn more</a>. &nbsp;</p>\r\n','2011-05-17 17:00:00','2011-05-17 17:00:00','2035-01-01 00:00:00','2011-01-11 17:57:00',0,NULL,0,''),(71,15,'Social Cities with Dennis Crowley','','<h5 class=\"article_intro\">\r\n	Dennis Crowley, co-founder and CEO of foursquare, talks to the audience at PICNIC &rsquo;10 about making cities more social. His company mixes human behavior, locative technology, gaming mechanics and mobile devices to encourage people to interact and explore the cities in which they live.</h5>\r\n<h3>\r\n	Combining digital interaction with physical locations</h3>\r\n<p>\r\n	In his own words, Dennis introduces foursquare by saying, &ldquo;We build things for mobile phones&hellip;to make cities easier to use and the world more interesting to explore.&rdquo;</p>\r\n<p>\r\n	His organization started with a simple question &ndash; How can we connect people and physical points on a map in a fun and interesting way? This led them to come up with a mobile application that allowed people to &ldquo;check in&rdquo; to physical locations they visited, leave tips and info for other visitors, and compete with each other for &ldquo;digital candy&rdquo; like badges or mayor of a specific location. It also gave companies a new platform for interacting and offering promotions to both new visitors and loyal customers.</p>\r\n<p>\r\n	Beyond the features of foursquare&rsquo;s mobile apps, Dennis digs deeper to explore how game mechanics &ndash; used in foursquare and elsewhere &ndash; can be used to affect changes in real world behavior and make people think differently about how they experience their physical surroundings.</p>\r\n<p>\r\n	http://vimeo.com/17756354</p>\r\n','2011-05-17 17:00:57','2011-05-17 17:02:39','2035-01-01 00:00:00','2010-12-13 18:00:00',0,NULL,0,''),(72,15,'Instrumenting the City: Data is King with Andreas Weigend',NULL,'<h5 class=\"article_intro\">\r\n	Andreas Weigend loves people and the data they create. He was formerly Chief Scientist at Amazon.com, where he helped build the customer-centric, measurement-focused culture that has become central to Amazon&#39;s success. Since 2003, he has been teaching The Social Data Revolution, Data Mining and E-Business at Stanford, and The Digital Networked Economy at Tsinghua in China.</h5>\r\n<p>\r\n	In his lecture at PICNIC &rsquo;10, Andreas Weigend discusses the importance of data and how it will impact the future of cities. He looks at the city from the perspective of its most crucial element &ndash; people. He explains how the behavior of people is changing based on the data they create and share and the feedback they receive. Andreas shares poignant and often very entertaining examples of how the feedback we receive from devices, websites and other people impacts and shapes our motivations, reactions and decisions.</p>\r\n<p>\r\n	http://vimeo.com/16769612</p>\r\n','2011-05-17 17:03:29','2011-05-17 17:03:29','2035-01-01 00:00:00','2010-12-13 18:02:00',0,NULL,0,''),(73,15,'Paradigm Shift with Reinier de Graaf',NULL,'<h5 class=\"article_intro\">\r\n	In less than ten years the world&rsquo;s largest cities will be exclusively located outside of the West. The metropolis, zenith of Western civilization, will be a property of the third world. Reinier de Graaf joins us at PICNIC &rsquo;10 to look at the consequences of this paradigm shift: What theoretical framework could guide the turbulent growth of cities in emerging regions and what will be the repercussions for the West as a former front runner?</h5>\r\n<p>\r\n	During his lecture, Reinier outlines how the world&rsquo;s largest cities are exploding in the most deprived, least developed, and least democratic countries. He explored what this means to the countries and their citizens who face economic, urban planning and infrastructure challenges that are much more daunting than what we are accustomed to in the West.</p>\r\n<p>\r\n	Reinier de Graaf joined the Office for Metropolitan Architecture (OMA, founded by Rem Koolhaas) in 1996. As Partner of OMA he is responsible for a number of building projects in Europe, Russia and the Middle East. He is also director of AMO, the research and design studio established in 1998 as a counterpart to the architectural practice of OMA. AMO operates in fields such as media, sociology, technology, energy, fashion, publishing and graphic design.</p>\r\n<p>\r\n	http://vimeo.com/16107033</p>\r\n','2011-05-17 17:08:47','2011-05-29 22:26:25','2035-01-01 00:00:00','2010-11-25 18:07:00',0,NULL,0,''),(74,21,'Disclaimer','','<h5 class=\"article_intro\">\r\n	This website has been drafted with the greatest possible care.</h5>\r\n<p>\r\n	Nonetheless, the Amsterdam Cross Media Week Foundation (ACMW) cannot guarantee the absence of any mistakes and/or incorrect information on this website. Please be informed the content of this website is solely intended as general information and the content of this website is not in any way construed as granting any right to any party. Therefore, no party shall have any claim pursuant to the content of this website and ACMW shall not be held liable for any incorrect information on this website. In addition, ACMW is not liable for any virus or other failure on this website.</p>\r\n<p>\r\n	This website contains referrals or links to other websites, which are outside of the domain of this website. These referrals and/or links are selected by ACMW for information purposes only. The Foundation is not responsible and/or liable for any and all content of or availability of these external websites and no referral or link may be deemed to be an approval by ACMW of the content of any external website.</p>\r\n<p>\r\n	ACMW explicitly reserves the right to deny any visitor the access to this website or part(s) thereof. In addition, ACMW may monitor the access of its visitors to this website. Furthermore, ACMW explicitly reserves the right to adjust this website in such way it deems appropriate.</p>\r\n<p>\r\n	Visitors of this website indemnify and hold harmless ACMW and any of ACMW&rsquo;s employees, board members and/or representatives from any claim from any third party pursuant to the use of this website or the content thereof.</p>\r\n<p>\r\n	During your visit, so-called &lsquo;cookies&rsquo; may be automatically saved on the hard disk of your computer. These cookies allow ACMW to further develop our website and adjust it better to the wishes of the visitors of this website. Most internet browsers have the possibility to delete cookies, reject cookies or to have you informed before cookies are saved on your hard disk. Please read the instruction manual and/or help program of your internet browser for further details.</p>\r\n<p>\r\n	Any and all information provided to us through this website shall not be shared with third parties, and regulated as outlined in our privacy policy.</p>\r\n<p>\r\n	The content of this website is subject to copyrights and cannot be used without prior written approval from ACMW. The name and trademark of ACMW are protected as trademarks, as a consequence of which these cannot be used without ACMW&rsquo;s prior written approval. Should you be interested in using the trademarks, please contact ACMW to request approval.</p>\r\n<p>\r\n	To the terms and conditions of this website are subject to the laws of the Netherlands. Any dispute arising out of or pursuant to these terms and conditions shall be settled by the competent courts in Amsterdam, the Netherlands.</p>\r\n','2011-05-18 15:38:09','2011-05-31 14:41:40','2035-01-01 00:00:00','2011-05-18 15:38:00',0,NULL,0,''),(75,21,'Terms and conditions',NULL,'<h5 class=\"article_intro\">\r\n	Below you will find PICNIC&#39;s general terms and conditions for purchasing a ticket to our event.</h5>\r\n<h4>\r\n	Article 1 &ndash; Definitions</h4>\r\n<p>\r\n	<strong>ACMW:</strong> Stichting Amsterdam Cross Media Week, a foundation, incorporated and existing under the laws of the Netherlands, having its principle place of business at Haarlemmerweg 321 B, 1051 LG Amsterdam</p>\r\n<p>\r\n	<strong>PICNIC:</strong> a cross media event named &lsquo;PICNIC&rsquo;, organised by ACMW</p>\r\n<p>\r\n	<strong>General Terms &amp; Conditions:</strong> these general terms &amp; conditions</p>\r\n<p>\r\n	<strong>Participant:</strong> each party, being a natural person or legal person, participating in any way in PICNIC</p>\r\n<h4>\r\n	Article 2 &ndash; Registration fee</h4>\r\n<p>\r\n	2.1 Participants who wish to attend (one or more specific parts of) PICNIC can register for the event online.</p>\r\n<p>\r\n	2.2 For each registration for PICNIC or partial registration, payment of a registration fee is due, unless otherwise agreed between a Participant and ACMW. The registration fees applicable are set forth on www.picnicnetwork.org. Payment of the registration fee can be made online via the PICNIC website of ACMW by iDEAL or credit card through a secure server. Under certain circumstances, the registration fee can also be paid by invoice.</p>\r\n<p>\r\n	2.3 After payment of the registration fee is received by ACMW, the participant will receive a confirmation of its registration. With this confirmation, the participant shall be able to collect its ticket(s) at the reception of PICNIC.</p>\r\n<h4>\r\n	Article 3 &ndash; Participation</h4>\r\n<p>\r\n	3.1 The number of Participants that can attend PICNIC, or parts thereof, is limited. Registrations are handled on a first-come, first-served basis. If the maximum number of Participants of (parts of) PICNIC is reached, ACMW has the right to refuse a registration. Moreover, ACMW retains the right to reject any Participant.</p>\r\n<p>\r\n	3.2 ACMW cannot guarantee a minimum number of Participants to (any part of) the Cross Media Week Event (PICNIC).</p>\r\n<p>\r\n	3.3 ACMW reserves the right to amend and adapt the event&rsquo;s programme and speakers&rsquo; list of PICNIC.</p>\r\n<h4>\r\n	Article 4 &ndash; Liability</h4>\r\n<p>\r\n	4.1 ACMW will under no circumstances be liable for any damages whatsoever arising from the refusal of a registration.</p>\r\n<p>\r\n	4.2 ACMW shall not be liable for any damages of a Participant arising in connection with PICNIC.</p>\r\n<p>\r\n	4.3 Under no circumstance shall ACWM be liable for any damage arising pursuant to a situation of force majeure. The expression &quot;force majeure&quot; shall mean and include any circumstance or occurrence beyond ACMW&#39;s reasonable control - whether or not foreseeable at the time of registration - in consequence of which ACMW cannot reasonably be required to execute its obligations. Such circumstances or occurrences explicitly include but are not restricted to: war, fires, floods, earthquakes, labor disputes, strikes, epidemics, governmental regulations and/or similar acts, embargoes, defaults of suppliers or subcontractors, disruption of electricity supplies, the non-availability of telecommunication services and withdrawal of the Dutch government and/or the city of Amsterdam as sponsor(s) of PICNIC.</p>\r\n<h4>\r\n	Article 5 &ndash; Cancellation and transfer</h4>\r\n<p>\r\n	5.1 Should the Participant be unable to attend PICNIC for any reason, the Participant may transfer the registration to another person within its organization or company at any time by providing written notice to the following email address: info(at)picnicnetwork.org. Please note we do not offer refunds, only the possibility to transfer ownership.</p>\r\n<p>\r\n	5.2 In the event of cancellations, no refunds will be provided by ACMW.</p>','2011-05-18 15:38:37','2011-05-18 15:44:16','2035-01-01 00:00:00','2011-05-18 15:38:37',0,NULL,0,''),(76,21,'Privacy policy',NULL,'<h5 class=\"article_intro\">\r\n	Collected Data and Purpose</h5>\r\n<p>\r\n	Amsterdam Cross Media Week Foundation (ACMW) collects various sorts of personal data. These include your name, address (including e-mail address), and phone number. The Foundation collects such data in order to (i) make it possible for the Foundation to inform you about the event PICNIC &lsquo;10 and additional events organized by the ACMW; (ii) make it possible to register visitors of this website who wish to attend PICNIC &lsquo;10. The Foundation only uses your email address and name to send you a newsletter about PICNIC, which you can opt-out of at any time. ACMW explicitly does not provide any personal data to third parties having a (legal) relationship with ACMW. Any provision by ACMW of personal data to any third party shall only be done after the prior written approval of the individual concerned.</p>\r\n','2011-05-18 15:39:05','2011-05-18 15:45:56','2035-01-01 00:00:00','2011-05-18 15:39:05',0,NULL,0,''),(79,26,'Air France KLM Global Meetings Information','','<p>\r\n	<strong>Event:<em> PICNIC</em></strong></p>\r\n<p>\r\n	Event ID: <strong><em>13239AF</em></strong></p>\r\n<p>\r\n	Valid for travel from<strong> 09/09/2011 to 21/09/2011</strong></p>\r\n<p>\r\n	Event location: <strong>Amsterdam, Netherlands</strong></p>\r\n<p>\r\n	Discounts are applied to a wide range of airfares on all Air France and KLM flights worldwide.</p>\r\n<p>\r\n	-10% on a range of published unrestricted public fares and -5% discount on a large range of restricted</p>\r\n<p>\r\n	fares.</p>\r\n<p>\r\n	Discounts up to -47%* are offered on domestic flights in Metropolitan France.</p>\r\n<p>\r\n	Use the website of this event or visit www.airfranceklm-globalmeetings.com to</p>\r\n<p>\r\n	<strong>&bull; access the preferential fares granted for this event,</strong></p>\r\n<p>\r\n	<strong>&bull; make your booking,</strong></p>\r\n<p>\r\n	<strong>&bull; issue your electronic ticket*,</strong></p>\r\n<p>\r\n	<strong>&bull; select your seat**,</strong></p>\r\n<p>\r\n	<strong>&bull; and print your boarding card**.</strong></p>\r\n<p>\r\n	If you buy your ticket via AIR FRANCE &amp; KLM Global Meetings website, your electronic ticket will carry</p>\r\n<p>\r\n	a special mention which justifies the application of the preferential fares.</p>\r\n<p>\r\n	Should you prefer to process your reservations and ticket-purchase directly with an Air France and</p>\r\n<p>\r\n	KLM sales outlet, &lt;u&gt;you must keep this current document which serves to justify the application of the&lt;/u&gt;</p>\r\n<p>\r\n	&lt;u>preferential airfares&lt;/u></p>\r\n<p>\r\n	Keep the document to justify the special fares with you as you may be asked for it at any point</p>\r\n<p>\r\n	of your journey.</p>\r\n<p>\r\n	To locate your nearest Air France and KLM sales point, visit: www.airfrance.com or www.klm.com.</p>\r\n<p>\r\n	You will need to quote the reference given above which is registered in AIR FRANCE KLM data into</p>\r\n<p>\r\n	GDS Amadeus: GGAIRAFEVENTNEGO or GGAIRAFGLOBALMEETINGS</p>\r\n<p>\r\n	Frequent flyer / loyalty programs of Air France and KLM partner airlines are credited with &quot;miles&quot; when</p>\r\n<p>\r\n	Air France or KLM flights are used.</p>\r\n<p>\r\n	* not available in certain countries</p>\r\n<p>\r\n	** subject to conditions</p>\r\n<p>\r\n	<em>Air France, French Limited Company with a capital of 1,901,231,625 euros</em></p>\r\n<p>\r\n	<em>Head Office: 45, rue de Paris, 95747 Roissy CDG cedex, France</em></p>\r\n<p>\r\n	<em>Registered on the Trade and Companies register in Bobigny under no. 420 495 178</em></p>\r\n<p>\r\n	<em>Koninklijke Luchtvaart Maatschappij n.v. (also known as KLM Royal Dutch Airlines)</em></p>\r\n<p>\r\n	<em>Head Office: Amsterdamseweg 55, 1182 GP Amstelveen, the Netherlands</em></p>\r\n<p>\r\n	Registered No 33014286</p>\r\n<p>\r\n	Edited by AIR FRANCE &amp; KLM Global Meetings: JH.VC</p>\r\n','2011-05-23 13:10:46','2011-06-01 12:02:28','2035-01-01 00:00:00','2011-05-23 13:10:00',0,NULL,0,'Air France KLM Global Meetings Information'),(80,27,'Answer PICNIC’s call to REDESIGN THE WORLD',NULL,'<p>\r\n	HeadsUp! 2011, along with PICNIC, has brought together an extraordinary group of advisors from the worlds of design, communication, data visualization and climate science to forge a unique competition: a challenge to international designers to transform climate data into an interactive animated digital display &ndash; a &ldquo;heads up display&rdquo; for the planet.</p>\r\n<p>\r\n	Slides of the session are available here.</p>\r\n<p>\r\n	Communication of climate trends is a difficult problem uniquely suited to designers: crafting clear messages of unfamiliar substances at unimaginable scales into recognizable and actionable news. Advances in data visualization, the embrace of social networks and mobile platforms coupled with virtual and augmented realities offer new opportunities to create a shared sign in the public square.</p>\r\n<p>\r\n	And not just any public square....</p>\r\n<p>\r\n	TIMES SQUARE !</p>\r\n<p>\r\n	Today HeadsUp! 2011 and PICNIC are thrilled to announce the participation</p>\r\n<p>\r\n	of Thomson Reuters in providing an extraordinary venue for the competition.</p>\r\n<p>\r\n	The winning entries to the HeadsUp! 2011 Design Challenge will be awarded display time on TS2, Times Square Squared, a Reuters / NASDAQ Alliance. TS2, comprising both the NASDAQ and Reuters displays commands over 19,000 square feet of digital signboards over 21 stories high. 1,5 million people a day passing through Times Square, looking up: What will you post there?</p>\r\n<p>\r\n	TS2 live webcam</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	September 2010 - LAUNCH</p>\r\n<p>\r\n	January 2011 - COMPETITION OPENS</p>\r\n<p>\r\n	MAY 2011 - FINALISTS CHOSEN</p>\r\n<p>\r\n	JUNE 2011 - DISPLAY TIME ON TS2</p>\r\n','2011-05-24 12:22:55','2011-05-24 12:22:55','2035-01-01 00:00:00','2011-05-24 12:21:00',0,19,0,'HeadsUp!'),(81,1,'PICNIC in Beta','','<h5 class=\"article_intro\">\r\n	We are currently in beta - which means we&#39;ve released our new online platform before it&#39;s finished.&nbsp;Why did we do that? The answer is simple. We want to get feedback from you, our community, during the development process rather than afterwards.</h5>\r\n<p>\r\n	And we sincerely appreciate your constructive comments! Therefore we will raffle off 3 free PICNIC Festival Passe Partouts among the feedback submissions that we receive before July 1, 2011. So don&#39;t be shy and tell us what you think! Than we&#39;ll build our new online platform together.</p>\r\n','2011-05-27 15:35:50','2011-05-31 08:31:08','2035-01-01 00:00:00','2011-05-27 15:34:00',0,27,998,'Beta'),(89,4,'Scenes from 2010','<br />\r\n','<h3>\r\n	Whether you&#39;re a veteran or first-timer, dive into our visual archives documenting past PICNIC festivals to enjoy both images at <a href=\"http://www.flickr.com/photos/crossmediaweek/sets/72157624988417397/\" target=\"_blank\">Flickr</a> and some of our <a href=\"http://www.vimeo.com/picnicfestival\" target=\"_blank\">PICNIC speakers at Vimeo</a>.</h3>\r\n<h3>\r\n	&nbsp;</h3>\r\n<h3>\r\n	What did everyone bring to PICNIC &#39;10?</h3>\r\n<p>\r\n	http://www.vimeo.com/16245565</p>\r\n<p>\r\n	&nbsp;</p>\r\n<h3>\r\n	Reinier de Graaf on&nbsp;Urban Paradigm Shifts</h3>\r\n<p>\r\n	http://www.vimeo.com/16107033</p>\r\n<p>\r\n	&nbsp;</p>\r\n<h3>\r\n	Dennis Crowley, Foursquare founder, on Social Cities</h3>\r\n<p>\r\n	http://www.vimeo.com/17756354</p>\r\n<p>\r\n	&nbsp;</p>\r\n<h3>\r\n	Aza Raskin on Redesigning Memories</h3>\r\n<p>\r\n	http://www.vimeo.com/16729734</p>\r\n<p>\r\n	&nbsp;</p>\r\n<h3>\r\n	Evan Ratliff of Wired Magazine on Vanishing in the Digital Age</h3>\r\n<p>\r\n	http://vimeo.com/15732565</p>\r\n','2011-05-27 20:12:42','2011-06-01 17:32:19','2035-01-01 00:00:00','2011-05-27 20:12:00',0,6,100,'Scenes from 2010'),(91,15,'Out of town visitors',NULL,'<p>\r\n	PICNIC Festival attracts some of the world&#39;s most creative and innovative minds. We&#39;ve arranged special rates on airfare and hotels. Book one of the three festival hotels <a href=\"/travel-and-accommodations\" target=\"_blank\"><strong>before 1 July</strong></a> for special savings, including the brand-new Mint Hotel.</p>\r\n','2011-05-27 22:43:21','2011-06-01 16:39:00','2035-01-01 00:00:00','2011-05-27 22:43:21',0,29,0,'Hotel and travel info'),(93,15,'Early Bird registration is open!','','<p>\r\n	Yay! PICNIC Early Bird Registration is open. Make sure you profit from our spectacular early bird offer and <a href=\"/festival-registration\" target=\"_blank\">buy a ticket now</a>.</p>\r\n<p>\r\n	This year&#39;s PICNIC Festival will take place between 14 and 16 September, of course in beautiful Amsterdam. We&#39;d love to welcome you, so join us.</p>\r\n','2011-05-27 23:20:12','2011-06-01 16:39:03','2035-01-01 00:00:00','2011-06-01 05:00:00',0,38,0,'Registration starts today'),(94,1,'Contributors',NULL,'<p>\r\n	We are proud to have so many creative minds in the PICNIC community that we can call our friends. Not only do they have great ideas to make PICNIC an even better and more beautiful platform, they also help us to realize all of our crazy plans. And we love them for that! Big time.&nbsp;</p>','2011-05-29 16:56:24','2011-06-01 12:01:19','2035-01-01 00:00:00','2011-05-29 16:56:00',0,NULL,4,''),(96,31,'Nationale Postcode Lotterij','','<p>\r\n	The <strong>Dutch Postcode Lottery</strong> (Nationale Postcode Loterij) is a charitable organization focused on supporting organizations working to create a more just and green world through fundraising and increasing public awareness with the help of a lottery.</p>\r\n<p>\r\n	It&#39;s Holland&rsquo;s biggest and most popular charitable lottery and it supports 75 charity organizations UNICEF, Greenpeace, WWF, IUCN and the Clinton Foundation. In 2009, the lottery allocated 256 million euros to its beneficiaries.</p>\r\n<p>\r\n	<strong><a href=\"http://www.postcodeloterij.nl\" target=\"_blank\">www.postcodeloterij.nl</a></strong></p>\r\n<p>\r\n	&nbsp;</p>\r\n<h4>\r\n	<strong>Postcode Lottery Green Challenge 2010</strong></h4>\r\n<p>\r\n	The Green Challenge 2010 calls on creative, innovative minds to come up with concrete solutions to fight climate change. Anyone with a good idea for a product or service that reduces greenhouse gas emissions in a consumer-friendly way and contributes to a sustainable lifestyle is welcome to take part. Together with PICNIC, the Dutch Postcode Lottery started this initiative in 2007. The winner receives 500,000 euro from the Postcode Lottery to execute their plan.</p>\r\n<p>\r\n	<a href=\"http://www.greenchallenge.info\" target=\"_blank\">www.greenchallenge.info</a></p>\r\n<p>\r\n	<a href=\"http://www.greenchallengeblog.com\" target=\"_blank\">www.greenchallengeblog.com</a></p>\r\n','2011-06-01 09:19:32','2011-06-02 11:39:37','2035-01-01 00:00:00','2011-06-01 09:14:00',0,58,0,''),(97,31,'Vodafone','','<p>\r\n	<strong>Vodafone</strong> is one of the largest mobile communications companies in the Netherlands and is part of the Vodafone Group, the world&rsquo;s leading mobile telecommunications group. Vodafone Netherlands has a customer base of 4.4 million customers. It has a Head Offices in both Maastricht and Amsterdam. Almost 3000 employees work with Vodafone Netherlands.</p>\r\n<p>\r\n	Vodafone is dedicated to providing the best products and services for the ever-innovative mobile telecoms market. Their goal is to provide the best accessibility and connectivity worldwide, for the best possible price. Their passionate and talented employees help keep Vodafone at the leading edge of their market.</p>\r\n<p>\r\n	For more information visit: <a href=\"http://www.vodafone.nl\" target=\"_blank\">www.vodafone.nl</a></p>\r\n<h4>\r\n	Vodafone Mobile Clicks 2011</h4>\r\n<p>\r\n	<em>With Vodafone Mobile Clicks we provide a stage for young innovative mobile internet start ups to accelerate their ideas and support them in making their next step in the mobile market.</em></p>\r\n<p>\r\n	<strong>Vodafone Mobile Clicks</strong> is an international contest to identify and develop the best, most innovative mobile internet start-ups. Announced at The Next Web Conference in Amsterdam, the closing date for entries is midnight CET on 12th June, 2011.</p>\r\n<p>\r\n	Already known as the biggest start-up competition of its kind, this year&rsquo;s Vodafone Mobile Clicks is open to seven markets. Any start-up in Germany, the Netherlands, Portugal, the Republic of Ireland, Spain, Turkey or the United Kingdom that has a mobile site, service or application can compete for the <strong>&euro;225,000</strong> prize fund.</p>\r\n<p>\r\n	Judging will take place over three rounds. Firstly, each competing market will draw up a shortlist of their five best submissions, then a local winner will be selected. Lastly, all seven local winners will be invited to represent their country in a live final at the PICNIC festival in the Netherlands on 15th &ndash; 16th September 2011, where the overall winner will be chosen.</p>\r\n<p>\r\n	This year&rsquo;s <a href=\"https://developer.vodafone.com/mobileclicks2011/jury-bios/\" target=\"_blank\">high-profile judges</a> include Rudy de Waele, founder of Mobile 2.0 Europe and dotopen; Peter Barry, Head of VC and Start-up at Vodafone Ventures; Paul Jozefak, Managing Partner at Mobile VC; Reshma Sohoni, Partner at Seedcamp, and Lee Epting, Director of Content Services at Vodafone Group. Each judge will score entries based on five criteria:</p>\r\n<ol>\r\n	<li>\r\n		Originality, creativity and innovativeness</li>\r\n	<li>\r\n		Technical and operational feasibility</li>\r\n	<li>\r\n		Economic and financial viability</li>\r\n	<li>\r\n		Value to end-users</li>\r\n	<li>\r\n		The quality of the management team (e.g. their experience, knowledge, skills, relationships)</li>\r\n</ol>\r\n<p>\r\n	This is a fantastic opportunity to gain expert feedback for your entry, both qualitatively and quantitatively from all of the jury members. And if your entry reaches the finals, then you&rsquo;ll also benefit from our extensive PR and coverage.</p>\r\n<p>\r\n	If you have the inspiration and desire to be the best, then <a href=\"https://id.developer.vodafone.com/user/signin/?next=/authenticate/%3Fopenid.claimed_id%3Dhttp%253A%252F%252Fspecs.openid.net%252Fauth%252F2.0%252Fidentifier_select%26openid.identity%3Dhttp%253A%252F%252Fspecs.openid.net%252Fauth%252F2.0%252Fidentifier_select%26openid.assoc_handle%3D%257BHMAC-SHA256%257D%257B4de5ec95%257D%257B%252F9pBdA%253D%253D%257D%26openid.return_to%3Dhttp%253A%252F%252Fsubmit.vodafonemobileclicks.com%252Fdesktopmodules%252Fauthenticationservices%252Fvodafoneopenid%252Fentrypage.aspx%253Fdnoa.userSuppliedIdentifier%253Dhttps%25253A%25252F%25252Fid.developer.vodafone.com%25252Fauthenticate%26openid.realm%3Dhttp%253A%252F%252Fsubmit.vodafonemobileclicks.com%252F%26openid.mode%3Dcheckid_setup%26openid.ns%3Dhttp%253A%252F%252Fspecs.openid.net%252Fauth%252F2.0%26openid.ns.alias3%3Dhttp%253A%252F%252Fopenid.net%252Fsrv%252Fax%252F1.0%26openid.alias3.required%3Dalias1%252Calias2%252Calias3%252Calias4%252Calias5%252Calias6%252Calias7%252Calias8%26openid.alias3.mode%3Dfetch_request%26openid.alias3.type.alias1%3Dhttp%253A%252F%252Faxschema.org%252Fcontact%252Femail%26openid.alias3.count.alias1%3D1%26openid.alias3.type.alias2%3Dhttp%253A%252F%252Faxschema.org%252FnamePerson%26openid.alias3.count.alias2%3D1%26openid.alias3.type.alias3%3Dhttp%253A%252F%252Faxschema.org%252FnamePerson%252Ffriendly%26openid.alias3.count.alias3%3D1%26openid.alias3.type.alias4%3Dhttp%253A%252F%252Faxschema.org%252FnamePerson%252Ffirst%26openid.alias3.count.alias4%3D1%26openid.alias3.type.alias5%3Dhttp%253A%252F%252Faxschema.org%252FnamePerson%252Flast%26openid.alias3.count.alias5%3D1%26openid.alias3.type.alias6%3Dhttp%253A%252F%252Faxschema.org%252Fcontact%252Fphone%252Fdefault%26openid.alias3.count.alias6%3D1%26openid.alias3.type.alias7%3Dhttp%253A%252F%252Faxschema.org%252Fcompany%252Fname%26openid.alias3.count.alias7%3D1%26openid.alias3.type.alias8%3Dhttp%253A%252F%252Faxschema.org%252Fcontact%252Fweb%252Fdefault%26openid.alias3.count.alias8%3D1\" target=\"_blank\">enter today!</a></p>\r\n','2011-06-01 10:17:46','2011-06-02 11:40:07','2035-01-01 00:00:00','2011-06-01 10:17:00',0,61,1,''),(98,32,'UPC',NULL,'<p>\r\n	<em>Our products are used to communicate, interact, be entertained, seek information, share content and help the consumer understand the world around them.</em></p>\r\n<p>\r\n	Cable and media firm <strong>UPC</strong> is one of the leading providers of television, broadband internet, and telephone services in the Netherlands.</p>\r\n<p>\r\n	UPC provides 2 million households with digital or analog television. As of 31 March 2010, UPC supplied 772,000 households with broadband internet and had 654,000 subscribers for digital telephone services.</p>\r\n<p>\r\n	UPC is a consolidated subsidiary of Liberty Global, Inc. (NASDAQ: LBTYA, LBTYB, LBTYK). Liberty Global delivers television, broadband internet and telephone services to 10 million customers in eleven European countries.</p>\r\n<p>\r\n	For more info visit: <a href=\"http://www.upc.nl\" target=\"_blank\">www.upc.nl</a></p>\r\n','2011-06-01 10:50:34','2011-06-02 11:40:41','2035-01-01 00:00:00','2011-06-01 10:50:00',0,60,0,''),(99,32,'Chamber of Commerce','','<p>\r\n	The Dutch Chamber of Commerce (Kamer van Koophandel) manages the trade register of all businesses in the Netherlands. The Chamber of Commerce for Amsterdam, the regional representative organization for the private business sector, is the country&#39;s largest Chamber with over 200.000 companies on its register.</p>\r\n<p>\r\n	The Chamber takes all steps within its power to maintain and stimulate the robust economic health of the Amsterdam region. The Chamber accumulated knowledge, contacts and partnerships makes it the essential reference point for every firm doing or seeking to do business in the Amsterdam region. &nbsp;</p>\r\n<p>\r\n	<a href=\"http://www.kvk.nl\" target=\"_blank\">www.kvk.nl</a></p>\r\n','2011-06-01 10:58:59','2011-06-02 11:39:00','2035-01-01 00:00:00','2011-06-01 10:58:00',0,56,2,''),(100,32,'RTL',NULL,'<p>\r\n	<strong>RTL Nederland</strong> is an all round media company and nationwide market leader with four television stations (RTL 4, RTL 5, RTL 7, RTL 8), the digital channel RTL Lounge and the number one Dutch radio station Radio 538.</p>\r\n<p>\r\n	RTL Nederland entertains and informs a broad audience 24/7 on all relevant platforms. RTL Nederland&#39;s channels offer a wide variety of Dutch and foreign films, series and shows, including popular formats such as RTL Boulevard and RTL News. With its leadership in the Dutch television and radio markets and its expanding role in digital media with for example RTL.nl and RTL Gemist (TV shows online), RTL Nederland is one of Holland&#39;s leading media companies.</p>\r\n<p>\r\n	RTL Nederland is a subsidiary company of RTL Group and part of the international Bertelsmann organization.</p>\r\n<p>\r\n	<a href=\"http://www.rtlnederland.nl\" target=\"_blank\">www.rtlnederland.nl</a></p>\r\n','2011-06-01 11:07:23','2011-06-02 11:40:56','2035-01-01 00:00:00','2011-06-01 11:07:00',0,59,1,''),(101,32,'SII','','<p>\r\n	<em>SII is involved in a large number of service innovation projects which are of interest of people who want to be updated about the latest ICT developments in relation to cutting edge innovative services.</em></p>\r\n<p>\r\n	The goal of the innovation program <strong>Service Innovation &amp; IC</strong>T (SII) is to make the Netherlands the European hub for content services and the European centre of excellence for financial logistics. The program SII has started by the Dutch ministry of Economic Affairs in January 2010 and the first phase of SII will run till end 2011. The government has provided a subsidy for the first phase of 12.5 million euro. The program consists of a number subprograms such as the Infrastructure Program, the TOP Program and the Tender Program. The SII office will also execute the subprogram Knowledge Dissemination and Value Acceleration.</p>\r\n<p>\r\n	The main subjects in the Tender Program are content, connectedness, e-lifestyle, e-invoicing and e-payments. SII focuses on service innovation realized by consortia of co-operating companies and institutions representing large companies, SME&rsquo;s en knowledge institutes. SII stimulates the growth o ecosystem that will secure the growth of the knowledge intensive service industry.</p>\r\n<p>\r\n	For more information visit: <a href=\"http://www.si-i.nl\" target=\"_blank\">www.si-i.nl</a></p>\r\n','2011-06-01 11:27:47','2011-06-02 11:42:11','2035-01-01 00:00:00','2011-06-01 11:27:00',0,62,7,''),(102,32,'Logica','','<p>\r\n	<strong>Logica</strong> is a leading IT and business services company.</p>\r\n<p>\r\n	Logica employs 40,000 people across 36 countries. The company provides business consulting, systems integration, and IT and business process outsourcing services.</p>\r\n<p>\r\n	Logica works closely with its customers to release their potential - enabling change that increases efficiency, accelerates growth and manages risk. The company applies its deep industry knowledge, technical excellence and global delivery expertise to help its customers build leadership positions in their markets. Logica is listed on both the London Stock Exchange and Euronext (Amsterdam) (LSE: LOG; Euronext: LOG).</p>\r\n<p>\r\n	<a href=\"http://www.logica.com\" target=\"_blank\">www.logica.com</a></p>\r\n','2011-06-01 11:36:59','2011-06-02 11:41:14','2035-01-01 00:00:00','2011-06-01 11:36:00',0,57,4,''),(103,11,'Boilerplate','','<h3>\r\n	About PICNIC</h3>\r\n<p>\r\n	The PICNIC name represents everything we strive to be. It is a gathering of friends old and new, where everyone brings something to the table.</p>\r\n<p>\r\n	PICNIC is about innovative ideas for business, people and society. It is a platform that brings together people from diverse backgrounds who like to exchange ideas and insights and are keen to expose themselves to ideas outside their own area of expertise. PICNIC offers an online meeting place to do that through the PICNIC Club, our online community, and the PICNIC News Network (PNN) that offers inspiring, crowdsourced and co-hosted content.</p>\r\n<p>\r\n	In addition PICNIC also organizes off line events, culminating in our annual festival in Amsterdam. During three intensive days we mix creativity, science, technology, media and business to explore new solutions in the spirit of co-creation. Curious minds eager to exchange knowledge, ideas and skills gather at PICNIC and leave with a new perspective on what is possible.</p>\r\n<p>\r\n	&nbsp;</p>\r\n<p>\r\n	For more information, please contact:</p>\r\n<p>\r\n	Todd Savage, Marketing manager</p>\r\n<p>\r\n	Tel: +31 (0)20 320 5813</p>\r\n<p>\r\n	Todd@picnicnetwork.org</p>\r\n<p>\r\n	PICNIC</p>\r\n<p>\r\n	Haarlemmerweg 321 B</p>\r\n<p>\r\n	1051 LG Amsterdam</p>\r\n<p>\r\n	www.picnicnetwork.org</p>\r\n<p>\r\n	Twitter: @picnicfestival</p>\r\n<p>\r\n	Facebook: PICNIC</p>\r\n<p>\r\n	#picnic11</p>\r\n','2011-06-01 12:19:20','2011-06-01 12:19:42','2035-01-01 00:00:00','2011-06-01 12:18:00',0,NULL,0,'');
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
) ENGINE=InnoDB AUTO_INCREMENT=247 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `permalinks`
--

LOCK TABLES `permalinks` WRITE;
/*!40000 ALTER TABLE `permalinks` DISABLE KEYS */;
INSERT INTO `permalinks` VALUES (1,'about-us','Section',1,'about_us'),(4,'picnic11-section','Section',3,'picnic11'),(5,'picnic11-intro','Section',4,NULL),(7,'festival','Page',2,'what_is_picnic'),(9,'team','Page',4,'the_team'),(10,'advisors','Page',5,'advisors'),(11,'location','Page',6,'location'),(16,'picnic11-registration','Section',7,NULL),(22,'press','Section',9,'press-room'),(23,'contact','Page',14,'contact'),(25,'logos','Page',16,NULL),(27,'press-releases','Section',10,NULL),(28,'press-release-1','Page',18,NULL),(29,'press-release-2','Page',19,NULL),(30,'press-release-3','Page',20,NULL),(31,'photos-and-videos','Page',21,NULL),(33,'Boilerplate','Section',11,NULL),(36,'about','Page',24,'press_room'),(38,'press-clippings','Page',25,NULL),(39,'picnic11-speakers','Page',26,'picnic11_speakers'),(50,'festival-registration','Page',35,'registration'),(57,'news','Section',15,'news'),(64,'welcome-1','Page',48,'overview'),(76,'visiting-amsterdam','Section',20,NULL),(77,'travel-and-accommodations','Page',56,NULL),(78,'themes','Page',57,'themes'),(79,'participants','Page',58,NULL),(80,'green-challenge','Page',59,NULL),(81,'after-picnic','Page',60,NULL),(82,'getting-to-the-venue','Page',61,NULL),(83,'spotlight-on-maxclass','Page',62,NULL),(84,'cure-violence-portrait-of-an-epidemic','Page',63,NULL),(85,'help-fairphone-celebrate-its-first-birthday-on-17-march','Page',64,NULL),(89,'we-are-now-entering-the-era-of-sustainism','Page',68,NULL),(91,'id-award-vote-for-picnic-co-founder-bas-verhart','Page',70,NULL),(92,'social-cities-with-dennis-crowley','Page',71,NULL),(93,'instrumenting-the-city-data-is-king-with-andreas-weigend','Page',72,NULL),(94,'paradigm-shift-with-reinier-de-graaf','Page',73,NULL),(95,'legal','Section',21,NULL),(96,'disclaimer','Page',74,'legal'),(97,'terms-and-conditions','Page',75,NULL),(98,'privacy-policy','Page',76,NULL),(102,'PICNIC11-Sponsors','Section',23,NULL),(142,'si-wilkins','Member',1,NULL),(143,'andy-mayer','Member',2,NULL),(145,'rich-wells','Member',4,NULL),(146,'ian-mooney','Member',5,NULL),(148,'matt-atkins','Member',7,NULL),(150,'marleen-stikker','Member',9,NULL),(151,'bas-vehart','Member',10,NULL),(152,'kitty-leering','Member',11,NULL),(153,'annemarie-van-asselen','Member',12,NULL),(155,'alrik-koudenburg','Member',14,NULL),(156,'adam-greenfield','Member',15,NULL),(157,'juha-van-t-zelfde','Member',16,NULL),(174,'todd-savage','Member',33,NULL),(175,'jan-willem-blom','Member',34,NULL),(176,'mirjam-flik','Member',35,NULL),(177,'liz-keel','Member',36,NULL),(178,'rene-van-schendel','Member',37,NULL),(182,'air-france-klm-global-meetings-information','Page',79,'air-france-klm-global-meetings-information'),(183,'air-france','Section',26,NULL),(184,'competitions','Section',27,NULL),(185,'headsup','Page',80,NULL),(188,NULL,'Shout',10,NULL),(195,'micky-van-zeijl','Member',43,NULL),(196,'gordon-freeman','Member',44,NULL),(200,'beta','Page',81,'beta'),(209,'look-and-feel-1','Page',89,NULL),(212,'hotel-and-travel-info','Page',91,NULL),(214,'registration-today','Page',93,NULL),(216,'contributors','Page',94,'contributors'),(217,'marcel-kampman','Member',46,NULL),(218,'martine-eyzenga','Member',47,NULL),(221,'Sponsors2011','Section',31,'premium-sponsors'),(222,'Sponsors','Section',32,'sponsors-sponsors'),(223,'NPL','Page',96,'npl'),(224,'vodafone','Page',97,'vodaphone'),(225,'upc','Page',98,'upc'),(226,'chamber-of-commerce','Page',99,'chamber_of_commerce'),(227,'rtl','Page',100,'rtl'),(228,'sii','Page',101,'sii'),(229,'logica','Page',102,'logica'),(230,'boilerplate-1','Page',103,NULL),(231,'adam-greenfield-1','Member',49,NULL),(232,'kwnstantina-ntinaki','Member',50,NULL),(234,'karen-sanchez','Member',52,NULL),(235,'paul-geurts','Member',53,NULL),(236,'beverley-merriman','Member',54,NULL),(237,'george-milad','Member',55,NULL),(238,'raul-padilla','Member',56,NULL),(239,'giwrgoc-vourkoc','Member',57,NULL),(240,'milja-suvinen','Member',58,NULL),(241,'thomas-jacobs','Member',59,NULL),(242,'gianfranco-chicco','Member',60,NULL),(243,'leonike-de-klontjes','Member',61,NULL),(244,'zoe-amber-bakker','Member',62,NULL),(245,'sami-niemela','Member',63,NULL),(246,'zezo-mohamed','Member',64,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'CMS photos','',NULL,1,'2011-04-28 11:18:53','2011-05-10 15:49:25'),(2,'Another album','Member',2,1,'2011-05-10 15:50:08','2011-05-10 15:50:08'),(3,'Partner logos','Member',2,1,'2011-05-11 10:42:31','2011-05-11 10:42:53'),(4,'PICNIC logos','Member',2,1,'2011-05-11 10:43:06','2011-05-11 10:43:06'),(5,'PICNIC 2011','Member',33,0,'2011-05-27 22:53:44','2011-05-27 22:53:44');
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (2,'Holding image','','2011/05/03/07_25_04_590_holding.png',2,NULL,NULL,'2011-05-03 14:25:04','2011-05-27 19:49:10',1,0),(5,'Festival_d961c0b77f.jpg',NULL,'2011/05/03/07_53_44_220_Festival_d961c0b77f.jpg',2,NULL,NULL,'2011-05-03 14:53:44','2011-05-24 13:42:10',1,0),(6,'Mark_Bun_16743b5844.jpg',NULL,'2011/05/03/07_54_33_54_Mark_Bun_16743b5844.jpg',2,NULL,NULL,'2011-05-03 14:54:33','2011-06-01 17:32:19',1,0),(7,'screen-capture-41.png',NULL,'2011/05/05/05_15_13_117_screen_capture_41.png',2,NULL,NULL,'2011-05-05 12:15:13','2011-05-16 11:34:21',1,0),(8,'screen-capture-43.png',NULL,'2011/05/05/05_18_47_123_screen_capture_43.png',2,NULL,NULL,'2011-05-05 12:18:47','2011-05-27 19:36:43',1,0),(9,'Test','Test','2011/05/11/01_21_20_367_screen_capture_44.png',2,NULL,NULL,'2011-05-11 08:21:20','2011-05-11 08:21:20',2,0),(11,'PICNIC logo','','2011/05/11/03_44_10_982_PICNIC_Heart_WAYB.jpg',2,NULL,NULL,'2011-05-11 10:44:10','2011-05-11 10:44:10',4,0),(12,'download.jpeg',NULL,'2011/05/17/09_10_26_564_download.jpeg',4,NULL,NULL,'2011-05-17 16:10:26','2011-06-01 17:30:15',1,0),(13,'MaxClass_f30c36ef1a.jpg',NULL,'2011/05/17/09_12_08_579_MaxClass_f30c36ef1a.jpg',4,NULL,NULL,'2011-05-17 16:12:08','2011-05-17 16:12:08',1,0),(14,'Untitled-1.jpg',NULL,'2011/05/17/09_30_21_676_Untitled_1.jpg',4,NULL,NULL,'2011-05-17 16:30:21','2011-05-27 20:08:51',1,0),(15,'maxclass.jpg',NULL,'2011/05/17/09_34_27_923_maxclass.jpg',4,NULL,NULL,'2011-05-17 16:34:27','2011-05-17 16:34:27',1,0),(16,'DSC_1202_0.jpg',NULL,'2011/05/17/09_39_42_553_DSC_1202_0.jpg',4,NULL,NULL,'2011-05-17 16:39:42','2011-05-17 16:39:42',1,0),(17,'Global Meetings.jpg',NULL,'2011/05/23/05_54_58_468_Global_Meetings.jpg',34,NULL,NULL,'2011-05-23 12:54:58','2011-05-23 12:54:58',1,0),(18,'Air France - KLM.jpg',NULL,'2011/05/23/05_55_03_373_Air_France_KLM.jpg',34,NULL,NULL,'2011-05-23 12:55:03','2011-05-23 12:55:03',1,0),(19,'headsup-pw4embed.010.jpg',NULL,'2011/05/24/05_22_51_584_headsup_pw4embed.010.jpg',2,NULL,NULL,'2011-05-24 12:22:51','2011-05-24 12:22:51',1,0),(20,'5014576189_a971340a98_m.jpg',NULL,'2011/05/27/11_53_26_633_5014576189_a971340a98_m.jpg',33,NULL,NULL,'2011-05-27 18:53:26','2011-05-27 18:53:26',1,0),(22,'2010 Press Lounge.jpg',NULL,'2011/05/27/12_04_40_591_2010_Press_Lounge.jpg',33,NULL,NULL,'2011-05-27 19:04:40','2011-05-27 19:04:40',1,0),(23,'2010 Entrance.jpg',NULL,'2011/05/27/12_09_53_122_2010_Entrance.jpg',33,NULL,NULL,'2011-05-27 19:09:53','2011-05-27 19:09:53',1,0),(24,'2010 Gashouder.jpg',NULL,'2011/05/27/12_21_59_197_2010_Gashouder.jpg',33,NULL,NULL,'2011-05-27 19:21:59','2011-05-27 19:21:59',1,0),(25,'2010 Entrance with balloon girl.jpg',NULL,'2011/05/27/12_22_46_791_2010_Entrance_with_balloon_girl.jpg',33,NULL,NULL,'2011-05-27 19:22:46','2011-06-01 17:28:29',1,0),(26,'2010 What are you bringing sign.jpg',NULL,'2011/05/27/12_24_06_445_2010_What_are_you_bringing_sign.jpg',33,NULL,NULL,'2011-05-27 19:24:06','2011-05-27 19:24:06',1,0),(27,'2010 Microsoft guys jumping.jpg',NULL,'2011/05/27/12_26_09_967_2010_Microsoft_guys_jumping.jpg',33,NULL,NULL,'2011-05-27 19:26:09','2011-05-31 08:31:08',1,0),(28,'2010 trees and laptops.jpg',NULL,'2011/05/27/13_04_00_410_2010_trees_and_laptops.jpg',33,NULL,NULL,'2011-05-27 20:04:00','2011-05-27 20:04:00',1,0),(29,'amsterdam.jpg',NULL,'2011/05/27/15_43_17_250_amsterdam.jpg',33,NULL,NULL,'2011-05-27 22:43:17','2011-06-01 16:39:00',1,0),(30,'2010 post-its.jpg',NULL,'2011/05/27/15_50_33_922_2010_post_its.jpg',33,NULL,NULL,'2011-05-27 22:50:33','2011-05-27 22:50:33',1,0),(31,'2010 outside.jpg',NULL,'2011/05/27/19_14_24_237_2010_outside.jpg',33,NULL,NULL,'2011-05-28 02:14:24','2011-05-28 02:14:24',1,0),(32,'2010 lecture hall with heart.jpg',NULL,'2011/05/27/19_20_34_544_2010_lecture_hall_with_heart.jpg',33,NULL,NULL,'2011-05-28 02:20:34','2011-05-31 16:36:52',1,0),(33,'2010 denise caruso.jpg',NULL,'2011/05/27/19_25_33_174_2010_denise_caruso.jpg',33,NULL,NULL,'2011-05-28 02:25:33','2011-05-28 02:25:33',1,0),(34,'2010 man with iphone cam.jpg',NULL,'2011/05/27/19_30_10_496_2010_man_with_iphone_cam.jpg',33,NULL,NULL,'2011-05-28 02:30:10','2011-05-28 02:30:10',1,0),(35,'2010 Green Challenge winner.jpg',NULL,'2011/05/27/19_32_30_183_2010_Green_Challenge_winner.jpg',33,NULL,NULL,'2011-05-28 02:32:30','2011-05-28 02:32:30',1,0),(36,'2010 tweet prints.jpg',NULL,'2011/05/27/19_40_07_234_2010_tweet_prints.jpg',33,NULL,NULL,'2011-05-28 02:40:07','2011-05-28 02:40:07',1,0),(37,'2010 dennis crowley.jpg',NULL,'2011/05/27/19_48_17_859_2010_dennis_crowley.jpg',33,NULL,NULL,'2011-05-28 02:48:17','2011-05-28 02:48:17',1,0),(38,'grasmaaisters 2010.jpg',NULL,'2011/05/29/13_10_01_499_grasmaaisters_2010.jpg',11,NULL,NULL,'2011-05-29 20:10:01','2011-06-01 16:39:03',1,0),(39,'bg_Buitenterrein1_2006.jpg',NULL,'2011/05/29/13_56_38_489_bg_Buitenterrein1_2006.jpg',11,NULL,NULL,'2011-05-29 20:56:38','2011-05-29 20:56:38',1,0),(40,'dj4_retouch-270x150.jpg',NULL,'2011/05/29/14_40_35_640_dj4_retouch_270x150.jpg',11,NULL,NULL,'2011-05-29 21:40:35','2011-05-29 21:40:35',1,0),(41,'reinier de graaf.jpg',NULL,'2011/05/29/14_47_27_757_reinier_de_graaf.jpg',11,NULL,NULL,'2011-05-29 21:47:27','2011-05-29 21:47:27',1,0),(42,'5057345824_31bc79f8d2_m.jpg',NULL,'2011/05/29/15_16_49_180_5057345824_31bc79f8d2_m.jpg',11,NULL,NULL,'2011-05-29 22:16:49','2011-05-29 22:16:49',1,0),(43,'5057345824_31bc79f8d2_z.jpg',NULL,'2011/05/29/15_18_18_572_5057345824_31bc79f8d2_z.jpg',11,NULL,NULL,'2011-05-29 22:18:18','2011-05-29 22:18:18',1,0),(44,'artbook_2160_3426437.jpg',NULL,'2011/05/29/15_21_17_189_artbook_2160_3426437.jpg',11,NULL,NULL,'2011-05-29 22:21:17','2011-05-29 22:21:17',1,0),(45,'coversustainism.gif',NULL,'2011/05/29/15_23_14_340_coversustainism.gif',11,NULL,NULL,'2011-05-29 22:23:14','2011-05-29 22:23:14',1,0),(46,'coversustainism.jpg',NULL,'2011/05/29/15_24_36_473_coversustainism.jpg',11,NULL,NULL,'2011-05-29 22:24:36','2011-05-29 22:24:36',1,0),(47,'lecture room.jpg',NULL,'2011/05/29/15_59_38_329_lecture_room.jpg',11,NULL,NULL,'2011-05-29 22:59:38','2011-06-01 17:30:49',1,0),(48,'17154npllogo_2010_rgb300_jpg.jpg',NULL,'2011/06/01/02_19_06_76_17154npllogo_2010_rgb300_jpg.jpg',43,NULL,NULL,'2011-06-01 09:19:06','2011-06-01 11:48:49',3,0),(49,'Untitled.png',NULL,'2011/06/01/03_17_40_452_Untitled.png',43,NULL,NULL,'2011-06-01 10:17:40','2011-06-01 11:48:59',3,0),(50,'UPC.png',NULL,'2011/06/01/03_50_28_122_UPC.png',43,NULL,NULL,'2011-06-01 10:50:28','2011-06-01 11:28:56',3,0),(51,'KvK logo_FC1276x1276.jpg',NULL,'2011/06/01/03_58_51_911_KvK_logo_FC1276x1276.jpg',43,NULL,NULL,'2011-06-01 10:58:51','2011-06-01 11:33:41',3,0),(52,'RTLNL-RGB.jpg',NULL,'2011/06/01/04_07_16_776_RTLNL_RGB.jpg',43,NULL,NULL,'2011-06-01 11:07:16','2011-06-01 11:28:37',3,0),(53,'SII.png',NULL,'2011/06/01/04_27_04_700_SII.png',43,NULL,NULL,'2011-06-01 11:27:04','2011-06-01 11:27:04',3,0),(54,'SII-white-background.jpg',NULL,'2011/06/01/04_27_39_771_SII_white_background.jpg',43,NULL,NULL,'2011-06-01 11:27:39','2011-06-01 11:27:39',3,0),(55,'logica-logo-web.jpg',NULL,'2011/06/01/04_36_54_198_logica_logo_web.jpg',43,NULL,NULL,'2011-06-01 11:36:54','2011-06-01 11:36:54',3,0),(56,'chamber.jpg',NULL,'2011/06/02/04_38_51_755_chamber.jpg',4,NULL,NULL,'2011-06-02 11:38:51','2011-06-02 11:38:51',3,0),(57,'logica.jpg',NULL,'2011/06/02/04_38_52_548_logica.jpg',4,NULL,NULL,'2011-06-02 11:38:52','2011-06-02 11:38:52',3,0),(58,'lottery.jpg',NULL,'2011/06/02/04_38_53_393_lottery.jpg',4,NULL,NULL,'2011-06-02 11:38:53','2011-06-02 11:38:53',3,0),(59,'rtl.jpg',NULL,'2011/06/02/04_38_54_413_rtl.jpg',4,NULL,NULL,'2011-06-02 11:38:54','2011-06-02 11:38:54',3,0),(60,'upc.jpg',NULL,'2011/06/02/04_38_55_150_upc.jpg',4,NULL,NULL,'2011-06-02 11:38:55','2011-06-02 11:38:55',3,0),(61,'vodaphone.jpg',NULL,'2011/06/02/04_38_55_868_vodaphone.jpg',4,NULL,NULL,'2011-06-02 11:38:55','2011-06-02 11:38:55',3,0),(62,'s11.jpg',NULL,'2011/06/02/04_42_05_171_s11.jpg',4,NULL,NULL,'2011-06-02 11:42:05','2011-06-02 11:42:05',3,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `points_events`
--

LOCK TABLES `points_events` WRITE;
/*!40000 ALTER TABLE `points_events` DISABLE KEYS */;
INSERT INTO `points_events` VALUES (1,'like_my_shout','Having your discussion \"thumbed up\"',1,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(2,'register','Registering for the first time',2,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(3,'dislike_my_shout','Having your discussion \"thumbed down\"',-1,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(4,'rate_shout','Rating someone else\'s discussion',1,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(5,'first_comment_on_my_shout','Having comments on your discussion',2,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(6,'share_shout','Sharing a discussion (by email, Facebook or Twitter)',2,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(7,'share_my_shout','Having your discussion shared by others',5,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(8,'post_comment','Adding a comment to a discussion',5,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(9,'friend_on_fb','Having friends on Facebook also on PICNIC',5,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(10,'post_shout','Posting a new discussion',10,'2011-05-23 14:39:08','2011-05-23 14:39:08'),(11,'referred_friend','Referring a friend',5,'2011-06-02 12:02:00','2011-06-02 12:02:00'),(12,'like_my_profile','Having your profile \"thumbed up\"',2,'2011-06-02 12:07:18','2011-06-02 12:07:18');
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
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `points_transfers`
--

LOCK TABLES `points_transfers` WRITE;
/*!40000 ALTER TABLE `points_transfers` DISABLE KEYS */;
INSERT INTO `points_transfers` VALUES (31,1,2,1,'Member','2011-04-28 11:18:54','2011-05-24 10:53:05',2),(32,2,2,2,'Member','2011-04-28 07:18:54','2011-05-24 10:53:06',2),(34,4,2,4,'Member','2011-04-28 10:18:54','2011-05-24 10:53:06',2),(35,5,2,5,'Member','2011-04-28 10:18:54','2011-05-24 10:53:06',2),(37,7,2,7,'Member','2011-04-28 11:18:54','2011-05-24 10:53:06',2),(38,9,2,9,'Member','2011-05-05 09:11:46','2011-05-24 10:53:06',2),(39,10,2,10,'Member','2011-05-05 09:11:46','2011-05-24 10:53:06',2),(40,11,2,11,'Member','2011-05-05 09:11:46','2011-05-24 10:53:06',2),(41,12,2,12,'Member','2011-05-05 09:11:47','2011-05-24 10:53:06',2),(43,14,2,14,'Member','2011-05-05 09:11:47','2011-05-24 10:53:06',2),(44,15,2,15,'Member','2011-05-05 09:14:54','2011-05-24 10:53:06',2),(45,16,2,16,'Member','2011-05-05 09:14:54','2011-05-24 10:53:06',2),(62,33,2,33,'Member','2011-05-11 09:30:16','2011-05-24 10:53:08',2),(63,34,2,34,'Member','2011-05-16 16:17:56','2011-05-24 10:53:08',2),(64,35,2,35,'Member','2011-05-18 15:19:56','2011-05-24 10:53:08',2),(65,36,2,36,'Member','2011-05-18 15:22:28','2011-05-24 10:53:08',2),(66,37,2,37,'Member','2011-05-18 15:25:30','2011-05-24 10:53:08',2),(67,39,2,39,'Member','2011-05-19 13:40:56','2011-05-24 10:53:08',2),(69,33,5,3,'WallPost','2011-05-20 08:35:44','2011-05-24 10:53:08',8),(70,2,5,4,'WallPost','2011-05-20 08:37:37','2011-05-24 10:53:08',8),(71,33,5,5,'WallPost','2011-05-20 08:39:24','2011-05-24 10:53:08',8),(72,2,5,6,'WallPost','2011-05-20 08:59:09','2011-05-24 10:53:08',8),(73,2,10,8,'Shout','2011-05-18 16:52:40','2011-05-24 10:53:08',10),(74,2,10,9,'Shout','2011-05-18 16:54:00','2011-05-24 10:53:08',10),(75,2,10,10,'Shout','2011-05-18 16:54:56','2011-05-24 10:53:09',10),(76,4,10,13,'Shout','2011-05-25 09:55:11','2011-05-25 09:55:11',10),(77,4,2,7,'WallPost','2011-05-25 15:46:50','2011-05-25 15:46:50',5),(78,7,5,7,'WallPost','2011-05-25 15:46:50','2011-05-25 15:46:50',8),(79,2,10,14,'Shout','2011-05-25 22:24:46','2011-05-25 22:24:46',10),(80,2,10,15,'Shout','2011-05-25 22:34:21','2011-05-25 22:34:21',10),(82,4,1,13,'Shout','2011-05-26 08:53:52','2011-05-26 08:53:52',1),(83,5,1,13,'Shout','2011-05-26 08:53:52','2011-05-26 08:53:52',4),(84,5,5,8,'WallPost','2011-05-26 08:54:32','2011-05-26 08:54:32',8),(86,43,2,43,'Member','2011-05-26 16:16:09','2011-05-26 16:16:09',2),(87,44,2,44,'Member','2011-05-27 11:24:58','2011-05-27 11:24:58',2),(90,33,10,16,'Shout','2011-05-27 14:54:26','2011-05-27 14:54:26',10),(91,46,2,46,'Member','2011-05-30 04:51:14','2011-05-30 04:51:14',2),(92,2,-1,14,'Shout','2011-05-30 05:14:42','2011-05-30 05:14:42',3),(93,46,1,14,'Shout','2011-05-30 05:14:42','2011-05-30 05:14:42',4),(94,46,10,17,'Shout','2011-05-30 05:32:29','2011-05-30 05:32:29',10),(95,47,2,47,'Member','2011-05-30 16:08:59','2011-05-30 16:08:59',2),(96,46,1,17,'Shout','2011-05-31 14:35:22','2011-05-31 14:35:22',1),(97,47,1,17,'Shout','2011-05-31 14:35:22','2011-05-31 14:35:22',4),(99,4,1,13,'Shout','2011-06-01 08:42:38','2011-06-01 08:42:38',1),(100,2,1,13,'Shout','2011-06-01 08:42:38','2011-06-01 08:42:38',4),(101,46,1,17,'Shout','2011-06-01 12:05:02','2011-06-01 12:05:02',1),(102,43,1,17,'Shout','2011-06-01 12:05:02','2011-06-01 12:05:02',4),(103,49,2,49,'Member','2011-06-01 14:56:44','2011-06-01 14:56:44',2),(104,50,2,50,'Member','2011-06-01 16:28:33','2011-06-01 16:28:33',2),(106,33,2,9,'WallPost','2011-06-01 20:28:05','2011-06-01 20:28:05',5),(107,2,5,9,'WallPost','2011-06-01 20:28:05','2011-06-01 20:28:05',8),(108,33,1,16,'Shout','2011-06-01 20:28:09','2011-06-01 20:28:09',1),(109,2,1,16,'Shout','2011-06-01 20:28:09','2011-06-01 20:28:09',4),(110,52,2,52,'Member','2011-06-02 01:48:21','2011-06-02 01:48:21',2),(111,53,2,53,'Member','2011-06-02 08:06:12','2011-06-02 08:06:12',2),(112,5,2,5,'Member','2011-06-02 12:07:33','2011-06-02 12:07:33',12),(113,54,2,54,'Member','2011-06-02 12:23:32','2011-06-02 12:23:32',2),(114,55,2,55,'Member','2011-06-02 12:59:01','2011-06-02 12:59:01',2),(115,56,2,56,'Member','2011-06-02 13:50:07','2011-06-02 13:50:07',2),(116,57,2,57,'Member','2011-06-02 15:19:47','2011-06-02 15:19:47',2),(117,58,2,58,'Member','2011-06-02 15:24:21','2011-06-02 15:24:21',2),(118,59,2,59,'Member','2011-06-02 17:57:31','2011-06-02 17:57:31',2),(119,60,2,60,'Member','2011-06-02 18:04:02','2011-06-02 18:04:02',2),(120,61,2,61,'Member','2011-06-02 20:42:50','2011-06-02 20:42:50',2),(121,62,2,62,'Member','2011-06-02 20:56:52','2011-06-02 20:56:52',2),(122,63,2,63,'Member','2011-06-02 21:28:02','2011-06-02 21:28:02',2),(123,64,2,64,'Member','2011-06-02 22:32:53','2011-06-02 22:32:53',2),(124,15,2,15,'Member','2011-06-03 03:54:47','2011-06-03 03:54:47',12);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,2,10,'Shout',1,'2011-05-23 08:39:43','2011-05-23 08:39:46'),(2,2,5,'Member',1,'2011-05-25 22:13:57','2011-05-25 22:13:57'),(3,2,14,'Shout',1,'2011-05-25 22:34:37','2011-05-25 22:34:37'),(4,5,13,'Shout',1,'2011-05-26 08:53:52','2011-05-26 08:53:52'),(5,2,15,'Shout',-1,'2011-05-26 09:28:20','2011-05-26 09:28:20'),(6,2,33,'Member',1,'2011-05-26 09:28:33','2011-05-26 09:28:33'),(7,46,14,'Shout',-1,'2011-05-30 05:14:41','2011-05-30 05:14:41'),(8,47,17,'Shout',1,'2011-05-31 14:35:22','2011-05-31 14:35:22'),(9,2,13,'Shout',1,'2011-06-01 08:42:38','2011-06-01 08:42:38'),(10,2,34,'Member',1,'2011-06-01 08:43:31','2011-06-01 08:43:31'),(11,43,17,'Shout',1,'2011-06-01 12:05:02','2011-06-01 12:05:02'),(12,43,34,'Member',1,'2011-06-01 12:05:17','2011-06-01 12:05:17'),(13,16,49,'Member',1,'2011-06-01 15:26:47','2011-06-01 15:26:47'),(14,2,16,'Shout',1,'2011-06-01 20:28:09','2011-06-01 20:28:09'),(15,43,53,'Member',1,'2011-06-02 08:24:48','2011-06-02 08:24:48'),(16,7,4,'Member',1,'2011-06-02 12:06:27','2011-06-02 12:06:27'),(17,7,5,'Member',1,'2011-06-02 12:07:33','2011-06-02 12:07:33'),(18,49,15,'Member',1,'2011-06-03 03:54:47','2011-06-03 03:54:47');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `referrals`
--

DROP TABLE IF EXISTS `referrals`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `referrals` (
  `id` int(11) NOT NULL auto_increment,
  `member_id` int(11) default NULL,
  `code` varchar(255) default NULL,
  `created_at` datetime default NULL,
  `updated_at` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `referrals`
--

LOCK TABLES `referrals` WRITE;
/*!40000 ALTER TABLE `referrals` DISABLE KEYS */;
/*!40000 ALTER TABLE `referrals` ENABLE KEYS */;
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
INSERT INTO `schema_migrations` VALUES ('20091016104635'),('20091016120409'),('20091106165316'),('20100210115949'),('20100305173427'),('20100325163719'),('20100407105403'),('20100407105419'),('20100407144339'),('20100408145821'),('20100408162026'),('20100409093733'),('20100409141224'),('20100409143244'),('20100409143304'),('20100409160300'),('20100409160456'),('20100415145447'),('20100415154222'),('20100416115334'),('20100416151432'),('20100416155503'),('20100421100955'),('20100421101145'),('20100421120435'),('20100422091505'),('20100422142610'),('20100423123257'),('20100423123315'),('20100521112757'),('20100524122600'),('20100524153922'),('20100524163512'),('20100525102621'),('20100527100007'),('20100527115352'),('20100601092537'),('20100601094912'),('20100601142242'),('20100601152053'),('20100602090247'),('20100602112131'),('20100602114556'),('20100608101828'),('20100608135949'),('20100609084428'),('20100610132813'),('20100623115210'),('20100714085900'),('20100714090928'),('20100715094246'),('20100715144911'),('20100716105516'),('20100720131711'),('20100727134606'),('20100803135018'),('20100803141623'),('20100805095610'),('20100809151249'),('20100810082603'),('20100812140336'),('20100825134535'),('20100826094542'),('20101005151730'),('20101013133204'),('20101021165624'),('20101028141828'),('20101215120207'),('20110107150714'),('20110110113046'),('20110112163551'),('20110113145943'),('20110128112444'),('20110207164351'),('20110214162012'),('20110215120230'),('20110218153159'),('20110224151746'),('20110228123442'),('20110228124555'),('20110314174103'),('20110401111953'),('20110407120146'),('20110419094000'),('20110419094110'),('20110428095550'),('20110428150331'),('20110503143045'),('20110503153808'),('20110504112720'),('20110505110943'),('20110506091301'),('20110506104655'),('20110506143819'),('20110511153538'),('20110512104523'),('20110516115726'),('20110516134238'),('20110516151939'),('20110517142216'),('20110523153124'),('20110524091638'),('20110525084321'),('20110525130140'),('20110525151050'),('20110526154812'),('20110526162743'),('20110527103333'),('20110527131056'),('20110527133612'),('20110531095959'),('20110531112441'),('20110601160752'),('20110602113705');
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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'About',200,'first_page',0,'','2011-04-28 11:18:53','2011-05-16 12:23:23',NULL,'',0),(3,NULL,'Festival',1,'first_page',0,'','2011-04-28 11:18:54','2011-05-16 12:16:17',NULL,'',0),(4,3,' Festival 2011',10,'first_page',0,'','2011-04-28 11:20:49','2011-06-01 11:23:35',NULL,'',0),(7,3,'Registration',30,'first_page',0,'','2011-05-05 09:54:41','2011-05-20 08:56:22',NULL,'',0),(9,1,'Press room',4,'first_page',0,'','2011-05-05 10:45:37','2011-05-11 11:19:19',NULL,'Press room',0),(10,9,'Press releases',0,'first_page',0,'','2011-05-05 11:10:01','2011-05-28 02:40:18',36,'',0),(11,9,'Boilerplate',2,'first_page',0,'','2011-05-05 11:23:07','2011-06-01 12:18:27',NULL,'',0),(15,3,'Festival updates',0,'news_view',0,'','2011-05-11 08:27:56','2011-05-31 14:57:09',NULL,'',0),(20,3,'Visiting Amsterdam',50,'first_page',0,'','2011-05-16 10:52:24','2011-05-20 08:55:59',NULL,'',0),(21,1,'Legal',990,'first_page',0,'','2011-05-18 15:36:20','2011-05-27 15:36:41',NULL,'',1),(23,3,'Sponsors',11,'first_page',0,'','2011-05-20 08:53:52','2011-06-01 11:24:32',NULL,'',0),(26,20,'Hidden Section',999,'normal',0,'','2011-05-23 14:54:16','2011-05-24 12:20:26',NULL,'',1),(27,NULL,'Competitions',999,'normal',0,'','2011-05-24 12:21:29','2011-05-24 12:21:29',NULL,'',1),(31,23,'Premium Sponsors',0,'news_view',0,'','2011-06-01 09:10:12','2011-06-01 11:39:10',NULL,'',0),(32,23,'Sponsors',1,'news_view',0,'','2011-06-01 09:12:25','2011-06-01 11:48:28',NULL,'',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `shouts`
--

LOCK TABLES `shouts` WRITE;
/*!40000 ALTER TABLE `shouts` DISABLE KEYS */;
INSERT INTO `shouts` VALUES (8,2,NULL,NULL,'What do people think of the first iteration of the Club area? What direction should we take?',0,'2011-05-18 16:52:40','2011-06-01 08:39:39','',NULL,NULL),(10,2,8,'Video','Check out this awesome video about explosives and art. My two  favourite subjects!',0,'2011-05-18 16:54:56','2011-05-25 22:29:10','',NULL,NULL),(13,4,NULL,NULL,'This is how I get my stuff done http://www.youtube.com/watch?v=4P785j15Tzk',0,'2011-05-25 09:55:11','2011-05-26 08:54:35','',NULL,NULL),(14,2,9,'Video','Even a complex concept such as using Charlie plexing to drive multiple LEDs using only and digital outputs can be taught to a 10 year old boy using the Arduino. He\'s now bored with lessons at school though.',0,'2011-05-25 22:24:46','2011-05-25 22:32:46','',NULL,NULL),(15,2,1,'Link','Arduino is an open-source electronics prototyping platform based on flexible, easy-to-use hardware and software. It\'s intended for artists, designers, hobbyists, and anyone interested in creating interactive objects or environments.',0,'2011-05-25 22:34:21','2011-05-25 22:34:21','',NULL,NULL),(16,33,10,'Video','I dabble in documentary filmmaking. Here\'s one I made in Mississippi this year.',0,'2011-05-27 14:54:26','2011-06-01 20:28:05','',NULL,NULL),(17,46,NULL,NULL,'What defines a city? For me one of the things that does that is the rich visual culture you find on the streets in the form of posters. Obviously we have a big challenge, saying we’re building PICNIC City. Since it is for only three days, and we only have about a week to build it. To create a city-link atmosphere we started the PICNIC Poster Project. We’re inviting hand-picked leading designers and agencies in our international networks, to make artwork for us in the form of ‘posters’ (both vertical and horizontal for screen based applications). Posters we can use in several ways, from decoration on site (poster walls like in real cities, but then all related to PICNIC Festival), online as backgrounds for the website or announcing separate themes, workshops or speakers, for media and even the visual speaker announcements during the festival. This leads to a highly diverse and eclectic visual language that brings the city to life. We have started from the overarching theme ‘Urban Futures’, then narrow down to the main categories to people (speakers, presenters, etc.).\n\nAt this moment a variety of creatives is working on their contributions and we can’t wait to see the first results. If you create visually brilliant work yourself, feel free to contact me. Then you get a briefing on the subject that need visual support.',0,'2011-05-30 05:32:29','2011-05-30 05:32:29','',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `snippets`
--

LOCK TABLES `snippets` WRITE;
/*!40000 ALTER TABLE `snippets` DISABLE KEYS */;
INSERT INTO `snippets` VALUES (5,'Page',6,'call_to_action','<p>\r\n	Just a short ferry ride to the NDSM Wharf for PICNIC Festival 2011.</p>\r\n',1,'2011-05-06 15:04:45','2011-05-19 14:23:56'),(10,'Page',2,'photo_caption','<p>\r\n	What are <em>you</em> bringing?</p>\r\n',1,'2011-05-10 15:04:51','2011-05-20 14:41:55'),(19,'Page',48,'call_to_action','<p>\r\n	Mark your calendar now to attend PICNIC Festival 2011 from 14 to 16 September in Amsterdam!</p>\r\n',1,'2011-05-16 11:55:36','2011-05-29 22:54:46'),(20,'Page',64,'call_to_action','<p>\r\n	Show your support for FairPhone and join the festivities on 17 March! Just send an email to <a href=\"mailto:events@waag.org\" target=\"_blank\">events(at)waag.org</a> to reserve your place.</p>\r\n',1,'2011-05-17 16:37:26','2011-05-17 16:37:26'),(22,'Page',68,'pull_quote','<p>\r\n	&quot;Sustainism is the new ecology of our networked world.&quot;</p>\r\n',1,'2011-05-17 16:53:56','2011-05-17 16:54:16'),(23,'Page',68,'call_to_action','<p>\r\n	Read their recent coverage in the New York Times:</p>\r\n<p>\r\n	<a href=\"http://www.nytimes.com/2011/01/10/arts/10iht-design10.html\" target=\"_blank\">Sustainism: It&rsquo;s Got a Name, Now Do It!</a></p>\r\n',1,'2011-05-17 16:53:56','2011-05-17 16:53:56'),(25,'Page',70,'call_to_action','<p>\r\n	<a href=\"http://www.thnk.org/blog/\" target=\"_blank\">Visit the THNK website to learn more</a></p>\r\n',1,'2011-05-17 17:00:00','2011-05-17 17:00:00'),(31,'Page',58,'photo_caption','<p>\r\n	Lecture Room at PICNIC &#39;10. (Photo by Ferdy Damman)</p>\r\n',1,'2011-05-27 19:00:52','2011-05-27 19:00:52'),(33,'Page',35,'call_to_action','<p>\r\n	Early bird registration is open: sign up before 1 July and save 30%.</p>\r\n',1,'2011-05-27 22:33:02','2011-06-01 17:28:59'),(34,'Page',35,'photo_caption','<p>\r\n	This way to PICNIC!&nbsp;</p>\r\n',1,'2011-05-27 22:35:51','2011-05-27 22:35:51'),(36,'Page',56,'call_to_action','<p>\r\n	Book now at festival hotels for a limited number of rooms, with prices valid until 1 July.</p>\r\n',1,'2011-05-27 23:18:50','2011-05-27 23:18:50'),(37,'Page',48,'pull_quote','<h4>\r\n	A really rich programme and the smartest, most lively people in Europe in one place. --David Rowan, editor in chief, WIRED Magazine (UK)</h4>\r\n',1,'2011-05-29 22:54:46','2011-05-31 16:36:52'),(38,'Page',48,'photo_caption','<p>\r\n	Lecture Room at PICNIC &#39;10. (Photo by Ferdy Damman)</p>\r\n',1,'2011-05-29 23:00:33','2011-05-29 23:00:33'),(39,'Page',57,'call_to_action','<p>\r\n	Early bird registration is open: sign up before 1 July and save 30%.</p>\r\n',1,'2011-06-01 17:30:15','2011-06-01 17:30:15'),(40,'Page',58,'call_to_action','<p>\r\n	Early bird registration is open: sign up before 1 July and save 30%.</p>\r\n',1,'2011-06-01 17:30:49','2011-06-01 17:30:49'),(41,'Page',89,'call_to_action','<p>\r\n	Early bird registration is open: sign up before 1 July and save 30%.</p>\r\n',1,'2011-06-01 17:32:19','2011-06-01 17:32:19');
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
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
INSERT INTO `taggings` VALUES (40,9,2,NULL,NULL,'Member','tags','2011-05-18 16:51:00'),(43,12,10,NULL,NULL,'Shout','tags','2011-05-18 16:54:56'),(47,16,2,NULL,NULL,'Member','tags','2011-05-20 08:57:49'),(48,17,2,NULL,NULL,'Member','tags','2011-05-20 08:58:11'),(50,19,5,NULL,NULL,'Member','tags','2011-05-24 16:46:10'),(51,20,13,NULL,NULL,'Shout','tags','2011-05-25 09:55:11'),(52,14,2,NULL,NULL,'Member','tags','2011-05-25 10:33:34'),(53,21,4,NULL,NULL,'Member','tags','2011-05-25 13:47:52'),(54,22,4,NULL,NULL,'Member','tags','2011-05-25 13:48:20'),(55,16,14,NULL,NULL,'Shout','tags','2011-05-25 22:24:46'),(56,23,10,NULL,NULL,'Shout','tags','2011-05-25 22:29:10'),(57,24,14,NULL,NULL,'Shout','tags','2011-05-25 22:29:27'),(60,16,15,NULL,NULL,'Shout','tags','2011-05-25 22:34:21'),(61,24,15,NULL,NULL,'Shout','tags','2011-05-25 22:34:21'),(62,14,5,NULL,NULL,'Member','tags','2011-05-26 13:41:45'),(63,14,1,NULL,NULL,'Member','tags','2011-05-26 13:57:23'),(64,26,1,NULL,NULL,'Member','tags','2011-05-26 13:57:23'),(67,29,11,NULL,NULL,'Member','tags','2011-05-27 14:27:16'),(68,30,11,NULL,NULL,'Member','tags','2011-05-27 14:27:16'),(69,31,16,NULL,NULL,'Shout','tags','2011-05-27 14:54:26'),(70,26,16,NULL,NULL,'Shout','tags','2011-05-27 14:56:09'),(71,26,44,NULL,NULL,'Member','tags','2011-05-27 16:25:25'),(72,32,44,NULL,NULL,'Member','tags','2011-05-27 16:25:25'),(73,33,44,NULL,NULL,'Member','tags','2011-05-27 16:25:35'),(74,34,44,NULL,NULL,'Member','tags','2011-05-27 16:25:51'),(75,35,11,NULL,NULL,'Member','tags','2011-05-29 23:07:46'),(76,36,11,NULL,NULL,'Member','tags','2011-05-29 23:07:46'),(77,37,11,NULL,NULL,'Member','tags','2011-05-29 23:07:46'),(78,38,46,NULL,NULL,'Member','tags','2011-05-30 04:56:21'),(79,38,17,NULL,NULL,'Shout','tags','2011-05-30 05:32:30'),(80,39,17,NULL,NULL,'Shout','tags','2011-05-30 05:32:30'),(81,26,43,NULL,NULL,'Member','tags','2011-05-31 12:49:00'),(83,41,43,NULL,NULL,'Member','tags','2011-05-31 12:49:00'),(84,42,43,NULL,NULL,'Member','tags','2011-05-31 12:49:00'),(85,43,43,NULL,NULL,'Member','tags','2011-05-31 12:49:00'),(87,45,16,NULL,NULL,'Member','tags','2011-05-31 15:04:39'),(88,46,15,NULL,NULL,'Member','tags','2011-05-31 20:37:40'),(89,38,15,NULL,NULL,'Member','tags','2011-05-31 20:38:38'),(90,47,15,NULL,NULL,'Member','tags','2011-05-31 20:38:38'),(91,23,43,NULL,NULL,'Member','tags','2011-05-31 21:13:17'),(92,48,43,NULL,NULL,'Member','tags','2011-05-31 21:13:17'),(93,49,2,NULL,NULL,'Member','tags','2011-06-01 08:38:58'),(94,50,8,NULL,NULL,'Shout','tags','2011-06-01 08:39:39'),(95,51,2,NULL,NULL,'Member','tags','2011-06-01 08:44:51'),(96,52,2,NULL,NULL,'Member','tags','2011-06-01 08:44:51'),(97,19,7,NULL,NULL,'Member','tags','2011-06-01 09:35:27'),(98,26,7,NULL,NULL,'Member','tags','2011-06-01 09:35:27'),(99,53,7,NULL,NULL,'Member','tags','2011-06-01 09:35:27'),(100,54,10,NULL,NULL,'Member','tags','2011-06-01 12:00:03'),(101,55,16,NULL,NULL,'Member','tags','2011-06-01 15:14:18'),(102,56,16,NULL,NULL,'Member','tags','2011-06-01 15:14:18'),(103,57,16,NULL,NULL,'Member','tags','2011-06-01 15:14:18'),(104,58,16,NULL,NULL,'Member','tags','2011-06-01 15:14:18'),(105,59,16,NULL,NULL,'Member','tags','2011-06-01 15:14:53'),(106,60,16,NULL,NULL,'Member','tags','2011-06-01 15:14:53'),(107,61,16,NULL,NULL,'Member','tags','2011-06-01 15:14:53'),(108,62,49,NULL,NULL,'Member','tags','2011-06-01 15:29:18'),(109,26,16,NULL,NULL,'Member','tags','2011-06-01 15:30:40'),(110,63,16,NULL,NULL,'Member','tags','2011-06-01 15:30:40'),(111,64,62,NULL,NULL,'Member','tags','2011-06-02 20:59:06'),(112,65,62,NULL,NULL,'Member','tags','2011-06-02 20:59:06'),(113,66,62,NULL,NULL,'Member','tags','2011-06-02 20:59:06'),(114,67,62,NULL,NULL,'Member','tags','2011-06-02 20:59:06'),(115,68,62,NULL,NULL,'Member','tags','2011-06-02 21:11:44'),(116,38,63,NULL,NULL,'Member','tags','2011-06-02 21:35:10'),(117,59,63,NULL,NULL,'Member','tags','2011-06-02 21:35:10'),(118,65,63,NULL,NULL,'Member','tags','2011-06-02 21:35:10'),(119,69,63,NULL,NULL,'Member','tags','2011-06-02 21:35:10'),(120,70,63,NULL,NULL,'Member','tags','2011-06-02 21:35:10'),(121,71,63,NULL,NULL,'Member','tags','2011-06-02 21:35:10'),(122,72,63,NULL,NULL,'Member','tags','2011-06-02 21:35:10');
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
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'Mobility',NULL,'Etiam at risus et justo dignissim congue. Donec congue lacinia dui, a porttitor lectus condimentum laoreet. Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit.'),(2,'Sustainability',NULL,'Sed auctor neque eu tellus rhoncus ut eleifend nibh porttitor. Ut in nulla enim. Phasellus molestie magna non est bibendum non venenatis nisl tempor. Suspendisse dictum feugiat nisl ut dapibus. Mauris iaculis porttitor posuere. Praesent id metus massa, ut blandit odio. Proin quis tortor orci. Etiam at risus et justo dignissim congue. Donec congue lacinia dui, a porttitor lectus condimentum laoreet. Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo.'),(3,'Health',NULL,'In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor.'),(4,'Community',NULL,'Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula egestas tincidunt. Nullam risus magna, ornare vitae varius eget, scelerisque a libero. Morbi eu porttitor ipsum. Nullam lorem nisi, posuere quis volutpat eget, luctus nec massa. Pellentesque aliquam lacinia tellus sit amet bibendum. Ut posuere justo.'),(5,'Urban planning',NULL,'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien.'),(6,'Connectivity',NULL,'Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus.'),(7,'Shelter',NULL,'Vestibulum mollis mauris enim. Morbi euismod magna ac lorem rutrum elementum. Donec viverra auctor lobortis. Pellentesque eu est a nulla placerat dignissim. Morbi a enim in magna semper bibendum. Etiam scelerisque, nunc ac egestas consequat, odio nibh euismod nulla, eget auctor orci nibh vel nisi. Aliquam erat volutpat. Mauris vel neque sit amet nunc gravida congue sed sit amet purus. Quisque lacus quam, egestas ac tincidunt a, lacinia vel velit. Aenean facilisis nulla vitae urna tincidunt congue sed ut dui. Morbi malesuada nulla nec purus convallis.'),(8,'Business',NULL,'Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam.Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam.Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam.'),(9,'fencing',NULL,NULL),(12,'video',NULL,NULL),(14,'ruby',NULL,NULL),(16,'arduino',NULL,NULL),(17,'fatherhood',NULL,NULL),(19,'web developer',NULL,NULL),(20,'procrastination',NULL,NULL),(21,'webdesign',NULL,NULL),(22,'photography',NULL,NULL),(23,'art',NULL,NULL),(24,'education',NULL,NULL),(26,'music',NULL,NULL),(29,'wining',NULL,NULL),(30,'hiking',NULL,NULL),(31,'documentary',NULL,NULL),(32,'physics',NULL,NULL),(33,'games',NULL,NULL),(34,'fiction',NULL,NULL),(35,'gardening',NULL,NULL),(36,'sun',NULL,NULL),(37,'food',NULL,NULL),(38,'design',NULL,NULL),(39,'picnic',NULL,NULL),(41,'utrecht',NULL,NULL),(42,'china',NULL,NULL),(43,'coffee',NULL,NULL),(45,'researcher',NULL,NULL),(46,'urbanization',NULL,NULL),(47,'nokia',NULL,NULL),(48,'new media',NULL,NULL),(49,'petrolhead',NULL,NULL),(50,'beta',NULL,NULL),(51,'lean startups',NULL,NULL),(52,'agile',NULL,NULL),(53,'tea',NULL,NULL),(54,'entrepeneur',NULL,NULL),(55,'radical user',NULL,NULL),(56,'vurb',NULL,NULL),(57,'non-fiction',NULL,NULL),(58,'viral radio',NULL,NULL),(59,'urbanism',NULL,NULL),(60,'heritage',NULL,NULL),(61,'arts',NULL,NULL),(62,'cities',NULL,NULL),(63,'mikael granlund',NULL,NULL),(64,'proces improvement',NULL,NULL),(65,'ideas',NULL,NULL),(66,'creativity',NULL,NULL),(67,'observation',NULL,NULL),(68,'guts',NULL,NULL),(69,'thinking',NULL,NULL),(70,'optimism',NULL,NULL),(71,'behaviour',NULL,NULL),(72,'future',NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `urls`
--

LOCK TABLES `urls` WRITE;
/*!40000 ALTER TABLE `urls` DISABLE KEYS */;
INSERT INTO `urls` VALUES (2,'matkins.co.uk','matkins.co',7,'Member','2011-05-18 12:57:40','2011-05-18 12:57:40'),(5,'www.kampman.nl','kampman',13,'Member','2011-05-18 14:44:56','2011-05-18 14:44:56'),(6,'http://www.flavors.me/andymayer','flavors',38,'Member','2011-05-18 16:07:13','2011-05-18 16:07:13'),(7,'http://www.yoomee.com','yoomee',38,'Member','2011-05-18 16:07:13','2011-05-18 16:07:13'),(8,'http://www.matkins.co.uk','matkins.co',39,'Member','2011-05-19 13:40:56','2011-05-19 13:40:56'),(12,'yoomee.com','yoomee',2,'Member','2011-05-25 22:10:34','2011-05-25 22:10:34'),(13,'http://www.yoomee.com','yoomee',1,'Member','2011-05-26 13:56:46','2011-05-26 13:56:46'),(14,'http://www.valvesoftware.com/games/hl2.html','valvesoftware.com/games/hl2',44,'Member','2011-05-27 16:21:59','2011-05-27 16:21:59'),(15,'twitter.com/juhavantzelfde','twitter',16,'Member','2011-05-27 20:07:23','2011-05-27 20:07:23'),(16,'www.diezijnvaardig.nl','diezijnvaardig',47,'Member','2011-05-30 16:08:59','2011-05-30 16:08:59'),(17,'http://non-fiction.nl','non-fiction',16,'Member','2011-06-01 22:52:40','2011-06-01 22:52:40'),(18,'http://vurb.eu','vurb',16,'Member','2011-06-01 22:53:01','2011-06-01 22:53:01'),(19,'http://www.beverleymerriman.com','beverleymerriman',54,'Member','2011-06-02 12:23:32','2011-06-02 12:23:32'),(20,'http://www.mooblr.com','mooblr',54,'Member','2011-06-02 12:23:32','2011-06-02 12:23:32'),(21,'http://www.thomasjacobs.nl/?r=twwt','thomasjacobs',59,'Member','2011-06-02 17:57:31','2011-06-02 17:57:31'),(22,'http://www.conferencebasics.com','conferencebasics',60,'Member','2011-06-02 18:04:02','2011-06-02 18:04:02'),(23,'http://deklontjes.tumblr.com/','deklontjes.tumblr',61,'Member','2011-06-02 20:42:50','2011-06-02 20:42:50'),(24,'http://www.nordkapp.fi','nordkapp',63,'Member','2011-06-02 21:28:02','2011-06-02 21:28:02');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
INSERT INTO `videos` VALUES (8,'Orelha Negra - M.I.R.I.A.M. X Vhils',NULL,'http://www.youtube.com/watch?v=t6FU1Fvn9Nk','\n        <object width=\"425\" height=\"350\">\n          <param name=\"movie\" value=\"http://www.youtube.com/v/t6FU1Fvn9Nk\"></param>\n          <param name=\"wmode\" value=\"transparent\"></param>\n          <embed src=\"http://www.youtube.com/v/t6FU1Fvn9Nk\" \n            type=\"application/x-shockwave-flash\" wmode=\"transparent\" \n            width=\"425\" height=\"300\">\n          </embed>\n        </object>\n      ','2011/05/18/09_54_56_737_file',2,NULL,NULL,'2011-05-18 16:54:56','2011-05-25 22:29:10',0),(9,'Charlieplexing the Arduino','Even a complex ','http://www.youtube.com/watch?v=K1Ap5JJ3A4E','\n        <object width=\"425\" height=\"350\">\n          <param name=\"movie\" value=\"http://www.youtube.com/v/K1Ap5JJ3A4E\"></param>\n          <param name=\"wmode\" value=\"transparent\"></param>\n          <embed src=\"http://www.youtube.com/v/K1Ap5JJ3A4E\" \n            type=\"application/x-shockwave-flash\" wmode=\"transparent\" \n            width=\"425\" height=\"300\">\n          </embed>\n        </object>\n      ','2011/05/25/15_24_46_368_file',2,NULL,NULL,'2011-05-25 22:24:46','2011-05-25 22:25:31',0),(10,'A Joyous Racket',NULL,'http://vimeo.com/20709010','<iframe src=\"http://player.vimeo.com/video/20709010\" width=\"1280\" height=\"720\" frameborder=\"0\"></iframe>','2011/05/27/07_54_26_323_file',33,NULL,NULL,'2011-05-27 14:54:26','2011-06-01 20:28:05',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wall_posts`
--

LOCK TABLES `wall_posts` WRITE;
/*!40000 ALTER TABLE `wall_posts` DISABLE KEYS */;
INSERT INTO `wall_posts` VALUES (3,33,8,'I didn\'t really notice the tags/themes to the far right... Also maybe restrict themes to a pulldown menu?','2011-05-20 08:35:44','2011-05-20 08:35:44'),(4,2,8,'Hi Todd. Please ignore this! Just testing! Also, the Club area is about to change a lot today based in feedback from Marcel. Also the emails you get will look a lot better.','2011-05-20 08:37:37','2011-05-20 08:37:37'),(5,33,8,'No problem. I\'m just testing too! But will get out of here now then...','2011-05-20 08:39:24','2011-05-20 08:39:24'),(6,2,8,'Things will change a lot here by the end of today. Thanks for playing!','2011-05-20 08:59:09','2011-05-20 08:59:09'),(7,7,13,'Love it','2011-05-25 15:46:50','2011-05-25 15:46:50'),(8,5,13,'Haha brilliant!','2011-05-26 08:54:32','2011-05-26 08:54:32'),(9,2,16,'Todd that\'s awesome. I had no idea you did this kinda stuff. Very inspiring.','2011-06-01 20:28:05','2011-06-01 20:28:05');
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `walls`
--

LOCK TABLES `walls` WRITE;
/*!40000 ALTER TABLE `walls` DISABLE KEYS */;
INSERT INTO `walls` VALUES (8,8,'Shout',NULL,'2011-05-18 16:52:50','2011-05-18 16:52:50'),(9,10,'Shout',NULL,'2011-05-19 08:49:24','2011-05-19 08:49:24'),(13,13,'Shout',NULL,'2011-05-25 09:55:12','2011-05-25 09:55:12'),(14,14,'Shout',NULL,'2011-05-25 22:24:48','2011-05-25 22:24:48'),(15,15,'Shout',NULL,'2011-05-25 22:34:23','2011-05-25 22:34:23'),(16,16,'Shout',NULL,'2011-05-27 14:54:27','2011-05-27 14:54:27'),(17,17,'Shout',NULL,'2011-05-30 05:32:31','2011-05-30 05:32:31');
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

-- Dump completed on 2011-06-03  8:24:26
