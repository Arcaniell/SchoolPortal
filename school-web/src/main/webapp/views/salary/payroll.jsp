<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/salary.css" />"
	rel="stylesheet">
<div align="center" class="text">
	<h3><spring:message code="salary.payrolltitle" /></h3>
	<form method="post" action="payrollConfirm">
	<div id="target" class="scrolling">
		<table class="table table-hover default_table">
			<thead>
				<tr>
					<th><spring:message code="salary.name" /></th>
					<th><spring:message code="salary.rate" /></th>
					<th><spring:message code="salary.teacherpay" /></th>
					<th><spring:message code="salary.hours" /></th>
					<th><spring:message code="salary.additional" /></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${payrolls}" var="element">
					<tr>
						<td>${element.teacherName}</td>
						<td>${element.teacherRate}</td>
						<td>${element.salary}</td>
						<td>${element.hours}</td>
						<td><input name="inputArray" type="text" id="txtValue" value="0"></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		<br>
		<button type="submit" class="btn btn-default">
			<spring:message code="salary.payrollsubmit" />
		</button>
	</form>
</div>

<script src="<c:url value="https://code.jquery.com/jquery-1.10.2.js" />">
	
</script>
<script src="<c:url value="/resources/js/salary.js" />"
	type="text/javascript"></script>
<script
	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>