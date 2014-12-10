<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<link href="<c:url value="/resources/css/salary.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/clock.css" />" rel="stylesheet">

<div align="center" class="text">
	<div class="container">
		<div class="clock">
			<div id="Date"></div>
			<ul>
				<li class="hhmmss" id="hours"></li>
				<li class="hhmmss" id="point">:</li>
				<li class="hhmmss" id="min"></li>
				<li class="hhmmss" id="point">:</li>
				<li class="hhmmss" id="sec"></li>
			</ul>
		</div>
	</div>
	<h3>
		<spring:message code="salary.month" />
	</h3>
	<table id="current" class="table table-hover default_table">
		<tbody>
			<tr>
				<th id="currenthead"><spring:message code="salary.nextdate" /></th>
				<td>${currentMonth.issueDate}</td>
			</tr>
			<tr>
				<th id="currenthead"><spring:message code="salary.hours" /></th>
				<td>${currentMonth.hours}</td>
			</tr>
			<tr>
				<th id="currenthead"><spring:message code="salary.salary" /></th>
				<td>${currentMonth.salary}</td>
			</tr>
		</tbody>
	</table>
	<br>
	<button class="btn btn-default" data-toggle="modal"
		data-target="#coursesrate">
		<spring:message code="salary.showcourses" />
	</button>
	<a class="btn btn-default" href="<c:url value="/history"/>"><spring:message
			code="salary.historybutton" /></a>
</div>

<jsp:include page="/views/salary/courses.jsp" />

<script src="<c:url value="/resources/js/clock.js" />"
	type="text/javascript"></script>