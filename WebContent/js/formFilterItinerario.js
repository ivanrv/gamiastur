
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