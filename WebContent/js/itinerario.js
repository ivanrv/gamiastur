
$(document).ready(function () {
	var paradas = JSON.parse(stringParadas);
	
	initMap();
  
});

initMap = function () {
	
	var origin, destination, waypoints;
	waypoints = [];

	var mapa = new google.maps.Map(document.getElementById('mapaIti'),{
		zoom: 13,
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