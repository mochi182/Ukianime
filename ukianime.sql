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
  `id_categoria` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `url_imagen` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_anime`),
  KEY `FK_anime_categoria` (`id_categoria`),
  CONSTRAINT `FK_anime_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.anime: ~4 rows (approximately)
/*!40000 ALTER TABLE `anime` DISABLE KEYS */;
INSERT INTO `anime` (`id_anime`, `id_categoria`, `nombre`, `descripcion`, `url_imagen`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Haikyuu!', 'Animé de Volleyball a otro nivel.', 'https://vignette.wikia.nocookie.net/haikyuu/images/a/a4/Haikyu_S4.jpg/revision/latest?cb=20200111012854', '2020-07-25 22:31:25', '2020-07-25 22:31:36'),
	(2, 1, 'Rurouni Kenshin', 'Un vagabundo con una cicatriz en la mejilla es un samurai asesino.', 'https://vignette.wikia.nocookie.net/samuraix/images/d/d2/Samurai_x.jpg/revision/latest/scale-to-width-down/340?cb=20121126183437&path-prefix=es', '2020-07-25 22:32:15', '2020-07-25 22:33:07'),
	(3, 1, 'Beastars', 'lalala', 'https://m.media-amazon.com/images/M/MV5BMGZmMjIxYjYtYWE5YS00OWYyLWE5YzUtOTI3YTkxNmQyZDkzXkEyXkFqcGdeQXVyNTY0NDkzNDc@._V1_UY1200_CR109,0,630,1200_AL_.jpg', '2020-07-25 23:20:42', '2020-07-25 23:20:42'),
	(4, 1, 'Meh', 'rororo', 'https://img.taste.com.au/Z2m_6zIt/taste/2016/11/beef-tacos-98153-1.jpeg', '2020-07-26 09:48:18', '2020-07-26 09:48:18');
/*!40000 ALTER TABLE `anime` ENABLE KEYS */;

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
  `nombre` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.categoria: ~6 rows (approximately)
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` (`id_categoria`, `nombre`, `created_at`, `updated_at`) VALUES
	(1, 'Shonen', '2020-07-25 21:59:58', '2020-07-25 21:59:58'),
	(2, 'Seinen', '2020-07-25 22:00:22', '2020-07-25 22:00:22'),
	(3, 'Kodomo', '2020-07-25 22:01:26', '2020-07-25 22:01:26'),
	(4, 'Josei', '2020-07-25 22:01:40', '2020-07-25 22:02:16'),
	(5, 'Mecha', '2020-07-25 22:01:46', '2020-07-25 22:01:46'),
	(6, 'Isekai', '2020-07-25 22:02:33', '2020-07-25 22:02:33');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.rol: ~2 rows (approximately)
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`id_rol`, `nombre`, `created_at`, `updated_at`) VALUES
	(1, 'Administrador', '2020-07-25 22:03:04', '2020-07-25 22:03:04'),
	(2, 'Normal', '2020-07-25 22:03:23', '2020-07-25 22:03:23');
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
  `region` varchar(50) DEFAULT NULL,
  `fecha_nacimiento` varchar(50) DEFAULT NULL,
  `telefono` int(11) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  KEY `FK_usuario_rol` (`id_rol`),
  CONSTRAINT `FK_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.usuario: ~1 rows (approximately)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `usuario`, `contrasena`, `email`, `region`, `fecha_nacimiento`, `telefono`, `id_rol`, `created_at`, `updated_at`) VALUES
	(1, 'Francisco', 'Pérez', 'Pixbae', NULL, NULL, NULL, NULL, NULL, NULL, '2020-07-26 08:05:46', '2020-07-26 08:05:46');
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

-- Dumping structure for table ukianime.usuario_comenta_video
CREATE TABLE IF NOT EXISTS `usuario_comenta_video` (
  `id_usuario` int(11) NOT NULL,
  `id_video` int(11) NOT NULL,
  `texto` text DEFAULT NULL,
  PRIMARY KEY (`id_usuario`,`id_video`),
  KEY `FK_comentario_id_video` (`id_video`),
  CONSTRAINT `FK_comentario_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `FK_comentario_id_video` FOREIGN KEY (`id_video`) REFERENCES `video` (`id_video`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.usuario_comenta_video: ~0 rows (approximately)
/*!40000 ALTER TABLE `usuario_comenta_video` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_comenta_video` ENABLE KEYS */;

-- Dumping structure for table ukianime.video
CREATE TABLE IF NOT EXISTS `video` (
  `id_video` int(11) NOT NULL AUTO_INCREMENT,
  `id_anime` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `episodio` int(11) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `url_video` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_video`),
  KEY `FK__anime` (`id_anime`),
  CONSTRAINT `FK__anime` FOREIGN KEY (`id_anime`) REFERENCES `anime` (`id_anime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.video: ~1 rows (approximately)
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` (`id_video`, `id_anime`, `nombre`, `episodio`, `descripcion`, `url_video`, `created_at`, `updated_at`) VALUES
	(1, 2, 'El vagabundo no se qué', 1, 'Sushi.', 'https://youtu.be/4l0kMNKlQRA', '2020-07-26 08:06:34', '2020-07-26 08:09:45'),
	(2, 2, 'Epidosss', 2, 'JAJAJA', 'https://www.youtube.com/watch?v=vauqRrZlT88', '2020-07-26 10:36:59', '2020-07-26 10:36:59');
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
