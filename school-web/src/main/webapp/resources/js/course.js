$(function() {
	$("input[name='dateFrom']").datepicker(
			{
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 2,
				onClose : function(selectedDate) {
					$("input[name='dateTill']").datepicker("option", "minDate",
							selectedDate);
				}
			});
	$("input[name='dateTill']").datepicker(
			{
				defaultDate : "+1w",
				changeMonth : true,
				numberOfMonths : 2,
				onClose : function(selectedDate) {
					$("input[name='dateFrom']").datepicker("option", "maxDate",
							selectedDate);
				}
			});
});
$("select[name='add_value']").change(function() {
	if (this.value == "YES") {
		$(".hidden_for_default_group").fadeIn();
	} else {
		$(".hidden_for_default_group").fadeOut();
	}
});
function submit() {
	var input = $("<input>").attr("type", "hidden").attr("name",
			"submit_button").val("create");
	$("#manage").append($(input));
	document.getElementById("manage").submit();
}
$(".submit").click(
		function() {
			if ($("select[name='add_value']").val() == "YES"){
				if ($("input[name='name_value']").val().length > 1) {
					$(".name_error").hide();
					var price = $("input[name='price_value']").val();
					if($.isNumeric(price)){
						$(".price_error").hide();
					}else{
						$(".price_error").show();
						return;
					}
				}else{
					$(".name_error").show();
					return;
				}
				submit();
			}else{
				if ($("input[name='name_value']").val().length > 1) {
					$(".name_error").hide();
				}else{
					$(".name_error").show();
					return;
				}
				submit();
			}
			/*if ($("input[name='name_value']").val().length > 1) {
				$(".name_error").hide();
				var price = $("input[name='price_value']").val();
				if ($("select[name='add_value']").val() == "YES"
						&& $.isNumeric(price)) {
					$(".price_error").hide();
				} else {
					$(".price_error").show();
					return;
				}
				submit();
			} else {
				$(".name_error").show();
				return;
			}*/
		});
$(".anchor").click(function() {
	var id = $(this).data("value");
	$.ajax({
		type : "GET",
		url : "profile/information",
		data : "id=" + id,
		headers : {
			Accept : "text/plain; charset=utf-8",
			"Content-Type" : "text/plain; charset=utf-8"
		},
		async : false,
		success : function(response) {
			$("#profile_modal_content").html(response);
			$("#profileModalButton").click();
		},
		error : function() {
			alert('Internal Server Error');
		}
	});
});