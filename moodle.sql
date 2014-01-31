-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 31, 2014 at 07:25 PM
-- Server version: 5.5.35-log
-- PHP Version: 5.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `moodle`
--

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alwaysshowdescription` tinyint(2) NOT NULL DEFAULT '0',
  `nosubmissions` tinyint(2) NOT NULL DEFAULT '0',
  `submissiondrafts` tinyint(2) NOT NULL DEFAULT '0',
  `sendnotifications` tinyint(2) NOT NULL DEFAULT '0',
  `sendlatenotifications` tinyint(2) NOT NULL DEFAULT '0',
  `duedate` bigint(10) NOT NULL DEFAULT '0',
  `allowsubmissionsfromdate` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(2) NOT NULL DEFAULT '0',
  `cutoffdate` bigint(10) NOT NULL DEFAULT '0',
  `teamsubmission` tinyint(2) NOT NULL DEFAULT '0',
  `requireallteammemberssubmit` tinyint(2) NOT NULL DEFAULT '0',
  `teamsubmissiongroupingid` bigint(10) NOT NULL DEFAULT '0',
  `blindmarking` tinyint(2) NOT NULL DEFAULT '0',
  `revealidentities` tinyint(2) NOT NULL DEFAULT '0',
  `attemptreopenmethod` varchar(10) NOT NULL DEFAULT 'none',
  `maxattempts` mediumint(6) NOT NULL DEFAULT '-1',
  `markingworkflow` tinyint(2) NOT NULL DEFAULT '0',
  `markingallocation` tinyint(2) NOT NULL DEFAULT '0',
  `requiresubmissionstatement` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou_ix` (`course`),
  KEY `mdl_assi_tea_ix` (`teamsubmissiongroupingid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table saves information about an instance of mod_assign' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `commenttext` longtext,
  `commentformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assicomm_ass_ix` (`assignment`),
  KEY `mdl_assicomm_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Text feedback for submitted assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_annot`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_annot` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `endx` bigint(10) DEFAULT '0',
  `endy` bigint(10) DEFAULT '0',
  `path` longtext,
  `type` varchar(10) DEFAULT 'line',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditanno_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditanno_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores annotations added to pdfs submitted by students' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_cmnt`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_cmnt` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `x` bigint(10) DEFAULT '0',
  `y` bigint(10) DEFAULT '0',
  `width` bigint(10) DEFAULT '120',
  `rawtext` longtext,
  `pageno` bigint(10) NOT NULL DEFAULT '0',
  `colour` varchar(10) DEFAULT 'black',
  `draft` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditcmnt_grapag_ix` (`gradeid`,`pageno`),
  KEY `mdl_assieditcmnt_gra_ix` (`gradeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores comments added to pdfs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_editpdf_quick`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_editpdf_quick` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `rawtext` longtext NOT NULL,
  `width` bigint(10) NOT NULL DEFAULT '120',
  `colour` varchar(10) DEFAULT 'yellow',
  PRIMARY KEY (`id`),
  KEY `mdl_assieditquic_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores teacher specified quicklist comments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignfeedback_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignfeedback_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass2_ix` (`assignment`),
  KEY `mdl_assifile_gra_ix` (`grade`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores info about the number of files submitted by a student' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assignmenttype` varchar(50) NOT NULL DEFAULT '',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `preventlate` tinyint(2) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(2) NOT NULL DEFAULT '0',
  `var1` bigint(10) DEFAULT '0',
  `var2` bigint(10) DEFAULT '0',
  `var3` bigint(10) DEFAULT '0',
  `var4` bigint(10) DEFAULT '0',
  `var5` bigint(10) DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `timedue` bigint(10) NOT NULL DEFAULT '0',
  `timeavailable` bigint(10) NOT NULL DEFAULT '0',
  `grade` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assi_cou2_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignment_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_assignment_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  `data1` longtext,
  `data2` longtext,
  `grade` bigint(11) NOT NULL DEFAULT '0',
  `submissioncomment` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `teacher` bigint(10) NOT NULL DEFAULT '0',
  `timemarked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assisubm_use2_ix` (`userid`),
  KEY `mdl_assisubm_mai_ix` (`mailed`),
  KEY `mdl_assisubm_tim_ix` (`timemarked`),
  KEY `mdl_assisubm_ass2_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about submitted assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_file`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_file` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `numfiles` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assifile_ass_ix` (`assignment`),
  KEY `mdl_assifile_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about file submissions for assignments' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assignsubmission_onlinetext`
--

CREATE TABLE IF NOT EXISTS `mdl_assignsubmission_onlinetext` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `submission` bigint(10) NOT NULL DEFAULT '0',
  `onlinetext` longtext,
  `onlineformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assionli_ass_ix` (`assignment`),
  KEY `mdl_assionli_sub_ix` (`submission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about onlinetext submission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `grader` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '0.00000',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assigrad_assuseatt_uix` (`assignment`,`userid`,`attemptnumber`),
  KEY `mdl_assigrad_use_ix` (`userid`),
  KEY `mdl_assigrad_ass_ix` (`assignment`),
  KEY `mdl_assigrad_att_ix` (`attemptnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading information about a single assignment submission.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_plugin_config`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_plugin_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `plugin` varchar(28) NOT NULL DEFAULT '',
  `subtype` varchar(28) NOT NULL DEFAULT '',
  `name` varchar(28) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_assiplugconf_plu_ix` (`plugin`),
  KEY `mdl_assiplugconf_sub_ix` (`subtype`),
  KEY `mdl_assiplugconf_nam_ix` (`name`),
  KEY `mdl_assiplugconf_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Config data for an instance of a plugin in an assignment.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `status` varchar(10) DEFAULT NULL,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `attemptnumber` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_assisubm_assusegroatt_uix` (`assignment`,`userid`,`groupid`,`attemptnumber`),
  KEY `mdl_assisubm_use_ix` (`userid`),
  KEY `mdl_assisubm_ass_ix` (`assignment`),
  KEY `mdl_assisubm_att_ix` (`attemptnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about student interactions with' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `mailed` smallint(4) NOT NULL DEFAULT '0',
  `extensionduedate` bigint(10) NOT NULL DEFAULT '0',
  `workflowstate` varchar(20) DEFAULT NULL,
  `allocatedmarker` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiuserflag_mai_ix` (`mailed`),
  KEY `mdl_assiuserflag_use_ix` (`userid`),
  KEY `mdl_assiuserflag_ass_ix` (`assignment`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_assign_user_mapping`
--

CREATE TABLE IF NOT EXISTS `mdl_assign_user_mapping` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assignment` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_assiusermapp_ass_ix` (`assignment`),
  KEY `mdl_assiusermapp_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_auth_intake_vouchers`
--

CREATE TABLE IF NOT EXISTS `mdl_auth_intake_vouchers` (
  `id` mediumint(6) NOT NULL AUTO_INCREMENT,
  `code` varchar(25) NOT NULL DEFAULT '',
  `count` mediumint(6) DEFAULT NULL,
  `used` mediumint(6) DEFAULT NULL,
  `courses` varchar(255) DEFAULT NULL,
  `groups` varchar(255) DEFAULT NULL,
  `active_from` bigint(10) NOT NULL,
  `active_till` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Vouchers storage' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_auth_intake_vouchers`
--

INSERT INTO `mdl_auth_intake_vouchers` (`id`, `code`, `count`, `used`, `courses`, `groups`, `active_from`, `active_till`) VALUES
(1, '136347', 5, 1, '2', NULL, 0, 0),
(2, 'voucher', 8, 0, '', NULL, 1391025600, 1422561600),
(3, 'lLopJ', 0, 0, '', NULL, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_controllers`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_controllers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `operation` varchar(20) NOT NULL DEFAULT 'backup',
  `type` varchar(10) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `format` varchar(20) NOT NULL DEFAULT '',
  `interactive` smallint(4) NOT NULL,
  `purpose` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `status` smallint(4) NOT NULL,
  `execution` smallint(4) NOT NULL,
  `executiontime` bigint(10) NOT NULL,
  `checksum` varchar(32) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `controller` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcont_bac_uix` (`backupid`),
  KEY `mdl_backcont_typite_ix` (`type`,`itemid`),
  KEY `mdl_backcont_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store the backup_controllers as they are used' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `laststarttime` bigint(10) NOT NULL DEFAULT '0',
  `lastendtime` bigint(10) NOT NULL DEFAULT '0',
  `laststatus` varchar(1) NOT NULL DEFAULT '5',
  `nextstarttime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backcour_cou_uix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store every course backup status' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_backup_logs`
--

CREATE TABLE IF NOT EXISTS `mdl_backup_logs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backupid` varchar(32) NOT NULL DEFAULT '',
  `loglevel` smallint(4) NOT NULL,
  `message` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_backlogs_bacid_uix` (`backupid`,`id`),
  KEY `mdl_backlogs_bac_ix` (`backupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To store all the logs from backup and restore operations (by' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge`
--

CREATE TABLE IF NOT EXISTS `mdl_badge` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usercreated` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `issuername` varchar(255) NOT NULL DEFAULT '',
  `issuerurl` varchar(255) NOT NULL DEFAULT '',
  `issuercontact` varchar(255) DEFAULT NULL,
  `expiredate` bigint(10) DEFAULT NULL,
  `expireperiod` bigint(10) DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `courseid` bigint(10) DEFAULT NULL,
  `message` longtext NOT NULL,
  `messagesubject` longtext NOT NULL,
  `attachment` tinyint(1) NOT NULL DEFAULT '1',
  `notification` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `nextcron` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badg_typ_ix` (`type`),
  KEY `mdl_badg_cou_ix` (`courseid`),
  KEY `mdl_badg_use_ix` (`usermodified`),
  KEY `mdl_badg_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_backpack`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_backpack` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `backpackurl` varchar(255) NOT NULL DEFAULT '',
  `backpackuid` bigint(10) NOT NULL,
  `autosync` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgback_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(10) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgcrit_badcri_uix` (`badgeid`,`criteriatype`),
  KEY `mdl_badgcrit_cri_ix` (`criteriatype`),
  KEY `mdl_badgcrit_bad_ix` (`badgeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_met`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_met` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `issuedid` bigint(10) DEFAULT NULL,
  `critid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritmet_cri_ix` (`critid`),
  KEY `mdl_badgcritmet_use_ix` (`userid`),
  KEY `mdl_badgcritmet_iss_ix` (`issuedid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_criteria_param`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_criteria_param` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `critid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgcritpara_cri_ix` (`critid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_external`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `backpackid` bigint(10) NOT NULL,
  `collectionid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgexte_bac_ix` (`backpackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_issued`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_issued` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `uniquehash` longtext NOT NULL,
  `dateissued` bigint(10) NOT NULL DEFAULT '0',
  `dateexpire` bigint(10) DEFAULT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  `issuernotified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_badgissu_baduse_uix` (`badgeid`,`userid`),
  KEY `mdl_badgissu_bad_ix` (`badgeid`),
  KEY `mdl_badgissu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_badge_manual_award`
--

CREATE TABLE IF NOT EXISTS `mdl_badge_manual_award` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `badgeid` bigint(10) NOT NULL,
  `recipientid` bigint(10) NOT NULL,
  `issuerid` bigint(10) NOT NULL,
  `issuerrole` bigint(10) NOT NULL,
  `datemet` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_badgmanuawar_bad_ix` (`badgeid`),
  KEY `mdl_badgmanuawar_rec_ix` (`recipientid`),
  KEY `mdl_badgmanuawar_iss_ix` (`issuerid`),
  KEY `mdl_badgmanuawar_iss2_ix` (`issuerrole`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block`
--

CREATE TABLE IF NOT EXISTS `mdl_block` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_bloc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='contains all installed blocks' AUTO_INCREMENT=41 ;

--
-- Dumping data for table `mdl_block`
--

INSERT INTO `mdl_block` (`id`, `name`, `cron`, `lastcron`, `visible`) VALUES
(1, 'activity_modules', 0, 0, 1),
(2, 'admin_bookmarks', 0, 0, 1),
(3, 'blog_menu', 0, 0, 1),
(4, 'blog_recent', 0, 0, 1),
(5, 'blog_tags', 0, 0, 1),
(6, 'calendar_month', 0, 0, 1),
(7, 'calendar_upcoming', 0, 0, 1),
(8, 'comments', 0, 0, 1),
(9, 'community', 0, 0, 1),
(10, 'completionstatus', 0, 0, 1),
(11, 'course_list', 0, 0, 1),
(12, 'course_overview', 0, 0, 1),
(13, 'course_summary', 0, 0, 1),
(14, 'feedback', 0, 0, 0),
(15, 'glossary_random', 0, 0, 1),
(16, 'html', 0, 0, 1),
(17, 'login', 0, 0, 1),
(18, 'mentees', 0, 0, 1),
(19, 'messages', 0, 0, 1),
(20, 'mnet_hosts', 0, 0, 1),
(21, 'myprofile', 0, 0, 1),
(22, 'navigation', 0, 0, 1),
(23, 'news_items', 0, 0, 1),
(24, 'online_users', 0, 0, 1),
(25, 'participants', 0, 0, 1),
(26, 'private_files', 0, 0, 1),
(27, 'quiz_results', 0, 0, 1),
(28, 'recent_activity', 0, 0, 1),
(29, 'rss_client', 300, 1390821669, 1),
(30, 'search_forums', 0, 0, 1),
(31, 'section_links', 0, 0, 1),
(32, 'selfcompletion', 0, 0, 1),
(33, 'settings', 0, 0, 1),
(34, 'site_main_menu', 0, 0, 1),
(35, 'social_activities', 0, 0, 1),
(36, 'tag_flickr', 0, 0, 1),
(37, 'tag_youtube', 0, 0, 1),
(38, 'tags', 0, 0, 1),
(39, 'tutorial', 0, 0, 1),
(40, 'badges', 0, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_community`
--

CREATE TABLE IF NOT EXISTS `mdl_block_community` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `coursename` varchar(255) NOT NULL DEFAULT '',
  `coursedescription` longtext,
  `courseurl` varchar(255) NOT NULL DEFAULT '',
  `imageurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Community block' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_block_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockname` varchar(40) NOT NULL DEFAULT '',
  `parentcontextid` bigint(10) NOT NULL,
  `showinsubcontexts` smallint(4) NOT NULL,
  `pagetypepattern` varchar(64) NOT NULL DEFAULT '',
  `subpagepattern` varchar(16) DEFAULT NULL,
  `defaultregion` varchar(16) NOT NULL DEFAULT '',
  `defaultweight` bigint(10) NOT NULL,
  `configdata` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_blocinst_parshopagsub_ix` (`parentcontextid`,`showinsubcontexts`,`pagetypepattern`,`subpagepattern`),
  KEY `mdl_blocinst_par_ix` (`parentcontextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores block instances. The type of block this is' AUTO_INCREMENT=18 ;

--
-- Dumping data for table `mdl_block_instances`
--

INSERT INTO `mdl_block_instances` (`id`, `blockname`, `parentcontextid`, `showinsubcontexts`, `pagetypepattern`, `subpagepattern`, `defaultregion`, `defaultweight`, `configdata`) VALUES
(1, 'site_main_menu', 2, 0, 'site-index', NULL, 'side-pre', 0, ''),
(2, 'course_summary', 2, 0, 'site-index', NULL, 'side-post', 0, ''),
(3, 'calendar_month', 2, 0, 'site-index', NULL, 'side-post', 1, ''),
(4, 'navigation', 1, 1, '*', NULL, 'side-pre', 0, ''),
(5, 'settings', 1, 1, '*', NULL, 'side-pre', 1, ''),
(6, 'admin_bookmarks', 1, 0, 'admin-*', NULL, 'side-pre', 0, ''),
(7, 'private_files', 1, 0, 'my-index', '2', 'side-post', 0, ''),
(8, 'online_users', 1, 0, 'my-index', '2', 'side-post', 1, ''),
(9, 'course_overview', 1, 0, 'my-index', '2', 'content', 0, ''),
(10, 'search_forums', 15, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(11, 'news_items', 15, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(12, 'calendar_upcoming', 15, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(13, 'recent_activity', 15, 0, 'course-view-*', NULL, 'side-post', 3, ''),
(14, 'search_forums', 25, 0, 'course-view-*', NULL, 'side-post', 0, ''),
(15, 'news_items', 25, 0, 'course-view-*', NULL, 'side-post', 1, ''),
(16, 'calendar_upcoming', 25, 0, 'course-view-*', NULL, 'side-post', 2, ''),
(17, 'recent_activity', 25, 0, 'course-view-*', NULL, 'side-post', 3, '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_positions`
--

CREATE TABLE IF NOT EXISTS `mdl_block_positions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `blockinstanceid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `pagetype` varchar(64) NOT NULL DEFAULT '',
  `subpage` varchar(16) NOT NULL DEFAULT '',
  `visible` smallint(4) NOT NULL,
  `region` varchar(16) NOT NULL DEFAULT '',
  `weight` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_blocposi_bloconpagsub_uix` (`blockinstanceid`,`contextid`,`pagetype`,`subpage`),
  KEY `mdl_blocposi_blo_ix` (`blockinstanceid`),
  KEY `mdl_blocposi_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the position of a sticky block_instance on a another ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_block_rss_client`
--

CREATE TABLE IF NOT EXISTS `mdl_block_rss_client` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` longtext NOT NULL,
  `preferredtitle` varchar(64) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `shared` tinyint(2) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Remote news feed information. Contains the news feed id, the' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_association`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_association` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `blogid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_blogasso_con_ix` (`contextid`),
  KEY `mdl_blogasso_blo_ix` (`blogid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Associations of blog entries with courses and module instanc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_blog_external`
--

CREATE TABLE IF NOT EXISTS `mdl_blog_external` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `url` longtext NOT NULL,
  `filtertags` varchar(255) DEFAULT NULL,
  `failedlastsync` tinyint(1) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  `timefetched` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_blogexte_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='External blog links used for RSS copying of blog entries to ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book`
--

CREATE TABLE IF NOT EXISTS `mdl_book` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `numbering` smallint(4) NOT NULL DEFAULT '0',
  `customtitles` tinyint(2) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_book_chapters`
--

CREATE TABLE IF NOT EXISTS `mdl_book_chapters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `bookid` bigint(10) NOT NULL DEFAULT '0',
  `pagenum` bigint(10) NOT NULL DEFAULT '0',
  `subchapter` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext NOT NULL,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `hidden` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `importsrc` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines book_chapters' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_filters`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_filters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `version` bigint(10) NOT NULL DEFAULT '0',
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `rawtext` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachfilt_filmd5_ix` (`filter`,`md5key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping information about cached data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_flags`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_flags` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `flagtype` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  `expiry` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_cachflag_fla_ix` (`flagtype`),
  KEY `mdl_cachflag_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Cache of time-sensitive flags' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_cache_flags`
--

INSERT INTO `mdl_cache_flags` (`id`, `flagtype`, `name`, `timemodified`, `value`, `expiry`) VALUES
(1, 'userpreferenceschanged', '2', 1391172315, '1', 1391179515),
(2, 'accesslib/dirtycontexts', '/1/3/15', 1390572661, '1', 1390579861),
(3, 'userpreferenceschanged', '3', 1390571158, '1', 1390578358),
(4, 'userpreferenceschanged', '4', 1391168893, '1', 1391176093),
(5, 'accesslib/dirtycontexts', '/1/24', 1391086877, '1', 1391094077),
(6, 'accesslib/dirtycontexts', '/1/24/25', 1391086974, '1', 1391094174),
(7, 'accesslib/dirtycontexts', '/1', 1390990751, '1', 1390997951),
(8, 'userpreferenceschanged', '5', 1391086669, '1', 1391093869),
(9, 'userpreferenceschanged', '6', 1391086727, '1', 1391093927);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cache_text`
--

CREATE TABLE IF NOT EXISTS `mdl_cache_text` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `md5key` varchar(32) NOT NULL DEFAULT '',
  `formattedtext` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_cachtext_md5_ix` (`md5key`),
  KEY `mdl_cachtext_tim_ix` (`timemodified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='For storing temporary copies of processed texts' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_cache_text`
--

INSERT INTO `mdl_cache_text` (`id`, `md5key`, `formattedtext`, `timemodified`) VALUES
(1, '8279c8862959bab81f32cc027e7d67bc', '<div class="no-overflow"><p>Summary desummary</p></div>', 1391179090),
(2, '7088784e04c075cc90016a72cf938cb2', '<p>When players are enabled in these settings, files can be embedded using the media filter (if enabled) or using a File or URL resources with the Embed option. When not enabled, these formats are not embedded and users can manually download or follow links to these resources.</p>\n\n<p>Where two players support the same format, enabling both increases compatibility across different devices such as mobile phones. It is possible to increase compatibility further by providing multiple files in different formats for a single audio or video clip.</p>\n', 1391176492);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `captype` varchar(50) NOT NULL DEFAULT '',
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `riskbitmask` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_capa_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines all capabilities' AUTO_INCREMENT=514 ;

--
-- Dumping data for table `mdl_capabilities`
--

INSERT INTO `mdl_capabilities` (`id`, `name`, `captype`, `contextlevel`, `component`, `riskbitmask`) VALUES
(1, 'moodle/site:config', 'write', 10, 'moodle', 62),
(2, 'moodle/site:readallmessages', 'read', 10, 'moodle', 8),
(3, 'moodle/site:sendmessage', 'write', 10, 'moodle', 16),
(4, 'moodle/site:approvecourse', 'write', 10, 'moodle', 4),
(5, 'moodle/backup:backupcourse', 'write', 50, 'moodle', 28),
(6, 'moodle/backup:backupsection', 'write', 50, 'moodle', 28),
(7, 'moodle/backup:backupactivity', 'write', 70, 'moodle', 28),
(8, 'moodle/backup:backuptargethub', 'write', 50, 'moodle', 28),
(9, 'moodle/backup:backuptargetimport', 'write', 50, 'moodle', 28),
(10, 'moodle/backup:downloadfile', 'write', 50, 'moodle', 28),
(11, 'moodle/backup:configure', 'write', 50, 'moodle', 28),
(12, 'moodle/backup:userinfo', 'read', 50, 'moodle', 8),
(13, 'moodle/backup:anonymise', 'read', 50, 'moodle', 8),
(14, 'moodle/restore:restorecourse', 'write', 50, 'moodle', 28),
(15, 'moodle/restore:restoresection', 'write', 50, 'moodle', 28),
(16, 'moodle/restore:restoreactivity', 'write', 50, 'moodle', 28),
(17, 'moodle/restore:viewautomatedfilearea', 'write', 50, 'moodle', 28),
(18, 'moodle/restore:restoretargethub', 'write', 50, 'moodle', 28),
(19, 'moodle/restore:restoretargetimport', 'write', 50, 'moodle', 28),
(20, 'moodle/restore:uploadfile', 'write', 50, 'moodle', 28),
(21, 'moodle/restore:configure', 'write', 50, 'moodle', 28),
(22, 'moodle/restore:rolldates', 'write', 50, 'moodle', 0),
(23, 'moodle/restore:userinfo', 'write', 50, 'moodle', 30),
(24, 'moodle/restore:createuser', 'write', 10, 'moodle', 24),
(25, 'moodle/site:manageblocks', 'write', 80, 'moodle', 20),
(26, 'moodle/site:accessallgroups', 'read', 50, 'moodle', 0),
(27, 'moodle/site:viewfullnames', 'read', 50, 'moodle', 0),
(28, 'moodle/site:viewuseridentity', 'read', 50, 'moodle', 0),
(29, 'moodle/site:viewreports', 'read', 50, 'moodle', 8),
(30, 'moodle/site:trustcontent', 'write', 50, 'moodle', 4),
(31, 'moodle/site:uploadusers', 'write', 10, 'moodle', 24),
(32, 'moodle/filter:manage', 'write', 50, 'moodle', 0),
(33, 'moodle/user:create', 'write', 10, 'moodle', 24),
(34, 'moodle/user:delete', 'write', 10, 'moodle', 8),
(35, 'moodle/user:update', 'write', 10, 'moodle', 24),
(36, 'moodle/user:viewdetails', 'read', 50, 'moodle', 0),
(37, 'moodle/user:viewalldetails', 'read', 30, 'moodle', 8),
(38, 'moodle/user:viewhiddendetails', 'read', 50, 'moodle', 8),
(39, 'moodle/user:loginas', 'write', 50, 'moodle', 30),
(40, 'moodle/user:managesyspages', 'write', 10, 'moodle', 0),
(41, 'moodle/user:manageblocks', 'write', 30, 'moodle', 0),
(42, 'moodle/user:manageownblocks', 'write', 10, 'moodle', 0),
(43, 'moodle/user:manageownfiles', 'write', 10, 'moodle', 0),
(44, 'moodle/my:configsyspages', 'write', 10, 'moodle', 0),
(45, 'moodle/role:assign', 'write', 50, 'moodle', 28),
(46, 'moodle/role:review', 'read', 50, 'moodle', 8),
(47, 'moodle/role:override', 'write', 50, 'moodle', 28),
(48, 'moodle/role:safeoverride', 'write', 50, 'moodle', 16),
(49, 'moodle/role:manage', 'write', 10, 'moodle', 28),
(50, 'moodle/role:switchroles', 'read', 50, 'moodle', 12),
(51, 'moodle/category:manage', 'write', 40, 'moodle', 4),
(52, 'moodle/category:viewhiddencategories', 'read', 40, 'moodle', 0),
(53, 'moodle/cohort:manage', 'write', 40, 'moodle', 0),
(54, 'moodle/cohort:assign', 'write', 40, 'moodle', 0),
(55, 'moodle/cohort:view', 'read', 50, 'moodle', 0),
(56, 'moodle/course:create', 'write', 40, 'moodle', 4),
(57, 'moodle/course:request', 'write', 10, 'moodle', 0),
(58, 'moodle/course:delete', 'write', 50, 'moodle', 32),
(59, 'moodle/course:update', 'write', 50, 'moodle', 4),
(60, 'moodle/course:view', 'read', 50, 'moodle', 0),
(61, 'moodle/course:enrolreview', 'read', 50, 'moodle', 8),
(62, 'moodle/course:enrolconfig', 'write', 50, 'moodle', 8),
(63, 'moodle/course:bulkmessaging', 'write', 50, 'moodle', 16),
(64, 'moodle/course:viewhiddenuserfields', 'read', 50, 'moodle', 8),
(65, 'moodle/course:viewhiddencourses', 'read', 50, 'moodle', 0),
(66, 'moodle/course:visibility', 'write', 50, 'moodle', 0),
(67, 'moodle/course:managefiles', 'write', 50, 'moodle', 4),
(68, 'moodle/course:ignorefilesizelimits', 'write', 50, 'moodle', 0),
(69, 'moodle/course:manageactivities', 'write', 70, 'moodle', 4),
(70, 'moodle/course:activityvisibility', 'write', 70, 'moodle', 0),
(71, 'moodle/course:viewhiddenactivities', 'write', 70, 'moodle', 0),
(72, 'moodle/course:viewparticipants', 'read', 50, 'moodle', 0),
(73, 'moodle/course:changefullname', 'write', 50, 'moodle', 4),
(74, 'moodle/course:changeshortname', 'write', 50, 'moodle', 4),
(75, 'moodle/course:changeidnumber', 'write', 50, 'moodle', 4),
(76, 'moodle/course:changecategory', 'write', 50, 'moodle', 4),
(77, 'moodle/course:changesummary', 'write', 50, 'moodle', 4),
(78, 'moodle/site:viewparticipants', 'read', 10, 'moodle', 0),
(79, 'moodle/course:viewscales', 'read', 50, 'moodle', 0),
(80, 'moodle/course:managescales', 'write', 50, 'moodle', 0),
(81, 'moodle/course:managegroups', 'write', 50, 'moodle', 0),
(82, 'moodle/course:reset', 'write', 50, 'moodle', 32),
(83, 'moodle/blog:view', 'read', 10, 'moodle', 0),
(84, 'moodle/blog:search', 'read', 10, 'moodle', 0),
(85, 'moodle/blog:viewdrafts', 'read', 10, 'moodle', 8),
(86, 'moodle/blog:create', 'write', 10, 'moodle', 16),
(87, 'moodle/blog:manageentries', 'write', 10, 'moodle', 16),
(88, 'moodle/blog:manageexternal', 'write', 10, 'moodle', 16),
(89, 'moodle/blog:associatecourse', 'write', 50, 'moodle', 0),
(90, 'moodle/blog:associatemodule', 'write', 70, 'moodle', 0),
(91, 'moodle/calendar:manageownentries', 'write', 50, 'moodle', 16),
(92, 'moodle/calendar:managegroupentries', 'write', 50, 'moodle', 16),
(93, 'moodle/calendar:manageentries', 'write', 50, 'moodle', 16),
(94, 'moodle/user:editprofile', 'write', 30, 'moodle', 24),
(95, 'moodle/user:editownprofile', 'write', 10, 'moodle', 16),
(96, 'moodle/user:changeownpassword', 'write', 10, 'moodle', 0),
(97, 'moodle/user:readuserposts', 'read', 30, 'moodle', 0),
(98, 'moodle/user:readuserblogs', 'read', 30, 'moodle', 0),
(99, 'moodle/user:viewuseractivitiesreport', 'read', 30, 'moodle', 8),
(100, 'moodle/user:editmessageprofile', 'write', 30, 'moodle', 16),
(101, 'moodle/user:editownmessageprofile', 'write', 10, 'moodle', 0),
(102, 'moodle/question:managecategory', 'write', 50, 'moodle', 20),
(103, 'moodle/question:add', 'write', 50, 'moodle', 20),
(104, 'moodle/question:editmine', 'write', 50, 'moodle', 20),
(105, 'moodle/question:editall', 'write', 50, 'moodle', 20),
(106, 'moodle/question:viewmine', 'read', 50, 'moodle', 0),
(107, 'moodle/question:viewall', 'read', 50, 'moodle', 0),
(108, 'moodle/question:usemine', 'read', 50, 'moodle', 0),
(109, 'moodle/question:useall', 'read', 50, 'moodle', 0),
(110, 'moodle/question:movemine', 'write', 50, 'moodle', 0),
(111, 'moodle/question:moveall', 'write', 50, 'moodle', 0),
(112, 'moodle/question:config', 'write', 10, 'moodle', 2),
(113, 'moodle/question:flag', 'write', 50, 'moodle', 0),
(114, 'moodle/site:doclinks', 'read', 10, 'moodle', 0),
(115, 'moodle/course:sectionvisibility', 'write', 50, 'moodle', 0),
(116, 'moodle/course:useremail', 'write', 50, 'moodle', 0),
(117, 'moodle/course:viewhiddensections', 'write', 50, 'moodle', 0),
(118, 'moodle/course:setcurrentsection', 'write', 50, 'moodle', 0),
(119, 'moodle/site:mnetlogintoremote', 'read', 10, 'moodle', 0),
(120, 'moodle/grade:viewall', 'read', 50, 'moodle', 8),
(121, 'moodle/grade:view', 'read', 50, 'moodle', 0),
(122, 'moodle/grade:viewhidden', 'read', 50, 'moodle', 8),
(123, 'moodle/grade:import', 'write', 50, 'moodle', 12),
(124, 'moodle/grade:export', 'read', 50, 'moodle', 8),
(125, 'moodle/grade:manage', 'write', 50, 'moodle', 12),
(126, 'moodle/grade:edit', 'write', 50, 'moodle', 12),
(127, 'moodle/grade:managegradingforms', 'write', 50, 'moodle', 12),
(128, 'moodle/grade:sharegradingforms', 'write', 10, 'moodle', 4),
(129, 'moodle/grade:managesharedforms', 'write', 10, 'moodle', 4),
(130, 'moodle/grade:manageoutcomes', 'write', 50, 'moodle', 0),
(131, 'moodle/grade:manageletters', 'write', 50, 'moodle', 0),
(132, 'moodle/grade:hide', 'write', 50, 'moodle', 0),
(133, 'moodle/grade:lock', 'write', 50, 'moodle', 0),
(134, 'moodle/grade:unlock', 'write', 50, 'moodle', 0),
(135, 'moodle/my:manageblocks', 'write', 10, 'moodle', 0),
(136, 'moodle/notes:view', 'read', 50, 'moodle', 0),
(137, 'moodle/notes:manage', 'write', 50, 'moodle', 16),
(138, 'moodle/tag:manage', 'write', 10, 'moodle', 16),
(139, 'moodle/tag:create', 'write', 10, 'moodle', 16),
(140, 'moodle/tag:edit', 'write', 10, 'moodle', 16),
(141, 'moodle/tag:editblocks', 'write', 10, 'moodle', 0),
(142, 'moodle/block:view', 'read', 80, 'moodle', 0),
(143, 'moodle/block:edit', 'write', 80, 'moodle', 20),
(144, 'moodle/portfolio:export', 'read', 10, 'moodle', 0),
(145, 'moodle/comment:view', 'read', 50, 'moodle', 0),
(146, 'moodle/comment:post', 'write', 50, 'moodle', 24),
(147, 'moodle/comment:delete', 'write', 50, 'moodle', 32),
(148, 'moodle/webservice:createtoken', 'write', 10, 'moodle', 62),
(149, 'moodle/webservice:createmobiletoken', 'write', 10, 'moodle', 24),
(150, 'moodle/rating:view', 'read', 50, 'moodle', 0),
(151, 'moodle/rating:viewany', 'read', 50, 'moodle', 8),
(152, 'moodle/rating:viewall', 'read', 50, 'moodle', 8),
(153, 'moodle/rating:rate', 'write', 50, 'moodle', 0),
(154, 'moodle/course:publish', 'write', 10, 'moodle', 24),
(155, 'moodle/course:markcomplete', 'write', 50, 'moodle', 0),
(156, 'moodle/community:add', 'write', 10, 'moodle', 0),
(157, 'moodle/community:download', 'write', 10, 'moodle', 0),
(158, 'mod/assign:view', 'read', 70, 'mod_assign', 0),
(159, 'mod/assign:submit', 'write', 70, 'mod_assign', 0),
(160, 'mod/assign:grade', 'write', 70, 'mod_assign', 4),
(161, 'mod/assign:exportownsubmission', 'read', 70, 'mod_assign', 0),
(162, 'mod/assign:addinstance', 'write', 50, 'mod_assign', 4),
(163, 'mod/assignment:view', 'read', 70, 'mod_assignment', 0),
(164, 'mod/assignment:addinstance', 'write', 50, 'mod_assignment', 4),
(165, 'mod/assignment:submit', 'write', 70, 'mod_assignment', 0),
(166, 'mod/assignment:grade', 'write', 70, 'mod_assignment', 4),
(167, 'mod/assignment:exportownsubmission', 'read', 70, 'mod_assignment', 0),
(168, 'mod/book:addinstance', 'write', 50, 'mod_book', 4),
(169, 'mod/book:read', 'read', 70, 'mod_book', 0),
(170, 'mod/book:viewhiddenchapters', 'read', 70, 'mod_book', 0),
(171, 'mod/book:edit', 'write', 70, 'mod_book', 4),
(172, 'mod/certificate:addinstance', 'write', 50, 'mod_certificate', 4),
(173, 'mod/certificate:view', 'read', 70, 'mod_certificate', 0),
(174, 'mod/certificate:manage', 'read', 70, 'mod_certificate', 0),
(175, 'mod/certificate:printteacher', 'read', 70, 'mod_certificate', 0),
(176, 'mod/chat:addinstance', 'write', 50, 'mod_chat', 4),
(177, 'mod/chat:chat', 'write', 70, 'mod_chat', 16),
(178, 'mod/chat:readlog', 'read', 70, 'mod_chat', 0),
(179, 'mod/chat:deletelog', 'write', 70, 'mod_chat', 0),
(180, 'mod/chat:exportparticipatedsession', 'read', 70, 'mod_chat', 8),
(181, 'mod/chat:exportsession', 'read', 70, 'mod_chat', 8),
(182, 'mod/choice:addinstance', 'write', 50, 'mod_choice', 4),
(183, 'mod/choice:choose', 'write', 70, 'mod_choice', 0),
(184, 'mod/choice:readresponses', 'read', 70, 'mod_choice', 0),
(185, 'mod/choice:deleteresponses', 'write', 70, 'mod_choice', 0),
(186, 'mod/choice:downloadresponses', 'read', 70, 'mod_choice', 0),
(187, 'mod/data:addinstance', 'write', 50, 'mod_data', 4),
(188, 'mod/data:viewentry', 'read', 70, 'mod_data', 0),
(189, 'mod/data:writeentry', 'write', 70, 'mod_data', 16),
(190, 'mod/data:comment', 'write', 70, 'mod_data', 16),
(191, 'mod/data:rate', 'write', 70, 'mod_data', 0),
(192, 'mod/data:viewrating', 'read', 70, 'mod_data', 0),
(193, 'mod/data:viewanyrating', 'read', 70, 'mod_data', 8),
(194, 'mod/data:viewallratings', 'read', 70, 'mod_data', 8),
(195, 'mod/data:approve', 'write', 70, 'mod_data', 16),
(196, 'mod/data:manageentries', 'write', 70, 'mod_data', 16),
(197, 'mod/data:managecomments', 'write', 70, 'mod_data', 16),
(198, 'mod/data:managetemplates', 'write', 70, 'mod_data', 20),
(199, 'mod/data:viewalluserpresets', 'read', 70, 'mod_data', 0),
(200, 'mod/data:manageuserpresets', 'write', 70, 'mod_data', 20),
(201, 'mod/data:exportentry', 'read', 70, 'mod_data', 8),
(202, 'mod/data:exportownentry', 'read', 70, 'mod_data', 0),
(203, 'mod/data:exportallentries', 'read', 70, 'mod_data', 8),
(204, 'mod/feedback:addinstance', 'write', 50, 'mod_feedback', 4),
(205, 'mod/feedback:view', 'read', 70, 'mod_feedback', 0),
(206, 'mod/feedback:complete', 'write', 70, 'mod_feedback', 16),
(207, 'mod/feedback:viewanalysepage', 'read', 70, 'mod_feedback', 8),
(208, 'mod/feedback:deletesubmissions', 'write', 70, 'mod_feedback', 0),
(209, 'mod/feedback:mapcourse', 'write', 70, 'mod_feedback', 0),
(210, 'mod/feedback:edititems', 'write', 70, 'mod_feedback', 20),
(211, 'mod/feedback:createprivatetemplate', 'write', 70, 'mod_feedback', 16),
(212, 'mod/feedback:createpublictemplate', 'write', 70, 'mod_feedback', 16),
(213, 'mod/feedback:deletetemplate', 'write', 70, 'mod_feedback', 0),
(214, 'mod/feedback:viewreports', 'read', 70, 'mod_feedback', 8),
(215, 'mod/feedback:receivemail', 'read', 70, 'mod_feedback', 8),
(216, 'mod/folder:addinstance', 'write', 50, 'mod_folder', 4),
(217, 'mod/folder:view', 'read', 70, 'mod_folder', 0),
(218, 'mod/folder:managefiles', 'write', 70, 'mod_folder', 16),
(219, 'mod/forum:addinstance', 'write', 50, 'mod_forum', 4),
(220, 'mod/forum:viewdiscussion', 'read', 70, 'mod_forum', 0),
(221, 'mod/forum:viewhiddentimedposts', 'read', 70, 'mod_forum', 0),
(222, 'mod/forum:startdiscussion', 'write', 70, 'mod_forum', 16),
(223, 'mod/forum:replypost', 'write', 70, 'mod_forum', 16),
(224, 'mod/forum:addnews', 'write', 70, 'mod_forum', 16),
(225, 'mod/forum:replynews', 'write', 70, 'mod_forum', 16),
(226, 'mod/forum:viewrating', 'read', 70, 'mod_forum', 0),
(227, 'mod/forum:viewanyrating', 'read', 70, 'mod_forum', 8),
(228, 'mod/forum:viewallratings', 'read', 70, 'mod_forum', 8),
(229, 'mod/forum:rate', 'write', 70, 'mod_forum', 0),
(230, 'mod/forum:createattachment', 'write', 70, 'mod_forum', 16),
(231, 'mod/forum:deleteownpost', 'read', 70, 'mod_forum', 0),
(232, 'mod/forum:deleteanypost', 'read', 70, 'mod_forum', 0),
(233, 'mod/forum:splitdiscussions', 'read', 70, 'mod_forum', 0),
(234, 'mod/forum:movediscussions', 'read', 70, 'mod_forum', 0),
(235, 'mod/forum:editanypost', 'write', 70, 'mod_forum', 16),
(236, 'mod/forum:viewqandawithoutposting', 'read', 70, 'mod_forum', 0),
(237, 'mod/forum:viewsubscribers', 'read', 70, 'mod_forum', 0),
(238, 'mod/forum:managesubscriptions', 'read', 70, 'mod_forum', 16),
(239, 'mod/forum:postwithoutthrottling', 'write', 70, 'mod_forum', 16),
(240, 'mod/forum:exportdiscussion', 'read', 70, 'mod_forum', 8),
(241, 'mod/forum:exportpost', 'read', 70, 'mod_forum', 8),
(242, 'mod/forum:exportownpost', 'read', 70, 'mod_forum', 8),
(243, 'mod/forum:addquestion', 'write', 70, 'mod_forum', 16),
(244, 'mod/forum:allowforcesubscribe', 'read', 70, 'mod_forum', 0),
(245, 'mod/glossary:addinstance', 'write', 50, 'mod_glossary', 4),
(246, 'mod/glossary:view', 'read', 70, 'mod_glossary', 0),
(247, 'mod/glossary:write', 'write', 70, 'mod_glossary', 16),
(248, 'mod/glossary:manageentries', 'write', 70, 'mod_glossary', 16),
(249, 'mod/glossary:managecategories', 'write', 70, 'mod_glossary', 16),
(250, 'mod/glossary:comment', 'write', 70, 'mod_glossary', 16),
(251, 'mod/glossary:managecomments', 'write', 70, 'mod_glossary', 16),
(252, 'mod/glossary:import', 'write', 70, 'mod_glossary', 16),
(253, 'mod/glossary:export', 'read', 70, 'mod_glossary', 0),
(254, 'mod/glossary:approve', 'write', 70, 'mod_glossary', 16),
(255, 'mod/glossary:rate', 'write', 70, 'mod_glossary', 0),
(256, 'mod/glossary:viewrating', 'read', 70, 'mod_glossary', 0),
(257, 'mod/glossary:viewanyrating', 'read', 70, 'mod_glossary', 8),
(258, 'mod/glossary:viewallratings', 'read', 70, 'mod_glossary', 8),
(259, 'mod/glossary:exportentry', 'read', 70, 'mod_glossary', 8),
(260, 'mod/glossary:exportownentry', 'read', 70, 'mod_glossary', 0),
(261, 'mod/imscp:view', 'read', 70, 'mod_imscp', 0),
(262, 'mod/imscp:addinstance', 'write', 50, 'mod_imscp', 4),
(263, 'mod/label:addinstance', 'write', 50, 'mod_label', 4),
(264, 'mod/lesson:addinstance', 'write', 50, 'mod_lesson', 4),
(265, 'mod/lesson:edit', 'write', 70, 'mod_lesson', 4),
(266, 'mod/lesson:manage', 'write', 70, 'mod_lesson', 0),
(267, 'mod/lti:view', 'read', 70, 'mod_lti', 0),
(268, 'mod/lti:addinstance', 'write', 50, 'mod_lti', 4),
(269, 'mod/lti:grade', 'write', 70, 'mod_lti', 8),
(270, 'mod/lti:manage', 'write', 70, 'mod_lti', 8),
(271, 'mod/lti:addcoursetool', 'write', 50, 'mod_lti', 0),
(272, 'mod/lti:requesttooladd', 'write', 50, 'mod_lti', 0),
(273, 'mod/page:view', 'read', 70, 'mod_page', 0),
(274, 'mod/page:addinstance', 'write', 50, 'mod_page', 4),
(275, 'mod/quiz:view', 'read', 70, 'mod_quiz', 0),
(276, 'mod/quiz:addinstance', 'write', 50, 'mod_quiz', 4),
(277, 'mod/quiz:attempt', 'write', 70, 'mod_quiz', 16),
(278, 'mod/quiz:reviewmyattempts', 'read', 70, 'mod_quiz', 0),
(279, 'mod/quiz:manage', 'write', 70, 'mod_quiz', 16),
(280, 'mod/quiz:manageoverrides', 'write', 70, 'mod_quiz', 0),
(281, 'mod/quiz:preview', 'write', 70, 'mod_quiz', 0),
(282, 'mod/quiz:grade', 'write', 70, 'mod_quiz', 16),
(283, 'mod/quiz:regrade', 'write', 70, 'mod_quiz', 16),
(284, 'mod/quiz:viewreports', 'read', 70, 'mod_quiz', 8),
(285, 'mod/quiz:deleteattempts', 'write', 70, 'mod_quiz', 32),
(286, 'mod/quiz:ignoretimelimits', 'read', 70, 'mod_quiz', 0),
(287, 'mod/quiz:emailconfirmsubmission', 'read', 70, 'mod_quiz', 0),
(288, 'mod/quiz:emailnotifysubmission', 'read', 70, 'mod_quiz', 0),
(289, 'mod/quiz:emailwarnoverdue', 'read', 70, 'mod_quiz', 0),
(290, 'mod/resource:view', 'read', 70, 'mod_resource', 0),
(291, 'mod/resource:addinstance', 'write', 50, 'mod_resource', 4),
(292, 'mod/scorm:addinstance', 'write', 50, 'mod_scorm', 4),
(293, 'mod/scorm:viewreport', 'read', 70, 'mod_scorm', 0),
(294, 'mod/scorm:skipview', 'write', 70, 'mod_scorm', 0),
(295, 'mod/scorm:savetrack', 'write', 70, 'mod_scorm', 0),
(296, 'mod/scorm:viewscores', 'read', 70, 'mod_scorm', 0),
(297, 'mod/scorm:deleteresponses', 'read', 70, 'mod_scorm', 0),
(298, 'mod/scorm:deleteownresponses', 'write', 70, 'mod_scorm', 0),
(299, 'mod/survey:addinstance', 'write', 50, 'mod_survey', 4),
(300, 'mod/survey:participate', 'read', 70, 'mod_survey', 0),
(301, 'mod/survey:readresponses', 'read', 70, 'mod_survey', 0),
(302, 'mod/survey:download', 'read', 70, 'mod_survey', 0),
(303, 'mod/url:view', 'read', 70, 'mod_url', 0),
(304, 'mod/url:addinstance', 'write', 50, 'mod_url', 4),
(305, 'mod/wiki:addinstance', 'write', 50, 'mod_wiki', 4),
(306, 'mod/wiki:viewpage', 'read', 70, 'mod_wiki', 0),
(307, 'mod/wiki:editpage', 'write', 70, 'mod_wiki', 16),
(308, 'mod/wiki:createpage', 'write', 70, 'mod_wiki', 16),
(309, 'mod/wiki:viewcomment', 'read', 70, 'mod_wiki', 0),
(310, 'mod/wiki:editcomment', 'write', 70, 'mod_wiki', 16),
(311, 'mod/wiki:managecomment', 'write', 70, 'mod_wiki', 0),
(312, 'mod/wiki:managefiles', 'write', 70, 'mod_wiki', 0),
(313, 'mod/wiki:overridelock', 'write', 70, 'mod_wiki', 0),
(314, 'mod/wiki:managewiki', 'write', 70, 'mod_wiki', 0),
(315, 'mod/workshop:view', 'read', 70, 'mod_workshop', 0),
(316, 'mod/workshop:addinstance', 'write', 50, 'mod_workshop', 4),
(317, 'mod/workshop:switchphase', 'write', 70, 'mod_workshop', 0),
(318, 'mod/workshop:editdimensions', 'write', 70, 'mod_workshop', 4),
(319, 'mod/workshop:submit', 'write', 70, 'mod_workshop', 0),
(320, 'mod/workshop:peerassess', 'write', 70, 'mod_workshop', 0),
(321, 'mod/workshop:manageexamples', 'write', 70, 'mod_workshop', 0),
(322, 'mod/workshop:allocate', 'write', 70, 'mod_workshop', 0),
(323, 'mod/workshop:publishsubmissions', 'write', 70, 'mod_workshop', 0),
(324, 'mod/workshop:viewauthornames', 'read', 70, 'mod_workshop', 0),
(325, 'mod/workshop:viewreviewernames', 'read', 70, 'mod_workshop', 0),
(326, 'mod/workshop:viewallsubmissions', 'read', 70, 'mod_workshop', 0),
(327, 'mod/workshop:viewpublishedsubmissions', 'read', 70, 'mod_workshop', 0),
(328, 'mod/workshop:viewauthorpublished', 'read', 70, 'mod_workshop', 0),
(329, 'mod/workshop:viewallassessments', 'read', 70, 'mod_workshop', 0),
(330, 'mod/workshop:overridegrades', 'write', 70, 'mod_workshop', 0),
(331, 'mod/workshop:ignoredeadlines', 'write', 70, 'mod_workshop', 0),
(338, 'enrol/category:synchronised', 'write', 10, 'enrol_category', 0),
(339, 'enrol/cohort:config', 'write', 50, 'enrol_cohort', 0),
(340, 'enrol/cohort:unenrol', 'write', 50, 'enrol_cohort', 0),
(341, 'enrol/database:unenrol', 'write', 50, 'enrol_database', 0),
(342, 'enrol/guest:config', 'write', 50, 'enrol_guest', 0),
(343, 'enrol/ldap:manage', 'write', 50, 'enrol_ldap', 0),
(344, 'enrol/manual:config', 'write', 50, 'enrol_manual', 0),
(345, 'enrol/manual:enrol', 'write', 50, 'enrol_manual', 0),
(346, 'enrol/manual:manage', 'write', 50, 'enrol_manual', 0),
(347, 'enrol/manual:unenrol', 'write', 50, 'enrol_manual', 0),
(348, 'enrol/manual:unenrolself', 'write', 50, 'enrol_manual', 0),
(349, 'enrol/meta:config', 'write', 50, 'enrol_meta', 0),
(350, 'enrol/meta:selectaslinked', 'read', 50, 'enrol_meta', 0),
(351, 'enrol/meta:unenrol', 'write', 50, 'enrol_meta', 0),
(352, 'enrol/paypal:config', 'write', 50, 'enrol_paypal', 0),
(353, 'enrol/paypal:manage', 'write', 50, 'enrol_paypal', 0),
(354, 'enrol/paypal:unenrol', 'write', 50, 'enrol_paypal', 0),
(355, 'enrol/paypal:unenrolself', 'write', 50, 'enrol_paypal', 0),
(356, 'enrol/self:config', 'write', 50, 'enrol_self', 0),
(357, 'enrol/self:manage', 'write', 50, 'enrol_self', 0),
(358, 'enrol/self:unenrolself', 'write', 50, 'enrol_self', 0),
(359, 'enrol/self:unenrol', 'write', 50, 'enrol_self', 0),
(360, 'block/online_users:viewlist', 'read', 80, 'block_online_users', 0),
(361, 'block/rss_client:manageownfeeds', 'write', 80, 'block_rss_client', 0),
(362, 'block/rss_client:manageanyfeeds', 'write', 80, 'block_rss_client', 16),
(363, 'block/tutorial:edit', 'write', 80, 'block_tutorial', 0),
(364, 'report/completion:view', 'read', 50, 'report_completion', 8),
(365, 'report/courseoverview:view', 'read', 10, 'report_courseoverview', 8),
(366, 'report/log:view', 'read', 50, 'report_log', 8),
(367, 'report/log:viewtoday', 'read', 50, 'report_log', 8),
(368, 'report/loglive:view', 'read', 50, 'report_loglive', 8),
(369, 'report/outline:view', 'read', 50, 'report_outline', 8),
(370, 'report/participation:view', 'read', 50, 'report_participation', 8),
(371, 'report/progress:view', 'read', 50, 'report_progress', 8),
(372, 'report/questioninstances:view', 'read', 10, 'report_questioninstances', 0),
(373, 'report/security:view', 'read', 10, 'report_security', 2),
(374, 'report/stats:view', 'read', 50, 'report_stats', 8),
(375, 'gradeexport/ods:view', 'read', 50, 'gradeexport_ods', 8),
(376, 'gradeexport/ods:publish', 'read', 50, 'gradeexport_ods', 8),
(377, 'gradeexport/txt:view', 'read', 50, 'gradeexport_txt', 8),
(378, 'gradeexport/txt:publish', 'read', 50, 'gradeexport_txt', 8),
(379, 'gradeexport/xls:view', 'read', 50, 'gradeexport_xls', 8),
(380, 'gradeexport/xls:publish', 'read', 50, 'gradeexport_xls', 8),
(381, 'gradeexport/xml:view', 'read', 50, 'gradeexport_xml', 8),
(382, 'gradeexport/xml:publish', 'read', 50, 'gradeexport_xml', 8),
(383, 'gradeimport/csv:view', 'write', 50, 'gradeimport_csv', 0),
(384, 'gradeimport/xml:view', 'write', 50, 'gradeimport_xml', 0),
(385, 'gradeimport/xml:publish', 'write', 50, 'gradeimport_xml', 0),
(386, 'gradereport/grader:view', 'read', 50, 'gradereport_grader', 8),
(387, 'gradereport/outcomes:view', 'read', 50, 'gradereport_outcomes', 8),
(388, 'gradereport/overview:view', 'read', 50, 'gradereport_overview', 8),
(389, 'gradereport/user:view', 'read', 50, 'gradereport_user', 8),
(390, 'webservice/amf:use', 'read', 50, 'webservice_amf', 62),
(391, 'webservice/rest:use', 'read', 50, 'webservice_rest', 62),
(392, 'webservice/soap:use', 'read', 50, 'webservice_soap', 62),
(393, 'webservice/xmlrpc:use', 'read', 50, 'webservice_xmlrpc', 62),
(394, 'repository/alfresco:view', 'read', 70, 'repository_alfresco', 0),
(395, 'repository/boxnet:view', 'read', 70, 'repository_boxnet', 0),
(396, 'repository/coursefiles:view', 'read', 70, 'repository_coursefiles', 0),
(397, 'repository/dropbox:view', 'read', 70, 'repository_dropbox', 0),
(398, 'repository/equella:view', 'read', 70, 'repository_equella', 0),
(399, 'repository/filesystem:view', 'read', 70, 'repository_filesystem', 0),
(400, 'repository/flickr:view', 'read', 70, 'repository_flickr', 0),
(401, 'repository/flickr_public:view', 'read', 70, 'repository_flickr_public', 0),
(402, 'repository/googledocs:view', 'read', 70, 'repository_googledocs', 0),
(403, 'repository/local:view', 'read', 70, 'repository_local', 0),
(404, 'repository/merlot:view', 'read', 70, 'repository_merlot', 0),
(405, 'repository/picasa:view', 'read', 70, 'repository_picasa', 0),
(406, 'repository/recent:view', 'read', 70, 'repository_recent', 0),
(407, 'repository/s3:view', 'read', 70, 'repository_s3', 0),
(408, 'repository/upload:view', 'read', 70, 'repository_upload', 0),
(409, 'repository/url:view', 'read', 70, 'repository_url', 0),
(410, 'repository/user:view', 'read', 70, 'repository_user', 0),
(411, 'repository/webdav:view', 'read', 70, 'repository_webdav', 0),
(412, 'repository/wikimedia:view', 'read', 70, 'repository_wikimedia', 0),
(413, 'repository/youtube:view', 'read', 70, 'repository_youtube', 0),
(414, 'tool/customlang:view', 'read', 10, 'tool_customlang', 2),
(415, 'tool/customlang:edit', 'write', 10, 'tool_customlang', 6),
(417, 'booktool/exportimscp:export', 'read', 70, 'booktool_exportimscp', 0),
(418, 'booktool/importhtml:import', 'write', 70, 'booktool_importhtml', 4),
(419, 'booktool/print:print', 'read', 70, 'booktool_print', 0),
(420, 'quiz/grading:viewstudentnames', 'read', 70, 'quiz_grading', 0),
(421, 'quiz/grading:viewidnumber', 'read', 70, 'quiz_grading', 0),
(422, 'quiz/statistics:view', 'read', 70, 'quiz_statistics', 0),
(423, 'mod/repeatcourse:addinstance', 'write', 50, 'mod_repeatcourse', 4),
(424, 'moodle/user:ignoreuserquota', 'write', 10, 'moodle', 0),
(425, 'moodle/course:isincompletionreports', 'read', 50, 'moodle', 0),
(426, 'moodle/course:viewsuspendedusers', 'read', 10, 'moodle', 0),
(427, 'moodle/course:movesections', 'write', 50, 'moodle', 0),
(428, 'moodle/tag:flag', 'write', 10, 'moodle', 16),
(429, 'moodle/badges:manageglobalsettings', 'write', 10, 'moodle', 34),
(430, 'moodle/badges:viewbadges', 'read', 50, 'moodle', 0),
(431, 'moodle/badges:manageownbadges', 'write', 30, 'moodle', 0),
(432, 'moodle/badges:viewotherbadges', 'read', 30, 'moodle', 0),
(433, 'moodle/badges:earnbadge', 'write', 50, 'moodle', 0),
(434, 'moodle/badges:createbadge', 'write', 50, 'moodle', 16),
(435, 'moodle/badges:deletebadge', 'write', 50, 'moodle', 32),
(436, 'moodle/badges:configuredetails', 'write', 50, 'moodle', 16),
(437, 'moodle/badges:configurecriteria', 'write', 50, 'moodle', 0),
(438, 'moodle/badges:configuremessages', 'write', 50, 'moodle', 16),
(439, 'moodle/badges:awardbadge', 'write', 50, 'moodle', 16),
(440, 'moodle/badges:viewawarded', 'read', 50, 'moodle', 8),
(441, 'mod/assign:grantextension', 'write', 70, 'mod_assign', 0),
(442, 'mod/assign:revealidentities', 'write', 70, 'mod_assign', 0),
(443, 'mod/data:exportuserinfo', 'read', 70, 'mod_data', 8),
(444, 'enrol/flatfile:manage', 'write', 50, 'enrol_flatfile', 0),
(445, 'enrol/flatfile:unenrol', 'write', 50, 'enrol_flatfile', 0),
(446, 'block/activity_modules:addinstance', 'write', 80, 'block_activity_modules', 20),
(447, 'block/admin_bookmarks:myaddinstance', 'write', 10, 'block_admin_bookmarks', 0),
(448, 'block/admin_bookmarks:addinstance', 'write', 80, 'block_admin_bookmarks', 20),
(449, 'block/badges:addinstance', 'read', 80, 'block_badges', 0),
(450, 'block/badges:myaddinstance', 'read', 10, 'block_badges', 8),
(451, 'block/blog_menu:addinstance', 'write', 80, 'block_blog_menu', 20),
(452, 'block/blog_recent:addinstance', 'write', 80, 'block_blog_recent', 20),
(453, 'block/blog_tags:addinstance', 'write', 80, 'block_blog_tags', 20),
(454, 'block/calendar_month:myaddinstance', 'write', 10, 'block_calendar_month', 0),
(455, 'block/calendar_month:addinstance', 'write', 80, 'block_calendar_month', 20),
(456, 'block/calendar_upcoming:myaddinstance', 'write', 10, 'block_calendar_upcoming', 0),
(457, 'block/calendar_upcoming:addinstance', 'write', 80, 'block_calendar_upcoming', 20),
(458, 'block/comments:myaddinstance', 'write', 10, 'block_comments', 0),
(459, 'block/comments:addinstance', 'write', 80, 'block_comments', 20),
(460, 'block/community:myaddinstance', 'write', 10, 'block_community', 0),
(461, 'block/community:addinstance', 'write', 80, 'block_community', 20),
(462, 'block/completionstatus:addinstance', 'write', 80, 'block_completionstatus', 20),
(463, 'block/course_list:myaddinstance', 'write', 10, 'block_course_list', 0),
(464, 'block/course_list:addinstance', 'write', 80, 'block_course_list', 20),
(465, 'block/course_overview:myaddinstance', 'write', 10, 'block_course_overview', 0),
(466, 'block/course_overview:addinstance', 'write', 80, 'block_course_overview', 20),
(467, 'block/course_summary:addinstance', 'write', 80, 'block_course_summary', 20),
(468, 'block/feedback:addinstance', 'write', 80, 'block_feedback', 20),
(469, 'block/glossary_random:myaddinstance', 'write', 10, 'block_glossary_random', 0),
(470, 'block/glossary_random:addinstance', 'write', 80, 'block_glossary_random', 20),
(471, 'block/html:myaddinstance', 'write', 10, 'block_html', 0),
(472, 'block/html:addinstance', 'write', 80, 'block_html', 20),
(473, 'block/login:addinstance', 'write', 80, 'block_login', 20),
(474, 'block/mentees:myaddinstance', 'write', 10, 'block_mentees', 0),
(475, 'block/mentees:addinstance', 'write', 80, 'block_mentees', 20),
(476, 'block/messages:myaddinstance', 'write', 10, 'block_messages', 0),
(477, 'block/messages:addinstance', 'write', 80, 'block_messages', 20),
(478, 'block/mnet_hosts:myaddinstance', 'write', 10, 'block_mnet_hosts', 0),
(479, 'block/mnet_hosts:addinstance', 'write', 80, 'block_mnet_hosts', 20),
(480, 'block/myprofile:myaddinstance', 'write', 10, 'block_myprofile', 0),
(481, 'block/myprofile:addinstance', 'write', 80, 'block_myprofile', 20),
(482, 'block/navigation:myaddinstance', 'write', 10, 'block_navigation', 0),
(483, 'block/navigation:addinstance', 'write', 80, 'block_navigation', 20),
(484, 'block/news_items:myaddinstance', 'write', 10, 'block_news_items', 0),
(485, 'block/news_items:addinstance', 'write', 80, 'block_news_items', 20),
(486, 'block/online_users:myaddinstance', 'write', 10, 'block_online_users', 0),
(487, 'block/online_users:addinstance', 'write', 80, 'block_online_users', 20),
(488, 'block/participants:addinstance', 'write', 80, 'block_participants', 20),
(489, 'block/private_files:myaddinstance', 'write', 10, 'block_private_files', 0),
(490, 'block/private_files:addinstance', 'write', 80, 'block_private_files', 20),
(491, 'block/quiz_results:addinstance', 'write', 80, 'block_quiz_results', 20),
(492, 'block/recent_activity:addinstance', 'write', 80, 'block_recent_activity', 20),
(493, 'block/rss_client:myaddinstance', 'write', 10, 'block_rss_client', 0),
(494, 'block/rss_client:addinstance', 'write', 80, 'block_rss_client', 20),
(495, 'block/search_forums:addinstance', 'write', 80, 'block_search_forums', 20),
(496, 'block/section_links:addinstance', 'write', 80, 'block_section_links', 20),
(497, 'block/selfcompletion:addinstance', 'write', 80, 'block_selfcompletion', 20),
(498, 'block/settings:myaddinstance', 'write', 10, 'block_settings', 0),
(499, 'block/settings:addinstance', 'write', 80, 'block_settings', 20),
(500, 'block/site_main_menu:addinstance', 'write', 80, 'block_site_main_menu', 20),
(501, 'block/social_activities:addinstance', 'write', 80, 'block_social_activities', 20),
(502, 'block/tag_flickr:addinstance', 'write', 80, 'block_tag_flickr', 20),
(503, 'block/tag_youtube:addinstance', 'write', 80, 'block_tag_youtube', 20),
(504, 'block/tags:myaddinstance', 'write', 10, 'block_tags', 0),
(505, 'block/tags:addinstance', 'write', 80, 'block_tags', 20),
(506, 'report/performance:view', 'read', 10, 'report_performance', 2),
(507, 'mod/assign:reviewgrades', 'write', 70, 'mod_assign', 0),
(508, 'mod/assign:releasegrades', 'write', 70, 'mod_assign', 0),
(509, 'mod/assign:managegrades', 'write', 70, 'mod_assign', 0),
(510, 'mod/assign:manageallocations', 'write', 70, 'mod_assign', 0),
(511, 'repository/areafiles:view', 'read', 70, 'repository_areafiles', 0),
(512, 'repository/skydrive:view', 'read', 70, 'repository_skydrive', 0),
(513, 'tool/uploaduser:uploaduserpictures', 'write', 10, 'tool_uploaduser', 16);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_certificate`
--

CREATE TABLE IF NOT EXISTS `mdl_certificate` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `emailteachers` tinyint(1) NOT NULL DEFAULT '0',
  `emailothers` longtext,
  `savecert` tinyint(1) NOT NULL DEFAULT '0',
  `reportcert` tinyint(1) NOT NULL DEFAULT '0',
  `delivery` smallint(3) NOT NULL DEFAULT '0',
  `requiredtime` bigint(10) NOT NULL DEFAULT '0',
  `certificatetype` varchar(50) NOT NULL DEFAULT '',
  `orientation` varchar(10) NOT NULL DEFAULT '',
  `borderstyle` varchar(255) NOT NULL DEFAULT '0',
  `bordercolor` varchar(30) NOT NULL DEFAULT '0',
  `printwmark` varchar(255) NOT NULL DEFAULT '0',
  `printdate` bigint(10) NOT NULL DEFAULT '0',
  `datefmt` bigint(10) NOT NULL DEFAULT '0',
  `printnumber` tinyint(1) NOT NULL DEFAULT '0',
  `printgrade` bigint(10) NOT NULL DEFAULT '0',
  `gradefmt` bigint(10) NOT NULL DEFAULT '0',
  `printoutcome` bigint(10) NOT NULL DEFAULT '0',
  `printhours` varchar(255) DEFAULT NULL,
  `printteacher` bigint(10) NOT NULL DEFAULT '0',
  `customtext` longtext,
  `printsignature` varchar(255) NOT NULL DEFAULT '0',
  `printseal` varchar(255) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines certificates' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_certificate_issues`
--

CREATE TABLE IF NOT EXISTS `mdl_certificate_issues` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `certificateid` bigint(10) NOT NULL DEFAULT '0',
  `code` varchar(40) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about issued certificates' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat`
--

CREATE TABLE IF NOT EXISTS `mdl_chat` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `keepdays` bigint(11) NOT NULL DEFAULT '0',
  `studentlogs` smallint(4) NOT NULL DEFAULT '0',
  `chattime` bigint(10) NOT NULL DEFAULT '0',
  `schedule` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chat_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each of these is a chat room' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmess_use_ix` (`userid`),
  KEY `mdl_chatmess_gro_ix` (`groupid`),
  KEY `mdl_chatmess_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmess_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all the actual chat messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_messages_current`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_messages_current` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `system` tinyint(1) NOT NULL DEFAULT '0',
  `message` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_chatmesscurr_use_ix` (`userid`),
  KEY `mdl_chatmesscurr_gro_ix` (`groupid`),
  KEY `mdl_chatmesscurr_timcha_ix` (`timestamp`,`chatid`),
  KEY `mdl_chatmesscurr_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores current session' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_chat_users`
--

CREATE TABLE IF NOT EXISTS `mdl_chat_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `chatid` bigint(11) NOT NULL DEFAULT '0',
  `userid` bigint(11) NOT NULL DEFAULT '0',
  `groupid` bigint(11) NOT NULL DEFAULT '0',
  `version` varchar(16) NOT NULL DEFAULT '',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `firstping` bigint(10) NOT NULL DEFAULT '0',
  `lastping` bigint(10) NOT NULL DEFAULT '0',
  `lastmessageping` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(32) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_chatuser_use_ix` (`userid`),
  KEY `mdl_chatuser_las_ix` (`lastping`),
  KEY `mdl_chatuser_gro_ix` (`groupid`),
  KEY `mdl_chatuser_cha_ix` (`chatid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of which users are in which chat rooms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice`
--

CREATE TABLE IF NOT EXISTS `mdl_choice` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `publish` tinyint(2) NOT NULL DEFAULT '0',
  `showresults` tinyint(2) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  `allowupdate` tinyint(2) NOT NULL DEFAULT '0',
  `showunanswered` tinyint(2) NOT NULL DEFAULT '0',
  `limitanswers` tinyint(2) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choi_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Available choices are stored here' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `optionid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiansw_use_ix` (`userid`),
  KEY `mdl_choiansw_cho_ix` (`choiceid`),
  KEY `mdl_choiansw_opt_ix` (`optionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='choices performed by users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_choice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_choice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `choiceid` bigint(10) NOT NULL DEFAULT '0',
  `text` longtext,
  `maxanswers` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_choiopti_cho_ix` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='available options to choice' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `name` varchar(254) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coho_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Each record represents one cohort (aka site-wide group).' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_cohort`
--

INSERT INTO `mdl_cohort` (`id`, `contextid`, `name`, `idnumber`, `description`, `descriptionformat`, `component`, `timecreated`, `timemodified`) VALUES
(1, 24, 'Test cohort', '', '', 1, '', 1391086817, 1391086817);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_cohort_members`
--

CREATE TABLE IF NOT EXISTS `mdl_cohort_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `cohortid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cohomemb_cohuse_uix` (`cohortid`,`userid`),
  KEY `mdl_cohomemb_coh_ix` (`cohortid`),
  KEY `mdl_cohomemb_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a user to a cohort.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `commentarea` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `content` longtext NOT NULL,
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle comments module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config`
--

CREATE TABLE IF NOT EXISTS `mdl_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_conf_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Moodle configuration variables' AUTO_INCREMENT=447 ;

--
-- Dumping data for table `mdl_config`
--

INSERT INTO `mdl_config` (`id`, `name`, `value`) VALUES
(2, 'rolesactive', '1'),
(3, 'auth', 'intake'),
(4, 'auth_pop3mailbox', 'INBOX'),
(5, 'enrol_plugins_enabled', 'manual,guest,self,cohort'),
(6, 'theme', 'standard'),
(7, 'filter_multilang_converted', '1'),
(8, 'siteidentifier', 'rdArdOi23w34td0EEiz1v8EltKuXC5G2solin.loc'),
(9, 'backup_version', '2008111700'),
(10, 'backup_release', '2.0 dev'),
(11, 'mnet_dispatcher_mode', 'off'),
(12, 'sessiontimeout', '7200'),
(13, 'stringfilters', ''),
(14, 'filterall', '0'),
(15, 'texteditors', 'tinymce,textarea'),
(16, 'mnet_localhost_id', '1'),
(17, 'mnet_all_hosts_id', '2'),
(18, 'siteguest', '1'),
(19, 'siteadmins', '2'),
(20, 'themerev', '1391172212'),
(21, 'jsrev', '1391172212'),
(22, 'licenses', 'unknown,allrightsreserved,public,cc,cc-nd,cc-nc-nd,cc-nc,cc-nc-sa,cc-sa'),
(23, 'version', '2013111801.03'),
(24, 'enableoutcomes', '0'),
(25, 'usecomments', '1'),
(26, 'usetags', '1'),
(27, 'enablenotes', '1'),
(28, 'enableportfolios', '0'),
(29, 'enablewebservices', '0'),
(30, 'messaging', '1'),
(31, 'messaginghidereadnotifications', '0'),
(32, 'messagingdeletereadnotificationsdelay', '604800'),
(33, 'messagingallowemailoverride', '0'),
(34, 'enablestats', '0'),
(35, 'enablerssfeeds', '0'),
(36, 'bloglevel', '4'),
(37, 'enablecompletion', '0'),
(38, 'enableavailability', '0'),
(39, 'enableplagiarism', '0'),
(40, 'autologinguests', '0'),
(41, 'hiddenuserfields', ''),
(42, 'showuseridentity', 'email'),
(43, 'enablegravatar', '0'),
(44, 'enablecourserequests', '0'),
(45, 'defaultrequestcategory', '1'),
(46, 'courserequestnotify', ''),
(47, 'grade_profilereport', 'user'),
(48, 'grade_aggregationposition', '1'),
(49, 'grade_includescalesinaggregation', '1'),
(50, 'grade_hiddenasdate', '0'),
(51, 'gradepublishing', '0'),
(52, 'grade_export_displaytype', '1'),
(53, 'grade_export_decimalpoints', '2'),
(54, 'grade_navmethod', '0'),
(55, 'recovergradesdefault', '0'),
(56, 'gradeexport', ''),
(57, 'unlimitedgrades', '0'),
(58, 'grade_hideforcedsettings', '1'),
(59, 'grade_aggregation', '11'),
(60, 'grade_aggregation_flag', '0'),
(61, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13'),
(62, 'grade_aggregateonlygraded', '1'),
(63, 'grade_aggregateonlygraded_flag', '2'),
(64, 'grade_aggregateoutcomes', '0'),
(65, 'grade_aggregateoutcomes_flag', '2'),
(66, 'grade_aggregatesubcats', '0'),
(67, 'grade_aggregatesubcats_flag', '2'),
(68, 'grade_keephigh', '0'),
(69, 'grade_keephigh_flag', '3'),
(70, 'grade_droplow', '0'),
(71, 'grade_droplow_flag', '2'),
(72, 'grade_displaytype', '1'),
(73, 'grade_decimalpoints', '2'),
(74, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime'),
(75, 'grade_report_studentsperpage', '100'),
(76, 'grade_report_quickgrading', '1'),
(77, 'grade_report_showquickfeedback', '0'),
(78, 'grade_report_fixedstudents', '0'),
(79, 'grade_report_meanselection', '1'),
(80, 'grade_report_enableajax', '0'),
(81, 'grade_report_showcalculations', '0'),
(82, 'grade_report_showeyecons', '0'),
(83, 'grade_report_showaverages', '1'),
(84, 'grade_report_showlocks', '0'),
(85, 'grade_report_showranges', '0'),
(86, 'grade_report_showanalysisicon', '1'),
(87, 'grade_report_showuserimage', '1'),
(88, 'grade_report_showactivityicons', '1'),
(89, 'grade_report_shownumberofgrades', '0'),
(90, 'grade_report_averagesdisplaytype', 'inherit'),
(91, 'grade_report_rangesdisplaytype', 'inherit'),
(92, 'grade_report_averagesdecimalpoints', 'inherit'),
(93, 'grade_report_rangesdecimalpoints', 'inherit'),
(94, 'grade_report_overview_showrank', '0'),
(95, 'grade_report_overview_showtotalsifcontainhidden', '0'),
(96, 'grade_report_user_showrank', '0'),
(97, 'grade_report_user_showpercentage', '1'),
(98, 'grade_report_user_showgrade', '1'),
(99, 'grade_report_user_showfeedback', '1'),
(100, 'grade_report_user_showrange', '1'),
(101, 'grade_report_user_showweight', '0'),
(102, 'grade_report_user_showaverage', '0'),
(103, 'grade_report_user_showlettergrade', '0'),
(104, 'grade_report_user_rangedecimals', '0'),
(105, 'grade_report_user_showhiddenitems', '1'),
(106, 'grade_report_user_showtotalsifcontainhidden', '0'),
(107, 'timezone', '99'),
(108, 'forcetimezone', '99'),
(109, 'country', '0'),
(110, 'defaultcity', ''),
(111, 'geoipfile', 'D:\\OpenServer\\domains\\solin.loc\\topsdemo\\moodledata/geoip/GeoLiteCity.dat'),
(113, 'googlemapkey3', ''),
(114, 'allcountrycodes', ''),
(115, 'autolang', '1'),
(116, 'lang', 'en'),
(117, 'langmenu', '1'),
(118, 'langlist', ''),
(119, 'langcache', '1'),
(120, 'langstringcache', '1'),
(121, 'locale', ''),
(122, 'latinexcelexport', '0'),
(124, 'authpreventaccountcreation', '0'),
(125, 'loginpageautofocus', '0'),
(126, 'guestloginbutton', '0'),
(127, 'alternateloginurl', ''),
(128, 'forgottenpasswordurl', ''),
(129, 'auth_instructions', ''),
(130, 'allowemailaddresses', ''),
(131, 'denyemailaddresses', ''),
(132, 'verifychangedemail', '1'),
(133, 'recaptchapublickey', ''),
(134, 'recaptchaprivatekey', ''),
(135, 'sitedefaultlicense', 'allrightsreserved'),
(136, 'cachetext', '60'),
(137, 'filteruploadedfiles', '0'),
(138, 'filtermatchoneperpage', '0'),
(139, 'filtermatchonepertext', '0'),
(140, 'filter_multilang_force_old', '0'),
(141, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n'),
(142, 'filter_tex_latexbackground', '#FFFFFF'),
(143, 'filter_tex_density', '120'),
(144, 'filter_tex_pathlatex', '"c:\\texmf\\miktex\\bin\\latex.exe" '),
(145, 'filter_tex_pathdvips', '"c:\\texmf\\miktex\\bin\\dvips.exe" '),
(146, 'filter_tex_pathconvert', '"c:\\imagemagick\\convert.exe" '),
(147, 'filter_tex_convertformat', 'gif'),
(148, 'filter_censor_badwords', ''),
(149, 'portfolio_moderate_filesize_threshold', '1048576'),
(150, 'portfolio_high_filesize_threshold', '5242880'),
(151, 'portfolio_moderate_db_threshold', '20'),
(152, 'portfolio_high_db_threshold', '50'),
(153, 'repositorycacheexpire', '120'),
(154, 'repositoryallowexternallinks', '1'),
(155, 'legacyfilesinnewcourses', '0'),
(156, 'enablewsdocumentation', '0'),
(157, 'allowbeforeblock', '0'),
(158, 'allowedip', ''),
(159, 'blockedip', ''),
(160, 'protectusernames', '1'),
(161, 'forcelogin', '0'),
(162, 'forceloginforprofiles', '1'),
(163, 'forceloginforprofileimage', '0'),
(164, 'opentogoogle', '0'),
(165, 'maxbytes', '0'),
(166, 'userquota', '104857600'),
(167, 'allowobjectembed', '0'),
(168, 'enabletrusttext', '0'),
(169, 'maxeditingtime', '1800'),
(170, 'fullnamedisplay', 'language'),
(171, 'extendedusernamechars', '0'),
(172, 'sitepolicy', ''),
(173, 'sitepolicyguest', ''),
(174, 'keeptagnamecase', '1'),
(175, 'profilesforenrolledusersonly', '1'),
(176, 'cronclionly', '0'),
(177, 'cronremotepassword', ''),
(178, 'passwordpolicy', '1'),
(179, 'minpasswordlength', '8'),
(180, 'minpassworddigits', '1'),
(181, 'minpasswordlower', '1'),
(182, 'minpasswordupper', '1'),
(183, 'minpasswordnonalphanum', '1'),
(184, 'maxconsecutiveidentchars', '0'),
(185, 'groupenrolmentkeypolicy', '1'),
(186, 'disableuserimages', '0'),
(187, 'emailchangeconfirmation', '1'),
(188, 'rememberusername', '2'),
(189, 'strictformsrequired', '0'),
(190, 'loginhttps', '0'),
(191, 'cookiesecure', '0'),
(192, 'cookiehttponly', '0'),
(193, 'allowframembedding', '0'),
(194, 'loginpasswordautocomplete', '0'),
(195, 'displayloginfailures', ''),
(196, 'notifyloginfailures', ''),
(197, 'notifyloginthreshold', '10'),
(198, 'runclamonupload', '0'),
(199, 'pathtoclam', ''),
(200, 'quarantinedir', ''),
(201, 'clamfailureonupload', 'donothing'),
(202, 'themelist', ''),
(203, 'themedesignermode', '0'),
(204, 'allowuserthemes', '0'),
(205, 'allowcoursethemes', '0'),
(206, 'allowcategorythemes', '0'),
(207, 'allowthemechangeonurl', '0'),
(208, 'allowuserblockhiding', '1'),
(209, 'allowblockstodock', '1'),
(210, 'custommenuitems', ''),
(211, 'enabledevicedetection', '1'),
(212, 'devicedetectregex', '[]'),
(213, 'calendar_adminseesall', '0'),
(214, 'calendar_site_timeformat', '0'),
(215, 'calendar_startwday', '0'),
(216, 'calendar_weekend', '65'),
(217, 'calendar_lookahead', '21'),
(218, 'calendar_maxevents', '10'),
(219, 'enablecalendarexport', '1'),
(220, 'calendar_exportsalt', '30B2F9WRYPs7eopNqTx58ed7lOaK0zKPlBPmJAzabi8PkSE2RAH4sMH00Net'),
(221, 'useblogassociations', '1'),
(222, 'useexternalblogs', '1'),
(223, 'externalblogcrontime', '86400'),
(224, 'maxexternalblogsperuser', '1'),
(225, 'blogusecomments', '1'),
(226, 'blogshowcommentscount', '1'),
(227, 'defaulthomepage', '0'),
(228, 'navshowcategories', '1'),
(229, 'navshowmycoursecategories', '0'),
(230, 'navshowallcourses', '0'),
(231, 'navcourselimit', '20'),
(232, 'usesitenameforsitepages', '0'),
(233, 'linkadmincategories', '0'),
(234, 'navshowfrontpagemods', '1'),
(235, 'navadduserpostslinks', '1'),
(236, 'formatstringstriptags', '1'),
(237, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]'),
(238, 'core_media_enable_youtube', '1'),
(239, 'core_media_enable_vimeo', '0'),
(240, 'core_media_enable_mp3', '1'),
(241, 'core_media_enable_flv', '1'),
(242, 'core_media_enable_swf', '1'),
(243, 'core_media_enable_html5audio', '1'),
(244, 'core_media_enable_html5video', '1'),
(245, 'core_media_enable_qt', '1'),
(246, 'core_media_enable_wmp', '1'),
(247, 'core_media_enable_rm', '1'),
(248, 'docroot', 'http://docs.moodle.org'),
(249, 'doctonewwindow', '0'),
(250, 'courselistshortnames', '0'),
(251, 'enableajax', '1'),
(252, 'useexternalyui', '0'),
(253, 'yuicomboloading', '1'),
(254, 'cachejs', '1'),
(255, 'modchooserdefault', '1'),
(256, 'additionalhtmlhead', ''),
(257, 'additionalhtmltopofbody', ''),
(258, 'additionalhtmlfooter', ''),
(259, 'gdversion', '2'),
(260, 'pathtodu', ''),
(261, 'aspellpath', ''),
(262, 'pathtodot', ''),
(263, 'supportpage', ''),
(264, 'dbsessions', '1'),
(265, 'sessioncookie', ''),
(266, 'sessioncookiepath', ''),
(267, 'sessioncookiedomain', ''),
(268, 'statsfirstrun', 'none'),
(269, 'statsmaxruntime', '0'),
(270, 'statsruntimedays', '31'),
(271, 'statsruntimestarthour', '0'),
(272, 'statsruntimestartminute', '0'),
(273, 'statsuserthreshold', '0'),
(274, 'slasharguments', '1'),
(275, 'getremoteaddrconf', '0'),
(276, 'proxyhost', ''),
(277, 'proxyport', '0'),
(278, 'proxytype', 'HTTP'),
(279, 'proxyuser', ''),
(280, 'proxypassword', ''),
(281, 'proxybypass', 'localhost, 127.0.0.1'),
(282, 'maintenance_enabled', '0'),
(283, 'maintenance_message', ''),
(284, 'deleteunconfirmed', '168'),
(285, 'deleteincompleteusers', '0'),
(286, 'logguests', '1'),
(287, 'loglifetime', '0'),
(288, 'disablegradehistory', '0'),
(289, 'gradehistorylifetime', '0'),
(291, 'extramemorylimit', '512M'),
(292, 'curlcache', '120'),
(293, 'curltimeoutkbitrate', '56'),
(294, 'updateautocheck', '1'),
(295, 'updateminmaturity', '200'),
(296, 'updatenotifybuilds', '0'),
(297, 'enablesafebrowserintegration', '0'),
(298, 'enablegroupmembersonly', '0'),
(299, 'dndallowtextandlinks', '0'),
(300, 'enablecssoptimiser', '0'),
(301, 'debug', '32767'),
(302, 'debugdisplay', '1'),
(304, 'debugsmtp', '0'),
(305, 'perfdebug', '7'),
(306, 'debugstringids', '0'),
(307, 'debugvalidators', '0'),
(308, 'debugpageinfo', '0'),
(309, 'release', '2.6.1+ (Build: 20140123)'),
(310, 'branch', '26'),
(312, 'notloggedinroleid', '6'),
(313, 'guestroleid', '6'),
(314, 'defaultuserroleid', '7'),
(315, 'creatornewroleid', '3'),
(316, 'restorernewroleid', '3'),
(317, 'gradebookroles', '5'),
(318, 'assignment_maxbytes', '1048576'),
(319, 'assignment_itemstocount', '1'),
(320, 'assignment_showrecentsubmissions', '1'),
(321, 'chat_method', 'ajax'),
(322, 'chat_refresh_userlist', '10'),
(323, 'chat_old_ping', '35'),
(324, 'chat_refresh_room', '5'),
(325, 'chat_normal_updatemode', 'jsupdate'),
(326, 'chat_serverhost', 'solin.loc'),
(327, 'chat_serverip', '127.0.0.1'),
(328, 'chat_serverport', '9111'),
(329, 'chat_servermax', '100'),
(330, 'data_enablerssfeeds', '0'),
(331, 'feedback_allowfullanonymous', '0'),
(332, 'forum_displaymode', '3'),
(333, 'forum_replytouser', '1'),
(334, 'forum_shortpost', '300'),
(335, 'forum_longpost', '600'),
(336, 'forum_manydiscussions', '100'),
(337, 'forum_maxbytes', '512000'),
(338, 'forum_maxattachments', '9'),
(339, 'forum_trackreadposts', '1'),
(340, 'forum_oldpostdays', '14'),
(341, 'forum_usermarksread', '0'),
(342, 'forum_cleanreadtime', '2'),
(343, 'digestmailtime', '17'),
(344, 'forum_enablerssfeeds', '0'),
(345, 'forum_enabletimedposts', '0'),
(346, 'glossary_entbypage', '10'),
(347, 'glossary_dupentries', '0'),
(348, 'glossary_allowcomments', '0'),
(349, 'glossary_linkbydefault', '1'),
(350, 'glossary_defaultapproval', '1'),
(351, 'glossary_enablerssfeeds', '0'),
(352, 'glossary_linkentries', '0'),
(353, 'glossary_casesensitive', '0'),
(354, 'glossary_fullmatch', '0'),
(355, 'lesson_slideshowwidth', '640'),
(356, 'lesson_slideshowheight', '480'),
(357, 'lesson_slideshowbgcolor', '#FFFFFF'),
(358, 'lesson_mediawidth', '640'),
(359, 'lesson_mediaheight', '480'),
(360, 'lesson_mediaclose', '0'),
(361, 'lesson_maxhighscores', '10'),
(362, 'lesson_maxanswers', '4'),
(363, 'lesson_defaultnextpage', '0'),
(364, 'block_course_list_adminview', 'all'),
(365, 'block_course_list_hideallcourseslink', '0'),
(366, 'block_online_users_timetosee', '5'),
(367, 'block_rss_client_num_entries', '5'),
(368, 'block_rss_client_timeout', '30'),
(369, 'block_tags_showcoursetags', '0'),
(370, 'jabberhost', ''),
(371, 'jabberserver', ''),
(372, 'jabberusername', ''),
(373, 'jabberpassword', ''),
(374, 'jabberport', '5222'),
(375, 'smtphosts', ''),
(376, 'smtpsecure', ''),
(377, 'smtpuser', ''),
(378, 'smtppass', ''),
(379, 'smtpmaxbulk', '1'),
(380, 'noreplyaddress', 'noreply@solin.loc'),
(381, 'sitemailcharset', '0'),
(382, 'allowusermailcharset', '0'),
(383, 'mailnewline', 'LF'),
(384, 'profileroles', '5,4,3'),
(385, 'coursecontact', '3'),
(386, 'frontpage', '6'),
(387, 'frontpageloggedin', '5,7'),
(388, 'maxcategorydepth', '0'),
(389, 'commentsperpage', '15'),
(390, 'coursesperpage', '20'),
(391, 'defaultfrontpageroleid', '8'),
(392, 'supportname', 'Admin User'),
(393, 'supportemail', 'alexander.zhuravlev@intosoft.by'),
(394, 'registerauth', 'intake'),
(397, 'digestmailtimelast', '0'),
(398, 'forum_lastreadclean', '1390821670'),
(399, 'scorm_updatetimelast', '1390821670'),
(400, 'fileslastcleanup', '1390821670'),
(401, 'langrev', '1391172212'),
(402, 'localcachedirpurged', '1391172212'),
(404, 'enableblogs', '1'),
(405, 'filesrootrecordsfixed', '1'),
(406, 'movingmoduleupgradescriptwasrun', '1'),
(407, 'enablebadges', '1'),
(408, 'maxusersperpage', '100'),
(409, 'gravatardefaulturl', 'mm'),
(410, 'requestcategoryselection', '0'),
(411, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email'),
(412, 'grade_export_customprofilefields', ''),
(413, 'grade_report_showonlyactiveenrol', '1'),
(414, 'badges_defaultissuername', 'Solin'),
(415, 'badges_defaultissuercontact', 'alexander.zhuravlev@intosoft.by'),
(416, 'badges_badgesalt', 'badges1390393232'),
(417, 'badges_allowexternalbackpack', '1'),
(418, 'badges_allowcoursebadges', '1'),
(419, 'block_html_allowcssclasses', '0'),
(420, 'mobilecssurl', ''),
(421, 'lockoutthreshold', '0'),
(422, 'lockoutwindow', '1800'),
(423, 'lockoutduration', '1800'),
(424, 'calendar_customexport', '1'),
(425, 'calendar_exportlookahead', '365'),
(426, 'calendar_exportlookback', '5'),
(427, 'calendar_showicalsource', '1'),
(428, 'allowguestmymoodle', '1'),
(429, 'navshowfullcoursenames', '0'),
(430, 'navsortmycoursessort', 'sortorder'),
(431, 'courseswithsummarieslimit', '10'),
(432, 'courseoverviewfileslimit', '1'),
(433, 'courseoverviewfilesext', '.jpg,.gif,.png'),
(434, 'frontpagecourselimit', '200'),
(435, 'updateautodeploy', '0'),
(437, 'allversionshash', '9d2d46cff26f2bf50b0e2ec00436c23decf38768'),
(438, 'completiondefault', '1'),
(439, 'forum_trackingtype', '1'),
(440, 'forum_allowforcedreadtracking', '0'),
(441, 'allowattachments', '1'),
(442, 'legacyfilesaddallowed', '1'),
(443, 'pwresettime', '1800'),
(444, 'modeditingmenu', '1'),
(445, 'blockeditingmenu', '1'),
(446, 'enabletgzbackups', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_log`
--

CREATE TABLE IF NOT EXISTS `mdl_config_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  `oldvalue` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_conflog_tim_ix` (`timemodified`),
  KEY `mdl_conflog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Changes done in server configuration through admin UI' AUTO_INCREMENT=936 ;

--
-- Dumping data for table `mdl_config_log`
--

INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(1, 0, 1390393234, NULL, 'enableoutcomes', '0', NULL),
(2, 0, 1390393234, NULL, 'usecomments', '1', NULL),
(3, 0, 1390393234, NULL, 'usetags', '1', NULL),
(4, 0, 1390393234, NULL, 'enablenotes', '1', NULL),
(5, 0, 1390393234, NULL, 'enableportfolios', '0', NULL),
(6, 0, 1390393234, NULL, 'enablewebservices', '0', NULL),
(7, 0, 1390393234, NULL, 'messaging', '1', NULL),
(8, 0, 1390393234, NULL, 'messaginghidereadnotifications', '0', NULL),
(9, 0, 1390393234, NULL, 'messagingdeletereadnotificationsdelay', '604800', NULL),
(10, 0, 1390393234, NULL, 'messagingallowemailoverride', '0', NULL),
(11, 0, 1390393234, NULL, 'enablestats', '0', NULL),
(12, 0, 1390393234, NULL, 'enablerssfeeds', '0', NULL),
(13, 0, 1390393234, NULL, 'bloglevel', '4', NULL),
(14, 0, 1390393234, NULL, 'enablecompletion', '0', NULL),
(15, 0, 1390393234, NULL, 'enableavailability', '0', NULL),
(16, 0, 1390393234, NULL, 'enableplagiarism', '0', NULL),
(17, 0, 1390393234, NULL, 'autologinguests', '0', NULL),
(18, 0, 1390393234, NULL, 'hiddenuserfields', '', NULL),
(19, 0, 1390393234, NULL, 'showuseridentity', 'email', NULL),
(20, 0, 1390393234, NULL, 'enablegravatar', '0', NULL),
(21, 0, 1390393234, 'moodlecourse', 'format', 'weeks', NULL),
(22, 0, 1390393234, 'moodlecourse', 'maxsections', '52', NULL),
(23, 0, 1390393234, 'moodlecourse', 'numsections', '10', NULL),
(24, 0, 1390393234, 'moodlecourse', 'hiddensections', '0', NULL),
(25, 0, 1390393234, 'moodlecourse', 'newsitems', '5', NULL),
(26, 0, 1390393234, 'moodlecourse', 'showgrades', '1', NULL),
(27, 0, 1390393234, 'moodlecourse', 'showreports', '0', NULL),
(28, 0, 1390393234, 'moodlecourse', 'maxbytes', '52428800', NULL),
(29, 0, 1390393234, 'moodlecourse', 'coursedisplay', '0', NULL),
(30, 0, 1390393234, 'moodlecourse', 'groupmode', '0', NULL),
(31, 0, 1390393234, 'moodlecourse', 'groupmodeforce', '0', NULL),
(32, 0, 1390393234, 'moodlecourse', 'visible', '1', NULL),
(33, 0, 1390393234, 'moodlecourse', 'lang', '', NULL),
(34, 0, 1390393234, 'moodlecourse', 'enablecompletion', '0', NULL),
(35, 0, 1390393234, 'moodlecourse', 'completionstartonenrol', '0', NULL),
(36, 0, 1390393234, NULL, 'enablecourserequests', '0', NULL),
(37, 0, 1390393234, NULL, 'defaultrequestcategory', '1', NULL),
(38, 0, 1390393234, NULL, 'courserequestnotify', '', NULL),
(39, 0, 1390393234, 'backup', 'loglifetime', '30', NULL),
(40, 0, 1390393234, 'backup', 'backup_general_users', '1', NULL),
(41, 0, 1390393234, 'backup', 'backup_general_users_locked', '0', NULL),
(42, 0, 1390393234, 'backup', 'backup_general_anonymize', '0', NULL),
(43, 0, 1390393234, 'backup', 'backup_general_anonymize_locked', '0', NULL),
(44, 0, 1390393234, 'backup', 'backup_general_role_assignments', '1', NULL),
(45, 0, 1390393234, 'backup', 'backup_general_role_assignments_locked', '0', NULL),
(46, 0, 1390393234, 'backup', 'backup_general_activities', '1', NULL),
(47, 0, 1390393234, 'backup', 'backup_general_activities_locked', '0', NULL),
(48, 0, 1390393234, 'backup', 'backup_general_blocks', '1', NULL),
(49, 0, 1390393234, 'backup', 'backup_general_blocks_locked', '0', NULL),
(50, 0, 1390393234, 'backup', 'backup_general_filters', '1', NULL),
(51, 0, 1390393234, 'backup', 'backup_general_filters_locked', '0', NULL),
(52, 0, 1390393234, 'backup', 'backup_general_comments', '1', NULL),
(53, 0, 1390393234, 'backup', 'backup_general_comments_locked', '0', NULL),
(54, 0, 1390393234, 'backup', 'backup_general_userscompletion', '1', NULL),
(55, 0, 1390393234, 'backup', 'backup_general_userscompletion_locked', '0', NULL),
(56, 0, 1390393234, 'backup', 'backup_general_logs', '0', NULL),
(57, 0, 1390393234, 'backup', 'backup_general_logs_locked', '0', NULL),
(58, 0, 1390393234, 'backup', 'backup_general_histories', '0', NULL),
(59, 0, 1390393234, 'backup', 'backup_general_histories_locked', '0', NULL),
(60, 0, 1390393234, 'backup', 'backup_auto_active', '0', NULL),
(61, 0, 1390393234, 'backup', 'backup_auto_weekdays', '0000000', NULL),
(62, 0, 1390393234, 'backup', 'backup_auto_hour', '0', NULL),
(63, 0, 1390393234, 'backup', 'backup_auto_minute', '0', NULL),
(64, 0, 1390393234, 'backup', 'backup_auto_storage', '0', NULL),
(65, 0, 1390393234, 'backup', 'backup_auto_destination', '', NULL),
(66, 0, 1390393234, 'backup', 'backup_auto_keep', '1', NULL),
(67, 0, 1390393234, 'backup', 'backup_shortname', '0', NULL),
(68, 0, 1390393234, 'backup', 'backup_auto_users', '1', NULL),
(69, 0, 1390393234, 'backup', 'backup_auto_role_assignments', '1', NULL),
(70, 0, 1390393234, 'backup', 'backup_auto_activities', '1', NULL),
(71, 0, 1390393234, 'backup', 'backup_auto_blocks', '1', NULL),
(72, 0, 1390393234, 'backup', 'backup_auto_filters', '1', NULL),
(73, 0, 1390393234, 'backup', 'backup_auto_comments', '1', NULL),
(74, 0, 1390393234, 'backup', 'backup_auto_userscompletion', '1', NULL),
(75, 0, 1390393234, 'backup', 'backup_auto_logs', '0', NULL),
(76, 0, 1390393234, 'backup', 'backup_auto_histories', '0', NULL),
(77, 0, 1390393234, NULL, 'grade_profilereport', 'user', NULL),
(78, 0, 1390393234, NULL, 'grade_aggregationposition', '1', NULL),
(79, 0, 1390393234, NULL, 'grade_includescalesinaggregation', '1', NULL),
(80, 0, 1390393234, NULL, 'grade_hiddenasdate', '0', NULL),
(81, 0, 1390393234, NULL, 'gradepublishing', '0', NULL),
(82, 0, 1390393234, NULL, 'grade_export_displaytype', '1', NULL),
(83, 0, 1390393234, NULL, 'grade_export_decimalpoints', '2', NULL),
(84, 0, 1390393234, NULL, 'grade_navmethod', '0', NULL),
(85, 0, 1390393234, NULL, 'recovergradesdefault', '0', NULL),
(86, 0, 1390393234, NULL, 'gradeexport', '', NULL),
(87, 0, 1390393234, NULL, 'unlimitedgrades', '0', NULL),
(88, 0, 1390393234, NULL, 'grade_hideforcedsettings', '1', NULL),
(89, 0, 1390393234, NULL, 'grade_aggregation', '11', NULL),
(90, 0, 1390393234, NULL, 'grade_aggregation_flag', '0', NULL),
(91, 0, 1390393234, NULL, 'grade_aggregations_visible', '0,10,11,12,2,4,6,8,13', NULL),
(92, 0, 1390393234, NULL, 'grade_aggregateonlygraded', '1', NULL),
(93, 0, 1390393234, NULL, 'grade_aggregateonlygraded_flag', '2', NULL),
(94, 0, 1390393234, NULL, 'grade_aggregateoutcomes', '0', NULL),
(95, 0, 1390393234, NULL, 'grade_aggregateoutcomes_flag', '2', NULL),
(96, 0, 1390393234, NULL, 'grade_aggregatesubcats', '0', NULL),
(97, 0, 1390393234, NULL, 'grade_aggregatesubcats_flag', '2', NULL),
(98, 0, 1390393234, NULL, 'grade_keephigh', '0', NULL),
(99, 0, 1390393234, NULL, 'grade_keephigh_flag', '3', NULL),
(100, 0, 1390393234, NULL, 'grade_droplow', '0', NULL),
(101, 0, 1390393234, NULL, 'grade_droplow_flag', '2', NULL),
(102, 0, 1390393234, NULL, 'grade_displaytype', '1', NULL),
(103, 0, 1390393234, NULL, 'grade_decimalpoints', '2', NULL),
(104, 0, 1390393234, NULL, 'grade_item_advanced', 'iteminfo,idnumber,gradepass,plusfactor,multfactor,display,decimals,hiddenuntil,locktime', NULL),
(105, 0, 1390393234, NULL, 'grade_report_studentsperpage', '100', NULL),
(106, 0, 1390393234, NULL, 'grade_report_quickgrading', '1', NULL),
(107, 0, 1390393234, NULL, 'grade_report_showquickfeedback', '0', NULL),
(108, 0, 1390393234, NULL, 'grade_report_fixedstudents', '0', NULL),
(109, 0, 1390393234, NULL, 'grade_report_meanselection', '1', NULL),
(110, 0, 1390393234, NULL, 'grade_report_enableajax', '0', NULL),
(111, 0, 1390393234, NULL, 'grade_report_showcalculations', '0', NULL),
(112, 0, 1390393234, NULL, 'grade_report_showeyecons', '0', NULL),
(113, 0, 1390393234, NULL, 'grade_report_showaverages', '1', NULL),
(114, 0, 1390393234, NULL, 'grade_report_showlocks', '0', NULL),
(115, 0, 1390393234, NULL, 'grade_report_showranges', '0', NULL),
(116, 0, 1390393234, NULL, 'grade_report_showanalysisicon', '1', NULL),
(117, 0, 1390393234, NULL, 'grade_report_showuserimage', '1', NULL),
(118, 0, 1390393234, NULL, 'grade_report_showactivityicons', '1', NULL),
(119, 0, 1390393234, NULL, 'grade_report_shownumberofgrades', '0', NULL),
(120, 0, 1390393234, NULL, 'grade_report_averagesdisplaytype', 'inherit', NULL),
(121, 0, 1390393234, NULL, 'grade_report_rangesdisplaytype', 'inherit', NULL),
(122, 0, 1390393234, NULL, 'grade_report_averagesdecimalpoints', 'inherit', NULL),
(123, 0, 1390393234, NULL, 'grade_report_rangesdecimalpoints', 'inherit', NULL),
(124, 0, 1390393234, NULL, 'grade_report_overview_showrank', '0', NULL),
(125, 0, 1390393234, NULL, 'grade_report_overview_showtotalsifcontainhidden', '0', NULL),
(126, 0, 1390393234, NULL, 'grade_report_user_showrank', '0', NULL),
(127, 0, 1390393234, NULL, 'grade_report_user_showpercentage', '1', NULL),
(128, 0, 1390393234, NULL, 'grade_report_user_showgrade', '1', NULL),
(129, 0, 1390393234, NULL, 'grade_report_user_showfeedback', '1', NULL),
(130, 0, 1390393234, NULL, 'grade_report_user_showrange', '1', NULL),
(131, 0, 1390393234, NULL, 'grade_report_user_showweight', '0', NULL),
(132, 0, 1390393234, NULL, 'grade_report_user_showaverage', '0', NULL),
(133, 0, 1390393234, NULL, 'grade_report_user_showlettergrade', '0', NULL),
(134, 0, 1390393234, NULL, 'grade_report_user_rangedecimals', '0', NULL),
(135, 0, 1390393234, NULL, 'grade_report_user_showhiddenitems', '1', NULL),
(136, 0, 1390393234, NULL, 'grade_report_user_showtotalsifcontainhidden', '0', NULL),
(137, 0, 1390393234, NULL, 'timezone', '99', NULL),
(138, 0, 1390393234, NULL, 'forcetimezone', '99', NULL),
(139, 0, 1390393234, NULL, 'country', '0', NULL),
(140, 0, 1390393234, NULL, 'defaultcity', '', NULL),
(141, 0, 1390393234, NULL, 'geoipfile', 'D:\\OpenServer\\domains\\solin.loc\\topsdemo\\moodledata/geoip/GeoLiteCity.dat', NULL),
(142, 0, 1390393234, NULL, 'googlemapkey', '', NULL),
(143, 0, 1390393234, NULL, 'googlemapkey3', '', NULL),
(144, 0, 1390393234, NULL, 'allcountrycodes', '', NULL),
(145, 0, 1390393234, NULL, 'autolang', '1', NULL),
(146, 0, 1390393234, NULL, 'lang', 'en', NULL),
(147, 0, 1390393234, NULL, 'langmenu', '1', NULL),
(148, 0, 1390393234, NULL, 'langlist', '', NULL),
(149, 0, 1390393234, NULL, 'langcache', '1', NULL),
(150, 0, 1390393234, NULL, 'langstringcache', '1', NULL),
(151, 0, 1390393234, NULL, 'locale', '', NULL),
(152, 0, 1390393234, NULL, 'latinexcelexport', '0', NULL),
(153, 0, 1390393234, NULL, 'registerauth', '', NULL),
(154, 0, 1390393234, NULL, 'authpreventaccountcreation', '0', NULL),
(155, 0, 1390393234, NULL, 'loginpageautofocus', '0', NULL),
(156, 0, 1390393234, NULL, 'guestloginbutton', '1', NULL),
(157, 0, 1390393234, NULL, 'alternateloginurl', '', NULL),
(158, 0, 1390393234, NULL, 'forgottenpasswordurl', '', NULL),
(159, 0, 1390393234, NULL, 'auth_instructions', '', NULL),
(160, 0, 1390393234, NULL, 'allowemailaddresses', '', NULL),
(161, 0, 1390393234, NULL, 'denyemailaddresses', '', NULL),
(162, 0, 1390393234, NULL, 'verifychangedemail', '1', NULL),
(163, 0, 1390393234, NULL, 'recaptchapublickey', '', NULL),
(164, 0, 1390393234, NULL, 'recaptchaprivatekey', '', NULL),
(165, 0, 1390393234, 'enrol_database', 'dbtype', '', NULL),
(166, 0, 1390393234, 'enrol_database', 'dbhost', 'localhost', NULL),
(167, 0, 1390393234, 'enrol_database', 'dbuser', '', NULL),
(168, 0, 1390393234, 'enrol_database', 'dbpass', '', NULL),
(169, 0, 1390393234, 'enrol_database', 'dbname', '', NULL),
(170, 0, 1390393234, 'enrol_database', 'dbencoding', 'utf-8', NULL),
(171, 0, 1390393234, 'enrol_database', 'dbsetupsql', '', NULL),
(172, 0, 1390393234, 'enrol_database', 'dbsybasequoting', '0', NULL),
(173, 0, 1390393234, 'enrol_database', 'debugdb', '0', NULL),
(174, 0, 1390393234, 'enrol_database', 'localcoursefield', 'idnumber', NULL),
(175, 0, 1390393234, 'enrol_database', 'localuserfield', 'idnumber', NULL),
(176, 0, 1390393234, 'enrol_database', 'localrolefield', 'shortname', NULL),
(177, 0, 1390393234, 'enrol_database', 'localcategoryfield', 'id', NULL),
(178, 0, 1390393234, 'enrol_database', 'remoteenroltable', '', NULL),
(179, 0, 1390393234, 'enrol_database', 'remotecoursefield', '', NULL),
(180, 0, 1390393234, 'enrol_database', 'remoteuserfield', '', NULL),
(181, 0, 1390393234, 'enrol_database', 'remoterolefield', '', NULL),
(182, 0, 1390393234, 'enrol_database', 'ignorehiddencourses', '0', NULL),
(183, 0, 1390393234, 'enrol_database', 'unenrolaction', '0', NULL),
(184, 0, 1390393234, 'enrol_database', 'newcoursetable', '', NULL),
(185, 0, 1390393234, 'enrol_database', 'newcoursefullname', 'fullname', NULL),
(186, 0, 1390393234, 'enrol_database', 'newcourseshortname', 'shortname', NULL),
(187, 0, 1390393234, 'enrol_database', 'newcourseidnumber', 'idnumber', NULL),
(188, 0, 1390393234, 'enrol_database', 'newcoursecategory', '', NULL),
(189, 0, 1390393234, 'enrol_database', 'templatecourse', '', NULL),
(190, 0, 1390393234, 'enrol_flatfile', 'location', '', NULL),
(191, 0, 1390393234, 'enrol_flatfile', 'mailstudents', '0', NULL),
(192, 0, 1390393234, 'enrol_flatfile', 'mailteachers', '0', NULL),
(193, 0, 1390393234, 'enrol_flatfile', 'mailadmins', '0', NULL),
(194, 0, 1390393234, 'enrol_guest', 'requirepassword', '0', NULL),
(195, 0, 1390393234, 'enrol_guest', 'usepasswordpolicy', '0', NULL),
(196, 0, 1390393234, 'enrol_guest', 'showhint', '0', NULL),
(197, 0, 1390393234, 'enrol_guest', 'defaultenrol', '1', NULL),
(198, 0, 1390393234, 'enrol_guest', 'status', '1', NULL),
(199, 0, 1390393234, 'enrol_guest', 'status_adv', '0', NULL),
(200, 0, 1390393234, 'enrol_imsenterprise', 'imsfilelocation', '', NULL),
(201, 0, 1390393234, 'enrol_imsenterprise', 'logtolocation', '', NULL),
(202, 0, 1390393234, 'enrol_imsenterprise', 'mailadmins', '0', NULL),
(203, 0, 1390393234, 'enrol_imsenterprise', 'createnewusers', '0', NULL),
(204, 0, 1390393234, 'enrol_imsenterprise', 'imsdeleteusers', '0', NULL),
(205, 0, 1390393234, 'enrol_imsenterprise', 'fixcaseusernames', '0', NULL),
(206, 0, 1390393234, 'enrol_imsenterprise', 'fixcasepersonalnames', '0', NULL),
(207, 0, 1390393234, 'enrol_imsenterprise', 'imssourcedidfallback', '0', NULL),
(208, 0, 1390393234, 'enrol_imsenterprise', 'truncatecoursecodes', '0', NULL),
(209, 0, 1390393234, 'enrol_imsenterprise', 'createnewcourses', '0', NULL),
(210, 0, 1390393234, 'enrol_imsenterprise', 'createnewcategories', '0', NULL),
(211, 0, 1390393234, 'enrol_imsenterprise', 'imsunenrol', '0', NULL),
(212, 0, 1390393234, 'enrol_imsenterprise', 'imsrestricttarget', '', NULL),
(213, 0, 1390393234, 'enrol_imsenterprise', 'imscapitafix', '0', NULL),
(214, 0, 1390393234, 'enrol_manual', 'defaultenrol', '1', NULL),
(215, 0, 1390393234, 'enrol_manual', 'status', '0', NULL),
(216, 0, 1390393234, 'enrol_manual', 'enrolperiod', '0', NULL),
(217, 0, 1390393234, 'enrol_paypal', 'paypalbusiness', '', NULL),
(218, 0, 1390393234, 'enrol_paypal', 'mailstudents', '0', NULL),
(219, 0, 1390393234, 'enrol_paypal', 'mailteachers', '0', NULL),
(220, 0, 1390393234, 'enrol_paypal', 'mailadmins', '0', NULL),
(221, 0, 1390393234, 'enrol_paypal', 'status', '1', NULL),
(222, 0, 1390393234, 'enrol_paypal', 'cost', '0', NULL),
(223, 0, 1390393234, 'enrol_paypal', 'currency', 'USD', NULL),
(224, 0, 1390393234, 'enrol_paypal', 'enrolperiod', '0', NULL),
(225, 0, 1390393234, 'enrol_self', 'requirepassword', '0', NULL),
(226, 0, 1390393234, 'enrol_self', 'usepasswordpolicy', '0', NULL),
(227, 0, 1390393234, 'enrol_self', 'showhint', '0', NULL),
(228, 0, 1390393234, 'enrol_self', 'defaultenrol', '1', NULL),
(229, 0, 1390393234, 'enrol_self', 'status', '1', NULL),
(230, 0, 1390393234, 'enrol_self', 'groupkey', '0', NULL),
(231, 0, 1390393234, 'enrol_self', 'enrolperiod', '0', NULL),
(232, 0, 1390393234, 'enrol_self', 'longtimenosee', '0', NULL),
(233, 0, 1390393234, 'enrol_self', 'maxenrolled', '0', NULL),
(234, 0, 1390393234, 'enrol_self', 'sendcoursewelcomemessage', '1', NULL),
(235, 0, 1390393234, 'editor_tinymce', 'spellengine', 'GoogleSpell', NULL),
(236, 0, 1390393234, 'editor_tinymce', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv', NULL),
(237, 0, 1390393234, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings', NULL),
(238, 0, 1390393234, NULL, 'sitedefaultlicense', 'allrightsreserved', NULL),
(239, 0, 1390393234, NULL, 'cachetext', '60', NULL),
(240, 0, 1390393234, NULL, 'filteruploadedfiles', '0', NULL),
(241, 0, 1390393234, NULL, 'filtermatchoneperpage', '0', NULL),
(242, 0, 1390393234, NULL, 'filtermatchonepertext', '0', NULL),
(243, 0, 1390393234, 'filter_urltolink', 'formats', '0', NULL),
(244, 0, 1390393234, 'filter_urltolink', 'embedimages', '1', NULL),
(245, 0, 1390393234, 'filter_emoticon', 'formats', '1,4,0', NULL),
(246, 0, 1390393234, NULL, 'filter_multilang_force_old', '0', NULL),
(247, 0, 1390393234, NULL, 'filter_tex_latexpreamble', '\\usepackage[latin1]{inputenc}\n\\usepackage{amsmath}\n\\usepackage{amsfonts}\n\\RequirePackage{amsmath,amssymb,latexsym}\n', NULL),
(248, 0, 1390393234, NULL, 'filter_tex_latexbackground', '#FFFFFF', NULL),
(249, 0, 1390393234, NULL, 'filter_tex_density', '120', NULL),
(250, 0, 1390393234, NULL, 'filter_tex_pathlatex', '"c:\\texmf\\miktex\\bin\\latex.exe" ', NULL),
(251, 0, 1390393234, NULL, 'filter_tex_pathdvips', '"c:\\texmf\\miktex\\bin\\dvips.exe" ', NULL),
(252, 0, 1390393234, NULL, 'filter_tex_pathconvert', '"c:\\imagemagick\\convert.exe" ', NULL),
(253, 0, 1390393234, NULL, 'filter_tex_convertformat', 'gif', NULL),
(254, 0, 1390393234, NULL, 'filter_censor_badwords', '', NULL),
(255, 0, 1390393234, NULL, 'portfolio_moderate_filesize_threshold', '1048576', NULL),
(256, 0, 1390393234, NULL, 'portfolio_high_filesize_threshold', '5242880', NULL),
(257, 0, 1390393234, NULL, 'portfolio_moderate_db_threshold', '20', NULL),
(258, 0, 1390393234, NULL, 'portfolio_high_db_threshold', '50', NULL),
(259, 0, 1390393234, NULL, 'repositorycacheexpire', '120', NULL),
(260, 0, 1390393234, NULL, 'repositoryallowexternallinks', '1', NULL),
(261, 0, 1390393234, NULL, 'legacyfilesinnewcourses', '0', NULL),
(262, 0, 1390393234, NULL, 'enablewsdocumentation', '0', NULL),
(263, 0, 1390393234, NULL, 'allowbeforeblock', '0', NULL),
(264, 0, 1390393234, NULL, 'allowedip', '', NULL),
(265, 0, 1390393234, NULL, 'blockedip', '', NULL),
(266, 0, 1390393234, NULL, 'protectusernames', '1', NULL),
(267, 0, 1390393234, NULL, 'forcelogin', '0', NULL),
(268, 0, 1390393234, NULL, 'forceloginforprofiles', '1', NULL),
(269, 0, 1390393234, NULL, 'forceloginforprofileimage', '0', NULL),
(270, 0, 1390393234, NULL, 'opentogoogle', '0', NULL),
(271, 0, 1390393234, NULL, 'maxbytes', '0', NULL),
(272, 0, 1390393234, NULL, 'userquota', '104857600', NULL),
(273, 0, 1390393234, NULL, 'allowobjectembed', '0', NULL),
(274, 0, 1390393234, NULL, 'enabletrusttext', '0', NULL),
(275, 0, 1390393234, NULL, 'maxeditingtime', '1800', NULL),
(276, 0, 1390393234, NULL, 'fullnamedisplay', 'language', NULL),
(277, 0, 1390393234, NULL, 'extendedusernamechars', '0', NULL),
(278, 0, 1390393234, NULL, 'sitepolicy', '', NULL),
(279, 0, 1390393234, NULL, 'sitepolicyguest', '', NULL),
(280, 0, 1390393234, NULL, 'keeptagnamecase', '1', NULL),
(281, 0, 1390393234, NULL, 'profilesforenrolledusersonly', '1', NULL),
(282, 0, 1390393234, NULL, 'cronclionly', '0', NULL),
(283, 0, 1390393234, NULL, 'cronremotepassword', '', NULL),
(284, 0, 1390393234, NULL, 'passwordpolicy', '1', NULL),
(285, 0, 1390393234, NULL, 'minpasswordlength', '8', NULL),
(286, 0, 1390393234, NULL, 'minpassworddigits', '1', NULL),
(287, 0, 1390393234, NULL, 'minpasswordlower', '1', NULL),
(288, 0, 1390393234, NULL, 'minpasswordupper', '1', NULL),
(289, 0, 1390393234, NULL, 'minpasswordnonalphanum', '1', NULL),
(290, 0, 1390393234, NULL, 'maxconsecutiveidentchars', '0', NULL),
(291, 0, 1390393234, NULL, 'groupenrolmentkeypolicy', '1', NULL),
(292, 0, 1390393234, NULL, 'disableuserimages', '0', NULL),
(293, 0, 1390393234, NULL, 'emailchangeconfirmation', '1', NULL),
(294, 0, 1390393234, NULL, 'rememberusername', '2', NULL),
(295, 0, 1390393234, NULL, 'strictformsrequired', '0', NULL),
(296, 0, 1390393234, NULL, 'loginhttps', '0', NULL),
(297, 0, 1390393234, NULL, 'cookiesecure', '0', NULL),
(298, 0, 1390393234, NULL, 'cookiehttponly', '0', NULL),
(299, 0, 1390393234, NULL, 'allowframembedding', '0', NULL),
(300, 0, 1390393234, NULL, 'loginpasswordautocomplete', '0', NULL),
(301, 0, 1390393234, NULL, 'displayloginfailures', '', NULL),
(302, 0, 1390393234, NULL, 'notifyloginfailures', '', NULL),
(303, 0, 1390393234, NULL, 'notifyloginthreshold', '10', NULL),
(304, 0, 1390393234, NULL, 'runclamonupload', '0', NULL),
(305, 0, 1390393234, NULL, 'pathtoclam', '', NULL),
(306, 0, 1390393234, NULL, 'quarantinedir', '', NULL),
(307, 0, 1390393234, NULL, 'clamfailureonupload', 'donothing', NULL),
(308, 0, 1390393234, NULL, 'themelist', '', NULL),
(309, 0, 1390393234, NULL, 'themedesignermode', '0', NULL),
(310, 0, 1390393234, NULL, 'allowuserthemes', '0', NULL),
(311, 0, 1390393234, NULL, 'allowcoursethemes', '0', NULL),
(312, 0, 1390393234, NULL, 'allowcategorythemes', '0', NULL),
(313, 0, 1390393234, NULL, 'allowthemechangeonurl', '0', NULL),
(314, 0, 1390393234, NULL, 'allowuserblockhiding', '1', NULL),
(315, 0, 1390393234, NULL, 'allowblockstodock', '1', NULL),
(316, 0, 1390393234, NULL, 'custommenuitems', '', NULL),
(317, 0, 1390393234, NULL, 'enabledevicedetection', '1', NULL),
(318, 0, 1390393234, NULL, 'devicedetectregex', '[]', NULL),
(319, 0, 1390393234, 'theme_afterburner', 'logo', '', NULL),
(320, 0, 1390393234, 'theme_afterburner', 'footnote', '', NULL),
(321, 0, 1390393234, 'theme_afterburner', 'customcss', '', NULL),
(322, 0, 1390393234, 'theme_arialist', 'logo', '', NULL),
(323, 0, 1390393234, 'theme_arialist', 'tagline', '', NULL),
(324, 0, 1390393234, 'theme_arialist', 'linkcolor', '#f25f0f', NULL),
(325, 0, 1390393234, 'theme_arialist', 'regionwidth', '250', NULL),
(326, 0, 1390393234, 'theme_arialist', 'customcss', '', NULL),
(327, 0, 1390393234, 'theme_brick', 'logo', '', NULL),
(328, 0, 1390393234, 'theme_brick', 'linkcolor', '#06365b', NULL),
(329, 0, 1390393234, 'theme_brick', 'linkhover', '#5487ad', NULL),
(330, 0, 1390393234, 'theme_brick', 'maincolor', '#8e2800', NULL),
(331, 0, 1390393234, 'theme_brick', 'maincolorlink', '#fff0a5', NULL),
(332, 0, 1390393234, 'theme_brick', 'headingcolor', '#5c3500', NULL),
(333, 0, 1390393234, 'theme_formal_white', 'fontsizereference', '13', NULL),
(334, 0, 1390393234, 'theme_formal_white', 'noframe', '0', NULL),
(335, 0, 1390393234, 'theme_formal_white', 'framemargin', '15', NULL),
(336, 0, 1390393234, 'theme_formal_white', 'headercontent', '1', NULL),
(337, 0, 1390393234, 'theme_formal_white', 'customlogourl', '', NULL),
(338, 0, 1390393234, 'theme_formal_white', 'frontpagelogourl', '', NULL),
(339, 0, 1390393235, 'theme_formal_white', 'headerbgc', '#E3DFD4', NULL),
(340, 0, 1390393235, 'theme_formal_white', 'creditstomoodleorg', '2', NULL),
(341, 0, 1390393235, 'theme_formal_white', 'blockcolumnwidth', '200', NULL),
(342, 0, 1390393235, 'theme_formal_white', 'blockpadding', '8', NULL),
(343, 0, 1390393235, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6', NULL),
(344, 0, 1390393235, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4', NULL),
(345, 0, 1390393235, 'theme_formal_white', 'rblockcolumnbgc', '', NULL),
(346, 0, 1390393235, 'theme_formal_white', 'footnote', '', NULL),
(347, 0, 1390393235, 'theme_formal_white', 'customcss', '', NULL),
(348, 0, 1390393235, 'theme_fusion', 'linkcolor', '#2d83d5', NULL),
(349, 0, 1390393235, 'theme_fusion', 'tagline', '', NULL),
(350, 0, 1390393235, 'theme_fusion', 'footertext', '', NULL),
(351, 0, 1390393235, 'theme_fusion', 'customcss', '', NULL),
(352, 0, 1390393235, 'theme_magazine', 'background', '', NULL),
(353, 0, 1390393235, 'theme_magazine', 'logo', '', NULL),
(354, 0, 1390393235, 'theme_magazine', 'linkcolor', '#32529a', NULL),
(355, 0, 1390393235, 'theme_magazine', 'linkhover', '#4e2300', NULL),
(356, 0, 1390393235, 'theme_magazine', 'maincolor', '#002f2f', NULL),
(357, 0, 1390393235, 'theme_magazine', 'maincoloraccent', '#092323', NULL),
(358, 0, 1390393235, 'theme_magazine', 'headingcolor', '#4e0000', NULL),
(359, 0, 1390393235, 'theme_magazine', 'blockcolor', '#002f2f', NULL),
(360, 0, 1390393235, 'theme_magazine', 'forumback', '#e6e2af', NULL),
(361, 0, 1390393235, 'theme_mymobile', 'colourswatch', 'light', NULL),
(362, 0, 1390393235, 'theme_mymobile', 'showmobileintro', '', NULL),
(363, 0, 1390393235, 'theme_mymobile', 'showsitetopic', 'topicshow', NULL),
(364, 0, 1390393235, 'theme_mymobile', 'showfullsizeimages', 'ithumb', NULL),
(365, 0, 1390393235, 'theme_mymobile', 'usetableview', 'tabshow', NULL),
(366, 0, 1390393235, 'theme_mymobile', 'customcss', '', NULL),
(367, 0, 1390393235, 'theme_nimble', 'tagline', '', NULL),
(368, 0, 1390393235, 'theme_nimble', 'footerline', '', NULL),
(369, 0, 1390393235, 'theme_nimble', 'backgroundcolor', '#454545', NULL),
(370, 0, 1390393235, 'theme_nimble', 'linkcolor', '#2a65b1', NULL),
(371, 0, 1390393235, 'theme_nimble', 'linkhover', '#222222', NULL),
(372, 0, 1390393235, 'theme_nonzero', 'regionprewidth', '200', NULL),
(373, 0, 1390393235, 'theme_nonzero', 'regionpostwidth', '200', NULL),
(374, 0, 1390393235, 'theme_nonzero', 'customcss', '', NULL),
(375, 0, 1390393235, 'theme_overlay', 'linkcolor', '#428ab5', NULL),
(376, 0, 1390393235, 'theme_overlay', 'headercolor', '#2a4c7b', NULL),
(377, 0, 1390393235, 'theme_overlay', 'footertext', '', NULL),
(378, 0, 1390393235, 'theme_overlay', 'customcss', '', NULL),
(379, 0, 1390393235, 'theme_sky_high', 'logo', '', NULL),
(380, 0, 1390393235, 'theme_sky_high', 'regionwidth', '240', NULL),
(381, 0, 1390393235, 'theme_sky_high', 'footnote', '', NULL),
(382, 0, 1390393235, 'theme_sky_high', 'customcss', '', NULL),
(383, 0, 1390393235, 'theme_splash', 'logo', '', NULL),
(384, 0, 1390393235, 'theme_splash', 'tagline', 'Virtual learning center', NULL),
(385, 0, 1390393235, 'theme_splash', 'hide_tagline', '0', NULL),
(386, 0, 1390393235, 'theme_splash', 'footnote', '', NULL),
(387, 0, 1390393235, 'theme_splash', 'customcss', '', NULL),
(388, 0, 1390393235, NULL, 'calendar_adminseesall', '0', NULL),
(389, 0, 1390393235, NULL, 'calendar_site_timeformat', '0', NULL),
(390, 0, 1390393235, NULL, 'calendar_startwday', '0', NULL),
(391, 0, 1390393235, NULL, 'calendar_weekend', '65', NULL),
(392, 0, 1390393235, NULL, 'calendar_lookahead', '21', NULL),
(393, 0, 1390393235, NULL, 'calendar_maxevents', '10', NULL),
(394, 0, 1390393235, NULL, 'enablecalendarexport', '1', NULL),
(395, 0, 1390393235, NULL, 'calendar_exportsalt', '30B2F9WRYPs7eopNqTx58ed7lOaK0zKPlBPmJAzabi8PkSE2RAH4sMH00Net', NULL),
(396, 0, 1390393235, NULL, 'useblogassociations', '1', NULL),
(397, 0, 1390393235, NULL, 'useexternalblogs', '1', NULL),
(398, 0, 1390393235, NULL, 'externalblogcrontime', '86400', NULL),
(399, 0, 1390393235, NULL, 'maxexternalblogsperuser', '1', NULL),
(400, 0, 1390393235, NULL, 'blogusecomments', '1', NULL),
(401, 0, 1390393235, NULL, 'blogshowcommentscount', '1', NULL),
(402, 0, 1390393235, NULL, 'defaulthomepage', '0', NULL),
(403, 0, 1390393235, NULL, 'navshowcategories', '1', NULL),
(404, 0, 1390393235, NULL, 'navshowmycoursecategories', '0', NULL),
(405, 0, 1390393235, NULL, 'navshowallcourses', '0', NULL),
(406, 0, 1390393235, NULL, 'navcourselimit', '20', NULL),
(407, 0, 1390393235, NULL, 'usesitenameforsitepages', '0', NULL),
(408, 0, 1390393235, NULL, 'linkadmincategories', '0', NULL),
(409, 0, 1390393235, NULL, 'navshowfrontpagemods', '1', NULL),
(410, 0, 1390393235, NULL, 'navadduserpostslinks', '1', NULL),
(411, 0, 1390393235, NULL, 'formatstringstriptags', '1', NULL),
(412, 0, 1390393235, NULL, 'emoticons', '[{"text":":-)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":)","imagename":"s\\/smiley","imagecomponent":"core","altidentifier":"smiley","altcomponent":"core_pix"},{"text":":-D","imagename":"s\\/biggrin","imagecomponent":"core","altidentifier":"biggrin","altcomponent":"core_pix"},{"text":";-)","imagename":"s\\/wink","imagecomponent":"core","altidentifier":"wink","altcomponent":"core_pix"},{"text":":-\\/","imagename":"s\\/mixed","imagecomponent":"core","altidentifier":"mixed","altcomponent":"core_pix"},{"text":"V-.","imagename":"s\\/thoughtful","imagecomponent":"core","altidentifier":"thoughtful","altcomponent":"core_pix"},{"text":":-P","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":":-p","imagename":"s\\/tongueout","imagecomponent":"core","altidentifier":"tongueout","altcomponent":"core_pix"},{"text":"B-)","imagename":"s\\/cool","imagecomponent":"core","altidentifier":"cool","altcomponent":"core_pix"},{"text":"^-)","imagename":"s\\/approve","imagecomponent":"core","altidentifier":"approve","altcomponent":"core_pix"},{"text":"8-)","imagename":"s\\/wideeyes","imagecomponent":"core","altidentifier":"wideeyes","altcomponent":"core_pix"},{"text":":o)","imagename":"s\\/clown","imagecomponent":"core","altidentifier":"clown","altcomponent":"core_pix"},{"text":":-(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":":(","imagename":"s\\/sad","imagecomponent":"core","altidentifier":"sad","altcomponent":"core_pix"},{"text":"8-.","imagename":"s\\/shy","imagecomponent":"core","altidentifier":"shy","altcomponent":"core_pix"},{"text":":-I","imagename":"s\\/blush","imagecomponent":"core","altidentifier":"blush","altcomponent":"core_pix"},{"text":":-X","imagename":"s\\/kiss","imagecomponent":"core","altidentifier":"kiss","altcomponent":"core_pix"},{"text":"8-o","imagename":"s\\/surprise","imagecomponent":"core","altidentifier":"surprise","altcomponent":"core_pix"},{"text":"P-|","imagename":"s\\/blackeye","imagecomponent":"core","altidentifier":"blackeye","altcomponent":"core_pix"},{"text":"8-[","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"(grr)","imagename":"s\\/angry","imagecomponent":"core","altidentifier":"angry","altcomponent":"core_pix"},{"text":"xx-P","imagename":"s\\/dead","imagecomponent":"core","altidentifier":"dead","altcomponent":"core_pix"},{"text":"|-.","imagename":"s\\/sleepy","imagecomponent":"core","altidentifier":"sleepy","altcomponent":"core_pix"},{"text":"}-]","imagename":"s\\/evil","imagecomponent":"core","altidentifier":"evil","altcomponent":"core_pix"},{"text":"(h)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(heart)","imagename":"s\\/heart","imagecomponent":"core","altidentifier":"heart","altcomponent":"core_pix"},{"text":"(y)","imagename":"s\\/yes","imagecomponent":"core","altidentifier":"yes","altcomponent":"core"},{"text":"(n)","imagename":"s\\/no","imagecomponent":"core","altidentifier":"no","altcomponent":"core"},{"text":"(martin)","imagename":"s\\/martin","imagecomponent":"core","altidentifier":"martin","altcomponent":"core_pix"},{"text":"( )","imagename":"s\\/egg","imagecomponent":"core","altidentifier":"egg","altcomponent":"core_pix"}]', NULL),
(413, 0, 1390393235, NULL, 'core_media_enable_youtube', '1', NULL),
(414, 0, 1390393235, NULL, 'core_media_enable_vimeo', '0', NULL),
(415, 0, 1390393235, NULL, 'core_media_enable_mp3', '1', NULL),
(416, 0, 1390393235, NULL, 'core_media_enable_flv', '1', NULL),
(417, 0, 1390393235, NULL, 'core_media_enable_swf', '1', NULL),
(418, 0, 1390393235, NULL, 'core_media_enable_html5audio', '1', NULL),
(419, 0, 1390393235, NULL, 'core_media_enable_html5video', '1', NULL),
(420, 0, 1390393235, NULL, 'core_media_enable_qt', '1', NULL),
(421, 0, 1390393235, NULL, 'core_media_enable_wmp', '1', NULL),
(422, 0, 1390393235, NULL, 'core_media_enable_rm', '1', NULL),
(423, 0, 1390393235, NULL, 'docroot', 'http://docs.moodle.org', NULL),
(424, 0, 1390393235, NULL, 'doctonewwindow', '0', NULL),
(425, 0, 1390393235, NULL, 'courselistshortnames', '0', NULL),
(426, 0, 1390393235, NULL, 'enableajax', '1', NULL),
(427, 0, 1390393235, NULL, 'useexternalyui', '0', NULL),
(428, 0, 1390393235, NULL, 'yuicomboloading', '1', NULL),
(429, 0, 1390393235, NULL, 'cachejs', '1', NULL),
(430, 0, 1390393235, NULL, 'modchooserdefault', '1', NULL),
(431, 0, 1390393235, NULL, 'additionalhtmlhead', '', NULL),
(432, 0, 1390393235, NULL, 'additionalhtmltopofbody', '', NULL),
(433, 0, 1390393235, NULL, 'additionalhtmlfooter', '', NULL),
(434, 0, 1390393235, NULL, 'gdversion', '2', NULL),
(435, 0, 1390393235, NULL, 'pathtodu', '', NULL),
(436, 0, 1390393235, NULL, 'aspellpath', '', NULL),
(437, 0, 1390393235, NULL, 'pathtodot', '', NULL),
(438, 0, 1390393235, NULL, 'supportpage', '', NULL),
(439, 0, 1390393235, NULL, 'dbsessions', '1', NULL),
(440, 0, 1390393235, NULL, 'sessioncookie', '', NULL),
(441, 0, 1390393235, NULL, 'sessioncookiepath', '', NULL),
(442, 0, 1390393235, NULL, 'sessioncookiedomain', '', NULL),
(443, 0, 1390393235, NULL, 'statsfirstrun', 'none', NULL),
(444, 0, 1390393235, NULL, 'statsmaxruntime', '0', NULL),
(445, 0, 1390393235, NULL, 'statsruntimedays', '31', NULL),
(446, 0, 1390393235, NULL, 'statsruntimestarthour', '0', NULL),
(447, 0, 1390393235, NULL, 'statsruntimestartminute', '0', NULL),
(448, 0, 1390393235, NULL, 'statsuserthreshold', '0', NULL),
(449, 0, 1390393235, NULL, 'slasharguments', '1', NULL),
(450, 0, 1390393235, NULL, 'getremoteaddrconf', '0', NULL),
(451, 0, 1390393235, NULL, 'proxyhost', '', NULL),
(452, 0, 1390393235, NULL, 'proxyport', '0', NULL),
(453, 0, 1390393235, NULL, 'proxytype', 'HTTP', NULL),
(454, 0, 1390393235, NULL, 'proxyuser', '', NULL),
(455, 0, 1390393235, NULL, 'proxypassword', '', NULL),
(456, 0, 1390393235, NULL, 'proxybypass', 'localhost, 127.0.0.1', NULL),
(457, 0, 1390393235, NULL, 'maintenance_enabled', '0', NULL),
(458, 0, 1390393235, NULL, 'maintenance_message', '', NULL),
(459, 0, 1390393235, NULL, 'deleteunconfirmed', '168', NULL),
(460, 0, 1390393235, NULL, 'deleteincompleteusers', '0', NULL),
(461, 0, 1390393235, NULL, 'logguests', '1', NULL),
(462, 0, 1390393235, NULL, 'loglifetime', '0', NULL),
(463, 0, 1390393235, NULL, 'disablegradehistory', '0', NULL),
(464, 0, 1390393235, NULL, 'gradehistorylifetime', '0', NULL),
(465, 0, 1390393235, NULL, 'numcoursesincombo', '500', NULL),
(466, 0, 1390393235, NULL, 'extramemorylimit', '512M', NULL),
(467, 0, 1390393235, NULL, 'curlcache', '120', NULL),
(468, 0, 1390393235, NULL, 'curltimeoutkbitrate', '56', NULL),
(469, 0, 1390393235, NULL, 'updateautocheck', '1', NULL),
(470, 0, 1390393235, NULL, 'updateminmaturity', '200', NULL),
(471, 0, 1390393235, NULL, 'updatenotifybuilds', '0', NULL),
(472, 0, 1390393235, NULL, 'enablesafebrowserintegration', '0', NULL),
(473, 0, 1390393235, NULL, 'enablegroupmembersonly', '0', NULL),
(474, 0, 1390393235, NULL, 'dndallowtextandlinks', '0', NULL),
(475, 0, 1390393235, NULL, 'enablecssoptimiser', '0', NULL),
(476, 0, 1390393235, NULL, 'debug', '0', NULL),
(477, 0, 1390393235, NULL, 'debugdisplay', '1', NULL),
(478, 0, 1390393235, NULL, 'xmlstrictheaders', '0', NULL),
(479, 0, 1390393235, NULL, 'debugsmtp', '0', NULL),
(480, 0, 1390393235, NULL, 'perfdebug', '7', NULL),
(481, 0, 1390393235, NULL, 'debugstringids', '0', NULL),
(482, 0, 1390393235, NULL, 'debugvalidators', '0', NULL),
(483, 0, 1390393235, NULL, 'debugpageinfo', '0', NULL),
(484, 2, 1390393940, NULL, 'notloggedinroleid', '6', NULL),
(485, 2, 1390393940, NULL, 'guestroleid', '6', NULL),
(486, 2, 1390393940, NULL, 'defaultuserroleid', '7', NULL),
(487, 2, 1390393940, NULL, 'creatornewroleid', '3', NULL),
(488, 2, 1390393940, NULL, 'restorernewroleid', '3', NULL),
(489, 2, 1390393940, NULL, 'gradebookroles', '5', NULL),
(490, 2, 1390393940, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments', NULL),
(491, 2, 1390393940, 'assign', 'showrecentsubmissions', '0', NULL),
(492, 2, 1390393940, 'assign', 'submissionreceipts', '1', NULL),
(493, 2, 1390393940, NULL, 'assignment_maxbytes', '1048576', NULL),
(494, 2, 1390393940, NULL, 'assignment_itemstocount', '1', NULL),
(495, 2, 1390393940, NULL, 'assignment_showrecentsubmissions', '1', NULL),
(496, 2, 1390393940, 'book', 'requiremodintro', '1', NULL),
(497, 2, 1390393940, 'book', 'numberingoptions', '0,1,2,3', NULL),
(498, 2, 1390393940, 'book', 'numbering', '1', NULL),
(499, 2, 1390393940, 'certificate', 'uploadimage', '', NULL),
(500, 2, 1390393940, NULL, 'chat_method', 'ajax', NULL),
(501, 2, 1390393940, NULL, 'chat_refresh_userlist', '10', NULL),
(502, 2, 1390393940, NULL, 'chat_old_ping', '35', NULL),
(503, 2, 1390393940, NULL, 'chat_refresh_room', '5', NULL),
(504, 2, 1390393940, NULL, 'chat_normal_updatemode', 'jsupdate', NULL),
(505, 2, 1390393940, NULL, 'chat_serverhost', 'solin.loc', NULL),
(506, 2, 1390393940, NULL, 'chat_serverip', '127.0.0.1', NULL),
(507, 2, 1390393940, NULL, 'chat_serverport', '9111', NULL),
(508, 2, 1390393940, NULL, 'chat_servermax', '100', NULL),
(509, 2, 1390393940, NULL, 'data_enablerssfeeds', '0', NULL),
(510, 2, 1390393940, NULL, 'feedback_allowfullanonymous', '0', NULL),
(511, 2, 1390393940, 'folder', 'requiremodintro', '1', NULL),
(512, 2, 1390393940, NULL, 'forum_displaymode', '3', NULL),
(513, 2, 1390393940, NULL, 'forum_replytouser', '1', NULL),
(514, 2, 1390393940, NULL, 'forum_shortpost', '300', NULL),
(515, 2, 1390393940, NULL, 'forum_longpost', '600', NULL),
(516, 2, 1390393940, NULL, 'forum_manydiscussions', '100', NULL),
(517, 2, 1390393940, NULL, 'forum_maxbytes', '512000', NULL),
(518, 2, 1390393940, NULL, 'forum_maxattachments', '9', NULL),
(519, 2, 1390393940, NULL, 'forum_trackreadposts', '1', NULL),
(520, 2, 1390393940, NULL, 'forum_oldpostdays', '14', NULL),
(521, 2, 1390393940, NULL, 'forum_usermarksread', '0', NULL),
(522, 2, 1390393940, NULL, 'forum_cleanreadtime', '2', NULL),
(523, 2, 1390393940, NULL, 'digestmailtime', '17', NULL),
(524, 2, 1390393940, NULL, 'forum_enablerssfeeds', '0', NULL),
(525, 2, 1390393940, NULL, 'forum_enabletimedposts', '0', NULL),
(526, 2, 1390393940, NULL, 'glossary_entbypage', '10', NULL),
(527, 2, 1390393940, NULL, 'glossary_dupentries', '0', NULL),
(528, 2, 1390393940, NULL, 'glossary_allowcomments', '0', NULL),
(529, 2, 1390393940, NULL, 'glossary_linkbydefault', '1', NULL),
(530, 2, 1390393940, NULL, 'glossary_defaultapproval', '1', NULL),
(531, 2, 1390393940, NULL, 'glossary_enablerssfeeds', '0', NULL),
(532, 2, 1390393940, NULL, 'glossary_linkentries', '0', NULL),
(533, 2, 1390393940, NULL, 'glossary_casesensitive', '0', NULL),
(534, 2, 1390393940, NULL, 'glossary_fullmatch', '0', NULL),
(535, 2, 1390393940, 'imscp', 'requiremodintro', '1', NULL),
(536, 2, 1390393940, 'imscp', 'keepold', '1', NULL),
(537, 2, 1390393940, 'imscp', 'keepold_adv', '0', NULL),
(538, 2, 1390393940, NULL, 'lesson_slideshowwidth', '640', NULL),
(539, 2, 1390393940, NULL, 'lesson_slideshowheight', '480', NULL),
(540, 2, 1390393940, NULL, 'lesson_slideshowbgcolor', '#FFFFFF', NULL),
(541, 2, 1390393940, NULL, 'lesson_mediawidth', '640', NULL),
(542, 2, 1390393940, NULL, 'lesson_mediaheight', '480', NULL),
(543, 2, 1390393940, NULL, 'lesson_mediaclose', '0', NULL),
(544, 2, 1390393940, NULL, 'lesson_maxhighscores', '10', NULL),
(545, 2, 1390393940, NULL, 'lesson_maxanswers', '4', NULL),
(546, 2, 1390393940, NULL, 'lesson_defaultnextpage', '0', NULL),
(547, 2, 1390393940, 'page', 'requiremodintro', '1', NULL),
(548, 2, 1390393940, 'page', 'displayoptions', '5', NULL),
(549, 2, 1390393940, 'page', 'printheading', '1', NULL),
(550, 2, 1390393940, 'page', 'printheading_adv', '0', NULL),
(551, 2, 1390393940, 'page', 'printintro', '0', NULL),
(552, 2, 1390393940, 'page', 'printintro_adv', '0', NULL),
(553, 2, 1390393940, 'page', 'display', '5', NULL),
(554, 2, 1390393940, 'page', 'display_adv', '1', NULL),
(555, 2, 1390393940, 'page', 'popupwidth', '620', NULL),
(556, 2, 1390393940, 'page', 'popupwidth_adv', '1', NULL),
(557, 2, 1390393940, 'page', 'popupheight', '450', NULL),
(558, 2, 1390393940, 'page', 'popupheight_adv', '1', NULL),
(559, 2, 1390393940, 'quiz', 'timelimit', '0', NULL),
(560, 2, 1390393940, 'quiz', 'timelimit_adv', '0', NULL),
(561, 2, 1390393940, 'quiz', 'overduehandling', 'autoabandon', NULL),
(562, 2, 1390393940, 'quiz', 'overduehandling_adv', '0', NULL),
(563, 2, 1390393940, 'quiz', 'graceperiod', '86400', NULL),
(564, 2, 1390393940, 'quiz', 'graceperiod_adv', '0', NULL),
(565, 2, 1390393940, 'quiz', 'graceperiodmin', '60', NULL),
(566, 2, 1390393940, 'quiz', 'attempts', '0', NULL),
(567, 2, 1390393940, 'quiz', 'attempts_adv', '0', NULL),
(568, 2, 1390393940, 'quiz', 'grademethod', '1', NULL),
(569, 2, 1390393940, 'quiz', 'grademethod_adv', '0', NULL),
(570, 2, 1390393940, 'quiz', 'maximumgrade', '10', NULL),
(571, 2, 1390393940, 'quiz', 'shufflequestions', '0', NULL),
(572, 2, 1390393940, 'quiz', 'shufflequestions_adv', '0', NULL),
(573, 2, 1390393940, 'quiz', 'questionsperpage', '1', NULL),
(574, 2, 1390393940, 'quiz', 'questionsperpage_adv', '0', NULL),
(575, 2, 1390393940, 'quiz', 'navmethod', 'free', NULL),
(576, 2, 1390393940, 'quiz', 'navmethod_adv', '1', NULL),
(577, 2, 1390393940, 'quiz', 'shuffleanswers', '1', NULL),
(578, 2, 1390393940, 'quiz', 'shuffleanswers_adv', '0', NULL),
(579, 2, 1390393940, 'quiz', 'preferredbehaviour', 'deferredfeedback', NULL),
(580, 2, 1390393940, 'quiz', 'attemptonlast', '0', NULL),
(581, 2, 1390393940, 'quiz', 'attemptonlast_adv', '1', NULL),
(582, 2, 1390393940, 'quiz', 'reviewattempt', '69904', NULL),
(583, 2, 1390393940, 'quiz', 'reviewcorrectness', '69904', NULL),
(584, 2, 1390393940, 'quiz', 'reviewmarks', '69904', NULL),
(585, 2, 1390393940, 'quiz', 'reviewspecificfeedback', '69904', NULL),
(586, 2, 1390393940, 'quiz', 'reviewgeneralfeedback', '69904', NULL),
(587, 2, 1390393940, 'quiz', 'reviewrightanswer', '69904', NULL),
(588, 2, 1390393940, 'quiz', 'reviewoverallfeedback', '4368', NULL),
(589, 2, 1390393940, 'quiz', 'showuserpicture', '0', NULL),
(590, 2, 1390393940, 'quiz', 'showuserpicture_adv', '0', NULL),
(591, 2, 1390393940, 'quiz', 'decimalpoints', '2', NULL),
(592, 2, 1390393940, 'quiz', 'decimalpoints_adv', '0', NULL),
(593, 2, 1390393940, 'quiz', 'questiondecimalpoints', '-1', NULL),
(594, 2, 1390393940, 'quiz', 'questiondecimalpoints_adv', '0', NULL),
(595, 2, 1390393940, 'quiz', 'showblocks', '0', NULL),
(596, 2, 1390393940, 'quiz', 'showblocks_adv', '1', NULL),
(597, 2, 1390393940, 'quiz', 'password', '', NULL),
(598, 2, 1390393940, 'quiz', 'password_adv', '0', NULL),
(599, 2, 1390393940, 'quiz', 'subnet', '', NULL),
(600, 2, 1390393940, 'quiz', 'subnet_adv', '0', NULL),
(601, 2, 1390393940, 'quiz', 'delay1', '0', NULL),
(602, 2, 1390393940, 'quiz', 'delay1_adv', '0', NULL),
(603, 2, 1390393940, 'quiz', 'delay2', '0', NULL),
(604, 2, 1390393940, 'quiz', 'delay2_adv', '0', NULL),
(605, 2, 1390393940, 'quiz', 'browsersecurity', '-', NULL),
(606, 2, 1390393940, 'quiz', 'browsersecurity_adv', '1', NULL),
(607, 2, 1390393940, 'resource', 'framesize', '130', NULL),
(608, 2, 1390393940, 'resource', 'requiremodintro', '1', NULL),
(609, 2, 1390393940, 'resource', 'displayoptions', '0,1,4,5,6', NULL),
(610, 2, 1390393940, 'resource', 'printheading', '0', NULL),
(611, 2, 1390393940, 'resource', 'printheading_adv', '0', NULL),
(612, 2, 1390393940, 'resource', 'printintro', '1', NULL),
(613, 2, 1390393940, 'resource', 'printintro_adv', '0', NULL),
(614, 2, 1390393940, 'resource', 'display', '0', NULL),
(615, 2, 1390393940, 'resource', 'display_adv', '0', NULL),
(616, 2, 1390393940, 'resource', 'showsize', '0', NULL),
(617, 2, 1390393940, 'resource', 'showsize_adv', '0', NULL),
(618, 2, 1390393940, 'resource', 'showtype', '0', NULL),
(619, 2, 1390393940, 'resource', 'showtype_adv', '0', NULL),
(620, 2, 1390393940, 'resource', 'popupwidth', '620', NULL),
(621, 2, 1390393940, 'resource', 'popupwidth_adv', '1', NULL),
(622, 2, 1390393940, 'resource', 'popupheight', '450', NULL),
(623, 2, 1390393940, 'resource', 'popupheight_adv', '1', NULL),
(624, 2, 1390393940, 'resource', 'filterfiles', '0', NULL),
(625, 2, 1390393940, 'resource', 'filterfiles_adv', '1', NULL),
(626, 2, 1390393940, 'scorm', 'displaycoursestructure', '0', NULL),
(627, 2, 1390393940, 'scorm', 'displaycoursestructure_adv', '0', NULL),
(628, 2, 1390393940, 'scorm', 'popup', '0', NULL),
(629, 2, 1390393940, 'scorm', 'popup_adv', '0', NULL),
(630, 2, 1390393940, 'scorm', 'framewidth', '100', NULL),
(631, 2, 1390393940, 'scorm', 'framewidth_adv', '1', NULL),
(632, 2, 1390393940, 'scorm', 'frameheight', '500', NULL),
(633, 2, 1390393940, 'scorm', 'frameheight_adv', '1', NULL),
(634, 2, 1390393940, 'scorm', 'winoptgrp_adv', '1', NULL),
(635, 2, 1390393940, 'scorm', 'resizable', '0', NULL),
(636, 2, 1390393940, 'scorm', 'scrollbars', '0', NULL),
(637, 2, 1390393940, 'scorm', 'directories', '0', NULL),
(638, 2, 1390393940, 'scorm', 'location', '0', NULL),
(639, 2, 1390393940, 'scorm', 'menubar', '0', NULL),
(640, 2, 1390393940, 'scorm', 'toolbar', '0', NULL),
(641, 2, 1390393940, 'scorm', 'status', '0', NULL),
(642, 2, 1390393940, 'scorm', 'skipview', '0', NULL),
(643, 2, 1390393940, 'scorm', 'skipview_adv', '1', NULL),
(644, 2, 1390393940, 'scorm', 'hidebrowse', '0', NULL),
(645, 2, 1390393940, 'scorm', 'hidebrowse_adv', '1', NULL),
(646, 2, 1390393940, 'scorm', 'hidetoc', '0', NULL),
(647, 2, 1390393940, 'scorm', 'hidetoc_adv', '1', NULL),
(648, 2, 1390393940, 'scorm', 'hidenav', '0', NULL),
(649, 2, 1390393940, 'scorm', 'hidenav_adv', '0', NULL),
(650, 2, 1390393940, 'scorm', 'grademethod', '1', NULL),
(651, 2, 1390393940, 'scorm', 'grademethod_adv', '0', NULL),
(652, 2, 1390393940, 'scorm', 'maxgrade', '100', NULL),
(653, 2, 1390393940, 'scorm', 'maxgrade_adv', '0', NULL),
(654, 2, 1390393940, 'scorm', 'maxattempt', '0', NULL),
(655, 2, 1390393940, 'scorm', 'maxattempt_adv', '0', NULL),
(656, 2, 1390393940, 'scorm', 'whatgrade', '0', NULL),
(657, 2, 1390393940, 'scorm', 'whatgrade_adv', '0', NULL),
(658, 2, 1390393940, 'scorm', 'displayattemptstatus', '1', NULL),
(659, 2, 1390393940, 'scorm', 'displayattemptstatus_adv', '0', NULL),
(660, 2, 1390393940, 'scorm', 'forcecompleted', '0', NULL),
(661, 2, 1390393940, 'scorm', 'forcecompleted_adv', '1', NULL),
(662, 2, 1390393940, 'scorm', 'forcenewattempt', '0', NULL),
(663, 2, 1390393940, 'scorm', 'forcenewattempt_adv', '1', NULL),
(664, 2, 1390393940, 'scorm', 'lastattemptlock', '0', NULL),
(665, 2, 1390393940, 'scorm', 'lastattemptlock_adv', '1', NULL),
(666, 2, 1390393940, 'scorm', 'auto', '0', NULL),
(667, 2, 1390393940, 'scorm', 'auto_adv', '1', NULL),
(668, 2, 1390393940, 'scorm', 'updatefreq', '0', NULL),
(669, 2, 1390393940, 'scorm', 'updatefreq_adv', '1', NULL),
(670, 2, 1390393940, 'scorm', 'allowtypeexternal', '0', NULL),
(671, 2, 1390393940, 'scorm', 'allowtypelocalsync', '0', NULL),
(672, 2, 1390393940, 'scorm', 'allowtypeimsrepository', '0', NULL),
(673, 2, 1390393940, 'scorm', 'allowtypeexternalaicc', '0', NULL),
(674, 2, 1390393940, 'scorm', 'allowaicchacp', '0', NULL),
(675, 2, 1390393940, 'scorm', 'aicchacptimeout', '30', NULL),
(676, 2, 1390393940, 'scorm', 'aicchacpkeepsessiondata', '1', NULL),
(677, 2, 1390393941, 'scorm', 'forcejavascript', '1', NULL),
(678, 2, 1390393941, 'scorm', 'allowapidebug', '0', NULL),
(679, 2, 1390393941, 'scorm', 'apidebugmask', '.*', NULL),
(680, 2, 1390393941, 'url', 'framesize', '130', NULL),
(681, 2, 1390393941, 'url', 'requiremodintro', '1', NULL),
(682, 2, 1390393941, 'url', 'secretphrase', '', NULL),
(683, 2, 1390393941, 'url', 'rolesinparams', '0', NULL),
(684, 2, 1390393941, 'url', 'displayoptions', '0,1,5,6', NULL),
(685, 2, 1390393941, 'url', 'printheading', '0', NULL),
(686, 2, 1390393941, 'url', 'printheading_adv', '0', NULL),
(687, 2, 1390393941, 'url', 'printintro', '1', NULL),
(688, 2, 1390393941, 'url', 'printintro_adv', '0', NULL),
(689, 2, 1390393941, 'url', 'display', '0', NULL),
(690, 2, 1390393941, 'url', 'display_adv', '0', NULL),
(691, 2, 1390393941, 'url', 'popupwidth', '620', NULL),
(692, 2, 1390393941, 'url', 'popupwidth_adv', '1', NULL),
(693, 2, 1390393941, 'url', 'popupheight', '450', NULL),
(694, 2, 1390393941, 'url', 'popupheight_adv', '1', NULL),
(695, 2, 1390393941, 'workshop', 'grade', '80', NULL),
(696, 2, 1390393941, 'workshop', 'gradinggrade', '20', NULL),
(697, 2, 1390393941, 'workshop', 'gradedecimals', '0', NULL),
(698, 2, 1390393941, 'workshop', 'maxbytes', '0', NULL),
(699, 2, 1390393941, 'workshop', 'strategy', 'accumulative', NULL),
(700, 2, 1390393941, 'workshop', 'examplesmode', '0', NULL),
(701, 2, 1390393941, 'workshopallocation_random', 'numofreviews', '5', NULL),
(702, 2, 1390393941, 'workshopform_numerrors', 'grade0', 'No', NULL),
(703, 2, 1390393941, 'workshopform_numerrors', 'grade1', 'Yes', NULL),
(704, 2, 1390393941, 'workshopeval_best', 'comparison', '5', NULL),
(705, 2, 1390393941, 'assignsubmission_file', 'default', '1', NULL),
(706, 2, 1390393941, 'assignsubmission_file', 'maxbytes', '1048576', NULL),
(707, 2, 1390393941, 'assignsubmission_onlinetext', 'default', '0', NULL),
(708, 2, 1390393941, 'assignsubmission_comments', 'default', '0', NULL),
(709, 2, 1390393941, 'assignfeedback_comments', 'default', '0', NULL),
(710, 2, 1390393941, 'assignfeedback_file', 'default', '0', NULL),
(711, 2, 1390393941, NULL, 'block_course_list_adminview', 'all', NULL),
(712, 2, 1390393941, NULL, 'block_course_list_hideallcourseslink', '0', NULL),
(713, 2, 1390393941, NULL, 'block_online_users_timetosee', '5', NULL),
(714, 2, 1390393941, NULL, 'block_rss_client_num_entries', '5', NULL),
(715, 2, 1390393941, NULL, 'block_rss_client_timeout', '30', NULL),
(716, 2, 1390393941, 'blocks/section_links', 'numsections1', '22', NULL),
(717, 2, 1390393941, 'blocks/section_links', 'incby1', '2', NULL),
(718, 2, 1390393941, 'blocks/section_links', 'numsections2', '40', NULL),
(719, 2, 1390393941, 'blocks/section_links', 'incby2', '5', NULL),
(720, 2, 1390393941, NULL, 'block_tags_showcoursetags', '0', NULL),
(721, 2, 1390393941, NULL, 'jabberhost', '', NULL),
(722, 2, 1390393941, NULL, 'jabberserver', '', NULL),
(723, 2, 1390393941, NULL, 'jabberusername', '', NULL),
(724, 2, 1390393941, NULL, 'jabberpassword', '', NULL),
(725, 2, 1390393941, NULL, 'jabberport', '5222', NULL),
(726, 2, 1390393941, NULL, 'smtphosts', '', NULL),
(727, 2, 1390393941, NULL, 'smtpsecure', '', NULL),
(728, 2, 1390393941, NULL, 'smtpuser', '', NULL),
(729, 2, 1390393941, NULL, 'smtppass', '', NULL),
(730, 2, 1390393941, NULL, 'smtpmaxbulk', '1', NULL),
(731, 2, 1390393941, NULL, 'noreplyaddress', 'noreply@solin.loc', NULL),
(732, 2, 1390393941, NULL, 'sitemailcharset', '0', NULL),
(733, 2, 1390393941, NULL, 'allowusermailcharset', '0', NULL),
(734, 2, 1390393941, NULL, 'mailnewline', 'LF', NULL),
(735, 2, 1390393941, 'enrol_cohort', 'roleid', '5', NULL),
(736, 2, 1390393941, 'enrol_cohort', 'unenrolaction', '0', NULL),
(737, 2, 1390393941, 'enrol_database', 'defaultrole', '5', NULL),
(738, 2, 1390393941, 'enrol_database', 'defaultcategory', '1', NULL),
(739, 2, 1390393941, 'enrol_flatfile', 'map_1', 'manager', NULL),
(740, 2, 1390393941, 'enrol_flatfile', 'map_2', 'coursecreator', NULL),
(741, 2, 1390393941, 'enrol_flatfile', 'map_3', 'editingteacher', NULL),
(742, 2, 1390393941, 'enrol_flatfile', 'map_4', 'teacher', NULL);
INSERT INTO `mdl_config_log` (`id`, `userid`, `timemodified`, `plugin`, `name`, `value`, `oldvalue`) VALUES
(743, 2, 1390393941, 'enrol_flatfile', 'map_5', 'student', NULL),
(744, 2, 1390393941, 'enrol_flatfile', 'map_6', 'guest', NULL),
(745, 2, 1390393941, 'enrol_flatfile', 'map_7', 'user', NULL),
(746, 2, 1390393941, 'enrol_flatfile', 'map_8', 'frontpage', NULL),
(747, 2, 1390393941, 'enrol_imsenterprise', 'imsrolemap01', '5', NULL),
(748, 2, 1390393941, 'enrol_imsenterprise', 'imsrolemap02', '3', NULL),
(749, 2, 1390393941, 'enrol_imsenterprise', 'imsrolemap03', '3', NULL),
(750, 2, 1390393941, 'enrol_imsenterprise', 'imsrolemap04', '5', NULL),
(751, 2, 1390393941, 'enrol_imsenterprise', 'imsrolemap05', '0', NULL),
(752, 2, 1390393941, 'enrol_imsenterprise', 'imsrolemap06', '4', NULL),
(753, 2, 1390393941, 'enrol_imsenterprise', 'imsrolemap07', '0', NULL),
(754, 2, 1390393941, 'enrol_imsenterprise', 'imsrolemap08', '4', NULL),
(755, 2, 1390393941, 'enrol_manual', 'roleid', '5', NULL),
(756, 2, 1390393941, 'enrol_meta', 'nosyncroleids', '', NULL),
(757, 2, 1390393941, 'enrol_meta', 'syncall', '1', NULL),
(758, 2, 1390393941, 'enrol_meta', 'unenrolaction', '0', NULL),
(759, 2, 1390393941, 'enrol_mnet', 'roleid', '5', NULL),
(760, 2, 1390393941, 'enrol_mnet', 'roleid_adv', '1', NULL),
(761, 2, 1390393941, 'enrol_paypal', 'roleid', '5', NULL),
(762, 2, 1390393941, 'enrol_self', 'roleid', '5', NULL),
(763, 2, 1390393941, NULL, 'profileroles', '5,4,3', NULL),
(764, 2, 1390393941, NULL, 'coursecontact', '3', NULL),
(765, 2, 1390393941, NULL, 'frontpage', '1', NULL),
(766, 2, 1390393941, NULL, 'frontpageloggedin', '1', NULL),
(767, 2, 1390393941, NULL, 'maxcategorydepth', '0', NULL),
(768, 2, 1390393941, NULL, 'commentsperpage', '15', NULL),
(769, 2, 1390393941, NULL, 'coursesperpage', '20', NULL),
(770, 2, 1390393941, NULL, 'defaultfrontpageroleid', '8', NULL),
(771, 2, 1390393941, NULL, 'supportname', 'Admin User', NULL),
(772, 2, 1390393941, NULL, 'supportemail', 'alexander.zhuravlev@intosoft.by', NULL),
(773, 2, 1390393972, NULL, 'registerauth', 'email', NULL),
(774, 2, 1390568024, NULL, 'registerauth', 'intake', ''),
(775, 2, 1390571371, NULL, 'guestloginbutton', '0', '1'),
(776, 2, 1390922329, 'moodlecourse', 'groupmode', '2', '0'),
(777, 2, 1390923852, NULL, 'enablebadges', '1', NULL),
(778, 2, 1390923852, NULL, 'maxusersperpage', '100', NULL),
(779, 2, 1390923852, NULL, 'gravatardefaulturl', 'mm', NULL),
(780, 2, 1390923852, NULL, 'requestcategoryselection', '0', NULL),
(781, 2, 1390923852, 'backup', 'backup_general_badges', '1', NULL),
(782, 2, 1390923852, 'backup', 'backup_general_badges_locked', '0', NULL),
(783, 2, 1390923852, 'backup', 'import_general_maxresults', '10', NULL),
(784, 2, 1390923852, 'backup', 'backup_auto_skip_hidden', '1', NULL),
(785, 2, 1390923852, 'backup', 'backup_auto_skip_modif_days', '30', NULL),
(786, 2, 1390923852, 'backup', 'backup_auto_skip_modif_prev', '0', NULL),
(787, 2, 1390923852, 'backup', 'backup_auto_badges', '1', NULL),
(788, 2, 1390923852, NULL, 'grade_export_userprofilefields', 'firstname,lastname,idnumber,institution,department,email', NULL),
(789, 2, 1390923852, NULL, 'grade_export_customprofilefields', '', NULL),
(790, 2, 1390923852, NULL, 'grade_report_showonlyactiveenrol', '1', NULL),
(791, 2, 1390923852, NULL, 'badges_defaultissuername', 'Solin', NULL),
(792, 2, 1390923852, NULL, 'badges_defaultissuercontact', 'alexander.zhuravlev@intosoft.by', NULL),
(793, 2, 1390923852, NULL, 'badges_badgesalt', 'badges1390393232', NULL),
(794, 2, 1390923852, NULL, 'badges_allowexternalbackpack', '1', NULL),
(795, 2, 1390923852, NULL, 'badges_allowcoursebadges', '1', NULL),
(796, 2, 1390923852, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.', NULL),
(797, 2, 1390923852, 'assign', 'requiresubmissionstatement', '0', NULL),
(798, 2, 1390923852, 'label', 'dndmedia', '1', NULL),
(799, 2, 1390923852, 'label', 'dndresizewidth', '400', NULL),
(800, 2, 1390923852, 'label', 'dndresizeheight', '400', NULL),
(801, 2, 1390923852, 'quiz', 'autosaveperiod', '0', NULL),
(802, 2, 1390923852, 'assignfeedback_offline', 'default', '0', NULL),
(803, 2, 1390923852, 'block_course_overview', 'defaultmaxcourses', '10', NULL),
(804, 2, 1390923852, 'block_course_overview', 'forcedefaultmaxcourses', '0', NULL),
(805, 2, 1390923852, 'block_course_overview', 'showchildren', '0', NULL),
(806, 2, 1390923852, 'block_course_overview', 'showwelcomearea', '0', NULL),
(807, 2, 1390923852, NULL, 'block_html_allowcssclasses', '0', NULL),
(808, 2, 1390923852, 'enrol_flatfile', 'encoding', 'UTF-8', NULL),
(809, 2, 1390923852, 'enrol_flatfile', 'unenrolaction', '3', NULL),
(810, 2, 1390923852, 'enrol_flatfile', 'expiredaction', '3', NULL),
(811, 2, 1390923852, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode', NULL),
(812, 2, 1390923852, 'enrol_imsenterprise', 'imscoursemapfullname', 'short', NULL),
(813, 2, 1390923852, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore', NULL),
(814, 2, 1390923852, 'enrol_manual', 'expiredaction', '1', NULL),
(815, 2, 1390923853, 'enrol_manual', 'expirynotifyhour', '6', NULL),
(816, 2, 1390923853, 'enrol_manual', 'expirynotify', '0', NULL),
(817, 2, 1390923853, 'enrol_manual', 'expirythreshold', '86400', NULL),
(818, 2, 1390923853, 'enrol_paypal', 'expiredaction', '3', NULL),
(819, 2, 1390923853, 'enrol_self', 'expiredaction', '1', NULL),
(820, 2, 1390923853, 'enrol_self', 'expirynotifyhour', '6', NULL),
(821, 2, 1390923853, 'enrol_self', 'newenrols', '1', NULL),
(822, 2, 1390923853, 'enrol_self', 'expirynotify', '0', NULL),
(823, 2, 1390923853, 'enrol_self', 'expirythreshold', '86400', NULL),
(824, 2, 1390923853, 'editor_tinymce', 'customtoolbar', 'fontselect,fontsizeselect,formatselect,|,undo,redo,|,search,replace,|,fullscreen\r\n\r\nbold,italic,underline,strikethrough,sub,sup,|,justifyleft,justifycenter,justifyright,|,cleanup,removeformat,pastetext,pasteword,|,forecolor,backcolor,|,ltr,rtl\r\n\r\nbullist,numlist,outdent,indent,|,link,unlink,|,image,nonbreaking,charmap,table,|,code', NULL),
(825, 2, 1390923853, 'editor_tinymce', 'customconfig', '', NULL),
(826, 2, 1390923853, 'tinymce_dragmath', 'requiretex', '1', NULL),
(827, 2, 1390923853, 'tinymce_moodleemoticon', 'requireemoticon', '1', NULL),
(828, 2, 1390923853, NULL, 'mobilecssurl', '', NULL),
(829, 2, 1390923853, 'question_preview', 'behaviour', 'deferredfeedback', NULL),
(830, 2, 1390923853, 'question_preview', 'correctness', '1', NULL),
(831, 2, 1390923853, 'question_preview', 'marks', '1', NULL),
(832, 2, 1390923853, 'question_preview', 'markdp', '2', NULL),
(833, 2, 1390923853, 'question_preview', 'feedback', '1', NULL),
(834, 2, 1390923853, 'question_preview', 'generalfeedback', '1', NULL),
(835, 2, 1390923853, 'question_preview', 'rightanswer', '1', NULL),
(836, 2, 1390923853, 'question_preview', 'history', '0', NULL),
(837, 2, 1390923853, 'cachestore_memcache', 'testservers', '', NULL),
(838, 2, 1390923853, 'cachestore_memcached', 'testservers', '', NULL),
(839, 2, 1390923853, 'cachestore_mongodb', 'testserver', '', NULL),
(840, 2, 1390923853, NULL, 'lockoutthreshold', '0', NULL),
(841, 2, 1390923853, NULL, 'lockoutwindow', '1800', NULL),
(842, 2, 1390923853, NULL, 'lockoutduration', '1800', NULL),
(843, 2, 1390923853, 'theme_anomaly', 'tagline', '', NULL),
(844, 2, 1390923853, 'theme_anomaly', 'customcss', '', NULL),
(845, 2, 1390923853, 'theme_clean', 'invert', '0', NULL),
(846, 2, 1390923853, 'theme_clean', 'logo', '', NULL),
(847, 2, 1390923853, 'theme_clean', 'customcss', '', NULL),
(848, 2, 1390923853, 'theme_clean', 'footnote', '', NULL),
(849, 2, 1390923853, NULL, 'calendar_customexport', '1', NULL),
(850, 2, 1390923853, NULL, 'calendar_exportlookahead', '365', NULL),
(851, 2, 1390923853, NULL, 'calendar_exportlookback', '5', NULL),
(852, 2, 1390923853, NULL, 'calendar_showicalsource', '1', NULL),
(853, 2, 1390923853, NULL, 'allowguestmymoodle', '1', NULL),
(854, 2, 1390923853, NULL, 'navshowfullcoursenames', '0', NULL),
(855, 2, 1390923853, NULL, 'navsortmycoursessort', 'sortorder', NULL),
(856, 2, 1390923853, NULL, 'courseswithsummarieslimit', '10', NULL),
(857, 2, 1390923853, NULL, 'courseoverviewfileslimit', '1', NULL),
(858, 2, 1390923853, NULL, 'courseoverviewfilesext', '.jpg,.gif,.png', NULL),
(859, 2, 1390923853, NULL, 'frontpagecourselimit', '200', NULL),
(860, 2, 1390923853, NULL, 'updateautodeploy', '0', NULL),
(861, 2, 1390992531, NULL, 'completiondefault', '1', NULL),
(862, 2, 1390992531, 'backup', 'backup_general_questionbank', '1', NULL),
(863, 2, 1390992531, 'backup', 'backup_general_questionbank_locked', '', NULL),
(864, 2, 1390992531, 'backup', 'backup_auto_questionbank', '1', NULL),
(865, 2, 1390992531, 'assign', 'alwaysshowdescription', '1', NULL),
(866, 2, 1390992531, 'assign', 'alwaysshowdescription_adv', '', NULL),
(867, 2, 1390992531, 'assign', 'alwaysshowdescription_locked', '', NULL),
(868, 2, 1390992531, 'assign', 'allowsubmissionsfromdate', '0', NULL),
(869, 2, 1390992531, 'assign', 'allowsubmissionsfromdate_enabled', '1', NULL),
(870, 2, 1390992531, 'assign', 'allowsubmissionsfromdate_adv', '', NULL),
(871, 2, 1390992531, 'assign', 'duedate', '604800', NULL),
(872, 2, 1390992531, 'assign', 'duedate_enabled', '1', NULL),
(873, 2, 1390992531, 'assign', 'duedate_adv', '', NULL),
(874, 2, 1390992531, 'assign', 'cutoffdate', '1209600', NULL),
(875, 2, 1390992531, 'assign', 'cutoffdate_enabled', '', NULL),
(876, 2, 1390992531, 'assign', 'cutoffdate_adv', '', NULL),
(877, 2, 1390992531, 'assign', 'submissiondrafts', '0', NULL),
(878, 2, 1390992531, 'assign', 'submissiondrafts_adv', '', NULL),
(879, 2, 1390992531, 'assign', 'submissiondrafts_locked', '', NULL),
(880, 2, 1390992531, 'assign', 'attemptreopenmethod', 'none', NULL),
(881, 2, 1390992531, 'assign', 'attemptreopenmethod_adv', '', NULL),
(882, 2, 1390992531, 'assign', 'attemptreopenmethod_locked', '', NULL),
(883, 2, 1390992531, 'assign', 'maxattempts', '-1', NULL),
(884, 2, 1390992531, 'assign', 'maxattempts_adv', '', NULL),
(885, 2, 1390992531, 'assign', 'maxattempts_locked', '', NULL),
(886, 2, 1390992531, 'assign', 'teamsubmission', '0', NULL),
(887, 2, 1390992531, 'assign', 'teamsubmission_adv', '', NULL),
(888, 2, 1390992531, 'assign', 'teamsubmission_locked', '', NULL),
(889, 2, 1390992531, 'assign', 'requireallteammemberssubmit', '0', NULL),
(890, 2, 1390992531, 'assign', 'requireallteammemberssubmit_adv', '', NULL),
(891, 2, 1390992531, 'assign', 'requireallteammemberssubmit_locked', '', NULL),
(892, 2, 1390992531, 'assign', 'teamsubmissiongroupingid', '', NULL),
(893, 2, 1390992531, 'assign', 'teamsubmissiongroupingid_adv', '', NULL),
(894, 2, 1390992531, 'assign', 'sendnotifications', '0', NULL),
(895, 2, 1390992531, 'assign', 'sendnotifications_adv', '', NULL),
(896, 2, 1390992531, 'assign', 'sendnotifications_locked', '', NULL),
(897, 2, 1390992531, 'assign', 'sendlatenotifications', '0', NULL),
(898, 2, 1390992531, 'assign', 'sendlatenotifications_adv', '', NULL),
(899, 2, 1390992531, 'assign', 'sendlatenotifications_locked', '', NULL),
(900, 2, 1390992531, 'assign', 'blindmarking', '0', NULL),
(901, 2, 1390992531, 'assign', 'blindmarking_adv', '', NULL),
(902, 2, 1390992531, 'assign', 'blindmarking_locked', '', NULL),
(903, 2, 1390992531, 'assign', 'markingworkflow', '0', NULL),
(904, 2, 1390992531, 'assign', 'markingworkflow_adv', '', NULL),
(905, 2, 1390992531, 'assign', 'markingworkflow_locked', '', NULL),
(906, 2, 1390992531, 'assign', 'markingallocation', '0', NULL),
(907, 2, 1390992531, 'assign', 'markingallocation_adv', '', NULL),
(908, 2, 1390992531, 'assign', 'markingallocation_locked', '', NULL),
(909, 2, 1390992531, 'assignfeedback_editpdf', 'stamps', '/cross.png', NULL),
(910, 2, 1390992531, 'assignfeedback_editpdf', 'gspath', 'C:\\gs\\gs910\\bin\\', NULL),
(911, 2, 1390992531, NULL, 'forum_trackingtype', '1', NULL),
(912, 2, 1390992531, NULL, 'forum_allowforcedreadtracking', '0', NULL),
(913, 2, 1390992531, 'scorm', 'nav', '1', NULL),
(914, 2, 1390992531, 'scorm', 'nav_adv', '', '0'),
(915, 2, 1390992531, 'scorm', 'navpositionleft', '-100', NULL),
(916, 2, 1390992531, 'scorm', 'navpositionleft_adv', '1', NULL),
(917, 2, 1390992532, 'scorm', 'navpositiontop', '-100', NULL),
(918, 2, 1390992532, 'scorm', 'navpositiontop_adv', '1', NULL),
(919, 2, 1390992532, 'scorm', 'collapsetocwinsize', '767', NULL),
(920, 2, 1390992532, 'scorm', 'collapsetocwinsize_adv', '1', NULL),
(921, 2, 1390992532, 'format_singleactivity', 'activitytype', 'forum', NULL),
(922, 2, 1390992532, NULL, 'allowattachments', '1', NULL),
(923, 2, 1390992532, NULL, 'legacyfilesaddallowed', '1', NULL),
(924, 2, 1390992532, NULL, 'pwresettime', '1800', NULL),
(925, 2, 1390992532, 'theme_formal_white', 'trendcolor', 'mink', NULL),
(926, 2, 1390992532, NULL, 'modeditingmenu', '1', NULL),
(927, 2, 1390992532, NULL, 'blockeditingmenu', '1', NULL),
(928, 2, 1390992532, NULL, 'enabletgzbackups', '0', NULL),
(929, 2, 1390992871, NULL, 'registerauth', '', 'intake'),
(930, 2, 1390992880, NULL, 'registerauth', 'intake', ''),
(931, 2, 1391001221, NULL, 'debug', '32767', '0'),
(932, 2, 1391087384, NULL, 'registerauth', '', 'intake'),
(933, 2, 1391087413, NULL, 'registerauth', 'intake', ''),
(934, 2, 1391090517, NULL, 'registerauth', 'email', 'intake'),
(935, 2, 1391090595, NULL, 'registerauth', 'intake', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_config_plugins`
--

CREATE TABLE IF NOT EXISTS `mdl_config_plugins` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(100) NOT NULL DEFAULT 'core',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_confplug_plunam_uix` (`plugin`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Moodle modules and plugins configuration variables' AUTO_INCREMENT=1106 ;

--
-- Dumping data for table `mdl_config_plugins`
--

INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1, 'moodlecourse', 'format', 'weeks'),
(2, 'moodlecourse', 'maxsections', '52'),
(3, 'moodlecourse', 'numsections', '10'),
(4, 'moodlecourse', 'hiddensections', '0'),
(5, 'moodlecourse', 'newsitems', '5'),
(6, 'moodlecourse', 'showgrades', '1'),
(7, 'moodlecourse', 'showreports', '0'),
(8, 'moodlecourse', 'maxbytes', '52428800'),
(9, 'moodlecourse', 'coursedisplay', '0'),
(10, 'moodlecourse', 'groupmode', '2'),
(11, 'moodlecourse', 'groupmodeforce', '0'),
(12, 'moodlecourse', 'visible', '1'),
(13, 'moodlecourse', 'lang', ''),
(14, 'moodlecourse', 'enablecompletion', '0'),
(15, 'moodlecourse', 'completionstartonenrol', '0'),
(16, 'backup', 'loglifetime', '30'),
(17, 'backup', 'backup_general_users', '1'),
(18, 'backup', 'backup_general_users_locked', '0'),
(19, 'backup', 'backup_general_anonymize', '0'),
(20, 'backup', 'backup_general_anonymize_locked', '0'),
(21, 'backup', 'backup_general_role_assignments', '1'),
(22, 'backup', 'backup_general_role_assignments_locked', '0'),
(23, 'backup', 'backup_general_activities', '1'),
(24, 'backup', 'backup_general_activities_locked', '0'),
(25, 'backup', 'backup_general_blocks', '1'),
(26, 'backup', 'backup_general_blocks_locked', '0'),
(27, 'backup', 'backup_general_filters', '1'),
(28, 'backup', 'backup_general_filters_locked', '0'),
(29, 'backup', 'backup_general_comments', '1'),
(30, 'backup', 'backup_general_comments_locked', '0'),
(31, 'backup', 'backup_general_userscompletion', '1'),
(32, 'backup', 'backup_general_userscompletion_locked', '0'),
(33, 'backup', 'backup_general_logs', '0'),
(34, 'backup', 'backup_general_logs_locked', '0'),
(35, 'backup', 'backup_general_histories', '0'),
(36, 'backup', 'backup_general_histories_locked', '0'),
(37, 'backup', 'backup_auto_active', '0'),
(38, 'backup', 'backup_auto_weekdays', '0000000'),
(39, 'backup', 'backup_auto_hour', '0'),
(40, 'backup', 'backup_auto_minute', '0'),
(41, 'backup', 'backup_auto_storage', '0'),
(42, 'backup', 'backup_auto_destination', ''),
(43, 'backup', 'backup_auto_keep', '1'),
(44, 'backup', 'backup_shortname', '0'),
(45, 'backup', 'backup_auto_users', '1'),
(46, 'backup', 'backup_auto_role_assignments', '1'),
(47, 'backup', 'backup_auto_activities', '1'),
(48, 'backup', 'backup_auto_blocks', '1'),
(49, 'backup', 'backup_auto_filters', '1'),
(50, 'backup', 'backup_auto_comments', '1'),
(51, 'backup', 'backup_auto_userscompletion', '1'),
(52, 'backup', 'backup_auto_logs', '0'),
(53, 'backup', 'backup_auto_histories', '0'),
(54, 'enrol_database', 'dbtype', ''),
(55, 'enrol_database', 'dbhost', 'localhost'),
(56, 'enrol_database', 'dbuser', ''),
(57, 'enrol_database', 'dbpass', ''),
(58, 'enrol_database', 'dbname', ''),
(59, 'enrol_database', 'dbencoding', 'utf-8'),
(60, 'enrol_database', 'dbsetupsql', ''),
(61, 'enrol_database', 'dbsybasequoting', '0'),
(62, 'enrol_database', 'debugdb', '0'),
(63, 'enrol_database', 'localcoursefield', 'idnumber'),
(64, 'enrol_database', 'localuserfield', 'idnumber'),
(65, 'enrol_database', 'localrolefield', 'shortname'),
(66, 'enrol_database', 'localcategoryfield', 'id'),
(67, 'enrol_database', 'remoteenroltable', ''),
(68, 'enrol_database', 'remotecoursefield', ''),
(69, 'enrol_database', 'remoteuserfield', ''),
(70, 'enrol_database', 'remoterolefield', ''),
(71, 'enrol_database', 'ignorehiddencourses', '0'),
(72, 'enrol_database', 'unenrolaction', '0'),
(73, 'enrol_database', 'newcoursetable', ''),
(74, 'enrol_database', 'newcoursefullname', 'fullname'),
(75, 'enrol_database', 'newcourseshortname', 'shortname'),
(76, 'enrol_database', 'newcourseidnumber', 'idnumber'),
(77, 'enrol_database', 'newcoursecategory', ''),
(78, 'enrol_database', 'templatecourse', ''),
(79, 'enrol_flatfile', 'location', ''),
(80, 'enrol_flatfile', 'mailstudents', '0'),
(81, 'enrol_flatfile', 'mailteachers', '0'),
(82, 'enrol_flatfile', 'mailadmins', '0'),
(83, 'enrol_guest', 'requirepassword', '0'),
(84, 'enrol_guest', 'usepasswordpolicy', '0'),
(85, 'enrol_guest', 'showhint', '0'),
(86, 'enrol_guest', 'defaultenrol', '1'),
(87, 'enrol_guest', 'status', '1'),
(88, 'enrol_guest', 'status_adv', '0'),
(89, 'enrol_imsenterprise', 'imsfilelocation', ''),
(90, 'enrol_imsenterprise', 'logtolocation', ''),
(91, 'enrol_imsenterprise', 'mailadmins', '0'),
(92, 'enrol_imsenterprise', 'createnewusers', '0'),
(93, 'enrol_imsenterprise', 'imsdeleteusers', '0'),
(94, 'enrol_imsenterprise', 'fixcaseusernames', '0'),
(95, 'enrol_imsenterprise', 'fixcasepersonalnames', '0'),
(96, 'enrol_imsenterprise', 'imssourcedidfallback', '0'),
(97, 'enrol_imsenterprise', 'truncatecoursecodes', '0'),
(98, 'enrol_imsenterprise', 'createnewcourses', '0'),
(99, 'enrol_imsenterprise', 'createnewcategories', '0'),
(100, 'enrol_imsenterprise', 'imsunenrol', '0'),
(101, 'enrol_imsenterprise', 'imsrestricttarget', ''),
(102, 'enrol_imsenterprise', 'imscapitafix', '0'),
(103, 'enrol_manual', 'defaultenrol', '1'),
(104, 'enrol_manual', 'status', '0'),
(105, 'enrol_manual', 'enrolperiod', '0'),
(106, 'enrol_paypal', 'paypalbusiness', ''),
(107, 'enrol_paypal', 'mailstudents', '0'),
(108, 'enrol_paypal', 'mailteachers', '0'),
(109, 'enrol_paypal', 'mailadmins', '0'),
(110, 'enrol_paypal', 'status', '1'),
(111, 'enrol_paypal', 'cost', '0'),
(112, 'enrol_paypal', 'currency', 'USD'),
(113, 'enrol_paypal', 'enrolperiod', '0'),
(114, 'enrol_self', 'requirepassword', '0'),
(115, 'enrol_self', 'usepasswordpolicy', '0'),
(116, 'enrol_self', 'showhint', '0'),
(117, 'enrol_self', 'defaultenrol', '1'),
(118, 'enrol_self', 'status', '1'),
(119, 'enrol_self', 'groupkey', '0'),
(120, 'enrol_self', 'enrolperiod', '0'),
(121, 'enrol_self', 'longtimenosee', '0'),
(122, 'enrol_self', 'maxenrolled', '0'),
(123, 'enrol_self', 'sendcoursewelcomemessage', '1'),
(126, 'editor_tinymce', 'fontselectlist', 'Trebuchet=Trebuchet MS,Verdana,Arial,Helvetica,sans-serif;Arial=arial,helvetica,sans-serif;Courier New=courier new,courier,monospace;Georgia=georgia,times new roman,times,serif;Tahoma=tahoma,arial,helvetica,sans-serif;Times New Roman=times new roman,times,serif;Verdana=verdana,arial,helvetica,sans-serif;Impact=impact;Wingdings=wingdings'),
(127, 'filter_urltolink', 'formats', '0'),
(128, 'filter_urltolink', 'embedimages', '1'),
(129, 'filter_emoticon', 'formats', '1,4,0'),
(130, 'theme_afterburner', 'logo', ''),
(131, 'theme_afterburner', 'footnote', ''),
(132, 'theme_afterburner', 'customcss', ''),
(133, 'theme_arialist', 'logo', ''),
(134, 'theme_arialist', 'tagline', ''),
(135, 'theme_arialist', 'linkcolor', '#f25f0f'),
(136, 'theme_arialist', 'regionwidth', '250'),
(137, 'theme_arialist', 'customcss', ''),
(138, 'theme_brick', 'logo', ''),
(139, 'theme_brick', 'linkcolor', '#06365b'),
(140, 'theme_brick', 'linkhover', '#5487ad'),
(141, 'theme_brick', 'maincolor', '#8e2800'),
(142, 'theme_brick', 'maincolorlink', '#fff0a5'),
(143, 'theme_brick', 'headingcolor', '#5c3500'),
(144, 'theme_formal_white', 'fontsizereference', '13'),
(145, 'theme_formal_white', 'noframe', '0'),
(146, 'theme_formal_white', 'framemargin', '15'),
(147, 'theme_formal_white', 'headercontent', '1'),
(148, 'theme_formal_white', 'customlogourl', ''),
(149, 'theme_formal_white', 'frontpagelogourl', ''),
(150, 'theme_formal_white', 'headerbgc', '#E3DFD4'),
(151, 'theme_formal_white', 'creditstomoodleorg', '2'),
(152, 'theme_formal_white', 'blockcolumnwidth', '200'),
(153, 'theme_formal_white', 'blockpadding', '8'),
(154, 'theme_formal_white', 'blockcontentbgc', '#F6F6F6'),
(155, 'theme_formal_white', 'lblockcolumnbgc', '#E3DFD4'),
(156, 'theme_formal_white', 'rblockcolumnbgc', ''),
(157, 'theme_formal_white', 'footnote', ''),
(158, 'theme_formal_white', 'customcss', ''),
(159, 'theme_fusion', 'linkcolor', '#2d83d5'),
(160, 'theme_fusion', 'tagline', ''),
(161, 'theme_fusion', 'footertext', ''),
(162, 'theme_fusion', 'customcss', ''),
(163, 'theme_magazine', 'background', ''),
(164, 'theme_magazine', 'logo', ''),
(165, 'theme_magazine', 'linkcolor', '#32529a'),
(166, 'theme_magazine', 'linkhover', '#4e2300'),
(167, 'theme_magazine', 'maincolor', '#002f2f'),
(168, 'theme_magazine', 'maincoloraccent', '#092323'),
(169, 'theme_magazine', 'headingcolor', '#4e0000'),
(170, 'theme_magazine', 'blockcolor', '#002f2f'),
(171, 'theme_magazine', 'forumback', '#e6e2af'),
(178, 'theme_nimble', 'tagline', ''),
(179, 'theme_nimble', 'footerline', ''),
(180, 'theme_nimble', 'backgroundcolor', '#454545'),
(181, 'theme_nimble', 'linkcolor', '#2a65b1'),
(182, 'theme_nimble', 'linkhover', '#222222'),
(183, 'theme_nonzero', 'regionprewidth', '200'),
(184, 'theme_nonzero', 'regionpostwidth', '200'),
(185, 'theme_nonzero', 'customcss', ''),
(186, 'theme_overlay', 'linkcolor', '#428ab5'),
(187, 'theme_overlay', 'headercolor', '#2a4c7b'),
(188, 'theme_overlay', 'footertext', ''),
(189, 'theme_overlay', 'customcss', ''),
(190, 'theme_sky_high', 'logo', ''),
(191, 'theme_sky_high', 'regionwidth', '240'),
(192, 'theme_sky_high', 'footnote', ''),
(193, 'theme_sky_high', 'customcss', ''),
(194, 'theme_splash', 'logo', ''),
(195, 'theme_splash', 'tagline', 'Virtual learning center'),
(196, 'theme_splash', 'hide_tagline', '0'),
(197, 'theme_splash', 'footnote', ''),
(198, 'theme_splash', 'customcss', ''),
(199, 'qtype_calculated', 'version', '2013110500'),
(200, 'qtype_calculatedmulti', 'version', '2013110500'),
(201, 'qtype_calculatedsimple', 'version', '2013110500'),
(202, 'qtype_description', 'version', '2013110500'),
(203, 'qtype_essay', 'version', '2013110500'),
(204, 'qtype_match', 'version', '2013110500'),
(205, 'qtype_missingtype', 'version', '2013110500'),
(206, 'qtype_multianswer', 'version', '2013110500'),
(207, 'qtype_multichoice', 'version', '2013110500'),
(208, 'qtype_numerical', 'version', '2013110500'),
(209, 'qtype_random', 'version', '2013110500'),
(210, 'qtype_randomsamatch', 'version', '2013110500'),
(211, 'qtype_shortanswer', 'version', '2013110500'),
(212, 'qtype_truefalse', 'version', '2013110500'),
(222, 'auth_cas', 'version', '2013110500'),
(224, 'auth_db', 'version', '2013110500'),
(226, 'auth_email', 'version', '2013110500'),
(227, 'auth_fc', 'version', '2013110500'),
(229, 'auth_imap', 'version', '2013110500'),
(231, 'auth_intake', 'version', '2012102000'),
(233, 'auth_ldap', 'version', '2013110500'),
(235, 'auth_manual', 'version', '2013110500'),
(236, 'auth_mnet', 'version', '2013110500'),
(238, 'auth_nntp', 'version', '2013110500'),
(240, 'auth_nologin', 'version', '2013110500'),
(241, 'auth_none', 'version', '2013110500'),
(242, 'auth_pam', 'version', '2013110500'),
(244, 'auth_pop3', 'version', '2013110500'),
(246, 'auth_radius', 'version', '2013110500'),
(248, 'auth_shibboleth', 'version', '2013110500'),
(250, 'auth_webservice', 'version', '2013110500'),
(252, 'enrol_category', 'version', '2013110500'),
(254, 'enrol_cohort', 'version', '2013110500'),
(255, 'enrol_database', 'version', '2013110500'),
(257, 'enrol_flatfile', 'version', '2013110500'),
(258, 'enrol_guest', 'version', '2013110500'),
(259, 'enrol_imsenterprise', 'version', '2013110500'),
(261, 'enrol_ldap', 'version', '2013110500'),
(263, 'enrol_manual', 'version', '2013110500'),
(265, 'enrol_meta', 'version', '2013110500'),
(267, 'enrol_mnet', 'version', '2013110500'),
(268, 'enrol_paypal', 'version', '2013110500'),
(269, 'enrol_self', 'version', '2013110501'),
(271, 'message_email', 'version', '2013110500'),
(276, 'message', 'email_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(277, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedin', 'email'),
(278, 'message', 'message_provider_enrol_flatfile_flatfile_enrolment_loggedoff', 'email'),
(279, 'message', 'email_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(280, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedin', 'email'),
(281, 'message', 'message_provider_enrol_imsenterprise_imsenterprise_enrolment_loggedoff', 'email'),
(282, 'message', 'email_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(283, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedin', 'email'),
(284, 'message', 'message_provider_enrol_paypal_paypal_enrolment_loggedoff', 'email'),
(285, 'message', 'email_provider_mod_assign_assign_notification_permitted', 'permitted'),
(286, 'message', 'message_provider_mod_assign_assign_notification_loggedin', 'email'),
(287, 'message', 'message_provider_mod_assign_assign_notification_loggedoff', 'email'),
(288, 'message', 'email_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(289, 'message', 'message_provider_mod_assignment_assignment_updates_loggedin', 'email'),
(290, 'message', 'message_provider_mod_assignment_assignment_updates_loggedoff', 'email'),
(291, 'message', 'email_provider_mod_feedback_submission_permitted', 'permitted'),
(292, 'message', 'message_provider_mod_feedback_submission_loggedin', 'email'),
(293, 'message', 'message_provider_mod_feedback_submission_loggedoff', 'email'),
(294, 'message', 'email_provider_mod_feedback_message_permitted', 'permitted'),
(295, 'message', 'message_provider_mod_feedback_message_loggedin', 'email'),
(296, 'message', 'message_provider_mod_feedback_message_loggedoff', 'email'),
(297, 'message', 'email_provider_mod_forum_posts_permitted', 'permitted'),
(298, 'message', 'message_provider_mod_forum_posts_loggedin', 'email'),
(299, 'message', 'message_provider_mod_forum_posts_loggedoff', 'email'),
(300, 'message', 'email_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(301, 'message', 'message_provider_mod_lesson_graded_essay_loggedin', 'email'),
(302, 'message', 'message_provider_mod_lesson_graded_essay_loggedoff', 'email'),
(303, 'message', 'email_provider_mod_quiz_submission_permitted', 'permitted'),
(304, 'message', 'message_provider_mod_quiz_submission_loggedin', 'email'),
(305, 'message', 'message_provider_mod_quiz_submission_loggedoff', 'email'),
(306, 'message', 'email_provider_mod_quiz_confirmation_permitted', 'permitted'),
(307, 'message', 'message_provider_mod_quiz_confirmation_loggedin', 'email'),
(308, 'message', 'message_provider_mod_quiz_confirmation_loggedoff', 'email'),
(309, 'message', 'email_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(310, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedin', 'email'),
(311, 'message', 'message_provider_mod_quiz_attempt_overdue_loggedoff', 'email'),
(312, 'message', 'email_provider_moodle_notices_permitted', 'permitted'),
(313, 'message', 'message_provider_moodle_notices_loggedin', 'email'),
(314, 'message', 'message_provider_moodle_notices_loggedoff', 'email'),
(315, 'message', 'email_provider_moodle_errors_permitted', 'permitted'),
(316, 'message', 'message_provider_moodle_errors_loggedin', 'email'),
(317, 'message', 'message_provider_moodle_errors_loggedoff', 'email'),
(318, 'message', 'email_provider_moodle_availableupdate_permitted', 'permitted'),
(319, 'message', 'message_provider_moodle_availableupdate_loggedin', 'email'),
(320, 'message', 'message_provider_moodle_availableupdate_loggedoff', 'email'),
(321, 'message', 'email_provider_moodle_instantmessage_permitted', 'permitted'),
(322, 'message', 'message_provider_moodle_instantmessage_loggedoff', 'popup,email'),
(323, 'message', 'email_provider_moodle_backup_permitted', 'permitted'),
(324, 'message', 'message_provider_moodle_backup_loggedin', 'email'),
(325, 'message', 'message_provider_moodle_backup_loggedoff', 'email'),
(326, 'message', 'email_provider_moodle_courserequested_permitted', 'permitted'),
(327, 'message', 'message_provider_moodle_courserequested_loggedin', 'email'),
(328, 'message', 'message_provider_moodle_courserequested_loggedoff', 'email'),
(329, 'message', 'email_provider_moodle_courserequestapproved_permitted', 'permitted'),
(330, 'message', 'message_provider_moodle_courserequestapproved_loggedin', 'email'),
(331, 'message', 'message_provider_moodle_courserequestapproved_loggedoff', 'email'),
(332, 'message', 'email_provider_moodle_courserequestrejected_permitted', 'permitted'),
(333, 'message', 'message_provider_moodle_courserequestrejected_loggedin', 'email'),
(334, 'message', 'message_provider_moodle_courserequestrejected_loggedoff', 'email'),
(335, 'message_jabber', 'version', '2013110500'),
(338, 'message', 'jabber_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(339, 'message', 'jabber_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(340, 'message', 'jabber_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(341, 'message', 'jabber_provider_mod_assign_assign_notification_permitted', 'permitted'),
(342, 'message', 'jabber_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(343, 'message', 'jabber_provider_mod_feedback_submission_permitted', 'permitted'),
(344, 'message', 'jabber_provider_mod_feedback_message_permitted', 'permitted'),
(345, 'message', 'jabber_provider_mod_forum_posts_permitted', 'permitted'),
(346, 'message', 'jabber_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(347, 'message', 'jabber_provider_mod_quiz_submission_permitted', 'permitted'),
(348, 'message', 'jabber_provider_mod_quiz_confirmation_permitted', 'permitted'),
(349, 'message', 'jabber_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(350, 'message', 'jabber_provider_moodle_notices_permitted', 'permitted'),
(351, 'message', 'jabber_provider_moodle_errors_permitted', 'permitted'),
(352, 'message', 'jabber_provider_moodle_availableupdate_permitted', 'permitted'),
(353, 'message', 'jabber_provider_moodle_instantmessage_permitted', 'permitted'),
(354, 'message', 'jabber_provider_moodle_backup_permitted', 'permitted'),
(355, 'message', 'jabber_provider_moodle_courserequested_permitted', 'permitted'),
(356, 'message', 'jabber_provider_moodle_courserequestapproved_permitted', 'permitted'),
(357, 'message', 'jabber_provider_moodle_courserequestrejected_permitted', 'permitted'),
(358, 'message_popup', 'version', '2013110500'),
(361, 'message', 'popup_provider_enrol_flatfile_flatfile_enrolment_permitted', 'permitted'),
(362, 'message', 'popup_provider_enrol_imsenterprise_imsenterprise_enrolment_permitted', 'permitted'),
(363, 'message', 'popup_provider_enrol_paypal_paypal_enrolment_permitted', 'permitted'),
(364, 'message', 'popup_provider_mod_assign_assign_notification_permitted', 'permitted'),
(365, 'message', 'popup_provider_mod_assignment_assignment_updates_permitted', 'permitted'),
(366, 'message', 'popup_provider_mod_feedback_submission_permitted', 'permitted'),
(367, 'message', 'popup_provider_mod_feedback_message_permitted', 'permitted'),
(368, 'message', 'popup_provider_mod_forum_posts_permitted', 'permitted'),
(369, 'message', 'popup_provider_mod_lesson_graded_essay_permitted', 'permitted'),
(370, 'message', 'popup_provider_mod_quiz_submission_permitted', 'permitted'),
(371, 'message', 'popup_provider_mod_quiz_confirmation_permitted', 'permitted'),
(372, 'message', 'popup_provider_mod_quiz_attempt_overdue_permitted', 'permitted'),
(373, 'message', 'popup_provider_moodle_notices_permitted', 'permitted'),
(374, 'message', 'popup_provider_moodle_errors_permitted', 'permitted'),
(375, 'message', 'popup_provider_moodle_availableupdate_permitted', 'permitted'),
(376, 'message', 'popup_provider_moodle_instantmessage_permitted', 'permitted'),
(377, 'message', 'message_provider_moodle_instantmessage_loggedin', 'popup'),
(378, 'message', 'popup_provider_moodle_backup_permitted', 'permitted'),
(379, 'message', 'popup_provider_moodle_courserequested_permitted', 'permitted'),
(380, 'message', 'popup_provider_moodle_courserequestapproved_permitted', 'permitted'),
(381, 'message', 'popup_provider_moodle_courserequestrejected_permitted', 'permitted'),
(383, 'filter_activitynames', 'version', '2013110500'),
(385, 'filter_algebra', 'version', '2013110500'),
(386, 'filter_censor', 'version', '2013110500'),
(387, 'filter_data', 'version', '2013110500'),
(389, 'filter_emailprotect', 'version', '2013110500'),
(390, 'filter_emoticon', 'version', '2013110500'),
(391, 'filter_glossary', 'version', '2013110500'),
(393, 'filter_mediaplugin', 'version', '2013110500'),
(395, 'filter_multilang', 'version', '2013110500'),
(396, 'filter_tex', 'version', '2013110500'),
(398, 'filter_tidy', 'version', '2013110500'),
(399, 'filter_urltolink', 'version', '2013110500'),
(400, 'editor_textarea', 'version', '2013110500'),
(401, 'editor_tinymce', 'version', '2013110600'),
(402, 'format_scorm', 'version', '2013050100'),
(403, 'format_social', 'version', '2013110500'),
(404, 'format_topics', 'version', '2013110500'),
(405, 'format_weeks', 'version', '2013110500'),
(406, 'profilefield_checkbox', 'version', '2013110500'),
(407, 'profilefield_datetime', 'version', '2013110500'),
(408, 'profilefield_menu', 'version', '2013110500'),
(409, 'profilefield_text', 'version', '2013110500'),
(410, 'profilefield_textarea', 'version', '2013110500'),
(411, 'report_backups', 'version', '2013110500'),
(412, 'report_completion', 'version', '2013110500'),
(414, 'report_configlog', 'version', '2013110500'),
(415, 'report_courseoverview', 'version', '2013110500'),
(416, 'report_log', 'version', '2013110500'),
(418, 'report_loglive', 'version', '2013110500'),
(419, 'report_outline', 'version', '2013110500'),
(421, 'report_participation', 'version', '2013110500'),
(423, 'report_progress', 'version', '2013110500'),
(425, 'report_questioninstances', 'version', '2013110500'),
(426, 'report_security', 'version', '2013110500'),
(427, 'report_stats', 'version', '2013110500'),
(429, 'gradeexport_ods', 'version', '2013110500'),
(430, 'gradeexport_txt', 'version', '2013110500'),
(431, 'gradeexport_xls', 'version', '2013110500'),
(432, 'gradeexport_xml', 'version', '2013110500'),
(433, 'gradeimport_csv', 'version', '2013110500'),
(434, 'gradeimport_xml', 'version', '2013110500'),
(435, 'gradereport_grader', 'version', '2013110500'),
(436, 'gradereport_outcomes', 'version', '2013110500'),
(437, 'gradereport_overview', 'version', '2013110500'),
(438, 'gradereport_user', 'version', '2013110500'),
(439, 'gradingform_guide', 'version', '2013110500'),
(440, 'gradingform_rubric', 'version', '2013110500'),
(441, 'mnetservice_enrol', 'version', '2013110500'),
(442, 'webservice_amf', 'version', '2013110500'),
(443, 'webservice_rest', 'version', '2013110500'),
(444, 'webservice_soap', 'version', '2013110500'),
(445, 'webservice_xmlrpc', 'version', '2013110500'),
(446, 'repository_alfresco', 'version', '2013110500'),
(447, 'repository_boxnet', 'version', '2013110700'),
(448, 'repository_coursefiles', 'version', '2013110500'),
(449, 'repository_dropbox', 'version', '2013110500'),
(450, 'repository_equella', 'version', '2013110500'),
(451, 'repository_filesystem', 'version', '2013110500'),
(452, 'repository_flickr', 'version', '2013110500'),
(453, 'repository_flickr_public', 'version', '2013110500'),
(454, 'repository_googledocs', 'version', '2013110500'),
(455, 'repository_local', 'version', '2013110500'),
(457, 'local', 'enablecourseinstances', '0'),
(458, 'local', 'enableuserinstances', '0'),
(459, 'repository_merlot', 'version', '2013110500'),
(460, 'repository_picasa', 'version', '2013110500'),
(461, 'repository_recent', 'version', '2013110500'),
(463, 'recent', 'enablecourseinstances', '0'),
(464, 'recent', 'enableuserinstances', '0'),
(465, 'repository_s3', 'version', '2013110500'),
(466, 'repository_upload', 'version', '2013110500'),
(468, 'upload', 'enablecourseinstances', '0'),
(469, 'upload', 'enableuserinstances', '0'),
(470, 'repository_url', 'version', '2013110500'),
(472, 'url', 'enablecourseinstances', '0'),
(473, 'url', 'enableuserinstances', '0'),
(474, 'repository_user', 'version', '2013110500'),
(476, 'user', 'enablecourseinstances', '0'),
(477, 'user', 'enableuserinstances', '0'),
(478, 'repository_webdav', 'version', '2013110500'),
(479, 'repository_wikimedia', 'version', '2013110500'),
(481, 'wikimedia', 'enablecourseinstances', '0'),
(482, 'wikimedia', 'enableuserinstances', '0'),
(483, 'repository_youtube', 'version', '2013110500'),
(485, 'youtube', 'enablecourseinstances', '0'),
(486, 'youtube', 'enableuserinstances', '0'),
(487, 'portfolio_boxnet', 'version', '2013110602'),
(488, 'portfolio_download', 'version', '2013110500'),
(489, 'portfolio_flickr', 'version', '2013110500'),
(490, 'portfolio_googledocs', 'version', '2013110500'),
(491, 'portfolio_mahara', 'version', '2013110500'),
(492, 'portfolio_picasa', 'version', '2013110500'),
(493, 'qbehaviour_adaptive', 'version', '2013110500'),
(494, 'qbehaviour_adaptivenopenalty', 'version', '2013110500'),
(495, 'qbehaviour_deferredcbm', 'version', '2013110500'),
(496, 'qbehaviour_deferredfeedback', 'version', '2013110500'),
(497, 'qbehaviour_immediatecbm', 'version', '2013110500'),
(498, 'qbehaviour_immediatefeedback', 'version', '2013110500'),
(499, 'qbehaviour_informationitem', 'version', '2013110500'),
(500, 'qbehaviour_interactive', 'version', '2013110500'),
(501, 'qbehaviour_interactivecountback', 'version', '2013110500'),
(502, 'qbehaviour_manualgraded', 'version', '2013110500'),
(503, 'qbehaviour_missing', 'version', '2013110500'),
(504, 'qformat_aiken', 'version', '2013110500'),
(506, 'qformat_blackboard_six', 'version', '2013110500'),
(507, 'qformat_examview', 'version', '2013110500'),
(508, 'qformat_gift', 'version', '2013110500'),
(509, 'qformat_learnwise', 'version', '2013110500'),
(510, 'qformat_missingword', 'version', '2013110500'),
(511, 'qformat_multianswer', 'version', '2013110500'),
(512, 'qformat_webct', 'version', '2013110500'),
(513, 'qformat_xhtml', 'version', '2013110500'),
(514, 'qformat_xml', 'version', '2013110500'),
(515, 'tool_assignmentupgrade', 'version', '2013110500'),
(518, 'tool_capability', 'version', '2013110500'),
(519, 'tool_customlang', 'version', '2013110500'),
(521, 'tool_dbtransfer', 'version', '2013110500'),
(522, 'tool_generator', 'version', '2013110500'),
(523, 'tool_health', 'version', '2013110500'),
(524, 'tool_innodb', 'version', '2013110500'),
(525, 'tool_langimport', 'version', '2013110500'),
(526, 'tool_multilangupgrade', 'version', '2013110500'),
(527, 'tool_phpunit', 'version', '2013110500'),
(528, 'tool_profiling', 'version', '2013110500'),
(529, 'tool_qeupgradehelper', 'version', '2013110500'),
(531, 'tool_replace', 'version', '2013110501'),
(532, 'tool_spamcleaner', 'version', '2013110500'),
(533, 'tool_timezoneimport', 'version', '2013110500'),
(536, 'tool_unsuproles', 'version', '2013110500'),
(538, 'tool_uploaduser', 'version', '2013110500'),
(539, 'tool_xmldb', 'version', '2013110500'),
(540, 'theme_afterburner', 'version', '2013110500'),
(541, 'theme_anomaly', 'version', '2013110500'),
(542, 'theme_arialist', 'version', '2013110500'),
(543, 'theme_base', 'version', '2013110500'),
(544, 'theme_binarius', 'version', '2013110500'),
(545, 'theme_boxxie', 'version', '2013110500'),
(546, 'theme_brick', 'version', '2013110500'),
(547, 'theme_canvas', 'version', '2013110500'),
(548, 'theme_formal_white', 'version', '2013110500'),
(550, 'theme_formfactor', 'version', '2013110500'),
(551, 'theme_fusion', 'version', '2013110500'),
(552, 'theme_leatherbound', 'version', '2013110500'),
(553, 'theme_magazine', 'version', '2013110500'),
(555, 'theme_nimble', 'version', '2013110500'),
(556, 'theme_nonzero', 'version', '2013110500'),
(557, 'theme_overlay', 'version', '2013110500'),
(558, 'theme_serenity', 'version', '2013110500'),
(559, 'theme_sky_high', 'version', '2013110500'),
(560, 'theme_splash', 'version', '2013110500'),
(561, 'theme_standard', 'version', '2013110500'),
(562, 'theme_standardold', 'version', '2013110500'),
(563, 'assignsubmission_comments', 'version', '2013110500'),
(565, 'assignsubmission_file', 'sortorder', '1'),
(566, 'assignsubmission_comments', 'sortorder', '2'),
(567, 'assignsubmission_onlinetext', 'sortorder', '0'),
(568, 'assignsubmission_file', 'version', '2013110500'),
(569, 'assignsubmission_onlinetext', 'version', '2013110500'),
(571, 'assignfeedback_comments', 'version', '2013110500'),
(573, 'assignfeedback_comments', 'sortorder', '0'),
(574, 'assignfeedback_file', 'sortorder', '1'),
(575, 'assignfeedback_file', 'version', '2013110500'),
(577, 'assignment_offline', 'version', '2013110500'),
(578, 'assignment_online', 'version', '2013110500'),
(579, 'assignment_upload', 'version', '2013110500'),
(580, 'assignment_uploadsingle', 'version', '2013110500'),
(581, 'booktool_exportimscp', 'version', '2013110500'),
(582, 'booktool_importhtml', 'version', '2013110500'),
(583, 'booktool_print', 'version', '2013110500'),
(584, 'datafield_checkbox', 'version', '2013110500'),
(585, 'datafield_date', 'version', '2013110500'),
(586, 'datafield_file', 'version', '2013110500'),
(587, 'datafield_latlong', 'version', '2013110500'),
(588, 'datafield_menu', 'version', '2013110500'),
(589, 'datafield_multimenu', 'version', '2013110500'),
(590, 'datafield_number', 'version', '2013110500'),
(591, 'datafield_picture', 'version', '2013110500'),
(592, 'datafield_radiobutton', 'version', '2013110500'),
(593, 'datafield_text', 'version', '2013110500'),
(594, 'datafield_textarea', 'version', '2013110500'),
(595, 'datafield_url', 'version', '2013110500'),
(596, 'datapreset_imagegallery', 'version', '2013110500'),
(597, 'quiz_grading', 'version', '2013110500'),
(598, 'quiz_overview', 'version', '2013110500'),
(599, 'quiz_responses', 'version', '2013110500'),
(600, 'quiz_statistics', 'version', '2013110500'),
(602, 'quizaccess_delaybetweenattempts', 'version', '2013110500'),
(603, 'quizaccess_ipaddress', 'version', '2013110500'),
(604, 'quizaccess_numattempts', 'version', '2013110500'),
(605, 'quizaccess_openclosedate', 'version', '2013110500'),
(606, 'quizaccess_password', 'version', '2013110500'),
(607, 'quizaccess_safebrowser', 'version', '2013110500'),
(608, 'quizaccess_securewindow', 'version', '2013110500'),
(609, 'quizaccess_timelimit', 'version', '2013110500'),
(610, 'scormreport_basic', 'version', '2013110500'),
(611, 'scormreport_graphs', 'version', '2013110500'),
(612, 'scormreport_interactions', 'version', '2013110500'),
(613, 'workshopform_accumulative', 'version', '2013110500'),
(615, 'workshopform_comments', 'version', '2013110500'),
(617, 'workshopform_numerrors', 'version', '2013110500'),
(619, 'workshopform_rubric', 'version', '2013110500'),
(621, 'workshopallocation_manual', 'version', '2013110500'),
(622, 'workshopallocation_random', 'version', '2013110500'),
(623, 'workshopallocation_scheduled', 'version', '2013110500'),
(624, 'workshopeval_best', 'version', '2013110500'),
(625, 'assign', 'feedback_plugin_for_gradebook', 'assignfeedback_comments'),
(626, 'assign', 'showrecentsubmissions', '0'),
(627, 'assign', 'submissionreceipts', '1'),
(628, 'book', 'requiremodintro', '1'),
(629, 'book', 'numberingoptions', '0,1,2,3'),
(630, 'book', 'numbering', '1'),
(631, 'certificate', 'uploadimage', ''),
(632, 'folder', 'requiremodintro', '1'),
(633, 'imscp', 'requiremodintro', '1'),
(634, 'imscp', 'keepold', '1'),
(635, 'imscp', 'keepold_adv', '0'),
(636, 'page', 'requiremodintro', '1'),
(637, 'page', 'displayoptions', '5'),
(638, 'page', 'printheading', '1'),
(639, 'page', 'printheading_adv', '0'),
(640, 'page', 'printintro', '0'),
(641, 'page', 'printintro_adv', '0'),
(642, 'page', 'display', '5'),
(643, 'page', 'display_adv', '1'),
(644, 'page', 'popupwidth', '620'),
(645, 'page', 'popupwidth_adv', '1'),
(646, 'page', 'popupheight', '450'),
(647, 'page', 'popupheight_adv', '1'),
(648, 'quiz', 'timelimit', '0'),
(649, 'quiz', 'timelimit_adv', '0'),
(650, 'quiz', 'overduehandling', 'autoabandon'),
(651, 'quiz', 'overduehandling_adv', '0'),
(652, 'quiz', 'graceperiod', '86400'),
(653, 'quiz', 'graceperiod_adv', '0'),
(654, 'quiz', 'graceperiodmin', '60'),
(655, 'quiz', 'attempts', '0'),
(656, 'quiz', 'attempts_adv', '0'),
(657, 'quiz', 'grademethod', '1'),
(658, 'quiz', 'grademethod_adv', '0'),
(659, 'quiz', 'maximumgrade', '10'),
(660, 'quiz', 'shufflequestions', '0'),
(661, 'quiz', 'shufflequestions_adv', '0'),
(662, 'quiz', 'questionsperpage', '1'),
(663, 'quiz', 'questionsperpage_adv', '0'),
(664, 'quiz', 'navmethod', 'free'),
(665, 'quiz', 'navmethod_adv', '1'),
(666, 'quiz', 'shuffleanswers', '1'),
(667, 'quiz', 'shuffleanswers_adv', '0'),
(668, 'quiz', 'preferredbehaviour', 'deferredfeedback'),
(669, 'quiz', 'attemptonlast', '0'),
(670, 'quiz', 'attemptonlast_adv', '1'),
(671, 'quiz', 'reviewattempt', '69904'),
(672, 'quiz', 'reviewcorrectness', '69904'),
(673, 'quiz', 'reviewmarks', '69904'),
(674, 'quiz', 'reviewspecificfeedback', '69904'),
(675, 'quiz', 'reviewgeneralfeedback', '69904'),
(676, 'quiz', 'reviewrightanswer', '69904'),
(677, 'quiz', 'reviewoverallfeedback', '4368'),
(678, 'quiz', 'showuserpicture', '0'),
(679, 'quiz', 'showuserpicture_adv', '0'),
(680, 'quiz', 'decimalpoints', '2'),
(681, 'quiz', 'decimalpoints_adv', '0'),
(682, 'quiz', 'questiondecimalpoints', '-1'),
(683, 'quiz', 'questiondecimalpoints_adv', '0'),
(684, 'quiz', 'showblocks', '0'),
(685, 'quiz', 'showblocks_adv', '1'),
(686, 'quiz', 'password', ''),
(687, 'quiz', 'password_adv', '0'),
(688, 'quiz', 'subnet', ''),
(689, 'quiz', 'subnet_adv', '0'),
(690, 'quiz', 'delay1', '0'),
(691, 'quiz', 'delay1_adv', '0'),
(692, 'quiz', 'delay2', '0'),
(693, 'quiz', 'delay2_adv', '0'),
(694, 'quiz', 'browsersecurity', '-'),
(695, 'quiz', 'browsersecurity_adv', '1'),
(696, 'resource', 'framesize', '130'),
(697, 'resource', 'requiremodintro', '1'),
(698, 'resource', 'displayoptions', '0,1,4,5,6'),
(699, 'resource', 'printheading', '0'),
(700, 'resource', 'printheading_adv', '0'),
(701, 'resource', 'printintro', '1'),
(702, 'resource', 'printintro_adv', '0'),
(703, 'resource', 'display', '0'),
(704, 'resource', 'display_adv', '0'),
(705, 'resource', 'showsize', '0'),
(706, 'resource', 'showsize_adv', '0'),
(707, 'resource', 'showtype', '0'),
(708, 'resource', 'showtype_adv', '0'),
(709, 'resource', 'popupwidth', '620'),
(710, 'resource', 'popupwidth_adv', '1'),
(711, 'resource', 'popupheight', '450'),
(712, 'resource', 'popupheight_adv', '1'),
(713, 'resource', 'filterfiles', '0'),
(714, 'resource', 'filterfiles_adv', '1'),
(715, 'scorm', 'displaycoursestructure', '0'),
(716, 'scorm', 'displaycoursestructure_adv', '0'),
(717, 'scorm', 'popup', '0'),
(718, 'scorm', 'popup_adv', '0'),
(719, 'scorm', 'framewidth', '100'),
(720, 'scorm', 'framewidth_adv', '1'),
(721, 'scorm', 'frameheight', '500'),
(722, 'scorm', 'frameheight_adv', '1'),
(723, 'scorm', 'winoptgrp_adv', '1'),
(724, 'scorm', 'resizable', '0'),
(725, 'scorm', 'scrollbars', '0'),
(726, 'scorm', 'directories', '0'),
(727, 'scorm', 'location', '0'),
(728, 'scorm', 'menubar', '0'),
(729, 'scorm', 'toolbar', '0'),
(730, 'scorm', 'status', '0'),
(731, 'scorm', 'skipview', '0'),
(732, 'scorm', 'skipview_adv', '1'),
(733, 'scorm', 'hidebrowse', '0'),
(734, 'scorm', 'hidebrowse_adv', '1'),
(735, 'scorm', 'hidetoc', '0'),
(736, 'scorm', 'hidetoc_adv', '1'),
(739, 'scorm', 'grademethod', '1'),
(740, 'scorm', 'grademethod_adv', '0'),
(741, 'scorm', 'maxgrade', '100'),
(742, 'scorm', 'maxgrade_adv', '0'),
(743, 'scorm', 'maxattempt', '0'),
(744, 'scorm', 'maxattempt_adv', '0'),
(745, 'scorm', 'whatgrade', '0'),
(746, 'scorm', 'whatgrade_adv', '0'),
(747, 'scorm', 'displayattemptstatus', '1'),
(748, 'scorm', 'displayattemptstatus_adv', '0'),
(749, 'scorm', 'forcecompleted', '0'),
(750, 'scorm', 'forcecompleted_adv', '1'),
(751, 'scorm', 'forcenewattempt', '0'),
(752, 'scorm', 'forcenewattempt_adv', '1'),
(753, 'scorm', 'lastattemptlock', '0'),
(754, 'scorm', 'lastattemptlock_adv', '1'),
(755, 'scorm', 'auto', '0'),
(756, 'scorm', 'auto_adv', '1'),
(757, 'scorm', 'updatefreq', '0'),
(758, 'scorm', 'updatefreq_adv', '1'),
(759, 'scorm', 'allowtypeexternal', '0'),
(760, 'scorm', 'allowtypelocalsync', '0'),
(761, 'scorm', 'allowtypeimsrepository', '0'),
(762, 'scorm', 'allowtypeexternalaicc', '0'),
(763, 'scorm', 'allowaicchacp', '0'),
(764, 'scorm', 'aicchacptimeout', '30'),
(765, 'scorm', 'aicchacpkeepsessiondata', '1'),
(766, 'scorm', 'forcejavascript', '1'),
(767, 'scorm', 'allowapidebug', '0'),
(768, 'scorm', 'apidebugmask', '.*'),
(769, 'url', 'framesize', '130'),
(770, 'url', 'requiremodintro', '1'),
(771, 'url', 'secretphrase', ''),
(772, 'url', 'rolesinparams', '0'),
(773, 'url', 'displayoptions', '0,1,5,6'),
(774, 'url', 'printheading', '0'),
(775, 'url', 'printheading_adv', '0'),
(776, 'url', 'printintro', '1'),
(777, 'url', 'printintro_adv', '0'),
(778, 'url', 'display', '0'),
(779, 'url', 'display_adv', '0'),
(780, 'url', 'popupwidth', '620'),
(781, 'url', 'popupwidth_adv', '1'),
(782, 'url', 'popupheight', '450'),
(783, 'url', 'popupheight_adv', '1'),
(784, 'workshop', 'grade', '80'),
(785, 'workshop', 'gradinggrade', '20'),
(786, 'workshop', 'gradedecimals', '0'),
(787, 'workshop', 'maxbytes', '0'),
(788, 'workshop', 'strategy', 'accumulative'),
(789, 'workshop', 'examplesmode', '0'),
(790, 'workshopallocation_random', 'numofreviews', '5'),
(791, 'workshopform_numerrors', 'grade0', 'No'),
(792, 'workshopform_numerrors', 'grade1', 'Yes'),
(793, 'workshopeval_best', 'comparison', '5'),
(794, 'assignsubmission_file', 'default', '1'),
(795, 'assignsubmission_file', 'maxbytes', '1048576'),
(796, 'assignsubmission_onlinetext', 'default', '0'),
(797, 'assignsubmission_comments', 'default', '0'),
(798, 'assignfeedback_comments', 'default', '0'),
(799, 'assignfeedback_file', 'default', '0'),
(804, 'enrol_cohort', 'roleid', '5'),
(805, 'enrol_cohort', 'unenrolaction', '0'),
(806, 'enrol_database', 'defaultrole', '5'),
(807, 'enrol_database', 'defaultcategory', '1'),
(808, 'enrol_flatfile', 'map_1', 'manager'),
(809, 'enrol_flatfile', 'map_2', 'coursecreator'),
(810, 'enrol_flatfile', 'map_3', 'editingteacher'),
(811, 'enrol_flatfile', 'map_4', 'teacher'),
(812, 'enrol_flatfile', 'map_5', 'student'),
(813, 'enrol_flatfile', 'map_6', 'guest'),
(814, 'enrol_flatfile', 'map_7', 'user'),
(815, 'enrol_flatfile', 'map_8', 'frontpage'),
(816, 'enrol_imsenterprise', 'imsrolemap01', '5'),
(817, 'enrol_imsenterprise', 'imsrolemap02', '3'),
(818, 'enrol_imsenterprise', 'imsrolemap03', '3'),
(819, 'enrol_imsenterprise', 'imsrolemap04', '5'),
(820, 'enrol_imsenterprise', 'imsrolemap05', '0'),
(821, 'enrol_imsenterprise', 'imsrolemap06', '4'),
(822, 'enrol_imsenterprise', 'imsrolemap07', '0'),
(823, 'enrol_imsenterprise', 'imsrolemap08', '4'),
(824, 'enrol_manual', 'roleid', '5'),
(825, 'enrol_meta', 'nosyncroleids', ''),
(826, 'enrol_meta', 'syncall', '1'),
(827, 'enrol_meta', 'unenrolaction', '0'),
(828, 'enrol_mnet', 'roleid', '5'),
(829, 'enrol_mnet', 'roleid_adv', '1'),
(830, 'enrol_paypal', 'roleid', '5'),
(831, 'enrol_self', 'roleid', '5'),
(832, 'auth/intake', 'recaptcha', '0'),
(833, 'enrol_ldap', 'objectclass', '(objectClass=*)'),
(835, 'core_plugin', 'recentfetch', '1390992554'),
(836, 'core_plugin', 'recentresponse', '{"status":"OK","provider":"https:\\/\\/download.moodle.org\\/api\\/1.2\\/updates.php","apiver":"1.2","timegenerated":1390992553,"ticket":"JUM5JTkxNiVGOG4lRDV4JTdGJUUyJUM0JURGJUQ1JUU4MCUxOSVFNEklQzklOUElQTglNUVnJTlBJTdFJTJBJUJFJUE1JTFEbyVBRCUyOCUwQyU4OCUxNiUxQiU4NSU3QiU4QyU4OUw=","forbranch":"2.6","forversion":"2013111801.03","updates":{"core":[{"version":2013111801.03,"release":"2.6.1+ (Build: 20140123)","branch":"2.6","maturity":200,"url":"http:\\/\\/download.moodle.org","download":"http:\\/\\/download.moodle.org\\/download.php\\/direct\\/stable26\\/moodle-latest-26.zip"},{"version":2014012300,"release":"2.7dev (Build: 20140123)","branch":"2.7","maturity":50,"url":"http:\\/\\/download.moodle.org","download":"http:\\/\\/download.moodle.org\\/download.php\\/direct\\/moodle\\/moodle-latest.zip"}],"mod_certificate":[{"version":"2013102300","release":"Stable 2.4 to 2.6","maturity":200,"url":"https:\\/\\/moodle.org\\/plugins\\/pluginversion.php?id=5116","download":"https:\\/\\/moodle.org\\/plugins\\/download.php\\/5116\\/mod_certificate_moodle26_2013102300.zip","downloadmd5":"6bd4f1e5cc134d02ea160337c4093b87"}]}}'),
(838, 'enrol_self', 'lastcron', '1390821670'),
(839, 'enrol_cohort', 'lastcron', '1390821670'),
(842, 'quiz_statistics', 'lastcron', '1390821670'),
(843, 'workshopallocation_scheduled', 'lastcron', '1390821670'),
(844, 'registration', 'crontime', '1390821670'),
(845, 'repository_dropbox', 'lastcron', '1390821670'),
(846, 'tool_qeupgradehelper', 'lastcron', '1390821670'),
(848, 'local_soda', 'version', '2012103101'),
(849, 'folder', 'showexpanded', '0'),
(850, 'auth/cas', 'start_tls', '0'),
(851, 'auth/ldap', 'start_tls', '0'),
(852, 'message', 'email_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(853, 'message', 'jabber_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(854, 'message', 'popup_provider_enrol_manual_expiry_notification_permitted', 'permitted'),
(855, 'message', 'message_provider_enrol_manual_expiry_notification_loggedin', 'email'),
(856, 'message', 'message_provider_enrol_manual_expiry_notification_loggedoff', 'email'),
(857, 'message', 'email_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(858, 'message', 'jabber_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(859, 'message', 'popup_provider_enrol_self_expiry_notification_permitted', 'permitted'),
(860, 'message', 'message_provider_enrol_self_expiry_notification_loggedin', 'email'),
(861, 'message', 'message_provider_enrol_self_expiry_notification_loggedoff', 'email'),
(862, 'block_section_links', 'incby1', '2'),
(863, 'block_section_links', 'incby2', '5'),
(864, 'block_section_links', 'numsections1', '22'),
(865, 'block_section_links', 'numsections2', '40'),
(866, 'report_performance', 'version', '2013110500'),
(867, 'question', 'disabledbehaviours', 'manualgraded'),
(868, 'tool_behat', 'version', '2013110501'),
(869, 'tool_installaddon', 'version', '2013110500'),
(870, 'cachestore_file', 'version', '2013110500'),
(871, 'cachestore_memcache', 'version', '2013110500'),
(872, 'cachestore_memcached', 'version', '2013110500'),
(873, 'cachestore_mongodb', 'version', '2013110500'),
(874, 'cachestore_session', 'version', '2013110500'),
(875, 'cachestore_static', 'version', '2013110500'),
(876, 'theme_bootstrapbase', 'version', '2013110500'),
(877, 'theme_clean', 'version', '2013110500'),
(878, 'assignfeedback_offline', 'version', '2013110500'),
(879, 'tinymce_ctrlhelp', 'version', '2013110500'),
(880, 'tinymce_dragmath', 'version', '2013110500'),
(881, 'tinymce_moodleemoticon', 'version', '2013110500'),
(882, 'tinymce_moodleimage', 'version', '2013110500'),
(883, 'tinymce_moodlemedia', 'version', '2013110500'),
(884, 'tinymce_moodlenolink', 'version', '2013110500'),
(885, 'tinymce_spellchecker', 'version', '2013110500'),
(887, 'tinymce_spellchecker', 'spellengine', 'GoogleSpell'),
(888, 'tinymce_spellchecker', 'spelllanguagelist', '+English=en,Danish=da,Dutch=nl,Finnish=fi,French=fr,German=de,Italian=it,Polish=pl,Portuguese=pt,Spanish=es,Swedish=sv'),
(889, 'backup', 'backup_general_badges', '1'),
(890, 'backup', 'backup_general_badges_locked', '0'),
(891, 'backup', 'import_general_maxresults', '10'),
(892, 'backup', 'backup_auto_skip_hidden', '1'),
(893, 'backup', 'backup_auto_skip_modif_days', '30'),
(894, 'backup', 'backup_auto_skip_modif_prev', '0'),
(895, 'backup', 'backup_auto_badges', '1'),
(896, 'assign', 'submissionstatement', 'This assignment is my own work, except where I have acknowledged the use of the works of other people.'),
(897, 'assign', 'requiresubmissionstatement', '0'),
(898, 'label', 'dndmedia', '1'),
(899, 'label', 'dndresizewidth', '400'),
(900, 'label', 'dndresizeheight', '400'),
(901, 'quiz', 'autosaveperiod', '0'),
(902, 'assignfeedback_offline', 'default', '0'),
(903, 'block_course_overview', 'defaultmaxcourses', '10'),
(904, 'block_course_overview', 'forcedefaultmaxcourses', '0'),
(905, 'block_course_overview', 'showchildren', '0'),
(906, 'block_course_overview', 'showwelcomearea', '0'),
(907, 'enrol_flatfile', 'encoding', 'UTF-8'),
(908, 'enrol_flatfile', 'unenrolaction', '3'),
(909, 'enrol_flatfile', 'expiredaction', '3'),
(910, 'enrol_imsenterprise', 'imscoursemapshortname', 'coursecode'),
(911, 'enrol_imsenterprise', 'imscoursemapfullname', 'short'),
(912, 'enrol_imsenterprise', 'imscoursemapsummary', 'ignore'),
(913, 'enrol_manual', 'expiredaction', '1'),
(914, 'enrol_manual', 'expirynotifyhour', '6'),
(915, 'enrol_manual', 'expirynotify', '0'),
(916, 'enrol_manual', 'expirythreshold', '86400'),
(917, 'enrol_paypal', 'expiredaction', '3'),
(918, 'enrol_self', 'expiredaction', '1'),
(919, 'enrol_self', 'expirynotifyhour', '6'),
(920, 'enrol_self', 'newenrols', '1'),
(921, 'enrol_self', 'expirynotify', '0'),
(922, 'enrol_self', 'expirythreshold', '86400'),
(924, 'editor_tinymce', 'customconfig', ''),
(925, 'tinymce_dragmath', 'requiretex', '1'),
(926, 'tinymce_moodleemoticon', 'requireemoticon', '1'),
(927, 'question_preview', 'behaviour', 'deferredfeedback'),
(928, 'question_preview', 'correctness', '1'),
(929, 'question_preview', 'marks', '1'),
(930, 'question_preview', 'markdp', '2'),
(931, 'question_preview', 'feedback', '1'),
(932, 'question_preview', 'generalfeedback', '1'),
(933, 'question_preview', 'rightanswer', '1'),
(934, 'question_preview', 'history', '0'),
(935, 'cachestore_memcache', 'testservers', ''),
(936, 'cachestore_memcached', 'testservers', ''),
(937, 'cachestore_mongodb', 'testserver', ''),
(938, 'theme_anomaly', 'tagline', ''),
(939, 'theme_anomaly', 'customcss', ''),
(940, 'theme_clean', 'invert', '0'),
(941, 'theme_clean', 'logo', ''),
(942, 'theme_clean', 'customcss', ''),
(943, 'theme_clean', 'footnote', ''),
(944, 'mod_assign', 'version', '2013110500'),
(945, 'mod_assignment', 'version', '2013110500'),
(946, 'mod_book', 'version', '2013110500'),
(947, 'mod_certificate', 'version', '2013102300'),
(948, 'mod_chat', 'version', '2013110500'),
(949, 'mod_choice', 'version', '2013110500'),
(950, 'mod_data', 'version', '2013110500'),
(951, 'mod_feedback', 'version', '2013110500'),
(952, 'mod_folder', 'version', '2013110500'),
(953, 'mod_forum', 'version', '2013110500'),
(954, 'mod_glossary', 'version', '2013110500'),
(955, 'mod_imscp', 'version', '2013110500'),
(956, 'mod_label', 'version', '2013110500'),
(957, 'mod_lesson', 'version', '2013110500'),
(958, 'mod_lti', 'version', '2013110500'),
(959, 'mod_page', 'version', '2013110500'),
(960, 'mod_quiz', 'version', '2013110501'),
(961, 'mod_resource', 'version', '2013110500'),
(962, 'mod_scorm', 'version', '2013110501'),
(963, 'mod_survey', 'version', '2013110500'),
(964, 'mod_url', 'version', '2013110500'),
(965, 'mod_wiki', 'version', '2013110500'),
(966, 'mod_workshop', 'version', '2013110500'),
(967, 'mod_repeatcourse', 'version', '2014012700'),
(968, 'block_activity_modules', 'version', '2013110500'),
(969, 'block_admin_bookmarks', 'version', '2013110500'),
(970, 'block_blog_menu', 'version', '2013110500'),
(971, 'block_blog_recent', 'version', '2013110500'),
(972, 'block_blog_tags', 'version', '2013110500'),
(973, 'block_calendar_month', 'version', '2013110500'),
(974, 'block_calendar_upcoming', 'version', '2013110500'),
(975, 'block_comments', 'version', '2013110500'),
(976, 'block_community', 'version', '2013110500'),
(977, 'block_completionstatus', 'version', '2013110500'),
(978, 'block_course_list', 'version', '2013110500'),
(979, 'block_course_overview', 'version', '2013110500'),
(980, 'block_course_summary', 'version', '2013110500'),
(981, 'block_feedback', 'version', '2013110500'),
(982, 'block_glossary_random', 'version', '2013110500'),
(983, 'block_html', 'version', '2013110500'),
(984, 'block_login', 'version', '2013110500'),
(985, 'block_mentees', 'version', '2013110500'),
(986, 'block_messages', 'version', '2013110500'),
(987, 'block_mnet_hosts', 'version', '2013110500'),
(988, 'block_myprofile', 'version', '2013110500'),
(989, 'block_navigation', 'version', '2013110500'),
(990, 'block_news_items', 'version', '2013110500'),
(991, 'block_online_users', 'version', '2013110500'),
(992, 'block_participants', 'version', '2013110500'),
(993, 'block_private_files', 'version', '2013110500'),
(994, 'block_quiz_results', 'version', '2013110500'),
(995, 'block_recent_activity', 'version', '2013110500'),
(996, 'block_rss_client', 'version', '2013110500'),
(997, 'block_search_forums', 'version', '2013110500'),
(998, 'block_section_links', 'version', '2013110500'),
(999, 'block_selfcompletion', 'version', '2013110500'),
(1000, 'block_settings', 'version', '2013110500'),
(1001, 'block_site_main_menu', 'version', '2013110500'),
(1002, 'block_social_activities', 'version', '2013110500'),
(1003, 'block_tag_flickr', 'version', '2013110500'),
(1004, 'block_tag_youtube', 'version', '2013110500'),
(1005, 'block_tags', 'version', '2013110500'),
(1006, 'block_tutorial', 'version', '2012100500'),
(1007, 'block_badges', 'version', '2013110500'),
(1008, 'message', 'email_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(1009, 'message', 'jabber_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(1010, 'message', 'popup_provider_moodle_badgerecipientnotice_permitted', 'permitted'),
(1011, 'message', 'message_provider_moodle_badgerecipientnotice_loggedin', 'popup'),
(1012, 'message', 'message_provider_moodle_badgerecipientnotice_loggedoff', 'email,popup'),
(1013, 'message', 'email_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(1014, 'message', 'jabber_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(1015, 'message', 'popup_provider_moodle_badgecreatornotice_permitted', 'permitted'),
(1016, 'message', 'message_provider_moodle_badgecreatornotice_loggedoff', 'email'),
(1017, 'scorm', 'nav_adv', ''),
(1018, 'calendartype_gregorian', 'version', '2013110500'),
(1019, 'editor_tinymce', 'customtoolbar', 'wrap,formatselect,wrap,bold,italic,wrap,bullist,numlist,wrap,link,unlink,wrap,image\n\nundo,redo,wrap,underline,strikethrough,sub,sup,wrap,justifyleft,justifycenter,justifyright,wrap,outdent,indent,wrap,forecolor,backcolor,wrap,ltr,rtl,wrap,nonbreaking,charmap,table\n\nfontselect,fontsizeselect,code,search,replace,wrap,cleanup,removeformat,pastetext,pasteword,wrap,fullscreen'),
(1020, 'format_singleactivity', 'version', '2013110500'),
(1021, 'repository_areafiles', 'version', '2013110500'),
(1023, 'areafiles', 'enablecourseinstances', '0'),
(1024, 'areafiles', 'enableuserinstances', '0'),
(1025, 'repository_skydrive', 'version', '2013110500'),
(1026, 'tool_uploadcourse', 'version', '2013110500'),
(1027, 'cachelock_file', 'version', '2013110500'),
(1028, 'assignfeedback_editpdf', 'version', '2013110800'),
(1030, 'scormreport_objectives', 'version', '2013110500'),
(1031, 'tinymce_managefiles', 'version', '2014010800'),
(1032, 'tinymce_pdw', 'version', '2013110500'),
(1033, 'tinymce_wrap', 'version', '2013110500'),
(1034, 'backup', 'backup_general_questionbank', '1'),
(1035, 'backup', 'backup_general_questionbank_locked', ''),
(1036, 'backup', 'backup_auto_questionbank', '1'),
(1037, 'assign', 'alwaysshowdescription', '1'),
(1038, 'assign', 'alwaysshowdescription_adv', ''),
(1039, 'assign', 'alwaysshowdescription_locked', ''),
(1040, 'assign', 'allowsubmissionsfromdate', '0'),
(1041, 'assign', 'allowsubmissionsfromdate_enabled', '1'),
(1042, 'assign', 'allowsubmissionsfromdate_adv', ''),
(1043, 'assign', 'duedate', '604800'),
(1044, 'assign', 'duedate_enabled', '1'),
(1045, 'assign', 'duedate_adv', ''),
(1046, 'assign', 'cutoffdate', '1209600'),
(1047, 'assign', 'cutoffdate_enabled', ''),
(1048, 'assign', 'cutoffdate_adv', ''),
(1049, 'assign', 'submissiondrafts', '0'),
(1050, 'assign', 'submissiondrafts_adv', ''),
(1051, 'assign', 'submissiondrafts_locked', ''),
(1052, 'assign', 'attemptreopenmethod', 'none'),
(1053, 'assign', 'attemptreopenmethod_adv', ''),
(1054, 'assign', 'attemptreopenmethod_locked', ''),
(1055, 'assign', 'maxattempts', '-1');
INSERT INTO `mdl_config_plugins` (`id`, `plugin`, `name`, `value`) VALUES
(1056, 'assign', 'maxattempts_adv', ''),
(1057, 'assign', 'maxattempts_locked', ''),
(1058, 'assign', 'teamsubmission', '0'),
(1059, 'assign', 'teamsubmission_adv', ''),
(1060, 'assign', 'teamsubmission_locked', ''),
(1061, 'assign', 'requireallteammemberssubmit', '0'),
(1062, 'assign', 'requireallteammemberssubmit_adv', ''),
(1063, 'assign', 'requireallteammemberssubmit_locked', ''),
(1064, 'assign', 'teamsubmissiongroupingid', ''),
(1065, 'assign', 'teamsubmissiongroupingid_adv', ''),
(1066, 'assign', 'sendnotifications', '0'),
(1067, 'assign', 'sendnotifications_adv', ''),
(1068, 'assign', 'sendnotifications_locked', ''),
(1069, 'assign', 'sendlatenotifications', '0'),
(1070, 'assign', 'sendlatenotifications_adv', ''),
(1071, 'assign', 'sendlatenotifications_locked', ''),
(1072, 'assign', 'blindmarking', '0'),
(1073, 'assign', 'blindmarking_adv', ''),
(1074, 'assign', 'blindmarking_locked', ''),
(1075, 'assign', 'markingworkflow', '0'),
(1076, 'assign', 'markingworkflow_adv', ''),
(1077, 'assign', 'markingworkflow_locked', ''),
(1078, 'assign', 'markingallocation', '0'),
(1079, 'assign', 'markingallocation_adv', ''),
(1080, 'assign', 'markingallocation_locked', ''),
(1081, 'assignfeedback_editpdf', 'stamps', '/cross.png'),
(1082, 'assignfeedback_editpdf', 'gspath', 'C:\\gs\\gs910\\bin\\'),
(1083, 'scorm', 'nav', '1'),
(1084, 'scorm', 'navpositionleft', '-100'),
(1085, 'scorm', 'navpositionleft_adv', '1'),
(1086, 'scorm', 'navpositiontop', '-100'),
(1087, 'scorm', 'navpositiontop_adv', '1'),
(1088, 'scorm', 'collapsetocwinsize', '767'),
(1089, 'scorm', 'collapsetocwinsize_adv', '1'),
(1090, 'format_singleactivity', 'activitytype', 'forum'),
(1091, 'theme_formal_white', 'trendcolor', 'mink'),
(1092, 'auth/manual', 'field_lock_firstname', 'unlocked'),
(1093, 'auth/manual', 'field_lock_lastname', 'unlocked'),
(1094, 'auth/manual', 'field_lock_email', 'unlocked'),
(1095, 'auth/manual', 'field_lock_city', 'unlocked'),
(1096, 'auth/manual', 'field_lock_country', 'unlocked'),
(1097, 'auth/manual', 'field_lock_lang', 'unlocked'),
(1098, 'auth/manual', 'field_lock_description', 'unlocked'),
(1099, 'auth/manual', 'field_lock_url', 'unlocked'),
(1100, 'auth/manual', 'field_lock_idnumber', 'unlocked'),
(1101, 'auth/manual', 'field_lock_institution', 'unlocked'),
(1102, 'auth/manual', 'field_lock_department', 'unlocked'),
(1103, 'auth/manual', 'field_lock_phone1', 'unlocked'),
(1104, 'auth/manual', 'field_lock_phone2', 'unlocked'),
(1105, 'auth/manual', 'field_lock_address', 'unlocked');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context`
--

CREATE TABLE IF NOT EXISTS `mdl_context` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextlevel` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `depth` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_cont_conins_uix` (`contextlevel`,`instanceid`),
  KEY `mdl_cont_ins_ix` (`instanceid`),
  KEY `mdl_cont_pat_ix` (`path`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='one of these must be set' AUTO_INCREMENT=33 ;

--
-- Dumping data for table `mdl_context`
--

INSERT INTO `mdl_context` (`id`, `contextlevel`, `instanceid`, `path`, `depth`) VALUES
(1, 10, 0, '/1', 1),
(2, 50, 1, '/1/2', 2),
(3, 40, 1, '/1/3', 2),
(4, 30, 1, '/1/4', 2),
(5, 30, 2, '/1/5', 2),
(6, 80, 1, '/1/2/6', 3),
(7, 80, 2, '/1/2/7', 3),
(8, 80, 3, '/1/2/8', 3),
(9, 80, 4, '/1/9', 2),
(10, 80, 5, '/1/10', 2),
(11, 80, 6, '/1/11', 2),
(12, 80, 7, '/1/12', 2),
(13, 80, 8, '/1/13', 2),
(14, 80, 9, '/1/14', 2),
(15, 50, 2, '/1/3/15', 3),
(16, 80, 10, '/1/3/15/16', 4),
(17, 80, 11, '/1/3/15/17', 4),
(18, 80, 12, '/1/3/15/18', 4),
(19, 80, 13, '/1/3/15/19', 4),
(20, 70, 1, '/1/3/15/20', 4),
(21, 30, 3, '/1/21', 2),
(22, 30, 4, '/1/22', 2),
(23, 70, 2, '/1/3/15/23', 4),
(24, 40, 2, '/1/24', 2),
(25, 50, 3, '/1/24/25', 3),
(26, 80, 14, '/1/24/25/26', 4),
(27, 80, 15, '/1/24/25/27', 4),
(28, 80, 16, '/1/24/25/28', 4),
(29, 80, 17, '/1/24/25/29', 4),
(30, 70, 3, '/1/24/25/30', 4),
(31, 30, 5, '/1/31', 2),
(32, 30, 6, '/1/32', 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_context_temp`
--

CREATE TABLE IF NOT EXISTS `mdl_context_temp` (
  `id` bigint(10) NOT NULL,
  `path` varchar(255) NOT NULL DEFAULT '',
  `depth` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by build_context_path() in upgrade and cron to keep con';

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course`
--

CREATE TABLE IF NOT EXISTS `mdl_course` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `format` varchar(21) NOT NULL DEFAULT 'topics',
  `showgrades` tinyint(2) NOT NULL DEFAULT '1',
  `newsitems` mediumint(5) NOT NULL DEFAULT '1',
  `startdate` bigint(10) NOT NULL DEFAULT '0',
  `marker` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `showreports` smallint(4) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupmodeforce` smallint(4) NOT NULL DEFAULT '0',
  `defaultgroupingid` bigint(10) NOT NULL DEFAULT '0',
  `lang` varchar(30) NOT NULL DEFAULT '',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `requested` tinyint(1) NOT NULL DEFAULT '0',
  `enablecompletion` tinyint(1) NOT NULL DEFAULT '0',
  `completionnotify` tinyint(1) NOT NULL DEFAULT '0',
  `cacherev` bigint(10) NOT NULL DEFAULT '0',
  `calendartype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_cour_cat_ix` (`category`),
  KEY `mdl_cour_idn_ix` (`idnumber`),
  KEY `mdl_cour_sho_ix` (`shortname`),
  KEY `mdl_cour_sor_ix` (`sortorder`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Central course table' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_course`
--

INSERT INTO `mdl_course` (`id`, `category`, `sortorder`, `fullname`, `shortname`, `idnumber`, `summary`, `summaryformat`, `format`, `showgrades`, `newsitems`, `startdate`, `marker`, `maxbytes`, `legacyfiles`, `showreports`, `visible`, `visibleold`, `groupmode`, `groupmodeforce`, `defaultgroupingid`, `lang`, `theme`, `timecreated`, `timemodified`, `requested`, `enablecompletion`, `completionnotify`, `cacherev`, `calendartype`) VALUES
(1, 0, 1, 'Solin', 'Solin', '', '', 0, 'site', 1, 3, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, '', '', 1390393232, 1390393972, 0, 0, 0, 1391172212, ''),
(2, 1, 20001, 'Test course', 'tstcrs', '1', '<p>Summary desummary</p>', 1, 'weeks', 1, 5, 1389124800, 0, 52428800, 0, 0, 1, 1, 0, 0, 0, '', '', 1390480406, 1390480406, 0, 0, 0, 1391172212, ''),
(3, 2, 10001, 'First Course', '1st course', '', '', 1, 'weeks', 1, 5, 1389729600, 0, 10485760, 0, 0, 1, 1, 2, 1, 0, '', '', 1390915875, 1390993915, 0, 0, 0, 1391172212, '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_course_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `coursecount` bigint(10) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) NOT NULL DEFAULT '',
  `theme` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Course categories' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_course_categories`
--

INSERT INTO `mdl_course_categories` (`id`, `name`, `idnumber`, `description`, `descriptionformat`, `parent`, `sortorder`, `coursecount`, `visible`, `visibleold`, `timemodified`, `depth`, `path`, `theme`) VALUES
(1, 'Miscellaneous', NULL, NULL, 0, 0, 20000, 1, 1, 1, 1390393232, 1, '/1', NULL),
(2, 'Repeat Courses', '', '<p>Repeat Courses Description</p>', 1, 0, 10000, 1, 1, 1, 1390913230, 1, '/2', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completions`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `timeenrolled` bigint(10) NOT NULL DEFAULT '0',
  `timestarted` bigint(10) NOT NULL DEFAULT '0',
  `timecompleted` bigint(10) DEFAULT NULL,
  `reaggregate` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcomp_usecou_uix` (`userid`,`course`),
  KEY `mdl_courcomp_use_ix` (`userid`),
  KEY `mdl_courcomp_cou_ix` (`course`),
  KEY `mdl_courcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_aggr_methd`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_aggr_methd` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(20) DEFAULT NULL,
  `method` tinyint(1) NOT NULL DEFAULT '0',
  `value` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompaggrmeth_coucr_uix` (`course`,`criteriatype`),
  KEY `mdl_courcompaggrmeth_cou_ix` (`course`),
  KEY `mdl_courcompaggrmeth_cri_ix` (`criteriatype`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion aggregation methods for criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriatype` bigint(20) NOT NULL DEFAULT '0',
  `module` varchar(100) DEFAULT NULL,
  `moduleinstance` bigint(10) DEFAULT NULL,
  `courseinstance` bigint(10) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT NULL,
  `timeend` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) DEFAULT NULL,
  `role` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courcompcrit_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion criteria' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_completion_crit_compl`
--

CREATE TABLE IF NOT EXISTS `mdl_course_completion_crit_compl` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `criteriaid` bigint(10) NOT NULL DEFAULT '0',
  `gradefinal` decimal(10,5) DEFAULT NULL,
  `unenroled` bigint(10) DEFAULT NULL,
  `timecompleted` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courcompcritcomp_useco_uix` (`userid`,`course`,`criteriaid`),
  KEY `mdl_courcompcritcomp_use_ix` (`userid`),
  KEY `mdl_courcompcritcomp_cou_ix` (`course`),
  KEY `mdl_courcompcritcomp_cri_ix` (`criteriaid`),
  KEY `mdl_courcompcritcomp_tim_ix` (`timecompleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Course completion user records' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_format_options`
--

CREATE TABLE IF NOT EXISTS `mdl_course_format_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `format` varchar(21) NOT NULL DEFAULT '',
  `sectionid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courformopti_couforsec_uix` (`courseid`,`format`,`sectionid`,`name`),
  KEY `mdl_courformopti_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_course_format_options`
--

INSERT INTO `mdl_course_format_options` (`id`, `courseid`, `format`, `sectionid`, `name`, `value`) VALUES
(1, 1, 'site', 0, 'coursedisplay', '0'),
(2, 1, 'site', 0, 'numsections', '1'),
(3, 1, 'site', 0, 'hiddensections', '0'),
(4, 2, 'weeks', 0, 'coursedisplay', '0'),
(5, 2, 'weeks', 0, 'numsections', '10'),
(6, 2, 'weeks', 0, 'hiddensections', '0'),
(7, 3, 'weeks', 0, 'coursedisplay', '0'),
(8, 3, 'weeks', 0, 'numsections', '10'),
(9, 3, 'weeks', 0, 'hiddensections', '0');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` bigint(10) NOT NULL DEFAULT '0',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `idnumber` varchar(100) DEFAULT NULL,
  `added` bigint(10) NOT NULL DEFAULT '0',
  `score` smallint(4) NOT NULL DEFAULT '0',
  `indent` mediumint(5) NOT NULL DEFAULT '0',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `visibleold` tinyint(1) NOT NULL DEFAULT '1',
  `groupmode` smallint(4) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupmembersonly` smallint(4) NOT NULL DEFAULT '0',
  `completion` tinyint(1) NOT NULL DEFAULT '0',
  `completiongradeitemnumber` bigint(10) DEFAULT NULL,
  `completionview` tinyint(1) NOT NULL DEFAULT '0',
  `completionexpected` bigint(10) NOT NULL DEFAULT '0',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `showdescription` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_courmodu_vis_ix` (`visible`),
  KEY `mdl_courmodu_cou_ix` (`course`),
  KEY `mdl_courmodu_mod_ix` (`module`),
  KEY `mdl_courmodu_ins_ix` (`instance`),
  KEY `mdl_courmodu_idncou_ix` (`idnumber`,`course`),
  KEY `mdl_courmodu_gro_ix` (`groupingid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='course_modules table retrofitted from MySQL' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_course_modules`
--

INSERT INTO `mdl_course_modules` (`id`, `course`, `module`, `instance`, `section`, `idnumber`, `added`, `score`, `indent`, `visible`, `visibleold`, `groupmode`, `groupingid`, `groupmembersonly`, `completion`, `completiongradeitemnumber`, `completionview`, `completionexpected`, `availablefrom`, `availableuntil`, `showavailability`, `showdescription`) VALUES
(1, 2, 10, 1, 2, NULL, 1390480416, 0, 0, 1, 1, 0, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(2, 2, 24, 1, 2, '', 1390831929, 0, 0, 1, 1, 1, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0),
(3, 3, 10, 2, 14, NULL, 1390915899, 0, 0, 1, 1, 1, 0, 0, 0, NULL, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_availability`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavai_cou_ix` (`coursemoduleid`),
  KEY `mdl_courmoduavai_sou_ix` (`sourcecmid`),
  KEY `mdl_courmoduavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table stores conditions that affect whether a module/activit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_avail_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userfield` varchar(50) DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courmoduavaifiel_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_modules_completion`
--

CREATE TABLE IF NOT EXISTS `mdl_course_modules_completion` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursemoduleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `completionstate` tinyint(1) NOT NULL,
  `viewed` tinyint(1) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_courmoducomp_usecou_uix` (`userid`,`coursemoduleid`),
  KEY `mdl_courmoducomp_cou_ix` (`coursemoduleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the completion state (completed or not completed, etc' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_published`
--

CREATE TABLE IF NOT EXISTS `mdl_course_published` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `huburl` varchar(255) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `timepublished` bigint(10) NOT NULL,
  `enrollable` tinyint(1) NOT NULL DEFAULT '1',
  `hubcourseid` bigint(10) NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `timechecked` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about how and when an local courses were publish' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_request`
--

CREATE TABLE IF NOT EXISTS `mdl_course_request` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `category` bigint(10) NOT NULL DEFAULT '0',
  `reason` longtext NOT NULL,
  `requester` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_courrequ_sho_ix` (`shortname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='course requests' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `section` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `summary` longtext,
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `sequence` longtext,
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  `availablefrom` bigint(10) NOT NULL DEFAULT '0',
  `availableuntil` bigint(10) NOT NULL DEFAULT '0',
  `showavailability` tinyint(1) NOT NULL DEFAULT '0',
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_coursect_cousec_uix` (`course`,`section`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='to define the sections for each course' AUTO_INCREMENT=25 ;

--
-- Dumping data for table `mdl_course_sections`
--

INSERT INTO `mdl_course_sections` (`id`, `course`, `section`, `name`, `summary`, `summaryformat`, `sequence`, `visible`, `availablefrom`, `availableuntil`, `showavailability`, `groupingid`) VALUES
(1, 1, 1, NULL, '', 1, '', 1, 0, 0, 0, 0),
(2, 2, 0, NULL, NULL, 1, '1,2', 1, 0, 0, 0, 0),
(3, 2, 1, NULL, '', 1, '', 1, 0, 0, 0, 0),
(4, 2, 2, NULL, '', 1, '', 1, 0, 0, 0, 0),
(5, 2, 3, NULL, '', 1, '', 1, 0, 0, 0, 0),
(6, 2, 4, NULL, '', 1, '', 1, 0, 0, 0, 0),
(7, 2, 5, NULL, '', 1, '', 1, 0, 0, 0, 0),
(8, 2, 6, NULL, '', 1, '', 1, 0, 0, 0, 0),
(9, 2, 7, NULL, '', 1, '', 1, 0, 0, 0, 0),
(10, 2, 8, NULL, '', 1, '', 1, 0, 0, 0, 0),
(11, 2, 9, NULL, '', 1, '', 1, 0, 0, 0, 0),
(12, 2, 10, NULL, '', 1, '', 1, 0, 0, 0, 0),
(13, 1, 0, NULL, '', 1, '', 1, 0, 0, 0, 0),
(14, 3, 0, NULL, NULL, 1, '3', 1, 0, 0, 0, 0),
(15, 3, 1, NULL, '', 1, '', 1, 0, 0, 0, 0),
(16, 3, 2, NULL, '', 1, '', 1, 0, 0, 0, 0),
(17, 3, 3, NULL, '', 1, '', 1, 0, 0, 0, 0),
(18, 3, 4, NULL, '', 1, '', 1, 0, 0, 0, 0),
(19, 3, 5, NULL, '', 1, '', 1, 0, 0, 0, 0),
(20, 3, 6, NULL, '', 1, '', 1, 0, 0, 0, 0),
(21, 3, 7, NULL, '', 1, '', 1, 0, 0, 0, 0),
(22, 3, 8, NULL, '', 1, '', 1, 0, 0, 0, 0),
(23, 3, 9, NULL, '', 1, '', 1, 0, 0, 0, 0),
(24, 3, 10, NULL, '', 1, '', 1, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections_availability`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections_availability` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `sourcecmid` bigint(10) DEFAULT NULL,
  `requiredcompletion` tinyint(1) DEFAULT NULL,
  `gradeitemid` bigint(10) DEFAULT NULL,
  `grademin` decimal(10,5) DEFAULT NULL,
  `grademax` decimal(10,5) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavai_cou_ix` (`coursesectionid`),
  KEY `mdl_coursectavai_sou_ix` (`sourcecmid`),
  KEY `mdl_coursectavai_gra_ix` (`gradeitemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Completion or grade conditions that affect if a section is c' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_course_sections_avail_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_course_sections_avail_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `coursesectionid` bigint(10) NOT NULL,
  `userfield` varchar(50) DEFAULT NULL,
  `customfieldid` bigint(10) DEFAULT NULL,
  `operator` varchar(20) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_coursectavaifiel_cou_ix` (`coursesectionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data`
--

CREATE TABLE IF NOT EXISTS `mdl_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `comments` smallint(4) NOT NULL DEFAULT '0',
  `timeavailablefrom` bigint(10) NOT NULL DEFAULT '0',
  `timeavailableto` bigint(10) NOT NULL DEFAULT '0',
  `timeviewfrom` bigint(10) NOT NULL DEFAULT '0',
  `timeviewto` bigint(10) NOT NULL DEFAULT '0',
  `requiredentries` int(8) NOT NULL DEFAULT '0',
  `requiredentriestoview` int(8) NOT NULL DEFAULT '0',
  `maxentries` int(8) NOT NULL DEFAULT '0',
  `rssarticles` smallint(4) NOT NULL DEFAULT '0',
  `singletemplate` longtext,
  `listtemplate` longtext,
  `listtemplateheader` longtext,
  `listtemplatefooter` longtext,
  `addtemplate` longtext,
  `rsstemplate` longtext,
  `rsstitletemplate` longtext,
  `csstemplate` longtext,
  `jstemplate` longtext,
  `asearchtemplate` longtext,
  `approval` smallint(4) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `defaultsort` bigint(10) NOT NULL DEFAULT '0',
  `defaultsortdir` smallint(4) NOT NULL DEFAULT '0',
  `editany` smallint(4) NOT NULL DEFAULT '0',
  `notification` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_data_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all database activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_content`
--

CREATE TABLE IF NOT EXISTS `mdl_data_content` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `recordid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext,
  `content1` longtext,
  `content2` longtext,
  `content3` longtext,
  `content4` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_datacont_rec_ix` (`recordid`),
  KEY `mdl_datacont_fie_ix` (`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the content introduced in each record/fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_fields`
--

CREATE TABLE IF NOT EXISTS `mdl_data_fields` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  `param6` longtext,
  `param7` longtext,
  `param8` longtext,
  `param9` longtext,
  `param10` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_datafiel_typdat_ix` (`type`,`dataid`),
  KEY `mdl_datafiel_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every field available' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_data_records`
--

CREATE TABLE IF NOT EXISTS `mdl_data_records` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `dataid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `approved` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_datareco_dat_ix` (`dataid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='every record introduced' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `enrol` varchar(20) NOT NULL DEFAULT '',
  `status` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `enrolperiod` bigint(10) DEFAULT '0',
  `enrolstartdate` bigint(10) DEFAULT '0',
  `enrolenddate` bigint(10) DEFAULT '0',
  `expirynotify` tinyint(1) DEFAULT '0',
  `expirythreshold` bigint(10) DEFAULT '0',
  `notifyall` tinyint(1) DEFAULT '0',
  `password` varchar(50) DEFAULT NULL,
  `cost` varchar(20) DEFAULT NULL,
  `currency` varchar(3) DEFAULT NULL,
  `roleid` bigint(10) DEFAULT '0',
  `customint1` bigint(10) DEFAULT NULL,
  `customint2` bigint(10) DEFAULT NULL,
  `customint3` bigint(10) DEFAULT NULL,
  `customint4` bigint(10) DEFAULT NULL,
  `customint5` bigint(10) DEFAULT NULL,
  `customint6` bigint(10) DEFAULT NULL,
  `customint7` bigint(10) DEFAULT NULL,
  `customint8` bigint(10) DEFAULT NULL,
  `customchar1` varchar(255) DEFAULT NULL,
  `customchar2` varchar(255) DEFAULT NULL,
  `customchar3` varchar(1333) DEFAULT NULL,
  `customdec1` decimal(12,7) DEFAULT NULL,
  `customdec2` decimal(12,7) DEFAULT NULL,
  `customtext1` longtext,
  `customtext2` longtext,
  `customtext3` longtext,
  `customtext4` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enro_enr_ix` (`enrol`),
  KEY `mdl_enro_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Instances of enrolment plugins used in courses, fields marke' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `mdl_enrol`
--

INSERT INTO `mdl_enrol` (`id`, `enrol`, `status`, `courseid`, `sortorder`, `name`, `enrolperiod`, `enrolstartdate`, `enrolenddate`, `expirynotify`, `expirythreshold`, `notifyall`, `password`, `cost`, `currency`, `roleid`, `customint1`, `customint2`, `customint3`, `customint4`, `customint5`, `customint6`, `customint7`, `customint8`, `customchar1`, `customchar2`, `customchar3`, `customdec1`, `customdec2`, `customtext1`, `customtext2`, `customtext3`, `customtext4`, `timecreated`, `timemodified`) VALUES
(1, 'manual', 0, 2, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1390480406, 1390480406),
(2, 'guest', 1, 2, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1390480406, 1390480406),
(3, 'self', 1, 2, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1390480406, 1390480406),
(4, 'manual', 0, 3, 0, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1390915875, 1390915875),
(5, 'guest', 1, 3, 1, NULL, 0, 0, 0, 0, 0, 0, '', NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1390915875, 1390993915),
(6, 'self', 0, 3, 2, NULL, 0, 0, 0, 0, 86400, 0, NULL, NULL, NULL, 5, 0, 0, 0, 1, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1390915875, 1390915875);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_flatfile`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_flatfile` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` varchar(30) NOT NULL DEFAULT '',
  `roleid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `courseid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_enroflat_cou_ix` (`courseid`),
  KEY `mdl_enroflat_use_ix` (`userid`),
  KEY `mdl_enroflat_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='enrol_flatfile table retrofitted from MySQL' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_enrol_paypal`
--

CREATE TABLE IF NOT EXISTS `mdl_enrol_paypal` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `business` varchar(255) NOT NULL DEFAULT '',
  `receiver_email` varchar(255) NOT NULL DEFAULT '',
  `receiver_id` varchar(255) NOT NULL DEFAULT '',
  `item_name` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `instanceid` bigint(10) NOT NULL DEFAULT '0',
  `memo` varchar(255) NOT NULL DEFAULT '',
  `tax` varchar(255) NOT NULL DEFAULT '',
  `option_name1` varchar(255) NOT NULL DEFAULT '',
  `option_selection1_x` varchar(255) NOT NULL DEFAULT '',
  `option_name2` varchar(255) NOT NULL DEFAULT '',
  `option_selection2_x` varchar(255) NOT NULL DEFAULT '',
  `payment_status` varchar(255) NOT NULL DEFAULT '',
  `pending_reason` varchar(255) NOT NULL DEFAULT '',
  `reason_code` varchar(30) NOT NULL DEFAULT '',
  `txn_id` varchar(255) NOT NULL DEFAULT '',
  `parent_txn_id` varchar(255) NOT NULL DEFAULT '',
  `payment_type` varchar(30) NOT NULL DEFAULT '',
  `timeupdated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds all known information about PayPal transactions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event`
--

CREATE TABLE IF NOT EXISTS `mdl_event` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` longtext NOT NULL,
  `description` longtext NOT NULL,
  `format` smallint(4) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `repeatid` bigint(10) NOT NULL DEFAULT '0',
  `modulename` varchar(20) NOT NULL DEFAULT '',
  `instance` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeduration` bigint(10) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '1',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `sequence` bigint(10) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `subscriptionid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_even_cou_ix` (`courseid`),
  KEY `mdl_even_use_ix` (`userid`),
  KEY `mdl_even_tim_ix` (`timestart`),
  KEY `mdl_even_tim2_ix` (`timeduration`),
  KEY `mdl_even_grocouvisuse_ix` (`groupid`,`courseid`,`visible`,`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='For everything with a time associated to it' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_event`
--

INSERT INTO `mdl_event` (`id`, `name`, `description`, `format`, `courseid`, `groupid`, `userid`, `repeatid`, `modulename`, `instance`, `eventtype`, `timestart`, `timeduration`, `visible`, `uuid`, `sequence`, `timemodified`, `subscriptionid`) VALUES
(1, 'course event', '<p>crs vnt</p>', 1, 2, 0, 2, 0, '0', 0, 'course', 1390576800, 2100, 1, '', 1, 1390576951, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventname` varchar(166) NOT NULL DEFAULT '',
  `component` varchar(166) NOT NULL DEFAULT '',
  `handlerfile` varchar(255) NOT NULL DEFAULT '',
  `handlerfunction` longtext,
  `schedule` varchar(255) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `internal` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_evenhand_evecom_uix` (`eventname`,`component`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table is for storing which components requests what typ' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_events_handlers`
--

INSERT INTO `mdl_events_handlers` (`id`, `eventname`, `component`, `handlerfile`, `handlerfunction`, `schedule`, `status`, `internal`) VALUES
(1, 'portfolio_send', 'moodle', '/lib/portfoliolib.php', 's:22:"portfolio_handle_event";', 'cron', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `eventdata` longtext NOT NULL,
  `stackdump` longtext,
  `userid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueu_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table is for storing queued events. It stores only one ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_events_queue_handlers`
--

CREATE TABLE IF NOT EXISTS `mdl_events_queue_handlers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `queuedeventid` bigint(10) NOT NULL,
  `handlerid` bigint(10) NOT NULL,
  `status` bigint(10) DEFAULT NULL,
  `errormessage` longtext,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_evenqueuhand_que_ix` (`queuedeventid`),
  KEY `mdl_evenqueuhand_han_ix` (`handlerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This is the list of queued handlers for processing. The even' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_event_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_event_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) NOT NULL DEFAULT '',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `eventtype` varchar(20) NOT NULL DEFAULT '',
  `pollinterval` bigint(10) NOT NULL DEFAULT '0',
  `lastupdated` bigint(10) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `classname` varchar(100) NOT NULL DEFAULT '',
  `methodname` varchar(100) NOT NULL DEFAULT '',
  `classpath` varchar(255) DEFAULT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `capabilities` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_extefunc_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='list of all external functions' AUTO_INCREMENT=114 ;

--
-- Dumping data for table `mdl_external_functions`
--

INSERT INTO `mdl_external_functions` (`id`, `name`, `classname`, `methodname`, `classpath`, `component`, `capabilities`) VALUES
(1, 'moodle_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(2, 'core_group_create_groups', 'core_group_external', 'create_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(3, 'moodle_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(4, 'core_group_get_groups', 'core_group_external', 'get_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(5, 'moodle_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(6, 'core_group_get_course_groups', 'core_group_external', 'get_course_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(7, 'moodle_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(8, 'core_group_delete_groups', 'core_group_external', 'delete_groups', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(9, 'moodle_group_get_groupmembers', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(10, 'core_group_get_group_members', 'core_group_external', 'get_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(11, 'moodle_group_add_groupmembers', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(12, 'core_group_add_group_members', 'core_group_external', 'add_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(13, 'moodle_group_delete_groupmembers', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(14, 'core_group_delete_group_members', 'core_group_external', 'delete_group_members', 'group/externallib.php', 'moodle', 'moodle/course:managegroups'),
(15, 'core_group_create_groupings', 'core_group_external', 'create_groupings', 'group/externallib.php', 'moodle', ''),
(16, 'core_group_update_groupings', 'core_group_external', 'update_groupings', 'group/externallib.php', 'moodle', ''),
(17, 'core_group_get_groupings', 'core_group_external', 'get_groupings', 'group/externallib.php', 'moodle', ''),
(18, 'core_group_get_course_groupings', 'core_group_external', 'get_course_groupings', 'group/externallib.php', 'moodle', ''),
(19, 'core_group_delete_groupings', 'core_group_external', 'delete_groupings', 'group/externallib.php', 'moodle', ''),
(20, 'core_group_assign_grouping', 'core_group_external', 'assign_grouping', 'group/externallib.php', 'moodle', ''),
(21, 'core_group_unassign_grouping', 'core_group_external', 'unassign_grouping', 'group/externallib.php', 'moodle', ''),
(22, 'moodle_file_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(23, 'core_files_get_files', 'core_files_external', 'get_files', 'files/externallib.php', 'moodle', ''),
(24, 'moodle_file_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(25, 'core_files_upload', 'core_files_external', 'upload', 'files/externallib.php', 'moodle', ''),
(26, 'moodle_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(27, 'core_user_create_users', 'core_user_external', 'create_users', 'user/externallib.php', 'moodle', 'moodle/user:create'),
(28, 'moodle_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(29, 'core_user_get_users_by_id', 'core_user_external', 'get_users_by_id', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(30, 'moodle_user_get_users_by_courseid', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(31, 'moodle_user_get_course_participants_by_id', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(32, 'core_user_get_course_user_profiles', 'core_user_external', 'get_course_user_profiles', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(33, 'moodle_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(34, 'core_user_delete_users', 'core_user_external', 'delete_users', 'user/externallib.php', 'moodle', 'moodle/user:delete'),
(35, 'moodle_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(36, 'core_user_update_users', 'core_user_external', 'update_users', 'user/externallib.php', 'moodle', 'moodle/user:update'),
(37, 'moodle_enrol_get_enrolled_users', 'moodle_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/site:viewparticipants, moodle/course:viewparticipants,\n            moodle/role:review, moodle/site:accessallgroups, moodle/course:enrolreview'),
(38, 'core_enrol_get_enrolled_users', 'core_enrol_external', 'get_enrolled_users', 'enrol/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update, moodle/site:accessallgroups'),
(39, 'moodle_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(40, 'core_enrol_get_users_courses', 'core_enrol_external', 'get_users_courses', 'enrol/externallib.php', 'moodle', 'moodle/course:viewparticipants'),
(41, 'moodle_role_assign', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(42, 'core_role_assign_roles', 'core_role_external', 'assign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(43, 'moodle_role_unassign', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(44, 'core_role_unassign_roles', 'core_role_external', 'unassign_roles', 'enrol/externallib.php', 'moodle', 'moodle/role:assign'),
(45, 'core_course_get_contents', 'core_course_external', 'get_course_contents', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:viewhiddencourses'),
(46, 'moodle_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(47, 'core_course_get_courses', 'core_course_external', 'get_courses', 'course/externallib.php', 'moodle', 'moodle/course:view,moodle/course:update,moodle/course:viewhiddencourses'),
(48, 'moodle_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(49, 'core_course_create_courses', 'core_course_external', 'create_courses', 'course/externallib.php', 'moodle', 'moodle/course:create,moodle/course:visibility'),
(50, 'core_course_delete_courses', 'core_course_external', 'delete_courses', 'course/externallib.php', 'moodle', 'moodle/course:delete'),
(51, 'core_course_duplicate_course', 'core_course_external', 'duplicate_course', 'course/externallib.php', 'moodle', 'moodle/backup:backupcourse,moodle/restore:restorecourse,moodle/course:create'),
(52, 'core_course_get_categories', 'core_course_external', 'get_categories', 'course/externallib.php', 'moodle', 'moodle/category:viewhiddencategories'),
(53, 'core_course_create_categories', 'core_course_external', 'create_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(54, 'core_course_update_categories', 'core_course_external', 'update_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(55, 'core_course_delete_categories', 'core_course_external', 'delete_categories', 'course/externallib.php', 'moodle', 'moodle/category:manage'),
(56, 'moodle_message_send_instantmessages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(57, 'core_message_send_instant_messages', 'core_message_external', 'send_instant_messages', 'message/externallib.php', 'moodle', 'moodle/site:sendmessage'),
(58, 'moodle_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(59, 'core_notes_create_notes', 'core_notes_external', 'create_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(60, 'moodle_webservice_get_siteinfo', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(61, 'core_webservice_get_site_info', 'core_webservice_external', 'get_site_info', 'webservice/externallib.php', 'moodle', ''),
(62, 'moodle_enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(63, 'enrol_manual_enrol_users', 'enrol_manual_external', 'enrol_users', 'enrol/manual/externallib.php', 'enrol_manual', 'enrol/manual:enrol'),
(64, 'core_cohort_create_cohorts', 'core_cohort_external', 'create_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(65, 'core_cohort_delete_cohorts', 'core_cohort_external', 'delete_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(66, 'core_cohort_get_cohorts', 'core_cohort_external', 'get_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(67, 'core_cohort_update_cohorts', 'core_cohort_external', 'update_cohorts', 'cohort/externallib.php', 'moodle', 'moodle/cohort:manage'),
(68, 'core_cohort_add_cohort_members', 'core_cohort_external', 'add_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(69, 'core_cohort_delete_cohort_members', 'core_cohort_external', 'delete_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:assign'),
(70, 'core_cohort_get_cohort_members', 'core_cohort_external', 'get_cohort_members', 'cohort/externallib.php', 'moodle', 'moodle/cohort:view'),
(71, 'core_user_get_users', 'core_user_external', 'get_users', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(72, 'core_user_get_users_by_field', 'core_user_external', 'get_users_by_field', 'user/externallib.php', 'moodle', 'moodle/user:viewdetails, moodle/user:viewhiddendetails, moodle/course:useremail, moodle/user:update'),
(73, 'core_enrol_get_enrolled_users_with_capability', 'core_enrol_external', 'get_enrolled_users_with_capability', 'enrol/externallib.php', 'moodle', ''),
(74, 'core_course_delete_modules', 'core_course_external', 'delete_modules', 'course/externallib.php', 'moodle', 'moodle/course:manageactivities'),
(75, 'core_course_update_courses', 'core_course_external', 'update_courses', 'course/externallib.php', 'moodle', 'moodle/course:update,moodle/course:changecategory,moodle/course:changefullname,moodle/course:changeshortname,moodle/course:changeidnumber,moodle/course:changesummary,moodle/course:visibility'),
(76, 'core_course_import_course', 'core_course_external', 'import_course', 'course/externallib.php', 'moodle', 'moodle/backup:backuptargetimport, moodle/restore:restoretargetimport'),
(77, 'core_message_create_contacts', 'core_message_external', 'create_contacts', 'message/externallib.php', 'moodle', ''),
(78, 'core_message_delete_contacts', 'core_message_external', 'delete_contacts', 'message/externallib.php', 'moodle', ''),
(79, 'core_message_block_contacts', 'core_message_external', 'block_contacts', 'message/externallib.php', 'moodle', ''),
(80, 'core_message_unblock_contacts', 'core_message_external', 'unblock_contacts', 'message/externallib.php', 'moodle', ''),
(81, 'core_message_get_contacts', 'core_message_external', 'get_contacts', 'message/externallib.php', 'moodle', ''),
(82, 'core_message_search_contacts', 'core_message_external', 'search_contacts', 'message/externallib.php', 'moodle', ''),
(83, 'core_notes_delete_notes', 'core_notes_external', 'delete_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(84, 'core_notes_get_notes', 'core_notes_external', 'get_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:view'),
(85, 'core_notes_update_notes', 'core_notes_external', 'update_notes', 'notes/externallib.php', 'moodle', 'moodle/notes:manage'),
(86, 'core_grade_get_definitions', 'core_grade_external', 'get_definitions', 'grade/externallib.php', 'moodle', ''),
(87, 'core_get_string', 'core_external', 'get_string', 'lib/external/externallib.php', 'moodle', ''),
(88, 'core_get_strings', 'core_external', 'get_strings', 'lib/external/externallib.php', 'moodle', ''),
(89, 'core_get_component_strings', 'core_external', 'get_component_strings', 'lib/external/externallib.php', 'moodle', ''),
(90, 'core_calendar_delete_calendar_events', 'core_calendar_external', 'delete_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(91, 'core_calendar_get_calendar_events', 'core_calendar_external', 'get_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(92, 'core_calendar_create_calendar_events', 'core_calendar_external', 'create_calendar_events', 'calendar/externallib.php', 'moodle', 'moodle/calendar:manageentries'),
(93, 'mod_assign_get_grades', 'mod_assign_external', 'get_grades', 'mod/assign/externallib.php', 'mod_assign', ''),
(94, 'mod_assign_get_assignments', 'mod_assign_external', 'get_assignments', 'mod/assign/externallib.php', 'mod_assign', ''),
(95, 'mod_assign_get_submissions', 'mod_assign_external', 'get_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(96, 'mod_forum_get_forums_by_courses', 'mod_forum_external', 'get_forums_by_courses', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion'),
(97, 'mod_forum_get_forum_discussions', 'mod_forum_external', 'get_forum_discussions', 'mod/forum/externallib.php', 'mod_forum', 'mod/forum:viewdiscussion, mod/forum:viewqandawithoutposting'),
(98, 'core_user_add_user_device', 'core_user_external', 'add_user_device', 'user/externallib.php', 'moodle', ''),
(99, 'core_enrol_get_course_enrolment_methods', 'core_enrol_external', 'get_course_enrolment_methods', 'enrol/externallib.php', 'moodle', ''),
(100, 'core_grading_get_definitions', 'core_grading_external', 'get_definitions', 'grade/externallib.php', 'moodle', ''),
(101, 'core_grading_get_gradingform_instances', 'core_grading_external', 'get_gradingform_instances', 'grade/externallib.php', 'moodle', ''),
(102, 'mod_assign_get_user_flags', 'mod_assign_external', 'get_user_flags', 'mod/assign/externallib.php', 'mod_assign', ''),
(103, 'mod_assign_set_user_flags', 'mod_assign_external', 'set_user_flags', 'mod/assign/externallib.php', 'mod_assign', 'mod/assign:grade'),
(104, 'mod_assign_get_user_mappings', 'mod_assign_external', 'get_user_mappings', 'mod/assign/externallib.php', 'mod_assign', ''),
(105, 'mod_assign_revert_submissions_to_draft', 'mod_assign_external', 'revert_submissions_to_draft', 'mod/assign/externallib.php', 'mod_assign', ''),
(106, 'mod_assign_lock_submissions', 'mod_assign_external', 'lock_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(107, 'mod_assign_unlock_submissions', 'mod_assign_external', 'unlock_submissions', 'mod/assign/externallib.php', 'mod_assign', ''),
(108, 'mod_assign_save_submission', 'mod_assign_external', 'save_submission', 'mod/assign/externallib.php', 'mod_assign', ''),
(109, 'mod_assign_submit_for_grading', 'mod_assign_external', 'submit_for_grading', 'mod/assign/externallib.php', 'mod_assign', ''),
(110, 'mod_assign_save_grade', 'mod_assign_external', 'save_grade', 'mod/assign/externallib.php', 'mod_assign', ''),
(111, 'mod_assign_save_user_extensions', 'mod_assign_external', 'save_user_extensions', 'mod/assign/externallib.php', 'mod_assign', ''),
(112, 'mod_assign_reveal_identities', 'mod_assign_external', 'reveal_identities', 'mod/assign/externallib.php', 'mod_assign', ''),
(113, 'enrol_self_get_instance_info', 'enrol_self_external', 'get_instance_info', 'enrol/self/externallib.php', 'enrol_self', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  `requiredcapability` varchar(150) DEFAULT NULL,
  `restrictedusers` tinyint(1) NOT NULL,
  `component` varchar(100) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) DEFAULT NULL,
  `downloadfiles` tinyint(1) NOT NULL DEFAULT '0',
  `uploadfiles` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_exteserv_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='built in and custom external services' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_external_services`
--

INSERT INTO `mdl_external_services` (`id`, `name`, `enabled`, `requiredcapability`, `restrictedusers`, `component`, `timecreated`, `timemodified`, `shortname`, `downloadfiles`, `uploadfiles`) VALUES
(1, 'Moodle mobile web service', 0, NULL, 0, 'moodle', 1390393233, NULL, 'moodle_mobile_app', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_functions`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_functions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `functionname` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_exteservfunc_ext_ix` (`externalserviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='lists functions available in each service group' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_external_services_functions`
--

INSERT INTO `mdl_external_services_functions` (`id`, `externalserviceid`, `functionname`) VALUES
(1, 1, 'moodle_enrol_get_users_courses'),
(2, 1, 'moodle_enrol_get_enrolled_users'),
(3, 1, 'moodle_user_get_users_by_id'),
(4, 1, 'moodle_webservice_get_siteinfo'),
(5, 1, 'moodle_notes_create_notes'),
(6, 1, 'moodle_user_get_course_participants_by_id'),
(7, 1, 'moodle_user_get_users_by_courseid'),
(8, 1, 'moodle_message_send_instantmessages'),
(9, 1, 'core_course_get_contents'),
(10, 1, 'core_get_component_strings'),
(11, 1, 'core_user_add_user_device');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_services_users`
--

CREATE TABLE IF NOT EXISTS `mdl_external_services_users` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `externalserviceid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_exteservuser_ext_ix` (`externalserviceid`),
  KEY `mdl_exteservuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='users allowed to use services with restricted users flag' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_external_tokens`
--

CREATE TABLE IF NOT EXISTS `mdl_external_tokens` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(128) NOT NULL DEFAULT '',
  `tokentype` smallint(4) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `externalserviceid` bigint(10) NOT NULL,
  `sid` varchar(128) DEFAULT NULL,
  `contextid` bigint(10) NOT NULL,
  `creatorid` bigint(20) NOT NULL DEFAULT '1',
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `lastaccess` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_extetoke_use_ix` (`userid`),
  KEY `mdl_extetoke_ext_ix` (`externalserviceid`),
  KEY `mdl_extetoke_con_ix` (`contextid`),
  KEY `mdl_extetoke_cre_ix` (`creatorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Security tokens for accessing of external services' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `anonymous` tinyint(1) NOT NULL DEFAULT '1',
  `email_notification` tinyint(1) NOT NULL DEFAULT '1',
  `multiple_submit` tinyint(1) NOT NULL DEFAULT '1',
  `autonumbering` tinyint(1) NOT NULL DEFAULT '1',
  `site_after_submit` varchar(255) NOT NULL DEFAULT '',
  `page_after_submit` longtext NOT NULL,
  `page_after_submitformat` tinyint(2) NOT NULL DEFAULT '0',
  `publish_stats` tinyint(1) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionsubmit` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feed_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all feedbacks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completed`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completed` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use_ix` (`userid`),
  KEY `mdl_feedcomp_fee_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_completedtmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_completedtmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `guestid` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `random_response` bigint(10) NOT NULL DEFAULT '0',
  `anonymous_response` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedcomp_use2_ix` (`userid`),
  KEY `mdl_feedcomp_fee2_ix` (`feedback`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='filled out feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_item`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_item` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) NOT NULL DEFAULT '',
  `presentation` longtext NOT NULL,
  `typ` varchar(255) NOT NULL DEFAULT '',
  `hasvalue` tinyint(1) NOT NULL DEFAULT '0',
  `position` smallint(3) NOT NULL DEFAULT '0',
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `dependitem` bigint(10) NOT NULL DEFAULT '0',
  `dependvalue` varchar(255) NOT NULL DEFAULT '',
  `options` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feeditem_fee_ix` (`feedback`),
  KEY `mdl_feeditem_tem_ix` (`template`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback_items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_sitecourse_map`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_sitecourse_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `feedbackid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedsitemap_cou_ix` (`courseid`),
  KEY `mdl_feedsitemap_fee_ix` (`feedbackid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback sitecourse map' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_template`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_template` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtemp_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='templates of feedbackstructures' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_tracking`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_tracking` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `feedback` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_feedtrac_use_ix` (`userid`),
  KEY `mdl_feedtrac_fee_ix` (`feedback`),
  KEY `mdl_feedtrac_com_ix` (`completed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='feedback trackingdata' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_value`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_value` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou_ix` (`course_id`),
  KEY `mdl_feedvalu_ite_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completeds' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_feedback_valuetmp`
--

CREATE TABLE IF NOT EXISTS `mdl_feedback_valuetmp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course_id` bigint(10) NOT NULL DEFAULT '0',
  `item` bigint(10) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  `tmp_completed` bigint(10) NOT NULL DEFAULT '0',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_feedvalu_cou2_ix` (`course_id`),
  KEY `mdl_feedvalu_ite2_ix` (`item`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='values of the completedstmp' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files`
--

CREATE TABLE IF NOT EXISTS `mdl_files` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contenthash` varchar(40) NOT NULL DEFAULT '',
  `pathnamehash` varchar(40) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `filearea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `filepath` varchar(255) NOT NULL DEFAULT '',
  `filename` varchar(255) NOT NULL DEFAULT '',
  `userid` bigint(10) DEFAULT NULL,
  `filesize` bigint(10) NOT NULL,
  `mimetype` varchar(100) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `source` longtext,
  `author` varchar(255) DEFAULT NULL,
  `license` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `referencefileid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_file_pat_uix` (`pathnamehash`),
  KEY `mdl_file_comfilconite_ix` (`component`,`filearea`,`contextid`,`itemid`),
  KEY `mdl_file_con_ix` (`contenthash`),
  KEY `mdl_file_con2_ix` (`contextid`),
  KEY `mdl_file_use_ix` (`userid`),
  KEY `mdl_file_ref_ix` (`referencefileid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='description of files, content is stored in sha1 file pool' AUTO_INCREMENT=24 ;

--
-- Dumping data for table `mdl_files`
--

INSERT INTO `mdl_files` (`id`, `contenthash`, `pathnamehash`, `contextid`, `component`, `filearea`, `itemid`, `filepath`, `filename`, `userid`, `filesize`, `mimetype`, `status`, `source`, `author`, `license`, `timecreated`, `timemodified`, `sortorder`, `referencefileid`) VALUES
(1, '44b57b6bf6d066dfa1fa750b961ce5857e66a77c', 'bef556a96508d00e4ff3b0b15c2d81c6571617c5', 5, 'user', 'draft', 770019531, '/', 'haron.jpg', 2, 99257, 'image/jpeg', 0, 'O:8:"stdClass":1:{s:6:"source";s:9:"haron.jpg";}', 'Admin User', 'allrightsreserved', 1390571047, 1390571047, 0, NULL),
(2, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '28ffb8bc1a8936014d2ba791f04e561557587f11', 5, 'user', 'draft', 770019531, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1390571047, 1390571047, 0, NULL),
(3, 'ce48f83bf0751bf569d6ba94ff7f39faed6401a9', 'ff2b607ae6c0934c17d42cb11a7816de815eeeb8', 2, 'group', 'icon', 1, '/', 'f1.png', NULL, 25710, 'image/png', 0, NULL, NULL, NULL, 1390571055, 1390571055, 0, NULL),
(4, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', 'd37929d5ab2eb40b2743761655679092f73a68f7', 2, 'group', 'icon', 1, '/', '.', NULL, 0, NULL, 0, NULL, NULL, NULL, 1390571055, 1390571055, 0, NULL),
(5, '93471cc4e3646b3ce774c022381e89f50040349e', '570de6a33a281c77358caeeda68db984524ed2dd', 2, 'group', 'icon', 1, '/', 'f2.png', NULL, 3539, 'image/png', 0, NULL, NULL, NULL, 1390571055, 1390571055, 0, NULL),
(6, '9dbf30f4a8e327518e25833c43de0b8b87b07873', '5cf5aa1b1e65d3343aa59f1cd428f5b0a220d54b', 2, 'group', 'icon', 1, '/', 'f3.png', NULL, 459048, 'image/png', 0, NULL, NULL, NULL, 1390571055, 1390571055, 0, NULL),
(7, 'fb262df98d67c4e2a5c9802403821e00cf2992af', '508e674d49c30d4fde325fe6c7f6fd3d56b247e1', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'smile.png', 2, 1600, 'image/png', 0, NULL, NULL, NULL, 1390990774, 1390990774, 0, NULL),
(8, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '70b7cdade7b4e27d4e83f0cdaad10d6a3c0cccb5', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', '.', 2, 0, 'document/unknown', 0, NULL, NULL, NULL, 1390990774, 1390991332, 0, NULL),
(9, 'a4f146f120e7e00d21291b924e26aaabe9f4297a', '68317eab56c67d32aeaee5acf509a0c4aa828b6b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'sad.png', 2, 1702, 'image/png', 0, NULL, NULL, NULL, 1390990774, 1390990774, 0, NULL),
(10, '33957e31ba9c763a74638b825f0a9154acf475e1', '695a55ff780e61c9e59428aa425430b0d6bde53b', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'tick.png', 2, 1187, 'image/png', 0, NULL, NULL, NULL, 1390990774, 1390990774, 0, NULL),
(11, 'd613d55f37bb76d38d4ffb4b7b83e6c694778c30', '373e63af262a9b8466ba8632551520be793c37ff', 1, 'assignfeedback_editpdf', 'stamps', 0, '/', 'cross.png', 2, 1230, 'image/png', 0, NULL, NULL, NULL, 1390990774, 1390990774, 0, NULL),
(12, 'd613d55f37bb76d38d4ffb4b7b83e6c694778c30', 'c6f10cc69cc76352da1b5a03a9794447a7f86935', 5, 'user', 'draft', 405944824, '/', 'cross.png', 2, 1230, 'image/png', 0, 'O:8:"stdClass":2:{s:6:"source";N;s:8:"original";s:228:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjIyOiJhc3NpZ25mZWVkYmFja19lZGl0cGRmIjtzOjY6Iml0ZW1pZCI7aTowO3M6ODoiZmlsZWFyZWEiO3M6Njoic3RhbXBzIjtzOjg6ImZpbGVwYXRoIjtzOjE6Ii8iO3M6ODoiZmlsZW5hbWUiO3M6OToiY3Jvc3MucG5nIjt9";}', NULL, NULL, 1390990774, 1390990774, 0, NULL),
(13, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '5bf8e676cfd2f581b398bf140f9a063cc1366369', 5, 'user', 'draft', 405944824, '/', '.', 2, 0, NULL, 0, NULL, NULL, NULL, 1390991332, 1390991332, 0, NULL),
(14, 'a4f146f120e7e00d21291b924e26aaabe9f4297a', '81d2fb4efc8a7528d66e775818051587bec3c53a', 5, 'user', 'draft', 405944824, '/', 'sad.png', 2, 1702, 'image/png', 0, 'O:8:"stdClass":2:{s:6:"source";N;s:8:"original";s:228:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjIyOiJhc3NpZ25mZWVkYmFja19lZGl0cGRmIjtzOjY6Iml0ZW1pZCI7aTowO3M6ODoiZmlsZWFyZWEiO3M6Njoic3RhbXBzIjtzOjg6ImZpbGVwYXRoIjtzOjE6Ii8iO3M6ODoiZmlsZW5hbWUiO3M6Nzoic2FkLnBuZyI7fQ==";}', NULL, NULL, 1390990774, 1390990774, 0, NULL),
(15, 'fb262df98d67c4e2a5c9802403821e00cf2992af', '04753ad8ca8c5a263eba2537ccfffe45a192f7ff', 5, 'user', 'draft', 405944824, '/', 'smile.png', 2, 1600, 'image/png', 0, 'O:8:"stdClass":2:{s:6:"source";N;s:8:"original";s:228:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjIyOiJhc3NpZ25mZWVkYmFja19lZGl0cGRmIjtzOjY6Iml0ZW1pZCI7aTowO3M6ODoiZmlsZWFyZWEiO3M6Njoic3RhbXBzIjtzOjg6ImZpbGVwYXRoIjtzOjE6Ii8iO3M6ODoiZmlsZW5hbWUiO3M6OToic21pbGUucG5nIjt9";}', NULL, NULL, 1390990774, 1390990774, 0, NULL),
(16, '33957e31ba9c763a74638b825f0a9154acf475e1', 'ca9fabacf79de2b0a1a7547d34b20f9b0b32fead', 5, 'user', 'draft', 405944824, '/', 'tick.png', 2, 1187, 'image/png', 0, 'O:8:"stdClass":2:{s:6:"source";N;s:8:"original";s:228:"YTo2OntzOjk6ImNvbnRleHRpZCI7aToxO3M6OToiY29tcG9uZW50IjtzOjIyOiJhc3NpZ25mZWVkYmFja19lZGl0cGRmIjtzOjY6Iml0ZW1pZCI7aTowO3M6ODoiZmlsZWFyZWEiO3M6Njoic3RhbXBzIjtzOjg6ImZpbGVwYXRoIjtzOjE6Ii8iO3M6ODoiZmlsZW5hbWUiO3M6ODoidGljay5wbmciO30=";}', NULL, NULL, 1390990774, 1390990774, 0, NULL),
(17, 'f5fe5f1487ff68fd970759899a1efa869a49d62b', 'd7a0313a2e06929cbb9d22459a093b402c60adab', 1, 'core', 'preview', 0, '/thumb/', '33957e31ba9c763a74638b825f0a9154acf475e1', NULL, 1123, 'image/png', 0, NULL, NULL, NULL, 1390991337, 1390991337, 0, NULL),
(18, '4496d21cbced7b385cf59c0446694207a37e6186', '4c7fcf1b243afcd613e0a9ba9ba6332655f258ce', 1, 'core', 'preview', 0, '/thumb/', 'a4f146f120e7e00d21291b924e26aaabe9f4297a', NULL, 1432, 'image/png', 0, NULL, NULL, NULL, 1390991337, 1390991337, 0, NULL),
(19, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '74c104d54c05b5f8c633a36da516d37e6c5279e4', 1, 'core', 'preview', 0, '/thumb/', '.', NULL, 0, NULL, 0, NULL, NULL, NULL, 1390991337, 1390991337, 0, NULL),
(21, 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '884555719c50529b9df662a38619d04b5b11e25c', 1, 'core', 'preview', 0, '/', '.', NULL, 0, NULL, 0, NULL, NULL, NULL, 1390991337, 1390991337, 0, NULL),
(22, '7efae77d53d4f0d2b6d871831af6f53ef20b6649', '675477f925b106b0931b404346bdcfa37dc0616e', 1, 'core', 'preview', 0, '/thumb/', 'fb262df98d67c4e2a5c9802403821e00cf2992af', NULL, 1493, 'image/png', 0, NULL, NULL, NULL, 1390991337, 1390991337, 0, NULL),
(23, 'd2734626774fcce1a28a88316ba23e6d66bdf22a', 'c176d36b1573c5809911f6515652a5cfa93b9edd', 1, 'core', 'preview', 0, '/thumb/', 'd613d55f37bb76d38d4ffb4b7b83e6c694778c30', NULL, 1068, 'image/png', 0, NULL, NULL, NULL, 1390991337, 1390991337, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_files_reference`
--

CREATE TABLE IF NOT EXISTS `mdl_files_reference` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `repositoryid` bigint(10) NOT NULL,
  `lastsync` bigint(10) DEFAULT NULL,
  `reference` longtext,
  `referencehash` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filerefe_repref_uix` (`repositoryid`,`referencehash`),
  KEY `mdl_filerefe_rep_ix` (`repositoryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store files references' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_active`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_active` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `active` smallint(4) NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtacti_confil_uix` (`contextid`,`filter`),
  KEY `mdl_filtacti_con_ix` (`contextid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Stores information about which filters are active in which c' AUTO_INCREMENT=13 ;

--
-- Dumping data for table `mdl_filter_active`
--

INSERT INTO `mdl_filter_active` (`id`, `filter`, `contextid`, `active`, `sortorder`) VALUES
(1, 'activitynames', 1, 1, 1),
(2, 'mediaplugin', 1, 1, 2),
(3, 'algebra', 1, -9999, 3),
(4, 'urltolink', 1, -9999, 4),
(5, 'data', 1, -9999, 5),
(6, 'emoticon', 1, -9999, 6),
(7, 'emailprotect', 1, -9999, 7),
(8, 'glossary', 1, -9999, 8),
(9, 'tidy', 1, -9999, 9),
(10, 'multilang', 1, -9999, 10),
(11, 'tex', 1, -9999, 11),
(12, 'censor', 1, -9999, 12);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_filter_config`
--

CREATE TABLE IF NOT EXISTS `mdl_filter_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `filter` varchar(32) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_filtconf_confilnam_uix` (`contextid`,`filter`,`name`),
  KEY `mdl_filtconf_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores per-context configuration settings for filters which ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_folder`
--

CREATE TABLE IF NOT EXISTS `mdl_folder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `showexpanded` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `display` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_fold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one folder resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum`
--

CREATE TABLE IF NOT EXISTS `mdl_forum` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `type` varchar(20) NOT NULL DEFAULT 'general',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '0',
  `maxattachments` bigint(10) NOT NULL DEFAULT '1',
  `forcesubscribe` tinyint(1) NOT NULL DEFAULT '0',
  `trackingtype` tinyint(2) NOT NULL DEFAULT '1',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `warnafter` bigint(10) NOT NULL DEFAULT '0',
  `blockafter` bigint(10) NOT NULL DEFAULT '0',
  `blockperiod` bigint(10) NOT NULL DEFAULT '0',
  `completiondiscussions` int(9) NOT NULL DEFAULT '0',
  `completionreplies` int(9) NOT NULL DEFAULT '0',
  `completionposts` int(9) NOT NULL DEFAULT '0',
  `displaywordcount` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foru_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Forums contain and structure discussion' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_forum`
--

INSERT INTO `mdl_forum` (`id`, `course`, `type`, `name`, `intro`, `introformat`, `assessed`, `assesstimestart`, `assesstimefinish`, `scale`, `maxbytes`, `maxattachments`, `forcesubscribe`, `trackingtype`, `rsstype`, `rssarticles`, `timemodified`, `warnafter`, `blockafter`, `blockperiod`, `completiondiscussions`, `completionreplies`, `completionposts`, `displaywordcount`) VALUES
(1, 2, 'news', 'News forum', 'General news and announcements', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1390480416, 0, 0, 0, 0, 0, 0, 0),
(2, 3, 'news', 'News forum', 'General news and announcements', 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 1390915899, 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_digests`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_digests` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `forum` bigint(10) NOT NULL,
  `maildigest` tinyint(1) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_forudige_forusemai_uix` (`forum`,`userid`,`maildigest`),
  KEY `mdl_forudige_use_ix` (`userid`),
  KEY `mdl_forudige_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_discussions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_discussions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `firstpost` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '-1',
  `assessed` tinyint(1) NOT NULL DEFAULT '1',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) NOT NULL DEFAULT '0',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forudisc_use_ix` (`userid`),
  KEY `mdl_forudisc_for_ix` (`forum`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Forums are composed of discussions' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_forum_discussions`
--

INSERT INTO `mdl_forum_discussions` (`id`, `course`, `forum`, `name`, `firstpost`, `userid`, `groupid`, `assessed`, `timemodified`, `usermodified`, `timestart`, `timeend`) VALUES
(1, 2, 1, 'Discussion1', 1, 2, -1, 1, 1390576991, 2, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_posts`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_posts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `discussion` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `subject` varchar(255) NOT NULL DEFAULT '',
  `message` longtext NOT NULL,
  `messageformat` tinyint(2) NOT NULL DEFAULT '0',
  `messagetrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `totalscore` smallint(4) NOT NULL DEFAULT '0',
  `mailnow` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forupost_use_ix` (`userid`),
  KEY `mdl_forupost_cre_ix` (`created`),
  KEY `mdl_forupost_mai_ix` (`mailed`),
  KEY `mdl_forupost_dis_ix` (`discussion`),
  KEY `mdl_forupost_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='All posts are stored in this table' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_forum_posts`
--

INSERT INTO `mdl_forum_posts` (`id`, `discussion`, `parent`, `userid`, `created`, `modified`, `mailed`, `subject`, `message`, `messageformat`, `messagetrust`, `attachment`, `totalscore`, `mailnow`) VALUES
(1, 1, 0, 2, 1390576991, 1390576991, 0, 'Discussion1', '<p>dscssn</p>', 1, 0, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruqueu_use_ix` (`userid`),
  KEY `mdl_foruqueu_dis_ix` (`discussionid`),
  KEY `mdl_foruqueu_pos_ix` (`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='For keeping track of posts that will be mailed in digest for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_read`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  `discussionid` bigint(10) NOT NULL DEFAULT '0',
  `postid` bigint(10) NOT NULL DEFAULT '0',
  `firstread` bigint(10) NOT NULL DEFAULT '0',
  `lastread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_foruread_usefor_ix` (`userid`,`forumid`),
  KEY `mdl_foruread_usedis_ix` (`userid`,`discussionid`),
  KEY `mdl_foruread_usepos_ix` (`userid`,`postid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users read posts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_subscriptions`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_subscriptions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forum` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forusubs_use_ix` (`userid`),
  KEY `mdl_forusubs_for_ix` (`forum`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of who is subscribed to what forum' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_forum_track_prefs`
--

CREATE TABLE IF NOT EXISTS `mdl_forum_track_prefs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `forumid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_forutracpref_usefor_ix` (`userid`,`forumid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tracks each users untracked forums' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `allowduplicatedentries` tinyint(2) NOT NULL DEFAULT '0',
  `displayformat` varchar(50) NOT NULL DEFAULT 'dictionary',
  `mainglossary` tinyint(2) NOT NULL DEFAULT '0',
  `showspecial` tinyint(2) NOT NULL DEFAULT '1',
  `showalphabet` tinyint(2) NOT NULL DEFAULT '1',
  `showall` tinyint(2) NOT NULL DEFAULT '1',
  `allowcomments` tinyint(2) NOT NULL DEFAULT '0',
  `allowprintview` tinyint(2) NOT NULL DEFAULT '1',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `defaultapproval` tinyint(2) NOT NULL DEFAULT '1',
  `approvaldisplayformat` varchar(50) NOT NULL DEFAULT 'default',
  `globalglossary` tinyint(2) NOT NULL DEFAULT '0',
  `entbypage` smallint(3) NOT NULL DEFAULT '10',
  `editalways` tinyint(2) NOT NULL DEFAULT '0',
  `rsstype` tinyint(2) NOT NULL DEFAULT '0',
  `rssarticles` tinyint(2) NOT NULL DEFAULT '0',
  `assessed` bigint(10) NOT NULL DEFAULT '0',
  `assesstimestart` bigint(10) NOT NULL DEFAULT '0',
  `assesstimefinish` bigint(10) NOT NULL DEFAULT '0',
  `scale` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionentries` int(9) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glos_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossaries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_alias`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_alias` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  `alias` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_glosalia_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='entries alias' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_gloscate_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all categories for glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `glossaryid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `concept` varchar(255) NOT NULL DEFAULT '',
  `definition` longtext NOT NULL,
  `definitionformat` tinyint(2) NOT NULL DEFAULT '0',
  `definitiontrust` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherentry` tinyint(2) NOT NULL DEFAULT '0',
  `sourceglossaryid` bigint(10) NOT NULL DEFAULT '0',
  `usedynalink` tinyint(2) NOT NULL DEFAULT '1',
  `casesensitive` tinyint(2) NOT NULL DEFAULT '0',
  `fullmatch` tinyint(2) NOT NULL DEFAULT '1',
  `approved` tinyint(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentr_use_ix` (`userid`),
  KEY `mdl_glosentr_con_ix` (`concept`),
  KEY `mdl_glosentr_glo_ix` (`glossaryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='all glossary entries' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_entries_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_entries_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `entryid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_glosentrcate_cat_ix` (`categoryid`),
  KEY `mdl_glosentrcate_ent_ix` (`entryid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='categories of each glossary entry' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_glossary_formats`
--

CREATE TABLE IF NOT EXISTS `mdl_glossary_formats` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `popupformatname` varchar(50) NOT NULL DEFAULT '',
  `visible` tinyint(2) NOT NULL DEFAULT '1',
  `showgroup` tinyint(2) NOT NULL DEFAULT '1',
  `defaultmode` varchar(50) NOT NULL DEFAULT '',
  `defaulthook` varchar(50) NOT NULL DEFAULT '',
  `sortkey` varchar(50) NOT NULL DEFAULT '',
  `sortorder` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Setting of the display formats' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_glossary_formats`
--

INSERT INTO `mdl_glossary_formats` (`id`, `name`, `popupformatname`, `visible`, `showgroup`, `defaultmode`, `defaulthook`, `sortkey`, `sortorder`) VALUES
(1, 'continuous', 'continuous', 1, 1, '', '', '', ''),
(2, 'dictionary', 'dictionary', 1, 1, '', '', '', ''),
(3, 'encyclopedia', 'encyclopedia', 1, 1, '', '', '', ''),
(4, 'entrylist', 'entrylist', 1, 1, '', '', '', ''),
(5, 'faq', 'faq', 1, 1, '', '', '', ''),
(6, 'fullwithauthor', 'fullwithauthor', 1, 1, '', '', '', ''),
(7, 'fullwithoutauthor', 'fullwithoutauthor', 1, 1, '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcate_cou_ix` (`courseid`),
  KEY `mdl_gradcate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table keeps information about categories, used for grou' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_grade_categories`
--

INSERT INTO `mdl_grade_categories` (`id`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`, `timecreated`, `timemodified`, `hidden`) VALUES
(1, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 1390576059, 1390576059, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_categories_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_categories_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL,
  `parent` bigint(10) DEFAULT NULL,
  `depth` bigint(10) NOT NULL DEFAULT '0',
  `path` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL DEFAULT '',
  `aggregation` bigint(10) NOT NULL DEFAULT '0',
  `keephigh` bigint(10) NOT NULL DEFAULT '0',
  `droplow` bigint(10) NOT NULL DEFAULT '0',
  `aggregateonlygraded` tinyint(1) NOT NULL DEFAULT '0',
  `aggregateoutcomes` tinyint(1) NOT NULL DEFAULT '0',
  `aggregatesubcats` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradcatehist_act_ix` (`action`),
  KEY `mdl_gradcatehist_old_ix` (`oldid`),
  KEY `mdl_gradcatehist_cou_ix` (`courseid`),
  KEY `mdl_gradcatehist_par_ix` (`parent`),
  KEY `mdl_gradcatehist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='History of grade_categories' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_grade_categories_history`
--

INSERT INTO `mdl_grade_categories_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `parent`, `depth`, `path`, `fullname`, `aggregation`, `keephigh`, `droplow`, `aggregateonlygraded`, `aggregateoutcomes`, `aggregatesubcats`, `hidden`) VALUES
(1, 1, 1, 'system', 1390576059, 4, 2, NULL, 0, NULL, '?', 11, 0, 0, 1, 0, 0, 0),
(2, 2, 1, 'system', 1390576059, 4, 2, NULL, 1, '/1/', '?', 11, 0, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradgrad_useite_uix` (`userid`,`itemid`),
  KEY `mdl_gradgrad_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_gradgrad_ite_ix` (`itemid`),
  KEY `mdl_gradgrad_use_ix` (`userid`),
  KEY `mdl_gradgrad_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgrad_use2_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='grade_grades  This table keeps individual grades for each us' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_grades_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_grades_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `itemid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `rawgrademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `rawgrademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `rawscaleid` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `exported` bigint(10) NOT NULL DEFAULT '0',
  `overridden` bigint(10) NOT NULL DEFAULT '0',
  `excluded` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` bigint(10) NOT NULL DEFAULT '0',
  `information` longtext,
  `informationformat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradgradhist_act_ix` (`action`),
  KEY `mdl_gradgradhist_old_ix` (`oldid`),
  KEY `mdl_gradgradhist_ite_ix` (`itemid`),
  KEY `mdl_gradgradhist_use_ix` (`userid`),
  KEY `mdl_gradgradhist_raw_ix` (`rawscaleid`),
  KEY `mdl_gradgradhist_use2_ix` (`usermodified`),
  KEY `mdl_gradgradhist_log_ix` (`loggeduser`),
  KEY `mdl_gradgradhist_tim_ix` (`timemodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_newitem`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_newitem` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemname` varchar(255) NOT NULL DEFAULT '',
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimponewi_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='temporary table for storing new grade_item names from grade ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_import_values`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_import_values` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `itemid` bigint(10) DEFAULT NULL,
  `newgradeitem` bigint(10) DEFAULT NULL,
  `userid` bigint(10) NOT NULL,
  `finalgrade` decimal(10,5) DEFAULT NULL,
  `feedback` longtext,
  `importcode` bigint(10) NOT NULL,
  `importer` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradimpovalu_ite_ix` (`itemid`),
  KEY `mdl_gradimpovalu_new_ix` (`newgradeitem`),
  KEY `mdl_gradimpovalu_imp_ix` (`importer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Temporary table for importing grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditem_locloc_ix` (`locked`,`locktime`),
  KEY `mdl_graditem_itenee_ix` (`itemtype`,`needsupdate`),
  KEY `mdl_graditem_gra_ix` (`gradetype`),
  KEY `mdl_graditem_idncou_ix` (`idnumber`,`courseid`),
  KEY `mdl_graditem_cou_ix` (`courseid`),
  KEY `mdl_graditem_cat_ix` (`categoryid`),
  KEY `mdl_graditem_sca_ix` (`scaleid`),
  KEY `mdl_graditem_out_ix` (`outcomeid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table keeps information about gradeable items (ie colum' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_grade_items`
--

INSERT INTO `mdl_grade_items` (`id`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `sortorder`, `display`, `decimals`, `hidden`, `locked`, `locktime`, `needsupdate`, `timecreated`, `timemodified`) VALUES
(1, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, '100.00000', '0.00000', NULL, NULL, '0.00000', '1.00000', '0.00000', '0.00000', 1, 0, NULL, 0, 0, 0, 0, 1390576059, 1390576059);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_items_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_items_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `categoryid` bigint(10) DEFAULT NULL,
  `itemname` varchar(255) DEFAULT NULL,
  `itemtype` varchar(30) NOT NULL DEFAULT '',
  `itemmodule` varchar(30) DEFAULT NULL,
  `iteminstance` bigint(10) DEFAULT NULL,
  `itemnumber` bigint(10) DEFAULT NULL,
  `iteminfo` longtext,
  `idnumber` varchar(255) DEFAULT NULL,
  `calculation` longtext,
  `gradetype` smallint(4) NOT NULL DEFAULT '1',
  `grademax` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `grademin` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `scaleid` bigint(10) DEFAULT NULL,
  `outcomeid` bigint(10) DEFAULT NULL,
  `gradepass` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `multfactor` decimal(10,5) NOT NULL DEFAULT '1.00000',
  `plusfactor` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `aggregationcoef` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `hidden` bigint(10) NOT NULL DEFAULT '0',
  `locked` bigint(10) NOT NULL DEFAULT '0',
  `locktime` bigint(10) NOT NULL DEFAULT '0',
  `needsupdate` bigint(10) NOT NULL DEFAULT '0',
  `display` bigint(10) NOT NULL DEFAULT '0',
  `decimals` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_graditemhist_act_ix` (`action`),
  KEY `mdl_graditemhist_old_ix` (`oldid`),
  KEY `mdl_graditemhist_cou_ix` (`courseid`),
  KEY `mdl_graditemhist_cat_ix` (`categoryid`),
  KEY `mdl_graditemhist_sca_ix` (`scaleid`),
  KEY `mdl_graditemhist_out_ix` (`outcomeid`),
  KEY `mdl_graditemhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='History of grade_items' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_grade_items_history`
--

INSERT INTO `mdl_grade_items_history` (`id`, `action`, `oldid`, `source`, `timemodified`, `loggeduser`, `courseid`, `categoryid`, `itemname`, `itemtype`, `itemmodule`, `iteminstance`, `itemnumber`, `iteminfo`, `idnumber`, `calculation`, `gradetype`, `grademax`, `grademin`, `scaleid`, `outcomeid`, `gradepass`, `multfactor`, `plusfactor`, `aggregationcoef`, `sortorder`, `hidden`, `locked`, `locktime`, `needsupdate`, `display`, `decimals`) VALUES
(1, 1, 1, 'system', 1390576059, 4, 2, NULL, NULL, 'course', NULL, 1, NULL, NULL, NULL, NULL, 1, '100.00000', '0.00000', NULL, NULL, '0.00000', '1.00000', '0.00000', '0.00000', 1, 0, 0, 0, 1, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_letters`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_letters` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `lowerboundary` decimal(10,5) NOT NULL,
  `letter` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradlett_conlowlet_uix` (`contextid`,`lowerboundary`,`letter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Repository for grade letters, for courses and other moodle e' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutc_cousho_uix` (`courseid`,`shortname`),
  KEY `mdl_gradoutc_cou_ix` (`courseid`),
  KEY `mdl_gradoutc_sca_ix` (`scaleid`),
  KEY `mdl_gradoutc_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table describes the outcomes used in the system. An out' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `outcomeid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradoutccour_couout_uix` (`courseid`,`outcomeid`),
  KEY `mdl_gradoutccour_cou_ix` (`courseid`),
  KEY `mdl_gradoutccour_out_ix` (`outcomeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores what outcomes are used in what courses.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_outcomes_history`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_outcomes_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) DEFAULT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `fullname` longtext NOT NULL,
  `scaleid` bigint(10) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_gradoutchist_act_ix` (`action`),
  KEY `mdl_gradoutchist_old_ix` (`oldid`),
  KEY `mdl_gradoutchist_cou_ix` (`courseid`),
  KEY `mdl_gradoutchist_sca_ix` (`scaleid`),
  KEY `mdl_gradoutchist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grade_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_grade_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradsett_counam_uix` (`courseid`,`name`),
  KEY `mdl_gradsett_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='gradebook settings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcomm_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='frequently used comments used in marking guide' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `shortname` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `descriptionmarkers` longtext,
  `descriptionmarkersformat` tinyint(2) DEFAULT NULL,
  `maxscore` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradguidcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the criteria grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_guide_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_guide_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  `score` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradguidfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradguidfill_ins_ix` (`instanceid`),
  KEY `mdl_gradguidfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the guide is filled by a particular r' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_criteria`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_criteria` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `sortorder` bigint(10) NOT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrcrit_def_ix` (`definitionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the rows of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_fillings`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_fillings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `criterionid` bigint(10) NOT NULL,
  `levelid` bigint(10) DEFAULT NULL,
  `remark` longtext,
  `remarkformat` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradrubrfill_inscri_uix` (`instanceid`,`criterionid`),
  KEY `mdl_gradrubrfill_lev_ix` (`levelid`),
  KEY `mdl_gradrubrfill_ins_ix` (`instanceid`),
  KEY `mdl_gradrubrfill_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the data of how the rubric is filled by a particular ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_gradingform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_gradingform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `criterionid` bigint(10) NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradrubrleve_cri_ix` (`criterionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the columns of the rubric grid.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_areas`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_areas` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `areaname` varchar(100) NOT NULL DEFAULT '',
  `activemethod` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_gradarea_concomare_uix` (`contextid`,`component`,`areaname`),
  KEY `mdl_gradarea_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Identifies gradable areas where advanced grading can happen.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `areaid` bigint(10) NOT NULL,
  `method` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `copiedfromid` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `usercreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `usermodified` bigint(10) NOT NULL,
  `timecopied` bigint(10) DEFAULT '0',
  `options` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_graddefi_aremet_uix` (`areaid`,`method`),
  KEY `mdl_graddefi_are_ix` (`areaid`),
  KEY `mdl_graddefi_use_ix` (`usermodified`),
  KEY `mdl_graddefi_use2_ix` (`usercreated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the basic information about an advanced grading for' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_grading_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_grading_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definitionid` bigint(10) NOT NULL,
  `raterid` bigint(10) NOT NULL,
  `itemid` bigint(10) DEFAULT NULL,
  `rawgrade` decimal(10,5) DEFAULT NULL,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext,
  `feedbackformat` tinyint(2) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_gradinst_def_ix` (`definitionid`),
  KEY `mdl_gradinst_rat_ix` (`raterid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Grading form instance is an assessment record for one gradab' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `configdata` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn2_ix` (`idnumber`),
  KEY `mdl_grou_cou2_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A grouping is a collection of groups. WAS: groups_groupings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groupings_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groupings_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupingid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grougrou_gro_ix` (`groupingid`),
  KEY `mdl_grougrou_gro2_ix` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Link a grouping to a group (note, groups can be in multiple ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups`
--

CREATE TABLE IF NOT EXISTS `mdl_groups` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL,
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(254) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `enrolmentkey` varchar(50) DEFAULT NULL,
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `hidepicture` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_grou_idn_ix` (`idnumber`),
  KEY `mdl_grou_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Each record represents a group.' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_groups`
--

INSERT INTO `mdl_groups` (`id`, `courseid`, `idnumber`, `name`, `description`, `descriptionformat`, `enrolmentkey`, `picture`, `hidepicture`, `timecreated`, `timemodified`) VALUES
(1, 1, '', 'Test group', '<p>Tst grp</p>', 1, 'password', 1, 0, 1390571055, 1390571169),
(2, 3, '', 'test group 4 voucher assoc', '', 1, '', 0, 0, 1390916251, 1390916251),
(3, 3, '', 'test for voucher 2', '', 1, '', 0, 0, 1390916315, 1390916315),
(4, 3, '', 'Group A', NULL, 0, NULL, 0, 0, 1391087081, 1391087081);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_groups_members`
--

CREATE TABLE IF NOT EXISTS `mdl_groups_members` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timeadded` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_groumemb_gro_ix` (`groupid`),
  KEY `mdl_groumemb_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Link a user to a group.' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_groups_members`
--

INSERT INTO `mdl_groups_members` (`id`, `groupid`, `userid`, `timeadded`, `component`, `itemid`) VALUES
(2, 1, 3, 1390571169, '', 0),
(3, 4, 5, 1391087081, '', 0),
(4, 4, 6, 1391087081, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_imscp`
--

CREATE TABLE IF NOT EXISTS `mdl_imscp` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `keepold` bigint(10) NOT NULL DEFAULT '-1',
  `structure` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_imsc_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one imscp resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_label`
--

CREATE TABLE IF NOT EXISTS `mdl_label` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_labe_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines labels' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `practice` smallint(3) NOT NULL DEFAULT '0',
  `modattempts` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `dependency` bigint(10) NOT NULL DEFAULT '0',
  `conditions` longtext NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `custom` smallint(3) NOT NULL DEFAULT '0',
  `ongoing` smallint(3) NOT NULL DEFAULT '0',
  `usemaxgrade` smallint(3) NOT NULL DEFAULT '0',
  `maxanswers` smallint(3) NOT NULL DEFAULT '4',
  `maxattempts` smallint(3) NOT NULL DEFAULT '5',
  `review` smallint(3) NOT NULL DEFAULT '0',
  `nextpagedefault` smallint(3) NOT NULL DEFAULT '0',
  `feedback` smallint(3) NOT NULL DEFAULT '1',
  `minquestions` smallint(3) NOT NULL DEFAULT '0',
  `maxpages` smallint(3) NOT NULL DEFAULT '0',
  `timed` smallint(3) NOT NULL DEFAULT '0',
  `maxtime` bigint(10) NOT NULL DEFAULT '0',
  `retake` smallint(3) NOT NULL DEFAULT '1',
  `activitylink` bigint(10) NOT NULL DEFAULT '0',
  `mediafile` varchar(255) NOT NULL DEFAULT '',
  `mediaheight` bigint(10) NOT NULL DEFAULT '100',
  `mediawidth` bigint(10) NOT NULL DEFAULT '650',
  `mediaclose` smallint(3) NOT NULL DEFAULT '0',
  `slideshow` smallint(3) NOT NULL DEFAULT '0',
  `width` bigint(10) NOT NULL DEFAULT '640',
  `height` bigint(10) NOT NULL DEFAULT '480',
  `bgcolor` varchar(7) NOT NULL DEFAULT '#FFFFFF',
  `displayleft` smallint(3) NOT NULL DEFAULT '0',
  `displayleftif` smallint(3) NOT NULL DEFAULT '0',
  `progressbar` smallint(3) NOT NULL DEFAULT '0',
  `highscores` smallint(3) NOT NULL DEFAULT '0',
  `maxhighscores` bigint(10) NOT NULL DEFAULT '0',
  `available` bigint(10) NOT NULL DEFAULT '0',
  `deadline` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_less_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `jumpto` bigint(11) NOT NULL DEFAULT '0',
  `grade` smallint(4) NOT NULL DEFAULT '0',
  `score` bigint(10) NOT NULL DEFAULT '0',
  `flags` smallint(3) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `response` longtext,
  `responseformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessansw_les_ix` (`lessonid`),
  KEY `mdl_lessansw_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_answers' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `answerid` bigint(10) NOT NULL DEFAULT '0',
  `retry` smallint(3) NOT NULL DEFAULT '0',
  `correct` bigint(10) NOT NULL DEFAULT '0',
  `useranswer` longtext,
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessatte_use_ix` (`userid`),
  KEY `mdl_lessatte_les_ix` (`lessonid`),
  KEY `mdl_lessatte_pag_ix` (`pageid`),
  KEY `mdl_lessatte_ans_ix` (`answerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_attempts' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_branch`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_branch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `retry` bigint(10) NOT NULL DEFAULT '0',
  `flag` smallint(3) NOT NULL DEFAULT '0',
  `timeseen` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessbran_use_ix` (`userid`),
  KEY `mdl_lessbran_les_ix` (`lessonid`),
  KEY `mdl_lessbran_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='branches for each lesson/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `completed` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lessgrad_use_ix` (`userid`),
  KEY `mdl_lessgrad_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_high_scores`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_high_scores` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `gradeid` bigint(10) NOT NULL DEFAULT '0',
  `nickname` varchar(5) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_lesshighscor_use_ix` (`userid`),
  KEY `mdl_lesshighscor_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='high scores for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `prevpageid` bigint(10) NOT NULL DEFAULT '0',
  `nextpageid` bigint(10) NOT NULL DEFAULT '0',
  `qtype` smallint(3) NOT NULL DEFAULT '0',
  `qoption` smallint(3) NOT NULL DEFAULT '0',
  `layout` smallint(3) NOT NULL DEFAULT '1',
  `display` smallint(3) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT '',
  `contents` longtext NOT NULL,
  `contentsformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesspage_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines lesson_pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lesson_timer`
--

CREATE TABLE IF NOT EXISTS `mdl_lesson_timer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lessonid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `starttime` bigint(10) NOT NULL DEFAULT '0',
  `lessontime` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_lesstime_use_ix` (`userid`),
  KEY `mdl_lesstime_les_ix` (`lessonid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='lesson timer for each lesson' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_license`
--

CREATE TABLE IF NOT EXISTS `mdl_license` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) DEFAULT NULL,
  `fullname` longtext,
  `source` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `version` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='store licenses used by moodle' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_license`
--

INSERT INTO `mdl_license` (`id`, `shortname`, `fullname`, `source`, `enabled`, `version`) VALUES
(1, 'unknown', 'Unknown license', '', 1, 2010033100),
(2, 'allrightsreserved', 'All rights reserved', 'http://en.wikipedia.org/wiki/All_rights_reserved', 1, 2010033100),
(3, 'public', 'Public Domain', 'http://creativecommons.org/licenses/publicdomain/', 1, 2010033100),
(4, 'cc', 'Creative Commons', 'http://creativecommons.org/licenses/by/3.0/', 1, 2010033100),
(5, 'cc-nd', 'Creative Commons - NoDerivs', 'http://creativecommons.org/licenses/by-nd/3.0/', 1, 2010033100),
(6, 'cc-nc-nd', 'Creative Commons - No Commercial NoDerivs', 'http://creativecommons.org/licenses/by-nc-nd/3.0/', 1, 2010033100),
(7, 'cc-nc', 'Creative Commons - No Commercial', 'http://creativecommons.org/licenses/by-nc/3.0/', 1, 2013051500),
(8, 'cc-nc-sa', 'Creative Commons - No Commercial ShareAlike', 'http://creativecommons.org/licenses/by-nc-sa/3.0/', 1, 2010033100),
(9, 'cc-sa', 'Creative Commons - ShareAlike', 'http://creativecommons.org/licenses/by-sa/3.0/', 1, 2010033100);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log`
--

CREATE TABLE IF NOT EXISTS `mdl_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_log_coumodact_ix` (`course`,`module`,`action`),
  KEY `mdl_log_tim_ix` (`time`),
  KEY `mdl_log_act_ix` (`action`),
  KEY `mdl_log_usecou_ix` (`userid`,`course`),
  KEY `mdl_log_cmi_ix` (`cmid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Every action is logged as far as possible' AUTO_INCREMENT=178 ;

--
-- Dumping data for table `mdl_log`
--

INSERT INTO `mdl_log` (`id`, `time`, `userid`, `ip`, `course`, `module`, `cmid`, `action`, `url`, `info`) VALUES
(1, 1390393939, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2&course=1', ''),
(2, 1390393973, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(3, 1390401641, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(4, 1390467262, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(5, 1390467292, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(6, 1390468514, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(7, 1390478021, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(8, 1390478026, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(9, 1390478056, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(10, 1390480406, 2, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=2', 'Test course (ID 2)'),
(11, 1390480415, 2, '127.0.0.1', 2, 'user', 0, 'view all', 'index.php?id=2', ''),
(12, 1390480425, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(13, 1390480435, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(14, 1390480435, 2, '127.0.0.1', 2, 'user', 0, 'view all', 'index.php?id=2', ''),
(15, 1390480447, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(16, 1390483925, 1, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '1'),
(17, 1390567455, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(18, 1390567458, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(19, 1390567461, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(20, 1390567884, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(21, 1390567926, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(22, 1390567929, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(23, 1390568033, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(24, 1390568049, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(25, 1390568050, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(26, 1390568061, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(27, 1390570627, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(28, 1390570635, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(29, 1390570694, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(30, 1390571158, 2, '127.0.0.1', 1, 'user', 0, 'add', 'view.php?id=3&course=1', ''),
(31, 1390571187, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(32, 1390571189, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(33, 1390571201, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(34, 1390571201, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(35, 1390571294, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(36, 1390571374, 2, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=2&course=1', '2'),
(37, 1390572701, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'testuser2'),
(38, 1390573033, 4, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '4'),
(39, 1390573033, 4, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(40, 1390573064, 4, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(41, 1390573073, 4, '127.0.0.1', 2, 'user', 0, 'view all', 'index.php?id=2', ''),
(42, 1390573078, 4, '127.0.0.1', 2, 'user', 0, 'view', 'view.php?id=4&course=2', '4'),
(43, 1390573194, 4, '127.0.0.1', 2, 'user', 0, 'view', 'view.php?id=4&course=2', '4'),
(44, 1390573203, 4, '127.0.0.1', 2, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(45, 1390573211, 4, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(46, 1390573281, 4, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(47, 1390573282, 4, '127.0.0.1', 2, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(48, 1390576023, 4, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(49, 1390576071, 4, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(50, 1390576072, 4, '127.0.0.1', 1, 'user', 0, 'logout', 'view.php?id=4&course=1', '4'),
(51, 1390576083, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(52, 1390576085, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(53, 1390576087, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(54, 1390576094, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(55, 1390576914, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(56, 1390576951, 2, '127.0.0.1', 2, 'calendar', 0, 'add', 'event.php?action=edit&id=1', 'course event'),
(57, 1390576959, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(58, 1390576963, 2, '127.0.0.1', 2, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(59, 1390576991, 2, '127.0.0.1', 2, 'forum', 1, 'add discussion', 'discuss.php?d=1', '1'),
(60, 1390576994, 2, '127.0.0.1', 2, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(61, 1390577039, 4, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '4'),
(62, 1390577040, 4, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(63, 1390577046, 4, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(64, 1390577049, 4, '127.0.0.1', 2, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(65, 1390577051, 4, '127.0.0.1', 2, 'forum', 1, 'view discussion', 'discuss.php?d=1', '1'),
(66, 1390577064, 4, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(67, 1390579126, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(68, 1390579129, 2, '127.0.0.1', 2, 'forum', 1, 'view forum', 'view.php?id=1', '1'),
(69, 1390821128, 0, '127.0.0.1', 1, 'login', 0, 'error', 'index.php', 'admin'),
(70, 1390821133, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(71, 1390821978, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(72, 1390822009, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(73, 1390822009, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(74, 1390822180, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(75, 1390822263, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(76, 1390822422, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(77, 1390822532, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(78, 1390823040, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(79, 1390823068, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(80, 1390823129, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(81, 1390825716, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(82, 1390825826, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(83, 1390831877, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(84, 1390831929, 2, '127.0.0.1', 2, 'course', 0, 'add mod', '../mod/repeatcourse/view.php?id=2', 'repeatcourse 1'),
(85, 1390831929, 2, '127.0.0.1', 2, 'repeatcourse', 2, 'add', 'view.php?id=2', '1'),
(86, 1390833948, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(87, 1390908825, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=0&course=1', '2'),
(88, 1390908825, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(89, 1390908925, 2, '127.0.0.1', 2, 'course', 0, 'view', 'view.php?id=2', '2'),
(90, 1390915875, 2, '127.0.0.1', 1, 'course', 0, 'new', 'view.php?id=3', 'First Course (ID 3)'),
(91, 1390915899, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(92, 1390915916, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(93, 1390915922, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(94, 1390915922, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(95, 1390915996, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(96, 1390916032, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(97, 1390916848, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(98, 1390916858, 2, '127.0.0.1', 3, 'forum', 3, 'view forum', 'view.php?id=3', '2'),
(99, 1390916859, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(100, 1390916870, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(101, 1390917125, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(102, 1390917126, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(103, 1390917127, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(104, 1390917221, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(105, 1390922153, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(106, 1390922162, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(107, 1390922162, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(108, 1390922213, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(109, 1390922282, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(110, 1390991329, 0, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(111, 1390991329, 0, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(112, 1390991329, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(113, 1390991329, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(114, 1390993784, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(115, 1390993915, 2, '127.0.0.1', 3, 'course', 0, 'update', 'edit.php?id=3', '3'),
(116, 1390993916, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(117, 1390997575, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(118, 1390997588, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(119, 1390997592, 2, '127.0.0.1', 3, 'forum', 3, 'view forum', 'view.php?id=3', '2'),
(120, 1390997595, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(121, 1390999489, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(122, 1391011573, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(123, 1391011573, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(124, 1391011580, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(125, 1391011580, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(126, 1391011585, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(127, 1391011585, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(128, 1391011597, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(129, 1391011597, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(130, 1391084162, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(131, 1391084162, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(132, 1391085568, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(133, 1391085568, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(134, 1391085577, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(135, 1391085577, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(136, 1391085586, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(137, 1391085586, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(138, 1391085731, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(139, 1391085731, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(140, 1391085737, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(141, 1391085761, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(142, 1391085764, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(143, 1391085764, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(144, 1391086669, 2, '127.0.0.1', 1, 'user', 0, 'add', '/view.php?id=5', 'teacher teacher'),
(145, 1391086727, 2, '127.0.0.1', 1, 'user', 0, 'add', '/view.php?id=6', 'student student'),
(146, 1391086863, 2, '127.0.0.1', 0, 'role', 0, 'assign', 'admin/roles/assign.php?contextid=24&roleid=1', 'Manager'),
(147, 1391086868, 2, '127.0.0.1', 0, 'role', 0, 'assign', 'admin/roles/assign.php?contextid=24&roleid=1', 'Manager'),
(148, 1391086877, 2, '127.0.0.1', 0, 'role', 0, 'assign', 'admin/roles/assign.php?contextid=24&roleid=2', 'Course creator'),
(149, 1391086899, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(150, 1391086919, 2, '127.0.0.1', 3, 'course', 0, 'view', 'view.php?id=3', '3'),
(151, 1391086973, 2, '127.0.0.1', 3, 'role', 0, 'assign', 'admin/roles/assign.php?contextid=25&roleid=5', 'Student'),
(152, 1391086974, 2, '127.0.0.1', 3, 'role', 0, 'assign', 'admin/roles/assign.php?contextid=25&roleid=5', 'Student'),
(153, 1391158976, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(154, 1391158976, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(155, 1391159001, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(156, 1391159001, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(157, 1391168450, 0, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=4', ''),
(158, 1391168450, 0, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=4', ''),
(159, 1391168450, 4, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=4', ''),
(160, 1391168450, 4, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=4&course=1', '4'),
(161, 1391168454, 4, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=4', ''),
(162, 1391168454, 4, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=4&course=1', '4'),
(163, 1391168542, 4, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=4', ''),
(164, 1391168542, 4, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=4&course=1', '4'),
(165, 1391168546, 4, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=4', ''),
(166, 1391168546, 4, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=4&course=1', '4'),
(167, 1391168796, 4, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=4', ''),
(168, 1391168796, 4, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=4&course=1', '4'),
(169, 1391168893, 4, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=4', ''),
(170, 1391168893, 4, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=4&course=1', '4'),
(171, 1391168895, 4, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(172, 1391172293, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(173, 1391172294, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(174, 1391172315, 2, '127.0.0.1', 1, 'user', 0, 'update', 'view.php?id=2', ''),
(175, 1391172315, 2, '127.0.0.1', 1, 'user', 0, 'login', 'view.php?id=2&course=1', '2'),
(176, 1391172320, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1'),
(177, 1391176316, 2, '127.0.0.1', 1, 'course', 0, 'view', 'view.php?id=1', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_display`
--

CREATE TABLE IF NOT EXISTS `mdl_log_display` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `action` varchar(40) NOT NULL DEFAULT '',
  `mtable` varchar(30) NOT NULL DEFAULT '',
  `field` varchar(200) NOT NULL DEFAULT '',
  `component` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_logdisp_modact_uix` (`module`,`action`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='For a particular module/action, specifies a moodle table/fie' AUTO_INCREMENT=192 ;

--
-- Dumping data for table `mdl_log_display`
--

INSERT INTO `mdl_log_display` (`id`, `module`, `action`, `mtable`, `field`, `component`) VALUES
(1, 'course', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(2, 'course', 'view', 'course', 'fullname', 'moodle'),
(3, 'course', 'view section', 'course_sections', 'name', 'moodle'),
(4, 'course', 'update', 'course', 'fullname', 'moodle'),
(5, 'course', 'enrol', 'course', 'fullname', 'moodle'),
(6, 'course', 'unenrol', 'course', 'fullname', 'moodle'),
(7, 'course', 'report log', 'course', 'fullname', 'moodle'),
(8, 'course', 'report live', 'course', 'fullname', 'moodle'),
(9, 'course', 'report outline', 'course', 'fullname', 'moodle'),
(10, 'course', 'report participation', 'course', 'fullname', 'moodle'),
(11, 'course', 'report stats', 'course', 'fullname', 'moodle'),
(12, 'message', 'write', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(13, 'message', 'read', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(14, 'message', 'add contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(15, 'message', 'remove contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(16, 'message', 'block contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(17, 'message', 'unblock contact', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(18, 'group', 'view', 'groups', 'name', 'moodle'),
(19, 'tag', 'update', 'tag', 'name', 'moodle'),
(20, 'tag', 'flag', 'tag', 'name', 'moodle'),
(21, 'user', 'view', 'user', 'CONCAT(firstname, '' '', lastname)', 'moodle'),
(22, 'assign', 'view', 'assign', 'name', 'mod_assign'),
(23, 'assign', 'add', 'assign', 'name', 'mod_assign'),
(24, 'assign', 'update', 'assign', 'name', 'mod_assign'),
(25, 'assign', 'view submission', 'assign', 'name', 'mod_assign'),
(26, 'assign', 'view feedback', 'assign', 'name', 'mod_assign'),
(27, 'assign', 'upload', 'assign', 'name', 'mod_assign'),
(28, 'assign', 'download all submissions', 'assign', 'name', 'mod_assign'),
(29, 'assign', 'view grading form', 'assign', 'name', 'mod_assign'),
(30, 'assign', 'delete mod', 'assign', 'name', 'mod_assign'),
(31, 'assign', 'view submission grading table', 'assign', 'name', 'mod_assign'),
(32, 'assign', 'view submit assignment form', 'assign', 'name', 'mod_assign'),
(33, 'assign', 'submit for grading', 'assign', 'name', 'mod_assign'),
(34, 'assign', 'submit', 'assign', 'name', 'mod_assign'),
(35, 'assign', 'revert submission to draft', 'assign', 'name', 'mod_assign'),
(36, 'assign', 'lock submission', 'assign', 'name', 'mod_assign'),
(37, 'assign', 'unlock submission', 'assign', 'name', 'mod_assign'),
(38, 'assign', 'grade submission', 'assign', 'name', 'mod_assign'),
(39, 'assign', 'view all', 'course', 'fullname', 'mod_assign'),
(40, 'assignment', 'view', 'assignment', 'name', 'mod_assignment'),
(41, 'assignment', 'add', 'assignment', 'name', 'mod_assignment'),
(42, 'assignment', 'update', 'assignment', 'name', 'mod_assignment'),
(43, 'assignment', 'view submission', 'assignment', 'name', 'mod_assignment'),
(44, 'assignment', 'upload', 'assignment', 'name', 'mod_assignment'),
(45, 'book', 'add', 'book', 'name', 'mod_book'),
(46, 'book', 'update', 'book', 'name', 'mod_book'),
(47, 'book', 'view', 'book', 'name', 'mod_book'),
(48, 'certificate', 'view', 'certificate', 'name', 'mod_certificate'),
(49, 'certificate', 'add', 'certificate', 'name', 'mod_certificate'),
(50, 'certificate', 'update', 'certificate', 'name', 'mod_certificate'),
(51, 'certificate', 'received', 'certificate', 'name', 'mod_certificate'),
(52, 'chat', 'view', 'chat', 'name', 'mod_chat'),
(53, 'chat', 'add', 'chat', 'name', 'mod_chat'),
(54, 'chat', 'update', 'chat', 'name', 'mod_chat'),
(55, 'chat', 'report', 'chat', 'name', 'mod_chat'),
(56, 'chat', 'talk', 'chat', 'name', 'mod_chat'),
(57, 'choice', 'view', 'choice', 'name', 'mod_choice'),
(58, 'choice', 'update', 'choice', 'name', 'mod_choice'),
(59, 'choice', 'add', 'choice', 'name', 'mod_choice'),
(60, 'choice', 'report', 'choice', 'name', 'mod_choice'),
(61, 'choice', 'choose', 'choice', 'name', 'mod_choice'),
(62, 'choice', 'choose again', 'choice', 'name', 'mod_choice'),
(63, 'data', 'view', 'data', 'name', 'mod_data'),
(64, 'data', 'add', 'data', 'name', 'mod_data'),
(65, 'data', 'update', 'data', 'name', 'mod_data'),
(66, 'data', 'record delete', 'data', 'name', 'mod_data'),
(67, 'data', 'fields add', 'data_fields', 'name', 'mod_data'),
(68, 'data', 'fields update', 'data_fields', 'name', 'mod_data'),
(69, 'data', 'templates saved', 'data', 'name', 'mod_data'),
(70, 'data', 'templates def', 'data', 'name', 'mod_data'),
(71, 'feedback', 'startcomplete', 'feedback', 'name', 'mod_feedback'),
(72, 'feedback', 'submit', 'feedback', 'name', 'mod_feedback'),
(73, 'feedback', 'delete', 'feedback', 'name', 'mod_feedback'),
(74, 'feedback', 'view', 'feedback', 'name', 'mod_feedback'),
(75, 'feedback', 'view all', 'course', 'shortname', 'mod_feedback'),
(76, 'folder', 'view', 'folder', 'name', 'mod_folder'),
(77, 'folder', 'view all', 'folder', 'name', 'mod_folder'),
(78, 'folder', 'update', 'folder', 'name', 'mod_folder'),
(79, 'folder', 'add', 'folder', 'name', 'mod_folder'),
(80, 'forum', 'add', 'forum', 'name', 'mod_forum'),
(81, 'forum', 'update', 'forum', 'name', 'mod_forum'),
(82, 'forum', 'add discussion', 'forum_discussions', 'name', 'mod_forum'),
(83, 'forum', 'add post', 'forum_posts', 'subject', 'mod_forum'),
(84, 'forum', 'update post', 'forum_posts', 'subject', 'mod_forum'),
(85, 'forum', 'user report', 'user', 'CONCAT(firstname, '' '', lastname)', 'mod_forum'),
(86, 'forum', 'move discussion', 'forum_discussions', 'name', 'mod_forum'),
(87, 'forum', 'view subscribers', 'forum', 'name', 'mod_forum'),
(88, 'forum', 'view discussion', 'forum_discussions', 'name', 'mod_forum'),
(89, 'forum', 'view forum', 'forum', 'name', 'mod_forum'),
(90, 'forum', 'subscribe', 'forum', 'name', 'mod_forum'),
(91, 'forum', 'unsubscribe', 'forum', 'name', 'mod_forum'),
(92, 'glossary', 'add', 'glossary', 'name', 'mod_glossary'),
(93, 'glossary', 'update', 'glossary', 'name', 'mod_glossary'),
(94, 'glossary', 'view', 'glossary', 'name', 'mod_glossary'),
(95, 'glossary', 'view all', 'glossary', 'name', 'mod_glossary'),
(96, 'glossary', 'add entry', 'glossary', 'name', 'mod_glossary'),
(97, 'glossary', 'update entry', 'glossary', 'name', 'mod_glossary'),
(98, 'glossary', 'add category', 'glossary', 'name', 'mod_glossary'),
(99, 'glossary', 'update category', 'glossary', 'name', 'mod_glossary'),
(100, 'glossary', 'delete category', 'glossary', 'name', 'mod_glossary'),
(101, 'glossary', 'approve entry', 'glossary', 'name', 'mod_glossary'),
(102, 'glossary', 'view entry', 'glossary_entries', 'concept', 'mod_glossary'),
(103, 'imscp', 'view', 'imscp', 'name', 'mod_imscp'),
(104, 'imscp', 'view all', 'imscp', 'name', 'mod_imscp'),
(105, 'imscp', 'update', 'imscp', 'name', 'mod_imscp'),
(106, 'imscp', 'add', 'imscp', 'name', 'mod_imscp'),
(107, 'label', 'add', 'label', 'name', 'mod_label'),
(108, 'label', 'update', 'label', 'name', 'mod_label'),
(109, 'lesson', 'start', 'lesson', 'name', 'mod_lesson'),
(110, 'lesson', 'end', 'lesson', 'name', 'mod_lesson'),
(111, 'lesson', 'view', 'lesson_pages', 'title', 'mod_lesson'),
(112, 'lti', 'view', 'lti', 'name', 'mod_lti'),
(113, 'lti', 'launch', 'lti', 'name', 'mod_lti'),
(114, 'lti', 'view all', 'lti', 'name', 'mod_lti'),
(115, 'page', 'view', 'page', 'name', 'mod_page'),
(116, 'page', 'view all', 'page', 'name', 'mod_page'),
(117, 'page', 'update', 'page', 'name', 'mod_page'),
(118, 'page', 'add', 'page', 'name', 'mod_page'),
(119, 'quiz', 'add', 'quiz', 'name', 'mod_quiz'),
(120, 'quiz', 'update', 'quiz', 'name', 'mod_quiz'),
(121, 'quiz', 'view', 'quiz', 'name', 'mod_quiz'),
(122, 'quiz', 'report', 'quiz', 'name', 'mod_quiz'),
(123, 'quiz', 'attempt', 'quiz', 'name', 'mod_quiz'),
(124, 'quiz', 'submit', 'quiz', 'name', 'mod_quiz'),
(125, 'quiz', 'review', 'quiz', 'name', 'mod_quiz'),
(126, 'quiz', 'editquestions', 'quiz', 'name', 'mod_quiz'),
(127, 'quiz', 'preview', 'quiz', 'name', 'mod_quiz'),
(128, 'quiz', 'start attempt', 'quiz', 'name', 'mod_quiz'),
(129, 'quiz', 'close attempt', 'quiz', 'name', 'mod_quiz'),
(130, 'quiz', 'continue attempt', 'quiz', 'name', 'mod_quiz'),
(131, 'quiz', 'edit override', 'quiz', 'name', 'mod_quiz'),
(132, 'quiz', 'delete override', 'quiz', 'name', 'mod_quiz'),
(133, 'resource', 'view', 'resource', 'name', 'mod_resource'),
(134, 'resource', 'view all', 'resource', 'name', 'mod_resource'),
(135, 'resource', 'update', 'resource', 'name', 'mod_resource'),
(136, 'resource', 'add', 'resource', 'name', 'mod_resource'),
(137, 'scorm', 'view', 'scorm', 'name', 'mod_scorm'),
(138, 'scorm', 'review', 'scorm', 'name', 'mod_scorm'),
(139, 'scorm', 'update', 'scorm', 'name', 'mod_scorm'),
(140, 'scorm', 'add', 'scorm', 'name', 'mod_scorm'),
(141, 'survey', 'add', 'survey', 'name', 'mod_survey'),
(142, 'survey', 'update', 'survey', 'name', 'mod_survey'),
(143, 'survey', 'download', 'survey', 'name', 'mod_survey'),
(144, 'survey', 'view form', 'survey', 'name', 'mod_survey'),
(145, 'survey', 'view graph', 'survey', 'name', 'mod_survey'),
(146, 'survey', 'view report', 'survey', 'name', 'mod_survey'),
(147, 'survey', 'submit', 'survey', 'name', 'mod_survey'),
(148, 'url', 'view', 'url', 'name', 'mod_url'),
(149, 'url', 'view all', 'url', 'name', 'mod_url'),
(150, 'url', 'update', 'url', 'name', 'mod_url'),
(151, 'url', 'add', 'url', 'name', 'mod_url'),
(152, 'workshop', 'add', 'workshop', 'name', 'mod_workshop'),
(153, 'workshop', 'update', 'workshop', 'name', 'mod_workshop'),
(154, 'workshop', 'view', 'workshop', 'name', 'mod_workshop'),
(155, 'workshop', 'view all', 'workshop', 'name', 'mod_workshop'),
(156, 'workshop', 'add submission', 'workshop_submissions', 'title', 'mod_workshop'),
(157, 'workshop', 'update submission', 'workshop_submissions', 'title', 'mod_workshop'),
(158, 'workshop', 'view submission', 'workshop_submissions', 'title', 'mod_workshop'),
(159, 'workshop', 'add assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(160, 'workshop', 'update assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(161, 'workshop', 'add example', 'workshop_submissions', 'title', 'mod_workshop'),
(162, 'workshop', 'update example', 'workshop_submissions', 'title', 'mod_workshop'),
(163, 'workshop', 'view example', 'workshop_submissions', 'title', 'mod_workshop'),
(164, 'workshop', 'add reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(165, 'workshop', 'update reference assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(166, 'workshop', 'add example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(167, 'workshop', 'update example assessment', 'workshop_submissions', 'title', 'mod_workshop'),
(168, 'workshop', 'update aggregate grades', 'workshop', 'name', 'mod_workshop'),
(169, 'workshop', 'update clear aggregated grades', 'workshop', 'name', 'mod_workshop'),
(170, 'workshop', 'update clear assessments', 'workshop', 'name', 'mod_workshop'),
(171, 'book', 'exportimscp', 'book', 'name', 'booktool_exportimscp'),
(172, 'book', 'print', 'book', 'name', 'booktool_print'),
(173, 'course', 'hide', 'course', 'fullname', 'moodle'),
(174, 'course', 'show', 'course', 'fullname', 'moodle'),
(175, 'course', 'move', 'course', 'fullname', 'moodle'),
(176, 'category', 'add', 'course_categories', 'name', 'moodle'),
(177, 'category', 'hide', 'course_categories', 'name', 'moodle'),
(178, 'category', 'move', 'course_categories', 'name', 'moodle'),
(179, 'category', 'show', 'course_categories', 'name', 'moodle'),
(180, 'category', 'update', 'course_categories', 'name', 'moodle'),
(181, 'assign', 'reveal identities', 'assign', 'name', 'mod_assign'),
(182, 'assign', 'submission statement accepted', 'assign', 'name', 'mod_assign'),
(183, 'assign', 'view confirm submit assignment form', 'assign', 'name', 'mod_assign'),
(184, 'book', 'add chapter', 'book_chapters', 'title', 'mod_book'),
(185, 'book', 'update chapter', 'book_chapters', 'title', 'mod_book'),
(186, 'book', 'view chapter', 'book_chapters', 'title', 'mod_book'),
(187, 'quiz', 'view summary', 'quiz', 'name', 'mod_quiz'),
(188, 'book', 'print chapter', 'book_chapters', 'title', 'booktool_print'),
(189, 'assign', 'set marking workflow state', 'assign', 'name', 'mod_assign'),
(190, 'assign', 'view batch set marking workflow state', 'assign', 'name', 'mod_assign'),
(191, 'glossary', 'disapprove entry', 'glossary', 'name', 'mod_glossary');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_log_queries`
--

CREATE TABLE IF NOT EXISTS `mdl_log_queries` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `qtype` mediumint(5) NOT NULL,
  `sqltext` longtext NOT NULL,
  `sqlparams` longtext,
  `error` mediumint(5) NOT NULL DEFAULT '0',
  `info` longtext,
  `backtrace` longtext,
  `exectime` decimal(10,5) NOT NULL,
  `timelogged` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Logged database queries.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti`
--

CREATE TABLE IF NOT EXISTS `mdl_lti` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `typeid` bigint(10) DEFAULT NULL,
  `toolurl` longtext NOT NULL,
  `securetoolurl` longtext,
  `instructorchoicesendname` tinyint(1) DEFAULT NULL,
  `instructorchoicesendemailaddr` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowroster` tinyint(1) DEFAULT NULL,
  `instructorchoiceallowsetting` tinyint(1) DEFAULT NULL,
  `instructorcustomparameters` varchar(255) DEFAULT NULL,
  `instructorchoiceacceptgrades` tinyint(1) DEFAULT NULL,
  `grade` decimal(10,5) NOT NULL DEFAULT '100.00000',
  `launchcontainer` tinyint(2) NOT NULL DEFAULT '1',
  `resourcekey` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `debuglaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showtitlelaunch` tinyint(1) NOT NULL DEFAULT '0',
  `showdescriptionlaunch` tinyint(1) NOT NULL DEFAULT '0',
  `servicesalt` varchar(40) DEFAULT NULL,
  `icon` longtext,
  `secureicon` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_lti_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table contains Basic LTI activities instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_submission`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_submission` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `ltiid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `datesubmitted` bigint(10) NOT NULL,
  `dateupdated` bigint(10) NOT NULL,
  `gradepercent` decimal(10,5) NOT NULL,
  `originalgrade` decimal(10,5) NOT NULL,
  `launchid` bigint(10) NOT NULL,
  `state` tinyint(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltisubm_lti_ix` (`ltiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Keeps track of individual submissions for LTI activities.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT 'basiclti Activity',
  `baseurl` longtext NOT NULL,
  `tooldomain` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(2) NOT NULL DEFAULT '2',
  `course` bigint(10) NOT NULL,
  `coursevisible` tinyint(1) NOT NULL DEFAULT '0',
  `createdby` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ltitype_cou_ix` (`course`),
  KEY `mdl_ltitype_too_ix` (`tooldomain`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI pre-configured activities' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_lti_types_config`
--

CREATE TABLE IF NOT EXISTS `mdl_lti_types_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `typeid` bigint(10) NOT NULL,
  `name` varchar(100) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_ltitypeconf_typ_ix` (`typeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Basic LTI types configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message`
--

CREATE TABLE IF NOT EXISTS `mdl_message` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mess_use_ix` (`useridfrom`),
  KEY `mdl_mess_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all unread messages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_contacts`
--

CREATE TABLE IF NOT EXISTS `mdl_message_contacts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contactid` bigint(10) NOT NULL DEFAULT '0',
  `blocked` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messcont_usecon_uix` (`userid`,`contactid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains lists of relationships between users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_processors`
--

CREATE TABLE IF NOT EXISTS `mdl_message_processors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(166) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='List of message output plugins' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_message_processors`
--

INSERT INTO `mdl_message_processors` (`id`, `name`, `enabled`) VALUES
(1, 'email', 1),
(2, 'jabber', 1),
(3, 'popup', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_providers`
--

CREATE TABLE IF NOT EXISTS `mdl_message_providers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `component` varchar(200) NOT NULL DEFAULT '',
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_messprov_comnam_uix` (`component`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores the message providers (modules and core sy' AUTO_INCREMENT=26 ;

--
-- Dumping data for table `mdl_message_providers`
--

INSERT INTO `mdl_message_providers` (`id`, `name`, `component`, `capability`) VALUES
(1, 'notices', 'moodle', 'moodle/site:config'),
(2, 'errors', 'moodle', 'moodle/site:config'),
(3, 'availableupdate', 'moodle', 'moodle/site:config'),
(4, 'instantmessage', 'moodle', NULL),
(5, 'backup', 'moodle', 'moodle/site:config'),
(6, 'courserequested', 'moodle', 'moodle/site:approvecourse'),
(7, 'courserequestapproved', 'moodle', 'moodle/course:request'),
(8, 'courserequestrejected', 'moodle', 'moodle/course:request'),
(9, 'assign_notification', 'mod_assign', NULL),
(10, 'assignment_updates', 'mod_assignment', NULL),
(11, 'submission', 'mod_feedback', NULL),
(12, 'message', 'mod_feedback', NULL),
(13, 'posts', 'mod_forum', NULL),
(14, 'graded_essay', 'mod_lesson', NULL),
(15, 'submission', 'mod_quiz', 'mod/quiz:emailnotifysubmission'),
(16, 'confirmation', 'mod_quiz', 'mod/quiz:emailconfirmsubmission'),
(17, 'attempt_overdue', 'mod_quiz', 'mod/quiz:emailwarnoverdue'),
(19, 'flatfile_enrolment', 'enrol_flatfile', NULL),
(20, 'imsenterprise_enrolment', 'enrol_imsenterprise', NULL),
(21, 'paypal_enrolment', 'enrol_paypal', NULL),
(22, 'expiry_notification', 'enrol_manual', NULL),
(23, 'expiry_notification', 'enrol_self', NULL),
(24, 'badgerecipientnotice', 'moodle', 'moodle/badges:earnbadge'),
(25, 'badgecreatornotice', 'moodle', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_read`
--

CREATE TABLE IF NOT EXISTS `mdl_message_read` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `useridfrom` bigint(10) NOT NULL DEFAULT '0',
  `useridto` bigint(10) NOT NULL DEFAULT '0',
  `subject` longtext,
  `fullmessage` longtext,
  `fullmessageformat` smallint(4) DEFAULT '0',
  `fullmessagehtml` longtext,
  `smallmessage` longtext,
  `notification` tinyint(1) DEFAULT '0',
  `contexturl` longtext,
  `contexturlname` longtext,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timeread` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_messread_use_ix` (`useridfrom`),
  KEY `mdl_messread_use2_ix` (`useridto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all messages that have been read' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_message_working`
--

CREATE TABLE IF NOT EXISTS `mdl_message_working` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `unreadmessageid` bigint(10) NOT NULL,
  `processorid` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_messwork_unr_ix` (`unreadmessageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Lists all the messages and processors that need to be proces' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_courses`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_courses` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `remoteid` bigint(10) NOT NULL,
  `categoryid` bigint(10) NOT NULL,
  `categoryname` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `fullname` varchar(254) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `idnumber` varchar(100) NOT NULL DEFAULT '',
  `summary` longtext NOT NULL,
  `summaryformat` smallint(3) DEFAULT '0',
  `startdate` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetenrocour_hosrem_uix` (`hostid`,`remoteid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information fetched via XML-RPC about courses on ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnetservice_enrol_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_mnetservice_enrol_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `remotecourseid` bigint(10) NOT NULL,
  `rolename` varchar(255) NOT NULL DEFAULT '',
  `enroltime` bigint(10) NOT NULL DEFAULT '0',
  `enroltype` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetenroenro_use_ix` (`userid`),
  KEY `mdl_mnetenroenro_hos_ix` (`hostid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Caches the information about enrolments of our local users i' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_application`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_application` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `display_name` varchar(50) NOT NULL DEFAULT '',
  `xmlrpc_server_url` varchar(255) NOT NULL DEFAULT '',
  `sso_land_url` varchar(255) NOT NULL DEFAULT '',
  `sso_jump_url` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Information about applications on remote hosts' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_mnet_application`
--

INSERT INTO `mdl_mnet_application` (`id`, `name`, `display_name`, `xmlrpc_server_url`, `sso_land_url`, `sso_jump_url`) VALUES
(1, 'moodle', 'Moodle', '/mnet/xmlrpc/server.php', '/auth/mnet/land.php', '/auth/mnet/jump.php'),
(2, 'mahara', 'Mahara', '/api/xmlrpc/server.php', '/auth/xmlrpc/land.php', '/auth/xmlrpc/jump.php');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `wwwroot` varchar(255) NOT NULL DEFAULT '',
  `ip_address` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(80) NOT NULL DEFAULT '',
  `public_key` longtext NOT NULL,
  `public_key_expires` bigint(10) NOT NULL DEFAULT '0',
  `transport` tinyint(2) NOT NULL DEFAULT '0',
  `portno` mediumint(5) NOT NULL DEFAULT '0',
  `last_connect_time` bigint(10) NOT NULL DEFAULT '0',
  `last_log_id` bigint(10) NOT NULL DEFAULT '0',
  `force_theme` tinyint(1) NOT NULL DEFAULT '0',
  `theme` varchar(100) DEFAULT NULL,
  `applicationid` bigint(10) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_mnethost_app_ix` (`applicationid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Information about the local and remote hosts for RPC' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_mnet_host`
--

INSERT INTO `mdl_mnet_host` (`id`, `deleted`, `wwwroot`, `ip_address`, `name`, `public_key`, `public_key_expires`, `transport`, `portno`, `last_connect_time`, `last_log_id`, `force_theme`, `theme`, `applicationid`) VALUES
(1, 0, 'http://solin.loc', '127.0.0.1', '', '', 0, 0, 0, 0, 0, 0, NULL, 1),
(2, 0, '', '', 'All Hosts', '', 0, 0, 0, 0, 0, 0, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_host2service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_host2service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `publish` tinyint(1) NOT NULL DEFAULT '0',
  `subscribe` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnethost_hosser_uix` (`hostid`,`serviceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Information about the services for a given host' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_log`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hostid` bigint(10) NOT NULL DEFAULT '0',
  `remoteid` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `course` bigint(10) NOT NULL DEFAULT '0',
  `coursename` varchar(40) NOT NULL DEFAULT '',
  `module` varchar(20) NOT NULL DEFAULT '',
  `cmid` bigint(10) NOT NULL DEFAULT '0',
  `action` varchar(40) NOT NULL DEFAULT '',
  `url` varchar(100) NOT NULL DEFAULT '',
  `info` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_mnetlog_hosusecou_ix` (`hostid`,`userid`,`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table describes functions that might be called remotely' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_mnet_remote_rpc`
--

INSERT INTO `mdl_mnet_remote_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1),
(15, 'send_content_intent', 'portfolio/mahara/lib.php/send_content_intent', 'portfolio', 'mahara', 1),
(16, 'send_content_ready', 'portfolio/mahara/lib.php/send_content_ready', 'portfolio', 'mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_remote_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_remote_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetremoserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service' AUTO_INCREMENT=17 ;

--
-- Dumping data for table `mdl_mnet_remote_service2rpc`
--

INSERT INTO `mdl_mnet_remote_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15),
(16, 4, 16);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `functionname` varchar(40) NOT NULL DEFAULT '',
  `xmlrpcpath` varchar(80) NOT NULL DEFAULT '',
  `plugintype` varchar(20) NOT NULL DEFAULT '',
  `pluginname` varchar(20) NOT NULL DEFAULT '',
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `help` longtext NOT NULL,
  `profile` longtext NOT NULL,
  `filename` varchar(100) NOT NULL DEFAULT '',
  `classname` varchar(150) DEFAULT NULL,
  `static` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_mnetrpc_enaxml_ix` (`enabled`,`xmlrpcpath`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Functions or methods that we may publish or subscribe to' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_mnet_rpc`
--

INSERT INTO `mdl_mnet_rpc` (`id`, `functionname`, `xmlrpcpath`, `plugintype`, `pluginname`, `enabled`, `help`, `profile`, `filename`, `classname`, `static`) VALUES
(1, 'user_authorise', 'auth/mnet/auth.php/user_authorise', 'auth', 'mnet', 1, 'Return user data for the provided token, compare with user_agent string.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:37:"The unique ID provided by remotehost.";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:44:"$userdata Array of user info for remote host";}}', 'auth.php', 'auth_plugin_mnet', 0),
(2, 'keepalive_server', 'auth/mnet/auth.php/keepalive_server', 'auth', 'mnet', 1, 'Receives an array of usernames from a remote machine and prods their\nsessions to keep them alive', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(3, 'kill_children', 'auth/mnet/auth.php/kill_children', 'auth', 'mnet', 1, 'The IdP uses this function to kill child sessions on other hosts', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:39:"A plaintext report of what has happened";}}', 'auth.php', 'auth_plugin_mnet', 0),
(4, 'refresh_log', 'auth/mnet/auth.php/refresh_log', 'auth', 'mnet', 1, 'Receives an array of log entries from an SP and adds them to the mnet_log\ntable', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"array";s:4:"type";s:5:"array";s:11:"description";s:21:"An array of usernames";}}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:28:""All ok" or an error message";}}', 'auth.php', 'auth_plugin_mnet', 0),
(5, 'fetch_user_image', 'auth/mnet/auth.php/fetch_user_image', 'auth', 'mnet', 1, 'Returns the user''s profile image info\nIf the user exists and has a profile picture, the returned array will contain keys:\n f1          - the content of the default 100x100px image\n f1_mimetype - the mimetype of the f1 file\n f2          - the content of the 35x35px variant of the image\n f2_mimetype - the mimetype of the f2 file\nThe mimetype information was added in Moodle 2.0. In Moodle 1.x, images are always jpegs.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:3:"int";s:11:"description";s:18:"The id of the user";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:84:"false if user not found, empty array if no picture exists, array with data otherwise";}}', 'auth.php', 'auth_plugin_mnet', 0),
(6, 'fetch_theme_info', 'auth/mnet/auth.php/fetch_theme_info', 'auth', 'mnet', 1, 'Returns the theme information and logo url as strings.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:6:"string";s:11:"description";s:14:"The theme info";}}', 'auth.php', 'auth_plugin_mnet', 0),
(7, 'update_enrolments', 'auth/mnet/auth.php/update_enrolments', 'auth', 'mnet', 1, 'Invoke this function _on_ the IDP to update it with enrolment info local to\nthe SP right after calling user_authorise()\nNormally called by the SP after calling user_authorise()', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:12:"The username";}i:1;a:3:{s:4:"name";s:7:"courses";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(8, 'keepalive_client', 'auth/mnet/auth.php/keepalive_client', 'auth', 'mnet', 1, 'Poll the IdP server to let it know that a user it has authenticated is still\nonline', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'auth.php', 'auth_plugin_mnet', 0),
(9, 'kill_child', 'auth/mnet/auth.php/kill_child', 'auth', 'mnet', 1, 'When the IdP requests that child sessions are terminated,\nthis function will be called on each of the child hosts. The machine that\ncalls the function (over xmlrpc) provides us with the mnethostid we need.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:28:"Username for session to kill";}i:1;a:3:{s:4:"name";s:9:"useragent";s:4:"type";s:6:"string";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:15:"True on success";}}', 'auth.php', 'auth_plugin_mnet', 0),
(10, 'available_courses', 'enrol/mnet/enrol.php/available_courses', 'enrol', 'mnet', 1, 'Returns list of courses that we offer to the caller for remote enrolment of their users\nSince Moodle 2.0, courses are made available for MNet peers by creating an instance\nof enrol_mnet plugin for the course. Hidden courses are not returned. If there are two\ninstances - one specific for the host and one for ''All hosts'', the setting of the specific\none is used. The id of the peer is kept in customint1, no other custom fields are used.', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(11, 'user_enrolments', 'enrol/mnet/enrol.php/user_enrolments', 'enrol', 'mnet', 1, 'This method has never been implemented in Moodle MNet API', 'a:2:{s:10:"parameters";a:0:{}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:11:"empty array";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(12, 'enrol_user', 'enrol/mnet/enrol.php/enrol_user', 'enrol', 'mnet', 1, 'Enrol remote user to our course\nIf we do not have local record for the remote user in our database,\nit gets created here.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"userdata";s:4:"type";s:5:"array";s:11:"description";s:14:"user details {";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:19:"our local course id";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:69:"true if the enrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(13, 'unenrol_user', 'enrol/mnet/enrol.php/unenrol_user', 'enrol', 'mnet', 1, 'Unenrol remote user from our course\nOnly users enrolled via enrol_mnet plugin can be unenrolled remotely. If the\nremote user is enrolled into the local course via some other enrol plugin\n(enrol_manual for example), the remote host can''t touch such enrolment. Please\ndo not report this behaviour as bug, it is a feature ;-)', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"username";s:4:"type";s:6:"string";s:11:"description";s:18:"of the remote user";}i:1;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:4:"bool";s:11:"description";s:71:"true if the unenrolment has been successful, throws exception otherwise";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(14, 'course_enrolments', 'enrol/mnet/enrol.php/course_enrolments', 'enrol', 'mnet', 1, 'Returns a list of users from the client server who are enrolled in our course\nSuitable instance of enrol_mnet must be created in the course. This method will not\nreturn any information about the enrolments in courses that are not available for\nremote enrolment, even if their users are enrolled into them via other plugin\n(note the difference from {@link self::user_enrolments()}).\nThis method will return enrolment information for users from hosts regardless\nthe enrolment plugin. It does not matter if the user was enrolled remotely by\ntheir admin or locally. Once the course is available for remote enrolments, we\nwill tell them everything about their users.\nIn Moodle 1.x the returned array used to be indexed by username. The side effect\nof MDL-19219 fix is that we do not need to use such index and therefore we can\nreturn all enrolment records. MNet clients 1.x will only use the last record for\nthe student, if she is enrolled via multiple plugins.', 'a:2:{s:10:"parameters";a:2:{i:0;a:3:{s:4:"name";s:8:"courseid";s:4:"type";s:3:"int";s:11:"description";s:16:"ID of our course";}i:1;a:3:{s:4:"name";s:5:"roles";s:4:"type";s:5:"array";s:11:"description";s:0:"";}}s:6:"return";a:2:{s:4:"type";s:5:"array";s:11:"description";s:0:"";}}', 'enrol.php', 'enrol_mnet_mnetservice_enrol', 0),
(15, 'fetch_file', 'portfolio/mahara/lib.php/fetch_file', 'portfolio', 'mahara', 1, 'xmlrpc (mnet) function to get the file.\nreads in the file and returns it base_64 encoded\nso that it can be enrypted by mnet.', 'a:2:{s:10:"parameters";a:1:{i:0;a:3:{s:4:"name";s:5:"token";s:4:"type";s:6:"string";s:11:"description";s:56:"the token recieved previously during send_content_intent";}}s:6:"return";a:2:{s:4:"type";s:4:"void";s:11:"description";s:0:"";}}', 'lib.php', 'portfolio_plugin_mahara', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(40) NOT NULL DEFAULT '',
  `apiversion` varchar(10) NOT NULL DEFAULT '',
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='A service is a group of functions' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_mnet_service`
--

INSERT INTO `mdl_mnet_service` (`id`, `name`, `description`, `apiversion`, `offer`) VALUES
(1, 'sso_idp', '', '1', 1),
(2, 'sso_sp', '', '1', 1),
(3, 'mnet_enrol', '', '1', 1),
(4, 'pf', '', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_service2rpc`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_service2rpc` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `serviceid` bigint(10) NOT NULL DEFAULT '0',
  `rpcid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetserv_rpcser_uix` (`rpcid`,`serviceid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Group functions or methods under a service' AUTO_INCREMENT=16 ;

--
-- Dumping data for table `mdl_mnet_service2rpc`
--

INSERT INTO `mdl_mnet_service2rpc` (`id`, `serviceid`, `rpcid`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 2, 8),
(9, 2, 9),
(10, 3, 10),
(11, 3, 11),
(12, 3, 12),
(13, 3, 13),
(14, 3, 14),
(15, 4, 15);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_session`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `token` varchar(40) NOT NULL DEFAULT '',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `useragent` varchar(40) NOT NULL DEFAULT '',
  `confirm_timeout` bigint(10) NOT NULL DEFAULT '0',
  `session_id` varchar(40) NOT NULL DEFAULT '',
  `expires` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetsess_tok_uix` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Store session data from users migrating to other sites' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_mnet_sso_access_control`
--

CREATE TABLE IF NOT EXISTS `mdl_mnet_sso_access_control` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `mnet_host_id` bigint(10) NOT NULL DEFAULT '0',
  `accessctrl` varchar(20) NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_mnetssoaccecont_mneuse_uix` (`mnet_host_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Users by host permitted (or not) to login from a remote prov' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_modules`
--

CREATE TABLE IF NOT EXISTS `mdl_modules` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  `cron` bigint(10) NOT NULL DEFAULT '0',
  `lastcron` bigint(10) NOT NULL DEFAULT '0',
  `search` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_modu_nam_ix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='modules available in the site' AUTO_INCREMENT=25 ;

--
-- Dumping data for table `mdl_modules`
--

INSERT INTO `mdl_modules` (`id`, `name`, `cron`, `lastcron`, `search`, `visible`) VALUES
(1, 'assign', 60, 0, '', 1),
(2, 'assignment', 60, 0, '', 0),
(3, 'book', 0, 0, '', 1),
(4, 'certificate', 0, 0, '', 1),
(5, 'chat', 300, 1390821669, '', 1),
(6, 'choice', 0, 0, '', 1),
(7, 'data', 0, 0, '', 1),
(8, 'feedback', 0, 0, '', 0),
(9, 'folder', 0, 0, '', 1),
(10, 'forum', 60, 1390821669, '', 1),
(11, 'glossary', 0, 0, '', 1),
(12, 'imscp', 0, 0, '', 1),
(13, 'label', 0, 0, '', 1),
(14, 'lesson', 0, 0, '', 1),
(15, 'lti', 0, 0, '', 1),
(16, 'page', 0, 0, '', 1),
(17, 'quiz', 60, 1390821669, '', 1),
(18, 'resource', 0, 0, '', 1),
(19, 'scorm', 300, 1390821669, '', 1),
(20, 'survey', 0, 0, '', 1),
(21, 'url', 0, 0, '', 1),
(22, 'wiki', 0, 0, '', 1),
(23, 'workshop', 60, 1390821669, '', 1),
(24, 'repeatcourse', 0, 0, '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_my_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_my_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) DEFAULT '0',
  `name` varchar(200) NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL DEFAULT '1',
  `sortorder` mediumint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_mypage_usepri_ix` (`userid`,`private`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Extra user pages for the My Moodle system' AUTO_INCREMENT=3 ;

--
-- Dumping data for table `mdl_my_pages`
--

INSERT INTO `mdl_my_pages` (`id`, `userid`, `name`, `private`, `sortorder`) VALUES
(1, NULL, '__default', 0, 0),
(2, NULL, '__default', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_page`
--

CREATE TABLE IF NOT EXISTS `mdl_page` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `content` longtext,
  `contentformat` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_page_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one page and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `plugin` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='base table (not including config data) for instances of port' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstconf_nam_ix` (`name`),
  KEY `mdl_portinstconf_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='config for portfolio plugin instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_instance_user`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_instance_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instance` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  KEY `mdl_portinstuser_ins_ix` (`instance`),
  KEY `mdl_portinstuser_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='user data for portfolio instances.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_log`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `time` bigint(10) NOT NULL,
  `portfolio` bigint(10) NOT NULL,
  `caller_class` varchar(150) NOT NULL DEFAULT '',
  `caller_file` varchar(255) NOT NULL DEFAULT '',
  `caller_component` varchar(255) DEFAULT NULL,
  `caller_sha1` varchar(255) NOT NULL DEFAULT '',
  `tempdataid` bigint(10) NOT NULL DEFAULT '0',
  `returnurl` varchar(255) NOT NULL DEFAULT '',
  `continueurl` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portlog_use_ix` (`userid`),
  KEY `mdl_portlog_por_ix` (`portfolio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='log of portfolio transfers (used to later check for duplicat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_mahara_queue`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_mahara_queue` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `transferid` bigint(10) NOT NULL,
  `token` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_portmahaqueu_tok_ix` (`token`),
  KEY `mdl_portmahaqueu_tra_ix` (`transferid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='maps mahara tokens to transfer ids' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_portfolio_tempdata`
--

CREATE TABLE IF NOT EXISTS `mdl_portfolio_tempdata` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `data` longtext,
  `expirytime` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_porttemp_use_ix` (`userid`),
  KEY `mdl_porttemp_ins_ix` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='stores temporary data for portfolio exports. the id of this ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_post`
--

CREATE TABLE IF NOT EXISTS `mdl_post` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `module` varchar(20) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `moduleid` bigint(10) NOT NULL DEFAULT '0',
  `coursemoduleid` bigint(10) NOT NULL DEFAULT '0',
  `subject` varchar(128) NOT NULL DEFAULT '',
  `summary` longtext,
  `content` longtext,
  `uniquehash` varchar(255) NOT NULL DEFAULT '',
  `rating` bigint(10) NOT NULL DEFAULT '0',
  `format` bigint(10) NOT NULL DEFAULT '0',
  `summaryformat` tinyint(2) NOT NULL DEFAULT '0',
  `attachment` varchar(100) DEFAULT NULL,
  `publishstate` varchar(20) NOT NULL DEFAULT 'draft',
  `lastmodified` bigint(10) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `usermodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_post_iduse_uix` (`id`,`userid`),
  KEY `mdl_post_las_ix` (`lastmodified`),
  KEY `mdl_post_mod_ix` (`module`),
  KEY `mdl_post_sub_ix` (`subject`),
  KEY `mdl_post_use_ix` (`usermodified`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic post table to hold data blog entries etc in differen' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_profiling`
--

CREATE TABLE IF NOT EXISTS `mdl_profiling` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `runid` varchar(32) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `data` longtext NOT NULL,
  `totalexecutiontime` bigint(10) NOT NULL,
  `totalcputime` bigint(10) NOT NULL,
  `totalcalls` bigint(10) NOT NULL,
  `totalmemory` bigint(10) NOT NULL,
  `runreference` tinyint(2) NOT NULL DEFAULT '0',
  `runcomment` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_prof_run_uix` (`runid`),
  KEY `mdl_prof_urlrun_ix` (`url`,`runreference`),
  KEY `mdl_prof_timrun_ix` (`timecreated`,`runreference`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the results of all the profiling runs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_essay_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_essay_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `responseformat` varchar(16) NOT NULL DEFAULT 'editor',
  `responsefieldlines` smallint(4) NOT NULL DEFAULT '15',
  `attachments` smallint(4) NOT NULL DEFAULT '0',
  `graderinfo` longtext,
  `graderinfoformat` smallint(4) NOT NULL DEFAULT '0',
  `responsetemplate` longtext,
  `responsetemplateformat` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypessaopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Extra options for essay questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmatcopti_que_uix` (`questionid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Defines fixed matching questions' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_qtype_match_options`
--

INSERT INTO `mdl_qtype_match_options` (`id`, `questionid`, `shuffleanswers`, `correctfeedback`, `correctfeedbackformat`, `partiallycorrectfeedback`, `partiallycorrectfeedbackformat`, `incorrectfeedback`, `incorrectfeedbackformat`, `shownumcorrect`) VALUES
(1, 1, 1, '<p>Your answer is correct.</p>', 1, '<p>Your answer is partially correct.</p>', 1, '<p>Your answer is incorrect.</p>', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_match_subquestions`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_match_subquestions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `answertext` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_qtypmatcsubq_que_ix` (`questionid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Defines the subquestions that make up a matching question' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_qtype_match_subquestions`
--

INSERT INTO `mdl_qtype_match_subquestions` (`id`, `questionid`, `questiontext`, `questiontextformat`, `answertext`) VALUES
(1, 1, '<p>Belka</p>', 1, 'Belka'),
(2, 1, '<p>Strelka</p>', 1, 'Strelka'),
(3, 1, '<p>Pyhtelka</p>', 1, 'Pyhtelka');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_multichoice_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_multichoice_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `layout` smallint(4) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '1',
  `correctfeedback` longtext NOT NULL,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext NOT NULL,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext NOT NULL,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_qtypmultopti_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multiple choice questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_qtype_shortanswer_options`
--

CREATE TABLE IF NOT EXISTS `mdl_qtype_shortanswer_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `usecase` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesshor_que_uix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for short answer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question`
--

CREATE TABLE IF NOT EXISTS `mdl_question` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `questiontext` longtext NOT NULL,
  `questiontextformat` tinyint(2) NOT NULL DEFAULT '0',
  `generalfeedback` longtext NOT NULL,
  `generalfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `defaultmark` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.3333333',
  `qtype` varchar(20) NOT NULL DEFAULT '',
  `length` bigint(10) NOT NULL DEFAULT '1',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) NOT NULL DEFAULT '',
  `hidden` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `createdby` bigint(10) DEFAULT NULL,
  `modifiedby` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_ques_cat_ix` (`category`),
  KEY `mdl_ques_par_ix` (`parent`),
  KEY `mdl_ques_cre_ix` (`createdby`),
  KEY `mdl_ques_mod_ix` (`modifiedby`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='The questions themselves' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_question`
--

INSERT INTO `mdl_question` (`id`, `category`, `parent`, `name`, `questiontext`, `questiontextformat`, `generalfeedback`, `generalfeedbackformat`, `defaultmark`, `penalty`, `qtype`, `length`, `stamp`, `version`, `hidden`, `timecreated`, `timemodified`, `createdby`, `modifiedby`) VALUES
(1, 2, 0, 'Match pairs', '<p>match equal pairs</p>', 1, '', 1, '1.0000000', '0.3333333', 'match', 1, 'solin.loc+140129121225+JJ7Vhc', 'solin.loc+140129121226+ZULTXr', 0, 1390997545, 1390997546, 2, 2);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_question_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` longtext NOT NULL,
  `answerformat` tinyint(2) NOT NULL DEFAULT '0',
  `fraction` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `feedback` longtext NOT NULL,
  `feedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Answers, with a fractional grade (0-1) and feedback' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `behaviour` varchar(32) NOT NULL DEFAULT '',
  `questionid` bigint(10) NOT NULL,
  `variant` bigint(10) NOT NULL DEFAULT '1',
  `maxmark` decimal(12,7) NOT NULL,
  `minfraction` decimal(12,7) NOT NULL,
  `maxfraction` decimal(12,7) NOT NULL DEFAULT '1.0000000',
  `flagged` tinyint(1) NOT NULL DEFAULT '0',
  `questionsummary` longtext,
  `rightanswer` longtext,
  `responsesummary` longtext,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesatte_queslo_uix` (`questionusageid`,`slot`),
  KEY `mdl_quesatte_que_ix` (`questionid`),
  KEY `mdl_quesatte_que2_ix` (`questionusageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each row here corresponds to an attempt at one question, as ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_steps`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_steps` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionattemptid` bigint(10) NOT NULL,
  `sequencenumber` bigint(10) NOT NULL,
  `state` varchar(13) NOT NULL DEFAULT '',
  `fraction` decimal(12,7) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL,
  `userid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestep_queseq_uix` (`questionattemptid`,`sequencenumber`),
  KEY `mdl_quesattestep_que_ix` (`questionattemptid`),
  KEY `mdl_quesattestep_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores one step in in a question attempt. As well as the dat' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_attempt_step_data`
--

CREATE TABLE IF NOT EXISTS `mdl_question_attempt_step_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptstepid` bigint(10) NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesattestepdata_attna_uix` (`attemptstepid`,`name`),
  KEY `mdl_quesattestepdata_att_ix` (`attemptstepid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each question_attempt_step has an associative array of the d' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(20) NOT NULL DEFAULT '0.0',
  `tolerancetype` bigint(10) NOT NULL DEFAULT '1',
  `correctanswerlength` bigint(10) NOT NULL DEFAULT '2',
  `correctanswerformat` bigint(10) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalc_ans_ix` (`answer`),
  KEY `mdl_quescalc_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_calculated_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_calculated_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `synchronize` tinyint(2) NOT NULL DEFAULT '0',
  `single` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `correctfeedback` longtext,
  `correctfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `partiallycorrectfeedback` longtext,
  `partiallycorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `incorrectfeedback` longtext,
  `incorrectfeedbackformat` tinyint(2) NOT NULL DEFAULT '0',
  `answernumbering` varchar(10) NOT NULL DEFAULT 'abc',
  `shownumcorrect` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quescalcopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type calculated' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_categories`
--

CREATE TABLE IF NOT EXISTS `mdl_question_categories` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `info` longtext NOT NULL,
  `infoformat` tinyint(2) NOT NULL DEFAULT '0',
  `stamp` varchar(255) NOT NULL DEFAULT '',
  `parent` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '999',
  PRIMARY KEY (`id`),
  KEY `mdl_quescate_con_ix` (`contextid`),
  KEY `mdl_quescate_par_ix` (`parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Categories are for grouping questions' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_question_categories`
--

INSERT INTO `mdl_question_categories` (`id`, `name`, `contextid`, `info`, `infoformat`, `stamp`, `parent`, `sortorder`) VALUES
(1, 'Default for 1st course', 25, 'The default category for questions shared in context ''1st course''.', 0, 'solin.loc+140129120423+FO1sHe', 0, 999),
(2, 'Default for Repeat Courses', 24, 'The default category for questions shared in context ''Repeat Courses''.', 0, 'solin.loc+140129120423+IxnbM1', 0, 999),
(3, 'Default for System', 1, 'The default category for questions shared in context ''System''.', 0, 'solin.loc+140129120423+waSSrR', 0, 999);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_datasets`
--

CREATE TABLE IF NOT EXISTS `mdl_question_datasets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `datasetdefinition` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdata_quedat_ix` (`question`,`datasetdefinition`),
  KEY `mdl_quesdata_que_ix` (`question`),
  KEY `mdl_quesdata_dat_ix` (`datasetdefinition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Many-many relation between questions and dataset definitions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_definitions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_definitions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `category` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` bigint(10) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `itemcount` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdatadefi_cat_ix` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Organises and stores properties for dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_dataset_items`
--

CREATE TABLE IF NOT EXISTS `mdl_question_dataset_items` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `definition` bigint(10) NOT NULL DEFAULT '0',
  `itemnumber` bigint(10) NOT NULL DEFAULT '0',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesdataitem_def_ix` (`definition`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Individual dataset items' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_hints`
--

CREATE TABLE IF NOT EXISTS `mdl_question_hints` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionid` bigint(10) NOT NULL,
  `hint` longtext NOT NULL,
  `hintformat` smallint(4) NOT NULL DEFAULT '0',
  `shownumcorrect` tinyint(1) DEFAULT NULL,
  `clearwrong` tinyint(1) DEFAULT NULL,
  `options` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_queshint_que_ix` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the the part of the question definition that gives di' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_multianswer`
--

CREATE TABLE IF NOT EXISTS `mdl_question_multianswer` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `sequence` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quesmult_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for multianswer questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `answer` bigint(10) NOT NULL DEFAULT '0',
  `tolerance` varchar(255) NOT NULL DEFAULT '0.0',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnume_ans_ix` (`answer`),
  KEY `mdl_quesnume_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for numerical questions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_options`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_options` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `showunits` smallint(4) NOT NULL DEFAULT '0',
  `unitsleft` smallint(4) NOT NULL DEFAULT '0',
  `unitgradingtype` smallint(4) NOT NULL DEFAULT '0',
  `unitpenalty` decimal(12,7) NOT NULL DEFAULT '0.1000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesnumeopti_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for questions of type numerical This table is also u' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_numerical_units`
--

CREATE TABLE IF NOT EXISTS `mdl_question_numerical_units` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `multiplier` decimal(40,20) NOT NULL DEFAULT '1.00000000000000000000',
  `unit` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quesnumeunit_queuni_uix` (`question`,`unit`),
  KEY `mdl_quesnumeunit_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Optional unit options for numerical questions. This table is' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_randomsamatch`
--

CREATE TABLE IF NOT EXISTS `mdl_question_randomsamatch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `choose` bigint(10) NOT NULL DEFAULT '4',
  PRIMARY KEY (`id`),
  KEY `mdl_quesrand_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about a random short-answer matching question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_response_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_question_response_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `subqid` varchar(100) NOT NULL DEFAULT '',
  `aid` varchar(100) DEFAULT NULL,
  `response` longtext,
  `rcount` bigint(10) DEFAULT NULL,
  `credit` decimal(15,5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_question_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attemptid` bigint(10) NOT NULL DEFAULT '0',
  `questionid` bigint(10) NOT NULL DEFAULT '0',
  `newest` bigint(10) NOT NULL DEFAULT '0',
  `newgraded` bigint(10) NOT NULL DEFAULT '0',
  `sumpenalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `manualcomment` longtext NOT NULL,
  `manualcommentformat` tinyint(2) NOT NULL DEFAULT '0',
  `flagged` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quessess_attque_uix` (`attemptid`,`questionid`),
  KEY `mdl_quessess_att_ix` (`attemptid`),
  KEY `mdl_quessess_que_ix` (`questionid`),
  KEY `mdl_quessess_new_ix` (`newest`),
  KEY `mdl_quessess_new2_ix` (`newgraded`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Gives ids of the newest open and newest graded states' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_states`
--

CREATE TABLE IF NOT EXISTS `mdl_question_states` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `attempt` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `seq_number` mediumint(6) NOT NULL DEFAULT '0',
  `answer` longtext NOT NULL,
  `timestamp` bigint(10) NOT NULL DEFAULT '0',
  `event` smallint(4) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `raw_grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  `penalty` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quesstat_att_ix` (`attempt`),
  KEY `mdl_quesstat_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user responses to an attempt, and percentage grades' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_question_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL,
  `questionid` bigint(10) NOT NULL,
  `slot` bigint(10) DEFAULT NULL,
  `subquestion` smallint(4) NOT NULL,
  `s` bigint(10) NOT NULL DEFAULT '0',
  `effectiveweight` decimal(15,5) DEFAULT NULL,
  `negcovar` tinyint(2) NOT NULL DEFAULT '0',
  `discriminationindex` decimal(15,5) DEFAULT NULL,
  `discriminativeefficiency` decimal(15,5) DEFAULT NULL,
  `sd` decimal(15,10) DEFAULT NULL,
  `facility` decimal(15,10) DEFAULT NULL,
  `subquestions` longtext,
  `maxmark` decimal(12,7) DEFAULT NULL,
  `positions` longtext,
  `randomguessscore` decimal(12,7) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_truefalse`
--

CREATE TABLE IF NOT EXISTS `mdl_question_truefalse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `question` bigint(10) NOT NULL DEFAULT '0',
  `trueanswer` bigint(10) NOT NULL DEFAULT '0',
  `falseanswer` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_questrue_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Options for True-False questions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_question_usages`
--

CREATE TABLE IF NOT EXISTS `mdl_question_usages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(255) NOT NULL DEFAULT '',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_quesusag_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table''s main purpose it to assign a unique id to each a' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timelimit` bigint(10) NOT NULL DEFAULT '0',
  `overduehandling` varchar(16) NOT NULL DEFAULT 'autoabandon',
  `graceperiod` bigint(10) NOT NULL DEFAULT '0',
  `preferredbehaviour` varchar(32) NOT NULL DEFAULT '',
  `attempts` mediumint(6) NOT NULL DEFAULT '0',
  `attemptonlast` smallint(4) NOT NULL DEFAULT '0',
  `grademethod` smallint(4) NOT NULL DEFAULT '1',
  `decimalpoints` smallint(4) NOT NULL DEFAULT '2',
  `questiondecimalpoints` smallint(4) NOT NULL DEFAULT '-1',
  `reviewattempt` mediumint(6) NOT NULL DEFAULT '0',
  `reviewcorrectness` mediumint(6) NOT NULL DEFAULT '0',
  `reviewmarks` mediumint(6) NOT NULL DEFAULT '0',
  `reviewspecificfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewgeneralfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `reviewrightanswer` mediumint(6) NOT NULL DEFAULT '0',
  `reviewoverallfeedback` mediumint(6) NOT NULL DEFAULT '0',
  `questionsperpage` bigint(10) NOT NULL DEFAULT '0',
  `navmethod` varchar(16) NOT NULL DEFAULT 'free',
  `shufflequestions` smallint(4) NOT NULL DEFAULT '0',
  `shuffleanswers` smallint(4) NOT NULL DEFAULT '0',
  `questions` longtext NOT NULL,
  `sumgrades` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `password` varchar(255) NOT NULL DEFAULT '',
  `subnet` varchar(255) NOT NULL DEFAULT '',
  `browsersecurity` varchar(32) NOT NULL DEFAULT '',
  `delay1` bigint(10) NOT NULL DEFAULT '0',
  `delay2` bigint(10) NOT NULL DEFAULT '0',
  `showuserpicture` smallint(4) NOT NULL DEFAULT '0',
  `showblocks` smallint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quiz_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The settings for each quiz.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_attempts`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_attempts` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` mediumint(6) NOT NULL DEFAULT '0',
  `uniqueid` bigint(10) NOT NULL DEFAULT '0',
  `layout` longtext NOT NULL,
  `currentpage` bigint(10) NOT NULL DEFAULT '0',
  `preview` smallint(3) NOT NULL DEFAULT '0',
  `state` varchar(16) NOT NULL DEFAULT 'inprogress',
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timefinish` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timecheckstate` bigint(10) DEFAULT '0',
  `sumgrades` decimal(10,5) DEFAULT NULL,
  `needsupgradetonewqe` smallint(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizatte_quiuseatt_uix` (`quiz`,`userid`,`attempt`),
  UNIQUE KEY `mdl_quizatte_uni_uix` (`uniqueid`),
  KEY `mdl_quizatte_qui_ix` (`quiz`),
  KEY `mdl_quizatte_use_ix` (`userid`),
  KEY `mdl_quizatte_statim_ix` (`state`,`timecheckstate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores users attempts at quizzes.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_feedback`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_feedback` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quizid` bigint(10) NOT NULL DEFAULT '0',
  `feedbacktext` longtext NOT NULL,
  `feedbacktextformat` tinyint(2) NOT NULL DEFAULT '0',
  `mingrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `maxgrade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizfeed_qui_ix` (`quizid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Feedback given to students based on which grade band their o' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_quizgrad_use_ix` (`userid`),
  KEY `mdl_quizgrad_qui_ix` (`quiz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the overall grade for each user on the quiz, based on' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overrides`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overrides` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) DEFAULT NULL,
  `userid` bigint(10) DEFAULT NULL,
  `timeopen` bigint(10) DEFAULT NULL,
  `timeclose` bigint(10) DEFAULT NULL,
  `timelimit` bigint(10) DEFAULT NULL,
  `attempts` mediumint(6) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_quizover_qui_ix` (`quiz`),
  KEY `mdl_quizover_gro_ix` (`groupid`),
  KEY `mdl_quizover_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The overrides to quiz settings on a per-user and per-group b' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_overview_regrades`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_overview_regrades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `questionusageid` bigint(10) NOT NULL,
  `slot` bigint(10) NOT NULL,
  `newfraction` decimal(12,7) DEFAULT NULL,
  `oldfraction` decimal(12,7) DEFAULT NULL,
  `regraded` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table records which question attempts need regrading an' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_question_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_question_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `quiz` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `grade` decimal(12,7) NOT NULL DEFAULT '0.0000000',
  PRIMARY KEY (`id`),
  KEY `mdl_quizquesinst_qui_ix` (`quiz`),
  KEY `mdl_quizquesinst_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the maximum possible grade (weight) for each question' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_reports`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_reports` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `displayorder` bigint(10) NOT NULL,
  `capability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_quizrepo_nam_uix` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Lists all the installed quiz reports and their display order' AUTO_INCREMENT=5 ;

--
-- Dumping data for table `mdl_quiz_reports`
--

INSERT INTO `mdl_quiz_reports` (`id`, `name`, `displayorder`, `capability`) VALUES
(1, 'overview', 10000, NULL),
(2, 'responses', 9000, NULL),
(3, 'grading', 6000, 'mod/quiz:grade'),
(4, 'statistics', 8000, 'quiz/statistics:view');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_quiz_statistics`
--

CREATE TABLE IF NOT EXISTS `mdl_quiz_statistics` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `hashcode` varchar(40) NOT NULL DEFAULT '',
  `whichattempts` smallint(4) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstattemptscount` bigint(10) NOT NULL,
  `highestattemptscount` bigint(10) NOT NULL,
  `lastattemptscount` bigint(10) NOT NULL,
  `allattemptscount` bigint(10) NOT NULL,
  `firstattemptsavg` decimal(15,5) DEFAULT NULL,
  `highestattemptsavg` decimal(15,5) DEFAULT NULL,
  `lastattemptsavg` decimal(15,5) DEFAULT NULL,
  `allattemptsavg` decimal(15,5) DEFAULT NULL,
  `median` decimal(15,5) DEFAULT NULL,
  `standarddeviation` decimal(15,5) DEFAULT NULL,
  `skewness` decimal(15,10) DEFAULT NULL,
  `kurtosis` decimal(15,5) DEFAULT NULL,
  `cic` decimal(15,10) DEFAULT NULL,
  `errorratio` decimal(15,10) DEFAULT NULL,
  `standarderror` decimal(15,10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_rating`
--

CREATE TABLE IF NOT EXISTS `mdl_rating` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL,
  `component` varchar(100) NOT NULL DEFAULT '',
  `ratingarea` varchar(50) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `scaleid` bigint(10) NOT NULL,
  `rating` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_rati_comratconite_ix` (`component`,`ratingarea`,`contextid`,`itemid`),
  KEY `mdl_rati_con_ix` (`contextid`),
  KEY `mdl_rati_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='moodle ratings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_registration_hubs`
--

CREATE TABLE IF NOT EXISTS `mdl_registration_hubs` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `hubname` varchar(255) NOT NULL DEFAULT '',
  `huburl` varchar(255) NOT NULL DEFAULT '',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `secret` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='hub where the site is registered on with their associated to' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repeatcourse`
--

CREATE TABLE IF NOT EXISTS `mdl_repeatcourse` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_repe_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='each record is one repeatcourse resource' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_repeatcourse`
--

INSERT INTO `mdl_repeatcourse` (`id`, `course`, `name`, `intro`, `introformat`, `timemodified`, `ordering`) VALUES
(1, 2, 'Test repeat course', '<p>description for repeatcourse</p>', 1, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository`
--

CREATE TABLE IF NOT EXISTS `mdl_repository` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `visible` tinyint(1) DEFAULT '1',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_repository`
--

INSERT INTO `mdl_repository` (`id`, `type`, `visible`, `sortorder`) VALUES
(1, 'local', 1, 1),
(2, 'recent', 1, 2),
(3, 'upload', 1, 3),
(4, 'url', 1, 4),
(5, 'user', 1, 5),
(6, 'wikimedia', 1, 6),
(7, 'youtube', 1, 7),
(8, 'areafiles', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instances`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instances` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `typeid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table contains one entry for every configured external ' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_repository_instances`
--

INSERT INTO `mdl_repository_instances` (`id`, `name`, `typeid`, `userid`, `contextid`, `username`, `password`, `timecreated`, `timemodified`, `readonly`) VALUES
(1, '', 1, 0, 1, NULL, NULL, 1390393275, 1390393275, 0),
(2, '', 2, 0, 1, NULL, NULL, 1390393276, 1390393276, 0),
(3, '', 3, 0, 1, NULL, NULL, 1390393276, 1390393276, 0),
(4, '', 4, 0, 1, NULL, NULL, 1390393276, 1390393276, 0),
(5, '', 5, 0, 1, NULL, NULL, 1390393276, 1390393276, 0),
(6, '', 6, 0, 1, NULL, NULL, 1390393276, 1390393276, 0),
(7, '', 7, 0, 1, NULL, NULL, 1390393276, 1390393276, 0),
(8, '', 8, 0, 1, NULL, NULL, 1390990766, 1390990766, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_repository_instance_config`
--

CREATE TABLE IF NOT EXISTS `mdl_repository_instance_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `instanceid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The config for intances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource`
--

CREATE TABLE IF NOT EXISTS `mdl_resource` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `tobemigrated` smallint(4) NOT NULL DEFAULT '0',
  `legacyfiles` smallint(4) NOT NULL DEFAULT '0',
  `legacyfileslast` bigint(10) DEFAULT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `filterfiles` smallint(4) NOT NULL DEFAULT '0',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_reso_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is one resource and its config data' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_resource_old`
--

CREATE TABLE IF NOT EXISTS `mdl_resource_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `type` varchar(30) NOT NULL DEFAULT '',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `alltext` longtext NOT NULL,
  `popup` longtext NOT NULL,
  `options` varchar(255) NOT NULL DEFAULT '',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `cmid` bigint(10) DEFAULT NULL,
  `newmodule` varchar(50) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  `migrated` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_resoold_old_uix` (`oldid`),
  KEY `mdl_resoold_cmi_ix` (`cmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='backup of all old resource instances from 1.9' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role`
--

CREATE TABLE IF NOT EXISTS `mdl_role` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `shortname` varchar(100) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `archetype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_role_sor_uix` (`sortorder`),
  UNIQUE KEY `mdl_role_sho_uix` (`shortname`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='moodle roles' AUTO_INCREMENT=9 ;

--
-- Dumping data for table `mdl_role`
--

INSERT INTO `mdl_role` (`id`, `name`, `shortname`, `description`, `sortorder`, `archetype`) VALUES
(1, 'Manager', 'manager', 'Managers can access course and modify them, they usually do not participate in courses.', 1, 'manager'),
(2, 'Course creator', 'coursecreator', 'Course creators can create new courses.', 2, 'coursecreator'),
(3, 'Teacher', 'editingteacher', 'Teachers can do anything within a course, including changing the activities and grading students.', 3, 'editingteacher'),
(4, 'Non-editing teacher', 'teacher', 'Non-editing teachers can teach in courses and grade students, but may not alter activities.', 4, 'teacher'),
(5, 'Student', 'student', 'Students generally have fewer privileges within a course.', 5, 'student'),
(6, 'Guest', 'guest', 'Guests have minimal privileges and usually can not enter text anywhere.', 6, 'guest'),
(7, 'Authenticated user', 'user', 'All logged in users.', 7, 'user'),
(8, 'Authenticated user on frontpage', 'frontpage', 'All logged in users in the frontpage course.', 8, 'frontpage');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_assign`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_assign` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowassign` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloassi_rolall_uix` (`roleid`,`allowassign`),
  KEY `mdl_rolealloassi_rol_ix` (`roleid`),
  KEY `mdl_rolealloassi_all_ix` (`allowassign`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines what role can assign what role' AUTO_INCREMENT=8 ;

--
-- Dumping data for table `mdl_role_allow_assign`
--

INSERT INTO `mdl_role_allow_assign` (`id`, `roleid`, `allowassign`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 3, 4),
(7, 3, 5);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_override`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_override` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `allowoverride` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloover_rolall_uix` (`roleid`,`allowoverride`),
  KEY `mdl_rolealloover_rol_ix` (`roleid`),
  KEY `mdl_rolealloover_all_ix` (`allowoverride`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='this defines what role can override what role' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_role_allow_override`
--

INSERT INTO `mdl_role_allow_override` (`id`, `roleid`, `allowoverride`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 3, 4),
(10, 3, 5),
(11, 3, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_allow_switch`
--

CREATE TABLE IF NOT EXISTS `mdl_role_allow_switch` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `allowswitch` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolealloswit_rolall_uix` (`roleid`,`allowswitch`),
  KEY `mdl_rolealloswit_rol_ix` (`roleid`),
  KEY `mdl_rolealloswit_all_ix` (`allowswitch`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='This table stores which which other roles a user is allowed ' AUTO_INCREMENT=10 ;

--
-- Dumping data for table `mdl_role_allow_switch`
--

INSERT INTO `mdl_role_allow_switch` (`id`, `roleid`, `allowswitch`) VALUES
(1, 1, 3),
(2, 1, 4),
(3, 1, 5),
(4, 1, 6),
(5, 3, 4),
(6, 3, 5),
(7, 3, 6),
(8, 4, 5),
(9, 4, 6);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_assignments`
--

CREATE TABLE IF NOT EXISTS `mdl_role_assignments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `component` varchar(100) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_roleassi_sor_ix` (`sortorder`),
  KEY `mdl_roleassi_rolcon_ix` (`roleid`,`contextid`),
  KEY `mdl_roleassi_useconrol_ix` (`userid`,`contextid`,`roleid`),
  KEY `mdl_roleassi_comiteuse_ix` (`component`,`itemid`,`userid`),
  KEY `mdl_roleassi_rol_ix` (`roleid`),
  KEY `mdl_roleassi_con_ix` (`contextid`),
  KEY `mdl_roleassi_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='assigning roles in different context' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `mdl_role_assignments`
--

INSERT INTO `mdl_role_assignments` (`id`, `roleid`, `contextid`, `userid`, `timemodified`, `modifierid`, `component`, `itemid`, `sortorder`) VALUES
(1, 5, 15, 4, 1390572661, 0, '', 0, 0),
(2, 1, 24, 5, 1391086863, 2, '', 0, 0),
(3, 1, 24, 3, 1391086868, 2, '', 0, 0),
(4, 2, 24, 4, 1391086877, 2, '', 0, 0),
(5, 5, 25, 6, 1391086973, 2, '', 0, 0),
(6, 5, 25, 5, 1391086974, 2, '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_capabilities`
--

CREATE TABLE IF NOT EXISTS `mdl_role_capabilities` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `capability` varchar(255) NOT NULL DEFAULT '',
  `permission` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecapa_rolconcap_uix` (`roleid`,`contextid`,`capability`),
  KEY `mdl_rolecapa_rol_ix` (`roleid`),
  KEY `mdl_rolecapa_con_ix` (`contextid`),
  KEY `mdl_rolecapa_mod_ix` (`modifierid`),
  KEY `mdl_rolecapa_cap_ix` (`capability`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='permission has to be signed, overriding a capability for a p' AUTO_INCREMENT=1153 ;

--
-- Dumping data for table `mdl_role_capabilities`
--

INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(1, 1, 1, 'moodle/site:readallmessages', 1, 1390393232, 0),
(2, 1, 3, 'moodle/site:readallmessages', 1, 1390393232, 0),
(3, 1, 1, 'moodle/site:sendmessage', 1, 1390393232, 0),
(4, 1, 7, 'moodle/site:sendmessage', 1, 1390393232, 0),
(5, 1, 1, 'moodle/site:approvecourse', 1, 1390393232, 0),
(6, 1, 3, 'moodle/backup:backupcourse', 1, 1390393232, 0),
(7, 1, 1, 'moodle/backup:backupcourse', 1, 1390393232, 0),
(8, 1, 3, 'moodle/backup:backupsection', 1, 1390393232, 0),
(9, 1, 1, 'moodle/backup:backupsection', 1, 1390393232, 0),
(10, 1, 3, 'moodle/backup:backupactivity', 1, 1390393232, 0),
(11, 1, 1, 'moodle/backup:backupactivity', 1, 1390393232, 0),
(12, 1, 3, 'moodle/backup:backuptargethub', 1, 1390393232, 0),
(13, 1, 1, 'moodle/backup:backuptargethub', 1, 1390393232, 0),
(14, 1, 3, 'moodle/backup:backuptargetimport', 1, 1390393232, 0),
(15, 1, 1, 'moodle/backup:backuptargetimport', 1, 1390393232, 0),
(16, 1, 3, 'moodle/backup:downloadfile', 1, 1390393232, 0),
(17, 1, 1, 'moodle/backup:downloadfile', 1, 1390393232, 0),
(18, 1, 3, 'moodle/backup:configure', 1, 1390393232, 0),
(19, 1, 1, 'moodle/backup:configure', 1, 1390393232, 0),
(20, 1, 1, 'moodle/backup:userinfo', 1, 1390393232, 0),
(21, 1, 1, 'moodle/backup:anonymise', 1, 1390393232, 0),
(22, 1, 3, 'moodle/restore:restorecourse', 1, 1390393232, 0),
(23, 1, 1, 'moodle/restore:restorecourse', 1, 1390393232, 0),
(24, 1, 3, 'moodle/restore:restoresection', 1, 1390393232, 0),
(25, 1, 1, 'moodle/restore:restoresection', 1, 1390393232, 0),
(26, 1, 3, 'moodle/restore:restoreactivity', 1, 1390393232, 0),
(27, 1, 1, 'moodle/restore:restoreactivity', 1, 1390393233, 0),
(28, 1, 3, 'moodle/restore:restoretargethub', 1, 1390393233, 0),
(29, 1, 1, 'moodle/restore:restoretargethub', 1, 1390393233, 0),
(30, 1, 3, 'moodle/restore:restoretargetimport', 1, 1390393233, 0),
(31, 1, 1, 'moodle/restore:restoretargetimport', 1, 1390393233, 0),
(32, 1, 3, 'moodle/restore:uploadfile', 1, 1390393233, 0),
(33, 1, 1, 'moodle/restore:uploadfile', 1, 1390393233, 0),
(34, 1, 3, 'moodle/restore:configure', 1, 1390393233, 0),
(35, 1, 1, 'moodle/restore:configure', 1, 1390393233, 0),
(36, 1, 2, 'moodle/restore:rolldates', 1, 1390393233, 0),
(37, 1, 1, 'moodle/restore:rolldates', 1, 1390393233, 0),
(38, 1, 1, 'moodle/restore:userinfo', 1, 1390393233, 0),
(39, 1, 1, 'moodle/restore:createuser', 1, 1390393233, 0),
(40, 1, 3, 'moodle/site:manageblocks', 1, 1390393233, 0),
(41, 1, 1, 'moodle/site:manageblocks', 1, 1390393233, 0),
(42, 1, 4, 'moodle/site:accessallgroups', 1, 1390393233, 0),
(43, 1, 3, 'moodle/site:accessallgroups', 1, 1390393233, 0),
(44, 1, 1, 'moodle/site:accessallgroups', 1, 1390393233, 0),
(45, 1, 4, 'moodle/site:viewfullnames', 1, 1390393233, 0),
(46, 1, 3, 'moodle/site:viewfullnames', 1, 1390393233, 0),
(47, 1, 1, 'moodle/site:viewfullnames', 1, 1390393233, 0),
(48, 1, 4, 'moodle/site:viewuseridentity', 1, 1390393233, 0),
(49, 1, 3, 'moodle/site:viewuseridentity', 1, 1390393233, 0),
(50, 1, 1, 'moodle/site:viewuseridentity', 1, 1390393233, 0),
(51, 1, 4, 'moodle/site:viewreports', 1, 1390393233, 0),
(52, 1, 3, 'moodle/site:viewreports', 1, 1390393233, 0),
(53, 1, 1, 'moodle/site:viewreports', 1, 1390393233, 0),
(54, 1, 3, 'moodle/site:trustcontent', 1, 1390393233, 0),
(55, 1, 1, 'moodle/site:trustcontent', 1, 1390393233, 0),
(56, 1, 1, 'moodle/site:uploadusers', 1, 1390393233, 0),
(57, 1, 3, 'moodle/filter:manage', 1, 1390393233, 0),
(58, 1, 1, 'moodle/filter:manage', 1, 1390393233, 0),
(59, 1, 1, 'moodle/user:create', 1, 1390393233, 0),
(60, 1, 1, 'moodle/user:delete', 1, 1390393233, 0),
(61, 1, 1, 'moodle/user:update', 1, 1390393233, 0),
(62, 1, 6, 'moodle/user:viewdetails', 1, 1390393233, 0),
(63, 1, 5, 'moodle/user:viewdetails', 1, 1390393233, 0),
(64, 1, 4, 'moodle/user:viewdetails', 1, 1390393233, 0),
(65, 1, 3, 'moodle/user:viewdetails', 1, 1390393233, 0),
(66, 1, 1, 'moodle/user:viewdetails', 1, 1390393233, 0),
(67, 1, 1, 'moodle/user:viewalldetails', 1, 1390393233, 0),
(68, 1, 4, 'moodle/user:viewhiddendetails', 1, 1390393233, 0),
(69, 1, 3, 'moodle/user:viewhiddendetails', 1, 1390393233, 0),
(70, 1, 1, 'moodle/user:viewhiddendetails', 1, 1390393233, 0),
(71, 1, 1, 'moodle/user:loginas', 1, 1390393233, 0),
(72, 1, 1, 'moodle/user:managesyspages', 1, 1390393233, 0),
(73, 1, 7, 'moodle/user:manageownblocks', 1, 1390393233, 0),
(74, 1, 7, 'moodle/user:manageownfiles', 1, 1390393233, 0),
(75, 1, 1, 'moodle/my:configsyspages', 1, 1390393233, 0),
(76, 1, 3, 'moodle/role:assign', 1, 1390393233, 0),
(77, 1, 1, 'moodle/role:assign', 1, 1390393233, 0),
(78, 1, 4, 'moodle/role:review', 1, 1390393233, 0),
(79, 1, 3, 'moodle/role:review', 1, 1390393233, 0),
(80, 1, 1, 'moodle/role:review', 1, 1390393233, 0),
(81, 1, 1, 'moodle/role:override', 1, 1390393233, 0),
(82, 1, 3, 'moodle/role:safeoverride', 1, 1390393233, 0),
(83, 1, 1, 'moodle/role:manage', 1, 1390393233, 0),
(84, 1, 3, 'moodle/role:switchroles', 1, 1390393233, 0),
(85, 1, 1, 'moodle/role:switchroles', 1, 1390393233, 0),
(86, 1, 1, 'moodle/category:manage', 1, 1390393233, 0),
(87, 1, 2, 'moodle/category:viewhiddencategories', 1, 1390393233, 0),
(88, 1, 1, 'moodle/category:viewhiddencategories', 1, 1390393233, 0),
(89, 1, 1, 'moodle/cohort:manage', 1, 1390393233, 0),
(90, 1, 1, 'moodle/cohort:assign', 1, 1390393233, 0),
(91, 1, 3, 'moodle/cohort:view', 1, 1390393233, 0),
(92, 1, 1, 'moodle/cohort:view', 1, 1390393233, 0),
(93, 1, 2, 'moodle/course:create', 1, 1390393233, 0),
(94, 1, 1, 'moodle/course:create', 1, 1390393233, 0),
(95, 1, 7, 'moodle/course:request', 1, 1390393233, 0),
(96, 1, 1, 'moodle/course:delete', 1, 1390393233, 0),
(97, 1, 3, 'moodle/course:update', 1, 1390393233, 0),
(98, 1, 1, 'moodle/course:update', 1, 1390393233, 0),
(99, 1, 1, 'moodle/course:view', 1, 1390393233, 0),
(100, 1, 3, 'moodle/course:enrolreview', 1, 1390393233, 0),
(101, 1, 1, 'moodle/course:enrolreview', 1, 1390393233, 0),
(102, 1, 3, 'moodle/course:enrolconfig', 1, 1390393233, 0),
(103, 1, 1, 'moodle/course:enrolconfig', 1, 1390393233, 0),
(104, 1, 4, 'moodle/course:bulkmessaging', 1, 1390393233, 0),
(105, 1, 3, 'moodle/course:bulkmessaging', 1, 1390393233, 0),
(106, 1, 1, 'moodle/course:bulkmessaging', 1, 1390393233, 0),
(107, 1, 4, 'moodle/course:viewhiddenuserfields', 1, 1390393233, 0),
(108, 1, 3, 'moodle/course:viewhiddenuserfields', 1, 1390393233, 0),
(109, 1, 1, 'moodle/course:viewhiddenuserfields', 1, 1390393233, 0),
(110, 1, 2, 'moodle/course:viewhiddencourses', 1, 1390393233, 0),
(111, 1, 4, 'moodle/course:viewhiddencourses', 1, 1390393233, 0),
(112, 1, 3, 'moodle/course:viewhiddencourses', 1, 1390393233, 0),
(113, 1, 1, 'moodle/course:viewhiddencourses', 1, 1390393233, 0),
(114, 1, 3, 'moodle/course:visibility', 1, 1390393233, 0),
(115, 1, 1, 'moodle/course:visibility', 1, 1390393233, 0),
(116, 1, 3, 'moodle/course:managefiles', 1, 1390393233, 0),
(117, 1, 1, 'moodle/course:managefiles', 1, 1390393233, 0),
(118, 1, 3, 'moodle/course:manageactivities', 1, 1390393233, 0),
(119, 1, 1, 'moodle/course:manageactivities', 1, 1390393233, 0),
(120, 1, 3, 'moodle/course:activityvisibility', 1, 1390393233, 0),
(121, 1, 1, 'moodle/course:activityvisibility', 1, 1390393233, 0),
(122, 1, 4, 'moodle/course:viewhiddenactivities', 1, 1390393233, 0),
(123, 1, 3, 'moodle/course:viewhiddenactivities', 1, 1390393233, 0),
(124, 1, 1, 'moodle/course:viewhiddenactivities', 1, 1390393233, 0),
(125, 1, 5, 'moodle/course:viewparticipants', 1, 1390393233, 0),
(126, 1, 4, 'moodle/course:viewparticipants', 1, 1390393233, 0),
(127, 1, 3, 'moodle/course:viewparticipants', 1, 1390393233, 0),
(128, 1, 1, 'moodle/course:viewparticipants', 1, 1390393233, 0),
(129, 1, 3, 'moodle/course:changefullname', 1, 1390393233, 0),
(130, 1, 1, 'moodle/course:changefullname', 1, 1390393233, 0),
(131, 1, 3, 'moodle/course:changeshortname', 1, 1390393233, 0),
(132, 1, 1, 'moodle/course:changeshortname', 1, 1390393233, 0),
(133, 1, 3, 'moodle/course:changeidnumber', 1, 1390393233, 0),
(134, 1, 1, 'moodle/course:changeidnumber', 1, 1390393233, 0),
(135, 1, 3, 'moodle/course:changecategory', 1, 1390393233, 0),
(136, 1, 1, 'moodle/course:changecategory', 1, 1390393233, 0),
(137, 1, 3, 'moodle/course:changesummary', 1, 1390393233, 0),
(138, 1, 1, 'moodle/course:changesummary', 1, 1390393233, 0),
(139, 1, 1, 'moodle/site:viewparticipants', 1, 1390393233, 0),
(140, 1, 5, 'moodle/course:viewscales', 1, 1390393233, 0),
(141, 1, 4, 'moodle/course:viewscales', 1, 1390393233, 0),
(142, 1, 3, 'moodle/course:viewscales', 1, 1390393233, 0),
(143, 1, 1, 'moodle/course:viewscales', 1, 1390393233, 0),
(144, 1, 3, 'moodle/course:managescales', 1, 1390393233, 0),
(145, 1, 1, 'moodle/course:managescales', 1, 1390393233, 0),
(146, 1, 3, 'moodle/course:managegroups', 1, 1390393233, 0),
(147, 1, 1, 'moodle/course:managegroups', 1, 1390393233, 0),
(148, 1, 3, 'moodle/course:reset', 1, 1390393233, 0),
(149, 1, 1, 'moodle/course:reset', 1, 1390393233, 0),
(150, 1, 6, 'moodle/blog:view', 1, 1390393233, 0),
(151, 1, 7, 'moodle/blog:view', 1, 1390393233, 0),
(152, 1, 5, 'moodle/blog:view', 1, 1390393233, 0),
(153, 1, 4, 'moodle/blog:view', 1, 1390393233, 0),
(154, 1, 3, 'moodle/blog:view', 1, 1390393233, 0),
(155, 1, 1, 'moodle/blog:view', 1, 1390393233, 0),
(156, 1, 6, 'moodle/blog:search', 1, 1390393233, 0),
(157, 1, 7, 'moodle/blog:search', 1, 1390393233, 0),
(158, 1, 5, 'moodle/blog:search', 1, 1390393233, 0),
(159, 1, 4, 'moodle/blog:search', 1, 1390393233, 0),
(160, 1, 3, 'moodle/blog:search', 1, 1390393233, 0),
(161, 1, 1, 'moodle/blog:search', 1, 1390393233, 0),
(162, 1, 1, 'moodle/blog:viewdrafts', 1, 1390393233, 0),
(163, 1, 7, 'moodle/blog:create', 1, 1390393233, 0),
(164, 1, 1, 'moodle/blog:create', 1, 1390393233, 0),
(165, 1, 4, 'moodle/blog:manageentries', 1, 1390393233, 0),
(166, 1, 3, 'moodle/blog:manageentries', 1, 1390393233, 0),
(167, 1, 1, 'moodle/blog:manageentries', 1, 1390393233, 0),
(168, 1, 5, 'moodle/blog:manageexternal', 1, 1390393233, 0),
(169, 1, 7, 'moodle/blog:manageexternal', 1, 1390393233, 0),
(170, 1, 4, 'moodle/blog:manageexternal', 1, 1390393233, 0),
(171, 1, 3, 'moodle/blog:manageexternal', 1, 1390393233, 0),
(172, 1, 1, 'moodle/blog:manageexternal', 1, 1390393233, 0),
(173, 1, 5, 'moodle/blog:associatecourse', 1, 1390393233, 0),
(174, 1, 7, 'moodle/blog:associatecourse', 1, 1390393233, 0),
(175, 1, 4, 'moodle/blog:associatecourse', 1, 1390393233, 0),
(176, 1, 3, 'moodle/blog:associatecourse', 1, 1390393233, 0),
(177, 1, 1, 'moodle/blog:associatecourse', 1, 1390393233, 0),
(178, 1, 5, 'moodle/blog:associatemodule', 1, 1390393233, 0),
(179, 1, 7, 'moodle/blog:associatemodule', 1, 1390393233, 0),
(180, 1, 4, 'moodle/blog:associatemodule', 1, 1390393233, 0),
(181, 1, 3, 'moodle/blog:associatemodule', 1, 1390393233, 0),
(182, 1, 1, 'moodle/blog:associatemodule', 1, 1390393233, 0),
(183, 1, 7, 'moodle/calendar:manageownentries', 1, 1390393233, 0),
(184, 1, 1, 'moodle/calendar:manageownentries', 1, 1390393233, 0),
(185, 1, 4, 'moodle/calendar:managegroupentries', 1, 1390393233, 0),
(186, 1, 3, 'moodle/calendar:managegroupentries', 1, 1390393233, 0),
(187, 1, 1, 'moodle/calendar:managegroupentries', 1, 1390393233, 0),
(188, 1, 4, 'moodle/calendar:manageentries', 1, 1390393233, 0),
(189, 1, 3, 'moodle/calendar:manageentries', 1, 1390393233, 0),
(190, 1, 1, 'moodle/calendar:manageentries', 1, 1390393233, 0),
(191, 1, 1, 'moodle/user:editprofile', 1, 1390393233, 0),
(192, 1, 6, 'moodle/user:editownprofile', -1000, 1390393233, 0),
(193, 1, 7, 'moodle/user:editownprofile', 1, 1390393233, 0),
(194, 1, 1, 'moodle/user:editownprofile', 1, 1390393233, 0),
(195, 1, 6, 'moodle/user:changeownpassword', -1000, 1390393233, 0),
(196, 1, 7, 'moodle/user:changeownpassword', 1, 1390393233, 0),
(197, 1, 1, 'moodle/user:changeownpassword', 1, 1390393233, 0),
(198, 1, 5, 'moodle/user:readuserposts', 1, 1390393233, 0),
(199, 1, 4, 'moodle/user:readuserposts', 1, 1390393233, 0),
(200, 1, 3, 'moodle/user:readuserposts', 1, 1390393233, 0),
(201, 1, 1, 'moodle/user:readuserposts', 1, 1390393233, 0),
(202, 1, 5, 'moodle/user:readuserblogs', 1, 1390393233, 0),
(203, 1, 4, 'moodle/user:readuserblogs', 1, 1390393233, 0),
(204, 1, 3, 'moodle/user:readuserblogs', 1, 1390393233, 0),
(205, 1, 1, 'moodle/user:readuserblogs', 1, 1390393233, 0),
(206, 1, 1, 'moodle/user:editmessageprofile', 1, 1390393233, 0),
(207, 1, 6, 'moodle/user:editownmessageprofile', -1000, 1390393233, 0),
(208, 1, 7, 'moodle/user:editownmessageprofile', 1, 1390393233, 0),
(209, 1, 1, 'moodle/user:editownmessageprofile', 1, 1390393233, 0),
(210, 1, 3, 'moodle/question:managecategory', 1, 1390393233, 0),
(211, 1, 1, 'moodle/question:managecategory', 1, 1390393233, 0),
(212, 1, 3, 'moodle/question:add', 1, 1390393233, 0),
(213, 1, 1, 'moodle/question:add', 1, 1390393233, 0),
(214, 1, 3, 'moodle/question:editmine', 1, 1390393233, 0),
(215, 1, 1, 'moodle/question:editmine', 1, 1390393233, 0),
(216, 1, 3, 'moodle/question:editall', 1, 1390393233, 0),
(217, 1, 1, 'moodle/question:editall', 1, 1390393233, 0),
(218, 1, 3, 'moodle/question:viewmine', 1, 1390393233, 0),
(219, 1, 1, 'moodle/question:viewmine', 1, 1390393233, 0),
(220, 1, 3, 'moodle/question:viewall', 1, 1390393233, 0),
(221, 1, 1, 'moodle/question:viewall', 1, 1390393233, 0),
(222, 1, 3, 'moodle/question:usemine', 1, 1390393233, 0),
(223, 1, 1, 'moodle/question:usemine', 1, 1390393233, 0),
(224, 1, 3, 'moodle/question:useall', 1, 1390393233, 0),
(225, 1, 1, 'moodle/question:useall', 1, 1390393233, 0),
(226, 1, 3, 'moodle/question:movemine', 1, 1390393233, 0),
(227, 1, 1, 'moodle/question:movemine', 1, 1390393233, 0),
(228, 1, 3, 'moodle/question:moveall', 1, 1390393233, 0),
(229, 1, 1, 'moodle/question:moveall', 1, 1390393233, 0),
(230, 1, 1, 'moodle/question:config', 1, 1390393233, 0),
(231, 1, 5, 'moodle/question:flag', 1, 1390393233, 0),
(232, 1, 4, 'moodle/question:flag', 1, 1390393233, 0),
(233, 1, 3, 'moodle/question:flag', 1, 1390393233, 0),
(234, 1, 1, 'moodle/question:flag', 1, 1390393233, 0),
(235, 1, 4, 'moodle/site:doclinks', 1, 1390393233, 0),
(236, 1, 3, 'moodle/site:doclinks', 1, 1390393233, 0),
(237, 1, 1, 'moodle/site:doclinks', 1, 1390393233, 0),
(238, 1, 3, 'moodle/course:sectionvisibility', 1, 1390393233, 0),
(239, 1, 1, 'moodle/course:sectionvisibility', 1, 1390393233, 0),
(240, 1, 3, 'moodle/course:useremail', 1, 1390393233, 0),
(241, 1, 1, 'moodle/course:useremail', 1, 1390393233, 0),
(242, 1, 3, 'moodle/course:viewhiddensections', 1, 1390393233, 0),
(243, 1, 1, 'moodle/course:viewhiddensections', 1, 1390393233, 0),
(244, 1, 3, 'moodle/course:setcurrentsection', 1, 1390393233, 0),
(245, 1, 1, 'moodle/course:setcurrentsection', 1, 1390393233, 0),
(246, 1, 4, 'moodle/grade:viewall', 1, 1390393233, 0),
(247, 1, 3, 'moodle/grade:viewall', 1, 1390393233, 0),
(248, 1, 1, 'moodle/grade:viewall', 1, 1390393233, 0),
(249, 1, 5, 'moodle/grade:view', 1, 1390393233, 0),
(250, 1, 4, 'moodle/grade:viewhidden', 1, 1390393233, 0),
(251, 1, 3, 'moodle/grade:viewhidden', 1, 1390393233, 0),
(252, 1, 1, 'moodle/grade:viewhidden', 1, 1390393233, 0),
(253, 1, 3, 'moodle/grade:import', 1, 1390393233, 0),
(254, 1, 1, 'moodle/grade:import', 1, 1390393233, 0),
(255, 1, 4, 'moodle/grade:export', 1, 1390393233, 0),
(256, 1, 3, 'moodle/grade:export', 1, 1390393233, 0),
(257, 1, 1, 'moodle/grade:export', 1, 1390393233, 0),
(258, 1, 3, 'moodle/grade:manage', 1, 1390393233, 0),
(259, 1, 1, 'moodle/grade:manage', 1, 1390393233, 0),
(260, 1, 3, 'moodle/grade:edit', 1, 1390393233, 0),
(261, 1, 1, 'moodle/grade:edit', 1, 1390393233, 0),
(262, 1, 3, 'moodle/grade:managegradingforms', 1, 1390393233, 0),
(263, 1, 1, 'moodle/grade:managegradingforms', 1, 1390393233, 0),
(264, 1, 1, 'moodle/grade:sharegradingforms', 1, 1390393233, 0),
(265, 1, 1, 'moodle/grade:managesharedforms', 1, 1390393233, 0),
(266, 1, 3, 'moodle/grade:manageoutcomes', 1, 1390393233, 0),
(267, 1, 1, 'moodle/grade:manageoutcomes', 1, 1390393233, 0),
(268, 1, 3, 'moodle/grade:manageletters', 1, 1390393233, 0),
(269, 1, 1, 'moodle/grade:manageletters', 1, 1390393233, 0),
(270, 1, 3, 'moodle/grade:hide', 1, 1390393233, 0),
(271, 1, 1, 'moodle/grade:hide', 1, 1390393233, 0),
(272, 1, 3, 'moodle/grade:lock', 1, 1390393233, 0),
(273, 1, 1, 'moodle/grade:lock', 1, 1390393233, 0),
(274, 1, 3, 'moodle/grade:unlock', 1, 1390393233, 0),
(275, 1, 1, 'moodle/grade:unlock', 1, 1390393233, 0),
(276, 1, 7, 'moodle/my:manageblocks', 1, 1390393233, 0),
(277, 1, 4, 'moodle/notes:view', 1, 1390393233, 0),
(278, 1, 3, 'moodle/notes:view', 1, 1390393233, 0),
(279, 1, 1, 'moodle/notes:view', 1, 1390393233, 0),
(280, 1, 4, 'moodle/notes:manage', 1, 1390393233, 0),
(281, 1, 3, 'moodle/notes:manage', 1, 1390393233, 0),
(282, 1, 1, 'moodle/notes:manage', 1, 1390393233, 0),
(283, 1, 4, 'moodle/tag:manage', 1, 1390393233, 0),
(284, 1, 3, 'moodle/tag:manage', 1, 1390393233, 0),
(285, 1, 1, 'moodle/tag:manage', 1, 1390393233, 0),
(286, 1, 1, 'moodle/tag:create', 1, 1390393233, 0),
(287, 1, 7, 'moodle/tag:create', 1, 1390393233, 0),
(288, 1, 1, 'moodle/tag:edit', 1, 1390393233, 0),
(289, 1, 7, 'moodle/tag:edit', 1, 1390393233, 0),
(290, 1, 4, 'moodle/tag:editblocks', 1, 1390393233, 0),
(291, 1, 3, 'moodle/tag:editblocks', 1, 1390393233, 0),
(292, 1, 1, 'moodle/tag:editblocks', 1, 1390393233, 0),
(293, 1, 6, 'moodle/block:view', 1, 1390393233, 0),
(294, 1, 7, 'moodle/block:view', 1, 1390393233, 0),
(295, 1, 5, 'moodle/block:view', 1, 1390393233, 0),
(296, 1, 4, 'moodle/block:view', 1, 1390393233, 0),
(297, 1, 3, 'moodle/block:view', 1, 1390393233, 0),
(298, 1, 3, 'moodle/block:edit', 1, 1390393233, 0),
(299, 1, 1, 'moodle/block:edit', 1, 1390393233, 0),
(300, 1, 7, 'moodle/portfolio:export', 1, 1390393233, 0),
(301, 1, 5, 'moodle/portfolio:export', 1, 1390393233, 0),
(302, 1, 4, 'moodle/portfolio:export', 1, 1390393233, 0),
(303, 1, 3, 'moodle/portfolio:export', 1, 1390393233, 0),
(304, 1, 8, 'moodle/comment:view', 1, 1390393233, 0),
(305, 1, 6, 'moodle/comment:view', 1, 1390393233, 0),
(306, 1, 7, 'moodle/comment:view', 1, 1390393233, 0),
(307, 1, 5, 'moodle/comment:view', 1, 1390393233, 0),
(308, 1, 4, 'moodle/comment:view', 1, 1390393233, 0),
(309, 1, 3, 'moodle/comment:view', 1, 1390393233, 0),
(310, 1, 1, 'moodle/comment:view', 1, 1390393233, 0),
(311, 1, 7, 'moodle/comment:post', 1, 1390393233, 0),
(312, 1, 5, 'moodle/comment:post', 1, 1390393233, 0),
(313, 1, 4, 'moodle/comment:post', 1, 1390393233, 0),
(314, 1, 3, 'moodle/comment:post', 1, 1390393233, 0),
(315, 1, 1, 'moodle/comment:post', 1, 1390393233, 0),
(316, 1, 3, 'moodle/comment:delete', 1, 1390393233, 0),
(317, 1, 1, 'moodle/comment:delete', 1, 1390393233, 0),
(318, 1, 1, 'moodle/webservice:createtoken', 1, 1390393233, 0),
(319, 1, 7, 'moodle/webservice:createmobiletoken', 1, 1390393233, 0),
(320, 1, 7, 'moodle/rating:view', 1, 1390393233, 0),
(321, 1, 5, 'moodle/rating:view', 1, 1390393233, 0),
(322, 1, 4, 'moodle/rating:view', 1, 1390393233, 0),
(323, 1, 3, 'moodle/rating:view', 1, 1390393233, 0),
(324, 1, 1, 'moodle/rating:view', 1, 1390393233, 0),
(325, 1, 7, 'moodle/rating:viewany', 1, 1390393233, 0),
(326, 1, 5, 'moodle/rating:viewany', 1, 1390393233, 0),
(327, 1, 4, 'moodle/rating:viewany', 1, 1390393233, 0),
(328, 1, 3, 'moodle/rating:viewany', 1, 1390393233, 0),
(329, 1, 1, 'moodle/rating:viewany', 1, 1390393233, 0),
(330, 1, 7, 'moodle/rating:viewall', 1, 1390393233, 0),
(331, 1, 5, 'moodle/rating:viewall', 1, 1390393233, 0),
(332, 1, 4, 'moodle/rating:viewall', 1, 1390393233, 0),
(333, 1, 3, 'moodle/rating:viewall', 1, 1390393233, 0),
(334, 1, 1, 'moodle/rating:viewall', 1, 1390393233, 0),
(335, 1, 7, 'moodle/rating:rate', 1, 1390393233, 0),
(336, 1, 5, 'moodle/rating:rate', 1, 1390393233, 0),
(337, 1, 4, 'moodle/rating:rate', 1, 1390393233, 0),
(338, 1, 3, 'moodle/rating:rate', 1, 1390393233, 0),
(339, 1, 1, 'moodle/rating:rate', 1, 1390393233, 0),
(340, 1, 1, 'moodle/course:publish', 1, 1390393233, 0),
(341, 1, 4, 'moodle/course:markcomplete', 1, 1390393233, 0),
(342, 1, 3, 'moodle/course:markcomplete', 1, 1390393233, 0),
(343, 1, 1, 'moodle/course:markcomplete', 1, 1390393233, 0),
(344, 1, 1, 'moodle/community:add', 1, 1390393233, 0),
(345, 1, 4, 'moodle/community:add', 1, 1390393233, 0),
(346, 1, 3, 'moodle/community:add', 1, 1390393233, 0),
(347, 1, 1, 'moodle/community:download', 1, 1390393233, 0),
(348, 1, 3, 'moodle/community:download', 1, 1390393233, 0),
(349, 1, 6, 'mod/assign:view', 1, 1390393240, 0),
(350, 1, 5, 'mod/assign:view', 1, 1390393240, 0),
(351, 1, 4, 'mod/assign:view', 1, 1390393240, 0),
(352, 1, 3, 'mod/assign:view', 1, 1390393240, 0),
(353, 1, 1, 'mod/assign:view', 1, 1390393240, 0),
(354, 1, 5, 'mod/assign:submit', 1, 1390393240, 0),
(355, 1, 4, 'mod/assign:grade', 1, 1390393240, 0),
(356, 1, 3, 'mod/assign:grade', 1, 1390393240, 0),
(357, 1, 1, 'mod/assign:grade', 1, 1390393240, 0),
(358, 1, 4, 'mod/assign:exportownsubmission', 1, 1390393240, 0),
(359, 1, 3, 'mod/assign:exportownsubmission', 1, 1390393240, 0),
(360, 1, 1, 'mod/assign:exportownsubmission', 1, 1390393240, 0),
(361, 1, 5, 'mod/assign:exportownsubmission', 1, 1390393240, 0),
(362, 1, 3, 'mod/assign:addinstance', 1, 1390393240, 0),
(363, 1, 1, 'mod/assign:addinstance', 1, 1390393240, 0),
(364, 1, 6, 'mod/assignment:view', 1, 1390393240, 0),
(365, 1, 5, 'mod/assignment:view', 1, 1390393240, 0),
(366, 1, 4, 'mod/assignment:view', 1, 1390393240, 0),
(367, 1, 3, 'mod/assignment:view', 1, 1390393240, 0),
(368, 1, 1, 'mod/assignment:view', 1, 1390393240, 0),
(369, 1, 3, 'mod/assignment:addinstance', 1, 1390393240, 0),
(370, 1, 1, 'mod/assignment:addinstance', 1, 1390393240, 0),
(371, 1, 5, 'mod/assignment:submit', 1, 1390393240, 0),
(372, 1, 4, 'mod/assignment:grade', 1, 1390393240, 0),
(373, 1, 3, 'mod/assignment:grade', 1, 1390393240, 0),
(374, 1, 1, 'mod/assignment:grade', 1, 1390393240, 0),
(375, 1, 4, 'mod/assignment:exportownsubmission', 1, 1390393240, 0),
(376, 1, 3, 'mod/assignment:exportownsubmission', 1, 1390393240, 0),
(377, 1, 1, 'mod/assignment:exportownsubmission', 1, 1390393240, 0),
(378, 1, 5, 'mod/assignment:exportownsubmission', 1, 1390393240, 0),
(379, 1, 3, 'mod/book:addinstance', 1, 1390393240, 0),
(380, 1, 1, 'mod/book:addinstance', 1, 1390393240, 0),
(381, 1, 6, 'mod/book:read', 1, 1390393240, 0),
(382, 1, 8, 'mod/book:read', 1, 1390393240, 0),
(383, 1, 5, 'mod/book:read', 1, 1390393240, 0),
(384, 1, 4, 'mod/book:read', 1, 1390393240, 0),
(385, 1, 3, 'mod/book:read', 1, 1390393240, 0),
(386, 1, 1, 'mod/book:read', 1, 1390393240, 0),
(387, 1, 4, 'mod/book:viewhiddenchapters', 1, 1390393240, 0),
(388, 1, 3, 'mod/book:viewhiddenchapters', 1, 1390393240, 0),
(389, 1, 1, 'mod/book:viewhiddenchapters', 1, 1390393240, 0),
(390, 1, 3, 'mod/book:edit', 1, 1390393240, 0),
(391, 1, 1, 'mod/book:edit', 1, 1390393240, 0),
(392, 1, 3, 'mod/certificate:addinstance', 1, 1390393241, 0),
(393, 1, 1, 'mod/certificate:addinstance', 1, 1390393241, 0),
(394, 1, 5, 'mod/certificate:view', 1, 1390393241, 0),
(395, 1, 4, 'mod/certificate:view', 1, 1390393241, 0),
(396, 1, 3, 'mod/certificate:view', 1, 1390393241, 0),
(397, 1, 1, 'mod/certificate:view', 1, 1390393241, 0),
(398, 1, 4, 'mod/certificate:manage', 1, 1390393241, 0),
(399, 1, 3, 'mod/certificate:manage', 1, 1390393241, 0),
(400, 1, 1, 'mod/certificate:manage', 1, 1390393241, 0),
(401, 1, 4, 'mod/certificate:printteacher', 1, 1390393241, 0),
(402, 1, 3, 'mod/certificate:printteacher', 1, 1390393241, 0),
(403, 1, 1, 'mod/certificate:printteacher', 1, 1390393241, 0),
(404, 1, 3, 'mod/chat:addinstance', 1, 1390393241, 0),
(405, 1, 1, 'mod/chat:addinstance', 1, 1390393241, 0),
(406, 1, 5, 'mod/chat:chat', 1, 1390393241, 0),
(407, 1, 4, 'mod/chat:chat', 1, 1390393241, 0),
(408, 1, 3, 'mod/chat:chat', 1, 1390393241, 0),
(409, 1, 1, 'mod/chat:chat', 1, 1390393241, 0),
(410, 1, 5, 'mod/chat:readlog', 1, 1390393241, 0),
(411, 1, 4, 'mod/chat:readlog', 1, 1390393242, 0),
(412, 1, 3, 'mod/chat:readlog', 1, 1390393242, 0),
(413, 1, 1, 'mod/chat:readlog', 1, 1390393242, 0),
(414, 1, 4, 'mod/chat:deletelog', 1, 1390393242, 0),
(415, 1, 3, 'mod/chat:deletelog', 1, 1390393242, 0),
(416, 1, 1, 'mod/chat:deletelog', 1, 1390393242, 0),
(417, 1, 4, 'mod/chat:exportparticipatedsession', 1, 1390393242, 0),
(418, 1, 3, 'mod/chat:exportparticipatedsession', 1, 1390393242, 0),
(419, 1, 1, 'mod/chat:exportparticipatedsession', 1, 1390393242, 0),
(420, 1, 4, 'mod/chat:exportsession', 1, 1390393242, 0),
(421, 1, 3, 'mod/chat:exportsession', 1, 1390393242, 0),
(422, 1, 1, 'mod/chat:exportsession', 1, 1390393242, 0),
(423, 1, 3, 'mod/choice:addinstance', 1, 1390393242, 0),
(424, 1, 1, 'mod/choice:addinstance', 1, 1390393242, 0),
(425, 1, 5, 'mod/choice:choose', 1, 1390393242, 0),
(426, 1, 4, 'mod/choice:choose', 1, 1390393242, 0),
(427, 1, 3, 'mod/choice:choose', 1, 1390393242, 0),
(428, 1, 4, 'mod/choice:readresponses', 1, 1390393242, 0),
(429, 1, 3, 'mod/choice:readresponses', 1, 1390393242, 0),
(430, 1, 1, 'mod/choice:readresponses', 1, 1390393242, 0),
(431, 1, 4, 'mod/choice:deleteresponses', 1, 1390393242, 0),
(432, 1, 3, 'mod/choice:deleteresponses', 1, 1390393242, 0),
(433, 1, 1, 'mod/choice:deleteresponses', 1, 1390393242, 0),
(434, 1, 4, 'mod/choice:downloadresponses', 1, 1390393242, 0),
(435, 1, 3, 'mod/choice:downloadresponses', 1, 1390393242, 0),
(436, 1, 1, 'mod/choice:downloadresponses', 1, 1390393242, 0),
(437, 1, 3, 'mod/data:addinstance', 1, 1390393243, 0),
(438, 1, 1, 'mod/data:addinstance', 1, 1390393243, 0),
(439, 1, 8, 'mod/data:viewentry', 1, 1390393243, 0),
(440, 1, 6, 'mod/data:viewentry', 1, 1390393243, 0),
(441, 1, 5, 'mod/data:viewentry', 1, 1390393243, 0),
(442, 1, 4, 'mod/data:viewentry', 1, 1390393243, 0),
(443, 1, 3, 'mod/data:viewentry', 1, 1390393243, 0),
(444, 1, 1, 'mod/data:viewentry', 1, 1390393243, 0),
(445, 1, 5, 'mod/data:writeentry', 1, 1390393243, 0),
(446, 1, 4, 'mod/data:writeentry', 1, 1390393243, 0),
(447, 1, 3, 'mod/data:writeentry', 1, 1390393243, 0),
(448, 1, 1, 'mod/data:writeentry', 1, 1390393243, 0),
(449, 1, 5, 'mod/data:comment', 1, 1390393243, 0),
(450, 1, 4, 'mod/data:comment', 1, 1390393243, 0),
(451, 1, 3, 'mod/data:comment', 1, 1390393243, 0),
(452, 1, 1, 'mod/data:comment', 1, 1390393243, 0),
(453, 1, 4, 'mod/data:rate', 1, 1390393243, 0),
(454, 1, 3, 'mod/data:rate', 1, 1390393243, 0),
(455, 1, 1, 'mod/data:rate', 1, 1390393243, 0),
(456, 1, 4, 'mod/data:viewrating', 1, 1390393243, 0),
(457, 1, 3, 'mod/data:viewrating', 1, 1390393243, 0),
(458, 1, 1, 'mod/data:viewrating', 1, 1390393243, 0),
(459, 1, 4, 'mod/data:viewanyrating', 1, 1390393243, 0),
(460, 1, 3, 'mod/data:viewanyrating', 1, 1390393243, 0),
(461, 1, 1, 'mod/data:viewanyrating', 1, 1390393243, 0),
(462, 1, 4, 'mod/data:viewallratings', 1, 1390393243, 0),
(463, 1, 3, 'mod/data:viewallratings', 1, 1390393243, 0),
(464, 1, 1, 'mod/data:viewallratings', 1, 1390393243, 0),
(465, 1, 4, 'mod/data:approve', 1, 1390393243, 0),
(466, 1, 3, 'mod/data:approve', 1, 1390393243, 0),
(467, 1, 1, 'mod/data:approve', 1, 1390393243, 0),
(468, 1, 4, 'mod/data:manageentries', 1, 1390393243, 0),
(469, 1, 3, 'mod/data:manageentries', 1, 1390393243, 0),
(470, 1, 1, 'mod/data:manageentries', 1, 1390393243, 0),
(471, 1, 4, 'mod/data:managecomments', 1, 1390393243, 0),
(472, 1, 3, 'mod/data:managecomments', 1, 1390393243, 0),
(473, 1, 1, 'mod/data:managecomments', 1, 1390393243, 0),
(474, 1, 3, 'mod/data:managetemplates', 1, 1390393243, 0),
(475, 1, 1, 'mod/data:managetemplates', 1, 1390393243, 0),
(476, 1, 4, 'mod/data:viewalluserpresets', 1, 1390393243, 0),
(477, 1, 3, 'mod/data:viewalluserpresets', 1, 1390393243, 0),
(478, 1, 1, 'mod/data:viewalluserpresets', 1, 1390393243, 0),
(479, 1, 1, 'mod/data:manageuserpresets', 1, 1390393243, 0),
(480, 1, 1, 'mod/data:exportentry', 1, 1390393243, 0),
(481, 1, 4, 'mod/data:exportentry', 1, 1390393243, 0),
(482, 1, 3, 'mod/data:exportentry', 1, 1390393243, 0),
(483, 1, 1, 'mod/data:exportownentry', 1, 1390393243, 0),
(484, 1, 4, 'mod/data:exportownentry', 1, 1390393243, 0),
(485, 1, 3, 'mod/data:exportownentry', 1, 1390393243, 0),
(486, 1, 5, 'mod/data:exportownentry', 1, 1390393243, 0),
(487, 1, 1, 'mod/data:exportallentries', 1, 1390393243, 0),
(488, 1, 4, 'mod/data:exportallentries', 1, 1390393243, 0),
(489, 1, 3, 'mod/data:exportallentries', 1, 1390393243, 0),
(490, 1, 3, 'mod/feedback:addinstance', 1, 1390393245, 0),
(491, 1, 1, 'mod/feedback:addinstance', 1, 1390393245, 0),
(492, 1, 6, 'mod/feedback:view', 1, 1390393245, 0),
(493, 1, 5, 'mod/feedback:view', 1, 1390393245, 0),
(494, 1, 4, 'mod/feedback:view', 1, 1390393245, 0),
(495, 1, 3, 'mod/feedback:view', 1, 1390393245, 0),
(496, 1, 1, 'mod/feedback:view', 1, 1390393245, 0),
(497, 1, 5, 'mod/feedback:complete', 1, 1390393245, 0),
(498, 1, 5, 'mod/feedback:viewanalysepage', 1, 1390393245, 0),
(499, 1, 3, 'mod/feedback:viewanalysepage', 1, 1390393245, 0),
(500, 1, 1, 'mod/feedback:viewanalysepage', 1, 1390393245, 0),
(501, 1, 3, 'mod/feedback:deletesubmissions', 1, 1390393245, 0),
(502, 1, 1, 'mod/feedback:deletesubmissions', 1, 1390393245, 0),
(503, 1, 1, 'mod/feedback:mapcourse', 1, 1390393245, 0),
(504, 1, 3, 'mod/feedback:edititems', 1, 1390393245, 0),
(505, 1, 1, 'mod/feedback:edititems', 1, 1390393245, 0),
(506, 1, 3, 'mod/feedback:createprivatetemplate', 1, 1390393245, 0),
(507, 1, 1, 'mod/feedback:createprivatetemplate', 1, 1390393245, 0),
(508, 1, 3, 'mod/feedback:createpublictemplate', 1, 1390393245, 0),
(509, 1, 1, 'mod/feedback:createpublictemplate', 1, 1390393245, 0),
(510, 1, 3, 'mod/feedback:deletetemplate', 1, 1390393245, 0),
(511, 1, 1, 'mod/feedback:deletetemplate', 1, 1390393245, 0),
(512, 1, 4, 'mod/feedback:viewreports', 1, 1390393245, 0),
(513, 1, 3, 'mod/feedback:viewreports', 1, 1390393245, 0),
(514, 1, 1, 'mod/feedback:viewreports', 1, 1390393245, 0),
(515, 1, 4, 'mod/feedback:receivemail', 1, 1390393245, 0),
(516, 1, 3, 'mod/feedback:receivemail', 1, 1390393245, 0),
(517, 1, 3, 'mod/folder:addinstance', 1, 1390393245, 0),
(518, 1, 1, 'mod/folder:addinstance', 1, 1390393245, 0),
(519, 1, 6, 'mod/folder:view', 1, 1390393245, 0),
(520, 1, 7, 'mod/folder:view', 1, 1390393245, 0),
(521, 1, 3, 'mod/folder:managefiles', 1, 1390393245, 0),
(522, 1, 3, 'mod/forum:addinstance', 1, 1390393247, 0),
(523, 1, 1, 'mod/forum:addinstance', 1, 1390393247, 0),
(524, 1, 8, 'mod/forum:viewdiscussion', 1, 1390393247, 0),
(525, 1, 6, 'mod/forum:viewdiscussion', 1, 1390393247, 0),
(526, 1, 5, 'mod/forum:viewdiscussion', 1, 1390393247, 0),
(527, 1, 4, 'mod/forum:viewdiscussion', 1, 1390393247, 0),
(528, 1, 3, 'mod/forum:viewdiscussion', 1, 1390393247, 0),
(529, 1, 1, 'mod/forum:viewdiscussion', 1, 1390393247, 0),
(530, 1, 4, 'mod/forum:viewhiddentimedposts', 1, 1390393247, 0),
(531, 1, 3, 'mod/forum:viewhiddentimedposts', 1, 1390393247, 0),
(532, 1, 1, 'mod/forum:viewhiddentimedposts', 1, 1390393247, 0),
(533, 1, 5, 'mod/forum:startdiscussion', 1, 1390393247, 0),
(534, 1, 4, 'mod/forum:startdiscussion', 1, 1390393247, 0),
(535, 1, 3, 'mod/forum:startdiscussion', 1, 1390393247, 0),
(536, 1, 1, 'mod/forum:startdiscussion', 1, 1390393247, 0),
(537, 1, 5, 'mod/forum:replypost', 1, 1390393247, 0),
(538, 1, 4, 'mod/forum:replypost', 1, 1390393247, 0),
(539, 1, 3, 'mod/forum:replypost', 1, 1390393247, 0),
(540, 1, 1, 'mod/forum:replypost', 1, 1390393247, 0),
(541, 1, 4, 'mod/forum:addnews', 1, 1390393247, 0),
(542, 1, 3, 'mod/forum:addnews', 1, 1390393247, 0),
(543, 1, 1, 'mod/forum:addnews', 1, 1390393247, 0),
(544, 1, 4, 'mod/forum:replynews', 1, 1390393247, 0),
(545, 1, 3, 'mod/forum:replynews', 1, 1390393247, 0),
(546, 1, 1, 'mod/forum:replynews', 1, 1390393247, 0),
(547, 1, 5, 'mod/forum:viewrating', 1, 1390393247, 0),
(548, 1, 4, 'mod/forum:viewrating', 1, 1390393247, 0),
(549, 1, 3, 'mod/forum:viewrating', 1, 1390393247, 0),
(550, 1, 1, 'mod/forum:viewrating', 1, 1390393247, 0),
(551, 1, 4, 'mod/forum:viewanyrating', 1, 1390393247, 0),
(552, 1, 3, 'mod/forum:viewanyrating', 1, 1390393247, 0),
(553, 1, 1, 'mod/forum:viewanyrating', 1, 1390393247, 0),
(554, 1, 4, 'mod/forum:viewallratings', 1, 1390393247, 0),
(555, 1, 3, 'mod/forum:viewallratings', 1, 1390393247, 0),
(556, 1, 1, 'mod/forum:viewallratings', 1, 1390393247, 0),
(557, 1, 4, 'mod/forum:rate', 1, 1390393247, 0),
(558, 1, 3, 'mod/forum:rate', 1, 1390393247, 0),
(559, 1, 1, 'mod/forum:rate', 1, 1390393247, 0),
(560, 1, 5, 'mod/forum:createattachment', 1, 1390393247, 0),
(561, 1, 4, 'mod/forum:createattachment', 1, 1390393247, 0),
(562, 1, 3, 'mod/forum:createattachment', 1, 1390393247, 0),
(563, 1, 1, 'mod/forum:createattachment', 1, 1390393247, 0),
(564, 1, 5, 'mod/forum:deleteownpost', 1, 1390393247, 0),
(565, 1, 4, 'mod/forum:deleteownpost', 1, 1390393247, 0),
(566, 1, 3, 'mod/forum:deleteownpost', 1, 1390393247, 0),
(567, 1, 1, 'mod/forum:deleteownpost', 1, 1390393247, 0),
(568, 1, 4, 'mod/forum:deleteanypost', 1, 1390393247, 0),
(569, 1, 3, 'mod/forum:deleteanypost', 1, 1390393247, 0),
(570, 1, 1, 'mod/forum:deleteanypost', 1, 1390393247, 0),
(571, 1, 4, 'mod/forum:splitdiscussions', 1, 1390393247, 0),
(572, 1, 3, 'mod/forum:splitdiscussions', 1, 1390393247, 0),
(573, 1, 1, 'mod/forum:splitdiscussions', 1, 1390393247, 0),
(574, 1, 4, 'mod/forum:movediscussions', 1, 1390393247, 0),
(575, 1, 3, 'mod/forum:movediscussions', 1, 1390393247, 0),
(576, 1, 1, 'mod/forum:movediscussions', 1, 1390393247, 0),
(577, 1, 4, 'mod/forum:editanypost', 1, 1390393247, 0),
(578, 1, 3, 'mod/forum:editanypost', 1, 1390393247, 0),
(579, 1, 1, 'mod/forum:editanypost', 1, 1390393247, 0),
(580, 1, 4, 'mod/forum:viewqandawithoutposting', 1, 1390393247, 0),
(581, 1, 3, 'mod/forum:viewqandawithoutposting', 1, 1390393247, 0),
(582, 1, 1, 'mod/forum:viewqandawithoutposting', 1, 1390393247, 0),
(583, 1, 4, 'mod/forum:viewsubscribers', 1, 1390393247, 0),
(584, 1, 3, 'mod/forum:viewsubscribers', 1, 1390393247, 0),
(585, 1, 1, 'mod/forum:viewsubscribers', 1, 1390393247, 0),
(586, 1, 4, 'mod/forum:managesubscriptions', 1, 1390393247, 0),
(587, 1, 3, 'mod/forum:managesubscriptions', 1, 1390393247, 0),
(588, 1, 1, 'mod/forum:managesubscriptions', 1, 1390393247, 0),
(589, 1, 4, 'mod/forum:postwithoutthrottling', 1, 1390393247, 0),
(590, 1, 3, 'mod/forum:postwithoutthrottling', 1, 1390393247, 0),
(591, 1, 1, 'mod/forum:postwithoutthrottling', 1, 1390393247, 0),
(592, 1, 4, 'mod/forum:exportdiscussion', 1, 1390393247, 0),
(593, 1, 3, 'mod/forum:exportdiscussion', 1, 1390393247, 0),
(594, 1, 1, 'mod/forum:exportdiscussion', 1, 1390393247, 0),
(595, 1, 4, 'mod/forum:exportpost', 1, 1390393247, 0),
(596, 1, 3, 'mod/forum:exportpost', 1, 1390393247, 0),
(597, 1, 1, 'mod/forum:exportpost', 1, 1390393247, 0),
(598, 1, 4, 'mod/forum:exportownpost', 1, 1390393247, 0),
(599, 1, 3, 'mod/forum:exportownpost', 1, 1390393247, 0),
(600, 1, 1, 'mod/forum:exportownpost', 1, 1390393247, 0),
(601, 1, 5, 'mod/forum:exportownpost', 1, 1390393247, 0),
(602, 1, 4, 'mod/forum:addquestion', 1, 1390393247, 0),
(603, 1, 3, 'mod/forum:addquestion', 1, 1390393247, 0),
(604, 1, 1, 'mod/forum:addquestion', 1, 1390393247, 0),
(605, 1, 5, 'mod/forum:allowforcesubscribe', 1, 1390393247, 0),
(606, 1, 4, 'mod/forum:allowforcesubscribe', 1, 1390393247, 0),
(607, 1, 3, 'mod/forum:allowforcesubscribe', 1, 1390393247, 0),
(608, 1, 3, 'mod/glossary:addinstance', 1, 1390393248, 0),
(609, 1, 1, 'mod/glossary:addinstance', 1, 1390393248, 0),
(610, 1, 8, 'mod/glossary:view', 1, 1390393248, 0),
(611, 1, 6, 'mod/glossary:view', 1, 1390393248, 0),
(612, 1, 5, 'mod/glossary:view', 1, 1390393248, 0),
(613, 1, 4, 'mod/glossary:view', 1, 1390393248, 0),
(614, 1, 3, 'mod/glossary:view', 1, 1390393248, 0),
(615, 1, 1, 'mod/glossary:view', 1, 1390393248, 0),
(616, 1, 5, 'mod/glossary:write', 1, 1390393248, 0),
(617, 1, 4, 'mod/glossary:write', 1, 1390393248, 0),
(618, 1, 3, 'mod/glossary:write', 1, 1390393248, 0),
(619, 1, 1, 'mod/glossary:write', 1, 1390393248, 0),
(620, 1, 4, 'mod/glossary:manageentries', 1, 1390393248, 0),
(621, 1, 3, 'mod/glossary:manageentries', 1, 1390393248, 0),
(622, 1, 1, 'mod/glossary:manageentries', 1, 1390393248, 0),
(623, 1, 4, 'mod/glossary:managecategories', 1, 1390393248, 0),
(624, 1, 3, 'mod/glossary:managecategories', 1, 1390393248, 0),
(625, 1, 1, 'mod/glossary:managecategories', 1, 1390393248, 0),
(626, 1, 5, 'mod/glossary:comment', 1, 1390393248, 0),
(627, 1, 4, 'mod/glossary:comment', 1, 1390393248, 0),
(628, 1, 3, 'mod/glossary:comment', 1, 1390393248, 0),
(629, 1, 1, 'mod/glossary:comment', 1, 1390393248, 0),
(630, 1, 4, 'mod/glossary:managecomments', 1, 1390393248, 0),
(631, 1, 3, 'mod/glossary:managecomments', 1, 1390393248, 0),
(632, 1, 1, 'mod/glossary:managecomments', 1, 1390393248, 0),
(633, 1, 4, 'mod/glossary:import', 1, 1390393248, 0),
(634, 1, 3, 'mod/glossary:import', 1, 1390393248, 0),
(635, 1, 1, 'mod/glossary:import', 1, 1390393248, 0),
(636, 1, 4, 'mod/glossary:export', 1, 1390393248, 0),
(637, 1, 3, 'mod/glossary:export', 1, 1390393248, 0),
(638, 1, 1, 'mod/glossary:export', 1, 1390393248, 0),
(639, 1, 4, 'mod/glossary:approve', 1, 1390393248, 0),
(640, 1, 3, 'mod/glossary:approve', 1, 1390393248, 0),
(641, 1, 1, 'mod/glossary:approve', 1, 1390393248, 0),
(642, 1, 4, 'mod/glossary:rate', 1, 1390393248, 0),
(643, 1, 3, 'mod/glossary:rate', 1, 1390393248, 0),
(644, 1, 1, 'mod/glossary:rate', 1, 1390393248, 0),
(645, 1, 4, 'mod/glossary:viewrating', 1, 1390393248, 0),
(646, 1, 3, 'mod/glossary:viewrating', 1, 1390393248, 0),
(647, 1, 1, 'mod/glossary:viewrating', 1, 1390393248, 0),
(648, 1, 4, 'mod/glossary:viewanyrating', 1, 1390393248, 0),
(649, 1, 3, 'mod/glossary:viewanyrating', 1, 1390393248, 0),
(650, 1, 1, 'mod/glossary:viewanyrating', 1, 1390393248, 0),
(651, 1, 4, 'mod/glossary:viewallratings', 1, 1390393248, 0),
(652, 1, 3, 'mod/glossary:viewallratings', 1, 1390393248, 0),
(653, 1, 1, 'mod/glossary:viewallratings', 1, 1390393248, 0),
(654, 1, 4, 'mod/glossary:exportentry', 1, 1390393248, 0),
(655, 1, 3, 'mod/glossary:exportentry', 1, 1390393248, 0),
(656, 1, 1, 'mod/glossary:exportentry', 1, 1390393248, 0),
(657, 1, 4, 'mod/glossary:exportownentry', 1, 1390393248, 0),
(658, 1, 3, 'mod/glossary:exportownentry', 1, 1390393248, 0),
(659, 1, 1, 'mod/glossary:exportownentry', 1, 1390393248, 0),
(660, 1, 5, 'mod/glossary:exportownentry', 1, 1390393248, 0),
(661, 1, 6, 'mod/imscp:view', 1, 1390393249, 0),
(662, 1, 7, 'mod/imscp:view', 1, 1390393249, 0),
(663, 1, 3, 'mod/imscp:addinstance', 1, 1390393249, 0),
(664, 1, 1, 'mod/imscp:addinstance', 1, 1390393249, 0),
(665, 1, 3, 'mod/label:addinstance', 1, 1390393249, 0),
(666, 1, 1, 'mod/label:addinstance', 1, 1390393249, 0),
(667, 1, 3, 'mod/lesson:addinstance', 1, 1390393250, 0),
(668, 1, 1, 'mod/lesson:addinstance', 1, 1390393250, 0),
(669, 1, 3, 'mod/lesson:edit', 1, 1390393250, 0),
(670, 1, 1, 'mod/lesson:edit', 1, 1390393250, 0),
(671, 1, 4, 'mod/lesson:manage', 1, 1390393250, 0),
(672, 1, 3, 'mod/lesson:manage', 1, 1390393250, 0),
(673, 1, 1, 'mod/lesson:manage', 1, 1390393250, 0),
(674, 1, 6, 'mod/lti:view', 1, 1390393251, 0),
(675, 1, 5, 'mod/lti:view', 1, 1390393251, 0),
(676, 1, 4, 'mod/lti:view', 1, 1390393251, 0),
(677, 1, 3, 'mod/lti:view', 1, 1390393251, 0),
(678, 1, 1, 'mod/lti:view', 1, 1390393251, 0),
(679, 1, 3, 'mod/lti:addinstance', 1, 1390393251, 0),
(680, 1, 1, 'mod/lti:addinstance', 1, 1390393251, 0),
(681, 1, 4, 'mod/lti:grade', 1, 1390393251, 0),
(682, 1, 3, 'mod/lti:grade', 1, 1390393251, 0),
(683, 1, 1, 'mod/lti:grade', 1, 1390393251, 0),
(684, 1, 4, 'mod/lti:manage', 1, 1390393251, 0),
(685, 1, 3, 'mod/lti:manage', 1, 1390393251, 0),
(686, 1, 1, 'mod/lti:manage', 1, 1390393251, 0),
(687, 1, 4, 'mod/lti:addcoursetool', 1, 1390393251, 0),
(688, 1, 3, 'mod/lti:addcoursetool', 1, 1390393251, 0),
(689, 1, 1, 'mod/lti:addcoursetool', 1, 1390393251, 0),
(690, 1, 4, 'mod/lti:requesttooladd', 1, 1390393251, 0),
(691, 1, 3, 'mod/lti:requesttooladd', 1, 1390393251, 0),
(692, 1, 1, 'mod/lti:requesttooladd', 1, 1390393251, 0),
(693, 1, 6, 'mod/page:view', 1, 1390393252, 0),
(694, 1, 7, 'mod/page:view', 1, 1390393252, 0),
(695, 1, 3, 'mod/page:addinstance', 1, 1390393252, 0),
(696, 1, 1, 'mod/page:addinstance', 1, 1390393252, 0),
(697, 1, 6, 'mod/quiz:view', 1, 1390393253, 0),
(698, 1, 5, 'mod/quiz:view', 1, 1390393253, 0),
(699, 1, 4, 'mod/quiz:view', 1, 1390393253, 0),
(700, 1, 3, 'mod/quiz:view', 1, 1390393253, 0),
(701, 1, 1, 'mod/quiz:view', 1, 1390393253, 0),
(702, 1, 3, 'mod/quiz:addinstance', 1, 1390393253, 0),
(703, 1, 1, 'mod/quiz:addinstance', 1, 1390393253, 0),
(704, 1, 5, 'mod/quiz:attempt', 1, 1390393253, 0),
(705, 1, 5, 'mod/quiz:reviewmyattempts', 1, 1390393253, 0),
(706, 1, 3, 'mod/quiz:manage', 1, 1390393253, 0),
(707, 1, 1, 'mod/quiz:manage', 1, 1390393253, 0),
(708, 1, 3, 'mod/quiz:manageoverrides', 1, 1390393253, 0),
(709, 1, 1, 'mod/quiz:manageoverrides', 1, 1390393253, 0),
(710, 1, 4, 'mod/quiz:preview', 1, 1390393253, 0),
(711, 1, 3, 'mod/quiz:preview', 1, 1390393253, 0),
(712, 1, 1, 'mod/quiz:preview', 1, 1390393253, 0),
(713, 1, 4, 'mod/quiz:grade', 1, 1390393253, 0),
(714, 1, 3, 'mod/quiz:grade', 1, 1390393253, 0),
(715, 1, 1, 'mod/quiz:grade', 1, 1390393253, 0),
(716, 1, 4, 'mod/quiz:regrade', 1, 1390393253, 0),
(717, 1, 3, 'mod/quiz:regrade', 1, 1390393253, 0),
(718, 1, 1, 'mod/quiz:regrade', 1, 1390393253, 0),
(719, 1, 4, 'mod/quiz:viewreports', 1, 1390393253, 0),
(720, 1, 3, 'mod/quiz:viewreports', 1, 1390393253, 0),
(721, 1, 1, 'mod/quiz:viewreports', 1, 1390393253, 0),
(722, 1, 3, 'mod/quiz:deleteattempts', 1, 1390393253, 0),
(723, 1, 1, 'mod/quiz:deleteattempts', 1, 1390393253, 0),
(724, 1, 6, 'mod/resource:view', 1, 1390393254, 0),
(725, 1, 7, 'mod/resource:view', 1, 1390393254, 0),
(726, 1, 3, 'mod/resource:addinstance', 1, 1390393254, 0),
(727, 1, 1, 'mod/resource:addinstance', 1, 1390393254, 0),
(728, 1, 3, 'mod/scorm:addinstance', 1, 1390393257, 0),
(729, 1, 1, 'mod/scorm:addinstance', 1, 1390393257, 0),
(730, 1, 4, 'mod/scorm:viewreport', 1, 1390393257, 0),
(731, 1, 3, 'mod/scorm:viewreport', 1, 1390393257, 0),
(732, 1, 1, 'mod/scorm:viewreport', 1, 1390393257, 0),
(733, 1, 5, 'mod/scorm:skipview', 1, 1390393257, 0),
(734, 1, 5, 'mod/scorm:savetrack', 1, 1390393257, 0),
(735, 1, 4, 'mod/scorm:savetrack', 1, 1390393257, 0),
(736, 1, 3, 'mod/scorm:savetrack', 1, 1390393257, 0),
(737, 1, 1, 'mod/scorm:savetrack', 1, 1390393257, 0),
(738, 1, 5, 'mod/scorm:viewscores', 1, 1390393257, 0),
(739, 1, 4, 'mod/scorm:viewscores', 1, 1390393257, 0),
(740, 1, 3, 'mod/scorm:viewscores', 1, 1390393257, 0),
(741, 1, 1, 'mod/scorm:viewscores', 1, 1390393257, 0),
(742, 1, 4, 'mod/scorm:deleteresponses', 1, 1390393257, 0),
(743, 1, 3, 'mod/scorm:deleteresponses', 1, 1390393257, 0),
(744, 1, 1, 'mod/scorm:deleteresponses', 1, 1390393257, 0),
(745, 1, 3, 'mod/survey:addinstance', 1, 1390393258, 0),
(746, 1, 1, 'mod/survey:addinstance', 1, 1390393258, 0),
(747, 1, 5, 'mod/survey:participate', 1, 1390393258, 0),
(748, 1, 4, 'mod/survey:participate', 1, 1390393258, 0),
(749, 1, 3, 'mod/survey:participate', 1, 1390393258, 0),
(750, 1, 1, 'mod/survey:participate', 1, 1390393258, 0),
(751, 1, 4, 'mod/survey:readresponses', 1, 1390393258, 0),
(752, 1, 3, 'mod/survey:readresponses', 1, 1390393258, 0),
(753, 1, 1, 'mod/survey:readresponses', 1, 1390393258, 0),
(754, 1, 4, 'mod/survey:download', 1, 1390393258, 0),
(755, 1, 3, 'mod/survey:download', 1, 1390393258, 0),
(756, 1, 1, 'mod/survey:download', 1, 1390393258, 0),
(757, 1, 6, 'mod/url:view', 1, 1390393259, 0),
(758, 1, 7, 'mod/url:view', 1, 1390393259, 0),
(759, 1, 3, 'mod/url:addinstance', 1, 1390393259, 0),
(760, 1, 1, 'mod/url:addinstance', 1, 1390393259, 0),
(761, 1, 3, 'mod/wiki:addinstance', 1, 1390393260, 0),
(762, 1, 1, 'mod/wiki:addinstance', 1, 1390393260, 0),
(763, 1, 6, 'mod/wiki:viewpage', 1, 1390393260, 0),
(764, 1, 5, 'mod/wiki:viewpage', 1, 1390393260, 0),
(765, 1, 4, 'mod/wiki:viewpage', 1, 1390393260, 0),
(766, 1, 3, 'mod/wiki:viewpage', 1, 1390393260, 0),
(767, 1, 1, 'mod/wiki:viewpage', 1, 1390393260, 0),
(768, 1, 5, 'mod/wiki:editpage', 1, 1390393260, 0),
(769, 1, 4, 'mod/wiki:editpage', 1, 1390393260, 0),
(770, 1, 3, 'mod/wiki:editpage', 1, 1390393260, 0),
(771, 1, 1, 'mod/wiki:editpage', 1, 1390393260, 0),
(772, 1, 5, 'mod/wiki:createpage', 1, 1390393260, 0),
(773, 1, 4, 'mod/wiki:createpage', 1, 1390393260, 0),
(774, 1, 3, 'mod/wiki:createpage', 1, 1390393260, 0),
(775, 1, 1, 'mod/wiki:createpage', 1, 1390393260, 0),
(776, 1, 5, 'mod/wiki:viewcomment', 1, 1390393260, 0),
(777, 1, 4, 'mod/wiki:viewcomment', 1, 1390393260, 0),
(778, 1, 3, 'mod/wiki:viewcomment', 1, 1390393260, 0),
(779, 1, 1, 'mod/wiki:viewcomment', 1, 1390393260, 0),
(780, 1, 5, 'mod/wiki:editcomment', 1, 1390393260, 0),
(781, 1, 4, 'mod/wiki:editcomment', 1, 1390393260, 0),
(782, 1, 3, 'mod/wiki:editcomment', 1, 1390393260, 0),
(783, 1, 1, 'mod/wiki:editcomment', 1, 1390393260, 0),
(784, 1, 4, 'mod/wiki:managecomment', 1, 1390393260, 0),
(785, 1, 3, 'mod/wiki:managecomment', 1, 1390393260, 0),
(786, 1, 1, 'mod/wiki:managecomment', 1, 1390393260, 0),
(787, 1, 4, 'mod/wiki:managefiles', 1, 1390393260, 0),
(788, 1, 3, 'mod/wiki:managefiles', 1, 1390393260, 0),
(789, 1, 1, 'mod/wiki:managefiles', 1, 1390393260, 0),
(790, 1, 4, 'mod/wiki:overridelock', 1, 1390393260, 0),
(791, 1, 3, 'mod/wiki:overridelock', 1, 1390393260, 0),
(792, 1, 1, 'mod/wiki:overridelock', 1, 1390393260, 0),
(793, 1, 4, 'mod/wiki:managewiki', 1, 1390393260, 0),
(794, 1, 3, 'mod/wiki:managewiki', 1, 1390393260, 0),
(795, 1, 1, 'mod/wiki:managewiki', 1, 1390393260, 0),
(796, 1, 6, 'mod/workshop:view', 1, 1390393263, 0),
(797, 1, 5, 'mod/workshop:view', 1, 1390393263, 0),
(798, 1, 4, 'mod/workshop:view', 1, 1390393263, 0),
(799, 1, 3, 'mod/workshop:view', 1, 1390393263, 0),
(800, 1, 1, 'mod/workshop:view', 1, 1390393263, 0),
(801, 1, 3, 'mod/workshop:addinstance', 1, 1390393263, 0),
(802, 1, 1, 'mod/workshop:addinstance', 1, 1390393263, 0),
(803, 1, 4, 'mod/workshop:switchphase', 1, 1390393263, 0),
(804, 1, 3, 'mod/workshop:switchphase', 1, 1390393263, 0),
(805, 1, 1, 'mod/workshop:switchphase', 1, 1390393263, 0),
(806, 1, 3, 'mod/workshop:editdimensions', 1, 1390393263, 0),
(807, 1, 1, 'mod/workshop:editdimensions', 1, 1390393263, 0),
(808, 1, 5, 'mod/workshop:submit', 1, 1390393263, 0),
(809, 1, 5, 'mod/workshop:peerassess', 1, 1390393263, 0),
(810, 1, 4, 'mod/workshop:manageexamples', 1, 1390393263, 0),
(811, 1, 3, 'mod/workshop:manageexamples', 1, 1390393263, 0),
(812, 1, 1, 'mod/workshop:manageexamples', 1, 1390393263, 0),
(813, 1, 4, 'mod/workshop:allocate', 1, 1390393263, 0),
(814, 1, 3, 'mod/workshop:allocate', 1, 1390393263, 0),
(815, 1, 1, 'mod/workshop:allocate', 1, 1390393263, 0),
(816, 1, 4, 'mod/workshop:publishsubmissions', 1, 1390393263, 0),
(817, 1, 3, 'mod/workshop:publishsubmissions', 1, 1390393263, 0),
(818, 1, 1, 'mod/workshop:publishsubmissions', 1, 1390393263, 0),
(819, 1, 5, 'mod/workshop:viewauthornames', 1, 1390393263, 0),
(820, 1, 4, 'mod/workshop:viewauthornames', 1, 1390393263, 0),
(821, 1, 3, 'mod/workshop:viewauthornames', 1, 1390393263, 0),
(822, 1, 1, 'mod/workshop:viewauthornames', 1, 1390393264, 0),
(823, 1, 4, 'mod/workshop:viewreviewernames', 1, 1390393264, 0),
(824, 1, 3, 'mod/workshop:viewreviewernames', 1, 1390393264, 0),
(825, 1, 1, 'mod/workshop:viewreviewernames', 1, 1390393264, 0),
(826, 1, 4, 'mod/workshop:viewallsubmissions', 1, 1390393264, 0),
(827, 1, 3, 'mod/workshop:viewallsubmissions', 1, 1390393264, 0),
(828, 1, 1, 'mod/workshop:viewallsubmissions', 1, 1390393264, 0),
(829, 1, 5, 'mod/workshop:viewpublishedsubmissions', 1, 1390393264, 0),
(830, 1, 4, 'mod/workshop:viewpublishedsubmissions', 1, 1390393264, 0),
(831, 1, 3, 'mod/workshop:viewpublishedsubmissions', 1, 1390393264, 0),
(832, 1, 1, 'mod/workshop:viewpublishedsubmissions', 1, 1390393264, 0),
(833, 1, 5, 'mod/workshop:viewauthorpublished', 1, 1390393264, 0),
(834, 1, 4, 'mod/workshop:viewauthorpublished', 1, 1390393264, 0),
(835, 1, 3, 'mod/workshop:viewauthorpublished', 1, 1390393264, 0),
(836, 1, 1, 'mod/workshop:viewauthorpublished', 1, 1390393264, 0),
(837, 1, 4, 'mod/workshop:viewallassessments', 1, 1390393264, 0),
(838, 1, 3, 'mod/workshop:viewallassessments', 1, 1390393264, 0),
(839, 1, 1, 'mod/workshop:viewallassessments', 1, 1390393264, 0),
(840, 1, 4, 'mod/workshop:overridegrades', 1, 1390393264, 0),
(841, 1, 3, 'mod/workshop:overridegrades', 1, 1390393264, 0),
(842, 1, 1, 'mod/workshop:overridegrades', 1, 1390393264, 0),
(843, 1, 4, 'mod/workshop:ignoredeadlines', 1, 1390393264, 0),
(844, 1, 3, 'mod/workshop:ignoredeadlines', 1, 1390393264, 0),
(845, 1, 1, 'mod/workshop:ignoredeadlines', 1, 1390393264, 0),
(852, 1, 3, 'enrol/cohort:config', 1, 1390393266, 0),
(853, 1, 1, 'enrol/cohort:config', 1, 1390393266, 0),
(854, 1, 1, 'enrol/cohort:unenrol', 1, 1390393266, 0),
(855, 1, 1, 'enrol/database:unenrol', 1, 1390393266, 0),
(856, 1, 1, 'enrol/guest:config', 1, 1390393266, 0),
(857, 1, 3, 'enrol/guest:config', 1, 1390393266, 0),
(858, 1, 1, 'enrol/ldap:manage', 1, 1390393266, 0),
(859, 1, 1, 'enrol/manual:config', 1, 1390393267, 0),
(860, 1, 1, 'enrol/manual:enrol', 1, 1390393267, 0),
(861, 1, 3, 'enrol/manual:enrol', 1, 1390393267, 0),
(862, 1, 1, 'enrol/manual:manage', 1, 1390393267, 0),
(863, 1, 3, 'enrol/manual:manage', 1, 1390393267, 0),
(864, 1, 1, 'enrol/manual:unenrol', 1, 1390393267, 0),
(865, 1, 3, 'enrol/manual:unenrol', 1, 1390393267, 0),
(866, 1, 1, 'enrol/meta:config', 1, 1390393267, 0),
(867, 1, 3, 'enrol/meta:config', 1, 1390393267, 0),
(868, 1, 1, 'enrol/meta:selectaslinked', 1, 1390393267, 0),
(869, 1, 1, 'enrol/meta:unenrol', 1, 1390393267, 0),
(870, 1, 1, 'enrol/paypal:config', 1, 1390393267, 0),
(871, 1, 1, 'enrol/paypal:manage', 1, 1390393267, 0),
(872, 1, 3, 'enrol/paypal:manage', 1, 1390393267, 0),
(873, 1, 1, 'enrol/paypal:unenrol', 1, 1390393267, 0),
(874, 1, 3, 'enrol/self:config', 1, 1390393267, 0),
(875, 1, 1, 'enrol/self:config', 1, 1390393267, 0),
(876, 1, 3, 'enrol/self:manage', 1, 1390393267, 0),
(877, 1, 1, 'enrol/self:manage', 1, 1390393267, 0),
(878, 1, 5, 'enrol/self:unenrolself', 1, 1390393267, 0),
(879, 1, 3, 'enrol/self:unenrol', 1, 1390393267, 0),
(880, 1, 1, 'enrol/self:unenrol', 1, 1390393267, 0),
(881, 1, 7, 'block/online_users:viewlist', 1, 1390393269, 0),
(882, 1, 6, 'block/online_users:viewlist', 1, 1390393269, 0),
(883, 1, 5, 'block/online_users:viewlist', 1, 1390393269, 0),
(884, 1, 4, 'block/online_users:viewlist', 1, 1390393269, 0),
(885, 1, 3, 'block/online_users:viewlist', 1, 1390393269, 0),
(886, 1, 1, 'block/online_users:viewlist', 1, 1390393269, 0),
(887, 1, 4, 'block/rss_client:manageownfeeds', 1, 1390393269, 0),
(888, 1, 3, 'block/rss_client:manageownfeeds', 1, 1390393269, 0),
(889, 1, 1, 'block/rss_client:manageownfeeds', 1, 1390393269, 0),
(890, 1, 1, 'block/rss_client:manageanyfeeds', 1, 1390393269, 0),
(891, 1, 4, 'report/completion:view', 1, 1390393271, 0),
(892, 1, 3, 'report/completion:view', 1, 1390393271, 0),
(893, 1, 1, 'report/completion:view', 1, 1390393271, 0),
(894, 1, 4, 'report/courseoverview:view', 1, 1390393271, 0),
(895, 1, 3, 'report/courseoverview:view', 1, 1390393271, 0),
(896, 1, 1, 'report/courseoverview:view', 1, 1390393271, 0),
(897, 1, 4, 'report/log:view', 1, 1390393271, 0),
(898, 1, 3, 'report/log:view', 1, 1390393271, 0),
(899, 1, 1, 'report/log:view', 1, 1390393271, 0),
(900, 1, 4, 'report/log:viewtoday', 1, 1390393271, 0),
(901, 1, 3, 'report/log:viewtoday', 1, 1390393271, 0),
(902, 1, 1, 'report/log:viewtoday', 1, 1390393271, 0),
(903, 1, 4, 'report/loglive:view', 1, 1390393271, 0),
(904, 1, 3, 'report/loglive:view', 1, 1390393271, 0),
(905, 1, 1, 'report/loglive:view', 1, 1390393271, 0);
INSERT INTO `mdl_role_capabilities` (`id`, `contextid`, `roleid`, `capability`, `permission`, `timemodified`, `modifierid`) VALUES
(906, 1, 4, 'report/outline:view', 1, 1390393271, 0),
(907, 1, 3, 'report/outline:view', 1, 1390393271, 0),
(908, 1, 1, 'report/outline:view', 1, 1390393271, 0),
(909, 1, 4, 'report/participation:view', 1, 1390393271, 0),
(910, 1, 3, 'report/participation:view', 1, 1390393271, 0),
(911, 1, 1, 'report/participation:view', 1, 1390393271, 0),
(912, 1, 4, 'report/progress:view', 1, 1390393271, 0),
(913, 1, 3, 'report/progress:view', 1, 1390393271, 0),
(914, 1, 1, 'report/progress:view', 1, 1390393271, 0),
(915, 1, 1, 'report/security:view', 1, 1390393271, 0),
(916, 1, 4, 'report/stats:view', 1, 1390393272, 0),
(917, 1, 3, 'report/stats:view', 1, 1390393272, 0),
(918, 1, 1, 'report/stats:view', 1, 1390393272, 0),
(919, 1, 4, 'gradeexport/ods:view', 1, 1390393272, 0),
(920, 1, 3, 'gradeexport/ods:view', 1, 1390393272, 0),
(921, 1, 1, 'gradeexport/ods:view', 1, 1390393272, 0),
(922, 1, 1, 'gradeexport/ods:publish', 1, 1390393272, 0),
(923, 1, 4, 'gradeexport/txt:view', 1, 1390393272, 0),
(924, 1, 3, 'gradeexport/txt:view', 1, 1390393272, 0),
(925, 1, 1, 'gradeexport/txt:view', 1, 1390393272, 0),
(926, 1, 1, 'gradeexport/txt:publish', 1, 1390393272, 0),
(927, 1, 4, 'gradeexport/xls:view', 1, 1390393272, 0),
(928, 1, 3, 'gradeexport/xls:view', 1, 1390393272, 0),
(929, 1, 1, 'gradeexport/xls:view', 1, 1390393272, 0),
(930, 1, 1, 'gradeexport/xls:publish', 1, 1390393272, 0),
(931, 1, 4, 'gradeexport/xml:view', 1, 1390393272, 0),
(932, 1, 3, 'gradeexport/xml:view', 1, 1390393272, 0),
(933, 1, 1, 'gradeexport/xml:view', 1, 1390393272, 0),
(934, 1, 1, 'gradeexport/xml:publish', 1, 1390393272, 0),
(935, 1, 3, 'gradeimport/csv:view', 1, 1390393272, 0),
(936, 1, 1, 'gradeimport/csv:view', 1, 1390393272, 0),
(937, 1, 3, 'gradeimport/xml:view', 1, 1390393272, 0),
(938, 1, 1, 'gradeimport/xml:view', 1, 1390393272, 0),
(939, 1, 1, 'gradeimport/xml:publish', 1, 1390393272, 0),
(940, 1, 4, 'gradereport/grader:view', 1, 1390393272, 0),
(941, 1, 3, 'gradereport/grader:view', 1, 1390393272, 0),
(942, 1, 1, 'gradereport/grader:view', 1, 1390393272, 0),
(943, 1, 4, 'gradereport/outcomes:view', 1, 1390393272, 0),
(944, 1, 3, 'gradereport/outcomes:view', 1, 1390393272, 0),
(945, 1, 1, 'gradereport/outcomes:view', 1, 1390393272, 0),
(946, 1, 5, 'gradereport/overview:view', 1, 1390393272, 0),
(947, 1, 1, 'gradereport/overview:view', 1, 1390393272, 0),
(948, 1, 5, 'gradereport/user:view', 1, 1390393272, 0),
(949, 1, 4, 'gradereport/user:view', 1, 1390393272, 0),
(950, 1, 3, 'gradereport/user:view', 1, 1390393272, 0),
(951, 1, 1, 'gradereport/user:view', 1, 1390393272, 0),
(952, 1, 7, 'repository/alfresco:view', 1, 1390393275, 0),
(953, 1, 7, 'repository/boxnet:view', 1, 1390393275, 0),
(954, 1, 2, 'repository/coursefiles:view', 1, 1390393275, 0),
(955, 1, 4, 'repository/coursefiles:view', 1, 1390393275, 0),
(956, 1, 3, 'repository/coursefiles:view', 1, 1390393275, 0),
(957, 1, 1, 'repository/coursefiles:view', 1, 1390393275, 0),
(958, 1, 7, 'repository/dropbox:view', 1, 1390393275, 0),
(959, 1, 7, 'repository/equella:view', 1, 1390393275, 0),
(960, 1, 2, 'repository/filesystem:view', 1, 1390393275, 0),
(961, 1, 4, 'repository/filesystem:view', 1, 1390393275, 0),
(962, 1, 3, 'repository/filesystem:view', 1, 1390393275, 0),
(963, 1, 1, 'repository/filesystem:view', 1, 1390393275, 0),
(964, 1, 7, 'repository/flickr:view', 1, 1390393275, 0),
(965, 1, 7, 'repository/flickr_public:view', 1, 1390393275, 0),
(966, 1, 7, 'repository/googledocs:view', 1, 1390393275, 0),
(967, 1, 2, 'repository/local:view', 1, 1390393275, 0),
(968, 1, 4, 'repository/local:view', 1, 1390393275, 0),
(969, 1, 3, 'repository/local:view', 1, 1390393275, 0),
(970, 1, 1, 'repository/local:view', 1, 1390393275, 0),
(971, 1, 7, 'repository/merlot:view', 1, 1390393275, 0),
(972, 1, 7, 'repository/picasa:view', 1, 1390393276, 0),
(973, 1, 7, 'repository/recent:view', 1, 1390393276, 0),
(974, 1, 7, 'repository/s3:view', 1, 1390393276, 0),
(975, 1, 7, 'repository/upload:view', 1, 1390393276, 0),
(976, 1, 7, 'repository/url:view', 1, 1390393276, 0),
(977, 1, 7, 'repository/user:view', 1, 1390393276, 0),
(978, 1, 2, 'repository/webdav:view', 1, 1390393276, 0),
(979, 1, 4, 'repository/webdav:view', 1, 1390393276, 0),
(980, 1, 3, 'repository/webdav:view', 1, 1390393276, 0),
(981, 1, 1, 'repository/webdav:view', 1, 1390393276, 0),
(982, 1, 7, 'repository/wikimedia:view', 1, 1390393276, 0),
(983, 1, 7, 'repository/youtube:view', 1, 1390393276, 0),
(984, 1, 1, 'tool/customlang:view', 1, 1390393278, 0),
(985, 1, 1, 'tool/customlang:edit', 1, 1390393278, 0),
(986, 1, 3, 'booktool/importhtml:import', 1, 1390393282, 0),
(987, 1, 1, 'booktool/importhtml:import', 1, 1390393282, 0),
(988, 1, 6, 'booktool/print:print', 1, 1390393282, 0),
(989, 1, 8, 'booktool/print:print', 1, 1390393282, 0),
(990, 1, 5, 'booktool/print:print', 1, 1390393282, 0),
(991, 1, 4, 'booktool/print:print', 1, 1390393282, 0),
(992, 1, 3, 'booktool/print:print', 1, 1390393282, 0),
(993, 1, 1, 'booktool/print:print', 1, 1390393282, 0),
(994, 1, 4, 'quiz/grading:viewstudentnames', 1, 1390393282, 0),
(995, 1, 3, 'quiz/grading:viewstudentnames', 1, 1390393282, 0),
(996, 1, 1, 'quiz/grading:viewstudentnames', 1, 1390393282, 0),
(997, 1, 4, 'quiz/grading:viewidnumber', 1, 1390393282, 0),
(998, 1, 3, 'quiz/grading:viewidnumber', 1, 1390393282, 0),
(999, 1, 1, 'quiz/grading:viewidnumber', 1, 1390393282, 0),
(1000, 1, 4, 'quiz/statistics:view', 1, 1390393283, 0),
(1001, 1, 3, 'quiz/statistics:view', 1, 1390393283, 0),
(1002, 1, 1, 'quiz/statistics:view', 1, 1390393283, 0),
(1003, 1, 3, 'mod/repeatcourse:addinstance', 1, 1390831700, 2),
(1004, 1, 1, 'mod/repeatcourse:addinstance', 1, 1390831700, 2),
(1005, 1, 5, 'moodle/course:isincompletionreports', 1, 1390919383, 2),
(1006, 1, 3, 'moodle/course:viewsuspendedusers', 1, 1390919383, 2),
(1007, 1, 1, 'moodle/course:viewsuspendedusers', 1, 1390919383, 2),
(1008, 1, 3, 'moodle/course:movesections', 1, 1390919383, 2),
(1009, 1, 1, 'moodle/course:movesections', 1, 1390919383, 2),
(1010, 1, 1, 'moodle/tag:flag', 1, 1390919383, 2),
(1011, 1, 7, 'moodle/tag:flag', 1, 1390919383, 2),
(1012, 1, 1, 'moodle/badges:manageglobalsettings', 1, 1390919383, 2),
(1013, 1, 7, 'moodle/badges:viewbadges', 1, 1390919383, 2),
(1014, 1, 7, 'moodle/badges:manageownbadges', 1, 1390919383, 2),
(1015, 1, 7, 'moodle/badges:viewotherbadges', 1, 1390919383, 2),
(1016, 1, 7, 'moodle/badges:earnbadge', 1, 1390919383, 2),
(1017, 1, 1, 'moodle/badges:createbadge', 1, 1390919383, 2),
(1018, 1, 3, 'moodle/badges:createbadge', 1, 1390919383, 2),
(1019, 1, 1, 'moodle/badges:deletebadge', 1, 1390919383, 2),
(1020, 1, 3, 'moodle/badges:deletebadge', 1, 1390919384, 2),
(1021, 1, 1, 'moodle/badges:configuredetails', 1, 1390919384, 2),
(1022, 1, 3, 'moodle/badges:configuredetails', 1, 1390919384, 2),
(1023, 1, 1, 'moodle/badges:configurecriteria', 1, 1390919384, 2),
(1024, 1, 3, 'moodle/badges:configurecriteria', 1, 1390919384, 2),
(1025, 1, 1, 'moodle/badges:configuremessages', 1, 1390919384, 2),
(1026, 1, 3, 'moodle/badges:configuremessages', 1, 1390919384, 2),
(1027, 1, 1, 'moodle/badges:awardbadge', 1, 1390919384, 2),
(1028, 1, 4, 'moodle/badges:awardbadge', 1, 1390919384, 2),
(1029, 1, 3, 'moodle/badges:awardbadge', 1, 1390919384, 2),
(1030, 1, 1, 'moodle/badges:viewawarded', 1, 1390919384, 2),
(1031, 1, 4, 'moodle/badges:viewawarded', 1, 1390919384, 2),
(1032, 1, 3, 'moodle/badges:viewawarded', 1, 1390919384, 2),
(1033, 1, 4, 'mod/assign:grantextension', 1, 1390919395, 2),
(1034, 1, 3, 'mod/assign:grantextension', 1, 1390919395, 2),
(1035, 1, 1, 'mod/assign:grantextension', 1, 1390919395, 2),
(1036, 1, 3, 'mod/assign:revealidentities', 1, 1390919395, 2),
(1037, 1, 1, 'mod/assign:revealidentities', 1, 1390919395, 2),
(1038, 1, 1, 'mod/data:exportuserinfo', 1, 1390919396, 2),
(1039, 1, 4, 'mod/data:exportuserinfo', 1, 1390919396, 2),
(1040, 1, 3, 'mod/data:exportuserinfo', 1, 1390919396, 2),
(1041, 1, 8, 'mod/forum:allowforcesubscribe', 1, 1390919397, 2),
(1042, 1, 3, 'block/activity_modules:addinstance', 1, 1390919411, 2),
(1043, 1, 1, 'block/activity_modules:addinstance', 1, 1390919411, 2),
(1044, 1, 7, 'block/admin_bookmarks:myaddinstance', 1, 1390919411, 2),
(1045, 1, 3, 'block/admin_bookmarks:addinstance', 1, 1390919411, 2),
(1046, 1, 1, 'block/admin_bookmarks:addinstance', 1, 1390919411, 2),
(1047, 1, 3, 'block/badges:addinstance', 1, 1390919411, 2),
(1048, 1, 1, 'block/badges:addinstance', 1, 1390919411, 2),
(1049, 1, 7, 'block/badges:myaddinstance', 1, 1390919411, 2),
(1050, 1, 3, 'block/blog_menu:addinstance', 1, 1390919412, 2),
(1051, 1, 1, 'block/blog_menu:addinstance', 1, 1390919412, 2),
(1052, 1, 3, 'block/blog_recent:addinstance', 1, 1390919412, 2),
(1053, 1, 1, 'block/blog_recent:addinstance', 1, 1390919412, 2),
(1054, 1, 3, 'block/blog_tags:addinstance', 1, 1390919412, 2),
(1055, 1, 1, 'block/blog_tags:addinstance', 1, 1390919412, 2),
(1056, 1, 7, 'block/calendar_month:myaddinstance', 1, 1390919412, 2),
(1057, 1, 3, 'block/calendar_month:addinstance', 1, 1390919412, 2),
(1058, 1, 1, 'block/calendar_month:addinstance', 1, 1390919412, 2),
(1059, 1, 7, 'block/calendar_upcoming:myaddinstance', 1, 1390919413, 2),
(1060, 1, 3, 'block/calendar_upcoming:addinstance', 1, 1390919413, 2),
(1061, 1, 1, 'block/calendar_upcoming:addinstance', 1, 1390919413, 2),
(1062, 1, 7, 'block/comments:myaddinstance', 1, 1390919413, 2),
(1063, 1, 3, 'block/comments:addinstance', 1, 1390919413, 2),
(1064, 1, 1, 'block/comments:addinstance', 1, 1390919413, 2),
(1065, 1, 7, 'block/community:myaddinstance', 1, 1390919413, 2),
(1066, 1, 3, 'block/community:addinstance', 1, 1390919413, 2),
(1067, 1, 1, 'block/community:addinstance', 1, 1390919413, 2),
(1068, 1, 3, 'block/completionstatus:addinstance', 1, 1390919413, 2),
(1069, 1, 1, 'block/completionstatus:addinstance', 1, 1390919413, 2),
(1070, 1, 7, 'block/course_list:myaddinstance', 1, 1390919414, 2),
(1071, 1, 3, 'block/course_list:addinstance', 1, 1390919414, 2),
(1072, 1, 1, 'block/course_list:addinstance', 1, 1390919414, 2),
(1073, 1, 7, 'block/course_overview:myaddinstance', 1, 1390919414, 2),
(1074, 1, 3, 'block/course_overview:addinstance', 1, 1390919414, 2),
(1075, 1, 1, 'block/course_overview:addinstance', 1, 1390919414, 2),
(1076, 1, 3, 'block/course_summary:addinstance', 1, 1390919414, 2),
(1077, 1, 1, 'block/course_summary:addinstance', 1, 1390919414, 2),
(1078, 1, 3, 'block/feedback:addinstance', 1, 1390919414, 2),
(1079, 1, 1, 'block/feedback:addinstance', 1, 1390919414, 2),
(1080, 1, 7, 'block/glossary_random:myaddinstance', 1, 1390919414, 2),
(1081, 1, 3, 'block/glossary_random:addinstance', 1, 1390919414, 2),
(1082, 1, 1, 'block/glossary_random:addinstance', 1, 1390919414, 2),
(1083, 1, 7, 'block/html:myaddinstance', 1, 1390919415, 2),
(1084, 1, 3, 'block/html:addinstance', 1, 1390919415, 2),
(1085, 1, 1, 'block/html:addinstance', 1, 1390919415, 2),
(1086, 1, 3, 'block/login:addinstance', 1, 1390919415, 2),
(1087, 1, 1, 'block/login:addinstance', 1, 1390919415, 2),
(1088, 1, 7, 'block/mentees:myaddinstance', 1, 1390919415, 2),
(1089, 1, 3, 'block/mentees:addinstance', 1, 1390919415, 2),
(1090, 1, 1, 'block/mentees:addinstance', 1, 1390919415, 2),
(1091, 1, 7, 'block/messages:myaddinstance', 1, 1390919415, 2),
(1092, 1, 3, 'block/messages:addinstance', 1, 1390919415, 2),
(1093, 1, 1, 'block/messages:addinstance', 1, 1390919415, 2),
(1094, 1, 7, 'block/mnet_hosts:myaddinstance', 1, 1390919416, 2),
(1095, 1, 3, 'block/mnet_hosts:addinstance', 1, 1390919416, 2),
(1096, 1, 1, 'block/mnet_hosts:addinstance', 1, 1390919416, 2),
(1097, 1, 7, 'block/myprofile:myaddinstance', 1, 1390919416, 2),
(1098, 1, 3, 'block/myprofile:addinstance', 1, 1390919416, 2),
(1099, 1, 1, 'block/myprofile:addinstance', 1, 1390919416, 2),
(1100, 1, 7, 'block/navigation:myaddinstance', 1, 1390919416, 2),
(1101, 1, 3, 'block/navigation:addinstance', 1, 1390919416, 2),
(1102, 1, 1, 'block/navigation:addinstance', 1, 1390919416, 2),
(1103, 1, 7, 'block/news_items:myaddinstance', 1, 1390919416, 2),
(1104, 1, 3, 'block/news_items:addinstance', 1, 1390919416, 2),
(1105, 1, 1, 'block/news_items:addinstance', 1, 1390919416, 2),
(1106, 1, 7, 'block/online_users:myaddinstance', 1, 1390919417, 2),
(1107, 1, 3, 'block/online_users:addinstance', 1, 1390919417, 2),
(1108, 1, 1, 'block/online_users:addinstance', 1, 1390919417, 2),
(1109, 1, 3, 'block/participants:addinstance', 1, 1390919417, 2),
(1110, 1, 1, 'block/participants:addinstance', 1, 1390919417, 2),
(1111, 1, 7, 'block/private_files:myaddinstance', 1, 1390919417, 2),
(1112, 1, 3, 'block/private_files:addinstance', 1, 1390919417, 2),
(1113, 1, 1, 'block/private_files:addinstance', 1, 1390919417, 2),
(1114, 1, 3, 'block/quiz_results:addinstance', 1, 1390919417, 2),
(1115, 1, 1, 'block/quiz_results:addinstance', 1, 1390919417, 2),
(1116, 1, 3, 'block/recent_activity:addinstance', 1, 1390919417, 2),
(1117, 1, 1, 'block/recent_activity:addinstance', 1, 1390919417, 2),
(1118, 1, 7, 'block/rss_client:myaddinstance', 1, 1390919418, 2),
(1119, 1, 3, 'block/rss_client:addinstance', 1, 1390919418, 2),
(1120, 1, 1, 'block/rss_client:addinstance', 1, 1390919418, 2),
(1121, 1, 3, 'block/search_forums:addinstance', 1, 1390919418, 2),
(1122, 1, 1, 'block/search_forums:addinstance', 1, 1390919418, 2),
(1123, 1, 3, 'block/section_links:addinstance', 1, 1390919418, 2),
(1124, 1, 1, 'block/section_links:addinstance', 1, 1390919418, 2),
(1125, 1, 3, 'block/selfcompletion:addinstance', 1, 1390919419, 2),
(1126, 1, 1, 'block/selfcompletion:addinstance', 1, 1390919419, 2),
(1127, 1, 7, 'block/settings:myaddinstance', 1, 1390919419, 2),
(1128, 1, 3, 'block/settings:addinstance', 1, 1390919419, 2),
(1129, 1, 1, 'block/settings:addinstance', 1, 1390919419, 2),
(1130, 1, 3, 'block/site_main_menu:addinstance', 1, 1390919419, 2),
(1131, 1, 1, 'block/site_main_menu:addinstance', 1, 1390919419, 2),
(1132, 1, 3, 'block/social_activities:addinstance', 1, 1390919419, 2),
(1133, 1, 1, 'block/social_activities:addinstance', 1, 1390919419, 2),
(1134, 1, 3, 'block/tag_flickr:addinstance', 1, 1390919419, 2),
(1135, 1, 1, 'block/tag_flickr:addinstance', 1, 1390919419, 2),
(1136, 1, 3, 'block/tag_youtube:addinstance', 1, 1390919420, 2),
(1137, 1, 1, 'block/tag_youtube:addinstance', 1, 1390919420, 2),
(1138, 1, 7, 'block/tags:myaddinstance', 1, 1390919420, 2),
(1139, 1, 3, 'block/tags:addinstance', 1, 1390919420, 2),
(1140, 1, 1, 'block/tags:addinstance', 1, 1390919420, 2),
(1141, 1, 1, 'report/performance:view', 1, 1390919428, 2),
(1142, 1, 3, 'mod/assign:reviewgrades', 1, 1390990753, 0),
(1143, 1, 1, 'mod/assign:reviewgrades', 1, 1390990753, 0),
(1144, 1, 3, 'mod/assign:releasegrades', 1, 1390990753, 0),
(1145, 1, 1, 'mod/assign:releasegrades', 1, 1390990753, 0),
(1146, 1, 3, 'mod/assign:managegrades', 1, 1390990753, 0),
(1147, 1, 1, 'mod/assign:managegrades', 1, 1390990753, 0),
(1148, 1, 3, 'mod/assign:manageallocations', 1, 1390990753, 0),
(1149, 1, 1, 'mod/assign:manageallocations', 1, 1390990753, 0),
(1150, 1, 7, 'repository/areafiles:view', 1, 1390990766, 0),
(1151, 1, 7, 'repository/skydrive:view', 1, 1390990767, 0),
(1152, 1, 1, 'tool/uploaduser:uploaduserpictures', 1, 1390990771, 0);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_context_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_role_context_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL,
  `contextlevel` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolecontleve_conrol_uix` (`contextlevel`,`roleid`),
  KEY `mdl_rolecontleve_rol_ix` (`roleid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Lists which roles can be assigned at which context levels. T' AUTO_INCREMENT=12 ;

--
-- Dumping data for table `mdl_role_context_levels`
--

INSERT INTO `mdl_role_context_levels` (`id`, `roleid`, `contextlevel`) VALUES
(1, 1, 10),
(4, 2, 10),
(2, 1, 40),
(5, 2, 40),
(3, 1, 50),
(6, 3, 50),
(8, 4, 50),
(10, 5, 50),
(7, 3, 70),
(9, 4, 70),
(11, 5, 70);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_names`
--

CREATE TABLE IF NOT EXISTS `mdl_role_names` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `contextid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolename_rolcon_uix` (`roleid`,`contextid`),
  KEY `mdl_rolename_rol_ix` (`roleid`),
  KEY `mdl_rolename_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='role names in native strings' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_role_sortorder`
--

CREATE TABLE IF NOT EXISTS `mdl_role_sortorder` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `roleid` bigint(10) NOT NULL,
  `contextid` bigint(10) NOT NULL,
  `sortoder` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_rolesort_userolcon_uix` (`userid`,`roleid`,`contextid`),
  KEY `mdl_rolesort_use_ix` (`userid`),
  KEY `mdl_rolesort_rol_ix` (`roleid`),
  KEY `mdl_rolesort_con_ix` (`contextid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='sort order of course managers in a course' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale`
--

CREATE TABLE IF NOT EXISTS `mdl_scale` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scal_cou_ix` (`courseid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines grading scales' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scale_history`
--

CREATE TABLE IF NOT EXISTS `mdl_scale_history` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `action` bigint(10) NOT NULL DEFAULT '0',
  `oldid` bigint(10) NOT NULL,
  `source` varchar(255) DEFAULT NULL,
  `timemodified` bigint(10) DEFAULT NULL,
  `loggeduser` bigint(10) DEFAULT NULL,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scale` longtext NOT NULL,
  `description` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scalhist_act_ix` (`action`),
  KEY `mdl_scalhist_old_ix` (`oldid`),
  KEY `mdl_scalhist_cou_ix` (`courseid`),
  KEY `mdl_scalhist_log_ix` (`loggeduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='History table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `scormtype` varchar(50) NOT NULL DEFAULT 'local',
  `reference` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `version` varchar(9) NOT NULL DEFAULT '',
  `maxgrade` double NOT NULL DEFAULT '0',
  `grademethod` tinyint(2) NOT NULL DEFAULT '0',
  `whatgrade` bigint(10) NOT NULL DEFAULT '0',
  `maxattempt` bigint(10) NOT NULL DEFAULT '1',
  `forcecompleted` tinyint(1) NOT NULL DEFAULT '1',
  `forcenewattempt` tinyint(1) NOT NULL DEFAULT '0',
  `lastattemptlock` tinyint(1) NOT NULL DEFAULT '0',
  `displayattemptstatus` tinyint(1) NOT NULL DEFAULT '1',
  `displaycoursestructure` tinyint(1) NOT NULL DEFAULT '1',
  `updatefreq` tinyint(1) NOT NULL DEFAULT '0',
  `sha1hash` varchar(40) DEFAULT NULL,
  `md5hash` varchar(32) NOT NULL DEFAULT '',
  `revision` bigint(10) NOT NULL DEFAULT '0',
  `launch` bigint(10) NOT NULL DEFAULT '0',
  `skipview` tinyint(1) NOT NULL DEFAULT '1',
  `hidebrowse` tinyint(1) NOT NULL DEFAULT '0',
  `hidetoc` tinyint(1) NOT NULL DEFAULT '0',
  `nav` tinyint(1) NOT NULL DEFAULT '1',
  `navpositionleft` bigint(10) DEFAULT '-100',
  `navpositiontop` bigint(10) DEFAULT '-100',
  `auto` tinyint(1) NOT NULL DEFAULT '0',
  `popup` tinyint(1) NOT NULL DEFAULT '0',
  `options` varchar(255) NOT NULL DEFAULT '',
  `width` bigint(10) NOT NULL DEFAULT '100',
  `height` bigint(10) NOT NULL DEFAULT '600',
  `timeopen` bigint(10) NOT NULL DEFAULT '0',
  `timeclose` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `completionstatusrequired` tinyint(1) DEFAULT NULL,
  `completionscorerequired` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scor_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each table is one SCORM module and its configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_aicc_session`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_aicc_session` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `hacpsession` varchar(255) NOT NULL DEFAULT '',
  `scoid` bigint(10) DEFAULT '0',
  `scormmode` varchar(50) DEFAULT NULL,
  `scormstatus` varchar(255) DEFAULT NULL,
  `attempt` bigint(10) DEFAULT NULL,
  `lessonstatus` varchar(255) DEFAULT NULL,
  `sessiontime` varchar(255) DEFAULT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scoraiccsess_sco_ix` (`scormid`),
  KEY `mdl_scoraiccsess_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Used by AICC HACP to store session information' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scorm` bigint(10) NOT NULL DEFAULT '0',
  `manifest` varchar(255) NOT NULL DEFAULT '',
  `organization` varchar(255) NOT NULL DEFAULT '',
  `parent` varchar(255) NOT NULL DEFAULT '',
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `launch` longtext NOT NULL,
  `scormtype` varchar(5) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoe_sco_ix` (`scorm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each SCO part of the SCORM module' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_data`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_scorscoedata_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains variable data get from packages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_scoes_track`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_scoes_track` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `scormid` bigint(10) NOT NULL DEFAULT '0',
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `attempt` bigint(10) NOT NULL DEFAULT '1',
  `element` varchar(255) NOT NULL DEFAULT '',
  `value` longtext NOT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorscoetrac_usescosco_uix` (`userid`,`scormid`,`scoid`,`attempt`,`element`),
  KEY `mdl_scorscoetrac_use_ix` (`userid`),
  KEY `mdl_scorscoetrac_ele_ix` (`element`),
  KEY `mdl_scorscoetrac_sco_ix` (`scormid`),
  KEY `mdl_scorscoetrac_sco2_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to track SCOes' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_mapinfo`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_mapinfo` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `objectiveid` bigint(10) NOT NULL DEFAULT '0',
  `targetobjectiveid` bigint(10) NOT NULL DEFAULT '0',
  `readsatisfiedstatus` tinyint(1) NOT NULL DEFAULT '1',
  `readnormalizedmeasure` tinyint(1) NOT NULL DEFAULT '1',
  `writesatisfiedstatus` tinyint(1) NOT NULL DEFAULT '0',
  `writenormalizedmeasure` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqmapi_scoidobj_uix` (`scoid`,`id`,`objectiveid`),
  KEY `mdl_scorseqmapi_sco_ix` (`scoid`),
  KEY `mdl_scorseqmapi_obj_ix` (`objectiveid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective mapinfo description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_objective`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_objective` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `primaryobj` tinyint(1) NOT NULL DEFAULT '0',
  `objectiveid` varchar(255) NOT NULL DEFAULT '',
  `satisfiedbymeasure` tinyint(1) NOT NULL DEFAULT '1',
  `minnormalizedmeasure` float(11,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqobje_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqobje_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 objective description' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprule`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprule` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `childactivityset` varchar(15) NOT NULL DEFAULT '',
  `minimumcount` bigint(10) NOT NULL DEFAULT '0',
  `minimumpercent` float(11,4) NOT NULL DEFAULT '0.0000',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `action` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqroll_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rolluprulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rolluprulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `rollupruleid` bigint(10) NOT NULL DEFAULT '0',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqroll_scorolid_uix` (`scoid`,`rollupruleid`,`id`),
  KEY `mdl_scorseqroll_sco2_ix` (`scoid`),
  KEY `mdl_scorseqroll_rol_ix` (`rollupruleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 sequencing rule' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_rulecond`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_rulecond` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `ruleconditionsid` bigint(10) NOT NULL DEFAULT '0',
  `refrencedobjective` varchar(255) NOT NULL DEFAULT '',
  `measurethreshold` float(11,4) NOT NULL DEFAULT '0.0000',
  `operator` varchar(5) NOT NULL DEFAULT 'noOp',
  `cond` varchar(30) NOT NULL DEFAULT 'always',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_idscorul_uix` (`id`,`scoid`,`ruleconditionsid`),
  KEY `mdl_scorseqrule_sco2_ix` (`scoid`),
  KEY `mdl_scorseqrule_rul_ix` (`ruleconditionsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule condition' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_scorm_seq_ruleconds`
--

CREATE TABLE IF NOT EXISTS `mdl_scorm_seq_ruleconds` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `scoid` bigint(10) NOT NULL DEFAULT '0',
  `conditioncombination` varchar(3) NOT NULL DEFAULT 'all',
  `ruletype` tinyint(2) NOT NULL DEFAULT '0',
  `action` varchar(25) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_scorseqrule_scoid_uix` (`scoid`,`id`),
  KEY `mdl_scorseqrule_sco_ix` (`scoid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='SCORM2004 rule conditions' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_sessions`
--

CREATE TABLE IF NOT EXISTS `mdl_sessions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `state` bigint(10) NOT NULL DEFAULT '0',
  `sid` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `sessdata` longtext,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `firstip` varchar(45) DEFAULT NULL,
  `lastip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_sess_sid_uix` (`sid`),
  KEY `mdl_sess_sta_ix` (`state`),
  KEY `mdl_sess_tim_ix` (`timecreated`),
  KEY `mdl_sess_tim2_ix` (`timemodified`),
  KEY `mdl_sess_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Database based session storage - now recommended' AUTO_INCREMENT=58 ;

--
-- Dumping data for table `mdl_sessions`
--

INSERT INTO `mdl_sessions` (`id`, `state`, `sid`, `userid`, `sessdata`, `timecreated`, `timemodified`, `firstip`, `lastip`) VALUES
(55, 0, 'b7evhe5q4ir64ag925f6rij573', 2, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo0OntzOjIxOiJsb2FkX25hdmlnYXRpb25fYWRtaW4iO2k6MTtzOjIxOiJjYWxlbmRhcnNob3dldmVudHR5cGUiO2k6MTU7czoxODoiY2FjaGVzdG9yZV9zZXNzaW9uIjthOjE6e3M6MzA6ImRlZmF1bHRfc2Vzc2lvbi1jb3JlL2NvdXJzZWNhdCI7YTo0OntzOjE3OiJfX2xhc3RhY2Nlc3NfX3UyXyI7YToyOntpOjA7aToxMzkxMTc2MzE2O2k6MTtpOjEzOTExNzYzMTY7fXM6NDQ6InUyX184NmMxMGJiZThlY2NkMjcxNDhiOWI3MzgxNmQ1N2ViNDg2M2E3NDVjIjthOjI6e2k6MDtpOjEzOTExNzYzMTY7aToxO2k6MTM5MTE3NjMxNjt9czo0NDoidTJfX2FlZTUwMGEyMzc2NjZiZmZjNjNjMTZlYmY2NTlkNDVjN2ZiNGY1OTUiO2E6Mjp7aTowO2E6Mjp7aTowO2k6MztpOjE7aToyO31pOjE7aToxMzkxMTc2MzE2O31zOjQ0OiJ1Ml9fOTE3ZDY1OTRmMGI5NDJlNzlmNWZlN2RiMjRiNzJlMTkxZTFiZDBkYiI7YToyOntpOjA7aToyO2k6MTtpOjEzOTExNzYzMTY7fX19czoyMjoiYWRtaW5fY3JpdGljYWxfd2FybmluZyI7YjowO31VU0VSfE86ODoic3RkQ2xhc3MiOjU5OntzOjI6ImlkIjtzOjE6IjIiO3M6NDoiYXV0aCI7czo2OiJtYW51YWwiO3M6OToiY29uZmlybWVkIjtzOjE6IjEiO3M6MTI6InBvbGljeWFncmVlZCI7czoxOiIwIjtzOjc6ImRlbGV0ZWQiO3M6MToiMCI7czo5OiJzdXNwZW5kZWQiO3M6MToiMCI7czoxMDoibW5ldGhvc3RpZCI7czoxOiIxIjtzOjg6InVzZXJuYW1lIjtzOjU6ImFkbWluIjtzOjg6ImlkbnVtYmVyIjtzOjA6IiI7czo5OiJmaXJzdG5hbWUiO3M6NToiQWRtaW4iO3M6ODoibGFzdG5hbWUiO3M6NDoiVXNlciI7czo1OiJlbWFpbCI7czozMToiYWxleGFuZGVyLnpodXJhdmxldkBpbnRvc29mdC5ieSI7czo5OiJlbWFpbHN0b3AiO3M6MToiMCI7czozOiJpY3EiO3M6MDoiIjtzOjU6InNreXBlIjtzOjA6IiI7czo1OiJ5YWhvbyI7czowOiIiO3M6MzoiYWltIjtzOjA6IiI7czozOiJtc24iO3M6MDoiIjtzOjY6InBob25lMSI7czowOiIiO3M6NjoicGhvbmUyIjtzOjA6IiI7czoxMToiaW5zdGl0dXRpb24iO3M6MDoiIjtzOjEwOiJkZXBhcnRtZW50IjtzOjA6IiI7czo3OiJhZGRyZXNzIjtzOjA6IiI7czo0OiJjaXR5IjtzOjU6Ik1pbnNrIjtzOjc6ImNvdW50cnkiO3M6MjoiQlkiO3M6NDoibGFuZyI7czoyOiJlbiI7czo1OiJ0aGVtZSI7czowOiIiO3M6ODoidGltZXpvbmUiO3M6MjoiOTkiO3M6MTE6ImZpcnN0YWNjZXNzIjtzOjEwOiIxMzkwMzkzMzEzIjtzOjEwOiJsYXN0YWNjZXNzIjtpOjEzOTExNzY0OTI7czo5OiJsYXN0bG9naW4iO3M6MTA6IjEzOTExNzIyOTMiO3M6MTI6ImN1cnJlbnRsb2dpbiI7aToxMzkxMTcyMzE1O3M6NjoibGFzdGlwIjtzOjk6IjEyNy4wLjAuMSI7czo2OiJzZWNyZXQiO3M6MDoiIjtzOjc6InBpY3R1cmUiO3M6MToiMCI7czozOiJ1cmwiO3M6MDoiIjtzOjE3OiJkZXNjcmlwdGlvbmZvcm1hdCI7czoxOiIwIjtzOjEwOiJtYWlsZm9ybWF0IjtzOjE6IjEiO3M6MTA6Im1haWxkaWdlc3QiO3M6MToiMCI7czoxMToibWFpbGRpc3BsYXkiO3M6MToiMSI7czoxMzoiYXV0b3N1YnNjcmliZSI7czoxOiIxIjtzOjExOiJ0cmFja2ZvcnVtcyI7czoxOiIwIjtzOjExOiJ0aW1lY3JlYXRlZCI7czoxOiIwIjtzOjEyOiJ0aW1lbW9kaWZpZWQiO3M6MTA6IjEzOTExNzIyOTMiO3M6MTI6InRydXN0Yml0bWFzayI7czoxOiIwIjtzOjg6ImltYWdlYWx0IjtOO3M6MTY6Imxhc3RuYW1lcGhvbmV0aWMiO047czoxNzoiZmlyc3RuYW1lcGhvbmV0aWMiO047czoxMDoibWlkZGxlbmFtZSI7TjtzOjEzOiJhbHRlcm5hdGVuYW1lIjtOO3M6MTI6ImNhbGVuZGFydHlwZSI7czo5OiJncmVnb3JpYW4iO3M6MTY6Imxhc3Rjb3Vyc2VhY2Nlc3MiO2E6Mjp7aToyO3M6MTA6IjEzOTA5MDg5MjUiO2k6MztzOjEwOiIxMzkxMDg3MDgxIjt9czoxOToiY3VycmVudGNvdXJzZWFjY2VzcyI7YTowOnt9czoxMToiZ3JvdXBtZW1iZXIiO2E6MDp7fXM6NzoicHJvZmlsZSI7YTowOnt9czo3OiJzZXNza2V5IjtzOjEwOiJxSEJaWUtDMkZLIjtzOjEwOiJwcmVmZXJlbmNlIjthOjEwOntzOjI5OiJjb3Vyc2VfZWRpdF9mb3JtX3Nob3dhZHZhbmNlZCI7czoxOiIxIjtzOjE4OiJlbWFpbF9ib3VuY2VfY291bnQiO3M6MToiMSI7czoxNjoiZW1haWxfc2VuZF9jb3VudCI7czoxOiIxIjtzOjI0OiJmaWxlcGlja2VyX3JlY2VudGxpY2Vuc2UiO3M6MTc6ImFsbHJpZ2h0c3Jlc2VydmVkIjtzOjI3OiJmaWxlcGlja2VyX3JlY2VudHJlcG9zaXRvcnkiO3M6MToiMyI7czoxMzoidXNlbW9kY2hvb3NlciI7czoxOiIwIjtzOjI5OiJ1c2Vyc2VsZWN0b3JfYXV0b3NlbGVjdHVuaXF1ZSI7czoxOiIwIjtzOjI5OiJ1c2Vyc2VsZWN0b3JfcHJlc2VydmVzZWxlY3RlZCI7czoxOiIwIjtzOjI3OiJ1c2Vyc2VsZWN0b3Jfc2VhcmNoYW55d2hlcmUiO3M6MToiMCI7czoxMToiX2xhc3Rsb2FkZWQiO2k6MTM5MTE3NjUwMTt9czoxNzoibWVzc2FnZV9sYXN0cG9wdXAiO2k6MDtzOjI1OiJhamF4X3VwZGF0YWJsZV91c2VyX3ByZWZzIjthOjk6e3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8xIjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzQiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfNSI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV8zIjtzOjM6ImludCI7czoxMjoiYmxvY2s0aGlkZGVuIjtzOjQ6ImJvb2wiO3M6MTI6ImJsb2NrNWhpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazNoaWRkZW4iO3M6NDoiYm9vbCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzYiO3M6MzoiaW50IjtzOjEyOiJibG9jazZoaWRkZW4iO3M6NDoiYm9vbCI7fX0=', 1391172315, 1391176492, '127.0.0.1', '127.0.0.1'),
(56, 0, 'jdh1t3erk3vbh49mrj917dkq41', 0, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo0OntzOjQ6ImxhbmciO3M6MjoiZW4iO3M6MjE6ImNhbGVuZGFyc2hvd2V2ZW50dHlwZSI7aToxNTtzOjE4OiJjYWNoZXN0b3JlX3Nlc3Npb24iO2E6MTp7czozMDoiZGVmYXVsdF9zZXNzaW9uLWNvcmUvY291cnNlY2F0IjthOjQ6e3M6MTc6Il9fbGFzdGFjY2Vzc19fdTBfIjthOjI6e2k6MDtpOjEzOTExNzg1NDg7aToxO2k6MTM5MTE3ODU0ODt9czo0NDoidTBfXzg2YzEwYmJlOGVjY2QyNzE0OGI5YjczODE2ZDU3ZWI0ODYzYTc0NWMiO2E6Mjp7aTowO2k6MTM5MTE3ODU0ODtpOjE7aToxMzkxMTc4NTQ4O31zOjQ0OiJ1MF9fYWVlNTAwYTIzNzY2NmJmZmM2M2MxNmViZjY1OWQ0NWM3ZmI0ZjU5NSI7YToyOntpOjA7YToyOntpOjA7aTozO2k6MTtpOjI7fWk6MTtpOjEzOTExNzg1NDg7fXM6NDQ6InUwX185MTdkNjU5NGYwYjk0MmU3OWY1ZmU3ZGIyNGI3MmUxOTFlMWJkMGRiIjthOjI6e2k6MDtpOjI7aToxO2k6MTM5MTE3ODU0ODt9fX1zOjg6IndhbnRzdXJsIjtOO31VU0VSfE86ODoic3RkQ2xhc3MiOjc6e3M6MjoiaWQiO2k6MDtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6MTA6InByZWZlcmVuY2UiO2E6MDp7fXM6Nzoic2Vzc2tleSI7czoxMDoiak9UbEpDNklMMSI7czoyNToiYWpheF91cGRhdGFibGVfdXNlcl9wcmVmcyI7YTo2OntzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMSI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV80IjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzUiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMyI7czozOiJpbnQiO3M6MTI6ImJsb2NrNGhpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazNoaWRkZW4iO3M6NDoiYm9vbCI7fXM6NjoiYWNjZXNzIjthOjc6e3M6MjoicmEiO2E6MTp7czoyOiIvMSI7YToxOntpOjY7aTo2O319czo0OiJyZGVmIjthOjE6e3M6NDoiLzE6NiI7YToyNjp7czoyNzoiYmxvY2svb25saW5lX3VzZXJzOnZpZXdsaXN0IjtpOjE7czoyMDoiYm9va3Rvb2wvcHJpbnQ6cHJpbnQiO2k6MTtzOjE1OiJtb2QvYXNzaWduOnZpZXciO2k6MTtzOjE5OiJtb2QvYXNzaWdubWVudDp2aWV3IjtpOjE7czoxMzoibW9kL2Jvb2s6cmVhZCI7aToxO3M6MTg6Im1vZC9kYXRhOnZpZXdlbnRyeSI7aToxO3M6MTc6Im1vZC9mZWVkYmFjazp2aWV3IjtpOjE7czoxNToibW9kL2ZvbGRlcjp2aWV3IjtpOjE7czoyNDoibW9kL2ZvcnVtOnZpZXdkaXNjdXNzaW9uIjtpOjE7czoxNzoibW9kL2dsb3NzYXJ5OnZpZXciO2k6MTtzOjE0OiJtb2QvaW1zY3A6dmlldyI7aToxO3M6MTI6Im1vZC9sdGk6dmlldyI7aToxO3M6MTM6Im1vZC9wYWdlOnZpZXciO2k6MTtzOjEzOiJtb2QvcXVpejp2aWV3IjtpOjE7czoxNzoibW9kL3Jlc291cmNlOnZpZXciO2k6MTtzOjEyOiJtb2QvdXJsOnZpZXciO2k6MTtzOjE3OiJtb2Qvd2lraTp2aWV3cGFnZSI7aToxO3M6MTc6Im1vZC93b3Jrc2hvcDp2aWV3IjtpOjE7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO2k6MTtzOjE4OiJtb29kbGUvYmxvZzpzZWFyY2giO2k6MTtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtpOjE7czoxOToibW9vZGxlL2NvbW1lbnQ6dmlldyI7aToxO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtpOi0xMDAwO3M6MzM6Im1vb2RsZS91c2VyOmVkaXRvd25tZXNzYWdlcHJvZmlsZSI7aTotMTAwMDtzOjI2OiJtb29kbGUvdXNlcjplZGl0b3ducHJvZmlsZSI7aTotMTAwMDtzOjIzOiJtb29kbGUvdXNlcjp2aWV3ZGV0YWlscyI7aToxO319czoxMDoicmRlZl9jb3VudCI7aToxO3M6ODoicmRlZl9sY2MiO2k6MTtzOjY6ImxvYWRlZCI7YToxOntpOjE7aToxO31zOjQ6InRpbWUiO2k6MTM5MTE3ODU0ODtzOjM6InJzdyI7YTowOnt9fXM6NToiZW5yb2wiO2E6Mjp7czo4OiJlbnJvbGxlZCI7YTowOnt9czo5OiJ0ZW1wZ3Vlc3QiO2E6MDp7fX19', 1391178548, 1391178550, '127.0.0.1', '127.0.0.1'),
(57, 0, '6mrth40jfa3k12h9ohkupjhcb5', 0, 'U0VTU0lPTnxPOjg6InN0ZENsYXNzIjo0OntzOjQ6ImxhbmciO3M6MjoiZW4iO3M6MjE6ImNhbGVuZGFyc2hvd2V2ZW50dHlwZSI7aToxNTtzOjE4OiJjYWNoZXN0b3JlX3Nlc3Npb24iO2E6MTp7czozMDoiZGVmYXVsdF9zZXNzaW9uLWNvcmUvY291cnNlY2F0IjthOjQ6e3M6MTc6Il9fbGFzdGFjY2Vzc19fdTBfIjthOjI6e2k6MDtpOjEzOTExNzkwODk7aToxO2k6MTM5MTE3OTA4OTt9czo0NDoidTBfXzg2YzEwYmJlOGVjY2QyNzE0OGI5YjczODE2ZDU3ZWI0ODYzYTc0NWMiO2E6Mjp7aTowO2k6MTM5MTE3OTA4OTtpOjE7aToxMzkxMTc5MDg5O31zOjQ0OiJ1MF9fYWVlNTAwYTIzNzY2NmJmZmM2M2MxNmViZjY1OWQ0NWM3ZmI0ZjU5NSI7YToyOntpOjA7YToyOntpOjA7aTozO2k6MTtpOjI7fWk6MTtpOjEzOTExNzkwODk7fXM6NDQ6InUwX185MTdkNjU5NGYwYjk0MmU3OWY1ZmU3ZGIyNGI3MmUxOTFlMWJkMGRiIjthOjI6e2k6MDtpOjI7aToxO2k6MTM5MTE3OTA4OTt9fX1zOjg6IndhbnRzdXJsIjtOO31VU0VSfE86ODoic3RkQ2xhc3MiOjc6e3M6MjoiaWQiO2k6MDtzOjEwOiJtbmV0aG9zdGlkIjtzOjE6IjEiO3M6MTA6InByZWZlcmVuY2UiO2E6MDp7fXM6Nzoic2Vzc2tleSI7czoxMDoiQUdic29IemxINyI7czoyNToiYWpheF91cGRhdGFibGVfdXNlcl9wcmVmcyI7YTo2OntzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMSI7czozOiJpbnQiO3M6MjM6ImRvY2tlZF9ibG9ja19pbnN0YW5jZV80IjtzOjM6ImludCI7czoyMzoiZG9ja2VkX2Jsb2NrX2luc3RhbmNlXzUiO3M6MzoiaW50IjtzOjIzOiJkb2NrZWRfYmxvY2tfaW5zdGFuY2VfMyI7czozOiJpbnQiO3M6MTI6ImJsb2NrNGhpZGRlbiI7czo0OiJib29sIjtzOjEyOiJibG9jazNoaWRkZW4iO3M6NDoiYm9vbCI7fXM6NjoiYWNjZXNzIjthOjc6e3M6MjoicmEiO2E6MTp7czoyOiIvMSI7YToxOntpOjY7aTo2O319czo0OiJyZGVmIjthOjE6e3M6NDoiLzE6NiI7YToyNjp7czoyNzoiYmxvY2svb25saW5lX3VzZXJzOnZpZXdsaXN0IjtpOjE7czoyMDoiYm9va3Rvb2wvcHJpbnQ6cHJpbnQiO2k6MTtzOjE1OiJtb2QvYXNzaWduOnZpZXciO2k6MTtzOjE5OiJtb2QvYXNzaWdubWVudDp2aWV3IjtpOjE7czoxMzoibW9kL2Jvb2s6cmVhZCI7aToxO3M6MTg6Im1vZC9kYXRhOnZpZXdlbnRyeSI7aToxO3M6MTc6Im1vZC9mZWVkYmFjazp2aWV3IjtpOjE7czoxNToibW9kL2ZvbGRlcjp2aWV3IjtpOjE7czoyNDoibW9kL2ZvcnVtOnZpZXdkaXNjdXNzaW9uIjtpOjE7czoxNzoibW9kL2dsb3NzYXJ5OnZpZXciO2k6MTtzOjE0OiJtb2QvaW1zY3A6dmlldyI7aToxO3M6MTI6Im1vZC9sdGk6dmlldyI7aToxO3M6MTM6Im1vZC9wYWdlOnZpZXciO2k6MTtzOjEzOiJtb2QvcXVpejp2aWV3IjtpOjE7czoxNzoibW9kL3Jlc291cmNlOnZpZXciO2k6MTtzOjEyOiJtb2QvdXJsOnZpZXciO2k6MTtzOjE3OiJtb2Qvd2lraTp2aWV3cGFnZSI7aToxO3M6MTc6Im1vZC93b3Jrc2hvcDp2aWV3IjtpOjE7czoxNzoibW9vZGxlL2Jsb2NrOnZpZXciO2k6MTtzOjE4OiJtb29kbGUvYmxvZzpzZWFyY2giO2k6MTtzOjE2OiJtb29kbGUvYmxvZzp2aWV3IjtpOjE7czoxOToibW9vZGxlL2NvbW1lbnQ6dmlldyI7aToxO3M6Mjk6Im1vb2RsZS91c2VyOmNoYW5nZW93bnBhc3N3b3JkIjtpOi0xMDAwO3M6MzM6Im1vb2RsZS91c2VyOmVkaXRvd25tZXNzYWdlcHJvZmlsZSI7aTotMTAwMDtzOjI2OiJtb29kbGUvdXNlcjplZGl0b3ducHJvZmlsZSI7aTotMTAwMDtzOjIzOiJtb29kbGUvdXNlcjp2aWV3ZGV0YWlscyI7aToxO319czoxMDoicmRlZl9jb3VudCI7aToxO3M6ODoicmRlZl9sY2MiO2k6MTtzOjY6ImxvYWRlZCI7YToxOntpOjE7aToxO31zOjQ6InRpbWUiO2k6MTM5MTE3OTA4OTtzOjM6InJzdyI7YTowOnt9fXM6NToiZW5yb2wiO2E6Mjp7czo4OiJlbnJvbGxlZCI7YTowOnt9czo5OiJ0ZW1wZ3Vlc3QiO2E6MDp7fX19', 1391179089, 1391179091, '127.0.0.1', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statdail_cou_ix` (`courseid`),
  KEY `mdl_statdail_tim_ix` (`timeend`),
  KEY `mdl_statdail_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='to accumulate daily stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statmont_cou_ix` (`courseid`),
  KEY `mdl_statmont_tim_ix` (`timeend`),
  KEY `mdl_statmont_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_daily`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_daily` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserdail_cou_ix` (`courseid`),
  KEY `mdl_statuserdail_use_ix` (`userid`),
  KEY `mdl_statuserdail_rol_ix` (`roleid`),
  KEY `mdl_statuserdail_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate daily stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_monthly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_monthly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statusermont_cou_ix` (`courseid`),
  KEY `mdl_statusermont_use_ix` (`userid`),
  KEY `mdl_statusermont_rol_ix` (`roleid`),
  KEY `mdl_statusermont_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate monthly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_user_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_user_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `statsreads` bigint(10) NOT NULL DEFAULT '0',
  `statswrites` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_statuserweek_cou_ix` (`courseid`),
  KEY `mdl_statuserweek_use_ix` (`userid`),
  KEY `mdl_statuserweek_rol_ix` (`roleid`),
  KEY `mdl_statuserweek_tim_ix` (`timeend`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats per course/user' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_stats_weekly`
--

CREATE TABLE IF NOT EXISTS `mdl_stats_weekly` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '0',
  `roleid` bigint(10) NOT NULL DEFAULT '0',
  `stattype` varchar(20) NOT NULL DEFAULT 'activity',
  `stat1` bigint(10) NOT NULL DEFAULT '0',
  `stat2` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_statweek_cou_ix` (`courseid`),
  KEY `mdl_statweek_tim_ix` (`timeend`),
  KEY `mdl_statweek_rol_ix` (`roleid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='To accumulate weekly stats' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey`
--

CREATE TABLE IF NOT EXISTS `mdl_survey` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `template` bigint(10) NOT NULL DEFAULT '0',
  `days` mediumint(6) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext NOT NULL,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `questions` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_surv_cou_ix` (`course`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Each record is one SURVEY module with its configuration' AUTO_INCREMENT=6 ;

--
-- Dumping data for table `mdl_survey`
--

INSERT INTO `mdl_survey` (`id`, `course`, `template`, `days`, `timecreated`, `timemodified`, `name`, `intro`, `introformat`, `questions`) VALUES
(1, 0, 0, 0, 985017600, 985017600, 'collesaname', 'collesaintro', 0, '25,26,27,28,29,30,43,44'),
(2, 0, 0, 0, 985017600, 985017600, 'collespname', 'collespintro', 0, '31,32,33,34,35,36,43,44'),
(3, 0, 0, 0, 985017600, 985017600, 'collesapname', 'collesapintro', 0, '37,38,39,40,41,42,43,44'),
(4, 0, 0, 0, 985017600, 985017600, 'attlsname', 'attlsintro', 0, '65,67,68'),
(5, 0, 0, 0, 985017600, 985017600, 'ciqname', 'ciqintro', 0, '69,70,71,72,73');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_analysis`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_analysis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `notes` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survanal_use_ix` (`userid`),
  KEY `mdl_survanal_sur_ix` (`survey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='text about each survey submission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_answers`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_answers` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `survey` bigint(10) NOT NULL DEFAULT '0',
  `question` bigint(10) NOT NULL DEFAULT '0',
  `time` bigint(10) NOT NULL DEFAULT '0',
  `answer1` longtext NOT NULL,
  `answer2` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_survansw_use_ix` (`userid`),
  KEY `mdl_survansw_sur_ix` (`survey`),
  KEY `mdl_survansw_que_ix` (`question`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='the answers to each questions filled by the users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_survey_questions`
--

CREATE TABLE IF NOT EXISTS `mdl_survey_questions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `text` varchar(255) NOT NULL DEFAULT '',
  `shorttext` varchar(30) NOT NULL DEFAULT '',
  `multi` varchar(100) NOT NULL DEFAULT '',
  `intro` varchar(50) NOT NULL DEFAULT '',
  `type` smallint(3) NOT NULL DEFAULT '0',
  `options` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='the questions conforming one survey' AUTO_INCREMENT=74 ;

--
-- Dumping data for table `mdl_survey_questions`
--

INSERT INTO `mdl_survey_questions` (`id`, `text`, `shorttext`, `multi`, `intro`, `type`, `options`) VALUES
(1, 'colles1', 'colles1short', '', '', 1, 'scaletimes5'),
(2, 'colles2', 'colles2short', '', '', 1, 'scaletimes5'),
(3, 'colles3', 'colles3short', '', '', 1, 'scaletimes5'),
(4, 'colles4', 'colles4short', '', '', 1, 'scaletimes5'),
(5, 'colles5', 'colles5short', '', '', 1, 'scaletimes5'),
(6, 'colles6', 'colles6short', '', '', 1, 'scaletimes5'),
(7, 'colles7', 'colles7short', '', '', 1, 'scaletimes5'),
(8, 'colles8', 'colles8short', '', '', 1, 'scaletimes5'),
(9, 'colles9', 'colles9short', '', '', 1, 'scaletimes5'),
(10, 'colles10', 'colles10short', '', '', 1, 'scaletimes5'),
(11, 'colles11', 'colles11short', '', '', 1, 'scaletimes5'),
(12, 'colles12', 'colles12short', '', '', 1, 'scaletimes5'),
(13, 'colles13', 'colles13short', '', '', 1, 'scaletimes5'),
(14, 'colles14', 'colles14short', '', '', 1, 'scaletimes5'),
(15, 'colles15', 'colles15short', '', '', 1, 'scaletimes5'),
(16, 'colles16', 'colles16short', '', '', 1, 'scaletimes5'),
(17, 'colles17', 'colles17short', '', '', 1, 'scaletimes5'),
(18, 'colles18', 'colles18short', '', '', 1, 'scaletimes5'),
(19, 'colles19', 'colles19short', '', '', 1, 'scaletimes5'),
(20, 'colles20', 'colles20short', '', '', 1, 'scaletimes5'),
(21, 'colles21', 'colles21short', '', '', 1, 'scaletimes5'),
(22, 'colles22', 'colles22short', '', '', 1, 'scaletimes5'),
(23, 'colles23', 'colles23short', '', '', 1, 'scaletimes5'),
(24, 'colles24', 'colles24short', '', '', 1, 'scaletimes5'),
(25, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 1, 'scaletimes5'),
(26, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 1, 'scaletimes5'),
(27, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 1, 'scaletimes5'),
(28, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 1, 'scaletimes5'),
(29, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 1, 'scaletimes5'),
(30, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 1, 'scaletimes5'),
(31, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 2, 'scaletimes5'),
(32, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 2, 'scaletimes5'),
(33, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 2, 'scaletimes5'),
(34, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 2, 'scaletimes5'),
(35, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 2, 'scaletimes5'),
(36, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 2, 'scaletimes5'),
(37, 'collesm1', 'collesm1short', '1,2,3,4', 'collesmintro', 3, 'scaletimes5'),
(38, 'collesm2', 'collesm2short', '5,6,7,8', 'collesmintro', 3, 'scaletimes5'),
(39, 'collesm3', 'collesm3short', '9,10,11,12', 'collesmintro', 3, 'scaletimes5'),
(40, 'collesm4', 'collesm4short', '13,14,15,16', 'collesmintro', 3, 'scaletimes5'),
(41, 'collesm5', 'collesm5short', '17,18,19,20', 'collesmintro', 3, 'scaletimes5'),
(42, 'collesm6', 'collesm6short', '21,22,23,24', 'collesmintro', 3, 'scaletimes5'),
(43, 'howlong', '', '', '', 1, 'howlongoptions'),
(44, 'othercomments', '', '', '', 0, NULL),
(45, 'attls1', 'attls1short', '', '', 1, 'scaleagree5'),
(46, 'attls2', 'attls2short', '', '', 1, 'scaleagree5'),
(47, 'attls3', 'attls3short', '', '', 1, 'scaleagree5'),
(48, 'attls4', 'attls4short', '', '', 1, 'scaleagree5'),
(49, 'attls5', 'attls5short', '', '', 1, 'scaleagree5'),
(50, 'attls6', 'attls6short', '', '', 1, 'scaleagree5'),
(51, 'attls7', 'attls7short', '', '', 1, 'scaleagree5'),
(52, 'attls8', 'attls8short', '', '', 1, 'scaleagree5'),
(53, 'attls9', 'attls9short', '', '', 1, 'scaleagree5'),
(54, 'attls10', 'attls10short', '', '', 1, 'scaleagree5'),
(55, 'attls11', 'attls11short', '', '', 1, 'scaleagree5'),
(56, 'attls12', 'attls12short', '', '', 1, 'scaleagree5'),
(57, 'attls13', 'attls13short', '', '', 1, 'scaleagree5'),
(58, 'attls14', 'attls14short', '', '', 1, 'scaleagree5'),
(59, 'attls15', 'attls15short', '', '', 1, 'scaleagree5'),
(60, 'attls16', 'attls16short', '', '', 1, 'scaleagree5'),
(61, 'attls17', 'attls17short', '', '', 1, 'scaleagree5'),
(62, 'attls18', 'attls18short', '', '', 1, 'scaleagree5'),
(63, 'attls19', 'attls19short', '', '', 1, 'scaleagree5'),
(64, 'attls20', 'attls20short', '', '', 1, 'scaleagree5'),
(65, 'attlsm1', 'attlsm1', '45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64', 'attlsmintro', 1, 'scaleagree5'),
(66, '-', '-', '-', '-', 0, '-'),
(67, 'attlsm2', 'attlsm2', '63,62,59,57,55,49,52,50,48,47', 'attlsmintro', -1, 'scaleagree5'),
(68, 'attlsm3', 'attlsm3', '46,54,45,51,60,53,56,58,61,64', 'attlsmintro', -1, 'scaleagree5'),
(69, 'ciq1', 'ciq1short', '', '', 0, NULL),
(70, 'ciq2', 'ciq2short', '', '', 0, NULL),
(71, 'ciq3', 'ciq3short', '', '', 0, NULL),
(72, 'ciq4', 'ciq4short', '', '', 0, NULL),
(73, 'ciq5', 'ciq5short', '', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag`
--

CREATE TABLE IF NOT EXISTS `mdl_tag` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `rawname` varchar(255) NOT NULL DEFAULT '',
  `tagtype` varchar(255) DEFAULT NULL,
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `flag` smallint(4) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_tag_nam_uix` (`name`),
  UNIQUE KEY `mdl_tag_idnam_uix` (`id`,`name`),
  KEY `mdl_tag_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Tag table - this generic table will replace the old "tags" t' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_correlation`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_correlation` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `correlatedtags` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_tagcorr_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The rationale for the ''tag_correlation'' table is performance' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tag_instance`
--

CREATE TABLE IF NOT EXISTS `mdl_tag_instance` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `tagid` bigint(10) NOT NULL,
  `itemtype` varchar(255) NOT NULL DEFAULT '',
  `itemid` bigint(10) NOT NULL,
  `tiuserid` bigint(10) NOT NULL DEFAULT '0',
  `ordering` bigint(10) DEFAULT NULL,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_taginst_iteitetagtiu_uix` (`itemtype`,`itemid`,`tagid`,`tiuserid`),
  KEY `mdl_taginst_tag_ix` (`tagid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='tag_instance table holds the information of associations bet' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_timezone`
--

CREATE TABLE IF NOT EXISTS `mdl_timezone` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `year` bigint(11) NOT NULL DEFAULT '0',
  `tzrule` varchar(20) NOT NULL DEFAULT '',
  `gmtoff` bigint(11) NOT NULL DEFAULT '0',
  `dstoff` bigint(11) NOT NULL DEFAULT '0',
  `dst_month` tinyint(2) NOT NULL DEFAULT '0',
  `dst_startday` smallint(3) NOT NULL DEFAULT '0',
  `dst_weekday` smallint(3) NOT NULL DEFAULT '0',
  `dst_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `dst_time` varchar(6) NOT NULL DEFAULT '00:00',
  `std_month` tinyint(2) NOT NULL DEFAULT '0',
  `std_startday` smallint(3) NOT NULL DEFAULT '0',
  `std_weekday` smallint(3) NOT NULL DEFAULT '0',
  `std_skipweeks` smallint(3) NOT NULL DEFAULT '0',
  `std_time` varchar(6) NOT NULL DEFAULT '00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Rules for calculating local wall clock time for users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `lang` varchar(20) NOT NULL DEFAULT '',
  `componentid` bigint(10) NOT NULL,
  `stringid` varchar(255) NOT NULL DEFAULT '',
  `original` longtext NOT NULL,
  `master` longtext,
  `local` longtext,
  `timemodified` bigint(10) NOT NULL,
  `timecustomized` bigint(10) DEFAULT NULL,
  `outdated` smallint(3) DEFAULT '0',
  `modified` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_toolcust_lancomstr_uix` (`lang`,`componentid`,`stringid`),
  KEY `mdl_toolcust_com_ix` (`componentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the working checkout of all strings and their custo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_tool_customlang_components`
--

CREATE TABLE IF NOT EXISTS `mdl_tool_customlang_components` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `version` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains the list of all installed plugins that provide thei' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_upgrade_log`
--

CREATE TABLE IF NOT EXISTS `mdl_upgrade_log` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `type` bigint(10) NOT NULL,
  `plugin` varchar(100) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `targetversion` varchar(100) DEFAULT NULL,
  `info` varchar(255) NOT NULL DEFAULT '',
  `details` longtext,
  `backtrace` longtext,
  `userid` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_upgrlog_tim_ix` (`timemodified`),
  KEY `mdl_upgrlog_typtim_ix` (`type`,`timemodified`),
  KEY `mdl_upgrlog_use_ix` (`userid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Upgrade logging' AUTO_INCREMENT=2944 ;

--
-- Dumping data for table `mdl_upgrade_log`
--

INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1, 0, 'core', '2012062502.04', '2012062502.04', 'Upgrade savepoint reached', NULL, '', 0, 1390393233),
(2, 0, 'core', '2012062502.04', '2012062502.04', 'Core installed', NULL, '', 0, 1390393235),
(3, 0, 'qtype_calculated', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393235),
(4, 0, 'qtype_calculated', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393236),
(5, 0, 'qtype_calculated', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393236),
(6, 0, 'qtype_calculatedmulti', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393236),
(7, 0, 'qtype_calculatedmulti', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393236),
(8, 0, 'qtype_calculatedmulti', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393236),
(9, 0, 'qtype_calculatedsimple', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393236),
(10, 0, 'qtype_calculatedsimple', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393236),
(11, 0, 'qtype_calculatedsimple', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393236),
(12, 0, 'qtype_description', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393236),
(13, 0, 'qtype_description', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393236),
(14, 0, 'qtype_description', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393236),
(15, 0, 'qtype_essay', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393236),
(16, 0, 'qtype_essay', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393236),
(17, 0, 'qtype_essay', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393236),
(18, 0, 'qtype_match', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393236),
(19, 0, 'qtype_match', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393237),
(20, 0, 'qtype_match', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393237),
(21, 0, 'qtype_missingtype', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393237),
(22, 0, 'qtype_missingtype', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393237),
(23, 0, 'qtype_missingtype', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393237),
(24, 0, 'qtype_multianswer', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393237),
(25, 0, 'qtype_multianswer', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393237),
(26, 0, 'qtype_multianswer', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393237),
(27, 0, 'qtype_multichoice', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393237),
(28, 0, 'qtype_multichoice', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393237),
(29, 0, 'qtype_multichoice', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393237),
(30, 0, 'qtype_numerical', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393237),
(31, 0, 'qtype_numerical', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393238),
(32, 0, 'qtype_numerical', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393238),
(33, 0, 'qtype_random', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393238),
(34, 0, 'qtype_random', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393238),
(35, 0, 'qtype_random', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393238),
(36, 0, 'qtype_randomsamatch', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393238),
(37, 0, 'qtype_randomsamatch', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393238),
(38, 0, 'qtype_randomsamatch', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393238),
(39, 0, 'qtype_shortanswer', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393238),
(40, 0, 'qtype_shortanswer', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393238),
(41, 0, 'qtype_shortanswer', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393238),
(42, 0, 'qtype_truefalse', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393238),
(43, 0, 'qtype_truefalse', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393239),
(44, 0, 'qtype_truefalse', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393239),
(45, 0, 'mod_assign', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393239),
(46, 0, 'mod_assign', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393240),
(47, 0, 'mod_assignment', NULL, '2012061701', 'Starting plugin installation', NULL, '', 0, 1390393240),
(48, 0, 'mod_assignment', '2012061701', '2012061701', 'Plugin installed', NULL, '', 0, 1390393240),
(49, 0, 'mod_book', NULL, '2012061702', 'Starting plugin installation', NULL, '', 0, 1390393240),
(50, 0, 'mod_book', '2012061702', '2012061702', 'Plugin installed', NULL, '', 0, 1390393240),
(51, 0, 'mod_certificate', NULL, '2012121302', 'Starting plugin installation', NULL, '', 0, 1390393240),
(52, 0, 'mod_certificate', '2012121302', '2012121302', 'Plugin installed', NULL, '', 0, 1390393241),
(53, 0, 'mod_chat', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393241),
(54, 0, 'mod_chat', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393242),
(55, 0, 'mod_choice', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393242),
(56, 0, 'mod_choice', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393242),
(57, 0, 'mod_data', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393242),
(58, 0, 'mod_data', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393243),
(59, 0, 'mod_feedback', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393243),
(60, 0, 'mod_feedback', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393245),
(61, 0, 'mod_folder', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393245),
(62, 0, 'mod_folder', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393245),
(63, 0, 'mod_forum', NULL, '2012061701', 'Starting plugin installation', NULL, '', 0, 1390393246),
(64, 0, 'mod_forum', '2012061701', '2012061701', 'Plugin installed', NULL, '', 0, 1390393247),
(65, 0, 'mod_glossary', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393247),
(66, 0, 'mod_glossary', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393249),
(67, 0, 'mod_imscp', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393249),
(68, 0, 'mod_imscp', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393249),
(69, 0, 'mod_label', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393249),
(70, 0, 'mod_label', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393249),
(71, 0, 'mod_lesson', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393249),
(72, 0, 'mod_lesson', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393250),
(73, 0, 'mod_lti', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393250),
(74, 0, 'mod_lti', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393251),
(75, 0, 'mod_page', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393251),
(76, 0, 'mod_page', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393252),
(77, 0, 'mod_quiz', NULL, '2012061703', 'Starting plugin installation', NULL, '', 0, 1390393252),
(78, 0, 'mod_quiz', '2012061703', '2012061703', 'Plugin installed', NULL, '', 0, 1390393253),
(79, 0, 'mod_resource', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393253),
(80, 0, 'mod_resource', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393254),
(81, 0, 'mod_scorm', NULL, '2012061701', 'Starting plugin installation', NULL, '', 0, 1390393254),
(82, 0, 'mod_scorm', '2012061701', '2012061701', 'Plugin installed', NULL, '', 0, 1390393257),
(83, 0, 'mod_survey', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393257),
(84, 0, 'mod_survey', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393258),
(85, 0, 'mod_url', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393258),
(86, 0, 'mod_url', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393259),
(87, 0, 'mod_wiki', NULL, '2012061701', 'Starting plugin installation', NULL, '', 0, 1390393259),
(88, 0, 'mod_wiki', '2012061701', '2012061701', 'Plugin installed', NULL, '', 0, 1390393260),
(89, 0, 'mod_workshop', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393260),
(90, 0, 'mod_workshop', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393264),
(91, 0, 'auth_cas', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393264),
(92, 0, 'auth_cas', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393264),
(93, 0, 'auth_cas', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393264),
(94, 0, 'auth_db', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393264),
(95, 0, 'auth_db', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393264),
(96, 0, 'auth_db', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393264),
(97, 0, 'auth_email', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393264),
(98, 0, 'auth_email', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393264),
(99, 0, 'auth_email', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393264),
(100, 0, 'auth_fc', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393264),
(101, 0, 'auth_fc', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393264),
(102, 0, 'auth_fc', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393264),
(103, 0, 'auth_imap', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393264),
(104, 0, 'auth_imap', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393264),
(105, 0, 'auth_imap', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393264),
(106, 0, 'auth_intake', NULL, '2012102000', 'Starting plugin installation', NULL, '', 0, 1390393264),
(107, 0, 'auth_intake', '2012102000', '2012102000', 'Upgrade savepoint reached', NULL, '', 0, 1390393264),
(108, 0, 'auth_intake', '2012102000', '2012102000', 'Plugin installed', NULL, '', 0, 1390393264),
(109, 0, 'auth_ldap', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393264),
(110, 0, 'auth_ldap', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393264),
(111, 0, 'auth_ldap', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393264),
(112, 0, 'auth_manual', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393264),
(113, 0, 'auth_manual', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393264),
(114, 0, 'auth_manual', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393264),
(115, 0, 'auth_mnet', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393264),
(116, 0, 'auth_mnet', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393264),
(117, 0, 'auth_mnet', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393265),
(118, 0, 'auth_nntp', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393265),
(119, 0, 'auth_nntp', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393265),
(120, 0, 'auth_nntp', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393265),
(121, 0, 'auth_nologin', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393265),
(122, 0, 'auth_nologin', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393265),
(123, 0, 'auth_nologin', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393265),
(124, 0, 'auth_none', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393265),
(125, 0, 'auth_none', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393265),
(126, 0, 'auth_none', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393265),
(127, 0, 'auth_pam', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393265),
(128, 0, 'auth_pam', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393265),
(129, 0, 'auth_pam', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393265),
(130, 0, 'auth_pop3', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393265),
(131, 0, 'auth_pop3', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393265),
(132, 0, 'auth_pop3', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393265),
(133, 0, 'auth_radius', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393265),
(134, 0, 'auth_radius', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393265),
(135, 0, 'auth_radius', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393265),
(136, 0, 'auth_shibboleth', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393265),
(137, 0, 'auth_shibboleth', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393265),
(138, 0, 'auth_shibboleth', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393265),
(139, 0, 'auth_webservice', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393265),
(140, 0, 'auth_webservice', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393265),
(141, 0, 'auth_webservice', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393265),
(142, 0, 'enrol_authorize', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393265),
(143, 0, 'enrol_authorize', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393266),
(144, 0, 'enrol_authorize', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393266),
(145, 0, 'enrol_category', NULL, '2012081800', 'Starting plugin installation', NULL, '', 0, 1390393266),
(146, 0, 'enrol_category', '2012081800', '2012081800', 'Upgrade savepoint reached', NULL, '', 0, 1390393266),
(147, 0, 'enrol_category', '2012081800', '2012081800', 'Plugin installed', NULL, '', 0, 1390393266),
(148, 0, 'enrol_cohort', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393266),
(149, 0, 'enrol_cohort', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393266),
(150, 0, 'enrol_cohort', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393266),
(151, 0, 'enrol_database', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393266),
(152, 0, 'enrol_database', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393266),
(153, 0, 'enrol_database', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393266),
(154, 0, 'enrol_flatfile', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393266),
(155, 0, 'enrol_flatfile', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393266),
(156, 0, 'enrol_flatfile', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393266),
(157, 0, 'enrol_guest', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393266),
(158, 0, 'enrol_guest', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393266),
(159, 0, 'enrol_guest', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393266),
(160, 0, 'enrol_imsenterprise', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393266),
(161, 0, 'enrol_imsenterprise', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393266),
(162, 0, 'enrol_imsenterprise', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393266),
(163, 0, 'enrol_ldap', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393266),
(164, 0, 'enrol_ldap', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393266),
(165, 0, 'enrol_ldap', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393267),
(166, 0, 'enrol_manual', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393267),
(167, 0, 'enrol_manual', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393267),
(168, 0, 'enrol_manual', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393267),
(169, 0, 'enrol_meta', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393267),
(170, 0, 'enrol_meta', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393267),
(171, 0, 'enrol_meta', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393267),
(172, 0, 'enrol_mnet', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393267),
(173, 0, 'enrol_mnet', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393267),
(174, 0, 'enrol_mnet', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393267),
(175, 0, 'enrol_paypal', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393267),
(176, 0, 'enrol_paypal', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393267),
(177, 0, 'enrol_paypal', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393267),
(178, 0, 'enrol_self', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393267),
(179, 0, 'enrol_self', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393267),
(180, 0, 'enrol_self', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393267),
(181, 0, 'message_email', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393267),
(182, 0, 'message_email', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393267),
(183, 0, 'message_email', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393267),
(184, 0, 'message_jabber', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393267),
(185, 0, 'message_jabber', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393267),
(186, 0, 'message_jabber', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393267),
(187, 0, 'message_popup', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393267),
(188, 0, 'message_popup', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393267),
(189, 0, 'message_popup', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(190, 0, 'block_activity_modules', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(191, 0, 'block_activity_modules', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(192, 0, 'block_admin_bookmarks', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(193, 0, 'block_admin_bookmarks', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(194, 0, 'block_blog_menu', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(195, 0, 'block_blog_menu', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(196, 0, 'block_blog_recent', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(197, 0, 'block_blog_recent', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(198, 0, 'block_blog_tags', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(199, 0, 'block_blog_tags', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(200, 0, 'block_calendar_month', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(201, 0, 'block_calendar_month', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(202, 0, 'block_calendar_upcoming', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(203, 0, 'block_calendar_upcoming', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(204, 0, 'block_comments', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(205, 0, 'block_comments', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(206, 0, 'block_community', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(207, 0, 'block_community', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(208, 0, 'block_completionstatus', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(209, 0, 'block_completionstatus', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(210, 0, 'block_course_list', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(211, 0, 'block_course_list', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(212, 0, 'block_course_overview', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(213, 0, 'block_course_overview', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(214, 0, 'block_course_summary', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(215, 0, 'block_course_summary', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(216, 0, 'block_feedback', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(217, 0, 'block_feedback', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(218, 0, 'block_glossary_random', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(219, 0, 'block_glossary_random', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(220, 0, 'block_html', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(221, 0, 'block_html', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393268),
(222, 0, 'block_login', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393268),
(223, 0, 'block_login', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(224, 0, 'block_mentees', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(225, 0, 'block_mentees', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(226, 0, 'block_messages', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(227, 0, 'block_messages', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(228, 0, 'block_mnet_hosts', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(229, 0, 'block_mnet_hosts', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(230, 0, 'block_myprofile', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(231, 0, 'block_myprofile', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(232, 0, 'block_navigation', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(233, 0, 'block_navigation', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(234, 0, 'block_news_items', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(235, 0, 'block_news_items', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(236, 0, 'block_online_users', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(237, 0, 'block_online_users', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(238, 0, 'block_participants', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(239, 0, 'block_participants', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(240, 0, 'block_private_files', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(241, 0, 'block_private_files', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(242, 0, 'block_quiz_results', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(243, 0, 'block_quiz_results', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(244, 0, 'block_recent_activity', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(245, 0, 'block_recent_activity', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(246, 0, 'block_rss_client', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(247, 0, 'block_rss_client', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(248, 0, 'block_search_forums', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(249, 0, 'block_search_forums', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(250, 0, 'block_section_links', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(251, 0, 'block_section_links', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(252, 0, 'block_selfcompletion', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(253, 0, 'block_selfcompletion', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(254, 0, 'block_settings', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(255, 0, 'block_settings', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(256, 0, 'block_site_main_menu', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(257, 0, 'block_site_main_menu', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(258, 0, 'block_social_activities', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(259, 0, 'block_social_activities', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(260, 0, 'block_tag_flickr', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393269),
(261, 0, 'block_tag_flickr', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393269),
(262, 0, 'block_tag_youtube', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(263, 0, 'block_tag_youtube', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393270),
(264, 0, 'block_tags', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(265, 0, 'block_tags', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393270),
(266, 0, 'block_tutorial', NULL, '2012100500', 'Starting plugin installation', NULL, '', 0, 1390393270),
(267, 0, 'block_tutorial', '2012100500', '2012100500', 'Plugin installed', NULL, '', 0, 1390393270),
(268, 0, 'filter_activitynames', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(269, 0, 'filter_activitynames', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393270),
(270, 0, 'filter_activitynames', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393270),
(271, 0, 'filter_algebra', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(272, 0, 'filter_algebra', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393270),
(273, 0, 'filter_algebra', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393270),
(274, 0, 'filter_censor', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(275, 0, 'filter_censor', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393270),
(276, 0, 'filter_censor', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393270),
(277, 0, 'filter_data', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(278, 0, 'filter_data', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393270),
(279, 0, 'filter_data', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393270),
(280, 0, 'filter_emailprotect', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(281, 0, 'filter_emailprotect', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393270),
(282, 0, 'filter_emailprotect', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393270),
(283, 0, 'filter_emoticon', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(284, 0, 'filter_emoticon', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393270),
(285, 0, 'filter_emoticon', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393270),
(286, 0, 'filter_glossary', NULL, '2012061701', 'Starting plugin installation', NULL, '', 0, 1390393270),
(287, 0, 'filter_glossary', '2012061701', '2012061701', 'Upgrade savepoint reached', NULL, '', 0, 1390393270),
(288, 0, 'filter_glossary', '2012061701', '2012061701', 'Plugin installed', NULL, '', 0, 1390393270),
(289, 0, 'filter_mediaplugin', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(290, 0, 'filter_mediaplugin', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393270),
(291, 0, 'filter_mediaplugin', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393270),
(292, 0, 'filter_multilang', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(293, 0, 'filter_multilang', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393270),
(294, 0, 'filter_multilang', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393270),
(295, 0, 'filter_tex', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(296, 0, 'filter_tex', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393270),
(297, 0, 'filter_tex', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393270),
(298, 0, 'filter_tidy', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(299, 0, 'filter_tidy', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393270),
(300, 0, 'filter_tidy', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393270),
(301, 0, 'filter_urltolink', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(302, 0, 'filter_urltolink', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393270),
(303, 0, 'filter_urltolink', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393270),
(304, 0, 'editor_textarea', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(305, 0, 'editor_textarea', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393270),
(306, 0, 'editor_textarea', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393270),
(307, 0, 'editor_tinymce', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(308, 0, 'editor_tinymce', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393270),
(309, 0, 'editor_tinymce', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393270),
(310, 0, 'format_scorm', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393270),
(311, 0, 'format_scorm', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393270),
(312, 0, 'format_scorm', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(313, 0, 'format_social', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(314, 0, 'format_social', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(315, 0, 'format_social', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(316, 0, 'format_topics', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(317, 0, 'format_topics', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(318, 0, 'format_topics', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(319, 0, 'format_weeks', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(320, 0, 'format_weeks', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(321, 0, 'format_weeks', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(322, 0, 'profilefield_checkbox', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(323, 0, 'profilefield_checkbox', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(324, 0, 'profilefield_checkbox', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(325, 0, 'profilefield_datetime', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(326, 0, 'profilefield_datetime', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(327, 0, 'profilefield_datetime', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(328, 0, 'profilefield_menu', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(329, 0, 'profilefield_menu', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(330, 0, 'profilefield_menu', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(331, 0, 'profilefield_text', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(332, 0, 'profilefield_text', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(333, 0, 'profilefield_text', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(334, 0, 'profilefield_textarea', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(335, 0, 'profilefield_textarea', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(336, 0, 'profilefield_textarea', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(337, 0, 'report_backups', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(338, 0, 'report_backups', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(339, 0, 'report_backups', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(340, 0, 'report_completion', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(341, 0, 'report_completion', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(342, 0, 'report_completion', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(343, 0, 'report_configlog', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(344, 0, 'report_configlog', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(345, 0, 'report_configlog', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(346, 0, 'report_courseoverview', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(347, 0, 'report_courseoverview', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(348, 0, 'report_courseoverview', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(349, 0, 'report_log', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(350, 0, 'report_log', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(351, 0, 'report_log', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(352, 0, 'report_loglive', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(353, 0, 'report_loglive', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(354, 0, 'report_loglive', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(355, 0, 'report_outline', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(356, 0, 'report_outline', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(357, 0, 'report_outline', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(358, 0, 'report_participation', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(359, 0, 'report_participation', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(360, 0, 'report_participation', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(361, 0, 'report_progress', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(362, 0, 'report_progress', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(363, 0, 'report_progress', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(364, 0, 'report_questioninstances', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(365, 0, 'report_questioninstances', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(366, 0, 'report_questioninstances', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(367, 0, 'report_security', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393271),
(368, 0, 'report_security', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393271),
(369, 0, 'report_security', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393271),
(370, 0, 'report_stats', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393272),
(371, 0, 'report_stats', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393272),
(372, 0, 'report_stats', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393272),
(373, 0, 'gradeexport_ods', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393272),
(374, 0, 'gradeexport_ods', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393272),
(375, 0, 'gradeexport_ods', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393272),
(376, 0, 'gradeexport_txt', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393272),
(377, 0, 'gradeexport_txt', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393272),
(378, 0, 'gradeexport_txt', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393272),
(379, 0, 'gradeexport_xls', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393272),
(380, 0, 'gradeexport_xls', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393272),
(381, 0, 'gradeexport_xls', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393272),
(382, 0, 'gradeexport_xml', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393272),
(383, 0, 'gradeexport_xml', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393272),
(384, 0, 'gradeexport_xml', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393272),
(385, 0, 'gradeimport_csv', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393272),
(386, 0, 'gradeimport_csv', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393272),
(387, 0, 'gradeimport_csv', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393272),
(388, 0, 'gradeimport_xml', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393272),
(389, 0, 'gradeimport_xml', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393272),
(390, 0, 'gradeimport_xml', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393272),
(391, 0, 'gradereport_grader', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393272),
(392, 0, 'gradereport_grader', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393272),
(393, 0, 'gradereport_grader', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393272),
(394, 0, 'gradereport_outcomes', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393272),
(395, 0, 'gradereport_outcomes', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393272),
(396, 0, 'gradereport_outcomes', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393272),
(397, 0, 'gradereport_overview', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393272),
(398, 0, 'gradereport_overview', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393272),
(399, 0, 'gradereport_overview', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393272),
(400, 0, 'gradereport_user', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393272),
(401, 0, 'gradereport_user', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393272),
(402, 0, 'gradereport_user', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393272),
(403, 0, 'gradingform_guide', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393272),
(404, 0, 'gradingform_guide', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393273),
(405, 0, 'gradingform_guide', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393273),
(406, 0, 'gradingform_rubric', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393273),
(407, 0, 'gradingform_rubric', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393273),
(408, 0, 'gradingform_rubric', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393273),
(409, 0, 'mnetservice_enrol', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393273),
(410, 0, 'mnetservice_enrol', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(411, 0, 'mnetservice_enrol', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393275),
(412, 0, 'webservice_amf', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393275),
(413, 0, 'webservice_amf', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(414, 0, 'webservice_amf', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393275),
(415, 0, 'webservice_rest', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393275),
(416, 0, 'webservice_rest', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(417, 0, 'webservice_rest', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393275),
(418, 0, 'webservice_soap', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393275),
(419, 0, 'webservice_soap', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(420, 0, 'webservice_soap', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393275),
(421, 0, 'webservice_xmlrpc', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393275),
(422, 0, 'webservice_xmlrpc', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(423, 0, 'webservice_xmlrpc', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393275),
(424, 0, 'repository_alfresco', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393275),
(425, 0, 'repository_alfresco', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(426, 0, 'repository_alfresco', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393275),
(427, 0, 'repository_boxnet', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393275),
(428, 0, 'repository_boxnet', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(429, 0, 'repository_boxnet', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393275),
(430, 0, 'repository_coursefiles', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393275),
(431, 0, 'repository_coursefiles', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(432, 0, 'repository_coursefiles', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393275),
(433, 0, 'repository_dropbox', NULL, '2012080702', 'Starting plugin installation', NULL, '', 0, 1390393275),
(434, 0, 'repository_dropbox', '2012080702', '2012080702', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(435, 0, 'repository_dropbox', '2012080702', '2012080702', 'Plugin installed', NULL, '', 0, 1390393275),
(436, 0, 'repository_equella', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393275),
(437, 0, 'repository_equella', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(438, 0, 'repository_equella', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393275),
(439, 0, 'repository_filesystem', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393275),
(440, 0, 'repository_filesystem', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(441, 0, 'repository_filesystem', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393275),
(442, 0, 'repository_flickr', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393275),
(443, 0, 'repository_flickr', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(444, 0, 'repository_flickr', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393275),
(445, 0, 'repository_flickr_public', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393275),
(446, 0, 'repository_flickr_public', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(447, 0, 'repository_flickr_public', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393275),
(448, 0, 'repository_googledocs', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393275),
(449, 0, 'repository_googledocs', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(450, 0, 'repository_googledocs', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393275),
(451, 0, 'repository_local', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393275),
(452, 0, 'repository_local', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(453, 0, 'repository_local', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393275),
(454, 0, 'repository_merlot', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393275),
(455, 0, 'repository_merlot', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(456, 0, 'repository_merlot', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393275),
(457, 0, 'repository_picasa', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393275),
(458, 0, 'repository_picasa', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393275),
(459, 0, 'repository_picasa', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393276),
(460, 0, 'repository_recent', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393276),
(461, 0, 'repository_recent', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393276),
(462, 0, 'repository_recent', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393276),
(463, 0, 'repository_s3', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393276),
(464, 0, 'repository_s3', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393276),
(465, 0, 'repository_s3', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393276),
(466, 0, 'repository_upload', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393276),
(467, 0, 'repository_upload', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393276),
(468, 0, 'repository_upload', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393276),
(469, 0, 'repository_url', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393276),
(470, 0, 'repository_url', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393276),
(471, 0, 'repository_url', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393276),
(472, 0, 'repository_user', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393276),
(473, 0, 'repository_user', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393276),
(474, 0, 'repository_user', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393276),
(475, 0, 'repository_webdav', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393276),
(476, 0, 'repository_webdav', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393276),
(477, 0, 'repository_webdav', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393276),
(478, 0, 'repository_wikimedia', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393276),
(479, 0, 'repository_wikimedia', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393276),
(480, 0, 'repository_wikimedia', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393276),
(481, 0, 'repository_youtube', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393276),
(482, 0, 'repository_youtube', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393276);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(483, 0, 'repository_youtube', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393276),
(484, 0, 'portfolio_boxnet', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393276),
(485, 0, 'portfolio_boxnet', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393276),
(486, 0, 'portfolio_boxnet', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393276),
(487, 0, 'portfolio_download', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393276),
(488, 0, 'portfolio_download', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393276),
(489, 0, 'portfolio_download', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393276),
(490, 0, 'portfolio_flickr', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393276),
(491, 0, 'portfolio_flickr', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393276),
(492, 0, 'portfolio_flickr', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393276),
(493, 0, 'portfolio_googledocs', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393276),
(494, 0, 'portfolio_googledocs', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393276),
(495, 0, 'portfolio_googledocs', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393276),
(496, 0, 'portfolio_mahara', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393276),
(497, 0, 'portfolio_mahara', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393276),
(498, 0, 'portfolio_mahara', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(499, 0, 'portfolio_picasa', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(500, 0, 'portfolio_picasa', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(501, 0, 'portfolio_picasa', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(502, 0, 'qbehaviour_adaptive', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(503, 0, 'qbehaviour_adaptive', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(504, 0, 'qbehaviour_adaptive', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(505, 0, 'qbehaviour_adaptivenopenalty', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(506, 0, 'qbehaviour_adaptivenopenalty', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(507, 0, 'qbehaviour_adaptivenopenalty', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(508, 0, 'qbehaviour_deferredcbm', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(509, 0, 'qbehaviour_deferredcbm', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(510, 0, 'qbehaviour_deferredcbm', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(511, 0, 'qbehaviour_deferredfeedback', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(512, 0, 'qbehaviour_deferredfeedback', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(513, 0, 'qbehaviour_deferredfeedback', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(514, 0, 'qbehaviour_immediatecbm', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(515, 0, 'qbehaviour_immediatecbm', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(516, 0, 'qbehaviour_immediatecbm', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(517, 0, 'qbehaviour_immediatefeedback', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(518, 0, 'qbehaviour_immediatefeedback', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(519, 0, 'qbehaviour_immediatefeedback', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(520, 0, 'qbehaviour_informationitem', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(521, 0, 'qbehaviour_informationitem', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(522, 0, 'qbehaviour_informationitem', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(523, 0, 'qbehaviour_interactive', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(524, 0, 'qbehaviour_interactive', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(525, 0, 'qbehaviour_interactive', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(526, 0, 'qbehaviour_interactivecountback', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(527, 0, 'qbehaviour_interactivecountback', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(528, 0, 'qbehaviour_interactivecountback', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(529, 0, 'qbehaviour_manualgraded', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(530, 0, 'qbehaviour_manualgraded', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(531, 0, 'qbehaviour_manualgraded', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(532, 0, 'qbehaviour_missing', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(533, 0, 'qbehaviour_missing', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(534, 0, 'qbehaviour_missing', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(535, 0, 'qformat_aiken', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(536, 0, 'qformat_aiken', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(537, 0, 'qformat_aiken', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(538, 0, 'qformat_blackboard', NULL, '2012061701', 'Starting plugin installation', NULL, '', 0, 1390393277),
(539, 0, 'qformat_blackboard', '2012061701', '2012061701', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(540, 0, 'qformat_blackboard', '2012061701', '2012061701', 'Plugin installed', NULL, '', 0, 1390393277),
(541, 0, 'qformat_blackboard_six', NULL, '2012061701', 'Starting plugin installation', NULL, '', 0, 1390393277),
(542, 0, 'qformat_blackboard_six', '2012061701', '2012061701', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(543, 0, 'qformat_blackboard_six', '2012061701', '2012061701', 'Plugin installed', NULL, '', 0, 1390393277),
(544, 0, 'qformat_examview', NULL, '2012061701', 'Starting plugin installation', NULL, '', 0, 1390393277),
(545, 0, 'qformat_examview', '2012061701', '2012061701', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(546, 0, 'qformat_examview', '2012061701', '2012061701', 'Plugin installed', NULL, '', 0, 1390393277),
(547, 0, 'qformat_gift', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(548, 0, 'qformat_gift', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(549, 0, 'qformat_gift', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(550, 0, 'qformat_learnwise', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(551, 0, 'qformat_learnwise', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(552, 0, 'qformat_learnwise', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(553, 0, 'qformat_missingword', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(554, 0, 'qformat_missingword', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(555, 0, 'qformat_missingword', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(556, 0, 'qformat_multianswer', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(557, 0, 'qformat_multianswer', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(558, 0, 'qformat_multianswer', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393277),
(559, 0, 'qformat_webct', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393277),
(560, 0, 'qformat_webct', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393277),
(561, 0, 'qformat_webct', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393278),
(562, 0, 'qformat_xhtml', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393278),
(563, 0, 'qformat_xhtml', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393278),
(564, 0, 'qformat_xhtml', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393278),
(565, 0, 'qformat_xml', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393278),
(566, 0, 'qformat_xml', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393278),
(567, 0, 'qformat_xml', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393278),
(568, 0, 'tool_assignmentupgrade', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393278),
(569, 0, 'tool_assignmentupgrade', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393278),
(570, 0, 'tool_assignmentupgrade', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393278),
(571, 0, 'tool_bloglevelupgrade', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393278),
(572, 0, 'tool_bloglevelupgrade', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393278),
(573, 0, 'tool_bloglevelupgrade', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393278),
(574, 0, 'tool_capability', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393278),
(575, 0, 'tool_capability', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393278),
(576, 0, 'tool_capability', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393278),
(577, 0, 'tool_customlang', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393278),
(578, 0, 'tool_customlang', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393278),
(579, 0, 'tool_customlang', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393278),
(580, 0, 'tool_dbtransfer', NULL, '2012062200', 'Starting plugin installation', NULL, '', 0, 1390393278),
(581, 0, 'tool_dbtransfer', '2012062200', '2012062200', 'Upgrade savepoint reached', NULL, '', 0, 1390393278),
(582, 0, 'tool_dbtransfer', '2012062200', '2012062200', 'Plugin installed', NULL, '', 0, 1390393278),
(583, 0, 'tool_generator', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393278),
(584, 0, 'tool_generator', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393278),
(585, 0, 'tool_generator', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393278),
(586, 0, 'tool_health', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393278),
(587, 0, 'tool_health', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393278),
(588, 0, 'tool_health', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393278),
(589, 0, 'tool_innodb', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393278),
(590, 0, 'tool_innodb', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393278),
(591, 0, 'tool_innodb', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393278),
(592, 0, 'tool_langimport', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393278),
(593, 0, 'tool_langimport', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393278),
(594, 0, 'tool_langimport', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393278),
(595, 0, 'tool_multilangupgrade', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393278),
(596, 0, 'tool_multilangupgrade', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393278),
(597, 0, 'tool_multilangupgrade', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393278),
(598, 0, 'tool_phpunit', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393278),
(599, 0, 'tool_phpunit', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393278),
(600, 0, 'tool_phpunit', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393278),
(601, 0, 'tool_profiling', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393278),
(602, 0, 'tool_profiling', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(603, 0, 'tool_profiling', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(604, 0, 'tool_qeupgradehelper', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(605, 0, 'tool_qeupgradehelper', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(606, 0, 'tool_qeupgradehelper', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(607, 0, 'tool_replace', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(608, 0, 'tool_replace', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(609, 0, 'tool_replace', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(610, 0, 'tool_spamcleaner', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(611, 0, 'tool_spamcleaner', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(612, 0, 'tool_spamcleaner', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(613, 0, 'tool_timezoneimport', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(614, 0, 'tool_timezoneimport', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(615, 0, 'tool_timezoneimport', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(616, 0, 'tool_unittest', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(617, 0, 'tool_unittest', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(618, 0, 'tool_unittest', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(619, 0, 'tool_unsuproles', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(620, 0, 'tool_unsuproles', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(621, 0, 'tool_unsuproles', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(622, 0, 'tool_uploaduser', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(623, 0, 'tool_uploaduser', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(624, 0, 'tool_uploaduser', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(625, 0, 'tool_xmldb', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(626, 0, 'tool_xmldb', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(627, 0, 'tool_xmldb', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(628, 0, 'theme_afterburner', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(629, 0, 'theme_afterburner', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(630, 0, 'theme_afterburner', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(631, 0, 'theme_anomaly', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(632, 0, 'theme_anomaly', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(633, 0, 'theme_anomaly', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(634, 0, 'theme_arialist', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(635, 0, 'theme_arialist', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(636, 0, 'theme_arialist', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(637, 0, 'theme_base', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(638, 0, 'theme_base', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(639, 0, 'theme_base', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(640, 0, 'theme_binarius', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(641, 0, 'theme_binarius', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(642, 0, 'theme_binarius', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(643, 0, 'theme_boxxie', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(644, 0, 'theme_boxxie', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(645, 0, 'theme_boxxie', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(646, 0, 'theme_brick', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(647, 0, 'theme_brick', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(648, 0, 'theme_brick', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(649, 0, 'theme_canvas', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(650, 0, 'theme_canvas', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(651, 0, 'theme_canvas', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(652, 0, 'theme_formal_white', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(653, 0, 'theme_formal_white', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(654, 0, 'theme_formal_white', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(655, 0, 'theme_formfactor', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(656, 0, 'theme_formfactor', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(657, 0, 'theme_formfactor', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(658, 0, 'theme_fusion', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(659, 0, 'theme_fusion', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(660, 0, 'theme_fusion', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393279),
(661, 0, 'theme_leatherbound', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393279),
(662, 0, 'theme_leatherbound', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393279),
(663, 0, 'theme_leatherbound', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393280),
(664, 0, 'theme_magazine', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393280),
(665, 0, 'theme_magazine', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393280),
(666, 0, 'theme_magazine', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393280),
(667, 0, 'theme_mymobile', NULL, '2012061901', 'Starting plugin installation', NULL, '', 0, 1390393280),
(668, 0, 'theme_mymobile', '2012061901', '2012061901', 'Upgrade savepoint reached', NULL, '', 0, 1390393280),
(669, 0, 'theme_mymobile', '2012061901', '2012061901', 'Plugin installed', NULL, '', 0, 1390393280),
(670, 0, 'theme_nimble', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393280),
(671, 0, 'theme_nimble', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393280),
(672, 0, 'theme_nimble', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393280),
(673, 0, 'theme_nonzero', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393280),
(674, 0, 'theme_nonzero', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393280),
(675, 0, 'theme_nonzero', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393280),
(676, 0, 'theme_overlay', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393280),
(677, 0, 'theme_overlay', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393280),
(678, 0, 'theme_overlay', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393280),
(679, 0, 'theme_serenity', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393280),
(680, 0, 'theme_serenity', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393280),
(681, 0, 'theme_serenity', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393280),
(682, 0, 'theme_sky_high', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393280),
(683, 0, 'theme_sky_high', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393280),
(684, 0, 'theme_sky_high', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393280),
(685, 0, 'theme_splash', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393280),
(686, 0, 'theme_splash', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393280),
(687, 0, 'theme_splash', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393280),
(688, 0, 'theme_standard', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393280),
(689, 0, 'theme_standard', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393280),
(690, 0, 'theme_standard', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393280),
(691, 0, 'theme_standardold', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393280),
(692, 0, 'theme_standardold', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393280),
(693, 0, 'theme_standardold', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393280),
(694, 0, 'assignsubmission_comments', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393280),
(695, 0, 'assignsubmission_comments', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393280),
(696, 0, 'assignsubmission_comments', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393280),
(697, 0, 'assignsubmission_file', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393280),
(698, 0, 'assignsubmission_file', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393280),
(699, 0, 'assignsubmission_file', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393280),
(700, 0, 'assignsubmission_onlinetext', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393280),
(701, 0, 'assignsubmission_onlinetext', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393280),
(702, 0, 'assignsubmission_onlinetext', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393280),
(703, 0, 'assignfeedback_comments', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393280),
(704, 0, 'assignfeedback_comments', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393281),
(705, 0, 'assignfeedback_comments', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393281),
(706, 0, 'assignfeedback_file', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393281),
(707, 0, 'assignfeedback_file', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393281),
(708, 0, 'assignfeedback_file', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393281),
(709, 0, 'assignment_offline', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393281),
(710, 0, 'assignment_offline', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393281),
(711, 0, 'assignment_offline', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393281),
(712, 0, 'assignment_online', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393281),
(713, 0, 'assignment_online', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393281),
(714, 0, 'assignment_online', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393281),
(715, 0, 'assignment_upload', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393281),
(716, 0, 'assignment_upload', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393281),
(717, 0, 'assignment_upload', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393281),
(718, 0, 'assignment_uploadsingle', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393281),
(719, 0, 'assignment_uploadsingle', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393281),
(720, 0, 'assignment_uploadsingle', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393281),
(721, 0, 'booktool_exportimscp', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393281),
(722, 0, 'booktool_exportimscp', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393281),
(723, 0, 'booktool_exportimscp', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(724, 0, 'booktool_importhtml', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(725, 0, 'booktool_importhtml', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(726, 0, 'booktool_importhtml', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(727, 0, 'booktool_print', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(728, 0, 'booktool_print', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(729, 0, 'booktool_print', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(730, 0, 'datafield_checkbox', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(731, 0, 'datafield_checkbox', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(732, 0, 'datafield_checkbox', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(733, 0, 'datafield_date', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(734, 0, 'datafield_date', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(735, 0, 'datafield_date', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(736, 0, 'datafield_file', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(737, 0, 'datafield_file', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(738, 0, 'datafield_file', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(739, 0, 'datafield_latlong', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(740, 0, 'datafield_latlong', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(741, 0, 'datafield_latlong', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(742, 0, 'datafield_menu', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(743, 0, 'datafield_menu', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(744, 0, 'datafield_menu', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(745, 0, 'datafield_multimenu', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(746, 0, 'datafield_multimenu', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(747, 0, 'datafield_multimenu', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(748, 0, 'datafield_number', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(749, 0, 'datafield_number', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(750, 0, 'datafield_number', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(751, 0, 'datafield_picture', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(752, 0, 'datafield_picture', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(753, 0, 'datafield_picture', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(754, 0, 'datafield_radiobutton', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(755, 0, 'datafield_radiobutton', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(756, 0, 'datafield_radiobutton', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(757, 0, 'datafield_text', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(758, 0, 'datafield_text', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(759, 0, 'datafield_text', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(760, 0, 'datafield_textarea', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(761, 0, 'datafield_textarea', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(762, 0, 'datafield_textarea', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(763, 0, 'datafield_url', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(764, 0, 'datafield_url', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(765, 0, 'datafield_url', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(766, 0, 'datapreset_imagegallery', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(767, 0, 'datapreset_imagegallery', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(768, 0, 'datapreset_imagegallery', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(769, 0, 'quiz_grading', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(770, 0, 'quiz_grading', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(771, 0, 'quiz_grading', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(772, 0, 'quiz_overview', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(773, 0, 'quiz_overview', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(774, 0, 'quiz_overview', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393282),
(775, 0, 'quiz_responses', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393282),
(776, 0, 'quiz_responses', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393282),
(777, 0, 'quiz_responses', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393283),
(778, 0, 'quiz_statistics', NULL, '2012061801', 'Starting plugin installation', NULL, '', 0, 1390393283),
(779, 0, 'quiz_statistics', '2012061801', '2012061801', 'Upgrade savepoint reached', NULL, '', 0, 1390393283),
(780, 0, 'quiz_statistics', '2012061801', '2012061801', 'Plugin installed', NULL, '', 0, 1390393283),
(781, 0, 'quizaccess_delaybetweenattempts', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393283),
(782, 0, 'quizaccess_delaybetweenattempts', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393283),
(783, 0, 'quizaccess_delaybetweenattempts', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393283),
(784, 0, 'quizaccess_ipaddress', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393283),
(785, 0, 'quizaccess_ipaddress', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393283),
(786, 0, 'quizaccess_ipaddress', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393283),
(787, 0, 'quizaccess_numattempts', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393283),
(788, 0, 'quizaccess_numattempts', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393283),
(789, 0, 'quizaccess_numattempts', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393283),
(790, 0, 'quizaccess_openclosedate', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393283),
(791, 0, 'quizaccess_openclosedate', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393283),
(792, 0, 'quizaccess_openclosedate', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393283),
(793, 0, 'quizaccess_password', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393283),
(794, 0, 'quizaccess_password', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393283),
(795, 0, 'quizaccess_password', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393283),
(796, 0, 'quizaccess_safebrowser', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393283),
(797, 0, 'quizaccess_safebrowser', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393283),
(798, 0, 'quizaccess_safebrowser', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393283),
(799, 0, 'quizaccess_securewindow', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393283),
(800, 0, 'quizaccess_securewindow', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393283),
(801, 0, 'quizaccess_securewindow', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393283),
(802, 0, 'quizaccess_timelimit', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393283),
(803, 0, 'quizaccess_timelimit', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393283),
(804, 0, 'quizaccess_timelimit', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393283),
(805, 0, 'scormreport_basic', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393283),
(806, 0, 'scormreport_basic', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393283),
(807, 0, 'scormreport_basic', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393283),
(808, 0, 'scormreport_graphs', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393283),
(809, 0, 'scormreport_graphs', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393283),
(810, 0, 'scormreport_graphs', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393283),
(811, 0, 'scormreport_interactions', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393283),
(812, 0, 'scormreport_interactions', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393283),
(813, 0, 'scormreport_interactions', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393284),
(814, 0, 'workshopform_accumulative', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393284),
(815, 0, 'workshopform_accumulative', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393284),
(816, 0, 'workshopform_accumulative', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393284),
(817, 0, 'workshopform_comments', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393284),
(818, 0, 'workshopform_comments', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393284),
(819, 0, 'workshopform_comments', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393284),
(820, 0, 'workshopform_numerrors', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393284),
(821, 0, 'workshopform_numerrors', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393284),
(822, 0, 'workshopform_numerrors', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393284),
(823, 0, 'workshopform_rubric', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393284),
(824, 0, 'workshopform_rubric', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393285),
(825, 0, 'workshopform_rubric', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393285),
(826, 0, 'workshopallocation_manual', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393285),
(827, 0, 'workshopallocation_manual', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393285),
(828, 0, 'workshopallocation_manual', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393286),
(829, 0, 'workshopallocation_random', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393286),
(830, 0, 'workshopallocation_random', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393286),
(831, 0, 'workshopallocation_random', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393286),
(832, 0, 'workshopallocation_scheduled', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393286),
(833, 0, 'workshopallocation_scheduled', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393286),
(834, 0, 'workshopallocation_scheduled', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393286),
(835, 0, 'workshopeval_best', NULL, '2012061700', 'Starting plugin installation', NULL, '', 0, 1390393286),
(836, 0, 'workshopeval_best', '2012061700', '2012061700', 'Upgrade savepoint reached', NULL, '', 0, 1390393286),
(837, 0, 'workshopeval_best', '2012061700', '2012061700', 'Plugin installed', NULL, '', 0, 1390393286),
(838, 0, 'local_soda', NULL, '2012103101', 'Starting plugin installation', NULL, '', 2, 1390821178),
(839, 0, 'local_soda', '2012103101', '2012103101', 'Upgrade savepoint reached', NULL, '', 2, 1390821179),
(840, 0, 'local_soda', '2012103101', '2012103101', 'Plugin installed', NULL, '', 2, 1390821179),
(841, 0, 'local_repeatcourses', NULL, '2012103101', 'Starting plugin installation', NULL, '', 2, 1390821311),
(842, 0, 'local_repeatcourses', '2012103101', '2012103101', 'Upgrade savepoint reached', NULL, '', 2, 1390821311),
(843, 0, 'local_repeatcourses', '2012103101', '2012103101', 'Plugin installed', NULL, '', 2, 1390821311),
(844, 0, 'local_repeatcourse', NULL, '2012103101', 'Starting plugin installation', NULL, '', 2, 1390822148),
(845, 0, 'local_repeatcourse', '2012103101', '2012103101', 'Upgrade savepoint reached', NULL, '', 2, 1390822148),
(846, 0, 'local_repeatcourse', '2012103101', '2012103101', 'Plugin installed', NULL, '', 2, 1390822148),
(847, 0, 'local_soda', NULL, '2012103101', 'Starting plugin installation', NULL, '', 2, 1390824666),
(848, 0, 'local_soda', '2012103101', '2012103101', 'Upgrade savepoint reached', NULL, '', 2, 1390824666),
(849, 0, 'local_soda', '2012103101', '2012103101', 'Plugin installed', NULL, '', 2, 1390824667),
(850, 0, 'mod_repeatcourse', NULL, 'DATE_VERSION', 'Starting plugin installation', NULL, '', 2, 1390831558),
(851, 2, 'core', '2012062502.04', '2012062502.04', 'Exception: dml_write_exception', 'Error writing to database', '* line 410 of \\lib\\dml\\moodle_database.php: dml_write_exception thrown\n* line 1050 of \\lib\\dml\\mysqli_native_moodle_database.php: call to moodle_database->query_end()\n* line 1092 of \\lib\\dml\\mysqli_native_moodle_database.php: call to mysqli_native_moodle_database->insert_record_raw()\n* line 597 of \\lib\\upgradelib.php: call to mysqli_native_moodle_database->insert_record()\n* line 358 of \\lib\\upgradelib.php: call to upgrade_plugins_modules()\n* line 1524 of \\lib\\upgradelib.php: call to upgrade_plugins()\n* line 329 of \\admin\\index.php: call to upgrade_noncore()\n', 2, 1390831558),
(852, 0, 'mod_repeatcourse', NULL, '2014012700', 'Starting plugin installation', NULL, '', 2, 1390831623),
(853, 2, 'core', '2012062502.04', '2012062502.04', 'Exception: ddl_change_structure_exception', 'DDL sql execution error', '* line 413 of \\lib\\dml\\moodle_database.php: ddl_change_structure_exception thrown\n* line 803 of \\lib\\dml\\mysqli_native_moodle_database.php: call to moodle_database->query_end()\n* line 88 of \\lib\\ddl\\database_manager.php: call to mysqli_native_moodle_database->change_database_structure()\n* line 77 of \\lib\\ddl\\database_manager.php: call to database_manager->execute_sql()\n* line 404 of \\lib\\ddl\\database_manager.php: call to database_manager->execute_sql_arr()\n* line 356 of \\lib\\ddl\\database_manager.php: call to database_manager->install_from_xmldb_structure()\n* line 594 of \\lib\\upgradelib.php: call to database_manager->install_from_xmldb_file()\n* line 358 of \\lib\\upgradelib.php: call to upgrade_plugins_modules()\n* line 1524 of \\lib\\upgradelib.php: call to upgrade_plugins()\n* line 329 of \\admin\\index.php: call to upgrade_noncore()\n', 2, 1390831623),
(854, 0, 'mod_repeatcourse', NULL, '2014012700', 'Starting plugin installation', NULL, '', 2, 1390831700),
(855, 0, 'mod_repeatcourse', '2014012700', '2014012700', 'Plugin installed', NULL, '', 2, 1390831700),
(856, 0, 'core', '2012062502.04', '2013051404.03', 'Starting core upgrade', NULL, '', 2, 1390919373),
(857, 0, 'core', '2012070600.04', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919374),
(858, 0, 'core', '2012070600.05', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919374),
(859, 0, 'core', '2012070600.06', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919375),
(860, 0, 'core', '2012070600.07', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919375),
(861, 0, 'core', '2012070600.08', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919375),
(862, 0, 'core', '2012070600.09', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919375),
(863, 0, 'core', '2012070600.1', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919375),
(864, 0, 'core', '2012070600.11', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919375),
(865, 0, 'core', '2012071900.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919375),
(866, 0, 'core', '2012072400', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919375),
(867, 0, 'core', '2012072401', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919375),
(868, 0, 'core', '2012072600.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919375),
(869, 0, 'core', '2012080200.02', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919375),
(870, 0, 'core', '2012081400.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919375),
(871, 0, 'core', '2012081600.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919375),
(872, 0, 'core', '2012082300.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919377),
(873, 0, 'core', '2012082300.02', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919377),
(874, 0, 'core', '2012090500', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919377),
(875, 0, 'core', '2012090700.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919377),
(876, 0, 'core', '2012091700', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919378),
(877, 0, 'core', '2012092100.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919378),
(878, 0, 'core', '2012092600', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919378),
(879, 0, 'core', '2012101500.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919378),
(880, 0, 'core', '2012101800.02', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919378),
(881, 0, 'core', '2012103001', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919378),
(882, 0, 'core', '2012103002', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919378),
(883, 0, 'core', '2012103003', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919379),
(884, 0, 'core', '2012110200', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919379),
(885, 0, 'core', '2012110201', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919379),
(886, 0, 'core', '2012110700.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919380),
(887, 0, 'core', '2012111200', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919380),
(888, 0, 'core', '2012111200.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919380),
(889, 0, 'core', '2012111601.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919380),
(890, 0, 'core', '2012112100', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919380),
(891, 0, 'core', '2012120300.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919380),
(892, 0, 'core', '2012120300.04', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919380),
(893, 0, 'core', '2012123000', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919380),
(894, 0, 'core', '2013021100.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919381),
(895, 0, 'core', '2013021800', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919381),
(896, 0, 'core', '2013021801', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919381),
(897, 0, 'core', '2013021801.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919381),
(898, 0, 'core', '2013021902', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919381),
(899, 0, 'core', '2013022600', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919381),
(900, 0, 'core', '2013030400', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919381),
(901, 0, 'core', '2013030400.02', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919381),
(902, 0, 'core', '2013032200.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919381),
(903, 0, 'core', '2013032600.03', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919381),
(904, 0, 'core', '2013032600.04', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919381),
(905, 0, 'core', '2013040200', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919382),
(906, 0, 'core', '2013040201', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919382),
(907, 0, 'core', '2013040300.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919382),
(908, 0, 'core', '2013041200', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919382),
(909, 0, 'core', '2013041600', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919383),
(910, 0, 'core', '2013041601', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919383),
(911, 0, 'core', '2013041601.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919383),
(912, 0, 'core', '2013041900', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919383),
(913, 0, 'core', '2013042300', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919383),
(914, 0, 'core', '2013051400.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919383),
(915, 0, 'core', '2013051400.06', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919383),
(916, 0, 'core', '2013051401.01', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919383),
(917, 0, 'core', '2013051402.06', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919383),
(918, 0, 'core', '2013051402.1', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919383),
(919, 0, 'core', '2013051402.12', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919383),
(920, 0, 'core', '2013051403.02', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919383),
(921, 0, 'core', '2013051403.09', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919383),
(922, 0, 'core', '2013051404.02', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919383),
(923, 0, 'core', '2013051404.03', '2013051404.03', 'Upgrade savepoint reached', NULL, '', 2, 1390919383),
(924, 0, 'core', '2013051404.03', '2013051404.03', 'Core upgraded', NULL, '', 2, 1390919385),
(925, 0, 'qtype_calculated', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919385),
(926, 0, 'qtype_calculated', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919385),
(927, 0, 'qtype_calculated', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919385),
(928, 0, 'qtype_calculatedmulti', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919385),
(929, 0, 'qtype_calculatedmulti', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919385),
(930, 0, 'qtype_calculatedmulti', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919385),
(931, 0, 'qtype_calculatedsimple', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919385),
(932, 0, 'qtype_calculatedsimple', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919385),
(933, 0, 'qtype_calculatedsimple', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919385),
(934, 0, 'qtype_description', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919385),
(935, 0, 'qtype_description', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919385),
(936, 0, 'qtype_description', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919385);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(937, 0, 'qtype_essay', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919385),
(938, 0, 'qtype_essay', '2013011800', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919386),
(939, 0, 'qtype_essay', '2013021700', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919386),
(940, 0, 'qtype_essay', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919386),
(941, 0, 'qtype_essay', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919386),
(942, 0, 'qtype_match', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919386),
(943, 0, 'qtype_match', '2013012099', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919386),
(944, 0, 'qtype_match', '2013012100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919386),
(945, 0, 'qtype_match', '2013012101', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919386),
(946, 0, 'qtype_match', '2013012102', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919387),
(947, 0, 'qtype_match', '2013012103', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919387),
(948, 0, 'qtype_match', '2013012104', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919387),
(949, 0, 'qtype_match', '2013012105', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919387),
(950, 0, 'qtype_match', '2013012106', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919387),
(951, 0, 'qtype_match', '2013012107', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919387),
(952, 0, 'qtype_match', '2013012108', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919387),
(953, 0, 'qtype_match', '2013012109', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919387),
(954, 0, 'qtype_match', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919388),
(955, 0, 'qtype_match', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919388),
(956, 0, 'qtype_missingtype', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919388),
(957, 0, 'qtype_missingtype', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919388),
(958, 0, 'qtype_missingtype', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919388),
(959, 0, 'qtype_multianswer', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919388),
(960, 0, 'qtype_multianswer', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919388),
(961, 0, 'qtype_multianswer', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919388),
(962, 0, 'qtype_multichoice', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919388),
(963, 0, 'qtype_multichoice', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919388),
(964, 0, 'qtype_multichoice', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919388),
(965, 0, 'qtype_numerical', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919388),
(966, 0, 'qtype_numerical', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919388),
(967, 0, 'qtype_numerical', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919389),
(968, 0, 'qtype_random', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919389),
(969, 0, 'qtype_random', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919389),
(970, 0, 'qtype_random', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919389),
(971, 0, 'qtype_randomsamatch', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919389),
(972, 0, 'qtype_randomsamatch', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919389),
(973, 0, 'qtype_randomsamatch', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919389),
(974, 0, 'qtype_shortanswer', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919389),
(975, 0, 'qtype_shortanswer', '2013011799', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919389),
(976, 0, 'qtype_shortanswer', '2013011800', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919389),
(977, 0, 'qtype_shortanswer', '2013011801', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919389),
(978, 0, 'qtype_shortanswer', '2013011802', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919390),
(979, 0, 'qtype_shortanswer', '2013011803', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919390),
(980, 0, 'qtype_shortanswer', '2013011804', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919390),
(981, 0, 'qtype_shortanswer', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919390),
(982, 0, 'qtype_shortanswer', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919390),
(983, 0, 'qtype_truefalse', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919390),
(984, 0, 'qtype_truefalse', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919390),
(985, 0, 'qtype_truefalse', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919390),
(986, 0, 'mod_assign', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919390),
(987, 0, 'mod_assign', '2012071800', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919391),
(988, 0, 'mod_assign', '2012081600', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919391),
(989, 0, 'mod_assign', '2012082100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919391),
(990, 0, 'mod_assign', '2012082300', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919392),
(991, 0, 'mod_assign', '2012082400', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919392),
(992, 0, 'mod_assign', '2013030600', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919395),
(993, 0, 'mod_assign', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919395),
(994, 0, 'mod_assign', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919395),
(995, 0, 'mod_assignment', '2012061701', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919395),
(996, 0, 'mod_assignment', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919395),
(997, 0, 'mod_assignment', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919395),
(998, 0, 'mod_book', '2012061702', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919395),
(999, 0, 'mod_book', '2012090401', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919395),
(1000, 0, 'mod_book', '2012090402', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919395),
(1001, 0, 'mod_book', '2012090403', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919395),
(1002, 0, 'mod_book', '2012090404', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919395),
(1003, 0, 'mod_book', '2012090405', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919395),
(1004, 0, 'mod_book', '2012090406', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919395),
(1005, 0, 'mod_book', '2012090407', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919395),
(1006, 0, 'mod_book', '2012090408', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919395),
(1007, 0, 'mod_book', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919395),
(1008, 0, 'mod_book', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919396),
(1009, 0, 'mod_chat', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919396),
(1010, 0, 'mod_chat', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919396),
(1011, 0, 'mod_chat', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919396),
(1012, 0, 'mod_choice', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919396),
(1013, 0, 'mod_choice', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919396),
(1014, 0, 'mod_choice', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919396),
(1015, 0, 'mod_data', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919396),
(1016, 0, 'mod_data', '2012112901', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919396),
(1017, 0, 'mod_data', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919396),
(1018, 0, 'mod_data', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919396),
(1019, 0, 'mod_feedback', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919396),
(1020, 0, 'mod_feedback', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919396),
(1021, 0, 'mod_feedback', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919396),
(1022, 0, 'mod_folder', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919396),
(1023, 0, 'mod_folder', '2013012100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919397),
(1024, 0, 'mod_folder', '2013031500', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919397),
(1025, 0, 'mod_folder', '2013040700', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919397),
(1026, 0, 'mod_folder', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919397),
(1027, 0, 'mod_folder', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919397),
(1028, 0, 'mod_forum', '2012061701', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919397),
(1029, 0, 'mod_forum', '2013020500', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919397),
(1030, 0, 'mod_forum', '2013021200', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919397),
(1031, 0, 'mod_forum', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919397),
(1032, 0, 'mod_forum', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919398),
(1033, 0, 'mod_glossary', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919398),
(1034, 0, 'mod_glossary', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919398),
(1035, 0, 'mod_glossary', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919398),
(1036, 0, 'mod_imscp', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919398),
(1037, 0, 'mod_imscp', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919398),
(1038, 0, 'mod_imscp', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919398),
(1039, 0, 'mod_label', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919398),
(1040, 0, 'mod_label', '2013021400', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919398),
(1041, 0, 'mod_label', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919398),
(1042, 0, 'mod_label', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919399),
(1043, 0, 'mod_lesson', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919399),
(1044, 0, 'mod_lesson', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919399),
(1045, 0, 'mod_lesson', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919399),
(1046, 0, 'mod_lti', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919399),
(1047, 0, 'mod_lti', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919399),
(1048, 0, 'mod_lti', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919399),
(1049, 0, 'mod_page', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919399),
(1050, 0, 'mod_page', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919399),
(1051, 0, 'mod_page', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919399),
(1052, 0, 'mod_quiz', '2012061703', '2013050101', 'Starting plugin upgrade', NULL, '', 2, 1390919399),
(1053, 0, 'mod_quiz', '2012100801', '2013050101', 'Upgrade savepoint reached', NULL, '', 2, 1390919399),
(1054, 0, 'mod_quiz', '2013031900', '2013050101', 'Upgrade savepoint reached', NULL, '', 2, 1390919399),
(1055, 0, 'mod_quiz', '2013050101', '2013050101', 'Upgrade savepoint reached', NULL, '', 2, 1390919399),
(1056, 0, 'mod_quiz', '2013050101', '2013050101', 'Plugin upgraded', NULL, '', 2, 1390919400),
(1057, 0, 'mod_resource', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919400),
(1058, 0, 'mod_resource', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919400),
(1059, 0, 'mod_resource', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919400),
(1060, 0, 'mod_scorm', '2012061701', '2013050103', 'Starting plugin upgrade', NULL, '', 2, 1390919400),
(1061, 0, 'mod_scorm', '2013050101', '2013050103', 'Upgrade savepoint reached', NULL, '', 2, 1390919400),
(1062, 0, 'mod_scorm', '2013050102', '2013050103', 'Upgrade savepoint reached', NULL, '', 2, 1390919400),
(1063, 0, 'mod_scorm', '2013050103', '2013050103', 'Upgrade savepoint reached', NULL, '', 2, 1390919400),
(1064, 0, 'mod_scorm', '2013050103', '2013050103', 'Plugin upgraded', NULL, '', 2, 1390919400),
(1065, 0, 'mod_survey', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919400),
(1066, 0, 'mod_survey', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919400),
(1067, 0, 'mod_survey', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919400),
(1068, 0, 'mod_url', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919400),
(1069, 0, 'mod_url', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919400),
(1070, 0, 'mod_url', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919400),
(1071, 0, 'mod_wiki', '2012061701', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919400),
(1072, 0, 'mod_wiki', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919401),
(1073, 0, 'mod_wiki', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919401),
(1074, 0, 'mod_workshop', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919401),
(1075, 0, 'mod_workshop', '2012102400', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919401),
(1076, 0, 'mod_workshop', '2013032500', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919402),
(1077, 0, 'mod_workshop', '2013032501', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919402),
(1078, 0, 'mod_workshop', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919402),
(1079, 0, 'mod_workshop', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919402),
(1080, 0, 'auth_cas', '2012061700', '2013052100', 'Starting plugin upgrade', NULL, '', 2, 1390919402),
(1081, 0, 'auth_cas', '2013052100', '2013052100', 'Upgrade savepoint reached', NULL, '', 2, 1390919402),
(1082, 0, 'auth_cas', '2013052100', '2013052100', 'Plugin upgraded', NULL, '', 2, 1390919402),
(1083, 0, 'auth_db', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919402),
(1084, 0, 'auth_db', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919402),
(1085, 0, 'auth_db', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919402),
(1086, 0, 'auth_email', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919402),
(1087, 0, 'auth_email', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919402),
(1088, 0, 'auth_email', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919403),
(1089, 0, 'auth_fc', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919403),
(1090, 0, 'auth_fc', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919403),
(1091, 0, 'auth_fc', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919403),
(1092, 0, 'auth_imap', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919403),
(1093, 0, 'auth_imap', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919403),
(1094, 0, 'auth_imap', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919403),
(1095, 0, 'auth_ldap', '2012061700', '2013052100', 'Starting plugin upgrade', NULL, '', 2, 1390919403),
(1096, 0, 'auth_ldap', '2013052100', '2013052100', 'Upgrade savepoint reached', NULL, '', 2, 1390919403),
(1097, 0, 'auth_ldap', '2013052100', '2013052100', 'Plugin upgraded', NULL, '', 2, 1390919404),
(1098, 0, 'auth_manual', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919404),
(1099, 0, 'auth_manual', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919404),
(1100, 0, 'auth_manual', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919404),
(1101, 0, 'auth_mnet', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919404),
(1102, 0, 'auth_mnet', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919404),
(1103, 0, 'auth_mnet', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919404),
(1104, 0, 'auth_nntp', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919405),
(1105, 0, 'auth_nntp', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919405),
(1106, 0, 'auth_nntp', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919405),
(1107, 0, 'auth_nologin', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919405),
(1108, 0, 'auth_nologin', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919405),
(1109, 0, 'auth_nologin', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919405),
(1110, 0, 'auth_none', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919405),
(1111, 0, 'auth_none', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919405),
(1112, 0, 'auth_none', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919405),
(1113, 0, 'auth_pam', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919405),
(1114, 0, 'auth_pam', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919405),
(1115, 0, 'auth_pam', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919405),
(1116, 0, 'auth_pop3', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919405),
(1117, 0, 'auth_pop3', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919405),
(1118, 0, 'auth_pop3', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919406),
(1119, 0, 'auth_radius', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919406),
(1120, 0, 'auth_radius', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919406),
(1121, 0, 'auth_radius', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919406),
(1122, 0, 'auth_shibboleth', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919406),
(1123, 0, 'auth_shibboleth', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919406),
(1124, 0, 'auth_shibboleth', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919406),
(1125, 0, 'auth_webservice', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919406),
(1126, 0, 'auth_webservice', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919406),
(1127, 0, 'auth_webservice', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919406),
(1128, 0, 'enrol_authorize', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919406),
(1129, 0, 'enrol_authorize', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919406),
(1130, 0, 'enrol_authorize', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919407),
(1131, 0, 'enrol_category', '2012081800', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919407),
(1132, 0, 'enrol_category', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919407),
(1133, 0, 'enrol_category', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919407),
(1134, 0, 'enrol_cohort', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919407),
(1135, 0, 'enrol_cohort', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919407),
(1136, 0, 'enrol_cohort', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919407),
(1137, 0, 'enrol_database', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919407),
(1138, 0, 'enrol_database', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919407),
(1139, 0, 'enrol_database', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919407),
(1140, 0, 'enrol_flatfile', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919407),
(1141, 0, 'enrol_flatfile', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919407),
(1142, 0, 'enrol_flatfile', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919407),
(1143, 0, 'enrol_guest', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919408),
(1144, 0, 'enrol_guest', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919408),
(1145, 0, 'enrol_guest', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919408),
(1146, 0, 'enrol_imsenterprise', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919408),
(1147, 0, 'enrol_imsenterprise', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919408),
(1148, 0, 'enrol_imsenterprise', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919408),
(1149, 0, 'enrol_ldap', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919408),
(1150, 0, 'enrol_ldap', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919408),
(1151, 0, 'enrol_ldap', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919408),
(1152, 0, 'enrol_manual', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919408),
(1153, 0, 'enrol_manual', '2012100702', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919408),
(1154, 0, 'enrol_manual', '2012101400', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919408),
(1155, 0, 'enrol_manual', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919408),
(1156, 0, 'enrol_manual', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919409),
(1157, 0, 'enrol_meta', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919409),
(1158, 0, 'enrol_meta', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919409),
(1159, 0, 'enrol_meta', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919409),
(1160, 0, 'enrol_mnet', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919409),
(1161, 0, 'enrol_mnet', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919409),
(1162, 0, 'enrol_mnet', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919409),
(1163, 0, 'enrol_paypal', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919409),
(1164, 0, 'enrol_paypal', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919409),
(1165, 0, 'enrol_paypal', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919409),
(1166, 0, 'enrol_self', '2012061700', '2013050101', 'Starting plugin upgrade', NULL, '', 2, 1390919409),
(1167, 0, 'enrol_self', '2012101400', '2013050101', 'Upgrade savepoint reached', NULL, '', 2, 1390919409),
(1168, 0, 'enrol_self', '2012120600', '2013050101', 'Upgrade savepoint reached', NULL, '', 2, 1390919409),
(1169, 0, 'enrol_self', '2013050101', '2013050101', 'Upgrade savepoint reached', NULL, '', 2, 1390919409),
(1170, 0, 'enrol_self', '2013050101', '2013050101', 'Plugin upgraded', NULL, '', 2, 1390919410),
(1171, 0, 'message_email', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919410),
(1172, 0, 'message_email', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919410),
(1173, 0, 'message_email', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919410),
(1174, 0, 'message_jabber', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919410),
(1175, 0, 'message_jabber', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919410),
(1176, 0, 'message_jabber', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919411),
(1177, 0, 'message_popup', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919411),
(1178, 0, 'message_popup', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919411),
(1179, 0, 'message_popup', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919411),
(1180, 0, 'block_activity_modules', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919411),
(1181, 0, 'block_activity_modules', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919411),
(1182, 0, 'block_activity_modules', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919411),
(1183, 0, 'block_admin_bookmarks', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919411),
(1184, 0, 'block_admin_bookmarks', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919411),
(1185, 0, 'block_admin_bookmarks', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919411),
(1186, 0, 'block_badges', NULL, '2013050101', 'Starting plugin installation', NULL, '', 2, 1390919411),
(1187, 0, 'block_badges', '2013050101', '2013050101', 'Plugin installed', NULL, '', 2, 1390919412),
(1188, 0, 'block_blog_menu', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919412),
(1189, 0, 'block_blog_menu', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919412),
(1190, 0, 'block_blog_menu', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919412),
(1191, 0, 'block_blog_recent', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919412),
(1192, 0, 'block_blog_recent', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919412),
(1193, 0, 'block_blog_recent', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919412),
(1194, 0, 'block_blog_tags', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919412),
(1195, 0, 'block_blog_tags', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919412),
(1196, 0, 'block_blog_tags', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919412),
(1197, 0, 'block_calendar_month', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919412),
(1198, 0, 'block_calendar_month', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919412),
(1199, 0, 'block_calendar_month', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919412),
(1200, 0, 'block_calendar_upcoming', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919412),
(1201, 0, 'block_calendar_upcoming', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919413),
(1202, 0, 'block_calendar_upcoming', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919413),
(1203, 0, 'block_comments', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919413),
(1204, 0, 'block_comments', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919413),
(1205, 0, 'block_comments', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919413),
(1206, 0, 'block_community', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919413),
(1207, 0, 'block_community', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919413),
(1208, 0, 'block_community', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919413),
(1209, 0, 'block_completionstatus', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919413),
(1210, 0, 'block_completionstatus', '2012112901', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919413),
(1211, 0, 'block_completionstatus', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919413),
(1212, 0, 'block_completionstatus', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919413),
(1213, 0, 'block_course_list', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919413),
(1214, 0, 'block_course_list', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919413),
(1215, 0, 'block_course_list', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919414),
(1216, 0, 'block_course_overview', '2012061700', '2013050101', 'Starting plugin upgrade', NULL, '', 2, 1390919414),
(1217, 0, 'block_course_overview', '2013050101', '2013050101', 'Upgrade savepoint reached', NULL, '', 2, 1390919414),
(1218, 0, 'block_course_overview', '2013050101', '2013050101', 'Plugin upgraded', NULL, '', 2, 1390919414),
(1219, 0, 'block_course_summary', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919414),
(1220, 0, 'block_course_summary', '2012112901', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919414),
(1221, 0, 'block_course_summary', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919414),
(1222, 0, 'block_course_summary', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919414),
(1223, 0, 'block_feedback', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919414),
(1224, 0, 'block_feedback', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919414),
(1225, 0, 'block_feedback', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919414),
(1226, 0, 'block_glossary_random', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919414),
(1227, 0, 'block_glossary_random', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919414),
(1228, 0, 'block_glossary_random', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919415),
(1229, 0, 'block_html', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919415),
(1230, 0, 'block_html', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919415),
(1231, 0, 'block_html', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919415),
(1232, 0, 'block_login', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919415),
(1233, 0, 'block_login', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919415),
(1234, 0, 'block_login', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919415),
(1235, 0, 'block_mentees', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919415),
(1236, 0, 'block_mentees', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919415),
(1237, 0, 'block_mentees', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919415),
(1238, 0, 'block_messages', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919415),
(1239, 0, 'block_messages', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919415),
(1240, 0, 'block_messages', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919415),
(1241, 0, 'block_mnet_hosts', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919416),
(1242, 0, 'block_mnet_hosts', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919416),
(1243, 0, 'block_mnet_hosts', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919416),
(1244, 0, 'block_myprofile', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919416),
(1245, 0, 'block_myprofile', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919416),
(1246, 0, 'block_myprofile', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919416),
(1247, 0, 'block_navigation', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919416),
(1248, 0, 'block_navigation', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919416),
(1249, 0, 'block_navigation', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919416),
(1250, 0, 'block_news_items', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919416),
(1251, 0, 'block_news_items', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919416),
(1252, 0, 'block_news_items', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919416),
(1253, 0, 'block_online_users', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919416),
(1254, 0, 'block_online_users', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919416),
(1255, 0, 'block_online_users', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919417),
(1256, 0, 'block_participants', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919417),
(1257, 0, 'block_participants', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919417),
(1258, 0, 'block_participants', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919417),
(1259, 0, 'block_private_files', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919417),
(1260, 0, 'block_private_files', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919417),
(1261, 0, 'block_private_files', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919417),
(1262, 0, 'block_quiz_results', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919417),
(1263, 0, 'block_quiz_results', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919417),
(1264, 0, 'block_quiz_results', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919417),
(1265, 0, 'block_recent_activity', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919417),
(1266, 0, 'block_recent_activity', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919417),
(1267, 0, 'block_recent_activity', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919418),
(1268, 0, 'block_rss_client', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919418),
(1269, 0, 'block_rss_client', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919418),
(1270, 0, 'block_rss_client', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919418),
(1271, 0, 'block_search_forums', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919418),
(1272, 0, 'block_search_forums', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919418),
(1273, 0, 'block_search_forums', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919418),
(1274, 0, 'block_section_links', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919418),
(1275, 0, 'block_section_links', '2013012200', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919418),
(1276, 0, 'block_section_links', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919418),
(1277, 0, 'block_section_links', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919418),
(1278, 0, 'block_selfcompletion', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919418),
(1279, 0, 'block_selfcompletion', '2012112901', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919419),
(1280, 0, 'block_selfcompletion', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919419),
(1281, 0, 'block_selfcompletion', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919419),
(1282, 0, 'block_settings', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919419),
(1283, 0, 'block_settings', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919419),
(1284, 0, 'block_settings', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919419),
(1285, 0, 'block_site_main_menu', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919419),
(1286, 0, 'block_site_main_menu', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919419),
(1287, 0, 'block_site_main_menu', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919419),
(1288, 0, 'block_social_activities', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919419),
(1289, 0, 'block_social_activities', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919419),
(1290, 0, 'block_social_activities', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919419),
(1291, 0, 'block_tag_flickr', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919419),
(1292, 0, 'block_tag_flickr', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919419),
(1293, 0, 'block_tag_flickr', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919420),
(1294, 0, 'block_tag_youtube', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919420),
(1295, 0, 'block_tag_youtube', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919420),
(1296, 0, 'block_tag_youtube', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919420),
(1297, 0, 'block_tags', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919420),
(1298, 0, 'block_tags', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919420),
(1299, 0, 'block_tags', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919420),
(1300, 0, 'filter_activitynames', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919420),
(1301, 0, 'filter_activitynames', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919420),
(1302, 0, 'filter_activitynames', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919420),
(1303, 0, 'filter_algebra', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919420),
(1304, 0, 'filter_algebra', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919420),
(1305, 0, 'filter_algebra', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919421),
(1306, 0, 'filter_censor', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919421),
(1307, 0, 'filter_censor', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919421),
(1308, 0, 'filter_censor', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919421),
(1309, 0, 'filter_data', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919421),
(1310, 0, 'filter_data', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919421),
(1311, 0, 'filter_data', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919421),
(1312, 0, 'filter_emailprotect', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919421),
(1313, 0, 'filter_emailprotect', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919421),
(1314, 0, 'filter_emailprotect', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919421),
(1315, 0, 'filter_emoticon', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919421),
(1316, 0, 'filter_emoticon', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919421),
(1317, 0, 'filter_emoticon', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919422),
(1318, 0, 'filter_glossary', '2012061701', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919422),
(1319, 0, 'filter_glossary', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919422),
(1320, 0, 'filter_glossary', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919422),
(1321, 0, 'filter_mediaplugin', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919422),
(1322, 0, 'filter_mediaplugin', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919422),
(1323, 0, 'filter_mediaplugin', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919422),
(1324, 0, 'filter_multilang', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919422),
(1325, 0, 'filter_multilang', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919422),
(1326, 0, 'filter_multilang', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919422),
(1327, 0, 'filter_tex', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919422),
(1328, 0, 'filter_tex', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919422),
(1329, 0, 'filter_tex', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919422),
(1330, 0, 'filter_tidy', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919422),
(1331, 0, 'filter_tidy', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919422),
(1332, 0, 'filter_tidy', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919423),
(1333, 0, 'filter_urltolink', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919423),
(1334, 0, 'filter_urltolink', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919423),
(1335, 0, 'filter_urltolink', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919423),
(1336, 0, 'editor_textarea', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919423),
(1337, 0, 'editor_textarea', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919423),
(1338, 0, 'editor_textarea', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919423),
(1339, 0, 'editor_tinymce', '2012061700', '2013050101', 'Starting plugin upgrade', NULL, '', 2, 1390919423),
(1340, 0, 'editor_tinymce', '2012083100', '2013050101', 'Upgrade savepoint reached', NULL, '', 2, 1390919423),
(1341, 0, 'editor_tinymce', '2013050101', '2013050101', 'Upgrade savepoint reached', NULL, '', 2, 1390919423),
(1342, 0, 'editor_tinymce', '2013050101', '2013050101', 'Plugin upgraded', NULL, '', 2, 1390919423),
(1343, 0, 'format_scorm', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919423),
(1344, 0, 'format_scorm', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919423),
(1345, 0, 'format_scorm', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919424),
(1346, 0, 'format_social', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919424),
(1347, 0, 'format_social', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919424),
(1348, 0, 'format_social', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919424),
(1349, 0, 'format_topics', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919424),
(1350, 0, 'format_topics', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919424),
(1351, 0, 'format_topics', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919424),
(1352, 0, 'format_weeks', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919424),
(1353, 0, 'format_weeks', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919424),
(1354, 0, 'format_weeks', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919424),
(1355, 0, 'profilefield_checkbox', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919424),
(1356, 0, 'profilefield_checkbox', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919424),
(1357, 0, 'profilefield_checkbox', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919425),
(1358, 0, 'profilefield_datetime', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919425),
(1359, 0, 'profilefield_datetime', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919425),
(1360, 0, 'profilefield_datetime', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919425),
(1361, 0, 'profilefield_menu', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919425),
(1362, 0, 'profilefield_menu', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919425),
(1363, 0, 'profilefield_menu', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919425),
(1364, 0, 'profilefield_text', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919425),
(1365, 0, 'profilefield_text', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919425),
(1366, 0, 'profilefield_text', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919425),
(1367, 0, 'profilefield_textarea', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919425),
(1368, 0, 'profilefield_textarea', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919425),
(1369, 0, 'profilefield_textarea', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919426),
(1370, 0, 'report_backups', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919426),
(1371, 0, 'report_backups', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919426),
(1372, 0, 'report_backups', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919426),
(1373, 0, 'report_completion', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919426),
(1374, 0, 'report_completion', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919426),
(1375, 0, 'report_completion', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919426),
(1376, 0, 'report_configlog', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919426),
(1377, 0, 'report_configlog', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919426),
(1378, 0, 'report_configlog', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919426),
(1379, 0, 'report_courseoverview', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919426),
(1380, 0, 'report_courseoverview', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919426),
(1381, 0, 'report_courseoverview', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919427),
(1382, 0, 'report_log', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919427),
(1383, 0, 'report_log', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919427),
(1384, 0, 'report_log', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919427),
(1385, 0, 'report_loglive', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919427),
(1386, 0, 'report_loglive', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919427),
(1387, 0, 'report_loglive', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919427),
(1388, 0, 'report_outline', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919427),
(1389, 0, 'report_outline', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919427),
(1390, 0, 'report_outline', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919427),
(1391, 0, 'report_participation', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919427),
(1392, 0, 'report_participation', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919427),
(1393, 0, 'report_participation', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919428),
(1394, 0, 'report_performance', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919428),
(1395, 0, 'report_performance', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919428),
(1396, 0, 'report_performance', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919428),
(1397, 0, 'report_progress', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919428),
(1398, 0, 'report_progress', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919428),
(1399, 0, 'report_progress', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919428),
(1400, 0, 'report_questioninstances', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919428),
(1401, 0, 'report_questioninstances', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919428),
(1402, 0, 'report_questioninstances', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919428),
(1403, 0, 'report_security', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919428),
(1404, 0, 'report_security', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919428),
(1405, 0, 'report_security', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919429),
(1406, 0, 'report_stats', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919429),
(1407, 0, 'report_stats', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919429),
(1408, 0, 'report_stats', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919429),
(1409, 0, 'gradeexport_ods', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919429),
(1410, 0, 'gradeexport_ods', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919429);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1411, 0, 'gradeexport_ods', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919429),
(1412, 0, 'gradeexport_txt', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919429),
(1413, 0, 'gradeexport_txt', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919429),
(1414, 0, 'gradeexport_txt', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919429),
(1415, 0, 'gradeexport_xls', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919429),
(1416, 0, 'gradeexport_xls', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919429),
(1417, 0, 'gradeexport_xls', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919429),
(1418, 0, 'gradeexport_xml', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919429),
(1419, 0, 'gradeexport_xml', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919429),
(1420, 0, 'gradeexport_xml', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919430),
(1421, 0, 'gradeimport_csv', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919430),
(1422, 0, 'gradeimport_csv', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919430),
(1423, 0, 'gradeimport_csv', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919430),
(1424, 0, 'gradeimport_xml', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919430),
(1425, 0, 'gradeimport_xml', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919430),
(1426, 0, 'gradeimport_xml', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919430),
(1427, 0, 'gradereport_grader', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919430),
(1428, 0, 'gradereport_grader', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919430),
(1429, 0, 'gradereport_grader', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919430),
(1430, 0, 'gradereport_outcomes', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919430),
(1431, 0, 'gradereport_outcomes', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919430),
(1432, 0, 'gradereport_outcomes', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919431),
(1433, 0, 'gradereport_overview', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919431),
(1434, 0, 'gradereport_overview', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919431),
(1435, 0, 'gradereport_overview', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919431),
(1436, 0, 'gradereport_user', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919431),
(1437, 0, 'gradereport_user', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919431),
(1438, 0, 'gradereport_user', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919431),
(1439, 0, 'gradingform_guide', '2012061700', '2013051401.05', 'Starting plugin upgrade', NULL, '', 2, 1390919431),
(1440, 0, 'gradingform_guide', '2013051401.05', '2013051401.05', 'Upgrade savepoint reached', NULL, '', 2, 1390919431),
(1441, 0, 'gradingform_guide', '2013051401.05', '2013051401.05', 'Plugin upgraded', NULL, '', 2, 1390919431),
(1442, 0, 'gradingform_rubric', '2012061700', '2013051401.05', 'Starting plugin upgrade', NULL, '', 2, 1390919431),
(1443, 0, 'gradingform_rubric', '2013051401.05', '2013051401.05', 'Upgrade savepoint reached', NULL, '', 2, 1390919431),
(1444, 0, 'gradingform_rubric', '2013051401.05', '2013051401.05', 'Plugin upgraded', NULL, '', 2, 1390919432),
(1445, 0, 'mnetservice_enrol', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919432),
(1446, 0, 'mnetservice_enrol', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919432),
(1447, 0, 'mnetservice_enrol', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919432),
(1448, 0, 'webservice_amf', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919432),
(1449, 0, 'webservice_amf', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919432),
(1450, 0, 'webservice_amf', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919432),
(1451, 0, 'webservice_rest', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919432),
(1452, 0, 'webservice_rest', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919432),
(1453, 0, 'webservice_rest', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919432),
(1454, 0, 'webservice_soap', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919432),
(1455, 0, 'webservice_soap', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919432),
(1456, 0, 'webservice_soap', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919433),
(1457, 0, 'webservice_xmlrpc', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919433),
(1458, 0, 'webservice_xmlrpc', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919433),
(1459, 0, 'webservice_xmlrpc', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919433),
(1460, 0, 'repository_alfresco', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919433),
(1461, 0, 'repository_alfresco', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919433),
(1462, 0, 'repository_alfresco', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919433),
(1463, 0, 'repository_boxnet', '2012061700', '2013050103', 'Starting plugin upgrade', NULL, '', 2, 1390919433),
(1464, 0, 'repository_boxnet', '2013050101', '2013050103', 'Upgrade savepoint reached', NULL, '', 2, 1390919433),
(1465, 0, 'repository_boxnet', '2013050103', '2013050103', 'Upgrade savepoint reached', NULL, '', 2, 1390919433),
(1466, 0, 'repository_boxnet', '2013050103', '2013050103', 'Plugin upgraded', NULL, '', 2, 1390919433),
(1467, 0, 'repository_coursefiles', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919433),
(1468, 0, 'repository_coursefiles', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919433),
(1469, 0, 'repository_coursefiles', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919434),
(1470, 0, 'repository_dropbox', '2012080702', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919434),
(1471, 0, 'repository_dropbox', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919434),
(1472, 0, 'repository_dropbox', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919434),
(1473, 0, 'repository_equella', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919434),
(1474, 0, 'repository_equella', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919434),
(1475, 0, 'repository_equella', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919434),
(1476, 0, 'repository_filesystem', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919434),
(1477, 0, 'repository_filesystem', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919434),
(1478, 0, 'repository_filesystem', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919434),
(1479, 0, 'repository_flickr', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919434),
(1480, 0, 'repository_flickr', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919434),
(1481, 0, 'repository_flickr', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919435),
(1482, 0, 'repository_flickr_public', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919435),
(1483, 0, 'repository_flickr_public', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919435),
(1484, 0, 'repository_flickr_public', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919435),
(1485, 0, 'repository_googledocs', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919435),
(1486, 0, 'repository_googledocs', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919435),
(1487, 0, 'repository_googledocs', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919435),
(1488, 0, 'repository_local', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919435),
(1489, 0, 'repository_local', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919435),
(1490, 0, 'repository_local', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919435),
(1491, 0, 'repository_merlot', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919435),
(1492, 0, 'repository_merlot', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919435),
(1493, 0, 'repository_merlot', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919435),
(1494, 0, 'repository_picasa', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919436),
(1495, 0, 'repository_picasa', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919436),
(1496, 0, 'repository_picasa', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919436),
(1497, 0, 'repository_recent', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919436),
(1498, 0, 'repository_recent', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919436),
(1499, 0, 'repository_recent', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919436),
(1500, 0, 'repository_s3', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919436),
(1501, 0, 'repository_s3', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919436),
(1502, 0, 'repository_s3', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919436),
(1503, 0, 'repository_upload', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919436),
(1504, 0, 'repository_upload', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919436),
(1505, 0, 'repository_upload', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919436),
(1506, 0, 'repository_url', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919436),
(1507, 0, 'repository_url', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919436),
(1508, 0, 'repository_url', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919437),
(1509, 0, 'repository_user', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919437),
(1510, 0, 'repository_user', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919437),
(1511, 0, 'repository_user', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919437),
(1512, 0, 'repository_webdav', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919437),
(1513, 0, 'repository_webdav', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919437),
(1514, 0, 'repository_webdav', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919437),
(1515, 0, 'repository_wikimedia', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919437),
(1516, 0, 'repository_wikimedia', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919437),
(1517, 0, 'repository_wikimedia', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919438),
(1518, 0, 'repository_youtube', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919438),
(1519, 0, 'repository_youtube', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919438),
(1520, 0, 'repository_youtube', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919438),
(1521, 0, 'portfolio_boxnet', '2012061700', '2013050102', 'Starting plugin upgrade', NULL, '', 2, 1390919438),
(1522, 0, 'portfolio_boxnet', '2013050102', '2013050102', 'Upgrade savepoint reached', NULL, '', 2, 1390919438),
(1523, 0, 'portfolio_boxnet', '2013050102', '2013050102', 'Plugin upgraded', NULL, '', 2, 1390919438),
(1524, 0, 'portfolio_download', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919438),
(1525, 0, 'portfolio_download', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919438),
(1526, 0, 'portfolio_download', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919438),
(1527, 0, 'portfolio_flickr', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919438),
(1528, 0, 'portfolio_flickr', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919438),
(1529, 0, 'portfolio_flickr', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919439),
(1530, 0, 'portfolio_googledocs', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919439),
(1531, 0, 'portfolio_googledocs', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919439),
(1532, 0, 'portfolio_googledocs', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919439),
(1533, 0, 'portfolio_mahara', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919439),
(1534, 0, 'portfolio_mahara', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919439),
(1535, 0, 'portfolio_mahara', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919439),
(1536, 0, 'portfolio_picasa', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919439),
(1537, 0, 'portfolio_picasa', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919439),
(1538, 0, 'portfolio_picasa', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919440),
(1539, 0, 'qbehaviour_adaptive', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919440),
(1540, 0, 'qbehaviour_adaptive', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919440),
(1541, 0, 'qbehaviour_adaptive', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919440),
(1542, 0, 'qbehaviour_adaptivenopenalty', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919440),
(1543, 0, 'qbehaviour_adaptivenopenalty', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919440),
(1544, 0, 'qbehaviour_adaptivenopenalty', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919440),
(1545, 0, 'qbehaviour_deferredcbm', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919440),
(1546, 0, 'qbehaviour_deferredcbm', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919440),
(1547, 0, 'qbehaviour_deferredcbm', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919440),
(1548, 0, 'qbehaviour_deferredfeedback', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919440),
(1549, 0, 'qbehaviour_deferredfeedback', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919440),
(1550, 0, 'qbehaviour_deferredfeedback', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919440),
(1551, 0, 'qbehaviour_immediatecbm', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919440),
(1552, 0, 'qbehaviour_immediatecbm', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919441),
(1553, 0, 'qbehaviour_immediatecbm', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919441),
(1554, 0, 'qbehaviour_immediatefeedback', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919441),
(1555, 0, 'qbehaviour_immediatefeedback', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919441),
(1556, 0, 'qbehaviour_immediatefeedback', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919441),
(1557, 0, 'qbehaviour_informationitem', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919441),
(1558, 0, 'qbehaviour_informationitem', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919441),
(1559, 0, 'qbehaviour_informationitem', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919441),
(1560, 0, 'qbehaviour_interactive', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919441),
(1561, 0, 'qbehaviour_interactive', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919441),
(1562, 0, 'qbehaviour_interactive', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919442),
(1563, 0, 'qbehaviour_interactivecountback', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919442),
(1564, 0, 'qbehaviour_interactivecountback', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919442),
(1565, 0, 'qbehaviour_interactivecountback', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919442),
(1566, 0, 'qbehaviour_manualgraded', '2012061700', '2013050800', 'Starting plugin upgrade', NULL, '', 2, 1390919442),
(1567, 0, 'qbehaviour_manualgraded', '2013050200', '2013050800', 'Upgrade savepoint reached', NULL, '', 2, 1390919442),
(1568, 0, 'qbehaviour_manualgraded', '2013050800', '2013050800', 'Upgrade savepoint reached', NULL, '', 2, 1390919442),
(1569, 0, 'qbehaviour_manualgraded', '2013050800', '2013050800', 'Plugin upgraded', NULL, '', 2, 1390919442),
(1570, 0, 'qbehaviour_missing', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919442),
(1571, 0, 'qbehaviour_missing', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919442),
(1572, 0, 'qbehaviour_missing', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919442),
(1573, 0, 'qformat_aiken', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919442),
(1574, 0, 'qformat_aiken', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919442),
(1575, 0, 'qformat_aiken', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919442),
(1576, 0, 'qformat_blackboard_six', '2012061701', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919442),
(1577, 0, 'qformat_blackboard_six', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919443),
(1578, 0, 'qformat_blackboard_six', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919443),
(1579, 0, 'qformat_examview', '2012061701', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919443),
(1580, 0, 'qformat_examview', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919443),
(1581, 0, 'qformat_examview', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919443),
(1582, 0, 'qformat_gift', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919443),
(1583, 0, 'qformat_gift', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919443),
(1584, 0, 'qformat_gift', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919443),
(1585, 0, 'qformat_learnwise', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919443),
(1586, 0, 'qformat_learnwise', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919443),
(1587, 0, 'qformat_learnwise', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919444),
(1588, 0, 'qformat_missingword', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919444),
(1589, 0, 'qformat_missingword', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919444),
(1590, 0, 'qformat_missingword', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919444),
(1591, 0, 'qformat_multianswer', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919444),
(1592, 0, 'qformat_multianswer', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919444),
(1593, 0, 'qformat_multianswer', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919444),
(1594, 0, 'qformat_webct', '2012061700', '2013050101', 'Starting plugin upgrade', NULL, '', 2, 1390919444),
(1595, 0, 'qformat_webct', '2013050101', '2013050101', 'Upgrade savepoint reached', NULL, '', 2, 1390919444),
(1596, 0, 'qformat_webct', '2013050101', '2013050101', 'Plugin upgraded', NULL, '', 2, 1390919444),
(1597, 0, 'qformat_xhtml', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919444),
(1598, 0, 'qformat_xhtml', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919444),
(1599, 0, 'qformat_xhtml', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919444),
(1600, 0, 'qformat_xml', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919444),
(1601, 0, 'qformat_xml', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919444),
(1602, 0, 'qformat_xml', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919445),
(1603, 0, 'tool_assignmentupgrade', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919445),
(1604, 0, 'tool_assignmentupgrade', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919445),
(1605, 0, 'tool_assignmentupgrade', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919445),
(1606, 0, 'tool_behat', NULL, '2013050102', 'Starting plugin installation', NULL, '', 2, 1390919445),
(1607, 0, 'tool_behat', '2013050102', '2013050102', 'Upgrade savepoint reached', NULL, '', 2, 1390919445),
(1608, 0, 'tool_behat', '2013050102', '2013050102', 'Plugin installed', NULL, '', 2, 1390919445),
(1609, 0, 'tool_capability', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919445),
(1610, 0, 'tool_capability', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919445),
(1611, 0, 'tool_capability', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919445),
(1612, 0, 'tool_customlang', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919445),
(1613, 0, 'tool_customlang', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919445),
(1614, 0, 'tool_customlang', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919446),
(1615, 0, 'tool_dbtransfer', '2012062200', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919446),
(1616, 0, 'tool_dbtransfer', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919446),
(1617, 0, 'tool_dbtransfer', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919446),
(1618, 0, 'tool_generator', '2012061700', '2013051402.04', 'Starting plugin upgrade', NULL, '', 2, 1390919446),
(1619, 0, 'tool_generator', '2013051402.04', '2013051402.04', 'Upgrade savepoint reached', NULL, '', 2, 1390919446),
(1620, 0, 'tool_generator', '2013051402.04', '2013051402.04', 'Plugin upgraded', NULL, '', 2, 1390919446),
(1621, 0, 'tool_health', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919446),
(1622, 0, 'tool_health', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919446),
(1623, 0, 'tool_health', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919446),
(1624, 0, 'tool_innodb', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919446),
(1625, 0, 'tool_innodb', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919446),
(1626, 0, 'tool_innodb', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919446),
(1627, 0, 'tool_installaddon', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919446),
(1628, 0, 'tool_installaddon', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919447),
(1629, 0, 'tool_installaddon', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919447),
(1630, 0, 'tool_langimport', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919447),
(1631, 0, 'tool_langimport', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919447),
(1632, 0, 'tool_langimport', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919447),
(1633, 0, 'tool_multilangupgrade', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919447),
(1634, 0, 'tool_multilangupgrade', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919447),
(1635, 0, 'tool_multilangupgrade', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919447),
(1636, 0, 'tool_phpunit', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919447),
(1637, 0, 'tool_phpunit', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919447),
(1638, 0, 'tool_phpunit', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919447),
(1639, 0, 'tool_profiling', '2012061700', '2013050200', 'Starting plugin upgrade', NULL, '', 2, 1390919447),
(1640, 0, 'tool_profiling', '2013050200', '2013050200', 'Upgrade savepoint reached', NULL, '', 2, 1390919448),
(1641, 0, 'tool_profiling', '2013050200', '2013050200', 'Plugin upgraded', NULL, '', 2, 1390919448),
(1642, 0, 'tool_qeupgradehelper', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919448),
(1643, 0, 'tool_qeupgradehelper', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919448),
(1644, 0, 'tool_qeupgradehelper', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919448),
(1645, 0, 'tool_replace', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919448),
(1646, 0, 'tool_replace', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919448),
(1647, 0, 'tool_replace', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919448),
(1648, 0, 'tool_spamcleaner', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919448),
(1649, 0, 'tool_spamcleaner', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919448),
(1650, 0, 'tool_spamcleaner', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919448),
(1651, 0, 'tool_timezoneimport', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919448),
(1652, 0, 'tool_timezoneimport', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919448),
(1653, 0, 'tool_timezoneimport', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919449),
(1654, 0, 'tool_unsuproles', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919449),
(1655, 0, 'tool_unsuproles', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919449),
(1656, 0, 'tool_unsuproles', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919449),
(1657, 0, 'tool_uploaduser', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919449),
(1658, 0, 'tool_uploaduser', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919449),
(1659, 0, 'tool_uploaduser', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919449),
(1660, 0, 'tool_xmldb', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919449),
(1661, 0, 'tool_xmldb', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919449),
(1662, 0, 'tool_xmldb', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919449),
(1663, 0, 'cachestore_file', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919449),
(1664, 0, 'cachestore_file', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919449),
(1665, 0, 'cachestore_file', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919450),
(1666, 0, 'cachestore_memcache', NULL, '2013050700', 'Starting plugin installation', NULL, '', 2, 1390919450),
(1667, 0, 'cachestore_memcache', '2013050700', '2013050700', 'Upgrade savepoint reached', NULL, '', 2, 1390919450),
(1668, 0, 'cachestore_memcache', '2013050700', '2013050700', 'Plugin installed', NULL, '', 2, 1390919450),
(1669, 0, 'cachestore_memcached', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919450),
(1670, 0, 'cachestore_memcached', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919450),
(1671, 0, 'cachestore_memcached', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919450),
(1672, 0, 'cachestore_mongodb', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919450),
(1673, 0, 'cachestore_mongodb', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919450),
(1674, 0, 'cachestore_mongodb', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919450),
(1675, 0, 'cachestore_session', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919450),
(1676, 0, 'cachestore_session', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919450),
(1677, 0, 'cachestore_session', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919450),
(1678, 0, 'cachestore_static', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919450),
(1679, 0, 'cachestore_static', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919450),
(1680, 0, 'cachestore_static', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919451),
(1681, 0, 'theme_afterburner', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919451),
(1682, 0, 'theme_afterburner', '2013041200', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919451),
(1683, 0, 'theme_afterburner', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919451),
(1684, 0, 'theme_afterburner', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919451),
(1685, 0, 'theme_anomaly', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919451),
(1686, 0, 'theme_anomaly', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919451),
(1687, 0, 'theme_anomaly', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919451),
(1688, 0, 'theme_arialist', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919451),
(1689, 0, 'theme_arialist', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919451),
(1690, 0, 'theme_arialist', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919452),
(1691, 0, 'theme_base', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919452),
(1692, 0, 'theme_base', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919452),
(1693, 0, 'theme_base', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919452),
(1694, 0, 'theme_binarius', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919452),
(1695, 0, 'theme_binarius', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919452),
(1696, 0, 'theme_binarius', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919452),
(1697, 0, 'theme_bootstrapbase', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919452),
(1698, 0, 'theme_bootstrapbase', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919452),
(1699, 0, 'theme_bootstrapbase', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919452),
(1700, 0, 'theme_boxxie', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919452),
(1701, 0, 'theme_boxxie', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919452),
(1702, 0, 'theme_boxxie', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919452),
(1703, 0, 'theme_brick', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919452),
(1704, 0, 'theme_brick', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919453),
(1705, 0, 'theme_brick', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919453),
(1706, 0, 'theme_canvas', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919453),
(1707, 0, 'theme_canvas', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919453),
(1708, 0, 'theme_canvas', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919453),
(1709, 0, 'theme_clean', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919453),
(1710, 0, 'theme_clean', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919453),
(1711, 0, 'theme_clean', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919453),
(1712, 0, 'theme_formal_white', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919453),
(1713, 0, 'theme_formal_white', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919453),
(1714, 0, 'theme_formal_white', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919453),
(1715, 0, 'theme_formfactor', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919453),
(1716, 0, 'theme_formfactor', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919454),
(1717, 0, 'theme_formfactor', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919454),
(1718, 0, 'theme_fusion', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919454),
(1719, 0, 'theme_fusion', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919454),
(1720, 0, 'theme_fusion', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919454),
(1721, 0, 'theme_leatherbound', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919454),
(1722, 0, 'theme_leatherbound', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919454),
(1723, 0, 'theme_leatherbound', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919454),
(1724, 0, 'theme_magazine', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919454),
(1725, 0, 'theme_magazine', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919454),
(1726, 0, 'theme_magazine', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919454),
(1727, 0, 'theme_mymobile', '2012061901', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919454),
(1728, 0, 'theme_mymobile', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919454),
(1729, 0, 'theme_mymobile', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919455),
(1730, 0, 'theme_nimble', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919455),
(1731, 0, 'theme_nimble', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919455),
(1732, 0, 'theme_nimble', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919455),
(1733, 0, 'theme_nonzero', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919455),
(1734, 0, 'theme_nonzero', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919455),
(1735, 0, 'theme_nonzero', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919455),
(1736, 0, 'theme_overlay', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919455),
(1737, 0, 'theme_overlay', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919455),
(1738, 0, 'theme_overlay', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919455),
(1739, 0, 'theme_serenity', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919455),
(1740, 0, 'theme_serenity', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919455),
(1741, 0, 'theme_serenity', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919455),
(1742, 0, 'theme_sky_high', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919455),
(1743, 0, 'theme_sky_high', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919456),
(1744, 0, 'theme_sky_high', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919456),
(1745, 0, 'theme_splash', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919456),
(1746, 0, 'theme_splash', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919456),
(1747, 0, 'theme_splash', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919456),
(1748, 0, 'theme_standard', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919456),
(1749, 0, 'theme_standard', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919456),
(1750, 0, 'theme_standard', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919456),
(1751, 0, 'theme_standardold', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919456),
(1752, 0, 'theme_standardold', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919456),
(1753, 0, 'theme_standardold', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919456),
(1754, 0, 'assignsubmission_comments', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919456),
(1755, 0, 'assignsubmission_comments', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919456),
(1756, 0, 'assignsubmission_comments', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919457),
(1757, 0, 'assignsubmission_file', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919457),
(1758, 0, 'assignsubmission_file', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919457),
(1759, 0, 'assignsubmission_file', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919457),
(1760, 0, 'assignsubmission_onlinetext', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919457),
(1761, 0, 'assignsubmission_onlinetext', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919457),
(1762, 0, 'assignsubmission_onlinetext', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919457),
(1763, 0, 'assignfeedback_comments', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919457),
(1764, 0, 'assignfeedback_comments', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919457),
(1765, 0, 'assignfeedback_comments', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919457),
(1766, 0, 'assignfeedback_file', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919457),
(1767, 0, 'assignfeedback_file', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919457),
(1768, 0, 'assignfeedback_file', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919457),
(1769, 0, 'assignfeedback_offline', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919457),
(1770, 0, 'assignfeedback_offline', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919458),
(1771, 0, 'assignfeedback_offline', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919458),
(1772, 0, 'assignment_offline', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919458),
(1773, 0, 'assignment_offline', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919458),
(1774, 0, 'assignment_offline', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919458),
(1775, 0, 'assignment_online', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919458),
(1776, 0, 'assignment_online', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919458),
(1777, 0, 'assignment_online', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919458),
(1778, 0, 'assignment_upload', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919458),
(1779, 0, 'assignment_upload', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919458),
(1780, 0, 'assignment_upload', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919458),
(1781, 0, 'assignment_uploadsingle', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919458),
(1782, 0, 'assignment_uploadsingle', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919458),
(1783, 0, 'assignment_uploadsingle', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919459),
(1784, 0, 'booktool_exportimscp', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919459),
(1785, 0, 'booktool_exportimscp', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919459),
(1786, 0, 'booktool_exportimscp', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919459),
(1787, 0, 'booktool_importhtml', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919459),
(1788, 0, 'booktool_importhtml', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919459),
(1789, 0, 'booktool_importhtml', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919459),
(1790, 0, 'booktool_print', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919459),
(1791, 0, 'booktool_print', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919459),
(1792, 0, 'booktool_print', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919459),
(1793, 0, 'datafield_checkbox', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919459),
(1794, 0, 'datafield_checkbox', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919459),
(1795, 0, 'datafield_checkbox', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919460),
(1796, 0, 'datafield_date', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919460),
(1797, 0, 'datafield_date', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919460),
(1798, 0, 'datafield_date', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919460),
(1799, 0, 'datafield_file', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919460),
(1800, 0, 'datafield_file', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919460),
(1801, 0, 'datafield_file', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919460),
(1802, 0, 'datafield_latlong', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919460),
(1803, 0, 'datafield_latlong', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919460),
(1804, 0, 'datafield_latlong', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919460),
(1805, 0, 'datafield_menu', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919460),
(1806, 0, 'datafield_menu', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919460),
(1807, 0, 'datafield_menu', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919461),
(1808, 0, 'datafield_multimenu', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919461),
(1809, 0, 'datafield_multimenu', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919461),
(1810, 0, 'datafield_multimenu', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919461),
(1811, 0, 'datafield_number', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919461),
(1812, 0, 'datafield_number', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919461),
(1813, 0, 'datafield_number', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919461),
(1814, 0, 'datafield_picture', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919461),
(1815, 0, 'datafield_picture', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919461),
(1816, 0, 'datafield_picture', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919461),
(1817, 0, 'datafield_radiobutton', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919461),
(1818, 0, 'datafield_radiobutton', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919461),
(1819, 0, 'datafield_radiobutton', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919462),
(1820, 0, 'datafield_text', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919462),
(1821, 0, 'datafield_text', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919462),
(1822, 0, 'datafield_text', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919462),
(1823, 0, 'datafield_textarea', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919462),
(1824, 0, 'datafield_textarea', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919462),
(1825, 0, 'datafield_textarea', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919462),
(1826, 0, 'datafield_url', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919462),
(1827, 0, 'datafield_url', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919462),
(1828, 0, 'datafield_url', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919462),
(1829, 0, 'datapreset_imagegallery', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919462),
(1830, 0, 'datapreset_imagegallery', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919462),
(1831, 0, 'datapreset_imagegallery', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919462),
(1832, 0, 'quiz_grading', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919463),
(1833, 0, 'quiz_grading', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919463),
(1834, 0, 'quiz_grading', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919463),
(1835, 0, 'quiz_overview', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919463),
(1836, 0, 'quiz_overview', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919463),
(1837, 0, 'quiz_overview', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919463),
(1838, 0, 'quiz_responses', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919463),
(1839, 0, 'quiz_responses', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919463),
(1840, 0, 'quiz_responses', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919464),
(1841, 0, 'quiz_statistics', '2012061801', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919464),
(1842, 0, 'quiz_statistics', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919464),
(1843, 0, 'quiz_statistics', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919464),
(1844, 0, 'quizaccess_delaybetweenattempts', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919464),
(1845, 0, 'quizaccess_delaybetweenattempts', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919464),
(1846, 0, 'quizaccess_delaybetweenattempts', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919464),
(1847, 0, 'quizaccess_ipaddress', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919464),
(1848, 0, 'quizaccess_ipaddress', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919464),
(1849, 0, 'quizaccess_ipaddress', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919464),
(1850, 0, 'quizaccess_numattempts', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919464),
(1851, 0, 'quizaccess_numattempts', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919464),
(1852, 0, 'quizaccess_numattempts', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919464),
(1853, 0, 'quizaccess_openclosedate', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919464),
(1854, 0, 'quizaccess_openclosedate', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919464),
(1855, 0, 'quizaccess_openclosedate', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919465),
(1856, 0, 'quizaccess_password', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919465),
(1857, 0, 'quizaccess_password', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919465),
(1858, 0, 'quizaccess_password', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919465),
(1859, 0, 'quizaccess_safebrowser', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919465),
(1860, 0, 'quizaccess_safebrowser', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919465),
(1861, 0, 'quizaccess_safebrowser', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919465),
(1862, 0, 'quizaccess_securewindow', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919465),
(1863, 0, 'quizaccess_securewindow', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919465),
(1864, 0, 'quizaccess_securewindow', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919465),
(1865, 0, 'quizaccess_timelimit', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919465),
(1866, 0, 'quizaccess_timelimit', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919466),
(1867, 0, 'quizaccess_timelimit', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919466),
(1868, 0, 'scormreport_basic', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919466),
(1869, 0, 'scormreport_basic', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919466),
(1870, 0, 'scormreport_basic', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919466);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(1871, 0, 'scormreport_graphs', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919466),
(1872, 0, 'scormreport_graphs', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919466),
(1873, 0, 'scormreport_graphs', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919466),
(1874, 0, 'scormreport_interactions', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919466),
(1875, 0, 'scormreport_interactions', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919466),
(1876, 0, 'scormreport_interactions', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919466),
(1877, 0, 'workshopform_accumulative', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919466),
(1878, 0, 'workshopform_accumulative', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919466),
(1879, 0, 'workshopform_accumulative', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919467),
(1880, 0, 'workshopform_comments', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919467),
(1881, 0, 'workshopform_comments', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919467),
(1882, 0, 'workshopform_comments', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919467),
(1883, 0, 'workshopform_numerrors', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919467),
(1884, 0, 'workshopform_numerrors', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919467),
(1885, 0, 'workshopform_numerrors', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919467),
(1886, 0, 'workshopform_rubric', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919467),
(1887, 0, 'workshopform_rubric', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919467),
(1888, 0, 'workshopform_rubric', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919467),
(1889, 0, 'workshopallocation_manual', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919467),
(1890, 0, 'workshopallocation_manual', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919467),
(1891, 0, 'workshopallocation_manual', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919468),
(1892, 0, 'workshopallocation_random', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919468),
(1893, 0, 'workshopallocation_random', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919468),
(1894, 0, 'workshopallocation_random', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919468),
(1895, 0, 'workshopallocation_scheduled', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919468),
(1896, 0, 'workshopallocation_scheduled', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919468),
(1897, 0, 'workshopallocation_scheduled', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919468),
(1898, 0, 'workshopeval_best', '2012061700', '2013050100', 'Starting plugin upgrade', NULL, '', 2, 1390919468),
(1899, 0, 'workshopeval_best', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919468),
(1900, 0, 'workshopeval_best', '2013050100', '2013050100', 'Plugin upgraded', NULL, '', 2, 1390919468),
(1901, 0, 'tinymce_ctrlhelp', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919469),
(1902, 0, 'tinymce_ctrlhelp', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919469),
(1903, 0, 'tinymce_ctrlhelp', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919469),
(1904, 0, 'tinymce_dragmath', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919469),
(1905, 0, 'tinymce_dragmath', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919469),
(1906, 0, 'tinymce_dragmath', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919469),
(1907, 0, 'tinymce_moodleemoticon', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919469),
(1908, 0, 'tinymce_moodleemoticon', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919469),
(1909, 0, 'tinymce_moodleemoticon', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919469),
(1910, 0, 'tinymce_moodleimage', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919469),
(1911, 0, 'tinymce_moodleimage', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919469),
(1912, 0, 'tinymce_moodleimage', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919469),
(1913, 0, 'tinymce_moodlemedia', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919469),
(1914, 0, 'tinymce_moodlemedia', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919469),
(1915, 0, 'tinymce_moodlemedia', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919470),
(1916, 0, 'tinymce_moodlenolink', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919470),
(1917, 0, 'tinymce_moodlenolink', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919470),
(1918, 0, 'tinymce_moodlenolink', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919470),
(1919, 0, 'tinymce_spellchecker', NULL, '2013050100', 'Starting plugin installation', NULL, '', 2, 1390919470),
(1920, 0, 'tinymce_spellchecker', '2013050100', '2013050100', 'Upgrade savepoint reached', NULL, '', 2, 1390919470),
(1921, 0, 'tinymce_spellchecker', '2013050100', '2013050100', 'Plugin installed', NULL, '', 2, 1390919470),
(1922, 0, 'core', '2013051404.03', '2013111801.03', 'Starting core upgrade', NULL, '', 0, 1390990742),
(1923, 0, 'core', '2013061400.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990743),
(1924, 0, 'core', '2013061700', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990743),
(1925, 0, 'core', '2013070800', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990743),
(1926, 0, 'core', '2013070800.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990744),
(1927, 0, 'core', '2013071500.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990745),
(1928, 0, 'core', '2013071500.02', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990745),
(1929, 0, 'core', '2013072600.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990745),
(1930, 0, 'core', '2013081200', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990745),
(1931, 0, 'core', '2013082300.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990745),
(1932, 0, 'core', '2013082700', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990745),
(1933, 0, 'core', '2013090500.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990746),
(1934, 0, 'core', '2013091000.02', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990746),
(1935, 0, 'core', '2013091000.03', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990746),
(1936, 0, 'core', '2013091300.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990747),
(1937, 0, 'core', '2013092000.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990747),
(1938, 0, 'core', '2013092001.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990747),
(1939, 0, 'core', '2013092001.02', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990748),
(1940, 0, 'core', '2013092700.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990749),
(1941, 0, 'core', '2013100400.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990749),
(1942, 0, 'core', '2013100800', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990749),
(1943, 0, 'core', '2013100800.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990749),
(1944, 0, 'core', '2013100800.02', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990749),
(1945, 0, 'core', '2013100900', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990750),
(1946, 0, 'core', '2013100901', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990750),
(1947, 0, 'core', '2013102100', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990750),
(1948, 0, 'core', '2013102201', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990750),
(1949, 0, 'core', '2013102500.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990750),
(1950, 0, 'core', '2013110500.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990750),
(1951, 0, 'core', '2013110600.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990750),
(1952, 0, 'core', '2013110600.02', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990750),
(1953, 0, 'core', '2013111800.01', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990750),
(1954, 0, 'core', '2013111800.08', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990750),
(1955, 0, 'core', '2013111801.02', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990750),
(1956, 0, 'core', '2013111801.03', '2013111801.03', 'Upgrade savepoint reached', NULL, '', 0, 1390990750),
(1957, 0, 'core', '2013111801.03', '2013111801.03', 'Core upgraded', NULL, '', 0, 1390990751),
(1958, 0, 'qtype_calculated', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990751),
(1959, 0, 'qtype_calculated', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990751),
(1960, 0, 'qtype_calculated', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990751),
(1961, 0, 'qtype_calculatedmulti', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990751),
(1962, 0, 'qtype_calculatedmulti', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990751),
(1963, 0, 'qtype_calculatedmulti', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990751),
(1964, 0, 'qtype_calculatedsimple', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990751),
(1965, 0, 'qtype_calculatedsimple', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990751),
(1966, 0, 'qtype_calculatedsimple', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990751),
(1967, 0, 'qtype_description', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990751),
(1968, 0, 'qtype_description', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990751),
(1969, 0, 'qtype_description', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990751),
(1970, 0, 'qtype_essay', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990751),
(1971, 0, 'qtype_essay', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990751),
(1972, 0, 'qtype_essay', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990751),
(1973, 0, 'qtype_match', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990751),
(1974, 0, 'qtype_match', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990751),
(1975, 0, 'qtype_match', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990751),
(1976, 0, 'qtype_missingtype', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990751),
(1977, 0, 'qtype_missingtype', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990751),
(1978, 0, 'qtype_missingtype', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990751),
(1979, 0, 'qtype_multianswer', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990751),
(1980, 0, 'qtype_multianswer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990751),
(1981, 0, 'qtype_multianswer', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990751),
(1982, 0, 'qtype_multichoice', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990751),
(1983, 0, 'qtype_multichoice', '2013092300', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990751),
(1984, 0, 'qtype_multichoice', '2013092301', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990752),
(1985, 0, 'qtype_multichoice', '2013092302', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990752),
(1986, 0, 'qtype_multichoice', '2013092303', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990752),
(1987, 0, 'qtype_multichoice', '2013092304', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990752),
(1988, 0, 'qtype_multichoice', '2013092305', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990752),
(1989, 0, 'qtype_multichoice', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990752),
(1990, 0, 'qtype_multichoice', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990752),
(1991, 0, 'qtype_numerical', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990752),
(1992, 0, 'qtype_numerical', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990752),
(1993, 0, 'qtype_numerical', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990752),
(1994, 0, 'qtype_random', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990752),
(1995, 0, 'qtype_random', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990752),
(1996, 0, 'qtype_random', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990752),
(1997, 0, 'qtype_randomsamatch', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990752),
(1998, 0, 'qtype_randomsamatch', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990752),
(1999, 0, 'qtype_randomsamatch', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990752),
(2000, 0, 'qtype_shortanswer', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990752),
(2001, 0, 'qtype_shortanswer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990752),
(2002, 0, 'qtype_shortanswer', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990752),
(2003, 0, 'qtype_truefalse', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990752),
(2004, 0, 'qtype_truefalse', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990752),
(2005, 0, 'qtype_truefalse', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990752),
(2006, 0, 'mod_assign', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990752),
(2007, 0, 'mod_assign', '2013061101', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990753),
(2008, 0, 'mod_assign', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990753),
(2009, 0, 'mod_assign', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990753),
(2010, 0, 'mod_assignment', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990753),
(2011, 0, 'mod_assignment', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990753),
(2012, 0, 'mod_assignment', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990753),
(2013, 0, 'mod_book', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990753),
(2014, 0, 'mod_book', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990753),
(2015, 0, 'mod_book', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990753),
(2016, 0, 'mod_chat', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990753),
(2017, 0, 'mod_chat', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990753),
(2018, 0, 'mod_chat', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990754),
(2019, 0, 'mod_choice', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990754),
(2020, 0, 'mod_choice', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990754),
(2021, 0, 'mod_choice', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990754),
(2022, 0, 'mod_data', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990754),
(2023, 0, 'mod_data', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990754),
(2024, 0, 'mod_data', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990754),
(2025, 0, 'mod_feedback', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990754),
(2026, 0, 'mod_feedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990754),
(2027, 0, 'mod_feedback', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990754),
(2028, 0, 'mod_folder', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990754),
(2029, 0, 'mod_folder', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990754),
(2030, 0, 'mod_folder', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990754),
(2031, 0, 'mod_forum', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990754),
(2032, 0, 'mod_forum', '2013071000', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990754),
(2033, 0, 'mod_forum', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990754),
(2034, 0, 'mod_forum', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990754),
(2035, 0, 'mod_glossary', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990754),
(2036, 0, 'mod_glossary', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990754),
(2037, 0, 'mod_glossary', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990754),
(2038, 0, 'mod_imscp', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990754),
(2039, 0, 'mod_imscp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990754),
(2040, 0, 'mod_imscp', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990754),
(2041, 0, 'mod_label', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990754),
(2042, 0, 'mod_label', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990754),
(2043, 0, 'mod_label', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990754),
(2044, 0, 'mod_lesson', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990754),
(2045, 0, 'mod_lesson', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990754),
(2046, 0, 'mod_lesson', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990754),
(2047, 0, 'mod_lti', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990754),
(2048, 0, 'mod_lti', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990754),
(2049, 0, 'mod_lti', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990754),
(2050, 0, 'mod_page', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990754),
(2051, 0, 'mod_page', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990754),
(2052, 0, 'mod_page', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990754),
(2053, 0, 'mod_quiz', '2013050101', '2013110501', 'Starting plugin upgrade', NULL, '', 0, 1390990754),
(2054, 0, 'mod_quiz', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1390990755),
(2055, 0, 'mod_quiz', '2013110501', '2013110501', 'Plugin upgraded', NULL, '', 0, 1390990755),
(2056, 0, 'mod_resource', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990755),
(2057, 0, 'mod_resource', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990755),
(2058, 0, 'mod_resource', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990755),
(2059, 0, 'mod_scorm', '2013050103', '2013110501', 'Starting plugin upgrade', NULL, '', 0, 1390990755),
(2060, 0, 'mod_scorm', '2013081301', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1390990755),
(2061, 0, 'mod_scorm', '2013081302', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1390990755),
(2062, 0, 'mod_scorm', '2013081303', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1390990755),
(2063, 0, 'mod_scorm', '2013090100', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1390990756),
(2064, 0, 'mod_scorm', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1390990756),
(2065, 0, 'mod_scorm', '2013110501', '2013110501', 'Plugin upgraded', NULL, '', 0, 1390990756),
(2066, 0, 'mod_survey', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990756),
(2067, 0, 'mod_survey', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990756),
(2068, 0, 'mod_survey', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990756),
(2069, 0, 'mod_url', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990756),
(2070, 0, 'mod_url', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990756),
(2071, 0, 'mod_url', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990756),
(2072, 0, 'mod_wiki', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990756),
(2073, 0, 'mod_wiki', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990756),
(2074, 0, 'mod_wiki', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990756),
(2075, 0, 'mod_workshop', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990756),
(2076, 0, 'mod_workshop', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990756),
(2077, 0, 'mod_workshop', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990756),
(2078, 0, 'auth_cas', '2013052100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990756),
(2079, 0, 'auth_cas', '2013091700', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990756),
(2080, 0, 'auth_cas', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990756),
(2081, 0, 'auth_cas', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990756),
(2082, 0, 'auth_db', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990756),
(2083, 0, 'auth_db', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990756),
(2084, 0, 'auth_db', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990756),
(2085, 0, 'auth_email', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990756),
(2086, 0, 'auth_email', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990756),
(2087, 0, 'auth_email', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990756),
(2088, 0, 'auth_fc', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990756),
(2089, 0, 'auth_fc', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990756),
(2090, 0, 'auth_fc', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990756),
(2091, 0, 'auth_imap', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990756),
(2092, 0, 'auth_imap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990756),
(2093, 0, 'auth_imap', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990757),
(2094, 0, 'auth_ldap', '2013052100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990757),
(2095, 0, 'auth_ldap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990757),
(2096, 0, 'auth_ldap', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990757),
(2097, 0, 'auth_manual', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990757),
(2098, 0, 'auth_manual', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990757),
(2099, 0, 'auth_manual', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990757),
(2100, 0, 'auth_mnet', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990757),
(2101, 0, 'auth_mnet', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990757),
(2102, 0, 'auth_mnet', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990757),
(2103, 0, 'auth_nntp', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990757),
(2104, 0, 'auth_nntp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990757),
(2105, 0, 'auth_nntp', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990757),
(2106, 0, 'auth_nologin', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990757),
(2107, 0, 'auth_nologin', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990757),
(2108, 0, 'auth_nologin', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990757),
(2109, 0, 'auth_none', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990757),
(2110, 0, 'auth_none', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990757),
(2111, 0, 'auth_none', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990757),
(2112, 0, 'auth_pam', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990757),
(2113, 0, 'auth_pam', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990757),
(2114, 0, 'auth_pam', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990757),
(2115, 0, 'auth_pop3', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990757),
(2116, 0, 'auth_pop3', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990757),
(2117, 0, 'auth_pop3', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990757),
(2118, 0, 'auth_radius', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990757),
(2119, 0, 'auth_radius', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990757),
(2120, 0, 'auth_radius', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990757),
(2121, 0, 'auth_shibboleth', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990757),
(2122, 0, 'auth_shibboleth', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990757),
(2123, 0, 'auth_shibboleth', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990757),
(2124, 0, 'auth_webservice', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990757),
(2125, 0, 'auth_webservice', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990757),
(2126, 0, 'auth_webservice', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990757),
(2127, 0, 'calendartype_gregorian', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1390990757),
(2128, 0, 'calendartype_gregorian', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990757),
(2129, 0, 'calendartype_gregorian', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1390990758),
(2130, 0, 'enrol_category', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990758),
(2131, 0, 'enrol_category', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990758),
(2132, 0, 'enrol_category', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990758),
(2133, 0, 'enrol_cohort', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990758),
(2134, 0, 'enrol_cohort', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990758),
(2135, 0, 'enrol_cohort', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990758),
(2136, 0, 'enrol_database', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990758),
(2137, 0, 'enrol_database', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990758),
(2138, 0, 'enrol_database', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990758),
(2139, 0, 'enrol_flatfile', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990758),
(2140, 0, 'enrol_flatfile', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990758),
(2141, 0, 'enrol_flatfile', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990758),
(2142, 0, 'enrol_guest', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990758),
(2143, 0, 'enrol_guest', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990758),
(2144, 0, 'enrol_guest', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990758),
(2145, 0, 'enrol_imsenterprise', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990758),
(2146, 0, 'enrol_imsenterprise', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990758),
(2147, 0, 'enrol_imsenterprise', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990758),
(2148, 0, 'enrol_ldap', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990758),
(2149, 0, 'enrol_ldap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990758),
(2150, 0, 'enrol_ldap', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990758),
(2151, 0, 'enrol_manual', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990758),
(2152, 0, 'enrol_manual', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990758),
(2153, 0, 'enrol_manual', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990758),
(2154, 0, 'enrol_meta', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990758),
(2155, 0, 'enrol_meta', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990758),
(2156, 0, 'enrol_meta', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990758),
(2157, 0, 'enrol_mnet', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990758),
(2158, 0, 'enrol_mnet', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990758),
(2159, 0, 'enrol_mnet', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990758),
(2160, 0, 'enrol_paypal', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990758),
(2161, 0, 'enrol_paypal', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990758),
(2162, 0, 'enrol_paypal', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990758),
(2163, 0, 'enrol_self', '2013050101', '2013110501', 'Starting plugin upgrade', NULL, '', 0, 1390990758),
(2164, 0, 'enrol_self', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1390990758),
(2165, 0, 'enrol_self', '2013110501', '2013110501', 'Plugin upgraded', NULL, '', 0, 1390990759),
(2166, 0, 'message_email', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990759),
(2167, 0, 'message_email', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990759),
(2168, 0, 'message_email', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990759),
(2169, 0, 'message_jabber', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990759),
(2170, 0, 'message_jabber', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990759),
(2171, 0, 'message_jabber', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990759),
(2172, 0, 'message_popup', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990759),
(2173, 0, 'message_popup', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990759),
(2174, 0, 'message_popup', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990759),
(2175, 0, 'block_activity_modules', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990759),
(2176, 0, 'block_activity_modules', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990759),
(2177, 0, 'block_activity_modules', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990759),
(2178, 0, 'block_admin_bookmarks', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990759),
(2179, 0, 'block_admin_bookmarks', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990759),
(2180, 0, 'block_admin_bookmarks', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990759),
(2181, 0, 'block_badges', '2013050101', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990759),
(2182, 0, 'block_badges', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990759),
(2183, 0, 'block_badges', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990759),
(2184, 0, 'block_blog_menu', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990759),
(2185, 0, 'block_blog_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990759),
(2186, 0, 'block_blog_menu', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990759),
(2187, 0, 'block_blog_recent', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990759),
(2188, 0, 'block_blog_recent', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990759),
(2189, 0, 'block_blog_recent', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990759),
(2190, 0, 'block_blog_tags', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990759),
(2191, 0, 'block_blog_tags', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990759),
(2192, 0, 'block_blog_tags', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990759),
(2193, 0, 'block_calendar_month', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990759),
(2194, 0, 'block_calendar_month', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990759),
(2195, 0, 'block_calendar_month', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990759),
(2196, 0, 'block_calendar_upcoming', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990760),
(2197, 0, 'block_calendar_upcoming', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990760),
(2198, 0, 'block_calendar_upcoming', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990760),
(2199, 0, 'block_comments', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990760),
(2200, 0, 'block_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990760),
(2201, 0, 'block_comments', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990760),
(2202, 0, 'block_community', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990760),
(2203, 0, 'block_community', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990760),
(2204, 0, 'block_community', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990760),
(2205, 0, 'block_completionstatus', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990760),
(2206, 0, 'block_completionstatus', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990760),
(2207, 0, 'block_completionstatus', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990760),
(2208, 0, 'block_course_list', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990760),
(2209, 0, 'block_course_list', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990760),
(2210, 0, 'block_course_list', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990760),
(2211, 0, 'block_course_overview', '2013050101', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990760),
(2212, 0, 'block_course_overview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990760),
(2213, 0, 'block_course_overview', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990760),
(2214, 0, 'block_course_summary', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990760),
(2215, 0, 'block_course_summary', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990760),
(2216, 0, 'block_course_summary', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990760),
(2217, 0, 'block_feedback', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990760),
(2218, 0, 'block_feedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990760),
(2219, 0, 'block_feedback', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990760),
(2220, 0, 'block_glossary_random', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990760),
(2221, 0, 'block_glossary_random', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990760),
(2222, 0, 'block_glossary_random', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990760),
(2223, 0, 'block_html', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990760),
(2224, 0, 'block_html', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990760),
(2225, 0, 'block_html', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990760),
(2226, 0, 'block_login', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990760),
(2227, 0, 'block_login', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990760),
(2228, 0, 'block_login', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990760),
(2229, 0, 'block_mentees', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990760),
(2230, 0, 'block_mentees', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990761),
(2231, 0, 'block_mentees', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990761),
(2232, 0, 'block_messages', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990761),
(2233, 0, 'block_messages', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990761),
(2234, 0, 'block_messages', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990761),
(2235, 0, 'block_mnet_hosts', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990761),
(2236, 0, 'block_mnet_hosts', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990761),
(2237, 0, 'block_mnet_hosts', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990761),
(2238, 0, 'block_myprofile', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990761),
(2239, 0, 'block_myprofile', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990761),
(2240, 0, 'block_myprofile', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990761),
(2241, 0, 'block_navigation', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990761),
(2242, 0, 'block_navigation', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990761),
(2243, 0, 'block_navigation', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990761),
(2244, 0, 'block_news_items', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990761),
(2245, 0, 'block_news_items', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990761),
(2246, 0, 'block_news_items', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990761),
(2247, 0, 'block_online_users', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990761),
(2248, 0, 'block_online_users', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990761),
(2249, 0, 'block_online_users', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990761),
(2250, 0, 'block_participants', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990761),
(2251, 0, 'block_participants', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990761),
(2252, 0, 'block_participants', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990761),
(2253, 0, 'block_private_files', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990761),
(2254, 0, 'block_private_files', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990761),
(2255, 0, 'block_private_files', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990761),
(2256, 0, 'block_quiz_results', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990761),
(2257, 0, 'block_quiz_results', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990761),
(2258, 0, 'block_quiz_results', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990761),
(2259, 0, 'block_recent_activity', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990761),
(2260, 0, 'block_recent_activity', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990761),
(2261, 0, 'block_recent_activity', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990761),
(2262, 0, 'block_rss_client', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990761),
(2263, 0, 'block_rss_client', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990761),
(2264, 0, 'block_rss_client', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990761),
(2265, 0, 'block_search_forums', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990761),
(2266, 0, 'block_search_forums', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990761),
(2267, 0, 'block_search_forums', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990761),
(2268, 0, 'block_section_links', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990761),
(2269, 0, 'block_section_links', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990761),
(2270, 0, 'block_section_links', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990762),
(2271, 0, 'block_selfcompletion', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990762),
(2272, 0, 'block_selfcompletion', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990762),
(2273, 0, 'block_selfcompletion', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990762),
(2274, 0, 'block_settings', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990762),
(2275, 0, 'block_settings', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990762),
(2276, 0, 'block_settings', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990762),
(2277, 0, 'block_site_main_menu', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990762),
(2278, 0, 'block_site_main_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990762),
(2279, 0, 'block_site_main_menu', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990762),
(2280, 0, 'block_social_activities', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990762),
(2281, 0, 'block_social_activities', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990762),
(2282, 0, 'block_social_activities', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990762),
(2283, 0, 'block_tag_flickr', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990762),
(2284, 0, 'block_tag_flickr', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990762),
(2285, 0, 'block_tag_flickr', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990762),
(2286, 0, 'block_tag_youtube', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990762),
(2287, 0, 'block_tag_youtube', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990762),
(2288, 0, 'block_tag_youtube', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990762),
(2289, 0, 'block_tags', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990762),
(2290, 0, 'block_tags', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990762),
(2291, 0, 'block_tags', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990762),
(2292, 0, 'filter_activitynames', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990762),
(2293, 0, 'filter_activitynames', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990762),
(2294, 0, 'filter_activitynames', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990762),
(2295, 0, 'filter_algebra', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990762),
(2296, 0, 'filter_algebra', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990762),
(2297, 0, 'filter_algebra', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990762),
(2298, 0, 'filter_censor', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990762),
(2299, 0, 'filter_censor', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990762),
(2300, 0, 'filter_censor', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990762),
(2301, 0, 'filter_data', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990762),
(2302, 0, 'filter_data', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990762),
(2303, 0, 'filter_data', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990762),
(2304, 0, 'filter_emailprotect', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990762),
(2305, 0, 'filter_emailprotect', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990762),
(2306, 0, 'filter_emailprotect', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990762),
(2307, 0, 'filter_emoticon', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990762),
(2308, 0, 'filter_emoticon', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2309, 0, 'filter_emoticon', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990763),
(2310, 0, 'filter_glossary', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990763),
(2311, 0, 'filter_glossary', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2312, 0, 'filter_glossary', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990763),
(2313, 0, 'filter_mediaplugin', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990763),
(2314, 0, 'filter_mediaplugin', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2315, 0, 'filter_mediaplugin', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990763),
(2316, 0, 'filter_multilang', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990763),
(2317, 0, 'filter_multilang', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2318, 0, 'filter_multilang', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990763),
(2319, 0, 'filter_tex', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990763),
(2320, 0, 'filter_tex', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2321, 0, 'filter_tex', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990763),
(2322, 0, 'filter_tidy', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990763),
(2323, 0, 'filter_tidy', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2324, 0, 'filter_tidy', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990763),
(2325, 0, 'filter_urltolink', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990763),
(2326, 0, 'filter_urltolink', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2327, 0, 'filter_urltolink', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990763),
(2328, 0, 'editor_textarea', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990763),
(2329, 0, 'editor_textarea', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2330, 0, 'editor_textarea', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990763),
(2331, 0, 'editor_tinymce', '2013050101', '2013110600', 'Starting plugin upgrade', NULL, '', 0, 1390990763),
(2332, 0, 'editor_tinymce', '2013061400', '2013110600', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2333, 0, 'editor_tinymce', '2013070500', '2013110600', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2334, 0, 'editor_tinymce', '2013102900', '2013110600', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2335, 0, 'editor_tinymce', '2013110600', '2013110600', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2336, 0, 'editor_tinymce', '2013110600', '2013110600', 'Plugin upgraded', NULL, '', 0, 1390990763),
(2337, 0, 'format_singleactivity', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1390990763),
(2338, 0, 'format_singleactivity', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2339, 0, 'format_singleactivity', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1390990763),
(2340, 0, 'format_social', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990763),
(2341, 0, 'format_social', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990763);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(2342, 0, 'format_social', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990763),
(2343, 0, 'format_topics', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990763),
(2344, 0, 'format_topics', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2345, 0, 'format_topics', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990763),
(2346, 0, 'format_weeks', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990763),
(2347, 0, 'format_weeks', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2348, 0, 'format_weeks', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990763),
(2349, 0, 'profilefield_checkbox', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990763),
(2350, 0, 'profilefield_checkbox', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990763),
(2351, 0, 'profilefield_checkbox', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990764),
(2352, 0, 'profilefield_datetime', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990764),
(2353, 0, 'profilefield_datetime', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990764),
(2354, 0, 'profilefield_datetime', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990764),
(2355, 0, 'profilefield_menu', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990764),
(2356, 0, 'profilefield_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990764),
(2357, 0, 'profilefield_menu', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990764),
(2358, 0, 'profilefield_text', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990764),
(2359, 0, 'profilefield_text', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990764),
(2360, 0, 'profilefield_text', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990764),
(2361, 0, 'profilefield_textarea', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990764),
(2362, 0, 'profilefield_textarea', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990764),
(2363, 0, 'profilefield_textarea', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990764),
(2364, 0, 'report_backups', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990764),
(2365, 0, 'report_backups', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990764),
(2366, 0, 'report_backups', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990764),
(2367, 0, 'report_completion', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990764),
(2368, 0, 'report_completion', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990764),
(2369, 0, 'report_completion', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990764),
(2370, 0, 'report_configlog', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990764),
(2371, 0, 'report_configlog', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990764),
(2372, 0, 'report_configlog', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990764),
(2373, 0, 'report_courseoverview', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990764),
(2374, 0, 'report_courseoverview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990764),
(2375, 0, 'report_courseoverview', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990764),
(2376, 0, 'report_log', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990764),
(2377, 0, 'report_log', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990764),
(2378, 0, 'report_log', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990764),
(2379, 0, 'report_loglive', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990764),
(2380, 0, 'report_loglive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990764),
(2381, 0, 'report_loglive', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990764),
(2382, 0, 'report_outline', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990764),
(2383, 0, 'report_outline', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990764),
(2384, 0, 'report_outline', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990764),
(2385, 0, 'report_participation', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990764),
(2386, 0, 'report_participation', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990764),
(2387, 0, 'report_participation', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990764),
(2388, 0, 'report_performance', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990764),
(2389, 0, 'report_performance', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990764),
(2390, 0, 'report_performance', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990764),
(2391, 0, 'report_progress', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990764),
(2392, 0, 'report_progress', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990764),
(2393, 0, 'report_progress', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990765),
(2394, 0, 'report_questioninstances', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990765),
(2395, 0, 'report_questioninstances', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990765),
(2396, 0, 'report_questioninstances', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990765),
(2397, 0, 'report_security', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990765),
(2398, 0, 'report_security', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990765),
(2399, 0, 'report_security', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990765),
(2400, 0, 'report_stats', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990765),
(2401, 0, 'report_stats', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990765),
(2402, 0, 'report_stats', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990765),
(2403, 0, 'gradeexport_ods', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990765),
(2404, 0, 'gradeexport_ods', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990765),
(2405, 0, 'gradeexport_ods', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990765),
(2406, 0, 'gradeexport_txt', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990765),
(2407, 0, 'gradeexport_txt', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990765),
(2408, 0, 'gradeexport_txt', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990765),
(2409, 0, 'gradeexport_xls', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990765),
(2410, 0, 'gradeexport_xls', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990765),
(2411, 0, 'gradeexport_xls', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990765),
(2412, 0, 'gradeexport_xml', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990765),
(2413, 0, 'gradeexport_xml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990765),
(2414, 0, 'gradeexport_xml', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990765),
(2415, 0, 'gradeimport_csv', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990765),
(2416, 0, 'gradeimport_csv', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990765),
(2417, 0, 'gradeimport_csv', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990765),
(2418, 0, 'gradeimport_xml', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990765),
(2419, 0, 'gradeimport_xml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990765),
(2420, 0, 'gradeimport_xml', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990765),
(2421, 0, 'gradereport_grader', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990765),
(2422, 0, 'gradereport_grader', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990765),
(2423, 0, 'gradereport_grader', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990765),
(2424, 0, 'gradereport_outcomes', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990765),
(2425, 0, 'gradereport_outcomes', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990765),
(2426, 0, 'gradereport_outcomes', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990765),
(2427, 0, 'gradereport_overview', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990765),
(2428, 0, 'gradereport_overview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990765),
(2429, 0, 'gradereport_overview', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990765),
(2430, 0, 'gradereport_user', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990765),
(2431, 0, 'gradereport_user', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990765),
(2432, 0, 'gradereport_user', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990765),
(2433, 0, 'gradingform_guide', '2013051401.05', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990765),
(2434, 0, 'gradingform_guide', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990765),
(2435, 0, 'gradingform_guide', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990765),
(2436, 0, 'gradingform_rubric', '2013051401.05', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990765),
(2437, 0, 'gradingform_rubric', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990766),
(2438, 0, 'gradingform_rubric', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990766),
(2439, 0, 'mnetservice_enrol', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990766),
(2440, 0, 'mnetservice_enrol', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990766),
(2441, 0, 'mnetservice_enrol', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990766),
(2442, 0, 'webservice_amf', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990766),
(2443, 0, 'webservice_amf', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990766),
(2444, 0, 'webservice_amf', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990766),
(2445, 0, 'webservice_rest', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990766),
(2446, 0, 'webservice_rest', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990766),
(2447, 0, 'webservice_rest', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990766),
(2448, 0, 'webservice_soap', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990766),
(2449, 0, 'webservice_soap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990766),
(2450, 0, 'webservice_soap', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990766),
(2451, 0, 'webservice_xmlrpc', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990766),
(2452, 0, 'webservice_xmlrpc', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990766),
(2453, 0, 'webservice_xmlrpc', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990766),
(2454, 0, 'repository_alfresco', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990766),
(2455, 0, 'repository_alfresco', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990766),
(2456, 0, 'repository_alfresco', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990766),
(2457, 0, 'repository_areafiles', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1390990766),
(2458, 0, 'repository_areafiles', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990766),
(2459, 0, 'repository_areafiles', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1390990766),
(2460, 0, 'repository_boxnet', '2013050103', '2013110700', 'Starting plugin upgrade', NULL, '', 0, 1390990766),
(2461, 0, 'repository_boxnet', '2013110503', '2013110700', 'Upgrade savepoint reached', NULL, '', 0, 1390990766),
(2462, 0, 'repository_boxnet', '2013110700', '2013110700', 'Upgrade savepoint reached', NULL, '', 0, 1390990766),
(2463, 0, 'repository_boxnet', '2013110700', '2013110700', 'Plugin upgraded', NULL, '', 0, 1390990766),
(2464, 0, 'repository_coursefiles', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990766),
(2465, 0, 'repository_coursefiles', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990766),
(2466, 0, 'repository_coursefiles', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990766),
(2467, 0, 'repository_dropbox', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990766),
(2468, 0, 'repository_dropbox', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990766),
(2469, 0, 'repository_dropbox', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990766),
(2470, 0, 'repository_equella', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990766),
(2471, 0, 'repository_equella', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990766),
(2472, 0, 'repository_equella', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990766),
(2473, 0, 'repository_filesystem', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990766),
(2474, 0, 'repository_filesystem', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990766),
(2475, 0, 'repository_filesystem', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990766),
(2476, 0, 'repository_flickr', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990766),
(2477, 0, 'repository_flickr', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990767),
(2478, 0, 'repository_flickr', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990767),
(2479, 0, 'repository_flickr_public', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990767),
(2480, 0, 'repository_flickr_public', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990767),
(2481, 0, 'repository_flickr_public', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990767),
(2482, 0, 'repository_googledocs', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990767),
(2483, 0, 'repository_googledocs', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990767),
(2484, 0, 'repository_googledocs', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990767),
(2485, 0, 'repository_local', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990767),
(2486, 0, 'repository_local', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990767),
(2487, 0, 'repository_local', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990767),
(2488, 0, 'repository_merlot', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990767),
(2489, 0, 'repository_merlot', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990767),
(2490, 0, 'repository_merlot', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990767),
(2491, 0, 'repository_picasa', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990767),
(2492, 0, 'repository_picasa', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990767),
(2493, 0, 'repository_picasa', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990767),
(2494, 0, 'repository_recent', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990767),
(2495, 0, 'repository_recent', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990767),
(2496, 0, 'repository_recent', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990767),
(2497, 0, 'repository_s3', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990767),
(2498, 0, 'repository_s3', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990767),
(2499, 0, 'repository_s3', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990767),
(2500, 0, 'repository_skydrive', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1390990767),
(2501, 0, 'repository_skydrive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990767),
(2502, 0, 'repository_skydrive', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1390990767),
(2503, 0, 'repository_upload', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990767),
(2504, 0, 'repository_upload', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990767),
(2505, 0, 'repository_upload', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990767),
(2506, 0, 'repository_url', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990767),
(2507, 0, 'repository_url', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990767),
(2508, 0, 'repository_url', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990767),
(2509, 0, 'repository_user', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990767),
(2510, 0, 'repository_user', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990767),
(2511, 0, 'repository_user', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990767),
(2512, 0, 'repository_webdav', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990767),
(2513, 0, 'repository_webdav', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990767),
(2514, 0, 'repository_webdav', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990767),
(2515, 0, 'repository_wikimedia', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990767),
(2516, 0, 'repository_wikimedia', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990767),
(2517, 0, 'repository_wikimedia', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990767),
(2518, 0, 'repository_youtube', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990767),
(2519, 0, 'repository_youtube', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990767),
(2520, 0, 'repository_youtube', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990768),
(2521, 0, 'portfolio_boxnet', '2013050102', '2013110602', 'Starting plugin upgrade', NULL, '', 0, 1390990768),
(2522, 0, 'portfolio_boxnet', '2013110602', '2013110602', 'Upgrade savepoint reached', NULL, '', 0, 1390990768),
(2523, 0, 'portfolio_boxnet', '2013110602', '2013110602', 'Plugin upgraded', NULL, '', 0, 1390990768),
(2524, 0, 'portfolio_download', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990768),
(2525, 0, 'portfolio_download', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990768),
(2526, 0, 'portfolio_download', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990768),
(2527, 0, 'portfolio_flickr', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990768),
(2528, 0, 'portfolio_flickr', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990768),
(2529, 0, 'portfolio_flickr', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990768),
(2530, 0, 'portfolio_googledocs', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990768),
(2531, 0, 'portfolio_googledocs', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990768),
(2532, 0, 'portfolio_googledocs', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990768),
(2533, 0, 'portfolio_mahara', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990768),
(2534, 0, 'portfolio_mahara', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990768),
(2535, 0, 'portfolio_mahara', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990768),
(2536, 0, 'portfolio_picasa', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990768),
(2537, 0, 'portfolio_picasa', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990768),
(2538, 0, 'portfolio_picasa', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990768),
(2539, 0, 'qbehaviour_adaptive', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990768),
(2540, 0, 'qbehaviour_adaptive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990768),
(2541, 0, 'qbehaviour_adaptive', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990768),
(2542, 0, 'qbehaviour_adaptivenopenalty', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990768),
(2543, 0, 'qbehaviour_adaptivenopenalty', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990768),
(2544, 0, 'qbehaviour_adaptivenopenalty', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990768),
(2545, 0, 'qbehaviour_deferredcbm', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990768),
(2546, 0, 'qbehaviour_deferredcbm', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990768),
(2547, 0, 'qbehaviour_deferredcbm', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990768),
(2548, 0, 'qbehaviour_deferredfeedback', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990768),
(2549, 0, 'qbehaviour_deferredfeedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990768),
(2550, 0, 'qbehaviour_deferredfeedback', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990768),
(2551, 0, 'qbehaviour_immediatecbm', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990768),
(2552, 0, 'qbehaviour_immediatecbm', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990768),
(2553, 0, 'qbehaviour_immediatecbm', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990768),
(2554, 0, 'qbehaviour_immediatefeedback', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990768),
(2555, 0, 'qbehaviour_immediatefeedback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990768),
(2556, 0, 'qbehaviour_immediatefeedback', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990768),
(2557, 0, 'qbehaviour_informationitem', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990768),
(2558, 0, 'qbehaviour_informationitem', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990768),
(2559, 0, 'qbehaviour_informationitem', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990768),
(2560, 0, 'qbehaviour_interactive', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990768),
(2561, 0, 'qbehaviour_interactive', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990769),
(2562, 0, 'qbehaviour_interactive', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990769),
(2563, 0, 'qbehaviour_interactivecountback', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990769),
(2564, 0, 'qbehaviour_interactivecountback', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990769),
(2565, 0, 'qbehaviour_interactivecountback', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990769),
(2566, 0, 'qbehaviour_manualgraded', '2013050800', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990769),
(2567, 0, 'qbehaviour_manualgraded', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990769),
(2568, 0, 'qbehaviour_manualgraded', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990769),
(2569, 0, 'qbehaviour_missing', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990769),
(2570, 0, 'qbehaviour_missing', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990769),
(2571, 0, 'qbehaviour_missing', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990769),
(2572, 0, 'qformat_aiken', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990769),
(2573, 0, 'qformat_aiken', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990769),
(2574, 0, 'qformat_aiken', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990769),
(2575, 0, 'qformat_blackboard_six', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990769),
(2576, 0, 'qformat_blackboard_six', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990769),
(2577, 0, 'qformat_blackboard_six', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990769),
(2578, 0, 'qformat_examview', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990769),
(2579, 0, 'qformat_examview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990769),
(2580, 0, 'qformat_examview', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990769),
(2581, 0, 'qformat_gift', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990769),
(2582, 0, 'qformat_gift', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990769),
(2583, 0, 'qformat_gift', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990769),
(2584, 0, 'qformat_learnwise', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990769),
(2585, 0, 'qformat_learnwise', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990769),
(2586, 0, 'qformat_learnwise', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990769),
(2587, 0, 'qformat_missingword', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990769),
(2588, 0, 'qformat_missingword', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990769),
(2589, 0, 'qformat_missingword', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990769),
(2590, 0, 'qformat_multianswer', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990769),
(2591, 0, 'qformat_multianswer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990769),
(2592, 0, 'qformat_multianswer', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990769),
(2593, 0, 'qformat_webct', '2013050101', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990769),
(2594, 0, 'qformat_webct', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990769),
(2595, 0, 'qformat_webct', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990769),
(2596, 0, 'qformat_xhtml', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990769),
(2597, 0, 'qformat_xhtml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990769),
(2598, 0, 'qformat_xhtml', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990769),
(2599, 0, 'qformat_xml', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990769),
(2600, 0, 'qformat_xml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990769),
(2601, 0, 'qformat_xml', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990769),
(2602, 0, 'tool_assignmentupgrade', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990769),
(2603, 0, 'tool_assignmentupgrade', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990769),
(2604, 0, 'tool_assignmentupgrade', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990769),
(2605, 0, 'tool_behat', '2013050102', '2013110501', 'Starting plugin upgrade', NULL, '', 0, 1390990770),
(2606, 0, 'tool_behat', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1390990770),
(2607, 0, 'tool_behat', '2013110501', '2013110501', 'Plugin upgraded', NULL, '', 0, 1390990770),
(2608, 0, 'tool_capability', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990770),
(2609, 0, 'tool_capability', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990770),
(2610, 0, 'tool_capability', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990770),
(2611, 0, 'tool_customlang', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990770),
(2612, 0, 'tool_customlang', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990770),
(2613, 0, 'tool_customlang', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990770),
(2614, 0, 'tool_dbtransfer', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990770),
(2615, 0, 'tool_dbtransfer', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990770),
(2616, 0, 'tool_dbtransfer', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990770),
(2617, 0, 'tool_generator', '2013051402.04', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990770),
(2618, 0, 'tool_generator', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990770),
(2619, 0, 'tool_generator', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990770),
(2620, 0, 'tool_health', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990770),
(2621, 0, 'tool_health', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990770),
(2622, 0, 'tool_health', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990770),
(2623, 0, 'tool_innodb', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990770),
(2624, 0, 'tool_innodb', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990770),
(2625, 0, 'tool_innodb', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990770),
(2626, 0, 'tool_installaddon', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990770),
(2627, 0, 'tool_installaddon', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990770),
(2628, 0, 'tool_installaddon', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990770),
(2629, 0, 'tool_langimport', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990770),
(2630, 0, 'tool_langimport', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990770),
(2631, 0, 'tool_langimport', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990770),
(2632, 0, 'tool_multilangupgrade', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990770),
(2633, 0, 'tool_multilangupgrade', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990770),
(2634, 0, 'tool_multilangupgrade', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990770),
(2635, 0, 'tool_phpunit', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990770),
(2636, 0, 'tool_phpunit', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990770),
(2637, 0, 'tool_phpunit', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990770),
(2638, 0, 'tool_profiling', '2013050200', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990770),
(2639, 0, 'tool_profiling', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990770),
(2640, 0, 'tool_profiling', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990770),
(2641, 0, 'tool_qeupgradehelper', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990770),
(2642, 0, 'tool_qeupgradehelper', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990770),
(2643, 0, 'tool_qeupgradehelper', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990770),
(2644, 0, 'tool_replace', '2013050100', '2013110501', 'Starting plugin upgrade', NULL, '', 0, 1390990770),
(2645, 0, 'tool_replace', '2013110501', '2013110501', 'Upgrade savepoint reached', NULL, '', 0, 1390990770),
(2646, 0, 'tool_replace', '2013110501', '2013110501', 'Plugin upgraded', NULL, '', 0, 1390990771),
(2647, 0, 'tool_spamcleaner', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990771),
(2648, 0, 'tool_spamcleaner', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990771),
(2649, 0, 'tool_spamcleaner', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990771),
(2650, 0, 'tool_timezoneimport', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990771),
(2651, 0, 'tool_timezoneimport', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990771),
(2652, 0, 'tool_timezoneimport', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990771),
(2653, 0, 'tool_unsuproles', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990771),
(2654, 0, 'tool_unsuproles', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990771),
(2655, 0, 'tool_unsuproles', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990771),
(2656, 0, 'tool_uploadcourse', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1390990771),
(2657, 0, 'tool_uploadcourse', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990771),
(2658, 0, 'tool_uploadcourse', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1390990771),
(2659, 0, 'tool_uploaduser', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990771),
(2660, 0, 'tool_uploaduser', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990771),
(2661, 0, 'tool_uploaduser', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990771),
(2662, 0, 'tool_xmldb', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990771),
(2663, 0, 'tool_xmldb', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990771),
(2664, 0, 'tool_xmldb', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990771),
(2665, 0, 'cachestore_file', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990771),
(2666, 0, 'cachestore_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990771),
(2667, 0, 'cachestore_file', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990771),
(2668, 0, 'cachestore_memcache', '2013050700', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990771),
(2669, 0, 'cachestore_memcache', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990771),
(2670, 0, 'cachestore_memcache', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990771),
(2671, 0, 'cachestore_memcached', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990771),
(2672, 0, 'cachestore_memcached', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990771),
(2673, 0, 'cachestore_memcached', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990771),
(2674, 0, 'cachestore_mongodb', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990771),
(2675, 0, 'cachestore_mongodb', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990771),
(2676, 0, 'cachestore_mongodb', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990771),
(2677, 0, 'cachestore_session', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990771),
(2678, 0, 'cachestore_session', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990771),
(2679, 0, 'cachestore_session', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990771),
(2680, 0, 'cachestore_static', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990771),
(2681, 0, 'cachestore_static', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990771),
(2682, 0, 'cachestore_static', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990771),
(2683, 0, 'cachelock_file', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1390990771),
(2684, 0, 'cachelock_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990771),
(2685, 0, 'cachelock_file', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1390990771),
(2686, 0, 'theme_afterburner', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990771),
(2687, 0, 'theme_afterburner', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990772),
(2688, 0, 'theme_afterburner', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990772),
(2689, 0, 'theme_anomaly', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990772),
(2690, 0, 'theme_anomaly', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990772),
(2691, 0, 'theme_anomaly', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990772),
(2692, 0, 'theme_arialist', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990772),
(2693, 0, 'theme_arialist', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990772),
(2694, 0, 'theme_arialist', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990772),
(2695, 0, 'theme_base', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990772),
(2696, 0, 'theme_base', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990772),
(2697, 0, 'theme_base', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990772),
(2698, 0, 'theme_binarius', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990772),
(2699, 0, 'theme_binarius', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990772),
(2700, 0, 'theme_binarius', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990772),
(2701, 0, 'theme_bootstrapbase', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990772),
(2702, 0, 'theme_bootstrapbase', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990772),
(2703, 0, 'theme_bootstrapbase', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990772),
(2704, 0, 'theme_boxxie', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990772),
(2705, 0, 'theme_boxxie', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990772),
(2706, 0, 'theme_boxxie', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990772),
(2707, 0, 'theme_brick', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990772),
(2708, 0, 'theme_brick', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990772),
(2709, 0, 'theme_brick', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990772),
(2710, 0, 'theme_canvas', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990772),
(2711, 0, 'theme_canvas', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990772),
(2712, 0, 'theme_canvas', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990772),
(2713, 0, 'theme_clean', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990772),
(2714, 0, 'theme_clean', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990772),
(2715, 0, 'theme_clean', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990772),
(2716, 0, 'theme_formal_white', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990772),
(2717, 0, 'theme_formal_white', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990772),
(2718, 0, 'theme_formal_white', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990772),
(2719, 0, 'theme_formfactor', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990772),
(2720, 0, 'theme_formfactor', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990772),
(2721, 0, 'theme_formfactor', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990772),
(2722, 0, 'theme_fusion', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990772),
(2723, 0, 'theme_fusion', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990772),
(2724, 0, 'theme_fusion', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990772),
(2725, 0, 'theme_leatherbound', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990772),
(2726, 0, 'theme_leatherbound', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990772),
(2727, 0, 'theme_leatherbound', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990772),
(2728, 0, 'theme_magazine', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990772),
(2729, 0, 'theme_magazine', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990773),
(2730, 0, 'theme_magazine', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990773),
(2731, 0, 'theme_nimble', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990773),
(2732, 0, 'theme_nimble', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990773),
(2733, 0, 'theme_nimble', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990773),
(2734, 0, 'theme_nonzero', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990773),
(2735, 0, 'theme_nonzero', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990773),
(2736, 0, 'theme_nonzero', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990773),
(2737, 0, 'theme_overlay', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990773),
(2738, 0, 'theme_overlay', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990773),
(2739, 0, 'theme_overlay', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990773),
(2740, 0, 'theme_serenity', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990773),
(2741, 0, 'theme_serenity', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990773),
(2742, 0, 'theme_serenity', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990773),
(2743, 0, 'theme_sky_high', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990773),
(2744, 0, 'theme_sky_high', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990773),
(2745, 0, 'theme_sky_high', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990773),
(2746, 0, 'theme_splash', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990773),
(2747, 0, 'theme_splash', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990773),
(2748, 0, 'theme_splash', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990773),
(2749, 0, 'theme_standard', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990773),
(2750, 0, 'theme_standard', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990773),
(2751, 0, 'theme_standard', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990773),
(2752, 0, 'theme_standardold', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990773),
(2753, 0, 'theme_standardold', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990773),
(2754, 0, 'theme_standardold', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990773),
(2755, 0, 'assignsubmission_comments', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990773),
(2756, 0, 'assignsubmission_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990773),
(2757, 0, 'assignsubmission_comments', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990773),
(2758, 0, 'assignsubmission_file', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990773),
(2759, 0, 'assignsubmission_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990773),
(2760, 0, 'assignsubmission_file', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990773),
(2761, 0, 'assignsubmission_onlinetext', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990773),
(2762, 0, 'assignsubmission_onlinetext', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990773),
(2763, 0, 'assignsubmission_onlinetext', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990773),
(2764, 0, 'assignfeedback_comments', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990773),
(2765, 0, 'assignfeedback_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990773),
(2766, 0, 'assignfeedback_comments', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990773),
(2767, 0, 'assignfeedback_editpdf', NULL, '2013110800', 'Starting plugin installation', NULL, '', 0, 1390990773),
(2768, 0, 'assignfeedback_editpdf', '2013110800', '2013110800', 'Upgrade savepoint reached', NULL, '', 0, 1390990774),
(2769, 0, 'assignfeedback_editpdf', '2013110800', '2013110800', 'Plugin installed', NULL, '', 0, 1390990774),
(2770, 0, 'assignfeedback_file', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990774),
(2771, 0, 'assignfeedback_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990774),
(2772, 0, 'assignfeedback_file', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990774),
(2773, 0, 'assignfeedback_offline', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990774),
(2774, 0, 'assignfeedback_offline', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990774),
(2775, 0, 'assignfeedback_offline', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990774),
(2776, 0, 'assignment_offline', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990774),
(2777, 0, 'assignment_offline', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990774),
(2778, 0, 'assignment_offline', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990774),
(2779, 0, 'assignment_online', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990774),
(2780, 0, 'assignment_online', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990774),
(2781, 0, 'assignment_online', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990774),
(2782, 0, 'assignment_upload', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990774),
(2783, 0, 'assignment_upload', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990774),
(2784, 0, 'assignment_upload', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990774),
(2785, 0, 'assignment_uploadsingle', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990774),
(2786, 0, 'assignment_uploadsingle', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990774),
(2787, 0, 'assignment_uploadsingle', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990774),
(2788, 0, 'booktool_exportimscp', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990774),
(2789, 0, 'booktool_exportimscp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990775),
(2790, 0, 'booktool_exportimscp', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990775),
(2791, 0, 'booktool_importhtml', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990775),
(2792, 0, 'booktool_importhtml', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990775),
(2793, 0, 'booktool_importhtml', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990775),
(2794, 0, 'booktool_print', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990775),
(2795, 0, 'booktool_print', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990775),
(2796, 0, 'booktool_print', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990775),
(2797, 0, 'datafield_checkbox', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990775),
(2798, 0, 'datafield_checkbox', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990775),
(2799, 0, 'datafield_checkbox', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990775),
(2800, 0, 'datafield_date', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990775),
(2801, 0, 'datafield_date', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990775),
(2802, 0, 'datafield_date', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990775);
INSERT INTO `mdl_upgrade_log` (`id`, `type`, `plugin`, `version`, `targetversion`, `info`, `details`, `backtrace`, `userid`, `timemodified`) VALUES
(2803, 0, 'datafield_file', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990775),
(2804, 0, 'datafield_file', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990775),
(2805, 0, 'datafield_file', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990775),
(2806, 0, 'datafield_latlong', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990775),
(2807, 0, 'datafield_latlong', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990775),
(2808, 0, 'datafield_latlong', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990775),
(2809, 0, 'datafield_menu', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990775),
(2810, 0, 'datafield_menu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990775),
(2811, 0, 'datafield_menu', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990775),
(2812, 0, 'datafield_multimenu', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990775),
(2813, 0, 'datafield_multimenu', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990775),
(2814, 0, 'datafield_multimenu', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990775),
(2815, 0, 'datafield_number', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990775),
(2816, 0, 'datafield_number', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990775),
(2817, 0, 'datafield_number', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990775),
(2818, 0, 'datafield_picture', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990775),
(2819, 0, 'datafield_picture', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990776),
(2820, 0, 'datafield_picture', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990776),
(2821, 0, 'datafield_radiobutton', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990776),
(2822, 0, 'datafield_radiobutton', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990776),
(2823, 0, 'datafield_radiobutton', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990776),
(2824, 0, 'datafield_text', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990776),
(2825, 0, 'datafield_text', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990776),
(2826, 0, 'datafield_text', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990776),
(2827, 0, 'datafield_textarea', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990776),
(2828, 0, 'datafield_textarea', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990776),
(2829, 0, 'datafield_textarea', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990776),
(2830, 0, 'datafield_url', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990776),
(2831, 0, 'datafield_url', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990776),
(2832, 0, 'datafield_url', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990776),
(2833, 0, 'datapreset_imagegallery', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990776),
(2834, 0, 'datapreset_imagegallery', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990776),
(2835, 0, 'datapreset_imagegallery', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990776),
(2836, 0, 'quiz_grading', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990776),
(2837, 0, 'quiz_grading', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990776),
(2838, 0, 'quiz_grading', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990776),
(2839, 0, 'quiz_overview', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990776),
(2840, 0, 'quiz_overview', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990776),
(2841, 0, 'quiz_overview', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990776),
(2842, 0, 'quiz_responses', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990776),
(2843, 0, 'quiz_responses', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990776),
(2844, 0, 'quiz_responses', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990776),
(2845, 0, 'quiz_statistics', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990776),
(2846, 0, 'quiz_statistics', '2013092000', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990777),
(2847, 0, 'quiz_statistics', '2013093000', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990777),
(2848, 0, 'quiz_statistics', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990777),
(2849, 0, 'quiz_statistics', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990777),
(2850, 0, 'quizaccess_delaybetweenattempts', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990777),
(2851, 0, 'quizaccess_delaybetweenattempts', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990777),
(2852, 0, 'quizaccess_delaybetweenattempts', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990777),
(2853, 0, 'quizaccess_ipaddress', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990777),
(2854, 0, 'quizaccess_ipaddress', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990777),
(2855, 0, 'quizaccess_ipaddress', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990777),
(2856, 0, 'quizaccess_numattempts', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990777),
(2857, 0, 'quizaccess_numattempts', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990777),
(2858, 0, 'quizaccess_numattempts', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990777),
(2859, 0, 'quizaccess_openclosedate', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990777),
(2860, 0, 'quizaccess_openclosedate', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990777),
(2861, 0, 'quizaccess_openclosedate', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990777),
(2862, 0, 'quizaccess_password', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990777),
(2863, 0, 'quizaccess_password', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990777),
(2864, 0, 'quizaccess_password', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990777),
(2865, 0, 'quizaccess_safebrowser', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990777),
(2866, 0, 'quizaccess_safebrowser', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990777),
(2867, 0, 'quizaccess_safebrowser', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990777),
(2868, 0, 'quizaccess_securewindow', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990777),
(2869, 0, 'quizaccess_securewindow', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990777),
(2870, 0, 'quizaccess_securewindow', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990777),
(2871, 0, 'quizaccess_timelimit', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990777),
(2872, 0, 'quizaccess_timelimit', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990777),
(2873, 0, 'quizaccess_timelimit', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990777),
(2874, 0, 'scormreport_basic', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990777),
(2875, 0, 'scormreport_basic', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990777),
(2876, 0, 'scormreport_basic', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990777),
(2877, 0, 'scormreport_graphs', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990777),
(2878, 0, 'scormreport_graphs', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990777),
(2879, 0, 'scormreport_graphs', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990778),
(2880, 0, 'scormreport_interactions', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990778),
(2881, 0, 'scormreport_interactions', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990778),
(2882, 0, 'scormreport_interactions', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990778),
(2883, 0, 'scormreport_objectives', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1390990778),
(2884, 0, 'scormreport_objectives', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990778),
(2885, 0, 'scormreport_objectives', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1390990778),
(2886, 0, 'workshopform_accumulative', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990778),
(2887, 0, 'workshopform_accumulative', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990778),
(2888, 0, 'workshopform_accumulative', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990778),
(2889, 0, 'workshopform_comments', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990778),
(2890, 0, 'workshopform_comments', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990778),
(2891, 0, 'workshopform_comments', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990778),
(2892, 0, 'workshopform_numerrors', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990778),
(2893, 0, 'workshopform_numerrors', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990778),
(2894, 0, 'workshopform_numerrors', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990778),
(2895, 0, 'workshopform_rubric', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990778),
(2896, 0, 'workshopform_rubric', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990778),
(2897, 0, 'workshopform_rubric', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990778),
(2898, 0, 'workshopallocation_manual', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990778),
(2899, 0, 'workshopallocation_manual', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990778),
(2900, 0, 'workshopallocation_manual', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990778),
(2901, 0, 'workshopallocation_random', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990778),
(2902, 0, 'workshopallocation_random', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990778),
(2903, 0, 'workshopallocation_random', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990778),
(2904, 0, 'workshopallocation_scheduled', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990778),
(2905, 0, 'workshopallocation_scheduled', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990778),
(2906, 0, 'workshopallocation_scheduled', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990778),
(2907, 0, 'workshopeval_best', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990778),
(2908, 0, 'workshopeval_best', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990778),
(2909, 0, 'workshopeval_best', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990778),
(2910, 0, 'tinymce_ctrlhelp', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990778),
(2911, 0, 'tinymce_ctrlhelp', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990778),
(2912, 0, 'tinymce_ctrlhelp', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990778),
(2913, 0, 'tinymce_dragmath', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990778),
(2914, 0, 'tinymce_dragmath', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990778),
(2915, 0, 'tinymce_dragmath', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990778),
(2916, 0, 'tinymce_managefiles', NULL, '2014010800', 'Starting plugin installation', NULL, '', 0, 1390990778),
(2917, 0, 'tinymce_managefiles', '2014010800', '2014010800', 'Upgrade savepoint reached', NULL, '', 0, 1390990778),
(2918, 0, 'tinymce_managefiles', '2014010800', '2014010800', 'Plugin installed', NULL, '', 0, 1390990778),
(2919, 0, 'tinymce_moodleemoticon', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990778),
(2920, 0, 'tinymce_moodleemoticon', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990778),
(2921, 0, 'tinymce_moodleemoticon', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990779),
(2922, 0, 'tinymce_moodleimage', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990779),
(2923, 0, 'tinymce_moodleimage', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990779),
(2924, 0, 'tinymce_moodleimage', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990779),
(2925, 0, 'tinymce_moodlemedia', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990779),
(2926, 0, 'tinymce_moodlemedia', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990779),
(2927, 0, 'tinymce_moodlemedia', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990779),
(2928, 0, 'tinymce_moodlenolink', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990779),
(2929, 0, 'tinymce_moodlenolink', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990779),
(2930, 0, 'tinymce_moodlenolink', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990779),
(2931, 0, 'tinymce_pdw', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1390990779),
(2932, 0, 'tinymce_pdw', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990779),
(2933, 0, 'tinymce_pdw', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1390990779),
(2934, 0, 'tinymce_spellchecker', '2013050100', '2013110500', 'Starting plugin upgrade', NULL, '', 0, 1390990779),
(2935, 0, 'tinymce_spellchecker', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990779),
(2936, 0, 'tinymce_spellchecker', '2013110500', '2013110500', 'Plugin upgraded', NULL, '', 0, 1390990779),
(2937, 0, 'tinymce_wrap', NULL, '2013110500', 'Starting plugin installation', NULL, '', 0, 1390990779),
(2938, 0, 'tinymce_wrap', '2013110500', '2013110500', 'Upgrade savepoint reached', NULL, '', 0, 1390990779),
(2939, 0, 'tinymce_wrap', '2013110500', '2013110500', 'Plugin installed', NULL, '', 0, 1390990779),
(2940, 0, 'mod_certificate', '2012121302', '2013102300', 'Starting plugin upgrade', NULL, '', 2, 1390992594),
(2941, 0, 'mod_certificate', '2013102300', '2013102300', 'Upgrade savepoint reached', NULL, '', 2, 1390992594),
(2942, 0, 'mod_certificate', '2013102300', '2013102300', 'Plugin upgraded', NULL, '', 2, 1390992594),
(2943, 2, 'core', '2013111801.03', '2013111801.03', 'Exception: plugin_misplaced_exception', 'Plugin "auth_intake" is installed in incorrect location "$CFG-&gt;dirroot/auth/intake", expected location is "$CFG-&gt;dirroot/auth/email"', '* line 427 of \\lib\\upgradelib.php: plugin_misplaced_exception thrown\n* line 1580 of \\lib\\upgradelib.php: call to upgrade_plugins()\n* line 431 of \\admin\\index.php: call to upgrade_noncore()\n', 0, 1391172212);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_url`
--

CREATE TABLE IF NOT EXISTS `mdl_url` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `externalurl` longtext NOT NULL,
  `display` smallint(4) NOT NULL DEFAULT '0',
  `displayoptions` longtext,
  `parameters` longtext,
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_url_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='each record is one url resource' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user`
--

CREATE TABLE IF NOT EXISTS `mdl_user` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `auth` varchar(20) NOT NULL DEFAULT 'manual',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `policyagreed` tinyint(1) NOT NULL DEFAULT '0',
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `mnethostid` bigint(10) NOT NULL DEFAULT '0',
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL DEFAULT '',
  `idnumber` varchar(255) NOT NULL DEFAULT '',
  `firstname` varchar(100) NOT NULL DEFAULT '',
  `lastname` varchar(100) NOT NULL DEFAULT '',
  `email` varchar(100) NOT NULL DEFAULT '',
  `emailstop` tinyint(1) NOT NULL DEFAULT '0',
  `icq` varchar(15) NOT NULL DEFAULT '',
  `skype` varchar(50) NOT NULL DEFAULT '',
  `yahoo` varchar(50) NOT NULL DEFAULT '',
  `aim` varchar(50) NOT NULL DEFAULT '',
  `msn` varchar(50) NOT NULL DEFAULT '',
  `phone1` varchar(20) NOT NULL DEFAULT '',
  `phone2` varchar(20) NOT NULL DEFAULT '',
  `institution` varchar(255) NOT NULL DEFAULT '',
  `department` varchar(255) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(120) NOT NULL DEFAULT '',
  `country` varchar(2) NOT NULL DEFAULT '',
  `lang` varchar(30) NOT NULL DEFAULT 'en',
  `theme` varchar(50) NOT NULL DEFAULT '',
  `timezone` varchar(100) NOT NULL DEFAULT '99',
  `firstaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastaccess` bigint(10) NOT NULL DEFAULT '0',
  `lastlogin` bigint(10) NOT NULL DEFAULT '0',
  `currentlogin` bigint(10) NOT NULL DEFAULT '0',
  `lastip` varchar(45) NOT NULL DEFAULT '',
  `secret` varchar(15) NOT NULL DEFAULT '',
  `picture` bigint(10) NOT NULL DEFAULT '0',
  `url` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '1',
  `mailformat` tinyint(1) NOT NULL DEFAULT '1',
  `maildigest` tinyint(1) NOT NULL DEFAULT '0',
  `maildisplay` tinyint(2) NOT NULL DEFAULT '2',
  `autosubscribe` tinyint(1) NOT NULL DEFAULT '1',
  `trackforums` tinyint(1) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `trustbitmask` bigint(10) NOT NULL DEFAULT '0',
  `imagealt` varchar(255) DEFAULT NULL,
  `lastnamephonetic` varchar(255) DEFAULT NULL,
  `firstnamephonetic` varchar(255) DEFAULT NULL,
  `middlename` varchar(255) DEFAULT NULL,
  `alternatename` varchar(255) DEFAULT NULL,
  `calendartype` varchar(30) NOT NULL DEFAULT 'gregorian',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_user_mneuse_uix` (`mnethostid`,`username`),
  KEY `mdl_user_del_ix` (`deleted`),
  KEY `mdl_user_con_ix` (`confirmed`),
  KEY `mdl_user_fir_ix` (`firstname`),
  KEY `mdl_user_las_ix` (`lastname`),
  KEY `mdl_user_cit_ix` (`city`),
  KEY `mdl_user_cou_ix` (`country`),
  KEY `mdl_user_las2_ix` (`lastaccess`),
  KEY `mdl_user_ema_ix` (`email`),
  KEY `mdl_user_aut_ix` (`auth`),
  KEY `mdl_user_idn_ix` (`idnumber`),
  KEY `mdl_user_las3_ix` (`lastnamephonetic`),
  KEY `mdl_user_fir2_ix` (`firstnamephonetic`),
  KEY `mdl_user_mid_ix` (`middlename`),
  KEY `mdl_user_alt_ix` (`alternatename`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='One record for each person' AUTO_INCREMENT=7 ;

--
-- Dumping data for table `mdl_user`
--

INSERT INTO `mdl_user` (`id`, `auth`, `confirmed`, `policyagreed`, `deleted`, `suspended`, `mnethostid`, `username`, `password`, `idnumber`, `firstname`, `lastname`, `email`, `emailstop`, `icq`, `skype`, `yahoo`, `aim`, `msn`, `phone1`, `phone2`, `institution`, `department`, `address`, `city`, `country`, `lang`, `theme`, `timezone`, `firstaccess`, `lastaccess`, `lastlogin`, `currentlogin`, `lastip`, `secret`, `picture`, `url`, `description`, `descriptionformat`, `mailformat`, `maildigest`, `maildisplay`, `autosubscribe`, `trackforums`, `timecreated`, `timemodified`, `trustbitmask`, `imagealt`, `lastnamephonetic`, `firstnamephonetic`, `middlename`, `alternatename`, `calendartype`) VALUES
(1, 'manual', 1, 0, 0, 0, 1, 'guest', 'f7ce79d5792ff8274ea845a9084fb4dd', '', 'Guest user', ' ', 'root@localhost', 0, '', '', '', '', '', '', '', '', '', '', '', '', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', 'This user is a special user that allows read-only access to some courses.', 0, 1, 0, 2, 1, 0, 0, 1390393232, 0, NULL, NULL, NULL, NULL, NULL, 'gregorian'),
(2, 'manual', 1, 0, 0, 0, 1, 'admin', '$2y$10$JpHMKSfTVgL8xp4/tlg2/e3kwa6yKzD.snX/I0c9GQ0uMGgBAL24G', '', 'Admin', 'User', 'alexander.zhuravlev@intosoft.by', 0, '', '', '', '', '', '', '', '', '', '', 'Minsk', 'BY', 'en', '', '99', 1390393313, 1391176492, 1391172293, 1391172315, '127.0.0.1', '', 0, '', '', 0, 1, 0, 1, 1, 0, 0, 1391172315, 0, NULL, NULL, NULL, NULL, NULL, 'gregorian'),
(3, 'intake', 1, 0, 0, 0, 1, 'testuser', '289e3d7a0c42af241011446c626d8794', '', 'Test', 'User', 'testuser@mailforspam.com', 0, '', '', '', '', '', '', '', '', '', '', 'Menesk', 'BY', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 0, 1390571158, 1390571158, 0, '', NULL, NULL, NULL, NULL, 'gregorian'),
(4, 'intake', 1, 0, 0, 0, 1, 'testuser2', '$2y$10$w3Mk2r.QLkfvR.TlRm..Suafz5rBMIpKjNkDYHUAemloaF7a0voIa', '', 'Testuser2', 'Testuser2', 'testuser2@mailforspam.com', 0, '', '', '', '', '', '', '', '', '', '', 'Testuser2', 'IQ', 'en', '', '99', 1390572660, 1391168893, 1391168796, 1391168893, '127.0.0.1', '66uOtLZ28RFnKZp', 0, '', NULL, 0, 1, 0, 2, 1, 0, 1390572660, 1391168893, 0, NULL, NULL, NULL, NULL, NULL, 'gregorian'),
(5, 'intake', 1, 0, 0, 0, 1, 'teacher', '$2y$10$LqA9yjV6fxmIv6g99An0teyQQGw6y8J93H9riqyDOvRysmIu48Rfy', '', 'teacher', 'teacher', 'teacher@mailforspam.com', 0, '', '', '', '', '', '', '', '', '', '', '', 'BS', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 0, 1391086669, 1391086669, 0, '', '', '', '', '', 'gregorian'),
(6, 'intake', 1, 0, 0, 0, 1, 'student', '$2y$10$vYChx6x9Dz0PLcdYLZyR4ui.FYyo27TB5N/J1AV/N8tszfCXXnhEa', '', 'student', 'student', 'student@mailforspam.com', 0, '', '', '', '', '', '', '', '', '', '', '', 'AL', 'en', '', '99', 0, 0, 0, 0, '', '', 0, '', '', 1, 1, 0, 2, 1, 0, 1391086727, 1391086727, 0, '', '', '', '', '', 'gregorian');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_devices`
--

CREATE TABLE IF NOT EXISTS `mdl_user_devices` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `appid` varchar(128) NOT NULL DEFAULT '',
  `name` varchar(32) NOT NULL DEFAULT '',
  `model` varchar(32) NOT NULL DEFAULT '',
  `platform` varchar(32) NOT NULL DEFAULT '',
  `version` varchar(32) NOT NULL DEFAULT '',
  `pushid` varchar(255) NOT NULL DEFAULT '',
  `uuid` varchar(255) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userdevi_pususe_uix` (`pushid`,`userid`),
  UNIQUE KEY `mdl_userdevi_puspla_uix` (`pushid`,`platform`),
  KEY `mdl_userdevi_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_enrolments`
--

CREATE TABLE IF NOT EXISTS `mdl_user_enrolments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `status` bigint(10) NOT NULL DEFAULT '0',
  `enrolid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `timestart` bigint(10) NOT NULL DEFAULT '0',
  `timeend` bigint(10) NOT NULL DEFAULT '2147483647',
  `modifierid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userenro_enruse_uix` (`enrolid`,`userid`),
  KEY `mdl_userenro_enr_ix` (`enrolid`),
  KEY `mdl_userenro_use_ix` (`userid`),
  KEY `mdl_userenro_mod_ix` (`modifierid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Users participating in courses (aka enrolled users) - everyb' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_user_enrolments`
--

INSERT INTO `mdl_user_enrolments` (`id`, `status`, `enrolid`, `userid`, `timestart`, `timeend`, `modifierid`, `timecreated`, `timemodified`) VALUES
(1, 0, 1, 4, 1390572661, 0, 0, 1390572661, 1390572661),
(2, 0, 4, 6, 1391025600, 0, 2, 1391086973, 1391086973),
(3, 0, 4, 5, 1391025600, 0, 2, 1391086974, 1391086974);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_category`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_category` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Customisable fields categories' AUTO_INCREMENT=2 ;

--
-- Dumping data for table `mdl_user_info_category`
--

INSERT INTO `mdl_user_info_category` (`id`, `name`, `sortorder`) VALUES
(1, 'Other fields', 1);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_data`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_data` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `fieldid` bigint(10) NOT NULL DEFAULT '0',
  `data` longtext NOT NULL,
  `dataformat` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_userinfodata_usefie_ix` (`userid`,`fieldid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data for the customisable user fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_info_field`
--

CREATE TABLE IF NOT EXISTS `mdl_user_info_field` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `shortname` varchar(255) NOT NULL DEFAULT 'shortname',
  `name` longtext NOT NULL,
  `datatype` varchar(255) NOT NULL DEFAULT '',
  `description` longtext,
  `descriptionformat` tinyint(2) NOT NULL DEFAULT '0',
  `categoryid` bigint(10) NOT NULL DEFAULT '0',
  `sortorder` bigint(10) NOT NULL DEFAULT '0',
  `required` tinyint(2) NOT NULL DEFAULT '0',
  `locked` tinyint(2) NOT NULL DEFAULT '0',
  `visible` smallint(4) NOT NULL DEFAULT '0',
  `forceunique` tinyint(2) NOT NULL DEFAULT '0',
  `signup` tinyint(2) NOT NULL DEFAULT '0',
  `defaultdata` longtext,
  `defaultdataformat` tinyint(2) NOT NULL DEFAULT '0',
  `param1` longtext,
  `param2` longtext,
  `param3` longtext,
  `param4` longtext,
  `param5` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Customisable user profile fields' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_lastaccess`
--

CREATE TABLE IF NOT EXISTS `mdl_user_lastaccess` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `courseid` bigint(10) NOT NULL DEFAULT '0',
  `timeaccess` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userlast_usecou_uix` (`userid`,`courseid`),
  KEY `mdl_userlast_use_ix` (`userid`),
  KEY `mdl_userlast_cou_ix` (`courseid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='To keep track of course page access times, used in online pa' AUTO_INCREMENT=4 ;

--
-- Dumping data for table `mdl_user_lastaccess`
--

INSERT INTO `mdl_user_lastaccess` (`id`, `userid`, `courseid`, `timeaccess`) VALUES
(1, 2, 2, 1390908925),
(2, 4, 2, 1390577046),
(3, 2, 3, 1391087081);

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_password_resets`
--

CREATE TABLE IF NOT EXISTS `mdl_user_password_resets` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL,
  `timerequested` bigint(10) NOT NULL,
  `timererequested` bigint(10) NOT NULL DEFAULT '0',
  `token` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `mdl_userpassrese_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_preferences`
--

CREATE TABLE IF NOT EXISTS `mdl_user_preferences` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(1333) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_userpref_usenam_uix` (`userid`,`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='Allows modules to store arbitrary user preferences' AUTO_INCREMENT=25 ;

--
-- Dumping data for table `mdl_user_preferences`
--

INSERT INTO `mdl_user_preferences` (`id`, `userid`, `name`, `value`) VALUES
(1, 2, 'email_bounce_count', '1'),
(2, 2, 'email_send_count', '1'),
(3, 2, 'filepicker_recentrepository', '3'),
(4, 2, 'filepicker_recentlicense', 'allrightsreserved'),
(5, 2, 'userselector_preserveselected', '0'),
(6, 2, 'userselector_autoselectunique', '0'),
(7, 2, 'userselector_searchanywhere', '0'),
(8, 3, 'auth_forcepasswordchange', '0'),
(9, 3, 'email_bounce_count', '1'),
(10, 3, 'email_send_count', '1'),
(11, 4, 'block11hidden', '0'),
(12, 4, 'docked_block_instance_11', '0'),
(13, 4, 'docked_block_instance_12', '0'),
(14, 4, 'docked_block_instance_13', '0'),
(15, 2, 'usemodchooser', '0'),
(16, 2, 'course_edit_form_showadvanced', '1'),
(17, 5, 'auth_forcepasswordchange', '0'),
(18, 5, 'htmleditor', ''),
(19, 5, 'email_bounce_count', '1'),
(20, 5, 'email_send_count', '1'),
(21, 6, 'auth_forcepasswordchange', '0'),
(22, 6, 'htmleditor', ''),
(23, 6, 'email_bounce_count', '1'),
(24, 6, 'email_send_count', '1');

-- --------------------------------------------------------

--
-- Table structure for table `mdl_user_private_key`
--

CREATE TABLE IF NOT EXISTS `mdl_user_private_key` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `script` varchar(128) NOT NULL DEFAULT '',
  `value` varchar(128) NOT NULL DEFAULT '',
  `userid` bigint(10) NOT NULL,
  `instance` bigint(10) DEFAULT NULL,
  `iprestriction` varchar(255) DEFAULT NULL,
  `validuntil` bigint(10) DEFAULT NULL,
  `timecreated` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_userprivkey_scrval_ix` (`script`,`value`),
  KEY `mdl_userprivkey_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='access keys used in cookieless scripts - rss, etc.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_webdav_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_webdav_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `expiry` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `recursive` tinyint(1) NOT NULL DEFAULT '0',
  `exclusivelock` tinyint(1) NOT NULL DEFAULT '0',
  `created` bigint(10) NOT NULL DEFAULT '0',
  `modified` bigint(10) NOT NULL DEFAULT '0',
  `owner` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_webdlock_tok_uix` (`token`),
  KEY `mdl_webdlock_pat_ix` (`path`),
  KEY `mdl_webdlock_exp_ix` (`expiry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Resource locks for WebDAV users' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT 'Wiki',
  `intro` longtext,
  `introformat` smallint(4) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `firstpagetitle` varchar(255) NOT NULL DEFAULT 'First Page',
  `wikimode` varchar(20) NOT NULL DEFAULT 'collaborative',
  `defaultformat` varchar(20) NOT NULL DEFAULT 'creole',
  `forceformat` tinyint(1) NOT NULL DEFAULT '1',
  `editbegin` bigint(10) NOT NULL DEFAULT '0',
  `editend` bigint(10) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wiki_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Wiki activity configuration' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_links`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_links` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `frompageid` bigint(10) NOT NULL DEFAULT '0',
  `topageid` bigint(10) NOT NULL DEFAULT '0',
  `tomissingpage` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_wikilink_fro_ix` (`frompageid`),
  KEY `mdl_wikilink_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Page wiki links' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_locks`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_locks` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `sectionname` varchar(255) DEFAULT NULL,
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `lockedat` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Manages page locks' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_pages`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_pages` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL DEFAULT 'title',
  `cachedcontent` longtext NOT NULL,
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `timerendered` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `pageviews` bigint(10) NOT NULL DEFAULT '0',
  `readonly` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikipage_subtituse_uix` (`subwikiid`,`title`,`userid`),
  KEY `mdl_wikipage_sub_ix` (`subwikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_subwikis`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_subwikis` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `wikiid` bigint(10) NOT NULL DEFAULT '0',
  `groupid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisubw_wikgrouse_uix` (`wikiid`,`groupid`,`userid`),
  KEY `mdl_wikisubw_wik_ix` (`wikiid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores subwiki instances' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_synonyms`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_synonyms` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `subwikiid` bigint(10) NOT NULL DEFAULT '0',
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `pagesynonym` varchar(255) NOT NULL DEFAULT 'Pagesynonym',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_wikisyno_pagpag_uix` (`pageid`,`pagesynonym`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki pages synonyms' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_wiki_versions`
--

CREATE TABLE IF NOT EXISTS `mdl_wiki_versions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `pageid` bigint(10) NOT NULL DEFAULT '0',
  `content` longtext NOT NULL,
  `contentformat` varchar(20) NOT NULL DEFAULT 'creole',
  `version` mediumint(5) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_wikivers_pag_ix` (`pageid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores wiki page history' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `intro` longtext,
  `introformat` smallint(3) NOT NULL DEFAULT '0',
  `instructauthors` longtext,
  `instructauthorsformat` smallint(3) NOT NULL DEFAULT '0',
  `instructreviewers` longtext,
  `instructreviewersformat` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL,
  `phase` smallint(3) DEFAULT '0',
  `useexamples` tinyint(2) DEFAULT '0',
  `usepeerassessment` tinyint(2) DEFAULT '0',
  `useselfassessment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT '80.00000',
  `gradinggrade` decimal(10,5) DEFAULT '20.00000',
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `evaluation` varchar(30) NOT NULL DEFAULT '',
  `gradedecimals` smallint(3) DEFAULT '0',
  `nattachments` smallint(3) DEFAULT '0',
  `latesubmissions` tinyint(2) DEFAULT '0',
  `maxbytes` bigint(10) DEFAULT '100000',
  `examplesmode` smallint(3) DEFAULT '0',
  `submissionstart` bigint(10) DEFAULT '0',
  `submissionend` bigint(10) DEFAULT '0',
  `assessmentstart` bigint(10) DEFAULT '0',
  `assessmentend` bigint(10) DEFAULT '0',
  `phaseswitchassessment` tinyint(2) NOT NULL DEFAULT '0',
  `conclusion` longtext,
  `conclusionformat` smallint(3) NOT NULL DEFAULT '1',
  `overallfeedbackmode` smallint(3) DEFAULT '1',
  `overallfeedbackfiles` smallint(3) DEFAULT '0',
  `overallfeedbackmaxbytes` bigint(10) DEFAULT '100000',
  PRIMARY KEY (`id`),
  KEY `mdl_work_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This table keeps information about the module instances and ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopallocation_scheduled`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopallocation_scheduled` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `enabled` tinyint(2) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL,
  `timeallocated` bigint(10) DEFAULT NULL,
  `settings` longtext,
  `resultstatus` bigint(10) DEFAULT NULL,
  `resultmessage` varchar(1333) DEFAULT NULL,
  `resultlog` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worksche_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the allocation settings for the scheduled allocator' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopeval_best_settings`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopeval_best_settings` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `comparison` smallint(3) DEFAULT '5',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workbestsett_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Settings for the grading evaluation subplugin Comparison wit' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_accumulative`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_accumulative` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `grade` bigint(10) NOT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_workaccu_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Accumulative gradin' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_comments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_comments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workcomm_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Comments strategy f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  `descriptiontrust` bigint(10) DEFAULT NULL,
  `grade0` varchar(50) DEFAULT NULL,
  `grade1` varchar(50) DEFAULT NULL,
  `weight` mediumint(5) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `mdl_worknume_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Number of errors gr' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_numerrors_map`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_numerrors_map` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `nonegative` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_worknumemap_wornon_uix` (`workshopid`,`nonegative`),
  KEY `mdl_worknumemap_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='This maps the number of errors to a percentual grade for sub' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `sort` bigint(10) DEFAULT '0',
  `description` longtext,
  `descriptionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubr_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The assessment dimensions definitions of Rubric grading stra' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_config`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_config` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `layout` varchar(30) DEFAULT 'list',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workrubrconf_wor_uix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Configuration table for the Rubric grading strategy' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshopform_rubric_levels`
--

CREATE TABLE IF NOT EXISTS `mdl_workshopform_rubric_levels` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `definition` longtext,
  `definitionformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrleve_dim_ix` (`dimensionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The definition of rubric rating scales' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_aggregations`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_aggregations` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `userid` bigint(10) NOT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `timegraded` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workaggr_woruse_uix` (`workshopid`,`userid`),
  KEY `mdl_workaggr_wor_ix` (`workshopid`),
  KEY `mdl_workaggr_use_ix` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Aggregated grades for assessment are stored here. The aggreg' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `submissionid` bigint(10) NOT NULL,
  `reviewerid` bigint(10) NOT NULL,
  `weight` bigint(10) NOT NULL DEFAULT '1',
  `timecreated` bigint(10) DEFAULT '0',
  `timemodified` bigint(10) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradinggrade` decimal(10,5) DEFAULT NULL,
  `gradinggradeover` decimal(10,5) DEFAULT NULL,
  `gradinggradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `feedbackauthorattachment` smallint(3) DEFAULT '0',
  `feedbackreviewer` longtext,
  `feedbackreviewerformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_workasse_sub_ix` (`submissionid`),
  KEY `mdl_workasse_gra_ix` (`gradinggradeoverby`),
  KEY `mdl_workasse_rev_ix` (`reviewerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the made assessment and automatically calculated ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_assessments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_assessments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `submissionid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `timegraded` bigint(10) NOT NULL DEFAULT '0',
  `timeagreed` bigint(10) NOT NULL DEFAULT '0',
  `grade` double NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `teachergraded` smallint(3) NOT NULL DEFAULT '0',
  `mailed` smallint(3) NOT NULL DEFAULT '0',
  `resubmission` smallint(3) NOT NULL DEFAULT '0',
  `donotuse` smallint(3) NOT NULL DEFAULT '0',
  `generalcomment` longtext,
  `teachercomment` longtext,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workasseold_use_ix` (`userid`),
  KEY `mdl_workasseold_mai_ix` (`mailed`),
  KEY `mdl_workasseold_wor_ix` (`workshopid`),
  KEY `mdl_workasseold_sub_ix` (`submissionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_assessments table to be dropped later in Moo' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_comments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_comments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workcommold_use_ix` (`userid`),
  KEY `mdl_workcommold_mai_ix` (`mailed`),
  KEY `mdl_workcommold_wor_ix` (`workshopid`),
  KEY `mdl_workcommold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_comments table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_elements_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_elements_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `scale` smallint(3) NOT NULL DEFAULT '0',
  `maxscore` smallint(3) NOT NULL DEFAULT '1',
  `weight` smallint(3) NOT NULL DEFAULT '11',
  `stddev` double NOT NULL DEFAULT '0',
  `totalassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workelemold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_elements table to be dropped later in Moodle' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `assessmentid` bigint(10) NOT NULL,
  `strategy` varchar(30) NOT NULL DEFAULT '',
  `dimensionid` bigint(10) NOT NULL,
  `grade` decimal(10,5) NOT NULL,
  `peercomment` longtext,
  `peercommentformat` smallint(3) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `mdl_workgrad_assstrdim_uix` (`assessmentid`,`strategy`,`dimensionid`),
  KEY `mdl_workgrad_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='How the reviewers filled-up the grading forms, given grades ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_grades_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_grades_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `assessmentid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `feedback` longtext NOT NULL,
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workgradold_wor_ix` (`workshopid`),
  KEY `mdl_workgradold_ass_ix` (`assessmentid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_grades table to be dropped later in Moodle 2' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `course` bigint(10) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `wtype` smallint(3) NOT NULL DEFAULT '0',
  `nelements` smallint(3) NOT NULL DEFAULT '1',
  `nattachments` smallint(3) NOT NULL DEFAULT '0',
  `phase` tinyint(2) NOT NULL DEFAULT '0',
  `format` tinyint(2) NOT NULL DEFAULT '0',
  `gradingstrategy` tinyint(2) NOT NULL DEFAULT '1',
  `resubmit` tinyint(2) NOT NULL DEFAULT '0',
  `agreeassessments` tinyint(2) NOT NULL DEFAULT '0',
  `hidegrades` tinyint(2) NOT NULL DEFAULT '0',
  `anonymous` tinyint(2) NOT NULL DEFAULT '0',
  `includeself` tinyint(2) NOT NULL DEFAULT '0',
  `maxbytes` bigint(10) NOT NULL DEFAULT '100000',
  `submissionstart` bigint(10) NOT NULL DEFAULT '0',
  `assessmentstart` bigint(10) NOT NULL DEFAULT '0',
  `submissionend` bigint(10) NOT NULL DEFAULT '0',
  `assessmentend` bigint(10) NOT NULL DEFAULT '0',
  `releasegrades` bigint(10) NOT NULL DEFAULT '0',
  `grade` smallint(3) NOT NULL DEFAULT '0',
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `ntassessments` smallint(3) NOT NULL DEFAULT '0',
  `assessmentcomps` smallint(3) NOT NULL DEFAULT '2',
  `nsassessments` smallint(3) NOT NULL DEFAULT '0',
  `overallocation` smallint(3) NOT NULL DEFAULT '0',
  `timemodified` bigint(10) NOT NULL DEFAULT '0',
  `teacherweight` smallint(3) NOT NULL DEFAULT '1',
  `showleaguetable` smallint(3) NOT NULL DEFAULT '0',
  `usepassword` smallint(3) NOT NULL DEFAULT '0',
  `password` varchar(32) NOT NULL DEFAULT '',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workold_cou_ix` (`course`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop table to be dropped later in Moodle 2.x' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_rubrics_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_rubrics_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `rubricno` smallint(3) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workrubrold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_rubrics table to be dropped later in Moodle ' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_stockcomments_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_stockcomments_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `elementno` bigint(10) NOT NULL DEFAULT '0',
  `comments` longtext NOT NULL,
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_workstocold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_stockcomments table to be dropped later in M' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL,
  `example` tinyint(2) DEFAULT '0',
  `authorid` bigint(10) NOT NULL,
  `timecreated` bigint(10) NOT NULL,
  `timemodified` bigint(10) NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` longtext,
  `contentformat` smallint(3) NOT NULL DEFAULT '0',
  `contenttrust` smallint(3) NOT NULL DEFAULT '0',
  `attachment` tinyint(2) DEFAULT '0',
  `grade` decimal(10,5) DEFAULT NULL,
  `gradeover` decimal(10,5) DEFAULT NULL,
  `gradeoverby` bigint(10) DEFAULT NULL,
  `feedbackauthor` longtext,
  `feedbackauthorformat` smallint(3) DEFAULT '0',
  `timegraded` bigint(10) DEFAULT NULL,
  `published` tinyint(2) DEFAULT '0',
  `late` tinyint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mdl_worksubm_wor_ix` (`workshopid`),
  KEY `mdl_worksubm_gra_ix` (`gradeoverby`),
  KEY `mdl_worksubm_aut_ix` (`authorid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Info about the submission and the aggregation of the grade f' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mdl_workshop_submissions_old`
--

CREATE TABLE IF NOT EXISTS `mdl_workshop_submissions_old` (
  `id` bigint(10) NOT NULL AUTO_INCREMENT,
  `workshopid` bigint(10) NOT NULL DEFAULT '0',
  `userid` bigint(10) NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `timecreated` bigint(10) NOT NULL DEFAULT '0',
  `mailed` tinyint(2) NOT NULL DEFAULT '0',
  `description` longtext NOT NULL,
  `gradinggrade` smallint(3) NOT NULL DEFAULT '0',
  `finalgrade` smallint(3) NOT NULL DEFAULT '0',
  `late` smallint(3) NOT NULL DEFAULT '0',
  `nassessments` bigint(10) NOT NULL DEFAULT '0',
  `newplugin` varchar(28) DEFAULT NULL,
  `newid` bigint(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mdl_worksubmold_use_ix` (`userid`),
  KEY `mdl_worksubmold_mai_ix` (`mailed`),
  KEY `mdl_worksubmold_wor_ix` (`workshopid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Legacy workshop_submissions table to be dropped later in Moo' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
