var selectores, selectoresNav, anterior;

$(document).ready(function () {
    selectoresLanding = $(".selAdmin");
    for (let index = 0; index < selectoresLanding.length; index++) {
        const element = selectoresLanding[index];
        element.addEventListener("click", function () { first(this.getAttribute("value")); }, false);
    }

    selectoresNav = $(".selAdminNav");
    for (let index = 0; index < selectoresNav.length; index++) {
        const element = selectoresNav[index];
        element.addEventListener("click", function () { select(this.getAttribute("value")); }, false);
    }

    $("#buscador").on("keyup", function () {
        var value = $(this).val().toLowerCase();

        $("#" + anterior).find(".lineaFiltro").filter(function () {
            $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
        });
    });

    $(".itiParadas").click(function () {
        $("#modalParadasTitle").text("");

        var paradas = $(this).attr("value");

        for (let index = 0; index < paradas.length; index++) {
            const element = paradas[index];
            $("#modalParadasTable").append("<tr>"
                + "<td>" + element.nombre + "</td>"
                + "<td>" + element.ubicacion + "</td>"
                + "<td class='btnTabla'><form action='Mostrar.do' method='post'><input type='hidden' name='tipo' value='parada'><input type='hidden' name='parada' value='" + element.nombre + "'><button name='submit' value='submit' class='editar'><i class='fas fa-pencil-alt'></i>&nbsp;<span>Editar</span></button></form></td>"
                +"<td class='btnTabla'><form action='Eliminar.do' method='post'><input type='hidden' name='tipo' value='parada'><input type='hidden' name='parada' value='" + element.nombre + "'><button name='submit' value='submit' class='eliminar'><i class='fas fa-times'></i>&nbsp;<span>Eliminar</span></button></form></td>"
                + "</tr>");
        }
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