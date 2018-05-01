
$(window).on("load", function(){

    setTimeout(function(){
        $("#loader").fadeOut(700);
    },800);

    $(".menuUserB").click(loading);
    $("#login").click(loading);
    $("#signin").click(loading);
});

function loading(){
    $("#loader").fadeIn(300);
}
