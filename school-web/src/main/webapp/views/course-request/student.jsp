<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="<c:url value="/resources/css/course.css" />"
	rel="stylesheet">
<div class="text">
	<p>
		<button type="button" class="btn btn-default">Request new</button>
		<button type="button" class="btn btn-default">Leave course</button>
	</p>

	<table class="table table-hover">
		<thead>
			<tr>
				<th><input type="checkbox" id="select-all"></th>
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
					<td><input type="checkbox"></td>
					<td>${element.courseName}</td>
					<td>${element.courseYear}</td>
					<td>${element.members}</td>
					<td>${element.dateOfRequest}</td>
					<td>${element.active}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />">
	
</script>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/course-request.js" />"
	type="text/javascript"></script>