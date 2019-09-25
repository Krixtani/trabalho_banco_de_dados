/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 5.7.25-log : Database - mercado
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mercado` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mercado`;

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `cpf` varchar(11) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `telefone` varchar(11) DEFAULT NULL,
  `data_cadastro` date NOT NULL DEFAULT '2000-01-01',
  PRIMARY KEY (`id`),
  UNIQUE KEY `cpf` (`cpf`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `clientes` */

insert  into `clientes`(`id`,`cpf`,`nome`,`endereco`,`telefone`,`data_cadastro`) values 
(1,'11111111111','CONSUMIDOR','END CONSUMIDOR','16999999999','2019-09-11');

/*Table structure for table `corpo_venda` */

DROP TABLE IF EXISTS `corpo_venda`;

CREATE TABLE `corpo_venda` (
  `COR_ID` int(8) NOT NULL AUTO_INCREMENT,
  `COR_VEN` int(8) NOT NULL,
  `COR_PRO` varchar(10) NOT NULL,
  `COR_QTD` int(5) NOT NULL,
  `COR_VAL` float DEFAULT NULL,
  PRIMARY KEY (`COR_ID`),
  KEY `VENDA` (`COR_VEN`),
  KEY `PRODUTO` (`COR_PRO`),
  CONSTRAINT `PRODUTO` FOREIGN KEY (`COR_PRO`) REFERENCES `produtos` (`id`),
  CONSTRAINT `VENDA` FOREIGN KEY (`COR_VEN`) REFERENCES `vendas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `corpo_venda` */

/*Table structure for table `produtos` */

DROP TABLE IF EXISTS `produtos`;

CREATE TABLE `produtos` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `PRO_NUM` varchar(10) NOT NULL,
  `PRO_NOM` varchar(50) NOT NULL,
  `PRO_CUS` float DEFAULT NULL,
  `PRO_VEN` float DEFAULT NULL,
  `PRO_MAR` varchar(10) DEFAULT NULL,
  `PRO_DES` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `PRO_NUM` (`PRO_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `produtos` */

/*Table structure for table `vendas` */

DROP TABLE IF EXISTS `vendas`;

CREATE TABLE `vendas` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `cliente` varchar(11) NOT NULL,
  `VEN_DTA` date NOT NULL DEFAULT '2000-01-01',
  PRIMARY KEY (`id`),
  KEY `CLIENTE` (`cliente`),
  CONSTRAINT `CLIENTE` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vendas` */

/* Trigger structure for table `clientes` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `DEF_DATE` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'localhost' */ /*!50003 TRIGGER `DEF_DATE` BEFORE INSERT ON `clientes` FOR EACH ROW BEGIN
    IF (NEW.data_cadastro = '2000-01-01') THEN
	SET NEW.data_cadastro = CURRENT_DATE;

    END IF;
    END */$$


DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
