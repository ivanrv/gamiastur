
$(document).ready(function () {

    var emailsArray = emails.substring(1, emails.length - 1).split(", ");

    $("#btnRegistro").click(function () {
        event.preventDefault();
        $("#mensajeError").html("");
        var submit = true;

        /* Comprobación de campos obligatorios no vacíos */
        if ($("input[name=nombre]").val() == "") {
            $("#mensajeError").append("<p>El nombre es un dato obligatorio.</p>");
            $("input[name=nombre]").addClass("has-warning");

            submit = false;
        }

        if ($("input[name=apellidos]").val() == "") {
            $("#mensajeError").append("<p>Los apellidos son un dato obligatorio.</p>")
            $("input[name=apellidos]").addClass("has-warning");

            submit = false;
        } else {
            /* Comprobación de apellidos */

            if (!(/\s/.test($("input[name=apellidos]").val()))) {
                $("#mensajeError").append("<p>Es necesario introducir dos apellidos.</p>")
                $("input[name=apellidos]").addClass("has-warning");

                submit = false;
            }
        }

        if ($("input[name=email]").val() == "") {
            $("#mensajeError").append("<p>El correo es un dato obligatorio.</p>")
            $("input[name=email]").addClass("has-warning");

            submit = false;
        } else {
            if (!validateEmail($("input[name=email]").val())) {
                $("#mensajeError").append("<p>El correo introducido no es un correo v&#225;lido.</p>")
                $("input[name=email]").addClass("has-warning");

                submit = false;
            } else {
                var contains = false;

                emailsArray.forEach(mail => {
                    if (mail == $("input[name=email]").val())
                        contains = true;
                });

                if (contains) {
                    $("#mensajeError").append("<p>El correo introducido no est&#225; disponible.</p>")
                    $("input[name=email]").addClass("has-warning");
                   
                    submit = false; 
                } else {

                    if ($("input[name=emailR]").val() == "") {
                        $("#mensajeError").append("<p>Por favor, repita el correo introducido.</p>")
                        $("input[name=emailR]").addClass("has-warning");

                        submit = false;
                    } else {
                        if ($("input[name=email]").val() != $("input[name=emailR]").val()) {
                            $("#mensajeError").append("<p>Los correos no coinciden</p>");
                            $("input[name=email]").addClass("has-warning");
                            $("input[name=emailR]").addClass("has-warning");

                            submit = false;
                        }
                    }
                }
            }
        }

        if ($("input[name=password]").val() == "") {
            $("#mensajeError").append("<p>La contrase&ntilde;a es un dato obligatorio.</p>")
            $("input[name=password]").addClass("has-warning");

            submit = false;
        } else {
            if ($("input[name=passwordR]").val() == "") {
                $("#mensajeError").append("<p>Por favor, repita la contrase&ntilde;a introducida.</p>")
                $("input[name=passwordR]").addClass("has-warning");

                submit = false;
            } else {
                if ($("input[name=password]").val() != $("input[name=passwordR]").val()) {
                    $("#mensajeError").append("<p>Las contrase&ntilde;as no coinciden</p>");
                    $("input[name=password]").addClass("has-warning");
                    $("input[name=passwordR]").addClass("has-warning");

                    submit = false;
                }
            }
        }

        if ($("input[name=fechaNac]").val() == "") {
            $("#mensajeError").append("<p>La fecha de nacimiento es un dato obligatorio.</p>");
            $("input[name=fechaNac]").addClass("has-warning");

            submit = false;
        }

        if (submit) {
            loading();
            $("#regForm").submit();
        } else {
            $("#modalError").modal();
        }

        
    });
});

function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}