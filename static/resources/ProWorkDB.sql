-- MySQL dump 10.13  Distrib 8.0.36, for macos14 (arm64)
--
-- Host: 127.0.0.1    Database: proworkdb
-- ------------------------------------------------------
-- Server version	9.0.1

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
-- Table structure for table `azienda`
--

DROP TABLE IF EXISTS `azienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `azienda` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `settore` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `localita` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `azienda`
--

LOCK TABLES `azienda` WRITE;
/*!40000 ALTER TABLE `azienda` DISABLE KEYS */;
INSERT INTO `azienda` VALUES (1,'Innova Group','Cartotecnico','Erbe\''),(2,'MOA Sport','Moda','Castel d\'Ario'),(3,'Fondazione EduLife','Istruzione','Verona'),(4,'ProWork','Software House','Verona');
/*!40000 ALTER TABLE `azienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dipendente`
--

DROP TABLE IF EXISTS `dipendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dipendente` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_swedish_ci NOT NULL,
  `ruolo` varchar(200) COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `eta` int unsigned NOT NULL,
  `anni_servizio` enum('Meno di un anno','Da 1 a 4 anni','Da 5 a 10 anni','Da più di 10 anni') COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `genere` enum('M','F','Preferisco non specificarlo') COLLATE utf8mb4_swedish_ci DEFAULT NULL,
  `azienda_id` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_azienda` (`azienda_id`),
  CONSTRAINT `fk_azienda` FOREIGN KEY (`azienda_id`) REFERENCES `azienda` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dipendente`
--

LOCK TABLES `dipendente` WRITE;
/*!40000 ALTER TABLE `dipendente` DISABLE KEYS */;
INSERT INTO `dipendente` VALUES (1,'martaroech','$2b$12$S9epNVeWsyUBpeBETSF5Y.UGsKiSN6bc1vZ0C.9bdDAku4tCroiFa','Programmatore',21,'Meno di un anno','M',3),(2,'Maureen','$2b$12$ziqYflg1HAE69Zxxkw6u/.0TRwIoFD.smIvS/wk1thlJemR6Nanzu','Responsabile Risorse Umane',22,'Da 1 a 4 anni','F',1),(3,'Mattia','$2b$12$xav1OHnnUHDgm3YnLTx6sOXK1cptYJru28/2gsz7p4Z8PQLZ9zqQC','Interlocutore di ChatGPT',24,'Da 5 a 10 anni','M',2),(4,'Alessandro','$2b$12$Gu.EXvytXFy7C1sqZ/uKIetHNwGdrqWb8orQCQbNWELTPOdwdM1p.','Project Manager',21,'Meno di un anno','M',1),(5,'admin','$2b$12$8.i3XN7tzAkbUaEC0TfxmemKbIY8hA7lwp91hI.Ba7c3XxdC0Z9S6','DIVINITA\'',1404,'Da più di 10 anni','Preferisco non specificarlo',4);
/*!40000 ALTER TABLE `dipendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dipendente_recensione`
--

DROP TABLE IF EXISTS `dipendente_recensione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dipendente_recensione` (
  `id_dipendente` int unsigned NOT NULL,
  `id_recensione` int unsigned NOT NULL,
  PRIMARY KEY (`id_dipendente`,`id_recensione`) USING BTREE,
  KEY `id_recensione` (`id_recensione`),
  KEY `id_dipendente` (`id_dipendente`),
  CONSTRAINT `dipendente_recensione_ibfk_2` FOREIGN KEY (`id_recensione`) REFERENCES `recensione` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_dipendente_recensione_dipendente` FOREIGN KEY (`id_dipendente`) REFERENCES `dipendente` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dipendente_recensione`
--

LOCK TABLES `dipendente_recensione` WRITE;
/*!40000 ALTER TABLE `dipendente_recensione` DISABLE KEYS */;
INSERT INTO `dipendente_recensione` VALUES (2,1),(1,3),(4,3),(3,4);
/*!40000 ALTER TABLE `dipendente_recensione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recensione`
--

DROP TABLE IF EXISTS `recensione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recensione` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `testo` varchar(500) COLLATE utf8mb4_swedish_ci NOT NULL,
  `salario` enum('1','2','3','4','5','6') COLLATE utf8mb4_swedish_ci NOT NULL,
  `sicurezza_sul_lavoro` enum('1','2','3','4','5','6') COLLATE utf8mb4_swedish_ci NOT NULL,
  `benessere_mentale` enum('1','2','3','4','5','6') COLLATE utf8mb4_swedish_ci NOT NULL,
  `orario_flessibile` enum('1','2','3','4','5','6') COLLATE utf8mb4_swedish_ci NOT NULL,
  `rapporto_interpersonale` enum('1','2','3','4','5','6') COLLATE utf8mb4_swedish_ci NOT NULL,
  `crescita_personale` enum('1','2','3','4','5','6') COLLATE utf8mb4_swedish_ci NOT NULL,
  `benefit_aziendali` enum('1','2','3','4','5','6') COLLATE utf8mb4_swedish_ci NOT NULL,
  `id_azienda` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_recensione_azienda` (`id_azienda`),
  CONSTRAINT `FK_recensione_azienda` FOREIGN KEY (`id_azienda`) REFERENCES `azienda` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recensione`
--

LOCK TABLES `recensione` WRITE;
/*!40000 ALTER TABLE `recensione` DISABLE KEYS */;
INSERT INTO `recensione` VALUES (1,'Non la consiglio','5','3','2','2','4','3','3',1),(2,'Sono molto contento di lavorare qui','4','6','6','5','6','6','4',3),(3,'Il lavoro è molto semplice, i colleghi ti aiutano nei momenti di bisogno','4','5','5','5','6','4','1',2),(4,'Lavoro pesante, colleghi fantastici,orari poco flessibili','6','1','1','3','6','2','4',1);
/*!40000 ALTER TABLE `recensione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `password` varchar(200) COLLATE utf8mb4_swedish_ci NOT NULL,
  `eta` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES (1,'MarioRossi','MarioRossi',20),(2,'LuigiVerdi','LuigiVerdi',21),(3,'MariaGialli','MariaGialli',18);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-21 12:25:54
