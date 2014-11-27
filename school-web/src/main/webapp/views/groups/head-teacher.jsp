<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<link href="<c:url value="/resources/css/group.css" />" rel="stylesheet">
<!-- ADD GROUP MODAL -->
<div class="modal fade add_group_modal" tabindex="-1" role="dialog"
	aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 class="modal-title">Group create</h3>
			</div>
			<form action="group-create" method="post">
				<div class="modal-body">
					<table class="group_modal_window">
						<tr class="addition_name_input">
							<th colspan="2">Name for additional group</th>
						</tr>
						<tr class="addition_name_input">
							<td colspan="2">
								<p>
									<input name="additional_group_name" type="text"
										class="form-control" placeholder="Group name">
								</p>
							</td>
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
							<td colspan="2"><select name="curatorId"
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
					<button type="submit" class="btn btn-default">Create</button>
				</div>
			</form>
		</div>
	</div>
</div>
<form action="group-remove" method="post">
	<!-- ADD GROUP MODAL -->
	<button type="button" class="btn btn-default" data-toggle="modal"
		data-target=".add_group_modal">Add group</button>
	<c:if test="${fn:length(groupList) > 0}">
		<button class="realy_remove_button btn btn-default" type="submit"
			>Remove group</button>
		<button type="button" class="btn btn-default remove_button">Edit
			group</button>
	</c:if>
	<table class="table table-hover">
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
<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />">
	
</script>
<script src="<c:url value="/resources/js/group.js" />"
	type="text/javascript"></script>
