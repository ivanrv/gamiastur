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
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/style.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/form.css" />
    <link rel="stylesheet" type="text/css" media="screen" href="${pageContext.servletContext.contextPath}/css/media.css" />

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
    <script src="${pageContext.servletContext.contextPath}/js/form.js" type="text/javascript"></script>
    <script src="${pageContext.servletContext.contextPath}/js/registro.js" type="text/javascript"></script>


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
                    <span>Itinerario de GijÃ³n</span>
                </li>
                <li id="avilesIti" onclick="location.href='${pageContext.servletContext.contextPath}/content/itiAviles.html'">
                    <span>Itinerario de AvilÃ©s</span>
                </li>
            </ul>
        </a>
        <a href="#">
            <i class="fas fa-trophy"></i> &nbsp; Premios</a>
        <a href="#">
            <i class="fas fa-question"></i> &nbsp; Quiénes somos</a>
    </nav>

    <div class="content">
        <h1>Regístrate:</h1>
        <span style="font-size: 0.6em;">Los campos marcados con asteriscos son obligatorios</span>
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
                <input type="text" name="fechaNac" value=" " placeholder="" class="textIn datepicker" required/>
                <label>Fecha de Nacimiento *</label>
                <span class="focus-border"></span>
            </div>

            <div class="inputCon input-effect">
                <input type="text" name="telefono" placeholder="" class="textIn" />
                <label>Telefono</label>
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
                <a class="btn" id="btnRegistro">Regístrarse</a>
                <span>¿Ya tienes cuenta?
                    <a href="${pageContext.servletContext.contextPath}/content/login.jsp">Inicia sesión</a>
                </span>
            </div>

        </form>
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