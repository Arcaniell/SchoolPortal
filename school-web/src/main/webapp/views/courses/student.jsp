<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/course.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/sortable-theme-minimal.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/base-pagination.css" />"
	rel="stylesheet">

<div align="center" class="text">
	<h3>All the courses which students studying for some period.</h3>
	<form method="POST" action="student-courses">
		<p>
			<spring:message code="course.data" />
			<spring:message code="course.data.from" />
			<input name="dateFrom" value="${dateFrom}" type="text"
				class="datepicker">
			<spring:message code="course.data.till" />
			<input name="dateTill" value="${dateTill}" type="text"
				class="datepicker">
			<button type="submit" class="btn btn-sample">
				<spring:message code="course.btn.show" />
			</button>
		</p>


	</form>
	<table
		class="table table-hover default_table sortable-theme-bootstrap paginated"
		data-sortable>
		<thead>
			<tr>
				<th><spring:message code="course.table.Name" /></th>
				<th><spring:message code="course.table.Year" /></th>
				<th><spring:message code="course.table.Additional" /></th>
				<th><spring:message code="course.table.start" /></th>
				<th><spring:message code="course.table.fin" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${courses}" var="element">
				<tr>
					<td>${element.name}</td>
					<td>${element.year}</td>
					<td>${element.additional}</td>
					<td>${element.from}</td>
					<td>${element.till}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
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
</div>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/course.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/utils/sortable.js" />"
	type="text/javascript"></script>
<script src="<c:url value="/resources/js/utils/pagination.js" />"
	type="text/javascript"></script>