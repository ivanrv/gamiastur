
$(document).ready(function(){
    
    $(".btnVoto").click(function(){
        var counter = parseInt($("#pts" + $(this).attr("value")).text());
        $("#pts" + $(this).attr("value")).text(counter + 1);
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