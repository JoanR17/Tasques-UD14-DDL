-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.1.160    Database: ejercicio2
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
-- Table structure for table `Autor`
--

DROP TABLE IF EXISTS `Autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Autor` (
  `ClaveAutor` int NOT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ClaveAutor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Autor`
--

LOCK TABLES `Autor` WRITE;
/*!40000 ALTER TABLE `Autor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Editorial`
--

DROP TABLE IF EXISTS `Editorial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Editorial` (
  `ClaveEditorial` smallint NOT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Dirección` varchar(60) DEFAULT NULL,
  `Teléfono` varchar(15) DEFAULT NULL,
  `ClaveLibro` int DEFAULT NULL,
  PRIMARY KEY (`ClaveEditorial`),
  KEY `Clave_idx` (`ClaveLibro`),
  CONSTRAINT `Clave` FOREIGN KEY (`ClaveLibro`) REFERENCES `Libro` (`ClaveLibro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Editorial`
--

LOCK TABLES `Editorial` WRITE;
/*!40000 ALTER TABLE `Editorial` DISABLE KEYS */;
/*!40000 ALTER TABLE `Editorial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ejemplar`
--

DROP TABLE IF EXISTS `Ejemplar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ejemplar` (
  `ClaveEjemplar` int NOT NULL,
  `NúmeroOrden` smallint DEFAULT NULL,
  `Edición` smallint DEFAULT NULL,
  `Ubicación` varchar(15) DEFAULT NULL,
  `Categoría` char(1) DEFAULT NULL,
  `ClaveLibro` int DEFAULT NULL,
  PRIMARY KEY (`ClaveEjemplar`),
  KEY `Clave_idx` (`ClaveLibro`),
  CONSTRAINT `ClaveL` FOREIGN KEY (`ClaveLibro`) REFERENCES `Libro` (`ClaveLibro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ejemplar`
--

LOCK TABLES `Ejemplar` WRITE;
/*!40000 ALTER TABLE `Ejemplar` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ejemplar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Escrito_por`
--

DROP TABLE IF EXISTS `Escrito_por`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Escrito_por` (
  `ClaveLibro` int NOT NULL,
  `ClaveAutor` int NOT NULL,
  KEY `ClaveL3_idx` (`ClaveLibro`),
  KEY `ClaveA_idx` (`ClaveAutor`),
  CONSTRAINT `ClaveA` FOREIGN KEY (`ClaveAutor`) REFERENCES `Autor` (`ClaveAutor`),
  CONSTRAINT `ClaveL3` FOREIGN KEY (`ClaveLibro`) REFERENCES `Libro` (`ClaveLibro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Escrito_por`
--

LOCK TABLES `Escrito_por` WRITE;
/*!40000 ALTER TABLE `Escrito_por` DISABLE KEYS */;
/*!40000 ALTER TABLE `Escrito_por` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Libro`
--

DROP TABLE IF EXISTS `Libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Libro` (
  `ClaveLibro` int NOT NULL AUTO_INCREMENT,
  `Titulo` varchar(60) DEFAULT NULL,
  `Idioma` varchar(15) DEFAULT NULL,
  `Formato` varchar(15) DEFAULT NULL,
  `ClaveEditorial` smallint DEFAULT NULL,
  PRIMARY KEY (`ClaveLibro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Libro`
--

LOCK TABLES `Libro` WRITE;
/*!40000 ALTER TABLE `Libro` DISABLE KEYS */;
/*!40000 ALTER TABLE `Libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Préstamo`
--

DROP TABLE IF EXISTS `Préstamo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Préstamo` (
  `ClaveSocio` int NOT NULL,
  `ClaveEjemplar` int NOT NULL,
  `NúmeroOrden` smallint DEFAULT NULL,
  `Fecha_préstamo` date DEFAULT NULL,
  `Fecha_devolución` date DEFAULT NULL,
  `Notas` blob,
  KEY `ClaveS_idx` (`ClaveSocio`),
  KEY `ClaveE_idx` (`ClaveEjemplar`),
  CONSTRAINT `ClaveE` FOREIGN KEY (`ClaveEjemplar`) REFERENCES `Ejemplar` (`ClaveEjemplar`),
  CONSTRAINT `ClaveS` FOREIGN KEY (`ClaveSocio`) REFERENCES `Socio` (`ClaveSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Préstamo`
--

LOCK TABLES `Préstamo` WRITE;
/*!40000 ALTER TABLE `Préstamo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Préstamo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Socio`
--

DROP TABLE IF EXISTS `Socio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Socio` (
  `ClaveSocio` int NOT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Dirección` varchar(60) DEFAULT NULL,
  `Teléfono` varchar(15) DEFAULT NULL,
  `Categoría` char(1) DEFAULT NULL,
  PRIMARY KEY (`ClaveSocio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Socio`
--

LOCK TABLES `Socio` WRITE;
/*!40000 ALTER TABLE `Socio` DISABLE KEYS */;
/*!40000 ALTER TABLE `Socio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tema`
--

DROP TABLE IF EXISTS `Tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tema` (
  `ClaveTema` smallint NOT NULL,
  `Nombre` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ClaveTema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tema`
--

LOCK TABLES `Tema` WRITE;
/*!40000 ALTER TABLE `Tema` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trata_sobre`
--

DROP TABLE IF EXISTS `Trata_sobre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trata_sobre` (
  `ClaveLibro` int NOT NULL,
  `ClaveTema` smallint NOT NULL,
  KEY `ClaveL_idx` (`ClaveLibro`),
  KEY `ClaveT_idx` (`ClaveTema`),
  CONSTRAINT `ClaveL2` FOREIGN KEY (`ClaveLibro`) REFERENCES `Libro` (`ClaveLibro`),
  CONSTRAINT `ClaveT` FOREIGN KEY (`ClaveTema`) REFERENCES `Tema` (`ClaveTema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trata_sobre`
--

LOCK TABLES `Trata_sobre` WRITE;
/*!40000 ALTER TABLE `Trata_sobre` DISABLE KEYS */;
/*!40000 ALTER TABLE `Trata_sobre` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-28 10:19:52
