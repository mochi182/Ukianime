-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.7-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for ukianime
CREATE DATABASE IF NOT EXISTS `ukianime` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ukianime`;

-- Dumping structure for table ukianime.anime
CREATE TABLE IF NOT EXISTS `anime` (
  `id_anime` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `url_imagen` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_anime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.anime: ~0 rows (approximately)
/*!40000 ALTER TABLE `anime` DISABLE KEYS */;
/*!40000 ALTER TABLE `anime` ENABLE KEYS */;

-- Dumping structure for table ukianime.anime_tiene_categoria
CREATE TABLE IF NOT EXISTS `anime_tiene_categoria` (
  `id_anime` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_anime`,`id_categoria`),
  KEY `FK_anime_categoria_id_categoria` (`id_categoria`),
  CONSTRAINT `FK_anime_categoria_id_anime` FOREIGN KEY (`id_anime`) REFERENCES `anime` (`id_anime`),
  CONSTRAINT `FK_anime_categoria_id_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.anime_tiene_categoria: ~0 rows (approximately)
/*!40000 ALTER TABLE `anime_tiene_categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `anime_tiene_categoria` ENABLE KEYS */;

-- Dumping structure for table ukianime.anime_tiene_tag
CREATE TABLE IF NOT EXISTS `anime_tiene_tag` (
  `id_anime` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL,
  PRIMARY KEY (`id_anime`,`id_tag`),
  KEY `FK_anime_tag_id_anime` (`id_tag`),
  CONSTRAINT `FK_anime_tag_id_anime` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id_tag`),
  CONSTRAINT `FK_anime_tag_id_tag` FOREIGN KEY (`id_anime`) REFERENCES `anime` (`id_anime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.anime_tiene_tag: ~0 rows (approximately)
/*!40000 ALTER TABLE `anime_tiene_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `anime_tiene_tag` ENABLE KEYS */;

-- Dumping structure for table ukianime.categoria
CREATE TABLE IF NOT EXISTS `categoria` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.categoria: ~0 rows (approximately)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;

-- Dumping structure for table ukianime.grupo
CREATE TABLE IF NOT EXISTS `grupo` (
  `id_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `id_usuario_1` int(11) DEFAULT NULL,
  `id_usuario_2` int(11) DEFAULT NULL,
  `id_usuario_3` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_grupo`),
  KEY `FK_grupo_usuario` (`id_usuario_1`),
  KEY `FK_grupo_usuario_2` (`id_usuario_2`),
  KEY `FK_grupo_usuario_3` (`id_usuario_3`),
  CONSTRAINT `FK_grupo_usuario` FOREIGN KEY (`id_usuario_1`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_grupo_usuario_2` FOREIGN KEY (`id_usuario_2`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_grupo_usuario_3` FOREIGN KEY (`id_usuario_3`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.grupo: ~0 rows (approximately)
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;

-- Dumping structure for table ukianime.info_de_pago
CREATE TABLE IF NOT EXISTS `info_de_pago` (
  `id_info_de_pago` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `tipo_de_cuenta` varchar(50) DEFAULT NULL,
  `metodo_de_pago` varchar(50) DEFAULT NULL,
  `tarjeta` varchar(50) DEFAULT NULL,
  `codigo_de_seguridad` int(11) DEFAULT NULL,
  `fecha_de_expiracion` varchar(50) DEFAULT NULL,
  `forma_de_cobro` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_info_de_pago`),
  KEY `FK__usuario` (`id_usuario`),
  CONSTRAINT `FK__usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.info_de_pago: ~0 rows (approximately)
/*!40000 ALTER TABLE `info_de_pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `info_de_pago` ENABLE KEYS */;

-- Dumping structure for table ukianime.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.rol: ~0 rows (approximately)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;

-- Dumping structure for table ukianime.tag
CREATE TABLE IF NOT EXISTS `tag` (
  `id_tag` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.tag: ~0 rows (approximately)
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;

-- Dumping structure for table ukianime.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `apellido` varchar(50) DEFAULT NULL,
  `usuario` varchar(50) DEFAULT NULL,
  `contrasena` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `idioma` varchar(50) DEFAULT NULL,
  `pais` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  KEY `FK_usuario_rol` (`id_rol`),
  CONSTRAINT `FK_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.usuario: ~0 rows (approximately)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Dumping structure for table ukianime.usuario_agrega_video
CREATE TABLE IF NOT EXISTS `usuario_agrega_video` (
  `id_usuario` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_video`),
  KEY `FK_usuario_video_id_video` (`id_video`),
  CONSTRAINT `FK_usuario_video_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_usuario_video_id_video` FOREIGN KEY (`id_video`) REFERENCES `video` (`id_video`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.usuario_agrega_video: ~0 rows (approximately)
/*!40000 ALTER TABLE `usuario_agrega_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_agrega_video` ENABLE KEYS */;

-- Dumping structure for table ukianime.video
CREATE TABLE IF NOT EXISTS `video` (
  `id_video` int(11) NOT NULL AUTO_INCREMENT,
  `id_anime` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `url_imagen` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_video`),
  KEY `FK__anime` (`id_anime`),
  CONSTRAINT `FK__anime` FOREIGN KEY (`id_anime`) REFERENCES `anime` (`id_anime`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.video: ~0 rows (approximately)
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;

-- Dumping structure for table ukianime.video_tiene_tag
CREATE TABLE IF NOT EXISTS `video_tiene_tag` (
  `id_video` int(11) NOT NULL,
  `id_tag` int(11) NOT NULL,
  PRIMARY KEY (`id_video`,`id_tag`),
  KEY `FK_video_tag_id_tag` (`id_tag`),
  CONSTRAINT `FK_video_tag_id_tag` FOREIGN KEY (`id_tag`) REFERENCES `tag` (`id_tag`),
  CONSTRAINT `FK_video_tag_id_video` FOREIGN KEY (`id_video`) REFERENCES `video` (`id_video`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.video_tiene_tag: ~0 rows (approximately)
/*!40000 ALTER TABLE `video_tiene_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `video_tiene_tag` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
