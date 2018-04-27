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

INSERT INTO `actividad` VALUES (1, '', '', '', '', 0, 0, 0, '', '');