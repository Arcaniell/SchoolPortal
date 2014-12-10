<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link href="<c:url value="/resources/css/salary.css" />"
	rel="stylesheet">

<div align="center" class="text">
	<h3>
		<spring:message code="salary.success" />
	</h3>
	<div class="message">
	<br><br><br><br><br><br>
		<h4>
		<spring:message code="salary.successmessage" />
	</h4></div>
	<br><br><br><br>
	<a class="btn btn-default" href="<c:url value="payroll"/>"><spring:message
			code="salary.back" /></a>
</div>