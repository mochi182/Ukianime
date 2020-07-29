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
  CONSTRAINT `FK_anime_categoria` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.anime: ~49 rows (approximately)
/*!40000 ALTER TABLE `anime` DISABLE KEYS */;
INSERT INTO `anime` (`id_anime`, `id_categoria`, `nombre`, `descripcion`, `url_imagen`, `created_at`, `updated_at`) VALUES
	(1, 5, 'Haikyuu! ANIME', 'La historia volleyball.', 'https://vignette.wikia.nocookie.net/haikyuu/images/a/a4/Haikyu_S4.jpg/revision/latest?cb=20200111012854', '2020-07-25 22:31:25', '2020-07-29 16:13:42'),
	(2, 1, 'Rurouni Kenshin', 'Un vagabundo con una cicatriz en la mejilla es un samurai asesino.', 'https://vignette.wikia.nocookie.net/samuraix/images/d/d2/Samurai_x.jpg/revision/latest/scale-to-width-down/340?cb=20121126183437&path-prefix=es', '2020-07-25 22:32:15', '2020-07-25 22:33:07'),
	(3, 1, 'Beastars', 'lalala', 'https://m.media-amazon.com/images/M/MV5BMGZmMjIxYjYtYWE5YS00OWYyLWE5YzUtOTI3YTkxNmQyZDkzXkEyXkFqcGdeQXVyNTY0NDkzNDc@._V1_UY1200_CR109,0,630,1200_AL_.jpg', '2020-07-25 23:20:42', '2020-07-25 23:20:42'),
	(4, 1, 'One Piece', 'One Piece.', 'https://www.animefagos.com/wp-content/uploads/2019/03/onepiecereverie01.jpg', '2020-07-29 02:13:23', '2020-07-29 18:32:27'),
	(6, 1, 'Bleach', 'Con tan sÃ³lo quince aÃ±os Ichigo Kurosaki es un tÃ­pico adolescente con habilidades de combate, dos hermanas \r\nque cuidar y un rasgo especial: puede ver fantasmas. Sin embargo, cuando Ichigo y su familia se encuentran \r\nbajo el ataque de una enorme bestia, el chaval descubre que hay mucho mÃ¡s en el mundo sobrenatural que en \r\nel real. EspÃ­ritus vengativos conocidos como Huecos recorren el mundo en busca de almas que devorar.', 'http://omegacenter.es/blog/wp-content/uploads/2016/08/bleachanime.jpg', '2020-07-29 02:18:48', '2020-07-29 02:27:46'),
	(7, 2, 'Neon Genesis Evangelion', 'El mundo del anime estÃ¡ lleno de historias protagonizadas por mechas pero ninguna serie se acerca a \r\nlo que Neon Genesis Evangelion consiguiÃ³ cuando llegÃ³ a la pantalla por primera vez. Lo que comienza \r\ncomo una serie de acciÃ³n y robots se convierte en una mezcla trascendental de religiÃ³n, filosofÃ­a y psicologÃ­a.', 'http://omegacenter.es/blog/wp-content/uploads/2016/08/evangelionanime.jpg', '2020-07-29 02:24:33', '2020-07-29 02:27:49'),
	(8, 4, 'Samurai Champloo', 'Es uno de los animes mejor diseÃ±ados, con un protagonista basado en el funky y el hip-hop que vive\r\n una historia divertida y que engancha.', 'https://i.pinimg.com/564x/07/b3/01/07b3010b74aa5ab9723b8823bd5de7f8.jpg', '2020-07-29 02:39:38', '2020-07-29 02:50:11'),
	(9, 5, 'Fullmetal Alchemist', 'Combinando la RevoluciÃ³n Industrial europea y con una historia de aventuras, Fullmetal Alchemist \r\nes otro popular anime que tiene el espÃ­ritu y argumento necesarios para cualquier gran obra. Edward \r\ny Alphonse son dos hermanos que estÃ¡n buscando desesperadamente la piedra filosofal para restaurar \r\nsus cuerpos despuÃ©s de un experimento fallido para revivir a su madre. Las andanzas de este dÃºo se \r\nconvierten en un anime de lo mÃ¡s entretenido.', 'https://k62.kn3.net/taringa/1/E/6/4/2/B/GeraMorales1/550x1047_D6F.jpg', '2020-07-29 02:51:37', '2020-07-29 02:56:32'),
	(10, 3, 'Code Geass', 'Cuando un niÃ±o aparentemente normal adquiere la capacidad de controlar a la gente para hacer su \r\nvoluntad, usa este poder para derribar el imperio de la poderosa Britannia que se ha hecho cargo \r\nde todo el planeta. Code Geass es como una partida de ajedrez y se basa en la guerra psicolÃ³gica y l\r\nuchas intensas entre mechas para crear una historia que puede cautivar a cualquier espectador.', 'https://vignette.wikia.nocookie.net/codegeass/images/a/af/Lelouch_of_the_Rebellion.png/revision/latest?cb=20161217124012&path-prefix=es', '2020-07-29 02:52:45', '2020-07-29 02:56:35'),
	(11, 3, 'Baccano', 'eeeeeeeeeeeeeee', 'https://i.pinimg.com/originals/74/3a/05/743a05cef7af97714e344ab069d0df7c.jpg', '2020-07-29 02:55:35', '2020-07-29 02:56:37'),
	(12, 6, 'Sayonara zetsubÃ´ sensei', 'adadweqweqweqw', 'https://ikzer.files.wordpress.com/2012/08/sayonarazetsubov30.jpg', '2020-07-29 03:30:56', '2020-07-29 03:40:04'),
	(13, 4, 'Ef: A Tale of Memories', 'asdasdqwd', 'https://m.media-amazon.com/images/M/MV5BMTk0Nzk0NjMtZGVlYy00OTM0LTgwMzctNjc3ZWY2YzkxYzYyXkEyXkFqcGdeQXVyNjQ0MTEzNzc@._V1_.jpg', '2020-07-29 03:32:23', '2020-07-29 03:40:07'),
	(14, 5, 'Cardcaptor Sakura', 'asdasdqwewqe112', 'https://infoliteraria.com/wp-content/uploads/2019/08/CARDCAPTOR-SAKURA-ed-deluxe-1.jpg', '2020-07-29 03:33:00', '2020-07-29 03:40:09'),
	(15, 1, 'XXXHOLiC', 'Jaja eso q es ', 'https://kbimages1-a.akamaihd.net/65673b8d-3b3e-476d-b34c-78ba6c4f6e12/1200/1200/False/xxxholic-rei.jpg', '2020-07-29 03:33:24', '2020-07-29 13:29:36'),
	(16, 5, 'Katanagatari', 'asdasdasasdsada', 'https://m.media-amazon.com/images/M/MV5BNmMyNDgzY2UtZTA5YS00NmQ0LTg1NjMtMGFkYmZlNzZiZTZkXkEyXkFqcGdeQXVyMTA3OTEyODI1._V1_UY1200_CR115,0,630,1200_AL_.jpg', '2020-07-29 03:34:18', '2020-07-29 03:40:16'),
	(17, 3, 'School Rumble', 'asdgfgbbcvbcv', 'https://static.zerochan.net/School.Rumble.full.703464.jpg', '2020-07-29 03:35:08', '2020-07-29 03:40:19'),
	(18, 6, 'Captain Harlock', 'jnkjnkjnmjknjknksdzxc', 'https://images-na.ssl-images-amazon.com/images/S/cmx-images-prod/Item/603821/603821._SX1600_QL80_TTD_.jpg', '2020-07-29 03:35:38', '2020-07-29 03:40:23'),
	(19, 6, 'Lupin the third', 'adsad1dr23re34', 'https://m.media-amazon.com/images/M/MV5BYTBmMmNlODEtMjU1OC00NGY2LWE3ZDgtNTA4ZWYyZGFjODQ1XkEyXkFqcGdeQXVyMzM4MjM0Nzg@._V1_UY1200_CR110,0,630,1200_AL_.jpg', '2020-07-29 03:36:21', '2020-07-29 03:40:27'),
	(20, 2, 'Kimi ni todoke', 'asdasbdsadbasbd', 'https://m.media-amazon.com/images/M/MV5BZjAyZjZlYmMtNjYxMi00NTBkLWE3MmItZDU4ZTU1MDM4YzhkXkEyXkFqcGdeQXVyNjc3MjQzNTI@._V1_.jpg', '2020-07-29 03:37:20', '2020-07-29 03:40:31'),
	(21, 2, 'Gantz', 'asdanxcnvxcvnxc', 'https://i.pinimg.com/originals/50/eb/08/50eb086ba88dbf3c1f6b5a32c1c86d59.jpg', '2020-07-29 03:37:41', '2020-07-29 03:40:34'),
	(22, 2, 'Natsume yûjinchô', 'ghjghjghjghjg', 'https://i.pinimg.com/originals/f7/eb/31/f7eb315d14879a1be88c8acf47dabc0f.jpg', '2020-07-29 03:40:52', '2020-07-29 03:41:31'),
	(23, 6, 'Golden Boy', 'mhgjghmjgj', 'https://m.media-amazon.com/images/M/MV5BZmE5MjkzNjQtZTExNy00NDU3LWFiNzMtM2FkN2I5ZTQ3NTVlXkEyXkFqcGdeQXVyNDQxNjcxNQ@@._V1_UY1200_CR85,0,630,1200_AL_.jpg', '2020-07-29 03:43:33', '2020-07-29 03:43:45'),
	(24, 6, 'Eureka Seven', 'jghjghjhgjghjg', 'https://static.zerochan.net/Eureka.Seven.Ao.full.1003886.jpg', '2020-07-29 03:44:14', '2020-07-29 03:44:14'),
	(25, 6, 'La federación de las plumas de carbón', 'gfghgfhftt', 'https://pics.filmaffinity.com/La_federaci_n_de_las_plumas_de_carb_n_Serie_de_TV-255455337-large.jpg', '2020-07-29 03:44:35', '2020-07-29 03:45:01'),
	(26, 4, 'Higurashi no naku koro ni', 'fghgfhvbcvbdf', 'https://3.bp.blogspot.com/-j1-t9QIGRpk/VRx-TG_p3FI/AAAAAAAAB0g/_jVnbxu931g/s1600/Higurrr.jpg', '2020-07-29 03:45:27', '2020-07-29 03:52:39'),
	(27, 4, 'Rainbow: Nishakubou no shichinin', 'fsdfbsdbfsdfbsgf', 'https://m.media-amazon.com/images/M/MV5BMmI0ODEzMWItMThiMS00YzIyLTg5YjAtNTljNjUxMGU4NzBhL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_UY1200_CR132,0,630,1200_AL_.jpg', '2020-07-29 03:46:57', '2020-07-29 03:47:10'),
	(28, 4, 'Puella Magi Madoka Magica', 'gfdgdfbgdfgdf', 'https://musicart.xboxlive.com/7/24350900-0000-0000-0000-000000000002/504/image.jpg?w=1920&h=1080', '2020-07-29 03:47:46', '2020-07-29 03:47:46'),
	(29, 4, 'Black Butler', 'fgdfgdfgdfgdfgdfg', 'https://m.media-amazon.com/images/M/MV5BNzE3MmQ4ZjEtYmQxNC00MWJmLWJkMGItYWQwNTk2ZmJlZTgxXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY1200_CR113,0,630,1200_AL_.jpg', '2020-07-29 03:49:31', '2020-07-29 03:49:31'),
	(30, 2, 'Carole & Tuesday', 'dasdasdasvdsavasvdasvd', 'https://upload.wikimedia.org/wikipedia/en/e/e4/Carolandtuesday.animekeyvisual.jpg', '2020-07-29 03:51:00', '2020-07-29 03:51:00'),
	(31, 5, 'Gungrave', 'mkhjmkhjkhjkhjk', 'https://m.media-amazon.com/images/M/MV5BNTZmYzEyN2YtOGQzNS00OWRmLTlkMDQtNTMzMjNmODM1MTI4XkEyXkFqcGdeQXVyMTA3OTEyODI1._V1_UY1200_CR85,0,630,1200_AL_.jpg', '2020-07-29 03:52:07', '2020-07-29 03:52:11'),
	(32, 5, 'Durarara', 'ghrhfrhrt', 'https://m.media-amazon.com/images/M/MV5BOTAwNmViMTQtOTgzYy00NzM4LWE0MzYtYjIwOWQ0N2U5M2MxXkEyXkFqcGdeQXVyMzgxODM4NjM@._V1_.jpg', '2020-07-29 03:53:45', '2020-07-29 03:53:45'),
	(33, 5, 'Toradora', 'asdadasdsada', 'https://vignette.wikia.nocookie.net/tora-dora/images/8/8a/745.jpg/revision/latest?cb=20160405071901', '2020-07-29 03:54:23', '2020-07-29 03:54:38'),
	(34, 3, 'Los 7 pecados capitales', 'fghgfhgfhf', 'https://vignette.wikia.nocookie.net/doblaje/images/9/95/Los_Siete_Pecados_Capitales_S2_-_poster.png/revision/latest?cb=20181015203105&path-prefix=es', '2020-07-29 03:54:51', '2020-07-29 03:55:18'),
	(35, 3, 'No Game, No Life', 'dasdvzxvzvcx', 'https://kisslightnovels.info/wp-content/uploads/2019/05/No-Game-No-Life.jpg', '2020-07-29 03:55:50', '2020-07-29 03:55:50'),
	(36, 3, 'Captain Tsubasa', 'sdvasvdadvasv', 'https://i.pinimg.com/736x/18/2e/f2/182ef22a65d5bd920f1b74ca7aaecf96.jpg', '2020-07-29 03:56:28', '2020-07-29 03:56:28'),
	(37, 3, 'Fruits Basket', 'avdasvjjtyvjyt', 'https://m.media-amazon.com/images/M/MV5BNGM0NDZhOTYtZTk3MC00ZjFkLWFmMDctOTQ2Mjk3ZTU2M2YyXkEyXkFqcGdeQXVyMzExMzk5MTQ@._V1_.jpg', '2020-07-29 03:56:59', '2020-07-29 03:56:59'),
	(38, 1, 'Another', 'fdsbvfbfsdfs', 'https://m.media-amazon.com/images/M/MV5BNWYzNmZmMTUtNzI1YS00NTYwLWIxYWQtMThmYjY1Y2MwZDc2XkEyXkFqcGdeQXVyNDgyODgxNjE@._V1_UY1200_CR85,0,630,1200_AL_.jpg', '2020-07-29 03:57:55', '2020-07-29 03:57:55'),
	(39, 1, 'Clannad: After Story', 'bdfgbdfgdf', 'https://m.media-amazon.com/images/M/MV5BYTcwNzQzNTktYjY1MC00YTVkLThkMGItZGQ3ZjBjNTc1ZmY4XkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_UY1200_CR119,0,630,1200_AL_.jpg', '2020-07-29 03:58:25', '2020-07-29 03:58:25'),
	(40, 2, 'Erased', 'dvzxcvz', 'https://www.ecured.cu/images/5/51/Erased.jpg', '2020-07-29 03:58:49', '2020-07-29 03:58:49'),
	(41, 2, 'Fate/Zero', 'dfgbdgndf', 'https://miro.medium.com/max/990/1*gdCZzDmB2xGzgYzH5IWQGg.jpeg', '2020-07-29 03:59:23', '2020-07-29 03:59:43'),
	(42, 3, 'Planetes', 'dbqwbqwbret', 'https://m.media-amazon.com/images/M/MV5BMThjNTY5OGYtZTIwNy00MTVjLWJmNmItMjk4Y2U0YWQxZDgzXkEyXkFqcGdeQXVyNjc3OTE4Nzk@._V1_UY1200_CR106,0,630,1200_AL_.jpg', '2020-07-29 04:00:20', '2020-07-29 04:00:20'),
	(43, 3, 'Kenichi', 'asdasdvasdasvdasd', 'https://pics.filmaffinity.com/KenIchi_The_Mightiest_Disciple_OVA_Miniserie_de_TV-896502655-large.jpg', '2020-07-29 04:01:10', '2020-07-29 04:01:16'),
	(44, 4, 'JoJo no kimyô-na bôken', '12ase2323', 'https://pics.filmaffinity.com/JoJo_no_Kimyo_na_Boken_Stardust_Crusaders_TV_Series-114150634-large.jpg', '2020-07-29 04:02:00', '2020-07-29 04:02:00'),
	(45, 4, 'Chôjikû Yôsai Macross', '235235vgf', 'https://m.media-amazon.com/images/M/MV5BOWM4ZTU0MjMtNmYwNC00ZTc3LWEzMGQtN2RjZGVkMzExZTZiXkEyXkFqcGdeQXVyNzgzODI1OTE@._V1_UY1200_CR121,0,630,1200_AL_.jpg', '2020-07-29 04:10:22', '2020-07-29 04:10:52'),
	(46, 5, 'Great Teacher Onizuka', '2sdfbsdbfsb', 'https://images-na.ssl-images-amazon.com/images/I/513q6Rc6eXL._AC_SY879_.jpg', '2020-07-29 04:11:19', '2020-07-29 04:11:19'),
	(47, 5, 'Hajime no Ippo', 'as3bberwebr', 'https://vignette.wikia.nocookie.net/ippo/images/1/1a/Hajime_No_Ippo_-_The_Glorius_Stage.png/revision/latest?cb=20190807024546', '2020-07-29 04:11:55', '2020-07-29 04:11:55'),
	(48, 6, 'Deadman Wonderland', '12ve1advas', 'https://m.media-amazon.com/images/M/MV5BNWExOTUxYjQtYmNhOS00OGViLWI3N2ItMzBhMWY5NGJkYjlmXkEyXkFqcGdeQXVyNDgyODgxNjE@._V1_UY1200_CR85,0,630,1200_AL_.jpg', '2020-07-29 04:12:45', '2020-07-29 04:12:45'),
	(49, 6, 'Ao no Exorcist', 'hfghrntr', 'https://i.pinimg.com/originals/98/64/71/98647101c911c8926d66a416baeba958.jpg', '2020-07-29 04:12:50', '2020-07-29 04:13:07'),
	(50, 4, 'Francisco', 'efedfw', 'https://img.taste.com.au/Z2m_6zIt/taste/2016/11/beef-tacos-98153-1.jpeg', '2020-07-29 16:16:42', '2020-07-29 16:16:42');
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

-- Dumping structure for table ukianime.comentario
CREATE TABLE IF NOT EXISTS `comentario` (
  `id_comentario` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_video` int(11) DEFAULT NULL,
  `texto` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_comentario`),
  KEY `FK_comentario_id_usuario` (`id_usuario`),
  KEY `FK_comentario_id_video` (`id_video`),
  CONSTRAINT `FK_comentario_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE CASCADE,
  CONSTRAINT `FK_comentario_id_video` FOREIGN KEY (`id_video`) REFERENCES `video` (`id_video`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.comentario: ~0 rows (approximately)
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` (`id_comentario`, `id_usuario`, `id_video`, `texto`, `created_at`, `updated_at`) VALUES
	(2, 1, 4, 'Nivel', '2020-07-26 22:33:01', '2020-07-26 23:38:54'),
	(3, 1, 11, 'Comentario weojnwefiunweiwnefiwjnfiwejfewikjefw.', '2020-07-29 16:20:44', '2020-07-29 16:20:44');
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.info_de_pago: ~1 rows (approximately)
/*!40000 ALTER TABLE `info_de_pago` DISABLE KEYS */;
INSERT INTO `info_de_pago` (`id_info_de_pago`, `id_usuario`, `tipo_de_cuenta`, `metodo_de_pago`, `tarjeta`, `codigo_de_seguridad`, `fecha_de_expiracion`, `forma_de_cobro`, `created_at`, `updated_at`) VALUES
	(15, 10, 'basica', 'MasterCard', '1233333333333333', 2133, '6/12', 'Manual', '2020-07-29 13:37:14', '2020-07-29 13:37:14'),
	(16, 11, 'basica', 'Visa', '1233444433333333', 2133, '6/12', 'Manual', '2020-07-29 16:07:51', '2020-07-29 16:07:51');
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
  `tipo` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_tag`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.tag: ~4 rows (approximately)
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` (`id_tag`, `nombre`, `tipo`, `created_at`, `updated_at`) VALUES
	(1, 'Español', '', '2020-07-26 11:31:46', '2020-07-26 11:32:47'),
	(2, 'Ingles', NULL, '2020-07-29 04:18:31', '2020-07-29 04:18:31'),
	(3, 'Castellano', NULL, '2020-07-29 04:18:41', '2020-07-29 04:18:41'),
	(4, 'Japones', NULL, '2020-07-29 04:18:53', '2020-07-29 04:18:53');
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
  `telefono` varchar(50) DEFAULT NULL,
  `id_rol` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_usuario`),
  KEY `FK_usuario_rol` (`id_rol`),
  CONSTRAINT `FK_usuario_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.usuario: ~3 rows (approximately)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`id_usuario`, `nombre`, `apellido`, `usuario`, `contrasena`, `email`, `region`, `fecha_nacimiento`, `telefono`, `id_rol`, `created_at`, `updated_at`) VALUES
	(1, 'Francisco', 'Pérez', 'Pixbae', '12345', 'iamfranciscoperez@gmail.com', 'Latinoamerica', '1990-11-24', '2222222', 1, '2020-07-26 08:05:46', '2020-07-29 13:38:18'),
	(10, 'Alfredo', 'Castillo', 'ACastillo', '12345', 'alfredo@gmail.com', 'Latinoamerica', '2000-5-7', '1234567', 2, '2020-07-29 13:37:14', '2020-07-29 13:39:05'),
	(11, 'Juan', 'Zamora', 'juanz', '12345', 'juanzamora@gmail.com', 'Latinoamerica', '2015-04-03', '9516898890', 2, '2020-07-29 16:07:51', '2020-07-29 16:07:51');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

-- Dumping structure for table ukianime.usuario_agrega_anime
CREATE TABLE IF NOT EXISTS `usuario_agrega_anime` (
  `id_usuario` int(11) NOT NULL,
  `id_anime` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_anime`),
  KEY `FK_usuario_anime_id_anime` (`id_anime`),
  CONSTRAINT `FK_usuario_anime_id_anime` FOREIGN KEY (`id_anime`) REFERENCES `anime` (`id_anime`),
  CONSTRAINT `FK_usuario_anime_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.usuario_agrega_anime: ~2 rows (approximately)
/*!40000 ALTER TABLE `usuario_agrega_anime` DISABLE KEYS */;
INSERT INTO `usuario_agrega_anime` (`id_usuario`, `id_anime`) VALUES
	(1, 3),
	(1, 4);
/*!40000 ALTER TABLE `usuario_agrega_anime` ENABLE KEYS */;

-- Dumping structure for table ukianime.video
CREATE TABLE IF NOT EXISTS `video` (
  `id_video` int(11) NOT NULL AUTO_INCREMENT,
  `id_anime` int(11) DEFAULT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `episodio` int(11) DEFAULT NULL,
  `vista` int(11) DEFAULT 0,
  `descripcion` text DEFAULT NULL,
  `url_video` varchar(256) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id_video`),
  KEY `FK__anime` (`id_anime`),
  CONSTRAINT `FK__anime` FOREIGN KEY (`id_anime`) REFERENCES `anime` (`id_anime`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

-- Dumping data for table ukianime.video: ~16 rows (approximately)
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` (`id_video`, `id_anime`, `nombre`, `episodio`, `vista`, `descripcion`, `url_video`, `created_at`, `updated_at`) VALUES
	(1, 1, 'Francisco', 44, 0, 'mniiu', 'cI9PZDX2EVY', '2020-07-27 23:05:25', '2020-07-29 04:21:04'),
	(2, 4, 'El Grand Line', 1, 0, 'barco', 'brkP2-jG4-I', '2020-07-29 04:21:02', '2020-07-29 04:24:13'),
	(3, 1, 'Segundo cap', 23, 2, 'gool', 'ihDPRK6D_MM', '2020-07-26 23:29:29', '2020-07-29 04:21:11'),
	(4, 4, 'Big Mom', 2, 0, 'mama', 't7xHamn5inQ', '2020-07-29 04:23:55', '2020-07-29 04:33:36'),
	(5, 4, 'Los Mugiwaras', 3, 0, 'luffy', 'CFM_zypYFHM', '2020-07-29 04:24:42', '2020-07-29 04:25:31'),
	(6, 4, 'Nami', 4, 0, 'nami', 'v_lyicIHv0I', '2020-07-29 04:25:56', '2020-07-29 04:26:29'),
	(7, 4, 'Robin', 5, 0, 'Robin', 'MTH-FmNZdz4', '2020-07-29 04:29:40', '2020-07-29 04:29:57'),
	(8, 4, 'Zoro', 6, 0, 'Zoro', 'jJHDDYd6PrM', '2020-07-29 04:36:00', '2020-07-29 04:36:00'),
	(9, 4, 'Chopper', 7, 0, 'Chopper', 't7xHamn5inQ', '2020-07-29 04:37:02', '2020-07-29 04:37:32'),
	(11, 2, 'X', 2, 0, 'x', '3TrEVbPfiLo', '2020-07-29 04:40:36', '2020-07-29 04:41:05'),
	(12, 2, 'Kenshin', 3, 0, 'kenshin', '_Hjf-ZFouxI', '2020-07-29 04:41:53', '2020-07-29 04:41:59'),
	(13, 2, 'Ruken', 4, 0, 'Ruken', '23og6wl6C3c', '2020-07-29 04:42:26', '2020-07-29 04:42:44'),
	(14, 2, 'KenRu', 5, 0, 'KenRu', '1nJcUZIQmPE', '2020-07-29 04:43:27', '2020-07-29 04:43:48'),
	(15, 2, 'RUSHI', 6, 0, 'Rushi', 'sYOhUPDyhuU', '2020-07-29 04:45:05', '2020-07-29 04:45:12'),
	(16, 2, 'Shiken', 7, 0, 'Shiken', 'qqcwuHbyr1A', '2020-07-29 04:45:32', '2020-07-29 04:45:59');
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
