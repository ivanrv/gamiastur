

/* INSERTS ACTIVIDAD*/

INSERT INTO `actividad` VALUES (1, 'Actividad 1', '2018-05-01', '2018-05-01', 0, 0, 0, 'lt1', 'lng1');
INSERT INTO `actividad` VALUES (2, 'Actividad 2', '2018-05-01', '2018-05-01', 0, 0, 0, 'lt2', 'lng2');
INSERT INTO `actividad` VALUES (3, 'Actividad 3', '2018-05-01', '2018-05-01', 0, 0, 0, 'lt3', 'lng3');
INSERT INTO `actividad` VALUES (4, 'Actividad 4', '2018-05-01', '2018-05-01', 0, 0, 0, 'lt4', 'lng4');
INSERT INTO `actividad` VALUES (5, 'Actividad 5', '2018-05-01', '2018-05-01', 0, 0, 0, 'lt5', 'lng5');


/*INSERTS CLIENTE*/

INSERT INTO `cliente` VALUES(2, 'Gestión', 'Actividades Deportivas', CURRENT_DATE, 'deportivas@gamitour.com', 'deportivas12', NULL, NULL, NULL, NULL, 0, CURRENT_DATE, 3);
INSERT INTO `cliente` VALUES(3, 'Gestión', 'Turismo Hostelería', CURRENT_DATE, 'turismo@gamitour.com', 'turismo12', NULL, NULL, NULL, NULL, 0, CURRENT_DATE, 4);
INSERT INTO `cliente` VALUES(4, 'Cliente', 'Apellidos Prueba', '2018-05-01', 'cliente@gamitour.com', 'test', NULL, NULL, NULL, NULL, 0, CURRENT_DATE, 1);
INSERT INTO `cliente` VALUES(5, 'Cliente2', 'Apellidos2 Prueba2', '2018-05-02', 'cliente2@gamitour.com', 'test', NULL, NULL, NULL, NULL, 0, CURRENT_DATE, 1);
INSERT INTO `cliente` VALUES(6, 'Imanol', 'Fernández García', CURRENT_DATE, 'imanol@gamitour.com', 'temporal', NULL, NULL, NULL, NULL, 0, CURRENT_DATE, 2);
INSERT INTO `cliente` VALUES(7, 'Daniel', 'Tascón Coalla', CURRENT_DATE, 'tascon@gamitour.com', 'temporal', NULL, NULL, NULL, NULL, 0, CURRENT_DATE, 2);
INSERT INTO `cliente` VALUES(8, 'Javitxu', 'Rubio Álvarez', CURRENT_DATE, 'javitxu@gamitour.com', 'temporal', NULL, NULL, NULL, NULL, 0, CURRENT_DATE, 2);
INSERT INTO `cliente` VALUES(9, 'Administrador', 'Gamitour Gamiastur', CURRENT_DATE, 'admin@gamitour.com', 'temporal', NULL, NULL, NULL, NULL, 0, CURRENT_DATE, 2);

/*INSERTS CLIENTE_HAS_ACTIVIDAD*/

INSERT INTO `cliente_has_actividad` VALUES(4, 2, 1, CURRENT_DATE, 1);
INSERT INTO `cliente_has_actividad` VALUES(5, 5, 2, CURRENT_DATE, 3);
INSERT INTO `cliente_has_actividad` VALUES(4, 1, 3, CURRENT_DATE, 2);
INSERT INTO `cliente_has_actividad` VALUES(5, 2, 4, CURRENT_DATE, 1);
INSERT INTO `cliente_has_actividad` VALUES(5, 3, 5, CURRENT_DATE, 2);


/*INSERTS ITINERARIO*/

INSERT INTO `itinerario` VALUES(1, 'Itinerario 1', 'Sin clasificar', '2 horas', 'lt1', 'lng1');
INSERT INTO `itinerario` VALUES(2, 'Itinerario 2', 'Sin clasificar', '1 hora', 'lt2', 'lng2');
INSERT INTO `itinerario` VALUES(3, 'Itinerario 3', 'Sin clasificar', '5 horas', 'lt3', 'lng3');
INSERT INTO `itinerario` VALUES(4, 'Itinerario 4', 'Sin clasificar', '0.5 horas', 'lt4', 'lng4');
INSERT INTO `itinerario` VALUES(5, 'Itinerario 5', 'Sin clasificar', '3 horas', 'lt5', 'lng5');


/*INSERTS PARADA*/

INSERT INTO `parada` VALUES (1, 'Parada 1_1', 1, NULL, NULL, NULL, NULL, 1, NULL, 'lt 1_1', 'lng 1_1');
INSERT INTO `parada` VALUES (2, 'Parada 1_2', 2, NULL, NULL, NULL, NULL, 1, NULL, 'lt 1_2', 'lng 1_2');
INSERT INTO `parada` VALUES (3, 'Parada 1_3', 3, NULL, NULL, NULL, NULL, 1, NULL, 'lt 1_3', 'lng 1_3');
INSERT INTO `parada` VALUES (4, 'Parada 3_1', 1, NULL, NULL, NULL, NULL, 3, NULL, 'lt 3_1', 'lng 3_1');
INSERT INTO `parada` VALUES (5, 'Parada 3_2', 2, NULL, NULL, NULL, NULL, 3, NULL, 'lt 3_2', 'lng 3_2');
INSERT INTO `parada` VALUES (6, 'Parada 4_1', 1, NULL, NULL, NULL, NULL, 4, NULL, 'lt 4_1', 'lng 4_1');
INSERT INTO `parada` VALUES (7, 'Parada 4_2', 2, NULL, NULL, NULL, NULL, 4, NULL, 'lt 4_2', 'lng 4_2');
INSERT INTO `parada` VALUES (8, 'Parada 2_1', 1, NULL, NULL, NULL, NULL, 2, NULL, 'lt 2_1', 'lng 2_1');


/*INSERTS PRUEBADEPORTIVA*/

INSERT INTO `pruebadeportiva` VALUES (1, 'Deportiva 1', CURRENT_DATE, CURRENT_DATE, NULL, 0, 1);
INSERT INTO `pruebadeportiva` VALUES (2, 'Deportiva 2', CURRENT_DATE, CURRENT_DATE, NULL, 0, 2);
INSERT INTO `pruebadeportiva` VALUES (3, 'Deportiva 3', CURRENT_DATE, CURRENT_DATE, NULL, 0, 4);
INSERT INTO `pruebadeportiva` VALUES (4, 'Deportiva 4', CURRENT_DATE, CURRENT_DATE, NULL, 0, 8);
INSERT INTO `pruebadeportiva` VALUES (5, 'Deportiva 5', CURRENT_DATE, CURRENT_DATE, NULL, 0, 2);
INSERT INTO `pruebadeportiva` VALUES (6, 'Deportiva 6', CURRENT_DATE, CURRENT_DATE, NULL, 0, 1);
INSERT INTO `pruebadeportiva` VALUES (7, 'Deportiva 7', CURRENT_DATE, CURRENT_DATE, NULL, 0, 5);


/*INSERTS MULTIMEDIA*/

INSERT INTO `multimedia` VALUES (1, CURRENT_DATE, NULL, NULL, NULL, 4, 1, 0);
INSERT INTO `multimedia` VALUES (2, CURRENT_DATE, NULL, NULL, NULL, 5, 1, 0);
INSERT INTO `multimedia` VALUES (3, CURRENT_DATE, NULL, NULL, NULL, 4, 2, 0);
INSERT INTO `multimedia` VALUES (4, CURRENT_DATE, NULL, NULL, NULL, 5, 3, 0);
INSERT INTO `multimedia` VALUES (5, CURRENT_DATE, NULL, NULL, NULL, 5, 2, 0);


/*INSERT COMENTARIO*/

INSERT INTO `comentario` VALUES (1, "Comentario 1", 4, 1);
INSERT INTO `comentario` VALUES (2, "Comentario 1", 4, 3);
INSERT INTO `comentario` VALUES (3, "Comentario 1", 5, 5);
INSERT INTO `comentario` VALUES (4, "Comentario 1", 4, 2);
INSERT INTO `comentario` VALUES (5, "Comentario 1", 5, 2);
INSERT INTO `comentario` VALUES (6, "Comentario 1", 5, 4);


/*INSERT IMAGENACTIVIDAD*/

INSERT INTO `imagenactividad` VALUES (1, NULL, 'Archivo 1', 1);
INSERT INTO `imagenactividad` VALUES (2, NULL, 'Archivo 2', 2);
INSERT INTO `imagenactividad` VALUES (3, NULL, 'Archivo 3', 3);
INSERT INTO `imagenactividad` VALUES (4, NULL, 'Archivo 4', 4);
INSERT INTO `imagenactividad` VALUES (5, NULL, 'Archivo 5', 5);


/*INSERTS NOTICIA*/

INSERT INTO `noticia` VALUES (1, 'Título 1', 'Texto 1', CURRENT_DATE, CURRENT_DATE, 'Imagen 1');
INSERT INTO `noticia` VALUES (2, 'Título 2', 'Texto 2', CURRENT_DATE, CURRENT_DATE, 'Imagen 2');
INSERT INTO `noticia` VALUES (3, 'Título 3', 'Texto 3', CURRENT_DATE, CURRENT_DATE, 'Imagen 3');
INSERT INTO `noticia` VALUES (4, 'Título 4', 'Texto 4', CURRENT_DATE, CURRENT_DATE, 'Imagen 4');
INSERT INTO `noticia` VALUES (5, 'Título 5', 'Texto 5', CURRENT_DATE, CURRENT_DATE, 'Imagen 5');


/*INSERTS PREMIO*/

INSERT INTO `premio` VALUES (1, 'Premio 1', 'Descripción 1', NULL, CURRENT_DATE, CURRENT_DATE, 0, 4);
INSERT INTO `premio` VALUES (2, 'Premio 2', 'Descripción 2', NULL, CURRENT_DATE, CURRENT_DATE, 0, 5);
INSERT INTO `premio` VALUES (3, 'Premio 3', 'Descripción 3', NULL, CURRENT_DATE, CURRENT_DATE, 0, 5);
INSERT INTO `premio` VALUES (4, 'Premio 4', 'Descripción 4', NULL, CURRENT_DATE, CURRENT_DATE, 0, 4);


/*INSERTS PRUEBACULTURAL*/

INSERT INTO `pruebacultural` VALUES (1, 'Cultural 1', 'Pregunta 1', 'Respuesta 1', 0, 1);
INSERT INTO `pruebacultural` VALUES (2, 'Cultural 2', 'Pregunta 2', 'Respuesta 2', 0, 5);
INSERT INTO `pruebacultural` VALUES (3, 'Cultural 3', 'Pregunta 3', 'Respuesta 3', 0, 7);
INSERT INTO `pruebacultural` VALUES (4, 'Cultural 4', 'Pregunta 4', 'Respuesta 4', 0, 2);


/*INSERTS VOTO*/

INSERT INTO `voto` VALUES (1, 0, 4, 1);
INSERT INTO `voto` VALUES (2, 0, 4, 2);
INSERT INTO `voto` VALUES (3, 0, 4, 3);
INSERT INTO `voto` VALUES (4, 0, 4, 4);
INSERT INTO `voto` VALUES (5, 0, 4, 5);
INSERT INTO `voto` VALUES (6, 0, 5, 1);
INSERT INTO `voto` VALUES (7, 0, 5, 2);
INSERT INTO `voto` VALUES (8, 0, 5, 3);
INSERT INTO `voto` VALUES (9, 0, 5, 4);
INSERT INTO `voto` VALUES (10, 0, 5, 5);