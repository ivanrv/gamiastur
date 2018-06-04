
$(document).ready(function(){
	
	var cambioPass = false;
	
	if (typeof emails != undefined)
		var emailsArray = emails.substring(1, emails.length -1).split(", ");
	
	$("#checkPassDelete").click(function(){
		if($("#passConfirmar").val() == lul)
			$("#formBorrar").submit();
	});
	
	$("#btnCambioPass").click(function(){
		$("#mensajeError").html("");
		
		if($("#passActual").val() == lul){
			if($("input[name=password]").val() == ""){
				$("#mensajeError").append("<p>Es necesario introducir una nueva contrase&ntilde;a</p>");
				$("input[name=password]").addClass("has-warning");
			}else{
				if($("input[name=passwordR]").val() == ""){
					$("#mensajeError").append("<p>Por favor, repita la contrase&ntilde;a introducida</p>");
					$("input[name=passwordR]").addClass("has-warning");
				}else{
					if(!$("input[name=password]").val() != $("input[name=passwordR]").val()){
						$("#mensajeError").append("<p>Las contrase&ntilde;as no coinciden</p>");
						$("input[name=password]").addClass("has-warning");
						$("input[name=passwordR]").addClass("has-warning");
					}else{
						cambioPass = true;
					}			
				}
			}
		}else{
			$("#mensajeError").append("<p>La contrase&ntilde;a actual es incorrecta</p>");
			$("#passActual").addClass("has-warning");
		}
		
		$(".has-warning").click(function () {
            $(this).select();
        });
		
		if (!cambioPass)
			$("#modalError").modal();
		else
			$("#modalPassword").modal("hide");
	});
	
	
	
	$("#guardarEditarPerfil").click(function(){
		var submit = true;
		$("#mensajeError").html("");
		
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
                }
            }
        }
        
        if ($("input[name=fechaNac]").val() == "") {
            $("#mensajeError").append("<p>La fecha de nacimiento es un dato obligatorio.</p>");
            $("input[name=fechaNac]").addClass("has-warning");

            submit = false;
        } else {
            /* Comprobación fecha de nacimiento < 2010 */

            var fInicio = $("input[name=fechaNac]").val().split("-");

            if (new Date(fInicio[2], fInicio[1] - 1, fInicio[0]) > new Date(2010, 0, 1)) {
                $("#mensajeError").append("<p>La fecha de nacimiento no puede ser posterior a 2010.</p>");
                $("input[name=fechaNac]").addClass("has-warning");

                submit = false;
            } 
        }
        
        $(".has-warning").click(function () {
            $(this).select();
        });

        if (submit) {
            loading();
            if(!cambioPass)
            	$("#modalPassword").find("input").attr("value") == "";
            $("#regForm").submit();
        } else {
            $("#modalError").modal();
        }   
	});
});

