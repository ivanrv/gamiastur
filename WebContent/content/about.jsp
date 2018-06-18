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
                <title>Qui�nes somos</title>

                <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
                <link rel="icon" href="${pageContext.servletContext.contextPath}/images/logos/favicon.png">

                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/loader.css" />
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/style.css" />
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/about.css" />
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/media.css" />

				<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD73nVF-IA4rkBCx98ZVjvV5XVzN_mb-10"></script>
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
				            <a href="${pageContext.servletContext.contextPath}/content/login.jsp" id="login">Iniciar Sesi�n</a>
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
	                                <li class="menuUserB" onclick="location.href='Logout.do'">Cerrar Sesi�n</li>
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
                    <a href="${pageContext.servletContext.contextPath}/content/premios.jsp" onclick="loading();">
                        <i class="fas fa-trophy"></i> &nbsp; Premios</a>
                    <a href="${pageContext.servletContext.contextPath}/content/about.jsp" class="actual" onclick="loading();">
                        <i class="fas fa-question"></i> &nbsp; Qui�nes somos</a>
                </nav>

                <div class="content">
					<h1 class="text-center">Descubre Qui�nes Somos</h1>
					
					<div class="row" id="teamContainer">
						<div class="col-xs-3 teamItem">
							<div class="teamImg">
								<img src="${pageContext.servletContext.contextPath}/images/team/mrx.jpg" alt=""/>
							</div>
							
							<div class="teamNombre">
								<h3 class="h3 text-center">Imanol Fern�ndez Garc�a</h3>
							</div>
							
							<div class="teamInfo text-center">
								<span>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sunt, modi voluptatibus architecto, doloremque quae vero porro dolor illo, tempora est quod deserunt.</span>
							</div>
							
							<div class="teamContact">
								<div class="teamEmail">
									<a href="mailto:maildeejemplo@gmail.com" target="_top"><span><i class="far fa-envelope"></i> &nbsp; maildeejemplo@gmail.com</span></a>
								</div>
							</div>							
						</div>
						
						<div class="col-xs-3 teamItem">
							<div class="teamImg">
								<img src="${pageContext.servletContext.contextPath}/images/team/mrx.jpg" alt=""/>
							</div>
							
							<div class="teamNombre">
								<h3 class="h3 text-center">Iv�n Rodr�guez Vald�s</h3>
							</div>
							
							<div class="teamInfo text-center">
								<span>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sunt, modi voluptatibus architecto, doloremque quae vero porro dolor illo, tempora est quod deserunt.</span>
							</div>
							
							<div class="teamContact">
								<div class="teamEmail">
									<a href="mailto:maildeejemplo@gmail.com" target="_top"><span><i class="far fa-envelope"></i> &nbsp;maildeejemplo@gmail.com</span></a>
								</div>
							</div>							
						</div>
				
						<div class="col-xs-3 teamItem">
							<div class="teamImg">
								<img src="${pageContext.servletContext.contextPath}/images/team/mrx.jpg" alt=""/>
							</div>
							
							<div class="teamNombre">
								<h3 class="h3 text-center">Francisco Javier Rubio �lvarez</h3>
							</div>
							
							<div class="teamInfo text-center">
								<span>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sunt, modi voluptatibus architecto, doloremque quae vero porro dolor illo, tempora est quod deserunt.</span>
							</div>
							
							<div class="teamContact">
								<div class="teamEmail">
									<a href="mailto:maildeejemplo@gmail.com" target="_top"><span><i class="far fa-envelope"></i> &nbsp;maildeejemplo@gmail.com</span></a>
								</div>
							</div>							
						</div>

						<div class="col-xs-3 teamItem">
							<div class="teamImg">
								<img src="${pageContext.servletContext.contextPath}/images/team/mrx.jpg" alt=""/>
							</div>
							
							<div class="teamNombre">
								<h3 class="h3 text-center">Daniel Tasc�n Coalla</h3>
							</div>
							
							<div class="teamInfo text-center">
								<span>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sunt, modi voluptatibus architecto, doloremque quae vero porro dolor illo, tempora est quod deserunt.</span>
							</div>
							
							<div class="teamContact">
								<div class="teamEmail">
									<a href="mailto:maildeejemplo@gmail.com" target="_top"><span><i class="far fa-envelope"></i> &nbsp;maildeejemplo@gmail.com</span></a>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row" id="locationContainer">
						<h2 class="h2 text-center">D�nde Estamos</h2>
						<div class="col-xs-3"></div>
						
						<div class="col-xs-3 text-center">
							<h3 class="h3">Gamiastur</h3>
							<p class="locationDireccion">Calle Luis Moya Blanco, 335</p>
							<p class="locationDireccion">33203 Gij�n - Asturias - Espa�a</p>
							<p class="locationDireccion"><i class="fas fa-phone"></i> &nbsp; 985 185 500</p>
							<p class="locationDireccion"><i class="far fa-envelope"></i> &nbsp; info@gamiastur.com</p>							
						</div>
						
						<div class="col-xs-3 text-left">
							<div id="locationMap"></div>
						</div>
						
						<div class="col-xs-2"></div>
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
          		
      		  var centro = { lat: 43.524605, lng: -5.613414 };
      		  
      		  var map = new google.maps.Map(document.getElementById('locationMap'), {
      		    zoom: 16,
      		    center: centro,
      		    disableDoubleClickZoom: true,
      		    draggable: false,
      		    zoomControl: false,
      		   	scrollwheel: false,
      		    fullscreenControl: false
      		  });
      		  
      		  var marker = new google.maps.Marker({
      		   	position: centro,
      		    map: map
      		  });

      		</script>
      		
            </html>