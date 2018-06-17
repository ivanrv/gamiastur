var contenedores, inputs;

$(document).ready(function() {

	/* Control de elementos datepicker */

	$(function() {
		$(".datepicker").datepicker({
			dateFormat: "dd-mm-yy",
			firstDay: 1,
			nextText: "Siguiente &raquo;",
			prevText: "&laquo; Anterior",
			monthNames: [ "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octrubre", "Noviembre", "Diciembre" ],
			dayNamesMin: [ "D", "L", "M", "X", "J", "V", "S" ],
			onSelect : function() {
				$(this).addClass("has-content");
			}
		})
	});

	contenedores = $(".inputCon");

	for (let index = 0; index < contenedores.length; index++) {
		const element = contenedores[index];
		element.value = "";
	}

	inputs = $(".textIn");

	for (let index = 0; index < inputs.length; index++) {
		const element = inputs[index];
		element.addEventListener("focusout", function() {

			if ($(this).hasClass("datepicker") === false) {
				if (this.value != "") {
					this.className = "textIn has-content";
				} else {
					this.className = "textIn"
				}
			} else {
				if (this.value == "") {
					this.className = "textIn datepicker hasDatepicker";
				}
			}

		}, false);
	}
});

function readURL(input){
    if(input.files && input.files[0]){
        var reader = new FileReader();

        reader.onload = function(e){
			if(input.files[0].name.endsWith(".mp4")){
				var fileUrl = window.URL.createObjectURL(input.files[0]);
				$("#showFileVid").attr("src", fileUrl);
				$("#showFileVid").parent()[0].load();
			}else{
				$("#showFile").attr("src", e.target.result).css("min-height", "400px").css("width", "100%");
			}
        }

        reader.readAsDataURL(input.files[0]);
    }
}