<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Login</title>

    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link rel="icon" href="${pageContext.servletContext.contextPath}/images/logos/favicon.png">
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/loader.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/form.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/registro.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/media.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/form.js" type="text/javascript"></script>
    <script src="${pageContext.servletContext.contextPath}/js/login.js" type="text/javascript"></script>
    <script src="${pageContext.servletContext.contextPath}/js/loader.js"></script>
    
    <script> 
		var error = "${mensajeError}";
    </script>
</head>

<body>
    <header>
        <a href="${pageContext.servletContext.contextPath}/index.html">
            <img src="${pageContext.servletContext.contextPath}/images/logos/logo gris.png">
        </a>
    </header>

    <nav data-spy="affix" data-offset-top="150">
        <a href="${pageContext.servletContext.contextPath}/index.html">
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
        <h1>Inicia Sesión:</h1>
        <form action="Login.do" method="post">
            <div class="inputCon input-effect">
                <input type="email" name="email" placeholder="" class="textIn" value="${prevEmail}" required/>
                <label>Correo Electrónico</label>
                <span class="focus-border"></span>
            </div>

            <div class="inputCon input-effect">
                <input type="password" name="password" placeholder="" class="textIn" required/>
                <label>Contraseña</label>
                <span class="focus-border"></span>
            </div>
            <div>
                <input type="submit" class="btn" value="Iniciar Sesión" onclick="loading();">
                <span>¿Aún no tienes cuenta?
                    <a href="${pageContext.servletContext.contextPath}/content/registro.jsp">Regístrate</a>
                </span>
            </div>

        </form>
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
    
    <div id="loader">
			        <div class="sk-folding-cube">
			            <div class="sk-cube1 sk-cube"></div>
			            <div class="sk-cube2 sk-cube"></div>
			            <div class="sk-cube4 sk-cube"></div>
			            <div class="sk-cube3 sk-cube"></div>
			        </div>
			    </div>
</body>

</html>