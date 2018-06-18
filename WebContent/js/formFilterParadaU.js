
$(document).ready(function () {

    $("#enviar").click(function () {
        event.preventDefault();
        var submit = true;
        var checkNParada = true;
        $("#mensajeError").html("");

        /* Comprobación de campos obligatorios no vacíos */

        if ($("select[name=itinerario]").find(":selected").text() == "") {
            $("#mensajeError").append("<p>El itinerario es un dato obligatorio.</p>");
            $("select[name=itinerario]").addClass("has-warning");

            submit = false;
            checkNParada = false;
        }

        if ($("input[name=lat]").val() == "") {
            $("#mensajeError").append("<p>La ubicaci&oacute;n es un dato obligatorio.</p>");
            $("input[name=ubicacion]").addClass("has-warning");

            submit = false;
        }

        if ($("input[name=nParada]").val() == "") {
            $("#mensajeError").append("<p>El n&uacute;mero de parada es un dato obligatorio.</p>");
            $("input[name=nParada]").addClass("has-warning");

            submit = false;
            checkNParada = false;
        } else {
            if ($("input[name=nParada]").val() < 0) {
                $("#mensajeError").append("<p>El n&uacute;mero de parada no puede ser inferior a 0.</p>");
                $("input[name=nParada]").addClass("has-warning");

                submit = false;
                checkNParada = false;
            }
        }

        /*
        if ($("textarea[name=historia]").val().length > 200){
            $("#mensajeError").append("<p>El texto correspondiente a la historia es demasiado largo.</p>");
            $("textarea[name=historia]").addClass("has-warning");
            
            submit = false;
        }

        if ($("textarea[name=anecdotario]").val().length > 200){
            $("#mensajeError").append("<p>El texto correspondiente al anecdotario es demasiado largo.</p>");
            $("textarea[name=anecdotario]").addClass("has-warning");
            
            submit = false;
        }

        if ($("textarea[name=gastronomia]").val().length > 200){
            $("#mensajeError").append("<p>El texto correspondiente a la gastronom&iacute;a es demasiado largo.</p>");
            $("textarea[name=gastronomia]").addClass("has-warning");
            
            submit = false;
        }
        */
        if(typeof $("input[name=archivoImg]").get(0).files[0] != "undefined"){
	        if ($("input[name=archivoImg]").get(0).files[0].size > 5242880){
	            $("#mensajeError").append("<p>La imagen seleccionada es demasiado grande.</p>");
	
	            submit = false;
	        }
        }

        if(typeof $("input[name=archivoVideo]").get(0).files[0] != "undefined"){
	        if ($("input[name=archivoVideo]").get(0).files[0].size > 15728640){
	            $("#mensajeError").append("<p>El v&iacute;deo seleccionado es demasiado grande.</p>");
	
	            submit = false;
	        }
        }

        if(checkNParada){
            var arrayIti = JSON.parse(stringItinerarios);

            arrayIti.forEach(element => {
                if($("select[name=itinerario]").find(":selected").text() == element.nombre){
                    element.paradas.forEach(npar => {
                        if(($("input[name=nParada]").val() == npar) && npar != nParOriginal ){
                            $("#mensajeError").append("<p>El n&uacute;mero de parada ya existe en el itinerario seleccionado.</p>");
                            $("input[name=nParada]").addClass("has-warning");
            
                            submit = false;
                        }
                    });
                }
            });
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