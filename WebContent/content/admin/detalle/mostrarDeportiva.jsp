<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
            <!DOCTYPE html>
            <html lang="es">

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta http-equiv="X-UA-Compatible" content="ie=edge">
                <title>Modificar: ${deportiva.nombre}</title>
                
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
                <script src="${pageContext.servletContext.contextPath}/js/formFilterDeportivaU.js" type="text/javascript"></script>
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
	                                <li class="menuUserB" onclick="location.href='Logout.do'">Cerrar Sesi�n</li>
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
                        <i class="fas fa-question"></i> &nbsp; Qui�nes somos</a>
                </nav>

                <div class="content">
                	<a id="backPanel" href="Admin.do" onclick="loading();"><i class="fas fa-undo-alt"></i>&nbsp; Volver al panel de control</a>
                	
                    <div id="nuevoForm">
                        <div class="tit">
                            <h1>Actualizaci�n de Prueba Deportiva: ${deportiva.nombre}</h1>
                            <span>Los campos marcados con asteriscos son obligatorios</span>
                        </div>
                        <div class="col1">
                            <form action="Update.do" method="post" enctype="multipart/form-data">
                                <input type="hidden" name="tipo" value="deportiva">
                                <input type="hidden" name="nombre" value="${deportiva.nombre}">
                                <div class="inputCon input-effect">
                                    <select class="textIn has-content" name="parada" placeholder="" required>
                                        <option selected>${deportiva.parada.nombre}</option>
                                        <c:forEach items="${listaParadas}" var="parada">
                                        	<c:if test="${parada.nombre != deportiva.parada.nombre}">
                                            	<option value="${parada.nombre}">${parada.nombre}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                    <label>Seleccione una parada *</label>
                                    <span class="focus-border"></span>
                                </div>
                                
                                <div class="inputCon input-effect">
	                                <input class="textIn has-content" type="number" name="puntos" placeholder="" value="${deportiva.puntos}" required/>
	                                <label>Puntos *</label>
	                                <span class="focus-border"></span>
	                            </div>                                
                        </div>
                        <div class="col2">
                            <div class="inputCon input-effect">
                                <input class="textIn has-content datepicker" type="text" name="inicio" placeholder="" value="<fmt:formatDate value="${deportiva.fechainicio}" pattern="dd-MM-yyyy"/>" required/>
                                <label>Fecha de Inicio *</label>
                                <span class="focus-border"></span>
                            </div>
                            <div class="inputCon input-effect">
                                <input class="textIn has-content datepicker" type="text" name="fin" placeholder="" value="<fmt:formatDate value="${deportiva.fechafin}" pattern="dd-MM-yyyy"/>" required/>
                                <label>Fecha de Fin</label>
                                <span class="focus-border"></span>
                            </div>                            
                        </div>
                        
                        <div id="modalImg" class="modal fade" role="dialog">
					        <div class="modal-dialog modal-lg">
					            <div class="modal-body" id="subidaImg">
		                            <label class="btn" style="overflow:hidden; position:relative; margin-bottom: 25px;">
		                            	Modificar Explicaci�n
		                            	<input type="file" name="archivo" onchange="readURL(this)" accept=".pdf" style="opacity: 0; width: 100%; height: 100%; position: absolute; right: 0; top: 0; text-align:right;" class="btn">
		                            </label>		                            	                          
		                            <div>
		                            	<embed id="showFile" src="/static${deportiva.explicacion}" alt="" style="height:200px;" type="application/pdf"/>
		                            </div> 
					            </div>
					            <div class="modal-footer">
					                <button class="btn" data-dismiss="modal">Aceptar</button>
					            </div>
					        </div>
					    </div>	

                        <div class="sbmt">
                        	<a href="#modalImg" data-toggle="modal" class="btn">Modificar Explicaci�n</a>
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