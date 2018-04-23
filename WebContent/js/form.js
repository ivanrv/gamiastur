var contenedores, inputs;

$(document).ready(function () {

    /* Control de elementos datepicker */

    $(function () {
        $(".datepicker").datepicker({
            onSelect: function(){
                $(this).addClass("has-content");
            }
        })
    });

    contenedores = $(".inputCon");

    for (let index = 0; index < contenedores.length; index++) {
        const element = contenedores[index];
        element.val("");
    }

    inputs = $(".textIn");

    for (let index = 0; index < inputs.length; index++) {
        const element = inputs[index];
        element.on("focusout", function () {
            if ($(this).hasClass("datepicker") === false) {
                if ($(this).val() != "") {
                    $(this).className = "textIn has-content";
                } else {
                    $(this).className = "textIn"
                }
            }else{
                if($(this).value == ""){
                    $(this).className = "textIn datepicker hasDatepicker";
                }
            }
        });
    }
});