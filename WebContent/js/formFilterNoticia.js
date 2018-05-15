
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
                $("#mensajeError").append("<p>El nombre de la noticia es demasiado largo.</p>");
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
        } else {
        	if ($("textarea[name=texto]").val().length > 200){
                $("#mensajeError").append("<p>El texto de la noticia es demasiado largo.</p>");
                $("textarea[name=texto]").addClass("has-warning");
                
                submit = false;
            }
        }

        if((!$("input[name=archivo]").get(0).files) || ($("input[name=archivo]").get(0).files.length == 0)){
            $("#mensajeError").append("<p>Es obligatorio a&ntilde;adir una imagen.</p>")

            submit = false;
        }else{
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