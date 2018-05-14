<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

            <!DOCTYPE html>
            <html lang="es">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>Modificar: ${itinerario.nombre}</title>

                <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
                <link rel="icon" href="${pageContext.servletContext.contextPath}/images/logos/favicon.png">

				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/loader.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/form.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/nuevo.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/media.css" type="text/css">
                
                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD73nVF-IA4rkBCx98ZVjvV5XVzN_mb-10"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="http://code.jquery.com/ui/1.11.3/jquery-ui.min.js" integrity="sha256-xI/qyl9vpwWFOXz7+x/9WkG5j/SVnSw21viy8fWwbeE=" crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
                <script src="${pageContext.servletContext.contextPath}/js/form.js" type="text/javascript"></script>
                <script src="${pageContext.servletContext.contextPath}/js/loader.js" type="text/javascript"></script>
                <script src="${pageContext.servletContext.contextPath}/js/mapForm.js"></script>
                <script src="${pageContext.servletContext.contextPath}/js/formFilterItinerarioU.js" type="text/javascript"></script>
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
					<div class="tit">              
                    	<h1>Datos del nuevo Itinerario:</h1>
                    	<span>Los campos marcados con asteriscos son obligatorios</span>
                    </div>
                    <div style="width: 30%; margin: 35px auto; height: 475px">
	                    <form action="Update.do" method="post" style="height:100%">
	                        <input type="hidden" name="tipo" value="itinerario">
	                        <input type="hidden" name="nombre" value="${itinerario.nombre}">
	                        <div class="inputCon input-effect" style="margin-bottom:35px">
	                            <input class="textIn has-content" type="text" name="categoria" placeholder="" value="${itinerario.categoria}" required />
	                            <label>Categoría *</label>
	                            <span class="focus-border"></span>
	                        </div>
	                        <div class="inputCon input-effect" style="margin-bottom:25px">
	                            <input class="textIn has-content" type="text" name="duracion" placeholder="" value="${itinerario.duracion}" required/>
	                            <label>Duración *</label>
	                            <span class="focus-border"></span>
	                        </div>
	                        <div id="mapForm" style="height: 250px"></div>
                			<input type="hidden" name="lat" value="${itinerario.latitud}">
                			<input type="hidden" name="lng" value="${itinerario.longitud }">	         
	                        <div style="margin: auto">
	                            <a id="enviar" class="btn">Actualizar</a>
	                        </div>
	                    </form>
                    </div>
                </div>
                
                <div id="modalError" class="modal fade" role="dialog">
			        <div class="modal-dialog">
			            <div class="modal-body" id="mensajeError"></div>
			            <div class="modal-footer">
			                <button class="btn" data-dismiss="modal">Aceptar</button>
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

            </html>