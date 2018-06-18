<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page import="com.gamitour.service.ServicePruebaDeportivaImp" %>
        <%@ page import="com.gamitour.service.ServiceItinerarioImp" %>
        <%
			ServicePruebaDeportivaImp sPrueb = new ServicePruebaDeportivaImp();
            request.setAttribute("pdOBJ", sPrueb.buscarPorNombre(request.getParameter("prueba")));
            request.setAttribute("subir", request.getParameter("subir"));
		%> 
            <!DOCTYPE html>
            <html lang="es">
				
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>Multimedias: ${pdOBJ.nombre}</title>

                <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
                <link rel="icon" href="${pageContext.servletContext.contextPath}/images/logos/favicon.png">

                <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/loader.css" />
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/style.css" />
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/multimedias.css" />
                <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/media.css" />

                <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD73nVF-IA4rkBCx98ZVjvV5XVzN_mb-10"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
                <script src="${pageContext.servletContext.contextPath}/js/loader.js"></script>   
                <script src="${pageContext.servletContext.contextPath}/js/multimedias.js"></script>         
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
                    <h1 class="text-center">Multimedias: ${pdOBJ.nombre}</h1>
                    <div class="row">
                        <c:choose>
                            <c:when test="${fn.length(pdOBJ.multimedias)== 0}">
                                <h2 class="h2 text-center">--Esta prueba deportiva no cuenta con ningún archivo multimedia disponible--</h2>
                                <h3 class="h3 text-center">Inténtelo en otro momento</h3>
                            </c:when>

                            <c:otherwise>
                                <c:forEach items="${pdOBJ.multimedias}" var="multimedia">
                                    <div class="col-xs-4 multimediaContainer">
                                        <div class="multContainer">
                                            <c:choose>
                                                <c:when test="${multimedia.imagen != null}">
                                                    <img src="/static${multimedia.imagen}"/>
                                                </c:when>

                                                <c:otherwise>
                                                    <video controls>
                                                        <source src="/static${multimedia.video}" type="video/mp4"/>
                                                    </video>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>

                                        <div class="multData">
                                            <div class="text-left col-xs-3"><span><fmt:formatDate value="${multimedia.fecha}" pattern="dd-MM-yyyy"/></span></div>
                                            <div class="text-center col-xs-3"><span>${multimedia.puntosacumulados} Puntos</span></div>
                                            <div class="text-center col-xs-3"><span id="pts${multimedia.idmultimedia}">${fn:length(multimedia.votos)}</span> <span>Votos</span></div>
                                            <div class="text-right col-xs-3"><a class="btnVoto" value="${multimedia.idmultimedia}"><i class="far fa-thumbs-up"></i>&nbsp; Votar</a></div>
                                        </div>

                                        <div class="multComentarios">
                                            <div class="comentarios">
                                                <c:choose>                                        
                                                    <c:when test="${fn:length(multimedia.comentarios) == 0}">
                                                        <span class="noComentarios">No existen comentarios.</span>
                                                    </c:when>
                                                    
                                                    <c:otherwise>
                                                        <c:forEach items="${multimedia.comentarios}" var="comentario">
                                                            <div class="comentario">
                                                                <span class="comentarioUser">${comentario.cliente.nombre} ${comentario.cliente.apellidos}: </span>
                                                                <span class="comentarioTexto">${comentario.texto}</span>
                                                            </div>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                            <div class="comentar text-right">
                                                <form action="" method="POST">
                                                    <input type="text" name="comentario" placeholder="Escribe un comentario..."/>
                                                    <input type="hidden" name="prueba" value="${pdOBJ.nombre}"/>
                                                    <input type="submit" class="btn" value="Comentar"/>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <a href="#modalSubida" data-toggle="modal"><h3 class="h3 text-center" style="margin-top: 25px;">Subir archivo</h3></a>
                </div>
                
                <div id="modalSubida" class="modal fade" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-body">Seleccione un tipo de archivo a subir</div>
                        <div class="modal-footer">
                            <a href="#modalImg" class="btn" data-dismiss="modal" data-toggle="modal">Imagen</a>
                            <a href="#modalVideo" class="btn" data-dismiss="modal" data-toggle="modal">Vídeo</a>
                        </div>
                    </div>
                </div>

                <form action="Nuevo.do" method="POST" enctype="multipart/form-data">
                    <div id="modalImg" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-body text-center" id="subidaImg">                            
                                <label class="btn" style="overflow:hidden; position:relative; margin-bottom: 25px;">
                                    Añadir Imagen
                                    <input type="hidden" name="tipo" value="multimediaImg"/>
                                    <input type="hidden" name="prueba" value="${pdOBJ.nombre}"/>
                                    <input type="file" name="archivoImg" onchange="readURL(this)" accept=".jpg, .png, .jpeg, .gif, .bmp" style="opacity: 0; width: 100%; height: 100%; position: absolute; right: 0; top: 0; text-align:right;" class="btn">
                                </label>		                            	                          
                                <div>
                                    <img id="showFile" src="" alt=""/>
                                </div>                            
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn" value="Subir" />
                            </div>
                        </div>
                    </div>
                </form>
                    
                <form action="Nuevo.do" method="POST" enctype="multipart/form-data">
                    <div id="modalVideo" class="modal fade" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-body text-center" id="subidaVideo">                                
                                <label class="btn" style="overflow:hidden; position:relative; margin-bottom: 25px;">
                                    Añadir Ví­deo 
                                    <input type="hidden" name="tipo" value="multimediaVid"/>
                                    <input type="hidden" name="prueba" value="${pdOBJ.nombre}"/>
                                    <input type="file" name="archivoVideo" onchange="readURL(this)" accept=".mp4" style="opacity: 0; width: 100%; height: 100%; position: absolute; right: 0; top: 0; text-align:right;" class="btn">
                                </label>		                            	                          
                                <div>
                                    <video style="height:360px;" controls>
                                        <source id="showFileVid" src="" type="video/mp4"/>
                                    </video>
                                </div> 
                            </div>
                            <div class="modal-footer">
                                <input type="submit" class="btn" value="Subir" />
                            </div>
                        </div>
                    </div>
                </form>

                <c:if test="${subir != null}">
                    <script>$("")</script>
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
            