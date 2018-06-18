CREATE DATABASE `gamitour` /*!40100 DEFAULT CHARACTER SET utf8 */;

-- Creación de tabla Actividad
CREATE TABLE `actividad` (
  `idactividad` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL UNIQUE,
  `fechainicio` date NOT NULL,
  `fechafin` date,
  `numparticipantes` int(11) NOT NULL DEFAULT 0,
  `precio` double NOT NULL DEFAULT 0,
  `puntos` int(11) NOT NULL DEFAULT 0,
  `latitud` varchar(45) NOT NULL,
  `longitud` varchar(45) NOT NULL,
  PRIMARY KEY (`idactividad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Creación de tabla Rol
CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  PRIMARY KEY (`idrol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Inserción de datos en tabla Rol
INSERT INTO `rol` VALUES (1, 'user');
INSERT INTO `rol` VALUES(2, 'admin');
INSERT INTO `rol` VALUES(3, 'deportivas');
INSERT INTO `rol` VALUES(4, 'turismo');

--Creación de tabla Cliente
CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `apellidos` varchar(60) NOT NULL,
  `fechanacimiento` date NOT NULL,
  `email` varchar(45) NOT NULL UNIQUE,
  `password` varchar(45) NOT NULL DEFAULT 'temporal',
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(60) DEFAULT NULL,
  `codigopostal` varchar(10) DEFAULT NULL,
  `avatar` varchar(45) DEFAULT NULL,
  `puntosacumulados` int(11) NOT NULL DEFAULT 0,
  `fecharegistro` date NOT NULL,
  `rol_idrol` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idcliente`),
  KEY `fk_cliente_rol1_idx` (`rol_idrol`),
  CONSTRAINT `fk_cliente_rol1` FOREIGN KEY (`rol_idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--Creación de relación entre Cliente y Actividad
CREATE TABLE `cliente_has_actividad` (
  `cliente_idcliente` int(11) NOT NULL,
  `actividad_idactividad` int(11) NOT NULL,
  `idCliente_has_actividad` int(11) NOT NULL AUTO_INCREMENT,
  `fechaReserva` date NOT NULL,
  `numPersonas` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`idCliente_has_actividad`),
  KEY `fk_cliente_has_actividad_actividad1_idx` (`actividad_idactividad`),
  KEY `fk_cliente_has_actividad_cliente1_idx` (`cliente_idcliente`),
  CONSTRAINT `FK_actividad` FOREIGN KEY (`actividad_idactividad`) REFERENCES `actividad` (`idactividad`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_cliente` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Creación de tabla Itinerario
CREATE TABLE `itinerario` (
  `iditinerario` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL UNIQUE,
  `categoria` varchar(45) NOT NULL DEFAULT 'Sin clasificar',
  `duracion` varchar(15) NOT NULL,
  `latitud` varchar(45) NOT NULL,
  `longitud` varchar(45) NOT NULL,
  PRIMARY KEY (`iditinerario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Creación de tabla Parada
CREATE TABLE `parada` (
  `idparada` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL UNIQUE,
  `numeroParada` int(11) NOT NULL,
  `historia` text DEFAULT NULL,
  `anecdotario` text DEFAULT NULL,
  `gastronomia` text DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `itinerario_iditinerario` int(11) NOT NULL,
  `video` varchar(100) DEFAULT NULL,
  `latitud` varchar(45) NOT NULL,
  `longitud` varchar(45) NOT NULL,
  PRIMARY KEY (`idparada`),
  KEY `fk_parada_itinerario_idx` (`itinerario_iditinerario`),
  CONSTRAINT `fk_parada_itinerario` FOREIGN KEY (`itinerario_iditinerario`) REFERENCES `itinerario` (`iditinerario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Creación de tabla Prueba Deportiva
CREATE TABLE `pruebadeportiva` (
  `idpruebadeportiva` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL UNIQUE,
  `fechainicio` date NOT NULL,
  `fechafin` date,
  `explicacion` varchar(200) DEFAULT NULL,
  `puntos` int(11) NOT NULL DEFAULT 0,
  `parada_idparada` int(11) NOT NULL,
  PRIMARY KEY (`idpruebadeportiva`),
  KEY `fk_pruebaDeportiva_parada1_idx` (`parada_idparada`),
  CONSTRAINT `fk_pruebaDeportiva_parada1` FOREIGN KEY (`parada_idparada`) REFERENCES `parada` (`idparada`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Creación de tabla Multimedia
CREATE TABLE `multimedia` (
  `idmultimedia` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `comentario` varchar(60) DEFAULT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `video` varchar(100) DEFAULT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  `pruebaDeportiva_idpruebadeportiva` int(11) NOT NULL,
  `puntosacumulados` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idmultimedia`),
  KEY `fk_multimedia_cliente1_idx` (`cliente_idcliente`),
  KEY `fk_multimedia_pruebaDeportiva1_idx` (`pruebaDeportiva_idpruebadeportiva`),
  CONSTRAINT `fk_multimedia_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_multimedia_pruebaDeportiva1` FOREIGN KEY (`pruebaDeportiva_idpruebadeportiva`) REFERENCES `pruebadeportiva` (`idpruebadeportiva`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Creación de tabla Comentario
CREATE TABLE `comentario` (
  `idcomentario` int(11) NOT NULL AUTO_INCREMENT,
  `texto` varchar(200) NOT NULL,
  `cliente_idcliente` int(11) NOT NULL,
  `multimedia_idmultimedia` int(11) NOT NULL,
  PRIMARY KEY (`idcomentario`),
  KEY `fk_comentario_cliente1_idx` (`cliente_idcliente`),
  KEY `fk_comentario_multimedia1_idx` (`multimedia_idmultimedia`),
  CONSTRAINT `fk_comentario_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comentario_multimedia1` FOREIGN KEY (`multimedia_idmultimedia`) REFERENCES `multimedia` (`idmultimedia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Creación de tabla Imagen Actividad
CREATE TABLE `imagenactividad` (
  `idImagenActividad` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  `archivo` varchar(100) NOT NULL,
  `idActividad` int(11) NOT NULL UNIQUE,
  PRIMARY KEY (`idImagenActividad`),
  KEY `fk_idactividad_idx` (`idActividad`),
  CONSTRAINT `fk_idactividad` FOREIGN KEY (`idActividad`) REFERENCES `actividad` (`idactividad`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Creación de tabla Noticia
CREATE TABLE `noticia` (
  `idnoticia` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL UNIQUE,
  `texto` text NOT NULL,
  `fechaalta` date NOT NULL,
  `fechacaducidad` date DEFAULT NULL,
  `imagen` varchar(100) NOT NULL,
  PRIMARY KEY (`idnoticia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Creación de tabla Premio
CREATE TABLE `premio` (
  `idpremio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `fechaactivacion` date NOT NULL,
  `fechaconsumo` date DEFAULT NULL,
  `puntos` int(11) NOT NULL DEFAULT 0,
  `cliente_idcliente` int(11),
  PRIMARY KEY (`idpremio`),
  KEY `fk_premio_cliente1_idx` (`cliente_idcliente`),
  CONSTRAINT `fk_premio_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Creación de tabla Prueba Cultural
CREATE TABLE `pruebacultural` (
  `idpruebacultural` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(60) NOT NULL UNIQUE,
  `pregunta` varchar(200) NOT NULL,
  `respuesta` varchar(45) NOT NULL,
  `puntos` int(11) NOT NULL DEFAULT 0,
  `parada_idparada` int(11) NOT NULL,
  PRIMARY KEY (`idpruebacultural`),
  KEY `fk_pruebaCultural_parada1_idx` (`parada_idparada`),
  CONSTRAINT `fk_pruebaCultural_parada1` FOREIGN KEY (`parada_idparada`) REFERENCES `parada` (`idparada`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--Creación de tabla Voto
CREATE TABLE `voto` (
  `idvoto` int(11) NOT NULL AUTO_INCREMENT,
  `puntos` int(11) NOT NULL DEFAULT 0,
  `cliente_idcliente` int(11) NOT NULL,
  `multimedia_idmultimedia` int(11) NOT NULL,
  PRIMARY KEY (`idvoto`),
  KEY `fk_voto_cliente1_idx` (`cliente_idcliente`),
  KEY `fk_voto_multimedia1_idx` (`multimedia_idmultimedia`),
  CONSTRAINT `fk_voto_cliente1` FOREIGN KEY (`cliente_idcliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_voto_multimedia1` FOREIGN KEY (`multimedia_idmultimedia`) REFERENCES `multimedia` (`idmultimedia`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
