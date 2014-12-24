$(document).ready(function() {
	$(".teacher-name").click(function() {
		var id = $(this).attr("id");
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
			error : function(e) {
				alert('Internal Server Error');
			}
		});
	});
	$(".teacher-name").css("cursor", "pointer");
	$(".teacher-name").css("text-decoration", "underline");
});

$(function() {
	$("#dateFrom").datepicker({
		changeMonth : true,
		numberOfMonths : 1,
		onClose : function(selectedDate) {
			$("#dateUntil").datepicker("option", "minDate", selectedDate);
		}
	});
	$("#dateUntil").datepicker({
		changeMonth : true,
		numberOfMonths : 1,
		onClose : function(selectedDate) {
			$("#dateFrom").datepicker("option", "maxDate", selectedDate);
		}
	});
});

$("a.my-tool-tip").tooltip();

$('#target').scroll(function() {
});

var check = $(".confirmpayroll").attr("id");
if (check=="true") {
	$(".confirmpayroll").prop('disabled', true);
}


var inputs = document.getElementsByName("inputArray");
for (var int = 0; int < inputs.length; int++) {
inputs[int].addEventListener('change', function(e) {
	
	var num = parseInt(this.value, 10), min = -2000, max = 5000;
	if (num < min) {
		this.value = min;
	}
	if (num > max) {
		this.value = max;
	}
	if (isNaN(num)) {
		this.value = "";
		return;
	}
})};