<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
        <%@ page import="com.gamitour.service.ServiceItinerarioImp" %>
        <%@ page import="com.gamitour.service.ServiceClienteImp" %>
        
        <jsp:useBean id="sClienteImp" class="com.gamitour.service.ServiceClienteImp" />
				<%
					ServiceClienteImp sCliente = new ServiceClienteImp();
					request.setAttribute("cliente", sCliente.buscarPorEmail(request.getSession().getAttribute("userEmail").toString()));
					request.setAttribute("emails", sCliente.buscarEmails());
				%>
        
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
                <script src="${pageContext.servletContext.contextPath}/js/form.js"></script>
                <script src="${pageContext.servletContext.contextPath}/js/formFilterEditarPerfil.js"></script>
            </head>

            <body>
            
            <script>
					var lul = "${cliente.password}";
					var emails = "${emails}";
				</script>
		            
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
					<div id="showPerfil" class="row">
						<h2 class="h2 text-center"> Editar perfil: <em>${username}</em></h2>
						<div id="perfilInfoPersonal" class="col-xs-12">
							<div id="perfilImgContainer" class="col-xs-3">
								<img src="${pageContext.servletContext.contextPath}/images/avatares/Ancla.png">
							</div>
							<form action="Update.do" method="post" id="editPerfilForm">
							<input type="hidden" name="tipo" value="cliente">
							<div id="perfilDataContainer" class="col-xs-9">
								<div id="perfilDataPrin" class="col-xs-6">
								
									<div class="inputCon input-effect">
						                <input type="text" name="nombre" placeholder="" class="textIn has-content" required value="${cliente.nombre}" />
						                <label>Nombre</label>
						                <span class="focus-border"></span>
						            </div>
									
									<div class="inputCon input-effect">
						                <input type="text" name="apellidos" placeholder="" class="textIn has-content" required value="${cliente.apellidos}" />
						                <label>Apellidos</label>
						                <span class="focus-border"></span>
						            </div>
						            
						            <div class="inputCon input-effect">
						                <input type="text" name="fechanacimiento" placeholder="" class="textIn datepicker has-content" required value="<fmt:formatDate value='${cliente.fechanacimiento}' pattern='dd-MM-yyyy'/>" />
						                <label>Fecha de Nacimiento</label>
						                <span class="focus-border"></span>
						            </div>
						            
						            <div class="inputCon input-effect">
						                <input type="text" name="email" placeholder="" class="textIn has-content" required value="${cliente.email}" />
						                <label>Email</label>
						                <span class="focus-border"></span>
						            </div>
								</div>
								
								<div id="perfilDataSec" class="col-xs-6">
								
									<div class="inputCon input-effect">
						                <input type="text" name="telefono" placeholder="" class="textIn" <c:if test="${cliente.telefono != null }">class="has-content"</c:if> required value="${cliente.telefono}" />
						                <label>Tel�fono</label>
						                <span class="focus-border"></span>
						            </div>
									
									<div class="inputCon input-effect">
						                <input type="text" name="direccion" placeholder="" class="textIn" <c:if test="${cliente.direccion != null }">class="has-content"</c:if> required value="${cliente.direccion}" />
						                <label>Direcci�n</label>
						                <span class="focus-border"></span>
						            </div>
						            
						            <div class="inputCon input-effect">
						                <input type="text" name="codigopostal" placeholder="" class="textIn" <c:if test="${cliente.codigopostal != null }">class="has-content"</c:if> required value="${cliente.codigopostal}" />
						                <label>C�digo Postal</label>
						                <span class="focus-border"></span>
						            </div>
							          
						            <div class="col-md-12">
							            <div class="col-md-6 text-right">
											<a href="#modalPassword" class="btn" data-toggle="modal">Cambiar Contrase�a</a>
										</div>
																				
										<div class="col-md-3 text-center">
											<a href="javascript:void(0);" id="guardarEditarPerfil" class="btn">Guardar</a>
										</div>
										
										<div class="col-md-3 text-center">
											<a href="#modalBorrar" class="btn danger" data-toggle="modal">Borrar Perfil</a>
										</div>
						            </div>						            
								</div>
		
								
								<div id="modalPassword" class="modal fade" role="dialog">
							        <div class="modal-dialog">
							        	<div class="modal-header">
							        		<h3 class="h3 text-center">Cambio de contrase�a</h3>
							        	</div>
							            <div class="modal-body" id="passwordContainer">
							            	<div class="inputCon input-effect">
								                <input type="password" name="passActual" id="passActual" placeholder="Contrase�a Actual" class="textIn" required />
								                <label>Contrase�a actual</label>
								                <span class="focus-border"></span>
								            </div>
								            
								            <div class="inputCon input-effect">
								                <input type="password" name="password" placeholder="Nueva Contrase�a" class="textIn" required />
								                <label>Nueva Contrase�a</label>
								                <span class="focus-border"></span>
								            </div>
								            
								            <div class="inputCon input-effect">
								                <input type="password" name="passwordR" placeholder="Repita Contrase�a" class="textIn" required />
								                <label>Repita Contrase�a</label>
								                <span class="focus-border"></span>
								            </div>
							            </div>
							            <div class="modal-footer">
							                <a href="javascript:void(0);" class="btn" id="btnCambioPass">Aceptar</a>
							            </div>
							        </div>
							    </div>
							</div>
							</form>
						</div>						
										
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
			    
			    <div id="modalBorrar" class="modal fade" role="dialog">
			        <div class="modal-dialog">
			            <div class="modal-body" id="mensajeBorrar">
			            	<p class="text-center">�Est� seguro de que quiere eliminar su perfil? Esto eliminar� toda la informaci�n relacionada con usted de la que disponemos, adem�s de todos sus progresos y premios.</p>
			            	<p class="text-center">�Desea continuar?</p>
			            </div>
			            <div class="modal-footer">
			                <a href="#modalConfirmar" class="btn danger" data-toggle="modal">Continuar</a>
			            </div>
			        </div>
			    </div>
			    
			    <div id="modalConfirmar" class="modal fade" role="dialog">
			        <div class="modal-dialog">
			            <div class="modal-body" id="mensajeConfirmar">
			            	<p class="text-center">Para eliminar su perfil es necesario que introduzca su contrase�a de nuevo.</p>
			            	<div class="inputCon input-effect">
				                <input type="password" name="passConfirmar" id="passConfirmar" placeholder="Contrase�a Actual" class="textIn" required />
				                <label>Contrase�a actual</label>
				                <span class="focus-border"></span>
				            </div>
				            <form action="Eliminar.do" method="POST" id="formBorrar">
				            	<input type="hidden" name="tipo" value="clienteUSER"/>
				            	<input type="hidden" name="email" value="${cliente.email}"/>
				            </form>
			            </div>
			            <div class="modal-footer">
			                <a href="javascript:void(0);" id="checkPassDelete" class="btn danger" data-toggle="modal">Borrar mi perfil</a>
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