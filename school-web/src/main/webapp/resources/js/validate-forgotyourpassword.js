$(document).ready(function() {

	var root_action = $("#root_action").val();

	$.validator.addMethod("existingEmail", function(value, element) {
		var result = false;
		$.ajax({
			type : "GET",
			url : root_action+"email/check",
			data : "email=" + value,
			dataType : 'json',
			contentType : 'application/json',
			mimeType : 'application/json',
			async : false,
			success : function(response) {
				if (response == 1) {
					result = false;
				} else {
					result = true;
				}

			},
			error : function(e) {
				alert('Internal server error');
			}
		});
		return result;
	}, "Email doesn't exist!");

	$('#forgot_form').validate({
		rules : {
			
			email : {
				required : true,
				email : true,
				existingEmail : true
			},
			questionAnsver : {
				required : true,
				minlength : 4,
				maxlength : 15
			},

		},
		messages : {
			email : {
				required : "Please enter email!",
				email : "This is not a valid email!",
			},
			questionAnsver : {
				required : "Please enter ansver!",
				minlength : "Too weak ansver!",
				maxlength : "Too long ansver!",
			},
		},
		success : function(element) {
			element.addClass('valid');
		}
	});

	$("#forgot_button").click(function() {
		if ($("#forgot_form").valid()) {
			var email = $("#forgot_email").val();
			var questionNumber = $("#forgotQuestionNumber").val();
			var questionAnsver = $("#forgotQuestionAnsver").val();
			var json = {
					"id" : 0,
					"registrationCode" : 0,
					"question" : questionNumber,
					"answer" : questionAnsver,
					"user" : {
						"id" : 0,
						"email" : email,
						"password" : "",
						"firstName" : "",
						"lastName" : "",
						"registration" : 0,
						"confirmed" : false,
						"roles" : []
					
				}
			}
			$.ajax({
				url : root_action+'forgotpassword',
				type : "POST",
				data : JSON.stringify(json),
				beforeSend : function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type", "application/json");
				},
				success : function(responce) {
					if (responce.valueOf() == 1) {
						$("#forgotAPasswordButtonSucces").click();
					} else {
						$("#forgotAPasswordButtonFailure").click();
					}
				},
				error : function() {
					alert('Internal server error');
				}
			});

		}
	});

});