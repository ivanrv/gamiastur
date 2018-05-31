<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page import="com.gamitour.service.ServiceClienteImp" %>
<%@ page import="com.gamitour.service.ServiceItinerarioImp" %>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Registro</title>

    <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
    <link rel="icon" href="${pageContext.servletContext.contextPath}/images/logos/favicon.png">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/loader.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/form.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/registro.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/media.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.3/jquery-ui.min.js" integrity="sha256-xI/qyl9vpwWFOXz7+x/9WkG5j/SVnSw21viy8fWwbeE="
        crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/form.js" type="text/javascript"></script>
    <script src="${pageContext.servletContext.contextPath}/js/registro.js" type="text/javascript"></script>
    <script src="${pageContext.servletContext.contextPath}/js/loader.js"></script>
    
    <script> var emails = "${clientes}" </script>
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
        <h1>Regístrate:</h1>
        <span style="font-size: 0.9em;">Los campos marcados con asteriscos son obligatorios</span>
        <form action="Nuevo.do" method="post" id="regForm">
            <input type="hidden" name="tipo" value="cliente">
            <div class="inputCon input-effect">
                <input type="text" name="nombre" placeholder="" class="textIn" required />
                <label>Nombre *</label>
                <span class="focus-border"></span>
            </div>

            <div class="inputCon input-effect">
                <input type="text" name="apellidos" placeholder="" class="textIn" required />
                <label>Apellidos *</label>
                <span class="focus-border"></span>
            </div>

            <div class="inputCon input-effect">
                <input type="email" name="email" placeholder="" class="textIn" required />
                <label>Correo Electrónico *</label>
                <span class="focus-border"></span>
            </div>

            <div class="inputCon input-effect">
                <input type="email" name="emailR" placeholder="" class="textIn" required/>
                <label>Repita Correo Electrónico *</label>
                <span class="focus-border"></span>
            </div>

            <div class="inputCon input-effect">
                <input type="password" name="password" placeholder="" class="textIn" required />
                <label>Contraseña *</label>
                <span class="focus-border"></span>
            </div>

            <div class="inputCon input-effect">
                <input type="password" name="passwordR" placeholder="" class="textIn" required/>
                <label>Repita Contraseña *</label>
                <span class="focus-border"></span>
            </div>

            <div class="inputCon input-effect">
                <input type="text" name="fechaNac" value="" placeholder="" class="textIn datepicker" required/>
                <label>Fecha de Nacimiento *</label>
                <span class="focus-border"></span>
            </div>

            <div class="inputCon input-effect">
                <input type="text" name="telefono" placeholder="" class="textIn" />
                <label>Teléfono</label>
                <span class="focus-border"></span>
            </div>

            <div class="inputCon input-effect">
                <input type="text" name="direccion" placeholder="" class="textIn" />
                <label>Dirección</label>
                <span class="focus-border"></span>
            </div>

            <div class="inputCon input-effect">
                <input type="text" name="CP" placeholder="" class="textIn" />
                <label>Código Postal</label>
                <span class="focus-border"></span>
            </div>

            <div>
                <a href="#modalAvatar" data-toggle="modal" id="selectAvatar" class="btn">Seleccionar avatar</a>
            </div>

            <div>
                <a class="btn" id="btnRegistro">Registrarse</a>
                <span>¿Ya tienes cuenta?
                    <a href="${pageContext.servletContext.contextPath}/content/login.jsp">Inicia sesión</a>
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

        <p>Gamiastur &copy; 2018</p>
    </footer>
    
    
</body>

</html>