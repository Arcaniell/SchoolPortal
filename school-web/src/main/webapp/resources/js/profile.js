$(document).ready(function() {
	$(".profile_buttons p").click(function() {
		var current_profile_page = $("#profile_page_container").val();
		$("." + current_profile_page).hide();
		current_profile_page = $(this).attr("id");
		$("." + current_profile_page).show();
		$("#profile_page_container").val(current_profile_page);
	});

	$('#upload_image_form').validate({
		rules : {

			file : {
				required : true,
			},
		},
		messages : {
			file : {
				required : "Please select image!",
			},
		},
		success : function(element) {
			element.addClass('valid');
		}
	});
	  
	$(".profile_modal").css("cursor", "pointer");
	$(".profile_modal").css("text-decoration", "underline");
	$(".profile_modal").css("text-decoration-color", "blue");

	$(".uploadButton").click(function() {
		if ($("#upload_image_form").valid()) {
			$("#uploadButton").click();
		}
	});

});