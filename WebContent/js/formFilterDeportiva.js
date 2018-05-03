
$(document).ready(function () {

    if (typeof nombres != undefined) {
        var nombresArray = nombres.substring(1, nombres.length - 1).split(", ");
    }

    $("#enviar").click(function () {
        event.preventDefault();
        var submit = true;
        $("#mensajeError").html("");

        /* Comprobación de campos obligatorios no vacíos */

        if ($("input[name=nombre]").val() == "") {
            $("#mensajeError").append("<p>El nombre es un dato obligatorio.</p>");
            $("input[name=nombre]").addClass("has-warning");

            submit = false;
        } else {
            /* Comprobación de nombre no existente */

            var contains = false;
            nombresArray.forEach(element => {
                if (element == $("input[name=nombre]").val())
                    contains = true;
            });

            if (contains) {
                $("#mensajeError").append("<p>El nombre introducido no est&#225; disponible.</p>");
                $("input[name=nombre]").addClass("has-warning");

                submit = false;
            }
        }

        if ($("input[name=inicio]").val() == "") {
            $("#mensajeError").append("<p>La fecha de inicio es un dato obligatorio.</p>");
            $("input[name=inicio]").addClass("has-warning");

            submit = false;
        } else {
            /* Comprobación fecha de inicio > hoy */

            var fInicio = $("input[name=inicio]").val().split("-");

            if (new Date(fInicio[2], fInicio[1] - 1, fInicio[0]) < new Date()) {
                $("#mensajeError").append("<p>La fecha de inicio no puede ser anterior a hoy.</p>");
                $("input[name=inicio]").addClass("has-warning");

                submit = false;
            } else {
                if ($("input[name=fin]").val() != "") {
                    var fFin = $("input[name=fin]").val().split("-");

                    if (new Date(fFin[2], fFin[1] - 1, fFin[0]) < new Date(fInicio[2], fInicio[1] - 1, fInicio[0])) {
                        $("#mensajeError").append("<p>La fecha de fin no puede ser anterior a la de inicio.</p>");
                        $("input[name=inicio]").addClass("has-warning");
                        $("input[name=fin]").addClass("has-warning");

                        submit = false;
                    }
                }
            }
        }

        if ($("select[name=parada]").find(":selected").text() == "") {
            $("#mensajeError").append("<p>La parada es un dato obligatorio.</p>");
            $("select[name=parada]").addClass("has-warning");

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
        });

        if (submit) {
            loading();
            $("form").submit();
        } else {
            $("#modalError").modal();
        }
    });
});