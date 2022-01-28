-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 192.168.1.160    Database: ejercicio12
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
-- Table structure for table `Alumnos`
--

DROP TABLE IF EXISTS `Alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Alumnos` (
  `codigo` int NOT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Apellido1` varchar(60) DEFAULT NULL,
  `Apellido2` varchar(60) DEFAULT NULL,
  `DNI` varchar(9) DEFAULT NULL,
  `Direccion` varchar(255) DEFAULT NULL,
  `Sexo` char(1) DEFAULT NULL,
  `Fecha_nacimiento` date DEFAULT NULL,
  `Curso` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`) /*!80000 INVISIBLE */,
  KEY `Matriculado_idx` (`Curso`),
  CONSTRAINT `Matriculado` FOREIGN KEY (`Curso`) REFERENCES `Cursos` (`codigo`),
  CONSTRAINT `Alumnos_chk_1` CHECK ((`Sexo` in (_utf8mb4'H',_utf8mb4'M')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Alumnos`
--

LOCK TABLES `Alumnos` WRITE;
/*!40000 ALTER TABLE `Alumnos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cursos`
--

DROP TABLE IF EXISTS `Cursos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Cursos` (
  `codigo` int NOT NULL,
  `Nombre_curso` varchar(60) DEFAULT NULL,
  `DNI_profesor` varchar(9) DEFAULT NULL,
  `Maximo_alumnos` int DEFAULT NULL,
  `Fecha_inicio` date DEFAULT NULL,
  `Fecha_fin` date DEFAULT NULL,
  `Num_horas` int NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`),
  UNIQUE KEY `Nombre_curso_UNIQUE` (`Nombre_curso`),
  KEY `dni_profesor_idx` (`DNI_profesor`) /*!80000 INVISIBLE */,
  CONSTRAINT `dni_profesor` FOREIGN KEY (`DNI_profesor`) REFERENCES `Profesores` (`DNI`),
  CONSTRAINT `Cursos_chk_1` CHECK ((`Fecha_inicio` < `Fecha_fin`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cursos`
--

LOCK TABLES `Cursos` WRITE;
/*!40000 ALTER TABLE `Cursos` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cursos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Profesores`
--

DROP TABLE IF EXISTS `Profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Profesores` (
  `codigo` int NOT NULL,
  `Nombre` varchar(60) DEFAULT NULL,
  `Apellido1` varchar(60) DEFAULT NULL,
  `Apellido2` varchar(60) DEFAULT NULL,
  `DNI` varchar(9) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Titulacion` varchar(60) DEFAULT NULL,
  `CuotaHora` double NOT NULL,
  PRIMARY KEY (`codigo`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Profesores`
--

LOCK TABLES `Profesores` WRITE;
/*!40000 ALTER TABLE `Profesores` DISABLE KEYS */;
/*!40000 ALTER TABLE `Profesores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-28 11:39:19
