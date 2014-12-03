<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href="<c:url value="/resources/css/group.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/sortable-theme-minimal.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/base-pagination.css" />" rel="stylesheet">
<!-- ADD GROUP MODAL -->
<div class="modal fade add_group_modal" tabindex="-1" role="dialog"
	aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 class="modal-title">Group create</h3>
				<!-- <h4>Please choose characteristics of new group</h4> -->
			</div>
			<form action="group-create" method="post">
				<div class="modal-body">
					<table class="group_modal_window">
						<tr class="addition_name_input">
							<th colspan="2">Available additional groups</th>
						</tr>
						<tr class="addition_name_input">
							<td colspan="2"><select name="course_id"
								class="form-control">
							</select></td>
						</tr>
						<tr>
							<th class="th_name">Year</th>
							<th class="th_symbol">Symbol</th>
						</tr>
						<tr>
							<td><select name="year_value" class="form-control">
									<c:forEach items="${yearList}" var="symbol">
										<option>${symbol.id}</option>
									</c:forEach>
							</select></td>
							<td><select name="symbol_value" class="form-control">
									<c:forEach items="${symbolList}" var="symbol">
										<option>${symbol.symbol}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<th colspan="2">Curator of the group</th>
						</tr>
						<tr>
							<td colspan="2"><select name="curator_id"
								class="form-control teachersSet">
									<c:forEach items="${notCurator}" var="nCur">
										<option value="${nCur.id}">${nCur.fullName}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td colspan="2"><input name="checkboxAdditionGroup"
								class="addition_course_checkbox" type="checkbox">
								Additional course </input></td>
						</tr>
					</table>
					<button type="submit" class="btn btn-sample">Create</button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- ADD GROUP MODAL -->

<form action="group-remove" method="post">
	<!-- REMOVE GROUP MODAL -->
	<div class="modal fade group_delete_modal" tabindex="-1" role="dialog"
		aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 class="modal-title">
						Are you sure want to delete this <br>group/courses?
					</h3>
				</div>
				<div class="modal-body button_body">
					<button name="yes" type="submit" class="btn btn-danger">
						<spring:message code="course.request.btn.yes" />
					</button>
					<button name="no" type="button" data-dismiss="modal"
						class="btn btn-sample">
						<spring:message code="course.request.btn.no" />
					</button>
				</div>
			</div>
		</div>
	</div>
	<!-- REMOVE GROUP MODAL -->
	<h3>All school groups</h3>
	<button type="button" class="btn btn-sample" data-toggle="modal"
		data-target=".add_group_modal">Add group</button>
	<c:if test="${fn:length(groupList) > 0}">
		<button type="button" class="btn btn-sample real_dell_btn"
			data-toggle="modal" data-target=".group_delete_modal">Remove
			group</button>
		<button type="button" class="btn btn-sample remove_button">Edit
			group</button>
	</c:if>
	<table
		class="table table-hover default_table sortable-theme-bootstrap paginated"
		data-sortable>
		<thead>
			<tr>
				<th><input name="checkboxName"
					value="justSomeLongMockValueForFormProcessing" type="checkbox"
					id="select-all"></th>
				<th><spring:message code="groups.table.name" /></th>
				<th><spring:message code="course.table.Year" /></th>
				<th><spring:message code="course.table.Additional" /></th>
				<th><spring:message code="course.request.members" /></th>
				<th><spring:message code="groups.table.curator" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${groupList}" var="element">
				<tr>
					<td><input name="checkboxName" value="${element.id}"
						type="checkbox"></td>
					<td>${element.name}</td>
					<td>${element.year}</td>
					<td>${element.additional}</td>
					<td>${element.members}</td>
					<td>${element.teacher}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</form>
<!-- Pagination footer -->
<div class="context-footer">
	<select class="form-control row_count">
		<option value="10">10</option>
		<option value="20">20</option>
		<option value="30">30</option>
		<option value="50">50</option>
	</select>
	<div class="pages"></div>
</div>
<!-- Pagination footer -->
<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />">
	
</script>
<script src="<c:url value="/resources/js/group.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/utils/sortable.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/utils/pagination.js" />"
	type="text/javascript"></script>