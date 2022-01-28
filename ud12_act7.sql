-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 110.93.10.6    Database: ud12_act7
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
-- Table structure for table `CategoriaProfesional`
--

DROP TABLE IF EXISTS `CategoriaProfesional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CategoriaProfesional` (
  `idCategoria` int NOT NULL,
  `idContrato` int DEFAULT NULL,
  `CodTrabajador` int DEFAULT NULL,
  `idNomina` int DEFAULT NULL,
  PRIMARY KEY (`idCategoria`),
  KEY `Contrato_idx` (`idContrato`),
  KEY `Trabajadores_idx` (`CodTrabajador`),
  KEY `Nomina_idx` (`idNomina`),
  CONSTRAINT `Contrato` FOREIGN KEY (`idContrato`) REFERENCES `Contratos` (`idContratos`),
  CONSTRAINT `Nomina` FOREIGN KEY (`idNomina`) REFERENCES `Nominas` (`idNominas`),
  CONSTRAINT `Trabajadores` FOREIGN KEY (`CodTrabajador`) REFERENCES `Trabajadores` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoriaProfesional`
--

LOCK TABLES `CategoriaProfesional` WRITE;
/*!40000 ALTER TABLE `CategoriaProfesional` DISABLE KEYS */;
/*!40000 ALTER TABLE `CategoriaProfesional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Contratos`
--

DROP TABLE IF EXISTS `Contratos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Contratos` (
  `idContratos` int NOT NULL,
  `FechaInicio` date DEFAULT NULL,
  `FechaFin` date DEFAULT NULL,
  PRIMARY KEY (`idContratos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Contratos`
--

LOCK TABLES `Contratos` WRITE;
/*!40000 ALTER TABLE `Contratos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Contratos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departamentos`
--

DROP TABLE IF EXISTS `Departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Departamentos` (
  `Codigo` int NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Trabajador` int DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `Trabajador_idx` (`Trabajador`),
  CONSTRAINT `Trabajador` FOREIGN KEY (`Trabajador`) REFERENCES `Trabajadores` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departamentos`
--

LOCK TABLES `Departamentos` WRITE;
/*!40000 ALTER TABLE `Departamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Nominas`
--

DROP TABLE IF EXISTS `Nominas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Nominas` (
  `idNominas` int NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Salario` double DEFAULT NULL,
  PRIMARY KEY (`idNominas`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Nominas`
--

LOCK TABLES `Nominas` WRITE;
/*!40000 ALTER TABLE `Nominas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Nominas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trabajadores`
--

DROP TABLE IF EXISTS `Trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trabajadores` (
  `Codigo` int NOT NULL,
  `DNI` varchar(8) DEFAULT NULL,
  `NumSS` int DEFAULT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Apellidos` varchar(45) DEFAULT NULL,
  `Direccion` varchar(45) DEFAULT NULL,
  `Telefono` varchar(45) DEFAULT NULL,
  `Jefe` int DEFAULT NULL,
  PRIMARY KEY (`Codigo`),
  KEY `Jefe_idx` (`Jefe`),
  CONSTRAINT `Jefe` FOREIGN KEY (`Jefe`) REFERENCES `Trabajadores` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trabajadores`
--

LOCK TABLES `Trabajadores` WRITE;
/*!40000 ALTER TABLE `Trabajadores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Trabajan`
--

DROP TABLE IF EXISTS `Trabajan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Trabajan` (
  `Trabajador` int DEFAULT NULL,
  `Departamento` int DEFAULT NULL,
  KEY `Trabajador_idx` (`Trabajador`),
  KEY `Departamento_idx` (`Departamento`),
  CONSTRAINT `CodDepartamento` FOREIGN KEY (`Departamento`) REFERENCES `Departamentos` (`Codigo`),
  CONSTRAINT `CodTrabajador` FOREIGN KEY (`Trabajador`) REFERENCES `Trabajadores` (`Codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Trabajan`
--

LOCK TABLES `Trabajan` WRITE;
/*!40000 ALTER TABLE `Trabajan` DISABLE KEYS */;
/*!40000 ALTER TABLE `Trabajan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-28 11:53:41
