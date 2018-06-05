<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <%@ page import="com.gamitour.service.ServiceItinerarioImp" %>
        <%@ page import="com.gamitour.service.ServicePremioImp" %>
            <!DOCTYPE html>
            <html lang="es">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>Premios</title>

                <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
                <link rel="icon" href="${pageContext.servletContext.contextPath}/images/logos/favicon.png">

                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/loader.css" />
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/style.css" />
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/premios.css" />
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/media.css" />

                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
                <script src="${pageContext.servletContext.contextPath}/js/loader.js"></script>
            </head>

            <body>
            <c:if test="${itinerarios == null}">
	            <jsp:useBean id="sItinerarioImp" class="com.gamitour.service.ServiceItinerarioImp" />
		
				<%
					ServiceItinerarioImp sItinerario = new ServiceItinerarioImp();
					request.getSession().setAttribute("itinerarios", sItinerario.buscarNombres());
				%>
			</c:if>
			
			<jsp:useBean id="sPremioImp" class="com.gamitour.service.ServicePremioImp" />
			<%
				ServicePremioImp sPremio = new ServicePremioImp();
				request.setAttribute("premios", sPremio.buscarDisponibles());
			%>
             
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
                    
                    <c:if test="${username == null}">
	                    <div class="anonimo">
				            <a href="${pageContext.servletContext.contextPath}/content/registro.jsp" id="signin">Registrarse</a>
				            <a href="${pageContext.servletContext.contextPath}/content/login.jsp" id="login">Iniciar Sesión</a>
				        </div>			                    
                    </c:if>

					<c:if test="${username != null}">
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
                    </c:if>
                </header>

                <nav data-spy="affix" data-offset-top="150">
                    <a href="${pageContext.servletContext.contextPath}/index.jsp" onclick="loading();">
                        <i class="fas fa-home"></i> &nbsp; Inicio</a>
                    <a href="${pageContext.servletContext.contextPath}/content/noticias.jsp" onclick="loading();">
                        <i class="far fa-newspaper"></i> &nbsp; Noticias</a>
                    <a href="${pageContext.servletContext.contextPath}/content/actividades.jsp" onclick="loading();">
                        <i class="fas fa-search"></i> &nbsp; Actividades</a>
                   <a href="javascript:void(0)" id="menuIti" onclick="loading(); redirectIti();">
                        <i class="fas fa-map"></i> &nbsp; Itinerarios
                        <ul>
                        	<c:forEach items="${itinerarios}" var="iti">
                        		<li value="${iti}" onclick="loading();">
                        			<span>${iti}</span>
                        		</li>
                        	</c:forEach>
                        </ul>
                    </a>
                    <a href="${pageContext.servletContext.contextPath}/content/premios.jsp" class="actual" onclick="loading();">
                        <i class="fas fa-trophy"></i> &nbsp; Premios</a>
                    <a href="${pageContext.servletContext.contextPath}/content/about.jsp" onclick="loading();">
                        <i class="fas fa-question"></i> &nbsp; Quiénes somos</a>
                </nav>

                <div class="content">
					<h1 class="text-center">Premios Disponibles</h1>
					<div id="premiosContainer" class="row">
                		<c:forEach items="${premios}" var="premio">
                			<div class="col-xs-3 premioItem">
                				<div class="premioImg">
                					<img alt="" src="/static${premio.imagen}"/>
                				</div>
                				
                				<div class="premioNombre text-center"><h3 class="h3">${premio.nombre}</h3></div>
                				
                				<div class="premioData">
                					<div class="col-xs-12 text-right"><span>${premio.puntos} Puntos</span></div>
                				</div>
                				
                				<div class="premioDesc"><span>${premio.descripcion}</span></div>
                				
                				<div class="premioActiva text-center">
                					<a class="btn" href="<c:choose><c:when test="${username!=null}">#modalActivar</c:when><c:otherwise>${pageContext.servletContext.contextPath}/content/login.jsp</c:otherwise></c:choose>" <c:if test="${username!=null}">data-toggle="modal"</c:if>>Activar</a>
                				</div>
                			</div>
                		</c:forEach>
                		
                		<c:if test="${fn:length(premios) == 0 }">
                			<h2 class="h2 text-center">-- Actualmente no tenemos ningún premio disponible --</h2>
                			<h3 class="h3 text-center">Inténtalo en otro momento</h3>
                		</c:if>
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