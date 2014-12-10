<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/group-edit.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/sortable-theme-minimal.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/profile.css" />"
	rel="stylesheet">
<input class="hiddenGroup" type="hidden" value="${groupId}">
<div id="loading_modal" class="modal fade" role="dialog"
	aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div id="modal_id_spinner" class="modal-content">
			<h3><spring:message code="group.edit.text.loading" /></h3>
			<img class="spinner_gif" alt="Load gif"
				src="<c:url value="/resources/gif/spinner.gif" />">
		</div>
	</div>
</div>
<h3>
	<spring:message code="group.edit.text.edit" /><span class="className"> </span>
</h3>
<table class="custom_table">
	<tr>
		<td><spring:message code="group.edit.text.start" /></td>
		<td><input name="dateFrom" type="text" class="datepicker"></td>
		<td><spring:message code="group.edit.text.teacher" /></td>
		<td><select class="form-control teachers"></select></td>
	</tr>
	<tr>
		<td><spring:message code="group.edit.text.end" /></td>
		<td><input name="dateTill" type="text" class="datepicker"></td>
		<td></td>
		<td>
			<button type="button" class="btn btn-info main_submit"><spring:message code="group.edit.text.submit" /></button>
		</td>
	</tr>
</table>

<div class="left">
	<button style="width: 100%;" type="button"
		class="btn btn-sample student_remove"><spring:message code="group.edit.text.student" /></button>
	<table
		class="default_table table table-hover paginated_left sortable-theme-bootstrap"
		data-sortable>
		<thead>
			<tr>
				<th data-sortable="false"><input type="checkbox"
					id="select_for_remove"></th>
				<th><spring:message code="group.edit.text.name" /></th><jsp:include
					page="/views/profile/profile_information_runner.jsp" />

				<th><spring:message code="group.edit.text.birthday" /></th>
			</tr>
		</thead>
		<tbody class="group_stuff">
		</tbody>
	</table>
</div>
<div class="right">
	<button style="width: 100%;" type="button"
		class="btn btn-sample student_add"><spring:message code="group.edit.text.add.student" /></button>
	<table
		class="default_table table table-hover paginated_right sortable-theme-bootstrap"
		data-sortable>
		<thead>
			<tr>
				<th data-sortable="false"><input type="checkbox"
					id="select_for_add"></th>
				<th><spring:message code="group.edit.text.name" /></th>
				<th><spring:message code="group.edit.text.birthday" /></th>
			</tr>
		</thead>
		<tbody class="other_stuff">
		</tbody>
	</table>
</div>
<div class="edit-footer">
	<select class="form-control row_count">
		<option value="20">20</option>
		<option value="30">30</option>
		<option value="50">50</option>
	</select>

	<div class="left_pagination"></div>
	<div class="right_pagination"></div>

</div>
<jsp:include page="/views/profile/profile_information_runner.jsp" />
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/group-edit.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/utils/sortable.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="/resources/js/utils/pagination-multiply.js" />"
	type="text/javascript"></script>