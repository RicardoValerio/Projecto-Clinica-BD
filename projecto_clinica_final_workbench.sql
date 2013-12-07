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
INSERT INTO `administradores` VALUES (1,'admin','pass','2013-12-07 00:13:07'),(2,'super','root','2013-11-12 20:31:39');
/*!40000 ALTER TABLE `administradores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas_marcadas`
--

DROP TABLE IF EXISTS `consultas_marcadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `consultas_marcadas` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `datetime_confirmacao` datetime NOT NULL,
  `data_consulta` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `hora_consulta` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `medicos_id` int(10) unsigned NOT NULL,
  `utentes_email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_consultas_com_marcacao_confirmada_a_realizar_medicos1_idx` (`medicos_id`),
  KEY `fk_consultas_com_marcacao_confirmada_a_realizar_utentes1_idx` (`utentes_email`),
  CONSTRAINT `fk_consultas_com_marcacao_confirmada_a_realizar_medicos1` FOREIGN KEY (`medicos_id`) REFERENCES `medicos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_consultas_com_marcacao_confirmada_a_realizar_utentes1` FOREIGN KEY (`utentes_email`) REFERENCES `utentes` (`email`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas_marcadas`
--

LOCK TABLES `consultas_marcadas` WRITE;
/*!40000 ALTER TABLE `consultas_marcadas` DISABLE KEYS */;
INSERT INTO `consultas_marcadas` VALUES (18,'2013-12-01 19:46:41','12/03/2013','14:30',1,'joseperpetuo@gmail.com'),(19,'2013-12-01 20:02:05','12/02/2013','18:30',4,'saraneves@gmail.com'),(20,'2013-12-01 20:04:04','12/03/2013','11:30',10,'ruiesteves@gmail.com'),(21,'2013-12-01 21:18:35','12/03/2013','11:30',16,'teresaguilherme@gmail.com'),(22,'2013-12-02 15:01:32','12/03/2013','09:30',3,'diogoribeiro@gmail.com'),(24,'2013-12-02 20:18:04','12/17/2013','17:30',32,'danielaoliveira@gmail.com'),(25,'2013-12-02 20:19:04','12/15/2013','18:30',39,'susanaarminda@gmail.com'),(26,'2013-12-02 20:20:03','12/10/2013','16:30',43,'hugosousa@gmail.com'),(27,'2013-12-02 20:20:48','12/10/2013','19:30',12,'filipeneves@gmail.com'),(28,'2013-12-02 20:21:45','12/10/2013','10:30',38,'pedrosilva@gmail.com'),(29,'2013-12-02 20:22:32','12/10/2013','11:00',17,'ivoalexandre@gmail.com'),(30,'2013-12-02 20:23:13','12/10/2013','11:00',23,'filipatavares@gmail.com'),(31,'2013-12-02 20:24:34','12/11/2013','11:00',17,'guilhermeontem@gmail.com'),(32,'2013-12-02 20:25:14','12/11/2013','11:00',23,'sofiacaramelo@gmail.com'),(33,'2013-12-02 21:32:49','12/11/2013','16:00',27,'juju@caetano.com'),(34,'2013-12-02 22:18:49','01/03/2014','09:30',3,'pedroeustaquio@gmail.com'),(35,'2013-12-05 11:26:17','12/17/2013','18:30',43,'margaridapinto@gmail.com'),(36,'2013-12-05 11:35:34','12/17/2013','13:00',38,'hugoboss@gmail.com'),(37,'2013-12-05 12:04:39','12/17/2013','16:00',4,'sarajacinta@gmail.com'),(38,'2013-12-06 09:22:11','12/28/2013','17:30',39,'soniaalpalhao@gmail.com'),(39,'2013-12-06 09:27:12','12/17/2013','15:30',33,'antoniovivalvi@gmail.com');
/*!40000 ALTER TABLE `consultas_marcadas` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas_realizadas`
--

LOCK TABLES `consultas_realizadas` WRITE;
/*!40000 ALTER TABLE `consultas_realizadas` DISABLE KEYS */;
INSERT INTO `consultas_realizadas` VALUES (1,'2013-12-02 14:58:19',30.00,'Cáries dentárias nos dentes molares.','Pasta de dentes Sensodyne.',3,'joseperpetuo@gmail.com');
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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos_administracao_de_consultas`
--

LOCK TABLES `medicos_administracao_de_consultas` WRITE;
/*!40000 ALTER TABLE `medicos_administracao_de_consultas` DISABLE KEYS */;
INSERT INTO `medicos_administracao_de_consultas` VALUES (1,'doctor_1','secret','2013-11-28 16:40:51',1),(2,'doctor_2','secret','2013-11-28 12:09:31',2),(3,'doctor_3','secret','2013-12-02 14:58:53',3),(4,'doctor_4','secret','2013-12-02 14:59:16',4),(5,'doctor_5','secret','2013-11-28 12:09:31',5),(6,'doctor_6','secret','2013-11-28 12:09:31',6),(7,'doctor_7','secret','2013-11-28 12:09:31',7),(8,'doctor_8','secret','2013-11-28 12:09:31',8),(9,'doctor_9','secret','2013-11-28 12:09:31',9),(10,'doctor_10','secret','2013-11-28 12:09:31',10),(11,'doctor_11','secret','2013-11-28 12:09:31',11),(12,'doctor_12','secret','2013-11-28 12:09:31',12),(13,'doctor_13','secret','2013-12-03 11:21:04',13),(14,'doctor_14','secret','2013-11-28 12:09:31',14),(15,'doctor_15','secret','2013-11-28 12:09:31',15),(16,'doctor_16','secret','2013-11-28 12:09:31',16),(17,'doctor_17','secret','2013-11-28 12:09:31',17),(18,'doctor_18','secret','2013-11-28 12:09:31',18),(19,'doctor_20','secret','2013-11-28 12:11:03',20),(20,'doctor_21','secret','2013-11-28 12:09:32',21),(21,'doctor_22','secret','2013-11-28 12:09:32',22),(22,'doctor_23','secret','2013-11-28 12:10:43',23),(23,'doctor_24','secret','2013-11-28 12:09:32',24),(24,'doctor_25','secret','2013-11-28 12:09:32',25),(25,'doctor_26','secret','2013-11-28 12:09:32',26),(26,'doctor_27','secret','2013-11-28 12:09:32',27),(27,'doctor_28','secret','2013-11-28 12:09:32',28),(28,'doctor_29','secret','2013-11-28 12:09:32',29),(29,'doctor_30','secret','2013-11-28 12:09:32',30),(30,'doctor_31','secret','2013-11-28 12:09:32',31),(31,'doctor_32','secret','2013-11-28 12:09:32',32),(32,'doctor_33','secret','2013-11-28 12:09:32',33),(33,'doctor_34','secret','2013-11-28 12:09:32',34),(34,'doctor_35','secret','2013-11-28 12:09:32',35),(35,'doctor_36','secret','2013-11-28 12:09:32',36),(36,'doctor_37','secret','2013-11-28 12:09:32',37),(37,'doctor_38','secret','2013-11-28 12:09:32',38),(38,'doctor_39','secret','2013-11-28 12:09:32',39),(39,'doctor_40','secret','2013-11-28 12:09:32',40),(40,'doctor_41','secret','2013-11-28 12:09:33',41),(41,'doctor_42','secret','2013-11-28 12:09:33',42),(42,'doctor_43','secret','2013-12-05 11:27:20',43),(43,'doctor_44','secret','2013-11-28 12:09:33',44),(44,'doctor_45','secret','2013-11-28 12:09:33',45),(45,'doctor_46','secret','2013-11-28 12:09:33',46),(46,'doctor_47','secret','2013-11-28 12:09:33',47),(47,'doctor_48','secret','2013-11-28 12:09:33',48),(48,'doctor_49','secret','2013-11-28 12:09:33',49),(49,'doctor_50','secret','2013-11-28 12:09:33',50),(50,'doctor_51','secret','2013-11-28 12:09:33',51),(51,'doctor_52','secret','2013-11-28 12:09:33',52),(52,'doctor_53','secret','2013-11-28 12:09:33',53);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questoes_online`
--

LOCK TABLES `questoes_online` WRITE;
/*!40000 ALTER TABLE `questoes_online` DISABLE KEYS */;
INSERT INTO `questoes_online` VALUES (1,'Joana Caetano','juju@caetano.com','Porque é que o nosso planeta se chama terra e não água?','2013-11-11 22:22:46'),(5,'Pedro Fonseca','pedro@fonseca.com','Qual o tamanho do Universo?','2013-11-15 22:02:57'),(6,'Francisco Costa','frxp@costa.com','Reparei no que fazem com as laranjas,.. se eu levar uma vaca, tiram-lhe o leite?','2013-12-01 21:09:05');
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
INSERT INTO `utentes` VALUES ('antoniovivalvi@gmail.com','Antonio','Vivalvi','Rua do António Vivaldi Nº 18','918189718','2013-12-06 09:27:12'),('danielaoliveira@gmail.com','Daniela','Oliveira','Rua da Daniela Oliveira Nº55','919192929','2013-12-02 20:18:03'),('diogoribeiro@gmail.com','Diogo','Ribeiro','Rua do Diogo Ribeiro Nº12','912929299','2013-12-02 15:01:31'),('filipatavares@gmail.com','Filipa','Tavares','Rua da Filipa Tavares Nº28','926757567','2013-12-02 20:23:13'),('filipeneves@gmail.com','Filipe','Neves','Rua do Filipe Neves Nº198','918190819','2013-12-02 20:20:48'),('guilhermeontem@gmail.com','Guilherme','Ontem','Rua do Guilherme Ontem Nº12','969872888','2013-12-02 20:24:34'),('hugoboss@gmail.com','Hugo','Boss','Rua do Hugo Boss Nº 128','911875175','2013-12-05 11:35:34'),('hugosousa@gmail.com','Hugo','Sousa','Rua do Hugo Sousa Nº34','912982989','2013-12-02 20:20:03'),('ivoalexandre@gmail.com','Ivo','Alexandre','Rua do Ivo Alexandre Nº76','928789787','2013-12-02 20:22:32'),('joseperpetuo@gmail.com','José','Perpétuo','Rua do José Perpétuo Nº234','923658778','2013-12-01 19:44:56'),('juju@caetano.com','Joana','Caetano','Rua da Joana Caetano Nº28','912896296','2013-12-02 21:32:49'),('margaridapinto@gmail.com','Margarida','Pinto','Rua da Margarida Pinto Nº 35','927678678','2013-12-05 11:26:16'),('pedroeustaquio@gmail.com','Pedro','Eustáquio','Rua do Pedro Eustáquio Nº675','925451645','2013-12-02 22:18:49'),('pedrosilva@gmail.com','Pedro','Silva','Rua do Pedro Silva Nº97','912982982','2013-12-02 20:21:45'),('ruiesteves@gmail.com','Rui','Esteves','Rua do Rui Esteves Nº28','968728728','2013-12-01 20:04:04'),('sarajacinta@gmail.com','Sara','Jacinta','Rua da Sara Jacinta Nº27','911616896','2013-12-05 12:04:39'),('saraneves@gmail.com','Sara','Neves','Rua da Sara Neves Nº231','912233445','2013-12-01 20:02:05'),('sofiacaramelo@gmail.com','Sofia','Caramelo','Rua da Sofia Caramelo Nº78','917826786','2013-12-02 20:25:14'),('soniaalpalhao@gmail.com','Sónia','Alpalhão','Rua da Sónia Alpalhão Nº 28','968817982','2013-12-06 09:22:11'),('susanaarminda@gmail.com','Susana','Arminda','Rua da Susana Arminda Nº90','965498398','2013-12-02 20:19:04'),('teresaguilherme@gmail.com','Teresa','Guilherme','Rua da Teresa Guilherme Nº76','919816988','2013-12-01 21:18:35');
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

--
-- Temporary table structure for view `view_consultas_do_mes_currente`
--

DROP TABLE IF EXISTS `view_consultas_do_mes_currente`;
/*!50001 DROP VIEW IF EXISTS `view_consultas_do_mes_currente`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_consultas_do_mes_currente` (
  `id` tinyint NOT NULL,
  `datetime_confirmacao` tinyint NOT NULL,
  `data_consulta` tinyint NOT NULL,
  `hora_consulta` tinyint NOT NULL,
  `medicos_id` tinyint NOT NULL,
  `utentes_email` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_consultas_marcadas`
--

DROP TABLE IF EXISTS `view_consultas_marcadas`;
/*!50001 DROP VIEW IF EXISTS `view_consultas_marcadas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_consultas_marcadas` (
  `id` tinyint NOT NULL,
  `datetime_confirmacao` tinyint NOT NULL,
  `data_consulta` tinyint NOT NULL,
  `hora_consulta` tinyint NOT NULL,
  `medicos_id` tinyint NOT NULL,
  `especialidade` tinyint NOT NULL,
  `descricao_horario` tinyint NOT NULL,
  `utentes_email` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_emails_web_marketing`
--

DROP TABLE IF EXISTS `view_emails_web_marketing`;
/*!50001 DROP VIEW IF EXISTS `view_emails_web_marketing`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_emails_web_marketing` (
  `email` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_historico_consultas_realizadas`
--

DROP TABLE IF EXISTS `view_historico_consultas_realizadas`;
/*!50001 DROP VIEW IF EXISTS `view_historico_consultas_realizadas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_historico_consultas_realizadas` (
  `id` tinyint NOT NULL,
  `datetime_consulta_realizada` tinyint NOT NULL,
  `valor_consulta` tinyint NOT NULL,
  `diagnostico` tinyint NOT NULL,
  `prescricao` tinyint NOT NULL,
  `medicos_id` tinyint NOT NULL,
  `especialidade` tinyint NOT NULL,
  `descricao_horario` tinyint NOT NULL,
  `utentes_email` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_telemoveis_96`
--

DROP TABLE IF EXISTS `view_telemoveis_96`;
/*!50001 DROP VIEW IF EXISTS `view_telemoveis_96`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `view_telemoveis_96` (
  `email` tinyint NOT NULL,
  `primeiro_nome` tinyint NOT NULL,
  `ultimo_nome` tinyint NOT NULL,
  `morada` tinyint NOT NULL,
  `contacto_tel` tinyint NOT NULL,
  `datetime_registo` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_consultas_do_mes_currente`
--

/*!50001 DROP TABLE IF EXISTS `view_consultas_do_mes_currente`*/;
/*!50001 DROP VIEW IF EXISTS `view_consultas_do_mes_currente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_consultas_do_mes_currente` AS select `consultas_marcadas`.`id` AS `id`,`consultas_marcadas`.`datetime_confirmacao` AS `datetime_confirmacao`,`consultas_marcadas`.`data_consulta` AS `data_consulta`,`consultas_marcadas`.`hora_consulta` AS `hora_consulta`,`consultas_marcadas`.`medicos_id` AS `medicos_id`,`consultas_marcadas`.`utentes_email` AS `utentes_email` from `consultas_marcadas` where (`consultas_marcadas`.`data_consulta` between date_format(cast(now() as date),'%m/%d/%Y') and date_format(last_day(now()),'%m/%d/%Y')) order by `consultas_marcadas`.`data_consulta`,`consultas_marcadas`.`hora_consulta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_consultas_marcadas`
--

/*!50001 DROP TABLE IF EXISTS `view_consultas_marcadas`*/;
/*!50001 DROP VIEW IF EXISTS `view_consultas_marcadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_consultas_marcadas` AS select `consultas_marcadas`.`id` AS `id`,`consultas_marcadas`.`datetime_confirmacao` AS `datetime_confirmacao`,`consultas_marcadas`.`data_consulta` AS `data_consulta`,`consultas_marcadas`.`hora_consulta` AS `hora_consulta`,`consultas_marcadas`.`medicos_id` AS `medicos_id`,`especialidades`.`especialidade` AS `especialidade`,`horarios`.`descricao_horario` AS `descricao_horario`,`consultas_marcadas`.`utentes_email` AS `utentes_email` from (((`consultas_marcadas` join `medicos`) join `especialidades`) join `horarios`) where ((`medicos`.`id` = `consultas_marcadas`.`medicos_id`) and (`medicos`.`horarios_id` = `horarios`.`id`) and (`medicos`.`especialidades_id` = `especialidades`.`id`)) order by str_to_date(`consultas_marcadas`.`data_consulta`,'%m/%d/%Y'),`consultas_marcadas`.`hora_consulta` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_emails_web_marketing`
--

/*!50001 DROP TABLE IF EXISTS `view_emails_web_marketing`*/;
/*!50001 DROP VIEW IF EXISTS `view_emails_web_marketing`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_emails_web_marketing` AS select `utentes`.`email` AS `email` from `utentes` union select `questoes_online`.`email` AS `email` from `questoes_online` order by `email` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_historico_consultas_realizadas`
--

/*!50001 DROP TABLE IF EXISTS `view_historico_consultas_realizadas`*/;
/*!50001 DROP VIEW IF EXISTS `view_historico_consultas_realizadas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_historico_consultas_realizadas` AS select `consultas_realizadas`.`id` AS `id`,`consultas_realizadas`.`datetime_consulta_realizada` AS `datetime_consulta_realizada`,`consultas_realizadas`.`valor_consulta` AS `valor_consulta`,`consultas_realizadas`.`diagnostico` AS `diagnostico`,`consultas_realizadas`.`prescricao` AS `prescricao`,`consultas_realizadas`.`medicos_id` AS `medicos_id`,`especialidades`.`especialidade` AS `especialidade`,`horarios`.`descricao_horario` AS `descricao_horario`,`consultas_realizadas`.`utentes_email` AS `utentes_email` from (((`consultas_realizadas` join `medicos`) join `especialidades`) join `horarios`) where ((`medicos`.`id` = `consultas_realizadas`.`medicos_id`) and (`horarios`.`id` = `medicos`.`horarios_id`) and (`especialidades`.`id` = `medicos`.`especialidades_id`)) order by `consultas_realizadas`.`datetime_consulta_realizada` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_telemoveis_96`
--

/*!50001 DROP TABLE IF EXISTS `view_telemoveis_96`*/;
/*!50001 DROP VIEW IF EXISTS `view_telemoveis_96`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_telemoveis_96` AS select `utentes`.`email` AS `email`,`utentes`.`primeiro_nome` AS `primeiro_nome`,`utentes`.`ultimo_nome` AS `ultimo_nome`,`utentes`.`morada` AS `morada`,`utentes`.`contacto_tel` AS `contacto_tel`,`utentes`.`datetime_registo` AS `datetime_registo` from `utentes` where (`utentes`.`contacto_tel` like '96%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-07  0:16:28
