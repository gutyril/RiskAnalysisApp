# ************************************************************
# Sequel Pro SQL dump
# Version 3408
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.23)
# Database: risk_analysis_app
# Generation Time: 2012-07-06 03:54:16 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table auth_group
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table auth_group_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `permission_id_refs_id_a7792de1` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_a7792de1` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table auth_permission
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`)
VALUES
	(1,'Can add permission',1,'add_permission'),
	(2,'Can change permission',1,'change_permission'),
	(3,'Can delete permission',1,'delete_permission'),
	(4,'Can add group',2,'add_group'),
	(5,'Can change group',2,'change_group'),
	(6,'Can delete group',2,'delete_group'),
	(7,'Can add user',3,'add_user'),
	(8,'Can change user',3,'change_user'),
	(9,'Can delete user',3,'delete_user'),
	(10,'Can add content type',4,'add_contenttype'),
	(11,'Can change content type',4,'change_contenttype'),
	(12,'Can delete content type',4,'delete_contenttype'),
	(13,'Can add session',5,'add_session'),
	(14,'Can change session',5,'change_session'),
	(15,'Can delete session',5,'delete_session'),
	(16,'Can add log entry',6,'add_logentry'),
	(17,'Can change log entry',6,'change_logentry'),
	(18,'Can delete log entry',6,'delete_logentry'),
	(37,'Can add tipo_de_ proyecto',13,'add_tipo_de_proyecto'),
	(38,'Can change tipo_de_ proyecto',13,'change_tipo_de_proyecto'),
	(39,'Can delete tipo_de_ proyecto',13,'delete_tipo_de_proyecto'),
	(40,'Can add proyecto',14,'add_proyecto'),
	(41,'Can change proyecto',14,'change_proyecto'),
	(42,'Can delete proyecto',14,'delete_proyecto'),
	(49,'Can add riesgo',17,'add_riesgo'),
	(50,'Can change riesgo',17,'change_riesgo'),
	(51,'Can delete riesgo',17,'delete_riesgo'),
	(52,'Can add intengrante',18,'add_intengrante'),
	(53,'Can change intengrante',18,'change_intengrante'),
	(54,'Can delete intengrante',18,'delete_intengrante'),
	(55,'Can add categoria_de_riesgo',19,'add_categoria_de_riesgo'),
	(56,'Can change categoria_de_riesgo',19,'change_categoria_de_riesgo'),
	(57,'Can delete categoria_de_riesgo',19,'delete_categoria_de_riesgo'),
	(58,'Can add tipo_de_riesgo',20,'add_tipo_de_riesgo'),
	(59,'Can change tipo_de_riesgo',20,'change_tipo_de_riesgo'),
	(60,'Can delete tipo_de_riesgo',20,'delete_tipo_de_riesgo');

/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `auth_user` WRITE;

/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table auth_user_groups
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `group_id_refs_id_f0ee9890` (`group_id`),
  CONSTRAINT `group_id_refs_id_f0ee9890` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_831107f1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table auth_user_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `permission_id_refs_id_67e79cb` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_f2045483` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table django_admin_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_refs_id_c8665aa` (`user_id`),
  KEY `content_type_id_refs_id_288599e6` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`)
VALUES
	(5,'2012-06-23 20:35:25',1,13,'1','Mobil',1,''),
	(6,'2012-06-23 20:41:22',1,14,'2','Aplicación Mobil Akky',1,''),
	(7,'2012-06-23 20:42:18',1,13,'3','Web',1,''),
	(8,'2012-06-23 20:42:26',1,14,'3','Aplicación de reuso de dominios',1,''),
	(9,'2012-06-26 01:26:13',1,20,'1','Tipo_de_riesgo object',1,''),
	(10,'2012-06-26 01:26:28',1,19,'1','Categoria_de_riesgo object',1,''),
	(11,'2012-06-26 01:26:33',1,17,'1','Riesgo object',1,''),
	(12,'2012-06-26 02:03:25',1,20,'2','Curva de aprendizaje larga',1,''),
	(13,'2012-06-26 02:03:30',1,17,'2','Riesgo object',1,''),
	(14,'2012-07-02 01:44:15',1,19,'2','Implicaciones Ambientales',1,''),
	(15,'2012-07-02 01:57:19',1,20,'3','Huracanes devastadores',1,''),
	(16,'2012-07-02 01:57:29',1,17,'3','Huracanes devastadores',1,''),
	(17,'2012-07-02 01:58:43',1,20,'4','Incendios en los servidores',1,''),
	(18,'2012-07-02 01:58:47',1,17,'4','Incendios en los servidores',1,''),
	(19,'2012-07-02 05:04:06',1,13,'1','tipo 1',1,''),
	(20,'2012-07-02 05:04:17',1,14,'1','Proyecto 1',1,''),
	(21,'2012-07-02 05:04:29',1,14,'2','Aplicación Mobil Akky',1,''),
	(22,'2012-07-02 05:05:15',1,20,'1','riesgo 1',1,''),
	(23,'2012-07-02 05:05:27',1,19,'1','categoria 1',1,''),
	(24,'2012-07-02 05:05:33',1,17,'1','riesgo 1',1,''),
	(25,'2012-07-02 05:05:50',1,20,'2','Riesgo 2',1,''),
	(26,'2012-07-02 05:06:01',1,17,'2','Riesgo 2',1,''),
	(27,'2012-07-02 05:06:31',1,20,'3','Riesgo 3',1,''),
	(28,'2012-07-02 05:06:44',1,19,'2','Categoria 2',1,''),
	(29,'2012-07-02 05:06:51',1,17,'3','Riesgo 3',1,''),
	(30,'2012-07-02 05:07:05',1,20,'4','Riesgo 4',1,''),
	(31,'2012-07-02 05:07:09',1,17,'4','Riesgo 4',1,''),
	(32,'2012-07-02 05:07:36',1,17,'5','riesgo 1',1,''),
	(33,'2012-07-02 05:07:58',1,17,'6','Riesgo 2',1,''),
	(34,'2012-07-02 05:08:12',1,17,'7','Riesgo 3',1,''),
	(35,'2012-07-02 05:08:22',1,17,'8','Riesgo 4',1,''),
	(36,'2012-07-03 00:45:21',1,14,'3','Proyecto 3',1,''),
	(37,'2012-07-03 00:46:24',1,17,'9','riesgo 1',1,''),
	(38,'2012-07-03 00:46:32',1,17,'10','Riesgo 2',1,''),
	(39,'2012-07-03 00:46:48',1,17,'11','Riesgo 3',1,''),
	(40,'2012-07-03 00:47:00',1,17,'12','Riesgo 4',1,''),
	(41,'2012-07-03 00:48:08',1,14,'4','Proyecto 4',1,''),
	(42,'2012-07-03 01:20:13',1,19,'1','categoria 1',1,''),
	(43,'2012-07-03 01:20:16',1,20,'1','Riesgo 1',1,''),
	(44,'2012-07-03 01:20:42',1,20,'2','Riesgo 2',1,''),
	(45,'2012-07-03 01:20:54',1,19,'2','Categoria 2',1,''),
	(46,'2012-07-03 01:20:57',1,20,'3','Riesgo 3',1,''),
	(47,'2012-07-03 01:21:07',1,20,'4','Riesgo 4',1,''),
	(48,'2012-07-03 01:22:14',1,13,'1','tipo de proyesto 1',1,''),
	(49,'2012-07-03 01:22:31',1,14,'1','Proyecto 1',1,''),
	(50,'2012-07-03 01:22:57',1,14,'2','Proyecto 2',1,''),
	(51,'2012-07-03 01:54:58',1,19,'1','Seguridad',1,''),
	(52,'2012-07-03 01:55:12',1,20,'1','Negacion de servicios',1,''),
	(53,'2012-07-03 01:55:12',1,20,'2','Negacion de servicios',1,''),
	(54,'2012-07-03 01:55:32',1,20,'2','Negacion de servicios',3,''),
	(55,'2012-07-03 01:59:00',1,19,'1','Seguridad',1,''),
	(56,'2012-07-03 01:59:04',1,20,'1','Negación de servicios',1,''),
	(57,'2012-07-03 01:59:22',1,19,'2','Configuración',1,''),
	(58,'2012-07-03 01:59:25',1,20,'2','Gestión inapropiada de permisos',1,''),
	(59,'2012-07-03 01:59:32',1,20,'3','Virus',1,''),
	(60,'2012-07-03 01:59:48',1,20,'4','Vulnerabilidades de software',1,''),
	(61,'2012-07-03 02:00:10',1,19,'3','Empleados',1,''),
	(62,'2012-07-03 02:00:11',1,20,'5','Falta de experiencia en metodología de desarrollo',1,''),
	(63,'2012-07-03 02:00:27',1,20,'6','Uso inapropiado de equipo',1,''),
	(64,'2012-07-03 02:00:50',1,19,'4','Infraestructura Tecnológica',1,''),
	(65,'2012-07-03 02:00:51',1,20,'7','Factores ambientales',1,''),
	(66,'2012-07-03 02:01:11',1,19,'5','Documentación',1,''),
	(67,'2012-07-03 02:01:12',1,20,'8','Violación de derechos de autor',1,''),
	(68,'2012-07-03 02:01:20',1,20,'9','Falta de personal',1,''),
	(69,'2012-07-03 02:01:28',1,20,'10','Fallas de red',1,''),
	(70,'2012-07-03 02:01:48',1,20,'11','Ambientes de desarrollo no disponibles',1,''),
	(71,'2012-07-03 02:01:59',1,20,'12','Ambiente de pruebas no disponible',1,''),
	(72,'2012-07-03 02:02:09',1,20,'13','Credenciales no autorizadas',1,''),
	(73,'2012-07-03 02:02:25',1,20,'14','Documentación insuficiente',1,''),
	(74,'2012-07-03 02:02:34',1,20,'15','Falta de equipos',1,''),
	(75,'2012-07-03 02:02:56',1,19,'6','Administración de proyectos',1,''),
	(76,'2012-07-03 02:02:58',1,20,'16','Requerimientos mal definidos',1,''),
	(77,'2012-07-03 02:03:17',1,20,'17','Misión y visión no comprendida',1,''),
	(78,'2012-07-03 02:03:30',1,20,'18','Cambios en requerimientos',1,''),
	(79,'2012-07-03 02:03:45',1,20,'19','Falta de capacitación',1,''),
	(80,'2012-07-03 02:03:55',1,20,'20','Fallas de diseño',1,''),
	(81,'2012-07-03 02:04:10',1,20,'21','Mala estimación de tiempo, alcance y costo',1,''),
	(82,'2012-07-03 02:04:25',1,20,'22','Falta de soporte en tecnología utilizada',1,''),
	(83,'2012-07-03 02:04:41',1,20,'23','Entregas a destiempo de herramientas necesarias',1,''),
	(84,'2012-07-03 02:04:51',1,20,'24','Rotación de personal',1,''),
	(85,'2012-07-03 02:04:59',1,20,'25','Perdida de datos o código',1,''),
	(86,'2012-07-03 02:05:13',1,20,'26','Vulnerabilidades de base de datos',1,''),
	(87,'2012-07-03 02:05:27',1,20,'27','Curva de aprendizaje mal estimada',1,''),
	(88,'2012-07-03 02:06:10',1,20,'28','Accesos a datos de producción',1,''),
	(89,'2012-07-03 02:06:22',1,20,'29','Monitoreo insuficiente de métricas de seguridad',1,''),
	(90,'2012-07-03 02:06:48',1,20,'30','Falta de retroalimentación de cliente',1,''),
	(91,'2012-07-03 02:09:37',1,14,'1','Marketplace dominios',1,''),
	(92,'2012-07-03 02:15:48',1,14,'2','Capacitación PYMEs',1,''),
	(93,'2012-07-03 19:47:18',1,14,'3','Registro de dominios .COM',1,''),
	(94,'2012-07-03 19:49:03',1,14,'3','Registro dominios .COM',2,'Modifica nombre.'),
	(95,'2012-07-03 20:03:15',1,14,'4','Aplicación Movil Akky',1,''),
	(96,'2012-07-03 20:22:27',1,14,'5','DNSSEC',1,''),
	(97,'2012-07-03 20:45:52',1,14,'6','DNSSEC Administrador',1,''),
	(98,'2012-07-03 22:34:16',1,14,'5','DNSSEC Gerente',2,'Modifica nombre.'),
	(99,'2012-07-03 22:42:59',1,14,'3','Registro dominios .COM',3,''),
	(100,'2012-07-04 01:11:12',1,14,'7','Proyecto Nuevo',1,'');

/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_content_type
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`)
VALUES
	(1,'permission','auth','permission'),
	(2,'group','auth','group'),
	(3,'user','auth','user'),
	(4,'content type','contenttypes','contenttype'),
	(5,'session','sessions','session'),
	(6,'log entry','admin','logentry'),
	(13,'tipo_de_ proyecto','projects','tipo_de_proyecto'),
	(14,'proyecto','projects','proyecto'),
	(17,'riesgo','projects','riesgo'),
	(18,'intengrante','projects','intengrante'),
	(19,'categoria_de_riesgo','projects','categoria_de_riesgo'),
	(20,'tipo_de_riesgo','projects','tipo_de_riesgo');

/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table django_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`)
VALUES
	('23a67e1841d6bdadc26bf1cc9ae3cb49','MTViODZiMDY5MGUyOWIzZTJhZmQ0OTIzNGY5ODcxZmVlZTQ0ZmRmNTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-07-07 00:39:39'),
	('b18b1445700cb90545dd2c60f95f2db6','MTViODZiMDY5MGUyOWIzZTJhZmQ0OTIzNGY5ODcxZmVlZTQ0ZmRmNTqAAn1xAShVEl9hdXRoX3Vz\nZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHED\nVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==\n','2012-07-17 19:46:17');

/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects_categoria_de_riesgo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projects_categoria_de_riesgo`;

CREATE TABLE `projects_categoria_de_riesgo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `projects_categoria_de_riesgo` WRITE;
/*!40000 ALTER TABLE `projects_categoria_de_riesgo` DISABLE KEYS */;

INSERT INTO `projects_categoria_de_riesgo` (`id`, `nombre`)
VALUES
	(1,'Seguridad'),
	(2,'Configuración'),
	(3,'Empleados'),
	(4,'Infraestructura Tecnológica'),
	(5,'Documentación'),
	(6,'Administración de proyectos');

/*!40000 ALTER TABLE `projects_categoria_de_riesgo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects_intengrante
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projects_intengrante`;

CREATE TABLE `projects_intengrante` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `puesto` varchar(30) NOT NULL,
  `proyecto_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_intengrante_cf4ad9cb` (`proyecto_id`),
  CONSTRAINT `proyecto_id_refs_id_4cf88baa` FOREIGN KEY (`proyecto_id`) REFERENCES `projects_proyecto` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table projects_proyecto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projects_proyecto`;

CREATE TABLE `projects_proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `fecha_de_inicio` datetime NOT NULL,
  `fecha_de_termino` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table projects_riesgo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projects_riesgo`;

CREATE TABLE `projects_riesgo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proyecto_id` int(11) NOT NULL,
  `tipo_de_riesgo_id` int(11) NOT NULL,
  `impacto` int(11) NOT NULL,
  `probabilidad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `proyecto_id` (`proyecto_id`,`tipo_de_riesgo_id`),
  KEY `projects_riesgo_cf4ad9cb` (`proyecto_id`),
  KEY `projects_riesgo_fe4d81c` (`tipo_de_riesgo_id`),
  CONSTRAINT `proyecto_id_refs_id_10894a89` FOREIGN KEY (`proyecto_id`) REFERENCES `projects_proyecto` (`id`),
  CONSTRAINT `tipo_de_riesgo_id_refs_id_f32665b0` FOREIGN KEY (`tipo_de_riesgo_id`) REFERENCES `projects_tipo_de_riesgo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `projects_riesgo` WRITE;
/*!40000 ALTER TABLE `projects_riesgo` DISABLE KEYS */;

INSERT INTO `projects_riesgo` (`id`, `proyecto_id`, `tipo_de_riesgo_id`, `impacto`, `probabilidad`)
VALUES
	(1,1,1,3,4),
	(2,1,2,0,4),
	(3,1,3,2,3),
	(4,1,4,3,3),
	(5,1,5,1,3),
	(6,1,6,3,2),
	(7,1,7,3,3),
	(8,1,8,3,2),
	(9,1,9,4,3),
	(10,1,10,1,4),
	(11,1,11,3,4),
	(12,1,12,2,2),
	(13,1,13,3,2),
	(14,1,14,4,4),
	(15,1,15,2,2),
	(16,1,16,2,4),
	(17,1,17,2,3),
	(18,1,18,2,4),
	(19,1,19,4,2),
	(20,1,20,1,4),
	(21,1,21,4,2),
	(22,1,22,1,1),
	(23,1,23,2,2),
	(24,1,24,4,4),
	(25,1,25,2,4),
	(26,1,26,3,3),
	(27,1,27,3,3),
	(28,1,28,2,0),
	(29,1,29,2,2),
	(30,1,30,3,1),
	(31,2,1,4,2),
	(32,2,2,4,3),
	(33,2,3,4,2),
	(34,2,4,4,2),
	(35,2,5,4,4),
	(36,2,6,4,2),
	(37,2,7,4,4),
	(38,2,8,4,4),
	(39,2,9,4,3),
	(40,2,10,4,4),
	(41,2,11,4,2),
	(42,2,12,4,3),
	(43,2,13,4,4),
	(44,2,14,4,4),
	(45,2,15,4,3),
	(46,2,16,4,4),
	(47,2,17,4,4),
	(48,2,18,4,2),
	(49,2,19,4,4),
	(50,2,20,4,2),
	(51,2,21,4,4),
	(52,2,22,4,3),
	(53,2,23,4,4),
	(54,2,24,4,2),
	(55,2,25,4,2),
	(56,2,26,4,2),
	(57,2,27,4,4),
	(58,2,28,4,4),
	(59,2,29,4,2),
	(60,2,30,4,4),
	(61,4,1,1,1),
	(62,4,2,1,1),
	(63,4,3,1,1),
	(64,4,4,1,3),
	(65,4,5,3,4),
	(66,4,6,1,2),
	(67,4,7,1,1),
	(68,4,8,1,1),
	(69,4,9,0,0),
	(70,4,10,2,2),
	(71,4,11,4,4),
	(72,4,12,4,3),
	(73,4,13,1,1),
	(74,4,14,2,3),
	(75,4,15,4,3),
	(76,4,16,3,3),
	(77,4,17,0,0),
	(78,4,18,1,1),
	(79,4,19,3,3),
	(80,4,20,2,2),
	(81,4,21,4,4),
	(82,4,22,3,3),
	(83,4,23,3,3),
	(84,4,24,4,1),
	(85,4,25,0,0),
	(86,4,26,4,1),
	(87,4,27,4,4),
	(88,4,28,0,0),
	(89,4,29,0,0),
	(90,4,30,1,1),
	(91,5,1,3,1),
	(92,5,2,3,2),
	(93,5,3,4,1),
	(94,5,4,3,2),
	(95,5,5,3,2),
	(96,5,6,2,1),
	(97,5,7,2,2),
	(98,5,8,3,1),
	(99,5,9,3,2),
	(100,5,10,2,2),
	(101,5,11,2,4),
	(102,5,12,2,4),
	(103,5,13,3,2),
	(104,5,14,2,3),
	(105,5,15,1,1),
	(106,5,16,3,3),
	(107,5,17,2,3),
	(108,5,18,3,4),
	(109,5,19,2,1),
	(110,5,20,2,3),
	(111,5,21,3,4),
	(112,5,22,2,1),
	(113,5,23,2,4),
	(114,5,24,3,2),
	(115,5,25,4,2),
	(116,5,26,4,1),
	(117,5,27,2,3),
	(118,5,28,4,1),
	(119,5,29,2,2),
	(120,5,30,3,3),
	(121,6,1,3,2),
	(122,6,2,2,3),
	(123,6,3,0,0),
	(124,6,4,0,0),
	(125,6,5,2,3),
	(126,6,6,1,2),
	(127,6,7,0,0),
	(128,6,8,0,0),
	(129,6,9,3,2),
	(130,6,10,3,3),
	(131,6,11,2,3),
	(132,6,12,2,3),
	(133,6,13,3,2),
	(134,6,14,3,2),
	(135,6,15,4,2),
	(136,6,16,3,2),
	(137,6,17,2,2),
	(138,6,18,2,3),
	(139,6,19,3,3),
	(140,6,20,2,3),
	(141,6,21,2,3),
	(142,6,22,2,3),
	(143,6,23,2,3),
	(144,6,24,4,2),
	(145,6,25,3,2),
	(146,6,26,3,3),
	(147,6,27,2,3),
	(148,6,28,1,1),
	(149,6,29,4,3),
	(150,6,30,3,3),
	(151,7,1,3,4),
	(152,7,2,2,3),
	(153,7,3,2,0),
	(154,7,4,0,3),
	(155,7,5,2,4),
	(156,7,6,3,2),
	(157,7,7,1,1),
	(158,7,8,1,4),
	(159,7,9,3,1),
	(160,7,10,2,2),
	(161,7,11,1,2),
	(162,7,12,1,3),
	(163,7,13,3,1),
	(164,7,14,1,4),
	(165,7,15,3,3),
	(166,7,16,0,0),
	(167,7,17,0,0),
	(168,7,18,0,0),
	(169,7,19,2,2),
	(170,7,20,0,0),
	(171,7,21,1,4),
	(172,7,22,4,4),
	(173,7,23,3,4),
	(174,7,24,1,3),
	(175,7,25,1,2),
	(176,7,26,2,0),
	(177,7,27,2,3),
	(178,7,28,2,0),
	(179,7,29,1,3),
	(180,7,30,2,4);

/*!40000 ALTER TABLE `projects_riesgo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table projects_tipo_de_proyecto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projects_tipo_de_proyecto`;

CREATE TABLE `projects_tipo_de_proyecto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Dump of table projects_tipo_de_riesgo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projects_tipo_de_riesgo`;

CREATE TABLE `projects_tipo_de_riesgo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `factor` double NOT NULL,
  `categoria_de_riesgo_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `projects_tipo_de_riesgo_3ad75d4e` (`categoria_de_riesgo_id`),
  CONSTRAINT `categoria_de_riesgo_id_refs_id_c0bdd9cb` FOREIGN KEY (`categoria_de_riesgo_id`) REFERENCES `projects_categoria_de_riesgo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `projects_tipo_de_riesgo` WRITE;
/*!40000 ALTER TABLE `projects_tipo_de_riesgo` DISABLE KEYS */;

INSERT INTO `projects_tipo_de_riesgo` (`id`, `nombre`, `factor`, `categoria_de_riesgo_id`)
VALUES
	(1,'Negación de servicios',1,1),
	(2,'Gestión inapropiada de permisos',1,2),
	(3,'Virus',1,1),
	(4,'Vulnerabilidades de software',1,1),
	(5,'Falta de experiencia en metodología de desarrollo',0.5,3),
	(6,'Uso inapropiado de equipo',0.5,3),
	(7,'Factores ambientales',1,4),
	(8,'Violación de derechos de autor',0.75,5),
	(9,'Falta de personal',1,3),
	(10,'Fallas de red',1,4),
	(11,'Ambientes de desarrollo no disponibles',0.5,2),
	(12,'Ambiente de pruebas no disponible',0.5,2),
	(13,'Credenciales no autorizadas',1,2),
	(14,'Documentación insuficiente',0.75,5),
	(15,'Falta de equipos',0.5,4),
	(16,'Requerimientos mal definidos',0.75,6),
	(17,'Misión y visión no comprendida',0.5,6),
	(18,'Cambios en requerimientos',0.5,6),
	(19,'Falta de capacitación',0.5,3),
	(20,'Fallas de diseño',0.75,6),
	(21,'Mala estimación de tiempo, alcance y costo',1,6),
	(22,'Falta de soporte en tecnología utilizada',0.75,4),
	(23,'Entregas a destiempo de herramientas necesarias',0.75,4),
	(24,'Rotación de personal',1,3),
	(25,'Perdida de datos o código',1,1),
	(26,'Vulnerabilidades de base de datos',1,1),
	(27,'Curva de aprendizaje mal estimada',0.75,4),
	(28,'Accesos a datos de producción',1,3),
	(29,'Monitoreo insuficiente de métricas de seguridad',1,1),
	(30,'Falta de retroalimentación de cliente',0.75,6);

/*!40000 ALTER TABLE `projects_tipo_de_riesgo` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
