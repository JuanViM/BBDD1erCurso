CREATE DATABASE  IF NOT EXISTS `investigadores` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `investigadores`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: investigadores
-- ------------------------------------------------------
-- Server version	5.6.17

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
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo` (
  `idequipo` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `numSerie` varchar(45) NOT NULL,
  `idFacultad` int(11) NOT NULL,
  PRIMARY KEY (`idequipo`),
  KEY `idFacultad_fk2_idx` (`idFacultad`),
  CONSTRAINT `idFacultad_fk2` FOREIGN KEY (`idFacultad`) REFERENCES `facultad` (`idfacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'Pizarra','2563223F3',1),(2,'Laser','8738423H4',2),(3,'Portatil','87e5656u6',1);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facultad` (
  `idfacultad` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`idfacultad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
INSERT INTO `facultad` VALUES (1,'Informática'),(2,'Ciencias'),(3,'Medicina');
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `investigador`
--

DROP TABLE IF EXISTS `investigador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `investigador` (
  `DNI` varchar(9) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `idFacultad` int(11) NOT NULL,
  PRIMARY KEY (`DNI`),
  KEY `idFacultad_fk_idx` (`idFacultad`),
  CONSTRAINT `idFacultad_fk` FOREIGN KEY (`idFacultad`) REFERENCES `facultad` (`idfacultad`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `investigador`
--

LOCK TABLES `investigador` WRITE;
/*!40000 ALTER TABLE `investigador` DISABLE KEYS */;
INSERT INTO `investigador` VALUES ('52353251X','Pepito Grillo',1),('73632333L','Humberto Lopez',3),('93746572F','Juanita Perez',2);
/*!40000 ALTER TABLE `investigador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservas` (
  `DNI` varchar(9) NOT NULL,
  `idequipo` int(11) NOT NULL,
  `fechaComienzo` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fechaFin` datetime DEFAULT NULL,
  PRIMARY KEY (`DNI`,`idequipo`,`fechaComienzo`),
  KEY `idEquipo_fk_idx` (`idequipo`),
  CONSTRAINT `idEquipo_fk` FOREIGN KEY (`idequipo`) REFERENCES `equipo` (`idequipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `dni_fk` FOREIGN KEY (`DNI`) REFERENCES `investigador` (`DNI`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES ('52353251X',1,'2017-01-10 00:00:00','2017-01-11 00:00:00'),('52353251X',2,'2017-01-20 00:00:00',NULL),('93746572F',1,'2017-01-14 00:00:00',NULL),('93746572F',2,'2017-01-15 00:00:00','2017-01-16 00:00:00');
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-06 12:50:24
