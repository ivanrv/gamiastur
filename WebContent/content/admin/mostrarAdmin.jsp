<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/loader.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/tablas.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/media.css" type="text/css">

				<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD73nVF-IA4rkBCx98ZVjvV5XVzN_mb-10"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="http://code.jquery.com/ui/1.11.3/jquery-ui.min.js" integrity="sha256-xI/qyl9vpwWFOXz7+x/9WkG5j/SVnSw21viy8fWwbeE="
                    crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
                <script src="${pageContext.servletContext.contextPath}/js/loader.js"></script>
                <script src="${pageContext.servletContext.contextPath}/js/tablas.js"></script>              
            </head>

            <body>
            	<div id="loader">
			        <div class="sk-folding-cube">
			            <div class="sk-cube1 sk-cube"></div>
			            <div class="sk-cube2 sk-cube"></div>
			            <div class="sk-cube4 sk-cube"></div>
			            <div class="sk-cube3 sk-cube"></div>
			        </div>
			    </div>
            
                <header>
                    <a href="${pageContext.servletContext.contextPath}/index.jsp">
                        <img src="${pageContext.servletContext.contextPath}/images/logos/logo gris.png">
                    </a>

                    <div class="user">
	                        <a href="javascript:void(0)" id="menuUser">
	                            <i class="fas fa-angle-down"></i>
	                            <ul <c:if test="${userRol != 'user'}">class="adminUser"</c:if>>
	                                <li onclick="loading(); location.href='${pageContext.servletContext.contextPath}/content/user/editarPerfil.jsp';">Editar Perfil</li>
	                                <li class="menuUserB" onclick="location.href='${pageContext.servletContext.contextPath}/content/user/misActividades.jsp'">Mis Actividades</li>
	                                <li class="menuUserB" onclick="location.href='${pageContext.servletContext.contextPath}/content/user/misPremios.jsp'">Premios</li>
	                                <c:if test="${userRol != 'user'}">
	                                    <li class="menuUserB" id="panel" onclick="location.href='Admin.do'">Panel de Control</li>
	                                </c:if>
	                                <li class="menuUserB" onclick="location.href='Logout.do'">Cerrar Sesión</li>
	                            </ul>
	                        </a>
	                        <span>
	                            <a href="${pageContext.servletContext.contextPath}/content/user/perfil.jsp">${username}</a>
	                        </span>
	                        <img src="${pageContext.servletContext.contextPath}/images/avatares/Ancla.png">
	                    </div>
                </header>

                <nav data-spy="affix" data-offset-top="150">
                    <a href="${pageContext.servletContext.contextPath}/index.jsp" onclick="loading();">
                        <i class="fas fa-home"></i> &nbsp; Inicio</a>
                    <a href="${pageContext.servletContext.contextPath}/content/noticias.jsp" onclick="loading();">
                        <i class="far fa-newspaper"></i> &nbsp; Noticias</a>
                    <a href="${pageContext.servletContext.contextPath}/content/actividades.jsp" onclick="loading();">
                        <i class="fas fa-search"></i> &nbsp; Actividades</a>
                    <a href="${pageContext.servletContext.contextPath}/content/itinerarios.jsp" id="menuIti" onclick="loading();">
                        <i class="fas fa-map"></i> &nbsp; Itinerarios
                        <ul>
                        	<c:forEach items="${listaItinerarios}" var="iti">
                        		<li id="" onclick="loading();">
                        			<span>${iti.nombre}</span>
                        		</li>
                        	</c:forEach>
                        </ul>
                    </a>
                    <a href="${pageContext.servletContext.contextPath}/content/premios.jsp" onclick="loading();">
                        <i class="fas fa-trophy"></i> &nbsp; Premios</a>
                    <a href="${pageContext.servletContext.contextPath}/content/about.jsp" onclick="loading();">
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
                            
                            <c:choose>
                            	<c:when test="${userRol == 'deportivas'}">
                            		<a href="javascript:void(0)" class="selAdmin selAdminDisabled" value="tablaCulturales">
                                		<i class="fas fa-book"></i>
                                		<span>Pruebas Culturales</span>
                            		</a>
                            	</c:when>
                            	<c:otherwise>
	                            	<a href="javascript:void(0)" class="selAdmin" value="tablaCulturales">
		                                <i class="fas fa-book"></i>
		                                <span>Pruebas Culturales</span>
                            		</a>
                            	</c:otherwise>
                            </c:choose>

                            <c:choose>
                            	<c:when test="${userRol == 'hosteleria'}">
                            		<a href="javascript:void(0)" class="selAdmin selAdminDisabled" value="tablaDeportivas">
		                                <i class="fas fa-volleyball-ball"></i>
		                                <span>Pruebas Deportivas</span>
		                            </a>
                            	</c:when>
                            	<c:otherwise>
	                            	<a href="javascript:void(0)" class="selAdmin" value="tablaDeportivas">
		                                <i class="fas fa-volleyball-ball"></i>
		                                <span>Pruebas Deportivas</span>
		                            </a>
                            	</c:otherwise>
                            </c:choose>
                            
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
                            
                            <c:choose>
                            	<c:when test="${userRol == 'deportivas'}">
                            		<a href="javascript:void(0)" class="selAdminNav selAdminNavDisabled" value="tablaCulturales">
		                                <i class="fas fa-book"></i>&nbsp;
		                                <span>Pruebas Culturales</span>
		                            </a>
                            	</c:when>
                            	<c:otherwise>
	                            	<a href="javascript:void(0)" class="selAdminNav" value="tablaCulturales">
		                                <i class="fas fa-book"></i>&nbsp;
		                                <span>Pruebas Culturales</span>
		                            </a>
                            	</c:otherwise>
                            </c:choose>
                            
                            <c:choose>
                            	<c:when test="${userRol == 'hosteleria'}">
                            		<a href="javascript:void(0)" class="selAdminNav selAdminNavDisabled" value="tablaDeportivas">
		                                <i class="fas fa-volleyball-ball"></i>&nbsp;
		                                <span>Pruebas Deportivas</span>
		                            </a>
                            	</c:when>
                            	<c:otherwise>
	                            	<a href="javascript:void(0)" class="selAdminNav" value="tablaDeportivas">
		                                <i class="fas fa-volleyball-ball"></i>&nbsp;
		                                <span>Pruebas Deportivas</span>
		                            </a>
                            	</c:otherwise>
                            </c:choose>
 
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
                                    <c:if test="${userRol == 'admin'}">
                                    	<th class="theadHide"></th>
                                    </c:if>
                                </tr>
                                <c:forEach items="${listaClientes}" var="cliente">
                                    <tr class="lineaFiltro">
                                        <td>${cliente.nombre}</td>
                                        <td>${cliente.apellidos}</td>
                                        <td>${cliente.email}</td>
                                        <td><fmt:formatDate value="${cliente.fecharegistro}" pattern="dd-MM-yyyy"/></td>
                                        <td class="btnTabla">                                           
                                                <a href="#infoCliente" data-toggle="modal" class="editar procModalInfoCliente" value="${cliente.email}">
                                                    <i class="fas fa-info"></i>&nbsp;
                                                    <span>Info</span>
                                                </a>                
                                        </td>
                                        <c:if test="${userRol == 'admin'}">
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
	                                	</c:if>
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
                                    <c:if test="${userRol == 'admin'}">
	                                    <th class="theadHide"></th>
	                                    <th class="theadHide"></th>
                                    </c:if>
                                </tr>
                                <c:forEach items="${listaActividades}" var="actividad">
                                    <tr class="lineaFiltro">
                                        <td>${actividad.nombre}</td>
                                        <td><fmt:formatDate value="${actividad.fechainicio}" pattern="dd-MM-yyyy"/></td>
                                        <td><fmt:formatDate value="${actividad.fechafin}" pattern="dd-MM-yyyy"/></td>
                                        <td>
                                        	<a href="#modalMaps" data-toggle="modal" class="procModalMaps" value="${actividad.latitud} ${actividad.longitud}">
                                        		<i class="fas fa-map-marker-alt"></i>&nbsp;
                                        		<span style="font-size: 1em;">Mostrar Ubicación</span>
                                        	</a>
                                        </td>
                                        <td>${actividad.numparticipantes}</td>
                                        <c:if test="${userRol == 'admin'}">
	                                        <td class="btnTabla">
	                                            <form action="Mostrar.do" method="post">
	                                                <input type="hidden" name="tipo" value="actividad">
	                                                <input type="hidden" name="actividad" value="${actividad.nombre}">
	                                                <button name="submit" value="submit" class="editar" onclick="loading();">
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
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                <c:if test="${userRol == 'admin'}">
	                                <tr style="background-color:transparent">
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>                                  
	                                    <td class="btnTabla">
	                                        <a href="${pageContext.servletContext.contextPath}/content/admin/nuevo/nuevaActividad.jsp" class="nuevo" onclick="loading();">
	                                            <i class="fas fa-plus"></i>&nbsp;
	                                            <span>Añadir</span>
	                                        </a>
	                                    </td>
	                                </tr>
                                </c:if>
                            </table>
                        </div>

                        <div class="tablaHid" id="tablaComentarios">
                            <h1>Comentarios:</h1>
                            <table class="table table-striped table-responsive">
                                <tr>
                                    <th>Cliente</th>
                                    <th>Multimedia</th>
                                    <th>Texto</th>
                                    <c:if test="${userRol == 'admin'}">
                                    	<th class="theadHide"></th>
                                    </c:if>
                                </tr>
                                <c:forEach items="${listaComentarios}" var="comentario">
                                    <tr class="lineaFiltro">
                                        <td>${comentario.cliente.email}</td>
                                        <td>Subido por: ${comentario.multimedia.cliente.email} &nbsp; Prueba: ${comentario.multimedia.pruebadeportiva.nombre}</td>
                                        <td>${comentario.texto}</td>
                                        <c:if test="${userRol == 'admin'}">
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
                                        </c:if>
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
                                    <c:if test="${userRol == 'admin'}">
	                                    <th class="theadHide"></th>
	                                    <th class="theadHide"></th>
                                    </c:if>
                                </tr>
                                <c:forEach items="${listaItinerarios}" var="itinerario">
                                    <tr class="lineaFiltro">
                                        <td>${itinerario.nombre}</td>
                                        <td>${itinerario.categoria}</td>
                                        <td>
											<a href="#modalMaps" data-toggle="modal" class="procModalMaps" value="${itinerario.latitud} ${itinerario.longitud}">
                                        		<i class="fas fa-map-marker-alt"></i>&nbsp;
                                        		<span style="font-size: 1em;">Mostrar Ubicación</span>
                                        	</a>
										</td>
                                        <td>
                                            <a href="#modalParadas" value="${itinerario.nombre}" class="itiParadas" data-toggle="modal">
                                                <i class="fas fa-map-pin"></i> Ver paradas
                                            </a>
                                        </td>
                                        <c:if test="${userRol == 'admin'}">
	                                        <td class="btnTabla">
	                                            <form action="Mostrar.do" method="post">
	                                                <input type="hidden" name="tipo" value="itinerario">
	                                                <input type="hidden" name="itinerario" value="${itinerario.nombre}">
	                                                <button name="submit" value="submit" class="editar" onclick="loading();">
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
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                <c:if test="${userRol == 'admin'}">
	                                <tr style="background-color:transparent">
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="btnTabla">
	                                        <a href="${pageContext.servletContext.contextPath}/content/admin/nuevo/nuevoItinerario.jsp" class="nuevo" onclick="loading();">
	                                            <i class="fas fa-plus"></i>&nbsp;
	                                            <span>Añadir</span>
	                                        </a>
	                                    </td>
	                                </tr>
                                </c:if>
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
                                    <c:if test="${userRol == 'admin'}">
                                    	<th class="theadHide"></th>
                                    </c:if>
                                </tr>
                                <c:forEach items="${listaMultimedias}" var="multimedia">
                                    <tr class="lineaFiltro">
                                        <td>${multimedia.cliente.email}</td>
                                        <td>${multimedia.pruebadeportiva.nombre}</td>
                                        <td><fmt:formatDate value="${multimedia.fecha}" pattern="dd-MM-yyyy"/></td>
                                        <td class="btnTabla">
                                            <form action="Mostrar.do" method="post">
                                                <input type="hidden" name="tipo" value="multimedia">
                                                <input type="hidden" name="email" value="${multimedia.cliente.email}">
                                                <input type="hidden" name="prueba" value="${multimedia.pruebadeportiva.nombre }">
                                                <button name="submit" value="submit" class="editar" onclick="loading();">
                                                    <i class="fas fa-info"></i>&nbsp;
                                                    <span>Info</span>
                                                </button>
                                            </form>
                                        </td>
                                        <c:if test="${userRol == 'admin'}">
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
                                        </c:if>
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
                                    <c:if test="${userRol == 'admin'}">
	                                    <th class="theadHide"></th>
	                                    <th class="theadHide"></th>
                                    </c:if>
                                </tr>
                                <c:forEach items="${listaNoticias}" var="noticia">
                                    <tr class="lineaFiltro">
                                        <td>${noticia.nombre}</td>
                                        <td>${noticia.texto}</td>
                                        <td><fmt:formatDate value="${noticia.fechaalta}" pattern="dd-MM-yyyy"/></td>
                                        <c:if test="${userRol == 'admin'}">
	                                        <td class="btnTabla">
	                                            <form action="Mostrar.do" method="post">
	                                                <input type="hidden" name="tipo" value="noticia">
	                                                <input type="hidden" name="noticia" value="${noticia.nombre}">
	                                                <button name="submit" value="submit" class="editar" onclick="loading();">
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
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                <c:if test="${userRol == 'admin'}">
	                                <tr style="background-color:transparent">
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="btnTabla">
	                                        <a href="${pageContext.servletContext.contextPath}/content/admin/nuevo/nuevaNoticia.jsp" class="nuevo" onclick="loading();">
	                                            <i class="fas fa-plus"></i>&nbsp;
	                                            <span>Añadir</span>
	                                        </a>
	                                    </td>
	                                </tr>
                                </c:if>
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
                                    <c:if test="${userRol == 'admin'}">
	                                    <th class="theadHide"></th>
	                                    <th class="theadHide"></th>
                                    </c:if>
                                </tr>
                                <c:forEach items="${listaParadas}" var="parada">
                                    <tr class="lineaFiltro">
                                        <td>${parada.nombre}</td>
                                        <td>${parada.itinerario.nombre}</td>
                                        <td>
                                        	<a href="#modalMaps" data-toggle="modal" class="procModalMaps" value="${parada.latitud} ${parada.longitud}">
                                        		<i class="fas fa-map-marker-alt"></i>&nbsp;
                                        		<span style="font-size: 1em;">Mostrar Ubicación</span>
                                        	</a>
                                        </td>
                                        <td>
                                        	<a href="#modalPruebas" value="${parada.nombre}" class="paradaPruebas" data-toggle="modal">
                                                <i class="fas fa-flag"></i> Ver pruebas
                                            </a>
                                       	</td>
                                       	<c:if test="${userRol == 'admin'}">                                            
	                                        <td class="btnTabla">
	                                            <form action="Mostrar.do" method="post">
	                                                <input type="hidden" name="tipo" value="parada">
	                                                <input type="hidden" name="parada" value="${parada.nombre}">
	                                                <button name="submit" value="submit" class="editar" onclick="loading();">
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
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                <c:if test="${userRol == 'admin'}">
	                                <tr style="background-color:transparent">
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="btnTabla">
	                                        <a href="${pageContext.servletContext.contextPath}/content/admin/nuevo/nuevaParada.jsp" class="nuevo" onclick="loading();">
	                                            <i class="fas fa-plus"></i>&nbsp;
	                                            <span>Añadir</span>
	                                        </a>
	                                    </td>
	                                </tr>
                                </c:if>
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
                                    <c:if test="${userRol == 'admin'}">
                                    	<th class="theadHide"></th>
                                    </c:if>
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
                                                <a href="#infoPremio" data-toggle="modal" class="editar procModalInfoPremio" value="${premio.nombre}">
                                                    <i class="fas fa-info"></i>&nbsp;
                                                    <span>Info</span>
                                                </a>
                                            </form>
                                        </td>
                                        <c:if test="${userRol == 'admin'}">
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
                                        </c:if>
                                    </tr>
                                </c:forEach>
                                <c:if test="${userRol == 'admin'}">
	                                <tr style="background-color:transparent">
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="hiddenT"></td>
	                                    <td class="btnTabla">
	                                        <a href="${pageContext.servletContext.contextPath}/content/admin/nuevo/nuevoPremio.jsp" class="nuevo" onclick="loading();">
	                                            <i class="fas fa-plus"></i>&nbsp;
	                                            <span>Añadir</span>
	                                        </a>
	                                    </td>
	                                </tr>
                                </c:if>
                            </table>
                        </div>

						<c:if test="${userRol != 'deportivas'}">
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
	                                                <button name="submit" value="submit" class="editar" onclick="loading();">
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
	                                        <a href="${pageContext.servletContext.contextPath}/content/admin/nuevo/nuevaCultural.jsp" class="nuevo" onclick="loading();">
	                                            <i class="fas fa-plus"></i>&nbsp;
	                                            <span>Añadir</span>
	                                        </a>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>    
                        </c:if>

						<c:if test="${userRol != 'hosteleria'}">
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
	                                        <td><fmt:formatDate value="${deportiva.fechainicio}" pattern="dd-MM-yyyy"/></td>
	                                        <td>
	                                        	<a href="#modalPDF" data-toggle="modal" value="${deportiva.explicacion}" class="procModalPDF">
	                                        		<i class="fas fa-file-pdf"></i>&nbsp;
	                                        		<span>Mostrar Explicación</span>
	                                        	</a>
	                                        </td>
	                                        <td>${deportiva.puntos}</td>
	                                        <td class="btnTabla">
	                                            <form action="Mostrar.do" method="post">
	                                                <input type="hidden" name="tipo" value="deportiva">
	                                                <input type="hidden" name="prueba" value="${deportiva.nombre}">
	                                                <button name="submit" value="submit" class="editar" onclick="loading();">
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
	                                    <td class="hiddenT"></td>
	                                    <td class="btnTabla">
	                                        <a href="${pageContext.servletContext.contextPath}/content/admin/nuevo/nuevaDeportiva.jsp" class="nuevo" onclick="loading();">
	                                            <i class="fas fa-plus"></i>&nbsp;
	                                            <span>Añadir</span>
	                                        </a>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                      </c:if>

                        <div class="tablaHid" id="tablaVotos">
                            <h1>Votos:</h1>
                            <table class="table table-striped table-responsive">
                                <tr>
                                    <th>Cliente</th>
                                    <th>Multimedia</th>
                                    <th>Puntos</th>
                                    <c:if test="${userRol == 'admin'}">
                                    	<th class="theadHide"></th>
                                    </c:if>
                                </tr>
                                <c:forEach items="${listaVotos}" var="voto">
                                    <tr class="lineaFiltro">
                                        <td>${voto.cliente.email}</td>
                                        <td>Subido por: ${voto.multimedia.cliente.email} &nbsp; Prueba: ${voto.multimedia.pruebadeportiva.nombre}</td>
                                        <td>${voto.puntos}</td>
                                        <c:if test="${userRol == 'admin'}">
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
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>

                <div id="modalParadas" class="modal fade info-modal" role="dialog">
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
                
                <div id="modalPruebas" class="modal fade info-modal" role="dialog">
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

                <div id="modalEliminar" class="modal fade info-modal" role="dialog">
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
             
             	<div id="infoCliente" class="modal fade info-modal" role="dialog">        
			        <div class="modal-dialog">
			            <div class="modal-header">
			                <button class="close" type="button" data-dismiss="modal">&times;</button>
			                <h4 class="modal-title" id="infoClienteTitle"></h4>
			            </div>
			            <div class="modal-body">
			                <div id="infoClienteImg">
			                    <img src="${pageContext.servletContext.contextPath}/images/avatares/Ancla.png" alt="">
			                </div>
			                <div id="infoClienteInfoPrincipal">
			                    <p>
			                        <strong>Nombre: </strong>
			                        <span id="infoClienteNombre"></span>
			                    </p>
			                    <p>
			                        <strong>Apellidos: </strong>
			                        <span id="infoClienteApellidos"></span>
			                    </p>
			                    <p>
			                        <strong>Fecha de Nacimiento: </strong>
			                        <span id="infoClienteFechaNac"></span>
			                    </p>
			                    <p>
			                        <strong>Correo Electr&oacute;nico: </strong>
			                        <span id="infoClienteEmail"></span>
			                    </p>
			                    <p>
			                        <strong>Rol: </strong>
			                        <span id="infoClienteRol"></span>
			                    </p>
			                </div>
			                <div id="infoClienteInfoSecundaria">
			                    <p>
			                        <strong>Telefono: </strong>
			                        <span id="infoClienteTelefono"></span>
			                    </p>
			                    <p>
			                        <strong>Direcci&oacute;n: </strong>
			                        <span id="infoClienteDireccion"></span>
			                    </p>
			                    <p>
			                        <strong>C&oacute;digo Postal: </strong>
			                        <span id="infoClienteCP"></span>
			                    </p>
			                    <p>
			                        <strong>Puntos Acumulados: </strong>
			                        <span id="infoClientePuntos"></span>
			                    </p>
			                    <p>
			                        <strong>Fecha de Registro: </strong>
			                        <span id="infoClienteRegistro"></span>
			                    </p>
			                </div>
			            </div>
			        </div>
			    </div>
			    
			    <div id="infoPremio" class="modal fade info-modal" role="dialog">
			        <div class="modal-dialog">
			            <div class="modal-header">
			                <button class="close" type="button" data-dismiss="modal">&times;</button>
			                <h4 class="modal-title" id="infoPremioTitle"></h4>
			            </div>
			            <div class="modal-body">
			                <div id="infoPremioInfoPrincipal">
			                    <p>
			                        <strong>Nombre: </strong>
			                        <span id="infoPremioNombre"></span>
			                    </p>
			                    <p>
			                        <strong>Asignado a: </strong>
			                        <span id="infoPremioCliente"></span>
			                    </p>
			                    <p>
			                        <strong>Fecha de Activaci&oacute;n: </strong>
			                        <span id="infoPremioActivacion"></span>
			                    </p>
			                    <p>
			                        <strong>Fecha de Consumo: </strong>
			                        <span id="infoPremioConsumo"></span>
			                    </p>
			                    <p>
			                        <strong>Puntos: </strong>
			                        <span id="infoPremioPuntos"></span>
			                    </p>
			                </div>
			                <div id="infoPremioINfoSecundaria">
			                    <p>
			                        <strong>Descripci&oacute;n: </strong><br/>
			                        <span id="infoPremioDescripcion"></span>
			                    </p>
			                </div>
			            </div>
			        </div>
			    </div>
             
             	<div id="modalMaps" class="modal fade info-modal" role="dialog">
             		<div class="modal-dialog">
             			<div class="modal-header">
             				<button class="close" type="button" data-dismiss="modal">&times;</button>
             				<h4 class="modal-title">Ubicación</h4>
             			</div>
             			<div class="modal-body">
             				<div id="mapTabla"></div>
             			</div>
             		</div>
             	</div>
             	
             	<div id="modalPDF" class="modal fade info-modal" role="dialog">
             		<div class="modal-dialog modal-lg">
             			<div class="modal-header">
             				<button class="close" type="button" data-dismiss="modal">&times;</button>
             				<h4 class="modal-title">Explicación</h4>
             			</div>
             			<div class="modal-body">
             				<div>
             					<embed id="modalPDFDoc" src="" type="application/pdf" style="width:100%; min-height: 400px"/>
             				</div>
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

                    <p>Gamiastur &copy; 2018</p>
                </footer>
             </body>
             
             <script> 
                	var stringParadas = "[";

                	<c:forEach items="${listaParadas}" var="parada" varStatus="status">
						stringParadas += '{"nombre": "${parada.nombre}", "itinerario": "${parada.itinerario.nombre}", "latitud": "${parada.latitud}", "longitud": "${parada.longitud}"}';
						<c:if test="${!status.last}"> stringParadas += ","</c:if>					
					</c:forEach>
					stringParadas += "]";

                	var stringDeportivas = "[";
					<c:forEach items="${listaDeportivas}" var="deportiva" varStatus="status">
						stringDeportivas += '{"nombre": "${deportiva.nombre}", "parada": "${deportiva.parada.nombre}", "fechainicio": "<fmt:formatDate value="${deportiva.fechainicio}" pattern="dd-MM-yyyy"/>", "explicacion": "${deportiva.explicacion}", "puntos": "${deportiva.puntos}"}';
						<c:if test="${!status.last}"> stringDeportivas += ","</c:if>					
					</c:forEach>
					stringDeportivas += "]";

                	var stringCulturales = "[";
					<c:forEach items="${listaCulturales}" var="cultural" varStatus="status">
						stringCulturales += '{"nombre": "${cultural.nombre}", "parada": "${cultural.parada.nombre}", "puntos": "${cultural.puntos}"}';
						<c:if test="${!status.last}"> stringCulturales += ","</c:if>					
					</c:forEach>
					stringCulturales += "]";

					var stringClientes = "[";
					<c:forEach items="${listaClientes}" var="cliente" varStatus="status">
						stringClientes += '{"email": "${cliente.email}", "nombre": "${cliente.nombre}", "apellidos": "${cliente.apellidos}", "fechanacimiento": "<fmt:formatDate value="${cliente.fechanacimiento}" pattern="dd-MM-yyyy"/>", "rol": "${cliente.rol.nombre}", "telefono": "${cliente.telefono}", "direccion": "${cliente.direccion}", "codigopostal": "${cliente.codigopostal}", "puntosacumulados": "${cliente.puntosacumulados}", "fecharegistro": "<fmt:formatDate value="${cliente.fecharegistro}" pattern="dd-MM-yyyy"/>"}';
						<c:if test="${!status.last}">stringClientes += ","</c:if>
					</c:forEach>					
					stringClientes += "]";
					
					var stringPremios = "[";					
					<c:forEach items="${listaPremios}" var="premio" varStatus="status">
						stringPremios += '{"nombre": "${premio.nombre}", "cliente": "${premio.cliente.email}", "descripcion": "${premio.descripcion}", "fechaactivacion": "<fmt:formatDate value="${premio.fechaactivacion}" pattern="dd-MM-yyyy"/>", "fechaconsumo": "<fmt:formatDate value="${premio.fechaconsumo}" pattern="dd-MM-yyyy"/>", "puntos": "${premio.puntos}"}';
						<c:if test="${!status.last}">stringPremios += ","</c:if>
					</c:forEach>					
					stringPremios += "]";
					
                </script>

            </html>