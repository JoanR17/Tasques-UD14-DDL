-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 110.93.10.6    Database: ud12_act13
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
-- Table structure for table `Almacen`
--

DROP TABLE IF EXISTS `Almacen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Almacen` (
  `numero` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `codigoLetras` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `CodLetra_idx` (`codigoLetras`),
  CONSTRAINT `CodLetra` FOREIGN KEY (`codigoLetras`) REFERENCES `Estante` (`CodigoLetras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Almacen`
--

LOCK TABLES `Almacen` WRITE;
/*!40000 ALTER TABLE `Almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `Almacen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cocinero`
--

DROP TABLE IF EXISTS `Cocinero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cocinero` (
  `DNI` varchar(9) NOT NULL,
  `AnosServico` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  CONSTRAINT `trabajoCocinero` FOREIGN KEY (`DNI`) REFERENCES `Empleado` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cocinero`
--

LOCK TABLES `Cocinero` WRITE;
/*!40000 ALTER TABLE `Cocinero` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cocinero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleado`
--

DROP TABLE IF EXISTS `Empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Empleado` (
  `DNI` varchar(9) NOT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Apellidos` varchar(100) DEFAULT NULL,
  `NumeroSS` int DEFAULT NULL,
  `TelFijo` varchar(15) DEFAULT NULL,
  `Movil` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleado`
--

LOCK TABLES `Empleado` WRITE;
/*!40000 ALTER TABLE `Empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `Empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Entrante`
--

DROP TABLE IF EXISTS `Entrante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Entrante` (
  `IDPlato` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  PRIMARY KEY (`IDPlato`),
  CONSTRAINT `Plato0` FOREIGN KEY (`IDPlato`) REFERENCES `Plato` (`idPlato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Entrante`
--

LOCK TABLES `Entrante` WRITE;
/*!40000 ALTER TABLE `Entrante` DISABLE KEYS */;
/*!40000 ALTER TABLE `Entrante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Estante`
--

DROP TABLE IF EXISTS `Estante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Estante` (
  `CodigoLetras` varchar(5) NOT NULL,
  `TamaÃ±o` double DEFAULT NULL,
  PRIMARY KEY (`CodigoLetras`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Estante`
--

LOCK TABLES `Estante` WRITE;
/*!40000 ALTER TABLE `Estante` DISABLE KEYS */;
/*!40000 ALTER TABLE `Estante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ingredientes`
--

DROP TABLE IF EXISTS `Ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ingredientes` (
  `idIngredientes` int NOT NULL,
  `Cantidad` int DEFAULT NULL,
  PRIMARY KEY (`idIngredientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ingredientes`
--

LOCK TABLES `Ingredientes` WRITE;
/*!40000 ALTER TABLE `Ingredientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ingredientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Pinche`
--

DROP TABLE IF EXISTS `Pinche`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Pinche` (
  `DNI` varchar(9) NOT NULL,
  `fechaNacimiento` date DEFAULT NULL,
  `cocinero` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`DNI`),
  KEY `cocinero_idx` (`cocinero`),
  CONSTRAINT `Jefe` FOREIGN KEY (`cocinero`) REFERENCES `Cocinero` (`DNI`),
  CONSTRAINT `trabajoPinche` FOREIGN KEY (`DNI`) REFERENCES `Empleado` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Pinche`
--

LOCK TABLES `Pinche` WRITE;
/*!40000 ALTER TABLE `Pinche` DISABLE KEYS */;
/*!40000 ALTER TABLE `Pinche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plato`
--

DROP TABLE IF EXISTS `Plato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Plato` (
  `idPlato` int NOT NULL,
  PRIMARY KEY (`idPlato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plato`
--

LOCK TABLES `Plato` WRITE;
/*!40000 ALTER TABLE `Plato` DISABLE KEYS */;
/*!40000 ALTER TABLE `Plato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Postre`
--

DROP TABLE IF EXISTS `Postre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Postre` (
  `IDPlato` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  PRIMARY KEY (`IDPlato`),
  CONSTRAINT `Plato3` FOREIGN KEY (`IDPlato`) REFERENCES `Plato` (`idPlato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Postre`
--

LOCK TABLES `Postre` WRITE;
/*!40000 ALTER TABLE `Postre` DISABLE KEYS */;
/*!40000 ALTER TABLE `Postre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PrimerPlato`
--

DROP TABLE IF EXISTS `PrimerPlato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PrimerPlato` (
  `IDPlato` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  PRIMARY KEY (`IDPlato`),
  CONSTRAINT `Plato1` FOREIGN KEY (`IDPlato`) REFERENCES `Plato` (`idPlato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PrimerPlato`
--

LOCK TABLES `PrimerPlato` WRITE;
/*!40000 ALTER TABLE `PrimerPlato` DISABLE KEYS */;
/*!40000 ALTER TABLE `PrimerPlato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PuedePreparar`
--

DROP TABLE IF EXISTS `PuedePreparar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PuedePreparar` (
  `DNI` varchar(9) DEFAULT NULL,
  `IDPlato` int DEFAULT NULL,
  KEY `cocinero_idx` (`DNI`),
  KEY `plato_idx` (`IDPlato`),
  CONSTRAINT `cocinero` FOREIGN KEY (`DNI`) REFERENCES `Cocinero` (`DNI`),
  CONSTRAINT `plato` FOREIGN KEY (`IDPlato`) REFERENCES `Plato` (`idPlato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PuedePreparar`
--

LOCK TABLES `PuedePreparar` WRITE;
/*!40000 ALTER TABLE `PuedePreparar` DISABLE KEYS */;
/*!40000 ALTER TABLE `PuedePreparar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeAlmacena`
--

DROP TABLE IF EXISTS `SeAlmacena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SeAlmacena` (
  `Almacen` int DEFAULT NULL,
  `CodLetras` varchar(5) DEFAULT NULL,
  `IDIngrediente` int DEFAULT NULL,
  KEY `almacen_idx` (`Almacen`),
  KEY `estante_idx` (`CodLetras`),
  KEY `ingredientes_idx` (`IDIngrediente`),
  CONSTRAINT `almacen` FOREIGN KEY (`Almacen`) REFERENCES `Almacen` (`numero`),
  CONSTRAINT `estante` FOREIGN KEY (`CodLetras`) REFERENCES `Estante` (`CodigoLetras`),
  CONSTRAINT `ingredientes` FOREIGN KEY (`IDIngrediente`) REFERENCES `Ingredientes` (`idIngredientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeAlmacena`
--

LOCK TABLES `SeAlmacena` WRITE;
/*!40000 ALTER TABLE `SeAlmacena` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeAlmacena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SegundoPlato`
--

DROP TABLE IF EXISTS `SegundoPlato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SegundoPlato` (
  `IDPlato` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Precio` double DEFAULT NULL,
  PRIMARY KEY (`IDPlato`),
  CONSTRAINT `Plato2` FOREIGN KEY (`IDPlato`) REFERENCES `Plato` (`idPlato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SegundoPlato`
--

LOCK TABLES `SegundoPlato` WRITE;
/*!40000 ALTER TABLE `SegundoPlato` DISABLE KEYS */;
/*!40000 ALTER TABLE `SegundoPlato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tiene`
--

DROP TABLE IF EXISTS `Tiene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Tiene` (
  `IDPlato` int DEFAULT NULL,
  `IDIngrediente` int DEFAULT NULL,
  KEY `IDPlato_idx` (`IDPlato`),
  KEY `Ingrediente_idx` (`IDIngrediente`),
  CONSTRAINT `IDPlato` FOREIGN KEY (`IDPlato`) REFERENCES `Plato` (`idPlato`),
  CONSTRAINT `Ingrediente` FOREIGN KEY (`IDIngrediente`) REFERENCES `Ingredientes` (`idIngredientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tiene`
--

LOCK TABLES `Tiene` WRITE;
/*!40000 ALTER TABLE `Tiene` DISABLE KEYS */;
/*!40000 ALTER TABLE `Tiene` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-28 12:40:06
