<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/group-edit.css" />"
	rel="stylesheet">
	<input class="hiddenGroup" type ="hidden" value="${groupId}">
	<h3>Now you are editing <span class="className"> </span></h3>
<table class="custom_table">
	<tr>
		<td>Start date:</td>
		<td><input name="dateFrom" type="text" class="datepicker"></td>
		<td>Teacher name:</td>
		<td><select class="form-control teachers"></select></td>
	</tr>
	<tr>
		<td>End date:</td>
		<td><input name="dateTill" type="text" class="datepicker"></td>
		<td></td>
		<td>
			<button type="button"
				class="btn btn-default main_submit">Submit</button>
		</td>
	</tr>
</table>

<div class="left">
	<button style="width: 100%;" type="button"
		class="btn btn-default student_remove">Remove student -&gt;</button>
	<table class="table table-hover">
		<thead>
			<tr>
				<th><input type="checkbox" id="select_for_remove"></th>
				<th>Name</th>
				<th>Approx year</th>
			</tr>
		</thead>
		<tbody class="group_stuff">
		</tbody>
	</table>
</div>
<div class="right">
	<button style="width: 100%;" type="button"
		class="btn btn-default student_add">&lt;- Add student</button>
	<table class="table table-hover">
		<thead>
			<tr>
				<th><input type="checkbox" id="select_for_add"></th>
				<th>Name</th>
				<th>Approx year</th>
			</tr>
		</thead>
		<tbody class="other_stuff">
		</tbody>
	</table>
</div>
<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />">
	
</script>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/group-edit.js" />"
	type="text/javascript"></script>
