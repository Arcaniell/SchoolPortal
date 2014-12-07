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