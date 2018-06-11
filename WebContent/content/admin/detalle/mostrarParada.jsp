<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <!DOCTYPE html>
            <html lang="es">

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
                
                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD73nVF-IA4rkBCx98ZVjvV5XVzN_mb-10"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="http://code.jquery.com/ui/1.11.3/jquery-ui.min.js" integrity="sha256-xI/qyl9vpwWFOXz7+x/9WkG5j/SVnSw21viy8fWwbeE=" crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
                <script src="${pageContext.servletContext.contextPath}/js/form.js" type="text/javascript"></script>
                <script src="${pageContext.servletContext.contextPath}/js/loader.js" type="text/javascript"></script>
                <script src="${pageContext.servletContext.contextPath}/js/mapForm.js"></script>
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
                   <a href="javascript:void(0)" id="menuIti" onclick="loading(); redirectIti();">
                        <i class="fas fa-map"></i> &nbsp; Itinerarios
                        <ul>
                        	<c:forEach items="${listaItinerarios}" var="iti">
                        		<li value="${iti}" onclick="loading();">
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
                	<a id="backPanel" href="Admin.do" onclick="loading();"><i class="fas fa-undo-alt"></i>&nbsp; Volver al panel de control</a>
                	
                    <div id="nuevoForm">
                        <div class="tit">
                            <h1>Actualización de Parada: ${parada.nombre}</h1>
                            <span>Los campos marcados con asteriscos son obligatorios</span>
                        </div>
                        <div class="col1">
                            <form action="Update.do" method="post" enctype="multipart/form-data">
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
                            <div style="height:325px">  
                            	<div id="floating-paner" class="inputCon input-effect" style="margin-bottom: 15px">
                            		<input id="address" type="textbox" class="textIn"/>
                            		<label>Introduzca una dirección a buscar</label>
                                	<span class="focus-border"></span>
                            	</div>                      
	                            <div id="mapForm" style="height:85%"></div>
	                			<input type="hidden" name="lat" value="">
	                			<input type="hidden" name="lng" value="">  
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
                                <label>Gastronomía</label>
                                <span class="focus-border"></span>
                            </div>
                        </div>
                        
                        <div id="modalImg" class="modal fade" role="dialog">
					        <div class="modal-dialog">
					            <div class="modal-body" id="subidaImg">
		                            <label class="btn" style="overflow:hidden; position:relative; margin-bottom: 25px;">
		                            	Modificar Imagen
		                            	<input type="file" name="archivoImg" onchange="readURL(this)" accept=".jpg, .png, .jpeg, .gif, .bmp" style="opacity: 0; width: 100%; height: 100%; position: absolute; right: 0; top: 0; text-align:right;" class="btn">
		                            </label>		                            	                          
		                            <div>
		                            	<img id="showFile" src="/static${parada.imagen}" alt="" style="height:200px;"/>
		                            </div> 
					            </div>
					            <div class="modal-footer">
					                <button class="btn" data-dismiss="modal">Aceptar</button>
					            </div>
					        </div>
					    </div>
					    
					    <div id="modalVideo" class="modal fade" role="dialog">
					        <div class="modal-dialog modal-lg">
					            <div class="modal-body" id="subidaVideo">
		                            <label class="btn" style="overflow:hidden; position:relative; margin-bottom: 25px;">
		                            	Modificar Vídeo
		                            	<input type="file" name="archivoVideo" onchange="readURL(this)" accept=".mp4" style="opacity: 0; width: 100%; height: 100%; position: absolute; right: 0; top: 0; text-align:right;" class="btn">
		                            </label>		                            	                          
		                            <div>
			                            <video style="height:480px;" controls>
			                            	<source id="showFileVid" src="/static${parada.video}"/>
		                            	</video>
		                            </div> 
					            </div>
					            <div class="modal-footer">
					                <button class="btn" data-dismiss="modal">Aceptar</button>
					            </div>
					        </div>
					    </div>

                        <div class="sbmt">
                        	<a href="#modalImg" class="btn" data-toggle="modal">Modificar Imagen</a>
                        	<a href="#modalVideo" class="btn" data-toggle="modal">Modificar VÃ­deo</a>
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