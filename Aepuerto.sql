-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `aerolínea`
--

DROP TABLE IF EXISTS `aerolínea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aerolínea` (
  `aerolínea_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`aerolínea_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aerolínea`
--

LOCK TABLES `aerolínea` WRITE;
/*!40000 ALTER TABLE `aerolínea` DISABLE KEYS */;
INSERT INTO `aerolínea` VALUES (1,'Aerolineas Argentinas'),(2,'Aerolineas Argentinas');
/*!40000 ALTER TABLE `aerolínea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aeropuerto`
--

DROP TABLE IF EXISTS `aeropuerto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeropuerto` (
  `aeropuerto_id` int NOT NULL,
  `código_IATA` varchar(3) NOT NULL,
  PRIMARY KEY (`aeropuerto_id`,`código_IATA`),
  KEY `fk_aeropuerto_ciudad1_idx` (`código_IATA`),
  CONSTRAINT `fk_aeropuerto_ciudad1` FOREIGN KEY (`código_IATA`) REFERENCES `ciudad` (`código_IATA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeropuerto`
--

LOCK TABLES `aeropuerto` WRITE;
/*!40000 ALTER TABLE `aeropuerto` DISABLE KEYS */;
INSERT INTO `aeropuerto` VALUES (1,'EZE'),(2,'MAD');
/*!40000 ALTER TABLE `aeropuerto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aeropuerto_has_aerolínea`
--

DROP TABLE IF EXISTS `aeropuerto_has_aerolínea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aeropuerto_has_aerolínea` (
  `aerolínea_id` int NOT NULL,
  `aeropuerto_id` int NOT NULL,
  PRIMARY KEY (`aerolínea_id`,`aeropuerto_id`),
  KEY `fk_aerolínea_has_aeropuerto_aeropuerto1_idx` (`aeropuerto_id`),
  KEY `fk_aerolínea_has_aeropuerto_aerolínea1_idx` (`aerolínea_id`),
  CONSTRAINT `fk_aerolínea_has_aeropuerto_aerolínea1` FOREIGN KEY (`aerolínea_id`) REFERENCES `aerolínea` (`aerolínea_id`),
  CONSTRAINT `fk_aerolínea_has_aeropuerto_aeropuerto1` FOREIGN KEY (`aeropuerto_id`) REFERENCES `aeropuerto` (`aeropuerto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aeropuerto_has_aerolínea`
--

LOCK TABLES `aeropuerto_has_aerolínea` WRITE;
/*!40000 ALTER TABLE `aeropuerto_has_aerolínea` DISABLE KEYS */;
/*!40000 ALTER TABLE `aeropuerto_has_aerolínea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avión`
--

DROP TABLE IF EXISTS `avión`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avión` (
  `avión_id` int NOT NULL,
  `tipo_avión_id` int NOT NULL,
  `aerolínea_id` int NOT NULL,
  PRIMARY KEY (`avión_id`,`tipo_avión_id`,`aerolínea_id`),
  KEY `fk_avión_tipo_avión1_idx` (`tipo_avión_id`),
  KEY `fk_avión_aerolínea1_idx` (`aerolínea_id`),
  CONSTRAINT `fk_avión_aerolínea1` FOREIGN KEY (`aerolínea_id`) REFERENCES `aerolínea` (`aerolínea_id`),
  CONSTRAINT `fk_avión_tipo_avión1` FOREIGN KEY (`tipo_avión_id`) REFERENCES `tipo_avión` (`tipo_avión_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avión`
--

LOCK TABLES `avión` WRITE;
/*!40000 ALTER TABLE `avión` DISABLE KEYS */;
INSERT INTO `avión` VALUES (1,1,1),(2,1,1),(4,1,1),(3,2,1);
/*!40000 ALTER TABLE `avión` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avión_has_aeropuerto`
--

DROP TABLE IF EXISTS `avión_has_aeropuerto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avión_has_aeropuerto` (
  `avión_id` int NOT NULL,
  `aeropuerto_id` int NOT NULL,
  PRIMARY KEY (`avión_id`,`aeropuerto_id`),
  KEY `fk_avión_has_aeropuerto_aeropuerto1_idx` (`aeropuerto_id`),
  KEY `fk_avión_has_aeropuerto_avión1_idx` (`avión_id`),
  CONSTRAINT `fk_avión_has_aeropuerto_aeropuerto1` FOREIGN KEY (`aeropuerto_id`) REFERENCES `aeropuerto` (`aeropuerto_id`),
  CONSTRAINT `fk_avión_has_aeropuerto_avión1` FOREIGN KEY (`avión_id`) REFERENCES `avión` (`avión_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avión_has_aeropuerto`
--

LOCK TABLES `avión_has_aeropuerto` WRITE;
/*!40000 ALTER TABLE `avión_has_aeropuerto` DISABLE KEYS */;
/*!40000 ALTER TABLE `avión_has_aeropuerto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avión_has_pista`
--

DROP TABLE IF EXISTS `avión_has_pista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `avión_has_pista` (
  `pista_pista_id` int NOT NULL,
  `avión_avión_id` int NOT NULL,
  PRIMARY KEY (`pista_pista_id`,`avión_avión_id`),
  KEY `fk_pista_has_avión_avión1_idx` (`avión_avión_id`),
  KEY `fk_pista_has_avión_pista1_idx` (`pista_pista_id`),
  CONSTRAINT `fk_pista_has_avión_avión1` FOREIGN KEY (`avión_avión_id`) REFERENCES `avión` (`avión_id`),
  CONSTRAINT `fk_pista_has_avión_pista1` FOREIGN KEY (`pista_pista_id`) REFERENCES `pista` (`pista_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avión_has_pista`
--

LOCK TABLES `avión_has_pista` WRITE;
/*!40000 ALTER TABLE `avión_has_pista` DISABLE KEYS */;
/*!40000 ALTER TABLE `avión_has_pista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad`
--

DROP TABLE IF EXISTS `ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ciudad` (
  `código_IATA` varchar(3) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`código_IATA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad`
--

LOCK TABLES `ciudad` WRITE;
/*!40000 ALTER TABLE `ciudad` DISABLE KEYS */;
INSERT INTO `ciudad` VALUES ('EZE','Ezeiza'),('MAD','Madrid'),('TUC','Tucuman');
/*!40000 ALTER TABLE `ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mostrador`
--

DROP TABLE IF EXISTS `mostrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mostrador` (
  `mostrador_id` int NOT NULL,
  `lugar` varchar(45) NOT NULL,
  `aerolínea_id` int NOT NULL,
  `aeropuerto_id` int NOT NULL,
  `tipo_mostrador_id` int NOT NULL,
  PRIMARY KEY (`mostrador_id`,`aerolínea_id`,`aeropuerto_id`,`tipo_mostrador_id`),
  KEY `fk_mostrador_aerolínea1_idx` (`aerolínea_id`),
  KEY `fk_mostrador_aeropuerto1_idx` (`aeropuerto_id`),
  KEY `fk_mostrador_tipo_mostrador1_idx` (`tipo_mostrador_id`),
  CONSTRAINT `fk_mostrador_aerolínea1` FOREIGN KEY (`aerolínea_id`) REFERENCES `aerolínea` (`aerolínea_id`),
  CONSTRAINT `fk_mostrador_aeropuerto1` FOREIGN KEY (`aeropuerto_id`) REFERENCES `aeropuerto` (`aeropuerto_id`),
  CONSTRAINT `fk_mostrador_tipo_mostrador1` FOREIGN KEY (`tipo_mostrador_id`) REFERENCES `tipo_mostrador` (`tipo_mostrador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mostrador`
--

LOCK TABLES `mostrador` WRITE;
/*!40000 ALTER TABLE `mostrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `mostrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajero`
--

DROP TABLE IF EXISTS `pasajero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasajero` (
  `dni` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `tipo documento` int NOT NULL,
  PRIMARY KEY (`dni`,`tipo documento`),
  KEY `fk_pasajero_tipo documento1_idx` (`tipo documento`),
  CONSTRAINT `fk_pasajero_tipo documento1` FOREIGN KEY (`tipo documento`) REFERENCES `tipo_documento` (`idtipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajero`
--

LOCK TABLES `pasajero` WRITE;
/*!40000 ALTER TABLE `pasajero` DISABLE KEYS */;
INSERT INTO `pasajero` VALUES (22345190,'Hugo','Lopez','2245237817','hugolopez@gamil.com',1),(22363190,'Sandra','Lopez','2245233017','sandra1213lopez@gamil.com',1),(223145190,'Santigo','Montana','1545237817','santimmontana@gmail.com',1);
/*!40000 ALTER TABLE `pasajero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pasajero_has_vuelo`
--

DROP TABLE IF EXISTS `pasajero_has_vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasajero_has_vuelo` (
  `pasajero_dni` int NOT NULL,
  `vuelo_vuelo_id` int NOT NULL,
  PRIMARY KEY (`pasajero_dni`,`vuelo_vuelo_id`),
  KEY `fk_pasajero_has_vuelo_vuelo1_idx` (`vuelo_vuelo_id`),
  KEY `fk_pasajero_has_vuelo_pasajero1_idx` (`pasajero_dni`),
  CONSTRAINT `fk_pasajero_has_vuelo_pasajero1` FOREIGN KEY (`pasajero_dni`) REFERENCES `pasajero` (`dni`),
  CONSTRAINT `fk_pasajero_has_vuelo_vuelo1` FOREIGN KEY (`vuelo_vuelo_id`) REFERENCES `vuelo` (`vuelo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasajero_has_vuelo`
--

LOCK TABLES `pasajero_has_vuelo` WRITE;
/*!40000 ALTER TABLE `pasajero_has_vuelo` DISABLE KEYS */;
INSERT INTO `pasajero_has_vuelo` VALUES (22345190,4),(22363190,4),(223145190,4),(22345190,6),(223145190,6),(22345190,7),(22345190,8),(22345190,9);
/*!40000 ALTER TABLE `pasajero_has_vuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pista`
--

DROP TABLE IF EXISTS `pista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pista` (
  `pista_id` int NOT NULL,
  `aeropuerto_aeropuerto_id` int NOT NULL,
  PRIMARY KEY (`pista_id`,`aeropuerto_aeropuerto_id`),
  KEY `fk_pista_aeropuerto1_idx` (`aeropuerto_aeropuerto_id`),
  CONSTRAINT `fk_pista_aeropuerto1` FOREIGN KEY (`aeropuerto_aeropuerto_id`) REFERENCES `aeropuerto` (`aeropuerto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pista`
--

LOCK TABLES `pista` WRITE;
/*!40000 ALTER TABLE `pista` DISABLE KEYS */;
INSERT INTO `pista` VALUES (1,1),(2,1),(1,2),(2,2);
/*!40000 ALTER TABLE `pista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_avión`
--

DROP TABLE IF EXISTS `tipo_avión`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_avión` (
  `tipo_avión_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`tipo_avión_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_avión`
--

LOCK TABLES `tipo_avión` WRITE;
/*!40000 ALTER TABLE `tipo_avión` DISABLE KEYS */;
INSERT INTO `tipo_avión` VALUES (1,'Comercial'),(2,'Privado'),(3,'Militar');
/*!40000 ALTER TABLE `tipo_avión` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_documento` (
  `idtipo` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idtipo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documento`
--

LOCK TABLES `tipo_documento` WRITE;
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
INSERT INTO `tipo_documento` VALUES (1,'Dni');
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_mostrador`
--

DROP TABLE IF EXISTS `tipo_mostrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_mostrador` (
  `tipo_mostrador_id` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`tipo_mostrador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_mostrador`
--

LOCK TABLES `tipo_mostrador` WRITE;
/*!40000 ALTER TABLE `tipo_mostrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_mostrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_pista`
--

DROP TABLE IF EXISTS `tipo_pista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_pista` (
  `tipo_pista_id` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`tipo_pista_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_pista`
--

LOCK TABLES `tipo_pista` WRITE;
/*!40000 ALTER TABLE `tipo_pista` DISABLE KEYS */;
INSERT INTO `tipo_pista` VALUES (1,'Comercial'),(2,'Privada');
/*!40000 ALTER TABLE `tipo_pista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_vuelo`
--

DROP TABLE IF EXISTS `tipo_vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_vuelo` (
  `tipo_vuelo_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`tipo_vuelo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_vuelo`
--

LOCK TABLES `tipo_vuelo` WRITE;
/*!40000 ALTER TABLE `tipo_vuelo` DISABLE KEYS */;
INSERT INTO `tipo_vuelo` VALUES (1,'Business');
/*!40000 ALTER TABLE `tipo_vuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo`
--

DROP TABLE IF EXISTS `vuelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo` (
  `vuelo_id` int NOT NULL AUTO_INCREMENT,
  `aerolínea_id` int NOT NULL,
  `tipo_vuelo_id` int NOT NULL,
  `aeropuerto_id` int NOT NULL,
  `avión_id` int NOT NULL,
  PRIMARY KEY (`vuelo_id`,`aerolínea_id`,`tipo_vuelo_id`,`aeropuerto_id`,`avión_id`),
  KEY `fk_vuelo_aerolínea1_idx` (`aerolínea_id`),
  KEY `fk_vuelo_tipo_vuelo1_idx` (`tipo_vuelo_id`),
  KEY `fk_vuelo_aeropuerto1_idx` (`aeropuerto_id`),
  KEY `fk_vuelo_avión1_idx` (`avión_id`),
  CONSTRAINT `fk_vuelo_aerolínea1` FOREIGN KEY (`aerolínea_id`) REFERENCES `aerolínea` (`aerolínea_id`),
  CONSTRAINT `fk_vuelo_aeropuerto1` FOREIGN KEY (`aeropuerto_id`) REFERENCES `aeropuerto` (`aeropuerto_id`),
  CONSTRAINT `fk_vuelo_avión1` FOREIGN KEY (`avión_id`) REFERENCES `avión` (`avión_id`),
  CONSTRAINT `fk_vuelo_tipo_vuelo1` FOREIGN KEY (`tipo_vuelo_id`) REFERENCES `tipo_vuelo` (`tipo_vuelo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo`
--

LOCK TABLES `vuelo` WRITE;
/*!40000 ALTER TABLE `vuelo` DISABLE KEYS */;
INSERT INTO `vuelo` VALUES (4,1,1,1,3),(5,1,1,1,3),(6,1,1,1,3),(7,1,1,1,4),(8,1,1,1,4),(9,1,1,1,4);
/*!40000 ALTER TABLE `vuelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo_has_destino`
--

DROP TABLE IF EXISTS `vuelo_has_destino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo_has_destino` (
  `fecha_llegada` datetime DEFAULT NULL,
  `vuelo_id` int NOT NULL,
  `código_IATA` varchar(3) NOT NULL,
  `aeropuerto_id` int NOT NULL,
  PRIMARY KEY (`vuelo_id`,`código_IATA`,`aeropuerto_id`),
  KEY `fk_vuelo_has_destino_ciudad1_idx` (`código_IATA`),
  KEY `fk_vuelo_has_destino_aeropuerto1_idx` (`aeropuerto_id`),
  CONSTRAINT `fk_vuelo_has_destino_aeropuerto1` FOREIGN KEY (`aeropuerto_id`) REFERENCES `aeropuerto` (`aeropuerto_id`),
  CONSTRAINT `fk_vuelo_has_destino_ciudad1` FOREIGN KEY (`código_IATA`) REFERENCES `ciudad` (`código_IATA`),
  CONSTRAINT `fk_vuelo_has_destino_vuelo1` FOREIGN KEY (`vuelo_id`) REFERENCES `vuelo` (`vuelo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo_has_destino`
--

LOCK TABLES `vuelo_has_destino` WRITE;
/*!40000 ALTER TABLE `vuelo_has_destino` DISABLE KEYS */;
INSERT INTO `vuelo_has_destino` VALUES ('2023-10-23 15:25:58',1,'MAD',2),('2023-10-23 16:25:19',4,'MAD',2),('2011-03-02 15:25:58',6,'MAD',2),('2023-11-06 00:00:00',7,'MAD',2),('2023-11-06 00:00:00',8,'MAD',2),('2023-11-06 00:00:00',9,'MAD',2);
/*!40000 ALTER TABLE `vuelo_has_destino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo_has_origen`
--

DROP TABLE IF EXISTS `vuelo_has_origen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo_has_origen` (
  `fecha_salida` datetime DEFAULT NULL,
  `vuelo_id` int NOT NULL,
  `código_IATA` varchar(3) NOT NULL,
  `aeropuerto_id` int NOT NULL,
  PRIMARY KEY (`vuelo_id`,`código_IATA`,`aeropuerto_id`),
  KEY `fk_vuelo_has_origen_ciudad1_idx` (`código_IATA`),
  KEY `fk_vuelo_has_origen_aeropuerto1_idx` (`aeropuerto_id`),
  CONSTRAINT `fk_vuelo_has_origen_aeropuerto1` FOREIGN KEY (`aeropuerto_id`) REFERENCES `aeropuerto` (`aeropuerto_id`),
  CONSTRAINT `fk_vuelo_has_origen_ciudad1` FOREIGN KEY (`código_IATA`) REFERENCES `ciudad` (`código_IATA`),
  CONSTRAINT `fk_vuelo_has_origen_vuelo1` FOREIGN KEY (`vuelo_id`) REFERENCES `vuelo` (`vuelo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo_has_origen`
--

LOCK TABLES `vuelo_has_origen` WRITE;
/*!40000 ALTER TABLE `vuelo_has_origen` DISABLE KEYS */;
INSERT INTO `vuelo_has_origen` VALUES ('2023-10-23 15:25:58',1,'EZE',1),('2023-11-05 00:00:00',7,'EZE',1),('2023-11-05 00:00:00',8,'EZE',1),('2023-11-05 00:00:00',9,'EZE',1);
/*!40000 ALTER TABLE `vuelo_has_origen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vuelo_has_pista`
--

DROP TABLE IF EXISTS `vuelo_has_pista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vuelo_has_pista` (
  `pista_id` int NOT NULL,
  `vuelo_id` int NOT NULL,
  `tipo_pista_id` int NOT NULL,
  PRIMARY KEY (`pista_id`,`vuelo_id`,`tipo_pista_id`),
  KEY `fk_vuelo_has_pista_vuelo1_idx` (`vuelo_id`),
  KEY `fk_vuelo_has_pista_tipo_pista1_idx` (`tipo_pista_id`),
  CONSTRAINT `fk_vuelo_has_pista_pista1` FOREIGN KEY (`pista_id`) REFERENCES `pista` (`pista_id`),
  CONSTRAINT `fk_vuelo_has_pista_tipo_pista1` FOREIGN KEY (`tipo_pista_id`) REFERENCES `tipo_pista` (`tipo_pista_id`),
  CONSTRAINT `fk_vuelo_has_pista_vuelo1` FOREIGN KEY (`vuelo_id`) REFERENCES `vuelo` (`vuelo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vuelo_has_pista`
--

LOCK TABLES `vuelo_has_pista` WRITE;
/*!40000 ALTER TABLE `vuelo_has_pista` DISABLE KEYS */;
INSERT INTO `vuelo_has_pista` VALUES (2,1,1),(1,3,2),(2,7,1),(2,8,1),(2,9,1);
/*!40000 ALTER TABLE `vuelo_has_pista` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-24 10:59:34
