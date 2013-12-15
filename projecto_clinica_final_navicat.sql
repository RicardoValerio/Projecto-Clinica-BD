/*
Navicat MySQL Data Transfer

Source Server         : BitNami Lamp
Source Server Version : 50532
Source Host           : localhost:3306
Source Database       : projecto_clinica

Target Server Type    : MYSQL
Target Server Version : 50532
File Encoding         : 65001

Date: 2013-12-15 20:18:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `acordos`
-- ----------------------------
DROP TABLE IF EXISTS `acordos`;
CREATE TABLE `acordos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `datetime_acordo` datetime NOT NULL,
  `instituicao` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `foto_instituicao` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`,`datetime_acordo`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of acordos
-- ----------------------------
INSERT INTO `acordos` VALUES ('1', '2013-10-26 23:36:59', 'apache', 'apache.png');
INSERT INTO `acordos` VALUES ('2', '2013-10-26 23:37:28', 'android', 'android.png');
INSERT INTO `acordos` VALUES ('3', '2013-10-26 23:37:57', 'archlinux', 'archlinux.png');
INSERT INTO `acordos` VALUES ('4', '2013-10-26 23:38:08', 'aurasma', 'aurasma.jpg');
INSERT INTO `acordos` VALUES ('5', '2013-10-26 23:38:21', 'cakephp', 'cakephp.png');
INSERT INTO `acordos` VALUES ('6', '2013-10-26 23:38:35', 'firefox', 'firefox.png');
INSERT INTO `acordos` VALUES ('7', '2013-10-26 23:38:48', 'github', 'github.png');
INSERT INTO `acordos` VALUES ('8', '2013-10-26 23:38:59', 'gnome', 'gnome.png');
INSERT INTO `acordos` VALUES ('9', '2013-10-26 23:39:09', 'gnu', 'gnu.jpg');
INSERT INTO `acordos` VALUES ('10', '2013-10-26 23:39:22', 'koumbit', 'koumbit.png');
INSERT INTO `acordos` VALUES ('11', '2013-10-26 23:39:31', 'linux mint', 'linuxmint.jpg');
INSERT INTO `acordos` VALUES ('12', '2013-10-26 23:39:44', 'obc', 'logoobc.png');
INSERT INTO `acordos` VALUES ('13', '2013-10-26 23:39:53', 'mysql', 'mysql.png');
INSERT INTO `acordos` VALUES ('14', '2013-10-26 23:40:00', 'python', 'python.png');
INSERT INTO `acordos` VALUES ('15', '2013-10-26 23:41:10', 'tor', 'tor.png');
INSERT INTO `acordos` VALUES ('16', '2013-10-27 00:16:56', 'ubuntu', 'ubuntu.png');

-- ----------------------------
-- Table structure for `administradores`
-- ----------------------------
DROP TABLE IF EXISTS `administradores`;
CREATE TABLE `administradores` (
  `id` int(10) unsigned NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `datetime_ultimo_login` datetime NOT NULL,
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of administradores
-- ----------------------------
INSERT INTO `administradores` VALUES ('1', 'admin', 'pass', '2013-12-15 19:03:00');
INSERT INTO `administradores` VALUES ('2', 'super', 'root', '2013-11-12 20:31:39');

-- ----------------------------
-- Table structure for `consultas_marcadas`
-- ----------------------------
DROP TABLE IF EXISTS `consultas_marcadas`;
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of consultas_marcadas
-- ----------------------------
INSERT INTO `consultas_marcadas` VALUES ('24', '2013-12-02 20:18:04', '12/17/2013', '17:30', '32', 'danielaoliveira@gmail.com');
INSERT INTO `consultas_marcadas` VALUES ('34', '2013-12-02 22:18:49', '01/03/2014', '09:30', '3', 'pedroeustaquio@gmail.com');
INSERT INTO `consultas_marcadas` VALUES ('35', '2013-12-05 11:26:17', '12/17/2013', '18:30', '43', 'margaridapinto@gmail.com');
INSERT INTO `consultas_marcadas` VALUES ('36', '2013-12-05 11:35:34', '12/17/2013', '13:00', '38', 'hugoboss@gmail.com');
INSERT INTO `consultas_marcadas` VALUES ('37', '2013-12-05 12:04:39', '12/17/2013', '16:00', '4', 'sarajacinta@gmail.com');
INSERT INTO `consultas_marcadas` VALUES ('38', '2013-12-06 09:22:11', '12/28/2013', '17:30', '39', 'soniaalpalhao@gmail.com');
INSERT INTO `consultas_marcadas` VALUES ('39', '2013-12-06 09:27:12', '12/17/2013', '15:30', '33', 'antoniovivalvi@gmail.com');
INSERT INTO `consultas_marcadas` VALUES ('40', '2013-12-10 12:46:56', '12/19/2013', '11:30', '30', 'dudanorberta@gmail.com');
INSERT INTO `consultas_marcadas` VALUES ('41', '2013-12-15 19:11:46', '12/17/2013', '12:00', '3', 'filipesintra@gmail.com');
INSERT INTO `consultas_marcadas` VALUES ('42', '2013-12-15 19:12:49', '12/17/2013', '12:00', '5', 'filipaantunes@gmail.com');
INSERT INTO `consultas_marcadas` VALUES ('43', '2013-12-15 19:15:18', '12/18/2013', '08:00', '3', 'sarasousa@gmail.com');
INSERT INTO `consultas_marcadas` VALUES ('44', '2013-12-15 19:16:51', '12/17/2013', '12:30', '7', 'cristianaronalda@gmail.com');
INSERT INTO `consultas_marcadas` VALUES ('45', '2013-12-15 19:18:59', '12/17/2013', '15:30', '45', 'miguelserrao@gmail.com');
INSERT INTO `consultas_marcadas` VALUES ('46', '2013-12-15 19:59:44', '12/19/2013', '09:00', '3', 'saradias@gmail.com');
INSERT INTO `consultas_marcadas` VALUES ('47', '2013-12-15 20:08:55', '12/18/2013', '09:00', '5', 'diogoinfante@gmail.com');

-- ----------------------------
-- Table structure for `consultas_realizadas`
-- ----------------------------
DROP TABLE IF EXISTS `consultas_realizadas`;
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
) ENGINE=InnoDB AUTO_INCREMENT=427 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of consultas_realizadas
-- ----------------------------
INSERT INTO `consultas_realizadas` VALUES ('1', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('2', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('3', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('4', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('5', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('6', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('7', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('8', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('9', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('10', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('11', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('12', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('13', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('14', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('15', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('16', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '1', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('17', '2013-12-10 08:00:00', '40.00', 'diagnostico x', 'prescricao y', '2', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('18', '2013-12-10 09:00:00', '40.00', 'diagnostico x', 'prescricao y', '2', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('19', '2013-12-10 10:00:00', '40.00', 'diagnostico x', 'prescricao y', '2', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('20', '2013-12-10 10:30:00', '40.00', 'diagnostico x', 'prescricao y', '2', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('21', '2013-12-11 09:00:00', '40.00', 'diagnostico x', 'prescricao y', '2', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('22', '2013-12-11 10:30:00', '40.00', 'diagnostico x', 'prescricao y', '2', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('23', '2013-12-11 11:00:00', '40.00', 'diagnostico x', 'prescricao y', '2', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('24', '2013-12-12 11:00:00', '40.00', 'diagnostico x', 'prescricao y', '2', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('25', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '3', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('26', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '3', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('27', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '3', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('28', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '3', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('29', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '3', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('30', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '3', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('31', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '3', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('32', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '3', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('33', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '4', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('34', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '4', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('35', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '4', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('36', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '4', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('37', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '4', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('38', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '4', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('39', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '4', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('40', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '4', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('41', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '5', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('42', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '5', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('43', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '5', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('44', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '5', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('45', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '5', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('46', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '5', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('47', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '5', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('48', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '5', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('49', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '6', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('50', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '6', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('51', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '6', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('52', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '6', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('53', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '6', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('54', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '6', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('55', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '6', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('56', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '6', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('57', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '7', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('58', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '7', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('59', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '7', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('60', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '7', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('61', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '7', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('62', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '7', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('63', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '7', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('64', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '7', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('65', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '8', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('66', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '8', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('67', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '8', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('68', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '8', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('69', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '8', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('70', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '8', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('71', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '8', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('72', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '8', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('73', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '9', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('74', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '9', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('75', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '9', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('76', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '9', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('77', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '9', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('78', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '9', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('79', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '9', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('80', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '9', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('81', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '10', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('82', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '10', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('83', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '10', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('84', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '10', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('85', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '10', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('86', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '10', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('87', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '10', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('88', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '10', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('89', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '11', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('90', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '11', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('91', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '11', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('92', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '11', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('93', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '11', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('94', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '11', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('95', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '11', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('96', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '11', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('97', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '12', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('98', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '12', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('99', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '12', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('100', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '12', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('101', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '12', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('102', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '12', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('103', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '12', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('104', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '12', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('105', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '13', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('106', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '13', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('107', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '13', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('108', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '13', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('109', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '13', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('110', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '13', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('111', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '13', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('112', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '13', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('113', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '14', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('114', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '14', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('115', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '14', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('116', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '14', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('117', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '14', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('118', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '14', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('119', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '14', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('120', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '14', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('121', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '15', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('122', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '15', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('123', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '15', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('124', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '15', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('125', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '15', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('126', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '15', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('127', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '15', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('128', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '15', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('129', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '16', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('130', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '16', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('131', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '16', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('132', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '16', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('133', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '16', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('134', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '16', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('135', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '16', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('136', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '16', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('137', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '17', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('138', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '17', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('139', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '17', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('140', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '17', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('141', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '17', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('142', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '17', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('143', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '17', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('144', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '17', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('145', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '18', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('146', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '18', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('147', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '18', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('148', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '18', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('149', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '18', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('150', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '18', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('151', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '18', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('152', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '18', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('153', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '20', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('154', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '20', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('155', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '20', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('156', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '20', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('157', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '20', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('158', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '20', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('159', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '20', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('160', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '20', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('161', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '21', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('162', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '21', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('163', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '21', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('164', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '21', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('165', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '21', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('166', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '21', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('167', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '21', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('168', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '21', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('169', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '22', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('170', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '22', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('171', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '22', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('172', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '22', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('173', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '22', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('174', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '22', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('175', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '22', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('176', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '22', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('177', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '23', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('178', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '23', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('179', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '23', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('180', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '23', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('181', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '23', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('182', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '23', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('183', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '23', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('184', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '23', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('185', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '24', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('186', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '24', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('187', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '24', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('188', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '24', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('189', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '24', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('190', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '24', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('191', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '24', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('192', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '24', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('193', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '25', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('194', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '25', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('195', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '25', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('196', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '25', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('197', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '25', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('198', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '25', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('199', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '25', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('200', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '25', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('201', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '26', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('202', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '26', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('203', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '26', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('204', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '26', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('205', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '26', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('206', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '26', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('207', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '26', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('208', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '26', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('209', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '27', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('210', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '27', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('211', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '27', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('212', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '27', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('213', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '27', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('214', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '27', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('215', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '27', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('216', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '27', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('217', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '28', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('218', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '28', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('219', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '28', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('220', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '28', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('221', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '28', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('222', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '28', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('223', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '28', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('224', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '28', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('225', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '29', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('226', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '29', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('227', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '29', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('228', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '29', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('229', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '29', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('230', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '29', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('231', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '29', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('232', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '29', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('233', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '30', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('234', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '30', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('235', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '30', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('236', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '30', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('237', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '30', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('238', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '30', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('239', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '30', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('240', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '30', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('241', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '31', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('242', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '31', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('243', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '31', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('244', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '31', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('245', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '31', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('246', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '31', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('247', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '31', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('248', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '31', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('249', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '32', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('250', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '32', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('251', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '32', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('252', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '32', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('253', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '32', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('254', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '32', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('255', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '32', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('256', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '32', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('257', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '33', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('258', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '33', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('259', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '33', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('260', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '33', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('261', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '33', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('262', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '33', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('263', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '33', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('264', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '33', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('265', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '34', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('266', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '34', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('267', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '34', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('268', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '34', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('269', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '34', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('270', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '34', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('271', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '34', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('272', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '34', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('273', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '35', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('274', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '35', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('275', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '35', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('276', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '35', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('277', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '35', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('278', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '35', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('279', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '35', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('280', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '35', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('281', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '36', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('282', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '36', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('283', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '36', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('284', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '36', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('285', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '36', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('286', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '36', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('287', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '36', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('288', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '36', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('289', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '37', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('290', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '37', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('291', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '37', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('292', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '37', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('293', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '37', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('294', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '37', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('295', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '37', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('296', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '37', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('297', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '38', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('298', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '38', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('299', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '38', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('300', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '38', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('301', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '38', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('302', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '38', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('303', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '38', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('304', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '38', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('305', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '39', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('306', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '39', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('307', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '39', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('308', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '39', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('309', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '39', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('310', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '39', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('311', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '39', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('312', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '39', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('313', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '40', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('314', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '40', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('315', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '40', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('316', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '40', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('317', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '40', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('318', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '40', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('319', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '40', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('320', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '40', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('321', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '41', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('322', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '41', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('323', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '41', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('324', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '41', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('325', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '41', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('326', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '41', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('327', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '41', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('328', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '41', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('329', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '42', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('330', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '42', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('331', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '42', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('332', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '42', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('333', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '42', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('334', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '42', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('335', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '42', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('336', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '42', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('337', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '43', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('338', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '43', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('339', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '43', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('340', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '43', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('341', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '43', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('342', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '43', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('343', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '43', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('344', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '43', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('345', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '44', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('346', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '44', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('347', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '44', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('348', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '44', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('349', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '44', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('350', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '44', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('351', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '44', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('352', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '44', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('353', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '45', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('354', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '45', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('355', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '45', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('356', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '45', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('357', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '45', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('358', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '45', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('359', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '45', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('360', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '45', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('361', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '46', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('362', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '46', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('363', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '46', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('364', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '46', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('365', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '46', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('366', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '46', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('367', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '46', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('368', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '46', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('369', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '47', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('370', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '47', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('371', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '47', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('372', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '47', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('373', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '47', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('374', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '47', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('375', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '47', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('376', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '47', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('377', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '48', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('378', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '48', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('379', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '48', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('380', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '48', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('381', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '48', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('382', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '48', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('383', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '48', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('384', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '48', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('385', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '49', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('386', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '49', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('387', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '49', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('388', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '49', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('389', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '49', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('390', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '49', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('391', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '49', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('392', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '49', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('393', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '50', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('394', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '50', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('395', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '50', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('396', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '50', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('397', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '50', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('398', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '50', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('399', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '50', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('400', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '50', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('401', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '51', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('402', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '51', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('403', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '51', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('404', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '51', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('405', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '51', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('406', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '51', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('407', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '51', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('408', '2013-12-10 11:00:00', '23.00', 'diagnostico x', 'prescricao y', '51', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('409', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '52', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('410', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '52', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('411', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '52', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('412', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '52', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('413', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '52', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('414', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '52', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('415', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '52', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('416', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '52', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('417', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '53', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('418', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '53', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('419', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '53', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('420', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '53', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('421', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '53', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('422', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '53', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('423', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '53', 'dumpy_email@gmail.com');
INSERT INTO `consultas_realizadas` VALUES ('424', '2013-12-10 18:00:00', '23.00', 'diagnostico x', 'prescricao y', '53', 'dumpy_email@gmail.com');

-- ----------------------------
-- Table structure for `especialidades`
-- ----------------------------
DROP TABLE IF EXISTS `especialidades`;
CREATE TABLE `especialidades` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `especialidade` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao_especialidade` text COLLATE utf8_unicode_ci NOT NULL,
  `preco_consulta` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of especialidades
-- ----------------------------
INSERT INTO `especialidades` VALUES ('1', 'Medicina Dentária', 'Medicina dentária é a área da saúde humana que estuda e trata o sistema estomatognático - compreende a face, pescoço e cavidade bucal, abrangendo ossos, musculatura mastigatória, articulações, dentes e tecidos.\r\n\r\nO significado de saúde oral, é a ausência de doença estomatológica, bem como a correcta função, estabilidade e até mesmo estética de todo o sistema estomatognático. É hoje certo e sabido que a saúde oral tem sérias implicações na saúde humana, sendo as duas indissociáveis.', '30.00');
INSERT INTO `especialidades` VALUES ('2', 'Ginecologia', 'A ginecologia literalmente significa \"a ciência da mulher\", mas na medicina é a especialidade que trata de doenças do sistema reprodutor feminino, útero, vagina e ovários.', '30.00');
INSERT INTO `especialidades` VALUES ('3', 'Otorrino', 'A Otorrinolaringologia é considerada uma das mais completas especialidades médicas do mundo, com características clínicas e cirúrgicas. O seu campo de actuação envolve as doenças do ouvido, do nariz e seios paranasais, faringe ,laringe e cabeça e pescoço.', '30.00');
INSERT INTO `especialidades` VALUES ('4', 'Pediatria', 'A pediatria é a especialidade médica dedicada à assistência à criança e ao adolescente, nos seus diversos aspectos, sejam eles preventivos (Puericultura) ou curativos. (principalmente crianças).\r\n\r\nAspectos preventivos envolvem ações como aleitamento materno, imunizações (vacinas), prevenção de acidentes, além do acompanhamento e das orientações necessárias a um crescimento e desenvolvimento saudáveis (puericultura).\r\n\r\nOs curativos correspondem aos diversos procedimentos e tratamentos das mais diversas patologias exclusivas ou não da criança e adolescente.', '40.00');
INSERT INTO `especialidades` VALUES ('5', 'Dermatologia', 'Dermatologia é a especialidade médica que se ocupa do diagnóstico e tratamento clínico-cirúrgico das doenças que acometem o maior órgão do corpo humano – a pele, tendo em média 2 metros quadrados de área em um indivíduo adulto.\r\n\r\nA especialidade engloba ainda as doenças que acometem os anexos cutâneos: cabelos e unhas, bem como as mucosas (ex: boca e genitais). Outra denominação é a dermatovenerologia já que a especialidade tem importante actuação no contexto das doenças sexualmente transmissíveis (doenças venéreas).\r\n\r\nA Dermatologia actua em todos os processos fisopatológicos que envolvem a pele: desde simples infecções, reações auto-imunes e inflamatórias, e tumores. A hansenologia é outra importante área de actuação da dermatologia. Por lidar com a pele, a dermatologia é a especialidade médica mais indicada para actuação em cosmiatria.', '40.00');
INSERT INTO `especialidades` VALUES ('6', 'Alergologia', 'Alergologia (ou Imunoalergologia) é a especialidade da Medicina que visa o diagnóstico e o tratamento das doenças alérgicas, que são as respostas exageradas do sistema imunológico a uma substância estranha ao organismo, uma hipersensibilidade imunológica a um estímulo externo específico. Os portadores de alergias são chamados de “atópicos” ou mais popularmente de “alérgicos”.', '40.00');
INSERT INTO `especialidades` VALUES ('7', 'Medicina Geral', 'Medicina Interna ou Clínica geral, é a especialidade médica que trata de pacientes adultos, actuando principalmente em ambiente hospitalar. Inclui o estudo das doenças de adultos, não cirúrgicas, não obstétricas e não ginecológicas, sendo a especialidade médica a partir da qual se diferenciaram todas as outras como Cardiologia e Pneumologia.', '40.00');
INSERT INTO `especialidades` VALUES ('9', 'Acunpunctura', 'A Acupunctura é um ramo da Medicina Tradicional Chinesa e um método de tratamento considerado complementar de acordo com a nova terminologia da OMS - Organização Mundial da Saúde.\r\n\r\nSob a orientação do Dr. Rui Chico, esta especialidade milenar consiste na aplicação de agulhas, em pontos definidos do corpo, chamados de \"Pontos de Acupunctura\" ou \"Acupontos\", para obter efeito terapêutico em diversas condições.\r\n\r\nOs pontos e meridianos também podem ser estimulados por outros tipos de técnicas. Na verdade, os pontos de Acupunctura podem ser estimulados por agulhas, dedos (acupressão), stiper (do inglês Stimulation and Permanency - Estimulação Permanente), ventosa ou pelo aquecimento promovido por moxa ou seja longo tempo de aplicação do fogo, um bastão de artemísia em brasa, que é aproximado da pele para aquecer o ponto de acupuntura, ou o método de estimulação por laser.', '50.00');
INSERT INTO `especialidades` VALUES ('10', 'TuiNa', 'Tui-Ná ou Tuina são os nomes pelo qual é conhecida esta massagem terapêutica chinesa.\r\nAs manipulações são usadas para estimular os pontos ou outras partes da superfície do corpo, para corrigir o desequilibrio fisiológico do mesmo e alcançar efeitos curativos. É uma parte muito importante da MTC. Na China antiga, a terapia era classificada em: medicina interna e medicina externa; o Tuiná está incluído na primeira.\r\n\r\nO Tuina pode ser usado para tratar várias disfunções, entre as quais lesões dos tecidos moles, neurologia, os cinco órgãos dos sentidos, pediatria, etc. É especialmente satisfatório para pacientes infantis e idosos. No presente, entretanto, o Tuiná chinês está dividido em vários ramos, tais como: adulto, infantil, ortopedia e traumatologia, cosmetologia, prevenção da saúde, reabilitação, medicina desportiva e assim por diante.\r\n\r\nO Tuina Adulto é tradicionalmente usado para tratar diversos problemas de saúde, como: espondilopatia cervical, estiramento lombar, prolapso do disco intervertebral lombar, estiramento lombar agudo, artrite reumatóide, hipertensão e sequelas da apoplexia.', '50.00');
INSERT INTO `especialidades` VALUES ('12', 'Podologia', 'A Podologia é a disciplina que se dedica ao estudo dos pés do ponto de vista da sua anatomia e patologia. Está integrada noutras disciplinas, como a cirurgia, a ortopedia, a fisioterapia e a dermatologia entre outras.', '35.00');
INSERT INTO `especialidades` VALUES ('13', 'Nutrição', 'A consulta de nutrição abrange inúmeras áreas de intervenção, permitindo aplicar a dietoterapia em todas as patologias que exijam cuidados nutricionais e dietéticos adaptados a cada situação específica, contribuindo para a saúde e bem-estar do indivíduo.', '45.00');
INSERT INTO `especialidades` VALUES ('14', 'Neurocirurgia', 'Neurocirurgia é a especialidade que se ocupa do tratamento de do e (como, doenças vasculares, degenerativas, traumas cranio-encefálicos e raqui-medulares passíveis de abordagem. Recentemente, também passou a tratar da substituição de órgãos sensoriais (olho e ouvido interno) disfuncionais por dispositivos artificiais.', '55.00');
INSERT INTO `especialidades` VALUES ('15', 'Terapia da Fala', 'A Terapia da fala, é a ciência que tem como objecto de estudo a comunicação humana. Não apenas os distúrbios da linguagem são do seu interesse, como também o modo de comunicação sádio e eficaz.', '35.00');

-- ----------------------------
-- Table structure for `horarios`
-- ----------------------------
DROP TABLE IF EXISTS `horarios`;
CREATE TABLE `horarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao_horario` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of horarios
-- ----------------------------
INSERT INTO `horarios` VALUES ('1', 'Manhã');
INSERT INTO `horarios` VALUES ('2', 'Tarde');

-- ----------------------------
-- Table structure for `medicos`
-- ----------------------------
DROP TABLE IF EXISTS `medicos`;
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

-- ----------------------------
-- Records of medicos
-- ----------------------------
INSERT INTO `medicos` VALUES ('1', 'Carlos', 'Ribeiro', 'carlos@ribeiro.com', '917866545', 'android.png', '3', '2', '890.00');
INSERT INTO `medicos` VALUES ('2', 'Filipe', 'Sousa', 'filipe@sousa.com', '965765676', 'android.png', '4', '1', '890.00');
INSERT INTO `medicos` VALUES ('3', 'José', 'Fonseca', 'jose@fonseca', '932653768', 'android.png', '1', '1', '1110.00');
INSERT INTO `medicos` VALUES ('4', 'Vitor', 'Pereira', 'vitor@pereira', '912345625', 'android.png', '2', '2', '745.00');
INSERT INTO `medicos` VALUES ('5', 'Pedro', 'Pinto', 'pedro@pinto', '912344556', 'android.png', '1', '1', '987.00');
INSERT INTO `medicos` VALUES ('6', 'Mariana', 'Monteiro', 'mariana@monteiro.com', '914562765', 'android.png', '2', '2', '1230.00');
INSERT INTO `medicos` VALUES ('7', 'Judite', 'Sousa', 'judite@sousa.com', '934526516', 'android.png', '2', '1', '987.00');
INSERT INTO `medicos` VALUES ('8', 'Cecília', 'Pimentel', 'cecilia9@pimentel.com', '912344321', 'android.png', '1', '2', '2490.00');
INSERT INTO `medicos` VALUES ('9', 'Luís', 'Serrão', 'luis@serrao.com', '962453454', 'android.png', '1', '2', '1000.00');
INSERT INTO `medicos` VALUES ('10', 'Olga', 'Dias', 'olga@dias.com', '923212345', 'android.png', '3', '1', '470.00');
INSERT INTO `medicos` VALUES ('11', 'Catarina', 'Vasconcelos', 'catarina@vasconcelos', '962451546', 'android.png', '4', '1', '876.00');
INSERT INTO `medicos` VALUES ('12', 'Sandra', 'Rocha', 'sandra@rocha.com', '921187178', 'android.png', '4', '2', '1900.00');
INSERT INTO `medicos` VALUES ('13', 'José', 'Ribeiro', 'jose@ribeiro.com', '912454489', 'android.png', '3', '2', '2060.00');
INSERT INTO `medicos` VALUES ('14', 'Hélder', 'Marques', 'helder@marques.com', '918575785', 'android.png', '4', '2', '796.00');
INSERT INTO `medicos` VALUES ('15', 'Vasco', 'Rebelo', 'vasco@rebelo.com', '964315747', 'android.png', '5', '2', '1946.00');
INSERT INTO `medicos` VALUES ('16', 'Nuno', 'Correia', 'nuno@correia.com', '932542547', 'android.png', '3', '1', '1972.00');
INSERT INTO `medicos` VALUES ('17', 'Manuel', 'Santos', 'manuel@santos.com', '962567276', 'android.png', '6', '1', '976.00');
INSERT INTO `medicos` VALUES ('18', 'Alberto', 'Gameiro', 'alberto@gameiro.com', '932677678', 'android.png', '2', '1', '679.00');
INSERT INTO `medicos` VALUES ('20', 'Joaquim', 'Ruivo', 'joaquim@ruivo.com', '912875287', 'android.png', '5', '1', '981.00');
INSERT INTO `medicos` VALUES ('21', 'Sara', 'Tavares', 'sara@tavares.com', '935425479', 'android.png', '5', '1', '982.00');
INSERT INTO `medicos` VALUES ('22', 'Maria', 'Matos', 'maria@matos.com', '912764647', 'android.png', '5', '2', '1000.00');
INSERT INTO `medicos` VALUES ('23', 'Isabel', 'Pinto', 'isabel@pinto.com', '932654165', 'android.png', '6', '1', '957.00');
INSERT INTO `medicos` VALUES ('24', 'Aldina', 'Almeida', 'aldina@almeida.com', '912657578', 'android.png', '6', '2', '896.00');
INSERT INTO `medicos` VALUES ('25', 'Sílvia', 'Neves', 'silvia@neves.com', '968758758', 'android.png', '6', '2', '1089.00');
INSERT INTO `medicos` VALUES ('26', 'José', 'Serra', 'jose@serra.com', '917858789', 'android.png', '7', '1', '912.00');
INSERT INTO `medicos` VALUES ('27', 'Júlio', 'Neves', 'julio@neves.com', '932677878', 'android.png', '7', '2', '1062.00');
INSERT INTO `medicos` VALUES ('28', 'Francisca', 'Saramago', 'francisca@saramago.com', '918758758', 'android.png', '7', '2', '1908.00');
INSERT INTO `medicos` VALUES ('29', 'Maria', 'Celeste', 'maria@celeste.com', '932786876', 'android.png', '7', '1', '908.00');
INSERT INTO `medicos` VALUES ('30', 'Eugénia', 'Barradas', 'eugenia@barradas.com', '919698999', 'android.png', '9', '1', '789.00');
INSERT INTO `medicos` VALUES ('31', 'Maria', 'Melo', 'maria@melo.com', '932089070', 'android.png', '9', '1', '1008.00');
INSERT INTO `medicos` VALUES ('32', 'António', 'Contente', 'antonio@contente.com', '916542858', 'android.png', '9', '2', '1934.00');
INSERT INTO `medicos` VALUES ('33', 'Jorge', 'Ferrão', 'jorge@ferrao.com', '923767868', 'android.png', '9', '2', '1023.00');
INSERT INTO `medicos` VALUES ('34', 'Carlos', 'Gonçalves', 'carlos@goncalves.com', '968758758', 'android.png', '10', '1', '1029.00');
INSERT INTO `medicos` VALUES ('35', 'Carla', 'Silva', 'carla@silva.com', '921767969', 'android.png', '10', '2', '987.00');
INSERT INTO `medicos` VALUES ('36', 'Salete', 'Nobre', 'salete@nobre.com', '968587588', 'android.png', '10', '1', '950.00');
INSERT INTO `medicos` VALUES ('37', 'Isabel', 'Fonseca', 'isabel@fonseca.com', '936752858', 'android.png', '10', '2', '945.00');
INSERT INTO `medicos` VALUES ('38', 'João', 'Figueiredo', 'joao@figueiredo.com', '918585758', 'android.png', '12', '1', '879.00');
INSERT INTO `medicos` VALUES ('39', 'Artur', 'Aires', 'artur@aires.com', '936542564', 'android.png', '12', '2', '879.00');
INSERT INTO `medicos` VALUES ('40', 'Fernando', 'Machado', 'fernando@machado.com', '927868768', 'android.png', '12', '1', '1092.00');
INSERT INTO `medicos` VALUES ('41', 'Manuela', 'Moraguedes', 'manuela@moraguedes.com', '918788578', 'android.png', '12', '2', '1450.00');
INSERT INTO `medicos` VALUES ('42', 'Frederico', 'Figueiredo', 'frederico@figueiredo.com', '923868788', 'android.png', '13', '1', '1200.00');
INSERT INTO `medicos` VALUES ('43', 'Joana', 'Sintra', 'joana@sintra.com', '967576474', 'android.png', '13', '2', '978.00');
INSERT INTO `medicos` VALUES ('44', 'Ricardo', 'Feijoeiro', 'ricardo@feijoeiro.com', '918658758', 'android.png', '13', '1', '917.00');
INSERT INTO `medicos` VALUES ('45', 'Jacinto', 'Nunes', 'jaciento@nunes.com', '926758768', 'android.png', '13', '2', '670.00');
INSERT INTO `medicos` VALUES ('46', 'Herman', 'Sousa', 'herman@sousa.com', '912763786', 'android.png', '14', '1', '1809.00');
INSERT INTO `medicos` VALUES ('47', 'Sara', 'Varela', 'sara@varela.com', '974747646', 'android.png', '14', '2', '2050.00');
INSERT INTO `medicos` VALUES ('48', 'Diogo', 'Mendes', 'diogo@mendes.com', '918658758', 'android.png', '14', '1', '987.00');
INSERT INTO `medicos` VALUES ('49', 'Daniela', 'Pereira', 'daniela@pereira.com', '932796969', 'android.png', '15', '1', '1972.00');
INSERT INTO `medicos` VALUES ('50', 'Verónica', 'Pereira', 'veronica@pereira.com', '916776577', 'android.png', '15', '2', '1000.00');
INSERT INTO `medicos` VALUES ('51', 'Luísa', 'Almeida', 'luisa@almeida.com', '965657577', 'android.png', '15', '1', '987.00');
INSERT INTO `medicos` VALUES ('52', 'Carla', 'Dias', 'carla@dias.com', '918587875', 'android.png', '15', '2', '879.00');
INSERT INTO `medicos` VALUES ('53', 'Paulo', 'Bento', 'paulinho@bento.com', '923452617', 'android.png', '14', '2', '971.00');

-- ----------------------------
-- Table structure for `medicos_administracao_de_consultas`
-- ----------------------------
DROP TABLE IF EXISTS `medicos_administracao_de_consultas`;
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

-- ----------------------------
-- Records of medicos_administracao_de_consultas
-- ----------------------------
INSERT INTO `medicos_administracao_de_consultas` VALUES ('1', 'doctor_1', 'secret', '2013-12-10 17:12:53', '1');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('2', 'doctor_2', 'secret', '2013-12-15 19:06:55', '2');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('3', 'doctor_3', 'secret', '2013-12-15 19:07:28', '3');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('4', 'doctor_4', 'secret', '2013-12-10 17:13:39', '4');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('5', 'doctor_5', 'secret', '2013-11-28 12:09:31', '5');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('6', 'doctor_6', 'secret', '2013-11-28 12:09:31', '6');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('7', 'doctor_7', 'secret', '2013-11-28 12:09:31', '7');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('8', 'doctor_8', 'secret', '2013-11-28 12:09:31', '8');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('9', 'doctor_9', 'secret', '2013-11-28 12:09:31', '9');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('10', 'doctor_10', 'secret', '2013-11-28 12:09:31', '10');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('11', 'doctor_11', 'secret', '2013-11-28 12:09:31', '11');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('12', 'doctor_12', 'secret', '2013-12-15 14:06:49', '12');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('13', 'doctor_13', 'secret', '2013-12-03 11:21:04', '13');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('14', 'doctor_14', 'secret', '2013-11-28 12:09:31', '14');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('15', 'doctor_15', 'secret', '2013-11-28 12:09:31', '15');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('16', 'doctor_16', 'secret', '2013-11-28 12:09:31', '16');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('17', 'doctor_17', 'secret', '2013-11-28 12:09:31', '17');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('18', 'doctor_18', 'secret', '2013-11-28 12:09:31', '18');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('19', 'doctor_20', 'secret', '2013-11-28 12:11:03', '20');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('20', 'doctor_21', 'secret', '2013-12-10 17:55:10', '21');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('21', 'doctor_22', 'secret', '2013-11-28 12:09:32', '22');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('22', 'doctor_23', 'secret', '2013-11-28 12:10:43', '23');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('23', 'doctor_24', 'secret', '2013-11-28 12:09:32', '24');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('24', 'doctor_25', 'secret', '2013-11-28 12:09:32', '25');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('25', 'doctor_26', 'secret', '2013-11-28 12:09:32', '26');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('26', 'doctor_27', 'secret', '2013-11-28 12:09:32', '27');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('27', 'doctor_28', 'secret', '2013-11-28 12:09:32', '28');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('28', 'doctor_29', 'secret', '2013-11-28 12:09:32', '29');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('29', 'doctor_30', 'secret', '2013-11-28 12:09:32', '30');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('30', 'doctor_31', 'secret', '2013-11-28 12:09:32', '31');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('31', 'doctor_32', 'secret', '2013-11-28 12:09:32', '32');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('32', 'doctor_33', 'secret', '2013-11-28 12:09:32', '33');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('33', 'doctor_34', 'secret', '2013-11-28 12:09:32', '34');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('34', 'doctor_35', 'secret', '2013-11-28 12:09:32', '35');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('35', 'doctor_36', 'secret', '2013-11-28 12:09:32', '36');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('36', 'doctor_37', 'secret', '2013-11-28 12:09:32', '37');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('37', 'doctor_38', 'secret', '2013-11-28 12:09:32', '38');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('38', 'doctor_39', 'secret', '2013-11-28 12:09:32', '39');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('39', 'doctor_40', 'secret', '2013-11-28 12:09:32', '40');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('40', 'doctor_41', 'secret', '2013-11-28 12:09:33', '41');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('41', 'doctor_42', 'secret', '2013-11-28 12:09:33', '42');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('42', 'doctor_43', 'secret', '2013-12-05 11:27:20', '43');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('43', 'doctor_44', 'secret', '2013-11-28 12:09:33', '44');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('44', 'doctor_45', 'secret', '2013-11-28 12:09:33', '45');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('45', 'doctor_46', 'secret', '2013-11-28 12:09:33', '46');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('46', 'doctor_47', 'secret', '2013-11-28 12:09:33', '47');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('47', 'doctor_48', 'secret', '2013-11-28 12:09:33', '48');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('48', 'doctor_49', 'secret', '2013-11-28 12:09:33', '49');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('49', 'doctor_50', 'secret', '2013-11-28 12:09:33', '50');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('50', 'doctor_51', 'secret', '2013-11-28 12:09:33', '51');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('51', 'doctor_52', 'secret', '2013-11-28 12:09:33', '52');
INSERT INTO `medicos_administracao_de_consultas` VALUES ('52', 'doctor_53', 'secret', '2013-11-28 12:09:33', '53');

-- ----------------------------
-- Table structure for `questoes_online`
-- ----------------------------
DROP TABLE IF EXISTS `questoes_online`;
CREATE TABLE `questoes_online` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(55) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `mensagem` text COLLATE utf8_unicode_ci NOT NULL,
  `datetime_questao` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of questoes_online
-- ----------------------------
INSERT INTO `questoes_online` VALUES ('1', 'Joana Caetano', 'juju@caetano.com', 'Porque é que o nosso planeta se chama terra e não água?', '2013-11-11 22:22:46');
INSERT INTO `questoes_online` VALUES ('5', 'Pedro Fonseca', 'pedro@fonseca.com', 'Qual o tamanho do Universo?', '2013-11-15 22:02:57');
INSERT INTO `questoes_online` VALUES ('6', 'Francisco Costa', 'frxp@costa.com', 'Reparei no que fazem com as laranjas,.. se eu levar uma vaca, tiram-lhe o leite?', '2013-12-01 21:09:05');
INSERT INTO `questoes_online` VALUES ('7', 'Daniela Pereira', 'daniela@pereira.com', 'Mudem o nome da vossa clínica por favor...', '2013-12-07 15:59:20');
INSERT INTO `questoes_online` VALUES ('8', 'Felizberta Fonseca', 'felizberta@gmail.com', 'A que horas estão abertos aos feriados?', '2013-12-11 12:37:42');
INSERT INTO `questoes_online` VALUES ('9', 'Rute Marlene', 'rute@marlene.com', 'A luz da dispensa está acesa?', '2013-12-15 12:52:26');

-- ----------------------------
-- Table structure for `utentes`
-- ----------------------------
DROP TABLE IF EXISTS `utentes`;
CREATE TABLE `utentes` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `primeiro_nome` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `ultimo_nome` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `morada` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `contacto_tel` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `datetime_registo` datetime NOT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of utentes
-- ----------------------------
INSERT INTO `utentes` VALUES ('antoniovivalvi@gmail.com', 'Antonio', 'Vivalvi', 'Rua do António Vivaldi Nº 18', '918189718', '2013-12-06 09:27:12');
INSERT INTO `utentes` VALUES ('cristianaronalda@gmail.com', 'Cristiana', 'Ronalda', 'Rua da Cristiana Ronalda Nº18', '918918918', '2013-12-15 19:16:51');
INSERT INTO `utentes` VALUES ('danielaoliveira@gmail.com', 'Daniela', 'Oliveira', 'Rua da Daniela Oliveira Nº55', '919192929', '2013-12-02 20:18:03');
INSERT INTO `utentes` VALUES ('diogoinfante@gmail.com', 'Diogo', 'Infante', 'Rua do Diogo Infante Nº2998', '918982982', '2013-12-15 20:07:12');
INSERT INTO `utentes` VALUES ('diogoribeiro@gmail.com', 'Diogo', 'Ribeiro', 'Rua do Diogo Ribeiro Nº12', '912929299', '2013-12-02 15:01:31');
INSERT INTO `utentes` VALUES ('dudanorberta@gmail.com', 'Duda', 'Norberta', 'Rua da Duda Norberta Nº238', '918276278', '2013-12-10 12:46:56');
INSERT INTO `utentes` VALUES ('dumpy_email@gmail.com', 'TESTE', 'TESTE', 'Rua do TESTE TESTE Nº6', '967563212', '2013-12-15 18:09:10');
INSERT INTO `utentes` VALUES ('esperanzagomez@gmail.com', 'Esperanza', 'Gomez', 'Rua da Esperanza Gomez Nº69', '918928928', '2013-12-15 20:10:10');
INSERT INTO `utentes` VALUES ('filipaantunes@gmail.com', 'Filipa', 'Antunes', 'Rua da Filipa Antunes Nº19', '919128283', '2013-12-15 19:12:48');
INSERT INTO `utentes` VALUES ('filipatavares@gmail.com', 'Filipa', 'Tavares', 'Rua da Filipa Tavares Nº28', '926757567', '2013-12-02 20:23:13');
INSERT INTO `utentes` VALUES ('filipeneves@gmail.com', 'Filipe', 'Neves', 'Rua do Filipe Neves Nº198', '918190819', '2013-12-02 20:20:48');
INSERT INTO `utentes` VALUES ('filipesintra@gmail.com', 'Filipe', 'Sintra', 'Rua do Filipe Sintra Nº21', '919191911', '2013-12-15 19:11:46');
INSERT INTO `utentes` VALUES ('guilhermeontem@gmail.com', 'Guilherme', 'Ontem', 'Rua do Guilherme Ontem Nº12', '969872888', '2013-12-02 20:24:34');
INSERT INTO `utentes` VALUES ('hugoboss@gmail.com', 'Hugo', 'Boss', 'Rua do Hugo Boss Nº 128', '911875175', '2013-12-05 11:35:34');
INSERT INTO `utentes` VALUES ('hugosousa@gmail.com', 'Hugo', 'Sousa', 'Rua do Hugo Sousa Nº34', '912982989', '2013-12-02 20:20:03');
INSERT INTO `utentes` VALUES ('ivoalexandre@gmail.com', 'Ivo', 'Alexandre', 'Rua do Ivo Alexandre Nº76', '928789787', '2013-12-02 20:22:32');
INSERT INTO `utentes` VALUES ('margaridapinto@gmail.com', 'Margarida', 'Pinto', 'Rua da Margarida Pinto Nº 35', '927678678', '2013-12-05 11:26:16');
INSERT INTO `utentes` VALUES ('miguelserrao@gmail.com', 'Miguel', 'Serrão', 'Rua do Miguel Serrão Nº38', '939873873', '2013-12-15 19:18:59');
INSERT INTO `utentes` VALUES ('pedroeustaquio@gmail.com', 'Pedro', 'Eustáquio', 'Rua do Pedro Eustáquio Nº675', '925451645', '2013-12-02 22:18:49');
INSERT INTO `utentes` VALUES ('pedrosilva@gmail.com', 'Pedro', 'Silva', 'Rua do Pedro Silva Nº97', '912982982', '2013-12-02 20:21:45');
INSERT INTO `utentes` VALUES ('ruiesteves@gmail.com', 'Rui', 'Esteves', 'Rua do Rui Esteves Nº28', '968728728', '2013-12-01 20:04:04');
INSERT INTO `utentes` VALUES ('saradias@gmail.com', 'Sara', 'Dias', 'Rua da Sara Dias Nº29', '918298989', '2013-12-15 19:56:28');
INSERT INTO `utentes` VALUES ('sarajacinta@gmail.com', 'Sara', 'Jacinta', 'Rua da Sara Jacinta Nº27', '911616896', '2013-12-05 12:04:39');
INSERT INTO `utentes` VALUES ('saraneves@gmail.com', 'Sara', 'Neves', 'Rua da Sara Neves Nº231', '912233445', '2013-12-01 20:02:05');
INSERT INTO `utentes` VALUES ('sarasousa@gmail.com', 'Sara', 'Sousa', 'Rua da Sara Sousa Nº298', '929289289', '2013-12-15 19:15:18');
INSERT INTO `utentes` VALUES ('sofiacaramelo@gmail.com', 'Sofia', 'Caramelo', 'Rua da Sofia Caramelo Nº78', '917826786', '2013-12-02 20:25:14');
INSERT INTO `utentes` VALUES ('soniaalpalhao@gmail.com', 'Sónia', 'Alpalhão', 'Rua da Sónia Alpalhão Nº 28', '968817982', '2013-12-06 09:22:11');
INSERT INTO `utentes` VALUES ('teresaguilherme@gmail.com', 'Teresa', 'Guilherme', 'Rua da Teresa Guilherme Nº76', '919816988', '2013-12-01 21:18:35');

-- ----------------------------
-- Table structure for `vantagens`
-- ----------------------------
DROP TABLE IF EXISTS `vantagens`;
CREATE TABLE `vantagens` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `titulo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `conteudo_vantagem` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of vantagens
-- ----------------------------
INSERT INTO `vantagens` VALUES ('1', 'Médicos e técnicos com currículo profissional', 'Não poderia existir qualidade de serviços se não existissem as mais-valias profissionais das pessoas que fazem parte de toda esta equipa. Assim, a Clínica Médica e Dentária do Vale do Tejo preocupou-se desde o seu início em juntar um conjunto de médicos e técnicos com provas dadas, que garantem a qualidade e o bem estar daqueles que depositam a sua confiança.');
INSERT INTO `vantagens` VALUES ('2', 'Escolha dos melhores equipamentos e materiais', 'Porque existe o rigor técnico e humano na aplicação de qualquer serviço prestado, a Pseudo Clínica procura para a segurança dos seus pacientes, os melhores materiais do mercado, garantindo assim a qualidade de todos os seus actos médicos.');
INSERT INTO `vantagens` VALUES ('3', 'Honestidade dos serviços', 'A principal vantagem da empresa.');
INSERT INTO `vantagens` VALUES ('4', 'Marcação rápida de consultas', 'Em qualquer lugar através de email, ou por telefone, poderá marcar préviamente a sua consulta.');
INSERT INTO `vantagens` VALUES ('5', 'Facilidades de pagamento', 'A Pseudo Clínica, desenvolveu soluções de pagamento até 12 meses sem qualquer juro ou entrada, e também parcerias com as maiores entidades bancárias do país no sentido de agelizar e oferecer um conjunto de vantagens exclusivas para os seus clientes.  \r\nContamos com excelentes condições para que possa concretizar o tratamento que tanto necessita, aliviando assim, de uma forma fácil o pagamento mensal dessa obrigação.');

-- ----------------------------
-- View structure for `view_consultas_do_mes_currente`
-- ----------------------------
DROP VIEW IF EXISTS `view_consultas_do_mes_currente`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_consultas_do_mes_currente` AS select `consultas_marcadas`.`id` AS `id`,`consultas_marcadas`.`datetime_confirmacao` AS `datetime_confirmacao`,`consultas_marcadas`.`data_consulta` AS `data_consulta`,`consultas_marcadas`.`hora_consulta` AS `hora_consulta`,`consultas_marcadas`.`medicos_id` AS `medicos_id`,`consultas_marcadas`.`utentes_email` AS `utentes_email` from `consultas_marcadas` where (`consultas_marcadas`.`data_consulta` between date_format(cast(now() as date),'%m/%d/%Y') and date_format(last_day(now()),'%m/%d/%Y')) order by `consultas_marcadas`.`data_consulta`,`consultas_marcadas`.`hora_consulta` ;

-- ----------------------------
-- View structure for `view_consultas_marcadas`
-- ----------------------------
DROP VIEW IF EXISTS `view_consultas_marcadas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_consultas_marcadas` AS select `consultas_marcadas`.`id` AS `id`,`consultas_marcadas`.`datetime_confirmacao` AS `datetime_confirmacao`,`consultas_marcadas`.`data_consulta` AS `data_consulta`,`consultas_marcadas`.`hora_consulta` AS `hora_consulta`,`consultas_marcadas`.`medicos_id` AS `medicos_id`,`especialidades`.`especialidade` AS `especialidade`,`horarios`.`descricao_horario` AS `descricao_horario`,`consultas_marcadas`.`utentes_email` AS `utentes_email` from (((`consultas_marcadas` join `medicos`) join `especialidades`) join `horarios`) where ((`medicos`.`id` = `consultas_marcadas`.`medicos_id`) and (`medicos`.`horarios_id` = `horarios`.`id`) and (`medicos`.`especialidades_id` = `especialidades`.`id`)) order by str_to_date(`consultas_marcadas`.`data_consulta`,'%m/%d/%Y'),`consultas_marcadas`.`hora_consulta` ;

-- ----------------------------
-- View structure for `view_emails_web_marketing`
-- ----------------------------
DROP VIEW IF EXISTS `view_emails_web_marketing`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_emails_web_marketing` AS select `utentes`.`email` AS `email` from `utentes` union select `questoes_online`.`email` AS `email` from `questoes_online` order by `email` ;

-- ----------------------------
-- View structure for `view_historico_consultas_realizadas`
-- ----------------------------
DROP VIEW IF EXISTS `view_historico_consultas_realizadas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_historico_consultas_realizadas` AS select `consultas_realizadas`.`id` AS `id`,`consultas_realizadas`.`datetime_consulta_realizada` AS `datetime_consulta_realizada`,`consultas_realizadas`.`valor_consulta` AS `valor_consulta`,`consultas_realizadas`.`diagnostico` AS `diagnostico`,`consultas_realizadas`.`prescricao` AS `prescricao`,`consultas_realizadas`.`medicos_id` AS `medicos_id`,`especialidades`.`especialidade` AS `especialidade`,`horarios`.`descricao_horario` AS `descricao_horario`,`consultas_realizadas`.`utentes_email` AS `utentes_email` from (((`consultas_realizadas` join `medicos`) join `especialidades`) join `horarios`) where ((`medicos`.`id` = `consultas_realizadas`.`medicos_id`) and (`horarios`.`id` = `medicos`.`horarios_id`) and (`especialidades`.`id` = `medicos`.`especialidades_id`)) order by `consultas_realizadas`.`datetime_consulta_realizada` desc ;

-- ----------------------------
-- View structure for `view_medicos_num_consultas`
-- ----------------------------
DROP VIEW IF EXISTS `view_medicos_num_consultas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_medicos_num_consultas` AS select `medicos`.`primeiro_nome` AS `primeiro_nome`,`medicos`.`ultimo_nome` AS `ultimo_nome`,count(`consultas_marcadas`.`id`) AS `Nº de Consultas Marcadas` from (`medicos` join `consultas_marcadas`) where (`consultas_marcadas`.`medicos_id` = `medicos`.`id`) group by `consultas_marcadas`.`medicos_id` ;

-- ----------------------------
-- View structure for `view_nome_medicos_consultas_marcadas`
-- ----------------------------
DROP VIEW IF EXISTS `view_nome_medicos_consultas_marcadas`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_nome_medicos_consultas_marcadas` AS select distinct `medicos`.`primeiro_nome` AS `primeiro_nome`,`medicos`.`ultimo_nome` AS `ultimo_nome` from (`medicos` join `consultas_marcadas`) where (`consultas_marcadas`.`medicos_id` = `medicos`.`id`) ;

-- ----------------------------
-- View structure for `view_preco_maior_ou_igual_40`
-- ----------------------------
DROP VIEW IF EXISTS `view_preco_maior_ou_igual_40`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_preco_maior_ou_igual_40` AS select `especialidades`.`id` AS `id`,`especialidades`.`especialidade` AS `especialidade`,`especialidades`.`descricao_especialidade` AS `descricao_especialidade`,`especialidades`.`preco_consulta` AS `preco_consulta` from `especialidades` where ((`especialidades`.`preco_consulta` > 40) or (`especialidades`.`preco_consulta` = 40)) ;

-- ----------------------------
-- View structure for `view_telemoveis_96`
-- ----------------------------
DROP VIEW IF EXISTS `view_telemoveis_96`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_telemoveis_96` AS select `utentes`.`email` AS `email`,`utentes`.`primeiro_nome` AS `primeiro_nome`,`utentes`.`ultimo_nome` AS `ultimo_nome`,`utentes`.`morada` AS `morada`,`utentes`.`contacto_tel` AS `contacto_tel`,`utentes`.`datetime_registo` AS `datetime_registo` from `utentes` where (`utentes`.`contacto_tel` like '96%') ;
