<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <%@ page import="com.gamitour.service.ServiceItinerarioImp" %>
        
            <!DOCTYPE html>
            <html lang="es">

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>Gamiastur</title>

                <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
                <link rel="icon" href="${pageContext.servletContext.contextPath}/images/logos/favicon.png">

                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/loader.css" />
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/style.css" />
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
                    <a href="${pageContext.servletContext.contextPath}/index.jsp" class="actual" onclick="loading();">
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
                    <a href="${pageContext.servletContext.contextPath}/content/premios.jsp" onclick="loading();">
                        <i class="fas fa-trophy"></i> &nbsp; Premios</a>
                    <a href="${pageContext.servletContext.contextPath}/content/about.jsp" onclick="loading();">
                        <i class="fas fa-question"></i> &nbsp; Quiénes somos</a>
                </nav>

                <div class="content">
                	<div id="carouselIndex" class="row carousel slide" data-ride="carousel">                		
                		<ol class="carousel-indicators">
                			<li data-target="#carouselIndex" data-slide-to="0" class="active"></li>
                			<li data-target="#carouselIndex" data-slide-to="1"></li>
                			<li data-target="#carouselIndex" data-slide-to="2"></li>
                		</ol>
                	
                		<div class="carousel-inner">
                			<div class="item active">
                				<img src="${pageContext.servletContext.contextPath}/images/carousel/gijon.jpg">
                			</div>
                			
                			<div class="item">
                				<img src="${pageContext.servletContext.contextPath}/images/carousel/llanes.jpg">
                			</div>                			              
                			
                			<div class="item">
                				<img src="${pageContext.servletContext.contextPath}/images/carousel/somiedo.jpg">
                			</div>
                		</div>                		                		                	
                	</div>
                	
                	<div id="bienvenida" class="row text-center">
	              		<h1>Bienvenido a Gamiastur</h1>
	              		<h3 class="h3">Echa un vistazo a lo que podemos ofrecerte</h3>
              		</div>
              		
              		<div class="row" id="actividadesItinerarios">
              			<div class="col-xs-2"></div>
              			<div class="col-xs-3 text-center">
              				<h2 class="h2"><i class="fas fa-search"></i></h2>
              				<h2 class="h2">Nuestras Actividades</h2>
              				<span>Conoce nuestras fantásticas actividades y diviértete con nosotros</span>
              				<a href="${pageContext.servletContext.contextPath}/content/actividades.jsp" class="btn btn-contrast" onclick="loading();"><i class="fas fa-info"></i> &nbsp; Descubrir</a>
              			</div>
              			<div class="col-xs-2"></div>
              			<div class="col-xs-3 text-center">
              				<h2 class="h2"><i class="fas fa-map"></i></h2>
              				<h2 class="h2">Fantásticos Itinerarios</h2>
              				<span>Recorre fantásticos lugares con nuestros maravillosos itinerarios</span>
              				<a href="${pageContext.servletContext.contextPath}/content/itinerarios.jsp" class="btn btn-contrast" onclick="loading();"><i class="fas fa-info"></i> &nbsp; Saber mÃ¡s</a>
              			</div>
              			<div class="col-xs-2"></div>
              		</div>
              		
              		<div class="row" id="noticiasPremios">
              			<div class="row">
	              			<div class="col-xs-3 text-center"></div>
	              			<div class="col-xs-3 text-center">
	              				<h2 class="h2"><i class="fas fa-search"></i></h2>
	              				<h2 class="h2">Últimas Noticias</h2>
	              				<span>No te pierdas ninguna noticia de interés turístico</span>
	              				<a href="${pageContext.servletContext.contextPath}/content/noticias.jsp" class="btn" onclick="loading();"><i class="fas fa-info"></i> &nbsp; Mantenerse Informado</a>
	              			</div>
              			</div>
              			
              			<div class="row">
	              			<div class="col-xs-6"></div>
	              			<div class="col-xs-3 text-center">
	              				<h2 class="h2"><i class="fas fa-trophy"></i></h2>
	              				<h2 class="h2">Premios Impresionantes</h2>
	              				<span>Gana fantásticos premios solamente con participar en nuestros servicios</span>
	              				<a href="${pageContext.servletContext.contextPath}/content/premios.jsp" class="btn" onclick="loading();"><i class="fas fa-info"></i> &nbsp; Obtener Premios</a>
	              			</div>
              			</div>
              		</div>
              		
              		<div class="row" id="aboutDiv">
              			<div class="col-xs-4"></div>
              			<div class="col-xs-4 text-center">
              				<h2 class="h2"><i class="fas fa-question"></i></h2>
              				<h2 class="h2">Sobre Nosotros</h2>
              				<span>Descubre un poco más sobre el equipo detrás de Gamiastur</span>
              				<a href="${pageContext.servletContext.contextPath}/content/about.jsp" class="btn btn-contrast" onclick="loading();"><i class="fas fa-info"></i> &nbsp; Conocernos</a>
              			</div>
              			<div class="col-xs-4"></div>
              		</div>
              		
              		
              		<c:if test="${username == null}">              		
              		<div class="row" id="registrarseDiv">
              			<div class="col-xs-2"></div>
              			<div class="col-xs-3 text-center">
              				<h2 class="h2"><i class="fas fa-sign-in-alt"></i></h2>
              				<h2 class="h2">Únete</h2>
              				<span>Participa en Gamiastur y disfruta de todas las ventajas</span>
              				<a href="${pageContext.servletContext.contextPath}/content/registro.jsp" class="btn btn-contrast" onclick="loading();"><i class="fas fa-info"></i> &nbsp; Registrarse</a>
              			</div>
              			<div class="col-xs-2"></div>
              			<div class="col-xs-3 text-center">
              				<h2 class="h2"><i class="fas fa-key"></i></h2>
              				<h2 class="h2">Inicia Sesión</h2>
              				<span>¿Ya tienes cuenta? Accede y descubre nuestras actividades</span>
              				<a href="${pageContext.servletContext.contextPath}/content/login.jsp" class="btn btn-contrast" onclick="loading();"><i class="fas fa-info"></i> &nbsp; Entrar</a>
              			</div>
              			<div class="col-xs-2"></div>
              		</div>
              		</c:if>
                </div>
                
                <c:if test="${(userRol == 'admin' || userRol == 'hosteleria' || userRol == 'deportivas') && (popup != true)}">
                	<c:set var="popup" value="true" scope="session" />
	                <div id="modalAdmin" class="modal fade info-modal" role="dialog">
	                    <div class="modal-dialog">
	                        <div class="modal-header">
	                            <button class="close" type="button" data-dismiss="modal">&times;</button>
	                        </div>
	                        <div class="modal-body"><p>¡Vaya! Tienes un perfil de administrador. ¿Te gustaría entrar al panel de control de administrador?</p></div>
	                        <div class="modal-footer">
	                            <button class="btn" onclick="loading(); location.href='Admin.do'">Adelante</button>
	                            <button class="btn" data-dismiss="modal">En otro momento</button>
	                        </div>
	                    </div>
	                </div>   
	            </c:if>
	            
	            <script>
	            	if($("#modalAdmin").find("p").text() != undefined)
	            		$("#modalAdmin").modal();
	            </script>

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