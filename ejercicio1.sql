-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 110.93.10.6    Database: ejercicio1
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `Estacion`
--

DROP TABLE IF EXISTS `Estacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estacion` (
  `Identificador` int NOT NULL,
  `Latitud` double DEFAULT NULL,
  `Longitud` double DEFAULT NULL,
  `Altitud` double DEFAULT NULL,
  PRIMARY KEY (`Identificador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estacion`
--

LOCK TABLES `Estacion` WRITE;
/*!40000 ALTER TABLE `Estacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `Estacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Muestra`
--

DROP TABLE IF EXISTS `Muestra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Muestra` (
  `IdentificadorEstacion` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `TemperaturaMin` double DEFAULT NULL,
  `TempreaturaMax` double DEFAULT NULL,
  `Precipitaciones` varchar(45) DEFAULT NULL,
  `HumedadMin` varchar(45) DEFAULT NULL,
  `HumedadMax` varchar(45) DEFAULT NULL,
  `VelocidadVientoMin` double DEFAULT NULL,
  `VelocidadVientoMax` double DEFAULT NULL,
  KEY `Identificador_idx` (`IdentificadorEstacion`),
  CONSTRAINT `Identificador` FOREIGN KEY (`IdentificadorEstacion`) REFERENCES `Estacion` (`Identificador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Muestra`
--

LOCK TABLES `Muestra` WRITE;
/*!40000 ALTER TABLE `Muestra` DISABLE KEYS */;
/*!40000 ALTER TABLE `Muestra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-28 10:00:17
