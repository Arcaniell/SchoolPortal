<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/course-request.css" />"
	rel="stylesheet">


<!-- COURSE REQUEST MODAL -->
<div class="modal fade course_request_modal" tabindex="-1" role="dialog"
	aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-hidden="true">×</button>
				<h3 class="modal-title"><spring:message code="course.request.modal.title" /></h3>
			</div>
			<form action="course-request-manage-group" method="post">
				<input id="exportedVal" name="exportedVal" type="hidden" value="" />
				<div class="modal-body">
					<p><spring:message code="course.request.modal.message" /></p>
					<button name="groupChange" value="approve" type="submit"
						class="btn btn-default"><spring:message code="course.request.modal.approve" /></button>
					<button name="groupChange" value="deny" type="submit"
						class="btn btn-default"><spring:message code="course.request.modal.deny" /></button>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- COURSE REQUEST MODAL -->
<!-- TABLE -->
<div align="left" class="text">
	<table class="table table-hover">
		<thead>
			<tr>
				<th><spring:message code="course.table.Name" /></th>
				<th><spring:message code="course.table.Year" /></th>
				<th><spring:message code="course.request.members" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requests}" var="request">
				<tr>
					<td><a data-value="${request.id}" type="button"
						class="requests" data-toggle="modal"
						data-target=".course_request_modal">${request.name}</a></td>
					<td>${request.year}</td>
					<td>${request.size}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<!-- TABLE -->
<script
	src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js" />">
	
</script>
<script src="<c:url value="/resources/js/course-request.js" />"
	type="text/javascript"></script>
