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
	
	 $(".profile_modal").click(function(){
		  var id = $(this).attr("id");
		  $.ajax({
				type : "GET",
				url : "profile/information",
				data : "id=" + id,
				headers: {
			        Accept : "text/plain; charset=utf-8",
			        "Content-Type": "text/plain; charset=utf-8"
			    },
				async : false,
				success : function(response) {
					$("#profile_modal_content").html(response);
					$("#profileModalButton").click();
				},
				error : function(e) {
					alert('Internal Server Error');
				}
			});
		  });
	  
	$(".chield_and_parent_container td").css("cursor", "pointer");

	$(".uploadButton").click(function() {
		if ($("#upload_image_form").valid()) {
			$("#uploadButton").click();
//			var upload_image = $("#upload_image").val();
//			var $form = $('#upload_image_form');
//            fd = new FormData($form[0]);
//            
//			$.ajax({
//			url : "profile/upload_avatar",
//			type : "POST",
//			processData: false,
//            contentType: false,
//            data: fd,
//            dataType: "json",
//			success : function(responce) {
//				if (responce.valueOf() == 1) {
//					alert(fd);
//				}else{
//					alert("false");
//				}
//			},
//			error : function() {
//				alert('Internal server error');
//			}
//		});

		}
	});

});