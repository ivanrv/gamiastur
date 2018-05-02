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
                <title>Detalle: ${cliente.email}</title>

                <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
                <link rel="icon" href="${pageContext.servletContext.contextPath}/images/logos/favicon.png">

                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/loader.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/mostrarCliente.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/media.css" type="text/css">
                
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="http://code.jquery.com/ui/1.11.3/jquery-ui.min.js" integrity="sha256-xI/qyl9vpwWFOXz7+x/9WkG5j/SVnSw21viy8fWwbeE=" crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
                <script src="${pageContext.servletContext.contextPath}/js/loader.js"></script>
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
                        <a href="#" id="menuUser">
                            <i class="fas fa-angle-down"></i>
                            <ul>
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
                    <div id="infoCliente">
                        <div class="infoPersonal">
                            <h1>Información Personal:</h1>
                            <span>
                                <strong>Nombre:</strong> ${cliente.nombre}</p>
                            </span>
                            <span>
                                <strong>Apellidos:</strong> ${cliente.apellidos}</span>
                            <span>
                                <strong>Fecha nacimiento:</strong> ${cliente.fechanacimiento}</span>
                            <span>
                                <strong>Email:</strong> ${cliente.email}</span>
                            <span>
                                <strong>Rol</strong> ${cliente.rol.nombre}</span>
                        </div>

                        <div class="infoSecundaria">
                            <h1>Información Secundaria:</h1>
                            <span>
                                <strong>Telefono:</strong> ${cliente.telefono}</span>
                            <span>
                                <strong>Dirección:</strong> ${cliente.direccion}</span>
                            <span>
                                <strong>Código Postal:</strong> ${cliente.codigopostal}</span>
                            <span>
                                <strong>Puntos Acumulados:</strong> ${cliente.puntosacumulados}</span>
                            <span>
                                <strong>Fecha registro:</strong> ${cliente.fecharegistro}</span>
                        </div>

                        <div class="adicional">
                            <h1>Información Adicional:</h1>
                            <span><strong>Premios:</strong>
                                <ul>
                                    <c:forEach items="${cliente.premios}" var="premio">
                                        <li> ${premio.nombre}</li>
                                    </c:forEach>
                                </ul>
                            </span>
                            <span><strong>Actividades:</strong>
                                <ul>
                                    <c:forEach items="${cliente.clienteHasActividads}" var="actividad">
                                        <li>${actividad.actividad.nombre}</li>
                                    </c:forEach>
                                </ul>
                            </span>
                            <span><strong>Multimedias:</strong>
                                <ul>
                                    <c:forEach items="${clientes.multimedia}" var="multimedia">
                                        <li>${multimedia}</li>
                                    </c:forEach>
                                </ul>
                            </span>
                            <span><strong>Votos:</strong>
                                <ul>
                                    <c:forEach items="${cliente.votos}" var="voto">
                                        <li>
                                            <strong>Multimedia:</strong> ${voto.multimedia}
                                            <strong>Puntos:</strong> ${voto.puntos}</li>
                                    </c:forEach>
                                </ul>
                            </span>
                            <span><strong>Comentarios:</strong>
                                <ul>
                                    <c:forEach items="${cliente.comentarios}" var="comentario">
                                        <li>
                                            <strong>Multimedia:</strong> ${comentario.multimedia}
                                            <strong>Comentario:</strong> ${comentario.texto}</li>
                                    </c:forEach>
                                </ul>
                            </span>

                        </div>

                        <div class="avatar">
                            <img src="${pageContext.servletContext.contextPath}/images/avatares/${cliente.avatar}">
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