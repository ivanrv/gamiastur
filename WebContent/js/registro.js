
$(document).ready(function(){
    $("#btnRegistro").click(function(){
        event.preventDefault();

        var submit = true;

        if($("input[name=email]").val() != $("input[name=emailR]").val()){
            $("input[name=email]").val("Los correos no coinciden.");
            $("input[name=email]").css("color", "red").css("font-size", "0.7em");

            $("input[name=email]").click(function(){
                $("input[name=email]").css("color", "inherit").css("font-size", "inherit");
                $("input[name=email]").select();
            });

            $("input[name=emailR]").val("Los correos no coinciden.");
            $("input[name=emailR]").css("color", "red").css("font-size", "0.7em");

            $("input[name=emailR]").click(function(){
                $("input[name=emailR]").css("color", "inherit").css("font-size", "inherit");
                $("input[name=emailR]").select();
            });

            submit = false;
        }

        if($("input[name=password]").val() != $("input[name=passwordR]").val()){
            
            $("input[name=password]").val("Las contraseñas no coinciden.");
            $("input[name=password]").css("color", "red").css("font-size", "0.7em");

            $("input[name=password]").click(function(){
                $("input[name=password]").css("color", "inherit").css("font-size", "inherit");
                $("input[name=password]").select();
            });

            $("input[name=passwordR]").val("Las contraseñas no coinciden.");
            $("input[name=passwordR]").css("color", "red").css("font-size", "0.7em");

            $("input[name=passwordR]").click(function(){
                $("input[name=passwordR]").css("color", "inherit").css("font-size", "inherit");
                $("input[name=passwordR]").select();
            });


            submit = false;
        }

        /*
        if( COMPROBAR EMAIL NO EXISTE EN BD  ){
            submit = false;
        }*/

        if(submit){
            $("#regForm").submit();
           //alert("submit");
        }
    });
});