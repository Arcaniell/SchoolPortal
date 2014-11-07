<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div align="center" class="text">

	<h2>Choose the period</h2>

	<p>
		From: <input type="text" class="datepicker"> Till: <input
			type="text" class="datepicker">
		<button type="button" class="btn btn-default">Submit</button>
	</p>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Course name</th>
				<th>Year</th>
				<th>Mandatory</th>
				<th>Start date</th>
				<th>End date</th>
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
<script	src="<c:url value="https://code.jquery.com/ui/1.11.2/jquery-ui.js" />"></script>
<script src="<c:url value="/resources/js/course.js" />"
	type="text/javascript"></script>