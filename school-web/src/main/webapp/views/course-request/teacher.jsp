<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/course-request.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/sortable-theme-minimal.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/base-pagination.css" />"
	rel="stylesheet">
<h3><spring:message code="course.request.new.modal.header" /></h3>
<c:if test="${fn:length(requests) == 0}">
	<h5 id="empty"><spring:message code="course.request.new.modal.no.requests" /></h5>
</c:if>
<c:if test="${fn:length(requests) > 0}">
	<form action="course-request-manage-group" method="post">
		<!-- REMOVE GROUP MODAL -->
		<div class="modal fade deny_request_modal" tabindex="-1" role="dialog"
			aria-labelledby="mySmallModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h3 class="modal-title"><spring:message code="course.request.new.modal.delete" /></h3>
					</div>
					<div class="modal-body button_body">
						<button name="yes" type="submit" value="deny" class="btn btn-info">
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
		<!-- REMOVE COURSE REQUEST MODAL -->
		<!-- CREATE GROUP MODAL -->
		<div class="modal fade approve_request_modal" tabindex="-1"
			role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h3 class="modal-title"><spring:message code="course.request.new.modal.create" /></h3>
					</div>
					<div class="modal-body button_body">
						<button name="yes" type="submit" value="approve"
							class="btn btn-info">
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
		<!-- CREATE GROUP MODAL -->
		<!-- TABLE -->


		<button type="button" class="btn btn-sample" data-toggle="modal"
			data-target=".approve_request_modal"><spring:message code="course.request.new.modal.approve" /></button>
		<button type="button" class="btn btn-sample" data-toggle="modal"
			data-target=".deny_request_modal"><spring:message code="course.request.new.modal.deny" /></button>
		<table
			class="table table-hover default_table sortable-theme-bootstrap paginated"
			data-sortable>
			<thead>
				<tr>
					<th><input name="checkboxName"
						value="justSomeLongMockValueForFormProcessing" type="checkbox"
						id="select-all"></th>
					<th><spring:message code="course.table.Name" /></th>
					<th><spring:message code="course.table.Year" /></th>
					<th><spring:message code="course.request.members" /></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requests}" var="request">
					<tr>
						<td><input name="checkboxName" value="${request.id}"
							type="checkbox"></td>
						<td>${request.name}</td>
						<td>${request.year}</td>
						<td>${request.size}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- Pagination footer -->
	</form>
	<div class="context-footer">
		<select class="form-control row_count">
			<option value="10">10</option>
			<option value="20">20</option>
			<option value="30">30</option>
			<option value="50">50</option>
		</select>
		<div class="pages"></div>
	</div>
</c:if>
<!-- Pagination footer -->
<!-- TABLE -->

<script src="<c:url value="/resources/js/course-request.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/utils/sortable.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/utils/pagination.js" />"
	type="text/javascript"></script>
