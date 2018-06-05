
var paradas;

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
			$("#paradaTit").css("background-image", "static" + parada.imagen);

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

			$("#paradaVid").attr("src", "static" + parada.video);
			initMapaParada(parada.latitud, parada.longitud);

			if(typeof $("#pruebasContainer") != undefined){
				//TODO PRUEBAS
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