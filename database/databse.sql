/*
SQLyog Community v13.3.0 (64 bit)
MySQL - 10.4.32-MariaDB : Database - flightbooking
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`flightbooking` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;

USE `flightbooking`;

/*Table structure for table `airline` */

DROP TABLE IF EXISTS `airline`;

CREATE TABLE `airline` (
  `airlineid` int(11) NOT NULL AUTO_INCREMENT,
  `airlinename` varchar(100) DEFAULT NULL,
  `airlinelogo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`airlineid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airline` */

insert  into `airline`(`airlineid`,`airlinename`,`airlinelogo`) values 
(1,'Kenya Airways','KQ.jpg'),
(2,'Jambojet','jambo.jpg'),
(3,'Uganda Airways','ugandajpg'),
(4,'Rwanda Airways','rwanda.jpg');

/*Table structure for table `airport` */

DROP TABLE IF EXISTS `airport`;

CREATE TABLE `airport` (
  `airportid` int(11) NOT NULL AUTO_INCREMENT,
  `airportcode` varchar(10) DEFAULT NULL,
  `airportname` varchar(100) DEFAULT NULL,
  `cityid` int(11) DEFAULT NULL,
  PRIMARY KEY (`airportid`),
  KEY `cityid` (`cityid`),
  CONSTRAINT `airport_ibfk_1` FOREIGN KEY (`cityid`) REFERENCES `city` (`cityid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `airport` */

insert  into `airport`(`airportid`,`airportcode`,`airportname`,`cityid`) values 
(1,'JKIA','JomoKenyatta',3),
(2,'EBB','Entebe International Airport',5),
(3,'DOD','Dodoma Airport',4),
(4,'EBB','Entebe International Airport',5);

/*Table structure for table `bookingpassenger` */

DROP TABLE IF EXISTS `bookingpassenger`;

CREATE TABLE `bookingpassenger` (
  `bookingpassengerid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingclassid` int(11) DEFAULT NULL,
  `iddocument` varchar(50) DEFAULT NULL,
  `idcocumentno` varchar(50) DEFAULT NULL,
  `firstname` varchar(100) DEFAULT NULL,
  `middlename` varchar(100) DEFAULT NULL,
  `lastname` varchar(100) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `dateofbirth` date DEFAULT NULL,
  PRIMARY KEY (`bookingpassengerid`),
  KEY `bookingclassid` (`bookingclassid`),
  CONSTRAINT `bookingpassenger_ibfk_1` FOREIGN KEY (`bookingclassid`) REFERENCES `flightbookingclasses` (`bookingclassid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bookingpassenger` */

/*Table structure for table `bookingtype` */

DROP TABLE IF EXISTS `bookingtype`;

CREATE TABLE `bookingtype` (
  `typeid` int(11) NOT NULL AUTO_INCREMENT,
  `typename` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`typeid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `bookingtype` */

insert  into `bookingtype`(`typeid`,`typename`) values 
(1,'FirstClass'),
(2,'BusinessClass'),
(3,'Economy');

/*Table structure for table `city` */

DROP TABLE IF EXISTS `city`;

CREATE TABLE `city` (
  `cityid` int(11) NOT NULL AUTO_INCREMENT,
  `cityname` varchar(100) DEFAULT NULL,
  `countryid` int(11) DEFAULT NULL,
  PRIMARY KEY (`cityid`),
  KEY `countryid` (`countryid`),
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`countryid`) REFERENCES `country` (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `city` */

insert  into `city`(`cityid`,`cityname`,`countryid`) values 
(2,'Kigali',2),
(3,'Nairobi',1),
(4,'Dodoma',3),
(5,'Kampala',4),
(6,'Kisumu',1),
(8,'Mombasa',1),
(9,'Jinja',4);

/*Table structure for table `country` */

DROP TABLE IF EXISTS `country`;

CREATE TABLE `country` (
  `countryid` int(11) NOT NULL AUTO_INCREMENT,
  `countryname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`countryid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `country` */

insert  into `country`(`countryid`,`countryname`) values 
(1,'Kenya'),
(2,'Rwanda'),
(3,'Tanzania'),
(4,'Uganda'),
(6,'Burundi'),
(7,'China'),
(8,'Jamaica'),
(9,'Yemen');

/*Table structure for table `currency` */

DROP TABLE IF EXISTS `currency`;

CREATE TABLE `currency` (
  `currencyid` int(11) NOT NULL AUTO_INCREMENT,
  `codes` varchar(10) DEFAULT NULL,
  `symbol` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`currencyid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `currency` */

insert  into `currency`(`currencyid`,`codes`,`symbol`) values 
(1,'KSH','$'),
(2,'USD','$'),
(3,'EUR','$');

/*Table structure for table `flightbooking` */

DROP TABLE IF EXISTS `flightbooking`;

CREATE TABLE `flightbooking` (
  `bookingid` int(11) NOT NULL AUTO_INCREMENT,
  `typeid` int(11) DEFAULT NULL,
  `flightid` int(11) DEFAULT NULL,
  `bookingdate` datetime DEFAULT NULL,
  `paymentmethodid` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookingid`),
  KEY `typeid` (`typeid`),
  KEY `flightid` (`flightid`),
  KEY `paymentmethodid` (`paymentmethodid`),
  CONSTRAINT `flightbooking_ibfk_1` FOREIGN KEY (`typeid`) REFERENCES `bookingtype` (`typeid`),
  CONSTRAINT `flightbooking_ibfk_2` FOREIGN KEY (`flightid`) REFERENCES `flights` (`flightid`),
  CONSTRAINT `flightbooking_ibfk_3` FOREIGN KEY (`paymentmethodid`) REFERENCES `paymentmethod` (`paymentmethodid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightbooking` */

/*Table structure for table `flightbookingclasses` */

DROP TABLE IF EXISTS `flightbookingclasses`;

CREATE TABLE `flightbookingclasses` (
  `bookingclassid` int(11) NOT NULL AUTO_INCREMENT,
  `bookingid` int(11) DEFAULT NULL,
  `noofseats` int(11) DEFAULT NULL,
  `unitprice` decimal(10,2) DEFAULT NULL,
  `currencyid` int(11) DEFAULT NULL,
  PRIMARY KEY (`bookingclassid`),
  KEY `bookingid` (`bookingid`),
  KEY `currencyid` (`currencyid`),
  CONSTRAINT `flightbookingclasses_ibfk_1` FOREIGN KEY (`bookingid`) REFERENCES `flightbooking` (`bookingid`),
  CONSTRAINT `flightbookingclasses_ibfk_2` FOREIGN KEY (`currencyid`) REFERENCES `currency` (`currencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightbookingclasses` */

/*Table structure for table `flightclasses` */

DROP TABLE IF EXISTS `flightclasses`;

CREATE TABLE `flightclasses` (
  `flightclassid` int(11) NOT NULL AUTO_INCREMENT,
  `flightid` int(11) DEFAULT NULL,
  `bookingclassid` int(11) DEFAULT NULL,
  `seatsavailable` int(11) DEFAULT NULL,
  `unitprice` decimal(10,2) DEFAULT NULL,
  `currencyid` int(11) DEFAULT NULL,
  PRIMARY KEY (`flightclassid`),
  KEY `flightid` (`flightid`),
  KEY `bookingclassid` (`bookingclassid`),
  KEY `currencyid` (`currencyid`),
  CONSTRAINT `flightclasses_ibfk_1` FOREIGN KEY (`flightid`) REFERENCES `flights` (`flightid`),
  CONSTRAINT `flightclasses_ibfk_2` FOREIGN KEY (`bookingclassid`) REFERENCES `flightbookingclasses` (`bookingclassid`),
  CONSTRAINT `flightclasses_ibfk_3` FOREIGN KEY (`currencyid`) REFERENCES `currency` (`currencyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flightclasses` */

/*Table structure for table `flights` */

DROP TABLE IF EXISTS `flights`;

CREATE TABLE `flights` (
  `flightid` int(11) NOT NULL AUTO_INCREMENT,
  `airlineid` int(11) DEFAULT NULL,
  `flightnumber` varchar(20) DEFAULT NULL,
  `departureairportid` int(11) DEFAULT NULL,
  `destinationairportid` int(11) DEFAULT NULL,
  `departuretime` time DEFAULT NULL,
  `arrivaltime` time DEFAULT NULL,
  PRIMARY KEY (`flightid`),
  KEY `airlineid` (`airlineid`),
  KEY `departureairportid` (`departureairportid`),
  KEY `destinationairportid` (`destinationairportid`),
  CONSTRAINT `flights_ibfk_1` FOREIGN KEY (`airlineid`) REFERENCES `airline` (`airlineid`),
  CONSTRAINT `flights_ibfk_2` FOREIGN KEY (`departureairportid`) REFERENCES `airport` (`airportid`),
  CONSTRAINT `flights_ibfk_3` FOREIGN KEY (`destinationairportid`) REFERENCES `airport` (`airportid`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `flights` */

insert  into `flights`(`flightid`,`airlineid`,`flightnumber`,`departureairportid`,`destinationairportid`,`departuretime`,`arrivaltime`) values 
(1,1,'KQ454',1,2,'20:00:00','21:30:00'),
(2,2,'JMB879',1,3,'05:00:00','06:30:00'),
(3,3,'UGA345',3,1,'10:00:00','12:00:00'),
(4,4,'RWD296',2,3,'14:20:00','16:20:00');

/*Table structure for table `paymentmethod` */

DROP TABLE IF EXISTS `paymentmethod`;

CREATE TABLE `paymentmethod` (
  `paymentmethodid` int(11) NOT NULL AUTO_INCREMENT,
  `methodname` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`paymentmethodid`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

/*Data for the table `paymentmethod` */

insert  into `paymentmethod`(`paymentmethodid`,`methodname`) values 
(1,'Mpesa'),
(2,'Visa'),
(3,'Mastercard'),
(4,'PayPall'),
(5,'Points');

/* Procedure structure for procedure `sp_checkcity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcity`($cityid int , $cityname varchar(255), $countryid int)
BEGIN
	
	 SELECT * FROM `city` WHERE `cityname` = $cityname AND `countryid` = $countryid AND `cityid` != $cityid;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_checkcountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_checkcountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_checkcountry`($countryid int, $countryname varchar(100))
BEGIN
	
	select * from `country`
	where`countryid`!=$countryid and `countryname`=$countryname;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairline`($airlineid INT)
BEGIN
    DELETE FROM `airline` WHERE `airlineid` = $airlineid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteairport`($airportid INT)
BEGIN
    DELETE FROM `airport` WHERE `airportid` = $airportid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookingpassenger` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingpassenger` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingpassenger`($bookingpassengerid INT)
BEGIN
    DELETE FROM `bookingpassenger`
    WHERE `bookingpassengerid` = $bookingpassengerid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletebookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletebookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletebookingtype`($typeid INT)
BEGIN
    DELETE FROM `bookingtype` WHERE `typeid` = $typeid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecity`($cityid INT)
BEGIN
    DELETE FROM `city` WHERE `cityid` = $cityid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecountry`($countryid INT)
BEGIN
    DELETE FROM `country` WHERE `countryid` = $countryid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletecurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletecurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletecurrency`($currencyid INT)
BEGIN
    DELETE FROM `currency` WHERE `currencyid` = $currencyid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflight` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflight` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflight`($flightid INT)
BEGIN
    DELETE FROM `flights` WHERE `flightid` = $flightid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightbooking`($bookingid INT)
BEGIN
    DELETE FROM `flightbooking` WHERE `bookingid` = $bookingid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightbookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightbookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightbookingclass`($bookingclassid INT)
BEGIN
    DELETE FROM `flightbookingclasses` WHERE `bookingclassid` = $bookingclassid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deleteflightclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deleteflightclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deleteflightclass`($classid INT)
BEGIN
    DELETE FROM `flightclasses` WHERE `classid` = $classid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_deletepaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_deletepaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_deletepaymentmethod`($paymentmethodid INT)
BEGIN
    DELETE FROM `paymentmethod` WHERE `paymentmethodid` = $paymentmethodid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterairlines` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterairlines` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterairlines`($airlinename varchar(100), $countryname varchar(100))
BEGIN
             IF $airlinename='' THEN
                 SET $airlinename='000';
                 END IF;
              
               IF $countryname='' THEN
                 SET $countryname='000';
                 END IF;  	     
	     
	     select a.*, countryname
	     from `airline` a
	     JOIN `country` c ON c.countryid=a.countryid
	     where `airlinename` like concat('&',$airlinename,'&')
	     or countryname like concat('&',$countryname,'&')
	     order by airlinename;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filterairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filterairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filterairport`($airportname varchar(100), $countryname varchar(100) )
BEGIN
	     IF $airportname='' THEN
                 SET $airportname='000';
                 END IF;
              
               IF $countryname='' THEN
                 SET $countryname='000';
                 END IF;  	     
	     
	     SELECT p.*, countryname
	     FROM `airport` p
	     JOIN `country` c ON c.countryid=p.countryid
	     WHERE `airportname` LIKE CONCAT('&',$airportname,'&')
	     OR countryname LIKE CONCAT('&',$countryname,'&')
	     ORDER BY airportname;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_filtercity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_filtercity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_filtercity`($cityname VARCHAR(100), $countryname VARCHAR(100) )
BEGIN
	     IF $cityname='' THEN
                 SET $cityname='000';
                 END IF;
              
               IF $countryname='' THEN
                 SET $countryname='000';
                 END IF;  	     
	     
	     SELECT i.*, countryname
	     FROM `city` i
	     JOIN `country` c ON c.countryid=i.countryid
	     WHERE `cityname` LIKE CONCAT('&',$cityname,'&')
	     OR countryname LIKE CONCAT('&',$countryname,'&')
	     ORDER BY cityname;
	     

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairlinebyid` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairlinebyid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairlinebyid`($airlineid INT)
BEGIN
    SELECT a.*, countryname 
    FROM `airline` a
    JOIN `country` c ON c.countryid=a.countryid
    WHERE a.airlineid = $airlineid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairlines` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairlines` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairlines`()
BEGIN
            SELECT * FROM `airline`
	    ORDER BY `airlinename`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairportbyid` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairportbyid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairportbyid`($airportid INT)
BEGIN
    SELECT p.*, countryname
    FROM `airport` p
    JOIN `country` c ON c.countryid=p.countryid
    WHERE p.airportid = $airportid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getairports` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getairports` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getairports`()
BEGIN
            SELECT * FROM `airport`
	ORDER BY `airportname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingpassengerbyid` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingpassengerbyid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingpassengerbyid`($bookingpassengerid INT)
BEGIN
    SELECT * FROM `bookingpassenger`
    WHERE `bookingpassengerid` = $bookingpassengerid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingpassengers` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingpassengers` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingpassengers`()
BEGIN
SELECT * FROM `bookingpassenger`
	ORDER BY `firstname`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingtypebyid` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingtypebyid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingtypebyid`($typeid INT)
BEGIN
    SELECT * FROM `bookingtype` WHERE `typeid` = $typeid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getbookingtypes` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getbookingtypes` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getbookingtypes`()
BEGIN
SELECT * FROM `bookingtype`
	ORDER BY `typename`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcity`()
BEGIN
    SELECT 
        c.cityid,
        c.cityname,
        co.countryname
    FROM `city` c
    JOIN `country` co ON c.countryid = co.countryid
    ORDER BY c.cityname;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcitybyid` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcitybyid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcitybyid`($cityid INT)
BEGIN
    SELECT i.*, countryname 
    FROM `city`  i 
    join `country` c on c.countryid=i.countryid
    WHERE i.cityid = $cityid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcountries` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcountries` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcountries`()
BEGIN
	
	select * from `country`
	order by `countryname`;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcountrybyid` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcountrybyid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcountrybyid`($countryid INT)
BEGIN
    SELECT * FROM `country` WHERE `countryid` = $countryid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcurrencies` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcurrencies` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcurrencies`()
BEGIN
	
	SELECT * FROM `currency`
	ORDER BY `currencyname`;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getcurrencybyid` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getcurrencybyid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getcurrencybyid`($currencyid INT)
BEGIN
    SELECT * FROM `currency` WHERE `currencyid` = $currencyid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookingbyid` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookingbyid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookingbyid`($bookingid INT)
BEGIN
    SELECT * FROM `flightbooking` WHERE `bookingid` = $bookingid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookingclassbyid` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookingclassbyid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookingclassbyid`($bookingclassid INT)
BEGIN
    SELECT * FROM `flightbookingclasses` WHERE `bookingclassid` = $bookingclassid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookingclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookingclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookingclasses`()
BEGIN
SELECT * FROM `flightbookingclasses`
	ORDER BY `bookingclassid`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbookings` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbookings` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbookings`()
BEGIN
SELECT * FROM `flightbooking`
	ORDER BY `bookingdate`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightbyid` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightbyid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightbyid`($flightid INT)
BEGIN
    SELECT * FROM `flights` WHERE `flightid` = $flightid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightclassbyid` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightclassbyid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightclassbyid`($classid INT)
BEGIN
    SELECT * FROM `flightclasses` WHERE `classid` = $classid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflightclasses` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflightclasses` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflightclasses`()
BEGIN
	
	SELECT * FROM `flightclasses`
	ORDER BY `flightclassid`;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getflights` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getflights` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getflights`()
BEGIN
SELECT * FROM `flights`
	ORDER BY `flightnumber`;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpaymentmethodbyid` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpaymentmethodbyid` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpaymentmethodbyid`($paymentmethodid INT)
BEGIN
    SELECT * FROM `paymentmethod` WHERE `paymentmethodid` = $paymentmethodid;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_getpaymentmethods` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_getpaymentmethods` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_getpaymentmethods`()
BEGIN
	
	SELECT * FROM `paymentmethod`
	ORDER BY `methodname`;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveairline` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveairline` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveairline`($airlineid INT, $airlinename VARCHAR(100),$airlinelogo VARCHAR(255))
BEGIN
    IF $airlineid = 0 THEN
        IF NOT EXISTS(SELECT * FROM `airline` WHERE `airlinename` = $airlinename) THEN
            INSERT INTO `airline`(`airlinename`,`airlinelogo`)
            VALUES ($airlinename, $airlinelogo);
        END IF;
    ELSE
        UPDATE `airline`
        SET `airlinename` = $airlinename,
            `airlinelogo` = $airlinelogo
        WHERE `airlineid` = $airlineid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveairport` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveairport` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveairport`($airportid INT, $airportname VARCHAR(100),$airportcode VARCHAR(10), $cityid INT)
BEGIN
    IF $airportid = 0 THEN
        IF NOT EXISTS(SELECT * FROM `airport` WHERE `airportname` = $airportname AND `cityid` = $cityid) THEN
            INSERT INTO `airport`(`airportname`,`airportcode`, `cityid`)
            VALUES ($airportname, $airportcode, $cityid);
        END IF;
    ELSE
        UPDATE `airport`
        SET `airportname` = $airportname,
            `airportcode` = $airportcode,
            `cityid` = $cityid
        WHERE `airportid` = $airportid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebookingpassenger` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingpassenger` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingpassenger`(
    $bookingpassengerid INT,
    $bookingclassid INT,
    $iddocument VARCHAR(50),
    $iddocumentno VARCHAR(50),
    $firstname VARCHAR(100),
    $middlename VARCHAR(100),
    $lastname VARCHAR(100),
    $gender VARCHAR(10),
    $dateofbirth DATE
)
BEGIN
    IF $bookingpassengerid = 0 THEN
        INSERT INTO `bookingpassenger`(
            `bookingclassid`, `iddocument`, `iddocumentno`,
            `firstname`, `middlename`, `lastname`,
            `gender`, `dateofbirth`
        )
        VALUES (
            $bookingclassid, $iddocument, $iddocumentno,
            $firstname, $middlename, $lastname,
            $gender, $dateofbirth
        );
    ELSE
        UPDATE `bookingpassenger`
        SET `bookingclassid` = $bookingclassid,
            `iddocument` = $iddocument,
            `iddocumentno` = $iddocumentno,
            `firstname` = $firstname,
            `middlename` = $middlename,
            `lastname` = $lastname,
            `gender` = $gender,
            `dateofbirth` = $dateofbirth
        WHERE `bookingpassengerid` = $bookingpassengerid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savebookingtype` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savebookingtype` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savebookingtype`($typeid INT, $typename VARCHAR(100))
BEGIN
    IF $typeid = 0 THEN
        IF NOT EXISTS(SELECT * FROM `bookingtype` WHERE `typename` = $typename) THEN
            INSERT INTO `bookingtype`(`typename`)
            VALUES ($typename);
        END IF;
    ELSE
        UPDATE `bookingtype`
        SET `typename` = $typename
        WHERE `typeid` = $typeid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecity` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecity` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecity`($cityid INT, $cityname VARCHAR(100), $countryid INT)
BEGIN
    IF $cityid = 0 THEN
        IF NOT EXISTS(SELECT * FROM `city` WHERE `cityname` = $cityname AND `countryid` = $countryid) THEN
            INSERT INTO `city`(`cityname`, `countryid`)
            VALUES ($cityname, $countryid);
        END IF;
    ELSE
        UPDATE `city`
        SET `cityname` = $cityname,
            `countryid` = $countryid
        WHERE `cityid` = $cityid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecountry` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecountry` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecountry`($countryid int,$countryname varchar(50))
BEGIN
	      if $countryid=0 then
	         if not exists( select * from `country` where `countryname`=$countryname) then
	              insert into `country`(`countryname`)
	              values ($countryname);
	         end if;
	      else
	              update `country`
	              set `countryname`=$countryname
	              where `countryid`=$countryid;
	         end if;

	END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savecurrency` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savecurrency` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savecurrency`(
    $currencyid INT,
    $codes VARCHAR(10),
    $symbol VARCHAR(5)
)
BEGIN
    IF $currencyid = 0 THEN
        IF NOT EXISTS(SELECT * FROM `currency` WHERE `codes` = $codes) THEN
            INSERT INTO `currency`(`codes`, `symbol`)
            VALUES ($codes, $symbol);
        END IF;
    ELSE
        UPDATE `currency`
        SET `codes` = $codes,
            `symbol` = $symbol
        WHERE `currencyid` = $currencyid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflight` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflight` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflight`(
    $flightid INT,
    $flightnumber VARCHAR(50),
    $airlineid INT,
    $departureairportid INT,
    $arrivalairportid INT,
    $departuretime DATETIME,
    $arrivaltime DATETIME
)
BEGIN
    IF $flightid = 0 THEN
        IF NOT EXISTS(
            SELECT * FROM `flights`
            WHERE `flightnumber` = $flightnumber
              AND `airlineid` = $airlineid
              AND `departureairportid` = $departureairportid
              AND `destinationairportid` = $arrivalairportid
        ) THEN
            INSERT INTO `flights`(
                `flightnumber`, `airlineid`, `departureairportid`, `destinationairportid`, `departuretime`, `arrivaltime`
            )
            VALUES ($flightnumber, $airlineid, $departureairportid, $arrivalairportid, $departuretime, $arrivaltime);
        END IF;
    ELSE
        UPDATE `flights`
        SET `flightnumber` = $flightnumber,
            `airlineid` = $airlineid,
            `departureairportid` = $departureairportid,
            `destinationairportid` = $arrivalairportid,
            `departuretime` = $departuretime,
            `arrivaltime` = $arrivaltime
        WHERE `flightid` = $flightid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightbooking` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightbooking` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightbooking`(
    $bookingid INT,
    $flightid INT,
    $bookingdate DATETIME,
    $bookingtypeid INT,
    $paymentmethodid INT,
    $currencyid INT
)
BEGIN
    IF $bookingid = 0 THEN
        INSERT INTO `flightbooking`(`flightid`, `bookingdate`, `bookingtypeid`, `paymentmethodid`, `currencyid`)
        VALUES ($flightid, $bookingdate, $bookingtypeid, $paymentmethodid, $currencyid);
    ELSE
        UPDATE `flightbooking`
        SET `flightid` = $flightid,
            `bookingdate` = $bookingdate,
            `bookingtypeid` = $bookingtypeid,
            `paymentmethodid` = $paymentmethodid,
            `currencyid` = $currencyid
        WHERE `bookingid` = $bookingid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightbookingclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightbookingclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightbookingclass`(
    $bookingclassid INT,
    $bookingid INT,
    $classid INT,
    $seatcount INT,
    $unitprice DECIMAL,
    $currencyid INT
)
BEGIN
    IF $bookingclassid = 0 THEN
        INSERT INTO `flightbookingclasses`(`bookingid`, `classid`, `seatcount`,`unitprice`,`currencyid`)
        VALUES ($bookingid, $classid, $seatcount, $unitprice, $currencyid);
    ELSE
        UPDATE `flightbookingclasses`
        SET `bookingid` = $bookingid,
            `classid` = $classid,
            `seatcount` = $seatcount,
            `unitprice`= $unitprice,
            `currencyid` = $currencyid
        WHERE `bookingclassid` = $bookingclassid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_saveflightclass` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_saveflightclass` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_saveflightclass`($classid INT, $classname VARCHAR(100),$bookingclassid INT, $flightid INT, $seatsavailable INT, unitprice DECIMAL, currencyid INT)
BEGIN
    IF $classid = 0 THEN
        IF NOT EXISTS(SELECT * FROM `flightclasses` WHERE `classname` = $classname) THEN
            INSERT INTO `flightclasses`(`classname`,`bookingclassid`,`flightid`,`seatsavailable`,`unitprice`,`currencyid`)
            VALUES ($classname,$bookingclassid,$flightid,$seatsavailable,$unitprice,$currencyid);
        END IF;
    ELSE
        UPDATE `flightclasses`
        SET `classname` = $classname,
            `bookingclassid` = $bookingclassid,
            `flightid` = $flightid,
            `seatsavailable` =$seatsavailable,
            `unitprice` = $unitprice,
            `currencyid` = $currencyid
        WHERE `classid` = $classid;
    END IF;
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_savepaymentmethod` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_savepaymentmethod` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_savepaymentmethod`(
    $paymentmethodid INT,
    $methodname VARCHAR(100)
)
BEGIN
    IF $paymentmethodid = 0 THEN
        IF NOT EXISTS(SELECT * FROM `paymentmethod` WHERE `methodname` = $methodname) THEN
            INSERT INTO `paymentmethod`(`methodname`)
            VALUES ($methodname);
        END IF;
    ELSE
        UPDATE `paymentmethod`
        SET `methodname` = $methodname
        WHERE `paymentmethodid` = $paymentmethodid;
    END IF;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
