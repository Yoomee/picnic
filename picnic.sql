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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `badge_awardings`
--

LOCK TABLES `badge_awardings` WRITE;
/*!40000 ALTER TABLE `badge_awardings` DISABLE KEYS */;
INSERT INTO `badge_awardings` VALUES (2,1,9,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(3,1,10,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(4,1,11,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(5,1,12,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(6,1,13,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(7,1,14,0,'2011-05-05 09:12:58','2011-05-05 09:12:58'),(8,2,15,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(9,2,16,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(10,2,17,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(11,2,18,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(12,2,19,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(13,2,20,0,'2011-05-05 09:17:34','2011-05-05 09:17:34'),(14,3,21,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(15,3,22,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(16,3,23,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(17,3,24,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(18,3,25,0,'2011-05-05 09:20:22','2011-05-05 09:20:22'),(19,3,26,0,'2011-05-05 09:20:22','2011-05-05 09:20:22');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `badges`
--

LOCK TABLES `badges` WRITE;
/*!40000 ALTER TABLE `badges` DISABLE KEYS */;
INSERT INTO `badges` VALUES (1,'picnic_team','Picnic Team','Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia.','2011/05/05/02_20_05_490_shield.png',''),(2,'picnic_advisor','Picnic Advisor','Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero. Vestibulum mollis mauris enim. Morbi euismod magna.','2011/05/05/02_19_08_20_shield.png',''),(3,'correspondent','Correspondent','Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero. Vestibulum mollis mauris enim. Morbi euismod magna.','2011/05/05/02_20_24_165_shield.png','');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `documents`
--

LOCK TABLES `documents` WRITE;
/*!40000 ALTER TABLE `documents` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `item_relationships`
--

LOCK TABLES `item_relationships` WRITE;
/*!40000 ALTER TABLE `item_relationships` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,'si@yoomee.com','si','olive123','Si','Wilkins',1,'',NULL,'2011-04-28 11:18:54','2011-05-05 09:21:58',NULL,0,0,'77.86.30.132',NULL,NULL),(2,'andy@yoomee.com','andy','olive123','Andy','Mayer',1,'',NULL,'2011-04-28 11:18:54','2011-05-03 14:11:02',NULL,0,0,'77.86.30.132',NULL,NULL),(3,'nicola@yoomee.com','nicola','olive123','Nicola','Mayer',1,'',NULL,'2011-04-28 11:18:54','2011-04-28 11:18:54',NULL,0,0,NULL,NULL,NULL),(4,'rich@yoomee.com','rich','olive123','Rich','Wells',1,'',NULL,'2011-04-28 11:18:54','2011-04-28 11:18:54',NULL,0,0,NULL,NULL,NULL),(5,'ian@yoomee.com','ian','olive123','Ian','Mooney',1,'',NULL,'2011-04-28 11:18:54','2011-05-04 08:43:24',NULL,0,0,'77.86.30.132',NULL,NULL),(6,'rob@yoomee.com','rob','olive123','Rob','Parvin',1,'',NULL,'2011-04-28 11:18:54','2011-04-28 11:18:54',NULL,0,0,NULL,NULL,NULL),(7,'matt@yoomee.com','matt','olive123','Matt','Atkins',1,'',NULL,'2011-04-28 11:18:54','2011-04-28 11:18:54',NULL,0,0,NULL,NULL,NULL),(8,'iancmooney@gmail.com','','bluebiz13','Ian','Mooney',0,'',NULL,'2011-05-03 15:24:43','2011-05-03 15:24:44',NULL,0,1,'77.86.30.132',61102010,NULL),(9,'teammember1@yoomee.com','','password','Marleen Stikker','1',0,'PICNIC','I\'m the co-founder of PICNIC. I bring you exciting technology applications and a sixth sense for what’s next.','2011-05-05 09:11:46','2011-05-05 10:03:21',NULL,1,0,NULL,NULL,NULL),(10,'teammember2@yoomee.com','','password','Team Member','2',0,'',NULL,'2011-05-05 09:11:46','2011-05-05 09:11:46',NULL,0,0,NULL,NULL,NULL),(11,'teammember3@yoomee.com','','password','Team Member','3',0,'',NULL,'2011-05-05 09:11:46','2011-05-05 09:11:46',NULL,0,0,NULL,NULL,NULL),(12,'teammember4@yoomee.com','','password','Team Member','4',0,'',NULL,'2011-05-05 09:11:47','2011-05-05 09:11:47',NULL,0,0,NULL,NULL,NULL),(13,'teammember5@yoomee.com','','password','Team Member','5',0,'',NULL,'2011-05-05 09:11:47','2011-05-05 09:11:47',NULL,0,0,NULL,NULL,NULL),(14,'teammember6@yoomee.com','','password','Team Member','6',0,'',NULL,'2011-05-05 09:11:47','2011-05-05 09:11:47',NULL,0,0,NULL,NULL,NULL),(15,'advisor1@yoomee.com','','password','Advisor','1',0,'',NULL,'2011-05-05 09:14:54','2011-05-05 09:14:54',NULL,0,0,NULL,NULL,NULL),(16,'advisor2@yoomee.com','','password','Advisor','2',0,'',NULL,'2011-05-05 09:14:54','2011-05-05 09:14:54',NULL,0,0,NULL,NULL,NULL),(17,'advisor3@yoomee.com','','password','Advisor','3',0,'',NULL,'2011-05-05 09:14:54','2011-05-05 09:14:54',NULL,0,0,NULL,NULL,NULL),(18,'advisor4@yoomee.com','','password','Advisor','4',0,'',NULL,'2011-05-05 09:14:54','2011-05-05 09:14:54',NULL,0,0,NULL,NULL,NULL),(19,'advisor5@yoomee.com','','password','Advisor','5',0,'',NULL,'2011-05-05 09:14:54','2011-05-05 09:14:54',NULL,0,0,NULL,NULL,NULL),(20,'advisor6@yoomee.com','','password','Advisor','6',0,'',NULL,'2011-05-05 09:14:54','2011-05-05 09:14:54',NULL,0,0,NULL,NULL,NULL),(21,'correspondent1@yoomee.com','','password','Correspondent','1',0,'',NULL,'2011-05-05 09:18:19','2011-05-05 09:18:19',NULL,0,0,NULL,NULL,NULL),(22,'correspondent2@yoomee.com','','password','Correspondent','2',0,'',NULL,'2011-05-05 09:18:19','2011-05-05 09:18:19',NULL,0,0,NULL,NULL,NULL),(23,'correspondent3@yoomee.com','','password','Correspondent','3',0,'',NULL,'2011-05-05 09:18:19','2011-05-05 09:18:19',NULL,0,0,NULL,NULL,NULL),(24,'correspondent4@yoomee.com','','password','Correspondent','4',0,'',NULL,'2011-05-05 09:18:20','2011-05-05 09:18:20',NULL,0,0,NULL,NULL,NULL),(25,'correspondent5@yoomee.com','','password','Correspondent','5',0,'',NULL,'2011-05-05 09:18:20','2011-05-05 09:18:20',NULL,0,0,NULL,NULL,NULL),(26,'correspondent6@yoomee.com','','password','Correspondent','6',0,'',NULL,'2011-05-05 09:18:20','2011-05-05 09:18:20',NULL,0,0,NULL,NULL,NULL);
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
INSERT INTO `members_news_feed_items` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(2,8),(8,10),(9,11),(10,12),(11,13),(12,14),(13,15),(14,16),(15,17),(16,18),(17,19),(18,20),(19,21),(20,22),(21,23),(22,24),(23,25),(24,26),(25,27),(26,28);
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `news_feed_items`
--

LOCK TABLES `news_feed_items` WRITE;
/*!40000 ALTER TABLE `news_feed_items` DISABLE KEYS */;
INSERT INTO `news_feed_items` VALUES (1,1,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(2,2,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(3,3,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(4,4,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(5,5,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(6,6,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(7,7,'Member',NULL,0,1,'2011-04-28 11:18:54','2011-04-28 11:18:54'),(8,2,'Photo',NULL,0,1,'2011-05-03 14:25:04','2011-05-03 14:25:04'),(10,8,'Member',NULL,0,1,'2011-05-03 15:24:43','2011-05-03 15:24:43'),(11,9,'Member',NULL,0,1,'2011-05-05 09:11:46','2011-05-05 09:11:46'),(12,10,'Member',NULL,0,1,'2011-05-05 09:11:46','2011-05-05 09:11:46'),(13,11,'Member',NULL,0,1,'2011-05-05 09:11:46','2011-05-05 09:11:46'),(14,12,'Member',NULL,0,1,'2011-05-05 09:11:47','2011-05-05 09:11:47'),(15,13,'Member',NULL,0,1,'2011-05-05 09:11:47','2011-05-05 09:11:47'),(16,14,'Member',NULL,0,1,'2011-05-05 09:11:47','2011-05-05 09:11:47'),(17,15,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(18,16,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(19,17,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(20,18,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(21,19,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(22,20,'Member',NULL,0,1,'2011-05-05 09:14:54','2011-05-05 09:14:54'),(23,21,'Member',NULL,0,1,'2011-05-05 09:18:19','2011-05-05 09:18:19'),(24,22,'Member',NULL,0,1,'2011-05-05 09:18:19','2011-05-05 09:18:19'),(25,23,'Member',NULL,0,1,'2011-05-05 09:18:19','2011-05-05 09:18:19'),(26,24,'Member',NULL,0,1,'2011-05-05 09:18:20','2011-05-05 09:18:20'),(27,25,'Member',NULL,0,1,'2011-05-05 09:18:20','2011-05-05 09:18:20'),(28,26,'Member',NULL,0,1,'2011-05-05 09:18:20','2011-05-05 09:18:20');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,1,'About Us',NULL,'This is what we are about.','2011-04-28 11:18:54','2011-04-28 11:18:54','2035-01-01 00:00:00','2011-04-28 11:18:53',0,NULL,0,NULL),(2,4,'What is PICNIC?',NULL,'<h5 class=\"article_intro\">\r\n	The PICNIC name represents everything we strive to be. It is a gathering of friends old and new, where everyone brings something to the table.</h5>\r\n<p>\r\n	People from diverse backgrounds come to exchange ideas and insight in an informal, social atmosphere. It&rsquo;s a chance to try new things and expose yourself to ideas outside your area of expertise. Share, discuss, collaborate and leave with a new perspective on what is possible.</p>\r\n<p>\r\n	PICNIC is about innovative ideas for business and society. It is an annual three-day festival that blurs the lines between creativity, science, technology and business to explore new solutions in the spirit of co-creation. Curious minds eager to exchange their knowledge, ideas and skills gather at PICNIC, making it the place to create the future &ndash; together.</p>\r\n<h4>\r\n	Who Attends PICNIC</h4>\r\n<p>\r\n	PICNIC attracts a global audience from a wide range of sectors. PICNIC attendees include creative agencies, artists, scientists, designers, marketers, brand managers, content producers, (new) media experts, government leaders, programmers, investors, lawyers, entrepreneurs, freelancers, inventors, technology providers, games developers, services providers, students and teachers just to name a few!</p>\r\n<p>\r\n	PICNIC attendees have one thing in common: they are all curious minds with a passion for finding innovative solutions for the challenges we face today and tomorrow.</p>\r\n<h4>\r\n	See What Makes PICNIC Unique</h4>\r\n<p>\r\n	Below you will find a couple videos that give you a brief impression of what you can experience as a PICNIC visitor. For a more in-depth idea of some of the topics we cover at the yearly PICNIC festival, be sure to view our archive of PICNIC lectures on Vimeo.&nbsp;</p>\r\n<p>\r\n	http://vimeo.com/16245565</p>\r\n<h4>\r\n	PICNIC Promo Video</h4>\r\n<p>\r\n	http://www.youtube.com/watch?v=w_DmwaVNAJ8</p>\r\n','2011-04-28 11:45:38','2011-05-05 10:00:47','2035-01-01 00:00:00','2011-04-28 11:45:00',1,6,0,''),(3,4,'Festival experience',NULL,'<h5 class=\"article_intro\">\r\n	PICNIC is so much more than your average conference, it&#39;s a festival! What sets PICNIC apart from the rest? Keep reading to find out more.</h5>\r\n<p>\r\n	<strong>Three full days of information</strong>, collaboration and entertainment. A chance for prolonged conversations and development of relationships.</p>\r\n<p>\r\n	<strong>Interdisciplinary themes</strong> attract the widest possible audience. Every year, our key themes evolve to reflect changes in our society and economy. Cutting-edge content with far-reaching applications.</p>\r\n<p>\r\n	<strong>Get inspired.</strong> Sit back, relax and catch up on the latest ideas from global thought leaders.</p>\r\n<p>\r\n	<strong>Make and create</strong>. PICNIC is not for observers, it&rsquo;s for participants. Lectures are only a small part of the PICNIC experience. Competitions, challenges, social games, matchmaking, labs and workshops encourage everyone to get involved and get their hands dirty.</p>\r\n<p>\r\n	<strong>Play.</strong> Interactive exhibitions, games, networking sessions and unexpected surprises make for a fun and laid-back experience.</p>\r\n<p>\r\n	<strong>Interaction across boundaries.</strong> Speakers guide students. Designers meet business developers. Hackers collaborate with artists. The combinations are endless.</p>\r\n<p>\r\n	<strong>Casual, social atmosphere</strong> wrapped in a festival environment.</p>\r\n<p>\r\n	<strong>Escape to another world.</strong> The entire event ground is transformed by the PICNIC look and feel.</p>\r\n','2011-04-28 11:46:13','2011-05-05 10:01:34','2035-01-01 00:00:00','2011-04-28 11:46:13',1,5,0,''),(4,4,'The team',NULL,'<p>\r\n	Info about the team here. Aliquam erat volutpat. Mauris vel neque sit amet nunc gravida congue sed sit amet purus. Quisque lacus quam, egestas ac tincidunt a, lacinia vel velit. Aenean facilisis nulla vitae urna tincidunt congue sed ut dui. Morbi malesuada nulla nec purus convallis consequat. Vivamus id mollis quam.</p>\r\n','2011-04-28 11:46:43','2011-05-05 09:23:16','2035-01-01 00:00:00','2011-04-28 11:46:00',0,NULL,0,NULL),(5,4,'The advisors',NULL,'<p>\r\n	PICNIC&#39;s advisors are one of our most valuable resources! They share their dedication, time and expertise to help shape the content and experience that defines PICNIC.</p>\r\n','2011-04-28 11:49:24','2011-05-05 09:30:23','2035-01-01 00:00:00','2011-04-28 11:49:00',0,NULL,0,NULL),(6,4,'Location',NULL,'<p>\r\n	Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus suscipit, sem diam ultrices mauris, eu consequat purus metus eu velit. Proin metus odio, aliquam eget molestie nec, gravida ut sapien. Phasellus quis est sed turpis sollicitudin venenatis sed eu odio. Praesent eget neque eu eros interdum malesuada non vel leo. Sed fringilla porta ligula egestas tincidunt. Nullam risus magna, ornare vitae varius eget, scelerisque a libero. Morbi eu porttitor ipsum. Nullam lorem nisi, posuere quis volutpat eget, luctus nec massa. Pellentesque aliquam lacinia tellus sit amet bibendum. Ut posuere justo in enim pretium scelerisque. Etiam ornare vehicula euismod. Vestibulum at risus augue. Sed non semper dolor. Sed fringilla consequat velit a porta. Pellentesque sed lectus pharetra ipsum ultricies commodo non sit amet velit. Suspendisse volutpat lobortis ipsum, in scelerisque nisi iaculis a. Duis pulvinar lacinia commodo. Integer in lorem id nibh luctus aliquam. Sed elementum, est ac sagittis porttitor, neque metus ultricies ante, in accumsan massa nisl non metus. Vivamus sagittis quam a lacus dictum tempor. Nullam in semper ipsum. Cras a est id massa malesuada tincidunt. Etiam a urna tellus. Ut rutrum vehicula dui, eu cursus magna tincidunt pretium. Donec malesuada accumsan quam, et commodo orci viverra et. Integer tincidunt sagittis lectus. Mauris ac ligula quis orci auctor tincidunt. Suspendisse odio justo, varius id posuere sit amet, iaculis sit amet orci. Suspendisse potenti. Suspendisse potenti. Aliquam erat volutpat. Sed posuere dignissim odio, nec cursus odio mollis et. Praesent cursus, orci ut dictum adipiscing, tellus ante porttitor leo, vel gravida lacus lorem vitae est. Duis ultricies feugiat ante nec aliquam. Maecenas varius, nulla vel fermentum semper, metus nibh bibendum nunc, vitae suscipit mauris velit ac nunc. Mauris nunc eros.</p>\r\n<p>\r\n	Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero. Vestibulum mollis mauris enim. Morbi euismod magna ac lorem rutrum elementum. Donec viverra auctor lobortis. Pellentesque eu est a nulla placerat dignissim. Morbi a enim in magna semper bibendum. Etiam scelerisque, nunc ac egestas consequat, odio nibh euismod nulla, eget auctor orci nibh vel nisi. Aliquam erat volutpat. Mauris vel neque sit amet nunc gravida congue sed sit amet purus. Quisque lacus quam, egestas ac tincidunt a, lacinia vel velit. Aenean facilisis nulla vitae urna tincidunt congue sed ut dui. Morbi malesuada nulla nec purus convallis consequat. Vivamus id mollis quam. Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam vestibulum, arcu sodales feugiat consectetur, nisl orci bibendum elit.</p>\r\n','2011-04-28 11:50:07','2011-05-05 09:27:33','2035-01-01 00:00:00','2011-04-28 11:50:07',0,2,0,NULL),(7,7,'Registration',NULL,'<p>\r\n	Praesent id metus massa, ut blandit odio. Proin quis tortor orci. Etiam at risus et justo dignissim congue. Donec congue lacinia dui, a porttitor lectus condimentum laoreet. Nunc eu ullamcorper orci. Quisque eget odio ac lectus vestibulum faucibus eget in metus. In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed molestie augue sit amet leo consequat posuere. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero. Vestibulum mollis mauris enim. Morbi euismod magna ac lorem rutrum elementum. Donec viverra auctor lobortis. Pellentesque eu est a nulla placerat dignissim. Morbi a enim in magna semper bibendum. Etiam scelerisque, nunc ac egestas consequat, odio nibh euismod nulla, eget auctor orci nibh vel nisi. Aliquam erat volutpat. Mauris vel neque sit amet nunc gravida congue sed sit amet purus. Quisque lacus quam, egestas ac tincidunt a, lacinia vel velit. Aenean facilisis nulla vitae urna tincidunt congue sed ut dui. Morbi malesuada nulla nec purus convallis consequat. Vivamus id mollis quam. Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam vestibulum, arcu sodales feugiat consectetur, nisl orci bibendum elit.</p>\r\n<p>\r\n	Morbi euismod magna ac lorem rutrum elementum. Donec viverra auctor lobortis. Pellentesque eu est a nulla placerat dignissim. Morbi a enim in magna semper bibendum. Etiam scelerisque, nunc ac egestas consequat, odio nibh euismod nulla, eget auctor orci nibh vel nisi. Aliquam erat volutpat. Mauris vel neque sit amet nunc gravida congue sed sit amet purus. Quisque lacus quam, egestas ac tincidunt a, lacinia vel velit. Aenean facilisis nulla vitae urna tincidunt congue sed ut dui. Morbi malesuada nulla nec purus convallis consequat. Vivamus id mollis quam. Morbi ac commodo nulla. In condimentum orci id nisl volutpat bibendum. Quisque commodo hendrerit lorem quis egestas. Maecenas quis tortor arcu. Vivamus rutrum nunc non neque consectetur quis placerat neque lobortis. Nam vestibulum, arcu sodales feugiat consectetur, nisl orci bibendum elit, eu euismod magna sapien ut nibh. Donec semper quam scelerisque tortor dictum gravida. In hac habitasse platea dictumst. Nam pulvinar, odio sed rhoncus.</p>\r\n','2011-04-28 11:50:58','2011-05-05 09:54:59','2035-01-01 00:00:00','2011-04-28 11:50:58',1,NULL,0,NULL),(8,5,'Overview',NULL,'<h5 class=\"article_intro\">\r\n	There is nothing here yet.</h5>\r\n<p>\r\n	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero. Vestibulum mollis mauris enim. Morbi euismod magna ac lorem.</p>\r\n','2011-05-05 09:32:59','2011-05-05 09:55:44','2035-01-01 00:00:00','2011-05-05 09:32:00',1,2,0,NULL),(9,6,'Overview',NULL,'<h5 class=\"article_intro\">\r\n	There is nothing here yet.</h5>\r\n<p>\r\n	Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin vel ante a orci tempus eleifend ut et magna. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus luctus urna sed urna ultricies ac tempor dui sagittis. In condimentum facilisis porta. Sed nec diam eu diam mattis viverra. Nulla fringilla, orci ac euismod semper, magna diam porttitor mauris, quis sollicitudin sapien justo in libero. Vestibulum mollis mauris enim. Morbi euismod magna ac lorem.</p>\r\n','2011-05-05 09:49:20','2011-05-05 09:56:01','2035-01-01 00:00:00','2011-05-05 09:49:00',1,2,0,NULL),(10,4,'How it began',NULL,'<p>\r\n	In 2006, Bas Verhart (founder of Media Republic) joined forces with Marleen Stikker (founder and CEO of Waag Society) to develop a new platform for creativity and innovation in Amsterdam. They wanted to bring together the world&rsquo;s top creative and business professionals to develop new partnerships and opportunities. Supported by their network of friends, collaborators and admirers, including former Amsterdam Mayor Job Cohen, PICNIC was born. The first edition of PICNIC was launched in September 2006</p>\r\n','2011-05-05 09:59:52','2011-05-05 10:00:30','2035-01-01 00:00:00','2011-05-05 09:59:52',1,2,0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `permalinks`
--

LOCK TABLES `permalinks` WRITE;
/*!40000 ALTER TABLE `permalinks` DISABLE KEYS */;
INSERT INTO `permalinks` VALUES (1,'about-us','Section',1,'about_us'),(2,'news','Section',2,'news'),(3,'about-us-1','Page',1,'about_us_page'),(4,'picnic11','Section',3,'picnic11'),(5,'intro','Section',4,NULL),(6,'sessions','Section',5,NULL),(7,'what-is-picnic','Page',2,NULL),(8,'festival-experience','Page',3,NULL),(9,'the-team','Page',4,'the_team'),(10,'the-advisors','Page',5,'advisors'),(11,'location','Page',6,NULL),(12,'registration','Page',7,NULL),(13,'sessions-overview','Page',8,NULL),(14,'themes','Section',6,NULL),(15,'themes-overview','Page',9,NULL),(16,'registration-1','Section',7,NULL),(17,'history','Page',10,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `photo_albums`
--

LOCK TABLES `photo_albums` WRITE;
/*!40000 ALTER TABLE `photo_albums` DISABLE KEYS */;
INSERT INTO `photo_albums` VALUES (1,'System Images',NULL,NULL,1,'2011-04-28 11:18:53','2011-04-28 11:18:53');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `photos`
--

LOCK TABLES `photos` WRITE;
/*!40000 ALTER TABLE `photos` DISABLE KEYS */;
INSERT INTO `photos` VALUES (2,'Holding image','','2011/05/03/07_25_04_590_holding.png',2,NULL,NULL,'2011-05-03 14:25:04','2011-05-05 09:55:44',1,1),(5,'Festival_d961c0b77f.jpg',NULL,'2011/05/03/07_53_44_220_Festival_d961c0b77f.jpg',2,NULL,NULL,'2011-05-03 14:53:44','2011-05-05 10:01:34',1,1),(6,'Mark_Bun_16743b5844.jpg',NULL,'2011/05/03/07_54_33_54_Mark_Bun_16743b5844.jpg',2,NULL,NULL,'2011-05-03 14:54:33','2011-05-05 10:00:47',1,1);
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
INSERT INTO `schema_migrations` VALUES ('20091016104635'),('20091016120409'),('20091106165316'),('20100210115949'),('20100305173427'),('20100325163719'),('20100407105403'),('20100407105419'),('20100407144339'),('20100408145821'),('20100408162026'),('20100409093733'),('20100409141224'),('20100409143244'),('20100409143304'),('20100409160300'),('20100409160456'),('20100415145447'),('20100415154222'),('20100416115334'),('20100416151432'),('20100416155503'),('20100421100955'),('20100421101145'),('20100421120435'),('20100422091505'),('20100422142610'),('20100423123257'),('20100423123315'),('20100521112757'),('20100524122600'),('20100524153922'),('20100524163512'),('20100525102621'),('20100527100007'),('20100527115352'),('20100601092537'),('20100601094912'),('20100601142242'),('20100601152053'),('20100602090247'),('20100602112131'),('20100602114556'),('20100608101828'),('20100608135949'),('20100609084428'),('20100610132813'),('20100623115210'),('20100714085900'),('20100714090928'),('20100715094246'),('20100715144911'),('20100716105516'),('20100720131711'),('20100727134606'),('20100810082603'),('20100812140336'),('20100825134535'),('20100826094542'),('20101005151730'),('20101013133204'),('20101021165624'),('20101028141828'),('20101215120207'),('20110107150714'),('20110110113046'),('20110112163551'),('20110113145943'),('20110128112444'),('20110207164351'),('20110214162012'),('20110215120230'),('20110218153159'),('20110224151746'),('20110401111953'),('20110407120146'),('20110428095550'),('20110428150331'),('20110503143045'),('20110503153808'),('20110504112720');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sections`
--

LOCK TABLES `sections` WRITE;
/*!40000 ALTER TABLE `sections` DISABLE KEYS */;
INSERT INTO `sections` VALUES (1,NULL,'About Us',0,'normal',0,NULL,'2011-04-28 11:18:53','2011-04-28 11:18:53',NULL,NULL),(2,NULL,'News',0,'latest_stories',0,NULL,'2011-04-28 11:18:53','2011-04-28 11:18:53',NULL,NULL),(3,NULL,'PICNIC11',0,'first_page',0,NULL,'2011-04-28 11:18:54','2011-04-28 11:21:19',NULL,NULL),(4,3,'Intro',0,'first_page',0,NULL,'2011-04-28 11:20:49','2011-04-28 11:20:49',NULL,NULL),(5,3,'Sessions',0,'first_page',0,NULL,'2011-04-28 11:21:10','2011-04-28 11:21:10',NULL,NULL),(6,3,'Themes',0,'first_page',0,NULL,'2011-05-05 09:48:36','2011-05-05 09:48:36',NULL,NULL),(7,3,'Registration',0,'first_page',1,NULL,'2011-05-05 09:54:41','2011-05-05 09:54:41',NULL,NULL);
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
  PRIMARY KEY  (`id`),
  KEY `index_shouts_on_member_id` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `shouts`
--

LOCK TABLES `shouts` WRITE;
/*!40000 ALTER TABLE `shouts` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `snippets`
--

LOCK TABLES `snippets` WRITE;
/*!40000 ALTER TABLE `snippets` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `taggings`
--

LOCK TABLES `taggings` WRITE;
/*!40000 ALTER TABLE `taggings` DISABLE KEYS */;
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
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `venues`
--

LOCK TABLES `venues` WRITE;
/*!40000 ALTER TABLE `venues` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `videos`
--

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `wall_posts`
--

LOCK TABLES `wall_posts` WRITE;
/*!40000 ALTER TABLE `wall_posts` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `walls`
--

LOCK TABLES `walls` WRITE;
/*!40000 ALTER TABLE `walls` DISABLE KEYS */;
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

-- Dump completed on 2011-05-05 10:03:58
