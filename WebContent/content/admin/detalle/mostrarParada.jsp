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
                <title>Modificar: ${parada.nombre}</title>
                <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
                <link rel="icon" href="${pageContext.servletContext.contextPath}/images/logos/favicon.png">
                
                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/loader.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/form.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/nuevo.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/media.css" type="text/css">
                
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="http://code.jquery.com/ui/1.11.3/jquery-ui.min.js" integrity="sha256-xI/qyl9vpwWFOXz7+x/9WkG5j/SVnSw21viy8fWwbeE=" crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
                <script src="${pageContext.servletContext.contextPath}/js/form.js" type="text/javascript"></script>
                <script src="${pageContext.servletContext.contextPath}/js/loader.js" type="text/javascript"></script>
                <script src="${pageContext.servletContext.contextPath}/js/formFilterParadaU.js" type="text/javascript"></script>
            	<script>
            		var nParOriginal = ${parada.numeroParada};
            	
	            	var stringItinerarios = "[";
	
	            	<c:forEach items="${listaItinerarios}" var="itinerario" varStatus="status">
						stringItinerarios += '{"nombre": "${itinerario.nombre}", "paradas":['; 
							<c:forEach items="${itinerario.paradas}" var="par" varStatus="pStatus">
								stringItinerarios += ' "${par.numeroParada}"';
								<c:if test="${!pStatus.last}">stringItinerarios += ","</c:if>
							</c:forEach>							
							stringItinerarios += ']}';
						<c:if test="${!status.last}"> stringItinerarios += ","</c:if>					
					</c:forEach>
					stringItinerarios += "]"; 
            	</script>
            
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
                    <a href="${pageContext.servletContext.contextPath}/content/user/index.jsp">
                        <img src="${pageContext.servletContext.contextPath}/images/logos/logo gris.png">
                    </a>
            
                    <div class="user">
                        <a href="javascript:void(0)" id="menuUser">
                            <i class="fas fa-angle-down"></i>
                            <ul <c:if test="${userRol != 'user'}">class="adminUser"</c:if>>
                                <li>Editar Perfil</li>
                                <li class="menuUserB">Mis Actividades</li>
                                <li class="menuUserB">Logros</li>
                                <c:if test="${userRol != 'user'}">
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
                    <div id="nuevoForm">
                        <div class="tit">
                            <h1>Actualización de Parada: ${parada.nombre}</h1>
                            <span>Los campos marcados con asteriscos son obligatorios</span>
                        </div>
                        <div class="col1">
                            <form action="Update.do" method="post">
                                <input type="hidden" name="tipo" value="parada">
                                <input type="hidden" name="nombre" value="${parada.nombre}">
                                <div class="inputCon input-effect">
                                    <select class="textIn has-content" name="itinerario" placeholder="" required>
                                        <option selected>${parada.itinerario.nombre}</option>
                                        <c:forEach items="${listaItinerarios}" var="itinerario">
                                        	<c:if test="${itinerario.nombre != parada.itinerario.nombre }">
                                            	<option value="${itinerario.nombre}">${itinerario.nombre}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                    <label>Seleccione un Itinerario *</label>
                                    <span class="focus-border"></span>
                                </div>
                                <div class="inputCon input-effect">
                                    <input class="textIn has-content" type="number" name="nParada" placeholder="" value="${parada.numeroParada}" required/>
                                    <label>Número de Parada *</label>
                                    <span class="focus-border"></span>
                                </div>
                        </div>
                        <div class="col2">
                            <div class="inputCon input-effect">
                                <input class="textIn has-content" type="text" name="ubicacion" placeholder="" value="${parada.latitud} ${parada.longitud}" required/>
                                <label>Ubicación *</label>
                                <span class="focus-border"></span>
                            </div>        
                        </div>

                        <div class="col3">
                            <div class="inputCon input-effect">
                                <textarea class="textIn taShare has-content" name="historia" placeholder="" required rows="10">${parada.historia}</textarea>
                                <label>Historia</label>
                                <span class="focus-border"></span>
                            </div>
                            <div class="inputCon input-effect">
                                <textarea class="textIn taShare has-content" name="anecdotario" placeholder="" required rows="10">${parada.anecdotario}</textarea>
                                <label>Anecdotario</label>
                                <span class="focus-border"></span>
                            </div>
                            <div class="inputCon input-effect">
                                <textarea class="textIn taShare has-content" name="gastronomia" placeholder="" required rows="10">${parada.gastronomia}</textarea>
                                <label>Gastronomia</label>
                                <span class="focus-border"></span>
                            </div>
                        </div>

                        <div class="sbmt">
                        	<a id="modificarMultimedia" class="btn">Modificar Multimedias</a>
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

                    <p>Gamitour &copy; 2018</p>
                </footer>
            </body>

            </html>