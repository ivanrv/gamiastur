<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page import="com.gamitour.service.ServiceItinerarioImp" %>
        <%@ page import="com.gamitour.service.ServiceClienteImp" %>
        
            <!DOCTYPE html>
            <html lang="es">

            <head>
                <<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>Mis Actividades</title>

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
				<script src="${pageContext.servletContext.contextPath}/js/misActs.js"></script>
            </head>

            <body>
            
            <c:if test="${itinerarios == null}">
	            <jsp:useBean id="sItinerarioImp" class="com.gamitour.service.ServiceItinerarioImp" />
		
				<%
					ServiceItinerarioImp sItinerario = new ServiceItinerarioImp();
					request.getSession().setAttribute("itinerarios", sItinerario.buscarNombres());
				%>
			</c:if>
            
            <jsp:useBean id="sClienteImp" class="com.gamitour.service.ServiceClienteImp"/>
            <%
            	ServiceClienteImp sCliente = new ServiceClienteImp();
            	request.setAttribute("clienteActividades", sCliente.buscarPorEmail(request.getSession().getAttribute("userEmail").toString()).getClienteHasActividads());
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
                    <a href="${pageContext.servletContext.contextPath}/content/about.jsp" onclick="loading();">
                        <i class="fas fa-question"></i> &nbsp; Qui�nes somos</a>
                </nav>

                <div class="content">
					<div id="showActividades" class="row">
						<h2 class="h2 text-center"> Mis actividades: <em>${username}</em></h2>
						<div class="row" id="actividadesContainer">
							<c:forEach items="${clienteActividades}" var="cliAct">
								<div class="row act">
									<div class="col-xs-2 imgAct text-center">
										<img src="/static${cliAct.actividad.imagenactividads.iterator().next().archivo}">
									</div>
									<div class="col-xs-2 text-center">${cliAct.actividad.nombre}</div>
									<div class="col-xs-2 text-center">${cliAct.actividad.puntos} Puntos</div>
									<div class="col-xs-2 text-center"><fmt:formatDate value="${cliAct.actividad.fechainicio}" pattern="dd-MM-yyyy"/></div>
									<div class="col-xs-2 text-center">
										<a href="#modalMaps" data-toggle="modal" class="procModalMaps" value="${cliAct.actividad.latitud} ${cliAct.actividad.longitud}">
                                        	<i class="fas fa-map-marker-alt"></i>&nbsp;
                                        	<span>Mostrar Ubicaci�n</span>
                                        </a>
									</div>
									<div class="col-xs-2 text-right">
										<a class="btn btnReserva" href="#modalCancelar" value="${cliAct.actividad.nombre}" data-toggle="modal">Cancelar Reserva</a>
									</div>
								</div>
							</c:forEach>
							
							<c:if test="${fn:length(clienteActividades) == 0 }">
									<div class="col-xs-12 text-center">
										<h3 class="h3">-- No existe ninguna actividad para mostrar --</h3>
										<h4 class="h4">-- Echa un vistazo a nuestras actividades <a href="${pageContext.servletContext.contextPath}/content/actividades.jsp" onclick="loading();">aqu��</a> --</h4>
									</div>
							</c:if>	
						</div>
					</div>
                </div>
                
                <div id="modalCancelar" class="modal fade" role="dialog">
			        <div class="modal-dialog">
			            <div class="modal-body" id="mensajeBorrar">
			            	<p class="text-center">�Est� seguro de querer abandonar esta actividad?</p>
			            </div>
			            <div class="modal-footer">
			                <form action="Reserva.do" method="post">
			                	<input type="hidden" id="actReserva" name="actividad" value=""/>
			                	<input type="hidden" name="tipo" value="cancela"/>
			                	<input type="submit" class="btn" value="Abandonar"></input>
			           			<a href="javascript:void(0);" class="btn" data-dismiss="modal">Cancelar</a>
			                </form>
			            </div>
			        </div>
				</div>
				
				<div id="modalMaps" class="modal fade info-modal" role="dialog">
					<div class="modal-dialog">
						<div class="modal-header">
							<button class="close" type="button" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Ubicaci�n</h4>
						</div>
						<div class="modal-body">
							<div id="mapTabla"></div>
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
				$(".btnReserva").click(function(){
					$("#actReserva").attr("value", $(this).attr("value"));
				});
			</script>

            </html>