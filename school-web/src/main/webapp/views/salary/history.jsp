<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/salary.css" />"
	rel="stylesheet">
<div align="center" class="text">

	<button id="currentButton" data-toggle="modal"
			data-target="#month">
			<spring:message code="salary.currentbutton" />
		</button>
		
	<form method="POST" action="salary">
		<p>
		<h4> <spring:message code="salary.period" /> </h4>
			<spring:message code="salary.date.from" />
			<input name="dateFrom" value="${dateFrom}" type="text"
				class="datepicker">
			<spring:message code="salary.date.until" />
			<input name="dateTill" value="${dateUntil}" type="text"
				class="datepicker">
			<button type="submit" class="btn btn-default">
				<spring:message code="salary.show" />
			</button>
		</p>
	</form>
	<table class="table table-hover">
		<thead>
			<tr>
				<th><spring:message code="salary.date" /></th>
				<th><spring:message code="salary.hours" /></th>
				<th><spring:message code="salary.salary" /></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${salaries}" var="element">
				<tr>
					<td>${element.issueDate}</td>
					<td>${element.hours}</td>
					<td>${element.balance}</td>
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