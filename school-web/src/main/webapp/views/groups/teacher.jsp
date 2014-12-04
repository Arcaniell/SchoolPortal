<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/course.css" />"
	rel="stylesheet">
<div align="center" class="text">
	<h3>Groups where I am teaching</h3>
	<form method="POST" action="teacher-groups">
		<p>
			Period from: <input name="dateFrom" value="${dateFrom}" type="text"
				class="datepicker">
			<spring:message code="course.data.till" />
			<input name="dateTill" value="${dateTill}" type="text"
				class="datepicker">
			<button type="submit" class="btn btn-sample">
				<spring:message code="course.btn.show" />
			</button>
		</p>
	</form>
	<table class="table table-hover default_table">
		<thead>
			<tr>
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
					<td>${element.name}</td>
					<td>${element.year}</td>
					<td>${element.additional}</td>
					<td>${element.members}</td>
					<td>${element.teacher}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />">
	
</script>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/course.js" />"
	type="text/javascript"></script>