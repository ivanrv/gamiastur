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
                <title>Detalle: ${premio.nombre}</title>
                <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
                <link rel="icon" href="${pageContext.servletContext.contextPath}/images/logos/favicon.png">
                
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/loader.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/form.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/mostrar.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/media.css" type="text/css">
                
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script src="http://code.jquery.com/ui/1.11.3/jquery-ui.min.js" integrity="sha256-xI/qyl9vpwWFOXz7+x/9WkG5j/SVnSw21viy8fWwbeE=" crossorigin="anonymous"></script>
                <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
                <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
                <script src="${pageContext.servletContext.contextPath}/js/loader.js" type="text/javascript"></script>
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
                    <div id="mostrar">
                        <div class="tit">
                            <h1>Datos de Premio:</h1>
                        </div>
                        <div class="col1">
                            <h2>Información Principal:</h2>
                            <span>
                                <strong>Nombre:</strong> ${premio.nombre}</span>
                            <span>
                                <strong>Cliente:</strong> ${premio.cliente.email}</span>
                            <span>
                                <strong>Puntos:</strong> ${premio.puntos}</span>

                        </div>
                        <div class="col2">
                            <h2>Información Secundaria:</h2>
                            <span>
                                <strong>Fecha de Activación:</strong> ${premio.fechaactivacion}</span>
                            <span>
                                <strong>Fecha de Consumo:</strong> ${premio.fechaconsumo}</span>
                            <span>
                                <strong>Imagen:</strong> ${premio.imagen}</span>

                        </div>

                        <div class="col3">
                            <h2>Información adicional:</h2>
                            <span>
                                <strong>Descripción:</strong>
                                </br>
                                ${premio.descripcion}
                            </span>
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