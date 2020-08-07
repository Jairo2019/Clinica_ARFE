-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.5.0-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para bd_laboratorio_arfe
CREATE DATABASE IF NOT EXISTS `bd_laboratorio_arfe` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `bd_laboratorio_arfe`;

-- Volcando estructura para tabla bd_laboratorio_arfe.categoria_producto
CREATE TABLE IF NOT EXISTS `categoria_producto` (
  `idCategoriaProducto` int(11) NOT NULL AUTO_INCREMENT,
  `CategoriaProductoNombre` varchar(50) NOT NULL,
  `Description` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`idCategoriaProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_laboratorio_arfe.categoria_producto: ~2 rows (aproximadamente)
/*!40000 ALTER TABLE `categoria_producto` DISABLE KEYS */;
REPLACE INTO `categoria_producto` (`idCategoriaProducto`, `CategoriaProductoNombre`, `Description`) VALUES
	(2, 'Prueba', ''),
	(4, 'Reactivos', '');
/*!40000 ALTER TABLE `categoria_producto` ENABLE KEYS */;

-- Volcando estructura para tabla bd_laboratorio_arfe.facturacion
CREATE TABLE IF NOT EXISTS `facturacion` (
  `NumeroFactura` int(11) NOT NULL AUTO_INCREMENT,
  `FacturacionFecha` varchar(50) NOT NULL DEFAULT '',
  `FacturacionTipoPago` varchar(50) NOT NULL DEFAULT '',
  `FacturacionISV` int(3) NOT NULL,
  `FacturacionSubTotal` decimal(10,2) NOT NULL,
  `FacturacionTotal` varchar(50) NOT NULL DEFAULT '',
  `Paciente_idPaciente` varchar(15) NOT NULL DEFAULT '0',
  `TipoExamen_idTipoExamen` int(20) NOT NULL,
  PRIMARY KEY (`NumeroFactura`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_laboratorio_arfe.facturacion: ~6 rows (aproximadamente)
/*!40000 ALTER TABLE `facturacion` DISABLE KEYS */;
REPLACE INTO `facturacion` (`NumeroFactura`, `FacturacionFecha`, `FacturacionTipoPago`, `FacturacionISV`, `FacturacionSubTotal`, `FacturacionTotal`, `Paciente_idPaciente`, `TipoExamen_idTipoExamen`) VALUES
	(3, '06/08/2020', 'Contado', 15, 120.00, '138.0', '1503199902415', 1),
	(4, '06/08/2020', 'Contado', 15, 120.00, '138.0', '15031999805457', 1),
	(5, '06/08/2020', 'Contado', 15, 100.00, '114.99999999999999', '1503201005458', 1),
	(7, '06/08/2020', 'Contado', 15, 150.00, '172.5', '1503199902415', 1),
	(8, '06/08/2020', 'Contado', 15, 150.00, '172.5', '1503200002610', 1),
	(9, '06/08/2020', 'Contado', 15, 125.00, '143.75', '1503201005458', 1);
/*!40000 ALTER TABLE `facturacion` ENABLE KEYS */;

-- Volcando estructura para tabla bd_laboratorio_arfe.paciente
CREATE TABLE IF NOT EXISTS `paciente` (
  `PacienteIdentidad` varchar(15) NOT NULL DEFAULT '',
  `PacienteFecha` varchar(50) NOT NULL DEFAULT '',
  `PacienteNombres` varchar(30) NOT NULL,
  `PacienteApellidos` varchar(30) NOT NULL,
  `PacienteEdad` int(2) NOT NULL,
  `PacienteSexo` varchar(10) NOT NULL,
  `PacienteTelefono` varchar(10) NOT NULL,
  `PacienteCorreo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`PacienteIdentidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_laboratorio_arfe.paciente: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
REPLACE INTO `paciente` (`PacienteIdentidad`, `PacienteFecha`, `PacienteNombres`, `PacienteApellidos`, `PacienteEdad`, `PacienteSexo`, `PacienteTelefono`, `PacienteCorreo`) VALUES
	('1501199902548', '29/07/2020 16:43:38', 'Bely', 'Mendoza', 20, 'Femenino', '98254875', 'bmedoz1999@gmail.com'),
	('1503199902415', '29/07/2020 16:42:31', 'Gustavo', 'Alonso', 20, 'Masculino', '98251245', 'hackeye99.dc@gmail.com'),
	('15031999805457', '29/07/2020 10:35:02', 'Jonas', 'cruz', 15, 'Masculino', '3515', 'jonas.cruz98@gmail.com'),
	('1503200002610', '06/08/2020 08:15:30', 'Jairo', 'Oseguera', 20, 'Masculino', '94374396', ''),
	('1503201005458', '29/07/2020 15:11:32', 'Eder', 'Rodriguez', 10, 'Masculino', '89457892', 'ema@gmail.com');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;

-- Volcando estructura para tabla bd_laboratorio_arfe.producto
CREATE TABLE IF NOT EXISTS `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `ProductoNombre` varchar(50) NOT NULL,
  `ProductoDescripcion` varchar(250) DEFAULT NULL,
  `ProductoFechaEntrada` varchar(50) NOT NULL DEFAULT '',
  `ProductoFechaVencimiento` varchar(50) NOT NULL DEFAULT '',
  `ProductoCantidadInicial` int(4) NOT NULL,
  `ProductoPrecioUnitario` decimal(14,2) NOT NULL,
  `Categoria_Producto_idCategoriaProducto` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_laboratorio_arfe.producto: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
REPLACE INTO `producto` (`idProducto`, `ProductoNombre`, `ProductoDescripcion`, `ProductoFechaEntrada`, `ProductoFechaVencimiento`, `ProductoCantidadInicial`, `ProductoPrecioUnitario`, `Categoria_Producto_idCategoriaProducto`) VALUES
	(4, 'Sustancia Quimica', '', '06/08/2020', '06/08/2021', 10, 50.00, 3),
	(5, 'solfato de sodio', '', '06/08/2020', '10/08/2021', 10, 50.00, 4);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;

-- Volcando estructura para tabla bd_laboratorio_arfe.tipoexamen
CREATE TABLE IF NOT EXISTS `tipoexamen` (
  `idTipoExamen` int(11) NOT NULL AUTO_INCREMENT,
  `TipoExamenNombre` varchar(50) NOT NULL,
  `TipoExamenDescripcion` varchar(250) NOT NULL,
  PRIMARY KEY (`idTipoExamen`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_laboratorio_arfe.tipoexamen: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `tipoexamen` DISABLE KEYS */;
REPLACE INTO `tipoexamen` (`idTipoExamen`, `TipoExamenNombre`, `TipoExamenDescripcion`) VALUES
	(1, 'Análisis de orina', 'Detectar y controlar padecimientos como infecciones en las vías urinarias.');
/*!40000 ALTER TABLE `tipoexamen` ENABLE KEYS */;

-- Volcando estructura para tabla bd_laboratorio_arfe.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombreusuario` varchar(45) NOT NULL,
  `pass` varchar(8) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla bd_laboratorio_arfe.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
REPLACE INTO `usuario` (`idUsuario`, `nombreusuario`, `pass`) VALUES
	(1, 'admin', '123');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
