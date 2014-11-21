$(function() {
	$(".datepicker").datepicker();
});

$(".addMark").click(function() {
	$("#dateAndStudent").val($(this).data('value'));
	console.log(this);
	console.log(event.target);
});

//$(function() {
//	$("#getGroupInfo").val($("#groupInfo").data('value'))
//});
// $("#submitMark").click(function() {
//
// $(function() {
// var mark = $('markSelect').val();
// var scheduleAndStudent = $('studentAndSchedule').val();
// var json = {
// "mark" : mark,
// "studentAndSchedule" : studentAndSchedule
// };
// $.ajax({
// url : 'journal-group-marks-add-mark',
// type : 'POST',
// dataType : 'json',
// data : JSON.stringify(json.prototype),
//
// });
// });
//
// var id = '#';
// var some = "";
// $(some).val(('#submitMark').data('value'));
//
// $(id + some).val($('#markSelect').data('value'));
// console.log(this);
// console.log(event.target);
// });
