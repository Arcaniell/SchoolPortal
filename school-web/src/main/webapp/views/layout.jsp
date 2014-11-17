<%@ page language="java" contentType="text/html; charset=UTF8"
	pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page session="false"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><tiles:getAsString name="title" /></title>
<!-- OUR LOCAL CSS-->
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/home.css" />" rel="stylesheet">
<!-- BOOTSTRAP -->
<link
	href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" />"
	rel="stylesheet">
<link
	href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap-theme.min.css" />"
	rel="stylesheet">
<!-- JQUERY -->
<script type="text/javascript"
	src="<c:url value="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js" />"></script>
<script type="text/javascript"
	src="http://jqueryvalidation.org/files/dist/jquery.validate.min.js"></script>

<!-- BOOTSTRAP JS -->
<script type="text/javascript"
	src="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js" />"></script>
<!-- OUR LOCAL JS -->
<script type="text/javascript" src="<c:url value="/resources/js/home.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/validate-registration.js" />"></script>
<!-- DATAPICKER -->
<link
	href="<c:url value="https://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css" />"
	rel="stylesheet">
</head>
<body>

	<div class="header">
		<tiles:insertAttribute name="header" />
	</div>
	<div class="sidebar">
		<tiles:insertAttribute name="sidebar" />
	</div>
	<div class="content">
		<tiles:insertAttribute name="main_content" />
	</div>
</body>
</html>
