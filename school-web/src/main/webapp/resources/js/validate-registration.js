$(document).ready(function() {

	var root_action = $("#root_action").val();

	$.validator.addMethod("regexName", function(value, element) {
		return /^[a-zA-Zа-яА-Я]+$/.test(value);
	}, "Only letters are allowed!");

	$.validator.addMethod("birhDay", function(value, element) {
		var month_days = {
			1 : 31,
			2 : 28,
			3 : 31,
			4 : 30,
			5 : 31,
			6 : 30,
			7 : 31,
			8 : 31,
			9 : 30,
			10 : 31,
			11 : 30,
			12 : 31
		};
		var month_day = $("input[name = month]").val();
		if (month_day == '' || month_days[month_day] < value)
			return false;
		else
			return true;
	}, "Incorrect!");
	$.validator.addMethod("birhMonth", function(value, element) {
		if (value < 1 || value > 12)
			return false;
		else
			return true;
	}, "Incorrect!");
	$.validator.addMethod("birhYear", function(value, element) {
		if (value < 1930 || value > 2010)
			return false;
		else
			return true;
	}, "Incorrect!");

	$.validator.addMethod("uniqueEmail", function(value, element) {
		var result = false;
		$.ajax({
			type : "GET",
			url : root_action + "email/check",
			data : "email=" + value,
			dataType : 'json',
			contentType : 'application/json',
			mimeType : 'application/json',
			async : false,
			success : function(response) {
				if (response == 0) {
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
	}, "Email is Already Taken!");

	$('#signup_from').validate({
		rules : {
			firstName : {
				required : true,
				minlength : 2,
				maxlength : 15,
				regexName : true
			},
			lastName : {
				required : true,
				minlength : 2,
				maxlength : 15,
				regexName : true
			},
			email : {
				required : true,
				email : true,
				uniqueEmail : true
			},
			password : {
				required : true,
				minlength : 8,
				maxlength : 15
			},
			password2 : {
				required : true,
				minlength : 8,
				maxlength : 15
			},
			day : {
				required : true,
				birhDay : true
			},
			month : {
				required : true,
				birhMonth : true
			},
			year : {
				required : true,
				birhYear : true
			},
			questionAnsver : {
				required : true,
				minlength : 4,
				maxlength : 15
			},

		},
		messages : {
			firstname : {
				required : "Please enter first name!",
			},
			lastname : {
				required : "Please enter last name!",
			},
			email : {
				required : "Please enter email!",
				email : "This is not a valid email!",
			},
			password : {
				required : "Please enter password!",
				minlength : "Too weak password!",
				maxlength : "Too long password!",
			},
			password2 : {
				required : "Please enter password!",
				minlength : "Too weak password!",
				maxlength : "Too long password!",
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

	$("#signup_button").click(function() {
		var groupNumber = $("#groupNumber").val();
		var role = $("input:radio[name=role]:checked").val();
		if(groupNumber == '' || role != 3)$("#forGroupNumber").show();
		else{
			$("#forGroupNumber").hide();
		if ($("#signup_from").valid()) {
			var firstname = $("#firstname").val();
			var lastname = $("#lastname").val();
			var email = $("#email").val();
			var password = $("#createapassword").val();
			var sex = $("input:radio[name=sex]:checked").val();
			var role = $("input:radio[name=role]:checked").val();
			var questionNumber = $("#questionNumber").val();
			var questionAnsver = $("#questionAnsver").val();

			var day = $("input[name=day]").val();
			var month = $("input[name=month]").val();
			var year = $("input[name=year]").val();
			var birthday = year + "-" + month + "-" + day;
			
			var json = {
				"registrationData" : {
					"id" : 0,
					"registrationCode" : 0,
					"question" : questionNumber,
					"answer" : questionAnsver,
					"user" : {
						"id" : 0,
						"email" : email,
						"password" : password,
						"firstName" : firstname,
						"lastName" : lastname,
						"registration" : 0,
						"sex" : sex,
						"confirmed" : false,
						"birthday" : birthday,
						"roles" : [ {
							"id" : role,
							"name" : ""
						} ]
					}
				},
				"groupId" : groupNumber

			}

			$.ajax({
				url : root_action + 'registration',
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
						$("#signUpFailureButton").click();
					}
				},
				error : function() {
					alert('Internal server error');
				}
			});

		}
	}
	});

});