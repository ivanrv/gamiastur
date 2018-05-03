var selectores, selectoresNav, anterior;

$(document).ready(function () {	
    selectoresLanding = $(".selAdmin");
    for (let index = 0; index < selectoresLanding.length; index++) {
        const element = selectoresLanding[index];

        if(!element.classList.contains("selAdminDisabled"))
            element.addEventListener("click", function () { first(this.getAttribute("value")); }, false);
    }

    selectoresNav = $(".selAdminNav");
    for (let index = 0; index < selectoresNav.length; index++) {
        const element = selectoresNav[index];

        if(!element.classList.contains("selAdminNavDisabled"))
            element.addEventListener("click", function () { select(this.getAttribute("value")); }, false);
    }

    $("#buscador").on("keyup", function () {
        var value = $(this).val().toLowerCase();

        $("#" + anterior).find(".lineaFiltro").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });

    $(".itiParadas").click(function () {        
        $(".paradaRow").remove();
        
        var idClick = $(this).attr("value");
        
        $("#modalParadasTitle").text("Paradas del itinerario: " + idClick );
        
        var arrayParadas = JSON.parse(stringParadas);
        
        arrayParadas.forEach(element => {
            if(element.itinerario == idClick)
                $("#modalParadasTable").append('<tr class="paradaRow"><td>' + element.nombre + '</td><td>' + element.latitud + " " + element.longitud + '</td><td class="btnTabla"><form action="Mostrar.do" method="post"><input type="hidden" name="tipo" value="parada"><input type="hidden" name="parada" value="' + element.nombre + '"><button name="submit" value="submit" class="editar"><i class="fas fa-pencil-alt"></i>&nbsp;<span>Editar</span></button></form></td><td class="btnTabla"><form action="Eliminar.do" method="post"><input type="hidden" name="tipo" value="parada"><input type="hidden" name="parada" value="' + element.nombre + '"><a href="#modalEliminar" data-toggle="modal" class="eliminar"><i class="fas fa-times"></i>&nbsp;<span>Eliminar</span></a></form></td></tr>');
        });
        
        if($(".paradaRow").length == 0){
        	$("#modalParadasTable").append('<tr class="paradaRow"><td colspan="2">No existen paradas asociadas a este itinerario</td></tr>');
            $("#modalParadasTable").find(".theadHide").css("display", "none");
        }else{
            $("#modalParadasTable").find(".theadHide").css("display", "table-cell");
        }
    });

    $(".paradaPruebas").click(function(){
        $(".pruebaRow").remove();

        var paradaClick = $(this).attr("value");

        $("#modalPruebasTitle").text("Pruebas de la parada: " + paradaClick);

        var arrayCulturales = JSON.parse(stringCulturales);
        var arrayDeportivas = JSON.parse(stringDeportivas);

        arrayDeportivas.forEach(element => {
            if(element.parada == paradaClick)
                $("#modalPruebasDepTable").append('<tr class="pruebaRow pruebaRowDep"><td>' + element.nombre + '</td><td>' + element.fechainicio + '</td><td>' + element.explicacion + '</td><td>' + element.puntos + '</td><td class="btnTabla"><form action="Mostrar.do" method="post"><input type="hidden" name="tipo" value="deportiva"><input type="hidden" name="prueba" value="' + element.nombre + '"><button name="submit" value="submit" class="editar"><i class="fas fa-pencil-alt"></i>&nbsp;<span>Editar</span></button></form></td><td class="btnTabla"><form action="Eliminar.do" method="post"><input type="hidden" name="tipo" value="deportiva"><input type="hidden" name="prueba" value="' + element.nombre + '"><a href="#modalEliminar" data-toggle="modal" class="eliminar"><i class="fas fa-times"></i>&nbsp;<span>Eliminar</span></a></form></td></tr>');
        });
        
        if($(".pruebaRowDep").length == 0){
            $("#modalPruebasDepTable").append('<tr class="pruebaRow"><td colspan="4">No existen pruebas deportivas asociadas a esta parada</td></tr>');
            $("#modalPruebasDepTable").find(".theadHide").css("display", "none");
        }else{
            $("#modalPruebasDepTable").find(".theadHide").css("display", "table-cell");
        }


        arrayCulturales.forEach(element => {
            if(element.parada == paradaClick)
                $("#modalPruebasCulTable").append('<tr class="pruebaRow pruebaRowCul"><td>' + element.nombre + '</td><td>' + element.puntos + '</td><td class="btnTabla"><form action="Mostrar.do" method="post"><input type="hidden" name="tipo" value="cultural"><input type="hidden" name="prueba" value="' + element.nombre + '"><button name="submit" value="submit" class="editar"><i class="fas fa-pencil-alt"></i>&nbsp;<span>Editar</span></button></form></td><td class="btnTabla"><form action="Eliminar.do" method="post"><input type="hidden" name="tipo" value="cultural"><input type="hidden" name="prueba" value="' + element.nombre + '"><a href="#modalEliminar" data-toggle="modal" class="eliminar"><i class="fas fa-times"></i>&nbsp;<span>Eliminar</span></a></form></td></tr>');
        });
        
        if($(".pruebaRowCul").length == 0){
        	$("#modalPruebasCulTable").append('<tr class="pruebaRow"><td colspan="2">No existen pruebas culturales asociadas a esta parada</td></tr>');
            $("#modalPruebasCulTable").find(".theadHide").css("display", "none");
        }else{
            $("#modalPruebasCulTable").find(".theadHide").css("display", "table-cell");
        }
    });

    $(".eliminar").click(function(){        
    	var form = $(this).parent();
    	
        $("#btnEliminarModal").click(function(){
        	$(this).unbind();
        	loading();
        	form.submit();
        });  
    });
});

function first(selector) {
    $(".navAdmin").css("display", "flex");
    $(".landing").css("display", "none");
    $("#" + selector).css("display", "block");

    var titulos = 0;
    $("#" + selector).find("table th").each(function () {
        $(this).click(function () {
            sortTable(titulos);
            titulos++;
        });
    });

    anterior = selector;
}

function select(selector) {
    $("#" + anterior).css("display", "none");
    $("#" + selector).css("display", "block");

    var titulos = 0;
    $("#" + selector).find("table th").each(function () {
        $(this).click(function () {
            sortTable(titulos);
            titulos++;
        });
    });

    anterior = selector;
}

function sortTable(n) {
    var tabla, filas, switching, i, x, y, shouldSwitch, dir, switchcount = 0;

    tabla = $("#" + anterior);
    switching = true;
    dir = "asc";

    while (switching) {
        switching = false;
        filas = tabla.find("tr");

        for (i = 1; i < (filas.length - 1); i++) {
            shouldSwitch = false;

            x = filas[i].getElementsByTagName("TD")[n];
            y = filas[i + 1].getElementsByTagName("TD")[n];

            if (dir == "asc") {
                if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                    shouldSwitch = true;
                    break;
                }
            } else if (dir == "desc") {
                if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                    shouldSwitch = true;
                    break;
                }
            }
        }

        if (shouldSwitch) {
            filas[i].parentNode.insertBefore(filas[i + 1], filas[i]);
            switching = true;
            switchcount++;
        } else {
            if (switchcount == 0 && dir == "asc") {
                dir = "desc";
                switching = true;
            }
        }
    }
}
