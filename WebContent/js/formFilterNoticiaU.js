
$(document).ready(function () {

    $("#enviar").click(function () {
        event.preventDefault();
        var submit = true;
        $("#mensajeError").html("");

        /* Comprobación de campos obligatorios no vacíos */

        if ($("input[name=alta]").val() == "") {
            $("#mensajeError").append("<p>La fecha de alta es un dato obligatorio.</p>");
            $("input[name=alta]").addClass("has-warning");

            submit = false;
        } else {
            /* Comprobación fecha de inicio > hoy */

            var fInicio = $("input[name=alta]").val().split("-");

            if (new Date(fInicio[2], fInicio[1] - 1, fInicio[0]) < new Date()) {
                $("#mensajeError").append("<p>La fecha de alta no puede ser anterior a hoy.</p>");
                $("input[name=alta]").addClass("has-warning");

                submit = false;
            } else {
                if ($("input[name=caducidad]").val() != "") {
                    var fFin = $("input[name=caducidad]").val().split("-");

                    if (new Date(fFin[2], fFin[1] - 1, fFin[0]) < new Date(fInicio[2], fInicio[1] - 1, fInicio[0])) {
                        $("#mensajeError").append("<p>La fecha de caducidad no puede ser anterior a la de alta.</p>");
                        $("input[name=alta]").addClass("has-warning");
                        $("input[name=caducidad]").addClass("has-warning");

                        submit = false;
                    }
                }
            }
        }

        if ($("textarea[name=texto]").val() == "") {
            $("#mensajeError").append("<p>El texto de la noticia es un dato obligatorio.</p>");
            $("textarea[name=texto]").addClass("has-warning");

            submit = false;
        }else{
            if ($("textarea[name=texto]").val().length > 200){
                $("#mensajeError").append("<p>El texto de la noticia es demasiado largo.</p>");
                $("textarea[name=texto]").addClass("has-warning");

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