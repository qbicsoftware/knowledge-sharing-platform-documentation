# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Generation Time: 2023-12-13 17:39:57 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table experiments
# ------------------------------------------------------------

CREATE TABLE `experiments` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openbis_experiment_identifier` varchar(64) NOT NULL DEFAULT '' COMMENT 'full openBIS identifier: /SPACE_CODE/PROJECT_CODE/EXPERIMENT_CODE/',
  PRIMARY KEY (`id`),
  KEY `openbis_experiment_identifier` (`openbis_experiment_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


# Dump of table ipspine_designs
# ------------------------------------------------------------

CREATE TABLE `ipspine_designs` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `shortname` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '""'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_german2_ci;


# Dump of table ipspine_experiments_design
# ------------------------------------------------------------

CREATE TABLE `ipspine_experiments_design` (
  `id` int(11) unsigned NOT NULL DEFAULT 0,
  `design_id` int(11) unsigned NOT NULL,
  `openbis_experiment_identifier` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '' COMMENT 'full openBIS identifier: /SPACE_CODE/PROJECT_CODE/EXPERIMENT_CODE/',
  `active` tinyint(1) unsigned NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_german2_ci;


# Dump of table person
# ------------------------------------------------------------

CREATE TABLE `person` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `first_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `last_name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `title` enum('None','Dr.','Prof. Dr.','PhD') NOT NULL,
  `email` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '',
  `active` tinyint(1) NOT NULL DEFAULT 1,
  `reference_id` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


# Dump of table person_affiliation
# ------------------------------------------------------------

CREATE TABLE `person_affiliation` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `affiliation_id` int(11) unsigned NOT NULL,
  `person_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `affiliationFK` (`affiliation_id`),
  KEY `customerFK` (`person_id`),
  CONSTRAINT `affiliationFK` FOREIGN KEY (`affiliation_id`) REFERENCES `affiliation` (`id`) ON DELETE CASCADE,
  CONSTRAINT `customerFK` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;


# Dump of table projects
# ------------------------------------------------------------

CREATE TABLE `projects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `openbis_project_identifier` varchar(64) NOT NULL DEFAULT '' COMMENT 'full openBIS identifier: /SPACE_CODE/SAMPLE_CODE',
  `short_title` varchar(180) DEFAULT '',
  `long_description` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `openbis_project_identifier` (`openbis_project_identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


# Dump of table projects_persons
# ------------------------------------------------------------

CREATE TABLE `projects_persons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `project_id` int(11) unsigned NOT NULL DEFAULT 0,
  `person_id` int(11) unsigned NOT NULL DEFAULT 0,
  `project_role` set('PI','Contact','Manager') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `projects_persons_ibfk_2_idx` (`person_id`),
  CONSTRAINT `projects_persons_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
