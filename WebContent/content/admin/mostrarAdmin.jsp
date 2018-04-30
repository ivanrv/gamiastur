<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <!DOCTYPE html>
            <html lang="es">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>Tabla Admin</title>

                <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
                <link rel="icon" href="${pageContext.servletContext.contextPath}/images/logos/favicon.png">

                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/tablas.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/media.css" type="text/css">

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="http://code.jquery.com/ui/1.11.3/jquery-ui.min.js" integrity="sha256-xI/qyl9vpwWFOXz7+x/9WkG5j/SVnSw21viy8fWwbeE="
                    crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
                <script src="${pageContext.servletContext.contextPath}/js/tablas.js"></script>
                
                <script> 
                	var stringParadas = "[";

                	<c:forEach items="${listaParadas}" var="parada" varStatus="status">
						stringParadas += '{"nombre": "${parada.nombre}", "itinerario": "${parada.itinerario.nombre}", "latitud": "${parada.latitud}", "longitud": "${parada.longitud}"}';
						<c:if test="${!status.last}"> stringParadas += ","</c:if>					
					</c:forEach>
					stringParadas += "]";

                	stringDeportivas = "[";
					<c:forEach items="${listaDeportivas}" var="deportiva" varStatus="status">
						stringDeportivas += '{"nombre": "${deportiva.nombre}", "parada": "${deportiva.parada.nombre}", "fechainicio": "${deportiva.fechainicio}", "explicacion": "${deportiva.explicacion}", "puntos": "${deportiva.puntos}"}';
						<c:if test="${!status.last}"> stringDeportivas += ","</c:if>					
					</c:forEach>
					stringDeportivas += "]";

                	stringCulturales = "[";
					<c:forEach items="${listaCulturales}" var="cultural" varStatus="status">
						stringCulturales += '{"nombre": "${cultural.nombre}", "parada": "${cultural.parada.nombre}", "puntos": "${cultural.puntos}"}';
						<c:if test="${!status.last}"> stringCulturales += ","</c:if>					
					</c:forEach>
					stringCulturales += "]";
					
                </script>
            </head>

            <body>
                <header>
                    <a href="${pageContext.servletContext.contextPath}/content/user/index.jsp">
                        <img src="${pageContext.servletContext.contextPath}/images/logos/logo gris.png">
                    </a>

                    <div class="user">
                        <a href="javascript:void(0)" id="menuUser">
                            <i class="fas fa-angle-down"></i>
                            <ul>
                                <li>Editar Perfil</li>
                                <li class="menuUserB">Mis Actividades</li>
                                <li class="menuUserB">Logros</li>
                                <c:if test="${userRol == 'admin'}">
                                    <li class="menuUserB" id="panel" onclick="location.href='Admin.do'">Panel de Control</li>
                                </c:if>
                                <li class="menuUserB" onclick="location.href='Logout.do'">Cerrar Sesión</li>
                            </ul>
                        </a>
                        <span>
                            <a href="#">${username}</a>
                        </span>
                        <img src="${pageContext.servletContext.contextPath}/images/avatares/Ancla.png">
                    </div>
                </header>

                <nav data-spy="affix" data-offset-top="150">
                    <a href="${pageContext.servletContext.contextPath}/content/user/index.jsp">
                        <i class="fas fa-home"></i> &nbsp; Inicio</a>
                    <a href="#">
                        <i class="far fa-newspaper"></i> &nbsp; Noticias</a>
                    <a href="#">
                        <i class="fas fa-search"></i> &nbsp; Actividades</a>
                    <a href="#" id="menuIti">
                        <i class="fas fa-map"></i> &nbsp; Itinerarios
                        <ul>
                            <li id="gijonIti" onclick="location.href='${pageContext.servletContext.contextPath}/content/itiGijon.html'">
                                <span>Itinerario de Gijón</span>
                            </li>
                            <li id="avilesIti" onclick="location.href='${pageContext.servletContext.contextPath}/content/itiAviles.html'">
                                <span>Itinerario de Avilés</span>
                            </li>
                        </ul>
                    </a>
                    <a href="#">
                        <i class="fas fa-trophy"></i> &nbsp; Premios</a>
                    <a href="#">
                        <i class="fas fa-question"></i> &nbsp; Quiénes somos</a>
                </nav>

                <div class="content">
                    <div class="landing">
                        <h1>Elija la tabla sobre la que quiere trabajar:</h1>
                        <div class="selector">
                            <a href="javascript:void(0)" class="selAdmin" value="tablaActividades">
                                <i class="fas fa-search"></i>
                                <span>Actividades</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdmin" value="tablaClientes">
                                <i class="fas fa-users"></i>
                                <span>Clientes</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdmin" value="tablaComentarios">
                                <i class="fas fa-comments"></i>
                                <span>Comentarios</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdmin" value="tablaItinerarios">
                                <i class="fas fa-map"></i>
                                <span>Itinerarios</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdmin" value="tablaMultimedias">
                                <i class="far fa-file-video"></i>
                                <span>Multimedias</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdmin" value="tablaNoticias">
                                <i class="far fa-newspaper"></i>
                                <span>Noticias</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdmin" value="tablaParadas">
                                <i class="fas fa-map-pin"></i>
                                <span>Paradas</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdmin" value="tablaPremios">
                                <i class="fas fa-trophy"></i>
                                <span>Premios</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdmin" value="tablaCulturales">
                                <i class="fas fa-book"></i>
                                <span>Pruebas Culturales</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdmin" value="tablaDeportivas">
                                <i class="fas fa-volleyball-ball"></i>
                                <span>Pruebas Deportivas</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdmin" value="tablaRoles">
                                <i class="fas fa-user-secret"></i>
                                <span>Roles</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdmin" value="tablaVotos">
                                <i class="far fa-thumbs-up"></i>
                                <span>Votos</span>
                            </a>
                        </div>
                    </div>

                    <div class="admin">
                        <div class="navAdmin">
                            <input type="text" name="buscador" id="buscador" class="textIn inputCon" placeholder="Buscar...">
                            <a href="javascript:void(0)" class="selAdminNav" value="tablaActividades">
                                <i class="fas fa-search"></i>&nbsp;
                                <span>Actividades</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdminNav" value="tablaClientes">
                                <i class="fas fa-users"></i>&nbsp;
                                <span>Clientes</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdminNav" value="tablaComentarios">
                                <i class="fas fa-comments"></i>&nbsp;
                                <span>Comentarios</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdminNav" value="tablaItinerarios">
                                <i class="fas fa-map"></i>&nbsp;
                                <span>Itinerarios</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdminNav" value="tablaMultimedias">
                                <i class="far fa-file-video"></i>&nbsp;
                                <span>Multimedias</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdminNav" value="tablaNoticias">
                                <i class="far fa-newspaper"></i>&nbsp;
                                <span>Noticias</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdminNav" value="tablaParadas">
                                <i class="fas fa-map-pin"></i>&nbsp;
                                <span>Paradas</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdminNav" value="tablaPremios">
                                <i class="fas fa-trophy"></i>&nbsp;
                                <span>Premios</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdminNav" value="tablaCulturales">
                                <i class="fas fa-book"></i>&nbsp;
                                <span>Pruebas Culturales</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdminNav" value="tablaDeportivas">
                                <i class="fas fa-volleyball-ball"></i>&nbsp;
                                <span>Pruebas Deportivas</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdminNav" value="tablaRoles">
                                <i class="fas fa-user-secret"></i>&nbsp;
                                <span>Roles</span>
                            </a>
                            <a href="javascript:void(0)" class="selAdminNav" value="tablaVotos">
                                <i class="far fa-thumbs-up"></i>&nbsp;
                                <span>Votos</span>
                            </a>
                        </div>

                        <div class="tablaHid" id="tablaClientes">
                            <h1>Clientes:</h1>
                            <table class="table table-striped table-responsive">
                                <tr>
                                    <th>Nombre</th>
                                    <th>Apellidos</th>
                                    <th>Email</th>
                                    <th>Fecha de Alta</th>
                                    <th class="theadHide"></th>
                                    <th class="theadHide"></th>
                                </tr>
                                <c:forEach items="${listaClientes}" var="cliente">
                                    <tr class="lineaFiltro">
                                        <td>${cliente.nombre}</td>
                                        <td>${cliente.apellidos}</td>
                                        <td>${cliente.email}</td>
                                        <td>${cliente.fecharegistro}</td>
                                        <td class="btnTabla">
                                            <form action="Mostrar.do" method="post">
                                                <input type="hidden" name="tipo" value="cliente">
                                                <input type="hidden" name="email" value="${cliente.email}">
                                                <button name="submit" value="submit" class="editar">
                                                    <i class="fas fa-info"></i>&nbsp;
                                                    <span>Info</span>
                                                </button>
                                            </form>
                                        </td>
                                        <td class="btnTabla">
                                            <form action="Eliminar.do" method="post">
                                                <input type="hidden" name="tipo" value="cliente">
                                                <input type="hidden" name="email" value="${cliente.email}">
                                                <a href="#modalEliminar" data-toggle="modal" class="eliminar">
                                                    <i class="fas fa-times"></i>&nbsp;
                                                    <span>Eliminar</span>
                                                </a>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>

                        <div class="tablaHid" id="tablaRoles">
                            <h1>Roles:</h1>
                            <table class="table table-striped table-responsive">
                                <tr>
                                    <th>Nombre</th>
                                    <th>Número de clientes</th>
                                    <th>Clientes</th>
                                </tr>
                                <c:forEach items="${listaRoles}" var="rol">
                                    <tr class="lineaFiltro">
                                        <td>${rol.nombre}</td>
                                        <td>${fn:length(rol.clientes)}</td>
                                        <td>
                                            <c:forEach items="${rol.clientes}" var="cliente">
                                                ${cliente.email}
                                                <br/>
                                            </c:forEach>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>

                        <div class="tablaHid" id="tablaActividades">
                            <h1>Actividades:</h1>
                            <table class="table table-striped table-responsive">
                                <tr>
                                    <th>Nombre</th>
                                    <th>Fecha de inicio</th>
                                    <th>Fecha de fin</th>
                                    <th>Ubicación</th>
                                    <th>Participantes</th>
                                    <th class="theadHide"></th>
                                    <th class="theadHide"></th>
                                </tr>
                                <c:forEach items="${listaActividades}" var="actividad">
                                    <tr class="lineaFiltro">
                                        <td>${actividad.nombre}</td>
                                        <td>${actividad.fechainicio}</td>
                                        <td>${actividad.fechafin}</td>
                                        <td>FALTA POR HACER UBICACION</td>
                                        <td>${actividad.numparticipantes}</td>
                                        <td class="btnTabla">
                                            <form action="Mostrar.do" method="post">
                                                <input type="hidden" name="tipo" value="actividad">
                                                <input type="hidden" name="actividad" value="${actividad.nombre}">
                                                <button name="submit" value="submit" class="editar">
                                                    <i class="fas fa-pencil-alt"></i>&nbsp;
                                                    <span>Editar</span>
                                                </button>
                                            </form>
                                        </td>
                                        <td class="btnTabla">
                                            <form action="Eliminar.do" method="post">
                                                <input type="hidden" name="tipo" value="actividad">
                                                <input type="hidden" name="actividad" value="${actividad.nombre}">
                                                <a href="#modalEliminar" data-toggle="modal" class="eliminar">
                                                    <i class="fas fa-times"></i>&nbsp;
                                                    <span>Eliminar</span>
                                                </a>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr style="background-color:transparent">
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="btnTabla">
                                        <a href="${pageContext.servletContext.contextPath}/content/admin/nuevo/nuevaActividad.jsp" class="nuevo">
                                            <i class="fas fa-plus"></i>&nbsp;
                                            <span>Añadir</span>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="tablaHid" id="tablaComentarios">
                            <h1>Comentarios:</h1>
                            <table class="table taable-striped table-responsive">
                                <tr>
                                    <th>Cliente</th>
                                    <th>Multimedia</th>
                                    <th>Texto</th>
                                    <th class="theadHide"></th>
                                </tr>
                                <c:forEach items="${listaComentarios}" var="comentario">
                                    <tr class="lineaFiltro">
                                        <td>${comentario.cliente.email}</td>
                                        <td>Subido por: ${comentario.multimedia.cliente.email} &nbsp; Prueba: ${comentario.multimedia.pruebadeportiva.nombre}</td>
                                        <td>${comentario.texto}</td>
                                        <td class="btnTabla">
                                            <form action="Eliminar.do" method="post">
                                                <input type="hidden" name="tipo" value="comentario">
                                                <input type="hidden" name="email" value="${comentario.cliente.email}">
                                                <input type="hidden" name="emailMult" value="${comentario.multimedia.cliente.email }">
                                                <input type="hidden" name="prueba" value="${comentario.multimedia.pruebadeportiva.nombre}">
                                                <a href="#modalEliminar" data-toggle="modal" class="eliminar">
                                                    <i class="fas fa-times"></i>&nbsp;
                                                    <span>Eliminar</span>
                                                </a>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>

                        <div class="tablaHid" id="tablaItinerarios">
                            <h1>Itinerarios:</h1>
                            <table class="table table-striped table-responsive">
                                <tr>
                                    <th>Nombre</th>
                                    <th>Categoría</th>
                                    <th>Ubicación</th>
                                    <th>Paradas</th>
                                    <th class="theadHide"></th>
                                    <th class="theadHide"></th>
                                </tr>
                                <c:forEach items="${listaItinerarios}" var="itinerario">
                                    <tr class="lineaFiltro">
                                        <td>${itinerario.nombre}</td>
                                        <td>${itinerario.categoria}</td>
                                        <td>FALTA POR HACER UBICACION</td>
                                        <td>
                                            <a href="#modalParadas" value="${itinerario.nombre}" class="itiParadas" data-toggle="modal">
                                                <i class="fas fa-map-pin"></i> Ver paradas
                                            </a>
                                        </td>
                                        <td class="btnTabla">
                                            <form action="Mostrar.do" method="post">
                                                <input type="hidden" name="tipo" value="itinerario">
                                                <input type="hidden" name="itinerario" value="${itinerario.nombre}">
                                                <button name="submit" value="submit" class="editar">
                                                    <i class="fas fa-pencil-alt"></i>&nbsp;
                                                    <span>Editar</span>
                                                </button>
                                            </form>
                                        </td>
                                        <td class="btnTabla">
                                            <form action="Eliminar.do" method="post">
                                                <input type="hidden" name="tipo" value="itinerario">
                                                <input type="hidden" name="itinerario" value="${itinerario.nombre}">
                                                <a href="#modalEliminar" data-toggle="modal" class="eliminar">
                                                    <i class="fas fa-times"></i>&nbsp;
                                                    <span>Eliminar</span>
                                                </a>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr style="background-color:transparent">
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="btnTabla">
                                        <a href="${pageContext.servletContext.contextPath}/content/admin/nuevo/nuevoItinerario.jsp" class="nuevo">
                                            <i class="fas fa-plus"></i>&nbsp;
                                            <span>Añadir</span>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="tablaHid" id="tablaMultimedias">
                            <h1>Multimedias:</h1>
                            <table class="table table-striped table-responsive">
                                <tr>
                                    <th>Cliente</th>
                                    <th>Prueba deportiva</th>
                                    <th>Fecha</th>
                                    <th class="theadHide"></th>
                                    <th class="theadHide"></th>
                                </tr>
                                <c:forEach items="${listaMultimedias}" var="multimedia">
                                    <tr class="lineaFiltro">
                                        <td>${multimedia.cliente.email}</td>
                                        <td>${multimedia.pruebadeportiva.nombre}</td>
                                        <td>${multimedia.fecha}</td>
                                        <td class="btnTabla">
                                            <form action="Mostrar.do" method="post">
                                                <input type="hidden" name="tipo" value="multimedia">
                                                <input type="hidden" name="email" value="${multimedia.cliente.email}">
                                                <input type="hidden" name="prueba" value="${multimedia.pruebadeportiva.nombre }">
                                                <button name="submit" value="submit" class="editar">
                                                    <i class="fas fa-info"></i>&nbsp;
                                                    <span>Info</span>
                                                </button>
                                            </form>
                                        </td>
                                        <td class="btnTabla">
                                            <form action="Eliminar.do" method="post">
                                                <input type="hidden" name="tipo" value="multimedia">
                                                <input type="hidden" name="email" value="${multimedia.cliente.email}">
                                                <input type="hidden" name="prueba" value="${multimedia.pruebadeportiva.nombre }">
                                                <a href="#modalEliminar" data-toggle="modal" class="eliminar">
                                                    <i class="fas fa-times"></i>&nbsp;
                                                    <span>Eliminar</span>
                                                </a>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>

                        <div class="tablaHid" id="tablaNoticias">
                            <h1>Noticias:</h1>
                            <table class="table table-striped table-responsive">
                                <tr>
                                    <th>Nombre</th>
                                    <th>Texto</th>
                                    <th>Fecha</th>
                                    <th class="theadHide"></th>
                                    <th class="theadHide"></th>
                                </tr>
                                <c:forEach items="${listaNoticias}" var="noticia">
                                    <tr class="lineaFiltro">
                                        <td>${noticia.nombre}</td>
                                        <td>${noticia.texto}</td>
                                        <td>${noticia.fechaalta}</td>
                                        <td class="btnTabla">
                                            <form action="Mostrar.do" method="post">
                                                <input type="hidden" name="tipo" value="noticia">
                                                <input type="hidden" name="noticia" value="${noticia.nombre}">
                                                <button name="submit" value="submit" class="editar">
                                                    <i class="fas fa-pencil-alt"></i>&nbsp;
                                                    <span>Editar</span>
                                                </button>
                                            </form>
                                        </td>
                                        <td class="btnTabla">
                                            <form action="Eliminar.do" method="post">
                                                <input type="hidden" name="tipo" value="noticia">
                                                <input type="hidden" name="noticia" value="${noticia.nombre}">
                                                <a href="#modalEliminar" data-toggle="modal" class="eliminar">
                                                    <i class="fas fa-times"></i>&nbsp;
                                                    <span>Eliminar</span>
                                                </a>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr style="background-color:transparent">
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="btnTabla">
                                        <a href="${pageContext.servletContext.contextPath}/content/admin/nuevo/nuevaNoticia.jsp" class="nuevo">
                                            <i class="fas fa-plus"></i>&nbsp;
                                            <span>Añadir</span>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="tablaHid" id="tablaParadas">
                            <h1>Paradas:</h1>
                            <table class="table table-striped table-responsive">
                                <tr>
                                    <th>Nombre</th>
                                    <th>Itinerario</th>
                                    <th>Ubicación</th>
                                    <th>Pruebas</th>
                                    <th class="theadHide"></th>
                                    <th class="theadHide"></th>
                                </tr>
                                <c:forEach items="${listaParadas}" var="parada">
                                    <tr class="lineaFiltro">
                                        <td>${parada.nombre}</td>
                                        <td>${parada.itinerario.nombre}</td>
                                        <td>FALTA POR HACER UBICACION</td>
                                        <td><a href="#modalPruebas" value="${parada.nombre}" class="paradaPruebas" data-toggle="modal">
                                                <i class="fas fa-flag"></i> Ver pruebas
                                            </a></td>
                                        <td class="btnTabla">
                                            <form action="Mostrar.do" method="post">
                                                <input type="hidden" name="tipo" value="parada">
                                                <input type="hidden" name="parada" value="${parada.nombre}">
                                                <button name="submit" value="submit" class="editar">
                                                    <i class="fas fa-pencil-alt"></i>&nbsp;
                                                    <span>Editar</span>
                                                </button>
                                            </form>
                                        </td>
                                        <td class="btnTabla">
                                            <form action="Eliminar.do" method="post">
                                                <input type="hidden" name="tipo" value="parada">
                                                <input type="hidden" name="parada" value="${parada.nombre}">
                                                <a href="#modalEliminar" data-toggle="modal" class="eliminar">
                                                    <i class="fas fa-times"></i>&nbsp;
                                                    <span>Eliminar</span>
                                                </a>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr style="background-color:transparent">
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="btnTabla">
                                        <a href="${pageContext.servletContext.contextPath}/content/admin/nuevo/nuevaParada.jsp" class="nuevo">
                                            <i class="fas fa-plus"></i>&nbsp;
                                            <span>Añadir</span>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="tablaHid" id="tablaPremios">
                            <h1>Premios:</h1>
                            <table class="table table-striped table-responsive">
                                <tr>
                                    <th>Nombre</th>
                                    <th>Cliente</th>
                                    <th>Descripción</th>
                                    <th class="theadHide"></th>
                                    <th class="theadHide"></th>
                                </tr>
                                <c:forEach items="${listaPremios}" var="premio">
                                    <tr class="lineaFiltro">
                                        <td>${premio.nombre}</td>
                                        <td>${premio.cliente.email}</td>
                                        <td>${premio.descripcion}</td>
                                        <td class="btnTabla">
                                            <form action="Mostrar.do" method="post">
                                                <input type="hidden" name="tipo" value="premio">
                                                <input type="hidden" name="premio" value="${premio.nombre}">
                                                <button name="submit" value="submit" class="editar">
                                                    <i class="fas fa-info"></i>&nbsp;
                                                    <span>Info</span>
                                                </button>
                                            </form>
                                        </td>
                                        <td class="btnTabla">
                                            <form action="Eliminar.do" method="post">
                                                <input type="hidden" name="tipo" value="premio">
                                                <input type="hidden" name="premio" value="${premio.nombre}">
                                                <a href="#modalEliminar" data-toggle="modal" class="eliminar">
                                                    <i class="fas fa-times"></i>&nbsp;
                                                    <span>Eliminar</span>
                                                </a>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr style="background-color:transparent">
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="btnTabla">
                                        <a href="${pageContext.servletContext.contextPath}/content/admin/nuevo/nuevoPremio.jsp" class="nuevo">
                                            <i class="fas fa-plus"></i>&nbsp;
                                            <span>Añadir</span>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="tablaHid" id="tablaCulturales">
                            <h1>Pruebas Culturales:</h1>
                            <table class="table table-striped table-responsive">
                                <tr>
                                    <th>Nombre</th>
                                    <th>Parada</th>
                                    <th>Puntos</th>
                                    <th class="theadHide"></th>
                                    <th class="theadHide"></th>
                                </tr>
                                <c:forEach items="${listaCulturales}" var="cultural">
                                    <tr class="lineaFiltro">
                                        <td>${cultural.nombre}</td>
                                        <td>${cultural.parada.nombre}</td>
                                        <td>${cultural.puntos}</td>
                                        <td class="btnTabla">
                                            <form action="Mostrar.do" method="post">
                                                <input type="hidden" name="tipo" value="cultural">
                                                <input type="hidden" name="prueba" value="${cultural.nombre}">
                                                <button name="submit" value="submit" class="editar">
                                                    <i class="fas fa-pencil-alt"></i>&nbsp;
                                                    <span>Editar</span>
                                                </button>
                                            </form>
                                        </td>
                                        <td class="btnTabla">
                                            <form action="Eliminar.do" method="post">
                                                <input type="hidden" name="tipo" value="cultural">
                                                <input type="hidden" name="prueba" value="${cultural.nombre}">
                                                <a href="#modalEliminar" data-toggle="modal" class="eliminar">
                                                    <i class="fas fa-times"></i>&nbsp;
                                                    <span>Eliminar</span>
                                                </a>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr style="background-color:transparent">
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="btnTabla">
                                        <a href="${pageContext.servletContext.contextPath}/content/admin/nuevo/nuevaCultural.jsp" class="nuevo">
                                            <i class="fas fa-plus"></i>&nbsp;
                                            <span>Añadir</span>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="tablaHid" id="tablaDeportivas">
                            <h1>Pruebas Deportivas:</h1>
                            <table class="table table-striped table-responsive">
                                <tr>
                                    <th>Nombre</th>
                                    <th>Parada</th>
                                    <th>Fecha Inicio</th>
                                    <th>Explicación</th>
                                    <th>Puntos</th>
                                    <th class="theadHide"></th>
                                    <th class="theadHide"></th>
                                </tr>
                                <c:forEach items="${listaDeportivas}" var="deportiva">
                                    <tr class="lineaFiltro">
                                        <td>${deportiva.nombre}</td>
                                        <td>${deportiva.parada.nombre}</td>
                                        <td>${deportiva.fechainicio}</td>
                                        <td>${deportiva.explicacion}</td>
                                        <td>${deportiva.puntos}</td>
                                        <td class="btnTabla">
                                            <form action="Mostrar.do" method="post">
                                                <input type="hidden" name="tipo" value="deportiva">
                                                <input type="hidden" name="prueba" value="${deportiva.nombre}">
                                                <button name="submit" value="submit" class="editar">
                                                    <i class="fas fa-pencil-alt"></i>&nbsp;
                                                    <span>Editar</span>
                                                </button>
                                            </form>
                                        </td>
                                        <td class="btnTabla">
                                            <form action="Eliminar.do" method="post">
                                                <input type="hidden" name="tipo" value="deportiva">
                                                <input type="hidden" name="prueba" value="${deportiva.nombre}">
                                                <a href="#modalEliminar" data-toggle="modal" class="eliminar">
                                                    <i class="fas fa-times"></i>&nbsp;
                                                    <span>Eliminar</span>
                                                </a>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr style="background-color:transparent">
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="hiddenT"></td>
                                    <td class="btnTabla">
                                        <a href="${pageContext.servletContext.contextPath}/content/admin/nuevo/nuevaDeportiva.jsp" class="nuevo">
                                            <i class="fas fa-plus"></i>&nbsp;
                                            <span>Añadir</span>
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div class="tablaHid" id="tablaVotos">
                            <h1>Votos:</h1>
                            <table class="table table-striped table-responsive">
                                <tr>
                                    <th>Cliente</th>
                                    <th>Multimedia</th>
                                    <th>Puntos</th>
                                    <th class="theadHide"></th>
                                </tr>
                                <c:forEach items="${listaVotos}" var="voto">
                                    <tr class="lineaFiltro">
                                        <td>${voto.cliente.email}</td>
                                        <td>Subido por: ${voto.multimedia.cliente.email} &nbsp; Prueba: ${voto.multimedia.pruebadeportiva.nombre}</td>
                                        <td>${voto.puntos}</td>
                                        <td class="btnTabla">
                                            <form action="Eliminar.do" method="post">
                                                <input type="hidden" name="tipo" value="voto">
                                                <input type="hidden" name="email" value="${voto.cliente.email}">
                                                <input type="hidden" name="emailMult" value="${voto.multimedia.cliente.email }">
                                                <input type="hidden" name="prueba" value="${voto.multimedia.pruebadeportiva.nombre }">
                                                <a href="#modalEliminar" data-toggle="modal" class="eliminar">
                                                    <i class="fas fa-times"></i>&nbsp;
                                                    <span>Eliminar</span>
                                                </a>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>

                <footer>
                    <div class="socials">
                        <a href="#" id="tw">
                            <i class="fab fa-twitter"></i>
                        </a>
                        <a href="#" id="fb">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                        <a href="#" id="ig">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a href="#" id="yt">
                            <i class="fab fa-youtube"></i>
                        </a>
                    </div>

                    <p>Gamitour &copy; 2018</p>
                </footer>

                <div id="modalParadas" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-header">
                            <button class="close" type="button" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" id="modalParadasTitle"></h4>
                        </div>

                        <div class="modal-body">
                            <table class="table table-striped table-responsive" id="modalParadasTable">
                                <tr id="modalParadas">
                                    <th>Nombre</th>
                                    <th>Ubicación</th>
                                    <th class="theadHide"></th>
                                    <th class="theadHide"></th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                
                <div id="modalPruebas" class="modal fade" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-header">
                            <button class="close" type="button" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title" id="modalPruebasTitle"></h4>
                        </div>

                        <div class="modal-body">
                        	<h3>Pruebas Deportivas</h3>
                            <table class="table table-striped table-responsive" id="modalPruebasDepTable">
                                <tr id="modalParadas">
                                    <th>Nombre</th>
                                    <th>Inicio</th>
                                    <th>Explicación</th>
                                    <th>Puntos</th>
                                    <th class="theadHide"></th>
                                    <th class="theadHide"></th>
                                </tr>
                            </table>
                            
                            <h3>Pruebas Culturales</h3>
                            <table class="table table-striped table-responsive" id="modalPruebasCulTable">
                                <tr id="modalParadas">
                                    <th>Nombre</th>
                                    <th>Puntos</th>
                                    <th class="theadHide"></th>
                                    <th class="theadHide"></th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>

                <div id="modalEliminar" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-header">
                            <button class="close" type="button" data-dismiss="modal">&times;</button>
                        </div>
                        <div class="modal-body"><p>¿Está seguro de que desea eliminar?</p></div>
                        <div class="modal-footer">
                            <button class="btn" id="btnEliminarModal">Eliminar</button>
                            <button class="btn" data-dismiss="modal">Cancelar</button>
                        </div>
                    </div>
                </div>

            </body>

            </html>