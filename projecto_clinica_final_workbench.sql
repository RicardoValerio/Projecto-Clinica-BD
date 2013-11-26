CREATE DATABASE  IF NOT EXISTS `projecto_clinica` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `projecto_clinica`;
-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: projecto_clinica
-- ------------------------------------------------------
-- Server version	5.5.32

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
-- Table structure for table `acordos`
--

DROP TABLE IF EXISTS `acordos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acordos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `datetime_acordo` datetime NOT NULL,
  `instituicao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foto_instituicao` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`datetime_acordo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acordos`
--

LOCK TABLES `acordos` WRITE;
/*!40000 ALTER TABLE `acordos` DISABLE KEYS */;
INSERT INTO `acordos` VALUES (1,'2013-10-26 23:36:59','apache','apache.png'),(2,'2013-10-26 23:37:28','android','android.png'),(3,'2013-10-26 23:37:57','archlinux','archlinux.png'),(4,'2013-10-26 23:38:08','aurasma','aurasma.jpg'),(5,'2013-10-26 23:38:21','cakephp','cakephp.png'),(6,'2013-10-26 23:38:35','firefox','firefox.png'),(7,'2013-10-26 23:38:48','github','github.png'),(8,'2013-10-26 23:38:59','gnome','gnome.png'),(9,'2013-10-26 23:39:09','gnu','gnu.jpg'),(10,'2013-10-26 23:39:22','koumbit','koumbit.png'),(11,'2013-10-26 23:39:31','linux mint','linuxmint.jpg'),(12,'2013-10-26 23:39:44','obc','logoobc.png'),(13,'2013-10-26 23:39:53','mysql','mysql.png'),(14,'2013-10-26 23:40:00','python','python.png'),(15,'2013-10-26 23:41:10','tor','tor.png'),(16,'2013-10-27 00:16:56','ubuntu','ubuntu.png');
/*!40000 ALTER TABLE `acordos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administradores`
--

DROP TABLE IF EXISTS `administradores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `administradores` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `datetime_ultimo_login` datetime NOT NULL,
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradores`
--

LOCK TABLES `administradores` WRITE;
/*!40000 ALTER TABLE `administradores` DISABLE KEYS */;
INSERT INTO `administradores` VALUES (1,'admin','pass','2013-11-26 17:32:32'),(2,'super user','secret','2013-11-12 20:31:39');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas_com_marcacao_confirmada_a_realizar`
--

DROP TABLE IF EXISTS `consultas_com_marcacao_confirmada_a_realizar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultas_com_marcacao_confirmada_a_realizar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `datetime_confirmacao` datetime NOT NULL,
  `data_consulta` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `hora_consulta` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `medicos_id` int(10) unsigned NOT NULL,
  `utentes_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `especialidades_id` int(10) unsigned NOT NULL,
  `horarios_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_consultas_com_marcacao_confirmada_a_realizar_medicos1_idx` (`medicos_id`),
  KEY `fk_consultas_com_marcacao_confirmada_a_realizar_utentes1_idx` (`utentes_email`),
  KEY `fk_consultas_com_marcacao_confirmada_a_realizar_especialida_idx` (`especialidades_id`),
  KEY `fk_consultas_com_marcacao_confirmada_a_realizar_horarios1_idx` (`horarios_id`),
  CONSTRAINT `fk_consultas_com_marcacao_confirmada_a_realizar_especialidades1` FOREIGN KEY (`especialidades_id`) REFERENCES `especialidades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_consultas_com_marcacao_confirmada_a_realizar_horarios1` FOREIGN KEY (`horarios_id`) REFERENCES `horarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_consultas_com_marcacao_confirmada_a_realizar_medicos1` FOREIGN KEY (`medicos_id`) REFERENCES `medicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_consultas_com_marcacao_confirmada_a_realizar_utentes1` FOREIGN KEY (`utentes_email`) REFERENCES `utentes` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas_com_marcacao_confirmada_a_realizar`
--

LOCK TABLES `consultas_com_marcacao_confirmada_a_realizar` WRITE;
/*!40000 ALTER TABLE `consultas_com_marcacao_confirmada_a_realizar` DISABLE KEYS */;
INSERT INTO `consultas_com_marcacao_confirmada_a_realizar` VALUES (5,'2013-11-15 21:09:24','11/25/2033','14:30',3,'pedro@fonseca.com',4,1),(6,'2013-11-15 21:00:01','11/20/2013','14:30',22,'pedrogil@fonseca.com',9,2);
/*!40000 ALTER TABLE `consultas_com_marcacao_confirmada_a_realizar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas_realizadas`
--

DROP TABLE IF EXISTS `consultas_realizadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultas_realizadas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `datetime_consulta_realizada` datetime NOT NULL,
  `valor_consulta` decimal(9,2) NOT NULL,
  `diagnostico` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `prescricao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `medicos_id` int(10) unsigned NOT NULL,
  `utentes_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_consultas_realizadas_medicos1_idx` (`medicos_id`),
  KEY `fk_consultas_realizadas_utentes1_idx` (`utentes_email`),
  CONSTRAINT `fk_consultas_realizadas_medicos1` FOREIGN KEY (`medicos_id`) REFERENCES `medicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_consultas_realizadas_utentes1` FOREIGN KEY (`utentes_email`) REFERENCES `utentes` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas_realizadas`
--

LOCK TABLES `consultas_realizadas` WRITE;
/*!40000 ALTER TABLE `consultas_realizadas` DISABLE KEYS */;
INSERT INTO `consultas_realizadas` VALUES (9,'2013-11-17 22:05:43',40.00,'Ouve mal Mesmo!!!','Muitos Cotonetes Mesmo!!!',15,'pedro@fonseca.com');
/*!40000 ALTER TABLE `consultas_realizadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `especialidades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `especialidade` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao_especialidade` text COLLATE utf8_unicode_ci NOT NULL,
  `preco_consulta` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--

LOCK TABLES `especialidades` WRITE;
/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;
INSERT INTO `especialidades` VALUES (1,'Medicina Dentária','Medicina dentária é a área da saúde humana que estuda e trata o sistema estomatognático - compreende a face, pescoço e cavidade bucal, abrangendo ossos, musculatura mastigatória, articulações, dentes e tecidos.\r\n\r\nO significado de saúde oral, é a ausência de doença estomatológica, bem como a correcta função, estabilidade e até mesmo estética de todo o sistema estomatognático. É hoje certo e sabido que a saúde oral tem sérias implicações na saúde humana, sendo as duas indissociáveis.',30.00),(2,'Ginecologia','A ginecologia literalmente significa \"a ciência da mulher\", mas na medicina é a especialidade que trata de doenças do sistema reprodutor feminino, útero, vagina e ovários.',30.00),(3,'Otorrino','A Otorrinolaringologia é considerada uma das mais completas especialidades médicas do mundo, com características clínicas e cirúrgicas. O seu campo de actuação envolve as doenças do ouvido, do nariz e seios paranasais, faringe ,laringe e cabeça e pescoço.',30.00),(4,'Pediatria','A pediatria é a especialidade médica dedicada à assistência à criança e ao adolescente, nos seus diversos aspectos, sejam eles preventivos (Puericultura) ou curativos. (principalmente crianças).\r\n\r\nAspectos preventivos envolvem ações como aleitamento materno, imunizações (vacinas), prevenção de acidentes, além do acompanhamento e das orientações necessárias a um crescimento e desenvolvimento saudáveis (puericultura).\r\n\r\nOs curativos correspondem aos diversos procedimentos e tratamentos das mais diversas patologias exclusivas ou não da criança e adolescente.',40.00),(5,'Dermatologia','Dermatologia é a especialidade médica que se ocupa do diagnóstico e tratamento clínico-cirúrgico das doenças que acometem o maior órgão do corpo humano – a pele, tendo em média 2 metros quadrados de área em um indivíduo adulto.\r\n\r\nA especialidade engloba ainda as doenças que acometem os anexos cutâneos: cabelos e unhas, bem como as mucosas (ex: boca e genitais). Outra denominação é a dermatovenerologia já que a especialidade tem importante actuação no contexto das doenças sexualmente transmissíveis (doenças venéreas).\r\n\r\nA Dermatologia actua em todos os processos fisopatológicos que envolvem a pele: desde simples infecções, reações auto-imunes e inflamatórias, e tumores. A hansenologia é outra importante área de actuação da dermatologia. Por lidar com a pele, a dermatologia é a especialidade médica mais indicada para actuação em cosmiatria.',40.00),(6,'Alergologia','Alergologia (ou Imunoalergologia) é a especialidade da Medicina que visa o diagnóstico e o tratamento das doenças alérgicas, que são as respostas exageradas do sistema imunológico a uma substância estranha ao organismo, uma hipersensibilidade imunológica a um estímulo externo específico. Os portadores de alergias são chamados de “atópicos” ou mais popularmente de “alérgicos”.',40.00),(7,'Medicina Geral','Medicina Interna ou Clínica geral, é a especialidade médica que trata de pacientes adultos, actuando principalmente em ambiente hospitalar. Inclui o estudo das doenças de adultos, não cirúrgicas, não obstétricas e não ginecológicas, sendo a especialidade médica a partir da qual se diferenciaram todas as outras como Cardiologia e Pneumologia.',40.00),(9,'Acunpunctura','A Acupunctura é um ramo da Medicina Tradicional Chinesa e um método de tratamento considerado complementar de acordo com a nova terminologia da OMS - Organização Mundial da Saúde.\r\n\r\nSob a orientação do Dr. Rui Chico, esta especialidade milenar consiste na aplicação de agulhas, em pontos definidos do corpo, chamados de \"Pontos de Acupunctura\" ou \"Acupontos\", para obter efeito terapêutico em diversas condições.\r\n\r\nOs pontos e meridianos também podem ser estimulados por outros tipos de técnicas. Na verdade, os pontos de Acupunctura podem ser estimulados por agulhas, dedos (acupressão), stiper (do inglês Stimulation and Permanency - Estimulação Permanente), ventosa ou pelo aquecimento promovido por moxa ou seja longo tempo de aplicação do fogo, um bastão de artemísia em brasa, que é aproximado da pele para aquecer o ponto de acupuntura, ou o método de estimulação por laser.',50.00),(10,'TuiNa','Tui-Ná ou Tuina são os nomes pelo qual é conhecida esta massagem terapêutica chinesa.\r\nAs manipulações são usadas para estimular os pontos ou outras partes da superfície do corpo, para corrigir o desequilibrio fisiológico do mesmo e alcançar efeitos curativos. É uma parte muito importante da MTC. Na China antiga, a terapia era classificada em: medicina interna e medicina externa; o Tuiná está incluído na primeira.\r\n\r\nO Tuina pode ser usado para tratar várias disfunções, entre as quais lesões dos tecidos moles, neurologia, os cinco órgãos dos sentidos, pediatria, etc. É especialmente satisfatório para pacientes infantis e idosos. No presente, entretanto, o Tuiná chinês está dividido em vários ramos, tais como: adulto, infantil, ortopedia e traumatologia, cosmetologia, prevenção da saúde, reabilitação, medicina desportiva e assim por diante.\r\n\r\nO Tuina Adulto é tradicionalmente usado para tratar diversos problemas de saúde, como: espondilopatia cervical, estiramento lombar, prolapso do disco intervertebral lombar, estiramento lombar agudo, artrite reumatóide, hipertensão e sequelas da apoplexia.',50.00),(12,'Podologia','A Podologia é a disciplina que se dedica ao estudo dos pés do ponto de vista da sua anatomia e patologia. Está integrada noutras disciplinas, como a cirurgia, a ortopedia, a fisioterapia e a dermatologia entre outras.',35.00),(13,'Nutrição','A consulta de nutrição abrange inúmeras áreas de intervenção, permitindo aplicar a dietoterapia em todas as patologias que exijam cuidados nutricionais e dietéticos adaptados a cada situação específica, contribuindo para a saúde e bem-estar do indivíduo.',45.00),(14,'Neurocirurgia','Neurocirurgia é a especialidade que se ocupa do tratamento de do e (como, doenças vasculares, degenerativas, traumas cranio-encefálicos e raqui-medulares passíveis de abordagem. Recentemente, também passou a tratar da substituição de órgãos sensoriais (olho e ouvido interno) disfuncionais por dispositivos artificiais.',55.00),(15,'Terapia da Fala','A Terapia da fala, é a ciência que tem como objecto de estudo a comunicação humana. Não apenas os distúrbios da linguagem são do seu interesse, como também o modo de comunicação sádio e eficaz.',35.00);
/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horarios`
--

DROP TABLE IF EXISTS `horarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `horarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao_horario` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horarios`
--

LOCK TABLES `horarios` WRITE;
/*!40000 ALTER TABLE `horarios` DISABLE KEYS */;
INSERT INTO `horarios` VALUES (1,'Manhã'),(2,'Tarde');
/*!40000 ALTER TABLE `horarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `primeiro_nome` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ultimo_nome` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contacto_tel` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `foto` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `especialidades_id` int(10) unsigned NOT NULL,
  `horarios_id` int(11) NOT NULL,
  `salario_mensal` decimal(7,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_medicos_especialidades1_idx` (`especialidades_id`),
  KEY `fk_medicos_horarios1_idx` (`horarios_id`),
  CONSTRAINT `fk_medicos_especialidades1` FOREIGN KEY (`especialidades_id`) REFERENCES `especialidades` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_medicos_horarios1` FOREIGN KEY (`horarios_id`) REFERENCES `horarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
INSERT INTO `medicos` VALUES (1,'Carlos','Ribeiro','carlos@ribeiro.com','917866545','android.png',3,2,890.00),(2,'Filipe','Sousa','filipe@sousa.com','965765676','android.png',4,1,890.00),(3,'José','Fonseca','jose@fonseca','932653768','android.png',1,1,1110.00),(4,'Vitor','Pereira','vitor@pereira','912345625','android.png',2,2,745.00),(5,'Pedro','Pinto','pedro@pinto','912344556','android.png',1,1,987.00),(6,'Mariana','Monteiro','mariana@monteiro.com','914562765','android.png',2,2,1230.00),(7,'Judite','Sousa','judite@sousa.com','934526516','android.png',2,1,987.00),(8,'Cecília','Pimentel','cecilia9@pimentel.com','912344321','android.png',1,2,2490.00),(9,'Luís','Serrão','luis@serrao.com','962453454','android.png',1,2,1000.00),(10,'Olga','Dias','olga@dias.com','923212345','android.png',3,1,470.00),(11,'Catarina','Vasconcelos','catarina@vasconcelos','962451546','android.png',4,1,876.00),(12,'Sandra','Rocha','sandra@rocha.com','921187178','android.png',4,2,1900.00),(13,'José','Ribeiro','jose@ribeiro.com','912454489','android.png',3,2,2060.00),(14,'Hélder','Marques','helder@marques.com','918575785','android.png',4,2,796.00),(15,'Vasco','Rebelo','vasco@rebelo.com','964315747','android.png',5,2,1946.00),(16,'Nuno','Correia','nuno@correia.com','932542547','android.png',3,1,1972.00),(17,'Manuel','Santos','manuel@santos.com','962567276','android.png',6,1,976.00),(18,'Alberto','Gameiro','alberto@gameiro.com','932677678','android.png',2,1,679.00),(20,'Joaquim','Ruivo','joaquim@ruivo.com','912875287','android.png',5,1,981.00),(21,'Sara','Tavares','sara@tavares.com','935425479','android.png',5,1,982.00),(22,'Maria','Matos','maria@matos.com','912764647','android.png',5,2,1000.00),(23,'Isabel','Pinto','isabel@pinto.com','932654165','android.png',6,1,957.00),(24,'Aldina','Almeida','aldina@almeida.com','912657578','android.png',6,2,896.00),(25,'Sílvia','Neves','silvia@neves.com','968758758','android.png',6,2,1089.00),(26,'José','Serra','jose@serra.com','917858789','android.png',7,1,912.00),(27,'Júlio','Neves','julio@neves.com','932677878','android.png',7,2,1062.00),(28,'Francisca','Saramago','francisca@saramago.com','918758758','android.png',7,2,1908.00),(29,'Maria','Celeste','maria@celeste.com','932786876','android.png',7,1,908.00),(30,'Eugénia','Barradas','eugenia@barradas.com','919698999','android.png',9,1,789.00),(31,'Maria','Melo','maria@melo.com','932089070','android.png',9,1,1008.00),(32,'António','Contente','antonio@contente.com','916542858','android.png',9,2,1934.00),(33,'Jorge','Ferrão','jorge@ferrao.com','923767868','android.png',9,2,1023.00),(34,'Carlos','Gonçalves','carlos@goncalves.com','968758758','android.png',10,1,1029.00),(35,'Carla','Silva','carla@silva.com','921767969','android.png',10,2,987.00),(36,'Salete','Nobre','salete@nobre.com','968587588','android.png',10,1,950.00),(37,'Isabel','Fonseca','isabel@fonseca.com','936752858','android.png',10,2,945.00),(38,'João','Figueiredo','joao@figueiredo.com','918585758','android.png',12,1,879.00),(39,'Artur','Aires','artur@aires.com','936542564','android.png',12,2,879.00),(40,'Fernando','Machado','fernando@machado.com','927868768','android.png',12,1,1092.00),(41,'Manuela','Moraguedes','manuela@moraguedes.com','918788578','android.png',12,2,1450.00),(42,'Frederico','Figueiredo','frederico@figueiredo.com','923868788','android.png',13,1,1200.00),(43,'Joana','Sintra','joana@sintra.com','967576474','android.png',13,2,978.00),(44,'Ricardo','Feijoeiro','ricardo@feijoeiro.com','918658758','android.png',13,1,917.00),(45,'Jacinto','Nunes','jaciento@nunes.com','926758768','android.png',13,2,670.00),(46,'Herman','Sousa','herman@sousa.com','912763786','android.png',14,1,1809.00),(47,'Sara','Varela','sara@varela.com','974747646','android.png',14,2,2050.00),(48,'Diogo','Mendes','diogo@mendes.com','918658758','android.png',14,1,987.00),(49,'Daniela','Pereira','daniela@pereira.com','932796969','android.png',15,1,1972.00),(50,'Verónica','Pereira','veronica@pereira.com','916776577','android.png',15,2,1000.00),(51,'Luísa','Almeida','luisa@almeida.com','965657577','android.png',15,1,987.00),(52,'Carla','Dias','carla@dias.com','918587875','android.png',15,2,879.00),(53,'Paulo','Bento','paulinho@bento.com','923452617','android.png',14,2,971.00);
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos_administracao_de_consultas`
--

DROP TABLE IF EXISTS `medicos_administracao_de_consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medicos_administracao_de_consultas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `datetime_ultimo_login` datetime NOT NULL,
  `medicos_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`,`username`),
  KEY `fk_medicos_administracao_de_consultas_medicos1_idx` (`medicos_id`),
  CONSTRAINT `fk_medicos_administracao_de_consultas_medicos1` FOREIGN KEY (`medicos_id`) REFERENCES `medicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos_administracao_de_consultas`
--

LOCK TABLES `medicos_administracao_de_consultas` WRITE;
/*!40000 ALTER TABLE `medicos_administracao_de_consultas` DISABLE KEYS */;
INSERT INTO `medicos_administracao_de_consultas` VALUES (1,'doctor','secret','2013-11-26 14:43:09',15),(2,'doctora','secret','2013-11-23 20:41:35',26),(3,'stupid','secretinho','0000-00-00 00:00:00',30);
/*!40000 ALTER TABLE `medicos_administracao_de_consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questoes_online`
--

DROP TABLE IF EXISTS `questoes_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questoes_online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mensagem` text COLLATE utf8_unicode_ci NOT NULL,
  `datetime_questao` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questoes_online`
--

LOCK TABLES `questoes_online` WRITE;
/*!40000 ALTER TABLE `questoes_online` DISABLE KEYS */;
INSERT INTO `questoes_online` VALUES (1,'Joana Caetano','juju@caetano.com','Qual é a minha dúvida?','2013-11-11 22:22:46'),(5,'Pedro Fonseca','pedro@fonseca.com','Portugal?','2013-11-15 22:02:57');
/*!40000 ALTER TABLE `questoes_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utentes`
--

DROP TABLE IF EXISTS `utentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utentes` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `primeiro_nome` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ultimo_nome` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `morada` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contacto_tel` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `datetime_registo` datetime NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utentes`
--

LOCK TABLES `utentes` WRITE;
/*!40000 ALTER TABLE `utentes` DISABLE KEYS */;
INSERT INTO `utentes` VALUES ('catarina18@gmail.com','Catarina','Neto','Avenida Masterchef Sofá 3ºlugar','932415161','2013-11-12 22:17:13'),('jose@TEST.com','José','Sousa','Rua do José Sousa','968986868','2013-11-23 21:27:58'),('maria45@hotmail.com','Maria','Sousa','Rua Particular à Estrada da Cruz nº 212','961234321','2013-11-12 22:13:47'),('migueltavares@gmail.com','Miguel','Tavares','Avenida João Garcia Nº 35 2º Esq','912387456','2013-11-12 22:15:34'),('pedro@fonseca.com','Pedro','Fonseca','Rua da Rua nº4 Loulé','917547647','2013-11-15 21:50:58'),('pedrogil@fonseca.com','Pedro','Fonseca','Rua da Rua nº4','917547647','2013-11-15 21:52:00'),('pedrogil@gmail.com','Pedro','Gil','Avenida da Boa Vida 3º Esq.','912342345','2013-11-12 22:11:35'),('rita@antunes.com','Rita','Antunes','Rua da Rainha das Ilhas das Cobras Nº13','967877887','2013-11-11 22:34:18'),('rui@santos.com','Rui','Santos','Rua da Santa Casa Nº234','912344556','2013-11-12 22:10:39'),('silvia_almeida@hotmail.com','Sílvia','Almeida','Rua da Dona Filomena 7ºC','932451621','2013-11-12 22:14:30'),('teste@teste.com','Joana TESTE','TESTE','RUA TESTE','913198739','2013-11-26 12:19:43');
/*!40000 ALTER TABLE `utentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vantagens`
--

DROP TABLE IF EXISTS `vantagens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vantagens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `conteudo_vantagem` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vantagens`
--

LOCK TABLES `vantagens` WRITE;
/*!40000 ALTER TABLE `vantagens` DISABLE KEYS */;
INSERT INTO `vantagens` VALUES (1,'Médicos e técnicos com currículo profissional','Não poderia existir qualidade de serviços se não existissem as mais-valias profissionais das pessoas que fazem parte de toda esta equipa. Assim, a Clínica Médica e Dentária do Vale do Tejo preocupou-se desde o seu início em juntar um conjunto de médicos e técnicos com provas dadas, que garantem a qualidade e o bem estar daqueles que depositam a sua confiança.'),(2,'Escolha dos melhores equipamentos e materiais','Porque existe o rigor técnico e humano na aplicação de qualquer serviço prestado, a Pseudo Clínica procura para a segurança dos seus pacientes, os melhores materiais do mercado, garantindo assim a qualidade de todos os seus actos médicos.'),(3,'Honestidade dos serviços','A principal vantagem da empresa.'),(4,'Marcação rápida de consultas','Em qualquer lugar através de email, ou por telefone, poderá marcar préviamente a sua consulta.'),(5,'Facilidades de pagamento','A Pseudo Clínica, desenvolveu soluções de pagamento até 12 meses sem qualquer juro ou entrada, e também parcerias com as maiores entidades bancárias do país no sentido de agelizar e oferecer um conjunto de vantagens exclusivas para os seus clientes.  \r\nContamos com excelentes condições para que possa concretizar o tratamento que tanto necessita, aliviando assim, de uma forma fácil o pagamento mensal dessa obrigação.');
/*!40000 ALTER TABLE `vantagens` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-26 17:36:58
