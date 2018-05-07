$(document).ready(function () {
  initMap();
});

//Esta es la variable donde tienes latlng para pasar como valor
var datosexp, marker;

initMap = function () {
  var centro = { lat: 43.53159289636665, lng: -5.664955771037398 };
  var map = new google.maps.Map(document.getElementById('mapForm'), {
    zoom: 12,
    center: centro
  });

  // Aqui llamas a la funcion para poner el marcador
  google.maps.event.addListener(map, 'click', function (event) {
    addMarker(event.latLng, map);
    datosexp = event.latLng.toString().split(" ");

    $("input[name=lat]").val(datosexp[0].substring(1, datosexp[0].length-2));
    $("input[name=lng]").val(datosexp[1].substring(0, datosexp[1].length-2));
  });
}

function addMarker(location, map) {
  if (marker != undefined) {
    marker.setPosition(location);
  } else {
    marker = new google.maps.Marker({
      position: location,
      map: map
    });
  }
}