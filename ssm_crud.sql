/*
SQLyog  v12.2.6 (64 bit)
MySQL - 5.7.32-log : Database - ssm_crud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ssm_crud` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `ssm_crud`;

/*Table structure for table `tbl_dept` */

DROP TABLE IF EXISTS `tbl_dept`;

CREATE TABLE `tbl_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(255) NOT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8mb4;

/*Data for the table `tbl_dept` */

insert  into `tbl_dept`(`dept_id`,`dept_name`) values 
(10,'Administration'),
(20,'Marketing'),
(30,'Purchasing'),
(40,'Human Resources'),
(50,'Shipping'),
(60,'IT'),
(70,'Public Relations'),
(80,'Sales'),
(90,'Executive'),
(100,'Finance'),
(110,'Accounting'),
(120,'Treasury'),
(130,'Corporate Tax'),
(140,'Control And Credit'),
(150,'Shareholder Services'),
(160,'Benefits'),
(170,'Manufacturing'),
(180,'Construction'),
(190,'Contracting'),
(200,'Operations'),
(210,'IT Support'),
(220,'NOC'),
(230,'IT Helpdesk'),
(240,'Government Sales'),
(250,'Retail Sales'),
(260,'Recruiting'),
(270,'Payroll'),
(271,'开发部'),
(272,'开发部');

/*Table structure for table `tbl_emp` */

DROP TABLE IF EXISTS `tbl_emp`;

CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `gender` char(1) CHARACTER SET utf8mb4 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `d_id` int(11) NOT NULL,
  PRIMARY KEY (`emp_id`),
  KEY `fk_emp_dept` (`d_id`),
  CONSTRAINT `fk_emp_dept` FOREIGN KEY (`d_id`) REFERENCES `tbl_dept` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=216 DEFAULT CHARSET=utf32;

/*Data for the table `tbl_emp` */

insert  into `tbl_emp`(`emp_id`,`emp_name`,`gender`,`email`,`d_id`) values 
(100,'Steven','F','SKING',90),
(101,'Neena','F','NKOCHHAR',90),
(102,'Lex','F','LDEHAAN',90),
(103,'Alexander','F','AHUNOLD',60),
(104,'Bruce','F','BERNST',60),
(105,'David','F','DAUSTIN',60),
(106,'Valli','F','VPATABAL',60),
(107,'Diana','F','DLORENTZ',60),
(108,'Nancy','M','NGREENBE',100),
(109,'Daniel','M','DFAVIET',100),
(110,'John','M','JCHEN',100),
(111,'Ismael','M','ISCIARRA',100),
(112,'Jose Manuel','M','JMURMAN',100),
(113,'Luis','M','LPOPP',100),
(114,'Den','F','DRAPHEAL',30),
(115,'Alexander','F','AKHOO',30),
(116,'Shelli','F','SBAIDA',30),
(117,'Sigal','F','STOBIAS',30),
(118,'Guy','F','GHIMURO',30),
(119,'Karen','F','KCOLMENA',30),
(120,'Matthew','M','MWEISS',50),
(121,'Adam','M','AFRIPP',50),
(122,'Payam','M','PKAUFLIN',50),
(123,'Shanta','M','SVOLLMAN',50),
(124,'Kevin','M','KMOURGOS',50),
(125,'Julia','M','JNAYER',50),
(126,'Irene','M','IMIKKILI',50),
(127,'James','M','JLANDRY',50),
(128,'Steven','M','SMARKLE',50),
(129,'Laura','M','LBISSOT',50),
(130,'Mozhe','M','MATKINSO',50),
(131,'James','M','JAMRLOW',50),
(132,'TJ','M','TJOLSON',50),
(133,'Jason','M','JMALLIN',50),
(134,'Michael','M','MROGERS',50),
(135,'Ki','M','KGEE',50),
(136,'Hazel','M','HPHILTAN',50),
(137,'Renske','M','RLADWIG',50),
(138,'Stephen','M','SSTILES',50),
(139,'John','M','JSEO',50),
(140,'Joshua','M','JPATEL',50),
(141,'Trenna','M','TRAJS',50),
(142,'Curtis','M','CDAVIES',50),
(143,'Randall','M','RMATOS',50),
(144,'Peter','M','PVARGAS',50),
(145,'John','M','JRUSSEL',80),
(146,'Karen','M','KPARTNER',80),
(147,'Alberto','M','AERRAZUR',80),
(148,'Gerald','M','GCAMBRAU',80),
(149,'Eleni','M','EZLOTKEY',80),
(150,'Peter','M','PTUCKER',80),
(151,'David','M','DBERNSTE',80),
(152,'Peter','M','PHALL',80),
(153,'Christopher','M','COLSEN',80),
(154,'Nanette','M','NCAMBRAU',80),
(155,'Oliver','M','OTUVAULT',80),
(156,'Janette','M','JKING',80),
(157,'Patrick','M','PSULLY',80),
(158,'Allan','M','AMCEWEN',80),
(159,'Lindsey','M','LSMITH',80),
(160,'Louise','M','LDORAN',80),
(161,'Sarath','M','SSEWALL',80),
(162,'Clara','M','CVISHNEY',80),
(163,'Danielle','M','DGREENE',80),
(164,'Mattea','M','MMARVINS',80),
(165,'David','M','DLEE',80),
(166,'Sundar','M','SANDE',80),
(167,'Amit','M','ABANDA',80),
(168,'Lisa','M','LOZER',80),
(169,'Harrison','M','HBLOOM',80),
(170,'Tayler','M','TFOX',80),
(171,'William','M','WSMITH',80),
(172,'Elizabeth','M','EBATES',80),
(173,'Sundita','M','SKUMAR',80),
(174,'Ellen','M','EABEL',80),
(175,'Alyssa','M','AHUTTON',80),
(176,'Jonathon','M','JTAYLOR',80),
(177,'Jack','M','JLIVINGS',80),
(178,'Kimberely','F','KGRANT',60),
(179,'Charles','M','CJOHNSON',80),
(180,'Winston','M','WTAYLOR',50),
(181,'Jean','M','JFLEAUR',50),
(182,'Martha','M','MSULLIVA',50),
(183,'Girard','M','GGEONI',50),
(184,'Nandita','M','NSARCHAN',50),
(185,'Alexis','M','ABULL',50),
(186,'Julia','M','JDELLING',50),
(187,'Anthony','M','ACABRIO',50),
(188,'Kelly','M','KCHUNG',50),
(189,'Jennifer','M','JDILLY',50),
(190,'Timothy','M','TGATES',50),
(191,'Randall','M','RPERKINS',50),
(192,'Sarah','M','SBELL',50),
(193,'Britney','M','BEVERETT',50),
(194,'Samuel','M','SMCCAIN',50),
(195,'Vance','M','VJONES',50),
(196,'Alana','M','AWALSH',50),
(197,'Kevin','M','KFEENEY',50),
(198,'Donald','M','DOCONNEL',50),
(199,'Douglas','M','DGRANT',50),
(200,'Jennifer','M','JWHALEN',10),
(201,'Michael','M','MHARTSTE',20),
(203,'Susan','M','SMAVRIS',40),
(204,'Hermann','M','HBAER',70),
(209,'陈琳','F','chenlin@qq.com',90),
(211,'admin','M','admin',10),
(212,'admin','M','admin',10),
(213,'cyy','M','1147109802@qq.com',272),
(214,'cyy','F','1147109802@qq.com',60),
(215,'cyy','M','1147109802@qq.com',50);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
