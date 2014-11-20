<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/salary.css" />"
	rel="stylesheet">

<div align="center" class="text">
<h3><spring:message code="salary.month" /></h3>
	<table class="table table-hover">
		<tbody>
			<tr>
				<th><spring:message code="salary.date" /></th>
				<td>${currentMonth.issueDate}</td>
			</tr>
			<tr>
				<th><spring:message code="salary.hours" /></th>
				<td>${currentMonth.hours}</td>
			</tr>
			<tr>
				<th><spring:message code="salary.salary" /></th>
				<td>${currentMonth.balance}</td>
			</tr>
		</tbody>
	</table>
		<a class="btn btn-default" href="<c:url value="/history"/>"><spring:message
			code="salary.historybutton" /></a>
</div>