
var iti = false;

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

$(document).ready(function(){

	$("#menuIti li").click(function(){

		iti = true;

		var form = document.createElement("form");
	    var element1 = document.createElement("input"); 

	    form.method = "POST";
	    form.action = "/gamiastur/content/itinerario.jsp";
	    
	    element1.name="iti";
	    element1.value= $(this).attr("value");
	    form.appendChild(element1);
	    
	    document.body.appendChild(form);
	    
	    form.submit();
	});
});

function  redirectIti(){
	setTimeout(function(){
		if (iti == false)
			location.href=("/content/itinerarios.jsp");
	}, 800);
	
}