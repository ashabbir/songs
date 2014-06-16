function successlogin(){
	var textfield = $("input[name=username]");
	$("#output").addClass("alert alert-success animated fadeInUp").html("Welcome back " + "<span style='text-transform:uppercase'>" + textfield.val() + "</span>");
	$("#output").removeClass(' alert-danger');
	$("input").css({
		"height":"0",
		"padding":"0",
		"margin":"0",
		"opacity":"0"
	});
	//change button text 
	/*
	$('button[type="submit"]').html("continue")
	.removeClass("btn-info")
	.addClass("btn-default").click(function(){
		$("input").css({
			"height":"auto",
			"padding":"10px",
			"opacity":"1"
		}).val("");
	});
	*/
	$('button[type="submit"]').hide();
	$( ".inner" ).append( "<a href='/home' class='btn btn-info btn-block'> continue</a>" );
            
	//show avatar
	$(".avatar").css({
		"background-image": "url('images/me.jpg')"
	});
}

function faillogin(msg){
	$("#output").removeClass(' alert alert-success');
	$("#output").addClass("alert alert-danger animated fadeInUp").html(msg);
}

$(function(){
	var textfield = $("input[name=username]");
	
	console.log(textfield.val());
	$('button[type="submit"]').click(function(e) {
		e.preventDefault();
		//little validation just to check username
		if (textfield.val() != "") {
			var jqxhr = $.post( "/login", $( "#loginform" ).serialize(),function(data) {
				console.log(data);
				if(data.login == "success") {
					successlogin();
				} else {
					faillogin("username password incorrect ")
				}
				
			})
			//$("body").scrollTo("#output");
			
		} else {
			//remove success mesage replaced with error message
			faillogin("sorry enter a username ")
		}

	});
	
	
	
});