
$(document).ready(function () {


    $("#enviar").click(function () {
        event.preventDefault();
        var submit = true;
        $("#mensajeError").html("");

        /* Comprobación de campos obligatorios no vacíos */

        if ($("input[name=pregunta]").val() == "") {
            $("#mensajeError").append("<p>La pregunta es un dato obligatorio.</p>");
            $("input[name=pregunta]").addClass("has-warning");

            submit = false;
        }

        if ($("input[name=respuesta]").val() == "") {
            $("#mensajeError").append("<p>La respuesta es un dato obligatorio.</p>");
            $("input[name=respuesta]").addClass("has-warning");

            submit = false;
        }

        if ($("input[name=puntos]").val() == "") {
            $("#mensajeError").append("<p>Los puntos son un dato obligatorio.</p>");
            $("input[name=puntos]").addClass("has-warning");

            submit = false;
        } else {
            if ($("input[name=puntos]").val() < 0) {
                $("#mensajeError").append("<p>Los puntos no pueden ser inferiores a 0.</p>");
                $("input[name=puntos]").addClass("has-warning");

                submit = false;
            }
        }

        $(".has-warning").click(function () {
            $(this).select();
            $(this).unbind();
        });

        if (submit) {
            loading();
            $("form").submit();
        } else {
            $("#modalError").modal();
        }
    });
});