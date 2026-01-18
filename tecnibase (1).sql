CREATE DATABASE  IF NOT EXISTS `tecnibase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tecnibase`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: tecnibase
-- ------------------------------------------------------
-- Server version	9.5.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

-- SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '87bddb3a-d838-11f0-bc8a-c03eba0ef86d:1-185';

--
-- Table structure for table `catalogo`
--

DROP TABLE IF EXISTS `catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalogo` (
  `id_catalogo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_catalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalogo`
--

LOCK TABLES `catalogo` WRITE;
/*!40000 ALTER TABLE `catalogo` DISABLE KEYS */;
INSERT INTO `catalogo` VALUES (1,'Componentes Internos PC','Piezas de hardware para reparación y ensamblaje de computadoras.'),(2,'Accesorios Móviles','Fundas, protectores, cargadores y cables para celulares.'),(3,'Suministros Impresión','Cartuchos de tinta, tóner, kits de mantenimiento y papel.'),(4,'Software y Sistemas','Licencias de antivirus, sistemas operativos y programas utilitarios.'),(5,'Periféricos','Teclados, ratones, cámaras web y audífonos.'),(6,'Almacenamiento','Discos duros internos, SSD y memorias externas.'),(7,'Redes y Conectividad','Routers, switches, cables de red (Ethernet) y adaptadores Wi-Fi.'),(8,'Herramientas Técnicas','Kits de destornilladores, pinzas y equipos de medición.'),(9,'Pantallas y Monitores','Repuestos de pantallas para laptops y celulares, monitores externos.'),(10,'Cables y Adaptadores','Cables de video (HDMI, VGA), adaptadores de corriente universales.');
/*!40000 ALTER TABLE `catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(120) NOT NULL,
  `RUC_empresa` char(13) DEFAULT NULL,
  `telefono` varchar(20) NOT NULL,
  `correo` varchar(120) DEFAULT NULL,
  `cedula_persona` char(10) DEFAULT NULL,
  `apellido_persona` varchar(100) DEFAULT NULL,
  `tipo_cliente` enum('persona','empresa') DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Innovación Tecnológica S.A.','1792500123001','022345678','info@innotec.com',NULL,NULL,'empresa'),(2,'Ana María',NULL,'0998765432','ana.m@gmail.com','1705801234','Villacís','persona'),(3,'Distribuidora Eléctrica Ltda.','0991234567001','042987654','ventas@electrica.com',NULL,NULL,'empresa'),(4,'Carlos Andrés',NULL,'0963214587','carlos.a@outlook.com','1309456789','Guzmán','persona'),(5,'Servicios Rápidos Cía. Ltda.','1790101010001','023300900',NULL,NULL,NULL,'empresa'),(6,'Sofía',NULL,'0991122334','sofia.r@live.com','0502123456','Rojas','persona'),(7,'Ferretería Central','0600123456001','032789456',NULL,NULL,NULL,'empresa'),(8,'José Luis',NULL,'0995556667','jose.l@yahoo.com','1801765432','Mora','persona'),(9,'Consultoría XYZ','1798765432001','026543210','contacto@cxyz.net',NULL,NULL,'empresa'),(10,'Gabriela',NULL,'0987654321','gabriela.f@mail.com','1710101010','Fernández','persona');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `detalleventas`
--

DROP TABLE IF EXISTS `detalleventas`;
/*!50001 DROP VIEW IF EXISTS `detalleventas`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `detalleventas` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido_persona`,
 1 AS `nro_factura`,
 1 AS `monto_total`,
 1 AS `fecha_emision`,
 1 AS `producto_descripcion`,
 1 AS `cantidad`,
 1 AS `tipo_servicio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL UNIQUE,
  `apellido` varchar(100) NOT NULL,
  `cedula` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `tipo_empleado` enum('técnico','cajero') DEFAULT NULL,
  PRIMARY KEY (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Ricardo','Méndez','1701112223','0991001001','técnico'),(2,'Andrea','Flores','0920003004','0982002002','cajero'),(3,'Javier','Reyes','1802223334','0973003003','técnico'),(4,'Paula','Díaz','1303334445','0964004004','cajero'),(5,'Luis','Gómez','0704445556','0955005005','técnico'),(6,'Verónica','Silva','1005556667','0996006006','cajero'),(7,'Miguel','Castro','0606667778','0987007007','técnico'),(8,'Elena','Paredes','1107778889','0978008008','cajero'),(9,'Fernando','López','0808889990','0969009009','técnico'),(10,'Rosa','Aguilar','1709990001','0950000000','cajero');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `id_equipo` int NOT NULL AUTO_INCREMENT,
  `marcha` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `numero_serial` varchar(50) NOT NULL,
  `tipo_equipo` enum('computadora','celular','impresora') DEFAULT NULL,
  `estado_equipo` varchar(20) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `codigo_seguridad` varchar(100) DEFAULT NULL,
  `id_cliente` int DEFAULT NULL,
  PRIMARY KEY (`id_equipo`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `equipo_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'HP','ProBook G8','SN-HP456789','computadora','En revisión','No enciende, posible fallo en fuente','P1234',1),(2,'Samsung','Galaxy S21','SN-SAM123456','celular','Reparado','Pantalla quebrada, requiere reemplazo','L4321',3),(3,'Epson','L3110','SN-EPS901234','impresora','Pendiente','Atasco de papel constante y error de tinta','D5678',5),(4,'Dell','Inspiron 15','SN-DEL567890','computadora','En diagnóstico','Lentitud extrema y sobrecalentamiento','R9876',7),(5,'Apple','iPhone 13','SN-APP112233','celular','Listo para entrega','Batería agotada, necesita cambio','Z6543',8),(6,'Canon','Pixma MG','SN-CAN789012','impresora','Reparado','Error de cartuchos y driver desactualizado','F3210',10),(7,'Lenovo','ThinkPad T14','SN-LEN345678','computadora','En revisión','Fallo de disco duro, no inicia el sistema','K7890',1),(8,'Xiaomi','Redmi Note 9','SN-XIAO901234','celular','Pendiente','Problemas de carga, puerto dañado','W1098',3),(9,'HP','LaserJet Pro','SN-HP567890','impresora','En diagnóstico','Calidad de impresión borrosa','T5432',5),(10,'Acer','Nitro 5','SN-ACE123987','computadora','Listo para entrega','Mantenimiento preventivo solicitado','A2109',7);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `id_servicio` int NOT NULL,
  `nro_factura` int NOT NULL,
  `fecha_emision` date DEFAULT NULL,
  `monto_total` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_servicio`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio_prestado` (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (1,1001,'2025-10-01',45.50),(2,1002,'2025-10-01',120.00),(3,1003,'2025-10-02',75.99),(4,1004,'2025-10-03',89.50),(5,1005,'2025-10-03',50.00),(6,1006,'2025-10-04',250.75),(7,1007,'2025-10-05',30.00),(8,1008,'2025-10-06',95.50),(9,1009,'2025-10-06',400.00),(10,1010,'2025-10-07',65.00);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `facturaservicio`
--

DROP TABLE IF EXISTS `facturaservicio`;
/*!50001 DROP VIEW IF EXISTS `facturaservicio`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `facturaservicio` AS SELECT 
 1 AS `nro_factura`,
 1 AS `fecha_emision`,
 1 AS `monto_total`,
 1 AS `tipo_servicio`,
 1 AS `categoria_servicio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `infoinventario`
--

DROP TABLE IF EXISTS `infoinventario`;
/*!50001 DROP VIEW IF EXISTS `infoinventario`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `infoinventario` AS SELECT 
 1 AS `id_producto`,
 1 AS `marca`,
 1 AS `descripcion`,
 1 AS `stock`,
 1 AS `costo`,
 1 AS `proveedor`,
 1 AS `categoria_nombre`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `infoserviciotecnico`
--

DROP TABLE IF EXISTS `infoserviciotecnico`;
/*!50001 DROP VIEW IF EXISTS `infoserviciotecnico`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `infoserviciotecnico` AS SELECT 
 1 AS `id_empleado`,
 1 AS `nombre_empleado`,
 1 AS `id_equipo`,
 1 AS `modelo_equipo`,
 1 AS `tipo_equipo`,
 1 AS `estado_equipo`,
 1 AS `descripcion_servicio`,
 1 AS `nombre_cliente`,
 1 AS `apellido_cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `id_catalogo` int DEFAULT NULL,
  `marca` varchar(60) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `costo` decimal(10,2) NOT NULL,
  `proveedor` varchar(120) NOT NULL,
  `inventario` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_catalogo` (`id_catalogo`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_catalogo`) REFERENCES `catalogo` (`id_catalogo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,1,'Kingston','Memoria RAM DDR4 8GB 3200Mhz',35.50,'TechCorp Mayorista',50),(2,2,'Samsung','Cargador Rápido Tipo C 25W',12.00,'Mobile Parts S.A.',100),(3,3,'Epson','Botella de Tinta Negra T504',8.99,'Distribuidora Tinta',80),(4,4,'Microsoft','Licencia Windows 11 Home (OEM)',85.00,'Software Global',20),(5,6,'Western Digital','SSD M.2 NVMe 500GB',49.99,'TechCorp Mayorista',30),(6,5,'Sony','Audífonos Inalámbricos Bluetooth',25.75,'Mobile Parts S.A.',60),(7,3,'HP','Tóner Negro LaserJet 44A',45.00,'Distribuidora Tinta',40),(8,7,'TP-Link','Router Wi-Fi Doble Banda AC1200',32.50,'Redes del Sur',70),(9,9,'Apple','Pantalla de repuesto para iPhone 13',90.00,'Mobile Parts S.A.',15),(10,10,'Genérico','Cable HDMI 2.0 de 2 metros',5.50,'Periféricos Soluciones',90);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_prestado`
--

DROP TABLE IF EXISTS `servicio_prestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_prestado` (
  `id_servicio` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `id_cliente` int DEFAULT NULL,
  `tipo_servicio` char(1) DEFAULT NULL,
  PRIMARY KEY (`id_servicio`),
  KEY `id_cliente` (`id_cliente`),
  CONSTRAINT `servicio_prestado_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_prestado`
--

LOCK TABLES `servicio_prestado` WRITE;
/*!40000 ALTER TABLE `servicio_prestado` DISABLE KEYS */;
INSERT INTO `servicio_prestado` VALUES (1,'2025-10-01',1,'S'),(2,'2025-10-01',2,'V'),(3,'2025-10-02',3,'S'),(4,'2025-10-03',4,'V'),(5,'2025-10-03',5,'S'),(6,'2025-10-04',6,'V'),(7,'2025-10-05',7,'S'),(8,'2025-10-06',8,'S'),(9,'2025-10-06',9,'V'),(10,'2025-10-07',10,'S');
/*!40000 ALTER TABLE `servicio_prestado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_tecnico`
--

DROP TABLE IF EXISTS `servicio_tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_tecnico` (
  `id_servicio` int NOT NULL,
  `id_servicio_tec` int NOT NULL AUTO_INCREMENT,
  `tipo` varchar(50) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `piezas_utilizadas` varchar(255) DEFAULT NULL,
  `id_equipo` int DEFAULT NULL,
  `idEmpleado` int DEFAULT NULL,
  PRIMARY KEY (`id_servicio`,`id_servicio_tec`),
  UNIQUE KEY `id_servicio_tec` (`id_servicio_tec`),
  KEY `id_equipo` (`id_equipo`),
  KEY `idEmpleado` (`idEmpleado`),
  CONSTRAINT `servicio_tecnico_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio_prestado` (`id_servicio`),
  CONSTRAINT `servicio_tecnico_ibfk_2` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`id_equipo`),
  CONSTRAINT `servicio_tecnico_ibfk_3` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_tecnico`
--

LOCK TABLES `servicio_tecnico` WRITE;
/*!40000 ALTER TABLE `servicio_tecnico` DISABLE KEYS */;
INSERT INTO `servicio_tecnico` VALUES (1,1,'Reparación','Cambio de fuente de poder defectuosa','Fuente de poder 500W',1,1),(1,7,'Instalación','Instalación de Windows 11 Pro y drivers','Licencia Windows 11 Pro',7,3),(3,2,'Mantenimiento','Limpieza de sistema operativo y eliminación de malware','Software de limpieza profesional',2,3),(3,8,'Reparación','Cambio del puerto de carga dañado','Puerto Micro USB / Tipo C',8,5),(5,3,'Reparación','Reemplazo de kit de fusor por desgaste','Kit de fusor genérico',3,5),(5,9,'Mantenimiento','Calibración de color e impresión de prueba','Paquete de papel fotográfico A4',9,7),(7,4,'Diagnóstico','Revisión exhaustiva de hardware','Software de diagnóstico v3.0',4,7),(7,10,'Reparación','Reinstalación completa de sistema operativo','Imagen de disco de fábrica',10,9),(8,5,'Reparación','Reemplazo de batería y calibración','Batería original de Li-ion',5,9),(10,6,'Mantenimiento','Limpieza profunda de cabezales y ajuste de color','Líquido limpiador de inyectores',6,1);
/*!40000 ALTER TABLE `servicio_tecnico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicio_tecnico_producto`
--

DROP TABLE IF EXISTS `servicio_tecnico_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `servicio_tecnico_producto` (
  `id_servicio` int NOT NULL,
  `id_servicio_tec` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`id_servicio`,`id_servicio_tec`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `servicio_tecnico_producto_ibfk_1` FOREIGN KEY (`id_servicio`, `id_servicio_tec`) REFERENCES `servicio_tecnico` (`id_servicio`, `id_servicio_tec`),
  CONSTRAINT `servicio_tecnico_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicio_tecnico_producto`
--

LOCK TABLES `servicio_tecnico_producto` WRITE;
/*!40000 ALTER TABLE `servicio_tecnico_producto` DISABLE KEYS */;
INSERT INTO `servicio_tecnico_producto` VALUES (1,1,1,1),(1,7,4,1),(3,2,4,1),(3,8,2,1),(5,3,7,1),(5,9,3,2),(7,4,5,1),(7,10,1,2),(8,5,9,1),(10,6,3,1);
/*!40000 ALTER TABLE `servicio_tecnico_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta`
--

DROP TABLE IF EXISTS `venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta` (
  `id_servicio` int NOT NULL,
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `tipo_pago` varchar(40) DEFAULT NULL,
  `id_cajero` int DEFAULT NULL,
  PRIMARY KEY (`id_servicio`,`id_venta`),
  UNIQUE KEY `id_venta` (`id_venta`),
  KEY `id_cajero` (`id_cajero`),
  CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`id_servicio`) REFERENCES `servicio_prestado` (`id_servicio`),
  CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`id_cajero`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta`
--

LOCK TABLES `venta` WRITE;
/*!40000 ALTER TABLE `venta` DISABLE KEYS */;
INSERT INTO `venta` VALUES (2,1,'Tarjeta de Crédito',2),(2,5,'Efectivo',10),(2,9,'Tarjeta de Débito',8),(4,2,'Efectivo',4),(4,6,'Tarjeta de Crédito',2),(4,10,'Efectivo',10),(6,3,'Transferencia Bancaria',6),(6,7,'Transferencia Bancaria',4),(9,4,'Tarjeta de Débito',8),(9,8,'Efectivo',6);
/*!40000 ALTER TABLE `venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venta_producto`
--

DROP TABLE IF EXISTS `venta_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venta_producto` (
  `id_servicio` int NOT NULL,
  `id_venta` int NOT NULL,
  `id_producto` int NOT NULL,
  `cantidad` int NOT NULL,
  `precio_unitario` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_servicio`,`id_venta`,`id_producto`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `venta_producto_ibfk_1` FOREIGN KEY (`id_servicio`, `id_venta`) REFERENCES `venta` (`id_servicio`, `id_venta`),
  CONSTRAINT `venta_producto_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venta_producto`
--

LOCK TABLES `venta_producto` WRITE;
/*!40000 ALTER TABLE `venta_producto` DISABLE KEYS */;
INSERT INTO `venta_producto` VALUES (2,1,2,1,15.00),(2,5,6,1,30.00),(2,9,10,5,7.00),(4,2,8,1,40.00),(4,6,2,2,15.00),(4,10,6,1,30.00),(6,3,10,10,7.00),(6,7,7,3,50.00),(9,4,5,1,55.00),(9,8,1,1,40.00);
/*!40000 ALTER TABLE `venta_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'tecnibase'
--

--
-- Final view structure for view `detalleventas`
--

/*!50001 DROP VIEW IF EXISTS `detalleventas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `detalleventas` AS select `c`.`nombre` AS `nombre`,`c`.`apellido_persona` AS `apellido_persona`,`f`.`nro_factura` AS `nro_factura`,`f`.`monto_total` AS `monto_total`,`f`.`fecha_emision` AS `fecha_emision`,`p`.`descripcion` AS `producto_descripcion`,`vp`.`cantidad` AS `cantidad`,`s`.`tipo_servicio` AS `tipo_servicio` from (((((`factura` `f` join `servicio_prestado` `s` on((`f`.`id_servicio` = `s`.`id_servicio`))) join `cliente` `c` on((`s`.`id_cliente` = `c`.`id_cliente`))) left join `venta` `v` on((`s`.`id_servicio` = `v`.`id_servicio`))) left join `venta_producto` `vp` on(((`v`.`id_servicio` = `vp`.`id_servicio`) and (`v`.`id_venta` = `vp`.`id_venta`)))) left join `producto` `p` on((`vp`.`id_producto` = `p`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `facturaservicio`
--

/*!50001 DROP VIEW IF EXISTS `facturaservicio`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `facturaservicio` AS select `f`.`nro_factura` AS `nro_factura`,`f`.`fecha_emision` AS `fecha_emision`,`f`.`monto_total` AS `monto_total`,`s`.`tipo_servicio` AS `tipo_servicio`,(case when (`s`.`tipo_servicio` = 'S') then 'Servicio Técnico' when (`s`.`tipo_servicio` = 'V') then 'Venta Directa' else 'Otro' end) AS `categoria_servicio` from (`factura` `f` join `servicio_prestado` `s` on((`f`.`id_servicio` = `s`.`id_servicio`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `infoinventario`
--

/*!50001 DROP VIEW IF EXISTS `infoinventario`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `infoinventario` AS select `p`.`id_producto` AS `id_producto`,`p`.`marca` AS `marca`,`p`.`descripcion` AS `descripcion`,`p`.`inventario` AS `stock`,`p`.`costo` AS `costo`,`p`.`proveedor` AS `proveedor`,`cat`.`nombre` AS `categoria_nombre` from (`producto` `p` join `catalogo` `cat` on((`p`.`id_catalogo` = `cat`.`id_catalogo`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `infoserviciotecnico`
--

/*!50001 DROP VIEW IF EXISTS `infoserviciotecnico`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb3 */;
/*!50001 SET character_set_results     = utf8mb3 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `infoserviciotecnico` AS select `e`.`id_empleado` AS `id_empleado`,`e`.`nombre` AS `nombre_empleado`,`eq`.`id_equipo` AS `id_equipo`,`eq`.`modelo` AS `modelo_equipo`,`eq`.`tipo_equipo` AS `tipo_equipo`,`eq`.`estado_equipo` AS `estado_equipo`,`st`.`descripcion` AS `descripcion_servicio`,`c`.`nombre` AS `nombre_cliente`,`c`.`apellido_persona` AS `apellido_cliente` from (((`servicio_tecnico` `st` join `empleado` `e` on((`st`.`idEmpleado` = `e`.`id_empleado`))) join `equipo` `eq` on((`st`.`id_equipo` = `eq`.`id_equipo`))) join `cliente` `c` on((`eq`.`id_cliente` = `c`.`id_cliente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-17 11:26:50


-- SP para hacer CRUD con las tablas principales

-- CRUD DE LA TABLA CLIENTE

-- INSERT DE LA TABLA CLIENTE

DROP PROCEDURE IF EXISTS sp_insert_cliente;
DELIMITER $$

CREATE PROCEDURE sp_insert_cliente (
    IN p_nombre VARCHAR(120),
    IN p_RUC_empresa CHAR(13),
    IN p_telefono VARCHAR(20),
    IN p_correo VARCHAR(120),
    IN p_cedula_persona CHAR(10),
    IN p_apellido_persona VARCHAR(100),
    IN p_tipo_cliente ENUM('persona','empresa')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al insertar el cliente';
    END;

    START TRANSACTION;

    -- VALIDACIONES GENERALES
    IF p_nombre IS NULL OR p_nombre = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre es obligatorio';
    END IF;

    IF p_telefono IS NULL OR p_telefono = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El teléfono es obligatorio';
    END IF;

    IF p_tipo_cliente IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de cliente es obligatorio';
    END IF;

    -- VALIDACIONES POR TIPO
    IF p_tipo_cliente = 'persona' THEN

        IF p_cedula_persona IS NULL OR p_apellido_persona IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cliente persona requiere cédula y apellido';
        END IF;

        SET p_RUC_empresa = NULL;

    ELSEIF p_tipo_cliente = 'empresa' THEN

        IF p_RUC_empresa IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cliente empresa requiere RUC';
        END IF;

        SET p_cedula_persona = NULL;
        SET p_apellido_persona = NULL;

    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tipo de cliente no válido';
    END IF;

    -- INSERCIÓN FINAL
    INSERT INTO cliente (
        nombre,
        telefono,
        correo,
        tipo_cliente,
        cedula_persona,
        apellido_persona,
        RUC_empresa
    ) VALUES (
        p_nombre,
        p_telefono,
        p_correo,
        p_tipo_cliente,
        p_cedula_persona,
        p_apellido_persona,
        p_RUC_empresa
    );

    COMMIT;
END$$

DELIMITER ;

-- UPDATE DE LA TABLA CLIENTES

DROP PROCEDURE IF EXISTS sp_update_cliente;
DELIMITER $$

CREATE PROCEDURE sp_update_cliente (
    IN p_id_cliente INT,
    IN p_nombre VARCHAR(120),
    IN p_RUC_empresa CHAR(13),
    IN p_telefono VARCHAR(20),
    IN p_correo VARCHAR(120),
	IN p_cedula_persona CHAR(10),
    IN p_apellido_persona VARCHAR(100),
    IN p_tipo_cliente ENUM('persona','empresa')
)
BEGIN
    DECLARE v_existe INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al actualizar el cliente';
    END;

    START TRANSACTION;

    -- VALIDAR ID
    IF p_id_cliente IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El ID del cliente es obligatorio';
    END IF;

    -- VALIDAR EXISTENCIA
    SELECT COUNT(*) INTO v_existe
    FROM cliente
    WHERE id_cliente = p_id_cliente;

    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente no existe';
    END IF;

    -- VALIDACIONES GENERALES
    IF p_nombre IS NULL OR p_nombre = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre es obligatorio';
    END IF;

    IF p_telefono IS NULL OR p_telefono = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El teléfono es obligatorio';
    END IF;

    IF p_tipo_cliente IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El tipo de cliente es obligatorio';
    END IF;

    -- VALIDACIONES POR TIPO
    IF p_tipo_cliente = 'persona' THEN

        IF p_cedula_persona IS NULL OR p_apellido_persona IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cliente persona requiere cédula y apellido';
        END IF;

        SET p_RUC_empresa = NULL;

    ELSEIF p_tipo_cliente = 'empresa' THEN

        IF p_RUC_empresa IS NULL THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cliente empresa requiere RUC';
        END IF;

        SET p_cedula_persona = NULL;
        SET p_apellido_persona = NULL;

    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tipo de cliente no válido';
    END IF;

    -- ACTUALIZACIÓN
    UPDATE cliente
    SET
        nombre = p_nombre,
        telefono = p_telefono,
        correo = p_correo,
        tipo_cliente = p_tipo_cliente,
        cedula_persona = p_cedula_persona,
        apellido_persona = p_apellido_persona,
        RUC_empresa = p_RUC_empresa
    WHERE id_cliente = p_id_cliente;

    COMMIT;
END$$

DELIMITER ;

-- DELETE DE TABLA CLIENTES

DROP PROCEDURE IF EXISTS sp_delete_cliente;
DELIMITER $$

CREATE PROCEDURE sp_delete_cliente (
    IN p_id_cliente INT
)
BEGIN
    DECLARE v_existe INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al eliminar el cliente';
    END;

    START TRANSACTION;

    -- VALIDAR ID
    IF p_id_cliente IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El ID del cliente es obligatorio';
    END IF;

    -- VALIDAR EXISTENCIA
    SELECT COUNT(*) INTO v_existe
    FROM cliente
    WHERE id_cliente = p_id_cliente;

    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cliente no existe';
    END IF;

    -- ELIMINACIÓN
    DELETE FROM cliente
    WHERE id_cliente = p_id_cliente;

    COMMIT;
END$$

DELIMITER ;

-- INSERT DE TABLA SERVICIO_PRESTADO
DROP PROCEDURE IF EXISTS sp_insert_servicio_prestado;
DELIMITER $$

CREATE PROCEDURE sp_insert_servicio_prestado (
    IN p_fecha DATE,
    IN p_id_cliente INT,
    IN p_tipo_servicio CHAR(1)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al insertar el servicio prestado';
    END;

    START TRANSACTION;

    -- VALIDAR FECHA
    IF p_fecha IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha es obligatoria';
    END IF;

    -- VALIDAR TIPO SERVICIO (SI VIENE)
    IF p_tipo_servicio IS NOT NULL AND p_tipo_servicio NOT IN ('S','V') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tipo de servicio inválido (S o V)';
    END IF;

    -- INSERCIÓN
    INSERT INTO servicio_prestado (
        fecha,
        id_cliente,
        tipo_servicio
    ) VALUES (
        p_fecha,
        p_id_cliente,
        p_tipo_servicio
    );

    COMMIT;
END$$

DELIMITER ;

-- UPDATE DE TABLA SERVICIO_PRESTADO

DROP PROCEDURE IF EXISTS sp_update_servicio_prestado;
DELIMITER $$

CREATE PROCEDURE sp_update_servicio_prestado (
    IN p_id_servicio INT,
    IN p_fecha DATE,
    IN p_id_cliente INT,
    IN p_tipo_servicio CHAR(1)
)
BEGIN
    DECLARE v_existe INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al actualizar el servicio prestado';
    END;

    START TRANSACTION;

    -- VALIDAR ID
    IF p_id_servicio IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El ID del servicio es obligatorio';
    END IF;

    -- VALIDAR EXISTENCIA
    SELECT COUNT(*) INTO v_existe
    FROM servicio_prestado
    WHERE id_servicio = p_id_servicio;

    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El servicio prestado no existe';
    END IF;

    -- VALIDACIONES GENERALES
    IF p_fecha IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La fecha es obligatoria';
    END IF;

    -- VALIDAR TIPO SERVICIO
    IF p_tipo_servicio IS NOT NULL AND p_tipo_servicio NOT IN ('S','V') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tipo de servicio inválido (S o V)';
    END IF;

    -- ACTUALIZACIÓN
    UPDATE servicio_prestado
    SET
        fecha = p_fecha,
        id_cliente = p_id_cliente,
        tipo_servicio = p_tipo_servicio
    WHERE id_servicio = p_id_servicio;

    COMMIT;
END$$

DELIMITER ;

-- DELETE DE SERVICIO PRESTADO

DROP PROCEDURE IF EXISTS sp_delete_servicio_prestado;
DELIMITER $$

CREATE PROCEDURE sp_delete_servicio_prestado (
    IN p_id_servicio INT
)
BEGIN
    DECLARE v_existe INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al eliminar el servicio prestado';
    END;

    START TRANSACTION;

    -- VALIDAR ID
    IF p_id_servicio IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El ID del servicio es obligatorio';
    END IF;

    -- VALIDAR EXISTENCIA
    SELECT COUNT(*) INTO v_existe
    FROM servicio_prestado
    WHERE id_servicio = p_id_servicio;

    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El servicio prestado no existe';
    END IF;

    -- ELIMINACIÓN
    DELETE FROM servicio_prestado
    WHERE id_servicio = p_id_servicio;

    COMMIT;
END$$

DELIMITER ;

-- INSERT DE TABLA EMPLEADO

DROP PROCEDURE IF EXISTS sp_insert_empleado;
DELIMITER $$

CREATE PROCEDURE sp_insert_empleado (
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_cedula VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_tipo_empleado ENUM('técnico','cajero')
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al insertar el empleado';
    END;

    START TRANSACTION;

    -- VALIDACIONES
    IF p_nombre IS NULL OR p_nombre = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre es obligatorio';
    END IF;

    IF p_apellido IS NULL OR p_apellido = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El apellido es obligatorio';
    END IF;

    IF p_tipo_empleado IS NOT NULL 
       AND p_tipo_empleado NOT IN ('técnico','cajero') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tipo de empleado inválido';
    END IF;

    -- INSERCIÓN
    INSERT INTO empleado (
        nombre,
        apellido,
        cedula,
        telefono,
        tipo_empleado
    ) VALUES (
        p_nombre,
        p_apellido,
        p_cedula,
        p_telefono,
        p_tipo_empleado
    );

    COMMIT;
END$$

DELIMITER ;

-- UPDATE DE TABLA EMPLEADO
DROP PROCEDURE IF EXISTS sp_update_empleado;

DELIMITER $$

CREATE PROCEDURE sp_update_empleado (
    IN p_id_empleado INT,
    IN p_nombre VARCHAR(100),
    IN p_apellido VARCHAR(100),
    IN p_cedula VARCHAR(100),
    IN p_telefono VARCHAR(20),
    IN p_tipo_empleado ENUM('técnico','cajero')
)
BEGIN
    DECLARE v_existe INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al actualizar el empleado';
    END;

    START TRANSACTION;

    -- VALIDAR ID
    IF p_id_empleado IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El ID del empleado es obligatorio';
    END IF;

    -- VALIDAR EXISTENCIA
    SELECT COUNT(*) INTO v_existe
    FROM empleado
    WHERE id_empleado = p_id_empleado;

    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El empleado no existe';
    END IF;

    -- VALIDACIONES
    IF p_nombre IS NULL OR p_nombre = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre es obligatorio';
    END IF;

    IF p_apellido IS NULL OR p_apellido = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El apellido es obligatorio';
    END IF;

    IF p_tipo_empleado IS NOT NULL 
       AND p_tipo_empleado NOT IN ('técnico','cajero') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tipo de empleado inválido';
    END IF;

    -- ACTUALIZACIÓN
    UPDATE empleado
    SET
        nombre = p_nombre,
        apellido = p_apellido,
        cedula = p_cedula,
        telefono = p_telefono,
        tipo_empleado = p_tipo_empleado
    WHERE id_empleado = p_id_empleado;

    COMMIT;
END$$

DELIMITER ;

-- DELETE DE LA TABLA EMPLEADO
DROP PROCEDURE IF EXISTS sp_delete_empleado;
DELIMITER $$

CREATE PROCEDURE sp_delete_empleado(
    IN p_cedula CHAR(10)
)
BEGIN
    -- Verificar que el empleado exista
    IF NOT EXISTS (
        SELECT 1
        FROM empleado
        WHERE cedula = p_cedula
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No existe un empleado con esa cédula';
    ELSE
        DELETE FROM empleado
        WHERE cedula = p_cedula;
    END IF;
END$$

DELIMITER ;


-- INSERT DE LA TABLA FACTURA
DROP PROCEDURE IF EXISTS sp_insert_factura;

DELIMITER $$

CREATE PROCEDURE sp_insert_factura (
    IN p_id_servicio INT,
    IN p_nro_factura INT,
    IN p_fecha_emision DATE,
    IN p_monto_total DECIMAL(12,2)
)
BEGIN
    DECLARE v_existe_servicio INT;
    DECLARE v_existe_factura INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al insertar la factura';
    END;

    START TRANSACTION;

    -- VALIDAR ID SERVICIO
    IF p_id_servicio IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El id_servicio es obligatorio';
    END IF;

    -- VALIDAR SERVICIO EXISTENTE
    SELECT COUNT(*) INTO v_existe_servicio
    FROM servicio_prestado
    WHERE id_servicio = p_id_servicio;

    IF v_existe_servicio = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El servicio prestado no existe';
    END IF;

    -- VALIDAR QUE NO EXISTA FACTURA
    SELECT COUNT(*) INTO v_existe_factura
    FROM factura
    WHERE id_servicio = p_id_servicio;

    IF v_existe_factura > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Ya existe una factura para este servicio';
    END IF;

    -- VALIDACIONES GENERALES
    IF p_nro_factura IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El número de factura es obligatorio';
    END IF;

    IF p_monto_total IS NULL OR p_monto_total <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El monto total debe ser mayor a cero';
    END IF;

    -- INSERCIÓN
    INSERT INTO factura (
        id_servicio,
        nro_factura,
        fecha_emision,
        monto_total
    ) VALUES (
        p_id_servicio,
        p_nro_factura,
        p_fecha_emision,
        p_monto_total
    );

    COMMIT;
END$$

DELIMITER ;

-- UPDATE DE LA TABLA FACTURA
DROP PROCEDURE IF EXISTS sp_update_factura;

DELIMITER $$

CREATE PROCEDURE sp_update_factura (
    IN p_id_servicio INT,
    IN p_nro_factura INT,
    IN p_fecha_emision DATE,
    IN p_monto_total DECIMAL(12,2)
)
BEGIN
    DECLARE v_existe INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al actualizar la factura';
    END;

    START TRANSACTION;

    -- VALIDAR ID SERVICIO
    IF p_id_servicio IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El id_servicio es obligatorio';
    END IF;

    -- VALIDAR EXISTENCIA FACTURA
    SELECT COUNT(*) INTO v_existe
    FROM factura
    WHERE id_servicio = p_id_servicio;

    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La factura no existe';
    END IF;

    -- VALIDACIONES
    IF p_nro_factura IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El número de factura es obligatorio';
    END IF;

    IF p_monto_total IS NULL OR p_monto_total <= 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El monto total debe ser mayor a cero';
    END IF;

    -- ACTUALIZACIÓN
    UPDATE factura
    SET
        nro_factura = p_nro_factura,
        fecha_emision = p_fecha_emision,
        monto_total = p_monto_total
    WHERE id_servicio = p_id_servicio;

    COMMIT;
END$$

DELIMITER ;


-- DELETE DE LA TABLA FACTURA
DROP PROCEDURE IF EXISTS sp_delete_factura;
DELIMITER $$

CREATE PROCEDURE sp_delete_factura (
    IN p_id_servicio INT
)
BEGIN
    DECLARE v_existe INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al eliminar la factura';
    END;

    START TRANSACTION;

    -- VALIDAR ID
    IF p_id_servicio IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El id_servicio es obligatorio';
    END IF;

    -- VALIDAR EXISTENCIA
    SELECT COUNT(*) INTO v_existe
    FROM factura
    WHERE id_servicio = p_id_servicio;

    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La factura no existe';
    END IF;

    -- ELIMINACIÓN
    DELETE FROM factura
    WHERE id_servicio = p_id_servicio;

    COMMIT;
END$$

DELIMITER ;

-- INSERT DE LA TABLA EQUIPO
DROP PROCEDURE IF EXISTS sp_insert_equipo;
DELIMITER $$

CREATE PROCEDURE sp_insert_equipo (
    IN p_marcha VARCHAR(50),
    IN p_modelo VARCHAR(50),
    IN p_numero_serial VARCHAR(50),
    IN p_tipo_equipo ENUM('computadora','celular','impresora'),
    IN p_estado_equipo VARCHAR(20),
    IN p_descripcion VARCHAR(255),
    IN p_codigo_seguridad VARCHAR(100),
    IN p_id_cliente INT
)
BEGIN
    DECLARE v_existe_cliente INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al insertar el equipo';
    END;

    START TRANSACTION;

    -- VALIDACIONES OBLIGATORIAS
    IF p_marcha IS NULL OR p_marcha = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La marcha es obligatoria';
    END IF;

    IF p_modelo IS NULL OR p_modelo = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El modelo es obligatorio';
    END IF;

    IF p_numero_serial IS NULL OR p_numero_serial = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El número de serie es obligatorio';
    END IF;

    -- VALIDAR TIPO EQUIPO
    IF p_tipo_equipo IS NOT NULL 
       AND p_tipo_equipo NOT IN ('computadora','celular','impresora') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tipo de equipo inválido';
    END IF;

    -- VALIDAR CLIENTE (SI SE ENVÍA)
    IF p_id_cliente IS NOT NULL THEN
        SELECT COUNT(*) INTO v_existe_cliente
        FROM cliente
        WHERE id_cliente = p_id_cliente;

        IF v_existe_cliente = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El cliente asociado no existe';
        END IF;
    END IF;

    -- INSERCIÓN
    INSERT INTO equipo (
        marcha,
        modelo,
        numero_serial,
        tipo_equipo,
        estado_equipo,
        descripcion,
        codigo_seguridad,
        id_cliente
    ) VALUES (
        p_marcha,
        p_modelo,
        p_numero_serial,
        p_tipo_equipo,
        p_estado_equipo,
        p_descripcion,
        p_codigo_seguridad,
        p_id_cliente
    );

    COMMIT;
END$$

DELIMITER ;

-- UPDATE DE LA TABLA EQUIPO
DROP PROCEDURE IF EXISTS sp_update_equipo;
DELIMITER $$

CREATE PROCEDURE sp_update_equipo (
    IN p_id_equipo INT,
    IN p_marcha VARCHAR(50),
    IN p_modelo VARCHAR(50),
    IN p_numero_serial VARCHAR(50),
    IN p_tipo_equipo ENUM('computadora','celular','impresora'),
    IN p_estado_equipo VARCHAR(20),
    IN p_descripcion VARCHAR(255),
    IN p_codigo_seguridad VARCHAR(100),
    IN p_id_cliente INT
)
BEGIN
    DECLARE v_existe_equipo INT;
    DECLARE v_existe_cliente INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al actualizar el equipo';
    END;

    START TRANSACTION;

    -- VALIDAR ID EQUIPO
    IF p_id_equipo IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El ID del equipo es obligatorio';
    END IF;

    -- VALIDAR EXISTENCIA EQUIPO
    SELECT COUNT(*) INTO v_existe_equipo
    FROM equipo
    WHERE id_equipo = p_id_equipo;

    IF v_existe_equipo = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El equipo no existe';
    END IF;

    -- VALIDACIONES OBLIGATORIAS
    IF p_marcha IS NULL OR p_marcha = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La marcha es obligatoria';
    END IF;

    IF p_modelo IS NULL OR p_modelo = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El modelo es obligatorio';
    END IF;

    IF p_numero_serial IS NULL OR p_numero_serial = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El número de serie es obligatorio';
    END IF;

    -- VALIDAR TIPO EQUIPO
    IF p_tipo_equipo IS NOT NULL 
       AND p_tipo_equipo NOT IN ('computadora','celular','impresora') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Tipo de equipo inválido';
    END IF;

    -- VALIDAR CLIENTE (SI SE ENVÍA)
    IF p_id_cliente IS NOT NULL THEN
        SELECT COUNT(*) INTO v_existe_cliente
        FROM cliente
        WHERE id_cliente = p_id_cliente;

        IF v_existe_cliente = 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'El cliente asociado no existe';
        END IF;
    END IF;

    -- ACTUALIZACIÓN
    UPDATE equipo
    SET
        marcha = p_marcha,
        modelo = p_modelo,
        numero_serial = p_numero_serial,
        tipo_equipo = p_tipo_equipo,
        estado_equipo = p_estado_equipo,
        descripcion = p_descripcion,
        codigo_seguridad = p_codigo_seguridad,
        id_cliente = p_id_cliente
    WHERE id_equipo = p_id_equipo;

    COMMIT;
END$$

DELIMITER ;

-- DELETE DE LA TABLA EQUIPO
DROP PROCEDURE IF EXISTS sp_delete_equipo;
DELIMITER $$

CREATE PROCEDURE sp_delete_equipo (
    IN p_id_equipo INT
)
BEGIN
    DECLARE v_existe INT;

    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al eliminar el equipo';
    END;

    START TRANSACTION;

    -- VALIDAR ID
    IF p_id_equipo IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El ID del equipo es obligatorio';
    END IF;

    -- VALIDAR EXISTENCIA
    SELECT COUNT(*) INTO v_existe
    FROM equipo
    WHERE id_equipo = p_id_equipo;

    IF v_existe = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El equipo no existe';
    END IF;

    -- ELIMINACIÓN
    DELETE FROM equipo
    WHERE id_equipo = p_id_equipo;

    COMMIT;
END$$

DELIMITER ;

-- INSERT DE LA TABLA SERVICIO_TECNICO
DROP PROCEDURE IF EXISTS sp_insert_servicio_tecnico;
DELIMITER $$

CREATE PROCEDURE sp_insert_servicio_tecnico(
    IN p_id_servicio INT,
    IN p_tipo VARCHAR(50),
    IN p_descripcion VARCHAR(255),
    IN p_piezas_utilizadas VARCHAR(255),
    IN p_id_equipo INT,
    IN p_idEmpleado INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al insertar el servicio técnico';
    END;

    START TRANSACTION;

    -- VALIDAR SERVICIO PRESTADO
    IF p_id_servicio IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El id_servicio es obligatorio';
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM servicio_prestado
        WHERE id_servicio = p_id_servicio
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El servicio prestado no existe';
    END IF;

    -- VALIDAR EQUIPO (SI SE ENVÍA)
    IF p_id_equipo IS NOT NULL AND
       NOT EXISTS (
           SELECT 1 FROM equipo
           WHERE id_equipo = p_id_equipo
       ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El equipo no existe';
    END IF;

    -- VALIDAR EMPLEADO (SI SE ENVÍA)
    IF p_idEmpleado IS NOT NULL AND
       NOT EXISTS (
           SELECT 1 FROM empleado
           WHERE id_empleado = p_idEmpleado
       ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El empleado no existe';
    END IF;

    -- INSERT
    INSERT INTO servicio_tecnico (
        id_servicio,
        tipo,
        descripcion,
        piezas_utilizadas,
        id_equipo,
        idEmpleado
    ) VALUES (
        p_id_servicio,
        p_tipo,
        p_descripcion,
        p_piezas_utilizadas,
        p_id_equipo,
        p_idEmpleado
    );

    COMMIT;
END$$

DELIMITER ;

-- UPDATE DE LA TABLA SERVICIO_TECNICO
DROP PROCEDURE IF EXISTS sp_update_servicio_tecnico;
DELIMITER $$

CREATE PROCEDURE sp_update_servicio_tecnico(
    IN p_id_servicio_tec INT,
    IN p_tipo VARCHAR(50),
    IN p_descripcion VARCHAR(255),
    IN p_piezas_utilizadas VARCHAR(255),
    IN p_id_equipo INT,
    IN p_idEmpleado INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al actualizar el servicio técnico';
    END;

    START TRANSACTION;

    -- VALIDAR EXISTENCIA DEL SERVICIO TECNICO
    IF NOT EXISTS (
        SELECT 1 FROM servicio_tecnico
        WHERE id_servicio_tec = p_id_servicio_tec
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El servicio técnico no existe';
    END IF;

    -- VALIDAR EQUIPO
    IF p_id_equipo IS NOT NULL AND
       NOT EXISTS (
           SELECT 1 FROM equipo
           WHERE id_equipo = p_id_equipo
       ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El equipo no existe';
    END IF;

    -- VALIDAR EMPLEADO
    IF p_idEmpleado IS NOT NULL AND
       NOT EXISTS (
           SELECT 1 FROM empleado
           WHERE id_empleado = p_idEmpleado
       ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El empleado no existe';
    END IF;

    -- UPDATE
    UPDATE servicio_tecnico
    SET
        tipo = p_tipo,
        descripcion = p_descripcion,
        piezas_utilizadas = p_piezas_utilizadas,
        id_equipo = p_id_equipo,
        idEmpleado = p_idEmpleado
    WHERE id_servicio_tec = p_id_servicio_tec;

    COMMIT;
END$$

DELIMITER ;

-- DELETE DE LA TABLA SERVICIO_TECNICO
DROP PROCEDURE IF EXISTS sp_delete_servicio_tecnico;
DELIMITER $$

CREATE PROCEDURE sp_delete_servicio_tecnico(
    IN p_id_servicio_tec INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al eliminar el servicio técnico';
    END;

    START TRANSACTION;

    -- VALIDAR EXISTENCIA
    IF NOT EXISTS (
        SELECT 1 FROM servicio_tecnico
        WHERE id_servicio_tec = p_id_servicio_tec
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El servicio técnico no existe';
    END IF;

    DELETE FROM servicio_tecnico
    WHERE id_servicio_tec = p_id_servicio_tec;

    COMMIT;
END$$

DELIMITER ;

-- INSERT DE LA TABLA VENTA
DROP PROCEDURE IF EXISTS sp_insert_venta;
DELIMITER $$

CREATE PROCEDURE sp_insert_venta(
    IN p_id_servicio INT,
    IN p_tipo_pago VARCHAR(40),
    IN p_id_cajero INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al insertar la venta';
    END;

    START TRANSACTION;

    -- VALIDAR SERVICIO PRESTADO
    IF p_id_servicio IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El id_servicio es obligatorio';
    END IF;

    IF NOT EXISTS (
        SELECT 1 FROM servicio_prestado
        WHERE id_servicio = p_id_servicio
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El servicio prestado no existe';
    END IF;

    -- VALIDAR CAJERO (SI SE ENVÍA)
    IF p_id_cajero IS NOT NULL AND
       NOT EXISTS (
           SELECT 1 FROM empleado
           WHERE id_empleado = p_id_cajero
       ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cajero no existe';
    END IF;

    -- INSERT
    INSERT INTO venta (
        id_servicio,
        tipo_pago,
        id_cajero
    ) VALUES (
        p_id_servicio,
        p_tipo_pago,
        p_id_cajero
    );

    COMMIT;
END$$

DELIMITER ;
-- UPDATE DE LA TABLA VENTA
DROP PROCEDURE IF EXISTS sp_update_venta;
DELIMITER $$

CREATE PROCEDURE sp_update_venta(
    IN p_id_venta INT,
    IN p_tipo_pago VARCHAR(40),
    IN p_id_cajero INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al actualizar la venta';
    END;

    START TRANSACTION;

    -- VALIDAR EXISTENCIA DE LA VENTA
    IF NOT EXISTS (
        SELECT 1 FROM venta
        WHERE id_venta = p_id_venta
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La venta no existe';
    END IF;

    -- VALIDAR CAJERO
    IF p_id_cajero IS NOT NULL AND
       NOT EXISTS (
           SELECT 1 FROM empleado
           WHERE id_empleado = p_id_cajero
       ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El cajero no existe';
    END IF;

    -- UPDATE
    UPDATE venta
    SET
        tipo_pago = p_tipo_pago,
        id_cajero = p_id_cajero
    WHERE id_venta = p_id_venta;

    COMMIT;
END$$

DELIMITER ;

-- DELETE DE LA TABLA VENTA
DROP PROCEDURE IF EXISTS sp_delete_venta;
DELIMITER $$

CREATE PROCEDURE sp_delete_venta(
    IN p_id_venta INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al eliminar la venta';
    END;

    START TRANSACTION;

    -- VALIDAR EXISTENCIA
    IF NOT EXISTS (
        SELECT 1 FROM venta
        WHERE id_venta = p_id_venta
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'La venta no existe';
    END IF;

    DELETE FROM venta
    WHERE id_venta = p_id_venta;

    COMMIT;
END$$

DELIMITER ;
-- INSERT DE LA TABLA CATALOGO
DROP PROCEDURE IF EXISTS sp_insert_catalogo;
DELIMITER $$

CREATE PROCEDURE sp_insert_catalogo(
    IN p_nombre VARCHAR(60),
    IN p_descripcion VARCHAR(255)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al insertar el catálogo';
    END;

    START TRANSACTION;

    -- VALIDACIÓN 
    IF p_nombre IS NOT NULL AND LENGTH(p_nombre) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre del catálogo no puede ser vacío';
    END IF;

    INSERT INTO catalogo (
        nombre,
        descripcion
    ) VALUES (
        p_nombre,
        p_descripcion
    );

    COMMIT;
END$$

DELIMITER ;

-- UPDATE DE LA TABLA CATALOGO
DROP PROCEDURE IF EXISTS sp_update_catalogo;
DELIMITER $$

CREATE PROCEDURE sp_update_catalogo(
    IN p_id_catalogo INT,
    IN p_nombre VARCHAR(60),
    IN p_descripcion VARCHAR(255)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al actualizar el catálogo';
    END;

    START TRANSACTION;

    -- VALIDAR EXISTENCIA
    IF NOT EXISTS (
        SELECT 1 FROM catalogo
        WHERE id_catalogo = p_id_catalogo
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El catálogo no existe';
    END IF;

    -- VALIDACIÓN DE NOMBRE
    IF p_nombre IS NOT NULL AND LENGTH(p_nombre) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El nombre del catálogo no puede ser vacío';
    END IF;

    UPDATE catalogo
    SET
        nombre = p_nombre,
        descripcion = p_descripcion
    WHERE id_catalogo = p_id_catalogo;

    COMMIT;
END$$

DELIMITER ;

-- DELETE DE LA TABLA CATALOGO
DROP PROCEDURE IF EXISTS sp_delete_catalogo;
DELIMITER $$

CREATE PROCEDURE sp_delete_catalogo(
    IN p_id_catalogo INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al eliminar el catálogo';
    END;

    START TRANSACTION;

    -- VALIDAR EXISTENCIA
    IF NOT EXISTS (
        SELECT 1 FROM catalogo
        WHERE id_catalogo = p_id_catalogo
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El catálogo no existe';
    END IF;

    DELETE FROM catalogo
    WHERE id_catalogo = p_id_catalogo;

    COMMIT;
END$$

DELIMITER ;

-- INSERT DE LA TABLA PRODUCTO
DROP PROCEDURE IF EXISTS sp_insert_producto;
DELIMITER $$

CREATE PROCEDURE sp_insert_producto(
    IN p_id_catalogo INT,
    IN p_marca VARCHAR(60),
    IN p_descripcion VARCHAR(255),
    IN p_costo DECIMAL(10,2),
    IN p_proveedor VARCHAR(120),
    IN p_inventario INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al insertar el producto';
    END;

    START TRANSACTION;

    -- VALIDAR CAMPOS OBLIGATORIOS
    IF p_costo IS NULL OR p_costo < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El costo es obligatorio y no puede ser negativo';
    END IF;

    IF p_proveedor IS NULL OR LENGTH(p_proveedor) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El proveedor es obligatorio';
    END IF;

    IF p_inventario IS NULL OR p_inventario < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El inventario es obligatorio y no puede ser negativo';
    END IF;

    -- VALIDAR CATÁLOGO (SI SE ENVÍA)
    IF p_id_catalogo IS NOT NULL AND
       NOT EXISTS (
           SELECT 1 FROM catalogo
           WHERE id_catalogo = p_id_catalogo
       ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El catálogo no existe';
    END IF;

    -- INSERT
    INSERT INTO producto (
        id_catalogo,
        marca,
        descripcion,
        costo,
        proveedor,
        inventario
    ) VALUES (
        p_id_catalogo,
        p_marca,
        p_descripcion,
        p_costo,
        p_proveedor,
        p_inventario
    );

    COMMIT;
END$$

DELIMITER ;

-- UPDATE DE LA TABLA PRODUCTO
DROP PROCEDURE IF EXISTS sp_update_producto;
DELIMITER $$

CREATE PROCEDURE sp_update_producto(
    IN p_id_producto INT,
    IN p_id_catalogo INT,
    IN p_marca VARCHAR(60),
    IN p_descripcion VARCHAR(255),
    IN p_costo DECIMAL(10,2),
    IN p_proveedor VARCHAR(120),
    IN p_inventario INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al actualizar el producto';
    END;

    START TRANSACTION;

    -- VALIDAR EXISTENCIA DEL PRODUCTO
    IF NOT EXISTS (
        SELECT 1 FROM producto
        WHERE id_producto = p_id_producto
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El producto no existe';
    END IF;

    -- VALIDACIONES DE NEGOCIO
    IF p_costo IS NULL OR p_costo < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El costo no puede ser negativo';
    END IF;

    IF p_proveedor IS NULL OR LENGTH(p_proveedor) = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El proveedor es obligatorio';
    END IF;

    IF p_inventario IS NULL OR p_inventario < 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El inventario no puede ser negativo';
    END IF;

    -- VALIDAR CATÁLOGO
    IF p_id_catalogo IS NOT NULL AND
       NOT EXISTS (
           SELECT 1 FROM catalogo
           WHERE id_catalogo = p_id_catalogo
       ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El catálogo no existe';
    END IF;

    -- UPDATE
    UPDATE producto
    SET
        id_catalogo = p_id_catalogo,
        marca = p_marca,
        descripcion = p_descripcion,
        costo = p_costo,
        proveedor = p_proveedor,
        inventario = p_inventario
    WHERE id_producto = p_id_producto;

    COMMIT;
END$$

DELIMITER ;

-- DELETE DE LA TABLA PRODUCTO
DROP PROCEDURE IF EXISTS sp_delete_producto;	
DELIMITER $$

CREATE PROCEDURE sp_delete_producto(
    IN p_id_producto INT
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error al eliminar el producto';
    END;

    START TRANSACTION;

    -- VALIDAR EXISTENCIA
    IF NOT EXISTS (
        SELECT 1 FROM producto
        WHERE id_producto = p_id_producto
    ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El producto no existe';
    END IF;

    DELETE FROM producto
    WHERE id_producto = p_id_producto;

    COMMIT;
END$$

DELIMITER ;

/*
PROCEDIMIENTOS ALMACENADOS

-- CLIENTE
sp_insert_cliente(
    nombre,
    RUC_empresa,
    telefono,
    correo,
    cedula_persona,
    apellido_persona,
    tipo_cliente
)

sp_update_cliente(
    id_cliente,
    nombre,
    RUC_empresa,
    telefono,
    correo,
    cedula_persona,
    apellido_persona,
    tipo_cliente
)

sp_delete_cliente(
    id_cliente
)

-- EMPLEADO
sp_insert_empleado(
    nombre,
    apellido,
    cedula,
    telefono,
    tipo_empleado
)

sp_update_empleado(
    id_empleado,
    nombre,
    apellido,
    cedula,
    telefono,
    tipo_empleado
)

sp_delete_empleado(
    id_empleado
)

-- EQUIPO
sp_insert_equipo(
    marcha,
    modelo,
    numero_serial,
    tipo_equipo,
    estado_equipo,
    descripcion,
    codigo_seguridad,
    id_cliente
)

sp_update_equipo(
    id_equipo,
    marcha,
    modelo,
    numero_serial,
    tipo_equipo,
    estado_equipo,
    descripcion,
    codigo_seguridad,
    id_cliente
)

sp_delete_equipo(
    id_equipo
)

-- SERVICIO PRESTADO
sp_insert_servicio_prestado(
    fecha,
    id_cliente,
    tipo_servicio
)

sp_update_servicio_prestado(
    id_servicio,
    fecha,
    id_cliente,
    tipo_servicio
)

sp_delete_servicio_prestado(
    id_servicio
)

-- SERVICIO TÉCNICO
sp_insert_servicio_tecnico(
    id_servicio,
    tipo,
    descripcion,
    piezas_utilizadas,
    id_equipo,
    idEmpleado
)

sp_update_servicio_tecnico(
    id_servicio_tec,
    tipo,
    descripcion,
    piezas_utilizadas,
    id_equipo,
    idEmpleado
)

sp_delete_servicio_tecnico(
    id_servicio_tec
)

-- CATÁLOGO
sp_insert_catalogo(
    nombre,
    descripcion
)

sp_update_catalogo(
    id_catalogo,
    nombre,
    descripcion
)

sp_delete_catalogo(
    id_catalogo
)

-- PRODUCTO
sp_insert_producto(
    id_catalogo,
    marca,
    descripcion,
    costo,
    proveedor,
    inventario
)

sp_update_producto(
    id_producto,
    id_catalogo,
    marca,
    descripcion,
    costo,
    proveedor,
    inventario
)

sp_delete_producto(
    id_producto
)

-- VENTA
sp_insert_venta(
    id_servicio,
    tipo_pago,
    id_cajero
)

sp_update_venta(
    id_venta,
    tipo_pago,
    id_cajero
)

sp_delete_venta(
    id_venta
)

-- FACTURA
sp_insert_factura(
    id_servicio,
    nro_factura,
    fecha_emision,
    monto_total
)

sp_update_factura(
    id_servicio,
    nro_factura,
    fecha_emision,
    monto_total
)

sp_delete_factura(
    id_servicio
)

*/

-- PRUEBAS
/*
CALL sp_insert_cliente(
  'Juan ',            -- p_nombre
  NULL,              -- p_ruc_empresa
  '0999999999',      -- p_telefono
  'juan@mail.com',   -- p_correo
  '0102030405',      -- p_cedula_persona
  'Perez',           -- p_apellido_persona
  'persona'         -- p_tipo_cliente
);

CALL sp_update_cliente(
  '12',
  'Juan Carlos',            -- p_nombre
  NULL,              -- p_ruc_empresa
  '0999999999',      -- p_telefono
  'juan@mail.com',   -- p_correo
  '0102030405',      -- p_cedula_persona
  'Perez',           -- p_apellido_persona
  'persona'         -- p_tipo_cliente
);

call sp_delete_cliente(12);

CALL sp_insert_servicio_prestado(
  '2026-01-17',
  1,      -- id_cliente
  'S'     -- S o V
);
CALL sp_update_servicio_prestado(
  11,
  '2026-01-18',
  2,
  'V'
);
CALL sp_delete_servicio_prestado(11);

CALL sp_insert_equipo(
  'HP',
  'Pavilion',
  'SN123456',
  'computadora',
  'recibido',
  'Laptop no enciende',
  'ABC123',
  1          -- id_cliente
);
CALL sp_update_equipo(
  11,
  'MAC',
  'Pavilion X',
  'SN123456',
  'computadora',
  'reparado',
  'Cambio de disco',
  'ABC123',
  1
);
CALL sp_delete_equipo(11);

CALL sp_insert_servicio_tecnico(
  1,              -- id_servicio
  'Reparación',
  'Cambio de disco duro',
  'Disco SSD',
  1,              -- id_equipo
  1               -- id_empleado
);
CALL sp_update_servicio_tecnico(
  12,
  'Mantenimiento',
  'Limpieza interna',
  'Aire comprimido',
  1,
  1
);
CALL sp_delete_servicio_tecnico(12);

CALL sp_insert_venta(
  1,          -- id_servicio
  'Efectivo',
  1           -- id_cajero
);
CALL sp_update_venta(
  11,
  'Tarjeta',
  1
);
CALL sp_delete_venta(16);

CALL sp_insert_catalogo(
  'Repuestos',
  'Componentes electrónicos'
);
CALL sp_update_catalogo(
  11,
  'Repuestos PC',
  'Repuestos para computadoras'
);
CALL sp_delete_catalogo(11);

CALL sp_insert_producto(
  1,              -- id_catalogo
  'Kingston',
  'Memoria RAM 8GB',
  45.50,
  'Proveedor X',
  10
);
CALL sp_update_producto(
  11,
  1,
  'Kingston',
  'Memoria RAM 16GB',
  80.00,
  'Proveedor X',
  5
);
CALL sp_delete_producto(11);

CALL sp_delete_factura(1);
CALL sp_insert_factura(
  1,              -- id_servicio
  1001,
  '2026-01-17',
  150.00
);
CALL sp_update_factura(
  1,
  1001,
  '2026-01-18',
  175.00
);

*/