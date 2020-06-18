-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: doomtienda
-- ------------------------------------------------------
-- Server version	5.7.29-log

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_cli` varchar(45) NOT NULL,
  `Appat_cli` varchar(45) NOT NULL,
  `direccion` varchar(80) NOT NULL,
  `correo_cli` varchar(80) NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `codigo_targeta` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Robin','Hood','Avenida siempre viva','user1@example.ex','user1','12345','1a2b3'),(2,'Juan','Rojas','Benito Juarez, Popotla num 3','igriega@gmail.com','roropirorro','contraseÃ±a','a00p2'),(3,'Juan','Rojas','Benito Juarez, Popotla num 3','igriega@gmail.com','roropirorro','contraseÃ±a','a00p2');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `idCompras` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `idPago` int(11) NOT NULL,
  `FechaCompras` date NOT NULL,
  `Monto` double NOT NULL,
  `Estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idCompras`),
  KEY `idPago` (`idPago`),
  KEY `idCliente` (`idCliente`),
  CONSTRAINT `idCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idPago` FOREIGN KEY (`idPago`) REFERENCES `pago` (`idPago`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,1,1,'2020-06-16',150,'Cancelado'),(2,1,1,'2020-06-16',150,'Cancelado'),(3,1,1,'2020-06-17',0,'Cancelado'),(4,1,1,'2020-06-17',0,'Cancelado');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compras`
--

DROP TABLE IF EXISTS `detalle_compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compras` (
  `idDetalle` int(11) NOT NULL AUTO_INCREMENT,
  `idProducto` int(11) NOT NULL,
  `idCompras` int(11) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `PrecioCompra` double NOT NULL,
  PRIMARY KEY (`idDetalle`),
  KEY `idProducto` (`idProducto`),
  KEY `idCompras` (`idCompras`),
  CONSTRAINT `idCompras` FOREIGN KEY (`idCompras`) REFERENCES `compras` (`idCompras`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idProducto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compras`
--

LOCK TABLES `detalle_compras` WRITE;
/*!40000 ALTER TABLE `detalle_compras` DISABLE KEYS */;
INSERT INTO `detalle_compras` VALUES (1,23,1,1,20),(2,25,1,1,70),(3,26,1,1,60),(4,23,2,1,20),(5,25,2,1,70),(6,26,2,1,60);
/*!40000 ALTER TABLE `detalle_compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `idPago` int(11) NOT NULL AUTO_INCREMENT,
  `Monto` double NOT NULL,
  PRIMARY KEY (`idPago`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,4000);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombres` varchar(45) NOT NULL,
  `Foto` varchar(100) NOT NULL,
  `Descripcion` varchar(500) NOT NULL,
  `Precio` double NOT NULL,
  `stock` int(11) NOT NULL,
  `idTipo` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idTipo` (`idTipo`),
  CONSTRAINT `idTipo` FOREIGN KEY (`idTipo`) REFERENCES `tipo` (`idTipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (23,'Zombieman','img/zombieman.png','El Zombieman también conocido como el ex humano o, a veces, el ex soldado en los manuales de juego. es un marine espacial que ha sido convertido en zombi durante la invasión de las hordas del  Infierno.',20,234,1),(24,'Shotgunner','img/shotgunner.png','El Shotgunner referido como un ex sargento humano en los manuales de juego, es un hombre armado que se ha convertido en un zombi durante la invasión del infierno.',30,233,1),(25,'Chaingunner','img/chaingunner.png','El Chaingunner (llamado Former Commando en el manual de Doom II) es el tercer y más potente tipo de ser humano que se ha convertido en un zombie durante la invasión del infierno. Es el primero de los nuevos enemigos introducidas en Doom II para hacer su aparición en el juego',70,468,1),(26,'Imp','img/imp.png','Los Imp son unos seres humanoides de color marrón que tienen espinas saliendo de la parte posterior del cuerpo.',60,324,2),(27,'Pinky','img/pinky.png','El Pinky es un monstruo relativamente grande, de color rosa, voluminosa musculatura, vagamente humanoide con dientes afilados, dos cuernos en su gran cabeza, hacia atrás de rodillas y con tres garras en cada pie.',150,524,2),(28,'Spectre','img/spectre.png','Los Spectre son homólogos parcialmente invisibles de los Demonios. Excepto por su apariencia borrosa, son exactamente iguales en su comportamiento y atributos, y por lo tanto pueden ser considerados como los Demonios que tienen un poder de invisibilidad parcial permanente.',150,474,2),(29,'Cacodemon','img/meatball.png','Los Cacodemons son monstruos rojos con grandes cuerpos esféricos coronados con cuernos, que flotan lentamente por el aire. Tienen un solo ojo verde sobre una boca grande que se retuerce persistentemente en una sonrisa maligna que muestra una serie de dientes sucios y un interior azulad',400,541,2),(30,'Pain Elemental','img/painelemental.png','El Pain Elemental es un monstruo que aparece en Doom II, muy similar a los Cacodemon; ambos son esferas flotantes con un solo ojo y una boca grande con dientes.',400,608,2),(31,'Lost Soul','img/lostsoul.png','El Alma perdida (lost soul o Alma en pena) es un cráneo llameante con cuernos que vuela, que fue introducido por primera vez en el segundo episodio de Doom, The Shores of Hell. Las Almas perdidas se utilizan a sí mismos como armas, cargando contra el jugador con las fauces abiertas.',100,675,2),(32,'Revenant','img/revenant.png','Los Revenant son monstruos introducidos en Doom II, fácilmente reconocibles por su agudo chillido. Tienen la forma de esqueletos animados de gran altura con una armadura metálica plateada en el cuerpo y equipado con lanzamisiles montados en los hombros. La sangre chorrea por su caja torácica y piernas. Sus movimientos de marcha son bastante espasmódicos, parecido a un muñeco de cuerda.',300,742,2),(33,'Mancubus','img/mancubus.png','El Mancubus (plural: Mancubi) es un monstruo humanoide cibernético terriblemente grande que aparece en Doom II, arrastrando los pies de robustas patas, parecidas a las de elefantes, mira a los opositores a través de ojos verdes llenos de odio, mientras que restos de las víctimas cuelgan de su boca, mostrando colmillos afilados y amarillos.',600,809,2),(34,'Hell Knight','img/hellknight.png','El Caballero del Infierno (Hell Knight) es un monstruo introducido en Doom II. Es un primo más débil del Barón del Infierno, con una piel no tan color rosa y diferentes sonidos cuando son alertados o muertos. Aunque es más fácil de matar, sus ataques son tan potentes como los del Barón.',500,876,2),(35,'Baron Of Hell','img/baronofhell.png','Los Barones del Infierno son monstruosos enemigos que parecen minotauros, faunos o sátiros con los torsos de color rosa, cuernos y patas de cabra marrón.',1000,943,2),(36,'Arachnotron','img/arachnotron.png','El Arachnotron es un monstruo con forma de araña introducido en Doom II. Es muy similar a la Spiderdemon pero más pequeño y con grandes ojos que cambian de color en función del estado actual del monstruo (si se mueve, es herido o ataca).',500,101,2),(37,'Archvile','img/archvile.png','El Arch-Vile es un monstruo de figura humanoide, muy alto y de aspecto escuálido, de piel color durazno con un aspecto grotesco, incluyendo estigmas. No tiene carne alrededor de su abdomen, dejando al descubierto parte de su caja torácica y la columna vertebral.',700,107,2),(38,'Cyberdemon','img/cyberdemon.png','El Cyberdemon es el segundo jefe que se enfrenta en el juego y el demonio más poderoso de Doom. Es una bestia musculosa y alta, al tipo de un minotauro, con dos cuernos negros / grises oscuro, una pierna derecha cibernética, un gran lanzacohetes montado en su brazo izquierdo, cables rojos en la parte inferior del torso, así como parches de metal y cables en su brazo derecho.',4000,114,3),(39,'Spider Mastermind','img/spidermastermind.png','El Spiderdemon es el jefe principal del juego, también llamado \"The Spider Mastermind\". Aparece en los niveles E3M8: Dis y E4M8: Unto the Cruel (Ultimate Doom), goza de una resistencia colosal por lo que se requerirá de armas muy poderosas para hacerle frente.',3000,121,3),(40,'Icon Of Sin','img/iconofsin.png','El Icono del Pecado es el nombre con el que se conoce al jefe final que aparece en Doom II. No hay un nombre oficial para el jefe final, pero a menudo se lo menciona informalmente de esta forma a causa del nivel en que aparece MAP30: Icon of Sin, el nivel final de Doom II.',250,127,3),(41,'Jhon Romero','img/jhonromero.png','En el nivel final de Doom II el jefe final, el Icono del pecado, es un cráneo de cabra gigante con un agujero rectangular atravesándole la frente. El enemigo habla en un idioma incomprensible cuando el jugador entra en la estancia. Este mensaje es en realidad la propia voz de John Romero distorsionada e invertida (para dar un efecto \"demoníaco\") diciendo: \"To win the game, you must kill me, John Romero!\" (\"Para ganar el juego debes matarme a mí, John Romero!\").',250,134,4),(42,'Comander Keen','img/keen.png','El Comandante Keen (Commander Keen, nombre real: Billy Blaze) es un personaje de una serie de juegos de plataformas del mismo nombre de id Software.Una encarnación de este personaje se puede encontrar en el mapa super secreto de Doom II MAP32: Grosse, como un Easter egg.',100,141,4),(43,'SS Soldier','img/SSsoldier.png','El soldado Wolfenstein SS (también conocido como los Nazis de las SS) es un soldado nazi de las SS (Schutzstaffel) en uniforme azul.  Aparece como un hombre rubio, de ojos azules, de mandíbula cuadrada que lleva botas y un birrete, armado con una metralleta. Cuando es herido, el Wolfenstein SS suena como los Zombieman cuando sufren daños.',50,148,4),(44,'Doomguy','img/doomguy.png','Es el protagonista de la saga Doom es el personaje principal de Doom y sus secuelas, que no tiene un nombre conocido( en ingles se le denomina \"Doomguy\", algo sis como \"el muchacho del Doom\")',400,420,1);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo`
--

DROP TABLE IF EXISTS `tipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo` (
  `idTipo` int(11) NOT NULL AUTO_INCREMENT,
  `tipoPer` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo`
--

LOCK TABLES `tipo` WRITE;
/*!40000 ALTER TABLE `tipo` DISABLE KEYS */;
INSERT INTO `tipo` VALUES (1,'normal'),(2,'demonio'),(3,'boss'),(4,'secreto');
/*!40000 ALTER TABLE `tipo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-18  3:44:07
