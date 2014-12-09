<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/salary.css" />"
	rel="stylesheet">
<div align="center" class="text">

	<form method="POST" action="history">
		<p>
		<h3>
			<spring:message code="salary.period" />
		</h3>
		<spring:message code="salary.date.from" />
		<input name="dateFrom" value="${dateFrom}" type="text"
			id="dateFrom">
		<spring:message code="salary.date.until" />
		<input name="dateUntil" value="${dateUntil}" type="text"
			id="dateUntil">
		<button type="submit" class="btn btn-default">
			<spring:message code="salary.show" />
		</button>
	</form>
	<br>
	<table class="table table-hover">
		<thead>
			<tr>
				<th><spring:message code="salary.date" /></th>
				<th><spring:message code="salary.teacherpay" /></th>
				<th><spring:message code="salary.hours" /></th>
				<th><spring:message code="salary.additional" /></th>
				<th><spring:message code="salary.sum" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${salaries}" var="element">
				<tr>
					<td>${element.issueDate}</td>
					<td>${element.salary}</td>
					<td>${element.hours}</td>
					<td>${element.additional}</td>
					<td>${element.sum}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />">
	
</script>

<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/salary.js" />"
	type="text/javascript"></script>