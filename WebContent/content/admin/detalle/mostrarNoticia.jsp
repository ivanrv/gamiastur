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
                <title>Modificar: ${noticia.nombre}</title>
                <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
                <link rel="icon" href="${pageContext.servletContext.contextPath}/images/logos/favicon.png">
                
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/style.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/form.css" type="text/css">
                <link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/nuevo.css" type="text/css">
                
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
                <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
                <script src="${pageContext.servletContext.contextPath}/js/form.js" type="text/javascript"></script>
            </head>

            <body>
                <header>
                    <a href="${pageContext.servletContext.contextPath}/content/user/index.jsp">
                        <img src="${pageContext.servletContext.contextPath}/images/logos/logo gris.png">
                    </a>
            
                    <div class="user">
                        <a href="javascript:void(0)" id="menuUser">
                            <i class="fas fa-angle-down"></i>
                            <ul>
                                <li>Editar Perfil</li>
                                <li class="menuUserB">Mis Actividades</li>
                                <li class="menuUserB">Logros</li>
                                <li class="menuUserB" id="panel" onclick="location.href='Admin.do'">Panel de Control</li>
                                <li class="menuUserB" onclick="location.href='Logout.do'">Cerrar Sesión</li>
                            </ul>
                        </a>
                        <span>
                            <a href="#">${username}</a>
                        </span>
                        <img src="${pageContext.servletContext.contextPath}/images/avatares/Ancla.png">
                    </div>
                </header>

                <nav>
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
                            <h1>Actualización de Noticia: ${noticia.nombre}</h1>
                        </div>
                        <div class="col1">
                            <form action="Update.do" method="post">
                                <input type="hidden" name="tipo" value="noticia">
                                <input type="hidden" name="nombre" value="${noticia.nombre}">
                                <div class="inputCon input-effect">
                                    <input class="textIn has-content" type="date" name="alta" placeholder="" value="${noticia.fechaalta}" required/>
                                    <label>Fecha de Alta</label>
                                    <span class="focus-border"></span>
                                </div>
                                <div class="inputCon input-effect">
                                    <input class="textIn has-content" type="date" name="caducidad" placeholder="" value="${noticia.fechacaducidad}" required/>
                                    <label>Fecha de Caducidad</label>
                                    <span class="focus-border"></span>
                                </div>
                        </div>

                        <div class="col2">

                            <div class="inputCon input-effect">
                                <input class="textIn has-content" type="text" name="imagen" placeholder="" value="${noticia.imagen}" required/>
                                <label>Imagen</label>
                                <span class="focus-border"></span>
                            </div>
                        </div>

                        <div class="col3">
                            <div class="inputCon input-effect">
                                <textarea class="textIn has-content" name="texto" placeholder="" required rows="30">${noticia.texto}</textarea>
                                <label>Texto de la Noticia</label>
                                <span class="focus-border"></span>
                            </div>
                        </div>

                        <div class="sbmt">
                            <input type="submit" value="Actualizar">
                        </div>
                        </form>
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