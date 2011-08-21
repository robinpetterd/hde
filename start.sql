-- phpMyAdmin SQL Dump
-- version 3.2.5
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 22, 2011 at 09:57 AM
-- Server version: 5.1.44
-- PHP Version: 5.3.2

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `fs_sicklist`
--

-- --------------------------------------------------------

--
-- Table structure for table `AssumedTypes`
--

CREATE TABLE `AssumedTypes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('AssumedTypes') CHARACTER SET utf8 DEFAULT 'AssumedTypes',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `AssumedTypes`
--


-- --------------------------------------------------------

--
-- Table structure for table `CustomEvent`
--

CREATE TABLE `CustomEvent` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Transcript` mediumtext CHARACTER SET utf8,
  `Narrative` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `CustomEvent`
--


-- --------------------------------------------------------

--
-- Table structure for table `Email_BounceRecord`
--

CREATE TABLE `Email_BounceRecord` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Email_BounceRecord') CHARACTER SET utf8 DEFAULT 'Email_BounceRecord',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `BounceEmail` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `BounceTime` datetime DEFAULT NULL,
  `BounceMessage` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Email_BounceRecord`
--


-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage`
--

CREATE TABLE `ErrorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage`
--

INSERT INTO `ErrorPage` VALUES(4, 404);
INSERT INTO `ErrorPage` VALUES(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_Live`
--

CREATE TABLE `ErrorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ErrorPage_Live`
--

INSERT INTO `ErrorPage_Live` VALUES(4, 404);
INSERT INTO `ErrorPage_Live` VALUES(5, 500);

-- --------------------------------------------------------

--
-- Table structure for table `ErrorPage_versions`
--

CREATE TABLE `ErrorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ErrorCode` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `ErrorPage_versions`
--

INSERT INTO `ErrorPage_versions` VALUES(1, 4, 1, 404);
INSERT INTO `ErrorPage_versions` VALUES(2, 5, 1, 500);

-- --------------------------------------------------------

--
-- Table structure for table `EventData`
--

CREATE TABLE `EventData` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('EventData','CustomEvent') CHARACTER SET utf8 DEFAULT 'EventData',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `KnownAsID` int(11) NOT NULL DEFAULT '0',
  `EventID` int(11) NOT NULL DEFAULT '0',
  `SourceFileID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `KnownAsID` (`KnownAsID`),
  KEY `EventID` (`EventID`),
  KEY `SourceFileID` (`SourceFileID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `EventData`
--


-- --------------------------------------------------------

--
-- Table structure for table `EventData_Groups`
--

CREATE TABLE `EventData_Groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EventDataID` int(11) NOT NULL DEFAULT '0',
  `myGroupsID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventDataID` (`EventDataID`),
  KEY `myGroupsID` (`myGroupsID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `EventData_Groups`
--


-- --------------------------------------------------------

--
-- Table structure for table `EventData_Relationships`
--

CREATE TABLE `EventData_Relationships` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EventDataID` int(11) NOT NULL DEFAULT '0',
  `EventRelationshipID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventDataID` (`EventDataID`),
  KEY `EventRelationshipID` (`EventRelationshipID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `EventData_Relationships`
--


-- --------------------------------------------------------

--
-- Table structure for table `EventRelationship`
--

CREATE TABLE `EventRelationship` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('EventRelationship') CHARACTER SET utf8 DEFAULT 'EventRelationship',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Assumed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Narrative` mediumtext CHARACTER SET utf8,
  `RelativeID` int(11) NOT NULL DEFAULT '0',
  `TypeID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RelativeID` (`RelativeID`),
  KEY `TypeID` (`TypeID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `EventRelationship`
--


-- --------------------------------------------------------

--
-- Table structure for table `EventRelationship_AssumedType`
--

CREATE TABLE `EventRelationship_AssumedType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EventRelationshipID` int(11) NOT NULL DEFAULT '0',
  `AssumedTypesID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventRelationshipID` (`EventRelationshipID`),
  KEY `AssumedTypesID` (`AssumedTypesID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `EventRelationship_AssumedType`
--


-- --------------------------------------------------------

--
-- Table structure for table `Events`
--

CREATE TABLE `Events` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Events') CHARACTER SET utf8 DEFAULT 'Events',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` mediumtext CHARACTER SET utf8,
  `Day` int(11) NOT NULL DEFAULT '0',
  `Month` int(11) NOT NULL DEFAULT '0',
  `Year` int(11) NOT NULL DEFAULT '0',
  `Information` mediumtext CHARACTER SET utf8,
  `RuleFeatured` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RuleBased` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RuleIsEveryone` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RuleShowInLists` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `RuleRanStart` int(11) NOT NULL DEFAULT '0',
  `RuleRanEnd` int(11) NOT NULL DEFAULT '0',
  `LocationID` int(11) NOT NULL DEFAULT '0',
  `SourceFileID` int(11) NOT NULL DEFAULT '0',
  `SourceID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LocationID` (`LocationID`),
  KEY `SourceFileID` (`SourceFileID`),
  KEY `SourceID` (`SourceID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Events`
--


-- --------------------------------------------------------

--
-- Table structure for table `Events_Group`
--

CREATE TABLE `Events_Group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EventsID` int(11) NOT NULL DEFAULT '0',
  `myGroupsID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventsID` (`EventsID`),
  KEY `myGroupsID` (`myGroupsID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Events_Group`
--


-- --------------------------------------------------------

--
-- Table structure for table `Events_InformationPage`
--

CREATE TABLE `Events_InformationPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EventsID` int(11) NOT NULL DEFAULT '0',
  `InformationPageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `EventsID` (`EventsID`),
  KEY `InformationPageID` (`InformationPageID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Events_InformationPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `File`
--

CREATE TABLE `File` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('File','FLV','MP3','Image','Folder','Image_Cached') CHARACTER SET utf8 DEFAULT 'File',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Filename` mediumtext CHARACTER SET utf8,
  `Content` mediumtext CHARACTER SET utf8,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `OwnerID` int(11) NOT NULL DEFAULT '0',
  `SortOrder` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `OwnerID` (`OwnerID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `File`
--


-- --------------------------------------------------------

--
-- Table structure for table `Gender`
--

CREATE TABLE `Gender` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Gender') CHARACTER SET utf8 DEFAULT 'Gender',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Gender`
--

INSERT INTO `Gender` VALUES(1, 'Gender', '2011-08-22 09:45:29', '2011-08-22 09:45:29', 'Male');
INSERT INTO `Gender` VALUES(2, 'Gender', '2011-08-22 09:45:37', '2011-08-22 09:47:00', 'Female');

-- --------------------------------------------------------

--
-- Table structure for table `Group`
--

CREATE TABLE `Group` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Group') CHARACTER SET utf8 DEFAULT 'Group',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Description` mediumtext CHARACTER SET utf8,
  `Code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Locked` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `IPRestrictions` mediumtext CHARACTER SET utf8,
  `HtmlEditorConfig` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `Group`
--

INSERT INTO `Group` VALUES(1, 'Group', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'Content Authors', NULL, 'content-authors', 0, 1, NULL, NULL, 0);
INSERT INTO `Group` VALUES(2, 'Group', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'Administrators', NULL, 'administrators', 0, 0, NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Members`
--

CREATE TABLE `Group_Members` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `MemberID` (`MemberID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Group_Members`
--

INSERT INTO `Group_Members` VALUES(1, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `Group_Roles`
--

CREATE TABLE `Group_Roles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '0',
  `PermissionRoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `PermissionRoleID` (`PermissionRoleID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Group_Roles`
--


-- --------------------------------------------------------

--
-- Table structure for table `HomePage`
--

CREATE TABLE `HomePage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ContentBelow` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `HomePage`
--


-- --------------------------------------------------------

--
-- Table structure for table `HomePage_Live`
--

CREATE TABLE `HomePage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ContentBelow` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `HomePage_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `HomePage_versions`
--

CREATE TABLE `HomePage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `ContentBelow` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `HomePage_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `InformationPage`
--

CREATE TABLE `InformationPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Summary` mediumtext CHARACTER SET utf8,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `IconID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`),
  KEY `IconID` (`IconID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `InformationPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `InformationPage_Live`
--

CREATE TABLE `InformationPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Summary` mediumtext CHARACTER SET utf8,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `IconID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`),
  KEY `IconID` (`IconID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `InformationPage_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `InformationPage_References`
--

CREATE TABLE `InformationPage_References` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `InformationPageID` int(11) NOT NULL DEFAULT '0',
  `ReferenceID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `InformationPageID` (`InformationPageID`),
  KEY `ReferenceID` (`ReferenceID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `InformationPage_References`
--


-- --------------------------------------------------------

--
-- Table structure for table `InformationPage_versions`
--

CREATE TABLE `InformationPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Summary` mediumtext CHARACTER SET utf8,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `IconID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `ImageID` (`ImageID`),
  KEY `IconID` (`IconID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `InformationPage_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `Loc`
--

CREATE TABLE `Loc` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Loc','LocCounty','LocExact','LocRegion','LocState') CHARACTER SET utf8 DEFAULT 'Loc',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Latitude` float NOT NULL DEFAULT '0',
  `Longitude` float NOT NULL DEFAULT '0',
  `Assummed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Information` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Loc`
--


-- --------------------------------------------------------

--
-- Table structure for table `LocationsDisplayPage`
--

CREATE TABLE `LocationsDisplayPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PeoplePerPage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `LocationsDisplayPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `LocationsDisplayPage_Live`
--

CREATE TABLE `LocationsDisplayPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PeoplePerPage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `LocationsDisplayPage_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `LocationsDisplayPage_versions`
--

CREATE TABLE `LocationsDisplayPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `PeoplePerPage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `LocationsDisplayPage_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `LocCounty`
--

CREATE TABLE `LocCounty` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `StateID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `StateID` (`StateID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `LocCounty`
--


-- --------------------------------------------------------

--
-- Table structure for table `LocExact`
--

CREATE TABLE `LocExact` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `RegionID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RegionID` (`RegionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `LocExact`
--


-- --------------------------------------------------------

--
-- Table structure for table `LocRegion`
--

CREATE TABLE `LocRegion` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CountyID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CountyID` (`CountyID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `LocRegion`
--


-- --------------------------------------------------------

--
-- Table structure for table `LocState`
--

CREATE TABLE `LocState` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `LocState`
--


-- --------------------------------------------------------

--
-- Table structure for table `LoginAttempt`
--

CREATE TABLE `LoginAttempt` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('LoginAttempt') CHARACTER SET utf8 DEFAULT 'LoginAttempt',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Status` enum('Success','Failure') CHARACTER SET utf8 DEFAULT 'Success',
  `IP` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `LoginAttempt`
--


-- --------------------------------------------------------

--
-- Table structure for table `Member`
--

CREATE TABLE `Member` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Member') CHARACTER SET utf8 DEFAULT 'Member',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `FirstName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Surname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Email` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Password` varchar(160) CHARACTER SET utf8 DEFAULT NULL,
  `RememberLoginToken` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `NumVisit` int(11) NOT NULL DEFAULT '0',
  `LastVisited` datetime DEFAULT NULL,
  `Bounced` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AutoLoginHash` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `AutoLoginExpired` datetime DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PasswordExpiry` date DEFAULT NULL,
  `LockedOutUntil` datetime DEFAULT NULL,
  `Locale` varchar(6) CHARACTER SET utf8 DEFAULT NULL,
  `FailedLoginCount` int(11) NOT NULL DEFAULT '0',
  `DateFormat` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `TimeFormat` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `Email` (`Email`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `Member`
--

INSERT INTO `Member` VALUES(1, 'Member', '2011-08-18 09:59:37', '2011-08-22 09:09:21', 'Default Admin', NULL, NULL, NULL, NULL, 1, '2011-08-22 09:56:54', 0, NULL, NULL, NULL, NULL, NULL, NULL, 'en_US', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `MemberPassword`
--

CREATE TABLE `MemberPassword` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('MemberPassword') CHARACTER SET utf8 DEFAULT 'MemberPassword',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Password` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Salt` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `PasswordEncryption` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `MemberID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `MemberID` (`MemberID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `MemberPassword`
--


-- --------------------------------------------------------

--
-- Table structure for table `myGroups`
--

CREATE TABLE `myGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('myGroups') CHARACTER SET utf8 DEFAULT 'myGroups',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Day` int(11) NOT NULL DEFAULT '0',
  `Month` int(11) NOT NULL DEFAULT '0',
  `Year` int(11) NOT NULL DEFAULT '0',
  `Information` mediumtext CHARACTER SET utf8,
  `LocationID` int(11) NOT NULL DEFAULT '0',
  `SourceID` int(11) NOT NULL DEFAULT '0',
  `SourceFileID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LocationID` (`LocationID`),
  KEY `SourceID` (`SourceID`),
  KEY `SourceFileID` (`SourceFileID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `myGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `myGroups_InformationPage`
--

CREATE TABLE `myGroups_InformationPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `myGroupsID` int(11) NOT NULL DEFAULT '0',
  `InformationPageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `myGroupsID` (`myGroupsID`),
  KEY `InformationPageID` (`InformationPageID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `myGroups_InformationPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `myGroups_People`
--

CREATE TABLE `myGroups_People` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `myGroupsID` int(11) NOT NULL DEFAULT '0',
  `PersonID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `myGroupsID` (`myGroupsID`),
  KEY `PersonID` (`PersonID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `myGroups_People`
--


-- --------------------------------------------------------

--
-- Table structure for table `PageComment`
--

CREATE TABLE `PageComment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PageComment') CHARACTER SET utf8 DEFAULT 'PageComment',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `Comment` mediumtext CHARACTER SET utf8,
  `IsSpam` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `NeedsModeration` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `CommenterURL` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `SessionID` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `AuthorID` (`AuthorID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PageComment`
--


-- --------------------------------------------------------

--
-- Table structure for table `PeopleDisplayPage`
--

CREATE TABLE `PeopleDisplayPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PeoplePerPage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PeopleDisplayPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `PeopleDisplayPage_Live`
--

CREATE TABLE `PeopleDisplayPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PeoplePerPage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PeopleDisplayPage_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `PeopleDisplayPage_versions`
--

CREATE TABLE `PeopleDisplayPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `PeoplePerPage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PeopleDisplayPage_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `Permission`
--

CREATE TABLE `Permission` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Permission') CHARACTER SET utf8 DEFAULT 'Permission',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Arg` int(11) NOT NULL DEFAULT '0',
  `Type` int(11) NOT NULL DEFAULT '1',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `GroupID` (`GroupID`),
  KEY `Code` (`Code`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `Permission`
--

INSERT INTO `Permission` VALUES(1, 'Permission', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'CMS_ACCESS_CMSMain', 0, 1, 1);
INSERT INTO `Permission` VALUES(2, 'Permission', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'CMS_ACCESS_AssetAdmin', 0, 1, 1);
INSERT INTO `Permission` VALUES(3, 'Permission', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'CMS_ACCESS_CommentAdmin', 0, 1, 1);
INSERT INTO `Permission` VALUES(4, 'Permission', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'CMS_ACCESS_ReportAdmin', 0, 1, 1);
INSERT INTO `Permission` VALUES(5, 'Permission', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'SITETREE_REORGANISE', 0, 1, 1);
INSERT INTO `Permission` VALUES(6, 'Permission', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'ADMIN', 0, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `PermissionRole`
--

CREATE TABLE `PermissionRole` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRole') CHARACTER SET utf8 DEFAULT 'PermissionRole',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `OnlyAdminCanApply` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PermissionRole`
--


-- --------------------------------------------------------

--
-- Table structure for table `PermissionRoleCode`
--

CREATE TABLE `PermissionRoleCode` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('PermissionRoleCode') CHARACTER SET utf8 DEFAULT 'PermissionRoleCode',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `RoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RoleID` (`RoleID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `PermissionRoleCode`
--


-- --------------------------------------------------------

--
-- Table structure for table `Person`
--

CREATE TABLE `Person` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Person') CHARACTER SET utf8 DEFAULT 'Person',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Remarks` mediumtext CHARACTER SET utf8,
  `DateOfBirth` int(11) NOT NULL DEFAULT '0',
  `Featured` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `VisualID` int(11) NOT NULL DEFAULT '0',
  `GenderID` int(11) NOT NULL DEFAULT '0',
  `CustomImageID` int(11) NOT NULL DEFAULT '0',
  `StatusID` int(11) NOT NULL DEFAULT '0',
  `RoleID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `VisualID` (`VisualID`),
  KEY `GenderID` (`GenderID`),
  KEY `CustomImageID` (`CustomImageID`),
  KEY `StatusID` (`StatusID`),
  KEY `ClassName` (`ClassName`),
  KEY `RoleID` (`RoleID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Person`
--


-- --------------------------------------------------------

--
-- Table structure for table `Person_EventData`
--

CREATE TABLE `Person_EventData` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PersonID` int(11) NOT NULL DEFAULT '0',
  `EventDataID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PersonID` (`PersonID`),
  KEY `EventDataID` (`EventDataID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Person_EventData`
--


-- --------------------------------------------------------

--
-- Table structure for table `Person_InformationPage`
--

CREATE TABLE `Person_InformationPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PersonID` int(11) NOT NULL DEFAULT '0',
  `InformationPageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `PersonID` (`PersonID`),
  KEY `InformationPageID` (`InformationPageID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Person_InformationPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `QueuedEmail`
--

CREATE TABLE `QueuedEmail` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('QueuedEmail') CHARACTER SET utf8 DEFAULT 'QueuedEmail',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Send` datetime DEFAULT NULL,
  `Subject` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `From` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `ToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ToID` (`ToID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `QueuedEmail`
--


-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage`
--

CREATE TABLE `RedirectorPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `RedirectorPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_Live`
--

CREATE TABLE `RedirectorPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `RedirectorPage_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `RedirectorPage_versions`
--

CREATE TABLE `RedirectorPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `RedirectionType` enum('Internal','External') CHARACTER SET utf8 DEFAULT 'Internal',
  `ExternalURL` varchar(2083) CHARACTER SET utf8 DEFAULT NULL,
  `LinkToID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `LinkToID` (`LinkToID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `RedirectorPage_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `Reference`
--

CREATE TABLE `Reference` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Name` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Reference`
--


-- --------------------------------------------------------

--
-- Table structure for table `Relationship`
--

CREATE TABLE `Relationship` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Relationship') CHARACTER SET utf8 DEFAULT 'Relationship',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Assumed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Narrative` mediumtext CHARACTER SET utf8,
  `TypeID` int(11) NOT NULL DEFAULT '0',
  `SourceFileID` int(11) NOT NULL DEFAULT '0',
  `SourceID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `TypeID` (`TypeID`),
  KEY `SourceFileID` (`SourceFileID`),
  KEY `SourceID` (`SourceID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Relationship`
--


-- --------------------------------------------------------

--
-- Table structure for table `RelationshipTypes`
--

CREATE TABLE `RelationshipTypes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('RelationshipTypes') CHARACTER SET utf8 DEFAULT 'RelationshipTypes',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `thickness` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `color` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `alpha` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `RelationshipTypes`
--

INSERT INTO `RelationshipTypes` VALUES(1, 'RelationshipTypes', '2011-08-22 09:54:56', '2011-08-22 09:54:56', 'Married', '1', '#000000', '1');

-- --------------------------------------------------------

--
-- Table structure for table `Relationship_AssumedType`
--

CREATE TABLE `Relationship_AssumedType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RelationshipID` int(11) NOT NULL DEFAULT '0',
  `AssumedTypesID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RelationshipID` (`RelationshipID`),
  KEY `AssumedTypesID` (`AssumedTypesID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Relationship_AssumedType`
--


-- --------------------------------------------------------

--
-- Table structure for table `Relationship_Relatives`
--

CREATE TABLE `Relationship_Relatives` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RelationshipID` int(11) NOT NULL DEFAULT '0',
  `PersonID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RelationshipID` (`RelationshipID`),
  KEY `PersonID` (`PersonID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Relationship_Relatives`
--


-- --------------------------------------------------------

--
-- Table structure for table `Role`
--

CREATE TABLE `Role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Role') CHARACTER SET utf8 DEFAULT 'Role',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11 ;

--
-- Dumping data for table `Role`
--

INSERT INTO `Role` VALUES(1, 'Role', '2011-08-22 09:50:45', '2011-08-22 09:50:53', 'Convict', 0);
INSERT INTO `Role` VALUES(2, 'Role', '2011-08-22 09:50:57', '2011-08-22 09:50:59', 'Crew', 0);
INSERT INTO `Role` VALUES(3, 'Role', '2011-08-22 09:51:11', '2011-08-22 09:51:11', 'Soldier', 0);
INSERT INTO `Role` VALUES(4, 'Role', '2011-08-22 09:51:24', '2011-08-22 09:51:24', 'Soldier''s wife', 0);
INSERT INTO `Role` VALUES(5, 'Role', '2011-08-22 09:51:39', '2011-08-22 09:51:39', 'Soldier''s child', 0);
INSERT INTO `Role` VALUES(6, 'Role', '2011-08-22 09:51:49', '2011-08-22 09:51:49', 'Convict''s child', 0);
INSERT INTO `Role` VALUES(7, 'Role', '2011-08-22 09:52:00', '2011-08-22 09:52:00', 'Passenger', 0);
INSERT INTO `Role` VALUES(8, 'Role', '2011-08-22 09:52:10', '2011-08-22 09:52:10', 'Passenger''s child', 0);
INSERT INTO `Role` VALUES(9, 'Role', '2011-08-22 09:52:22', '2011-08-22 09:52:22', 'Status unknown', 0);
INSERT INTO `Role` VALUES(10, 'Role', '2011-08-22 09:52:33', '2011-08-22 09:52:33', 'No Data', 0);

-- --------------------------------------------------------

--
-- Table structure for table `SearchPersonResultsPage`
--

CREATE TABLE `SearchPersonResultsPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PeoplePerPage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SearchPersonResultsPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `SearchPersonResultsPage_Live`
--

CREATE TABLE `SearchPersonResultsPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PeoplePerPage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SearchPersonResultsPage_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `SearchPersonResultsPage_versions`
--

CREATE TABLE `SearchPersonResultsPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `PeoplePerPage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SearchPersonResultsPage_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `SearchSourceResultsPage`
--

CREATE TABLE `SearchSourceResultsPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PeoplePerPage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SearchSourceResultsPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `SearchSourceResultsPage_Live`
--

CREATE TABLE `SearchSourceResultsPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PeoplePerPage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SearchSourceResultsPage_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `SearchSourceResultsPage_versions`
--

CREATE TABLE `SearchSourceResultsPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `PeoplePerPage` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SearchSourceResultsPage_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `Ship`
--

CREATE TABLE `Ship` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Ship') CHARACTER SET utf8 DEFAULT 'Ship',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Captain` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Day` int(11) NOT NULL DEFAULT '0',
  `Month` int(11) NOT NULL DEFAULT '0',
  `Year` int(11) NOT NULL DEFAULT '0',
  `LeavesFromID` int(11) NOT NULL DEFAULT '0',
  `LocationID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `LeavesFromID` (`LeavesFromID`),
  KEY `LocationID` (`LocationID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Ship`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig`
--

CREATE TABLE `SiteConfig` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteConfig') CHARACTER SET utf8 DEFAULT 'SiteConfig',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Tagline` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Theme` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'Anyone',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'LoggedInUsers',
  `CanCreateTopLevelType` enum('LoggedInUsers','OnlyTheseUsers') CHARACTER SET utf8 DEFAULT 'LoggedInUsers',
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `SiteConfig`
--

INSERT INTO `SiteConfig` VALUES(1, 'SiteConfig', '2011-08-18 09:59:37', '2011-08-22 09:19:00', 'Your Site Name', 'your tagline here', 'theme-fs-sicklist', 'Anyone', 'LoggedInUsers', 'LoggedInUsers');

-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_CreateTopLevelGroups`
--

CREATE TABLE `SiteConfig_CreateTopLevelGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteConfig_CreateTopLevelGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_EditorGroups`
--

CREATE TABLE `SiteConfig_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteConfig_EditorGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteConfig_ViewerGroups`
--

CREATE TABLE `SiteConfig_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteConfigID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteConfigID` (`SiteConfigID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteConfig_ViewerGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteTree`
--

CREATE TABLE `SiteTree` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','EventDisplayPage','EventsDisplayPage','GroupDisplayPage','GroupsDisplayPage','LocationsDisplayPage','LocationDisplayPage','PeopleDisplayPage','PersonDisplayPage','SearchPersonResultsPage','SearchSourceResultsPage','SourceDetailDisplayPage','SourceDisplayPage','SourceImageDisplayPage','SourceImagesDisplayPage','HomePage','Information','InformationPage','ErrorPage','RedirectorPage','VirtualPage') CHARACTER SET utf8 DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `MetaKeywords` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HomepageForDomain` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ProvideComments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Status` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `ToDo` mediumtext CHARACTER SET utf8,
  `Version` int(11) NOT NULL DEFAULT '0',
  `Priority` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `SiteTree`
--

INSERT INTO `SiteTree` VALUES(1, 'Page', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0);
INSERT INTO `SiteTree` VALUES(2, 'Page', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0);
INSERT INTO `SiteTree` VALUES(3, 'Page', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0);
INSERT INTO `SiteTree` VALUES(4, 'ErrorPage', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 4, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0);
INSERT INTO `SiteTree` VALUES(5, 'ErrorPage', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 5, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0);
INSERT INTO `SiteTree` VALUES(6, 'Page', '2011-08-18 10:00:08', '2011-08-18 10:00:21', 'new-page', 'New Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 6, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 2, '1.0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_EditorGroups`
--

CREATE TABLE `SiteTree_EditorGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteTree_EditorGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ImageTracking`
--

CREATE TABLE `SiteTree_ImageTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `FileID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `FileID` (`FileID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteTree_ImageTracking`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_LinkTracking`
--

CREATE TABLE `SiteTree_LinkTracking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `ChildID` int(11) NOT NULL DEFAULT '0',
  `FieldName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `ChildID` (`ChildID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteTree_LinkTracking`
--


-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_Live`
--

CREATE TABLE `SiteTree_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SiteTree','Page','EventDisplayPage','EventsDisplayPage','GroupDisplayPage','GroupsDisplayPage','LocationsDisplayPage','LocationDisplayPage','PeopleDisplayPage','PersonDisplayPage','SearchPersonResultsPage','SearchSourceResultsPage','SourceDetailDisplayPage','SourceDisplayPage','SourceImageDisplayPage','SourceImagesDisplayPage','HomePage','Information','InformationPage','ErrorPage','RedirectorPage','VirtualPage') CHARACTER SET utf8 DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `MetaKeywords` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HomepageForDomain` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ProvideComments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Status` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `ToDo` mediumtext CHARACTER SET utf8,
  `Version` int(11) NOT NULL DEFAULT '0',
  `Priority` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `SiteTree_Live`
--

INSERT INTO `SiteTree_Live` VALUES(1, 'Page', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0);
INSERT INTO `SiteTree_Live` VALUES(2, 'Page', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0);
INSERT INTO `SiteTree_Live` VALUES(3, 'Page', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0);
INSERT INTO `SiteTree_Live` VALUES(4, 'ErrorPage', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 4, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0);
INSERT INTO `SiteTree_Live` VALUES(5, 'ErrorPage', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 5, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, 1, NULL, 0);
INSERT INTO `SiteTree_Live` VALUES(6, 'Page', '2011-08-18 10:00:08', '2011-08-18 10:00:21', 'new-page', 'New Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 6, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, 2, '1.0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_versions`
--

CREATE TABLE `SiteTree_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `WasPublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `AuthorID` int(11) NOT NULL DEFAULT '0',
  `PublisherID` int(11) NOT NULL DEFAULT '0',
  `ClassName` enum('SiteTree','Page','EventDisplayPage','EventsDisplayPage','GroupDisplayPage','GroupsDisplayPage','LocationsDisplayPage','LocationDisplayPage','PeopleDisplayPage','PersonDisplayPage','SearchPersonResultsPage','SearchSourceResultsPage','SourceDetailDisplayPage','SourceDisplayPage','SourceImageDisplayPage','SourceImagesDisplayPage','HomePage','Information','InformationPage','ErrorPage','RedirectorPage','VirtualPage') CHARACTER SET utf8 DEFAULT 'SiteTree',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `URLSegment` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `Title` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MenuTitle` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `Content` mediumtext CHARACTER SET utf8,
  `MetaTitle` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `MetaDescription` mediumtext CHARACTER SET utf8,
  `MetaKeywords` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ExtraMeta` mediumtext CHARACTER SET utf8,
  `ShowInMenus` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ShowInSearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HomepageForDomain` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `ProvideComments` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Sort` int(11) NOT NULL DEFAULT '0',
  `HasBrokenFile` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `HasBrokenLink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Status` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ReportClass` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CanViewType` enum('Anyone','LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `CanEditType` enum('LoggedInUsers','OnlyTheseUsers','Inherit') CHARACTER SET utf8 DEFAULT 'Inherit',
  `ToDo` mediumtext CHARACTER SET utf8,
  `Priority` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `AuthorID` (`AuthorID`),
  KEY `PublisherID` (`PublisherID`),
  KEY `ParentID` (`ParentID`),
  KEY `URLSegment` (`URLSegment`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `SiteTree_versions`
--

INSERT INTO `SiteTree_versions` VALUES(1, 1, 1, 1, 0, 0, 'Page', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'home', 'Home', NULL, '<p>Welcome to SilverStripe! This is the default homepage. You can edit this page by opening <a href="admin/">the CMS</a>. You can now access the <a href="http://doc.silverstripe.org">developer documentation</a>, or begin <a href="http://doc.silverstripe.org/doku.php?id=tutorials">the tutorials.</a></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 1, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, NULL, 0);
INSERT INTO `SiteTree_versions` VALUES(2, 2, 1, 1, 0, 0, 'Page', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'about-us', 'About Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 2, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, NULL, 0);
INSERT INTO `SiteTree_versions` VALUES(3, 3, 1, 1, 0, 0, 'Page', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'contact-us', 'Contact Us', NULL, '<p>You can fill this page out with your own content, or delete it and create your own pages.<br/></p>', NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 3, 0, 0, 'Published', NULL, 'Inherit', 'Inherit', NULL, NULL, 0);
INSERT INTO `SiteTree_versions` VALUES(4, 4, 1, 1, 1, 1, 'ErrorPage', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'page-not-found', 'Page not found', NULL, '<p>Sorry, it seems you were trying to access a page that doesn''t exist.</p><p>Please check the spelling of the URL you were trying to access and try again.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 4, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, NULL, 0);
INSERT INTO `SiteTree_versions` VALUES(5, 5, 1, 1, 1, 1, 'ErrorPage', '2011-08-18 09:59:37', '2011-08-18 09:59:37', 'server-error', 'Server error', NULL, '<p>Sorry, there was a problem with handling your request.</p>', NULL, NULL, NULL, NULL, 0, 0, NULL, 0, 5, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, NULL, 0);
INSERT INTO `SiteTree_versions` VALUES(6, 6, 1, 0, 1, 0, 'Page', '2011-08-18 10:00:08', '2011-08-18 10:00:08', 'new-page', 'New Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 6, 0, 0, 'New page', NULL, 'Inherit', 'Inherit', NULL, NULL, 0);
INSERT INTO `SiteTree_versions` VALUES(7, 6, 2, 1, 1, 1, 'Page', '2011-08-18 10:00:08', '2011-08-18 10:00:21', 'new-page', 'New Page', NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL, 0, 6, 0, 0, 'Saved (new)', NULL, 'Inherit', 'Inherit', NULL, '1.0', 0);

-- --------------------------------------------------------

--
-- Table structure for table `SiteTree_ViewerGroups`
--

CREATE TABLE `SiteTree_ViewerGroups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SiteTreeID` int(11) NOT NULL DEFAULT '0',
  `GroupID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `SiteTreeID` (`SiteTreeID`),
  KEY `GroupID` (`GroupID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SiteTree_ViewerGroups`
--


-- --------------------------------------------------------

--
-- Table structure for table `SourceDetailDisplayPage`
--

CREATE TABLE `SourceDetailDisplayPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Instructions` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SourceDetailDisplayPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `SourceDetailDisplayPage_Live`
--

CREATE TABLE `SourceDetailDisplayPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Instructions` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SourceDetailDisplayPage_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `SourceDetailDisplayPage_versions`
--

CREATE TABLE `SourceDetailDisplayPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Instructions` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SourceDetailDisplayPage_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `SourceImage`
--

CREATE TABLE `SourceImage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('SourceImage') CHARACTER SET utf8 DEFAULT 'SourceImage',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Keywords` mediumtext CHARACTER SET utf8,
  `Transcript` mediumtext CHARACTER SET utf8,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  `mySourceID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`),
  KEY `mySourceID` (`mySourceID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SourceImage`
--


-- --------------------------------------------------------

--
-- Table structure for table `SourceImages`
--

CREATE TABLE `SourceImages` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Archive` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `Code` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `AllAsZipID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `AllAsZipID` (`AllAsZipID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SourceImages`
--


-- --------------------------------------------------------

--
-- Table structure for table `SourceImagesDisplayPage`
--

CREATE TABLE `SourceImagesDisplayPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Instructions` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SourceImagesDisplayPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `SourceImagesDisplayPage_Live`
--

CREATE TABLE `SourceImagesDisplayPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Instructions` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SourceImagesDisplayPage_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `SourceImagesDisplayPage_versions`
--

CREATE TABLE `SourceImagesDisplayPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `Instructions` mediumtext CHARACTER SET utf8,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SourceImagesDisplayPage_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `Sources`
--

CREATE TABLE `Sources` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Sources','Reference','SourceImages','SourceWeb') CHARACTER SET utf8 DEFAULT 'Sources',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` mediumtext CHARACTER SET utf8,
  `Featured` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `Day` int(11) NOT NULL DEFAULT '0',
  `Month` int(11) NOT NULL DEFAULT '0',
  `Year` int(11) NOT NULL DEFAULT '0',
  `YearEnded` int(11) NOT NULL DEFAULT '0',
  `Explaination` mediumtext CHARACTER SET utf8,
  `Transcription` mediumtext CHARACTER SET utf8,
  `IconID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IconID` (`IconID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Sources`
--


-- --------------------------------------------------------

--
-- Table structure for table `SourceWeb`
--

CREATE TABLE `SourceWeb` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `URL` mediumtext CHARACTER SET utf8,
  `DateLastVisited` date DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `SourceWeb`
--


-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage`
--

CREATE TABLE `VirtualPage` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `VirtualPage`
--


-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_Live`
--

CREATE TABLE `VirtualPage_Live` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `VirtualPage_Live`
--


-- --------------------------------------------------------

--
-- Table structure for table `VirtualPage_versions`
--

CREATE TABLE `VirtualPage_versions` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RecordID` int(11) NOT NULL DEFAULT '0',
  `Version` int(11) NOT NULL DEFAULT '0',
  `VersionID` int(11) NOT NULL DEFAULT '0',
  `CopyContentFromID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `RecordID_Version` (`RecordID`,`Version`),
  KEY `RecordID` (`RecordID`),
  KEY `Version` (`Version`),
  KEY `CopyContentFromID` (`CopyContentFromID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `VirtualPage_versions`
--


-- --------------------------------------------------------

--
-- Table structure for table `Visual`
--

CREATE TABLE `Visual` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Visual') CHARACTER SET utf8 DEFAULT 'Visual',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `ImageID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ImageID` (`ImageID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Visual`
--


-- --------------------------------------------------------

--
-- Table structure for table `Widget`
--

CREATE TABLE `Widget` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('Widget') CHARACTER SET utf8 DEFAULT 'Widget',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Sort` int(11) NOT NULL DEFAULT '0',
  `Enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ParentID` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `ParentID` (`ParentID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `Widget`
--


-- --------------------------------------------------------

--
-- Table structure for table `WidgetArea`
--

CREATE TABLE `WidgetArea` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('WidgetArea') CHARACTER SET utf8 DEFAULT 'WidgetArea',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `WidgetArea`
--


-- --------------------------------------------------------

--
-- Table structure for table `WorkFlow`
--

CREATE TABLE `WorkFlow` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` enum('WorkFlow') CHARACTER SET utf8 DEFAULT 'WorkFlow',
  `Created` datetime DEFAULT NULL,
  `LastEdited` datetime DEFAULT NULL,
  `Name` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ClassName` (`ClassName`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `WorkFlow`
--

INSERT INTO `WorkFlow` VALUES(1, 'WorkFlow', '2011-08-22 09:49:27', '2011-08-22 09:49:27', 'Publish');
INSERT INTO `WorkFlow` VALUES(2, 'WorkFlow', '2011-08-22 09:49:32', '2011-08-22 09:49:36', 'Draft');
