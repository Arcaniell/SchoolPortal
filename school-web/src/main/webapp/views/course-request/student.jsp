<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
					<h3 class="modal-title">Course request</h3>
				</div>
				<form action="course-request/request" method="post">
					<div class="modal-body">
						<select name="courseId" class="selectpicker">
							<c:forEach items="${haveCourses}" var="crs">
								<option value="${crs.id}">${crs.courseName}</option>
							</c:forEach>
						</select>
					</div>
					<div class="modal-footer">
						<button name="courserequest" type="submit" class="btn btn-default">
							Request for a new course</button>
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
						<h3 class="modal-title">Are you sure want to leave this
							course/courses?</h3>
					</div>
					<div class="modal-body">

						<button name="yes" type="submit" class="btn btn-default">
							Yes</button>
						<button name="no" type="button" data-dismiss="modal"
							class="btn btn-default">No</button>

					</div>
				</div>
			</div>
		</div>
		<!-- COURSE DELETE MODAL -->
		<p>
			<button type="button" class="btn btn-default" data-toggle="modal"
				data-target=".course_request_modal">Request new</button>
			<button type="button" class="btn btn-default" data-toggle="modal"
				data-target=".course_delete_modal">Leave course</button>
		</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th><input value="justSomeLongMockValueForFormProcessing"
						type="checkbox" id="select-all"></th>
					<th>Course</th>
					<th>Year</th>
					<th>Members</th>
					<th>Date of request</th>
					<th>Status</th>
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
						<td>${element.active}</td>

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