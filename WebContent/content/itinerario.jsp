<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page import="com.gamitour.service.ServiceItinerarioImp" %>
        <%
			ServiceItinerarioImp sIti = new ServiceItinerarioImp();
			request.setAttribute("itiOBJ", sIti.buscarPorNombre(request.getParameter("iti")));
		%> 
            <!DOCTYPE html>
            <html lang="es">
				
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>${itiOBJ.nombre}</title>

                <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
                <link rel="icon" href="${pageContext.servletContext.contextPath}/images/logos/favicon.png">

                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/loader.css" />
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/style.css" />
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/itinerario.css" />
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/media.css" />

                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD73nVF-IA4rkBCx98ZVjvV5XVzN_mb-10"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
                <script src="${pageContext.servletContext.contextPath}/js/loader.js"></script>
                <script src="${pageContext.servletContext.contextPath}/js/itinerario.js"></script>
                <script>
		            var stringParadas = "[";
		
		        	<c:forEach items="${itiOBJ.paradas}" var="parada" varStatus="status">
						stringParadas += '{"nombre": "${parada.nombre}","numeroParada": "${parada.numeroParada}", "historia": "${parada.historia}", "anecdotario": "${parada.anecdotario}", "gastronomia": "${parada.gastronomia}", "imagen": "${parada.imagen}", "video": "${parada.video}", "latitud": "${parada.latitud}", "longitud": "${parada.longitud}", "pruebasDeportivas": [';
						<c:forEach items="${parada.pruebadeportivas}" var="pd" varStatus="pdStatus">
							stringParadas += '{"nombre": "${pd.nombre}", "fechainicio": "<fmt:formatDate value="${pd.fechainicio}" pattern="dd-MM-yyyy"/>", "fechafin": "<fmt:formatDate value="${pd.fechafin}" pattern="dd-MM-yyyy"/>", "explicacion": "${pd.explicacion}", "puntos": "${pd.puntos}"}';
							<c:if test="${!pdStatus.last}">stringParadas += ",";</c:if>
						</c:forEach>
						stringParadas += '], "pruebasCulturales": [';
						<c:forEach items="${parada.pruebaculturals}" var="pc" varStatus="pcStatus">
							stringParadas += '{"nombre": "${pc.nombre}", "pregunta": "${pc.pregunta}", "respuesta": "${pc.respuesta}","fallo1": "${pc.fallo1}", "fallo2": "${pc.fallo2}", "fallo3": "${pc.fallo3}", "puntos": "${pc.puntos}"}';
							<c:if test="${!pcStatus.last}">stringParadas += ",";</c:if>
						</c:forEach>
						stringParadas += "]}";
						<c:if test="${!status.last}"> stringParadas += ",";</c:if>					
					</c:forEach>
					stringParadas += "]";
		         </script>
                
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
                    <a href="javascript:void(0)" class="actual" id="menuIti" onclick="loading(); redirectIti();">
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
                	<h1 class="text-center">${itiOBJ.nombre}</h1>
                	<h4 class="text-center h4">${itiOBJ.categoria} &nbsp; &nbsp; &nbsp; &nbsp; ${itiOBJ.duracion}</h4>
                	
                	<div class="row" id="mapaContainer">
                		<div id="mapaIti"></div>                	
                	</div>
                	
                	<div class="row" id="paradasContainer">
                		<div class="text-center col-xs-12" id="paradaTit">
                			<h2 class="h2" id="paradaNombre"></h2>
                			
                			<h4 class="h4" id="paradaNumero"></h4>
                		</div>
                		
                		<div class="col-xs-12" id="dataContainer">
                			<div class="col-xs-4 dataText">
                				<span id="paradaHistoria"></span>
                			</div>
                			
                			<div class="col-xs-4 dataText">
                				<span id="paradaAnecdotario"></span>
                			</div>
                			
                			<div class="col-xs-4 dataText">
                				<span id="paradaGastronomia"></span>
                			</div>	
                		</div>
                		
                		<div class="col-xs-12" id="adicionalContainer">
							<div class="col-xs-6 text-right" id="mediaContainer">
								<img id="imgContainer"/>
                			</div>
                			
                			<div class="col-xs-6 text-left" id="mapContainer">
                				<div id="paradaMap"></div>
                			</div>
                		</div>
                		
                		<div class="col-xs-12" id="btnsContainer">
                			<div class="col-xs-1"></div>
                			
                			<c:choose>
                				<c:when test="${username != null}">
                					<div class="col-xs-2 text-center">
                						<a href="#modalDeportivas" data-toggle="modal" class="btnModalPruebas" id="butDeportivas"><div class="btnPruebas" id="btnDeportivas"><i class="fas fa-volleyball-ball"></i></div></a>
                					</div>
                					<div class="col-xs-2 text-center">
										<a href="#modalCulturales" data-toggle="modal" class="btnModalPruebas" id="butCulturales"><div class="btnPruebas" id="btnCulturales"><i class="fas fa-book"></i></div></a>
                					</div>
                				</c:when>
                			
                				<c:otherwise>
                					<div class="col-xs-2 text-center"></div>
                					<div class="col-xs-2 text-center"></div>
                				</c:otherwise>
                			</c:choose>
                			
                			<div class="col-xs-2 text-center"></div>
                			
                			<div class="col-xs-2 text-center">
                				<div class="btnParada" id="btnParadaBack" value="">
                				&larr;
                				<input type="hidden" value=""/>
                				</div>
                			</div>
                			
                			
                			<div class="col-xs-2 text-center">
                				<div class="btnParada" id="btnParadaNext">
                				&rarr;
                				<input type="hidden" value=""/>
                				</div>
                			</div>                    			                        			
                		</div>
                	</div>
				</div>
				
				<c:if test="${username != null}">
					<div id="modalCulturales" class="modal fade" role="dialog">
						<div class="modal-dialog modal-lg">
							<div class="modal-header">
								<button class="close" type="button" data-dismiss="modal">&times;</button>
								<h3 class="modal-title h3 text-center" id="titCulturales">TITULO CULTURALES</h3>
							</div>

							<div class="modal-body" id="respuestasContainer"></div>

							<div class="modal-footer">
								<div class="row" id="culturalesCambio"></div>
							</div>
						</div>
					</div>	
					
					<div id="modalDeportivas" class="modal fade" role="dialog">
						<div class="modal-dialog modal-lg">
							<div class="modal-header">
								<button class="close" type="button" data-dismiss="modal">&times;</button>
								<h3 class="modal-title h3 text-center" id="titDeportivas"></h3>
							</div>

							<div class="modal-body">
								<div class="row">
									<div class="col-xs-4 text-center" id="puntosDeportiva"></div>
									<div class="col-xs-4 text-center"><a href="#modalPDF" data-toggle="modal" id="explicacionDeportiva"><i class="fas fa-file-pdf"></i>&nbsp;<span>Mostrar Explicaci�n</span></a></div>
									<div class="col-xs-4 text-center" id="fechaDeportiva"></div>	
								</div>
								
								<div class="row" style="margin-top: 20px;">
									<div class="col-xs-3"></div>

									<div class="col-xs-2 text-center">
										<form action="${pageContext.servletContext.contextPath}/content/multimedias.jsp" method="POST">
											<input type="hidden" name="prueba" class="formPruebaName" value="" />
											<input type="submit" value="Ver multimedias" class="btn"/>
										</form>
									</div>

									<div class="col-xs-2"></div>

									<div class="col-xs-2 text-center">
										<form action="${pageContext.servletContext.contextPath}/content/multimedias.jsp" method="POST">
											<input type="hidden" name="prueba" class="formPruebaName" value="" />
											<input type="hidden" name="subir" value="subir"/>
											<input type="submit" value="Subir multimedia" class="btn"/>
										</form>
									</div>
								</div>
							</div>

							<div class="modal-footer">
								<div class="row" id="deportivasCambio"></div>
							</div>
						</div>
					</div>

					<div id="modalPDF" class="modal fade info-modal" role="dialog">
						<div class="modal-dialog modal-lg">
							<div class="modal-header">
								<button class="close" type="button" data-dismiss="modal">&times;</button>
								<h4 class="modal-title">Explicaci�n</h4>
							</div>
							<div class="modal-body">
								<div>
									<embed id="modalPDFDoc" src="" type="application/pdf" style="width:100%; min-height: 400px"/>
								</div>
							</div>
						</div>
					</div>

				</c:if>

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
            