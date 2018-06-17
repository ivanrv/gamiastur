
var paradas, paradaActual;

$(document).ready(function () {
	paradas = JSON.parse(stringParadas);
	
	initMap();

	showParada(1);

	$(".btnParada").click(function(){
		showParada($(this).find("input[type=hidden]").attr("value"));
	});
	
});


function showParada(numParada){
	for (let index = 0; index < paradas.length; index++) {
		const parada = paradas[index];

		if (parada.numeroParada == numParada){
			paradaActual = parada;

			$("#paradaNombre").text(parada.nombre);
			$("#paradaNumero").text("Parada " + parada.numeroParada);
			
			if(parada.historia == "")
				$("#paradaHistoria").text("No tenemos datos históricos de esta parada");
			else
				$("#paradaHistoria").text(parada.historia);

			if(parada.anecdotario == "")
				$("#paradaAnecdotario").text("No tenemos datos anecdóticos de esta parada");
			else
				$("#paradaAnecdotario").text(parada.anecdotario);

			if(parada.gastronomia == "")
				$("#paradaGastronomia").text("No tenemos datos gastronómicos de esta parada");
			else
				$("#paradaGastronomia").text(parada.gastronomia);

			$("#imgContainer").attr("src", "static" + parada.imagen);
			initMapaParada(parada.latitud, parada.longitud);

			if(typeof $("#titCulturales").val() != "undefined"){	
				if(parada.pruebasCulturales.length > 0){		
					showCultural(0);
					$("#butCulturales").attr("href", "#modalCulturales");
					$("#butCulturales").removeClass("btnPruebasDisabled");
					$("#btnCulturales").removeClass("btnPruebasDisabled");
				}else{
					$("#butCulturales").attr("href", "");
					$("#butCulturales").addClass("btnPruebasDisabled");
					$("#btnCulturales").addClass("btnPruebasDisabled");
				}

				if(parada.pruebasDeportivas.length > 0){
					showDeportiva(0);
					$("#butDeportivas").attr("href", "#modalDeportivas");
					$("#butDeportivas").removeClass("btnPruebasDisabled");
					$("#btnDeportivas").removeClass("btnPruebasDisabled");
				}else{
					$("#butDeportivas").attr("href", "");	
					$("#butDeportivas").addClass("btnPruebasDisabled");	
					$("#btnDeportivas").addClass("btnPruebasDisabled");			
				}		
			}

			if (parada.numeroParada == 1){
				$("#btnParadaBack").css("visibility", "hidden");
				$("#btnParadaNext").css("visibility", "visible");

				$("#btnParadaNext").find("input[type=hidden]").attr("value", parseInt(parada.numeroParada) + 1);
			}else if (parada.numeroParada == paradas.length){
				$("#btnParadaBack").css("visibility", "visible");
				$("#btnParadaNext").css("visibility", "hidden");

				$("#btnParadaBack").find("input[type=hidden]").attr("value", parseInt(parada.numeroParada) - 1);
			}else{
				$("#btnParadaBack").css("visibility", "visible");
				$("#btnParadaNext").css("visibility", "visible");
			
				$("#btnParadaNext").find("input[type=hidden]").attr("value", parseInt(parada.numeroParada) + 1);
				$("#btnParadaBack").find("input[type=hidden]").attr("value", parseInt(parada.numeroParada) - 1);
			}
		}
	}
	
}

function showCultural(contador){
	$("#titCulturales").text(paradaActual.pruebasCulturales[contador].nombre);
	$("#respuestasContainer").html('<div class="row"><div class="col-xs-12 text-center"><h3 class="h3" id="preguntaCultural">' + paradaActual.pruebasCulturales[contador].pregunta + '</h3></div></div>');

	var respuestas = [paradaActual.pruebasCulturales[contador].respuesta, paradaActual.pruebasCulturales[contador].fallo1];

	if (paradaActual.pruebasCulturales[contador].fallo2 != "")
		respuestas.push(paradaActual.pruebasCulturales[contador].fallo2);

	if (paradaActual.pruebasCulturales[contador].fallo3 != "")
		respuestas.push(paradaActual.pruebasCulturales[contador].fallo3);

	respuestas.sort(function(a, b){return 0.5 - Math.random()});

	for (let culIndex = 0; culIndex < respuestas.length; culIndex++) {
		const resp = respuestas[culIndex];
		
		$("#respuestasContainer").html($("#respuestasContainer").html() + '<div class="row"><div class="col-xs-1"></div><div class="col-xs-10 text-center respuesta">'+ resp +'</div></div>');
	}

	$(".respuesta").click(function(){
		if($(this).text() == paradaActual.pruebasCulturales[contador].respuesta)
			$(this).addClass("respuestaBien");
		else{
			$(this).addClass("respuestaMal");

			$(".respuesta:contains('" + paradaActual.pruebasCulturales[contador].respuesta + "')").addClass("respuestaBien");
		}

		$(".respuesta").addClass("respuestaDisabled");
	});

	if (contador == 0){
		$("#culturalesCambio").html('<div class="col-xs-8"></div> <div class="col-xs-3 text-center btnCambioCultural" id="btnCulturalNext">Siguiente &nbsp; &rarr;</div><div class="col-xs-1"></div>');

		$("#btnCulturalNext").click(function(){
			showCultural(contador+1);
		});
	}else if(contador == paradaActual.pruebasCulturales.length-1){
		$("#culturalesCambio").html('<div class="col-xs-1"></div><div class="col-xs-3 text-center btnCambioCultural" id="btnCulturalPrev">&larr; &nbsp; Anterior</div>');
		
		$("#btnCulturalPrev").click(function(){
			showCultural(contador-1);
		});
	}else{
		$("#culturalesCambio").html('<div class="col-xs-1"></div><div class="col-xs-3 text-center btnCambioCultural" id="btnCulturalPrev">&larr; &nbsp; Anterior</div><div class="col-xs-4"></div><div class="col-xs-3 text-center btnCambioCultural" id="btnCulturalNext">Siguiente &nbsp; &rarr;</div><div class="col-xs-1"></div>');
		
		$("#btnCulturalPrev").click(function(){
			showCultural(contador-1);
		});

		$("#btnCulturalNext").click(function(){
			showCultural(contador+1);
		});
	}
}

function showDeportiva(contador){
	$("#titDeportivas").text(paradaActual.pruebasDeportivas[contador].nombre);
	$("#puntosDeportiva").text(paradaActual.pruebasDeportivas[contador].puntos + " puntos");
	$("#modalPDFDoc").attr("src", paradaActual.pruebasDeportivas[contador].explicacion);
	$("#fechaDeportiva").text(paradaActual.pruebasDeportivas[contador].fechainicio);

	if (contador == 0){
		$("#deportivasCambio").html('<div class="col-xs-8"></div> <div class="col-xs-3 text-center btnCambioCultural" id="btnDepNext">Siguiente &nbsp; &rarr;</div><div class="col-xs-1"></div>');

		$("#btnDepNext").click(function(){
			showDeportiva(contador+1);
		});
	}else if(contador == paradaActual.pruebasCulturales.length-1){
		$("#deportivasCambio").html('<div class="col-xs-1"></div><div class="col-xs-3 text-center btnCambioCultural" id="btnDepPrev">&larr; &nbsp; Anterior</div>');
		
		$("#btnDepPrev").click(function(){
			showDeportiva(contador-1);
		});
	}else{
		$("#deportivasCambio").html('<div class="col-xs-1"></div><div class="col-xs-3 text-center btnCambioCultural" id="btnDepPrev">&larr; &nbsp; Anterior</div><div class="col-xs-4"></div><div class="col-xs-3 text-center btnCambioCultural" id="btnDepNext">Siguiente &nbsp; &rarr;</div><div class="col-xs-1"></div>');
		
		$("#btnDepPrev").click(function(){
			showDeportiva(contador-1);
		});

		$("#btnDepNext").click(function(){
			showDeportiva(contador+1);
		});
	}
}

function initMapaParada(lat, lng){
	
	var center = new google.maps.LatLng(parseFloat(lat), parseFloat(lng));

	var mapaParada = new google.maps.Map(document.getElementById("paradaMap"), {
		zoom: 17,
		center: center,
		disableDoubleCLickZoom: true,
		draggable: false,
		zoomControl: false,
		scrollwheel: false,
		fullscreenControl: false
	});

	new google.maps.Marker({
		position: center,
		map: mapaParada
	});

}

initMap = function () {
	
	var origin, destination, waypoints;
	waypoints = [];

	var mapa = new google.maps.Map(document.getElementById('mapaIti'),{
		zoom: 15,
		center: new google.maps.LatLng(parseFloat(paradas[0].latitud), parseFloat(paradas[0].longitud))
	});
	
	var directionsService = new google.maps.DirectionsService;
	var directionsDisplay = new google.maps.DirectionsRenderer({
		draggable: false,
		map: mapa,
		suppressMarkers: true,
		preserveViewport: true
	});
	
	for (let index = 0; index < paradas.length; index++) {
		const element = paradas[index];
		
		if (index == 0)
			origin = new google.maps.LatLng(parseFloat(element.latitud), parseFloat(element.longitud));
		else{
			if (index == paradas.length -1)
				destination = new google.maps.LatLng(parseFloat(element.latitud), parseFloat(element.longitud));
			else
				waypoints.push({
					location: new google.maps.LatLng(parseFloat(element.latitud), parseFloat(element.longitud))
				});
		}
		
		new google.maps.Marker({
			position: new google.maps.LatLng(parseFloat(element.latitud), parseFloat(element.longitud)),
			map: mapa
		});
	}
	
	displayRoute(origin, destination, waypoints, directionsService, directionsDisplay)
}

function displayRoute(origin, destination, waypoints, service, display){
	service.route({
		origin: origin,
		destination: destination,
		waypoints: waypoints,
		travelMode: "WALKING"
	},
	function(response, status){
		if(status == "OK")
			display.setDirections(response);
		else
			alert("No se han podido mostrar las indicaciones: " + status);
	});
}