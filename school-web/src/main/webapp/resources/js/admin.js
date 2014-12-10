$(document).ready(function() {
	
	$(".admin_buttons p").click(function() {
		var current_profile_page = $("#admin_page_container").val();
		$("." + current_profile_page).hide();
		current_profile_page = $(this).attr("id");
		$("." + current_profile_page).show();
		$("#admin_page_container").val(current_profile_page);
	});
	$(".admin_role_confirmation").click(function() {
		var role_request_id = $(this).attr("id");
		
		$.ajax({
			type : "GET",
			url : "role_confirmation",
			data : "id=" + role_request_id,
			headers: {
		        Accept : "text/plain; charset=utf-8",
		        "Content-Type": "text/plain; charset=utf-8"
		    },
			async : false,
			success : function(response) {
				$("#admin_role_confirmation_container").html(response);
			},
			error : function(e) {
				alert('Internal Server Error');
			}
		});
		$("#roleConfirmationButton").click();
	});
//	$("#admin_role_confirmation_yes").click(function() {
//		
//	});

});

function setStudentNumber(id){
	  $("#studentNumber").val(id);
}
function addRole(){
	var role_request_id = $("#role_request_id").val();
	var role_request_name = $("#role_request_name").val();
	var student_id = $("#studentNumber").val();
	if(student_id == 0 && role_request_name == 'ROLE_PARENT'){
			$("#forgotten_chield").show();
	}
	else {
		$("#forgotten_chield").hide();
		$.ajax({

			type : "GET",
			url : "confirm_role",
			data : "roleRequestId=" + role_request_id + "&studentId=" + student_id,
			dataType : 'json',
			contentType : 'application/json',
			mimeType : 'application/json',
			async : false,
			success : function(response) {
				if (response == 1) {
					$("#roleConfirmationSuccesButton").click();
				} else{
					alert('Internal server error');
				}

			},
			error : function(e) {
				alert('Internal server error');
			}
		});
	}
	
}