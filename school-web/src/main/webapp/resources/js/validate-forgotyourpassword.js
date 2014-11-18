$(document).ready(function() {

	$.validator.addMethod("existingEmail", function(value, element) {
		var result = false;
		$.ajax({
			type : "GET",
			url : "email/check",
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
	}, "Email doesn't exist! Please, enter correct email!");

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
			/////////////////////////////////////////////
			var firstname = $("#firstname").val();
			var lastname = $("#lastname").val();
			var email = $("#email").val();
			var password = $("#createapassword").val();
			var sex = $("input:radio[name=sex]:checked").val();
			var role = $("input:radio[name=role]:checked").val();
			var questionNumber = $("#questionNumber").val();
			var questionAnsver = $("#questionAnsver").val();

			var json = {
				"user" : {
					"id" : 0,
					"email" : email,
					"password" : password,
					"firstName" : firstname,
					"lastName" : lastname,
					"registration" : 0,
					"confirmed" : false,
					"roles" : [ {
						"id" : role,
						"name" : ""
					} ]
				},
				"registrationData" : {
					"id" : 0,
					"registrationCode" : 0,
					"question" : questionNumber,
					"answer" : questionAnsver,
					"user" : null
				}
			}
			$.ajax({
				url : 'registration',
				type : "POST",
				data : JSON.stringify(json),
				beforeSend : function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type", "application/json");
				},
				success : function(responce) {
					if (responce.valueOf() == 1) {
						$("#signUpSuccesButton").click();
					} else {
						alert("Error - your account is not created!")
					}
				},
				error : function() {
					alert('Internal server error');
				}
			});

		}
	});

});