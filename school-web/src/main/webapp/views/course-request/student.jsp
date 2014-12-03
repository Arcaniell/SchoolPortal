<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/course.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap-select.min.css" />"
	rel="stylesheet">
<div class="text">
	<!-- COURSE REQUEST MODAL -->
	<div class="modal fade course_request_modal" tabindex="-1"
		role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">×</button>
					<h3 class="modal-title">
						<spring:message code="course.request" />
					</h3>
				</div>
				<form action="course-request/request" method="post">
					<div class="modal-body">
						<p>
							<spring:message code="course.request.student.msg" />
						</p>
						<select name="courseId" class="selectpicker">
							<c:forEach items="${haveCourses}" var="crs">
								<option value="${crs.id}">${crs.courseName}</option>
							</c:forEach>
						</select>
					</div>
					<div class="modal-footer">
						<button name="courserequest" type="submit" class="btn btn-default">
							<spring:message code="course.request.btn.request.for.new" />
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- COURSE REQUEST MODAL -->
	<!-- COURSE DELETE MODAL -->
	<form action="course-request/delete" method="post">
		<div class="modal fade course_delete_modal" tabindex="-1"
			role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">×</button>
						<h3 class="modal-title">
							<spring:message code="course.request.delete.msg" />
						</h3>
					</div>
					<div class="modal-body">
						<p>
							<button name="yes" type="submit" class="btn btn-default">
								<spring:message code="course.request.btn.yes" />
							</button>
							<button name="no" type="button" data-dismiss="modal"
								class="btn btn-default">
								<spring:message code="course.request.btn.no" />
							</button>
						</p>
					</div>
				</div>
			</div>
		</div>
		<!-- COURSE DELETE MODAL -->
		<p>
			<button type="button" class="btn btn-default" data-toggle="modal"
				data-target=".course_request_modal">
				<spring:message code="course.request.btn.request.new" />
			</button>
			<c:if test="${fn:length(courseList) > 0}">
				<button type="button" class="btn btn-default" data-toggle="modal"
					data-target=".course_delete_modal">
					<spring:message code="course.request.btn.delete.request" />
				</button>
			</c:if>
		</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th><input value="justSomeLongMockValueForFormProcessing"
						type="checkbox" id="select-all"></th>
					<th><spring:message code="course.table.Name" /></th>
					<th><spring:message code="course.table.Year" /></th>
					<th><spring:message code="course.request.members" /></th>
					<th><spring:message code="course.request.date" /></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${courseList}" var="element">
					<tr>
						<td><input name="checkboxName" value="${element.id}"
							type="checkbox"></td>
						<td>${element.courseName}</td>
						<td>${element.courseYear}</td>
						<td>${element.members}</td>
						<td>${element.dateOfRequest}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
</div>
<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />">
	
</script>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/course-request.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/bootstrap-select.min.js" />"
	type="text/javascript"></script>