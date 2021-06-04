-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: youcredit
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `en_entidade`
--

DROP TABLE IF EXISTS `en_entidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_entidade` (
  `entidade_id` int NOT NULL AUTO_INCREMENT,
  `entidade` varchar(25) NOT NULL,
  `nome` varchar(75) NOT NULL,
  `nif` varchar(10) DEFAULT NULL,
  `cartao_cidadao` varchar(15) DEFAULT NULL,
  `passaporte` varchar(15) DEFAULT NULL,
  `morada` varchar(100) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `data_nascimento` date NOT NULL,
  `genero` varchar(10) NOT NULL,
  `entidade_empregadora` varchar(50) DEFAULT NULL,
  `data_inicio_emprego` date DEFAULT NULL,
  `rating` int NOT NULL,
  `salario_anual` decimal(9,2) NOT NULL,
  `creditos_actuais` decimal(9,2) NOT NULL,
  `lista_negra` varchar(75) DEFAULT NULL,
  `sector_actividade_id` int NOT NULL,
  `situacao_profissional_id` int NOT NULL,
  `segmento_cliente_id` int NOT NULL,
  `estado_entidade_id` int NOT NULL,
  `nacionalidade_id` int NOT NULL,
  `data_estado_entidade` date DEFAULT NULL,
  `existe_crm` varchar(1) DEFAULT NULL,
  `data_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int NOT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  `classeestadoentidade_estado_entidade` varchar(15) DEFAULT NULL,
  `classenacionalidade_nacionalidade` varchar(15) DEFAULT NULL,
  `classesectoractividade_sector_actividade` varchar(15) DEFAULT NULL,
  `classesegmentocliente_segmento_cliente` varchar(15) DEFAULT NULL,
  `classesituacaoprofissional_situacao_profissional` varchar(15) DEFAULT NULL,
  `utilizador` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entidade_id`),
  KEY `sector_actividade_id` (`sector_actividade_id`),
  KEY `situacao_profissional_id` (`situacao_profissional_id`),
  KEY `estado_entidade_id` (`estado_entidade_id`),
  KEY `segmento_cliente_id` (`segmento_cliente_id`),
  KEY `nacionalidade_id` (`nacionalidade_id`),
  CONSTRAINT `en_entidade_ibfk_1` FOREIGN KEY (`sector_actividade_id`) REFERENCES `en_sector_actividade` (`sector_actividade_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `en_entidade_ibfk_2` FOREIGN KEY (`situacao_profissional_id`) REFERENCES `en_situacao_profissional` (`situacao_profissional_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `en_entidade_ibfk_3` FOREIGN KEY (`estado_entidade_id`) REFERENCES `en_estado_entidade` (`estado_entidade_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `en_entidade_ibfk_4` FOREIGN KEY (`segmento_cliente_id`) REFERENCES `en_segmento_cliente` (`segmento_cliente_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `en_entidade_ibfk_5` FOREIGN KEY (`nacionalidade_id`) REFERENCES `en_nacionalidade` (`nacionalidade_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `en_entidade_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I'))),
  CONSTRAINT `en_entidade_chk_genero` CHECK (((`genero` = _utf8mb4'Masculino') or (`genero` = _utf8mb4'Feminino') or (`genero` = _utf8mb4'Neutro')))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `en_entidade`
--

LOCK TABLES `en_entidade` WRITE;
/*!40000 ALTER TABLE `en_entidade` DISABLE KEYS */;
INSERT INTO `en_entidade` VALUES (1,'1','Joana Francisca','12124124','12412421451235','1241231412412','Rua da joana12345','2620 190','joana@gmail.com','12421241241','2094-05-10','Feminino','Donas de casa123','2017-05-11',2,40001.00,10000.00,'',1,1,1,1,1,'2021-05-12','S','2021-05-11 23:00:00',0,'A','Ativo','PT','Serviços','Dona casa ','Empregado',NULL),(2,'2','Antonio Costa','11245411','31231231244','12423523255','Rua da amadora 12345','2620 190','monheantonio@gmail.com','14141421525','2074-05-12','Masculino','Mecanico & roubo','2018-05-12',3,50000.00,0.00,'',2,1,2,1,2,'2021-05-12','S','2021-05-11 23:00:00',0,'A','Ativo','IN','Carros','Senior','Empregado',NULL),(3,'3','Ric Fazeres','1234154235','152363567457','1346435674747','Rua do Ric 123456','2620 190','riczao@gmail.com','9431131344','2091-05-14','Masculino','Youtube e Twitch','2006-05-14',4,100000.00,0.00,'',3,1,2,1,1,'2021-05-14','S','2021-05-13 23:00:00',0,'A','Ativo','PT','Youtuber','Senior','Empregado','cli_3');
/*!40000 ALTER TABLE `en_entidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `en_estado_entidade`
--

DROP TABLE IF EXISTS `en_estado_entidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_estado_entidade` (
  `estado_entidade_id` int NOT NULL AUTO_INCREMENT,
  `estado_entidade` varchar(15) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `data_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int NOT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`estado_entidade_id`),
  CONSTRAINT `en_estadoentidade_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `en_estado_entidade`
--

LOCK TABLES `en_estado_entidade` WRITE;
/*!40000 ALTER TABLE `en_estado_entidade` DISABLE KEYS */;
INSERT INTO `en_estado_entidade` VALUES (1,'Ativo','Cliente ativo','2021-05-11 23:00:00',0,'A'),(2,'Inativo','Cliente inativo','2021-05-13 23:00:00',0,'A');
/*!40000 ALTER TABLE `en_estado_entidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `en_nacionalidade`
--

DROP TABLE IF EXISTS `en_nacionalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_nacionalidade` (
  `nacionalidade_id` int NOT NULL AUTO_INCREMENT,
  `nacionalidade` varchar(15) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `data_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int NOT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`nacionalidade_id`),
  CONSTRAINT `en_nacionalidade_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `en_nacionalidade`
--

LOCK TABLES `en_nacionalidade` WRITE;
/*!40000 ALTER TABLE `en_nacionalidade` DISABLE KEYS */;
INSERT INTO `en_nacionalidade` VALUES (1,'PT','Portugal','2021-05-11 23:00:00',0,'A'),(2,'IN','India','2021-05-11 23:00:00',0,'A'),(3,'CH','China','2021-05-11 23:00:00',0,'A'),(4,'ES','Espanha','2021-05-12 23:00:00',0,'A');
/*!40000 ALTER TABLE `en_nacionalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `en_relacao_entidades`
--

DROP TABLE IF EXISTS `en_relacao_entidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_relacao_entidades` (
  `relacao_entidades_id` int NOT NULL AUTO_INCREMENT,
  `entidade_pai_id` int NOT NULL,
  `entidade_filho_id` int NOT NULL,
  `tipo_relacao_entidade_id` int NOT NULL,
  `descricao` varchar(100) NOT NULL,
  `data_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int NOT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`relacao_entidades_id`),
  KEY `entidade_pai_id` (`entidade_pai_id`),
  KEY `entidade_filho_id` (`entidade_filho_id`),
  KEY `tipo_relacao_entidade_id` (`tipo_relacao_entidade_id`),
  CONSTRAINT `en_relacao_entidades_ibfk_1` FOREIGN KEY (`entidade_pai_id`) REFERENCES `en_entidade` (`entidade_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `en_relacao_entidades_ibfk_2` FOREIGN KEY (`entidade_filho_id`) REFERENCES `en_entidade` (`entidade_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `en_relacao_entidades_ibfk_3` FOREIGN KEY (`tipo_relacao_entidade_id`) REFERENCES `en_tipo_relacao_entidade` (`tipo_relacao_entidade_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `en_relacaoentidades_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `en_relacao_entidades`
--

LOCK TABLES `en_relacao_entidades` WRITE;
/*!40000 ALTER TABLE `en_relacao_entidades` DISABLE KEYS */;
/*!40000 ALTER TABLE `en_relacao_entidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `en_sector_actividade`
--

DROP TABLE IF EXISTS `en_sector_actividade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_sector_actividade` (
  `sector_actividade_id` int NOT NULL AUTO_INCREMENT,
  `sector_actividade` varchar(15) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `data_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int NOT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`sector_actividade_id`),
  CONSTRAINT `en_sectoractividade_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `en_sector_actividade`
--

LOCK TABLES `en_sector_actividade` WRITE;
/*!40000 ALTER TABLE `en_sector_actividade` DISABLE KEYS */;
INSERT INTO `en_sector_actividade` VALUES (1,'Serviços','Serviços de casa','2021-05-11 23:00:00',0,'A'),(2,'Carros','Mecânico','2021-05-11 23:00:00',0,'A'),(3,'Youtuber','Criador de conteudo','2021-05-13 23:00:00',0,'A');
/*!40000 ALTER TABLE `en_sector_actividade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `en_segmento_cliente`
--

DROP TABLE IF EXISTS `en_segmento_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_segmento_cliente` (
  `segmento_cliente_id` int NOT NULL AUTO_INCREMENT,
  `segmento_cliente` varchar(15) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `data_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int NOT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`segmento_cliente_id`),
  CONSTRAINT `en_segmentocliente_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `en_segmento_cliente`
--

LOCK TABLES `en_segmento_cliente` WRITE;
/*!40000 ALTER TABLE `en_segmento_cliente` DISABLE KEYS */;
INSERT INTO `en_segmento_cliente` VALUES (1,'Dona casa ','Dona de casa','2021-05-11 23:00:00',0,'A'),(2,'Senior','Profissional Senior','2021-05-11 23:00:00',0,'A');
/*!40000 ALTER TABLE `en_segmento_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `en_situacao_profissional`
--

DROP TABLE IF EXISTS `en_situacao_profissional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_situacao_profissional` (
  `situacao_profissional_id` int NOT NULL AUTO_INCREMENT,
  `situacao_profissional` varchar(15) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `data_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int NOT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`situacao_profissional_id`),
  CONSTRAINT `en_situacaoprofissional_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `en_situacao_profissional`
--

LOCK TABLES `en_situacao_profissional` WRITE;
/*!40000 ALTER TABLE `en_situacao_profissional` DISABLE KEYS */;
INSERT INTO `en_situacao_profissional` VALUES (1,'Empregado','A trabalhar','2021-05-11 23:00:00',0,'A');
/*!40000 ALTER TABLE `en_situacao_profissional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `en_tipo_relacao_entidade`
--

DROP TABLE IF EXISTS `en_tipo_relacao_entidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `en_tipo_relacao_entidade` (
  `tipo_relacao_entidade_id` int NOT NULL AUTO_INCREMENT,
  `tipo_relacao_entidade` varchar(15) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `data_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int NOT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`tipo_relacao_entidade_id`),
  CONSTRAINT `en_tiporelacaoentidade_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `en_tipo_relacao_entidade`
--

LOCK TABLES `en_tipo_relacao_entidade` WRITE;
/*!40000 ALTER TABLE `en_tipo_relacao_entidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `en_tipo_relacao_entidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `images` (
  `ID` varchar(255) NOT NULL,
  `GALLERY` varchar(255) DEFAULT NULL,
  `IMAGE` longblob,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_crm_entidade`
--

DROP TABLE IF EXISTS `log_crm_entidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_crm_entidade` (
  `log_crm_entidade_id` int NOT NULL AUTO_INCREMENT,
  `entidade_id` int DEFAULT NULL,
  `nome` varchar(75) DEFAULT NULL,
  `morada` varchar(100) DEFAULT NULL,
  `nif` varchar(10) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `estado` varchar(25) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `evento` varchar(10) DEFAULT NULL,
  `data_evento` datetime DEFAULT NULL,
  `data_log` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int DEFAULT NULL,
  `estado_log` varchar(1) DEFAULT 'A',
  PRIMARY KEY (`log_crm_entidade_id`),
  CONSTRAINT `log_crm_entidade_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_crm_entidade`
--

LOCK TABLES `log_crm_entidade` WRITE;
/*!40000 ALTER TABLE `log_crm_entidade` DISABLE KEYS */;
INSERT INTO `log_crm_entidade` VALUES (1,1234,'Gabriela Peste','rua das pedras negras','nif1','1234567890','email1','estado1',1,'criar','2021-05-07 00:00:00','2021-05-06 23:00:00',0,'A'),(2,1234,'Gabriela Peste','rua das pedras negras','nif1','1234567890','email1','estado1',1,'criar','2021-05-14 00:00:00','2021-05-13 23:00:00',0,'A'),(3,3,'Ric Fazeres','Rua do Ric 123456','1234154235','9431131344','riczao@gmail.com','Ativo',4,'alterar','2021-05-14 00:00:00','2021-05-13 23:00:00',0,'A'),(4,1,'Joana Francisca','Rua da joana12345','12124124','12421241241','joana@gmail.com','Ativo',2,'alterar','2021-05-14 00:00:00','2021-05-13 23:00:00',0,'A'),(5,1,'Joana Francisca','Rua da joana12345','12124124','12421241241','joana@gmail.com','Ativo',2,'alterar','2021-05-14 00:00:00','2021-05-13 23:00:00',0,'A'),(6,2,'Antonio Costa','Rua da amadora 12345','11245411','14141421525','monheantonio@gmail.com','Ativo',3,'alterar','2021-05-14 00:00:00','2021-05-13 23:00:00',0,'A'),(7,1234,'Gabriela Peste','rua das pedras negras','nif1','1234567890','email1','estado1',1,'criar','2021-05-15 00:00:00','2021-05-14 23:00:00',0,'A');
/*!40000 ALTER TABLE `log_crm_entidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_crm_simulacao`
--

DROP TABLE IF EXISTS `log_crm_simulacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_crm_simulacao` (
  `log_crm_simulacao_id` int NOT NULL AUTO_INCREMENT,
  `simulacao_id` int DEFAULT NULL,
  `produto` varchar(50) DEFAULT NULL,
  `instituicao_credito` varchar(50) DEFAULT NULL,
  `entidade_id` int DEFAULT NULL,
  `nome` varchar(75) DEFAULT NULL,
  `nif` varchar(10) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `rating` int DEFAULT NULL,
  `estado_entidade` varchar(15) DEFAULT NULL,
  `total_solicitado` double DEFAULT NULL,
  `total_possivel` double DEFAULT NULL,
  `estado_simulacao` varchar(15) DEFAULT NULL,
  `scoring` int DEFAULT NULL,
  `evento` varchar(10) DEFAULT NULL,
  `data_evento` datetime DEFAULT NULL,
  `data_log` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int DEFAULT NULL,
  `estado_log` varchar(1) DEFAULT 'A',
  `institucao_credito` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`log_crm_simulacao_id`),
  CONSTRAINT `log_crm_simulacao_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_crm_simulacao`
--

LOCK TABLES `log_crm_simulacao` WRITE;
/*!40000 ALTER TABLE `log_crm_simulacao` DISABLE KEYS */;
INSERT INTO `log_crm_simulacao` VALUES (1,1234,'Obras','BPI',9,'Francisco','12345','6789','francisco@gmail.com',1,'estado1',1000,900,'estado2',4,'criar','2021-05-07 00:00:00','2021-05-06 23:00:00',0,'A',NULL),(2,1234,'Obras','BPI',9,'Francisco','12345','6789','francisco@gmail.com',1,'estado1',1000,900,'estado2',4,'criar','2021-05-14 00:00:00','2021-05-13 23:00:00',0,'A',NULL),(3,1234,'Obras','BPI',9,'Francisco','12345','6789','francisco@gmail.com',1,'estado1',1000,900,'estado2',4,'criar','2021-05-15 00:00:00','2021-05-14 23:00:00',0,'A',NULL),(4,1234,'Obras','BPI',9,'Francisco','12345','6789','francisco@gmail.com',1,'estado1',1000,900,'estado2',4,'criar','2021-05-15 00:00:00','2021-05-14 23:00:00',0,'A',NULL),(5,38,'Prod5','BES',1,'Joana Francisca','12124124','12421241241','joana@gmail.com',2,'Ativo',4500,4500,'Registado',0,'criar','2021-05-15 00:00:00','2021-05-14 23:00:00',0,'A',NULL),(6,44,'Prod5','BES',2,'Antonio Costa','11245411','14141421525','monheantonio@gmail.com',3,'Ativo',4500,4000,'Sem Efeito',0,'criar','2021-05-16 00:00:00','2021-05-15 23:00:00',0,'A',NULL),(7,46,'Prod5','BES',3,'Ric Fazeres','1234154235','9431131344','riczao@gmail.com',4,'Ativo',4500,4000,'Aprovado',0,'criar','2021-05-16 00:00:00','2021-05-15 23:00:00',0,'A',NULL),(8,48,'Prod5','BES',3,'Ric Fazeres','1234154235','9431131344','riczao@gmail.com',4,'Ativo',4000,4000,'Aprovado',0,'criar','2021-05-16 00:00:00','2021-05-15 23:00:00',0,'A',NULL);
/*!40000 ALTER TABLE `log_crm_simulacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_parecer_quotacao`
--

DROP TABLE IF EXISTS `log_parecer_quotacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_parecer_quotacao` (
  `log_parecer_quotacao_id` int NOT NULL AUTO_INCREMENT,
  `simulacao_id` int NOT NULL,
  `produto` varchar(50) DEFAULT NULL,
  `nome` varchar(75) DEFAULT NULL,
  `nif` varchar(10) DEFAULT NULL,
  `total_solicitado` double DEFAULT NULL,
  `evento` varchar(10) DEFAULT NULL,
  `data_evento` datetime DEFAULT NULL,
  `parecer_obs` varchar(100) DEFAULT NULL,
  `parecer_resultado` varchar(5) DEFAULT NULL,
  `data_log` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int DEFAULT NULL,
  `estado_log` varchar(1) DEFAULT 'A',
  PRIMARY KEY (`log_parecer_quotacao_id`),
  CONSTRAINT `log_parecer_quotacao_id_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_parecer_quotacao`
--

LOCK TABLES `log_parecer_quotacao` WRITE;
/*!40000 ALTER TABLE `log_parecer_quotacao` DISABLE KEYS */;
INSERT INTO `log_parecer_quotacao` VALUES (1,9,'obras','Gabriela','123',9000,'parecer','2021-05-07 00:00:00','Aposta segura','OK','2021-05-06 23:00:00',0,'A'),(2,9,'obras','Gabriela','123',9000,'parecer','2021-05-14 00:00:00','Aposta segura','OK','2021-05-13 23:00:00',0,'A'),(3,9,'obras','Gabriela','123',9000,'parecer','2021-05-14 00:00:00','Aposta segura','OK','2021-05-13 23:00:00',0,'A'),(4,27,'Prod5','Joana Francisca','0',4500,'parecer','2021-05-14 00:00:00','','NOK','2021-05-13 23:00:00',0,'A'),(5,27,'Prod5','Joana Francisca','0',4500,'parecer','2021-05-14 00:00:00','','NOK','2021-05-13 23:00:00',0,'A'),(6,33,'Prod5','Joana Francisca','0',4000,'parecer','2021-05-14 00:00:00','','NOK','2021-05-13 23:00:00',0,'A'),(7,27,'Prod5','Joana Francisca','0',4500,'parecer','2021-05-14 00:00:00','','NOK','2021-05-13 23:00:00',0,'A'),(8,27,'Prod5','Joana Francisca','0',4500,'parecer','2021-05-14 00:00:00','','NOK','2021-05-13 23:00:00',0,'A'),(9,33,'Prod5','Joana Francisca','0',4000,'parecer','2021-05-14 00:00:00','','NOK','2021-05-13 23:00:00',0,'A'),(10,33,'Prod5','Joana Francisca','0',4000,'parecer','2021-05-14 00:00:00','','NOK','2021-05-13 23:00:00',0,'A'),(11,33,'Prod5','Joana Francisca','0',4000,'parecer','2021-05-14 00:00:00','','NOK','2021-05-13 23:00:00',0,'A'),(12,33,'Prod5','Joana Francisca','0',4000,'parecer','2021-05-14 00:00:00','','NOK','2021-05-13 23:00:00',0,'A'),(13,33,'Prod5','Joana Francisca','0',4000,'parecer','2021-05-14 00:00:00','','NOK','2021-05-13 23:00:00',0,'A'),(14,36,'Prod5','Joana Francisca','12124124',4000,'parecer','2021-05-15 00:00:00','','NOK','2021-05-14 23:00:00',0,'A'),(15,36,'Prod5','Joana Francisca','12124124',4000,'parecer','2021-05-15 00:00:00','','NOK','2021-05-14 23:00:00',0,'A'),(16,36,'Prod5','Joana Francisca','12124124',4000,'parecer','2021-05-15 00:00:00','','NOK','2021-05-14 23:00:00',0,'A'),(17,37,'Prod5','Joana Francisca','12124124',4000,'parecer','2021-05-15 00:00:00','','NOK','2021-05-14 23:00:00',0,'A'),(18,37,'Prod5','Joana Francisca','12124124',4000,'parecer','2021-05-15 00:00:00','','NOK','2021-05-14 23:00:00',0,'A'),(19,37,'Prod5','Joana Francisca','12124124',4000,'parecer','2021-05-15 00:00:00','','NOK','2021-05-14 23:00:00',0,'A'),(20,38,'Prod5','Joana Francisca','12124124',4500,'parecer','2021-05-15 00:00:00','','NOK','2021-05-14 23:00:00',0,'A'),(21,37,'Prod5','Joana Francisca','12124124',4000,'parecer','2021-05-15 00:00:00','','NOK','2021-05-14 23:00:00',0,'A'),(22,38,'Prod5','Joana Francisca','12124124',4500,'parecer','2021-05-15 00:00:00','','NOK','2021-05-14 23:00:00',0,'A'),(23,37,'Prod5','Joana Francisca','12124124',4000,'parecer','2021-05-15 00:00:00','','NOK','2021-05-14 23:00:00',0,'A'),(24,37,'Prod5','Joana Francisca','12124124',4000,'parecer','2021-05-15 00:00:00','','NOK','2021-05-14 23:00:00',0,'A'),(25,38,'Prod5','Joana Francisca','12124124',4500,'parecer','2021-05-15 00:00:00','','NOK','2021-05-14 23:00:00',0,'A'),(26,37,'Prod5','Joana Francisca','12124124',4000,'parecer','2021-05-15 00:00:00','','NOK','2021-05-14 23:00:00',0,'A'),(27,37,'Prod5','Joana Francisca','12124124',4000,'parecer','2021-05-15 00:00:00','','NOK','2021-05-14 23:00:00',0,'A'),(28,38,'Prod5','Joana Francisca','12124124',4500,'parecer','2021-05-15 00:00:00','','NOK','2021-05-14 23:00:00',0,'A'),(29,44,'Prod5','Antonio Costa','11245411',4500,'parecer','2021-05-16 00:00:00','','NOK','2021-05-15 23:00:00',0,'A'),(30,45,'Prod5','Ric Fazeres','1234154235',2000,'parecer','2021-05-16 00:00:00','','NOK','2021-05-15 23:00:00',0,'A'),(31,46,'Prod5','Ric Fazeres','1234154235',4500,'parecer','2021-05-16 00:00:00','','NOK','2021-05-15 23:00:00',0,'A');
/*!40000 ALTER TABLE `log_parecer_quotacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oxdiscussioncomments`
--

DROP TABLE IF EXISTS `oxdiscussioncomments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oxdiscussioncomments` (
  `id` varchar(32) NOT NULL,
  `comment` longtext,
  `discussionId` varchar(32) DEFAULT NULL,
  `time` datetime(6) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDXbhlx4vunn24ym1tbrlgq8g30m` (`discussionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oxdiscussioncomments`
--

LOCK TABLES `oxdiscussioncomments` WRITE;
/*!40000 ALTER TABLE `oxdiscussioncomments` DISABLE KEYS */;
/*!40000 ALTER TABLE `oxdiscussioncomments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pr_estado_produto`
--

DROP TABLE IF EXISTS `pr_estado_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pr_estado_produto` (
  `estado_produto_id` int NOT NULL AUTO_INCREMENT,
  `estado_produto` varchar(25) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `data_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int NOT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`estado_produto_id`),
  CONSTRAINT `pr_estadoproduto_chk_estadoproduto` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pr_estado_produto`
--

LOCK TABLES `pr_estado_produto` WRITE;
/*!40000 ALTER TABLE `pr_estado_produto` DISABLE KEYS */;
INSERT INTO `pr_estado_produto` VALUES (1,'Ativo','Produto ativo','2021-05-01 23:00:00',0,'A');
/*!40000 ALTER TABLE `pr_estado_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pr_finalidade`
--

DROP TABLE IF EXISTS `pr_finalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pr_finalidade` (
  `finalidade_id` int NOT NULL AUTO_INCREMENT,
  `finalidade` varchar(20) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `data_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int NOT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`finalidade_id`),
  CONSTRAINT `pr_finalidade_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pr_finalidade`
--

LOCK TABLES `pr_finalidade` WRITE;
/*!40000 ALTER TABLE `pr_finalidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `pr_finalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pr_instituicao_credito`
--

DROP TABLE IF EXISTS `pr_instituicao_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pr_instituicao_credito` (
  `instituicao_credito_id` int NOT NULL AUTO_INCREMENT,
  `instituicao_credito` varchar(15) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `morada` varchar(100) NOT NULL,
  `codigo_postal` varchar(10) NOT NULL,
  `nif` varchar(10) NOT NULL,
  `contacto_comercial` varchar(50) NOT NULL,
  `contacto_credito` varchar(50) NOT NULL,
  `contacto_it` varchar(50) NOT NULL,
  `protocolo_ref` varchar(30) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date DEFAULT NULL,
  `data_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int NOT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`instituicao_credito_id`),
  CONSTRAINT `pr_instituicaocredito_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pr_instituicao_credito`
--

LOCK TABLES `pr_instituicao_credito` WRITE;
/*!40000 ALTER TABLE `pr_instituicao_credito` DISABLE KEYS */;
INSERT INTO `pr_instituicao_credito` VALUES (1,'BES','Banco Espirito Santo','Rua 123 macaquinho do chines','3242 123','12414','213123124124','123131313112','124234324535','1213124234','2021-05-06','2027-05-22','2021-05-01 23:00:00',0,'A');
/*!40000 ALTER TABLE `pr_instituicao_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pr_produto`
--

DROP TABLE IF EXISTS `pr_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pr_produto` (
  `produto_id` int NOT NULL AUTO_INCREMENT,
  `produto` varchar(15) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `instituicao_credito_id` int NOT NULL,
  `tempo_decisao` int NOT NULL,
  `limite_maximo` decimal(9,2) NOT NULL,
  `limite_minimo` decimal(9,2) NOT NULL,
  `taxa_juro` decimal(5,2) NOT NULL,
  `taxa_imposto_contratacao` decimal(5,2) NOT NULL,
  `taxa_despesa_contratacao` decimal(5,2) NOT NULL,
  `taxa_imposto_cobranca` decimal(5,2) NOT NULL,
  `taxa_despesa_cobranca` decimal(5,2) NOT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date DEFAULT NULL,
  `estado_produto_id` int NOT NULL,
  `data_estado_produto` date DEFAULT NULL,
  `data_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int NOT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  `classeestadoproduto_estado_produto` varchar(15) DEFAULT NULL,
  `classeinstituicaocredito_instituicao_credito` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`produto_id`),
  KEY `instituicao_credito_id` (`instituicao_credito_id`),
  KEY `estado_produto_id` (`estado_produto_id`),
  CONSTRAINT `pr_produto_ibfk_1` FOREIGN KEY (`instituicao_credito_id`) REFERENCES `pr_instituicao_credito` (`instituicao_credito_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `pr_produto_ibfk_2` FOREIGN KEY (`estado_produto_id`) REFERENCES `pr_estado_produto` (`estado_produto_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `pr_produto_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pr_produto`
--

LOCK TABLES `pr_produto` WRITE;
/*!40000 ALTER TABLE `pr_produto` DISABLE KEYS */;
INSERT INTO `pr_produto` VALUES (1,'Prod5','Produto um ',1,5,4000.00,600.00,10.00,5.00,5.00,5.00,5.00,'2021-05-03','2022-05-05',1,'2021-05-02','2021-05-01 23:00:00',0,'A','Ativo','BES');
/*!40000 ALTER TABLE `pr_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pr_produto_finalidade`
--

DROP TABLE IF EXISTS `pr_produto_finalidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pr_produto_finalidade` (
  `produto_finalidade_id` int NOT NULL AUTO_INCREMENT,
  `produto_id` int NOT NULL,
  `finalidade_id` int NOT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `data_inicio` date NOT NULL,
  `data_fim` date DEFAULT NULL,
  `data_log` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int NOT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`produto_finalidade_id`),
  KEY `produto_id` (`produto_id`),
  KEY `finalidade_id` (`finalidade_id`),
  CONSTRAINT `pr_produto_finalidade_ibfk_1` FOREIGN KEY (`produto_id`) REFERENCES `pr_produto` (`produto_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `pr_produto_finalidade_ibfk_2` FOREIGN KEY (`finalidade_id`) REFERENCES `pr_finalidade` (`finalidade_id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `pr_produtofinalidade_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pr_produto_finalidade`
--

LOCK TABLES `pr_produto_finalidade` WRITE;
/*!40000 ALTER TABLE `pr_produto_finalidade` DISABLE KEYS */;
/*!40000 ALTER TABLE `pr_produto_finalidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pr_produto_objecto`
--

DROP TABLE IF EXISTS `pr_produto_objecto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pr_produto_objecto` (
  `produto_finalidade_id` int NOT NULL,
  `data_fim` date DEFAULT NULL,
  `data_inicio` date DEFAULT NULL,
  `data_log` date DEFAULT NULL,
  `descricao` varchar(50) DEFAULT NULL,
  `estado_log` varchar(1) DEFAULT NULL,
  `finalidade_id` int DEFAULT NULL,
  `produto_id` int DEFAULT NULL,
  `utilizador_log` int DEFAULT NULL,
  `classefinalidade_finalidade` varchar(15) DEFAULT NULL,
  `classeproduto_produto` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`produto_finalidade_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pr_produto_objecto`
--

LOCK TABLES `pr_produto_objecto` WRITE;
/*!40000 ALTER TABLE `pr_produto_objecto` DISABLE KEYS */;
/*!40000 ALTER TABLE `pr_produto_objecto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `si_estado_simulacao`
--

DROP TABLE IF EXISTS `si_estado_simulacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `si_estado_simulacao` (
  `ref_estado` int NOT NULL AUTO_INCREMENT,
  `estado` varchar(15) NOT NULL,
  `descricao` varchar(50) NOT NULL,
  `data_alteracao_estado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int NOT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`ref_estado`),
  CONSTRAINT `si_estadosimulacao_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `si_estado_simulacao`
--

LOCK TABLES `si_estado_simulacao` WRITE;
/*!40000 ALTER TABLE `si_estado_simulacao` DISABLE KEYS */;
INSERT INTO `si_estado_simulacao` VALUES (1,'Registado','Simulação no estado Registado','2021-05-11 23:00:00',0,'A'),(2,'Sem Efeito','Simulação no estado Sem Efeito','2021-05-11 23:00:00',0,'A'),(3,'Aprovado','Simulação no estado Aprovado','2021-05-11 23:00:00',0,'A'),(4,'Sem Interesse','Simulação no estado Sem Interesse','2021-05-11 23:00:00',0,'A'),(5,'Não Aprovado','Simulação no estado Não Aprovado','2021-05-11 23:00:00',0,'A'),(6,'Para Aprovação','Simulação no estado Para Aprovação','2021-05-11 23:00:00',0,'A');
/*!40000 ALTER TABLE `si_estado_simulacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `si_simulacao_credito`
--

DROP TABLE IF EXISTS `si_simulacao_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `si_simulacao_credito` (
  `simulacao_id` int NOT NULL AUTO_INCREMENT,
  `simulacao` varchar(25) NOT NULL,
  `entidade_id` int NOT NULL,
  `produto_id` int NOT NULL,
  `ref_estado` int NOT NULL,
  `data_inicio` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `data_fim` date DEFAULT NULL,
  `data_avaliacao` date DEFAULT NULL,
  `total_solicitado` double NOT NULL,
  `total_possivel` double DEFAULT NULL,
  `duracao` int NOT NULL,
  `total_capital_contratado` double DEFAULT NULL,
  `total_despesa_contratada` double DEFAULT NULL,
  `total_impostos_contratado` double DEFAULT NULL,
  `total_juros_contratado` double DEFAULT NULL,
  `descricao_objecto_credito` varchar(50) NOT NULL,
  `scoring` int DEFAULT NULL,
  `data_alteracao_estado` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilizador_log` int NOT NULL,
  `parcer_IC` varchar(1) DEFAULT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  `parecer_IC` varchar(1) DEFAULT NULL,
  `classeproduto_produto` varchar(15) DEFAULT NULL,
  `estado` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`simulacao_id`),
  KEY `entidade_id` (`entidade_id`),
  KEY `produto_id` (`produto_id`),
  KEY `ref_estado` (`ref_estado`),
  CONSTRAINT `si_simulacao_credito_ibfk_1` FOREIGN KEY (`entidade_id`) REFERENCES `en_entidade` (`entidade_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `si_simulacao_credito_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `pr_produto` (`produto_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `si_simulacao_credito_ibfk_3` FOREIGN KEY (`ref_estado`) REFERENCES `si_estado_simulacao` (`ref_estado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `si_simulacaocredito_chk_estadolog` CHECK (((`estado_log` = _utf8mb4'A') or (`estado_log` = _utf8mb4'I')))
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `si_simulacao_credito`
--

LOCK TABLES `si_simulacao_credito` WRITE;
/*!40000 ALTER TABLE `si_simulacao_credito` DISABLE KEYS */;
INSERT INTO `si_simulacao_credito` VALUES (42,'qq',1,1,1,'2021-05-15 23:00:00',NULL,NULL,3000,0,10,0,0,0,0,'Reconstrução de uma casa',0,'2021-05-15 23:00:00',1,NULL,'A','','Prod5','Registado'),(44,'tt',2,1,4,'2021-05-15 23:00:00',NULL,'2021-05-16',4500,4000,12,4000,20000,20000,480000,'Férias nas caraibas',0,'2021-05-15 23:00:00',2,NULL,'A','N','Prod5','Sem Interesse'),(45,'oo',3,1,5,'2021-05-15 23:00:00','2021-05-16','2021-05-16',2000,2000,12,2000,10000,10000,240000,'Comprar um ferrari',3,'2021-05-15 23:00:00',1,NULL,'A','N','Prod5','Não Aprovado'),(48,'ttt',3,1,3,'2021-05-15 23:00:00',NULL,'2021-05-16',4000,4000,12,4000,20000,20000,480000,'Férias no dubai',0,'2021-05-15 23:00:00',1,NULL,'A','Y','Prod5','Aprovado');
/*!40000 ALTER TABLE `si_simulacao_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `si_ware_house`
--

DROP TABLE IF EXISTS `si_ware_house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `si_ware_house` (
  `ware_id` int NOT NULL AUTO_INCREMENT,
  `simulacao_id` int NOT NULL,
  `simulacao` varchar(25) NOT NULL,
  `entidade_id` int NOT NULL,
  `produto_id` int NOT NULL,
  `ref_estado` int NOT NULL,
  `data_inicio` timestamp NULL DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `data_avaliacao` date DEFAULT NULL,
  `total_solicitado` double NOT NULL,
  `total_possivel` double DEFAULT NULL,
  `duracao` int NOT NULL,
  `total_capital_contratado` double DEFAULT NULL,
  `total_despesa_contratada` double DEFAULT NULL,
  `total_impostos_contratado` double DEFAULT NULL,
  `total_juros_contratado` double DEFAULT NULL,
  `descricao_objecto_credito` varchar(50) NOT NULL,
  `scoring` int DEFAULT NULL,
  `data_alteracao_estado` timestamp NOT NULL,
  `utilizador_log` int NOT NULL,
  `parcer_IC` varchar(1) DEFAULT NULL,
  `estado_log` varchar(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`ware_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `si_ware_house`
--

LOCK TABLES `si_ware_house` WRITE;
/*!40000 ALTER TABLE `si_ware_house` DISABLE KEYS */;
INSERT INTO `si_ware_house` VALUES (1,33,'h',1,1,2,'2021-05-13 23:00:00',NULL,NULL,4000,4000,12,4000,20000,20000,480000,'Reconstrução de uma casa',0,'2021-05-13 23:00:00',1,NULL,'A'),(2,32,'n',3,1,5,'2021-05-13 23:00:00','2021-05-14','2021-05-14',2000,2000,12,2000,10000,10000,240000,'Reconstrução de uma casa',3,'2021-05-13 23:00:00',1,NULL,'A'),(4,29,'g',3,1,2,'2021-05-13 23:00:00','2021-05-15',NULL,4500,0,12,0,0,0,0,'Férias no dubai',0,'2021-05-14 23:00:00',3,NULL,'A'),(5,33,'h',1,1,2,'2021-05-13 23:00:00',NULL,NULL,4000,4000,12,4000,20000,20000,480000,'Reconstrução de uma casa',0,'2021-05-13 23:00:00',1,NULL,'A'),(6,32,'n',3,1,5,'2021-05-13 23:00:00','2021-05-14','2021-05-14',2000,2000,12,2000,10000,10000,240000,'Reconstrução de uma casa',3,'2021-05-13 23:00:00',1,NULL,'A');
/*!40000 ALTER TABLE `si_ware_house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yourfirstentity`
--

DROP TABLE IF EXISTS `yourfirstentity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `yourfirstentity` (
  `id` varchar(32) NOT NULL,
  `amount` decimal(19,2) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yourfirstentity`
--

LOCK TABLES `yourfirstentity` WRITE;
/*!40000 ALTER TABLE `yourfirstentity` DISABLE KEYS */;
INSERT INTO `yourfirstentity` VALUES ('9a770099796a3e1601796a3ea7b40000',10.00,'2021-05-05','Rodrigo');
/*!40000 ALTER TABLE `yourfirstentity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'youcredit'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `Evento_ActualizarEstadoSimulacao` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `Evento_ActualizarEstadoSimulacao` ON SCHEDULE EVERY 1 DAY STARTS '2021-05-11 09:48:37' ON COMPLETION NOT PRESERVE ENABLE DO CALL AlteracaoEstado(5,1,2) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `Evento_ActualizarEstadoSimulacao2` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `Evento_ActualizarEstadoSimulacao2` ON SCHEDULE EVERY 1 DAY STARTS '2021-05-11 09:48:37' ON COMPLETION NOT PRESERVE ENABLE DO CALL AlteracaoEstado(10,3,4) */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `Evento_TransferirWareHouse` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `Evento_TransferirWareHouse` ON SCHEDULE EVERY 1 DAY STARTS '2021-05-11 09:48:37' ON COMPLETION NOT PRESERVE ENABLE DO CALL transferirWareHouse() */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'youcredit'
--
/*!50003 DROP PROCEDURE IF EXISTS `AlteracaoEstado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `AlteracaoEstado`(IN tempo INTEGER , IN estado_origem INTEGER , IN estado_final INTEGER)
BEGIN
	DECLARE fim_cursor INTEGER DEFAULT 0;
	DECLARE estado VARCHAR(1);
	DECLARE qtd_registos INTEGER;
    DECLARE Ysimulacao_id INTEGER;

	DECLARE CursorSimulacao CURSOR FOR
		SELECT simulacao_id FROM si_simulacao_credito
		WHERE datediff(curdate(),data_alteracao_estado) > tempo
		AND ref_estado = estado_origem;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET fim_cursor =1;
    
    OPEN CursorSimulacao;
    SET qtd_registos=0;
    AlterarEstado: LOOP
		FETCH CursorSimulacao INTO Ysimulacao_id;
        IF fim_cursor=1 THEN
			LEAVE AlterarEstado;
		END IF;
        UPDATE si_simulacao_credito
        SET ref_estado = estado_final, data_alteracao_estado = curdate(), data_fim = curdate()
        where simulacao_id = Ysimulacao_id;
        SET qtd_registos =qtd_registos+1;
	END LOOP AlterarEstado;
    CLOSE CursorSimulacao;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `transferirWareHouse` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `transferirWareHouse`()
BEGIN
    
    INSERT INTO si_ware_house (simulacao_id,simulacao,entidade_id,produto_id,ref_estado,data_inicio,data_fim,data_avaliacao,total_solicitado,total_possivel,
    duracao, total_capital_contratado,total_despesa_contratada,total_impostos_contratado,total_juros_contratado,descricao_objecto_credito,scoring,
    data_alteracao_estado,utilizador_log,parcer_IC,estado_log)
	SELECT simulacao_id,simulacao,entidade_id,produto_id,ref_estado,data_inicio,data_fim,data_avaliacao,total_solicitado,total_possivel,
    duracao, total_capital_contratado,total_despesa_contratada,total_impostos_contratado,total_juros_contratado,descricao_objecto_credito,scoring,
    data_alteracao_estado,utilizador_log,parcer_IC,estado_log
	FROM si_simulacao_credito s  
    WHERE datediff(curdate(),s.data_alteracao_estado) > 30
		AND (s.ref_estado = 2 OR s.ref_estado = 4 OR s.ref_estado = 5);
        
	DELETE FROM si_simulacao_credito
    WHERE datediff(curdate(),data_alteracao_estado) > 30 AND (ref_estado = 2 OR ref_estado = 4 OR ref_estado = 5);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-16 16:12:17
