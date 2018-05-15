
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
                $("#mensajeError").append("<p>El nombre del itinerario es demasiado largo.</p>");
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

        if ($("input[name=categoria]").val() == "") {
            $("#mensajeError").append("<p>La categor&iacute;a es un dato obligatorio.</p>");
            $("input[name=categoria]").addClass("has-warning");

            submit = false;
        } 

        if ($("input[name=duracion]").val() == "") {
            $("#mensajeError").append("<p>La duraci&oacute;n es un dato obligatorio.</p>");
            $("input[name=duracion]").addClass("has-warning");

            submit = false;
        } 

        if ($("input[name=lat]").val() == "") {
            $("#mensajeError").append("<p>La ubicaci&oacute;n es un dato obligatorio.</p>");

            submit = false;
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