
$(document).ready(function () {


    $("#enviar").click(function () {
        event.preventDefault();
        var submit = true;
        $("#mensajeError").html("");

        /* Comprobación de campos obligatorios no vacíos */

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

        if ($("input[name=ubicacion]").val() == "") {
            $("#mensajeError").append("<p>La ubicaci&oacute;n es un dato obligatorio.</p>");
            $("input[name=ubicacion]").addClass("has-warning");

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