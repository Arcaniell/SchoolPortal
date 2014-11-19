$(document).ready(function() {

	var root_action = $("#root_action").val();
	
	$('#login_form').validate({
		rules : {

			j_username : {
				required : true,
			},

			j_password : {
				required : true,
			},
		},
		messages : {

			j_username : {
				required : "Please insert login.",
			},

			j_password : {
				required : "Please insert password.",
			},
		},
		
	});

	

});