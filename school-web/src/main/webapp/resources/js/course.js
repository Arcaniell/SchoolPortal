$(function() {
	$(".datepicker").datepicker();
});
$("select[name='add_value']").change(function() {
	if (this.value == "YES") {
		$(".hidden_for_default_group").fadeIn();
	} else {
		$(".hidden_for_default_group").fadeOut();
	}
});
function submit(){
	var input = $("<input>").attr("type", "hidden").attr("name", "submit_button").val("create");
	$("#manage").append($(input));
	document.getElementById("manage").submit();
}
$(".submit").click(function(){
	if($("input[name='name_value']").val().length>1){
		submit();
	}else{
		alert("wrong name");
	}
	
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