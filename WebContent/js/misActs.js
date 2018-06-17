$(".procModalMaps").click(function(){
    var centro = new google.maps.LatLng(parseFloat($(this).attr("value").split(" ")[0]), parseFloat($(this).attr("value").split(" ")[1]));

    var map = new google.maps.Map(document.getElementById("mapTabla"), {
        zoom: 13,
        center: centro,
        disableDefaultUI: true,
        disableDoubleClickZoom: true
    });

    var marker = new google.maps.Marker({
        position: centro,
        map: map
    });
});