$(document).ready(function () {
  initMap();
});

//Esta es la variable donde tienes latlng para pasar como valor
var datosexp, marker;

initMap = function () {

  if ($("input[name=lat]").val() != "") {
    var centro = new google.maps.LatLng(parseFloat($("input[name=lat]").val()), parseFloat($("input[name=lng]").val()));
    var pintaMarker = true;
  } else {
    var centro = { lat: 43.53159289636665, lng: -5.664955771037398 };
    var pintaMarker = false;
  }

  var map = new google.maps.Map(document.getElementById('mapForm'), {
    zoom: 11,
    center: centro,
    disableDoubleClickZoom: true
  });

  if(pintaMarker){
    marker = new google.maps.Marker({
      position: centro,
      map: map
    });
  }

  // Aqui llamas a la funcion para poner el marcador
  google.maps.event.addListener(map, 'click', function (event) {
    addMarker(event.latLng, map);
    datosexp = event.latLng.toString().split(" ");

    $("input[name=lat]").val(datosexp[0].substring(1, datosexp[0].length - 2));
    $("input[name=lng]").val(datosexp[1].substring(0, datosexp[1].length - 2));
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