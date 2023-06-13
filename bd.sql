--
-- Host: localhost    Database: flores
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Rosas'),(2,'Ofertas Destacadas');
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `estado` varchar(50) NOT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categoria` (`id_categoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Ramo de Rosas Elegante','Este impresionante ramo de rosas es el regalo perfecto para cualquier ocasión especial. Con sus tallos largos y elegantes, estas rosas son un símbolo de amor y belleza.',19.99,1),(2,'Rosa en una Caja','Hermosa rosa de alta calidad, perfecta para regalar en cualquier ocasión especial. Con esta rosa, puedes expresar tus sentimientos de amor, amistad o gratitud de manera elegante y sofisticada.',24.99,1),(3,'Bouquet de Rosas Blancas','Hermoso bouquet de 12 rosas blancas de alta calidad. Los pétalos son sedosos y la calidad es excelente.',45.99,1),(4,'Ramo de Tulipanes',' Hermoso ramo de tulipanes de alta calidad en tonos rosa y amarillo. El ramo incluye 20 tulipanes frescos y vibrantes.',35.99,2),(5,'Ramo de Lirios Blancos','Hermoso ramo de lirios blancos de alta calidad. El ramo incluye 10 lirios frescos y fragantes. Este ramo es perfecto para regalar en ocasiones especiales, como bodas, aniversarios, Día de la Madre, entre otros. Además, los lirios blancos son ideales para decorar cualquier espacio de tu hogar u oficina.',29.99,2),(6,'Cesta de Margaritas','Hermosa cesta de margaritas blancas de alta calidad. La cesta incluye 10 margaritas frescas y vibrantes.',24.99,2),(7,'Hermoso Jarron de Rosas','Este hermoso jarrón de rosas es el regalo perfecto para cualquier ocasión especial. Las rosas son de alta calidad y están cuidadosamente dispuestas en un jarrón de vidrio transparente para crear un hermoso arreglo floral.',49.99,1),(8,'Hermoso jarrón de tulipanes ','Este hermoso jarrón de tulipanes amarillos es el regalo perfecto para alegrar el día de alguien especial. Los tulipanes son de alta calidad y están cuidadosamente dispuestos en un jarrón de vidrio transparente para crear un hermoso arreglo floral.',39.99,2),(9,'Jarron de rosas blancas','Es un producto elegante y sofisticado que puede ser utilizado para decorar cualquier espacio. Las rosas blancas que se incluyen en el jarrón son de la más alta calidad y han sido cuidadosamente seleccionadas para asegurar que sean frescas y hermosas.',49.99,1),(10,'Jarrón con lirios amarillos','Este jarrón es ideal para cualquier tipo de evento, desde bodas hasta cenas en casa, y también es perfecto para regalar a amigos y familiares que disfrutan de la decoración. Además, los lirios amarillos simbolizan la felicidad y la alegría, lo que los convierte en un regalo perfecto para cualquier ocasión especial.',59.99,2);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contraseña` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Angel','Gonzalez','tawgger@proton.me','$2y$10$x9k00I7ZjRH89fQQUsK2DuYtkq1/HnU1wBJ1yp0sl2HTCnVWCWyJ.');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-10  0:03:53