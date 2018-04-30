
$(document).ready(function () {
    if (error == "email") {
        $("#mensajeError").text("El email introducido no es correcto.");
        $("input[name=email]").addClass("has-warning has-content");
        $("input[name=email]").click(function () {
            $(this).select();
            $(this).unbind();
        });
        $("#modalError").modal();
    }

    if (error == "pass") {
        $("#mensajeError").text("La contraseña introducida no es correcta.");
        $("input[name=password]").addClass("has-warining");
        $("input[name=password]").click(function () {
            $(this).select();
            $(this).unbind();
        });
        $("#modalError").modal();
    }
});
