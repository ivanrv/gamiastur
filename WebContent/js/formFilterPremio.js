
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
                $("#mensajeError").append("<p>El nombre del premio es demasiado largo.</p>");
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

        if ($("input[name=activacion]").val() == "") {
            $("#mensajeError").append("<p>La fecha de inicio es un dato obligatorio.</p>");
            $("input[name=activacion]").addClass("has-warning");

            submit = false;
        } else {
            /* Comprobación fecha de activacion < hoy */

            var fInicio = $("input[name=activacion]").val().split("-");

            if (new Date(fInicio[2], fInicio[1] - 1, fInicio[0]) > new Date()) {
                $("#mensajeError").append("<p>La fecha de activaci&oacute;n no puede ser posterior a hoy.</p>");
                $("input[name=activacion]").addClass("has-warning");

                submit = false;
            }
        }

        if ($("textarea[name=descripcion]").val() == "") {
            $("#mensajeError").append("<p>La descripci&oacute;n es un dato obligatorio.</p>");
            $("textarea[name=descripcion]").addClass("has-warning");

            submit = false;
        } else {
            if ($("textarea[name=descripcion]").val().length > 200) {
                $("#mensajeError").append("<p>El texto correspondiente a la descripci&oacute;n es demasiado largo.</p>");
                $("textarea[name=descripcion]").addClass("has-warning");

                submit = false;
            }
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
        if(!(!$("input[name=archivo]").get(0).files) || ($("input[name=archivo]").get(0).files.length == 0)){
	        if ($("input[name=archivo]").get(0).files[0].size > 5242880){
	            $("#mensajeError").append("<p>La imagen seleccionada es demasiado grande.</p>");
	
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