<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div align="center" class="text">
	<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

	<h2>
		<spring:message code="course.data" />
	</h2>
	<p>
		<spring:message code="course.data.from" />
		<input type="text" class="datepicker">
		<spring:message code="course.data.till" />
		<input type="text" class="datepicker">
		<button type="button" class="btn btn-default">
			<spring:message code="course.btn.show" />
		</button>
	</p>
	<table class="table table-hover">
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
					<td>${element.courseName}</td>
					<td>${element.groupNumber}</td>
					<td>${element.additional}</td>
					<td>Sep 1</td>
					<td>Dec 27</td>
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