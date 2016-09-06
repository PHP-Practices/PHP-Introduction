-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         5.7.9 - MySQL Community Server (GPL)
-- SO del servidor:              Win64
-- HeidiSQL Versión:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Volcando estructura de base de datos para db_agenda
CREATE DATABASE IF NOT EXISTS `db_agenda` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `db_agenda`;


-- Volcando estructura para procedimiento db_agenda.pto_audiencia
DROP PROCEDURE IF EXISTS `pto_audiencia`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pto_audiencia`(IN `pt_action` VARCHAR(50), IN `pt_pk_audiencia` BIGINT, IN `pt_nombre_audiencia` VARCHAR(50), IN `pt_fk_rol` BIGINT)
BEGIN
	CASE pt_action
		WHEN "insert"
			THEN
				INSERT 
					INTO 
						tb_audiencias(fl_nombre_audiencia, fl_fk_rol)
					VALUES (pt_nombre_audiencia, pt_fk_rol);
		WHEN "update"
			THEN
				UPDATE 
					tb_audiencias 
				SET 
					tb_audiencias.fl_nombre_audiencia=pt_nombre_audiencia,
					tb_audiencias.fl_fk_rol=pt_fk_rol
				WHERE TRUE 
					AND tb_audiencias.fl_pk_audiencia=pt_pk_audiencia;
		WHEN "delete"
			THEN
				DELETE FROM 
					tb_audiencias 
				WHERE TRUE 
					AND tb_audiencias.fl_pk_audiencia=pt_pk_audiencia;
		WHEN "selectAll"
			THEN
				SELECT 
					* 
				FROM 
					tb_audiencias;			
	END CASE;
END//
DELIMITER ;


-- Volcando estructura para procedimiento db_agenda.pto_audiencias_jueces
DROP PROCEDURE IF EXISTS `pto_audiencias_jueces`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pto_audiencias_jueces`(IN `pt_action` VARCHAR(50), IN `pt_pk_audiencia_juez` BIGINT, IN `pt_fk_juez_rol` BIGINT, IN `pt_fecha_inicial` VARCHAR(50), IN `pt_fecha_final` VARCHAR(50))
BEGIN
	CASE pt_action
		WHEN "insert"
			THEN
				INSERT 
					INTO 
						tb_audiencias_tb_jueces(fl_fk_juez_rol, fl_fecha_inicial, fl_fecha_final)
					VALUES (pt_fk_juez_rol, pt_fecha_inicial, pt_fecha_final);
		WHEN "update"
			THEN
				UPDATE 
					tb_audiencias_tb_jueces 
				SET 
					tb_audiencias_tb_jueces.fl_fk_juez_rol=pt_fk_juez_rol,
					tb_audiencias_tb_jueces.fl_fecha_inicial=pt_fecha_inicial,
					tb_audiencias_tb_jueces.fl_fecha_final=pt_fecha_final
				WHERE TRUE 
					AND tb_audiencias_tb_jueces.fl_fk_juez_rol=pt_pk_audiencia_juez;
		WHEN "delete"
			THEN
				DELETE FROM 
					tb_audiencias_tb_jueces 
				WHERE TRUE 
					AND tb_audiencias_tb_jueces.fl_pk_audiencia_juez=pt_pk_audiencia_juez;
		WHEN "selectAll"
			THEN
				SELECT 
					* 
				FROM 
					tb_audiencias_tb_jueces;			
	END CASE;
END//
DELIMITER ;


-- Volcando estructura para procedimiento db_agenda.pto_jueces
DROP PROCEDURE IF EXISTS `pto_jueces`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pto_jueces`(IN `pt_action` VARCHAR(50), IN `pt_pk_juez` BIGINT, IN `pt_nombre_juez` VARCHAR(50), IN `pt_apellidos_juez` VARCHAR(50))
BEGIN
	CASE pt_action
		WHEN "insert"
			THEN
				INSERT 
					INTO 
						tb_jueces(fl_nombre_juez, fl_apellidos_juez)
					VALUES (pt_nombre_juez, pt_apellidos_juez);
		WHEN "update"
			THEN
				UPDATE 
					tb_jueces 
				SET 
					tb_jueces.fl_nombre_juez=pt_nombre_juez,
					tb_jueces.fl_apellidos_juez=pt_apellidos_juez
				WHERE TRUE 
					AND tb_jueces.fl_pk_juez=pt_pk_juez;
		WHEN "delete"
			THEN
				DELETE FROM 
					tb_jueces 
				WHERE TRUE 
					AND tb_jueces.fl_pk_juez=pt_pk_juez;
		WHEN "selectAll"
			THEN
				SELECT 
					* 
				FROM 
					tb_jueces;			
	END CASE;
END//
DELIMITER ;


-- Volcando estructura para procedimiento db_agenda.pto_jueces_roles
DROP PROCEDURE IF EXISTS `pto_jueces_roles`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pto_jueces_roles`(IN `pt_action` VARCHAR(50), IN `pt_pk_juez_rol` BIGINT, IN `pt_fk_juez` BIGINT, IN `pt_fk_rol` BIGINT, IN `pt_fecha_inicio` VARCHAR(50), IN `pt_fecha_fin` VARCHAR(50))
BEGIN
	CASE pt_action
		WHEN "insert"
			THEN
				INSERT 
					INTO 
						tb_jueces_tb_roles(fl_fk_juez, fl_fk_rol, fl_fecha_inicio, fl_fecha_fin)
					VALUES (pt_fk_juez, pt_fk_rol, pt_fecha_inicio, pt_fecha_fin);
		WHEN "update"
			THEN
				UPDATE 
					tb_jueces_tb_roles 
				SET 
					tb_jueces_tb_roles.fl_fk_juez=pt_fk_rol,
					tb_jueces_tb_roles.fl_fk_rol=pt_fk_juez,
					tb_jueces_tb_roles.fl_fecha_inicio=pt_fecha_inicio,
					tb_jueces_tb_roles.fl_fecha_fin=pt_fecha_fin
				WHERE TRUE 
					AND tb_jueces_tb_roles.fl_pk_juez_rol=pt_pk_juez_rol;
		WHEN "delete"
			THEN
				DELETE FROM 
					tb_jueces_tb_roles 
				WHERE TRUE 
					AND tb_jueces_tb_roles.fl_pk_juez_rol=pt_pk_juez_rol;
		WHEN "selectAll"
			THEN
				SELECT 
					* 
				FROM 
					tb_jueces_tb_roles;			
	END CASE;
END//
DELIMITER ;


-- Volcando estructura para procedimiento db_agenda.pto_roles
DROP PROCEDURE IF EXISTS `pto_roles`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `pto_roles`(IN `pt_action` VARCHAR(50), IN `pt_pk_rol` BIGINT, IN `pt_tipo_rol` VARCHAR(50))
BEGIN
	CASE pt_action
		WHEN "insert"
			THEN
				INSERT 
					INTO 
						tb_roles(fl_tipo_rol) 
					VALUES (pt_tipo_rol);
		WHEN "update"
			THEN
				UPDATE 
					tb_roles 
				SET 
					fl_tipo_rol=pt_tipo_rol
				WHERE TRUE 
					AND fl_pk_rol=pt_pk_rol;
		WHEN "delete"
			THEN
				DELETE FROM 
					tb_roles 
				WHERE TRUE 
					AND tb_roles.fl_pk_rol=pt_pk_rol;
		WHEN "selectAll"
			THEN
				SELECT 
					* 
				FROM 
					tb_roles;			
	END CASE;
END//
DELIMITER ;


-- Volcando estructura para tabla db_agenda.tb_audiencias
DROP TABLE IF EXISTS `tb_audiencias`;
CREATE TABLE IF NOT EXISTS `tb_audiencias` (
  `fl_pk_audiencia` bigint(20) NOT NULL AUTO_INCREMENT,
  `fl_nombre_audiencia` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fl_fk_rol` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`fl_pk_audiencia`),
  KEY `FK_tb_audiencias_tb_roles` (`fl_fk_rol`),
  CONSTRAINT `FK_tb_audiencias_tb_roles` FOREIGN KEY (`fl_fk_rol`) REFERENCES `tb_roles` (`fl_pk_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_agenda.tb_audiencias: ~2 rows (aproximadamente)
DELETE FROM `tb_audiencias`;
/*!40000 ALTER TABLE `tb_audiencias` DISABLE KEYS */;
INSERT INTO `tb_audiencias` (`fl_pk_audiencia`, `fl_nombre_audiencia`, `fl_fk_rol`) VALUES
	(1, 'Audiencia de control', 1),
	(2, 'Audiencia de juicio', 2);
/*!40000 ALTER TABLE `tb_audiencias` ENABLE KEYS */;


-- Volcando estructura para tabla db_agenda.tb_audiencias_tb_jueces
DROP TABLE IF EXISTS `tb_audiencias_tb_jueces`;
CREATE TABLE IF NOT EXISTS `tb_audiencias_tb_jueces` (
  `fl_pk_audiencia_juez` bigint(20) NOT NULL AUTO_INCREMENT,
  `fl_fk_juez_rol` bigint(20) DEFAULT NULL,
  `fl_fecha_inicial` datetime DEFAULT NULL,
  `fl_fecha_final` datetime DEFAULT NULL,
  PRIMARY KEY (`fl_pk_audiencia_juez`),
  KEY `FK_tb_audiencia_tb_juez_tb_jueces_tb_roles` (`fl_fk_juez_rol`),
  CONSTRAINT `FK_tb_audiencia_tb_juez_tb_jueces_tb_roles` FOREIGN KEY (`fl_fk_juez_rol`) REFERENCES `tb_jueces_tb_roles` (`fl_pk_juez_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_agenda.tb_audiencias_tb_jueces: ~0 rows (aproximadamente)
DELETE FROM `tb_audiencias_tb_jueces`;
/*!40000 ALTER TABLE `tb_audiencias_tb_jueces` DISABLE KEYS */;
INSERT INTO `tb_audiencias_tb_jueces` (`fl_pk_audiencia_juez`, `fl_fk_juez_rol`, `fl_fecha_inicial`, `fl_fecha_final`) VALUES
	(1, 1, '2016-08-29 16:58:25', '2016-10-29 16:58:25');
/*!40000 ALTER TABLE `tb_audiencias_tb_jueces` ENABLE KEYS */;


-- Volcando estructura para tabla db_agenda.tb_jueces
DROP TABLE IF EXISTS `tb_jueces`;
CREATE TABLE IF NOT EXISTS `tb_jueces` (
  `fl_pk_juez` bigint(20) NOT NULL AUTO_INCREMENT,
  `fl_nombre_juez` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  `fl_apellidos_juez` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`fl_pk_juez`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_agenda.tb_jueces: ~0 rows (aproximadamente)
DELETE FROM `tb_jueces`;
/*!40000 ALTER TABLE `tb_jueces` DISABLE KEYS */;
INSERT INTO `tb_jueces` (`fl_pk_juez`, `fl_nombre_juez`, `fl_apellidos_juez`) VALUES
	(1, 'Carlos Antonio', 'Escobar Hernadez');
/*!40000 ALTER TABLE `tb_jueces` ENABLE KEYS */;


-- Volcando estructura para tabla db_agenda.tb_jueces_tb_roles
DROP TABLE IF EXISTS `tb_jueces_tb_roles`;
CREATE TABLE IF NOT EXISTS `tb_jueces_tb_roles` (
  `fl_pk_juez_rol` bigint(20) NOT NULL AUTO_INCREMENT,
  `fl_fk_juez` bigint(20) DEFAULT NULL,
  `fl_fk_rol` bigint(20) DEFAULT NULL,
  `fl_fecha_inicio` datetime DEFAULT NULL,
  `fl_fecha_fin` datetime DEFAULT NULL,
  PRIMARY KEY (`fl_pk_juez_rol`),
  KEY `FK_tb_jueces_tb_roles_tb_jueces` (`fl_fk_juez`),
  KEY `FK_tb_jueces_tb_roles_tb_roles` (`fl_fk_rol`),
  CONSTRAINT `FK_tb_jueces_tb_roles_tb_jueces` FOREIGN KEY (`fl_fk_juez`) REFERENCES `tb_jueces` (`fl_pk_juez`),
  CONSTRAINT `FK_tb_jueces_tb_roles_tb_roles` FOREIGN KEY (`fl_fk_rol`) REFERENCES `tb_roles` (`fl_pk_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_agenda.tb_jueces_tb_roles: ~0 rows (aproximadamente)
DELETE FROM `tb_jueces_tb_roles`;
/*!40000 ALTER TABLE `tb_jueces_tb_roles` DISABLE KEYS */;
INSERT INTO `tb_jueces_tb_roles` (`fl_pk_juez_rol`, `fl_fk_juez`, `fl_fk_rol`, `fl_fecha_inicio`, `fl_fecha_fin`) VALUES
	(1, 1, 1, '2016-08-29 16:57:31', '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `tb_jueces_tb_roles` ENABLE KEYS */;


-- Volcando estructura para tabla db_agenda.tb_roles
DROP TABLE IF EXISTS `tb_roles`;
CREATE TABLE IF NOT EXISTS `tb_roles` (
  `fl_pk_rol` bigint(20) NOT NULL AUTO_INCREMENT,
  `fl_tipo_rol` varchar(50) COLLATE utf8_spanish_ci NOT NULL,
  PRIMARY KEY (`fl_pk_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla db_agenda.tb_roles: ~6 rows (aproximadamente)
DELETE FROM `tb_roles`;
/*!40000 ALTER TABLE `tb_roles` DISABLE KEYS */;
INSERT INTO `tb_roles` (`fl_pk_rol`, `fl_tipo_rol`) VALUES
	(1, 'Juez control'),
	(2, 'Juez juicio'),
	(3, 'XX'),
	(4, 'XX'),
	(5, 'XX'),
	(6, 'XX');
/*!40000 ALTER TABLE `tb_roles` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
