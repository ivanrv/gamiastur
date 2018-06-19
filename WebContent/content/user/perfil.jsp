<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page import="com.gamitour.service.ServiceItinerarioImp" %>
        <%@ page import="com.gamitour.service.ServiceClienteImp" %>
        
            <!DOCTYPE html>
            <html lang="es">

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>Perfil: ${username}</title>

                <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
                <link rel="icon" href="${pageContext.servletContext.contextPath}/images/logos/favicon.png">

                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/loader.css" />
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/style.css" />
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/user.css" />
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
            
            <jsp:useBean id="sClienteImp" class="com.gamitour.service.ServiceClienteImp" />
			<%
				ServiceClienteImp sCliente = new ServiceClienteImp();
				request.setAttribute("cliente", sCliente.buscarPorEmail(request.getSession().getAttribute("userEmail").toString()));
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
                    <a href="${pageContext.servletContext.contextPath}/content/premios.jsp" onclick="loading();">
                        <i class="fas fa-trophy"></i> &nbsp; Premios</a>
                    <a href="${pageContext.servletContext.contextPath}/content/about.jsp" onclick="loading();">
                        <i class="fas fa-question"></i> &nbsp; Quiénes somos</a>
                </nav>

                <div class="content">
					<div id="showPerfil" class="row">
						<h2 class="h2 text-center"> Perfil de usuario: <em>${username}</em></h2>
						<div id="perfilInfoPersonal" class="col-xs-12">
							<div id="perfilImgContainer" class="col-xs-3">
								<img src="${pageContext.servletContext.contextPath}/images/avatares/Ancla.png">
							</div>
							
							<div id="perfilDataContainer" class="col-xs-9">
								<div id="perfilDataPrin" class="col-xs-6">
									<p><b>Nombre:</b> <span>${cliente.nombre}</span></p>
									<p><b>Apellidos:</b> <span>${cliente.apellidos}</span></p>
									<p><b>Fecha de Nacimiento:</b> <span><fmt:formatDate value="${cliente.fechanacimiento}" pattern="dd-MM-yyyy"/></span></p>
									<p><b>Email:</b> <span>${cliente.email}</span></p>
								</div>
								
								<div id="perfilDataSec" class="col-xs-6">
									<p><b>Teléfono:</b> <span>${cliente.telefono}</span></p>
									<p><b>Dirección:</b> <span>${cliente.direccion}</span></p>
									<p><b>Código Postal:</b> <span>${cliente.codigopostal}</span></p>
									<p><b>Puntos Acumulados:</b> <span>${cliente.puntosacumulados}</span></p>
								</div>
							</div>
							
							<div id="perfilEditar" class="col-xs-3">
								<a href="${pageContext.servletContext.contextPath}/content/user/editarPerfil.jsp">Editar Perfil</a>
							</div>
						</div>						
						
						<div id="perfilActividades" class="col-xs-5">
							<h3 class="h3 text-center"><a href="${pageContext.servletContext.contextPath}/content/user/misActividades.jsp" onclick="loading();">Actividades</a></h3>
							<div id="perfilActData">
								<table class="table table-striped table-responsive">
									<c:forEach items="${cliente.clienteHasActividads}" var="cliAct">
										<tr>
											<td class="text-center">${cliAct.actividad.nombre}</td>
											<td class="text-center">${cliAct.actividad.fechainicio}</td>
											<td class="text-center">${cliAct.numPersonas} Personas</td>
										</tr>
									</c:forEach>																		
									<c:if test="${fn:length(cliente.clienteHasActividads) == 0 }">
										<tr><td class="text-center">-- No existe ninguna actividad reservada --</td></tr>
									</c:if>		
								</table>						
							</div>
						</div>
						
						<div class="col-xs-2"></div>
						
						<div id="perfilPremios" class="col-xs-5">
							<h3 class="h3 text-center"><a href="${pageContext.servletContext.contextPath}/content/user/misPremios.jsp" onclick="loading()">Premios</a></h3>
							<div id="perfilPremData">
								<table class="table table-striped table-responsive">
									<c:forEach items="${cliente.premios}" var="premio">
										<tr>
											<td class="text-center">${premio.nombre}</td>
											<td class="text-center">${premio.descripcion}</td>
										</tr>
									</c:forEach>

									<c:if test="${fn:length(cliente.premios) == 0 }">
										<tr><td class="text-center">-- No existe ningún premio activado --</td></tr>
									</c:if>	
								</table>
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

            </html>