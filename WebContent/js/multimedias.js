
$(document).ready(function(){
    
    $(".btnVoto").click(function(){
       loading();

       $.ajax({
            type: "POST",
            url: "Nuevo.do",
            data: $("#sbmtVoto" + $(this).attr("value")).serialize(),
            complete: function(){
                location.reload();
            }
       });
    });

    $(".submitComentario").click(function(){
        loading();

        $.ajax({
            type: "POST",
            url: "Nuevo.do",
            data: $("#sbmtComentario" + $(this).attr("value")).serialize(),
            complete: function(){
                location.reload();
            }
        });
    });
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