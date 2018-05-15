
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
        	
        	if ($("input[name=nombre]").val().length > 60){
                $("#mensajeError").append("<p>El nombre de la prueba es demasiado largo.</p>");
                $("textarea[name=texto]").addClass("has-warning");
                
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
        }

        if ($("select[name=parada]").find(":selected").text() == "") {
            $("#mensajeError").append("<p>La parada es un dato obligatorio.</p>");
            $("select[name=parada]").addClass("has-warning");

            submit = false;
        }

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
        });

        if (submit) {
            loading();
            $("form").submit();
        } else {
            $("#modalError").modal();
        }
    });
});